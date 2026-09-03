Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702FA374E46;
	Thu,  3 Sep 2026 18:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788458462; cv=none; b=lrE7Amtcjr32yC9gwluZmHdI+GUyxg6gX0xqDHsJTAQT3gezNHUf22Zq20k3uBmaZVwtNUQwtWRl9pdUNIrFREvgKp+oVPo4hET1f5L0Zv2fgENv11dcTG2knxB7CIQNx66DYlOvBDfV2AfWYBByJ8T6EoJJwvSm4BuvNMLBKgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788458462; c=relaxed/simple;
	bh=DK4VkfFkWrqFkAWxJAYSq300vS9p7ZJZs9QGgHIoeAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfTpe8iQT+bnbZkkrdyL8qY62jBVn00ucUjX4cFdKuQ5zvdERPmTUW4cpfAB22Nigw0Fuzium3fEu/Ajus4j4/gG58nX+sabhg4qQwEqDEENb1XCBoCSdRLPY1Vg569Ge1npo3eVRDTM1qy92z4F6+h9Ye6/EbrK3KXzZHViwfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQ6eEQpL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQ6eEQpL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D001F000E9;
	Thu,  3 Sep 2026 18:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788458460;
	bh=MEeb2/7YL2GUruftN094qZjMqYgKj+V79G341wEwVdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JQ6eEQpLEQTSNseCXtideIHM0n5SqjYMDYyFNDnN0/8XuxsTRlS8+mge9KN7HIay+
	 5O4d3vhBL/pOlKfCr9/CHTruSa1blpEhYYi881KEeCtC5ummkoHJ5Cr77Tamd0QSsA
	 Lt7LZdDFQGaNckPhwnYMZRkDOvUT9HfDgWxy3aUhmWVB3RHdmBNkRosImK9GACRr3q
	 YuAMnyaVbBhKmUS0WqhdNH47R4Gm+dwHrg2O5EhGAkvEAnvOVUHxTcdgK1V/caeFPG
	 tIQctEFBTfTCIDwHgYJWCbWmTKhpHH7SgrbYhuVM0CTfd9HMtzpL0Fv083xSd8nlJV
	 Yj2EV9DxosC4w==
Date: Thu, 3 Sep 2026 19:00:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Judith Mendez <jm@ti.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: nvmem: uniphier-efuse: Add
 ti,am62p-efuse compatible
Message-ID: <20260903-sandfish-likewise-820d64daae2b@spud>
References: <20260902222759.736124-1-jm@ti.com>
 <20260902222759.736124-2-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ovc8qnl0w6j+I93l"
Content-Disposition: inline
In-Reply-To: <20260902222759.736124-2-jm@ti.com>

--Ovc8qnl0w6j+I93l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2026 at 05:27:57PM -0500, Judith Mendez wrote:
> Add ti,am62p-efuse as a compatible string to the uniphier-efuse binding.
> The uniphier-efuse driver can be used to read AM62P efuse registers as
> well for GP_SW silicon revision detection.
>=20
> Signed-off-by: Judith Mendez <jm@ti.com>

Why is a fallback compatible not suitable here?
Either it is, and you should add one, or you need to explain in hte
commit message why it is not.

pw-bot: changes-requested

Thanks,
Conor.

> ---
>  .../devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml   | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-e=
fuse.yaml b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efus=
e.yaml
> index e27cbae2d63a0..5e1b90fc1ae45 100644
> --- a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.ya=
ml
> +++ b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.ya=
ml
> @@ -16,7 +16,9 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: socionext,uniphier-efuse
> +    enum:
> +      - socionext,uniphier-efuse
> +      - ti,am62p-efuse
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.34.1
>=20

--Ovc8qnl0w6j+I93l
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapm12AAKCRB4tDGHoIJi
0mEIAP9Wg4TCyWqgwIeAjMW/q5Hh+9wLEALXbKS4v0y+J//NagD7BS/4ZyWf+Mzo
iz4cPCS7+6UGINi0ZS4J8+DsBF6ONAc=
=IYI1
-----END PGP SIGNATURE-----

--Ovc8qnl0w6j+I93l--
