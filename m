Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC98379991;
	Tue,  8 Sep 2026 05:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846778; cv=none; b=cq89gUYGvygljHl5ZD+JTnyGi75/9gBCFf1xNzXc8+dZGewIYwOD+EHNv+Ho3UTZ6/1l5rU+YzS+8CZQUgUCOsVmbAlgy2NlX1V7AzfnoTWLCfa/nGMXzHm5AtfKEv8FQgvKd59ukFdoGumRcA7yGzS0tKTsWCsx/LV4uH8fDX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846778; c=relaxed/simple;
	bh=bpn29dM1RpvP78dt0kFS+7aUPnEmrnjFfSl9Ev5Vxak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/6UzRiBnJKyIhumKg99lxYPsQHN3x5cZ9MesOPvrej0DglPEcEbO06VghdsiO7OuPpW3iEGcHvXhz7uq6eSgMn7gHQaDS6MvdUUS7ZNpwMgq933tLGWEyuszvBBJG+GITHuTE+DNr6OzMKJ1SAvb7vhLntS6fKA3vPjx8y6O50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nziJ3+3J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nziJ3+3J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912621F00A3A;
	Tue,  8 Sep 2026 05:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788846776;
	bh=k2bR/c4GM/ySV2j0leXsVuY5uTeC/80l6laMZtJuRbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nziJ3+3JfY7lyxjfeSUudMYTPbHTYYwxDFA4bDgXcBGa1jIzC42mq+EJJnJTxiBZX
	 LA4Nh4hxwhFjr870jhsbsbptnpfq93KBOUTUwz8PoqKClveGNpl5WFUo6xkXOnw9uD
	 YK4QCJ7gLP2hiou95vp/yfg/+c6g5aSSrf9HldYWD8F3EDwi8o2rfc0Gq2nLAKcQ2Q
	 ZNO2yMpG2Bi+x0YZh1wjq4uN54hYnDgRGtWt6RaSSkL7Iec7+uMVCxNcbu2uFEpfvC
	 G5wfC1s4Bl2t8TgYCnTst5X0JHBzSqutAIvZ0skdqzf8UsOn5z72KBy+rqM9JyZK1h
	 pTANfxxjPKneA==
Date: Tue, 8 Sep 2026 07:52:48 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, 
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/4] phy: qualcomm: qmp-combo: Rework DP PHY runtime
 configuration
Message-ID: <3xhkrauvdx6drzoegm3p3jwy7qbvukpo6xcqh7a6c5otqncbtl@esdhdsz47fft>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>

On Fri, Aug 28, 2026 at 03:13:16PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Rework the DP PHY runtime configuration by:
> - Extracting common DP PHY initialization sequence into
>   qmp_combo_configure_dp_phy_common() function that is shared
>   between qmp_v456_configure_dp_phy() and qmp_v8_configure_dp_phy()
> - Adding dp_aux_cfg2 field to qmp_phy_cfg structure to store the
>   hardware-specific AUX_CFG2 register value
> - Defining named constants (QSERDES_DP_PHY_AUX_CFG2_V456 and
>   QSERDES_DP_PHY_AUX_CFG2_V8) for better code readability
>   and maintainability
> - Adding validation check to ensure dp_aux_cfg2 is properly
>   configured for all hardware variants
> - Updating qmp_v8_dp_aux_init() with corrected power-down control and
>   bias enable settings
> - Modifying qmp_v8_configure_dp_clocks() to add VCO divider programming
>   and update auxless/LFPS timing parameters
> - Refining qmp_v8_configure_dp_phy() with updated driver enable values,
>   TSYNC override sequence, and additional status checks for proper
>   PHY lock verification
> 

This summary makes it clear that you've clubbed multiple fixes in a single
patch. Please split them logically.

> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 185 +++++++++++++++++++-----------
>  1 file changed, 118 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 16ccabd945f7..5630627dc85e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -2478,6 +2478,10 @@ static const struct qmp_combo_lane_mapping dp_data_lanes[] = {
>  
>  struct qmp_combo;
>  
> +/* DP PHY AUX_CFG2 register values for different hardware versions */
> +#define QSERDES_DP_PHY_AUX_CFG2_V456		0xa4
> +#define QSERDES_DP_PHY_AUX_CFG2_V8		0x06
> +
>  struct qmp_combo_offsets {
>  	u16 com;
>  	u16 txa;
> @@ -2541,6 +2545,9 @@ struct qmp_phy_cfg {
>  	int (*calibrate_dp_phy)(struct qmp_combo *qmp);
>  	void (*dp_aux_init)(struct qmp_combo *qmp);
>  
> +	/* DP PHY AUX_CFG2 register value (hardware-specific) */
> +	unsigned int dp_aux_cfg2;
> +
>  	/* resets to be requested */
>  	const char * const *reset_list;
>  	int num_resets;
> @@ -2780,6 +2787,7 @@ static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
>  	.configure_dp_tx	= qmp_v4_configure_dp_tx,
>  	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
>  	.configure_dp_phy	= qmp_v4_configure_dp_phy,
> +	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
>  
>  	.regs			= qmp_v6_usb3phy_regs_layout,
>  	.reset_list		= msm8996_usb3phy_reset_l,
> @@ -2916,6 +2924,7 @@ static const struct qmp_phy_cfg sc8180x_usb3dpphy_cfg = {
>  	.configure_dp_tx	= qmp_v4_configure_dp_tx,
>  	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
>  	.configure_dp_phy	= qmp_v4_configure_dp_phy,
> +	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
>  
>  	.reset_list		= msm8996_usb3phy_reset_l,
>  	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
> @@ -2962,6 +2971,7 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
>  	.configure_dp_tx	= qmp_v4_configure_dp_tx,
>  	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
>  	.configure_dp_phy	= qmp_v4_configure_dp_phy,
> +	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
>  
>  	.reset_list		= msm8996_usb3phy_reset_l,
>  	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
> @@ -3007,6 +3017,7 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
>  	.configure_dp_tx	= qmp_v4_configure_dp_tx,
>  	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
>  	.configure_dp_phy	= qmp_v4_configure_dp_phy,
> +	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
>  
>  	.reset_list		= msm8996_usb3phy_reset_l,
>  	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
> @@ -3116,6 +3127,7 @@ static const struct qmp_phy_cfg sm8250_usb3dpphy_cfg = {
>  	.configure_dp_tx	= qmp_v4_configure_dp_tx,
>  	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
>  	.configure_dp_phy	= qmp_v4_configure_dp_phy,
> +	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
>  
>  	.reset_list		= msm8996_usb3phy_reset_l,
>  	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
> @@ -3164,6 +3176,7 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
>  	.configure_dp_tx	= qmp_v4_configure_dp_tx,
>  	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
>  	.configure_dp_phy	= qmp_v4_configure_dp_phy,
> +	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
>  
>  	.reset_list		= msm8996_usb3phy_reset_l,
>  	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
> @@ -3211,6 +3224,7 @@ static const struct qmp_phy_cfg sm8475_usb3dpphy_cfg = {
>  	.configure_dp_tx	= qmp_v4_configure_dp_tx,
>  	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
>  	.configure_dp_phy	= qmp_v4_configure_dp_phy,
> +	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
>  
>  	.regs			= qmp_v6_usb3phy_regs_layout,
>  	.reset_list		= msm8996_usb3phy_reset_l,
> @@ -3256,6 +3270,7 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
>  	.configure_dp_tx	= qmp_v4_configure_dp_tx,
>  	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
>  	.configure_dp_phy	= qmp_v4_configure_dp_phy,
> +	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
>  
>  	.regs			= qmp_v6_usb3phy_regs_layout,
>  	.reset_list		= msm8996_usb3phy_reset_l,
> @@ -3301,6 +3316,7 @@ static const struct qmp_phy_cfg sm8650_usb3dpphy_cfg = {
>  	.configure_dp_tx	= qmp_v4_configure_dp_tx,
>  	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
>  	.configure_dp_phy	= qmp_v4_configure_dp_phy,
> +	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
>  
>  	.regs			= qmp_v6_usb3phy_regs_layout,
>  	.reset_list		= msm8996_usb3phy_reset_l,
> @@ -3346,6 +3362,7 @@ static const struct qmp_phy_cfg sm8750_usb3dpphy_cfg = {
>  	.configure_dp_tx	= qmp_v4_configure_dp_tx,
>  	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
>  	.configure_dp_phy	= qmp_v4_configure_dp_phy,
> +	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
>  
>  	.regs			= qmp_v8_usb3phy_regs_layout,
>  	.reset_list		= msm8996_usb3phy_reset_l,
> @@ -3392,6 +3409,8 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
>  	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
>  	.configure_dp_phy	= qmp_v8_configure_dp_phy,
>  
> +	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V8,
> +
>  	.regs			= qmp_v8_n3_usb43dpphy_regs_layout,
>  	.reset_list		= msm8996_usb3phy_reset_l,
>  	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
> @@ -3693,16 +3712,75 @@ static void qmp_v4_dp_aux_init(struct qmp_combo *qmp)
>  	       qmp->dp_dp_phy + QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK);
>  }
>  
> +static int qmp_combo_configure_dp_phy_common(struct qmp_combo *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	u32 status;
> +	int ret;
> +
> +	if (!cfg->dp_aux_cfg2) {
> +		dev_err(qmp->dev, "DP AUX CFG2 value not configured\n");
> +		return -EINVAL;
> +	}
> +
> +	writel(0x0f, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG_1);

Is it possible to add definitions for these magic values?

> +
> +	qmp_combo_configure_dp_mode(qmp);
> +
> +	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> +	writel(cfg->dp_aux_cfg2, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
> +
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
> +
> +	ret = qmp->cfg->configure_dp_clocks(qmp);
> +	if (ret)
> +		return ret;
> +
> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +
> +	writel(0x20, qmp->dp_serdes + cfg->regs[QPHY_COM_RESETSM_CNTRL]);
> +
> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
> +			status,
> +			((status & BIT(0)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;

readl_poll_timeout() will return -ETIMEDOUT upon timeout.

> +
> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
> +			status,
> +			((status & BIT(0)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
> +
> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
> +			status,
> +			((status & BIT(1)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}
> +
>  static void qmp_v8_dp_aux_init(struct qmp_combo *qmp)
>  {
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  
> -	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> -	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> -	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> +	writel(0x3f, qmp->dp_serdes + QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1);
> +
> +	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +			DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
> +			DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> +			qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
>  
>  	/* Turn on BIAS current for PHY/PLL */
> -	writel(0x1c, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
> +	writel(0x17, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);

These regval changes are supposed to be in a separate patch with proper Fixes
tag.

>  
>  	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
>  	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> @@ -3729,8 +3807,8 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
>  	writel(0x27, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
>  	writel(0x27, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
>  
> -	writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
> -	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
> +	writel(0x2b, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
> +	writel(0x2b, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
>  
>  	qmp_combo_configure_dp_swing(qmp);
>  }
> @@ -3738,48 +3816,41 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
>  static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
>  {
>  	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
> -	u32 phy_vco_div;
>  	unsigned long pixel_freq;
> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  
>  	switch (dp_opts->link_rate) {
>  	case 1620:
> -		phy_vco_div = 0x4;
>  		pixel_freq = 1620000000UL / 2;
>  		break;
>  	case 2700:
> -		phy_vco_div = 0x2;
>  		pixel_freq = 2700000000UL / 2;
>  		break;
>  	case 5400:
> -		phy_vco_div = 0x4;
>  		pixel_freq = 5400000000UL / 4;
>  		break;
>  	case 8100:
> -		phy_vco_div = 0x3;
>  		pixel_freq = 8100000000UL / 6;
>  		break;
>  	default:
>  		/* Other link rates aren't supported */
>  		return -EINVAL;
>  	}
> -	writel(phy_vco_div, qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_VCO_DIV]);
>  
>  	/* disable core reset tsync */
>  	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>  
> -	writel(0x04, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
> -	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
> +	writel(0x09, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
> +	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
>  	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_CYC);
> -	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
> +	writel(0x33, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
>  
>  	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
>  	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX2_TX3_LANE_CTL);
>  	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX0_TX1_LANE_CTL);
>  	writel(0x01, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_CFG1);
> -	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
> +	writel(0x33, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
>  	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN0_DRV_LVL);
> -	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
> +	writel(0x02, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
>  
>  	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
>  	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);
> @@ -3793,48 +3864,10 @@ static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
>  	u32 status;
>  	int ret;
>  
> -	writel(0x0f, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG_1);
> -
> -	qmp_combo_configure_dp_mode(qmp);
> -
> -	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> -	writel(0xa4, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
> -
> -	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
> -	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
> -
> -	ret = qmp->cfg->configure_dp_clocks(qmp);
> +	ret = qmp_combo_configure_dp_phy_common(qmp);
>  	if (ret)
>  		return ret;
>  
> -	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> -	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> -	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> -	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> -
> -	writel(0x20, qmp->dp_serdes + cfg->regs[QPHY_COM_RESETSM_CNTRL]);
> -
> -	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
> -			status,
> -			((status & BIT(0)) > 0),
> -			500,
> -			10000))
> -		return -ETIMEDOUT;
> -
> -	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
> -			status,
> -			((status & BIT(0)) > 0),
> -			500,
> -			10000))
> -		return -ETIMEDOUT;
> -
> -	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
> -			status,
> -			((status & BIT(1)) > 0),
> -			500,
> -			10000))
> -		return -ETIMEDOUT;
> -
>  	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>  
>  	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
> @@ -3926,7 +3959,7 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>  	u32 status;
>  	int ret;
>  
> -	ret = qmp_v456_configure_dp_phy(qmp);
> +	ret = qmp_combo_configure_dp_phy_common(qmp);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -3938,13 +3971,13 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>  	} else if (dp_opts->lanes == 2) {
>  		bias0_en = reverse ? 0x3f : 0x15;
>  		bias1_en = reverse ? 0x15 : 0x3f;
> -		drvr0_en = 0x10;
> -		drvr1_en = 0x10;
> +		drvr0_en = 0x30;
> +		drvr1_en = 0x30;
>  	} else {
>  		bias0_en = 0x3f;
>  		bias1_en = 0x3f;
> -		drvr0_en = 0x34;
> -		drvr1_en = 0x34;
> +		drvr0_en = 0x30;
> +		drvr1_en = 0x30;
>  	}
>  
>  	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
> @@ -3952,6 +3985,15 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>  	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
>  	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
>  
> +	writel(0x03, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
> +	writel(0x23, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
> +	writel(0x22, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
> +
> +	writel(0x0a, qmp->dp_tx + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
> +
> +	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
> +
>  	writel(0x08, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>  	udelay(100);
>  	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> @@ -3959,16 +4001,25 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>  
>  	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
>  			status,
> -			((status & BIT(1)) > 0),
> +			((status & BIT(0)) > 0),

Wow, isn't this a critical fix?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
