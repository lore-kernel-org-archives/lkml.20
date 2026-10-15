Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876E4496D4C;
	Thu, 15 Oct 2026 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792056565; cv=none; b=J1v1XhnjWtbrYOiNirVFvtinFYiH0JelK3anJoZjrt9ACAZyeq6AC770ICeF/j2XPz7KYLYe7Bm4dw6rNhWq4QimBk3HZgQC+3UGSYubKUhhFCB/OgNgEtBJOo/e2KwZJPob/DgQlZj5Qwwt3UQtTn5K5y9diGMIgPMIsX1PXaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792056565; c=relaxed/simple;
	bh=btFMlAE7+coipYtE1+3PrAgX0bo8RTfVBpYP11159Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gk3qqdIjI/hk9rXTPykjBR8x09AiF2HZpWdAnQHpZx739G4Oc3BWC1m94Awo+StxDOIWLdLbpOIARlk0QQF0MQbjrphb+9lTGxJn62s4SumXcqlov/xDH8Klt3tmFmORoy5ClZjcnDd0w6URNemhhQT86EaTw4FobwyTFwi8cb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ga7E1uNX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ga7E1uNX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5F91F000C4;
	Thu, 15 Oct 2026 09:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792056561;
	bh=HgKPVZ2e357Rb0z+ZGzfAhokRDWTxHYeRTuy+cn/s8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ga7E1uNX2JLUwn3p2Jgx5FUxgmjbldoWqRc6sEp3V6Ymuk1jNvloxJNdJQ/tiJyp9
	 eyd3fm7KGNjyDZHB+VPrO6cds1TTYgBqkVavjM1SM6f/x9uaFBB1XQrINTQv4tlxAL
	 2O6VUfjxEore5O4DANBID3OUuPHc1qiWl8Hs4ZdFQtKfhTlWja8WXRv0eYop56QOJp
	 9UxemPFG/kRh0miA7l37cbf8RUR0rUklGqh4adebf88675tlRVcCo3EwoCfkK3cKL8
	 772CEum32XcHwLOBVoa4owV+64s/Av7dDwad+7o/RJXx21FnkFCjnPlHBD8zr1pcye
	 KaS72h4m6sCsg==
Date: Thu, 15 Oct 2026 11:29:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, 
	stefandoesinger@gmail.com, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/24] dt-bindings: phy: Add ZTE ZX279128S PCIe PHY
 binding
Message-ID: <20261015-celestial-wealthy-cockatrice-7f100d@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-11-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-11-ghahramani.navid@gmail.com>

On Wed, Oct 14, 2026 at 08:20:50AM +0100, Navid Ghahremani wrote:
> Add Device Tree binding for the PCIe SerDes PHY found inside the
> topcrm block of the ZTE ZX279128S SoC.
> 
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  .../bindings/phy/zte,zx279128s-pcie-phy.yaml  | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml
> new file mode 100644
> index 0000000000..7bfa363294
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/zte,zx279128s-pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ZTE ZX279128S PCIe PHY
> +
> +maintainers:
> +  - Navid Ghahremani <ghahramani.navid@gmail.com>
> +
> +description:
> +  PCIe PHY block inside the ZTE ZX279128S Top CRM.
> +
> +properties:
> +  compatible:
> +    const: zte,zx279128s-pcie-phy
> +
> +  reg:
> +    description: Port index (0 or 1)
> +    items:
> +      - enum: [0, 1]

No, that's pointless. What is this index meaning on the bus?

> +
> +  "#phy-cells":
> +    const: 0
> +

No other resources? Then this belongs to the parent node.

Best regards,
Krzysztof

