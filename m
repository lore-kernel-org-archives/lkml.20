Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA844EE85F;
	Mon, 28 Sep 2026 16:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613092; cv=none; b=Kies/0ybwJskZxOCfTZEYHyp5UudueZ4d8ml2lL8Necxq6NuGEjj53XgoI3Zq/QCheGc6mg0DshexWnF5CI8PogarPAgH7IB9VKUX5FoUunpSy55WLCQC2RxBbs96hPb34x01+AAaAo2Y5MHJGwJVOacV7phCYX/u2Baxd9Tffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613092; c=relaxed/simple;
	bh=X7tuiSkPdQ541N7qK8lWpSLvxSF1OR6q4jOZ2O0iywg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvT5TjcIgc3enHLEhTjIIlafFBKhfjdjXqMYTjqDRMOzgsTaUI76yotGOan39yr3bXmhQqd/8KzCB8H94oYrHCsPZCXdteTSJYn368BhIJDG5n5LT9QNaFzVy/GbzT2VPIcgPAAngdrLSfxfuZvwqD4pP9Gvq7tHxxead/o0cPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQofYHM8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQofYHM8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F371F00893;
	Mon, 28 Sep 2026 16:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790613091;
	bh=u+GecGFatFN3gd4FU0zwdLZy3vmhqUQHcx2HZQZRqDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eQofYHM8uBma/8EpuyIQiXsLcSgWdZZ3UFAlUaDMJ1ELaYDqMqrVxvrMKXmoCMeRp
	 17/u0w+sJDqb779BLRn8Djc2yT38Az1pJque6e73DEmnCO77nUjppWY34d/qq+14PS
	 14dv5JESvVi/AhuXKzUYds6UTkCMMDodNL6w7NBlSsiyDOgc+vhQEzQqsymqQyhN6Y
	 risYv6rabELRHy4reEgIfyF+Z1yAxP///8CX+3dLTxPaJWPshFGvhjMYzeQLL0NHjq
	 DNYFzXZ5quj0r94QhcUaGC6zqUj1zV80KZIMiHcoqH3opWkdNm83Akin8f5phHNF85
	 zvATf4iWAUtGw==
Date: Mon, 28 Sep 2026 17:31:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 2/3] media: dt-bindings: media: nxp, imx8mq-vpu:
 Remove nxp,imx8mq-vpu
Message-ID: <20260928-primal-figurine-2a87db42eab0@spud>
References: <20260928080822.19553-1-benjamin.gaignard@collabora.com>
 <20260928080822.19553-3-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ojMyhCVrSd8uTcXb"
Content-Disposition: inline
In-Reply-To: <20260928080822.19553-3-benjamin.gaignard@collabora.com>

--ojMyhCVrSd8uTcXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 10:08:21AM +0200, Benjamin Gaignard wrote:
> nxp,imx8mq-vpu has been tagged has deprecated since a while and
> driver emitted a warning when this bindings was used.
> Vendor DT use the following node before they moved to mainline driver:
> vpu: vpu@38300000 {
> 	compatible =3D "nxp,imx8mq-hantro";
> 	...
> };
> but that binding has never be documented.
> After driver clean up it is time to remove it.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

This is not a tag that you should put in your commits btw, this was me
telling the dt patchwork that this patch has been handled.

> ---
> changes in v5:
> - add more details in commit message
> - add Conor Dooley accked-by tag
>=20
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

--ojMyhCVrSd8uTcXb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarqWXQAKCRB4tDGHoIJi
0sBnAQC3KVZncC+oc93z8JEN+k1mmcQPrcPZ/QqF5cWDRv1gLAEAs6BKKnMf9fJD
qhFn2pNOcXaqd7qnzod8w2h8rp4NXgY=
=qoRO
-----END PGP SIGNATURE-----

--ojMyhCVrSd8uTcXb--
