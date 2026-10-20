Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487149;
	b=NzSHt1uyRdQ2Vxy5v9Gt6h66xLqNvg7vBX2703LgQCO9ddmypYVNlT9W5fGIKYx8wp9e
	 3YrHcm3uSpItzqsFJvuknQmsMXtBW95amWjz0DF4L+ojMc9Wf2v9TfGhfmQ7XEVSJkUH7
	 KLfXTb0jDaDZ5t/4rYSFNvY17sWj+bQKNDt9KckgqHLF+/U2+pkGKnjqqQtIgbCkaCZle
	 QgyN/bYtTbf8t74fpYXvyOn+4B3HG8+d5Ta6ps8tuJeQaFWeWDxkbfHVfkU2AL1/JSUNp
	 G5JJHPBe8WHbOvdbiWissCWyDdyHDNltx600vXuDS9MSPrvP15YbB7MQx87Cie4sLrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487149;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iDrKkV/s4DciKEFvrB0xcBPka0pdP+GIzVxIpseur/Y=;
	b=lAt0llWOmqikDjAUV0Bal9vyWgAxxjlETbvYotlsZo4M4dC3Jfxjil0v/TcCdPhh3E6A
	 1nGzzYut+D4zE5P2yLklhas471B3KSNA7N0ie8wAXIGGrF7Ih25CGcthUArwU8CEwoOzS
	 txwRXILVOEqVxyzQZTPXjT9IJBW3YOIGj2Gq4ce0gqToDfNedUQ3kkScEuytTGzkgMM5E
	 PStSthC3b45vwnUstMElp1Iqaiu4JPMvHXnY1qtMwjwmnLlr+Ze2nJHd+P7INTBq1KyG/
	 ZM9LJC1DNaZ5FSs6wR+bkyaDdIA45hMpwXIW+eL1JQPBYob9VanfxVImoa+3GljJW6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WfuzGXD9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8235606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WfuzGXD9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5BB1F000C4;
	Tue, 20 Oct 2026 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792487149;
	bh=iDrKkV/s4DciKEFvrB0xcBPka0pdP+GIzVxIpseur/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WfuzGXD9qCbdGbBWEhBueD+0MetrF69PROOmshHF/raYsz6zIHf5JpcjgO8BHDPXn
	 VWwrwgig9XfGC0Vx4V14SzRRnkXAduNZ3s8JNixWBEVfWJJM6rz0tMgtl5ntHIPp4w
	 4o++VPQ+bRGrSbtAp8H2o7O9RIXXFdfZViYh0MEDLBdJHY+8ZcXOe9/rZf/RGOtDwF
	 1J2EZsV7oggk1QFSqZj93x+6755aKzOLzD6qTbF+alRFO7kgN9ExX+Wwscz1/m1m/a
	 FrCeYP9Pb5XMFBOvWtcIJ3359dBkCJCU//ZtpPL1EyGAipZXG/aeeGtZyXpIa04/SJ
	 U2vejXCy+WQhQ==
Date: Tue, 20 Oct 2026 10:05:44 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Liam R. Howlett (Google)" <liam@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/testing/shared: catch a failed posix_memalign()
Message-ID: <atcuincrH5DdYB-n@gremlin>
References: <20261020033128.1934349-1-liam@infradead.org>
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
In-Reply-To: <20261020033128.1934349-1-liam@infradead.org>

On Mon, Oct 19, 2026 at 11:31:28PM -0400, Liam R. Howlett (Google) wrote:
> posix_memalign() returns zero or a positive error number and never sets
> errno, so the checks for a negative return in kmem_cache_alloc_lru() and
> kmem_cache_alloc_bulk() is not possible.  A failed aligned allocation
> carries on with the pointer unset, into the constructor or the memset().
>
> Test for any non-zero return.
>
> Signed-off-by: Liam R. Howlett (Google) <liam@infradead.org>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/shared/linux.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/shared/linux.c b/tools/testing/shared/linux.c
> index e0a0693df08f5..a37d2f86d3254 100644
> --- a/tools/testing/shared/linux.c
> +++ b/tools/testing/shared/linux.c
> @@ -83,7 +83,7 @@ void *kmem_cache_alloc_lru(struct kmem_cache *cachep, struct list_lru *lru,
>  	} else {
>  		pthread_mutex_unlock(&cachep->lock);
>  		if (cachep->align) {
> -			if (posix_memalign(&p, cachep->align, cachep->size) < 0)
> +			if (posix_memalign(&p, cachep->align, cachep->size))
>  				return NULL;
>  		} else {
>  			p = malloc(cachep->size);
> @@ -191,7 +191,7 @@ bool kmem_cache_alloc_bulk(struct kmem_cache *cachep, gfp_t gfp, size_t size,
>
>  			if (cachep->align) {
>  				if (posix_memalign(&p[i], cachep->align,
> -					       cachep->size) < 0)
> +					       cachep->size))
>  					break;
>  			} else {
>  				p[i] = malloc(cachep->size);
> --
> 2.47.3
>

--
Cheers, Lorenzo
