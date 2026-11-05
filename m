Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857741;
	b=jsMWBy6LAqrx0GswK9Oo8PRe1D9cyomuE1rQatoH1fPrbj4fN/Ykg9YXjsMkNPgnqkbB
	 RUt39ebpcjALR1dfDDXNZgpCjh1ZIcjYuzQDTPbQkwFxajvcdpTEP8P5iszfGuG0oYKrX
	 SEmhBifogZ6q8Ushn9cn2jMuJQkMfuY9KWHN/Poy8h/fwvThB0A/Q9UBecWq7XGHJW2SK
	 14Epcti7xiuitZ1RtVjdaWDBj+RBmuhmFWy8sF3EkrXRUT0l+UEqLZyQOq6r4Us9itkGZ
	 kKhjraSlVlvFN0dTXMLs9cmn+pRk2TeUwug02XBvtu5iAO5ld61T9mJMymmO18lyXcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857741;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=/l6O9V7fMoYs7ihQIlg7jRbOXL/S2bFnQjGLeMo1S78=;
	b=fTmG9P+S5PoNjEm5BCf2M4xDtg9Tp/alnjMq9j9aQQzf6RFh5O4ubI1TiFI7WaWYMNGj
	 zO83ZJ0drDpJYepn71W8W1JoqvHrhjLQer5Vu/wr9kjKSy28klZ1KjjhfGCxg/5u+McSI
	 UyD1DJblWrR3zCCTaNC/2GRwyIvu/WIA1vhfX+MvetmRtCD1cIXQOE7XLJwggg88cbcOG
	 EQWPn0KETASezFU/65voYTr6bZ+iq8biDpL3rvR0NQL6bkELdeXZywSLdIPJAUuE3s3T9
	 7gWMQg9TM5QOe32vYjG0CQsIqbN5W8wJNXyfj5FX+HX07MjbcOeT7sYCbqpIrHlVLxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JpMvdsIx;
	arc=none smtp.remote-ip=91.218.175.223
Received: from mta0.migadu.com (out-223.mta0.migadu.com [91.218.175.223])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C412606A339
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C412606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JpMvdsIx
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=l/klO32YzidFN2v1G4JzAIJs9vATWMhL2+jw9rYo5BY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793857735; v=1; x=1794462535;
 b=JpMvdsIxUYKjtKIiudsiyW9Sq9GKK1KU4Zx9S9a6W3ZxxzfjNmy/uAkswDpc/2CnYHA6KnI7
 rDnABgQXVr1PgaVyvm5LudW0X6ui3shigSzStXvnUFAyMUzIO4y9veyCYQzX25M3yJGZcvOfMS6
 5nTGhjYDggi2xM9o/B7q1fCg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3f45584444935ba1;
	Thu, 05 Nov 2026 05:48:54 +0000
X-Mizu-Trace-ID: 3f45584444935ba1
X-Migadu-Flow: FLOW_OUT
Message-ID: <0ddaf336-7cb7-4e83-af2c-f60d23f7aafd@linux.dev>
Date: Thu, 5 Nov 2026 13:48:42 +0800
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
To: baolin.wang@linux.alibaba.com
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 riel@surriel.com, liam@infradead.org, vbabka@kernel.org, harry@kernel.org,
 jannh@google.com, qi.zheng@linux.dev, pfalcato@suse.de, ayushr@modal.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
 <20261105045406.39871-1-lance.yang@linux.dev>
Content-Language: en-US
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20261105045406.39871-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/11/5 12:54, Lance Yang wrote:
> 
> On Thu, Nov 05, 2026 at 10:56:28AM +0800, Baolin Wang wrote:
>> Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped
>> folios"), the '!pmd_present()' check in page_vma_mapped_walk() can also race
>> with concurrent page table reclamation via zap_empty_pte_table().
> 
> Good catch!
> 
>> page_vma_mapped_walk() is used by many functions including try_to_unmap(),
>> try_to_migrate(), folio_mkclean(), pfn_mkclean_range(), remove_migration_ptes(),
>> page_mapped_in_vma(), and mapping_wrprotect_range(). Except for try_to_unmap()
>> and try_to_migrate(), the other callers do not perform post-walk accounting
>> checks, so the race has no observable impact on them.
>>
>> For migration, the race can cause unnecessary retries. For reclaim via
>> try_to_unmap(), the race can cause failure to reclaim a folio that is in
>> fact already unmapped (as shown below), which may lead to unexpected OOM
>> or increased refaults.
>>
>> CPU 0 (reclaim)                      CPU 1 (MADV_DONTNEED)
>> --------------------------------    --------------------------------
>> folio_lock(F)
>> try_to_unmap(F, TTU_SYNC)
>>                                     zap_pte_range(full PMD range)
>>                                       spin_lock(ptl)
>>                                       clear PTEs
>>                                       zap_empty_pte_table()
>>                                         spin_trylock(pml)
>>                                         pmd_clear()
>>                                         spin_unlock(pml)
>>
>>   page_vma_mapped_walk()
>>     observe !pmd_present(pmde)
>>     nr_pages < HPAGE_PMD_NR
>>     skip synchronization
>>     return false
>>
>> try_to_unmap() returns
>> folio_mapped(F) == true
>> nr_unmap_fail += folio_nr_pages(F)
>>                                     tlb_flush_mmu_tlbonly()
>>                                     tlb_flush_rmaps()
>>                                       remove F's rmaps
>>                                     spin_unlock(ptl)
>>
>> Commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped folios")
>> has already moved the PMD clear operation (via zap_empty_pte_table()) to
>> after tlb_flush_rmaps(). Similarly, page_vma_mapped_walk() also needs to
>> use sync_with_folio_pmd_zap() to synchronize and avoid memory ordering
>> issues on weakly ordered CPUs.
>>
>> Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in madvise(MADV_DONTNEED)")
>> Cc: stable@vger.kernel.org
>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>> mm/page_vma_mapped.c | 5 +----
>> 1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>> index e6b6170c2f4f..8797467b6f0c 100644
>> --- a/mm/page_vma_mapped.c
>> +++ b/mm/page_vma_mapped.c
>> @@ -293,10 +293,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>> 			spin_unlock(pvmw->ptl);
>> 			pvmw->ptl = NULL;
>> 		} else if (!pmd_present(pmde)) {
>> -			if ((pvmw->flags & PVMW_SYNC) &&
>> -			    thp_vma_suitable_order(vma, pvmw->address,
>> -						   PMD_ORDER) &&
>> -			    (pvmw->nr_pages >= HPAGE_PMD_NR))
>> +			if (pvmw->flags & PVMW_SYNC)
> 
> Right. Whether the folio can be PMD-mapped doesn't tell us whether its
> PTE table can be reclaimed, so those extra checks can skip synchronization
> that the caller explicitly asked for ;)

Ouch ... one thing I missed ... what about order-0 reclaim?

shrink_folio_list() only sets TTU_SYNC for large folio, so can't we still
hit the same race there?

Cheers, Lance

> LGTM, thanks!
> 
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> 
>> 				sync_with_folio_pmd_zap(mm, pvmw->pmd);
>>
>> 			goto next_pmd;
>> -- 
>> 2.47.3
>>
>>

