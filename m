Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794198842;
	b=TpEhDVfe8AbvMJ8Z8bJ6t3gJE7JPEj7fnh8KPLOyi7QQ/9MJB03mRpBOE9xUz22fICYm
	 6OdCqIli4nQ3tJynNEn67GTlIzGhQM0Ks27an/WMYmAAOvy//RE6ZmhLrpEJO2/gJH4oG
	 na9JWrgQCw3GRO21rB+0Emxz4S3Gbl/7kSEJUeT4rWXmUVmFU19NnvcSymPdeJd02gycr
	 f9k/713O8ENrx6otIccf/6ijlcIyqTQcKASwLomUvI/XiauGUgzXN4iwYUUlqPGruF0jS
	 3kvgthOpZwU5wVW3CJMllViiPTfw1yRC5W4xPI03YDZz9a+dOYjHSjabiZ7v7cQwwQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794198842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+KZfMQTyVl02e8ANbgPdMXZ52kWV3/1B9wyIuCkTXxg=;
	b=RWesCoRurRLTgyUHT6OC30tkgLwXKtXUb3OcdfJVq2UnbwiiKSpCLbCn+Be+Fpfersbk
	 lGvs9OzE3MxGzXMiMzxlJxFKTTjoaQ/xQeR4qGWmX2lqXF7LQqdp3cCSOcGOl9p1J19+w
	 hx2CkFoPmYE2FgJTSDSjsFRReZwhnGTaxl5euvTXz4gL27+4sapdCYwsY8OWhoUFpZpmR
	 t7dq2BVMp+2xD7WguJH2UFZKhvvhDeaeDSh7b0TazXzMtN7+AS/0S4eJzbiNJ+b3FXrW9
	 5SJJvNiu21AXgT5QiGrqbLnrkybBa4xQEFDOL2gHwh9ZARBNoobk2h5DxNUqhl3L2UQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cE+TvgUh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CA3606A33E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25CA3606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cE+TvgUh
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso61291766b.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794198840; cv=none;
        d=google.com; s=arc-20260327;
        b=ltWf0vm5OjvegZEre/WLtGNz1xxUbgNwup2W7UIcf3iR2djq2plTPfn44btZuQwrfF
         1WST1RFgwuOPPTjqr9Vcdi9xP300gBtCPvya5sC7cmUkgXnDQ41H0uhE3++JipL7+V3d
         7Q5hi6NeRmWVfRRSEFLYtPTqqxdxGTWNMYhYrRgunC6Xy8bc267AqC7jOBHmgwLN6XBI
         hQ7bz4Rls6VKb7qfFV6IVHFv42jwsZRy69e238V6Ko+afoa5WYJv0CKokRp+Rb2frAuP
         7OI3RLsHOUnMoLgGw8890M8ekBlpBWCmHYxPkZyLgjyIt71o3Zp9ctfB8mZIOwFE7lgh
         ABzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+KZfMQTyVl02e8ANbgPdMXZ52kWV3/1B9wyIuCkTXxg=;
        fh=Yrd/Lc7TWmxqaomVNjIAlfhDLm469EupGu5jAhasRGg=;
        b=DrW92cuSOftVawL0+uec8ibIh6DO8TQftYi02xGaKe0JOcxTGMS6Rp9toDf6c/JDQe
         qYYoG4dV/rs1W/VB+nJ6SwLWskFUsPbXrNBeG0Vlml0y3xoB8GgjU+hS/fzsfEJ4go25
         n3VgBcS34ZPVUAo5tFUGehj+gRMezF02qLfu/4JU2wn/JVOZ4J2RSbihl1/SSXUnBoWy
         jOcmqiumSzWvyDzj7UHC7AX5fgwvGVtnqg5U9UwWw6dw/j5sFtwL2pS8iA2XEvLdedhu
         Cp4pFZPDBX5F0cCt3bi/u8K+AXhPiw7gsC29v4qIYLnbuQ4aD6MURp6km3Mj7Fm/C3DZ
         QTdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794198840; x=1794803640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+KZfMQTyVl02e8ANbgPdMXZ52kWV3/1B9wyIuCkTXxg=;
        b=cE+TvgUhFThTLr3JE+C1ZlQ+Q55N6LLNa0OrEiv09d8eghwiw2yMa6WZV12mkUrdMl
         6Mvy1LGFKpPerf4MWw5xwfnNBxN2q7iDFIUUYYvKZUI5mNWTU29YtpXqsIEYqb38YrVC
         87R94ilSNUWGde3/XNm3SoMTaPSPkCN/sD4icSKv0BxLBA0NndnohpeajtrujTTERf+o
         cyPO5iVi7O4afFUufZoGNOdUi+2WtqRUVXk7xsGwOd/glIUVjMg4D9DmY/t4Kk7N0J6E
         5sl3Ulzmz8xDP4ew87+pN+PBjCzZsZyUUn/faa1N5nFEUcx6Hbk6sgeo4HN371cKMSG+
         kM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794198840; x=1794803640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KZfMQTyVl02e8ANbgPdMXZ52kWV3/1B9wyIuCkTXxg=;
        b=KYgAsMESX/ok+g6exPRnQHzRL/PsE3fmBfOGpWeftaazsqNNVwnH3+lvLQW/ErgbCF
         pwgMjtrBnBxKhmaPp+oG5mYmLrLp22OljM/8X8ZMWUIPIUCYYdbYo+wF/9U/SP4nvg3T
         kesxRyOQqlpKHrqPNNNJh7IShfrtm77GH654P+ekTmM2uA7vZ6LbO2DZ5EG97TfpZ8xP
         6kBFH36rbTgeGvp1HTiUWSBwLt5I6fBbKogL5u1D6yyZUmdMux4jkkrhra52N3YbzQK7
         Tban03XbCZWjSoA4QKtgF293ySYjjS0FxHSBqyVjM1/QDuESWcv9FMY+9kj0Oyjxhwln
         nskQ==
X-Forwarded-Encrypted: i=1; AL+hErEpOL6lWCa+Bxiuwo6NvP72t58i/UrsFEcLOtnRrFVk6kzxQuepQmSUQpEqKhYy5GjOgKVqQID510KP1L8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qt9cIDgEpe+a8UCtireCCX+XnoOxFMH8T+FigMek0BJMq4Hq9
	w0FkGkG15wjj9J5soZuXNNYhL1BptrH/BeV3JyW8kkAjV+KVVYJDxmWM63GPJ6TrB2Jb+6sjFgw
	PZTFSj2ebXCGaRpZTfJZoYGDQBO+TfpY=
X-Gm-Gg: AYBFou0jHRZDOE/CNkI5WRpOA+hBAt2NEOH662wfCQHw+fFWYLW7TjSndoypM+mpA+0
	bQl/iU8fDQJ4zdrNTUftw8cQrzInX7sEepjWyHTbF//i4SlkIOoDdpXlVwKenuf+lGqRYXpGNC3
	OGhvv2FuBaoJ7LEOQbp9htYGe3qkOiT9ik4Dr3TIkUUCWEngMSrPAzCWbCCFfaWYaZQu+0Cdlsi
	2fHs4jSKOP6BU6YH3UngMl2d9qz/IVdsPZSaJQHsiKFlUOxODIgFjMsMGLS1pnZDyzxDbJDFshH
	PTY2ZabMRUn+a4vN0k/mMherWRXQBHH93U8lyPdujJeLpSj5TgvWaw8lQBoaHH/iP+6i1q+Q9y8
	S5+G5nBd6qxUzYdSF40PWJKv5z7k3T4cqeM4bqnwgDNlTAmSGJuMBEyT8X92dSkfgw1i/0hm+u7
	YpCxqR0pPRzh7S
X-Received: by 2002:a17:907:72c2:b0:c2e:4292:d268 with SMTP id
 a640c23a62f3a-c4d6daf7c64mr226694166b.16.1794198840452; Sun, 08 Nov 2026
 20:34:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005001118.576198-1-rosenp@gmail.com>
In-Reply-To: <20261005001118.576198-1-rosenp@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 13:33:24 +0900
X-Gm-Features: AclHuK8JGFlUXZkSE5CgvPvR5Q5pqnVQnyO-MTmGLdNc0lY8Yjx1OxeFaWmjmHc
Message-ID: <CAAQKjZObmQm1X28cbpjd+dEVx93wfBwKNaaaxpU08o8JeFaZfA@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fimc: allocate formats as a flexible array member
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
> referenced through the fimc_context. Make it a flexible array member at
> the end of the context and allocate both in one go with struct_size().
>
> Annotate it with __counted_by(num_formats) so the array accesses can be
> bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.
>
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

The allocation size, initialization order, and format array lifetime
look correct to me.
checkpatch.pl reports an error for Assisted-by: LLM like below. Please
describe the AI assistance in the commit message instead of using this
trailer.

WARNING: Non-standard signature: Assisted-by:
#57:
Assisted-by: LLM

ERROR: Unrecognized email address: 'LLM'
#57:
Assisted-by: LLM


Thanks,
Inki Dae

> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/e=
xynos/exynos_drm_fimc.c
> index 09e33a26caaf..079d24d0671c 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -99,7 +99,6 @@ struct fimc_context {
>         void            *dma_priv;
>         struct device   *dev;
>         struct exynos_drm_ipp_task      *task;
> -       struct exynos_drm_ipp_formats   *formats;
>         unsigned int                    num_formats;
>
>         void __iomem    *regs;
> @@ -108,6 +107,7 @@ struct fimc_context {
>         struct fimc_scaler      sc;
>         int     id;
>         int     irq;
> +       struct exynos_drm_ipp_formats   formats[] __counted_by(num_format=
s);
>  };
>
>  static u32 fimc_read(struct fimc_context *ctx, u32 reg)
> @@ -1273,20 +1273,16 @@ static int fimc_probe(struct platform_device *pde=
v)
>         if (exynos_drm_check_fimc_device(dev) !=3D 0)
>                 return -ENODEV;
>
> -       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +       num_formats =3D ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_=
formats);
> +       ctx =3D devm_kzalloc(dev, struct_size(ctx, formats, num_formats),=
 GFP_KERNEL);
>         if (!ctx)
>                 return -ENOMEM;
>
> +       ctx->num_formats =3D num_formats;
> +       formats =3D ctx->formats;
>         ctx->dev =3D dev;
>         ctx->id =3D of_alias_get_id(dev->of_node, "fimc");
>
> -       /* construct formats/limits array */
> -       num_formats =3D ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_=
formats);
> -       formats =3D devm_kcalloc(dev, num_formats, sizeof(*formats),
> -                              GFP_KERNEL);
> -       if (!formats)
> -               return -ENOMEM;
> -
>         /* linear formats */
>         if (ctx->id < 3) {
>                 limits =3D fimc_4210_limits_v1;
> @@ -1320,9 +1316,6 @@ static int fimc_probe(struct platform_device *pdev)
>                 formats[j].num_limits =3D num_limits;
>         }
>
> -       ctx->formats =3D formats;
> -       ctx->num_formats =3D num_formats;
> -
>         /* resource memory */
>         ctx->regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(ctx->regs))
> --
> 2.56.0
>
>
