Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794201649;
	b=oqOdqNyLaXQM74SiGCne1mrZEZkWPaja8umNpTYaLMZWF5OS5lMF/GBM3TrQhqghq7LF
	 u0aw/6D9tacHk9q6zq/NyoEe86k//IPFy0vu/5f7JLHPqBBSjO4tHxAGhZouxZI9CiZAE
	 IONpDch4IzLGd0ip7Vpt+vbj2JF/ZlaeMgq0lTbHV86DQLqyeJpaj5WJpUKuxZKiwATdc
	 lL6JhnyDAcnaGxN3X0LoI8xU1KD9tdWqtyau4utumjg4yaKdgxekPy6YTYABgzX0m5k9n
	 7udEIJne5ufX2fxh+T8VvgMg4g8aCKTCWikNSLFvyyFcNVHl0bHtNHd5955LUvqDjtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WHqXmw0GVc1+mZ62lwJeX+opySq3aWGZVirYtpV1Hks=;
	b=hn0YCEFjO9+ZM9nvhwLGpeSBLu15Ou+N43IaKxuzlbywkepg/V9fGo345h9H39r3h9Oe
	 L5wOX0v/u2qyNQ6yJBqfE+ifT8kA+RgWVTRq06su4Q8LwdWLdu3OZsbmQPAounlPzRU6O
	 CN31Pl52R6PpOLThYkJtqChs/niarIxCL+BkiNrSMH9fYrdkQwTZuqd60Pj7e33VCeRWf
	 kBeAdTjENU3GPtfUFG3gPTHOgU/26TzT+F7KmHw/A5SIulWnJuvUOs1f5ob0+97Rn7e+s
	 X9g63RLCKbUmm5P421X4KXpKO+npEFCuKn/MMUFr4cJuN2fM8RRVgtVxj8p03PliYGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLQ3CpVu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A17F606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A17F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLQ3CpVu
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b704171bc9so504577a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:20:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794201647; cv=none;
        d=google.com; s=arc-20260327;
        b=YYPQCCrTQSpPEDvrrmik967+YQi8WP223FG3bQ/yvQoW9oczUsrJDJWssXPx0DkthP
         Y6kbXmLfFz8tUIJYYrdx+DU6YJVnQrOPVz7smRHLUrqMUFX3wEPOouA2eKH4JiUjs6hW
         AuET16AsgVMfcHa+BCIumJOKcgBsOaj7jQOg/HBspbePS2Yc6hFsiajPc8cVW6gJrvsK
         p4LDB+jprgpzdT6WD7Zvjp6x9NWtQToNKjl3ZPVzhVeHgaHdgdpe2pie1JAmncdKkBaC
         bSFLwkunROXTzZOLmn9wuBD38TNHqeYtUdaUPxuddPnqOAxziyvyplty7pr80W6hOIkL
         yHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WHqXmw0GVc1+mZ62lwJeX+opySq3aWGZVirYtpV1Hks=;
        fh=woWNmhPZX7lr3FJsORSzh+s5V0KAg+nbP75GjwA0z7A=;
        b=cwCOjdwh4K157qrpQEWx42R0Ba1khyLqbOva/X9FqkqNZEQn9UDxG2eMqG2EwQzYtR
         JVYqxwPg59ADjs6VRF+eWCdimWwmiN8PBLA9CrKFfOfUZPJuVnXTzQOPv+tKQRfK+zxi
         zQGOp8vwyQDYKR0vyWHdRel171a5nscaVh/0OX2aupP3BJFLj5SHVaCEqgGRVj+9euNv
         bU1Fo+/JR265z6xVERGaoqam6ZFPEt3cPE+zLCWmdH+MPWUydhrg/ochWjYNVeJNv548
         jb8jKXGztCBvzMcsaiucCCl5Q5ceq6K/uplGfT98Wuu02b6jYSe0mIk4vQQAsGNrDjsq
         Fp8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201647; x=1794806447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WHqXmw0GVc1+mZ62lwJeX+opySq3aWGZVirYtpV1Hks=;
        b=rLQ3CpVuTbT1dCl9LaJTjjKpvxV/Pd2DtsaX8crhoYCT5R3s/JdBhHA78HZiPAZS/8
         KoU9XA+q5I8jpGHV5bOs4oyK795ZZUFPm+Ntd+PNcjXvYQdBg3ssd2OLidnZrecjcPrj
         A0HfkLCCg2zuN5Rb54y+6iKIzvnfyzx0k8oP2D0dySWtEZz8x6Fd7mdZ9grSkvOCxrqV
         kmBKAY7y/Wp0qIlptLY8wyI38yQl1E6mnM6tpiNd3bUtefby9cCRXBtA2fI4c9MIdh4p
         BaPLgUnIAtwtUjO+I1uax7d/oj5moqwWBagQIYS1IFhM9G4jZ3YbvtLz5z2F1ExUYmVr
         jUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201647; x=1794806447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHqXmw0GVc1+mZ62lwJeX+opySq3aWGZVirYtpV1Hks=;
        b=XuCIZx9kag4k63i2NZpmJ/7Aa82LHGHROVAMjpTE+xrnU0dVnqvr41ytPtTWpnxxvD
         ypP5J0rLULX4A82LwOHsHS3MJacogOFH4Ysd23+FRdOZ0I2wLxk4uAuZlYYZUkmfIrJT
         PuKRPy9TBWrJo+k/xzjaXsqY5DCuVecweJ+5c+G+K6BShL/xhBKp+T4AUDPdrJ9WQMUx
         UKqQsLZsvPWF8kgtn4ciJK0GiPrQ5JMINsZSwAD0JLbt3bU7kIPT3Hw2kh+0dw5UoE+I
         RcoYxO0+lGYee0IQ59j7GZ04MgS4ybrYMNWeEfXsESFamjkq/ezURa2AaoZmgipzwiRJ
         o0Ag==
X-Forwarded-Encrypted: i=1; AL+hErEEgPIx2tATVylPJiRA8ruGD2e5MeMEd92MP2i56rrwWnkqY7I5dp3dVJjYHI/vGPCfAWVXkxutVTLIMow=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EKL1vun4Ve+rhr2DoKGG4Sn1n/ePN2vZabfqyzpDdhAxJ89/m
	3mB7TuIQwAy8Qwg7DheuGUpP6w+rCuEW52FZPqUSc0TeHolx9rxStfvWFu0mtGmApxX/7gW+rcB
	+UPBR/+EObge55v6ZIk6FBBJH6c1JwZ7jxw==
X-Gm-Gg: AYBFou0X6otJsrhPY2EfxP8bmiBKUXiL3gtmcpIG6dCeQuEF3X3Y2W3ixs836LVZEAo
	ooRvXh0xlBTimD/+rrTWcw/0HOxIdt/GJGeOeVh+icElWxOlOkpKSwpV5s2+/2jnGAwt+PSFDC3
	Z3VV4VtrcBr7mOtdKVck3sFdTowS2x3zpEy+qkTKBoBlIlDexPrI7/Y58aojYYfwj909AeetrIp
	hrsowboHzwrZ9djYqO08Es3u8nrXQWG2MwnqHYDn0xbLetZWa9wX3Ezi50mSNQuGeAUlTQw/KZ6
	RlqRH97ZzxUwzxQ9vHvAlmcA6sQIAZwrWe+cZI2jCX/MW5/t8Jo4Jf4rbauiLBwhoqZPECOza6U
	Oi9wfS705srCDJYWUW0om8U3zboIgj41zTz2Gg9cCbryno2CZYTLRfDeynRGNbwst1xWayNhEsA
	jgbzTHcFn2+Bk66tmtJwdXDjSykHwZCgPHchjYpH1nKcqw6W+fg+xwI+ZKpc0wME5Jo7cYhn5G+
	sTUzYqw473Dggpp0uq/glTg1pxVg+654ACL6XbCbSRif5n6Jg==
X-Received: by 2002:a05:6402:2349:b0:6b1:d2ee:392f with SMTP id
 4fb4d7f45d1cf-6b722462c10mr1849087a12.25.1794201646678; Sun, 08 Nov 2026
 21:20:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005001143.576737-1-rosenp@gmail.com> <CAAQKjZOm5vA+38XVo5D4qV5B9eRT1seOShk-eFk_Jg_EQPdaOg@mail.gmail.com>
In-Reply-To: <CAAQKjZOm5vA+38XVo5D4qV5B9eRT1seOShk-eFk_Jg_EQPdaOg@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 8 Nov 2026 21:20:34 -0800
X-Gm-Features: AclHuK-SIIyleRJSywdY0Z0pO7le2Nv4F_kttBOVsLQnGOrWIxGto2xb9JrsOXE
Message-ID: <CAKxU2N9a6+0DXxtTxNwxWm6yBxmZS+AHpBLzyNBsvfRBasgAWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: gsc: allocate formats as a flexible array member
To: Inki Dae <daeinki@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 8:41=E2=80=AFPM Inki Dae <daeinki@gmail.com> wrote:
>
> Hi,
>
> 2026=EB=85=84 10=EC=9B=94 5=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 9:11,=
 Rosen Penev <rosenp@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> >
> > The formats array is allocated separately with devm_kcalloc() and only
> > referenced through the gsc_context. Make it a flexible array member at
> > the end of the context and allocate both in one go with struct_size().
> >
> > Annotate it with __counted_by(num_formats) so the array accesses can be
> > bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.
> >
> > Assisted-by: LLM
>
> The allocation and lifetime changes look reasonable to me, but
> Assisted-by: LLM causes checkpatch.pl to report a non-standard
> signature and an unrecognized email address. Please describe the AI
> assistance in the commit message prose instead.
It just wrote the description. No actual code. I'll use
devm_kzalloc_flex in the next one.
>
> Thanks,
> Inki Dae
>
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_gsc.c | 17 ++++++-----------
> >  1 file changed, 6 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/=
exynos/exynos_drm_gsc.c
> > index d9637ddfcfc4..f1807ef664e1 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> > @@ -99,7 +99,6 @@ struct gsc_context {
> >         void            *dma_priv;
> >         struct device   *dev;
> >         struct exynos_drm_ipp_task      *task;
> > -       struct exynos_drm_ipp_formats   *formats;
> >         unsigned int                    num_formats;
> >
> >         void __iomem    *regs;
> > @@ -110,6 +109,7 @@ struct gsc_context {
> >         int     id;
> >         int     irq;
> >         bool    rotation;
> > +       struct exynos_drm_ipp_formats   formats[] __counted_by(num_form=
ats);
> >  };
> >
> >  /**
> > @@ -1222,21 +1222,19 @@ static int gsc_probe(struct platform_device *pd=
ev)
> >         struct gsc_context *ctx;
> >         int num_formats, ret, i, j;
> >
> > -       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +       num_formats =3D ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_=
formats);
> > +       ctx =3D devm_kzalloc(dev, struct_size(ctx, formats, num_formats=
), GFP_KERNEL);
> >         if (!ctx)
> >                 return -ENOMEM;
> >
> > +       ctx->num_formats =3D num_formats;
> > +       formats =3D ctx->formats;
> > +
> >         driver_data =3D device_get_match_data(dev);
> >         ctx->dev =3D dev;
> >         ctx->num_clocks =3D driver_data->num_clocks;
> >         ctx->clk_names =3D driver_data->clk_names;
> >
> > -       /* construct formats/limits array */
> > -       num_formats =3D ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_=
formats);
> > -       formats =3D devm_kcalloc(dev, num_formats, sizeof(*formats), GF=
P_KERNEL);
> > -       if (!formats)
> > -               return -ENOMEM;
> > -
> >         /* linear formats */
> >         for (i =3D 0; i < ARRAY_SIZE(gsc_formats); i++) {
> >                 formats[i].fourcc =3D gsc_formats[i];
> > @@ -1256,9 +1254,6 @@ static int gsc_probe(struct platform_device *pdev=
)
> >                 formats[j].num_limits =3D driver_data->num_limits;
> >         }
> >
> > -       ctx->formats =3D formats;
> > -       ctx->num_formats =3D num_formats;
> > -
> >         /* clock control */
> >         for (i =3D 0; i < ctx->num_clocks; i++) {
> >                 ctx->clocks[i] =3D devm_clk_get(dev, ctx->clk_names[i])=
;
> > --
> > 2.56.0
> >
> >
