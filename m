Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924785;
	b=mmtRo50Mm4wqTLeha4kGmXzsC+8kdCrtqo/9Gj7Lq60lXbp/Oitc4sWu/EhQIYI9dg0K
	 Vx8LTSJeqxh9ZSKZEWHHLaZvzywkHsfR4Yxr8WyrU6N2qUQgAfoy9ac905BPULo+Ho9LL
	 5QjPiaFelOh2quwNq0yMJZmc+yoJEA4c90HtPbyBVSrmVEGkkBUBJT0ml77H5LnWgB5kc
	 A/iiA/ZQCrcIcLjHq0dG0nmYZwUXXp2xIrU9a7sDUk27e0EesnbcxAjf9zlxznvbQ6KOg
	 S1gqYHw3cOR2QheLC2R7VLWtNEB/YvjjMhdClXpsndt6kIWz84ieW2FAlyb4PxQUZzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pwhU5roSaHFRmTkL8SmPuGAOJLZHFE5ayvEMpfmDJ1M=;
	b=HXIe+da0DJluQ2dzGnDr2SLZ6SUHJW7SBEwhXK6xAoIBKaIbHSMAJXk7Vt2K36U2TtMy
	 tKXHFdggWP44amX7DZLW2iKjZxzfQRt7wRV4bM9Bwi7bMslcz1050EvY3Z/hY2QiSqKj9
	 fVzYaCekcBdlNIgNc9PkhBZrgILdawSSX2zDxx++iuK1jd2Zk9n3rrw/YwSViKividKXt
	 I3rb36RfXczbNE3bcdeJwoaVsmwF4uUeVAHVPZI+lxoVjof77yQ0+qoEBu02nHb4wr7+V
	 8rRMd96iPYmZWu18U5zY7VdBzL3/iehv1Myuen7b5jMzKzAh6MaTWLa36LFl6mIbOyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HXeYRNQw;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AEA606BD07
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51AEA606BD07
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HXeYRNQw
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4cdc606b47so823460566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794924784; x=1795529584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pwhU5roSaHFRmTkL8SmPuGAOJLZHFE5ayvEMpfmDJ1M=;
        b=HXeYRNQw68A5m+f5HpqGcQM3nAkmR9hnryA8VAbmixTeGh9edGpmfwOQzc0deaxigm
         FPVXoqNC8PWGV3gEgev/bcDGK3Q5TEawzcufRBXkEF2CfXiFZAATW8fu9IQT0Ic8R08l
         duHh+jtkiYZWEN8k3P4LeNEVN9o/lThzLMDKFS36GxE6ECIVs856snuJsXNrOkdxcmas
         1g3MS5Lyvrf+FowPlUlXXVziopujPSn0scOL4YGrc4Xd5luF+C8IEgYpMo3zlLx63fOx
         en8yw2iYcdIcV3PRniQ+8E1k5ao7aCUKuhvM86/RF0WFUXyQtMJh8LLB6PguOsaVAyvk
         Xm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924784; x=1795529584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwhU5roSaHFRmTkL8SmPuGAOJLZHFE5ayvEMpfmDJ1M=;
        b=WtFdqKSI4MR1wmsAERk75DujLIXHEA0wJm0eM6T3JaN8+s7SoceYsMr3qbaTB5vWbD
         pB+zqmXgFElzorGAG/fFLpPWTSm+QBHymv/phyIvdqUW9AUpzoL8INv2694HnPz2JvQT
         /PU15N2/qMUikNgtn2fBYe1J7kXcufMCJBT27jEwmVcFIIlPyw8Js/afJWCjHpYQfKhx
         hSz/2/zMMpx4f6c36r6gbNmHIgDmpTb+x04SFpBzidWq0axN0tAK7v1PCeKsni+hFlT0
         o74AL62eLLjYROJm/zgs4hqLsRUZtzOecqRxI+zvznQkdzwe5ymqiOMHzpcKrYTliXnM
         f/yw==
X-Forwarded-Encrypted: i=1; AL+hErFE5uL2BZMNH7Kz+RjtAmt77XYWzbK9XN6kXRWv575+DX2tOszJfzFLY0YwxYt4QhTD0Unm/igVF1+/nPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b7/xAZxqOfDuZQ07wxqFpxznEZg+Zt/QDM6tuD6ei65TEj8Lx
	NP5zM7OcRp2QreR9GdF+f5ibOpBBG0ztOeuIBfDc16U5ZoJCYAJzcf3PkaPRDf/5cBk=
X-Gm-Gg: AYBFou0l8oXeAvDm7y+bxkcp2PpsQ8q4OzGrBj4zV+cmY/+VAy6tZ2v90HVJi22j4L9
	+IfgpWugb1gHc+/wIKDhPqaA2mEbLQpmwm44KM85jAFXMGhF6QEMIvTHQHwlaRhP0R1vw1BrDN3
	kxsNlRwlhTY44G7SHly5kZOtchqvMpkfU7pNqOjlLWxaDHzOxAp2ZuPdkey8HC4nPQAB84PDTpM
	QHZXxl7FTN/nd0O2K8w+ciAR+RDxiwMT1pDlouNDw+MFlSZ6iWp2C/W4B5VMo1tSAp3RR+R8yBr
	MULBGLdaOvlxkOZlan5CQPU6746fzBERkQJZ9VaOIN5xJCXMpWktD5JnFXJOY2KsGPKw90CZDbO
	YEYe6q92QLkin4ZhBkz7yWzuKX7IPDeja4ndqQz6APGTGYO6d2n9glg7quIFVBzklw+pl4cjMz0
	uDBc07kChLfriyHiROtpiR/w5myon/uzb3tx19rmw5ZkIJqzf7cQZbnsSxcCycfjGdxOVM3EXUf
	Fd2iFC3c+BFCmZG4LXZXvXjbNTchE3LytgycKZmthix496PzNynKKw0Hcjg3bwaqcIVM82yMqEK
	RkvCRZ/clXkCb9e62BxdaFLivMGz4U9CNuORWzWb/xBOOnJ17qRocEddZtprc5Nx59ql/eBh2zD
	j3ODvHUOLNTIX/nZQ0Q8Pw7yj3nTRiDxaefZ2
X-Received: by 2002:a17:907:6d08:b0:c34:e9fe:82ed with SMTP id a640c23a62f3a-c50963d803amr1154764166b.28.1794924783580;
        Tue, 17 Nov 2026 06:13:03 -0800 (PST)
Received: from localhost (p200300f65f19a904a5ac91f50e61369e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:a5ac:91f5:e61:369e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c5095b42480sm554754666b.36.2026.11.17.06.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:13:02 -0800 (PST)
Date: Tue, 17 Nov 2026 15:13:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Volodymyr Chapman <volodymyrchapman@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, 
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: i2c: Add Sony IMX175 sensor driver
Message-ID: <avxghetYnw4cMzDQ@monoceros>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
 <20261116175151.20150-2-volodymyrchapman@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yk5ynk2fbcq67ijt"
Content-Disposition: inline
In-Reply-To: <20261116175151.20150-2-volodymyrchapman@gmail.com>


--yk5ynk2fbcq67ijt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 1/3] media: i2c: Add Sony IMX175 sensor driver
MIME-Version: 1.0

On Mon, Nov 16, 2026 at 05:51:49PM +0000, Volodymyr Chapman wrote:
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. <linux/i2c.h> already
provides i2c_device_id, so you can just drop it.

> [...]
> +static const struct acpi_device_id imx175_acpi_ids[] = {
> +	{ "INTCF1A" },

Please make this:

	{ .id = "INTCF1A" },


> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, imx175_acpi_ids);

Best regards
Uwe

--yk5ynk2fbcq67ijt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr8YOkACgkQj4D7WH0S
/k5y1Qf+OUVwH0rsGj/2gGo5J7ZQAl3fbtha40ZCFyB6EPF33IgI6wEfhKe/QjCv
jxF/n/mCkvgddsUdiFRG76OMPUyguHq3EVTzK8ULs9ZzcjLEYLt4vI87yAcgkISM
flKuKZh9rZ9Xyk/Zwy36taNqMbjB6lK8zpx1zLop5FthwvDvpYhiLeiyc64XXgCd
hNLM4MTT4s6E8/syfX7XYyZcgW7i5DieZDEKE0YFUD74MacPeGa2bbXTMeti2FoM
M8jBI1CHmGcyPJEgoFN2c0sy18MzqVs+yqM/PEyr6+oN54Q1NA1/22Mx6zV6Wi06
uiYps95UlTprmxCHkXhX7uVYug+nBQ==
=mGJq
-----END PGP SIGNATURE-----

--yk5ynk2fbcq67ijt--
