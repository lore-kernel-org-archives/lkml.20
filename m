Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8533DA5C7;
	Wed, 16 Sep 2026 11:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559046; cv=none; b=XL0vi3FIMPy4fUY+XOczBOTLHsgb24pl/3OEJJg0+wio+e/jCyM+4ZqwnWtNCywu3Ur7FB9bSQngtl2XqU1mQcSaJTywOBqzIvKkM8IPc8IEx1Nt9GxEZOfluRSujPlBh7mDGSTxOL3taaeha5ySvwmY6Qjky/VzOCk4fAw+bDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559046; c=relaxed/simple;
	bh=6D2RhALlT55aAHSMPinPZ97+aBQfokN4Sc7vz60gKIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eu75kDKhhvJdd6IxORzJGPFYSGx4IluoKTdOMOf+nTKm+NFc32u7byKifiMSre8VPE/s1+iPfyEUstVjUBGuwInHBeUJfEcaUNOy0/czoNi2MoljQftIQlXu07UtDvmrxYpYm9DUvZDIY3jEi+7QueOOEtPfV87EG2GLjNaHWXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=iGnsgwB1; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="iGnsgwB1"
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 9B7621F822;
	Wed, 16 Sep 2026 13:43:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789559032;
	bh=cUpSAShM1iFVA9tQq7QEj0VN9vBy+vZF0uG3dEujTMA=; h=From:To:Subject;
	b=iGnsgwB1t8BQiAyma9+PcqCCNUQ9kO/L0seDWZDZH+D/kRhX3fW9nyl42r81Xwv5S
	 gN7DtrHKezx9zkqKAUoa5LZknZ/J+RlZNghUtueWC0RVf17cR7HlEsLg42SUaPmxTQ
	 P5w+CKq/cAbAM1d80+SNuHyccsYQCHEYF9IYBlxkgyz/i76jI4qKH6tgNjbP2Yl25Q
	 KfBTudr6/BAMpKGPLwip98RsojigAteaPIjhQoQ+w+Gl26cO1qOzTput1VECqE4Y0+
	 8mUFyTlWf5lCARIja/AQi+Bts2B8zln5XJjQj8I+6/Xu1IsgXy63Xc5XWrCG73ggJe
	 cGenXn2sstU3A==
Date: Wed, 16 Sep 2026 13:43:50 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v4 2/4] drm: mxsfb: Add optional DPI output bus-width
 configuration
Message-ID: <20260916114350.GB284106@francesco-nb>
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-3-francesco@dolcini.it>
 <178954813309.214898.6895255097019153080.b4-review@b4>
 <20260916091543.GA277833@francesco-nb>
 <DLGP7GKZJBOP.350QK94UOGRYV@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLGP7GKZJBOP.350QK94UOGRYV@bootlin.com>

On Wed, Sep 16, 2026 at 01:19:08PM +0200, Luca Ceresoli wrote:
> On Wed Sep 16, 2026 at 11:15 AM CEST, Francesco Dolcini wrote:
> > Hello Luca,
> >
> > On Wed, Sep 16, 2026 at 10:42:13AM +0200, Luca Ceresoli wrote:
> >> > LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format. The
> >> > format reported by the downstream panel or bridge describes the display
> >> > input, but it does not describe how the LCDIF data pins are physically
> >> > wired on the board.
> >> >
> >> > These can differ. For example, a 16-bit LCDIF bus can be connected to a
> >> > 24-bit display by wiring the available color bits to the corresponding
> >> > display inputs. In that case, using the display's 24-bit format to
> >> > configure LCDIF selects the wrong data-bus mode and changes the assignment
> >> > of color bits on the LCD_DATA pins.
> >> >
> >> > Read the optional bus-width endpoint property from the LCDIF output port
> >> > and use it to select the media bus format used to configure LCDIF. This
> >> > allows the LCDIF bus mode to describe the physical interface
> >> > independently of the downstream display format.
> >> >
> >> > When the optional property is absent, or it has an invalid value, continue
> >> > using the format reported by the downstream display device, preserving
> >> > the existing behavior. The code is not validating the DT for
> >> > correctness and just fall back to the previous behavior in case of
> >> > errors.
> >>
> >> Why? Generally speaking errors are better spotted immediately, not ignored
> >> silently.
> >
> > My understanding is that the C driver code should not validate the DT
> > and that this is the general recommendation when parsing properties from
> > the DT.
> >
> > The DT checker is going to spot errors in the DT even earlier and in a
> > static way.
> 
> Drivers typically check for invalid values.
> 
> And people writing their private dts can do mistakes and not run the static
> checks. Bad on their side, sure, but having a runtime error would be useful
> there.

Understood. I would personally not do it. I can add the required error
checking code. No other DRM maintainer/reviewer commented so far, so I
am taking this as a request.

What should I do in case there is an invalid value? Fail or have a
warning message?

> Also consider potential regressions. Say someone has an invalid value in
> their product, say bus-width = <15>, which works because the default 18
> which gets used as a fallback happens to be the correct value for their
> hardware. Some years later we implement the new bus-width = <15>, and then
> that user upgrades to a newer kernel and their display won't work because
> it will start using that incorrect bus-witch = <15>. Better stopping this
> before it starts, IMO.

I do not see this situation honestly, if you have a wrong value, e.g. 15
bits, before this patch is ignored, and after this patch is also
ignored ...

The default in the code is equivalent to the bus-width property not
present, and therefore we use whatever is coming from the panel aka the
next bridge.

Francesco

