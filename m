Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587EA51C04D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909383; cv=none; b=tCoqG7xiZL4t4RqBY80WFK723F2o869wQCVfxdnxdCwW7Gl/A0qlVYjb9iHwu2l9s7JzEC/qVdOuBXVyoGbj17CM0/5PCu9UHkwZSNchruOlznXhYigGIdXX9VLkI63AeY0aezRGjQnfsj/kxqwCKRjL0L7HZ9es38CXKJqFqrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909383; c=relaxed/simple;
	bh=k0DCG2gP1hbSdZ25QEMVdWJyAe3omnWy9frZDE1LnnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5I6W/tQ4Rv6BkgS52oAqfu5tBR4UR7VzQPR6JGbjqJVStCL+CohRdYmmrALqrG7UcjnVwh1EGo7F2sxindA2Kgt5JxWSfBxqFqI3skFsjgPwPYf4Kpt4MFf4K4IiBDWwP3uGCE97Eg/0f4oabzYONR/SCO94hsJbSIgAjz2QoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lZFEyAns; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lZFEyAns"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e4af975346so795135ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791909381; x=1792514181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n/66SXzEr6yi4jVYkGgNI85Pe9ob0taR0HTyDCDl144=;
        b=lZFEyAnsURJhGY1mA3RHIWhvigx2Ro9ce5KLQQPKw4gh9tUxYuySF3DvhDengw7zza
         dG6B6z7dHBvWghKpyOG0vOQFA7CsAOErni8B6TXTQnl0D5y78sqrFzLcZ241YCQnquDk
         BQ9DSTIHMy8liXtikt7Nfkf5F6qUcBGGJqtq7ydM7Lew8aMTw/KP6IpHGT7GogUpZ6KW
         P8hrnrkwTe94VSCQOJ9weWlySwkpND9YCUfqckMlXGhP1i+T2GGSwnR5DLHXqSPBHkzp
         rO7IqCWjHkzKJUm4jYMjeoXeMyrKtdCA674o2ECAeMCtvR8UQl6AlnJeCPIOtkK9WOLx
         r9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791909381; x=1792514181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n/66SXzEr6yi4jVYkGgNI85Pe9ob0taR0HTyDCDl144=;
        b=a24Ldh7CPz+OYX9zDxbSLLGYIpu425CzEBuAw6Igqdy8v+uCxsHZd0Li5e9234TsF8
         uy2KjBN4rYFchm6dFH5qjCoVtuqbERuui4U6v5HkepLBKHMY66HV2GgQVTr9+/N+fCt1
         bvzAODe0pZDkX5LonoOvpniU5iFh3Sl8LKJh/pUCp1/VD6Z6zlkP/Xv/mam+EMpydcow
         WneF7LCF6dTbwRobv1GZIof2DKEFRMo3gTwXFE5fN2vp4oowvEFOXHv4IYwzlPbW8jkL
         KNDM+rXmF0tHHPBCn6/SUrafZRj3bbDJ5n6r3GLJD5+0uJ1eNjAdFSKWI1WZNAV3L3cs
         EgBw==
X-Forwarded-Encrypted: i=1; AKwUvBzsRLO543zYVOtMmjzC7Ia0DKsLYZH8ZtIMH6HiT/y7ydPz7rwlT5xMlwYG5ukx9Pw/m2cGeG6atfc4dqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+xif/HT+KRlzUWdq2aPdVaAbsbS8Q7WpQ51bKsXhbHfZxoRku
	f6WnkLq3xoHd6yIQ6jqOIYBpa/OsHuRP9qttuW972HS7gJd17t4Xg59jPUY8SckKSqw=
X-Gm-Gg: AYBFou2KpP6QwW1pciNQ0BuZk+fpY7UHpx6lS3liiiglx3sDQbBMpbM536pCKYjD+tg
	zcHWlFNZJTpn7/aWS+lEj1rC5vui7E94RXHEFjS/JkIrAyFHvqQNSmOTF/5UllOj8HJMh17++mY
	lwIx7sQ4w5PW+F3nqgMx1yVVnAQYQhJkbTItu4fvKnZ5Qt9dMZRpO8T70uLLKkgNh47GJFcIIXR
	/Q2q0wddDiCV2qWulo4XjsZ7CFcaxpwTJLWo4Q9FR/u+Q+5m+YGOeeIeHZMNGxIDcD25O8Mb3+j
	6yrohVYRp57cQovk7uveS2hqx5lJu/EQRToOEcmIP7IheO14NHqSGtxOcP33neE0hQeZra4AwWr
	noM2L673FvNYqOLhb3/Zd0m/VOjKTGMSg0WSBgkWWDgYD80GGiYzborUtMASxQNQAZAaHXILd67
	DGzTlcIoNGHrK1jKTZdyPQ3wSDgW4FrLZOkdJy6oFQxs5Vy/Q9D3kRWcRLHYcRPiWpa4EfkCaxf
	kdo3ylFFqhE
X-Received: by 2002:a17:902:e892:b0:2e7:4a2f:68e6 with SMTP id d9443c01a7336-2e842e1363emr126560095ad.39.1791909381526;
        Tue, 13 Oct 2026 09:36:21 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:adc4:c3cd:7c5f:3991])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1562sm60325445ad.34.2026.10.13.09.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:36:19 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:36:17 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Minor improvements for remoteproc_virtio
Message-ID: <as5eAVihirrdYh-r@p14s>
References: <20261010-remoteproc_rework-v1-0-cc30dc34d866@valla.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010-remoteproc_rework-v1-0-cc30dc34d866@valla.it>

On Sat, Oct 10, 2026 at 05:21:05PM +0200, Francesco Valla wrote:
> Hello,
> 
> while working on the v2 of [1] I noticed a couple of areas that can be
> improved in remoteproc_virtio, without a real functional impact.
> Nothing critical.
> 
> Thank you!
> 
> Regards,
> Francesco
> 
> [1] https://lore.kernel.org/linux-remoteproc/20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it/
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> Francesco Valla (3):
>       remoteproc: virtio: add vdev_to_rsc() helper
>       remoteproc: virtio: replace kmemdup with kmemdup_array
>       remoteproc: virtio: remove stray white space
> 
>  drivers/remoteproc/remoteproc_virtio.c | 61 +++++++++++++---------------------
>  1 file changed, 24 insertions(+), 37 deletions(-)

I have applied this set.

Thanks,
Mathieu

> ---
> base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
> change-id: 20261010-remoteproc_rework-6a06eb95ea86
> 
> Best regards,
> --  
> Francesco Valla <francesco@valla.it>
> 
