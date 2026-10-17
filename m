Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269C8321445;
	Sat, 17 Oct 2026 17:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257582; cv=none; b=X06idRW1UXbgZXdyRzr+xXRWGHW40V7yikbkPg3W4BUBzoOd/ALTo3hpa4OaFzi26/5FlKTI1SWv/cjE9DYTPxYFXiEu/OI8L429DFDKAyEvkgJmFAaf2aZ6VMTcifZfRWwlxbkRC/ECeLxnI7lHM5ePt6p5wBlcKQNunngG3vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257582; c=relaxed/simple;
	bh=T/Kf1ZN19glKViF79bVJO9FhqRByhNmYFu0URsmulX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6bHzh1EBMFEFwZuCc3uSjE2UoFNaa8cTuYuFJ1U6p9VNVhZi8paIpnEXW2wHOhiUGFsSo0bP8nVxggH9U1Hn06TSjuHCsv8o7y0qlnpcfy1CyqUuIMzZwGD4Lao+DqG2jYlVLC5Zm4AYgbE17NwGJa22GD5IuRLay49K9q44PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k5O4fjFj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k5O4fjFj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264491F000C4;
	Sat, 17 Oct 2026 17:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792257580;
	bh=ayiCzJ9mh5aEKRmauP0yiNYAQNzqiIVzTfcWMMwTXlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k5O4fjFjOoyRHm8BCYYj6yuu+yDtZzt0GJ3pWiMYJ7HHa7xq1GV82Pj2FecYEPgqs
	 ZrfTu1l/QlG3hBUL1ljWKEuMbCKco0so9ARMuNSW9p9DFl7TY5sLxB6AiAFIFoUdFr
	 6Xh8/nheoaB3BpXQIrro8MCa/4oHHwJAswxAIVIi+07JJbxSv3Xf11BVxvNGJBF1qn
	 ilYibFaKQwOKr4esEkPdeGUqO94CC5jueShR67qlnnor7/mkuF2JvQxyvKA8ek8yYC
	 OXxzfiW8plOf/yR2OXiZQcNk42yu+TkuOEUXbUfsQxDeQ1+hckn9js0SNxt522poea
	 hbyAPOD70+feQ==
Date: Sat, 17 Oct 2026 19:19:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason Yang <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Guochun Huang <hero.huang@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Riesch <michael.riesch@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/8] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
Message-ID: <20261017-lean-dalmatian-from-betelgeuse-e2a12f@quoll>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-1-e63b49eabe2d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016-dcphy-rx-v1-v5-1-e63b49eabe2d@gmail.com>

On Fri, Oct 16, 2026 at 04:56:35PM +0800, Jason Yang wrote:
> A MIPI D-PHY or C-PHY can be a transmitter or a receiver. Some PHY
> blocks have one of each and can use them at the same time, so one PHY
> node offers two PHYs. The existing cell, PHY_TYPE_DPHY or
> PHY_TYPE_CPHY, selects the mode of the whole block, not one of the two
> PHYs.
> 
> Add PHY_DIRECTION_TX and PHY_DIRECTION_RX for a cell that selects the
> transmitter or the receiver. The first user is the Rockchip RK3588 MIPI
> DC-PHY, where the transmitter serves a DSI host and the receiver a CSI-2
> host.
> 
> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> Link: https://lore.kernel.org/r/7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> ---
>  include/dt-bindings/phy/phy.h | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

