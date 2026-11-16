Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861866;
	b=K2jGZCsQ1EEYy1qHRLk76pURI4eXOVShEQ4eUVT+/LWZfcyzynIhPyN2dIMZ24NgsvPd
	 liM9EIk2pDkpwK2IkjFTQX60SdKrHUpVxA+Dxbp1XjRH+HNqphRN/u8TZrL0BHaZvnki8
	 ZWvrue/wzWobp4Al2v27H6JxhSgjiXPyGCrgiYmRTzyX3FF4PxBGnOtQrMuCbdJfoKDUJ
	 8SZWigiix5pzVoGLAyqDoERRodx7ZgMVUFhnlRph5wnn2Mcgydu/Vh5YFp42XRFG51MkX
	 T92iCEZHGtZdWwusodCyq23TcqCnqw6QvfLQ3Md68rXpisDzNSKQxhC+0Zg0/SXn+hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861866;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=8ZLa+7DixPZsMtzBQZucbhsuqAMh4j+ECRbrPmUuh0s=;
	b=ON07la2CcMPFbWtmCuOq7JdOJ2aVAFycwBAKt1/C5QnZNPRZ9mcVPqur+mw1R62apRVK
	 xqpdWbrCTebe+Y+qUYl/PbBC+sJX9eS2cZYcEiHP1hTmSbyEMq/bFm3nBKovYW6a5r3xP
	 cAmMYURqOl13ciXNzWP7FSFx3Mmt/kfuyiLK/AFyiKfVQKDN87tzc3axMDCbnjY6Hb3n3
	 xPbZV/eIWtehplzoDHipyVAIMx/URI9nL2cfeIpPKDnpklk8dPcjS/LlHVFln0SkSJcvu
	 No0HhwA5AaDeKiyqa5FkCnC+XwohhY9iANcCdI39bUWmyKk0zpAZOXEy99+39QWiLcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z+hqEBHM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF40606A33E;
	Mon, 16 Nov 2026 20:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z+hqEBHM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843141F000C4;
	Mon, 16 Nov 2026 20:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794861865;
	bh=8ZLa+7DixPZsMtzBQZucbhsuqAMh4j+ECRbrPmUuh0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z+hqEBHMuEAt+OlmOhJhC5O4BxYiujssFXSyA9CXOReAF0QpxVCFDT7qjV7PaH2TA
	 OKrl+Y6lrZJrqXSnN20ym9NE9R9p8ZOC4RWSoT2t0CJoHMh2npMHJEg4H0kI6fAp7Q
	 EVqAkAsyYB3rjOAuYq6fO+upwAFQMGtd/ZcLWT6YGaGxTfl+e8/PG7OfOaffUSALPl
	 D+pZzPOOjbj9ALizEofXt67fEDJevqJliYFTIS8uaX2PSvVg/s846aDoDPRVDE5dzX
	 Qrb70qlPlfFr0LbIFNxOrMLfXBElJBhe8rWgrp5ULXG/djDOVa9sSDg9CzGrAJCbZ5
	 O67nsQGkMmcgQ==
Date: Mon, 16 Nov 2026 20:44:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Hyun-Uk Son <hyunuk.son@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Ki-Seok Jo <kiseok.jo@irondevice.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] ASoC: codecs: Add driver for Iron Device MA5311
Message-ID: <435b0669-1870-42c2-a1ac-d2e9a409ac7d@sirena.org.uk>
References: <20261027093232.859755-1-hyunuk.son@irondevice.com>
 <20261027093232.859755-3-hyunuk.son@irondevice.com>
 <179318672062.199157.7461931531075403104.b4-review@b4>
 <SE2P216MB24230E7B98CD3F438E23E869FF722@SE2P216MB2423.KORP216.PROD.OUTLOOK.COM>
 <40646ae6-f6be-4408-aefe-521fb0ea9bee@sirena.org.uk>
 <SE2P216MB24238E5F5EEA95FCEABCDAF4FF702@SE2P216MB2423.KORP216.PROD.OUTLOOK.COM>
 <2c7d503c-935b-4408-a5b6-bfdf5ba86933@sirena.org.uk>
 <SE2P216MB24235412B165FEA906C3D24FFF7C2@SE2P216MB2423.KORP216.PROD.OUTLOOK.COM>
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
	protocol="application/pgp-signature"; boundary="nsnXqCTjIuMfmRcY"
Content-Disposition: inline
In-Reply-To: <SE2P216MB24235412B165FEA906C3D24FFF7C2@SE2P216MB2423.KORP216.PROD.OUTLOOK.COM>
X-Cookie: Madness takes its toll.


--nsnXqCTjIuMfmRcY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 04:57:11AM +0000, Hyun-Uk Son wrote:

> > > The values of these parameters in reg_defaults match the hardware
> > factory defaults.

> > Right, those are what the driver should nromally use.

> When you say "these parameters", are you referring specifically to=20
> gain-related settings, such as speaker volume, ADC gain, and PGA gain,
> or does this also include data path and output format settings?

Data path yes normally, but see below.  Output format I guess so, though
that will essentially always be overwritten by the machine driver in the
normal course of affairs so it's rare to actually get the default
register values in practice.

> To make sure I understand your recommendation correctly, should=20
> the driver leave the data path and output format settings at their=20
> factory defaults as well?

> Or would it be acceptable to initialize the data path and output=20
> format settings while keeping sensitive parameters, such as speaker
> volume and ADC/PGA gain, at their factory defaults?

For the output format it's probably fine to change it, though like I say
I'm not sure that the setting would actually end up getting used.  For
the data path usually we'd go with the hardware default unless there is
a very strong reason - for example drivers with DSP support might adjust
routing to/from the DSP as part of integrate handling for the DSP.  If
it's just basic routing of the DAC to an ouput or whatever that's
usually left under user control.

--nsnXqCTjIuMfmRcY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7ayQACgkQJNaLcl1U
h9Al6Af/TWPkoQ4ZJTj4wfpUEbP69aK5kO/xRmq4MbXlDI/B8cKlbgEWcUYeUX2A
IMkS/Fde9HVvUQgPAVtXIxRJ52xHsEha7CHbcXgalq5axDW2uqKu5EmqB7UvSFVY
nu2THHN3GtPFMpRxhtCq0crpP1jxxm9PIq9aRyX1qmvzmExflDprHF2atsakstKj
fcIgQu68Z0HPVFz5sPwEIRKtMKDMC5ybuuR8cKdJQd/LrIvzwrLdu9YGoVoDS1yS
81UNRbkf2ac0FwnMGMdg2dDbVjwLV4t6ZYMTKEGSujzkY3xRgfuIt4a54FYGWjmL
Znq502Gm0as1yFI3cpb+Q1CkdlgBFw==
=DHDD
-----END PGP SIGNATURE-----

--nsnXqCTjIuMfmRcY--
