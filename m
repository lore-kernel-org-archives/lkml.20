Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824005;
	b=lwzhPwntZeloVotR3bq6/SD4XVmGpPIOp6oSifIp+4+gWvF8cr0RhD6t6iID/PpSQk/P
	 bpdcX0y7EJl20OztF1a2bfKpiInwd+mVOh8j64dx/t/Byrq75Xv2Vx686yJaEgz4XcS1d
	 r+bc7rMELZouhh/Kg4Yx4FO82880C/FBg44OcnU0J+XInRuKtjtADOaD9PgDqE/aLvEoZ
	 IZawyfnseVEfv887vori2VAnMB2CTtqFnZAQ8wNG0QlAFX/UxLcuJ2PKwgYCgpww2WvKF
	 OMwtAaACPlZMgqWPpNvd3y4ADPTWolo8FlwFbSBv4D8OysSG6EAsttf6m6JEQBjU3bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824005;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XY2rmJ8885nktXMitJAyrE5uwC457rZep4K4ylZxzgo=;
	b=tEXqgiir+GlF5ZLl7eNxFbKIgSUwFADD73w+ZCkAvVo1GWuy44hpqqwyVj3kXdnFAbMK
	 IoxY4DZfDNsi5fV2YGroy7Ytq/0oDnFIVT2DDIjpLfZ9OaW2WnFMpFzVE1WqBvS+Ex8bF
	 VF6yZmSrLhnlY5CJc3ToYfm3tDTP6zUR/b1MBHVuCbp4Gr16JSe+WtlPU6vVjKprMYkQx
	 5MbM3TXA8nFM/z+MHCKzKkeCL6FQAcdMNEHBgicBu3bZnX30YGXs/Xy+Q0t7Mh1t8KG5x
	 M/dSQfHKGJrEXt3X5FyGZnZbFjIJs/np2ps0vx64Y9AIAcREVw8KRFDxXZ8KqwYJLSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V8ZgRc0d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90A4606A339;
	Mon, 16 Nov 2026 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V8ZgRc0d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F561F000C4;
	Mon, 16 Nov 2026 10:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824005;
	bh=XY2rmJ8885nktXMitJAyrE5uwC457rZep4K4ylZxzgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V8ZgRc0dKkYGKJB28RMQ5keuZd5FDYeRsqoYI8P9/++ykBfxePEIlCurHc3/Q12Hx
	 qntbB8bxSFLpfDyTP3ZaiInUffBjwl6AFUc8kDQPhMvd/uaRucvEekW2imOwI9WAjS
	 WYdy1qhrjMBbjHGB9VBUQgo+4DGtboec1lYRGlsjsM+hSQlpdot1uTkezb4vRgaL7a
	 Lo/+Q+zI6rtpVtjn83pqQkOVFDxMequOJ1WfagioxAk8ye5398D75YA0ZR48C1Huuv
	 nSAXMz5qOe2uYuLFAY+RWPYDC7+I5WWb/jfmlxB8LifNOZGKopnbgiapFlcjUkWxuw
	 qk/f5mOHYUVOA==
Date: Mon, 16 Nov 2026 11:13:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Gary Yang <Gary.Yang@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v8 1/2] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Message-ID: <20261116-hypersonic-purring-shoebill-5bbfa9@quoll>
References: <20261112022141.4136099-1-hongliang.yang@cixtech.com>
 <20261112022141.4136099-2-hongliang.yang@cixtech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112022141.4136099-2-hongliang.yang@cixtech.com>

On Thu, Nov 12, 2026 at 10:21:40AM +0800, Hongliang Yang wrote:
> +required:
> +  - compatible
> +  - reg
> +  - ranges
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - cix,usb-syscon
> +
> +patternProperties:
> +  "^usb@[0-9a-f]+$":
> +    $ref: cdns,usb3.yaml#

Please move patternProperties before "required:" block.

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
> +        usb@91c0314 {
> +            compatible = "cix,sky1-usbssp";
> +            reg = <0x00 0x91c0314 0x00 0x100>;
> +            ranges;
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +
> +            clocks = <&scmi_clk CLK_TREE_USB3A_H0_CLK_SOF>,
> +                     <&scmi_clk CLK_TREE_USB3A_0_AXI_GATE>,
> +                     <&scmi_clk CLK_TREE_USB3A_H0_CLK_LPM>,
> +                     <&scmi_clk CLK_TREE_USB3A_0_APB_GATE>;
> +            clock-names = "sof", "axi", "lpm", "apb";
> +            resets = <&src SKY1_USBC_SS2_PRST_N>,
> +                     <&src SKY1_USBC_SS2_RST_N>;
> +            reset-names = "apb", "core";
> +            cix,usb-syscon = <&src 0x424 8>;
> +
> +            usb@91d0000 {
> +                compatible = "cdns,usb3";
> +                reg = <0x00 0x91d0000 0x00 0x4000>,
> +                      <0x00 0x91d8000 0x00 0x8000>,
> +                      <0x00 0x91d4000 0x00 0x4000>;
> +                reg-names = "otg", "xhci", "dev";
> +                dr_mode = "otg";
> +
> +                interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
> +                             <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
> +                             <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +                             <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
> +                interrupt-names = "host", "peripheral", "otg", "wakeup";
> +                maximum-speed = "super-speed-plus";
> +
> +                phys = <&usb3_phy4>, <&usb2_phy4>;
> +                phy-names = "cdns3,usb3-phy", "cdns3,usb2-phy";
> +            };
> +        };
> +
> +        usb2_phy4: usb-phy {
> +            compatible = "usb-nop-xceiv";
> +            #phy-cells = <0>;
> +        };

And drop usb-phy

With these two:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

