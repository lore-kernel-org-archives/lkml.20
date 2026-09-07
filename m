Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD7237C91B;
	Mon,  7 Sep 2026 11:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778948; cv=pass; b=VicISUaZLA4+mVaKPi6pqiB6xV0eiUhjngRw8YcSi7BVKlBT9ncCF6jHTqcNdtcq6palUexQjHwV08MrKW1Zf9N9S+6AMrztxqvy876J5GX7o0majrvw/jLpxxk7GLOzHF3mr9cidSOZC+2Qb7H5yFGQUDyvO7wpq4dWiD9akuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778948; c=relaxed/simple;
	bh=pu9o2xF7Z8ois1PlGcOBKA3kGQqV1WVXVphUKnGrqF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jhpxc5ZlwQ0LsXldVZMwFULDq5YuEFtUPIjLVmMS+WAbwacGoKRivpDNB9ZGaGH+xRwq/5onndkvBwFKryuysfNnx5yZLxvywdn7lQzDm6LpoQcHK5drsBJ2LerJqbDSYTK4K0rh6TQXMPEDLnmTZgwsyy1JS16a/JiPcbxFIN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=OfTx4OYB; arc=pass smtp.client-ip=165.173.182.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="OfTx4OYB"
ARC-Seal: i=1; a=rsa-sha256; t=1788778937; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cEkx9n2gZuP37kraYeyo8ckYdvOQw3Bks6OBB3ybxuaeCa9v2srFeNcZe3RspQphrarocYxCysSzUQTmaWLTO8qJyH8CHJdIAIN9mDB334Zi7RAqvL9QtWpullrdkw/FRLGnQK1iku1WExCBmy/PDM99t8s2yB+MJqlhJGjcr3Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788778937; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cC9s+xjh/N6rSZarsENmP07faEM7u9hQPQhDsNCtyb0=; 
	b=nokuVz3EzgMlIDAQQD0EyZ/sgynSKqUBe1CtThToD87q8rWS1oqPeTjTeos41lM5gE58dvkaWBn2gUQUMBYHVYncglSkyxBw0j2VOFFhT2WWTlN9LPIiYToFbq2SH7uZPfWx8CdhTubspYR5Y5hoaA4/IpQXPQ2YSQU4/Yy3tCw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788778937;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cC9s+xjh/N6rSZarsENmP07faEM7u9hQPQhDsNCtyb0=;
	b=OfTx4OYBkz+3DmyYt2yyy3sr1yA5iGgH6LnzNJFIqlMOPD+1y9nrk0MGJ8Dvvy8E
	2ntbXswE9cxAu1B1JMFu9iBBekfkhKsqXoQ7NlixIR89DMKl4/IqqxJDKIy8ZKzDZTN
	UmUfVJW8XldqdvY1VzKB6OWAC5JWccpXdWCVPl48=
Received: by mx.zohomail.com with SMTPS id 1788778934224927.534650195504;
	Mon, 7 Sep 2026 04:02:14 -0700 (PDT)
Message-ID: <0ab0b4f4-ab5d-413b-9446-5d747c59a32a@collabora.com>
Date: Mon, 7 Sep 2026 13:02:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] phy: rockchip: phy-rockchip-inno-csidphy: add support
 for rk3576 variant
To: Amin Gattout <amin.gattout@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
 <20260820-rk3576-dphy-v1-3-70e25e8d5e78@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260820-rk3576-dphy-v1-3-70e25e8d5e78@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Amin,

Thanks for your patches!

On 8/20/26 16:01, Amin Gattout wrote:
> The two RK3576 MIPI CSI-2 DPHYs can be supported using the existing
> phy-rockchip-inno-csidphy driver, the notable difference with the
> RK3588 variant being that each PHY instance only has an APB reset
> line.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> index c79fb53d8ee5..24aefdcd6361 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> @@ -30,6 +30,7 @@
>  #define RK3568_GRF_VI_CON0		0x0340
>  #define RK3568_GRF_VI_CON1		0x0344
>  
> +#define RK3576_CSIDPHY_GRF_CON0		0x0000

This, ...

>  #define RK3588_CSIDPHY_GRF_CON0		0x0000
>  
>  /* PHY */
> @@ -119,6 +120,12 @@ static const struct dphy_reg rk3568_grf_dphy_regs[] = {
>  	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3568_GRF_VI_CON0, 1, 8),
>  };
>  
> +static const struct dphy_reg rk3576_grf_dphy_regs[] = {
> +	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK3576_CSIDPHY_GRF_CON0, 4, 0),
> +	[GRF_DPHY_CSIPHY_DATALANE_EN] = PHY_REG(RK3576_CSIDPHY_GRF_CON0, 4, 4),
> +	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3576_CSIDPHY_GRF_CON0, 1, 8),
> +};
> +

and this look pretty identical to RK3588, can't we just drop these two
and ...

>  static const struct dphy_reg rk3588_grf_dphy_regs[] = {
>  	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 0),
>  	[GRF_DPHY_CSIPHY_DATALANE_EN] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 4),
> @@ -403,6 +410,17 @@ static const struct dphy_drv_data rk3568_mipidphy_drv_data = {
>  	.resets_num = ARRAY_SIZE(rk3368_reset_names),
>  };
>  
> +static const struct dphy_drv_data rk3576_mipidphy_drv_data = {
> +	.pwrctl_offset = -1,
> +	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
> +	.calib_offset = RK3568_CSIDPHY_CLK_CALIB_EN,
> +	.hsfreq_ranges = rk1808_mipidphy_hsfreq_ranges,
> +	.num_hsfreq_ranges = ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
> +	.grf_regs = rk3576_grf_dphy_regs,

... use rk3588_grf_dphy_regs here?

> +	.resets = rk3368_reset_names,

So that the reset names are the only difference to RK3588 (which seems
to be the case as per commit message)?

> +	.resets_num = ARRAY_SIZE(rk3368_reset_names),
> +};
> +
>  static const struct dphy_drv_data rk3588_mipidphy_drv_data = {
>  	.pwrctl_offset = -1,
>  	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
> @@ -435,6 +453,10 @@ static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
>  		.compatible = "rockchip,rk3568-csi-dphy",
>  		.data = &rk3568_mipidphy_drv_data,
>  	},
> +	{
> +		.compatible = "rockchip,rk3576-csi-dphy",
> +		.data = &rk3576_mipidphy_drv_data,
> +	},
>  	{
>  		.compatible = "rockchip,rk3588-csi-dphy",
>  		.data = &rk3588_mipidphy_drv_data,
> 

Apart from that LGTM!

Best regards,
Michael

