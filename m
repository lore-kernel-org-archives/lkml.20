Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722047;
	b=q+jtqunfru7b9EMEspLsvJs4dI1PSYGss6SeO70qY6grPR8gD9zxmcNgHCo83t1FIUgm
	 CpwTJY4bh4QkVwHclj4e376dvHgVk+GLP06ErRa91moLelPoNK8xZfEmP3OXRVQpTh+Qh
	 GILgRqZ7rgG6VZyK6mGsDrnV6nSFeErH1e1CXaIko5UoQpOutSmu9Rtdfvx9fSuvhEIfu
	 Y6m+5aeXzfsSzJshpBL/Th9pHAncHw/WegnMhBow7R2vc+AV4srcrHHzZI2ptLlZjQ4yL
	 tgHnr8aFUA7LQP53d8o32oQq2lvtZhvTOA4WXkPpsZ2e04uDL9G51PpZKp3qcMszIPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722047;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lJj29YZXaCltYYYPax9FC2PzbE2sg7jlrCg6+nh2uVo=;
	b=UVR73ScV8sskQH3HdR4oZJCj43LZXqopzP4GJQBcWhwLVs6xzwwOwYI3C16GcXUVSXNE
	 wM0U7kyvkBjtzG+/23FwtkivCNX70kv+GCS/rmwiCQSeOX/fNOiaRCuX65DiNi3bJIKdX
	 SsdLMtbMfEjpAw342n8CaogciX3Zpw8u9lvA8BJUUKzlebE0CYC4UXRUl5kwiSaZFhc+9
	 MOWCXEwYMFKBNkVpQYWFXfhxQ2aXQ7+BwXcC9s74gz8cinoTXjEWTJJEtlk0sm6nVV8ok
	 qQAjTafwa0opEupTFe/1KISA7f50oEV4obMG09MdDcv5wtNTbPAhmqzUrwP2m7x+PDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mpcgfXNM;
	arc=none smtp.remote-ip=95.215.58.168
Received: from mta1.migadu.com (out-168.mta1.migadu.com [95.215.58.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EBD606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61EBD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mpcgfXNM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KJhxT0fyggms2ovfhLdLIeLX39g35Kvjs17mmy9bPQA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792722044; v=1; x=1793326844;
 b=mpcgfXNMu0x+jvYFUegMNisiZHTA7U5VJQuxsqJx9DxvrDC9rWnOsMF8jVDAcEzWRqHQInmY
 ILVFEGtQ1rWT+0pK8FKnq2ga7gW3XJcRLITdMPN4aoTbz7TwHAid4Fu1v5E9006fe0wItbUAuW0
 QctmqteRJeFY8uqr7yKYrMyo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 559e8641fd3a77b7;
	Fri, 23 Oct 2026 02:20:33 +0000
X-Mizu-Trace-ID: 559e8641fd3a77b7
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: osalvador@suse.de,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	lance.yang@linux.dev,
	jthoughton@google.com,
	david@kernel.org,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/12] mm: hugetlb_vmemmap: simplify shared tail page handling
Date: Fri, 23 Oct 2026 10:20:27 +0800
Message-ID: <20261023022027.25898-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261020115824.823278-6-songmuchun@bytedance.com>
References: <20261020115824.823278-6-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Oct 20, 2026 at 07:58:19PM +0800, Muchun Song wrote:
>The remap walker currently carries a shared tail page selected by its
>caller, even though the optimize and restore callbacks can derive the
>same information from the folio being processed.  This adds redundant
>state to the walker and couples its interface to caller-side preparation.
>
>Derive the shared mapping state in the callbacks instead, keeping the
>mapping policy with the PTE being processed and simplifying the remap
>interface.
>
>No functional change intended.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---
> include/linux/vmemmap-optimization.h |  6 +-
> mm/hugetlb_vmemmap.c                 | 89 ++++++++++++----------------
> mm/mm_init.c                         |  6 +-
> mm/sparse-vmemmap.c                  |  5 +-
> 4 files changed, 49 insertions(+), 57 deletions(-)
>
>diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
>index 065840f3c241..858311a71b0c 100644
>--- a/include/linux/vmemmap-optimization.h
>+++ b/include/linux/vmemmap-optimization.h
>@@ -91,11 +91,13 @@ static inline struct page *vmemmap_shared_tail_page(unsigned int order,
> }
> #endif /* CONFIG_VMEMMAP_OPTIMIZATION */
> 
>-static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
>+static inline bool vmemmap_optimizable_pfn(unsigned long pfn, unsigned int order)
> {
>-	const unsigned int order = pfn_to_section_compound_order(pfn);
> 	const unsigned long nr_pages = 1UL << order;
> 
>+	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
>+		return false;
>+
> 	if (!is_power_of_2(sizeof(struct page)))
> 		return false;
> 
>diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>index 18b72d553955..8fac61b7d74a 100644
>--- a/mm/hugetlb_vmemmap.c
>+++ b/mm/hugetlb_vmemmap.c
>@@ -24,22 +24,18 @@
>  * struct vmemmap_remap_walk - walk vmemmap page table
>  *
>  * @remap_pte:		called for each lowest-level entry (PTE).
>- * @nr_walked:		the number of walked pte.
>- * @vmemmap_tail:	the page to be installed as non-first in the vmemmap range
>+ * @nr_walked:		the number of PTEs successfully remapped.
>  * @vmemmap_pages:	the list head of the vmemmap pages that can be freed
>  *			or is mapped from.
>  * @flags:		used to modify behavior in vmemmap page table walking
>  *			operations.
>  */
> struct vmemmap_remap_walk {
>-	void			(*remap_pte)(pte_t *pte, unsigned long addr,
>+	int			(*remap_pte)(pte_t *pte, unsigned long addr,
> 					     struct vmemmap_remap_walk *walk);
>-
> 	unsigned long		nr_walked;
>-	struct page		*vmemmap_tail;
> 	struct list_head	*vmemmap_pages;
> 
>-
> /* Skip the TLB flush while updating the vmemmap page tables. */
> #define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(0)
> 	unsigned long		flags;
>@@ -140,12 +136,14 @@ static int vmemmap_pmd_entry(pmd_t *pmd, unsigned long addr,
> static int vmemmap_pte_entry(pte_t *pte, unsigned long addr,
> 			     unsigned long next, struct mm_walk *walk)
> {
>+	int ret;
> 	struct vmemmap_remap_walk *vmemmap_walk = walk->private;
> 
>-	vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
>-	vmemmap_walk->nr_walked++;
>+	ret = vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
>+	if (!ret)
>+		vmemmap_walk->nr_walked++;
> 
>-	return 0;
>+	return ret;
> }
> 
> static const struct mm_walk_ops vmemmap_remap_ops = {
>@@ -213,51 +211,51 @@ static struct page *vmemmap_dup_page_from_list(const struct page *src,
> 	return dst;
> }
> 
>-static void vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
>-				 struct vmemmap_remap_walk *walk)
>+static inline struct page *folio_vmemmap_shared_tail_page(const struct folio *folio)
> {
>-	struct page *page = pte_page(ptep_get(pte));
>-	pte_t entry;
>-
>-	/* Remapping the head page requires r/w */
>-	if (unlikely(walk->nr_walked == 0)) {
>-		struct page *head;
>+	return vmemmap_shared_tail_page(folio_order(folio), folio_zone(folio));
>+}
> 
>-		VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
>+static int vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
>+				struct vmemmap_remap_walk *walk)
>+{
>+	pte_t entry;
>+	struct page *src = pte_page(ptep_get(pte)), *dst;
>+	const struct page *page = (const struct page *)addr;
>+	const struct folio *folio = page_folio(page);
> 
>-		head = vmemmap_dup_page_from_list(page, walk->vmemmap_pages);
>-		entry = mk_pte(head, PAGE_KERNEL);
>+	if (likely(vmemmap_optimizable_pfn(page_to_pfn(page), folio_order(folio)))) {
>+		dst = folio_vmemmap_shared_tail_page(folio);
>+		if (!dst)
>+			return -ENOMEM;

One thing caught my eye here ... shared tail allocation can now fail after
we've already remapped the head.

IIUC, nothing to worry about there, though :) since rollback keeps the
new head mapped and flushes before clearing the optimized flag or freeing
the old backing page.

[...]

Reviewed-by: Lance Yang <lance.yang@linux.dev>
