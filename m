Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358547;
	b=K4lWfXjjD3pJViET7s7S6w2nqMFXr2UacHeLIx9gtf6HxSmcj+6rTkphJuFDTXVsV7bN
	 +3Eg8tkkDi36TzMUpOEh/W1UN36nuODgyQD30D5LXNucKNZ8jyemDNcwVk8566YlfEWCf
	 DCEmebd7oeJj9+rRycx+XQ4Ynf4dyp/MYsIDcM2h5Ns56NpiGLWVTbqovw4dkJeKXp2ar
	 WIPIAbFXQdKXeh/4gqBkhHu9oFBKx0Gc26MceuCvnPzqAMNEvQXllR9lZC0o0fpF6k9/v
	 K5YxJxEAU+OoJ2SYZKCz7C8AUjgaUHNAn6Gu5hIdOtNvcweWDM0xjPjzoeZVvP1ETkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358547;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=bkc30PrXE7NoTD9uYcKfNgc6wV2Fj3rIUgm/AIyfBvc=;
	b=5T8e+oIWkzWAlCtREd9vmj/octHC4A7pIa2L0lYsLtBLA1mK+ukIn3dC446rD45z2n3s
	 HDRo8ftlapYJVuO+lrJA89Gx3SwFo7ssV2RWyqUPgSFwBB70NFaQxlJSJDkMMqAxiw4GE
	 PlxTZAhD5b384b7H/i23wToBFySiykB8pJv8uEW9eUsp44GEVgRuw3QFwyfgHvb/iQb7K
	 etlg6f0BzLpvQScZV53XxtOKfXYiEZ0udO27GLZcwUHop1ki98a5ZggrKlH/gU8uajLXA
	 LMnEJK9XDrJIDxrdLBjxbFJDMWoKJC2JO656SQYI4zdsTzgzil2kP7+lc0c+aW4kfuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WgwvLHrG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B283D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WgwvLHrG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22D71F000C1;
	Fri, 30 Oct 2026 11:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793358546;
	bh=bkc30PrXE7NoTD9uYcKfNgc6wV2Fj3rIUgm/AIyfBvc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WgwvLHrG1rnaa6zIaTWYYVChMqH+LvTLd0/7d6Sp8KnDUXr6GQ+eOzdfIrIQfGeus
	 /QXwIhlV9z6X9uxq6Y6wUyJ7DVeYBvVsq0OEilMrxYN0TLhswXdKXjp4Ybl5QojXio
	 AXFfWCpUQTqTQcLZIyMMq7x+VWijPcoOe2Tr2QIHtOs4ZaAqbmig8bwwLDbEe2/V5E
	 MQSbYloRwuwX5c2zNxa0KWgEEzNRWqCSvAeCoznLyJoWWKKYD5sLshWPQzwAfD+i3p
	 80FlJAJRnGTtHZMJHdt1Gd2Mhq3zt+DqkVO3/13tRt0Ms0lWU4j5w1LcMifPXOZmk/
	 RT3OFbg7E5qPw==
Message-ID: <6591722a-d841-46ef-85d4-e7a3243344c2@kernel.org>
Date: Fri, 30 Oct 2026 12:09:01 +0100
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
Subject: Re: [PATCHv2] mm/huge_memory: set the mmu_gather page size in
 zap_huge_pud()
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Muchun Song <muchun.song@linux.dev>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Pavithra <pavrampu@linux.ibm.com>
References: <8b853e5f9f16145859407b28af654b0f79e12642.1793318297.git.ritesh.list@gmail.com>
 <19012a9f-7a8d-4eb2-a441-cdb04184890b@kernel.org>
 <cxsrwl3r.ritesh.list@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <cxsrwl3r.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/26 11:15, Ritesh Harjani (IBM) wrote:
> "David Hildenbrand (Arm)" <david@kernel.org> writes:
> 
>> On 10/30/26 01:07, Ritesh Harjani (IBM) wrote:
>>> Unmapping a device-dax mapping with 1G alignment on powerpc radix kernel
>>> built with CONFIG_DEBUG_VM triggers this warning on every munmap:
>>>
>>>     WARNING: mm/mmu_gather.c:176 at __tlb_remove_folio_pages_size+0x38/0x230
>>>     NIP [c00000000063d508] __tlb_remove_folio_pages_size+0x38/0x230
>>>     LR [c0000000006fb688] zap_huge_pud+0x1b8/0x2d0
>>>     Call Trace:
>>>      zap_huge_pud+0x170/0x2d0 (unreliable)
>>>      __zap_vma_range+0x1604/0x1e20
>>>      unmap_vmas+0xa0/0x1f0
>>>      unmap_region+0xb0/0x130
>>>      vms_complete_munmap_vmas+0x120/0x310
>>>      do_vmi_align_munmap+0x1ec/0x240
>>>      __vm_munmap+0x148/0x220
>>>      sys_munmap+0x28/0x40
>>>
>>> To trigger this - it is enough to mmap() /dev/dax0.0, touch the first
>>> byte so that the whole 1G is mapped by a single PUD and then munmap()
>>> it.
>>>
>>> PowerPC needs MMU_GATHER_PAGE_SIZE in which mmu_gather needs to record
>>> the page size for which tlb flush is needed. zap_huge_pmd(),
>>> zap_pte_range(), change_huge_pud() etc all do this already. However,
>>> since commit:
>>>   dbe54153296d ("mm/huge_memory: add vmf_insert_folio_pud()")
>>>
>>> a device-dax PUD maps a real folio and zap_huge_pud() now hands it to
>>> tlb_remove_page_size(tlb, page, HPAGE_PUD_SIZE). At that point
>>> tlb->page_size is still whatever the previous user left behind, which is
>>> 0 for the fresh gather set up by munmap() and so the check fires.
>>>
>>> Fix this in the same way like how other similar paths do.
>>>
>>> Fixes: dbe54153296d0 ("mm/huge_memory: add vmf_insert_folio_pud()")
>>> Reported-by: Pavithra <pavrampu@linux.ibm.com>
>>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>>> ---
>>> [v1]->v2:
>>> =========
>>> - Split the 2 part patch series. Patch-1 is now superseded by a different patch
>>>   from Muchun which he already posted [2].
>>> - No difference in this patch from v1.
>>>
>>> [v1]: https://lore.kernel.org/all/97f85592bb78a273be8519e6897e7f9b9bd31469.1793070429.git.ritesh.list@gmail.com/
>>> [2]: https://lore.kernel.org/all/20261029063601.1961415-1-songmuchun@bytedance.com/
>>>
>>>  mm/huge_memory.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index bd44d58e8684..7e589a2fb02d 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -3040,6 +3040,8 @@ int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>>  	spinlock_t *ptl;
>>>  	pud_t orig_pud;
>>>
>>> +	tlb_change_page_size(tlb, HPAGE_PUD_SIZE);
>>> +
>>>  	ptl = __pud_trans_huge_lock(pud, vma);
>>>  	if (!ptl)
>>>  		return 0;
>>> --
>>> 2.39.5
>>>
>>
>>
>> Matches zap_huge_pmd().
>>
>> I will wait a bit  and then queue this shortly.
>>
> 
> Thanks David, however, looks like Andrew might have queued this up in
> his mm tree [1], right?
> 
> [1]: https://lore.kernel.org/all/20261030021905.2DCA71F000C1@smtp.kernel.org/

No worries, one of us can drop it before sending it upstream.

I'm about to send out the MAINTAINTERS update in a bit, so right now it's still
confusing.

(but also there is no harm in having it in two trees temporarily)

> 
>> This sounds like stable material?
>>
> 
> Sorry, my bad. Yes, we should have this Cc: stable@vger.kernel.org.
> 
> Kindly let me know if I should update the tag and send v3, or can it be
> taken care? Thanks!

I would just apply that when picking, no need to resend.

Thanks!

-- 
Cheers,

David
