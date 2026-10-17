Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507001FCFFC
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792216520; cv=none; b=N0dwDKxOYtGfTzwzLKAFsZ6ju/VWkEfgDNzFMri5p6dbu8QsKOHJDoz5i6OvVqDpvprGgL6BJPS5HJ+VYnVBqMrxQ4oSe4fPD/yjSD+BxDKA842RYCGztoSPxGJ8yMcODYDpIKzfrX1zXcKxUPuEemqwSrY3E/gzazAeRvlLejQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792216520; c=relaxed/simple;
	bh=4H4PumMFOkWTL8QF40HV7GYJCLyqj2M1mR7XH7UN8l4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EF2B95gYWAqvwb2bf4bVG+esX04jKU7j9R+FbMGQHIa8h6ATT7jc4wOzUadVooHVbyz0iBUuCgHNLYrKAHUJJ1nznr9dSmYxwWkyAK0Qc3SGTXA4b64OURrvWftIa8J/9zpUYUo422+M9JWuf/cH4tl5eWFmEcW/e+qqM1bU4Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUfnqNsl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUfnqNsl"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b0584ad71so281286f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792216517; x=1792821317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hyAOm2K0XZGAzKdD2fYYYed+loFddeRK4BJxeSnK+7o=;
        b=kUfnqNslcr1EuMTkiq5jDWkcpDyVNq258StXgmZlxbz7s4wvo8GjtG52NhhxllEgKq
         YMJHOE87hL/hRZTp3IhORgu3f52L1A4FZ3Z2+qRfyvQh5xB0I6QxaxHQlUkxs3c76Ajy
         MiVeacNpRvD8zfk+CzPSxRYgFR7uPzD3nobB3nQy29lGvHCVxBRZpqztBbarpExEvZjh
         7XvtQjfpuFxUvcLpKjN5sb8U5UEjT1k4PhdfRs4BcUgIbxAFufSsdRAahXkOfcanYgwB
         K9UUIl/YfNYQYxQfdvTC2poYnsiyIMt5HFcVjkWj2/7QXTb2vcK3o30XH0r/mZAHWx7U
         pHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792216517; x=1792821317;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hyAOm2K0XZGAzKdD2fYYYed+loFddeRK4BJxeSnK+7o=;
        b=O4V4Q8jbr6ILS4D95BFATW0bRYqOJ0VqfJo/+8hGEj0hHb2RhEnh9lygNlNzxJJGdm
         hWSSDd2e3vE0T8jt+6cV6KNHJqwJEGtLlxIedHmyXwGiu7ZvwIcKWz+lTgNwDC0eKX/V
         N3ocIno1MkmqlCHSA3Hw2yp5UfhFe4ul9FZ28inQvQepesJi0maznN/3Jrk8E3Hvsju7
         SeOHH/qjiN69qEyo5b3kgwhxmYA9WSNZk42MQ+vLEz+4KtxjcOAAc/Txh8uhP9sRTSiO
         jCv4utJUYFhfOka/mrapcH5+swIwRdV4IVy3UEUQQPRl0rkWRURcwiV8WKYOWzP940WE
         vE2w==
X-Forwarded-Encrypted: i=1; AKwUvBwFajzKsZvBYJ8QVA0ybwY65UHm71AKHeEGwJNmEFvHFambje3lYkXtyzFBk8969L0WG5ZbTeMi0xcY24c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgCqVzGsv3OdulEcoewm37JDLtw1d11Il9PIhCmbJbhaj3nxZW
	iDa/TnZ1rLAXkDsSMPZH+SGMzX4FSxAH8zeBgTz0EKZDJNArlY2+OgBf
X-Gm-Gg: AYBFou3GJCsj55qUVw3XUPxW7/VjfzTuGPAIO88nnEzOD8N458ik7RLib8v8a9/OW9r
	4IPjE40Fp5kV0Cz2pH1qVOCyWGtA04aytolyueJqrJSyZ6nlilbAS9x+Ln+EUQW/HC4kEMqSVI2
	n+rtNTczgiQD2ELtGtGGAOgjihpVjDB9QQKnAkEUa6840uPjSiJ/LPmd8y8w15CbHcW4wuMo4kY
	Bep1w/vzV7NCv7DhS3ZhbiUTRaujFMbrFQJruRFexdCq0R5FYe65L0rhtPK1P4DObE7GLjvDQDw
	TxhjntOA6O0eolPiKCnSP1yx5HKlUYLKex1pSfhPA2IdTm3XQVyUVe/272HZz8lqyN0rsaY37c5
	dDc8rV4rT+jLVnAWdtdk337Qq2ESO6d3RlnMHZ8m68OHDqeErAGGE354gFkWknlNN+y//jKBZKR
	u9D2Um2u6P+JzrKvb8fd7BYN4mN/dSaUd3XcpdIjRLMw/0CgcNMsaB4r4vguDQHq5Y7ObT1g56C
	ba4bk7aVe/uxeYZBj3+gPd9juUyoDVPoCKACqaqyISSw3MbguqKgfHT25PkfSm84NmsRpGuyMYM
	yqYgYbMlt79+QP4zR3NigSXyJPYVIrJljpNO7SWuVMgdXAyaTQE1D2PzU7flDh334d7I6L9BEbF
	3BDOx23Z/wDkv8w1Q3r7FF0qLsJLTL5T9VrqQp0Mj8hIS1tmk+vPoBCZbkM44EHHmDPvm
X-Received: by 2002:a5d:5e8e:0:b0:48e:932:af01 with SMTP id ffacd0b85a97d-48e0932b079mr2213957f8f.31.1792216517468;
        Fri, 16 Oct 2026 22:55:17 -0700 (PDT)
Received: from systembl0wer (109-81-110-61.rct.o2.cz. [109.81.110.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfe4d2321sm10443937f8f.19.2026.10.16.22.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:55:17 -0700 (PDT)
Date: Sat, 17 Oct 2026 07:55:13 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux@analog.com>, <jic23@kernel.org>,
 <nuno.sa@analog.com>, <dlechner@baylibre.com>, <andy@kernel.org>,
 <Michael.Hennerich@analog.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <marcelo.schmitt1@gmail.com>
Subject: Re: [PATCH v5 03/15] iio: adc: ad4134: Apply reset recovery wait
 time
Message-ID: <20261017075513.3a959a6a@systembl0wer>
In-Reply-To: <9f6d78d607b2f9a896513535fefa3329d52c4464.1792200021.git.marcelo.schmitt@analog.com>
References: <cover.1792200021.git.marcelo.schmitt@analog.com>
	<9f6d78d607b2f9a896513535fefa3329d52c4464.1792200021.git.marcelo.schmitt@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Oct 2026 22:57:08 -0300
Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:

> Add a reset recovery wait time to avoid any SPI transfer from running too
> soon during device probe.
> 
> Fixes: e0bc6d7e2584 ("iio: adc: Initial support for AD4134")
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
> New patch in v5.
> 
>  drivers/iio/adc/ad4134.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 40b27b01f126..d555874b4959 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
> @@ -442,6 +442,7 @@ static int ad4134_probe(struct spi_device *spi)
>  		return dev_err_probe(dev, PTR_ERR(rst),
>  				     "failed to get and deassert reset\n");
>  
> +	fsleep(AD4134_RESET_TIME_US);
>  	crc8_populate_msb(ad4134_spi_crc_table, AD4134_SPI_CRC_POLYNOM);
>  
>  	st->regmap = devm_regmap_init(dev, NULL, st, &ad4134_regmap_config);

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
