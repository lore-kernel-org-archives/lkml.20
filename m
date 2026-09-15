Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6338C3B71A6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483123; cv=pass; b=q/pmDJnlSEWvcgoHb1fxkQAEzt1fu0AIysh0sGHdxbnzlQwy2RtqjSs53uXLY/wCoLz39YRJFj64veMBU/OHvMP55XGQ7EJ9ZWvPVPceHeojgtb4UPsOuru3ENGKc+bLtHmBuXmI/f4P57LOnYKPJ+rN4Y2nyDSf8ObCqX/s+oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483123; c=relaxed/simple;
	bh=iel1Zg3Gn2JgaK8/39sWaPWO9gbsJitWrIWTrMJvzaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1U0p7MDikPZMxjGnXM+nh/QxQvaDai0/51DlykWq4wSp9/rcLeweNxxMb1AF7ihWRD84VRm0XzUw8r8ELxBnq5ELCsQ7a66bxJrrcKF2UNJRDbKxWuU8YgC9Y72vNRL1FaB37ScDPborVIc2IuWdvRZeT9k72jTkRmBBwflNJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ASRqtX26; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ASRqtX26"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so5938908a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483120; cv=none;
        d=google.com; s=arc-20260327;
        b=a9ZstAHHNhnQgnGq6AS8E22CB7MYLFqWcMecCztlauTOIDI12Y8rmxOWxCR9yC2mYb
         oVDq8rvvyLa19RO4kGaKzXZKWg3x4r8J/egML32XfYxXLl03xbdhkldtOsJcpcnpSvej
         rBqhch0GIpKSzubFmc47noFyGhOr5j+UjpMZqAIs7smrh2IqE4ehQgqo2cM3H1nSsri0
         eucnu/nlWV3yvVk4XEj6KMFtTNqkAXAJCGvPRZdWYX+RO2Tg+uv+cFPJSqyM2/MOtBFQ
         zY6ZMdcotMF9W/pxpr87c3dtRwiN4kbnPmI0q1Drz/lRC2yAc1dVWIuwjM8dCjMo3EmU
         wQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hJD9UyfEwkXA50QAdx7qCZZmHoP06c3J8prX9fzshMY=;
        fh=13b2pFjsTuiFRBnglFLJfpl9Zsm74IaCeI/vd8Af4eM=;
        b=dO4+lXtASWcledGVUNv1Nwcr3LVMNbp0GB3LYNRuYl/ifoW+j9DZcnTWYX/hNSk77n
         Y3YKJzbO4rKZVgEF24op9xDHyelcIwYleW3Y6Ry9oLzvf6SpVUzhi1oPRfcfisIXXtdX
         a1GpS3FnwT9gDAA1GbcJH+bM+rnWL7RqNVSlW3hNyUlGAIXDqzUge01q9C+2AlVTWqBO
         s3dNYHgrRiHAz6RlceE6e31Ruem31eCJzejHGwVmdiWmAG7TV996D7BEMENkChbquYOx
         QF7dWnornUWGcJuQVQSD9NLEv4AvRNQAzrHVRbv8SHgcjheMdR7Z3HylGhMbuO6riV+H
         63RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483120; x=1790087920; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJD9UyfEwkXA50QAdx7qCZZmHoP06c3J8prX9fzshMY=;
        b=ASRqtX26/wnBLQq1f+kU3Lr0ZMdryKvAEHzR96G78EnpnyCCVPCQc7gAaFM5p8poEx
         QWTGFd/Fw0EF96wANPZldWJRQt+W5kEcFRn9Hckh+Hq+A1JOGj0WsxZJPnbCgC7+HTix
         wJFUJqhoM9tdI/V9Q7kIPgtZDHm1lPyJaYG0T+8dWZStT/RgXtzqrpsJE0tX9TVy60EM
         CXtLKVNsDrIctEtK+KawK9QrS9jdUESyH9nT7kjTZ5Lf8ZYLFN2EM0Awr5A67N2Drx9K
         2VSce/KBueZbLqfalkVxLiGmzdS1NEpT3XhQIoTn3N28pqggTK5Ta+6lTBETKl0inTKh
         gHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483120; x=1790087920;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hJD9UyfEwkXA50QAdx7qCZZmHoP06c3J8prX9fzshMY=;
        b=CLHCfu0sp/9SwYnsenZeNRlyJf2ep+/680o1M+4i0A4yDbmpp+2HGUnT2aA46aM+Q2
         T0vV9MGspoDQ+zUK9Ria5nMWe0DBDgJfjPgxynfQ9GU3lDrw217jB/nXVamDbdMvCRXE
         TlrWgdCe5O48O8zlRRd9MQp814sYA9Xr279YLZv1h4n/HMKBTVQnuIt5ffun/kpsTLgA
         v8vfR1/oCiu7LUOF/f9vYAI1tcASWjLZLaDa5bV+LjCx+YVvdVra+3DQ6HApehbtJXOm
         Jb4w7O9MsQNDnIxGhStb99CbUy9RG3UOD0qH2Qly5mSZwsM5/6LalC2cLLOU7vd94RmG
         S3sg==
X-Forwarded-Encrypted: i=1; AKwUvBwuPpZYvCojrNUAGnqLBGKgqXrJI+I9vy6Cke1dbl3Z/RhFwCxWjW30fKSSS4B0yichGFOsm+9Uf7Azag4=@vger.kernel.org
X-Gm-Message-State: AFuF++mJgtyaKUOkqMNOoeA0YNvIjkAPhUnnYM1oIDz/768BICXMNEDG
	yZpU+UohltwZaStIdAb78MAKM/C28sbcJil+r3I2pE1f3AidcrrYu9hnOpEGEYBDMmBHk0D6BH9
	KAPE9YHbveGO1QV+gaPIcixNKtty6PMjQMrQimW3U4Q==
X-Gm-Gg: AYBFou2oj2rNLGq7hj59NFI8Jgdc+9BAxF+itryopAi9pvR5XPVOJW9/2tfhVo+Slbr
	AdSSz/HCKF7bPSvKwcmrT/guWvXP7pV5LpOIqmJAQdSP7xFUXQ5wN4rsWKcztG6458xvPz52HB7
	rekXyzsOqaDcOGlZGRi4wDJnb/6mIynMIopVJP7XiLwx3JKdCIZgG7bhSIigzHMIolGiXfvHMih
	q1AR0QYvL3ZF4oci+3ysUNT2xaO770iwAQw/pXZ9wypD1PbJY7aA/6siZhM2Y7a+ETlniPE0yx/
	JpXu7ZNxcXCl/Tjyn+lUJ9qSS/M73viNxa45TisAn5LV8hjuzVEbrN0mSbgBc2fJKpNjQy6OWvp
	mWR94XpCcpxVLdw==
X-Received: by 2002:a05:6402:518b:b0:6a7:f7f3:66d4 with SMTP id
 4fb4d7f45d1cf-6a9f63d1831mr4622791a12.24.1789483119518; Tue, 15 Sep 2026
 07:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0@epcas5p4.samsung.com>
 <20260831070309.158069-1-selvarasu.g@samsung.com>
In-Reply-To: <20260831070309.158069-1-selvarasu.g@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:38:27 +0100
X-Gm-Features: AcwNN1Xw208DqxP9opmiR8ULGxXcGVSbiimmOgDikZLNDndPPFL37ybJKwgPW5Y
Message-ID: <CADrjBPq9v8brtXt0y-FJhSPMQQirkRLSK4QkcafWO+UdbBH92g@mail.gmail.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: Use dynamic phy_cfg size to prevent
 OOB access
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk@kernel.org, 
	alim.akhtar@samsung.com, pritam.sutar@samsung.com, andre.draszik@linaro.org, 
	kernel@lvkasz.us, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, dh10.jung@samsung.com, 
	akash.m5@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 08:03, Selvarasu Ganesan <selvarasu.g@samsung.com> wrote:
>
> The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
> creating both UTMI and PIPE3 PHY instances regardless of the SoC
> capability. Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990,
> and ExynosAutoV920) provide phy_cfg arrays containing only a single
> element.
>
> On these SoCs, when the loop reaches index 1, the driver reads past the
> end of the rodata array, populating the second PHY instance with garbage
> data. Since the configuration structure contains critical function
> pointers (phy_isol, phy_init, set_refclk), any subsequent access to this
> PHY instance via exynos5_usbdrd_phy_xlate could result in a kernel oops.
>
> Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
> store the actual size of the phy_cfg array for each SoC. Update the
> probe loop and the xlate function to bound their access against this
> value instead of the hardcoded EXYNOS5_DRDPHYS_NUM.
>
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 8711a3b62c8e..311d1c25eb3e 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -477,6 +477,7 @@ struct exynos5_usbdrd_phy_config {
>
>  struct exynos5_usbdrd_phy_drvdata {
>         const struct exynos5_usbdrd_phy_config *phy_cfg;
> +       int n_phy_cfg;
>         const struct exynos5_usbdrd_phy_tuning **phy_tunes;
>         const struct phy_ops *phy_ops;
>         const char * const *clk_names;
> @@ -1164,7 +1165,7 @@ static struct phy *exynos5_usbdrd_phy_xlate(struct device *dev,
>  {
>         struct exynos5_usbdrd_phy *phy_drd = dev_get_drvdata(dev);
>
> -       if (WARN_ON(args->args[0] >= EXYNOS5_DRDPHYS_NUM))
> +       if (WARN_ON(args->args[0] >= phy_drd->drv_data->n_phy_cfg))
>                 return ERR_PTR(-ENODEV);
>
>         return phy_drd->phys[args->args[0]].phy;
> @@ -1993,6 +1994,7 @@ static const char * const exynos5_regulator_names[] = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos2200_usb32drd_phy = {
>         .phy_cfg                = phy_cfg_exynos2200,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos2200),
>         .phy_ops                = &exynos2200_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS2200_PHY_CTRL_USB20,
>         .clk_names              = exynos5_clk_names,
> @@ -2006,6 +2008,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos2200_usb32drd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos5,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos5),
>         .phy_ops                = &exynos5_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>         .pmu_offset_usbdrd1_phy = EXYNOS5420_USBDRD1_PHY_CONTROL,
> @@ -2019,6 +2022,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos5,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos5),
>         .phy_ops                = &exynos5_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>         .clk_names              = exynos5_clk_names,
> @@ -2031,6 +2035,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos5,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos5),
>         .phy_ops                = &exynos5_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>         .pmu_offset_usbdrd1_phy = EXYNOS5433_USBHOST30_PHY_CONTROL,
> @@ -2044,6 +2049,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos5,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos5),
>         .phy_ops                = &exynos5_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>         .clk_names              = exynos5_clk_names,
> @@ -2056,6 +2062,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos7870,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos7870),
>         .phy_tunes              = exynos7870_tunes,
>         .phy_ops                = &exynos7870_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
> @@ -2069,6 +2076,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos850,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos850),
>         .phy_ops                = &exynos850_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>         .clk_names              = exynos5_clk_names,
> @@ -2097,6 +2105,7 @@ static const struct exynos5_usbdrd_phy_tuning *exynos990_tunes[PTS_MAX] = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos850,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos850),
>         .phy_ops                = &exynos850_usbdrd_phy_ops,
>         .phy_tunes              = exynos990_tunes,
>         .pmu_offset_usbdrd0_phy = EXYNOS990_PHY_CTRL_USB20,
> @@ -2629,6 +2638,7 @@ static const struct phy_ops exynosautov920_usb31drd_combo_ssphy_ops = {
>  static const
>  struct exynos5_usbdrd_phy_drvdata exynosautov920_usb31drd_combo_ssphy = {
>         .phy_cfg                = usb31drd_phy_cfg_exynosautov920,
> +       .n_phy_cfg              = ARRAY_SIZE(usb31drd_phy_cfg_exynosautov920),
>         .phy_ops                = &exynosautov920_usb31drd_combo_ssphy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOSAUTOV920_PHY_CTRL_USB31,
>         .clk_names              = exynos5_clk_names,
> @@ -2659,6 +2669,7 @@ exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
>  static const
>  struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_combo_hsphy = {
>         .phy_cfg                = usbdrd_hsphy_cfg_exynosautov920,
> +       .n_phy_cfg              = ARRAY_SIZE(usbdrd_hsphy_cfg_exynosautov920),
>         .phy_ops                = &exynosautov920_usbdrd_combo_hsphy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOSAUTOV920_PHY_CTRL_USB20,
>         .clk_names              = exynos5_clk_names,
> @@ -2687,6 +2698,7 @@ static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynosautov920,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynosautov920),
>         .phy_ops                = &exynosautov920_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOSAUTOV920_PHY_CTRL_USB20,
>         .clk_names              = exynos5_clk_names,
> @@ -2863,6 +2875,7 @@ static const char * const gs101_regulator_names[] = {
>
>  static const struct exynos5_usbdrd_phy_drvdata gs101_usbd31rd_phy = {
>         .phy_cfg                        = phy_cfg_gs101,
> +       .n_phy_cfg                      = ARRAY_SIZE(phy_cfg_gs101),
>         .phy_tunes                      = gs101_tunes,
>         .phy_ops                        = &gs101_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy         = GS101_PHY_CTRL_USB20,
> @@ -3020,7 +3033,7 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
>
>         dev_vdbg(dev, "Creating usbdrd_phy phy\n");
>
> -       for (i = 0; i < EXYNOS5_DRDPHYS_NUM; i++) {
> +       for (i = 0; i < drv_data->n_phy_cfg; i++) {
>                 struct phy *phy = devm_phy_create(dev, NULL, drv_data->phy_ops);
>
>                 if (IS_ERR(phy))
> --
> 2.17.1
>
