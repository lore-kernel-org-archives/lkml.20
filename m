Received: from mta0.migadu.com (out-143.mta0.migadu.com [91.218.175.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C8218A93F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987597; cv=none; b=u3UzuELg5S7qc0yzYl9tfjJMlQP4NCe7AY+LPqEjmfpaRqEbUV549UrESFUFiaW7LdNCcfm/7yna0TQM+zGXPj1qic3tHukymxnDFchI2XB6qVQLfZYOD95r0wborhzVNyJW//9SM7Bqt383NxQjKAcii3DhRynMiAWmCohSJgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987597; c=relaxed/simple;
	bh=2LWjOPseG+1Z9sJTNqjqfxZdDuqoL9fHy8UQwayK63c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=ZWjz/89dxH4MvY2MpbsS0POnkgbKzBHc6pzyDsng1pqdkAChsF7Z+KBKCkBgns5l8d0VJUye/BKfYuG+K+E97zy0+ijbRA23nsdzJEFZCwz7dkXfkyNCXeQFI4F+LE5qJOM/qownt/g6JKo4B0dYTQ+M0zJnKEw7EKLgWj28OTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 3b95ecdd6348a054;
	Sat, 03 Oct 2026 00:33:10 +0000
X-Mizu-Trace-ID: 3b95ecdd6348a054
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
Subject: [PATCH v4 12/14] mm, swap: widen swap_info_struct max/pages to unsigned long
Date: Sat,  3 Oct 2026 08:31:34 +0800
Message-ID: <20261003003136.750633-13-hebaoquan@kylinos.cn>
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

si->max and si->pages are unsigned int. This limits a swap device to
16 TB with 4 KB pages. read_swap_header() need to clamp the size to that
limit, and xswap_create() has the same clamp.

Change both fields to unsigned long. The clamp in read_swap_header() is
removed. The clamp in xswap_create() becomes a limit on the number of
clusters instead: a cluster index is an unsigned int, so the device can
hold at most UINT_MAX clusters. swapfile_maximum_size still limits how
much a swap area can address.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |  4 ++--
 mm/swapfile.c        | 57 +++++++++++++++++++++-----------------------
 2 files changed, 29 insertions(+), 32 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 12cdc00f78f9..c56adbbcfd3b 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -240,7 +240,7 @@ struct swap_info_struct {
 	signed short	prio;		/* swap priority of this type */
 	struct plist_node list;		/* entry in swap_active_head */
 	signed char	type;		/* strange name for an index */
-	unsigned int	max;		/* size of this swap device */
+	unsigned long	max;		/* size of this swap device */
 	struct swap_cluster_info *cluster_info; /* array, one entry per cluster */
 #ifdef CONFIG_XSWAP
 	struct vm_struct	*cluster_vm;	/* VM_SPARSE area for cluster_info */
@@ -255,7 +255,7 @@ struct swap_info_struct {
 					/* list of cluster that contains at least one free slot */
 	struct list_head frag_clusters[SWAP_NR_ORDERS];
 					/* list of cluster that are fragmented or contented */
-	unsigned int pages;		/* total of usable pages of swap */
+	unsigned long pages;		/* total of usable pages of swap */
 	atomic_long_t inuse_pages;	/* number of those currently in use */
 	struct swap_sequential_cluster *global_cluster; /* Use one global cluster for rotating device */
 	spinlock_t global_cluster_lock;	/* Serialize usage of global cluster */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 818b5a147b73..f823cebb7937 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -541,10 +541,10 @@ static inline unsigned int cluster_index(struct swap_info_struct *si,
 	return ci - si->cluster_info;
 }
 
-static inline unsigned int cluster_offset(struct swap_info_struct *si,
-					  struct swap_cluster_info *ci)
+static inline unsigned long cluster_offset(struct swap_info_struct *si,
+					   struct swap_cluster_info *ci)
 {
-	return cluster_index(si, ci) * SWAPFILE_CLUSTER;
+	return (unsigned long)cluster_index(si, ci) * SWAPFILE_CLUSTER;
 }
 
 static void swap_cluster_free_table_folio_rcu_cb(struct rcu_head *head)
@@ -948,7 +948,7 @@ static int swap_cluster_setup_bad_slot(struct swap_info_struct *si,
 
 	/* si->max may got shrunk by swap swap_activate() */
 	if (offset >= si->max && !mask) {
-		pr_debug("Ignoring bad slot %u (max: %u)\n", offset, si->max);
+		pr_debug("Ignoring bad slot %u (max: %lu)\n", offset, si->max);
 		return 0;
 	}
 	/*
@@ -1114,11 +1114,12 @@ static bool __swap_cluster_alloc_entries(struct swap_info_struct *si,
 }
 
 /* Try use a new cluster for current CPU and allocate from it. */
-static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
-					    struct swap_cluster_info *ci,
-					    struct folio *folio, unsigned long offset)
+static unsigned long alloc_swap_scan_cluster(struct swap_info_struct *si,
+					     struct swap_cluster_info *ci,
+					     struct folio *folio,
+					     unsigned long offset)
 {
-	unsigned int next = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
+	unsigned long next = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
 	unsigned long start = ALIGN_DOWN(offset, SWAPFILE_CLUSTER);
 	unsigned int order = likely(folio) ? folio_order(folio) : 0;
 	unsigned long end = start + SWAPFILE_CLUSTER;
@@ -1169,12 +1170,12 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 	return found;
 }
 
-static unsigned int alloc_swap_scan_list(struct swap_info_struct *si,
-					 struct list_head *list,
-					 struct folio *folio,
-					 bool scan_all)
+static unsigned long alloc_swap_scan_list(struct swap_info_struct *si,
+					  struct list_head *list,
+					  struct folio *folio,
+					  bool scan_all)
 {
-	unsigned int found = SWAP_ENTRY_INVALID;
+	unsigned long found = SWAP_ENTRY_INVALID;
 
 	do {
 		struct swap_cluster_info *ci = isolate_lock_cluster(si, list);
@@ -1261,7 +1262,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 {
 	struct swap_cluster_info *ci;
 	unsigned int order = likely(folio) ? folio_order(folio) : 0;
-	unsigned int offset = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
+	unsigned long offset = SWAP_ENTRY_INVALID, found = SWAP_ENTRY_INVALID;
 
 	/*
 	 * Swapfile is not block device so unable
@@ -1556,7 +1557,7 @@ static bool swap_alloc_fast(struct folio *folio, bool may_zswap)
 	unsigned int order = folio_order(folio);
 	struct swap_cluster_info *ci;
 	struct swap_info_struct *si;
-	unsigned int offset;
+	unsigned long offset;
 
 	/*
 	 * Once allocated, swap_info_struct will never be completely freed,
@@ -3010,8 +3011,8 @@ static int unuse_mm(struct mm_struct *mm, unsigned int type)
  * Return 0 if there are no inuse entries after prev till end of
  * the map.
  */
-static unsigned int find_next_to_unuse(struct swap_info_struct *si,
-					unsigned int prev)
+static unsigned long find_next_to_unuse(struct swap_info_struct *si,
+					unsigned long prev)
 {
 	struct swap_cluster_info *ci;
 	unsigned long i, cluster_end, end;
@@ -3081,7 +3082,7 @@ static int try_to_unuse(unsigned int type)
 	struct swap_info_struct *si = swap_info[type];
 	struct folio *folio;
 	swp_entry_t entry;
-	unsigned int i;
+	unsigned long i;
 
 	if (!swap_usage_in_pages(si))
 		goto success;
@@ -3950,12 +3951,8 @@ static unsigned long read_swap_header(struct swap_info_struct *si,
 		pr_warn("Truncating oversized swap area, only using %luk out of %luk\n",
 			K(maxpages), K(last_page));
 	}
-	if (maxpages > last_page) {
+	if (maxpages > last_page)
 		maxpages = last_page + 1;
-		/* p->max is an unsigned int: don't overflow it */
-		if ((unsigned int)maxpages == 0)
-			maxpages = UINT_MAX;
-	}
 
 	if (!maxpages)
 		return 0;
@@ -4550,9 +4547,9 @@ static int xswap_create(int prio)
 
 	ram = totalram_pages();
 	maxpages = min_t(unsigned long, ram * 2, swapfile_maximum_size);
-	/* si->max is an unsigned int: don't overflow it. */
-	if (maxpages > UINT_MAX)
-		maxpages = UINT_MAX;
+	/* A cluster index is an unsigned int, so cap the cluster count. */
+	if (maxpages / SWAPFILE_CLUSTER > UINT_MAX)
+		maxpages = (unsigned long)UINT_MAX * SWAPFILE_CLUSTER;
 	/* Cluster-aligned, so no cluster holds a slot past si->max. */
 	if (maxpages > SWAPFILE_CLUSTER)
 		maxpages = rounddown(maxpages, SWAPFILE_CLUSTER);
@@ -4585,8 +4582,8 @@ static int xswap_create(int prio)
 	si->avail_list.prio = -si->prio;
 	/* si->swap_file stays NULL: this is a file-less device */
 	enable_swap_info(si);
-	pr_info("xswap: adding extendable swap type %d (prio %d, %u pages, max %lu)\n",
-		si->type, prio, si->pages, maxpages);
+	pr_info("xswap: adding extendable swap type %d (prio %d, %lu pages)\n",
+		si->type, prio, si->pages);
 	mutex_unlock(&swapon_mutex);
 	atomic_inc(&proc_poll_event);
 	wake_up_interruptible(&proc_poll_wait);
@@ -4739,7 +4736,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		goto bad_swap_unlock_inode;
 	}
 	if (si->pages != si->max - 1) {
-		pr_err("swap:%u != (max:%u - 1)\n", si->pages, si->max);
+		pr_err("swap:%lu != (max:%lu - 1)\n", si->pages, si->max);
 		error = -EINVAL;
 		goto bad_swap_unlock_inode;
 	}
@@ -4830,7 +4827,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	/* Sets SWP_WRITEOK, resurrect the percpu ref, expose the swap device */
 	enable_swap_info(si);
 
-	pr_info("Adding %uk swap on %s.  Priority:%d extents:%d across:%lluk %s%s%s%s\n",
+	pr_info("Adding %luk swap on %s.  Priority:%d extents:%d across:%lluk %s%s%s%s\n",
 		K(si->pages), name->name, si->prio, nr_extents,
 		K((unsigned long long)span),
 		(si->flags & SWP_SOLIDSTATE) ? "SS" : "",
-- 
2.54.0

