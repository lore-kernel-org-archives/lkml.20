Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CC534EF0D;
	Tue, 29 Sep 2026 00:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790641689; cv=none; b=qxAuzJqk+VN6B5ajm/ncGsPu6Zac6muXGtqC5sO59DWqFdzd97d9HZnZ9j4mlQMdv9he5WX8RPMvyvK2FwwiJ8G7Yj6zkK9D0afomFa/rgcwLlkYY89b5Ckwn9FHOnUQi6qAHWMbuvqlRgmC86Tm/y5bqeJP8JbdwcukkSSTZ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790641689; c=relaxed/simple;
	bh=5PVP3FAoXnjZK6gVKBD8/rWFbZ7exuS79R920BDmlBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWoQtu8kyOprWutKvfduw9ENTu5iKgYWOtf297dWiYWUhYxbQxRHCmUfFkSSWk9+oYt7vB2XZhSxl+xB7IVR0KrO8kw+76LmAQsISE7LuNpcdvgiLjm6t7Arnef2CewjaGZiTazAltthQ0o+czeUiL/gxfNdEiGokniXc+3tuxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l8Vakiia; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l8Vakiia"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAC8FC3D;
	Tue, 29 Sep 2026 02:26:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790641574;
	bh=5PVP3FAoXnjZK6gVKBD8/rWFbZ7exuS79R920BDmlBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8Vakiia+AfpM3cpQedX9CfqURCJnn8EWmnkxMS1o7P0RcyNPOqRw9+bdDXPPawU5
	 v3EsRo44C6QDfCa1koY+8776Edq7EdAoo8vUfJ+JYlMqY1rhiOhUKIUrsLHLzvfgfS
	 DiSrdwzP2EwAQ8xZIY4PSgLH8rHSN7XAmPiGTo3k=
Date: Tue, 29 Sep 2026 03:28:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lachlan Michael <lachlan.michael@sony.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, kieran.bingham@ideasonboard.com,
	jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com,
	Kengo.Hayasaka@sony.com, Tim.Bird@sony.com, Kazumi.A.Sato@sony.com,
	Yuji.John.Takahashi@sony.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
Message-ID: <20260929002803.GC171869@killaraus.ideasonboard.com>
References: <20260828064843.65047-1-lachlan.michael@sony.com>
 <20260828064843.65047-2-lachlan.michael@sony.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260828064843.65047-2-lachlan.michael@sony.com>

Hi Lachlan,

Thank you for the patch.

On Fri, Aug 28, 2026 at 03:48:42PM +0900, Lachlan Michael wrote:
> The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
> with a MIPI CSI-2 output interface, supporting RAW10 and RAW12 output
> over 2 or 4 data lanes.
> 
> Add device tree bindings for the sensor.
> 
> Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v3:
> -  Adjust the binding description to match the actual hardware: the I2C
>    target address is selected by the SLAMODE pins, not fixed to 0x1A.
> -  Add the standard video-interface schema reference so the endpoint and
>    remote-endpoint validation match the media DT conventions.
> ---
>  .../bindings/media/i2c/sony,imx908.yaml       | 108 ++++++++++++++++++
>  MAINTAINERS                                   |   5 +
>  2 files changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> new file mode 100644
> index 000000000000..828db1175e2f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2026 Sony Semiconductor Solutions
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx908.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX908 CMOS Image Sensor
> +
> +maintainers:
> +  - Lachlan Michael <Lachlan.Michael@sony.com>
> +
> +description:
> +  Sony IMX908 diagonal 6.42 mm (Type 1/2.8) CMOS active pixel type
> +  solid-state image sensor with a square pixel array and 8.39 M
> +  (3856x2176) pixels, supporting MIPI CSI-2 output with
> +  RAW10 and RAW12 formats, configured as either 2 or 4 data lanes.
> +  The I2C target address is selected by the SLAMODE0 and SLAMODE1 pins.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,imx908
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: Input clock (24 MHz, 27 MHz, 37.125 MHz, 72 MHz or 74.25 MHz)
> +    maxItems: 1
> +
> +  dvdd-supply:
> +    description: Digital supply voltage (1.1V)
> +
> +  ovdd-supply:
> +    description: Interface supply voltage (1.8V)
> +
> +  avdd-supply:
> +    description: Analog supply voltage (3.3V)
> +
> +  reset-gpios:
> +    description: Sensor reset (XCLR) GPIO. Active low.
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - dvdd-supply
> +  - ovdd-supply
> +  - avdd-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +         camera@1a {
> +            compatible = "sony,imx908";
> +            reg = <0x1a>;
> +            clocks = <&cdce913_cam0 0>;
> +            dvdd-supply = <&cam_dvdd_1r1v>;
> +            ovdd-supply = <&cam_ovdd_1r8v>;
> +            avdd-supply = <&cam_avdd_3r3v>;
> +            reset-gpios = <&tca6416_cam0 5 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                imx908_out: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <720000000>;
> +                    remote-endpoint = <&csi0_in>;
> +                };
> +            };
> +        };
> +    };
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55b3c2d7a78a..bb7adcfd4767 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25538,6 +25538,11 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
>  F:	drivers/media/i2c/imx678.c
>  
> +SONY IMX908 SENSOR DRIVER
> +M:	Lachlan Michael <lachlan.michael@sony.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:	Maxim Levitsky <maximlevitsky@gmail.com>
>  M:	Alex Dubov <oakad@yahoo.com>

-- 
Regards,

Laurent Pinchart
