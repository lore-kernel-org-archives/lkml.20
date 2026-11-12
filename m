Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481679;
	b=CQqCF8obCQlXvTPKZv0mNH9/7frqRuF09i0nQ9wwMbDUIQF1TVJTmI+HTP81N3uQ+M1z
	 r6nAZ1iOBWnKv9Fp2hr2r0YEBo2qG0e+uqeY0dyZUC5ATB8fspyXaTB6+ZClNEFhBBMuR
	 IGOe+UcX7CvUS/Dnc33lN7znDrhKXF1xrhlV2JlPhol1g41oPeygH12T5TFsUHVR/9E3n
	 fNb3CR+0XQF/Wv8Ejl2KbI7dYThgvltW/7Ttd7UsBBwTcl8GldpOdlqpHExTT4XBJFo5r
	 P60kctEUg7jMGjQ/eXTBbnVY7tXMkRrT3jPGw2pJBSnsZtX4+XpRimEZs08HMqObfeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481679;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hAZ40NMDDMUmgCzs1hQlniQH3f9d1nKjRHdfq7Z++RQ=;
	b=V+XI+BTznBGQuNZclZHLjr6zS6aUXgJbmWbvTkPt0o16W+yZL2oLP/d8DPX4YTf3+WhL
	 S7RFiQb8tQKOyBQE/+sEwuhwlf+8AKhGWgZf49QU5uxBO1d4tjJNvSaIiGFWU4+y/xSOU
	 9kfotE9EYBBwsyoGh+WbkHdXJgwRTjMeHhBiIAYSk0C1xKKpR6yi653DEh9cbd47jgysR
	 3fcO0uXqLh6cwPSXkuud7fJ6JpefbTYRSvIRfAN5bQ05CVhN/4QFNMkllstEjAgRB2q1t
	 PlOTPPTs3BT+MtW2ZgTTbItinZAIj4AJta6j+XLFk8EONWO5stdv0o0s8dd60rDtKwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=klPReNzi;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE57606A883
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DE57606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=klPReNzi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hAZ4
	0NMDDMUmgCzs1hQlniQH3f9d1nKjRHdfq7Z++RQ=; b=klPReNzi9vZCtDV9wzSF
	CilZoUUE3Ml1O2jqkku9X9rDbylHwROFIrMiAGCUjNpQ6sbXuDgBCZ7BasT6hZIv
	fm+a12oguintbp69dIzYhB1cc6OUspRsNFBSXwZ07pkuF5/Qv+XGeqmUCiwEoLZZ
	EsDqEut/cIWOG1z0kO6dAVbp1qpoPTi9tgRNSLppMd5+Vz3zYIBOzSgsMsSoCQgc
	xZIJIYhqQ/HRJQJ28eP5NPiHwWyLPRXlSeEGfUduY8Vy2Dlsh1+JxIsTVGaRaPiq
	FNPKQhRAMPrUes8DzI8tP36Uo5XjMvTKP85UPn/jwIBW+kWN7AAF0i5r7IXli1Zi
	sQ==
Received: (qmail 964900 invoked from network); 12 Nov 2026 12:07:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Nov 2026 12:07:48 +0100
X-UD-Smtp-Session: l3s3148p1@KGRdUhJgmskujnsG
Date: Thu, 12 Nov 2026 12:07:47 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Johan Hovold <johan@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i2c: dev: fix blocked adapter deregistration
Message-ID: <avWeA00vYp4bATW8@shikoro>
References: <20260827102043.673273-1-johan@kernel.org>
 <20260827102043.673273-2-johan@kernel.org>
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
	protocol="application/pgp-signature"; boundary="c+0cTDoRagOtJtqE"
Content-Disposition: inline
In-Reply-To: <20260827102043.673273-2-johan@kernel.org>

--c+0cTDoRagOtJtqE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 12:20:41PM +0200, Johan Hovold wrote:
> The I2C subsystem allows controllers to be used by non-child devices
> that may remain registered after an adapter goes away.
>=20
> To handle this, adapter deregistration blocks until the last reference
> to the adapter is released. Albeit unorthodox, this is mostly fine for
> the vast majority of controllers but can cause some trouble when
> controllers reside on hotpluggable buses.
>=20
> Specifically, userspace can prevent an adapter from being deregistered
> indefinitely by holding an i2c-dev character device file open. And with
> USB attached controllers this prevents further hub events from being
> processed by the parent hub until the file is closed.
>=20
> Fix the i2c-dev implementation by dropping the additional reference
> taken at open() and using an rwsem to make sure the adapter is only
> accessed while registered.
>=20
> Note that before commit 611e12ea0f12 ("i2c: core: manage i2c bus device
> refcount in i2c_[get|put]_adapter") an adapter going away would instead
> have resulted in a use-after-free.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Hovold <johan@kernel.org>

Applied to my for-andi branch, thanks!


--c+0cTDoRagOtJtqE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr1ngMACgkQFA3kzBSg
Kbbk8A//TgTym5iNNGVZuGfrn2r2chjQbETzxgr59Fp8OERKNlG0p/Nd+oC97Q+h
UizzzhozjHqD1/vvlxTtIW1sGKV266gced/elJJQbXP3RlKhMIrtKG7IAdDZ+tsQ
hFMd3dH5e7FYiLko8c2POpO+oY5G/ekaBlNngszf8MSY35yYOyi/A7tslvyo2V6h
rXal5kFzcIrtc3MF1OPfAO6MWFcvU4ETo55+UaUIb5KSX5wJk18nSu7SG1eVr2yA
SDUAjTFQIHdEXv1Lb+brh0vnFsa4gUe8t75ujEe8gE/lf0gqDCAlvXVsk2rWK2H1
4SI8NMG2+H/3AVUwLfuQ/kSwh9eOt1gP6AEMjGPpQoJqhzBNfxaMTXm0gSSZxlnQ
ugCPHFSP4LbtJ/Hf0KX6j5Rvu0OHMCMNgJuigL5IZAKgh69ud4TpPGr2S9P/dF0K
wSMMTtLCfBYVJpgkzblRfMLnEoFb9+hR2S87dD7qKcV6BzKPZEFhsLjNYj38GSov
BLR64S8TG+CsZyDhZCXg6nmSi1ETB1J5DRaFXl3KDabwGAjS2sucY8rWouZkLdkI
Rn8bgaBJujNHNd95JWDqUnvRALI/541l64cbTBm8KbLK7ZZoQVaYGB7nm45VEpPo
hHHEaLVP85jwwf08K2YPuweyusioC+93gs4+tMwqV07A4WfVQtU=
=H7Z+
-----END PGP SIGNATURE-----

--c+0cTDoRagOtJtqE--
