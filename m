Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794199309;
	b=SSfwTQeTMSt37ZnLCmJ4xTBSxuCgv3KW9UA9u2w5uM0afsYetDsOFLk0AkGP5I2bdhXN
	 pF+4Qii+fbWqVzHNjJS1DcF7vjtWHxPN+pTfPocB/ciK5EDwi5g4bKlDK4fy0tG4zpR+n
	 ywW2HwD8BpcK8M4ABuutP1CJtoHyh+T8wetgvLHqdGGU5NhGeMqMc82X9oUUwlrpenJwt
	 w1foZJGf8fTl3figXLjVYJW6ZXpC4pc0rniwzHlgxIW119jdY665lT7yl9vdlfJdwEvk0
	 OXsTHRZptbhvHXGdN+onmppwyyRuJ0bXqU9o68DFKQjZh8aJ884op9V8If/+u3vI48g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794199309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=27RG8D8CerxM4BmQ9ucwQVVSwZlvRge1TEEkPaNQ8Qk=;
	b=438nUCLDYoWvjS/cYfuQNP0rJgqfWBAZbc7W66wA7CieIYq/XAyDe5UkXUqfCwD7yvXs
	 K4sCmEtmf2zQFTdLG3mH7pqP4gOqhOeIfDPLocHc1CjhFH4Zzy6lBcRxSI2S9h4FJCLui
	 l23rtZbgVnv+nV6MNQgsztqIYKocyQvCIuocQOICCtXB7+f0rHLtaEmOs7zglbF8U+3Ok
	 sDvBK2RwyJzuN2zMGXlgw9aZLx1DsktiMztxk+J6+GrSv6Qnfo2vzkwRVJNVgxvwIWQMc
	 4MrETRlDB1N08lTwbtHoRlwrC5hHyY37sCzNSttpPXdLxu5TzERBnxP8hSEl8hjtwcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XL67E+6C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D8D606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D8D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XL67E+6C
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d427836e9so57451966b.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:41:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794199307; cv=none;
        d=google.com; s=arc-20260327;
        b=cuDzZYi9+JIUPaTJy/TqrTAtnuP0Tt973aahiOHa8zS5fe1Ws0bfZTs3+PlFRtDGlx
         XE2GqkOww3+iOu/bZ2kLQfIY3Okl6bnYeTsFs1YJIE/ld8w4S3DjPH95l941GESkI7BA
         Sgsxl+ZuUMv2IpjEoNPNsdjqR6nBp+5ko/+ozgfYrgcpuBOi3vftYdJlfKc9fGysSOhu
         oTwK/mPNPxaP/1+QpvBVSvfeQ6OjVpv8gT/tQwhV4PLySDUA1XXz2XBOIkJHLnWYK9Kp
         x0krpv+ilRftBPwlA6obcl2h8bZg99m0ey9eXaIAMniSxFbHfNCgaToVJWVgII4W0tqD
         uP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27RG8D8CerxM4BmQ9ucwQVVSwZlvRge1TEEkPaNQ8Qk=;
        fh=/4WxSXaxkC1+YFF0qr1qFMIppg+xIOrEcEBVCbIxglE=;
        b=G9TBNCjzFCZFZF9c4JSWCth+qDngB77YRzLPIPhm+jMlZhA9gAEyKq6ZAE9haHEwE0
         4tsAtX1RhbIHp7BswUaFmxhp6Q99eKk/DbGpdGiQHWnV7Xbkul5bOrbNKgkXDnZDgCSC
         TlLZZtdsqePDF+4xPw6h5WdGSBeZqhRqkGuLXx6pFOhyb04enXUMndIh/GFImZD3axLq
         5LsnZA6UeZK221kiOpDE3ZbZdMCUC/bCpk8YhMawhRPZT+xVyKH41Qf+iGD72tNV5y1r
         l//xy4ZCCgKys4vWdqdgPS7pe9cKzbE3hnGOjidJjzargqws6biDE1UtKaPsJImdRUvn
         0g1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199307; x=1794804107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27RG8D8CerxM4BmQ9ucwQVVSwZlvRge1TEEkPaNQ8Qk=;
        b=XL67E+6CWlgF6TMSKOxYtrmXheerI7gxjQHnzgaJ8fObVIn9fOePSsXpAm4jOuofTF
         JUa9+99lY+OsAfdXl17zL3hpp5FHvDYFIf9QjfViZnwYD0NNrDWWEqJ4hlW67FAJMPQB
         dQYuwABZR3fG8/wG3BSpt4hD2vPDv0MQ4bZ3WCwMGSQ0wz7vDhFUYrfW6deENy/fRobF
         G+5XDXtDBwA9XC5kYyw3Mv+ab8M405NnZp86LZuTYErY080guobrxmbyglJuPwyWkK8/
         xZTCgu0NmSgTNnE2WBiHipzOOotnAdFJ4HoM8GEXJYJWF51slx7oNW8Yovbo8OhkbFHu
         mwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199307; x=1794804107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27RG8D8CerxM4BmQ9ucwQVVSwZlvRge1TEEkPaNQ8Qk=;
        b=G0LhKokWOcKILwfI2zHD9wU1zZ5989bwV/3kolSevllOVTyUp26C0iAkCd9uNjDL+6
         yl/CKo1VrFrynPakFeDoSiTaPrESOJ2cz0yZFtWJsodDXWysZxEqt/c961h1OhV4N0C6
         1xOtW+z01J25HTeGBNPYyiRHv2LP0ezX64hf8+Yccm/JonScSCIGN6gG0zyTaWoWL0gw
         dbSygXjZ4w98Uu9+LzxpsXlrae1ECLVT67ToCrer8wSE1NOnN58m9uRw9adu/3Rzyf9a
         NbDrLlkj1OChCoMjZS6peXAvMk9wkcEOcdRILt7daFifnpQ3jtsbAOSTmJfmZL5TKAxT
         dqFQ==
X-Forwarded-Encrypted: i=1; AL+hErE5PRrYXNOZD7Qmab0Zn1p15Knv+td3YOnxd5sxyhElsfRe92QLuGIznRyVCR/IgVIwqpFBg4MpT80dHAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V//zd2GTz+M766CgRKQdWW4dT/qrAvdwb2o+wpWiJqDRyOK0A
	CSHPcXdJPttljYBIuqwbu87tC2JF9JapSuXcApcY9kTLOzQL5eBSoU+JV6yCKtXQfvh+P0yeq/5
	ZFV9WzkjDStxY72XawP4htgPlogw01u8=
X-Gm-Gg: AYBFou2lZ3ua4IIGSjIqm0tCEoIEUvlxQ/vy3jMmVLOOR6ok675WB2ryZwXdcM3ZxzP
	frDnY8coAFndP7th0QF+0jvQKFGzJDSLDKDhm9+sl/pEv5VrUkwvbzeO4Fl8xxj7gPBg2hSUWqS
	hBbO5fxh2BbQu0LhCJ14JNQcGJlbE32u1ezFEGjIWzvCdnqNTZCG1o3IUu0h8aE96w6pBTehCxl
	nTmnHXs7sIyv+Zf9fp9NCboYEE1xQVj5CloEh0S/uqrhcymx2JYtMMxmaMXNMdpp0d9rvypCuES
	F9ThkK+NemLhXX7hc7yindVsZlHgMmInilGAQMoNfZr7q7YpkjPE6PB/Pe4RAKH2q+oLec7vI4y
	jiRaxsEk7MJkunF6S+Hw9vGd716SNgAHKLmQ2CLZXN0CbpsduUmS81cEn10Dy4/9NRbA=
X-Received: by 2002:a17:907:2d93:b0:c26:19de:9aec with SMTP id
 a640c23a62f3a-c4d6dd8cb24mr224378766b.43.1794199307082; Sun, 08 Nov 2026
 20:41:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005001143.576737-1-rosenp@gmail.com>
In-Reply-To: <20261005001143.576737-1-rosenp@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 13:41:10 +0900
X-Gm-Features: AclHuK-aAUizeCRuM8WnAlvp8mvibSB9oiekBPg9ucUpGQvhhZ0l_iKHx8QZ7R4
Message-ID: <CAAQKjZOm5vA+38XVo5D4qV5B9eRT1seOShk-eFk_Jg_EQPdaOg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: gsc: allocate formats as a flexible array member
To: Rosen Penev <rosenp@gmail.com>
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

Hi,

2026=EB=85=84 10=EC=9B=94 5=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 9:11, R=
osen Penev <rosenp@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The formats array is allocated separately with devm_kcalloc() and only
> referenced through the gsc_context. Make it a flexible array member at
> the end of the context and allocate both in one go with struct_size().
>
> Annotate it with __counted_by(num_formats) so the array accesses can be
> bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.
>
> Assisted-by: LLM

The allocation and lifetime changes look reasonable to me, but
Assisted-by: LLM causes checkpatch.pl to report a non-standard
signature and an unrecognized email address. Please describe the AI
assistance in the commit message prose instead.

Thanks,
Inki Dae

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gsc.c
> index d9637ddfcfc4..f1807ef664e1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -99,7 +99,6 @@ struct gsc_context {
>         void            *dma_priv;
>         struct device   *dev;
>         struct exynos_drm_ipp_task      *task;
> -       struct exynos_drm_ipp_formats   *formats;
>         unsigned int                    num_formats;
>
>         void __iomem    *regs;
> @@ -110,6 +109,7 @@ struct gsc_context {
>         int     id;
>         int     irq;
>         bool    rotation;
> +       struct exynos_drm_ipp_formats   formats[] __counted_by(num_format=
s);
>  };
>
>  /**
> @@ -1222,21 +1222,19 @@ static int gsc_probe(struct platform_device *pdev=
)
>         struct gsc_context *ctx;
>         int num_formats, ret, i, j;
>
> -       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +       num_formats =3D ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_fo=
rmats);
> +       ctx =3D devm_kzalloc(dev, struct_size(ctx, formats, num_formats),=
 GFP_KERNEL);
>         if (!ctx)
>                 return -ENOMEM;
>
> +       ctx->num_formats =3D num_formats;
> +       formats =3D ctx->formats;
> +
>         driver_data =3D device_get_match_data(dev);
>         ctx->dev =3D dev;
>         ctx->num_clocks =3D driver_data->num_clocks;
>         ctx->clk_names =3D driver_data->clk_names;
>
> -       /* construct formats/limits array */
> -       num_formats =3D ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_fo=
rmats);
> -       formats =3D devm_kcalloc(dev, num_formats, sizeof(*formats), GFP_=
KERNEL);
> -       if (!formats)
> -               return -ENOMEM;
> -
>         /* linear formats */
>         for (i =3D 0; i < ARRAY_SIZE(gsc_formats); i++) {
>                 formats[i].fourcc =3D gsc_formats[i];
> @@ -1256,9 +1254,6 @@ static int gsc_probe(struct platform_device *pdev)
>                 formats[j].num_limits =3D driver_data->num_limits;
>         }
>
> -       ctx->formats =3D formats;
> -       ctx->num_formats =3D num_formats;
> -
>         /* clock control */
>         for (i =3D 0; i < ctx->num_clocks; i++) {
>                 ctx->clocks[i] =3D devm_clk_get(dev, ctx->clk_names[i]);
> --
> 2.56.0
>
>
