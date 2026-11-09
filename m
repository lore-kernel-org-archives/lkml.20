Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203770;
	b=UV9C6jpiBbeovTETuyAjopugBN0WUzUaExf3P2ohNT5IQ7jiC9WHmpIiPoPU7wMRiuAs
	 NLl3DJi1DA7iTa7Y4eRfFBWkY9+IHUnb10OBvgxR1MQlPQxyvbsgE5aBu5oriBXcH9dIV
	 KtLyqoIM832a7ZYWBybRvB88sJgaE9Hc0822oWIEko6XmXs8fMFsr7kKzbllvB1XBS+QD
	 fvBtba6GL158bM6oKFBLjNZmzVUxUs42HUMaUFU2YOeDO45IKh9MOdxoCau2Mck7CWw7C
	 9sJDt2GrCgofCYyaMsSpnpBGMn0FfbSOJ9GAYJktMY2l5Vm/ucqjKtGeHjOh8CNVTHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203770;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=i3UFqlD1TFmjJCwgL5tSxyi3wQ9tXt9xXYoF+UX/60A=;
	b=Fb+VA3AH0+Z8XgtgAQ71u/tW/DdNZV/s4v7QYTD6LCxnBBzOYcSUrVi1BczvK1IxHG3l
	 pxETGen6U6jCEzyfvnTUzvEz+hPtvL0vJYqYAHF47kXlX8w64F+aZsLIsniGAXzHvD7kv
	 rDLJ4bUcf2w/ex6NghvC8FzXH6Vo8v5M4qshECRXdvgnQQcSgyFHP33mV4WoIgcN+8ZdB
	 gWEOqTn9Gop2Ng5NGPpsmQt3qNAkKGo0BsEFCkk9i5bFFs5Jd/BIQFsKgi66ip+KKNtOn
	 QTA7dD+lzjU6oDBZ+geJYSKz+a6UKtxhPeOwS+CZZV2pK3enqY1S1CaI8FA36mdQUdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HzXCYn9e;
	arc=none smtp.remote-ip=95.215.58.164
Received: from mta1.migadu.com (out-164.mta1.migadu.com [95.215.58.164])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7269F606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7269F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HzXCYn9e
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OF83+fcPJVloecqy+7k3LSEYtGZ3TgilD3z7GhpDFqI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203767; v=1; x=1794808567;
 b=HzXCYn9ed/CSifcz2HrbMsY7yB/DAJ7qIDmKUjEEVv5mdxJ+2LyuV/ynhA/JjjFWlnwiJO/n
 BAFlcaDaMcRL4WDpaMwHPu7TioCTwkgJNLBOfb0Q8maDjuZ1ieLwVc3XQY9yDBerp6G9xORbH7X
 0II7TfvfjPCnij7tusLyMqbw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 040407fe406acb30;
	Mon, 09 Nov 2026 05:56:07 +0000
X-Mizu-Trace-ID: 040407fe406acb30
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <baoquan.he@linux.dev>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	corbet@lwn.net,
	hannes@cmpxchg.org,
	chengming.zhou@linux.dev,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v5 04/19] mm, swap: use a VM_SPARSE cluster array for xswap devices
Date: Mon,  9 Nov 2026 13:54:40 +0800
Message-ID: <20261109055455.536925-5-baoquan.he@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109055455.536925-1-baoquan.he@linux.dev>
References: <20261109055455.536925-1-baoquan.he@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Baoquan He <hebaoquan@kylinos.cn>

An xswap device does not have to allocate cluster_info for its whole
address space at once. Back it with a VM_SPARSE area and map it in
chunks. At setup, map only the first chunk. The grow path maps more
chunks when they are needed.

Setup, free, and the two cluster_info scans must change together. If
only setup changes, free would free the wrong object, and the scans
would read cluster_info entries that are not mapped yet.

The map helper rejects a stale start_idx and cleans up a partial mapping
if it fails. The grow path added later depends on this check.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 152 ++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 141 insertions(+), 11 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index afd0e8718544..00c7b398bafe 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -50,6 +50,17 @@
 #include "swap.h"
 
 #ifdef CONFIG_XSWAP
+/*
+ * xswap: dynamically grow the cluster_info array via a VM_SPARSE area.
+ *
+ * XSWAP_GROW_CLUSTERS is the number of clusters to map in one grow
+ * operation.  It is set to the number of cluster_info structs that
+ * fit in a single page (at least 16), so that the vmalloc page table
+ * overhead is proportional to the number of clusters mapped.
+ */
+#define XSWAP_GROW_CLUSTERS \
+	max_t(unsigned long, PAGE_SIZE / sizeof(struct swap_cluster_info), 16)
+
 /* Batch size for the fallback unmap; keeps the stack array small. */
 #define XSWAP_UNMAP_BATCH_PAGES		16
 #define XSWAP_UNMAP_BATCH_CLUSTERS					\
@@ -2825,10 +2836,27 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 					unsigned int prev)
 {
 	struct swap_cluster_info *ci;
-	unsigned long i, end;
+	unsigned long i, cluster_end, end;
 	unsigned int ci_off;
 	unsigned long swp_tb;
 
+	end = si->max;
+#ifdef CONFIG_XSWAP
+	/*
+	 * An xswap device maps its cluster_info in chunks as it grows, so
+	 * the tail past nr_clusters_mapped has nothing behind it.
+	 */
+	if (si->flags & SWP_XSWAP) {
+		unsigned long mapped_end;
+
+		/* Pairs with the smp_store_release() in xswap_map_clusters(). */
+		mapped_end = smp_load_acquire(&si->nr_clusters_mapped) *
+			     SWAPFILE_CLUSTER;
+		if (mapped_end < end)
+			end = mapped_end;
+	}
+#endif
+
 	/*
 	 * No need for swap_lock here: we're just looking
 	 * for whether an entry is in use, not modifying it; false
@@ -2836,11 +2864,11 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 	 * allocations from this area (while holding swap_lock).
 	 */
 	i = prev + 1;
-	while (i < si->max) {
+	while (i < end) {
 		ci = __swap_offset_to_cluster(si, i);
-		end = min_t(unsigned long,
-			    ALIGN_DOWN(i, SWAPFILE_CLUSTER) + SWAPFILE_CLUSTER,
-			    si->max);
+		cluster_end = min_t(unsigned long,
+				    ALIGN_DOWN(i, SWAPFILE_CLUSTER) + SWAPFILE_CLUSTER,
+				    end);
 
 		/*
 		 * An empty cluster has no slot in use, so skip it whole.
@@ -2850,13 +2878,13 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 		 * enough, unlike in every other cluster_is_empty() caller.
 		 */
 		if (!READ_ONCE(ci->count)) {
-			i = end;
+			i = cluster_end;
 			cond_resched();
 			continue;
 		}
 
 		ci_off = i % SWAPFILE_CLUSTER;
-		for (; i < end; ci_off++, i++) {
+		for (; i < cluster_end; ci_off++, i++) {
 			swp_tb = swap_table_get(ci, ci_off);
 			if (!swp_tb_is_null(swp_tb) && !swp_tb_is_bad(swp_tb))
 				return i;
@@ -2866,7 +2894,6 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 
 	return 0;
 }
-
 static int try_to_unuse(unsigned int type)
 {
 	struct mm_struct *prev_mm;
@@ -3164,6 +3191,14 @@ static void wait_for_allocation(struct swap_info_struct *si)
 
 	BUG_ON(si->flags & SWP_WRITEOK);
 
+#ifdef CONFIG_XSWAP
+	if (si->flags & SWP_XSWAP) {
+		/* Pairs with the smp_store_release() in xswap_map_clusters(). */
+		end = min(end, smp_load_acquire(&si->nr_clusters_mapped) *
+			  SWAPFILE_CLUSTER);
+	}
+#endif
+
 	for (offset = 0; offset < end; offset += SWAPFILE_CLUSTER) {
 		ci = swap_cluster_lock(si, offset);
 		swap_cluster_unlock(ci);
@@ -3175,11 +3210,43 @@ static void free_swap_cluster_info(struct swap_info_struct *si)
 	struct swap_cluster_info *cluster_info = si->cluster_info;
 	unsigned long maxpages = si->max;
 	struct swap_cluster_info *ci;
-	int i, nr_clusters;
+	unsigned long i, nr_clusters;
 
 	if (!cluster_info)
 		return;
 
+#ifdef CONFIG_XSWAP
+	if (si->flags & SWP_XSWAP) {
+		unsigned long nr_mapped;
+
+		/*
+		 * Cluster 0 keeps the bad header slot, so it never empties
+		 * and __free_cluster() never frees its table.
+		 */
+		/* Pairs with the smp_store_release() in xswap_map_clusters(). */
+		nr_mapped = smp_load_acquire(&si->nr_clusters_mapped);
+		for (i = 0; i < nr_mapped; i++) {
+			ci = &cluster_info[i];
+			spin_lock(&ci->lock);
+			if (cluster_table_is_alloced(ci)) {
+				swap_cluster_assert_empty(ci, 0, SWAPFILE_CLUSTER, true);
+				swap_cluster_free_table(ci);
+			}
+			spin_unlock(&ci->lock);
+		}
+		/*
+		 * free_vm_area() drops the mapping without freeing the
+		 * pages, and the unmap helper handles an empty range.
+		 */
+		xswap_unmap_clusters(si, 0, si->nr_clusters_mapped);
+		free_vm_area(si->cluster_vm);
+		si->cluster_vm = NULL;
+		si->cluster_info = NULL;
+		si->nr_clusters_mapped = 0;
+		return;
+	}
+#endif
+
 	nr_clusters = DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
 	for (i = 0; i < nr_clusters; i++) {
 		ci = cluster_info + i;
@@ -3678,7 +3745,7 @@ static unsigned long read_swap_header(struct swap_info_struct *si,
 }
 
 #ifdef CONFIG_XSWAP
-static int __maybe_unused xswap_map_clusters(struct swap_info_struct *si,
+static int xswap_map_clusters(struct swap_info_struct *si,
 			      unsigned long start_idx, unsigned long nr)
 {
 	unsigned long start_addr = (unsigned long)si->cluster_info +
@@ -3824,7 +3891,7 @@ static void xswap_unmap_range(struct swap_info_struct *si,
 }
 
 /* Caller must hold si->xswap_lock.  Cannot fail. */
-static void __maybe_unused xswap_unmap_clusters(struct swap_info_struct *si,
+static void xswap_unmap_clusters(struct swap_info_struct *si,
 				 unsigned long start_idx, unsigned long nr)
 {
 	unsigned long start_addr = (unsigned long)si->cluster_info +
@@ -3902,6 +3969,69 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 	int err = -ENOMEM;
 	unsigned long i;
 
+#ifdef CONFIG_XSWAP
+	if (si->flags & SWP_XSWAP) {
+		unsigned long size = PAGE_ALIGN(nr_clusters * sizeof(*cluster_info));
+		struct vm_struct *vm;
+
+		vm = get_vm_area(size, VM_SPARSE);
+		if (!vm)
+			goto err;
+
+		cluster_info = vm->addr;
+		si->cluster_vm = vm;
+		si->nr_clusters_max = nr_clusters;
+		si->cluster_info = cluster_info;
+
+		/* Must be initialized before xswap_map_clusters() locks it. */
+		mutex_init(&si->xswap_lock);
+
+		if (xswap_map_clusters(si, 0, min_t(unsigned long,
+					XSWAP_GROW_CLUSTERS, nr_clusters)))
+			goto err_free_vm;
+
+		/* xswap: only cluster 0 slot 0 is bad */
+		err = swap_cluster_setup_bad_slot(si, cluster_info, 0, false);
+		if (err)
+			goto err_unmap;
+
+		INIT_LIST_HEAD(&si->free_clusters);
+		INIT_LIST_HEAD(&si->full_clusters);
+		INIT_LIST_HEAD(&si->discard_clusters);
+		for (i = 0; i < SWAP_NR_ORDERS; i++) {
+			INIT_LIST_HEAD(&si->nonfull_clusters[i]);
+			INIT_LIST_HEAD(&si->frag_clusters[i]);
+		}
+
+		/*
+		 * Cluster 0 holds the header slot, which is marked bad, so it
+		 * is not entirely free.  si->max is cluster aligned, so no
+		 * cluster holds a slot past the end of the device.
+		 */
+		for (i = 0; i < si->nr_clusters_mapped; i++) {
+			struct swap_cluster_info *ci = &cluster_info[i];
+
+			if (ci->count) {
+				ci->flags = CLUSTER_FLAG_NONFULL;
+				list_add_tail(&ci->list, &si->nonfull_clusters[0]);
+			} else {
+				ci->flags = CLUSTER_FLAG_FREE;
+				list_add_tail(&ci->list, &si->free_clusters);
+			}
+		}
+
+		return 0;
+
+err_unmap:
+		xswap_unmap_clusters(si, 0, si->nr_clusters_mapped);
+err_free_vm:
+		free_vm_area(si->cluster_vm);
+		si->cluster_vm = NULL;
+		si->cluster_info = NULL;
+		return err;
+	}
+#endif /* CONFIG_XSWAP */
+
 	cluster_info = kvzalloc_objs(*cluster_info, nr_clusters);
 	if (!cluster_info)
 		goto err;
-- 
2.54.0

