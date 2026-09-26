Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56183BCD3D;
	Sat, 26 Sep 2026 14:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432916; cv=none; b=N+lum4fpoIUDPauejY3UU+2Nro8GouRd4Q947aWV7gl47I1HO72xNBOkHTimgWJUjwHTpuGL1q3w5/uRNaHliIq/+wIHMVrhP7Rad/3AU9oQdecA5RAc9HJulzZBFI3wzWCC7z8vKQqcAxafsfwv5EebRAs11tiEmqqYlrbQGHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432916; c=relaxed/simple;
	bh=8xdX0rHz74wq3kSJ194aJzQw2yw0HA/pZj/UE1y2e7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkQ9Rgtw1HJCRMW0uipzdlcZqeHamE4Svb6/DdTcVp0QnmEw9PQEuDjXyC9/pzgKVXiDZhCqPFFmhO8pHaOWYYuSwaQrdhZbV20u6Oc07cLGRjkCNKs2fFbtiHAXor0OnrL2Uq2TcWCyy3M5ccKfY5sfGiDsNYyd57HTLNJPLlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBtdPr31; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBtdPr31"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD98A1F000FF;
	Sat, 26 Sep 2026 14:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790432914;
	bh=GrtPLSHuGFunnRTeKC4/1IN66fdE0NzWWL3U7Y3AHv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aBtdPr31z/4GcOnJrdt3AhE2XxsFsQyD7QXH+VW6d6xyIfsz+DlsLlMqtxRYXUtCW
	 YF6nXiDf2SY5uUdHmLvtbMoi99zYMBCuuJlS7Sq6kOzTVWiYejOtPIW5QAbTepVnnY
	 bSV1wy+HkDjJpUMwjiHqAnGDfpRbKzNqhMAZ3+3IiegN32oXLJh5EZw3uIluodP5cE
	 9mPYUYKe+7WYsir25v17JCGAQ10geajRqfdmzqhX7m2Y8oCUonD4lSWm8q72HTHIji
	 t/mv2DLMA9ZlgVjRQ6qfe0hhgGYvf9qwkbEy5p5QW06W0y/CGQ9q+rKcVaWvDSckgd
	 TUV2YCHZ7Yhmg==
Date: Sat, 26 Sep 2026 16:28:15 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v11 1/3] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
Message-ID: <n73mmftx3ur7uw7yybztl2z2z2u6qgoec6mpplp55vbb6mt2fk@ps2grf5tsvpr>
References: <20260724184523.193661-1-ansuelsmth@gmail.com>
 <20260724184523.193661-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724184523.193661-2-ansuelsmth@gmail.com>

On Fri, Jul 24, 2026 at 08:45:20PM +0200, Christian Marangi wrote:
> Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> for the USB controller.
> 
> Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> always supported. The USB 3.0 mode is optional and depends on the Serdes
> mode currently configured on the system for the relevant USB port.
> 
> To correctly calibrate, the USB 2.0 port require correct value in
> "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> selecting one of the 4 monitor clock for calibration (internal clock not
> exposed to the system) but each port have only one of the 4 actually
> connected in HW hence the correct value needs to be specified in DT
> based on board and the physical port. Normally it's monitor clock 1 for
> USB1 and monitor clock 2 for USB2.
> 
> To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
> property is required with the phandle pointing to the correct Serdes port
> provided by the SCU node. Providing the phys property is optional if USB
> 3.0 is not used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/phy/airoha,an7581-usb-phy.yaml   | 62 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> new file mode 100644
> index 000000000000..f42e3d49a61f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7581 SoC USB PHY
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description: >
> +  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
> +
> +  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> +  always supported. The USB 3.0 mode is optional and depends on the Serdes
> +  mode currently configured on the system for the relevant USB port.
> +
> +properties:
> +  compatible:
> +    const: airoha,an7581-usb-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  airoha,usb2-monitor-clk-sel:
> +    description: Describe what oscillator across the available 4
> +      should be selected for USB 2.0 Slew Rate calibration.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +
> +  phys:
> +    items:
> +      - description: phandle to Serdes PHY. Optional if USB 3.0 is not used.
> +
> +  '#phy-cells':
> +    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
> +      as defined in dt-bindings/phy/phy.h.
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - airoha,usb2-monitor-clk-sel
> +  - '#phy-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/soc/airoha,scu-ssr.h>

Rob's bot triggered compilation error due to this missing header.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
