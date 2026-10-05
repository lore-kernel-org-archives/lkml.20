Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1FE2E5B2D;
	Mon,  5 Oct 2026 07:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791186818; cv=none; b=B96Z6j7M5ltqmmiK9qYVJjF9dq1Rmuc1XMBN3s4b4X92hiPQ9Bpk9qJHyoD2QyR5I0dhCgbb23YrHmS2hxbSCqh2YoRYaxk6i7+KG4hs1aCAODCW4Kkh+hLPQqzVMZ3+6214xqj7doSpDYTeArtYLI/BTEqou7tB59LCWSoUiaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791186818; c=relaxed/simple;
	bh=R3v7hxzfchd5jXcTK5Uwr+RIKgrbMtFTqdzK7Qkbgbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFZj0xwaIVSrOo3yALwsNlIaajnKNbD50veBZQoSjr2mkq+6bzyKolaMSyRfjtrpwppcrK0rVj7qxJL4FTUUWk7sgn6zyQIw8gauUW/3B/p7hLtpjJcjHW1481ufToqir0Q9LkiCa8WPFmcevH65CqGWn3Ww9TYwu+1vlNt/CuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=h57Gf9RI; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="h57Gf9RI"
Received: from francesco-nb (93-33-55-11.ip43.fastwebnet.it [93.33.55.11])
	by mail11.truemail.it (Postfix) with ESMTPA id 0D35F1F8C7;
	Mon,  5 Oct 2026 09:53:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791186805;
	bh=dTFZ0+ppaHBeezrtAiXyT5t0v4Qt5fwZihigO50o4zQ=; h=From:To:Subject;
	b=h57Gf9RI09DzmwL75inBBQ5foOdIGCIJSc7QKVYyYRpAJbhG31YkAMPL4Eg3RGbg+
	 wdq4NW9Z3lNBZrjpXPrbWL4cJNnV21WAKXeEUTY1p0y0Dn9nPMUVc+Mvv1bmdYRtUR
	 R/h+uA9QsUGCxhMB0Gzb/LgXIolV2czzzopaAzEdwppBmxqgA/0gc0ajoODJdgBTT0
	 jn7xCCkIG9w1lr+1aGfIi3TxznGdxdMq+CksPOQoVpHnlEwuAfqKtUyRFjPhsI9oES
	 2p7T/spnYnDrEl5dWYPpkOXY7utsl2EfsQX5GyxE6jb/Jy8hF23xElW+L/TN6Bpmke
	 LndTKF9pg2wbg==
Date: Mon, 5 Oct 2026 09:53:19 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Leonardo Costa <leoreis.costa@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	francesco.dolcini@toradex.com, leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com, marex@nabladev.com,
	stefano.r@variscite.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch
 Display 10.1" LVDS
Message-ID: <20261005075319.GA7692@francesco-nb>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
 <20261001155412.3177428-4-leoreis.costa@gmail.com>
 <ar6JnZp1jBvlc8bx@SMW015318>
 <20261002081824.GA7222@francesco-nb>
 <ar_bsQbD-IbvUf86@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar_bsQbD-IbvUf86@SMW015318>

Hello Frank,

On Fri, Oct 02, 2026 at 11:28:33AM -0500, Frank Li wrote:
> On Fri, Oct 02, 2026 at 10:18:24AM +0200, Francesco Dolcini wrote:
> > On Thu, Oct 01, 2026 at 11:26:05AM -0500, Frank Li wrote:
> > > On Thu, Oct 01, 2026 at 12:52:53PM -0300, Leonardo Costa wrote:
> > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > >
> > > > Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
> > > > LVDS connected via the Apalis iMX6 LDB.
> > > >
> > > > The panel is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the
> > > > touch input is provided by an Atmel MaxTouch capacitive touch
> > > > controller.
> > > >
> > > > Remove the panel-lvds node from the Apalis iMX6 dtsi, as it is an
> > > > external component that does not exist at the SoM level.
> > > >
> > > > The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
> > > > Board V1.2 device tree to provide a ready-to-use DTB.
> > > >
> > > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > ---
> > > >  arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++
> > > >  ...6q-apalis-panel-cap-touch-10inch-lvds.dtso | 53 +++++++++++++++++++
> > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 13 -----
> > > >  3 files changed, 59 insertions(+), 13 deletions(-)
> > > >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
> > >
> > > similar 7" case, add panel module name in file
> > >
> > > imx6q-apalis-lvds-panel-lt170410.dtso
> >
> > This does not work, sorry, the current name is the correct one, for
> > various reasons:
> >
> >  - the product is a display made with a specific connector, touch
> >    controller and display and more. The actual panel is just part of it
> >  - the current name wholly describe the product, it's a public product
> >    with an official name, all of that is clearly linked in the commit
> >    message and comments. there is no ambiguity.
> >  - the same toradex accessories are not module specific, they are used
> >    across multiple families/carrier board. It is a whole ecosystem that is
> >    building on top of standardized interfaces and connectors. The same
> >    overlay file is available for multiple boards and in multiple SoC
> >    vendor directory (as of now TI and NXP, soon we are going to have
> >    also QCOM). Having a consistent naming scheme is important, we cannot
> >    call the same things differently every time.
> >  - there was a situation in which we did a new product revision of a
> >    display, specifically the "Toradex Capacitive Touch Display 10.1"
> >    LVDS" there are two versions. The official product name is the same,
> >    apart an additional version number, one is version1, the other is
> >    version2. They have differences, and it's not just the panel, more
> >    stuff changed, so having the panel name in the filename will not
> >    help. v2 support is already in [1], for reference.
> >  - the toradex naming scheme is not encoding the actual part number used
> >    in the product name, for example we have apalis imx6 v1.2 that uses a
> >    different touch/adc than previous apalis imx v1.1. The product has a
> >    different schematics, different BoM and so on
> 
> Do you have schematics number to identify it?

Why do you ask specifically about schematics? We have schematics and we
have a way to identify a product to the related schematic. The way we
identify schematics, whatever is a number, a string, or anything else
seems not relevant to me.

But yes, answering you question, we do have schematics and a unique
way to identify them, and it's not using "numbers".

What matters here, is that Toradex products have a unique number,
and we have a way to trace product revisions.

So, for each product we have

<product name> <pid>

and <pid> is 8 digits, the first 4 digits is the end customer product
definition, and it matches with the product name, and the last 4 digits
is the product revision.

All of that is documented, see https://developer.toradex.com/hardware/hardware-resources/general-product-information/ordering-information-and-product-identification-pid-pid4-and-pid8/,
and this is what is used for any kind of product traceability.

Staying on our LVDS 10inch panel example

Capacitive Touch Display 10.1" LVDS | PID4: 1212 | PID8: 12121000 | (version 1)
Capacitive Touch Display 10.1" LVDS | PID4: 1212 | PID8: 12122000 | (version 2)


> > , and there is no
> >    reference of the difference touch/adc in the name. You can see this
> >    information from the public documentation just looking at the
> >    version. or you can check yourself comparing the two DTS in the linux
> >    kernel tree.
> >
> > [1]
> >  arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
> >  arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso
> 
> V2 is okay, but "panel-cap-touch-10inch-lvds" is too common. This may
> cause naming pollution if we implement shared one panel dtso for all boards.

This is the product name, what is missing is the vendor. Given the
vendor (Toradex), the product is unique.

We could rename all of our accessories dtbo adding a "tdx" prefix (when
they are Toradex products, of course).

So for example we could have

k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds.dtso
k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso

This way your concern on name pollution is solved using the vendor
("tdx") as prefix in the accessory name.

It's going to be a pain to rename this stuff, and it's going to have an
impact on users (that as I keep writing and insisting are the one that
matter). On the other hand, when we have a toradex product ("verdin", or
"apalis", ...), having a matching Toradex accessory to me is the default
and this info is not needed.

When adding non-toradex accessory to a toradex board we make explicit
the vendor of the accessory, see

arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso

where we have the "rpi" prefix.

So, my proposal would be to accept that for dtbo, combined with Toradex
board, the default is to be a Toradex accessory, therefore there is no
need of any additional string in the name. The second option, would be
to add a redundant "tdx" prefix. It will create a rename mess and it
will have an impact to the user, but it will not be wrong.

Your proposal, onthe other hand, is not working, and not matching the
reality of the product described by the dtbo.

> > > > +/dts-v1/;
> > > > +/plugin/;
> > > > +
> > > > +&{/} {
> > > > +	panel-lvds {
> > > > +		compatible = "logictechno,lt170410-2whc";
> > > > +		backlight = <&backlight>;
> > > > +		power-supply = <&reg_3v3_sw>;
> > >
> > > use name reg_lvds_panel, it help improve reusablity.
> >
> > I disagree.
> >
> > The regulator should be the one that is physically used on
> > the board. The DTS *must* describe the HW as accurately as possible, we
> > are not supposed to invent non existing regulator and more in general
> > non existing HW.
> 
> It reflact hardware, it connect by a connectors HEAD. In Connect HEADER,
> VCC for panel is fixed naming, like vcc_lcd_xxxx. Difference mainboards
> route it to difference supply.
> 
> Dtso file should use name in HEADER.  The main dts descript how connect
> it to provider, currently use additional label for it.

The power supply it is not the pin number on the connector.

The power supply is in the board. We have board in which the power
supply can be controlled by a gpio, board in which it is fixed, board in
which this power supply is shared with other peripherals. So no, the
power supply is not the pin number in the connector. What you write here
is wrong.

> > I see your need to avoid duplication, and I agree with it. But an
> > accurate HW description and the user experience trumps this need.
> > And I insist on the user experience, what we are doing is for someone to
> > use, we should not make the life of people hard because we decide on
> > non-descriptive or inaccurate names.
> 
> We take an iterative approach, learning and improving as we progress. New
> issues are addressed step by step, and better solutions are adopted
> whenever they are identified. Once a new approach proves to be more
> effective, we gradually transition to it, especially for new drivers and
> DTS changes.

Yes, of course. I agree. And this has nothing to do with that we are
discussing here.

Francesco

