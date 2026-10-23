Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747313;
	b=hcaXeHzfK0G7eC7FNZo1GlbirAFCXVADmOEE2xIs7no2XvQeGbJsrtmznT1+WC+/KvoL
	 8NODQR5qsQl20UwG/ks/3kjrwTmBdmpyJusr+zG8PFafb8PDzZ4qGxZBb87uiGalASEzE
	 XA/hpaA0mMHFofDtMn2T42c4OcznvVFBmB2LRu19FKPSmCfF6BmwIZAeNTNyQHvkqymvs
	 wLtvG+7dDHpcb/G8xE7YihgyNAuLu6VhG6GoKxwClGro1xInzOd1x9niOJH367rw1rOUo
	 w50DaFlIA0XC0P3q6gKiAXO/nyfmH0qKzJFrcwzBNi6wrxGrjXmrzkqW2gEl8pmouBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HmjHL70SjYeeHWsidnbTxThGBvDUXps9xX6PjKAHEKQ=;
	b=PEv2TPMjIjKSolZag8cE/xGKMIutLgRz6XO/YGrypNFOcxiyEvm1Oh0ttLtL9r4LPIPT
	 FOPZPAcqc0/AdABe7osIfRQeeFdhxdBD6odW5jA1JrOersbOy+ZWOSWN37B6pxXR5M/br
	 1H95HA925S0RPEcrUZpK0EnG2aI7NIG5aTSxfS8AFcl+TFnlskRX2GzSI9fmsoCoeoeoQ
	 dbLKEmTjoVLtuH939LXDfJvJqzdEUtNQjUlzyCg73vb4iQqB9m1UIjT60eUpgvShliYeC
	 En5NzX0iqYvZMZMdUwE8h9C/bYnIdcmgbM+SeAjkAGJIZcqxbb7r1Oz8bqaO5lkwEhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AoVoI6+p;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791D6606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 791D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AoVoI6+p
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso6724235e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792747311; x=1793352111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HmjHL70SjYeeHWsidnbTxThGBvDUXps9xX6PjKAHEKQ=;
        b=AoVoI6+pp+gL/JBGzfNKGQOz2A3uS42562gdzOMf+SfOy7QLNULEY/J/Nsdh+nwqEZ
         BCd/53IKR9sBj+t7VLklJJjNGYq707j8vzT8tFN4X5AGHrv5OkDRH+bsXJdDA3rLgyUC
         HnUoXa8UoysH7xisFxaL0vwA4bn6LUmDtP2nmkXDmzaQhTJ1/5T2d1lmv/emORm+vLMw
         4xD6OgsTmvuJq0QpqldjZKk+NZG1FU9TUGFdIfIB2b8bTJLOKs8z7+rFGnMVR+Arh/WW
         Ni3VnHEJ9zuEr7c5QFyJb8AsxV9SWhHOLzf+MSrMXc7cUw7wH1L+5bOm79oe4LrtA6Gi
         xNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747311; x=1793352111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmjHL70SjYeeHWsidnbTxThGBvDUXps9xX6PjKAHEKQ=;
        b=E3oqb6h4grt0RFnw6b5yCugQ5lUss0f2Nq7IyquB1UxnY0Yr1WZleUgef/O5h2kn1T
         K8MSUnuNxG85rpRWBDYouHITW61mygdnizhWkKz9CDD5l4pX5EKsNQi88vv9H4hZ6825
         p3DFonFMJyHbbqkBpHjqtN325ThZXmkv9nCbMvNNaopTL5rOI26TXPds8sWZdT4TA6/7
         cDrS2YvQvjspEWNtfS85Vq6l15AsqvUrCvuSDZGpGR7xnKMI2PiF6fyxGK6sbgCyP354
         w0nT5oNfHiEIbqRhEVf/+CyUm1uB3IaqzR6ZC12SfJfxiUMt4fzZvS6csxVKGN+8JrvZ
         Z6RQ==
X-Forwarded-Encrypted: i=1; AKwUvBze3ABP4JdxakOkCaze5N7OhZEsQCFsAxmkFsk69rGsdhNnXV1Zqs6hLt+1my0etxFb7m01TdcuUScrt9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEPZRP/emMFddVD4AvvLcIECGCFC/0jjrZ2idPFhiAKw1Ry0KS
	GQoLmfYhW9zoGBJ9h0rS9nJCAk/8wXcyv7knoteIoiyZuq/P1wRTUmG0Glwv2bYTZAY=
X-Gm-Gg: AYBFou3lVRHBF22rsMvzwMWQGgwg1UZ4InLinZCTWCnEUXbcCNd5Hkaz62JkrHwO+GD
	Ip5b0QcXqkRHuVVO3YvcADYQ9QMGiMlmpHrRioEaYY7ulHnmTqmtGRWWn7iiGHrl72yvNBiDjbr
	YKm2RVHpkb8kPjeh9bf8a2CCA11Ug94PT737k/mX44Mh+CRfnaauRL+5JiPFt7CDN4irSC/Edv1
	zkwW1WFG0HY11nW4/lTDCe9D5HzgSXQIU07/Zb32UR/0NwX3PXiHFc/fNrYMqlRnbESv4LpqFaY
	azeHqXJkHFI2ABjF2ZNPppeqLCVUjvR6UBs2ELMb5kY+EMtWpoOHL9QGirdp0GFBf1DQ8Spno2b
	Dikoh7J7BR/v7Hw9eYEValPlvSGTWQTnoqE89U8k1YQMz7WD1CsLW4bvMlwrQxst3T+M1y48gxN
	P5NPLUeUOT59Kt8DGvz8e4A+CZ5aX9qVe2LXKhPa3MlStmW4vIjyi9ODGcC0e/4l8y4VAD2nk2g
	KAlXTTXbEXpd4AS77I/Ho4mt6pCSU2HTUy4UypcQqEPS/j9kKqcF4bSZAVdmyKkXHCQW3cWbbl/
	kE1XqgvTZ/qKLfyKn4tV/B/tyId4Kj5+oA7RrC1GD88=
X-Received: by 2002:a05:600c:314f:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a211c9c5c1mr26749325e9.10.1792747310749;
        Fri, 23 Oct 2026 02:21:50 -0700 (PDT)
Received: from localhost (p200300f65f19a9045816c66224fa2d94.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5816:c662:24fa:2d94])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e38025d76sm3827688f8f.13.2026.10.23.02.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:21:49 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:21:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Maxim Mikityanskiy <maxtram95@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard
 controller
Message-ID: <atsmraNrFH4HW3Qb@monoceros>
References: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com>
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
	protocol="application/pgp-signature"; boundary="igkmiqlhogoklxiv"
Content-Disposition: inline
In-Reply-To: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com>


--igkmiqlhogoklxiv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard
 controller
MIME-Version: 1.0

On Wed, Oct 21, 2026 at 09:50:56PM -0700, Dmitry Torokhov wrote:
> On Ideapad Z570 the driver tries to disable and re-enable data coming
> from the touchpad by poking directly into 8042 keyboard controller.
> This may coincide with the controller resuming and leads to spews in
> dmesg and potentially other instabilities.
>=20
> Instead of using i8042_command() to control the touchpad state create
> an input handler that serves as a filter and drop events coming from
> the touchpad when it is supposed to be off.
>=20
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>=20
> v3:
> - add missing header includes (compiler.h, container_of.h, errno.h,
>   mod_devicetable.h, slab.h, spinlock.h)

noooooooo, mod_devicetable.h is wrong, I want to get rid of that header
and input_device_id is already provided by <inux/input.h>.

If you want full iwyu, please use <linux/device-id/input.h> instead.

Best regards
Uwe

--igkmiqlhogoklxiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrbJykACgkQj4D7WH0S
/k7UUQf/fhPoADJkA8uE7YZ9tqBim2i0UzkFm07T8xnmU4CnTZhCoQ9Ozmsd6tr5
1FGS21kPcdsoYa+h7unjfuMHYJNcG/WOx2VAp3BgYSwNgKYT4rnD4biWgJHQRNrM
lhWcoLpkwuaUHXHcexOVQTbc2kjVhLQ9kUQFV7aR1za6pX+THOsGsys//h3v+/eI
ReOfDJDne0l72AgYWxcPkyttdqZBYFnGg6pjvF/FsBReCyvxnszGvO7ZJg5s63bP
ikNxNMtfJU18X2ZxhpE9/s4zkYcgEFm8ggEZbEVIIKKjEZzX64P5U5Mp5rc+OOJu
JMUHB+DaL4Dp1tgHVXnTechZ2zULUw==
=vw9K
-----END PGP SIGNATURE-----

--igkmiqlhogoklxiv--
