Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com [74.125.226.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764CB33DEC2
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953332; cv=pass; b=jFaeLBYRfh96AM7Gn4KCg8Msa+Q2uk/CEaNIMOWFE44/06aYOoI/8MPFamOVmOWCXzlimCWyEO5S7BWujJrcWL3FocTZUJ7xbGaq6NDptV1bzl/AZvu+WITwtXdFS+a3QrU6uu9W7ZScjpoTjgIihAi9/0TYrdzOkPnOaWVt83Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953332; c=relaxed/simple;
	bh=Nihuo5Y1J+JNGMGXPcGfvABsTM685RdMjow6I2pzz/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GoZvdmMKgYTfxa2t6B9VLagkRae/L+hpVCEI559ySFz+pmylOy12rdyPJQPs4tMFtEhddAgA12HZNM/U2uu2xafL0rT3Ax3dfdTZGzRnnVwG2QEYKRZhdE8FCWo/bvtWjq3MNPTHLONia8coReDyeiImwuT0wnKAgxwGYTapU/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nZ1iw2Dc; arc=pass smtp.client-ip=74.125.226.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nZ1iw2Dc"
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-988c9594872so2308822241.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:02:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790953329; cv=none;
        d=google.com; s=arc-20260327;
        b=KBgoCHhKZthg19WFYKFV1UA8yfkoYK8kxXgRvRLbW9I1DAWs04vofSrf/2PmCT6Re/
         F6qEQLAJWdxx79GVgBiFbwOAo4Nd59BQHvm3j4p4aZMHDsU25YdQi/+z8MiWdbOdBdWR
         +vKoWCSAqS1YqpqTrs89EvaP5kN/aU+JqXCUiicq6Uw1ShIAP/vnRFT1dWS9wYV+uMsV
         btEIndo3tb49k8J1X4hmGz00Eua9EGpS2AhEIgin528megMDfOzlOap2TSJO4hP2tUml
         +IQRZM3fYzrnY1iXLE1PNzYK07cf9hBGRaFC1xJ1FgCAaCGrM0RhTItYKtyJfxmPeq64
         hk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/8BetBBJofDyU9wdLFm7iPoNavj8+VQriTK4PJhous8=;
        fh=3M0rnhFO1pbRlwom/sWOkYnVawtYhHFA+u3otGK53mA=;
        b=QO/V0mVzq8B4LOPlcnvnOsH0U1ioex22ukNJPKKFfiSLkprP3hK980EqFazZ/C8/vx
         3w1lNW7GJgIPnYOA/7FyLfxApIFEmK5kGQSNql7tLhgOOiaaep8QCM5IZ7yKPTNbhUYV
         2biLpBX84fxpvw9FFpJvPh/UwReEj3hn9BAGL5KrqVLNcset+XEc7wINBmch2iMFNsDA
         GaslnRc92DWKYXKjl3x0bwu9jpLUq1Z6kdkWE7F978+/RecS5zEVu6/55vYD4AgPSAnm
         vQHAa3f8mmHdp39YD8BbtT+UCO8fbEekWgvX8S58jd1dn8Nw1wjlkfSkQZZ83WrrgC9I
         iRnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790953329; x=1791558129; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8BetBBJofDyU9wdLFm7iPoNavj8+VQriTK4PJhous8=;
        b=nZ1iw2DcbFCIXrvS9PhsOlB4jZHj935CKxY75sctKg1izARnvVxWjMZmR1gf3SV5qk
         vO0CaXSlYq3sn7SLtRMXxw6wNoKP/TujZLSH+dgB85YNKMMWQA2PF/3ZLT1eNQ9bbkWY
         8ifu3asCjqzjFoKX5XZBydwgOxjOE7Lxx36jxo5CaY6dscX/Fkd5LIW4u4QJYQmnpyWQ
         NgBO2pWhGLah+hjsL74HXSgClQmqUMIPhK5xz4svr2nyj0uWj/t8Lp8XIcRm88F05e7/
         pKjLOUNPKFPX2uIsKk3ASi51Vpa+43pZDWh3x2Mt4PELC5LJ5jDgi/osEh+cac1f/hqQ
         deGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953329; x=1791558129;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/8BetBBJofDyU9wdLFm7iPoNavj8+VQriTK4PJhous8=;
        b=wCkGV/xRYcfX52boy4naSTuygCnFkHthEwoLokT+aL35HsbsAIUi+g5znjl9gMlO4N
         +Bugf2RS+4LhQYKyPS2PPGL0cBS7dnHduTtJIOYFKZQBwUSmPupmufcghmdgHg3XWH86
         d6tHLstyggdx2JOEUzyron0z16h8iwqzM4U5jDHyQC1yCtmQwXBY3da5QOk+1ds9Kf9Z
         /PrCF7Spl4TgMBGjmIdsAVr41EbwAUjtb52Uc9XH8CYBdbYOXCneia6y8JIevJsJbluA
         5ROQvbrefnZiA3v+hRg2QxPsEOcFPse63Tet2VxsYA3OVdC4z9145nr6VEeEFCRP45YS
         d+kw==
X-Forwarded-Encrypted: i=1; AKwUvBwW+E1UH+s+cnlFH6ACXZAqXM1ww4A6f/4OmFxCOvoaBaxmX1bqe3eDrjCRxSv7Kz+BRV0kXnlmCDmEFV8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCoPjCeyVdTRMpqKvBaTSkIUfHZs4oir2zxKwth2M7kTX/m7bF
	SZ2rHPeUpEXjJ+F/EiFcZ0q8yn+ntaJ3q/C3Dh0ETWVFYtqiSt8bnzFd8m5FiIc9NBtvp4NlYsn
	1+QTvJolmBZIN16j8mNZJyf3fjn8fa/4bPXerMCLmFw==
X-Gm-Gg: AYBFou1DWS9glxsI9cj0GkbNHuO66rQqD+ONztKe0i9rLvZKA5G1Le7ovYBsSevfTWU
	icF84si3+u1+pW6PXXolsX1AYeIYQywDxIii4MCbEGTLg0uslihohUSQmKUV3XjZtNmThMcvxQX
	p7rk1JOp8EiuVr9KSsoWq1tFFPu963pz8iwCv1eDn22cDt/ryDc9faL7T6PhTd6w785DmQJdCFT
	5VzwqPRNTh+JPNRJ9aKyJfdtfjEXWKrVkXlAX9Q6mBMXYCv6lbUO7uuVAoZAf6jWW10p42836bv
	7AiI7BkfTaSBxqkafmLI4ns0YAwH5DCcnR8+b/wI65WB4BhQ0ZU+JXsrVNzJjFzuK+5upqTEuio
	=
X-Received: by 2002:a05:6102:80a1:b0:7b7:e1bc:b070 with SMTP id
 ada2fe7eead31-7c0f5caaa75mr904078137.31.1790953329113; Fri, 02 Oct 2026
 08:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260927150943epcas5p1fb1720070f2bdca2c6cd32094dde895c@epcas5p1.samsung.com>
 <20260927152738.3673504-1-alim.akhtar@samsung.com> <20260927152738.3673504-2-alim.akhtar@samsung.com>
In-Reply-To: <20260927152738.3673504-2-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 16:01:55 +0100
X-Gm-Features: AclHuK8ij08G6Gr-EgDhgI61gJxwT1zt3h2boZhljCMfEb9c1DxgDHs5LAOtRr4
Message-ID: <CADrjBPrXYX4_d9dJ=SUqHf-eMDyuSpSChkuTsrPHfo2ZNh2mMw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: s3c2410_wdt: Add support for Exynos8855 SoC
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux@roeck-us.net, hajun.sung@samsung.com, wim@linux-watchdog.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Sept 2026 at 16:09, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Watchdog IP on this SoC is similar to Exynos850/ExynosAutov{9/920}.
> This does not have CNT_EN_WDT bit in PMU and offset of RST_STAT is
> different then the previously support SoC.
> Reuse the offset as much as from already supported SoC
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Small nit: If you send another version, the last sentence could be
updated slightly for clarity. Something like
"Reuse the offsets as much as possible from already supported SoCs"

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>
> *Changes in V2:
>         - Fixed Sashiko review comments
>                 - [Low] watchdog: confusing reuse of CLUSTER0 macro for CLUSTER1
>                 - [Low] watchdog: space-based alignment for EXYNOS8855_RST_STAT_REG_OFFSET
>
>  drivers/watchdog/s3c2410_wdt.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 7053963fb0ac..007c05ed2c7b 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -58,6 +58,7 @@
>  #define S3C2410_WATCHDOG_DEFAULT_TIME  (15)
>
>  #define EXYNOS5_RST_STAT_REG_OFFSET            0x0404
> +#define EXYNOS8855_RST_STAT_REG_OFFSET         0x10
>  #define EXYNOS5_WDT_DISABLE_REG_OFFSET         0x0408
>  #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET      0x040c
>  #define EXYNOS850_CLUSTER0_NONCPU_OUT          0x1220
> @@ -73,6 +74,7 @@
>
>  #define EXYNOS850_CLUSTER0_WDTRESET_BIT                24
>  #define EXYNOS850_CLUSTER1_WDTRESET_BIT                23
> +#define EXYNOS8855_CLUSTER1_WDTRESET_BIT       25
>  #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT     25
>  #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT     24
>  #define EXYNOSAUTOV920_CLUSTER0_WDTRESET_BIT   0
> @@ -281,6 +283,26 @@ static const struct s3c2410_wdt_variant drv_data_exynos850_cl1 = {
>                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
>  };
>
> +static const struct s3c2410_wdt_variant drv_data_exynos8855_cl0 = {
> +       .mask_reset_reg = EXYNOS850_CLUSTER0_NONCPU_INT_EN,
> +       .mask_bit = 2,
> +       .mask_reset_inv = true,
> +       .rst_stat_reg = EXYNOS8855_RST_STAT_REG_OFFSET,
> +       .rst_stat_bit = EXYNOS850_CLUSTER0_WDTRESET_BIT,
> +       .quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_DBGACK_BIT,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_exynos8855_cl1 = {
> +       .mask_reset_reg = EXYNOSAUTOV920_CLUSTER1_NONCPU_INT_EN,
> +       .mask_bit = 2,
> +       .mask_reset_inv = true,
> +       .rst_stat_reg = EXYNOS8855_RST_STAT_REG_OFFSET,
> +       .rst_stat_bit = EXYNOS8855_CLUSTER1_WDTRESET_BIT,
> +       .quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> +                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_DBGACK_BIT,
> +};
> +
>  static const struct s3c2410_wdt_variant drv_data_exynos990_cl0 = {
>         .mask_reset_reg = GS_CLUSTER0_NONCPU_INT_EN,
>         .mask_bit = 2,
> @@ -400,6 +422,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
>           .data = &drv_data_exynos7 },
>         { .compatible = "samsung,exynos850-wdt",
>           .data = &drv_data_exynos850_cl0 },
> +       { .compatible = "samsung,exynos8855-wdt",
> +         .data = &drv_data_exynos8855_cl0 },
>         { .compatible = "samsung,exynos990-wdt",
>           .data = &drv_data_exynos990_cl0 },
>         { .compatible = "samsung,exynosautov9-wdt",
> @@ -723,6 +747,7 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
>         /* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
>         if (variant == &drv_data_exynos850_cl0 ||
>             variant == &drv_data_exynosautov9_cl0 ||
> +           variant == &drv_data_exynos8855_cl0 ||
>             variant == &drv_data_gs101_cl0 ||
>             variant == &drv_data_exynosautov920_cl0 ||
>             variant == &drv_data_exynos990_cl0) {
> @@ -740,6 +765,8 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
>                 case 1:
>                         if (variant == &drv_data_exynos850_cl0)
>                                 variant = &drv_data_exynos850_cl1;
> +                       else if (variant == &drv_data_exynos8855_cl0)
> +                               variant = &drv_data_exynos8855_cl1;
>                         else if (variant == &drv_data_exynosautov9_cl0)
>                                 variant = &drv_data_exynosautov9_cl1;
>                         else if (variant == &drv_data_gs101_cl0)
> --
> 2.34.1
>
