Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081A037BE70;
	Tue,  1 Sep 2026 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266684; cv=none; b=R8Jfk7OcVWFj05SrZWj94FGBoMW6syodukAjlv8dX2OpDIwLo9mjlTqZEtApG3f9UR7xBxaHN6Eba3liP7tXwZbI4GPA0dUaC8VsNH4mH7k0426zqF7X74EY8axO4Ezkqg5hvRNdS2bB0Pe/9ueOJ/DtjvTKu7OO7BouUgwWddQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266684; c=relaxed/simple;
	bh=pCQgaB1R8WJQij1mH+LcW418uXo3VOajA2hIsOFtA/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjbV8Vq4qrOd1YCbcz2Y8nG8hjs5b6w21g0RnYd0ZyROsJP1a2KNkTVrrM+2dZrxuz8vUcO9T4AHfEiRiVv9lEjJAqSWQ3bZJBAxw7gPfzWQRd3lmBl0dazeGrlK0acKu4IbmvJqVXHK5lGZQN84ezLaKfkDMTVLm5LOycqElZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hc+11UCW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hc+11UCW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582641F00A3D;
	Tue,  1 Sep 2026 12:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788266682;
	bh=5sy5zY/kb6Mszn23PmerLizu0NPQqcxXR4E1HaXk7aY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hc+11UCWRpTjNkHjU6A2VNamv/H6pWO1GC6e1GnJQtn9uT60v6yVYa3uUVfVnEu/i
	 CkM0EP81oCvrHrYXGODijoX6cHrYUmWG0muxyM32OKwWexxqNp0LygPOTheKwHFzRg
	 pCuJlp+yzmeJLrJw6jkyVGCEXHIxBIduQX55BGDQ29v5D8JttGTFMO8FfCG3oKMT+t
	 uCMkuApbLCttOv1fnayEn9gTQxiBdiKf7vc56anm+izvWXA2dccYyqB7FNDuRaP6IP
	 yQPyXlwM0PvPVSdD39Y9rbmjzLLeLMAIsCJvrnYLh5akxx53lie6XibAI56YNztyRa
	 lp7ENl3SZWIQg==
Date: Tue, 1 Sep 2026 14:44:20 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com, 
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, Mika Westerberg <westeri@kernel.org>, 
	Sven Peter <sven@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
Message-ID: <iynrogny3didip7cui3ce3yq3woaqzrr7f4aqdzvls4j4mslfn@aww5qjpy3gdx>
References: <20260820-topic-usb4phy-v4-0-aec9d2cb31f6@oss.qualcomm.com>
 <20260820-topic-usb4phy-v4-3-aec9d2cb31f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260820-topic-usb4phy-v4-3-aec9d2cb31f6@oss.qualcomm.com>

On Thu, Aug 20, 2026 at 04:24:12PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
> a flavor called USB43DP, which as the name implies, features USB4, USB3
> and DP signal processing capabilities. In that architecture, USB3 and
> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
> The DP part is roughly the same as on the instances without USB4.
> 
> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
> Only one USB protocol (and flavor of pipe clock) can be active at a
> given moment (not to be confused with USB3 not being able to be
> tunneled as USB4 packets - that of course remains possible).
> The DP PLL is still used for clocking tunneled DP links. It may be
> turned off to save power when no tunnels are active, but that's left as
> a TODO item for now.
> 
> Due to the nature of USB4, the Type-C handling happens entirely inside
> the Host Router, and as such the QMPPHY's mux_set() function is
> nullified for the period when USB4 PHY remains active. This is strictly
> necessary, as the Host Router driver is going to excercise manual
> control over the USB4 PHY's power state, which is needed by the suspend
> and resume flows. Failure to control that synchronously with other
> parts of the code results in a SoC crash by unlocked access.
> 
> Because of that, a new struct phy is spawned to expose the USB4 mode,
> along with a .set_mode callback to allow toggling between USB4 and TBT3
> submodes.
> 
> Thunderbolt 3, having a number of differences vs USB4, requires a
> couple specific overrides, pertaining to electrical characteristics,
> which are easily accommodated for.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

One nit below:

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 399 ++++++++++++++++++++++++------
>  1 file changed, 329 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index c39ced168d03..dfdeec3ee4f5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -22,6 +22,7 @@
>  #include <linux/usb/typec.h>
>  #include <linux/usb/typec_dp.h>
>  #include <linux/usb/typec_mux.h>
> +#include <linux/usb/typec_tbt.h>
>  
>  #include <drm/bridge/aux-bridge.h>
>  
> @@ -66,10 +67,14 @@
>  #define SW_USB3PHY_RESET			BIT(2)
>  /* mux to select USB3 PHY reset control, 0:HW control, 1: software reset */
>  #define SW_USB3PHY_RESET_MUX			BIT(3)
> +#define SW_USB4PHY_RESET			BIT(4)
> +#define SW_USB4PHY_RESET_MUX			BIT(5)
>  
>  /* QPHY_V3_DP_COM_PHY_MODE_CTRL register bits */
>  #define USB3_MODE				BIT(0) /* enables USB3 mode */
>  #define DP_MODE					BIT(1) /* enables DP mode */
> +#define USB4_MODE				BIT(2) /* mutually exclusive with the above */
> +#define DP_TUNNELING_CLOCK_GEN_EN		BIT(3)
>  
>  /* QPHY_V3_DP_COM_TYPEC_CTRL register bits */
>  #define SW_PORTSELECT_VAL			BIT(0)
> @@ -82,6 +87,8 @@ enum qmpphy_mode {
>  	QMPPHY_MODE_USB3DP = 0,
>  	QMPPHY_MODE_DP_ONLY,
>  	QMPPHY_MODE_USB3_ONLY,
> +	/* USB4 QMPPHY mode refers to both USB4 and TBT3 */
> +	QMPPHY_MODE_USB4,
>  };
>  
>  /* set of registers with offsets different per-PHY */
> @@ -94,6 +101,7 @@ enum qphy_reg_layout {
>  	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
>  	QPHY_PCS_POWER_DOWN_CONTROL,
>  	QPHY_PCS_CLAMP_ENABLE,
> +	QPHY_PCS_USB4_CLAMP_ENABLE,
>  
>  	QPHY_COM_RESETSM_CNTRL,
>  	QPHY_COM_C_READY_STATUS,
> @@ -2489,6 +2497,8 @@ struct qmp_combo_offsets {
>  	u16 dp_txb;
>  	u16 dp_dp_phy;
>  	u16 aon_toggle;
> +	u16 usb4_serdes;
> +	u16 usb4_pcs;
>  };
>  
>  struct qmp_phy_cfg {
> @@ -2536,6 +2546,18 @@ struct qmp_phy_cfg {
>  	int (*calibrate_dp_phy)(struct qmp_combo *qmp);
>  	void (*dp_aux_init)(struct qmp_combo *qmp);
>  
> +	/* USB4 specifics */
> +	const struct qmp_phy_init_tbl *usb4_serdes_tbl;
> +	int usb4_serdes_tbl_num;
> +	const struct qmp_phy_init_tbl *usb4_serdes_tb3_ovrd_tbl;
> +	int usb4_serdes_tb3_ovrd_num;
> +	const struct qmp_phy_init_tbl *usb4_tx_tbl;
> +	int usb4_tx_tbl_num;
> +	const struct qmp_phy_init_tbl *usb4_rx_tbl;
> +	int usb4_rx_tbl_num;
> +	const struct qmp_phy_init_tbl *usb4_pcs_tbl;
> +	int usb4_pcs_tbl_num;
> +
>  	/* resets to be requested */
>  	const char * const *reset_list;
>  	int num_resets;
> @@ -2578,8 +2600,12 @@ struct qmp_combo {
>  	void __iomem *dp_tx2;
>  	void __iomem *dp_dp_phy;
>  
> +	void __iomem *usb4_serdes;
> +	void __iomem *usb4_pcs;
> +
>  	struct clk *pipe_clk;
>  	struct clk_bulk_data *clks;
> +	struct clk *p2rr2p_pipe_clk;
>  	int num_clks;
>  	struct reset_control_bulk_data *resets;
>  	struct regulator_bulk_data *vregs;
> @@ -2598,6 +2624,10 @@ struct qmp_combo {
>  	unsigned int dp_init_count;
>  	bool dp_powered_on;
>  
> +	struct phy *usb4_phy;
> +	enum tbt_phy_submode usb4_phy_submode;
> +	unsigned int usb4_init_count;
> +
>  	struct clk_fixed_rate pipe_clk_fixed;
>  	struct clk_hw dp_link_hw;
>  	struct clk_hw dp_pixel_hw;
> @@ -4006,6 +4036,9 @@ static int qmp_combo_dp_calibrate(struct phy *phy)
>  static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
>  {
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	u32 dp_reset_val = SW_DPPHY_RESET_MUX | SW_DPPHY_RESET;
> +	void __iomem *pcs_aon = qmp->pcs_aon;
> +	void __iomem *pcs = qmp->pcs;
>  	void __iomem *com = qmp->com;
>  	void __iomem *aon_toggle;
>  	int ret;
> @@ -4019,6 +4052,16 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
>  	else
>  		aon_toggle = qmp->pcs_aon;
>  
> +	if (qmp->qmpphy_mode == QMPPHY_MODE_USB4) {
> +		pcs = qmp->usb4_pcs;
> +
> +		qphy_setbits(pcs_aon, cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
> +
> +		/* Do not disturb the DP PLL in case there's an active DP tunnel */
> +		if (readl(com + QPHY_V3_DP_COM_RESET_OVRD_CTRL) & DP_TUNNELING_CLOCK_GEN_EN)
> +			dp_reset_val &= ~SW_DPPHY_RESET_MUX;
> +	}
> +
>  	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>  	if (ret) {
>  		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
> @@ -4052,8 +4095,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
>  
>  	/* override hardware control for reset of qmp phy */
>  	qphy_setbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
> -			SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
> -			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
> +			dp_reset_val |
> +			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET |
> +			SW_USB4PHY_RESET_MUX | SW_USB4PHY_RESET);
>  
>  	/* override hardware control for reset of qmp phy */
>  	if (aon_toggle && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
> @@ -4069,6 +4113,10 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
>  	if (cfg->invert_cc_polarity)
>  		val |= INVERT_CC_POLARITY;
>  
> +	/*
> +	 * Note that in USB4 mode, the router controls pin assignments instead
> +	 * and the values of the PORTSELECT registers are ignored.
> +	 */
>  	writel(val, com + QPHY_V3_DP_COM_TYPEC_CTRL);
>  
>  	switch (qmp->qmpphy_mode) {
> @@ -4096,12 +4144,21 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
>  		qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
>  				SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
>  		break;
> +	case QMPPHY_MODE_USB4:
> +		writel(USB4_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
> +
> +		/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
> +		/* TODO: disable DP PLL if there are no active tunnels after router setup */

100 column width generally applies to code, not comments. Comments should still
be wrapped to 80 columns.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
