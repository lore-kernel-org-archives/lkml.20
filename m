Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000268;
	b=BSFDLDL0paR03sKghcAK2NVGGTtI27pfVwCFlJt7Q+bFCUIacVmG+HvjA72c8+ZEwt/g
	 zp5CY953Kx5UYZfMXJ3FKGTp3KMdNKfzUOnw9K+MtQ9asV+g1CwLjOwO23VoLMqZfIZTf
	 rpTyUIdG6NJknNEexl17ixVIQDVVgkIMpDTrxb+z2uGR3UuiRaKxAOlRMjpDthE2xAaPs
	 Qvw1MhK3OK/zyBcTWa/MQh2hQEhxPD84DQAiuNpCrJ8XNoWS6TaH1CP4nqL9com8ikLAY
	 sHzbdhcSrVw9OEQiwIIjtgd+WiCq2bRZ/vvu3H0AivpV9u/MgnlcqUtataRTq48Ch6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JgQZorfmVJL6DWcFzREhLYKs0WMZqy2VS3+IW1fCCJ4=;
	b=hoL1Pf3iEWE73GKomhZMBdzo/w3weEpA2Ip8YfXR+Vg8LeGAak5nbBPBgWc/yL0umNe8
	 Z8OBSPRAGEJCPFXLrOHPXR7Wi+dAb+D/0BO6HxwbYVTtZe7eJ8Vrq24MhE1wS26HGSwBb
	 kEWJeM0pDqd7U6DQuhpwQnLf/adfucvsv9u6F2JJrVSOLFaVTXrDRlBTOAjHWLDBkaOCF
	 nIh12Bfjo3Vggn4husI0W7bkvdLxP423jWJT09kyS3xOq6cegFinEhAlt2gHSHVjH/P0O
	 9U1nIgSmuMMXcqNe8Vihp7v0fAbGvxQxK0DGR4AaBCa9eDYRyccu2L6x9obS5zqGgQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="rWLQ/8NW";
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B7A606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33B7A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rWLQ/8NW
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3acd263d530so1393641fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794000266; x=1794605066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JgQZorfmVJL6DWcFzREhLYKs0WMZqy2VS3+IW1fCCJ4=;
        b=rWLQ/8NWxTGE/7+gNMjHcxkZNPqwFvuYgZW+TdXQEU7SS2f99Y3LAXTCHZcvHdfOBl
         PjsJ/1Fy5Qu/bARBKYihzWRiICTuoQdf50Nm8YByyuzV9d/lIKCImMWz765V72sYLfGd
         Icrjp04ZjcGfgo0ngM6Tj8bKbzvsQwtTqecy06coNgmMxoYFB+a072BrhagO0+9X4uD5
         hjFIx3zvJgr5O+yDFnMfL+HiiUCP+5dOtF2n/Gt6YUDEGLlI55CgqFOqUUlD0Ch5INhe
         wJfAqNzxWEbd8qjNMKIJetz0zFTA6W09gT1TyRGxwhdd6PSwKfQ3xqxSFfX7lseuG4I2
         4y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794000266; x=1794605066;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgQZorfmVJL6DWcFzREhLYKs0WMZqy2VS3+IW1fCCJ4=;
        b=2iHHpdIGwqbuuEoSLGQ4SPYT4CicpPwqdYx5PBKmXvEQeOdCqI873beR8iPrzu7lu1
         fsPYdaQyArUpvv9C3X/DzvzLDzRV2lLCR2iAqoOXyig/yTrAIUPToLDTVUlWDvA6P7Vv
         E781VPNKyvMchvOh74YtXxVr6fdrEsdK5MXes8Rmz+YixlKrpxsAxkWAvQFA7i1kpi5L
         1t1WBPGAi65/ZIflNZt6obZW2o9c7ezHz9gparQ1sy3Zy6yYsKsJjltn3cVirQgAGc7v
         /RJN96Hhcy0xTmnPE1z+mWA1nXQbH8yy5fiMnWsE/MPVIDJMhe3TnJAt03jBPMwXCi3v
         JuuQ==
X-Forwarded-Encrypted: i=1; AL+hErGg/WtvIV+c35N4jTvNJyq0QrDtV7rbwkL/o0jU/g+VykAui6ZQIrZ2JB2ew/s1dDCcEqvezTw0mcQabXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Oc+LV4kwml5PVnxYwSCd5bDEJkOjRCiWkvoEhm/a/75uYcki2
	MY8HqlIO1diEOnDpsllLWRuDhM83BDAfg3mQwJ7NAn+8llFPdPozNsHqkvclV5Ya5AU=
X-Gm-Gg: AYBFou3Y7hL4i7ItAkgm+nLbfFkn3dlcnntguYTJOnACy/fjOUgx/rDq9pMhXqM49HU
	e/C2R0Mq60FXcyop4xtINh4hcmdSYGUGCjRUDtaSohXL74g5D9tWqYc5KAIenPMNcYhTrkP/esA
	k1DIRzYQMG1DYFfKZa90DX/Xap7hlowP+ywBnDKI3ALjNUTp6sf8RdaxQHsKawDEnXXUYHTIUMk
	vtKnERaXsho2FdQZlGqBZW88DbW/hlCpPJNjJuom6G8jxLlWl73XY6R0myrbsV3ZAcY7L72UFcK
	BPOKcI740BZVsafIkwlXxMcmh7j2CWRqbvrlpuqf7GFWZYfFcFfWjukQQH0T5g8VrUgiYL56Zdy
	0lW0D+gHWQVGuyxbUm/aeWUSSxCJrjlKU0i7cqCZLnuNo1ScQGeBqx2L7MlYZMv5+tOTuyruR5C
	E/0jYNX2hpUbAFubxaazd8bx9KSLVyUr6EnSiIkYizGWG+/v7J7a+4MEmwmTLBMTY2FMOOWpBv2
	7IeAiG2XYVFoQI2F9R15SV1BnWjCjjB7Pg1pbcGH4Kc6wtPs7T7wHDnF1n8AFOi7vnZTF7m3X+U
	jsPVZhcCNgT8bm8zZ6l52FwmbFaJYdDLAiK5tdufkBGZXwnd2giu4gOv3pi3JABjyhKZ/v8dEDY
	ZiFs1xg==
X-Received: by 2002:a05:6512:1296:b0:5bf:a48b:7827 with SMTP id 2adb3069b0e04-5c0037d4da0mr1356307e87.2.1794000266266;
        Fri, 06 Nov 2026 13:24:26 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c00309a58bsm497564e87.73.2026.11.06.13.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 13:24:25 -0800 (PST)
Message-ID: <a9ab1add-5f04-4687-83bf-ca29a068ee33@linaro.org>
Date: Fri, 6 Nov 2026 23:24:24 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] dt-bindings: phy: qcom,sm8150-csi2-phy: Add SM8150
 CSI2 PHY
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-3-0103e8a0bbcd@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v3-3-0103e8a0bbcd@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 11/6/26 20:35, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Document the Qualcomm SM8150 MIPI CSI2 D-PHY. The PHY sits between the
> CSI2 sensor and the CAMSS CSI decoder and is fed by the CSIPHY "core" and
> "timer" clocks, the TITAN top power domain and the vdda-phy/vdda-pll
> supplies.
> 
> Unlike the X1E80100 C-PHY/D-PHY combo PHY, SM8150 only has a D-PHY, has
> no separate AHB clock and no MMCX/MX power domains, so describe it in a
> dedicated schema.
> 

very much appreciated for changing the CAMSS phys to this format.

Please double check if SM8150 CSIPHY v1.1 is capable of C-PHY:

* https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/blob/LA.UM.8.1.r1-16600-sm8150.0/drivers/media/platform/msm/camera/cam_sensor_module/cam_csiphy/cam_csiphy_soc.c#L239-256

D-PHY combo mode is also supported on the CSIPHY apparently.

Likely these features are supported on SM8150.

> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   .../bindings/phy/qcom,sm8150-csi2-phy.yaml         | 163 +++++++++++++++++++++
>   1 file changed, 163 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sm8150-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sm8150-csi2-phy.yaml
> new file mode 100644
> index 000000000000..86d8970d1119
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sm8150-csi2-phy.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,sm8150-csi2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8150 SoC CSI2 PHY
> +
> +maintainers:
> +  - Andrew Gigena <mail@andrewgigena.dev>
> +
> +description:
> +  Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
> +  CSI decoder (CAMSS).
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8150-csi2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: timer
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  power-domain-names:
> +    items:
> +      - const: top

In downstream camcc-sm8150.c, PLL0 is on MX, and PLL0 supplies CSIPHY
clocks. I believe MX shall be added to the list of 'power-domains'.

> +
> +  vdda-phy-supply:
> +    description: Phandle to a 0.88V regulator supply to a PHY.
> +
> +  vdda-pll-supply:
> +    description: Phandle to a 1.2V regulator supply to a PHY PLL.

Still it would be preferred to get 'vdda-0p9-supply' and 'vdda-1p2-supply'
properties.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Sensor input. A single sensor is described by a single endpoint with
> +          one to four data lanes, numbered 1-4. The clock lane is position 0.
> +
> +        properties:
> +          endpoint:

Back to downstream

* https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/blob/LA.UM.8.1.r1-16600-sm8150.0/drivers/media/platform/msm/camera/cam_sensor_module/cam_csiphy/cam_csiphy_soc.c#L239-256

D-PHY combo mode is also supported on the SM8150 CSIPHY apparently,
it shall be reflected in a way that two endpoints could be present.

> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                enum:
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +                default: 4

Please double check if SM8150 CSIPHY v1.1 is capable of C-PHY:

* https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/blob/LA.UM.8.1.r1-16600-sm8150.0/drivers/media/platform/msm/camera/cam_sensor_module/cam_csiphy/cam_csiphy_soc.c#L239-256

> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  minimum: 1
> +                  maximum: 4
> +
> +            required:
> +              - data-lanes
> +              - remote-endpoint
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output to the CAMSS CSI input port.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - operating-points-v2
> +  - power-domains
> +  - power-domain-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sm8150-camcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    phy@ac65000 {
> +        compatible = "qcom,sm8150-csi2-phy";
> +        reg = <0xac65000 0x1000>;
> +
> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
> +        clock-names = "core",
> +                      "timer";
> +
> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        operating-points-v2 = <&csiphy0_opp_table>;
> +
> +        power-domains = <&camcc TITAN_TOP_GDSC>;
> +        power-domain-names = "top";
> +
> +        vdda-phy-supply = <&vreg_l5a_0p88>;
> +        vdda-pll-supply = <&vreg_l12a_1p2>;
> +
> +        csiphy0_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-400000000 {
> +                opp-hz = /bits/ 64 <400000000>;
> +            };
> +        };
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                endpoint {
> +                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                    data-lanes = <1 2 3 4>;
> +                    remote-endpoint = <&sensor_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                endpoint {
> +                    remote-endpoint = <&camss_csi0_in>;
> +                };
> +            };
> +        };
> +    };
> 

In general the change looks good, thank you, but likely it can be embedded
into the scheme for X1E.

-- 
Best wishes,
Vladimir
