Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A7956E061;
	Tue, 22 Sep 2026 16:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096335; cv=none; b=BOc0U91Q/xozqHxgFofKh4Z4VqEWXvVN3cO8HjL30kU8vStb2rk+sFzBSrBGvMxrPIhTz+THGNXvJBFKChwolY94bI+ZrsnJOqVVGlcEpJ72nA+pqjKIGllKPF6s2Z7mCdiz5pms6TFpQEjlnW3FmxywWJtUpCnjzqRAdHuAHKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096335; c=relaxed/simple;
	bh=Dh3gVNvsShHLYZ2R3IBbPYFe236jglPvZeCVZsmWgmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qE0tpMLaz52+ciJLezeFdj9wI6qxt1xtSWIig2XiyQy67sqzUafdUbqYuM/LxYrjkI2rJSPH9uTTzMVHNu/tRermx1F1aEgg9OLN+e2dOH+LxSPdhmx5XY91UMQeu2E4efsugpDzCM/z7zFnb5qE8PON02AH6LQITzqiRzkdyS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Lzr3Wnjz; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Lzr3Wnjz"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0AA241F92A;
	Tue, 22 Sep 2026 18:58:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790096330;
	bh=epLKlfGDykDfXkk+Y0D/AaucwRf+XcEMpU10b13wknc=; h=From:To:Subject;
	b=Lzr3WnjzMEoqpcPP57y5SsFciig28SHwKyy+I6I+JDMjQoaef6jD15UUc8J1C7Br/
	 TMy/3GQIVQIrl/hTL65VS6e+OdSpjnBibdwoD+ctPBMHpOYJHFSJHkvbuwYU3ahAW8
	 3vgXewCPty8SG1LcqN8fEy1M5f6tfpGRURU6yzlglWVjqmWbFzd8nbT2jAXoTFeKRp
	 i21MRpZPpGSVssTEjR0rNi2iAqiRkl6MfCpBnHHa4syn5U9Iw8YePqJ/3WHj3K4r50
	 uDRo+tKf+gOtUABO/RGmJwfGtPTK9gLUhRDscWU1sE4NnX/5lfTWg+bc3bVVEv7a7R
	 cqxo4wUbYVVIw==
Date: Tue, 22 Sep 2026 18:58:46 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Toradex iMX95 overlays
Message-ID: <20260922165846.GA290956@francesco-nb>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
 <arKn0LhC5fty7dHN@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKn0LhC5fty7dHN@SMW015318>

On Tue, Sep 22, 2026 at 11:07:44AM -0500, Frank Li wrote:
> On Tue, Sep 22, 2026 at 04:33:45PM +0200, Ernest Van Hoecke wrote:
> > This series adds device tree overlays for the Toradex Verdin, Aquila,
> > and SMARC iMX95 SoMs.
> >
> > The series adds support for:
> > - NAU8822 Bridge Tied Load configuration on the Verdin Development Board
> > - UART_4 reservation for Cortex-M7 firmware on Verdin and Aquila
> > - SER0 reservation for Cortex-M7 firmware on SMARC
> >
> > The UART overlays mark the port as reserved so Linux does not claim it.
> > Firmware remains responsible for configuring the UART and its pads.
> >
> > The Makefile entries build standalone DTBOs and ready-to-use composed
> > DTBs for the corresponding Development Boards.
> >
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> > Ernest Van Hoecke (4):
> >       arm64: dts: freescale: imx95-verdin: Add NAU8822 Bridge Tied Load
> >       arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
> >       arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay
> 
> both reserved lpuart2, can you share one dtso?

The comment in the DT file must be different because it's important to
reference the actual board it applies to.

So to fulfill this request we would need to add a common dtsi, include
it from two different dtso files.

This to save 2 lines of duplicated code, `&lpuart2 { status = "reserved"; };`.

To me this is just worst than the current proposal.

Francesco


