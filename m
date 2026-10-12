Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FE53B5307;
	Mon, 12 Oct 2026 18:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831281; cv=none; b=tUI7sDysZx3NnbS1h30+SXhhbEF0xDtmwq6x2njc536D+gX+PFDgF6iDZRypCDCCtt42GBcy0kYeAYJD7EZESpEJJdUX4vtPvXOLdX3M1Apws6DY9MW6FsOoM8866sGlqMd8Cgvp5R19igTmbjrn0nVqyU2BjxvnSAc+/flnk5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831281; c=relaxed/simple;
	bh=kt3AHKJo+4iQtGNqhPlcFd5XbJ7Ia6xc5/XlTPmLaK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eE9oUe8rocyP87/o+ygsARpJyup4C84apzQeMAHhXs9PqjDWibHPxBRkOS5GziUjPTvX4hKaABpZDiNdb0FI7f54zrrfGlLeAoJABmHJ93r5AVnIzsOX9sPxv27WLVq4YbBPWtXtJ20UtmRD36kAUCEfIYEHJWy1+myphfWTQQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvEE5ZPE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvEE5ZPE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D18F1F0089B;
	Mon, 12 Oct 2026 18:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831277;
	bh=l2zp4t4NyTHWHTKgbsdObniAY39EXm7EQZMRjqNl5/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QvEE5ZPENu7PNxG06VtqOrBJ9I+4/4AvOSce4C6PgW1JhTezsdxcBc5OFRgf7tKXe
	 uNaVspMFklqOciONRUFo9ovRO0fX8FHiWTlXEgnaJpSSQV7nBUmajlK678Jczj+ZLy
	 CU+1EMdvfFcAStiHOslndLlC8/KnyFMixWDmR4D4gudeBQY4eBCFQinb14X3x2CCxp
	 8udDd04Q8OMo8sF6mH4hp87AnNiRX2BkSoHP+EAD3oDz6flQ4fdOSvhnnETifVCwUa
	 1U6L5HRjHs1VXwQP+zioa0qRD15ccFovMB3KraCwUkWvyvxnhzS/AgVqWGSrESsIyN
	 VF/wIIpWxWLGA==
Date: Mon, 12 Oct 2026 19:54:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Luo Liu <Luo.Liu@cixtech.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gary.yang@cixtech.com, fugang.duan@cixtech.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com, p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org, Wuyi.Shen@cixtech.com,
	EastLake.Yang@cixtech.com
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: Add CIX Sky1 DP PHY
Message-ID: <20261012-founding-stench-55cff46fe1a3@spud>
References: <20261012123618.648930-1-Luo.Liu@cixtech.com>
 <20261012123618.648930-2-Luo.Liu@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q6HPCk6NTpYhk7J2"
Content-Disposition: inline
In-Reply-To: <20261012123618.648930-2-Luo.Liu@cixtech.com>

--q6HPCk6NTpYhk7J2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 08:36:16PM +0800, Luo Liu wrote:
> Document the dedicated DisplayPort PHY on CIX Sky1, including the
> optional cix,external-dp board property for external connector swing.
> Add a MAINTAINERS entry for the binding and driver.
>=20
> Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
> ---
>  .../bindings/phy/cix,sky1-dp-phy.yaml         | 53 +++++++++++++++++++
>  MAINTAINERS                                   |  8 +++
>  2 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-dp-phy=
=2Eyaml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml b=
/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
> new file mode 100644
> index 000000000000..c6914cab74e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/cix,sky1-dp-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 DisplayPort PHY
> +
> +maintainers:
> +  - Luo Liu <Luo.Liu@cixtech.com>
> +
> +description:
> +  The CIX Sky1 DP PHY provides the PMA/CDB register interface for the
> +  dedicated DisplayPort instance on CIX Sky1.
> +
> +properties:
> +  compatible:
> +    const: cix,sky1-dp-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  resets:
> +    maxItems: 1
> +    description: PHY hardware reset
> +
> +  cix,external-dp:
> +    type: boolean
> +    description:
> +      Use voltage swing values suitable for an external DisplayPort
> +      connector instead of the default low-voltage values.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - resets

A reset but no clocks? That's a bit hard to believe.

Seems fine otherwise, unless I am missing some sort of common property
for the voltage swing stuff.

Thanks,
Conor.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
> +
> +    phy@1414c000 {
> +        compatible =3D "cix,sky1-dp-phy";
> +        reg =3D <0x1414c000 0x4000>;
> +        resets =3D <&s5_syscon SKY1_DP_PHY_RST_N>;
> +        #phy-cells =3D <0>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c..b46d0f4220a9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6360,6 +6360,14 @@ M:	Satish Kharat <satishkh@cisco.com>
>  S:	Supported
>  F:	drivers/infiniband/hw/usnic/
> =20
> +CIX SKY1 DISPLAYPORT PHY DRIVER
> +M:	Luo Liu <Luo.Liu@cixtech.com>
> +R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
> +L:	linux-phy@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
> +F:	drivers/phy/cix/
> +
>  CLANG CONTEXT ANALYSIS
>  M:	Marco Elver <elver@google.com>
>  R:	Bart Van Assche <bvanassche@acm.org>
> --=20
> 2.25.1
>=20

--q6HPCk6NTpYhk7J2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0s6AAKCRB4tDGHoIJi
0iXrAQDtZlLwnBeXrt0sJP/AohrnXaoa1UW1wN5d8Yjkimco7AEA1Aly54IhsVhf
2zcuFqWPKZ7+HlGCLNIbW0h8KFKPPQA=
=oFLx
-----END PGP SIGNATURE-----

--q6HPCk6NTpYhk7J2--
