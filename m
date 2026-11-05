Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862670;
	b=0EkaQ9gVQhmFfJhmlkPAKmQyykbJ9/vSthwbf+WC7y4jyQmI7cnj3uHLD6K364UHO/Mq
	 3FYGS8HX2aVXc2ZFwMURbLrXfbx+GF+LOwxufpnI/ydggcR3F9r6gWofRxmB5nnf0bjTT
	 FPc7sGHilv/gi7k4iyMayPgjwxUUBTTWdKdnSqapkDuzRnhnQIBi6VJNtvi2B3O2JmJJi
	 X0vS1sB885BS+Ahr9RMIEUMzz39GvflSfruYbeeUfiRdAXsr0FEaeLa/aExtTxa1Eq0lB
	 FEWXQUuW5j/j9feL2YWcYc/rvPjGBL7V+iY6MujdHiaK/fyNUApzT0Q+BYZtvO4wK2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862670;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3eCiUVEIn5Dtr6Rp4L6xryJLM3aqYcQ7JcHCgMFb16E=;
	b=RMKRLHTDU0mejn2Q2kMNE1256O//w9zl8ivxOe7wyfACG+Wh44raDz8/J76CDKmidePw
	 4E8x3KASOIYOWL8d8D9dyUF4AdDNA6ejvthoQeUey7f88NpPTUqEA38+nhPLfl8qz8pKv
	 Gt+LtVmCSMP27o4kEn77FYPmE9+BRJIskNXawe8TePmeFrGDE1KC5ajusd/He/iMfqaS6
	 70YRTQTR2DvATcBDfhdlu3OLuDgq9fTkFt/A6UolFdfbnorgywpYEaQT2z7ZAw+voYzC6
	 gVixcAMDaNv8hX9Asot3uTS6vAfSNL6dRBw8Ph/k+67kTobCag3t8XvD1VVULXThbqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UCgRYLD3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED697606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UCgRYLD3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8455B1F000C1
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793862669;
	bh=3eCiUVEIn5Dtr6Rp4L6xryJLM3aqYcQ7JcHCgMFb16E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UCgRYLD3HfQA9V+CuIdExN7Z0kYYF87hU4x0q029MdZm90HzklRXoBR9BncHSpeY2
	 MeEEUzFxtJFupj/ZhGxroh+noVynHF8JSi2Z/mta91JEZnbO2B0Rh73QStJJHf5eQE
	 wX9g+MTouimCMmE7JM3LrAhX5HhBL1umh6D3N1O8/Wtei+TIR+PF7xoKLxYLe7Zxbk
	 gB4d/wvN6200b+YBPFdWeZMKPgzVsgh/k7uYwFBE3F0uvPm2s3RzGo1B5RFDeW44c/
	 JpjDEG8xYWgGqImbApkrsByKcNw4B9nHkWAxp7dk7GTg8Z8zFN4+tVdVIguISG2yGa
	 d5ky32pJuVkYg==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso3116321a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:11:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxuGUXhQohj+bBdrlvD3nMzQQLDNi9lm24NoNDVb/MIxfs3flaYZCkAPvyyjxin6h/+2xiDQiq4qOcyfAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XmY30DgHFKAeCFNgl9f7qsynHwQk6T+6JFROjeAbHpW64v3eA
	q7gu7H2kpvu1bOAdfefavydg3BpBIVLOSFSq+CIrnjRJIxQSc3oUSttxKy3BFuO6jvNtxPQj+59
	qdRElsInGzoD56qaiErP/qAuOEeywWs0=
X-Received: by 2002:a05:6402:280f:b0:6b4:e433:ee16 with SMTP id
 4fb4d7f45d1cf-6b4e433eed1mr14476573a12.43.1793862668184; Wed, 04 Nov 2026
 23:11:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105025532.2055-1-zhaoqunqin@163.com> <20261105025532.2055-2-zhaoqunqin@163.com>
In-Reply-To: <20261105025532.2055-2-zhaoqunqin@163.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 5 Nov 2026 15:10:55 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6oNoo5UDoYGbumPx8b=eWuH15m520y_zA8O+qf7Kg9Ow@mail.gmail.com>
X-Gm-Features: AclHuK96l4YPX7dHi09PdavtUMdEWQoDoUgL0cMZJqxsooqttImuU3yY0lMw0_w
Message-ID: <CAAhV-H6oNoo5UDoYGbumPx8b=eWuH15m520y_zA8O+qf7Kg9Ow@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] EDAC/loongson: Rename driver-local symbols
To: Qunqin Zhao <zhaoqunqin@163.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	zhaoqunqin@loongson.cn, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 10:56=E2=80=AFAM Qunqin Zhao <zhaoqunqin@163.com> wr=
ote:
>
> From: Qunqin Zhao <zhaoqunqin@loongson.cn>
>
> Remove the "edac_" prefix from driver-local definitions to keep the
> edac_ namespace reserved for EDAC core functions.
>
> Rename edac_check(), edac_probe() and edac_remove() to
> loongson_check(), loongson_probe() and loongson_remove(), respectively,
> and rename struct loongson_edac_pvt, loongson_edac_driver and
> loongson_edac_acpi_match to loongson_pvt, loongson_driver and
> loongson_acpi_match, respectively. The shorter names are unambiguous
> since they are all file-local.
>
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

> ---
>  drivers/edac/loongson_edac.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
> index 3ed4d34a33..5dfa41e877 100644
> --- a/drivers/edac/loongson_edac.c
> +++ b/drivers/edac/loongson_edac.c
> @@ -13,7 +13,7 @@
>
>  #define ECC_CS_COUNT_REG       0x18
>
> -struct loongson_edac_pvt {
> +struct loongson_pvt {
>         void __iomem *ecc_base;
>
>         /*
> @@ -27,7 +27,7 @@ struct loongson_edac_pvt {
>
>  static int read_ecc(struct mem_ctl_info *mci)
>  {
> -       struct loongson_edac_pvt *pvt =3D mci->pvt_info;
> +       struct loongson_pvt *pvt =3D mci->pvt_info;
>         u64 ecc;
>         int cs;
>
> @@ -41,9 +41,9 @@ static int read_ecc(struct mem_ctl_info *mci)
>         return cs;
>  }
>
> -static void edac_check(struct mem_ctl_info *mci)
> +static void loongson_check(struct mem_ctl_info *mci)
>  {
> -       struct loongson_edac_pvt *pvt =3D mci->pvt_info;
> +       struct loongson_pvt *pvt =3D mci->pvt_info;
>         int new, add;
>
>         new =3D read_ecc(mci);
> @@ -74,13 +74,13 @@ static void dimm_config_init(struct mem_ctl_info *mci=
)
>
>  static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase)
>  {
> -       struct loongson_edac_pvt *pvt =3D mci->pvt_info;
> +       struct loongson_pvt *pvt =3D mci->pvt_info;
>
>         pvt->ecc_base =3D vbase;
>         pvt->last_ce_count =3D read_ecc(mci);
>  }
>
> -static int edac_probe(struct platform_device *pdev)
> +static int loongson_probe(struct platform_device *pdev)
>  {
>         struct edac_mc_layer layers[2];
>         struct mem_ctl_info *mci;
> @@ -98,7 +98,7 @@ static int edac_probe(struct platform_device *pdev)
>         layers[1].size =3D 1;
>         layers[1].is_virt_csrow =3D true;
>         mci =3D edac_mc_alloc(0, ARRAY_SIZE(layers), layers,
> -                           sizeof(struct loongson_edac_pvt));
> +                           sizeof(struct loongson_pvt));
>         if (mci =3D=3D NULL)
>                 return -ENOMEM;
>
> @@ -112,7 +112,7 @@ static int edac_probe(struct platform_device *pdev)
>         mci->ctl_page_to_phys =3D NULL;
>         mci->pdev =3D &pdev->dev;
>         mci->error_desc.grain =3D 8;
> -       mci->edac_check =3D edac_check;
> +       mci->edac_check =3D loongson_check;
>
>         pvt_init(mci, vbase);
>         dimm_config_init(mci);
> @@ -128,7 +128,7 @@ static int edac_probe(struct platform_device *pdev)
>         return 0;
>  }
>
> -static void edac_remove(struct platform_device *pdev)
> +static void loongson_remove(struct platform_device *pdev)
>  {
>         struct mem_ctl_info *mci =3D edac_mc_del_mc(&pdev->dev);
>
> @@ -136,21 +136,21 @@ static void edac_remove(struct platform_device *pde=
v)
>                 edac_mc_free(mci);
>  }
>
> -static const struct acpi_device_id loongson_edac_acpi_match[] =3D {
> +static const struct acpi_device_id loongson_acpi_match[] =3D {
>         { .id =3D "LOON0010" },
>         { }
>  };
> -MODULE_DEVICE_TABLE(acpi, loongson_edac_acpi_match);
> +MODULE_DEVICE_TABLE(acpi, loongson_acpi_match);
>
> -static struct platform_driver loongson_edac_driver =3D {
> -       .probe          =3D edac_probe,
> -       .remove         =3D edac_remove,
> +static struct platform_driver loongson_driver =3D {
> +       .probe          =3D loongson_probe,
> +       .remove         =3D loongson_remove,
>         .driver         =3D {
>                 .name   =3D "loongson-mc-edac",
> -               .acpi_match_table =3D loongson_edac_acpi_match,
> +               .acpi_match_table =3D loongson_acpi_match,
>         },
>  };
> -module_platform_driver(loongson_edac_driver);
> +module_platform_driver(loongson_driver);
>
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Zhao Qunqin <zhaoqunqin@loongson.cn>");
> --
> 2.47.2
>
