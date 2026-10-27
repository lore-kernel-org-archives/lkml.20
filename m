Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097341;
	b=LewzxM/aDCSmMbZ3/5SV3Gkb04y/wVLpGgd26DtZ2/z+G2V06YPsvKl+gC6ALd1arA1S
	 vT2If/rG+OTAoMiMs/ey+E4gMxZGqedapFeBXXSCZHy7btP3P5GWfaI9PLuI3xwtEeLoT
	 QDsrc09t9Y3XSGALat79W8v8Q9qi8xE/ilaWrJkL5WEEhSVLZ3K2BiOhNxxNYzdlljOrP
	 KRmkDbYU9+s5okHPBXIBeH5KDl6fCBiomCKHmz2kvFbNnFgsZVpSDt2El9/vBIBPzSfBz
	 nrHcs7vlxYnll6insf8K6Iawf0m7VPYNtShvn45kD79SbLEvC7iSz477ic7r7da4vLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097341;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fpnrnogDp3V5jKMwt4GW3YPjYv2QdO8b81MyuVuvoUU=;
	b=maLYc9wOoRAQm6EbcV99xIxBbSfX6WvvUA0JoeYefslUh2xH21umM+vY5vdW7+9mppMl
	 /CMQHvnwuhC2rOk27RC0aeJW5FjYBpmiQIw6muOSP/jTkNGVbxGkzWcCIs5fQW1PVMwqj
	 1aMohGwmYRV9CgJDWZI8abLL0Ot67Ugc2NFzIOU/FikS9OTdYOzyD44Uj0cVIuzKu3XHS
	 3tYh3e/7TAnax1HgfugYzeyzr2TbyH35TXNDxFivW5fFlXMbAPA8NW38e6foH4sxfChlG
	 CFd/idyAizYA+kiPcBbZL+EtFQhiPTuIA4b7rXVCinSJ9g8Z+miVVnxMgmXQYvc8pDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=xiDY9Tnp;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A117606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A117606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=xiDY9Tnp
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793097337; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=fpnrnogDp3V5jKMwt4GW3YPjYv2QdO8b81MyuVuvoUU=;
	b=xiDY9TnpFojAAT6lLFTFh+Z3lhlsG7aNnEcqmgCIadHcd+96cZiv+pMARZ2kL1RBrgfRNL1Mod2ZovjpsOokAV2i4jkEQIkqdrCwDpV7yGfZAnfAJFNyuNGr5+NJVAeG6YCXUCBj7hxh8xYkRhge1AYf2UKfMgxR8a3siurMkcA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XDdS0nD_1793097334;
Received: from 30.74.144.191(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XDdS0nD_1793097334 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 18:35:35 +0800
Message-ID: <de0b41fb-4ae2-46a5-afe0-c021134ebba0@linux.alibaba.com>
Date: Tue, 27 Oct 2026 18:35:34 +0800
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
Subject: Re: [PATCH v5] mm: memory: fix truncation removing mapped folios
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org
Cc: ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, qi.zheng@linux.dev, jack@suse.cz,
 pfalcato@suse.de, ayushr@modal.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <d7f009c90b11ded86654885b5ebcb8c9308fa31a.1793067441.git.baolin.wang@linux.alibaba.com>
 <2ba579e8-06fb-41f5-9eb2-f02b2aabe29b@kernel.org>
 <87e32afd-75de-4407-8f0c-fb70b40d5eca@linux.alibaba.com>
 <81ee2c92-f342-4f7f-aacd-d9558e67a980@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <81ee2c92-f342-4f7f-aacd-d9558e67a980@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/27/26 5:33 PM, David Hildenbrand (Arm) wrote:
> On 10/27/26 10:03, Baolin Wang wrote:
>>
>>
>> On 10/27/26 5:00 PM, David Hildenbrand (Arm) wrote:
>>> On 10/27/26 03:19, Baolin Wang wrote:
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
>>>>                                       tlb_flush_rmaps(remove rmaps)
>>>>
>>>> To fix this issue, we should move the pmd clear operation (via
>>>> zap_empty_pte_table())
>>>> to after tlb_flush_rmaps() and use sync_with_folio_pmd_zap() to sync with
>>>> concurrent zapping, so that when we find a pmd_none() while unmapping a folio
>>>> without holding the PTL, the folio's mappings are guaranteed to have been
>>>> removed via tlb_flush_rmaps().
>>>>
>>>> [1] https://lore.kernel.org/all/20260925065013.3682431-1-ayushr@modal.com/
>>>> Reported-by: Ayush Ranjan <ayushr@modal.com>
>>>> Closes: https://lore.kernel.org/all/20260924061708.1645968-1-ayushr@modal.com/
>>>> Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in
>>>> madvise(MADV_DONTNEED)")
>>>> Acked-by: Qi Zheng <qi.zheng@linux.dev>
>>>> Reviewed-by: Pedro Falcato <pfalcato@suse.de>
>>>> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> ---
>>>> Changes from v4:
>>>>    - Put the pmd_none() check in the 'else if' branch (per David).
>>>> Changes from v3:
>>>>    - Collect review tags from Qi, Pedro and Lorenzo. Thanks.
>>>>    - Update the related comments per Lorenzo.
>>>> Changes from v2:
>>>>    - Use use sync_with_folio_pmd_zap() to sync with concurrent zapping (Per
>>>> David).
>>>> Changes from v1:
>>>>    - Add an smp_rmb() to pair with the smp_wmb() (Per Lorenzo and Pedro).
>>>> ---
>>>>    mm/internal.h | 10 ++++++----
>>>>    mm/memory.c   | 30 +++++++++++++++---------------
>>>>    2 files changed, 21 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/mm/internal.h b/mm/internal.h
>>>> index b1b0f29d2216..ffb8eaec90e3 100644
>>>> --- a/mm/internal.h
>>>> +++ b/mm/internal.h
>>>> @@ -584,14 +584,16 @@ void free_pgtables(struct mmu_gather *tlb, struct
>>>> unmap_desc *desc);
>>>>    void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
>>>>      /**
>>>> - * sync_with_folio_pmd_zap - sync with concurrent zapping of a folio PMD
>>>> + * sync_with_folio_pmd_zap - sync with concurrent zapping of folios
>>>>     * @mm: The mm_struct.
>>>>     * @pmdp: Pointer to the pmd that was found to be pmd_none().
>>>>     *
>>>>     * When we find a pmd_none() while unmapping a folio without holding the PTL,
>>>> - * zap_huge_pmd() may have cleared the PMD but not yet modified the folio to
>>>> - * indicate that it's unmapped. Skipping the PMD without synchronization could
>>>> - * make folio unmapping code assume that unmapping failed.
>>>> + * zap_huge_pmd() may have cleared the PMD but not yet updated the folio
>>>> + * mapcount, and zap_empty_pte_table() clears the PMD only after the rmaps
>>>> + * for the table have been removed, but nothing orders the pmd_none() read
>>>> + * against later mapcount reads. Skipping the PMD without synchronization
>>>> + * could make folio unmapping code assume that unmapping failed.
>>>>     *
>>>>     * Wait for concurrent zapping to complete by grabbing the PTL.
>>>>     */
>>>> diff --git a/mm/memory.c b/mm/memory.c
>>>> index e911e63ba1ed..d9c54549b85b 100644
>>>> --- a/mm/memory.c
>>>> +++ b/mm/memory.c
>>>> @@ -2036,6 +2036,15 @@ static unsigned long zap_pte_range(struct mmu_gather
>>>> *tlb,
>>>>            }
>>>>        } while (pte += nr, addr += PAGE_SIZE * nr, addr != end);
>>>>    +    add_mm_rss_vec(mm, rss);
>>>> +    lazy_mmu_mode_disable();
>>>> +
>>>> +    /* Do the actual TLB flush before dropping ptl */
>>>> +    if (force_flush) {
>>>> +        tlb_flush_mmu_tlbonly(tlb);
>>>> +        tlb_flush_rmaps(tlb, vma);
>>>> +    }
>>>> +
>>>>        /*
>>>>         * Fast path: try to hold the pmd lock and unmap the PTE page.
>>>>         *
>>>> @@ -2043,18 +2052,12 @@ static unsigned long zap_pte_range(struct mmu_gather
>>>> *tlb,
>>>>         * to hold the pmd lock failed, then we need to recheck all pte entries
>>>>         * to ensure they are still none, thereby preventing the pte entries
>>>>         * from being repopulated by another thread.
>>>> +     *
>>>> +     * Clear the PMD after the rmaps for the table have been removed, in case
>>>> +     * an incorrect mapcount is observed after unmapping the folio.
>>>>         */
>>>>        if (can_reclaim_pt && direct_reclaim && addr == end)
>>>>            direct_reclaim = zap_empty_pte_table(mm, pmd, ptl, &pmdval);
>>>> -
>>>> -    add_mm_rss_vec(mm, rss);
>>>> -    lazy_mmu_mode_disable();
>>>> -
>>>> -    /* Do the actual TLB flush before dropping ptl */
>>>> -    if (force_flush) {
>>>> -        tlb_flush_mmu_tlbonly(tlb);
>>>> -        tlb_flush_rmaps(tlb, vma);
>>>> -    }
>>>>        pte_unmap_unlock(start_pte, ptl);
>>>>          /*
>>>> @@ -2102,12 +2105,9 @@ static inline unsigned long zap_pmd_range(struct
>>>> mmu_gather *tlb,
>>>>                    continue;
>>>>                }
>>>>                /* fall through */
>>>> -        } else if (details && details->single_folio &&
>>>> -               folio_test_pmd_mappable(details->single_folio) &&
>>>> -               next - addr == HPAGE_PMD_SIZE && pmd_none(*pmd)) {
>>>> -            sync_with_folio_pmd_zap(tlb->mm, pmd);
>>>> -        }
>>>> -        if (pmd_none(*pmd)) {
>>>> +        } else if (pmd_none(*pmd)) {
>>>> +            if (details && details->single_folio)
>>>> +                sync_with_folio_pmd_zap(tlb->mm, pmd);
>>>>                addr = next;
>>>>                continue;
>>>>            }
>>>
>>>
>>>
>>> } else if (pmd_none(*pmd) && details && details->single_folio)) {
>>>      sync_with_folio_pmd_zap(tlb->mm, pmd);
>>> }
>>>
>>> if (pmd_none(*pmd) {
>>>      addr = next;
>>>      continue;
>>> }
>>>
>>>
>>> Minimal change required, no?
>>
>> No, keeping two pmd_none() checks cannot fix the race, as I replied before. [1]
>>
> 
> Best to wait to submit new versions if there are open discussions? Because now
> we have the same discussion in two places.

Sure.

> 
> I think you're right about the race, the issue is that we check for
> pmd_is_huge(), not pmd_present() which confused me.
> 
> Clearest to me would be to not drop the second pmd_none() check but move it
> where it belongs: if splitting zapped the PMD.
> 
> @@ -2101,13 +2104,15 @@ static inline unsigned long zap_pmd_range(struct
> mmu_gather *tlb,
>                                  addr = next;
>                                  continue;
>                          }
> +                       /* We already synchronized with concurrent zapping. */
> +                       if (pmd_none(*pmd)) {
> +                               addr = next;
> +                               continue;
> +                       }
>                          /* fall through */
> -               } else if (details && details->single_folio &&
> -                          folio_test_pmd_mappable(details->single_folio) &&
> -                          next - addr == HPAGE_PMD_SIZE && pmd_none(*pmd)) {
> -                       sync_with_folio_pmd_zap(tlb->mm, pmd);
> -               }
> -               if (pmd_none(*pmd)) {
> +               } else if (pmd_none(*pmd)) {
> +                       if (details && details->single_folio)
> +                               sync_with_folio_pmd_zap(tlb->mm, pmd);
>                          addr = next;
>                          continue;
>                  }

IMHO, I'm not a big fan of adding two pmd_none() checks just to avoid an 
uncommon concurrent sync. If you don't like the approach in v4 [1] 
either, I'll follow your preferred coding style.

@@ -2102,12 +2105,11 @@ static inline unsigned long zap_pmd_range(struct 
mmu_gather *tlb,
  				continue;
  			}
  			/* fall through */
-		} else if (details && details->single_folio &&
-			   folio_test_pmd_mappable(details->single_folio) &&
-			   next - addr == HPAGE_PMD_SIZE && pmd_none(*pmd)) {
-			sync_with_folio_pmd_zap(tlb->mm, pmd);
  		}
+
  		if (pmd_none(*pmd)) {
+			if (details && details->single_folio)
+				sync_with_folio_pmd_zap(tlb->mm, pmd);
  			addr = next;
  			continue;
  		}

[1] 
https://lore.kernel.org/all/4cc521a118564b4145edf0324066ab532fb41181.1792979870.git.baolin.wang@linux.alibaba.com/#t

> Removing the "if (pmd_none(*pmd)) {" in your variant is what confused me,
> because it looks like we no longer happen the case where we zapped the PMD
> ourselves.

Because zap_pte_range() will return the same addr and check the none PMD 
again in zap_pmd_range() in this case, I thought you wanted this simple 
version, considering keeping two pmd_none() checks is incorrect.
