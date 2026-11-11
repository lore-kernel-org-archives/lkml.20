Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794361902;
	b=zen0ufckvXEJLYsyjWqi+U1pRzxzLRoo8BOZ1jsRQNsauSXToQ2fEvtjsuYOF9XBTQyx
	 coHSuHQ/fjfCCmNcz0W2olWRzm+9Zxe3fOKO3Cp5aiBl2caXJ3B7WEJ6ljJ4ZzeURj3ah
	 5bJ44fuJ4ZmwnKP9TIoMRzXNC7Hu8v2LiaykJTBn6h9KUYSL5oyQdSXAdGwi7Y56o+mja
	 MQcs9pxLkI//OuOGqoOCLBKWMDpJB70jY9xbU8jfD1gsO1u0G9OLQdMadcovhHx+Q91Ui
	 lrm+LXOfC+Lcq9TslqXYf59j1Ucy1POqpr1obrLaoiy6k5IiVumHJn6ZsDvzTiLAh4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361902;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=OJWRJnqwXadUVsht/Q2DFEwLV7TOry8KzPZeVNhA4yo=;
	b=faBMLL7+uRiDXgrPlpcq7PzZJriJq6dhsjhN1eSMdDNUsmZXTVptVEuym0cy+Bd/yovJ
	 s9FOBr5O/j5A1T0q26z5M5ARi1PFP+0IIu07GRbI86AqDg8ZOw7bzSTsUSfws23KbG4T5
	 TVHzM7KgfabJHwDmqdDPkhwAxc6/pQyJJjF0gn4Tq8p5YAuTYvjzQIM5kFOH5Z5t8hnmi
	 O6k7/VxNRuUw9EVCp4bR5buTRnKBzfntkPWVFRd+Gaar+TtW4BwRN0zScrA6ZGHX/emjy
	 c4qfWksaGABBHMLZlRLuMMVRK/pEcjmbodj7WDenlvrKfiBKSCcDtgFJHzSmJkj1yIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=mySf9XVQ;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4070606A320;
	Wed, 11 Nov 2026 01:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4070606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=mySf9XVQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OJWRJnqwXadUVsht/Q2DFEwLV7TOry8KzPZeVNhA4yo=; b=mySf9XVQwFmioK8Lp43oGmhZHA
	PkxEtdO4+vINJ69AxBvKVEduIJnYfS1bUcQ8f2rFTNMH45FEyMBww/bgNLceL29jAyC1jKiQimM/O
	eXC49pMGyYtrGwsqi3aoC4HaDpEMGPgjYEffWO9GNmftYwnsrsC5gxN+iurYCpieVpiU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xQxUe-00FcwI-AE; Wed, 11 Nov 2026 02:51:20 +0100
Date: Wed, 11 Nov 2026 02:51:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>, devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
Message-ID: <9e83c1b9-0bfa-4a37-8253-3740dd7d0b62@lunn.ch>
References: <cover.1793705210.git.jackyhuang@nvidia.com>
 <70b7dd4c538ce72a2caf3b4420af3889e9b2dab7.1793705210.git.jackyhuang@nvidia.com>
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
In-Reply-To: <70b7dd4c538ce72a2caf3b4420af3889e9b2dab7.1793705210.git.jackyhuang@nvidia.com>

> +/*
> + * On-board PHY uses RX and TX RGMII internal delays
> + * so phy-mode is rgmii-id
> + */

This comment is not really correct.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287


> +&mac0 {
> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +/* NCSI MAC */
> +&mac2 {
> +	phy-mode = "rmii";
> +	pinctrl-0 = <&pinctrl_rmii3_default>;
> +	pinctrl-names = "default";
> +	use-ncsi;
> +
> +	status = "okay";
> +};
> +
> +/* MDIO for schematic MAC1 PHY */
> +&mdio0 {
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +	};

But these nodes themselves are O.K.

    Andrew
