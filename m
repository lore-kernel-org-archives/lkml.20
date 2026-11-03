Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704838;
	b=COHozSSZHb4DU0gGAjreh5oAoHdsHKCK29K6IEtjGT8CSlNZci0D3qr7vz7hHWOErjPr
	 iiUfN9WBHNi3dxMRb0Es2h3KZm4ZDUxzqmbcp8/RURVWlftrEGaY24wUeI7cTz7ovMXUP
	 wnX7a+lPu9OUHKGcyHqMDbvy1fTHYk//OScdn8PvlCmP5DTLkSi7ZHZ1DVi0Tw6F/1NG3
	 vz39it9Ogmd8teiKlyyC/49+VhWy5IXdZenRMiHPj3bqJhuogH06BRR1rxxgV5WuKAPUR
	 9aDZ6p4+kRUPBpL0O/u+lgfS05U7GEntzMbzlyvaomd3N9Knm89nizXyikSwxdeCPSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704838;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=df/ka3hamgjaUKhfYAOsJion0F8Ab0yDBy9+7Z4ounQ=;
	b=SGcim+OC2LcBIg1MODgf+qx7LE46gMaDf8epnvSYOm6eP0hieLgvjFtNEyaEme2AadG8
	 kKnQNkq+/fPSSroqHkz55AQGx0iIqmdetrbluBNZNz1puUyU4YIwwkCyFY3izT3aEAaY0
	 EKoYtbNio2gC1FOuB3ol6BK0uPyw1gpqdLaR8acVdm57ken87k8ArQMl15bT49Z7YiRM9
	 a3NZpc2ixIDFlsTWkARVWOwitMHFw0TwABKDMvSXukVGePjAQ57mVGLvBQF4LEDXlEUi0
	 MWsqqE/Z2MzSnPee7vElucppV0WXLUYhUp9y7oSWUO0nz8/KWIdA+vwuoa0fZFdIecA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cvduDDQZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E928C606A326;
	Tue,  3 Nov 2026 11:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cvduDDQZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065261F000C1;
	Tue,  3 Nov 2026 11:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793704837;
	bh=df/ka3hamgjaUKhfYAOsJion0F8Ab0yDBy9+7Z4ounQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cvduDDQZxZyJF2Qq6ztVTvOYgBgFer+hK8Q1ozeHu+XgPCP7Qz9v/n+tCUawdiICv
	 6wSEfHFtkTTloMAjZT9Ec3j31MhEh1me0gnfj+qPlIo+MbXFsmpuzMWIObstYnzgDg
	 MoTveK7XZtMkiPJbkI1Oth2WISYHsZJbKlFAwLMhVBkel52bO621CBpiuL/sd6IEGh
	 AvFGOQtuZicVtsdhTSmN2uAjqz+Jgeadqt0bS/wIX9yBVtS5z7CJ6hWxjXQtTqiNxp
	 ztNjJaEt93BPCWFhAHOmHm0GAWhWdCxrmGYQL8gVCSvym4Yg/H7nUIdgqkoaxT+ClP
	 zGxO241skswPQ==
Date: Tue, 3 Nov 2026 12:20:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Dave Jones <s.dave.jones@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 2/6] dt-bindings: phy: Add rockchip,rk3568-edp-phy
Message-ID: <20261103-lemon-guillemot-of-economy-eefbbd@quoll>
References: <20261030064905.2248999-1-damon.ding@rock-chips.com>
 <20261030064905.2248999-3-damon.ding@rock-chips.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030064905.2248999-3-damon.ding@rock-chips.com>

On Fri, Oct 30, 2026 at 02:49:01PM +0800, Damon Ding wrote:
> Document the eDP transmitter PHY with NaNeng IP block found on the
> RK3568 SoC.  The PHY has its own register window inside the eDP PHY
> GRF, so its node is modeled as a child of the eDP PHY GRF syscon with
> a reg property describing that window.  Also add the
> "rockchip,rk3568-edp-phy-grf" compatible and the phy node reference to
> the Rockchip GRF schema.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v4:
> - Add the reg entry for the PHY node and the ranges/#address-cells/
>   #size-cells for the parent syscon node.
> ---
>  .../bindings/phy/rockchip,rk3568-edp-phy.yaml | 68 +++++++++++++++++++
>  .../devicetree/bindings/soc/rockchip/grf.yaml | 20 ++++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
> new file mode 100644
> index 000000000000..b78da00ffefd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
> @@ -0,0 +1,68 @@
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
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3568-edp-phy
> +
> +  reg:
> +    maxItems: 1
> +    description: PHY registers within the eDP PHY GRF.
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: refclk

Just "ref"

> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3568-cru.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      edp_phy_grf: syscon@fdcb0000 {
> +        compatible = "rockchip,rk3568-edp-phy-grf", "syscon", "simple-mfd";

This is beyond the scope of this binding. Drop entire node.

> +        reg = <0x0 0xfdcb0000 0x0 0x8000>;
> +        clocks = <&cru PCLK_EDPPHY_GRF>;
> +        ranges = <0x0 0x0 0xfdcb0000 0x100>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        edp_phy: phy@0 {
> +          compatible = "rockchip,rk3568-edp-phy";
> +          reg = <0x0 0x100>;
> +          clocks = <&pmucru XIN_OSC0_EDPPHY_G>;
> +          clock-names = "refclk";
> +          #phy-cells = <0>;
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> index 7bcb4e2f47ec..c089bd014003 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -93,6 +93,7 @@ properties:
>                - rockchip,rk3399-grf
>                - rockchip,rk3399-pmugrf
>                - rockchip,rk3562-pmu-grf
> +              - rockchip,rk3568-edp-phy-grf
>                - rockchip,rk3568-grf
>                - rockchip,rk3568-pmugrf
>                - rockchip,rk3576-ioc-grf
> @@ -119,6 +120,8 @@ properties:
>    "#size-cells":
>      const: 1
>  
> +  ranges: true
> +
>  required:
>    - compatible
>    - reg
> @@ -156,6 +159,22 @@ allOf:
>            $ref: /schemas/phy/rockchip,rk3288-dp-phy.yaml#
>            unevaluatedProperties: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3568-edp-phy-grf
> +
> +    then:
> +      required:
> +        - "#address-cells"
> +        - "#size-cells"
> +      patternProperties:
> +        "^phy@[0-9a-f]+$":
> +          type: object
> +          $ref: /schemas/phy/rockchip,rk3568-edp-phy.yaml#
> +          unevaluatedProperties: false

Properties should be defined in top level. Here you only narrow them.

This binding is getting close to unreadable/unmaintainable. Split new
devices with children to their own binding.

Best regards,
Krzysztof

