Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5705C42983C
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791641487; cv=none; b=dB57bKRj3e3FxrywYAVts87KgkGnc03TieVFrP3tb6m00cihPnOZUsNxR5h0ZUKNGuQvuIxJFMWNBQh42RGNpjqaWHrWv0uj7qR5snLL9wgdYtwjI32jMpCBkcpfoiL54KMG+rahzSGXc4N8wDhLtF7wP/UFFbYYKwfnDTPjP9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791641487; c=relaxed/simple;
	bh=t+rXEeRERkC0OZ11ZzSgLvBVdCuJOIEeHi3qAnhhJ1E=;
	h=Date:Content-Type:Cc:Mime-Version:Message-Id:To:From:Subject; b=MnYvjJyq+HtEkG1afcaO0IRyrPvKiKSYn9uHEUKM9HaMEblNGfEWxFn5X+B4wzOsHmRt3ZLz+u89j7Qtaq6nBauMC21Ndr+zGXhGwhnWlFXLt9xQpIxUbLeWvzbHbYclisdoRaUXF1KfnhyZmm82opvRv9iySJsWVdmNO0PgvN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=TCKkzR2e; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="TCKkzR2e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791641474; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=gAw1yoBwYrHHnkQw1kW2SvtZr9cN7fK/HvMTNhkkolI=;
 b=TCKkzR2ec0XhBi0BNCn922OyderqdsJwXK7+IhdtG1imTXwtfNbHAJX7XIonnSE54sQUP9
 F2fKYhl6+Xmu2NEde2KiNGAzqKKxLU6xxrWwaC+XP3Wy87fFXdMZoSZd7SHgbCMTciSIA2
 XZAxrE4wqNJZin3EQsLvftDx7bU5vwrG6wzaHm4XNmF/royW8EfJbDhUORZWVI1ryHwAjB
 azCC37lWhXHb/X6b1CsdWfsQpFZDqYmcw08KdN+3m5cA0l8T72bj7z5KUlaw/FqesJ53DZ
 LGqIUsvO4BuhwtvMgWXbWIh1/oW4MqnnFr6FNnmsNAq7LivZamhAqsKOMOiK7Q==
Date: Sat, 10 Oct 2026 22:10:57 +0800
Content-Type: text/plain; charset=UTF-8
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
	<kasong@tencent.com>, <mhocko@kernel.org>, <hannes@cmpxchg.org>, 
	<baohua@kernel.org>, <zhangbo56@xiaomi.com>, 
	"Xiang Liu" <liuxiang.277@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26aca4780+a8b224+vger.kernel.org+liuxiang.277@bytedance.com>
Message-Id: <20261010141057.599595-1-liuxiang.277@bytedance.com>
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.20.1
To: <akpm@linux-foundation.org>
From: "Xiang Liu" <liuxiang.277@bytedance.com>
Subject: [RFC PATCH] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache in MGLRU
X-Original-From: Xiang Liu <liuxiang.277@bytedance.com>

Bo Zhang's GFP_NOIO patch [1] addressed anonymous scanning with low
swapcache in the traditional LRU and left MGLRU as a TODO. This patch
addresses that remaining case.

Under GFP_NOIO, anonymous folios requiring swap IO cannot be reclaimed.
When very few anonymous folios are already in swapcache, scanning anon
can spend substantial time isolating and processing folios with little
reclaim progress.

Apply the existing can_reclaim_anon_pages() check to MGLRU.
lruvec_is_sizable() excludes unavailable anon from its size estimate.
In try_to_shrink_lruvec(), file-only scan_swappiness is passed to
get_nr_to_scan(), should_run_aging() and evict_folios().

The tradeoff is synchronous aging. With four anon generations and two
file generations, advancing max_seq can require moving the oldest anon
folios to the next generation. This patch accepts that cost to avoid
low-yield anonymous scanning. It keeps the original swappiness in
try_to_inc_max_seq(), avoiding additional use of the inc_min_seq()
single-type shortcut that advances min_seq without processing the
oldest folios and can cause cold/hot inversions.

Tested against the mm-unstable base-commit below using dm-verity
hash-block reads through dm-bufio, with unchanged NOIO allocation flags.

Allocation time spans alloc_buffer() entry to return with valid buffer
and data. Reclaim time is the time spent in try_to_free_pages() within
that allocation. Eviction and aging are the time spent in evict_folios()
and try_to_inc_max_seq() within that reclaim.

1. NOIO allocations under memory pressure

The workload triggered NOIO reclaim during dm-verity reads, with
generations allowed to evolve naturally. The table reports median
times for successful allocations that entered direct reclaim.

Time (ms, median)            Baseline  Patched
===========================  ========  =======
Successful alloc_buffer()     181.196    0.465
Direct reclaim                181.185    0.131
Eviction within reclaim       179.147    0.091

2. Synchronous-aging cost

Prepared four anon generations and two file generations, with zero
swapcache and pages in the oldest file generation. The tests varied
the oldest anon population to compare baseline eviction with patched
synchronous aging.

Each row reports a successful alloc_buffer() call and its reclaim
costs. Oldest anon is the measured population of the oldest generation.

Kernel    Oldest anon  Allocation   Reclaim  Eviction    Aging
                (MiB)        (ms)      (ms)      (ms)     (ms)
========  ===========  ==========  ========  ========  =======
Baseline     1755.266     131.704   131.699   127.985    1.672
Patched      1840.422      38.316    38.311     0.307   37.785
Baseline     4835.418     681.796   681.766   675.477    4.382
Patched      4813.180      91.161    91.140     0.450   90.407
Baseline     8941.582    1474.245  1474.202  1469.084    0.488
Patched      9012.660     143.748   143.709     1.026  142.341
Baseline    13104.676    1098.372  1098.354  1087.976    2.307
Patched     13046.621     139.450   139.390     1.083  137.954
Baseline    17187.043    2694.909  2694.902  2686.470    0.784
Patched     17124.902     209.240   209.233     0.638  208.270

Across these tested sizes, synchronous aging was substantially cheaper
than baseline eviction, and successful allocation time decreased.

[1]
https://patchew.org/linux/20260908062649.1045883-1-zhangbo56@xiaomi.com/

Signed-off-by: Xiang Liu <liuxiang.277@bytedance.com>
---
 mm/vmscan.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 29b31446fc11..550c16cad9f9 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -379,13 +379,6 @@ static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
 	if (!sc || (sc->gfp_mask & __GFP_IO))
 		return false;
 
-	/*
-	 * FIXME: MGLRU doesn't fully respect can_reclaim_anon_pages() for the
-	 * scanning type, so only apply this to the traditional LRU for now.
-	 */
-	if (lru_gen_enabled())
-		return false;
-
 	if (memcg) {
 		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
 
@@ -4357,6 +4350,13 @@ static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *sc)
 	unsigned long total;
 	int swappiness = get_swappiness(lruvec, sc);
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
+	int nid = lruvec_pgdat(lruvec)->node_id;
+
+	if (swappiness && !can_reclaim_anon_pages(memcg, nid, sc)) {
+		if (swappiness == SWAPPINESS_ANON_ONLY)
+			return false;
+		swappiness = MIN_SWAPPINESS;
+	}
 
 	total = lruvec_evictable_size(lruvec, swappiness);
 
@@ -5246,8 +5246,14 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 	long nr_batch, nr_to_scan;
 	int swappiness = get_swappiness(lruvec, sc);
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
+	int scan_swappiness = swappiness;
+
+	/* Restrict scanning without changing the policy used for aging. */
+	if (swappiness && swappiness != SWAPPINESS_ANON_ONLY &&
+	    !can_reclaim_anon_pages(memcg, lruvec_pgdat(lruvec)->node_id, sc))
+		scan_swappiness = MIN_SWAPPINESS;
 
-	nr_to_scan = get_nr_to_scan(lruvec, sc, memcg, swappiness);
+	nr_to_scan = get_nr_to_scan(lruvec, sc, memcg, scan_swappiness);
 	while (nr_to_scan > 0) {
 		int delta;
 		DEFINE_MAX_SEQ(lruvec);
@@ -5257,14 +5263,14 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 			break;
 		}
 
-		if (should_run_aging(lruvec, max_seq, sc, swappiness)) {
+		if (should_run_aging(lruvec, max_seq, sc, scan_swappiness)) {
 			if (try_to_inc_max_seq(lruvec, max_seq, swappiness, false))
 				need_rotate = true;
 			should_age = true;
 		}
 
 		nr_batch = min(nr_to_scan, MIN_LRU_BATCH);
-		delta = evict_folios(nr_batch, lruvec, sc, swappiness);
+		delta = evict_folios(nr_batch, lruvec, sc, scan_swappiness);
 		if (!delta)
 			break;
 

base-commit: 55ff3dc8fced48c98667c19769c55103a23eabce
-- 
2.20.1
