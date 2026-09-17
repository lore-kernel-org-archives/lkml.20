Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BFD42C508;
	Thu, 17 Sep 2026 21:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789681870; cv=none; b=JNdq+0bioJZXNCzbYH+6eALFPVM8x8lrtMEI7MrZmAodTjuczIFFBjhRS/QqSGrK4pydU+Uj3AeG9IlZsWwMul3ABbcKTH+fV1ZKslBUFR4oD7Xb3FvcNIPZF2cDTHuzCi89hgZdWwM1rno/IJAEvLAo3Zsd1rDlrtzBbs8v6DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789681870; c=relaxed/simple;
	bh=hxL36TqtOUniTNU8t/bIUxoxNBOZDwazhndcpgC+XEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxmMMCl8HADOx6LjBScBMhAR0O4t3tvvlibG8wlsduanENhtHFh2qMEtZQWAIa6Os3v2DHvllzXFhbO6xv2vtL11CaituRm21+KGg5UMTUHsaMmlBcufpWNIQ0DmE6O6Gq3K4hDHrUrnfo/i9V2rRdDaFBrjJavkAlDam7j3SiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8ONJhXH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8ONJhXH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7CB1F000FF;
	Thu, 17 Sep 2026 21:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789681869;
	bh=ADx1gBJd+i0kQFNsWeKzJizPoigYcAbyJ2J0mmsvfAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l8ONJhXHxC+X/t24/AiGf5UNJe1DNBUoULGuS5RcwKM9CaNihbEHnweehLB5fAM3a
	 4pBl12Jdjyg6Cb/ghE1h2ZmpiRB8SvoUiBSYp9RlN+d1CJ1Du7YkkbSVgHDQ9doUwH
	 wB5BkDlkfq5IeCABocbIr7L4mpnGbaB9c/KatqkYsvLZ4RzVzq3BihUwVnvvWbTyze
	 D23EfsHIdmp8SaxCz2HsP/9Fxkq4Nq9a/sBoMDMSN8U/GT3nIqvPS4THu454PvmuZG
	 9XxOdec0CjDIeG8+CzZIO/N/yUseauC0t04877qKYjb8fCxvs8Jc5I/EcBR3xscijt
	 U5sgNLPBAaUmA==
Date: Thu, 17 Sep 2026 16:51:07 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: airoha: Document support for
 AN7583 Gen3 PCIe PHY
Message-ID: <20260917215107.GA3884839-robh@kernel.org>
References: <20260901125819.20378-1-ansuelsmth@gmail.com>
 <20260901125819.20378-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901125819.20378-2-ansuelsmth@gmail.com>

On Tue, Sep 01, 2026 at 02:58:17PM +0200, Christian Marangi wrote:
> Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
> work. Add the required register to configure the PCIe PHY and provide an
> example for it.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../phy/airoha,an7583-pcie-gen3-phy.yaml      | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
> new file mode 100644
> index 000000000000..a8ec5ac781cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-gen3-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7583 PCI-Express PHY
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description:
> +  The PCIe PHY supports physical layer functionality for PCIe Gen2/Gen3 port.
> +
> +properties:
> +  compatible:
> +    const: airoha,an7583-pcie-gen3-phy
> +
> +  reg:
> +    items:
> +      - description: PCIE G3 analog base address
> +      - description: PCIE G3 PMA base address
> +      - description: PCIE detection time base address
> +      - description: PCIE Rx AEQ base address
> +
> +  reg-names:
> +    items:
> +      - const: g3-ana
> +      - const: g3-pma
> +      - const: xr-dtime
> +      - const: rx-aeq
> +
> +  phys:
> +    items:
> +      - description: phandle to QPHY phy for Gen2 support

A phy for the phy... That's kind of odd. It there some reason the gen3 
and gen2 phys aren't both linked to the PCIe host and controlled from 
there? Doesn't look like there is any interleaved or cross 
initialization needed to handle these in one place.

Rob
