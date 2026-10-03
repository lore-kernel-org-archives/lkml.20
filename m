Received: from mta0.migadu.com (out-139.mta0.migadu.com [91.218.175.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CDD2472AF
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987592; cv=none; b=HS0r9PK8YcTqLv8kt2nUOhzLj/GpcAH3PvddmZHoZtTcAf9fLuYLMZhLvKuFtkn1r5FpA3NEr9oZgP4zn7vyjtlmpuy1OXt6VCBrxX8hooSv5XdclX5BB6/kmeCYZ3fgSaMi33r+zYsp/zIV1iCn2HrptmnxLzaRrgzv1TbCP5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987592; c=relaxed/simple;
	bh=scBy+ZeJJp+p+NOaLTBfNjfwa2sjNU7WyDNaGTT0jbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=Y6UCxXMcLntAkhMacYJZRo02PA8qgQ8aCkY7cs/y5CuT5JgZnU1vn06pJQ4Q7oS3/7HJPGjIuXXPhRT+KQ67EG5V4xJM6CmK78QboYxpZJ3fJ9xUOcg2rpVVah8zy/sWIKFjTb2TWG6uZPdlMtKTPTNO8kUo4zDaldLe3qBX0Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 9c8d0751a056c750;
	Sat, 03 Oct 2026 00:33:04 +0000
X-Mizu-Trace-ID: 9c8d0751a056c750
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v4 11/14] mm, swap: do not give an xswap slot to a cgroup that cannot zswap
Date: Sat,  3 Oct 2026 08:31:33 +0800
Message-ID: <20261003003136.750633-12-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261003003136.750633-1-hebaoquan@kylinos.cn>
References: <20261003003136.750633-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

An xswap slot holds only a zswap-backed page: it reserves no storage of
its own. A cgroup that cannot take another zswap page still gets an
xswap slot on swapout, but zswap refuses the page, so the slot cannot
hold it.

Skip xswap devices during allocation when the folio's cgroup cannot
zswap, and allocate from a physical swap device instead. That routes the
folio to a device that can store it, and avoids taking an xswap slot
that zswap will not fill.

The test is obj_cgroup_may_zswap(), which is false both when
memory.zswap.max is 0 in the hierarchy and when the hierarchy is already
at that limit. So the routing follows how full the pool is, and not only
how the cgroup is configured; it is stricter than zswap_store(), which
stores anyway if its shrink found nothing to free.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 47 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 8c8e99ea403e..818b5a147b73 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -204,6 +204,8 @@ static DEFINE_SPINLOCK(swap_lock);
 static unsigned int nr_swapfiles;
 atomic_long_t nr_swap_pages;
 atomic_t nr_real_swapfiles;
+/* Active xswap devices, as in nr_real_swapfiles. */
+static atomic_t nr_xswap_files;
 /*
  * Some modules use swappable objects and may try to swap them out under
  * memory pressure (via the shrinker). Before doing so, they may wish to
@@ -1385,7 +1387,9 @@ static void del_from_avail_list(struct swap_info_struct *si, bool swapoff)
 		lockdep_assert_held(&si->lock);
 		si->flags &= ~SWP_WRITEOK;
 		/* Count active devices, not merely those on the avail list. */
-		if (!(si->flags & SWP_XSWAP))
+		if (si->flags & SWP_XSWAP)
+			atomic_sub(1, &nr_xswap_files);
+		else
 			atomic_sub(1, &nr_real_swapfiles);
 		atomic_long_or(SWAP_USAGE_OFFLIST_BIT, &si->inuse_pages);
 	} else {
@@ -1444,8 +1448,12 @@ static void add_to_avail_list(struct swap_info_struct *si, bool swapon)
 	}
 
 	plist_add(&si->avail_list, &swap_avail_head);
-	if (swapon && !(si->flags & SWP_XSWAP))
-		atomic_add(1, &nr_real_swapfiles);
+	if (swapon) {
+		if (si->flags & SWP_XSWAP)
+			atomic_add(1, &nr_xswap_files);
+		else
+			atomic_add(1, &nr_real_swapfiles);
+	}
 
 skip:
 	spin_unlock(&swap_avail_lock);
@@ -1543,7 +1551,7 @@ static bool get_swap_device_info(struct swap_info_struct *si)
  * Fast path try to get swap entries with specified order from current
  * CPU's swap entry pool (a cluster).
  */
-static bool swap_alloc_fast(struct folio *folio)
+static bool swap_alloc_fast(struct folio *folio, bool may_zswap)
 {
 	unsigned int order = folio_order(folio);
 	struct swap_cluster_info *ci;
@@ -1564,6 +1572,11 @@ static bool swap_alloc_fast(struct folio *folio)
 		rcu_read_unlock();
 		return false;
 	}
+	if (!may_zswap && (si->flags & SWP_XSWAP)) {
+		put_swap_device(si);
+		rcu_read_unlock();
+		return false;
+	}
 
 	ci = swap_cluster_lock(si, offset);
 	if (cluster_is_usable(ci, order)) {
@@ -1580,13 +1593,19 @@ static bool swap_alloc_fast(struct folio *folio)
 }
 
 /* Rotate the device and switch to a new cluster */
-static void swap_alloc_slow(struct folio *folio)
+static void swap_alloc_slow(struct folio *folio, bool may_zswap)
 {
 	struct swap_info_struct *si, *next;
 
 	spin_lock(&swap_avail_lock);
 start_over:
 	plist_for_each_entry_safe(si, next, &swap_avail_head, avail_list) {
+		/*
+		 * Do not rotate a skipped device: the walk follows the
+		 * rotation and would spin forever.
+		 */
+		if (!may_zswap && (si->flags & SWP_XSWAP))
+			continue;
 		/* Rotate the device and switch to a new cluster */
 		plist_requeue(&si->avail_list, &swap_avail_head);
 		spin_unlock(&swap_avail_lock);
@@ -1925,10 +1944,24 @@ int folio_alloc_swap(struct folio *folio)
 {
 	unsigned int order = folio_order(folio);
 	unsigned int size = 1 << order;
+	struct obj_cgroup *objcg;
+	/* True unless the gate below finds an xswap device to route away from. */
+	bool may_zswap = true;
 
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
 	VM_BUG_ON_FOLIO(!folio_test_uptodate(folio), folio);
 
+	/*
+	 * A folio that zswap will not take must not get an xswap slot. With
+	 * no xswap device to route away from, skip the lookup.
+	 */
+	if (atomic_read(&nr_xswap_files)) {
+		objcg = get_obj_cgroup_from_folio(folio);
+		may_zswap = !objcg || obj_cgroup_may_zswap(objcg);
+		if (objcg)
+			obj_cgroup_put(objcg);
+	}
+
 	if (order) {
 		/*
 		 * Reject large allocation when THP_SWAP is disabled. Check below
@@ -1949,8 +1982,8 @@ int folio_alloc_swap(struct folio *folio)
 
 again:
 	local_lock(&percpu_swap_cluster.lock);
-	if (!swap_alloc_fast(folio))
-		swap_alloc_slow(folio);
+	if (!swap_alloc_fast(folio, may_zswap))
+		swap_alloc_slow(folio, may_zswap);
 	local_unlock(&percpu_swap_cluster.lock);
 
 	if (!order && unlikely(!folio_test_swapcache(folio))) {
-- 
2.54.0

