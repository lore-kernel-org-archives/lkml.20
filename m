Received: from mta0.migadu.com (out-224.mta0.migadu.com [91.218.175.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA593B19B4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823984; cv=none; b=CKYR+X466MGKAFn0mCm8+zLd53Sj7TnY/nKIxQYsMMVDtS4+UB+H2+7AxfRpMcBj9Fq2Ttb6ckvX/53tXY+pNi1oSKULfdcbZB9hNyVeaCnADQ9oJOuFHd/a7D8vPpEhqWj/Bkgb2UdLnRkCqnHA+4QTdzPPqjr3HVbVBRizTcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823984; c=relaxed/simple;
	bh=4QMaK8pIwefYllhl8tVYISrvD4szXPyY60gTjx6CwyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-type; b=UYveOvGBZqyHKASnLh0ELWZWxd6s7umSTVWtgNPlmnY5smiF0yA4dkpCxxNdvvqkcrfs4vx6kVxYhloj6sOBbK29J7gVh1S7eYRXSZ2/dzlNaax3Oaiqq0LW1kUnGkWvVVKYxmGvAI/jx2Jl1QeAhG6jHffEFfdvX0F2DO+nbKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id e19cfcc88f543739;
	Thu, 27 Aug 2026 09:46:19 +0000
X-Mizu-Trace-ID: e19cfcc88f543739
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH 11/16] mm, swap: add adjustable runtime ceiling (nr_clusters) for xswap
Date: Thu, 27 Aug 2026 17:45:01 +0800
Message-ID: <20260827094509.1016740-12-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Split the xswap cluster limit into two fields:
- nr_clusters_max: immutable hard limit set at device creation
- nr_clusters: current growth ceiling, adjustable at runtime (<= nr_clusters_max)

The grow path already uses nr_clusters as the ceiling. Shrink now also
respects it: when nr_clusters drops below nr_clusters_mapped, shrinking
fires on free until the mapped count reaches the ceiling.  When
nr_clusters == nr_clusters_max (default), shrink is effectively
disabled - all growth and no shrink.

At creation, nr_clusters starts at nr_clusters_max (full size).

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |  3 ++-
 mm/swapfile.c        | 29 +++++++++++++++++++++--------
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index fea0005b9f51..c55af4a95ef7 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -250,7 +250,8 @@ struct swap_info_struct {
 	struct swap_cluster_info *cluster_info; /* cluster info. Only for SSD */
 #ifdef CONFIG_XSWAP
 	struct vm_struct	*cluster_vm;	/* VM_SPARSE area for xswap dynamic cluster_info */
-	unsigned long		nr_clusters;	/* total cluster count for xswap */
+	unsigned long		nr_clusters_max;/* upper limit from swap header */
+	unsigned long		nr_clusters;	/* current growth ceiling (≤ nr_clusters_max) */
 	unsigned long		nr_clusters_mapped; /* currently mapped cluster count */
 	unsigned long		nr_free_tail;	/* contiguous free clusters at tail */
 	struct mutex		xswap_lock;	/* serialize map/unmap operations */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 5235c6d07ab2..b2c3bb21f082 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3235,6 +3235,7 @@ static void free_swap_cluster_info(struct swap_info_struct *si)
 			xswap_unmap_clusters(si, 0, si->nr_clusters_mapped);
 		free_vm_area(si->cluster_vm);
 		si->cluster_vm = NULL;
+		si->nr_clusters_max = 0;
 		si->nr_clusters = 0;
 		si->nr_clusters_mapped = 0;
 		return;
@@ -4005,16 +4006,27 @@ static void xswap_trim_free_tail(struct swap_info_struct *si, unsigned long idx)
  */
 static void xswap_try_shrink(struct swap_info_struct *si)
 {
-	unsigned long start_idx, nr_unmap, i;
+	unsigned long nr_mapped, nr_ceiling, nr_tail, nr_unmap;
+	unsigned long start_idx, i;
 	struct swap_cluster_info *ci;
 
 	if (!(si->flags & SWP_XSWAP))
 		return;
-	if (si->nr_free_tail < XSWAP_GROW_CLUSTERS)
+
+	nr_mapped = READ_ONCE(si->nr_clusters_mapped);
+	nr_ceiling = READ_ONCE(si->nr_clusters);
+	nr_tail = READ_ONCE(si->nr_free_tail);
+
+	if (nr_mapped <= nr_ceiling)
+		return;
+	if (nr_tail < XSWAP_GROW_CLUSTERS)
 		return;
 
-	nr_unmap = round_down(si->nr_free_tail, XSWAP_GROW_CLUSTERS);
-	start_idx = si->nr_clusters_mapped - nr_unmap;
+	nr_unmap = min(round_down(nr_tail, XSWAP_GROW_CLUSTERS),
+		       nr_mapped - nr_ceiling);
+	if (nr_unmap < XSWAP_GROW_CLUSTERS)
+		return;
+	start_idx = nr_mapped - nr_unmap;
 
 	/*
 	 * Verify the tail clusters are still free before unmapping.  Count the
@@ -4023,7 +4035,7 @@ static void xswap_try_shrink(struct swap_info_struct *si)
 	 * leave a partial run off the free list if it proved too short to unmap.
 	 */
 	spin_lock(&si->lock);
-	for (i = start_idx; i < si->nr_clusters_mapped; i++) {
+	for (i = start_idx; i < nr_mapped; i++) {
 		ci = &si->cluster_info[i];
 		if (ci->flags != CLUSTER_FLAG_FREE)
 			break;
@@ -4042,7 +4054,7 @@ static void xswap_try_shrink(struct swap_info_struct *si)
 	spin_unlock(&si->lock);
 
 	xswap_unmap_clusters(si, start_idx, nr_unmap);
-	si->nr_free_tail -= nr_unmap;
+	WRITE_ONCE(si->nr_free_tail, nr_tail - nr_unmap);
 }
 #endif /* CONFIG_XSWAP */
 
@@ -4066,6 +4078,7 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 
 		cluster_info = vm->addr;
 		si->cluster_vm = vm;
+		si->nr_clusters_max = nr_clusters;
 		si->nr_clusters = nr_clusters;
 		si->cluster_info = cluster_info;
 
@@ -4103,6 +4116,8 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 			}
 		}
 
+		/* All mapped clusters except cluster 0 are free at the tail */
+		si->nr_free_tail = si->nr_clusters_mapped - 1;
 		return 0;
 
 err_unmap:
@@ -4595,7 +4610,6 @@ void __folio_throttle_swaprate(struct folio *folio, gfp_t gfp)
 static int __init swapfile_init(void)
 {
 	swapfile_maximum_size = arch_max_swapfile_size();
-
 	/*
 	 * Once a cluster is freed, it's swap table content is read
 	 * only, and all swap cache readers (swap_cache_*) verifies
@@ -4605,7 +4619,6 @@ static int __init swapfile_init(void)
 		swap_table_cachep = kmem_cache_create("swap_table",
 				    sizeof(struct swap_table),
 				    0, SLAB_PANIC | SLAB_TYPESAFE_BY_RCU, NULL);
-
 #ifdef CONFIG_MIGRATION
 	if (swapfile_maximum_size >= (1UL << SWP_MIG_TOTAL_BITS))
 		swap_migration_ad_supported = true;
-- 
2.54.0

