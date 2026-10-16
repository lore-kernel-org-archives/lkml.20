Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5F33BB122
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141003; cv=none; b=Bz2zQzhRYAC1SiFUaCJldFeIyZKp0zli/hvrDWjR8rFcQuBuzGCrzlBAUee6wKry1MaMfpAOD62f/FDJrxidYy8lGo6Git2tuSVv3/BwzaOh+/pSKvKFbs/2QBsT1QeomM8BUrCNfx4pMPRSp70pBoekxWtqFuo/IcjWKDUFkGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141003; c=relaxed/simple;
	bh=GmUDiaORjuRYOKneZfjtXP3c4wLZOMDQTKf6Hy9sdUk=;
	h=Cc:From:Message-Id:Mime-Version:Content-Type:Date:In-Reply-To:To:
	 Subject:References; b=W4D2bL+dFPvemofu8uCVCPCmxUzFHiSNwSwt/cVLKMHlat+nGCADmuDlYm5WbMIGhOvkJr3TjkvfTlMe0ckmN4etklFXaObvvBQ32chZSfgovxjf20Y/QKoFPkDUipWMaj7nHmXkI8a4LUYGNNEdzlIf6IvJuC9MEgblk+tPKS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hg9G/pjJ; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hg9G/pjJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792140988; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=JQiwVdIK4vBXJJpYT47996cqj9h+8EQFDKlEgBsPi2k=;
 b=hg9G/pjJ5AyrytlBk/RvOgukJNuMYnum4mg374qmjpnIJKwnd3YRl4DmNPbrirMMvqk0TB
 8FLGYl8TWQlW/8nV71mMOgcpp/62JcPgtHhJ1m1ZuL/EBWcPdF6MSiQwkA/oMChunNGRTD
 h/VB1XjEEyVWNcCP4P9SqNx9YFV0vUj+4hrl3to8CVlNZr9gsR82S9OOEKqMNYHIFWqMXT
 SLgjLypbiQHXCuk7eagf70GGsMl6eGq36Y9aokwbCuFEeLRTVna4fr8v1jjA+pun977Awd
 QqTIeJbwLk2IDrsYbgeCmHhXCM1aG1HK+KUFTb62qhmHUnUi1n0tybqjtJmisw==
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	<akpm@linux-foundation.org>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>
User-Agent: Mozilla Thunderbird
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <f529ea30-2e93-4862-9642-21dc1b233e0c@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26ad1e6ba+d9f6df+vger.kernel.org+lizhe.67@bytedance.com>
Date: Fri, 16 Oct 2026 16:56:11 +0800
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <33e26c40-45f4-44a4-bfea-1ae7ff74e4cf@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH] mm/hugetlb: avoid recursive i_mmap_rwsem in PMD sharing
References: <20260930064308.58159-1-lizhe.67@bytedance.com> <arzVaC2IYkqSb0_U@gmail.com> <9a7c026e-f5f2-40e0-84aa-919c988cc136@bytedance.com> <2b4571c5-8e51-4c91-9d88-11929f200875@kernel.org> <asjVUa6XBZ8ti-0_@gremlin> <70ea8ee6-6fc5-4209-8cee-362da37f5035@kernel.org> <86de1ee5-be14-4123-b372-b4691cea8e67@bytedance.com> <fedff1b6-0522-4398-a0d4-d4111a570159@kernel.org> <98d4a305-51e4-4374-b09d-7d251dbf166d@bytedance.com> <33e26c40-45f4-44a4-bfea-1ae7ff74e4cf@kernel.org>

On 10/16/26 3:33 AM, David Hildenbrand (Arm) wrote:
> On 10/15/26 04:40, Li Zhe wrote:
>> On 10/14/26 6:52 PM, David Hildenbrand (Arm) wrote:
>>> On 10/14/26 08:39, Li Zhe wrote:
>>>> Hi David,
>>>>
>>>> I thought more about the case where the destination page table was
>>>> preallocated as a shared PMD.
>>>>
>>>> I do not think the current move_huge_pte() handles that case very well=
. The
>>>> reason is that it assumes the destination PTE is not part of a shared =
PMD
>>>> page table: it clears the source PTE and then installs that PTE into t=
he
>>>> destination. That works when the destination PMD page table is not sha=
red,
>>>> because the source removal and destination install have a net-zero eff=
ect on
>>>> rmap and hugetlb accounting.
>>>>
>>>> If the destination PTE belongs to a shared PMD, that assumption does n=
ot
>>>> hold. In that case, I think we should leave the shared destination pag=
e
>>>> table untouched and treat the operation as a source-side unmap. Otherw=
ise
>>>> move_huge_pte() either writes through a shared page table or skips the
>>>> source-side unmap accounting. That can make the rmap, hugetlb count an=
d
>>>> folio release handling inconsistent with the actual PTE update.
>>>>
>>>> So I think the change should be roughly:
>>> IIUC, what you are saying is:
>>>
>>> A) If the source table is shared, unshare it.
>>>
>>> b) If the destination table is shared, there is nothing to do.
>>>
>>> ?
>> Yes, mostly.
>>
>> If the source PMD table is shared, huge_pmd_unshare() already drops that
>> shared PMD table from the source side and we skip moving individual PTEs
>> from that table.
>>
>> If the source PTE is not in a shared PMD table, but the destination PTE
>> is in a shared PMD table, then I think we should not install the source
>> PTE into the destination page table. The destination mapping is already
>> represented by the shared PMD page table.
>>
>> However, move_huge_pte() still has to handle the source side as an
>> unmap: clear the source PTE, record the TLB removal, and update the
>> source-side hugetlb accounting/rmap state. Otherwise the source mapping
>> is removed from the page table without the matching source-side
>> accounting. I was able to reproduce this as:
>>
>>   =C2=A0 BUG: Bad page cache in process init
>>   =C2=A0 page dumped because: still mapped when deleted
>>
>> when keeping the preallocation approach but dropping the special handlin=
g
>> for a destination PMD-shared page table.
>>
>> So my current understanding is:
>>
>>   =C2=A0 1. source PMD shared: unshare it and skip the PMD-sized range;
>>   =C2=A0 2. destination PMD shared: do not modify the destination PTE, b=
ut
>>   =C2=A0 =C2=A0 =C2=A0still clear and account the source PTE removal.
> Yes, I think this makes a lot of sense. Given that this issue has been
> in the works for more than one month without a fix I tried to see how to =
do
> it cleaner than your version:
>
> This is what I came up with quickly, using existing helpers by refactorin=
g them.
>
> Is this what you had in mind? I didn't actually test this yet. If it make=
s sense,
> could you test it and possibly clean it up further?
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index fb51f7d02cebf..0c3aebea7a2f8 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -124,6 +124,9 @@ static int __huge_pmd_unshare(struct mmu_gather *tlb,
>   		bool check_locks);
>   static void hugetlb_unshare_pmds(struct vm_area_struct *vma,
>   		unsigned long start, unsigned long end, bool take_locks);
> +static void hugetlb_unmap_range(struct mmu_gather *tlb,
> +		struct vm_area_struct *vma, unsigned long start, unsigned long end,
> +		struct folio *folio, zap_flags_t zap_flags);
>   static struct resv_map *vma_resv_map(struct vm_area_struct *vma);
>  =20
>   static inline bool subpool_is_free(struct hugepage_subpool *spool)
> @@ -5172,6 +5175,8 @@ int move_hugetlb_page_tables(struct vm_area_struct =
*vma,
>   	for (; old_addr < old_end; old_addr +=3D sz, new_addr +=3D sz) {
>   		const unsigned long offset_to_last_entry =3D
>   			(old_addr | last_addr_mask) - old_addr;
> +		const unsigned long offset_to_last_dst_entry =3D
> +			(new_addr | last_addr_mask) - new_addr;
>  =20
>   		src_pte =3D hugetlb_walk(vma, old_addr, sz);
>   		if (!src_pte) {
> @@ -5188,6 +5193,23 @@ int move_hugetlb_page_tables(struct vm_area_struct=
 *vma,
>   			continue;
>   		}
>  =20
> +		/*
> +		 * Don't try to install a shared PMD table and move stuff into
> +		 * them. Instead, just zap the source PMDs and share the PMD
> +		 * table later lazily.
> +		 */
> +		if (sz =3D=3D PMD_SIZE && want_pmd_share(new_vma, new_addr)) {
> +			const unsigned long unmap_size =3D min(old_end - old_addr,
> +							     offset_to_last_dst_entry + sz);
> +
> +			hugetlb_unmap_range(&tlb, vma, old_addr,
> +					    old_addr + unmap_size, NULL,
> +					    ZAP_FLAG_DROP_MARKER);
> +			old_addr +=3D unmap_size - sz;
> +			new_addr +=3D unmap_size - sz;
> +			continue;
> +		}
> +
>   		dst_pte =3D huge_pte_alloc(mm, new_vma, new_addr, sz);
>   		if (!dst_pte)
>   			break;
> @@ -5207,9 +5229,9 @@ int move_hugetlb_page_tables(struct vm_area_struct =
*vma,
>   	return len + old_addr - old_end;
>   }
>  =20
> -void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struc=
t *vma,
> -			    unsigned long start, unsigned long end,
> -			    struct folio *folio, zap_flags_t zap_flags)
> +static void hugetlb_unmap_range(struct mmu_gather *tlb,
> +		struct vm_area_struct *vma, unsigned long start, unsigned long end,
> +		struct folio *folio, zap_flags_t zap_flags)
>   {
>   	struct mm_struct *mm =3D vma->vm_mm;
>   	const bool folio_provided =3D !!folio;
> @@ -5227,13 +5249,6 @@ void __unmap_hugepage_range(struct mmu_gather *tlb=
, struct vm_area_struct *vma,
>   	BUG_ON(start & ~huge_page_mask(h));
>   	BUG_ON(end & ~huge_page_mask(h));
>  =20
> -	/*
> -	 * This is a hugetlb vma, all the pte entries should point
> -	 * to huge page.
> -	 */
> -	tlb_change_page_size(tlb, sz);
> -	tlb_start_vma(tlb, vma);
> -
>   	last_addr_mask =3D hugetlb_mask_last_page(h);
>   	address =3D start;
>   	for (; address < end; address +=3D sz) {
> @@ -5362,6 +5377,15 @@ void __unmap_hugepage_range(struct mmu_gather *tlb=
, struct vm_area_struct *vma,
>   		if (folio_provided)
>   			break;
>   	}
> +}
> +
> +void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struc=
t *vma,
> +			    unsigned long start, unsigned long end,
> +			    struct folio *folio, zap_flags_t zap_flags)
> +{
> +	tlb_change_page_size(tlb, huge_page_size(hstate_vma(vma)));
> +	tlb_start_vma(tlb, vma);
> +	hugetlb_unmap_range(tlb, vma, start, end, folio, zap_flags);
>   	tlb_end_vma(tlb, vma);
>  =20
>   	huge_pmd_unshare_flush(tlb, vma);


Hi David,

Your patch looks good to me.

Sashiko pointed out one corner case around UFFDIO_POISON.=C2=A0 In the
destination-PMD-sharing path, the patch zaps the source range and lets
the destination fault path populate or share the PMD lazily.=C2=A0 That wor=
ks
for normal hugetlb mappings, but if the source PTE contains
PTE_MARKER_POISONED, the marker is not copied to the destination. The
source zap uses ZAP_FLAG_DROP_MARKER, so the marker can be dropped, and a
later fault at the new address would see an empty entry instead of the
poisoned marker.

One possible way to avoid this is to make VM_UFFD_MISSING participate in
the existing uffd_disable_huge_pmd_share() logic, because UFFDIO_POISON
can install PTE_MARKER_POISONED and the poison state is stored in the
PTE, similar to the existing UFFD-WP/RWP per-PTE state.

For example:

---
diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index a4351cffc60c..9a057d7531c3 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -183,8 +187,8 @@ static inline bool=20
is_mergeable_vm_userfaultfd_ctx(struct
vm_area_struct *vma,
 =C2=A0static inline bool uffd_disable_huge_pmd_share(struct vm_area_struct=
 *vma)
 =C2=A0{
 =C2=A0 =C2=A0 =C2=A0return vma_test_any_mask(vma,
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mk_vma_flags_from_masks(VMA_UFFD_WP, VMA_UFFD_=
RWP,
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMA_=
UFFD_MINOR));
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mk_vma_flags_from_masks(VMA_UFFD_MISSING, VMA_=
UFFD_WP,
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMA_=
UFFD_RWP, VMA_UFFD_MINOR));
 =C2=A0}

 =C2=A0/*
---
However, Sashiko also pointed out that this may still be incomplete,
because PTE_MARKER_POISONED can outlive VM_UFFD_MISSING.

I am not very familiar with this part of the userfaultfdsemantics.

Do you have any suggestions for this issue or for this direction?

Thanks,
Zhe
