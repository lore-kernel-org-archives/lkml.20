Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3958B429838;
	Mon, 31 Aug 2026 16:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192257; cv=none; b=dz//iwFUrutL6w/baJApZ2rEjKBXr1Tnr9Z4G2HFhtrIhoUzz4eaiVvwi8yHE/G0twxj6e6yi005YWUpLbNIKhUrJxER0rtAkGEkTfWHlre/QSqEO4iiPOmLNxPa3PR2omb3peMwBsojpfDs6/4CWY8Hn9RBfhkQqVqADqYD6F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192257; c=relaxed/simple;
	bh=mn0I+oybEDI4d3908JwrXhBlFaAjmy8I9oPngGfjUf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFj3rSodaD66wnmpIidu6fDXgvtlMlgUBImNWk+axXbIzz/qcbS4vlUurX4dLOhviysTjcsIBAR0/jvEefZ0zHUfucUiMGUAJ9E5blyQOdObSssZg29GtdUu1+Vfon4N/cinacfGyeKwIUmdXKVuxsEu9WSDpbXr23CqpAPAXUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGV61OLs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGV61OLs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B7B1F000E9;
	Mon, 31 Aug 2026 16:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788192255;
	bh=l45S1FIaD59xQAqPUTAkPZR5Cbk0GE3PNFGvxtQ232o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hGV61OLsRWpOhdP8vNKS35Q75/KPtDnrrucz2L/aO5/LlmPq6tN0JWYps2SOG9gB8
	 TxEzOqu2R3MvnyC5cptVR4wjlxS9kSBvGF5K6HqYE/4qxgP8cqoxacV0hZ2vzSikn7
	 ulxgrkuvnL6r3ilgbBVxt0Epd9BcsJcNzXYvQ9pECNqICpfY8oPJ6CGRB+6sId6pvL
	 EoHLlxTQELR4sjNzvHZaoEs7GZnJ3WZth9lfJbc8cJCXx3E0RPmBXMPU2Y1aduRsI1
	 k2yrmmhhJPVWpHPHKcqwS/WnKjryPbhyXQvnqALIn/N1w+K0ZsCjy0tk3dZyNA1Nm4
	 Z+hXLzV+PzT3g==
Date: Mon, 31 Aug 2026 17:04:11 +0100
From: Conor Dooley <conor@kernel.org>
To: zhentao.guo@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
Message-ID: <20260831-matrimony-ability-e5fcf150d213@spud>
References: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
 <20260831-b4-s4-vdec-upstream-v8-3-830195b9bd91@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vDuQ2UyDODDws11u"
Content-Disposition: inline
In-Reply-To: <20260831-b4-s4-vdec-upstream-v8-3-830195b9bd91@amlogic.com>

--vDuQ2UyDODDws11u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 04:32:04PM +0800, Zhentao Guo via B4 Relay wrote:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
>=20
> Describe the initial support for the V4L2 stateless video decoder
> driver used with the Amlogic S4 (S805X2) platform.
>=20
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>  .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 106 +++++++++++++++=
++++++
>  1 file changed, 106 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml=
 b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> new file mode 100644
> index 000000000000..a93a2140801b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Video Decode Accelerator
> +
> +maintainers:
> +  - Zhentao Guo <zhentao.guo@amlogic.com>
> +
> +description:
> +  The Video Decoder Accelerator present on Amlogic SOCs.
> +  It supports stateless h264 decoding.
> +
> +properties:
> +  compatible:
> +    const: amlogic,s4-vdec
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: dos
> +      - const: dmc
> +

> +  interrupts:
> +    maxItems: 2

What are these interrupts? All other properties convey the info via
mandatory -names, but interrupts don't.

I don't love the lack of items lists on !-names properties, but not a
big deal to not have them I don't think.

On account of the interrupts:
pw-bot: changes-requested

Cheers,
Conor.


> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: dos
> +      - const: core_vdec
> +      - const: core_hvdec
> +
> +  power-domains:
> +    maxItems: 2
> +
> +  power-domain-names:
> +    items:
> +      - const: dos_vdec
> +      - const: dos_hvdec
> +
> +  resets:
> +    maxItems: 1
> +
> +  amlogic,canvas:
> +    description: Canvas maintains an index-to-physical-address
> +     mapping table that allows the 16-bit AMRISC decoder core
> +     to access 32-bit or 64-bit physical address.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  amlogic,secure-monitor:
> +    description: Used to decrypt and load the signed decoder
> +     firmware through ARM SMC (Secure Monitor Call).
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
> +  - resets
> +  - amlogic,canvas
> +  - amlogic,secure-monitor
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
> +    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
> +    #include <dt-bindings/power/meson-s4-power.h>
> +    #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
> +    video-codec@fe320000 {
> +      compatible =3D "amlogic,s4-vdec";
> +      reg =3D <0xfe320000 0x10000>,
> +            <0xfe036000 0x20>;
> +      reg-names =3D "dos",
> +                  "dmc";
> +      interrupts =3D <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;
> +      clocks =3D <&clkc_periphs CLKID_DOS>,
> +               <&clkc_periphs CLKID_VDEC_SEL>,
> +               <&clkc_periphs CLKID_HEVCF_SEL>;
> +      clock-names =3D "dos",
> +                    "core_vdec",
> +                    "core_hvdec";
> +      power-domains =3D <&pwrc PWRC_S4_DOS_VDEC_ID>,
> +                      <&pwrc PWRC_S4_DOS_HEVC_ID>;
> +      power-domain-names =3D "dos_vdec",
> +                           "dos_hvdec";
> +      resets =3D <&reset RESET_DOS>;
> +      amlogic,canvas =3D <&canvas>;
> +      amlogic,secure-monitor =3D <&sm>;
> +    };
>=20
> --=20
> 2.42.0
>=20
>=20

--vDuQ2UyDODDws11u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapWl+gAKCRB4tDGHoIJi
0p1SAQCBt5qF4cDd5+WUBSGCucSvgIOgV7UrxnC4keqbfJkbUQD+N2SKFXRP40rE
DfkfS3/XekyAhUKyQQMUpSC4VoAF8Aw=
=YCLQ
-----END PGP SIGNATURE-----

--vDuQ2UyDODDws11u--
