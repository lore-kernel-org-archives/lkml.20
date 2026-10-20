Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792475958;
	b=vLB70eKUwcR0ILbGb980SKQ8kNhRcOi6Q/xcvI/dwOqsP1j3oKEoCHm42eixVDcTdlp5
	 ysqvpMLMmeoiL74HMcO3e+6wn7lG8j+2tLSpeQt7UhCZks/PdvGObLXPhZhDRu5fdkxWm
	 vVfSskrKrFr25xGMzOLto3sPIrZ1QGDCmqfDmn/mzTMJcR4N77jaMDmGvAqXtp2GV30w1
	 DNhLPJeJGZQxOc3rwrVrav5h+qRJ3jiZYU4blWiTnY64RpsWqPI6nAQyT9a5sUtl3a9kd
	 Vor7/P/mOum8BCEATUps2uVR0JesJrw6Sa+GTYv2Nj8piDQEgBwza6aDlXXbfXBSAmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792475958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aCg8fph/1fJDI6h7fkyNcd2zVqelb2p7EHJpKPHyiUA=;
	b=euso5LTms6vqyradPedLD8mJEjijU8vpC6KMVAHNrU7a9piT09P9d/k8SgjcRLZrSbgU
	 vDPxpVMUYoH864ZNQqVxsTwEz66o7BbWuoanznGeVEu5JUYd60W96nzebFtbThJfzv1c4
	 oQMu07s7eqMf3iYLsIfc7GUcFG+nqnhAffQfyHgSBEwg9he47BdSZ+P39BM7T6KlDk7re
	 cb8qSoLHSHrxXzr2YCYVB8P0KQgIkMSUcbMBXFx4oTkmsR4hLR9TlxdkFPP8uxKOUjPGw
	 25EDf/mGvkCWE8NjeulcbRmy5EqE+GIBX5lytnt+dZldLddDBOgCQMruJfj++vOR/Cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lmr2jZ2B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E0A606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59E0A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lmr2jZ2B
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso2059461e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792475955; cv=none;
        d=google.com; s=arc-20260327;
        b=lRDmlXqoOcXA7lop7tVssv43TgwwIT/sAp4IvE/7aF0y6pgGVWGGPuBFS9PaucaRza
         XqPeVR0vGWMsv88yE0fHOHwo7OWyuBBiPwrACA7KKV+rxPWnRsgsi2APe74KwLxU7qOb
         rv3UWF0bLczizmUFggBH8CxVNxNuX1XD/ibdDGSPHYhQHS9AqlRRJUrZFzyC+gxy0mzR
         Q+Xp28yfPC3IfKvd9ii203ucSo7S3rjzhxLK8xRmH4PsiPtsXtEhPS8SStzdSgHBssqe
         V5mJHsQ7XITiPwVNzAumd+vpkv5SERYyPYngNEg5gWKvVtoRwHocd/QIJCccs8iG73hQ
         HJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aCg8fph/1fJDI6h7fkyNcd2zVqelb2p7EHJpKPHyiUA=;
        fh=AlkQpL5wYjkgKBQNT0OSSViybc4qhFS2p0FYY9h6Z90=;
        b=qxgJFzmJwjvmGLQqoYd0KG4Zpg96VeYOCQ9IjRt86JQESXLBOvwjRwiOX9QTh75Cvb
         lQ+bKLEdC51G87HuQNq07mE8X4pn2FHtMjt3pSnb94NUIO3VRuB/sv5NR4DSDzozjoYo
         4Bi7Fg6Dd10asqf0bsW6o8xxVepnuy4z75Y6PTwXojDxcB2zL06q3q09hN5sYlvHiAGD
         hrHyrRJRN1XOuDc+c2yLVCxY31tQ9m+YGPNJ9/zk6wixZ+Aw0oMZlAUoK82TO5a5+IL4
         sfB40jzsq6aDf2dQMddwUtg0HAdj235eOt3GFJMQBZkeFEmiSWvDnj0b5Jo4kDWqnZTy
         y4aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792475955; x=1793080755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aCg8fph/1fJDI6h7fkyNcd2zVqelb2p7EHJpKPHyiUA=;
        b=Lmr2jZ2B5nGzZubbHDveW5Lk0pG0LnPLcq4ZJADSym1+3OiTmqLFUdmuZjeP7F+fgn
         BurHWcTuilSCPFoUXF9tFwBDQKkL+ePJlibjdUruDM8rXLD5yKpAyAXL+Ts6GtFdAGON
         9nfLZ1z9GiQZQrymP7vRILd1QlJaGpp+V/huGhwckPKmn8FKDChHYx4DoHhrC7WfAGdI
         zcF4Cq5mcu3UW5OB+m+0qywXyr74ep+AySNYy5Zx1gaFrelDeqKQ5Xyfdn/LNw84yGcy
         +gjGp+GKfNuwgq6XzaX8aJH4fWo51jrtCZ87e0wVvNx6odR4H4cew7pi+wuJ6GdUjrot
         9UKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792475955; x=1793080755;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCg8fph/1fJDI6h7fkyNcd2zVqelb2p7EHJpKPHyiUA=;
        b=Y1R7NFikhzQVByL4GzBC140GxusYSnPRzSJn14pGl5LUo7RFAx/qQXhcmqBjrneL5/
         ui9900ahBf4hDySbSgYvIq+eIrLThh4y/7WCqNdPAXfwg+swvrnACp2VDaBkeCXMSy7g
         BE7W9f6zz+F9v2g6oMnSqiZr9kyT1EbFRWN+MiNqujmew5/B2nyH+++0+NEdxQ6F4MGV
         r8iFoCT+mfNkTJbanqR9BHfPF8Wu0YcR4rKZavVj8nzq+KaNXJNco4Cr+ZnFYKV/smTh
         5bxCMJCenxjqqNYyqA7drqNKtTaMjsE0oqrkX0M6uZMMdzIhiCQwTBeHq8FRPPOJIR9O
         4LLA==
X-Forwarded-Encrypted: i=1; AKwUvBzC7LN0TYPOqRFpnVOPWQngPpzZhzrFCG+LclCSOKEJTU1F+I/UFgk5dFShZwf9HjtDJRduv3foHtzW4LU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCsp8Gc+KN3Yj9jfVDnNYsFwZsdBmZLe7EHTGAcEtAdPuPVbcq
	wMZoP7CJrhuaDYkF+Fu5lOXOML1HPRmeHn0XwgtHXdD8HOTSV+S70fvwab10zzx5BhWTWueI6hf
	/gmftZJQP7XZaouzchrgPuQ7WbY0e550=
X-Gm-Gg: AYBFou2C2auxMTu5VXybk3NMZlb/HHuTlduRPBXjf/u5Vuu+JGKtKMOez/zI7VLUWVK
	dYBsnJ6DeK+a1gAFTR58SLBG3MlpgbjR30jwqT5O2VLsm8C3PpBC7NZoZE7ECRF9Tk87DpIQ7Q/
	HiQMv0GTg+jFCbKQ57v5PGDL02uKUjtz/FVykfnbwDNMypX85qcldjPXBy5/hbZtPYxab4jgTnp
	QbkyrL7lQJQhFg6Dd+Sx2kpj4otvGzpB7AvzKGgNMS/e2fg75oAhizVLGWC+u+FiLKldJqZT+W7
	+d2Or0wL/9+hdAQT7FKuEFZuqoU6e3Cw7puNNPKkU/YHZEHdDWbxwKkDXAJdADcjowfl9RZ4HZm
	+2koVBgoLcAIH7IqYQXa22XeNnI87qaITilpImI7ThGw=
X-Received: by 2002:a05:6512:401c:b0:5bc:f6b4:96c1 with SMTP id
 2adb3069b0e04-5be50a09735mr3339214e87.9.1792475954919; Mon, 19 Oct 2026
 22:59:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-tegra-drm-yvu420-v2-0-512889103ab4@gmail.com>
 <20261018-tegra-drm-yvu420-v2-1-512889103ab4@gmail.com> <HmrilxC8QwiAQGw2IQ1Ztw@nvidia.com>
In-Reply-To: <HmrilxC8QwiAQGw2IQ1Ztw@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 20 Oct 2026 00:59:03 -0500
X-Gm-Features: AclHuK-m8XMWtAb64cQPzzqZx3KIZG_Ohxl4ldySrzNI4kuCiiZ69ozwRbh1oCQ
Message-ID: <CALHNRZ9pTTLTpsKCi7oETcjpxNbZmQxfnC+pvEx4Wezv1_zchw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/tegra: Support swapping chroma planes
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 12:08=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia=
.com> wrote:
>
> On Monday, October 19, 2026 7:03=E2=80=AFAM Aaron Kling via B4 Relay wrot=
e:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The Tegra display controller supports some yuv types, but not their
> > chroma swapped variants. For example, yuv420 is supported but yvu420 is
> > not. This can be efficiently worked around by just passing the hardware
> > said chroma planes backwards. Add a flag to the plane state struct and
> > handling to both tegradc and nvdisplay paths.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c    |  6 +++++-
> >  drivers/gpu/drm/tegra/hub.c   | 14 +++++++++-----
> >  drivers/gpu/drm/tegra/plane.c |  5 ++++-
> >  drivers/gpu/drm/tegra/plane.h |  3 ++-
> >  4 files changed, 20 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index b0bfa946e6979..39c2e920d76a6 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -740,7 +740,8 @@ static int tegra_plane_atomic_check(struct drm_plan=
e *plane,
> >
> >       err =3D tegra_plane_format(new_plane_state->fb->format->format,
> >                                &plane_state->format,
> > -                              &plane_state->swap);
> > +                              &plane_state->swap,
> > +                              &plane_state->swap_uv);
> >       if (err < 0)
> >               return err;
> >
> > @@ -872,6 +873,9 @@ static void tegra_plane_atomic_update(struct drm_pl=
ane *plane,
> >                       window.stride[i] =3D fb->pitches[i];
> >       }
> >
> > +     if (tegra_plane_state->swap_uv)
> > +             swap(window.base[1], window.base[2]);
> > +
> >       tegra_dc_setup_window(p, &window);
> >  }
> >
> > diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> > index 448f49f3a7d7e..6427155ac4fdf 100644
> > --- a/drivers/gpu/drm/tegra/hub.c
> > +++ b/drivers/gpu/drm/tegra/hub.c
> > @@ -440,7 +440,8 @@ static int tegra_shared_plane_atomic_check(struct d=
rm_plane *plane,
> >
> >       err =3D tegra_plane_format(new_plane_state->fb->format->format,
> >                                &plane_state->format,
> > -                              &plane_state->swap);
> > +                              &plane_state->swap,
> > +                              &plane_state->swap_uv);
> >       if (err < 0)
> >               return err;
> >
> > @@ -664,24 +665,27 @@ static void tegra_shared_plane_atomic_update(stru=
ct drm_plane *plane,
> >       tegra_plane_writel(p, value, DC_WIN_PLANAR_STORAGE);
> >
> >       if (yuv && planes > 1) {
> > -             base =3D tegra_plane_state->iova[1] + fb->offsets[1];
> > +             uint8_t u =3D tegra_plane_state->swap_uv ? 2 : 1;
> > +             uint8_t v =3D tegra_plane_state->swap_uv ? 1 : 2;
> > +
> > +             base =3D tegra_plane_state->iova[u] + fb->offsets[u];
> >               base |=3D addr_flag;
> >
> >               tegra_plane_writel(p, upper_32_bits(base), DC_WINBUF_STAR=
T_ADDR_HI_U);
> >               tegra_plane_writel(p, lower_32_bits(base), DC_WINBUF_STAR=
T_ADDR_U);
> >
> >               if (planes > 2) {
> > -                     base =3D tegra_plane_state->iova[2] + fb->offsets=
[2];
> > +                     base =3D tegra_plane_state->iova[v] + fb->offsets=
[v];
> >                       base |=3D addr_flag;
> >
> >                       tegra_plane_writel(p, upper_32_bits(base), DC_WIN=
BUF_START_ADDR_HI_V);
> >                       tegra_plane_writel(p, lower_32_bits(base), DC_WIN=
BUF_START_ADDR_V);
> >               }
> >
> > -             value =3D PITCH_U(fb->pitches[1]);
> > +             value =3D PITCH_U(fb->pitches[u]);
> >
> >               if (planes > 2)
> > -                     value |=3D PITCH_V(fb->pitches[2]);
> > +                     value |=3D PITCH_V(fb->pitches[v]);
> >
> >               tegra_plane_writel(p, value, DC_WIN_PLANAR_STORAGE_UV);
> >       } else {
>
> I noticed DC_WIN_PRECOMP_WGRP_PARAMS has a SWAP_UV bit. This is already
> defined in dc.h. So we can use that for the hub.c implementation instead
> of manually swapping.

Oh. I figured there had to be something like that in one of the
generations, but my grep-fu failed me. Even more embarrassing that I
ended up using the exact same name. I will update and verify this and
send a new revision.

> Otherwise everything looks good to me. We could also enable the swap_uv
> logic for other UV formats.

Eh, other than asking for the entire patch to be rewritten over the
last two revisions, it looks good. :P And alright, I'll plumb yvu422
and yvu444 in the new revision as well. However, I don't have test
cases for those.

Aaron

> Cheers
> Mikko
>
> > diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plan=
e.c
> > index 2148b0c59815c..757bc552809fe 100644
> > --- a/drivers/gpu/drm/tegra/plane.c
> > +++ b/drivers/gpu/drm/tegra/plane.c
> > @@ -59,6 +59,7 @@ tegra_plane_atomic_duplicate_state(struct drm_plane *=
plane)
> >       copy->tiling =3D state->tiling;
> >       copy->format =3D state->format;
> >       copy->swap =3D state->swap;
> > +     copy->swap_uv =3D state->swap_uv;
> >       copy->reflect_x =3D state->reflect_x;
> >       copy->reflect_y =3D state->reflect_y;
> >       copy->opaque =3D state->opaque;
> > @@ -319,11 +320,13 @@ int tegra_plane_state_add(struct tegra_plane *pla=
ne,
> >       return 0;
> >  }
> >
> > -int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap)
> > +int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap, bool *swap_=
uv)
> >  {
> >       /* assume no swapping of fetched data */
> >       if (swap)
> >               *swap =3D BYTE_SWAP_NOSWAP;
> > +     if (swap_uv)
> > +             *swap_uv =3D false;
> >
> >       switch (fourcc) {
> >       case DRM_FORMAT_ARGB4444:
> > diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/plan=
e.h
> > index e33a581e6490e..dba5f1b254e98 100644
> > --- a/drivers/gpu/drm/tegra/plane.h
> > +++ b/drivers/gpu/drm/tegra/plane.h
> > @@ -49,6 +49,7 @@ struct tegra_plane_state {
> >       struct tegra_bo_tiling tiling;
> >       u32 format;
> >       u32 swap;
> > +     bool swap_uv;
> >
> >       bool reflect_x;
> >       bool reflect_y;
> > @@ -88,7 +89,7 @@ void tegra_plane_cleanup_fb(struct drm_plane *plane,
> >  int tegra_plane_state_add(struct tegra_plane *plane,
> >                         struct drm_plane_state *state);
> >
> > -int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap);
> > +int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap, bool *swap_=
uv);
> >  bool tegra_plane_format_is_indexed(unsigned int format);
> >  bool tegra_plane_format_is_yuv(unsigned int format, unsigned int *plan=
es, unsigned int *bpc);
> >  int tegra_plane_setup_legacy_state(struct tegra_plane *tegra,
> >
> > --
> > 2.54.0
> >
> >
> >
>
>
>
>
