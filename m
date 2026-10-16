Received: from mta1.migadu.com (out-75.mta1.migadu.com [95.215.58.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1815A24C06A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145284; cv=none; b=K5iQ6YhITP4QMenvfFMQF6mHDYwd1sOS/j+lWAQeno/JbgUufJuSFE96MHuQVvMg1Jk6QBs31ofJaLeUODaaSx/AppzNpq+jCWSSNcqeKnmYrmYxZcWDWFLVz9lLypjrbJDtrUuNuV0NtkLiLsMug1Rq8wbWesJyCtN1/LTFjs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145284; c=relaxed/simple;
	bh=M5i4E8R+4zkQmXtJTPgvfcZ/9TP4y/h6sujbbR2qN60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rnxvAeZYqIg5OT71Lfb6J9WclhcYxXDbOn2PpLrcqNE5wu8o5NPcT912Nf4N8P1P62OWJ6HNCQUwUMPTr2MbU0auqkvptsJoV1Ovp8F6ezh1Qjcd/l+wcvz8yF97kkmKQBqyinq+uNbjxkZTEeUN2OXLsBUD3uf9ag+Anw8VCBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MQf7W0nF; arc=none smtp.client-ip=95.215.58.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MQf7W0nF"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M5i4E8R+4zkQmXtJTPgvfcZ/9TP4y/h6sujbbR2qN60=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792145280; v=1; x=1792750080;
 b=MQf7W0nFin7uRaO3zdWcEFEsObxHhp+gEpFeacB7wkDQiMVyxkendkpUTHkLYgapvuwq5Kvd
 DMSg9wQ6BA2SKFPVp7Z8X1Lu8XuB0/XI3jP676PA9jXxsJiC9z4KbK6YYdOcgc40Vpsk6i5a359
 hbID2qhZLdx4e5GCTjii7kn4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d2bfab94065a6938;
	Fri, 16 Oct 2026 10:07:59 +0000
X-Mizu-Trace-ID: d2bfab94065a6938
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 0/5] mm: hugetlb: add CMA support for PMD-sized page
Date: Fri, 16 Oct 2026 18:07:31 +0800
Message-ID: <cover.1792136742.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Qi Zheng <zhengqi.arch@bytedance.com>

Hi all,

Allocating PMD-sized HugeTLB pages at runtime can become slow or fail
as physical memory becomes fragmented. Reserving HugeTLB pages at boot
avoids this problem, but keeps unused pages unavailable to ordinary
allocations.

Live upgrades are one example: they need additional HugeTLB pages only
during the upgrade. HugeTLB already supports CMA for gigantic pages,
but reserving a CMA pool for 1 GiB pages can fail when physical KASLR
and other early reservations leave too few suitable 1 GiB-aligned
ranges. At runtime, 1 GiB allocations can also fail when pages cannot
be migrated out of a suitable contiguous range.

Extend CMA support to PMD-sized pages so their backing memory can be
reserved at boot while remaining usable for movable allocations until
needed. This relaxes the reservation alignment requirement and reduces
the contiguous range required per allocation.

The series adds an optional @<page-size> suffix to hugetlb_cma and a
separate PMD-sized pool. For example, on x86-64:

	hugetlb_cma=4G hugetlb_cma=1G@2M

This reserves 4G for the existing gigantic-page pool and 1G for the
PMD-sized pool. Existing unsuffixed parameters and gigantic-page pool
sharing are preserved. The new size follows the architecture's PMD
size rather than being fixed at 2M.

The preparatory patches introduce per-pool state and prevent recursive
CMA allocation during migration before enabling PMD-sized allocation.

Thanks,
Qi

Qi Zheng (5):
  mm: hugetlb: add explicit page size to hugetlb_cma
  mm: hugetlb: group CMA pool and reservation state
  mm: hugetlb: track CMA reservations by page order
  mm: hugetlb: avoid recursive CMA allocation during migration
  mm: hugetlb: enable CMA allocation for PMD-sized pages

 .../admin-guide/kernel-parameters.txt         |  39 ++-
 include/linux/hugetlb.h                       |   4 +-
 mm/hugetlb.c                                  |  80 +++--
 mm/hugetlb_cma.c                              | 328 ++++++++++++------
 mm/hugetlb_cma.h                              |  11 +-
 mm/mempolicy.c                                |   2 +-
 mm/migrate.c                                  |   3 +-
 7 files changed, 306 insertions(+), 161 deletions(-)


base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
-- 
2.54.0

