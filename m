Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869213;
	b=r4ZIRF8nPSnRLuQ+r7ifam2vKsGwYUs5gihF3pIBPC13NRPXRxbL6mj4N+lOJl7FBzHb
	 TaRZKwcXARtDaINO6/HqH6BcoEPU2apJePT6G3v95VKtCiMaYRdD2Nfw4zhWy/REG+FVq
	 Qtw43hZISAecGftXXbvoWaBP2c764DNufsUctewvfzq0vFnkrLgbLUforXjjIRyiOi0VX
	 32dOakg6+yzHHk2CJcc/0C3QtRvP0bGWQhbo1TcibUcYhIBr15xoO4qaEeX8bizlPLML5
	 MVJEHmqxWuL5tXpMlNNAzfuYiXF6WgY+6DbtZsP5XLRSCP/yownvE9q7qMKbSvEHbIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869213;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Qpa3NEcxqfBmlG+KsMNpjxHv3Qlvd6eoPxtMyefULAQ=;
	b=Hb5/jHBMnyKqrPHuCRaZC86JjZ0bZfbIebkL4aiTiW6hggFV7yjkOrPiiUONoBqsM+fS
	 l7+Ksv5h2SzRS/pRK3XvuT3+Bd2/ehXU4+iwAsVMh3j8BnmZqNgXZxQFl3l54nfeMGtdU
	 D7nVNcBIXwfYuDCK+jHc8BwFM8Wd7IGyLkDDc1aPzMo76EhdzTi/wcZG1jYPQaqYVQxqQ
	 MpCJB8WlpIphlqNyTZmeDv0SjbVs7WmJa9++YUoBjlOHeebSeocBZfrm1vV3i+4Oj64tN
	 voRcIhGPVPnMe5BzTp3Whz3OpwucvMML+MEbH8Hu83j6ZxEoelj6Hmi2ekbSxDD9AUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="O/0jd9AE";
	arc=none smtp.remote-ip=115.124.30.97
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08B0606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F08B0606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=O/0jd9AE
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793869207; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Qpa3NEcxqfBmlG+KsMNpjxHv3Qlvd6eoPxtMyefULAQ=;
	b=O/0jd9AEo1GMG8+vy3JlMrJYv8Wx4Jbe+VaeeqUG1iwgmFgGTFOx7C9Dqog1EiyUj/ekQfMmnuipgkPEzqcxMNvNyz1lOPa54FCvjLA8QnQOXlBZ6oaZcl0fUAKSwaV8HcPuT1Ijf0406dx17QkwrwN03kX9QV50WGzfhjStC24=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XE8DxBe_1793869204;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XE8DxBe_1793869204 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:00:05 +0800
Message-ID: <f7bd740e-1328-473e-96f5-89658a08d514@linux.alibaba.com>
Date: Thu, 5 Nov 2026 17:00:03 +0800
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
To: Lance Yang <lance.yang@linux.dev>, Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 riel@surriel.com, liam@infradead.org, vbabka@kernel.org, harry@kernel.org,
 jannh@google.com, qi.zheng@linux.dev, pfalcato@suse.de, ayushr@modal.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
 <20261105045406.39871-1-lance.yang@linux.dev>
 <0ddaf336-7cb7-4e83-af2c-f60d23f7aafd@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <0ddaf336-7cb7-4e83-af2c-f60d23f7aafd@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

CC Barry, who added the TTU_SYNC in shrink_folio_list().

On 11/5/26 1:48 PM, Lance Yang wrote:
> 
> 
> On 2026/11/5 12:54, Lance Yang wrote:
>>
>> On Thu, Nov 05, 2026 at 10:56:28AM +0800, Baolin Wang wrote:
>>> Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing 
>>> mapped
>>> folios"), the '!pmd_present()' check in page_vma_mapped_walk() can 
>>> also race
>>> with concurrent page table reclamation via zap_empty_pte_table().
>>
>> Good catch!
>>
>>> page_vma_mapped_walk() is used by many functions including 
>>> try_to_unmap(),
>>> try_to_migrate(), folio_mkclean(), pfn_mkclean_range(), 
>>> remove_migration_ptes(),
>>> page_mapped_in_vma(), and mapping_wrprotect_range(). Except for 
>>> try_to_unmap()
>>> and try_to_migrate(), the other callers do not perform post-walk 
>>> accounting
>>> checks, so the race has no observable impact on them.
>>>
>>> For migration, the race can cause unnecessary retries. For reclaim via
>>> try_to_unmap(), the race can cause failure to reclaim a folio that is in
>>> fact already unmapped (as shown below), which may lead to unexpected OOM
>>> or increased refaults.
>>>
>>> CPU 0 (reclaim)                      CPU 1 (MADV_DONTNEED)
>>> --------------------------------    --------------------------------
>>> folio_lock(F)
>>> try_to_unmap(F, TTU_SYNC)
>>>                                     zap_pte_range(full PMD range)
>>>                                       spin_lock(ptl)
>>>                                       clear PTEs
>>>                                       zap_empty_pte_table()
>>>                                         spin_trylock(pml)
>>>                                         pmd_clear()
>>>                                         spin_unlock(pml)
>>>
>>>   page_vma_mapped_walk()
>>>     observe !pmd_present(pmde)
>>>     nr_pages < HPAGE_PMD_NR
>>>     skip synchronization
>>>     return false
>>>
>>> try_to_unmap() returns
>>> folio_mapped(F) == true
>>> nr_unmap_fail += folio_nr_pages(F)
>>>                                     tlb_flush_mmu_tlbonly()
>>>                                     tlb_flush_rmaps()
>>>                                       remove F's rmaps
>>>                                     spin_unlock(ptl)
>>>
>>> Commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped 
>>> folios")
>>> has already moved the PMD clear operation (via zap_empty_pte_table()) to
>>> after tlb_flush_rmaps(). Similarly, page_vma_mapped_walk() also needs to
>>> use sync_with_folio_pmd_zap() to synchronize and avoid memory ordering
>>> issues on weakly ordered CPUs.
>>>
>>> Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in 
>>> madvise(MADV_DONTNEED)")
>>> Cc: stable@vger.kernel.org
>>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> ---
>>> mm/page_vma_mapped.c | 5 +----
>>> 1 file changed, 1 insertion(+), 4 deletions(-)
>>>
>>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>>> index e6b6170c2f4f..8797467b6f0c 100644
>>> --- a/mm/page_vma_mapped.c
>>> +++ b/mm/page_vma_mapped.c
>>> @@ -293,10 +293,7 @@ bool page_vma_mapped_walk(struct 
>>> page_vma_mapped_walk *pvmw)
>>>             spin_unlock(pvmw->ptl);
>>>             pvmw->ptl = NULL;
>>>         } else if (!pmd_present(pmde)) {
>>> -            if ((pvmw->flags & PVMW_SYNC) &&
>>> -                thp_vma_suitable_order(vma, pvmw->address,
>>> -                           PMD_ORDER) &&
>>> -                (pvmw->nr_pages >= HPAGE_PMD_NR))
>>> +            if (pvmw->flags & PVMW_SYNC)
>>
>> Right. Whether the folio can be PMD-mapped doesn't tell us whether its
>> PTE table can be reclaimed, so those extra checks can skip 
>> synchronization
>> that the caller explicitly asked for ;)
> 
> Ouch ... one thing I missed ... what about order-0 reclaim?
> 
> shrink_folio_list() only sets TTU_SYNC for large folio, so can't we still
> hit the same race there?

Thanks Lance. But this matches the purpose of the TTU_SYNC flag, which 
is used to avoid racy checks with PVMW_SYNC. If no TTU_SYNC flag is set, 
it means the caller can tolerate some racy checks.

For this case, I think we should set TTU_SYNC unconditionally in 
shrink_folio_list(). Barry, what do you think?
