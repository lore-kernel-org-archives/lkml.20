Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717275;
	b=PbsZORthg+6fA93ppXahnUJczlE1Cd1JLyLVlpA6ub7tGYJq535Ay2vsPGKAlGmeyQQW
	 A+YuqscGH466pFC+JHFf1u8yvRmnd+0hbZY7p9OEZ16OatINiSiabDDodqRa4j5yV/rI0
	 Y3si78sBI2EWgBBo5AKCuMlvjakQ2Uh7rp8Bf+sD6W+HZj8VHGnJD1ewaF/1+Mgjxn3hy
	 tYANLEOj1iwyFz2Qm9FmgZCMePZcmt7ZYRV7EmRi9f0PUZ2t/8/yzKbscEG0pV+ESOwoR
	 mhGRjXv+2+qfaQIBUrPEyyeSEdu2CWdp/Eh6sIhlyOGPFGwKoJHJd+PzHbDbC+p752w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EmwaoLyEu5PNjBx2vvNAolYKonR5/swVcE8YNHDBpts=;
	b=5FmSoBNxA5aiE9kaJz+4dJm1cvp4u3w7ZOTrya0mABB48+UPhvCuTN83LDw09b/n1QYB
	 Xj4AElYJl1V8L5RnGU8ba6zwmk6mzfXYM9R3YHdWlxzTcsEOuNphoMAGu7qYia8JScJwi
	 GHwm/oDcnF8gCJXNWnipgWQHbwxSsQ4UtnmTsLeKzuaoNVe4Z2p595UWQYwx16g31cQRz
	 NilgjfhS35cCR92+MwEaNuD5gmhArvZliFSV8tgPI+/jnndQ3WrQOSAzkdBQhkjG4K4so
	 qZfP5JoQFJWWgj1MFrRsSddLaQjEyu8EtfxQjVeTkNhdlgE2Ghl6g+Q7Q8RNYV8JjAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PkV3LUIS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87AA608361D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B87AA608361D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PkV3LUIS
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a8cc11ac42so4189877c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:47:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717274; cv=none;
        d=google.com; s=arc-20260327;
        b=NFNQ0M++7VRDmuI644KE4CMmq1usqOEbdrj0JhdLaVJvsotlqFXpdWQAyzqprrvG8q
         82o/IUkugqOQoW8x4N/KD3SN++YRVlyzttS6hVO9mgYTZ9DqDD0zMls23gBPTzJr5cfZ
         SAOzO2SydZRpUzT1vjY2Mg93JsTkHMmvN41tcgIK1EdLySZtYHX3Cs2xxCuSLLhl8i/3
         JkbHJEfg/oFObjbFFYkhw5rTwwzHVJfeGtvXP5OIxmLhkT+AQR49sqlLsv/RA4aGsI2k
         gtsTu6D07vfu5jNcd5g6wKs6edyenVRArQos9I7bSoNRUKGsQLUA1obT80l3y+BXPdnT
         2fKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EmwaoLyEu5PNjBx2vvNAolYKonR5/swVcE8YNHDBpts=;
        fh=xy3kxS0nIKWP9FbOqwbJ5J+glpi1pqvu6MPrKPr/kCs=;
        b=M0quYbg5wqPhK2KtAG/A5zxITdJS+LfCHOPabaS3CqYbeekVcRVpcC/+oUhYA9nAH6
         TOzx1Rpry5mb5Urg0YXwkyTL5aDjoOyVaymRNgz2/hBiustV5nISF67lB16nKQ7uMUii
         IIPRYVLBaTMQ7YdgVLXZ1yn5WUbtqyPcie8gExe/ldorHEGhsV3z2UbD5cIYVZkQRk08
         9TXqTGdITnV5IuKGQ5ErTLtwPKKaPXn+kJJCYanK9jaoywivbOUbXJ/cQ/518K8haH/d
         eCNxRFZr0PAEW8h26Sxi9xz032mSosQ1cwj+srpk3q1+yX0DfQg3WMmVkw/dxMCKET+L
         8sbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717274; x=1794322074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EmwaoLyEu5PNjBx2vvNAolYKonR5/swVcE8YNHDBpts=;
        b=PkV3LUISEPLdJuG5ockFsbkWeTNCdGPjsM3OgX3ZKb8sPxZWknOWER6K3fjpWHeUPZ
         UqxyeuYGcGdvoACDHqtpxEIwQ+dVO2aQtNr3GtGNglUofucgd9J+mRTPlbEjqi0wfrN+
         DXX5amGEqAKJGdygbd58mxBZ/wvfoiuDFytn3OmnfwbROqB7IqRwi9GhT1+zUPCfjzB+
         gvFXWu6qmoHmrG/XvunGX8hSOaMurXUef4Oye7twOr8jw/CYxDMoxFcwklG+X1tpuU7Q
         3bluhmj8bVjGJKsi1chBKJXcreOXeWLzaSuzWvr2gU+3nIQXUuZPVNH/0HuWgARsZOR+
         jPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717274; x=1794322074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EmwaoLyEu5PNjBx2vvNAolYKonR5/swVcE8YNHDBpts=;
        b=wCkUqD+AOHpYi8FhzbYikMqYRWmdGHXKlVHqlt68/kZdnJlfl5IuQIHm1INqOpMtR4
         ps+KsfXT73DxwquZ6K8qdxz1s7iVCX7c87Dovy8lc375UFwzowou2cUXE3Jq4y2uaPfS
         2u5WvbmhAi4o1bCyWlkdHFNl7jnPKC80AjHPcK2nBapGQgmvyjghikJ8182GljgA7hYb
         4fGYjr9qea/wxlvbBC33Ecend+dpR8bQFPgO0OjnkBvw4FoypHt7fyCTy5FalgMHMO3j
         t9tKqodMHJrt/3dtmsBolduN4qhrJbO1slsb4iJgAOcHnvfaYRDgq8+g+TOyhcfOLWZa
         Ct4w==
X-Forwarded-Encrypted: i=1; AKwUvBwVXuEmYyUUNql+ou3gRVI8zqIV6+AOKtbJRjiA01kbCnDXw5zJI0/ijadUc+emculi+xD6SJksLIlBtQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Sp4Zq8aTjL4qWvDIIDVeQCTC65t6lf1LkMjziMfUm+GD0xrxt
	rq+aoWK3D0wOe25mb9nrIT0ilvr60iHu2YLiSlieKliiuENpMGilEabi0Dg0aUH30TZ3ZXIVoUU
	SHmcITsJeePVDhx+eEnCnRRLFH2F3kn0=
X-Gm-Gg: AYBFou32R0BPU8XQrPO3YllLTBo2cV/2Y57akv8lnSD/faIX0bbCegQRhGN3XJcYBHL
	eM5y5ylsH4/D+LtRFG2FEhg4ns0OP0wgGyuUz6CTtzto/ygZxX63zjhHTBTqQZbMnGZmq2vE2jH
	3bLjE5YtGwdX91EQlq0dhK8rogr2G4G/QgMsOGZRQ7D8BJA4y+sA8DPmd/3SGJBfjYwHucEAOiH
	QTFk/j0rnO4aPNB9CZGqm/3OMN+d3CpSaGRih6pvDTEYatXSsi3zMa5oZRXAGnsm415iBOGKscw
	ZYe+DcxThuSQ1Spdo9KjaCM3DMTGUd2xntG66gAWOVvP1dhEA0ejzlptm6hsXIlR2oICutiblDS
	pMAvHroZzXzoSNQ94YQ4HT5tTNvtHF6T6K90WGg1NV7sAdRlOTEzNAsHAuOsD8m+r/sJSSw==
X-Received: by 2002:a05:7023:90b:b0:14c:8461:b3ef with SMTP id
 a92af1059eb24-1ac5e6f5132mr25490470c88.24.1793717273733; Tue, 03 Nov 2026
 06:47:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <20261019100406.103687-6-clamor95@gmail.com>
 <179249575817.1833288.1089755405582445022@kernel.org>
In-Reply-To: <179249575817.1833288.1089755405582445022@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 3 Nov 2026 16:47:40 +0200
X-Gm-Features: AclHuK9ZpOIriaiTNLrTV18kT4HaNtHT339MXb6YEPw-7495gnOAW9awk73Le-M
Message-ID: <CAPVz0n0=6Z7E9iSc84xL6Jt=Xi=a=qmSwVsT5g-LMZ+mENFkzg@mail.gmail.com>
Subject: Re: [PATCH v12 5/7] leds: Add driver for ASUS Transformer LEDs
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 3 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:03=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, 19 Oct 2026, Svyatoslav Ryhel wrote:
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > ASUS Transformer tablets have a green and an amber LED on both the Pad
> > and the Dock. If both LEDs are enabled simultaneously, the emitted ligh=
t
> > will be yellow.
> >
> > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > ---
> >  drivers/leds/Kconfig                    |  11 +++
> >  drivers/leds/Makefile                   |   1 +
> >  drivers/leds/leds-asus-transformer-ec.c | 125 ++++++++++++++++++++++++
> >  3 files changed, 137 insertions(+)
> >  create mode 100644 drivers/leds/leds-asus-transformer-ec.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 7ec2c8d785426..788e689fe875c 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -120,6 +120,17 @@ config LEDS_OSRAM_AMS_AS3668
> >         To compile this driver as a module, choose M here: the module
> >         will be called leds-as3668.
> >
> > +config LEDS_ASUS_TRANSFORMER_EC
> > +     tristate "LED Support for Asus Transformer charging LED"
> > +     depends on LEDS_CLASS
> > +     depends on MFD_ASUS_TRANSFORMER_EC
> > +     help
> > +       This option enables support for charging indicator on
> > +       Asus Transformer's Pad and its Dock.
> > +
> > +       To compile this driver as a module, choose M here: the module
> > +       will be called leds-asus-transformer-ec.
> > +
> >  config LEDS_AW200XX
> >       tristate "LED support for Awinic AW20036/AW20054/AW20072/AW20108"
> >       depends on LEDS_CLASS
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index 4d4b089156e24..3da746279bb81 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -15,6 +15,7 @@ obj-$(CONFIG_LEDS_ADP5520)          +=3D leds-adp5520=
.o
> >  obj-$(CONFIG_LEDS_AN30259A)          +=3D leds-an30259a.o
> >  obj-$(CONFIG_LEDS_APU)                       +=3D leds-apu.o
> >  obj-$(CONFIG_LEDS_ARIEL)             +=3D leds-ariel.o
> > +obj-$(CONFIG_LEDS_ASUS_TRANSFORMER_EC)       +=3D leds-asus-transforme=
r-ec.o
> >  obj-$(CONFIG_LEDS_OSRAM_AMS_AS3668)  +=3D leds-as3668.o
> >  obj-$(CONFIG_LEDS_AW200XX)           +=3D leds-aw200xx.o
> >  obj-$(CONFIG_LEDS_AW2013)            +=3D leds-aw2013.o
> > diff --git a/drivers/leds/leds-asus-transformer-ec.c b/drivers/leds/led=
s-asus-transformer-ec.c
> > new file mode 100644
> > index 0000000000000..1b129247ea6c6
> > --- /dev/null
> > +++ b/drivers/leds/leds-asus-transformer-ec.c
> > @@ -0,0 +1,125 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/err.h>
> > +#include <linux/leds.h>
> > +#include <linux/mfd/asus-transformer-ec.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> > +enum {
> > +     ASUSEC_LED_AMBER,
> > +     ASUSEC_LED_GREEN,
> > +     ASUSEC_LED_MAX
> > +};
> > +
> > +struct asus_ec_led_config {
> > +     const char *name;
> > +     unsigned int color;
> > +     u64 ctrl_bit;
> > +};
> > +
> > +struct asus_ec_led {
> > +     struct asus_ec_leds_data *ddata;
>
>
> Why do we need 'struct ' at all?
>
> If we put 'const struct asusec_core *ec;' directly into 'struct
> asus_ec_led', we can drop the outer wrapper struct and the back-pointer
> completely.
>

You propose to allocate asus_ec_led for each led in a loop? I have not
seen this done by other leds. The asus_ec_leds_data is driver ddata,
asus_ec_led is each led individual structure.

> > +     struct led_classdev cdev;
> > +     u64 ctrl_bit;
> > +};
> > +
> > +struct asus_ec_leds_data {
> > +     const struct asusec_core *ec;
> > +     struct asus_ec_led leds[ASUSEC_LED_MAX];
> > +};
> > +
> > +static const struct asus_ec_led_config asus_ec_leds[] =3D {
> > +     [ASUSEC_LED_AMBER] =3D {
> > +             .name =3D "amber",
> > +             .color =3D LED_COLOR_ID_AMBER,
> > +             .ctrl_bit =3D ASUSEC_CTL_LED_AMBER,
> > +     },
> > +     [ASUSEC_LED_GREEN] =3D {
> > +             .name =3D "green",
> > +             .color =3D LED_COLOR_ID_GREEN,
> > +             .ctrl_bit =3D ASUSEC_CTL_LED_GREEN,
> > +     },
> > +};
> > +
> > +static enum led_brightness asus_ec_led_get_brightness(struct led_class=
dev *cdev)
> > +{
> > +     struct asus_ec_led *led =3D container_of(cdev, struct asus_ec_led=
, cdev);
> > +     const struct asusec_core *ec =3D led->ddata->ec;
> > +     u64 ctl;
> > +     int ret;
> > +
> > +     ret =3D asus_dockram_access_ctl(ec->dockram, &ctl, 0, 0);
>
> As requested on v6 and v8, why are we still using this bespoke accessor i=
nstead
> of Regmap?
>

https://lore.kernel.org/lkml/CAPVz0n0imF_ESoGMJSrEX7NOnBShFj8wehDtQKXZV_DMc=
Gqq=3DA@mail.gmail.com/

> > +     if (ret)
> > +             return LED_OFF;
> > +
> > +     return ctl & led->ctrl_bit ? LED_ON : LED_OFF;
> > +}
> > +
> > +static int asus_ec_led_set_brightness(struct led_classdev *cdev,
> > +                                   enum led_brightness brightness)
> > +{
> > +     struct asus_ec_led *led =3D container_of(cdev, struct asus_ec_led=
, cdev);
> > +     const struct asusec_core *ec =3D led->ddata->ec;
> > +
> > +     if (brightness)
> > +             return asus_dockram_access_ctl(ec->dockram, NULL,
> > +                                            led->ctrl_bit, led->ctrl_b=
it);
>
> Use 100-chars throughout to prevent early wrapping.
>
> > +     return asus_dockram_access_ctl(ec->dockram, NULL, led->ctrl_bit, =
0);
> > +}
> > +
> > +static int asus_ec_led_probe(struct platform_device *pdev)
> > +{
> > +     const struct asusec_core *ec =3D dev_get_drvdata(pdev->dev.parent=
);
> > +     struct asus_ec_leds_data *ddata;
> > +     struct device *dev =3D &pdev->dev;
> > +     int ret;
> > +
> > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > +     if (!ddata)
> > +             return -ENOMEM;
> > +
> > +     platform_set_drvdata(pdev, ddata);
>
> What consumes this?
>

Seems to be an overlook, must have forgotten to remove it during 12
iterations over last 10 month

> > +     ddata->ec =3D ec;
> > +
> > +     for (int i =3D 0; i < ASUSEC_LED_MAX; i++) {
>
> `i` isn't just a random iterator here - maybe call it `led`?
>

This is just a disposable iterator.

> > +             const struct asus_ec_led_config *cfg =3D &asus_ec_leds[i]=
;
> > +             struct asus_ec_led *led =3D &ddata->leds[i];
> > +
> > +             led->cdev.name =3D devm_kasprintf(dev, GFP_KERNEL, "%s:%s=
",
> > +                                             ddata->ec->name, cfg->nam=
e);
> > +             if (!led->cdev.name)
> > +                     return -ENOMEM;
> > +
> > +             led->cdev.max_brightness =3D 1;
> > +             led->cdev.color =3D cfg->color;
> > +             led->cdev.flags =3D LED_CORE_SUSPENDRESUME | LED_RETAIN_A=
T_SHUTDOWN;
> > +             led->cdev.brightness_get =3D asus_ec_led_get_brightness;
> > +             led->cdev.brightness_set_blocking =3D asus_ec_led_set_bri=
ghtness;
> > +
> > +             led->ddata =3D ddata;
> > +             led->ctrl_bit =3D cfg->ctrl_bit;
> > +
> > +             ret =3D devm_led_classdev_register(dev, &led->cdev);
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret,
> > +                                          "Failed to register %s LED\n=
",
> > +                                          cfg->name);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver asus_ec_led_driver =3D {
> > +     .driver.name =3D "asus-transformer-ec-led",
>
> Clever!  But, I'd prefer we still to the usual format to be honest.
>
> > +     .probe =3D asus_ec_led_probe,
> > +};
> > +module_platform_driver(asus_ec_led_driver);
> > +
> > +MODULE_ALIAS("platform:asus-transformer-ec-led");
> > +MODULE_AUTHOR("Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>");
> > +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > +MODULE_DESCRIPTION("ASUS Transformer's charging LED driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.53.0
> >
>
> --
> Lee Jones

v7 seem fine https://lore.kernel.org/lkml/20260702162425.GD2108533@google.c=
om/
v9 as well https://lore.kernel.org/lkml/20260702162425.GD2108533@google.com=
/

Yet again complains and nits
