Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEBF5208D3
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220726; cv=pass; b=N9qtkK02ezwmx3m2ugfzXOpgN42DAb/MbK/q+IvET1VVpb+cygEoyPIpuW3ic6uOOBK62ECslbFDhKlScS8beW+mb1JDU9bWZzYw87YKwXTHxrVRljVNn9UD229puL6BCh2ktWr+G66hhcqCmFCN9MvcACIk5D6oW4yxlQzKuiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220726; c=relaxed/simple;
	bh=uuRxUEWAiTYG1xcsGVUJv5Gj+GudNMkgTE5oMCqx0vM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYxHGMCZqsbBByRi5+oTvvaQpbQ0pRXEQELCNyCniNN5+5Z8tHNaolz6IR7DU9Tnd4tVgSsE8H8QJ6yubZQwO5BKcBhd9pwUuOQcBZtBEtP9rQvU9COn5+JtFW6Tq4/2lV1higRdKYSR4z/ciYVCjI5SavSAr1G3Nrg5KeUBv0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+2EqZ6b; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+2EqZ6b"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-344447f9c3dso1239258eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791220723; cv=none;
        d=google.com; s=arc-20260327;
        b=SxhZUNdSeUinopW43B0clnA9z1KITopO4VW4Hn2RVHm5Z7vYxelGQLAB0Vq5MSbJpt
         ReWltPWsT/g0CDvsaP6q8YmzCd2sLpsb7cR3X72LPeWpRWvi0Ry818epTaH8t/vUkDtV
         CVpeiqx6jY1Yvhyy6yQi/VFHyxJqYl47ZrH0w4IGSscihR/0EiOXwVxJwhBbDm6cTrJu
         YLmYnOHIZHKsxFSGQtjJIzpExthm/bPdRnBKhYkOqnmccEviLZTUh4LToblEqDCyyE2J
         QByEJpE4Q4WjOWTq/5pAzk+5EeJXnNQvEtLZGa83DKe6QifvsK4vFzpTw9m2F+4/fguU
         nHZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FJFeJtfT8/aRZATxwvI0/pPdKdSmPKSztHUwOt17NCQ=;
        fh=XrvwZds4Pf6/giTUnClfAt0YutG3ZNafKVvlBIvJPeo=;
        b=QQY9tOPtmWuEnZOoOQ2alOuxF7mu8J2FJbYhlWLRtcbGh2DDr7Ac8kPRDOfnk7z7kC
         AVnp4N2LwgLj+Jedsi06xbAJ/moya9Eki0LR3eVjWi/cMTLZUKtRAJgDjeT+aycOw7/u
         0iTLIfnYmUCorYIpc/i5qjYIB5w4VICC91zoIct+fsHcxpVAztqLpXsvTwERieV5UYfh
         eHqq9XdyszojVsBH62lmW14d44AGaMv7ZPzk0++B59tD1C/TFPk2iqKtP50QzDX+4ova
         hPv9B2t1pe8iuVTGLi35wgekGsxaxuwvUzhQd6DAhn+Dvcs/98YNcCeXI9m2JERD7xBl
         Yn6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220723; x=1791825523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FJFeJtfT8/aRZATxwvI0/pPdKdSmPKSztHUwOt17NCQ=;
        b=f+2EqZ6bObv/gzsdr8ds+qFex1CbwItQjMBS+7+B7bmtiYOz0TcX6upIXEOZA0W2tF
         9vCyfLReKpLIzaaceAwSsia/Ao2A8+FgojOfVc132RzDorubJiP2/YLZrBs0L9iYyUlY
         SiSAPTZPsKZLNiUf/oGBDl3MV2pjMgNt2dyQsSzbz51xHnwOWvJ8/gI0Zba1KoM1wdpJ
         zGwogdyKYtU1hH327Jd08OLC+B4nHlBWSa2DtjPUIJpNuzbromHS11Os0p5hEG1Qd6Uw
         aL01oP5UJk5UtrD0njyOj+DChHrhp5Q6I2lc25P3upFQtCjtyMB4H9XjR+uEZRzLE2E6
         U6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220723; x=1791825523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJFeJtfT8/aRZATxwvI0/pPdKdSmPKSztHUwOt17NCQ=;
        b=DabP41hE5s9i45r06Mk+QLD+mCBWkK4DPpxGNt2hol6Kwuuyi9cAZMlvZcVpRtf+HY
         XYlyAE15F21stdFSZnz5Rh/3AQWfjKpU1fv6tVyS+dOc2mZ4xMnuJC0B0pCrD7ueARby
         dD5WfuCj/eu+nu5/cTnPtqd7VTQPrnGnj+qbdgol/v+1vI/GrZ2x0PKx0cD5XEB9qWiy
         6Me3ox2poHF24oSIltEakgT3ylX8aBZB+yeK75s52WdlLTzWa3JLaZ/Q55vjovyy1gsW
         arqTV4x82dkX99HcXoLgUIreZgV9knxysAi3SGZ7bnwVtx5qTMa1JJWRkkBkxXTIpxbl
         8C5w==
X-Forwarded-Encrypted: i=1; AKwUvBwcBlBhBINw0BnkypD2I/Cg6JUO8cEV3oyDV+YzEs/zeg4gFJ8b/hoVc2kPhT7VWsUf+R9qJmENoI+sodo=@vger.kernel.org
X-Gm-Message-State: AFuF++nIn6sxCmbm742XSe16P4JAEl9YCIBNeud3sHU8Muydq3xHK9mQ
	9Y5XOtswnXNsy1xSvHr6RBqyI42XL0a7CtkMxBwuYaM1cm6i+zoAlR+qDLzrXCO4MnNtfi5eKpn
	T/k5TH9eghfzyz/yK7sRbs2bs1n8nwSU=
X-Gm-Gg: AYBFou0sOAS4V/pFqMcVlnyBFp4EdBpW1cQWKUNT6R4AejFKUbbQkntydcQaIU8XTiQ
	laepgAqSFS1QpBk3tGsBtgvDfWPQGBQ66aAWi5QBMfFC+YzBsHmIzotO8fnpLYOJM1XvK/BKbJ5
	vL1jWRd/UqYlEYYoM/H6HtyxCecxo4OZnS8Fd5uoUYM7LqxXNtvFIWtLlgayh5wb2H1lQsuT5yV
	7BO0SoxHgmk7hY9QGCCmzY6AX6K/YRU42hyMj27tzDwJbA0kBf+plmWfqjX7/oKcYDuTR9Mx+MC
	FLQZ7hvXNv1Td6C+eqSig++NrzN/AFWyKOMRzAzZhz6pJkG+KiuOhnGmvxgbkJMiLUeHRCpcdfb
	PwVSEfJ2OHcU6
X-Received: by 2002:a05:693c:87d1:20b0:34c:1bc7:bcb with SMTP id
 5a478bee46e88-34f159887a3mr13944123eec.22.1791220722737; Mon, 05 Oct 2026
 10:18:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004164121.193514-1-clamor95@gmail.com> <20261004164121.193514-3-clamor95@gmail.com>
 <asPVmbvyslGgEsjk@aspen.lan>
In-Reply-To: <asPVmbvyslGgEsjk@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 5 Oct 2026 20:18:31 +0300
X-Gm-Features: AclHuK8sdu976map0XQTAXXmXCzthY8nwPjOHGJ7oTbO_2PaU56B3jQ1t93eAwE
Message-ID: <CAPVz0n29+1yOO0i057RdpUAu+z85hhnm9GGaHkqgf5XW1SPfeQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mfd: aat2870: Convert to use OF bindings
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 5 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:51=
 Daniel Thompson <danielt@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Oct 04, 2026 at 07:41:20PM +0300, Svyatoslav Ryhel wrote:
> > Conversion of the AAT2870 driver to use OF bindings requires a few comp=
lex
> > changes that should be done simultaneously.
> >
> > The AAT2870 essentially provides two functions via child devices:
> > backlight and regulators. Both functions are fairly self-sufficient and
> > may not be populated on the final board. Consequently, the MFD
> > registration API was replaced with of_platform_populate(), and each
> > sub-device was given its own compatible string.
> >
> > Additionally, aat2870-core utilizes an enable GPIO. Obtaining this GPIO
> > was converted to use modern gpiod/OF helpers, allowing the redundant
> > aat2870_enable() and aat2870_disable() helpers to be removed.
> >
> > The aat2870-regulator driver was updated to register each of the four L=
DOs
> > from a dedicated OF node.
> >
> > The aat2870-backlight driver was changed to populate all required
> > properties from a dedicated Device Tree node. Its channel map was updat=
ed
> > to use u8 instead of int. Furthermore, because the maximum current is n=
ow
> > parsed as an absolute value rather than an enum entry, the calculation =
and
> > application of the maximum current were updated accordingly.
> >
> > All of the changes above allow platform data to be removed entirely.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/mfd/aat2870-core.c            | 115 ++++++--------------------
> >  drivers/regulator/aat2870-regulator.c |  76 ++++++++++++-----
> >  drivers/video/backlight/aat2870_bl.c  |  55 ++++++------
> >  include/linux/mfd/aat2870.h           |  95 +--------------------
> >  4 files changed, 111 insertions(+), 230 deletions(-)
> >
> > [snip]
> >
> > diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backl=
ight/aat2870_bl.c
> > index 8b790df1e842b..933a8f728f66a 100644
> > --- a/drivers/video/backlight/aat2870_bl.c
> > +++ b/drivers/video/backlight/aat2870_bl.c
> > @@ -15,11 +15,19 @@
> >  #include <linux/backlight.h>
> >  #include <linux/mfd/aat2870.h>
> >
> > +/* Backlight has 8 channels, each bit represents one channel */
> > +#define AAT2870_BL_CH_ALL    0xff
> > +
> > +/* Backlight current magnitude (uA), 450uA current is eq to 0 */
> > +#define AAT2870_CURRENT_MIN  450
> > +#define AAT2870_CURRENT_MAX  27900
> > +#define AAT2870_CURRENT_STEP 900
> > +
> >  struct aat2870_bl_driver_data {
> >       struct platform_device *pdev;
> >       struct backlight_device *bd;
> >
> > -     int channels;
> > +     u8 channels;
> >       int max_current;
> >       int brightness; /* current brightness */
> >  };
> > @@ -30,7 +38,7 @@ static inline int aat2870_brightness(struct aat2870_b=
l_driver_data *aat2870_bl,
> >       struct backlight_device *bd =3D aat2870_bl->bd;
> >       int val;
> >
> > -     val =3D brightness * (aat2870_bl->max_current - 1);
> > +     val =3D brightness * aat2870_bl->max_current;
> >       val /=3D bd->props.max_brightness;
>
> What is the purpose of max_brightness?
>
> Normally it is used to limit brightness but max_current is already doing
> that. Is it just being used to reduce the number of steps in the
> brightness scale (and if so, why is that useful)?
>

This is the original driver behavior; I did not modify it.

The AAT2870 backlight intensity is regulated by the Main Backlight
Current Magnitude register. It has 31 steps from 450uA (0) to 27.9mA
(31), so even setting max_current to 0 will not disable the backlight.
The max current value may be limited for some configurations, which is
why this property exists.

The max_brightness property determines the maximum number of steps the
backlight can have and is mapped to the available current range
provided by the hardware. The backlight is controlled in steps, not in
uA.

>
> >
> >       return val;
> > @@ -42,7 +50,7 @@ static inline int aat2870_bl_enable(struct aat2870_bl=
_driver_data *aat2870_bl)
> >                       =3D dev_get_drvdata(aat2870_bl->pdev->dev.parent)=
;
> >
> >       return aat2870->write(aat2870, AAT2870_BL_CH_EN,
> > -                           (u8)aat2870_bl->channels);
> > +                           aat2870_bl->channels);
> >  }
> >
> >  static inline int aat2870_bl_disable(struct aat2870_bl_driver_data *aa=
t2870_bl)
> > @@ -96,24 +104,12 @@ static const struct backlight_ops aat2870_bl_ops =
=3D {
> >
> >  static int aat2870_bl_probe(struct platform_device *pdev)
> >  {
> > -     struct aat2870_bl_platform_data *pdata =3D dev_get_platdata(&pdev=
->dev);
> >       struct aat2870_bl_driver_data *aat2870_bl;
> >       struct backlight_device *bd;
> >       struct backlight_properties props;
> > +     u32 max_brightness =3D 0;
> >       int ret =3D 0;
> >
> > -     if (!pdata) {
> > -             dev_err(&pdev->dev, "No platform data\n");
> > -             ret =3D -ENXIO;
> > -             goto out;
> > -     }
> > -
> > -     if (pdev->id !=3D AAT2870_ID_BL) {
> > -             dev_err(&pdev->dev, "Invalid device ID, %d\n", pdev->id);
> > -             ret =3D -EINVAL;
> > -             goto out;
> > -     }
> > -
> >       aat2870_bl =3D devm_kzalloc(&pdev->dev,
> >                                 sizeof(struct aat2870_bl_driver_data),
> >                                 GFP_KERNEL);
> > @@ -140,18 +136,18 @@ static int aat2870_bl_probe(struct platform_devic=
e *pdev)
> >
> >       aat2870_bl->bd =3D bd;
> >
> > -     if (pdata->channels > 0)
> > -             aat2870_bl->channels =3D pdata->channels;
> > -     else
> > -             aat2870_bl->channels =3D AAT2870_BL_CH_ALL;
> > +     aat2870_bl->channels =3D AAT2870_BL_CH_ALL;
> > +     device_property_read_u8(&pdev->dev, "skyworks,channels", &aat2870=
_bl->channels);
> >
> > -     if (pdata->max_current > 0)
> > -             aat2870_bl->max_current =3D pdata->max_current;
> > -     else
> > -             aat2870_bl->max_current =3D AAT2870_CURRENT_27_9;
> > +     device_property_read_u32(&pdev->dev, "led-max-microamp", &aat2870=
_bl->max_current);
> > +     aat2870_bl->max_current =3D clamp(aat2870_bl->max_current, AAT287=
0_CURRENT_MIN,
> > +                                     AAT2870_CURRENT_MAX);
> > +     aat2870_bl->max_current /=3D AAT2870_CURRENT_STEP;
> >
> > -     if (pdata->max_brightness > 0)
> > -             bd->props.max_brightness =3D pdata->max_brightness;
> > +     /* If max-brightness property is missing or set to zero, use chip=
's max value */
> > +     device_property_read_u32(&pdev->dev, "max-brightness", &max_brigh=
tness);
> > +     if (max_brightness)
> > +             bd->props.max_brightness =3D max_brightness;
> >       else
> >               bd->props.max_brightness =3D 255;
>
> IIUC max_current can be zero (since AAT2870_CURRENT_MIN <
> AAT2870_CURRENT_STEP). Since that means aat2870_brightness() will
> always return 0 then there might need to be a special case
> max_brightness for this case.
>
>
> > @@ -181,9 +177,16 @@ static void aat2870_bl_remove(struct platform_devi=
ce *pdev)
> >       backlight_update_status(bd);
> >  }
> >
> > +static const struct of_device_id aat2870_bl_match_table[] =3D {
> > +     { .compatible =3D "skyworks,aat2870-backlight" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, aat2870_bl_match_table);
> > +
> >  static struct platform_driver aat2870_bl_driver =3D {
> >       .driver =3D {
> >               .name   =3D "aat2870-backlight",
> > +             .of_match_table =3D aat2870_bl_match_table,
> >       },
> >       .probe          =3D aat2870_bl_probe,
> >       .remove         =3D aat2870_bl_remove,
>
>
> Daniel.
