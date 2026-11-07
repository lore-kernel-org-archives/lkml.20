Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794046521;
	b=ysnRGuuHaPFN07h1IX4CpFnd1SGVOVEPhdpegHlVDhHu2mrgvW6m6Wy2/rUqp6lVwi9X
	 QRnb1EG7VvXgiP+9Jp44uZVFuyjbd2wSqCYgJwe0HqAj3rWygn1O9GyxrrvKLxyjPJ7Dr
	 XZKHiXVmFQ60kIIYZPUmvx8yi+g/0AmBafvMBHGW3oQpso7diywft2GkKD44+8iymasAU
	 wS01ARFyd0CEZMgpYZn57Kz7OEQFVoLCb+ww3YrmxuwTiHbGsyAcOi6lpP30yF24QzAmd
	 yN2Lw8INeRg1sWb2S5j+K0b5iNEBgI94uYVHZCF6sQVoljimNu7POgrCPGU9YY/Wy8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SfEg/fc/vfw/G9raoRVqHQ8kPtY/AXMaqrz2jbU8BRs=;
	b=rF6jmGjyYcYE36i5M+gTIWJ4hmI1+3zGL2r1ccjKdJxzNB7EoEE66bmCux2xy/8Us1b1
	 axAz1ft494JVXbgywTOlOmNGozCVcsbdcuDlLmGCSTpQLFNiONVtt2WQHwz1FuB+AOzTp
	 6XFHcMZ2/PUUykGnKuCNW7n8qZ234vRzc5TfjFssEYFUy/QNYUxLhR6nUxE493LU1dPsP
	 YUR2d3xEHGZdvS0TBiihBeesID94lHUqJKqTY21w6CHZH2DATgBHK1zja9r373MKHsD+Q
	 dmN48K04biIWiLMtC3RBMPnhlz/CTxG2GD8agDvvTvHZjB8Dl9/pic51/tTQ8dOcnqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BW2SPxge;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3776A606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3776A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BW2SPxge
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2234373eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:15:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794046519; cv=none;
        d=google.com; s=arc-20260327;
        b=XvOZtlqt8PXI0UBnvBkPc1ei4dk8Bx2CjksjMIsRW1PmgMI2nFfcuaHJcKj6DOjOAE
         Fe9usazJTAeAlP4gFtE1br3Lk5NxvR/iZUcII1r+eyM2qWWAIU8m1jSiOsBdjtKiijnG
         lh6wMURSHZncb/4MaO5Q/8/+/F32DoYr1PpxqLcT8wN5owbmLbAkgDVlzZL5s4J7WjX5
         aaGEOmlkfq1Z+IETBTPqJ+NzrJl/nkGXFlBnoj1OzCZPCD8gGc6OqBnbbhpsFCvuOGN6
         e6ejR2+pr6ejky2X+0MsjPQ4NN8Ut7DaNw7cXlfkT/vQnpbvdzZr+KiopB52b2D60p/3
         aYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SfEg/fc/vfw/G9raoRVqHQ8kPtY/AXMaqrz2jbU8BRs=;
        fh=ABjuIbTP4xezvk2s2iHyozm0ybE/S9GTHzZuSXNXR3M=;
        b=qPF7UhV1fApkQwK6Lv8M+Cw3G0kzVspQXxRjYNmtS1CEsXdVAcmZB2lZsbj1DnHoy+
         Q9b5djEV7fH452ir3HIv09z0n7ljR4CSDxWjK0/puOoL/5cCmYk0tTKX6zk9yp7UKCdo
         CzJmfhv2dxBzYBJIWNgKxdz0pgrGgj2oeHy6ztfBBCpy0GGyg0lmctlFBIFyT7I3ahOG
         4X1le8pgGWqBsA8pYX48WgRpRAdAQk57GCAB7sqN6qAB+dayB4Lw3ekgqp24OdCPwRHC
         n6x2xUYiVHhMVv04hcgB+C4Jzme726FsUwSfvPUJ22KlTWQ2Q+9z0BhTRTorxnX7wdl7
         OfMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046519; x=1794651319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SfEg/fc/vfw/G9raoRVqHQ8kPtY/AXMaqrz2jbU8BRs=;
        b=BW2SPxgeH6GNv0llAerKRF1J0sLqceoIo3AJWiCKAq01ctoZFx1dIHkyNR+miSJ1YS
         66Yg3/qBz0XtbZocHj1+EXVJWBJ/tGJ9wIZsxuxflZJRHYmj8wcREpnghANefDuG1eT8
         SCvPnaoIDkZ7m65u+6DORUIN/71ApWO66Fc4BKeyuGurcEsoL6zQfANXeqW9zBRQrJ8p
         GkXL/nDORVdfzlUIMzeImv0HhV3htj1CNgA1KoL3PN99ucyzCNsyv6NLbLRqa84lxKBj
         1ReR8oAlxSgNmukJbD9NGTUPwLFj2zz2N3iW1tsfDQuy72jWlDB/y9N0FVfooY+JR6Na
         QO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046519; x=1794651319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfEg/fc/vfw/G9raoRVqHQ8kPtY/AXMaqrz2jbU8BRs=;
        b=wZK1QSHr0oeDzNbiMcWkL1ivtBZ8bLY6IhR0sL0pn84DbdOPRYTdfKQJz7hYBVrbtN
         UThj7oX+SAVeSxgbxloDDcCr+3KzMMgkIDe20E7uSkEeQUakNswQWwa+b1aiE9An2Yek
         Pd3jitV12unAJ6vSFXdCdD6PFzu4mtu1cydCPqd6k3eFg1C9eoZPtG3Z9iLuG7L/wh3Q
         GK2dL3CLxrJg1fZQ+O+tW5oO7rs9VeAjCwldzpX2ABbtuP0kGD+mdWT8z0YeXmWvKH7R
         qz5bTkHROOFef9BICwBYUkU5iHH1qlsDw9zrzmt4wYfU+JmoHh7BdiHvdGqA9ynpTSkp
         e/IA==
X-Forwarded-Encrypted: i=1; AL+hErGq0f6fIrZlBGWVuqVhhyql8egZvNRJFeKYXyuM9A+W42HLB2slR9OYO415sRjaGgr+p09LqCqQoWin5vA=@vger.kernel.org
X-Gm-Message-State: APuU4Z819c2vFSodZf2YKU/kpNaxVsoRjKafWPPLuvpspiT7cmUsDdFK
	SEzfV53lpqglrxm/M8+daYRzezzLBviACs6U/mkWKu71/ZHbkbttyeKbltZlNK/NndZVmF9on/h
	IMkaDSFw5ErK9EysassRNrvhNgGXKRus=
X-Gm-Gg: AYBFou2OLdE8VSM6L+CFum9Dm0sZIlLbFs8QQDpQQ4xg5lNgHZ8V83+Or1pcEBb0CAS
	dW6eFGgzo/cPWzvrs/oOjD36VRZuProl2dNoVIR8W62civiSMKLb8rqyOglVtNGigrKrAr+bIn0
	Oy9XaxRPpQvazSfn/cbwE0lx3LpV/YxtAyrEsSoYezXIDGSwOSxWxgOnNku53hEZbfGgANywAAm
	SOrGwMaAo4WnLtP1Z743DgyuL8q61M4eMHj3/gtpe/GV9h7TKTVViMf1qbekhzvyN1RWS0665Ev
	dA+RORI7YAG3fsGY8u7EbyOuhUgWjWoTgCHPKHKzDHVZM7dKBvvxmDmOfaaNFN6zb4I7c/oem5N
	SRuao47SGOyakaLJyPk+m+wH8c7ordyPIqsmdNxNyadIvd2RRSzFwXFKrWvss4pg1BFV54INwrf
	2S0XdvDWQwJTMj0poUSjf1NetpT0AzmQ==
X-Received: by 2002:a05:7301:19c:b0:36a:1427:3933 with SMTP id
 5a478bee46e88-36f76118d3cmr6774338eec.16.1794046519121; Sat, 07 Nov 2026
 02:15:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106091943.35783-1-clamor95@gmail.com> <20261106091943.35783-5-clamor95@gmail.com>
 <20261107033340.64062192@jic23-hlaptop>
In-Reply-To: <20261107033340.64062192@jic23-hlaptop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Nov 2026 12:15:07 +0200
X-Gm-Features: AclHuK-zTWTUAmCD08h0tHSPAfGIz6D9Rp3d1t8XRONo6MH1Z8w31tM46bHSFks
Message-ID: <CAPVz0n10N6PvBC5AL=nT+fUGsONtuzTZvzSYqAXP_eWWb86nuQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] iio: light: ltr501: Add support for the
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

=D1=81=D0=B1, 7 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 05:33=
 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri,  6 Nov 2026 11:19:43 +0200
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Add support for the Lite-On LTR-659PS-01 proximity sensor. This device =
is
> > nearly identical to the LTR-559ALS-01, but omits all elements related t=
o
> > ambient light sensing.
> >
> > Add a no_als_support flag, similar to how no_irq_support is used, to
> > isolate ALS register access for the LTR-659PS-01, since ALS registers a=
re
> > marked as reserved and interactions with them are discouraged.
> >
> > The ltr501_trigger_handler relied on the scan index to identify channel=
s.
> > This approach is fragile regarding channel status flags and can break i=
f
> > the index is not strictly set. Switch to checking the channel type
> > instead.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/iio/light/ltr501.c | 73 +++++++++++++++++++++++++++++++-------
> >  1 file changed, 61 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> > index d5ce6468a229b..e7762115df913 100644
> > --- a/drivers/iio/light/ltr501.c
> > +++ b/drivers/iio/light/ltr501.c
> > @@ -151,6 +151,7 @@ struct ltr501_chip_info {
> >       u8 als_gain_mask;
> >       u8 als_gain_shift;
> >       bool no_irq_support;
> > +     bool no_als_support;
> >       struct iio_chan_spec const *channels;
> >       const int no_channels;
> >  };
> > @@ -192,6 +193,11 @@ static bool ltr501_has_irq_support(const struct lt=
r501_chip_info *info)
> >       return !info->no_irq_support;
> >  }
> >
> > +static bool ltr501_has_als_support(const struct ltr501_chip_info *info=
)
>
> Is the helper bring enough value?  The !info->no_als_support
> where this is used seems clear enough to me.
>

Noted, if you are fine with !info->no_als_support I have no objections.

> > +{
> > +     return !info->no_als_support;
> > +}
> > +
> >  static int ltr501_match_samp_freq(const struct ltr501_samp_table *tab,
> >                                          int len, int val, int val2)
> >  {
> > @@ -656,6 +662,29 @@ static const struct iio_chan_spec ltr301_channels[=
] =3D {
> >       IIO_CHAN_SOFT_TIMESTAMP(2),
> >  };
> >
> > +static const struct iio_chan_spec ltr659_channels[] =3D {
> > +     {
> > +             .type =3D IIO_PROXIMITY,
> > +             .address =3D LTR501_PS_DATA,
> > +             .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> > +                                   BIT(IIO_CHAN_INFO_SCALE) |
> > +                                   BIT(IIO_CHAN_INFO_SAMP_FREQ),
> > +             .info_mask_separate_available =3D BIT(IIO_CHAN_INFO_SCALE=
) |
> > +                                             BIT(IIO_CHAN_INFO_SAMP_FR=
EQ),
>
> The sampling frequency applies to both channels here. I'd just make that
> info_mask_shared_by_all
>

so IIO_CHAN_INFO_SCALE is separate
and IIO_CHAN_INFO_SAMP_FREQ is shared_by_all

Noted.


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
>
