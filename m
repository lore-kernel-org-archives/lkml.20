Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793555763;
	b=yMwR8RToMGklbCJzclWqbMW6FIgzTrdCPNUPcEK/U2zZekKRXvhxsbL87ivIAw4em6Ou
	 eSPUrXg4+0aUraM/PzJTUz5KUDuSbK+RUTYy9S30BPNG0nip5Sh5QvfOvu1qtH6SGXi+T
	 TELn53tpDCmeJoYbOonYvwDsbVKmnMqQQ3MgkhTVspDCq1wJsCtNbqtoA9UW/Gta1b09+
	 7vrxlBzW8qBVf9VLr4jc/xX2WlQifU4W20txcHuplFGrysJ7dOZpOpx9i+pF/WR3gQnh3
	 LjN7azmbppICf1CybhJb9AeM374/uor77Q6XE2So1YubGjYbNWnFBhg8tnJzidvq+6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GoX7Xz5wrKL93mBkqFEu2q61WlbNu4zQ74W9jEnyAOI=;
	b=EzxiEc/OTTM6Lgx/3dBwpbs14YBvu2ZEy2G70eBMsxOdu1eCerLTJhhDBSpWODh/uCAu
	 SitsicMRAXOzfFSlpBxShILUd93NoUCcL3US8+rbN+4uN5mzcGoulg993s4CAAADXbNZ7
	 E4PCMlLD4q7VCaGHgRtR+Dy3D8g/0TxjX4Cc7iRFrFXTb9PZNnQPxIBWTUcI/qor9fvGx
	 nmleB5b8mmW5qtBGd6N4m3pJhDCxrXEYBhGvw8kpcoRJ7qMybrX8t9rCXy65wpPGKFkfi
	 HkYWQPoja9cDEsG1IZM9IIj73Wmf/FlGqO2vu8tzHV1gI31WYSLcyzYK4Lg7Usn0J+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xI7Eg+iH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CFA606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3CFA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xI7Eg+iH
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-369f33df08eso4642434eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:56:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793555762; cv=none;
        d=google.com; s=arc-20260327;
        b=Bi4vzV+6RXcgvcwQvzeyY1Avk6sO4ko5IpZtVPLLX59PSN7Y0RbeFBiGR/EGc6OJOo
         iK2G1m6h7FO5k6g1vdmtTDqhQYqOBXD7Lg0LF/mh13Ha3Y2s7Medo8TV3355ufnwBZxf
         N14vIEggjK8wM+3jOoZpaAOA8fC74mdzOd/ervaOKMbD3Ur62eYBLeAMrUZ8JSoPKB7A
         Zer7sxHC572AMvOIUis2XoZK32Xp8SBLOr+/lJPkdZjk5ZELL3ubM1ieAHJY0JQXLOxX
         kIoJzPB1q8mMe8YTaW7IDIfvb/RCwPvkFfJSuJWy/h0pjuquJP7nC/qq8gVPWWyQ8ki/
         eocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GoX7Xz5wrKL93mBkqFEu2q61WlbNu4zQ74W9jEnyAOI=;
        fh=H+TYXQNK3yfJXOJvhPZCQuOl+pwXGvMSfjSqR9Jmzt4=;
        b=eOnusqotypFb5Q8J4f6Drvq31yJRDaLLIocM3Pv6B5GTTBDCogSYSAmw3lxqmDZTOK
         4bT3zExQ+4WlJTj0S3cbay6Web4IX2NMUcdtpewTu6IhvUYs5zYWDmZhBzfHNuVCNvMi
         ln57Xq8f2uyFNhIIDT8LlSMQ/0I+6uGfnchWICbYssaEYrU1K5bT7FVGAYixQTbkGrG8
         6S0uXiQIfZCApvh/Ce9E8/zzdwc4yd71dqQ/Z0swSKSIm/Nl6YDsiEYULAFnjGSGp7JT
         8LmgdfyX2c6JsObtMGsgL8VyCDavQHLu9B2HX5F7ykqGsvyd/gZLla0wyLRPnfFLjuz2
         yRtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793555762; x=1794160562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GoX7Xz5wrKL93mBkqFEu2q61WlbNu4zQ74W9jEnyAOI=;
        b=xI7Eg+iHeR8rPP+5vWDtTL5ybfLa9tfSUe6MjVJlKbjP3y8byZoks27U/XyRJiUKeA
         3APi1BVxzVLn0GiDoMIAt1XFUF4HgOrEIHP8Kg3BqkNBFcgy/B24O2Hdx76f7Xg91Wdp
         6J1oMess/iGYBKKfo7CP9+TpIsQdvaQMxq2aBE7QUFXjJlQgIioX8mL9scGZ8YoRFA2p
         Q+AKFFznQ1GAja7JTHDWBbtuN7P88Bt88vQg9PzQkZs6ZKSu40/nqDfrEWpq4RJ+OEcm
         fA8vuG7ZYRxLFQG2BY8cRbk0MofoQtVbSnrwMBGrUNVFhjz9gO2fJ6xSqZ5A6Pwt5sQn
         wC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555762; x=1794160562;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GoX7Xz5wrKL93mBkqFEu2q61WlbNu4zQ74W9jEnyAOI=;
        b=AeSXx7DcN7Pi9O0zM89yqJLTRvZlFlty47ZJVLhViCakqH1OTWLS6trWCpNdALgl7Z
         ZOriQ1cnaqiO8JgK5y7uQpg5moy3O19v7x16hqnTp8nhStO2CCT0BsZwMtktPtMR5TkU
         UQvlKTmruzSTNZEA7aF/iUCGz19ovdxW2Z8NIk3lW/ZMJlCkhVGfBLsJHtBcvS06XUdP
         i6LobEr/y61+dV5OY0vQKeh2ZVHpGUAEcdgVkKESfDlafqCx7LYD8glIDRLQFGrh7Cs7
         6v1jR3qqhY63y+9lY0XReTXPDnXsDtoB6H/6Lqlz7ZYcQPV+DEorDQrbz1F1GjTpgvjg
         leig==
X-Forwarded-Encrypted: i=1; AKwUvBxok7Q+NtezshWzVwm1tAEAE0SP7lps1StfJJCGuO8F1rPEgOc6fHUIw+aFc2gmoIFbDKHJvWA/JmG6WNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p9AvVLWzFkS+Wtdm/GLG4iZg9Hy2GONBIRi3mhe3Nq46MFbus
	WmB+OW2jj1d0iR8Sdk5nSu/I3Ilgo6Cv3hcPu6sQ8wsax1w8u3V3EDV9ZpfA8ghtCzOXuPhOcxa
	mueNjY5QWaNbhIx12EKc88Ifiwq7niIA=
X-Gm-Gg: AYBFou1Gx3k4yRhrv74WAZrrH6Qg5tf5SWIiM5QXuaYAx/GvLUK+FlUk2Rzi95JYkQj
	R1ORTLO3IHW9/6MEldvS5BJiKRzedsOBqB4pV6otBRKdU/9v+qQgPVZZV9YlN1khl1l3mawYLo8
	3je/B+UR0nsF9EcNKbJPSdUWLcCcRI1dNKQUmSDJwj3VonSVnHoz7lQA9g1+r4fTdmV/OBY/hQ3
	3yghWaUV6xCT5ZtjlUWG4IuBGG0pDpeU6/vb3YvRCspowaF1EUta6Io7HGcfQQX/5I3U0QhjzR9
	Q4uUfsN6+c+DA7YJ4zymrSR08wm1Eu+67ECxrj2OiN3DAXEN2I+iGiU8I3rAImR5BtXhESLCWlY
	6ZVDGeh7cevBTKZctS4DrVpOOvccbmmhOe26T2m1AODrYk7PcLlQCE7sMu0y2Y22yRBdICQ==
X-Received: by 2002:a05:693c:895c:20b0:359:ef9:9be3 with SMTP id
 5a478bee46e88-36a4236a466mr11835005eec.11.1793555761519; Sun, 01 Nov 2026
 09:56:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101141507.119186-1-clamor95@gmail.com> <20261101141507.119186-3-clamor95@gmail.com>
 <20261101174140.4d11fdfc@jic23-hlaptop>
In-Reply-To: <20261101174140.4d11fdfc@jic23-hlaptop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 1 Nov 2026 19:55:49 +0200
X-Gm-Features: AclHuK8EZUIy45_qfYG3a3MB3Ax9bYhjt0WTcJl5ffWhhE8QVM-VmOuMMgRylVc
Message-ID: <CAPVz0n25RR-ayBHuvP8KkrYc22AzHT67=nSEZn=hzRufUJw0zg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] iio: light: ltr501: Add support for the
 LTR-659PS-01 proximity sensor
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Pan Chuang <panchuang@vivo.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Nikita Travkin <nikita@trvn.ru>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 1 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:41=
 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun,  1 Nov 2026 16:15:07 +0200
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Add support for the Lite-On LTR-659PS-01 proximity sensor. This device =
is
> > nearly identical to the LTR-559ALS-01, but omits all elements related t=
o
> > ambient light sensing (Even the regmap is identical, but ALS registers =
are
> > marked as reserved and interactions with them are discouraged).
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Hi Svyatoslav,
>
> Various more general comments on the driver in here. Only real request
> is to not copy the rather ugly existing indentation for new code.
>
> If nothing else comes up in review, I can just tidy that up whilst applyi=
ng.
> For now I'm going to leave this on list to give others time to take a
> look.
>

I can address some of your suggestions in this series. I would like to
send v2 anyway since Sashiko found a few legit places needing a fix.

> Thanks,
>
> Jonathan
>
> > ---
> >  drivers/iio/light/ltr501.c | 58 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >
> > diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> > index 302be2fc314c5..5cc1141322ad5 100644
> > --- a/drivers/iio/light/ltr501.c
> > +++ b/drivers/iio/light/ltr501.c
> > @@ -96,6 +96,7 @@ enum {
> >       ltr329,
> >       ltr501,
> >       ltr559,
> > +     ltr659,
> >  };
> >
> >  struct ltr501_gain {
> > @@ -649,6 +650,26 @@ static const struct iio_chan_spec ltr301_channels[=
] =3D {
> >       IIO_CHAN_SOFT_TIMESTAMP(2),
> >  };
> >
> > +static const struct iio_chan_spec ltr659_channels[] =3D {
> > +     {
> > +             .type =3D IIO_PROXIMITY,
> > +             .address =3D LTR501_PS_DATA,
> > +             .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> > +                                   BIT(IIO_CHAN_INFO_SCALE),
> > +             .scan_index =3D 0,
> > +             .scan_type =3D {
> > +                     .sign =3D 'u',
> > +                     .realbits =3D 11,
> > +                     .storagebits =3D 16,
> > +                     .endianness =3D IIO_CPU,
> > +             },
> > +             .event_spec =3D ltr501_pxs_event_spec,
> > +             .num_event_specs =3D ARRAY_SIZE(ltr501_pxs_event_spec),
> > +             .ext_info =3D ltr501_ext_info,
> > +     },
> > +     IIO_CHAN_SOFT_TIMESTAMP(1),
> > +};
> > +
> >  static int ltr501_read_info_raw(struct ltr501_data *data,
> >                               struct iio_chan_spec const *chan,
> >                               int *val)
> > @@ -1178,6 +1199,12 @@ static struct attribute *ltr301_attributes[] =3D=
 {
> >       NULL
> >  };
> >
> > +static struct attribute *ltr659_attributes[] =3D {
> > +     &iio_dev_attr_in_proximity_scale_available.dev_attr.attr,
> > +     &iio_const_attr_sampling_frequency_available.dev_attr.attr,
> > +     NULL
> > +};
> Not something I'm going to ask for as part of this series, but
> if anyone working with this driver has time it would be good to
> move the available handling over to the read_avail() callback
> and masks.  This is an old driver and so far not been converted
> to that newer infrastructure.
>

This I don't promise, I will see what I can do. Maybe you have a good examp=
le?

> > +
> >  static const struct attribute_group ltr501_attribute_group =3D {
> >       .attrs =3D ltr501_attributes,
> >  };
> > @@ -1186,6 +1213,10 @@ static const struct attribute_group ltr301_attri=
bute_group =3D {
> >       .attrs =3D ltr301_attributes,
> >  };
> >
> > +static const struct attribute_group ltr659_attribute_group =3D {
> > +     .attrs =3D ltr659_attributes,
> > +};
> > +
> >  static const struct iio_info ltr501_info_no_irq =3D {
> >       .read_raw =3D ltr501_read_raw,
> >       .write_raw =3D ltr501_write_raw,
> > @@ -1218,6 +1249,22 @@ static const struct iio_info ltr301_info =3D {
> >       .write_event_config     =3D &ltr501_write_event_config,
> >  };
> >
> > +static const struct iio_info ltr659_info_no_irq =3D {
> > +     .read_raw =3D ltr501_read_raw,
> > +     .write_raw =3D ltr501_write_raw,
> > +     .attrs =3D &ltr659_attribute_group,
> > +};
> > +
> > +static const struct iio_info ltr659_info =3D {
> > +     .read_raw =3D ltr501_read_raw,
> > +     .write_raw =3D ltr501_write_raw,
> > +     .attrs =3D &ltr659_attribute_group,
> > +     .read_event_value       =3D &ltr501_read_event,
> > +     .write_event_value      =3D &ltr501_write_event,
> > +     .read_event_config      =3D &ltr501_read_event_config,
> > +     .write_event_config     =3D &ltr501_write_event_config,
>
> The indenting of the existing structure is weird and could do with a tidy=
 up.
> I'd suggest just dropping any attempt to force alignment.  As is shown
> here, doing that tends to lead to inconsistency over time as a driver
> evolves.
>

This I will address as a separate commit before adding ltr659

> > +};
> > +
> >  static const struct ltr501_chip_info ltr501_chip_info_tbl[] =3D {
> >       [ltr301] =3D {
> >               .partid =3D 0x08,
> > @@ -1283,6 +1330,15 @@ static const struct ltr501_chip_info ltr501_chip=
_info_tbl[] =3D {
> >               .channels =3D ltr501_channels,
> >               .no_channels =3D ARRAY_SIZE(ltr501_channels),
> >       },
>
> Another nice to have but not a request for this series.
> Would be good to move away from handling these as an array with the enum
> value in the firmware tables. That scales badly and runs into NULL check
> problems when we use the generic firmware accessors (which we should real=
ly
> be using here). i2c_get_match_data().  The standard way to do this
> today is to use separate named structures and put pointers to those in th=
e
> tables.
>

This I will address as well.

> > +     [ltr659] =3D {
> > +             .partid =3D 0x09,
> > +             .ps_gain =3D ltr559_ps_gain_tbl,
> > +             .ps_gain_tbl_size =3D ARRAY_SIZE(ltr559_ps_gain_tbl),
> > +             .info =3D &ltr659_info,
> > +             .info_no_irq =3D &ltr659_info_no_irq,
> > +             .channels =3D ltr659_channels,
> > +             .no_channels =3D ARRAY_SIZE(ltr659_channels),
> > +     },
> >  };
> >
> >  static int ltr501_write_contr(struct ltr501_data *data, u8 als_val, u8=
 ps_val)
> > @@ -1635,6 +1691,7 @@ static const struct i2c_device_id ltr501_id[] =3D=
 {
> >       { .name =3D "ltr329", .driver_data =3D ltr329 },
> >       { .name =3D "ltr501", .driver_data =3D ltr501 },
> >       { .name =3D "ltr559", .driver_data =3D ltr559 },
> > +     { .name =3D "ltr659", .driver_data =3D ltr659 },
> >       { }
> >  };
> >  MODULE_DEVICE_TABLE(i2c, ltr501_id);
> > @@ -1645,6 +1702,7 @@ static const struct of_device_id ltr501_of_match[=
] =3D {
> >       { .compatible =3D "liteon,ltr329", },
> >       { .compatible =3D "liteon,ltr501", },
> >       { .compatible =3D "liteon,ltr559", },
> > +     { .compatible =3D "liteon,ltr659", },
> >       { }
> >  };
> >  MODULE_DEVICE_TABLE(of, ltr501_of_match);
>
