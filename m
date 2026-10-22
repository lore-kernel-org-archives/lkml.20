Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689668;
	b=vRj+Sn6xJwTCpU36vLeJYq2/CfvVsvZQnDNHmkAtsTXUgGw0baRTOooj5ezs9+Zbm8YF
	 /HYE2S0K0xOqMn3jNgjqlFrdD0aIPfOYrKZG2AuR/Hcau+QSaTQGT/I6DeCpob6LnSOqC
	 7FvlcsBaILLnC2koyltOLv5FX7QIm8LBALj5dQ6RwCAGS1uSS0oN41Myk822LUaFyhX3t
	 9N9rMy6vQSd87dIFsjt+rnkwLM4N9714VGkwN5WkqbQUgONA7pqS7RIrjfRtBuNJXw3KH
	 FVIkpeymVZGoq1UrC6havTuCv1tgBeTsV07y8KsNuztJTRoiSF9BFJNX0SqS3MZJGEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689668;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=UmbbkW4PsvqWRJqpH7ekWbjrl19bWRyZGRTnrRj0lig=;
	b=UQrtDCCj5QpwCYsrtY/oOggBg1qcSswwAZfGDp5OxYDG5velyQVbKmiDLyahgkF7hMcY
	 W6NZMlEz4HgylZZ/1H6JtHFAti7TyPQDRo5oAxrjyOxmHDemz4jC9QI2kDzujAOSUUB34
	 3WQ3uIekk62u+etPNCU4hVVZz7AXDk28QNYnvC+nvfXg1NedLJfC8Gq/MQHJy5Aw9vVDn
	 o7/Ehq+39XAHY2mWCil+EcuNrVCATsZZA2lqw19/Q3tO6i/HC5dRmaghsHYEgcwr8brGD
	 LxZojpv1eg+XTimMCyD9WTzeupz5vTF5G31VbrVoF7e/+qy3x9NZ4IUN4f/TeW6S6cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CY1t8i7U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C723606A31A;
	Thu, 22 Oct 2026 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CY1t8i7U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932DF1F01828;
	Thu, 22 Oct 2026 17:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792689667;
	bh=UmbbkW4PsvqWRJqpH7ekWbjrl19bWRyZGRTnrRj0lig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CY1t8i7UhvN4lPvxrsE0pZrxVxo3hSnDmvE7lthip+c+4AKLM9remzWIZ71SUmfZf
	 32d2OGERgj311VmlrkDNFrH8yTt1gWyxvnbtbcAHhZPCboEGhwj5gy867j5l+OfPrk
	 8OJzlcBadX3ADBR69qsMGkSioCcNJ4JtlgB73VnaeegvamiwMHMe6+yu5XGl3AMcpn
	 3ZJ8mqS2BpXMkCzYwCzHCm7VYwgXE2l+f8XLWuOn1oPAt2mzypiRimEC2eElxLyHhf
	 JWuf9A9/yPyae7U9/DnjfbwaCWGQ8rdLHHEVHqpmftK0X8aFXCV19v6c/Wa7TwOMIj
	 I6/374gneec3g==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 60A511D529F9; Thu, 22 Oct 2026 18:21:05 +0100 (BST)
Date: Thu, 22 Oct 2026 18:21:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 4/5] regulator: Support regulators where the voltage
 selector spans two registers
Message-ID: <atpGAeQIzOBnYzZS@sirena.org.uk>
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-4-25f0ffbffa8d@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="fZZ5TlwM+cexqYO+"
Content-Disposition: inline
In-Reply-To: <20261021-paul-lm51772-v1-4-25f0ffbffa8d@bootlin.com>
X-Cookie: Whoever dies with the most toys wins.


--fZZ5TlwM+cexqYO+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2026 at 12:27:45PM +0200, Paul Louvel wrote:
> Some devices uses 8-bit registers to store the voltage selector across
> two registers: one for the least significant bits and one for the most
> significant bits.

> +static int set_oversize_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
> +{
> +	int val_bytes = regmap_get_val_bytes(rdev->regmap);
> +	__le16 val;
> +
> +	if (val_bytes != 1)
> +		return -EINVAL;
> +
> +	val = cpu_to_le16(sel);
> +
> +	return regmap_bulk_write(rdev->regmap, rdev->desc->vsel_reg, &val, 2);
> +}

This ignores the shift and mask but the get still pays attention to them
due to code sharing.  Either there should be checks that reject them
like we have for val_bytes or there should be a read/modify/write here,
obviously the former is much easier and that'd be totally fine.  IIRC
there's some existing drivers we could convert but that's a separate
thing.

--fZZ5TlwM+cexqYO+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatpF/gAKCRAv73Ows9A4
iQxfAP9cl6lgmNSCpfgQko3d065Edcu66Tsg+9VqFrRxXP5unwD9HiizsH0ObC3l
ATa7ff8bDB79X2IVn+SXpzBlZx41igY=
=MczX
-----END PGP SIGNATURE-----

--fZZ5TlwM+cexqYO+--
