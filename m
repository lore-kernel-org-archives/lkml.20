Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1B72D0C75;
	Sat, 12 Sep 2026 11:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789213233; cv=none; b=MveRhsWD0BJxLqZZstdFEl0cufkxBoqFKlOh5LG4aZI+pJcF5tNm2w6GaWkD2vWYhKqNHFFa5c/6lLMQojfrUVAwROkYO5cdMlQrVO4sT5vQq8R3WpDA81v3YuDp1MWn4sXCSLBBXpXq/fDENkOz2YeMDZlb5LxWWbxVDaL/MNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789213233; c=relaxed/simple;
	bh=+tDQ00MovbM6m1LVpJeHQpOmVzDfXySemAfwdxWNZ7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1bPaWA9iSd0+0JNxf1GT4sHBEpFI0LarpLvcICaejSrFV8i0LNNx4iAr+vFY1UfLyPO/LZO3vLCaWWGlDDlJfvPIfkVixDJirDgomR2JaO3O6sIoVxnbpJxsTHHK/Qd34qDFbUWcnOsN3+GNnFopV14orhqOqqI8iY8568deyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVW5JgWe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVW5JgWe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789213231; x=1820749231;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+tDQ00MovbM6m1LVpJeHQpOmVzDfXySemAfwdxWNZ7Q=;
  b=WVW5JgWehLnbi3D5Vdq2Q/GTpZewHYYQ4H0TpDnk8QZnrE2lloCsE+hi
   vSXy7QhOwCbDGIle8kSU8+CpIp92UXCzIpGzirO8Rlt/suF86JfyExnQj
   C0yRL4MYNrmbPc0oLwPZMslATURBG3UT/QQ+5jiv9ClRMiTiLKoYsVzu7
   QxDr3iH0eqnNsKdlE1xlqtu6sgpVTs0jB9LVt4PLLtZwbgBY+odYDWfmk
   AqWecszzGnVrdmfFZ/kgm1uckVelluLzixYO91fF5ejQidW3Ut20frhXc
   13yGnkAhDTJXyeMEC2W/bmH694aekJ8IGnKjNKQVkflLFdUI71Wj4qspj
   Q==;
X-CSE-ConnectionGUID: FKnYLFP7Riqrp9kotjcYuw==
X-CSE-MsgGUID: eIwVOXaUTKu9fHxCxo7FgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89696688"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="89696688"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 04:40:31 -0700
X-CSE-ConnectionGUID: +TJJVwuBT+2ABcPbtyeUTQ==
X-CSE-MsgGUID: oOiIx21WRByWkJufTotS1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="302062380"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.238])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 04:40:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 33849120EA9;
	Sat, 12 Sep 2026 14:40:32 +0300 (EEST)
Date: Sat, 12 Sep 2026 14:40:32 +0300
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
Message-ID: <aqU6MPoOvhAEHOeI@kekkonen.localdomain>
References: <20260908-mira016-v4-0-1950504c131c@ideasonboard.com>
 <20260908-mira016-v4-1-1950504c131c@ideasonboard.com>
 <ap_EWstoCsLOkZ6x@kekkonen.localdomain>
 <ap_0yL-JatdVDaXG@zed>
 <ap_2Jhqc3vlmkmci@kekkonen.localdomain>
 <aqEJk6dKWuyMLLRt@zed>
 <aqEUTAAhwI09JOuR@kekkonen.localdomain>
 <aqEsceb73f5ysKmK@zed>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqEsceb73f5ysKmK@zed>

Hi Jacopo,

On Wed, Sep 09, 2026 at 11:56:27AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Wed, Sep 09, 2026 at 11:09:48AM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Wed, Sep 09, 2026 at 09:35:52AM +0200, Jacopo Mondi wrote:
> > > Sakari,
> > >
> > > On Tue, Sep 08, 2026 at 02:48:54PM +0300, Sakari Ailus wrote:
> > > > Hi Jacopo,
> > > >
> > > > On Tue, Sep 08, 2026 at 01:46:11PM +0200, Jacopo Mondi wrote:
> > > > > Hi Sakari
> > > > >
> > > > > On Tue, Sep 08, 2026 at 11:16:26AM +0300, Sakari Ailus wrote:
> > > > > > Hi Jacopo,
> > > > > >
> > > > > > On Tue, Sep 08, 2026 at 09:57:23AM +0200, Jacopo Mondi wrote:
> > > > > > > Add bindings for the ams OSRAM Mira016 image sensor.
> > > > > > >
> > > > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > > > ---
> > > > > > >  .../devicetree/bindings/media/i2c/ams,mira016.yaml | 97 ++++++++++++++++++++++
> > > > > > >  MAINTAINERS                                        |  7 ++
> > > > > > >  2 files changed, 104 insertions(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..49a606fca6cb
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > > > > > > @@ -0,0 +1,97 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/media/i2c/ams,mira016.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: AMS 0.16 MP NIR enhanced global shutter image sensor
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > > > +  - Philippe Baetens <philippebaetens@gmail.com>
> > > > > > > +
> > > > > > > +description:
> > > > > > > +  Mira016 is a 0.16 MP NIR enhanced global shutter image sensor designed for 2D
> > > > > > > +  and 3D consumer and industrial machine vision applications. The sensor is
> > > > > > > +  compliant to the MIPI CSI-2 v1.3 protocol interface and the D-PHY v1.2
> > > > > > > +  physical layer specifications to transmit the image data to the host
> > > > > > > +  processor. It uses one data lane and one clock lane operating up to 1.5 Gbps.
> > > > > > > +
> > > > > > > +allOf:
> > > > > > > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    const: ams,mira016
> > > > > > > +
> > > > > > > +  reg:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  clocks:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  vdd28-supply:
> > > > > > > +    description:
> > > > > > > +      I/O voltage supply, 2.8 volts
> > > > > > > +
> > > > > > > +  vdd11-supply:
> > > > > > > +    description:
> > > > > > > +      I/O voltage supply, 1.1 volts
> > > > > > > +
> > > > > > > +  reset-gpios:
> > > > > > > +    description: Sensor reset (RST_N) GPIO
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  port:
> > > > > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > > +    additionalProperties: false
> > > > > > > +    description:
> > > > > > > +      Video output port
> > > > > > > +
> > > > > > > +    properties:
> > > > > > > +      endpoint:
> > > > > > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > > > > > +        unevaluatedProperties: false
> > > > > > > +
> > > > > > > +        properties:
> > > > > > > +          data-lanes:
> > > > > > > +            items:
> > > > > > > +              - const: 1
> > > > > >
> > > > > > The device obviously supports non-continuous clock mode (and that's what
> > > > > > the driver also only does right now) but as the continous clock mode is
> > > > > > required by CSI-2, I presume the device can do both.
> > > > > >
> > > > > > So I think you should have
> > > > > >
> > > > > >              clock-noncontinuous: true
> > > > > >
> > > > > > here.
> > > > > >
> > > > >
> > > > > Maybe I'm confused (again, after 10 or so years of doing this) by the
> > > > > usage of unevaluatedProperties/additionalProperties, but if I read
> > > > > Documentation/devicetree/bindings/writing-schema.rst right
> > > > >
> > > > >   * unevaluatedProperties: false
> > > > >       Used when this binding references other schema whose all properties
> > > > >       should be allowed.
> > > > >
> > > > > Means all properties from video-interfaces.yaml are accepted (which is
> > > > > imho very wrong, but it's a battle with dt maintainers I don't want to
> > > > > start again).
> > > >
> > > > I guess you should have
> > > >
> > > > 		additionalProperties: false
> > > >
> > > > too?
> > > >
> > >
> > > Where exactly do you mean ?
> > >
> > > I don't think I can have additionalProperties: and
> > > unevaluatedProperties: in the same node, do I ?
> >
> > Yes, these are mutually exclusive.
> >
> > >
> > > It's been a long time ago when we discussed with dt-maintainers what
> > > the policy should have been for endpoints that reference
> > > video-interfaces.yaml.
> > >
> > > To me, the most sensible thing was to use "additionalProperties: false"
> > > and explicitly allow the supported properties, instead of allowing all
> > > of them. However dt maintainers had a different opinion (for reasons I
> > > honestly can't remember) and I think we have stabilized on the
> > > following pattern
> > >
> > >         port:
> > >           $ref: /schemas/graph.yaml#/$defs/port-base
> > >           additionalProperties: false
> > >
> > >           properties:
> > >             endpoint:
> > >               $ref: /schemas/media/video-interfaces.yaml#
> > >               unevaluatedProperties: false
> > >
> > >               properties:
> > >                 ...
> > >
> > > All the most recently merged bindings in media/i2c have this pattern
> > >
> > > 42f83a32259a ("dt-bindings: media: i2c: Add Sony IMX678")
> > > 097d2be74ad0 ("dt-bindings: media: i2c: document Omnivision OV08D10 CMOS image sensor")
> > > 631dd79305ab ("dt-bindings: media: i2c: Add ov2732 image sensor")
> > >
> > > I feel like I'm missing something obvious, otherwise I don't see why
> > > this binding should be different ?
> >
> > Good question. Perhaps there was no specific thought given on
> > non-contiguous clock support? I guess most of the above should probably
> > specify it, even if the driver doesn't support it.
> 
> Maybe I'm still missing something, but using
> 'unevaluatedProperties: false' and referencing video-interfaces.yaml
> means you can include all properties from there (which, again, I think
> it's wrong, but allows you to specify continous/non-continuous clock
> support).
> 
> >
> > There's a good example of doing this in
> > Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml, you're listed
> > as the maintainer there. :-)
> 
> eheh, that binding has 'additionalProperties: false' which means you
> have to list properties you accept.
> 
> This would be my preferred approach, but if my recollection is
> correct, we stabilized on using 'unevaluatedProperties: false' after
> discussing it with dt maintainers.
> 
> Does anyone have a different recollection ?

I don't have such a recollection albeit I'm not sure I recall more than
this was probably discussed at some point. :-) What I do prefer however is
to be able to say what is relevant for a given device. There are lots of
properties there in video-interfaces.yaml that aren't for nearly every
device (node).

(It's been in my plan to better separate these based in physical interfaces
etc. but so far it's been just a plan. Even that won't make this issue go
entirely away though.)

-- 
Kind regards,

Sakari Ailus
