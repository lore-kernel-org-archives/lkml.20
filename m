Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793928572;
	b=JwdeEYDqDxF89oZ70SB5lWBMYQrA52aOXdDeToy163/VR4tWOlqPfyD/j0KoX8zF/vFQ
	 fk/PSSGNmANWI1Vpnp9zUJ7dbW64gKBELs0ZG2QjF6BEJEp/srecYs3Zs49lwl62sY5Lq
	 Jhr2CjDjpRwlCCiVGnLBRvZasfQH/aza3YZFoEudmqFdfNRgwcJW5u7NI7CdNRr6Qb55b
	 JRtgOrcfOHS9DDMQXZN8ig8B72KiHcw3u7hCvJRVluB5EZXe//LOH7SptKgDpLS3+MoNH
	 svXeBxxdsvmjBSsn4owFSW20bU9CIxZIQbODzx7nInvmMQzn5T91BAQOHHRXHEJPNnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928572;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3KxWjpfaqo8SQM/vpTeTV3YkdjdLNFU73Mw7ehoYbPY=;
	b=HQNMxbZFtRCiy4jPhi7lG/DlZy3bZXGa9q3EGGckd7lB0u6E03EUigrHj2NYM+L9WweY
	 1//qzz1RS5EMAVxnbGmJMyZHhgJKpdCEcGsFPjHUXXc4CAFT46GQEqWz95NoJrriR1fNW
	 OSx9fTtRRI+1M2q06u9qg9D7yRbGH9L9ACLHeYA9mdzuxkI/kXPZwUzGmhObHkxaEpIaT
	 hpsYxpr3S3rhMoBI+sKB6jku1UClaQu+Do8aV4vSSSJoeQtp0+jJpyWG4LLUQbXB1RXEi
	 dJv5nBar4OCp6n+6PjnJxhhj2NYhpBea0aBvOrnKIg6WHofJITMkBdti/vCg7Ee/T7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB09606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DB09606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab53a99771so626161fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793928570; x=1794533370;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KxWjpfaqo8SQM/vpTeTV3YkdjdLNFU73Mw7ehoYbPY=;
        b=2YGeo/xBul198klMo5Mv12adFPc6xYgPIKVENli1ChUvDDjd52JLa9/FTiOPFSUlCQ
         QDnCBQ2J4dQKI9NsiKmeWUYWk3cFGxcqt0uqvXEvNp2A6mVpKOUq6CUbZHU8MklpvYKx
         K2Thio4z/DYkyFcVqvYrVfk9C6w+jCxCJpcDcmOio5ywg2gn2j6he7Ip5JhnRs/vasju
         eJDwwBpPrEl2xAoO4LgkNs4yfVU6p+iWoHaLKocoS+9oDxAK8s+Xi5hiaUr9HSI90yTf
         6y3uidB9FpcBr3AxM2i9rfts23pmI4BykVNlioYshfB1A4OpjA5GLg/0I987X2A01h6N
         2Gdw==
X-Forwarded-Encrypted: i=1; AKwUvBzfgtc4210tGEm2KIYoFZDSYUvP/0loLOzotgAz+EvWs+JEkSu8GaMcOansfxHxNCzfm3SMFt+TmuYspng=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QYdJUljKzIKSe1GyzxVgCSrXl7XC5719VOCbV6OV9ikvRUAsJ
	O2aekSpWiknUtn/T3lgbIAym+C1j6FSOBTNFDviyJA4OfRI/SRYcC3FV1jszonjN22uWLg==
X-Gm-Gg: AYBFou0WQPdxqn9704IS85H1W5iVnTizKBFXI+RaqVZXxKo0+V88wCO9/TrzRuP7Zd4
	IEWLcIgITHzTQE8JdENmd/QkyXJbiDppwUSXLDusyT4FKyB5IrXzw8+mAVKg/bto+UPtT82I8jj
	VFoy7H8ncwIrBlo9KAbbsPYi/t+b2vRJLfAMkslro8rRRlY/le7y8WbxigPRCYCGkBAyVv9eK3x
	rujTJwMQsQ1522yfYyk86qqF/Vz/zjHXZgMbviRVqusg6C609cTrtqKG7Zb10ODHtNZ4q4YqySw
	RAtNXaT07IFErpqjYC0/i0loPZXO0s4b/SA7cl8+FONPEnY8PpQe6gcoiLRd/RAwRhimkPQkxNh
	neuJ5bb/h6diJHPBKTYGsCjkILqK5aM/qyp7tYMeAI0DgvMdbqA+VL+WlVHKWbnybKi907dJ1nq
	RswbC/Cr+lvCdYvrwLqlfc/ZlCrEPUGvJKChfT02D/JGY2xpuDpJ3hZfuBMR82PSNlTU+9ZILu4
	kk95YYl5ptrNFu2qZ9VpWbQK8Wmp04iCb8OAciEC1IajfB2UM5P/97jeGBlsjsQTELO7F4+3Qua
	D5SJ3ihwMzihntNO5GilFbKtkw7jNGFafWXOZ8u3puVBQ0a9jYNjt1ak52x0L5uAOAjvjLo=
X-Received: by 2002:a2e:a555:0:b0:3ac:dc93:c82c with SMTP id 38308e7fff4ca-3acf3c2ba50mr1981551fa.20.1793928569407;
        Thu, 05 Nov 2026 17:29:29 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acf5d1e800sm654781fa.4.2026.11.05.17.29.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 17:29:28 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab53a99771so625991fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:29:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwECRhbbml02VzCzKpPcrG5GJkWrLJ04NPKxzPnGZKM0QOKRMw95FCZo9dGblmugDhw9n8+P0z02Np1xwo=@vger.kernel.org
X-Received: by 2002:a05:651c:986:b0:3ac:dda0:efbb with SMTP id
 38308e7fff4ca-3acf3a25338mr1661661fa.13.1793928568094; Thu, 05 Nov 2026
 17:29:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev> <427eb0e0-5e10-4f24-8686-4d06c26cdd13@linaro.org>
In-Reply-To: <427eb0e0-5e10-4f24-8686-4d06c26cdd13@linaro.org>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Thu, 5 Nov 2026 22:29:00 -0300
X-Gmail-Original-Message-ID: <CANn8UmeQ6xZrAhh2vZjQrE8T-7fuXGmit3mWZEk84jXr5swrZA@mail.gmail.com>
X-Gm-Features: AclHuK8NOfvUAyvAvt9Js3wdnmHbN8KjHpgXufQfg3Uwb9Zb3MCa1-UVWRBODBY
Message-ID: <CANn8UmeQ6xZrAhh2vZjQrE8T-7fuXGmit3mWZEk84jXr5swrZA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150 CAMSS
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bryan,

Agreed on the *_src clocks. They are internal CAMCC RCGs, and the leaf
branch clocks already propagate rate and enablement through
CLK_SET_RATE_PARENT, so v2 drops all of them (42 -> 27 clocks) in the
binding, the example and the DTS.

The other binding nits from Sashiko's review are fixed as well:
clock-lanes is gone and the example uses an unnumbered endpoint, and the
vdda-phy-supply and vdda-pll-supply descriptions now say 0.88 V and
1.2 V.

Thanks,
Andrew

El mi=C3=A9, 4 nov 2026 a la(s) 7:44=E2=80=AFp.m., Bryan O'Donoghue
(bryan.odonoghue@linaro.org) escribi=C3=B3:
>
> On 04/11/2026 20:54, Andrew Gigena via B4 Relay wrote:
> > From: Andrew Gigena <mail@andrewgigena.dev>
> >
> > Document the Qualcomm SM8150 Camera Subsystem. The IP integrates four
> > CSIPHY, four CSID (two full and two lite), two VFE and two VFE-Lite
> > instances, with 42 clocks, 12 interrupts, eight IOMMU streams, four
> > interconnect paths and three power domains.
> >
> > SM8150 has a different register layout, clock tree and power domain
> > topology from SM8250, so describe it in a dedicated schema instead of
> > using qcom,sm8250-camss as a fallback.
> >
> > Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> > ---
> >   .../bindings/media/qcom,sm8150-camss.yaml          | 477 ++++++++++++=
+++++++++
> >   1 file changed, 477 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/qcom,sm8150-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> > new file mode 100644
> > index 000000000000..a65067352b58
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> > @@ -0,0 +1,477 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/qcom,sm8150-camss.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SM8150 Camera Subsystem (CAMSS)
> > +
> > +maintainers:
> > +  - Andrew Gigena <mail@andrewgigena.dev>
> > +
> > +description: |
> > +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sm8150-camss
> > +
> > +  clocks:
> > +    minItems: 42
> > +    maxItems: 42
> > +
> > +  clock-names:
> > +    items:
> > +      - const: camnoc_axi
> > +      - const: camnoc_axi_src
> > +      - const: cpas_ahb
> > +      - const: cphy_rx_src
> > +      - const: csiphy0
> > +      - const: csiphy0_timer
> > +      - const: csiphy0_timer_src
> > +      - const: csiphy1
> > +      - const: csiphy1_timer
> > +      - const: csiphy1_timer_src
> > +      - const: csiphy2
> > +      - const: csiphy2_timer
> > +      - const: csiphy2_timer_src
> > +      - const: csiphy3
> > +      - const: csiphy3_timer
> > +      - const: csiphy3_timer_src
> > +      - const: vfe0_axi
> > +      - const: vfe0
> > +      - const: vfe0_src
> > +      - const: vfe0_cphy_rx
> > +      - const: vfe0_csid
> > +      - const: vfe0_csid_src
> > +      - const: vfe1_axi
> > +      - const: vfe1
> > +      - const: vfe1_src
> > +      - const: vfe1_cphy_rx
> > +      - const: vfe1_csid
> > +      - const: vfe1_csid_src
> > +      - const: vfe_lite0
> > +      - const: vfe_lite0_src
> > +      - const: vfe_lite0_cphy_rx
> > +      - const: vfe_lite0_csid
> > +      - const: vfe_lite0_csid_src
> > +      - const: vfe_lite1
> > +      - const: vfe_lite1_src
> > +      - const: vfe_lite1_cphy_rx
> > +      - const: vfe_lite1_csid
> > +      - const: vfe_lite1_csid_src
> > +      - const: slow_ahb_src
> > +      - const: gcc_ahb
> > +      - const: gcc_axi_hf
> > +      - const: gcc_axi_sf
> > +
> > +  interrupts:
> > +    minItems: 12
> > +    maxItems: 12
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: csiphy0
> > +      - const: csiphy1
> > +      - const: csiphy2
> > +      - const: csiphy3
> > +      - const: vfe0
> > +      - const: csid0
> > +      - const: vfe1
> > +      - const: csid1
> > +      - const: vfe_lite0
> > +      - const: csid_lite0
> > +      - const: vfe_lite1
> > +      - const: csid_lite1
> > +
> > +  iommus:
> > +    maxItems: 8
> > +
> > +  interconnects:
> > +    maxItems: 4
> > +
> > +  interconnect-names:
> > +    items:
> > +      - const: cam_ahb
> > +      - const: cam_hf_0_mnoc
> > +      - const: cam_hf_1_mnoc
> > +      - const: cam_sf_0_mnoc
> > +
> > +  power-domains:
> > +    items:
> > +      - description: IFE0 GDSC - Image Front End, Global Distributed S=
witch Controller.
> > +      - description: IFE1 GDSC - Image Front End, Global Distributed S=
witch Controller.
> > +      - description: Titan Top GDSC - Titan ISP Block, Global Distribu=
ted Switch Controller.
> > +
> > +  power-domain-names:
> > +    items:
> > +      - const: ife0
> > +      - const: ife1
> > +      - const: top
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    description:
> > +      CSI input ports.
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Input port for receiving CSI data from CSIPHY0.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +              bus-type:
> > +                enum:
> > +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> > +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Input port for receiving CSI data from CSIPHY1.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +              bus-type:
> > +                enum:
> > +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> > +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Input port for receiving CSI data from CSIPHY2.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +              bus-type:
> > +                enum:
> > +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> > +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +
> > +      port@3:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Input port for receiving CSI data from CSIPHY3.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +              bus-type:
> > +                enum:
> > +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> > +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +
> > +  reg:
> > +    minItems: 12
> > +    maxItems: 12
> > +
> > +  reg-names:
> > +    items:
> > +      - const: csiphy0
> > +      - const: csiphy1
> > +      - const: csiphy2
> > +      - const: csiphy3
> > +      - const: vfe0
> > +      - const: csid0
> > +      - const: vfe1
> > +      - const: csid1
> > +      - const: vfe_lite0
> > +      - const: csid_lite0
> > +      - const: vfe_lite1
> > +      - const: csid_lite1
> > +
> > +  vdda-phy-supply:
> > +    description:
> > +      Phandle to a regulator supply to PHY core block.
> > +
> > +  vdda-pll-supply:
> > +    description:
> > +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> > +
> > +required:
> > +  - clock-names
> > +  - clocks
> > +  - compatible
> > +  - interconnects
> > +  - interconnect-names
> > +  - interrupts
> > +  - interrupt-names
> > +  - iommus
> > +  - power-domains
> > +  - power-domain-names
> > +  - reg
> > +  - reg-names
> > +  - vdda-phy-supply
> > +  - vdda-pll-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/qcom,gcc-sm8150.h>
> > +    #include <dt-bindings/clock/qcom,sm8150-camcc.h>
> > +    #include <dt-bindings/interconnect/qcom,sm8150.h>
> > +    #include <dt-bindings/power/qcom-rpmpd.h>
> > +
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        camss: camss@ac65000 {
> > +            compatible =3D "qcom,sm8150-camss";
> > +
> > +            reg =3D <0 0xac65000 0 0x1000>,
> > +              <0 0xac66000 0 0x1000>,
> > +              <0 0xac67000 0 0x1000>,
> > +              <0 0xac68000 0 0x1000>,
> > +              <0 0xacaf000 0 0x4000>,
> > +              <0 0xacb3000 0 0x1000>,
> > +              <0 0xacb6000 0 0x4000>,
> > +              <0 0xacba000 0 0x1000>,
> > +              <0 0xacc4000 0 0x4000>,
> > +              <0 0xacc8000 0 0x1000>,
> > +              <0 0xaccb000 0 0x4000>,
> > +              <0 0xaccf000 0 0x1000>;
> > +
> > +            reg-names =3D "csiphy0",
> > +              "csiphy1",
> > +              "csiphy2",
> > +              "csiphy3",
> > +              "vfe0",
> > +              "csid0",
> > +              "vfe1",
> > +              "csid1",
> > +              "vfe_lite0",
> > +              "csid_lite0",
> > +              "vfe_lite1",
> > +              "csid_lite1";
> > +
> > +            interrupts =3D <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> > +              <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>;
> > +
> > +            interrupt-names =3D "csiphy0",
> > +              "csiphy1",
> > +              "csiphy2",
> > +              "csiphy3",
> > +              "vfe0",
> > +              "csid0",
> > +              "vfe1",
> > +              "csid1",
> > +              "vfe_lite0",
> > +              "csid_lite0",
> > +              "vfe_lite1",
> > +              "csid_lite1";
> > +
> > +            power-domains =3D <&camcc IFE_0_GDSC>,
> > +              <&camcc IFE_1_GDSC>,
> > +              <&camcc TITAN_TOP_GDSC>;
> > +
> > +            power-domain-names =3D "ife0",
> > +              "ife1",
> > +              "top";
> > +
> > +            clocks =3D <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> > +              <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
> > +              <&camcc CAM_CC_CPAS_AHB_CLK>,
> > +              <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
> > +              <&camcc CAM_CC_CSIPHY0_CLK>,
> > +              <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> > +              <&camcc CAM_CC_CSI0PHYTIMER_CLK_SRC>,
> > +              <&camcc CAM_CC_CSIPHY1_CLK>,
> > +              <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> > +              <&camcc CAM_CC_CSI1PHYTIMER_CLK_SRC>,
> > +              <&camcc CAM_CC_CSIPHY2_CLK>,
> > +              <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> > +              <&camcc CAM_CC_CSI2PHYTIMER_CLK_SRC>,
> > +              <&camcc CAM_CC_CSIPHY3_CLK>,
> > +              <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> > +              <&camcc CAM_CC_CSI3PHYTIMER_CLK_SRC>,
> > +              <&camcc CAM_CC_IFE_0_AXI_CLK>,
> > +              <&camcc CAM_CC_IFE_0_CLK>,
> > +              <&camcc CAM_CC_IFE_0_CLK_SRC>,
> > +              <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> > +              <&camcc CAM_CC_IFE_0_CSID_CLK>,
> > +              <&camcc CAM_CC_IFE_0_CSID_CLK_SRC>,
> > +              <&camcc CAM_CC_IFE_1_AXI_CLK>,
> > +              <&camcc CAM_CC_IFE_1_CLK>,
> > +              <&camcc CAM_CC_IFE_1_CLK_SRC>,
> > +              <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> > +              <&camcc CAM_CC_IFE_1_CSID_CLK>,
> > +              <&camcc CAM_CC_IFE_1_CSID_CLK_SRC>,
> > +              <&camcc CAM_CC_IFE_LITE_0_CLK>,
> > +              <&camcc CAM_CC_IFE_LITE_0_CLK_SRC>,
> > +              <&camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
> > +              <&camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
> > +              <&camcc CAM_CC_IFE_LITE_0_CSID_CLK_SRC>,
> > +              <&camcc CAM_CC_IFE_LITE_1_CLK>,
> > +              <&camcc CAM_CC_IFE_LITE_1_CLK_SRC>,
> > +              <&camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>,
> > +              <&camcc CAM_CC_IFE_LITE_1_CSID_CLK>,
> > +              <&camcc CAM_CC_IFE_LITE_1_CSID_CLK_SRC>,
> > +              <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> > +              <&gcc GCC_CAMERA_AHB_CLK>,
> > +              <&gcc GCC_CAMERA_HF_AXI_CLK>,
> > +              <&gcc GCC_CAMERA_SF_AXI_CLK>;
> > +
> > +            clock-names =3D "camnoc_axi",
> > +              "camnoc_axi_src",
> > +              "cpas_ahb",
> > +              "cphy_rx_src",
> > +              "csiphy0",
> > +              "csiphy0_timer",
> > +              "csiphy0_timer_src",
> > +              "csiphy1",
> > +              "csiphy1_timer",
> > +              "csiphy1_timer_src",
> > +              "csiphy2",
> > +              "csiphy2_timer",
> > +              "csiphy2_timer_src",
> > +              "csiphy3",
> > +              "csiphy3_timer",
> > +              "csiphy3_timer_src",
> > +              "vfe0_axi",
> > +              "vfe0",
> > +              "vfe0_src",
> > +              "vfe0_cphy_rx",
> > +              "vfe0_csid",
> > +              "vfe0_csid_src",
> > +              "vfe1_axi",
> > +              "vfe1",
> > +              "vfe1_src",
> > +              "vfe1_cphy_rx",
> > +              "vfe1_csid",
> > +              "vfe1_csid_src",
> > +              "vfe_lite0",
> > +              "vfe_lite0_src",
> > +              "vfe_lite0_cphy_rx",
> > +              "vfe_lite0_csid",
> > +              "vfe_lite0_csid_src",
> > +              "vfe_lite1",
> > +              "vfe_lite1_src",
> > +              "vfe_lite1_cphy_rx",
> > +              "vfe_lite1_csid",
> > +              "vfe_lite1_csid_src",
> > +              "slow_ahb_src",
> > +              "gcc_ahb",
> > +              "gcc_axi_hf",
> > +              "gcc_axi_sf";
>
> 42 is ofc a sacred number so its a pity BUT you almost certainly don't
> need the _src clocks here.
>
> > +
> > +            iommus =3D <&apps_smmu 0x840 0x620>,
> > +              <&apps_smmu 0x860 0x620>,
> > +              <&apps_smmu 0xA40 0x620>,
> > +              <&apps_smmu 0xA60 0x620>,
> > +              <&apps_smmu 0xC40 0x620>,
> > +              <&apps_smmu 0xC60 0x620>,
> > +              <&apps_smmu 0xE40 0x620>,
> > +              <&apps_smmu 0xE60 0x620>;
> > +
> > +            interconnects =3D <&gem_noc MASTER_AMPSS_M0 0 &config_noc =
SLAVE_CAMERA_CFG 0>,
> > +                <&mmss_noc MASTER_CAMNOC_HF0 0 &mc_virt SLAVE_EBI_CH0 =
0>,
> > +                <&mmss_noc MASTER_CAMNOC_HF1 0 &mc_virt SLAVE_EBI_CH0 =
0>,
> > +                <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0=
>;
> > +
> > +            interconnect-names =3D "cam_ahb",
> > +              "cam_hf_0_mnoc",
> > +              "cam_hf_1_mnoc",
> > +              "cam_sf_0_mnoc";
> > +
> > +            vdda-phy-supply =3D <&vreg_l5a_0p88>;
> > +            vdda-pll-supply =3D <&vreg_l3c_1p2>;
> > +
> > +            ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                port@0 {
> > +                    reg =3D <0>;
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <0>;
> > +
> > +                    csiphy_ep0: endpoint@0 {
> > +                        reg =3D <0>;
> > +                        clock-lanes =3D <7>;
> > +                        data-lanes =3D <0 1 2 3>;
> > +                        remote-endpoint =3D <&sensor_ep>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> >
>
>
