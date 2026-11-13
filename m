Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794584486;
	b=1bv2cfZSHbIUV4/y+oUjT10lyK1LbhsmaE8Feg1DcdqBUuJTPqu9A7GLJFyFHPhTs2Vg
	 CN4iKwTQNLwKx36mU9R+3FDnpSEzK+pNmH6HhLYidR7lqTqEoZkvRjf/HcsCvNmdh5+CS
	 i64jcOXXBHUjGvf9xmPo09+cglAOH8Q5vgD2gMkrDry711NW87q7r7U0iOLodolI1Jvkw
	 Qj+FjZ02ZS9LFS4m/cxPo7Wrym8ENFvA/6kuIEUbC4OoFvPjMbU/OBXpNL/Tr75dW/2GP
	 3E5TwsjfQHMdsQf5lNPwA2GgIDL1WWPdD3HStrKaCzOhamuX3GsfTTWGRKTZJY5+3Lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ictCGGMxgCgpUNAPmSmusxCn54ZLVwNtSFzM9e1649k=;
	b=wQXl0lV0oCS+aYuGO8aHpp7/kFbdj1cvXAo0jDgGFJqJ5PerRxtEyUE7womE6bGtYZ9l
	 6wFQROru70iWNQKmK4kxjst8lGJXmIBn9FFQmF3OZlOg+zdm/X+OLO25mi8h/nT5tBX6e
	 Vnou0j8jxukBh6QrB1u5lihR+P5fu/hX1xV/TX/FXXyjZ5Cb6BBWNEAjHfrmVknprrMGK
	 sEbDEu7ZvKuMg3rL9hhqCUKcNxkvwiWexFOYEug+T4UNR2IHrKAuKbYRlKZ2fOodykw5b
	 F4YZN05h7gN99PhD+HxKOpvqpJqHLQNH8gp741Ak8mgoHeZ6e8sTV/Jq//hQZrvQauQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sNOq1xRc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA65E606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA65E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sNOq1xRc
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2061727c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:41:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794584485; cv=none;
        d=google.com; s=arc-20260327;
        b=eZZDEgbZTLM3FjtDoHXvyLWln+h89TUCt1dutgVWABSdniI0I/54iiLoHAzamtOdnE
         Z5QaWweZTptjZADSAMt/eQtszPqbXbiRU+tn9AumESGmUBH1tFkKskRIYYBobZFyn01V
         0HzAonRyN/lZ/7mrB8r89+N+OPoXgwZpnleAiE4zNW5ZN2VQXHMylyiPS5v71gCNjwqv
         PABar/7CduQ6/m3oPMkj4AezUD8Kg1CnGZHqNaPR1UF8H+wdniqr6PGlDBopNOMJ0v9S
         04Tm0Oy3ghGBC6m8soUaM830m0LEY/wIfsM2ufdVsaaNDibVbr2wLwQ1CFFIj6s3+0pp
         yDsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ictCGGMxgCgpUNAPmSmusxCn54ZLVwNtSFzM9e1649k=;
        fh=AFa7cKUu+kAbTR0R0KNvfHJP6lg5NJpcQNs15m9fQVk=;
        b=pgfsDSMfrOUUh/rvbZalDZ6vwy1SMJ1/UshZVdx3VBnoZkNAaST9vCtaABpaEZ6xI1
         rc11Au+t1J0U1vOtTQ7l/BWOfH8+4FDM2Bw5xHVKNOx3935ZNLEir442Lbzn6lJP1QVp
         4DPgADwtc6zkfEklCFqEN7ntIPtupYIMpUp/028wuR75J978tdXi40d/8CzCfvDcgTOo
         rzMNl39v35l8sKttrEUgHz4NkkMyk8grt8L0XJnQUgtLokrU9CoG8wPsswixWvqtFLpy
         PbX6swsLxpCHCHMtQfi8a2VCVHpH55/rhdQxKigTGHbhkfYJZPxryG4tsFmfKrz5NK0z
         UPBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584485; x=1795189285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ictCGGMxgCgpUNAPmSmusxCn54ZLVwNtSFzM9e1649k=;
        b=sNOq1xRcDaTvk+7CO2nvBE8Z92YdcWOwAoUU2WsLmQXn3aRQTdsouN+A+17mIBHvyv
         ek9nmlKYRePtkM1jqWVqyCzZ5e7REGB2jIA7RZ4Po0puoAl2kSpjjb4/bbmbcHlZilv+
         Yfuda8kgiIMAMySNkVFkwfpUHPgt0r7IDghT6TDt8M8KbAIsJZqjFhkcF8r+RioqqUDM
         JSimh3r9KFgmbJeytjGT/bSUshkZnDfw1LTJBTiHV2bTC/plBs5uoBTWFDRTReQii3uS
         0iC/+gpNBuZmhUXjLrazSfR7YqwPWZovxpMMPUa4F0dekmeMPx377iM8QFf1tcV134ld
         prdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584485; x=1795189285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ictCGGMxgCgpUNAPmSmusxCn54ZLVwNtSFzM9e1649k=;
        b=z+ZBL6DCWs8XRo4FeBmln6WYfhFHAHPiffXelj+cuuN09hVV8CNXekNqc5gnU+G6k9
         cwkSk0C7CBKeJtrfRhdbJ4Mc3OiQI/NVcFLRjgMNXdvXSFPK/nkarAR6pT5laqVygIbQ
         TftAgAqwlE4cmSAFPixKjTtGfp/lyqAx3BSHuES7CLfgaZcCy4JhTJ/zcc0A24qYh1TZ
         sPRZZQ7eqsPABYJ5t2gka1kYiIsO8lJbneXhJLSQOj2gA5Jf4WI0NAbp9iC2A3+dgwgd
         GgcOe5MUq+/I9fGFgtWDRczIFkO80ilfcwCYvNr4kA6ysks9ZoO+dNZSaInwsW5/Glkd
         RV9w==
X-Forwarded-Encrypted: i=1; AL+hErG+graYtxoHNcigF0ZeXkBpWbQpQiou1mKDAKP71pekD1MRf1k3l8vvvlF7wqXUVnEgRe3FkbK15kUb32M=@vger.kernel.org
X-Gm-Message-State: APuU4Z++iyc+NRpzi5FGrUyL4L64p62dBeTdQrRZgpfxGciEVz7dnfWJ
	zoqa09ymhfYspl+5TWyr2yrxzGOY0APwcsjzIsu6HxCsD7bGYH9kUNDv/QXdiiCYjwAoFP5EfkX
	Iua5vUsaT+paEuYwZfyzJ58EJwRq5nKu4Zw97
X-Gm-Gg: AYBFou3E46NpvmMZbezd348cJYDsTB0Tc8N6JO0229OXw0rsWtSNeDmVDhTiMFdZyU3
	oneUF/gUY1vqWuOZsxQVW7ta9Y/nMhxVKYsPmldcRcH33ZrgXMn0+4X/Ajr9ozecxNbH4a9fz3u
	EGONwlV88aXOnywyC65rG1UsuuqKSRcGZeX7CAX+GaDuS9UBZ9CT+NaSe8cQaBUCNmzL1WY/epA
	makbkdej4NDqKVT14QvFh4i3jgomeQ6Zxu1rFgVgmWyRSHXnZziti3kNN6AFSqX436wOrAhZ2O5
	3WouerPlaYDfuXT3rH25PTsCiGJ8wajH1RaQkDRfQ1N9/rReR3wHjDZ5F7tBPB9/3TJ4tiBxkes
	gxSNSOHUFJcbMv1173ldTVrAa7BGzgSFmSvXuZBIHzELJT0bvbEUmxM43PmlypaNi1C5EmalxJt
	SEhNACc382l3lpEz1Yr1gqZYYHKjH1JQ==
X-Received: by 2002:a05:7022:3c87:b0:16c:4eef:a526 with SMTP id
 a92af1059eb24-1b5030e2ee9mr2671578c88.15.1794584484844; Fri, 13 Nov 2026
 07:41:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101142435.130520-1-clamor95@gmail.com> <179370032880.793788.4424159880220279586@kernel.org>
In-Reply-To: <179370032880.793788.4424159880220279586@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 13 Nov 2026 17:41:12 +0200
X-Gm-Features: AclHuK_BgAPnek8SSBsS7xD29UnkVImGVLvK3G9PVowz-sB26JLAqdiA-Cf1RLY
Message-ID: <CAPVz0n1E2bLOzKEC6_2iiPM5ZZ6-NOXuOkwx+jQYn8BRvPXwSw@mail.gmail.com>
Subject: Re: [PATCH v1] video: leds: backlight: lm3533: Support getting LED
 sources from DT
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 13 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:5=
3 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Drop the 'video: ' part of the subject line.
>
> Please review, explain or fix the Sashiko review(s).
>
> > Add Control Bank to HVLED/LVLED muxing support based on the led-sources
> > defined in the device tree.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
> > ---
> > This was part of the original LM3533 controller DT/OF conversion patchs=
et,
> > but it appears to have been accidentally separated during the final ite=
ration.
> > Therefore, I am sending it as a follow-up.
> > ---
> >  drivers/leds/leds-lm3533.c          | 60 +++++++++++++++++++++++++++++
> >  drivers/video/backlight/lm3533_bl.c | 45 ++++++++++++++++++++++
>
> Why are these being bundled up?
>
> What is the dependency?  If none, please separate.
>
> >  2 files changed, 105 insertions(+)
> >
> > diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> > index 7259097bd6a71..a1aeff70a90fc 100644
> > --- a/drivers/leds/leds-lm3533.c
> > +++ b/drivers/leds/leds-lm3533.c
> > @@ -26,6 +26,11 @@
> >  #define LM3533_ALS_CHANNEL_LV_MIN    1
> >  #define LM3533_ALS_CHANNEL_LV_MAX    2
> >
> > +#define LM3533_REG_OUTPUT_CONF1                      0x10
> > +#define   OUTPUT_CONF1_SHIFT                 2
> > +#define   OUTPUT_LVLED_MASK                  0x3
> > +#define LM3533_REG_OUTPUT_CONF2                      0x11
> > +#define   OUTPUT_CONF2_SHIFT                 6
> >  #define LM3533_REG_CTRLBANK_BCONF_BASE               0x1b
> >  #define LM3533_REG_PATTERN_ENABLE            0x28
> >  #define LM3533_REG_PATTERN_LOW_TIME_BASE     0x71
> > @@ -54,6 +59,9 @@ struct lm3533_led {
> >       u32 max_current;
> >       u32 pwm;
> >
> > +     int num_leds;
> > +     u32 leds[LM3533_LVCTRLBANK_MAX];
> > +
> >       bool have_als;
> >  };
> >
> > @@ -622,8 +630,36 @@ static const struct attribute_group *lm3533_led_at=
tribute_groups[] =3D {
> >
> >  static int lm3533_led_setup(struct lm3533_led *led)
> >  {
> > +     u32 output_cfg_shift =3D 0;
> > +     u32 output_cfg_val =3D 0;
> > +     u32 output_cfg_mask =3D 0;
> >       int ret;
> >
> > +     if (led->num_leds) {
> > +             for (int i =3D 0; i < led->num_leds; i++) {
> > +                     if (led->leds[i] >=3D LM3533_LVCTRLBANK_MAX)
> > +                             continue;
> > +
> > +                     output_cfg_shift =3D led->leds[i] * 2;
> > +                     output_cfg_val |=3D led->id << output_cfg_shift;
> > +                     output_cfg_mask |=3D OUTPUT_LVLED_MASK << output_=
cfg_shift;
> > +             }
> > +
> > +             /* LVLED1, LVLED2 and LVLED3 */
> > +             ret =3D regmap_update_bits(led->regmap, LM3533_REG_OUTPUT=
_CONF1,
> > +                                      output_cfg_mask << OUTPUT_CONF1_=
SHIFT,
> > +                                      output_cfg_val << OUTPUT_CONF1_S=
HIFT);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /* LVLED4 and LVLED5 */
> > +             ret =3D regmap_update_bits(led->regmap, LM3533_REG_OUTPUT=
_CONF2,
> > +                                      output_cfg_mask >> OUTPUT_CONF2_=
SHIFT,
> > +                                      output_cfg_val >> OUTPUT_CONF2_S=
HIFT);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> >       ret =3D lm3533_ctrlbank_set_max_current(&led->cb, led->max_curren=
t);
> >       if (ret)
> >               return ret;
> > @@ -698,6 +734,30 @@ static int lm3533_led_probe(struct platform_device=
 *pdev)
> >
> >       device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->=
pwm);
> >
> > +     /*
> > +      * If led-sources property is not set then either this Control Ba=
nk uses
> > +      * its default LVLED or is not linked to any LVLED at all.
> > +      */
> > +     led->num_leds =3D device_property_count_u32(&pdev->dev, "led-sour=
ces");
> > +     if (led->num_leds > LM3533_LVCTRLBANK_MAX) {
> > +             dev_err(&pdev->dev, "num of LED sources exceeds max %d: %=
d\n",
>
> "Number "
>
> > +                     LM3533_LVCTRLBANK_MAX, led->num_leds);
> > +             ret =3D -EINVAL;
> > +             goto err_deregister;
> > +     }
>
> Could we move the 'led-sources' parsing above led_classdev_register(),
> or convert the driver to devm_led_classdev_register() and use 'return
> dev_err_probe()' here?
>

I will convert to devm_led_classdev_register() as precursor to this patch.

> > +     if (led->num_leds < 0)
> > +             led->num_leds =3D 0;
> > +
> > +     if (led->num_leds > 0) {
> > +             ret =3D device_property_read_u32_array(&pdev->dev, "led-s=
ources",
> > +                                                  led->leds, led->num_=
leds);
> > +             if (ret) {
> > +                     dev_err(&pdev->dev, "failed to get led-sources\n"=
);
> > +                     goto err_deregister;
> > +             }
>
> dev_err_probe()
>
> > +     }
> > +
> >       ret =3D lm3533_led_setup(led);
> >       if (ret)
> >               goto err_deregister;
> > diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backli=
ght/lm3533_bl.c
> > index adcd6ac7cf229..e8164c8528577 100644
> > --- a/drivers/video/backlight/lm3533_bl.c
> > +++ b/drivers/video/backlight/lm3533_bl.c
> > @@ -7,6 +7,7 @@
> >   * Author: Johan Hovold <jhovold@gmail.com>
> >   */
> >
> > +#include <linux/bits.h>
> >  #include <linux/module.h>
> >  #include <linux/init.h>
> >  #include <linux/platform_device.h>
> > @@ -21,6 +22,7 @@
> >  #define LM3533_HVCTRLBANK_COUNT              2
> >  #define LM3533_BL_MAX_BRIGHTNESS     255
> >
> > +#define LM3533_REG_OUTPUT_CONF1              0x10
> >  #define LM3533_REG_CTRLBANK_AB_BCONF 0x1a
> >  #define   CTRLBANK_AB_BCONF_ALS(n)   BIT(2 * (n))
> >  #define   CTRLBANK_AB_BCONF_MODE(n)  BIT(2 * (n) + 1)
> > @@ -35,6 +37,9 @@ struct lm3533_bl {
> >       u32 max_current;
> >       u32 pwm;
> >
> > +     int num_leds;
> > +     u32 led_strings[LM3533_HVCTRLBANK_COUNT];
> > +
> >       bool have_als;
> >       bool linear;
> >  };
> > @@ -236,6 +241,8 @@ static const struct attribute_group *lm3533_bl_attr=
ibute_groups[] =3D {
> >  static int lm3533_bl_setup(struct lm3533_bl *bl)
> >  {
> >       int ctrlbank =3D lm3533_bl_get_ctrlbank_id(bl);
> > +     u32 output_cfg_val =3D 0;
> > +     u32 output_cfg_mask =3D 0;
> >       int ret;
> >
> >       ret =3D regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCO=
NF,
> > @@ -243,6 +250,21 @@ static int lm3533_bl_setup(struct lm3533_bl *bl)
> >       if (ret)
> >               return ret;
> >
> > +     if (bl->num_leds) {
> > +             for (int i =3D 0; i < bl->num_leds; i++) {
> > +                     if (bl->led_strings[i] >=3D LM3533_HVCTRLBANK_COU=
NT)
> > +                             continue;
> > +
> > +                     output_cfg_val |=3D ctrlbank << bl->led_strings[i=
];
> > +                     output_cfg_mask |=3D BIT(bl->led_strings[i]);
> > +             }
>
> This for loop doesn't need to be in the if statement.
>

It is in if statement because if node has no "led-sources"
LM3533_REG_OUTPUT_CONF1 should not be touched and must be left in its
default state.

> > +             ret =3D regmap_update_bits(bl->regmap, LM3533_REG_OUTPUT_=
CONF1,
> > +                                      output_cfg_mask, output_cfg_val)=
;
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> >       ret =3D lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current)=
;
> >       if (ret)
> >               return ret;
> > @@ -320,6 +342,29 @@ static int lm3533_bl_probe(struct platform_device =
*pdev)
> >
> >       device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->p=
wm);
> >
> > +     /*
> > +      * If led-sources property is not set then either this Control Ba=
nk uses
> > +      * its default HVLED or is not linked to any HVLED at all.
> > +      */
> > +     bl->num_leds =3D device_property_count_u32(&pdev->dev, "led-sourc=
es");
> > +     if (bl->num_leds > LM3533_HVCTRLBANK_COUNT) {
> > +             dev_err(&pdev->dev, "num of LED sources %d exceeds max %d=
\n",
> > +                     bl->num_leds, LM3533_HVCTRLBANK_COUNT);
> > +             return -EINVAL;
> > +     }
>
> dev_err_probe()
>
> > +
> > +     if (bl->num_leds < 0)
> > +             bl->num_leds =3D 0;
> > +
> > +     if (bl->num_leds > 0) {
> > +             ret =3D device_property_read_u32_array(&pdev->dev, "led-s=
ources",
> > +                                                  bl->led_strings,
> > +                                                  bl->num_leds);
> > +             if (ret)
> > +                     return dev_err_probe(&pdev->dev, ret,
> > +                                          "failed to get led-sources\n=
");
> > +     }
> > +
> >       ret =3D lm3533_bl_setup(bl);
> >       if (ret)
> >               return ret;
> > --
> > 2.53.0
> >
>

Other suggestions are valid, I will apply them in v3

> --
> Lee Jones
