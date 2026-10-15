Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1D334041B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046513; cv=none; b=dw0C+qJ164RWxG/aBRjn+QL9b6FFsbrTT6c4QxAdAStenswCfzfrZ1K2+eCbqxb9mL/WCtSoi/dxwi2nrxwiQnef5tbTeIJjJvf/ClYiRs4M9GXHwRfL917/Ngi8lRhfxyefSiB7mfdbDT1xQ8B2uRkECtEHZRYcGbihDNcY98M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046513; c=relaxed/simple;
	bh=5qacpBztCBnhsz02vpVPBLJjxmuQO/vVdV+9l+DdYWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jrjA7W8vmkyp1ugdc26qn7Nqo1v1Wj5eAu/RRkZaa0p+zsqXp50hTaUE2m4UOsovqQ/qZJkV/kA1agu+mezCumrnMNy5esWlH7ZSLsHy+eJKafoeGO+ox8+hXroPSvJUy03zvrynI7WVyBVWTIdGyJjDTjUsaKwkQnLKGzYDMbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=iwXyxfmy; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="iwXyxfmy"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792046507; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=kibslPdex3kvOCjH6VpWlnah8blg0nm8DCA8cn/iXBI=;
	b=iwXyxfmy4YULvszwj5u1jaNUjm3JzvFppBrHwicKTvizoMG7BBnCdpp1WWqwo+fWCY+ImlqHgsurzUMePDf69eWaC7bvBstiT2a0rAuy8/Coe+inwrC+PFY4t/s8T6CHGD6rYwNcOmbzoeYT00qDk3F1/K1SsatDsVM4VPP2BnY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XCqvFCR_1792046505;
Received: from 30.74.144.143(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XCqvFCR_1792046505 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 15 Oct 2026 14:41:45 +0800
Message-ID: <02c9a968-92e2-49e2-bffc-74d264a5c911@linux.alibaba.com>
Date: Thu, 15 Oct 2026 14:41:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: memory: fix truncation removing mapped folios
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org
Cc: ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, qi.zheng@linux.dev, jack@suse.cz,
 pfalcato@suse.de, ayushr@modal.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <542c97482eae84f86704bcee56482633d1b32321.1791616645.git.baolin.wang@linux.alibaba.com>
 <8245424a-f068-4be5-9e58-713cbff1f8ae@kernel.org>
 <405811f5-ee36-4b3c-80d0-7dc6827ab5d4@linux.alibaba.com>
 <6660d3bb-3485-4c34-8734-3ea99df920f1@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <6660d3bb-3485-4c34-8734-3ea99df920f1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/14/26 9:25 PM, David Hildenbrand (Arm) wrote:
> On 10/13/26 11:36, Baolin Wang wrote:
>>
>>
>> On 10/12/26 6:23 PM, David Hildenbrand (Arm) wrote:
>>> On 10/10/26 09:22, Baolin Wang wrote:
>>>> Ayush reported an issue that shmem/tmpfs folios are still mapped when
>>>> truncating them on production:
>>>> "
>>>> BUG: Bad page cache in process ...  pfn:...
>>>> page dumped because: still mapped when deleted
>>>> "
>>>>
>>>> I reproduced the issue with Ayush's reproducer [1] with the latest mm-unstable
>>>> branch, and I got the following crash info. From the dump message, we can
>>>> see that truncate_inode_folio() is really trying to remove mapped folios,
>>>> which is incorrect.
>>>>
>>>> "
>>>> [  189.171977] page: refcount:3 mapcount:1 mapping:00000000fe168ee1
>>>> index:0x3880 pfn:0x191647
>>>> [  189.171995] memcg:ffff0000cc073d40
>>>> [  189.171997] aops:shmem_aops ino:3c01 dentry name(?):"memfd:runsc-memory"
>>>> [  189.172006] flags: 0x17fffef0002022d(locked|referenced|uptodate|lru|
>>>> workingset|swapbacked|node=0|zone=2|lastcpupid=0x3ffff)
>>>> .......
>>>> [  189.172017] page dumped because: VM_BUG_ON_FOLIO(folio_mapped(folio))
>>>> [  189.172026] ------------[ cut here ]------------
>>>> [  189.172027] kernel BUG at mm/filemap.c:155!
>>>> [  189.172057] Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
>>>> .......
>>>> [  189.177721] CPU: 3 UID: 0 PID: 5521 Comm: repro Kdump: loaded Tainted:
>>>> 7.3.0-rc4+ #277 PREEMPT(lazy)
>>>> .......
>>>> [  189.183986] Call trace:
>>>> [  189.184124]  filemap_unaccount_folio+0xf0/0x1e8 (P)
>>>> [  189.184391]  __filemap_remove_folio+0x34/0x160
>>>> [  189.184633]  filemap_remove_folio+0x4c/0xb0
>>>> [  189.184859]  truncate_inode_folio+0x34/0x58
>>>> [  189.185087]  shmem_undo_range+0x220/0x658
>>>> [  189.185308]  shmem_fallocate+0x2f0/0x470
>>>> [  189.185527]  vfs_fallocate+0x128/0x328
>>>> ......
>>>> [  189.187078]  el0t_64_sync+0x184/0x188
>>>> "
>>>>
>>>> After analysis, I believe the race exists between truncation and MADV_DONTNEED,
>>>> and shmem's ->map_pages() merely makes the issue easier to reproduce. Since
>>>> MADV_DONTNEED synchronously releases the pagetable page before calling
>>>> tlb_flush_rmaps(), this could cause another thread's truncation to skip
>>>> zap_pte_range() (due to pmd is none) but still observe the folio's mapcount
>>>> as non-zero. A possible race scenario is as follows:
>>>>
>>>> CPU 0                           CPU 1
>>>> shmem_fallocate                 madvise_dontneed_single_vma
>>>>     unmap_mapping_range            .......
>>>>     ......
>>>>     (filemap_map_pages() remap folios)
>>>>                    zap_pte_range
>>>>     truncate_inode_folio            zap_empty_pte_table(pmd clear)
>>>>       unmap_mapping_folio
>>>>       ......
>>>>         zap_pmd_range (saw pmd none, skip)
>>>>
>>>>     filemap_remove_folio
>>>>       BUG_ON(folio_mapped)
>>>
>>> That reminds me of sync_with_folio_pmd_zap() usage in page_vma_mapped_walk().
>>>
>>> Isn't that the better approach?
>>
>> I had considered this approach before, but it is not feasible. IIUC, the
>> sync_with_folio_pmd_zap() is used to address the race with zap_huge_pmd(), and
>> both the PMD clear and the folio mapcount decrement are performed under the PMD
>> lock in zap_huge_pmd().
> 
> Just to be clear, I am thinking about something like the following on the
> zap_pmd_range() side:
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index 38b1165212c94..a8820ad7e2f21 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -584,14 +584,15 @@ void free_pgtables(struct mmu_gather *tlb, struct
> unmap_desc *desc);
>   void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
> 
>   /**
> - * sync_with_folio_pmd_zap - sync with concurrent zapping of a folio PMD
> + * sync_with_folio_pmd_zap - sync with concurrent zapping of folios
>    * @mm: The mm_struct.
>    * @pmdp: Pointer to the pmd that was found to be pmd_none().
>    *
>    * When we find a pmd_none() while unmapping a folio without holding the PTL,
> - * zap_huge_pmd() may have cleared the PMD but not yet modified the folio to
> - * indicate that it's unmapped. Skipping the PMD without synchronization could
> - * make folio unmapping code assume that unmapping failed.
> + * zap_huge_pmd() or zap_empty_pte_table() may have cleared the PMD but not
> + * yet modified the mapped folios to indicate they are unmapped. Skipping the
> + * PMD without synchronization could make folio unmapping code assume that
> + * unmapping failed.
>    *
>    * Wait for concurrent zapping to complete by grabbing the PTL.
>    */
> diff --git a/mm/memory.c b/mm/memory.c
> index 8b0c2c735d3de..c585f5eb255c9 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2139,9 +2139,7 @@ static inline unsigned long zap_pmd_range(struct
> mmu_gather *tlb,
>                                  continue;
>                          }
>                          /* fall through */
> -               } else if (details && details->single_folio &&
> -                          folio_test_pmd_mappable(details->single_folio) &&
> -                          next - addr == HPAGE_PMD_SIZE && pmd_none(*pmd)) {
> +               } else if (details && details->single_folio && pmd_none(*pmd)) {
>                          sync_with_folio_pmd_zap(tlb->mm, pmd);
>                  }
>                  if (pmd_none(*pmd)) {
> 

Yes, I've considered that. However, implicit memory barriers give me a 
headache, so I ended up going with explicit memory barriers (suggested 
by Pedro).

If you don't like memory barriers, let me re-check whether the implicit 
memory barriers here can ensure race safety with 
sync_with_folio_pmd_zap(). A simplified logic is as follows:

CPU 0 (truncation)                        CPU 1 (zapping)
down_read() ->Acquire A1.                pte spin_lock() ->Acquire A4
                                          clear mapcount

                                          pmd spin_lock() ->Acquire A5
                                          clear pmd
                                          pmd spin_unlock() ->Release R5

if (pmd_none()) { //read pmd
                                          pte spin_unlock() ->Release R4
     pmd spin_lock() ->Acquire A2
     pmd spin_unlock() ->Release R2
}
up_read() -> Release R1

spin_lock(y) ->Acquire A3
folio_mapped() // read mapcount
spin_unlock(y) ->Release R3

CPU 0 constraints:
1. R2 is a release, so "read pmd" completes before R2.
2. A2 completes before A3 (ACQUIRE vs ACQUIRE).
3. "read mapcount" completes after A3, hence after A2.

CPU 1 constraints:
1. R5 is a release. Both "clear mapcount" and "clear pmd" complete 
before R5.

According to above constraints, if CPU0 sees pmd_none() caused by CPU1's 
clear pmd, and CPU0 then acquires the same pmd lock released by CPU1 at 
R5, then CPU1's clear mapcount happens before CPU0's later folio_mapped().

Therefore folio_mapped() is guaranteed not to read the old mapcount in 
this case. So I think sync_with_folio_pmd_zap() can work, but needs a 
small change to avoid the double pmd_none() check.

David, does the following diff look good to you?

diff --git a/mm/memory.c b/mm/memory.c
index 6a8e7772b8d6..c0aadab1b59e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2036,6 +2036,15 @@ static unsigned long zap_pte_range(struct 
mmu_gather *tlb,
                 }
         } while (pte += nr, addr += PAGE_SIZE * nr, addr != end);

+       add_mm_rss_vec(mm, rss);
+       lazy_mmu_mode_disable();
+
+       /* Do the actual TLB flush before dropping ptl */
+       if (force_flush) {
+               tlb_flush_mmu_tlbonly(tlb);
+               tlb_flush_rmaps(tlb, vma);
+       }
+
         /*
          * Fast path: try to hold the pmd lock and unmap the PTE page.
          *
@@ -2044,16 +2053,8 @@ static unsigned long zap_pte_range(struct 
mmu_gather *tlb,
          * to ensure they are still none, thereby preventing the pte 
entries
          * from being repopulated by another thread.
          */
-       if (can_reclaim_pt && direct_reclaim && addr == end)
+       if (can_reclaim_pt && direct_reclaim && addr == end) {
                 direct_reclaim = zap_empty_pte_table(mm, pmd, ptl, 
&pmdval);
-
-       add_mm_rss_vec(mm, rss);
-       lazy_mmu_mode_disable();
-
-       /* Do the actual TLB flush before dropping ptl */
-       if (force_flush) {
-               tlb_flush_mmu_tlbonly(tlb);
-               tlb_flush_rmaps(tlb, vma);
         }
         pte_unmap_unlock(start_pte, ptl);

@@ -2102,12 +2103,11 @@ static inline unsigned long zap_pmd_range(struct 
mmu_gather *tlb,
                                 continue;
                         }
                         /* fall through */
-               } else if (details && details->single_folio &&
-                          folio_test_pmd_mappable(details->single_folio) &&
-                          next - addr == HPAGE_PMD_SIZE && 
pmd_none(*pmd)) {
-                       sync_with_folio_pmd_zap(tlb->mm, pmd);
                 }
+
                 if (pmd_none(*pmd)) {
+                       if (details && details->single_folio)
+                               sync_with_folio_pmd_zap(tlb->mm, pmd);
                         addr = next;
                         continue;
                 }
