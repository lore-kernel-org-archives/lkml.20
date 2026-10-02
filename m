Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB6A3D954F;
	Fri,  2 Oct 2026 06:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790921648; cv=none; b=ryZKPYN1yTv8UBUHr6+8BaZyvVC3rz55YXeXcH1WvVg1NmBrhsv65usE6PV11Wq+5u86evjPlSY8L/dXKQLIZxnDm3ntE0jdrfYFvkofe7Uzpz15HbNNamDur8CxDVvGOaJfMMvOusII7hdL0reBKQWE1aGWtSE7fA425bCw2jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790921648; c=relaxed/simple;
	bh=cq858TTpwbQ0a6M0Ph7oRdQebhWSEztcpX+aOvu+QWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t56vyYIKjnV8AZz5ETIdBTm4ZV4VrnFb0YB6/Q9xjRKTVhoRQDDDidzgv5lNel8osbWK6ghqaGkA45skhIMUju1ANO7yx+PE4NNEga3eBszxBav6bBV0XaIPPggjvdKhcc0zPtT+ChAUGr2YlCjoUgEgzxgIKqqXCysTiXjWLGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4is420E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4is420E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B681F000FF;
	Fri,  2 Oct 2026 06:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790921647;
	bh=mF7zPZZiyi1UeenhlWbnxlNgGDfxL0sUjRand4J9S74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E4is420Ey8dJrq/CWtEZBCbozdYPW6MAF9HME2Oi5mlvh4uoSxUmI9bYPYsq8y8ZW
	 lMaj4TBBJ2zI/+pvBZNzDLjxBkdgS/S+ui74xsoSohOW3YLlw7L0Wq3U/SgKJrFqkQ
	 f+fxrSkWfduX2JsWz8rYszQyF8B+LmhlN6zCSPhTxCVGDxqGgo3SLFnYIWPK0Ba4LI
	 AayGMqrcQmP/Bd+0FdMVqbicTQMVVzG5TJeAIrmHulVwb6Cc6Uhu8yMsJiyeNTARhX
	 lv78X4k/ASMTleeuT/atNXOUbzRSjkx7cyivo2RHHnNpsGM3rrgSZNDR23FSGvHIH+
	 TEl+uDcCvm4aA==
Date: Fri, 2 Oct 2026 08:14:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: Add Allwinner D1 CSIC
Message-ID: <20261002-angelic-wombat-of-chemistry-af8a67@quoll>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930154835.402684-2-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930154835.402684-2-tien.nguyenminh@embeddedlinux.blog>

On Wed, Sep 30, 2026 at 10:48:33PM +0700, Nguyen Minh Tien wrote:
> +maintainers:
> +  - Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
> +
> +description:
> +  The CSIC found in the Allwinner D1, D1s and T113 receives video from a
> +  parallel camera interface and writes it to memory. It contains a parser for
> +  the camera bus and two DMA engines.
> +
> +properties:
> +  compatible:
> +    const: allwinner,sun20i-d1-csi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: DMA engine 0
> +      - description: DMA engine 1
> +      - description: Parser 0
> +      - description: Top-level block (CSI_TOP_PKT)
> +
> +  clocks:
> +    items:
> +      - description: Bus clock
> +      - description: Module clock
> +      - description: DRAM clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +      - const: ram
> +
> +  resets:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    description: Parallel input port, connect to a parallel sensor
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          bus-width:
> +            const: 8

If it is const, why do you exactly need it in the DT?

> +
> +          pclk-sample: true
> +          hsync-active: true
> +          vsync-active: true

Drop these three.

> +
> +        required:
> +          - bus-width

No second port to the ISP?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sun20i-d1-ccu.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/reset/sun20i-d1-ccu.h>
> +
> +    csi@5800000 {
> +        compatible = "allwinner,sun20i-d1-csi";
> +        reg = <0x05800000 0x400000>;
> +        interrupts = <111 IRQ_TYPE_LEVEL_HIGH>,
> +                     <112 IRQ_TYPE_LEVEL_HIGH>,
> +                     <116 IRQ_TYPE_LEVEL_HIGH>,
> +                     <122 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&ccu CLK_BUS_CSI>,
> +                 <&ccu CLK_CSI_TOP>,
> +                 <&ccu CLK_MBUS_CSI>;
> +        clock-names = "bus", "mod", "ram";
> +        resets = <&ccu RST_BUS_CSI>;
> +
> +        port {
> +            endpoint {
> +                remote-endpoint = <&ov5640_ep>;
> +                bus-width = <8>;
> +                hsync-active = <1>; /* Active high */
> +                vsync-active = <0>; /* Active low */
> +                pclk-sample = <1>;  /* Rising */
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f5eff489a8..f4c45c4678 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -905,6 +905,13 @@ L:	linux-crypto@vger.kernel.org
>  S:	Maintained
>  F:	drivers/crypto/allwinner/
>  
> +ALLWINNER D1 CSIC DRIVER
> +M:	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media.git

Drop, unless you actually have their commit rights and manage patches. I
would say mailing list is also here redundant (duplicating), but I
stopped pointing to it.

Best regards,
Krzysztof

