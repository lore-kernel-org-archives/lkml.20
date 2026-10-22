Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654325;
	b=hLxBk+XF5K6lrJQRmC/StPXD9sdWr4MxvBDy0m7HdnmT5A0gsysETlrLepCIH58NJOuu
	 t0y6lxXO+NPa1BpZ72fhv8cmE8sB8zfCsUW7/Q8nr8yRsoYhJ5hqzNDo3NtKTgDl8z1+v
	 pY3SBHvkmFzv7rFMr/2OseQHqBKtLBJj06RHA1EkPitlZ7wgnrqYEM//1o9XZPUJr8Qm4
	 2fuCBtWuBezXunuIplZoKvMIeQny5SNSevGsOS17cI6ZiT1bqauwCpfpHjBnxSxeXtx1M
	 hgIqT1nt9W6aHXBNT5Q+xmSJdFWAPVxQtuvhHTA+ddLvJU0B/Q3MoNcn4Vbv/nx/Zaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654325;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=sZMaNUkUgOAGCf7vIUHWRsuT7fViPMeanwtTwml4kjU=;
	b=TyX9ESC+ZRUhnK6BVIeKCG6Xx70r6w4qwp9TYO95R94BpgZryo4eQheHoQ6B7ZJv4iV7
	 8NQ9WLGU3XukP9fl+GCDklX6+6TYjgqI4ka+pBXZyrMn8drRkZm3C8cBrKKa+cft89qAR
	 dMZ6tzgG4ZSHYFVKyE0djlGjCuGc5jQ79LT4LSCI9ZCEHpN/nDKiBlpW8eltvo7YOJsBP
	 ryxySAYwKALH5EzEpz58jrQVayHkHVernUiNezJOsVrgdvTPYy6zkNGSPSS7+4YwOYL1m
	 8TWDQfE9sulhnx0tsY3idbdDvvvpYpKbFjEVymUUYgzVYEUkU84yQeDifSNeflYFCVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZevAmix7;
	arc=none smtp.remote-ip=91.218.175.171
Received: from mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11334606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11334606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZevAmix7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pydGOxS/qlsFc5FYzisLlwLazgT7vx7cmXT+dA4dW9s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792654322; v=1; x=1793259122;
 b=ZevAmix70kRA6dGAO0+YnwcPa2Kdnji5mfDSGP8MXGTeCoko2+iFgNkSiwaDkeFNNjxYyOx9
 i0Ts51ebWQrhtaX26/5cFin9Uq3/qJpCdTsaX9/Vf/djQmmv7olhEtMgUJgIUAdLzgV1VfMXYkP
 4f80aT323M0F1lYa/dlRPSFE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cf7a53a0e25b2323;
	Thu, 22 Oct 2026 07:32:02 +0000
X-Mizu-Trace-ID: cf7a53a0e25b2323
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	david@kernel.org,
	osalvador@suse.de,
	akpm@linux-foundation.org,
	azpijr@gmail.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 0/5] mm: hugetlb: add CMA support for PMD-sized pages
Date: Thu, 22 Oct 2026 15:31:44 +0800
Message-ID: <cover.1792651104.git.zhengqi.arch@bytedance.com>
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

Allocating PMD-sized HugeTLB pages at runtime can become slow or fail
as physical memory becomes fragmented. Reserving HugeTLB pages at boot
avoids this problem, but keeps unused pages unavailable to ordinary
allocations.

Live upgrades are one example: they need additional HugeTLB pages only
during the upgrade. HugeTLB already supports CMA for gigantic pages,
but allocating a 1 GiB page from CMA may require migrating movable pages
out of a large contiguous range. Pages that cannot be migrated can prevent
the allocation from succeeding.

Extend CMA support to PMD-sized pages so their backing memory can be
reserved at boot while remaining usable for movable allocations until
needed. This relaxes the reservation alignment requirement and reduces
the contiguous range required per allocation.

The series adds an optional @<page-size> suffix to hugetlb_cma and a
separate PMD-sized pool. For example, on x86-64:

        hugetlb_cma=4G hugetlb_cma=1G@2M

This reserves 4G for the default pool and 1G for the PMD-sized pool.
Unsuffixed parameters continue to configure the default pool. Other
gigantic sizes still share that pool, as do gigantic PMD sizes when
no separate PMD pool is reserved. The new size follows the architecture's
PMD size rather than being fixed at 2M.

Non-gigantic PMD allocations try buddy first and fall back to CMA.
Gigantic allocations retain CMA-first behavior at runtime. With
hugetlb_cma_only=1, sizes with a reserved CMA pool remain restricted to CMA.

The preparatory patches introduce two fixed pool slots and pass an
allow_cma flag through the common allocation helpers to prevent recursive
CMA allocation during migration and free HugeTLB folio replacement.

Changes in v2:
 - Replace the order-keyed CMA pool array with two fixed pools for the
   default and PMD sizes. (suggested by Jose A. Perez de Azpillaga)
 - Pass allow_cma through the common fresh HugeTLB allocation helpers,
   removing the separate helper that bypassed CMA.
   (suggested by Jose A. Perez de Azpillaga)
 - Try buddy allocation before CMA for non-gigantic PMD pages, while
   preserving CMA-only policy and CMA-first allocation for gigantic pages.
   (suggested by Jose A. Perez de Azpillaga)
 - Preserve default-pool access for gigantic PMD sizes when no separate
   PMD pool is reserved.
 - Collect Reviewed-by tags
 - Rebase onto next-20261020

v1: https://lore.kernel.org/all/cover.1792136742.git.zhengqi.arch@bytedance.com/

Thanks,
Qi

Qi Zheng (5):
  mm: hugetlb: add explicit page size to hugetlb_cma
  mm: hugetlb: group CMA pool and reservation state
  mm: hugetlb: track CMA reservations by pool
  mm: hugetlb: avoid recursive CMA allocation during migration
  mm: hugetlb: enable CMA allocation for PMD-sized pages

 .../admin-guide/kernel-parameters.txt         |  40 ++-
 include/linux/hugetlb.h                       |   4 +-
 mm/hugetlb.c                                  |  67 ++--
 mm/hugetlb_cma.c                              | 328 ++++++++++++------
 mm/hugetlb_cma.h                              |  11 +-
 mm/mempolicy.c                                |   2 +-
 mm/migrate.c                                  |   3 +-
 7 files changed, 288 insertions(+), 167 deletions(-)


base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
-- 
2.54.0

