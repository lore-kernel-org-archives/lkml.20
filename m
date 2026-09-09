Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F5530D3FF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952312; cv=pass; b=eU+36hh2fkpmGl8g0NXgLT6llEe977XxKch90G9usIm0ejV3bIbygy3I6rLaoP2EQCUtOUa747OOna8Q9EM7fnRN8jsMcYjUYl1U8TTp3SXKbAM6xS3lkN6ELbU7UP0GmTPM7LfX4Ih9vR7HaP8eydnkOAX/PNahjLck90/6Ukc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952312; c=relaxed/simple;
	bh=ckaMB8bYddEFKTrt3nh4B4OEjH+FS/aTLZ/7lFVxb1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbFOwCwrY6Uy2PpkBpjGbeCbVchT8GNTeSvcNo2fcO1eT0r7jMTkl3AiV5e7Z1PfuSW35CYCBfkbIU7JcJ1wo0dUqlHp5wOopLZje0+Yx19QJZf7D4R4oLSRJnl5Gd4gCAOOh9VeC5FIVqkkifr6JY3IDVBZojrHNy5HVfaazRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxOh5+kM; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxOh5+kM"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4bf948737e1so53095b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788952309; cv=none;
        d=google.com; s=arc-20260327;
        b=XAP8yiEZsRWAKweAyDRX1peRUtjQHo2acUd2pCcfj/fj6wXVfqwBOcJcpxHp9av7JH
         JpTcPKCsNooSsEHW4Y/AZ/cmclW8IocDi57pJzGSXXmYujGEq446p4rYdMEILWiPuHct
         GmpwVzgMbfHeG/94bxlwy9gnnD/Ronyo1QqO3Ru1ikq0rnw2t1BMAvGq6d1iai3gyzEI
         h517v+HY0a5lLtB8QzGxMiKM5PeO763lWpOqj6+g26CqmmjOFqq8RzSHO5gUK5u2kTFi
         0DurrS5hn4Pqe1sLCMQ3lAMpbEiJczMZjjy4UaYJgOXyEpz3flgzSP4Mtke9uOghA+PE
         P6sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ck8lakGDSM+8IA5gpwp94I/I8q3qxhf1fiaN168K/CQ=;
        fh=s8PCO8EwljY23tYSyLyf9LtfYd0LI751D9r8V5ccRO0=;
        b=OgGjSMmOvzIXP2zfKHZ5oPjtKT3APnkUm1ThOuiFi9E7uKhsT0cU+JKl0O0EpjrJTW
         rAcQuRByJK+O4IYK9yWgKJiGdbv4xrec12237xX6G0npeA6Ov0rdWXvBa+xPZHxT0wZL
         mNQ0drEn9zjBQvBHYOHr2c4Ph/YAUEMEOkWNRPoakSEWDDffadZUa/b0QH0BHyl9xgTv
         luUyUEY3F0CM+6m8lirSy0y1GNLYGom5QZU4Qj/ZThBrt3q8jXaNZwzEKAfVGrRCmKmD
         mgzOAW/ETjZNKZv7VUtMEFcv+rWqpgNeBOfhdDrtEtaYeabBDFtNDysyqC3ZAtxypgCq
         kEbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788952309; x=1789557109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ck8lakGDSM+8IA5gpwp94I/I8q3qxhf1fiaN168K/CQ=;
        b=JxOh5+kMLf9HVa308aYltHRbquOf/cvIZy1/shCH5EAMYqmr141reN51He9L6FLMH6
         BGe5nvCGYpl1jz7ZPlrxQkkcuEhzErGQEaHhOVuGYtbcyhgKEjUEM4UN0Sq+axG+PwH4
         GknjO0DSdUf90YqnV8Ct+0+pZ6bgM8EZ1N7a3xSu7jQdZpWSe3pOrZZDpnhOhCYVu985
         32SXvSPZ95BS7c3MMsP3yt7bNzuMxZRsldBfP4+nwEdHm0iDpNsuZQFL0zJlClwPkalX
         4JOFJSY3LrnEQ3Dhxojer4lTCR1qOX6vL+3fDAOManiS2K1g7plHZaSjVKHtBdncHFrl
         3kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952309; x=1789557109;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ck8lakGDSM+8IA5gpwp94I/I8q3qxhf1fiaN168K/CQ=;
        b=YPmks9I1n1THk9P8FUtSHVnx0ePllMPwilksoQPgyXt468jkcREQTW3Gt7Fx/QCeCL
         b4wOmWMuT8SamNwcHXnx1l2EhFRai1ye18Cnkui5oW9HC3QywFjORZcnjpXIdV9UMq0f
         HsoioDwNI7sIBlPOwli4cFGNrJOSC71XHYeLVmy1BI+gm/IAxv+qg/1560vIRhP2v3l0
         ORikKrZ+BOjo/EpFDNvYUc0LU23YN0KB9XAcxPzLXUZO3ahKJkYmI5RGT5uiXGLMgNtr
         ke7EhgnGQoRlyjNomZmqZ4f/t7H3gDVIh92CBCchQddvosZRV2mKpZjwg8slosMd4D+l
         hQPA==
X-Forwarded-Encrypted: i=1; AKwUvBzwWEKTnCkEfaZ1Z3mtvvKheEJY4V+1veK118wiyCUbAv3x+Dyfa9OKeQUIV21bccYpi5DEvws5tqJVHy0=@vger.kernel.org
X-Gm-Message-State: AFuF++kvjoh5hMsAPYGrUAfXO/Adw0NJxhZxJ9Nw2d0zvUnguqnoMaRn
	Sl5e5xKrQypQdmvoUjeTxAAQP54oB/4t84fK2WMR1FCHrzsj2nywQDzcKo3QNPQkNdxHFppUvyF
	P8NsFOcZg+Aev6BnhTpr2JwPGLIYIGFV9zg==
X-Gm-Gg: AYBFou2/9J3BVqq5ZY567eq6iNtNuEybqDon1emzngJbsP20OjfZxg00Wdt6hxWxJlM
	9Ad2y/czd8BFNt+B7gPu5y+2ylcNCKnzUpvY4Ky6OvjLAb7E2gP6qmEOelITD2HVcv8tfuBJ5en
	9xL0ey2aV7D6rgb8jrbm2SXwpHIL23nLTX8P9o3eXBk+WBSKop7wkaQRPtV3YqKjugLnzhEB1fk
	Om/LJ1NNhd618wtKMFDYZYQLPeBhe/2SM6I0s0bUAdQBb9mZQgZfMt9jTBv4gtOGnx8rp0akKoe
	96wJYPxuuvORXHO+8s5iu8akf0yTCg8Saz+uIGTYjud4ICGuzHFr0+c=
X-Received: by 2002:a05:6808:4f60:b0:4be:d8dc:be57 with SMTP id
 5614622812f47-4c14069c4e9mr417269b6e.4.1788952308835; Wed, 09 Sep 2026
 04:11:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903071149.423579-1-oushixiong1025@163.com>
In-Reply-To: <20260903071149.423579-1-oushixiong1025@163.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 9 Sep 2026 13:11:37 +0200
X-Gm-Features: AcwNN1WC5y6ETq-rkRFRm9BLnr617x6FxvJuPUgFKT2cKfdWM2Rc3Anl1-zwsRI
Message-ID: <CAMeQTsaMhb=neBOcfi62rs5hHCB0nvE2_4qaF0GbeHonp-JZ3Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/gma500: Create the primary plane in the driver
To: oushixiong1025@163.com
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Shixiong Ou <oushixiong@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 9:12=E2=80=AFAM <oushixiong1025@163.com> wrote:
>
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> drm_crtc_init() creates the primary plane from a fixed format list
> that includes ARGB8888. The display engine programs the primary plane
> with DISPPLANE_32BPP_NO_ALPHA, so it does not support per-pixel alpha
> and must not advertise alpha formats. Since commit 860e748bddcc
> ("drm: ensure blend mode supported if pixel format with alpha exposed"),
> drm_mode_config_validate() warns about this at probe time.
>
> Replace drm_crtc_init() with a driver-owned primary plane that
> advertises only XRGB8888. The plane is allocated by
> drmm_universal_plane_alloc() and the "pixel blend mode" property is
> not needed because no format with alpha is exposed.
>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>

Thanks for the patch. Applied to drm-misc-next

-Patrik

> ---
> v1->v2:
>   - Open-code DRM_PLANE_NON_ATOMIC_FUNCS without .destroy, which
>     drmm_universal_plane_alloc() rejects
>   - Use drmm_universal_plane_alloc() for automatic cleanup
>   - Move the formats comment above the array
>
>  drivers/gpu/drm/gma500/psb_intel_display.c | 34 +++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm=
/gma500/psb_intel_display.c
> index 0df75a4a7739..f79484b9d593 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_display.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_display.c
> @@ -9,8 +9,11 @@
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_modeset_helper.h>
>  #include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_plane_helper.h>
>  #include <drm/drm_print.h>
>
>  #include "framebuffer.h"
> @@ -471,11 +474,25 @@ static void psb_intel_cursor_init(struct drm_device=
 *dev,
>         REG_WRITE(base[gma_crtc->pipe], 0);
>  }
>
> +/*
> + * The display engine programs the primary plane with
> + * DISPPLANE_32BPP_NO_ALPHA, so no formats with alpha.
> + */
> +static const uint32_t gma_primary_formats[] =3D {
> +       DRM_FORMAT_XRGB8888,
> +};
> +
> +static const struct drm_plane_funcs gma_primary_plane_funcs =3D {
> +       .update_plane =3D drm_plane_helper_update_primary,
> +       .disable_plane =3D drm_plane_helper_disable_primary,
> +};
> +
>  void psb_intel_crtc_init(struct drm_device *dev, int pipe,
>                      struct psb_intel_mode_device *mode_dev)
>  {
>         struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
>         struct gma_crtc *gma_crtc;
> +       struct drm_plane *primary;
>         int i;
>
>         /* We allocate a extra array of drm_connector pointers
> @@ -494,7 +511,17 @@ void psb_intel_crtc_init(struct drm_device *dev, int=
 pipe,
>                 return;
>         }
>
> -       drm_crtc_init(dev, &gma_crtc->base, &gma_crtc_funcs);
> +       primary =3D drmm_universal_plane_alloc(dev, struct drm_plane, dev=
, 0,
> +                                            &gma_primary_plane_funcs,
> +                                            gma_primary_formats,
> +                                            ARRAY_SIZE(gma_primary_forma=
ts),
> +                                            NULL, DRM_PLANE_TYPE_PRIMARY=
, NULL);
> +       if (IS_ERR(primary))
> +               goto err_free_crtc;
> +
> +       if (drm_crtc_init_with_planes(dev, &gma_crtc->base, primary, NULL=
,
> +                                     &gma_crtc_funcs, NULL))
> +               goto err_free_crtc;
>
>         /* Set the CRTC clock functions from chip specific data */
>         gma_crtc->clock_funcs =3D dev_priv->ops->clock_funcs;
> @@ -524,6 +551,11 @@ void psb_intel_crtc_init(struct drm_device *dev, int=
 pipe,
>
>         /* Set to true so that the pipe is forced off on initial config. =
*/
>         gma_crtc->active =3D true;
> +       return;
> +
> +err_free_crtc:
> +       kfree(gma_crtc->crtc_state);
> +       kfree(gma_crtc);
>  }
>
>  struct drm_crtc *psb_intel_get_crtc_from_pipe(struct drm_device *dev, in=
t pipe)
> --
> 2.25.1
>
>
> No virus found
>                 Checked by Hillstone Network AntiVirus
>
