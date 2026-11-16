Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800698;
	b=OpEy95gMQhwatE+oGth6XsG48fjdC5t5u2jlbfcT8o+Ut6HWRKhXim2WqiqlhoBSPeD0
	 q9RZwTwBA0YsDScFwGyuVsVK//ekNZge9PXzrP5J3ZgEFMSw02zlR53N8lNO41S/zKL8a
	 1jKsvxS+riQVKnngrROGFTNLJPxi1x2HqAjyo8OEw8ecnDffOGVU231tmbxmGe7J619II
	 i1LpplIT0/JVfnp6yJhYQkgqT6R373G1PDeDehtG5V79PVBvTvjQ2cFFXrSPWOap/MwdH
	 69y/GmiwMhRCw4o7OX2PCb7C0z0aHCqOYq6E10hZIkZ8oXG3Q2RT+RClr4d7o2vdIzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800698;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1ZQTmnkOlTIQcpFlUhpI85UknghQOhoWHtJld43E1F0=;
	b=xQnrvqOhQvAGDBtMQa+YT/Ft7IlPZLBgA+QZ7MFvft/Gu/Yroldop8bR0deRBIAmF7BH
	 cE0wGLPH9vz6qVpVY0Ic4OmS+AMIO1VDQTsP1B1XK+zdm7aWSjX9jcClSyVZ161c8WB7S
	 TyFIV2H307hML98HfYsEoood7XV+2yueXwCTizIzY13afLKcOdMVesDERN1w8sjjNFV/L
	 XF5yv/vl8V9Z1m7Zv6RVe3FBLf4XdPmOSp6Tsg6tP2KJyX4rDzSaPKuF7tQJ0sbaFyv67
	 aMX2UnLKuZGEpZvjpZa/YbtH3WvbSvJnX28s4sWzoyRSzuQp1EAGDuEi3jxB5fa5NpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=offsKLS6;
	arc=none smtp.remote-ip=115.124.30.101
Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75577606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75577606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=offsKLS6
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794800688; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=1ZQTmnkOlTIQcpFlUhpI85UknghQOhoWHtJld43E1F0=;
	b=offsKLS6hLz5GejrRr3iFad1aDU3OQk0CaxHwMi4ao02j5fSaXDu35PztcimGC8Rb2+ooDOX+OIC+WJRntqfWc9E1IkXAsStSOJIAw3lIx6MfFEB+04b61R08w1fiR7/0T+1kkLemSnVQqjBcC+9/JT0sxo/xWixm26bQdlNKiw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XElOevH_1794800685;
Received: from 30.74.144.137(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XElOevH_1794800685 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 16 Nov 2026 11:44:46 +0800
Message-ID: <d1856861-62d7-4bc0-a8b7-39ccfc064f34@linux.alibaba.com>
Date: Mon, 16 Nov 2026 11:44:44 +0800
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
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org,
 ljs@kernel.org
Cc: riel@surriel.com, liam@infradead.org, vbabka@kernel.org,
 harry@kernel.org, jannh@google.com, lance.yang@linux.dev,
 qi.zheng@linux.dev, pfalcato@suse.de, ayushr@modal.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
 <16bb1a14-04f4-4524-9882-20d452175a3d@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <16bb1a14-04f4-4524-9882-20d452175a3d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/14/26 1:39 AM, David Hildenbrand (Arm) wrote:
> On 11/5/26 03:56, Baolin Wang wrote:
>> Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped
>> folios"), the '!pmd_present()' check in page_vma_mapped_walk() can also race
>> with concurrent page table reclamation via zap_empty_pte_table().
>>
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
>>                                      zap_pte_range(full PMD range)
>>                                        spin_lock(ptl)
>>                                        clear PTEs
>>                                        zap_empty_pte_table()
>>                                          spin_trylock(pml)
>>                                          pmd_clear()
>>                                          spin_unlock(pml)
>>
>>    page_vma_mapped_walk()
>>      observe !pmd_present(pmde)
>>      nr_pages < HPAGE_PMD_NR
>>      skip synchronization
>>      return false
>>
>> try_to_unmap() returns
>> folio_mapped(F) == true
>> nr_unmap_fail += folio_nr_pages(F)
>>                                      tlb_flush_mmu_tlbonly()
>>                                      tlb_flush_rmaps()
>>                                        remove F's rmaps
>>                                      spin_unlock(ptl)
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
>>   mm/page_vma_mapped.c | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>> index e6b6170c2f4f..8797467b6f0c 100644
>> --- a/mm/page_vma_mapped.c
>> +++ b/mm/page_vma_mapped.c
>> @@ -293,10 +293,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>   			spin_unlock(pvmw->ptl);
>>   			pvmw->ptl = NULL;
>>   		} else if (!pmd_present(pmde)) {
>> -			if ((pvmw->flags & PVMW_SYNC) &&
>> -			    thp_vma_suitable_order(vma, pvmw->address,
>> -						   PMD_ORDER) &&
>> -			    (pvmw->nr_pages >= HPAGE_PMD_NR))
>> +			if (pvmw->flags & PVMW_SYNC)
>>   				sync_with_folio_pmd_zap(mm, pvmw->pmd);
>>   
>>   			goto next_pmd;
> 
> Baolin, how to proceed with that? Are you intending a resend? Including some of
> the performance impact and ways forward to optimize?

I hope we can merge this fix first if no other objections. As I replied 
to Barry, whether to set TTU_SYNC for small folios should be done in a 
separate patch (this is a pre-existing issue) with proper measurement 
(though it may be hard to measure the actual impact). What do you think?
