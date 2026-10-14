Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3EE490BE4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971482; cv=none; b=eCORhwkD2DeuYm+D1HR9pHOopuGpongO+8s91+q6wR1JaisC6wlCRYeWhWe9vMzBEjX8AhzAucDe2abUcHIU0Vk84DaOd1NVAeLHBRqgTzvqyi8AZb5fo6wugQ1Y4fALiOS9cRn+GBmJZGa3zwEA1RLnwQZP3VqCJ4E1ah6O91A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971482; c=relaxed/simple;
	bh=mgHymC3QtlZF0HjAm0J0yRsEtIy6iQrVqJmL2oqoEjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y1ckgs7j5/Y10+xMl+hm5/XHhP3uN4QGaApOKydi2fsFXFiHEsZ31OUSbWgxvH3akdIh6/ua70fzsXARsLpptZH8XzHvmwlHy6FXJaMkJMMnI5bb33LGt6wqfzaxYS4h68MjAl6n4Z3PFFfWOHFKchU1W5M6j/dWUXkGN2xFMBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=hcgsS9If; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="hcgsS9If"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791971476; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=g7PVsWTOJqkiosjUN8H7OzSWCN6+Mwp1tgv/kocb8dk=;
	b=hcgsS9IfPd7Xc6YtcztfosFld46DBOONuESamUPMDaXN9VeiOInHUbq9IK1yjKQWdRLcFAuFVmRFngGk5TZp1nqLXWPGvPZH4w/FOOLrIVtwGbLUbilGSxYjMqjax6PSz/k8yS0bZGXZSMm6tiFlkX7lyKHaNmj/VnfRcuYGfbo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XCon-04_1791971473;
Received: from 30.74.144.153(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XCon-04_1791971473 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 Oct 2026 17:51:14 +0800
Message-ID: <41966c48-3a10-43e6-9b12-f15a9621af6f@linux.alibaba.com>
Date: Wed, 14 Oct 2026 17:51:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: memory: fix truncation removing mapped folios
To: Pedro Falcato <pfalcato@suse.de>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, qi.zheng@linux.dev, jack@suse.cz, ayushr@modal.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <542c97482eae84f86704bcee56482633d1b32321.1791616645.git.baolin.wang@linux.alibaba.com>
 <as4FIaQlxb_nqyX9@pedro-suse.tail5790ac.ts.net>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <as4FIaQlxb_nqyX9@pedro-suse.tail5790ac.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/13/26 6:24 PM, Pedro Falcato wrote:
> On Sat, Oct 10, 2026 at 03:22:18PM +0800, Baolin Wang wrote:
>> Ayush reported an issue that shmem/tmpfs folios are still mapped when
>> truncating them on production:
>> "
>> BUG: Bad page cache in process ...  pfn:...
>> page dumped because: still mapped when deleted
>> "
>>
>> I reproduced the issue with Ayush's reproducer [1] with the latest mm-unstable
>> branch, and I got the following crash info. From the dump message, we can
>> see that truncate_inode_folio() is really trying to remove mapped folios,
>> which is incorrect.
>>
>> "
>> [  189.171977] page: refcount:3 mapcount:1 mapping:00000000fe168ee1
>> index:0x3880 pfn:0x191647
>> [  189.171995] memcg:ffff0000cc073d40
>> [  189.171997] aops:shmem_aops ino:3c01 dentry name(?):"memfd:runsc-memory"
>> [  189.172006] flags: 0x17fffef0002022d(locked|referenced|uptodate|lru|
>> workingset|swapbacked|node=0|zone=2|lastcpupid=0x3ffff)
>> .......
>> [  189.172017] page dumped because: VM_BUG_ON_FOLIO(folio_mapped(folio))
>> [  189.172026] ------------[ cut here ]------------
>> [  189.172027] kernel BUG at mm/filemap.c:155!
>> [  189.172057] Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
>> .......
>> [  189.177721] CPU: 3 UID: 0 PID: 5521 Comm: repro Kdump: loaded Tainted:
>> 7.3.0-rc4+ #277 PREEMPT(lazy)
>> .......
>> [  189.183986] Call trace:
>> [  189.184124]  filemap_unaccount_folio+0xf0/0x1e8 (P)
>> [  189.184391]  __filemap_remove_folio+0x34/0x160
>> [  189.184633]  filemap_remove_folio+0x4c/0xb0
>> [  189.184859]  truncate_inode_folio+0x34/0x58
>> [  189.185087]  shmem_undo_range+0x220/0x658
>> [  189.185308]  shmem_fallocate+0x2f0/0x470
>> [  189.185527]  vfs_fallocate+0x128/0x328
>> ......
>> [  189.187078]  el0t_64_sync+0x184/0x188
>> "
>>
>> After analysis, I believe the race exists between truncation and MADV_DONTNEED,
>> and shmem's ->map_pages() merely makes the issue easier to reproduce. Since
>> MADV_DONTNEED synchronously releases the pagetable page before calling
>> tlb_flush_rmaps(), this could cause another thread's truncation to skip
>> zap_pte_range() (due to pmd is none) but still observe the folio's mapcount
>> as non-zero. A possible race scenario is as follows:
>>
>> CPU 0                           CPU 1
>> shmem_fallocate                 madvise_dontneed_single_vma
>>    unmap_mapping_range            .......
>>    ......
>>    (filemap_map_pages() remap folios)
>> 				  zap_pte_range
>>    truncate_inode_folio		    zap_empty_pte_table(pmd clear)
>>      unmap_mapping_folio
>>      ......
>>        zap_pmd_range (saw pmd none, skip)
>>
>>    filemap_remove_folio
>>      BUG_ON(folio_mapped)
>>                                      tlb_flush_rmaps(remove rmaps)
>>
>> To fix this issue, we should move the pmd clear operation (via zap_empty_pte_table())
>> to after tlb_flush_rmaps() and add smp_wmb()/smp_rmb() memory barriers, so that
>> when we find a pmd_none() while unmapping a folio without holding the PTL, the
>> folio's mappings are guaranteed to have been removed via tlb_flush_rmaps().
>>
>> [1] https://lore.kernel.org/all/20260925065013.3682431-1-ayushr@modal.com/
>> Reported-by: Ayush Ranjan <ayushr@modal.com>
>> Closes: https://lore.kernel.org/all/20260924061708.1645968-1-ayushr@modal.com/
>> Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in madvise(MADV_DONTNEED)")
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> Reviewed-by: Pedro Falcato <pfalcato@suse.de>

Thanks.

> Mostly LGTM, thanks!
> 
>> ---
>> Changes from v1:
>>   - Add an smp_rmb() to pair with the smp_wmb() (Per Lorenzo and Pedro).
>> ---
>>   mm/memory.c | 29 ++++++++++++++++++++---------
>>   1 file changed, 20 insertions(+), 9 deletions(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 6a8e7772b8d6..c3a1faf580c8 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -2036,6 +2036,15 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>>   		}
>>   	} while (pte += nr, addr += PAGE_SIZE * nr, addr != end);
>>   
>> +	add_mm_rss_vec(mm, rss);
>> +	lazy_mmu_mode_disable();
>> +
>> +	/* Do the actual TLB flush before dropping ptl */
>> +	if (force_flush) {
>> +		tlb_flush_mmu_tlbonly(tlb);
>> +		tlb_flush_rmaps(tlb, vma);
>> +	}
>> +
>>   	/*
>>   	 * Fast path: try to hold the pmd lock and unmap the PTE page.
>>   	 *
>> @@ -2044,16 +2053,13 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>>   	 * to ensure they are still none, thereby preventing the pte entries
>>   	 * from being repopulated by another thread.
>>   	 */
>> -	if (can_reclaim_pt && direct_reclaim && addr == end)
>> +	if (can_reclaim_pt && direct_reclaim && addr == end) {
>> +		/*
>> +		 * The rmap changes need to be observed before PTEs get zapped.
>> +		 * Pairs with smp_rmb() in zap_pmd_range().
>> +		 */
> 
> I'd amend this comment to something like:
> 		/*
> 		 * rmap changes need to be observed before page tables get zapped.
> 		 * Pairs with smp_rmb() in zap_pmd_range().
> 		 */

Ack.

>> +		smp_wmb();
>>   		direct_reclaim = zap_empty_pte_table(mm, pmd, ptl, &pmdval);
>> -
>> -	add_mm_rss_vec(mm, rss);
>> -	lazy_mmu_mode_disable();
>> -
>> -	/* Do the actual TLB flush before dropping ptl */
>> -	if (force_flush) {
>> -		tlb_flush_mmu_tlbonly(tlb);
>> -		tlb_flush_rmaps(tlb, vma);
>>   	}
>>   	pte_unmap_unlock(start_pte, ptl);
>>   
>> @@ -2108,6 +2114,11 @@ static inline unsigned long zap_pmd_range(struct mmu_gather *tlb,
>>   			sync_with_folio_pmd_zap(tlb->mm, pmd);
>>   		}
>>   		if (pmd_none(*pmd)) {
>> +			/*
>> +			 * Order this PMD read before the folio's mapcount read.
>> +			 * Pairs with smp_wmb() in zap_pte_range().
>> +			 */
> 
> and this one to something like:
> 			/*
> 			 * Order this PMD read before any (possible) mapcount/rmap read.
> 			 * This isn't a problem in most cases, due to us synchronizing on
> 			 * the PTE lock, but such doesn't happen when PTE tables are zapped.
> 			 * Pairs with smp_wmb() in zap_pte_range().
> 			 */

Ack.

>> +			smp_rmb();
>>   			addr = next;
>>   			continue;
>>   		}
> 
> Also, as a note, I would suggest we hold off on this fix until the merge window.

No strong opinion.

> I don't think it's that urgent, and it seems like there is a possibility of a
> nicer, cleaner fix. That and we need to audit pmd_none() sites for other
> possible smp_rmb()'s...
