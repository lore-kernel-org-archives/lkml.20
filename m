Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B7225F98A;
	Sat, 10 Oct 2026 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791638546; cv=pass; b=FjVeNIlCm/Rt1kvPRSuvHYahQowGkvLIVyABhQPY7bVmw4M4T/cM0/8k6b1BFASjE9tEULHcjB92zeCBB/zGgjtxTVzeQoF2npuJyg01OApIAdJOmjOOKsJVcgKXpe9f6NI43IqWNJIOu8TaWAdkoKB5QGRtqEP8eX/plA71cZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791638546; c=relaxed/simple;
	bh=Pj516Hm2b3OG5p0aztckXJXyqzsUsh107n1zg80S/2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ss50VJniWg2AAYX7XfcRB14vYbrean4UpOnRIQlpo6nZWb6zJU3As8Um5JDstpbOCzZWQmAa7/cYmGu1eG4MMQZiOhtOo71zDbRfnXEd7JnGthF+nrRY+CxaXoo28u4SgtusD5+WM4i5NIVYAdMdj9p3ddKqvo+w05P7/YJUUZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=SFlalIgS; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="SFlalIgS"
ARC-Seal: i=1; a=rsa-sha256; t=1791638521; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dD2gFjlbKNoAl8LTV75sK9VXGb7c7D2nja/IdlD13MvBaNvNn4+3enQUGEPSn1bVUpnv4GH5D006AzpsHyb6NIqR1eCxNqvngLW+xust6QHTsdJ2QaQdBsZidF3RyKmDzxMO1MlfBrPvb8iCrnR9qVANLFCGDc78+0ed154BUMk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791638521; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kcVMv81811zZuAv2FuonuKSFUIjIBAqY9YBibiFltS4=; 
	b=XyjSZBsJxu0e6lteqZ47727sNylQS80cuJcxtpX9oUqsmo+pAfboKegDpMlyZ2eXcM9nB590ERRPgGNgQ40vx+n2QPIb8rX6/9WnplcC/vLB8KP4i0P4210hjdhDs9qEQjls4LX+RTxfrDjfFIhdr7+4G6ZlFzWAYwbwMXUrM74=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791638521;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kcVMv81811zZuAv2FuonuKSFUIjIBAqY9YBibiFltS4=;
	b=SFlalIgSeP3zaMP6VPGO7p4PDiu3c6Eqoa8nkuvLg9ifm2r7sLMsqkKF/zIul6Cb
	C7NfoS9w5Gd+EHYW16ky0t8G1IdtnJPu1vAakoNQtDI5TxuecoHB7n7C4mz94aGNLse
	rPlpxc24X2XblYNlB4ms6gA6JM4iL/alk6pPR+Gs=
Received: by smtp.zohomail.com with SMTPS id 1791638520514317.5735096552768;
	Sat, 10 Oct 2026 06:22:00 -0700 (PDT)
Message-ID: <c746c60f-cc12-4827-bef2-1d1d6f605d0b@collabora.com>
Date: Sat, 10 Oct 2026 15:21:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] phy: rockchip-samsung-dcphy: Factor the
 transmitter teardown into a helper
To: jason98166@gmail.com, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
 <20260821-dcphy-rx-v1-v4-5-f1797634233d@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260821-dcphy-rx-v1-v4-5-f1797634233d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Jason,

Thank you for your work!

On 8/21/26 14:02, Jason Yang via B4 Relay wrote:
> From: Jason Yang <jason98166@gmail.com>
> 
> The transmitter's power-on path is in samsung_mipi_dphy_tx_power_on(),
> but the power_off callback still does the teardown itself.
> 
> Move the teardown into samsung_mipi_dphy_tx_power_off(), so that
> power-on and power-off are a matching pair. Both callbacks then have a
> type switch whose arms are plain returns. Turn each into an early guard
> for the not yet supported C-PHY and drop the unreachable trailing
> return.
> 
> No functional change intended.
> 
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 31 ++++++++++-------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> index f58907dec733..5d9d44a1d6a2 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> @@ -1361,37 +1361,34 @@ static int samsung_mipi_dphy_tx_power_on(struct samsung_mipi_dcphy *samsung)
>  	return 0;
>  }
>  
> +static int samsung_mipi_dphy_tx_power_off(struct samsung_mipi_dcphy *samsung)
> +{
> +	samsung_mipi_dphy_tx_lane_disable(samsung);
> +	samsung_mipi_dcphy_pll_disable(samsung);
> +
> +	return 0;
> +}
> +
>  static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
>  {
>  	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
>  
> -	switch (samsung->type) {
> -	case PHY_TYPE_DPHY:
> -		return samsung_mipi_dphy_tx_power_on(samsung);
> -	default:
> -		/* CPHY part to be implemented later */
> +	/* CPHY part to be implemented later */
> +	if (samsung->type != PHY_TYPE_DPHY)
>  		return -EOPNOTSUPP;
> -	}

What is the value of doing that? Personally I'd leave the switch.

Best regards,
Michael

>  
> -	return 0;
> +	return samsung_mipi_dphy_tx_power_on(samsung);
>  }
>  
>  static int samsung_mipi_dcphy_tx_power_off(struct phy *phy)
>  {
>  	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
>  
> -	switch (samsung->type) {
> -	case PHY_TYPE_DPHY:
> -		samsung_mipi_dphy_tx_lane_disable(samsung);
> -		break;
> -	default:
> -		/* CPHY part to be implemented later */
> +	/* CPHY part to be implemented later */
> +	if (samsung->type != PHY_TYPE_DPHY)
>  		return -EOPNOTSUPP;
> -	}
>  
> -	samsung_mipi_dcphy_pll_disable(samsung);
> -
> -	return 0;
> +	return samsung_mipi_dphy_tx_power_off(samsung);
>  }
>  
>  static int
> 

