Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E557361941
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791614291; cv=none; b=biUaFQmMdSKxHFV6JXG6YS1YNqyxKPeTUf4q3d5ps6ZVwV+/B7kV70LVMsAAvcnWrGrxhrcu2d82F2TAHNt8Z9ArwmY3Kssva/3II3GuPgqe/6yp4XeajTG0G+74xOYRYpOLrcmSuBVCtaWRP4xomrntiZduIpALKL3OA8C8bSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791614291; c=relaxed/simple;
	bh=IwNVA5MWxOp1T+zTfUF5AynSJgR8CBfD+8rEqNe2b3k=;
	h=Date:References:Message-Id:Content-Type:Subject:Mime-Version:
	 In-Reply-To:To:Cc:From; b=tvMuSwXvvxkjQywMXko+LxFNhNDzGAChA7naj6VxCZrXa2kPZz0YxhWE9sqXO+6PJ6/Q8eo/GZiPh2EuZ46uXcANAGlwiBOfEWwht0by79ghIWdydv91M0f/NlKtKAXCYDJW5DnX24hc3k/89IV+py8iRzWDFHRSc13Tehm+DYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jB9Fyvqd; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jB9Fyvqd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791614283; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=gEZ9kNVs3FLih4w7q04wSSL1EKEuCKqTB4w9IOg1y2w=;
 b=jB9Fyvqd6RqyhpSdW85SivXeemIVq79I9saxVi3UJu53GQ0pI96qZ777rOu7u9uzdrZznE
 /PxzxZ0GLwuK24xoS0HRbWV4zyCdN13vf1MTeZNUaU8wbR2iLOuGBYmumL2YYx7o1DWHPi
 4R9mteazauYa5Rr5peZLWU4M212GWJtJHL23L0ikiuq0tx5jHdQXrQa0Bu1q2hA0TPhMvg
 TivyHRv18083Gh0Vzxbe6wfYAGNXvhNRICVezdcb8RmQfbCN4ahLrnIQvFmKAo1SpYZZd3
 9fk6EwY7YUirQ3G6ccTlGFqdu3Ba4Okxw1SvlgcD6+U6IpvcXh7YOdzIrINhKw==
Date: Sat, 10 Oct 2026 14:37:46 +0800
References: <20260930064308.58159-1-lizhe.67@bytedance.com> <arzVaC2IYkqSb0_U@gmail.com> <9a7c026e-f5f2-40e0-84aa-919c988cc136@bytedance.com> <2b4571c5-8e51-4c91-9d88-11929f200875@kernel.org> <asjVUa6XBZ8ti-0_@gremlin> <70ea8ee6-6fc5-4209-8cee-362da37f5035@kernel.org>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Message-Id: <ab1577d2-a9ce-41db-a632-8e25652dab31@bytedance.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH] mm/hugetlb: avoid recursive i_mmap_rwsem in PMD sharing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ac9dd49+177b18+vger.kernel.org+lizhe.67@bytedance.com>
In-Reply-To: <70ea8ee6-6fc5-4209-8cee-362da37f5035@kernel.org>
User-Agent: Mozilla Thunderbird
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	<akpm@linux-foundation.org>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>
From: "Li Zhe" <lizhe.67@bytedance.com>

On 10/10/26 2:05 AM, David Hildenbrand (Arm) wrote:
> On 10/9/26 13:52, Lorenzo Stoakes (ARM) wrote:
>> On Mon, Oct 05, 2026 at 11:25:01AM +0200, David Hildenbrand (Arm) wrote:
>>>> David mentioned that Oscar was planning to send a proper fix for this
>>>> issue, so I will wait for that patch instead of moving forward with this
>>>> trylock fallback approach.
>>> @Lorenzo, if Oscar is too busy, I guess we can paste the overall idea for the
>>> fix here as well (publicly)?
>> Yeah I don't see why not! I don't think there's anything that needs to be
>> private here.
> Li, see below, can you work with the below?


Thanks for the patch. I tested it with my original mremap reproducer, and
I can no longer reproduce the hung task.

I also checked the hugetlb_change_protection() / uffd-wp path Jose
mentioned. That path can reach hugetlb_change_protection() and
huge_pte_alloc(), but it does not enter huge_pmd_share(), because
VM_UFFD_WP makes want_pmd_share() return false via
uffd_disable_huge_pmd_share().

My understanding of your patch is that we preallocate the destination
hugetlb page tables before taking the mapping's i_mmap_rwsem in write
mode. Then, while holding i_mmap_rwsem, we only walk the preallocated
destination PTEs and move the source huge PTEs over. This avoids calling
huge_pte_alloc(), and therefore huge_pmd_share(), while already holding
i_mmap_rwsem for write.

Does that match your intended direction? If so, I will go through the
details and make sure there are no issues, then send a v2 based on this
approach.

Thanks,
Zhe

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
> @@ -5077,6 +5077,79 @@ static void move_huge_pte(struct vm_area_struct *vma, unsigned long old_addr,
>   	spin_unlock(dst_ptl);
>   }
>
> +/* Returns last address processed */
> +static unsigned long prealloc_or_move_page_tables(struct vm_area_struct *vma,
> +		struct vm_area_struct *new_vma, unsigned long old_addr,
> +		unsigned long new_addr, unsigned long len, unsigned long sz,
> +		unsigned long last_addr_mask, struct mmu_gather *tlb,
> +		bool is_prealloc)
> +{
> +	unsigned long old_end = old_addr + len;
> +	struct hstate *h = hstate_vma(vma);
> +	struct mm_struct *mm = vma->vm_mm;
> +	pte_t *src_pte, *dst_pte;
> +
> +	hugetlb_vma_assert_locked(vma);
> +
> +	for (; old_addr < old_end; old_addr += sz, new_addr += sz) {
> +		src_pte = hugetlb_walk(vma, old_addr, sz);
> +		if (!src_pte) {
> +			old_addr |= last_addr_mask;
> +			new_addr |= last_addr_mask;
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
> +			old_addr |= last_addr_mask;
> +			new_addr |= last_addr_mask;
> +			continue;
> +		}
> +
> +		dst_pte = hugetlb_walk(new_vma, new_addr, sz);
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
> +/* Returns true if preallocation succeeded across range, otherwise false. */
> +static bool prealloc_hugetlb_page_tables(struct vm_area_struct *vma,
> +		struct vm_area_struct *new_vma, unsigned long old_addr,
> +		unsigned long new_addr, unsigned long len, unsigned long sz,
> +		unsigned long last_addr_mask)
> +{
> +	unsigned long old_end = old_addr + len;
> +	unsigned long addr_end;
> +
> +	addr_end = prealloc_or_move_page_tables(vma, new_vma, old_addr, new_addr,
> +			len, sz, last_addr_mask, NULL, /*is_prealloc=*/true);
> +
> +	return addr_end >= old_end;
> +}
> +
> +/* Returns last processed address. */
> +static unsigned long __move_hugetlb_page_tables(struct vm_area_struct *vma,
> +		struct vm_area_struct *new_vma, unsigned long old_addr,
> +		unsigned long new_addr, unsigned long len, unsigned long sz,
> +		unsigned long last_addr_mask, struct mmu_gather *tlb)
> +{
> +	i_mmap_assert_write_locked(vma->vm_file->f_mapping);
> +	return prealloc_or_move_page_tables(vma, new_vma, old_addr, new_addr,
> +			len, sz, last_addr_mask, tlb, /*is_prealloc=*/false);
> +}
> +
>   int move_hugetlb_page_tables(struct vm_area_struct *vma,
>   			     struct vm_area_struct *new_vma,
>   			     unsigned long old_addr, unsigned long new_addr,
> @@ -5088,9 +5161,9 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
>   	struct mm_struct *mm = vma->vm_mm;
>   	unsigned long old_end = old_addr + len;
>   	unsigned long last_addr_mask;
> -	pte_t *src_pte, *dst_pte;
>   	struct mmu_notifier_range range;
>   	struct mmu_gather tlb;
> +	bool preallocated;
>
>   	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, old_addr,
>   				old_end);
> @@ -5106,30 +5179,12 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
>   	last_addr_mask = hugetlb_mask_last_page(h);
>   	/* Prevent race with file truncation */
>   	hugetlb_vma_lock_write(vma);
> +	preallocated = prealloc_hugetlb_page_tables(vma, new_vma, old_addr,
> +			new_addr, len, sz, last_addr_mask);
>   	i_mmap_lock_write(mapping);
> -	for (; old_addr < old_end; old_addr += sz, new_addr += sz) {
> -		src_pte = hugetlb_walk(vma, old_addr, sz);
> -		if (!src_pte) {
> -			old_addr |= last_addr_mask;
> -			new_addr |= last_addr_mask;
> -			continue;
> -		}
> -		if (huge_pte_none(huge_ptep_get(mm, old_addr, src_pte)))
> -			continue;
> -
> -		if (huge_pmd_unshare(&tlb, vma, old_addr, src_pte)) {
> -			old_addr |= last_addr_mask;
> -			new_addr |= last_addr_mask;
> -			continue;
> -		}
> -
> -		dst_pte = huge_pte_alloc(mm, new_vma, new_addr, sz);
> -		if (!dst_pte)
> -			break;
> -
> -		move_huge_pte(vma, old_addr, new_addr, src_pte, dst_pte, sz);
> -		tlb_remove_huge_tlb_entry(h, &tlb, src_pte, old_addr);
> -	}
> +	if (preallocated)
> +		old_addr = __move_hugetlb_page_tables(vma, new_vma, old_addr,
> +			new_addr, len, sz, last_addr_mask, &tlb);
>
>   	tlb_flush_mmu_tlbonly(&tlb);
>   	huge_pmd_unshare_flush(&tlb, vma);
> --
> 2.55.0
