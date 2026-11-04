Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793783974;
	b=m1ZX3ZbEQs4OTkYVUJCYHPdqLeQjTPhnx+s9csGx0J7h+/z/Z0m/KQYw7G4Ml1wTr1jP
	 NLhJxARBLrGI/JWppRwqtmAit3pisKZ8TAvhBFIveaGB1zkgTKBdKwT7b+h7KMC7dzFRc
	 88+8RpWA2wyhQKU8bg9b2zkPPOW0NkZQX7hj667U6UGUzPCGhwQIVHmlPxFYcnJShuiF4
	 RKOphhqUps/NLr11PKUc18aadMMuy3025eYaraJU5L0Jpk9SVRhaEUygEhCH95JjQyZzB
	 zuWOIdF9glxND+acgSV+AUI3rt0zx/zUOO6SteXzkhKjRu1RGIn2Nwha3hpToLVbyAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YRz/K05YLArkwgmmoG2AbhmGzTf6qgCvL/rORwgm+WE=;
	b=wtMfEM23iShoYTpmw3zYjwYZOh7g4KadGkJLlK7jg7SWynsQQkuUH1Jz0Ubf07uRa5A8
	 6GLUwD/GOpYdO8RkSE459duCt3vod1LATPHCt8+ve8GqAiQlGjPa53pY6mBDJtqJFTKAz
	 Oyo42bCzTmN25HGPwcbytceSjkmtvoPfwjzRPmXzqJNp81Nc7LAKu+EiSLl0gsJvDqjjs
	 y7PXaQZreOHerhHMSMTeg2NHxcGjaFv9X3zqwWyIGr2QpTYTngtLf9f3N6tn6/zTex0fp
	 JsFE5FvYV8+OEQg4eNpTloye9VbXdADvgZziwlyrGdkyCjdee0LfHVAKZBucxa+pcgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayb69Ya0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283EF606A333
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 283EF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayb69Ya0
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so952575eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:19:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793783973; cv=none;
        d=google.com; s=arc-20260327;
        b=YxlqPZPw3gWFPzPamSU5iBbpIXT1uTCkpAjUTPruletkjSQoeP0qjyTjaRh+bP/hVN
         Wfez4zclCldCu/s54gYIIUYqQQlmsNa2267ZQB2FBOw40R6az5yCa925XociWlT7VCS0
         and940b9AFdT9r9eG1mgbJy3MoKqUfpLCPkvUsjgyjJDYK4rhFfrAupq4uW8K/FAnWl6
         jcthNwscDzX2m2NHDS5za4gTPzcJrlZbNwCNE8Lo8bjUKfLessO9MdzbtQ3nf8+aXCSU
         ZxcsoQtc8HSzLeBRcYeVFkhwTpZ2iJh3eRJeFYqWEKPeracscIQ4VvafOzxl67sAGYCZ
         R+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YRz/K05YLArkwgmmoG2AbhmGzTf6qgCvL/rORwgm+WE=;
        fh=YbyMAz1AQQk7dhdzgS5THXwhvn53TqfQ5f2PvN3cpk8=;
        b=s4XdjhnUWpmGGodHX6kPfHakIBduVYqybbubMHMra1E3kC9qbKcYHapiVAIqHEZGqg
         GQNLM42tHiFXYorGKNBeHsB8Ax9JpeQU4UDbB0Tgn/Xs0cFxnFJvWDwNK9Dj7ZQeOHFT
         xSK699mGruzCKobnOlOSa08J/O7mSXLspkXEDZLDNwxvo1USmCTYUuGLzGh6aw+QbQdH
         Hg3LV+klaUd86ERCKNYUlTk9ZJhIPcx8UK8y8n4vnCyYTkdXN1nkjTN8kFAlTEX3X79j
         MKOSN8eSeDwCPBq9Ighlcj0i/YPz72WtGMI9VLVV1jRCC2xCt2fjfoFcxEqVgbIw/N3n
         snog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793783973; x=1794388773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRz/K05YLArkwgmmoG2AbhmGzTf6qgCvL/rORwgm+WE=;
        b=ayb69Ya0o3ph0NsLKgZZUPiW2eL5NpQakbmSq8k43meo1an6qOsZDlEClqja0l9yiC
         qlQbarq40NXikJpoLVDStg73boddpAiquWgi05oXTgOeS73aRXuhGeLRIer0V/Ivz8uv
         v637Knpn6gaxU8Fl75XUkf1Wu/vGUJ1QLVL8ZTNuD2uH0y948IIEL388RcdxEcf7Ek2d
         L30ycVVgfTwDPZyeid/m0ce+ots4mOOfju4QjR/9qNipWjguXb1iOs/Ex1RT1tnDxZsQ
         ZNJ7NTpKzI5CCc5IqZTilho7RzIXUY/3DOkQNH3vTlh56SVIqAUrIileY/MPHaNE871h
         vetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783973; x=1794388773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRz/K05YLArkwgmmoG2AbhmGzTf6qgCvL/rORwgm+WE=;
        b=MxHOaH5X4nrmV1Kym6eSCPGrAqTh83S2jYAIuXf2cNTQsukM6ijK8JwZ6vNaFW6bjA
         YZHyLKGjPAvfq9RFnWYVnetSQiJekpRmdbzsrNQGzshv5E4DCvmUExaYnuhdRHMbIc2E
         1AIfpGquwQJK8QR6Yshogf1k42ghdZSKDTnvnLJTXtBFpnsgsLd6e14gBPsKw2zXUN+X
         ktAGouqPR510gijvayLNNsYTtEnFztBIkmVxLHZ0yBfagSvbSBAzPeCy7uXyIlVwuQnj
         4BFfXwP/zf/8qoE78nR5lgmFe48ggHpxQb1omZZFW6DbCI0lNI0quLpyvSu6gNb39bau
         ik7Q==
X-Forwarded-Encrypted: i=1; AKwUvBycitgkxrYgNvdnl02W2QNkIXEdf4qGoHnm3XL3JVQX7XZwsdqvpd6Qnm6nqDFUlvOgEcYYytnLGcCQQbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rviy1b0jl7oxqoeFAY0CgZ5qXxL1in5ItSzFFa2Wna1LnPuny
	EOb/6ojhOk8uOAAdy++wCZg2R7FDxpxa/MpEV0FnT/FhEXGHwdZxcThHK04NqbovsK19KdiKZAH
	sIZtcc5tlvfXjIIM8KaEBMS7lzRBAQL0=
X-Gm-Gg: AYBFou2RvrROB2vzKqJQ3I2eaCpdYxq/xDhR8iRuZ9QdZRH8HGhG69zPuXbmBuu0vCd
	LTACtVvALc7HZQWy6p4f8lqMuRsoRNB60Cv1wmzu8ZBzIw6khDdfZtVIzBxqMcsqesEIjLOFuCP
	n16Esb3Nab7Qp3vfLP+PQyYTWBqGEtHWXby4+rwKByOeyRDn+NFhwReE5CTmYC3VD+F0FNUa2xa
	CP1S0RBpKTEJN8GXSYrJcKOPE1Y7PIZ1FYxvX49jmaWDe0t81aBjXbfZhd/lefqSWwb3HGWuRNC
	keiJhrLcpkGYsHByX4MCY0NPPRDtJXhOOOe+LFFVythbR8B8SlN0nWto1G8iNzXjicMlbnLQ/P2
	P4AX57qkapGLB830eFJXkfK8w9eWRA0e9gMMSM8vyIHEcUWjnq4YPIrWlxZvnBnnnyFiiNQ==
X-Received: by 2002:a05:7300:cacb:b0:36a:3310:21a8 with SMTP id
 5a478bee46e88-36a4238da58mr22696876eec.17.1793783973140; Wed, 04 Nov 2026
 01:19:33 -0800 (PST)
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
 <179249575817.1833288.1089755405582445022@kernel.org> <CAPVz0n0=6Z7E9iSc84xL6Jt=Xi=a=qmSwVsT5g-LMZ+mENFkzg@mail.gmail.com>
 <20261104082839.GD792264@google.com>
In-Reply-To: <20261104082839.GD792264@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 4 Nov 2026 11:19:21 +0200
X-Gm-Features: AclHuK-nwA8nmcK4-hyChgffnjaf-dRrb8bQSBvVXY32g8YXDAt5lwFBxCDKvVg
Message-ID: <CAPVz0n2aCy9Kx5kK1EZD3qxN=KCSf=cB7ZnP1SedrrJc13sh2g@mail.gmail.com>
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

=D1=81=D1=80, 4 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10:28=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 03 Nov 2026, Svyatoslav Ryhel wrote:
>
> > =D0=B2=D1=82, 3 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
6:03 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Mon, 19 Oct 2026, Svyatoslav Ryhel wrote:
> > > > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > > >
> > > > ASUS Transformer tablets have a green and an amber LED on both the =
Pad
> > > > and the Dock. If both LEDs are enabled simultaneously, the emitted =
light
> > > > will be yellow.
> > > >
> > > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > > > ---
> > > >  drivers/leds/Kconfig                    |  11 +++
> > > >  drivers/leds/Makefile                   |   1 +
> > > >  drivers/leds/leds-asus-transformer-ec.c | 125 ++++++++++++++++++++=
++++
> > > >  3 files changed, 137 insertions(+)
> > > >  create mode 100644 drivers/leds/leds-asus-transformer-ec.c
> > > >
> > > > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > > > index 7ec2c8d785426..788e689fe875c 100644
> > > > --- a/drivers/leds/Kconfig
> > > > +++ b/drivers/leds/Kconfig
> > > > @@ -120,6 +120,17 @@ config LEDS_OSRAM_AMS_AS3668
> > > >         To compile this driver as a module, choose M here: the modu=
le
> > > >         will be called leds-as3668.
> > > >
> > > > +config LEDS_ASUS_TRANSFORMER_EC
> > > > +     tristate "LED Support for Asus Transformer charging LED"
> > > > +     depends on LEDS_CLASS
> > > > +     depends on MFD_ASUS_TRANSFORMER_EC
> > > > +     help
> > > > +       This option enables support for charging indicator on
> > > > +       Asus Transformer's Pad and its Dock.
> > > > +
> > > > +       To compile this driver as a module, choose M here: the modu=
le
> > > > +       will be called leds-asus-transformer-ec.
> > > > +
> > > >  config LEDS_AW200XX
> > > >       tristate "LED support for Awinic AW20036/AW20054/AW20072/AW20=
108"
> > > >       depends on LEDS_CLASS
> > > > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > > > index 4d4b089156e24..3da746279bb81 100644
> > > > --- a/drivers/leds/Makefile
> > > > +++ b/drivers/leds/Makefile
> > > > @@ -15,6 +15,7 @@ obj-$(CONFIG_LEDS_ADP5520)          +=3D leds-adp=
5520.o
> > > >  obj-$(CONFIG_LEDS_AN30259A)          +=3D leds-an30259a.o
> > > >  obj-$(CONFIG_LEDS_APU)                       +=3D leds-apu.o
> > > >  obj-$(CONFIG_LEDS_ARIEL)             +=3D leds-ariel.o
> > > > +obj-$(CONFIG_LEDS_ASUS_TRANSFORMER_EC)       +=3D leds-asus-transf=
ormer-ec.o
> > > >  obj-$(CONFIG_LEDS_OSRAM_AMS_AS3668)  +=3D leds-as3668.o
> > > >  obj-$(CONFIG_LEDS_AW200XX)           +=3D leds-aw200xx.o
> > > >  obj-$(CONFIG_LEDS_AW2013)            +=3D leds-aw2013.o
> > > > diff --git a/drivers/leds/leds-asus-transformer-ec.c b/drivers/leds=
/leds-asus-transformer-ec.c
> > > > new file mode 100644
> > > > index 0000000000000..1b129247ea6c6
> > > > --- /dev/null
> > > > +++ b/drivers/leds/leds-asus-transformer-ec.c
> > > > @@ -0,0 +1,125 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +
> > > > +#include <linux/err.h>
> > > > +#include <linux/leds.h>
> > > > +#include <linux/mfd/asus-transformer-ec.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/slab.h>
> > > > +
> > > > +enum {
> > > > +     ASUSEC_LED_AMBER,
> > > > +     ASUSEC_LED_GREEN,
> > > > +     ASUSEC_LED_MAX
> > > > +};
> > > > +
> > > > +struct asus_ec_led_config {
> > > > +     const char *name;
> > > > +     unsigned int color;
> > > > +     u64 ctrl_bit;
> > > > +};
> > > > +
> > > > +struct asus_ec_led {
> > > > +     struct asus_ec_leds_data *ddata;
> > >
> > >
> > > Why do we need 'struct ' at all?
> > >
> > > If we put 'const struct asusec_core *ec;' directly into 'struct
> > > asus_ec_led', we can drop the outer wrapper struct and the back-point=
er
> > > completely.
> > >
> >
> > You propose to allocate asus_ec_led for each led in a loop? I have not
> > seen this done by other leds. The asus_ec_leds_data is driver ddata,
> > asus_ec_led is each led individual structure.
>
> For your whole 2 LEDs, yes, I think that will be better.
>
> > > > +     struct led_classdev cdev;
> > > > +     u64 ctrl_bit;
> > > > +};
> > > > +
> > > > +struct asus_ec_leds_data {
> > > > +     const struct asusec_core *ec;
> > > > +     struct asus_ec_led leds[ASUSEC_LED_MAX];
> > > > +};
> > > > +
> > > > +static const struct asus_ec_led_config asus_ec_leds[] =3D {
> > > > +     [ASUSEC_LED_AMBER] =3D {
> > > > +             .name =3D "amber",
> > > > +             .color =3D LED_COLOR_ID_AMBER,
> > > > +             .ctrl_bit =3D ASUSEC_CTL_LED_AMBER,
> > > > +     },
> > > > +     [ASUSEC_LED_GREEN] =3D {
> > > > +             .name =3D "green",
> > > > +             .color =3D LED_COLOR_ID_GREEN,
> > > > +             .ctrl_bit =3D ASUSEC_CTL_LED_GREEN,
> > > > +     },
> > > > +};
> > > > +
> > > > +static enum led_brightness asus_ec_led_get_brightness(struct led_c=
lassdev *cdev)
> > > > +{
> > > > +     struct asus_ec_led *led =3D container_of(cdev, struct asus_ec=
_led, cdev);
> > > > +     const struct asusec_core *ec =3D led->ddata->ec;
> > > > +     u64 ctl;
> > > > +     int ret;
> > > > +
> > > > +     ret =3D asus_dockram_access_ctl(ec->dockram, &ctl, 0, 0);
> > >
> > > As requested on v6 and v8, why are we still using this bespoke access=
or instead
> > > of Regmap?
> >
> > https://lore.kernel.org/lkml/CAPVz0n0imF_ESoGMJSrEX7NOnBShFj8wehDtQKXZV=
_DMcGqq=3DA@mail.gmail.com/
>
> Sorry, I've slept since then, and subsequently forgotten this
> conversation.  You can drop this request.
>
> > > > +     if (ret)
> > > > +             return LED_OFF;
> > > > +
> > > > +     return ctl & led->ctrl_bit ? LED_ON : LED_OFF;
> > > > +}
> > > > +
> > > > +static int asus_ec_led_set_brightness(struct led_classdev *cdev,
> > > > +                                   enum led_brightness brightness)
> > > > +{
> > > > +     struct asus_ec_led *led =3D container_of(cdev, struct asus_ec=
_led, cdev);
> > > > +     const struct asusec_core *ec =3D led->ddata->ec;
> > > > +
> > > > +     if (brightness)
> > > > +             return asus_dockram_access_ctl(ec->dockram, NULL,
> > > > +                                            led->ctrl_bit, led->ct=
rl_bit);
> > >
> > > Use 100-chars throughout to prevent early wrapping.
> > >
> > > > +     return asus_dockram_access_ctl(ec->dockram, NULL, led->ctrl_b=
it, 0);
> > > > +}
> > > > +
> > > > +static int asus_ec_led_probe(struct platform_device *pdev)
> > > > +{
> > > > +     const struct asusec_core *ec =3D dev_get_drvdata(pdev->dev.pa=
rent);
> > > > +     struct asus_ec_leds_data *ddata;
> > > > +     struct device *dev =3D &pdev->dev;
> > > > +     int ret;
> > > > +
> > > > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > > > +     if (!ddata)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     platform_set_drvdata(pdev, ddata);
> > >
> > > What consumes this?
> >
> > Seems to be an overlook, must have forgotten to remove it during 12
> > iterations over last 10 month
>
> No problem, it happens.
>
> > > > +     ddata->ec =3D ec;
> > > > +
> > > > +     for (int i =3D 0; i < ASUSEC_LED_MAX; i++) {
> > >
> > > `i` isn't just a random iterator here - maybe call it `led`?
> > >
> >
> > This is just a disposable iterator.
>
> It's a disposable iterator that is clearly a `led`.
>
> Thus my request for and improvement in the nomenclature remains valid.
>
> > v7 seem fine https://lore.kernel.org/lkml/20260702162425.GD2108533@goog=
le.com/
> > v9 as well https://lore.kernel.org/lkml/20260702162425.GD2108533@google=
.com/
>
> These are the same link.
>

Ooops, v7 https://lore.kernel.org/lkml/20260527144619.GA671544@google.com/

> > Yet again complains and nits
>
> That my job.  You're welcome.  =3D;-)
>
> Sometimes new things are found on re-review.
>
> Apologies for the disappointment.
>

I will incorporate all your requests, but please, may you apply/check
v13 a bit quicker. That would be awesome.

> --
> Lee Jones
