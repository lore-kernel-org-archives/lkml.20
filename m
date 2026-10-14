Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F152B3168EF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960020; cv=none; b=Oq4xhFsWwEISkNGFrtc5bCtpIUBpkNd1dxYM5duiD5q+pXbZZUOEr9ZNCBFB3xd45VK10TdLCZrcIVdz/0wVqjXNqap5V42R7BSX8n2IXeJj0ERIgX0XA3dlPPZ8BWKBlOnKFLb/p96lD9GkiCjDxEguQJ5Rs6izp0WKZkVjqAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960020; c=relaxed/simple;
	bh=C0XcoC87yW/++8AJXGOxW05GqKZ6gqXm6NsTqB0339Y=;
	h=Date:Mime-Version:In-Reply-To:References:Message-Id:To:
	 Content-Type:Cc:From:Subject; b=KTUuPMfJXDGdo4Epb/1/607lMdfcdmYE4oFzUnXAH8ENa/R6f2pJHSVuFKLWElg/170Nv5SuIDf4iKgCp1/zEAqkRnaUIHgVWkr4PQjxWPNYyEAlWv5LJtE+wD0X0vndxfIbEFOgajBNgSxrxjGPaPc0jVystextGpY14XeE46k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=XiV83qdJ; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="XiV83qdJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791960007; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=EwuNqo0+XHPwZDaTi39gy+CiCLpMn+EunsNZ/8hw9/Y=;
 b=XiV83qdJI5+J3HFUS6LMfBVVTOP338pX0Is/EZSIVi6EGM0HNiRLoiYoY9/3IEBposbUPb
 Q6FcIgPJx66kjauXVhBQxLtxzCyC1GZsqvpFvh8qf/b/U+SEBgPSCYsTNsM0be3L+JppUd
 LDhZo2MpO0n7X/5LAgEg3IGZ/WM3UAMYBnl/aycXdJS61WAgijJ5+Iz4IB8jStRZKN6ZBR
 FlUVkJJtSzqOFcAsFQm1IpAWovaabGM3hyrFn3KDCVkGthDEzMHLF0dLnBlgoRA75mX2zr
 tUHWYOCv6VephUJlH7N+n1tuKuLkYgo7hn871X8Wd2LkMRgbTmLnXSvc8gCnVg==
Date: Wed, 14 Oct 2026 14:39:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
In-Reply-To: <70ea8ee6-6fc5-4209-8cee-362da37f5035@kernel.org>
References: <20260930064308.58159-1-lizhe.67@bytedance.com> <arzVaC2IYkqSb0_U@gmail.com> <9a7c026e-f5f2-40e0-84aa-919c988cc136@bytedance.com> <2b4571c5-8e51-4c91-9d88-11929f200875@kernel.org> <asjVUa6XBZ8ti-0_@gremlin> <70ea8ee6-6fc5-4209-8cee-362da37f5035@kernel.org>
Message-Id: <86de1ee5-be14-4123-b372-b4691cea8e67@bytedance.com>
X-Lms-Return-Path: <lba+26acf23c5+051143+vger.kernel.org+lizhe.67@bytedance.com>
Content-Transfer-Encoding: quoted-printable
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	<akpm@linux-foundation.org>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: Re: [PATCH] mm/hugetlb: avoid recursive i_mmap_rwsem in PMD sharing

On 10/10/26 2:05 AM, David Hildenbrand (Arm) wrote:
> On 10/9/26 13:52, Lorenzo Stoakes (ARM) wrote:
>> On Mon, Oct 05, 2026 at 11:25:01AM +0200, David Hildenbrand (Arm) wrote:
>>>> David mentioned that Oscar was planning to send a proper fix for this
>>>> issue, so I will wait for that patch instead of moving forward with th=
is
>>>> trylock fallback approach.
>>> @Lorenzo, if Oscar is too busy, I guess we can paste the overall idea f=
or the
>>> fix here as well (publicly)?
>> Yeah I don't see why not! I don't think there's anything that needs to b=
e
>> private here.
> Li, see below, can you work with the below?
>
>
> ----8<----
>  From 9e1c0676ea6c9cbcabf91cd8badf81a9d88fd3ef Mon Sep 17 00:00:00 2001
> From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
> Date: Wed, 29 Jul 2026 18:33:08 +0100
> Subject: [PATCH] fix
>
> ---
>   mm/hugetlb.c | 103 +++++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 79 insertions(+), 24 deletions(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index e93c4d2456aa..88ff2c4ad483 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5077,6 +5077,79 @@ static void move_huge_pte(struct vm_area_struct *v=
ma, unsigned long old_addr,
>   	spin_unlock(dst_ptl);
>   }
>
> +/* Returns last address processed */
> +static unsigned long prealloc_or_move_page_tables(struct vm_area_struct =
*vma,
> +		struct vm_area_struct *new_vma, unsigned long old_addr,
> +		unsigned long new_addr, unsigned long len, unsigned long sz,
> +		unsigned long last_addr_mask, struct mmu_gather *tlb,
> +		bool is_prealloc)
> +{
> +	unsigned long old_end =3D old_addr + len;
> +	struct hstate *h =3D hstate_vma(vma);
> +	struct mm_struct *mm =3D vma->vm_mm;
> +	pte_t *src_pte, *dst_pte;
> +
> +	hugetlb_vma_assert_locked(vma);
> +
> +	for (; old_addr < old_end; old_addr +=3D sz, new_addr +=3D sz) {
> +		src_pte =3D hugetlb_walk(vma, old_addr, sz);
> +		if (!src_pte) {
> +			old_addr |=3D last_addr_mask;
> +			new_addr |=3D last_addr_mask;
> +			continue;
> +		}
> +		if (huge_pte_none(huge_ptep_get(mm, old_addr, src_pte)))
> +			continue;
> +
> +		if (is_prealloc) {
> +			if (!huge_pte_alloc(mm, new_vma, new_addr, sz))
> +				break;
> +			continue;
> +		}
> +
> +		if (huge_pmd_unshare(tlb, vma, old_addr, src_pte)) {
> +			old_addr |=3D last_addr_mask;
> +			new_addr |=3D last_addr_mask;
> +			continue;
> +		}
> +
> +		dst_pte =3D hugetlb_walk(new_vma, new_addr, sz);
> +		if (!dst_pte)
> +			break;
> +
> +		move_huge_pte(vma, old_addr, new_addr, src_pte, dst_pte, sz);
> +		tlb_remove_huge_tlb_entry(h, tlb, src_pte, old_addr);
> +	}
> +
> +	return old_addr;
> +}
> +
> +/* Returns true if preallocation succeeded across range, otherwise false=
. */
> +static bool prealloc_hugetlb_page_tables(struct vm_area_struct *vma,
> +		struct vm_area_struct *new_vma, unsigned long old_addr,
> +		unsigned long new_addr, unsigned long len, unsigned long sz,
> +		unsigned long last_addr_mask)
> +{
> +	unsigned long old_end =3D old_addr + len;
> +	unsigned long addr_end;
> +
> +	addr_end =3D prealloc_or_move_page_tables(vma, new_vma, old_addr, new_a=
ddr,
> +			len, sz, last_addr_mask, NULL, /*is_prealloc=3D*/true);
> +
> +	return addr_end >=3D old_end;
> +}
> +
> +/* Returns last processed address. */
> +static unsigned long __move_hugetlb_page_tables(struct vm_area_struct *v=
ma,
> +		struct vm_area_struct *new_vma, unsigned long old_addr,
> +		unsigned long new_addr, unsigned long len, unsigned long sz,
> +		unsigned long last_addr_mask, struct mmu_gather *tlb)
> +{
> +	i_mmap_assert_write_locked(vma->vm_file->f_mapping);
> +	return prealloc_or_move_page_tables(vma, new_vma, old_addr, new_addr,
> +			len, sz, last_addr_mask, tlb, /*is_prealloc=3D*/false);
> +}
> +
>   int move_hugetlb_page_tables(struct vm_area_struct *vma,
>   			     struct vm_area_struct *new_vma,
>   			     unsigned long old_addr, unsigned long new_addr,
> @@ -5088,9 +5161,9 @@ int move_hugetlb_page_tables(struct vm_area_struct =
*vma,
>   	struct mm_struct *mm =3D vma->vm_mm;
>   	unsigned long old_end =3D old_addr + len;
>   	unsigned long last_addr_mask;
> -	pte_t *src_pte, *dst_pte;
>   	struct mmu_notifier_range range;
>   	struct mmu_gather tlb;
> +	bool preallocated;
>
>   	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, old_addr,
>   				old_end);
> @@ -5106,30 +5179,12 @@ int move_hugetlb_page_tables(struct vm_area_struc=
t *vma,
>   	last_addr_mask =3D hugetlb_mask_last_page(h);
>   	/* Prevent race with file truncation */
>   	hugetlb_vma_lock_write(vma);
> +	preallocated =3D prealloc_hugetlb_page_tables(vma, new_vma, old_addr,
> +			new_addr, len, sz, last_addr_mask);
>   	i_mmap_lock_write(mapping);
> -	for (; old_addr < old_end; old_addr +=3D sz, new_addr +=3D sz) {
> -		src_pte =3D hugetlb_walk(vma, old_addr, sz);
> -		if (!src_pte) {
> -			old_addr |=3D last_addr_mask;
> -			new_addr |=3D last_addr_mask;
> -			continue;
> -		}
> -		if (huge_pte_none(huge_ptep_get(mm, old_addr, src_pte)))
> -			continue;
> -
> -		if (huge_pmd_unshare(&tlb, vma, old_addr, src_pte)) {
> -			old_addr |=3D last_addr_mask;
> -			new_addr |=3D last_addr_mask;
> -			continue;
> -		}
> -
> -		dst_pte =3D huge_pte_alloc(mm, new_vma, new_addr, sz);
> -		if (!dst_pte)
> -			break;
> -
> -		move_huge_pte(vma, old_addr, new_addr, src_pte, dst_pte, sz);
> -		tlb_remove_huge_tlb_entry(h, &tlb, src_pte, old_addr);
> -	}
> +	if (preallocated)
> +		old_addr =3D __move_hugetlb_page_tables(vma, new_vma, old_addr,
> +			new_addr, len, sz, last_addr_mask, &tlb);
>
>   	tlb_flush_mmu_tlbonly(&tlb);
>   	huge_pmd_unshare_flush(&tlb, vma);
> --
> 2.55.0

Hi David,

I thought more about the case where the destination page table was
preallocated as a shared PMD.

I do not think the current move_huge_pte() handles that case very well. The
reason is that it assumes the destination PTE is not part of a shared PMD
page table: it clears the source PTE and then installs that PTE into the
destination. That works when the destination PMD page table is not shared,
because the source removal and destination install have a net-zero effect o=
n
rmap and hugetlb accounting.

If the destination PTE belongs to a shared PMD, that assumption does not
hold. In that case, I think we should leave the shared destination page
table untouched and treat the operation as a source-side unmap. Otherwise
move_huge_pte() either writes through a shared page table or skips the
source-side unmap accounting. That can make the rmap, hugetlb count and
folio release handling inconsistent with the actual PTE update.

So I think the change should be roughly:


---
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
@@
 =C2=A0static void move_huge_pte(struct vm_area_struct *vma, unsigned long=
=20
old_addr,
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long new_addr, p=
te_t *src_pte,
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pte_t *dst_pte, unsigned =
long sz)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long new_addr, p=
te_t *src_pte,
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pte_t *dst_pte, struct mm=
u_gather *tlb,
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long sz)
 =C2=A0{
 =C2=A0 =C2=A0 =C2=A0struct hstate *h =3D hstate_vma(vma);
+=C2=A0 =C2=A0 bool dst_shared =3D hugetlb_pmd_shared(dst_pte);
 =C2=A0 =C2=A0 =C2=A0struct mm_struct *mm =3D vma->vm_mm;
+=C2=A0 =C2=A0 struct folio *folio =3D NULL;
 =C2=A0 =C2=A0 =C2=A0pte_t pte;

 =C2=A0 =C2=A0 =C2=A0pte =3D huge_ptep_get_and_clear(mm, old_addr, src_pte,=
 sz);
+=C2=A0 =C2=A0 tlb_remove_huge_tlb_entry(h, tlb, src_pte, old_addr);
+
+=C2=A0 =C2=A0 if (dst_shared) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pte_present(pte)) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 folio =3D page_folio(pte_page(pt=
e));
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (huge_pte_dirty(pte))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 folio_mark_dirty(f=
olio);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hugetlb_count_sub(pages_per_huge=
_page(h), mm);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hugetlb_remove_rmap(folio);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto unlock;
+=C2=A0 =C2=A0 }

 =C2=A0 =C2=A0 =C2=A0/* Existing non-shared destination path remains unchan=
ged. */
 =C2=A0 =C2=A0 =C2=A0set_huge_pte_at(mm, new_addr, dst_pte, pte, sz);

+unlock:
 =C2=A0 =C2=A0 =C2=A0...
+
+=C2=A0 =C2=A0 if (folio)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tlb_remove_page_size(tlb, folio_page(folio, 0)=
,
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0folio_size(folio));
 =C2=A0}
---


Does this sound like the right direction to you? If so, I will fold this
into the next version.

Thanks,
Zhe
