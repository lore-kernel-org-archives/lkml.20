Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63174582E8;
	Thu,  3 Sep 2026 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425687; cv=none; b=Uk9yzdrl0dW8Mqu/n7+qYjE9vQ3DHDvgHhsb4owMxyo/l8xaqJmu5tytJQDAak5kTSDzw1KZpAE4gaJv0wQQUKDtVGoJ2XguNMaTN5r3jZNSSuYdbRGoGEvzTW+BQ2QXiVKyFQ6VfHwJNMc5u3W5qDXefR+Ls9JCfCdTJd/06m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425687; c=relaxed/simple;
	bh=OVRy/6e49xlc6eddTN/FmuENFYbQY/8opQlBkHAtzVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIJrP5cELZrEzyEP6kViz8zYrWqe33vwkTdo0fP2bDt2DOlBQMFa8cFD27UmIV8jikidz1kDlxBvWON+Y2JHwyIWx8oK5W3tyVN3RqiVw4Hc1rhddny1409olbCGST4cH/5dzHxsYeSqfQXtHW1Slwhnel13UL/Ux4NzibEfFpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KTprtdcM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTprtdcM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69BD1F000E9;
	Thu,  3 Sep 2026 08:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788425682;
	bh=4Y6l5YlEpGwlqbTGDyz1WTlFxzg/AACMsnvqaxrx2zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KTprtdcMXhRi26hZtSdXz/75tF+gMMrg2uRb1B5mvJ5CiNeoCtgFDm5C5/PODvL+n
	 GXxlWeYlRoSyDO88p1v+isnav188lx5lsrGIwRSsqgbFzL9svsOSAqgSOOewcJFXeL
	 cvGqNlddtSqqJVtEAcruojEdpVpxMR4w0ccm7CuLt5e3m3efLtPeUD3T+GF6wOSkI6
	 2j3pN3znkYdVbKJ1iiFNTD/+K7FZhj2rVA6IKCm1Vv032Um5/M4gALCtV13k8FLSYP
	 S0wmYm6RiZT43ToTPhNyszQf30wGXoyWAYxQHljePGAghZKhgB0HMByTbJxN09a/nK
	 0yEk6Dp/urWcA==
Date: Thu, 3 Sep 2026 09:54:36 +0100
From: Lee Jones <lee@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] mfd: ac200: Add X-Powers AC200 support
Message-ID: <20260903085436.GG2133376@google.com>
References: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
 <20260811-submit-ac200-mfd-v7-2-8b06f552a4d7@gmail.com>
 <20260902143122.GA2082450@google.com>
 <CADvTj4oytrbZw9oKzRu=+tL1WZMyscfDvBMm2uK5hhNv8ZxTBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4oytrbZw9oKzRu=+tL1WZMyscfDvBMm2uK5hhNv8ZxTBw@mail.gmail.com>

On Wed, 02 Sep 2026, James Hilliard wrote:

> On Wed, Sep 2, 2026 at 8:31 AM Lee Jones <lee@kernel.org> wrote:
> >
> > On Tue, 11 Aug 2026, James Hilliard wrote:
> >
> > > The X-Powers AC200 is a mixed-signal companion IC with a paged register
> > > map accessed over I2C.
> > >
> > > Enable the shared input clock and prevent its rate from changing. Match
> > > the vendor driver's 40 ms wait before the first register access,
> > > initialize the paged regmap, report the chip and package revision, and
> > > apply common reset.
> > >
> > > The Ethernet PHY link endpoint is independently enumerated on its MDIO
> > > bus rather than created as an MFD platform child. Keep the regmap attached
> > > to the AC200 I2C device so a separately enumerated function can resolve
> > > that device, establish its required lifetime relationship and retrieve
> > > the regmap from the provider.
> > >
> > > Cache only the common page selector. Individual functions can reset
> > > independently and invalidate their other registers without regmap's
> > > knowledge, so leave all functional registers volatile.
> > >
> > > Reset the chip during managed teardown and system shutdown.
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > >  drivers/mfd/Kconfig  |  11 ++++
> > >  drivers/mfd/Makefile |   1 +
> > >  drivers/mfd/ac200.c  | 163 +++++++++++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 175 insertions(+)
> > >
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index e4fd4572472f..cac3fff5aee9 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -205,6 +205,17 @@ config MFD_AC100
> > >         This driver include only the core APIs. You have to select individual
> > >         components like codecs or RTC under the corresponding menus.
> > >
> > > +config MFD_AC200
> > > +     tristate "X-Powers AC200"
> > > +     depends on I2C
> > > +     depends on OF
> > > +     select REGMAP_I2C
> > > +     help
> > > +       Support for the X-Powers AC200 mixed-signal companion IC. The AC200
> > > +       contains audio, video, RTC and Fast Ethernet PHY functions and is
> > > +       co-packaged with some Allwinner H6 and H616 SoCs. This driver provides
> > > +       the shared register access used by the individual function drivers.
> > > +
> > >  config MFD_AXP20X
> > >       tristate
> > >       select MFD_CORE
> > > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > > index 72d3944b0ad8..f8101d2a9ce9 100644
> > > --- a/drivers/mfd/Makefile
> > > +++ b/drivers/mfd/Makefile
> > > @@ -150,6 +150,7 @@ obj-$(CONFIG_MFD_DA9052_SPI)      += da9052-spi.o
> > >  obj-$(CONFIG_MFD_DA9052_I2C) += da9052-i2c.o
> > >
> > >  obj-$(CONFIG_MFD_AC100)              += ac100.o
> > > +obj-$(CONFIG_MFD_AC200)              += ac200.o
> > >  obj-$(CONFIG_MFD_AXP20X)     += axp20x.o
> > >  obj-$(CONFIG_MFD_AXP20X_I2C) += axp20x-i2c.o
> > >  obj-$(CONFIG_MFD_AXP20X_RSB) += axp20x-rsb.o
> > > diff --git a/drivers/mfd/ac200.c b/drivers/mfd/ac200.c
> > > new file mode 100644
> > > index 000000000000..0964e637afef
> > > --- /dev/null
> > > +++ b/drivers/mfd/ac200.c
> > > @@ -0,0 +1,163 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * MFD core driver for the X-Powers AC200
> > > + *
> > > + * Copyright (C) 2019 Jernej Skrabec <jernej.skrabec@gmail.com>
> > > + * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
> > > + *
> > > + * Based on the AC100 driver:
> > > + * Copyright (C) 2016 Chen-Yu Tsai
> >
> > Drop this.  Every driver tends to be based on something else.
> 
> Dropped in v8.
> 
> >
> > > + */
> > > +
> > > +#include <linux/bitfield.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/module.h>
> > > +#include <linux/regmap.h>
> >
> > Why aren't you using the MFD API?
> >
> > If you don't need it, then why is this in drivers/mfd?
> 
> The EPHY remains enumerated on its primary MDIO bus, so it is not an MFD
> child. For non-EPHY use cases, the AC200 audio, video and RTC functions
> are intended to be added as MFD children.
> 
> There are no such child drivers in this series, so I have not added
> unused MFD cells. Those can be introduced with their corresponding
> bindings and drivers.

The rule is that you must provide at least 2 MFD children before this
constitute as an MFD.  Please provide them in the same series.

-- 
Lee Jones
