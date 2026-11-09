Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794201365;
	b=H1hu+MAJiTwUoc3QE71DhVnteJHzn88GBrxm5UhkrtniZI2ATC7mqT2D4kVjmzlrF6tq
	 EjEzlhm+aCpAIQoR47YNE33LU1Hjx3BSGjylcTbdsMGDxLJgsGa651eGWGqUa9fsXzy8g
	 4ejXwx4SbbTQfJT6JsSuGpPeSwwDWZNUBrP/tru1NurElkuzTs9waOH3FpqQBq1JZqDqj
	 +wsydSfo4Kbh4aMZG8DahJQVKXU1CZAJ4ByTnq0vvkkAkFY8qCpZP75R0Op4fsRv1UrO8
	 GlcywR0yvZOdKESEZ5OBAizfBKEY2cXnb+DYnnD4Yo+8doisNrinPigdBD+8LlfK4og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+H+W40F3xi/JoWhY4dp3q7kYo1VTM28uEFHWyVVy0qE=;
	b=dImDTDK8/1/hbHqR5iRsdmBiovaVvQDwEESVZBMwYJLh7uyg8RiVz2F7+mGONfbbqd/a
	 rIa8bAe+agf8+j+0pvRAPclim5VE5f1xoFzBss+1xtlISv0jLswMb6yf2qybOrQ2pi0zy
	 0PmgcJ53FQmIsFrLIvozof+jduHpyd/Wrw3wBzwUJdkAIbUEcGykDfkxHsUE7gp4h27jL
	 XOuKgtSWqmCUKcWBYO+OVJcSONMQRV0E0UaBOb46+er8i8Vhs/Uprir1QF2pJuj0fWzK6
	 H36dJmc8NM60qxgolXQL72+z0fWJJb2BgKXfP46uMWH3HS0kIAGl0FaILafM9O1getg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mIMuVG2Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34037606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34037606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mIMuVG2Y
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b7245ab5e2so730766a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:16:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794201363; cv=none;
        d=google.com; s=arc-20260327;
        b=gNFW2NX/M4QZw1hGGMkFM15rbDVnwzoUmAX0yVUOmno1mgf9fbBV1edOSS07r6rwpO
         wcPtJeX2llER7V2/DsMdPBeBfUruNxgOzUoHXD07C3RncrHE+cQeX4vM7LfqRVPqR12f
         3g4NMn183QtG/9D/Usrihg1FFyhRTMXqJwDfD6R0xjJT79hCLZuASptcttezLSxA0NsB
         5hB/x95+3nQPzLMkQFwQeqaAyh4AoTRlSExvBfimknjy1NLl1dHNdB/GW0+/8ufOKTmD
         ycFFLYWAcOYFU2yUPQ1j5AnBapuMI1w1J/7GPzkh3FdTIoZUtbaI7jAba/YD17FtgCh+
         UlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+H+W40F3xi/JoWhY4dp3q7kYo1VTM28uEFHWyVVy0qE=;
        fh=F6g72TQpdFxI0dRdKb/Ik6o+xMVoPzaTymOgqtsZ8gw=;
        b=huszJijX5YVM+B3ujWIezjRv7K9akD2ny9ISYPqCUpqwMO9BKEX6rvgY+tvs2aLpOq
         9BsEV7nJMxHeZNEr/+bTn796qLWfHWVVzrApkWDQguiyyhQIrHmeYvH7HQa1UvGVYl8J
         Ukmm0RnGVPpaAmoBFFWzzYuzc+cVwFyGCz0tBwk8NzecFjLOoKwZDaBWDpckd3L4ZwDK
         3zEkmMKPKnsbmb3c8FEzSOEP6CUxH9a1pQvZQDxffhNYtOrGiqhB4B0BCIoOaVvb/yIv
         fKUHqaAyupBVkn1zYXKahEcE49BcO3hqAtSY4MXzJoF6R4vh4OLGmX2t07vwQtQM+sFE
         qGRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201363; x=1794806163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+H+W40F3xi/JoWhY4dp3q7kYo1VTM28uEFHWyVVy0qE=;
        b=mIMuVG2YwmZ8iUvr/GAIe5SAepM+Yl9wDfEGskmrElhinADuN7UP0oU+4Yj2h8z1VT
         Ulw/3Jn7tgkuJfrqvOOXhH+0MAcezdrJ6ToJSkMlJ8rZzYQOVXOQ5XiyfEOacOsRWExE
         ms6hxIopqYLt4ynVaYn9JkElOJZId5lwmWGv99wWWkroM0LacH9zz4dMlgQxUQQA7FEB
         p0TfzbkYd3qcH18l9PDZ5jxJMwKMPrGrxQmM0/bzQZuHf/6vnAO3Tnz+LhZO2F4V1jbJ
         ICRhftdon/DBDjwcbaDCQPSYGbwyY1yORYGWZYxGW+EVna+CAkmICKoMN1MQ9+Rz7zcW
         oqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201363; x=1794806163;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+H+W40F3xi/JoWhY4dp3q7kYo1VTM28uEFHWyVVy0qE=;
        b=yDZ0/zApPxB532rM9qrVD6gZACBlR6aEFwd7ZeAkrpDiziBgYvVqGND07kvvV6GLSZ
         Ro2IfTtWCWMUPrlmlyxOuLgKbNJlM6LbU8o52CJWGKc9fMk5U+8PR3agLL8MONuxbesq
         1y8CKA/br8z1hsQa7c6vEedtl2SJ4iHERY+L2qmJXfHVqHtGQspZV5M4nUHEcofl9eRB
         BKJ53BC8hvWYADC5Asg1paMSh632/4BLB34GuxV6+28aFVJdu1TxltbprSToLuMoYdZJ
         K8i0QlrKmf9iBJQIYbkTNjMXZuHhGb5dCAsPNYVGtOkn1qzmjngbKb7jQMWUzVxLZXmF
         3+vQ==
X-Forwarded-Encrypted: i=1; AL+hErETISdzEB+Nz68uY4CBgA5p1y5mxpoFOWQRzHFT/bWUItd6KgqOV4AHz0sNG6YSpV5e5bRLiLIIYlCvBz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UEsdJ7HFiGhklnKzA+nME7Q2n/hA9Q7iWKqIqapLoZjgUjWid
	UCUXUCvGMCdVc67pSdsd44QXlITNuDsOM17tdZvhsCNlUO1toTwg2noiZlh1umFSnKRok93N8Xi
	uZxxJzctXkfB/GEuWT/pPL/LWeTpDfuY=
X-Gm-Gg: AYBFou13CXpIN2f+vW7BwHC5TvVYAIQO+zPZTbIVjR39RO/WX01dISQTN+Fq+t+UOVh
	zNKey96z7MO76mLD9PFvfnBHut4OlugBO/cjLQkFwc96PlcKaHIUWY8FDS0REEtsN4ZwBbC+9YH
	HTQOjH/iybDH9d0Vb8+BddM+13gNFp5vUPwBaiyg3akcy0d7IWPM/d78zeUXbLVHBGtaKFl7Wbn
	oM6jOgJJ6h4hrH9qnp1uDyheio0ZbskyzAVg8F0/NjHfWywJmrF1/v8pPrbqbV7etN62rPBk2Xs
	nKTrfZWyzWWbnrGTQZt4GLmTXpJ758BZhLiP43OyKnNqKkFo+JD2CvrqsHFS5dniPiI9viCECEC
	b10dg6v0rd40G76ChGVQPugysHzTAjaOAEFUukHboB8kIu5XnhX95BVQCFP0mIb653d0=
X-Received: by 2002:a17:907:94cc:b0:c48:a838:c17e with SMTP id
 a640c23a62f3a-c4d5278459amr332595566b.14.1794201363497; Sun, 08 Nov 2026
 21:16:03 -0800 (PST)
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
 <20261027-drm-misc-next-manta-auxbus-v1-1-3a45c3cf531d@a-marquet.fr>
In-Reply-To: <20261027-drm-misc-next-manta-auxbus-v1-1-3a45c3cf531d@a-marquet.fr>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 14:15:25 +0900
X-Gm-Features: AclHuK-Znic_YSiZSxmlzXLOPryrS4zIPNf3mp5uhFcTlxhpKBhiJT7EHmt8c3E
Message-ID: <CAAQKjZPYAn98+8Wtjesr7GCh1s_pX8mWizW=HoY5Pj9xO9St=Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: analogix_dp: deassert DP_PHY_PD on
 power-on for exynos
To: tb@a-marquet.fr
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Douglas Anderson <dianders@chromium.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Lukas Timmermann <linux@timmermann.space>, Henrik Grimler <henrik@grimler.se>, 
	Hendrik Noack <hendrik-noack@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2026=EB=85=84 10=EC=9B=94 27=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:17, =
Alexandre Marquet via B4 Relay
<devnull+tb.a-marquet.fr@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Alexandre Marquet <tb@a-marquet.fr>
>
> On exynos platforms at least, calling
> analogix_dp_set_analog_power_down() to power on (with enable=3Dfalse) CH0
> to CH3 or the AUX bus currently produces no effect, unless the function
> is first called to power on everything (by setting block to POWER_ALL or
> ANALOG_TOTAL). The reason for this is that DP_PHY_PD being asserted
> (which is its default state) renders every other register bit
> ineffective.
>
> This is particularly an issue for AUX bus initialization, that tends to
> happen before anything else (e.g., to request EDID), and thus, before
> anything has any chance to request a power on of the whole analog
> section of the chip.
>
> This commit allows analogix_dp_set_analog_power_down() to power on any
> block, by deasserting DP_PHY_PD if needed.
>
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 19 +++++++++++++----=
--
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
> index c1344a3f013a..9f634d4e4793 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -256,6 +256,19 @@ void analogix_dp_set_analog_power_down(struct analog=
ix_dp_device *dp,
>         if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_data->dev_t=
ype))
>                 phy_pd_addr =3D ANALOGIX_DP_PD;
>
> +       reg =3D readl(dp->reg_base + phy_pd_addr);
> +
> +       if (dp->plat_data && (dp->plat_data->dev_type =3D=3D EXYNOS_DP)) =
{
> +               /* On exynos, register AUX_PD and CH[0-3]_PD have no effe=
ct if
> +                * DP_PHY_PD is asserted. So, when powering any of them u=
p, we
> +                * need to deassert DP_PHY_PD first.
> +                */
> +               if (!enable && (reg & DP_PHY_PD)) {
> +                       reg &=3D ~DP_PHY_PD;
> +                       reg |=3D AUX_PD | CH0_PD | CH1_PD | CH2_PD | CH3_=
PD;
> +               }

When DP_PHY_PD is set, this path clears it but leaves the bandgap
power-down bits unchanged. If the register retains 0xff from
POWER_ALL(true), an AUX_BLOCK, false call produces 0xcf; both
DP_INC_BG and DP_EXP_BG remain set. Could you check whether AUX can
operate in that state?
I suggest limiting the new handling to AUX_BLOCK and CH[0-3]_BLOCK.
When the bandgap bits are set, keep the other blocks powered down,
release DP_INC_BG, wait as the existing POWER_ALL(false) path does,
and then release the remaining required bits and the requested block.
This also avoids changing ANALOG_TOTAL, false, which currently only
clears DP_PHY_PD.

Thanks,
Inki Dae

> +       }
> +
>         switch (block) {
>         case AUX_BLOCK:
>                 if (dp->plat_data && analogix_dp_is_rockchip(dp->plat_dat=
a->dev_type))
> @@ -263,7 +276,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 else
>                         mask =3D AUX_PD;
>
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>                 if (enable)
>                         reg |=3D mask;
>                 else
> @@ -272,7 +284,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 break;
>         case CH0_BLOCK:
>                 mask =3D CH0_PD;
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>
>                 if (enable)
>                         reg |=3D mask;
> @@ -282,7 +293,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 break;
>         case CH1_BLOCK:
>                 mask =3D CH1_PD;
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>
>                 if (enable)
>                         reg |=3D mask;
> @@ -292,7 +302,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 break;
>         case CH2_BLOCK:
>                 mask =3D CH2_PD;
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>
>                 if (enable)
>                         reg |=3D mask;
> @@ -302,7 +311,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 break;
>         case CH3_BLOCK:
>                 mask =3D CH3_PD;
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>
>                 if (enable)
>                         reg |=3D mask;
> @@ -321,7 +329,6 @@ void analogix_dp_set_analog_power_down(struct analogi=
x_dp_device *dp,
>                 else
>                         mask =3D DP_PHY_PD;
>
> -               reg =3D readl(dp->reg_base + phy_pd_addr);
>                 if (enable)
>                         reg |=3D mask;
>                 else
>
> --
> 2.43.0
>
>
>
