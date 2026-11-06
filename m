Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984477;
	b=3NYITnWPStxWNamNRolTDJQx745sGxjZ6s2POZmqWaWKQg0CB/fGPovjnsAe4zgoa0JS
	 xaQpyWRuoZAJsETmak2QHis2+e5J5cgE1N6CNXfFwI0DnYci8Nbeb4+95aMz/bW6ddkrg
	 iAuRhTS234HmFeQALbCEmoXWxdA2BalQMqPE7Oz7Jy5VNytVReWXYRdgTH2C0YNxxciZ4
	 hGhkh+S5DGunkMQZSQphjAh5N8RGWOGRYyUrvlAEh2FE1iAd1qyj8Y8NX4SQJdCYe0O89
	 D2sJosqucZm0P3oD0EUkUvpaPgRWzRi4GcQUAh6xmg/RKbruHsKm2drEHB42kfw3zPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3okvGIPuT9iWl4myy0QkIT0Qs33y5/YWxTYMyFUZVhM=;
	b=b45sk9cOgIyh4jqDKml40Won5sDELryiY5nWYsTqLJ1208YdTWLYkaXQiO0VHC2z+xIM
	 T6QgMdY30SIoPQDdBn/NeLjyGStomZpnMIcEUqYQrlViUIqaJEskXPB8okkoiiDfdhskc
	 iBnZYVNLX6fjJknZyZRozwa+mCu7T0cMfxyxrUTdp495CzlBpPuWEQY8uFfbvMIwzB7RZ
	 BpngnGpanpErmuOL+KL7E33XaFN+AeZLkVe/ZEAjVycZejMCybmq9a2BUgIk3dRQXg9TV
	 DdR9kkBM9ohzSp9E2VYofYeZJJbzeT/QJuodqbQpnBvSYlUn1VRK6Rh7oTbK8kfpHzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ng3OOWZ8;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA5B606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CA5B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ng3OOWZ8
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4922dbcee23so505151f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984476; x=1794589276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3okvGIPuT9iWl4myy0QkIT0Qs33y5/YWxTYMyFUZVhM=;
        b=Ng3OOWZ8IrmsKsrad6/RsItRavtMbiq19ZqOmOWfNLvU1P+payjbAeAl1898rL6uhy
         0kJP6UXDC5E0M8Hzgq9/diGGQ8nCXbNcDtMx1dSVJWRUJzSoMu0z8H6Odxpx/wt7v6aO
         8KLWIW9+mc2rnCnGkRvdIg8WL6Q049lubnkUaJuqz2dDUIqn7wPpZ/1e81CyOJJDzxbV
         CTXzg2sYJh6akoPBXGAeWqlue9uUNUIwnC/Buw5oDrPPD/WzuiiAgzBpRQ3QV7gvD/n2
         XyO4XN3vGG1k2Bsf4P8HVsZSh8wGx8DmPTRNA9Ma51Q1UGAyLRplO0+mIwySZM6a0K9A
         2HtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984476; x=1794589276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3okvGIPuT9iWl4myy0QkIT0Qs33y5/YWxTYMyFUZVhM=;
        b=n0HHjEs9KCLvaV4/IxzqWI0EFQp1Aphqgv04BXF45FVlGnkJm+pj21JakcPUygM48+
         vhvqdEaeXm62YHSLFAnQQo0h+E0Vr4R8PmRxcHUP26aQI0fv71JanJ6RM1o5NWFTZmRE
         6dlzad0cpgvXxluX4xa9h2Aax2Do01yEa1/Yqv09fmar90dIluqNwT0WgNzUTm/qsxYX
         NIhSew2k3CfOU/xgy/RAcabjO7IFisgHzJLMkm77syLe4+4iS1O9elU+Clz8CZnqwYT4
         b7+6vMzjqCPo1HyBhIt3n7nvW9xrcYvQx5TzGRRzX9Wv3Xr34+12MjWG6uho8FS8MlGj
         DK+w==
X-Forwarded-Encrypted: i=1; AKwUvBzgLGp8WBzRgDz6uYqkwuTVm5yVGpzcGN8wuUgNmsSKlMFr0S6ELoABZwhNejYa3vH/Y/FGKsjuVepIuqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hgtdrS/1NkJ1z0bORdS5QOaJBCdUyneNgoEodRUXV5D1MO/6N
	9k8MQ0CS6E4m798aQICMC7QO99L++C0i6ax9zgrTRGNMhKwAL257v+OSOFKejk3spD4=
X-Gm-Gg: AYBFou1VpJ0qC8SO++kH9o/M36gFt+F8pORMn0UfU3xW3I3MxstN1/JvVzrFeS0uIm4
	3RSd3wiuerRAlu5pe3vPxiZxj8/X/DLvdWjpDWd1QhSFeJMINQ54BIs9UNdp1v1GnNi/zx08Ko8
	OWfJ8bGmREdiwLy7RTTUtAJa4B9G0NdOilb/zcUd5rIc4/hff2Z1G3MZd4CiH27668m3vWLxwHw
	apjGzQrwEvGs0lIMP5DD4V2d8z59fxf2rMNsPmMjYkjSAvhLHGsmyl6U/EgVvstfVnnzMfbK+BV
	3ZjA1E5wvCT3iiblHv4UZdrJu8dwadHa3JEZN0gnVz4wD5tTy0J+MDAdYD5fVJHqq73oEXUoe7G
	LEFQx9IeGCicioq5YyHtI8TFE8u/qEvw0BhR3740edU0U/POOSa3qIQj7cdk7KODMgsTqjLGFwo
	PplVlHcgBSIzepv5wg+7nLcVNWMbXDIqD6n0+Gv8rE36hKYxHRdyBinmudtDCL4ioUzzKKP7Qnh
	LwEjsBkvY0i0PKf88OkjzGotm9lArmPDp4j6rnLqUL26NWFHsw7tVGtWcBLV9a71wBILg70rE/K
	c33D5XNnerfj6aLHIcdox4YXz1HQMHFCBg==
X-Received: by 2002:a05:600c:4e8b:b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4b6de4a6fc0mr55956715e9.11.1793984475474;
        Fri, 06 Nov 2026 09:01:15 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-492d809ddbbsm4804011f8f.53.2026.11.06.09.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:01:13 -0800 (PST)
Date: Fri, 6 Nov 2026 18:01:12 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
Message-ID: <au4HsW2aMYKyMspF@monoceros>
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev>
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
	protocol="application/pgp-signature"; boundary="o4uxavg4tbipdm4x"
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev>


--o4uxavg4tbipdm4x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
MIME-Version: 1.0

Hello,

On Wed, Nov 04, 2026 at 02:21:18AM -0500, Joseph Telaak wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

Best regards
Uwe


--o4uxavg4tbipdm4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruB9YACgkQj4D7WH0S
/k70YAgAhxWSI5oFd+bG1IqCr9QN4qV0nHY8dR0wZt/s30JOYWejw0raTnkHbfMt
1cLN0THKoG3qMmY2yzVpFoHtreyYlcQK6NcK5fqhPRSFwniSgluT/eWevLV4H6NN
oVxFxC97OUD3EpjECtS4q8VTVZWg8kFbqxwARQl208IoayGOXIVNe9/A+/U1rHTJ
DNyJB0xyoYCnDmd0WA/wYkSx6HlNHUbTW4aDPaR6cW2G217wQnIQBzsnb2dUFn9S
q9yhYPN09un908r9vZU8s/sz/mY0bppEUg3ak/jVp1gJfu69jFo14DiN74abx3Ui
N6+6B5mC+kJGbjRTDMCieCzt0cZHEw==
=/RG4
-----END PGP SIGNATURE-----

--o4uxavg4tbipdm4x--
