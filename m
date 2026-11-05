Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891944;
	b=VZMyE7twZWZPCr16Il2rZ6z/Tt2VVnSAsZTFKRS/tYtjNueX7gKLjHFVifSuPBn8SUJA
	 TenIWaNbr6gbUu3lcYNof9L6ZXgsBhrx7Fhr7FtNZsRaOvExt0LZAt5kdTWq4WTr6QqXq
	 sxwFopq+e8z/oHjjsxhkq0nKS2L7/+RMIY8XQIkIyUnAc1aa+NUFQM65cCRUAppf5vVd5
	 lj0fjyyE0iBvic/zJJmgNBJxCTc1uE5ia354tBR3Uj7mrK6T/rRjBWSxyTNF/bZNM/JYM
	 /bYq2zbXfyRoPmyso+6N+LKPpeVem4sNeBG6wffrDgRBvrk9QlWFhvfA7HtVHNMfWWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891944;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pKiZ/1xYg1mZQ+x77zJSdGqKILLfHb0uloTlfc1un2E=;
	b=PUb5Q+5YhaIeRDMNUFIwsKOfm4i4stHyG+TuV72HgFabeTLB/QHEpnLmxZLauSlvjT/b
	 yhXJiKHtZSuHHj8EWo2kO2KM+BxhDZNGRNipT72Fi3luRTnazm+1yrdxA6qTcbJGIbcbt
	 hNeQgYb++aI01TiKvCa6YUT+XpoujSADiqNjASSyL/Ifh35D7uYcgmLILxg8EaSm7vqSt
	 gBHfCk1QjuODsj94wyKo+xEbR7uHogQ5Tyyj7D2WMe4CN0Ujil4R9ZEpy9j7f/CcjNMGI
	 Xe5Jo1Zyx9BMNFPXpEk2rzrF10AwSIBlyJ3dQ1yivT6uihKfC9dHN+oXDgfT+tub5fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IlwcYR8B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30029606D805
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IlwcYR8B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AA61F0093A;
	Thu,  5 Nov 2026 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793891943;
	bh=pKiZ/1xYg1mZQ+x77zJSdGqKILLfHb0uloTlfc1un2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IlwcYR8Bp6ILBV55zCVNHC4X/M5nI648eWO+3aRqrOSYFZr2gIkhNnVHlHDmX0vmh
	 KvK8m4Vsdu0VvAux0EyoBKYYLMG53jKFuue3+i2tkx0XYh5VNG9B8slKvR2K38dErT
	 NBThJe9I2fNLqwONdQr+Kmgb2ArT93XFw1z9nJySjDgbTluiZjInIkVw4n+2dgkDL9
	 /NGGP42LZhHDVy+4l2iTNB+Q8hId/+/Tb3Fml7Kb4kPRKbcqB3ouXvRCELSiV64GDg
	 P1zw+LAFWWg2z0uvcgU1CG9ALbOpLczIit/+8zd1xv5Sm0euiGP69ey1r+xrHZAq60
	 b4bxLpZwmQyYg==
Date: Thu, 5 Nov 2026 15:19:01 +0000
From: Harry Yoo <harry@kernel.org>
To: Hao Li <hao.li@linux.dev>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 3/8] mm, slab: rework KMALLOC_RECLAIM handling of
 SLUB_TINY
Message-ID: <auycUvCC2mL_EQ1r@thinkstation>
References: <20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org>
 <20261024-slub_tiny_rework-v2-3-bf1419ab5ffd@kernel.org>
 <auHcj2G78VkXy-Vz@fedora>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auHcj2G78VkXy-Vz@fedora>

On Wed, Oct 28, 2026 at 07:43:14PM +0800, Hao Li wrote:
> On Sat, Oct 24, 2026 at 09:07:25PM +0200, Vlastimil Babka (SUSE) wrote:
> > One (relatively minor) aspect of CONFIG_SLUB_TINY is the assumption that
> > letting reclaimable and non-reclaimable caches merge will save more
> > memory, which is more important on small systems than the page allocator
> > level fragmentation (where distinguishing reclaimable slabs should
> > help).
> > 
> > For now that has been achieved by #ifdefs that result in making the
> > SLAB_RECLAIM_ACCOUNT no-op and aliasing KMALLOC_RECLAIM to
> > KMALLOC_NORMAL on the enum values level.
> > 
> > With the goal of converting CONFIG_SLUB_TINY to a boot-time decision,
> > rework this so that SLAB_RECLAIM_ACCOUNT and KMALLOC_RECLAIM are
> > distinctly defined always. Now, creation of kmalloc-rcl caches is
> > avoided by assigning a pointer to the normal kmalloc cache on the
> > kmalloc_caches array level.
> > 
> > To prepare disconnecting of this boot-time decision (and the evaluation
> > of the need for kmalloc_no_objext) from CONFIG_SLUB_TINY, introduce a
> > slub_tiny_enabled variable that's initialized to the CONFIG_SLUB_TINY
> > state.
> > 
> > There is one minor functional change for CONFIG_SLUB_TINY=y. Since
> > SLAB_RECLAIM_ACCOUNT is not 0 anymore, caches that differ only in that
> > flag will stop being mergeable. If that turns out to have a noticeable
> > impact on memory footprint, we can adjust the merging decisions to
> > ignore SLAB_RECLAIM_ACCOUNT when slub_tiny_enabled is true.
> > 
> > Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> > ---
> >  include/linux/slab.h | 10 ----------
> >  mm/slab.h            |  5 +++--
> >  mm/slab_common.c     | 12 ++++++------
> >  mm/slub.c            |  2 ++
> 
> [...]
> 
> > diff --git a/mm/slab_common.c b/mm/slab_common.c
> > index 02dfe4351e8b..33e76a0c3084 100644
> > --- a/mm/slab_common.c
> > +++ b/mm/slab_common.c
> > @@ -1009,7 +1009,7 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
> >  	 * KMALLOC_NO_OBJ_EXT cache.
> >  	 */
> >  	if (!mem_cgroup_kmem_disabled()) {
> > -		if (type == KMALLOC_NORMAL && KMALLOC_RECLAIM != KMALLOC_NORMAL)
> > +		if (type == KMALLOC_NORMAL && !slab_tiny_enabled)
> 
> (While reviewing Harry's patch [1], I happened to notice a small inconsistency
> in the current code. Since these lines are being touched in this series, I
> figured I'd bring it up here, even though I haven't properly started reviewing
> this series yet :D)
> 
> IIUC, for both KMALLOC_NORMAL and KMALLOC_PARTITION_START + n, if gfp has
> __GFP_ACCOUNT set (and without __GFP_DMA/__GFP_RECLAIMABLE), the allocation is
> redirected to KMALLOC_CGROUP.

Right.

> This seems to mean that neither KMALLOC_NORMAL
> nor KMALLOC_PARTITION_START + n actually needs an objcg slot in obj_exts.

Right.

> Right now, KMALLOC_NORMAL already doesn't carry SLAB_MAY_ACCOUNT, but
> KMALLOC_PARTITION_START + n still does.

Ouch, good catch!

> Given that, would it make sense to
> change this line to something like:
> 
> if (type >= KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END &&
> 	!slab_tiny_enabled)

Maybe you could send a patch as it's a separate issue from the patchset?

> [1] https://lore.kernel.org/linux-mm/20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-0-096800aa3330@kernel.org/

-- 
Cheers,
Harry / Hyeonggon
