Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F8A53ED19
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078665; cv=pass; b=dAPkiBJ6fQshNb0QCBBpWb/cYaTSsDnyJiSAK3p88dIDnKcAErfqfyDASfSAfJBeZaOTWgrz0l4lHX71w2dfFznW4YwArN/MPkTrim4IjNT++sI7W8+wSMfI7ldl5FObIJsrwfLP0j/H26DiJ4JzF/lJGknBAMDsnfMkQf566gA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078665; c=relaxed/simple;
	bh=saOqqMO6ORxyXnY0o31VkIfdYDLd6fh7SS1hLcwbeg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SfzuxZkXrd0WuqlghXKPvI2arGYnr8zWkyS8HDLpWpWJhjMnI9eJE1nU8yJxqbWmAKXBbId1AzJwPdBBrpY7J0CKIS1ynN3aUlMDTL1SeCO7L1vpXJ8su+Z69KV5R5icb50am2xHDP0ecZoYHSW9KXtOvT9bIVzO6wpiaCHBBlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=JdQU4ozc; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="JdQU4ozc"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso744441b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:04:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790078662; cv=none;
        d=google.com; s=arc-20260327;
        b=oCh9NOL9WhhzBOfioiNGyL88WcpqT5fQlzatmY9KQ5vkLvBdHnEi6yy3z8rgR2fm77
         3WJbnoBJ0JoHDt6n9r8qW/ZIikY0Bdppp+4SbspBzwHN2f8x6EDAYLHgv2CtyHyp/EhY
         0qiNmvp1i/HLnQvRdIydxMoapQ60XMuWVH3O13PJ6viYTsGuNz+JzHY/euv+/vAe4mMN
         zM41+eSrcpqbOF/DcpZ/xzldNl/NbtvJJwxB1uCjAZtq/Tt0zNf9yiSPZuqH/SBahfOY
         FItwb8pcJEefar9F8EDg1n5FU4owjv7GslI6w4Ig8sR+72p3XnIufnoaZTAm/y0KWGX/
         PWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CUpeNq3+QaUFHKyKU5yfrM/FkR0pBOt5e12bFHIM/Rs=;
        fh=NdKlR6ylTHYb+hLK5aUU/8//hHdLFYLUlL5+A7dyQvA=;
        b=qnVLcTUFfoWdIxNvBWzUCbkJO0sLUXYZEnzUL1xF6KYNVuRfMXLnKlp7U2w9SOfjbM
         03ea/biaK1lcDUQlxNaGtWfoO/7F4PB9nyMC9wgsSg/CRyYaI485D8v1PNxC9HHlxMlW
         LGkAtO5uj4q2/tbxJWnYWvScY0eBM/XKxh/K+MG05LW7aDKussznHual0del9HAyi2xp
         tn1XgwWq2ixQHGlN+WiP4Yqj4jz30fzalauaJcGwGhPQOYkpK7qyGpy3sFJn8AFattl9
         zUtT9IewQ9UCF26qssvpEB4DYwRU9mTtjOcsbCGBZbygl5cln6t7FF89fi+mbBIkCJXu
         7uaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790078662; x=1790683462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUpeNq3+QaUFHKyKU5yfrM/FkR0pBOt5e12bFHIM/Rs=;
        b=JdQU4ozcJCsLbPnqyumtwe0XM0EpQs2SblMpMjsIkYAUzVeO19hHsxxu0hC+MrusyY
         0JTSVVr6aeFyuY3w4KQzreBHKue8RAC/81mH7YVBeGvtrG23EmUtxnWhwXPozDTwdzzs
         NPjumF2YIDGD5hMhtSmxY7NFsmGI1oP9yf88Gq00dSSNZk1cmtCKmHLecUmYpxtoja1Y
         zxK5MBlPrf44emPF9ei+UwLlde2bAGQFdxPVX5hzrEXPGnrikEVLKWZcpMHUxoFlm6VN
         13HtiMJDQUkG8HDnnlRmCkdYtxhEAaFynWV0vtZxxKb5rjalKZymZNrxlmKgkGh83Jj1
         +tWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078662; x=1790683462;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUpeNq3+QaUFHKyKU5yfrM/FkR0pBOt5e12bFHIM/Rs=;
        b=fLUfpkybnd/9OznelyE/NIdqgbkTZX4rvcbEN1UsQn+Na+MhC/AcyJNA9vW75u5Lpa
         fA681s9sqWevySLtDDuqVGou80AaiZATyzhr/4XTrwty9ULAt4PUMnGJ0XQ5njeerPES
         rz5bOFhfAIp5bE0/HqWeqa9IYooPEhasqfcBmSh/WXdGJgFK5xZcAOePCuav/AQ3HNyI
         JiSWfoVN8jqRtxYYBkoezUBn7Ixzf0STVZFcBM+wyEI5hi9Am53pQLytomdduaqY0a9b
         Dhu00HttNgAA0l/gDG5pS7DOW4LMEJ+KOkJ+3Acg93c5iisq9IFyTyBhtBoB3qz1NvVU
         b76w==
X-Forwarded-Encrypted: i=1; AKwUvBx/qnnz1nKeLH1v+iDEV2DtR2f1iALbKvoeeHt0mNzsbfyKYthlbgMprJbQheWD1B1zno6vJQ+dUg3tFzo=@vger.kernel.org
X-Gm-Message-State: AFuF++kLcTj3GGPU3ZZnXyywCx/l8/LHfRSLXou2YDOzpVYe0qUExu+R
	krBijkYxbXZgejyuuYol1a8DoZcIpcohOgDkAxHF6/mVx4t8w2l03IXH18mAS2jCTCaQPnhT0Ha
	C/mRBW9TDMurKHgfbofSd/ufS/wRGngCGxKAPYjgY7A==
X-Gm-Gg: AYBFou1AZcCExHVI8rMg3Q2P61XI0yB3zZL0pDrMeLl/0ZlvxWuODZzwNCVNw4W7Svc
	LjewuCheD1t3bOnE7J329G425ddGMy86wFZgIf+ohgwinVLL5d6+gNGP4lTgGvsIHL8sM7J5048
	Izj8gVuGZqV/mVtscWZocvhFS4DnPVmu71mAJhOxbuyAR0UsJXtMhTvKYJ/n3NCXsENQFMjX8Uj
	85lDolpbOh7W8WUEHEEHGxMmqiRqMb/hOVAy1Xn5Ws9qKkIqe9p97naZrYNA8UBWVAs+34CzFyN
	t4pLKN7amsCaLzrORFE+EpokkFYXtMCH1EmaAg+fUbGLEOVK/5tteyL35mFJbUVAo0VGG1p0/XA
	GxlnZxoNLNV+KdJxCsKqqf7/1ozDU9HiHZq0=
X-Received: by 2002:a05:6a00:3a12:b0:878:3705:5724 with SMTP id
 d2e1a72fcca58-87c85de1562mr682886b3a.48.1790078662177; Tue, 22 Sep 2026
 05:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918153414.909333-1-aubin.constans@microchip.com>
In-Reply-To: <20260918153414.909333-1-aubin.constans@microchip.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 22 Sep 2026 14:04:09 +0200
X-Gm-Features: AcwNN1WHiWWomoXHzFPUnhbd-xc9yh6WSNzq7MyJexGie0-v5X9TH742BS0QVU8
Message-ID: <CA+HBbNHG-hTMLSeRKAb1hz4mDna3LDmoPA6CJ_DG6_oRWZajmg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-at91: disable selectively clocks on pm runtime
To: Aubin Constans <aubin.constans@microchip.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Eugen Hristev <ehristev@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Romain Sioen <romain.sioen@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Ryan Wanner <ryan.wanner@microchip.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 5:35=E2=80=AFPM Aubin Constans
<aubin.constans@microchip.com> wrote:
>
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>
> SAMA7G5's SDMMC run-time clock disabling is not supported.
> Add support to avoid this scenario for SAMA7G5.
>
> [Amended with a fix from Romain Sioen below this line]
>
> Sama7 boards are impacted by an unbalanced prepare/unprepare
> and enable/disable clock management in sdhci driver due to
> the lack of support for SDMMC clock runtime disabling,
> managed instead by the PMC driver.
>
> Add conditions in the preset function to manage clock
> depending on if the board support runtime clock disabling
> and if we come from the probing or restoring procedure.
>
> Add boolean start_clks variable to manage condition
> in preset function.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Co-developed-by: Romain Sioen <romain.sioen@microchip.com>
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> Signed-off-by: Aubin Constans <aubin.constans@microchip.com>

Tested-by: Robert Marko <robert.marko@sartura.hr>

> ---
>  drivers/mmc/host/sdhci-of-at91.c | 36 ++++++++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of=
-at91.c
> index 7c4ac65f247d..399856643e57 100644
> --- a/drivers/mmc/host/sdhci-of-at91.c
> +++ b/drivers/mmc/host/sdhci-of-at91.c
> @@ -39,6 +39,7 @@ struct sdhci_at91_soc_data {
>         const struct sdhci_pltfm_data *pdata;
>         bool baseclk_is_generated_internally;
>         unsigned int divider_for_baseclk;
> +       bool pm_runtime_disable_clks;
>  };
>
>  struct sdhci_at91_priv {
> @@ -149,12 +150,14 @@ static const struct sdhci_pltfm_data sdhci_sama5d2_=
pdata =3D {
>  static const struct sdhci_at91_soc_data soc_data_sama5d2 =3D {
>         .pdata =3D &sdhci_sama5d2_pdata,
>         .baseclk_is_generated_internally =3D false,
> +       .pm_runtime_disable_clks =3D true,
>  };
>
>  static const struct sdhci_at91_soc_data soc_data_sam9x60 =3D {
>         .pdata =3D &sdhci_sama5d2_pdata,
>         .baseclk_is_generated_internally =3D true,
>         .divider_for_baseclk =3D 2,
> +       .pm_runtime_disable_clks =3D true,
>  };
>
>  static const struct of_device_id sdhci_at91_dt_match[] =3D {
> @@ -164,7 +167,7 @@ static const struct of_device_id sdhci_at91_dt_match[=
] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
>
> -static int sdhci_at91_set_clks_presets(struct device *dev)
> +static int sdhci_at91_set_clks_presets(struct device *dev, bool start_cl=
ks)
>  {
>         struct sdhci_host *host =3D dev_get_drvdata(dev);
>         struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> @@ -174,7 +177,14 @@ static int sdhci_at91_set_clks_presets(struct device=
 *dev)
>         unsigned int                    gck_rate, clk_base_rate;
>         unsigned int                    preset_div;
>
> -       clk_prepare_enable(priv->hclock);
> +       /*
> +        * Manage clock prepare/enable procedure depending on if the boar=
d
> +        * support runtime clock disabling and if we come from the probin=
g
> +        * or restoring procedure (for backup+self refresh).
> +        */
> +       if (start_clks)
> +               clk_prepare_enable(priv->hclock);
> +
>         caps0 =3D readl(host->ioaddr + SDHCI_CAPABILITIES);
>         caps1 =3D readl(host->ioaddr + SDHCI_CAPABILITIES_1);
>
> @@ -223,8 +233,11 @@ static int sdhci_at91_set_clks_presets(struct device=
 *dev)
>         writew(SDHCI_AT91_PRESET_COMMON_CONF | preset_div,
>                host->ioaddr + SDHCI_PRESET_FOR_DDR50);
>
> -       clk_prepare_enable(priv->mainck);
> -       clk_prepare_enable(priv->gck);
> +       /* Same clock management as for hclock */
> +       if (start_clks) {
> +               clk_prepare_enable(priv->mainck);
> +               clk_prepare_enable(priv->gck);
> +       }
>
>         return 0;
>  }
> @@ -254,9 +267,11 @@ static int sdhci_at91_runtime_suspend(struct device =
*dev)
>         if (host->tuning_mode !=3D SDHCI_TUNING_MODE_3)
>                 mmc_retune_needed(host->mmc);
>
> -       clk_disable_unprepare(priv->gck);
> -       clk_disable_unprepare(priv->hclock);
> -       clk_disable_unprepare(priv->mainck);
> +       if (priv->soc_data->pm_runtime_disable_clks) {
> +               clk_disable_unprepare(priv->gck);
> +               clk_disable_unprepare(priv->hclock);
> +               clk_disable_unprepare(priv->mainck);
> +       }
>
>         return 0;
>  }
> @@ -269,7 +284,7 @@ static int sdhci_at91_runtime_resume(struct device *d=
ev)
>         int ret;
>
>         if (priv->restore_needed) {
> -               ret =3D sdhci_at91_set_clks_presets(dev);
> +               ret =3D sdhci_at91_set_clks_presets(dev, priv->soc_data->=
pm_runtime_disable_clks);
>                 if (ret)
>                         return ret;
>
> @@ -277,6 +292,9 @@ static int sdhci_at91_runtime_resume(struct device *d=
ev)
>                 goto out;
>         }
>
> +       if (!priv->soc_data->pm_runtime_disable_clks)
> +               goto out;
> +
>         ret =3D clk_prepare_enable(priv->mainck);
>         if (ret) {
>                 dev_err(dev, "can't enable mainck\n");
> @@ -344,7 +362,7 @@ static int sdhci_at91_probe(struct platform_device *p=
dev)
>                 return dev_err_probe(&pdev->dev, PTR_ERR(priv->gck),
>                                      "failed to get multclk\n");
>
> -       ret =3D sdhci_at91_set_clks_presets(&pdev->dev);
> +       ret =3D sdhci_at91_set_clks_presets(&pdev->dev, true);
>         if (ret)
>                 return ret;
>
> --
> 2.43.0
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
