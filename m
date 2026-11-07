Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794025926;
	b=fMnYhvXtnvBG/X+jXnOkVq8YfqS2ubjfHBv63RG7j7psCgkiLk5jH3FTn1BWfxyLesLv
	 ykkXAWNYNhITDLEVRpAXXXzPPb7W/MqZ1HftmFwmKmK4t3r2kOViVTIHSNoftBxXBuzgy
	 nAgmdwOapzZiH8gj/fLzixGpOTjZKKeDiwOUSUmKx9Noq9VySDcRlehFgugin5DKdDeco
	 XK19l5hETuiHjH6mwjG+fxfOuikpsi/g+uteHraw3Yeo7wMLcyyZwyC8ryXrC+wnzR8Xx
	 I7Ml0XBMUcIRfxpoO5bz0CzR0MxAVMYhwp/QFy7k4zVSYJ768tnnPb4W33dSPF2IAvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UXb4T+4yF65d01rXW8bhdUP5pOZHT/ojuN1hL7c/AAM=;
	b=v3ByReLkev5nHwTSL1ohLeNY25PTdxp69YDcrmwwtjHG5TvNB1P6dXI0XHzZMimsfCFU
	 Q6wccPj6JgObZ+5xLtNuDEfdzhZiv1xdlrONkyaJ3FgEP7Z4OzHmkZxeYMiK2/B08KSg3
	 K13BtJBtOZDbu6+UIMZ12O8DQC6mAOaszUrEzeIEiu3CTgKBnZ6iXJB+ksP6tjqngUgUO
	 7JXYvqndANQkhY23lv54sY4mY91MM2NEXpQnVAvkhJbJnVkoUc3UXO2cnGc/k6+65lGgZ
	 XO4fuFNKeUMPOX8wGEC9UdrtMWNXNNcL0OlZhXX0CFjL/9PXZMwZSKm9Vgi/lEx+UNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lhTcNhgU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAE3606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CAE3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lhTcNhgU
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49465892f7bso52055f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:32:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794025924; cv=none;
        d=google.com; s=arc-20260327;
        b=ZwQ39YIkjBn9G4WbaYWOHnHicg9DxY8tqH9nj4t0Qe+/d1LHfmuIRN/t8JDVea7vj4
         Hz7FQgvdCs0Ak8Irf10uHAsVikxf15+u2fWXkNnqmnzbJwpw6LxxHaOkVTaIKnizGfAA
         iA2+bl0AqYiVo1XZ6uqbwj617Q+Bh7Heb1Zt9f5yyfGmHt3Gu5821P2bzEQgQM4GRDEX
         ZUy+gIPfe0iYQ8Yoq3PULdQ3n5gfhanBZOpkFtlpQhDuRV4AhI2gneEInrdGHiFkmnEM
         TURls1Y8N4/ZtUBrWAWUYXHEmvurLhnxbUKO3EL4kHJ2+ZPlJMOmj2M/v999PJeRjQxE
         rjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UXb4T+4yF65d01rXW8bhdUP5pOZHT/ojuN1hL7c/AAM=;
        fh=NC81sgm7qrZ3G+ekBuW5H/m6e1wq92Jc0q1inBkkN3o=;
        b=ViG4aDa2nw/TRIJP0TRfb83txhgdnDitQZzvGtvtFK0l9jQaYugfJDJCJeq/g3xDgc
         DVTxu1fqqQLIea0/EgTYLTbvPQ81hMf+ItMDlc/aCc1hV5G4r/YNIWHIjwzofyX0eCNT
         RkcYMWHDl6UZ+CmM6OqQAdjum2Es4PKG1/Wu3iLAzs68Jrn4y2dT7rvg/GKNfdfe+elm
         tJbDBJDwzEiH9BWQlx3CjtuIvwTEa6g3z7cOHs5CEIchMhOyEqeoADEyzE4C1XBIqqPF
         tfaF+GU0o1U9PrMW1P6qthMJ1BGWQazw6JwcZ0xYGyLZKED9Ly65foWn9qB7nk1SM82W
         2vRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794025924; x=1794630724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UXb4T+4yF65d01rXW8bhdUP5pOZHT/ojuN1hL7c/AAM=;
        b=lhTcNhgUGZGmJscgsQiceRcIbM98qm6Vd0daoPOmsUQVvGAQgB06t4miVd5d7husrA
         ZbCUcz2UrGZeDVRNgZsY/UON1EO3fd5xoug0eFrej8XtNl+VGBszzcyA1t7K7G1nQm/i
         rE/5xon8hFZUYlMs+wL17SN1xbvkSQvwXcTRaXmaIrCt30Af/D0p2VpOo0qSXXh7dzFw
         q+PbVwvJEdCywa/JQ/ESWJX48o3rVt5NvO3WuwMgZKVQS9/SYH35CghdXXCbGpH8LBUk
         ZEdmIgjRABhyXs4RbSCr7HSJTNcodLK6Lpg8ZhcJSNC8ohtxM2an5jqgmdYDMCxSResM
         ROAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025924; x=1794630724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXb4T+4yF65d01rXW8bhdUP5pOZHT/ojuN1hL7c/AAM=;
        b=AgkgyZrHC9prWASHEuvtQOZ9bAoH9aatQ4Jq1HYqVGzuYLFmGWNuk9fkw1ktFo86JB
         NgjWvPOwDY1VfA16XMWNEazLq/Ix5uxDvjStMkgsd+AvxiTFN0OZATeeByaxnMKV74kS
         CEEv+Y5Ro3ZTQUUB/a2ioLOKiDroiZFrwLpenviCEPuy9ktiFhWbH/52Yj+vRH/I2Bo7
         618OcL9cefWPppEArGlbkKtBRHPEPLQ70FDfabGFWWoEnhHyYiCn9/VABTxxttThyItO
         If4O4WNZkSKdW0VnDMd00x1LHd+XSoMVWtXPmVMWp9648n5sRa98jyehUMFuDw+3qL+O
         6Ejg==
X-Forwarded-Encrypted: i=1; AL+hErHeYxWJpjIa9uLXyTZOg1gOsskozvnvS76XUng2Jo6mxYCP1gKM8QViSwjvk7B7LHmf2gcX6Jo9ojHMnW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z98DEGzxqPbG+29J0L2Pzdo3NrDGxM28cTGXCGmo1FnMDNvOYfu
	12TBDr+JaXr5hUdoVUSf/66hOZKoE2X+9xqniKphd48E5Fh1I3Vp1llK7OAY+3p6Ub6d1zAn4Oz
	NvLIJAwfjpzrxcdPjN74lrOHee8OOwHg=
X-Gm-Gg: AYBFou2Y0Leo2ur8QidoNfwMLNf2exeFpdz5wClA0mAsLK4TugJB0F2HRo7qJs85PWn
	VTyUA8gtncRx/tGgW7nGsWGs/2WUqhD4dX8FeOIkFFb8mcExSgK5xKLSUF5TIBAQOaq/+T1ZeJv
	BEhNvTjiWs2j1Ra96cugNKCuPM8kYj73GYIveZpR5yc3aBe4e+lL1HYY5UA9EDhOXff5rV7z91D
	HhaydIdXCDinzKLsI2agPJNT10pFlb25UJM4MBklKuJi2FmqUo51Eyv3DmNCvXQHbBWcDjVTvut
	r9AWJwiir19dfJITE2Qz4YN0X4ZeOkRHiR7I6q6RIoka/xlwAOPTiFyLoflkdd6tAQaHoqJT5Lh
	rZJuvPxFoNuTmeMy4jN+TK6fYIBzBirsKib+Fvy1TL03bq6ZnKjeH75WoVy2b/rSaFKpUdr0=
X-Received: by 2002:a05:6000:2c03:b0:493:28c4:331e with SMTP id
 ffacd0b85a97d-49328c435cemr5949999f8f.28.1794025924400; Fri, 06 Nov 2026
 20:32:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106074639.452630-1-nikitash.mariiaw@gmail.com> <au2uDjVhB9232IuB@devuan>
In-Reply-To: <au2uDjVhB9232IuB@devuan>
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Date: Fri, 6 Nov 2026 20:31:53 -0800
X-Gm-Features: AclHuK9rBZ-IeP-aPeV2Q8ycPShnWIqSPPLruBPolqxGt1zwis9sIKCEuFaBges
Message-ID: <CAPDEY+Wa2+zxSVz8fewXDP78eA8-3ymAKurXuvB1Dhx7heLMiQ@mail.gmail.com>
Subject: Re: [PATCH] media: radio: Replace strlcat() with seq_buf in TEA drivers
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: hverkuil@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	kees@kernel.org, justinstitt@google.com, morbo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 2:39=E2=80=AFAM Alejandro Colomar
<alx+linux-hardening@kernel.org> wrote:
>
> Hi Mariia,
>
> > Date: 2026-11-05 23:46:39-0800
> > From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> >
> > In preparation for removing the deprecated strlcat() API[1],
> > replace the strscpy() and strlcat() calls used to construct
> > V4L2 card names in the TEA5777 and TEA575x radio drivers.
> >
> > seq_buf tracks the current write position and remaining capacity
> > across appends, avoiding repeated scans of the destination buffer.
> > This preserves the resulting strings, including truncation behavior.
> >
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> > ---
> >  drivers/media/radio/radio-tea5777.c | 10 ++++++++--
> >  drivers/media/radio/tea575x.c       | 10 ++++++++--
> >  2 files changed, 16 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/radio/radio-tea5777.c b/drivers/media/radio/=
radio-tea5777.c
> > index fb9de7bbcd19..2b1c7f6ddd60 100644
> > --- a/drivers/media/radio/radio-tea5777.c
> > +++ b/drivers/media/radio/radio-tea5777.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/init.h>
> >  #include <linux/module.h>
> >  #include <linux/sched.h>
> > +#include <linux/seq_buf.h>
> >  #include <linux/slab.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-dev.h>
> > @@ -255,10 +256,15 @@ static int vidioc_querycap(struct file *file, voi=
d  *priv,
> >                                       struct v4l2_capability *v)
> >  {
> >       struct radio_tea5777 *tea =3D video_drvdata(file);
> > +     struct seq_buf s;
> >
> >       strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> > -     strscpy(v->card, tea->card, sizeof(v->card));
> > -     strlcat(v->card, " TEA5777", sizeof(v->card));
> > +
> > +     seq_buf_init(&s, (char *)v->card, sizeof(v->card));
> > +     seq_buf_puts(&s, (const char *)tea->card);
> > +     seq_buf_puts(&s, " TEA5777");
> > +     seq_buf_terminate(&s);
> > +
>
> Why are the casts needed?

Hi Alex,

I added the casts to make conversions from u8/__u8 to
character-pointer types expected by the seq_buf helpers explicit.

I'm also considering simplifying these two-part string constructions
using scnprintf() instead. Would this approach be preferred?



> Have a lovely day!
> Alex

Thanks,
Mariia
>
> >       strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
> >       return 0;
> >  }
> > diff --git a/drivers/media/radio/tea575x.c b/drivers/media/radio/tea575=
x.c
> > index c37315226c42..e49228eb7c46 100644
> > --- a/drivers/media/radio/tea575x.c
> > +++ b/drivers/media/radio/tea575x.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/module.h>
> >  #include <linux/init.h>
> >  #include <linux/slab.h>
> > +#include <linux/seq_buf.h>
> >  #include <linux/sched.h>
> >  #include <asm/io.h>
> >  #include <media/v4l2-device.h>
> > @@ -221,10 +222,15 @@ static int vidioc_querycap(struct file *file, voi=
d  *priv,
> >                                       struct v4l2_capability *v)
> >  {
> >       struct snd_tea575x *tea =3D video_drvdata(file);
> > +     struct seq_buf s;
> >
> >       strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> > -     strscpy(v->card, tea->card, sizeof(v->card));
> > -     strlcat(v->card, tea->tea5759 ? " TEA5759" : " TEA5757", sizeof(v=
->card));
> > +
> > +     seq_buf_init(&s, (char *)v->card, sizeof(v->card));
> > +     seq_buf_puts(&s, (const char *)tea->card);
> > +     seq_buf_puts(&s, tea->tea5759 ? " TEA5759" : " TEA5757");
> > +     seq_buf_terminate(&s);
> > +
> >       strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
> >       return 0;
> >  }
> > --
> > 2.43.0
> >
> >
>
> --
> <https://www.alejandro-colomar.es>
