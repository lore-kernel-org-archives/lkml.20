Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794336080;
	b=M621Wer1R3DfE5lWqq2+Qev56N+48p094o/vtHo0Li9d35lRbOuOWkkWQIicO9Dxtc/i
	 pggu+j1pcLgrZduOe24o/YIi8sICNmMggwMsQppkWftRQ/aOhoDjA60Jn6qQzdHfPUXu4
	 qXETffG8mN0GA971WAfmunr3wrSvDFBq7hTxEQp0ujjhw4jU8eSOKNvAJHIGI37AeuPq3
	 tml5kNEpzap5jsu4a4NKzuUC/H+jw63jhqjMwFccc4GkC0QkrmTHrkwP1xy6rb+r+9jlQ
	 3IebFnIFCu5/vnKTbZZWS8vHxNJ5y4AXFV1PeZ4GZPN4J45dmz8bKP9l/PCQw5Hb53Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=av4ENrPPV1tGMkw5tLRd7+RJ2zUb0Iw82xvXCZIZOuU=;
	b=SXS11ZgdWqER0//ESS26rm4kaI9civAYqIOaXdjxgyS/WzKL3d8zMmvvDwejfISWorWp
	 VkQ/dALxDuV5LPRRhL5rnz5MLh+4+y7TzXaoLJNEDfat8IunVQ2JSBvbpQOZAHP9gBOn7
	 zZmNyW+TZTjQ6Lk5TZbb8D5TybvKFGKLEArWojksiUJfJ9z8hP+IjeoHZ2u14zAAZroSN
	 gMu0Hag2bSvxgs+ZjjT5e647Hvz7KyMkRYL1DfuUx3LAEEF+LQ6ea3mDuNgnCwvUv/PmI
	 mMbye0HUN/AWHvq0nssYNIQXAbbPHk/6JbvyWH9OxGlushmByY3ehE2cUNYI2k1PSDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DtcS/EXD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75C660A6F45
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A75C660A6F45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DtcS/EXD
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso18762145e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794336078; cv=none;
        d=google.com; s=arc-20260327;
        b=p21dDgM48IXCUBYs5nQo03V3jZJ8jUhZnjzfRM6DavuqGTwdqtIkFr5UT+xCM1YPka
         yneoUvT3FEQPR5ct+ZgpM2u/Kbib20ITsUdKn28PivgjaO/JQ3+KAhvI/BSeig6/MGRm
         Mh4Os7fmedmMiIzRsTZD3ArtgFv5lUdfXzPxqLgTHSik5uZwywRovcpIe4dLulX7b+4z
         D0lLrK48yakS6FvIHIgiBqvpo7uy4ClL3EcDMIAREkWOUvNywKd9WwnPAGr0pDOB+q8H
         G7l8CA9HHjn+xfu6/0BgYhEQ7jTf60Xlv763hqK/KiWDBcjlWYTT6R/dQz0N9Ikgk+w8
         tcHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=av4ENrPPV1tGMkw5tLRd7+RJ2zUb0Iw82xvXCZIZOuU=;
        fh=3/d5bOcCLwNLg+uKAvlaKd9WrImelHRdGjVicTPjzKs=;
        b=L1Cr3MjdtwF9EoJQ4O8HL8YQ7DDH7anKqXaiiOx8MWPBSQMoUJxDWEPszzOzyJGlax
         Hcc388v1C+WiTkdT5n/G8oqeATiw7PRXSQI9mjYyrz9/r0fMdlFofPaOfzP2MsA7yKH2
         g5Mm1FQnGQU7naNgmHMV+m70RupDgwY0CE3zjb1cohJRSqAaobLQ97seMoxaXkMmP5te
         bdOZRtppV/quLvmSyq/62JBI4K0Ksr/8G/UOIX0rb3R3Sw0Q15YAu9LEqBV0C+6/+qfd
         ngBFlKu3xgL1r9/ZE1xEmTKgSg0VKFl2O/V7c8/KGwWm21DEkpHO08IwJYGkMdfRCumE
         HxNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336078; x=1794940878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=av4ENrPPV1tGMkw5tLRd7+RJ2zUb0Iw82xvXCZIZOuU=;
        b=DtcS/EXD9Ce+96Ky5V6gDgJEKfa8GTqySzpgPBqvf+DY8iFoulGaFbygjpNNvjG/jX
         CFeUtcWzvnPfCOu1H5kobRE8nwug+xDTEUERU4B6M59NUgrJ1evjNpEeDcVAbesU4Uyj
         hlrjUAthBeVRD8Qb4uzBlnjokI7iy/1e3Fyuye2yUNSt8i2CB4Z4gvMul/+ZeO/bUv8K
         QVZxdvamx3o4dwIWpG9m4m3Xpj6vC+K3wGn1eTjpjB0N5qY531tLbw9bNgZtJDU8qDCV
         jcfFyWlXhJQqIjO7bo+Ch/eZCNRN6Ln++xQ4tvg6vvBN7qtKqydo1aEMqufS9zaCxXtG
         94Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336078; x=1794940878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=av4ENrPPV1tGMkw5tLRd7+RJ2zUb0Iw82xvXCZIZOuU=;
        b=wOOWWyy7Vg8f90R2NyaBsoFMbAOTij5l4RCCFxiz0CLL/kYmBdLikwlnOb4mVkA9nr
         Wr/bISliTCPvLQpECxM1c27ZbCPONGUDSeBX83y+tg78D65e2jHUwWboOK+y8y5xjwM4
         wTTfMUEjxzMYLFaSbIQvB8dvyZMJOY6SECR71YQHy1ogIAASpoHMBt2ZXbWCW+wlmN84
         YYX/wBQgCajrBGv1DwcUBBUl04eJzhc6rtkF5MVdKud1goqYhYL/42LEXJLmrZ/ZWEdZ
         Wf73dOEfb4ACgDJEHPLGD4E5MjWsBR/oHYA52O+mfXn58pN4Wn9HSNPO+NzyH5NkIyQo
         Ni2g==
X-Forwarded-Encrypted: i=1; AL+hErGg7LZmE9/cOSRSqfZ0OYBqHC3+V6tNJSF0PAARP5KB9Tzk0auYX6UbjomDWfPxR2xJI8q5uxYeMnKr9Ns=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S3ducTmcQigSZ+git3aXYX9eKoSRyMgF4tqjGPN4GMH6DSxlj
	HXdiOS0WvjmkumCqEpE25ne8hFFSVkh4OMhUguo8dfqR6P2kGRQ0Yt3b5Udt9v7ZANCyMZ2aH1r
	10+u5tS/BEzSSDAN2AYoHE1K1WzDNQYE=
X-Gm-Gg: AYBFou0KnsMMkKWc35TxpJ0vBnY4Jd5RjwajHkT4jOQEP48Z/i3xNE0ul0n/tJLZ2JS
	S6ejj8N7Y+NAOkkXSpXJ6TkyIBd1z+vRsjUdI0i7Smtgx5/WBGD0KkpM5rEG1ao+jv+DHewirTV
	tB8f7aOQl2QmDnmGM/dy8XVGSxadlhUy1oVvEhVZhVpxD6WZZ/NTBSGhITC7pB9ALmyzewYvaaA
	F8UkDvmsWBoaYbSRupQSTZiVTFqG0MUT4DaZ+bqsFszAc1DxFZCAqirT3x5w31hJfMJp4fD43pV
	Tikva/D7LU+PkVP+UHxyOYaJPI/heBVZCcGgrnplCv00irMmyIG8C1BWRkcdNtWYeX76sa32G8l
	jJht3p4u2nwKp5QtALkRiYn+FG30sPRAYGH2KA9n9Nd2ZZCX/9pIzI0XMGTPXXf/SyARe1Jyc
X-Received: by 2002:a05:600c:4e41:b0:4b7:6942:39be with SMTP id
 5b1f17b1804b1-4ba0234ed60mr59966285e9.24.1794336077840; Tue, 10 Nov 2026
 10:41:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106074639.452630-1-nikitash.mariiaw@gmail.com>
 <cd073632-0919-4015-8daf-39cfe24391e8@kernel.org> <20261110135444.7d8070ec@pumpkin>
In-Reply-To: <20261110135444.7d8070ec@pumpkin>
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Date: Tue, 10 Nov 2026 10:41:06 -0800
X-Gm-Features: AclHuK9_7M2m4zG_NQ4qW5SK5DvtnSnNqDvZRn6nCgKPOE6JXbdQL3_rS3KQX_Y
Message-ID: <CAPDEY+X=pVsiY5cib8e_Vu3KNW0QNV6hXF+GSLs9gyD8rMXa6w@mail.gmail.com>
Subject: Re: [PATCH] media: radio: Replace strlcat() with seq_buf in TEA drivers
To: David Laight <david.laight.linux@gmail.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, hverkuil@kernel.org, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kees@kernel.org, justinstitt@google.com, 
	morbo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 5:54=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Tue, 10 Nov 2026 11:08:30 +0100
> Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>
> > On 06/11/2026 08:46, Mariia Nikitash wrote:
> > > In preparation for removing the deprecated strlcat() API[1],
> > > replace the strscpy() and strlcat() calls used to construct
> > > V4L2 card names in the TEA5777 and TEA575x radio drivers.
> > >
> > > seq_buf tracks the current write position and remaining capacity
> > > across appends, avoiding repeated scans of the destination buffer.
> > > This preserves the resulting strings, including truncation behavior.
> > >
> > > Link: https://github.com/KSPP/linux/issues/370 [1]
> > > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> >
> > Nacked-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> >

Hi,



> > This is silly. Just use scnprintf().
>
> Or wait for someone to add a call that just does what is needed.
> In this case the first stscpy() returns the length (and it is often
> known).
> So you could have:
>         len =3D strscpy(buf, tea->card[, buflen]);
>         len =3D strscpy_at(buf, len, " TEA5777"[, buflen]);
> or:
>         len =3D strscat(buf, buflen, tea->card, " TEA5777", ....);
> or some variant that will do a strnlen(buf, buflen) to get the offset.
>
> But it really is best to leave the strlcat() calls in there for now.
>

Thanks Hans and David for the feedback.

I agree that seq_buf is too complex here. I'll look into using
scnprintf() as Hans suggested.

David, I also see your point about leaving strlcat() in place until a
more suitable append helper is available. I'll revisit the approach
before deciding on a v2.


Best,
Mariia

> David
>
> >
> > Regards,
> >
> >       Hans
> >
> > > ---
> > >  drivers/media/radio/radio-tea5777.c | 10 ++++++++--
> > >  drivers/media/radio/tea575x.c       | 10 ++++++++--
> > >  2 files changed, 16 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/radio/radio-tea5777.c b/drivers/media/radi=
o/radio-tea5777.c
> > > index fb9de7bbcd19..2b1c7f6ddd60 100644
> > > --- a/drivers/media/radio/radio-tea5777.c
> > > +++ b/drivers/media/radio/radio-tea5777.c
> > > @@ -13,6 +13,7 @@
> > >  #include <linux/init.h>
> > >  #include <linux/module.h>
> > >  #include <linux/sched.h>
> > > +#include <linux/seq_buf.h>
> > >  #include <linux/slab.h>
> > >  #include <media/v4l2-device.h>
> > >  #include <media/v4l2-dev.h>
> > > @@ -255,10 +256,15 @@ static int vidioc_querycap(struct file *file, v=
oid  *priv,
> > >                                     struct v4l2_capability *v)
> > >  {
> > >     struct radio_tea5777 *tea =3D video_drvdata(file);
> > > +   struct seq_buf s;
> > >
> > >     strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> > > -   strscpy(v->card, tea->card, sizeof(v->card));
> > > -   strlcat(v->card, " TEA5777", sizeof(v->card));
> > > +
> > > +   seq_buf_init(&s, (char *)v->card, sizeof(v->card));
> > > +   seq_buf_puts(&s, (const char *)tea->card);
> > > +   seq_buf_puts(&s, " TEA5777");
> > > +   seq_buf_terminate(&s);
> > > +
> > >     strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
> > >     return 0;
> > >  }
> > > diff --git a/drivers/media/radio/tea575x.c b/drivers/media/radio/tea5=
75x.c
> > > index c37315226c42..e49228eb7c46 100644
> > > --- a/drivers/media/radio/tea575x.c
> > > +++ b/drivers/media/radio/tea575x.c
> > > @@ -9,6 +9,7 @@
> > >  #include <linux/module.h>
> > >  #include <linux/init.h>
> > >  #include <linux/slab.h>
> > > +#include <linux/seq_buf.h>
> > >  #include <linux/sched.h>
> > >  #include <asm/io.h>
> > >  #include <media/v4l2-device.h>
> > > @@ -221,10 +222,15 @@ static int vidioc_querycap(struct file *file, v=
oid  *priv,
> > >                                     struct v4l2_capability *v)
> > >  {
> > >     struct snd_tea575x *tea =3D video_drvdata(file);
> > > +   struct seq_buf s;
> > >
> > >     strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> > > -   strscpy(v->card, tea->card, sizeof(v->card));
> > > -   strlcat(v->card, tea->tea5759 ? " TEA5759" : " TEA5757", sizeof(v=
->card));
> > > +
> > > +   seq_buf_init(&s, (char *)v->card, sizeof(v->card));
> > > +   seq_buf_puts(&s, (const char *)tea->card);
> > > +   seq_buf_puts(&s, tea->tea5759 ? " TEA5759" : " TEA5757");
> > > +   seq_buf_terminate(&s);
> > > +
> > >     strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
> > >     return 0;
> > >  }
> >
> >
>
