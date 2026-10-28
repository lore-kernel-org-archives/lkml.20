Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187804;
	b=PsWI/qjgMRi4Ae3u5H8k2aP2HCqAd3Woy5Etb7fMS3tUFUuCi4wsl96jcSvSQi1n4InW
	 iiAa+ltqAUHEKr5eMHucYp3dZ1cCD+KfuPuedtIf0PDNi6Z5LrWGOj4s3wu4orcudUpQI
	 eTOLv3RZBTFZbmRLvNATB6le2DjzgVnMHrJfB7NAEInZ5wIWiY/BbXZF6G3OwaK6IZMLR
	 IFT5zCNPg1+o9FxJ6d2+RR98E2zyj+VQZqzlOPkbspWBeIN3LE854NOQM5/v1aficA7uE
	 AhLmKxCdyrvumCLiLjlKbRW4beNNAIjEpfTkiJWvn5cwqEe7dRf6Ysd+300BWg/eTUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187804;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mfCH5siTslprbVWbzonh++7TcYX9RLbSGXWmsSgr/V8=;
	b=00SFHk9jkVBaBwVGubdOfheQ2QoB936Q+tdny5Cs96WfnV5aIB0ZsirxAxJUUccaXGvW
	 cxRE1i2nJuEoMvUe1D6KwNcd/rTuWpGLh5j/uKTzg3MIeAe0lsFJIgZjcUodv/p6QdWUf
	 SCssAaWzGKR57iw/+UkkRmy7BQcvoF8t2UjqVYwW2amSiLEjI2o2+mPizGwlEOx1I1Xws
	 pBczlPAPt7lUf5Q8+QP1KPwPxgqa9lqWaopv4XODWmfZ7p1WxaFepbWqYYmNK0qEFaQ+t
	 kArka9xydqIfk6Ed91EKLPVEX5gJAPV39XGav1afloJNGAQG+soTq7NNCfloYjC3MrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WmBtg+SB;
	arc=none smtp.remote-ip=95.215.58.89
Received: from mta1.migadu.com (out-89.mta1.migadu.com [95.215.58.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCC0606A336
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFCC0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WmBtg+SB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tonu0mtS36f03NgUUNtAYyjNYq0EXBIuxH78yC50xRg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793187801; v=1; x=1793792601;
 b=WmBtg+SBjjk8MGu00t8CZ+tPsnjEYM+ILnAEpn4VKpWG8GHU/Mj5NavKSaZo+Ul6G3P27fEn
 dfBIOV4hDK8NOCU5hZPJt4n01l3SUp/Usn3cBHPeH2QMzArmyU4I44sohrfjVyuSjcChhEnRzxl
 x1Q3kJ++k9r56JTS6qEtmq7Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ad9f9173b3de5ee0;
	Wed, 28 Oct 2026 11:43:21 +0000
X-Mizu-Trace-ID: ad9f9173b3de5ee0
X-Migadu-Flow: FLOW_OUT
Date: Wed, 28 Oct 2026 19:43:14 +0800
From: Hao Li <hao.li@linux.dev>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Harry Yoo <harry@kernel.org>
Cc: Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 3/8] mm, slab: rework KMALLOC_RECLAIM handling of
 SLUB_TINY
Message-ID: <auHcj2G78VkXy-Vz@fedora>
References: <20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org>
 <20261024-slub_tiny_rework-v2-3-bf1419ab5ffd@kernel.org>
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
In-Reply-To: <20261024-slub_tiny_rework-v2-3-bf1419ab5ffd@kernel.org>

On Sat, Oct 24, 2026 at 09:07:25PM +0200, Vlastimil Babka (SUSE) wrote:
> One (relatively minor) aspect of CONFIG_SLUB_TINY is the assumption that
> letting reclaimable and non-reclaimable caches merge will save more
> memory, which is more important on small systems than the page allocator
> level fragmentation (where distinguishing reclaimable slabs should
> help).
> 
> For now that has been achieved by #ifdefs that result in making the
> SLAB_RECLAIM_ACCOUNT no-op and aliasing KMALLOC_RECLAIM to
> KMALLOC_NORMAL on the enum values level.
> 
> With the goal of converting CONFIG_SLUB_TINY to a boot-time decision,
> rework this so that SLAB_RECLAIM_ACCOUNT and KMALLOC_RECLAIM are
> distinctly defined always. Now, creation of kmalloc-rcl caches is
> avoided by assigning a pointer to the normal kmalloc cache on the
> kmalloc_caches array level.
> 
> To prepare disconnecting of this boot-time decision (and the evaluation
> of the need for kmalloc_no_objext) from CONFIG_SLUB_TINY, introduce a
> slub_tiny_enabled variable that's initialized to the CONFIG_SLUB_TINY
> state.
> 
> There is one minor functional change for CONFIG_SLUB_TINY=y. Since
> SLAB_RECLAIM_ACCOUNT is not 0 anymore, caches that differ only in that
> flag will stop being mergeable. If that turns out to have a noticeable
> impact on memory footprint, we can adjust the merging decisions to
> ignore SLAB_RECLAIM_ACCOUNT when slub_tiny_enabled is true.
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---
>  include/linux/slab.h | 10 ----------
>  mm/slab.h            |  5 +++--
>  mm/slab_common.c     | 12 ++++++------
>  mm/slub.c            |  2 ++

[...]

> diff --git a/mm/slab_common.c b/mm/slab_common.c
> index 02dfe4351e8b..33e76a0c3084 100644
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -835,11 +835,7 @@ EXPORT_SYMBOL(kmalloc_size_roundup);
>  #define KMALLOC_CGROUP_NAME(sz)
>  #endif
>  
> -#ifndef CONFIG_SLUB_TINY
>  #define KMALLOC_RCL_NAME(sz)	.name[KMALLOC_RECLAIM] = "kmalloc-rcl-" #sz,
> -#else
> -#define KMALLOC_RCL_NAME(sz)
> -#endif
>  
>  #ifdef CONFIG_KMALLOC_PARTITION_CACHES
>  #define __KMALLOC_PARTITION_CONCAT(a, b) a ## b
> @@ -976,7 +972,11 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
>  	unsigned int aligned_size = kmalloc_info[idx].size;
>  	int aligned_idx = idx;
>  
> -	if ((KMALLOC_RECLAIM != KMALLOC_NORMAL) && (type == KMALLOC_RECLAIM)) {
> +	if (type == KMALLOC_RECLAIM) {
> +		if (slab_tiny_enabled) {
> +			kmalloc_caches[type][idx] = kmalloc_caches[KMALLOC_NORMAL][idx];
> +			return;
> +		}
>  		flags |= SLAB_RECLAIM_ACCOUNT;
>  	} else if (IS_ENABLED(CONFIG_MEMCG) && (type == KMALLOC_CGROUP)) {
>  		if (mem_cgroup_kmem_disabled()) {
> @@ -1009,7 +1009,7 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
>  	 * KMALLOC_NO_OBJ_EXT cache.
>  	 */
>  	if (!mem_cgroup_kmem_disabled()) {
> -		if (type == KMALLOC_NORMAL && KMALLOC_RECLAIM != KMALLOC_NORMAL)
> +		if (type == KMALLOC_NORMAL && !slab_tiny_enabled)

(While reviewing Harry's patch [1], I happened to notice a small inconsistency
in the current code. Since these lines are being touched in this series, I
figured I'd bring it up here, even though I haven't properly started reviewing
this series yet :D)

IIUC, for both KMALLOC_NORMAL and KMALLOC_PARTITION_START + n, if gfp has
__GFP_ACCOUNT set (and without __GFP_DMA/__GFP_RECLAIMABLE), the allocation is
redirected to KMALLOC_CGROUP. This seems to mean that neither KMALLOC_NORMAL
nor KMALLOC_PARTITION_START + n actually needs an objcg slot in obj_exts.

Right now, KMALLOC_NORMAL already doesn't carry SLAB_MAY_ACCOUNT, but
KMALLOC_PARTITION_START + n still does. Given that, would it make sense to
change this line to something like:

if (type >= KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END &&
	!slab_tiny_enabled)

[1] https://lore.kernel.org/linux-mm/20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-0-096800aa3330@kernel.org/

>  			flags |= SLAB_NO_MERGE;
>  		else if (!(flags & SLAB_NO_OBJ_EXT))
>  			flags |= SLAB_MAY_ACCOUNT;
> diff --git a/mm/slub.c b/mm/slub.c
> index 51daf361c601..a3ee1bdf0eb3 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -219,6 +219,8 @@ DEFINE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT,
>  			slab_obj_ext_has_codetag_key);
>  #endif
>  
> +bool slab_tiny_enabled __read_mostly = IS_ENABLED(CONFIG_SLUB_TINY);
> +
>  /* Structure holding extra parameters for slab allocations */
>  struct slab_alloc_context {
>  	unsigned long caller_addr;
> 
> -- 
> 2.56.0
> 
