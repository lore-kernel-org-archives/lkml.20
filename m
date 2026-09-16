Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64041368D5A;
	Wed, 16 Sep 2026 07:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544769; cv=none; b=X7hH2NSSORuD280xZFqKauX7S/Udvc3vYoJlX9NDIEWYLbCXr9piZRa5DupzudMt242g4MgT46d6qrOY8neMc2fLhWyHbapvK6p4eUBoL2e6KFB/U7QRCADfXM5hON4ekKtG9XrDbxpMzydpllmSjgdiN4KPJkN8Eyof0uyz4WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544769; c=relaxed/simple;
	bh=Nno3OlO3iewCiHcvZdyzepOILM5zdk/EDcFwj2tLg+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3mPd8s8Hq92iuTi3vMSRa/jDdG0OJPHNDOFBsWbTdGXJduYZ7sRxwEhPzj4aP+G4NhSVG0NNe2RUsJb7D5C63EMSVikn9oU1Ydte+Jqduu0Lxc1cPQkevXJpiYtd9JuxteUAmMoMGKj6eQw+GRsuELzI8ATDLUMpK75ScSN+3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T+JTGWyk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T+JTGWyk"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F8122EC;
	Wed, 16 Sep 2026 09:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789544653;
	bh=Nno3OlO3iewCiHcvZdyzepOILM5zdk/EDcFwj2tLg+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+JTGWykehchs3y3+yhf1UlxD+oxOt8ImsO89QYli5iW7KiUOvyMKsdfStJ7oikBh
	 OVSEfb/luQSOJG5Zg66itdJZEi2uD6eu0Odod/CDkOSDC4xlucYdx+SU5vEDQLq740
	 pXlYMHA5vJFroMT7vohxnZwnOaCWnVTxvzwbBJYw=
Date: Wed, 16 Sep 2026 10:45:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: media: i2c: Add
 vision-components,mipi-module-controller
Message-ID: <20260916074553.GB3871857@killaraus.ideasonboard.com>
References: <20260915-vc-mipi-ctrl-v1-0-8a42b693d889@linux.dev>
 <20260915-vc-mipi-ctrl-v1-2-8a42b693d889@linux.dev>
 <20260916-daft-relaxed-mouse-9bfaf4@quoll>
 <aqpC8fxO4F3bFjF4@bombadil>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aqpC8fxO4F3bFjF4@bombadil>

On Wed, Sep 16, 2026 at 09:33:36AM +0200, Richard Leitner wrote:
> On Wed, Sep 16, 2026 at 09:00:46AM +0200, Krzysztof Kozlowski wrote:
> > On Tue, Sep 15, 2026 at 10:20:24PM +0200, Richard Leitner wrote:
> > > Add bindings for the Vision Components MIPI Camera Module Controller.
> > > 
> > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > ---
> > >  .../vision-components,mipi-module-controller.yaml  | 92 ++++++++++++++++++++++
> > >  MAINTAINERS                                        |  7 ++
> > >  2 files changed, 99 insertions(+)
> > 
> > This fails tests, so a very brief review / a few comments:
> 
> Mea culpa, I simply failed to run the dtb check before submitting. Sorry.
> Will not happen again.
> 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.yaml b/Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.yaml
> > > new file mode 100644
> > > index 0000000000000..2a031aea68457
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.yaml
> > > @@ -0,0 +1,92 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/vision-components,mipi-module-controller.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Vision Components MIPI Camera Module Controller
> > > +
> > > +maintainers:
> > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > +  - Richard Leitner <richard.leitner@linux.dev>
> > > +
> > > +description: |-
> > > +  The MIPI camera module controller is an FPGA-based, I2C-accessible system
> > > +  controller found on MIPI camera modules from Vision Components. It abstracts
> > > +  the camera sensor behind a unified register interface, and controls and
> > > +  sequences the on-board power supplies and clocks.
> > > +
> > > +  The camera sensor abstraction is optional. The controller exposes a tunneled
> > > +  downstream I2C bus used by the attached image sensor. The controller node
> > > +  acts as the upstream device on the host bus, while child node below the
> > > +  controller represent the sensor device reachable through the tunnel.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: vision-components,mipi-module-controller
> > 
> > There is no model name, no version, nothing identifying it better?
> > Compatible must be specific to the device (see also writing bindings).
> 
> There is one FPGA implemenation for all Vision Components MIPI camera
> modules AFAICT. So I have no idea how it could be more specific, TBH...
> 
> Adding the FPGA hardware model/type is wrong IMHO as it depends on its
> configuration/firmware, not the hw.
> 
> There are different versions of the configuration/firmware. But I think
> this is also not the correct way to distinguish those, or is it?
> 
> According to their homepage the vendor calls those modules simply
> "VC MIPI" modules, which implies this FPGA controller is available on it.
> So maybe "vision-components,vc-mipi-controller" would be a better fit?
> 
> Do you have any ideas/feedback on how improve this name?
> 
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  '#clock-cells':
> > > +    const: 0
> > > +
> > > +  clock-frequency:
> > > +    description: Frequency of the sensor clock provided by the module
> > 
> > Drop, implied by the compatible
> 
> Do you mean dropping the whole property, or just the "description"?

Different modules have different clock frequencies, don't they ? The
property seems needed.

> > > +
> > > +  vcc-supply:
> > > +    description: Power supply of the module (3.3V)
> > > +
> > > +  '#address-cells':
> > > +    const: 1
> > > +
> > > +  '#size-cells':
> > > +    const: 0
> > 
> > No children allowed, so why these two?
> 
> Based on your and the bot feedback I would suggest for v2 to change this
> "generic i2c bus" to a simple "i2c-tunnel" property which has
> "$ref: /schemas/i2c/i2c-controller.yaml".
> 
> This would better reflect the actual hardware, as there is only this one,
> in firmware hard-coded I2C downstream bus.
> 
> Would this be a sane approach?
> 
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - '#clock-cells'
> > > +  - clock-frequency
> > > +  - vcc-supply
> > > +  - '#address-cells'
> > > +  - '#size-cells'
> > > +
> > > +unevaluatedProperties: false
> > 
> > additionalProperties instead, see writing bindings or writing schema.
> > Unless you miss here some other schema $ref.
> > 
> > > +
> > > +examples:
> > > +  - |
> > > +    i2c {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        vc_mipi_ctrl: controller@10 {
> > > +            compatible = "vision-components,mipi-module-controller";
> > > +            reg = <0x10>;
> > > +            #clock-cells = <0>;
> > > +            clock-frequency = <37125000>;
> > > +            vcc-supply = <&cam_3v3>;
> > > +
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            i2c@0 {
> > > +                #address-cells = <1>;
> > > +                #size-cells = <0>;
> > > +
> > > +                vc_mipi_sensor: camera@60 {
> > > +                    compatible = "ovti,ov9281";
> > > +                    reg = <0x60>;
> > 
> > Why having the child abstraction if it is completely abstracted? I don't
> > fully get the explanation from description. Completely optional means no
> > benefits, no point in it, no?
> 
> I will try to improve the description. The idea behind this device
> driver/devicetree node is to not rely on the sensor abstraction from
> vision components, but to use the upstream sensor specific driver.
> 
> As the tunneled downstream i2c bus needs quirks applied this is modeled
> as a separate bus.
> 
> Previous discussions on this approach are available at:
> 	https://lore.kernel.org/lkml/20260728092856.GB1494774@killaraus.ideasonboard.com/
> 
> Thanks again for your review Krzysztof!

-- 
Regards,

Laurent Pinchart
