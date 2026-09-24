Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240E13E3D80;
	Thu, 24 Sep 2026 16:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268934; cv=none; b=TQUbvNSAoqJmbPbilSvqdhgZKVFx+23sSnZa/2fY63ktT5WdMYoWTa49+dasqH8fejmLs7SHrl+dtX8GT9sFUkixnq2fpTGe4YgvDtd4Mkby4U794s54B1SWaCeGrCeSXv64UnrvWm+2HY/vd329EJevVnmVlXMLVFxi2DJ50QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268934; c=relaxed/simple;
	bh=y2cl3GUnRqWPP5br27Yo1EHhLrOsRQAml+dpchk9zAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJ+ba0Ded7tuKhz42INDkC20nrDrj0FMveiGbjrnbfgNs2d3t7F3cmugjl2ZzDJW83TUYSTqswGdvA+o47QA3nwqV7GJTVRW4JV29hvh0dBBvgQYd/hbRX5jzUpl/ZidCeOCQ7HUqhIqKeHgJf0TCEYgPpHukWUa13oF+FVtOZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8jyjQG5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8jyjQG5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D951F000FF;
	Thu, 24 Sep 2026 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790268932;
	bh=fq72bTv0aDg8FP/1veCJLfYhWi+ANAEEZ3M/sgNIuzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X8jyjQG5wgjV3njzYK5bFpjnqGZC1M20JAXdKp9H0BJ2imlh+/DPGGmFmM4ki+co4
	 k+OyAK/d4VWEP+/AxAqhE1w3+QSxvKozoMFwSBG3txdgWQlyQhMSczIN8hj2zkKZ79
	 ySKIcaOGnKWJi1eoCtoooaoyG13R5c/9C1aGRSaNvERVUX1qpCqEl5XsuqzDFRXomz
	 Icy/rFVg6U0+gL/QgdEWvPqTzDcCwPILCuEfN3z6KJmA2i18cStbLj8Qa7Z1nUdv19
	 dlGshJAyfLYAZ0ZKR6kPdeX959KosICrTQdt/YXLA9BdsQbSA6I3I/6mFwHHDZzZfl
	 B2EQW6jDQU5XA==
Date: Thu, 24 Sep 2026 17:55:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v3 2/3] media: dt-bindings: media: nxp, imx8mq-vpu:
 Remove nxp,imx8mq-vpu
Message-ID: <20260924-compare-useable-3e2863b66924@spud>
References: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
 <20260924130453.196299-3-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GsCwYJZyFBXDIRyI"
Content-Disposition: inline
In-Reply-To: <20260924130453.196299-3-benjamin.gaignard@collabora.com>

--GsCwYJZyFBXDIRyI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 03:04:52PM +0200, Benjamin Gaignard wrote:
> nxp,imx8mq-vpu has been tagged has deprecated since a while.
> After driver clean up it is time to remove it.

No users in linux doesn't mean no users, but I am guessing that there's
genuinely no users elsewhere and anyone using out of tree devicetrees
should have updated due to the warning at runtime?

>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml      | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml =
b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> index 19528262810a..69619d2c86fa 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> @@ -14,12 +14,10 @@ description:
> =20
>  properties:
>    compatible:
> -    oneOf:
> -      - const: nxp,imx8mq-vpu
> -        deprecated: true
> -      - const: nxp,imx8mq-vpu-g1
> -      - const: nxp,imx8mq-vpu-g2
> -      - const: nxp,imx8mm-vpu-g1
> +    enum:
> +      - nxp,imx8mq-vpu-g1
> +      - nxp,imx8mq-vpu-g2
> +      - nxp,imx8mm-vpu-g1
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.53.0
>=20

--GsCwYJZyFBXDIRyI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarVV/wAKCRB4tDGHoIJi
0o8JAP9bPWkftttTcroD/Ebf05mqIGTFa7OMd08w4VwH1mEEgQD+LPTr10IFTyQQ
y//zL0pKXfEzCfB463vA15kwJ030OAg=
=7zii
-----END PGP SIGNATURE-----

--GsCwYJZyFBXDIRyI--
