Received: from mta0.migadu.com (out-116.mta0.migadu.com [91.218.175.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E06137DE9B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789285866; cv=none; b=mFJ0pqybI+59VQFrUyMg+JbEBD5ZlxJjFVkMlqPlqNvIlftzeElLNin5UxJ+r42BcARCozJTEsmDWjQhjHslcCIOafAg7NUPoYEoVp81KonbfvNMyg1DHCerCDmAYbAZGs6YFz9Wk2MyhdpupdPMdacVZaG3xe+qdVxgBX6SkxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789285866; c=relaxed/simple;
	bh=xsn5ZwageQR4iqD8ODxx/w1/hFant5h+/mREviLD8f4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=m8vsXvNipdKNEQ0idBkXxoc/F+BQR6VguBvML1tbMpn3GAthx9hiM3XGlqWLDXQzLp2d+dlT1noW4rtR4WEzKUtg0rtSenGaeGKMR8MYP/GVBOeQwuC3pm4BkGYxttE0YElLY8zsIyowwIMU/21tvnD06/J/Z9rfngmbV1d0ZQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 6d94a1b0bd75a97d;
	Sun, 13 Sep 2026 07:51:02 +0000
X-Mizu-Trace-ID: 6d94a1b0bd75a97d
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
Subject: [PATCH v2 08/12] mm, swap: free backing pages in xswap_unmap_clusters
Date: Sun, 13 Sep 2026 15:50:10 +0800
Message-ID: <20260913075014.1732524-9-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260913075014.1732524-1-hebaoquan@kylinos.cn>
References: <20260913075014.1732524-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

vm_area_unmap_pages() clears PTEs and frees intermediate page table
pages. It does not free the backing physical pages that
xswap_map_clusters() allocated. Those pages were leaked on every
unmap.

Collect the backing pages before the unmap. Walk the page table with
apply_to_existing_page_range() and a small callback that stores
pte_page() of every present PTE into a dynamically allocated array.
After vm_area_unmap_pages() clears the PTEs, free the collected pages
with __free_page().

The array allocation runs under memalloc_noreclaim_save(). Reclaim
must not recurse into the caller, which holds xswap_lock. If the
allocation fails, return -ENOMEM without unmapping, so that no backing
page is leaked.

xswap_unmap_clusters() now returns an error code.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 57 ++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 7 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index abe3d0ee5aba..e10bb6d245fe 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -67,8 +67,8 @@
 
 static int xswap_map_clusters(struct swap_info_struct *si,
 			      unsigned long start_idx, unsigned long nr);
-static void xswap_unmap_clusters(struct swap_info_struct *si,
-				 unsigned long start_idx, unsigned long nr);
+static int xswap_unmap_clusters(struct swap_info_struct *si,
+				unsigned long start_idx, unsigned long nr);
 static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data);
 static void xswap_try_shrink(struct swap_info_struct *si);
 
@@ -3889,8 +3889,26 @@ static int xswap_map_clusters(struct swap_info_struct *si,
 	return -ENOMEM;
 }
 
-static void xswap_unmap_clusters(struct swap_info_struct *si,
-				 unsigned long start_idx, unsigned long nr)
+struct xswap_page_data {
+	struct page **pages;
+	int nr;
+	int max;
+};
+
+static int xswap_collect_page(pte_t *pte, unsigned long addr, void *data)
+{
+	struct xswap_page_data *xpd = data;
+	pte_t pteval = ptep_get(pte);
+
+	if (!pte_present(pteval))
+		return 0;
+	if (xpd->nr < xpd->max)
+		xpd->pages[xpd->nr++] = pte_page(pteval);
+	return 0;
+}
+
+static int xswap_unmap_clusters(struct swap_info_struct *si,
+				unsigned long start_idx, unsigned long nr)
 {
 	unsigned long start_addr = (unsigned long)si->cluster_info +
 				   (size_t)start_idx * sizeof(struct swap_cluster_info);
@@ -3898,13 +3916,18 @@ static void xswap_unmap_clusters(struct swap_info_struct *si,
 	/* Round to page boundaries for vm_area_unmap_pages(). */
 	unsigned long vm_start = PAGE_ALIGN(start_addr);
 	unsigned long vm_end = PAGE_ALIGN(end_addr);
+	unsigned long size;
+	unsigned long npages;
+	struct xswap_page_data xpd;
+	unsigned int noreclaim_flags;
+	int i;
 
 	mutex_lock(&si->xswap_lock);
 
 	if (vm_start >= vm_end) {
 		WRITE_ONCE(si->nr_clusters_mapped, start_idx);
 		mutex_unlock(&si->xswap_lock);
-		return;
+		return 0;
 	}
 
 	/*
@@ -3916,13 +3939,33 @@ static void xswap_unmap_clusters(struct swap_info_struct *si,
 	flush_percpu_swap_cluster(si);
 	synchronize_rcu();
 
+	size = vm_end - vm_start;
+	npages = size >> PAGE_SHIFT;
+
+	noreclaim_flags = memalloc_noreclaim_save();
+	xpd.pages = kmalloc_array(npages, sizeof(*xpd.pages),
+				  __GFP_HIGH | __GFP_NOMEMALLOC | GFP_KERNEL);
+	memalloc_noreclaim_restore(noreclaim_flags);
+	if (!xpd.pages) {
+		mutex_unlock(&si->xswap_lock);
+		return -ENOMEM;
+	}
+
+	xpd.nr = 0;
+	xpd.max = npages;
+	apply_to_existing_page_range(&init_mm, vm_start, size,
+				     xswap_collect_page, &xpd);
+
 	vm_area_unmap_pages(si->cluster_vm, vm_start, vm_end);
-	/* vm_area_unmap_pages() clears PTEs but does not free pages. */
-	/* TODO: free backing pages via page table walk or tracking bitmap */
+
+	for (i = 0; i < xpd.nr; i++)
+		__free_page(xpd.pages[i]);
+	kfree(xpd.pages);
 
 	/* Pairs with READ_ONCE() in shrink/grow paths. */
 	WRITE_ONCE(si->nr_clusters_mapped, start_idx);
 	mutex_unlock(&si->xswap_lock);
+	return 0;
 }
 
 /* Track the end of the run of pages that is already mapped. */
-- 
2.54.0

