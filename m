Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37FF3D88FA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393368; cv=none; b=qWSNVsT401mAix3u+Qo++8b1cz2nYlVeiLGjUY48MeeeQjGVQniOH6LoNQnCqM4+7+mzFxDBh6saswTOs+dJ4ASOW0dmKrvgQy639zzqkJFYtaelIL7TiHDylVI7hBu3YbAtj6mcCu0n5YvIzg4p72zV1slPPesFi4kqWQ8TAEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393368; c=relaxed/simple;
	bh=0Vt5alXm6MeOoH3XXC0xWPb7R2uxCqupZ76Ru/W7X/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/xgK8owWzVRAAbdli4Ei19Se28MWjjBY5+H61MMUB2nUDYbnlsQbfVLIbVyUR1/6+kVurkZNH6+jcV610W1F/Zd0sXn46J3ty9o0XF07o3J6HW32hGM27kICzoTVeQr9y+vWBLeZChmTkieL05hatuTg5gARRvhNNs86SeGFbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SV6ZPi3Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SV6ZPi3Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687AC1F000FF;
	Mon, 14 Sep 2026 13:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789393366;
	bh=3BCtIVGaFrK84rHYDsXJCu4GU+rN8YV13RCmCsAqNzU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SV6ZPi3QftK0oV2Gw/ZjShiSD8DhHQfnS0q9dpTb9QiYvt8knlldRIQdeORlYRrrH
	 boZVHI4N5aKytFZV8uq7EqXnyyyfM95ebPJhxukUDkylzkw6ofLYO/juXjufbPpmYK
	 brlsiftVFH0HhMWfGUfCbVyWKFZ0Exueq8QT4VFtakdynnCMjtY9TasLlk61qOeRKt
	 O9iOCnUuHZKDOT8EbtECSIeqy3kKzr67nDf6LtjOFphMbAxMmRZ/jz4VbYk7UfVIup
	 yuHDR0oVKXLXHfNPqjJPiDmEh8e+RJagNPHMT6Qu+HKWi2xHvU8lRcBTZj4cip1h5F
	 VsHi7+XTlhBbg==
Message-ID: <7fff15cd-5136-418c-a8a4-b9fe5f30ad81@kernel.org>
Date: Mon, 14 Sep 2026 15:42:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm/hugetlb: preserve mremap address delta when
 skipping page tables
To: Jaewook You <jaewook376@gmail.com>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johan Hovold
 <johan@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260911182408.75821-1-jaewook376@gmail.com>
 <20260914132352.472-1-jaewook376@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260914132352.472-1-jaewook376@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/26 15:23, Jaewook You wrote:
> move_hugetlb_page_tables() optimizes mremap() by advancing to the last
> entry in the page table when the source page table does not exist, either
> initially or after unsharing a PMD table.  The common loop increment then
> steps to the first entry in the next page table.
> 
> However, the code advances both the source and destination addresses to
> the last entries in their respective page tables, which is wrong.  The
> destination address must be advanced only by the same amount as the source
> address.
> 
> If the source and destination offsets within their page tables differ, the
> destination address can be advanced too far, causing follow-up issues.  Fix
> this by advancing the destination address by the source advance distance.
> 
> With a reproducer, we were able to trigger a kernel panic on x86-64.  With
> this fix in place, we can no longer reproduce the issue.
> 
> Fixes: e95a9851787b ("hugetlb: skip to end of PT page mapping when pte not present")
> Fixes: 4ddb4d91b82f ("hugetlb: do not update address in huge_pmd_unshare")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Jaewook You <jaewook376@gmail.com>
> ---
> Changes in v3:
> - Clarify that the optimization advances to the last entry in the current
>   page table before the common loop increment steps to the next entry.
> - Rename remaining_size to offset_to_last_entry as suggested by David.
> 
> v2: https://lore.kernel.org/20260911182408.75821-1-jaewook376@gmail.com/
> 

v2 does not exist publicly ;)

This would have been better send as a v1 upstream (I mentioned this in private
but you might have missed it).

>  mm/hugetlb.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 4f6f58bf3db6c..5749f6270fb1f 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5161,18 +5161,21 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
>  	hugetlb_vma_lock_write(vma);
>  	i_mmap_lock_write(mapping);
>  	for (; old_addr < old_end; old_addr += sz, new_addr += sz) {
> +		const unsigned long offset_to_last_entry =
> +			(old_addr | last_addr_mask) - old_addr;
> +
>  		src_pte = hugetlb_walk(vma, old_addr, sz);
>  		if (!src_pte) {
> -			old_addr |= last_addr_mask;
> -			new_addr |= last_addr_mask;
> +			old_addr += offset_to_last_entry;
> +			new_addr += offset_to_last_entry;
>  			continue;
>  		}
>  		if (huge_pte_none(huge_ptep_get(mm, old_addr, src_pte)))
>  			continue;
>  
>  		if (huge_pmd_unshare(&tlb, vma, old_addr, src_pte)) {
> -			old_addr |= last_addr_mask;
> -			new_addr |= last_addr_mask;
> +			old_addr += offset_to_last_entry;
> +			new_addr += offset_to_last_entry;
>  			continue;

As Oscar expressed, he might prefer some comment about the situation. But maybe
that can be deferred to some proper cleanups here.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
