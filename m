Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794402350;
	b=qrCbIB2DIftIG5oDS5Wm3snXVRuN/SfGCd2c2Z2MqYjcEbHc71R2n111h70Gy4jCMrrA
	 dtTLVb2FhdVIGlLcbeI2uFPglIKxbbrjqAqvwdIwJ20QeFJ21uoyUTd6aN+ubeI0zhTA4
	 lQxZCvCipF8h82exj2LtKZTyKrqgDfMrpVYjbVOxKZ9JglCm/8L295LpVi6PySipMgbZG
	 pSKYsTMeFrYsYPEMQzYFDetyfAgAoeP9t4I051roiSotdW6F6s/1eKXQWNqSu07PCmfdQ
	 heXCv6FJjcXzVeEgOjGIN4zPzBnZGTvlxXsMliuqBnir7j82cfaGUPcPEHZpSOL3Oaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402350;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=a6hsDgNTzykSL2abXXUyNJ0Ke8prVJlKInMZl5L7jgY=;
	b=sqbN7GfJrabR7Z7AtX7cDzasEg2qFeZu7NcQACI62bWcchKuRyK9T3llJpRdEis4bSBd
	 /0VbduSNbaomhP4Sev/DonbYaRK+8LecLph2J0oekWgelFxdnKRtJwGgovGG4m755yYzF
	 oPDg6k2Pi+XfgM5tpbOxhi6HnBhqy6v3Mw+JSvG4oW6UrPcwJg6esRwmo/5F2cusb/HNy
	 BSI0ePuAt1dYQ9qaJ+qderHhcBxddpGnnqa1eHAsfZBTiQlOIBIcLhmT9Q5GagHO+tcoN
	 tCp2MjqwNeKrKH3L8Mb068RLeArkremm6NakVdjT7AXL9/C1EaSR9bpGwqaYwXxRcPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=L5b5U28A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD576606A331;
	Wed, 11 Nov 2026 13:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD576606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=L5b5U28A
ARC-Seal: i=1; a=rsa-sha256; t=1794402324; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jdjmGwIHKro4sEJif9BOEN84OIIJnIpTUfWL4IgyG3hNZ9ynPIxp+PLHYNTd+eUvTiHpLU9jBXZJJYHBPskKp+LIErnN4QLikWo1e2HfTLerMdtdq6F/7HoHmxU7IkoL1/HmYUrJP3Syy0754XuDkkj9yV1VDk1dxTWTOh+T4YE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794402324; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=a6hsDgNTzykSL2abXXUyNJ0Ke8prVJlKInMZl5L7jgY=; 
	b=avmH6+Mwod4rZA5f1Erj0TgAqFETT2e+UE9vz4F364NrRB7zmR1/Tk5rNF2wWsy0Bxgj1tdK+ZDlWjxLujjBeXUfEitdwgBxZglJ54M8LJtn3V7/DNVz4/s0zGgx2iwSauOuv8uOdrFQQQu5j5BaKt9lOp4VXoZROHQvlQcvvFE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=L5b5U28A4NnyzChU9vvcpDypOIl+HM5LVyHk00mWLK9GuK87Y+At9JjkgTd3+MSW9tE7QYSzcT6zrxDPeYUTT2WWzo4UDKwOxbv00R9RZYpSAqHBErqJbIXaLpaYwg06W1o30gksPepsiPLK6SARaTy6UdvNJEIaynl74O7nC6o=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=a6hsDgNTzykSL2abXXUyNJ0Ke8prVJlKInMZl5L7jgY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794402322616938.5574111886522;
	Wed, 11 Nov 2026 05:05:22 -0800 (PST)
Message-ID: <9e8aaf6f-6899-4d60-a2f1-be11d3923dc7@collabora.com>
Date: Wed, 11 Nov 2026 14:05:16 +0100
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
Subject: Re: [PATCH v6 4/9] phy: rockchip-samsung-dcphy: Always write the
 rate-dependent registers
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
 <20261110-dcphy-rx-v1-v6-4-d681ba20b36a@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-4-d681ba20b36a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Jason,

Thanks for the patch!

On 11/10/26 09:18, Jason Yang wrote:
> The lane timing init functions write DPHY_MC_ANA_CON1, the four data
> lane ANA_CON1 registers and DPHY_MC_DESKEW_CON0 only above a data
> rate threshold, and the registers have to be zero below it [1].
> 
> Today the APB reset at the start of every power_on provides the zero.
> 
> A later change moves that reset to runtime resume, so a power_on at a
> lower rate after a higher one would keep the old values.
> 
> Write the registers on every power_on, with zero below the threshold.
> 
> [1] RK3588 TRM: sections 22.4.2 (reset values) and 22.4.3
>     (DPHY_MC_ANA_CON1, DPHY_MC_DESKEW_CON0)
> 
> Signed-off-by: Jason Yang <jason98166@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 24 +++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> index ce1bc62497c5..7a009d87a665 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> @@ -1228,7 +1228,10 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
>  	regmap_write(samsung->regmap, DPHY_MC_ANA_CON0, val);
>  
>  	if (lane_hs_rate >= 4500)
> -		regmap_write(samsung->regmap, DPHY_MC_ANA_CON1, 0x0001);
> +		val = 0x0001;
> +	else
> +		val = 0;
> +	regmap_write(samsung->regmap, DPHY_MC_ANA_CON1, val);
>  
>  	val = 0;
>  	/*
> @@ -1259,7 +1262,10 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
>  	 * under 1.5Gbps or equal to 1.5Gbps.
>  	 */
>  	if (lane_hs_rate > 1500)
> -		regmap_write(samsung->regmap, DPHY_MC_DESKEW_CON0, 0x9cb1);
> +		val = 0x9cb1;
> +	else
> +		val = 0;
> +	regmap_write(samsung->regmap, DPHY_MC_DESKEW_CON0, val);
>  }
>  
>  static void
> @@ -1284,12 +1290,14 @@ samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
>  	regmap_write(samsung->regmap, COMBO_MD2_ANA_CON0, val);
>  	regmap_write(samsung->regmap, DPHY_MD3_ANA_CON0, val);
>  
> -	if (lane_hs_rate >= 4500) {
> -		regmap_write(samsung->regmap, COMBO_MD0_ANA_CON1, 0x0001);
> -		regmap_write(samsung->regmap, COMBO_MD1_ANA_CON1, 0x0001);
> -		regmap_write(samsung->regmap, COMBO_MD2_ANA_CON1, 0x0001);
> -		regmap_write(samsung->regmap, DPHY_MD3_ANA_CON1, 0x0001);
> -	}
> +	if (lane_hs_rate >= 4500)
> +		val = 0x0001;
> +	else
> +		val = 0;
> +	regmap_write(samsung->regmap, COMBO_MD0_ANA_CON1, val);
> +	regmap_write(samsung->regmap, COMBO_MD1_ANA_CON1, val);
> +	regmap_write(samsung->regmap, COMBO_MD2_ANA_CON1, val);
> +	regmap_write(samsung->regmap, DPHY_MD3_ANA_CON1, val);
>  
>  	val = 0;
>  	/*
> 

