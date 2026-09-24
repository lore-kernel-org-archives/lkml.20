Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BED2673AA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261330; cv=none; b=RwwWbeNbK2x7TY2ZKAC9LmzJPgcbg70vwb6FV9CFEYoG9V8MfQ7S4ihl7me8lQ8ttJWZBVaOgjdKO1Pvht6wBK+P5p3YphUCl5k06SUBhwl2MKLNG/7pOKkvy/SWOHUpmSLIL2POqUxh4yvglpUfk1xNE0uYxmN1gKhPAH2lwnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261330; c=relaxed/simple;
	bh=arRcFbM2J6+AtpVKaoki3Ylxn5Q76Hl2oJubtqT/foE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njCR3HCDMcGJOk+c57bq/dYivm5yqtpYvAkb3X6Np2eq3/40oRVDsDVgPkTuVkVNJceSDhRNFzrCQT/Cev3kF/f3DgokX2B7QX0oVMTQSkmJNx0yY/fLoR5S11sEI2qIhgesp8Zv8kyyR36fkLIom6FmPyw7T1KJpZ+eKyXdNkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSBkP/4L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSBkP/4L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1897F1F000FF;
	Thu, 24 Sep 2026 14:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790261323;
	bh=3Jt4EEpI7zfY01he2CxmwKfXEUhv3Y/sSQk7vJfi7HA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZSBkP/4LvrZ78metoR/UbWOjYRCWgY14tvosTodt4mMPTUUi0UKQ0Xbh/m82yIw9n
	 /Nj6LJjb09A2xPuccqoLkxMyn9qkxZkdQzc6J8lsX1TbL69bHNDWXEO4W8yCoEjSC+
	 lXcvukPxCjIx8iVBWZPIMhyWVjYS2FsJDunqIZJHCB904P5dXatE60a65R3EJXM/PK
	 JvAWJU3Z+xFXnJ0xsPKd2nQBXuBe4G1bxi/H1zdyfF456T+mU1yBRaUwkNYL6NBujn
	 RYATiQu0zXhtiCaToJapXCXZdMTcnyWdeHnyH4Vqq5URr0M/XD8Fs3/0FicNNdGCXk
	 16sZVqZWwQSOA==
Date: Thu, 24 Sep 2026 15:48:41 +0100
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH RFC 2/8] mm, slab: introduce slab_debug=N
Message-ID: <arUx56ee_nkxYP_f@thinkstation>
References: <20260923-slub_tiny_rework-v1-0-a0e66d536eb5@kernel.org>
 <20260923-slub_tiny_rework-v1-2-a0e66d536eb5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-slub_tiny_rework-v1-2-a0e66d536eb5@kernel.org>

On Wed, Sep 23, 2026 at 05:45:07PM +0200, Vlastimil Babka (SUSE) wrote:
> Enabling slab_debug has the side-effect of disabling all percpu caching
> of objects (now via sheaves), which can be sometimes useful for saving
> memory for e.g. kdump kernels. To make this possible without the
> overhead (CPU or memory) of actual debugging options such as poisoning,
> introduce a No-op debug option that only forces the debugging slow paths
> and zero sheaf capacity.

Just to clarify, the intended behavior of slab_debug=- still
does not change, right? (the name "No-op" could be confusing here I
guess)

And My LLM flagged an issue here (that I reviewed)

Implementing it as debug flag has a few side effects:

  - pointer hashing will be disabled unless hash_pointers=always is
    specified. [+Cc: Kees]

  - Disable slab merging. Since this does not affect object metadata
    layout, this could be excluded.

-- 
Cheers,
Harry / Hyeonggon

> This will also allow reimplementing CONFIG_SLUB_TINY as a boot-time
> option.
> 
> While documenting the new N option, remove obsolete SLAB references from
> the F option description.
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---
>  Documentation/admin-guide/mm/slab.rst | 13 +++++++++++--
>  include/linux/slab.h                  |  5 ++++-
>  mm/slab.h                             |  2 +-
>  mm/slub.c                             |  3 +++
>  4 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/slab.rst b/Documentation/admin-guide/mm/slab.rst
> index 14429ab90611..0beeae71d472 100644
> --- a/Documentation/admin-guide/mm/slab.rst
> +++ b/Documentation/admin-guide/mm/slab.rst
> @@ -45,12 +45,12 @@ of the first "select slabs" blocks that matches the slab's name are applied.
>  
>  Possible debug options are::
>  
> -	F		Sanity checks on (enables SLAB_DEBUG_CONSISTENCY_CHECKS
> -			Sorry SLAB legacy issues)
> +	F		Sanity (slab consistency) checks on alloc and free
>  	Z		Red zoning
>  	P		Poisoning (object and padding)
>  	U		User tracking (free and alloc)
>  	T		Trace (please only use on single slabs)
> +	N		No-op (force debugging slowpaths without any checks)
>  	A		Enable failslab filter mark for the cache
>  	O		Switch debugging off for caches that would have
>  			caused higher minimum slab orders
> @@ -85,6 +85,15 @@ in low memory situations or if there's high fragmentation of memory.  To
>  
>  	slab_debug=O
>  
> +The No-op option can be useful to minimize slab memory overhead by forcing slab
> +debugging slowpaths, which disables percpu object caching. This reduces SMP
> +scalability significantly, but does not impose the extra cpu or memory overhead
> +of debugging options that actually perform checks. This can be useful for e.g.
> +kdump kernels where scalability is not a concern, but memory has to be
> +pre-reserved from the production kernel. So for a kdump kernel you can use::
> +
> +	slab_debug=N
> +
>  You can apply different options to different list of slab names, using blocks
>  of options. This will enable red zoning for dentry and user tracking for
>  kmalloc. All other slabs will not get any debugging enabled::
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index cda126def67a..ed949e8522be 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -35,6 +35,7 @@ enum _slab_flag_bits {
>  	_SLAB_PANIC,
>  	_SLAB_TYPESAFE_BY_RCU,
>  	_SLAB_TRACE,
> +	_SLAB_DEBUG_NOOP,
>  #ifdef CONFIG_DEBUG_OBJECTS
>  	_SLAB_DEBUG_OBJECTS,
>  #endif
> @@ -166,8 +167,10 @@ enum _slab_flag_bits {
>   * Note that SLAB_TYPESAFE_BY_RCU was originally named SLAB_DESTROY_BY_RCU.
>   */
>  #define SLAB_TYPESAFE_BY_RCU	__SLAB_FLAG_BIT(_SLAB_TYPESAFE_BY_RCU)
> -/* Trace allocations and frees */
> +/* DEBUG: Trace allocations and frees */
>  #define SLAB_TRACE		__SLAB_FLAG_BIT(_SLAB_TRACE)
> +/* DEBUG: Force the debug slowpaths without actually doing anything */
> +#define SLAB_DEBUG_NOOP		__SLAB_FLAG_BIT(_SLAB_DEBUG_NOOP)
>  
>  /* Flag to prevent checks on free */
>  #ifdef CONFIG_DEBUG_OBJECTS
> diff --git a/mm/slab.h b/mm/slab.h
> index 8fd6835e4235..77fcbf99b7b4 100644
> --- a/mm/slab.h
> +++ b/mm/slab.h
> @@ -490,7 +490,7 @@ void flush_rcu_sheaves_on_cache(struct kmem_cache *s);
>  			 SLAB_NO_USER_FLAGS | SLAB_KMALLOC | SLAB_NO_MERGE)
>  
>  #define SLAB_DEBUG_FLAGS (SLAB_RED_ZONE | SLAB_POISON | SLAB_STORE_USER | \
> -			  SLAB_TRACE | SLAB_CONSISTENCY_CHECKS)
> +			  SLAB_TRACE | SLAB_DEBUG_NOOP | SLAB_CONSISTENCY_CHECKS)
>  
>  #define SLAB_FLAGS_PERMITTED (SLAB_CORE_FLAGS | SLAB_DEBUG_FLAGS)
>  
> diff --git a/mm/slub.c b/mm/slub.c
> index a107a111c75e..bc593f0078c0 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -1897,6 +1897,9 @@ parse_slub_debug_flags(const char *str, slab_flags_t *flags, const char **slabs,
>  		case 't':
>  			*flags |= SLAB_TRACE;
>  			break;
> +		case 'n':
> +			*flags |= SLAB_DEBUG_NOOP;
> +			break;
>  		case 'a':
>  			*flags |= SLAB_FAILSLAB;
>  			break;
> 
> -- 
> 2.55.0

