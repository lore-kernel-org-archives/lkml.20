Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B6544604F;
	Tue, 13 Oct 2026 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882945; cv=none; b=EBE7ZCs7lqlCSL6vSnxkBBpznfC3M518n9hdAerF1oktRSPfGpnCqJyZ93nppp5Uyu8cccNi5xcW+CIDBwxjoEkaivUvD4+oyB31NgJYSjv4VWlE//+r/ZHWvbt6dzvC6DgukDHHML7ajLWraejIM12u2fyO7HxjXCXYV2u6hOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882945; c=relaxed/simple;
	bh=NEtO12SozI8wYu0NAjegkTwSYT17nNJveVgrDVuMPxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiSF+97qXwtd5pIwkPG5MMWamq5RgPOsXcExrOvsijTw6NgnAhO/mqE+xfE78ml9g1T9QDFLCtMRSlBP+vMnQwHltH4APnyu0RPv6zWkywOkKrxjT6m2ZitwoMqJOtCazor6XAgXUYYo2yv7mjAGBmmQD4w86OtP0vwTgnj821o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=ntUHKu9m; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="ntUHKu9m"
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 955931F8BD;
	Tue, 13 Oct 2026 11:06:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791882396;
	bh=Orl7eWHVdHFy+WR+gD9uQiA0hr6q43qRIWv8DdjKbbM=; h=From:To:Subject;
	b=ntUHKu9mg7FGUcRTRomXe/QAChsiHB5hBkj3e0+P3of2MKQqsGccxGbo+PIHOVk7L
	 2SsEGB/kFXdXxGqL2WvX/jBdjhuDUew7i6ZTxEkvbDzG/+gyU1WiiEmkC5YwtC7aO/
	 OLxmM/be3SJ0fgnd0iMiV0V9dVPWXaem0HMi7OfAzthlZC8WfxhxHwpjRsA5kRaDTn
	 PV5VcPWmvCZ9U+9EIZUBt41GpfGXdf3LWjpml8XslO9PBiR56gyl07HqXjkleIF9SJ
	 atAU7Ncjo7FZeRswdyxCxHIJQtXG3khsubegJpd8A+ORztvDoTMpOUbgzorP65YYlX
	 QPUHZGjn1vyxw==
Date: Tue, 13 Oct 2026 11:06:31 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Leonardo Costa <leoreis.costa@gmail.com>,
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
Message-ID: <20261013090631.GA33628@francesco-nb>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
 <20261012164054.GA56180@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012164054.GA56180@killaraus.ideasonboard.com>

Hello Laurent,

On Mon, Oct 12, 2026 at 06:40:54PM +0200, Laurent Pinchart wrote:
> On Mon, Oct 12, 2026 at 04:25:22AM -0300, Leonardo Costa wrote:
> > This series adds a device tree overlay that enables the VGA output on Apalis
> > iMX6, which is driven from a parallel RGB interface passing through a
> > non-programmable video DAC.
> > 
> > The video DAC is a simple resistor network gated by an active-low
> > data-enable signal. For the bridge to work properly, this series also
> > changes the following in the dt-bindings and simple-bridge driver:
> > 
> > - dt-bindings: Add a new compatible for the bridge in the simple-bridge
> >   binding. This is necessary because the existing dumb-vga-dac compatible
> >   doesn't describe a data-enable signal polarity.
> > 
> > - simple-bridge: Add the VGA bridge match-table entry and timings
> >   struct, setting the DRM_BUS_FLAG_DE_LOW flag for the bridge.
> 
> Is there schematics available anywhere ? That would help reviewing the
> series ?

This circuit is on the SoM, and the SoM schematics are
confidential and not generally available.

I tried to extract as ascii art the relevant circuit, hope it helps

BLUE (5 bits)
=============
DISP0_DATA[4] ---[R30   348R]---+
DISP0_DATA[3] ---[R33   715R]---+
DISP0_DATA[2] ---[R36  1.47K]---+-------- VGA1_B
DISP0_DATA[1] ---[R39  2.94K]---+          |
DISP0_DATA[0] ---[R42  5.90K]---+          D
                                           |
DI0_PIN15 ------------------------------ G | T4 MMBF2201N
                                           S
                                           |
                                          GND


RED (5 bits)
============
DISP0_DATA[15] --[R31   348R]---+
DISP0_DATA[14] --[R34   715R]---+
DISP0_DATA[13] --[R37  1.47K]---+-------- VGA1_R
DISP0_DATA[12] --[R40  2.94K]---+          |
DISP0_DATA[11] --[R43  5.90K]---+          D
                                           |
DI0_PIN15 ------------------------------ G | T5 MMBF2201N
                                           S
                                           |
                                          GND


GREEN (6 bits)
==============
DISP0_DATA[10] --[R32   348R]---+
DISP0_DATA[9]  --[R35   715R]---+
DISP0_DATA[8]  --[R38  1.47K]---+
DISP0_DATA[7]  --[R41  2.94K]---+-------- VGA1_G
DISP0_DATA[6]  --[R44  5.90K]---+          |
DISP0_DATA[5]  --[R45  11.8K]---+          D
                                           |
DI0_PIN15 ------------------------------ G | T6 MMBF2201N
                                           S
                                           |
                                          GND



Francesco


