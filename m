Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018616;
	b=ksHblVb/UYIbzoQCobiMM520EapQc0FU/h5a3idiDQzd400VGyBgChJq9N9W+1UjI0uI
	 Tof5lml+YASM6ah6gOF/zcs0Hegil8qSn6krW6B9qOu7oz4uT3sncy0eWfm8so//R3u45
	 s3l1EobK5TBaHzluC6ZdcUL1mKdHmzjsDetbRLvPEK/jZzXSMBbHIZxEg9TY3+RQT4Btc
	 /XmmfhXztAPoOoplDFfDeut3dYqA6bYaZ/sBbmd/k8DXAn1mXN8EZx7lIwj3mXaOgTrEu
	 8+taQSTdEdo7DUTPvrZ2da9RXR4wmD9a8JsFk/VNCbrqdHidZdjAkJhVRHI9FUjjpAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018616;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=8Jq41rEZlW8dpYSa9haaT2V6LwzTgLLlt9p+Cr4IhUw=;
	b=uPXiewQWiywy5huY3VHAQBGcE+hqCK+dzu66wwGe+tv4lM6xmY4wsVaSCuLMlAimoY3q
	 cwQ9wXNKd3EzRkohjW1bxOQ5+qbhbYs3icEsovY7KMtQV7hOlSvNnDH/ks88geyrfYfMW
	 v73MCuXQdexm8ASHVcjYMgj0VEpRAihacJFCIFewBbnZM3QzwF9tazmwS83CUtx1iYSRj
	 vryBdINamy6McdXshojLnZ9oicCIHoiUcJ3FVoaJIF6JCqDTF4ekpTvLu42j4I4yS+aNS
	 Bdq1V964lB8vv3+9hkx/ZM1Ml2xfVEDjo5IIpdwKvfSW2nWfyPbryvw7DCqR8P0FJgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=c0j25kco;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF4E606A31B;
	Mon, 26 Oct 2026 12:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF4E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=c0j25kco
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id C19941F973;
	Mon, 26 Oct 2026 13:43:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1793018612;
	bh=8Jq41rEZlW8dpYSa9haaT2V6LwzTgLLlt9p+Cr4IhUw=; h=From:To:Subject;
	b=c0j25kcozqWxHZK8k4lBZiOqMKsEnvOVVj0qHrqrR5JU1hPOJdPXOnBp59eFFHruV
	 7xPUxXwmDCu4kK4gP0UOBk0fNhZop+bAQKW6xBjFmAsIWAXfguyWbP/hYY9cKcb/oA
	 jo6AqaoPi3wOtfZh2E9jY4j6/jBdwqEEAjBHhW07kuoP5L2zA2Jr2bCN6pbpmvv/8V
	 vzt0BgOaUCSuqefPmlAOG/DIhcDrqoM27vAJecaG4SjGUW8EhswlMYUVhfHY+48mys
	 yylU3vezcoKyrdCeUbqQ6Z6NeLulsM+7faYDOB4wt0RZffywk8+1CYXGilqIJQV2GB
	 T4scWNfIGgZGA==
Date: Mon, 26 Oct 2026 13:43:28 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
Message-ID: <20261026124328.GA82443@francesco-nb>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
 <atZxhWaUWthEHkti@SMW015318>
 <lozimedmt3h7v6odvp4svvmatvk7726a4ztn3j7ft44oto7p5p@dmrudrmzyz3s>
 <ateQWqoTtXSBSBvm@SMW015318>
 <wancrsxcem5uep5oy5pnw5prewefqah7drmhiu5wrq3ctykltl@akwvtqbebblb>
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
In-Reply-To: <wancrsxcem5uep5oy5pnw5prewefqah7drmhiu5wrq3ctykltl@akwvtqbebblb>

On Mon, Oct 26, 2026 at 09:25:20AM -0300, Leonardo Costa wrote:
> Hi Frank,
> 
> On Tue, Oct 20, 2026 at 11:01:30AM -0500, Frank Li wrote:
> > On Tue, Oct 20, 2026 at 07:33:10AM -0300, Leonardo Costa wrote:
> > > On Mon, Oct 19, 2026 at 02:37:41PM -0500, Frank Li wrote:
> > > > On Mon, Oct 19, 2026 at 07:17:16AM -0300, Leonardo Costa wrote:
> > > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > > >
> > > > > Add a device tree overlay for the VGA output available on the Apalis
> > > > > Evaluation Board, which is driven from a parallel RGB interface passing
> > > > > through a non-programmable video DAC to a VGA connector, without VESA
> > > > > DDC I2C signals.
> > > > >
> > > > > The non-programmable video DAC consists of a simple resistor ladder that
> > > > > converts the digital 16-bit RGB signal to VGA. The VGA output is gated by
> > > > > an active-low data-enable signal.
> > > > >
> > > > > The overlay is also combined with the various Apalis Evaluation Board
> > > > > device trees to provide ready-to-use DTBs.
> > > > >
> > > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > ---
> > > > >  arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
> > > > >  .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 80 ++++++++++++++++++++++
> > > >
> > > > what's difference with
> > > >
> > > > https://lore.kernel.org/imx/20261019-colibri-imx6-overlays-v1-5-e4d028727382@toradex.com/T/#u
> > > >
> > > > Is it possible share one dtso also?
> > > >
> > > > Frank
> > >
> > > Hi Frank,
> > >
> > > The Apalis iMX6 one needs to set up the connection between the IPU the
> > > LCD interface (endpoints ipu2_di0_disp0 and vga_display_in), and the
> > > Colibri iMX6 one uses a DVI connector instead of a VGA one. Most of all,
> > > the bridge on the Colibri iMX6 doesn't have any control signals, while
> > > this one on the Apalis iMX6 has an active-low data-enable signal
> > 
> > This make sense to use difference dtso to cover it. Is it use name
> > imx6q-ipu-di0-vga.dtso, because this dtso have not boards specific part,
> > which can reuse for other similar hardware? Or we can rename it when reuse
> > happen.
> 
> I think the overlay should be kept as imx6q-apalis-eval-vga.dtso. As it
> currently is, it's easy to identify the hardware it may be used with. If
> another board is added which uses the same interface in this same way,
> we can evaluate if it's adequate to change names for reusability.

2 more cents. There is no such other board in the toradex portfolio and
it's very unlikely we are going to build any new board with an old VGA
interface.

Francesco



