Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC99A530E1A;
	Tue,  8 Sep 2026 11:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867989; cv=none; b=LCiQfqMMS2urSQyShnAm0la5YnJUZFcK157wF4MCZmZ7CO2xLcKFeLirnW6YLCWSuRtqQnfM5Ir4J3FkiqBgIcv1BbxaqygOn9osR+lXtixY7L2gEAYF2vUFJDnDXnKzR87KzK7p14lNqJ1DHfv2K1gcuZ84k5ERPhbWk133YNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867989; c=relaxed/simple;
	bh=efiL20xfO2/Ukyplnq5Bm8swRLh4lhKFNVtoe9ECT74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9nPCaedtqyuPQVeOSbucY1Ee8749VAC2pZRkScmu1FVjxbP1x+nsJF+5AegfcUmZQCuOPhh5z7bIxnoO+Kd9dzB7FfFhqCqH3NwFVQ73cy/pnJILrdJsjbbf1Lm+oPr0iIuU5qvhcxDz+bmrAmIftywQYvmkN1k2UDWFZy/5u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dIEXy6yr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dIEXy6yr"
Received: from ideasonboard.com (mob-109-113-65-131.net.vodafone.it [109.113.65.131])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2290E981;
	Tue,  8 Sep 2026 13:44:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788867880;
	bh=efiL20xfO2/Ukyplnq5Bm8swRLh4lhKFNVtoe9ECT74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dIEXy6yrfXbA3WicxATpBwLH4/+a/3KRnx46e0z1090JfOIa1/hzwyBuN+YYPSqim
	 DGELzMX5+ywkcYSGnCshcCEOduc1JzjiqY7FOKrqzNtTXo55tI89Z9bKZYNS3Z6uZ9
	 JopJ4tFvSBdfEb98El9SMLxpHhhaMNHbQnTgPMzo=
Date: Tue, 8 Sep 2026 13:46:11 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Philippe Baetens <philippebaetens@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add Mira016 image sensor
Message-ID: <ap_0yL-JatdVDaXG@zed>
References: <20260908-mira016-v4-0-1950504c131c@ideasonboard.com>
 <20260908-mira016-v4-1-1950504c131c@ideasonboard.com>
 <ap_EWstoCsLOkZ6x@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ap_EWstoCsLOkZ6x@kekkonen.localdomain>

Hi Sakari

On Tue, Sep 08, 2026 at 11:16:26AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Tue, Sep 08, 2026 at 09:57:23AM +0200, Jacopo Mondi wrote:
> > Add bindings for the ams OSRAM Mira016 image sensor.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../devicetree/bindings/media/i2c/ams,mira016.yaml | 97 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  7 ++
> >  2 files changed, 104 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > new file mode 100644
> > index 000000000000..49a606fca6cb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > @@ -0,0 +1,97 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ams,mira016.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: AMS 0.16 MP NIR enhanced global shutter image sensor
> > +
> > +maintainers:
> > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > +  - Philippe Baetens <philippebaetens@gmail.com>
> > +
> > +description:
> > +  Mira016 is a 0.16 MP NIR enhanced global shutter image sensor designed for 2D
> > +  and 3D consumer and industrial machine vision applications. The sensor is
> > +  compliant to the MIPI CSI-2 v1.3 protocol interface and the D-PHY v1.2
> > +  physical layer specifications to transmit the image data to the host
> > +  processor. It uses one data lane and one clock lane operating up to 1.5 Gbps.
> > +
> > +allOf:
> > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: ams,mira016
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  vdd28-supply:
> > +    description:
> > +      I/O voltage supply, 2.8 volts
> > +
> > +  vdd11-supply:
> > +    description:
> > +      I/O voltage supply, 1.1 volts
> > +
> > +  reset-gpios:
> > +    description: Sensor reset (RST_N) GPIO
> > +    maxItems: 1
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    additionalProperties: false
> > +    description:
> > +      Video output port
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            items:
> > +              - const: 1
>
> The device obviously supports non-continuous clock mode (and that's what
> the driver also only does right now) but as the continous clock mode is
> required by CSI-2, I presume the device can do both.
>
> So I think you should have
>
>              clock-noncontinuous: true
>
> here.
>

Maybe I'm confused (again, after 10 or so years of doing this) by the
usage of unevaluatedProperties/additionalProperties, but if I read
Documentation/devicetree/bindings/writing-schema.rst right

  * unevaluatedProperties: false
      Used when this binding references other schema whose all properties
      should be allowed.

Means all properties from video-interfaces.yaml are accepted (which is
imho very wrong, but it's a battle with dt maintainers I don't want to
start again).


> > +
> > +        required:
> > +          - data-lanes
> > +          - link-frequencies
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - vdd28-supply
> > +  - vdd11-supply
> > +  - port
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        camera@36 {
> > +            compatible = "ams,mira016";
> > +            reg = <0x36>;
> > +            clocks = <&cam1_clk>;
> > +
> > +            vdd28-supply = <&cam1_reg>;
> > +            vdd11-supply = <&cam_dummy_reg>;
> > +
> > +            port {
> > +                endpoint {
> > +                    data-lanes = <1>;
> > +                    link-frequencies = /bits/ 64 <750000000>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e12dc3ca57ab..1c24b05b378b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1454,6 +1454,13 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/iio/light/ams,as73211.yaml
> >  F:	drivers/iio/light/as73211.c
> >
> > +AMS MIRA016 DRIVER
> > +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > +M:	Philippe Baetens <philippebaetens@gmail.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > +
> >  AMT (Automatic Multicast Tunneling)
> >  M:	Taehee Yoo <ap420073@gmail.com>
> >  L:	netdev@vger.kernel.org
> >
>
> --
> Regards,
>
> Sakari Ailus
