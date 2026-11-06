Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985133;
	b=Z6H0q5RjZjleWsrFtLraUKNu5bOES50neFNbOoyHEiGSLnsYinYp3cOcIzIGBWxlAgWH
	 NjVx9ZohfeTCoT9IrO0Z5tXptkWLqQ6UziOFgkmNcPbQ9b7aUBrfj/0wXMSCTdgQuc3Mr
	 4Nkqnk25Xh0oCSQMmz3krp0VWbTBgoo7ytmObkupA/jlsaN81EtPZNn5lovz/6wDM4ZWn
	 Giwq/a3VAAUNr2dRQo+4WIKBmNO6LBYHBRODIgvcjIfZu5kwog4Paapy9olm7nV74fpzP
	 A8bbpYvDfZKakmUVjBudwQMVRrK8+qqaagJr4+bQ0hBt8MH8THTbypXbEjpVvhIF7ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985133;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yw+fiJnGacYZip0Sy8vz5R4fiYZZxfSHrVr/u3AJtsg=;
	b=1Hy9wrb3pcmQGxjAmvcPE5ulJr56rg33Am2M76miNP56M/b6HqKzWHVDFlaNb7Lj71cd
	 8CBF1KbT2s7pdOyS8it9Kh0XiqBxwdi5goEw4Zo1viJj1/YrmjZrfxl1lu6dI/MNiy57Q
	 cniywFIpOHgEfNgOzu6/4TCFH2BrRB+8DVIBSYJczvsUyQkD1tqnh7+vTMj28lO8bwle2
	 u0UM3MC0b40N4MKud5a9eY6N6TgRmymSg0eMQibslbfM7N8QW6bxOeMKZiTh1iamOviol
	 RYt3xJJLqzE8LkNvHwRyR1JRunm6d77SnqY2KiOodfAp5Re+A7HS02+qWZBpWnT0lVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXZYGJ+9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F495606A326;
	Fri,  6 Nov 2026 17:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXZYGJ+9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EDD1F0089F;
	Fri,  6 Nov 2026 17:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793985132;
	bh=yw+fiJnGacYZip0Sy8vz5R4fiYZZxfSHrVr/u3AJtsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MXZYGJ+9hZDzjTHk5gS409UcyjiXbtdAcctcAVsuxMbKKud7ZX74SVCglsnmLnC3+
	 d9FWwycn9H4X1JX5q03xBf/WL4xEy9Bp+3E3VHRrPD4aNj6e2Jni7BD89MOBNO+AWZ
	 ACiGWawy/gW1dTl3y5KQ5fQRjeNKhMVmvZODcBoiO5WB1gk1np4zqQJkmlk/HMWmm0
	 3iyT6P5mcoOuK7Hpz+EJ7E2BZ+V5+brqLJVHV0JTgbIEbe6QflMFdMLwg7UJWZWs3j
	 FfU8i6UShk63PKhDydd8dGKpMT8hGLGG3n06/pPFyJ91X8vgPB6cwrwVrOckKw4L+e
	 8U4tSZLUFduQA==
Date: Fri, 6 Nov 2026 17:12:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v8 1/2] regulator: dt-bindings: willsemi,wl2868c: add the
 WL2868C camera PMIC
Message-ID: <20261106-lucrative-sadden-741ffe6c43e9@spud>
References: <20261106114252.988023-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261106114252.988023-2-xiaqinghuan@mail.ustc.edu.cn>
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
	protocol="application/pgp-signature"; boundary="K6bwFbsNcc6jfS5d"
Content-Disposition: inline
In-Reply-To: <20261106114252.988023-2-xiaqinghuan@mail.ustc.edu.cn>

--K6bwFbsNcc6jfS5d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 07:42:51PM +0800, Qianhui Xu wrote:
> The WL2868C is an I2C-controlled camera power management IC from Will
> Semiconductor. It provides seven programmable LDOs: LDO1 and LDO2 are fed
> from a shared VIN12 input and cover 0.496 V to 1.512 V, LDO3 and LDO4 sha=
re
> VIN34, and LDO5 to LDO7 each have their own input, covering 1.504 V to
> 3.544 V. All outputs are programmable in 8 mV steps and are gated by
> per-output enable bits with a chip-wide SYS_EN master. The chip also
> exposes an optional active-low RST_N input.
>=20
> VIN7 and VSYS are both inputs of the internal control logic, which is
> powered from the higher of the two voltages, so a device tree has to
> describe at least one of them. The remaining inputs only feed LDOs, so
> they stay optional: an input can be left unconnected when the outputs it
> feeds are unused on a given board.
>=20
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

Rob#s feedback on v6 was ignored:
https://lore.kernel.org/all/20261106141036.GA2921668-robh@kernel.org/

pw-bot: changes-requested

Thanks,
Conor.

> ---
>  .../bindings/regulator/willsemi,wl2868c.yaml  | 104 ++++++++++++++++++
>  MAINTAINERS                                   |   7 ++
>  2 files changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,=
wl2868c.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/regulator/willsemi,wl2868c=
=2Eyaml b/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
> new file mode 100644
> index 0000000000..df7990d0d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/willsemi,wl2868c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Will Semiconductor WL2868C camera power management IC
> +
> +maintainers:
> +  - Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> +
> +description:
> +  The WL2868C is a camera power management IC with seven programmable LD=
Os.
> +  LDO1 and LDO2 share the VIN12 input and cover 0.496 V to 1.512 V; LDO3=
 and
> +  LDO4 share VIN34, and LDO5 to LDO7 have one input each, covering 1.504=
 V to
> +  3.544 V. All outputs are programmable in 8 mV steps.
> +
> +  VIN7 and VSYS feed the internal control logic, which is powered from t=
he
> +  higher of the two, so at least one of them has to be connected. The ot=
her
> +  inputs only feed LDOs, so an input may be left unconnected on a board
> +  that does not use the outputs it feeds, which is why they are not
> +  mandatory.
> +
> +properties:
> +  compatible:
> +    const: willsemi,wl2868c
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Active-low RST_N input.
> +
> +  vin12-supply:
> +    description: Input supply for LDO1 and LDO2.
> +
> +  vin34-supply:
> +    description: Input supply for LDO3 and LDO4.
> +
> +  vin5-supply:
> +    description: Input supply for LDO5.
> +
> +  vin6-supply:
> +    description: Input supply for LDO6.
> +
> +  vin7-supply:
> +    description:
> +      Input supply for LDO7 and one of the two supplies of the internal
> +      control logic.
> +
> +  vsys-supply:
> +    description:
> +      System supply, the other supply of the internal control logic. The
> +      control logic is powered from the higher of VIN7 and VSYS.
> +
> +  regulators:
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      "^ldo[1-7]$":
> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - regulators
> +
> +anyOf:
> +  - required:
> +      - vin7-supply
> +  - required:
> +      - vsys-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        pmic@2f {
> +            compatible =3D "willsemi,wl2868c";
> +            reg =3D <0x2f>;
> +            vsys-supply =3D <&vsys_reg>;
> +
> +            regulators {
> +                ldo1 {
> +                    regulator-max-microvolt =3D <1128000>;
> +                    regulator-min-microvolt =3D <1128000>;
> +                };
> +            };
> +        };
> +    };
> +
> +    vsys_reg: regulator-vsys {
> +        compatible =3D "regulator-fixed";
> +        regulator-name =3D "vsys";
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe23913b1e..08cfa3db0e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -30180,6 +30180,13 @@ L:	linux-input@vger.kernel.org
>  S:	Maintained
>  F:	drivers/hid/hid-wiimote*
> =20
> +WILLSEMI WL2868C CAMERA PMIC
> +M:	Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
> +F:	drivers/regulator/wl2868c-regulator.c
> +
>  WILOCITY WIL6210 WIRELESS DRIVER
>  L:	linux-wireless@vger.kernel.org
>  S:	Orphan
>=20

--K6bwFbsNcc6jfS5d
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4KaAAKCRB4tDGHoIJi
0kbNAP47h6RwmupUnRM9xwGx1Lucs3meQvJTVY0/eCU7Vg0W9gEAwy3QyeC+rxAB
Zy/7INF+1GiqpqZAlT+DoTNEmRpyBQg=
=g8S0
-----END PGP SIGNATURE-----

--K6bwFbsNcc6jfS5d--
