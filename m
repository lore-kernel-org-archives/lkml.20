Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3C85540AD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924967; cv=none; b=UFqI+OfwS24Y1Ff8+z5PgFlY8116otxpm29wyB1kBeHFsgfBR9gkReKemRI6WxYMPQltqVYilWfxmBNVBcc2LMo/guFLAs1l/IuIlH2e+nV4M6Ggo4OL6lgAXzDXJSh+yRlooU0sxNOIriTGFBm+GBl5dl1uoeN5UFZ9KgCENBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924967; c=relaxed/simple;
	bh=3qWH2koItPy/vbViCZzFcKJYSGqpM60iDvtoECll2CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDSpEK16JqF+aMVdMorWl5IK5D+bRxx1SjhpYWssQaPVMb7cvj9CMAjnpF5jbpr+5NhOZCYYG7iYOAlFgpcB8IYC5haLBH21qReU+fCt4kB91aZ2Rby+c7N3s6n+C3Wkpri5ndyti4ZvKDqbTM163jYiBTKq4jzJM3k8S+WLgjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ly0Grsm/; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ly0Grsm/"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5e507e778e4so1183779e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924965; x=1792529765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6OUQ+zAp4RYn8L595v0XwK+mQR3INz3p6beOnr31+Cc=;
        b=Ly0Grsm/8ftZYQ1MnOEhTnmFCe49RJXFjX4kxrmD9zEUJeLw9ZuD85P91dC3B16XO4
         jaV2ugm4D4pfQ0HbG7qintijVuVpWE4X6gS0izdQmM7erwaTjOV9pJhAE6J9NyjKtLin
         MR4mnLc+qQDCXTgkOYADzKnT3FBXF6lS3I3tcGTbe9/mE1H/v1Ah049meqY+MkzrbjuK
         mIC5CEj9SHDSUyxgi8CNZ0Ki9wuw4dDS2/bIZ+An/Ulj3sA1AgrHBXjST7JPGwm1QyL1
         pPEW4sqfwjlruaTC0oX31JwzQ60XV81fQSAYm6bAw5HT4ghypiD/UNOlm4r+7zSvzopZ
         xMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924965; x=1792529765;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OUQ+zAp4RYn8L595v0XwK+mQR3INz3p6beOnr31+Cc=;
        b=Vf2nbRaiuSFdHxvboKC6/yzVGcmjhA43qRTUnFTZjMubXY0vC8s7jaEJQVCuhNPOl+
         IDvQPlpjBtwMZNIVRCFQuSV2t4DNIbxuHk+M2PvMI8+TL3I4ZnSIcto8jjYSwaImrPL/
         jJQYbrDNoU0wEe3qRydmqljExKutSC7QJcS2rhtU2wJdM9MFX0OqEPxNhpU86LKwlO/0
         K7JprvbTHcdzmoOv3ylFVCj5pcZKS5hMrun/GHiPI65M4mf8IL/A2wvwELkXr8GZkcHc
         XlqXTcfo1eivr/S9nincCHZ+++IsFFmJO2CpR/G5NE4apyZD6jjof4GjJR2G1ujz8J3S
         l31g==
X-Forwarded-Encrypted: i=1; AKwUvBxSsOTi9U5pbqeihNpgIdWvO4FxXJWuy4c1cC3MeO0kZwJ6lIlEQxbULhYDWFe0DvmdgnKDxqk3D9LJ9aw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3UB0Zb8upszpKQbpm/foCVdevGfJykEimwazYMNlm10RGtcfy
	0tCJ2OmWPdnyvx33IEFXhfHvCdTPb9N3KGsB+rzB/giib+DXql4YgVGJ
X-Gm-Gg: AYBFou0ofx99RG64GAXJ5sYKsLLhcL9iWES7/gvBgLQxS8MAhJdLd8PvMmYHe2d+9cU
	MO6fdVAYbvMCutM4aHvdP9Ot2dQwZ6xKrEN3UgnegP2W3p4vgzBaBaJlqxvF3nypjtNK+LmTQZY
	FroVvD2GhcrJF+xMqfZjv3zNJC83lKFiR/9Aqc5K7+wKcYgDXAK61Z6LLAFO5yucn3afJ+z6+FG
	KtoeOV3+IRTSfKLKvOKcBHLw1sBs9jwpngC3/0jZvsv2lBuJkRl5OGCEN4yjJ+/jrtPyFVRadhs
	SPOPJOfE0W8oLYI5BJVCSX605TqSmQUcSyRvmfGg1VHYbLTvXZ1yabZ0uq8qIcDoYkqGbM8d4u6
	ZmskYWcUkHXFsss80vcq6cVcL+dDiTj06CRzV6JJsLBI3Nj/FvJvgkoVwhME8aj7hs74H5G9hK9
	FauVXAP2+cdEcXgdw++3ptw7O24QbS4IPD5JENHll8Qhv+hAfMRrIyW+KAzD/jgrKMcacuxq2Cc
	3K8
X-Received: by 2002:a05:6122:ca5:b0:5e3:828a:267d with SMTP id 71dfb90a1353d-5e91f518042mr4469938e0c.15.1791924964615;
        Tue, 13 Oct 2026 13:56:04 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e962a6e2b7sm1842792e0c.8.2026.10.13.13.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:56:01 -0700 (PDT)
Date: Tue, 13 Oct 2026 17:56:21 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, marcelo.schmitt1@gmail.com
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 05/13] iio: adc: ad4134: Run shorter transfers when
 CRC is disabled
Message-ID: <as6a9WRxHHav-Nq6@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1791309733.git.marcelo.schmitt@analog.com>
 <e46fd2f9b11ff2b690483bc2ea6489b6d145c773.1791309733.git.marcelo.schmitt@analog.com>
 <sashiko-outbox-162348@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-162348@kernel.org>

On 10/06, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] iio: adc: ad4134: broken SPI read CRC calculation and ignored failures
> - [Medium] iio: adc: missing delay after reset deassertion in probe
> --
> 
> commit 5284b96efc125640c497213951d3fabe580894ec
> Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> 
> iio: adc: ad4134: Run shorter transfers when CRC is disabled
> 
> This commit conditionally reduces the SPI transfer length when the AD4134
> CRC feature is disabled. It introduces a crc_en flag in the driver state
> to skip the CRC validation check and send fewer bytes when CRC is inactive.
> 
> > diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> > index a0113fff4b715..85fa16321d744 100644
> > --- a/drivers/iio/adc/ad4134.c
> > +++ b/drivers/iio/adc/ad4134.c
> [ ... ]
> > @@ -232,7 +233,7 @@ static int ad4134_register_read(struct ad4134_state *st, unsigned int reg,
> >  	*val = st->rx_buf[1];
> >  
> >  	/* Check CRC */
> > -	if (st->rx_buf[2] != st->tx_buf[2])
> > +	if (st->crc_en && st->rx_buf[2] != st->tx_buf[2])
> >  		dev_dbg(&st->spi->dev, "reg read CRC check failed\n");
> >  
> >  	return 0;
> 
> [Severity: Medium]
> Does this CRC validation logic reliably verify the read data?

It would require mid-transfer data CRC calculation to properly implement AD4134
CRC feature. That would probably require changes to the SPI core or even more
unusual hacks. Fixing the CRC is not part of this series and I don't want to
extend it further.

...
> > @@ -313,6 +314,7 @@ static int ad4134_min_io_mode_setup(struct ad4134_state *st)
> >  	struct device *dev = &st->spi->dev;
> >  	int ret;
> >  
> > +	st->crc_en = true; /* In minimum I/O mode CRC cannot be disabled */
> >  	st->odr_gpio = devm_gpiod_get(dev, "odr", GPIOD_OUT_LOW);
> 
> [Severity: Medium]
> Does the AD4134 device require a stabilization delay before interacting with it
> over SPI?
> 
> In ad4134_probe(), devm_reset_control_get_optional_exclusive_deasserted() is
> called to deassert the reset line. Execution then proceeds directly to regmap
> initialization and SPI transfers without any hardware stabilization delay:
> 
> 	rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
> 	if (IS_ERR(rst))
> 		return dev_err_probe(dev, PTR_ERR(rst),
> 				     "failed to get and deassert reset\n");
> 
> 	crc8_populate_msb(ad4134_spi_crc_table, AD4134_SPI_CRC_POLYNOM);
> 
> 	ret = devm_mutex_init(dev, &st->sync_lock);
> 	if (ret)
> 		return ret;
> 
> 	st->regmap = devm_regmap_init(dev, NULL, st, &ad4134_regmap_config);
> 
> Without a delay, could the first SPI transactions during probe drop or return
> invalid data, causing initialization to fail?

Has never been an issue during tests. Though, I guess it's easier to add
fsleep(AD4134_RESET_TIME_US) than to keep replying to bots.
