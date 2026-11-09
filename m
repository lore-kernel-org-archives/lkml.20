Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794201788;
	b=oXvbaxouRvsGn9tcg7x+ppKeHxacJpdKw+kANr/t5scCW7lhS75zmjkExlyNpWz14xDa
	 //USwk35ciXeXVNACqm+jsaMDgLH1/qpEsoSwk+v1d3IZE7x73q0BPgG+gSt8CnfWUNqW
	 yTSmiQiBDejvCisrlgWaONm2W1K7rtt0Sw/N54BhVRiRLVMyTJVFrBQINq0A5KvaZJjOp
	 b3heVYFaY9ZUAwI6ASwKLpfVTJTEVUTU4dqiOO2Z3dXghxzOG0KP8c0YauhcF+EM2vuiK
	 VViH1VtEgQVSzkT16sJax0eCUAxgvgjIHgIleMPkLkOMkdzL2X/KAgm8jINYTb6w3qQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WIf0dJI3704E56UOzqLD2NIWJwb6NLuXPSl2wIJw8fs=;
	b=SYrfPNOhw5eBsinw6XoKculQ90wcOAN3l+57Eh1NyOqcCHKJNgxKDezLDFjerx9t3h0F
	 KIBjkZIuCsQYgvhoOsCp9O4etDaqsubK1MR+BlESBv1ph6P/41MKEq6wHOj9yBQZy0Ba+
	 8A/6sIvDCWbxhA820U+18RwRa/QO38fegHfzzaAp6kd4JhN42tQ32+Wyj7PCAHFfTdbWR
	 BWwi0aCsxBYMqUP6aSqVqMkmlkVc0i1dsq4aofm3nvxWvhp/aPRB31OjMlZOeTv2GO2JE
	 ab1N3WGlSaUa4LoMc9dKyCg3s258vABJ6cyeVHd5LSX8nl+TBub8HPGoQTAD4zihP2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=beAqg+sY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F5E606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F5E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=beAqg+sY
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c49c32650adso62451866b.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:23:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794201787; cv=none;
        d=google.com; s=arc-20260327;
        b=ajKd/Zo1JIYgkIJCRdSsaFMHWicNZa00gvo8Y5ynRr8/jKQfTuSNbEBf+7SQmK8bZa
         D2NKnfXBrKDMFRfhUtvE1vQbkP3zmPeYeLuU0i6nyo+fhljYuKqOOn2kwh/V14UuLKZa
         rWTDAheqons8Xaf4hs2qGF/YUhreaYJQs7cxywG1tR8HQEjrudVkE7UJzxpQRjPCVbnz
         6DXH0NpYG7Ho+tIjgU+oZ8vNKiSn71AkW/AciVLPN9oKzjF0A0yd12FzRFpFwlbjCFaC
         d+XlaaUZzftxu4KTnnDYUaKlGSipK3OaLw3ncicbnE/UH2vQBn99EajE+T72S16FFXBJ
         /RCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WIf0dJI3704E56UOzqLD2NIWJwb6NLuXPSl2wIJw8fs=;
        fh=YBg3PsORLV3kCCjLya8GtdR9a6u6H8k2EK8qAgFZPxQ=;
        b=rXGb/cvXBz6jqs0HvBsMwMP2kF8Z9Q2gCT3r/D7a69O/xwQYh0QuAsoa93Orafz/VF
         ahQ1AyVaWeNSPrzh7Ib8IfeUDjWHqVq0kXj+ulVwcXtQN4m37xEz2bQkUCmeIYNavWsd
         g2rQUiIkFREODEpDQesBQW0KpUqHJf+LMqnoZtRJ/jDiFKtaTT6jFl+y1g+VSPgZLu+d
         CJKt8FqdsBOrnZLNK1UL0tp+ioeOoX6gOyIdPwzeFTsD7z0TwekCNZjqUHB/Qgp7WCX/
         HLZlrj2nFSaXfQGwzn2j5/yxuyvCR/FPNpONg5E21y9BG2QWnWWzyE+nj4YczmPXJoYj
         Xm2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201787; x=1794806587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WIf0dJI3704E56UOzqLD2NIWJwb6NLuXPSl2wIJw8fs=;
        b=beAqg+sYyt9qCgMR0MefwQJHBP6F3SNo43T/wNyMBSEtHybyQhjG5gUFzzxSyuxY9t
         lOP9HNFhByeoXGWnyFtmQtJGoKbvYv27Fc+IImspICCuxHoOxsqFgtvzTrLVv0a2kRxt
         gcafF1RMy0rM41sE5/qBa9epTQEYsDyWEk0iM43/fVSDGODhDxrWHItr3W4F1Gt5rXE5
         w36K0YBsoNnk3P+PgGkS29t5KyBzL1BIZd+eKDGeAflsDuiFMizH/mtF4JHpYVKZnSR0
         jd31xfSekQQmsH2hD1qXZXAiVeBQ1SVw5ZrDj4yTcoZ80x5UJ5GoUpcX1d95e/8AoaFU
         TwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201787; x=1794806587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIf0dJI3704E56UOzqLD2NIWJwb6NLuXPSl2wIJw8fs=;
        b=rkCW07HIaNQHpJDoRWs1HvMsW0OVRag9sN7JvJGX1cbCnElbUo9BvbhpTPzLGCN7N/
         hlTqQb3LTxA3XY73Q0NkwMx4hFqMaYRoyVxYw9PPrdq4E2dnKesnrzJ0tGwlne/aamHy
         X7LcpHiVxRItUFVnfuhgRHa2DgTK7mPONbHMbnxm1JJXe9t2weQVi7EdXHIDPxzbtSOF
         E6yyKBmjy8iVNCKjj0xkefDr9R/elTgNd/4VdNWsVyn+wcdYI+VTYuxZfmsMivy1jinE
         bMRGmKEAAVOXEH/CL0Gr0MrFqhTmnAromN5WPkwf6QLN6ege5fATfQVplvlq3qZXCCxL
         Hn+Q==
X-Forwarded-Encrypted: i=1; AL+hErEj8Y8EpDCxzdGGHOKL/jy/SJqgl0VPPQHuU0K/9Me3NjfzzvD2EGzRAMJPjgUUkz3qs/AFDpqZuc3B9CI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S7iTzIm4Gca6FHX5+GCZC/3AmHwns7kWomVPIHIZ5MEQqVRAY
	Ap5nSymA7tefK7yqUNFbqLiUM2sGqZ9H0nJOOi3E1pmWZli96GoT/aCRWVFdGMQOyszAV3jws7B
	ax8zdoRzDHyOXKmTCNzLo2Ei0beL+NyY=
X-Gm-Gg: AYBFou0wvlcCpxR1vtbHD7WHAAEsx+m4WbEEzB6xLFjejv+JGpr5ZuN3My6XFAbCoUx
	mvSZxkn+JdtSqeTRnH3uT3UjtL/y6J49oCBbf5ToVJ+PiVeBpmAXOeUDUsNVU1r1yhQlF/F7D+E
	3VKDkoSV1J2t1246j/cZ0nB7PGX4rW5/dBXlygVeghXbG48AICgiAXJ1jqW4+wt/M1fIjqDaXEt
	vau/clwxc1rumRusDGtXBR+k8Wmx/Ay4Aj6hHI5jHizg97DPznF7rdBlIc22BGz0cVFIpy9yXDl
	t8RO5yWwZyNydcuZT2vTskah7k5REtQqep56T6YoJjDzkTKoV1kE7U9vJCr/gL19eFsgxWnQPY2
	gQ61qGcKRBeb4bSoUwJNyUlMjikDziMPPwi82I5vJh4XdQpc3+reAs2KotlIxS9iXZP0N
X-Received: by 2002:a17:906:99c4:b0:c40:80eb:c541 with SMTP id
 a640c23a62f3a-c4d6d162393mr200408166b.2.1794201786662; Sun, 08 Nov 2026
 21:23:06 -0800 (PST)
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
 <20261027-drm-misc-next-manta-auxbus-v1-2-3a45c3cf531d@a-marquet.fr>
In-Reply-To: <20261027-drm-misc-next-manta-auxbus-v1-2-3a45c3cf531d@a-marquet.fr>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 14:22:29 +0900
X-Gm-Features: AclHuK81atJWOGvLDgXq9hG63fw54it5ISsaMjIoBGuiYyjTASlvmDvAtFTGEpY
Message-ID: <CAAQKjZNBb4CnhBn-TSD=8zbrOtWbu7fdpJDjOOvfAZQmAhNcYw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/exynos: exynos_dp: change poweron/off to encoder enable/disable
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

2026=EB=85=84 10=EC=9B=94 27=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:09, =
Alexandre Marquet via B4 Relay
<devnull+tb.a-marquet.fr@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Alexandre Marquet <tb@a-marquet.fr>
>
> Current functions exynos_dp_poweron()/exynos_dp_poweroff(), that
> supposedly powers on/off the device, actually only enable the encoder
> clock. This cause issues where poweron() calls fail silently in
> analogix_dp_probe(), leading in some cases to a state were the encoder
> is never enabled but the rest of the driver assumes that it is.

Moving the FIMD DP output clock control to the encoder callbacks makes
sense. Analogix runtime resume can occur for AUX access before
encoder->crtc is assigned, so its power_on callback is not a reliable
place to enable the display pipeline clock. The DRM atomic helpers
call encoder enable before enabling the bridge, and encoder disable
after disabling the bridge. That ordering keeps the clock on while the
display link needs it.
The change looks good to me.

Thanks,
Inki Dae

>
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 40 +++++++++++++-------------------=
------
>  1 file changed, 13 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/=
exynos_dp.c
> index 82c238829921..16b00aacd55b 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -43,39 +43,27 @@ struct exynos_dp_device {
>         struct analogix_dp_plat_data plat_data;
>  };
>
> -static int exynos_dp_crtc_clock_enable(struct analogix_dp_plat_data *pla=
t_data,
> -                               bool enable)
> -{
> -       struct exynos_dp_device *dp =3D to_dp(plat_data);
> -       struct drm_encoder *encoder =3D &dp->encoder;
> -
> -       if (!encoder->crtc)
> -               return -EPERM;
> -
> -       exynos_drm_pipe_clk_enable(to_exynos_crtc(encoder->crtc), enable)=
;
> -
> -       return 0;
> -}
> -
> -static int exynos_dp_poweron(struct analogix_dp_plat_data *plat_data)
> +static void exynos_dp_mode_set(struct drm_encoder *encoder,
> +                              struct drm_display_mode *mode,
> +                              struct drm_display_mode *adjusted_mode)
>  {
> -       return exynos_dp_crtc_clock_enable(plat_data, true);
>  }
>
> -static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
> +static void exynos_dp_crtc_clock_enable(struct drm_encoder *encoder,
> +                                       bool enable)
>  {
> -       return exynos_dp_crtc_clock_enable(plat_data, false);
> +       if (encoder->crtc)
> +               exynos_drm_pipe_clk_enable(to_exynos_crtc(encoder->crtc),=
 enable);
>  }
>
> -static void exynos_dp_mode_set(struct drm_encoder *encoder,
> -                              struct drm_display_mode *mode,
> -                              struct drm_display_mode *adjusted_mode)
> +static void exynos_dp_enable(struct drm_encoder *encoder)
>  {
> +       exynos_dp_crtc_clock_enable(encoder, true);
>  }
>
> -static void exynos_dp_nop(struct drm_encoder *encoder)
> +static void exynos_dp_disable(struct drm_encoder *encoder)
>  {
> -       /* do nothing */
> +       exynos_dp_crtc_clock_enable(encoder, false);
>  }
>
>  static const struct drm_encoder_funcs exynos_dp_encoder_funcs =3D {
> @@ -84,8 +72,8 @@ static const struct drm_encoder_funcs exynos_dp_encoder=
_funcs =3D {
>
>  static const struct drm_encoder_helper_funcs exynos_dp_encoder_helper_fu=
ncs =3D {
>         .mode_set =3D exynos_dp_mode_set,
> -       .enable =3D exynos_dp_nop,
> -       .disable =3D exynos_dp_nop,
> +       .enable =3D exynos_dp_enable,
> +       .disable =3D exynos_dp_disable,
>  };
>
>  static int exynos_dp_bind(struct device *dev, struct device *master, voi=
d *data)
> @@ -171,8 +159,6 @@ static int exynos_dp_probe(struct platform_device *pd=
ev)
>
>         /* The remote port can be either a panel or a bridge */
>         dp->plat_data.dev_type =3D EXYNOS_DP;
> -       dp->plat_data.power_on =3D exynos_dp_poweron;
> -       dp->plat_data.power_off =3D exynos_dp_poweroff;
>         dp->plat_data.ops =3D &exynos_dp_ops;
>
>         dp->adp =3D analogix_dp_probe(dev, &dp->plat_data);
>
> --
> 2.43.0
>
>
>
