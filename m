Received: from mta1.migadu.com (out-137.mta1.migadu.com [95.215.58.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4467641F5DA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823963; cv=none; b=Q65tum3kANb5vGVXk8qTSSMPjn6tf3FY1l4uTOCwgfaLVLGUpml16wwaB0F3rA2dUSZGLFh4QtpHPe4yFUtSo9agjRdARPXr7iyDp4DI5ikXQUnSsVlPeykvpQZnfZFaUmM2jIx6E4jgWxbXIMltSiHBNyvIv+DRRDfi84RpwUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823963; c=relaxed/simple;
	bh=HuHz5U3qLiAlQ1KmFRvsDo0xpxdZGb41joxZ9YCs+nM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-type; b=tIhxjTffxLx7+7GT7MaTSY1ADfEqnDimEmofXfgYBLeNRvvHIm7G5sn1OO3TsBSCZJdPYCSQqnhJ/e/2NiIGoIo0hv8rFphsfKs4C5JlbR8Sc2obP4CpMfv+2LyrlrBpf0R7gFN2rI7KehHZXDOTW6DELpUyNP0R8iumXHtnhNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id f679bda5c98230fc;
	Thu, 27 Aug 2026 09:45:58 +0000
X-Mizu-Trace-ID: f679bda5c98230fc
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
Subject: [PATCH 08/16] mm, swap: add xswap_try_shrink and shrink trigger on cluster free
Date: Thu, 27 Aug 2026 17:44:58 +0800
Message-ID: <20260827094509.1016740-9-hebaoquan@kylinos.cn>
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

Add xswap_try_shrink(), the shrink logic that scans backwards from
the tail to find contiguous free clusters, then unmaps full pages
when >= XSWAP_GROW_CLUSTERS free clusters accumulate.

Wire the trigger in __free_cluster(): after a cluster is released to
the free list, call xswap_try_shrink() to attempt tail shrinking.
Also update the XSWAP_GROW_CLUSTERS comment to reflect both grow
and shrink semantics.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 48 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index c6a01d74298a..6b18c1b21adc 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -53,11 +53,13 @@
 
 #ifdef CONFIG_XSWAP
 /*
- * xswap: dynamically grow the cluster_info array via a VM_SPARSE area.
+ * xswap: dynamically grow and shrink the cluster_info array via a
+ * VM_SPARSE area.
  *
- * XSWAP_GROW_CLUSTERS is the number of clusters to map in one grow
- * operation.  It is set to the number of cluster_info structs that
- * fit in a single page (at least 16), so that the vmalloc page table
+ * XSWAP_GROW_CLUSTERS is the number of clusters to map/unmap in one
+ * grow/shrink operation.  It is set to the number of cluster_info
+ * structs that fit in a single page (at least 16), so that the vmalloc
+ * page table
  * overhead is proportional to the number of clusters mapped.
  */
 #define XSWAP_GROW_CLUSTERS \
@@ -69,6 +71,7 @@ static int xswap_map_clusters(struct swap_info_struct *si,
 static void xswap_unmap_clusters(struct swap_info_struct *si,
 				 unsigned long start_idx, unsigned long nr);
 static int xswap_check_mapped(pte_t *pte, unsigned long addr, void *data);
+static void xswap_try_shrink(struct swap_info_struct *si);
 
 #ifdef CONFIG_SYSFS
 static int xswap_create(int percent);
@@ -697,6 +700,9 @@ static void __free_cluster(struct swap_info_struct *si, struct swap_cluster_info
 	swap_cluster_free_table(ci);
 	move_cluster(si, ci, &si->free_clusters, CLUSTER_FLAG_FREE);
 	ci->order = 0;
+#ifdef CONFIG_XSWAP
+	xswap_try_shrink(si);
+#endif
 }
 
 /*
@@ -3873,6 +3879,40 @@ static int xswap_check_mapped(pte_t *pte, unsigned long addr, void *data)
 {
 	return 1;
 }
+
+/*
+ * Try to shrink the cluster_info tail: unmap contiguous free clusters
+ * at the end of the mapped range.
+ */
+static void xswap_try_shrink(struct swap_info_struct *si)
+{
+	struct swap_cluster_info *ci;
+	unsigned long last, idx;
+
+	if (!(si->flags & SWP_XSWAP))
+		return;
+	if (READ_ONCE(si->nr_clusters_mapped) <= 1) /* keep cluster 0 */
+		return;
+
+	/* Find the last non-free cluster from the tail */
+	last = READ_ONCE(si->nr_clusters_mapped);
+	while (last > 1) {
+		idx = last - 1;
+		ci = &si->cluster_info[idx];
+		if (ci->count || ci->flags != CLUSTER_FLAG_FREE)
+			break;
+		last = idx;
+	}
+
+	if (last == si->nr_clusters_mapped)
+		return; /* nothing to shrink */
+
+	/* Only unmap if we can free at least one full page of clusters */
+	if (si->nr_clusters_mapped - last < XSWAP_GROW_CLUSTERS)
+		return;
+
+	xswap_unmap_clusters(si, last, si->nr_clusters_mapped - last);
+}
 #endif /* CONFIG_XSWAP */
 
 static int setup_swap_clusters_info(struct swap_info_struct *si,
-- 
2.54.0

