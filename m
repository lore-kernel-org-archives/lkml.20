Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE7C33DEC8;
	Wed,  9 Sep 2026 07:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939361; cv=none; b=N0beldxwgvnAisUc2REpezc/xLIDG+nkGTllWLFxRL+1nVPgK9pvjADBGolzKX6W4F4NaUjqSU27v2Sp0JZfixNVrEh3+16bluh9V6AmenX7dRQHWLM9IFfnF8A1kGNuO1JTylCpbXDLW9rzIG1Rkln9OG2+Sgl1yI0CeJcxxgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939361; c=relaxed/simple;
	bh=eGMvNgsYGKPWUrgXIAqzJ1svwm6MdNmdB5cuofkI7KY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFOXmpF8hwDrJ/kWVaE/Rvj1Wv3/J96AwBbDRvHG0md0TYdfi7cYgUi+t3Qw9j4+FKT2aQG9e6LoE8deoPLliwFit0qmX7ZmytVG8jK5SYR2SqlNJTcqxNY6b093DLerDVGqEJ94OCFgpaHR/UmXI/ysiJwgGAEt8fJpxCY01Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m5DcZp4X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m5DcZp4X"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A7024B0;
	Wed,  9 Sep 2026 09:34:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788939260;
	bh=eGMvNgsYGKPWUrgXIAqzJ1svwm6MdNmdB5cuofkI7KY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m5DcZp4XGsdCFiu5FHCi/VKiczBQnR5LMlc0T0M1JZfdYzlg8Ue6iNHWXS5vx1LIN
	 V1j6Qggj/7V0JX5uRlClBTJSzoxt7pxH24Z83UelpY4LGdTbJJQPtAjOseV0YQaRUk
	 vH92/FltlQyjwU8ijZVzjXbgoAnwpwRYGolxyE10=
Date: Wed, 9 Sep 2026 09:35:52 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Philippe Baetens <philippebaetens@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add Mira016 image sensor
Message-ID: <aqEJk6dKWuyMLLRt@zed>
References: <20260908-mira016-v4-0-1950504c131c@ideasonboard.com>
 <20260908-mira016-v4-1-1950504c131c@ideasonboard.com>
 <ap_EWstoCsLOkZ6x@kekkonen.localdomain>
 <ap_0yL-JatdVDaXG@zed>
 <ap_2Jhqc3vlmkmci@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ap_2Jhqc3vlmkmci@kekkonen.localdomain>

Sakari,

On Tue, Sep 08, 2026 at 02:48:54PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Tue, Sep 08, 2026 at 01:46:11PM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Tue, Sep 08, 2026 at 11:16:26AM +0300, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Tue, Sep 08, 2026 at 09:57:23AM +0200, Jacopo Mondi wrote:
> > > > Add bindings for the ams OSRAM Mira016 image sensor.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > >  .../devicetree/bindings/media/i2c/ams,mira016.yaml | 97 ++++++++++++++++++++++
> > > >  MAINTAINERS                                        |  7 ++
> > > >  2 files changed, 104 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > > > new file mode 100644
> > > > index 000000000000..49a606fca6cb
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > > > @@ -0,0 +1,97 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/i2c/ams,mira016.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: AMS 0.16 MP NIR enhanced global shutter image sensor
> > > > +
> > > > +maintainers:
> > > > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > +  - Philippe Baetens <philippebaetens@gmail.com>
> > > > +
> > > > +description:
> > > > +  Mira016 is a 0.16 MP NIR enhanced global shutter image sensor designed for 2D
> > > > +  and 3D consumer and industrial machine vision applications. The sensor is
> > > > +  compliant to the MIPI CSI-2 v1.3 protocol interface and the D-PHY v1.2
> > > > +  physical layer specifications to transmit the image data to the host
> > > > +  processor. It uses one data lane and one clock lane operating up to 1.5 Gbps.
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: ams,mira016
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +
> > > > +  vdd28-supply:
> > > > +    description:
> > > > +      I/O voltage supply, 2.8 volts
> > > > +
> > > > +  vdd11-supply:
> > > > +    description:
> > > > +      I/O voltage supply, 1.1 volts
> > > > +
> > > > +  reset-gpios:
> > > > +    description: Sensor reset (RST_N) GPIO
> > > > +    maxItems: 1
> > > > +
> > > > +  port:
> > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > +    additionalProperties: false
> > > > +    description:
> > > > +      Video output port
> > > > +
> > > > +    properties:
> > > > +      endpoint:
> > > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > > +        unevaluatedProperties: false
> > > > +
> > > > +        properties:
> > > > +          data-lanes:
> > > > +            items:
> > > > +              - const: 1
> > >
> > > The device obviously supports non-continuous clock mode (and that's what
> > > the driver also only does right now) but as the continous clock mode is
> > > required by CSI-2, I presume the device can do both.
> > >
> > > So I think you should have
> > >
> > >              clock-noncontinuous: true
> > >
> > > here.
> > >
> >
> > Maybe I'm confused (again, after 10 or so years of doing this) by the
> > usage of unevaluatedProperties/additionalProperties, but if I read
> > Documentation/devicetree/bindings/writing-schema.rst right
> >
> >   * unevaluatedProperties: false
> >       Used when this binding references other schema whose all properties
> >       should be allowed.
> >
> > Means all properties from video-interfaces.yaml are accepted (which is
> > imho very wrong, but it's a battle with dt maintainers I don't want to
> > start again).
>
> I guess you should have
>
> 		additionalProperties: false
>
> too?
>

Where exactly do you mean ?

I don't think I can have additionalProperties: and
unevaluatedProperties: in the same node, do I ?

It's been a long time ago when we discussed with dt-maintainers what
the policy should have been for endpoints that reference
video-interfaces.yaml.

To me, the most sensible thing was to use "additionalProperties: false"
and explicitly allow the supported properties, instead of allowing all
of them. However dt maintainers had a different opinion (for reasons I
honestly can't remember) and I think we have stabilized on the
following pattern

        port:
          $ref: /schemas/graph.yaml#/$defs/port-base
          additionalProperties: false

          properties:
            endpoint:
              $ref: /schemas/media/video-interfaces.yaml#
              unevaluatedProperties: false

              properties:
                ...

All the most recently merged bindings in media/i2c have this pattern

42f83a32259a ("dt-bindings: media: i2c: Add Sony IMX678")
097d2be74ad0 ("dt-bindings: media: i2c: document Omnivision OV08D10 CMOS image sensor")
631dd79305ab ("dt-bindings: media: i2c: Add ov2732 image sensor")

I feel like I'm missing something obvious, otherwise I don't see why
this binding should be different ?


> >
> >
> > > > +
> > > > +        required:
> > > > +          - data-lanes
> > > > +          - link-frequencies
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - clocks
> > > > +  - vdd28-supply
> > > > +  - vdd11-supply
> > > > +  - port
> > > > +
> > > > +unevaluatedProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    i2c {
> > > > +        #address-cells = <1>;
> > > > +        #size-cells = <0>;
> > > > +
> > > > +        camera@36 {
> > > > +            compatible = "ams,mira016";
> > > > +            reg = <0x36>;
> > > > +            clocks = <&cam1_clk>;
> > > > +
> > > > +            vdd28-supply = <&cam1_reg>;
> > > > +            vdd11-supply = <&cam_dummy_reg>;
> > > > +
> > > > +            port {
> > > > +                endpoint {
> > > > +                    data-lanes = <1>;
> > > > +                    link-frequencies = /bits/ 64 <750000000>;
> > > > +                };
> > > > +            };
> > > > +        };
> > > > +    };
> > > > +...
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index e12dc3ca57ab..1c24b05b378b 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -1454,6 +1454,13 @@ S:	Maintained
> > > >  F:	Documentation/devicetree/bindings/iio/light/ams,as73211.yaml
> > > >  F:	drivers/iio/light/as73211.c
> > > >
> > > > +AMS MIRA016 DRIVER
> > > > +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > +M:	Philippe Baetens <philippebaetens@gmail.com>
> > > > +L:	linux-media@vger.kernel.org
> > > > +S:	Maintained
> > > > +F:	Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > > > +
> > > >  AMT (Automatic Multicast Tunneling)
> > > >  M:	Taehee Yoo <ap420073@gmail.com>
> > > >  L:	netdev@vger.kernel.org
> > > >
> > >
>
> --
> Regards,
>
> Sakari Ailus
