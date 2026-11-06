Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967762;
	b=21QhgF9ZJZSFrjF/b31AaaaYC2ZM9vr/DybrpRxhx9WPd1xa/yg+3146tTQAQY7SVr3U
	 2SpJMyrfiUZnajYmxwriIBStjkIRiEeCi4dFSZJAFJfEbADwV69Jbc9oGuAhMSq31vb9j
	 lGeDlGzhrkLshwvV4ansacjzehZrHVSB5x03BkJ76gTFcxrG2p33SnkkhWZOBWWCmTNpU
	 +rCXXGnxrNUalCQZSpF+wQGPl0UWRtxyKJK7ceZo09yUwe163+HjQ6ZLezLV20Ejw3G6z
	 usMK3PUTY02NgfCWPyodWLyM/lAUuIiau/8WNkf5EIWlySgY0yPqyJGa3Brrv+0NSxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967762;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=T2RzjtYOrTs7ahd4ejwL6GAYPbfqsQ4AllQh7+4gIS4=;
	b=uYkIQig9EzMokCqXBgO1qhLCePfe6I/MKCRIieC+RESTwnlA7iQaUm3zHVqdy8fRPgkH
	 2T6Q4KMOJ22HFDL526bcC4Alku8smH33iV0J3nQY5rWnWmi0BGzfQgbRymOgn1IkQap7b
	 MtIfpsaAWvT/BTX1M78NFo1zGZXpw13C1XyHy+1Jd5SHaPGCA35llXAFgg4qMXAfKyk6q
	 CIllmU19XgCk6s152kPKm5lj+KMAvpZ7y8KrWInAhkprnB/D50XKiZoLMGZ9gLphrsnqT
	 6a83gPXAXPgHQpLHjCe/yapBTJBoMb7pbS63uYJBOO17Scx+cOdzsQTFQLUQOdvcWhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U2U9Ovct;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD04606A326;
	Fri,  6 Nov 2026 12:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U2U9Ovct
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2E11F0089F;
	Fri,  6 Nov 2026 12:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793967762;
	bh=T2RzjtYOrTs7ahd4ejwL6GAYPbfqsQ4AllQh7+4gIS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U2U9Ovctov/iC/X0k/6UV6EwjQmmBAEb2b38z4PS8r7ILZ6dDytMjbu6Qcm35YGVW
	 SGRo+gmFaYiSswoK50POXRne6x2LEYWLw9gTqOQFtTnb/EgnFucUe/H21se/M7fXUI
	 rfiImLgyDP0NGCfpX9+LlliEKgQeTD6Yafg2xRqPFD6CMVIcWA+BuQyNl0lkL8s5ad
	 H1R7sBfYjLf8NvgqFjbRhplkiSlLDE0DyAbT+1iTytM/aLJDLkU7pw/SWFPnTj7TsN
	 KFnF0XYZHw8dOHtL+bCog2M1T6w+N3Zl5RV/5u+afEtqGg0qCCAZYHxcnLKw+K2u0M
	 X3nEmXAQrAx4g==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 6F4262806741; Fri, 06 Nov 2026 12:22:30 +0000 (GMT)
Date: Fri, 6 Nov 2026 12:22:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 3/3] regulator: Add TI LM51772 support
Message-ID: <ba06d540-e971-4e18-99d0-16f8f4530eb7@sirena.org.uk>
References: <20261106-paul-lm51772-v5-0-0e83ac9711d9@bootlin.com>
 <20261106-paul-lm51772-v5-3-0e83ac9711d9@bootlin.com>
 <DMO344BLD9UQ.2X4YL7T3UZOWL@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="aNEbgorVox+nRrVi"
Content-Disposition: inline
In-Reply-To: <DMO344BLD9UQ.2X4YL7T3UZOWL@bootlin.com>
X-Cookie: Whoever dies with the most toys wins.


--aNEbgorVox+nRrVi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2026 at 12:17:40PM +0100, Paul Louvel wrote:
> On Fri Nov 6, 2026 at 11:12 AM CET, Paul Louvel wrote:
> > Add driver for the TI LM51772 buck-boost voltage regulator.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--aNEbgorVox+nRrVi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau3GhgAKCRAv73Ows9A4
iY4/AP9dAj7BFzlnWShQWD6xuImY6hJ2P8TiNQIrSzO0AuPivAD/QbTUaF418kuY
EZBYi6adgI/nqxdzijX2nN9eWGztnwc=
=oudT
-----END PGP SIGNATURE-----

--aNEbgorVox+nRrVi--
