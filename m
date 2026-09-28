Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA8E4C900E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610733; cv=none; b=NUW07u84+3yFVgJDWDO2/KYuMnYIeVk3l8tycZ19ByOGWMI9Vac8yNxZLDo5K65FBhQSqTA26J9eotW4YdD93YgaOVcSVWRByWfYknYmuxe23ouYNsxuaZf+QTGzayk28sXd95Eo5yHWnQLuPzMDjIKoWL0OQQXW+Skm+mmnzg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610733; c=relaxed/simple;
	bh=g5Yjq1RDYJwlJdZJWUNyqyb5tcGXaE5WgCWFOiz4Trw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHhkMji9sSov1Zv/zmWdg8sm5fCNlcE1PBGzL+lgRVySIEOInSam2EgoQsTXNxve1nhsm4vcvlNTlbpaVv26W3YYHuk3vMihaLAb4uI6G41ELDdw8BhS5+E6xBFIkFGsKEBRJnBzSc3i9tUfve3JsYms+NFmMWIpkD8iYYUszi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWW6e5TY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWW6e5TY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265041F000FF;
	Mon, 28 Sep 2026 15:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790610730;
	bh=CA9+Khdny5X3PvtzSKfpyt/0TRJuMd+3QPdfNjaitb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FWW6e5TYlYkD9F17qJd9niI1OEU1NX5IWz/mgl2P5fYxu1kSc1pYY8M6RmG2XOmvd
	 ETFLUYunCFlwk7anJ1lZ2lJSwvPWjMIMBv8Dh9Ybcw6rf1MaOv2aFOxr6RTzlwsbhl
	 b+7d/Xq/tAObx9d7TbdbzHp515pzww5pR+JvjSNPNhNfZ3/DQ0pCbULKm8Xg9/LNTW
	 9du8kxBTLg0qJ3t1tkZCYFd0r/WnOm3Lf/D8RYE5GDx1YNCmDY99gMRK26nbGRHs50
	 DitO1BDi1d2UGt/QB4vbtziHMCgiXP8MgbaOAZCb3VPRv9zXZuQ7Qi9PfyS/54oO5l
	 j+tv6Mg87tfaw==
Date: Mon, 28 Sep 2026 16:52:08 +0100
From: Harry Yoo <harry@kernel.org>
To: Seongjun Hong <hsj0512@snu.ac.kr>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] tools/mm/slabinfo: refactor slab attribute reading
Message-ID: <arqIzSPQVDky8jqc@thinkstation>
References: <20260927-tools-mm-update-slabinfo-v1-0-a4ea0d4dc136@snu.ac.kr>
 <20260927-tools-mm-update-slabinfo-v1-1-a4ea0d4dc136@snu.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927-tools-mm-update-slabinfo-v1-1-a4ea0d4dc136@snu.ac.kr>

Hi Seongjun, thanks for working on tools/mm/slabinfo improvements!
My comments inlined below.

On Sun, Sep 27, 2026 at 05:57:27AM +0000, Seongjun Hong wrote:
> The fields of struct slabinfo were mixed with deprecated sysfs files,
> which looks complicated. Organize every field of struct slabinfo by
> config option and the attribute order in mm/slub.c's slab_attrs[]. Because
> slabinfo should be able to run on previous kernel releases, leave the
> deprecated members for this time.
>
> read_slab_dir() had ~50 lines of attribute reads inlined. Move them to a
> new fill_slabinfo() helper so that directory walk and per-cache
> attribute reading are separated.
> 
> Fold get_obj_and_str() and decode_numa_list() into get_obj_and_decode()
> to avoid unnecessary strdup() and leave only one member assignment in
> fill_slabinfo() for each sysfs file.
> 
> Make broken statements into a single line for better readibility.
> 
> Remove alias field from struct slabinfo because it is initialized to 0
> and never updated. The only usage of this field "if (slab->alias)" is dead.

Would you please separate this patch into multiple patches?
It's hard to review when multiple refactorings are done in a single
patch.

> No functional change intended.
> 
> Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
> ---
>
>  tools/mm/slabinfo.c | 245 ++++++++++++++++++++++++++++------------------------
>  1 file changed, 131 insertions(+), 114 deletions(-)
> 
> diff --git a/tools/mm/slabinfo.c b/tools/mm/slabinfo.c
> index 48d1ee8b0e81..84359d628f2e 100644
> --- a/tools/mm/slabinfo.c
> +++ b/tools/mm/slabinfo.c
> @@ -27,25 +27,49 @@
>  
>  struct slabinfo {
>  	char *name;
> -	int alias;
>  	int refs;
> -	int aliases, align, cache_dma, cpu_slabs, destroy_by_rcu;
> -	unsigned int hwcache_align, object_size, objs_per_slab;
> -	unsigned int sanity_checks, slab_size, store_user, trace;
> -	int order, poison, reclaim_account, red_zone;
> -	unsigned long partial, objects, slabs, objects_partial, total_objects;
> +	int numa_slabs[MAX_NODES];
> +	int numa_partial[MAX_NODES];
> +
> +	unsigned int slab_size, object_size;
> +	unsigned int objs_per_slab, order;
> +	unsigned long objects_partial, partial;
> +	int aliases;
> +	unsigned int align;
> +	int hwcache_align;
> +	int reclaim_account;
> +	int destroy_by_rcu;
> +
> +	/* CONFIG_SLUB_DEBUG */
> +	unsigned long total_objects, objects, slabs;
> +	int sanity_checks, trace, red_zone, poison, store_user;
> +
> +	/* CONFIG_ZONE_DMA */
> +	int cache_dma;
> +
> +	/* CONFIG_SLUB_STATS */
>  	unsigned long alloc_fastpath, alloc_slowpath;
>  	unsigned long free_fastpath, free_slowpath;
> -	unsigned long free_frozen, free_add_partial, free_remove_partial;
> -	unsigned long alloc_from_partial, alloc_slab, free_slab, alloc_refill;
> -	unsigned long cpuslab_flush, deactivate_full, deactivate_empty;
> +	unsigned long free_add_partial, free_remove_partial;
> +	unsigned long alloc_slab, alloc_node_mismatch, free_slab;
> +	unsigned long order_fallback;
> +	unsigned long cmpxchg_double_fail;
> +
> +	/*
> +	 * Deprecated files:
> +	 * No STAT_ATTR()/SLAB_ATTR() for these exists in mm/slub.c's
> +	 * slab_attrs[] anymore.

This part of the comment looks fine, but

> Although cpu_slabs remains as a file,
> +	 * it is also outdated and always prints 0. Keep these for backward
> +	 * compatibility, but they should be removed later.

This doesn't seem useful information to put in the comment.

We were able to remove some files when
Documentation/ABI/testing/sysfs-kernel-slab says
"Available when CONFIG_SLUB_STATS is enabled", because that implies that
those files may not exist. 

But it's not the case for files like cpu_slabs,
and I don't think we're going to remove them in the future.

Probably simply say something like

"Deprecated files: the kernel does not create those files anymore or
 always prints hardecoded "0" since they are deprecated" ?

> +	 */
> +	int cpu_slabs;
> +	unsigned long free_frozen;
>  	unsigned long deactivate_to_head, deactivate_to_tail;
> -	unsigned long deactivate_remote_frees, order_fallback;
> -	unsigned long cmpxchg_double_cpu_fail, cmpxchg_double_fail;
> -	unsigned long alloc_node_mismatch, deactivate_bypass;
> +	unsigned long alloc_from_partial, alloc_refill;
> +	unsigned long cpuslab_flush, deactivate_full, deactivate_empty;
> +	unsigned long deactivate_remote_frees, deactivate_bypass;
> +	unsigned long cmpxchg_double_cpu_fail;
>  	unsigned long cpu_partial_alloc, cpu_partial_free;
> -	int numa[MAX_NODES];
> -	int numa_partial[MAX_NODES];
>  } slabinfo[MAX_SLABS];

-- 
Cheers,
Harry / Hyeonggon
