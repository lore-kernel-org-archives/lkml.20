Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9D551D533;
	Fri, 18 Sep 2026 19:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789759494; cv=none; b=eSgsVWKmXvI8WrjWL3b7hfYw+5bR94VLmKXe22PZrSjfX072wQq1sXBX7zEiUZQ2nirwZn/MUjts8Ls2mkSJcfsTS2fe3QBLjMdsxIlsydyc3jdA+CZa6zKGlloWiIMFpk+8zNoelAYlQDEUNSM941bOfFgIrBXPbWD3T6Bzdfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789759494; c=relaxed/simple;
	bh=Zd0QGn6EczAAvO+K5gHWq2fXZsgdRYOjqY5dwru86M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWJVq0SxfdGwycXs5Z8/qtpzE/GDlP9qepGMzy0xm0T1EbRIQxgTvrrlDzVnHWR5TU5mResJbBDiphDmLUX2hmY/h2q6KXeuDitofL6vEdbfNt/ZwcikWy0qpoZ5txR4BvyNqnAf3FnXA+vfmA5vDdZDwf0nsQ3L4peFUbfkNUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHDAEFAY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHDAEFAY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714661F000FF;
	Fri, 18 Sep 2026 19:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789759489;
	bh=gy1Wl0a02dtKqoPAdsnYPm6lkMH+/UnovXEG/AvYxwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CHDAEFAYp99cG7ALHJHxabBHBvYu4ZolmiftDgQyss+yGWBLqV6LMkFJYjcXxQzJu
	 MOZ8u7D0fBuJpAaAZB8myh0eXutu1FOIHkKj3typrQKAe1acMIwHU47CTNmHq67Q+1
	 gW+ij/xXY4rICSZ9pYarlfCD0dugav+2Rq9O4EeDvWT0zbOXQt8wM4StWno1dcs8Rg
	 yVsRcV7Ezj1zRAZe7Io36sir3IWZtMcOOcLoTOBIUltZbo/psJU9fdcowX90YiFmQk
	 gQExKNijGvWdFM8oWzfHTPKlRfVjw3FHrIMT9VfLCAiKkiUBkC8BYd8nfCWau8g75j
	 LjOCQffvcSW4Q==
Date: Fri, 18 Sep 2026 14:24:47 -0500
From: Rob Herring <robh@kernel.org>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
Message-ID: <20260918192447.GB1465432-robh@kernel.org>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
 <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
 <aqLaLmz7n31P6igy@SMW015318>
 <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb>
 <aqLif2zrrsbYd5sM@SMW015318>
 <aqLk5UAv-j39Jxd3@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqLk5UAv-j39Jxd3@francesco-nb>

On Thu, Sep 10, 2026 at 07:12:05PM +0200, Francesco Dolcini wrote:
> On Thu, Sep 10, 2026 at 12:01:51PM -0500, Frank Li wrote:
> > On Thu, Sep 10, 2026 at 06:39:30PM +0200, Ernest Van Hoecke wrote:
> > > Hi Frank,
> > >
> > > Thanks for reviewing this so quickly.
> > >
> > > On Thu, Sep 10, 2026 at 11:26:22AM -0500, Frank Li wrote:
> > > > On Thu, Sep 10, 2026 at 05:37:59PM +0200, Ernest Van Hoecke wrote:
> > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > >
> > > > > Toradex boards route the sideband signals of their 24-pin camera
> > > > > connectors to different GPIO controllers. Camera overlays which name
> > > > > those controllers directly must therefore be duplicated for each host
> > > > > board.
> > > > >
> > > > > Describe reset, power-down, detection and power-control as
> > > > > connector-local GPIO functions. This lets an accessory overlay remain
> > > > > independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> > > > > remain described separately because the GPIO nexus does not abstract
> > > > > them.
> > > > >
> > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > ---
> > > > >  .../connector/toradex,camera-connector.yaml        | 86 ++++++++++++++++++++++
> > > > >  1 file changed, 86 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..06e6836e1aa6
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> > > > > @@ -0,0 +1,86 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/base.yaml#
> > > > > +
> > > > > +title: Toradex camera connector GPIO nexus
> > > > > +
> > > > > +maintainers:
> > > > > +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> > > > > +
> > > > > +description: |
> > > > > +  Toradex boards provide 24-pin camera connectors carrying MIPI CSI-2, I2C,
> > > > > +  clock, power, and sideband GPIO signals. This binding describes the sideband
> > > > > +  signals as a GPIO nexus. The other connector resources remain described by
> > > > > +  the surrounding board device tree.
> > > > > +
> > > > > +  The nexus exposes connector-local GPIO function numbers to camera overlays
> > > > > +  and maps the functions wired by a carrier board to their GPIO controllers.
> > > > > +  GPIO specifiers contain a function number followed by standard GPIO flags.
> > > > > +  A board may omit functions which it does not wire.
> > > > > +
> > > > > +  The function numbers are:
> > > > > +    - 0: Camera reset, connector pin 11
> > > > > +    - 1: Camera power-down, connector pin 22
> > > > > +    - 2: Camera identification, connector pin 23
> > > > > +    - 3: Camera power control, connector pin 24
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: toradex,camera-connector
> > > >
> > > > Name is too generally, suggest use board name, we got similar comments at
> > > >
> > > > https://lore.kernel.org/imx/20260629074734.3643227-2-chancel.liu@oss.nxp.com/
> > >
> > > I saw that and it made me reconsider this name.
> > >
> > > However, I believe that in our case it is specific enough. It is really
> > > the same on all our carrier boards, and Toradex specific. It's also only
> > > for cameras, which is more defined than just "io". Curious to see if
> > > others agree or if we should come up with a name for this.
> > 
> > If some days later, you update hardware connector to 30pin from 24pins.
> 
> That connector is there since years, not days.
> 
> We have multiple cameras, designed to mate with it.
> 
> If tomorrow we will define a new camera connector (that is absolutely
> possible), the new connector will get its name, maybe
> toradex,camera-connector-v2, or toradex,camera-connector-22pin or
> whatever that connector would be named, not just in the DT, but also as
> a product and on the actual HW.

I for one hate 'v2' naming.

I agree the name seems a bit generic, but if you really can't come up 
with something better, then fine. The next connector name just has to be 
something different.

Rob
