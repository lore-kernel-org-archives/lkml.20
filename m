Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333730;
	b=bvgfe8wCmueaiz1FHOLVq+jiMzep/VY1IRccYw36KiDuvZk3dS6z99GsdFL1pJzIRxkB
	 zUqu22TT9eGTXBff43tZN8a47f59DYD7y3d43ts+2PGxfCjTdq8GbVhoe1GyPhySvY2bi
	 kGnHCeC9uwnfbO6qcGWHXpWSxfywb0tMBnfTFwOXQjF1iJhOEAyHVkn5wI+eDFgSpCA7x
	 BYvUlns+iQaCqpV3cMRg9n3yvFiK/k3vc8gVKWVzbfwaC5bSVuN633Ec3spgJXQkrGE+x
	 DAzNlMkLMDDHVtr6zYQ2lRyIexkKf6fw3voy9eCtjvikITbY2arBTDUi8Tj2MZA4RZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333730;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=y6fbqcobCahuBm1XBPjTDEf+ag8w3TcHGc1/4po/nHM=;
	b=NHLEIOJLM33SnljdiJBurqsejp0ctSum/tbG19EzPho4wshZ8RFce5rAaxPKIYfNqLl4
	 y24wV8s1fBnj9uNp8wDVp9x5FH1jVYJn/XqJCmsqdwaZzbb49/T8Zx8+r+qZLGrQR4rSE
	 QvqzdcChbRsbOqFMMZr96y0nrVa3bGs2C+03ycM8SG7XnEIYZ1t6Qq4fPAk515EMgcAIY
	 PlUXCx1iC0WhQhnIiDwHJO69Gzwsot32/9UVF9mICHgCaqOtTgOU7Rkm8Q/Rp/FgRZuiY
	 Rj0SgQbYD4pU5CrVS3ao8DDe/5GG47MUyrNp9HzGRf513PKVroXHDFxJ0u3SBFNFXBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmwvKXdM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A22606A323;
	Tue, 10 Nov 2026 18:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmwvKXdM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84F41F008BD;
	Tue, 10 Nov 2026 18:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794333729;
	bh=y6fbqcobCahuBm1XBPjTDEf+ag8w3TcHGc1/4po/nHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JmwvKXdMQq2NZIpNHAlm7z7TzpeSQ5L2ONEUAW9u641hXSuo0FN1b3QEqSW0N0Ud2
	 Z1JFdfZ2ynyqLUSM0BsThP0LpHl3q9jrnUHWPGLN8N31rCaeJy3g+/BaN1TGnIMHVT
	 WWX/IAs3fFqBac3F5kIGGrdlwz3yO05wr0WJHNWjTbfXB06/wkNCWrag5WJ30ufIUE
	 L68y4NKtYnp0p2LgjchURDzV5PZ28mCQkz655wPbIb8xoGGPVqN2b2RybGAwc8eIaW
	 QUKqJeiD+/WyN8r8WGaq9jApWSW3nPDiUv+yqYJxe5/rhcNji15ZwCC/tAontg/Ba2
	 /QuovHZVxxxsQ==
Date: Tue, 10 Nov 2026 12:02:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jason Yang <jason98166@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Guochun Huang <hero.huang@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v6 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Select TX or RX, add phy-type
Message-ID: <179433372468.928467.11546944638798684027.robh@kernel.org>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-2-d681ba20b36a@gmail.com>
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
In-Reply-To: <20261110-dcphy-rx-v1-v6-2-d681ba20b36a@gmail.com>


On Tue, 10 Nov 2026 16:18:05 +0800, Jason Yang wrote:
> The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
> for DSI and a receiver for CSI-2, and the DSI host and the CSI-2 host
> can use the transmitter and the receiver at the same time. The single
> cell of this binding selects the mode and refers to the transmitter, so
> the receiver cannot be described.
> 
> Change the cell to select the transmitter or the receiver. The
> transmitter and the receiver cannot operate in different modes [1], so
> the optional phy-type property of the PHY node sets the mode for the
> whole block, D-PHY by default:
> 
> 	/* the MIPI DSI host, driving the transmitter */
> 	phys = <&mipidcphy0 PHY_DIRECTION_TX>;
> 
> 	/* the MIPI CSI-2 host, driving the receiver */
> 	phys = <&mipidcphy0 PHY_DIRECTION_RX>;
> 
> For C-PHY the consumers stay the same and the PHY node gets:
> 
> 	phy-type = <PHY_TYPE_CPHY>;
> 
> Existing DTs on a newer kernel: PHY_TYPE_DPHY and PHY_TYPE_CPHY remain
> valid as deprecated values. They select the transmitter and imply
> phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY> respectively, so nothing
> changes for them.
> 
> New DTs on an older kernel: an ABI break. The older kernel ignores
> phy-type and takes any cell value as the mode of the block. A DSI node
> with PHY_DIRECTION_TX therefore gets no display, and a CSI-2 node with
> PHY_DIRECTION_RX gets no camera.
> 
> [1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
>     operate in the same PHY mode."
> 
> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> Link: https://lore.kernel.org/r/94d47cab-10c6-4ec3-84a0-3bddc9d67f5f@collabora.com
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> ---
>  .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml       | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

