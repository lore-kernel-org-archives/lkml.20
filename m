Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47BB3B4404
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791130673; cv=pass; b=G2j4TBFDZ39k5ivPEKuSPcbJ0x0ctJvNPFCfM6dqRbUuO2tWTKQyT3O0y3+Bb3fdvc0nVGtGqac4gNt4nCMpZmlTACFs6fOrumD/7uljNhthDySTUvcyZpUqnY43Z5MbrDcPwNZurk/PZhGv5RlXiElRGAXOv6uuDnfLrJw3RGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791130673; c=relaxed/simple;
	bh=k9pXf8maS+y9Iv2VCxa5Upxa72qTSFtba18SXktEYbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbnesSvc6gDFFmScUvgleYDqRmqW8EqQ3X5azxXV5EYRZpLj8Jtj6f9WKGLfq9QqPg+mfs3qiJtLxOlt28ACHEzT849xvNZg9bf3A6rvA8vFQI9GquRSKAfNnpVybz+E7zc4kPLRanHToE6FpJl4QYflGeIHXKg68OR1Q/xjtmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cwJra1GA; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cwJra1GA"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-6762de1c77eso561393d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791130671; cv=none;
        d=google.com; s=arc-20260327;
        b=HySm+iaF6OVBZLMmAXla3CjoUzCqt4x1vPpHUbaXnMwmerb4FGdAXZzjHT8YbEO8WX
         59+RWZX0m7mu5rONsZyOpUwHwTjUIcE05JfiOmrTJ5XMBnqvIdHNn44HpOj8Fqi77aAP
         TpjN4C4whXhHNPWRTrRkKJKD/udcHL7S7Yy2cjPcupjcnyniPOUWiiBeusnFTtxbhS1j
         mg+kUdgzRMTJJQJohV9lfm+0whepX3L8wCUJWEVnCVOGhJ/TBqyfeodElQuDCxPyXZhf
         gT3bS1nazzIK13NUU0RBMcTy/Bb0TgbzmISURHbVFkcMmTzeQLySsZHseiZ9dUTiHV2r
         8OFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/tchJIk+lKINiAanpGCL5WbtkLidxV2OcRDCiQWNgmo=;
        fh=VWnG/tnnXSZWerXxVBPR7H9PD1otUpPesiw/9oKh3Tw=;
        b=OmD2Q/AYmuqVUoRYkIy2+ED7JTvml6LbeTNjqIWhlv+1ww+be1qSPdYUl3EZjT6JOk
         wC30I1TzN71v98TXQOEYOsNte2EMx8zcbkOkJMANry/ZirE0W1QZw5ytGJQtqzk9kJzR
         WEqsZxmnbWTw7H3UKywpZdPQW5IrXeP/fhakpGQBGAflJ7mVxZbtB+HFfTDoCW4h9KHp
         qqtoJfnYR38vOlesqsdX/nMsZKfDJYxdYe/vqQtSPOBGW7Y7nFwANKpOoz2yN8HbMjoS
         GWHrrxiSzaqcoTxXY1PTxc572SpREu0OKTofSJ7eHwaYS2g5mqvfu74duedRQloPfnnJ
         T1/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791130671; x=1791735471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/tchJIk+lKINiAanpGCL5WbtkLidxV2OcRDCiQWNgmo=;
        b=cwJra1GA195R8dJWHGy8COxD5ZGQ3lGCG5IyYeX7hX2ipTjZiOCWF5gAS1NEW1Yf5n
         xmX4OFs1nXHs5RRdjYXM2araVuMn/+MfdP3xnYWQwFZ2uCddsP0ZMixxO1gV4jc+QNA4
         L/0qUPt+30mhwpXb/CS1B2CUraX5PchOByfZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130671; x=1791735471;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tchJIk+lKINiAanpGCL5WbtkLidxV2OcRDCiQWNgmo=;
        b=PgaLGuwNViuKGXb55A2xDHPmnZcU/oVBUa0Q3xlYe/6M/agOluL7B3v5K2VHY7twzP
         /Pdy/nDhL57rk9vAgI6bW5Qml/bvTr2nUPfA9s36rN9uY6OaE6lUoFox/sQXcORnjv0t
         mbi64qil4SVcaJ1mvF0KwD2sxXWaJdNlPlep7mA8piW6M+HU0Z75l/ti7wZzTW9zHrJk
         zE9l4ycrcbQ2vgohT8mI/LEhQ+aOkMpJshnF+w1yijEDct+LZI0L9KzXJ2gyYVUOsLvp
         32Vu38O/MFCd7jFS1K8etDhg0e/5rcC+7ZE/7bADCcMSSvOyBRscngM8aF6ITds7pOYx
         lRNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLOJawyVfQdn9MjBjS9tkOHw+YRYJ8AvVGIjyTMy0N+whfZjWwmP7vISP7J9cjNsWWZHLFqRrvEiUYYAs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpPHPe+1IqF7vcvi1nu3IkdyD1F0eu58kgqlI4joZX5JwjoiAI
	HoQKiOVowCykvsA67/Fkf1JPBbLE3McYR7JQ1zsU+K5LS3NiIlRi/4nHxbE6Q7pLP823SoimB8M
	47lFhnBmcv7fwgy4NeMPBUBOG8oOjsU/6jDSsmGFl
X-Gm-Gg: AYBFou2eSZ6zO3tDre2+cUtVmNjSiwxLZ+xsQZrrEzLivcT4POS/kDPZn6RgCBh3EI5
	udnehb/YxEt6z47zqfPYH45Ru+PqwH8k1tymVzzg5uwWlxkGDkmGedRYyuEOFAlJ1W+RV1ab2YW
	56YVBaNiz+E5IX1TGkUNBj7k1ysGWuCNEGCi4CQvp3kILOst5mdZUl3pRHWRer0fGUktSgZ60L4
	jb0u4Ka4mosNhOImLuOdTyRucugKtR/awblhnETG+AFBGprLH0WM7g0Fke3T/r6Xps9wy6TUsDd
	DYWiOJKy4mj6O+zQNo2aFZKjrRRpq+L8t6TN8WGU4SbP7l+BlNyOMsYd
X-Received: by 2002:a05:690e:168a:b0:677:af43:e268 with SMTP id
 956f58d0204a3-677af43ef66mr2978859d50.113.1791130670771; Sun, 04 Oct 2026
 09:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803135249.2898083-1-wenst@chromium.org>
In-Reply-To: <20260803135249.2898083-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Sun, 4 Oct 2026 18:17:38 +0200
X-Gm-Features: AclHuK8AbiOI1d3O1oMAtq-YB9tfgZCN1siOUfw9uTtQBVIHV68l-lLxUKSjvHc
Message-ID: <CAGXv+5FS7gLB7-koaPKMqjtMPjOSWguW9NN_tS+8Wi2GTSHYEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: Set supported modifiers during plane init
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 3, 2026 at 3:52=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> The exynos driver currently checks the modifier in a helper called by
> the plane atomic check helper callback. This check only concerns whether
> the selected plane supports the tiled format or not. This is tied to
> the plane's hardware capability.
>
> Turns out the tiled support was added around the same time modifiers
> were being plumbed through DRM planes. The latter provided a way to
> describe per-plane modifier support.
>
> Add a field to the hardware plane capability struct to allow adding
> an optional list of supported modifiers. This is passed to
> drm_universal_plane_init(). This also allows the core to generate
> and pass to userspace a list of supported modifiers for each plane.
>
> EXYNOS_DRM_PLANE_CAP_TILE and the existing helper are removed, as the
> check is now down by the DRM atomic check.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Any chance someone could take a look at this? This drops some redundant
code.

> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 30 +----------------------
>  drivers/gpu/drm/exynos/exynos_mixer.c     |  8 +++++-
>  3 files changed, 9 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.h
> index b126cd129944..ab0edb826261 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -92,7 +92,6 @@ struct exynos_drm_plane {
>  #define EXYNOS_DRM_PLANE_CAP_DOUBLE    (1 << 0)
>  #define EXYNOS_DRM_PLANE_CAP_SCALE     (1 << 1)
>  #define EXYNOS_DRM_PLANE_CAP_ZPOS      (1 << 2)
> -#define EXYNOS_DRM_PLANE_CAP_TILE      (1 << 3)
>  #define EXYNOS_DRM_PLANE_CAP_PIX_BLEND (1 << 4)
>  #define EXYNOS_DRM_PLANE_CAP_WIN_BLEND (1 << 5)
>
> @@ -112,6 +111,7 @@ struct exynos_drm_plane_config {
>         const uint32_t *pixel_formats;
>         unsigned int num_pixel_formats;
>         unsigned int capabilities;
> +       const uint64_t *modifiers;
>  };
>
>  /*
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/=
exynos/exynos_drm_plane.c
> index 5c04ef87e400..31f5f0941154 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -174,30 +174,6 @@ static struct drm_plane_funcs exynos_plane_funcs =3D=
 {
>         .atomic_destroy_state =3D exynos_drm_plane_destroy_state,
>  };
>
> -static int
> -exynos_drm_plane_check_format(const struct exynos_drm_plane_config *conf=
ig,
> -                             struct exynos_drm_plane_state *state)
> -{
> -       struct drm_framebuffer *fb =3D state->base.fb;
> -       struct drm_device *dev =3D fb->dev;
> -
> -       switch (fb->modifier) {
> -       case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
> -               if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_TILE))
> -                       return -ENOTSUPP;
> -               break;
> -
> -       case DRM_FORMAT_MOD_LINEAR:
> -               break;
> -
> -       default:
> -               DRM_DEV_ERROR(dev->dev, "unsupported pixel format modifie=
r");
> -               return -ENOTSUPP;
> -       }
> -
> -       return 0;
> -}
> -
>  static int
>  exynos_drm_plane_check_size(const struct exynos_drm_plane_config *config=
,
>                             struct exynos_drm_plane_state *state)
> @@ -245,10 +221,6 @@ static int exynos_plane_atomic_check(struct drm_plan=
e *plane,
>         /* translate state into exynos_state */
>         exynos_plane_mode_set(exynos_state);
>
> -       ret =3D exynos_drm_plane_check_format(exynos_plane->config, exyno=
s_state);
> -       if (ret)
> -               return ret;
> -
>         ret =3D exynos_drm_plane_check_size(exynos_plane->config, exynos_=
state);
>         return ret;
>  }
> @@ -312,7 +284,7 @@ int exynos_plane_init(struct drm_device *dev,
>                                        &exynos_plane_funcs,
>                                        config->pixel_formats,
>                                        config->num_pixel_formats,
> -                                      NULL, config->type, NULL);
> +                                      config->modifiers, config->type, N=
ULL);
>         if (err) {
>                 DRM_DEV_ERROR(dev->dev, "failed to initialize plane\n");
>                 return err;
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exyn=
os/exynos_mixer.c
> index 69dea5049309..d74e605a452b 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -93,6 +93,12 @@ static const uint32_t vp_formats[] =3D {
>         DRM_FORMAT_NV21,
>  };
>
> +static const uint64_t vp_modifiers[] =3D {
> +       DRM_FORMAT_MOD_LINEAR,
> +       DRM_FORMAT_MOD_SAMSUNG_64_32_TILE,
> +       DRM_FORMAT_MOD_INVALID
> +};
> +
>  struct mixer_context {
>         struct platform_device *pdev;
>         struct device           *dev;
> @@ -148,8 +154,8 @@ static const struct exynos_drm_plane_config plane_con=
figs[MIXER_WIN_NR] =3D {
>                 .num_pixel_formats =3D ARRAY_SIZE(vp_formats),
>                 .capabilities =3D EXYNOS_DRM_PLANE_CAP_SCALE |
>                                 EXYNOS_DRM_PLANE_CAP_ZPOS |
> -                               EXYNOS_DRM_PLANE_CAP_TILE |
>                                 EXYNOS_DRM_PLANE_CAP_WIN_BLEND,
> +               .modifiers =3D vp_modifiers,
>         },
>  };
>
> --
> 2.55.0.571.g244d577d93-goog
>
