Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619168;
	b=Iw+erZpJauX2sollFMQx40Daen/55n8xHNzY3qK9AnHXcdANmzypNZ6xDY1e/Muk/jH2
	 3QsCCgh+hCw+psbOq48XXQyDH8V/zpOrs9IkiHDGO0vbYKZ2r842tyBsS3MBNpsDYmwCI
	 q/M6iTGWvZd98O4L5b51a0O79HF156PbVeRSMMzaSJiD+X5w7jZH3HiMSuZjmNeWjeaT9
	 HkbpAoTlVb9afIERADxN9ES5Lrc1D+PHtsAEzSfs5fiseehiVrdJPhX4BRLyGqCu6Uzj/
	 4r37X0LEpGJdpBxjCj2vI5uK1Fy7HtpNoOow+feuTivBVReE2oUi1MGol0cfCTXxsRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619168;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=9dqKRrfFGg+51GIVDQboPbf0ry89rz5bp1TrPxjcVJg=;
	b=X4fiFynzY60JtDn5UjiW2CxFFRq9NaZn2iWJocNWjITlG7eP6sqRSLgTduI7A/d7STqR
	 hqMwM1vC/v4fSqpOnbYqWlsKI4JnnNN4prJulz3BkCV3XInf9m8mlonjnahoZynR7qy94
	 UTjvQv5Xt9MG3t7Y97Uc7v7RPoH+ahS9W03ZtEogPjrIo/382mGKaiRb7sxZRzEfmnTKS
	 CtXhPQ9bAMXcyN66P/cjg0Hd5gB9Q3MtAURukYhu8HdzWzrlBd1Tb7bdAwIrQiTaBZdn/
	 riFa3cuyzFnMxvru7Kp+r82Bt42PpIRGX4YRUpRfg8TRiFsHablDvlh3LkDjd+8PjHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="RDTd/wG+";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D553606A31B;
	Wed, 21 Oct 2026 21:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D553606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=RDTd/wG+
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B29B222B;
	Wed, 21 Oct 2026 23:43:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792619035;
	bh=CFbNroF+MDRDj4J4znQgjUoh7M33r7h77T64ddF0ueM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RDTd/wG+bct1YVgG0jPkZV5ktcrRJn9Y5oWMlKi9y55aXUvDoFQTtlR4/BNdJe5O3
	 Kv1kpVzT7kWzrJ+VyYH43Ew5lcU8jWkNUVMcVImnXUsTxwuYBR9FqOglQ2299JxJd0
	 +ZwIfyN7JJmnz9otTXw/U/3DzLLk5xNMan9bxXGo=
Date: Thu, 22 Oct 2026 00:46:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 10/16] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
Message-ID: <20261021214601.GA170861@killaraus.ideasonboard.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntD2C-7UTKX2Srusn_Tzx5KS3tnUtPP+piMYbUKZP91Rpg@mail.gmail.com>

On Tue, Oct 20, 2026 at 03:39:52PM +0100, Dave Stevenson wrote:
> On Tue, 20 Oct 2026 at 11:07, Sakari Ailus wrote:
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

Once the raw sensor model gets merged, I want to explore creating
helpers for that. Most of the code in this "starvis2" driver is not
specific to Starvis 2 image sensors, or even to Sony image sensors. I
expect there will be room for refactoring and making writing drivers for
raw sensors much simpler.

In the meantime, a starvis2 driver seems fine to me, even if drawing a
boundary is difficult. Register sets for Sony sensors constantly evolve,
they're not really designed by family as far as I can see.

> > > +
> > >      description:
> > >        The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
> > >        variant (IMX678-AAMR). The variant-specific compatible describes the
> > >        exact sensor variant, with the generic IMX678 compatible as a fallback.
> > > +      The same applies for the other sensors in the family.
> > >
> > >    reg:
> > >      maxItems: 1
> > >

-- 
Regards,

Laurent Pinchart
