Received: from mta0.migadu.com (out-14.mta0.migadu.com [91.218.175.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9268B331EA4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758423; cv=none; b=guefsqvQr55YMaO75Ho6nj8GM49AO1fH9ajBPipfravdyDK1iimDK1v2Gc3EgIXxK/SlJCAsjAniPrHUcJfm1zN4HTafQzy8HJ7j+GbTCeiDT+cgR6oW7IPaCMRnp4Nh2Seixm1pN9Tzf5NVrZMvaq7vxiWIu67MsQbVexAHg6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758423; c=relaxed/simple;
	bh=x3C9eFMj4s4C+4L8a6ck2RX+0F5Vx+DLli30NnboIh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sMbZrfA3Xn/WyBB+N4aqdABmWlPQ9NYSEKTCL9rBT4vKUBImUIy+S4Af/l7JyqphqelOjKSbx1+DpRKQsAvvxmSap1Lv4C0cSsf9nnFFyDQLMpVL708IPcPWaZ6vdCLOb10t0c8LYo0mm0B1PGoR/1Jv68yHv4WCdpSk1TYOY6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=chNeUyIU; arc=none smtp.client-ip=91.218.175.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="chNeUyIU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=x3C9eFMj4s4C+4L8a6ck2RX+0F5Vx+DLli30NnboIh4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790758418; v=1; x=1791363218;
 b=chNeUyIUcRJiEYe/HzjokB4VaM4k1Frk2WTry5hanTEkS2tnrOXiHZfITnCCETi2CMJOaiMO
 a9onNnLbzGsVFzfoiyTFg60d1ZrM5Cu4ff3Nybfa2HFrZRe8xX0droNFettjFw8mGlH/4wzy2hu
 qR9xeDShk5xtbFQHMl2IcyM0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d8889dd78a97ab2f;
	Wed, 30 Sep 2026 08:53:38 +0000
X-Mizu-Trace-ID: d8889dd78a97ab2f
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: maddy@linux.ibm.com,
	rppt@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	muchun.song@linux.dev,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v3 2/6] mm/sparse-vmemmap: support device DAX in common vmemmap path
Date: Wed, 30 Sep 2026 16:53:29 +0800
Message-ID: <20260930085329.17337-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260929053231.66085-3-songmuchun@bytedance.com>
References: <20260929053231.66085-3-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Sep 29, 2026 at 01:32:27PM +0800, Muchun Song wrote:
>The common vmemmap population path cannot yet handle optimized Device DAX
>mappings on its own. It uses pfn_to_zone() to find the shared tail page,
>but Device DAX populates its vmemmap at runtime before the ZONE_DEVICE span
>is initialized.
>
>Teach the common path to use device_zone() for runtime optimized vmemmap
>population while retaining pfn_to_zone() for early boot. This allows the
>same path to support both early boot mappings and Device DAX.
>
>The backing PFN supplied by the Device DAX-specific population path is no
>longer used, allowing the redundant lookup and population code to be
>removed later.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>Acked-by: Qi Zheng <qi.zheng@linux.dev>
>---
>v3:
>- Collect Acked-by from Qi Zheng
>
>v2:
>- Expand comments around slab initialization to explain zone lookup and
>  page refcounting (suggested by Qi Zheng)
>---
> mm/sparse-vmemmap.c | 64 +++++++++++++++++++++++++--------------------
> 1 file changed, 35 insertions(+), 29 deletions(-)
>
>diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
>index 8219abc6c3e5..ee4c113ca938 100644
>--- a/mm/sparse-vmemmap.c
>+++ b/mm/sparse-vmemmap.c
>@@ -237,18 +237,43 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
> 	struct page *page;
> 	const unsigned int order = pfn_to_section_compound_order(pfn);
> 
>-	/*
>-	 * Device DAX still relies on vmemmap_populate_compound_pages() for
>-	 * head/first-tail allocation and tail-page reuse.
>-	 */
> 	if (!vmemmap_optimizable_pfn(pfn))
> 		return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
> 
>-	zone = pfn_to_zone(pfn, node);
>+	/*
>+	 * Before slab is available, vmemmap optimization is used for early
>+	 * system RAM, whose zone can be determined from the PFN.
>+	 *
>+	 * Once slab is available, only ZONE_DEVICE memory reaches this
>+	 * optimized population path. Its zone span has not been initialized
>+	 * while its vmemmap is being populated, so pfn_to_zone() cannot be
>+	 * used. Obtain ZONE_DEVICE directly from the node instead.
>+	 */
>+	zone = slab_is_available() ? device_zone(node) : pfn_to_zone(pfn, node);
> 	page = vmemmap_shared_tail_page(order, zone);
> 	if (!page)
> 		return NULL;
> 
>+	/*
>+	 * During early vmemmap population, the shared tail vmemmap backing
>+	 * page is allocated from memblock before its struct page can safely
>+	 * participate in page refcounting. Therefore, no reference can be
>+	 * held for each shared PTE mapping, and the mappings must be unshared
>+	 * before the vmemmap is depopulated.
>+	 *
>+	 * Once slab is available, the shared backing page is allocated from
>+	 * the buddy allocator and can be refcounted. Hold one reference for
>+	 * each shared PTE mapping. The architecture vmemmap teardown drops
>+	 * the reference through __free_pages() when removing the mapping,
>+	 * preventing the backing page from being freed while it is shared.
>+	 *
>+	 * The backing page may be shared by enough PTE mappings to exhaust
>+	 * the positive range of its reference count. Stop populating the
>+	 * vmemmap if another reference cannot be acquired.
>+	 */
>+	if (slab_is_available() && !try_get_page(page))
>+		return NULL;

BTW, shouldn't __add_pages() undo the earlier sections on a population
failure? Say the first section is added successfully, but populating the
next one fails, e.g. due to an allocation failure:

void *memremap_pages(struct dev_pagemap *pgmap, int nid)
{
...
	const int nr_range = pgmap->nr_range;
	int error, i;
...
	pgmap->nr_range = 0;
	error = 0;
	for (i = 0; i < nr_range; i++) {
		error = pagemap_range(pgmap, &params, i, nid);
		if (error)
			break;
		pgmap->nr_range++;
	}

	if (i < nr_range) {
		memunmap_pages(pgmap);
		pgmap->nr_range = nr_range;
		return ERR_PTR(error);
	}
...
}

We still need to undo the sections already added in the failed range,
though ... memunmap_pages() won't touch those, since it only removes
completed ranges.

If the range starts at a section boundary, we'd hit -EEXIST in
fill_subsection_map() on retry while those subsection bits are still set.

The old DAX path had this issue too. Could we roll back [start_pfn, pfn)
in __add_pages() as a separate fix? Something like this:

---8<---
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 796af1028ee2..16a0a2c885bc 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -380,6 +380,7 @@ EXPORT_SYMBOL_GPL(pfn_to_online_page);
 int __add_pages(int nid, unsigned long pfn, unsigned long nr_pages,
 		struct mhp_params *params)
 {
+	const unsigned long start_pfn = pfn;
 	const unsigned long end_pfn = pfn + nr_pages;
 	unsigned long cur_nr_pages;
 	int err;
@@ -417,6 +418,10 @@ int __add_pages(int nid, unsigned long pfn, unsigned long nr_pages,
 			break;
 		cond_resched();
 	}
+
+	/* Roll back the sections added before the failure. */
+	if (err && pfn != start_pfn)
+		__remove_pages(start_pfn, pfn - start_pfn, altmap, params->pgmap);
 	vmemmap_populate_print_last();
 	return err;
 }
--

Hope I haven't missed anything :)

Cheers, Lance

>+
> 	return page_address(page);
> }
> 
>@@ -260,31 +285,12 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
> 
> 	if (pte_none(ptep_get(pte))) {
> 		pte_t entry;
>+		void *p = vmemmap_alloc_pte(pfn, node, altmap);
> 
>-		if (ptpfn == (unsigned long)-1) {
>-			void *p = vmemmap_alloc_pte(pfn, node, altmap);
>-
>-			if (!p)
>-				return NULL;
>-			ptpfn = PHYS_PFN(__pa(p));
>-		} else {
>-			/*
>-			 * When a PTE/PMD entry is freed from the init_mm
>-			 * there's a free_pages() call to this page allocated
>-			 * above. Thus this try_get_page() is paired with the
>-			 * put_page_testzero() on the freeing path.
>-			 * This can only called by certain ZONE_DEVICE path,
>-			 * and through vmemmap_populate_compound_pages() when
>-			 * slab is available.
>-			 *
>-			 * Use try_get_page() to prevent the shared page refcount
>-			 * from overflowing.
>-			 */
>-			if (slab_is_available() &&
>-			    !try_get_page(pfn_to_page(ptpfn)))
>-				return NULL;
>-		}
>-		entry = pfn_pte(ptpfn, PAGE_KERNEL);
>+		if (!p)
>+			return NULL;
>+
>+		entry = pfn_pte(PHYS_PFN(__pa(p)), PAGE_KERNEL);
> 		set_pte_at(&init_mm, addr, pte, entry);
> 	} else if (WARN_ON_ONCE(vmemmap_optimizable_pfn(pfn)))
> 		return NULL;
>-- 
>2.54.0
>
>
