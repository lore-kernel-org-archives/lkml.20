Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D2C3AEF3F;
	Sat, 17 Oct 2026 17:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257776; cv=none; b=T167NMa3+qniJAfcnP5CKXwDYmGYq0uoX8wrwng+GqHHqG2Fl+t8jyTo/MwG3WsWn41IfOrFUReGUel6FIBME20LPAkEOXFA3TnTKZhoZsxP1HAbs27M5xpN6u1oa/20ZAAJJMyDOMu6N4BMXYF/KRRR2PasyB/xkBxxTycknwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257776; c=relaxed/simple;
	bh=zahwIBZ7DCV+LIt1WLL0m5DEJjgyJ4gGxuuyFcTc8sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LopaW/cL6mYx7sf56IEoLCj3FwYJZST3Etat2730AKYDaviC9RDWxM3seeRBZQZlxnGmYY8SJoPqYoRcgJChqSFYIdAU6QhK/17samx9yq2OJdcoxa2vvRgaMm1lzQxAKcxivhdMmn7dgh5vb2LnPRHSDVOnkg16IsnsyG2CKdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nR8OzMr9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nR8OzMr9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13151F000C6;
	Sat, 17 Oct 2026 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792257775;
	bh=+KzFzxYaDpiw3v2cN1wsy4A4fK7ubLLV9aUEhhmv9Kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nR8OzMr9ja/piPNdLePtX45279Zm/W8WgW597xg8U+B2nad5YzQnDYRVKbtdBQAn4
	 T8ddc5IcuhUwebCEHtCsQm30HyPt+m8W73nWWwCLAbU0JmNo24pyX5HE/v5d549VDn
	 FbPaa1mnmVpcszeQBq9qZhZnlJtZmI5HfwXSduugtiGULIT/j5qhK75TVMPFY0u7/b
	 QPC7dh0dAbwHaOXU8R63Som1r2qwDiC6g8h3aWeykTqZwZOM2dSdVLzVoFqODeUuK7
	 bsl0IM8mWb1tsA+xKtZBcrN8MJIvsBwKwOBbDld/dYWmu/b3UpSovI5P835GTyZvkd
	 CZ5GuRox3ufuw==
Date: Sat, 17 Oct 2026 19:22:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
Message-ID: <20261017-gainful-goldfish-of-climate-bef863@quoll>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com>
 <20261016140115.GA1798470-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016140115.GA1798470-robh@kernel.org>

On Fri, Oct 16, 2026 at 09:01:15AM -0500, Rob Herring wrote:
> On Fri, Oct 16, 2026 at 04:56:36PM +0800, Jason Yang wrote:
> > The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
> > for DSI and a receiver for CSI-2, and two consumers can use them at the
> > same time. The single cell of this binding selects the mode and refers
> > to the transmitter, so the receiver cannot be described.
> > 
> > Allow a second cell that selects the transmitter or the receiver. With
> > D-PHY:
> > 
> > 	/* the MIPI DSI host, driving the transmitter */
> > 	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_TX>;
> > 
> > 	/* the MIPI CSI-2 host, driving the receiver */
> > 	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_RX>;
> > 
> > and with C-PHY:
> > 
> > 	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_TX>;
> > 	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_RX>;
> > 
> > The transmitter and the receiver cannot operate in different modes [1],
> > so the first cell must match in both consumers.
> > 
> > Two cells describe the receiver as well. A single cell keeps referring
> > to the transmitter, so existing device trees are unaffected.
> > 
> > [1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
> >     operate in the same PHY mode."
> 
> The problem here is this is an ABI break. An existing OS will not know 
> what to do with 2 cells. Perhaps adding flags to the upper bits of the 
> existing cell would work.

Existing OS should ignore surplus cell if the driver is coded properly.
Same as adding new properties or new front-compatible.  The question is
how the existing driver behaves?

Best regards,
Krzysztof

