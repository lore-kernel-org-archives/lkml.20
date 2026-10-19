Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421717;
	b=wmcHxHSkbbt5tQL7IUuIEwGu+FZLVChjxPj3pREtnvJKmMKs0jnimjcc0l2G17TJcxlE
	 zrosWSSzC9uA8STTtQkbxSHLXdvxwGESJ33tBWYTICzxKhf1K/57ikududrqARr+hCPmt
	 KeSkkhpp7QMeWbqrauxebvF5QduzWeZjn+ibDoMOxUz7jVFgQW0GyIuyGdcur0r6YNzMG
	 0fmG4NDrhqpUKojlON7an7C+HH9hbOfSI99sKBpDXEiWatG0pw3UPAZV8Z4KWNtUdhtkG
	 AMBJsTw3nhS4mkMzGYW5FpDQGj6LBdwlf0IoRdteFV1lYxtc4UJL9i6V7plyzod0pHw==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421717;
	h=Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1JVa4anZLJXOQzT6DdFCFiAtwNU6Km/IK3O7kS1gknE=;
	b=DoCLB1VwACNnR9J86wXA3NtBvflWR/iFKfoRoDGWsE9tec0eatau3EgMXpJAxS07vyjg
	 BAFe1WTSYAzmMlT51LE4+MAnRSolD5W1wO0ee86Ir1m7fwjNkGL9/WpCF6/rUZVkkDu8J
	 oUbAS6UaKcVErLZeL6r0VG4nZVPtpDmLOv1vmuCIKWRZTdcUVXEHCiZgpXbYfd5SBgNF/
	 dlHfKOu4y4v+4jOeW8bj5BURJQQGJVCBppnvpzFRCt2yG673hYvO1dWYD7E0OMG1B6duK
	 1iM+Co/y00mlAweUflUQexXiYCtttAIPjd4T7lUsxNSK8eXeB+Vv37FzIRdRIhVH3Vw==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IOaySC7U;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433DD606EFFC
	for <linux-kernel.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IOaySC7U
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF103234964
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421717; cv=pass; b=BOfKSRFIb5LJkhwhYCc5XjdxFVZRYOGPZys4VhApw8Eglnr6GAopU+IaE1T3QPaqD72f0dfzOhIFLKOb6AaX0fmybWrbGYMD7UKoNuTiJCfeJPkV9XSwiT7Obp+IML5WzMFG/mj5UW3fpShHBt8UZXugWfFzkG2J75pbwNs1FYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421717; c=relaxed/simple;
	bh=AKW3t68ZOk81dPuxPw32ZX6gYuPNE52T8jj7L1+y7RM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRGGZo9PiLQePBLqtTYBpqrsSIuHkzXWLhQc3d7e2+v2fmvgazMVFOBFYeL7RX/Kj/XCvocC4e0ujeiaf/UnH7x3dOoBjlCFqB1FYrrN5oBVndJFHYdba/o0c55aDvDWhySbRb23lza+n+nYsv9IHGlKkdmGQueq0VSEB9iPybQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOaySC7U; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535a54bed9so3037803eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792421715; cv=none;
        d=google.com; s=arc-20260327;
        b=moBz4I4uBOGofoVyLZN0lu4ZWRXpmP1dtw0+prqrdSGE/jRBfr/9qtEdcTMmzQsDJ7
         ot4nWRrY9cDuBt70EIWNnH8V9Dtu4GQdQ4yveNCdrgBxCa1xuSHZBHQj5OivgiYVh378
         +4hdDDhs3bfg10L93Fzzgzfo6BoNc6wJX1zGDMIjyJgxnXnDSOvA8H3fjgA57j6aCILx
         BMh+jQC+Kmw64nS9nyeAnwcNO9FnfiCfo3DUPaDMhPFRsFw6ZNEoHGLqsTlS8E/LRLNG
         zEipJFV/+FudFJPyMRghExMek87R00OKjmfJLlkSda81piGSQ5Pw1ZnU0BSRED8537m+
         GGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1JVa4anZLJXOQzT6DdFCFiAtwNU6Km/IK3O7kS1gknE=;
        fh=k5NS6ndCVWQDaoPZrSKkTIkqPDT7aTNyP/zTCzdkjz8=;
        b=R5PFpGInmFhkQKvctniGjcljlzppqkKnllfNvvBwwBcKFLby9bROn88i+8FYWL5vVI
         oo3JtyvYJoIZ2nYsE3qLSXl4F/wXq7+pX6QVCP2oyHXeJnZDnhADpmQNtE53mQOgBabd
         fmREdYecfkPNPXhx3XGZxTEPcZnK5kERHkbcFVEuUMNtl5/YfmjOXg4rYG8G8IPkn48a
         b67xu3msAHI/+E2NPIPHDjn3TaJlcs9NtqYgbSnO6zZ1q2hhpa19Dbls0mcfrSaZcwkw
         O3QmBQevsShM21UiQ9vH8o4JvluTK1CCLbLsQoETCIXmQEKPXqrHZZfZIs98E2iO+Vy8
         biCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421715; x=1793026515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1JVa4anZLJXOQzT6DdFCFiAtwNU6Km/IK3O7kS1gknE=;
        b=IOaySC7U7W3uf19SUIgQObLWJ1HaLaEi8jv+lORJA1D3mjRjX/AMccUsulTefGV2X7
         LssP+DVlzVD6X7WdIIo6/p2/khhDwe0+x6Ylo3djuwxncoOMlPQCexPT9dOFbLa9nz6V
         kVEuvNC1cCl6DJlAybsPj2wGhHApWyLYxk9DPidR/P8zhVTzXr9Btl/5upVkpGurwFkZ
         jVI00O/WHa7aNmeupJ4Bo68cZlmX+mBEIkNVgy7kdJHAqb9gpQPlmOyp0mPqbzkTewFE
         azcdcRBkYIOd8SPDf4fTzO7P9QFEQg78Q61TxDUNiiFSRcuUPYnclPj+yAaGVDluFz7o
         BZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421715; x=1793026515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JVa4anZLJXOQzT6DdFCFiAtwNU6Km/IK3O7kS1gknE=;
        b=0oUhkjJcXd5MlOCjigN0m5BkobO9niAVwV8UYtV48+0D3MIbefh2krPfjHQZ+l1NPf
         pB3/NzYlt2P9YsmdPia+MDbdLggRhaJwb+Qmh4UtcEwBaemIVLmAnp5+pS1pyt+G0SZb
         5B2GuEUOqin51SmJSPLVD+Gtx0l3ohE+lJtLnoJmIjpF5Tglz4u4OYgtNPZQwNBaYT7F
         MwndjE8hOGUk1rZIW2QLBzINfCZsPImh4TrTXNq2SuY+lCgAvglflEnjfiZtjIqCgkb2
         D/lBCbqIfOFAzJJbNHQur8h0PfKTMe7QqCA40gxHpCwV6P6W3nYdi9FyBZUa3JHj5c0V
         0/pw==
X-Forwarded-Encrypted: i=1; AKwUvBxwZYfgIwjSkV3MiKXIrKNdgbAx1XEcBO1VHRqaGuripUX7ih+lkaEwqXGPcf34WvcLRiQJuDXntj2dugE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4vAq+Wx4LnZE2m727rwykf4lT5pv23w/1z6QmBiAksafEyPiu
	MUT8AAywF+wBumFt/H8JCt5+ysQZUNw2VPsGEpEtaQTbIU4aQcxq9S2CPXQpUA0+82elcOeNbfk
	NAaQKqZkvudBAy88TPs8hqTBIsUud7k0=
X-Gm-Gg: AYBFou1kDPTNMqeHvNnRbarDFVK92XnrenY5OcHBqDpAXRRvCh6+iLyQ8iTpZgLQY3X
	+s+ALQkiC999sLTmvyrmvIN2nSwyY1zImLi0+6MS5PTB+V9K5DN4ptCVF6yUZVwtVidnAEjFJVq
	LOwhIEthWT7WHBioX4Xci/H/3/UJOUgD+45HzwT1GdppgAGszzCv6N23DtunR+zASdXjKmTNISX
	ZoaW6KqUss77hCwgGOceRnmDccvY6M1KnKxA63XXIBPMOikN/PpnEoSsYyGA455kh/Xo+oQ9u0T
	CP9etMz/y/VRlNcNdZbQbRlPxXgkGk3+JOXKeQ4D2Jf9AueVgM063EB3WheOx5rPjG8QHi5uAyt
	I8HCf8coHZtIY
X-Received: by 2002:a05:693c:87ca:b0:35b:c1d2:eab9 with SMTP id
 5a478bee46e88-361a2e3d3abmr10553103eec.39.1792421714834; Mon, 19 Oct 2026
 07:55:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-3-clamor95@gmail.com>
 <179198332384.839288.13126529382772558553@kernel.org>
In-Reply-To: <179198332384.839288.13126529382772558553@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 17:55:03 +0300
X-Gm-Features: AclHuK-mou-LoaLS3qywfc3GD7SbgOiLXnwqTE0Jl9qjYTR1SQVKYSakF-bo474
Message-ID: <CAPVz0n14BhmK4P-tqnt6AMrAh=W-HPoBbP0ztdOrRd_JocRSqQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mfd: aat2870: Derive brightness steps from max current
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:4=
4 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Wrong subject line.
>

What do you mean by "Wrong subject line"? Specify.

> Please review, explain or fix the Sashiko review(s).
> If this is a set, this request includes the other patches too.
>
> > The AAT2870 allows only 32 steps of brightness, with this amount define=
d
> > by the maximum supported current. Remove the need for max_brightness by
> > calculating the allowed number of steps from the maximum current.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/video/backlight/aat2870_bl.c | 30 ++++++++++------------------
> >  1 file changed, 10 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backl=
ight/aat2870_bl.c
> > index 8b790df1e842b..eb686e315921d 100644
> > --- a/drivers/video/backlight/aat2870_bl.c
> > +++ b/drivers/video/backlight/aat2870_bl.c
> > @@ -24,18 +24,6 @@ struct aat2870_bl_driver_data {
> >       int brightness; /* current brightness */
> >  };
> >
> > -static inline int aat2870_brightness(struct aat2870_bl_driver_data *aa=
t2870_bl,
> > -                                  int brightness)
> > -{
> > -     struct backlight_device *bd =3D aat2870_bl->bd;
> > -     int val;
> > -
> > -     val =3D brightness * (aat2870_bl->max_current - 1);
> > -     val /=3D bd->props.max_brightness;
> > -
> > -     return val;
> > -}
> > -
> >  static inline int aat2870_bl_enable(struct aat2870_bl_driver_data *aat=
2870_bl)
> >  {
> >       struct aat2870_data *aat2870
> > @@ -69,10 +57,11 @@ static int aat2870_bl_update_status(struct backligh=
t_device *bd)
> >       dev_dbg(&bd->dev, "brightness=3D%d, power=3D%d, state=3D%d\n",
> >                bd->props.brightness, bd->props.power, bd->props.state);
> >
> > -     ret =3D aat2870->write(aat2870, AAT2870_BLM,
> > -                          (u8)aat2870_brightness(aat2870_bl, brightnes=
s));
> > -     if (ret < 0)
> > -             return ret;
> > +     if (brightness) {
> > +             ret =3D aat2870->write(aat2870, AAT2870_BLM, (u8)brightne=
ss - 1);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> >
> >       if (brightness =3D=3D 0) {
> >               ret =3D aat2870_bl_disable(aat2870_bl);
> > @@ -150,10 +139,11 @@ static int aat2870_bl_probe(struct platform_devic=
e *pdev)
> >       else
> >               aat2870_bl->max_current =3D AAT2870_CURRENT_27_9;
> >
> > -     if (pdata->max_brightness > 0)
> > -             bd->props.max_brightness =3D pdata->max_brightness;
> > -     else
> > -             bd->props.max_brightness =3D 255;
> > +     /*
> > +      * The maximum number of brightness steps is determined by the ma=
x current.
> > +      * The aat2870_current enum maps directly to the allowed brightne=
ss steps.
> > +      */
> > +     bd->props.max_brightness =3D pdata->max_current;
>
> What happens if 'pdata->max_current' is 0?  Above, we fall back to
> AAT2870_CURRENT_27_9 when assigning 'aat2870_bl->max_current'.  Shouldn't=
 this
> use 'aat2870_bl->max_current' instead, and if 'aat2870_bl->max_current' i=
s no
> longer used anywhere else, should it be dropped from 'aat2870_bl_driver_d=
ata'?
>

Resolved in v4

https://lore.kernel.org/lkml/20261019100930.110954-1-clamor95@gmail.com/

> >
> >       aat2870_bl->brightness =3D 0;
> >       bd->props.power =3D BACKLIGHT_POWER_ON;
> > --
> > 2.53.0
> >
>
> --
> Lee Jones
