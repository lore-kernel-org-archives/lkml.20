Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303610;
	b=DP4hr6JhhY/+WgqOCCw6oFiHFuXd5Xo0NNXtSbgEe8MTnshBWfxnsgygIqV09I5T+Vq6
	 qh65C+4g//CsJ2JyOEca4WyJN0J3Ap64k1t5smeMX53uXHsjE+/1Q6+vQVfosFoKbVWXL
	 GlZMaBLhH4PlplN0wqnY3rlbCZjLoRAyjDKVFAx1kfsOE6H4jj+SOQrOpDglwa8xMBR/i
	 NFKDazcHpMSb40URGmGW7PkXXQg1S5X+h3mFE8lHzJGQczE+9fyF7cWsqkHzXxty+Tirw
	 EkuQxDvQbpz/KvjP2UJkBjpHP3C1QjG1GZvAuWo2CmP9zNEBrxjDpVWlXm36q0DbxeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XQa27/t7HuzOBuNW1CeD2HKdjuOcRupBblm3fp1zI2g=;
	b=tTQBij0a42f8QywtBrex4znSeunl51GQImwnKV34ZccOBD2QViAQpPAvs8eyKjwHo9Oy
	 5aRtgPPyXTy8HKVzouLx1Ta8YfNZcHb7Xn98s/u1qQ/szofgAwdlLHbqE81/5TZESZp6m
	 7mX68Z3ZMwf07sXa2+RvVrdr785jtWlT0dhBHRrnw09oxziGmd2EB9vZtOLNz928BD1fW
	 YYK9lM4QjVtl8Khk8Z8VCeZi3U6D84SMZUlKCnOcWy1pp/OdAkXEasa5Oh26AFa3rO1vm
	 D6nLf+wgoDcRyUmNdJCurf/mFSF2U+2axSjWc3cV0brX/c61ef9QiQGWF0Oo+8Ze6Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="TF/xYG7t";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584806071E55
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 584806071E55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TF/xYG7t
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so18813615e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794303608; x=1794908408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XQa27/t7HuzOBuNW1CeD2HKdjuOcRupBblm3fp1zI2g=;
        b=TF/xYG7t7x1jbQ2fkewApK9XPbzgcslO0bbHQVtZ5wAEbYigvOl3NpUKklUkDpBtpr
         2DRSJ1ReEvAsRGPpys6MGzFXuDCRkWzzbdedmHZ19KvHYtblOIk1XnFmA7Wg1d9TmSGe
         ShnhjNlgjmAOhYxzi7mMtg0IW9yAaF8cFZeBoU1kxKP7SNTJ9ltKduxXeUZx4qzkME9H
         fwvBZZvDXV/Vv8OeYBUZBIlVhXwnwqleCIlKHNUQpKs1lAVi0ldCU0n4Yh+5HqT35etm
         QTh8y217ftPTp6spLfo4rfV9SHbIUgmQwkI+zz5fykOeFWCn3LqsFiuRnjs+qywhyfk7
         Yxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303608; x=1794908408;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQa27/t7HuzOBuNW1CeD2HKdjuOcRupBblm3fp1zI2g=;
        b=yKDIVbih1s+v6YPZIyNFugVE0xpXdSIrzpWFJWiEX4vQzgqpU4j42Gjs0efoM1jz1L
         oew3YfABxub2lUuESU1qy54gAGiNmjLBx40Tpd4j3rNPQnm0mYM9BKfKs38OpZcD0kY4
         VZ4sQLYbbBXiqIr52MI3BydWjscLC2xUXHjFLn+VM1hd+tT9pBsk+3C7RWJfIRTG0Hjx
         bt2C58Kbr+DPTlOSKknEY4GKW98TU/qhwb82MSFN3ZDX7NJdVNtDDPjQVhrj54Y7BL/H
         DPpx3aiWUVsiNLAUtJiE3AgFclZaLeD+Rq7HiLRvDQyUKNYHcCdd5IIODPuTTkkmrI9B
         UHIA==
X-Forwarded-Encrypted: i=1; AL+hErFFXfYvZcUGbLH3k2VfwLvgDicxsOxaR1PW2vSziAi0xB35LEkYXm6g06FItObqJ009jbZgVI9VegPaOuo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5/9vc4HrDRgHqZWWncivEg6+UbgYbrCTQLflT4fAagzg3RlGI
	Uvw68WNsB/GNxZl6Prl1jnuvLja2cS/3Wto+mMpcbE2/1deofdQmUvivk6q10ndd3CQ=
X-Gm-Gg: AYBFou2rz6GIwclItV3SM7TbHyLJzPB1MwAnNHg5w9PiSh52w0IiBq2bqFnFmVomDMY
	nNHTXykABJgsvpzisrsLbmkAOfNCb5u6IijHSjHBjEir45878bV6M7sK6zIIZmIHqgkhUFxoeNU
	xN7EsD5bc6L4Hf/LpYYkrqq1lkMBOq7BdQSyNxik6yLufBEuHXV+r9t6pV/jygc4DbBWWsH/TJK
	TrX80lcbWaFgSMf48upXfzkXCa9lxafQ+d/mSrt3hXC6FuQm8InuV2b37F2dFGgvp+XUHyBZfXC
	+SD8wy1ygrY8hRRhKEz5aqQbAU78unYLZr3LgSqzx5f/oB2CF8/snr/1FegNo12rKVsnfxHGxy8
	Pqhu0R3Q160BmM6q9iYy3p6/s+pPIOeU5zAZDIDKMHM5ccor+IfFfVXZOIT9t5u7FIGLX1okPk2
	JU5lxEBOk47KjCSwCT3SXZr1VzyQZR4Wz9hfT8JZFQhVrVKsgVmdE3LTWN+2lRzJJm94vNBGrMh
	zuNZOU3/pRNpdDM+gbl7t5ldtplAnL7Q4uceNtb4Lzx3r98oyvruBvw4bN5hbxKSp4sx/RYAsOy
	1od8JFOadLGa36AUhXNLpjLfuZKh9ctQxcs=
X-Received: by 2002:a05:600c:6296:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4ba02348dd9mr31353275e9.20.1794303607698;
        Tue, 10 Nov 2026 01:40:07 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba022ff5c3sm23953585e9.0.2026.11.10.01.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:40:06 -0800 (PST)
Date: Tue, 10 Nov 2026 10:40:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Rodolfo Giometti <giometti@enneenne.com>, 
	Marcelo Schmitt <marcelo.schmitt@analog.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Angelo Dureghello <adureghello@baylibre.com>, Tobias Sperling <tobias.sperling@softing.com>, 
	Eason Yang <j2anfernee@gmail.com>, Marilene Andrade Garcia <marilene.agarcia@gmail.com>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, duje@dujemihanovic.xyz, herve.codina@bootlin.com, 
	thomas.petazzoni@bootlin.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: add driver for Texas Instruments
 TLA2528 adc
Message-ID: <avLluP28gVZEfFfe@monoceros>
References: <20261030164705.297354-1-maxime.chevallier@bootlin.com>
 <20261030164705.297354-3-maxime.chevallier@bootlin.com>
 <auyjgDddFs3OvnC3@monoceros>
 <20261108013218.0fe627e7@jic23-hlaptop>
 <avAy6cemm3MRHSQO@monoceros>
 <avIGbBH88xZwndaC@ashevche-desk.local>
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
	protocol="application/pgp-signature"; boundary="xrvk6vw4g5gzbbvg"
Content-Disposition: inline
In-Reply-To: <avIGbBH88xZwndaC@ashevche-desk.local>


--xrvk6vw4g5gzbbvg
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] iio: adc: add driver for Texas Instruments
 TLA2528 adc
MIME-Version: 1.0

Hello,

On Mon, Nov 09, 2026 at 07:44:12PM +0200, Andy Shevchenko wrote:
> On Sun, Nov 08, 2026 at 09:32:10AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Sun, Nov 08, 2026 at 01:32:18AM +0000, Jonathan Cameron wrote:
> > > On Thu, 5 Nov 2026 16:42:42 +0100
> > > Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com> wrote:
> > >=20
> > > > On Fri, Oct 30, 2026 at 05:47:04PM +0100, Maxime Chevallier wrote:
> > > > > +#include <linux/i2c.h>
> > > > > +#include <linux/mod_devicetable.h> =20
> > > >=20
> > > > Please don't include <linux/mod_devicetable.h>. <linux/i2c.h> alrea=
dy
> > > > provides i2c_device_id and of_device_id. <linux/mod_devicetable.h>
> > > > provides many more *_device_id and thus introduces a big list of
> > > > unnecessary dependencies.
> > > >=20
> > > > I recommend to just drop <linux/mod_devicetable.h> here. If you ins=
ist
> > > > on full iwyu, there is <linux/device-id/i2c.h> and
> > > > <linux/device-id/of.h>.
>=20
> It must also imply acpi.h.

That's true, but irrelevant for the patch under discussion because it
doesn't use acpi stuff. So at least here even with full iwyu you don't
need to care about <linux/acpi.h> or <linux/device-id/acpi.h>.

Best regards
Uwe

--xrvk6vw4g5gzbbvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmry5nIACgkQj4D7WH0S
/k5A0Qf/UlVG2sAQs+UgFERuB1rhQInSRoLdCeHto+8YE/qkryzNXfzSyOCOV13b
/4pNCDCt0zmQeG7W6eHGlvBpZiSUL9nHf6qsm+/Sciw7X7qMOKZUJbE092MErD+I
F9LUxplu7GHBBDeVVwgNSmiIQW1gRlMcNTWHJahPCplAj0sv1g8OEZXOl8FZk08C
6qjffOFMonsW4Q+oKUrQhW8lPsHU74Ah5LooLSWhdfEaWsgrgpXrRYRilKAmDGJw
Q/32M3v6YNBZjZparnKx/Ycw0xsdBW4BrzeKro5GBXDJjyHyEMeipV3I4ecZBVDg
/uBtYslaJ/7hIygWqlHNxNzvlVAWvg==
=3Cj6
-----END PGP SIGNATURE-----

--xrvk6vw4g5gzbbvg--
