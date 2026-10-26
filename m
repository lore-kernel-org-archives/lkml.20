Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013124;
	b=AeCkC5LywNx30q/LwKR2QfmNrSqFbIPgm+DgtFSO9h3nopxG69MbomnhXKVf8CccEhvr
	 HZOnHiPSvW7es64vg07b5m8nK47KbGisNRTWVA3LeBwuK802OznpeLcu8X+OOptBH41rO
	 MdvUqNBkTgwbt/Ypw60C+RF2A0RhNdSXL/8ismfnTPj9J7zHuiB5ExaRk1oANb6vKYC+s
	 utOSBN/uwN3qflry1fJhwsbvQY1mjKWcqzmZbL3OP871ozCtgb9cqxsLOi73AiRXQjVZA
	 8H0e6Bqfy9zHskrw5PYVrY+o32TTu4oq8gALLg08q3P7moTrTrblf1k3nCziY8ubJAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013124;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Mir512ayQBk8Th19Wwa5fXkynn3PrVlhG4qwhGvgDug=;
	b=Wz9WvG8dKXQpOy1z4FJ5dTsZdaLDLyF1pwbww4HfggmX6CbxehF1T+ODPpStfsn3Li76
	 lOqV6aAufySdORZyYF21AOqNR04jc8ENQwWVVYfnj8Kn0cYQN807uwjaCo0JA6DAc8/JI
	 x/FlKxj1ki2t4G6s9r8j6HOe2LEU7lAeYaGnb+iXgw0RVMDABdK1GFk3SnOH/Nf97bOE1
	 yGZ9Jdl3ocN1DIDb9gS9/VUp7pN+6rcQSvx85yUEpdnMRCoWqUbr9yb38r5Ogao2f7l8U
	 Wq3IImEHKFPD5luRunxCFtPOiYEg2drI3/RK4DUS8o0rcZ7cN4rs/m0b0J4IcwmQsuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=bKSSUOyG;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98F6606A96B;
	Mon, 26 Oct 2026 11:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E98F6606A96B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=bKSSUOyG
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 3901F1FAF1;
	Mon, 26 Oct 2026 12:11:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1793013113;
	bh=Mir512ayQBk8Th19Wwa5fXkynn3PrVlhG4qwhGvgDug=; h=From:To:Subject;
	b=bKSSUOyG8ak3KUfWnDXAZgm8ls9GL+KDkr2Kcu3F0K3Su7qWrNK2tuXLVc40a18lz
	 3xP99jb3Ax61iQdD7ai9swAlizqt+gDpVns32Z4N86fPoPxh3zOAhHyyuUKkzNmDM8
	 A94PD5A28b/WT40GxCiVKIwdky4PGgW2VRuWIHPXwYx1dBagkxcyODPmMs1j3MZk/i
	 kX1hPfZHkXK6VTAxdsj2+AliHH0pB9TWGIb5UngiBVBHNGDsWLATYQvqh8YYXDHhFg
	 Kk+MxCaRODAN9XbK/QRxqBi7yWi9VoDsBQh/OwzvYjYqzqKHjsnEYCZvF1EoFcmE6k
	 9EVYVW1blB0hw==
Date: Mon, 26 Oct 2026 12:11:49 +0100
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
Message-ID: <20261026111149.GA46946@francesco-nb>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
 <20261001155412.3177428-4-leoreis.costa@gmail.com>
 <ar6JnZp1jBvlc8bx@SMW015318>
 <20261002081824.GA7222@francesco-nb>
 <ar_bsQbD-IbvUf86@SMW015318>
 <20261005075319.GA7692@francesco-nb>
 <ateZGwrFGfD1j-i3@lizhi-Precision-Tower-5810>
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
In-Reply-To: <ateZGwrFGfD1j-i3@lizhi-Precision-Tower-5810>

Hello Frank,

On Tue, Oct 20, 2026 at 12:38:51PM -0400, Frank Li wrote:
> On Mon, Oct 05, 2026 at 09:53:19AM +0200, Francesco Dolcini wrote:
> > Hello Frank,
> >
> > On Fri, Oct 02, 2026 at 11:28:33AM -0500, Frank Li wrote:
> > > On Fri, Oct 02, 2026 at 10:18:24AM +0200, Francesco Dolcini wrote:
> > > > On Thu, Oct 01, 2026 at 11:26:05AM -0500, Frank Li wrote:
> > > > > On Thu, Oct 01, 2026 at 12:52:53PM -0300, Leonardo Costa wrote:
> > > > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > >
> > > > > > Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
> > > > > > LVDS connected via the Apalis iMX6 LDB.
> > > > > >
> > > > > > The panel is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the
> > > > > > touch input is provided by an Atmel MaxTouch capacitive touch
> > > > > > controller.
> > > > > >
> > > > > > Remove the panel-lvds node from the Apalis iMX6 dtsi, as it is an
> > > > > > external component that does not exist at the SoM level.
> > > > > >
> > > > > > The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
> > > > > > Board V1.2 device tree to provide a ready-to-use DTB.
> > > > > >
> > > > > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > > ---
> > > > > >  arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++
> > > > > >  ...6q-apalis-panel-cap-touch-10inch-lvds.dtso | 53 +++++++++++++++++++
> > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 13 -----
> > > > > >  3 files changed, 59 insertions(+), 13 deletions(-)
> > > > > >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
> > > > >
> > > > > similar 7" case, add panel module name in file
> > > > >
> > > > > imx6q-apalis-lvds-panel-lt170410.dtso
> > > >
> > > > This does not work, sorry, the current name is the correct one, for
> > > > various reasons:
> > > >
> > > >  - the product is a display made with a specific connector, touch
> > > >    controller and display and more. The actual panel is just part of it
> > > >  - the current name wholly describe the product, it's a public product
> > > >    with an official name, all of that is clearly linked in the commit
> > > >    message and comments. there is no ambiguity.
> > > >  - the same toradex accessories are not module specific, they are used
> > > >    across multiple families/carrier board. It is a whole ecosystem that is
> > > >    building on top of standardized interfaces and connectors. The same
> > > >    overlay file is available for multiple boards and in multiple SoC
> > > >    vendor directory (as of now TI and NXP, soon we are going to have
> > > >    also QCOM). Having a consistent naming scheme is important, we cannot
> > > >    call the same things differently every time.
> > > >  - there was a situation in which we did a new product revision of a
> > > >    display, specifically the "Toradex Capacitive Touch Display 10.1"
> > > >    LVDS" there are two versions. The official product name is the same,
> > > >    apart an additional version number, one is version1, the other is
> > > >    version2. They have differences, and it's not just the panel, more
> > > >    stuff changed, so having the panel name in the filename will not
> > > >    help. v2 support is already in [1], for reference.
> > > >  - the toradex naming scheme is not encoding the actual part number used
> > > >    in the product name, for example we have apalis imx6 v1.2 that uses a
> > > >    different touch/adc than previous apalis imx v1.1. The product has a
> > > >    different schematics, different BoM and so on
> > >
> > > Do you have schematics number to identify it?
> >
> > Why do you ask specifically about schematics? We have schematics and we
> > have a way to identify a product to the related schematic. The way we
> > identify schematics, whatever is a number, a string, or anything else
> > seems not relevant to me.
> >
> > But yes, answering you question, we do have schematics and a unique
> > way to identify them, and it's not using "numbers".
> >
> > What matters here, is that Toradex products have a unique number,
> > and we have a way to trace product revisions.
> >
> > So, for each product we have
> >
> > <product name> <pid>
> >
> > and <pid> is 8 digits, the first 4 digits is the end customer product
> > definition, and it matches with the product name, and the last 4 digits
> > is the product revision.
> >
> > All of that is documented, see https://developer.toradex.com/hardware/hardware-resources/general-product-information/ordering-information-and-product-identification-pid-pid4-and-pid8/,
> > and this is what is used for any kind of product traceability.
> >
> > Staying on our LVDS 10inch panel example
> >
> > Capacitive Touch Display 10.1" LVDS | PID4: 1212 | PID8: 12121000 | (version 1)
> > Capacitive Touch Display 10.1" LVDS | PID4: 1212 | PID8: 12122000 | (version 2)
> 
> include  12121000 in your file names.

That would result in filenames such as:

  imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-12121000.dtbo
  imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-12122000.dtbo

While technically correct, this creates a usability problem. PID8
("12121000" is what is called a PID8 in Toradex product naming/number
scheme) tracks hardware revisions, including changes that do not affect
the DT, such as passive components or mechanical changes.

A user with PID8 12122001 would not know which overlay to use, and
duplicating identical overlays for every hardware revision makes no sense.

I therefore propose:

imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v2.dtbo

These names match the product names and versions used in our ordering
information, documentation and product labels. Users can easily identify
the correct overlay.

Toradex is responsible for tracking hardware revisions and their software
requirements. If a revision requires a different DT, we can distinguish
it with an additional suffix, and be sure that this suffix is something
that clearly related to the specific product.

> > > > , and there is no
> > > >    reference of the difference touch/adc in the name. You can see this
> > > >    information from the public documentation just looking at the
> > > >    version. or you can check yourself comparing the two DTS in the linux
> > > >    kernel tree.
> > > >
> > > > [1]
> > > >  arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
> > > >  arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso
> > >
> > > V2 is okay, but "panel-cap-touch-10inch-lvds" is too common. This may
> > > cause naming pollution if we implement shared one panel dtso for all boards.
> >
> > This is the product name, what is missing is the vendor. Given the
> > vendor (Toradex), the product is unique.
> 
> Generally, it is not unique. We met similar problem. LCD panel is EOL.
> Need reply with new one. i.MX production life is longer than other external
> componenets. You are still work on i.mx6, even i.mx28 still have some
> customer use it.

This is precisely why we have product versioning and traceability.
Toradex owns and maintains its product definitions, including changes
to internal components. The naming scheme has been designed to handle
these situations consistently.

> > We could rename all of our accessories dtbo adding a "tdx" prefix (when
> > they are Toradex products, of course).
> >
> > So for example we could have
> >
> > k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds.dtso
> > k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso
> 
> tdx is good. The problem is that "panel-cap-touch-10inch-lvds" is too
> generally.

It is the name of a specific Toradex product, not a generic description.
Together with the vendor prefix and product version, it is unambiguous.

Our DT filenames should reflect the actual products our customers use.

> > This way your concern on name pollution is solved using the vendor
> > ("tdx") as prefix in the accessory name.
> 
> pollution is just one problem. We need identify it quickly. if you create
> imx7-xxx-panel-cap-touch-10inch-lvds.dtso, it is hard to know if it is
> similar existing imx6's panel-cap-touch-10inch-lvds. even it may use for
> other imx8 imx9's productions.

That is exactly why consistent naming matters. The same accessory can be
used across different SoC families. Keeping its name consistent makes
that relationship immediately recognizable.

Internal component details belong in the DT description, not necessarily
in the filename.

> > When adding non-toradex accessory to a toradex board we make explicit
> > the vendor of the accessory, see
> >
> > arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso
> >
> > where we have the "rpi" prefix.
> 
> Ideally, rpi-display-2-7in.dtso should reused for all boards, which use
> rpi defined connectors. Now exsiting these combinations reason is current
> nexus node is not good enough. but we face to this directions.
> 
> And anyway, rpi-display-2-7in is not good name because rpi many produce
> difference 2-7in panels in future.

This is an existing upstream naming convention, already reviewed and
accepted by multiple maintainers.

Product naming and versioning are the responsibility of the manufacturer
(whatever is raspberrypi or toradex).  I do not think we should
second-guess those decisions without a concrete technical issue.

Francesco

