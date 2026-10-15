Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAAA2571B8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032079; cv=none; b=Sq6v7aenUEQIowxgtudyIz66Ljc1mSMUlHGMTSAw9ghpu8luul8oGEsKkJH7eE1/g/MwVcLnMcy7uQBVibhZiCmL5Lsk/4cGENzQ+77C7m9ubJuZYAHZ9QDAobRlcOBZQJeFmdj+GQLqJaCvIsMaL03R4j5o5Dsim16fHmLC9eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032079; c=relaxed/simple;
	bh=79IvcjmEE0v2O8D7+cNJHW/Gy1gfNiWMIgKwSq+Xwk0=;
	h=In-Reply-To:Date:References:Message-Id:To:Subject:Cc:Mime-Version:
	 From:Content-Type; b=HhNcnanh3dUXK2w5VUJlq6Kdtk071oR1asf1lW4akN0zPM4KjchPkeHjLqT6CurnLJc3kfKwbIUjRFfZq8Ao14qZ3NQhPItdRvVeib/oxPNSCJpuRFjrMRq4/6nPk4T5Jz+a22dHuzLihhekhjJhp+lwLi6vuHIq4WIiWTUPvHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=q3C19CbY; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="q3C19CbY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792032071; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Hi+3lSqXd/P6YBuikebYF4k0KAgzFTH65xE7aTqdkFw=;
 b=q3C19CbYXL8W1aYiw1GuZvXg9Yy8p8VtuD/BwRMgC6GWQu+iwtLrbivmXfDfi+OBOwEACB
 mbakWgClugSuHF+HjTiuYtCGG3VMU4Si8GPosHRHTv09m6jWN0IJAgRYi6JG/X3gp4yp+Q
 NdFKmzKSGW+7ukgm9q4bIPTf26lA0RAp9M5otoVjcHOcKntsMGZVjaSdDCOP1+bqIlKm27
 /bQYHI3x7HAb3irAdhHt4GDKli6MJ/XplmQkXa91k5Z/AVL4Ue7BKPHMIYik89Qkw7n06B
 Qi2rp+mGnNMD10lQY4XsfJmiZOKb/81GNH7SuRcImS0hVyXArwB1U7Rfgceqpw==
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <fedff1b6-0522-4398-a0d4-d4111a570159@kernel.org>
Date: Thu, 15 Oct 2026 10:40:59 +0800
References: <20260930064308.58159-1-lizhe.67@bytedance.com> <arzVaC2IYkqSb0_U@gmail.com> <9a7c026e-f5f2-40e0-84aa-919c988cc136@bytedance.com> <2b4571c5-8e51-4c91-9d88-11929f200875@kernel.org> <asjVUa6XBZ8ti-0_@gremlin> <70ea8ee6-6fc5-4209-8cee-362da37f5035@kernel.org> <86de1ee5-be14-4123-b372-b4691cea8e67@bytedance.com> <fedff1b6-0522-4398-a0d4-d4111a570159@kernel.org>
Message-Id: <98d4a305-51e4-4374-b09d-7d251dbf166d@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH] mm/hugetlb: avoid recursive i_mmap_rwsem in PMD sharing
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	<akpm@linux-foundation.org>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26ad03d45+65c2bc+vger.kernel.org+lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8

On 10/14/26 6:52 PM, David Hildenbrand (Arm) wrote:
> On 10/14/26 08:39, Li Zhe wrote:
>> On 10/10/26 2:05 AM, David Hildenbrand (Arm) wrote:
>>> On 10/9/26 13:52, Lorenzo Stoakes (ARM) wrote:
>>>> Yeah I don't see why not! I don't think there's anything that needs to=
 be
>>>> private here.
>>> Li, see below, can you work with the below?
>>>
>>>
>>> ----8<----
>>>   From 9e1c0676ea6c9cbcabf91cd8badf81a9d88fd3ef Mon Sep 17 00:00:00 200=
1
>>> From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
>>> Date: Wed, 29 Jul 2026 18:33:08 +0100
>>> Subject: [PATCH] fix
>>>
>>> ---
>>>    mm/hugetlb.c | 103 +++++++++++++++++++++++++++++++++++++++----------=
--
>>>    1 file changed, 79 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>> index e93c4d2456aa..88ff2c4ad483 100644
>>> --- a/mm/hugetlb.c
>>> +++ b/mm/hugetlb.c
>>> @@ -5077,6 +5077,79 @@ static void move_huge_pte(struct vm_area_struct =
*vma, unsigned long old_addr,
>>>    	spin_unlock(dst_ptl);
>>>    }
>>>
>>> +/* Returns last address processed */
>>> +static unsigned long prealloc_or_move_page_tables(struct vm_area_struc=
t *vma,
>>> +		struct vm_area_struct *new_vma, unsigned long old_addr,
>>> +		unsigned long new_addr, unsigned long len, unsigned long sz,
>>> +		unsigned long last_addr_mask, struct mmu_gather *tlb,
>>> +		bool is_prealloc)
>>> +{
>>> +	unsigned long old_end =3D old_addr + len;
>>> +	struct hstate *h =3D hstate_vma(vma);
>>> +	struct mm_struct *mm =3D vma->vm_mm;
>>> +	pte_t *src_pte, *dst_pte;
>>> +
>>> +	hugetlb_vma_assert_locked(vma);
>>> +
>>> +	for (; old_addr < old_end; old_addr +=3D sz, new_addr +=3D sz) {
>>> +		src_pte =3D hugetlb_walk(vma, old_addr, sz);
>>> +		if (!src_pte) {
>>> +			old_addr |=3D last_addr_mask;
>>> +			new_addr |=3D last_addr_mask;
>>> +			continue;
>>> +		}
>>> +		if (huge_pte_none(huge_ptep_get(mm, old_addr, src_pte)))
>>> +			continue;
>>> +
>>> +		if (is_prealloc) {
>>> +			if (!huge_pte_alloc(mm, new_vma, new_addr, sz))
>>> +				break;
>>> +			continue;
>>> +		}
>>> +
>>> +		if (huge_pmd_unshare(tlb, vma, old_addr, src_pte)) {
>>> +			old_addr |=3D last_addr_mask;
>>> +			new_addr |=3D last_addr_mask;
>>> +			continue;
>>> +		}
>>> +
>>> +		dst_pte =3D hugetlb_walk(new_vma, new_addr, sz);
>>> +		if (!dst_pte)
>>> +			break;
>>> +
>>> +		move_huge_pte(vma, old_addr, new_addr, src_pte, dst_pte, sz);
>>> +		tlb_remove_huge_tlb_entry(h, tlb, src_pte, old_addr);
>>> +	}
>>> +
>>> +	return old_addr;
>>> +}
>>> +
>>> +/* Returns true if preallocation succeeded across range, otherwise fal=
se. */
>>> +static bool prealloc_hugetlb_page_tables(struct vm_area_struct *vma,
>>> +		struct vm_area_struct *new_vma, unsigned long old_addr,
>>> +		unsigned long new_addr, unsigned long len, unsigned long sz,
>>> +		unsigned long last_addr_mask)
>>> +{
>>> +	unsigned long old_end =3D old_addr + len;
>>> +	unsigned long addr_end;
>>> +
>>> +	addr_end =3D prealloc_or_move_page_tables(vma, new_vma, old_addr, new=
_addr,
>>> +			len, sz, last_addr_mask, NULL, /*is_prealloc=3D*/true);
>>> +
>>> +	return addr_end >=3D old_end;
>>> +}
>>> +
>>> +/* Returns last processed address. */
>>> +static unsigned long __move_hugetlb_page_tables(struct vm_area_struct =
*vma,
>>> +		struct vm_area_struct *new_vma, unsigned long old_addr,
>>> +		unsigned long new_addr, unsigned long len, unsigned long sz,
>>> +		unsigned long last_addr_mask, struct mmu_gather *tlb)
>>> +{
>>> +	i_mmap_assert_write_locked(vma->vm_file->f_mapping);
>>> +	return prealloc_or_move_page_tables(vma, new_vma, old_addr, new_addr,
>>> +			len, sz, last_addr_mask, tlb, /*is_prealloc=3D*/false);
>>> +}
>>> +
>>>    int move_hugetlb_page_tables(struct vm_area_struct *vma,
>>>    			     struct vm_area_struct *new_vma,
>>>    			     unsigned long old_addr, unsigned long new_addr,
>>> @@ -5088,9 +5161,9 @@ int move_hugetlb_page_tables(struct vm_area_struc=
t *vma,
>>>    	struct mm_struct *mm =3D vma->vm_mm;
>>>    	unsigned long old_end =3D old_addr + len;
>>>    	unsigned long last_addr_mask;
>>> -	pte_t *src_pte, *dst_pte;
>>>    	struct mmu_notifier_range range;
>>>    	struct mmu_gather tlb;
>>> +	bool preallocated;
>>>
>>>    	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, old_addr,
>>>    				old_end);
>>> @@ -5106,30 +5179,12 @@ int move_hugetlb_page_tables(struct vm_area_str=
uct *vma,
>>>    	last_addr_mask =3D hugetlb_mask_last_page(h);
>>>    	/* Prevent race with file truncation */
>>>    	hugetlb_vma_lock_write(vma);
>>> +	preallocated =3D prealloc_hugetlb_page_tables(vma, new_vma, old_addr,
>>> +			new_addr, len, sz, last_addr_mask);
>>>    	i_mmap_lock_write(mapping);
>>> -	for (; old_addr < old_end; old_addr +=3D sz, new_addr +=3D sz) {
>>> -		src_pte =3D hugetlb_walk(vma, old_addr, sz);
>>> -		if (!src_pte) {
>>> -			old_addr |=3D last_addr_mask;
>>> -			new_addr |=3D last_addr_mask;
>>> -			continue;
>>> -		}
>>> -		if (huge_pte_none(huge_ptep_get(mm, old_addr, src_pte)))
>>> -			continue;
>>> -
>>> -		if (huge_pmd_unshare(&tlb, vma, old_addr, src_pte)) {
>>> -			old_addr |=3D last_addr_mask;
>>> -			new_addr |=3D last_addr_mask;
>>> -			continue;
>>> -		}
>>> -
>>> -		dst_pte =3D huge_pte_alloc(mm, new_vma, new_addr, sz);
>>> -		if (!dst_pte)
>>> -			break;
>>> -
>>> -		move_huge_pte(vma, old_addr, new_addr, src_pte, dst_pte, sz);
>>> -		tlb_remove_huge_tlb_entry(h, &tlb, src_pte, old_addr);
>>> -	}
>>> +	if (preallocated)
>>> +		old_addr =3D __move_hugetlb_page_tables(vma, new_vma, old_addr,
>>> +			new_addr, len, sz, last_addr_mask, &tlb);
>>>
>>>    	tlb_flush_mmu_tlbonly(&tlb);
>>>    	huge_pmd_unshare_flush(&tlb, vma);
>>> --
>>> 2.55.0
>> Hi David,
>>
>> I thought more about the case where the destination page table was
>> preallocated as a shared PMD.
>>
>> I do not think the current move_huge_pte() handles that case very well. =
The
>> reason is that it assumes the destination PTE is not part of a shared PM=
D
>> page table: it clears the source PTE and then installs that PTE into the
>> destination. That works when the destination PMD page table is not share=
d,
>> because the source removal and destination install have a net-zero effec=
t on
>> rmap and hugetlb accounting.
>>
>> If the destination PTE belongs to a shared PMD, that assumption does not
>> hold. In that case, I think we should leave the shared destination page
>> table untouched and treat the operation as a source-side unmap. Otherwis=
e
>> move_huge_pte() either writes through a shared page table or skips the
>> source-side unmap accounting. That can make the rmap, hugetlb count and
>> folio release handling inconsistent with the actual PTE update.
>>
>> So I think the change should be roughly:
> IIUC, what you are saying is:
>
> A) If the source table is shared, unshare it.
>
> b) If the destination table is shared, there is nothing to do.
>
> ?

Yes, mostly.

If the source PMD table is shared, huge_pmd_unshare() already drops that
shared PMD table from the source side and we skip moving individual PTEs
from that table.

If the source PTE is not in a shared PMD table, but the destination PTE
is in a shared PMD table, then I think we should not install the source
PTE into the destination page table. The destination mapping is already
represented by the shared PMD page table.

However, move_huge_pte() still has to handle the source side as an
unmap: clear the source PTE, record the TLB removal, and update the
source-side hugetlb accounting/rmap state. Otherwise the source mapping
is removed from the page table without the matching source-side
accounting. I was able to reproduce this as:

 =C2=A0 BUG: Bad page cache in process init
 =C2=A0 page dumped because: still mapped when deleted

when keeping the preallocation approach but dropping the special handling
for a destination PMD-shared page table.

So my current understanding is:

 =C2=A0 1. source PMD shared: unshare it and skip the PMD-sized range;
 =C2=A0 2. destination PMD shared: do not modify the destination PTE, but
 =C2=A0 =C2=A0 =C2=A0still clear and account the source PTE removal.


Thanks,
Zhe
