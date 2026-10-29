Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793316466;
	b=x2R35+h/XWGw6NxZQwYpNL7axxdOPze1J/6hfqFGRP+XnSnpHfAdlkmrAZG2zN4SyQxQ
	 mZLYEQt73U+Fizbb4wBsaegW5sGe5Ou2nldWOquWLszD/usG0HaR4UY9pP+AV2bGr/771
	 N/lMXqnPJF1EpDp0b3AGxYqD+nSmuHZt0n9ObrmeYF/I+ckyitTbKMY1BFJQcczuuegoA
	 iqpeAKwfxUHhf03D6IsslftbtY0ldx1/RSIqO+/qdhx2hJLDSv3BBRoJPpUM2MHTiVT8R
	 NOGAE3wULV1o/0NXjqv9ON39gkzWyZXI8pEs53jIVmWuZx8oUxw67LkKcIbczf/aaqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793316466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lnVNxxbt+qbN8QJ5DPYiLdQeqrQxagvjKYBjiz3eH8c=;
	b=oqrtd7z91EOP6SjxnZ25YOtVvxuS2w6Pk0ivke6XW/In+vUahFyCauwvi6EzdP7MOlI3
	 3NCNiA6Mjpbil2GWJlv0XZb0ybQcm0j+6qwMRNtTSmoYYeg0hInVdtdarjwSyrvaaPAVp
	 cwcGe837Uxd7HcpEy3Yw40Ah0Ti/Hjp9pI6bdBI7OaXxTL8WBZ1LF820nPI3obsHuSGpA
	 MdhCIEaVyKb/1MFdpmVTKev/K9oJgAeV/Avm3ywInw3GpCOpAVE0Dojjd+TBfFHREAFa+
	 vO/jhq2ajkxaTd8QGZbUr7Ir21Ib22wQLjIfpzzz79OsEogWdu8QD62Eck/qGzl1rBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FFIH8Pyn;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE46606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE46606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FFIH8Pyn
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c423b145922so7110166b.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793316464; x=1793921264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lnVNxxbt+qbN8QJ5DPYiLdQeqrQxagvjKYBjiz3eH8c=;
        b=FFIH8PynhS90ohFt8NszL7d+2GLNvGDgIx9tReXn2r9K30Qe+tB1P1J+8yaKrcXtbC
         DRxI1azGG/SXurW1z5CS3PH3jFdlyxMeUcUjjnPK+9Xqg6dtIXPYTkUaWCbZOlabxT6t
         S9Nx503GvUEyZk1UxVGarNaPS/+JQwClnvzeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793316464; x=1793921264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnVNxxbt+qbN8QJ5DPYiLdQeqrQxagvjKYBjiz3eH8c=;
        b=zV9D+RriEVVPS63gVN47SRaIdizXuuuhflOafOQ64aglIT+P9Xduy5ol3FjpjO18mK
         7++hd9SbhpRJXTUKRR+pQDexNtN5AfY+Dwhy+i2gBXwCHBh6QNBFtzGhdYbmD7YDwFhx
         0SUjwJxjeyffOTqQB3tGacPB5K26HHVY462ltqxputnOxIfXoBhEWo0GwgdIIbG+QOZP
         Y8XMN84QXYeiGcAQRhVixcMdTOdC/IlPaK/nFaUUEHHCbG/yvunstXWVxTcKa7fd0rr6
         lpmrjxAm2c0W5i4IzZWtWW4pgUxbZekscjh0jmTkbBInxJxxfhhVtCqx1W+mlaiLcEtp
         di9w==
X-Forwarded-Encrypted: i=1; AKwUvByXCHZwBRc0/ed8TDiF+vk624g8BAH5TGpXxUqku2Z7pghJKHRWCgYBqVsYBIJrRkdybIcdyE2xquhEL5s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqSDSNWfh0CR6kMdyO9G4Q8slgCz9fMonpRpMeHgeVI+26669Z
	vpGhaG2rvlJNG6VtQQFONABao9mT1uPdr+6X32SwNLJmRklX90bVLZfPfKmG6zpRPHNPeJ1Ul/C
	7Tv1LcFoJ
X-Gm-Gg: AYBFou1oJrWwMmpImvEAl/N2loVD8EfgSYjqk9O6F7PtttDfWgdpPwlS/oUAOWhmKKr
	Mb5n3crCfbPlIrIWD/BoWyjWvzOlU9crMn/+z9jIYhjoWIPGSIU9O3EeBb8O8DKE8vNot1ceXrE
	8p6QP6ijdEaHSXSl63h9wyWFO25cO9NpjDyFvL5jXYBRuU/aP2Q8u+7IfSV67LbrdXpnxMAhRqV
	sNzwabgXgemmSKYrxRv3tUKfkOEfXUra/uahosr8nL8d5dnLbyrwO2IBxZkYRmUzJfCLvac7qXm
	zLV82XR9EmEUmWOMr9KMmbWDE/j9IqKZZv3ztrjw2+tRUZuk0mD4O+KzeoXG6C04tPy+Mo4N9MO
	J3hzGlnpFAW4nrqgDXRBgjXxE6IQxpG+TN6wv1RFeN3rcn0MmLhzQlACMM8gJvnp+eYC4OYzPLb
	Hn1ViT8FUld6EuLlbUcOmN69fMN+D0+r2/n0Hrz6w3ulItyX4DqIR59TFeDtXZFRdfrm8asY936
	v2LoBj6/n577JXUuHcMiDaxK8ZtyhiVXOS151szCMsAN3kF+tEbDhwX4qcQLLD3s34aIMykX6HN
	alP7/JmIkPM6Fr3LVXPZeizrRM8IeCxzC53lGRaAYO9v/Mm+TavAJ7zlHpsdPMoMfFLm
X-Received: by 2002:a17:907:6c17:b0:c41:9228:baef with SMTP id a640c23a62f3a-c4ca7a54fa0mr48708766b.8.1793316463785;
        Thu, 29 Oct 2026 16:27:43 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4caa37afd8sm10363666b.41.2026.10.29.16.27.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 16:27:43 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso879675e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:27:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByUTg/XlTZ5g0ijaklVGoTwKuUWm0Obclzo2/N8hCrdEcwnlqxLoHPCwxyC5E04dybKXN21TB09pVUSnjs=@vger.kernel.org
X-Received: by 2002:a05:600c:4715:b0:4a3:598e:e7a8 with SMTP id
 5b1f17b1804b1-4ac150b28bamr10449115e9.4.1793316462561; Thu, 29 Oct 2026
 16:27:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
 <20261027-drm-misc-next-manta-auxbus-v1-3-3a45c3cf531d@a-marquet.fr>
 <CAD=FV=XmfYM8diBOh3UidN7xEuB3n+n9oAm_zhopfFLERC2QpQ@mail.gmail.com> <auOyxKTuSNysAA3X@laptop-218>
In-Reply-To: <auOyxKTuSNysAA3X@laptop-218>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Oct 2026 16:27:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VV82NG1CAL9DtLeDYQdjC9Su6nYfLYbjzmhzEY9a0JSg@mail.gmail.com>
X-Gm-Features: AclHuK-RAnD-cE_PStAvE_4zQkeWnl1muDgR4l5_h3nIFbUe3wcXyeLuhes_lRY
Message-ID: <CAD=FV=VV82NG1CAL9DtLeDYQdjC9Su6nYfLYbjzmhzEY9a0JSg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel_edp: Add SEC LTL101DL02-002 panel
To: Alexandre Marquet <tb@a-marquet.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Lukas Timmermann <linux@timmermann.space>, Henrik Grimler <henrik@grimler.se>, 
	Hendrik Noack <hendrik-noack@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 29, 2026 at 1:55=E2=80=AFPM Alexandre Marquet <tb@a-marquet.fr>=
 wrote:
>
> > > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/pane=
l/panel-edp.c
> > > index 94bc54c3833a..c92985363093 100644
> > > --- a/drivers/gpu/drm/panel/panel-edp.c
> > > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > > @@ -2198,6 +2198,8 @@ static const struct edp_panel_entry edp_panels[=
] =3D {
> > >         EDP_PANEL_ENTRY('L', 'G', 'D', 0x0778, &delay_200_500_e200_d2=
00, "134WT1"),
> > >         EDP_PANEL_ENTRY('L', 'G', 'D', 0x07fe, &delay_200_500_e200_d2=
00, "LP116WHA-SPB1"),
> > >
> > > +       EDP_PANEL_ENTRY('S', 'E', 'C', 0x9c0f, &delay_200_500_e50, "L=
TL101DL02-002"),
> > > +
> >
> > It would also be good to note in the commit message where you got the
> > timings from. Datasheet? Downstream code? Guessing?
>
> Both downstream code and guessing, as I could not get my hand on a
> datasheet. I will add an explanation to the commit description.
>
> Basically, the downstream code waits: at least 500ms before toggling the =
LCD_EN
> GPIO for power on; and 200ms after. I matched the 200ms to the hpd_absent
> delay, since in panel-edp.c, hpd_absent is also the delay that happens
> right after enabling the LCD regulator (or toggling the enable GPIO, as
> appropriate). Similarly, the unprepare delay is called just before
> enabling the LCD regulator, through panel_edp_wait(), which matches the
> way the 500ms delay is used in the downstream code.
>
> For the enable delay, I went with the smallest value that would still
> work, but I admit that I did not try anything below 50ms.
>
> >
> > I had my AI agent take a look for itself. It found evidence suggesting
> > the enable delay should be 97ms, not 50ms. The other ones seem to be
> > OK.
>
> In the downstream code, 97ms is the delay used before setting the
> backlight on. My understanding is that this should be used elsewhere
> (e.g.: in the backlight node of the device's DTS).

I don't believe I've ever seen a delay in the backlight node of the
device's DTS, so that sounds wrong.

The .enable delay here is described as:

/**
 * @enable: Time for the panel to display a valid frame.
 *
 * The time (in milliseconds) that it takes for the panel to
 * display the first valid frame after starting to receive
 * video data.
 *
 * This is (T6-min + max(T7-max, T8-min)) on eDP timing diagrams or
 * the delay after link training finishes until we can turn the
 * backlight on and see valid data.
 */

That sounds like exactly what you're looking for, no?
