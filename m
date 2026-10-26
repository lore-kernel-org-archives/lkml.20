Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023010;
	b=YjL8Z0tWOf+c+LfUZCRx73HnRky1P2c9OW3OL8jfjW0l5cC+YuQNhLVgbH3RpB3iCrF8
	 Ob6rpAm8jgm98nizDlFbfyLITOHo4vGrnzI1zswwWoovR8D5oqwJSBC2XCArKSkuEtsUS
	 wo2/hJfx2j6dZGLRYKdRO7nsdpFdd4UzWeT1HsppQa4B8fWl9kIHsEWCr9OnLWszFwJsh
	 5Bziz7zMkWn9erapdgxWQBzmGYBzujjJBifdz8XVjIYnqKtsLpTUAArdSumqgZ/TlcIkF
	 WjT2TvVCeuksnzgAy5w9DY560FWk+zwOcBJg9O1+qo1UCLH2Cqd7RllXANMqm/6ccqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=2GkOj5GONDON7Vlx9Y8BowP7/PlsCg9Zwi4Dy0PdP9M=;
	b=sf5+kbCG+A1obrh31lO780yia4e5lop3gOP/PJo4NZGE35WNKGINEMcq9tNSZ0cSOqyM
	 CV1l13LtG5ILTLz9ioLtUcgOyv8S8xLcS7gqdnIIAPJAKkcGBMPIg0ZcYn+irQhk402qo
	 gfWOjmET7vPS0uFDedIlWvgWxBxiQ8/kcbne62mDj/7X6ArthHWgqAkAf5NFUYNL4TLCP
	 7h1eFrpZAJn2IXqdCSuQ25ZJ6RH0/AIFdbmDsqdke/KYDAwaZ+ubFmtXeZNmx9xrY8vNk
	 zreqsRYoJQPBgRkAecX5hpy4vevp3YWQxc7QK+TFor7K2vkGFa/qSTeIHFueCvJHDew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imd-tec.com;
	spf=pass smtp.mailfrom=imd-tec.com;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51B5606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E51B5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso17159255e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1793023005; x=1793627805; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2GkOj5GONDON7Vlx9Y8BowP7/PlsCg9Zwi4Dy0PdP9M=;
        b=Ln5oe8MaVAIjRmSq+wS00CVQ0mE1zqk5Kl+HHNONwDL/+8h/N5zNyGLfdcBr9VfTym
         zsVI77jFWr/+LiFXD7hBj4+cXEPBQwgQ7BILMy3J1oydU7K1KmnmVbxHV42r7+rNQfd7
         jlHin+ajvQynYAG6PITI6nOoRT1ADZ3xiZnNOJSIczjOXTq1gTKfU2j5y+W3NShNBRfO
         WfKYz17ryVFcboPYo4LDBJb9ggsMT2JdueG+zAUkQk5FXgSy36vcyiNCdbpZFA4QmGuz
         8QkB/xbnDgBQhHiynp25EAouSFD89mNme5SBvP5OIpvLMmK6ybn7KxcUexTJfA34VbNw
         5k9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023005; x=1793627805;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2GkOj5GONDON7Vlx9Y8BowP7/PlsCg9Zwi4Dy0PdP9M=;
        b=Upqr8xFBSnV1zx/5EGXDjDrfduHFjleimapOz6BfdMlEgCxyBC0Sgs2brAbcit0sNS
         zI1pWO5ek9fqgrdaTUxs8vtcKJv8Bcn1eZ+NKqcU41AYkyJG+c8+Y/G6hFwxnFD9bEFx
         K3YCmqUk6SLUPIs8227d9lRJY03D/MJsNoIV342laRL4l4V1TFBPcI5tB7/aWZmNXQen
         6UgkWVQT3AI0VExTenCyBGM6+L9rtcvTJZCujlic8WPYeZFtOMt1GSZ4GqB8mWm0fq9u
         NWRNjIit6z01e/3vmaQ0VzAOP/4XjJ10oJfn+o25Wu0ovXCvCviMRssxjHI3omS5/Rzx
         zCkg==
X-Forwarded-Encrypted: i=1; AKwUvBzObiMuKXmMJ5a0WiD+msFAn7qH3taluqauFn+1jpLsFZK0p5zneZ1DXFQwRxvF8+m4oYAhq3V45WHTMy8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJC5Lj8uZ51lQXdTiuo0VaPl52wPwI1y54+cjgrlEYbuPtMdal6
	PPm8xH7KhNMlA1IkADqsaH7CsCu16slMKZtDw8itYzvTDPEnFNH0ZGzgIzceVe8urfVN9+lsAhO
	+RDq8yGx/Sg==
X-Gm-Gg: AYBFou12evv2DY0RdVvxSu1eO0YdIsJBO25LskP5+hqDexSdxxlPChvFgGDMmFuXzcP
	cO/huJLfGb4xsuHyAEbqP1MAx/yeMazM1JXhwHF2rTzrkcpFoJNumrL33+1F86GvdlomKaEIY1L
	AKjRyTfa60K93ktbd3VzkuvbxGwWdcKho2+6fZjYfOCLx9l4u8CImTgWXl152uz0wOOguwF3gDj
	PpoRaWNGKt6pYOClus4ackyKzwmWT+BGEY6YGZGPffVNJKs7sY2TOTc1BdpdsGX0vDgn0sb77jM
	YlnkLT7vq3kTpLM1a5Wmk5u7Dy12BlFMPfn8DLYfGQ8B0reftwUWH14ixK57pGKPi1+thC1fRUn
	qAvhxDv4Yh2vkkXVE+0d6bcoF2G/63MmylpvTNexRDG3kwDfv/yNH3f6/KNZ6PCqTVTFU/QHIt+
	7Gpl9/JUMtjQN4NNMMDMQ/ZNMUnb0/JISCd20nYWTUvsQfSzNQvav5WAEsieVyjAYrj9NqGmAVL
	ETaYFhhyT0WT65Ix1yrJY28xwH0sL8ng+GST9UplBypY05twFLeO0K6n7qxE9Jy9AqQPmdy95MB
	IIMA79f3na/LPiDuUcWNVWY81JCwST3yOK/IDrNgy5KpbyGLvLlfCmxZCsZZfJmpvekJ2qtdjf2
	RWbgV7qJXyyQNu/DgJSZeWI4=
X-Received: by 2002:a05:600c:8b66:b0:4a2:a8c:22b0 with SMTP id 5b1f17b1804b1-4a35ac3b3d9mr120893705e9.1.1793023005302;
        Mon, 26 Oct 2026 06:56:45 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a0e2sm245169285e9.13.2026.10.26.06.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:56:44 -0700 (PDT)
Date: Mon, 26 Oct 2026 13:56:43 +0000
From: William Bright <william.bright@imd-tec.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] power: sequencing: pcie-m2: Drive the Key E SDIO_RESET#
 signal
Message-ID: <at9cGzb2p4VB8EfW@will-Legion-Slim-5-16APH8>
References: <20261026-pwrseq-pcie-m2-sdio-reset-v1-1-02ecdafce518@imd-tec.com>
 <at9KREB4Fyf-Jl5S@debian>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <at9KREB4Fyf-Jl5S@debian>

On Mon, Oct 26, 2026 at 06:16:38PM +0530, Manivannan Sadhasivam wrote:
> 
> Do we have SDIO pwrseq consumer driver in mainline?
> 
> 

No. MMC still uses its own mmc-pwrseq framework.

> You should not add GPIO control to the pwrseq_pcie_m2_vregs_{enable/disable}()
> callbacks. You should create a new 'sdio-enable' and populate
> pwrseq_unit_data->enable/disable callbacks for the SDIO_RESET# control.

An sdio-enable unit wouldn't ever be called until MMC gains a consumer.
Should I add the unit anyway, or drop this patch until an SDIO user
exists? Maybe I should switch to working on this first? But it looks to
be quite a big task.

> Please take a look at the 'pcie-enable' unit and W_DISABLE1/2# GPIO control.
> 
> But before that, you should explain how the SDIO consumer driver is making use
> of pwrseq.
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்k

Regards

Will
