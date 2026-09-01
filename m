Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A9C4CCDF8;
	Tue,  1 Sep 2026 05:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788241663; cv=none; b=HRPdz99iGI+vtceyhNEKz4EIspQWlqNGIjpGrvQUxtNvB46vLNVhKKF3Bh+7XC9QreAIFj9nKQezyKqCUGWsLxq9bKWjs7KrdHW3JrUW1hvOl9k3tbnooukSFzWpZa41+YHKGqVlVfK6eMK7+M0U8F1vdRMXqxbFcB3t5v708xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788241663; c=relaxed/simple;
	bh=VpwS63NbME8IuJb6nm2MRV/gQddltvy6kmfDhE8M1g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=af4Dmo13sIUKPgg36Y/RdwWxz1iEVPpN5zZgLNoyvambKZSkfu9htmshYVFsJNOBkSlYoA5TFHvKp0ZKQvY/lUSVEyr+Hx/GOdhvkhHkcaOiscEZtofPXBtePDZgH6S7p9S3vYcz5+kv2aw5ZBZZ8lJrlVHBZne1iAO3eQ3eJOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iuemYoeZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iuemYoeZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399E01F000E9;
	Tue,  1 Sep 2026 05:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788241661;
	bh=EKfCohoJKBTiPKVgTsTz6ZX4azQ94zIE5XmXPUkUt30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iuemYoeZGFGLTERH7y3jY2bzkArxvG6wMjgtiKKEy92VH/J3opeqKj/5FgrxtZ4lc
	 1tvC3QJxqJFEd9LU60idFIJ/oD/kl+t+mc7lsYlN3C96oZO1N66bJO7dnfh1SUhvxb
	 933ykveeql9pNlWw6tQOBVvby6BJlVpqWH9kRtk+OY+7TSytfolsuXwa0kDv/a1Kz3
	 ayYZuR4vAcYs02iPo2+zqb974L99l2MpqjBq7OuyEXgLpLgurBo5WoFFoFXfNELInc
	 3vN4WfitOkY5BpSACsLrv4kXB3US0TZX5AwXqJc8rvqKNLmd0dsAVIBzxKqrQz8DRz
	 jSvrJOwAJ+uWQ==
Message-ID: <503e87d9-3311-413a-98c0-e02a02c4a354@kernel.org>
Date: Tue, 1 Sep 2026 07:47:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] dt-bindings: Add CIX Sky1 USB bindings
To: Hongliang Yang <hongliang.yang@cixtech.com>, peter.chen@kernel.org,
 pawell@cadence.com, vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: gregkh@linuxfoundation.org, rogerq@kernel.org, neil.armstrong@linaro.org,
 p.zabel@pengutronix.de, fugang.duan@cixtech.com,
 cix-kernel-upstream@cixtech.com, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
 <20260831082309.3854507-2-hongliang.yang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <20260831082309.3854507-2-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/08/2026 10:23, Hongliang Yang wrote:
> Add device tree bindings for CIX Sky1 USB3 PHY and Cadence USBSSP
> controller glue layer.
> 
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
> ---
>  .../bindings/phy/cix,sky1-usb3-phy.yaml       | 109 +++++++++++++
>  .../bindings/usb/cix,sky1-usbssp.yaml         | 153 ++++++++++++++++++

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

And do not combine USB patches with other subsystems.

>  MAINTAINERS                                   |   3 +
>  3 files changed, 265 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
> new file mode 100644
> index 000000000000..76d020df72dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/cix,sky1-usb3-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 USB3 PHY
> +
> +maintainers:
> +  - Hongliang Yang <hongliang.yang@cixtech.com>
> +
> +description:
> +  The CIX Sky1 USB3 PHY is a multi-port SuperSpeedPlus PHY that
> +  supports up to two USB3 lanes. Each port is represented as a
> +  child node of the PHY controller.

Please read and follow DTS coding style.

> +
> +properties:
> +  compatible:
> +    const: cix,sky1-usb3-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: APB register interface clock
> +      - description: PHY reference clock
> +
> +  clock-names:
> +    items:
> +      - const: apb_clk
> +      - const: ref_clk
> +
> +  resets:
> +    items:
> +      - description: PHY reset
> +      - description: PHY APB preset
> +
> +  reset-names:
> +    items:
> +      - const: reset
> +      - const: preset
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^usb-port@[0-9a-f]+$":
> +    type: object
> +    description:
> +      A single USB3 PHY port/lane.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      "#phy-cells":
> +        const: 0
> +
> +    required:
> +      - reg
> +      - "#phy-cells"
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +unevaluatedProperties: false

Which other schema do you want to reference?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/cix,sky1.h>
> +    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
> +
> +    usb-phy@9210000 {
> +        compatible = "cix,sky1-usb3-phy";
> +        reg = <0x09210000 0x40000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        resets = <&s5_syscon SKY1_USBPHY_SS_RST_N>,
> +                 <&s5_syscon SKY1_USBPHY_SS_PST_N>;
> +        reset-names = "reset", "preset";
> +
> +        clocks = <&scmi_clk CLK_TREE_USB3A_PHY3_GATE>,
> +                 <&scmi_clk CLK_TREE_USB3A_PHY_x2_REF>;
> +        clock-names = "apb_clk", "ref_clk";
> +
> +        usb-port@0 {
> +            reg = <0>;
> +            #phy-cells = <0>;
> +        };
> +
> +        usb-port@1 {
> +            reg = <1>;
> +            #phy-cells = <0>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> new file mode 100644
> index 000000000000..47202ff5b9e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
> @@ -0,0 +1,153 @@
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
> +  USBSSP core as a child node.
> +
> +properties:
> +  compatible:
> +    const: cix,sky1-usbssp
> +
> +  reg:
> +    items:
> +      - description: AXI property configuration register
> +      - description: Controller status register

Registers are not address spaces. Devices do not have address spaces of
one register, so this is not a real device.


> +
> +  reg-names:
> +    items:
> +      - const: axi_property

axi

> +      - const: controller_status

controller



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
> +      - const: sof_clk
> +      - const: usb_aclk
> +      - const: lpm_clk
> +      - const: usb_pclk
> +
> +  resets:
> +    items:
> +      - description: APB register reset
> +      - description: Controller reset
> +
> +  reset-names:
> +    items:
> +      - const: usb_preset
> +      - const: usb_reset
> +
> +  cix,usb_syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the Sky1 S5 system controller used to program USB mode
> +      strap controls.

So this is part of that device most likely.

> +
> +  axi_bmax_value:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0x7
> +    description:
> +      AXI bus maximum burst length configuration value.
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
> +  "^usb-controller@[0-9a-f]+$":

Why using completely different names than entire Linux kernel?

> +    $ref: cdns,usb3.yaml#
> +    description:
> +      The Cadence USBSSP core controller node. See cdns,usb3.yaml
> +      for properties such as dr_mode, maximum-speed, phys, and interrupts.

Redundant description.

> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - cix,usb_syscon
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
> +        usb@91c0300 {
> +            compatible = "cix,sky1-usbssp";
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;
> +
> +            reg = <0x00 0x091c0314 0x00 0x4>,
> +                  <0x00 0x091c0400 0x00 0x4>;

Nope. You do not have a device with two registers.


Best regards,
Krzysztof
