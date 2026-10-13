Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5007A3B892D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886459; cv=none; b=UTa13rQ+bhltXU2OBzjhkwYQxqHYkMNkcT4S3ypxG611ntUcsI6S6HrKNjM1c+WbCsY0Xt+r0QgLM+q9B77LZL2ZNJskZG+HSRtCgZ0l1CcHbto5D/vYRyjO9IVBwIC2E1XyaXqHNPfEsmoffmdyteE2mesymKt8QsG1Ecw+Kz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886459; c=relaxed/simple;
	bh=XrAio4RuX+aQifN3OHlbvWwk3vt2k0IZPWIK1IT/FX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBCtHrJ3OuSs57UbSxilm9kU8HJelmRguKLiC3/A+JUgAnRpD0kXrc3wnZ1uuFJ7XHLBbJCpToVKgYpd9S1N/9AFTgSUAgzNq+gw7ASdRwX1SjtVWdxqhn4oezPZ69w6/C7BXfxn93PbeUopqgql0lF4jBha1hjOodhhARMBP/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pyau+2JB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pyau+2JB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D801F000FF;
	Tue, 13 Oct 2026 10:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791886458;
	bh=9jaFSNsp/CFGLzl6alv0F7/TLQf1iiNaD/MVLusHMzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pyau+2JBZ47xLEI9AjYwCxEuWFUp6KtSyV6c8/8WT0N4NRCIgNIk3m2zUnq/UELQv
	 KjsUiMlNO+yxD3z4wT+gRyWqjce+x8opkjXeeo8cW7wqadbIJAS1NCiMIFQx8CO0Z5
	 ulJShIemgghxaodPh6CqWYG2YtFAtYtbLo2CmsABAEb9FGXc58la5w9O6mSKkENVo7
	 HibEtbFe6oqdn1TbWpZHHESHkgIE97Bon5u6fh4P61z17grF2aauuVX6tOMWrFEIyH
	 dkHLm0NUip3sgYNpBBeZOx3mFIkikn1/pa7ujFF0hf2ZOUCg7QGpg+ih6Ak0kR5zeY
	 UjgEuD53By39Q==
Date: Tue, 13 Oct 2026 13:14:10 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Tarun Sahu <tarunsahu@google.com>
Cc: dmatlack@google.com, Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] memblock: drop for_each_memblock_type() and open
 code its users
Message-ID: <as4EcgiBH5jjww42@kernel.org>
References: <20261008190828.3221718-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008190828.3221718-1-tarunsahu@google.com>

Hi Tarun,

Please for the next time add the cover-letter when sending more than one
patch.

On Thu, Oct 08, 2026 at 07:08:27PM +0000, Tarun Sahu wrote:
> for_each_memblock_type() always starts the iteration at index 0 and its
> body is a trivial 'for' loop, so it hides very little. It also gets in
> the way of iterating from an arbitrary index, which the next patch
> needs.
> 
> Remove the macro and open code its three users: memblock_add_range(),
> memblock_isolate_range() and memblock_dump(). While at it, move the
> region pointer into the loop body scope.
> 
> No functional change.
> 
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
> ---
>  mm/memblock.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index f5aaa38cfa31..59dda7d085f3 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -155,11 +155,6 @@ struct memblock_type physmem = {
>   */
>  static __refdata struct memblock_type *memblock_memory = &memblock.memory;
>  
> -#define for_each_memblock_type(i, memblock_type, rgn)			\
> -	for (i = 0, rgn = &memblock_type->regions[0];			\
> -	     i < memblock_type->cnt;					\
> -	     i++, rgn = &memblock_type->regions[i])
> -
>  #define memblock_dbg(fmt, ...)						\
>  	do {								\
>  		if (memblock_debug)					\
> @@ -615,7 +610,6 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>  	phys_addr_t obase = base;
>  	phys_addr_t end = base + memblock_cap_size(base, &size);
>  	int idx, nr_new, start_rgn = -1, end_rgn;
> -	struct memblock_region *rgn;
>  
>  	if (!size)
>  		return 0;
> @@ -651,7 +645,8 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>  	base = obase;
>  	nr_new = 0;
>  
> -	for_each_memblock_type(idx, type, rgn) {
> +	for (idx = 0; idx < type->cnt; idx++) {
> +		struct memblock_region *rgn = &type->regions[idx];
>  		phys_addr_t rbase = rgn->base;
>  		phys_addr_t rend = rbase + rgn->size;
>  
> @@ -815,7 +810,6 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>  {
>  	phys_addr_t end = base + memblock_cap_size(base, &size);
>  	int idx;
> -	struct memblock_region *rgn;
>  
>  	*start_rgn = *end_rgn = 0;
>  
> @@ -827,7 +821,8 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>  		if (memblock_double_array(type, base, size) < 0)
>  			return -ENOMEM;
>  
> -	for_each_memblock_type(idx, type, rgn) {
> +	for (idx = 0; idx < type->cnt; idx++) {
> +		struct memblock_region *rgn = &type->regions[idx];
>  		phys_addr_t rbase = rgn->base;
>  		phys_addr_t rend = rbase + rgn->size;
>  
> @@ -2194,11 +2189,11 @@ static void __init_memblock memblock_dump(struct memblock_type *type)
>  	phys_addr_t base, end, size;
>  	enum memblock_flags flags;
>  	int idx;
> -	struct memblock_region *rgn;
>  
>  	pr_info(" %s.cnt  = 0x%lx\n", type->name, type->cnt);
>  
> -	for_each_memblock_type(idx, type, rgn) {
> +	for (idx = 0; idx < type->cnt; idx++) {
> +		struct memblock_region *rgn = &type->regions[idx];
>  		char nid_buf[32] = "";
>  
>  		base = rgn->base;
> -- 
> 2.56.0.385.gd3acb90ef8-goog
> 

-- 
Sincerely yours,
Mike.
