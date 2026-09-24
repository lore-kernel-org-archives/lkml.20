Received: from mta1.migadu.com (out-55.mta1.migadu.com [95.215.58.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FDF4C14FC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271290; cv=none; b=Yfp9URXFv8l6yH96WGAOlAJJJjGUXjUzxABCKkqEVbWx5dWiovkKAl9fBvG90GFBaud0cBbQQfUCIaC+15GlkbunBWnTekOlC8pNOnfzI0scAK+by51nlF9euSyl2p/Qdj/mFax1ynRoTewC+tj84HpzHQ1hXasa8SfEACjEgxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271290; c=relaxed/simple;
	bh=yZ9rx3BhSXpvURnJe/ABajoUQEwR3f64gTF6zXhSG4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R34/O6iL6w2Wg/MZ/0nytdxuagH8cbv46z/2VBE1hqJYP8eXVrnWnUJFelN4TVhOrPh9aQrSy8WktoKM7OUpln5Yp5uN9cv3VusJBtnVGyVaXE0q4+WlMjRX6KHksNSK/29GexxvIIy/KvcRvGZBqp9bzYRMIP+y3WEfk7pBTUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eXIyhv0x; arc=none smtp.client-ip=95.215.58.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eXIyhv0x"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yZ9rx3BhSXpvURnJe/ABajoUQEwR3f64gTF6zXhSG4A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790271285; v=1; x=1790876085;
 b=eXIyhv0xDXKE67etXQkciRnH5wrZZCL15bAs52OSyDhWO1szxdIIqFG5qyM1yPQo900iBoMY
 ve/8mfUmgj0KMjIO2uCl3rd0UesnkjGN0E60hZvSdPo9lV4eVb06gk/YG5aUK+O+2n4ONTJ6LQP
 fOEJA5vDP/X2dqQ6m3i0Gukc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f5cad8d26f570659;
	Thu, 24 Sep 2026 17:34:45 +0000
X-Mizu-Trace-ID: f5cad8d26f570659
X-Migadu-Flow: FLOW_OUT
Message-ID: <326b26d5-481e-4524-8b9d-c4d54924626e@linux.dev>
Date: Thu, 24 Sep 2026 18:34:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v7 11/29] mm: split PMD swap entries into PTE swap
 entries
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, chrisl@kernel.org,
 kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>,
 willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, kas@kernel.org,
 baohua@kernel.org, dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 Nico Pache <nico.pache@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>,
 lance.yang@linux.dev, linux-kernel@vger.kernel.org, nphamcs@gmail.com,
 shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev,
 luizcap@redhat.com, kernel-team@meta.com
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-12-usama.arif@linux.dev>
 <7f6eb404-8139-4208-88eb-03ea8a4bf3a9@kernel.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <7f6eb404-8139-4208-88eb-03ea8a4bf3a9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 23/09/2026 12:20, David Hildenbrand (Arm) wrote:
> On 9/14/26 14:28, Usama Arif wrote:
>> Once a PMD can hold a swap entry, everything that splits a PMD - mprotect()
>> or munmap() over part of the range, MADV_FREE, a pagewalk with no PMD
>> handler - has to be able to split that entry too, or the callers that rely
>> on split_huge_pmd() to hand them a PTE table would find the PMD unchanged.
>>
>> No reference counting is needed: a swap entry pins no folio, and swap_map
>> is already one per slot, so the PTEs simply take over what the PMD held.
>>
>> The migration-only entry point cannot reach the new branch, because
>> page_vma_mapped_walk() never hands back a swap PMD for the folio being
>> migrated. Warn if that ever changes, and force the regular split anyway,
>> since the branch leaves folio and page uninitialised.
>>
>> Test the pre-split old_pmd rather than re-reading *pmd in the trailing
>> folio_remove_rmap_pmd() gate, so every entry-type test in the function
>> interrogates the same snapshot. That part is cosmetic: pmdp_invalidate()
>> leaves the PMD present as far as software is concerned.
>>
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>> ---
>>  mm/huge_memory.c | 36 +++++++++++++++++++++++++++++++++++-
>>  1 file changed, 35 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 873887aed0bc2..0e347a545588c 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -3304,6 +3304,21 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>  			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
>>  						 vma, haddr, rmap_flags);
>>  		}
>> +	} else if (pmd_is_swap_entry(*pmd)) {
>> +		/*
>> +		 * A PMD swap entry has no page, so it cannot be turned into
>> +		 * PTE migration entries.  page_vma_mapped_walk() never hands
>> +		 * one back for the folio being migrated, so this should not
>> +		 * happen; warn, but also force the regular split so that a
>> +		 * broken invariant cannot make the code below dereference the
>> +		 * uninitialised folio and page.
> 
> I disagree with the force (and the comment). We cannot make each and every
> assertion that never happens (unless someone messes up real bad and would find
> this during early testing) have recovery code.

Yeah that makes sense, I will fix it for next revision.> 
> The real bug would be calling split_pmd_to_migration_entries() with something
> unexpected. See my reply to #10 where we bail out earlier
> 
> 
>> +		 */
>> +		VM_WARN_ON_ONCE(use_migration_entries);
>> +		use_migration_entries = false;
> 
> Can we just have on the beginning of the function a check that
> use_migration_entries is only ever set on present PMDs or device-private entries.

I have moved it into the previous patch (#10) as

  VM_WARN_ON_ONCE(to_migration_entries && !pmd_present(*pmd) &&
                  !pmd_is_device_private_entry(*pmd));
> 
>> +		old_pmd = *pmd;
>> +		soft_dirty = pmd_swp_soft_dirty(old_pmd);
>> +		uffd_wp = pmd_swp_uffd(old_pmd);
>> +		anon_exclusive = pmd_swp_exclusive(old_pmd);
>>  	} else {
>>  		/*
>>  		 * Up to this point the pmd is present and huge and userland has
>> @@ -3440,6 +3455,25 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>  			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
>>  			set_pte_at(mm, addr, pte + i, entry);
>>  		}
>> +	} else if (pmd_is_swap_entry(old_pmd)) {
>> +		const softleaf_t old_entry = softleaf_from_pmd(old_pmd);
>> +		pte_t pte_swp_entry;
>> +		swp_entry_t entry;
>> +
>> +		for (i = 0, addr = haddr; i < HPAGE_PMD_NR;
>> +		     i++, addr += PAGE_SIZE) {
> 
> Just squeeze it into one line like the other instances.

Done for next revision.> 
>> +			entry = swp_entry(swp_type(old_entry),
>> +					  swp_offset(old_entry) + i);
> 
> Didn't we have a helper to advance by a delta? Ah, yes, pte_move_swp_offset().
> 
> I guess one could construct the initial pte and then advance one by one through
> pte_move_swp_offset(). Won't remove a lot of code, though, so just a thought.
> 


Done, it reads better than I expected, because the three bit tests
hoist out of the loop rather than running HPAGE_PMD_NR times:

  } else if (pmd_is_swap_entry(old_pmd)) {
          pte_t entry = softleaf_to_pte(softleaf_from_pmd(old_pmd));

          if (soft_dirty)
                  entry = pte_swp_mksoft_dirty(entry);
          if (uffd_wp)
                  entry = pte_swp_mkuffd(entry);
          if (anon_exclusive)
                  entry = pte_swp_mkexclusive(entry);

          for (i = 0, addr = haddr; i < HPAGE_PMD_NR;
               i++, addr += PAGE_SIZE) {
                  VM_WARN_ON(!pte_none(ptep_get(pte + i)));
                  set_pte_at(mm, addr, pte + i, entry);
                  entry = pte_next_swp_offset(entry);
          }


> Apart from that LGTM.
> 

Thanks for the reviews!!
