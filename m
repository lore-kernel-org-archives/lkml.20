Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F25348F02C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992195; cv=none; b=YmrfQpfml4dGRCHhPPXwYAmjI6vKEWjUoWJZRP6BEYOXfEUZ3hVQe4C9pyEu3VqhBVDU42TzhQW0fLe2Fgch2zQZaF3km+bwHPOtmoGEiaU3RDqqXq0hWhKyl8shBaK/B/ZcUjLrE7D5WKj3WVt1o5rQqBBjTJUxQ3UOnO+YZ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992195; c=relaxed/simple;
	bh=UPEx1+0PEEqGCPL4zYv4gTCRpfm7n9hAyx6GaM1Wyvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ff4Xp9mAa9CH7479WtpRxQ/NKkRoifhYyikMmRuoMkIJII9MZtLfy5pqw4TY5P04oFgF5TgSzZS/Nx09mCC/kcV83M9It05xbOxP2wCX68pCf93No2agi1W11ZJHiW/T/L7ej5tURXuzhcli+FYOLWgcYdihvmmndlg6n9RdS4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2SadKpx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2SadKpx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8F71F000FF;
	Mon, 21 Sep 2026 12:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789992194;
	bh=Mpg5926h34Bs19sqds9l3xd0hZ+AgGPbZWYnHshxVF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W2SadKpxtPg29h2QNCnTPsl4SyrVbj7D+Oz6AkVxLdbBLix4P5XrDQ1/61SoZRycf
	 cnkBq1ZwvbvdlX5wpHNvZjPpMfyJr0V4rsxAatZ3WtDtnfbEvoSiDL9Td28tFOW82f
	 5IRbih1CL6ciudCmxnorWvNWE80UjyKsJ7C2NRK3M/7lV17UZ2xbQA7vIrOye76trs
	 ObdP2NiHPtrqHIvg4KNlfJ8TPEci1JH+iqHdyCJE82LDVmoZBpigwqgpzMbSe0x74J
	 5yDB8pmtBsOEfcgdLWLYyYahKovtwECZQiQMEqIuU0AIpJej4d2qdyMCVuV6nGqh39
	 UzMV0z0hV23NQ==
Date: Mon, 21 Sep 2026 13:03:07 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, usama.arif@linux.dev, kas@kernel.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] mm: disallow raw PFN mappings of huge/shared
 zeropage
Message-ID: <arEc39hzhJ75v_6D@gremlin>
References: <20260921054225.28537-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921054225.28537-1-lance.yang@linux.dev>

On Mon, Sep 21, 2026 at 01:42:25PM +0800, Lance Yang wrote:
> From: Lance Yang <lance.yang@linux.dev>
>
> Handling the huge/shared zeropage correctly in vmf_insert_pfn_pmd() and
> vmf_insert_pfn_prot() is more involved. We would need to check whether the
> VMA allows it and keep the mapping read-only, similar to the checks in
> vm_mixed_ok().
>
> No in-tree user needs that support, so reject these mappings with
> VM_FAULT_SIGBUS rather than complicate the code for now.
>
> Link: https://lore.kernel.org/all/20260917121010.60966-1-lance.yang@linux.dev/
> Suggested-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>

Seems sensible to me!

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> v1 -> v2:
>  - Reject the shared zeropage in vmf_insert_pfn_prot() (per Kiryl) - thanks!
>  - Explain the VMA validation and read-only requirements (per David) - thanks!
>  - Pick up Kiryl's Reviewed-by tag.
>  - https://lore.kernel.org/all/20260917121010.60966-1-lance.yang@linux.dev/
>
>  mm/huge_memory.c | 3 +++
>  mm/memory.c      | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 8aa2daba3739..1d4fe4452c98 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1728,6 +1728,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn,
>  						(VM_PFNMAP|VM_MIXEDMAP));
>  	BUG_ON((vma->vm_flags & VM_PFNMAP) && vma_is_cow_mapping(vma));
>
> +	if (unlikely(is_huge_zero_pfn(pfn)))
> +		return VM_FAULT_SIGBUS;
> +
>  	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
>
>  	return insert_pmd(vma, addr, vmf->pmd, fop, pgprot, write);
> diff --git a/mm/memory.c b/mm/memory.c
> index 926276d41920..7d821b110df0 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2860,6 +2860,9 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
>  	BUG_ON((vma->vm_flags & VM_PFNMAP) && vma_is_cow_mapping(vma));
>  	BUG_ON((vma->vm_flags & VM_MIXEDMAP) && pfn_valid(pfn));
>
> +	if (unlikely(is_zero_pfn(pfn)))
> +		return VM_FAULT_SIGBUS;
> +
>  	if (addr < vma->vm_start || addr >= vma->vm_end)
>  		return VM_FAULT_SIGBUS;
>
> --
> 2.49.0

--
Cheers, Lorenzo
