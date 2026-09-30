Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EB13D25B2;
	Wed, 30 Sep 2026 19:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795949; cv=none; b=L6VEeb6dJI2QVCWxMp1mD+Qt7WRnktACPJQ3jGXuEYcz6cOFJ7gotKDTpb/lJhHc9/mzM4iKZqf7Ci4BSn0yPyds9RI5bdahIna3bO0xExYQFkw/EmU02tXvXkZlB8Jpq26zzjAheez4UiaFuLkWRcyBQqTXzr1VZD06lpY4GLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795949; c=relaxed/simple;
	bh=rk5P1nxCm72eMPtNH/rlvF8/DejgRjqn0dKqQSg0Nbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yx5V7+u8C+g33koEtCsZj2oOm7ZReQY4miFBoG1g1P6Chv+reVVLe3Xl3xdBJyNpQLTANVW990oP9pT8hleOmCQZxAUHY0EOFIINiDvpaugxzxCjO728wMCFp8JacxtqP/z+HRG33b409jMQGLXU36i1l6YYQfc66LTeBLNfnMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=CVzhuWnt; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="CVzhuWnt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XoUDkMKF7L1Z9q3nwhGq3tIuxBl8dHtlGRc13BPjNPo=; b=CVzhuWnti4+kryn8IEFwItWWNM
	9IlhVS2Pj0dduA+RR0QTDF9yL8Bjwkk5n5VFdv4kgxf5lfuUUmooxWKBBv/Kdvviqym+UgrMV6V5P
	y22BiSzrOl2nHPvkHn3+o+b85ypMo9T6kMW1eMgOvJt5NCDvJsfsu+Bi9qZKqbV7Lx3g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xBzpV-008E5Z-AF; Wed, 30 Sep 2026 21:19:01 +0200
Date: Wed, 30 Sep 2026 21:19:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: add Forlinx OK3568-C
Message-ID: <b81186ad-1da0-4c20-8b4a-aabdb7abb396@lunn.ch>
References: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
 <20260930-ok3568-c-v1-3-a0ffd55f5c95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-ok3568-c-v1-3-a0ffd55f5c95@gmail.com>

> +&gmac0 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy0>;
> +	/* Use rgmii-rxid mode to disable rx delay inside Soc */
> +	phy-mode = "rgmii-rxid";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_miim
> +		     &gmac0_tx_bus2
> +		     &gmac0_rx_bus2
> +		     &gmac0_rgmii_clk
> +		     &gmac0_rgmii_bus
> +		     &gmac0_clkinout
> +		     &eth0_pins>;
> +	tx_delay = <0x36>;
> +	status = "okay";
> +};
> +
> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	/* Use rgmii-rxid mode to disable rx delay inside Soc */
> +	phy-mode = "rgmii-rxid";

Yet another rockchip board which gets RGMII delays wrong.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

	Andrew
