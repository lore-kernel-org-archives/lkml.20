Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896804;
	b=FuYFJAZeA9U0WzKsqs+0T3N4tJA1cv/o+kXk2KFOF2O2F5WRJsiBcCGT2K2V6mie5zxR
	 W9U0IVm2pPxitcf5bzgpshdbJr1RblGGbZ3q7K8qIrvv8+S0YwEZd/ozQO9bgJR0hP6KT
	 PVKXHHV2+j1Yrs9WkpvGa2142ma9sc7JRvQP/ShkGc/c3WV0BaBMDbC0CB4T0p1qNyVZc
	 mpJcqYnPRMnNvqrrOq0nDyXTfkEiA2wc17Wq6BCmSu92K/2tVJMDkj6ynFWD9TJ0khHWM
	 Hu4WxgeNwJqz4R2BSWKoic6U6C92bEW09ba0ktDKvPgPtxe111QSe8P+F66CyebDQzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OHxjdRTl2ayBechFrqmEx31ZUG4z0ezErTIz2onp4OM=;
	b=ZNOVbLWCTLHgXQ8WWmFHaxlKdSyrP8xb3K3gSZSM34P00bhavFT/BFbt/qkHhsrhvqfz
	 K0gzLdImx+iEhfhAKf1BOFvxh4Y1Q0S6UYQuwsQ8ghL7jf3OQvjRbCl/WzE11WM7bwT87
	 4BGUfsqd/YcSHOaoSjyu4TKs75DjJq9D8Kjw4WyALUwD8VLNn0Ti4JnINLkpotr/lPGL8
	 LpZGOEE9SUp6PU/sKhVtV+tzTCllhkFaKitQ6MFFyHzFistpAB2QXzpTOnYKSwPqSPNrQ
	 6U264n062U6qMG6rNmsNgXtOzIMqtRl9Zqs2cob8bSFTwFBStgmqv676UQKsIUz3MBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RMRGUHJw;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D167606D811
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D167606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RMRGUHJw
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0a2a44a0cso1190024a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793896803; x=1794501603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OHxjdRTl2ayBechFrqmEx31ZUG4z0ezErTIz2onp4OM=;
        b=RMRGUHJwuly7k/nYdMK/tDheHbVep575I/d+FuUvw1H+/Ls6BRh3jvpn67XXRYKtAm
         AFu1oejlF4zzXVFmF8aW+0gU9JvB1xu3exO3RcmSCXtEyAyPdHYYzDd3IslRo094m4vS
         NUY4Kbxmhmq9HOMcyzwruVY1vMphvYFvMdW0PvkcSX7m7tdaD1hItNYdZMBrHabyUnV5
         BmTucVNDitms2kR605P2eLkJlL40xPFBp+SlBoD05fxyoLmktnZEyQlN7q6bJyxMaX38
         +FPQGs1KIMnkf+wnJp43WWjNixB8CI7nW8oIoNXCFE4n+DmKHzTJUPKS+FYgkb3HAuOK
         21VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896803; x=1794501603;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHxjdRTl2ayBechFrqmEx31ZUG4z0ezErTIz2onp4OM=;
        b=lowu2o/0F5KNvPbUj3rgvFxBQZxUrm50fOxuKhPHcf/FWkLevhEVP+TA56OgQ+8nCb
         W9h7cGcXUQXsp+BcHx6HUgEKddniUaqfeU3HaouVttnXlwxs/sgUC2RcC3czWAo0XSaV
         Ueukz1ID/suivlU624Fqjequ0qBaCdNxBXzsDWUIsOYtq3yBfPFxIGiXuBHL+n21rzHf
         TvBEEz5bJ/b2OQiNjCMyUrd8I2ja5JRaBfTVEOx9zGFa+vmgmaXtNUnqDLIKADtRJDva
         0/Ob8u9bEhKqZZtvLvMNZIezt4RU5JT8D9ypIWbFX4E8R83VXopWXQSxGB5vsEIouYX0
         RhmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxufX6YaBpIbofM5d1iY0cfTtSm7HY8lgeuaQ7F8AT6D1b5crRNM22E1SD7drPn7w5aH7CngcJA5fYKk34=@vger.kernel.org
X-Gm-Message-State: APuU4Z/escRl2g5FutSYCHUyckASsgZPR87Far3FMSn/lUcTNZZIRW09
	zh1Yf/9ER6UYB+44MjKCHeeNYcojpD/YJ4IxIY1YqHyruArWvjtQjTSBChqJCmQ3eEg=
X-Gm-Gg: AYBFou2TiYXozxOZjeKVKduuMu/jXn3+B0LnmW/d0f9vj8ZmRAVKsP7YghwD1qnl1hD
	JDcZ73KwuYqQvK59jEpLHmBtSEUqk7GTYAstOMpIiAuFS9zRN5bDMhson/ep2A6ek4XNOedRUG9
	GLbmVm98ludye97zfwLeEwB47axjXBVKnbncXTHTx2rSdeJz1j/q+RY4dFwMFKMIU99RBr+kQaK
	Ds6oA+Xj3ZUAMSXHv11w03gFEkjDWM/0wQKQAzQrONGNb6iV2ECzrqhlKM3zfjH+0HaxdnDInrg
	+MKCg4UxAMG8d9ICZVaND53ombFFwZqTMcySR8CzhTolZ2GccAQ+MbDzriRK2iKxpBNdkgqxa7V
	IxaBCzn59Rm+M36j5eT9UjUFFPxuWlgYEPFFlIWPqA26VZHE8lSvDwG0OxZlk2b+YUHb9KrGGeM
	HW3y/fBmrpmRrWJ8KMNUHtsvfbWgSUsm5htyuPikBVZ3bwN3j7sQoBbwmTrIFq3kmPxP8aJT5Pv
	xNf/Hj8Q4u/OGI74IkhaB8YJp17Bgfoald5TMPErRLOQsKGUEl53peqPvD6KO9Z5bZQvf43pKHV
	2EeBLQVVdiOnZaktAXY7jBfePZ4eyOw=
X-Received: by 2002:a17:90b:2745:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ae89776d99mr16769973a91.13.1793896803139;
        Thu, 05 Nov 2026 08:40:03 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:c7a9:fa1d:b267:7419])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0969eeacdsm4764364a91.4.2026.11.05.08.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:40:02 -0800 (PST)
Date: Thu, 5 Nov 2026 10:40:00 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Atul Akella <atul.akella@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: core: fix integer overflow in
 rproc_da_to_va() bounds check
Message-ID: <auyxYDRg1QbIrKNo@p14s>
References: <20261031161131.1647-1-atul.akella@gmail.com>
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
In-Reply-To: <20261031161131.1647-1-atul.akella@gmail.com>

On Sat, Oct 31, 2026 at 09:41:30PM +0530, Atul Akella wrote:
> offset is calculated as da - carveout->da and stored in a 32 bit
> signed int, while da and carveout->da are both u64. For a
> sufficiently small da, the 64bit difference is truncated into the
> 32 bit int, bypassing the offset < 0 underflow check with a small
> positive value. Additionally, offset + len > carveout->len can
> itself overflow when offset and len are both large, providing a
> second bypass.
> 
> Rewrite the bounds check entirely in u64 arithmetic. Reject
> underflow before computing offset (da < carveout->da). Replace the
> addition-based overflow check with a subtraction-based one
> (len > carveout->len - offset) so no intermediate sum can wrap.
> 
> Signed-off-by: Atul Akella <atul.akella@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 23f8539a99bd..d5fa9d23bd5c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -198,18 +198,20 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  	}
>  
>  	list_for_each_entry(carveout, &rproc->carveouts, node) {
> -		int offset = da - carveout->da;
> +		u64 offset;
>  
>  		/*  Verify that carveout is allocated */
>  		if (!carveout->va)
>  			continue;
>  
>  		/* try next carveout if da is too small */
> -		if (offset < 0)
> +		if (da < carveout->da)
>  			continue;
>  
> -		/* try next carveout if da is too large */
> -		if (offset + len > carveout->len)
> +		offset = da - carveout->da;
> +
> +		/* try next carveout if da or len is too large */
> +		if (offset > carveout->len || len > carveout->len - offset)
>  			continue;
>  
>  		ptr = carveout->va + offset;
> -- 
> 2.43.0
> 
