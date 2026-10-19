Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441542;
	b=tFMVvRBtikkMqqyHG0hmCushondDpF5KbzxSx/UFmQYpoI39eR5L1AjYOrqqVOiF2cyz
	 cbfUnoyUHVhJ8aSmx939f/qSPG4NxxvS+f7qDynrZsKLBJ4OsPy/xboYJAzWxNW+e5B8T
	 44w9Gy41ZzhF5VXe91GOODaQe+S4DCWfLnJb9hYUbLV3SuQBCjDPLZsdIDsBpKbB7YJff
	 TDpHPKdvrLMRI9ZUDFu/XDeAh9R/S35V6LxQFm+VuqcpREWKrIp7d1lGl63HSPnLhnetM
	 86jYzvVk/Ex0uAWcWbF8uSXOflgBOLSMLNW2L9nzTosq0M1PSV0U/rJy4mt+LAF09SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4CLm7A+8SN3dP9H9Mvo0nl4IugDxpC2FOKJG/azirs8=;
	b=C3r45NNs5YpEDuKcY3K7+44DuFr/xE3WKDgvFnb6TRlQPqzVed5cSN/CPiVzEiayjD6J
	 cT7mFmQDJiMtCqVxStp1HQccdOpOp0w0zF8iChys0uRglDSVe84tT1AMLTgDDJgK3BZTP
	 dZ2yVJffR0qB/lKP8xy37RG56yA9pv7nvUSXWYoVpNLrXhEdnNtZjeB0B6pzEj1h9BaAy
	 ZaeQ2VBlkEB+vvyhiQ/vTGYP4KtkoSE4FVQTj3Vl6O0diVzGLJtov6J+YfhDApDK4OjlS
	 nP+4nSQTLkHzANiXSvl3hKiEqZ+zXfONG+sky55H+udMkjp+J17cYYVEq1qVrIloclg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gy+KoPx4;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF11606A321
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BF11606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gy+KoPx4
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eac9db5905so533085e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792441541; x=1793046341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4CLm7A+8SN3dP9H9Mvo0nl4IugDxpC2FOKJG/azirs8=;
        b=Gy+KoPx4G2FFUdo1www7Snk9hT07C1qiZ9AooZMC8xWJE5vRvVg6Cu7gkXju03RBpt
         4qGGrrzZXhFlbmXH3wqdO+551iMzjGefOoD6M84fd6Th+y3xQQOcAK4o/HzLv5gy+k+X
         Q2AX+SaXfk0+aJLfCV+AHNH/jPfFZyWx/LV4JiRWOzFT6Gc32TpZ9mZ78JzXztsC/kgc
         yo+gfNgYiHHJUdGcqPGqOlhlyaNqAirqFaiVAWTxc1MFXSzC5Z2Fjxta1bYRq62GVxSp
         cKHrf/LJMt/BEcJJsr4UKVAYDZBiB2Bk1Nypc9+uZQZ8MBEQvLzJwNlQyFyFAQtdD3K/
         pXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441541; x=1793046341;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CLm7A+8SN3dP9H9Mvo0nl4IugDxpC2FOKJG/azirs8=;
        b=UoE7ZbPqB2WryrNxRv4W66CI9cHHPvpo8HUhtwBO+7eTKsHKsRMpwuUoAwpevPABEf
         DbozXj0U4U9OnEBC+152GFyBRV2XEmXXZnMhKHadYs3LYM+5IayuRfAZWY/8mixBnnQ/
         7aQT2SHkaxu450FQYS+JazEY9+8kS6CW6P/VE1SafyO5y+AOuE84s2ZPRaQ9WLdBVVCE
         bfilNmkYHVLJgPWmZUyIsbOxIQfHZTbUWQsdOaVenFlw/ePWUyQfL7NBanaqTUY9f1FB
         2nMnA7zek3hbfQo5ti2hNvN3lhfD83Td35RWWT7jwFuSowek233rH9llAf4hxdjx/X4m
         ds9A==
X-Forwarded-Encrypted: i=1; AKwUvBzl17S8+gDaQsoDnjyclRtOJkShZ8YmX++MhsAwXHW8w7RWlohP4aMmCHKDdxkYQCQQdypcSFxDqzJDBX0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ6zRzZhpro2bJslincaOD6SgACvzvZOyFs+x1AvxsgnkJcOxN
	jRtHN2R14uVv96cHLlwAxQ67xHNEV0amjZFc0q9IA3YPKBsxJaG5g579
X-Gm-Gg: AYBFou0JNNmzsbGCcAjQtH7dwR+aM2m/aBCXkeLxPqbtOj185g/nGDj4ufj8Pcv6Fjb
	fgVaLB0XZ3erDgJo2vHq1z58l2Bi9OlSGOt96XJlLrdhDSuJRuWQUOODrMpOs6WLygIzm8IhYu/
	zi9iCbvbWlvPAvKUn1EANB5zwkFYhtfiLtgVFFsO7wMv7f238vp6yQl1/DMyoFqQXR4pSdnMu1e
	MdLTNzarsHIaURo2Y9ir4zwf9KofAFj92geVWkyjtBzfTBNJZMK3ZLyGx5Q3J1g8eo+wB6rZfw/
	ULOA3iGL4uv8eH4BIcbDvcGcC9AKbN4bFLtlf1o+NkzWAE6iNyON6JB6hWTmLtYfRPnPMXulAJZ
	umxs6g26iVhpvyyMrd4RMPBn0cCgmvmCFhoJmATRWWZYVUemo3zYmCGJfppQtobs/Jkl9u/OyFB
	MJDVDifUkEcKpyq0wE6uL5Ff6EF27YwRnPXTgC8yAMCQ1nxe8n/rSo49pEMRHnAuLC+tiQMWuE6
	sSrdg==
X-Received: by 2002:a05:6122:2093:b0:5ea:c45f:6c4d with SMTP id 71dfb90a1353d-5eac45f78ebmr1323912e0c.22.1792441541185;
        Mon, 19 Oct 2026 13:25:41 -0700 (PDT)
Received: from localhost ([2804:30c:4067:b00:a68b:4892:7af1:b51d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b536ccdsm10865354e0c.13.2026.10.19.13.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:25:40 -0700 (PDT)
Date: Mon, 19 Oct 2026 17:26:43 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Joshua Crofts <joshua.crofts1@gmail.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@analog.com, nuno.sa@analog.com,
	dlechner@baylibre.com, andy@kernel.org,
	Michael.Hennerich@analog.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org
Subject: Re: [PATCH v5 03/15] iio: adc: ad4134: Apply reset recovery wait time
Message-ID: <atZ9A4IocEYpZ24f@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1792200021.git.marcelo.schmitt@analog.com>
 <9f6d78d607b2f9a896513535fefa3329d52c4464.1792200021.git.marcelo.schmitt@analog.com>
 <20261017075513.3a959a6a@systembl0wer>
 <20261017201331.5d835dc4@jic23-hlaptop>
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
In-Reply-To: <20261017201331.5d835dc4@jic23-hlaptop>

On 10/17, Jonathan Cameron wrote:
> On Sat, 17 Oct 2026 07:55:13 +0200
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> 
> > On Fri, 16 Oct 2026 22:57:08 -0300
> > Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:
> > 
> > > Add a reset recovery wait time to avoid any SPI transfer from running too
> > > soon during device probe.
> > > 
> > > Fixes: e0bc6d7e2584 ("iio: adc: Initial support for AD4134")
> > > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > > ---
> > > New patch in v5.
> > > 
> > >  drivers/iio/adc/ad4134.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> > > index 40b27b01f126..d555874b4959 100644
> > > --- a/drivers/iio/adc/ad4134.c
> > > +++ b/drivers/iio/adc/ad4134.c
> > > @@ -442,6 +442,7 @@ static int ad4134_probe(struct spi_device *spi)
> > >  		return dev_err_probe(dev, PTR_ERR(rst),
> > >  				     "failed to get and deassert reset\n");
> > >  
> > > +	fsleep(AD4134_RESET_TIME_US);
> 
> Sashiko calls out that this is currently 10 seconds, which seems unlikely!

It was actually correct. AD4134_RESET_TIME_US was misset. Fixed that for v6.
