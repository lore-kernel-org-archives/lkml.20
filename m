Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402414;
	b=GQlMlhfiZr2RV5bGGVkL0c9KyAoFNN4bVu7ARhIQ8+QfNSyCFq7EIELbHQ2Jh831/4eF
	 KX6QB00xWIFvI63y/+aQJ+0R2mOPMk7iXGqBgl47jucnPUVTmb9b7jm1QXi/DesMInS4S
	 CpkFZzn4lK6bMl4MnMW1LK43a0qIRYslFjLLVeZuBl5+LTm2BMm3c+piM9ndD1P/Jq4Kw
	 AD6xm0tz+9DjwUGw2M/ryCg6SQIOHSovPUhbGZvOyWbqP6reAVqoKAtntiyggoXP/BTDl
	 UhSR1RFBCkJ9cSQZqXoyiTLpABHevGbfVb6xnpsDR3tnT8v2nWkUqkf1H9V2GMhrrQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402414;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=TsavWsjShJJGBgdbg3MCd30tYdrc0p8AQysSwTzBos8=;
	b=RVpeCp41DXBvQlDNXX7sSiXYW3gF5wWpDQTSFwzI4PZlskZUxm1w69BSYyCraUDV1oMQ
	 rI9HKKpK53hVOEHA0+OvfgxOh4dxuWylVN8grPTiG0o6N0ULUg4xA1MzZRDS9RDkhQIaM
	 kM7AyA3HJ2FDgZtLgBax+XVLPXPB3qCUFcYaGO4gCLtOjt77YMI+tXGJ5CJG3hD0qWbIF
	 2utwn4KX27Br+gkE04rhe3iDwroArOPPkHiqsv/vT2pwS1qXXEoKG1JVhSo4fg95Gbrcg
	 gaO0G3R9OYrFnUKT1ipGv2tNunINA+CNItf2s/XaRlvdHxOpja3ZOLD+4NLJES99vjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=WuCc8pdz;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BED606A31C;
	Wed, 11 Nov 2026 13:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4BED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=WuCc8pdz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TsavWsjShJJGBgdbg3MCd30tYdrc0p8AQysSwTzBos8=; b=WuCc8pdzkGjLD1lqWBww+P9lpe
	devYGnPLiUvLgvjOBXhkamuh6TbLj9i/vU5SQiNA/6iZMVgtNBDUQ4dN1puyzBWlwCWrbaNnZ5NeL
	XyDluwEU43rO/gt6EKbFAw8gV1UXaJTX0MnLHiemGEDoI0MVSwO05e4LLa9sp9Pvd06w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xR82J-00FkQI-On; Wed, 11 Nov 2026 14:06:47 +0100
Date: Wed, 11 Nov 2026 14:06:47 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: aiyengar1990@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: rockchip: use rgmii-id for the Orange
 Pi 5/5B ethernet PHY
Message-ID: <fdb7836a-67f9-4db0-8820-d72f56beca3f@lunn.ch>
References: <20261111-opi5-dts-v2-0-821f666418a6@gmail.com>
 <20261111-opi5-dts-v2-1-821f666418a6@gmail.com>
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
In-Reply-To: <20261111-opi5-dts-v2-1-821f666418a6@gmail.com>

On Wed, Nov 11, 2026 at 07:19:49AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> The Orange Pi 5 and 5B have a Motorcomm YT8531C RGMII PHY on gmac1
> (the PHY driver binds as "YT8531 Gigabit Ethernet"). The board neither
> uses extra long clock traces for TX nor for RX, yet the device tree
> describes it as "rgmii-rxid", which according to ethernet-controller.yaml
> means that the PCB provides the TX delay, and then makes the MAC insert
> the TX delay with tx_delay = <0x42>. The setting was copied from the
> vendor kernel, which uses the MAC delay lines everywhere.
> 
> Describe the PCB correctly as "rgmii-id" and drop tx_delay, so that the
> MAC adds no delay and the PHY adds both: motorcomm.c programs its
> default 1950 ps for RX (as now) and for TX. This is the setup the
> binding recommends, and the one the same vendor's Orange Pi CM5
> (rk3588s-orangepi-cm5-base.dts), with a YT8531C on gmac1 of the same
> SoC, already uses in mainline.
> 
> Besides being the correct description, this removes the MAC from the
> timing path for both directions, so no board-specific delay-line value
> is needed any more.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
