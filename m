Received: from lgeamrelo07.lge.com (lgeamrelo07.lge.com [156.147.51.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A784DAFA3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.51.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583693; cv=none; b=WbxXodIooM1HrKet5vSvz+aoQix9+0hkZvroAp8xuE2xh0vGWzpD8RYdmhih5dCw/xVjQW/CdYlRObuyrhjWAsUuxBIydFWlk/wVr5GX4AOZu5CL6fXqXXAqRi8+dGl0osLOHktpL+hWcP4zDuKlTc4gfQ0nIZfRxk3dQAlj+sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583693; c=relaxed/simple;
	bh=VklEqvAOcw4APBVtRNV692SWORmxQoeXUBCSmhJNvbY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hKfx5IO9EYcyRVraZK5ba6c/yjBgSWPTaRIJs29mJXafPTGpdReKB/SZ+T+opuFjKYE/nsW798ZBWB81pfkufWdYpT4zGtvr5lvDmR3RNv5WquIw4bqTbUNQFJYyXXc89i1pxSFMwiBp2Z2oX5GKGaL3IyEiz3pMSWoS4fnnIBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.51.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO yjaykim-PowerEdge-T330.lge.net) (10.177.112.156)
	by 156.147.51.103 with ESMTP; 17 Sep 2026 03:34:37 +0900
X-Original-SENDERIP: 10.177.112.156
X-Original-MAILFROM: youngjun.park@lge.com
From: Youngjun Park <youngjun.park@lge.com>
To: akpm@linux-foundation.org
Cc: chrisl@kernel.org,
	youngjun.park@lge.com,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	shikemeng@huaweicloud.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	yosry@kernel.org,
	joshua.hahnjy@gmail.com,
	taejoon.song@lge.com,
	her0gyugyu@gmail.com,
	lianux.mm@gmail.com
Subject: [RFC PATCH v11 4/4] mm: swap: filter swap allocation by memcg tier mask
Date: Thu, 17 Sep 2026 03:34:37 +0900
Message-Id: <20260916183437.2946306-5-youngjun.park@lge.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916183437.2946306-1-youngjun.park@lge.com>
References: <20260916183437.2946306-1-youngjun.park@lge.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apply the cgroup tier mask during swap slot allocation to enforce
per-cgroup swap tier restrictions.

The folio's mask is looked up once and passed to the fast, slow and
discard paths as a parameter, so all of them act on the same mask even
if the cgroup's mask changes concurrently.

The device tier_mask is read with READ_ONCE() in the two paths that
do not hold swap_lock, matching how si->flags is read in the same
allocator.

In the fast path, check the percpu cached swap_info's tier_mask
against the folio's mask. If it does not match, fall through to the
slow path. In the slow path, skip swap devices whose tier_mask is not
covered by the folio's mask. The discard fallback honors the mask too.
Without it, a discard on a device outside the folio's tiers still
returns true and drives the retry, so the allocation spins through the
loop consuming another device's discard queue while it cannot succeed.

This works correctly when there is only one non-rotational
device in the system and no devices share the same priority.
However, there are known limitations.

 - When non-rotational devices are distributed across multiple
   tiers, and different memcgs are configured to use those
   distinct tiers, they may constantly overwrite the shared
   percpu swap cache. This cache thrashing leads to frequent
   fast path misses.

 - Combined with the above issue, if same-priority devices exist
   among them, a percpu cache miss (overwritten by another memcg)
   forces the allocator to round-robin to the next device
   prematurely, even if the current cluster is not fully
   exhausted.

These edge cases do not affect the primary use case of
directing swap traffic per cgroup. Further optimization is
planned for future work.

Signed-off-by: Youngjun Park <youngjun.park@lge.com>
---
 mm/swapfile.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index bb953dd33ca0..b246eff25c96 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1364,7 +1364,7 @@ static bool get_swap_device_info(struct swap_info_struct *si)
  * Fast path try to get swap entries with specified order from current
  * CPU's swap entry pool (a cluster).
  */
-static bool swap_alloc_fast(struct folio *folio)
+static bool swap_alloc_fast(struct folio *folio, unsigned int mask)
 {
 	unsigned int order = folio_order(folio);
 	struct swap_cluster_info *ci;
@@ -1376,8 +1376,11 @@ static bool swap_alloc_fast(struct folio *folio)
 	 * so checking it's liveness by get_swap_device_info is enough.
 	 */
 	si = this_cpu_read(percpu_swap_cluster.si[order]);
+	if (!si || !swap_tiers_mask_test(READ_ONCE(si->tier_mask), mask))
+		return false;
+
 	offset = this_cpu_read(percpu_swap_cluster.offset[order]);
-	if (!si || !offset || !get_swap_device_info(si))
+	if (!offset || !get_swap_device_info(si))
 		return false;
 
 	ci = swap_cluster_lock(si, offset);
@@ -1394,7 +1397,7 @@ static bool swap_alloc_fast(struct folio *folio)
 }
 
 /* Rotate the device and switch to a new cluster */
-static void swap_alloc_slow(struct folio *folio)
+static void swap_alloc_slow(struct folio *folio, unsigned int mask)
 {
 	struct swap_info_struct *si, *next;
 	struct swap_tier *tier;
@@ -1405,6 +1408,9 @@ static void swap_alloc_slow(struct folio *folio)
 	for_each_active_tier(tier) {
 		prio = tier->prio;
 		plist_for_each_entry_safe(si, next, &tier->avail_head, avail_list) {
+			if (!swap_tiers_mask_test(READ_ONCE(si->tier_mask), mask))
+				continue;
+
 			/* Rotate the device and switch to a new cluster */
 			plist_requeue(&si->avail_list, &tier->avail_head);
 			spin_unlock(&swap_avail_lock);
@@ -1439,7 +1445,7 @@ static void swap_alloc_slow(struct folio *folio)
  * Discard pending clusters in a synchronized way when under high pressure.
  * Return: true if any cluster is discarded.
  */
-static bool swap_sync_discard(void)
+static bool swap_sync_discard(unsigned int mask)
 {
 	bool ret = false;
 	struct swap_info_struct *si, *next;
@@ -1451,6 +1457,8 @@ static bool swap_sync_discard(void)
 	for_each_active_tier(tier) {
 		prio = tier->prio;
 		plist_for_each_entry_safe(si, next, &tier->active_head, list) {
+			if (!swap_tiers_mask_test(si->tier_mask, mask))
+				continue;
 			spin_unlock(&swap_lock);
 			if (get_swap_device_info(si)) {
 				if (si->flags & SWP_PAGE_DISCARD)
@@ -1749,6 +1757,7 @@ int folio_alloc_swap(struct folio *folio)
 {
 	unsigned int order = folio_order(folio);
 	unsigned int size = 1 << order;
+	unsigned int mask;
 
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
 	VM_BUG_ON_FOLIO(!folio_test_uptodate(folio), folio);
@@ -1772,13 +1781,14 @@ int folio_alloc_swap(struct folio *folio)
 	}
 
 again:
+	mask = folio_tier_mask(folio);
 	local_lock(&percpu_swap_cluster.lock);
-	if (!swap_alloc_fast(folio))
-		swap_alloc_slow(folio);
+	if (!swap_alloc_fast(folio, mask))
+		swap_alloc_slow(folio, mask);
 	local_unlock(&percpu_swap_cluster.lock);
 
 	if (!order && unlikely(!folio_test_swapcache(folio))) {
-		if (swap_sync_discard())
+		if (swap_sync_discard(mask))
 			goto again;
 	}
 
-- 
2.48.1

