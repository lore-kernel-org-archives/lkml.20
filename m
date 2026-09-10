Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756D945FFAD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037993; cv=none; b=sziQvSaIVMi7ARyfHW2RX2MMYfMC6szi+HFF/kJ+k2olj8M/dnaq19O1r1TDeA0YcSHzSqzJg2A9kqzVc3MJmGCzc57AfPJV250eaprnDkLUQV1TcEQiEdlgHc1s0rZCRb9HDiVWJvOrfYx/xltZPDnWjFdJTddfdE+1Smzelcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037993; c=relaxed/simple;
	bh=K6vTRC6I31fQK6gVtUTNl3XwnQl2ZtJnVVWEd3Z7WFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nPZ94BhHWdCz6WJ3fQxBpQDCFjOFf1fMuvei64yrF9o4KYpoaIM3YLGN8/3HP+nu7sU7Y3SuLUK1eqPjHRcEJ/r53GhbG2h3paoc2r9ZdKX5UH40bYrPea0onf0QYZnjJSTa4RRltBygCZ7hUMe+0HQrUbhqGE3vHyetRPqP6+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MyKQSv9q; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MyKQSv9q"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C00B11A1A97;
	Thu, 10 Sep 2026 10:59:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8764F602B8;
	Thu, 10 Sep 2026 10:59:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C298211C78279;
	Thu, 10 Sep 2026 12:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789037987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PiVPoZqxXQzLSRnTyxJY0LUsG2EsVds3etvNlaImVXs=;
	b=MyKQSv9qy+ede1HK7HqbuXAUK7XqNhdafo5puwBvBNW5aeh0/tXviCEzLnnfor378UQg5p
	m4mN7KciSm6fhsKKUzhpiUcwf3efVd8QrepBSI+Kjyc6gj7yyzge1Yq5ghMACgVZ49GVjQ
	3QIjLBajCgtFqs4oHzyZkcx1X5HNhQdUho0sRSXTfFYWlARolRHSYAy6Hwh4qxgQAOyxLG
	A/Nh1wXO4WaXuIqnYXIoK+EBu4aAWRsLBYQ9HP+stBv970OTB/N2/jE2MZHuY/7LVEKZOM
	vzekn7UQdE/lQi/BQ2Pk2LLO4Ms1RCTsjouURhrT5P0dFgc/ta+2ICbS/giMHQ==
Message-ID: <44d7840d-0cde-4022-937c-4c630398c45d@bootlin.com>
Date: Thu, 10 Sep 2026 12:59:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Add support for Allwinner
 A733 GMAC210
To: Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andre Przywara <andre.przywara@arm.com>
References: <20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com>
 <20260910-allwinner-a733-gmac-support-v2-2-4f4a1e520c23@baylibre.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260910-allwinner-a733-gmac-support-v2-2-4f4a1e520c23@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Jerome,

On 9/10/26 12:25, Jerome Brunet wrote:
> The A733 GMAC210 is a DesignWare MAC 5.20 using an Allwinner glue close to
> the A523 GMAC200 already supported by this driver, with the following
> differences to handle:
> 
> * The glue configuration registers are a dedicated MMIO region of the
>   controller instead of a syscon register. This new register region
>   appears to be in the reset domain of stmmac's main reset. This requires
>   the glue driver to handle the reset rather than letting stmmac deal with
>   it.
> * The TX clock delay value is 5 bits wide, split over 2 register fields,
>   allowing delays up to 3100ps.
> * The DMA channels have their own interrupt lines, so the per-DMA-channel
>   interrupt mode is enabled, as the vendor SDK does.
> * TX LPI clock gating is supported, as the vendor SDK indicates. Follow
>   the PHY capability with STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP rather than
>   forcing it on with the deprecated 'snps,en-tx-lpi-clockgating' DT
>   property.
> 
> Unlike the A523, both GMAC instances are supported by the same driver.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

[...]

> +
> +static struct regmap *sun60i_gmac210_get_regmap(struct platform_device *pdev,
> +						struct plat_stmmacenet_data *plat)
> +{
> +	struct device *dev = &pdev->dev;
> +	void __iomem *base;
> +	int ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(base)) {
> +		dev_err_probe(dev, PTR_ERR(base), "unable to get glue memory region\n");
> +		return ERR_CAST(base);
> +	}
> +
> +	if (!plat->stmmac_rst || !plat->stmmac_ahb_rst) {

Why check stmmac_ahb_rst, but not do anything with it ?

> +		dev_err(dev, "missing required reset controls\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	/*
> +	 * The configuration registers are inside the controller
> +	 * reset domain, so the reset must happen before any write to them
> +	 * and should not be done again by stmmac or the configuration will
> +	 * be lost.
> +	 */
> +	ret = reset_control_assert(plat->stmmac_rst);
> +	if (!ret)
> +		ret = reset_control_deassert(plat->stmmac_rst);
> +
> +	if (ret) {
> +		dev_err_probe(dev, ret, "device reset failed\n");
> +		return ERR_PTR(ret);
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, sun60i_gmac210_reset_assert,
> +				       plat->stmmac_rst);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	plat->stmmac_rst = NULL;
> +
> +	return devm_regmap_init_mmio(&pdev->dev, base, &sun60i_a733_regmap_cfg);

I wonder if this is the first glue to face this...

If you need further setup to be done after reset has been deasserted, I suggest
adding a dedicated callback in plat_stmmacenet_data, instead of doing this behind
the generic code's back.

maybe something like "post_reset_init()", something like that ?

the ->mac_setup already runs after reset, but isn't really for this type of usecase.

For readability of the patch, maybe you should split this patch to first do the
a523 rework, then add a733 support.

Thanks !

Maxime
