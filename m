Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507223;
	b=ihe847UbuGC5e+3EnN7nGCHbGK0Eh8m1XOdI7o158qoe9Oh6cKnNDJj5WDH5xBLrRN58
	 JO4YsPXOYvjh1RqHo5uhTpxvWuzYf5p755YZ5jgUNRqZF5SRP/rRitzpIgrzm8i6J778O
	 D8djHFwaXhcY9kTWAyHmcOyaSMOyGjBu3RiED4PL9vsgH2+kCqwZV/wg6eZZ1rRnHIRFL
	 sSCJ2wEdNRozCBsIvon4Aw9Hgh9P6bZ6TEfZeiQErEdCto+gvZY0AHtQYLTnnMlwEIuey
	 owJRq9XxjUoML0qfBR1cYuL6JMO2BGJCJ87kQECHcRSQDb9ffvhTojq2G1oIaB5y00Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507223;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=72ZpnAa/RcMFSpTjgWz+4Ld+KYeV5+tMJ+T++yPIdUo=;
	b=gp5pwlGmQs+uNJwhTPZZnzfEaNBEDbVQAl+baA4NmAC2hH28QmBU4Hz8aM1jyIvVWejb
	 TUXfk8kyto9DYn6FIV/SjQF0prQSm0yPZn9eCLJcL4CbfVXUM+NGJsCld7xX2zE7xF4la
	 LgB3+jFaEzcb/KXAcl304L5MMVo1fPK1f2OxaKbiPgO9Fkp/l1bHYh7zezTD2xYh7RHPk
	 d7a6EHLHrhSh3n03GyqXFu6pNo4AB7TxODqXCpXLpo6Tn8szNRt2spuEq7K9ZdfKAEQki
	 PtLjySVvIlxifSraRSrdL14IvC+O14f9gwycSUWgTh8mILQnfUnIwdveMdVU2Y4f9SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SHK19CIj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FF9606A32D;
	Thu, 12 Nov 2026 18:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SHK19CIj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064C01F000C6;
	Thu, 12 Nov 2026 18:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794507223;
	bh=72ZpnAa/RcMFSpTjgWz+4Ld+KYeV5+tMJ+T++yPIdUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SHK19CIjJpFZPFe/qJHDrYZsPMHc3oI6BOSA1o+nmDvPeoMFyqRipBEM/dCtmEEqn
	 2+QDeq8USh+2KtpE+rI7ZTcOBFhucUOdqV0nj5k6tZkXpiVTPsXEnp7Nl19brAWTyQ
	 Ro4Jx485+PqxPqnPSvqoDxAsgyx5K0KXTcopYSbKTZ47KPtB/sWMqZE2t7Zf76cR7Q
	 dP10p/NukXq/HdbQsK0AAQb24/BFARxZZ21U1ZT977j66k0VxXYB1qRFViXFUgBxI2
	 MwUeSqonLXrhSE2JkqP1E8i0NQA2cE6q8xyvXJd43KVaL8acMrPBPk+1HDAhjZ0Cu2
	 e+ZNncVx2DIQw==
Date: Thu, 12 Nov 2026 18:13:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Artem Novak <artem122novak@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] dt-bindings: vendor-prefixes: Add Casio
Message-ID: <20261112-reprise-jukebox-41fb305e9044@spud>
References: <20261111212921.290857-1-artem122novak@gmail.com>
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
	protocol="application/pgp-signature"; boundary="AaFKUHLvjrwzrfJb"
Content-Disposition: inline
In-Reply-To: <20261111212921.290857-1-artem122novak@gmail.com>

--AaFKUHLvjrwzrfJb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 03:29:21PM -0600, Artem Novak wrote:
> Add Casio Computer Co., Ltd. to the Devicetree vendor prefix
> registry.
>=20
> This prefix will be used by upcoming Devicetree bindings for
> Casio calculator hardware.

Why is this an RFC?

>=20
> Signed-off-by: Artem Novak <artem122novak@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 5471a06f93f1..f05475072eec 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -303,6 +303,8 @@ patternProperties:
>      description: Capella Microsystems, Inc
>    "^cascoda,.*":
>      description: Cascoda, Ltd.
> +  "^casio,.*":
> +    description: Casio Computer Co., Ltd.
>    "^catalyst,.*":
>      description: Catalyst Semiconductor, Inc.
>    "^cavium,.*":
> --=20
> 2.56.0
>=20

--AaFKUHLvjrwzrfJb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavYB0wAKCRB4tDGHoIJi
0oYiAQCDJMrIVaXZpHf2XqYRX0BgzrS9n1V6b8+Edi5Qb7TqWwD+KJYla4TLOQnF
ZrHENtg2sPnOGPHXwsYoythAtyELeAs=
=Iz9e
-----END PGP SIGNATURE-----

--AaFKUHLvjrwzrfJb--
