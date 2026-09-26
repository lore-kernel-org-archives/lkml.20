Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AD92FFF89;
	Sat, 26 Sep 2026 14:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790434301; cv=none; b=VGeZCJCE/uvngbKr1nwvT0FIQliB4GspFdw7WaTe0x6EZKerWdsiKst+HxknCRl8OmeIv3wGfMC4BFy1HJNxDrhrBhbXjwQRdqqyWdI4Xoo/PlCqbfX+Tnz2DAancMy2TX5aIOndMc72pi80NAGmZt3RMMce17qdveIFtf4YgHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790434301; c=relaxed/simple;
	bh=pZTeVCBlihakj8ZvNv1lAbjxoAd+n7SrGIEcG9d3MYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cx11Ti2W98XwtF1uCCKvWbUZtOWNl933hpmSLTtoIKrmZm98tZwwy+4w1CDQNKReXRwKUe24m/ZARE/0kSq8tWX1Hpi5GQQgXU34ACvxYtn1cj3z0jmKiyN+i4HA/odDUaWn7raEe/LpMM6zM5ke8zP/gvSPhDhbkgyuHrxHDFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kgnQyVoJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kgnQyVoJ"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9022BB5;
	Sat, 26 Sep 2026 16:49:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790434188;
	bh=pZTeVCBlihakj8ZvNv1lAbjxoAd+n7SrGIEcG9d3MYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kgnQyVoJjxp560wpTUaSNxt8ZRBb32HnVlVcX03MbARetRBUPqWOIAOFVDozVx52n
	 MKRWUAA9xeLYfsE1Cf5qmbcAQa5CfPZEe7WcBTw0GUe2hbOcFjvOl/cmKkN/yHfaLE
	 CjfEReU7M9nONodqmbLmRfImeplZEmP7oJpEjehE=
Date: Sat, 26 Sep 2026 17:51:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, sakari.ailus@linux.intel.com,
	mripard@kernel.org, jai.luthra@linux.dev,
	jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com, mirela.rabulea@nxp.com
Subject: Re: [RFC PATCH 1/8] dt-bindings: media: Add bindings for Omnivision
 OV2312
Message-ID: <20260926145135.GC764757@killaraus.ideasonboard.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-2-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925133001.2780868-2-r-donadkar@ti.com>

On Fri, Sep 25, 2026 at 06:59:54PM +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> Add DT bindings for Omnivision OV2312 camera sensor.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../bindings/media/i2c/ovti,ov2312.yaml       | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2312.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2312.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2312.yaml
> new file mode 100644
> index 000000000000..76929fcc6550
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2312.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov2312.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OmniVision OV2312 Camera Sensor
> +
> +maintainers:
> +  - Jai Luthra <j-luthra@ti.com>
> +
> +description: |-
> +  Omnvision OV2312 is a camera sensor with an active array size of 1600x1300.

s/Omnvision/OmniVision/

(although they now seem to style the company name as OMNIVISION)

> +  It supports capture of frames with a 4x4 RGB-IR bayer pattern. This provides
> +  both human (RGB) and machine vision (IR) capabilities in low-light scenarios.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ovti,ov2312
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: xvclk

If there's a single clock, drop the name.

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the RESET pin.

You also need regulators.

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: ../video-interfaces.yaml#
> +        unevaluatedProperties: false

The sensor supports both CSI-2 and parallel output. You need to be more
precise here regarding the supported properties. The bus type, in
particular, needs to be defined.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@60 {
> +            compatible = "ovti,ov2312";
> +            reg = <0x60>;
> +
> +            clocks = <&fixed_clock>;
> +            clock-names = "xvclk";
> +
> +            reset-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                camera1: endpoint {
> +                    remote-endpoint = <&vin1a_ep>;
> +                };
> +            };
> +        };
> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart
