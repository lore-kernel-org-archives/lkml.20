Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106DB45D901
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043760; cv=pass; b=PS2Op5B5g7W++6Toum9crKuicbVoL6K8h6WWBasrN2bvedb59HwZWiB8EMFMKUZ9Ux4CatHH9tCrpTcPaC4J9SuuyRFVvioSdq349UA+xfdEq3+aZnC6Cg8HE5AOqolOm4CH4oWeJ3Vj2GV32NeMrt+zY3o6T1buNCbZlRCc1YM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043760; c=relaxed/simple;
	bh=3QNl9J8mitkeiSvGDN/UT/SMZ+Mm0hyaBOOHnWAVZKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O1AszUiL5eSIDBjaCWdcs8E93I+nDW48Wqu4lLdoh86xImUFCNMqtqlMOTz4hFRhdMBdIgIkMQjJBo8Nwr2y5flQbW05CVpF3Fp39Jxd8j6db051VyWEGNdWZnjph2r+l5ycGKGB5vImvLDPee+UCSTk/y2Z1CDdcxo+weX8f8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZ2fGCxM; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZ2fGCxM"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-78a338fe106so640371137.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789043758; cv=none;
        d=google.com; s=arc-20260327;
        b=JNB/znrzxijPIP6U7q+zt1ZIRTqBelQdKYwV/PyaRiMBWmM/rT79h/J4H+2GbjawWF
         iXIoYB/mD/r3gKWBylRq71WfJHRF543Pg8i9eBmgdOGrXnor1jcCZvmx2L/wQUC1C2ru
         eL1pMD0nQNFukszk8NWVG4a9YBHOEJcfcduZE2iVfjIzw3ztJkEVEQEMUYVEoSToq/bJ
         1lYRmi7OUqugeK0yui0N+Ne+z8ZwAymDkePogGhmAWOfVzgqgeicf6YJOp4Iq0s6zAJU
         f/pOj8TNermbSZ2EQmQHBMG38X0PiPXk8nRvrXt7C93cKmbLpFaLiEsDjq8RmLA5cOIT
         3ZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=USiUqUD8S/Y9N+JUYgnVXLlnBrLijvaF9UlhS8aFiXQ=;
        fh=RqyS76Nfv4gKK48bNfRSN6tELWJ+yucxq0y+XVOICr4=;
        b=KRGzkP8/tvmueR8yEWRTApZvraeIpF3LxuJhX1qNdMXtPdx7ByNAqtg8bMML51XzV7
         bRRiigCe/u5Xvv2dK0QqfKyYp1pmJUXL0fdIP/mOpdFIILhOOR1MSihkPxVpg9jtYcNY
         8+xUYaHVsyQjWfG0LVDxBPS0zl/7Q1JfuXyta7TknRxpvZBdgqlEoz4UWrnZvArXBdC4
         dc6Ccn1LRDKhvWlJ9YhhT1AtqgrxKj2caOmWQsxzVP/o47Yho/uHODBbx8vJGVITbx13
         Sf1opvmCxdWk9o2gfPNp0gg+ladsdrqUnSomq7FKYu2E0T/OeYRaz8S6jR9plk53KvMM
         9yKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789043758; x=1789648558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=USiUqUD8S/Y9N+JUYgnVXLlnBrLijvaF9UlhS8aFiXQ=;
        b=IZ2fGCxMG/tzUpCg21UbJQ1v3GQ8MTI6ogfhCUOm/FWY8aVIr87l0Zxvz0mgT9nIgs
         UVT0hq1gYBm8+Y5lB1Wp6VKa3wGjAmDtrA9ybEVCC4Rys71SX6kqmyzi8eeHAUsVJCiy
         N+lHW4R3virduKLBjU9dnhvHg3z5qjcYhRbJZhsJ4p8LrHu5XN3mowmLgfX97IlI34lv
         3SYdoKCxqBYJuCRw1JSWYUoW977uRdwUYJ/AJs9NVrLJnraTS3PCAjZm6x9dSY+1jyZG
         Py0wOWoybSh63xl7G9FZU6GEekbI05/f6ZSFmDA5vifcYIa5LW16/62y3+VNYqxzbEJ5
         HhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789043758; x=1789648558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=USiUqUD8S/Y9N+JUYgnVXLlnBrLijvaF9UlhS8aFiXQ=;
        b=CMSsU/4mPz46YuCZNczPxLkVLkj513VMOXorwSqi2YNaoADg+XXHAA+EPLOWh8DWK5
         bnJ85y6qFI6KedV70piUYxBhGpxMIT/xgv+23yUdplRbzvVv+CZFs3k0V701uMY1U2Vw
         W/8AbTxJ50xfLfKjoCN6+G/SAXKv/Bt4Hal5nuRWoubYQq3m5qhHSvr4Lwofw1hbyz7Y
         gU681QmhmPgIsN5HatnEbUH8OhWvVnW+nc0ZbYs4whF6vuAtLKmNBq1Z47P2Jg/vhxjp
         RxqSbFYHg8mZ/dqowqyUJ9yDkSR1dpK/WrfoBNBM3YEqI28VTBu0yeU0oH17PDTasatx
         /PPA==
X-Forwarded-Encrypted: i=1; AKwUvBx3WvehIUvumbzjYVIlXMma5HevnAp9nIcWxXL00qqoivkFz/cSMBBh3L/kZQwC/XsQRU93zmPryOQgYpA=@vger.kernel.org
X-Gm-Message-State: AFuF++m6fjkelHARTqFzEUQ/VNeJfcleSm8fny6r2F90UaKMUV/APD//
	dqCCfC203A7BxrerYPhoGRLuVrf9qMcCeIy5EpAyi5c80d+ky5eiivousAed+4bASTKSwIBFhzu
	vM9GtSrzZ+BhclO8Wl/DqNlP+obHBVmo=
X-Gm-Gg: AYBFou1MGzhl0EX7lOj3iAWMwm1MYz6I5VLzIPLLPxvkJiXBbi6Y5XYVgXhoePZqZoO
	H0sXcAwWmiInAw5yd1WaSbjLP4nz4O/FqPnzxtxQ4G+rg6HhN1RCnZMqpST4AdFKtD4Se6Z9tbp
	CIY5687FZO77UdrjeI2cD5d6XNzZLDNXwfF5ZeLq6G53g+Wd0RnMrIrGxVMwX7KnfS0PEMjWkBL
	nwy0vA6OuaB7wcOE2Fc8ayFkg4V6g4Iq/apuQkVCWCHjbsP7jQcpAJYQtffPZt7wGOHSWauznmd
	ZukSqyI0SOlnmGTj9X+ba0rlyUCeFp14lvgAN7TRFZxmle4pe7M1VqvtMTgIAI8Ud0XREQ==
X-Received: by 2002:a67:eb48:0:b0:791:740b:7ce6 with SMTP id
 ada2fe7eead31-791741bc3bemr534083137.11.1789043753031; Thu, 10 Sep 2026
 05:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-add-tda38740-and-tda38725-v3-0-3e87637da3d6@gmail.com>
 <20260910-add-tda38740-and-tda38725-v3-2-3e87637da3d6@gmail.com> <045b177a-7501-4c73-871e-5d9f78d6bcce@roeck-us.net>
In-Reply-To: <045b177a-7501-4c73-871e-5d9f78d6bcce@roeck-us.net>
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 10 Sep 2026 20:35:41 +0800
X-Gm-Features: AcwNN1XoHSr8FamRmjmrT765YkGEYJIbBi0T4ehpgPPy_ta7um_0KmhY6LlEwRM
Message-ID: <CAPBH0A81ksHcGJPar-rTU+UVfOTxuV_RtSwdV1cuYEdhoWeo_g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon TDA38740/TDA38725
To: Guenter Roeck <linux@roeck-us.net>
Cc: Colin Huang <colin.huang2@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2026=E5=B9=B49=E6=9C=8810=E6=
=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:55=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 9/9/26 23:18, Colin Huang wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add a PMBus driver for Infineon TDA38740 and TDA38725
> > single-voltage synchronous buck regulators.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >   drivers/hwmon/pmbus/Kconfig    |   9 +++
> >   drivers/hwmon/pmbus/Makefile   |   1 +
> >   drivers/hwmon/pmbus/tda38740.c | 150 ++++++++++++++++++++++++++++++++=
+++++++++
>
> Documentation is missing.
>
Hi Guenter,

Thanks for review.

I will prepare Documentation/hwmon/tda38740.rst file for this driver.

> >   3 files changed, 160 insertions(+)
> >
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index bcfdc4ce4c10..e4ca80dd0574 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -763,6 +763,15 @@ config SENSORS_TDA38640_REGULATOR
> >         If you say yes here you get regulator support for Infineon
> >         TDA38640 as regulator.
> >
> > +config SENSORS_TDA38740
> > +     tristate "Infineon TDA38725/TDA38740"
> > +     help
> > +       If you say yes here you get hardware monitoring support for Inf=
ineon
> > +       TDA38725 and TDA38740.
> > +
> > +       This driver can also be built as a module. If so, the module wi=
ll
> > +       be called tda38740.
> > +
> >   config SENSORS_TPS25990
> >       tristate "TI TPS25990"
> >       help
> > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefil=
e
> > index e288fe72a437..eb06d47816fd 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -70,6 +70,7 @@ obj-$(CONFIG_SENSORS_STEF48H28)     +=3D stef48h28.o
> >   obj-$(CONFIG_SENSORS_SQ24860)       +=3D sq24860.o
> >   obj-$(CONFIG_SENSORS_STPDDC60)      +=3D stpddc60.o
> >   obj-$(CONFIG_SENSORS_TDA38640)      +=3D tda38640.o
> > +obj-$(CONFIG_SENSORS_TDA38740)       +=3D tda38740.o
> >   obj-$(CONFIG_SENSORS_TPS25990)      +=3D tps25990.o
> >   obj-$(CONFIG_SENSORS_TPS40422)      +=3D tps40422.o
> >   obj-$(CONFIG_SENSORS_TPS53679)      +=3D tps53679.o
> > diff --git a/drivers/hwmon/pmbus/tda38740.c b/drivers/hwmon/pmbus/tda38=
740.c
> > new file mode 100644
> > index 000000000000..df5173d8da0c
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/tda38740.c
> > @@ -0,0 +1,150 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Hardware monitoring driver for Infineon TDA38725/TDA38740
> > + *
> > + * Copyright (c) 2023 9elements GmbH
> > + *
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/property.h>
> > +#include "pmbus.h"
> > +
> > +#define TDA38740_VOUT_SCALE_DEFAULT_MICRO    1000000
> > +#define TDA38740_VOUT_SCALE_MIN_MICRO                100000
> > +#define TDA38740_VOUT_SCALE_MAX_MICRO                2000000
> > +
> > +struct tda38740_data {
> > +     struct pmbus_driver_info info;
> > +     u32 vout_scale_micro;
> > +};
> > +
> > +static int tda38740_read_word_data(struct i2c_client *client, int page=
,
> > +                                int phase, int reg)
> > +{
> > +     const struct tda38740_data *data;
> > +     int ret;
> > +     u64 scaled;
> > +
> > +     if (reg !=3D PMBUS_READ_VOUT)
> > +             return -ENODATA;
> > +
> > +     ret =3D pmbus_read_word_data(client, page, phase, reg);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     data =3D container_of(pmbus_get_driver_info(client), struct tda38=
740_data,
> > +                         info);
> > +
> > +     scaled =3D (u64)ret * data->vout_scale_micro;
> > +     scaled =3D DIV_ROUND_CLOSEST_ULL(scaled,
> > +                                    TDA38740_VOUT_SCALE_DEFAULT_MICRO)=
;
> > +
>
> The chip supports VOUT_SCALE_LOOP, which should be used for any VOUT scal=
ing.
> VOUT values should not be manipulated manually.
>
> Also, Sashiko is correct in complaining about not scaling other VOUT
> related commands, both on the read and write side. The chip _does_ suppor=
t
> limit commands.

I will remove the code related vout_scale_micro  support.

>
> > +     return clamp_val(scaled, 0, U16_MAX);
> > +}
> > +
> > +/*
> > + * TDA38725/TDA38740 only support Linear format for VOUT related comma=
nds,
> > + * with exponents in the range of -8 to -12 (see datasheet VOUT_MODE
> > + * description). Direct format is not supported by this device.
> > + */
> > +static int tda38740_identify(struct i2c_client *client,
> > +                          struct pmbus_driver_info *info)
> > +{
> > +     int vout_mode;
> > +
> > +     vout_mode =3D pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
> > +     if (vout_mode < 0 || vout_mode =3D=3D 0xff)
> > +             return vout_mode < 0 ? vout_mode : -ENODEV;
> > +
> > +     if ((vout_mode >> 5) !=3D 0)
> > +             return -ENODEV;
> > +
> > +     info->format[PSC_VOLTAGE_OUT] =3D linear;
> > +
> > +     return 0;
> > +}
> > +
> > +static struct pmbus_driver_info tda38740_info =3D {
> > +     .pages =3D 1,
>
> The chips support the PAGE command, described as "Allows access
> of each loop via paging". I don't know what exactly that refers to,
> but it does look like it supports multiple pages.


TDA38725/TDA38740 are 40A/25A "Single-voltage" Synchronous Buck Regulator
It's one page.

> > +     .format[PSC_VOLTAGE_IN] =3D linear,
> > +     .format[PSC_CURRENT_OUT] =3D linear,
> > +     .format[PSC_CURRENT_IN] =3D linear,
> > +     .format[PSC_POWER] =3D linear,
> > +     .format[PSC_TEMPERATURE] =3D linear,
> > +     .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> > +         | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> > +         | PMBUS_HAVE_IIN
> > +         | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> > +         | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> > +         | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
> > +     .identify =3D tda38740_identify,
> > +};
> > +
> > +static int tda38740_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct tda38740_data *data;
> > +     const char *propname;
> > +     u32 vout_scale_micro;
> > +     int ret;
> > +
> > +     data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     propname =3D "infineon,vout-scale-micro";
> > +     if (device_property_present(dev, propname)) {
> > +             ret =3D device_property_read_u32(dev, propname, &vout_sca=
le_micro);
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret,
> > +                                          "%s property read fail.\n",
> > +                                          propname);
> > +     } else {
> > +             vout_scale_micro =3D TDA38740_VOUT_SCALE_DEFAULT_MICRO;
> > +     }
> > +
> > +     if (vout_scale_micro < TDA38740_VOUT_SCALE_MIN_MICRO ||
> > +         vout_scale_micro > TDA38740_VOUT_SCALE_MAX_MICRO)
> > +             return -EINVAL;
> > +
> > +     memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
> > +     data->vout_scale_micro =3D vout_scale_micro;
> > +     data->info.read_word_data =3D tda38740_read_word_data;
> > +
> > +     return pmbus_do_probe(client, &data->info);
> > +}
> > +
> > +static const struct i2c_device_id tda38740_id[] =3D {
> > +     { .name =3D "tda38725"},
> > +     { .name =3D "tda38740"},
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(i2c, tda38740_id);
> > +
> > +static const struct of_device_id __maybe_unused tda38740_of_match[] =
=3D {
> > +     { .compatible =3D "infineon,tda38725"},
> > +     { .compatible =3D "infineon,tda38740"},
> > +     { },
>
> No "," here.
I will remove it.

>
> > +};
> > +MODULE_DEVICE_TABLE(of, tda38740_of_match);
> > +
> > +/* This is the driver that will be inserted */
>
> Pointless comment.
>
I will remove it.

> > +static struct i2c_driver tda38740_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "tda38740",
> > +             .of_match_table =3D of_match_ptr(tda38740_of_match),
> > +     },
> > +     .probe =3D tda38740_probe,
> > +     .id_table =3D tda38740_id,
> > +};
> > +
> > +module_i2c_driver(tda38740_driver);
> > +
> > +MODULE_DESCRIPTION("PMBus driver for Infineon TDA38725/TDA38740");
> > +MODULE_LICENSE("GPL");
> > +MODULE_IMPORT_NS("PMBUS");
> >
>
