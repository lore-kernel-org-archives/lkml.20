Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719648;
	b=PhaBmbLGA3hrzItYBhmFlJaCcx3Rl5jffljYTTf6B5ESL6wKHeiAX2wcxV7z8P/f6To+
	 iNvyWXqcBT9ZZQY8PCJi3pFNif4SsSBfgKJ1p1eX/HHL4MjXcOug5pTcUjwA5XFx8eVJF
	 0abGQ8aTZ1FZab15t78E2wpO078BlFx3uZYxIVYbvCYKzapTCV8Dl/TY3tP+aI9PCmrNg
	 2lV9GyoRlM63JGjFwfVXqk9ELUKW4C/gf3rsmUeIRQy2WwURnLOyEl0mt+skGi9TUuOVd
	 SJkqvAVhj/h56oVYkmGeVomn6KeoEHHFhHFdnOwKqrWQL2hdlSSTbPlEpmhqPkrG5fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719648;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=87uJG8a/k/Neq0R7eCxcYOPmmseOn6GXPt6JzbtPXIw=;
	b=cMwUGERIJerrJV41KtohTtUyYaTMnIATvRcBuyqJcJyKNy+VDK+wzH2cNojgJEHUBbwV
	 R15wCZn2uJMH2TfUfxzKV8bszSaLYuQUWzWeGXOIOsP0Ml3e9smqeDmS4STBzhMz0/7aB
	 8cBHzlimqbtXSITD0Rlh9NZWp0NM4QasUVMwizCXOp12Xx0EJh7kV+Gimn3GdNANM5yKN
	 49PgcAsfgD/PecAtrV6p8+6IBC3Gupzd/9CJd+mTdI00yHG3sEzkUS+sJSUm5gUIKk/gg
	 oc44WiCB5u0g8U02qQoa019EpYYN24OhONk+2Nzmip0xeexey6FE6m97qw4z0gV2w6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ewahjRnW;
	arc=none smtp.remote-ip=91.218.175.168
Received: from mta0.migadu.com (out-168.mta0.migadu.com [91.218.175.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648BB606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 648BB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ewahjRnW
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9yZbpEAR6UvbWpLDnA3bvvNikapHRsaoEt1NqaIrFrc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793719645; v=1; x=1794324445;
 b=ewahjRnWUxXk4eaLDJ//WzeTPa3IaddOeJKHsRnRDux7prynM1F1yRDc6PQmRgkgP9o1QcLC
 8D0ldh2CVIv+FdSS0rRQR73h89NpLIpVlG0702mS8rHbxGPKzj6lmNi/hkHUVIlnGwuKtCaB+eX
 APdFRu+i1EYLz9BtNWPtZl1s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 7308f5fba12f261d;
	Tue, 03 Nov 2026 15:27:25 +0000
X-Mizu-Trace-ID: 7308f5fba12f261d
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Lance Yang <lance.yang@linux.dev>
Cc: Usama Arif <usama.arif@linux.dev>,
	akpm@linux-foundation.org,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	ying.huang@linux.alibaba.com,
	baoquan.he@linux.dev,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	liam@infradead.org,
	ryan.roberts@arm.com,
	vbabka@kernel.org,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com
Subject: Re: [PATCH v8 28/30] mm: handle PMD swap entry faults on swap-in
Date: Tue,  3 Nov 2026 07:27:20 -0800
Message-ID: <20261103152721.2138301-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004101942.37331-1-lance.yang@linux.dev>
References: 
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

On Sun,  4 Oct 2026 18:19:42 +0800 Lance Yang <lance.yang@linux.dev> wrote:

> Hey Usama,
> 
> Not an expert on swap, so the below may be naive ...
> 
> On Fri, Oct 02, 2026 at 02:52:42AM -0700, Usama Arif wrote:
> [...]
> >+#ifdef CONFIG_THP_SWAP
> >+/**
> >+ * do_huge_pmd_swap_page() - Handle a fault on a PMD-level swap entry.
> >+ * @vmf: Fault context. vmf->orig_pmd contains the swap PMD.
> >+ *
> >+ * A PMD swap entry is a compact encoding for HPAGE_PMD_NR consecutive swap
> >+ * slots. If the swap cache still has one PMD-sized folio covering the range,
> >+ * map it directly at PMD level. If the range has been split into per-page
> >+ * cache state, or zswap may have per-page state for it, split the PMD swap
> >+ * entry and retry at PTE granularity.
> >+ *
> >+ * Return: VM_FAULT_* flags.
> >+ */
> >+vm_fault_t do_huge_pmd_swap_page(struct vm_fault *vmf)
> >+{
> >+	struct vm_area_struct *vma = vmf->vma;
> >+	struct mm_struct *mm = vma->vm_mm;
> >+	struct folio *folio;
> >+	struct page *page;
> >+	struct swap_info_struct *si;
> >+	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
> >+	softleaf_t entry;
> >+	swp_entry_t swp_entry;
> >+	pmd_t pmd;
> >+	vm_fault_t ret = 0;
> >+	bool exclusive, stable_writes, rwp_restore = false;
> >+	bool write = vmf->flags & FAULT_FLAG_WRITE;
> >+	rmap_t rmap_flags = RMAP_NONE;
> >+	enum swap_pmd_cache cache_state;
> >+
> >+	entry = softleaf_from_pmd(vmf->orig_pmd);
> >+	if (unlikely(!softleaf_is_swap(entry)))
> >+		return 0;
> >+
> >+	if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_PAGEFAULT,
> >+				     HPAGE_PMD_ORDER)) {
> >+		__split_huge_pmd(vma, vmf->pmd, haddr);
> >+		return 0;
> >+	}
> >+
> >+	swp_entry = entry;
> >+
> >+	/* Prevent swapoff from happening to us. */
> >+	si = get_swap_device(swp_entry);
> >+	if (IS_ERR_OR_NULL(si)) {
> >+		if (IS_ERR(si))
> >+			return VM_FAULT_SIGBUS;
> >+		return 0;
> >+	}
> >+
> >+	cache_state = swap_pmd_cache_lookup(swp_entry, &folio);
> >+	if (cache_state == SWAP_PMD_CACHE_SPLIT)
> >+		goto split_fallback;
> >+	if (!folio) {
> >+		/*
> >+		 * PMD swap entries encode ordinary per-page swap slots. If any
> >+		 * slot is in zswap, split and let the PTE swap path load the
> >+		 * range per page. Otherwise the range is all on disk and can be
> >+		 * read back as one PMD-sized folio.
> >+		 */
> >+		if (zswap_is_present(swp_entry, HPAGE_PMD_NR))
> >+			goto split_fallback;
> >+
> >+		folio = swapin_sync(swp_entry, GFP_HIGHUSER_MOVABLE,
> >+				    BIT(HPAGE_PMD_ORDER), vmf, NULL, 0);
> >+		if (IS_ERR_OR_NULL(folio))
> >+			goto split_fallback;
> >+
> >+		/* Had to read from swap area: Major fault */
> >+		ret = VM_FAULT_MAJOR;
> >+		count_vm_event(PGMAJFAULT);
> >+		count_memcg_event_mm(mm, PGMAJFAULT);
> >+	}
> >+
> >+	ret |= folio_lock_or_retry(folio, vmf);
> >+	if (ret & VM_FAULT_RETRY)
> >+		goto out_release;
> >+
> >+	/* Verify the folio is still in swap cache and matches our entry */
> >+	if (unlikely(!folio_matches_swap_entry(folio, swp_entry)))
> >+		goto out_page;
> >+
> >+	/*
> >+	 * Folio should be PMD-sized; if not (e.g. split in swap cache),
> >+	 * split the PMD swap entry and retry at PTE level.
> >+	 */
> >+	if (folio_nr_pages(folio) != HPAGE_PMD_NR)
> >+		goto unlock_split_fallback;
> >+
> >+	/*
> >+	 * A read that failed - a PMD-order zswap load that found per-page
> >+	 * state, or an I/O error - leaves the folio clean and not uptodate.
> >+	 * Fall back so the PTE retry reads each slot again rather than
> >+	 * returning SIGBUS for the whole range.
> >+	 */
> >+	if (unlikely(!folio_test_uptodate(folio)))
> >+		goto unlock_split_fallback;
> >+
> >+	/*
> >+	 * If any subpage is hardware-poisoned, split the PMD swap entry and
> >+	 * let the PTE swap-in path handle each page individually so
> >+	 * do_swap_page() can return VM_FAULT_HWPOISON for the poisoned
> >+	 * subpage rather than mapping the corrupted memory as one THP.
> >+	 */
> >+	if (unlikely(folio_has_hwpoisoned_subpage(folio)))
> >+		goto unlock_split_fallback;
> >+
> >+	page = folio_page(folio, 0);
> >+	arch_swap_restore(folio_swap(swp_entry, folio), folio);
> >+
> >+	folio_throttle_swaprate(folio, GFP_KERNEL);
> >+
> >+	/* Lock the PMD and verify it hasn't changed */
> >+	vmf->ptl = pmd_lock(mm, vmf->pmd);
> >+	if (unlikely(!pmd_same(vmf->orig_pmd, pmdp_get(vmf->pmd)))) {
> >+		spin_unlock(vmf->ptl);
> >+		goto out_page;
> >+	}
> >+
> >+	exclusive = pmd_swp_exclusive(vmf->orig_pmd);
> >+
> >+	/*
> >+	 * Some swap backends (e.g. zram) don't support concurrent page
> >+	 * modifications while under writeback. If we map exclusive on such
> >+	 * a backend while the folio is still under writeback, the writeback
> >+	 * may see partial modifications and corrupt the swap slot. Drop the
> >+	 * exclusive marker and only map R/O for that case; further GUP
> >+	 * references can't appear once the page is fully unmapped, so this
> >+	 * is safe.
> >+	 */
> >+	/* Lockless like do_swap_page(): SWP_STABLE_WRITES never changes. */
> >+	stable_writes = data_race(si->flags & SWP_STABLE_WRITES);
> >+	if (exclusive && folio_test_writeback(folio) && stable_writes)
> >+		exclusive = false;
> >+
> >+	/*
> >+	 * Set up the PMD mapping. Similar to do_swap_page() but at PMD level.
> >+	 */
> >+	add_mm_counter(mm, MM_ANONPAGES, HPAGE_PMD_NR);
> >+	add_mm_counter(mm, MM_SWAPENTS, -HPAGE_PMD_NR);
> >+
> >+	pmd = folio_mk_pmd(folio, vma->vm_page_prot);
> >+	pmd = pmd_mkyoung(pmd);
> >+
> >+	if (pmd_swp_soft_dirty(vmf->orig_pmd))
> >+		pmd = pmd_mksoft_dirty(pmd);
> >+	if (pmd_swp_uffd(vmf->orig_pmd))
> >+		pmd = pmd_mkuffd(pmd);
> >+	if (pmd_swp_uffd(vmf->orig_pmd) && userfaultfd_rwp(vma)) {
> >+		pmd = pmd_modify(pmd, PAGE_NONE);
> >+		rwp_restore = true;
> >+	}
> >+
> >+	/*
> >+	 * Check exclusivity to determine if we can map writable.
> >+	 */
> >+	if (exclusive) {
> >+		if (!rwp_restore && (vma->vm_flags & VM_WRITE) &&
> >+		    !userfaultfd_huge_pmd_wp(vma, pmd) &&
> >+		    !pmd_needs_soft_dirty_wp(vma, pmd)) {
> >+			pmd = pmd_mkwrite(pmd, vma);
> >+			if (write)
> >+				pmd = pmd_mkdirty(pmd);
> >+		}
> >+		rmap_flags |= RMAP_EXCLUSIVE;
> >+	}
> >+
> >+	flush_icache_pages(vma, page, HPAGE_PMD_NR);
> >+
> >+	if (!folio_test_anon(folio))
> >+		folio_add_new_anon_rmap(folio, vma, haddr, rmap_flags);
> >+	else
> >+		folio_add_anon_rmap_pmd(folio, page, vma, haddr, rmap_flags);
> >+
> >+	folio_put_swap(folio, NULL);
> >+
> >+	set_pmd_at(mm, haddr, vmf->pmd, pmd);
> >+	update_mmu_cache_pmd(vma, haddr, vmf->pmd);
> >+
> >+	/* Update orig_pmd for any follow-up wp_huge_pmd() below. */
> >+	vmf->orig_pmd = pmd;
> >+
> >+	/*
> >+	 * Conditionally try to free up the swap cache. Do it after mapping,
> >+	 * so raced page faults will likely see the folio in swap cache and
> >+	 * wait on the folio lock.
> >+	 */
> >+	if (should_try_to_free_swap(si, folio, vma, exclusive, vmf->flags))
> >+		folio_free_swap(folio);
> >+
> >+	spin_unlock(vmf->ptl);
> >+
> >+	folio_unlock(folio);
> >+	put_swap_device(si);
> >+
> >+	/*
> >+	 * If the write fault wasn't satisfied above (folio is shared without
> >+	 * exclusivity), call wp_huge_pmd() to handle COW or
> >+	 * userfaultfd-wp without forcing a second fault.
> >+	 *
> >+	 * wp_huge_pmd() may return VM_FAULT_FALLBACK if it had to split the
> >+	 * PMD; that's a normal outcome, and the natural PTE-level refault will
> >+	 * complete the COW. Mask it so callers (and the arch fault handler)
> >+	 * don't see VM_FAULT_FALLBACK as a fatal VM_FAULT_ERROR.
> >+	 */
> >+	if (write && !pmd_write(pmd) && !rwp_restore) {
> >+		vm_fault_t wp_ret = wp_huge_pmd(vmf);
> >+
> >+		wp_ret &= ~VM_FAULT_FALLBACK;
> >+		ret |= wp_ret;
> >+		if (ret & VM_FAULT_ERROR)
> >+			ret &= VM_FAULT_ERROR;
> >+	}
> >+
> >+	return ret;
> >+
> >+out_page:
> >+	folio_unlock(folio);
> >+out_release:
> >+	folio_put(folio);
> >+	put_swap_device(si);
> >+	return ret;
> >+
> >+unlock_split_fallback:
> >+	/*
> >+	 * PTE fallback cannot add a single-page rmap to a PMD-sized folio that
> >+	 * has never been mapped: do_swap_page() would hand the whole folio to
> >+	 * folio_add_new_anon_rmap() while installing one PTE. Nor can it do
> >+	 * anything useful with a folio that failed to read. Remove either from
> >+	 * the swap cache so each slot is read back into its own order-0 folio.
> >+	 * An uptodate anon swap-cache folio can be mapped one PTE at a time and
> >+	 * must stay cached, so that any poisoned subpage stays visible to
> >+	 * do_swap_page(). This mirrors unuse_pmd_entry().
> >+	 */
> >+	if (folio_matches_swap_entry(folio, swp_entry) &&
> >+	    (!folio_test_uptodate(folio) || !folio_test_anon(folio)))
> >+		swap_cache_del_folio(folio);
> >+	folio_unlock(folio);
> >+	folio_put(folio);
> 
> Requesting BIT(HPAGE_PMD_ORDER) doesn't prevent swapin_sync() from
> returning a cached order-0 folio ...

Agreed. swapin_sync() returns an existing cached folio without
restricting its order. A small zswap writeback folio can still need
its cache reference while I/O is pending.

This base retains zswap's allocation reference until after
swap_write_submit(), rather than dropping it before __swap_writeout().
After that reference is dropped, the cache reference can still be
needed for pending I/O, so the size-mismatch fix is still required.

> 
> struct folio *swapin_sync(swp_entry_t entry, gfp_t gfp, unsigned long orders,
> 			   struct vm_fault *vmf, struct mempolicy *mpol, pgoff_t ilx)
> {
> ...
> 	do {
> 		folio = swap_cache_get_folio(entry);
> 		if (folio)
> 			return folio;
> 		folio = __swap_cache_alloc_folio(entry, gfp, orders, vmf, mpol, ilx);
> 	} while (PTR_ERR(folio) == -EEXIST);
> 
> ...
> }
> 
> static int zswap_writeback_entry(struct zswap_entry *entry,
> 				 swp_entry_t swpentry)
> {
> ...
> 	folio = __swap_cache_alloc_folio(swpentry, GFP_KERNEL, BIT(0), NULL, mpol,
> 					 NO_INTERLEAVE_INDEX);
> ...
> 	if (IS_ERR(folio))
> 		return PTR_ERR(folio);
> ...
> 	if (!zswap_decompress(entry, folio)) {
> 		ret = -EIO;
> 		goto err;
> 	}
> 
> 	xa_erase(tree, offset);
> ...
> 	/* folio is up to date */
> 	folio_mark_uptodate(folio);
> 
> 	folio_set_dropbehind(folio);
> ...
> 	folio_put(folio);
> 
> 	/* start writeback */
> 	__swap_writeout(&ctx, folio);
> 	swap_write_submit(&ctx);
> 
> 	return 0;
> ...
> }
> 
> void __swap_writeout(struct swap_io_ctx *ctx, struct folio *folio)
> {
> 	VM_BUG_ON_FOLIO(!folio_test_swapcache(folio), folio);
> ...
> 	folio_start_writeback(folio);
> 	folio_unlock(folio);
> 	swap_add_folio(ctx, folio, WRITE);
> }
> 
> Say we hit the following race:
> 
> 1) swap_pmd_cache_lookup() finds the range empty, before zswap writeback
>    inserts its order-0 folio.
> 
> 2) zswap writeback puts that small folio in the swap cache at the first
>    slot, then erases the last zswap entry in the range.
> 
> 3) The fault thread checks zswap and gets false from zswap_is_present().
>    It then calls swapin_sync(), which returns that cached small folio.
> 
> 4) After __swap_writeout() unlocks the folio, the fault thread can lock
>    it while writeback is still pending. The folio isn't PMD-sized, so
>    we reach that cleanup ...
> 
> zswap has already dropped its allocation reference, and writeback itself
> doesn't hold one. So, without any other references, we're left with the
> swap-cache reference and our fault reference.
> 
> The folio is still !anon, so swap_cache_del_folio() removes the cache
> reference, then folio_put() drops ours. That can drop the last reference
> while I/O is still using the folio ... :(
> 
> So ... could we just unlock and put it on the size mismatch, then jump
> to split_fallback? That would keep the folio in the swap cache for
> do_swap_page().
> 

Done for next revision. Thanks for catching this!
A size mismatch now unlocks and puts the folio before jumping
to split_fallback. It stays in the swap cache for do_swap_page().
Only PMD-sized folios reach the cleanup that may delete a folio.

> Something like:
> 
> ---8<---
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 69721801cf9f..53c15bfdb0a1 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2507,9 +2507,14 @@ vm_fault_t do_huge_pmd_swap_page(struct vm_fault *vmf)
>  	/*
>  	 * Folio should be PMD-sized; if not (e.g. split in swap cache),
>  	 * split the PMD swap entry and retry at PTE level.
> +	 * Keep the folio cached: zswap writeback may still be in flight and
> +	 * relies on the swap-cache reference to keep it alive.
>  	 */
> -	if (folio_nr_pages(folio) != HPAGE_PMD_NR)
> -		goto unlock_split_fallback;
> +	if (folio_nr_pages(folio) != HPAGE_PMD_NR) {
> +		folio_unlock(folio);
> +		folio_put(folio);
> +		goto split_fallback;
> +	}
> 
>  	/*
>  	 * A read that failed - a PMD-order zswap load that found per-page
> @@ -2647,6 +2652,7 @@ vm_fault_t do_huge_pmd_swap_page(struct vm_fault *vmf)
> 
>  unlock_split_fallback:
>  	/*
> +	 * Only PMD-sized folios reach this cleanup.
>  	 * PTE fallback cannot add a single-page rmap to a PMD-sized folio that
>  	 * has never been mapped: do_swap_page() would hand the whole folio to
>  	 * folio_add_new_anon_rmap() while installing one PTE. Nor can it do
> --
> 
> Hopefully I didn't miss anything :D
> 
> >+split_fallback:
> >+	/*
> >+	 * Only split if the PMD is still the swap entry we were called for.
> >+	 * All the reasons we get here (allocation failure, zswap state, a
> >+	 * split or poisoned cached folio) were observed without the PMD lock,
> >+	 * so a racing thread may already have swapped the range back in as a
> >+	 * THP -- splitting that would silently demote a perfectly good huge
> >+	 * mapping.
> >+	 */
> >+	if (pmd_same(vmf->orig_pmd, pmdp_get_lockless(vmf->pmd)))
> >+		__split_huge_pmd(vma, vmf->pmd, haddr);
> >+	put_swap_device(si);
> >+	return 0;
> >+}
> >+#endif /* CONFIG_THP_SWAP */
> 
> [...]
> 
> Cheers, Lance
> 
