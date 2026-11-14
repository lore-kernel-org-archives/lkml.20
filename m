Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676757;
	b=bU+TpZa/RpjON1xrh070+4VTcH6sisjlo3Mx2hHq1nDtjQsE6gUXZh6TwTDbSqy0DRJ3
	 vWmuYDJASrvK747jbgv/Xe6PJgwTDO43e+X5o/g0FdkmQgeDX8eQ4D/9vZTBLKxVGecZQ
	 onwE9hoBHggNzM5ZYpBCryrH5vHlNi/trqmvWLUvI4Gd7omQV8DdMc1i567DyklJTE1rE
	 ZILfoyVAkJGULTbVGb/KIL8tcon5k5Ypnf4/va8bdmFhrTIJ0pNNMI/Tc5U4pbAnYYcdZ
	 ta+GpNgcTGpKon/NLsXFaOFTruk5NFVwguXUMobaBmuK8ZkCekIlDPubTsBzMiW2Fog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=YTwcRMSWQ/WwFbflIYFwTeimqUcsUNTJOHfLHF8Dqo0=;
	b=EaE4LXm0Re+YWoUKuP6LqyMNyiuIGkhgY55CZsl1jtc159RxQZwC59paFYhGSGKZto5c
	 CCa4tHVWPRedRqvSwLidEs/qWnMZB9UWN0JuJy/Hj/IhgK8rIiC/LuLb71+wliOgTSdYs
	 ZIGXkB23EQXRgEZzCk/kGaa6OT0vooWGdKw0MGb2/rTEjhjwWYRm9Qcwe3LGg6LHaDsp7
	 vwUNvuJDyMaUBQngLQHc/AosZqgm1In2JRVJ5ezXsRzjcz4jZaTkIIj3sDQJTlPaIBuK5
	 mYLopOvhNlzHathRRtpKPN+tFPabK8mweW7Wpi5NobVOiEsElhQwlw+SLvM6zOyKVCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHw3eyv7;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22952606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22952606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHw3eyv7
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso12084175e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794676754; x=1795281554; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YTwcRMSWQ/WwFbflIYFwTeimqUcsUNTJOHfLHF8Dqo0=;
        b=vHw3eyv7tVnu7ujo/f014gkgAnXfEOQX+ah3pcWkkUpbq6/tPFuCYxNQdUyvHdFjHq
         2anngKr5UUeaxV7xvlr5ZsZMq6lwaam/S4Bwe7WVITK02XSKNI9U1r14CG3Iojp3n3fL
         1DQY2rBZzTay3cOVSvPXlmNOlufTR6Mc7AuAw8vJEgmJU01qccyWgckLhFY9He1MQxRM
         zdcnv7adqnSQQYqNCWVXdfQPYYCVW1rLdOp61m7NbeiOZPBpyAFu+jRBRNk2Gjx//FB0
         u8hsxePhaRe8UACcS0A6UkPbM/uCRbu8JTOBFmSca6ZflsfRhZTUAblYhES7tIEww7zi
         iuqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676754; x=1795281554;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTwcRMSWQ/WwFbflIYFwTeimqUcsUNTJOHfLHF8Dqo0=;
        b=jOjXsGCwtwxEfIkMXNVMjusUGz1Ztjwa88OAjXscrnCNkhA6WtAJnhX2VODHYvbT1a
         nuf8FTI2fwOSpwDgNUiljDTXREnyMpuH33qXuSZZXbBpFsU7ddx5vRypvS69PKLZ8vWn
         KmOIIZOtbCKHX5J0e8xzzY1/oM/zga+R3je85j/nLLudIiWjPrF981zJJJBUSqTiff/t
         MQFQu6mzOc3ipBQv5Jw3p8r2FiEsaXXgTb2MAAVvOJzMETy3EkpjDqkk/Uf+4JfegcJn
         x1mupujME1XpC2eBPF4NFJG4EYGODlpbnUm6dPHe3XmCVfdxm941Q6zWFyETWT8RfWgh
         R9XQ==
X-Gm-Message-State: APuU4Z8KbwlGl2O0SHSiDHuGv+TKkKabsp3R9eC32b3wiV01/XBVUpbO
	oU07m0/r9DBj32jhZPkx+F2s3O7DFW7teCHvFDpnYpwZ5gRz4Ud/p6gC
X-Gm-Gg: AYBFou1zvcwGmJWdOy7j3TIXWccG//f//+3kyu4wIGMMYkKt264k1oYmMFLrsj3dXn6
	uirntmiKqjE8e+Xc6ZkCp32Z4a4r+ljsn8lkBodlSad5I/N/bCXsXBAmknqu8tBGUVKCf1bxSar
	t6kC06ZdwLoTeecEZzRJ2pY+/9cMoME0K9DFg803N+4pLfFXPdBvdKEDujyveAKfZ+VokwtWmyx
	NpsdNAHB6/4w6sNXzHz+WxGOyAV/Hf9B1vkbeMil5UYxfcMXcFUGQYhkt5U6ExFT0KljpvOEqeQ
	NF99nP1HmvSEdTmeNMMkrXS+c5B7DiSH3EgRv5qsc0gHxWXP+d6lz4ypRkEW25DCEPiDLmYCYMT
	aJgmPz0ZPO4WuE9PyR3QTNmiyv7fw9w1iU80x5ARPVgAZ6ql0gjuPsF8bUUAEjpn8lDulX7PzoP
	1ft4V5AoGUx53Q+SNik1wSDPm6440SCIFPdamO54x36Re1bWIpwbPbZk4SVS+v1wLvYaiR7cu8k
	AehYdzI5UnuEd3t0RJTx/DLL/sQf4wY3V2Df0hl/TlL4ygq8H6radx6dHTyFriJaddCjSR9Rzfp
	15+xu0XK3vCmlGdQO+8wOpWmgoGdMrA3wFYiTFEgyZ3Q/i1h2nDeE9kLiAeO9IRPW3KJYEHavUU
	8DtkdpFn4ieBVYDJmogwmrIcey8KeOLSFxDsgjgPm3LEqYpnSM7Jx0KUcPccMUevj8JhaeSH0MM
	MOhJrFC8YGaBH947tlBhP1wvDRdSpocbiO/BuY+t5ggbNu2JwnNJeBE6wO3XtgfL8Ey8AOYWDlx
	sDsIVHZKAULpAnJU+R+kvAhnA==
X-Received: by 2002:a05:600c:5395:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb55abba24mr132258135e9.30.1794676754290;
        Sat, 14 Nov 2026 09:19:14 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm20031827f8f.7.2026.11.14.09.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:19:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Chen-Yu Tsai <wens@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Felix Gu <ustc.gu@gmail.com>
Subject:
 Re: [PATCH] iio: adc: sun20i-gpadc: Use
 devm_reset_control_get_exclusive_deasserted() in sun20i_gpadc_probe()
Date: Sat, 14 Nov 2026 18:19:12 +0100
Message-ID: <lGotwwBTRaeZcOCAphaQBQ@gmail.com>
In-Reply-To: <368d548f-2b86-4da5-857a-6ee9473a8d0e@web.de>
References: <368d548f-2b86-4da5-857a-6ee9473a8d0e@web.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 14. november 2026 ob 18:08:10 Srednjeevropski standardni =C4=8D=
as je Markus Elfring napisal(a):
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 14 Nov 2026 17:55:16 +0100
>=20
> Use devm_reset_control_get_exclusive_deasserted() to replace the
> explicit reset acquisition, deassertion, and cleanup action registered
> with devm_add_action_or_reset().
> Simplify reset handling and remove the custom reset assertion callback
> while preserving reset assertion during cleanup.
>=20
> The source code was transformed by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/iio/adc/sun20i-gpadc-iio.c | 20 +++-----------------
>  1 file changed, 3 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-=
gpadc-iio.c
> index baa7661db13b..070d061572c6 100644
> --- a/drivers/iio/adc/sun20i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun20i-gpadc-iio.c
> @@ -157,13 +157,6 @@ static const struct iio_info sun20i_gpadc_iio_info =
=3D {
>  	.fwnode_xlate =3D sun20i_gpadc_fwnode_xlate,
>  };
> =20
> -static void sun20i_gpadc_reset_assert(void *data)
> -{
> -	struct reset_control *rst =3D data;
> -
> -	reset_control_assert(rst);
> -}
> -
>  static const struct iio_chan_spec sun20i_gpadc_chan_template =3D {
>  	.type =3D IIO_VOLTAGE,
>  	.indexed =3D 1,
> @@ -225,17 +218,10 @@ static int sun20i_gpadc_probe(struct platform_devic=
e *pdev)
>  	if (ret =3D=3D 0)
>  		return dev_err_probe(dev, -ENODEV, "needs at least one clocks\n");
> =20
> -	rst =3D devm_reset_control_get_exclusive(dev, NULL);
> +	rst =3D devm_reset_control_get_exclusive_deasserted(dev, NULL);
>  	if (IS_ERR(rst))
> -		return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset control\n=
");
> -
> -	ret =3D reset_control_deassert(rst);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to deassert reset\n");
> -
> -	ret =3D devm_add_action_or_reset(dev, sun20i_gpadc_reset_assert, rst);
> -	if (ret)
> -		return ret;
> +		return dev_err_probe(dev, PTR_ERR(rst),
> +				     "failed to get and deassert reset\n");
> =20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)
>=20




