Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105452;
	b=DDeUG01VhbZtjQNp0orqYhM6LuIjkKSXlRLRT35XAIEJ0qBLbhJCy7ALqITS9YxnSgVh
	 9uULilC0H1hM9xhorkaE3Mwy9tP1G4Lu/HZ5GPyV17CToozeMnqL4PkEFXlgL3SCmgVE4
	 VejKyogWnXo/TZ1u1LoMHGjggpIESejPiOlc84kMYahGhoyZ/ijgytR6GyuWO8CCZ2PfJ
	 1sD7Jpsiq+eGQgegub4Yv2cY0Gc7HtAEc4WXB6fM1H6+ZQ8KngE05gzkzYe5L1FhnVRaq
	 Wasm7hHxC8Wk2Iawycqmimzlx79UmwUgDHmzvrjE2LsWd5ZlGT+SRmSHs6Kh5zd6hKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105452;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2ki1DP5OhpeVVGgytP6sTrVXQsGKeGWZHq3HMgm8Yio=;
	b=WIvC3IQBYNXNORIxNk6iJLpYx3UPX9MUX66Khdp/7zBh+3gNdu2O5JAYqGKJ6WtC1wb8
	 i9/gHYT1M/eaq+Y54gHRSWwwOf5A8apo3rvUXenFzQ9m17h8fOc34INPL/hhw/T2ygCkG
	 uqdiC6JehXs2vBEkj+xtYqfjM/ALOZwwQsZTKeREF3VoDmBVZbWIo3JOzIlxApp+HD/32
	 VTesGuoRnJYVSVE+ZnpuUPXyEu4v4g5FcJG7+mqkOZoIpuj2x+uWk/S7FgVcogT9HBnVj
	 dQrU+GlmdXd8nywFyAXyYrzf26Vf1T2kx5pQFJfkLLVE6n0wojgiHqK5217NpqDRUtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=XQ1GjOgB;
	arc=none smtp.remote-ip=115.124.30.112
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED9F606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED9F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=XQ1GjOgB
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793105442; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=2ki1DP5OhpeVVGgytP6sTrVXQsGKeGWZHq3HMgm8Yio=;
	b=XQ1GjOgBvYfqVTmxh2zAtP5fFmvOaFZxJWKLSHWHj0tXKhAQE6yAL+7i8k2fqVpZrj+bduhcjLIyRigrYo67VLKPSw4lh7vDx1RqDlviB3+PVS6xJ1YAO5q/gD3mG4kbJRiKR/IlFFRgJN8MncpTo1GgWTG6oExYu22MkbbH/Xs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XDdu1Jp_1793105440;
Received: from 30.74.144.191(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XDdu1Jp_1793105440 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 20:50:40 +0800
Message-ID: <f41d0720-ca14-4aa3-a2e4-3ba2de3280d0@linux.alibaba.com>
Date: Tue, 27 Oct 2026 20:50:39 +0800
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
 <de0b41fb-4ae2-46a5-afe0-c021134ebba0@linux.alibaba.com>
 <4880d4ff-8486-4e22-9923-bd4f2407b1cb@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <4880d4ff-8486-4e22-9923-bd4f2407b1cb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/27/26 6:55 PM, David Hildenbrand (Arm) wrote:
> On 10/27/26 11:35, Baolin Wang wrote:
>>
>>
>> On 10/27/26 5:33 PM, David Hildenbrand (Arm) wrote:
>>> On 10/27/26 10:03, Baolin Wang wrote:
>>>>
>>>>
>>>>
>>>> No, keeping two pmd_none() checks cannot fix the race, as I replied before. [1]
>>>>
>>>
>>> Best to wait to submit new versions if there are open discussions? Because now
>>> we have the same discussion in two places.
>>
>> Sure.
>>
>>>
>>> I think you're right about the race, the issue is that we check for
>>> pmd_is_huge(), not pmd_present() which confused me.
>>>
>>> Clearest to me would be to not drop the second pmd_none() check but move it
>>> where it belongs: if splitting zapped the PMD.
>>>
>>> @@ -2101,13 +2104,15 @@ static inline unsigned long zap_pmd_range(struct
>>> mmu_gather *tlb,
>>>                                   addr = next;
>>>                                   continue;
>>>                           }
>>> +                       /* We already synchronized with concurrent zapping. */
>>> +                       if (pmd_none(*pmd)) {
>>> +                               addr = next;
>>> +                               continue;
>>> +                       }
>>>                           /* fall through */
>>> -               } else if (details && details->single_folio &&
>>> -                          folio_test_pmd_mappable(details->single_folio) &&
>>> -                          next - addr == HPAGE_PMD_SIZE && pmd_none(*pmd)) {
>>> -                       sync_with_folio_pmd_zap(tlb->mm, pmd);
>>> -               }
>>> -               if (pmd_none(*pmd)) {
>>> +               } else if (pmd_none(*pmd)) {
>>> +                       if (details && details->single_folio)
>>> +                               sync_with_folio_pmd_zap(tlb->mm, pmd);
>>>                           addr = next;
>>>                           continue;
>>>                   }
>>
>> IMHO, I'm not a big fan of adding two pmd_none() checks just to avoid an
>> uncommon concurrent sync.
> 
> It's what we already had. We had to: one for handling pmd_none() directly and
> one for handling zapping while splitting (file THPs).
> 
> We just managed to let the second also handle the final piece of the former.
> 
> Anyhow, let's get this fixed.
> 
> If you think the code is clearer your way (where I disagree)

Fair enough. Though I have a different taste, I'd still like to make the 
maintainer happy. I'll send out v6 tomorrow following your suggestion.

But could you help check the following whole diff to avoid any 
unnecessary misunderstandings? (I don't want to give Andrew more trouble 
:)). Thanks.

diff --git a/mm/internal.h b/mm/internal.h
index b1b0f29d2216..ffb8eaec90e3 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -584,14 +584,16 @@ void free_pgtables(struct mmu_gather *tlb, struct 
unmap_desc *desc);
  void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);

  /**
- * sync_with_folio_pmd_zap - sync with concurrent zapping of a folio PMD
+ * sync_with_folio_pmd_zap - sync with concurrent zapping of folios
   * @mm: The mm_struct.
   * @pmdp: Pointer to the pmd that was found to be pmd_none().
   *
   * When we find a pmd_none() while unmapping a folio without holding 
the PTL,
- * zap_huge_pmd() may have cleared the PMD but not yet modified the 
folio to
- * indicate that it's unmapped. Skipping the PMD without 
synchronization could
- * make folio unmapping code assume that unmapping failed.
+ * zap_huge_pmd() may have cleared the PMD but not yet updated the folio
+ * mapcount, and zap_empty_pte_table() clears the PMD only after the rmaps
+ * for the table have been removed, but nothing orders the pmd_none() read
+ * against later mapcount reads. Skipping the PMD without synchronization
+ * could make folio unmapping code assume that unmapping failed.
   *
   * Wait for concurrent zapping to complete by grabbing the PTL.
   */
diff --git a/mm/memory.c b/mm/memory.c
index e911e63ba1ed..e0fef107a022 100644
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
@@ -2043,18 +2052,12 @@ static unsigned long zap_pte_range(struct 
mmu_gather *tlb,
          * to hold the pmd lock failed, then we need to recheck all pte 
entries
          * to ensure they are still none, thereby preventing the pte 
entries
          * from being repopulated by another thread.
+        *
+        * Clear the PMD after the rmaps for the table have been 
removed, in case
+        * an incorrect mapcount is observed after unmapping the folio.
          */
         if (can_reclaim_pt && direct_reclaim && addr == end)
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
-       }
         pte_unmap_unlock(start_pte, ptl);

         /*
@@ -2101,13 +2104,15 @@ static inline unsigned long zap_pmd_range(struct 
mmu_gather *tlb,
                                 addr = next;
                                 continue;
                         }
+                       /* We already synchronized with concurrent 
zapping. */
+                       if (pmd_none(*pmd)) {
+                               addr = next;
+                               continue;
+                       }
                         /* fall through */
-               } else if (details && details->single_folio &&
-                          folio_test_pmd_mappable(details->single_folio) &&
-                          next - addr == HPAGE_PMD_SIZE && 
pmd_none(*pmd)) {
-                       sync_with_folio_pmd_zap(tlb->mm, pmd);
-               }
-               if (pmd_none(*pmd)) {
+               } else if (pmd_none(*pmd)) {
+                       if (details && details->single_folio)
+                               sync_with_folio_pmd_zap(tlb->mm, pmd);
                         addr = next;
                         continue;
                 }
