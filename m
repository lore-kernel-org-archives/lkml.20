Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793888938;
	b=pe9rdh87JJA9V+jTHvDgwjVvp7HfRMwOSlyW9XX/cxLS1r48dlDNFmPjEMgPYq4PceJz
	 vR9Qm+l+9vZBgG+O23rJveWWuD3dyN2MIz38Ka2LhR4x1S/DoZ6rLlSpN/yMzaTdIKKda
	 JSlFnu8HEHexbgHnsy3k9s4HCmWoOxlW7DO+WIfPpKyK2ngWFp5Ei5M0kPyB9xA1psjpC
	 iUvwgV6LvQ8y+4XLyrkSz3g8A52Bhe5nGI8EhmhQ6EUOdrbMAQmenqHLfLZtSathBiA7b
	 f2UK3M/oQGJszgKLV9kV/uoTpNuyTeVFPtQ7Y2BKLCb3lMLYybdWXdZKRFLfkED/Qgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jM7yD+UvZhCvYafkuTtfLIsJ/x+7XGZ5ALQNkyFmFdc=;
	b=tOvi+4ls6nZkPY+EIKKfAzCGf0+M8wncKleqVbFtvjbapjNl0zA+yNIneH6HuttVWJlW
	 uqYRmgOPBGW35hu59+EqHqCchvvCKnDji9/an8B2qAo1nynwmpwHjuiMpYEiM4PCKOxQT
	 gw9pl5iZFNmH0i4Fn9woT7Y9vSa+TqMunYffqJX0q9fQFbBJ46n6/x6cwNYQqaEIdiHSM
	 zXAQZD5sPq8bKaTgN0WZQm0ZUWWuxqzoddfiPFslYcCbcskS55T1a1loCmgT+IGDiwE8R
	 0vSb7KpiFUi876ABz13mPa397GJd7RdoqgJgMBqiQYyN+e2+nZAtZyFk3b4D1T0kWpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QhC9a/3D";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA30606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EA30606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhC9a/3D
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c43373ae89aso284686966b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:28:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793888936; cv=none;
        d=google.com; s=arc-20260327;
        b=FaHLB2P745Pg0VTbNozACfGqaoadDbT1IIrocglwOWfqaTy0zwLZ32XkN1c3YYU4oU
         ZEkz9GnHSNyXQJm99Tlrw37k4mxcbD4YrhQltFixYBIlU18V8OppekGnczBspwqqM++7
         q5zDvg29GXtFwL0SWj2NL7ggtFppqSCd7JiYv7v9RF4e12g18RAMRUtAULSqigaybt1s
         F4ZEV5plV2DnBmGPURcnvJ/jhS5dBPFujyWlu0X25hxd/6PmMcGGuFEc+qjzg/bd6MzZ
         Mux8HZeTUgYtvUv2b95SYfQYITIc8ube/gTCeKVgw0fv/lZF7Ni4N9uos44PVDGmXCnD
         Djqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jM7yD+UvZhCvYafkuTtfLIsJ/x+7XGZ5ALQNkyFmFdc=;
        fh=2A3ReCpYY7VQLb2MEMWdGXLNxc2NXUv9skBaKAI+vfA=;
        b=mprIjrbZ/u0ALe/YjswnV8JVi21U5GH9gYtug3zncR3OfukVV2SBKd7iBsBI5ApJAB
         qBNtbosVv5Vz0HeD6i/0t075eVSDGLPkZOq4wBhX9LYlJs4u2SjNCbvX+9m/5xNV7WOC
         s7BbcE6YAHExvxgJKmmG0TYhmOee7cgxDWOiW+Drr2Vg2rybiDb0frv3WEswrcgzWK95
         E7bfCxwEj4tMYyeANc3UVx9ByZNOynaJ0jZQzbqbC3U2Uw/fDg+J85Nbm13wrQXZR1TS
         tfIz52RLWBa6ma9hQzK1emTO6d9ONXcQidvvJII8LPp1aKWy0fgD9Eb+TzvP9D0cN3tp
         DDRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793888936; x=1794493736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jM7yD+UvZhCvYafkuTtfLIsJ/x+7XGZ5ALQNkyFmFdc=;
        b=QhC9a/3DtrgIoHIToyBwin+94OJwgACUNd/QUrZaPTI7NA9KSLe948sblTu4B+wrHz
         XDQ61kxk3bQTRZqNXy33zXhYW2Uw2A1f/uYKuDcz/bGRGypiyTeC+u7ARkngV6pJbfIo
         bZLaj3QXAzuJaXm24rHkKAwSTTONWmwEoNrUASjLUSqfCYw9fS75sHcth+kLMcadnbN+
         FyELI/3d6cLkJ2XtZ4E2SfFj9eVzDtT0UEGPIUT5FvDevJ1BE7Dv6iGuaoIdhD1f6EQ8
         xUDorTwy/IfpHTsAkjTh6z0qoeYD1Zt53JFF1uZZD/Ib5WJEN9tjo7NdmZ2t8doDW5RK
         edxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793888936; x=1794493736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jM7yD+UvZhCvYafkuTtfLIsJ/x+7XGZ5ALQNkyFmFdc=;
        b=uhhJ1EyTNsBaZ5Zk5EaLVllE/ooRsFy8XNxHMdQDKzxFqOr+imYRj7Agk0xbi0l+d3
         JibUhxE1JbdbsY/wkf96u5Y4CosDxN1FlxH6VpZJYNcTsj5GGJz7zYXE6F2ox6QOyDFJ
         iWWZb58Sgp2IUw+qTkjdqNmQLIF77m3yfvkM28S2evTR7JAAwrnPh/gjfUaVJY5UWQ5m
         qwQ1+dXjrU7VeEP3X/pOgQSbevQrqDSK0q2iq4+n8vIv27V4mFbSAg2vwe3lnyQJOVg1
         7GpXhtVt9a1EBUIArPq76BEj0TR0D20ew3lXpQTjuVSXYm6LhNq+u39WUD1OxsbKXlmA
         oqyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxB2+BZgVz/gHy/NWdFmWTksIhgDrkRPafUeL2at9Ef8fHDUlhckHZM5sLo8gy5fEaWvq+MnpQ456JfLqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ihKUATCAeCGMUxBeT4y6Rx5l2lWz0yctUxmH75mJOYNq3P/Pq
	Ic8abPVkdgX1ZQx5Jmu8vDaWU/OuZlwnGzGeEHrNYnJ0We9fcpxv04rAJIJ36ltkXWGI/N+FLV1
	G3Zx0vFGbA/2e2ot2s0ZDwp+X79lU3BM=
X-Gm-Gg: AYBFou09z5vEtQvGBsShCRMv77Qi3UKiUmZ/RV1KVbtJzm1SkXZIy8l/MiqRG9z8Jqj
	rhDRuMxY6XhcAUFjg9DfN/l4lngj3J7NnTQID0zBXdFPcur3MrF1cDdtAwPoCyVSAKE/kzZyc2n
	Tg5/kry8kTFZ5KNMXi8rHluVHQi6b4yY5tV+crGNmvMNw4nUjSCNWo6UtdxY5PTBk0Xv2l+NC0g
	eTMm3ZWWri+PROYyvIPproAi0V+PmgmC0V+QQTmP5E8ZZWRkovio5NQLu/c80szK06376Apa/lN
	f++ShTU8C0EGzWbOWp7NTKJHMgmmGK0Rv73rerZVp5VvXzFXW6op08cNdwGus683Df01AJAt34T
	lM4Hxslu+XVxvQaxxAUlAffiHjT5vJoSzK5Pj1hkW5DTIquo2ViOf5AYhj1FmD8lUwseH6eGBbt
	7svk5hZXxCf6aWUF6iIhIJNjeXPY2HkRO8S7eoQw06NVk/ak9FgPA=
X-Received: by 2002:a17:906:b10f:b0:c4c:f85f:aa2b with SMTP id
 a640c23a62f3a-c4cf85fb079mr528297866b.24.1793888935580; Thu, 05 Nov 2026
 06:28:55 -0800 (PST)
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
 <CAPVz0n3tR8R5xe_F20kChnHHrWG40o7prwY6kCYXM-UtYPFKLQ@mail.gmail.com> <20261105140843.GK1650678@google.com>
In-Reply-To: <20261105140843.GK1650678@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 5 Nov 2026 16:28:42 +0200
X-Gm-Features: AclHuK-5D29V0k3q5Pq6uMwZ9kKLHCkv3_XM79rEU9L5CC_QQ2cj_fenaRjE_co
Message-ID: <CAPVz0n0dqrJa5ih8pcgRpxG3e3rBrBr2AkAoNY=dwq8LJcj77w@mail.gmail.com>
Subject: Re: [PATCH v4] leds: Add driver for MAX8907 LED cell
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 5 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:08=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 04 Nov 2026, Svyatoslav Ryhel wrote:
>
> > =D1=81=D1=80, 4 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
7:16 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > --- checkpatch.pl (1 issue) ---
> > > Line 38: WARNING: please write a help paragraph that fully describes =
the config symbol with at least 4 lines
> > > ----------------------------------
> > >
> > > On Tue, 27 Oct 2026, Svyatoslav Ryhel wrote:
> > >
> > > > Add a small driver to control the LED cell provided by the MAX8907 =
PMIC.
> > > > The LED does not require any specific configuration and is folded i=
nto the
> > > > PMIC's node.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > > Changes in v2:
> > > > - rebased so patch is now applicable to linux/next
> > > >
> > > > Changes in v3:
> > > > - added check if led is off for get callback
> > > > - added dedicated MAX8907_REG_WLED_MODE_ON mask
> > > > - switched to devm_led_classdev_register_ext
> > > >
> > > > Changes in v4:
> > > > - platform_set_drvdata dropped
> > > > - init_data.devicename dropped
> > > > - added MODULE_ALIAS
> > > > ---
> > > >  drivers/leds/Kconfig        |  7 +++
> > > >  drivers/leds/Makefile       |  1 +
> > > >  drivers/leds/leds-max8907.c | 90 +++++++++++++++++++++++++++++++++=
++++
> > > >  drivers/mfd/max8907.c       |  1 +
> > > >  include/linux/mfd/max8907.h |  2 +-
> > > >  5 files changed, 100 insertions(+), 1 deletion(-)
> > > >  create mode 100644 drivers/leds/leds-max8907.c
> > > >
> > > > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > > > index 788e689fe875c..3796c562919fe 100644
> > > > --- a/drivers/leds/Kconfig
> > > > +++ b/drivers/leds/Kconfig
> > > > @@ -813,6 +813,13 @@ config LEDS_MAX77705
> > > >       help
> > > >         LED driver for MAX77705 PMIC from Maxim Integrated.
> > > >
> > > > +config LEDS_MAX8907
> > > > +     tristate "LED support for MAX8907 PMIC"
> > > > +     depends on LEDS_CLASS && MFD_MAX8907
> > > > +     help
> > > > +       This option enables support for on-chip LED drivers on
> > > > +       MAXIM MAX8907 PMIC.
> > >
> > > As requested on v3, please expand this help text to at least 4 lines =
to satisfy
> > > 'checkpatch.pl'.
> > >
> > > > +
> > > >  config LEDS_MAX8997
> > > >       tristate "LED support for MAX8997 PMIC"
> > > >       depends on LEDS_CLASS && MFD_MAX8997
> > > > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > > > index 3da746279bb81..24efda3fbaa44 100644
> > > > --- a/drivers/leds/Makefile
> > > > +++ b/drivers/leds/Makefile
> > > > @@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_LTC3220)          +=3D leds-ltc=
3220.o
> > > >  obj-$(CONFIG_LEDS_MAX5970)           +=3D leds-max5970.o
> > > >  obj-$(CONFIG_LEDS_MAX77650)          +=3D leds-max77650.o
> > > >  obj-$(CONFIG_LEDS_MAX77705)          +=3D leds-max77705.o
> > > > +obj-$(CONFIG_LEDS_MAX8907)           +=3D leds-max8907.o
> > > >  obj-$(CONFIG_LEDS_MAX8997)           +=3D leds-max8997.o
> > > >  obj-$(CONFIG_LEDS_MC13783)           +=3D leds-mc13783.o
> > > >  obj-$(CONFIG_LEDS_MENF21BMC)         +=3D leds-menf21bmc.o
> > > > diff --git a/drivers/leds/leds-max8907.c b/drivers/leds/leds-max890=
7.c
> > > > new file mode 100644
> > > > index 0000000000000..a5c445f75d1b1
> > > > --- /dev/null
> > > > +++ b/drivers/leds/leds-max8907.c
> > > > @@ -0,0 +1,90 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +
> > > > +#include <linux/err.h>
> > > > +#include <linux/leds.h>
> > > > +#include <linux/mfd/max8907.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/property.h>
> > > > +#include <linux/regmap.h>
> > > > +
> > > > +#define MAX8907_REG_WLED_MODE_ON     BIT(0)
> > > > +
> > > > +struct max8907_led_data {
> > > > +     struct max8907 *max8907;
> > >
> > > As asked on v3, what is 'max8907' used for?
> > >
> > > > +     struct regmap *regmap;
> > > > +     struct led_classdev cdev;
> > > > +};
> > > > +
> > > > +static enum led_brightness max8907_led_get_brightness(struct led_c=
lassdev *cdev)
> > > > +{
> > > > +     struct max8907_led_data *ddata =3D container_of(cdev, struct =
max8907_led_data, cdev);
> > > > +     unsigned int brightness_lvl;
> > > > +     int ret;
> > > > +
> > > > +     ret =3D regmap_read(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL=
, &brightness_lvl);
> > > > +     if (ret || !(brightness_lvl & MAX8907_REG_WLED_MODE_ON))
> > > > +             return LED_OFF;
> > > > +
> > > > +     ret =3D regmap_read(ddata->regmap, MAX8907_REG_WLED_CNTL, &br=
ightness_lvl);
> > > > +     if (ret)
> > > > +             return LED_OFF;
> > > > +
> > > > +     return brightness_lvl;
> > > > +}
> > > > +
> > > > +static int max8907_led_set_brightness(struct led_classdev *cdev,
> > > > +                                   enum led_brightness brightness)
> > > > +{
> > > > +     struct max8907_led_data *ddata =3D container_of(cdev, struct =
max8907_led_data, cdev);
> > > > +     int brightness_lvl, ret;
> > > > +
> > > > +     brightness_lvl =3D clamp(brightness, LED_OFF, LED_FULL);
> > > > +
> > > > +     if (brightness_lvl) {
> > > > +             ret =3D regmap_write(ddata->regmap, MAX8907_REG_WLED_=
CNTL, brightness_lvl);
> > > > +             if (ret)
> > > > +                     return ret;
> > > > +     }
> > > > +
> > > > +     return regmap_update_bits(ddata->regmap, MAX8907_REG_WLED_MOD=
E_CNTL,
> > > > +                               MAX8907_REG_WLED_MODE_ON,
> > > > +                               brightness_lvl ? MAX8907_REG_WLED_M=
ODE_ON : 0);
> > > > +}
> > > > +
> > > > +static int max8907_led_probe(struct platform_device *pdev)
> > > > +{
> > > > +     struct device *dev =3D &pdev->dev;
> > > > +     struct max8907 *max8907 =3D dev_get_drvdata(dev->parent);
> > > > +     struct led_init_data init_data =3D { };
> > > > +     struct max8907_led_data *ddata;
> > > > +
> > > > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > > > +     if (!ddata)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     ddata->max8907 =3D max8907;
> > > > +     ddata->regmap =3D max8907->regmap_gen;
> > > > +
> > > > +     init_data.fwnode =3D dev_fwnode(dev->parent);
> > >
> > > This will evaluate to 'pmic'.  The sysfs attribute will be incorrect.
> > >
> > > Since there is no child node, why not set 'ddata->cdev.name' directly
> > > and use 'devm_led_classdev_register()'?
> > >
> >
> > This is required to be able to reference led in the device tree. Since
> > led node is folded into pmic's node, pmic's node is used to bind led.
>
> Right, so you need device_set_node() called in led_classdev_register_ext(=
)
> so fwnode_led_get() can look up the LED via the parent PMIC phandle.
>
> However, passing only 'init_data.fwnode =3D dev_fwnode(dev->parent)' into
> led_compose_name() when the parent PMIC node has no 'label', 'function'
> or 'color' properties causes it to fall through to:
>
>     } else if (is_of_node(fwnode)) {
>         n =3D snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s",
>                  to_of_node(fwnode)->name);
>
> Which registers the LED in sysfs as '/sys/class/leds/pmic' (and fails
> with -EINVAL if 'fwnode' is NULL on non-DT platforms).
>
> To bind the parent fwnode while avoiding the node-name fallback, please
> also populate 'devicename' and 'default_label' (similar to
> drivers/leds/leds-tps6105x.c):
>
>     init_data.fwnode =3D dev_fwnode(dev->parent);
>     init_data.devicename =3D "max8907";
>     init_data.default_label =3D ":wled"; /* or "white:backlight" */
>

Thank you for your suggestion. I was tinkering a bit and got to
conclusion that adding dedicated LED node will be beneficial.

My idea is to add led node without compatible (since it is redundant,
pmic has only a single led anyway).

Driver will check for this node and return -ENODEV if node is not present.

Then I will use devm_led_classdev_register_ext but will pass led node
and then most of your concerns should be addressed. What do you think
about this?

As a prerequisite, this change would require
https://lore.kernel.org/lkml/20261027114634.79706-1-clamor95@gmail.com/

I have answered your concerns regarding Sashiko finding.

> --
> Lee Jones
