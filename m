Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794410590;
	b=KK0M/mnj8x7ZcdUGNgj7Sr0cbRlGlr2kJ1jWimjPvr7yREgnTW4Ntm8Cbo5YDdWSxfzX
	 P0xpHzokWi3g1SZGBaKR+Te9KiH5AwVYN6CIp6oY/laXdlFejZvYQY+mfy67oj52GZ3dQ
	 yEOhWoPZEVNU9ytQzCrS2xINPfRvFKrtDPGDZvA6SKyW/iXqRFza2sDCqVXv1JhQXuGf1
	 MltP+ZC6tRg13pMeG/07Ct9UdQgz9MsIRMOa1z1kw4WkK6THSO5SC/f2mDF771ElAd8Mk
	 R3HBfCYFhs6N79TImaLhkHZaXk9jACn/k/a4btpjwp8gO+W7FkZfRIEBpD8wfngOQHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410590;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=Y/MlMaKErObWTkJAP1O/f3fHFrVRzBGbOZAvu7H6yRc=;
	b=CYwgKNTz2vD6POJ0dZFDCG20a2EkjgXAzQHjpc4ac0rskVzjTyaEruMvZeTwNlrW4vDR
	 Af2VpfAHl+jRuBMqQd/PBx2RvPTLUX3kiRSGeSPf7FOqXxd0ZJMgjC6+mZLzUMCWHBEdu
	 EyPahaJO6vMh8WF44EE6gs+IQRIRykXiHKlbfsvzbMdu3aAyeyXBp55Bf9SWR5Xh1bvo2
	 MDgnEohU1X0KrXvMLzKcCXRlQlCMcjl079GCA4nK+ITCy1H0N5wtu6sZyfDJ9el0XWM6C
	 mj1FEr5vCrEk+U5UQChtCisAIPOCyYSbO/q4DWiWUbp20UxFzgAOVi+fc7ZF+uVA3WA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=UrZMGIBQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B79606A324;
	Wed, 11 Nov 2026 15:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B79606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=UrZMGIBQ
ARC-Seal: i=1; a=rsa-sha256; t=1794410565; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gBXb74t8VyXcyhF2U34LZjd/IUJj3d2VeYmcQwcVmhDgqYdt0aA7l4BF2EycZCovx+aXjoATAiB02Y/M51ryalVmhjkrhC4vlttiGVF6uMyV5tqaNzNd0tQYBIbnVGCct+sk5t0+BYv4Wnj3bz9feMny92y9aE9Cjs8Trt1RtI0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794410565; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y/MlMaKErObWTkJAP1O/f3fHFrVRzBGbOZAvu7H6yRc=; 
	b=IPm3G8lZ0a0lC8SsV24HWlwwDfBP6W4rz4bY9DdjLaVpvnm8m/7sexyzQTTeVTLl3dqrCafCGvkxYiXnpi/i+XLIupHGqmIkzXY233oo6gQ5qkLZcbriw9xmfTnppHHlPHGaBhr3GyL+7fnAzYhhoAjhAb5ejKFlfWyg2GiFdp0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=UrZMGIBQEwNvdRSMeyfv8q9k6o61Ee2F1LiS1C2mRPoIalF2xvjnL21zkDzXGaEOv/z9paE0HJsU5voIWxvZllirKR4WSYdPG7hxv0PyK2iAhqxeg0897VsJnDLW6rSGNsEMQulXjuEamsOW+NPiqeARAiAy0qaYuXAKO14jK4U=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Y/MlMaKErObWTkJAP1O/f3fHFrVRzBGbOZAvu7H6yRc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794410563762127.88540542025612;
	Wed, 11 Nov 2026 07:22:43 -0800 (PST)
Message-ID: <fd9615e5-bc5a-4ce0-a43b-081f3e9c14c2@collabora.com>
Date: Wed, 11 Nov 2026 16:22:38 +0100
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
Subject: Re: [PATCH v6 8/9] phy: rockchip-samsung-dcphy: Add MIPI D-PHY
 receiver support
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
 <20261110-dcphy-rx-v1-v6-8-d681ba20b36a@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-8-d681ba20b36a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Jason,

Thanks for the patch!

On 11/10/26 09:18, Jason Yang wrote:
> [...]
> +static int samsung_mipi_dphy_rx_power_on(struct samsung_mipi_dcphy *samsung)
> +{
> +	struct samsung_mipi_phy *rx = &samsung->rx;
> +	int ret;
> +
> +	if (!rx->hs_clk_rate || !rx->lanes)
> +		return -EINVAL;
> +
> +	reset_control_assert(samsung->s_phy_rst);
> +
> +	samsung_mipi_dphy_rx_config_common(samsung);
> +	samsung_mipi_dphy_rx_config_settle(samsung);
> +
> +	ret = samsung_mipi_dphy_rx_lane_enable(samsung);
> +
> +	reset_control_deassert(samsung->s_phy_rst);
> +
> +	return ret;
> +}
> +
> +static int samsung_mipi_dphy_rx_power_off(struct samsung_mipi_dcphy *samsung)
> +{
> +	reset_control_assert(samsung->s_phy_rst);

I wonder whether this is really a D-PHY specific thing. You can keep it
as is for now, I'll try to bring up the C-PHY part on top of your
series, and then we'll see.

> [...]
>  static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
>  	.configure = samsung_mipi_dcphy_tx_configure,
>  	.power_on  = samsung_mipi_dcphy_tx_power_on,
> @@ -1535,6 +1905,15 @@ static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
>  	.owner	   = THIS_MODULE,
>  };
>  
> +static const struct phy_ops samsung_mipi_dcphy_rx_ops = {
> +	.configure = samsung_mipi_dcphy_rx_configure,
> +	.power_on  = samsung_mipi_dcphy_rx_power_on,
> +	.power_off = samsung_mipi_dcphy_rx_power_off,
> +	.init = samsung_mipi_dcphy_init,
> +	.exit = samsung_mipi_dcphy_exit,
> +	.owner	   = THIS_MODULE,

Nit: either align all = or just use a single space (personally I would
prefer the latter).

> [...]
Looks all good to me!

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

