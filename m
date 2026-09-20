Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E9B35F5E7
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880873; cv=pass; b=s6lbeT1BwD+q8IQZKuqROXelQ7ziA7lFKp3ISQHyhEtAIsk3egDCM6gZ5CXP+kI2bYHsYmqg/GG7n2D2uXF5junBLTch8zo4I/vPXhY3yrwEfZy60H3h5Lte6EbLuEjHMmboW00yZay6ta475TwZNsPOk7rFCi54gmAz87yRfFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880873; c=relaxed/simple;
	bh=QaJj5JYhkBPuDLPQR/gb1zAbQaSADrcpJNx0ES+yagQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ibeoO2hQrChNchtMRY2yjgqmF9LquSDOZyEBE6v79Pvjjnkhb7UHiooBkDdo7y/lmfL7S+vuTOlx2vHCCMeIZLJcn/cqYfIDc4ajFL4bzNw48y2ejFElxwB1FxPE7kUWV2guvHNYDjGAbA5xbwA09RKjGeFsUdJN1T7gYwQq+I8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSQZ/ahk; arc=pass smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSQZ/ahk"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so1338090a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789880864; cv=none;
        d=google.com; s=arc-20260327;
        b=Xh+87OGh9MtFdWgNcxtLYFy7vqF6DigmZziad3heyEEy5Mlilgt9eagA9bJANIHl/W
         0K+JkiQyWYydIuMoWGwOSOm8SDDc8PLCRzhmjujWbyXAJ1f+q3EIwYzdiveQIReCXZnx
         hTDdqeuEiGtVbrYWzOpNuEMSkImML8lvTJ9uffVkfOa17BivPWfe0MzJnVzv/Op/PHO/
         TKylMVhmiAecFgVgGLZ0XaL0xD+mWy+bzAt+y0kPm1x8ZfhkHCpcl4Mb5owmD7kNo0BT
         gY+UN1YoSOtMjZdEjM5a0K1LlnyxfSjEk5780ju4OkrM23LnRGV38CD4818q+GUrpzZR
         j/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U6C9kt+gHXWdJyXge6Vk6ZyaRdfBxhReV3mO2TSEXmQ=;
        fh=i7PmkutD8INUG+m/tCpxNOg2blCoPNWUoukcOThl90w=;
        b=lGdBKbMdNIWbRyxXewx3uFGFkjSTdyhTyV853n8olq4kR9PIt8U16JIm2/gLfHjrqn
         nYBEK9AtJsFzD4vrCeJrh1BtozUJRnQFeLJ8B1EQGPd0ztwyNAgpsF7ETOgPrPk9pkQz
         vubblKU7d7pmvyFjK+cD0SxXym5fIAeilz3a/YgI6QRlDM5cv/UXA3xvUYcPMU0AOtc8
         JsAYZdUTvplLwd3iI3xt5dDGMMwwgqefZT9jet6BvgaYT+Flw7u0Ki8BXJuxaBXrMENh
         QE85Fbzqm/B7LUbWOhjbrPc6YDIiWH946YBiHb+XnRAoK+XYccA+nZP3cwPG9K2DfZH4
         3u0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880864; x=1790485664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U6C9kt+gHXWdJyXge6Vk6ZyaRdfBxhReV3mO2TSEXmQ=;
        b=MSQZ/ahkGI5PglAj1K/ePpDthkOJrViQ+iJOVBl6GHMHbqclXJSXT5ReoXihqau1Tu
         ffuzm6gPjU5kKXxDZUn5lgG7QOEk2kHMA3EPye36YX60uGhTGSzMVYyA079TDqBAR1QT
         E+DIg3kV2BapN0v5j9iET2O/ZdZBdgis+J5vIls8pAZk/y1irjdprfxFDLOHcWSuJRSn
         +rK9Tq6edV1AbFAtKat1s1INg/nWSMOoBkLn71u0198ZNk6YmdpqCa7Ud8quwAZP3gSk
         cjsrEGqwFoU0grOCUrirq6smHlVBZLVPT6c9tPWQR5PqVDT7aZwFHjm4TOpCOLqxVDDT
         U5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880864; x=1790485664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6C9kt+gHXWdJyXge6Vk6ZyaRdfBxhReV3mO2TSEXmQ=;
        b=I8tEmjiXKam+zOiyO9y4Px4z1+Wv3aljNq4xmV/kDTE5wEi0bVm91lhZlurvJcKBBi
         f2y7hmvuNOlZcQMIzkFca3WnflgcpMDjTQUjIbWw5oHlArM+M08iUV/snqNht5RUz3Y5
         FIcKk0+bnaHNQo37g3pMaHmjic71MmAki+WP79KNhAlJQUmwXy4NQzYRBA1RAaQkzJQJ
         iWHewms+hKN2AgKD+qqV5xiL9/9GFWoLSpn3mhqSmgTabrMsrioLMwQgyDo94GmRd3vI
         LBYlSPY4PJk3m8xW252x05vUhhbU3i8yQpjE2h9BwfhnSC32bNVuIeSGKj+eJwH4iSmG
         vEXw==
X-Forwarded-Encrypted: i=1; AKwUvBxaDp2pW/5Ez7i2sk55xmSzJArTMAwhiegC63oIzjZqK7tjD5HEqbTHN0/nWWTGyqep9Jn+kzL8CDlAqNE=@vger.kernel.org
X-Gm-Message-State: AFuF++kcLy+1LFAIqSzFQYmHZGinfSLjeF/HStc5/r8jkRgmxHArDk+O
	a9ewfhSgJYpAAXUby+2puMkWy+lxsvhQCtzmv0lQWwfN5el5PsEVm0zXUBrh324RJQywe23kWb7
	rIvZGYDcGPvYiHQ3SsR4euQb5ipqhfKU=
X-Gm-Gg: AYBFou3Js3eHcrSuTi3GRD+IX3DtMWJPvaHeLD9lZlU5Cj0IwtWO0Lo/anSw4zFCsbu
	S4MiTcpk4sR/qPea5xVt34jDczRIfUFGQBsPz4z9e4nsisGI+vSYNnwtIj34i/0eL67S2X7SGST
	nXu7R6pmUjM4+pGqYyc3RoVh1LTieL4sQS05lmTjawv7KlsEVwi8sLjayPmQIrLBCJDOetgvofn
	029Uws/9FtDOrMf451SQR5Mq3IgxGt7vVxtmfUZ25n3/08KjoxKwmVrekbm3/E+/UXkVEfsOV5/
	zc3YUim3SH017FUJZF7m4B4SJ23M1vw4aza323GHu1tzgQWYQoYW2i1AeLfuALEsUmGj07gfA25
	o8r+mBiqYUZDLYSWXvyksnrZ6RK35y0HzhHoA+aXt
X-Received: by 2002:a05:6a21:6816:b0:3c4:2b8b:e88f with SMTP id
 adf61e73a8af0-3dd8c2aa039mr10246601637.5.1789880863717; Sat, 19 Sep 2026
 22:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789753020.git.kimjinseob88@gmail.com> <c88d0ced0bff5cf29e765cd2c280ce3c10c50988.1789753020.git.kimjinseob88@gmail.com>
 <20260920030352.62526119@jic23-hlaptop> <CALMSewLa+UF6khnZDNC+kPJz7EXx9PtCud75UE28_4sZb6CSsg@mail.gmail.com>
In-Reply-To: <CALMSewLa+UF6khnZDNC+kPJz7EXx9PtCud75UE28_4sZb6CSsg@mail.gmail.com>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sun, 20 Sep 2026 14:07:34 +0900
X-Gm-Features: AcwNN1XuZeiKlusDu9rx3lFcCwS2fu8tJ90eGFmwQpKEH98FniqZCZx2Y61iD3k
Message-ID: <CALMSewLE7OOc1jEUnpd82axp6DZKBxZW5bBMLa03EfjzFuaFdw@mail.gmail.com>
Subject: Re: [PATCH v10 6/8] iio: osf: add IIO devices from capability reports
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andriy.shevchenko@intel.com, linux-kernel@vger.kernel.org, 
	rdunlap@infradead.org, joshua.crofts1@gmail.com, u.kleine-koenig@baylibre.com, 
	julianbraha@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Using an extra lock is one solution I suppose to the risk
> of this racing with the buffer tear down and the problems
> around active_scan_mask being freed. Could you use
>
>     if (iio_device_try_claim_buffer_mode(indio_dev))
>
> and later a release on that to achieve the same result?

I looked into this against the current IIO core and tested the relevant pat=
hs.

iio_device_try_claim_buffer_mode() does hold the IIO mode lock, and
iio_update_buffers() takes the same lock, so it would serialize normal
buffer reconfiguration.

However, the unregister path does not hold that mode lock while
disabling/deactivating the buffers, and that path can free
active_scan_mask. Because the OSF receive path can still have an
admitted buffer push at that point, the mode claim alone does not
appear to provide the same lifetime guarantee as the existing private
lock.

I therefore kept the private lock for now. I also reran the
disable/unregister race coverage with KASAN and lockdep enabled; those
tests pass without diagnostics.

Thanks,

Jinseob

2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 1:20, K=
im Jinseob <kimjinseob88@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> > Using an extra lock is one solution I suppose to the risk
> > of this racing with the buffer tear down and the problems
> > around active_scan_mask being freed. Could you use
> >
> >     if (iio_device_try_claim_buffer_mode(indio_dev))
> >
> > and later a release on that to achieve the same result?
> >
> > Only the ade9000 is doing similar at the moment so would need
> > some testing to make sure no lock inversions occur in general
> > but given you don't take any other locks in here it should be fine.
>
> I think that should be a better fit here. I'll test replacing the
> private buffer lock and active flag with
> iio_device_try_claim_buffer_mode() , iio_device_release_buffer_mode(),
> including the existing buffer disable/unregister race coverage and
> lockdep checks.
>
> If that confirms the expected serialization against buffer
> reconfiguration, I'll use that approach in the next revision.
>
> Thanks,
>
> Jinseob
>
> 2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 11:03=
, Jonathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> >
> > On Sat, 19 Sep 2026 03:24:44 +0900
> > Jinseob Kim <kimjinseob88@gmail.com> wrote:
> >
> > > Register IIO devices from supported capability descriptors and expose
> > > signed raw samples, descriptor scales and software buffers. Keep earl=
y
> > > capabilities owned by the core until UART and supply setup is complet=
e,
> > > and unregister children after the receive producer has stopped.
> > >
> > > Validate nonzero descriptor scales and sample/descriptor equality, le=
ave
> > > discovery open after empty or unsupported inventories, and compare
> > > repeated descriptors independently of order. Fault a bound session if=
 a
> > > descriptor changes meaning, gating cache and buffer publication toget=
her.
> > >
> > > Add initialized active-scan packing and buffer producer quiescence. T=
he
> > > production implementation is now complete; subsequent patches only ad=
d
> > > the existing core and IIO KUnit suites and their build wiring.
> >
> > No need to talk about what other patches do and that a series is functi=
onally
> > complete in a patch. If you want to do it, under the --- so it doesn't =
end
> > up in the git log.
> >
> > >
> > > Assisted-by: LLM
> > > Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
> >
> > A few things inline.  Biggest one is a question (I'm not sure) on
> > whether you can use a claim on buffered mode (which will hold it in tha=
t
> > if it succeeds until released) is sufficient to replace the extra lock =
you
> > have to block that transition.
> >
> > Thanks,
> >
> > Jonathan
> >
> >
> >
> > > diff --git a/drivers/iio/opensensorfusion/osf_iio.c b/drivers/iio/ope=
nsensorfusion/osf_iio.c
> > > new file mode 100644
> > > index 000000000000..f4011b8fae14
> > > --- /dev/null
> > > +++ b/drivers/iio/opensensorfusion/osf_iio.c
> > ...
> >
> > > +
> > > +struct osf_iio_scan_3axis {
> > > +     s32 values[3];
> > > +     u32 padding;
> > No needed unless you explicitly write into padding for some reason.
> > C rules add it anyway and then we don't need to make sure it remains
> > correct if this structure changes in future.
> > > +     aligned_s64 timestamp;
> > > +};
> > > +
> > > +struct osf_iio_scan_1axis {
> > > +     s32 value;
> > > +     u32 padding;
> > As above, unneeded.
> > > +     aligned_s64 timestamp;
> > > +};
> >
> > Given I think these are only used in one place, moving them to there wo=
uld
> > avoid need for named structure types.
> >
> > > +
> > > +#define OSF_MOD_CHAN(_type, _mod, _idx)                             =
 \
> > > +     {                                                              =
 \
> > > +             .type =3D (_type),                                     =
   \
> > > +             .modified =3D 1,                                       =
   \
> > > +             .channel2 =3D (_mod),                                  =
   \
> > > +             .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),        =
   \
> > > +             .info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),=
   \
> > > +             .scan_index =3D (_idx),                                =
   \
> > > +             .scan_type =3D {                                       =
   \
> > > +                     .sign =3D 's',                                 =
   \
> > > +                     .realbits =3D 32,                              =
   \
> > > +                     .storagebits =3D 32,                           =
   \
> > > +                     .endianness =3D IIO_CPU,                       =
   \
> > > +             },                                                     =
 \
> > > +     }
> > > +
> > > +#define OSF_CHAN(_type, _idx)                                       =
 \
> >
> > Given this is not much used, you could use the IIO_NO_MOD modifier as a=
 gate
> > on setting .modified =3D (_mod !=3D IIO_NO_MOD) ? 1 : 0,
> > and have just one macro.
> >
> > > +     {                                                              =
 \
> > > +             .type =3D (_type),                                     =
   \
> > > +             .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),        =
   \
> > > +             .info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),=
   \
> > > +             .scan_index =3D (_idx),                                =
   \
> > > +             .scan_type =3D {                                       =
   \
> > > +                     .sign =3D 's',                                 =
   \
> > > +                     .realbits =3D 32,                              =
   \
> > > +                     .storagebits =3D 32,                           =
   \
> > > +                     .endianness =3D IIO_CPU,                       =
   \
> > > +             },                                                     =
 \
> > > +     }
> > > +
> > > +static const struct iio_chan_spec osf_accel_channels[] =3D {
> > > +     OSF_MOD_CHAN(IIO_ACCEL, IIO_MOD_X, 0),
> > > +     OSF_MOD_CHAN(IIO_ACCEL, IIO_MOD_Y, 1),
> > > +     OSF_MOD_CHAN(IIO_ACCEL, IIO_MOD_Z, 2),
> > > +     IIO_CHAN_SOFT_TIMESTAMP(3),
> > > +};
> > > +
> > > +static const struct iio_chan_spec osf_gyro_channels[] =3D {
> > > +     OSF_MOD_CHAN(IIO_ANGL_VEL, IIO_MOD_X, 0),
> > > +     OSF_MOD_CHAN(IIO_ANGL_VEL, IIO_MOD_Y, 1),
> > > +     OSF_MOD_CHAN(IIO_ANGL_VEL, IIO_MOD_Z, 2),
> > > +     IIO_CHAN_SOFT_TIMESTAMP(3),
> > > +};
> > > +
> > > +static const struct iio_chan_spec osf_mag_channels[] =3D {
> > > +     OSF_MOD_CHAN(IIO_MAGN, IIO_MOD_X, 0),
> > > +     OSF_MOD_CHAN(IIO_MAGN, IIO_MOD_Y, 1),
> > > +     OSF_MOD_CHAN(IIO_MAGN, IIO_MOD_Z, 2),
> > > +     IIO_CHAN_SOFT_TIMESTAMP(3),
> > > +};
> > > +
> > > +static const struct iio_chan_spec osf_temp_channels[] =3D {
> > > +     OSF_CHAN(IIO_TEMP, 0),
> > > +     IIO_CHAN_SOFT_TIMESTAMP(1),
> > > +};
> > > +
> > > +static const struct osf_iio_sensor_spec osf_iio_sensor_specs[] =3D {
> > > +     {
> > > +             .sensor_type =3D OSF_SENSOR_ACCELEROMETER,
> > > +             .channel_count =3D 3,
> > > +             .name =3D "osf-accel",
> > > +             .channels =3D osf_accel_channels,
> > > +             .num_channels =3D ARRAY_SIZE(osf_accel_channels),
> > > +     },
> > > +     {
> > > +             .sensor_type =3D OSF_SENSOR_GYROSCOPE,
> > > +             .channel_count =3D 3,
> > > +             .name =3D "osf-gyro",
> > > +             .channels =3D osf_gyro_channels,
> > > +             .num_channels =3D ARRAY_SIZE(osf_gyro_channels),
> > > +     },
> > > +     {
> > > +             .sensor_type =3D OSF_SENSOR_MAGNETOMETER,
> > > +             .channel_count =3D 3,
> > > +             .name =3D "osf-magn",
> > > +             .channels =3D osf_mag_channels,
> > > +             .num_channels =3D ARRAY_SIZE(osf_mag_channels),
> > > +     },
> > > +     {
> > > +             .sensor_type =3D OSF_SENSOR_TEMPERATURE,
> > > +             .channel_count =3D 1,
> > > +             .name =3D "osf-temp",
> > > +             .channels =3D osf_temp_channels,
> > > +             .num_channels =3D ARRAY_SIZE(osf_temp_channels),
> > > +     },
> > > +};
> > > +
> > > +static const struct osf_iio_sensor_spec *
> > > +osf_iio_find_sensor_spec(u16 sensor_type, u16 channel_count)
> > > +{
> > > +     for (unsigned int i =3D 0; i < ARRAY_SIZE(osf_iio_sensor_specs)=
; i++) {
> > > +             if (osf_iio_sensor_specs[i].sensor_type =3D=3D sensor_t=
ype &&
> > > +                 osf_iio_sensor_specs[i].channel_count =3D=3D channe=
l_count)
> > > +                     return &osf_iio_sensor_specs[i];
> > > +     }
> > > +
> > > +     return NULL;
> > > +}
> > > +
> > > +bool osf_iio_sensor_supported(u16 sensor_type, u16 channel_count)
> > > +{
> > > +     if (osf_iio_find_sensor_spec(sensor_type, channel_count))
> > > +             return true;
> > > +
> > > +     return false
> >
> >         return osf_iio_find_sensor_spec(sensor_type, channel_count) !=
=3D NULL;
> >
> > > +}
> >
> > > +
> > > +static int osf_iio_buffer_postenable(struct iio_dev *indio_dev)
> > > +{
> > > +     struct osf_iio_state *state =3D iio_priv(indio_dev);
> > > +
> > > +     guard(mutex)(&state->buffer_lock);
> >
> > These transistions are already guarded by the core, so see the question=
 later
> > on whether you can just claim buffered mode in the data handler
> > to avoid the need for this. That might not work but the way you did
> > this got me thinking about a more general solution to the problem.
> >
> > > +     state->buffer_active =3D true;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int osf_iio_buffer_predisable(struct iio_dev *indio_dev)
> > > +{
> > > +     struct osf_iio_state *state =3D iio_priv(indio_dev);
> > > +
> > > +     /* Wait for the current push before the IIO core changes its bu=
ffers. */
> > > +     guard(mutex)(&state->buffer_lock);
> > > +     state->buffer_active =3D false;
> > > +
> > > +     return 0;
> > > +}
> >
> >
> > > +
> > > +int osf_iio_push_sample(struct iio_dev *indio_dev, const s32 *values=
,
> > > +                     u16 channel_count)
> > > +{
> > > +     struct osf_iio_state *state =3D iio_priv(indio_dev);
> > > +     s64 timestamp;
> > > +
> > > +     if (channel_count !=3D state->spec->channel_count)
> > > +             return -EPROTO;
> > > +
> > > +     guard(mutex)(&state->buffer_lock);
> >
> > Using an extra lock is one solution I suppose to the risk
> > of this racing with the buffer tear down and the problems
> > around active_scan_mask being freed. Could you use
> >
> >         if (iio_device_try_claim_buffer_mode(indio_dev))
> > and later a release on that to achieve the same result?
> >
> > Only the ade9000 is doing similar at the moment so would need
> > some testing to make sure no lock inversions occur in general
> > but given you don't take any other locks in here it should be fine.
> >
> >
> > > +     if (!state->buffer_active || !iio_buffer_enabled(indio_dev))
> > > +             return 0;
> > > +
> > > +     timestamp =3D iio_get_time_ns(indio_dev);
> > > +
> > > +     switch (channel_count) {
> > > +     case 1: {
> > > +             struct osf_iio_scan_1axis scan =3D {
> > > +                     .value =3D values[0],
> > > +             };
> > As suggested above, this structure type is only used locally here. So
> > make the definition local as well.
> >                 struct {
> >                         s32 value;
> >                         aligned_s64 timestamp;
> >                 } scan =3D { };
> >
> > > +
> > > +             return iio_push_to_buffers_with_ts(indio_dev, &scan,
> > > +                                                sizeof(scan), timest=
amp);
> > > +     }
> > > +     case 3: {
> > > +             struct osf_iio_scan_3axis scan =3D {
> > > +                     .values =3D { },
> >
> > Setting values doesn't add anything useful as =3D { }
> > zeros the whole structure (including any holes - they kernel is
> > built with specific compiler options to ensure that last bit
> > as it wasn't required in older c specs).
> >
> > > +             };
> > > +             unsigned int channel, index =3D 0;
> >
> > Please split declarations that assign and ones that don't on to separat=
e lines.
> > Ends up a little more readable.
> >                 unsigned int index =3D 0;
> >                 unsigned int channel;
> >
> > > +
> > > +             /* Pack the active channels; unused storage remains ini=
tialized. */
> > > +             for_each_set_bit(channel, indio_dev->active_scan_mask, =
channel_count)
> > > +                     scan.values[index++] =3D values[channel];
> > > +
> > > +             return iio_push_to_buffers_with_ts(indio_dev, &scan,
> > > +                                                sizeof(scan), timest=
amp);
> > > +     }
> > > +     default:
> > > +             return -EPROTO;
> > > +     }
> > > +}
> >
> > > diff --git a/drivers/iio/opensensorfusion/osf_serdev.c b/drivers/iio/=
opensensorfusion/osf_serdev.c
> > > index 8a747c01ff9d..3d5e90d83967 100644
> > > --- a/drivers/iio/opensensorfusion/osf_serdev.c
> > > +++ b/drivers/iio/opensensorfusion/osf_serdev.c
> > > @@ -23,7 +23,7 @@ struct osf_serdev {
> > >       bool vcc_enabled;
> > >       struct osf_device osf;
> > >       struct osf_stream stream;
> > > -     /* Protects the parser and all RX counters. */
> > > +     /* Protects the parser, all RX counters, and the registration g=
ate. */
> > >       struct mutex rx_lock;
> >
> > Just name it 'lock' given it has scope beyond rx.  Do that in earlier p=
atch
> > though rather than changing it here.
> >
> > >  };
> >
> > >
> > > @@ -139,5 +144,5 @@ static struct serdev_device_driver osf_serdev_dri=
ver =3D {
> > >  };
> > >  module_serdev_device_driver(osf_serdev_driver);
> > >
> > > -MODULE_DESCRIPTION("Open Sensor Fusion UART receiver");
> > > +MODULE_DESCRIPTION("Open Sensor Fusion IIO driver");
> >
> > Just have that being slightly missleading in earlier patch to reduce ch=
urn here.
> >
> > >  MODULE_LICENSE("GPL");
> >
