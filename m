Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FD12F1FDF;
	Thu, 27 Aug 2026 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787831164; cv=none; b=UzfMoURdUTZUlIXXcQbbuXGY6mBW7PBmbjkVH0re5VWqcTDbO3/rqvupbNjRJWLMiQBIvaLbtl1MfTB9hRPIH48D8ld3kfsmAFhUTU71T6J2JdA3qwF2ESuhbt68rokS8gjAgSBVnRdQmJHRe5J8TWm4eg17IKoe+8Z0Yp1KzeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787831164; c=relaxed/simple;
	bh=xgb06MEIf9CJaHsREliGIPBiNySU63RaBPNUvHNa6s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhL/RQcuHrBLU/TY+rZRiVA7sZTydW6CITtqbgYcf9FQMwlm7YIKrO/X/M1hcVq/7j+g1zVK36eLuEVYbu6kiLXNG6+jTeelgS/oGBf0lItM02WnbVTrkGAqWqQf8xbChaP6YkrYA1ZXFRgwt/ouVHMUJrs5960Nh7sAqWALwE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5vc8wrp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5vc8wrp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3620B1F000E9;
	Thu, 27 Aug 2026 11:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787831163;
	bh=3hAFo1rIdC3agJMCmmn/YuX832v7qzt/wzjEOyHEoqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M5vc8wrpHzFOUTNBu00KgjoyXKJr1qmKCRQs0sIzSetk2k3grLN0i5IO6nivL324t
	 RgV7Z7wp4vIfWKwlCbxsG06aykfD+um8TfU4dSuiaeVCMsXKH4AVfwMypUbUL2xIXn
	 6nrXQ5kV21nxhcYAe+k+FzKPopwSONnvdU9N/zTzzM/mgv6AUprA82MJZsMnrnKWPu
	 T06cyHPvR9g4mX396zWHDyzxhu7c1pNX1yiXFC1cvpKQEsSMe5m+zQ3xtQLHIuYI2B
	 H0kx/uEQilZMsSeVxAbatuM/HE7xQnk+qB2+T2as2rSHoIkC4jWRiBbEnRlLVg5B2M
	 ArHH1oU7ZFRXg==
Date: Thu, 27 Aug 2026 13:45:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason Yang <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
Message-ID: <20260827-thundering-cream-saluki-dd05df@quoll>
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
 <20260821-dcphy-rx-v1-v4-1-f1797634233d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821-dcphy-rx-v1-v4-1-f1797634233d@gmail.com>

On Fri, Aug 21, 2026 at 08:02:29PM +0800, Jason Yang wrote:
> A MIPI D-PHY or C-PHY can be a transmitter (DSI) or a receiver (CSI),
> and in some PHY blocks both work at the same time. The existing
> PHY_TYPE_DPHY and PHY_TYPE_CPHY cannot tell whether a consumer wants
> the transmitter or the receiver.

The consumer knows this already, no? Imagine consumer of the phy is some
ISP receiving data over CSI for given port, thus consumer cannot
transmit over that link.

All this seems redundant.

> 
> Add PHY_TYPE_DSI and PHY_TYPE_CSI, so that a binding can select both
> D-PHY or C-PHY and transmitter or receiver. They do not replace
> PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice where a cell
> selects the mode. The first user is the Rockchip RK3588 MIPI DC-PHY
> binding.
> 
> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> Link: https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.com
> Signed-off-by: Jason Yang <jason98166@gmail.com>

Where is any DTS using it? I did a search and no results of upstream
posting.

> ---
>  include/dt-bindings/phy/phy.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
> index 979b5dfd8353..8ee3f88e6d80 100644
> --- a/include/dt-bindings/phy/phy.h
> +++ b/include/dt-bindings/phy/phy.h
> @@ -24,6 +24,8 @@
>  #define PHY_TYPE_CPHY		11
>  #define PHY_TYPE_USXGMII	12
>  #define PHY_TYPE_XAUI		13
> +#define PHY_TYPE_DSI		14
> +#define PHY_TYPE_CSI		15

DSI and CSI does not look like types of PHY...

Best regards,
Krzysztof

