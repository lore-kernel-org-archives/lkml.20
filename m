Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585117;
	b=VCN87ga3buQQd766Tvu19IgeTYOVPGjYoFEHqHP4vHzOTPoN5V5C2hNeBG/D7wP+/7Xt
	 /Fct+/BtpNODf0QQ44D9z0rxHoT+Sp6FRUPPb0uqxNUC7FUKJ5imoScqDMFhgYiYvPtME
	 C874r/ZXDP/Bo0kRk1CDhOdVp5IOS7pCKyHxNpMq7XMk1ieLo99hky3B1aSUeV4Z6ISf1
	 jt7dXYXct0u4HA3wAE8ZwWRmxudL3MRandcfEayDhlOboc/zitSllvszcYPWv7jDpbYpZ
	 zSZIyuPOk8dqAbGsGzHvDEMEG1QYqOxiU/adulM2x3Hsg6FicqUqaUMrFnlTAr3T7xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585117;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zspzlaIWpMVIY1GlZVCoHupae3pepPrDOAVpUxo3+Kc=;
	b=FPgRMDmmIIyvEfh+HA2069y9zHaI1lqlmVV9Ky7hbZ3VJGRnL00Zs3ScnYcCTk/tqCNr
	 k3NXc8ilIoazTnjxFmp1exinLY7Ki/4xawLfF5+4tenuZriW0xHLJzXY4OK9WPbY4I334
	 HxwgznYreMINd2+xaX3CEORDFeKkA6OKOV0R9H9QAR3hlsVvpbfs0xy/sW1k2YePGOXSo
	 zSnFKCA10Shd3uDeyHVpyirYNVafQzHhAiegczuSie21EQXkERjBs+/IyTIDjpN0qkLPS
	 5PKG3x4qdntOHm57i1nIvjcRN5/zgYg0hDQezQOZdCzzkRlf1gHGfzPVi/fDi1C6InA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A+182jiG;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D6B606A319;
	Wed, 21 Oct 2026 12:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D6B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A+182jiG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792585117; x=1824121117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OZV6ooIGai752f391GZMPaglES/lh8UXE+ChNXLkMQk=;
  b=A+182jiGnhYbRFIap2llg2BYjmW1xD7QKqJ0owM1c00gMU1l/Y6wXMKp
   tVeJbHTdneag72SwTREnc51+SQcOJXCkO4hZUHUngE5qN34sxSErVlCJr
   Y2CSvUGpc3CUBWZydieocl17DXV5JeRsE+vkKYIIud6N5gEG5KhcruTVz
   EMwQJzLGxNiIRSvHnXIkJF1PBQmlRBYkoplDIomged7i2xStgfv7GnNLA
   06Pw+Z7+wJQYJMntXI0igf6JvFCtmhdbKuMUJGoEwR1bvDLm0i7HqBTaZ
   EkDDENbLx3C22mRQmou2pmeSQhZiGUSSqK9A49oG6bc3MY2icIooixiuk
   w==;
X-CSE-ConnectionGUID: Xr9pm76hStagSZyo5JIHHg==
X-CSE-MsgGUID: H6pUYop7Q2OiWH7FNyCrMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1319674"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1319674"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 05:18:36 -0700
X-CSE-ConnectionGUID: 2RnXLwLvSemDQeHHXuR2EQ==
X-CSE-MsgGUID: rEqovWOfR5WY3CxaShZ9/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="2959617"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.43])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 05:18:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 15382121BC4;
	Wed, 21 Oct 2026 15:18:31 +0300 (EEST)
Date: Wed, 21 Oct 2026 15:18:31 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 10/16] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
Message-ID: <atitlzogStoHJ0E3@kekkonen.localdomain>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
 <20261015-media-starvis2-v4-10-75fcdb4163f3@raspberrypi.com>
 <atc9Uxt_hsyYu2o5@kekkonen.localdomain>
 <CAPY8ntD2C-7UTKX2Srusn_Tzx5KS3tnUtPP+piMYbUKZP91Rpg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntD2C-7UTKX2Srusn_Tzx5KS3tnUtPP+piMYbUKZP91Rpg@mail.gmail.com>

Hi Dave,

On Tue, Oct 20, 2026 at 03:39:52PM +0100, Dave Stevenson wrote:
> Hi Sakari
> 
> Thanks for the review
> 
> On Tue, 20 Oct 2026 at 11:07, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Dave,
> >
> > On Thu, Oct 15, 2026 at 04:57:36PM +0100, Dave Stevenson wrote:
> > > There are multiple members of the Sony Starvis 2 image sensor family
> > > that have the same hardware requirements as imx678.
> > > Add them as options to the imx678 binding, rather than duplicating it.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > ---
> > >  .../devicetree/bindings/media/i2c/sony,imx678.yaml | 38 ++++++++++++++++++----
> > >  1 file changed, 32 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > > index 098f72544216..027872a134f2 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > > @@ -5,7 +5,7 @@
> > >  $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
> > >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > >
> > > -title: Sony IMX678 Sensor
> > > +title: Sony IMX678 and Starvis 2 Sensors
> > >
> > >  maintainers:
> > >    - Jai Luthra <jai.luthra@ideasonboard.com>
> > > @@ -13,21 +13,47 @@ maintainers:
> > >  description:
> > >    Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
> > >    image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
> >
> > You could rewrap this while at it.
> >
> > > +  It is part of the Starvis 2 family of sensors.
> > > +  Other members of the Starvis 2 have the same hardware requirements, and
> > > +  therefore share this binding.
> >
> > This paragraph could be rewrapped, too -- the limit is 80 characters per
> > line.
> 
> OK, I'll rephrase it so that it makes sense as one reflowed paragraph.
> 
> > >
> > >  allOf:
> > >    - $ref: /schemas/media/video-interface-devices.yaml#
> > >
> > >  properties:
> > >    compatible:
> > > -    items:
> > > -      - enum:
> > > -          - sony,imx678-aamr
> > > -          - sony,imx678-aaqr
> > > -      - const: sony,imx678
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - sony,imx585-aamj
> > > +              - sony,imx585-aaqj
> > > +          - const: sony,imx585
> > > +      - items:
> > > +          - enum:
> > > +              - sony,imx662-aamr
> > > +              - sony,imx662-aaqr
> > > +          - const: sony,imx662
> > > +      - items:
> > > +          - enum:
> > > +              - sony,imx675-aamr
> > > +              - sony,imx675-aaqr
> > > +          - const: sony,imx675
> > > +      - items:
> > > +          - enum:
> > > +              - sony,imx678-aamr
> > > +              - sony,imx678-aaqr
> > > +          - const: sony,imx678
> > > +      - items:
> > > +          - enum:
> > > +              - sony,imx832-amr
> > > +              - sony,imx832-aqr
> > > +          - const: sony,imx832
> >
> > Should we also have a sony,starvis2 compatible? Just wondering.
> 
> I deliberately didn't based on the discussions Jai had with DT
> maintainers when upstreaming the original binding [1], particularly
> Conor's comment:
> "Remember, having distinct multiple compatibles for the same hardware so
> that you can induce different software behaviour is not something we
> typically permit. While we do want to support all use cases, it isn't
> always the case that devicetree is the right place to do it."
> 
> Sorry, but when time is limited, IMHO debating dtbindings just isn't
> worth it. I've therefore taken the simple option.

The DT bindings are important to get right from the beginning, that's why I
asked. But I see this has been considered so I'm fine with it.

> 
> I do have patches that implement that compatible and fully autodetect
> the sensor[2], but I'll keep them downstream.
> Doing so means that we have one common overlay for connecting any of
> the supported Starvis2 sensors to a Pi.
> 
> [1] https://patchwork.linuxtv.org/project/linux-media/patch/20260520-imx678-v3-1-8b5f9676486e@ideasonboard.com/
> [2] Currently the top 2 commits on
> https://github.com/6by9/linux/tree/mainline_starvis2_v2, but that
> branch will get rebased/reworked.
> 
> > The driver isn't generic still as it requires sensor specific information
> > to be passed to it. CCS solves this with CCS static data (via firmware
> > loading mechanism) so there are no driver changes even if the capability
> > and limit information can't be obtained from device's registers or the
> > device requires MSRs.
> 
> I'm assuming you're referring to the patchset as a whole as I don't
> believe I've used the term generic in this patch. I'm happy to swap to
> "common Starvis 2 driver" where appropriate within the patchset
> instead.
> 
> IMHO Pushing the config to firmware files doesn't help, particularly
> as these sensors don't have a common ID register and so identification
> isn't trivial. It also makes life more involved for a distribution
> maintainer to ensure they're picking up the relevant files, and that's
> assuming that someone is curating them.
> 
> My aim with the series was to reuse as much common code as possible,
> rather than submitting 5 separate drivers which are identical other
> than constants and arrays of registers. Jai now has IMX676 working
> with this driver, so that would make it 6 variants. Refactoring to use
> a firmware file adds complexity for minimal gain, and you'd have to
> special case IMX678 so it worked without a firmware file to avoid
> regressions.
> 
> I guess the common core could be refactored to be a library, so that
> you could minimise module size by having the sensor specific config in
> a module that depends on the library. You're talking of saving a few
> kB uncompressed though, so that would be quite extreme. I'd be more
> tempted to have individual Kconfig entries and use #if
> IS_ENABLED(CONFIG_IMXxxx) to conditionally compile in the config to a
> common module.

Fair points. CCS was made to scale and obviously the number of Starvis 2
(or 3) sensors will be somewhat limited in any case. The identification
information could also be put to DT, that's something we should do for CCS
as some devices are simply missing the information.

While we can proceed with this approach I guess this is something to
consider in the future.

-- 
Regards,

Sakari Ailus
