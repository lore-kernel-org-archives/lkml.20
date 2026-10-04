Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E4235E1D9;
	Sun,  4 Oct 2026 21:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791148358; cv=none; b=Nv+SwaIW3RbeYCjot15ip+babqABuchzLxzuScde5j2Fg+/7xXlsLUqAG24zD5zD6ZHP5ISjsj4VkQMpfMeLDt4wMw0nScYAuN54umxoTTLzvLTKTPLezgiQ+ANq2FnK9u84brbtMewmpMmuqF/8RG1rK8sImpqgBz1247sPaK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791148358; c=relaxed/simple;
	bh=NmrH2uqY7UdOuCzorL+84N0i0TF2zr1eCTSHpf3PYcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQmpUMBQakW0AjhaVq14M/PTi15UdPnrfy70buIvcsmOvkyUG1bvrvFAasMmxe4junVno8yIEK5u40ULG3L2GvvnuXP9KS10476MZHBJVZLUn6f0lqtmaolwK9NC9LNMsNHRUnN+VIPvUFxLcO58h3TfBnq1bVwHUxqWnq7hwf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=zoy5ZLLh; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="zoy5ZLLh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=y1b6HQppxLWXEYQG/mzzRjuSGf9TO9N0vqMhm+H8UvY=; b=zoy5ZLLh9BmbE/V3lUHsRF7Zte
	t6bYy8nc/Kc226QFCVZJp6qh1/NcSo+XglbSoVkY6QhwB4kjti3L7omn//jlu5WU1V6BsalIMt9Pt
	YiYflDyaBt+VCLuI+0X7CiJaAQFztNYIPv5YGRZXWJrPB13/mTl2iKa4dmBvL/0z94Dk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xDTVO-008wUB-T0; Sun, 04 Oct 2026 23:12:22 +0200
Date: Sun, 4 Oct 2026 23:12:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: BG9OXA <bg9oxa@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Message-ID: <596745ab-8f98-4e5b-9105-3215a46780a4@lunn.ch>
References: <20261001-b4-quarkpi-ca2-v5-0-e19296802978@163.com>
 <20261001-b4-quarkpi-ca2-v5-2-e19296802978@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-b4-quarkpi-ca2-v5-2-e19296802978@163.com>

On Thu, Oct 01, 2026 at 11:19:47PM +0800, BG9OXA wrote:
> The QuarkPi-CA2 is an RK3588S based single board computer with LPDDR4X
> RAM, eMMC, microSD, one Gigabit Ethernet port (YT8531 PHY), HDMI 2.1,
> DisplayPort over USB-C, M.2 PCIe 2.0 x1, USB 2.0 and 3.0 host ports,
> an ES8388 audio codec with headphone amplifier, a MIPI CSI camera
> connector, an IR receiver, a PWM controlled fan, ADC keys and a 40-pin
> GPIO header.
> 
> The GbE MAC receives its reference clock from the PHY, and the PHY keeps
> its clock output enabled while the link is down so that the MAC can be
> initialised.
> 
> The MDIO bus is described with separate mdio and mdio-child nodes, and
> the RK3588S RGMII delays are applied on the MAC side (tx_delay).
> 
> Signed-off-by: BG9OXA <bg9oxa@163.com>

I assume BG9OXA is a radio call sign. So it is unique, and nationally
assigned.

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

says it needs to be "a known identity". I've no idea if a call sign
qualifies. Signed-off-by: is considered a legal statement....

> +&gmac1 {
> +	phy-mode = "rgmii-id";
> +	clock_in_out = "input";
> +
> +	snps,reset-gpio = <&gpio0 RK_PD5 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 20000 100000>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1_miim
> +		     &gmac1_tx_bus2
> +		     &gmac1_rx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus
> +		     &gmac1_clkinout>;
> +
> +	phy-handle = <&rgmii_phy1>;
> +	status = "okay";
> +};
> +
> +&mdio1 {
> +	rgmii_phy1: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x1>;
> +
> +		motorcomm,clk-out-frequency-hz = <125000000>;
> +		motorcomm,keep-pll-enabled;
> +	};
> +};

For these two nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
