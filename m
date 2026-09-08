Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7DA4F30FD;
	Tue,  8 Sep 2026 11:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868146; cv=none; b=k4pCi62l+ghqVM2ikD9rgWzNHy9fmovb8+XASiqKU0wjLSzVlpYaUwbNeDEmPN+V7bO5rIOozPPaK0AVmsV7Y42Y3DvV9biwN5ZFHkU9NP1uWWWc3YOvFvuApGnuwXd7ywjJlZejtujfkcH4NeYoItH1HN8pqV7RDKj1bfqRfz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868146; c=relaxed/simple;
	bh=2SywWWUWZ0zxEBMBioYOeu7N5r0WbZQ4/x9T5tu39lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDRQcQYLL9w6CgnRflU+VA5GkL88+7Pv2o5+ugikpUKaDCrsy6geUnPHH4n9MK2FVzv3WPHUoLC8GLsKMfkAHfqjRGtf3lLlDBLkw+YyAIuOrqUDjJ6AAi7lt6U+GJHpjwkwTyAYuZmOKF76qEJIdBMK96EIqTc+xPct5b1kaUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OX1stNXT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OX1stNXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788868141; x=1820404141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2SywWWUWZ0zxEBMBioYOeu7N5r0WbZQ4/x9T5tu39lI=;
  b=OX1stNXTXjpBjarhsrLkPGCyMCSKXPoo3fsOXmKNt1QE/kCsZY/r4Dmb
   Kx0wG6q+Elb+hP3tt++niVhUmFUr9TsHbhrYeBgjdgOfDv0Z/RyHNrzb4
   DxV5u+4dq92YbY3qQE0wkzh3R8FK/jWlPY8RqEH1LpXb1lptCbfAs6V0Z
   FagoJMctZMIMOAzHY78VHQej00RSYZ7hPZoq3n6MtX1LY7rrC2cwV+lnA
   pOD5AUaddbkQ5ny5Um51w/eQoBD+JOQj34a54BfUdQBUO74RhKOAoMpeB
   pn3z9wRdkL2qzAoVkfryOBtQhhixAPItj3o8uf196Y4Fb9VXVgOVU97Mj
   A==;
X-CSE-ConnectionGUID: kHjJyZriTd6uJmYQ0L1L2Q==
X-CSE-MsgGUID: vkWABwqOR7e7mhxC+3UOTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99598381"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="99598381"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 04:48:55 -0700
X-CSE-ConnectionGUID: f+2LBPCvSXaUBzbbRjTpaQ==
X-CSE-MsgGUID: cRDhT3mGQH26CU4gOYWnZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="295865860"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.120])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 04:48:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 86DCF11F7F5;
	Tue, 08 Sep 2026 14:48:54 +0300 (EEST)
Date: Tue, 8 Sep 2026 14:48:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Philippe Baetens <philippebaetens@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add Mira016 image sensor
Message-ID: <ap_2Jhqc3vlmkmci@kekkonen.localdomain>
References: <20260908-mira016-v4-0-1950504c131c@ideasonboard.com>
 <20260908-mira016-v4-1-1950504c131c@ideasonboard.com>
 <ap_EWstoCsLOkZ6x@kekkonen.localdomain>
 <ap_0yL-JatdVDaXG@zed>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap_0yL-JatdVDaXG@zed>

Hi Jacopo,

On Tue, Sep 08, 2026 at 01:46:11PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Tue, Sep 08, 2026 at 11:16:26AM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Tue, Sep 08, 2026 at 09:57:23AM +0200, Jacopo Mondi wrote:
> > > Add bindings for the ams OSRAM Mira016 image sensor.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >  .../devicetree/bindings/media/i2c/ams,mira016.yaml | 97 ++++++++++++++++++++++
> > >  MAINTAINERS                                        |  7 ++
> > >  2 files changed, 104 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > > new file mode 100644
> > > index 000000000000..49a606fca6cb
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > > @@ -0,0 +1,97 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/ams,mira016.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: AMS 0.16 MP NIR enhanced global shutter image sensor
> > > +
> > > +maintainers:
> > > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > +  - Philippe Baetens <philippebaetens@gmail.com>
> > > +
> > > +description:
> > > +  Mira016 is a 0.16 MP NIR enhanced global shutter image sensor designed for 2D
> > > +  and 3D consumer and industrial machine vision applications. The sensor is
> > > +  compliant to the MIPI CSI-2 v1.3 protocol interface and the D-PHY v1.2
> > > +  physical layer specifications to transmit the image data to the host
> > > +  processor. It uses one data lane and one clock lane operating up to 1.5 Gbps.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ams,mira016
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  vdd28-supply:
> > > +    description:
> > > +      I/O voltage supply, 2.8 volts
> > > +
> > > +  vdd11-supply:
> > > +    description:
> > > +      I/O voltage supply, 1.1 volts
> > > +
> > > +  reset-gpios:
> > > +    description: Sensor reset (RST_N) GPIO
> > > +    maxItems: 1
> > > +
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > +    additionalProperties: false
> > > +    description:
> > > +      Video output port
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > +        unevaluatedProperties: false
> > > +
> > > +        properties:
> > > +          data-lanes:
> > > +            items:
> > > +              - const: 1
> >
> > The device obviously supports non-continuous clock mode (and that's what
> > the driver also only does right now) but as the continous clock mode is
> > required by CSI-2, I presume the device can do both.
> >
> > So I think you should have
> >
> >              clock-noncontinuous: true
> >
> > here.
> >
> 
> Maybe I'm confused (again, after 10 or so years of doing this) by the
> usage of unevaluatedProperties/additionalProperties, but if I read
> Documentation/devicetree/bindings/writing-schema.rst right
> 
>   * unevaluatedProperties: false
>       Used when this binding references other schema whose all properties
>       should be allowed.
> 
> Means all properties from video-interfaces.yaml are accepted (which is
> imho very wrong, but it's a battle with dt maintainers I don't want to
> start again).

I guess you should have

		additionalProperties: false

too?

> 
> 
> > > +
> > > +        required:
> > > +          - data-lanes
> > > +          - link-frequencies
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - vdd28-supply
> > > +  - vdd11-supply
> > > +  - port
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    i2c {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        camera@36 {
> > > +            compatible = "ams,mira016";
> > > +            reg = <0x36>;
> > > +            clocks = <&cam1_clk>;
> > > +
> > > +            vdd28-supply = <&cam1_reg>;
> > > +            vdd11-supply = <&cam_dummy_reg>;
> > > +
> > > +            port {
> > > +                endpoint {
> > > +                    data-lanes = <1>;
> > > +                    link-frequencies = /bits/ 64 <750000000>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +...
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index e12dc3ca57ab..1c24b05b378b 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -1454,6 +1454,13 @@ S:	Maintained
> > >  F:	Documentation/devicetree/bindings/iio/light/ams,as73211.yaml
> > >  F:	drivers/iio/light/as73211.c
> > >
> > > +AMS MIRA016 DRIVER
> > > +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > +M:	Philippe Baetens <philippebaetens@gmail.com>
> > > +L:	linux-media@vger.kernel.org
> > > +S:	Maintained
> > > +F:	Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > > +
> > >  AMT (Automatic Multicast Tunneling)
> > >  M:	Taehee Yoo <ap420073@gmail.com>
> > >  L:	netdev@vger.kernel.org
> > >
> >

-- 
Regards,

Sakari Ailus
