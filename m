Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2510D34EEEA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015204; cv=none; b=VhYt+Alla0ziQSTIXg/qc0PMqjkXxtOJU2QGkX1JWnTFCIGQjNHD8J5TvvsBHIjchSil4DBibZnqI07weAKTOlIKFMzfPSQYX0wwXASCpJVh455J9PSFShEpR0cu5FEyg8Brk/fP3FSu/+cZAwP+sY17OZ+w7uhdRvohMIDTFM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015204; c=relaxed/simple;
	bh=izvED01tg/879C7XLl932EOi/nkbDrejanQk+B6QoWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cM+zX0R5PxVEYSNP7IeyYm2jHr1Uk1tOhbHArhLFBbcerMGGqX1zoJMG9dvwXfeSX7r/sMPGyFCoqMRuDkpCF9QuoKJLvxettCj9uAMuNUKGKtXvX3+qmSFStsamOJT76Tkae7E5UOUpUCXj5E2pzqh8dM8G3eSz1mIj5gQSHLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=e110XXj7; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="e110XXj7"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD9171570;
	Wed,  9 Sep 2026 21:39:46 -0700 (PDT)
Received: from [10.164.148.54] (MacBook-Pro-3.blr.arm.com [10.164.148.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AB423F7B4;
	Wed,  9 Sep 2026 21:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789015190; bh=izvED01tg/879C7XLl932EOi/nkbDrejanQk+B6QoWU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e110XXj7oewKsCFtLRqBGdB7kyHD6x8VwRK1H7teHa1pMRiQn/wmyX8xcoPJqxUPE
	 5Pf5oo8Ek25CitGRDtD03Qzvm2K3gR1diYvLme3o3Fdx7YfguyEOSNoOYV8gzSYdAj
	 YlBCteqqw5ey3VMClAeDzsv3ihj+9LRy+HfsbFkE=
Message-ID: <3f1798bb-c6b9-4c1f-9a9a-fe312c1a0602@arm.com>
Date: Thu, 10 Sep 2026 10:09:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] mm/rmap: batch unmap anonymous swap-backed large
 folios
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 hughd@google.com, chrisl@kernel.org, kasong@tencent.com, riel@surriel.com,
 liam@infradead.org, vbabka@kernel.org, harry@kernel.org, jannh@google.com,
 lance.yang@linux.dev, baolin.wang@linux.alibaba.com,
 shikemeng@huaweicloud.com, nphamcs@gmail.com, baoquan.he@linux.dev,
 youngjun.park@lge.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, pfalcato@suse.de,
 ryan.roberts@arm.com, anshuman.khandual@arm.com, davem@davemloft.net,
 andreas@gaisler.com
References: <20260901054358.4049095-1-dev.jain@arm.com>
 <20260901054358.4049095-9-dev.jain@arm.com>
 <CAGsJ_4yQhafd8zoESxFza3N8kxWxpOpa1Pv-Sf+N=mCPz5or=w@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAGsJ_4yQhafd8zoESxFza3N8kxWxpOpa1Pv-Sf+N=mCPz5or=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

+ sparc guys for batching arch_unmap_one

On 09/09/26 3:18 am, Barry Song wrote:
> On Tue, Sep 1, 2026 at 1:45 PM Dev Jain <dev.jain@arm.com> wrote:
>>
>> Enable batch clearing of ptes, and batch swap setting of ptes for anon
>> swap-backed folio unmapping.
>>
>> Processing all ptes of a large folio in one go helps us batch across
>> atomics (add_mm_counter etc), barriers (in the function
>> __folio_try_share_anon_rmap), repeated calls to page_vma_mapped_walk(),
>> to name a few. In general, batching helps us to execute similar code
>> together, making the execution of the program more memory and
>> CPU friendly.
>>
>> On arm64-contpte, batching also helps us avoid redundant ptep_get() calls
>> and TLB flushes while breaking the contpte mapping.
>>
>> The handling of anon-exclusivity is very similar to commit cac1db8c3aad
>> ("mm: optimize mprotect() by PTE batching"). Since folio_unmap_pte_batch()
>> won't look at the bits of the underlying page, we need to process
>> sub-batches of ptes pointing to pages which are same w.r.t exclusivity,
>> and batch set only those ptes to swap ptes in one go.
>>
>> arch_unmap_one() is only defined for sparc64; I am not comfortable
>> regarding the nuances between retrieving the pfn from pte_pfn() or from
>> (paddr = pte_val(oldpte) & _PAGE_PADDR_4V).
>>
>> (And, pte_next_pfn() can't even be called from arch_unmap_one() because
>> that file does not include pgtable.h) So just disable the
>> "sparc64-anon-swapbacked" case for now.
>>
>> We need to take care of rmap accounting (folio_remove_rmap_ptes) and
>> reference accounting (folio_put_refs) when anon folio unmap succeeds.
>> In case we partially batch the large folio and fail, we need to correctly
>> do the accounting for pages which were successfully unmapped. So, put
>> this accounting code (which is finish_folio_unmap()) in
>> __ttu_anon_swapbacked_folio() itself, instead of doing some horrible
>> goto jumping at the callsite of ttu_anon_folio().
>>
>> Similarly, do the finish_folio_unmap() in ttu_anon_folio itself for
>> the non-swapbacked (lazyfree) case.
>>
>> If the batch length is less than the number of pages in the folio, then
>> we must skip over this batch.
>>
>> The page_vma_mapped_walk API ensures this - check_pte() will return true
>> only if any of [pvmw->pfn, pvmw->pfn + nr_pages) is mapped by the pte.
>> There is no pfn underlying a swap pte, so check_pte returns false and we
>> keep skipping until we hit a present pte, which is where we want to start
>> unmapping from next.
>>
>> Remove the label finish_unmap since no goto callers are left now.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>  mm/rmap.c | 110 ++++++++++++++++++++++++++++++++++++++++--------------
>>  1 file changed, 81 insertions(+), 29 deletions(-)
>>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 1b9f07d4d1be9..68e0201ffd003 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1964,12 +1964,14 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>>         end_addr = pmd_addr_end(addr, vma->vm_end);
>>         max_nr = (end_addr - addr) >> PAGE_SHIFT;
>>
>> -       /* We only support lazyfree or file folios batching for now ... */
>> -       if (folio_test_anon(folio) && folio_test_swapbacked(folio))
>> +       if (pte_unused(pte))
>>                 return 1;
>>
>> -       if (pte_unused(pte))
>> +#ifdef __HAVE_ARCH_UNMAP_ONE
>> +       /* Add batching support to arch_unmap_one() to remove this */
> 
> I'd like to make this clearer. For example, could we say that
> sparc has `arch_unmap_one()`, which doesn't support batching?
> 
> BTW, it shouldn't be too hard to save `nr_pages` tags, looking at
> the code:
> 
> static inline int arch_unmap_one(struct mm_struct *mm,
>                                  struct vm_area_struct *vma,
>                                  unsigned long addr, pte_t oldpte)
> {
>         if (adi_state.enabled && (pte_val(oldpte) & _PAGE_MCD_4V))
>                 return adi_save_tags(mm, vma, addr, oldpte);
>         return 0;
> }
> Maybe the sparc folks can handle this.

I have mentioned in the patch description why I wasn't comfortable changing
this.

Perhaps the sparc guys can help me with the best way. Otherwise I'll try
harder in the next iteration to solve it myself : )
> 
>> +       if (folio_test_anon(folio) && folio_test_swapbacked(folio))
>>                 return 1;
>> +#endif
>>
>>         /*
>>          * If unmap fails, we need to restore the ptes. To avoid accidentally
>> @@ -2139,16 +2141,25 @@ static pte_t swp_pte_prepare(swp_entry_t entry, pte_t old_pte,
>>         return swp_pte;
>>  }
>>
>> -static bool ttu_anon_swapbacked_folio(struct vm_area_struct *vma,
>> +static void finish_folio_unmap(struct vm_area_struct *vma,
>> +               struct folio *folio, struct page *page, unsigned long nr_pages)
> 
> We are not necessarily finishing the whole folio here, right?
> The name is a bit misleading to me, as it sounds like we're finishing
> the whole folio.
> 
> Maybe `finish_folio_unmap_batch()`?

Yes makes sense, it finishes the batch rather than finishing the folio.


> 
>> +{
>> +       folio_remove_rmap_ptes(folio, page, nr_pages, vma);
>> +       if (vma->vm_flags & VM_LOCKED)
>> +               mlock_drain_local();
>> +       folio_put_refs(folio, nr_pages);
>> +}
>> +
>> +static bool __ttu_anon_swapbacked_folio(struct vm_area_struct *vma,
>>                 struct folio *folio, struct page *page, unsigned long address,
>> -               pte_t *ptep, pte_t pteval)
>> +               pte_t *ptep, pte_t pteval, unsigned long nr_pages,
>> +               bool anon_exclusive)
>>  {
>> -       const bool anon_exclusive = folio_test_anon(folio) &&
>> -                                   PageAnonExclusive(page);
>>         swp_entry_t entry = page_swap_entry(page);
>>         struct mm_struct *mm = vma->vm_mm;
>> +       pte_t swp_pte;
>>
>> -       if (folio_dup_swap_pages(folio, page, 1) < 0)
>> +       if (folio_dup_swap_pages(folio, page, nr_pages) < 0)
>>                 return false;
>>
>>         /*
>> @@ -2157,21 +2168,57 @@ static bool ttu_anon_swapbacked_folio(struct vm_area_struct *vma,
>>          * so we'll not check/care.
>>          */
>>         if (arch_unmap_one(mm, vma, address, pteval) < 0) {
>> -               folio_put_swap_pages(folio, page, 1);
>> +               VM_WARN_ON(nr_pages != 1);
>> +               folio_put_swap_pages(folio, page, nr_pages);
>>                 return false;
>>         }
>>
>>         /* See folio_try_share_anon_rmap(): clear PTE first. */
>> -       if (anon_exclusive && folio_try_share_anon_rmap_pte(folio, page)) {
>> -               folio_put_swap_pages(folio, page, 1);
>> +       if (anon_exclusive &&
>> +           folio_try_share_anon_rmap_ptes(folio, page, nr_pages)) {
>> +               folio_put_swap_pages(folio, page, nr_pages);
>>                 return false;
>>         }
>>
>>         mm_prepare_for_swap_entries(mm);
>> -       dec_mm_counter(mm, MM_ANONPAGES);
>> -       inc_mm_counter(mm, MM_SWAPENTS);
>> -       set_pte_at(mm, address, ptep,
>> -                  swp_pte_prepare(entry, pteval, anon_exclusive));
>> +       add_mm_counter(mm, MM_ANONPAGES, -nr_pages);
>> +       add_mm_counter(mm, MM_SWAPENTS, nr_pages);
>> +       swp_pte = swp_pte_prepare(entry, pteval, anon_exclusive);
>> +       set_softleaf_ptes(mm, address, ptep, swp_pte, nr_pages);
>> +       finish_folio_unmap(vma, folio, page, nr_pages);
>> +       return true;
>> +}
>> +
>> +static bool ttu_anon_swapbacked_folio(struct vm_area_struct *vma,
>> +               struct folio *folio, struct page *first_page,
>> +               unsigned long address, pte_t *ptep, pte_t pteval,
>> +               unsigned long nr_pages)
>> +{
>> +       unsigned long batch_idx = 0;
>> +
>> +       while (nr_pages) {
>> +               bool anon_exclusive = PageAnonExclusive(first_page + batch_idx);
>> +               unsigned long len = page_anon_exclusive_batch(batch_idx,
>> +                               nr_pages, first_page, anon_exclusive);
> 
> `len` is really a bad name, as `len` usually describes a size.
> Maybe `batch_pages`?

I disagree here : ) I don't think someone should mistake len with size.
len is ... "length". So in this case it is the length of pages in the
array, starting from batch_idx, upto nr_pages, which are all exclusive
or not. Also I would prefer short variable names.

> 
>> +
>> +               if (!__ttu_anon_swapbacked_folio(vma, folio,
>> +                               first_page + batch_idx, address, ptep, pteval,
>> +                               len, anon_exclusive)) {
>> +                       /* Restore the remaining PTEs that were cleared. */
>> +                       set_ptes(vma->vm_mm, address, ptep, pteval, nr_pages);
>> +                       return false;
>> +               }
>> +
>> +               nr_pages -= len;
>> +               if (!nr_pages)
>> +                       break;
>> +
>> +               pteval = pte_advance_pfn(pteval, len);
>> +               address += len * PAGE_SIZE;
>> +               batch_idx += len;
>> +               ptep += len;
>> +       }
>> +
>>         return true;
>>  }
> 
> Best Regards
> Barry

