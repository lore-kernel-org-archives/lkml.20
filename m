Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289195;
	b=Rn/KQ6i4snPcgoQF8QqLuawfR55vFMeTzeOBLWdt7hBhtrifkkqeJOC4t7T412OTUiEn
	 +iQ5MCRKbmrbLKBK5fZWKwxBYy0p8ZtvypUT8mQD2E6tw7mBWduK952zApyr/s+6DWVls
	 gKwW1j8dmMPtslPfkM0wMZn8+QMAs0gKmew2aNziZ29Cg+1Oj2iqKesgTD/ykTYgMm6hq
	 MaQ+2UQj+R9ckGFFVD20su5k0TEX4DzWagbYOnyd4xj4kww4uFMVTjXsaHrlbsFvsfLKD
	 P+2qIQAVoGYWsmgcI0noTbvV1x2kexnUd+3H0jivgGwIRkItjRcWA3bYwEDpXnhmTog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Y4IpnFVFMm5fXSXAtzV8xsgRv9+hQP6OGl0+r2a9VT0=;
	b=O73wLwMnePuqGyK7QgRJPWnVzVssxcl25z4ExgXOQuMuQZOSMF8UmXApxvtOeFYhwccZ
	 sT/6lQbLbkqVibV6hBWebhVm5kc4sqtoxSAIYCpbX/Wl8Dme7mC2NMLHx4cNwbPKrUGa5
	 HCepFeMLnV0cN51QM17DpHRL2fe2ldnis22Y5uikZh6CaLcZ2OLU+OkDKEccGe1yzKN5J
	 ms5QS41PmU3Lu7Zp2KMPgYA+GlGMREO46SaUZOTDultkSQ6hkrJTuDU0KcXYoUnn2kOga
	 GPhXlQ4AvST27PCuZpj4kr4VpMQBVO2ClnQdU13nOlI+aj8bRhzkMvwtrPNpKTK2IMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nYCjfLCg;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2E9606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC2E9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nYCjfLCg
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so764864a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289194; x=1794893994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y4IpnFVFMm5fXSXAtzV8xsgRv9+hQP6OGl0+r2a9VT0=;
        b=nYCjfLCguMBjFt7Df/pwcAS/GPhBqgvi5e16XKr+oU3FTl4s7XEOa/w4lwVhENYNEy
         6HUfXInt0Qich4WYX2Rx0OD0rQnYQrTfrGD4byFmAPHBXNocTXgLKiro4pJRUUMPvCHC
         Ilr6Z8eXaJfgpRD2l9SSOO7VTdw3nLqZlt0Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289194; x=1794893994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4IpnFVFMm5fXSXAtzV8xsgRv9+hQP6OGl0+r2a9VT0=;
        b=BlZkS8lIGiYDSXDt7tbq8VXuS25embEvg3ROqFPhT3+ZOINOubARaDLvE7AsjUzI28
         5w+y4TdnEceho2QU45Gocr+Z+IsfuohvkCfo+TGnJNLhH1wjHemRS/gEe39VhAbImPya
         Y6vPTQOxoxJy2/pnN875LKzO2yoDWiIRiR3aUZ7KITU4N4gpKycFQbv9/TquqnS2i6vR
         ymijed4gDgGUu5nBUuS0m7cp2b7InR5C7uuLCqf4w8syedQ1huv8D4VuqesLQS06+ghy
         +fnvC7Hqkgnr84Q5BQ5Ovk8pNQaF8mBYuGLreD0D/kdW7O81O7POMWM1bIYkKuIXZlYD
         c7OQ==
X-Forwarded-Encrypted: i=1; AL+hErECnyKrjk0sR6h2Z9IdSdpjLBvRqMJHY4Anpcjbc29S+5hPvEskyBxk9kRzWdcdkMVllOT8+xCRjuk1jrc=@vger.kernel.org
X-Gm-Message-State: APuU4Z97s2X3brUUP8/8ni5Dh5PPoQR+wHLT6oAB3zSt/lb6Mn0+5SmY
	FuA6aZyk7AQDnP+wAbtPANzRZOqOTIJFi7BjfVIorugGRLz+axxDAxhwQog1hY8AGQ==
X-Gm-Gg: AYBFou2WXZgSJvDrh/kQ6HPaLFnNhzJVjqQ8D1yNfQ7OaY6nMp/k7TBVp9Y4TLFc5FB
	7rxPVz8NtK4JZ2fJJ1UqUpXlYCSYd4M9ZM/C5OBaMVOysEaOyxk0zgFqJofphiXypCiY1dy2BCg
	5GLjfJrKl8fDuCu7Mnb/gBRkJo42zbRoRzZJtbjLGGseqNuaQzGDmwjvkoaVlkK5BUv2Dnif8O/
	W2BcWx7QMV3pDB6DbOCOQwKA2EUgZXRRmf3vSftL5avrI51EmrjoWjERKTAvG6aFTVOHO2A6WF9
	mAf81n+f2Fh4pLbxKIdlpyjDBwCRYnLHHStm3Q6Lj7U3G1KhxeJ5cwvXeYwZwRVOb+t2hKsChTW
	J5NSgYdMzyarg9CTqv+bO0RlVHp1WlyjJqAURk2yxGlcaHiLKITVtn2Pqq0nJMmEClPIrv5Pa9O
	6z5wp32nKgTlZnkCP5bwq9VZS2ZGHZgufJJyIMtGf2OhNbXQQ54udUjsH7Gk6ZRUGMAQkfQSG3Z
	n3sXfllSlkhos/AS3f5DEYJds61brO843rH96cqhD0k0VNsFdMQlbC7E3qw7FpKZwCtfwUwGYdU
	qbjo8qtJrxqA6/KqKYzYpe2bB9NRu5aFzIjZp4EhYEogsHBKmp+BcoNse59v/8fdTqHh7f08MJj
	Eo5zmoAHR4ATg75I=
X-Received: by 2002:a17:90b:380f:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b166d02addmr1882552a91.34.1794289194303;
        Mon, 09 Nov 2026 21:39:54 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b168ff86e7sm1041404a91.2.2026.11.09.21.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:39:53 -0800 (PST)
Date: Tue, 10 Nov 2026 14:39:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, 
	Nick Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Laight <david.laight.linux@gmail.com>, 
	Sungguk <sungguk.na@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 13/15] lib/lz4: switch the decompressor to the
 vendored sources
Message-ID: <avKtyCOOmK3AH0xy@google.com>
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
 <CGME20261106144310eucas1p1d60fe5c2e0170c49f38a3142bb1d8f94@eucas1p1.samsung.com>
 <20261106-lz4-vendor-upstream-v2-13-ee04c3f0d7dc@samsung.com>
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
In-Reply-To: <20261106-lz4-vendor-upstream-v2-13-ee04c3f0d7dc@samsung.com>

On (26/11/06 15:42), Michal Wilczynski wrote:
[..]
> diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
> index 50265e3ce256490994cb6dae32a45da376e408e0..b9b8a5f678c155442fa3fd2c1984e45182e6fc38 100644
> --- a/drivers/block/zram/backend_lz4.c
> +++ b/drivers/block/zram/backend_lz4.c
> @@ -84,7 +84,7 @@ static int lz4_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  		if (!zctx->mem)
>  			goto error;
>  	} else {
> -		zctx->dstrm = kzalloc_obj(*zctx->dstrm);
> +		zctx->dstrm = kzalloc(LZ4_MEM_DECOMPRESS, GFP_KERNEL);
>  		if (!zctx->dstrm)
>  			goto error;
>  
> diff --git a/drivers/block/zram/backend_lz4hc.c b/drivers/block/zram/backend_lz4hc.c
> index e7ee3740219852f079d1e0866da6b213a3f3a583..1e09c93016264259c149e2913b2819571b56fab6 100644
> --- a/drivers/block/zram/backend_lz4hc.c
> +++ b/drivers/block/zram/backend_lz4hc.c
> @@ -65,7 +65,7 @@ static int lz4hc_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  		if (!zctx->mem)
>  			goto error;
>  	} else {
> -		zctx->dstrm = kzalloc_obj(*zctx->dstrm);
> +		zctx->dstrm = kzalloc(LZ4_MEM_DECOMPRESS, GFP_KERNEL);
>  		if (!zctx->dstrm)
>  			goto error;

Ditto, outdated zram code.

My ask would be to not squash zram changes with lz4 changes, when (iff)
possible.
