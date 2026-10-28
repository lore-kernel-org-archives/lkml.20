Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205728;
	b=FcFQzd9d9rTvSgwYWL/3JRYLVqwluL5FVcaMvGqAsDxd7HXhvt0B2fCNctSx32SwuFIH
	 1H8Oty/LTBHtnCIhPoDgAuyGOQsVjslUGbsQ2W0xFcwVjYTDg8U8ILGfMMUExKBEGAuIp
	 rTK9JKFU3ifUuDEsN7JHN4kRw1NH/WcmgOnzYHM1cNqBX5rA6DkkM5AyFbg0B0cgdgRMp
	 p87ZyYNIeLj41hv94vDUfy4urenDSYzPfinKpjXMgoc+zdGBVDOiUVcxwt7yStnUQm7EC
	 dLmFjGSt2kfM44XggL5XEUELHp+lYQw8drPHB/nucwTlj2PEaq2a8IDyPj/MMs+U9Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8aqqOJYr4Hmv6RgN8CmHQlYy+DEU2NSLFnHtd0L0hA4=;
	b=OA5nTActOKyt+4ErEFn8lpLx6xcDSiSc/RRuq3g1lh1mbGxIyebVdNJeI4hs7C68mmBd
	 tpznIOv7eSeRYQrTGKVZG++UqTFGHRKVPo+UelMIsNkHwXjs2w3KjvYuyesLGKRp3KSS2
	 yHh6ZVLElpA1NvWjxSTPF6MfJ6rXQV1XI2MzX2ZyWzvotSb9pzE8tSmJTrXS+PU4z3oiW
	 2L9XuSd9Ookh1fK4djF4M5+LPh+tho64SJz4oQnFP9z/M0PNtUOkiRc4UfkPv7mAxztWK
	 3+qIgrOt78gbUD/iWgKPxFGuxAuxqwN7h4QTtU9HSDB6yRuVutNj8e/P9yoBGZTHtig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FuUKp2dV;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0587D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0587D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FuUKp2dV
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso1290919e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793205726; x=1793810526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8aqqOJYr4Hmv6RgN8CmHQlYy+DEU2NSLFnHtd0L0hA4=;
        b=FuUKp2dVgK29EYIJoFP+0qnkReg68SnBeIYDmT25uB5/pBVCn/yqlbzX5pOEvHop4R
         WGwzkIetRY5s60pdbY3zdgC5u3d8oDYVGAPkF2oqCwWXNEataCkyssbEoZpG50hIbWhw
         svQdbig/ausoK0ITqRKAk/gf53tGhobN8k+No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205726; x=1793810526;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aqqOJYr4Hmv6RgN8CmHQlYy+DEU2NSLFnHtd0L0hA4=;
        b=iU2sgH2ZxYs9zXHl8yklhCMP2pnDzzX6T+TaQoIKLaIboEhl8MLa2d42blQ1s93Mdr
         +5xP53CL3LFY/TwnJBvfqMgZt5soSmtI9gEesKbmkGTwAakccYxN9WHKUG6EwTHCbkEe
         DyCDL/DzDyireR8wQBgovOe222zwSNlwmMEaKDcnIDgli6pJcZtfPYKQgUDXDD1ko1Pu
         O79LGp0mpXOKwACWNPmdf8onpWmw5s7HjK2JiWG2xdBtD7A3OP7WSqIwfRqBs6uNG/hR
         gXGEqnEsYoZlKyJrACjWRcD0dCLcVsJ4XbOU2LDrXiJtvZB5xGO/UFubwL9NYYLsFewf
         /L9Q==
X-Forwarded-Encrypted: i=1; AKwUvBykmPtD4jPPO6wKg/tIcfYZn9HOZ/l9Xrtuvk3lzLurl9Dfjato1pGZxR4InYQhJK3oubapEjPXRvd77zo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHEizBZeQ5Ro2Htq4mxO9ADINXBRlwAt+OdH/7TjwRm7mBZ9U9
	3W/Tf6161SGct8AqhjyRfFjbDSjcsSa6NqencBMEFuC3pX+ZCd8Yq8WDqIsRq11KXAIPcfsxGNj
	pZutMAvPo
X-Gm-Gg: AYBFou2gRcSrcoX4GloWsPXHZtleKmzy2eHoutMRDI5XQNsdLYJDgJpcDDAuWRdJ4So
	/vxauqFSVqGv8BtNX+UCBqnPLyyBNf/X3MdlWrQmbnTOCvWHBkl8mcb3AesuZh+GHGzBV/yXhHb
	hYp3XIvVEGKdI6Av297htwWT9U4GSk5Rs1qwnwFBb9JFw3p8DxYODml0Q2wN7qRCCtCb2nqi/Ye
	ZbOtRk01pvATC6aXfJxLRwVCelNkIVJpQcN2obsphY/pn24+y5gpDZTkNIkOi92cCdSI4ale67K
	I938sIoFVyZThX6ceB8wBHWFd/xKk3pzVTmEUmkr3DEGx0nQ7Sai0y0gBNU8RhVL7HewN5TZbXQ
	rqeN1p7iMyEpbarU6eRrxcNNNYcvQyyIMfvsIwergAiVHhtJAS5Aj4opLSDWUty+O57XpEK99Ki
	WmJ00Uj7WID6n4B8T3JPB9sXMVzd6Xe3bm6fGSt9Eb4HMrdKb1CaaUV28OFziWm+bbz7sgse/9n
	HQT9t6/EUS+f50VSESQs+gVHRMVKYcARmXvqs+Iq5bqF5pT2oxJkXWBE86I1IlbuDFR7CmeeKzC
	9Z4DPFEX8sNDy3t8Ol9ax4SlMsydH0ad/DyW8wSNaMHfBNlJekWqeeuWvAYYGIXC++oLv+fZWH6
	6o70esXjemFETdA==
X-Received: by 2002:a05:6512:3da6:b0:5bf:bd7e:197a with SMTP id 2adb3069b0e04-5bfcad7e2cdmr1142323e87.16.1793205726110;
        Wed, 28 Oct 2026 09:42:06 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca47fb8csm734523e87.4.2026.10.28.09.42.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 09:42:05 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso1290911e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:42:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxDsCRayvhsVDE89QKBzpCPfCp0wlgMPrBiEu5USfhxeDVpL0rYoJQWX8C38+sEe7HuA5TwoYNW8tAOCzE=@vger.kernel.org
X-Received: by 2002:a5d:5f07:0:b0:48b:9d2:1a6a with SMTP id
 ffacd0b85a97d-48e5d45a3c2mr6625980f8f.1.1793205267445; Wed, 28 Oct 2026
 09:34:27 -0700 (PDT)
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
In-Reply-To: <20261027-drm-misc-next-manta-auxbus-v1-3-3a45c3cf531d@a-marquet.fr>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 09:34:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XmfYM8diBOh3UidN7xEuB3n+n9oAm_zhopfFLERC2QpQ@mail.gmail.com>
X-Gm-Features: AclHuK_LwyJo9CN0zxlkO30oKOFraZ6PCLD3VchvtC_WbqyDogSG-WeDzg__Frs
Message-ID: <CAD=FV=XmfYM8diBOh3UidN7xEuB3n+n9oAm_zhopfFLERC2QpQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel_edp: Add SEC LTL101DL02-002 panel
To: tb@a-marquet.fr
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

On Tue, Oct 27, 2026 at 5:01=E2=80=AFAM Alexandre Marquet via B4 Relay
<devnull+tb.a-marquet.fr@kernel.org> wrote:
>
> From: Alexandre Marquet <tb@a-marquet.fr>
>
> Add an entry for the eDP SEC LTL101DL02-002 panel used in
> google-manta.
>
> Raw EDID dump:
>
> 00 ff ff ff ff ff ff 00 4c a3 0f 9c 00 00 00 00
> 05 0e 01 03 80 21 19 78 0a 87 fe 98 57 51 8c 27
> 21 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 14 69 00 a0 a0 40 2e 60 30 20
> 36 00 1e d6 10 00 00 19 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 9e
>
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)

nit: subject doesn't quite fit the pattern of recent commits (_ vs -).


> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 94bc54c3833a..c92985363093 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -2198,6 +2198,8 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('L', 'G', 'D', 0x0778, &delay_200_500_e200_d200, =
"134WT1"),
>         EDP_PANEL_ENTRY('L', 'G', 'D', 0x07fe, &delay_200_500_e200_d200, =
"LP116WHA-SPB1"),
>
> +       EDP_PANEL_ENTRY('S', 'E', 'C', 0x9c0f, &delay_200_500_e50, "LTL10=
1DL02-002"),
> +

It would also be good to note in the commit message where you got the
timings from. Datasheet? Downstream code? Guessing?

I had my AI agent take a look for itself. It found evidence suggesting
the enable delay should be 97ms, not 50ms. The other ones seem to be
OK.

-Doug
