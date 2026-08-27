Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A374078DF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787838664; cv=none; b=UAPNezHIgLDmqAHzJY7bufV3cNvXxfLKw8+wy2HCf8tZrS9cVvvFpWEScLvWJBazERmBlYVHRb5HWzkvh19hlf5p0JOcWdSTgfEuru7x+qWLbmRI4ZN1szpYPUMIgVRRqq5F89QUTylcPXQtCIGD391Q/+TXUZApm1Da7j6TRoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787838664; c=relaxed/simple;
	bh=GSXCNAWdi1MMmnqf1XW/FPRyeflfu8kqpYT/0BkJlPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJ+c+UCl8K9vt0ruI3rDuUDok338UvQbqBCgzd5jMnomgiyaYuDVuifnD0kOG+51TlzB4uXT6maCyoQlxkWPQceBYNnRMUk9ZLNRP06qEZaEAPIgYstkGXc/G+dMRO39dMSBSGtfunNcd7CohH8/dGjgtJBvPZElt94TZdpqbxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=is4VpxRZ; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="is4VpxRZ"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-396750cfee6so1859042a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787838662; x=1788443462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QGwb2ysQ4spjThnrjYtrwlyO99o7U1vRUqimeHR94+E=;
        b=is4VpxRZDqIyNePXkzt18xRXkXLrR9pzzxdJXlzsGjZ6tu6NcNjhfXVHmJn6x9QBqS
         iQtlmeeyxwr+xEvHxcT198QYRnQ9ZLv0v40J7Axseee/GATGDuw6HrT9jgMDJKbD35ny
         IzNvYSwdlRU408TtZAsSntz3SRebPAoViE9/hopqRaTakw2dZwA5OTpNrBVMUxG/tRgV
         hMum4wiyROnDkRbMcNu44heUbyDp2SJP1siRwtb1j5deRTpsnQ7cIaworwlRyLWeOsyv
         Mr+Q3nQWd8mOYMiIqGns9tyu+cDBjfsA3wyj+G0HlrA0yajjI4UGVG9IkbMOPN93+zsH
         UKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787838662; x=1788443462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QGwb2ysQ4spjThnrjYtrwlyO99o7U1vRUqimeHR94+E=;
        b=hscjON2FnXLa2vi70j/D6dlbBhb2MTUo2RzEuKcaZTEX2/+2NLqubBAj0pktDpduZl
         e9MbZTLb4FLsMCtGLOKn+P26Xl5h+P9lsuvk/VigqwKifRel4pycakWEkhQdoKMbY2CL
         kdCchG8GaGzNdG/3leFVOpnlTPLj6475CB/+f4PFVvV2ZG3ZIKtlj3YyEfASnCkBai4c
         Nm/ovYy3dhTWRamP01xAusJD5vvGL7v7MPcOSbQVX8KKYj3Pdjv6oq4RQjDpycMjoL11
         e4SzFUbP904blsLH9gtqDC4DoDHRrKJbXBMPEqt76M/vzYL7ONIk+HQuPq+79Gth+3cH
         +1OA==
X-Forwarded-Encrypted: i=1; AHgh+RqVNdGuSBStpKAAHWaS3NNzUVe5kqB18nRaSfkMxks1bUDO/GxTm1e04dVM1OI/Zrfxe6ZkBxUrhZUyr08=@vger.kernel.org
X-Gm-Message-State: AFuF++l9/qRG0Aq55ecCLgyjn8VECvhys5Pan+J/JzEQSye+e3BwmwAm
	l1FwK55baKs6WatLG1jD7r9uAkjV5eqMxeto7Kc2jKA9gS1G0ejOizWS
X-Gm-Gg: AR+sD12qZaYdPEQ0nP9Ro2yv0jf3gD4+w08ppw6YkMk0WhDunag1Tmi6IfbijcyV2gu
	7qVrC3tn9PIuc5ITNP2ytB3kJNu2a1nP5Wj0NDbnLvCMLByVuDOyfIM0lKI6jQ1wg1rP9E9efYC
	yWHknmcV+VarwL+oh6CeQJ4kxslc0w1iJfdxRr+EKoFIAoMmSi7ZUFGRL+udB77KpDa9+/SYBZX
	WroN7hkClJve4cWHZe4qZNfC7ExQ0oQ5VeaykYdQoWLdvPVDMbx36mUi2v9zjxqPXBaiTxtvKsM
	VhvBXJIPnVBabALiz6/DrsyyrDuLNd+8MVCwmk0OXP3hB0Un/1J7U0g3rzp9jh2xxOQZAmF/ZCW
	P3LbXhJ8p5KKbPCeZ3MnsQ7fTtqHIKDmwMc5O7P/Y9n7CLRpLWYZ1/IIitpinqyBLe1EJRbhvb3
	pSC30+yOFGbkb+l+5TVqLJZugw3i+q1KQWtWzP1+wa17afEtEkz5InFru8HAxFqtoLipCvcm8FW
	w==
X-Received: by 2002:a17:90b:4d88:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-3966d36e327mr30704782a91.1.1787838662493;
        Thu, 27 Aug 2026 06:51:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea80edsm2894675a91.1.2026.08.27.06.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:51:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 27 Aug 2026 06:51:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] watchdog: s3c2410_wdt: Add exynos5515-wdt
 compatible data
Message-ID: <168be4ed-d670-4d61-a061-e01abb33efa4@roeck-us.net>
References: <20260821-for-next-lucky7-watchdog-v4-0-d070cee5009f@member.fsf.org>
 <20260821-for-next-lucky7-watchdog-v4-2-d070cee5009f@member.fsf.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-for-next-lucky7-watchdog-v4-2-d070cee5009f@member.fsf.org>

On Fri, Aug 21, 2026 at 04:14:50PM +0100, Aiden Isik wrote:
> From: Aiden Isik <aidenisik@member.fsf.org>
> 
> Add driver data for the Exynos5515 SoC's watchdog timer.
> 
> Unlike similar SoCs such as GS101 or Exynos990, Exynos5515's PMU does
> not require explicit counter enablement for the watchdog to tick.
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/watchdog/s3c2410_wdt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index e31f93db0509..e61439a3f4b2 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -232,6 +232,20 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
>  		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
>  };
>  
> +/*
> + * Unlike similar SoCs like GS101, Exynos5515's PMU does not require
> + * explicit counter enablement. Hence, QUIRK_HAS_PMU_CNT_EN is not set.
> + */
> +static const struct s3c2410_wdt_variant drv_data_exynos5515 = {
> +	.mask_reset_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = 24,
> +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_DBGACK_BIT,
> +};
> +
>  static const struct s3c2410_wdt_variant drv_data_exynos7 = {
>  	.disable_reg = EXYNOS5_WDT_DISABLE_REG_OFFSET,
>  	.mask_reset_reg = EXYNOS5_WDT_MASK_RESET_REG_OFFSET,
> @@ -379,6 +393,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
>  	  .data = &drv_data_exynos5250 },
>  	{ .compatible = "samsung,exynos5420-wdt",
>  	  .data = &drv_data_exynos5420 },
> +	{ .compatible = "samsung,exynos5515-wdt",
> +	  .data = &drv_data_exynos5515 },
>  	{ .compatible = "samsung,exynos7-wdt",
>  	  .data = &drv_data_exynos7 },
>  	{ .compatible = "samsung,exynos850-wdt",
