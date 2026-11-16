Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837334;
	b=W8dAI9Mh6fRURbnF7piGU6h9sG9FtV53Qo1FMBIgVVLh1koum1ElPyPQiT/Y5k1A6L/r
	 OUjh6RNQLo1q7SPnqkN+9nviwNbLu05RxUNNpgry6U+Myo4wsovMKkwb00E1h4QY6C7mn
	 OaUbtaEzSPBnnCMeCWJu2++qmIHP824Fhc3XiwQ606SQLY1YgEn4Rp3UwZENKPSdqEtqx
	 WPomVmsnLahiCuT5Q3pOhYm8o72QDD8j8KOIjDs5VU4jjOal3gFPStCvS5vxpdWVThHPi
	 pzxWDgW94DMh1B4HxtvhvrGwaAzUk0Ff7R4jN/fMl7neUxgjX3xAaI49f+SoYuS6EDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837334;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=FCGOa3XrFIfDpttYvQ7K/eFdh+Q44Gu+ztj0XVelAZ0=;
	b=U78UGE4ARsCYQk76JZNPSauKAOgWp86TkmA3fOVfM+KiKIVUgGGOpj4RbAE89u0xzWyn
	 UW/fOOkREtfMi9YgKGQAiPmmYDMclMpRaCqjd6gqT86vCxApSsTD8bsi8BXgdZrAAy0cI
	 9cwwctJCF741yaoH8AEuFX5W0mHh3logMuFjSUykBLf4h2LlI/RQ5ctwCvIvc17jlnvaY
	 wzY/1n1XMWQ5GgUeOcw3Dx1yQxLqCdCNiUGIjdEWAc2Ypy3gFh9ofrRpIPxrhQT9fapI2
	 K1nQbJQqIIFtmKyyPII22M5fWGQF9RyiRlPjql0sgHAuxKdVEwM3kgSphR7RBbv8emQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=T04CbP61;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9A6606AE44;
	Mon, 16 Nov 2026 13:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF9A6606AE44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=T04CbP61
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FCGOa3XrFIfDpttYvQ7K/eFdh+Q44Gu+ztj0XVelAZ0=; b=T04CbP61TFnnA7S4qsYADasFM9
	gEmppjaUC5umGuiwAsjETT43An/mWPSNQGyuJHmwBONwj5hGPHtiHI+Bd/cBelT2bYRZeSC5SK7di
	61uhuxeFxUiWWX0nxwVaN6ELnqkLUoAfK2a8k9pPTZNLx410AYtPgsHJ62T0VVKRO6yA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSxAx-00Gvgu-M1; Mon, 16 Nov 2026 14:55:15 +0100
Date: Mon, 16 Nov 2026 14:55:15 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: 1579567540@qq.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	David Wu <david.wu@rock-chips.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v3 2/2] net: stmmac: dwmac-rk: Add RK3572 support
Message-ID: <f8d4b637-1818-419c-ac51-fb2ded1f9b3e@lunn.ch>
References: <20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com>
 <20261116-add-board-ok3572-c-net-v3-2-a957fdcd9c7a@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-add-board-ok3572-c-net-v3-2-a957fdcd9c7a@qq.com>

> +static void rk3572_set_to_rgmii(struct rk_priv_data *bsp_priv,
> +				int tx_delay, int rx_delay)
> +{
> +	u32 val = GRF_FIELD(14, 8, rx_delay) | GRF_FIELD(6, 0, tx_delay) |
> +		  GRF_FIELD(15, 15, !!rx_delay) | GRF_FIELD(7, 7, !!tx_delay);
> +
> +	if (bsp_priv->id == 1) {
> +		regmap_write(bsp_priv->php_grf, RK3572_VCCIO0_3_VO_IOC_CON1, val);
> +		regmap_write(bsp_priv->php_grf, RK3572_VCCIO5_6_IOC_MISC0, val);
> +	} else {
> +		regmap_write(bsp_priv->php_grf, RK3572_VCCIO1_2_4_VI_IOC_CON1, val);
> +	}
> +}
> +
> +static const struct rk_gmac_ops rk3572_ops = {
> +	.init = rk3572_init,
> +	.set_to_rgmii = rk3572_set_to_rgmii,
> +	.gmac_phy_intf_sel_mask = GENMASK_U16(11, 9),
> +	.gmac_rmii_mode_mask = BIT_U16(3),
> +	.clock.io_clksel_io_mask = BIT_U16(7),
> +	.clock.gmii_clk_sel_mask = GENMASK_U16(6, 5),
> +	.clock.rmii_clk_sel_mask = BIT_U16(5),
> +	.clock.rmii_gate_en_mask = BIT_U16(4),
> +	.supports_rmii = true,
> +	.php_grf_required = true,
> +	.regs_valid = true,
> +	.regs = { 0x29d20000, 0x2a040000, 0 },
> +};

Just looking at this, it is not obvious that rx_delay and tx_delay are
actually not used.

	 Andrew
