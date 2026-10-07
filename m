Received: from mail-m32102.qiye.163.com (mail-m32102.qiye.163.com [220.197.32.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C143101B6;
	Wed,  7 Oct 2026 00:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791334721; cv=none; b=YEkQSW+4SMKnmmt1AOjJUuUR+mKiD0qsGHOdf8y/u3C+HQUCILlLTz8QSEonkdF69DWybsWEC4KzgDHb9eGBUTruyjUoj7tfCo0rdUc3hx3YvtZcuDE3uKJLQmOfOUjKxoPqkdEm6ABgPCgph+n2tf2Wd/wTl5G/v3O1w3TG1Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791334721; c=relaxed/simple;
	bh=pDSQ4XNtcILfctyLUI78z9LVwsq1iP5GJsTvs8LTIzQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GAI69XQ4H1kDU30kNUSSd63hi/05kBaWzVIoq2hDvU6Kv6I3HtpdRMN4944Hzs8TbdT4lEwMsIPaNKObz1+wn0e+D6dP2xXmnCYgKmbw+ISd3OukF8Lbygxmx1oFAEJIIqSRauXqFwO3FgxYGNu6GmSjfTnZCWNrIoXkiyUNTv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=LVXOYYrg; arc=none smtp.client-ip=220.197.32.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="LVXOYYrg"
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 501f3a86f;
	Wed, 7 Oct 2026 08:53:17 +0800 (GMT+08:00)
Message-ID: <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com>
Date: Wed, 7 Oct 2026 08:53:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v13 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Coia Prant <coiaprant@gmail.com>
References: <20261006162807.2843858-1-coiaprant@gmail.com>
 <20261006162807.2843858-3-coiaprant@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261006162807.2843858-3-coiaprant@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa113d9b55103a4kunm37190398c7e909
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTEIaVh8aGEtLSEkYGR9NSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=LVXOYYrg7BT+nd5C/HPHiD661/6mZnPBVItwHAXs7TdiTEyAuM3iLBra6IVsJdrjJ82lOVy7sh81k/sLLbiXE7mKJnpYVoMe7Klk0SO+0VL/aPI8EkBunY4XUJKgouHCq8i+TfqLFVpPZnGA1OXmhuEjQEwYQq5jPrStu/tXl+4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=uv0E972XvkHZpc86P2YGE1FsEYyLKJDTtXbuIBu+qC0=;
	h=date:mime-version:subject:message-id:from;

在 2026/10/07 星期三 0:28, Coia Prant 写道:
> On RK3568, the SGMII interface can be routed to either GMAC0 or
> GMAC1 via the GRF register pipe_sgmii_mac_sel.
> 
> Add support for this selection by introducing the
> "rockchip,sgmii-mac-sel" DT property.
> 
>  From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
> bit 1 (pipe_sgmii_mac_sel) is defined as:
> 
>      0: SGMII routed to GMAC0
>      1: SGMII routed to GMAC1
> 
> The hardware reset value is 1 (GMAC1). If the property is set to 0,
> the driver routes SGMII to GMAC0; if set to 1, it routes to GMAC1.
> If the property is absent, the driver leaves the routing unchanged,
> so the effective value is whatever the bootloader or hardware reset
> left.
> 
> The driver validates the value and rejects anything other than 0 or 1.
> 
> This is necessary for boards such as the Ariaboard Photonicat, which
> uses the SGMII interface connected to GMAC0.
> 
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>   .../rockchip/phy-rockchip-naneng-combphy.c    | 42 +++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> index 7843356a4dd47..f76b48009673d 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -186,6 +186,7 @@ struct rockchip_combphy_grfcfg {
>   	struct combphy_reg pipe_xpcs_phy_ready;
>   	struct combphy_reg pipe_pcie1l0_sel;
>   	struct combphy_reg pipe_pcie1l1_sel;
> +	struct combphy_reg pipe_sgmii_mac_sel;
>   	struct combphy_reg u3otg0_port_en;
>   	struct combphy_reg u3otg1_port_en;
>   };
> @@ -212,6 +213,8 @@ struct rockchip_combphy_priv {
>   	bool enable_ssc;
>   	bool ext_refclk;
>   	struct clk *refclk;
> +	bool sgmii_mac_sel_present;
> +	u32 sgmii_mac_sel;
>   };
>   
>   static void rockchip_combphy_updatel(struct rockchip_combphy_priv *priv,
> @@ -341,6 +344,7 @@ static struct phy *rockchip_combphy_xlate(struct device *dev, const struct of_ph
>   static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy_priv *priv)
>   {
>   	int i;
> +	int ret;
>   
>   	priv->num_clks = devm_clk_bulk_get_all(dev, &priv->clks);
>   	if (priv->num_clks < 1)
> @@ -375,6 +379,16 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
>   
>   	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
>   
> +	if (device_property_present(dev, "rockchip,sgmii-mac-sel")) {
> +		ret = device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sgmii_mac_sel);
> +		if (ret) {
> +			dev_err(dev, "failed to read sgmii-mac-sel property\n");
> +			return ret;
> +		}
> +

device_property_read_u32() should return non-zero value if it's absent.
How about this:

	struct rockchip_combphy_priv {
		int sgmii_mac_sel;
	}

static int rockchip_combphy_parse_dt:
	u32 val;

         priv->sgmii_mac_sel = -1;
         if (!device_property_read_u32(dev, "rockchip,sgmii-mac-sel", 
&val)) {
                 if (val > 1)
                         return dev_err_probe(dev, -EINVAL,
                                              "invalid sgmii-mac-sel 
%u\n", val);
                 priv->sgmii_mac_sel = val;
         }


static int rk3568_combphy_cfg:
         case PHY_TYPE_SGMII:
                 if (priv->sgmii_mac_sel >= 0)
                         rockchip_combphy_param_write(priv->pipe_grf,
  
&cfg->pipe_sgmii_mac_sel,
  
priv->sgmii_mac_sel > 0);

> +		priv->sgmii_mac_sel_present = true;
> +	}
> +
>   	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
>   	/* fallback to old behaviour */
>   	if (PTR_ERR(priv->phy_rst) == -ENOENT)
> @@ -803,11 +817,34 @@ static const struct rockchip_combphy_cfg rk3562_combphy_cfgs = {
>   	.combphy_cfg	= rk3562_combphy_cfg,
>   };
>   
> +static int rk3568_combphy_select_sgmii_mac(struct rockchip_combphy_priv *priv)
> +{
> +	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
> +
> +	if (!priv->sgmii_mac_sel_present)
> +		return 0;
> +
> +	switch (priv->sgmii_mac_sel) {
> +	case 0:
> +		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel, false);
> +		break;
> +	case 1:
> +		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel, true);
> +		break;
> +	default:
> +		dev_err(priv->dev, "invalid sgmii-mac-sel value %u\n", priv->sgmii_mac_sel);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>   static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
>   {
>   	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
>   	unsigned long rate;
>   	u32 val;
> +	int ret;
>   
>   	switch (priv->type) {
>   	case PHY_TYPE_PCIE:
> @@ -873,6 +910,10 @@ static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
>   		break;
>   
>   	case PHY_TYPE_SGMII:
> +		ret = rk3568_combphy_select_sgmii_mac(priv);
> +		if (ret)
> +			return ret;
> +
>   		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_xpcs_phy_ready, true);
>   		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_phymode_sel, true);
>   		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_sel_qsgmii, true);
> @@ -984,6 +1025,7 @@ static const struct rockchip_combphy_grfcfg rk3568_combphy_grfcfgs = {
>   	.con3_for_sata		= { 0x000c, 15, 0, 0x00, 0x4407 },
>   	/* pipe-grf */
>   	.pipe_con0_for_sata	= { 0x0000, 15, 0, 0x00, 0x2220 },
> +	.pipe_sgmii_mac_sel	= { 0x0040, 1, 1, 0x00, 0x01 },
>   	.pipe_xpcs_phy_ready	= { 0x0040, 2, 2, 0x00, 0x01 },
>   	.u3otg0_port_en		= { 0x0104, 15, 0, 0x0181, 0x1100 },
>   	.u3otg1_port_en		= { 0x0144, 15, 0, 0x0181, 0x1100 },

