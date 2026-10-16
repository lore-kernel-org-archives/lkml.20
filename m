Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5532F260F;
	Fri, 16 Oct 2026 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165501; cv=none; b=GK08FY8rKukWpfVmDUPXe36rFlsRKg60eeqw1WJI9AH22McnhHMZNNqfhNWo3TW5CVXE/ni0C8e0RSWWCzZNa9XYG/L2e528xmxvwd8XdJ/rJ+Ao5Gv8W0Uxo+8xf2maUeYwiL/VX9UlEtooi1KWjgSsw28cCDkyRX/XdlYnvmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165501; c=relaxed/simple;
	bh=9bXbLDYSonTKhdmt5hDhi+Ax8Sq8b8bafY5sQF5NToY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=smOXLi2Y9R6NseVCo1kK55k3hLHsyTHY3KxL7mu/b8/XH9BmVCKzCCAtV4fJVLqoWTGNKKYsFKiSM4nfdcU7bL8gmN8phA2ZHkwgX44OruOxmFlHdsyGPVQ+NJAcOeaycT6U0vXPwJPXq/FtbRNtZ0Cm/VLxyWHb2SsEWunJ96k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fqfukrxb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fqfukrxb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AB61F000C5;
	Fri, 16 Oct 2026 15:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792165499;
	bh=Z81ZX3c8VwRbo1qhQKnMhcFi9A73xlefHXLKdBssqvE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=FqfukrxbmKr0vrx3QTj6h7JVFSmaUwVvc0uw+IM9V79h4ssnZE7WtF+E3zZq/inOT
	 SAhSwAaIudAmFZ3JnFKjgVo/69gh87SEQ0c7Y7rYW5jyc1HyI+rJifnSjz/J9bho9q
	 HX5AE7OQLd3jO+7dwL5B5G/ZUmQXHKL4v6QsSVfHwgEvfoLx54q+ztIdysXXLRywsf
	 9gPp3gz8Pu++QW1mPJqckJrsnpD0vCniJnSYlfhScX9/nA5Hc/MjqnREjRGsWzYxuB
	 mhIQj1zVLKhiKY9YB/FTavIxi7hUDkicIcy/qCFYx1eWySjc8dk1JrMcJudnsf8HsW
	 HKbXJHxLQMcMw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/2] phy: qcom-snps-femto-v2: Add support for
 SA8255P
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sriram Dash <quic_sriramd@quicinc.com>
In-Reply-To: <20261002-phy-qcom-snps-femto-v2-8255-v3-2-342542bd9bc6@kernel.org>
References: <20261002-phy-qcom-snps-femto-v2-8255-v3-0-342542bd9bc6@kernel.org>
 <20261002-phy-qcom-snps-femto-v2-8255-v3-2-342542bd9bc6@kernel.org>
Date: Fri, 16 Oct 2026 21:14:49 +0530
Message-Id: <179216548965.106618.12539639688235621089.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5975; i=mani@kernel.org;
 h=from:subject:message-id; bh=9bXbLDYSonTKhdmt5hDhi+Ax8Sq8b8bafY5sQF5NToY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq0kZ1AeIG0PTbo2Axh48qwE8Lo5iQEODWtAb+3
 Cb80s22w8CJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCatJGdQAKCRBVnxHm/pHO
 9aIkB/4wSjPewk5Yrc11RaVVVMpqif2lk5SbR/kfEBN4O77rblXnIBnNXEjunoMzfHZzHuNsKlo
 n7QAPKS+T7dc5YYAaGWMBLBs8aQJcTrvZcBTyR1cr55smbYu/xZoDHA20igTvNhk/F2mxuYzUp6
 dqQALzjZG/wSrPcXCh529umbEnZiGmaeqeEjTbvUfzh5n/vNbeM8Uj2Nj6kxNmyoL67a6bQO464
 7C5zH+yZJxLPhKUf9HMrUmpQLxWh70MOYvHaTtnxCarCqBgXk5Ax0z7Zjf6CY6ejtMV6vA0lj+S
 SRphWo1OOEeC8WzKkhKbJD1fvZRDyX0T3BqCKh2LSui57z/W
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-02 11:41 +0200, Mattijs Korpershoek wrote:
> From: Sriram Dash <quic_sriramd@quicinc.com>
> 
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power on/off.
> 
> Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
> whereas power domain "transfer" controls clocks and interconnects.
> 
> In this variant, two disjoint sets of resources are modeled against
> the power domain suppliers which can be turned on/off to achieve modeled
> device states. Two modeled low power states d1 and d3 are supported.
> 
> transition: d0 <--> d3  :: both core and transfer suppliers
> transition: d0 <--> d1  :: only transfer supplier
> 
> Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 127 ++++++++++++++++++++++++--
>  1 file changed, 118 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index 980ad1fb1e2e..9fdf7ae681b6 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -12,6 +12,7 @@
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
> @@ -95,6 +96,7 @@ struct override_param_map {
>  	u8 table_size;
>  	u8 reg_offset;
>  	u8 param_mask;
> +	bool fw_managed;
>  };
>  
>  struct phy_override_seq {
> @@ -121,6 +123,7 @@ struct phy_override_seq {
>   * @phy_initialized: if PHY has been initialized correctly
>   * @mode: contains the current mode the PHY is in
>   * @update_seq_cfg: tuning parameters for phy init
> + * @pd_list: list of power domains associated with the device
>   */
>  struct qcom_snps_hsphy {
>  	struct device *dev;
> @@ -136,8 +139,81 @@ struct qcom_snps_hsphy {
>  	bool phy_initialized;
>  	enum phy_mode mode;
>  	struct phy_override_seq update_seq_cfg[NUM_HSPHY_TUNING_PARAMS];
> +
> +	struct dev_pm_domain_list *pd_list;
>  };
>  
> +static void qcom_snps_domain_detach(void *data)
> +{
> +	struct qcom_snps_hsphy *hsphy = data;
> +
> +	dev_pm_domain_detach_list(hsphy->pd_list);
> +}
> +
> +static int qcom_snps_domain_attach(struct qcom_snps_hsphy *hsphy)
> +{
> +	struct dev_pm_domain_attach_data pd_data = {
> +		.pd_flags       = PD_FLAG_NO_DEV_LINK,
> +		.pd_names       = (const char*[]) { "core", "transfer" },
> +		.num_pd_names   = 2,
> +	};
> +	struct device *dev = hsphy->dev;
> +	int ret;
> +
> +	ret = dev_pm_domain_attach_list(dev, &pd_data, &hsphy->pd_list);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "domain attach failed\n");
> +
> +	return 0;
> +}
> +
> +/* d3_to_d0 transition by turning on all the suppliers */
> +static int qcom_snps_d3_to_d0(struct qcom_snps_hsphy *hsphy)
> +{
> +	int ret;
> +
> +	if (!hsphy->pd_list)
> +		return 0;
> +
> +	ret = pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[0]);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[1]);
> +	if (ret)
> +		pm_runtime_put_sync(hsphy->pd_list->pd_devs[0]);
> +
> +	return ret;
> +}
> +
> +/* d0_to_d3 transition by turning off all the suppliers */
> +static void qcom_snps_d0_to_d3(struct qcom_snps_hsphy *hsphy)
> +{
> +	if (!hsphy->pd_list)
> +		return;
> +
> +	pm_runtime_put_sync(hsphy->pd_list->pd_devs[1]);
> +	pm_runtime_put_sync(hsphy->pd_list->pd_devs[0]);
> +}
> +
> +/* d1_to_d0 transition by turning on the 'transfer' supplier */
> +static int qcom_snps_d1_to_d0(struct qcom_snps_hsphy *hsphy)
> +{
> +	if (!hsphy->pd_list)
> +		return 0;
> +
> +	return pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[1]);
> +}
> +
> +/* d0_to_d1 transition by turning off the 'transfer' supplier */
> +static void qcom_snps_d0_to_d1(struct qcom_snps_hsphy *hsphy)
> +{
> +	if (!hsphy->pd_list)
> +		return;
> +
> +	pm_runtime_put_sync(hsphy->pd_list->pd_devs[1]);
> +}
> +
>  static int qcom_snps_hsphy_clk_init(struct qcom_snps_hsphy *hsphy)
>  {
>  	struct device *dev = hsphy->dev;
> @@ -196,6 +272,8 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
>  					   0, USB2_AUTO_RESUME);
>  	}
>  
> +	qcom_snps_d0_to_d1(hsphy);
> +
>  	return 0;
>  }
>  
> @@ -203,7 +281,7 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
>  {
>  	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode\n");
>  
> -	return 0;
> +	return qcom_snps_d1_to_d0(hsphy);
>  }
>  
>  static int __maybe_unused qcom_snps_hsphy_runtime_suspend(struct device *dev)
> @@ -316,6 +394,10 @@ static const struct override_param ls_fs_output_impedance_sc7280[] = {
>  	{ 1310, 0 },
>  };
>  
> +static const struct override_param_map sa8255p_snps_hs_phy = {
> +	.fw_managed = true,
> +};
> +
>  static const struct override_param_map sc7280_snps_7nm_phy[] = {
>  	{
>  		"qcom,hs-disconnect-bp",
> @@ -390,9 +472,15 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>  
>  	dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
>  
> +	ret = qcom_snps_d3_to_d0(hsphy);
> +	if (ret < 0) {
> +		dev_err(hsphy->dev, "Failed to transition to d0 state\n");
> +		return ret;
> +	}
> +
>  	ret = regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);

Why do you still control regulator natively in the SCMI path?

- Mani

