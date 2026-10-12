Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CCC40F746
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802662; cv=none; b=h8b2KqX1Jh5y04yf+By5epgMutBF/XEtQLo3rzfUfMN2+p4ePixCF/uGjCpxAnQt2PPKyo7s8nAS+FzzUMIxbEEa7W/qHCXWuUOnSr0hKG+ToKPLmo94nJ1Mx+0hH2ZT6YXJXcFiGDAvLYx9QC6Eqoc5BrvHcMBrqI37J5PwwKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802662; c=relaxed/simple;
	bh=BDqmE2ovCASMLGpvn0PIbmd0++tdc88S3TIXBLKQRbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JP+s96KaSczf8F7IEWPZGMFEJrQg7Ebz7hFL62LbP3lKLezKKPMqGyXfPJzvMW0sniob1llOkMPQqjAWEQUDR3Fo3CjxRwdgBoVAdVJz2L9AmPxrYz7P51nLCmvfGJe8qfFx4ku3JsPROPM/IGUty45Tla7ZrHHzMlQKKczCOgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=c3DUoYg6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="c3DUoYg6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so14752125e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791802656; x=1792407456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RLup6P06ESS7erm0ADUuu6e9Di2cilyz4zC5+dpI2eU=;
        b=c3DUoYg6LPcnSwfJ9IP9UFG7dMc9d6cAdw6B+Iy9+LjdNdnSS46nitKhEWuwsWAC74
         5tbFsTgKDfSp7OXifP9xaoQNnLRJp6kZqmlyNcAAasMOUbuANEfUYtmUbIoteDwiXGSk
         KJa2Nu5OiofBgnUMPu3FBGnF04P3ee42wYjO8qzLeWeSpzkrAXDIeFXGEPZmegFaMWhf
         bxIcCj9fJL+VsCwerMoyoyehrWcKVU7VIF3vl2ZbZ1DIAc1z50PoSaPscxFhiR9sOAYW
         vuzfG06DvAdMGH85P3zSr5aUkgaL6wvNPocXZDpWNoTXi7CLuKNijrLaZmoXcx4Ek4Bq
         3LQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802656; x=1792407456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLup6P06ESS7erm0ADUuu6e9Di2cilyz4zC5+dpI2eU=;
        b=fKcLVeEdaPeldkBfrGcYA6Ux+2KpIG0rtvduK82JaoVA7JGcmsZXxJ1qduJfz/VtqE
         JbM0C83xkPlXGholfCqBn2qG6tY2gpQWTfJo3Pw4b6zgeoDZNIMEKo2y/phaYiZzxyid
         APLTIWW+CtwSvu+wHnhn0p0U17L+Pfj7Pvtq0Y25HjGDLTEoqgv8tJYQXft7EmllprPC
         oQ9jo/x71ADXCaEKKgPgWNs16A9yS9OuANZ4dKqY0Y6JIWDOKL6JosrDzamg9y0Uomr9
         TqoudaNJ96vlYI1B+ZKjoYhwseIslK+6CsC2PIFfswHO2m++A7y/hx/GL3d6ZmoNn3s3
         67Aw==
X-Forwarded-Encrypted: i=1; AKwUvBwbEmm2P9ZY53k4kAhp3Q3L7AQJ8TSi19Yww9zkFbfIHkSQJpJETEV8JJuf/ac+cMM3rB54GIoE7iHNlls=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO+Wkdp4Ye3CZWIShXZE7n3J0HTmoFqXP95O7b1viiOJmBF4iO
	jMOVf5SYKHa3+v1amp4GpimiMrdvvPN6EmDd/8VanSU91YH5mOUecwAbna42NdC74VM=
X-Gm-Gg: AYBFou0HgJa8BUzopxgxAwe8aE+S5AICVlmBtm+QMfWdD86C/K528CjvIdwEfSAiThI
	tmslxG7Dzf4+MPisRd3aCp0badwR60IKaVTWOjwXIxowtAu2jchgq4xxnMU0v2L1DMPfxWPOy0r
	ssBjs83BVAg0yZ4SeQUmlKe19aYXARe0o3yDlOn81q7+rQGqeE+hSw1JQ75rcgH33XrJoL+b0pu
	oEaKpHehw0Ny5yWQpAkuYYimpBB7OcITdlYPRQt7jHMwWa4Z9vYnNGTuSTSfy5Fkq4Yw3ejxW+m
	eS96QA5xkN/TxQpRGjaXf8TlBGxeIsF3Gf5DmjDDi1DnQuQk9Lkl7uPUniHkWcR8/865YJxagFJ
	JhggjHTSqy/bLXbp+9Qzq71DZI7NoRaUB555suGQL9TpEVBXFy4PXOilguaBLjMrRneiJEcktUg
	+ofesRPRY9FRWMzvVu1cqW45XXVlWT5NiU2F9Rz78D5fZe6/zw8ZAnRYRMR66ZwYTn2tvINWSs6
	d/LnGnM1F1zBs/C4bCf/rNRAwLRPKbbr8IAewwELfVlTOD9WgnsfL4sRpAwVQ==
X-Received: by 2002:a05:600c:3b1a:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4a18e4b91f8mr158595575e9.20.1791802656360;
        Mon, 12 Oct 2026 03:57:36 -0700 (PDT)
Received: from localhost (p200300f65f19a904ade4f69ba751c34c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ade4:f69b:a751:c34c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bf2343asm525197235e9.9.2026.10.12.03.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:57:35 -0700 (PDT)
Date: Mon, 12 Oct 2026 12:57:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Luna Hart <lhart.opensource@witekio.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Flaviu Nistor <flaviu.nistor@gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (tps38900x) Add driver for TI
 TPS389004/TPS389006/TPS389008
Message-ID: <asy8rKc0bLUo2xCK@monoceros>
References: <20260929-lhart-dev-tps38900x-v1-0-7045c5894152@witekio.com>
 <20260929-lhart-dev-tps38900x-v1-2-7045c5894152@witekio.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jub6o62xngj3zzzr"
Content-Disposition: inline
In-Reply-To: <20260929-lhart-dev-tps38900x-v1-2-7045c5894152@witekio.com>


--jub6o62xngj3zzzr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] hwmon: (tps38900x) Add driver for TI
 TPS389004/TPS389006/TPS389008
MIME-Version: 1.0

Hello,

On Tue, Sep 29, 2026 at 04:04:05PM -0700, Luna Hart wrote:
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>

You can rely on <linux/i2c.h> to provide of_device_id and i2c_device_id
and drop <linux/mod_devicetable.h>.

The mod_devicetable.h header pulls in many unneeded dependencies and is
bad for this reason.

> [...]
> +static const struct i2c_device_id tps38900x_id[] = {
> +	{ .name = "tps389004", .driver_data = 4 },
> +	{ .name = "tps389006", .driver_data = 6 },
> +	{ .name = "tps389008", .driver_data = 8 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, tps38900x_id);
> +
> +static const struct of_device_id tps38900x_of_match[] = {
> +	{ .compatible = "ti,tps389004", .data = (void *)4 },
> +	{ .compatible = "ti,tps389006", .data = (void *)6 },
> +	{ .compatible = "ti,tps389008", .data = (void *)8 },
> +	{}

Please use { } with a space in the list terminator.


--jub6o62xngj3zzzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMvRsACgkQj4D7WH0S
/k5rDQf/ZR/aBJ51FBzSPY3CLIfaH0pvP1Gj2j3CUzW0Vom/XobHRZB1Ti3CNv7u
FoToTijxGUAgNf01mcy4kAsKlH51piW9LmhgAhDt9yk8TrD8rDwuHcGKn2xThTdq
SyUWpDvd1KLJt1BrIbb0XLxVKJQWrwi0T1KjX2cc/Kub2y8u0KMPQmSm1hJnYY83
Dzjl4aJmfNJ8lFZwpV8Dm5a/cJDaFS6fcjmbiqrskHLo3DAJQGTINdxMT1k/y6nM
5ApNcvwdC0zs0csER7LQtHsMvu5zTGaXJhDOnhVEQzof7auCFJyoC6WlaaAWpDsr
sGnCLL/cr+GS8SOeZDlFvyWuLBjnTg==
=0D0m
-----END PGP SIGNATURE-----

--jub6o62xngj3zzzr--
