Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8516253162C;
	Wed, 23 Sep 2026 13:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169873; cv=none; b=Q3RvU62LDmmSoYK8GBOESTw5q1AZ9trY7VSPhzvCezWAqFaHRrUQOBarReQ7T1t6ZyH5Zz7QIoqxOO+MsGZ+oaeQMCpM6pk6xcATJGczwfK75sRHrZML9QbBQdWKk0wPxr7gDxK4CYF8Ab3xEEvjyRV/PJXw3FInmgUluYHmtSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169873; c=relaxed/simple;
	bh=URbHuBN1x3lnU7r2lPBY+8SE2ajxprvZwtLU8pUXMyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNcGWL0JffXiKH6VN9SVM+XZN0QkSZTEIAXTWNaq+G5sNjbyixT82MJL6QypHV007V0X5RGEN1/31LXwKNcQkU0ayKktg69U2hD9y9EZHiUq93vsTC/EdXuHowyNYGJzQlxnuqZN8DDQlwWBUCgLRcDvuOmaD1CDGbJLERnJViQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uyNliMsS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uyNliMsS"
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDA3F1F8;
	Wed, 23 Sep 2026 15:22:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790169751;
	bh=URbHuBN1x3lnU7r2lPBY+8SE2ajxprvZwtLU8pUXMyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uyNliMsSV32J0xy+hrtym18PbYPfxjp8OJV2rDH0mUlYaCETmkBVUhgVczCiRlu04
	 MpSmmyI8ZmW3ww2bNV+lm4p7NRwAMvrKMKmhOizKAFRK7cVpuCBh2zzRp0P4lqsRAk
	 N5Uzp3krtWAa6eu++gY9cPXk680wqLHrs2b/BswA=
Date: Wed, 23 Sep 2026 15:24:14 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Philippe Baetens <philippebaetens@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add Mira016 image sensor
Message-ID: <arPNMr1NV2vWjHMP@zed>
References: <20260908-mira016-v4-0-1950504c131c@ideasonboard.com>
 <20260908-mira016-v4-1-1950504c131c@ideasonboard.com>
 <ap_EWstoCsLOkZ6x@kekkonen.localdomain>
 <ap_0yL-JatdVDaXG@zed>
 <ap_2Jhqc3vlmkmci@kekkonen.localdomain>
 <aqEJk6dKWuyMLLRt@zed>
 <aqEUTAAhwI09JOuR@kekkonen.localdomain>
 <aqEsceb73f5ysKmK@zed>
 <aqU6MPoOvhAEHOeI@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aqU6MPoOvhAEHOeI@kekkonen.localdomain>

Hi Sakari

On Sat, Sep 12, 2026 at 02:40:32PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Wed, Sep 09, 2026 at 11:56:27AM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Wed, Sep 09, 2026 at 11:09:48AM +0300, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Wed, Sep 09, 2026 at 09:35:52AM +0200, Jacopo Mondi wrote:
> > > > Sakari,
> > > >
> > > > On Tue, Sep 08, 2026 at 02:48:54PM +0300, Sakari Ailus wrote:
> > > > > Hi Jacopo,
> > > > >
> > > > > On Tue, Sep 08, 2026 at 01:46:11PM +0200, Jacopo Mondi wrote:
> > > > > > Hi Sakari
> > > > > >
> > > > > > On Tue, Sep 08, 2026 at 11:16:26AM +0300, Sakari Ailus wrote:
> > > > > > > Hi Jacopo,
> > > > > > >
> > > > > > > On Tue, Sep 08, 2026 at 09:57:23AM +0200, Jacopo Mondi wrote:
> > > > > > > > Add bindings for the ams OSRAM Mira016 image sensor.
> > > > > > > >
> > > > > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > > > > ---
> > > > > > > >  .../devicetree/bindings/media/i2c/ams,mira016.yaml | 97 ++++++++++++++++++++++
> > > > > > > >  MAINTAINERS                                        |  7 ++
> > > > > > > >  2 files changed, 104 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..49a606fca6cb
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > > > > > > > @@ -0,0 +1,97 @@
> > > > > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > > > > +%YAML 1.2
> > > > > > > > +---
> > > > > > > > +$id: http://devicetree.org/schemas/media/i2c/ams,mira016.yaml#
> > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > +
> > > > > > > > +title: AMS 0.16 MP NIR enhanced global shutter image sensor
> > > > > > > > +
> > > > > > > > +maintainers:
> > > > > > > > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > > > > +  - Philippe Baetens <philippebaetens@gmail.com>
> > > > > > > > +
> > > > > > > > +description:
> > > > > > > > +  Mira016 is a 0.16 MP NIR enhanced global shutter image sensor designed for 2D
> > > > > > > > +  and 3D consumer and industrial machine vision applications. The sensor is
> > > > > > > > +  compliant to the MIPI CSI-2 v1.3 protocol interface and the D-PHY v1.2
> > > > > > > > +  physical layer specifications to transmit the image data to the host
> > > > > > > > +  processor. It uses one data lane and one clock lane operating up to 1.5 Gbps.
> > > > > > > > +
> > > > > > > > +allOf:
> > > > > > > > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > > > > > > > +
> > > > > > > > +properties:
> > > > > > > > +  compatible:
> > > > > > > > +    const: ams,mira016
> > > > > > > > +
> > > > > > > > +  reg:
> > > > > > > > +    maxItems: 1
> > > > > > > > +
> > > > > > > > +  clocks:
> > > > > > > > +    maxItems: 1
> > > > > > > > +
> > > > > > > > +  vdd28-supply:
> > > > > > > > +    description:
> > > > > > > > +      I/O voltage supply, 2.8 volts
> > > > > > > > +
> > > > > > > > +  vdd11-supply:
> > > > > > > > +    description:
> > > > > > > > +      I/O voltage supply, 1.1 volts
> > > > > > > > +
> > > > > > > > +  reset-gpios:
> > > > > > > > +    description: Sensor reset (RST_N) GPIO
> > > > > > > > +    maxItems: 1
> > > > > > > > +
> > > > > > > > +  port:
> > > > > > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > > > +    additionalProperties: false
> > > > > > > > +    description:
> > > > > > > > +      Video output port
> > > > > > > > +
> > > > > > > > +    properties:
> > > > > > > > +      endpoint:
> > > > > > > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > > > > > > +        unevaluatedProperties: false
> > > > > > > > +
> > > > > > > > +        properties:
> > > > > > > > +          data-lanes:
> > > > > > > > +            items:
> > > > > > > > +              - const: 1
> > > > > > >
> > > > > > > The device obviously supports non-continuous clock mode (and that's what
> > > > > > > the driver also only does right now) but as the continous clock mode is
> > > > > > > required by CSI-2, I presume the device can do both.
> > > > > > >
> > > > > > > So I think you should have
> > > > > > >
> > > > > > >              clock-noncontinuous: true
> > > > > > >
> > > > > > > here.
> > > > > > >
> > > > > >
> > > > > > Maybe I'm confused (again, after 10 or so years of doing this) by the
> > > > > > usage of unevaluatedProperties/additionalProperties, but if I read
> > > > > > Documentation/devicetree/bindings/writing-schema.rst right
> > > > > >
> > > > > >   * unevaluatedProperties: false
> > > > > >       Used when this binding references other schema whose all properties
> > > > > >       should be allowed.
> > > > > >
> > > > > > Means all properties from video-interfaces.yaml are accepted (which is
> > > > > > imho very wrong, but it's a battle with dt maintainers I don't want to
> > > > > > start again).
> > > > >
> > > > > I guess you should have
> > > > >
> > > > > 		additionalProperties: false
> > > > >
> > > > > too?
> > > > >
> > > >
> > > > Where exactly do you mean ?
> > > >
> > > > I don't think I can have additionalProperties: and
> > > > unevaluatedProperties: in the same node, do I ?
> > >
> > > Yes, these are mutually exclusive.
> > >
> > > >
> > > > It's been a long time ago when we discussed with dt-maintainers what
> > > > the policy should have been for endpoints that reference
> > > > video-interfaces.yaml.
> > > >
> > > > To me, the most sensible thing was to use "additionalProperties: false"
> > > > and explicitly allow the supported properties, instead of allowing all
> > > > of them. However dt maintainers had a different opinion (for reasons I
> > > > honestly can't remember) and I think we have stabilized on the
> > > > following pattern
> > > >
> > > >         port:
> > > >           $ref: /schemas/graph.yaml#/$defs/port-base
> > > >           additionalProperties: false
> > > >
> > > >           properties:
> > > >             endpoint:
> > > >               $ref: /schemas/media/video-interfaces.yaml#
> > > >               unevaluatedProperties: false
> > > >
> > > >               properties:
> > > >                 ...
> > > >
> > > > All the most recently merged bindings in media/i2c have this pattern
> > > >
> > > > 42f83a32259a ("dt-bindings: media: i2c: Add Sony IMX678")
> > > > 097d2be74ad0 ("dt-bindings: media: i2c: document Omnivision OV08D10 CMOS image sensor")
> > > > 631dd79305ab ("dt-bindings: media: i2c: Add ov2732 image sensor")
> > > >
> > > > I feel like I'm missing something obvious, otherwise I don't see why
> > > > this binding should be different ?
> > >
> > > Good question. Perhaps there was no specific thought given on
> > > non-contiguous clock support? I guess most of the above should probably
> > > specify it, even if the driver doesn't support it.
> >
> > Maybe I'm still missing something, but using
> > 'unevaluatedProperties: false' and referencing video-interfaces.yaml
> > means you can include all properties from there (which, again, I think
> > it's wrong, but allows you to specify continous/non-continuous clock
> > support).
> >
> > >
> > > There's a good example of doing this in
> > > Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml, you're listed
> > > as the maintainer there. :-)
> >
> > eheh, that binding has 'additionalProperties: false' which means you
> > have to list properties you accept.
> >
> > This would be my preferred approach, but if my recollection is
> > correct, we stabilized on using 'unevaluatedProperties: false' after
> > discussing it with dt maintainers.
> >
> > Does anyone have a different recollection ?
>
> I don't have such a recollection albeit I'm not sure I recall more than
> this was probably discussed at some point. :-) What I do prefer however is
> to be able to say what is relevant for a given device. There are lots of
> properties there in video-interfaces.yaml that aren't for nearly every
> device (node).

I totally agree this would be more correct.

I thought we had a policy in place where we had agreed with
dt-maintainers to use "unevaluatedProperties: false", and I feel we
had this discussion many times already.

After quite some archeology I found this:
https://lore.kernel.org/all/Y9Tz8AWds51vGgsM@valkosipuli.retiisi.eu/
where the discussion didn't seem to end anywhere.

I value consisenticy above correctness for minor things like this,
both for sake of the code base sanity, both as a measure to avoid
pulling contributors in too many directions depending on who does the
review.

All the recently upstreamed bindings use "unevaluatedProperties:
false" meaning all properties from video-interfaces.yaml are optional
and accepted.

If we want to change this we should make a clear policy (a comment in
video-interface.yaml might be enough) and align all bindings,
shouldn't we ? Otherwise this will repeat over and over, depending
which bindings a submitter use as reference and who does the review.

>
> (It's been in my plan to better separate these based in physical interfaces
> etc. but so far it's been just a plan. Even that won't make this issue go
> entirely away though.)
>
> --
> Kind regards,
>
> Sakari Ailus
