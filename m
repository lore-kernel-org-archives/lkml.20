Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336638;
	b=ShuKGj8nPnerCmSoGIv3tKNpH6hX+W9D7ZnSdLjB+aLHpbNyJdLVFyYeLkmZPFGe5Lhs
	 T/CeS6W0QJbprFrGfYIn9spuKT2c0G/Jpq5QWA7pzWaG+mLytChME5A9cN9k3YeYLqeXp
	 jxFBRS/2QbvO1V82DrXOA0MKoTJDE2te+O/EpodoTHf9NXOjHnppMlxrponu+p3uTSDyb
	 9g7wtUvgoHb+WgunovuEiFdbIZ8p2mqiiscCWAiUV66AUduxXaN1LTWUeNjNrN1eURRUQ
	 0uFL/L3qDG6Zg8gwKFQzibBOyJgiiPOv5XZmVbho9U7vnM0uzg5yYpfZd8ogxtpy01w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336638;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nVBZoi6/3BeA1E/nAUsBY+mM3R71b9Lch9KwKeBie0g=;
	b=k17WjBse6NdRbdgTh9CH+2UCi61oFZ1pspNar7iwN+aVZssrQBLBqFaS5kpKS8Fv9D5T
	 06uPvV0Sx2BEEg2FFbARUO/BJirvFCOSfj69+WVoPSQf2PwKKGhAgiCe1mxZ5EEou6Ayb
	 xYm8mHYaKR3ZpMq1RExXG07OGh1zLKCFEUIJNnIdJFLQIZhnLODoZik3s3unS4Dv7E8P8
	 snXbROzxrfjOUQFBi+S6XcxpZUa9wT8sIbUo60FOh0hHkI3DWIo9PHPDhugPTJmA1sw4a
	 pL40LtdZYaUhHhJfMGW8SQlhYyAcXN3bVW93Inn5X0qPqAmISc+RYrsVTYhlkciqlVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kx2ZaO3z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8F6606A33B;
	Tue, 10 Nov 2026 18:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kx2ZaO3z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566731F008A2;
	Tue, 10 Nov 2026 18:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794336637;
	bh=nVBZoi6/3BeA1E/nAUsBY+mM3R71b9Lch9KwKeBie0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kx2ZaO3znvu4YvmU84JU+Iyq4xCs5EF+0qqxwsv7Row54evB55RJqH6zZjZ2YTzQ+
	 KH6d3TrAUB73sCg7Q4T8ypXYbrkMJ+f7ztTRCFp7X1Ta5vIntCe6skoAzfj1B/aNst
	 XvaFfDfIz59yeRWjUCmhwHiJa8ugLfELWt6zQuawcKMqTkbJZnBIaDbriM8t/kINrw
	 VNbS+DBr7usofeo/G9oKuoz5YkNWqwUOJ0KUAyTNIZKZIyV8m8Qp7xFy+bHtMetLOC
	 EZjZd1GYO25xuVcTjsbN28QUu2N6kI0ISNCbTTLxHSEa0ajGl9mwxkTRvGZO7e3GM0
	 IWu6/RQKO9MaQ==
Date: Tue, 10 Nov 2026 12:50:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-rockchip@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-phy@lists.infradead.org, Dave Jones <s.dave.jones@gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: Add rockchip,rk3568-edp-phy
Message-ID: <179433663384.1318226.574453120666617957.robh@kernel.org>
References: <20261110074533.4052196-1-damon.ding@rock-chips.com>
 <20261110074533.4052196-2-damon.ding@rock-chips.com>
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
In-Reply-To: <20261110074533.4052196-2-damon.ding@rock-chips.com>


On Tue, 10 Nov 2026 15:45:31 +0800, Damon Ding wrote:
> Document the eDP transmitter PHY with Naneng IP block found on the
> RK3568 SoC. The PHY has its own register window inside the eDP PHY GRF,
> so its node is modeled as a child of the eDP PHY GRF syscon with a reg
> property describing that window.
> 
> Also add the "rockchip,rk3568-edp-phy-grf" compatible with its own
> binding schema, so the shared Rockchip GRF schema is not extended with
> per-device conditionals.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v4:
> - Add the reg entry for the PHY node and the ranges/#address-cells/
>   #size-cells for the parent syscon node.
> 
> Changes in v5:
> - Move the APB clock (PCLK_EDPPHY_GRF) from the parent syscon node to
>   the PHY node, matching the updated driver.
> - Split the "rockchip,rk3568-edp-phy-grf" syscon node to its own
>   binding schema, instead of extending the shared Rockchip GRF schema.
> - Rename the reference clock to "ref".
> - Drop the example from the PHY binding schema, as complete MFD
>   examples belong in the GRF binding schema.
> ---
>  .../bindings/phy/rockchip,rk3568-edp-phy.yaml | 46 +++++++++++
>  .../rockchip/rockchip,rk3568-edp-phy-grf.yaml | 80 +++++++++++++++++++
>  2 files changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/rockchip/rockchip,rk3568-edp-phy-grf.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

