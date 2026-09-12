Received: from mta0.migadu.com (out-71.mta0.migadu.com [91.218.175.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A86C3839BA
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789242639; cv=none; b=rmM1t3yE/VJ8RYYh9cWpR8h6Ck33PQo+6twrrqbWMQblzUoe1vasG2N7A2RvFbAAItpSRiCSYv4ToSc32qrQSodRmTckVfFLk6fiWmCnbqzEHcR7c5xfUmnh7xqV0AYhO4DG04M3L+7tFHs1VscEOimF4RbXw61QPy6+gzKj5zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789242639; c=relaxed/simple;
	bh=rcCCDvJg7s0lNrlxdfI88914qsSv8cHU3Rj24hF9XNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hNcuaJD7uLAeR4libP1y3KWYVvhTOwopl5iulU/xeqGwAScKKMKrw7lEr6uwJEULksakiCuvFfg0bj3nYHl5CViEaGPPVDupfFDVZuo+S9svQlVbQwanEBZGeCcVH0E01ZZbjQe4mZdxDv2RNhqXULWkBM25iRKn4HxLOTlb5HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ngXyZ2G/; arc=none smtp.client-ip=91.218.175.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ngXyZ2G/"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rcCCDvJg7s0lNrlxdfI88914qsSv8cHU3Rj24hF9XNQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789242633; v=1; x=1789847433;
 b=ngXyZ2G/fF4sIXUGYWV90NrfDWOyUykMns44vhUh136e2hRV4kkgtxC7/LG9sEHXcLtE1gE2
 JhlLQ/xb2bH/lD8SVbShc3s6WsTOVMSYwgpjdqF/apku7EmZn7maAq2tVpxGQ3ZOTYEBaHmMhim
 PGhbJXVWkOT4bsmBlQIYt7nQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 8441b08db3422aef;
	Sat, 12 Sep 2026 19:50:33 +0000
X-Mizu-Trace-ID: 8441b08db3422aef
X-Migadu-Flow: FLOW_OUT
From: Ilya Gladyshev <ilya.gladyshev@linux.dev>
To: ilya.gladyshev@linux.dev
Cc: akpm@linux-foundation.org,
	andrew+netdev@lunn.ch,
	apopple@nvidia.com,
	artem.kuzin@huawei.com,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	Liam.Howlett@oracle.com,
	edumazet@google.com,
	harry.yoo@oracle.com,
	hramamurthy@google.com,
	ivgorbunov@me.com,
	joshwash@google.com,
	kirill@shutemov.name,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	muchun.song@linux.dev,
	pfalcato@suse.de,
	rppt@kernel.org,
	surenb@google.com,
	torvalds@linuxfoundation.org,
	vbabka@suse.cz,
	willy@infradead.org,
	yuzhao@google.com,
	ziy@nvidia.com
Subject: [PATCH v6 2/3] mm: drop page refcount zero state semantics
Date: Sat, 12 Sep 2026 22:50:09 +0300
Message-ID: <b3e54254a0ba7113700cd12ff673c98f1ba00390.1789239015.git.ilya.gladyshev@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789239015.git.ilya.gladyshev@linux.dev>
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some call sites manipulate page refcount directly based on its own
assumptions of the refcount int value. Instead of making such
assumptions these call sites should use high-level API like set_frozen()
or init_refcount().

This patch tries to consolidate all page refcount implementation details
inside mm headers. The main reason for this is the following patch that
will stop using zero value for frozen refcounts.

Refactor external refcount API:
- Introduce init/init_as_frozen functions and replace low-level
  refcount manipulations with them where applicable.
- Introduce page/folio_is_frozen().
   While page_ref_count() will always return zero for frozen pages,
   those functions allow more efficient (later) and more obvious code
   [1].
- Rename _unless_zero() into _unless_frozen() to deprecate zero value
  assumption.

Introduce debug asserts:
- VM_WARN_ON_ONCE() to prevent following scenarios:

page = alloc_frozen_page() /* page is frozen */
page_ref_inc(page, 1) /* BUG: Increment on frozen page instead of init */

[1]: https://lore.kernel.org/all/aqAIFV4nOGPbWiDS@thinkstation/

Reviewed-by: Artem Kuzin <artem.kuzin@huawei.com>
Co-developed-by: Ivan Gorbunov <ivgorbunov@me.com>
Signed-off-by: Ivan Gorbunov <ivgorbunov@me.com>
Signed-off-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
Acked-by: Bjorn Helgaas <bhelgaas@google.com> # p2pdma.c
---
 drivers/pci/p2pdma.c               |  4 +--
 drivers/virtio/virtio_mem.c        |  2 +-
 include/linux/mm.h                 |  2 +-
 include/linux/page_ref.h           | 43 +++++++++++++++++++++++++-----
 kernel/liveupdate/kexec_handover.c |  6 ++---
 lib/test_hmm.c                     |  4 +--
 mm/hugetlb.c                       |  2 +-
 mm/internal.h                      |  2 +-
 mm/memory-failure.c                |  8 +++---
 mm/memremap.c                      |  4 +--
 mm/mm_init.c                       |  6 ++---
 mm/page_alloc.c                    | 10 +++----
 mm/page_frag_cache.c               |  2 +-
 13 files changed, 62 insertions(+), 33 deletions(-)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 9334eb314663..2213214daa89 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -148,7 +148,7 @@ static int p2pmem_alloc_mmap(struct file *filp, struct kobject *kobj,
 		 * using it.
 		 */
 		VM_WARN_ON_ONCE_PAGE(page_ref_count(page), page);
-		set_page_count(page, 1);
+		init_page_count(page);
 		ret = vm_insert_page(vma, vaddr, page);
 		if (ret) {
 			gen_pool_free(p2pdma->pool, (uintptr_t)kaddr, len);
@@ -158,7 +158,7 @@ static int p2pmem_alloc_mmap(struct file *filp, struct kobject *kobj,
 			 * because we don't want to trigger the
 			 * p2pdma_folio_free() path.
 			 */
-			set_page_count(page, 0);
+			set_page_count_frozen(page);
 			percpu_ref_put(ref);
 			return ret;
 		}
diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index e18dd736f2ec..e282f5e048b9 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1293,7 +1293,7 @@ static void virtio_mem_fake_offline_cancel_offline(unsigned long pfn,
 	 * when going offline.
 	 */
 	for (i = 0; i < nr_pages; i++)
-		page_ref_inc(pfn_to_page(pfn + i));
+		init_page_count(pfn_to_page(pfn + i));
 }
 
 static void virtio_mem_online_page(struct virtio_mem *vm,
diff --git a/include/linux/mm.h b/include/linux/mm.h
index dd09c438fa23..dab5621ad8f7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1860,7 +1860,7 @@ static inline int folio_put_testzero(struct folio *folio)
  */
 static inline bool get_page_unless_zero(struct page *page)
 {
-	return page_ref_add_unless_zero(page, 1);
+	return page_ref_add_unless_frozen(page, 1);
 }
 
 static inline struct folio *folio_get_nontail_page(struct page *page)
diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
index 9f5c75d06f76..82ff3a99297a 100644
--- a/include/linux/page_ref.h
+++ b/include/linux/page_ref.h
@@ -62,6 +62,21 @@ static inline void __page_ref_unfreeze(struct page *page, int v)
 
 #endif
 
+static inline bool __page_count_is_frozen(int count)
+{
+	return count == 0;
+}
+
+static inline bool page_is_frozen(const struct page *page)
+{
+	return __page_count_is_frozen(atomic_read(&page->_refcount));
+}
+
+static inline bool folio_is_frozen(const struct folio *folio)
+{
+	return page_is_frozen(&folio->page);
+}
+
 static inline int page_ref_count(const struct page *page)
 {
 	return atomic_read(&page->_refcount);
@@ -119,9 +134,9 @@ static inline void set_page_count(struct page *page, int v)
 		__page_ref_set(page, v);
 }
 
-static inline void folio_set_count(struct folio *folio, int v)
+static inline void folio_init_count(struct folio *folio)
 {
-	set_page_count(&folio->page, v);
+	set_page_count(&folio->page, 1);
 }
 
 /*
@@ -133,8 +148,14 @@ static inline void init_page_count(struct page *page)
 	set_page_count(page, 1);
 }
 
+static inline void set_page_count_frozen(struct page *page)
+{
+	set_page_count(page, 0);
+}
+
 static inline void page_ref_add(struct page *page, int nr)
 {
+	VM_WARN_ON_ONCE_PAGE(page_is_frozen(page), page);
 	atomic_add(nr, &page->_refcount);
 	if (page_ref_tracepoint_active(page_ref_mod))
 		__page_ref_mod(page, nr);
@@ -147,6 +168,7 @@ static inline void folio_ref_add(struct folio *folio, int nr)
 
 static inline void page_ref_sub(struct page *page, int nr)
 {
+	VM_WARN_ON_ONCE_PAGE(page_is_frozen(page), page);
 	atomic_sub(nr, &page->_refcount);
 	if (page_ref_tracepoint_active(page_ref_mod))
 		__page_ref_mod(page, -nr);
@@ -160,6 +182,7 @@ static inline void folio_ref_sub(struct folio *folio, int nr)
 static inline int folio_ref_sub_return(struct folio *folio, int nr)
 {
 	int ret = atomic_sub_return(nr, &folio->_refcount);
+	VM_WARN_ON_ONCE_FOLIO(__page_count_is_frozen(ret + nr), folio);
 
 	if (page_ref_tracepoint_active(page_ref_mod_and_return))
 		__page_ref_mod_and_return(&folio->page, -nr, ret);
@@ -168,6 +191,7 @@ static inline int folio_ref_sub_return(struct folio *folio, int nr)
 
 static inline void page_ref_inc(struct page *page)
 {
+	VM_WARN_ON_ONCE_PAGE(page_is_frozen(page), page);
 	atomic_inc(&page->_refcount);
 	if (page_ref_tracepoint_active(page_ref_mod))
 		__page_ref_mod(page, 1);
@@ -180,6 +204,7 @@ static inline void folio_ref_inc(struct folio *folio)
 
 static inline void page_ref_dec(struct page *page)
 {
+	VM_WARN_ON_ONCE_PAGE(page_is_frozen(page), page);
 	atomic_dec(&page->_refcount);
 	if (page_ref_tracepoint_active(page_ref_mod))
 		__page_ref_mod(page, -1);
@@ -192,6 +217,7 @@ static inline void folio_ref_dec(struct folio *folio)
 
 static inline int page_ref_sub_and_test(struct page *page, int nr)
 {
+	VM_WARN_ON_ONCE_PAGE(page_is_frozen(page), page);
 	int ret = atomic_sub_and_test(nr, &page->_refcount);
 
 	if (page_ref_tracepoint_active(page_ref_mod_and_test))
@@ -207,6 +233,7 @@ static inline int folio_ref_sub_and_test(struct folio *folio, int nr)
 static inline int page_ref_inc_return(struct page *page)
 {
 	int ret = atomic_inc_return(&page->_refcount);
+	VM_WARN_ON_ONCE_PAGE(__page_count_is_frozen(ret - 1), page);
 
 	if (page_ref_tracepoint_active(page_ref_mod_and_return))
 		__page_ref_mod_and_return(page, 1, ret);
@@ -220,6 +247,7 @@ static inline int folio_ref_inc_return(struct folio *folio)
 
 static inline int page_ref_dec_and_test(struct page *page)
 {
+	VM_WARN_ON_ONCE_PAGE(page_is_frozen(page), page);
 	int ret = atomic_dec_and_test(&page->_refcount);
 
 	if (page_ref_tracepoint_active(page_ref_mod_and_test))
@@ -235,6 +263,7 @@ static inline int folio_ref_dec_and_test(struct folio *folio)
 static inline int page_ref_dec_return(struct page *page)
 {
 	int ret = atomic_dec_return(&page->_refcount);
+	VM_WARN_ON_ONCE_PAGE(__page_count_is_frozen(ret + 1), page);
 
 	if (page_ref_tracepoint_active(page_ref_mod_and_return))
 		__page_ref_mod_and_return(page, -1, ret);
@@ -246,7 +275,7 @@ static inline int folio_ref_dec_return(struct folio *folio)
 	return page_ref_dec_return(&folio->page);
 }
 
-static inline bool page_ref_add_unless_zero(struct page *page, int nr)
+static inline bool page_ref_add_unless_frozen(struct page *page, int nr)
 {
 	bool ret = atomic_add_unless(&page->_refcount, nr, 0);
 
@@ -255,9 +284,9 @@ static inline bool page_ref_add_unless_zero(struct page *page, int nr)
 	return ret;
 }
 
-static inline bool folio_ref_add_unless_zero(struct folio *folio, int nr)
+static inline bool folio_ref_add_unless_frozen(struct folio *folio, int nr)
 {
-	return page_ref_add_unless_zero(&folio->page, nr);
+	return page_ref_add_unless_frozen(&folio->page, nr);
 }
 
 /**
@@ -273,12 +302,12 @@ static inline bool folio_ref_add_unless_zero(struct folio *folio, int nr)
  */
 static inline bool folio_try_get(struct folio *folio)
 {
-	return folio_ref_add_unless_zero(folio, 1);
+	return folio_ref_add_unless_frozen(folio, 1);
 }
 
 static inline bool folio_ref_try_add(struct folio *folio, int count)
 {
-	return folio_ref_add_unless_zero(folio, count);
+	return folio_ref_add_unless_frozen(folio, count);
 }
 
 static inline int page_ref_freeze(struct page *page, int count)
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 7c4d86daf86d..b5966715bd95 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -487,7 +487,7 @@ EXPORT_SYMBOL_GPL(kho_radix_walk_tree);
 static void kho_init_pages(struct page *page, unsigned long nr_pages)
 {
 	for (unsigned long i = 0; i < nr_pages; i++) {
-		set_page_count(page + i, 1);
+		init_page_count(page + i);
 		/* Clear each page's codetag to avoid accounting mismatch. */
 		clear_page_tag_ref(page + i);
 	}
@@ -498,13 +498,13 @@ static void kho_init_folio(struct page *page, unsigned int order)
 	unsigned long nr_pages = (1 << order);
 
 	/* Head page gets refcount of 1. */
-	set_page_count(page, 1);
+	init_page_count(page);
 	/* Clear head page's codetag to avoid accounting mismatch. */
 	clear_page_tag_ref(page);
 
 	/* For higher order folios, tail pages get a page count of zero. */
 	for (unsigned long i = 1; i < nr_pages; i++)
-		set_page_count(page + i, 0);
+		set_page_count_frozen(page + i);
 
 	if (order > 0)
 		prep_compound_page(page, order);
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 6911daa9f854..8171711e3e7a 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1844,7 +1844,7 @@ static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
 	if (tail == NULL) {
 		folio_reset_order(rfolio);
 		rfolio->mapping = NULL;
-		folio_set_count(rfolio, 1);
+		folio_init_count(rfolio);
 		return;
 	}
 
@@ -1858,7 +1858,7 @@ static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
 
 	folio_page(tail, 0)->mapping = folio_page(head, 0)->mapping;
 	tail->pgmap = head->pgmap;
-	folio_set_count(page_folio(rpage_tail), 1);
+	folio_init_count(page_folio(rpage_tail));
 }
 
 static const struct dev_pagemap_ops dmirror_devmem_ops = {
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 4f6f58bf3db6..ec620e0440d3 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3173,7 +3173,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
 		__init_single_page(page, pfn, zone, nid);
 		prep_compound_tail(page, &folio->page, order);
-		set_page_count(page, 0);
+		set_page_count_frozen(page);
 	}
 }
 
diff --git a/mm/internal.h b/mm/internal.h
index 38b1165212c9..3ed6d747b4e4 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -661,7 +661,7 @@ static inline void set_page_refcounted(struct page *page)
 {
 	VM_BUG_ON_PAGE(PageTail(page), page);
 	VM_BUG_ON_PAGE(page_ref_count(page), page);
-	set_page_count(page, 1);
+	init_page_count(page);
 }
 
 static inline void set_pages_refcounted(struct page *page, unsigned long nr_pages)
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index a8b03e2920ba..8d89e01ba105 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -214,7 +214,7 @@ static bool page_handle_poison(struct page *page, bool hugepage_or_freepage, boo
 	SetPageHWPoison(page);
 	if (release)
 		put_page(page);
-	page_ref_inc(page);
+	init_page_count(page);
 	num_poisoned_pages_inc(page_to_pfn(page));
 
 	return true;
@@ -1166,7 +1166,7 @@ static int me_huge_page(struct page_state *ps, struct page *p)
 		 */
 		folio_put(folio);
 		if (__page_handle_poison(p) > 0) {
-			page_ref_inc(p);
+			init_page_count(p);
 			res = MF_RECOVERED;
 		} else {
 			res = MF_FAILED;
@@ -2132,7 +2132,7 @@ static int try_memory_failure_hugetlb(unsigned long pfn, int flags)
 	if (res == MF_HUGETLB_FREED) {
 		folio_unlock(folio);
 		if (__page_handle_poison(p) > 0) {
-			page_ref_inc(p);
+			init_page_count(p);
 			res = MF_RECOVERED;
 		} else {
 			res = MF_FAILED;
@@ -2462,7 +2462,7 @@ int memory_failure(unsigned long pfn, int flags)
 	case 0:
 		if (is_free_buddy_page(p)) {
 			if (take_page_off_buddy(p)) {
-				page_ref_inc(p);
+				init_page_count(p);
 				res = MF_RECOVERED;
 			} else {
 				/* We lost the race, try again */
diff --git a/mm/memremap.c b/mm/memremap.c
index accba23aef28..e1188122ba80 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -463,7 +463,7 @@ void free_zone_device_folio(struct folio *folio)
 		 * Reset the refcount to 1 to prepare for handing out the page
 		 * again.
 		 */
-		folio_set_count(folio, 1);
+		folio_init_count(folio);
 		break;
 
 	case MEMORY_DEVICE_FS_DAX:
@@ -520,7 +520,7 @@ void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
 	 * memunmap_pages().
 	 */
 	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
-	set_page_count(page, 1);
+	init_page_count(page);
 	lock_page(page);
 
 	if (order)
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 1533aebafb68..51d29ebe2074 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1013,7 +1013,7 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 	case MEMORY_DEVICE_PRIVATE:
 	case MEMORY_DEVICE_COHERENT:
 	case MEMORY_DEVICE_PCI_P2PDMA:
-		set_page_count(page, 0);
+		set_page_count_frozen(page);
 		break;
 
 	case MEMORY_DEVICE_GENERIC:
@@ -1066,7 +1066,7 @@ static void __ref memmap_init_compound(struct page *head,
 
 		__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
 		prep_compound_tail(page, head, order);
-		set_page_count(page, 0);
+		set_page_count_frozen(page);
 	}
 	prep_compound_head(head, order);
 }
@@ -2165,7 +2165,7 @@ void __init init_cma_reserved_pageblock(struct page *page)
 
 	do {
 		__ClearPageReserved(p);
-		set_page_count(p, 0);
+		set_page_count_frozen(p);
 	} while (++p, --i);
 
 	init_pageblock_migratetype(page, MIGRATE_CMA, false);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 12fac9084c48..2744e069862f 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1606,8 +1606,8 @@ void __meminit __free_pages_core(struct page *page, unsigned int order,
 
 	/*
 	 * When initializing the memmap, __init_single_page() sets the refcount
-	 * of all pages to 1 ("allocated"/"not free"). We have to set the
-	 * refcount of all involved pages to 0.
+	 * of all pages to 1 ("allocated"/"not free"). We have to freeze the
+	 * refcount of all involved pages.
 	 *
 	 * Note that hotplugged memory pages are initialized to PageOffline().
 	 * Pages freed from memblock might be marked as reserved.
@@ -1617,14 +1617,14 @@ void __meminit __free_pages_core(struct page *page, unsigned int order,
 		for (loop = 0; loop < nr_pages; loop++, p++) {
 			VM_WARN_ON_ONCE(PageReserved(p));
 			__ClearPageOffline(p);
-			set_page_count(p, 0);
+			set_page_count_frozen(p);
 		}
 
 		adjust_managed_page_count(page, nr_pages);
 	} else {
 		for (loop = 0; loop < nr_pages; loop++, p++) {
 			__ClearPageReserved(p);
-			set_page_count(p, 0);
+			set_page_count_frozen(p);
 		}
 
 		/* memblock adjusts totalram_pages() manually. */
@@ -6452,7 +6452,7 @@ void free_reserved_pages(struct page *page, unsigned int order)
 
 	for (i = 0; i < nr_pages; i++) {
 		clear_page_tag_ref(page + i);
-		set_page_count(page + i, 0);
+		set_page_count_frozen(page + i);
 		ClearPageReserved(page + i);
 	}
 	adjust_managed_page_count(page, nr_pages);
diff --git a/mm/page_frag_cache.c b/mm/page_frag_cache.c
index e63efe78b7d4..56d19b2dea06 100644
--- a/mm/page_frag_cache.c
+++ b/mm/page_frag_cache.c
@@ -143,7 +143,7 @@ void *__page_frag_alloc_align(struct page_frag_cache *nc,
 			goto refill;
 		}
 
-		/* OK, page count is 0, we can safely set it */
+		/* OK, page is frozen, we can safely set count */
 		set_page_count(page, PAGE_FRAG_CACHE_MAX_SIZE + 1);
 
 		/* reset page count bias and offset to start of new frag */
-- 
2.55.0

