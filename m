Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207340;
	b=0zbKApEe//s2+XWxF7AQA57LJQi2jyu+CTX1L+Dwl9888x/m+uLCrKtqEBRTyhdkgTxL
	 +T5zu27FUfJrYfCXY6LZd4poR0W1Fq04Z7VVJEdWDhRRn2aUPR4vNsVNuO3+UvGB2mP/1
	 aGDWoY8ZqK0gTOWf+rSBtKDgXIg8JYCI2UzBqXUMazHg7iBnkqqaqDo2VvfUlLOzvOW72
	 fwSkS5/BAJOdIYXn2HRCWEXYwTxHwXbAn3b6eqM7xSGFNReiXQOsRVHXVqagb6g3Wzv2x
	 9slwXtt2BfkAQhWLuDOWxM769K9GJTcDCwE3mCbVxmze4MAbbxTOC7zzBMlpqvHRoPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207340;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mzc7Hanv0CDK4THhGHtewy5AYoBUPo6jlbuGdSqeuHA=;
	b=nijQRiqpw9zdzWGWT4rgWgQZeg5bWkdfuDaYOpwD9hTO8yZPNum+7YwB85UaA99BvqAF
	 +N4DcIc9YHBNguGJtZUvS2apOgm0ndxzB5QOw7aQUY1AHL9o0BinNoxJpxUtN3dJAxt5C
	 CVN3efrmfnxZ8qWz/3/2Mxob7NEv/M9qkI0a0G3fINnAckJbiwZz4GNJXQ6jCUc0Y9x8L
	 /NiHvVyESfFm360b1OQOCSJH0KrRgnjbouCOz0SdII88+T2WbLvEIRIZD+Q+IZHo/gr0r
	 OHXarfQWSyP58LsTfCxlITVpc4DNjNrp62Dd8DDofTFjt0J2URbEUKWWvTRO/bRM6hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EceVUvxL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF6E606A31A;
	Wed, 28 Oct 2026 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EceVUvxL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17901F01828;
	Wed, 28 Oct 2026 17:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793207340;
	bh=mzc7Hanv0CDK4THhGHtewy5AYoBUPo6jlbuGdSqeuHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EceVUvxL1OnZids3GRqeq1btRudotGLxGnTzu4CsVMZohND9PtMu9iepxejI6Lc4e
	 lCb+8Gpj01vLylCaE8zNKBJpXIXHsq8qJkTbTCuptNXWEyA7zDptDe1LKby7gYWd+U
	 5pNOxKOAOcEGtsuqqVSOGWGRKrlDwlSrlfvaAfWUMg+Df399cbWJPxKeiRU9M6em+3
	 YT4JnocZn3WzwtlbylfValFVt7mnMvqooGXe7CuDLeahKeCebD01bLSFFfhq+la3dv
	 nkl6EQigdTw4PjDi+Wp+Pdd5BkI5DtlSMnt+fUDuONmDt2aat+HgAm3JXLIi4ChCp5
	 X7T1w9wWUe4eA==
Date: Wed, 28 Oct 2026 19:08:50 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] memblock: Introduce MEMBLOCK_PTEMAP
Message-ID: <auIsIp-nKJokYmry@kernel.org>
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <20260921110050.3977591-2-vdonnefort@google.com>
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
In-Reply-To: <20260921110050.3977591-2-vdonnefort@google.com>

On Mon, Sep 21, 2026 at 12:00:43PM +0100, Vincent Donnefort wrote:
> Keeping PTE-level mappings is interesting on some architectures as it
> allows mapping/unmapping pages from the kernel direct map without the
> risk of splitting blocks which, under the break-before-make rule, may
> trigger page-faults the kernel can't handle.

Let's be honest, it's arm64 :)
 
I believe that some powerpc variants could use this too, but they don't
have break-before-make, so either "some architectures" or
"break-before-make" should be rephrased.

> However, mapping the entire direct map at PTE-level is costly. So
> instead, create a new memblock flag MEMBLOCK_PTEMAP to selectively apply
> a PTE-level mapping.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> ---
>  include/linux/memblock.h | 18 ++++++++++++++++++
>  mm/memblock.c            | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index aa845f488327..13263055996d 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h

...

> @@ -285,8 +289,16 @@ static inline bool memblock_is_mirror(struct memblock_region *m)
>  	return m->flags & MEMBLOCK_MIRROR;
>  }
>  
> +static inline void memblock_warn_invalid_map_flags(struct memblock_region *m)
> +{
> +	enum memblock_flags map_flags = MEMBLOCK_NOMAP | MEMBLOCK_PTEMAP;
> +
> +	WARN_ON_ONCE((m->flags & map_flags) == map_flags);
> +}
> +
>  static inline bool memblock_is_nomap(struct memblock_region *m)
>  {
> +	memblock_warn_invalid_map_flags(m);

I think it's better to check and warn when setting an incompatible flag
rather than when querying it.

>  	return m->flags & MEMBLOCK_NOMAP;
>  }

-- 
Sincerely yours,
Mike.
