Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A839C37A846
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792212754; cv=none; b=T2TTv0++b9s++NtjUiu7vmEOdJi2WtuA8AvUw3kpZyHape2HPNQTVkyA2xGSML2UenOqCo1zYVE4Nn0a8JBdJ3o89BEYAzgxm0vkka/NftE1YdqQ9hWlYLvLywEq0mJwJG1WGjVxcVUjEcNq9Kl3hTJFqBmOqpX3h/Et2e5gLLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792212754; c=relaxed/simple;
	bh=JEnXJzebSdZ9GYYqYIJn1ty2xeLD5+1pTmLo2tJuSws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHFNCdLpVzkcWrM04XSQwsHyGlwL7+W+Pa3JLyqZFuYaYICZi+Lz4D5RXlQMIqbvOp/IsPyQiQeBkcgJ9xakkPBDXktbptglezL8857+KVAKHXbqX2OA6AKTx9U+3GnkLDAn+QP1nOEsQXevbxEF81cWl+A6CcZHNkQRwloCprQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=NlgOb7DZ; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="NlgOb7DZ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792212742; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=gJEDBL4BEKtkKheS+/j1A4lhBNqndMdblxr/ngjfYmk=;
	b=NlgOb7DZWG7N3lkZdzC0UTXo73lVHmMWMzgdx+Jbv4zRmejxvJVg/6/d56ziEMh9NhJcNvOPYaMV5BKYh6ub4xtrnuQGc2bEaeQB8VqZF/ncvlvJDOWIZY0Vmd5Z7uH7TNKDH6862hBfuLAjhUGvaHs5F8fJEwuDZgDsKr7+frQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R241e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XCwX0Vf_1792212739;
Received: from 30.42.72.158(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XCwX0Vf_1792212739 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 17 Oct 2026 12:52:20 +0800
Message-ID: <179c26ed-1764-4e5b-a7ee-047ddabbfea1@linux.alibaba.com>
Date: Sat, 17 Oct 2026 12:52:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: memory: fix truncation removing mapped folios
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org
Cc: ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, qi.zheng@linux.dev, jack@suse.cz,
 pfalcato@suse.de, ayushr@modal.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <e2f76ed117b0c22a26b7688fd46a38c9d035336e.1792114445.git.baolin.wang@linux.alibaba.com>
 <094c9af9-3ade-420d-87d1-976730a5079a@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <094c9af9-3ade-420d-87d1-976730a5079a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/26 5:30 PM, David Hildenbrand (Arm) wrote:
> On 10/16/26 03:48, Baolin Wang wrote:
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
>> to after tlb_flush_rmaps() and use sync_with_folio_pmd_zap() to sync with
>> concurrent zapping, so that when we find a pmd_none() while unmapping a folio
>> without holding the PTL, the folio's mappings are guaranteed to have been
>> removed via tlb_flush_rmaps().
>>
>> [1] https://lore.kernel.org/all/20260925065013.3682431-1-ayushr@modal.com/
>> Reported-by: Ayush Ranjan <ayushr@modal.com>
>> Closes: https://lore.kernel.org/all/20260924061708.1645968-1-ayushr@modal.com/
>> Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in madvise(MADV_DONTNEED)")
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>> Changes from v2:
>>   - Use use sync_with_folio_pmd_zap() to sync with concurrent zapping (Per David).
>> Changes from v1:
>>   - Add an smp_rmb() to pair with the smp_wmb() (Per Lorenzo and Pedro).
>> ---
>>   mm/internal.h |  9 +++++----
>>   mm/memory.c   | 25 ++++++++++++-------------
>>   2 files changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/mm/internal.h b/mm/internal.h
>> index 0434dfcfc36f..6d8f494296a4 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -585,14 +585,15 @@ void free_pgtables(struct mmu_gather *tlb, struct unmap_desc *desc);
>>   void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
>>   
>>   /**
>> - * sync_with_folio_pmd_zap - sync with concurrent zapping of a folio PMD
>> + * sync_with_folio_pmd_zap - sync with concurrent zapping of folios
>>    * @mm: The mm_struct.
>>    * @pmdp: Pointer to the pmd that was found to be pmd_none().
>>    *
>>    * When we find a pmd_none() while unmapping a folio without holding the PTL,
>> - * zap_huge_pmd() may have cleared the PMD but not yet modified the folio to
>> - * indicate that it's unmapped. Skipping the PMD without synchronization could
>> - * make folio unmapping code assume that unmapping failed.
>> + * zap_huge_pmd() or zap_empty_pte_table() may have cleared the PMD but not
>> + * yet modified the mapped folios to indicate they are unmapped. Skipping the
>> + * PMD without synchronization could make folio unmapping code assume that
>> + * unmapping failed.
>>    *
>>    * Wait for concurrent zapping to complete by grabbing the PTL.
>>    */
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 6a8e7772b8d6..8f7ba427371b 100644
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
>> @@ -2046,15 +2055,6 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>>   	 */
>>   	if (can_reclaim_pt && direct_reclaim && addr == end)
>>   		direct_reclaim = zap_empty_pte_table(mm, pmd, ptl, &pmdval);
>> -
>> -	add_mm_rss_vec(mm, rss);
>> -	lazy_mmu_mode_disable();
>> -
>> -	/* Do the actual TLB flush before dropping ptl */
>> -	if (force_flush) {
>> -		tlb_flush_mmu_tlbonly(tlb);
>> -		tlb_flush_rmaps(tlb, vma);
>> -	}
>>   	pte_unmap_unlock(start_pte, ptl);
>>   
>>   	/*
>> @@ -2102,12 +2102,11 @@ static inline unsigned long zap_pmd_range(struct mmu_gather *tlb,
>>   				continue;
>>   			}
>>   			/* fall through */
>> -		} else if (details && details->single_folio &&
>> -			   folio_test_pmd_mappable(details->single_folio) &&
>> -			   next - addr == HPAGE_PMD_SIZE && pmd_none(*pmd)) {
>> -			sync_with_folio_pmd_zap(tlb->mm, pmd);
>>   		}
>> +
>>   		if (pmd_none(*pmd)) {
>> +			if (details && details->single_folio)
>> +				sync_with_folio_pmd_zap(tlb->mm, pmd);
>>   			addr = next;
> 
> By keeping it in the else path above you avoid re-taking the lock if you just
> sync'ed already when you saw pte_present() and resulted in pte_none().

If I understand you correctly, you want something like below?

	} else if (details && details->single_folio && pmd_none(*pmd)) {
		sync_with_folio_pmd_zap(tlb->mm, pmd);
	}

	if (pmd_none(*pmd)) {
		addr = next;
		continue;
	}

But this doesn't fix the race, because CPU 0 could see the first 
pmd_none() return false and the second pmd_none() return true, in which 
case no sync would happen at all.

Moreover, if you mean the sync already happens in zap_pte_range() via 
pte_offset_map_lock() (because the PMD is none), note that in this case 
zap_pte_range() returns the start address, meaning we'd recheck the PMD 
when we get back to zap_pmd_range(). So even with 'keeping it in the 
else path', we'd still call sync_with_folio_pmd_zap() to sync this none PMD.

	addr = zap_pte_range(tlb, vma, pmd, addr, next, details);
	if (addr != next)
		pmd--;

Please correct me if I misunderstand your point. Thanks.
