Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBA957980F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201185; cv=pass; b=RrF0G8QxjhaMELAH9L2+U390sH1aPx1RFIrt+xnIkUQZ1qhYCBOirvGRlBdzdh1LgTYg3o4LRB6bBneCIllpEJeAl4KhkgmTjaHGGYTvtMJDHeTb7vxUDHmIWTIcCjZI/mF6Dp1oYgLa7TwRv9sOEMPK4wQvwDk9xxzcQlnXmLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201185; c=relaxed/simple;
	bh=AsWbvRuBs6JsB6ieQaz86pXFNDyRQud0rrGGSGlxzuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SG1x+EEhA8NC5KmlhruuXxJuV6azOjLIVdCno981cQR65AoJ3ip1YPc/hZcZPxjl9c+nILowup3DPYpmbbTqS189I2vpt14xNKcEODbcWOIJH9vmlB2zFQq2d/xhtCBJO0bo9FjQW8fLwucpep5yYjNLz/L44TjpDDQybnh6/cE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HS3+hd2L; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HS3+hd2L"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78a5e045187so659633137.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790201180; cv=none;
        d=google.com; s=arc-20260327;
        b=O4fdEr/+cgyVjw6JcySDYkJ043HP5EyqSzqFTnkQSIwYMLalS+3LA+Q0DnYGrly79/
         9SkysWHcCS7FLIF8Bl/AHtL/6a2D80ag5CIxUaI6y2WWprY0g+vJcWMQpooYy1EDFrvt
         bLgyR5rtPYTGsXphaopOYnuH8P0a/n27F3Qr1pq5OQWqZi0k+6bWRM6RKdxGmFXG1KoP
         G7DpBr1PU8Aa8qiOMOlbdDc+dixHIcUDlEObWzMOpNjlUPFgK4jshSl6XvytrqprWwPX
         88YvlH2WYHKwSpL6olR64y5adtDTBqVRQWiGh3TObBKauoSGSlShzbo3xnyPhAYUBKY/
         /lwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3yKK+WuchgTTwdNLrz4OxJ2b7Qi8+fI+db9UtwpFLIo=;
        fh=flID4iix8crt3Ah+CeM6USnVoAbXriJfcdABVEWYLno=;
        b=RNj1QDq+W8Ine0cbOAgyNz3XM8j0C+XqUesqbAPPreQy3PwWLU+EUySBSYHaFHVj5x
         p69SOT1RRMtS3eNT37bnM5W1kNkjvqhiN3GwSYhS1XjZ7pognSB6kpkfl+n4GCG2La7B
         g+AwvmqvokWR4kX3R0ncdEQo6z2zJ/bhfrFDH/G/BsvswLqoj66nF9H8vJCTTDWTcB33
         jKxotToe/qBEnma8MhRV0s0iBNwwSTBN8RjkHfPS7AB96dwTVnFvi7T3fCT+rzmtitlX
         AJe7YiWKz5+3sYYKC/EzbxC0CyHzTljGzgTg4cZzvvOcrggnNjcXSlW37Wey7osxsGYT
         It+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790201180; x=1790805980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3yKK+WuchgTTwdNLrz4OxJ2b7Qi8+fI+db9UtwpFLIo=;
        b=HS3+hd2LNIXxo51Lo08u/4zA+eKjJTYh/z+YZ/iJuZzIVK8UCdK2zz2G3TjboIMapd
         SUVSki8eM7T9Nxd/CABC7JJUIiPKL2XQcyfNAk0ng1IDvdUyebs224vozRCCPgcu4PJg
         OdVCyQIUkpDst0NEMsTutZJB7Te6Eros3gqVOVRoMPV9grBZeD1vx8dJ0hJFoQNDS5nQ
         RF8hwA4H6+RVxsL8a+FAAs9Zm9X8C9P3K0UiKr18rnvl7I3SLa1mbFZ1l5HwijmlynnM
         IBXhigQm+/Tnfn3Dd+O1F1Yxv7tOXw5H8XJawYndPvHbokkPm+54c5J+5y3c4BdEVeku
         Rrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790201180; x=1790805980;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yKK+WuchgTTwdNLrz4OxJ2b7Qi8+fI+db9UtwpFLIo=;
        b=E0t+lODSMhyMpOkaJYPyST39vnKLMsOytGnwzrnFv/FVPTMFMSO/bZrqQgSBnTRXnH
         mdW/q3gLWyg/Qw7cCWiraMJbDFqDxsBN3noZeNzk/9FEOQI8YYWVWyjU/7zQ/3JumheU
         NW6jz8ZxDX4AS4XZC9yam7NFI6FxerxdJTokJPag+dHgqk+mRiDgrmrsoFM8vzAdmQBH
         AueYvVKO9E+u0x/hPGTHaYMdYf3I7iRlQIkTlVFhaa54fDsCsPjCFyko3cLHdCb2aE3Z
         gG47ceRrprL839PGi059rKLiurcy80mRE4EFSdimFXitQG8G0QdqJXiqD2weo5Io9Z9i
         GoSg==
X-Forwarded-Encrypted: i=1; AKwUvBxkoaEI/RsXgABtHqRtxTf12GEbsY+gjjqVMbe9oiLP+35PmrSKgdvSpwVucbN2YRWI9VTrlzjxwfNWNt8=@vger.kernel.org
X-Gm-Message-State: AFuF++nTEg0Fv8FDkT15HeR6W4u9W4jWt9YnUOF9BWV7pcW/EaIDVGhT
	69i24+rzI/RAGBaFfVbzRxcygW8rtJLljcsDFOaTazmIQIr1GnUxMVAVd8pG2OrP+wSNND7gS1A
	VBNm+dseMV5yudf8QwZKNOMkfqVSBINctb19dPjg=
X-Gm-Gg: AYBFou2gwXIKSYwIsewlzooxSbY6taSektYBIKrl3mB/wDjAAnXU59C1GYCrAhRgGOk
	wJpLdL/GYD2BIMnE/ho4F7ZWEtvZC8BKcORIWcvMxzLpb7sQY4czH3PMUtBz4IeBImg1pQx5o+1
	2gS972XhQayieJ1ANibnS0cISFe1rysp/UlArL0g5kZDAqgotAxQIMHS8dH+lrE0mfPeZBHeLGj
	RRweY7xUwCMQ7Sq2TgJGmRu9mWWAy+fObtjYJbBCUlgaGX0UJY1d+uWSPURIcOne8R692C7fyKF
	olkqoCYOXfKq+p9iqsFwUEPLSFQ3lsqHFyTSHKjffwmp830eCB5ylJkrbKfjkGzTUmrinO+SgpQ
	nPT50W7uzJl/YNLbVa5gZ
X-Received: by 2002:a05:6102:61c4:b0:7a7:b6a:b022 with SMTP id
 ada2fe7eead31-7af38bbded1mr142471137.22.1790201179622; Wed, 23 Sep 2026
 15:06:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922112111.1970872-1-morbo@google.com> <202609230033.E3A658F@keescook>
 <CAGG=3QW+N1FoUL2GOLfU=U1Pj-eb_o99Z_Mq76ocrZ29S-NyZg@mail.gmail.com>
In-Reply-To: <CAGG=3QW+N1FoUL2GOLfU=U1Pj-eb_o99Z_Mq76ocrZ29S-NyZg@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Wed, 23 Sep 2026 15:06:03 -0700
X-Gm-Features: AclHuK_fY_1P8WjIOJbnwMFJqwDTCUFnN7YSyMbkDR7oEaQHX-fU05ol8keeeJ8
Message-ID: <CAGG=3QXAoU8cPQHFLDPa7KZGPWMEqS9iLXY2KeBt2us=K6Z6hQ@mail.gmail.com>
Subject: Re: [PATCH] iio: st_sensors: add __counted_by_ptr to struct st_sensor_settings
To: Kees Cook <kees@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:34=E2=80=AFPM Bill Wendling <morbo@google.com> w=
rote:
> On Wed, Sep 23, 2026 at 12:52=E2=80=AFAM Kees Cook <kees@kernel.org> wrot=
e:
> > On Tue, Sep 22, 2026 at 11:21:11AM +0000, Bill Wendling wrote:
> > > Annotate the "ch" pointer member of "struct st_sensor_settings" with =
the
> > > "__counted_by_ptr" attribute. The elements of "ch" are counted by the
> > > "num_ch" member in the same struct.
> > >
> > > All instances of "struct st_sensor_settings" are defined as "static
> > > const" arrays across the ST sensor core drivers. For pressure sensors=
,
> > > "num_ch" is explicitly initialized with the size of the respective
> > > channel array using "ARRAY_SIZE(...)" during static definition.
> >
> > I wanted to understand this so, in drivers/iio/accel/st_accel_core.c:
> >
> > static const struct st_sensor_settings st_accel_sensors_settings[] =3D =
{
> > ...
> >                 .ch =3D (struct iio_chan_spec *)st_accel_12bit_channels=
,
> > ...
> > }
> >
> > static const struct iio_chan_spec st_accel_12bit_channels[] =3D {
> >         ST_SENSORS_LSM_CHANNELS_EXT(IIO_ACCEL,
> >                         BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCAL=
E),
> >                         ST_SENSORS_SCAN_X, 1, IIO_MOD_X, 's', IIO_LE, 1=
2, 16,
> >                         ST_ACCEL_DEFAULT_OUT_X_L_ADDR,
> >                         st_accel_mount_matrix_ext_info),
> >         ...
> >         IIO_CHAN_SOFT_TIMESTAMP(3)
> > };
> >
> > #define IIO_CHAN_SOFT_TIMESTAMP(_si) (struct iio_chan_spec) {          =
 \
> >         .type =3D IIO_TIMESTAMP,                                       =
   \
> >         .channel =3D -1,                                               =
   \
> >         .scan_index =3D _si,                                           =
   \
> >         .scan_type =3D {                                               =
   \
> >                 .sign =3D 's',                                         =
   \
> >                 .realbits =3D 64,                                      =
   \
> >                 .storagebits =3D 64,                                   =
   \
> >         },                                                             =
 \
> > }
> >
> > So .ch is assigned an array of items which looks to end with a terminat=
ion
> > sentinel. And .num_ch is unassigned:
> >
> > $ git grep '\.ch =3D ' drivers/iio/accel/st_accel_core.c | wc -l
> > 16
> > $ git grep '\.num_ch =3D ' drivers/iio/accel/st_accel_core.c | wc -l
> > 0
> >
> > > For accelerometer, gyroscope, and magnetometer sensors, "num_ch" is n=
ot
> > > explicitly initialized (and thus defaults to 0). This is because thos=
e
> > > drivers hardcode the channel count to "ST_SENSORS_NUMBER_ALL_CHANNELS=
"
> > > rather than using "num_ch" from the settings struct.
> >
> > Yeah, checks out:
> >
> > $ git grep '\.ch =3D ' | cut -d: -f1 | sort | uniq -c
> >      16 accel/st_accel_core.c
> >       4 gyro/st_gyro_core.c
> >       5 magnetometer/st_magn_core.c
> >       6 pressure/st_pressure_core.c
> > $ git grep '\.num_ch =3D ' | cut -d: -f1 | sort | uniq -c
> >       6 pressure/st_pressure_core.c
> >
> > Interestingly, the pressure/st_pressure_core.c uses both assigned .num_=
ch
> > _and_ a sentinel.
> >
> > > Since these structures are static const, both "ch" and "num_ch" are
> > > fully initialized at compile time and available immediately at boot
> > > time.  The only accesses to the "ch" field of "st_sensor_settings" oc=
cur
> > > when assigning it to "indio_dev->channels" during device probing.
> >
> > Heh, so the bounds check gets laundered. :) Even pressure:
> >
> > pressure/st_pressure_core.c:    press_data->num_data_channels =3D press=
_data->sensor_settings->num_ch - 1;
> > pressure/st_pressure_core.c:    indio_dev->num_channels =3D press_data-=
>sensor_settings->num_ch;
> >
> > > Because "sensor_settings->ch" is never dereferenced or accessed as an
> > > array, adding the "__counted_by_ptr" annotation does not cause any
> > > runtime panics or false-positive bounds checks under KASAN or UBSAN.
> >
> > I would argue that either __counted_by_ptr has no use here ("accidental=
ly
> > safe because no one dereferences .ch" isn't a great justification)
> > or that the accelerometer, gyroscope, and magnetometer sensors should
> > have their .num_ch assigned correctly so that the "contract" is correct=
,
> > even if nothing does the deref.
> >
> This is all very weird. Below is the full output from CodeMender. It
> might give some insight into this, but perhaps we should just NACK
> this patch?
>
After further review, I'm going to NACK this patch as having no
effect. I think this makes me a real kernel developer now? :-)

NACK: Bill Wendling <morbo@google.com>

-bw
