Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497533;
	b=k/D8LLackNDU7T+lZvk3R2pWZ53uLGiNA/opaADKrKrcbA3En5+7vCNhAgi5KtQUBMux
	 F8PV1qQrlTGcysKNiR3gVuk+dBgnLHrAC2uImv6wT6yqt79L7OICIj6LWLjyvg+/jSD4A
	 hs6JO4H+rlwBNa8pvuafn5uim28XBru5KFXBalg4tiYvjo3RnLVkxQCIDFQklTCego2Dl
	 UxPcO2gmMBkzdSDF/biu+rZseqlLboyNMzyXwelcjVN6tsgne57x53BOgN/ENeQ9tLuLa
	 HRVi+EYGwRfYED7JHUoX8rKf1L8BM95/Cd7OZxLAmCMe3u5lInFBZhJpZALuASupSeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TBoGP42HYuQovRH5CMGdUoju18XjesMfphZvgEwtxv4=;
	b=HnwiOlSq6QOoQb8dkPDbCgtsZQkWCUErzQAR35HAobS+SjlhUe9qDv8trhfIyCKiC62p
	 4A6ymDvSkI6Uejb+DDAcqzTnHDypKuB9iUT7nXf2deRCqrk19RqAPbhUn7IDBdTwnKozu
	 xsam6LehcJCKmuEJBnFK0yYY+x/+2VgF+X9RJRN0m83CAsEt9GYbTYObJUxwXWdIP6Mk+
	 SY0B9QIIA9JbuK9DPcQhI9mfz0BxkeWE+pox1HJdpRG/3ZcpVmI8aRc3TKPuoHF9Tkg9Z
	 BUTH2tjUKaf9J4kEd1rpc+bkXnL3rHJElSoi9Ijk0iwJ+baBfkqfA8f6VN+1HMEm4Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MSCwSAUy;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A0C60A2617
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14A0C60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MSCwSAUy
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso4110a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792497532; x=1793102332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBoGP42HYuQovRH5CMGdUoju18XjesMfphZvgEwtxv4=;
        b=MSCwSAUy0f9TykSlxGc7tl/nrmTPVXROyMSrb5xac4aSdUSgkbXZnGosA0Ik9aG6O7
         CMTD0hqYhb0jInn+g5D3H9JKMn86Dk8/zpC4NN3MRm2SB/lULz/2iQyfzzb/ultJQj55
         HvuN906Ds5msIsOjVgCHDsqo+3MUQ43uNHw4C01yz0PNPyBiFeCg2DK6Httq0zZLxNTS
         /OKmrx7BQkR3Fk8WLaW49XpzLxnf4AKxf13h6ZCZlu/Rlk+hrp2Tghz4UnvqgoUL9nto
         08vszlgyoOCB20Wu/7/LU3pwOEHkfJYIn9OPsSWTu/05D9oXebPO3oDY4oV8bWJZnquU
         Fkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497532; x=1793102332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TBoGP42HYuQovRH5CMGdUoju18XjesMfphZvgEwtxv4=;
        b=lAdU1brc7iZ9XLWccmyY6t7cY8EbGNaBjbrU4G2YI3tUTsgha1CJ4PTr6RrmMJHccf
         wYkefWi0kAEpJnOayfjdkg8zrebxaq+3FBbiHVQFvKN7fj5ZwhVQEYG3locDZENZahTs
         fBL+0yb2SB2VvSBDRVLNTuzpqOuOdwW+e0ZwrMhwmi4tqy9yEsDkzYTil4EW+6U2gEFi
         AexG8Lya3Fy2RE19vLkDr/UQegb9DegaeuJkwYw00ZuWKetfsDeFZEY+n0opwI9s93k/
         5+hnsFtriYOUiRozFgodqkxkbHuUXUNmqApKmHxRN9vZYKD3NqZTVnT1Lv/E9TyXhHVN
         704g==
X-Forwarded-Encrypted: i=1; AKwUvBzNdwrqkUZMZow3i28ZAnlPI/n1ZWL5VQLm5qPf45lXdF7gAIYsXjmSWHTXMjlzZ5o9RI1zGmeca1/exIo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNzvBNLwRMrqg8yWptn8d0kFidqsyOPl9VqNM5bfWKqH/TT9lY
	Oeieheo1pNVFXVTzghy6qX+iMOlNc3RvYnS4O18yQM8KL09zpll27c4kcgz+aSR52ak=
X-Gm-Gg: AYBFou3zLmxDDhf5g1v1QND3Uo/duWkmwAr5iDoeEC2f/Y+m9v8xtXOtStn/4wEcaoC
	uutzM3qHfsRIqsGIWW85H1E7ohDubqC9x1eTnGunMfH8kI6Myq+8fylk6D+VVVPTmNttXM/8e3o
	HUGn1HwfWLPlc7lbi2JXCwrRZdeKbAEqW2lNp6hdLcoBQnfDSh1psFuoVflsV1ZkAVgFaq4QiMc
	Yo2UOV/WCY9R8V6XVQd7eBaRLxMCQgrZrZ113NX23RuJt4ge2h2713KJo5lJuKpMQjxZ0x4hfhp
	/HBIC/xXKcxRex0ennS7UGkkomaIudhHJHYc2Cegn30qyzYcsl1z5F+iEYbYPD1enJFhYIwo9md
	HctDFFArdmwFyolmWuagYdQfNGl/G3wLwn9tLMFF/0PwOSYVr3ye0A3H72ejAKwtvfmTFc9mEOr
	iiXYGjiehh7gOxc3iFuvYgAUY3ci1PrNe8M/bTiWamUEKcE5XqjyAPnW3QJLo70gbDlZdpAbzV5
	kOElGlMMKT7ZzKwppikXcRHUZ1M6DQ=
X-Received: by 2002:a17:90b:5112:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3acef0f47a8mr9218040a91.42.1792497532133;
        Tue, 20 Oct 2026 04:58:52 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60274fc1sm3448095a91.0.2026.10.20.04.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:58:51 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 07/12] mm: hugetlb_vmemmap: simplify shared tail page handling
Date: Tue, 20 Oct 2026 19:58:19 +0800
Message-ID: <20261020115824.823278-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020115824.823278-1-songmuchun@bytedance.com>
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The remap walker currently carries a shared tail page selected by its
caller, even though the optimize and restore callbacks can derive the
same information from the folio being processed.  This adds redundant
state to the walker and couples its interface to caller-side preparation.

Derive the shared mapping state in the callbacks instead, keeping the
mapping policy with the PTE being processed and simplifying the remap
interface.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/vmemmap-optimization.h |  6 +-
 mm/hugetlb_vmemmap.c                 | 89 ++++++++++++----------------
 mm/mm_init.c                         |  6 +-
 mm/sparse-vmemmap.c                  |  5 +-
 4 files changed, 49 insertions(+), 57 deletions(-)

diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
index 065840f3c241..858311a71b0c 100644
--- a/include/linux/vmemmap-optimization.h
+++ b/include/linux/vmemmap-optimization.h
@@ -91,11 +91,13 @@ static inline struct page *vmemmap_shared_tail_page(unsigned int order,
 }
 #endif /* CONFIG_VMEMMAP_OPTIMIZATION */
 
-static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
+static inline bool vmemmap_optimizable_pfn(unsigned long pfn, unsigned int order)
 {
-	const unsigned int order = pfn_to_section_compound_order(pfn);
 	const unsigned long nr_pages = 1UL << order;
 
+	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
+		return false;
+
 	if (!is_power_of_2(sizeof(struct page)))
 		return false;
 
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 18b72d553955..8fac61b7d74a 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -24,22 +24,18 @@
  * struct vmemmap_remap_walk - walk vmemmap page table
  *
  * @remap_pte:		called for each lowest-level entry (PTE).
- * @nr_walked:		the number of walked pte.
- * @vmemmap_tail:	the page to be installed as non-first in the vmemmap range
+ * @nr_walked:		the number of PTEs successfully remapped.
  * @vmemmap_pages:	the list head of the vmemmap pages that can be freed
  *			or is mapped from.
  * @flags:		used to modify behavior in vmemmap page table walking
  *			operations.
  */
 struct vmemmap_remap_walk {
-	void			(*remap_pte)(pte_t *pte, unsigned long addr,
+	int			(*remap_pte)(pte_t *pte, unsigned long addr,
 					     struct vmemmap_remap_walk *walk);
-
 	unsigned long		nr_walked;
-	struct page		*vmemmap_tail;
 	struct list_head	*vmemmap_pages;
 
-
 /* Skip the TLB flush while updating the vmemmap page tables. */
 #define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(0)
 	unsigned long		flags;
@@ -140,12 +136,14 @@ static int vmemmap_pmd_entry(pmd_t *pmd, unsigned long addr,
 static int vmemmap_pte_entry(pte_t *pte, unsigned long addr,
 			     unsigned long next, struct mm_walk *walk)
 {
+	int ret;
 	struct vmemmap_remap_walk *vmemmap_walk = walk->private;
 
-	vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
-	vmemmap_walk->nr_walked++;
+	ret = vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
+	if (!ret)
+		vmemmap_walk->nr_walked++;
 
-	return 0;
+	return ret;
 }
 
 static const struct mm_walk_ops vmemmap_remap_ops = {
@@ -213,51 +211,51 @@ static struct page *vmemmap_dup_page_from_list(const struct page *src,
 	return dst;
 }
 
-static void vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
-				 struct vmemmap_remap_walk *walk)
+static inline struct page *folio_vmemmap_shared_tail_page(const struct folio *folio)
 {
-	struct page *page = pte_page(ptep_get(pte));
-	pte_t entry;
-
-	/* Remapping the head page requires r/w */
-	if (unlikely(walk->nr_walked == 0)) {
-		struct page *head;
+	return vmemmap_shared_tail_page(folio_order(folio), folio_zone(folio));
+}
 
-		VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
+static int vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
+				struct vmemmap_remap_walk *walk)
+{
+	pte_t entry;
+	struct page *src = pte_page(ptep_get(pte)), *dst;
+	const struct page *page = (const struct page *)addr;
+	const struct folio *folio = page_folio(page);
 
-		head = vmemmap_dup_page_from_list(page, walk->vmemmap_pages);
-		entry = mk_pte(head, PAGE_KERNEL);
+	if (likely(vmemmap_optimizable_pfn(page_to_pfn(page), folio_order(folio)))) {
+		dst = folio_vmemmap_shared_tail_page(folio);
+		if (!dst)
+			return -ENOMEM;
+		/* Remap the shared tail page as read-only to catch illegal writes. */
+		entry = mk_pte(dst, PAGE_KERNEL_RO);
 	} else {
-		VM_WARN_ON_ONCE(!PageTail((const struct page *)addr));
-
-		/*
-		 * Remap the tail pages as read-only to catch illegal write
-		 * operation to the tail pages.
-		 */
-		entry = mk_pte(walk->vmemmap_tail, PAGE_KERNEL_RO);
+		dst = vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
+		entry = mk_pte(dst, PAGE_KERNEL);
 	}
 
-	list_add(&page->lru, walk->vmemmap_pages);
+	list_add(&src->lru, walk->vmemmap_pages);
 	set_pte_at(&init_mm, addr, pte, entry);
+
+	return 0;
 }
 
-static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
-				struct vmemmap_remap_walk *walk)
+static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
+			       struct vmemmap_remap_walk *walk)
 {
 	struct page *src = pte_page(ptep_get(pte)), *dst;
+	const struct page *page = (const struct page *)addr;
+	const struct folio *folio = page_folio(page);
 
-	/*
-	 * When rolling back vmemmap_remap_free(), keep the copied head page
-	 * mapping and restore only PTEs currently pointing at the shared tail
-	 * page.
-	 */
-	if (walk->vmemmap_tail && walk->vmemmap_tail != src)
-		return;
-
-	VM_WARN_ON_ONCE(PageHead((const struct page *)addr));
+	if (unlikely(!vmemmap_optimizable_pfn(page_to_pfn(page), folio_order(folio))))
+		return 0;
 
+	VM_WARN_ON_ONCE(folio_vmemmap_shared_tail_page(folio) != src);
 	dst = vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
 	set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
+
+	return 0;
 }
 
 /**
@@ -281,13 +279,11 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
 
 /**
  * vmemmap_remap_free - remap the vmemmap virtual address range [@start, @end)
- *			to use @vmemmap_head/tail, then free vmemmap which
- *			the range are mapped to.
+ *			to use the shared tail page.
  * @start:	start address of the vmemmap virtual address range that we want
  *		to remap.
  * @end:	end address of the vmemmap virtual address range that we want to
  *		remap.
- * @vmemmap_tail: the page to be installed as non-first in the vmemmap range
  * @vmemmap_pages: list to deposit vmemmap pages to be freed.  It is callers
  *		responsibility to free pages.
  * @flags:	modifications to vmemmap_remap_walk flags
@@ -295,14 +291,12 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
  * Return: %0 on success, negative error code otherwise.
  */
 static int vmemmap_remap_free(unsigned long start, unsigned long end,
-			      struct page *vmemmap_tail,
 			      struct list_head *vmemmap_pages,
 			      unsigned long flags)
 {
 	int ret;
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= vmemmap_optimize_pte,
-		.vmemmap_tail	= vmemmap_tail,
 		.vmemmap_pages	= vmemmap_pages,
 		.flags		= flags,
 	};
@@ -320,7 +314,6 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 	 */
 	walk = (struct vmemmap_remap_walk) {
 		.remap_pte	= vmemmap_restore_pte,
-		.vmemmap_tail	= vmemmap_tail,
 		.vmemmap_pages	= vmemmap_pages,
 		.flags		= 0,
 	};
@@ -494,7 +487,6 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 					    unsigned long flags)
 {
 	unsigned long vmemmap_start, vmemmap_end;
-	struct page *vmemmap_tail;
 	int nid, ret = 0;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
@@ -504,9 +496,6 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 		return ret;
 
 	nid = folio_nid(folio);
-	vmemmap_tail = vmemmap_shared_tail_page(h->order, folio_zone(folio));
-	if (!vmemmap_tail)
-		return -ENOMEM;
 
 	/*
 	 * Very Subtle
@@ -535,7 +524,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	 * they can be freed by the caller.
 	 */
 	ret = vmemmap_remap_free(vmemmap_start, vmemmap_end,
-				 vmemmap_tail, vmemmap_pages, flags);
+				 vmemmap_pages, flags);
 out:
 	if (ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 01ced0553ce9..0bb3fff4944e 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -896,6 +896,8 @@ void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone
 #endif
 
 	for (pfn = start_pfn; pfn < end_pfn; ) {
+		const unsigned int order = pfn_to_section_compound_order(pfn);
+
 		/*
 		 * There can be holes in boot-time mem_map[]s handed to this
 		 * function.  They do not exist on hotplugged memory.
@@ -911,9 +913,7 @@ void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone
 		 * Vmemmap-optimizable PFNs are backed by shared tail struct pages,
 		 * which have already been initialized during vmemmap population.
 		 */
-		if (vmemmap_optimizable_pfn(pfn)) {
-			const unsigned int order = pfn_to_section_compound_order(pfn);
-
+		if (vmemmap_optimizable_pfn(pfn, order)) {
 			pfn = min(ALIGN(pfn, 1UL << order), end_pfn);
 			continue;
 		}
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 40eba70c0048..107850b530f6 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -241,7 +241,7 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
 	struct page *page;
 	const unsigned int order = pfn_to_section_compound_order(pfn);
 
-	if (!vmemmap_optimizable_pfn(pfn))
+	if (!vmemmap_optimizable_pfn(pfn, order))
 		return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
 
 	/*
@@ -286,6 +286,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 {
 	pte_t *pte = pte_offset_kernel(pmd, addr);
 	unsigned long pfn = page_to_pfn((struct page *)addr);
+	const unsigned int order = pfn_to_section_compound_order(pfn);
 
 	if (pte_none(ptep_get(pte))) {
 		pte_t entry;
@@ -296,7 +297,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 
 		entry = pfn_pte(PHYS_PFN(__pa(p)), PAGE_KERNEL);
 		set_pte_at(&init_mm, addr, pte, entry);
-	} else if (WARN_ON_ONCE(vmemmap_optimizable_pfn(pfn)))
+	} else if (WARN_ON_ONCE(vmemmap_optimizable_pfn(pfn, order)))
 		return NULL;
 	return pte;
 }
-- 
2.54.0

