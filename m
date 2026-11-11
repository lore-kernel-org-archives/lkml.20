Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794403983;
	b=jHbkohrCUQdzL94rhsTXeMLH1CkMp9oVcPI8BPYf0k3xDYhf8beW0eI+6pBGP+bsawML
	 nBEDrHqaDA+8K19fFx1nOO4NZIw0FGldjOY0BfolbgQE1pAi5CQ8O32y4yNXfruXdBQu4
	 j/RBrIwXI7zvqwa2mr+vRQMP0/STswxuJgl06w2vhSQGPO4TIRUIoGUzJF7M6H1xKDcN+
	 v1BgpxWyhhyR0/QYtPZoCuNpmtw0JKGfsjS9rrVRWp1RMiXnv3sDuDGlCLpGHGS66rD7z
	 Z5wLHJGvgqHQtsHybh778Kk/caI2E84Fxz6ZiSUloc1HwzF4FnKzqwEDw5IHkKyrn8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403983;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=HgCEM27S7IbNhqq3jM19SR/jbOHjwjqAZf0wVe5KS5o=;
	b=A1W4mE6SkfL4cSd7jbcODSRE8aW5rL5Q1WUq66aXyQExJycfXKcN/rDsgzGh+8Nf1zUx
	 +OKfCJmE/6j5fTRXVWTxg5N8+RjB6DnfEXtQLr8wO0pi1f3O4CwgDSZpIhrFMHE0MyIb2
	 b25E37VQ/eLVFUUR2vyT5jA2FBNXSaAf4rvGsXgy6mvT2n7t5m2DMsEWeIdIqSRG51MLb
	 ERRe1gQXGj7By859xKDe+lmJKgokAJyho92JniEZCPWwUubG4K++vdj5HgHD5NDB/QVa+
	 NX6vwLSjRTUlcTKwYWPc+5lFfrkxu4SeNBSTIzytpW4YOnvxSLFLTvVelYbVa59TnOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=lWP+oOsk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514D5606A33A;
	Wed, 11 Nov 2026 13:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 514D5606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=lWP+oOsk
ARC-Seal: i=1; a=rsa-sha256; t=1794403961; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mPlMZ4QBfCYhqRipVGIeZsOMwEbcb63/j0o01IhSP7fWxRYSo8DD/waCAOmx0issHPqj0W3ADT/2nVhLM/lhAjyDv8DiO8Q2R69I2QS/aKeWCI5JXJgLZqRK6IqDq71PXGyY/GZR75GiUJLYWjD9SbZF1HNQ03yi1a0ZhlPwsS8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794403961; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HgCEM27S7IbNhqq3jM19SR/jbOHjwjqAZf0wVe5KS5o=; 
	b=I+/M9noVCAvGbkX6B4zoaMWUBvlGqe5lOu089fhVLuQZ6GsLbydsiJ/4TSp63wugMYmAd5HlVvvQIqg4D+tk6oRwF8DZG/FQLxqvleQS8ho9oIPMer8kc42Q8lXxed7ZGPwEmn2T+ysaATAHzMb4wEa/fKxifExLmuzFvScmm+Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=lWP+oOskxefOGnze70OdGE2pkyOkOegIGhKXhiqLmhkEQ3mQVw5WxA3fq+sOuxJWCySeZvGid/i8QV2wxJalmYcbuonWWmc016tW6S0bMNIyuRluHPCNJ71xNVXJFf34AhQ6GOMhvKwvLY+RcWJ67LZBuY9qn6bOrkZV4SqdZg0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=HgCEM27S7IbNhqq3jM19SR/jbOHjwjqAZf0wVe5KS5o=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794403959576103.49384226317557;
	Wed, 11 Nov 2026 05:32:39 -0800 (PST)
Message-ID: <a11909bf-01f4-4905-81d9-e5c295feb595@collabora.com>
Date: Wed, 11 Nov 2026 14:32:34 +0100
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
Subject: Re: [PATCH v6 7/9] phy: rockchip-samsung-dcphy: Support the new
 phy-type and direction binding
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
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-7-d681ba20b36a@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-7-d681ba20b36a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Jason,

Thanks for the patch!

On 11/10/26 09:18, Jason Yang wrote:
> The binding now selects the PHY with the cell and the mode of the block
> with the phy-type property of the provider. Read phy-type in probe,
> D-PHY by default.
> 
> of_xlate() returns the transmitter for PHY_DIRECTION_TX. The deprecated
> PHY_TYPE_DPHY and PHY_TYPE_CPHY select the transmitter as today, so
> existing DTs are unaffected.
> 
> A phy-type other than D-PHY or C-PHY fails probe. A deprecated cell
> value that does not match phy-type gets a warning, and the transmitter
> then refuses to power on, as in C-PHY mode today.
> 
> Signed-off-by: Jason Yang <jason98166@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 32 ++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> index c40c84791eca..e8e229fc4856 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> @@ -297,6 +297,7 @@ struct samsung_mipi_dcphy {
>  	struct reset_control *grf_apb_rst;
>  	struct samsung_mipi_phy tx;
>  	u8 type;
> +	bool legacy_mismatch;
>  
>  	const struct samsung_mipi_dcphy_plat_data *pdata;
>  	struct {
> @@ -1376,6 +1377,9 @@ static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
>  {
>  	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
>  
> +	if (samsung->legacy_mismatch)
> +		return -EOPNOTSUPP;
> +
>  	switch (samsung->type) {
>  	case PHY_TYPE_DPHY:
>  		return samsung_mipi_dphy_tx_power_on(samsung);
> @@ -1549,13 +1553,21 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	if (samsung->type != PHY_NONE && samsung->type != args->args[0])
> -		dev_warn(dev, "phy type select %d overwriting type %d\n",
> -			 args->args[0], samsung->type);
> -
> -	samsung->type = args->args[0];
> -
> -	return samsung->tx.phy;
> +	switch (args->args[0]) {
> +	case PHY_DIRECTION_TX:
> +		return samsung->tx.phy;
> +	case PHY_TYPE_DPHY:
> +	case PHY_TYPE_CPHY:
> +		if (args->args[0] != samsung->type) {
> +			dev_warn(dev, "unsupported phy cell %u with phy-type %u\n",
> +				 args->args[0], samsung->type);
> +			samsung->legacy_mismatch = true;
> +		}
> +		return samsung->tx.phy;
> +	default:
> +		dev_err(dev, "invalid phy cell %u\n", args->args[0]);
> +		return ERR_PTR(-EINVAL);
> +	}
>  }
>  
>  static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
> @@ -1566,6 +1578,7 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
>  	struct phy_provider *phy_provider;
>  	struct resource *res;
>  	void __iomem *regs;
> +	u32 type = PHY_TYPE_DPHY;
>  	int ret;
>  
>  	samsung = devm_kzalloc(dev, sizeof(*samsung), GFP_KERNEL);
> @@ -1620,6 +1633,11 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(samsung->grf_apb_rst),
>  				     "Failed to get system grf_apb_rst control\n");
>  
> +	of_property_read_u32(np, "phy-type", &type);
> +	if (type != PHY_TYPE_DPHY && type != PHY_TYPE_CPHY)
> +		return dev_err_probe(dev, -EINVAL, "unsupported phy-type %u\n", type);
> +	samsung->type = type;
> +
>  	ret = devm_pm_runtime_enable(dev);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> 

