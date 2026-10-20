Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509013;
	b=XPX0PtLEOlYm0zFPY9CcfCI4MvNae0iWqHNS0drmvy+JLQ1TMx07dosnA5I8jjGxZwEq
	 IePi8Ce0Rx08p7pEiafhPehK9Jwkw9uhL2iIf+MOkNuo4J4KakSAZ6o4TvyKm2WvuWN2+
	 OWhCNT1NuonF6moT0WV04HA9oFdjPLsKCwdR4e6LglSwUrPPOChuOQjW7t3hIUimC/i3j
	 RC8lB7tTgbdBCZw/w2QCclB5tllb1V8OL5R1Iwg+ryrS32XZegww6/KIt0qcKDObAPgQd
	 UweT4RYdAbuf6vB1yhyQaTKB37BtHGNCbRcCb5Q3dzsle6yOkfZJfMNd1OTovvFjZ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LM7ZG/o7cRFGsvk7gWfEkUQJIfUmCsf6qM2w0xloGcc=;
	b=n7kfucSYR0X3rj0cUMKHkZyxWwBtcKnEJ8/4+uVTrdz+M/Z/rDjo7n1uP0cxCWwodYpj
	 95Tt3A3G5z8eFfOGeLGm6maVCnEZ54moWj++cx3eCUkj7GmPv2A/F6K0Atq2MP6+5jLKP
	 HXgxuhA3e31liklPmbk+VvDrndpQB8nMsSMmE8DHmrdnMK84llVfh2lWhqBYK+/F0KORu
	 X8cj9mmzOcSKsClcEs8/E9QNW7SnQ6mK+D8jQRu/uPaittTv9e6JV4z3sOTaJBSJxSfvd
	 Csgs71F1p1RSSOSM9vgztPV3/uI8yN/5RcciKmQ2qlCavnvBT4AZ+VcFADaNMdPw5Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DYnnHjEL;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C93606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C93606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DYnnHjEL
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so25719705e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792509011; x=1793113811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LM7ZG/o7cRFGsvk7gWfEkUQJIfUmCsf6qM2w0xloGcc=;
        b=DYnnHjEL2Krb+JIkCKHSv56Nvzqnqy/MyvmEKG0SufCNeGbl2fCQYxgsaJzbKwpl2u
         xBofG6hguWdfBC+YeILbWnAhrknSat53YGEmc4KwkaaPOcuM6a8/H2HS0ZwStUnLPVTE
         oc2RGltsSV/hFidhodoV2F0CWgCCHuPpsEFoJzuVCC77GQsFP7vEEatfMyv6w8fKPbrG
         DRMDQNbMwfzHIq4Spx3J2bIn4xXdKocEDLoZHbzUmG1n+c+9NbQ96H8fStxYGZnvISIu
         hJLGHDjq3+0KmXHuNxBc+/pB4Uk6L/2iBRZIAmacDuIoUD41mirDnuWgwFsjluY3Plxx
         smKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509011; x=1793113811;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LM7ZG/o7cRFGsvk7gWfEkUQJIfUmCsf6qM2w0xloGcc=;
        b=mMy9TgVqNcXjwvdCWsTfSB8Zd56Rs6VZ1yxRSh1CWNPDhgzCHeyTrR4TxQHOE69pv+
         pv6pC91RjuXWsc+dXuTcGP5JMHvzakQKq5t3FKgCCt/Gs5Yput7N6a7jMPHUnAV7QHql
         Y8toGYpCSfZi8Mu3JgPTpuplD/L1ahW4M51r5IhHdzs72AhR08QE5gLymDhdwxR2YBB6
         anG4+R3KNlCavuFOaKUGAte/Qt09di30+UMuzqX1rUNS/ISMbhe8NfiFDbxv9AeRk0IX
         Jw+Lvk9SkyiT+2mhktL8Gf5ngb4BnUySckpHL/h4g/SdaZMKjjuOKszy8FTl45tmxuWI
         0zVQ==
X-Forwarded-Encrypted: i=1; AKwUvByFU/aGCld8jTi3/Uc/qPoI+o8ipOabptANyc1fLd+6FcErS/mZt0ab8HE5Hl5jnKxwgoMHDPEpp2L1jjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+fdi54RAoR6IqxP9XMtZimrIew6DvV9QWpqhmWIGAkAhrN7SG
	xLMNRnSCuelIUEqoLRHsrHF//eGLYGO9TmAwM2RlpVRp/g9RrgA4Blme
X-Gm-Gg: AYBFou2i5CWZ7mt1pUWZkJL/Qu//pFI9Sz3e+xlN9WJ5ecY7pBFcambxrv2oE6C86ii
	FuASgKvxoQyfpib90fWswMeZH3mVw9MTzpfeyPKfbK7RQ3t6zWBNZC990blsSI0S7zDbwDbbD5B
	opWO4b3poPV1k+uaOgI+2S615PUkKew/icllFoePCQizzDQAn9riq4hhTdEDRntWrM+CJWHP9Ed
	0rq4AgSByzAFIRLCwSGAZgBo1+h8n5rxO9rE0BkrZ9C7XX15jJaIrZ6dUcNoYK20fFzO9jWM0kP
	BlBvH928r5YluM2mXU/Sjfs1TtaDYzWwwdZu1nB1tx26sQtSFkAnccLb7701JT/2oz6Rsobe7ll
	n/1QKkPb05S8J+havK9n7ia5qtRXjJ40R95nLiM8iELrz6+4XChtSB8+2+Jgqc1cZFkvTWQlgn2
	GO2Jxh6CAXSGSdKsyXTn825Xw/20cDGK3iBarYLUsYTKON7dHshI8HsabjEQFTT1qUvJJdmda6i
	9GxweXlwxyUD3MZE0pDwPKivpH1t9XipEQMQ9hCloudNdSiuDLlziL5Vw==
X-Received: by 2002:a05:600c:4f06:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4a1e69d931cmr185715205e9.22.1792509010706;
        Tue, 20 Oct 2026 08:10:10 -0700 (PDT)
Received: from C422HJQPQG-Fractile ([150.251.170.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82ff70sm6650580f8f.52.2026.10.20.08.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:10:10 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:10:08 +0100
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: "Liam R. Howlett (Google)" <liam@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] tools/testing/shared: catch a failed posix_memalign()
Message-ID: <ateEUAMoDCgiHrrT@C422HJQPQG-Fractile>
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

Reviewed-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>

It's not really a big deal, but seems this was introduced in commit
8801c35c3672c ("tools: fix -Wunused-result in linux.c"), so +CC the
author Shuah Khan.

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
