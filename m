Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794402915;
	b=dNuV1FznviP1JmcBKZhK9C+uMG0TU6iHwzG7lheiwQiJgbM5Ehg/KSMDH0no14B528SM
	 aYJ4kOc4ABt2OzYfLLs3tEjuKtfGtO6w62qLKBCRzmon4HklMO/uYK6T7E/T/u6bC+snW
	 enBvB8SqwV7HFW6Ouf7jMLqYtvyvSqjYjF9juta84Bn7Cz/TtGq+aIjtGpA8J0iHF3TU6
	 gzPoYa0Kfts308nFpvwJWRHPedWsVx33Y34FI3DyOMqWuGuxM1y3K+kDwMUxDAyMblgqw
	 d2drdCk72r1TfhdvPx+Fp2lvh2tIC39aG08x2SVb9Q7mXqzLE8MpxKtNVaTHLM3Wh9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402915;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=Xc10+7RwQyckt9OcmRiolWc/n8l2uHi554tCZyrtaaA=;
	b=YVTfxDKhKMRX+ez4WZSSFZukPTHsykZZSrqaUzQ3ARsoHd/gsbMdF+zXEmx+ab/NpOzm
	 fxRzoE4XkguZNdDR0iucF+cCA/t+YYSdwvIKHVAZjlX/Bvs7prcLQPaZsTSEW/ctuRMj8
	 Z+CS0rT17Sz/gH8ENTdryfc4REGqWLZddtQYiNezM8n5SmhyKrzghcTORRMGcgfsGQpjH
	 FbMveeO0eSgc2gR+dgryId+lGePxj9Ca6VmZpPy/ZFGaUTuOXngc7Uz9EK0gV4aYuCymz
	 fQp0PEmLoNNONfBn3L3WUB7uzsK7oF1dLARoWzW+3bML9fFNkGN9Escn0Jl/uJUe67Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=FMEwYNIu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CA9606A32A;
	Wed, 11 Nov 2026 13:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94CA9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=FMEwYNIu
ARC-Seal: i=1; a=rsa-sha256; t=1794402893; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JiuYMiq8RBihKialjLq+csYOnvm3N2aGmzrVaPUdaxvEAGDkPBxmVCOfFs6FTNdvs8DMSwCszTFIdhdlyLUUjeS26WRTtCiigVfvezJ7wMJznjlUe7a8t6wr1kPUUs015VeOrMosw9xKCVyMwUCPpIjkGCXqL2Ot9fUlRjdgWVc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794402893; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Xc10+7RwQyckt9OcmRiolWc/n8l2uHi554tCZyrtaaA=; 
	b=WRC+mpP8UxmcLQ1/dFMf2anla6V/WKnVGXjxsW26lk3jCxzb2C2+RqLA9gctpu47GQRLxQLQx64tr2k7UMhLCDw9aylRuEcnuS5Xf4H1hsxe+ZxFTlpdVleg5//DbNRHXvPbN8PU8vt2EmyC2bcrIKl+W2RHLBh209w0PAZE5kM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=FMEwYNIu/lXOWYXTUwtQ/tATog2J9nKcRKlIZJh9KEmvFKR2PTUyfW8pVrU6YcesQub3HJNv2LjrsIdGY69Xe230rVICykok7XU6GTYZlbnteedow490LMElkus7ZqD+P2Z4yAeFoUvm1KBK2XQEncus9AyCZTTzjp030n1C6X0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Xc10+7RwQyckt9OcmRiolWc/n8l2uHi554tCZyrtaaA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179440289194724.462775649189325;
	Wed, 11 Nov 2026 05:14:51 -0800 (PST)
Message-ID: <6fbe6fed-3ed4-4f87-a92b-dbd01e1674d3@collabora.com>
Date: Wed, 11 Nov 2026 14:14:47 +0100
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
Subject: Re: [PATCH v6 5/9] phy: rockchip-samsung-dcphy: Move block-level
 setup to runtime resume
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
 <20261110-dcphy-rx-v1-v6-5-d681ba20b36a@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-5-d681ba20b36a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Jason,

Thanks for the patch!

On 11/10/26 09:18, Jason Yang wrote:
> The APB reset and the BIAS references have to be treated as block-level
> [1]: both the transmitter and the receiver need them, and they only have
> to be programmed once. They are programmed from the transmitter's
> power-on path today.
> 
> A later change registers one struct phy for each of them, and a second
> consumer coming up would then reset the block underneath a PHY that is
> already running.
> 
> Program them from runtime resume instead, where whichever of the two
> comes up first brings the block up and a second one no longer resets it.
> 
> This puts the BIAS writes ahead of the per-PHY reset assert, where the
> TRM's worked example has them after [1]. That is safe: neither M_RESETN
> nor S_RESETN covers the BIAS registers, and the values written are those
> registers' reset defaults.
> 
> [1] RK3588 TRM: sections 22.4.1 (address map), 22.4.2 (reset values),
>     22.6.1.2 (reset) and 22.6.4.1 (D-PHY transmitter start-up)
> 
> Signed-off-by: Jason Yang <jason98166@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> index 7a009d87a665..d6acc3e2d448 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> @@ -1346,7 +1346,6 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
>  
>  	reset_control_assert(samsung->m_phy_rst);
>  
> -	samsung_mipi_dcphy_bias_block_enable(samsung);
>  	samsung_mipi_dcphy_pll_configure(samsung);
>  	samsung_mipi_dphy_clk_lane_timing_init(samsung);
>  	samsung_mipi_dphy_data_lane_timing_init(samsung);
> @@ -1373,10 +1372,6 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
>  {
>  	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
>  
> -	reset_control_assert(samsung->apb_rst);
> -	udelay(1);
> -	reset_control_deassert(samsung->apb_rst);
> -
>  	switch (samsung->type) {
>  	case PHY_TYPE_DPHY:
>  		return samsung_mipi_dphy_power_on(samsung);
> @@ -1667,6 +1662,12 @@ static __maybe_unused int samsung_mipi_dcphy_runtime_resume(struct device *dev)
>  		return ret;
>  	}
>  
> +	reset_control_assert(samsung->apb_rst);
> +	udelay(1);
> +	reset_control_deassert(samsung->apb_rst);
> +
> +	samsung_mipi_dcphy_bias_block_enable(samsung);
> +
>  	return 0;
>  }
>  
> 

