Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CA053FD54
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973199; cv=none; b=VLkX0Lzi9Y8PlfDneVKwQB7F7KQdh6i/rww1b2UB+1MCf+TRgw8HJ5fiWsdBYalA2lQ+tFQL+mG5UkjabmLEF+uaLLjKKxZmJcwefTpHuby+EMWQk0E+pYfBvdofJ4biZrPLH2Ge7JHz183kPcNKt27pIFI5oEPSNeFxAKBCR0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973199; c=relaxed/simple;
	bh=3ZoTCmvqkdETJBOj3O8zkoBbtgKjyIAK4uQI6bwSwY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iq7rvy2wRifeHrOTkxXSOpiWe8h9XehRtWJwgbnfNTBwwejI4/Ru2zSyn1a0hRC84Rbfid84TdjdKtMkPyKl7Biyyp7Xt5lRDbMTlcuylOrWt3JUkrRRBhQw6ufhX4Bn4ed2VqKSfK2c4gZpUOYWA7gW6aknN1EYlS43HQIJrR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGxHi5X1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGxHi5X1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C81A1F000FF;
	Wed,  9 Sep 2026 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788973196;
	bh=P6G4VNpwhpXlLhjVq/kdRQP+Q5U8JxjhnWl2ivHdL58=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HGxHi5X1wkkztSUobbCILvTlRsfOY7LnJ3KTOjPX0l7odb6o+J/uI1/R4WGZxpeRU
	 XPCYkK7HhyFgwz2d2/SvcVzlAvFJcpQ3+2z2lcc86ZH0TsW45xY00eBI8jNnRmLeWU
	 kA35nBILIMVHtdySHkZ8M+wNEKBFLCEWZS2JEgzNIM86ZS0lkdTEzIlEwKjEtBNr8x
	 YqZHodcEhWYOhxQA0+cTt52EuqjmEA8ls55FqclzZriy0oHpCymA8EPlYTETCzQwy3
	 U3HLWZTfIe9w80700dWV3ZI25HSrA4Zl0+9bkoouf7MiwmbmKnbtkSbQsUkeKB1DCC
	 /2blUit7vaygQ==
Message-ID: <d1ede193-bc56-46de-9d0d-fc037ddf835d@kernel.org>
Date: Wed, 9 Sep 2026 18:59:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: fix overbroad MMU notifiers for unshared PMDs
To: Li Zhe <lizhe.67@bytedance.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: muchun.song@linux.dev, osalvador@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, aiqi.i7@bytedance.com
References: <20260831091023.66581-1-lizhe.67@bytedance.com>
 <20260831173220.72ab28190a44a305dacf4d04@linux-foundation.org>
 <47a6817e-e98e-4a00-8e2c-6a66d15ddb37@kernel.org>
 <874e7793-877a-40a5-97ce-11dd5b9ee9ba@bytedance.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <874e7793-877a-40a5-97ce-11dd5b9ee9ba@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/8/26 09:09, Li Zhe wrote:
> On 9/7/26 11:29 PM, David Hildenbrand (Arm) wrote:
>> On 9/1/26 02:32, Andrew Morton wrote:
>>>
>>> Thanks.
>>>
>>> So a modest performance improvement?
>> Is that worth the complexity, though?
> 
> 
> That is a fair concern.

In you setup, are the page tables ever being shared? I suspect you just run a VM
with no other processes actually sharing the memory?

One idea would be to just remember whether any sharing ever happened for a
hugetlb file.

> 
> I tried to simplify the approach. Instead of computing the exact PUD
> sub-ranges that contain shared PMD tables, this version keeps the
> existing adjust_range_if_pmd_sharing_possible() logic unchanged and only
> adds an actual shared-PMD check as a gate before it.
> 
> So the behavior becomes:
> 
>    - if no shared PMD table is found, keep the notifier range unchanged;
>    - if any shared PMD table is found, fall back to the existing
>      conservative PUD-sized expansion.
> 
> This should still avoid the unnecessary 1G KVM invalidation for the
> common unshared-PMD case, while keeping the range expansion policy
> unchanged when a shared PMD is present.
> 
> The resulting diff would look like this:
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 816dde7..7a61fc3 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5355,10 +5357,12 @@ void __hugetlb_zap_begin(struct vm_area_struct *vma,
>       if (!vma->vm_file)    /* hugetlbfs_file_mmap error */
>           return;
> 
> -    adjust_range_if_pmd_sharing_possible(vma, start, end);
>       hugetlb_vma_lock_write(vma);
> -    if (vma->vm_file)
> +    if (vma->vm_file) {
>           i_mmap_lock_write(vma->vm_file->f_mapping);
> +        if (range_has_shared_pmd(vma, *start, *end))
> +            adjust_range_if_pmd_sharing_possible(vma, start, end);
> +    }
>   }
> 
>   void __hugetlb_zap_end(struct vm_area_struct *vma,
> @@ -5397,7 +5401,9 @@ void unmap_hugepage_range(struct vm_area_struct 
> *vma, unsigned long start,
> 
>       mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
>                   start, end);
> -    adjust_range_if_pmd_sharing_possible(vma, &range.start, &range.end);
> +    if (range_has_shared_pmd(vma, range.start, range.end))
> +        adjust_range_if_pmd_sharing_possible(vma, &range.start,
> +                             &range.end);
>       mmu_notifier_invalidate_range_start(&range);
>       tlb_gather_mmu(&tlb, vma->vm_mm);
> 
> @@ -6958,6 +6964,52 @@ void adjust_range_if_pmd_sharing_possible(struct 
> vm_area_struct *vma,
>           *end = ALIGN(*end, PUD_SIZE);
>   }
> 
> +static bool range_has_shared_pmd(struct vm_area_struct *vma,
> +                 unsigned long start, unsigned long end)
> +{
> +    unsigned long v_start = ALIGN(vma->vm_start, PUD_SIZE);
> +    unsigned long v_end = ALIGN_DOWN(vma->vm_end, PUD_SIZE);
> +    struct hstate *h = hstate_vma(vma);
> +    struct mm_struct *mm = vma->vm_mm;
> +    unsigned long address;
> +
> +    if (huge_page_size(h) != PMD_SIZE)
> +        return false;
> +
> +    /*
> +     * First apply the same cheap test as
> +     * adjust_range_if_pmd_sharing_possible(). Only the PUD-aligned
> +     * intersection can contain shared PMD tables.
> +     */
> +    if (!(vma->vm_flags & VM_MAYSHARE) || !(v_end > v_start) ||
> +        end <= v_start || start >= v_end)
> +        return false;
> +
> +    start = max(ALIGN_DOWN(start, PUD_SIZE), v_start);
> +    end = min(ALIGN(end, PUD_SIZE), v_end);
> +
> +    hugetlb_vma_assert_locked(vma);
> +    i_mmap_assert_write_locked(vma->vm_file->f_mapping);
> +
> +    for (address = start; address < end; address += PUD_SIZE) {
> +        pte_t *ptep;
> +        bool shared;
> +
> +        ptep = hugetlb_walk(vma, address, PMD_SIZE);
> +        if (!ptep)
> +            continue;
> +
> +        spin_lock(huge_pte_lockptr(h, mm, ptep));
> +        shared = ptdesc_pmd_is_shared(virt_to_ptdesc(ptep));
> +        spin_unlock(huge_pte_lockptr(h, mm, ptep));

I really don't like this piece of code to optimize something that is already
questionable in practice: overcommiting hugetlb folios for VMs.

Can you share some more details which mechanism ends up zapping hugetlb folios
for the VM?

If it's virtio-balloon's free-page-reporting, you should likely disable that for
the VM.

-- 
Cheers,

David
