Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB613002B9;
	Wed,  9 Sep 2026 07:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939481; cv=none; b=N2Ve/nRwYGhwyZmobhl8ngOh8EteuAofAbJ5w8DB4XqpK4QggDNvLKT6+oJTk9P492JTImUhxL7NfKVIzffi2o7T9QV3XudzAuWjpgCHjK9x2NcU3NJbV0kwqtqzmiMVGo99iPHbAWKw+I4/1L6KuJckDf39psHGWyzMXXqqVmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939481; c=relaxed/simple;
	bh=63OJlxLj5WvUPh6u8FY27KSP3KoV3iyT6ThUCut2U8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L169S9+StIc7EH6UDVY9028LmDRrt2d6ywjYTmUkHHszVTuPoYHJ6B8JHor77d0xv5h+kzAvRvIWMKvN6/5Ec/DJ1H2oD32qujBU5LDKLkJtxNHVWhiCtszpVNXrzbPA5H8E1XbNdji79nmibQY9d8obuVptKIzxU2ht/2e2SPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGjCBk0Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGjCBk0Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFAF1F00A3A;
	Wed,  9 Sep 2026 07:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788939479;
	bh=4aZRlqqvMLjbIPmvvpAAGUHdgZsBWGGPHyB8VH0SxNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MGjCBk0ZAiXKm3dIguUZf+BjztEXIXL1+2asaeZkTFN0mlW/CJSsIMiZC6ghR+WKe
	 wGhK1P0Uz66JOoD1IrlLiqEYrS53oeisofGpS3BLPKFnZFCL1eyKlH9QBz6WMb00Fs
	 UUDGM5VaHjEPZqHZkZnI97zGeGRYy9T0mTzigUoW2mWqgUIB5s1lE8LS/y+YfoaTW+
	 MC68mmHFYmnMh7WOaKXV1ERC1fCKAicJlKm3Y9jmdYBvKZVDe9KPs2yjHVq4UrjKvI
	 lRu3qdOGv6YD1xFFVVC8YmW3g0RF0guV52ZxgMyU2VneFpdNZPUROjGuQ8q9RA8ewG
	 BPjtLAd+zoo/g==
Date: Wed, 9 Sep 2026 09:37:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, johan@kernel.org, rogerq@ti.com, 
	Julian.FRIEDRICH@frequentis.com, upstream+omap@sigma-star.at
Subject: Re: [PATCH v3 2/2] phy: ti: ti-pipe3: allow configuring ACSPCIe
 TX/RX mode
Message-ID: <20260909-hot-snobbish-cobra-0f97c5@quoll>
References: <20260905211555.15944-1-david.oberhollenzer@sigma-star.at>
 <20260905211555.15944-3-david.oberhollenzer@sigma-star.at>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260905211555.15944-3-david.oberhollenzer@sigma-star.at>

On Sat, Sep 05, 2026 at 11:15:55PM +0200, David Oberhollenzer wrote:
> For the PCIe PHYs, read the property from the device tree and
> update the RX/TX mode selection bits in the specified syscon
> register.
> 
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> ---
>  drivers/phy/ti/phy-ti-pipe3.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/phy/ti/phy-ti-pipe3.c b/drivers/phy/ti/phy-ti-pipe3.c
> index b5543b5c674c..bc02010dadb7 100644
> --- a/drivers/phy/ti/phy-ti-pipe3.c
> +++ b/drivers/phy/ti/phy-ti-pipe3.c
> @@ -115,6 +115,9 @@
>  #define MEM_CDR_LOS_SOURCE_MASK		GENMASK(10, 9)
>  #define MEM_CDR_LOS_SOURCE_SHIFT	9
>  
> +#define PCIE_TX_RX_CTRL_MASK		GENMASK(17, 16)
> +#define PCIE_TX_RX_CTRL_SHIFT		16
> +
>  /*
>   * This is an Empirical value that works, need to confirm the actual
>   * value required for the PIPE3PHY_PLL_CONFIGURATION2.PLL_IDLE status
> @@ -785,6 +788,24 @@ static int ti_pipe3_get_pll_base(struct ti_pipe3 *phy)
>  	return PTR_ERR_OR_ZERO(phy->pll_ctrl_base);
>  }
>  
> +static int ti_pipe3_acspcie_tx_rx_mode(struct ti_pipe3 *phy)
> +{
> +	struct device_node *np = phy->dev->of_node;
> +	struct regmap *regmap;
> +	unsigned int args[2];
> +
> +	regmap = syscon_regmap_lookup_by_phandle_args(np,
> +						      "ti,syscon-acspcie-tx-rx",
> +						      2, args);
> +	if (IS_ERR(regmap)) {
> +		dev_warn(phy->dev, "can't get ti,syscon-acspcie-tx-rx\n");
> +		return -EINVAL;
> +	}
> +
> +	return regmap_update_bits(regmap, args[0], PCIE_TX_RX_CTRL_MASK,
> +				  args[1] << PCIE_TX_RX_CTRL_SHIFT);
> +}
> +
>  static int ti_pipe3_probe(struct platform_device *pdev)
>  {
>  	struct ti_pipe3 *phy;
> @@ -807,6 +828,12 @@ static int ti_pipe3_probe(struct platform_device *pdev)
>  	phy->dpll_map = data->dpll_map;
>  	phy->settings = data->settings;
>  
> +	if (phy->mode == PIPE3_MODE_PCIE) {
> +		ret = ti_pipe3_acspcie_tx_rx_mode(phy);
> +		if (ret)
> +			dev_warn(dev, "failed to set ACSPCIe TX/RX mode\n");

This looks like new warning for existing ABI without any explanation why
is this a warning. Was it working? If yes, why existing boards should
warn now?

Best regards,
Krzysztof

