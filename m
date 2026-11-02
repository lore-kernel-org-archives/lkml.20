Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649162;
	b=GMcTTiapRZifD3n37HCO45Jfj7D+exG26eezFi2O6c6KFE4/KYhA6z+lSPyLTmwRrefa
	 m21BUEPh/AmWtmSpA0fesXltplqK/tuCUzpudU/2Sxpi0O6c6frZGxZNk9PQX9JYwUxDH
	 xgAzDLvGNpA4cSoCBGr9sZojc73ZbPw4K5okSB/CrJI58qVgPigA/rCtIHR0xkmHRm9Hp
	 DpuzRMnzYeP4DhvLkcIPUeJ5TmJMk/tGLGaxEUKgIlqD3BGREOJFssdn6U9ZsX+8MPU9Y
	 LEZJLZkI9elrPq8qKX9M4MqBkUTqSYYbW6vQMl/Fm1hDxjHWujrB4OqKCKKvt3oUzpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649162;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uEejld4IppVXG5CVzyWn09K86BLORVj3l72fYEiqj48=;
	b=m4b+Aam9g2nfUg1c5a5h5BQ/1T299qM1tr+DU5YARl8SnRjDxmc0zSWr2fMFVUmMBbew
	 E3v5gPx3o4vOaP5X6sD2vupihJUwzV97qoZcQBCpuqWM42WNIq9lthgxICdTaZnYkdNjR
	 j+oIPZKAchPDD2B/pf8CEcuofSkmcqKkzHPfnmPyL4GG2sURH5PqqWVwmoTRp7RZ9YNDz
	 +aM7DCddr9hu1idHO8YFpjOQ623ctUdFXqCs8EoLBjTp/LUhmEdu9yAQmNqRK0tnX3vES
	 6/2gciTp8Qd+VampvnV+b84m0o4zHz+VE8PzTtifQSxBa2AcDAF2pSkrLvPC8g3oQew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fR4ohbWL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C803D606A33A;
	Mon,  2 Nov 2026 19:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fR4ohbWL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15131F00A18;
	Mon,  2 Nov 2026 19:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793649161;
	bh=uEejld4IppVXG5CVzyWn09K86BLORVj3l72fYEiqj48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fR4ohbWLTdk8XYI10i62grvGlztn/0Fd2fLLuZ+iwDM8Qacnyu4+JLB3MTeobjxEi
	 AlTV+x/WSVA8SszxhPB2t5QrNnWhhtTCg497JSCP77FBUZNBQRa7BUJQha5LVbCv7P
	 hV+dlkARRUU/r699V8VSD2j6T8LzBvBxLIL1rvPXGxcyGB2cgUedimkY7Rrj8fJw+L
	 irctD4pHwQr2ltsTPilv6DlH/w0mphoKPdDvRGcTzsLfOpk3QPzNpQkQqlZEu6obY9
	 XRKO5KdGi/YY8nUIhCYTwkQE96Ep1DfZurL4+EWYnv4xYXUCdr1sBaIT+rlVbhS9fr
	 cjmL1xWRAkJFg==
Date: Mon, 2 Nov 2026 19:52:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] regulator: dt-bindings: willsemi,wl2868c: add the
 WL2868C camera PMIC
Message-ID: <20261102-hedge-parchment-da1dbb0b60be@spud>
References: <cover.1793427040.git.xiaqinghuan@mail.ustc.edu.cn>
 <7f2062a377f701fbaa649f31c954edcce15b4d12.1793427040.git.xiaqinghuan@mail.ustc.edu.cn>
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
	protocol="application/pgp-signature"; boundary="rch34wCNdOAemgca"
Content-Disposition: inline
In-Reply-To: <7f2062a377f701fbaa649f31c954edcce15b4d12.1793427040.git.xiaqinghuan@mail.ustc.edu.cn>

--rch34wCNdOAemgca
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 02:55:31PM +0800, Qianhui Xu wrote:
> The WL2868C is an I2C-controlled camera power management IC from Will
> Semiconductor. It provides seven programmable LDOs: LDO1 and LDO2 are
> fed from a shared VIN12 input and cover 0.496 V to 1.512 V, LDO3 and
> LDO4 share VIN34, and LDO5 to LDO7 each have their own input, covering
> 1.504 V to 3.544 V. All outputs are programmable in 8 mV steps and are
> gated by per-output enable bits with a chip-wide SYS_EN master. The
> chip also exposes an optional active-low RST_N input.
>=20

> Its user on the Lenovo Legion Tab (TB322FC, SM8750) is the camera
> subsystem: the rear samsung,s5kjns sensor takes DVDD from LDO1, AVDD
> from LDO4 and DOVDD from LDO7, and the rear giantec,gt9764 voice coil
> motor takes VDD from LDO5 and VDDIO from LDO7. The front sensor is
> powered from LDO2, LDO3 and LDO7, but its binding is still pending, so
> its supply wiring follows with that series. The board DTS patch of this
> series describes the supply wiring that is documented; LDO6 is the only
> output with no user on this board.

None of this is relevant to the wl2868c binding.

>=20
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../devicetree/bindings/arm/qcom.yaml         |  1 +
>  .../bindings/regulator/willsemi,wl2868c.yaml  | 79 +++++++++++++++++++
>  2 files changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,=
wl2868c.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index ff8a35df78..41d5e65c4e 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1168,6 +1168,7 @@ properties:
> =20
>        - items:
>            - enum:
> +              - lenovo,elden

This has nothing to do with the willsemi device and should not be in
this patch.

>                - qcom,sm8750-mtp
>                - qcom,sm8750-qrd
>            - const: qcom,sm8750
> diff --git a/Documentation/devicetree/bindings/regulator/willsemi,wl2868c=
=2Eyaml b/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
> new file mode 100644
> index 0000000000..96541870cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
> @@ -0,0 +1,79 @@
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
> +    description: Input supply for LDO7.
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

I assume you didn't make the input supplies mandatory because if their
output is not used, they're not actually needed?

That said, you're missing the vsys supply which I suspect may actually
be mandatory? At the very least, one of vin7 and vsys is mandatory,
because the higher of the two powers the internal control logic...

pw-bot: changes-requested

Thanks,
Conor.

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
> +
> +            regulators {
> +                ldo1 {
> +                    regulator-max-microvolt =3D <1128000>;
> +                    regulator-min-microvolt =3D <1128000>;
> +                };
> +            };
> +        };
> +    };
> +...
> --=20
> 2.53.0
>=20

--rch34wCNdOAemgca
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujqBQAKCRB4tDGHoIJi
0mXsAPwPITGRomx2AkT6sqGJKhk3vaawxntx+z6Qf0m4GT82KAD+MnXxdAdsxqub
SQSS8x7HR+enE3/3ZNh7gOcXnmvQUgo=
=rQ9n
-----END PGP SIGNATURE-----

--rch34wCNdOAemgca--
