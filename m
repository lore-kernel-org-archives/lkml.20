Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792554131;
	b=LndsLxB2f6Iv0aHRBms2GCLpO5EboTq2vD3iSKvf+HLXSZ/saqeP/bP8sf0A3H7KcV1t
	 NkyQzknsOkr7ZtbzLqonu31kFqA4gckFyobwV+2unXTrgrj12W8zXzOGpDikugo/Uu7Ji
	 e1IZc7r2Zvra+zLwl1BofhgNCyx+Anw9UcYt+qI6+Q5Rn55KYSiUmBlI6SQk7w8mLtmc5
	 p+ZJ0nLtpaE78JcW+GTCJyTaVMsXh3KeiCUauytVqzGZVtULlQWcjlXRdje/gA8Lf+enB
	 FKuSqpfUJEDmCvvO8SXcZev2YdyxsxhQyw1tneyJxJkOKsY8o8ZXn6+TgJ4X2Oeq8Wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792554131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IeaSzkQDMTFDSwIXhXuKa6PQEsom42E15utOhKCt/2A=;
	b=RCyQwxscPflZNjigWVPOoEHbreX/wn4EoDCjNh5A+5AoX4Stqc5qM6Xch1i3AAiY8cUB
	 tfy87HSxM1MUjnEkam6mZ9p8Sr2ZbEmdMNdWxAz8gW69RNZhVefl0FH6MQGafnQJgnQrf
	 9tpzjJabZyMip9MqNjIu3mYuPsTjejZsjN4vLESNa+jgGHoI5eCUlKxZ0Z75xuimhY+Vp
	 ybfoE4NspQZlhairKosAhivN2Ii77tH3bZmhr5Razfq9BwYb10/kyfvKX8APfHxHWh2xq
	 0Rsm82+2qS66Ww+SL9c6zJThvmFjJ0jNR64eVO8fBaAX/TQsYag0Fj/XKg1uRuoHRIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fdr8XTCc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C62606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31C62606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fdr8XTCc
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c20ce3c118aso47549766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792554129; cv=none;
        d=google.com; s=arc-20260327;
        b=b6UAO1AicYihktB0e04803PLrxE1a7mf/IETcQYVs7OJjRkhBbLfMb8ywO4PjeMYqH
         j2lwbEcJRlbgerqB4y4cMjTg/L5FBCkAYb2qHkION9uQ+HXp1SXr5FiMzSmOPsRPW5yM
         pd1b9wmYADz+oOZMi3WFZwz8itVLc90dDfr7j5n9hJP/V3myv6VVxgwFj2qcenr3yBMX
         A2b4V40/DWcKqENSRA648zjFM7f/0eBA13HsjBZoe6TY6BwyDW8In4MOfrmoPLTmgbiV
         N6qetBFNf6C59Z05ntB1lV5svMDQTz3kGMr5nHhYPQXlX7lqw79aaS4OFvMo9xrRRPZ9
         o7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IeaSzkQDMTFDSwIXhXuKa6PQEsom42E15utOhKCt/2A=;
        fh=cwFViK7l4esbKEMSXjQm6dL86FLXEmWFaoWjW09xd7s=;
        b=MrnkxJlX7TNkD0xTzZL5Nkxx9JEpTrjwKH4rAv4wNNdHE6N6Smvjmr3rCIbTaPBXPR
         3ZbOb5b39TQFgRaBaTDitCwYGdnaTQzbQeCQM8kp7R/nWd2MSIpV7MDnUi5JMEZD4nxT
         CC6q3tZQoTnT2gRpJR5ZJW1MFx8gefb1IDqZcTWxOOuOtxGYPvfRUE1xBjukTzXq45DZ
         nNPZzn45JDs1eIHxoigINFOs+kEnTUMI8b8OjtxvW46+iEVOyfBnYWPSEv/ZSYqyThBz
         h0coodPO4yumhLkRwONakPNP0Iy05UwGg/ycBKi9AN/mv9TQYcBjooOCSXVT9P6r7utf
         Jh8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792554129; x=1793158929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IeaSzkQDMTFDSwIXhXuKa6PQEsom42E15utOhKCt/2A=;
        b=fdr8XTCclouSuGw09TYrAEEcJg7A9xLzXplGn13seFUteBNT8XQ2Jk7tXT33UG0p7F
         KbYa0QRdgodG1q9KC/l0eEVYt4PTAnmeMVpAh5sjtUezx5yNBAdGu5X9D+iOQjhx/cea
         WjLE+AaCkdceQw+O2VEtr4HDo//UuLNyZ7YD/awC3DDR9bDxOw8Tgt31uhiVcOan2LV0
         slHIWfuC9e09mby/ct081rD9UsBugdBk7RQVhXI9cKXDvdwnhRT2pbQqlKTA9McJIlCk
         1+7tPkezzJ/rorluB2FbqOxU3YB5t/SkE0Sh+2uEq44j04pnvieK5fryQD5/QkPeUZi6
         QrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792554129; x=1793158929;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeaSzkQDMTFDSwIXhXuKa6PQEsom42E15utOhKCt/2A=;
        b=GFPoFw+bDwTkVD5c0rOk/NcpO1i2LgDZnkxy3MYf/+oojXKDywOOSYl+kSPpjhwHdN
         XWMEJkRLnkRCyVsmzToPP6ixJlGKsGQmXuWRXVOVfnSKqIgAN2l6FuHw2JvWsXSeR924
         aO9NOsetTvFhekSc8K05ZbF26v7vkyQfkd7tOTjZkiLPHCVcBwhzH58J9t9zQAruikHa
         YaZF58UikZKM+qY4hYXE/QB+eiYRCW7WDjtWc+rHmXcjj28DZZqlxf1j2WMjjgkQ1dEv
         7hE7hxS/sK71Ckwto3LjqpE1pJpDFlmo/cENaqRcTtsvuycScFTslMzJcqDVT0ej+vWJ
         oIlA==
X-Forwarded-Encrypted: i=1; AKwUvBx7z1n0qcl0x5T1G3MBAgtQ0S5f1MZARFMgeNUzTU2Qqef6ZqI4BOAmh0UCUQNuRIl5fO8rI55/Ng1vCOA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ/PDsDh5o3lF9vGMVRXhm21LgV3VM77Malg5e0OU/ZQRPipy7
	JhPQ6VbIuGMEh7Fwfm9hNQkWF40p+SFitjyy3FmmqD8UcCgqlBXou3S2LeU4LtFMcsjM42XsoFf
	judFXM1AYJyof5mrCZ9/hk/ZxtNA/1KdAu+TtWRo=
X-Gm-Gg: AYBFou1q6715BV53GKPn4kwI52oTQuAlqweIQ5lqr/SL/5NFdWgK675+rzjTghD0j4A
	219eZZGBQMdJ38CufvsZ5I5kBd5/2Fp0OIgnNs7Xb75TmIs4m2ml0ur21XMWs4TtUfCrwg9ITUU
	l/Od9I+hp5iJyFqYvKZ2oY5BJ7+/LpycO7+7KGURsx+hi9o8zv+FTUzElgyRZAooOv2vd61ai1A
	5nzOu+3BnSb2jDtF1IbhPCnqO3gCdq0zT+ZPILictTy/ZOeqxu06gwHNJHnJUZq2slRApz3j24Y
	lkF5u6rVPAQnSryiD3aXTEUb7xENJHoz6LCR+KeXcOLhWKTWUJRLKPbdvM90LlRgIBzbmq3NvRe
	r4On/OE58zBbURee1dSa7d5v4SzhWi/K4jXaWSopX
X-Received: by 2002:a17:907:9723:b0:c29:4b57:503e with SMTP id
 a640c23a62f3a-c46791a894bmr80209666b.1.1792554129390; Tue, 20 Oct 2026
 20:42:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016025352.230535-1-meatuni001@gmail.com> <29c3e4a2-9d6a-60cf-d06d-85152a40a703@linux.intel.com>
In-Reply-To: <29c3e4a2-9d6a-60cf-d06d-85152a40a703@linux.intel.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Wed, 21 Oct 2026 08:41:57 +0500
X-Gm-Features: AclHuK-ireUCJptFa_FX8V4hNSMKN72Ng1R0P-ZWBFx4NRNhVt-8-KKpzPkwUPg
Message-ID: <CADqcGBkV4iE_0j6usv6TvV3K9XGUa0L9J-ebUkTLsB0NBYzTHA@mail.gmail.com>
Subject: Re: [PATCH v6] platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

> Why use n variant?
strnlen() keeps the read within count, which is the size of buf as far
as this helper knows, so it does not depend on the caller NUL
terminating the buffer. Both current callers pass a kstrdup() copy, so
strlen() works too. I can switch to it in v7 if you prefer.

Thanks
Muhammad

On Wed, Oct 21, 2026 at 2:19=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Fri, 16 Oct 2026, Muhammad Bilal wrote:
>
> > The input is copied with kstrdup(), which stops at the first NUL, but
> > the full write size is passed to hp_enforce_single_line_input(). With
> > an embedded NUL the helper reads, and can write one byte, past the
> > copy. Return -EINVAL if the input contains a NUL.
> >
> > Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.8): writing "A\0"
> > followed by 4093 bytes of "B" to current_password 100 times returns
> > -EINVAL every time, without reading into the heap.
> >
> > Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
> > Cc: stable@vger.kernel.org
> > Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> > ---
> > Changes in v6:
> >  - Return -EINVAL on embedded NUL instead of limiting the scan (Ilpo)
> >
> > v5: https://lore.kernel.org/all/20261007134711.473857-1-meatuni001@gmai=
l.com/
> >
> >  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/pla=
tform/x86/hp/hp-bioscfg/bioscfg.c
> > index 876fc35d035b..e306bd8b1e72 100644
> > --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> > +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> > @@ -162,6 +162,10 @@ int hp_enforce_single_line_input(char *buf, size_t=
 count)
> >  {
> >       char *p;
> >
> > +     /* buf is a string, so a NUL before count is invalid input */
> > +     if (strnlen(buf, count) < count)
>
> Why use n variant?
>
> > +             return -EINVAL;
> > +
> >       p =3D memchr(buf, '\n', count);
> >
> >       if (p =3D=3D buf + count - 1)
> >
> > base-commit: 8667bd30fd033295b3038ce374c551d1059538ba
> >
>
> --
>  i.
