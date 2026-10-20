Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792483800;
	b=i4wPrqXjiXHpmoSpksdXMtuZcBXkvEUGjDwIrlcQH2HlZ40WOkm5PLH7RC8wxLGNb0jj
	 PeCA1klsRZTRYDqRwE7vBc37zYq8Q0vabfUYCGssloss/U6UQbeX1dkSsr7EoplQDytlT
	 IQj7mSI0grI80oNd2ncyJthuofunSFvuOxY9ZHSX1Zrj830Py2XthAHlWbajIrmdu9X24
	 OB0uuICatCRJRjLgVuL6d2wgrytnoLKhFxDSz+7icPzsrA6T/PvhR8/D8zdY+q2+WawJX
	 Zk6gojqaKkNfCUW2oyue36pJFcyhXhoTiZ1NI2i8OjZsRjOvOo/Z1veq2u0IZqDtfAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V6mptVN35vJ98NYii+6LNnGBoOW3foxwKoXliiFVg4k=;
	b=EtJvTjc7CffkPfuw3TetwfMkB+9aq5K7TguClhxVnsGK55KK2pGQSzYltfrhQxG1e70Y
	 q5iJPAdX2sKtrs74hbdh67f+XjdRbCOCE5HhtlN9w2Db06otKin4CrR9MpocXF4UVgbrd
	 vTUCXSHp2BvVerXGgqvGkXJDiyKX91xxPWupp5ehvEU/0ri6xbDxy8xPcfRhi1fjzghAC
	 4wP/oX/AnbuKs65NdHHSXn7fIeffJtiJA6B6o6jP3fug3g0gfKiZb973jeTPe/2LeyHtZ
	 zwEnZJ7FyFXXZNNMs3QRxR3a59Na/Q7iCdRqqrfz/FKY2tn2qj0eIoZQfYH1ailoeYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=evb63eaP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA66606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA66606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=evb63eaP
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so10000361fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792483799; cv=none;
        d=google.com; s=arc-20260327;
        b=nVhtMuyUcNOp3v67qAy+BUaICe5bJA3v+zICY9lvLyNQHDBIhwt3BhDP/hlu+t5URr
         calQKUQbBaAqS3Wj/jUobpVRf1YWT1YSV0p0drcgN9H5fxV7Te0cwJbWeFnyMOhNp2m2
         /qo0PcyVTUiBBgOSrvIiDeolCW0XaSQv9uFlqIn2M/q8zUOl+hSd5cx/rQsZrotrgehp
         /f6qLD6zeLPqLnBYpXBN4Kvlt74Ll12ef+IhQJsJ/QZT4+qhSk+iIilBBh882VpNQy6M
         TqnRa6InZPu0MUVHreG4u+g5SAm3PvpF5rC0Kkbq7M1adLZq7krsor2tsfHbocGRcdTn
         jbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V6mptVN35vJ98NYii+6LNnGBoOW3foxwKoXliiFVg4k=;
        fh=IpACcypqZSn+nCJ3I1+K/6yA/6Yu6YpvxIGZNnT049I=;
        b=EO9SiRG+vbRv2XJxnJZnRZ67amR2oAZZXzs4J5Pis9BqDTumGKBqbUrmeefY+c2skY
         czR1t8PZO47+vHyyCkqUA2iIsMVTdWOYMfL+lw1QnpwoCR8Z91SqMl4ynaReq+R0Lspk
         X4gofgwWxgidcwSBvH7bEulGnFHfj4GeWjVu+sBWAj3KjMstFXs8s0cD6sbLO6815BTV
         YB7WdPCvvmKxbtkWu1wLbHPYytfw/Np5snJE7w2Tn83SkFqvDl7QcAOzbi/++Omwnj7O
         Rx6/sbtOzKQtgeHkvbPjOrwZoZ2hFDKgBJscL0zT4KmjtXohcHm2Zqzu03ccqOJDH02U
         8J8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792483799; x=1793088599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V6mptVN35vJ98NYii+6LNnGBoOW3foxwKoXliiFVg4k=;
        b=evb63eaPhGaFJtlu5jJTkNUzsfxqGmB2jkiQ/CFO6TvwWdV7gZJY/vCF7TWT8KOCep
         WeZdRm8D6AzKEHgKeADaU1S+HiMaTsKpdA/12gGrFQE9JADR5LhbGP++kBhETxLIBdyF
         nu48x67TCzaK8LSpOqvGaRQGR+TVvFMjOrRgG6FZ5OuNUeKAR6+Gscelf5u1SgjY4Chk
         4KgqATQT8iJ9IE5wKQCh3p6zPYIFMRUrI08Cq9wGjepEXE08odUs+YSFA20ChM8KItMn
         hfn9rvGYdrrsQvz1TuDnWPbUS5iku6m41dp1VuVcZqvAArvWSal6tHeKOGodcWJMfGWR
         B2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483799; x=1793088599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6mptVN35vJ98NYii+6LNnGBoOW3foxwKoXliiFVg4k=;
        b=BCEgq5dDMl+LMHV6051d/hY8KhiHT3bjj137bLhx3uivfc7/KG5bUxEO/IDkuQ5Ii8
         lPDCyT8g8lv2D+5RqzcfZV6XqHyMgiTxTAa440ViJdKBIir1nW52I/oKoCSo6mjvuAmf
         AAIe1WFYLON3nN5p+BP8XjFBNEvWBIjfLkl4Eg0g1zXZiX9RVSAfHJz21jEmypwRXyGC
         xenx3xXyjQkRZI95I3kc88pExTmGGyVgmdObiiNL5NC0ihXeMysMfmXd9TcPIQZ8xlky
         VwC8ZoiCq7L+WQL1vBDz7xTdzpD79ohxmUm87dw3nDHYQ/noyejiH/4nE0PM35iCbx9d
         ZetQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYgT6/deP7H2pvzrFj7JzCO2RF/zmJeKT9j9khVzTynZ/BbcqjO8Gbv4mgh2NcVElVqvhLQpIDZNZ2WRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0TVXKtIba/+bfLE4tZpaJzPR7C5bVio4MWIDEdBMgromXrwOg
	wXKXNIkH29drmkr4vDK3Z+JkuadWhhPTs3QSiPPmlLYBBD1P7sUeHtTwYCzE8TPaw/Sk9HpBKCY
	0Kqe6n87aFNNpno0F6z3U0CR8ZTDZIkw=
X-Gm-Gg: AYBFou1Z6sYR8Ao1WAcHWeWkGpXJsl2csWaWh78zf5G4DWuHGDz/SZBhTJ/9wbW5M/+
	XITCLOT+aERlWhx8EGmgE/VDnXq2HUuTUS3VUflJGHgwF52wGBmvEDj4OxBJZGXoxIbHhjcWQz3
	JGq5nsocNU2zgTljO1ToJsaIlV7T0h82e+XaLxBYH30PHOc+VRgzJwotqoK+hWC7ySTBf9kG9YP
	/kEFBNEPNDjhh+FXWy4ce+1fVX/7CfTyJ0LRfEsgO3afDz+ThNnui+l5c3GR6NslW10HtjNFf1/
	fhBZMZXrI66z0WHel6JZQi9lSf3hxSmo2iO2TL12aYiacxCuh9WIifHxWCaK3zRw7Mnpkr//F3+
	Pm5+trYCGrb3Fu0pWA73Rkz3j5hdbX8q4MRJv/taWjd4=
X-Received: by 2002:a05:651c:43c3:10b0:3a9:decc:71d8 with SMTP id
 38308e7fff4ca-3ab292e7330mr15305261fa.20.1792483798450; Tue, 20 Oct 2026
 01:09:58 -0700 (PDT)
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
 <HmrilxC8QwiAQGw2IQ1Ztw@nvidia.com> <CALHNRZ9pTTLTpsKCi7oETcjpxNbZmQxfnC+pvEx4Wezv1_zchw@mail.gmail.com>
 <YwDFPLEmR6OpEy_iH5qhQg@nvidia.com>
In-Reply-To: <YwDFPLEmR6OpEy_iH5qhQg@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 20 Oct 2026 03:09:46 -0500
X-Gm-Features: AclHuK9G5flqUwHbZoc27IHAExPyam9IuxmD1uS85V1i11rVUagnEOUPWT-m7-o
Message-ID: <CALHNRZ_Kiqc0VJN+4gDDM0Z+Ns0VO3jCoLUk1xNn1OGjeS2+LQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/tegra: Support swapping chroma planes
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:33=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
>
> On Tuesday, October 20, 2026 2:59=E2=80=AFPM Aaron Kling wrote:
> > On Tue, Oct 20, 2026 at 12:08=E2=80=AFAM Mikko Perttunen <mperttunen@nv=
idia.com> wrote:
> > >
> > > On Monday, October 19, 2026 7:03=E2=80=AFAM Aaron Kling via B4 Relay =
wrote:
> > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > >
> > > > The Tegra display controller supports some yuv types, but not their
> > > > chroma swapped variants. For example, yuv420 is supported but yvu42=
0 is
> > > > not. This can be efficiently worked around by just passing the hard=
ware
> > > > said chroma planes backwards. Add a flag to the plane state struct =
and
> > > > handling to both tegradc and nvdisplay paths.
> > > >
> > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/tegra/dc.c    |  6 +++++-
> > > >  drivers/gpu/drm/tegra/hub.c   | 14 +++++++++-----
> > > >  drivers/gpu/drm/tegra/plane.c |  5 ++++-
> > > >  drivers/gpu/drm/tegra/plane.h |  3 ++-
> > > >  4 files changed, 20 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.=
c
> > > > index b0bfa946e6979..39c2e920d76a6 100644
> > > > --- a/drivers/gpu/drm/tegra/dc.c
> > > > +++ b/drivers/gpu/drm/tegra/dc.c
> > > > @@ -740,7 +740,8 @@ static int tegra_plane_atomic_check(struct drm_=
plane *plane,
> > > >
> > > >       err =3D tegra_plane_format(new_plane_state->fb->format->forma=
t,
> > > >                                &plane_state->format,
> > > > -                              &plane_state->swap);
> > > > +                              &plane_state->swap,
> > > > +                              &plane_state->swap_uv);
> > > >       if (err < 0)
> > > >               return err;
> > > >
> > > > @@ -872,6 +873,9 @@ static void tegra_plane_atomic_update(struct dr=
m_plane *plane,
> > > >                       window.stride[i] =3D fb->pitches[i];
> > > >       }
> > > >
> > > > +     if (tegra_plane_state->swap_uv)
> > > > +             swap(window.base[1], window.base[2]);
> > > > +
> > > >       tegra_dc_setup_window(p, &window);
> > > >  }
> > > >
> > > > diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hu=
b.c
> > > > index 448f49f3a7d7e..6427155ac4fdf 100644
> > > > --- a/drivers/gpu/drm/tegra/hub.c
> > > > +++ b/drivers/gpu/drm/tegra/hub.c
> > > > @@ -440,7 +440,8 @@ static int tegra_shared_plane_atomic_check(stru=
ct drm_plane *plane,
> > > >
> > > >       err =3D tegra_plane_format(new_plane_state->fb->format->forma=
t,
> > > >                                &plane_state->format,
> > > > -                              &plane_state->swap);
> > > > +                              &plane_state->swap,
> > > > +                              &plane_state->swap_uv);
> > > >       if (err < 0)
> > > >               return err;
> > > >
> > > > @@ -664,24 +665,27 @@ static void tegra_shared_plane_atomic_update(=
struct drm_plane *plane,
> > > >       tegra_plane_writel(p, value, DC_WIN_PLANAR_STORAGE);
> > > >
> > > >       if (yuv && planes > 1) {
> > > > -             base =3D tegra_plane_state->iova[1] + fb->offsets[1];
> > > > +             uint8_t u =3D tegra_plane_state->swap_uv ? 2 : 1;
> > > > +             uint8_t v =3D tegra_plane_state->swap_uv ? 1 : 2;
> > > > +
> > > > +             base =3D tegra_plane_state->iova[u] + fb->offsets[u];
> > > >               base |=3D addr_flag;
> > > >
> > > >               tegra_plane_writel(p, upper_32_bits(base), DC_WINBUF_=
START_ADDR_HI_U);
> > > >               tegra_plane_writel(p, lower_32_bits(base), DC_WINBUF_=
START_ADDR_U);
> > > >
> > > >               if (planes > 2) {
> > > > -                     base =3D tegra_plane_state->iova[2] + fb->off=
sets[2];
> > > > +                     base =3D tegra_plane_state->iova[v] + fb->off=
sets[v];
> > > >                       base |=3D addr_flag;
> > > >
> > > >                       tegra_plane_writel(p, upper_32_bits(base), DC=
_WINBUF_START_ADDR_HI_V);
> > > >                       tegra_plane_writel(p, lower_32_bits(base), DC=
_WINBUF_START_ADDR_V);
> > > >               }
> > > >
> > > > -             value =3D PITCH_U(fb->pitches[1]);
> > > > +             value =3D PITCH_U(fb->pitches[u]);
> > > >
> > > >               if (planes > 2)
> > > > -                     value |=3D PITCH_V(fb->pitches[2]);
> > > > +                     value |=3D PITCH_V(fb->pitches[v]);
> > > >
> > > >               tegra_plane_writel(p, value, DC_WIN_PLANAR_STORAGE_UV=
);
> > > >       } else {
> > >
> > > I noticed DC_WIN_PRECOMP_WGRP_PARAMS has a SWAP_UV bit. This is alrea=
dy
> > > defined in dc.h. So we can use that for the hub.c implementation inst=
ead
> > > of manually swapping.
> >
> > Oh. I figured there had to be something like that in one of the
> > generations, but my grep-fu failed me. Even more embarrassing that I
> > ended up using the exact same name. I will update and verify this and
> > send a new revision.
> >
> > > Otherwise everything looks good to me. We could also enable the swap_=
uv
> > > logic for other UV formats.
> >
> > Eh, other than asking for the entire patch to be rewritten over the
> > last two revisions, it looks good. :P And alright, I'll plumb yvu422
> > and yvu444 in the new revision as well. However, I don't have test
> > cases for those.
>
> These are minor revisions, pretty much cosmetic! :)
>
> If you have access to the libdrm modetest command, you can use it to
> test -- e.g.
>
> sudo modetest -M tegra -s 78:1920x1080 \
>       -P 44@43:896x504+40+288@YU12 \
>       -P 48@43:896x504+984+288@YV12
>
> (the ID numbers may differ) to set up a 1920x1080 mode with two overlay
> planes one with each plane ordering.

I'm still mostly focused on android. If there's something where I'm
concerned there's a difference between android and a Linux rootfs or
such, I'll test against a simple cli rootfs. But I don't have a full
graphical Linux setup for testing. At one point I did try to compile
modetest for aosp, but I don't think I made it work.

Aaron

> BTW, I believe the hardware swap bit also supports packed and semiplanar
> formats -- you can add those too if you'd like or leave them out and we
> can add them later if needed.
>
> Mikko
>
> >
> > Aaron
> >
> > > Cheers
> > > Mikko
> > >
> > > > diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/=
plane.c
> > > > index 2148b0c59815c..757bc552809fe 100644
> > > > --- a/drivers/gpu/drm/tegra/plane.c
> > > > +++ b/drivers/gpu/drm/tegra/plane.c
> > > > @@ -59,6 +59,7 @@ tegra_plane_atomic_duplicate_state(struct drm_pla=
ne *plane)
> > > >       copy->tiling =3D state->tiling;
> > > >       copy->format =3D state->format;
> > > >       copy->swap =3D state->swap;
> > > > +     copy->swap_uv =3D state->swap_uv;
> > > >       copy->reflect_x =3D state->reflect_x;
> > > >       copy->reflect_y =3D state->reflect_y;
> > > >       copy->opaque =3D state->opaque;
> > > > @@ -319,11 +320,13 @@ int tegra_plane_state_add(struct tegra_plane =
*plane,
> > > >       return 0;
> > > >  }
> > > >
> > > > -int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap)
> > > > +int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap, bool *s=
wap_uv)
> > > >  {
> > > >       /* assume no swapping of fetched data */
> > > >       if (swap)
> > > >               *swap =3D BYTE_SWAP_NOSWAP;
> > > > +     if (swap_uv)
> > > > +             *swap_uv =3D false;
> > > >
> > > >       switch (fourcc) {
> > > >       case DRM_FORMAT_ARGB4444:
> > > > diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/=
plane.h
> > > > index e33a581e6490e..dba5f1b254e98 100644
> > > > --- a/drivers/gpu/drm/tegra/plane.h
> > > > +++ b/drivers/gpu/drm/tegra/plane.h
> > > > @@ -49,6 +49,7 @@ struct tegra_plane_state {
> > > >       struct tegra_bo_tiling tiling;
> > > >       u32 format;
> > > >       u32 swap;
> > > > +     bool swap_uv;
> > > >
> > > >       bool reflect_x;
> > > >       bool reflect_y;
> > > > @@ -88,7 +89,7 @@ void tegra_plane_cleanup_fb(struct drm_plane *pla=
ne,
> > > >  int tegra_plane_state_add(struct tegra_plane *plane,
> > > >                         struct drm_plane_state *state);
> > > >
> > > > -int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap);
> > > > +int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap, bool *s=
wap_uv);
> > > >  bool tegra_plane_format_is_indexed(unsigned int format);
> > > >  bool tegra_plane_format_is_yuv(unsigned int format, unsigned int *=
planes, unsigned int *bpc);
> > > >  int tegra_plane_setup_legacy_state(struct tegra_plane *tegra,
> > > >
> > > > --
> > > > 2.54.0
> > > >
> > > >
> > > >
> > >
> > >
> > >
> > >
>
>
>
>
