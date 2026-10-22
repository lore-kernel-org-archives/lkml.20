Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676580;
	b=UDGCjqtBOWFfu+jp5Oh0Sf88RJLqQ8ItpEkpUc/grRGH+dyrwaHdqhEXneZD0xZvAgyI
	 jCLxiXL4CYRHaaAqjcEP3dPf+cljC7g52wfRd1U4ST2Mu0TfIl2pfdVgHo9dJAT10g43D
	 NYfPKvD9qJ86wKtKdSuqOEdhV/XZxgWXbdgb/VNSHyRq/TUEc5D7K9fT/dOCVSiZpPgNP
	 gUvEWbo3boKp1AoagWlyLeDRqzCHyuycEDwiRGXKICZ6pMlaXeEOEztrBYoiEVJ3rMPAe
	 UG8ogo6cr1Nu5LI1tj0qQoFf2G/S9nifH4tUGcr9PWKBaFtPMS/JXdEbHKu5oOIpEGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676580;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=1+ogZALtuYaVbbvYSCJpHN6CYuYloUVzu32WIrtGohM=;
	b=Y2sXz4z2p0qzgnZKG6KrbsKDK37H+ppY0Y0euf4untgNNpwXzVssFG/KgikgG68Ir0z7
	 /T71yT9MCcLSA9MjwlJX8qwtehZyYq178Q7S5u/LY/IlYUbybvi6EIj2ovnk8bnZqspGz
	 HUq17Oa2KwYuWudR10hJV81fX8qTFL/P3osSvKQnQLGx9nPc+KdM6NoUdEbwD9Qvlezll
	 7kI5Cfsls3FiFoAQapMgqYrtxtR6bag2BaTRWDc0674hLXl6VDVJrzKk/LBXYVK7oZ2B0
	 kFKF2wBohQo9yzLaGDq/PTFJrId2rh5HILF2afCWtEAeo9m0QwX7fxPpzzveP8LOZqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hKcBjQuG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737A360A2617;
	Thu, 22 Oct 2026 13:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hKcBjQuG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53FB1F000C1;
	Thu, 22 Oct 2026 13:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676580;
	bh=1+ogZALtuYaVbbvYSCJpHN6CYuYloUVzu32WIrtGohM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hKcBjQuGBysybbcbU2Mjk9lOLKOOzBeZ462rhwTKkgFosTHiRJeDJ2RQL5QJ/pOh1
	 xPOl4Fe0tzhg53EunEYeaXkD+s/KL2jDA2tzJpdbm7oOy+c/fhrcrbKU/jo/EpnSbS
	 5kJF6uQqD2eP7PSj25m44P6dQ5UXtIKoi+MUwWKvwYUScQU9WQxuygLpwU+qQ5ou37
	 GPK/TaqHRZVoDvAo6Nr9Qt//ONkJjOFZQ6xmftnMWcazqk2dnYYVGtnsZeQnhRzXVl
	 UIHfURbkFT11dplO7+ouSKPOUeTwCfQFY4q+2UhyFwU1oVxb+wzdJ1byIc94/LuQQc
	 CC8RCcAznPRYw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id EDDD81D25C72; Thu, 22 Oct 2026 14:42:57 +0100 (BST)
Date: Thu, 22 Oct 2026 14:42:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 0/5] Add TI LM51772 buck-boost voltage regulator
Message-ID: <atoS4Rrxw_UIH_np@sirena.org.uk>
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="WoNRSvV80S8GR/CV"
Content-Disposition: inline
In-Reply-To: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
X-Cookie: Whoever dies with the most toys wins.


--WoNRSvV80S8GR/CV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 12:27:41PM +0200, Paul Louvel wrote:

> static int ptn5110_tcpc_set_vbus(struct tcpci *tcpci, struct tcpci_data *=
data, bool source,
> 				 bool sink)
> {
> 	struct ptn5110_priv *priv =3D container_of(data, struct ptn5110_priv, da=
ta);
> 	int ret;
>=20
> 	ret =3D regulator_is_enabled(priv->vbus_high);
> 	if (ret < 0)
> 		return ret;
>=20
> 	if (ret && !source)
> 		return regulator_disable(priv->vbus_high);

This is buggy, if the driver is not using regulator_get_exclusive() it
has no idea why the underlying physical regulator is enabled or if it
has the ability to affect that state.  Even if the regulator is held
exclusively we still do reference counting for the driver so it needs to
be certain that it never enables twice.  Outside of bootstrapping your
driver's internal state you should neve use regulator_is_enabled().

--WoNRSvV80S8GR/CV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatoS4QAKCRAv73Ows9A4
iSiRAQCUmKlAEYT1sm7OVRbtPf4gtZVqYfu2xyI5Q5m8OdnKZQEA6tVk1FdIV+om
T70KAw5KC/WPD3/y/AKBKyaNeDo78w4=
=LHz5
-----END PGP SIGNATURE-----

--WoNRSvV80S8GR/CV--
