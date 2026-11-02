Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793607008;
	b=KjGmMFLiVJ3n3mkEkDdX32SBPB9SL5pEO3/LnGpGKgat7VvOZ7F2hdgwXmXwddFNZUUY
	 ByWsDcvQ6t9h/rqu1ozC/vnaKOhlRyUgaJL1Z7ndIn1b2hszAed+MJsOtU0u1Sjag0OoL
	 CjFgytgJUjaGP1qAyz8XSmK2KcK0Epq1LGQkR4tIjNTzAZ5LcOlXF6RvhapXgUeZkkLTF
	 4KjnpPd6CuQTvo1lzzn7nkXvseEwXo/RXH32P/tCk7wtn7M3vLoIHSRNMzOJeGxKlQoT9
	 SmY73jmk9kaDTokNcYAHViTky5ccb8HFLngSzzv2ba8tVK8FNm2B0HcpI1MYDTrxRtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FcTfqBsaN6t2MebYu2re2wskSHTcVY4QbT4XDnFus+E=;
	b=zVSI3wmJq6fX9j/LWbFa1/H5QZ/JWOGXzE/1Q95X2bd8dv7IsNR0h6p12T4azfjMjYrz
	 0Y/W6KXHbSTA60l64hoaN2yn047GRrkNM4pVA9cuaO0uRhnAZToGFzNdKaLwHt7GKjiPE
	 V1/DjnXo3XEK8fzpnBtLHDSk9ct5xUFBWaDSyi9GnlYaBZLKqJXdAX3d9EFGRNjvo6ybQ
	 PuCMH2QCIs5pAYLrrVdo87fezX3XeO6YzB0M7WL/IkCouze+Yc45KIvS5KLMoyahuMfv9
	 KEMYVYbTMbzWViUs8PYeqngl+16jXfAcPivatnpGxiaeldTF5ovXXZMVYS5SzzFLtjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p4FNOyBj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE79F606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE79F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p4FNOyBj
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso1566113a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:10:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793607007; cv=none;
        d=google.com; s=arc-20260327;
        b=WXZf3Fm/BPEAaqNWqYuLkjf8dxGIBFatacJFYMcM4ZatpbJzTFjxBXta7y/DcivwAC
         pQNQ4YOoTwGXussVybVQJ9Dw/hppDYQpaSPnyX/ex65JQKiWEZkoAjmHi9kaULFEyBdz
         e8/NO4n+7wR0+1HwWu0JZoNoDreWJDinxwDoHIVZa/Xy7W5sA0TjFzHXMhZUA9vwoEOk
         pwbL26BZRDJlzQM+QNGrDL7Aft6m2ZjcXLRbCeTlN+IaiBykDjbwnfPcIrV/6sYy2R4Y
         Mmn9KM7J7CmXOjTeWiS+UUeqYUWxTb3H0D8BCQaG/gR7R9HgykaRiqI6XJVtH1EY5Ync
         t02w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FcTfqBsaN6t2MebYu2re2wskSHTcVY4QbT4XDnFus+E=;
        fh=45a9raY8SJ++gbi1YUc7kHtITm1ZOqgYVyef/7SdWes=;
        b=iXFmxweWxbbJLMrqfjVR9SpGYC49nSRVtgmONbWBeLfzelWUy3pbcOxwBU+eleAdoA
         B0EHeKQMShMUclblW8okLnn/gd68rM4dAN7FaR1UUppdy6xakTZnHUITF/5fnF2UrL/k
         z6EZ2hNy8tY2v6VAK1M55NYdF8QCfqOAudmqFjMDpeIs03LLZA5ApDr6/GjReW2p2igl
         7XiqTZELFNNtoxJcbOW6N0Q2wtMYgN6eJKx9up9UXI+Nv6fjqed1PQi9uUrn693aqGQp
         Rq1cF+0e5JHNKWYmFX8tWsvN2d87UFEihKz0LGIM37ZEjOunR/WixS4IrMIR+HlNV0Lr
         SySw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793607007; x=1794211807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FcTfqBsaN6t2MebYu2re2wskSHTcVY4QbT4XDnFus+E=;
        b=p4FNOyBj0Xy+fJJyKxN2hKJlTS/NUFXSFZ9wWN6ytYMxlPH1R+O2WEfwU6DQCnCWFx
         /ltFh3DcdIFN6P9QHqqpTYh6AdCdWmYvViCN10+yAq6xARXy3v81g7FqPDdS9RoWVpLg
         9m6AsFhVHqjn7ZLa+Vjg5bjdeJwJhMHuT6y+R2DDHq8eHTSbCuvFVSXPoePYA+rSKNkI
         ewETrYs4YObtfVa3thIBt9Uen2vZlxd/wvwSWO3GT2TXxvxiM3pBC2myLptfgaS/vlrB
         vt6jva+92d8DfbZDcsL2Z97cUqo0gB2IvhPHtCx798C7C/U10+/+C9Q5abukyJMYpYGh
         DqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793607007; x=1794211807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FcTfqBsaN6t2MebYu2re2wskSHTcVY4QbT4XDnFus+E=;
        b=gDfWf6GOsEOEDaBBhnP5z+q2qxrt/90d8T6Cn8k0Ni50bzhNodVoJ4G9SSEi4SjJ/6
         ToSGmykrfmXSCMl/fTESNpnIji9sZ2bkp5VdgUrKI0pfLiGK5ScO9smIKyVZqWMPj/XC
         XI4R0pih9A5bdsvqUB891E2IugGpIB5DcLpls7ZnhJqhcye5eQ8GGJV1mTmGgbEz/sDl
         u90fdNLxIll/xUR/VCNRUL2AB9Te64+iWoPy7oF3kIDLxq7rxT1hb2OpPlyNKrx2wBJa
         wxdGnUwvINHhDs/K7p7n7J9v9pO352x+CJYTpvsB99NoPv+TDGcNmj8Ez4LV1JXDAL/b
         lkFA==
X-Forwarded-Encrypted: i=1; AKwUvBzImbPyUvHBYoPKc56XgLlbHSURY/1is5UQal6WfVTDPV7Me1JPWyTY03QK1woGnTcp6GwaSuOR3bV4uAU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZfjRuSWhF5eZOf03wRAGwLY32suDBqjKzxVX2CQ7gNd34i4xB
	gPwoz4gf3MN26UMOKt+HUFyoWDj1r57fpvpUI9oiElSviy/i91kUUoDUTpFLymmON2lFNYAeYEB
	yb2pLuzxbH2s5w6puQhUgiis+wfEAohQ=
X-Gm-Gg: AYBFou1Yxr2fiNb1WGb9kGgGa00ZizCih8L3uCzxlkk6jZfyK/gb+8IVLT0QhCpOvBC
	f7N0XxTHm6dpp9cuxWIFh5GjFhQQRs9ZEjhMnEDkTsOA+fxAU2AW86/PX9Kju+iA7uHP4RhSWei
	w1TRlFantjId5QKH0tOzstIfly1ehI7kcQtGIJZkAVRx8d2kM+ALC7dYcNWhpiS5p71hVtwXpQ5
	MlAPcfHNy0B9Ae4gMz6Mq+QGpVk2yDqjmTDa19x7W/eCHkijJenWREUaXYdHEogeW1EX2pMeRuW
	JEhs+91l0EBPwVRxexOLHfXMxdn41k8PHQv7nBBy48xTsI4KYToj+qShEDJhAA+oNeuSnIyEBWh
	dYDYvY2XmGFOKVEB6dSY8hR1RH2GYmwJjM7V86Wqo0AjvGdmX0Y0r4/k/iqEXCrQgEMtXLqzG2A
	==
X-Received: by 2002:a05:6a21:151b:b0:3e2:95fb:8cff with SMTP id
 adf61e73a8af0-3e928a29f19mr6964889637.55.1793607007124; Mon, 02 Nov 2026
 00:10:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101223125.302001-1-pmazzini@gmail.com> <20261101223125.302001-6-pmazzini@gmail.com>
 <2c48d47a-85f5-48e8-a675-239b033eb0ce@roeck-us.net>
In-Reply-To: <2c48d47a-85f5-48e8-a675-239b033eb0ce@roeck-us.net>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 2 Nov 2026 08:09:51 +0000
X-Gm-Features: AclHuK_uNhCSmj6Kes8kZnrjm3LQGfrE3mPbM2X3Be5nMZtPNFD9NVdZZEq_W6w
Message-ID: <CAAxh=jvHthWQb2zi-XKM9ggM3Qi7Ra=QSfCGsVTPk54HexQqHA@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] hwmon: sy7636a: read the temperature only while
 the rails are on
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alistair Francis <alistair@alistair23.me>, Andreas Kemnade <andreas@kemnade.info>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for looking at it.

Reading the temperature races with the rails being switched on and
off, as Andreas pointed out on v1.

PG only goes high once all rails are up, after the first measurement.
It is also in register 0x07, next to the thermistor readout, so one
short transfer reads both.

Pablo

On Mon, Nov 2, 2026 at 3:35=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 11/1/26 14:31, Pablo Mazzini wrote:
> > The driver enables VCOM at probe, which keeps the panel's high voltage
> > rails on for good, and gets a dummy regulator if it probes before the
> > regulator exists. Read the temperature only while the rails are on, whe=
n
> > the chip samples it, and return -ENODATA otherwise. Read power good wit=
h
> > it in one transfer, so the value can not be from before the first sampl=
e
> > or after the rails went off. Register it under the chip name, as the
> > TPS65185 and FP9931 drivers do.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >   drivers/hwmon/sy7636a-hwmon.c | 25 ++++++++++++++-----------
> >   1 file changed, 14 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmo=
n.c
> > index f01f368d68e5..475aff997c2d 100644
> > --- a/drivers/hwmon/sy7636a-hwmon.c
> > +++ b/drivers/hwmon/sy7636a-hwmon.c
> > @@ -14,7 +14,6 @@
> >   #include <linux/module.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/regmap.h>
> > -#include <linux/regulator/machine.h>
> >
> >   #include <linux/mfd/sy7636a.h>
> >
> > @@ -22,14 +21,22 @@ static int sy7636a_read(struct device *dev, enum hw=
mon_sensor_types type,
> >                       u32 attr, int channel, long *temp)
> >   {
> >       struct regmap *regmap =3D dev_get_drvdata(dev);
> > -     int ret, reg_val;
> > -
> > -     ret =3D regmap_read(regmap,
> > -                       SY7636A_REG_TERMISTOR_READOUT, &reg_val);
> > +     u8 buf[2];
> > +     int ret;
> > +
> > +     /*
> > +      * Read power good and the thermistor in one transfer: the thermi=
stor is
> > +      * only sampled while the rails are on, and power good comes afte=
r the
> > +      * first sample
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
>
> I had a look at the datasheet. It does not say anything about the
> temperature not being measured when PG is not set.
>
> The datasheet does suggest that temperatures are only measured
> if bit 7 of the operation mode register is set, but that is
> different from the "power good" bit in the fault register.
>
> So why the association with the PG bit and not with the On/Off bit
> of the operation mode register ? That warrants some more explanation.
>
> Thanks,
> Guenter
>   > +   *temp =3D (s8)buf[1] * 1000;
> >
> >       return 0;
> >   }
> > @@ -72,12 +79,8 @@ static int sy7636a_sensor_probe(struct platform_devi=
ce *pdev)
> >       if (!regmap)
> >               return -EPROBE_DEFER;
> >
> > -     err =3D devm_regulator_get_enable(&pdev->dev, "vcom");
> > -     if (err)
> > -             return err;
> > -
> >       hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev,
> > -                                                      "sy7636a_tempera=
ture", regmap,
> > +                                                      "sy7636a", regma=
p,
> >                                                        &sy7636a_chip_in=
fo, NULL);
> >
> >       if (IS_ERR(hwmon_dev)) {
>
