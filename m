Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793806702;
	b=iPg3/y/5GNo99GED7deavRy1Tbx9LMGvzdNNPTInEcxmVZ8LivQ9Y+xYEou4BltelSG9
	 znXUoDafua3XSHgWfCw5Oz4Kl9D9CunZa84439mk9KDt+t7sPF/mZ8xAb19gqmP3dun6+
	 mZi/Cr08RgU7ZdRIR784HuAj24wjdB3IuwWcL3l4riPNSrvoUEQVY4aYPxORN1ZGvpmeu
	 EyAK/g2d/hvOOGJ6wH+mAuE3zmw22eNUA1AvK7oMePpRv4H69Uc1hs9+bTfwOiqljfXGk
	 Gw8YNBPTtMH4xU4omGkjPx38rPIjDIpQEGHbLbDhxI96jhB/m5qNZs4G6vLoaAd8KoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z2i3z2vj1Uxqy3IMqNO0xEBq/h1JKdF0l16nhTgr3rU=;
	b=TQHgorNUII28Hm6iSD5k/iHyF69mI3qkUdHf9308dRcGAWy3slvULqbsfpH+LjRmgrAC
	 knxHuh4ct6KpXLCwFNdennlvEI2j33YeBE+RK8eWmlt5+W3L3w8/DNjOmRNMxGOKcslRd
	 pXxi2J6TRa5ZM3jKrzxdOuIlkwWmRTOjzuOHonnO0MR1gdLsIOKBup9Sv2PTyv6BeI5TG
	 jnDVIe4/a8JbqAmO6/sZlavjg/YzlWH2UeXDmZj7jt0z6gRakLEIWvDDOstOUmUhuQOSm
	 5EGMW79+P7MR7Bq5lGB3CXtoMsIlQwbKVBGNUdwum7093g0FdqNgJfgDHLolEIYjdig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OjvWKU/q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497FB606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 497FB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OjvWKU/q
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36cad25b8b0so1216587eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:38:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793806700; cv=none;
        d=google.com; s=arc-20260327;
        b=TeebW8+aC8udJda7jfCASDBJOaverNDIpBc4CBqQJ09uVxymr3BQmrpcXI5mqVizCc
         aCXQScZmOCLXbafqgkZTRUiH+b10WjL+EbmBVztN6hvjkBIQ+w8eRlmKLJ1mRMHvM7Pz
         cOAJtUYnmrQf9B6m/VrPybGBnG13Jsq9zNOq1YU2zu5CjKAzAYdQ6YdeGLjufJxDniOE
         dKqVYlzwln0KjLAw60Z5SjzXkzAGZHOS7gchPvKC/t9LNkQl29iKx79mpmxs5/43Nfzg
         jctN6gYwAudtq62Se2+9Ls6eTebcCzW2dNSjp+MjjhYNxbcV3YaU87+YoTZWH9X1ekdE
         h5Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z2i3z2vj1Uxqy3IMqNO0xEBq/h1JKdF0l16nhTgr3rU=;
        fh=ppnzW63gXcshV+cnxq7Ox1J+KIW5cpzd0Aww3S4EgQc=;
        b=Wbft03nAPJCoII6W7inliaw9hnQOt+cWM2ZyPsaSskGzCgKdZFGNaxK5yZ6uIF4R5X
         a9SspbuYnuIDw+zdTrpKkzTezLDdwo7shfA4JUzZjtggGDxa0BAUGHKApskIOF2EBEzm
         Q9NppfvdJRRvd/NAfglxwl7aRZhEbhM5+bTG2cVmjfLjNUEdLlahEKJxKplWWJrJ0h3z
         YdkQA08pLWRAQQbGzguhiZy4uMMGxBR8VyYBIPr36XwHIJZEvRK1U9TZh1B0n8BTeJ0K
         abgSaXUDdfGxHu1Vi5F1aIB7zAjDte1shCjr92xdmUK6NT9EByiqIyi+TDrPPAW6vzik
         9P4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793806700; x=1794411500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z2i3z2vj1Uxqy3IMqNO0xEBq/h1JKdF0l16nhTgr3rU=;
        b=OjvWKU/q4pxfp/mGXK1kYr39ARcY8peh0he9Efhr9VciXdbd37WvmP5kycL4AcmLkB
         3bi8aE2jzPn1cj6f4u6iuJtmrDmi9pa0Agw0UKqrMRVfw+4+rIE0k9MFoqJZHB8Lrd9a
         5psSEvcU+ob0hVZSYczU5F1itdSjBBc/EdY4J1/7oIi2nA74RBnFhuT6RYEku8d07aRE
         O1g61fB7MqwNG5Nj4kiisZEzyqzu7jc6h3vZNt3xhW615iWKs0Ml4KXyb85hsMaAcc4I
         WLRglTWC3/CrvKxnu7+is0wLwTLGyxit8w8lfps/DCTwpxfkqO6ZVZqMVPzsnyCDW99s
         DBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806700; x=1794411500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2i3z2vj1Uxqy3IMqNO0xEBq/h1JKdF0l16nhTgr3rU=;
        b=s0PHiv8RLVUrcyHc+Tv+UpBFmyI/+Eb8D8dnWccieYmSo0NHxGstWu/d2YPeZEruDy
         un0Hg3EUB+8qQJ3NunZG/IDogXSs1iXZkoOeUYW8f4ARhSFRZSWWti4kLSjn1853V3NK
         y+xRBvIlQix50CzzLG6MyETKMY0zUgC74jnOhgF0W3kUNuqjiR0SSjJPMv1SV3qGT6sr
         OdFxgTdQ6XJiV8mfb0ZeWwqfbuOPlvxytmo13f/R45ttiKniWS5U04ZutF0ZXxY8JMHc
         s+Tp1+5Pe/+rHb1tOhrEqbjD7hSDZp2z8jrFik7fBnfOGLwKVKNmpt+Y+KXal2H0hlmg
         snow==
X-Forwarded-Encrypted: i=1; AKwUvBz15q+ntZdGct5Betpm9Ww9y+N6wQGQbnv/Tdw9rI1dal82GGnQNW0hyUCi+bpAaadbSezvbIC74AzvcZ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3G10jnhcQUUg0iKceQvYpZ3SCCvPHGFocR4LxntA6hBxTI7sf
	LwB29DDgeVKyWJx+jaZ/7p+mZzqDmx123QYfYj94QxljoQg9JQAGacQ1nJncgMMZtJrK6TIruqo
	l64yaKl657guxLDcyvqDFw4GAQiMqhNg=
X-Gm-Gg: AYBFou0HzaDEGO9Abn7XDxnqIomO4DPTBRanf8bordSkGnjI+CEpCKohr5HLqx3FVGn
	XoygCFVOkesXf3l09DA7b3z4lPlUu0ixs1uSs69/2IBMvl67MUiS9mo1bmtpPrR06gJ0sXAtgPn
	N4JnOk+Sp0/aSbU45wJ47YKVmpIhKpMV4B0eflbqL9TLIRe1COfqNtkpPkX3r+e16WT8r8w5/Xi
	+Lhkluiu8Xru9wc805k28iFqAw3ifpgDyiRxPYA7dAvAPke0VzuN2xG8L0cUi69k2szRLhojSq7
	bO0PQV9KSBh4CGcjdqF5+SLBjKdEB3v/R/cuzca7iuKDbHIh5PrqGMalnIyOCHEbd35hYTqcHtY
	QGVYH0Lob9/YLavk/GSjjBeqUEPy2D8yQ3Feg2LtPHJUKQWf2tuQAMtv9u3xlmhYnuOJAQF4Yh2
	PyIfnsI28HcvjS+fU=
X-Received: by 2002:a05:7301:715:b0:369:f41e:d2dd with SMTP id
 5a478bee46e88-36a4241b18amr24074791eec.31.1793806700155; Wed, 04 Nov 2026
 07:38:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027115006.86032-1-clamor95@gmail.com> <179318844110.3606039.5801345229436270811@kernel.org>
In-Reply-To: <179318844110.3606039.5801345229436270811@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 4 Nov 2026 17:38:07 +0200
X-Gm-Features: AclHuK9cSaRNIpy-1KTZ4JvVgFogvZS7HZFHVxjMuvwtP6PF9TF7v6QwxfJ1f4w
Message-ID: <CAPVz0n05rXtBJzPZo4k9=ns52n10rAKpW83gbwpQwZQW3i-u6Q@mail.gmail.com>
Subject: Re: [PATCH v4] leds: Add driver for MAX8907 LED cell
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 4 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:16=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> --- checkpatch.pl (1 issue) ---
> Line 38: WARNING: please write a help paragraph that fully describes the =
config symbol with at least 4 lines
> ----------------------------------
>
> On Tue, 27 Oct 2026, Svyatoslav Ryhel wrote:
>
> > Add a small driver to control the LED cell provided by the MAX8907 PMIC=
.
> > The LED does not require any specific configuration and is folded into =
the
> > PMIC's node.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> > Changes in v2:
> > - rebased so patch is now applicable to linux/next
> >
> > Changes in v3:
> > - added check if led is off for get callback
> > - added dedicated MAX8907_REG_WLED_MODE_ON mask
> > - switched to devm_led_classdev_register_ext
> >
> > Changes in v4:
> > - platform_set_drvdata dropped
> > - init_data.devicename dropped
> > - added MODULE_ALIAS
> > ---
> >  drivers/leds/Kconfig        |  7 +++
> >  drivers/leds/Makefile       |  1 +
> >  drivers/leds/leds-max8907.c | 90 +++++++++++++++++++++++++++++++++++++
> >  drivers/mfd/max8907.c       |  1 +
> >  include/linux/mfd/max8907.h |  2 +-
> >  5 files changed, 100 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/leds/leds-max8907.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 788e689fe875c..3796c562919fe 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -813,6 +813,13 @@ config LEDS_MAX77705
> >       help
> >         LED driver for MAX77705 PMIC from Maxim Integrated.
> >
> > +config LEDS_MAX8907
> > +     tristate "LED support for MAX8907 PMIC"
> > +     depends on LEDS_CLASS && MFD_MAX8907
> > +     help
> > +       This option enables support for on-chip LED drivers on
> > +       MAXIM MAX8907 PMIC.
>
> As requested on v3, please expand this help text to at least 4 lines to s=
atisfy
> 'checkpatch.pl'.
>
> > +
> >  config LEDS_MAX8997
> >       tristate "LED support for MAX8997 PMIC"
> >       depends on LEDS_CLASS && MFD_MAX8997
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index 3da746279bb81..24efda3fbaa44 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_LTC3220)          +=3D leds-ltc3220=
.o
> >  obj-$(CONFIG_LEDS_MAX5970)           +=3D leds-max5970.o
> >  obj-$(CONFIG_LEDS_MAX77650)          +=3D leds-max77650.o
> >  obj-$(CONFIG_LEDS_MAX77705)          +=3D leds-max77705.o
> > +obj-$(CONFIG_LEDS_MAX8907)           +=3D leds-max8907.o
> >  obj-$(CONFIG_LEDS_MAX8997)           +=3D leds-max8997.o
> >  obj-$(CONFIG_LEDS_MC13783)           +=3D leds-mc13783.o
> >  obj-$(CONFIG_LEDS_MENF21BMC)         +=3D leds-menf21bmc.o
> > diff --git a/drivers/leds/leds-max8907.c b/drivers/leds/leds-max8907.c
> > new file mode 100644
> > index 0000000000000..a5c445f75d1b1
> > --- /dev/null
> > +++ b/drivers/leds/leds-max8907.c
> > @@ -0,0 +1,90 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/err.h>
> > +#include <linux/leds.h>
> > +#include <linux/mfd/max8907.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +
> > +#define MAX8907_REG_WLED_MODE_ON     BIT(0)
> > +
> > +struct max8907_led_data {
> > +     struct max8907 *max8907;
>
> As asked on v3, what is 'max8907' used for?
>
> > +     struct regmap *regmap;
> > +     struct led_classdev cdev;
> > +};
> > +
> > +static enum led_brightness max8907_led_get_brightness(struct led_class=
dev *cdev)
> > +{
> > +     struct max8907_led_data *ddata =3D container_of(cdev, struct max8=
907_led_data, cdev);
> > +     unsigned int brightness_lvl;
> > +     int ret;
> > +
> > +     ret =3D regmap_read(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL, &b=
rightness_lvl);
> > +     if (ret || !(brightness_lvl & MAX8907_REG_WLED_MODE_ON))
> > +             return LED_OFF;
> > +
> > +     ret =3D regmap_read(ddata->regmap, MAX8907_REG_WLED_CNTL, &bright=
ness_lvl);
> > +     if (ret)
> > +             return LED_OFF;
> > +
> > +     return brightness_lvl;
> > +}
> > +
> > +static int max8907_led_set_brightness(struct led_classdev *cdev,
> > +                                   enum led_brightness brightness)
> > +{
> > +     struct max8907_led_data *ddata =3D container_of(cdev, struct max8=
907_led_data, cdev);
> > +     int brightness_lvl, ret;
> > +
> > +     brightness_lvl =3D clamp(brightness, LED_OFF, LED_FULL);
> > +
> > +     if (brightness_lvl) {
> > +             ret =3D regmap_write(ddata->regmap, MAX8907_REG_WLED_CNTL=
, brightness_lvl);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return regmap_update_bits(ddata->regmap, MAX8907_REG_WLED_MODE_CN=
TL,
> > +                               MAX8907_REG_WLED_MODE_ON,
> > +                               brightness_lvl ? MAX8907_REG_WLED_MODE_=
ON : 0);
> > +}
> > +
> > +static int max8907_led_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct max8907 *max8907 =3D dev_get_drvdata(dev->parent);
> > +     struct led_init_data init_data =3D { };
> > +     struct max8907_led_data *ddata;
> > +
> > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > +     if (!ddata)
> > +             return -ENOMEM;
> > +
> > +     ddata->max8907 =3D max8907;
> > +     ddata->regmap =3D max8907->regmap_gen;
> > +
> > +     init_data.fwnode =3D dev_fwnode(dev->parent);
>
> This will evaluate to 'pmic'.  The sysfs attribute will be incorrect.
>
> Since there is no child node, why not set 'ddata->cdev.name' directly
> and use 'devm_led_classdev_register()'?
>
> > +
> > +     ddata->cdev.brightness =3D LED_OFF;
> > +     ddata->cdev.flags =3D LED_CORE_SUSPENDRESUME;
> > +     ddata->cdev.max_brightness =3D LED_FULL;
> > +
> > +     ddata->cdev.brightness_get =3D max8907_led_get_brightness;
> > +     ddata->cdev.brightness_set_blocking =3D max8907_led_set_brightnes=
s;
> > +
> > +     return devm_led_classdev_register_ext(dev, &ddata->cdev, &init_da=
ta);
> > +}
> > +
> > +static struct platform_driver max8907_led_driver =3D {
> > +     .driver.name =3D "max8907-leds",
>
> Cute.  But please expand.
>
> > +     .probe =3D max8907_led_probe,
> > +};
> > +module_platform_driver(max8907_led_driver);
> > +
> > +MODULE_ALIAS("platform:max8907-leds");
> > +MODULE_AUTHOR("Svyatolsav Ryhel <clamor95@gmail.com>");
>
> Your name is misspelt here.
>
> > +MODULE_DESCRIPTION("MAX8907 LED driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> > index e282dd82ece69..826d7768fd8d0 100644
> > --- a/drivers/mfd/max8907.c
> > +++ b/drivers/mfd/max8907.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/slab.h>
> >
> >  static const struct mfd_cell max8907_cells[] =3D {
> > +     { .name =3D "max8907-leds", },
>
> Separate patch.
>

All valid, but way adding led requires a separate patch? Just to know.

The max8907.h change can be left with leds change? It changes reg name
used by led cell.

> >       { .name =3D "max8907-regulator", },
> >       { .name =3D "max8907-rtc", },
> >  };
> > diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
> > index e222250f0cc1e..35b2ede54f856 100644
> > --- a/include/linux/mfd/max8907.h
> > +++ b/include/linux/mfd/max8907.h
> > @@ -112,7 +112,7 @@
> >  #define MAX8907_REG_CHG_IRQ2_MASK    0x81
> >  #define MAX8907_REG_CHG_STAT         0x82
> >  #define MAX8907_REG_WLED_MODE_CNTL   0x84
> > -#define MAX8907_REG_ILED_CNTL                0x84
> > +#define MAX8907_REG_WLED_CNTL                0x85
> >  #define MAX8907_REG_II1RR            0x8E
> >  #define MAX8907_REG_II2RR            0x8F
> >  #define MAX8907_REG_LDOCTL20         0x9C
> > --
> > 2.53.0
> >
> >
>
> --
> Lee Jones
