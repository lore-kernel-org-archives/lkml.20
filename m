Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24753B7776;
	Wed, 16 Sep 2026 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550164; cv=none; b=RDaAZ9pLbMkVjjQYEQgAnKh3Fsa9gXKInvZH7ZWc1b3+nVIXnVrqaPbVmOeqDv4CWfpJ5da119ZLVN8E+6cSOAuji89Ct1rsfKT9AybZepu+Ap9q83xR4nuueGs/d/GOsVV5XXzMC0g9YetY0bmrgt+Ve6nSND6uRThn4DaYBiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550164; c=relaxed/simple;
	bh=c34GSgy5JOkK4UMrE2wUaVf4M5Ni7ABqZ5336+rOAaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcsMTpMfyEAgFTahl0ZdX92ziRQ10lSfcmdRByvTMkJ4RA8DmQ5GL/ZDa01xxXuXqa7OiqqZE5I6lOeh1LvIJuDMvQbjbriDyy0yQkanxKWWiCZYazEqxJcWTIbrhZeicy1uHDN2BHKLfWYG9bE5LOLuy9WBsUSUlEQMqcKO2lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=U0/lzjnB; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="U0/lzjnB"
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 66C7D1FE13;
	Wed, 16 Sep 2026 11:15:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789550148;
	bh=Xwi7DtOdh8cz6NAAVdmMuae3cwJa2QJyIgQkDwWYJPI=; h=From:To:Subject;
	b=U0/lzjnBYBNvqGbteRws8o/FtLbdIxR2H6RirMT7BFLLD33MXiQ21m2FAV2M4/wNK
	 3mtozjvKrsjY+G4iWWFJ/ktPzPynWGLtNSVrNR5tVdw7Ujgp9vjw/PaPLGLcEtgJSN
	 K+120Uqucz/5Y9wmumq5QvpCHYYoHNYreYTAtfqCLyar2fFtkqeGT6GSmhPybX5L5k
	 bA39OFwnOh9Pw6gZF+LwexIacmFc+T8ApCdIa2lTZ5mz2em0v+6DhswgD39qjp9Qiw
	 R7LulM0HrkY8qBuQ9deqmCQ9FU27//UEWVEVCj4zaD/00hNs/HGDUmkiAOIsI/gsnt
	 vA2N+KAGn7Npw==
Date: Wed, 16 Sep 2026 11:15:43 +0200
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
Message-ID: <20260916091543.GA277833@francesco-nb>
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-3-francesco@dolcini.it>
 <178954813309.214898.6895255097019153080.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178954813309.214898.6895255097019153080.b4-review@b4>

Hello Luca,

On Wed, Sep 16, 2026 at 10:42:13AM +0200, Luca Ceresoli wrote:
> > LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format. The
> > format reported by the downstream panel or bridge describes the display
> > input, but it does not describe how the LCDIF data pins are physically
> > wired on the board.
> >
> > These can differ. For example, a 16-bit LCDIF bus can be connected to a
> > 24-bit display by wiring the available color bits to the corresponding
> > display inputs. In that case, using the display's 24-bit format to
> > configure LCDIF selects the wrong data-bus mode and changes the assignment
> > of color bits on the LCD_DATA pins.
> >
> > Read the optional bus-width endpoint property from the LCDIF output port
> > and use it to select the media bus format used to configure LCDIF. This
> > allows the LCDIF bus mode to describe the physical interface
> > independently of the downstream display format.
> >
> > When the optional property is absent, or it has an invalid value, continue
> > using the format reported by the downstream display device, preserving
> > the existing behavior. The code is not validating the DT for
> > correctness and just fall back to the previous behavior in case of
> > errors.
> 
> Why? Generally speaking errors are better spotted immediately, not ignored
> silently.

My understanding is that the C driver code should not validate the DT
and that this is the general recommendation when parsing properties from
the DT.

The DT checker is going to spot errors in the DT even earlier and in a
static way.

So the decision is to just fall-back to the previous driver behavior
when this property was not supported at all.

Francesco

