Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BB34B95C0;
	Tue, 13 Oct 2026 11:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889933; cv=none; b=tn7i6PvHauuaYV1uTeOvC9EZZ1U9jIl8BHCkCFPeFDUepyx4gMhjSb0mqymEjLs2a0mLyOp2faHHN4xdtQGry3DT/T6qkR2VXjGwX0Mz79zAmChJQvt4ly2VRAlnE8CaSAhajb9SVoMrxGijzZZkH1SOy7+6GsUQOOwBOxf0AaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889933; c=relaxed/simple;
	bh=TLb9LXej9xG19WtKDwfE0UKEiJVXsGn15ErYlOXigNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEzSpnaNJq6FTNWKtflsGk6qB8mjLkAkZUAWnTbckYo+o/xJ02+JsuxIiFiGF1lnmD9RBTIotsAOvwv8b5bP85KXO8vyyvu1E/pE3ONH3W4wDgvbGXstzuyuS41w4xnbhVTzZ6+g9LiBbAjuGgj01dM/956R61UC43Q+qQfoYco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TlB8Bi30; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TlB8Bi30"
Received: from killaraus.ideasonboard.com (unknown [185.104.138.147])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3259BC;
	Tue, 13 Oct 2026 13:10:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791889807;
	bh=TLb9LXej9xG19WtKDwfE0UKEiJVXsGn15ErYlOXigNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TlB8Bi30S5ri9HBtUHlzY6zY08CIHKtIIbBSKb5dt3zziN/pA8ByDTu5OVF15NSXn
	 4xX7plyX8+U+sKzluFZfMATxaCJc0e/z0jlrmKi5bA3n8XANXoMWrPozvIdfIiMT60
	 g+KdWAYoNwARwKCbEJ7Ue5TdERCKx0zSHWA4Wlas=
Date: Tue, 13 Oct 2026 13:11:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Francesco Dolcini <francesco@dolcini.it>
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
Message-ID: <20261013111158.GG56180@killaraus.ideasonboard.com>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
 <20261012164054.GA56180@killaraus.ideasonboard.com>
 <20261013090631.GA33628@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013090631.GA33628@francesco-nb>

Hi Francesco,

On Tue, Oct 13, 2026 at 11:06:31AM +0200, Francesco Dolcini wrote:
> On Mon, Oct 12, 2026 at 06:40:54PM +0200, Laurent Pinchart wrote:
> > On Mon, Oct 12, 2026 at 04:25:22AM -0300, Leonardo Costa wrote:
> > > This series adds a device tree overlay that enables the VGA output on Apalis
> > > iMX6, which is driven from a parallel RGB interface passing through a
> > > non-programmable video DAC.
> > > 
> > > The video DAC is a simple resistor network gated by an active-low
> > > data-enable signal. For the bridge to work properly, this series also
> > > changes the following in the dt-bindings and simple-bridge driver:
> > > 
> > > - dt-bindings: Add a new compatible for the bridge in the simple-bridge
> > >   binding. This is necessary because the existing dumb-vga-dac compatible
> > >   doesn't describe a data-enable signal polarity.
> > > 
> > > - simple-bridge: Add the VGA bridge match-table entry and timings
> > >   struct, setting the DRM_BUS_FLAG_DE_LOW flag for the bridge.
> > 
> > Is there schematics available anywhere ? That would help reviewing the
> > series ?
> 
> This circuit is on the SoM, and the SoM schematics are
> confidential and not generally available.
> 
> I tried to extract as ascii art the relevant circuit, hope it helps

Thank you, it makes things clearer.

The circuit seems fairly generic. Wouldn't it be better to add an
optional property ot the dumb-vga-dac instead of a new compatible string
specific to Apalis ?

> BLUE (5 bits)
> =============
> DISP0_DATA[4] ---[R30   348R]---+
> DISP0_DATA[3] ---[R33   715R]---+
> DISP0_DATA[2] ---[R36  1.47K]---+-------- VGA1_B
> DISP0_DATA[1] ---[R39  2.94K]---+          |
> DISP0_DATA[0] ---[R42  5.90K]---+          D
>                                            |
> DI0_PIN15 ------------------------------ G | T4 MMBF2201N
>                                            S
>                                            |
>                                           GND
> 
> 
> RED (5 bits)
> ============
> DISP0_DATA[15] --[R31   348R]---+
> DISP0_DATA[14] --[R34   715R]---+
> DISP0_DATA[13] --[R37  1.47K]---+-------- VGA1_R
> DISP0_DATA[12] --[R40  2.94K]---+          |
> DISP0_DATA[11] --[R43  5.90K]---+          D
>                                            |
> DI0_PIN15 ------------------------------ G | T5 MMBF2201N
>                                            S
>                                            |
>                                           GND
> 
> 
> GREEN (6 bits)
> ==============
> DISP0_DATA[10] --[R32   348R]---+
> DISP0_DATA[9]  --[R35   715R]---+
> DISP0_DATA[8]  --[R38  1.47K]---+
> DISP0_DATA[7]  --[R41  2.94K]---+-------- VGA1_G
> DISP0_DATA[6]  --[R44  5.90K]---+          |
> DISP0_DATA[5]  --[R45  11.8K]---+          D
>                                            |
> DI0_PIN15 ------------------------------ G | T6 MMBF2201N
>                                            S
>                                            |
>                                           GND

-- 
Regards,

Laurent Pinchart
