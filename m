Received: from mta0.migadu.com (out-59.mta0.migadu.com [91.218.175.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E10B4A4857
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554102; cv=none; b=UehfGsfsWU/qTPcRudtX9GoMsy+FxTYwjtuZpr1IGApddtuUJ4p11DCoxbWQFg0T01EMVVV8gbbKxMdOYJepa693XXyDFlPEyOhMJ06+rwlsLVUIGq8qnOB7wl+aXvyzWIbCGps4rdm7W1kUoNYFloMd6Vexvl4FDXcCUDjbXXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554102; c=relaxed/simple;
	bh=CAlNcB8919pfZFulTu4TOgmmav1vTd8i+vG2Hbaq4+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=GD5+VpYXfRinCcTqSXieV8RtpYMTbP7ruuet7D+BdqfFgQh433ie5GXE7INacusxzS5hZq8Kh+49MGQ+3qVYXbT2DSJBh5JVNqUYLQurtA8+Oaag7FXGEaf9/NofwGs6EvYD5p2BbSd6grbUOH/IBor42CrLhY5xTxNtc+kaKNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 3cf0af0f25f6a445;
	Wed, 16 Sep 2026 10:20:54 +0000
X-Mizu-Trace-ID: 3cf0af0f25f6a445
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
	kunwu.chan@gmail.com,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v3 08/14] mm, swap: free backing pages in xswap_unmap_clusters
Date: Wed, 16 Sep 2026 18:19:15 +0800
Message-ID: <20260916101929.149106-9-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916101929.149106-1-hebaoquan@kylinos.cn>
References: <20260916101929.149106-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

vm_area_unmap_pages() does not free the backing pages that
xswap_map_clusters() allocated, so they leaked on every unmap.

Collect the backing pages from the PTEs before unmapping and free them
after the PTEs are cleared. The collection array is allocated under
memalloc_noreclaim_save(); on failure, return -ENOMEM without unmapping.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 76 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 65 insertions(+), 11 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 2a03b13c0ed2..5b31aacb3ec5 100644
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
 
@@ -3343,9 +3343,14 @@ static void free_swap_cluster_info(struct swap_info_struct *si)
 			}
 			spin_unlock(&ci->lock);
 		}
-		/* Unmap all mapped clusters and free the VM_SPARSE area */
-		if (si->nr_clusters_mapped > 0)
-			xswap_unmap_clusters(si, 0, si->nr_clusters_mapped);
+		/*
+		 * free_vm_area() drops the mapping without freeing the pages,
+		 * so the unmap has to succeed first.  Retry; its only failure
+		 * is a transient -ENOMEM while collecting the backing pages.
+		 */
+		while (si->nr_clusters_mapped > 0 &&
+		       xswap_unmap_clusters(si, 0, si->nr_clusters_mapped))
+			cond_resched();
 		free_vm_area(si->cluster_vm);
 		si->cluster_vm = NULL;
 		si->cluster_info = NULL;
@@ -3988,21 +3993,44 @@ static int xswap_map_clusters(struct swap_info_struct *si,
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
 	unsigned long end_addr = start_addr + (size_t)nr * sizeof(struct swap_cluster_info);
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
@@ -4014,12 +4042,32 @@ static void xswap_unmap_clusters(struct swap_info_struct *si,
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
 
 	WRITE_ONCE(si->nr_clusters_mapped, start_idx);
 	mutex_unlock(&si->xswap_lock);
+	return 0;
 }
 
 /* Track the end of the run of pages that is already mapped. */
@@ -4152,7 +4200,13 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 		return 0;
 
 err_unmap:
-		xswap_unmap_clusters(si, 0, si->nr_clusters_mapped);
+		/*
+		 * Retry until the unmap succeeds.  Its only failure is a transient
+		 * -ENOMEM while collecting the backing pages.
+		 */
+		while (si->nr_clusters_mapped > 0 &&
+		       xswap_unmap_clusters(si, 0, si->nr_clusters_mapped))
+			cond_resched();
 err_free_vm:
 		free_vm_area(si->cluster_vm);
 		si->cluster_vm = NULL;
-- 
2.54.0

