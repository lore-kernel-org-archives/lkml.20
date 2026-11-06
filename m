Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.189
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956521;
	b=tb2AGoMk4r5xBhb4E6hXRIG2Ugv4NjFjpOt3f/Yrjri2LsmPWuXhaXX5Le3q+6kO0iZH
	 KbmInW5OP/wesbO/eheStmWTAiYozLIsm9rPQ2SJDywYTlQXw/C8t9CLMAk45hddJoIbc
	 EYgq9G6oqze2husKiLOXiWU5bhjDjYD36Y4GmInP8Fu590DNxr8gqz9BE9Yyv9/QOnkbI
	 qsNoFBNhFAba31L/mUAtAiP6ihWd0krmAN4nuq1I9igGlUqxPLURRD4oONNr+rIUtOYW5
	 J4YJZj+snAl4JJblU2m/f5lZciVvWsiWVoDdAu2ftPdRVJiCj1ECOOQVq9W/AU9Bjow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956521;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ctycaF2KOXwWuXEDXSNAYypG2JZO9cxBfbE3KtRR508=;
	b=uzwBgPTMGBLkJy3ExhSvMmjwPv8S/nmDztUOwF69hFKONx/fWVb8eLJJByqijY1XhOyM
	 ZJWpGKxrolcloHad+lD390Z+rpIpMtW0uEVKQy7hf8PJTOxgvrPXEFryO7JqkZUFKR0Id
	 msK9ld2VV1dtS/wRl+1JP8m1fNdZT7fjAoSnA1HSpBdxSBSa/dbKhfPyO+7RfXrdNaLS9
	 s7o/yUaWFAUCT/0K+KRW/Ui0LtAplWWg9W9nbJhYE0uRRBPwC4aKvTAZozkZiyPCXW20q
	 xo/yTKgBthjCHG7t92uSIndVONUrGYxzmcw0MIsiU/Jf9HDi6bQOiLK2hNp8bs8ixww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=t++7t+Nj;
	arc=none smtp.remote-ip=95.215.58.189
Received: from mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95892606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95892606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=t++7t+Nj
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Oe28MT9PKJAMfqKhdWMUFjyxqbMd1HIlftDdBYgWRmE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793956518; v=1; x=1794561318;
 b=t++7t+NjOpL8roCsTGtIavPsidMJcvLd4y9Lsr6MalyVXoYgggPgY7SL35WvUYAKdzgR28Pt
 gSS5YFPEivkVFhFnM7eBIUB5pU5zaCHS3k97wF6ZNOJ3n4bAEyFjI9+NflglhOcWXhsS0P5KCY+
 UDPQVgQRMMQA+Hr7l0J2lw5I=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dcf04c63a15f31f4;
	Fri, 06 Nov 2026 09:15:16 +0000
X-Mizu-Trace-ID: dcf04c63a15f31f4
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: baolin.wang@linux.alibaba.com
Cc: baohua@kernel.org,
	lance.yang@linux.dev,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	riel@surriel.com,
	liam@infradead.org,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	qi.zheng@linux.dev,
	pfalcato@suse.de,
	ayushr@modal.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: synchronize with PTE table reclaim for all folio sizes
Date: Fri,  6 Nov 2026 17:15:10 +0800
Message-ID: <20261106091510.67980-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <453e2c18-4e79-4db2-b565-1af881925f08@linux.alibaba.com>
References: <453e2c18-4e79-4db2-b565-1af881925f08@linux.alibaba.com>
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


On Fri, Nov 06, 2026 at 04:54:44PM +0800, Baolin Wang wrote:
>
>
>On 11/6/26 2:24 PM, Barry Song wrote:
>> On Thu, Nov 5, 2026 at 5:00 PM Baolin Wang
>> <baolin.wang@linux.alibaba.com> wrote:
>>>
>>> CC Barry, who added the TTU_SYNC in shrink_folio_list().
>>>
>>> On 11/5/26 1:48 PM, Lance Yang wrote:
>>>>
>>>>
>>>> On 2026/11/5 12:54, Lance Yang wrote:
>>>>>
>>>>> On Thu, Nov 05, 2026 at 10:56:28AM +0800, Baolin Wang wrote:
>>>>>> Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing
>>>>>> mapped
>>>>>> folios"), the '!pmd_present()' check in page_vma_mapped_walk() can
>>>>>> also race
>>>>>> with concurrent page table reclamation via zap_empty_pte_table().
>>>>>
>>>>> Good catch!
>>>>>
>>>>>> page_vma_mapped_walk() is used by many functions including
>>>>>> try_to_unmap(),
>>>>>> try_to_migrate(), folio_mkclean(), pfn_mkclean_range(),
>>>>>> remove_migration_ptes(),
>>>>>> page_mapped_in_vma(), and mapping_wrprotect_range(). Except for
>>>>>> try_to_unmap()
>>>>>> and try_to_migrate(), the other callers do not perform post-walk
>>>>>> accounting
>>>>>> checks, so the race has no observable impact on them.
>>>>>>
>>>>>> For migration, the race can cause unnecessary retries. For reclaim via
>>>>>> try_to_unmap(), the race can cause failure to reclaim a folio that is in
>>>>>> fact already unmapped (as shown below), which may lead to unexpected OOM
>>>>>> or increased refaults.
>>>>>>
>>>>>> CPU 0 (reclaim)                      CPU 1 (MADV_DONTNEED)
>>>>>> --------------------------------    --------------------------------
>>>>>> folio_lock(F)
>>>>>> try_to_unmap(F, TTU_SYNC)
>>>>>>                                      zap_pte_range(full PMD range)
>>>>>>                                        spin_lock(ptl)
>>>>>>                                        clear PTEs
>>>>>>                                        zap_empty_pte_table()
>>>>>>                                          spin_trylock(pml)
>>>>>>                                          pmd_clear()
>>>>>>                                          spin_unlock(pml)
>>>>>>
>>>>>>    page_vma_mapped_walk()
>>>>>>      observe !pmd_present(pmde)
>>>>>>      nr_pages < HPAGE_PMD_NR
>>>>>>      skip synchronization
>>>>>>      return false
>>>>>>
>>>>>> try_to_unmap() returns
>>>>>> folio_mapped(F) == true
>>>>>> nr_unmap_fail += folio_nr_pages(F)
>>>>>>                                      tlb_flush_mmu_tlbonly()
>>>>>>                                      tlb_flush_rmaps()
>>>>>>                                        remove F's rmaps
>>>>>>                                      spin_unlock(ptl)
>>>>>>
>>>>>> Commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped
>>>>>> folios")
>>>>>> has already moved the PMD clear operation (via zap_empty_pte_table()) to
>>>>>> after tlb_flush_rmaps(). Similarly, page_vma_mapped_walk() also needs to
>>>>>> use sync_with_folio_pmd_zap() to synchronize and avoid memory ordering
>>>>>> issues on weakly ordered CPUs.
>>>>>>
>>>>>> Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in
>>>>>> madvise(MADV_DONTNEED)")
>>>>>> Cc: stable@vger.kernel.org
>>>>>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
>>>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>>> ---
>>>>>> mm/page_vma_mapped.c | 5 +----
>>>>>> 1 file changed, 1 insertion(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>>>>>> index e6b6170c2f4f..8797467b6f0c 100644
>>>>>> --- a/mm/page_vma_mapped.c
>>>>>> +++ b/mm/page_vma_mapped.c
>>>>>> @@ -293,10 +293,7 @@ bool page_vma_mapped_walk(struct
>>>>>> page_vma_mapped_walk *pvmw)
>>>>>>              spin_unlock(pvmw->ptl);
>>>>>>              pvmw->ptl = NULL;
>>>>>>          } else if (!pmd_present(pmde)) {
>>>>>> -            if ((pvmw->flags & PVMW_SYNC) &&
>>>>>> -                thp_vma_suitable_order(vma, pvmw->address,
>>>>>> -                           PMD_ORDER) &&
>>>>>> -                (pvmw->nr_pages >= HPAGE_PMD_NR))
>>>>>> +            if (pvmw->flags & PVMW_SYNC)
>>>>>
>>>>> Right. Whether the folio can be PMD-mapped doesn't tell us whether its
>>>>> PTE table can be reclaimed, so those extra checks can skip
>>>>> synchronization
>>>>> that the caller explicitly asked for ;)
>>>>
>>>> Ouch ... one thing I missed ... what about order-0 reclaim?
>>>>
>>>> shrink_folio_list() only sets TTU_SYNC for large folio, so can't we still
>>>> hit the same race there?
>>>
>>> Thanks Lance. But this matches the purpose of the TTU_SYNC flag, which
>>> is used to avoid racy checks with PVMW_SYNC. If no TTU_SYNC flag is set,
>>> it means the caller can tolerate some racy checks.
>>>
>>> For this case, I think we should set TTU_SYNC unconditionally in
>>> shrink_folio_list(). Barry, what do you think?
>> 
>> Baolin, thanks for reaching out to me. I added that flag
>> mainly for large folios.
>> 
>> I observed cases where PTEs for large folios are partially
>> cleared during certain transition states, for example, when
>> PTEs are cleared before being modified:
>> 
>> pte = ptep_get_and_clear();
>> pte modification;
>> set_pte_at();
>> 
>> In such cases, page_vma_mapped_walk() skips the empty
>> entries and starts from the next valid one.
>> 
>> This may result in partially unmapping PTEs for large folios
>> and trigger unexpected folio splits. At the time, I was
>> particularly concerned about unnecessary folio splitting,
>> so my focus was mainly on large folios.
>
>Thanks for the information.
>
>> However, I also noticed that a similar race can occur with
>> small folios. In that case, the folio may simply remain
>> unreclaimed by the reclamation path.
>> 
>> However, my main concern at the time was avoiding
>> unnecessary folio splits.
>> 
>> Your new race also seems to amplify the same situation.
>> However, I don't think this problem necessarily depends on
>> the commit you mentioned. It has been around for a long time.
>
>Agree.
>
>> If the concern is reclaim failure, I agree that there is no
>> fundamental difference between large folios and small folios.
>
>OK. And I did a quick measurement to reclaim anon and file folios via 
>the memory.reclaim interface.
>
> From test results, reclaiming 1G small anonymous folios (using zram as 
>swap) shows no significant performance change. However, reclaiming 1G 
>mapped clean small file folios does show an observable regression if the 
>TTU_SYNC flag is set.
>
>Without TTU_SYNC for small folios:
>time echo 1G > /sys/fs/cgroup/test/memory.reclaim
>real	0m0.178s
>user	0m0.000s
>sys	0m0.178s
>
>With TTU_SYNC for small folios:
>real	0m0.315s
>user	0m0.000s
>sys	0m0.314s

Nice numbers, cool!

>So for the current patch, I'd prefer to keep things as is: only sync 
>when TTU_SYNC is set. Without setting the TTU_SYNC flag, keep the 
>original logic, meaning the caller can tolerate some racy checks.
>
>Any other thoughts?

One thing I want to pin down first, for the order-0 folios, was that run
with TTU_SYNC going through the pmd lock, or did it already go the
smp_rmb() way?

My guess is the first one, right?

If so, please keep the fix as is and only sync when the caller asks for
it (at least, order-0 folios should not go the pmd lock way) :D

Cheers, Lance
