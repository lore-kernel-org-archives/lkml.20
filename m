Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794126736;
	b=5PSA3rxKZ7m9yeQQNsFmFB2gPEv4CH08l0jUgWZ09telZh2Ox5VAbgbsTp4HyZQ4vPXJ
	 r5onaKSUB+WYN1GCsPEsZkjvkuuPNPqid0XLOjOF4unjJ6ODc1+nEAgjYhGvlLhSVvEGx
	 4+5NDkryl/j5hDN75pEcV3kSAS8HrlA5qNJpspbueEtc1xBHZG6fy0907GkhRxvKjx6Zt
	 yCHRF6cIrnO1lVdXBxV9B+L7NpZRtVqBIb1DeV73CO/kkqYfdLMTaHKMaohPHOx2Z4Mss
	 xOOwUHF/RgVa4BUTQb7kDMAdpGsDOzqwC8q2ux7+/K1CB1zSTz4dufWaMfFAbV0zSvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794126736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=N8zgWG/m1wk1ElvtKBvqbB6y6J69miXFE8MYrY3hlgw=;
	b=vdpr0MtI0LeProIptZgIBS0EFZhyesrNEliybgqKqjm5Uwd/CR3+OUtj9bT4apYC0Qce
	 fGkrU4wZ0AcnX3sAt79fLVjV5oEtV8xpBSykNZ627lNvRzmwdLesx0a2dMGU+LwPKDnbv
	 COVRGOaqOM+1qR3IoMm1N8q/FJjLVjaCg5Cgh/R3YR9POPivIyLqVQZzZmasBkqPQJdgR
	 YgMI48c60rS72ZKVTsctoCywBOiok3MQ7yroAFIoMG2cdvuQwd+mMiXsoIzhbY78Od1t3
	 xJK9VdM7YoBPaG1Ny591uz1+ieCeNy+rIcnS7ewqWnWEBI/8lvWSSU/aXQYueTXyvBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XimmvAM6;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653DA606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 653DA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XimmvAM6
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso2194725e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794126734; x=1794731534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N8zgWG/m1wk1ElvtKBvqbB6y6J69miXFE8MYrY3hlgw=;
        b=XimmvAM6MvuLGCxnPvd32X6MVNSf++ePdgANOfTnjNwg/vHm1rC5BlB8GLL0vpJbAF
         spJn4cP8UxrRT2X6K8PZdZgxt4jBSdvSvxZk315N4UU3h9uEUOuOCHd+QrBm93O87i2r
         y9P+xZFRJpT0qsSdB+NaHn34HVsdRzZihT7viVUJwP634lOahSySjkyC52n8vSQjOhme
         87JjzIsDJ2LUSfuO5WWIOCXfCen3plmzrzWR3tbLsKGDcq2iRBIHGvn4OC9tpathkqoe
         DQ4HGLirSrUNK4JKcQoj0qoDKnPENY8122iBmWiQxY2C7Norxfd3NAZ9TUEXNmbo7vXb
         lcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794126734; x=1794731534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8zgWG/m1wk1ElvtKBvqbB6y6J69miXFE8MYrY3hlgw=;
        b=d2tIUIOIYZjxtGy4h3R4MBjbxpZQaHoGwb9LtIGb6YDqbnqiZXIOR5PFzr4seZQWD2
         2y7Vvpzd4R5yRTMeym2FLnQIOQOYgUm5KbexwXiM2RPMUnWjeukyi2MCX0qZkg3XLeqG
         WXlt66kM0mUZ1CuCJWE5AJv2tEkgNrEISESdl6bENjf3VNx6KE1kmdNcb6a9HTyX0wRx
         cJo3dQulvNCTc5NkQAZRSn8tp88e/fYB/1QQH2gPhe7U01S9NQtg2zTr8mVxKAAsfQAn
         sgJjzP1ggrqEEneF+W5FS36ZeVWxjLuJ3cTTET4NVLeiwKQVrX32Fmo46kcnVH+KgNvF
         rkog==
X-Forwarded-Encrypted: i=1; AL+hErF1ZAM538WETXS4Vh8VH3SZBb6I+OBm0EBXrKian0GdKOXEjtYA/GoTgddaSHAjFG0n35AkDVEmovVJc2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9n6UHP5PZw1Rb91VZOvIL4dda5eeGL0YF0Hxai7zLXgAmF6i1X
	rUFNqbgcNUifANomCP/wMkqyzxGEUqfXcDS5KSkqMdfZn2w8Rm2t+gZTWAfLI/4U8bE=
X-Gm-Gg: AYBFou2RvtAat5W5dwy4hb8SbW8mMpxSb6XiasCUL3VNjfVWcfL9xsOKOsHj68WG242
	JKTII3wwZAXG5acjXl2g9+0e3rWuYOj8j9RI5LPjw4zeUOB0qSQsVVrNgiP2siAWVsDDg61HBzC
	fVTk4OYAuck+HKg5u3UKtdCahiaJ39/ZYryLIW6+FQV716ozlNimv663pNOHoRL9QXCF4Ra5Ocz
	FV2hYXYRqzJnVvPhwHFXqGs6tjeene5VE6x88K1PXzAo/TccFrdaKa+hGA79QwS9XPRuYB+fMo5
	P2oYkSlmXLrCjQR4TQxU20Int1QlQu1PwxC+BUwG4OfJHwyqUzNQW5oKJs9/q48fNsJfhK+qgfQ
	8F0IMEze2tCf5yHkqpvsTbbp0xKUYGStJh8CSJpCxHXl5P2H2yr31Qj84W4RtHjtlOTF45iKy2d
	AUbMOdvLnEuW9zL9+weXwr+k953pwbraUosZ0zYpt/AbYOQIinansvbpTS1f0Fshl6rR9lapGax
	zjugHmFsqWJYxJsvF2nozYuaKPW837gH/FRNZ+tp3D84uP95Ymr/oHOPtOWZQ11+92+EmKHJ5V7
	zW9yYU75YGYLL9zNBlQoaj3a5gfKcHC8JOsn9YNJY4cFZzzW4TG8+K8=
X-Received: by 2002:a05:600c:8b86:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4b963c6e58dmr16840235e9.26.1794126733390;
        Sun, 08 Nov 2026 00:32:13 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b76cb76697sm83632255e9.0.2026.11.08.00.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:32:12 -0800 (PST)
Date: Sun, 8 Nov 2026 09:32:10 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
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
Message-ID: <avAy6cemm3MRHSQO@monoceros>
References: <20261030164705.297354-1-maxime.chevallier@bootlin.com>
 <20261030164705.297354-3-maxime.chevallier@bootlin.com>
 <auyjgDddFs3OvnC3@monoceros>
 <20261108013218.0fe627e7@jic23-hlaptop>
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
	protocol="application/pgp-signature"; boundary="nzwaajfdqqb5x5jv"
Content-Disposition: inline
In-Reply-To: <20261108013218.0fe627e7@jic23-hlaptop>


--nzwaajfdqqb5x5jv
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] iio: adc: add driver for Texas Instruments
 TLA2528 adc
MIME-Version: 1.0

On Sun, Nov 08, 2026 at 01:32:18AM +0000, Jonathan Cameron wrote:
> On Thu, 5 Nov 2026 16:42:42 +0100
> Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com> wrote:
>=20
> > On Fri, Oct 30, 2026 at 05:47:04PM +0100, Maxime Chevallier wrote:
> > > +#include <linux/i2c.h>
> > > +#include <linux/mod_devicetable.h> =20
> >=20
> > Please don't include <linux/mod_devicetable.h>. <linux/i2c.h> already
> > provides i2c_device_id and of_device_id. <linux/mod_devicetable.h>
> > provides many more *_device_id and thus introduces a big list of
> > unnecessary dependencies.
> >=20
> > I recommend to just drop <linux/mod_devicetable.h> here. If you insist
> > on full iwyu, there is <linux/device-id/i2c.h> and
> > <linux/device-id/of.h>.
>=20
> IWYU is always a bit of a 'roughly' case in the kernel.
> There are standards assumed sets of this header will always
> include this other one. I've just started assuming that is
> always the case for these ones.=20

Not sure I understand you correctly, but I think it's safe to assume
that including <linux/i2c.h> will always enough to get a definition of
the structs i2c_device_id and of_device_id. My preference is also to not
add includes for <linux/device-id/*.h> in drivers, but opinions differ
and so I typically point out this possibility.

Best regards
Uwe

--nzwaajfdqqb5x5jv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrwM4cACgkQj4D7WH0S
/k7nfQf/dmSfUoe2s/ZZJPtCi+WOplpfP4laRiw1uBUXG0x4haFv7821WViD/bhF
dvg4X3D486E8LLkSsWGz4mKh8N7M6EsL1Vddr0iCBrz0pbsjdVIkEFS8ymBvBOud
gBHytbfcmR1LBJH/wNhfLqoPeEpJYhuL3511QmrCiBBwbtgSWL2Suj8GNF54a3pc
BipU7Kk/io8HXiR6H3D6i3zmjoKT0adjlt2eiCw4egBAx+/vTIMqXF+/6/6MMMvi
hrU3TjFMWokLNEdekI/XHecdT3dCdmHuRnJzriW8rw+zVxMMpheFcqb8fVjkPUA+
2ozYOslTZ9RtLyy0OB9+omPbgKcEQw==
=zcoz
-----END PGP SIGNATURE-----

--nzwaajfdqqb5x5jv--
