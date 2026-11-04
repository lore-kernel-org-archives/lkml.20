Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793812302;
	b=A1yCBmrw2wX7Kh35lKtAlsbnHanaDzLDTAgcMzJT0EoFY55jo3gKM9Dd4cjr1AdQFOCi
	 e4cAjMYsqEOxbPX1m0nuULBQ9K7Rqrul2i6sCoEDuofAE4GjfeV7Kcy6kXUE8hqp+TnMy
	 5a/LG7cwK8tUOKLXGclOBUxYREZvzu5HNviMMx3aQCJwad2GDpb7WtBstnuO0EXChX294
	 SHFalA4qyLA5AK23zaZzlK0KOntLVWxPFUNe2LZ+0/LQhQRbDXxELB80FW9ICYYqnDIo2
	 9KJvep2u/8bBAQzDL1XE5ydXCtHyRMLL4ASpMKiTh0Y/0QgE2N01UzdzGJ9ZjZeQHGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vLpPSm7/G9CGwwl+f3j0Z0ukU9iAToPS+CRUPv/RJVM=;
	b=kgDx1fZ6gyHxUZ7LZKFP7yRUjWRmCObgkUcJnUSepztVg1x4yFlaGV7/Y6RakWBsMjdf
	 UEbLLpqrehcxSEGX8izE4I9+wwd7H31Y+vAQmxbaixKy/CtiMTaO75LfbZGUB8tANwAux
	 xPtE3MRqKLkj0gepQKcBuc9dIHRIb2flE+At91QKxcbqbwOoGCZKD3lATfSZyxnhLHNep
	 LBW1VdXXCSgiApolCHQvMXX7tN84ECgTymGPG8xUisQBp3dN/DjVxrgaW7QDPha/342jb
	 VHFf6Dkp40CzKwchjQTreBhU1My7e6V3OA5ItRrgeHyqHW04x1RZ1/xkAuv2PshkjdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g9e2/awe";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175DE606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 175DE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g9e2/awe
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a3c08d6928so1483256c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:11:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793812301; cv=none;
        d=google.com; s=arc-20260327;
        b=Ox2qw9he9axrt70b04B6zUdz2/LqCODVB6FEPGHzcwmyG3qti3UWQef/l7sVzi1cfX
         bBpze/Bez015cLKvojwtEGu/x0TcnKaWDD9Wp9Y2JvdpcXfBVPtjLZQvFVgslElNbUe5
         chhXeaQyqoeeOk3/0lbhB9idappstyU09nwZflEVPVcRgqjOVJDRNhfgzPfDKPYrxaY3
         /BvDp2DLYH6Wux3YWlLKMsxtSLP9KI3YqG9u1aCytDrkI7q2vJG1b1yj9HtoRDKDcxO4
         zfb3nwICp/OtVtp9KHLLaF3/WhiNsfbONq4bmVJHoWznkNTKxyMvv3IqTQn4JOzM6RkY
         dNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vLpPSm7/G9CGwwl+f3j0Z0ukU9iAToPS+CRUPv/RJVM=;
        fh=9Cvao5RGjp6kHuR6j67DtLxo6mvl/v9cf/T3t4JrzpU=;
        b=NlFqaNtYwWenYNR5PingKocRLh+oFQmEFjPqgiuvhn5F9CNPaZK0BobSxyuUC7J57c
         mkD6KBM81nYOG6WTYXgn1kUSvs5YCFXaLUa7sO0E8XhRnwjYWdhK8Le+c6Zjz/ZEFj3U
         Kxr0e5WPt/a3f2IAEZhwthcqyX3mfDvTjN7YI8RdW5PTKyFsnvYEZJKDPcpaxthG3L2J
         qWiWBKqla9V7hE3AYqDLFBNjZPekSgOyRHstKsmU+aHKSOnAy6OugaEwgQ9XyiosyUOy
         1hOSY8wZzFJaatNNaEMAuuz6rUF7XYKz65OIhdLjGsQEtLkJys0A9FZRA3dH1iW5IiAX
         PH2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793812301; x=1794417101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vLpPSm7/G9CGwwl+f3j0Z0ukU9iAToPS+CRUPv/RJVM=;
        b=g9e2/aweCrDqLnLcITse1QShLZthHw8Mqly8wXXa91UBm+nSLtmAQ3UHIgYBJmnKtj
         0yhmcIs65LXXpK/TecaTncBnPQ6sJmAdUo5dBvrO/TFuODZFLra0oQudzDKAMDuqJr2t
         TDQ8NUjAJ68cNOlHjpilc4tahvoVwdNp0wz+uZBpmuL4lZNOuqKzyP6HNEGH6Zqlyiw5
         V4R3x78vyrMlj3j8WWwkXUjqIfBpvmqX0J9tnyaO2rnPcBiTDH59ENZOQ1JixF1J6zkk
         iRqCx7J8sXMkMx6I+MGWG/QE7cZ9pJIfbhyV7wHT5D/mV+54jTln0fAU6ifd4AOibU0z
         BtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793812301; x=1794417101;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLpPSm7/G9CGwwl+f3j0Z0ukU9iAToPS+CRUPv/RJVM=;
        b=Ulh7a16VlFu8Nx0zMfJrPs6bmlEixTQEJkY9fGc+dWViKA+s1H3ZFVwHd2RcvKugkq
         90GeanIbFfv+Gypf/JIQbkytqi4Ur1Tqo3kjL/00of76iQwru1V0LaE+CzS8W3JVHhaf
         lKNRtjdUwgw/Tz+LIfR7nMCDL1AW5atfPijCJE81lQf+1D/4NDEIygdKAmdoMDbYSpBR
         c0IbmYfYQffwFqJXKlTD8ZcHDje8S1UtMszx9/ympLBioQZvEXUOlQAHEtAJDmfH6SRc
         tA4CyIZZOkzHs+CEc4+PQB3/ibJtBqFRKeAu4VJHEQOBMlbf+7K4juKsfsnCcO+zEHwz
         0M8g==
X-Forwarded-Encrypted: i=1; AKwUvBwprzfoKAH6Ts/s+fl8pT/cO2uaem2ZxJDlRy9aUmDGyqwe47vim75bgLJnKMnkyfhd5dALAKKJCHjtx9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jkO9Ae8Bkwgd+nNWn/8r3ILTVBswRrjsotTWGlFXKS6fDMyPn
	u5ZfaCAEpI3UokyNNxw+GcRjHuTyKV2Iq65U93fm5APOVuA/b4hN5E4sUAxV0mjK9h0F/e2LyRO
	rK/J+2ZkBgPhI6gNVtnT83Lwo4xw30+8=
X-Gm-Gg: AYBFou3yVHgUz0x8lnuVVpHFjEl91WTbk0x8Hu2cCphYyfAjnemkQ6TupyMqPLGVo2I
	reMWjM9iiA+3ZR4XUFjJ1kJ464poJO01VIUmenc+vcuxyiF4noI2oYH7jdXs7F80lQt5YQgFq6h
	fAQ+3cadbttH8t4hj9fx1TKDV0E+7TJekALq1w6gnThIMno0xisMLZw5iQx5KpU1oCIYpMjAaso
	/FWHk/ga6FlVASuiwTtLk1SgNSTD1D4PZ2AFLV3VfEps3u+WX8sU6MG3wt2CzDdy92zldInOnVL
	7lBDmt+Pw+TTr2gOXjxQ0BKW7B64hUi/8DonjuPP3sSCduXwW4OY3Dgc7e43LTvz51iElC5fI/c
	XgYlgL6HFpmWBQN6dqWur7bwT38e26wm+qeRP0wbDP+/3MKx8vBhALpv6dNXHBSf677+V1pw=
X-Received: by 2002:a05:701b:2094:20b0:15e:3a65:5b97 with SMTP id
 a92af1059eb24-1ac5b028805mr25800804c88.16.1793812300785; Wed, 04 Nov 2026
 09:11:40 -0800 (PST)
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
Date: Wed, 4 Nov 2026 19:11:29 +0200
X-Gm-Features: AclHuK-W6Ff7Myct4ijzugesQFIYDn63N4IFMyOx6cneGQ-BUwydTKZuesFNTiI
Message-ID: <CAPVz0n3tR8R5xe_F20kChnHHrWG40o7prwY6kCYXM-UtYPFKLQ@mail.gmail.com>
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

This is required to be able to reference led in the device tree. Since
led node is folded into pmic's node, pmic's node is used to bind led.

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
