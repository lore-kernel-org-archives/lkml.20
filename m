Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402524;
	b=AsVw0F2zZ4y9yrb8gON+jJiUuwpsK7fJv5nZBpqcvJDb7+dGXhS+Y588zwT8BLwjE52B
	 uhARS4spo4JqJnIDJep+AbP1GaUz084jmbA+8wuX1lUzXvXfLGaOvo8jyVrnVBJY4alyR
	 NuGxyhzEryH1TgO2whwBGEiflz+MpwL1pNahH+LJADLWVQvMPWdD0JfgfwAJuyyA+ij4f
	 2HjaOO6I3/M4G+Yy0nckpD5UasFSlYinj77V9ohQWwOyl+4jc6OWRgPVhjlC15l+hbqSU
	 QPlNLcirgISmgA6zn+oG4EA6sv6HGJePy6Mp13+Ce/wqP6tZONSi3RD/8+XVOxsoGhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402524;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=tpSt5JkGUaHCP8XlikkEOI4qJddO1S2MUXWY1pm1gq8=;
	b=m+AUwk3oZViKoEJCaSpy1RB/StI8+rHv4JrUtcQsV49QQjIlZ5l6E3dRVsMF1e1ryhz/
	 7596mT90udUVM/ssCOOdKa71Pg7JRM6y7hqlt3WPgNNJhGu55yj7IhqFTjKL7WEvioxM2
	 VVw0aKU8qsrFd6QgF7yP/mP9DxlB0veNEIA1Zmcmbx5E0hcvmDenSL+5fY2dptB4pj6At
	 czjoEF7OMmcJe7tPuQF7XhwZKcjBEWkHT4Kb5oVo3XHg+fHl8XHlyQCo2BBqn71UdcIDN
	 uH53RN3ZF7InpIxP7SIZ2GxLDVajYL7xlrLo27YdbPB287PbX8n2ckJGU71tQDPAZiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W6kuST3N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453F9606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W6kuST3N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536EF1F00A05;
	Wed, 11 Nov 2026 13:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794402524;
	bh=tpSt5JkGUaHCP8XlikkEOI4qJddO1S2MUXWY1pm1gq8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=W6kuST3NNP4zzA9PqmXm/bYJ6yoRhEgKl5fNUQn6dha9mMZiyvNhUUICtqwe3+ArG
	 jrSjuVs6BfBQGx22OPJQDQ77+zIoHH2HjoU2ZvMA72U2kcHSkaIJPXdd7WX8Q6lU23
	 BvsgBMhjHnKrtcDHA0gHVEVcKkuv7cyNUTCCbadw4goRnxkbFWPRAj5QxKya1CySU1
	 vhoM+ye5tViT7u0sZFpSC8q3yi9BbrZSS0jKAptLmf2YYRwMsQ1ePzHf2uCedCXW4f
	 /KreGp+leeCIRPhMfpge9Ms4JosjH+/kYUEU1/2xKHMyvkoAXWxY72zws1fLN5KnlT
	 mk5wUibYF1QZg==
Message-ID: <e2d1dc9f-59ff-4dfb-8ca4-35c584d14b35@kernel.org>
Date: Wed, 11 Nov 2026 14:08:40 +0100
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
Subject: Re: [PATCH] mm/slab: don't set SLAB_MAY_ACCOUNT for
 KMALLOC_PARTITION_CACHES
Content-Language: en-US
To: Hao Li <hao.li@linux.dev>, harry@kernel.org, akpm@linux-foundation.org
Cc: cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>
References: <20261111125628.375624-1-hao.li@linux.dev>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261111125628.375624-1-hao.li@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/26 13:49, Hao Li wrote:
> An allocation with __GFP_ACCOUNT set (without __GFP_DMA or
> __GFP_RECLAIMABLE) is redirected to KMALLOC_CGROUP and will never hit
> KMALLOC_NORMAL or KMALLOC_PARTITION_CACHES. Consequently, neither of
> these caches requires objcg slots in obj_exts.
> 
> While KMALLOC_NORMAL already skips setting SLAB_MAY_ACCOUNT,
> KMALLOC_PARTITION_CACHES still carries it unnecessarily.
> 
> Extend the check to skip KMALLOC_PARTITION_CACHES as well, saving
> unnecessary objcg slots in obj_exts.
> 
> Signed-off-by: Hao Li <hao.li@linux.dev>

Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> ---
> This doesn't seem like a real bug to me, just a small waste of memory, so I
> didn't add a Fixes tag.

Hmm I'd add
Fixes: 7def2e8549e5 ("mm/slab: add cache_ and slab_needs_objcg() helpers")

The question is whether cc stable as well. 7.3 LTS will be used for Android
and IIRC they have memory allocation profiling enabled. Not sure about
kmalloc partitions. Cc'ing Suren.

> ---
>  mm/slab_common.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/slab_common.c b/mm/slab_common.c
> index 2befd24b4d09..f0ea1fa178e7 100644
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -1000,16 +1000,18 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
>  #endif
>  
>  	/*
> -	 * If memcg_kmem is enabled and this is a KMALLOC_NORMAL cache and not
> -	 * aliased with any other type, make sure it's never merged with any other
> -	 * cache.
> +	 * If memcg_kmem is enabled and this is a KMALLOC_NORMAL or
> +	 * KMALLOC_PARTITION_CACHES cache and not aliased with any other type,
> +	 * make sure it's never merged with any other cache.
>  	 *
>  	 * In other cases the kmalloc cache may end up being used for a
>  	 * __GFP_ACCOUNT allocation so mark it as such. The exception is a
>  	 * KMALLOC_NO_OBJ_EXT cache.
>  	 */
>  	if (!mem_cgroup_kmem_disabled()) {
> -		if (type == KMALLOC_NORMAL && KMALLOC_RECLAIM != KMALLOC_NORMAL)
> +		if (type >= KMALLOC_PARTITION_START &&
> +		    type <= KMALLOC_PARTITION_END &&
> +		    KMALLOC_RECLAIM != KMALLOC_NORMAL)
>  			flags |= SLAB_NO_MERGE;
>  		else if (!(flags & SLAB_NO_OBJ_EXT))
>  			flags |= SLAB_MAY_ACCOUNT;

