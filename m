Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB67956B85E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965832; cv=none; b=YU2J1zidg3QpoXJeq0tdWnWPih0rAIh8kOfuYaC30Hz6t8AUMWaigodSMshV2LLn1Xmz7YtmpaMpcyArS8eHr4a4TrpJBI4ofdMOWmj0fusc1XpC+zf9EJZbvKMim2f0+UA2g0sBrRiDS9xcSKMHDbH3h1Ll6dZvnTxDnwyGuMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965832; c=relaxed/simple;
	bh=1wbHB1o1UoBwa6SsfEluV0twAsNlWwoeRLeBRagEvGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4e5aWomg9+8JKbfQ/XVRPYeqSaOAfRR+yBxUgYVncGQEHnZR+a3qW96+jXU3E+ugOOWqVNwX9c5lBtZn819dKiXUJrDVgi6enYXgx8uVyaKz+8Wl5gIRmg85fOwRkSCdMp3io2yVrQiqExoMfv2f6jGpbx6bE/YgwXJK0LAU1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DoolNW/a; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoolNW/a"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso8001225e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965829; x=1789570629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7pjc62j+8bfbWKnhTk8hvktoU8q9eH1W2N/1Ffh2JXA=;
        b=DoolNW/aR8vgzb6lBByfdNrFKQN5Q+c5MtAF70tcPjZxUB0fGP4wgYnTqmt1e4SjSi
         egx3ctwKIoEA9CZeTZTPpbHO8E0/TyMIyinuf6AMWKOww27EjCEgQfnPB29RmWxlyScp
         khng1xZm+0+ndpfqJNER16/5PY6pOYQn3d974gN0K4d+qKHv0lHVtUpSFidDWvGSn1kv
         sScyXE1rAD9/FjnWao/lMAO8E85oSCv1M7jhtNNDzQPFFjyX74NJT7m7Gb/aMScA5L36
         XvgWqFhS6SNp6a0B4xvteIc6XpiItveigvANsnDJGobi4tIxFE0X8QUHZHYdgwSMkE6s
         8oUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965829; x=1789570629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7pjc62j+8bfbWKnhTk8hvktoU8q9eH1W2N/1Ffh2JXA=;
        b=CmqMhMKSzEs6llbIHKcZ0SCZ9KWtnsQJgNhzoWvhx5S0SxeAbPn15Y7uGI3MexH1lq
         4m8zYRKP8ceNqA3YVX15qXxXl2n+j7rjJ9YHUGuhhuUDCaRgmndzp11G2JBqZmVlcEVu
         UR6ng3J7rKICXWTuJjVdNp3qLgT3Kqeyywl5lrIUfaQg0VFY01nBVNqrQLXH8LGWOvgU
         h2m+W51QcFWTg1Z6f/D5r8G8drcYMFsyrZQbhuALt14tVUmavDU52qCJvT7LkziMzjcb
         +ViFz8DKfUBDxr8RwoTl3tR9pImoafuMYzfk0Ofx3Z2Wl1j9vhjzztse6hrg5a9uuOLY
         s5JQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4o82YnuMUz61liv8xwJ9Hz/pDw6flqULkrgWF8pA8h6QlVT+GwyU49zcG5od+U02NAgqL+odq49sQ8xQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mhs/952zQCBMX9ZQYXdZz4vMZSdnigq/tsg8FCUiqN3PyOZeq3
	mclb63GDAL29UFZw8L8vQFaw51je6qM+q9FUKlnsw0CAQVtB64pQUGHQ
X-Gm-Gg: AYBFou20FTgaXGXOn8NeAJ35cQBFjgUbAHOwVgpRL066IHrP0+cGcmj9MmNP3vGmFqP
	FuyjqGXq4XP4GKhG7/bjoSwM3HQrFj8ekm1+ob91FYhAwkCkQM3cni/38DXq4TUqvDoE+d0UQUn
	nY+3hyJr7cLskAp2m6W4Xm1HKzc2DqLwY7MXjtCHNw9vqDbkxiOo0vO0WHHhRFZPWLTlncu2U53
	zBT26Th51jBsPhrf3mmB6pSdXBo/6UdF4aL2wTNndF5I9NAC9BQ5ZwjlvJzuaLlFFCFssOeeZNu
	AiP59acH2mXK9RDX04n4BoyYXwmtLZFRreZiNVahkMY4xYad37km06Bh8sOYZXQHi7VFMCbS+87
	CU5HkzPOyCXnEty+FGoKIVvZrjm1vViSu8nX2wTG8QH1GEe4JJzQxa5V3A+m0DVl0SLNEy9sO1t
	/5m5K2a2/5wTO1d/4IA0y0nCTZmOINANnpHl9jqPyOKXYQzqpM4uRRQErSYVwWGUF33Lo=
X-Received: by 2002:a05:600c:c4b8:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49d17543be5mr151479915e9.3.1788965828242;
        Wed, 09 Sep 2026 07:57:08 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm423897335e9.2.2026.09.09.07.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:57:07 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:57:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: JunHyeok Seo <starlights2283@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: align AES function parameters with
 open parenthesis
Message-ID: <aqFzv98OAFRzeD_j@stanley.mountain>
References: <20260905072033.54813-1-starlights2283@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905072033.54813-1-starlights2283@gmail.com>

On Sat, Sep 05, 2026 at 04:20:33PM +0900, JunHyeok Seo wrote:
> Align the continuation lines of the aes_cipher()
> parameter lists with their opening parenthesis,
> and replace the stray tab between the uint type
> and the hdrlen argument with a single space.

This paragraph should be wrapped at 72 characters.

> 
> This addresses the "Alignment should match open parenthesis" check
> reported by checkpatch.pl --strict.
> 
> No functional change.
> 
> Signed-off-by: JunHyeok Seo <starlights2283@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> index 2217cffac5f2..3de102a27517 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -765,8 +765,8 @@ static void construct_ctr_preload(u8 *ctr_preload,
>  	ctr_preload[15] = (unsigned char)(c % 256);
>  }
>  
> -static signed int aes_cipher(u8 *key, uint	hdrlen,
> -			u8 *pframe, uint plen)
> +static signed int aes_cipher(u8 *key, uint hdrlen,
> +			     u8 *pframe, uint plen)

Unless it's specified by the protocol spec, then "signed int" is
nonsense.  Plus the caller doesn't check so it might as well be
void.

regards,
dan carpenter

