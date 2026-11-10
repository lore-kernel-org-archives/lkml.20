Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319964;
	b=wuauXq3u/VsF33WMAe7B4RgZheMjqZ8/3eNEVJxPeIHbofWAdVnNNv3lS5QjEArm9+Ix
	 jbVd9csXCJBqqfGzLitVRHxLmbnyd7l8zIcDiqLZAu6Mx08Ct+hCr1ePUBTNQeALOlFap
	 OWbVk40eTcDXd+qgAC9+X4lqlmwOwvXOrWjEEhX+u5LmxoJKxer6VOfWZGacnnJwD3Zim
	 hotqOV6UjVP4K2b3aoWsFq/pii60fXdtuivNFfk64hOuNJKQW4INhoLz7QbX6g0iMd1Jo
	 ChaSWATTFXR44gkuHpxzCbeQEyHVYWEHWhzJk2m50GaEiB1I2+GUXQa53FdIjZhItKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319964;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=m+V15z8m7UdvbBzbEX/x0QkH/lxGlqnHfdKeJrvJ+5c=;
	b=xeY770x7YeRaxpW1j2AzzykaXnskYRwWq4Mpzpq0bpdAk2Tl6EUVVcuERs3+9a6r6X/O
	 GN/DYzK6tn1p4Y+giraI7RqcjE+oK4xR/w0zVW5ijEysXf6ShMGNOj5V4Ui1IGQPANS26
	 zzveKaA3x7O8l/9XveNtK10/QpX6pPVEafVong7KzrF4YuyrA0aMdci14pfxp+iQGZWAg
	 RObyRnL8OZ+/J7V6gqRmExvOQjLf0tdMwOSp8nf6BrJR+jyEP1XldF1JmUKNT0QLwCU2O
	 dCCIjVBQSM+j5XHZABEAjaSJ22InIpyT/Xj1NhLUBEuDxRTVZ73tsbMUFKE7by8f0aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oslHdUoi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75120606A337
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oslHdUoi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C53B1F008A1;
	Tue, 10 Nov 2026 14:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794319964;
	bh=m+V15z8m7UdvbBzbEX/x0QkH/lxGlqnHfdKeJrvJ+5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oslHdUoiR64VbiiafyI6ATcvNxwYlRY3xb5IU4xDwX3NMiXfj7MU+qqsfifj1rcUG
	 DOyRCuHOntA5D1mRI5qQa+Ln5f9fnxYbCTREpwcLEzzmZ2bw6nV20OURxi6yDpCuHY
	 gdOTvTKvV1+RwZ6wLq5FfvHpQNhVZIyuU/KMDYbkFzcm8g2P9buai1+c7a+8bvbFKl
	 xYFTrL4H9y7STBsNKw7DlxdD+V43XJ4zfpKlCb5xdikJ5VKtsCcbeRi00ZQ3ejShZS
	 ycVa9jX8FIg8k+aBe+Ip0naomQQKV4ejKTgNyPkZh7oUXRPun3NjlWw61HteaUKzzF
	 NmYsjMXypqeFA==
Date: Tue, 10 Nov 2026 15:12:41 +0100
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH v3 07/10] mm, slab: convert CONFIG_SLUB_TINY checks to
 kmem_cache_debug()
Message-ID: <avMkWtwUQkQVkp07@thinkstation>
References: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
 <20261105-slub_tiny_rework-v3-7-0484ce59eabb@kernel.org>
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
In-Reply-To: <20261105-slub_tiny_rework-v3-7-0484ce59eabb@kernel.org>

On Thu, Nov 05, 2026 at 09:43:56AM +0100, Vlastimil Babka (SUSE) wrote:
> CONFIG_SLUB_TINY shares several slowpaths with debugging as both of them
> avoid percpu caching of objects. With the goal of replacing the config
> with a boot-time decision, extend this sharing by hooking
> slab_tiny_enabled into kmem_cache_debug() check itself.
> 
> This is made possible by the new SLAB_DEBUG_NOOP debug flag. Make
> slub_debug_enabled static key always available (not just with
> CONFIG_SLUB_DEBUG enabled) and have slab_tiny_enabled add
> SLAB_DEBUG_NOOP to all caches in kmem_cache_flags(). Do this also in the
> CONFIG_SLUB_DEBUG variant, which is currently exclusive with
> CONFIG_SLUB_TINY, but that will be lifted later.
> 
> Remove the various IS_ENABLED(CONFIG_SLUB_TINY) checks that
> complement kmem_cache_debug() checks as they are no longer necessary.
> 
> While removing/adjusting the CONFIG_SLUB_DEBUG #ifdefs, also convert
> CONFIG_SLUB_DEBUG_ON to *_STATIC_KEY_MAYBE().
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---

Nice cleanup!

Looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

> diff --git a/mm/slub.c b/mm/slub.c
> index be4e1f193295..1b7626645068 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -7874,7 +7870,7 @@ static int init_percpu_sheaves(struct kmem_cache *s)
>  		 * cache.
>  		 *
>  		 * We keep bootstrap_sheaf for kmem_cache and kmem_cache_node,
> -		 * caches with debug enabled, and all caches with SLUB_TINY.
> +		 * and caches with debugging enabled.
>  		 * For kmalloc caches it's used temporarily during the initial
>  		 * bootstrap.
>  		 */
> @@ -8757,8 +8753,10 @@ void __init kmem_cache_init(void)
>  
>  	slab_obj_ext_has_codetag_init();
>  
> -	if (slab_tiny_enabled)
> +	if (slab_tiny_enabled) {
>  		slab_max_order = 1;
> +		static_branch_enable(&slub_debug_enabled);

At first sight I thought this would be unnecessary if we handle
slab_tiny_enabled in setup_slub_debug, but slab_tiny should work
w/o slab_debug= parameter.

-- 
Cheers,
Harry / Hyeonggon
