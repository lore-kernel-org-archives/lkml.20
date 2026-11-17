Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933344;
	b=cl83e0TMzRObumKskIrn4okL2V0Zh5VuwarUc21PB87+BNDrrWHOLuJ1PpiU00DEV/eT
	 +IljuiAnj6RuAb65WX0+6uJXfDYuyH3mzVhEQSolEB/6Khkpy7pqZjzdV7pevZusZ7d6O
	 JXbk9onp6AU+WtamT5GVqZsxqLRRR1GxbpxetKhyd8DB2NN7TeMOPUEGsGzwIh5P0N3zM
	 qw/+OBCojH6R4ZfLaZ+2yIbvkMljVBqCWvfu/CLH/p5iArMVaQi2grSBY55UXw/mX7OEg
	 1rn/FOnlJwWwjyYxM/yzjTeT8YMmtW7n6hoOVgDm1hbEHP5/tt6bM28/VpAXt2YXE5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=XOOROMKIPXr3CQSNIxjA9uq5C/f3wnb7r92RzJgi0oU=;
	b=cmiV89CBUNpYFytg1ZHHGu6lbfXTgsV3/zlhAA5riHJETWEnyPAKUKWg3cEVIWkS6CKw
	 RtLoIX1Lr13gw5rXBq0hoUDn/jbU8JVuHXz4M1vCZZJVYVr98G1nWJasAO2VX1r0JPT1B
	 Rky/Ow5VZwrndfIh7f8nHHstH9t4gkeAtqSm4RJ+MPM9w79vvoSfOmfEHcoWd2aBQOIgg
	 Y+hUtzvJ58l0bBcvswyjd+EfBgWmk20NYSxBgTVgIKTmUd2F14Qy87k5sP2XuY4ZF+bg2
	 SYvoOK6MStyBk5FatA2NOnw/q19l46pKZL20ABHUVuMBVWgSZfq+U571gHFC6GwyHeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pyE2NEWb;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB02606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFB02606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pyE2NEWb
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so404815e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933342; x=1795538142; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XOOROMKIPXr3CQSNIxjA9uq5C/f3wnb7r92RzJgi0oU=;
        b=pyE2NEWbgjgnRxtgeP8OZzqnjZI0vTosGSDhziGibQl9wqRWYYG+B6fE1fCra0Ta2W
         SJ9w0OkJjdVbt4LPYFO5ANpp1nIvROLiH2YWHFvINYAewueB+LAP9UDempZVvxFPdeCO
         n6EN6zuQO/tiHNNadCcCF//1v0WIBNXhm618Gbpev4tjM05vw9o2xfWQYXAbrQtuNfVv
         g8htTpo0dCMUhIcKYhOEC/1IUWCFIzv8HRMnniRtodST/hN2VLWTsyxaYT/YqFIz4CQG
         20+IJbzgQisouSSacl3m0D9DQruurBaXzbd91L1VDrb5/7shtZRXeMKFA3kytpMJsWQv
         muUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933342; x=1795538142;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOOROMKIPXr3CQSNIxjA9uq5C/f3wnb7r92RzJgi0oU=;
        b=DN5st2mQKkuYJkDkevrAhTdiM9ISnnw/TdcYJbVYk/14OyczSkoctpuYrenlN5lhmG
         XDsyn/nz/IAhyWDC+Emn2NHUQHl+5JWUFPhm6wib5m+TWeK5aE6tPO6ix/BmxQhPGC1X
         63QPqJZ64lSANzREPkPbvIW/nvlzHAb53YxE9+KYdxJzQjJnYsX+3yNVROpr4Sx1eerd
         62R6CRwr9rvb+rIk2/UTsRyUQjSijrH3TeS3RgRDXa2WQR6VT8G5bOhNlsgaWgOXwuhq
         ylH/At7r2cdJkb36/1hQDEGYjxyvSsN0Atl1oxCFwj8AbpRhhyfWSDCh/j4/hhOXZ2+f
         VHVA==
X-Forwarded-Encrypted: i=1; AL+hErH2nnj3ao+MgZH3JfSNKjgezeKWRQHzUUjh3flNvrj4KWZ5r21DyLW2qI9YGaDR1EOWR1Kwwj+OYo6YsA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BXrBAfWxMuGFzzEl/PLdz2jhb7RCz62XWPNuJ5B180QcHIgwa
	nKar+eh4FK3OZ6B7/8bLhWnTatv0hs+PciVCLIz8jnTEXn1gpsNguCpe
X-Gm-Gg: AYBFou3kJqveyeFW3j3YDVEqyiodFaYksXmfxn/UQ2LXtS+cVmHxTC+61LP8yMz9Ien
	DGpDUEhR79xKcFO+mR6nV/wBj/yWtGO39Nnp1dSBF4eG8qvvk9l6WjiN5N+zdztGKe0AOPq/oFs
	66HUE4+JtuDhe9A+FSWIGY1yQc/TMzgbs+mz6CLJ7p/yw4xLkzgYB/gW+X3k0It//WSPJuFcIRz
	OZuA4j7Vx0zKB9qmktteFx0yFYGZxLkzzzm/KwgfObfmQUT0RWSobo2PEs9hlZveuXVSBYb0yI0
	+OZ4kzghFC327AY3in80Ftag7mAZzD8z46doJDOy/XoD6K9MieneOq4Uv2iAsjPQ0hmk2jqfaAq
	z/h+H/Q58+GPBE0YsJ+eG/Pf4M0OIcfh34BT4avBeNEw1zkO56VVGLmextAd/M1gHEbzbxaxX0T
	/WrJYoieHCuhSaUJ2D4oWjYACvZhWSYTPM+D/5eQQnFXaLDfzl8ZI6eRcT+ADf8vpEg06LPThE7
	Pj48FBoD5ACm2I+WxljcWaOEXtERm4APD/CYGQLtfnDtuQQBQVsZcPzmJT95F14WefHmBtcbw1n
	y3ZtxaXBnEy/T5C8Ct+F7EtEaMKwJeqSvNGattVBKmEKRaDCP10bxuSHj9sUHeuWsk0ywLTBQ9c
	lPtmy5mQYGo7wJOkxaCilkzIg7O2DzdUciFfQA8QYeqgne6+7HqsSGqpn1zLr1lEx1fHO5gVdeG
	nBwbVIs7gLRvfJpKyRq2nDe5NPpAkPbDs+xJd5kYeXU+7G9g11nnClYf8p8ROIIlwPHGE7buNVw
	lww+M4veW+MqXUplObAm71L8Wc/eulTMAr9GZrMN9BHW0oa5UxCxdWzKjs=
X-Received: by 2002:a05:600c:620a:b0:4bb:6991:2330 with SMTP id 5b1f17b1804b1-4bb69912526mr176343095e9.22.1794933342249;
        Tue, 17 Nov 2026 08:35:42 -0800 (PST)
Received: from jernej-laptop.localnet (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm28919970f8f.12.2026.11.17.08.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:35:41 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, linux-sunxi@lists.linux.dev
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yang Siyuan <hsyysy@163.com>
Subject:
 Re: [PATCH RESEND] drm/sun4i: report coverage pixel blending for
 alpha-capable planes
Date: Tue, 17 Nov 2026 17:35:40 +0100
Message-ID: <VyjYt3XHQ3e42-zx5UUDfg@gmail.com>
In-Reply-To: <20261117091932.12063-1-hsyysy@163.com>
References: <20261117091932.12063-1-hsyysy@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 17. november 2026 ob 10:19:32 Srednjeevropski standardni =C4=8Da=
s je Yang Siyuan napisal(a):
> Linux 7.3 added validate_blend_mode_for_alpha_formats(), which warns once
> per plane that exposes a pixel format with an alpha channel but has no
> blend mode property:
>=20
>   sun4i-drm display-engine: [drm] [PLANE:35:plane-0] pixel format with
>   alpha exposed but blend mode not setup. Please fix.
>=20
> The mixer blends a layer using its own alpha channel: ALPHA_MODE is set
> to PIXEL when plane alpha is opaque and to COMBINED otherwise, while
> BLEND_PREMULTIPLY keeps its reset value. That is straight alpha, i.e. the
> DRM "coverage" blending equation.
>=20
> Advertise exactly DRM_MODE_BLEND_COVERAGE on every layer that can expose
> an alpha format (UI always, VI on DE3 and later). This matches the
> existing register programming, keeps userspace behaviour unchanged and
> satisfies the new validation. Premultiplied blending would require
> driving BLEND_PREMULTIPLY and is left as a follow-up.

The subject says drm/sun4i, but the DE1 backend planes (sun4i_layer.c)
also expose ARGB8888/ARGB4444/ARGB1555 without a blend mode property, so
A10/A20/A31/A33 still trigger the warning. Either handle them in a separate
patch or say in the commit message that this one only covers the DE2+
mixer.

>=20
> Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format wi=
th alpha exposed")

This is incorrect. That patch only added general check. Drop the tag.

> Signed-off-by: Yang Siyuan <hsyysy@163.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 13 +++++++++++++
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 14 ++++++++++++++
>  2 files changed, 27 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index 7d894e1eb..ef059ac47 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -283,6 +283,19 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct d=
rm_device *drm,
>  		return ERR_PTR(ret);
>  	}
> =20
> +	/*
> +	 * The mixer blends the layer using its own alpha channel with the
> +	 * pixels not premultiplied (BLEND_PREMULTIPLY keeps its reset value),
> +	 * which is the DRM "coverage" equation. Report it so that the blend
> +	 * mode validation in drm_mode_config_validate() is satisfied.
> +	 */

Above comment doesn't add much value.

> +	ret =3D drm_plane_create_blend_mode_property(&layer->plane,
> +						   BIT(DRM_MODE_BLEND_COVERAGE));
> +	if (ret) {
> +		dev_err(drm->dev, "Couldn't add blend mode property\n");
> +		return ERR_PTR(ret);
> +	}
> +
>  	ret =3D drm_plane_create_zpos_property(&layer->plane, index,
>  					     0, plane_cnt - 1);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index 92dd5a97f..b6771576b 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -470,6 +470,20 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct d=
rm_device *drm,
>  		}
>  	}
> =20
> +	/*
> +	 * Only DE3 and later expose pixel formats with an alpha channel, and
> +	 * the mixer blends them with straight alpha (coverage), same as the UI
> +	 * layer.
> +	 */

And neither this.

Best regards,
Jernej

> +	if (layer->cfg->de_type >=3D SUN8I_MIXER_DE3) {
> +		ret =3D drm_plane_create_blend_mode_property(&layer->plane,
> +							   BIT(DRM_MODE_BLEND_COVERAGE));
> +		if (ret) {
> +			dev_err(drm->dev, "Couldn't add blend mode property\n");
> +			return ERR_PTR(ret);
> +		}
> +	}
> +
>  	ret =3D drm_plane_create_zpos_property(&layer->plane, index,
>  					     0, plane_cnt - 1);
>  	if (ret) {
> base-commit: 091b06388b117fefdcb63336ac09956a4914b961
>=20




