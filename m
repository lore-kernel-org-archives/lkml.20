Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FF4429037;
	Thu, 15 Oct 2026 16:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081007; cv=none; b=EYxG0L50y63iYb4uZdSOSAf7VvPXE2gxmRShQQgzrofTKcozB30lBJ7jTAi1HkiZ2zVN7dGet43RhiFI/RoJS4nNjtPIal5DRbhJHc0S2qcSxcaCZvOWOh0I+/ZA2iiJPjUPJsTW1ZI1uDHCkhf23jJON5fW7BctTAByEeYPoO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081007; c=relaxed/simple;
	bh=3PfTaTOR3rxNdX3I14x8pQoP+X5GXQdWvF5tPr3VMUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9JTO+4nQmQmRHBGMshX+RXz7m84MqkJp4fmtGvqcQgYMhSp4ZErcDeuQEYN2rMzYgXxnnj8l0UieR6YWU6lJyemr1oCOo1eRSVuSTJ+j7PWgGbFEtJv6rnrUP0ziywYentmn9xz6y0SXkmZm0wJ50N397MEQDt8uUncBEwFMh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=da7CctH7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="da7CctH7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFFB1F000C4;
	Thu, 15 Oct 2026 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792080995;
	bh=aj8Xtl9TJfYx3DrAE8szSE/KyGLDU9N/N3sxCdMiZl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=da7CctH7r/a3+qSxexv9g22cRy5tzyW3xFigxnkubucVb5sELoGYnu12ZO0Fv7UAy
	 Fm3aiPVBzWYcE3OBweWOIWPLJKX5/D5SGiHDExci+JAXoaWFjP8ps7sLv7l0slTyPK
	 fZoSve8kxn9hZ44PV1uvFTvDdXXjKmeMkv+NOcQpEsBNZqukPdar7n9CCucESqYxVx
	 Qks06aAiHJrm/++85tjHap6RfVJz4PpewiKidx7TAKvVXxnuVmQXtgOwuyYjJ56wrb
	 wQwHRhqg4asnbPPJxvyWSBp0LMdzUAehp5G02lS53k1BgYg3XcFnvUBY/xR2+HzAMj
	 YIMWcUHUQciDg==
Date: Thu, 15 Oct 2026 17:16:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hyunuk Son <hyunuk.son@irondevice.com>, lgirdwood@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	perex@perex.cz, tiwai@suse.com, kiseok.jo@irondevice.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: Add driver for Iron Device MA5311
Message-ID: <5fac314e-637b-4c69-8f17-f69db5703c88@sirena.org.uk>
References: <20261015060408.128711-1-hyunuk.son@irondevice.com>
 <20261015060408.128711-3-hyunuk.son@irondevice.com>
 <20261015-brainy-thick-toad-db0389@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bQQvLXIMg8npceXQ"
Content-Disposition: inline
In-Reply-To: <20261015-brainy-thick-toad-db0389@quoll>
X-Cookie: Tax and title extra.


--bQQvLXIMg8npceXQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 15, 2026 at 12:41:46PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Oct 15, 2026 at 03:04:07PM +0900, Hyunuk Son wrote:

> > Add an ASoC codec driver for the Iron Device MA5311.

> > +	dev_crit(ma5311->dev, "MA5311 INTN fault detected: irq=%d\n", irq);

> Not really critical. That's just a codec.

It's a speaker amplifier so if the hardware started to go wrong it can
potentially cause substantial physical damage to the system, possibly
generating a lot of heat which can go very badly.  Any error here should
be a "this should never happen" kind of thing, if there's doubt it's
probably as well to err on the side of being loud.

--bQQvLXIMg8npceXQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrQ/F0ACgkQJNaLcl1U
h9A6kgf+IMdmKF0KbaYf0XsLB5ivBj4EMKow8ByqpE8Bz5QJxO6XZ2FH5gyVO4v6
5JTFBjWP9l11LI7/k3pkq551OHegshjfd+s+ZAzMoHXzv5hSGadtHFKuXZCJ+6do
pmZmFSB/kgUGdmSB/3t4nrS9x0LB9W0Mk4ch4e87ZTfvDJFwtnidw0ZQ18hIatHx
TweBbPO5AeGeubynYuj/1Bp2S1R+o3A02hLLFsttjsWrrJRjIxkMiw8A8qUHOzQP
kNFJIfxQ5rgC3cY2PKAX9bqNJSKABo5ymVKf+cL1Tp29lcRB6aUiBQ9tzjknk3bC
eCkF1jyyzljJmFWSL1d7a78sAl2CqQ==
=OGws
-----END PGP SIGNATURE-----

--bQQvLXIMg8npceXQ--
