Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974240;
	b=zS44jyioqmtdEojDZ6uF3b21/Nr2welz8DXvEmo3MXtk3MDcVyHAb2VfH5ZuiDMeAy8B
	 cu56cqtEKLFTQEE3HCUwtOp0krdEumTT3rY+/rKi7sSHN6Q6AhIPCIukFLiHvAWRW0w94
	 oZNY81lPPQQRF/5OOdCQilMAV54vnEcYBdZMrqnLgYuBIJX5s2xTZ05IX7NE43VMI6U79
	 wrO4HnFs1e5fDWeykV1HTNHo/+iM+AxPkpQaAGOpiFyzncqhHIBtm1WnSAumr/jSNAZi8
	 jEPmVWx9st5HWEwlYKRMf8WzdF9/zSVHueyYxhizDv/J751Ku1jtjwjzxpczWF632Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974240;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vTI/Dp3GNtJys4eEWJPw3yai0WEaYZ0B/7x7cglCejs=;
	b=4gYf6jwO39QBel6B0sSjYToy8TOjFwnW0Of/dQEQebEuGmdjzf7B3MdUusI0JWNGewBH
	 14CFFgQ+u70gW9IyZ6saTgJbtuldxGS/5K/RnXUxXF3/fZ/LzNzWdNDKSGCg9g9LDwzzD
	 33GWrapXAYKb4AtNnRsBpBSToX+3bKpApuLzK6WnAk2nlaJJWWUBn8ZAjiAVwTV0UJ7XB
	 oZ++euEJIn3lkh70K57FS0Lqq00vFPHJLyHLaJwv/TdAvZ73rXNvg9qdpIEeKILETdz7e
	 q3Brzpn6N37YOyDnCvl3f13hhAK4CUsv8anShWu1/8GGTKd8wxhrlDcHJ9P0KeWjXnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gRtv3S7P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61763606A333;
	Fri,  6 Nov 2026 14:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gRtv3S7P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA451F0089F;
	Fri,  6 Nov 2026 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974240;
	bh=vTI/Dp3GNtJys4eEWJPw3yai0WEaYZ0B/7x7cglCejs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gRtv3S7Pd2xPqj1NtaSTex6sEGQm/D/SAJQhFTGPd1q0Nda9DQXRl2SpzjN22BMuC
	 i+gcdvIpBVM0XuVoC09eJU6QgsoS4OuPt9kd6i01M9AOdgb1GbduaxMkd4sQfkJhx6
	 K2SQbi6CjNgMwTOJhiI88Fzmd1WLFF0a2ZkUSAO5QYAzhESeo5yuA3jsFuPk0xLgvg
	 RAyU73npDWb/ssYSJbJHkJvrIAcmLyoeLFiRXg1RYlJk4Go5FFyqWhTs/dIWkD8Shf
	 ey5COQErKqUibJs9HGfksO9cIIF7UKT66eJZhYRmICNn08D7J+3sFylMfcUiJ/cCPA
	 PObU4aniF7wNw==
Date: Fri, 6 Nov 2026 08:10:36 -0600
From: Rob Herring <robh@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v6 1/5] regulator: dt-bindings: willsemi,wl2868c: add the
 WL2868C camera PMIC
Message-ID: <20261106141036.GA2921668-robh@kernel.org>
References: <20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261104032648.209747-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104032648.209747-2-xiaqinghuan@mail.ustc.edu.cn>

On Wed, Nov 04, 2026 at 11:26:44AM +0800, Qianhui Xu wrote:
> The WL2868C is an I2C-controlled camera power management IC from Will
> Semiconductor. It provides seven programmable LDOs: LDO1 and LDO2 are fed
> from a shared VIN12 input and cover 0.496 V to 1.512 V, LDO3 and LDO4 share
> VIN34, and LDO5 to LDO7 each have their own input, covering 1.504 V to
> 3.544 V. All outputs are programmable in 8 mV steps and are gated by
> per-output enable bits with a chip-wide SYS_EN master. The chip also
> exposes an optional active-low RST_N input.
> 
> VIN7 and VSYS are both inputs of the internal control logic, which is
> powered from the higher of the two voltages, so a device tree has to
> describe at least one of them. The remaining inputs only feed LDOs, so
> they stay optional: an input can be left unconnected when the outputs it
> feeds are unused on a given board.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../bindings/regulator/willsemi,wl2868c.yaml  | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml b/Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml
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

With paragraphs, you need '>' modifier.

> +  The WL2868C is a camera power management IC with seven programmable LDOs.
> +  LDO1 and LDO2 share the VIN12 input and cover 0.496 V to 1.512 V; LDO3 and
> +  LDO4 share VIN34, and LDO5 to LDO7 have one input each, covering 1.504 V to
> +  3.544 V. All outputs are programmable in 8 mV steps.
> +
> +  VIN7 and VSYS feed the internal control logic, which is powered from the
> +  higher of the two, so at least one of them has to be connected. The other
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
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@2f {
> +            compatible = "willsemi,wl2868c";
> +            reg = <0x2f>;
> +            vsys-supply = <&vsys_reg>;
> +
> +            regulators {
> +                ldo1 {
> +                    regulator-max-microvolt = <1128000>;
> +                    regulator-min-microvolt = <1128000>;
> +                };
> +            };
> +        };
> +    };
> +
> +    vsys_reg: regulator-vsys {
> +        compatible = "regulator-fixed";
> +        regulator-name = "vsys";
> +    };

Drop. We don't put providers into examples.

Rob
