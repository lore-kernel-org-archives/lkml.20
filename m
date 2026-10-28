Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196201;
	b=0Rbm94lSoZ2uWviWoIn/oJ5bXxeDO4dBVPBfzBouCJE/8sQ80l77gbCRq02BoyAgBUv9
	 JKIRBqMjMitL7NV58o6z/KRqdYfAmqiK3w5jB1bwiL8oKOr9Axg2w3mQoqqfMPo7TKtby
	 kU5DESfrk836Q7mgR0XTJJ3RShvc/xPvHIuPccE/igfiRDdBOebAMFKDhfcCDsfp/NU0L
	 n/+eYjHGqrtXm9p/7AGaAWMe1oOeSsC86gn2HDL7akhNfjrispd/n1JQo1cwZ25ry+6J9
	 CqbcSxWRho9TyEOFKo0QXXGQONbCocVPhSAh4I4jV/jiTkkxwWHP8QPXsU03Te26b4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196201;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=IMQLUPm/67qUcr0JLF2vtMs9Hk5VtkMsbxTot7/xi9Q=;
	b=PJOh56XubLkI4TmDzvRUMMMkn7S5Jx6/nd63Sytmgz2s+c2MisOymM6uyTKmJ0GEC1o/
	 4o+psr3O/L+wHl0XAUmJL4iaeKxPy6nrger5EFBKJ0lujcAW9F/UIQdOHrroUU5ovNDCS
	 47yuJf6K4GWkIAvkWI5vd/9hTZcdgahlmwz3fKSphGdrjAD6RmA+CKR8Di1CYb659sRon
	 6ngMfDooIMVhXjuhO2q0Fwc9EP4/1DHf1rlq+CcAGCW0FeWL00+ZpOMPicPTIHvgPbIYE
	 mrlpKPqPufUIfiSsJ3phXgOohhGahlASH//LkaVzXjIUlET8WOeqRPAXRPVC5rCj9ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hL/RI1Rv";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE966606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hL/RI1Rv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53601F01825;
	Wed, 28 Oct 2026 14:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793196200;
	bh=IMQLUPm/67qUcr0JLF2vtMs9Hk5VtkMsbxTot7/xi9Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=hL/RI1RvRG8d7lA0UDIveNAv1zkuZqXJNVB8amjJb/jpad9fkMhvPK3gdmGxt6p0s
	 jpHSUDbxDVVMABGR7O34IDXeDnf0zchzM7T/AiyZx3BRtvVBjunyRrNVBhzd4WvRjr
	 4FNBLU7GFbWLSrXG19FFFTsDNLCtAoUxRsIM3Pg0oAYox/OyI528kRnOpd4KWYGi7e
	 Mae0FOnR+jP0IYktREnfGvCJiwjmeAnFAsIPgn3pCJqkmSgE6U2q1Fj44HazvtTkVO
	 fwrhanAniFFdYTIa5UO/Q91pJuoFzm3ck+WoNob3zkYnMOfzhOeoWNFK8REMSKTXwa
	 7yYFxyCzJTZ3g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: <akpm@linux-foundation.org>,  <david@kernel.org>,  <ljs@kernel.org>,
  <liam@infradead.org>,  <vbabka@kernel.org>,  <rppt@kernel.org>,
  <surenb@google.com>,  <mhocko@suse.com>,  <baoquan.he@linux.dev>,
  <pasha.tatashin@soleen.com>,  <pratyush@kernel.org>,  <graf@amazon.com>,
  <linux-mm@kvack.org>,  <linux-kernel@vger.kernel.org>,
  <kexec@lists.infradead.org>
Subject: Re: [RFC PATCH 1/2] kexec: do not place the next kernel in a
 fixed-address CMA area
In-Reply-To: <20261014145731.3431527-2-radhey.shyam.pandey@amd.com> (Radhey
	Shyam Pandey's message of "Wed, 14 Oct 2026 20:27:30 +0530")
References: <20261014145731.3431527-1-radhey.shyam.pandey@amd.com>
	<20261014145731.3431527-2-radhey.shyam.pandey@amd.com>
Date: Wed, 28 Oct 2026 15:03:16 +0100
Message-ID: <2vxzh5i5orbv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Oct 14 2026, Radhey Shyam Pandey wrote:

> kexec_alloc_contig() picks the destination of the next kernel out of the
> default CMA area, and the next kernel then runs from there in place
> instead of being copied out. That is only safe if the area will not exist
> at the same address in the kernel being loaded.
>
> For an area whose base came from the device tree, it will. The loaded
> kernel parses the same description, declares the range it is executing
> from as a shared-dma-pool, and cma_activate_area() releases the pages
> holding its own image to the page allocator.
>
> Distinguish the two cases. An area placed by cma_declare_contiguous_nid()
> without a fixed base lands wherever this kernel found room, and the next
> kernel repeats that search against its own memblock state, so it cannot
> collide. Record the difference as CMA_FIXED_BASE and refuse to use such
> an area for the payload, which leaves kexec_locate_mem_hole() to fall
> back to the memblock hole search as it did before CMA placement existed.
>
> This is what makes the KEXEC_FILE_NO_CMA flag unnecessary on platforms
> that describe their CMA pools in the device tree.
>
> Tested on a AMD Versal AI Edge Series Gen 2 VEK385 Evaluation Kit whose
> device tree declares three CMA pools, the first of which is
> linux,cma-default:
>
>   cma_reserved@800000000     4 GiB at 0x800000000    (default)
>   cma_reserved@50000000000   6 GiB at 0x50000000000
>   cma_reserved@60000000000   4 GiB at 0x60000000000
>
> All three have a fixed base, so kexec_alloc_contig() declines the default
> area and kexec_locate_mem_hole() falls through to the memblock search,
> which places the Image segment at 0x9c00000 size 0x1de0000. The kernel
> that boots from it reports its image as [0x09c00000-0x0b9e0000] and
> 14680064K cma-reserved, i.e. all three pools still present and none of
> them overlapping the running kernel.
>
> Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  include/linux/cma.h | 10 ++++++++++
>  kernel/kexec_file.c | 12 ++++++++++++
>  mm/cma.c            | 16 ++++++++++++++++
>  mm/cma.h            |  2 ++
>  4 files changed, 40 insertions(+)
>
> diff --git a/include/linux/cma.h b/include/linux/cma.h
> index 8555d38a97b1..2fe66377e5d3 100644
> --- a/include/linux/cma.h
> +++ b/include/linux/cma.h
> @@ -61,4 +61,14 @@ extern int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data)
>  extern bool cma_intersects(struct cma *cma, unsigned long start, unsigned long end);
>  
>  extern void cma_reserve_pages_on_error(struct cma *cma);
> +
> +#ifdef CONFIG_CMA
> +bool cma_has_fixed_base(const struct cma *cma);
> +#else
> +static inline bool cma_has_fixed_base(const struct cma *cma)
> +{
> +	return false;
> +}
> +#endif
> +
>  #endif
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index b668ce8d68ee..10e770bcee0b 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -28,6 +28,7 @@
>  #include <linux/vmalloc.h>
>  #include <linux/dma-map-ops.h>
>  #include <linux/kexec_handover.h>
> +#include <linux/cma.h>
>  #include "kexec_internal.h"
>  
>  #ifdef CONFIG_KEXEC_SIG
> @@ -691,6 +692,7 @@ static int kexec_walk_resources(struct kexec_buf *kbuf,
>  static int kexec_alloc_contig(struct kexec_buf *kbuf)
>  {
>  	size_t nr_pages = kbuf->memsz >> PAGE_SHIFT;
> +	struct cma *cma;
>  	unsigned long mem;
>  	struct page *p;
>  
> @@ -702,6 +704,16 @@ static int kexec_alloc_contig(struct kexec_buf *kbuf)
>  	if (kbuf->image->type == KEXEC_TYPE_CRASH)
>  		return -EPERM;
>  
> +	/*
> +	 * The next kernel runs from here rather than being copied out, so it
> +	 * would declare this area again from the same description and release
> +	 * the pages holding its own image to the page allocator. Only an area
> +	 * this kernel placed itself is safe to use.
> +	 */
> +	cma = dev_get_cma_area(NULL);
> +	if (!cma || cma_has_fixed_base(cma))
> +		return -EOPNOTSUPP;
> +
>  	p = dma_alloc_from_contiguous(NULL, nr_pages, get_order(kbuf->buf_align), true);
>  	if (!p)
>  		return -ENOMEM;
> diff --git a/mm/cma.c b/mm/cma.c
> index a10ea37a261d..1f4d3d48a3bb 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -55,6 +55,19 @@ const char *cma_get_name(const struct cma *cma)
>  }
>  EXPORT_SYMBOL_GPL(cma_get_name);
>  
> +/**
> + * cma_has_fixed_base() - was the area placed at an address it did not choose?
> + * @cma: Contiguous memory region
> + *
> + * Such an area is described outside the kernel, typically by a device tree
> + * reserved-memory node, and so lands at the same address in every kernel
> + * booted with that description.
> + */
> +bool cma_has_fixed_base(const struct cma *cma)
> +{
> +	return test_bit(CMA_FIXED_BASE, &cma->flags);
> +}
> +
>  static unsigned long cma_bitmap_aligned_mask(const struct cma *cma,
>  					     unsigned int align_order)
>  {
> @@ -304,6 +317,7 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
>  	cma->ranges[0].count = cma->count;
>  	cma->nranges = 1;
>  	cma->nid = NUMA_NO_NODE;
> +	set_bit(CMA_FIXED_BASE, &cma->flags);
>  
>  	*res_cma = cma;
>  
> @@ -517,6 +531,8 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
>  	}
>  
>  	(*res_cma)->nid = nid;
> +	if (!fixed)
> +		clear_bit(CMA_FIXED_BASE, &(*res_cma)->flags);

Nit: This reads a bit odd. cma_init_reserved_mem() sets the fixed base
and then you clear it later. Wouldn't it be better to just pass the
fixed boolean to cma_init_reserved_mem()?

With that fixed,

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

>  	*basep = base;
>  
>  	return 0;
> diff --git a/mm/cma.h b/mm/cma.h
> index 68e574b0f951..1bab24033284 100644
> --- a/mm/cma.h
> +++ b/mm/cma.h
> @@ -80,6 +80,8 @@ enum cma_flags {
>  	CMA_ZONES_VALID,
>  	CMA_ZONES_INVALID,
>  	CMA_ACTIVATED,
> +	/* Base address was dictated by the caller, not picked by CMA. */
> +	CMA_FIXED_BASE,
>  };
>  
>  extern struct cma cma_areas[MAX_CMA_AREAS];

-- 
Regards,
Pratyush Yadav
