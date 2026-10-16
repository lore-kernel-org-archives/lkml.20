Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC1337E5D9;
	Fri, 16 Oct 2026 14:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159277; cv=none; b=Vk8RvUonzi0HkMQAdBzfVz4VPWGseeRzFetcYAFYpYL7PcYmDcEpx4TZs+NqsD1gDkkVXcAs1inYLPHnatW7Gco1kyalOD0+3SwsER6/Rjd8aHLDnWhS0p/X/su49SC34t9JWoMX4yRkpqt5E3daESq7WG3OPgIju55KBKLAhyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159277; c=relaxed/simple;
	bh=viXaTih9Z0Pr9/NCQaLyjxzbebUIIqMsvwdk1stm+Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F02ro3n5/S1cRYb/GLN7bEYjvRDVqdE8bZNzGYsHfeWrQ8bFljpFAapvlUF/I3YuB8fOGqphhxYJZeHafEfaKxR2zBbGM7ilvaCCy+DQZieniX6ZwgZS9lThhL2t0lqGZD7oSD542+DOYSUgVX991oT8lsD1VrcQTqx33BGs3iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZkt9gnO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZkt9gnO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F121F000C4;
	Fri, 16 Oct 2026 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792159276;
	bh=MXys7ckdfZsaSqIv9WG3c/zyDXcn3l1gqjz0lpcesqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HZkt9gnOetdK3cwJqZfyf/TaDWY69f6OurRre/WUGRspavzKJHxiM/DA5SgOexPGZ
	 QRM4nwBBkDe3HPz4PednxZVmccKXPcMmcWatazO0SKDJDa37pAdak66NbQF9qef0Gp
	 yAYJXMbhivsxdxsLds6zAp+mpjn3GRmPgcnNO5gac331CmQc+6oawJiflBx2SB0HE+
	 1plY9j94/R430Bpu1i86kczeeRrqHuWJ2xQgnmN9rq8jxFkZn/kV/q4FI4QhnA2E0j
	 HpTDYraqKa0RFdHemRUoFCYHwKgOrMevxLyB4fhP03tZTli8/Hpvv6p27NSZwNkyZv
	 Pj6kQhag62uWg==
Date: Fri, 16 Oct 2026 09:01:15 -0500
From: Rob Herring <robh@kernel.org>
To: Jason Yang <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Guochun Huang <hero.huang@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Riesch <michael.riesch@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
Message-ID: <20261016140115.GA1798470-robh@kernel.org>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com>

On Fri, Oct 16, 2026 at 04:56:36PM +0800, Jason Yang wrote:
> The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
> for DSI and a receiver for CSI-2, and two consumers can use them at the
> same time. The single cell of this binding selects the mode and refers
> to the transmitter, so the receiver cannot be described.
> 
> Allow a second cell that selects the transmitter or the receiver. With
> D-PHY:
> 
> 	/* the MIPI DSI host, driving the transmitter */
> 	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_TX>;
> 
> 	/* the MIPI CSI-2 host, driving the receiver */
> 	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_RX>;
> 
> and with C-PHY:
> 
> 	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_TX>;
> 	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_RX>;
> 
> The transmitter and the receiver cannot operate in different modes [1],
> so the first cell must match in both consumers.
> 
> Two cells describe the receiver as well. A single cell keeps referring
> to the transmitter, so existing device trees are unaffected.
> 
> [1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
>     operate in the same PHY mode."

The problem here is this is an ABI break. An existing OS will not know 
what to do with 2 cells. Perhaps adding flags to the upper bits of the 
existing cell would work.

Rob
