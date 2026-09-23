Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D79496D59;
	Wed, 23 Sep 2026 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160227; cv=none; b=rZurJVJv5H4jfhGBN/Orq7EzEdshBGU1cyuf9TW5xSyCYq13Z/ukPBD6VSALcp99fE3LnR0aYlC7kXX536ARRf0d3rEfD+aLptK84ZlIhFyxMo5orgR8z9Uh5LcGWTZKsn3YBYSzaz+97gcTag88MPoRhEWkAmQ4/YFgF3HwR0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160227; c=relaxed/simple;
	bh=/BnUiVRvcNHa2KPpp6zvAu0tfKFmtJyZhtCSNlUuqXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9ckBcxWByb0SGzO+5WuyKWXcyIkDkPE6mPglsSLb1O1hROMgFlOAr38G9o7HqwCdBBl2kNs84ZU6/Nd20Zk9EnCgcSjCyC6LYYg4cYlMwUH71V0V4/bU9ibcXpHI3IKte9P3AU9nEZvBZtygu9kMwq3rUtpYrZJcSku8feCrvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPNSWzft; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPNSWzft"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5A31F000FF;
	Wed, 23 Sep 2026 10:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790160210;
	bh=rSYdeLGJkEp6RG4mLhV6bWVDxhISM2o2G8ISMbTkn9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HPNSWzft368imB4Jhn8LvwdCx9ipMDPvZXMaiHJJ61dxo5m6ERjbY2w3iThBHmQLT
	 GLrl204KOo9ylSJcKrwXQqQQa9i14Y9uVutsmAa3HTwTMOBDSmJmC6a6Ms8QgOl7fN
	 BjGfhAUJcTzuG51nCOgrHNZQQthQ+xKYWLCNYXLXyDWFvxWbxa+kipvtpXN+rJszud
	 kUPKL1YV0O/zNQo4718LIb7wvxO7F3FjzkNQNz0wOI7DGEUA5ee2udfmWaCpyIpzc7
	 sKC0Bi6qkfkm0zyN8+xdVUroFOlhVOA5U+6ARO9a2letyJwnkbyR8dePyXzrgBo3M5
	 cgSxxEcTfK/ug==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 64B7C1AC5739; Wed, 23 Sep 2026 11:43:26 +0100 (BST)
Date: Wed, 23 Sep 2026 12:43:26 +0200
From: Mark Brown <broonie@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] regulator: dt-bindings: Convert
 mediatek,mt6380-regulator to DT schema
Message-ID: <arOtTntGW-ocXRxK@sirena.co.uk>
References: <20260922195502.818012-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+UzvdQb/G35qJU4t"
Content-Disposition: inline
In-Reply-To: <20260922195502.818012-1-robh@kernel.org>
X-Cookie: Too clever is dumb.


--+UzvdQb/G35qJU4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2026 at 02:55:01PM -0500, Rob Herring (Arm) wrote:
> Convert the MediaTek mediatek,mt6380-regulator binding to DT schema
> format. It's a straight forward conversion.

> +  '^buck-(vcore1?|vrf)$':
> +    description: BUCK regulators
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +    required:
> +      - regulator-min-microvolt
> +      - regulator-max-microvolt
> +      - regulator-ramp-delay
> +
> +  '^ldo-v([mat]|phy|ddr)$':
> +    type: object
> +    description: LDO regulators
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false

The LDO is an object but the buck is not?  I'll apply, but the above
looks weird.

--+UzvdQb/G35qJU4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqzrU0ACgkQJNaLcl1U
h9AfYAf/ampyiNIlGnZ0CyLLiNBSD8wKSANZb1KXzkse0dMyKkbrRYXjL2p/VrGt
fj91VMtpTD+SrBud3kqnEWbQ2Z8DZb35yxRPGloijv7Mb+8Br0+9PLEj9ll3Nhx5
vbZwPMynyBUyt60ttPOAb+cnFYi9b3E/6swkSQwsDknwW3hW4nRs7M5EzF3kaAtj
9GaiKMQBlKOSNlIMI3jjNZnYrdYxfo0jyJy89Y0AuJnKahY7ZExbSToAp8OlUM3J
Oa0yayxZFKv4eQGsV9OUCPpZxLvXNa53MjOMPcTmcZQe0DBuc08YHEsQAoGAbu6U
dFatjPp/Hsf9ZouwaYE8W8/NyS7KzQ==
=qIJ0
-----END PGP SIGNATURE-----

--+UzvdQb/G35qJU4t--
