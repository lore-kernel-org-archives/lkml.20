Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551961;
	b=kBpr64cHk6z78nTyKyJW3LOY8MzIlPIoBqnmCjz24QIc0wIiW2a3x/n958/F4ZyBrbb6
	 K/tZgr3ZrFddQepo1dKk9BxS9cwJVfiGw8OVBG4HOLg/qyYndvNIUaxMABCw6OJfHGibr
	 iBHVe1DUsoQptfWnIChGc5vA5uAAlaymY68U8Ij6FrqW3eeyk4gg5rEBFe4gGGjOy/3uI
	 qE06APwcRFvmPJEoKrAtxi8eJbtaR6EgibxoTmeVXSVqJ/4dLhnnEQwT7iFY+VniGpc7t
	 4dRlhMFaFMgTkMPYFVB5Mh6WfP+m59q2j1yN8q4wC2xHh56jm9WPweWVw0LnvENRHAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9PYy+AI7ISaofzRlAmqw/89jmgnLGap/scippqNlemU=;
	b=0hL6uSHxtaOTVJhfb2i2oufBR6dqu9IrfkpF2kz2n98sssHefUF/YOJ4eA4LTNHWO3yE
	 eab6jTDyD57gcCZ4KEvQkwAiJ3lvUadXLNdCFpsx96tAqvTS88fepPxqqXL1APFXEcAPl
	 MmM07mGuVa9b9g60yhZsF+GchTSYiEQVxRV5n74gGRu6SCVUemwJ3KrVGEFLeLNl0/UQ1
	 5RShLyUIpZOObXBXf9KEHF32oYsL+1LjOXwSxDEW/BFw45PiSjKvEjtg2WOr5mMh0Nvj+
	 RCavgLdmk6SifUS87Mkq1fZEbyiWEf1sZPmesh26njMkMizkNN40ZdGj008nYBBhbnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EZjagDXF;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E870F606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E870F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EZjagDXF
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so3642255e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551959; x=1795156759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9PYy+AI7ISaofzRlAmqw/89jmgnLGap/scippqNlemU=;
        b=EZjagDXFCK0Lo7oDVmBW7cCcjuCk8KiSMHEydT/OlW8HQAD9HiP/sZ4CU7ohuoGLfr
         QkfMqAucR9MAv/tDzZCLc8MYXF7BZamqo+8spP4P+QZnOHR2gR5RYC/ujaCRkjQcFB0I
         gYuLaSGsSnwI2oervcbwErgkqd2v+6vyjGSVXv0txkhVC3BUq3D6MyCBcjmU0LsWI7mk
         r0zNwasI9g6yncFSdbs+7hzh2L9O3N2u/gis5qnQOChwAxfJjlK+mxu52KVzJAObVuMk
         SA5ae+tCgmAelr++YsRnu2zv79byx93dzB1hYoEM0dv2XVJmV+N1WubJCaViWnE1GoRb
         /qDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551959; x=1795156759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PYy+AI7ISaofzRlAmqw/89jmgnLGap/scippqNlemU=;
        b=TDLREN0MN4MnzZP/OyJEYXVEegmmhAVP2cFDZ/QWu/qayxz6pn7AYpDWQ0urOTzKUz
         CMMcZtE36JjGX7sBGcU5QbDZMvq3FvWI0HMm7EI9p+9fvGEAyEbd6TEqt9FA7k/XUOVq
         HYnA5SVkA5yIa6yOObXHC0zfPB0JtALQYJ2gYVX0k0SriGT8M0GYro/ZmRlUmTQhFhqq
         e3yYFVhNZm4FT+qsL2AYEbw8SbfZqXgVW7p54BnG1lVwBuVEl0Foqd0Ow6xszowwQwhT
         2yWYEvQLy6G4zh4ys4JIgnF8kAU5qxrk5wYk+XcrWAmAHGjUnjubFUdvrdeSFwJQq7I2
         A7mA==
X-Forwarded-Encrypted: i=1; AL+hErGD0K2rVr8uToyJVumCaydeeH3Dx/PxOU0afXvh9Vy5OufIzgG+BECYHoWjuuJXqeacPG1rUr5K2NCLuPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QF6Wp2GqyvhdngOY0axiywiaL+7F5P4DwjOf3toKcUZmG45Tb
	RkHAQrT/r5uBao7MWHIEAjy3DaQhRw64Hg2zsp4O2CIsfXVDMATIQuoqX9+yV93IIpo=
X-Gm-Gg: AYBFou0ptkgOC1nAJxEuhEQm5iBl+sUJSKwE8WhHnCkTPtH9OP5ioWTY5vQ/uckiRsA
	8Mv6hF+syRmIljh4NPY50vd9Q+tyckJOcvCtF66qak2RRMgDSsrDBS1CK1DBH+8FHhOjvQR/IzM
	IfRCkhSfcyXo9uj5naPHDD2LSV+5HkLYua5vMgIcLvXGmWV3B0Ls2yVhmrcc35COGE2GmD60PC8
	ohjSrW3s1i0HLeKUvJp5XY+1slhE/MwRYMeqihdZy3xjSeFGyHxpeRG9OVjj4RakKyKaSIXwXKl
	SPIyO+hSU66HmzvhHWiKNfjukXRedA02O3YhAEnnNBBw4818E3pC+qXt19O6YVdrGhI6VLGIeuG
	ak2yrHPWVl4YoSzw5YaQtyXLXFHQA19PXCSZN6RcrE8TweBMPg4qqqGUAkW8ZeRFwbDriMoenbi
	1tm/Xq20SqYM9r6RJqIw455upUwc47VDQAr3QqvcGvioDeD05cPvSlozUaWzEBb2e7ifNQDRVzP
	IVcmda2BqzUglCHrRTT9hsY0ycMedsbTTPgpW+yC4sTbosEFebM7PMGM1/w0E3fU+PcqkZ6CSUC
	JerjWqyNEuyZKVRMkL+mZimVT1kU0MbgkGfav3Y6rTY/bWMcBFe+GStW
X-Received: by 2002:a05:600c:c105:b0:4a2:150f:1613 with SMTP id 5b1f17b1804b1-4bb55a66006mr23009675e9.7.1794551959351;
        Thu, 12 Nov 2026 22:39:19 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb4e294420sm121574605e9.9.2026.11.12.22.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:39:18 -0800 (PST)
Date: Fri, 13 Nov 2026 07:39:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: korryasdlerto@gmail.com
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] power: supply: Add Silicon Mitus SM5714 fuel gauge
 driver
Message-ID: <avawPqDGPEYPWTEg@monoceros>
References: <20261111-sm5714-fuel-gauge-v1-0-b9d163fff6ff@gmail.com>
 <20261111-sm5714-fuel-gauge-v1-2-b9d163fff6ff@gmail.com>
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
	protocol="application/pgp-signature"; boundary="2r6ji5mtzotwcfxp"
Content-Disposition: inline
In-Reply-To: <20261111-sm5714-fuel-gauge-v1-2-b9d163fff6ff@gmail.com>


--2r6ji5mtzotwcfxp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] power: supply: Add Silicon Mitus SM5714 fuel gauge
 driver
MIME-Version: 1.0

Hello,

On Wed, Nov 11, 2026 at 05:35:00PM +0200, Asdlerto Korry via B4 Relay wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

<linux/i2c.h> already provides of_device_id and
<linux/mod_devicetable.h> introduces a lot of unneeded build
dependencies. So please drop the latter.

> +static const struct of_device_id sm5714_fg_of_match[] = {
> +	{ .compatible = "siliconmitus,sm5714-fuelgauge" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, sm5714_fg_of_match);
> +
> +static struct i2c_driver sm5714_fg_driver = {
> +	.driver = {
> +		.name = "sm5714-fuelgauge",
> +		.of_match_table = sm5714_fg_of_match,
> +	},
> +	.probe = sm5714_fg_probe,
> +};
> +module_i2c_driver(sm5714_fg_driver);

Don't you need an i2c_device_id table, too?

Best regards
Uwe

--2r6ji5mtzotwcfxp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2sJAACgkQj4D7WH0S
/k5y8gf/bVX1KSrZP9ZVVaVPusWdsCZBWZ+d4JVqPpF6oSNJa2Q6ZDZ/OOo2nKxA
a0dM4DiFeiMba5iq/37djbjc8Rtubmpul2v7hZbj4p+OQ59Lopm/9e79YCjrwisZ
SRdXQ6vG9oelZv+uR2YGT94QVjqw4Fq+Cd0VuqlhqL25l9rkhuNWkEWSwfRPpnzp
voMo8iSpMRRg/Ty0xDT9z4iZPH2UG5jxKJ4seN1PLOfOZt3pYo+9Bh97hjZtIR1j
R79pD+VSw+OP7i+LbFRMwcZ9PHPqSrHZB+av72B+gMfP+GBItgYp4seVLJceH2pl
FZfM1hdZ+icIbbO7MFyIhJRCKJ0amw==
=+err
-----END PGP SIGNATURE-----

--2r6ji5mtzotwcfxp--
