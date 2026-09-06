Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC908372EE2;
	Sun,  6 Sep 2026 06:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788677754; cv=none; b=Bq4OflKaIwnibQLV8eQevs/nMtXe3vE2XkxqJ8oSCQS6XaJZqlu0iVlxZu+I7FIVvdX4U0DiAAPAWnG/KtwLVWpDtYLMYL/aDgXAQX/jvxNM06aAJcGZtXvM/pCIUYfdqS0dwu5Qr37bWkDXYREOgeqCMMBeOldpT7c48VpPSiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788677754; c=relaxed/simple;
	bh=rV5UIVLOB4ePmHB9fU26CprNmBXcEac3rrqMjYF1pGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rge8D4J6rUQ7Gwz/ZFA2VlWpwfA5TXfsmpMItmfA1UG563yAp0avaVa4j3a9OJGo8hbscwCX02znhh/8/nv3eJdm9sd5gqVjD50d6gUAxbxNdg8hId/m06sqwdT7/fMmfPksMV2ve4jP0G/QBtX5FxK2iuy8IDixDSA3tVJpxbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRihK53R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRihK53R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA451F00A3A;
	Sun,  6 Sep 2026 06:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788677752;
	bh=TWa86xSo2EM7HfD7rT76RWRGqKAuqqO2x3EPFvEsdAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DRihK53RuGMSiH8chL7jimw4KeXWs8fm/rKej946fBVmDRRFPZ1bSR4xp1s7AH6Cz
	 +b6DSYwoYr/HJUqg4FzaodhtKLkzm8GEeIc1pRm2QLaNSS0AUCOkCvsGzGNOobLCzf
	 1Tj9vlb/sEvsk+I573kMrUc8RTPmO77wFDYDOeCwwUb2nnMwMmXAOSpyRofvh0+uKL
	 MfgvD5Ra+3Anrxhd//323lEIhCG2DODpF8/kYF/QTXLzFgQ0sR44FAGMQhiT5BtLk6
	 aAJVRV49OQHxpKYal+jhzRGKNQ1ELb+OQdiKs71Xgn6FNIkUm2uIsuqAn7mmXX9MD0
	 rm7vID3/K65yw==
Message-ID: <7c52bcf5-8b58-4c15-bf1a-ba7a0bb04db1@kernel.org>
Date: Sun, 6 Sep 2026 08:55:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: usb: Add CIX Sky1 USBSSP controller
To: Hongliang Yang <hongliang.yang@cixtech.com>, peter.chen@kernel.org,
 gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de, vkoul@kernel.org, neil.armstrong@linaro.org,
 pawell@cadence.com, rogerq@kernel.org
References: <20260906032440.470788-1-hongliang.yang@cixtech.com>
 <20260906032440.470788-3-hongliang.yang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260906032440.470788-3-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/09/2026 05:24, Hongliang Yang wrote:
> Add device tree binding for the CIX Sky1 Cadence USBSSP controller
> glue layer. The integration adds glue registers and mode strap
> controls in the Sky1 S5 system controller. The CIX glue node wraps
> a Cadence USBSSP core as a child node.
> 
> The per-controller RCSU control and status registers live in a shared
> RCSU region described by the cix,sky1-usbss-rcsu binding and are
> referenced through the cix,usb-rcsu phandle.
> 
> The per-controller RCSU registers are accessed through a syscon regmap
> referenced by the cix,usb-rcsu phandle.
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
> ---
>  .../bindings/usb/cix,sky1-usbssp.yaml         | 144 ++++++++++++++++++
>  MAINTAINERS                                   |   3 +
>  2 files changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> new file mode 100644
> index 000000000000..8e66dea50fa7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> @@ -0,0 +1,144 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/cix,sky1-usbssp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 Cadence USBSSP Controller
> +
> +maintainers:
> +  - Hongliang Yang <hongliang.yang@cixtech.com>
> +
> +description:
> +  The CIX Sky1 USBSSP controller is based on the Cadence USBSSP DRD
> +  controller. The integration adds glue registers and mode strap controls
> +  in the Sky1 S5 system controller. The CIX glue node wraps a Cadence
> +  USBSSP core as a child node. The per-controller RCSU control/status
> +  registers live in a shared RCSU region and are accessed through the
> +  cix,usb-rcsu phandle.
> +
> +properties:
> +  compatible:
> +    const: cix,sky1-usbssp
> +

No MMIO here?

> +  cix,usb-rcsu:

Then this is your device.

Last time you claimed you have TWO registers. ONLY. Now you claim you
have entire address space, but somewhere else.

If you do not have here MMIO, then this glue layer is not a separate
device node and you should have one node only, just like we did for DWC.
One node for glue layer and CDNS USB.

If you have here MMIO for some glue over IP block, then it is unlikely
to be a syscon.



> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      A phandle to the USBSSP RCSU system controller region (see
> +      cix,sky1-usbss-rcsu.yaml) followed by two cells: the offset of
> +      the AXI property configuration register and the offset of the
> +      controller status register, both relative to the RCSU region.
> +    items:
> +      items:
> +        - description: phandle to the USBSSP RCSU syscon node
> +        - description: offset of the AXI property configuration register
> +        - description: offset of the controller status register
> +
> +  clocks:
> +    items:
> +      - description: Start-of-frame clock
> +      - description: AXI bus clock
> +      - description: Low-power mode clock
> +      - description: APB register interface clock
> +
> +  clock-names:
> +    items:
> +      - const: sof
> +      - const: axi
> +      - const: lpm
> +      - const: apb
> +
> +  resets:
> +    items:
> +      - description: APB register reset
> +      - description: Controller reset
> +
> +  reset-names:
> +    items:
> +      - const: apb
> +      - const: core
> +
> +  cix,usb-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the Sky1 S5 system controller used to program USB mode
> +      strap controls.

One more syscon?

> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^usb@[0-9a-f]+$":
> +    $ref: cdns,usb3.yaml#
> +
> +required:
> +  - compatible
> +  - cix,usb-rcsu
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - cix,usb-syscon
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/cix,sky1.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        rcsu: syscon@91c0300 {
> +            compatible = "cix,sky1-usbss-rcsu", "syscon";
> +            reg = <0x00 0x091c0300 0x00 0x200>;
> +        };

Drop node irrelevant.


> +
> +        usb-4 {

This is just "usb". Not usb-foo.

> +            compatible = "cix,sky1-usbssp";
> +            ranges;
> +            #address-cells = <2>;
> +
> +            clocks = <&scmi_clk CLK_TREE_USB3A_H0_CLK_SOF>,
> +                     <&scmi_clk CLK_TREE_USB3A_0_AXI_GATE>,
> +                     <&scmi_clk CLK_TREE_USB3A_H0_CLK_LPM>,
> +                     <&scmi_clk CLK_TREE_USB3A_0_APB_GATE>;
> +            clock-names = "sof", "axi", "lpm", "apb";
> +            resets = <&src SKY1_USBC_SS2_PRST_N>,
> +                     <&src SKY1_USBC_SS2_RST_N>;
> +            reset-names = "apb", "core";
> +            #size-cells = <2>;

size-cells follows address-cells.


Best regards,
Krzysztof
