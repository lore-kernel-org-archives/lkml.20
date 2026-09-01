Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2065A345EB1;
	Tue,  1 Sep 2026 17:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282037; cv=none; b=j4DZ75W8YP14szuerbyNricyWTTNWY38rIuYQMq0kcCTQUmvs1VQMKiiYE7mnIktq22PQQj5dp7+89pspt6WgXYC78ikItZwnlahpsdMONjNmfkqmHxOBx5iZDQOfiXj9kkbkm6pq3jXPNb4uBfWVD4GDZ6rS1Gj6gIVCqw+Meo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282037; c=relaxed/simple;
	bh=vJcrOe1u0QpD4vv5iv5CaF3pP+ZDMWWWvspt5KwK3Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/ABfYToAGSLq6beUCX8mnFpaM+5KdQaiFeqmff8AYReIDO0lZq6X9v+xuW9A2DPme7UT+grVjKX1P/LPtrRoDFV8CGty3fkyPvMsV48fIw1FmoWs/+JSaeJHCZUjB3chOWz+QV7zdupmpBWImL7F5LG1RwBE0KF4GrRgUNSFeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQFAV1t4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQFAV1t4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7F61F000E9;
	Tue,  1 Sep 2026 17:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282035;
	bh=VGtP5h8GP0nM4DDTBfEBAj1tW6cv0CwmwBEM79Toj6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VQFAV1t4aKZCcuWlBucitg9UYQ/pMrtKZsS9Yp2QyCsbwLps1nhNWzR+3x00Mwamx
	 NbnfCnhOK8yW/Zeq3NZy/x10wdpkGmuj86FqKlLpP6kJuaVyQ42T5crRyPE4WOptid
	 6PdlNs9IuUJVneValPEA4TB0olUUqB/7fYnCEU4/T5srcZq61SKaR0af/GYE9IAuUe
	 rUuVQF9iLfeTlRca1+UirMeuMjFSoWUYP+Sk0zOsztQEaYh+Fyu/kRCtXtu9kbVjZ1
	 sY6pMHx7BjjXuhnRedWDfpZNencxbPSM3iga0dvwepP58EXeHfaQqFLYDTTj/eAV86
	 +7h3tRlkwVj/A==
Date: Tue, 1 Sep 2026 18:00:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	"open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mfd: da9052: allow dlg,da9053-aa
 fallback to dlg,da9052
Message-ID: <20260901-devourer-pushover-f26c72688255@spud>
References: <20260831201522.51294-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WYaMNmY1aKEUWsQD"
Content-Disposition: inline
In-Reply-To: <20260831201522.51294-1-Frank.Li@oss.nxp.com>

--WYaMNmY1aKEUWsQD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 04:15:21PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
>=20
> Allow dlg,da9053-aa fallback to dlg,da9052 to fix legacy platform (> 10
> years) check_dtbs warnings:
>   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: dialog@48 (dlg,da9053-a=
a): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
>         from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Previous try drop dlg,da9052 at
> https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quo=
ll/
>=20
> but Krzy have concern about compablity.
>=20
> https://lore.kernel.org/imx/20251107-matrimony-showdown-ba6ce6996b2f@spud/
>=20
> Conor prefer update old dts.

I don't think these devices are actually compatible, so this fallback
would be wrong.
The data comes from the match data, be that spi or i2c, and there's
explicitly different behaviour for the da9052 and da9053aa.
I doubt the legacy platform ever worked properly, and this is what should
have been explained in the PR that Krzysztof denied not just blindly
citing a dtbs_check problem.

Nacked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/mfd/dlg,da9052.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml b/Docu=
mentation/devicetree/bindings/mfd/dlg,da9052.yaml
> index 1103a8cc5cea4..d1d23c7c4d0c2 100644
> --- a/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml
> +++ b/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml
> @@ -18,6 +18,10 @@ properties:
>            - dlg,da9053-bb
>            - dlg,da9053-bc
>            - dlg,da9052
> +      - items:
> +          - enum:
> +              - dlg,da9053-aa
> +          - const: dlg,da9052
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.43.0
>=20

--WYaMNmY1aKEUWsQD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapcErwAKCRB4tDGHoIJi
0pUMAQC7BV0GPyb01VEyEWhn/BVS+JygSLlqCFl5z28zdPCjvwEAs8uDma/NGcCv
/89K37u48N8DyY1o7RlCSJp0o4EGoQU=
=t2nO
-----END PGP SIGNATURE-----

--WYaMNmY1aKEUWsQD--
