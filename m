Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794152444;
	b=ZaE6t2kcSH0/p4zNzkoM42ESc2Ym+DrZwHchLFbm+g+HCInHH0vwd8llykKaCoNGIINt
	 YyciRWeT2yfgsH0yWt29XuZBBJT7faY1080XbJkQ5NpDiuINQ3iLwHZ5nHOXVEyPFweVK
	 EmHWuFVdip0hxDZTP4l2p+NOkvkcK7pJYLZ08GT+/TVyXHAf95gc15fHdWu6fmL9Z/Ig2
	 vYVPidIRbcXurLwXl4TjaCcnKv+fKTTOj8Kf1xlJRuH4E93FG49T0cSfYsOYcY6mN4m/E
	 8YWy6eei/0nyU6MEFd0rRkiyyU7K/alSk5+l9qJRxwjCipyeJOzDN4WC7be7Y4Q+mjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794152444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v1EATUFgAK+e+fvvHz4fQmgc+IG10FBEDWMJovtpAtE=;
	b=Q2tjhvH8ROqu8sBGEu2+S3Y/L2a/HSG5C4JCZmeGe9ORpIszYPU4MRNjcz1KCl7fwCEJ
	 P98EQ8ofH5iHbF6ys1d+IVIjk7kJ+Lc0+Xoa9ON5zoJQGW4bd6cIjcGnm8d3g3LFiPeXD
	 1zbeYNx4s2SAJprAmk+8R/3oJbBCYnnSd7r73RKtpozi7FKAplO8Uvn2fdUXuDm6Y7Kzv
	 dSil80J/1CFJPJjsQA/LTdGI1WER2SbPPp8irpuUdlUf7Sy7BiRqS+0Tbzv0lJP4wpRyt
	 Lww0xj8XK4be+g5JAoqC43pCcKH1+ZwVRr9o77bp51T/y69qEepjkkjC5ZN/Qmnfe0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f4d8fCRx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AF2606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44AF2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f4d8fCRx
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd3310348d2so70738a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:40:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794152442; cv=none;
        d=google.com; s=arc-20260327;
        b=B+z6Cc5YY8GIen7qa0cBs7nY0XqCWMTdaaz5OsozKq3bb8UwPktyQUny75gwI4k+uX
         2+dqoAdUnEl3hvVkcZkkSfCLJaxr1wKq6gT2GKIaQ7voWME87bLj6iWXzJkfXiMbI5fg
         qSMrlIZ+ldSJsGC4golPBccajo7h27tO4BedG+GGQl9eKkdln/Z2HHuh+3yBzs1nh5i1
         +UN/qXzygKHrG+HMuquzBxWVphthhQww9oE23EH/JT5E0pexc0YDMctkoHi8DWsNLRG2
         Xx9+sbMHc6O9122bGxJ10IHdxiwBn/YHc7mU9uUxlFQIT+7F4r7Q4ntFeK05GhmyLQBI
         HVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v1EATUFgAK+e+fvvHz4fQmgc+IG10FBEDWMJovtpAtE=;
        fh=fnPjDRWzV/aJrj/Om5ThK9W+3sY+Y9E6VMvkGbCEpjQ=;
        b=mYP+ugSyA9Z3GotYIzoBLmJMI/qxZMgvY5ZGyudrzq7HLP7llv4zWdWwbF39yYo+q8
         Zq0hwI79Z4GWoWNokquzyjkWOaZWd1DlEnemZ3Xx9+iKMsjyJS8ZS1MpDJwPXAfo8AM3
         IWEeE+UUymAMV7oyl6F9972xotqu5XiHItgHyM9r+AyMJVdGIUZM3lOJBkjE6NVVISRX
         JHBHaS2buRdEtsUOh51cxNqLpNjtPFMnRffYqngkwx55d2VNKHdsoSSH1TkvvLYLUHf9
         GUdvGsh6fO2ldzOyghe2rfoGzBKU4T6CsjkoW8VtUSzh7R5oJ84rgmwo8R5lod5PbLpx
         bUDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794152442; x=1794757242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1EATUFgAK+e+fvvHz4fQmgc+IG10FBEDWMJovtpAtE=;
        b=f4d8fCRxpi6cwES9Gk/2Yb03pjXq2a6QLoF1T/37ngm4ROP168ZaGekdIzUXnEuwiv
         Rs3V0Wux2NOT2kvC/KMM/AFDhbh2G5j0iQDjrABS3HCBcp5iIdMbq4RAJhBNYfuj8UGR
         Df0JiMbOjPg562McP+adCEkbymb94Akrt0sJTuY6hFT/kp6WJfp/p0156zeDgOVU8W4c
         3aqHRunNkNNh7HkDSmaQoElLXoHd9w7lYTgnx8oKIW+sMwax80IcGqoI8Gag69i+FPyn
         lL0ktoMuKh+RBdH6D3Lgq86Ys0JpMiiD1rahWKDigCs+W+j329KxQBvdUMUxffc30/6l
         lBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794152442; x=1794757242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1EATUFgAK+e+fvvHz4fQmgc+IG10FBEDWMJovtpAtE=;
        b=pS6cry2LH6VzAMtv+C5NjgPTi5iisNupoqcbRpNvOXNghE4NBw8vkWJ/s7FGQ9B6oU
         SrIpQX76kCHBTgmHE01XPC242Npx7UfXLAsDyLHkuiIJiFICnQrd5H6q1HWnVvI02+TW
         Acv0VBVFo9ryxw9hA8xGXdbYJNk/ZlhqSWlsKA7hri3iNoB5nqrMjG0Jjil5g4qnD4+n
         0czpbYuC+HPmRmBKwD4skKiQHVCIAR41z9EpWCRZ3x86fonm5gouikCWK/TAh7Uy36ye
         XIc6REBdszvwkCx0zE0XxkLF7uFbQPuGeubdUXOzFHKw6pvckJ+kBRpR0audbn1ZfRsv
         W71g==
X-Forwarded-Encrypted: i=1; AL+hErGepNW8CowGobEBpEaYc62IDKiq6/T0yeA7Aje/wzbSTbPoaoXmqdE53qNnVPU+X1Opc0cKggL1QQ76Tec=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nI7fhnQ0ImqhvsowdFW/45g/xTjFhXYHOCKAL/ABZ7XanYWnp
	gA5IntE9sSLmwczJCg7wJIuHI9nWTfLoFII7nypaaZ2o3+IwBMg86cd4Q3slrtX+wfhO7LTeXbR
	n6HCNuQHrwNcL8N8zvCEPFI4949C+6Qs=
X-Gm-Gg: AYBFou0qXvRW/3ZE+8d+uVzLQlLidrcFsPuxcXb5eK3i+8Lq7y/mRYaIS0ybTiyI70m
	tZttxPUpVJGWBVBqgs+4QHDZRWHnqD/TVDTxknK3JNA8qiQS1nNdgBpECvQtkKqGHkVEloNPpJe
	o4VziTPzG8y0Vm+S50YVdScxN3MFPJ5sshmBUpXu2Lgkh+XwJcna5ItUmbrrfM/5rsBmdeVz6H+
	tjZVFtOmzQ4qoKve+9L+ly18XyVzcYXrEwnmP9VikBBL+0ANvqOGM1Z6A/jtyrzRvBldUGZinGI
	OVJzgXEepbX56ch8a0KJMgNRJ6b1qXNDfCzJwNiyd8x7KOwfO3fBV73RnSuIchvR5jpsZEUEDyJ
	HwpKNf+4SGXlxjvRHcuBoGPpLPpAI53zfSX8NYbUbXpiUGjx3PEJS
X-Received: by 2002:a17:90b:4b12:b0:3a0:d82b:237b with SMTP id
 98e67ed59e1d1-3b12d4ddfbamr1063419a91.25.1794152442391; Sun, 08 Nov 2026
 07:40:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108093602.329554-1-pmazzini@gmail.com> <20261108093602.329554-5-pmazzini@gmail.com>
 <d9035966-07f3-4758-9074-7fb94375c40b@roeck-us.net>
In-Reply-To: <d9035966-07f3-4758-9074-7fb94375c40b@roeck-us.net>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 8 Nov 2026 15:40:17 +0000
X-Gm-Features: AclHuK9879PTA1ZVJ5Sp0ZQ9MGLxSUczATyJyfWPud5R8IRCfsuM4ujwWYibCJU
Message-ID: <CAAxh=juaE3=oiUS0W4vMTrNW9S-hJ+Z=LxH6aKUktBK32Racbw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hwmon: sy7636a: read the temperature only while
 the rails are on
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alistair Francis <alistair@alistair23.me>, Andreas Kemnade <andreas@kemnade.info>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 2:50 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >     hwmon_dev =3D devm_hwmon_device_register_with_info(&adev->dev,
> > -                                                    "sy7636a_temperatu=
re", regmap,
> > +                                                    "sy7636a", regmap,
>
> This change is neither related to this patch nor necessary. Other drivers=
 (unnecessarily)
> doing the same is not an argument.

Right, I'll drop it in v4.

On Sun, Nov 8, 2026 at 2:50=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On Sun, Nov 08, 2026 at 09:36:01AM +0000, Pablo Mazzini wrote:
> > The driver enables VCOM at probe, which keeps the panel's high voltage
> > rails on for good. Read the temperature only while the rails are on, wh=
en
> > the chip samples it, and return -ENODATA otherwise. Read power good wit=
h
> > it in one transfer, so the value can not be from before the first sampl=
e
> > or after the rails went off. Register it under the chip name, as the
> > TPS65185 and FP9931 drivers do.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  drivers/hwmon/sy7636a-hwmon.c | 37 +++++++++++++++++++++++------------
> >  1 file changed, 25 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmo=
n.c
> > index a6b47452e29e..0c0601d47b87 100644
> > --- a/drivers/hwmon/sy7636a-hwmon.c
> > +++ b/drivers/hwmon/sy7636a-hwmon.c
> > @@ -9,26 +9,43 @@
> >   */
> >
> >  #include <linux/auxiliary_bus.h>
> > +#include <linux/bits.h>
> >  #include <linux/err.h>
> >  #include <linux/hwmon.h>
> >  #include <linux/module.h>
> >  #include <linux/regmap.h>
> > -#include <linux/regulator/machine.h>
> >
> > -#define SY7636A_REG_TERMISTOR_READOUT        0x08
> > +#define SY7636A_REG_FAULT_FLAG               0x07
> > +#define SY7636A_FAULT_FLAG_PG                BIT(0)
> >
> >  static int sy7636a_read(struct device *dev, enum hwmon_sensor_types ty=
pe,
> >                       u32 attr, int channel, long *temp)
> >  {
> >       struct regmap *regmap =3D dev_get_drvdata(dev);
> > -     int ret, reg_val;
> > -
> > -     ret =3D regmap_read(regmap,
> > -                       SY7636A_REG_TERMISTOR_READOUT, &reg_val);
> > +     u8 buf[2];
> > +     int ret;
> > +
> > +     /*
> > +      * The thermistor is sampled while ON_OFF is set, but the first s=
ample
> > +      * is only ready after the ADC sampling and conversion time (ADC_=
SPL +
> > +      * ADC_DEL in the datasheet); until then it holds its reset value=
, 0.
> > +      * PG is only set once all rails are up, after the first sample, =
so
> > +      * read it in the same transfer and report the temperature only w=
hile
> > +      * it is set.
> > +      *
> > +      * With ON_OFF set but PG low (rails still ramping up, or a fault=
), no
> > +      * temperature is reported even if one may be available. That is
> > +      * accepted: the display driver reads the temperature only while =
it
> > +      * holds the rails on, after power good.
> > +      */
> > +     ret =3D regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, siz=
eof(buf));
> >       if (ret)
> >               return ret;
> >
> > -     *temp =3D (s8)reg_val * 1000;
> > +     if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
> > +             return -ENODATA;
> > +
> > +     *temp =3D (s8)buf[1] * 1000;
> >
> >       return 0;
> >  }
> > @@ -72,12 +89,8 @@ static int sy7636a_sensor_probe(struct auxiliary_dev=
ice *adev,
> >       if (!regmap)
> >               return -ENODEV;
> >
> > -     err =3D devm_regulator_get_enable(&adev->dev, "vcom");
> > -     if (err)
> > -             return err;
> > -
> >       hwmon_dev =3D devm_hwmon_device_register_with_info(&adev->dev,
> > -                                                      "sy7636a_tempera=
ture", regmap,
> > +                                                      "sy7636a", regma=
p,
>
> This change is neither related to this patch nor necessary. Other drivers=
 (unnecessarily)
> doing the same is not an argument.
>
> Guenter
>
> >                                                        &sy7636a_chip_in=
fo, NULL);
> >
> >       if (IS_ERR(hwmon_dev)) {
