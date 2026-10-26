Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793048604;
	b=lJX/rj3qC6WrvzwMo9C6OPrTgnKGQY/Wa5VUcaqUMrVRW6aKnhymcMYWA8Z8O/Yj3g6w
	 pVWTYgsyhBGUMju2BmS+0RirNBzIHRfKpHtTOLmM2R3dMMIOuwEuG5bweHOJy+DmDvSvR
	 UUQFjFB0Cx/Xr+NBp7BOh+Oo1IlfwAV3NVQMuv71sRRe91e+tPPZqTau6JTGOd5q9Fpll
	 sxQyXjZEdzkvmnwkbUOnUzM0TmrtmJJBabdiFuy1Q0KT+pp5eY6U6TgdAoQwLGt9vW6NO
	 fmE3/msivnDQawnn5lt+oRP3Xk2V5QdRomsJ24cxuH3MEmyDCCuingwrGmQhMkTy4qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dymsYL1VvcFeY1Miiq7ZnoIAQ+NOEvB3M/n82aiIv+A=;
	b=JaDNoqtCv6fhQ2ArY+cX59PMVYz8JhzvVX8HWLvMJFfNK8EhaJKOn74qpOUsvBwZPO7G
	 pz8GE/YW1YLhHIceUyWDprKqUd9Tg5KrK08aseVKW6vAoulkJwUa/gR4I8mH8bvYqje9z
	 s94MZ4Ml2PaRIIDDSN91yEX7rPeMs4RCQ8Z6AHLFdD3nUK8els6RzwVXpD35A6se55oVn
	 9nCUMTzmUfcWXI2zfhFXnaj+2Ot9DXhQb2pD2V5GzOlIqaWH1ixp4hFJbvdo2BAGroVxe
	 arXqfDpHMHfT6M6YGKzs/VcBR2zaCK2f3ynoD4aWW8HukureSyzVz1I7VX1O3BDsIXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J4mmIZEw;
	arc=fail smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16EC606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A16EC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J4mmIZEw
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so3530125e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793048602; cv=none;
        d=google.com; s=arc-20260327;
        b=pyFWi6DYHdo1dAigog/KZrs+4+3yPr5fRtlA975n3nQ6+dUNQtdChmiKGK6vDkqQnJ
         sqSR3h8KTyB89XsB0ZNPMhXpx/6bm+FV1feKoR1E6qb4LTiwL1S11hiyRclcQSTcTWYX
         g9GLcJ9gl9SqDyT+AsiBNqrmYvGNuV5Tw2Rw6kuUOD+5T5pd2lpzARMgHiyWQkcDHerX
         52m++GJ9hL8Z/xwdJQWkffaNjduz4702TgRa/xYiFCer//DDQOAwGfHjbhr0QUi3NT/o
         RP69v1QIgTtUgNYw0ur6Nplarss6j5WWqMeFcNGW/E+y7VhjmCr1zHww70Dmjw/oTEm/
         UowA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dymsYL1VvcFeY1Miiq7ZnoIAQ+NOEvB3M/n82aiIv+A=;
        fh=NX1pviTcm7kZueUP0zAhc9R41NgewFavg2MhMsVx29o=;
        b=lAJPuj7uK27RbO9cl32E7Kjc7SwChm29H1v2ae2QxjfBI7a7Wm9dZhfdAF2Op580Hl
         MtLr3H8FPSJKGu2qSYEpb3fyh0CJ+sMpO+3/YJr4aPyBsF+CMbXpaUsgIVvyytYIGIB2
         m7s4SNASBIEe6b2o3NsYFeoU+vlwkpshHHxkniD3AK8llCGPxG1wWuzo7fWTqHwibor3
         LTQG8k4RSZn1b2k3FqQNfulfcO3wChkYqlOYeVZi/4XfkdQ2QREQHTlmhWhHiP2lZK1U
         0BxewkD784fTcsgmxtduJwITctIxxmV5+dOja2eTcBZQStn3x+mRxowu0ycvKyuBgVme
         qBVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048602; x=1793653402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dymsYL1VvcFeY1Miiq7ZnoIAQ+NOEvB3M/n82aiIv+A=;
        b=J4mmIZEwt4xAZc/sYfig3dP2HTPTMXUowFakzLhqmRtHDYzfy4fKcc/jKzgkWKUl4y
         kfxevcilcAXNLhls9B9ffl7fT5Bx6N+k+sMMLl0VJ/ERgGsWBR20PdjLpa95tLS7KHLY
         fKXBJVAne81Te2GZhpX722UgI2K7eI9ZkmTOXBE15v1e+T8ofbrEQoawaxeNwl86QhS2
         oyEf9TmoDNZmG/YJyOj6DjPD8zpNkbCicaUAxYDPB0gVWeryXW+t8ABqf4+6P/OyDMpt
         WnaF34wsz1SWka93dSpQAUhgd8pU4kECfewoMLk/3alh2NeAdwtZvSJJ75fTUIXnpZTC
         uqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048602; x=1793653402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dymsYL1VvcFeY1Miiq7ZnoIAQ+NOEvB3M/n82aiIv+A=;
        b=RPNYrZelyzuduns1HvbnDlBa9f8MmOoeVBsUScjplgp8PK4Lq0RLHouK4UFC4kRbm4
         gjhjC2/bLeRFMlTAup/9IgQvUN9meKGT+7osxlfcjfVY32GsDldjXdU9x2U9Ydp7OPtI
         KAGYk8YEUI8zb8EzZ75bHnxKWpME0bs87hVf/1sytzCRGUvxu+BIiBtx3xawFPJ3hfIq
         PENB8nu3xCvW35cnzAzqy4Mb1hvQlzr3SZjJE+5nwlKKGLaL62ZAXvYIHCyKAEndeGDV
         po/yxXnT1KbflhHTgjDOALqPOH/QspybMUygMVq4kWSTHVW5YK4vcUtJQ4+5PLVoZmZQ
         2pCQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2TDwjpOceH2TNXJUoF+ZPTGljeqgeHn9zu/mXpayJiCHQwasUoRdmQVnJe8QISQJM1D4F8b5+PFOS7xE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhQDBBAFG32+w/wi0Vj4OP+diauwCJEq0cUc3Kdz3y2didyjCp
	mWI61z+PS8yoOsx94pmbqQfWSOgq8wP2HMLY1pBJpRhikwOqsWLh/3/EW2Q8ySsyCPwtZ281ulS
	rDbydL4tV37dAhmLVijD2RyJB+0KvogI=
X-Gm-Gg: AYBFou24aRmmurCTCryD9xYY0kpjj43momRHU3UKdNhepvW2RWEvRHqLQXcsAOYG4zm
	NpQORtkJTuDmO3WBzZy6MTYpNy5T+SwTfkeZnuFXQ9pZIfaioPZ6l3sTsBK+3lOJAl47UazmC0C
	yfIEXeNpN+eE497q3dUDFxi4NlxRBsgWiHpjf+ZMn59szdv41I12ExkNrn8ycIrl254S48yS0AC
	bLwzkJH2cyAN30vjQqi/fLvO6kQ6s+hJidNSIyYdeZaVef1Ad8gXWDx8NWul0EJtk2ALSSllyT3
	izrrfdXyIubLKCXnxA20uCbFrL85U2e2EfG4271/VWJxDCgcaB20jVgmTVHqE8zT1JiVS09Bw2O
	4sPn90vQZSUcqnkrWIwiVFDkpkbpDiQJ9vvrmADhUzVMta21P0nVKh964vSIwTvLazHntYVSPR5
	n4CuJHySYsnQw2LlOEVXTjRonHT/nlcbZj5w7YtC1LviA4eoaWQ4WRCn1dcw5uOeUhYCxbmGnFg
	gZGig==
X-Received: by 2002:a05:600c:3d08:b0:4a2:1960:6fa with SMTP id
 5b1f17b1804b1-4a7bfec49damr17336865e9.4.1793048601950; Mon, 26 Oct 2026
 14:03:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261023175919.160103-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <atyKo0pTYZyt5XJc@ashevche-desk.local> <CAMuHMdV8Q9UKrpoZuZfDUutrG=bOwcNWLnht1bufv0YVXJPNDw@mail.gmail.com>
 <at8uFFHk7DHH9e1l@ashevche-desk.local>
In-Reply-To: <at8uFFHk7DHH9e1l@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 26 Oct 2026 21:02:55 +0000
X-Gm-Features: AclHuK-DOQOqCxrYWenC1byTCwdE5LPCv_pLXEQMP8Kff__QGFt5Si6oKbFTyn0
Message-ID: <CA+V-a8tL+bqTtub1=nL51CJ-b6RGkRMYNttcvqGbXLRchPk6Mg@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy and Geert,

On Mon, Oct 26, 2026 at 10:40=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Oct 26, 2026 at 11:14:53AM +0100, Geert Uytterhoeven wrote:
> > On Sat, 24 Oct 2026 at 12:38, Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Fri, Oct 23, 2026 at 06:59:19PM +0100, Prabhakar wrote:
>
> ...
>
> > > > +static int rzt2h_adc_write_scale(struct iio_dev *indio_dev,
> > > > +                              struct iio_chan_spec const *chan,
> > > > +                              int val, int val2)
> > > > +{
> > > > +     struct rzt2h_adc *adc =3D iio_priv(indio_dev);
> > > > +     u64 req_scale, scale;
> > > > +     unsigned int i;
> > > > +
> > > > +     if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_RES_SELECT=
))
> > > > +             return -EINVAL;
> > > > +
> > > > +     req_scale =3D mul_u32_u32(val, NANO) + val2;
> > >
> > > But what's wrong with the simple 1ULL * val * NANO?
> >
> > IMO that looks like a useless multiplication, which will be removed
> > again in some future "cleanup"...
> >
> > There is a reason the mul_u32_u32() helper exists...
>
> I don't see that. The 9e3d6223d209 ("math64, timers: Fix 32bit
> mul_u64_u32_shr() and friends") tells a different story.
>
I'll drop use of mul_u32_u32.

Cheers,
Prabhakar

> > > > +     for (i =3D 0; i < chan->num_ext_scan_type; i++) {
> > > > +             scale =3D mul_u32_u32(RZT2H_ADC_VREF_mV, NANO) >>
> > >
> > > Similar Q.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
