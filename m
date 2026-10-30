Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793403439;
	b=dTVfU9rtkl+GfAqyX0rJ6RzpPDc8ikXh3AIh6nGpj5LvKtGDZuflba8GMibufj9IPzPL
	 GdfMNAc54KRV3lxStkbJscrfrAcigrMbzqshd18HtIfaiI0cX/S+Zs2/HzSGIImXrfbPr
	 Fm04wRQfqwgO24w7uMtAp5VhgZ0iSWkIwRoFCJPL6go7Ihpt6oCt8x+edxMEW0PqPjdnb
	 Ig2rQ7DnUj7L20NCh8QdqaaLpzUu9omYRe6rIoHzDH923kNw1CRrgPJaBCAPb/8tx28mu
	 YGrRFMOP4ZGVjko6kGQHjTNQH8GcYVPZbF6wkFNpFUObGcIVv0owDbnnbECUI5xonmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793403439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F6RKSKoXJzKlNaMzDigqrXvD7n1HyX5zOJi75UDgxuY=;
	b=4nwiV6ol8tr378Q+kyz0fMkWgRcp5OLnL7luy/XWELbFXDDoXnw9LONmAxPLpOSveVT2
	 Ya46CaxFIoc+af/iOdtT9ExzRYt73dB3DWwEfewOw52vauMXRCfASyiTBnEZxUVyQM/M/
	 z9v9O/fIgaJrg6+vYDxEZRTuebhsA20+c5S7Z7ItgWgyR96gSd8biiOfzHIsGkzNr6z6j
	 JVwcPiJ4kcWJFCWBEco/uZhd12y6Kvg/JH6fvkmapdkZX6HYtapKWsX33PxWG/I/lWEzj
	 FvSc811wYo4BWCVdH32NNKTvPCVj2ipkYa/EnnfX6n/wwVWRecWPvBAg7qHMW6/EQUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lnUTUPKF;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FBA606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21FBA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lnUTUPKF
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c423b145922so162913766b.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793403437; x=1794008237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F6RKSKoXJzKlNaMzDigqrXvD7n1HyX5zOJi75UDgxuY=;
        b=lnUTUPKF7jtm4bNVZSqE/Ot/eTSG6vN+f64jZGSqvhdyrQt52vXglka+uJlWY78eb8
         MguJJw8l4F1na/LNaOrm8u6RfGnzQqSTO/TwOmAbu+bLSsvrUTYOvacmNnwg2cZvzH00
         V/vrgP/hlWgrFHeblMxAQzTxdj881AWQZgWI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793403437; x=1794008237;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6RKSKoXJzKlNaMzDigqrXvD7n1HyX5zOJi75UDgxuY=;
        b=ROyyW+9oDP26xxo5rVTeOv5IFCtmdbNuPn2iGA1aQP85LUa5Y8YHMeDJgfxaBBkoNW
         Y34GTHnBKChH6EtYl8kCMktIG1avcAjvOJK2uW7CQP/3yyxwu6i4aoIOXZO9ABAShmmD
         3XbStw0PRNGZwWkQZuzirdpB8JxJDGWTdwAbjlX71AuGPuoPdXcpvU1E9vQWMkuDOCOg
         jJqMJKYy7raHRLV5XL0xYmSeZTLs3/dIQk67SKG5oq04+SxGbtbntkjssUHJHc9tBFbq
         AdYkenUjJahXC967682B8qyhSlwCWdNqG6NZM/mMmNVlTEcqtKJqdtrjw64VIdiRy45G
         aZ4g==
X-Forwarded-Encrypted: i=1; AKwUvBw994mH5i10FhRcYvQus2S5Dv7/sBbQwbRJ/xFmFX/YyCETgX5aNK5VRNqxaVjzgfPZEYpRGs4qeTBjCdY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgSUN0NJEf0kjRFRRAvpvoBW6mnY6n86ewDyd/muZ/rYMOE6aM
	5AhgHOtHCOVXOvSUZ9GTW6eWJvky4DBHR6M5VvgC55bDilupVaZiD+e73A7i2Zz02Bf17UbW0Fm
	OgE6wGA==
X-Gm-Gg: AYBFou3eL6Q1U+7VEPbTxlvuUZ+oi83yGxuXAVLSoV4qP1Lph1G578JuQnVpyzGJh1E
	1/NdKq1ZTHhmCMKhfVl00EGm9kjIK8ArmWWrh+jz+yO4tmkPkDrweFFnDQ8oBamonxN7O8NlDze
	qbOjyXQWyhelc/2m1DAkivEkGYJcyck9B/PXm2ARE/GcdvqFsDKl1sMHVpvS5JhHIj8U7qzCOdw
	qHTtNaNEZN6NlA0pA9xn4WNgq9M3Y9zGU8BvU30Q0C+sOp2PntkOP4pulUB28gKgR4NCBk3FQvt
	SL3sQSRhNY175W1aZGHK80POeJw5Dhl/W9GWrV9TOFpsGJZgHJ8a+PjPL6/mcdaBuOYAoO1cLTv
	m5rq9hnVlOl4Dfi2sZr5LYb4bekJX/FrlZp2hEmObcJ3PJg526F3ncgxJrPEtXI27Q+4V8NdAME
	5/zjL7WrzEL0Y2AknEczxJIMgkn/FiFfyfn6PZXhxz+Vvb/ccEzlI/qt8ftTQ6voF4j0FEJTFwS
	3mB0REwBwVeB6MCtK5wmuJjGHM3hl4jw9MYNHhaESd7ZAJI7dH5B4IOGZ7O3Gl0hsezB0LiHaNy
	HiUguwaHqIcB2KfYiIIumpBEt2RHMt3KPM3W2+9uN8NX5nZnJ1N9UpMr0Ti6c5TeAKPs
X-Received: by 2002:a17:906:c145:b0:c49:9632:9280 with SMTP id a640c23a62f3a-c4ca7af1510mr341930366b.46.1793403437524;
        Fri, 30 Oct 2026 16:37:17 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf0bfa2sm115410966b.80.2026.10.30.16.37.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 16:37:17 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1201466f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:37:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxqZb0nGtKck02ixFdUaA96t2+8IbX5pYEuqDCbjqU8z2WwdgKHpHvn6LBd/ltnnWOd36zAac76EpXxC+8=@vger.kernel.org
X-Received: by 2002:a05:6000:47d4:b0:48e:60bf:4177 with SMTP id
 ffacd0b85a97d-48e6e3024f2mr6586994f8f.9.1793403436187; Fri, 30 Oct 2026
 16:37:16 -0700 (PDT)
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
 <CAD=FV=XmfYM8diBOh3UidN7xEuB3n+n9oAm_zhopfFLERC2QpQ@mail.gmail.com>
 <auOyxKTuSNysAA3X@laptop-218> <CAD=FV=VV82NG1CAL9DtLeDYQdjC9Su6nYfLYbjzmhzEY9a0JSg@mail.gmail.com>
 <auUTV87eElVyIeTw@laptop-218>
In-Reply-To: <auUTV87eElVyIeTw@laptop-218>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 16:37:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X24gZgixqSb4SoD2wYt93Z9tDO5dyaeg=jdH4wUwk81Q@mail.gmail.com>
X-Gm-Features: AclHuK-J1ggLxz07KiiLvF7KuKegFXEk98IgNkkyMHaorZ-92pfQb4x0ipGnZnQ
Message-ID: <CAD=FV=X24gZgixqSb4SoD2wYt93Z9tDO5dyaeg=jdH4wUwk81Q@mail.gmail.com>
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

On Fri, Oct 30, 2026 at 3:00=E2=80=AFPM Alexandre Marquet <tb@a-marquet.fr>=
 wrote:
>
> > /**
> >  * @enable: Time for the panel to display a valid frame.
> >  *
> >  * The time (in milliseconds) that it takes for the panel to
> >  * display the first valid frame after starting to receive
> >  * video data.
> >  *
> >  * This is (T6-min + max(T7-max, T8-min)) on eDP timing diagrams or
> >  * the delay after link training finishes until we can turn the
> >  * backlight on and see valid data.
> >  */
> >
> > That sounds like exactly what you're looking for, no?
>
> Indeed. Also having the 97ms value from the downstream code in .enable
> removes the guessing associated with the 50ms in my initial proposal. So
> I will implement this in v2.
>
> Any preference as to where I should put the new delay_200_500_e97
> panel_delay struct? I was thinking after delay_200_500_e80_d50, but
> I noticed that the delays are not strictly in alphabetical order.

Yeah, it's a bit of a mess. Probably they need to be fully sorted as
you said, and I probably should have been enforcing that all this
time. If you wanted to send a patch sorting them, I wouldn't object.
;-) Otherwise then after "delay_200_500_e80_d50" sounds fine.

-Doug
