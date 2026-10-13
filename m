Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7C539061C;
	Tue, 13 Oct 2026 12:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895819; cv=none; b=PXbKR/EX91Bkq5lPYU1KNheUJXLum7N4GJzv3UXPvSi0uQS1WWdz1cL6Ag9UPotVFcHm9KI8gJbl6Nm92ZsTbIIOX9x/ual0bNBaabm/4/9oZ5y0CCHEp+gtZ3z1ttulAA8iXyFMNclczEDhmuMAWWRz/fgMPP1AWEKtVL8gTR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895819; c=relaxed/simple;
	bh=depoyDI+kx+4ryylKY71m6Q7qJvtM7ohRhEWVjSSpgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQ4FA1vi5ClYemBFZzCeQxETSdYrDtOi8uPsMr741zKVDNBddLFpDRR7honiI2/s4p+4Pg9+VTmxaY6rNUzxL4gEGgcJm785p/JRtoVzOQZXe6GTRngq629ppZfs+5glmiCk3e/vEXif5VAuU8at4Ar09Ut/XqYGmjuD/mjaLUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=nmFIZ9/y; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="nmFIZ9/y"
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 30FC31FA7B;
	Tue, 13 Oct 2026 14:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791895815;
	bh=gIIe7Oi+djZ9XgtHUXw31H42TUuD0xP0hAFUDgxj2bU=; h=From:To:Subject;
	b=nmFIZ9/ygIVjsJ+MFJOliYWK15FxmtiHwLb1yir2UWXDHQzZe/lNhR6cCWLXfERX+
	 U/CU5C9Rb2PzY7pmzWpQrE1ub+62YmLDTzrO2r8tfszo/jPxbVgrfmWphOgxTp5ZMa
	 GhRh5Pq8he1TT12R4H40qzivyWsNTks5OKRZPiApYbXMNJGWQxg9Y56nX3Eo4kshJm
	 Mfvg4ANNyC8BVdagjE3Epp20tpDj33S2saBFU8AZ7n9OQlCSUhTcsvy39iR2U5QWMG
	 k+gyFjAMMA1+TXVvSJXU6wa6NwQ00y6uwcJPHNT7u78y2qAo+PdGoe9uc8DuDngorT
	 NXedGwmBcUUnw==
Date: Tue, 13 Oct 2026 14:50:12 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Leonardo Costa <leoreis.costa@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 0/3] Add VGA support for Apalis iMX6
Message-ID: <20261013125012.GB73534@francesco-nb>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
 <20261012164054.GA56180@killaraus.ideasonboard.com>
 <20261013090631.GA33628@francesco-nb>
 <20261013111158.GG56180@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013111158.GG56180@killaraus.ideasonboard.com>

On Tue, Oct 13, 2026 at 01:11:58PM +0200, Laurent Pinchart wrote:
> On Tue, Oct 13, 2026 at 11:06:31AM +0200, Francesco Dolcini wrote:
> > On Mon, Oct 12, 2026 at 06:40:54PM +0200, Laurent Pinchart wrote:
> > > On Mon, Oct 12, 2026 at 04:25:22AM -0300, Leonardo Costa wrote:
> > > > This series adds a device tree overlay that enables the VGA output on Apalis
> > > > iMX6, which is driven from a parallel RGB interface passing through a
> > > > non-programmable video DAC.
> > > > 
> > > > The video DAC is a simple resistor network gated by an active-low
> > > > data-enable signal. For the bridge to work properly, this series also
> > > > changes the following in the dt-bindings and simple-bridge driver:
> > > > 
> > > > - dt-bindings: Add a new compatible for the bridge in the simple-bridge
> > > >   binding. This is necessary because the existing dumb-vga-dac compatible
> > > >   doesn't describe a data-enable signal polarity.
> > > > 
> > > > - simple-bridge: Add the VGA bridge match-table entry and timings
> > > >   struct, setting the DRM_BUS_FLAG_DE_LOW flag for the bridge.
> > > 
> > > Is there schematics available anywhere ? That would help reviewing the
> > > series ?
> > 
> > This circuit is on the SoM, and the SoM schematics are
> > confidential and not generally available.
> > 
> > I tried to extract as ascii art the relevant circuit, hope it helps
> 
> Thank you, it makes things clearer.
> 
> The circuit seems fairly generic. Wouldn't it be better to add an
> optional property ot the dumb-vga-dac instead of a new compatible string
> specific to Apalis ?

We discussed this internally and we were not 100% sure, so we decided to
go with this proposal that seemed easier and less controversial.

With that wrote, I let Leonardo comment on the pro/cons of the two
approaches.

Francesco
