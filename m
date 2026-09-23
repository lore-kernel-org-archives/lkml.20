Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C14B4718C1;
	Wed, 23 Sep 2026 08:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152895; cv=none; b=H7qR7vHdiyBsDRrIcjd6Ni7iwuQKnYH6BS7IvwQr+rz0J6Rmv983Py/8hgAlmAHM5at9AA9gNWB1cJDQV/XXpj4M1BZDWBtWpiqd20pdEMTwDxE5yM4LnxmAkQwTr1zih3M08Jr7rTynQDFtRg8D3Gu0Gx7hinafAdx58fIEFZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152895; c=relaxed/simple;
	bh=ypQGQvjSjQpWCnz9ZAZl9yxVAkoehH4BPQegTdsp+k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSfF1pMIhcpLpWauMvvMXHpG7yvED24HxiqSewmamZGWVIdRUbZDaMeSfVIyGFk40ZZ5It7gv4NbPBc7tFWLg+Obl4EiN16azdvncE5FK7Rs7Nfd29NlhsARH9agFF/gUq9XgR+MGqmRhZgD3Hk48Fn+GLkH311cVvJw8/UzaXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=x1Avj4a1; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="x1Avj4a1"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 23BB920183;
	Wed, 23 Sep 2026 10:41:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790152875;
	bh=8Y5i9c/b4TYc01Xqc0JU1jpnublj/HzO6uENI1sGzb8=; h=From:To:Subject;
	b=x1Avj4a12eFSUsPZsD1djDgeS5gYKxM7uCO0L1tgYjmDm03qNKjEzVZWwtJCH34uG
	 A1zYjTj+FzQvp0/7yWVtObnO1iPb4bbqijf/jnKCHFcbxdDQjjUtlcm9lu/N9waqJn
	 tEftFjnNDitFws9DIcL23vqjkWqINbkWG28+vtQiArhGeG3lb1o+vRO6NbhogTx0L1
	 M7yxvtuIFX21K5+orZtH651vLCXuVG0HpWUaY47CfgJ32CWxIV1LxMARlqC115c8n0
	 WYDZv4LjfyMSYlb9FkIW8cojL1CB/xr9JcjAHKDiKXez9We0kfFtilST/qqpM0XT+A
	 BeUMWexYWafCA==
Date: Wed, 23 Sep 2026 10:41:11 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Toradex iMX95 overlays
Message-ID: <20260923084111.GA460930@francesco-nb>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
 <arKn0LhC5fty7dHN@SMW015318>
 <20260922165846.GA290956@francesco-nb>
 <arLJl3jyyytfS_Qw@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arLJl3jyyytfS_Qw@SMW015318>

Hello Frank,

On Tue, Sep 22, 2026 at 01:31:51PM -0500, Frank Li wrote:
> On Tue, Sep 22, 2026 at 06:58:46PM +0200, Francesco Dolcini wrote:
> > On Tue, Sep 22, 2026 at 11:07:44AM -0500, Frank Li wrote:
> > > On Tue, Sep 22, 2026 at 04:33:45PM +0200, Ernest Van Hoecke wrote:
> > > > This series adds device tree overlays for the Toradex Verdin, Aquila,
> > > > and SMARC iMX95 SoMs.
> > > >
> > > > The series adds support for:
> > > > - NAU8822 Bridge Tied Load configuration on the Verdin Development Board
> > > > - UART_4 reservation for Cortex-M7 firmware on Verdin and Aquila
> > > > - SER0 reservation for Cortex-M7 firmware on SMARC
> > > >
> > > > The UART overlays mark the port as reserved so Linux does not claim it.
> > > > Firmware remains responsible for configuring the UART and its pads.
> > > >
> > > > The Makefile entries build standalone DTBOs and ready-to-use composed
> > > > DTBs for the corresponding Development Boards.
> > > >
> > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > ---
> > > > Ernest Van Hoecke (4):
> > > >       arm64: dts: freescale: imx95-verdin: Add NAU8822 Bridge Tied Load
> > > >       arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
> > > >       arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay
> > >
> > > both reserved lpuart2, can you share one dtso?
> >
> > The comment in the DT file must be different because it's important to
> > reference the actual board it applies to.
> >
> > So to fulfill this request we would need to add a common dtsi, include
> > it from two different dtso files.
> 
> No, direct use one dtso. see
> 
> https://elixir.bootlin.com/linux/v7.3-rc3/source/arch/arm64/boot/dts/freescale/imx-pcie0-ep.dtso
> 
> And makefile to check how apply the same dtso for difference boards

imx-pcie0-ep.dtso works as a single shared file because its content is
generic, there is no board name anywhere in it, and nobody needs to
apply that specific dtbo by hand to know what it is for.

These overlays are different: they are meant to be picked up and applied
directly by the end user, in addition to also being combined in-tree
into a ready DTB. Put yourself in that user's shoes: they have a Verdin
board, they want to free up UART_4 for their Cortex-M7 firmware, and
they go looking in arch/arm64/boot/dts/freescale/ for the overlay that
does that for their board. What they need at that point is a file name
that says "this is for Verdin" and "this is the UART_4 one", and once
they open it, a comment that confirms both: which board and which
specific UART. That is the whole point of shipping the overlay
separately from a combined DTB: it is meant to be readable and
applicable on its own by someone who is not a DT expert.

There is also a second, even more constrained user: the one who never
looks at the kernel sources at all, and only gets the compiled .dtbo as
deployed on their distribution, e.g. under /boot/overlays/ on the
target, or the more generic paths used by distributions like Debian
(/boot/firmware/overlays/) or Armbian (user_overlays= in
armbianEnv.txt), picking it by name from an overlay list or a U-Boot
env variable. Comments do not survive dtc compilation, so for that user
the file name is the only information available, there is no comment to
fall back on.

A single dtso shared between Verdin and Aquila fails that on both
counts: the name has to become something generic like
imx95-verdin-aquila-uart4-mcu.dtso (immediately confusing: which board
is it really for? can I use it on either?), and the comment inside can
no longer say which board it targets either. That is worse for the
person using it, for the sake of avoiding 2 lines of duplication:

  &lpuart2 {
  	status = "reserved";
  };

It also does not reduce the Makefile churn: we need the same number of
Makefile lines/combos either way, one dtso reused for two boards or two
dedicated ones. And this file will not change once merged, so there is
no maintenance overhead from keeping it per board.

We agree that avoiding duplication is generally the right call. When
there is real, growing duplication across dtso files, the right fix is
a shared dtsi included by the dtso files, not merging them into one. In
this case the duplication is 2 lines that will not change, so it does
not meet that bar either way.

We would like to keep the two dedicated dtso files.

Francesco
