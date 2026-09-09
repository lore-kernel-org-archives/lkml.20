Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24BC471CE1;
	Wed,  9 Sep 2026 08:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941391; cv=none; b=BSpm6GkG1zhKtOujofMOF19sAq3Kes0jNxqOrVyKNBrH579ijrZaHOf7+NtOmeuE8rbdMB7zTEHsAo62oVNuAeSlEy58xf8XCfu5BsK3gFU8htByNgI57F72OaJgpo1jieC5DY73gBrQbkgxf4zr95ygz3c9pO69x1EfqTaOlgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941391; c=relaxed/simple;
	bh=nJf9e9n0RS3AChK6hJmzK4ownlkSv1zPyUT4ZORJ41A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbwei2K+e5wnv2cgt65e3ffh47OwY/6oN6uUKZdrmtQcssIhBCjyG5Ch+A9EHK6ujJgtXvztDezGHtKilhWf3YsRgD6EEXqloY1gGV7xK/qcTmLOBNKvEOCdhWIhZA1bXDxV+w//AKJtGkLwqcET4WKO7YfgvBtTyeFkm97z2h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N6OHebKw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6OHebKw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788941390; x=1820477390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nJf9e9n0RS3AChK6hJmzK4ownlkSv1zPyUT4ZORJ41A=;
  b=N6OHebKw8VRrcHeUZwmaWxUIddRsFEn/2VT9vxqATuyAZFIa4BKVHp80
   +TCHc4OM7HxNaUUt3opbtEJKKESMEXW94uCEvHkYi5FcBLLYUnEWVxwMv
   YFxuv8gdMH+G+BQnoXk4cYaNI51wDZ9ACY3MzM5D1n9s8Mk6YVtV4C+LR
   AErVnKUT1s21v22N3LUqqoHTN6FYbIrG1OFvLO/1JyPW8j9RJ36dNSJWU
   at9AMRdDFo2CguPDTnD0br+rWpeMigZ/Cb24o7Zx0oUDjudfGaZ99Tnrx
   6Nau7g88DPbOsnksVa26TM0cGIUIDCY2jqItkXQHGe+rEwWw5f5nVk9zO
   A==;
X-CSE-ConnectionGUID: 5J9bHUxgRie36IHQ2RDq5A==
X-CSE-MsgGUID: Reo7enTCSgWvELG48Vkh1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100714127"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="100714127"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:09:49 -0700
X-CSE-ConnectionGUID: qkVtJRARQLaeWg7qnRXWaQ==
X-CSE-MsgGUID: bYCaIeymRXWkk5Uw7Ew1VA==
X-ExtLoop1: 1
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:09:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E8F77121BD2;
	Wed, 09 Sep 2026 11:09:48 +0300 (EEST)
Date: Wed, 9 Sep 2026 11:09:48 +0300
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
Message-ID: <aqEUTAAhwI09JOuR@kekkonen.localdomain>
References: <20260908-mira016-v4-0-1950504c131c@ideasonboard.com>
 <20260908-mira016-v4-1-1950504c131c@ideasonboard.com>
 <ap_EWstoCsLOkZ6x@kekkonen.localdomain>
 <ap_0yL-JatdVDaXG@zed>
 <ap_2Jhqc3vlmkmci@kekkonen.localdomain>
 <aqEJk6dKWuyMLLRt@zed>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqEJk6dKWuyMLLRt@zed>

Hi Jacopo,

On Wed, Sep 09, 2026 at 09:35:52AM +0200, Jacopo Mondi wrote:
> Sakari,
> 
> On Tue, Sep 08, 2026 at 02:48:54PM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Tue, Sep 08, 2026 at 01:46:11PM +0200, Jacopo Mondi wrote:
> > > Hi Sakari
> > >
> > > On Tue, Sep 08, 2026 at 11:16:26AM +0300, Sakari Ailus wrote:
> > > > Hi Jacopo,
> > > >
> > > > On Tue, Sep 08, 2026 at 09:57:23AM +0200, Jacopo Mondi wrote:
> > > > > Add bindings for the ams OSRAM Mira016 image sensor.
> > > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > ---
> > > > >  .../devicetree/bindings/media/i2c/ams,mira016.yaml | 97 ++++++++++++++++++++++
> > > > >  MAINTAINERS                                        |  7 ++
> > > > >  2 files changed, 104 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..49a606fca6cb
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
> > > > > @@ -0,0 +1,97 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/media/i2c/ams,mira016.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: AMS 0.16 MP NIR enhanced global shutter image sensor
> > > > > +
> > > > > +maintainers:
> > > > > +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > +  - Philippe Baetens <philippebaetens@gmail.com>
> > > > > +
> > > > > +description:
> > > > > +  Mira016 is a 0.16 MP NIR enhanced global shutter image sensor designed for 2D
> > > > > +  and 3D consumer and industrial machine vision applications. The sensor is
> > > > > +  compliant to the MIPI CSI-2 v1.3 protocol interface and the D-PHY v1.2
> > > > > +  physical layer specifications to transmit the image data to the host
> > > > > +  processor. It uses one data lane and one clock lane operating up to 1.5 Gbps.
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: ams,mira016
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  vdd28-supply:
> > > > > +    description:
> > > > > +      I/O voltage supply, 2.8 volts
> > > > > +
> > > > > +  vdd11-supply:
> > > > > +    description:
> > > > > +      I/O voltage supply, 1.1 volts
> > > > > +
> > > > > +  reset-gpios:
> > > > > +    description: Sensor reset (RST_N) GPIO
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  port:
> > > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > +    additionalProperties: false
> > > > > +    description:
> > > > > +      Video output port
> > > > > +
> > > > > +    properties:
> > > > > +      endpoint:
> > > > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > > > +        unevaluatedProperties: false
> > > > > +
> > > > > +        properties:
> > > > > +          data-lanes:
> > > > > +            items:
> > > > > +              - const: 1
> > > >
> > > > The device obviously supports non-continuous clock mode (and that's what
> > > > the driver also only does right now) but as the continous clock mode is
> > > > required by CSI-2, I presume the device can do both.
> > > >
> > > > So I think you should have
> > > >
> > > >              clock-noncontinuous: true
> > > >
> > > > here.
> > > >
> > >
> > > Maybe I'm confused (again, after 10 or so years of doing this) by the
> > > usage of unevaluatedProperties/additionalProperties, but if I read
> > > Documentation/devicetree/bindings/writing-schema.rst right
> > >
> > >   * unevaluatedProperties: false
> > >       Used when this binding references other schema whose all properties
> > >       should be allowed.
> > >
> > > Means all properties from video-interfaces.yaml are accepted (which is
> > > imho very wrong, but it's a battle with dt maintainers I don't want to
> > > start again).
> >
> > I guess you should have
> >
> > 		additionalProperties: false
> >
> > too?
> >
> 
> Where exactly do you mean ?
> 
> I don't think I can have additionalProperties: and
> unevaluatedProperties: in the same node, do I ?

Yes, these are mutually exclusive.

> 
> It's been a long time ago when we discussed with dt-maintainers what
> the policy should have been for endpoints that reference
> video-interfaces.yaml.
> 
> To me, the most sensible thing was to use "additionalProperties: false"
> and explicitly allow the supported properties, instead of allowing all
> of them. However dt maintainers had a different opinion (for reasons I
> honestly can't remember) and I think we have stabilized on the
> following pattern
> 
>         port:
>           $ref: /schemas/graph.yaml#/$defs/port-base
>           additionalProperties: false
> 
>           properties:
>             endpoint:
>               $ref: /schemas/media/video-interfaces.yaml#
>               unevaluatedProperties: false
> 
>               properties:
>                 ...
> 
> All the most recently merged bindings in media/i2c have this pattern
> 
> 42f83a32259a ("dt-bindings: media: i2c: Add Sony IMX678")
> 097d2be74ad0 ("dt-bindings: media: i2c: document Omnivision OV08D10 CMOS image sensor")
> 631dd79305ab ("dt-bindings: media: i2c: Add ov2732 image sensor")
> 
> I feel like I'm missing something obvious, otherwise I don't see why
> this binding should be different ?

Good question. Perhaps there was no specific thought given on
non-contiguous clock support? I guess most of the above should probably
specify it, even if the driver doesn't support it.

There's a good example of doing this in
Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml, you're listed
as the maintainer there. :-)

-- 
Regards,

Sakari Ailus
