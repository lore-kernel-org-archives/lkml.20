Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF0F386C25;
	Fri,  9 Oct 2026 18:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571842; cv=none; b=ZGrXBAa6yJ5WNa3OWDpVttV450GEmwUZnQyLz4gGhgpDfVu7DLmCihTehKpPtDWMb9PNOWUR0bVMGgW7nNqVU56P7HV0ilCYxbjdK9fO4vJxgEUxwb7DymoOmKWRpeKkvu8b7gwvHDcKIJNA9dNlW+rmiPgxR8/IBRY1BQ5NXAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571842; c=relaxed/simple;
	bh=DIsEnPUtL7XTpURL99i8Skm9ugQHnsIOtTbzfAGtDNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WA51VZeR7cpfyBsxvkQc/aQIYKBlWvCVkmUoEWSLrCwuEq2giQU/vlopJDS289Ul+ll/HuNePv3pvnpVaKwCZQt5O/w1kUreDAahVGfrnGc/K2mhy6k8dSdsLklxJ3a0F0X9j1LpNjetUFu3i1ANsn/567s7BUnaAQBnISd1+x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ohcerbpn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ohcerbpn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D401F000FF;
	Fri,  9 Oct 2026 18:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791571841;
	bh=jrqV/n+TqKy/kfvI9DLbi8FaoaYEB6YCnTwVMN3d9TU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OhcerbpnfDYqW2tc3Kg9BsM2eCGAZ/sEE2pmLJBLJjQWbr0vjQa7kwV7FqqQA5dw3
	 NogTiO/1XfJp6lxfsWq9Id3pROzHG+utb87wrPczpSc/xcRWHrkNrWkUDD2K1u8TrA
	 N9kdGOD2p/CwBjz50g1BjsldgubXEQ/bzpeZ1RnqW0+w/LZg90eYkwzNRxQ7S/dDLS
	 AKs1/IsLeCVj0Phgajjy8W+1TU6CWqDKVjC+YC1XTH4+nlwZmQlJQn7MQy9IUtcQBU
	 Ca2CZESx+GWMl/WPHlJm68CEFITdZVMs+vTfl9Se9BwVA4MvLydKEO+PMSzfQ1A+HV
	 Dfg92Tq2FnH/A==
Date: Fri, 9 Oct 2026 19:50:34 +0100
From: Conor Dooley <conor@kernel.org>
To: David Yang <mmyangfl@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: regulator: add HiSilicon STB voltage
 regulator
Message-ID: <20261009-eed393135cdd51563ca8c077@squawk>
References: <20261008155727.3801095-1-mmyangfl@gmail.com>
 <20261008155727.3801095-2-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gKIUqrF4WDduldKY"
Content-Disposition: inline
In-Reply-To: <20261008155727.3801095-2-mmyangfl@gmail.com>

--gKIUqrF4WDduldKY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2026 at 11:57:24PM +0800, David Yang wrote:
> The PMOC block of the HiSilicon STB SoCs drives an external converter
> with a PWM signal. Document the binding.
>=20
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  .../regulator/hisilicon,histb-volt.yaml       | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/hisilicon=
,histb-volt.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/regulator/hisilicon,histb-=
volt.yaml b/Documentation/devicetree/bindings/regulator/hisilicon,histb-vol=
t.yaml
> new file mode 100644
> index 000000000000..34deee17d034
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/hisilicon,histb-volt.ya=
ml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/hisilicon,histb-volt.yaml#

Filename matching a compatible please.
pw-bot: changes-requested

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HiSilicon STB voltage regulator
> +
> +maintainers:
> +  - David Yang <mmyangfl@gmail.com>
> +
> +description: |
> +  HiSilicon STB SoCs provide PWM outputs in the PMOC block which drive an
> +  external converter. The signal is filtered into a DC level between 0 V=
 and
> +  3.3 V which is summed into the feedback input of the converter, so a r=
ail
> +  follows the average level of the PWM signal and its voltage is set by =
the duty
> +  cycle.
> +
> +  Where the duty cycle maps to in volts is a property of the board, not =
of the
> +  SoC: the endpoints come from the resistors of the filter and from the
> +  reference voltage of the converter. The datasheets therefore tabulate a
> +  different pair of endpoints for each converter of their reference desi=
gns
> +  (0.65 V to 1.15 V for the Hi3798cv200, 0.7 V to 1.25 V for the Hi3798m=
v200),
> +  and a board built to its own schematic has to describe its own.
> +  regulator-min-microvolt and regulator-max-microvolt are those endpoint=
s of
> +  the linear range, and the regulator has no other source of calibration.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - hisilicon,hi3798cv200-volt
> +      - hisilicon,hi3798mv100-volt
> +      - hisilicon,hi3798mv200-volt

Please note in your commit message what makes the programming model of
these devices incompatible, otherwise please make use of fallback
compatibles.

Thanks,
Conor.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - regulator-min-microvolt
> +  - regulator-max-microvolt
> +
> +allOf:
> +  - $ref: regulator.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    vddcpu: regulator@8a23018 {
> +        compatible =3D "hisilicon,hi3798mv200-volt";
> +        reg =3D <0x8a23018 0x4>;
> +        regulator-name =3D "vdd-cpu";
> +        regulator-min-microvolt =3D <700000>;
> +        regulator-max-microvolt =3D <1250000>;
> +        regulator-always-on;
> +    };
> --=20
> 2.53.0
>=20

--gKIUqrF4WDduldKY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCask3eQAKCRB4tDGHoIJi
0soyAP0QbXb1poJKh/TpWFDxievwkhd5csYKUxtcS5awtCTVXgD8CzrIK/GrwGGk
UYyAYPG1OngMl/z+p0wW3Dx10Nvh2gw=
=pJSx
-----END PGP SIGNATURE-----

--gKIUqrF4WDduldKY--
