Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794203056;
	b=N/ZwicTe/do5y+Yr5GN5/W9NVBKB4p7px29cSOABYxR4T9hJPD8nRt1kKnJG3TVNi5e+
	 pmJEqhFB+sGedeYWBV3bFc9szOMVm9IJZ4jXxZ7wm79e0hWqX0hqqtXR7gMIZHum0kiH6
	 8QOrl9zaEQFvyV+k/j4j+QcGoD2qbhSSQ+wVtZq59kXBMC0nS1ZzEHg3JICtF9LNCYxVW
	 ilzXz67+Sx1WAzYei5OvJWCI4clxviempNKysWN7qvC8Xq2L0rhQzgIHD5GeAwRdD2ry0
	 JOifH4HT9kwSyu3CiPfPwzenBfDIGRWfYuGc7tQYI7fKLWTWJNnWXwAOZXNsRLXWwqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GaHnyYDJUGL+w/bA52PUwEBtFj3m3UWp7S/56d6GX2s=;
	b=ulm0utUVZ5qJhCtW0WuOH4PDdb4KcgR8Wi2zZf3pe7HRYLqsd3oJLa5XVuM5RnHS02dq
	 K5lm1fcVhKldrl6Ad6Z4HUa0LJ2QvS21DSZEFyvjHMtpiurGVF5fj3bFDRMDXgUWX9eYb
	 sKQVjyk3UO2Z6BUEJRjpeDEA4tqffzc08Xujwoe7Cc+gsEjunJ3gDlYMSCJ1jG1aAIUYV
	 kkJ7sDwnTvs8h6j0hYZ98aNs1sQI46+aVuD2msepmgdGLB75BDA4q4YLnI2RBD/3vgCcX
	 L9XGejfNEAtEtWr2F4O4InImehYZ/iHwxKwc6j2I6U8Cgc+ubDaiCE0KoBAeSZdr1Qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zjYECXCa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C9F606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89C9F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zjYECXCa
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso618604a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794203054; cv=none;
        d=google.com; s=arc-20260327;
        b=BkMiHQ9fcSIzDvjWy/L5wMESyMvKONUQctEyRvgLVjeUUxY2nIrI7Y80lzN+pKJoMi
         a/qFafSO53f8kuc4Zspa/YALPgve5lzYGcs4VDl2evDdBSzPLpB9qxP7NwlftyIrH1tT
         i6cSOWlFZoW9v01JRt+jgtqhR98b4qc1I5o9dQSOXL74Rooqa4xhM5p8JihqmcWQt9Xt
         YhZfXS2Op1Nmg11ajUsfrVpe5bQdKG36Ec15fJjeuTrk89hDVxhIRg1HnkHTRS+rP0Py
         Xw73q6HhxlHGBrvQbyt8CkGkkeUEHvavCAlNbL7QZcS0wCfasNn+tAZL1PKHOBT6YDlL
         p6IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GaHnyYDJUGL+w/bA52PUwEBtFj3m3UWp7S/56d6GX2s=;
        fh=yT0nT/h0w4FTz0H7hE3JsqNDhaBDeJOW3sFdkMco1Dg=;
        b=a26sbxpYmFe9/a8RvDGy9tcnxb0WoUELuZi1BAQS+55U45c0K2iPuEyua/MD0jlYvM
         hp1vz+iDruiTQYQlQr0CaAiEiWLvGQi45FeKSedHjUhwLnP5IyLm5Na2TwKWOCmtKDit
         9LM2wB+vibfsUy63rljvwIsEBQcP1QXnthT6ZAkxuPdWlXtqCk6xE09NYOww1j8JGaUr
         WQyZy39P9XliPqv33la2bleLpE4FdUUT7lGNXnWKG+DZqq6H+Ozh3JEcAwFLuqU36ozg
         9QU4vzJTuxYwrmzeot/BriJ01Lc6SWuHetJvAwwDBHFmaThHLFymdM/2/gAATsdpVNO8
         yWYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794203054; x=1794807854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GaHnyYDJUGL+w/bA52PUwEBtFj3m3UWp7S/56d6GX2s=;
        b=zjYECXCacixsKh4w1x/IPCowGrIdbqDiKWl2+tgp3A1ou3pVOqCMYSuCYg8OYhAx5S
         fN57ox4JIHVBxhOKf2z1yn1W6QUrXIgsqAq7wkFYFWhtB5rj3Wq9RRs89R/Fup+I+s9z
         PAqnbFngiu+8AxW4buU4r9AEU/qlp+6oNj4mY3I1DVE/Z6Gd0IknaQ7K0bO2nRx18ZJH
         T8J1mk9V9KnlusHFFd796YDpkDWXfLut8MXRT6L6U+OyvzmK1zCHvhilgW7KTs7lnPh0
         jHKZL9ZQgO6r8QI/D/oP1gJfbsjMbtE/AaFxJlIjzLcc03aq21W0/+TF8plrn+zoOKOU
         REdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203054; x=1794807854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GaHnyYDJUGL+w/bA52PUwEBtFj3m3UWp7S/56d6GX2s=;
        b=V0mUndw2RT6kaZmLyxOYA2gt9OBe2suZ3jS09xvXYkBbSWLvqrHbM1DPsLN2BqVk1l
         6lBBoWMP7qoLryrg8dtP0pUlm2Wb0PAH1NG0Dn6OLMZvaknp8PpzDpIkaTqJZEDee0LN
         H4td3v1/HvwkF5GNKCRDDCwOKwby118GFtvx77vDNf96HKUdzXrFSU1WbWIVRvUmWGOv
         X+u1VPdBfo6/3zJOWeOCFq1MMPwpp0CeZe3rF/HAVnPaKUQJerY4O3tMs/UbBtxTEBE4
         3GbLap8D8O4t4t81GCSBJ75reNTWr3nOSPxBrjO5Ldmygv7gZNU8P04Q2t0xyUgHXN8Y
         lICw==
X-Forwarded-Encrypted: i=1; AL+hErEHP51VpHHHsF6GbsXtaykq/4lY9UJw8c3LUaKNe8428R1awJhAhzecGZrlL0fc+Z4v57o7SFrLv5LsE3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uscVgZtx6q81C9mXebbJBqj24kPg5PYcjRR+qRThDRAeztBpi
	omkd+EdhRueuavUovSODKIRsUGIhR3y+ev8jsPUMUVZPiz1w6x2OzS2AlAHZUO7yQWrQ69huuR7
	t4fHptOpy8gOB5AmVHbTsudZ1qDijmGA=
X-Gm-Gg: AYBFou0edNNzsO/HNvDDc387SWhUfH5SbXh8DgtbR3I057Ddm8i4ElmFb9Sf4VAktMD
	NSWdumEj6NieE5EcKajO7SbN6P+r+byKBxYtAFfIfeKdp/djvzWJMR2S3920KD2O5ORtmr9FtQv
	9trN5A1f7DgsgveY/ACR8t1o7jVRz+NaIGpIenmWEUCAqBPnHrB7xS/FUVoi2nZndEgXwVT+qEO
	aOd3789DqeA7wEx4vqoS2pxYCX8Cod+bp4V2JE9FwrlGdtv9EM0CPK3L57XioCEreq85wazHduI
	5Yucqs8h0SM1x1+1B+u1lp/+Dc79AW9kAqJfKC+w8csdBB+vBVZr1RS+qa8YM7ufz8LiC2avQox
	MnJfLVWlLAKcZkD60V4r6krrVPQkyVQP8ZFw5lE7+hZ9FQaA4OMITRmbLjElGt4LiyPu5OFVKsR
	tZ4GBSGqZcKLkb
X-Received: by 2002:a05:6402:1950:b0:6b6:ef7f:600d with SMTP id
 4fb4d7f45d1cf-6b722450928mr1861820a12.21.1794203053889; Sun, 08 Nov 2026
 21:44:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260916072012.1967169-1-vulab@iscas.ac.cn> <rc-review-20261105-14-00955ac4adbd@gmail.com>
In-Reply-To: <rc-review-20261105-14-00955ac4adbd@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 14:43:36 +0900
X-Gm-Features: AclHuK-P9ELAlBzpu3kDklHAW6kBOMQIDNRsiWYypfDAoEI-hiru14eAfArO-Rw
Message-ID: <CAAQKjZP_djWPUxr+B8jH_m_=MAPFcWmxst7fR727uNbP59xagw@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: dpi: release the node after looking up the panel
To: Yige Jiang <yigejiang86@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2026=EB=85=84 11=EC=9B=94 5=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 5:07, Y=
ige Jiang <yigejiang86@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> exynos_dpi_parse_dt() acquires the remote panel node. The posted
> display-timings fix releases it on that branch, but the panel lookup
> path still retains it on success and failure, including deferred
> probe. of_drm_find_panel() does not consume the node reference.
>
> Put the node immediately after the lookup and clear the unused
> pointer. This covers both lookup outcomes while leaving the
> separate panel reference and its existing remove-time put unchanged.
>
> Fixes: 14b6873a0198 ("drm/exynos: restore parallel output interface suppo=
rt")
> Link: https://patchwork.kernel.org/series/1166158/
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---
> Based on linux-next next-20261102 (2637bdec0535).
> Compile-tested: arm64, GCC 14.2.0, W=3D1, CONFIG_OF_DYNAMIC=3Dy.
> COMPILE_TEST=3Dy.
> Baseline and patched target objects built from this exact base.
> No full kernel/module-link, hardware or runtime test was performed.
> AI assistance was used for analysis and patch preparation.
>
> This is an incremental patch based on the following posted fixes:
>   [PATCH 10/20] drm/exynos: dpi: Fix OF node leak in exynos_dpi_parse_dt(=
)
>   <20260916072012.1967169-1-vulab@iscas.ac.cn>
>
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_dpi.c
> index 92e8bbe9d35b..e98a9be0a705 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> @@ -243,6 +243,8 @@ struct drm_encoder *exynos_dpi_probe(struct device *d=
ev)
>
>         if (ctx->panel_node) {
>                 ctx->panel =3D of_drm_find_panel(ctx->panel_node);
> +               of_node_put(ctx->panel_node);
> +               ctx->panel_node =3D NULL;


A patch covering this same of_node_put() change in exynos_dpi_probe()
was posted earlier by Wentao Liang[1].

[1] https://lore-kernel.gnuweeb.org/linux-arm-kernel/a46a7710-0c2f-4fd3-911=
6-7678adca9390@kernel.org/T/

Thanks,
Inki Dae

>                 if (IS_ERR(ctx->panel))
>                         return ERR_CAST(ctx->panel);
>         }
>
> base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
> prerequisite-patch-id: 8f90819fd9f71f55560dc3af57c5a0bad07bc568
>
