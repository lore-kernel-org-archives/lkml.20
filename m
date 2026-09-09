Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D3A380FF8;
	Wed,  9 Sep 2026 09:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947795; cv=none; b=Gg0BQWU/LAPI+Qo6Evezwf8HeQCPQKhdg9K7oxRjAEFZGQRCODQSZUJjazA3POz0GNN2Pw8ZlwFNkMamAJkUusJ7JgoZ2hCL6l0sA9oBHhZcY65sqoUO73M/grhhV/8gNUiKjKbPKu4bdixFTK0uH742hasidlb9p9rMqdi9JbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947795; c=relaxed/simple;
	bh=q+2CzjmdlxkgedUdRnCmW10aP6x7ZEPy60jhejBPhtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckyqabgyg8qKGSjkdk9c0bKK+vCnvKji7HR+CncnYVmGzdRKpn9DOvzmcL4KYot2uab9PBVuMgoAXO3miPsWNBycSIB1giAz3+9dhavPSIdVLZSaKw2zs1FiGnAKkPRjKQbzxCzES9zK2eQ0tCJaNfFToLua2/Z3FH3vu7Eal/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IG+iF8NG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IG+iF8NG"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E9724B0;
	Wed,  9 Sep 2026 11:54:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788947694;
	bh=q+2CzjmdlxkgedUdRnCmW10aP6x7ZEPy60jhejBPhtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IG+iF8NGh6xaR57ik48qKoAuKp3zz6+BLueT0R4xuVXF46morqpkxSTqke0fyAnrn
	 TBkLg5pXJAmvqLM6NKlTABKJuDjyY2e3jbnX9Ee1M6HrSFLxtOoeDRy932Mrjuz/V3
	 P35o09YUiOBUNgWFLHm8GjljFQcPN9E6EWTzzLs4=
Date: Wed, 9 Sep 2026 11:56:27 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Philippe Baetens <philippebaetens@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add Mira016 image sensor
Message-ID: <aqEsceb73f5ysKmK@zed>
References: <20260908-mira016-v4-0-1950504c131c@ideasonboard.com>
 <20260908-mira016-v4-1-1950504c131c@ideasonboard.com>
 <ap_EWstoCsLOkZ6x@kekkonen.localdomain>
 <ap_0yL-JatdVDaXG@zed>
 <ap_2Jhqc3vlmkmci@kekkonen.localdomain>
 <aqEJk6dKWuyMLLRt@zed>
 <aqEUTAAhwI09JOuR@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aqEUTAAhwI09JOuR@kekkonen.localdomain>

Hi Sakari

On Wed, Sep 09, 2026 at 11:09:48AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Wed, Sep 09, 2026 at 09:35:52AM +0200, Jacopo Mondi wrote:
> > Sakari,
> >
> > On Tue, Sep 08, 2026 at 02:48:54PM +0300, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Tue, Sep 08, 2026 at 01:46:11PM +0200, Jacopo Mondi wrote:
> > > > Hi Sakari
> > > >
> > > > On Tue, Sep 08, 2026 at 11:16:26AM +0300, Sakari Ailus wrote:
> > > > > Hi Jacopo,
> > > > >
> > > > > On Tue, Sep 08, 2026 at 09:57:23AM +0200, Jacopo Mondi wrote:
> > > > > > Add bindings for the ams OSRAM Mira016 image sensor.
> > > > > >
> > > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/media/i2c/ams,mira016.yaml | 97 ++++++++++++++++++++++
> > > > > >  MAINTAINERS                                        |  7 ++
> > > > > >  2 files changed, 104 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..49a606fca6cb
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > > > > > @@ -0,0 +1,97 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/media/i2c/ams,mira016.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: AMS 0.16 MP NIR enhanced global shutter image sensor
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > > +  - Philippe Baetens <philippebaetens@gmail.com>
> > > > > > +
> > > > > > +description:
> > > > > > +  Mira016 is a 0.16 MP NIR enhanced global shutter image sensor designed for 2D
> > > > > > +  and 3D consumer and industrial machine vision applications. The sensor is
> > > > > > +  compliant to the MIPI CSI-2 v1.3 protocol interface and the D-PHY v1.2
> > > > > > +  physical layer specifications to transmit the image data to the host
> > > > > > +  processor. It uses one data lane and one clock lane operating up to 1.5 Gbps.
> > > > > > +
> > > > > > +allOf:
> > > > > > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    const: ams,mira016
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  clocks:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  vdd28-supply:
> > > > > > +    description:
> > > > > > +      I/O voltage supply, 2.8 volts
> > > > > > +
> > > > > > +  vdd11-supply:
> > > > > > +    description:
> > > > > > +      I/O voltage supply, 1.1 volts
> > > > > > +
> > > > > > +  reset-gpios:
> > > > > > +    description: Sensor reset (RST_N) GPIO
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  port:
> > > > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > +    additionalProperties: false
> > > > > > +    description:
> > > > > > +      Video output port
> > > > > > +
> > > > > > +    properties:
> > > > > > +      endpoint:
> > > > > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > > > > +        unevaluatedProperties: false
> > > > > > +
> > > > > > +        properties:
> > > > > > +          data-lanes:
> > > > > > +            items:
> > > > > > +              - const: 1
> > > > >
> > > > > The device obviously supports non-continuous clock mode (and that's what
> > > > > the driver also only does right now) but as the continous clock mode is
> > > > > required by CSI-2, I presume the device can do both.
> > > > >
> > > > > So I think you should have
> > > > >
> > > > >              clock-noncontinuous: true
> > > > >
> > > > > here.
> > > > >
> > > >
> > > > Maybe I'm confused (again, after 10 or so years of doing this) by the
> > > > usage of unevaluatedProperties/additionalProperties, but if I read
> > > > Documentation/devicetree/bindings/writing-schema.rst right
> > > >
> > > >   * unevaluatedProperties: false
> > > >       Used when this binding references other schema whose all properties
> > > >       should be allowed.
> > > >
> > > > Means all properties from video-interfaces.yaml are accepted (which is
> > > > imho very wrong, but it's a battle with dt maintainers I don't want to
> > > > start again).
> > >
> > > I guess you should have
> > >
> > > 		additionalProperties: false
> > >
> > > too?
> > >
> >
> > Where exactly do you mean ?
> >
> > I don't think I can have additionalProperties: and
> > unevaluatedProperties: in the same node, do I ?
>
> Yes, these are mutually exclusive.
>
> >
> > It's been a long time ago when we discussed with dt-maintainers what
> > the policy should have been for endpoints that reference
> > video-interfaces.yaml.
> >
> > To me, the most sensible thing was to use "additionalProperties: false"
> > and explicitly allow the supported properties, instead of allowing all
> > of them. However dt maintainers had a different opinion (for reasons I
> > honestly can't remember) and I think we have stabilized on the
> > following pattern
> >
> >         port:
> >           $ref: /schemas/graph.yaml#/$defs/port-base
> >           additionalProperties: false
> >
> >           properties:
> >             endpoint:
> >               $ref: /schemas/media/video-interfaces.yaml#
> >               unevaluatedProperties: false
> >
> >               properties:
> >                 ...
> >
> > All the most recently merged bindings in media/i2c have this pattern
> >
> > 42f83a32259a ("dt-bindings: media: i2c: Add Sony IMX678")
> > 097d2be74ad0 ("dt-bindings: media: i2c: document Omnivision OV08D10 CMOS image sensor")
> > 631dd79305ab ("dt-bindings: media: i2c: Add ov2732 image sensor")
> >
> > I feel like I'm missing something obvious, otherwise I don't see why
> > this binding should be different ?
>
> Good question. Perhaps there was no specific thought given on
> non-contiguous clock support? I guess most of the above should probably
> specify it, even if the driver doesn't support it.

Maybe I'm still missing something, but using
'unevaluatedProperties: false' and referencing video-interfaces.yaml
means you can include all properties from there (which, again, I think
it's wrong, but allows you to specify continous/non-continuous clock
support).

>
> There's a good example of doing this in
> Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml, you're listed
> as the maintainer there. :-)

eheh, that binding has 'additionalProperties: false' which means you
have to list properties you accept.

This would be my preferred approach, but if my recollection is
correct, we stabilized on using 'unevaluatedProperties: false' after
discussing it with dt maintainers.

Does anyone have a different recollection ?

>
> --
> Regards,
>
> Sakari Ailus
