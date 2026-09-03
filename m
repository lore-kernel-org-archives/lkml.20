Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEFF490C10;
	Thu,  3 Sep 2026 12:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438759; cv=none; b=VUMWCFsvObp/+SlZt7vxGaoM+HLwnQkULsvywIUheL7ZL3Y4FNF0wGqcfzbUedmDUVcbPN0dqL5vsgBv2PEsDZ49t3PmW2pO4Vb7PMLHg/OlnrI8cfC0HX7iXcNddi7RjQh6km2jULhljPSAf7FuatJVTcIMVaUCFauCQNIaR24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438759; c=relaxed/simple;
	bh=wVFti6V+O3MwB7Ac/I5QOLsV3o6ALp8WMsRV2SZrnCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFtSOs3d9TU8gmUyYCSiaCc/RS44OPnOKdiJaCmBWYnBcACJYXCMrfNSByb/pZl8gZUl/n46UArPDSlaNLUSnVIXEx1P62L0IemMw7qAjztK695CBXzZ/sRmrM4P2wr/V+JSSdMxzOtcJwUskmB15LxvulXUrxt40UNwzO4K4kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MChZjXhS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MChZjXhS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110CF1F000E9;
	Thu,  3 Sep 2026 12:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788438755;
	bh=lllQr/xve8D8s1etqR2PNBzAHCa4S3iEuLx4vR5u4GY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MChZjXhSfHOGtGbnPgLL0WodQbGS2vBkbxWW8V56E3aozS0skD4LQgaKOFb4/UFJL
	 vwswaEdWng01KLHder3JBwjTwG8uQDcGRH3bZ9t6UsIJEEf+APGJFFHRBG2eIXPr93
	 3znCcVe3QiW0Auljx0WNu8TVk4dg6tmpolvZaofRHDndv1tYwLaOpBiUL0q306ygOa
	 CG11rywRt1oxRJlFA0TQUhKSyf3nsNRCrQIrp0olLZ570ExS1sX07VPHpQqreb/6SA
	 sIQSC7Ct62Uo2tFt7sIv5NVB7URZgKm9AoE6SmZ6W8Ez5C00o8rV3r8K42y6ZLzlgc
	 UDpRs5n5s7S0g==
Message-ID: <faa755f7-e5cc-46c0-b838-8d015a481edb@kernel.org>
Date: Thu, 3 Sep 2026 13:32:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260901-x1e-csi2-phy-v16-0-dd863b929080@linaro.org>
 <20260901-x1e-csi2-phy-v16-1-dd863b929080@linaro.org>
 <RXmjC1LUSR46nHPlGyexr-0HTUa9z8BZY8CabY4J7P4YM9_ntzOucrOnanQBTZlD1jH69cHJEmPb_Xw7dRuqKA==@protonmail.internalid>
 <9b0ac659-999a-4caa-8578-f34a39a67e4f@linaro.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <9b0ac659-999a-4caa-8578-f34a39a67e4f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2026 12:53, Vladimir Zapolskiy wrote:
> On 9/1/26 23:15, Bryan O'Donoghue wrote:
>> Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
>> supports both DPHY and CPHY operation. A special mode of DPHY operation -
>> called variously split-mode or combo-mode also allows for two sensors to be
>> connected to one PHY.
>>
>> The submitted binding here describes the DPHY modes of operation only. CPHY
>> is left to future work.
> 
> Like I've said in v14 review, the statement above is incorrect, and it has
> to be changed, for whatever reason it hasn't happened so far.
> 
>   From https://lore.kernel.org/all/1e1bc17a-4c7a-4c08-b0c8-2a2ff31fe870@linaro.org/
Well, I'm not trying to describe CPHY here so I'm not claiming it is 
adequately described.

I'll reword this.

>>>> C-PHY bus type is also well described by this version of the bindings.
> 
>> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>    .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 222 +++++++++++++++++++++
>>    1 file changed, 222 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> new file mode 100644
>> index 0000000000000..17de0701eb103
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -0,0 +1,222 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm X1E80100 SoC CSI2 PHY
>> +
>> +maintainers:
>> +  - Bryan O'Donoghue <bod@kernel.org>
>> +
>> +description:
>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
>> +  modes.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,x1e80100-csi2-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: timer
>> +      - const: ahb
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  operating-points-v2: true
>> +
>> +  opp-table:
>> +    type: object
>> +
>> +  power-domains:
>> +    items:
>> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
>> +      - description: MMCX voltage rail
>> +      - description: MXC or MXA voltage rail
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: top
>> +      - const: mmcx
>> +      - const: mx
>> +
>> +  vdda-0p9-supply:
>> +    description: Phandle to a 0.9V regulator supply to a PHY.
>> +
>> +  vdda-1p2-supply:
>> +    description: Phandle to 1.2V regulator supply to a PHY.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description:
>> +          Sensor input. Always present. A single sensor is described by a
>> +          single endpoint with the clock lane at position 0 and one to four
>> +          data lanes.
>> +
>> +          DPHY split mode, where two independent sensors share the same PHY,
>> +          is described by two endpoints, each with its own clock lane position;
>> +          endpoint@0 with clock-lanes = <0> and one or two data-lanes and
>> +          endpoint@1 with clock-lanes = <3> and one data lane.
>> +
>> +        unevaluatedProperties: false
>> +
>> +        patternProperties:
>> +          "^endpoint(@[01])?$":
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +            properties:
>> +              bus-type:
>> +                enum:
>> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>> +              clock-lanes:
>> +                maxItems: 1
>> +
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +                items:
>> +                  minimum: 1
>> +                  maximum: 4
>> +                description:
>> +                  Data lane positions following this endpoint's clock
>> +                  lane. Positions are a per-port logical numbering, not
>> +                  package pad or ball positions.
>> +
>> +            required:
>> +              - bus-type
> 
> A review comment given to v14 is still applicable, 'bus-type' property
> should be set as optional with D-PHY mode fallback.

I believe you said "could" be optional in v14 but, if you actually 
_want_ it optional, I'll update this to reflect, np.

> 
>> +              - data-lanes
>> +              - clock-lanes
> 
> Here 'clock-lanes' is a truly optional proiperty since its value is
> immutable in each endpoint, it should be removed from the list of
> required properties.

Hmm.

I want to make sure clock-lanes is defined and set to the correct value.

For example clock-lanes = <2> for split mode is wrong.
> 
> Also 'clock-lanes' are not expected to be found in C-PHY bus type case.

Right so to both verify the property and not require it from CPHY I will 
make it required only for DPHY.

>> +              - remote-endpoint
>> +
>> +        allOf:
>> +          - if:
>> +              required:
>> +                - endpoint@1
>> +            then:
>> +              properties:
>> +                endpoint@0:
>> +                  properties:
>> +                    clock-lanes:
>> +                      const: 0
>> +                    data-lanes:
>> +                      maxItems: 2
>> +                endpoint@1:
>> +                  properties:
>> +                    clock-lanes:
>> +                      const: 3
>> +                    data-lanes:
>> +                      items:
>> +                        - const: 4
>> +              required:
>> +                - endpoint@0
>> +            else:
>> +              patternProperties:
>> +                "^endpoint(@0)?$":
>> +                  properties:
>> +                    clock-lanes:
>> +                      const: 0
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Output to the CAMSS CSID controller.
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - operating-points-v2
>> +  - power-domains
>> +  - power-domain-names
>> +  - vdda-0p9-supply
>> +  - vdda-1p2-supply
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/media/video-interfaces.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    phy@ace4000 {
>> +        compatible = "qcom,x1e80100-csi2-phy";
>> +        reg = <0x0ace4000 0x2000>;
>> +
>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
>> +                 <&camcc CAM_CC_CORE_AHB_CLK>;
>> +        clock-names = "core",
>> +                      "timer",
>> +                      "ahb";
>> +
>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>> +
>> +        operating-points-v2 = <&csiphy_opp_table>;
>> +
>> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
>> +                        <&rpmhpd RPMHPD_MMCX>,
>> +                        <&rpmhpd RPMHPD_MX>;
>> +        power-domain-names = "top",
>> +                             "mmcx",
>> +                             "mx";
>> +
>> +        vdda-0p9-supply = <&vreg_l2c_0p9>;
>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                csiphy0_in: endpoint {
>> +                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>> +                    clock-lanes = <0>;
>> +                    data-lanes = <1 2 3 4>;
>> +                    remote-endpoint = <&sensor_out>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +                csiphy0_out: endpoint {
>> +                    remote-endpoint = <&csid_in>;
>> +                };
>> +            };
>> +        };
>> +
>> +        csiphy_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            opp-300000000 {
>> +                opp-hz = /bits/ 64 <300000000>;
>> +                required-opps = <&rpmhpd_opp_low_svs_d1>,
>> +                                <&rpmhpd_opp_low_svs_d1>;
>> +            };
>> +        };
>> +    };
>>
> 
> Apart of a few minor comments above, everything else looks good to me.
> 
> --
> Best wishes,
> Vladimir

