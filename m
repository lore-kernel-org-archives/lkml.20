Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8C34B829B;
	Wed, 16 Sep 2026 16:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577582; cv=none; b=u8qN654SVv5obn0sedbYMmXnH4fQE5SXgmOyUCZ2fhQjL5L4wi/k348Hf4rLbImDIf4hjeWTQWMiD1TP8qQzheM58IvigdsXaPcJ3br3GT+xbXB0wlPHruMquB+MOJ2fASGYE7Ciwb+LLJ2fx9Qf80vaiUANVuPQZZi7rtrFSY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577582; c=relaxed/simple;
	bh=Gi84MVZX6m57+E60TGBvl2i0d3yUldp9T7lEULOp5tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufprqRgZzR/uPboOeFNxf28LvaBtaEJyoen0gPSrgrKPDP9zKaj1QCFMsRBC7uQksdSsJQP0Kw09voe7d+8i8yQzDCr+bgCOFvdU1XywgsaSIaX9OydDR/PaudfP6MLv/bhPnzpGFSg4HYzD9Ew53YqhxTC4EmxqEVtvHF46zIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DvvbhaD1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DvvbhaD1"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E665814C2;
	Wed, 16 Sep 2026 18:51:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789577464;
	bh=Gi84MVZX6m57+E60TGBvl2i0d3yUldp9T7lEULOp5tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DvvbhaD12ta4S78Ghd2VL3yE8ifNQmHuO1JCrwCWgjLVrkxmL7m/nVVJYiH5lb6KA
	 65TeEPKdLRexXicc6JvIfnf1VAErtzMIRAE/eZO6aT9dzBtYXJquJfJsRArE6wMfAZ
	 YNDxuogy047ojZP4SJtEf2zUSmm4YHn+36qUTOso=
Date: Wed, 16 Sep 2026 19:52:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Richard Leitner <richard.leitner@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: media: i2c: Add
 vision-components,mipi-module-controller
Message-ID: <20260916165244.GB191870@killaraus.ideasonboard.com>
References: <20260915-vc-mipi-ctrl-v1-0-8a42b693d889@linux.dev>
 <20260915-vc-mipi-ctrl-v1-2-8a42b693d889@linux.dev>
 <20260916-daft-relaxed-mouse-9bfaf4@quoll>
 <aqpC8fxO4F3bFjF4@bombadil>
 <45fd8255-6ba8-4488-acc8-4f7fc9c85ade@kernel.org>
 <aqpYqrtKTY20IW_0@bombadil>
 <a46e3ea2-8a21-4b9c-a112-99d249f46e99@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a46e3ea2-8a21-4b9c-a112-99d249f46e99@kernel.org>

On Wed, Sep 16, 2026 at 03:41:16PM +0200, Krzysztof Kozlowski wrote:
> On 16/09/2026 11:01, Richard Leitner wrote:
> > On Wed, Sep 16, 2026 at 10:35:22AM +0200, Krzysztof Kozlowski wrote:
> >> On 16/09/2026 09:33, Richard Leitner wrote:
> >>> Hi Krzysztof,
> >>>
> >>> thanks for the review!
> >>>
> >>> On Wed, Sep 16, 2026 at 09:00:46AM +0200, Krzysztof Kozlowski wrote:
> >>>> On Tue, Sep 15, 2026 at 10:20:24PM +0200, Richard Leitner wrote:
> >>>>> Add bindings for the Vision Components MIPI Camera Module Controller.
> >>>>>
> >>>>> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> >>>>> ---
> >>>>>  .../vision-components,mipi-module-controller.yaml  | 92 ++++++++++++++++++++++
> >>>>>  MAINTAINERS                                        |  7 ++
> >>>>>  2 files changed, 99 insertions(+)
> >>>>
> >>>> This fails tests, so a very brief review / a few comments:
> >>>
> >>> Mea culpa, I simply failed to run the dtb check before submitting. Sorry.
> >>> Will not happen again.
> >>>
> >>>>
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.yaml b/Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.yaml
> >>>>> new file mode 100644
> >>>>> index 0000000000000..2a031aea68457
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.yaml
> >>>>> @@ -0,0 +1,92 @@
> >>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>>>> +%YAML 1.2
> >>>>> +---
> >>>>> +$id: http://devicetree.org/schemas/media/i2c/vision-components,mipi-module-controller.yaml#
> >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>> +
> >>>>> +title: Vision Components MIPI Camera Module Controller
> >>>>> +
> >>>>> +maintainers:
> >>>>> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>>> +  - Richard Leitner <richard.leitner@linux.dev>
> >>>>> +
> >>>>> +description: |-
> >>>>> +  The MIPI camera module controller is an FPGA-based, I2C-accessible system
> >>>>> +  controller found on MIPI camera modules from Vision Components. It abstracts
> >>>>> +  the camera sensor behind a unified register interface, and controls and
> >>>>> +  sequences the on-board power supplies and clocks.
> >>>>> +
> >>>>> +  The camera sensor abstraction is optional. The controller exposes a tunneled
> >>>>> +  downstream I2C bus used by the attached image sensor. The controller node
> >>>>> +  acts as the upstream device on the host bus, while child node below the
> >>>>> +  controller represent the sensor device reachable through the tunnel.
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    const: vision-components,mipi-module-controller
> >>>>
> >>>> There is no model name, no version, nothing identifying it better?
> >>>> Compatible must be specific to the device (see also writing bindings).
> >>>
> >>> There is one FPGA implemenation for all Vision Components MIPI camera
> >>> modules AFAICT. So I have no idea how it could be more specific, TBH...
> >>>
> >>> Adding the FPGA hardware model/type is wrong IMHO as it depends on its
> >>> configuration/firmware, not the hw.
> >>>
> >>> There are different versions of the configuration/firmware. But I think
> >>> this is also not the correct way to distinguish those, or is it?
> >>>
> >>> According to their homepage the vendor calls those modules simply
> >>> "VC MIPI" modules, which implies this FPGA controller is available on it.
> >>> So maybe "vision-components,vc-mipi-controller" would be a better fit?
> >>>
> >>> Do you have any ideas/feedback on how improve this name?
> >>
> >> So there are different modules? I see several different names on:
> >> https://www.mipi-modules.com/en/mipi-camera-modules/
> > 
> > Yes, there are different modules, but all feature the same controller.
> > Which this is basically the device driver binding for. So the idea is to
> > describe the controller independently from the sensor which is "behind"
> > it.
> > 
> > This works because the controller "soft-core" should be the same on all
> > modules. A downstream implemenation (which I haven't studied in detail)
> > is available at https://github.com/VC-MIPI-modules/vc_mipi_core if that
> > helps?
> > 
> >>>>> +
> >>>>> +  reg:
> >>>>> +    maxItems: 1
> >>>>> +
> >>>>> +  '#clock-cells':
> >>>>> +    const: 0
> >>>>> +
> >>>>> +  clock-frequency:
> >>>>> +    description: Frequency of the sensor clock provided by the module
> >>>>
> >>>> Drop, implied by the compatible
> >>>>
> >>>
> >>> Do you mean dropping the whole property, or just the "description"?
> >>
> >> I meant entire property, but we keep discussing in Laurent's reply.
> >>
> >>>>> +
> >>>>> +  vcc-supply:
> >>>>> +    description: Power supply of the module (3.3V)
> >>>>> +
> >>>>> +  '#address-cells':
> >>>>> +    const: 1
> >>>>> +
> >>>>> +  '#size-cells':
> >>>>> +    const: 0
> >>>>
> >>>> No children allowed, so why these two?
> >>>
> >>> Based on your and the bot feedback I would suggest for v2 to change this
> >>> "generic i2c bus" to a simple "i2c-tunnel" property which has
> >>> "$ref: /schemas/i2c/i2c-controller.yaml".
> >>>
> >>> This would better reflect the actual hardware, as there is only this one,
> >>> in firmware hard-coded I2C downstream bus.
> >>>
> >>> Would this be a sane approach?
> >>
> >> If the underlying I2C bus and sensor are important, then yes. But I have
> >> doubts that you need to describe the sensor if it is truly
> >> unadressable/invisible to the OS.

To be clear, the sensor *is* addressable from the OS. The FPGA sits in
the middle on the I2C bus instead of being a separate I2C device on the
same bus as the sensor, but it forwards all I2C writes addressed to the
sensor onto the backend I2C bus. This is why the DT binding is modelled
with a child I2C bus. The sensor DT node is located on that node, and
uses the regular DT bindings for the sensor.

> > Yes, the I2C bus and sensor is important. The device driver of the sensor
> > talks (via the tunneled I2C interface) directly to the sensor.
> > 
> > The separate I2C controller/bus description is necessary as the tunneled
> > I2C bus has some quirks unfortunately. Those need to be addressed as 
> > otherwise the sensor drivers do not work.
> > 
> > So the idea is to not have a vc-mipi module binding per "sensor variant"
> > of the camera modules, but provide a common controller driver which
> > provides the I2C bus for the sensor driver.
> 
> Bindings must accurately describe the device and so far - based on the
> website - there is no device as mipi-module-controller alone.
> 
> I don't get why you assume that all of the variants are exactly
> identical, thus sensor variant is not applicable.
> 
> If they are identical in all aspects, then why clock-frequency property?
> That's obviously rhetorical question, because they are not identical in
> all aspects and must produce different clock at least.

The FPGA has an input clock whose frequency depends on the module. It
uses it for internal purpose, and also to provide a clock to the sensor.
Very roughly speaking, and ignoring power supplies as we focus on the
clocks, the camera module is architectured this way:

Connector
   ||                                       +--------+
   || <------------ MIPI CSI-2 ------------ |        |
   ||               +-------+               |        |
   || <--- I2C ---> |       | <--- I2C ---> | Sensor |
   ||               | FPGA  |               |        |
   ||               |       | --- Clock --> |        |
   ||               +-------+               +--------+
                        ^
                        |
                    +-------+
                    | Clock |
                    | Osc.  |
                    +-------+

The frequency of the external clock oscillator is what the
clock-frequency models.

> >>>>> +
> >>>>> +required:
> >>>>> +  - compatible
> >>>>> +  - reg
> >>>>> +  - '#clock-cells'
> >>>>> +  - clock-frequency
> >>>>> +  - vcc-supply
> >>>>> +  - '#address-cells'
> >>>>> +  - '#size-cells'
> >>>>> +
> >>>>> +unevaluatedProperties: false
> >>>>
> >>>> additionalProperties instead, see writing bindings or writing schema.
> >>>> Unless you miss here some other schema $ref.
> >>>>
> >>>>> +
> >>>>> +examples:
> >>>>> +  - |
> >>>>> +    i2c {
> >>>>> +        #address-cells = <1>;
> >>>>> +        #size-cells = <0>;
> >>>>> +
> >>>>> +        vc_mipi_ctrl: controller@10 {
> >>>>> +            compatible = "vision-components,mipi-module-controller";
> >>>>> +            reg = <0x10>;
> >>>>> +            #clock-cells = <0>;
> >>>>> +            clock-frequency = <37125000>;
> >>>>> +            vcc-supply = <&cam_3v3>;
> >>>>> +
> >>>>> +            #address-cells = <1>;
> >>>>> +            #size-cells = <0>;
> >>>>> +
> >>>>> +            i2c@0 {
> >>>>> +                #address-cells = <1>;
> >>>>> +                #size-cells = <0>;
> >>>>> +
> >>>>> +                vc_mipi_sensor: camera@60 {
> >>>>> +                    compatible = "ovti,ov9281";
> >>>>> +                    reg = <0x60>;
> >>>>
> >>>> Why having the child abstraction if it is completely abstracted? I don't
> >>>> fully get the explanation from description. Completely optional means no
> >>>> benefits, no point in it, no?
> >>>
> >>> I will try to improve the description. The idea behind this device
> >>> driver/devicetree node is to not rely on the sensor abstraction from
> >>> vision components, but to use the upstream sensor specific driver.
> >>
> >> You can use driver even without these nodes... but fine, let's assume
> >> you have them, so driver will talk with OV9281 sensor for example?
> > 
> > The vc-mipi driver does not talk to sensor at all. This is done by the
> > dedicated sensor driver. The vc-mipi driver is only controlling the
> > regulator, clock, etc. as described and sets up the "quirk aware"
> > tunneled i2c interface.
> 
> I meant, driver for the sensor. So who controls sensor supplies? Not the
> sensor driver? It tells something how the hardware is managed, no?

Power supplies are managed in a similar way as the clock in the above
diagram. There's one input supply to the camera module on the connector.
Individual supplies for the sensor are generated from that main supply,
and are controlled by the FPGA which exposes a register over I2C to
enable/disable the supplies from the host (there's a single bit to
enable/disable them all, they can't be controlled individually).

-- 
Regards,

Laurent Pinchart
