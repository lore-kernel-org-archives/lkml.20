Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794402184;
	b=0nga+PcyayeBPRWr8n+oWuuhgDkaTsR6SnzhfzZ6QZpdkILoz1v/u/hAu42wPoQ7vrIw
	 +T/UyAz7IPK7DRlZnwTVydDZmfojcwzetqmhWeNMmUGai89J91MUzCbJrTDsHwAR9JyoL
	 zbOuN3N7iR7L3Mhg9aXgToT7+lkpvbppS/lNwS4XOa1iJCMPNUSoZ/mpiQHXm9wxdKAaf
	 BhMmmqm/y0lI+Lg6ijGBmkau4EJ6D5Q/S6pPeR27PMUTSqGvLQ1nGErwMC4913C/U49CQ
	 RMdPqgnEZyebnIfx7Hv3yja0CKhCa5IiMANWWcwDCw1w49YYjAbBExRbb7b2Z4zim5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402184;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=tlK6hSec1f9jWqEAlhwK9sJn2gZXx81wvvOTkXnIgdE=;
	b=enu585fOXOF+WDmTZuP+RxXBYbapDAsyTyaB9SbXjgi8ZbgLIsh6RwOxarKSvVfAj7DL
	 aa6SgUw49pbkGhLjOd223h0/RtEHlHcvpJRgnIs+35O4aiJtOcn7OHziA/dyqVsWouqKH
	 Y8Su40J+AymGPdZ9XsFOZGeWfams+APW6s699Phzv4WgIGJF/EVssuGfpyXwRw1X8qPPd
	 mZC38l1JLe3hylmWlZHar3cxOS7xcYQD2vtlLoZJZwY2aIgSaDMEtCxBGuDnb4nEfNZw+
	 1XkZQQqXajkr0mN9TiW71Yi8CH6Qa6il5BOt7U7dGnBVkotdbrvVDtznEB3ie6/hH7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Ea3iqC5S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F48606A334;
	Wed, 11 Nov 2026 13:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F48606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Ea3iqC5S
ARC-Seal: i=1; a=rsa-sha256; t=1794402160; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L8HEZ71KUMccAPwJPXHHfOiZLN3J2ti/R/h1ctJEI8xur9B1I2tKzj/DyOELXhWMG8sSrwmUNgsx4vxgYidSf5RHVHThWMsK5nVd+8DhzbD7iZQsR+gDrRit8Cc3UwRKWsiWPIwBZzNNtOgeBpaMib7dSu4XPZXlxp0ewDcPjWg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794402160; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tlK6hSec1f9jWqEAlhwK9sJn2gZXx81wvvOTkXnIgdE=; 
	b=nYscZxxZwaOIgkFrYT/t1cicREyBpMxN2YbK7eCAxl3ITUPWeyGhpEKqe8oWc1Mspra1MXRazUh+EJ0NthCk5563oxUxPDvlVim3BXXZoOsuoSUXDOAvmeGCrFYj2tfvz8utypbs8NKq4CiL1wDn7pH4HhsIK8gMTuBE3HVJOKA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=Ea3iqC5SA+kLnbCPnCuvTHVE11jFgWxos297PfeM3irdB1DhWWQIjI5xV1fRw+U4Zb72FgD+kLBkV0J2x7OoDeTfVXMamuprjb8KH3vVNWnRrEOvB52B3UxGl99jiFFiMXnAJtPB/2xqMwWVYlTYyP1Oo9o98GBnyown9maOc8A=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=tlK6hSec1f9jWqEAlhwK9sJn2gZXx81wvvOTkXnIgdE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794402159144738.3650032077535;
	Wed, 11 Nov 2026 05:02:39 -0800 (PST)
Message-ID: <3ab93996-7e37-4143-aa4c-b4b4b0e025d8@collabora.com>
Date: Wed, 11 Nov 2026 14:02:33 +0100
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
Subject: Re: [PATCH v6 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on
 PLL lock failure
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
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-3-d681ba20b36a@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-3-d681ba20b36a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Jason,

On 11/10/26 09:18, Jason Yang wrote:
> samsung_mipi_dphy_power_on() returns on a PLL lock timeout with PLL_EN
> set and m_phy_rst still asserted, and the PHY core does not call
> power_off after a failed power_on.
> 
> Today the APB reset at the start of the next power_on cleans this up.
> 
> A later change moves that reset to runtime resume, so the leftover
> PLL_EN would stay set, and regmap_update_bits() would not even write
> it again.
> 
> Unwind the power-on before returning the error.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-phy/sashiko-outbox-174059@kernel.org/
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> index 7382043e1f31..ce1bc62497c5 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> @@ -1343,8 +1343,11 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
>  	samsung_mipi_dphy_clk_lane_timing_init(samsung);
>  	samsung_mipi_dphy_data_lane_timing_init(samsung);
>  	ret = samsung_mipi_dcphy_pll_enable(samsung);

I wonder whether this should be here in the first place. Only judging by
the name, samsung_mipi_dcphy_pll_enable is something that affects the
complete logic block and probably should be kept in runtime resume to
begin with.

However, since _dphy_rx_power_on does not call this funcion, it seems to
be something related only to the TX side of the logic block, but for
D-PHY and C-PHY. In this case, it probably should go into
samsung_mipi_dcphy_tx_power_on.

On the off chance that this is actually for the D-PHY TX operation, the
function should be renamed "*_dcphy_pll_*" -> "*_dphy_pll_*" or
"*_dphy_tx_pll_*".

What do you think?

Best regards,
Michael


> -	if (ret < 0)
> +	if (ret < 0) {
> +		samsung_mipi_dcphy_pll_disable(samsung);
> +		reset_control_deassert(samsung->m_phy_rst);
>  		return ret;
> +	}
>  
>  	samsung_mipi_dphy_lane_enable(samsung);
>  
> 

