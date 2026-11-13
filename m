Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582407;
	b=0aqszF5ZJeqjsaVzbS78bO9DFfhOmRwXLvbDVS5ZKDJhp+AYy/GFxWMx731ikHmQwN4L
	 XuffsYQis/YVvdqHSecV++5O5deUFVN0vOmm3xMGzKLCFCECjW7qOJPglYS8QWf6xzDMK
	 KR5b2xXZL3+lZ/VwZETTmfPqklWrjeuF9sXIaV4SLH32XGN+aAPjp0IC9Ds/DbLrc/kzV
	 xn1FSQ57qFbPWdaQZljOIyig4OJAQGIgtiwYGIIXmc2H+K20zr/3fJtNkSf38pYgVD1QW
	 DnCGoxNsuuz3/3J+M7amijN9IaQ+VF9AFD94uN+QyX2kH12wyYa43l/3BW+FK4PnMWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582407;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=D8CAID1ghut0Mz9KCvy4wmmXQMXhDupoD4LdqfioSZU=;
	b=ab7f8CRkMDAmkBLifwBolKPJSXfhMm15aOy1DyikVlVjzigy0fwMVxT/55Vr7xVQgOmZ
	 VlaMNV9Fbxn/jcCTokmQOJN2MiEDEPY4H3mItKcQf3FSpFX8F5WYASs2zz5o9D5/GJv2L
	 +yCnsoJbVkxid2AAiEAvlzoJN7qwIwm7gbOKjn/R8EnqknSPzPrJ6q6dWuMMgK1A6tkE9
	 cQZSCkBHM8d6Dip1JiSperOH7EY2w5MO1ohTllOeAQdjdPTs6yIT1/mm4uro7UMfF2Uh+
	 P9ZoBQPVqXj7jgefFeH3EY6jM+efYHqvDychWajCqfycs7w0CWMlLbXFXqM+m+Ui1Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2qrb7Rp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0973606EB45
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2qrb7Rp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDF51F000C4;
	Fri, 13 Nov 2026 15:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794582407;
	bh=D8CAID1ghut0Mz9KCvy4wmmXQMXhDupoD4LdqfioSZU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=H2qrb7Rpd2r+cC4CaEtlaiTSlfIPhvlmkvqkSxsrfLBKEv87ZIbv5camVEplogWCH
	 4C1Fkwjrzi5iHrDnQ/ipXSSy4npS9M/dyFiKIAZhVZU93LufHbQWL4qYfY/NrcMwA2
	 HNhexJwbr5tR2/BY34bADOnB6Fxh5jUFZRIdW5uokP1/cXyBLOshfN1EGY+iYqBxeA
	 8UwsUQLbH9D84lSPYVny9RBnMaoiK1WOsIpbro6uhE0cRvxBkqmt8DXAJhWzTtSGHk
	 150BUC6aY0tAE1xYfuGOqomLuK/mNQqsOv63n+N911YEQ/qLiF4gFpO3b1LjoGM+wP
	 U6OPJu7ZDnpng==
Message-ID: <0825ce63-da12-41c5-956a-039080f53571@kernel.org>
Date: Fri, 13 Nov 2026 16:06:36 +0100
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
Subject: Re: [PATCH v2 4/4] mm/huge_memory: use the large-page PAT encoding
 for huge pfn mappings
To: Eliav Farber <farbere@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, William Kucharski <william.kucharski@linux.dev>,
 Vishal Moola <vishal.moola@gmail.com>, Alex Williamson <alex@shazbot.org>,
 Matthew Wilcox <willy@infradead.org>, Peter Xu <peterx@redhat.com>,
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261112051440.16140-1-farbere@amazon.com>
 <20261112051440.16140-5-farbere@amazon.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261112051440.16140-5-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/26 06:14, Eliav Farber wrote:
> insert_pmd() and insert_pud() build the entry from the pgprot that
> vmf_insert_pfn_pmd()/_pud() took from vma->vm_page_prot and passed
> through pfnmap_setup_cachemode_pfn(). That pgprot carries the PTE-level
> cache mode encoding, but x86 keeps the high PAT bit at bit 7 for a PTE
> (_PAGE_BIT_PAT) and at bit 12 for a PMD or PUD (_PAGE_BIT_PAT_LARGE),
> where bit 7 is _PAGE_PSE.
> 
> A memtype that needs that bit, write-through or write-protect, loses it:
> the cache mode index of the huge entry drops from 4-7 to 0-3. With the
> PAT slots Linux programs, write-through (slot 7) becomes UC (slot 3),
> and write-protect (slot 5) becomes write-combining (slot 1), which loses
> the write protection. The other x86 paths that build a large entry from
> a PTE pgprot convert it first, see populate_pmd() and populate_pud().
> 
> Convert in the two huge pfn paths. Add a generic pgprot_4k_2_large()
> that returns its argument unchanged, so that only architectures which
> encode the levels differently have to define it, and x86's existing
> definition is picked up.
> 
> The folio paths keep using vma->vm_page_prot as is. They map
> struct-page-backed memory, which x86 maps write-back.
> 
> Fixes: 5cad465d7fa6 ("mm: add vmf_insert_pfn_pmd()")
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v2: Corrected the second paragraph of the commit message. It said a
>     write-through range ends up write-back; with the PAT slots Linux
>     programs, write-through (slot 7) ends up UC (slot 3) and
>     write-protect (slot 5) ends up write-combining (slot 1).
>     Changed Fixes: from 6857be5fecae to 5cad465d7fa6 ("mm: add
>     vmf_insert_pfn_pmd()"), which is the commit that introduced the
>     unconverted pgprot. Both pointed out by Jose A. Perez de Azpillaga.
>     No code change.
> 
>  arch/x86/include/asm/pgtable_types.h | 2 ++
>  include/linux/pgtable.h              | 9 +++++++++
>  mm/huge_memory.c                     | 4 ++--
>  3 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
> index b1a669e775f4..b1ffd72e47ef 100644
> --- a/arch/x86/include/asm/pgtable_types.h
> +++ b/arch/x86/include/asm/pgtable_types.h
> @@ -497,6 +497,8 @@ static inline pgprotval_t protval_4k_2_large(pgprotval_t val)
>  	return (val & ~(_PAGE_PAT | _PAGE_PAT_LARGE)) |
>  		((val & _PAGE_PAT) << (_PAGE_BIT_PAT_LARGE - _PAGE_BIT_PAT));
>  }
> +
> +#define pgprot_4k_2_large pgprot_4k_2_large
>  static inline pgprot_t pgprot_4k_2_large(pgprot_t pgprot)
>  {
>  	return __pgprot(protval_4k_2_large(pgprot_val(pgprot)));
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 780fe849ff8b..112814d31f0c 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1787,6 +1787,15 @@ void arch_sync_kernel_mappings(unsigned long start, unsigned long end);
>  #define pgprot_mhp(prot)	(prot)
>  #endif
>  
> +/*
> + * Convert a pgprot built for a PTE so that it can be used in a PMD or PUD
> + * entry. Only needed on architectures that encode attributes differently
> + * between the levels; elsewhere the pgprot is used as is.
> + */
> +#ifndef pgprot_4k_2_large
> +#define pgprot_4k_2_large(prot)	(prot)
> +#endif
> +
>  #ifdef CONFIG_MMU
>  #ifndef pgprot_modify
>  #define pgprot_modify pgprot_modify
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 052c50dadc48..945d480c1512 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1675,7 +1675,7 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
>  			add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
>  		}
>  	} else {
> -		entry = pmd_mkhuge(pfn_pmd(fop.pfn, prot));
> +		entry = pmd_mkhuge(pfn_pmd(fop.pfn, pgprot_4k_2_large(prot)));

What on earth is 4k terminology doing in common code?! :)

-- 
Cheers,

David
