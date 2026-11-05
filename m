Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851686;
	b=kmMNyY6frVawAVh7VTuimKU6Eq+c5fdu0KwhOy3bPHmly9R+oxN4mQm/cOiCJeSWo5xY
	 8jHiCuWx8nE441tgG3xLNwza0bDQOmqrNivbvvxGStkaSmSp2a+5h9dZJ/XLkYunkP75n
	 f+rHieIjhdn35Mrr4vsYLighWOMZ2wYlNLp6O3+BQSA2NuSGoWa8hBNlJSSEn5ae7nd7X
	 xfY5dskXh4a66LtvhWgGfRS5pCAuZ5tcIkyfKQnwsb0ek1tQcJT/gPlzpVRhRDftG8N+g
	 /y2OFqa/Q2Xmnk7jza2SmjZpNZ76BEYHX3YZtMs2WzxlaJ+Irzvo34ulhODfkEoY7zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851686;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NDjRE08wBO6pV06Ou8hAMmC9xnZwvIAddVeS9T1njfA=;
	b=uP+bShLXIBarKwDgjpbBSELoId/GpbDsw4HdmPsPpDUIsXjJNYB9T3n8NQVv0wyF4cvR
	 xljkceBsEd8rn4jQOsiRTkU6VTpw7PDmYbthe8vUnB434tN+8OE/aDyyZBnJfNvEUfV+e
	 eYjwWYdZvh3/jffKfBhk+wxUvpSdv3N1NoFHws7LZVXmF20WTbtkAkDz5su4tSCOXWikM
	 R3IeBu+/JHzYHe92AYsUsPXeQ4sEK8KfbIisY6xeRakRPTY/PbU+4pC1zurIQJJZj9lOm
	 /aYVcnf4BqttBj0ddkUyts/uekP0ksuPITvLnKzuq3qaQfZ3YcRpKDGsfhbz2nPIrww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h6bzdrvm;
	arc=none smtp.remote-ip=95.215.58.207
Received: from mta1.migadu.com (out-207.mta1.migadu.com [95.215.58.207])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16F2606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F16F2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h6bzdrvm
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Dpp0QW6dxtIsgsNrKwbD1Rm5WJVVVno7NqsqAW1y3b8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793851681; v=1; x=1794456481;
 b=h6bzdrvm/Ur0kv8vbffG2xS34Jim0MONoZAaiSfCMoP9t+dVQz4zUTEF54fwZ78dSJvhBncK
 QIdn7FAGic2YhO2wZaXxdhx3ZqbPK0+wERxy7YPaxfOCfKjXiNeWsBIymcoOe4RTuTBlMSzNUrj
 TTs6TD25LbuPBJmaBEcVVKBw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aab9737a8e26880c;
	Thu, 05 Nov 2026 04:08:01 +0000
X-Mizu-Trace-ID: aab9737a8e26880c
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	azpijr@gmail.com,
	lance.yang@linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 0/4] mm: hugetlb: fix CMA-related issues
Date: Thu,  5 Nov 2026 12:07:42 +0800
Message-ID: <cover.1793850539.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Qi Zheng <zhengqi.arch@bytedance.com>

Hi all,

This series fixes four CMA-related issues in HugeTLB reservation,
long-term pinning and allocation:

 - Avoid ineffective CMA reservations on 32-bit x86 kernels running on
   CPUs that advertise 1 GiB page support.
 - Allow long-term pins of explicitly CMA-allocated HugeTLB folios,
   which already own their CMA bitmap ranges.
 - Preserve the caller's GFP mask when allocating from CMA.
 - Enforce cpuset restrictions on gigantic surplus allocations while
   preserving memory policy semantics.

Changes in v2:
 - Replace the PF_MEMALLOC_PIN allocation restriction with a GUP exception
   for HugeTLB folios marked HPG_cma. (suggested by Muchun Song)
 - Pass the caller's GFP mask through cma_alloc_frozen_compound() instead
   of skipping CMA when direct reclaim is disallowed.
   (suggested by sashiko)
 - Remove unnecessary revalidation of successfully allocated folios after
   cpuset changes. Retry only failed allocations.
   (pointed by Jose A. Perez de Azpillaga)
 - collect Reviewed-by and Acked-by.
 - Rebase onto next-20261104.

Qi Zheng (4):
  x86: hugetlb: disable default CMA reservations on 32-bit kernel
  mm: gup: allow long-term pins of CMA-allocated HugeTLB folios
  mm: hugetlb: fix GFP mask propagation to CMA
  mm: hugetlb: fix cpuset violations in gigantic surplus allocations

 arch/x86/mm/hugetlbpage.c |  2 +-
 include/linux/cma.h       |  2 +-
 include/linux/mm.h        | 29 +----------------------------
 mm/cma.c                  |  4 ++--
 mm/gup.c                  | 31 +++++++++++++++++++++++++++++++
 mm/hugetlb.c              | 25 ++++++++++++++++++-------
 mm/hugetlb_cma.c          |  4 ++--
 7 files changed, 56 insertions(+), 41 deletions(-)


base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
-- 
2.54.0

