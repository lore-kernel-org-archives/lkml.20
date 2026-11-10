Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289020;
	b=QPI0PblGrjdzjRmI33IvPBi2ytHItFqtKQEneuCXocLpz3DrU8dS1Ugur8QFKkW1VndH
	 6tqeTUcT1ACw67sk9yriXkrsBZZXu1CAlzsO6VeGRzhsLFMSQc0v45G34ko8qj6VijU/4
	 X+FGABiuT86S0eHRO8Lqq0XgVpbbTWRXjIGFRq2Nvey/HuGrDcutBWVOIRTdEMeoETupc
	 8lVu9pw4eisAuR/Dcuc+lho5XBH84SsjWLrqaacakxKdY2HRys9kPGrwHUjOJFPwXYq+a
	 XKUnKj7acNWCxcY0uUG9a3WkNtTmsCkRiJxUs/8Yi8kgPc6xRTsi0Z62jByIWv+h5wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=upBQHvhIXS9jA4rn/T2U6OyiZNi8Uwc76Ij6dQGz7TA=;
	b=rgoS27Q3SIZjfx7z3lw0jobEedg6tae02T180k2YtpsmWY6F0rZurkjiA5gvvdE3Vm66
	 suPPm4DGd1yV7250MO9J0Oa2+YPERbPWG9kQPDRHpXPYKVE8/2vOfYa0ezU9qogTHAQj7
	 GOlT6YfUJpIURyWKkpgDSGovnB447Vc/xWOp/rrkq9WibhM8bESf1gH9LBAbXe/F6pq5i
	 3EUvU9vbZdN3MYiJsZmguzf9nvk7VynIE5W/uZsPtd6/HrQfHE7IiAXbO+IbbdEv/PVg1
	 NQSeIJfWHQY9SMs3uy2IcZL3Usumbx6d3FFfSiOS53NmFNVN4zW5/WIISRFkQxDCEeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a20xVX7N;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E481460A261E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E481460A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a20xVX7N
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so684601b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289019; x=1794893819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=upBQHvhIXS9jA4rn/T2U6OyiZNi8Uwc76Ij6dQGz7TA=;
        b=a20xVX7NeZjvXNyM41dYWvLkg80id1Mtm74DkyBWYfM0GGXgLb8i1+nApuqtrL8uLo
         zE4qrJ3gNwkeUVWkpUNiFHGrdIzZeRo9Bur+lQwMh5IboV/ahqD2hnLAdr9gSwVdEq52
         47ewJ4dnUp54hAJDfsvJlQHVaRbFtqFrQtWkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289019; x=1794893819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upBQHvhIXS9jA4rn/T2U6OyiZNi8Uwc76Ij6dQGz7TA=;
        b=nR8E8Fs+l6e5GUAuBYHniw70sd43OBYGPCWUHDNWEI2BPxd6N8NOrhnsmw7pKYunA+
         ARE/MNP7Mz8x7vS/owHWX3ofqq5hpMRBrxnq7h9sOe1LL2ewDNZeJPvysQEaWngIKHJu
         +9904LSq3x6Cr3CgOOJjNvAQVlVVQzjEHaVPF0ZPb2OgXPUZyNSDOcxzSiX4PSzdkm8L
         mfCrG+8ts3S74qmJLbvd5YqsvsPIgztHLGutF+96eQKknJd2C0DQglXOwHynJp8978+f
         LKlgI49Nfci+m4YnAZ61zuOhDb3V62Tt1yVkdwfSCbrWW4h3fq+Y8wnWuQBBCcS2JgHY
         Wkqg==
X-Forwarded-Encrypted: i=1; AL+hErFbguLshs3RSwvd3oe3ZRXfUfqU+O+YodBjsivFACx6VlN7HFBojwmTZBWykOzffhtzTGsA6DfHyA2uftw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Bd2qG4LfAnyx9zuWRQ2Mvp1bvt+NQLscTLkJ+fASXNq1CfJGk
	pwN06Uv7b/OFikDlKJvlLSj9Fo29OWKk7KBl9SYzfADDMFuQdIBGLx7ItVFiegW76w==
X-Gm-Gg: AYBFou1VPcR8d1muraP85eaicwDQCfB9UIefJjVuJ82ugvKfhunM1v774+1Zkj6or5K
	MrWcRoeO27EaJ6AiaQxHkQvfCwiLHKhpQvTo30oxqbH/0PlmEeQRaDVj3uXC0m8VFTb0a92ju8z
	eDjqEvIhzJD+b9DXD2xGfkpaiaoq6nVdqjoBtFugWCnWk3M3LlMRCa6Jf79d+hg+gP015B0Vgme
	2HZNZ1LranIRqpON4Bfvn4GKBnRSAfhma5vTRi/m+TIwh4locoLqtrUWyF/e4JiHV5ALPiHGmeJ
	6TCJ+dhE5/z0kHpEI4GwkCISKdAXbDoEe1r1hulzuF4jnbxwjrAAKkEemSKngGT5r/NosG+7vEA
	8MqGKHBUd8qI/OL6AiG4wMwmS4RwVj7+uCyTkJruHCBvGq+cLCfcTRjiu1E9afSnhaeGDbZUThn
	7SQwoKslWcLcA/3tRHBE3pKPWm1A27tZIIfCpA1Fwzzk2GeCWpncu1vzW4LrokXsKCZL1mtlKy1
	P4xVuO78RB2b3fHc6GpJJLAhj87KeQWJqZ7+MAShx4J5qmmxRVmBgOee0KNayRU9SmcJGDEBEdJ
	4u+g5363pIBvipjn4qWdKHBLIQkH5K79GkEY+04WitoTrMOX0odKk8vg4O4EhhaO700eJg==
X-Received: by 2002:a05:6a00:1492:b0:89f:5c84:46ec with SMTP id d2e1a72fcca58-8ba89661da0mr1558178b3a.40.1794289019108;
        Mon, 09 Nov 2026 21:36:59 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab8dccc7sm405355b3a.52.2026.11.09.21.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:36:58 -0800 (PST)
Date: Tue, 10 Nov 2026 14:36:48 +0900
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
Subject: Re: [PATCH v2 10/15] lib/lz4: switch the compressor to the vendored
 sources
Message-ID: <avKs4_S7r6EiUVgC@google.com>
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
 <CGME20261106144305eucas1p17b3b27d403dc7d13b85cdd9a4bea83b9@eucas1p1.samsung.com>
 <20261106-lz4-vendor-upstream-v2-10-ee04c3f0d7dc@samsung.com>
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
In-Reply-To: <20261106-lz4-vendor-upstream-v2-10-ee04c3f0d7dc@samsung.com>

On (26/11/06 15:42), Michal Wilczynski wrote:
[..]
> diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
> index 1e4ad31d39a63f45b3bddd3d8a467d8d7d095beb..50265e3ce256490994cb6dae32a45da376e408e0 100644
> --- a/drivers/block/zram/backend_lz4.c
> +++ b/drivers/block/zram/backend_lz4.c
> @@ -42,7 +42,7 @@ static int lz4_setup_params(struct zcomp_params *params)
>  	if (!params->dict || !params->dict_sz)
>  		return 0;
>  
> -	dict_stream = kzalloc_obj(*dict_stream);
> +	dict_stream = kzalloc(LZ4_MEM_COMPRESS, GFP_KERNEL);
>  	if (!dict_stream)
>  		return -ENOMEM;
>  
> @@ -88,7 +88,7 @@ static int lz4_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  		if (!zctx->dstrm)
>  			goto error;
>  
> -		zctx->cstrm = kzalloc_obj(*zctx->cstrm);
> +		zctx->cstrm = kzalloc(LZ4_MEM_COMPRESS, GFP_KERNEL);
>  		if (!zctx->cstrm)
>  			goto error;
>  	}
> @@ -112,7 +112,7 @@ static int lz4_compress(struct zcomp_params *params, struct zcomp_ctx *ctx,
>  					zctx->mem);
>  	} else {
>  		/* Cstrm needs to be reset */
> -		memcpy(zctx->cstrm, params->drv_data, sizeof(*zctx->cstrm));
> +		memcpy(zctx->cstrm, params->drv_data, LZ4_MEM_COMPRESS);
>  		ret = LZ4_compress_fast_continue(zctx->cstrm, req->src,
>  						 req->dst, req->src_len,
>  						 req->dst_len, params->level);

The zram code here is outdated, it has been reworked quite a bit
(patches are in linux-next and Andrew's trees).
