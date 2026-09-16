Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935B03EF66B;
	Wed, 16 Sep 2026 07:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789542051; cv=none; b=q4qmYHf29x56/Lo0VJ1rng6dMNuEDU/O4tU4Cmbj1+FcG4hd5Rk/s2QmYVxzwaWYe63CziIH2Uszha9TemKYtq7IkfQ488/IBCUnP3jWyhWCr/r/GjnHMuHYPjEd3XPpkRo1SzzcyTMh4s3yDSKbinuNmsJstpPWCG1UeNhCFq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789542051; c=relaxed/simple;
	bh=XXt/qwAoj1t7ccosJHSNNE4Gha6I7iVikWuRABYWWHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/Ijpwl/BduwHlTAHrhXflfoT8zEF0WI0kuT1yC3IDrjfDN9hu7j8ioOY8rzt4IrWgqQ597UAyAAgOldNw9OCZHirSgE2d8DA6vk5J1/yotkI9OKpJ4odJVxPCxidNeZvkLP/j3/yzQ+EeczUv29/iBUncsxka62/mO+v2OXlIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RP4WARjx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RP4WARjx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199611F000FF;
	Wed, 16 Sep 2026 07:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789542050;
	bh=VjyJ3QHfl2rO9pAu/Qmpoe/bIC8oEq7hAxTnd1ZvaN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RP4WARjxtQ69HDtiE8hQUy0gl4gsh99I3K7YK9iH2WZjj3+pvDNLRZ0cxd70zfexm
	 1dgdbtAqj+XV1YALD7B3d6ELuE+nzjHzxyQlLVdTf9XBfyQxYdFJOOLVhkb2AtkAUp
	 aE801UddQBWATlihnprKpwwLfTUcUGfQuK65w9HomeQx+UzJKrM+u+j8m9OD7UhA24
	 qDR9i1mBit2t7LejFGjROCHn2YiPhOYMCqofoMMIGHNAhlwMqEap/jimVqycS0roES
	 h4RwiztqfAwKAxjOOMFzNU3oRoqsqygw67epnofyWOoTLGVEw6XlJN6kQp6kK2VhmQ
	 B2S1zr4wvGVfg==
Date: Wed, 16 Sep 2026 09:00:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: media: i2c: Add
 vision-components,mipi-module-controller
Message-ID: <20260916-daft-relaxed-mouse-9bfaf4@quoll>
References: <20260915-vc-mipi-ctrl-v1-0-8a42b693d889@linux.dev>
 <20260915-vc-mipi-ctrl-v1-2-8a42b693d889@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915-vc-mipi-ctrl-v1-2-8a42b693d889@linux.dev>

On Tue, Sep 15, 2026 at 10:20:24PM +0200, Richard Leitner wrote:
> Add bindings for the Vision Components MIPI Camera Module Controller.
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  .../vision-components,mipi-module-controller.yaml  | 92 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++
>  2 files changed, 99 insertions(+)

This fails tests, so a very brief review / a few comments:

> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.yaml b/Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.yaml
> new file mode 100644
> index 0000000000000..2a031aea68457
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/vision-components,mipi-module-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Vision Components MIPI Camera Module Controller
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +  - Richard Leitner <richard.leitner@linux.dev>
> +
> +description: |-
> +  The MIPI camera module controller is an FPGA-based, I2C-accessible system
> +  controller found on MIPI camera modules from Vision Components. It abstracts
> +  the camera sensor behind a unified register interface, and controls and
> +  sequences the on-board power supplies and clocks.
> +
> +  The camera sensor abstraction is optional. The controller exposes a tunneled
> +  downstream I2C bus used by the attached image sensor. The controller node
> +  acts as the upstream device on the host bus, while child node below the
> +  controller represent the sensor device reachable through the tunnel.
> +
> +properties:
> +  compatible:
> +    const: vision-components,mipi-module-controller

There is no model name, no version, nothing identifying it better?
Compatible must be specific to the device (see also writing bindings).

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 0
> +
> +  clock-frequency:
> +    description: Frequency of the sensor clock provided by the module

Drop, implied by the compatible

> +
> +  vcc-supply:
> +    description: Power supply of the module (3.3V)
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

No children allowed, so why these two?

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - clock-frequency
> +  - vcc-supply
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +unevaluatedProperties: false

additionalProperties instead, see writing bindings or writing schema.
Unless you miss here some other schema $ref.

> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        vc_mipi_ctrl: controller@10 {
> +            compatible = "vision-components,mipi-module-controller";
> +            reg = <0x10>;
> +            #clock-cells = <0>;
> +            clock-frequency = <37125000>;
> +            vcc-supply = <&cam_3v3>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            i2c@0 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                vc_mipi_sensor: camera@60 {
> +                    compatible = "ovti,ov9281";
> +                    reg = <0x60>;

Why having the child abstraction if it is completely abstracted? I don't
fully get the explanation from description. Completely optional means no
benefits, no point in it, no?

Best regards,
Krzysztof

