Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793144025;
	b=W+HIRPL9afM7cAmkmozFwH++TrS46XSpcvQg5P0oaKMUoCbwrUJ8HHbIuVTbbNZatgBU
	 vqZWLC+2cZt4+S02yQtc9JLxs8D6LKxcEtD7fcnHb5GzJleQWB7rXh9dyD6WyiWAbWrf3
	 Zp3gNAQPD1MNbdKYbbsrdbtcalB7JdniWuHnwt3tjf4BIR/hGMXQ2dJjFle6uQFN3+XIx
	 jQgwEd3Hm5nAfnujcVoBC0LA4JFeG0u44wFLT6T/quugZAsBjeijOhItRVx+k7Bt0O2qY
	 Yk0I4oD5ngelwiZ/SyuHl6jV5ZX0kAaTCjxFNYCHqWegn29hN9DRkNyGqK1+SlsG6CQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144025;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=Jw2ey/OZijryvj0S+y/f89cNLGimAHEy+NccJ01nTUg=;
	b=s8BCffRJYpLUBmF3cKB4ohNNAwCFDTCYHo47kOLZW1ZzZD64RDH4U12/TJbAQ3AJ34xB
	 9qKZeX6Zi760KTfRsgAGmEMcCafl/m+Ew6Gv9MfoVaaN/O4AjAELA3ObvE7Vpyo/KvC2u
	 ejGR4/VJOvLadVFuoMQNccYBm1CfQHF7qw/Dk+wKNkcZu0l40i5VfoNgpr7tECZng89V1
	 05YWvzI+1UNpt0h1mjksmr7PO+LNb9aJl2f0CX+2vkHB375VfoIPELVQtUh8j9iBCrgUo
	 7dSiOH8T3fKUelR7ZepnbQHTM66NA4vMO+bpMD/9yQyTsnwpnT0u6tVP8Pc56ZRmLSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=michael.riesch@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=fesGzFvM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF8C606A31A;
	Tue, 27 Oct 2026 23:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF8C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=michael.riesch@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=fesGzFvM
ARC-Seal: i=1; a=rsa-sha256; t=1793144000; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j+JuRIAb0K6MuNp8J1rcdYOHgWSa3n1Nps7zQtZYOpmqRYsIFScmryAL9ru2cHmkwz4KUEC3SPWDWQBzDG3ywqMigfmjRv2MEQaoFBwYsd65jSWQpeUSdAtf2qaK3RbVBgQQkibJUOmWYv9YYFp1+Y1Ts/lk+0+B5BmJPy7bZO4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793144000; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Jw2ey/OZijryvj0S+y/f89cNLGimAHEy+NccJ01nTUg=; 
	b=M+fWrq9gZkHH2aSbTYAq6X27FuPQpb5xcnfw95eJodbw3mhMcLATvcLwCgK7dIHtivdeTCe5ll5Nr1CbEjlIlS7DepGtyzX5vCqOp3uOhLEqv3QJjqA8+aXm+fbHE0+3m1ap7tYWo1VJj6cb2Lq44rmTQerMR0tJciftue2g0tY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1793144000;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Jw2ey/OZijryvj0S+y/f89cNLGimAHEy+NccJ01nTUg=;
	b=fesGzFvMv7CB//eQIpGI1cITbDtnXb360Fhy9Mjxk7unjOBgdKbVnED/8yp0vcNc
	6KzrmfqnLHxZWbYaIl3Xw6iVMSs73vOR1S+LZ6RgBzMbJ7P/5IYLKzVQKOwv/d9dlg1
	++aFIcWl8hydxI1y0No/PBd/oRVRDv4Xiuoi3GG4=
Received: by smtp.zohomail.com with SMTPS id 1793143998626676.1615219094302;
	Tue, 27 Oct 2026 16:33:18 -0700 (PDT)
Message-ID: <a0e76f15-d9ff-43fd-9ef0-e944d184eefd@collabora.com>
Date: Wed, 28 Oct 2026 00:33:13 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] phy: rockchip-samsung-dcphy: Name the transmitter
 helpers and ops
To: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-4-e63b49eabe2d@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-4-e63b49eabe2d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Jason,

This looks good to me.

On 10/16/26 10:56, Jason Yang wrote:
> The block is a combo PHY: it exposes a transmitter and a receiver, and a
> later change registers one struct phy for each. Prepare for that. Give
> every helper that programs the master lanes a tx_ prefix, and move the
> phy pointer and the lane count, which only the transmitter uses, into a
> struct samsung_mipi_phy that the receiver can have one of too.
> 
> Name the phy_ops and its callbacks after the transmitter as well, so
> that the receiver can bring its own rather than share these.
> 
> The BIAS block and the PLL keep their names: the TRM puts both in the
> part common to the whole block [1], so neither belongs to one PHY even
> though only the transmitter drives the PLL.
> 
> No functional change intended.
> 
> [1] RK3588 TRM: sections 22.3.1 (bias generator), 22.3.2 (PLL) and
>     22.4.1 (address map)
> 
> Assisted-by: LLM
> Signed-off-by: Jason Yang <jason98166@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 67 ++++++++++++-----------
>  1 file changed, 36 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> index 1471a1563d2a..e4293c8d2b29 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> @@ -280,6 +280,11 @@ struct samsung_mipi_dcphy_plat_data {
>  	u32 dphy_tx_max_lane_kbps;
>  };
>  
> +struct samsung_mipi_phy {
> +	struct phy *phy;
> +	unsigned int lanes;
> +};
> +
>  struct samsung_mipi_dcphy {
>  	struct device *dev;
>  	struct clk *ref_clk;
> @@ -290,8 +295,7 @@ struct samsung_mipi_dcphy {
>  	struct reset_control *s_phy_rst;
>  	struct reset_control *apb_rst;
>  	struct reset_control *grf_apb_rst;
> -	unsigned int lanes;
> -	struct phy *phy;
> +	struct samsung_mipi_phy tx;
>  	u8 type;
>  
>  	const struct samsung_mipi_dcphy_plat_data *pdata;
> @@ -982,13 +986,13 @@ static void samsung_mipi_dcphy_bias_block_enable(struct samsung_mipi_dcphy *sams
>  						 REG_400M_400MV | REG_645M_645MV);
>  }
>  
> -static void samsung_mipi_dphy_lane_enable(struct samsung_mipi_dcphy *samsung)
> +static void samsung_mipi_dphy_tx_lane_enable(struct samsung_mipi_dcphy *samsung)
>  {
>  	regmap_write(samsung->regmap, DPHY_MC_GNR_CON1, T_PHY_READY(0x2000));
>  	regmap_update_bits(samsung->regmap, DPHY_MC_GNR_CON0,
>  			   PHY_ENABLE, PHY_ENABLE);
>  
> -	switch (samsung->lanes) {
> +	switch (samsung->tx.lanes) {
>  	case 4:
>  		regmap_write(samsung->regmap, DPHY_MD3_GNR_CON1,
>  			     T_PHY_READY(0x2000));
> @@ -1017,9 +1021,9 @@ static void samsung_mipi_dphy_lane_enable(struct samsung_mipi_dcphy *samsung)
>  	}
>  }
>  
> -static void samsung_mipi_dphy_lane_disable(struct samsung_mipi_dcphy *samsung)
> +static void samsung_mipi_dphy_tx_lane_disable(struct samsung_mipi_dcphy *samsung)
>  {
> -	switch (samsung->lanes) {
> +	switch (samsung->tx.lanes) {
>  	case 4:
>  		regmap_update_bits(samsung->regmap, DPHY_MD3_GNR_CON0,
>  				   PHY_ENABLE, 0);
> @@ -1094,7 +1098,7 @@ static void samsung_mipi_dcphy_pll_disable(struct samsung_mipi_dcphy *samsung)
>  }
>  
>  static const struct samsung_mipi_dphy_timing *
> -samsung_mipi_dphy_get_timing(struct samsung_mipi_dcphy *samsung)
> +samsung_mipi_dphy_tx_get_timing(struct samsung_mipi_dcphy *samsung)
>  {
>  	const struct samsung_mipi_dphy_timing *timings;
>  	unsigned int num_timings;
> @@ -1201,13 +1205,13 @@ samsung_mipi_dcphy_pll_round_rate(struct samsung_mipi_dcphy *samsung,
>  }
>  
>  static void
> -samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
> +samsung_mipi_dphy_tx_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
>  {
>  	const struct samsung_mipi_dphy_timing *timing;
>  	unsigned int lane_hs_rate = div64_ul(samsung->pll.rate, USEC_PER_SEC);
>  	u32 val, res_up, res_down;
>  
> -	timing = samsung_mipi_dphy_get_timing(samsung);
> +	timing = samsung_mipi_dphy_tx_get_timing(samsung);
>  	regmap_write(samsung->regmap, DPHY_MC_GNR_CON0, 0xf000);
>  
>  	/*
> @@ -1256,13 +1260,13 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
>  }
>  
>  static void
> -samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
> +samsung_mipi_dphy_tx_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
>  {
>  	const struct samsung_mipi_dphy_timing *timing;
>  	unsigned int lane_hs_rate = div64_ul(samsung->pll.rate, USEC_PER_SEC);
>  	u32 val, res_up, res_down;
>  
> -	timing = samsung_mipi_dphy_get_timing(samsung);
> +	timing = samsung_mipi_dphy_tx_get_timing(samsung);
>  
>  	/*
>  	 * The Drive-Strength / Voltage-Amplitude is adjusted by adjusting the
> @@ -1325,7 +1329,7 @@ samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
>  	regmap_write(samsung->regmap, DPHY_MD3_TIME_CON4, 0x1f4);
>  }
>  
> -static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
> +static int samsung_mipi_dphy_tx_power_on(struct samsung_mipi_dcphy *samsung)
>  {
>  	int ret;
>  
> @@ -1339,13 +1343,13 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
>  			   I_MUX_SEL_MASK, I_MUX_400MV);
>  
>  	samsung_mipi_dcphy_pll_configure(samsung);
> -	samsung_mipi_dphy_clk_lane_timing_init(samsung);
> -	samsung_mipi_dphy_data_lane_timing_init(samsung);
> +	samsung_mipi_dphy_tx_clk_lane_timing_init(samsung);
> +	samsung_mipi_dphy_tx_data_lane_timing_init(samsung);
>  	ret = samsung_mipi_dcphy_pll_enable(samsung);
>  	if (ret < 0)
>  		return ret;
>  
> -	samsung_mipi_dphy_lane_enable(samsung);
> +	samsung_mipi_dphy_tx_lane_enable(samsung);
>  
>  	reset_control_deassert(samsung->m_phy_rst);
>  
> @@ -1357,13 +1361,13 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
>  	return 0;
>  }
>  
> -static int samsung_mipi_dcphy_power_on(struct phy *phy)
> +static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
>  {
>  	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
>  
>  	switch (samsung->type) {
>  	case PHY_TYPE_DPHY:
> -		return samsung_mipi_dphy_power_on(samsung);
> +		return samsung_mipi_dphy_tx_power_on(samsung);
>  	default:
>  		/* CPHY part to be implemented later */
>  		return -EOPNOTSUPP;
> @@ -1372,13 +1376,13 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
>  	return 0;
>  }
>  
> -static int samsung_mipi_dcphy_power_off(struct phy *phy)
> +static int samsung_mipi_dcphy_tx_power_off(struct phy *phy)
>  {
>  	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
>  
>  	switch (samsung->type) {
>  	case PHY_TYPE_DPHY:
> -		samsung_mipi_dphy_lane_disable(samsung);
> +		samsung_mipi_dphy_tx_lane_disable(samsung);
>  		break;
>  	default:
>  		/* CPHY part to be implemented later */
> @@ -1477,13 +1481,13 @@ samsung_mipi_dcphy_pll_calc_rate(struct samsung_mipi_dcphy *samsung,
>  	}
>  }
>  
> -static int samsung_mipi_dcphy_configure(struct phy *phy,
> -					union phy_configure_opts *opts)
> +static int samsung_mipi_dcphy_tx_configure(struct phy *phy,
> +					   union phy_configure_opts *opts)
>  {
>  	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
>  	unsigned long long target_rate = opts->mipi_dphy.hs_clk_rate;
>  
> -	samsung->lanes = opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lanes;
> +	samsung->tx.lanes = opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lanes;
>  
>  	samsung_mipi_dcphy_pll_calc_rate(samsung, target_rate);
>  	opts->mipi_dphy.hs_clk_rate = samsung->pll.rate;
> @@ -1507,10 +1511,10 @@ static int samsung_mipi_dcphy_exit(struct phy *phy)
>  	return 0;
>  }
>  
> -static const struct phy_ops samsung_mipi_dcphy_ops = {
> -	.configure = samsung_mipi_dcphy_configure,
> -	.power_on  = samsung_mipi_dcphy_power_on,
> -	.power_off = samsung_mipi_dcphy_power_off,
> +static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
> +	.configure = samsung_mipi_dcphy_tx_configure,
> +	.power_on  = samsung_mipi_dcphy_tx_power_on,
> +	.power_off = samsung_mipi_dcphy_tx_power_off,
>  	.init = samsung_mipi_dcphy_init,
>  	.exit = samsung_mipi_dcphy_exit,
>  	.owner	   = THIS_MODULE,
> @@ -1540,7 +1544,7 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
>  
>  	samsung->type = args->args[0];
>  
> -	return samsung->phy;
> +	return samsung->tx.phy;
>  }
>  
>  static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
> @@ -1609,11 +1613,12 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
>  
> -	samsung->phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_ops);
> -	if (IS_ERR(samsung->phy))
> -		return dev_err_probe(dev, PTR_ERR(samsung->phy), "Failed to create MIPI DC-PHY\n");
> +	samsung->tx.phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_tx_ops);
> +	if (IS_ERR(samsung->tx.phy))
> +		return dev_err_probe(dev, PTR_ERR(samsung->tx.phy),
> +				     "Failed to create MIPI DC-PHY transmitter\n");
>  
> -	phy_set_drvdata(samsung->phy, samsung);
> +	phy_set_drvdata(samsung->tx.phy, samsung);
>  
>  	phy_provider = devm_of_phy_provider_register(dev, samsung_mipi_dcphy_xlate);
>  	if (IS_ERR(phy_provider))
> 

