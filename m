Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420043;
	b=yX6Uqbc+16HFRx2foVfrShBswv26+TIxsw6pWWpSClE4mLVREoXVO67tmoDyUDT2vB6/
	 gV/D5KdDFuXHWzDUQgKzTRm4Ui5SdCDg/c73mGMXLPmO42exZDuJZWEajLsxM4dZvUHfF
	 DCQnfIoUNSpYdKU3OtNWOvsjgyNnPYB4oFQaUxNTqI00GzzocQ5cBc3WFLUv5ZFdMUMLJ
	 JhG9CGaFSMSukUNnBGjUnMIcuhWkXKQzdriBmF/tv41UZvCflsQnPm6DXA0sZEcgoBEdF
	 sSIGx1ypXxWlevs7TP+6BYW1NXL5PiyRzfHDz+yQygxl94k1PEdzZMteq4LTw7hQ3wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gXZUEJAo9ogNRdsof/4yd/DRB/vaqcwMDVHHocdwiu4=;
	b=OpaVxzrzkKCkFXJb4gJPbEIQXW/buWE3JOWhU/p+WamHC72ljKGFcfLTfDiGE936iY/+
	 IzI9jEZ57y3mbIWM3zS26KZAHsY3jdnM1Adxa9VlU99tvsq7cB5ILFnn5XMkWWNY84g00
	 P6+LSSpLZZZYNQz/Q8FxMl09eW/FpsHwM9u4c+xUvsLN4ZNKTDhUlP0Gqwd4fRO8dYllb
	 /wyKyKGQK/MdqWeXhqjOa0XWzJYRqjXnouarjxcIum82jFVmoGNpZ8TKSyuEjD3yRl2lP
	 NS5LMW3/qL3SwGVWS031Xbzf2YNu1CoXhO5KH+aUuL7dy3bhWFkGcEBqJ4qvkBqgSKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLhevcER;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEECE606B753
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEECE606B753
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLhevcER
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so1726646b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794420042; x=1795024842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gXZUEJAo9ogNRdsof/4yd/DRB/vaqcwMDVHHocdwiu4=;
        b=cLhevcER5F0cC1w/qvx8koU/5KEhFGypHAezF5O9BGPPNqIeXMakQ46AM3CgshFBIv
         Giqd0YQJGavVCxRE9Q9DKotrEQFnTzzTJvItuYlhjXZBq+xM5+WNEwhlTdovfwLXA5EC
         mM+hyPnIzlg3Gw79i5YO55EkUhlI6WrGVXTbq7M5o9i/Jx8tNf42NUwD/TcktzxLSwo/
         7me3Op8YcBEwnMQSEHF2BhTC+V+s9/fFQ6Ds/Cg5VDkufc/QRv2WOQEQUafqfwvPrM92
         1uizui1kOGViIYLowAmaZXoxuLAfOFV6yIDMb6B9GO6N1lRu2Bf/NfS0KH7epcbfdYoF
         8pDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420042; x=1795024842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXZUEJAo9ogNRdsof/4yd/DRB/vaqcwMDVHHocdwiu4=;
        b=hFJCXUpUJOjqYjOzsxLPtFbkwP71AyFuQnAf41ZqghVAFGp5Y42Mv/pPM45x+HkqAW
         AwfrskhzPE78CsPX/nKI9vtlMXv2TdvTcFpm73QSSry084me7RC+x3NpMzanreXR55Vi
         fHkH3dnAbRBcTq3BqJSFKGZobCRNO6mxT1AzyKmvScVuc4ek7ZDV+3l1anNdq6Ib9K3r
         S5SPMCntJY4ONdbaSi4LbWtLs3VLL/ClJ3b5sDwlNt3PCy2jIuZurCzSr2AQiYb39kZ9
         keD4VvJMunhV0SX65M9QnBG0aAO1cLSExjKrubD42mXq/QPotyb3wozN12Sch3/kDI29
         W9Iw==
X-Forwarded-Encrypted: i=1; AL+hErF3Xy4ZSYrXOLtMVFAhak5JKZlvGYcnRSveREe42bmBPVs9kikYrxkD3H102RoNg4hy7Gyng3lmZQMjbT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hsOy1ZhGMVLKUVjRxIkokkg303tVo7dLv7jtITG6ejwTF19Rq
	GiWBvA/Hf3tBIYokigsoLiSjqoNK2cTYkQUYDLs0fPoE40y/QsanxI9o
X-Gm-Gg: AYBFou1bs/2QkZQYps+U4xcsKxTCFUchhw1oEV024BEI8S5JLxKBOIyM5k8/RDLAUYO
	rdBDazcqj5fUHsYEL3rDcCRSR3Iwhhem7e2s89aeQW3TX2vPmAMotRQ/rMnsgH5tupWyUze1iIQ
	FT9whndJbyagbUx8xs8TPw6D59LluMu3znLliKpfz8wn3COwwo/9LWNBFsu3PZyuiDRJ2QcKZ2C
	LiCzFyTTnP9BgTdWjx/dM+G01zlCYOgfybSLJ/TM1FxcK0U1NSLsRTJdTujJ2ZvtjXqfroXb8wD
	f4hTtISTftcsJ3HmtzwtwaSzTquF+54mTV6OTpOeScoaozIFJoQ3cj740wUVrbl91VY97ubYq8p
	yXpKJI+qYjo/iJP9fYMWaPQ1xoILD7RB/iF4uGEWu7OnjXC0HdSfaowk4U135VGCjqh+cyoFkxp
	UrowSXr6vIuMzl23Qvy8Uwx4HYgTSOVK2zDctF9MNJtnPtZD2COeRqQCh/6Tq+KNxrheG2WSN7i
	7BwNirT5BXlPKpdJmycyhgX2hXGVV7FDMAUVuYq5EV2tJCTRAPdW3MDwsU5RDrj7I1zc9A/iEiJ
	APKjkadQHb3WeT8cAMItR72Vznh35t9LTReYdgXQaQGMFuzVFQnTQgOmC8JR0j0QFu568gbvKPg
	V1NVUNgQWYaCo5zef
X-Received: by 2002:a05:6a00:4193:b0:89f:9ea6:1ddb with SMTP id d2e1a72fcca58-8bc1c0b732cmr2911078b3a.23.1794420041911;
        Wed, 11 Nov 2026 10:00:41 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3da61sm2331243b3a.35.2026.11.11.10.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:00:38 -0800 (PST)
Date: Wed, 11 Nov 2026 10:00:35 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Henri Ommer <henri.ommer@gmx.net>
Cc: job@noorman.info, phone-devel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] input: himax_hx83112b: Add hx83102d support
Message-ID: <avStFjE4coB0C0q3@google.com>
References: <20261111163354.36751-1-henri.ommer@gmx.net>
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
In-Reply-To: <20261111163354.36751-1-henri.ommer@gmx.net>

On Wed, Nov 11, 2026 at 05:33:54PM +0100, Henri Ommer wrote:
> The core functionality of the hx83102d is software-compatible with the hx83112b. As with the hx83112b, firmware flashing is unimplemented.
> This commit also adds support for touchscreen chips which do not have a reset GPIO, like the hx83102d in the Samsung Galaxy A20e.
> 
> Tested on: Samsung Galaxy A20e (SM-A202F)
> 
> Signed-off-by: Henri Ommer <henri.ommer@gmx.net>
> ---
>  drivers/input/touchscreen/himax_hx83112b.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
> index 345ece27fe74..04c9c6aba396 100644
> --- a/drivers/input/touchscreen/himax_hx83112b.c
> +++ b/drivers/input/touchscreen/himax_hx83112b.c
> @@ -7,6 +7,9 @@
>   * HX83100A support
>   * Copyright (C) 2024 Felix Kaechele <felix@kaechele.ca>
>   *
> + * HX83102D support
> + * Copyright (C) 2026 Henri Ommer <henri.ommer@gmx.net>
> + *
>   * This code is based on "Himax Android Driver Sample Code for QCT platform":
>   *
>   * Copyright (C) 2017 Himax Corporation.
> @@ -132,6 +135,14 @@ static int himax_bus_read(struct himax_ts_data *ts, u32 address, void *dst,
>  
>  static void himax_reset(struct himax_ts_data *ts)
>  {
> +	/*
> +	 * Some versions of himax touchscreen chips do not contain a reset
> +	 * GPIO. The downstream driver only resets these chips for firmware
> +	 * updates (which aren't implemented in this driver)
> +	 */
> +	if (!ts->gpiod_rst)
> +		return;
> +
>  	gpiod_set_value_cansleep(ts->gpiod_rst, 1);
>  
>  	/* Delay copied from downstream driver */
> @@ -349,7 +360,7 @@ static int himax_probe(struct i2c_client *client)
>  		return error;
>  	}
>  
> -	ts->gpiod_rst = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	ts->gpiod_rst = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);

This should be a separate patch please.

Thanks.

-- 
Dmitry
