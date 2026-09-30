Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341F351476F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788506; cv=pass; b=bT83KMu7bDi/FJ4HWFzzJ6cbaSuRXU/RRnsmJWExS15DHZoDI7vWAk8suotwq71tX2IbnvSbIjJiohC1y87m1WKd2dns4Tt/6f4/nTHJQFB6kCt1G9KaJvmSsLOjuFqkukhwpNqL2LwYJunj/e/QCvUYsn+MTlVDz2rxu151Hp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788506; c=relaxed/simple;
	bh=flTa9IPUvO2Wfd7dxpZCg15j/sd3TNn9DagEWKcsB10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHaVZ8lqji/PAF13iZwmgZVqGPipj4q6F9GYp4YtaD60PxzV7aKoh53AzjaIbj5ReE1olLlgKmvBDdpKN+E/yOmypJt8os1c0TNTSTSs7qzHZdkUxxCfJfjmPqi9Sfayt1az13mj8i8RBwRg8cqW+2Vmjt7ah+IaqsLvGqP2MG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iciufym2; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iciufym2"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48870973bddso808714f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790788502; cv=none;
        d=google.com; s=arc-20260327;
        b=b41ryVCBWfo6AxeiThpJgnCcxSkzHCTrahGbrhk2Mp9xGuOV8sXUJQa0zmoxZzJM0a
         qSANDbOubKwA9NXuMel20ED8HADB1UdE4+Iq6xfFxPo1IddckE9pvCHaKLClIQ3Yyha7
         lQDumvQrvEdfSpyFRZttgKRLdkK7nyt0xDAxCuQAUvJK1+HJhcS7Tlm1TCdPJcqoc5rT
         bQNROdhU1DX2sKf8l6emELJ2VQrVYffiMxEAXt4/xhpqmIx/v0/8rut/BSgE9NeumlQb
         oB/wMYDlCDkrvtt9Ie4Erb2HKgopYXMA0XcztGR0zMop0rP2sD5oAAafw35N4o2pvPTa
         15PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wLIs5aSN/ephptBI36FGk5tlNNffSxw7Odm4ILpRBMY=;
        fh=0q0zYUL9mklg5HkI9cBQX5i/QHiXM8+r1M17D0aaY9k=;
        b=MBiiuvkTVjg7oK7/sA8C/8eJOhnjD3AtIbHxL/QiMxXrLhTseC4LZEYKIB5mCWpGIw
         IVhhhN306H1eh98SpZD1A4+EQudcOvWxKio5EU35vn2iI8ycVpL3Vq45AeahJlD659al
         eCv8DMyiuUEwzsinZfnTYKxojTaul+oOxIXDwdDa/pVNFkxUUvPM40AFBJkiGvojuzKw
         eF9GtbEkHvhaTDAQz3A/9gnqikDf4LkRbEPeCr5PZ5jFwHSWefgLCfLwuQtEMo3KhLQj
         W+h+CZXKN4J2aUtuG6aXj1z/Mf0V2ZCx5ZHxHngvb1myUvKsH5xMWhT9z8e1xN9+P9R4
         dFPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790788502; x=1791393302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wLIs5aSN/ephptBI36FGk5tlNNffSxw7Odm4ILpRBMY=;
        b=Iciufym2ZntFU/rJrlRxGAKWnPBz4YIbIEpD1bz2y+wMSFnwRY1Myb6KKinax40CqJ
         khQtMQvl55TCfWcc3pM2zNJaYrgC8c8k7pDPSsuAa9Mm5i8Mqqsb1Rbb3dHuh+yZRtVP
         le8mHNP9vWHXtQXtZXOHjo9NuYHrmXUfu3HLmhw8EJWbrmhMouJDehXY86RyF0XqbiKJ
         d2VqNYa4LUIumHLrNadrRiPtQ2X0VpbuO2T59KrO0iHwaNzeddTHb2RCuZyjPTrQrwQM
         iPxnJNVAGItU7YVR0E1OrDPIlm6A37u+/4ZncWNwgzVMeX2wOoOo8Pp/8LvVmrsrzpBL
         PiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788502; x=1791393302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLIs5aSN/ephptBI36FGk5tlNNffSxw7Odm4ILpRBMY=;
        b=RKiHfc8jy63/VwQdW9AXrE8UYII2KJByZNsDI24zsKs0f1gmdlwJ+yLy4PdVhsMlXO
         YaQltd8Q1jFaePgYWGtU7vvVW92D6W9dM0YNkt6BSr5EhAxFSpq4x4YKZ9m9dode9A40
         hDFnNZuQWoouALAJBxc9bxHBY//zzxlwlr+3cDDEnl0G4aJiuLjqoYY8A3XZpFN5bQn4
         Od9szZmJdQ/hEpl7mX7SlKHTGyGMWIq3zq1+5LWnnqZzgZ7dO7d/TTlf8Kj4ehfID6sg
         CNYGRABZWEGcprNAGUJqQCHhWTvx7Nc48Ixb0TEwbCe71m6rTh5X/f79CUi+QyLzHbgz
         S6hA==
X-Forwarded-Encrypted: i=1; AKwUvBwEnMRhW0nHdy+N9eGpcLl7ZORiN5edlvduHxy+WQWhOyRGVuV0xAonqSmDjWbmZ1VJW2IwiSCGxg94IlU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHDwTnZh3rInevOsiHt+J3enEBL9xeeMYKw4kVjQeBIU61F02b
	rQqwdIWq5IA9rqqpmCtGnkdUbJ7akvrD7QXOpiVrf7/r/DTKEEOq/IQcbyjTzPqMKuNvnTbO+Cx
	y6ftjat85f/NsvtydJAymRj+GQag4U+A=
X-Gm-Gg: AYBFou0ayw/WvISU1qtl/6A/uAZtgJk+LbZvsXUMSGAUVxWIMvJZ9FqeruTJ44aT56i
	zhaPT34vDq6Gi8PRlNpS8ZeJA3fKWLTSmXe33dT+we44jJvrrzGE2H66+pFyg/bvasLC66cdHsc
	bPnKY6j6n/4xTGzfPbkzY1O3G/j9T2I0tt74R3Jm2u0w6Ec0/YylEqCP0ERiJSXiGqTX0SvbQSy
	b5lKlhjxyKYBZb+1VJXW0oK7b6UTGoRWkSpiWZyv+ovghs6KXtEDA9ZjeUSEi4FC2Pm6EN5vWmc
	sw510zvJbwh75j2CJWAwJf7HxUbZLSUqYWMRfmXFe+0HbKFveqtI4+Pb3BJUf9J6fRoVuWIjtxF
	ukMsfBKYKoDC//voXv387B3krt0d49B5c8uYPX2U06uuECnNIulhl9Lkx5cbWzQCLKxtcIdwa0p
	w=
X-Received: by 2002:a5d:4acc:0:b0:487:342:eb28 with SMTP id
 ffacd0b85a97d-48b068bf31bmr477202f8f.24.1790788502254; Wed, 30 Sep 2026
 10:15:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929124248.237032-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <arzX2pzq_0JreVJe@ashevche-desk.local>
In-Reply-To: <arzX2pzq_0JreVJe@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Sep 2026 18:14:35 +0100
X-Gm-Features: AclHuK_nTopzCs1JxF_udaLq0aHe5Q5fBvI6nb69CERob4o8SQmK8yLw1zzL4tc
Message-ID: <CA+V-a8sj8LnuHGYOV7Et9KXtcKYrSZgP5cgYqxCiE0VCSH_Lkw@mail.gmail.com>
Subject: Re: [PATCH 8/8] iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the review.

On Wed, Sep 30, 2026 at 10:35=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 29, 2026 at 01:42:48PM +0100, Prabhakar wrote:
>
> > Add support for the ADC found on the Renesas RZ/V2H(P) SoC, which share=
s
> > the RZ/T2H ADC IP but differs in channel count, sampling, calibration a=
nd
> > resolution support.
> >
> > The RZ/V2H(P) ADC provides 8 channels, has a fixed conversion time of
> > 20 ADCLK cycles, does not support calibration, and supports selectable
> > 12-bit and 8-bit conversion resolution.
> >
> > Expose the fixed sampling frequency as a read-only attribute and allow
> > the conversion resolution to be changed through the scale attribute.
> > Use extended scan types so the reported scan type follows the selected
> > resolution, and prevent resolution changes while buffered capture is
> > active.
>
> ...
>
> >       help
> >         Say yes here to build support for the ADC found in Renesas
> > -       RZ/T2H / RZ/N2H SoCs.
> > +       RZ/T2H / RZ/N2H (and similar SoCs).
>
> This wording is good for the summary above, but here please list what the
> similar SoCs are. Something like
>
>         in Renesas SoCs:
>         - RZ/N2H
>         - RZ/T2H
>         - ...specify "similar SoCs" here...
>
Ok, I will update it as suggested above.

> >         To compile this driver as a module, choose M here: the
> >         module will be called rzt2h_adc.
>
> ...
>
> > +static int rzt2h_adc_write_scale(struct iio_dev *indio_dev,
> > +                              struct iio_chan_spec const *chan,
> > +                              int val, int val2)
> > +{
> > +     struct rzt2h_adc *adc =3D iio_priv(indio_dev);
> > +     unsigned int i;
> > +     u64 scale;
> > +     u32 rem;
> > +
> > +     if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_RES_SELECT))
> > +             return -EINVAL;
> > +
> > +     for (i =3D 0; i < chan->num_ext_scan_type; i++) {
> > +             scale =3D (u64)RZT2H_ADC_VREF_MV * NANO >>
> > +                     chan->ext_scan_type[i].realbits;
> > +             if (div_u64_rem(scale, NANO, &rem) =3D=3D val && rem =3D=
=3D val2)
> > +                     break;
> > +     }
>
> > +
>
> Blank line here is not needed.
>
Ok, I will drop it.

> > +     if (i =3D=3D chan->num_ext_scan_type)
> > +             return -EINVAL;
> > +
> > +     /* The scan type changes with the resolution. */
> > +     IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> > +     if (IIO_DEV_ACQUIRE_FAILED(claim))
> > +             return -EBUSY;
> > +
> > +     adc->resolution =3D i;
> > +
> > +     return 0;
> > +}
>
> ...
>
> > +     case IIO_CHAN_INFO_SCALE:
> > +             *vals =3D rzv2h_adc_scale_avail;
> > +             *type =3D IIO_VAL_FRACTIONAL_LOG2;
> > +             *length =3D ARRAY_SIZE(rzv2h_adc_scale_avail);
>
> Check if array_size.h is included.
>
I will include it.

Cheers,
Prabhakar
