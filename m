Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03C44968E6;
	Mon,  7 Sep 2026 12:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784053; cv=none; b=dFLWRDqYI8yXMLp+Be3Mn8fukS25MnFkupU4B4VWVKt0ej09T1tgy7RXyps5goGqY9q/Ses3MyBuR4sD304nt5mdJTdDa0fpQZscOEgxSRzPHGpk7SDwpM8gqwd+wWogvXzP26zukNEckXtfYH1Y0si3zRiAKWtlSV+od2Kx+bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784053; c=relaxed/simple;
	bh=lrEL2MWAhBxstb6h1EmpWfNdeY8n/avtFIE5v2WfpNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ex7E+UcaWDUYYRDs4rFlMNM8dum+Z3FR3OQQsGg5+fJ7s/J8mq85UM4iIQMObxcVNVrVyywwVufn18STNv0yWGUP0LECLyT0ZKbb81OHo4lDi09q+G/ZorZpvGxKCP/dPdUrBNlneEvNHg+Ee8BzDl4JSEfoAhYUcmc6tNXvMv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHBllGto; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHBllGto"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D406D1F00A3A;
	Mon,  7 Sep 2026 12:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788784051;
	bh=0dDEGqqB8BQNZY2VGBmByIl1LFAv/Oh+0/1XojNck6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EHBllGtoy2fF7lha1PnKfsopCtVfw156cxfRYGjg3/wBWij4nCCSlBk4oI/3UDhrB
	 xGEopVhmNyBvz7KpiIfbnSBivUAxJPmY6wVv1bXdBWjR6wEKQqGOyTBEke/Hz8dzKg
	 Jrw+nBqW24ivDN5s4zXCT2GYS/sUYh6Gqd8xVfqNMZh0NuRLxnYFtnVjuLSzcUC3Xl
	 9TP8TWjuRG6WFQUrS0Ymv3IE7Qm/4e1xUAioiufWurCSQc3Y0bLaHViX6R2kUjyR5M
	 08mF6L0/7/ApuPqGPiJzMq0V92dSO0SYrQzcLKW8xsWC/nESIyZhxqjfKXlygLoaj1
	 6mkOxo3fs4ZSw==
Date: Mon, 7 Sep 2026 14:27:20 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: george.moussalem@outlook.com
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	Nitheesh Sekar <quic_nsekar@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 07/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Add
 support for USB3 PHY on IPQ5018
Message-ID: <laqb2hqww6wivwxzficfvgi3nwair45a63ds7bzqoz6cby3jpu@n3bgkdrcpdvl>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-7-39be0955a6aa@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825-ipq5018-usb3-v3-7-39be0955a6aa@outlook.com>

On Tue, Aug 25, 2026 at 04:37:24PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add support for the USB3 PHY on IPQ5018 chipsets.
> 
> The PHY outputs a 250MHz PIPE clock routed to and gated by the GCC, so
> register a fixed rate clock. In addition, add the register/value pairs
> for the PHY initialization sequence.
> 
> The PHY requires a 5V supply, so acquire the regulator from the
> devicetree and enable it on power on and disable it on power off.
> 
> The code to acquire clocks and resets is the same as for PCIe so no
> changes are needed.
> 
> Power on/off sequences for PCIE and USB3 are similar except for the

PCIe

> delay timings and USB3 requirement for the PHY supply.
> 
> Lastly, the PCIe and USB3 pads are muxed so select USB3 mode in TCSR
> which needs to occur before the DWC3 USB3 controller resets.
> Otherwise, the SS link doesn't train and remains stuck in RX.Detect.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  .../phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c  | 154 +++++++++++++++++----
>  1 file changed, 127 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
> index d25ae9d8b9e7..84df331fce74 100644
> --- a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
> @@ -14,15 +14,21 @@
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/units.h>
>  
> -#define RST_ASSERT_DELAY_MIN_US		100
> -#define RST_ASSERT_DELAY_MAX_US		150
> -#define PIPE_CLK_DELAY_MIN_US		5000
> -#define PIPE_CLK_DELAY_MAX_US		5100
> -#define CLK_EN_DELAY_MIN_US		30
> -#define CLK_EN_DELAY_MAX_US		50
> +#define PCIE_RST_ASSERT_DELAY_MIN_US	100
> +#define PCIE_RST_ASSERT_DELAY_MAX_US	150
> +#define PCIE_PIPE_CLK_DELAY_MIN_US	5000
> +#define PCIE_PIPE_CLK_DELAY_MAX_US	5100
> +#define PCIE_CLK_EN_DELAY_MIN_US	30
> +#define PCIE_CLK_EN_DELAY_MAX_US	50
> +
> +#define USB3_RST_ASSERT_DELAY_MIN_US	1
> +#define USB3_RST_ASSERT_DELAY_MAX_US	5
> +#define USB3_CLK_EN_DELAY_MIN_US	35
> +#define USB3_CLK_EN_DELAY_MAX_US	40
>  
>  #define CDR_CTRL_REG_1			0x80
>  #define CDR_CTRL_REG_2			0x84
> @@ -39,10 +45,13 @@
>  #define PCIE_USB_COMBO_PHY_CFG_EIOS_DTCT_REG		0x3e4
>  #define PCIE_USB_COMBO_PHY_CFG_GEN3_ALIGN_HOLDOFF_TIME	0x3e8
>  
> +#define TCSR_USB_MUX_SEL		BIT(0)
> +
> +#define PHY_IS_USB3(phy)	((phy)->data->phy_type == PHY_TYPE_USB3)
> +
>  enum qcom_uniphy_type {
>  	PHY_TYPE_PCIE = 1,
> -	PHY_TYPE_PCIE_GEN2,
> -	PHY_TYPE_PCIE_GEN3,
> +	PHY_TYPE_USB3,
>  };
>  
>  struct qcom_uniphy_regs {
> @@ -68,6 +77,9 @@ struct qcom_uniphy {
>  	int num_resets;
>  	void __iomem *base;
>  	int lanes;
> +	struct regulator *vreg;
> +	struct regmap *tcsr;
> +	unsigned int mux_offset;
>  };
>  
>  #define PHY_INIT_CFG(o, v)		\
> @@ -89,23 +101,39 @@ static const struct qcom_uniphy_regs ipq5018_pcie_regs[] = {
>  	PHY_INIT_CFG(PCIE_USB_COMBO_PHY_CFG_PCS_INTERNAL_CONTROL_2, 0xf101),
>  };
>  
> +static const struct qcom_uniphy_regs ipq5018_usb_regs[] = {
> +	PHY_INIT_CFG(SSCG_CTRL_REG_4, 0x1cb9),
> +	PHY_INIT_CFG(SSCG_CTRL_REG_5, 0x023a),
> +	PHY_INIT_CFG(SSCG_CTRL_REG_3, 0xd360),
> +	PHY_INIT_CFG(SSCG_CTRL_REG_1, 0x1),
> +	PHY_INIT_CFG(SSCG_CTRL_REG_2, 0xeb),
> +};
> +
>  static const struct qcom_uniphy_regs ipq5332_pcie_regs[] = {
>  	PHY_INIT_CFG(PCIE_USB_COMBO_PHY_CFG_PLLCFG, 0x30),
>  	PHY_INIT_CFG(PCIE_USB_COMBO_PHY_CFG_EIOS_DTCT_REG, 0x53ef),
>  	PHY_INIT_CFG(PCIE_USB_COMBO_PHY_CFG_GEN3_ALIGN_HOLDOFF_TIME, 0xcf),
>  };
>  
> -static const struct qcom_uniphy_data ipq5018_data = {
> +static const struct qcom_uniphy_data ipq5018_pcie_data = {
>  	.lane_offset	= 0x800,
> -	.phy_type	= PHY_TYPE_PCIE_GEN2,
> +	.phy_type	= PHY_TYPE_PCIE,
>  	.init_seq	= ipq5018_pcie_regs,
>  	.init_seq_num	= ARRAY_SIZE(ipq5018_pcie_regs),
>  	.pipe_clk_rate	= 125 * MEGA,
>  };
>  
> -static const struct qcom_uniphy_data ipq5332_data = {
> +static const struct qcom_uniphy_data ipq5018_usb_data = {
>  	.lane_offset	= 0x800,
> -	.phy_type	= PHY_TYPE_PCIE_GEN3,
> +	.phy_type	= PHY_TYPE_USB3,
> +	.init_seq	= ipq5018_usb_regs,
> +	.init_seq_num	= ARRAY_SIZE(ipq5018_usb_regs),
> +	.pipe_clk_rate	= 250 * MEGA,
> +};
> +
> +static const struct qcom_uniphy_data ipq5332_pcie_data = {
> +	.lane_offset	= 0x800,
> +	.phy_type	= PHY_TYPE_PCIE,
>  	.init_seq	= ipq5332_pcie_regs,
>  	.init_seq_num	= ARRAY_SIZE(ipq5332_pcie_regs),
>  	.pipe_clk_rate	= 250 * MEGA,
> @@ -134,29 +162,49 @@ static int qcom_uniphy_pcie_usb3_power_off(struct phy *x)
>  
>  	clk_bulk_disable_unprepare(phy->num_clks, phy->clks);
>  
> -	return reset_control_bulk_assert(phy->num_resets, phy->resets);
> +	reset_control_bulk_assert(phy->num_resets, phy->resets);
> +
> +	if (PHY_IS_USB3(phy))
> +		regulator_disable(phy->vreg);
> +
> +	return 0;
>  }
>  
>  static int qcom_uniphy_pcie_usb3_power_on(struct phy *x)
>  {
>  	struct qcom_uniphy *phy = phy_get_drvdata(x);
> +	bool is_usb3 = PHY_IS_USB3(phy);
>  	int ret;
>  
> +	if (is_usb3) {
> +		ret = regulator_enable(phy->vreg);
> +		if (ret) {
> +			dev_err(phy->dev, "failed to enable regulator: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
>  	ret = reset_control_bulk_assert(phy->num_resets, phy->resets);
>  	if (ret) {
>  		dev_err(phy->dev, "failed to assert reset: %d\n", ret);
> -		return ret;
> +		goto err_disable_regulator;
>  	}
>  
> -	usleep_range(RST_ASSERT_DELAY_MIN_US, RST_ASSERT_DELAY_MAX_US);
> +	if (is_usb3)
> +		usleep_range(USB3_RST_ASSERT_DELAY_MIN_US,
> +			     USB3_RST_ASSERT_DELAY_MAX_US);
> +	else
> +		usleep_range(PCIE_RST_ASSERT_DELAY_MIN_US,
> +			     PCIE_RST_ASSERT_DELAY_MAX_US);
>  
>  	ret = reset_control_bulk_deassert(phy->num_resets, phy->resets);
>  	if (ret) {
>  		dev_err(phy->dev, "failed to deassert reset: %d\n", ret);
> -		return ret;
> +		goto err_disable_regulator;
>  	}
>  
> -	usleep_range(PIPE_CLK_DELAY_MIN_US, PIPE_CLK_DELAY_MAX_US);
> +	if (!is_usb3)
> +		usleep_range(PCIE_PIPE_CLK_DELAY_MIN_US, PCIE_PIPE_CLK_DELAY_MAX_US);
>  
>  	ret = clk_bulk_prepare_enable(phy->num_clks, phy->clks);
>  	if (ret) {
> @@ -164,7 +212,10 @@ static int qcom_uniphy_pcie_usb3_power_on(struct phy *x)
>  		goto err_assert_resets;
>  	}
>  
> -	usleep_range(CLK_EN_DELAY_MIN_US, CLK_EN_DELAY_MAX_US);
> +	if (is_usb3)
> +		usleep_range(USB3_CLK_EN_DELAY_MIN_US, USB3_CLK_EN_DELAY_MAX_US);
> +	else
> +		usleep_range(PCIE_CLK_EN_DELAY_MIN_US, PCIE_CLK_EN_DELAY_MAX_US);
>  
>  	qcom_uniphy_pcie_usb3_init(phy);
>  
> @@ -172,6 +223,9 @@ static int qcom_uniphy_pcie_usb3_power_on(struct phy *x)
>  
>  err_assert_resets:
>  	reset_control_bulk_assert(phy->num_resets, phy->resets);
> +err_disable_regulator:
> +	if (is_usb3)
> +		regulator_disable(phy->vreg);

Instead of sprinkling 'is_usb3' check, you can just create separate functions
for PCIe and USB3. Even though there will be duplications (try to have helpers
whereever you can), it will look neat and less confusing.

>  
>  	return ret;
>  }
> @@ -181,7 +235,7 @@ static inline int qcom_uniphy_pcie_usb3_get_resources(struct platform_device *pd
>  {
>  	struct device *dev = phy->dev;
>  	struct resource *res;
> -	int i, count;
> +	int i, count, ret;
>  
>  	phy->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(phy->base))
> @@ -207,6 +261,33 @@ static inline int qcom_uniphy_pcie_usb3_get_resources(struct platform_device *pd
>  
>  	phy->num_resets = count;
>  
> +	if (PHY_IS_USB3(phy)) {
> +		phy->vreg = devm_regulator_get(dev, "vdd");
> +		if (IS_ERR(phy->vreg)) {
> +			dev_err(dev, "failed to get regulator: %ld\n",
> +				PTR_ERR(phy->vreg));
> +			return PTR_ERR(phy->vreg);
> +		}
> +
> +		phy->tcsr = syscon_regmap_lookup_by_phandle_args(dev->of_node,
> +								 "qcom,phy-usb-mux-sel",
> +								 1, &phy->mux_offset);
> +		if (IS_ERR(phy->tcsr)) {
> +			ret = PTR_ERR(phy->tcsr);
> +			dev_err(dev, "failed to get regmap: %d\n", ret);
> +			return ret;
> +		}
> +
> +		phy->lanes = 1;
> +	} else {
> +		ret = of_property_read_u32(dev_of_node(dev), "num-lanes",
> +					   &phy->lanes);
> +		if (ret) {
> +			dev_err(dev, "Couldn't read num-lanes: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +

Same here.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
