Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794204464;
	b=MiSGljjOX6t2QFFlsWLGyFhU3Fp5T0tfrD20GBgXCutSGGFH8uHXIRyFBx0BFQ434t5Z
	 FglC2ju67PcPjG62TdHglZwKxqVzsmivE7EUR1QVpGlsID3+7eHVDfkWNABdx1MgxVOP7
	 4AQHnRX1J8O2ff3QlFzqV12qwIN3EhBITgV6gMwJp2Dl0IOKWacNqpUtczJhySZ04IxfN
	 4QEKmgM2iaHz/DktfL5elS/FTE8naDaf4XTRNWvwFrMTJXtIc7JazPkn53ytSbe1gHzgA
	 rQYEJLD2ZJ5DJWwofXzxD4uJ+3blV/UKgfji7Lj5JH8v71QoOTaCDwUjD12eBKuFtpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BGxs6m2iOKxaHN/PKawqBgDgtzdZeblrm0EaZ0IFr9g=;
	b=yqapTqdeJr99KcPbomu+71jwca0s3ytx8MiqHx/+MTeGOPSkhcPIpUOL7JVqhmv6qW5v
	 OycU9Ak5ipmQMIPXQRwMD7iQegsZGbc4aSdrHRa72oC3k4KsbsyBvhCv7D7NZc8bWVtXS
	 OuM4tcj5HrfrgdtKOeE2kqPvmy88GzlagCBqG/5kqp5UyJjyCRAQK+03oagzNX2b5BTDp
	 um4dO1bPhGzoTUb/ekCRLCioaMe6FosB8Tt0qke1CWaxKc3Fs7OUpYph+dXooy7+D8o/i
	 xQgmeGecv1YYrZKK67N+XS67qCtpMkPLkm3PEu3GBJX+WEYZYouxAfgnkxiHlJprtkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gdzdNmEt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDD3606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFDD3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gdzdNmEt
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37071c0f42aso1041104eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:07:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794204463; cv=none;
        d=google.com; s=arc-20260327;
        b=d1uwLYnByQjHOBe9m2cHYH7reiJwn2XbJkORWIgdeKIRrYo0VaxkLLkPOEHAbUEqCP
         4GPJduVj2l8KOUHGHKHaeANqVvrd5irmunUiPECLTLTUhCjW3eFnGT6hNdAQBMhv00nf
         HpSvN4xI+Ob5/35n5tv/4bbctmUD8skxgp/A/MfKWHKNw4YJd39+7sYcq008aCs3BtzZ
         R4HNdenmDgBf0we3Vl2pyjSDXwSvqiBVYljgIWz7kCwa0XUgx3zVsf31GheCuppG7QZz
         1ycIBd1e6jlvAfR5ZatcElD3k3zFy1KupjRT0s5cQyMx0SaVY7jzl8ZyOVeA/4O2NtTk
         n3YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BGxs6m2iOKxaHN/PKawqBgDgtzdZeblrm0EaZ0IFr9g=;
        fh=qrdczDvq/uMFfVkYkZEcxU+ZRkxZfrKHzxFucINTevA=;
        b=Ru6eaOmPnaoJUU+JHthHTI+RJx17z2LvEPjU9F3wFuJg92yE8Vr+y4K/X2I+FrWMxO
         S+PYOu4ZskiIE+0v1uPqHpCeYIiZAFzBvnJ3clr1P0x/br7VZ6tcai/ePO9YuAQV9iVR
         YeiHt4ESn2rfDhMM1k20jHvY6SofBN4ee4AbDu79Zr9DltkNCEArdBJ7urbXruuJ69a9
         bcdR5muWOrCJu5eGm50SLr5eEKXw4edW8jyZwGbmvHEKrm09NNOwX4en+m67kXZxi3Gp
         ZEfFbT8Er2CGSl1AnPH8MtL5P122yAzxDwb9C8m4+vSRScHUnzIGvZuBpcaBCC/9Xfwo
         kQtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204463; x=1794809263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BGxs6m2iOKxaHN/PKawqBgDgtzdZeblrm0EaZ0IFr9g=;
        b=gdzdNmEtIKalBYqyQpTflNLAj46GYtfwceIQgURGKUO5BTjFwk1UyvdrJTQNMRd7A4
         GGS0og6mkqe7glpMpj5L3vN3aL7NOiGItCSfLcDQ5qzmNlikJvAJibmnwNo0vV0drki4
         zWX11FmeBKJWf4w3CNUstU0TS0rycgWxT/ESZ1d2e2EwfU5BwXwCCM77xwp8qDCF74TZ
         QWWtczTekMsCzysfzeBOJu4YTQwBjhwXwhlzm5jVC9ezrMjyJQS2BgsjwW6FSTTCchln
         gsdPWt3wcVLqYEw7XVnJmLOF24oOtnClYhwg2CTZYdE0hEcLNWD7KAUunxD5Rh9rkyq3
         l3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204463; x=1794809263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGxs6m2iOKxaHN/PKawqBgDgtzdZeblrm0EaZ0IFr9g=;
        b=G0WooO1sQNf5OF6IF0RaENbKqaGz9B7sbZjcvxQtJpvSv6rfZ/wgDVRAn6YoZZ1dPl
         Hfo5WCLo6qJ+i/pKG4bHinvr+JwOY6JUFGLz4fx3yaNH1ORcV6fszWdGix7Eb3jAhZfe
         6Qyd1OpbR5Tb2ZDh3pe3fUu8++BkgUoYoEpG0+yhV7zqbV+O/WVWwz25pCbfUfC0RH+J
         Gxbxr9ZB+TC4BZ9BqEshPgzs2zt+JqcGrV+ZRPSJ4GvCuUBf3btXNIkH+Pxn3NAxi6gr
         ggm9RXkguii0xvSRq19f9mrCKfOmPex+WMF/sA76sTK+G2cYEY++aFXJ0HcUA8cM/spI
         NZJQ==
X-Forwarded-Encrypted: i=1; AL+hErFBUVazWqvb1qbQ2NDFR7EJf/DlQAh7fFGKfhr84HDeAcsixjOoUO9o0M845wORafULcQiCKhYHqqUgb/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hzo11/7JvQL4+iyYtM5bYkiWrsTdknce7HqHVOneCxI4+uPZb
	km0McBaiGXgOC9yMox5b8BGFQc+At0E3LY5c6wdmyzIzX82ikXHaGMGOi9vOwThynXvokeepOmh
	G1O1VYcnK08qMUhfZzACeZBjEY7072qU=
X-Gm-Gg: AYBFou25F3G/N+LgFykrRhwF77zpMi6RpIoWjSUiL+/7wsKJ9IWE7n1rE8zacU5ADpa
	rD1MJYq0xuN38IwJRMt7M20YuVVh1BM0ychGY2ZclmUGiiMFuEvw4c91/GjfGlbFx2ADa7WmLYL
	yov5Wh+/rJVGhENKxmPa8tdYqXJ20t40vPorr+XOg8M5e+EVEF83xa14V2zC7sawe9FrNu1Qv1F
	DMvJSpQDFMVnPSNy2J1bRyzFgQort0/zrSHKj/EGWjhhihALeYw62fuSKml7rH1dxSjTcQ0AEiw
	GbJDdFLppBdgMFmEF751NY0o8JLcAI6SAs1zsbGOIhfQ9oAC51EoHpQEDodM6vIb/4ikqPJMWk0
	z+3qk7EtGwro172EfBVRpubgyikclpLL/bCSMHQ3HtmJbssyGS04LcgT4/Calca0d5E2yptccnH
	GjAkMUH/UjWSow49S2ZrVUxWgxcnRY3Q==
X-Received: by 2002:a05:693c:87dc:10b0:36a:15cb:30bf with SMTP id
 5a478bee46e88-3725d1a5eabmr6551636eec.13.1794204462656; Sun, 08 Nov 2026
 22:07:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108095634.100517-1-clamor95@gmail.com> <20261108095634.100517-4-clamor95@gmail.com>
 <20261108234719.42ede7b3@jic23-hlaptop>
In-Reply-To: <20261108234719.42ede7b3@jic23-hlaptop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 9 Nov 2026 08:07:30 +0200
X-Gm-Features: AclHuK-R9XkTQoQlpezP3I5Q2ozqrcLBRAL1hF29N7CmgQZiCJUqAcSsJH-0tIs
Message-ID: <CAPVz0n25vgzUMrQVUNTTesTGV4SfBGuE+j_ciL5bv+3Nt5gx5A@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] iio: adc: Add support for MAX8907 ADC cell
To: Jonathan Cameron <jic23@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 9 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 01:47=
 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun,  8 Nov 2026 11:56:33 +0200
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > The MAX8907 PMIC has a dedicated ADC cell, which provides 8 ADC channel=
s
> > with information about different parts of the power system, including t=
he
> > battery, charger/plug, jack and thermal readings.
>
> This is an unusual driver structure.  Seems like we really have
> a number of different i2c devices inside one package.  Is the only
> unified bit the power control?
>

This is a usual structure for MFD device, two and tree address devices
is not smth unique in this subsystem.

> I appreciate you just want to add a new feature to this ancient
> driver but it does feel like things would much simpler if the
> i2c regmap was registered in here rather than the parent using
> a platform device to wrap what seems to be a largely independent
> i2c device.
>

It is not independent. Parent still has control over all i2c addresses
physically. Additionally, this i2c client also has unimplemented
touchscreen capabilities.

> I'll be looking from some input from Lee for the MFD aspects and
> whether he is happy with adding stuff to this driver with its
> current structure.  Doesn't make that much difference to the IIO
> part either way.
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> Other than that various minor things inline.
>
>
> > diff --git a/drivers/iio/adc/max8907-adc.c b/drivers/iio/adc/max8907-ad=
c.c
> > new file mode 100644
> > index 0000000000000..d1acb5bc95c15
> > --- /dev/null
> > +++ b/drivers/iio/adc/max8907-adc.c
> > @@ -0,0 +1,195 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/iio/iio.h>
> > +#include <linux/kernel.h>
>
> Don't include that.  Figure out which more specific
> headers in are in use and include those instead.
>
> > +#include <linux/module.h>
> > +#include <linux/mfd/max8907.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +
> > +/* MAX8907_ADC_RES_CNFG1 */
> > +#define RES_AUX1                     BIT(7)
> > +#define RES_AUX2                     BIT(6)
> > +#define RES_VCHG                     BIT(5)
> > +#define RES_VBBATT                   BIT(4)
> > +#define RES_VMBATT                   BIT(3)
> > +#define RES_ISNS                     BIT(2)
> > +#define RES_THM                              BIT(1)
> > +#define RES_TDIE                     BIT(0)
> > +
> > +/* MAX8907_ADC_AVG_CNFG1 */
> > +#define AVG_AUX1_EN                  BIT(7)
> > +#define AVG_AUX2_EN                  BIT(6)
> > +#define AVG_VCHG_EN                  BIT(5)
> > +#define AVG_VBBATT_EN                        BIT(4)
> > +#define AVG_VMBATT_EN                        BIT(3)
> > +#define AVG_ISNS_EN                  BIT(2)
> > +#define AVG_THM_EN                   BIT(1)
> > +#define AVG_TDIE_EN                  BIT(0)
> > +
> > +/* MAX8907_ADC_ACQ_CNFG1 */
> > +#define T_ACQ_AUX1                   BIT(7)
> > +#define T_ACQ_AUX2                   BIT(5)
> > +#define T_ACQ_VCHG                   BIT(3)
> > +#define T_ACQ_VBBATT                 BIT(1)
> > +
> > +/* MAX8907_ADC_ACQ_CNFG2 */
> > +#define T_ACQ_VMBATT                 BIT(6)
> > +#define T_ACQ_ISNS                   BIT(4)
> > +#define T_ACQ_THM                    BIT(2)
> > +#define T_ACQ_TDIE                   BIT(0)
> > +
> > +/* MAX8907_ADC_SCHED */
> > +#define AUTOSCH_ENABLE                       BIT(1)
> > +#define AUTOSCH_TIME                 BIT(0)
> > +
> > +#define TO_REG(n)                    ((n) & 0xff)
> > +#define TO_MEASURE(n)                        (((n) >> 8) & 0xff)
>
> Similar to below, Give this a prefix.  Same for all the defines
> above.
>
> > +
> > +enum {
> > +     TDIE, THM, ISNS, VMBATT, VBBATT, VCHG, AUX2, AUX1
>
> I'd prefix these. Chances of a naming clash in the long
> run are high enough that usual IIO style is to prefix pretty
> much everything with the driver name.
>

I have not prefixed there intentionally to be able to use them as both
index and in the register naming in the channel macros later in the
code.

> > +};
> > +
> > +static const u32 max8907_default_ref[] =3D {
> Index these off the enum. Makes it easier to check what
> the value is for a specific channel.
>         [MAX8907_TDIE] =3D 4096,
>         [...]
>

Sure.

> > +     4096, 4096, 4096, 8192, 8192, 8192, 2500, 4096
> > +};
> > +
> > +#define MAX8907_CHAN(_type, _idname, _datasheet_name) {              \
> > +     .type =3D (_type),                                        \
> > +     .address =3D MAX8907_REG_##_idname##_MSB |                \
> > +                MAX8907_REG_##_idname##_MEASURE << 8,        \
> > +     .indexed =3D 1,                                           \
> > +     .channel =3D (_idname),                                   \
> > +     .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |          \
> > +                           BIT(IIO_CHAN_INFO_SCALE),         \
> > +     .scan_index =3D (_idname),                                \
> > +     .scan_type =3D {                                          \
> > +             .format =3D IIO_SCAN_FORMAT_UNSIGNED_INT,         \
> > +             .realbits =3D 12,                                 \
> > +             .storagebits =3D 16,                              \
> > +             .endianness =3D IIO_CPU,                          \
> > +     },                                                      \
> > +     .datasheet_name =3D (_datasheet_name),                    \
> > +}
> > +
> > +static const struct iio_chan_spec max8907_adc_channels[] =3D {
> > +     MAX8907_CHAN(IIO_VOLTAGE, TDIE,   "tdiode"),
> > +     MAX8907_CHAN(IIO_VOLTAGE, THM,    "thermistor"),
> > +     MAX8907_CHAN(IIO_CURRENT, ISNS,   "isense"),
> > +     MAX8907_CHAN(IIO_VOLTAGE, VMBATT, "vmbatt"),
> > +     MAX8907_CHAN(IIO_VOLTAGE, VBBATT, "vbbatt"),
> > +     MAX8907_CHAN(IIO_VOLTAGE, VCHG,   "vcharge"),
> > +     MAX8907_CHAN(IIO_VOLTAGE, AUX2,   "aux2"),
> > +     MAX8907_CHAN(IIO_VOLTAGE, AUX1,   "aux1"),
> > +};
> > +
> > +static int max8907_adc_read(struct iio_dev *indio_dev,
> > +                         struct iio_chan_spec const *chan,
> > +                         int *val, int *val2, long mask)
> > +{
> > +     struct regmap **regmap =3D iio_priv(indio_dev);
> > +     unsigned char data[2] =3D { 0, 0 };
>
> No need for those 0.  =3D { }; is defined to do the same thing.
> There are some subtleties around that, but the kernel has used
> build options for a long time (and self tests to ensure that form
> is fine).  It is also part of more recent C specs.
>
> Use u8 rather than char.
>

Noted

>
> > +     int ret;
> > +
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_RAW:
> > +             ret =3D regmap_write(*regmap, TO_MEASURE(chan->address), =
0);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             ret =3D regmap_bulk_read(*regmap, TO_REG(chan->address), =
data, 2);
>
> sizeof(data);
>

Noted

> > +             if (ret)
> > +                     return ret;
> > +
> > +             *val =3D ((data[0] << 8) | data[1]) >> 4;
>
> Use get_unaligned_be16() then a shift.
> better still use a __be16 as the buffer.
>

Noted

> > +
> > +             return IIO_VAL_INT;
> > +
> > +     case IIO_CHAN_INFO_SCALE:
> > +             *val =3D max8907_default_ref[chan->channel];
> > +             *val2 =3D chan->scan_type.realbits;
> > +
> > +             return IIO_VAL_FRACTIONAL_LOG2;
> > +
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
> > +
> > +static const struct iio_info max8907_adc_info =3D {
> > +     .read_raw =3D &max8907_adc_read,
> > +};
> > +
> > +static int max8907_adc_init(struct regmap *regmap)
> > +{
> > +     u32 value;
> > +     int ret;
> > +
> > +     /* Enable internal voltage reference. Exact purpose of bits is no=
t known. */
> > +     ret =3D regmap_update_bits(regmap, MAX8907_REG_TSC_CNFG1, GENMASK=
(1, 0), BIT(1));
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Check for internal reference IRQ */
> > +     ret =3D regmap_read_poll_timeout(regmap, MAX8907_REG_TSC_STA_INT,=
 value,
> > +                                    !(value & MAX8907_MASK_NREF_OK), 0=
, 1000);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Enable ADC scheduler with 1 second interval */
> > +     ret =3D regmap_update_bits(regmap, MAX8907_REG_ADC_SCHED,
> > +                              AUTOSCH_ENABLE | AUTOSCH_TIME, AUTOSCH_T=
IME);
>
> return regmap_update_bits()
>
> Bit odd to unset AUTOSCH_ENABLE in something that is commented as turning
> it on.  That is probably a field that needs a rename.
> I'd also like those field names to reflect that they are in ADC_SCHED.
>

I agree, but max8907 unfortunately has no available datasheet, and
these names are from downstream kernel.

>
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +
> > +static int max8907_adc_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct max8907 *max8907 =3D dev_get_drvdata(dev->parent);
> > +     struct iio_dev *indio_dev;
> > +     struct regmap **regmap;
> > +     int ret;
> > +
> > +     indio_dev =3D devm_iio_device_alloc(dev, sizeof(*regmap));
> > +     if (!indio_dev)
> > +             return -ENOMEM;
> > +
> > +     regmap =3D iio_priv(indio_dev);
> > +
> > +     *regmap =3D max8907->regmap_adc;
> > +
> > +     indio_dev->modes =3D INDIO_DIRECT_MODE;
> > +     indio_dev->channels =3D max8907_adc_channels;
> > +     indio_dev->num_channels =3D ARRAY_SIZE(max8907_adc_channels);
> > +     indio_dev->name =3D dev_name(dev);
> > +     indio_dev->info =3D &max8907_adc_info;
> > +
> > +     iio_device_set_parent(indio_dev, dev->parent);
>
> Why this choice for the parent?  What is wrong with having the
> platform device in between?  Needs a comment.
>

To be able to use pmic phandle as adc reference since adc has no
dedicated node. I have tried without, it failed. I will add comment
above.

> > +
> > +     /* Enable ADCREF */
> If it's called ADCREF can we just include that as part of the field
> name and remove need for the comment?
> > +     ret =3D regmap_set_bits(max8907->regmap_gen, MAX8907_REG_RESET_CN=
FG,
> > +                           MAX8907_MASK_RST_CFG_INT_REF_EN);
>
> Need to be more consistent with register vs field names. I'm fine
> with either form but it should be the same for how you shorten
> RESET_CONFIG
>

As with ADC_SCHED

>
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D max8907_adc_init(max8907->regmap_adc);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return devm_iio_device_register(dev, indio_dev);
> > +}
>
>
