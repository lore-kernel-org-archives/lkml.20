Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0C2311C2A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787989685; cv=none; b=B7fEvx86QuIHTcBbL8ZzsYEDOERc0uvGK8mtapd+gQs4gVcc5uL2BmJT+xFkfojHMq3EOtwzq+dTlNFZYK5oRyizH8JDHfoQSsvoTBeGuqyhic7yKrvOxq78ovvA0YHr0SyAN6A1cRUu7TtCws6PvC+tKjOVYk+j8Gl3ABF7ZTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787989685; c=relaxed/simple;
	bh=SfeUrH+0uWX7Hs71vNWmXYEDpQydR2VFcPQxTnmr1Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sAtxhSBBQXe0/iTT2SZsDuIW4VifWPxbNGscRx6al4nkkSYoJ3+a8/ditoIHwWQSdNx4lKrMKbU5YpCJj5Ww3A2dw1Hgs+oc2JKfF1E4av9cEzGNqaQZVWUsOC/dc+bkGY1tDsRjA/NGc5lsNnLiF+2MZl8swN1M0NFN3JCBykw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzhnENaI; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzhnENaI"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cedda2ce6fso11969685ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787989683; x=1788594483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e3pO0sfpG3DfTZP/kIIBTuTwDNPHKJvFu4PoPkWSsN0=;
        b=mzhnENaIOL4WZjcFI1/8I4D+Wj1SBatIT23y6UBiIf/++nSXzvmmfBhS/eWoOivBds
         W78tP9UUuXoLSG6tcLG3XDDz9ghFV1ebqEB1QuKQuccNOXBrkEdsfGeWzwhLebtzprrC
         cY0yzM0w50Fl58R3Gh6rU98mAQzMRoP5jf4DiIgVG6J++cAVHKf/DNNZc4Wd8dK8YvzI
         iWdRg5mTothM3eKfvHleGXgQblqGqWNuC4UaLbsNpv4Rrmd1wY07lJMR52T6RwSyVc2m
         xXKXNB/twoi3JscPkSUcJZDGK5rpjaN8rKDJecdX74yjIQ/bUuHKfeKPMeU4nXL3xuR4
         umzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787989683; x=1788594483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e3pO0sfpG3DfTZP/kIIBTuTwDNPHKJvFu4PoPkWSsN0=;
        b=DfTikelrXOK8PvDApFk+Vp/3R0WpPWXLmwETUbrKTFP8dlUJXwavQm7DH6Wn1Gta04
         bRI2hVMFIlR2gGDnOBBicHkp0yop+hAEz7tffyVlQT+edjxYTt07XZCIljJdzvRh2Rqq
         wIy8qdh8tGI1eLmH2ZIPEMcBRamDSqTxMVndcYnPW+w6dzdiSv0nhvrjjDdLwbBFT1Hw
         uNDSFNWaygCprKgOZX77sEaN5QuRQzgOM/8f6w34a7rCX3qustAKNEZtSJAABLIZcC42
         u5ZhjiP9J0EJSOZ43ch8zyexgQ/sAjIu46orlEWACrqcoVUWH0A0l3NWMtlYVOHVuF2b
         KyLA==
X-Gm-Message-State: AFuF++ntH/pSB2YhVVb9BKXUKdVUCe9q6yiJ2AHT1+pUFK86o2uQnGAz
	liqtfq4+VlnOonse9gf+ZPyyzq/WkMgUPpzvGSFGWbsBtZb9u0fzbzB/
X-Gm-Gg: AYBFou187wSWZNA/UW5z+7vIs2bysjV2kSHrDmTIyusvAnF/921M0OWAUgSQp69/nN+
	sSLxrRTvR9FXiKIIGl1TkTPiApDcmhWQoALsfS07YoyWl13G4o2Mz7JutxC4Tsz8hg8TS2T8LCt
	WcOXzhIDJuHujDwR1ywNBxSlVsDuGtBs+JVjrv/Z7QyPNw7C5xW8IVuNc8qySA/PoCLjPOSqb4U
	qvuzBsSfLwuztsejl4EXJ9c+4DjPmCS5uNyqwMl/s85ockTJGTfj1e0dTpYyCAhHB8myNRwwBCh
	50twq+CWX+g6peId2pn4AFvbJmgE7vdDNJMpLkdWEq3VNaf1cRYWIWSMXlNZG4M0foREYr87Wz+
	E3GBrEeTqFlQGw2EplFJSdiYxAHjUH4UODpkcgU+NwXBtXhJiDLy89sM7KSAdUSKLEdsjOGl6w8
	fbpeMFcL0k8+TJdBDDgBLR02eKFFcRTGPPb7Wg13ze7J2zz7JuTRl/ufcV8wyntBgU+Y4+NuClU
	CYkWcG1egUuAv3NY0Ls35G0q2GZ
X-Received: by 2002:a17:902:da89:b0:2d8:d4d3:da52 with SMTP id d9443c01a7336-2d8d4d3db4cmr65289365ad.22.1787989682717;
        Sat, 29 Aug 2026 00:48:02 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7594fb1c3sm12506505ad.1.2026.08.29.00.47.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 00:48:02 -0700 (PDT)
From: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Baoquan He <bhe@redhat.com>
Subject: [RESEND RFC PATCH v2 08/13] mm/swap: change back to use each swap device's percpu cluster
Date: Sat, 29 Aug 2026 15:47:54 +0800
Message-ID: <20260829-swap-pcp-priq-v2-resend-8-68d3d925578c@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
References: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Youngjun Park <youngjun.park@lge.com>

This reverts commit 1b7e90020eb7 ("mm, swap: use percpu cluster as
allocation fast path").

The global percpu cluster causes several issues:

1) It prevents efficient swap allocation for users that do not want
   the default swap device policy.  Because the cluster cache sits
   above device selection, all allocation users must stick with the
   default allocation policy.  This fundamentally conflicts with
   incoming ideas like swap tiering.

2) It can cause priority inversion.  Consider two memcgs: memcg1 can
   access devices A and B, where A has higher priority; memcg2 can
   only access B.  Memcg2 can write the global percpu cluster with
   device B, then memcg1 takes B in the fast path even though
   higher-priority device A is not exhausted.

3) The fast-path / slow-path design bundled with the global per-CPU
   cache is problematic: only the fast path uses the global cache,
   and the slow path is forced to rotate the allocation list.  This
   complicates consumers like discard.

Revert to per-device percpu clusters first.  A later patch will
introduce new infrastructure for a high-performance global
allocation path.

Suggested-by: Kairui Song <kasong@tencent.com>
Co-developed-by: Baoquan He <bhe@redhat.com>
Signed-off-by: Baoquan He <bhe@redhat.com>
Signed-off-by: Youngjun Park <youngjun.park@lge.com>
Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang (ProcessMission) <lianux.mm@gmail.com>
Tested-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 include/linux/swap.h |  13 ++-
 mm/swapfile.c        | 184 +++++++++++++++----------------------------
 2 files changed, 72 insertions(+), 125 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 7b8ba0d1903f..aa66d8454186 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -245,10 +245,17 @@ enum {
 #endif
 
 /*
- * We keep using same cluster for rotational device so IO will be sequential.
- * The purpose is to optimize SWAP throughput on these device.
+ * We assign a cluster to each CPU, so each CPU can allocate swap entry from
+ * its own cluster and swapout sequentially. The purpose is to optimize swapout
+ * throughput.
  */
+struct percpu_cluster {
+	local_lock_t lock; /* Protect the percpu_cluster above */
+	unsigned int next[SWAP_NR_ORDERS]; /* Likely next allocation offset */
+};
+
 struct swap_sequential_cluster {
+	spinlock_t lock; /* Serialize usage of global cluster */
 	unsigned int next[SWAP_NR_ORDERS]; /* Likely next allocation offset */
 };
 
@@ -271,8 +278,8 @@ struct swap_info_struct {
 					/* list of cluster that are fragmented or contented */
 	unsigned int pages;		/* total of usable pages of swap */
 	atomic_long_t inuse_pages;	/* number of those currently in use */
+	struct percpu_cluster	__percpu *percpu_cluster; /* per cpu's swap location */
 	struct swap_sequential_cluster *global_cluster; /* Use one global cluster for rotating device */
-	spinlock_t global_cluster_lock;	/* Serialize usage of global cluster */
 	struct rb_root swap_extent_root;/* root of the swap extent rbtree */
 	struct block_device *bdev;	/* swap device or bdev of swap file */
 	struct file *swap_file;		/* seldom referenced */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 1fa6945d6415..79ecff2d0bd3 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -146,18 +146,6 @@ static atomic_t proc_poll_event = ATOMIC_INIT(0);
 
 atomic_t nr_rotate_swap = ATOMIC_INIT(0);
 
-struct percpu_swap_cluster {
-	struct swap_info_struct *si[SWAP_NR_ORDERS];
-	unsigned long offset[SWAP_NR_ORDERS];
-	local_lock_t lock;
-};
-
-static DEFINE_PER_CPU(struct percpu_swap_cluster, percpu_swap_cluster) = {
-	.si = { NULL },
-	.offset = { SWAP_ENTRY_INVALID },
-	.lock = INIT_LOCAL_LOCK(),
-};
-
 /* May return NULL on invalid type, caller must check for NULL return */
 static struct swap_info_struct *swap_type_to_info(int type)
 {
@@ -562,9 +550,10 @@ swap_cluster_populate(struct swap_info_struct *si,
 	 * Only cluster isolation from the allocator does table allocation.
 	 * Swap allocator uses percpu clusters and holds the local lock.
 	 */
-	lockdep_assert_held(&this_cpu_ptr(&percpu_swap_cluster)->lock);
-	if (!(si->flags & SWP_SOLIDSTATE))
-		lockdep_assert_held(&si->global_cluster_lock);
+	if (si->flags & SWP_SOLIDSTATE)
+		lockdep_assert_held(this_cpu_ptr(&si->percpu_cluster->lock));
+	else
+		lockdep_assert_held(&si->global_cluster->lock);
 	lockdep_assert_held(&ci->lock);
 
 	if (!swap_cluster_alloc_table(ci, __GFP_HIGH | __GFP_NOMEMALLOC |
@@ -577,9 +566,10 @@ swap_cluster_populate(struct swap_info_struct *si,
 	 * the potential recursive allocation is limited.
 	 */
 	spin_unlock(&ci->lock);
-	if (!(si->flags & SWP_SOLIDSTATE))
-		spin_unlock(&si->global_cluster_lock);
-	local_unlock(&percpu_swap_cluster.lock);
+	if (si->flags & SWP_SOLIDSTATE)
+		local_unlock(&si->percpu_cluster->lock);
+	else
+		spin_unlock(&si->global_cluster->lock);
 
 	ret = swap_cluster_alloc_table(ci, __GFP_HIGH | __GFP_NOMEMALLOC |
 					   GFP_KERNEL);
@@ -592,9 +582,10 @@ swap_cluster_populate(struct swap_info_struct *si,
 	 * could happen with ignoring the percpu cluster is fragmentation,
 	 * which is acceptable since this fallback and race is rare.
 	 */
-	local_lock(&percpu_swap_cluster.lock);
-	if (!(si->flags & SWP_SOLIDSTATE))
-		spin_lock(&si->global_cluster_lock);
+	if (si->flags & SWP_SOLIDSTATE)
+		local_lock(&si->percpu_cluster->lock);
+	else
+		spin_lock(&si->global_cluster->lock);
 	spin_lock(&ci->lock);
 
 	if (ret) {
@@ -700,7 +691,7 @@ static bool swap_do_scheduled_discard(struct swap_info_struct *si)
 		ci = list_first_entry(&si->discard_clusters, struct swap_cluster_info, list);
 		/*
 		 * Delete the cluster from list to prepare for discard, but keep
-		 * the CLUSTER_FLAG_DISCARD flag, percpu_swap_cluster could be
+		 * the CLUSTER_FLAG_DISCARD flag, there could be percpu_cluster
 		 * pointing to it, or ran into by relocate_cluster.
 		 */
 		list_del(&ci->list);
@@ -1032,12 +1023,10 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 out:
 	relocate_cluster(si, ci);
 	swap_cluster_unlock(ci);
-	if (si->flags & SWP_SOLIDSTATE) {
-		this_cpu_write(percpu_swap_cluster.offset[order], next);
-		this_cpu_write(percpu_swap_cluster.si[order], si);
-	} else {
+	if (si->flags & SWP_SOLIDSTATE)
+		this_cpu_write(si->percpu_cluster->next[order], next);
+	else
 		si->global_cluster->next[order] = next;
-	}
 	return found;
 }
 
@@ -1138,13 +1127,17 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 	if (order && !(si->flags & SWP_BLKDEV))
 		return 0;
 
-	if (!(si->flags & SWP_SOLIDSTATE)) {
+	if (si->flags & SWP_SOLIDSTATE) {
+		/* Fast path using per CPU cluster */
+		local_lock(&si->percpu_cluster->lock);
+		offset = __this_cpu_read(si->percpu_cluster->next[order]);
+	} else {
 		/* Serialize HDD SWAP allocation for each device. */
-		spin_lock(&si->global_cluster_lock);
+		spin_lock(&si->global_cluster->lock);
 		offset = si->global_cluster->next[order];
-		if (offset == SWAP_ENTRY_INVALID)
-			goto new_cluster;
+	}
 
+	if (offset != SWAP_ENTRY_INVALID) {
 		ci = swap_cluster_lock(si, offset);
 		/* Cluster could have been used by another order */
 		if (cluster_is_usable(ci, order)) {
@@ -1158,7 +1151,6 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 			goto done;
 	}
 
-new_cluster:
 	/*
 	 * If the device need discard, prefer new cluster over nonfull
 	 * to spread out the writes.
@@ -1215,8 +1207,10 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 			goto done;
 	}
 done:
-	if (!(si->flags & SWP_SOLIDSTATE))
-		spin_unlock(&si->global_cluster_lock);
+	if (si->flags & SWP_SOLIDSTATE)
+		local_unlock(&si->percpu_cluster->lock);
+	else
+		spin_unlock(&si->global_cluster->lock);
 
 	return found;
 }
@@ -1371,41 +1365,8 @@ static bool get_swap_device_info(struct swap_info_struct *si)
 	return true;
 }
 
-/*
- * Fast path try to get swap entries with specified order from current
- * CPU's swap entry pool (a cluster).
- */
-static bool swap_alloc_fast(struct folio *folio)
-{
-	unsigned int order = folio_order(folio);
-	struct swap_cluster_info *ci;
-	struct swap_info_struct *si;
-	unsigned int offset;
-
-	/*
-	 * Once allocated, swap_info_struct will never be completely freed,
-	 * so checking it's liveness by get_swap_device_info is enough.
-	 */
-	si = this_cpu_read(percpu_swap_cluster.si[order]);
-	offset = this_cpu_read(percpu_swap_cluster.offset[order]);
-	if (!si || !offset || !get_swap_device_info(si))
-		return false;
-
-	ci = swap_cluster_lock(si, offset);
-	if (cluster_is_usable(ci, order)) {
-		if (cluster_is_empty(ci))
-			offset = cluster_offset(si, ci);
-		alloc_swap_scan_cluster(si, ci, folio, offset);
-	} else {
-		swap_cluster_unlock(ci);
-	}
-
-	put_swap_device(si);
-	return folio_test_swapcache(folio);
-}
-
 /* Rotate the device and switch to a new cluster */
-static void swap_alloc_slow(struct folio *folio)
+static void swap_alloc_entry(struct folio *folio)
 {
 	struct swap_info_struct *si, *next;
 
@@ -1775,10 +1736,7 @@ int folio_alloc_swap(struct folio *folio)
 	}
 
 again:
-	local_lock(&percpu_swap_cluster.lock);
-	if (!swap_alloc_fast(folio))
-		swap_alloc_slow(folio);
-	local_unlock(&percpu_swap_cluster.lock);
+	swap_alloc_entry(folio);
 
 	if (!order && unlikely(!folio_test_swapcache(folio))) {
 		if (swap_sync_discard())
@@ -2167,31 +2125,14 @@ void swap_put_entries_direct(swp_entry_t entry, int nr)
  */
 swp_entry_t swap_alloc_hibernation_slot(int type)
 {
-	struct swap_info_struct *pcp_si, *si = swap_type_to_info(type);
-	unsigned long pcp_offset, offset = SWAP_ENTRY_INVALID;
-	struct swap_cluster_info *ci;
+	struct swap_info_struct *si = swap_type_to_info(type);
+	unsigned long offset = SWAP_ENTRY_INVALID;
 	swp_entry_t entry = {0};
 
 	if (!si)
 		goto fail;
 
-	/*
-	 * Try the local cluster first if it matches the device. If
-	 * not, try grab a new cluster and override local cluster.
-	 */
-	local_lock(&percpu_swap_cluster.lock);
-	pcp_si = this_cpu_read(percpu_swap_cluster.si[0]);
-	pcp_offset = this_cpu_read(percpu_swap_cluster.offset[0]);
-	if (pcp_si == si && pcp_offset) {
-		ci = swap_cluster_lock(si, pcp_offset);
-		if (cluster_is_usable(ci, 0))
-			offset = alloc_swap_scan_cluster(si, ci, NULL, pcp_offset);
-		else
-			swap_cluster_unlock(ci);
-	}
-	if (!offset)
-		offset = cluster_alloc_swap_entry(si, NULL);
-	local_unlock(&percpu_swap_cluster.lock);
+	offset = cluster_alloc_swap_entry(si, NULL);
 	if (offset)
 		entry = swp_entry(si->type, offset);
 
@@ -3082,27 +3023,6 @@ static void free_swap_cluster_info(struct swap_cluster_info *cluster_info,
 	kvfree(cluster_info);
 }
 
-/*
- * Called after swap device's reference count is dead, so
- * neither scan nor allocation will use it.
- */
-static void flush_percpu_swap_cluster(struct swap_info_struct *si)
-{
-	int cpu, i;
-	struct swap_info_struct **pcp_si;
-
-	for_each_possible_cpu(cpu) {
-		pcp_si = per_cpu_ptr(percpu_swap_cluster.si, cpu);
-		/*
-		 * Invalidate the percpu swap cluster cache, si->users
-		 * is dead, so no new user will point to it, just flush
-		 * any existing user.
-		 */
-		for (i = 0; i < SWAP_NR_ORDERS; i++)
-			cmpxchg(&pcp_si[i], si, NULL);
-	}
-}
-
 SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 {
 	struct swap_info_struct *p = NULL;
@@ -3154,7 +3074,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 
 	flush_work(&p->discard_work);
 	flush_work(&p->reclaim_work);
-	flush_percpu_swap_cluster(p);
 
 	destroy_swap_extents(p, p->swap_file);
 
@@ -3175,6 +3094,8 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	percpu_up_write(&swapon_rwsem);
 	arch_swap_invalidate_area(p->type);
 	zswap_swapoff(p->type);
+	free_percpu(p->percpu_cluster);
+	p->percpu_cluster = NULL;
 	kfree(p->global_cluster);
 	p->global_cluster = NULL;
 	free_swap_cluster_info(cluster_info, maxpages);
@@ -3523,7 +3444,7 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 {
 	unsigned long nr_clusters = DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
 	struct swap_cluster_info *cluster_info;
-	int err = -ENOMEM;
+	int cpu, err = -ENOMEM;
 	unsigned long i;
 
 	cluster_info = kvzalloc_objs(*cluster_info, nr_clusters);
@@ -3533,13 +3454,26 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 	for (i = 0; i < nr_clusters; i++)
 		spin_lock_init(&cluster_info[i].lock);
 
-	if (!(si->flags & SWP_SOLIDSTATE)) {
+	if (si->flags & SWP_SOLIDSTATE) {
+		si->percpu_cluster = alloc_percpu(struct percpu_cluster);
+		if (!si->percpu_cluster)
+			goto err;
+
+		for_each_possible_cpu(cpu) {
+			struct percpu_cluster *cluster;
+
+			cluster = per_cpu_ptr(si->percpu_cluster, cpu);
+			for (i = 0; i < SWAP_NR_ORDERS; i++)
+				cluster->next[i] = SWAP_ENTRY_INVALID;
+			local_lock_init(&cluster->lock);
+		}
+	} else {
 		si->global_cluster = kmalloc_obj(*si->global_cluster);
 		if (!si->global_cluster)
 			goto err;
 		for (i = 0; i < SWAP_NR_ORDERS; i++)
 			si->global_cluster->next[i] = SWAP_ENTRY_INVALID;
-		spin_lock_init(&si->global_cluster_lock);
+		spin_lock_init(&si->global_cluster->lock);
 	}
 
 	/*
@@ -3708,11 +3642,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 
 	maxpages = si->max;
 
-	/* Set up the swap cluster info */
-	error = setup_swap_clusters_info(si, swap_header, maxpages);
-	if (error)
-		goto bad_swap_unlock_inode;
-
 	if (si->bdev && bdev_stable_writes(si->bdev))
 		si->flags |= SWP_STABLE_WRITES;
 
@@ -3726,6 +3655,15 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		inced_nr_rotate_swap = true;
 	}
 
+	/*
+	 * Set up the swap cluster info. This must run after SWP_SOLIDSTATE
+	 * is determined above, as it decides whether to allocate the per-CPU
+	 * cluster (solid state) or the global cluster (rotational).
+	 */
+	error = setup_swap_clusters_info(si, swap_header, maxpages);
+	if (error)
+		goto bad_swap_unlock_inode;
+
 	if ((swap_flags & SWAP_FLAG_DISCARD) &&
 	    si->bdev && bdev_max_discard_sectors(si->bdev)) {
 		/*
@@ -3807,6 +3745,8 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 bad_swap_unlock_inode:
 	inode_unlock(inode);
 bad_swap:
+	free_percpu(si->percpu_cluster);
+	si->percpu_cluster = NULL;
 	kfree(si->global_cluster);
 	si->global_cluster = NULL;
 	inode = NULL;
-- 
2.55.0

