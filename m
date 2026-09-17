Received: from mta0.migadu.com (out-59.mta0.migadu.com [91.218.175.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51803D091A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631765; cv=none; b=iIzUggrvTB+E+lj08E3C9oRvZvdS1TvBS5ccBPLL09GwB12WqSYPa3maXNKM7V+b3LBDvS6Gnf+4fIzTXUMuqApHJV1W/0pkW3fPhoPI2GRcFKLZbEgeb88aKcv0fU6YQk+mJXWQzYRs1jVJlVBz1dbzTOvSCU6YZ9TvxQcGwaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631765; c=relaxed/simple;
	bh=HamL13sGqDhUbkcsggfWZn4XtwRtR+Nb7WNAVRS3KWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFTrnHkdoTem7ieJeURO8oCM9oq+cyx/TOYJlouFp6x5rm4TbGZfoK6i8ADijhzVOknwfr1bAP437VRhzsoi8egFDRcSLvvmEiGXG3HNGJCvPjFr0SxrMNSz/QzH5mSOqChMGqrwBH3kcUQMUnom0eVhGQAejy0B7xF3Pn3W7zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uwKywFw3; arc=none smtp.client-ip=91.218.175.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uwKywFw3"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HamL13sGqDhUbkcsggfWZn4XtwRtR+Nb7WNAVRS3KWc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789631760; v=1; x=1790236560;
 b=uwKywFw3PzGwK+BKHwgZmJzb48/BwrzaW876/sQgqbDaogSWabFol/7ihe2rCABAUO7ZTkqo
 ukFeOQGxNyvrBkEg9iRMeStOwBmZnVdyvpk3BfgVohQSCp+gCr8oO8f+P7fRfP9A+FogK8/dd+t
 6FLCBAp4T5KAe4lPeGjF9qm8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f50246a7211157f5;
	Thu, 17 Sep 2026 07:55:50 +0000
X-Mizu-Trace-ID: f50246a7211157f5
X-Migadu-Flow: FLOW_OUT
Date: Thu, 17 Sep 2026 09:55:45 +0200
From: Richard Leitner <richard.leitner@linux.dev>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: media: i2c: Add
 vision-components,mipi-module-controller
Message-ID: <aquan_6JiKkEw-Kp@bombadil>
References: <20260915-vc-mipi-ctrl-v1-0-8a42b693d889@linux.dev>
 <20260915-vc-mipi-ctrl-v1-2-8a42b693d889@linux.dev>
 <20260916-daft-relaxed-mouse-9bfaf4@quoll>
 <aqpC8fxO4F3bFjF4@bombadil>
 <45fd8255-6ba8-4488-acc8-4f7fc9c85ade@kernel.org>
 <aqpYqrtKTY20IW_0@bombadil>
 <a46e3ea2-8a21-4b9c-a112-99d249f46e99@kernel.org>
 <20260916165244.GB191870@killaraus.ideasonboard.com>
 <f20daf57-88cf-44e1-a2af-8769d3500176@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f20daf57-88cf-44e1-a2af-8769d3500176@kernel.org>

On Thu, Sep 17, 2026 at 08:18:23AM +0200, Krzysztof Kozlowski wrote:
> On 16/09/2026 18:52, Laurent Pinchart wrote:
> > On Wed, Sep 16, 2026 at 03:41:16PM +0200, Krzysztof Kozlowski wrote:
> >> On 16/09/2026 11:01, Richard Leitner wrote:
> >>> On Wed, Sep 16, 2026 at 10:35:22AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 16/09/2026 09:33, Richard Leitner wrote:
> >>>>> On Wed, Sep 16, 2026 at 09:00:46AM +0200, Krzysztof Kozlowski wrote:
> >>>>>> On Tue, Sep 15, 2026 at 10:20:24PM +0200, Richard Leitner wrote:

[...]

> >>>>>>> Add bindings for the Vision Components MIPI Camera Module Controller.
> >>>>>>> +
> >>>>>>> +  vcc-supply:
> >>>>>>> +    description: Power supply of the module (3.3V)
> >>>>>>> +
> >>>>>>> +  '#address-cells':
> >>>>>>> +    const: 1
> >>>>>>> +
> >>>>>>> +  '#size-cells':
> >>>>>>> +    const: 0
> >>>>>>
> >>>>>> No children allowed, so why these two?
> >>>>>
> >>>>> Based on your and the bot feedback I would suggest for v2 to change this
> >>>>> "generic i2c bus" to a simple "i2c-tunnel" property which has
> >>>>> "$ref: /schemas/i2c/i2c-controller.yaml".
> >>>>>
> >>>>> This would better reflect the actual hardware, as there is only this one,
> >>>>> in firmware hard-coded I2C downstream bus.
> >>>>>
> >>>>> Would this be a sane approach?
> >>>>
> >>>> If the underlying I2C bus and sensor are important, then yes. But I have
> >>>> doubts that you need to describe the sensor if it is truly
> >>>> unadressable/invisible to the OS.
> > 
> > To be clear, the sensor *is* addressable from the OS. The FPGA sits in
> > the middle on the I2C bus instead of being a separate I2C device on the
> > same bus as the sensor, but it forwards all I2C writes addressed to the
> > sensor onto the backend I2C bus. This is why the DT binding is modelled
> > with a child I2C bus. The sensor DT node is located on that node, and
> > uses the regular DT bindings for the sensor.
> 
> Thanks, this should be explained in the description of the binding. It
> does mention "the sensor device reachable through the tunnel" but the
> rest about optionality of the sensor feels confusing in this case.

Thanks Laurent for the additional clarification!

I will adapt the description accordingly for v2.

> 
> > 
> >>> Yes, the I2C bus and sensor is important. The device driver of the sensor
> >>> talks (via the tunneled I2C interface) directly to the sensor.
> >>>
> >>> The separate I2C controller/bus description is necessary as the tunneled
> >>> I2C bus has some quirks unfortunately. Those need to be addressed as 
> >>> otherwise the sensor drivers do not work.
> >>>
> >>> So the idea is to not have a vc-mipi module binding per "sensor variant"
> >>> of the camera modules, but provide a common controller driver which
> >>> provides the I2C bus for the sensor driver.
> >>
> >> Bindings must accurately describe the device and so far - based on the
> >> website - there is no device as mipi-module-controller alone.
> >>
> >> I don't get why you assume that all of the variants are exactly
> >> identical, thus sensor variant is not applicable.
> >>
> >> If they are identical in all aspects, then why clock-frequency property?
> >> That's obviously rhetorical question, because they are not identical in
> >> all aspects and must produce different clock at least.
> > 
> > The FPGA has an input clock whose frequency depends on the module. It
> 
> There is no "clocks" property in the binding. If there is input, then
> there is a "clocks".
> 
> Then we never describe external oscillators with "clock-frequency"
> property. ACPI does, but not DT.

So how would that be best solved in DT?

Should there be a "fixed-clock" child node for that external oscillator?
Something like:

vc_mipi_ctrl: controller@10 {
  ...

  vc_mipi_clk: clock {
    compatible = "fixed-clock";
    #clock-cells = <0>;
    clock-frequency = <37125000>;
  };

  i2c-tunnel {
    ...

    vc_mipi_sensor: camera@60 {
      ...

      clocks = <&vc_mipi_clk>;
      clock-names = "inck";
    };
};

Or should (as discussed in the other branch of this thread) there be a
separate compatible for every vc-mipi sensor variant board? Then this
could also be part of the compatible-dependent driver data.

Or are there any other/better approaches to this?

> 
> 
> > uses it for internal purpose, and also to provide a clock to the sensor.
> > Very roughly speaking, and ignoring power supplies as we focus on the
> > clocks, the camera module is architectured this way:
> > 
> > Connector
> >    ||                                       +--------+
> >    || <------------ MIPI CSI-2 ------------ |        |
> >    ||               +-------+               |        |
> >    || <--- I2C ---> |       | <--- I2C ---> | Sensor |
> >    ||               | FPGA  |               |        |
> >    ||               |       | --- Clock --> |        |
> >    ||               +-------+               +--------+
> >                         ^
> >                         |
> >                     +-------+
> >                     | Clock |
> >                     | Osc.  |
> >                     +-------+
> > 
> > The frequency of the external clock oscillator is what the
> > clock-frequency models.
> > 
> >>>>>>> +
> >>>>>>> +required:
> >>>>>>> +  - compatible
> >>>>>>> +  - reg
> >>>>>>> +  - '#clock-cells'
> >>>>>>> +  - clock-frequency
> >>>>>>> +  - vcc-supply
> >>>>>>> +  - '#address-cells'
> >>>>>>> +  - '#size-cells'
> >>>>>>> +
> >>>>>>> +unevaluatedProperties: false
> >>>>>>
> >>>>>> additionalProperties instead, see writing bindings or writing schema.
> >>>>>> Unless you miss here some other schema $ref.
> >>>>>>
> >>>>>>> +
> >>>>>>> +examples:
> >>>>>>> +  - |
> >>>>>>> +    i2c {
> >>>>>>> +        #address-cells = <1>;
> >>>>>>> +        #size-cells = <0>;
> >>>>>>> +
> >>>>>>> +        vc_mipi_ctrl: controller@10 {
> >>>>>>> +            compatible = "vision-components,mipi-module-controller";
> >>>>>>> +            reg = <0x10>;
> >>>>>>> +            #clock-cells = <0>;
> >>>>>>> +            clock-frequency = <37125000>;
> >>>>>>> +            vcc-supply = <&cam_3v3>;
> >>>>>>> +
> >>>>>>> +            #address-cells = <1>;
> >>>>>>> +            #size-cells = <0>;
> >>>>>>> +
> >>>>>>> +            i2c@0 {
> >>>>>>> +                #address-cells = <1>;
> >>>>>>> +                #size-cells = <0>;
> >>>>>>> +
> >>>>>>> +                vc_mipi_sensor: camera@60 {
> >>>>>>> +                    compatible = "ovti,ov9281";
> >>>>>>> +                    reg = <0x60>;
> >>>>>>
> >>>>>> Why having the child abstraction if it is completely abstracted? I don't
> >>>>>> fully get the explanation from description. Completely optional means no
> >>>>>> benefits, no point in it, no?
> >>>>>
> >>>>> I will try to improve the description. The idea behind this device
> >>>>> driver/devicetree node is to not rely on the sensor abstraction from
> >>>>> vision components, but to use the upstream sensor specific driver.
> >>>>
> >>>> You can use driver even without these nodes... but fine, let's assume
> >>>> you have them, so driver will talk with OV9281 sensor for example?
> >>>
> >>> The vc-mipi driver does not talk to sensor at all. This is done by the
> >>> dedicated sensor driver. The vc-mipi driver is only controlling the
> >>> regulator, clock, etc. as described and sets up the "quirk aware"
> >>> tunneled i2c interface.
> >>
> >> I meant, driver for the sensor. So who controls sensor supplies? Not the
> >> sensor driver? It tells something how the hardware is managed, no?
> > 
> > Power supplies are managed in a similar way as the clock in the above
> > diagram. There's one input supply to the camera module on the connector.
> > Individual supplies for the sensor are generated from that main supply,
> > and are controlled by the FPGA which exposes a register over I2C to
> > enable/disable the supplies from the host (there's a single bit to
> > enable/disable them all, they can't be controlled individually).
> > 
> 
> Thanks, I see this also shown in the example DTS. I think the sensor
> node is redundant here, but removing it would require moving all of this
> to swnodes, so not that much better either. It's fine to keep the sensor
> subnode for me.

ACK.

Thanks Krzysztof!

regards;rl

> 
> Best regards,
> Krzysztof
