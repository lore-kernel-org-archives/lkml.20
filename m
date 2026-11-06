Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.191
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957398;
	b=V2rKjrqBdgTi4LZ/BQG08iRf3sSjYfzkLN4Z/dls/RZB6SiWQUtun1Ci0YrFr8j/jgHG
	 xsqGhFd7Y92Fh7Eigv1LQUyS63dZEQZSSMj8WCk9jdcdrLbhzLc5GbnNxcAa1AsW8rnuh
	 KDfAorCQI3tCRJJ7ahtj0jq0FRj8as52V7DZqA0sZdSwxUHUIvzHc+TC1VFpVXHfB2888
	 eMoHinvlvrxaPCzzdn6I45W9MPIuL/Fosq2wSA296bb4i4S9924bR9H0ltG14Czlsnoxa
	 ztGMVT3iKsuk2PQeO5j9Hxbpbyd0HBCFoDzIzmJ2e4Mi1IG9L/mwFSXK29McCGwnOoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957398;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=dgVnwcVyRL5r7FbTkKdlbPx0jKtwnlLXDYPwAlo0Rqs=;
	b=b4/CHE0IlgySq15uYHzZVZ/PnCozlbesQx+hgJdH8ZfRqh0oAupwVdfVOZ9bmHTkBR4Q
	 15yHO51If+Q36fQktgdoRm3Zqx8lXr6J9AfRL6gonHdFA1N/+ZMhkHVmPFU2r9GvLt38l
	 TFAUIwwdM/7T6Y3gUhMT1GOxDJLz2dlxWZKhVPzarJQL8okIAN+ZuQS/sV4cLUu8Uj1s+
	 UK+3xSfh9w02gPAqxFbR/NoCbz2DzdCoygD2T9fF0a0H1V+VFeZ0Ki9GCUeIaiNq4ENS/
	 NfHFqeNwGF6OYGkZFnP4gqkenNoOSBY+6C1rGRdIAZu2oUNRGiZO5If5PpcNC2TQtvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JWSD75Qk;
	arc=none smtp.remote-ip=95.215.58.191
Received: from mta1.migadu.com (out-191.mta1.migadu.com [95.215.58.191])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A93B606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A93B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JWSD75Qk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fX4k36rbLJvsBWNAGcXTUmpAPCnDY00gcSOCzvETUGI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793957395; v=1; x=1794562195;
 b=JWSD75QksglvCndpzVxSygCHV94Yc8bj2n5IczJXMqmQaylMbAr5fRxmB/+BISjD4beh7+j7
 wjGCJ9+qRi8JOLoiYDUgDTGFgqZJvi0dDf3CUugKgjW6s+suldIYDiIYVQ6XxpOquLYx7+8/FJe
 VROG9JlTsaBeJXampLQoUryA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0dede42dda7479ec;
	Fri, 06 Nov 2026 09:29:55 +0000
X-Mizu-Trace-ID: 0dede42dda7479ec
X-Migadu-Flow: FLOW_OUT
Message-ID: <09095de1-3916-43a9-a217-ae8564ba4d4c@linux.dev>
Date: Fri, 6 Nov 2026 17:29:36 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: synchronize with PTE table reclaim for all folio
 sizes
Content-Language: en-US
To: baolin.wang@linux.alibaba.com
Cc: baohua@kernel.org, akpm@linux-foundation.org, david@kernel.org,
 ljs@kernel.org, riel@surriel.com, liam@infradead.org, vbabka@kernel.org,
 harry@kernel.org, jannh@google.com, qi.zheng@linux.dev, pfalcato@suse.de,
 ayushr@modal.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <453e2c18-4e79-4db2-b565-1af881925f08@linux.alibaba.com>
 <20261106091510.67980-1-lance.yang@linux.dev>
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20261106091510.67980-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/11/6 17:15, Lance Yang wrote:
> 
> On Fri, Nov 06, 2026 at 04:54:44PM +0800, Baolin Wang wrote:
>>
>>
>> On 11/6/26 2:24 PM, Barry Song wrote:
>>> On Thu, Nov 5, 2026 at 5:00 PM Baolin Wang
>>> <baolin.wang@linux.alibaba.com> wrote:
>>>>
>>>> CC Barry, who added the TTU_SYNC in shrink_folio_list().
>>>>
>>>> On 11/5/26 1:48 PM, Lance Yang wrote:
>>>>>
>>>>>
>>>>> On 2026/11/5 12:54, Lance Yang wrote:
>>>>>>
>>>>>> On Thu, Nov 05, 2026 at 10:56:28AM +0800, Baolin Wang wrote:
>>>>>>> Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing
>>>>>>> mapped
>>>>>>> folios"), the '!pmd_present()' check in page_vma_mapped_walk() can
>>>>>>> also race
>>>>>>> with concurrent page table reclamation via zap_empty_pte_table().
>>>>>>
>>>>>> Good catch!
>>>>>>
>>>>>>> page_vma_mapped_walk() is used by many functions including
>>>>>>> try_to_unmap(),
>>>>>>> try_to_migrate(), folio_mkclean(), pfn_mkclean_range(),
>>>>>>> remove_migration_ptes(),
>>>>>>> page_mapped_in_vma(), and mapping_wrprotect_range(). Except for
>>>>>>> try_to_unmap()
>>>>>>> and try_to_migrate(), the other callers do not perform post-walk
>>>>>>> accounting
>>>>>>> checks, so the race has no observable impact on them.
>>>>>>>
>>>>>>> For migration, the race can cause unnecessary retries. For reclaim via
>>>>>>> try_to_unmap(), the race can cause failure to reclaim a folio that is in
>>>>>>> fact already unmapped (as shown below), which may lead to unexpected OOM
>>>>>>> or increased refaults.
>>>>>>>
>>>>>>> CPU 0 (reclaim)                      CPU 1 (MADV_DONTNEED)
>>>>>>> --------------------------------    --------------------------------
>>>>>>> folio_lock(F)
>>>>>>> try_to_unmap(F, TTU_SYNC)
>>>>>>>                                       zap_pte_range(full PMD range)
>>>>>>>                                         spin_lock(ptl)
>>>>>>>                                         clear PTEs
>>>>>>>                                         zap_empty_pte_table()
>>>>>>>                                           spin_trylock(pml)
>>>>>>>                                           pmd_clear()
>>>>>>>                                           spin_unlock(pml)
>>>>>>>
>>>>>>>     page_vma_mapped_walk()
>>>>>>>       observe !pmd_present(pmde)
>>>>>>>       nr_pages < HPAGE_PMD_NR
>>>>>>>       skip synchronization
>>>>>>>       return false
>>>>>>>
>>>>>>> try_to_unmap() returns
>>>>>>> folio_mapped(F) == true
>>>>>>> nr_unmap_fail += folio_nr_pages(F)
>>>>>>>                                       tlb_flush_mmu_tlbonly()
>>>>>>>                                       tlb_flush_rmaps()
>>>>>>>                                         remove F's rmaps
>>>>>>>                                       spin_unlock(ptl)
>>>>>>>
>>>>>>> Commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped
>>>>>>> folios")
>>>>>>> has already moved the PMD clear operation (via zap_empty_pte_table()) to
>>>>>>> after tlb_flush_rmaps(). Similarly, page_vma_mapped_walk() also needs to
>>>>>>> use sync_with_folio_pmd_zap() to synchronize and avoid memory ordering
>>>>>>> issues on weakly ordered CPUs.
>>>>>>>
>>>>>>> Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in
>>>>>>> madvise(MADV_DONTNEED)")
>>>>>>> Cc: stable@vger.kernel.org
>>>>>>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
>>>>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>>>> ---
>>>>>>> mm/page_vma_mapped.c | 5 +----
>>>>>>> 1 file changed, 1 insertion(+), 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>>>>>>> index e6b6170c2f4f..8797467b6f0c 100644
>>>>>>> --- a/mm/page_vma_mapped.c
>>>>>>> +++ b/mm/page_vma_mapped.c
>>>>>>> @@ -293,10 +293,7 @@ bool page_vma_mapped_walk(struct
>>>>>>> page_vma_mapped_walk *pvmw)
>>>>>>>               spin_unlock(pvmw->ptl);
>>>>>>>               pvmw->ptl = NULL;
>>>>>>>           } else if (!pmd_present(pmde)) {
>>>>>>> -            if ((pvmw->flags & PVMW_SYNC) &&
>>>>>>> -                thp_vma_suitable_order(vma, pvmw->address,
>>>>>>> -                           PMD_ORDER) &&
>>>>>>> -                (pvmw->nr_pages >= HPAGE_PMD_NR))
>>>>>>> +            if (pvmw->flags & PVMW_SYNC)
>>>>>>
>>>>>> Right. Whether the folio can be PMD-mapped doesn't tell us whether its
>>>>>> PTE table can be reclaimed, so those extra checks can skip
>>>>>> synchronization
>>>>>> that the caller explicitly asked for ;)
>>>>>
>>>>> Ouch ... one thing I missed ... what about order-0 reclaim?
>>>>>
>>>>> shrink_folio_list() only sets TTU_SYNC for large folio, so can't we still
>>>>> hit the same race there?
>>>>
>>>> Thanks Lance. But this matches the purpose of the TTU_SYNC flag, which
>>>> is used to avoid racy checks with PVMW_SYNC. If no TTU_SYNC flag is set,
>>>> it means the caller can tolerate some racy checks.
>>>>
>>>> For this case, I think we should set TTU_SYNC unconditionally in
>>>> shrink_folio_list(). Barry, what do you think?
>>>
>>> Baolin, thanks for reaching out to me. I added that flag
>>> mainly for large folios.
>>>
>>> I observed cases where PTEs for large folios are partially
>>> cleared during certain transition states, for example, when
>>> PTEs are cleared before being modified:
>>>
>>> pte = ptep_get_and_clear();
>>> pte modification;
>>> set_pte_at();
>>>
>>> In such cases, page_vma_mapped_walk() skips the empty
>>> entries and starts from the next valid one.
>>>
>>> This may result in partially unmapping PTEs for large folios
>>> and trigger unexpected folio splits. At the time, I was
>>> particularly concerned about unnecessary folio splitting,
>>> so my focus was mainly on large folios.
>>
>> Thanks for the information.
>>
>>> However, I also noticed that a similar race can occur with
>>> small folios. In that case, the folio may simply remain
>>> unreclaimed by the reclamation path.
>>>
>>> However, my main concern at the time was avoiding
>>> unnecessary folio splits.
>>>
>>> Your new race also seems to amplify the same situation.
>>> However, I don't think this problem necessarily depends on
>>> the commit you mentioned. It has been around for a long time.
>>
>> Agree.
>>
>>> If the concern is reclaim failure, I agree that there is no
>>> fundamental difference between large folios and small folios.
>>
>> OK. And I did a quick measurement to reclaim anon and file folios via
>> the memory.reclaim interface.
>>
>>  From test results, reclaiming 1G small anonymous folios (using zram as
>> swap) shows no significant performance change. However, reclaiming 1G
>> mapped clean small file folios does show an observable regression if the
>> TTU_SYNC flag is set.
>>
>> Without TTU_SYNC for small folios:
>> time echo 1G > /sys/fs/cgroup/test/memory.reclaim
>> real	0m0.178s
>> user	0m0.000s
>> sys	0m0.178s
>>
>> With TTU_SYNC for small folios:
>> real	0m0.315s
>> user	0m0.000s
>> sys	0m0.314s
> 
> Nice numbers, cool!
> 
>> So for the current patch, I'd prefer to keep things as is: only sync
>> when TTU_SYNC is set. Without setting the TTU_SYNC flag, keep the
>> original logic, meaning the caller can tolerate some racy checks.
>>
>> Any other thoughts?
> 
> One thing I want to pin down first, for the order-0 folios, was that run
> with TTU_SYNC going through the pmd lock, or did it already go the
> smp_rmb() way?
> 
> My guess is the first one, right?
> 
> If so, please keep the fix as is and only sync when the caller asks for
> it (at least, order-0 folios should not go the pmd lock way) :D

In addition:

For order-0 folios, we'd miss reclaim and reactivate a cold folio.

That doesn't sound too bad, especially for such a rare race.

so keeping the current behavior seems reasonable given the sync
overhead ;)

> Cheers, Lance

