Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C31D46EF64;
	Fri, 25 Sep 2026 11:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337525; cv=none; b=SoSIyCSTBPem275BhMZq6e6pA/4GOGXpTIH0yZK9jHqP5OYCg0ck3e5sfUNLe8N5M6gOIxm33iPsXzaVRWX4RW9W3pDmH71TcA2szjzMUjDR3khuhkXO7yRlLU4Vb9wtyAxPe47Hrvb/255TMiilAWuE2LzImblRHzMehxMxCio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337525; c=relaxed/simple;
	bh=hTbBWgRszq9ScA6H2Snmf/3kW+YO4cqGk/yT0SbRa/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQm+i7TS03MaTdsrjE10TIT3fsNCJuFBc/PRfZrMUFVPTOQZ/GG6Qsf7f+pqvBy+2tilVSOJVnnINeSPlNZTnPt/0i17jOpIIUVobu/Of9uzauOhU/fwvs5jyGV5AMLYUONC6Xh/EXgGA3takMMC9XwQm6un7I+xm9wIDdgM7WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Em87CarA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Em87CarA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225451F000FF;
	Fri, 25 Sep 2026 11:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790337521;
	bh=i++aeiwkX5qCkyfP2sYNezlmPhBYAeBC7if6vewcr7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Em87CarAuF/uh4LnbTroxQKzJScL78hqmC6g/z4IWkD+Imd+NHq25I5v1Cco2JA/o
	 FnZBOGlf753Tc4x3asT3ID+TMBwUI0q9uY1Cfy68IbI/39ELe/w+kipZnz1epPwHsi
	 jOwPzCmagHFq6tMnPYmb79xWl/tA+MfiEXAD3jIn78TfOKX7Uy2Wq/3knLU+ZrwyIv
	 josmf812wU03Up3nVP+FaOPKt++n+Afx3moLfGIS/2xSPO+dIaagWUOmNfwIHF+0AL
	 5NPpM4DlDD1nmQ9JwPzJ+goS97g3kbdBSbmhoo4tYBZuDbNUEPaWjZcRX5SaM8Rtfz
	 bJdxybvlMuteg==
Date: Fri, 25 Sep 2026 06:58:39 -0500
From: Rob Herring <robh@kernel.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Frank Li <Frank.li@oss.nxp.com>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
Message-ID: <20260925115839.GA677989-robh@kernel.org>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
 <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
 <aqLaLmz7n31P6igy@SMW015318>
 <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb>
 <aqLif2zrrsbYd5sM@SMW015318>
 <aqLk5UAv-j39Jxd3@francesco-nb>
 <20260918192447.GB1465432-robh@kernel.org>
 <178981707848.1761404.17065871878122418287@ping.linuxembedded.co.uk>
 <arDZoulyKIzVj-73@francesco-nb>
 <179023382707.1723501.12070631258057963152@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179023382707.1723501.12070631258057963152@ping.linuxembedded.co.uk>

On Thu, Sep 24, 2026 at 08:10:27AM +0100, Kieran Bingham wrote:
> Hi Francesco,
> 
> Quoting Francesco Dolcini (2026-09-21 08:15:46)
> > Hello Kieran,
> > 
> > On Sat, Sep 19, 2026 at 12:24:38PM +0100, Kieran Bingham wrote:
> > > Quoting Rob Herring (2026-09-18 20:24:47)
> > > > On Thu, Sep 10, 2026 at 07:12:05PM +0200, Francesco Dolcini wrote:
> > > > > On Thu, Sep 10, 2026 at 12:01:51PM -0500, Frank Li wrote:
> > > > > > On Thu, Sep 10, 2026 at 06:39:30PM +0200, Ernest Van Hoecke wrote:
> > > > > > > Hi Frank,
> > > > > > >
> > > > > > > Thanks for reviewing this so quickly.
> > > > > > >
> > > > > > > On Thu, Sep 10, 2026 at 11:26:22AM -0500, Frank Li wrote:
> > > > > > > > On Thu, Sep 10, 2026 at 05:37:59PM +0200, Ernest Van Hoecke wrote:
> > > > > > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > > >
> > > > > > > > > Toradex boards route the sideband signals of their 24-pin camera
> > > > > > > > > connectors to different GPIO controllers. Camera overlays which name
> > > > > > > > > those controllers directly must therefore be duplicated for each host
> > > > > > > > > board.
> > > > > > > > >
> > > > > > > > > Describe reset, power-down, detection and power-control as
> > > > > > > > > connector-local GPIO functions. This lets an accessory overlay remain
> > > > > > > > > independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> > > > > > > > > remain described separately because the GPIO nexus does not abstract
> > > > > > > > > them.
> 
> Will it be possible to extend this to add the mapping for MIPI data and
> clock lanes and regulator supplies?
> 
> I.e. does this do anything that would push us down a hole that stops us
> mapping those signals?
> 
> What do we need to do next to be able to map I2C/CSI/Regulators through
> a 'nexus' ?

A nexus only works on certain bindings. I2C is a bus and has child 
nodes, so it needs something different. CSI works using the graph 
binding, so we'd have to make the graph work thru the connector. Every 
binding has to be figured out.

Rob
