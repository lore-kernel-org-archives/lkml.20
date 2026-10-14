Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199D14E36F1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984342; cv=none; b=NvRa9OCJBNanAfUdJaQgM6EBBwU1owEUYCPgBIXZkP0cYKXGXe27hgntbWTbdanidZuK14oomDg3m7wg2NFRCaIIz83kVRJ1bBOxQ9DOa9DPpHyt4pZIUV+rR7zMTNV2UAQWPQYJtV0KZryuVBIQdGTF8LqqSnvrDY4vhHenN44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984342; c=relaxed/simple;
	bh=9NwkIz9a3Ymm3b5eJuU0HgB2zY28SrOdGDMRPlG8Q5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCy+6y3FvTb7TDD9mquBQQFch/BrwfLSZPlpvzrnKuyfafj/z7FyYyTKm1lFn9OQcdBC6oNRwcDXg/Vg1MjYJZ6c1TcKnWD84H9ytGWKBIO8holSMKEXU/6yDjjR40TyA6jI+NxKit9BfQRUVcY2gL29HZI5aB8ojzy5tXe7IsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPVJjUzD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPVJjUzD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61BC01F000FF;
	Wed, 14 Oct 2026 13:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791984340;
	bh=TQa+MBCQh2+NmFEKYE9b9rxt6YnvIpdiftCj4DjCvMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iPVJjUzDZq3OfFF3zZSXEbB4wZPD8Y4VDcWDLHR+NVFYm4OMfOCzjMTlqaxCxVzUk
	 Pz81Th53bPT0DP2ykrJtnYjDImjIHN96Bdu5dmDBZtqa1oUovm3KDOAnR7j3bjEzur
	 fh4c2SYFJLfdIsiXEKD754hwjYw2QfDG31C9+K6u2c26srf++dMn2GjvFps7Q9USJN
	 fpENVIAMLtLx+JZZXO1oAwZ4ngFGa1Y+8YF7l2ryuYKLQp7exiQd7N23DsV86STq+q
	 3c0VQZdlV1hcXbXV7AHV83hAHpqBHrjXvrBI6haEx27lN2pCI1Xt00WRT6NtWp5Dtk
	 Fx9ssbBpRRThw==
Message-ID: <6660d3bb-3485-4c34-8734-3ea99df920f1@kernel.org>
Date: Wed, 14 Oct 2026 15:25:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: memory: fix truncation removing mapped folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org
Cc: ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, qi.zheng@linux.dev, jack@suse.cz,
 pfalcato@suse.de, ayushr@modal.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <542c97482eae84f86704bcee56482633d1b32321.1791616645.git.baolin.wang@linux.alibaba.com>
 <8245424a-f068-4be5-9e58-713cbff1f8ae@kernel.org>
 <405811f5-ee36-4b3c-80d0-7dc6827ab5d4@linux.alibaba.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <405811f5-ee36-4b3c-80d0-7dc6827ab5d4@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/13/26 11:36, Baolin Wang wrote:
> 
> 
> On 10/12/26 6:23 PM, David Hildenbrand (Arm) wrote:
>> On 10/10/26 09:22, Baolin Wang wrote:
>>> Ayush reported an issue that shmem/tmpfs folios are still mapped when
>>> truncating them on production:
>>> "
>>> BUG: Bad page cache in process ...  pfn:...
>>> page dumped because: still mapped when deleted
>>> "
>>>
>>> I reproduced the issue with Ayush's reproducer [1] with the latest mm-unstable
>>> branch, and I got the following crash info. From the dump message, we can
>>> see that truncate_inode_folio() is really trying to remove mapped folios,
>>> which is incorrect.
>>>
>>> "
>>> [  189.171977] page: refcount:3 mapcount:1 mapping:00000000fe168ee1
>>> index:0x3880 pfn:0x191647
>>> [  189.171995] memcg:ffff0000cc073d40
>>> [  189.171997] aops:shmem_aops ino:3c01 dentry name(?):"memfd:runsc-memory"
>>> [  189.172006] flags: 0x17fffef0002022d(locked|referenced|uptodate|lru|
>>> workingset|swapbacked|node=0|zone=2|lastcpupid=0x3ffff)
>>> .......
>>> [  189.172017] page dumped because: VM_BUG_ON_FOLIO(folio_mapped(folio))
>>> [  189.172026] ------------[ cut here ]------------
>>> [  189.172027] kernel BUG at mm/filemap.c:155!
>>> [  189.172057] Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
>>> .......
>>> [  189.177721] CPU: 3 UID: 0 PID: 5521 Comm: repro Kdump: loaded Tainted:
>>> 7.3.0-rc4+ #277 PREEMPT(lazy)
>>> .......
>>> [  189.183986] Call trace:
>>> [  189.184124]  filemap_unaccount_folio+0xf0/0x1e8 (P)
>>> [  189.184391]  __filemap_remove_folio+0x34/0x160
>>> [  189.184633]  filemap_remove_folio+0x4c/0xb0
>>> [  189.184859]  truncate_inode_folio+0x34/0x58
>>> [  189.185087]  shmem_undo_range+0x220/0x658
>>> [  189.185308]  shmem_fallocate+0x2f0/0x470
>>> [  189.185527]  vfs_fallocate+0x128/0x328
>>> ......
>>> [  189.187078]  el0t_64_sync+0x184/0x188
>>> "
>>>
>>> After analysis, I believe the race exists between truncation and MADV_DONTNEED,
>>> and shmem's ->map_pages() merely makes the issue easier to reproduce. Since
>>> MADV_DONTNEED synchronously releases the pagetable page before calling
>>> tlb_flush_rmaps(), this could cause another thread's truncation to skip
>>> zap_pte_range() (due to pmd is none) but still observe the folio's mapcount
>>> as non-zero. A possible race scenario is as follows:
>>>
>>> CPU 0                           CPU 1
>>> shmem_fallocate                 madvise_dontneed_single_vma
>>>    unmap_mapping_range            .......
>>>    ......
>>>    (filemap_map_pages() remap folios)
>>>                   zap_pte_range
>>>    truncate_inode_folio            zap_empty_pte_table(pmd clear)
>>>      unmap_mapping_folio
>>>      ......
>>>        zap_pmd_range (saw pmd none, skip)
>>>
>>>    filemap_remove_folio
>>>      BUG_ON(folio_mapped)
>>
>> That reminds me of sync_with_folio_pmd_zap() usage in page_vma_mapped_walk().
>>
>> Isn't that the better approach?
> 
> I had considered this approach before, but it is not feasible. IIUC, the
> sync_with_folio_pmd_zap() is used to address the race with zap_huge_pmd(), and
> both the PMD clear and the folio mapcount decrement are performed under the PMD
> lock in zap_huge_pmd().

Just to be clear, I am thinking about something like the following on the
zap_pmd_range() side:

diff --git a/mm/internal.h b/mm/internal.h
index 38b1165212c94..a8820ad7e2f21 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -584,14 +584,15 @@ void free_pgtables(struct mmu_gather *tlb, struct
unmap_desc *desc);
 void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);

 /**
- * sync_with_folio_pmd_zap - sync with concurrent zapping of a folio PMD
+ * sync_with_folio_pmd_zap - sync with concurrent zapping of folios
  * @mm: The mm_struct.
  * @pmdp: Pointer to the pmd that was found to be pmd_none().
  *
  * When we find a pmd_none() while unmapping a folio without holding the PTL,
- * zap_huge_pmd() may have cleared the PMD but not yet modified the folio to
- * indicate that it's unmapped. Skipping the PMD without synchronization could
- * make folio unmapping code assume that unmapping failed.
+ * zap_huge_pmd() or zap_empty_pte_table() may have cleared the PMD but not
+ * yet modified the mapped folios to indicate they are unmapped. Skipping the
+ * PMD without synchronization could make folio unmapping code assume that
+ * unmapping failed.
  *
  * Wait for concurrent zapping to complete by grabbing the PTL.
  */
diff --git a/mm/memory.c b/mm/memory.c
index 8b0c2c735d3de..c585f5eb255c9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2139,9 +2139,7 @@ static inline unsigned long zap_pmd_range(struct
mmu_gather *tlb,
                                continue;
                        }
                        /* fall through */
-               } else if (details && details->single_folio &&
-                          folio_test_pmd_mappable(details->single_folio) &&
-                          next - addr == HPAGE_PMD_SIZE && pmd_none(*pmd)) {
+               } else if (details && details->single_folio && pmd_none(*pmd)) {
                        sync_with_folio_pmd_zap(tlb->mm, pmd);
                }
                if (pmd_none(*pmd)) {

> 
> However, the race here is different: tlb_flush_rmaps() is under the PTE lock,
> while zap_empty_pte_table() is under the PMD lock, and reordering between the
> two functions is also possible. That is, the folio mapcount operation could
> execute after the acquire barrier (spin_lock()) of zap_empty_pte_table(),
> allowing a reader on CPU 0 to incorrectly observe that the PMD is none while
> mapcount > 0.

I think we really just have to make sure to flush rmaps before zapping the PMD.
Then it's really just the same thing we had before with sync_with_folio_pmd_zap().

So I agree about doing the tlb_flush_rmaps() before zapping the PMD. But on the
zap_pmd_range() front that's really just what sync_with_folio_pmd_zap() wants to
handle.

-- 
Cheers,

David
