Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A528411FB3;
	Thu, 17 Sep 2026 08:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634834; cv=none; b=QD+e5vFqxH72PU7yo4DwchnD1tGOxWV11M+gDR9eHe/eXbdVfXJBcOm9vQm7eY3yi7osZyud47S0+nLOaqxAJtUvS4ZK+NZkW8YW3/K+QEi5+waJ4u2Ai3j/376ZFCMpL73ycr0GqOYA/j1Be6iEV2h9sc7siw0cH0VG7TEI8Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634834; c=relaxed/simple;
	bh=MC3mZ+Mz02SQ91Uf+64VxPZX4zJLx0t9xw4Cs5tH8Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqsk+3I2WBa1Km4NCtR3PlG5PjuvVNzT4+IxSJp8yff8GNsEKfEcNbYFWK5RLkh6hekzG57TERR8pZAxMExWyYBUW7pr9rp/01TyIgPGRNsk04mjNuUABt8+RtMgpbE8Gmy27YFfBMt8+PTH59jd3MVPKH7gLBmtcrCm4DFTaLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qAV2m4yC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qAV2m4yC"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C09382C6;
	Thu, 17 Sep 2026 10:45:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789634716;
	bh=MC3mZ+Mz02SQ91Uf+64VxPZX4zJLx0t9xw4Cs5tH8Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qAV2m4yCgDHF6VuBtjhtVp0E7JnLXVTInFuC9wY0l5DMngoasVfkpU7J3XqB764ly
	 0WE1gT3W8BD8JTWj2w/yYjJoIrnq+FKUz0bdEf0HBj2TwpDczxO5H6I1Fky7OTUd0S
	 1JkxOQXCVQj3HRgxsRNtJrVB8qd6nSOP4+mHBh3Q=
Date: Thu, 17 Sep 2026 11:46:56 +0300
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
Message-ID: <20260917084656.GA24505@killaraus.ideasonboard.com>
References: <20260915-vc-mipi-ctrl-v1-0-8a42b693d889@linux.dev>
 <20260915-vc-mipi-ctrl-v1-2-8a42b693d889@linux.dev>
 <20260916-daft-relaxed-mouse-9bfaf4@quoll>
 <aqpC8fxO4F3bFjF4@bombadil>
 <45fd8255-6ba8-4488-acc8-4f7fc9c85ade@kernel.org>
 <aqpYqrtKTY20IW_0@bombadil>
 <a46e3ea2-8a21-4b9c-a112-99d249f46e99@kernel.org>
 <aqqtG31q_nNxzme1@bombadil>
 <accdb907-67ee-45ee-b06a-173e49a3ca00@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <accdb907-67ee-45ee-b06a-173e49a3ca00@kernel.org>

On Thu, Sep 17, 2026 at 08:30:05AM +0200, Krzysztof Kozlowski wrote:
> On 16/09/2026 16:57, Richard Leitner wrote:
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
> >>>
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
> > From that point of view, of course all variants are different.
> > But the interface towards the host is (according to vision components)
> > stable. This is why I aimed for a separate device.
> 
> What makes you think that interface is stable and the same? Is the
> stable aspect or its versioning documented anywhere in the docs?
> 
> I can easily imagine that FPGA synthesis actually differs on some
> sensors or they ship a new, updated version, thus at some point the
> interface might change or already changed between models.

Alright, let's deep that in the real life aspect of this.

There is no stability guarantee in the sense of a strict, publicly
documented commitment. What we have, instead, is direct and honest
discussions with the vendor, and a decade of real-life experience with
those modules. the result is both better and worse than I'd like. The
good part is that the interface is stable with no plan from the vendor
to change it, and we haven't noticed observable difference in behaviour
between modules for different sensors.

The bad news, on the other hand, is that bugs happen. Newly manufactured
versions of the same module sometimes ship with updated FPGA bitstreams
that fix bugs. Previous module can't be fixed as the FPGA bitstream is
not field-upgradable. Those updates don't affect the interface in the
sense that the registers exposed by the FPGA stay the same, but they
require different software workarounds. A sensor-specific compatible
string wouldn't help here.

So far (again over the course of about a decade) the only two bugs I've
observed are related to I2C access. One of the bugs require access to
sensor registers to be broken into single-byte read/write operations
(this is the job of the controller's driver that register an I2C
"tunnel" adapter). The other bug causes the FPGA to shift data by one
byte when the host reads the controller's EEPROM data. The driver posted
by Richard works around the bugs unconditionally. It could be nice to
disable the workaround that split register access into bytes as that can
improve performance, and the plan would be to add a DT property to
indicate if the module is affected as that can't be inferred from the
compatible string (it depends on the revision of the FPGA bitstream as
explained above), nor can it be queried at runtime from the controller
(AFAIK).

> > So what's your suggestion on how to best solve this?
> > Provide a per sensor compatible like e.g. "vc-mipi-ov9281"?
> > 
> > Nonehteless this device must then provide a i2c sub node to place the
> > actual imaging sensor on.
> > 
> > If that's fine with you I'm personally fine with this approach too.
> 
> If you have certainty, like documented spec somewhere telling this, that
> programming interface of FPGA to the OS is the same, then go with a
> generic fallback compatible like you have and add front compatibles
> specific to the sensor.
> 
> If you do not have certainty, then I would go only with sensor-specific
> compatibles for both front and fallbacks, so:
> 
> vc-mipi-ov9281, vc-mipi-imx297
> 
> It does feel a bit odd, but that is usual way to handle any future
> differences when two vc-mipi modules turn out not to be compatible.

I'm not completely opposed to that, but my experience is that it will
create additional complexity (to update the DT binding when a module for
a new sensor is released) without much gain as bugs are not specific to
a module type.

-- 
Regards,

Laurent Pinchart
