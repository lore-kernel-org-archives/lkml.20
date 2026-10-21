Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589660;
	b=kZcKbld0TK1KlfQGN1fXLbhHv39iqmJwo2MVnoXKqQlQPw8zx0cX4i79rTS8O5r+2pj5
	 PnPrurnkXbVmBYKE1LyNqdWpOsyVgnLmvdpaZuyBO4ezCRwIkl4F7sAIXPli00B4xktbQ
	 bmJ+3HxJWNhO2sHaI1YWiS7JoM26sIMDmRlDRQUy40ngylyVKqZcrsUMOTRL8BRhL8kcj
	 qNFoY8eCNk97veC29abdccpI4zq+c8hsNyvAwFfzugUlK5U8WMzGl5mhoGWdnfwoK8jtn
	 t/H+s8a9CJCIgA7A6Gb5hKTbSf48vjJqRlwMn9XOSTdeB9BoOanM8kXeq+Fba/Zx6eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589660;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sF6DsPZwEfTAUnK9ZZCxg7q+OblzpYg/pKGicRqUkBU=;
	b=ILFdIMZ26/iKfmoAr9odg9x6D0eujcoEXWlWTKUvjLYn7EQavbUuDeP2P1zbtZcfIjbj
	 Ahak8x4V/BIxu+/vUZ47h4v1cQxQaAgmXd40qrysHS4MZfNd0SZQuQy4LRHHd9LisrRzx
	 lGtgj+mOVCDRJjrmMJc6bf1QJ3x0kNOwIpmzHbka/l9Mdzlw8hPKjdrmFbTvHwcsu/wFB
	 fmk691vzWjnQS2yHXGkSMLD/9M5ZSxHLjgv6iOtX63IaX1JSkfFQtt/qEge6D5DcBLtQT
	 rSogCPU3vSolowVtj3HjGlH6NB/M3FjNttV06aDfbu+COBCZB98Ikck0HViqb+UwDSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vl6o6SXK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36DB606A31A;
	Wed, 21 Oct 2026 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vl6o6SXK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FEC1F000C4;
	Wed, 21 Oct 2026 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792589659;
	bh=sF6DsPZwEfTAUnK9ZZCxg7q+OblzpYg/pKGicRqUkBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vl6o6SXKiIbV/CqnvA/a2XkS0NAjGDw0y/kcFsI8P5diKF2Zu43NtD3WXZpTBhWaK
	 5zGVHdyOxCOJavy+OKH8wXUGUD7Cb61xGY8DKTeeCvc1wFVxDy19Q5fIgGE6+LsE7S
	 jl+zIbXJ2RXCSZPNwUWyA9c2ELG2zxlgs4A6/XgQLdI/SzDNcPErduA1MehK+PDpSd
	 DiL5j8EiVNDAGYYjg9ItFAHP+y5Zvd42w+lNtrNajzkmiQVXXqw2Lx4C8S8PvAXZ7T
	 Dg1Qv8Q5jnF9/4WjfmJxfBdxBiHw+8A5zNnsrH+emuE73UhGLZzOG7zUOBfVQdgdHk
	 2AEydevOYwHuA==
Date: Wed, 21 Oct 2026 08:34:18 -0500
From: Rob Herring <robh@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 2/6] dt-bindings: phy: Add rockchip,rk3568-edp-phy
Message-ID: <20261021133418.GA3889663-robh@kernel.org>
References: <20261020030916.3223833-1-damon.ding@rock-chips.com>
 <20261020030916.3223833-3-damon.ding@rock-chips.com>
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
In-Reply-To: <20261020030916.3223833-3-damon.ding@rock-chips.com>

On Tue, Oct 20, 2026 at 11:09:12AM +0800, Damon Ding wrote:
> Document the eDP transmitter PHY with NaNeng IP block found on the
> RK3568 SoC.  The PHY is controlled through the eDP PHY GRF registers,
> so its node is modeled as a child of the eDP PHY GRF syscon.  Also
> add the "rockchip,rk3568-edp-phy-grf" compatible and the "edp-phy"
> child node reference to the Rockchip GRF schema.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../bindings/phy/rockchip,rk3568-edp-phy.yaml | 59 +++++++++++++++++++
>  .../devicetree/bindings/soc/rockchip/grf.yaml | 15 +++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
> new file mode 100644
> index 000000000000..afe7bc3d839e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/rockchip,rk3568-edp-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip eDP Transmitter PHY with NaNeng IP block
> +
> +maintainers:
> +  - Damon Ding <damon.ding@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description:
> +  On the RK3568 SoC the eDP PHY is controlled through the eDP PHY GRF
> +  registers, therefore the PHY node is expected to be a child of the
> +  eDP PHY GRF syscon node.

From the driver, looks like there is a specific register range for the 
phy regs in the GRF, so please add a 'reg' entry (and 'ranges' in the 
parent).

Rob
