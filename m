Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4387F3ADB94
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377807; cv=pass; b=Q0qRXC51OToGqdKeWK40S5J95kyoRMpxzrwxnl8h9G8hjfR9Vz3DcOAicU2R3dk3CUphLbUVSQKwiX49Uc382Q2TwNGsB2TsaPbXHQFOWOLZIsJhelgafEKeZ5BWKqsV5K6xvcbYgrpYSpoc0RPXG+m5dkH9DwwkoWxC3ExCUnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377807; c=relaxed/simple;
	bh=+EtTP6H/FtO/OTJEnIc0R8Df83ApwUFjyl553EFOAtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PeNhrfgALqTwb8U6zJUBQybuPY71qTlVhAMnFa7VVoAVRofrpr5APX3vw7aHpnRZecn3bkBvOTvuIWDsBMDjY0kwqzImN1MrsNvJAhCEc6eJV2QQL8YHlkAd4l+R7AxTyY5Gqvj5iZg6ssFsORqIIT6c079MeBy+PaGj7kFoL0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keeHJa1/; arc=pass smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keeHJa1/"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bf9466867cso718663e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788377780; cv=none;
        d=google.com; s=arc-20260327;
        b=Sh7lQUsVJdxG8qFL1Tqiti1RdCeGvVIGulvQrindIYnk1Uk4DiJ6unrmqukMoHY43Y
         uuJl5Y413X5A8h1RTCbBzQOgLt1VK81Qu+FjPWWbiCrPrM2BtnjXcc2sHKMuC2MvNGW4
         tzEVjvvVm3kZxJVypQy9Rcqon3s1x2x8weO6xLYMaa5f8pBWzQMNSjkvGhfxkBU1Zh8+
         eOMB8/haelumGhCzRhjrOM3+hH4n7MsqYPHXZ8BX9NVlqSflGdeSNxcLPhvjA+A3wkmD
         QStf88mMMGAWJE+F/0OFRA9eUhq2JbqGlv0O3jfruErlh2MVJilnjgNeiA3gykYiQmMh
         WhXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nUeJONOZOXQw27AH5OAmCGkZrUTbVh90RMUP44aKmJ4=;
        fh=ncgZS2d6nFsdhSPvtvtWZnVrqvH675GR1qNcpg8/pYY=;
        b=FtegyGjLBbQ+EM3K/yVerIj30f3WBv0LEzoUwc436GndKzAYsG4+MXxWfRtz77I8Jx
         p0vomKRjHO971G3HoqrnG00xeihdjyb1Ev3DYi+FjIaF4rRexkRnkTSAUibYVSwQM2jB
         36FPjcJLgQs5X2zeV+6apSS/lzWbMoLwfZ46Kj6eXR84PsiQtYI3BPUj3m4N05h1N3JH
         qJtc99IZhYOMHtKXBugmdO6LD5Uk7roGoBUm537d/bV54Q6gao0OVWY7HpaeZG9N70Pz
         f4b9S96skPKkMCpanxBAEBB4Qweayc+P+CjEXikZd8QMsG8EP0LUGd4ZYABZdrXBWUM7
         5YWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377780; x=1788982580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nUeJONOZOXQw27AH5OAmCGkZrUTbVh90RMUP44aKmJ4=;
        b=keeHJa1/AH5QXqdSGPK2T6jxVR9NjPzWjmENryV8Y+VckFxlv+SiGjfKOY944bjwXR
         1+ILMN75hf3BDRapMRLDthRZgWtBrJWWlwrwSTGTrbVst38AAWZ9xU3GVC1Z3ZtqN+Uy
         Zg/iP5nopyJpoxE5Yt2sgNWYO+RXwXDoG7OPfOrSEROiE62ojFeGEnWw1zM2z9zV1LMv
         dmP22hACyPLTL49LhPDLSnrpIVg/+GRD7CJpyE/2ZpIefhnPbwnon9WyOavB2mC5Fqv0
         9ilRWWqX1P1oNb5sOBRKaSZ+yf7yX0UsZqQ1gW/UevPPuGv0Sbgz9ofWGFuWwTarBUH1
         eb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377780; x=1788982580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUeJONOZOXQw27AH5OAmCGkZrUTbVh90RMUP44aKmJ4=;
        b=q133EYvH91nb8cykabRTnYSYMxrNORrvUgvSYdsAZ0j/jcf1BWh4e0Z4WhfFm/vhQ9
         RFQ5kLn7d/PioGjHVjJfLKEmz23V0E2PbiRClJA3htwzT6sFVrZ1MbJltlpCyX+sLxcj
         u4n6Dgte7zJkuSV8UMtWG7fQi4kmxjl68rnMRwXHtM2aq+NeCsubLM612aK+bT1tntZi
         zkQy2YbX6RMZsktDADW9iFpV1lGPBAHa0181mfhQ2MMaRSiPPVTH73pdpFbXkTvDfXnM
         r4xavFKWsoLtG9aV2YqtOerGomC1WcKXAQfXtf2D+DstQzEGxMuIc2W6tIcQzxrB2J7h
         IbBg==
X-Forwarded-Encrypted: i=1; AKwUvBzbHacN2e9IK2XjF7szGUSKQrf/wM83IiYYl+JAu2PCRtSd68/OlDGmIB2hbBGqmjqOvnDPg5DQ0Hk2iig=@vger.kernel.org
X-Gm-Message-State: AFuF++lMDPNLAEwvDGD7y7Vaq9GJM09KzREie9IcQI5X+EedbT0X5nWX
	yP9Y8uQqs3MKZsIpKuvMhdS2eLakOXTNcY53CnmNeVFGuSA74gr7IjPBQRSbHA1JOHOeECb74lx
	XrVs4F0COfmCOHIhL5gEQN9eVzP1EljU=
X-Gm-Gg: AYBFou2YSYdPBmAG9X7J8I2e9QWKEJHGeKqEu5KTVnJIEIk3T8gj6rG5gLqo6W85ptG
	eNiQeFWLzOMA6YNJShBuaw0S59t6Qu+EFeIt/f1XPWT5k/0EqM1KpfCJKca85TlhgWjbA+B/q+h
	m3NmMOMtcvF/PiqApI+hTO+4kREVdUj2XhvJOkmH8F4Q/PNPHNV8F7+TEEgABF7XfDDX9Py2OBG
	nTKrkApHpZGMcxBhUTabYZdKlFYDdnFckDHGpYwNtgf+68liWXLQ8MH/I3MeK9MtNP9zyC5Dcu/
	tFDTROY+0tImJvG4qviHguYNRQiwW/psWVQTHnIkPXCngzY2uzg7thTP/Mm+Fpd/66xxoRx1CPX
	vcrWXL55TBm1ZW9knK20gU9I9b+VqTd1ADIZUOyNpuoEh9rm3qiiilabSGkwVAbf4h++Mefe72T
	M+5twUIwl6KtW8kveqOHxFQgKhDU7ydBESZ94CJA==
X-Received: by 2002:a67:e704:0:b0:778:5e58:ec46 with SMTP id
 ada2fe7eead31-78a1f1f0bb4mr2338551137.2.1788377779561; Wed, 02 Sep 2026
 12:36:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
 <20260811-submit-ac200-mfd-v7-2-8b06f552a4d7@gmail.com> <20260902143122.GA2082450@google.com>
In-Reply-To: <20260902143122.GA2082450@google.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 2 Sep 2026 15:36:07 -0400
X-Gm-Features: AcwNN1Xwt_WeKE5EYA94nRgCZXJ8kS7opgPLjZCch4rn9cxdGbvWKIuGY6VRBjY
Message-ID: <CADvTj4oytrbZw9oKzRu=+tL1WZMyscfDvBMm2uK5hhNv8ZxTBw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] mfd: ac200: Add X-Powers AC200 support
To: Lee Jones <lee@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@kernel.org>, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 8:31=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 11 Aug 2026, James Hilliard wrote:
>
> > The X-Powers AC200 is a mixed-signal companion IC with a paged register
> > map accessed over I2C.
> >
> > Enable the shared input clock and prevent its rate from changing. Match
> > the vendor driver's 40 ms wait before the first register access,
> > initialize the paged regmap, report the chip and package revision, and
> > apply common reset.
> >
> > The Ethernet PHY link endpoint is independently enumerated on its MDIO
> > bus rather than created as an MFD platform child. Keep the regmap attac=
hed
> > to the AC200 I2C device so a separately enumerated function can resolve
> > that device, establish its required lifetime relationship and retrieve
> > the regmap from the provider.
> >
> > Cache only the common page selector. Individual functions can reset
> > independently and invalidate their other registers without regmap's
> > knowledge, so leave all functional registers volatile.
> >
> > Reset the chip during managed teardown and system shutdown.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/mfd/Kconfig  |  11 ++++
> >  drivers/mfd/Makefile |   1 +
> >  drivers/mfd/ac200.c  | 163 +++++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 175 insertions(+)
> >
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index e4fd4572472f..cac3fff5aee9 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -205,6 +205,17 @@ config MFD_AC100
> >         This driver include only the core APIs. You have to select indi=
vidual
> >         components like codecs or RTC under the corresponding menus.
> >
> > +config MFD_AC200
> > +     tristate "X-Powers AC200"
> > +     depends on I2C
> > +     depends on OF
> > +     select REGMAP_I2C
> > +     help
> > +       Support for the X-Powers AC200 mixed-signal companion IC. The A=
C200
> > +       contains audio, video, RTC and Fast Ethernet PHY functions and =
is
> > +       co-packaged with some Allwinner H6 and H616 SoCs. This driver p=
rovides
> > +       the shared register access used by the individual function driv=
ers.
> > +
> >  config MFD_AXP20X
> >       tristate
> >       select MFD_CORE
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 72d3944b0ad8..f8101d2a9ce9 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -150,6 +150,7 @@ obj-$(CONFIG_MFD_DA9052_SPI)      +=3D da9052-spi.o
> >  obj-$(CONFIG_MFD_DA9052_I2C) +=3D da9052-i2c.o
> >
> >  obj-$(CONFIG_MFD_AC100)              +=3D ac100.o
> > +obj-$(CONFIG_MFD_AC200)              +=3D ac200.o
> >  obj-$(CONFIG_MFD_AXP20X)     +=3D axp20x.o
> >  obj-$(CONFIG_MFD_AXP20X_I2C) +=3D axp20x-i2c.o
> >  obj-$(CONFIG_MFD_AXP20X_RSB) +=3D axp20x-rsb.o
> > diff --git a/drivers/mfd/ac200.c b/drivers/mfd/ac200.c
> > new file mode 100644
> > index 000000000000..0964e637afef
> > --- /dev/null
> > +++ b/drivers/mfd/ac200.c
> > @@ -0,0 +1,163 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * MFD core driver for the X-Powers AC200
> > + *
> > + * Copyright (C) 2019 Jernej Skrabec <jernej.skrabec@gmail.com>
> > + * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
> > + *
> > + * Based on the AC100 driver:
> > + * Copyright (C) 2016 Chen-Yu Tsai
>
> Drop this.  Every driver tends to be based on something else.

Dropped in v8.

>
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/regmap.h>
>
> Why aren't you using the MFD API?
>
> If you don't need it, then why is this in drivers/mfd?

The EPHY remains enumerated on its primary MDIO bus, so it is not an MFD
child. For non-EPHY use cases, the AC200 audio, video and RTC functions
are intended to be added as MFD children.

There are no such child drivers in this series, so I have not added
unused MFD cells. Those can be introduced with their corresponding
bindings and drivers.

>
> > +#define AC200_SYS_VERSION_REG                        0x0000
> > +#define AC200_SYS_VERSION_PACKAGE_MASK               GENMASK(15, 14)
> > +#define AC200_SYS_VERSION_CHIP_MASK          GENMASK(11, 0)
> > +
> > +#define AC200_SYS_CONTROL_REG                        0x0002
> > +#define AC200_SYS_CONTROL_CHIP_RESET_DEASSERT        BIT(0)
> > +
> > +/* Interface register accessible from every register page. */
> > +#define AC200_TWI_REG_ADDR_H 0x00fe
> > +#define AC200_MAX_REG                0xa1f2
> > +
> > +struct ac200 {
> > +     struct regmap *regmap;
> > +};
>
> Why not just pass 'regmap' directly?

Changed to store the regmap directly as the I2C driver data.

>
> > +static const struct regmap_range_cfg ac200_range_cfg[] =3D {
> > +     {
> > +             .range_max =3D AC200_MAX_REG,
> > +             .selector_reg =3D AC200_TWI_REG_ADDR_H,
> > +             .selector_mask =3D 0xff,
> > +             .window_len =3D 256,
> > +     },
> > +};
> > +
> > +/*
> > + * Each AC200 sub-block can reset independently, invalidating its regi=
ster
> > + * contents without regmap's knowledge. Cache only the common page sel=
ector;
> > + * this avoids a selector read-modify-write for every access on the sa=
me page
> > + * without ever returning stale functional-register values.
> > + */
> > +static bool ac200_volatile_reg(struct device *dev, unsigned int reg)
> > +{
> > +     return reg !=3D AC200_TWI_REG_ADDR_H;
> > +}
> > +
> > +static const struct regmap_config ac200_regmap_config =3D {
> > +     .name =3D "ac200",
> > +     .reg_bits =3D 8,
> > +     .reg_stride =3D 2,
> > +     .val_bits =3D 16,
> > +     .ranges =3D ac200_range_cfg,
> > +     .num_ranges =3D ARRAY_SIZE(ac200_range_cfg),
> > +     .max_register =3D AC200_MAX_REG,
> > +     .volatile_reg =3D ac200_volatile_reg,
> > +     .cache_type =3D REGCACHE_MAPLE,
> > +};
> > +
> > +static void ac200_disable(void *data)
> > +{
> > +     struct ac200 *ddata =3D data;
> > +
> > +     regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG, 0);
> > +}
>
> You can't do this in .remove()?

Changed to reset the chip from the I2C remove callback.

>
> > +static int ac200_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     unsigned int version;
> > +     struct ac200 *ddata;
> > +     struct clk *clk;
> > +     int ret;
> > +
> > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > +     if (!ddata)
> > +             return -ENOMEM;
> > +
> > +     clk =3D devm_clk_get_enabled(dev, NULL);
> > +     if (IS_ERR(clk))
> > +             return dev_err_probe(dev, PTR_ERR(clk),
> > +                                  "failed to enable input clock\n");
> > +
> > +     ret =3D devm_clk_rate_exclusive_get(dev, clk);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to lock clock rate=
\n");
> > +
> > +     ddata->regmap =3D devm_regmap_init_i2c(client, &ac200_regmap_conf=
ig);
> > +     if (IS_ERR(ddata->regmap))
> > +             return dev_err_probe(dev, PTR_ERR(ddata->regmap),
> > +                                  "failed to initialize regmap\n");
> > +
> > +     i2c_set_clientdata(client, ddata);
> > +
> > +     /*
> > +      * No minimum delay is documented. Match the vendor driver's 40 m=
s delay
> > +      * before its first AC200 register access after enabling the inpu=
t clock.
> > +      */
> > +     msleep(40);
> > +
> > +     ret =3D regmap_read(ddata->regmap, AC200_SYS_VERSION_REG, &versio=
n);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret,
> > +                                  "failed to read chip version\n");
> > +
> > +     dev_info(dev, "AC200 revision %#lx in package %lu\n",
> > +              FIELD_GET(AC200_SYS_VERSION_CHIP_MASK, version),
> > +              FIELD_GET(AC200_SYS_VERSION_PACKAGE_MASK, version));
>
> We support all versions, so why print it out at all?

Removed the revision read and log message.

> > +     /* Reset the chip after dependent function drivers have unbound. =
*/
> > +     ret =3D devm_add_action_or_reset(dev, ac200_disable, ddata);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG, 0);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG,
> > +                        AC200_SYS_CONTROL_CHIP_RESET_DEASSERT);
> > +     if (ret)
> > +             return ret;
>
> Okay, now what?  What uses this regmap?

The current consumer is the separately submitted AC200/AC300 PHY driver.
It creates a managed device link to the AC200 I2C device and obtains the
regmap with dev_get_regmap() for ancillary package-control access.

v8:
https://patch.msgid.link/20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.=
com

>
> > +     return 0;
> > +}
> > +
> > +static void ac200_shutdown(struct i2c_client *client)
> > +{
> > +     ac200_disable(i2c_get_clientdata(client));
> > +}
> > +
> > +static const struct of_device_id ac200_of_match[] =3D {
> > +     { .compatible =3D "x-powers,ac200" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, ac200_of_match);
> > +
> > +static const struct i2c_device_id ac200_i2c_ids[] =3D {
> > +     { .name =3D "ac200" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, ac200_i2c_ids);
> > +
> > +static struct i2c_driver ac200_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "ac200",
> > +             .of_match_table =3D ac200_of_match,
> > +     },
> > +     .probe =3D ac200_probe,
> > +     .shutdown =3D ac200_shutdown,
> > +     .id_table =3D ac200_i2c_ids,
> > +};
> > +module_i2c_driver(ac200_driver);
> > +
> > +MODULE_AUTHOR("James Hilliard <james.hilliard1@gmail.com>");
> > +MODULE_DESCRIPTION("X-Powers AC200 MFD core driver");
> > +MODULE_LICENSE("GPL");
> >
> > --
> > 2.53.0
> >
>
> --
> Lee Jones
