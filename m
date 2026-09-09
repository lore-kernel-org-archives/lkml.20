Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E842C3D75AB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937855; cv=pass; b=vCUXwnP5a/PlK+ecS2EulhMOgFDCGpFilaTnR3Ol5bvCWJBvEAmO6Z7/eyGiJ11u7/mSkoYrxMSs1ADKTmjFpDH1Ntg7WdTlIniAlUl4j3emSn6lLDaFny8hGA+z4eySG+z1/X8x3OBRv8OawuRCanJ3oJd7kdoXM0jCUZy5MA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937855; c=relaxed/simple;
	bh=cV6UlgSsoeieB0QU53jtGzzQVyQymOnaPmCvkqkbYk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BsVjw906xTaX+LpSlw57nD+FbKQbx5Ck1VfrdY4IEDjOvakPgh1B70YvqJo9d5hIUBLAyZmlhkZj4ctaHBhYwfp3Dv46orGJSPyF3JbTWT9OlP4wLkPmx+6euABW020tKcubnyPDPT4V9907fT/6v4b6ZBTvEtVHsflZFl9zluY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XM9U9dFV; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XM9U9dFV"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a49a022221so4694901fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788937850; cv=none;
        d=google.com; s=arc-20260327;
        b=FG1f85+fS0XTVjUHFp6lrxHnCKVvjK8ll5iObhG5Q8ci5M711CUipL3mH6TwYbtxkq
         zSxxN2CEf62SS/M0u5sY2/Har/WZJh02HklIeoZ4Yum2x+GoMPVq2YN0n9iJcV1OV3Vl
         i+YZ+zvAYuALGSu/VaJ6WGLhGq66rRRa+t9dnyf2NcX9a+XvR3eR8F96iLib/kUrULdn
         Kx2F5VamJKdGIGOZmQNzQM/jSa03uqvqeD/NOqnkuzlju/kuAZEc1jBUgruPy4CoBtoE
         iE0cH+U/VeCFwreeBTREVGWDLq2Sr2wdQJZdl2+Rk2CfWpVgZLlSTpo6VdtcI/WKwPvw
         gg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ROD27d8m1GR2fFN6iwOvveba7kIgkMyQccBJdEpOPig=;
        fh=2MXvU4FOLUYtm1OTym5QzCBMmePLVeS/Gszb5X13VJM=;
        b=Y8iu+j/VMU3zjx5YEy22sNVA9Q1UZ533Mww/aZV/Kwc8LkFQvnJjRP24KfTF94W07g
         eHZss3H0hD/0JHqnEiUoDSE+1V1n6/wvaiYaXxgsaOUpI5KHRjywAZEAEpMAj/i+3L1A
         iH9YBm21rSZ+vqUKLXSipiar3gv0ZWljFi+/u8pdtRC+AezeNrLwsuoiaGEmTENXNuxu
         jIT3o53b8AzjjAMbox69BWHUMPsTlkqp+O4m7Uc0sf+yqbeENCez668bVKFwQlDmPMym
         LJA9FdSFx3wkTbXjutbwToTU5CvLOaW3MzSad8R5IFjovGbIFNO6NxNsaijjC6Bkcjlc
         HZ7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788937850; x=1789542650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ROD27d8m1GR2fFN6iwOvveba7kIgkMyQccBJdEpOPig=;
        b=XM9U9dFVh8+9/DSTvcmT2g+ndD8Ks5zbRwdMzNvOmiOxy1RXe32jtZc73F2nWvT3Qe
         OPp49eSHTDJ05s/wKP+KcwUQ+lvMT96880d1mm71y/XNAnKGD2r/QLQ1aNrutI+tRd6V
         yqSZ3HHpY43V4+KUTUrXgbDRw1AJFreQ8H6P22jjbLzicEgEwa0dsg4fNeAJIgY467J/
         sRYlzvaWCCGbyWs82Gft/3ZBsZ3MAzOttAqoK7mO8kQlDtE/lHmb4nOJenpkZE9Dxhf3
         M+nnKCgUfGdxXxjxY6DZ2eV0uN4NOzarqjm+lB/xq+8Mgl3Ux9T3xcrXl7luzXrscn9B
         Z0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788937850; x=1789542650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROD27d8m1GR2fFN6iwOvveba7kIgkMyQccBJdEpOPig=;
        b=M4l4hJlEoNRzcDJHTBhgZkvGJxHKRZPj0j31L5jGFN41hsi29NvrZPn2B8/HQ1gi5Y
         R4oZerS/txUnyuRFpmiuZA0wh2GvpkTGO+usTG+ZOGJg516fP5QvUPbBVWVG18Qk9n5l
         moq/7R++kXnGHxTBlbsQxefmJn9nGWaXhmR8qHn5N9La02a6ai5F8OUmmyJqvXbRUnsi
         LPe/ptGoL4z+MZyVRgfK9uchmHlB5rvs36yh/Tr0FLpXHxUkx4VktBQdZgpZ2R91TQ7c
         zwj3p1jV0M9Dxkty29qnXbsR9S1GriY2jkK942E3MHWdn4d111q8f7EDEHLG94lrq0bn
         r4oQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhsI8/yuUCPW+F8G7PcP8n37KelqEosm7brZNikfzqFizAPU11PQ0Ai+JD//RHk4MfIJ5NpAYksUnslbA=@vger.kernel.org
X-Gm-Message-State: AFuF++n1gAzwkILCoVja9TdZSomUevxen9Z8onOKHPzFzFEOvnDJLWNW
	DTYvENtDlP+b9yTXmDAQFbWfqzF/94mwHdkcroJ+0TsEkPKGbf3UItUOEE5iBbv3tizKCbtQAby
	dAEiDgRbV3jcT99O2CuBIprmyWvXozhA=
X-Gm-Gg: AYBFou3wZlsecZIo2YzwP/DXuqtGks+FUh5oo8Y+pF8gGDyNxUCDeTAF6hPfgeT20KD
	RyjF1t7qMjTRxo7XN+5K+kE3zdJsUBZl6UGwb1tZZFcQE3EGTnF6PKn2cwl6IP7jmEwtsGN86yi
	378/sAe2e70SzuUUWAmzPhgsAEph3Xw3wDs3y0DOCFoUxjAu40kti+qNKEMCzEEEHon8K1PONPI
	lEnF01hiqESr4ms9f0EPbW8f6eEiT+DZzNaq5FpgHHtucvIMDhvbTYZ+RDE9fv8McGR/RVioQaA
	IFfkMUFd8XvYzszLYHMRrvjm4htAvWnabVgIlvIYVhrsN+TXBjrxcaEqI0zoXUUi4bF93fQdLFx
	KJwwstI2H5JbD
X-Received: by 2002:a05:651c:43c2:10b0:3a3:74b9:8a7c with SMTP id
 38308e7fff4ca-3a374b98b1cmr22174011fa.21.1788937849797; Wed, 09 Sep 2026
 00:10:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907080831.11281-1-syhuang3@nuvoton.com> <c1f812d6-9938-494f-ae37-e250434a25f7@roeck-us.net>
In-Reply-To: <c1f812d6-9938-494f-ae37-e250434a25f7@roeck-us.net>
From: Sheng-Yuan Huang <hsyemail2@gmail.com>
Date: Wed, 9 Sep 2026 15:10:38 +0800
X-Gm-Features: AcwNN1UlzTkjD7sEoviBsfQKLTRM8RtP5VhfLDJP0BM5vsjXETF0F6kXVtLWwCo
Message-ID: <CACW=pY4mpuC1+Z21egn3jJY6jtMhMx1PFFbM+Rcy6giuzXpJ1Q@mail.gmail.com>
Subject: Re: [PATCH v1] hwmon: (lm75) Add support for Nuvoton NCT7715
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: Sheng-Yuan Huang <syhuang3@nuvoton.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review. I may have misunderstood which conversion
you are referring to, so I would like to clarify both parts.

If this refers to the NCT7715_CONFIG_* masks, they use the logical bit
positions of the 16-bit configuration register defined by the
NCT7715 specification. They are not pre-swapped for the SMBus word
byte order.

If this refers to the I2C accessors, the NCT7715 transfers its 16-bit
configuration register MSB first. The lm75 regmap bus uses
reg_read/reg_write callbacks. In this path, regmap passes the logical
register value to the callbacks, and i2c_smbus_*_word_swapped()
performs the conversion between that value and the SMBus word byte
order.

I verified this on hardware by changing update_interval. i2cget shows
0xe060, 0xa060, 0x6060, and 0x2060 for 125, 250, 1000, and 4000 ms,
respectively. After accounting for the SMBus word byte order, these
are logical values 0x60e0, 0x60a0, 0x6060, and 0x6020. In each case,
only the NCT7715 conversion-rate field, bits [7:6], is changed.

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2026=E5=B9=B49=E6=9C=887=E6=97=
=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:30=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 9/7/26 01:08, hsyemail2@gmail.com wrote:
> > From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> >
> > The Nuvoton NCT7715 is compatible with the LM75 temperature and
> > limit register layout, but its 16-bit configuration register is
> > transmitted most-significant byte first. Add support for the NCT7715,
> > including byte-swapped SMBus accesses for its configuration register.
> >
> > Handle its conversion-rate field and shutdown bit separately, since
> > their bit positions differ from the standard LM75 layout.
> >
> I don't think so. See below.
>
> > Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> > ---
> >   .../devicetree/bindings/hwmon/lm75.yaml       |  1 +
> >   Documentation/hwmon/lm75.rst                  |  6 ++
> >   drivers/hwmon/lm75.c                          | 57 ++++++++++++++++++=
-
> >   3 files changed, 62 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Docume=
ntation/devicetree/bindings/hwmon/lm75.yaml
> > index b48bf3fd721f..832a8c5d83e9 100644
> > --- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
> > @@ -31,6 +31,7 @@ properties:
> >         - nxp,p3t1750
> >         - nxp,p3t1755
> >         - nxp,pct2075
> > +      - nuvoton,nct7715
> >         - st,stds75
> >         - st,stlm75
> >         - microchip,tcn75
> > diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rs=
t
> > index ca46754e028b..fac0b8f29ddc 100644
> > --- a/Documentation/hwmon/lm75.rst
> > +++ b/Documentation/hwmon/lm75.rst
> > @@ -150,6 +150,12 @@ Supported chips:
> >
> >                  https://ams.com/documents/20143/36005/AS6200_DS000449_=
4-00.pdf
> >
> > +  * Nuvoton NCT7715
> > +
> > +    Prefix: 'nct7715'
> > +
> > +    Addresses scanned: none
> > +
> >   Author: Frodo Looijaard <frodol@dds.nl>
> >
> >   Description
> > diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> > index 2d2d752aeac9..0b55f6b7c68d 100644
> > --- a/drivers/hwmon/lm75.c
> > +++ b/drivers/hwmon/lm75.c
> > @@ -39,6 +39,7 @@ enum lm75_type {            /* keep sorted in alphabe=
tical order */
> >       max6626,
> >       max31725,
> >       mcp980x,
> > +     nct7715,
> >       p3t1750,
> >       p3t1755,
> >       pct2075,
> > @@ -107,6 +108,15 @@ static const unsigned short normal_i2c[] =3D { 0x4=
8, 0x49, 0x4a, 0x4b, 0x4c,
> >   #define LM75_REG_MAX                0x03
> >   #define PCT2075_REG_IDLE    0x04
> >
> > +#define NCT7715_CONFIG_RESOLUTION_12_BIT     GENMASK(14, 13)
> > +#define NCT7715_CONFIG_SHUTDOWN                      BIT(8)
> > +#define NCT7715_CONFIG_CONVERSION_RATE_MASK  GENMASK(7, 6)
> > +#define NCT7715_CONFIG_EXTENDED_MODE         BIT(4)
> > +#define NCT7715_CONFIG_RATE_0_25HZ           0
> > +#define NCT7715_CONFIG_RATE_1HZ                      BIT(6)
> > +#define NCT7715_CONFIG_RATE_4HZ                      BIT(7)
> > +#define NCT7715_CONFIG_RATE_8HZ                      GENMASK(7, 6)
> > +
> >   struct lm75_data {
> >       const char *label;
> >       struct regmap                   *regmap;
> > @@ -122,6 +132,10 @@ struct lm75_data {
> >   /*-------------------------------------------------------------------=
----*/
> >
> >   static const u8 lm75_sample_set_masks[] =3D { 0 << 5, 1 << 5, 2 << 5,=
 3 << 5 };
> > +static const u16 nct7715_sample_set_masks[] =3D {
> > +     NCT7715_CONFIG_RATE_8HZ, NCT7715_CONFIG_RATE_4HZ,
> > +     NCT7715_CONFIG_RATE_1HZ, NCT7715_CONFIG_RATE_0_25HZ
> > +};
> >
> >   #define LM75_ALERT_POLARITY_HIGH_8_BIT      (BIT(2))
> >   #define LM75_ALERT_POLARITY_HIGH_16_BIT     (BIT(2) << 8)
> > @@ -259,6 +273,15 @@ static const struct lm75_params device_params[] =
=3D {
> >               .sample_times =3D (unsigned int []){ 30, 60, 120, 240 },
> >               .resolutions =3D (u8 []) {9, 10, 11, 12 },
> >       },
> > +     [nct7715] =3D {
> > +             .config_reg_16bits =3D true,
> > +             .set_mask =3D NCT7715_CONFIG_RESOLUTION_12_BIT,
> > +             .clr_mask =3D NCT7715_CONFIG_EXTENDED_MODE,
> > +             .default_resolution =3D 12,
> > +             .default_sample_time =3D 250,
> > +             .num_sample_times =3D 4,
> > +             .sample_times =3D (unsigned int []){ 125, 250, 1000, 4000=
 },
> > +     },
> >       [tmp100] =3D {
> >               .set_mask =3D 3 << 5,     /* 12-bit mode */
> >               .clr_mask =3D 1 << 7,     /* not one-shot mode */
> > @@ -354,6 +377,11 @@ static inline long lm75_reg_to_mc(s16 temp, u8 res=
olution)
> >   static inline int lm75_write_config(struct lm75_data *data, u16 set_m=
ask,
> >                                   u16 clr_mask)
> >   {
> > +     if (data->kind =3D=3D nct7715)
> > +             return regmap_update_bits(data->regmap, LM75_REG_CONF,
> > +                                       clr_mask | set_mask | NCT7715_C=
ONFIG_SHUTDOWN,
> > +                                       set_mask);
> > +
> >       return regmap_update_bits(data->regmap, LM75_REG_CONF,
> >                                 clr_mask | set_mask | LM75_SHUTDOWN, se=
t_mask);
> >   }
> > @@ -486,6 +514,13 @@ static int lm75_update_interval(struct device *dev=
, long val)
> >               if (data->params->resolutions)
> >                       data->resolution =3D data->params->resolutions[in=
dex];
> >               break;
> > +     case nct7715:
> > +             err =3D lm75_write_config(data, nct7715_sample_set_masks[=
index],
> > +                                     NCT7715_CONFIG_CONVERSION_RATE_MA=
SK);
> > +             if (err)
> > +                     return err;
> > +             data->sample_time =3D data->params->sample_times[index];
> > +             break;
> >       case tmp112:
> >       case as6200:
> >               err =3D regmap_update_bits(data->regmap, LM75_REG_CONF,
> > @@ -609,6 +644,8 @@ static int lm75_i2c_reg_read(void *context, unsigne=
d int reg, unsigned int *val)
> >       if (reg =3D=3D LM75_REG_CONF) {
> >               if (!data->params->config_reg_16bits)
> >                       ret =3D i2c_smbus_read_byte_data(client, LM75_REG=
_CONF);
> > +             else if (data->kind =3D=3D nct7715)
> > +                     ret =3D i2c_smbus_read_word_swapped(client, LM75_=
REG_CONF);
> >               else
> >                       ret =3D i2c_smbus_read_word_data(client, LM75_REG=
_CONF);
> >       } else {
> > @@ -628,8 +665,11 @@ static int lm75_i2c_reg_write(void *context, unsig=
ned int reg, unsigned int val)
> >       if (reg =3D=3D PCT2075_REG_IDLE ||
> >           (reg =3D=3D LM75_REG_CONF && !data->params->config_reg_16bits=
))
> >               return i2c_smbus_write_byte_data(client, reg, val);
> > -     else if (reg =3D=3D LM75_REG_CONF)
> > +     else if (reg =3D=3D LM75_REG_CONF) {
> > +             if (data->kind =3D=3D nct7715)
> > +                     return i2c_smbus_write_word_swapped(client, reg, =
val);
>
> This code is double swapping. The calling code swaps (bit settings),
> regmap calls this function, where the word is swapped again.
>
> Guenter
>
