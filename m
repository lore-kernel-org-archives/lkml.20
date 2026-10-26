Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793053355;
	b=a+pxmrPKTpK0EWAAWcaosFNURphS2/qlSPmb60DrnQZW3XSWHU7upIYe+mU2zwk/lOaD
	 xklcUrI+sSfsGfXWqp72AxhIMqPSxr6BRYXKQXuG8aZ3JwFUFqMVgzD9JXQgER9X1Ksx1
	 3JpRXM8YUSAGUyMvguffi43pbz44ah+w98CGKSefwCZY/8v9COWSgAxLvKnY3HqDxcKDr
	 9qXHXbvB69Ka85WeEySarv7xR7jqREbL/fxL7kK+ccBOhtiLTpQxlvCFmPD4bdDAa+NTj
	 iofvR7PTmAGk+vwDyFWN0lCPV3KLotF7D3CnKuLwFEPaLJQMNSpGDCIX4wS0UR7cEdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053355;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=i6HW3zbnjRX4aYliBu8BMrZerOu0EWZZVpljtZPpc3g=;
	b=xAooJZOoBuDB10z81mMUVzPeAaW5ChrGlJ7YAb7E23tovq4PntZTqElUFnXhTMHTwm4C
	 AK3aULO2d7YaTQ+f+7D0iy6KFC+wK/lRWbBl8IttYNNjx0mo0z/pWRp8cSjOsGtLw7FAc
	 Ay2UzOPkUTMJAh8lADip4Q5we6Jkmw2mKJbqIdB1stdlPVJqwR0dIKt2IKJRvY44VMHnY
	 e882c+27qg7YgxWoqVv4u/68zlv9AN7PpfLRx+V3z0jWlFjB3biIQ2eL/ralWw57KVjS+
	 uxDkEvquwna8zQDkLo9pHmi89NWAbLrrJd/MTCYP1ZG8aCTJ1YKDHTGmBi+LGww4xHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nwUX7JzE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0C5606A324;
	Mon, 26 Oct 2026 22:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nwUX7JzE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333F61F01825;
	Mon, 26 Oct 2026 22:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793053354;
	bh=i6HW3zbnjRX4aYliBu8BMrZerOu0EWZZVpljtZPpc3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nwUX7JzE20r8xsi2rqLDTLhctBiG66XbJI4XJgKncKEZG2FjwyDoVS1+2DvZUlSwZ
	 FHrcrizOsiJspPhieZ1qowDTcCkzWTgljBgPpt/xSgQcS88Lny/qxeorwXhTit8gib
	 K7r5uTQidQuYmIIWl7FIuUKh6MelrgK+Lt/GKcjPoXgPcsTiQk8rBchLwtfpS5/j8Z
	 wfwYDswAFehF+ZeP66nwQKe7cYAT7Pr6MPX062kw1bmZBCe+bGPslhVYEpkKwq4Cg1
	 yOIi7QgKhwPo1rb2OE4LRZfKroN1ALNSdzK48dkWbYkKdAHCRe77vN7xggIdMgu3a7
	 DQCuGuMVjPoxw==
Date: Mon, 26 Oct 2026 17:22:31 -0500
From: Rob Herring <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Santosh Shilimkar <santosh.shilimkar@ti.com>,
	Sricharan R <r.sricharan@ti.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, goledhruva@gmail.com,
	m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com
Subject: Re: [PATCH] dt-bindings: arm: omap-l3-noc: Convert to DT schema
Message-ID: <20261026222231.GA4050519-robh@kernel.org>
References: <20261003-ti-l3-noc-v1-1-9bd18cac33e9@gmail.com>
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
In-Reply-To: <20261003-ti-l3-noc-v1-1-9bd18cac33e9@gmail.com>

On Sat, Oct 03, 2026 at 12:28:32AM +0530, Bhargav Joshi wrote:
> Convert TI L3 NoC binding from text to DT schema format. Older OMAP3
> uses the SMX variant which also acts as a bus parent with simple-bus
> compatible so child nodes are allowed using patternproperties. Mark
> ti,hwmods deprecated as it is no longer needed and only used by older
> omap3-l3-smx.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/arm/omap/l3-noc.txt        |  23 ----
>  .../bindings/arm/omap/ti,omap-l3-noc.yaml          | 149 +++++++++++++++++++++

This should move to bindings/soc/ti/ or bindings/bus/ perhaps.

>  2 files changed, 149 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt b/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
> deleted file mode 100644
> index 161448da959d2..0000000000000
> --- a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -* TI - L3 Network On Chip (NoC)
> -
> -This version is an implementation of the generic NoC IP
> -provided by Arteris.
> -
> -Required properties:
> -- compatible : Should be "ti,omap3-l3-smx" for OMAP3 family
> -               Should be "ti,omap4-l3-noc" for OMAP4 family
> -               Should be "ti,omap5-l3-noc" for OMAP5 family
> -	       Should be "ti,dra7-l3-noc" for DRA7 family
> -               Should be "ti,am4372-l3-noc" for AM43 family
> -- reg:	Contains L3 register address range for each noc domain.
> -- ti,hwmods: "l3_main_1", ... One hwmod for each noc domain.
> -
> -Examples:
> -
> -ocp {
> -	compatible = "ti,omap4-l3-noc", "simple-bus";
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -	ranges;
> -	ti,hwmods = "l3_main_1", "l3_main_2", "l3_main_3";
> -};
> diff --git a/Documentation/devicetree/bindings/arm/omap/ti,omap-l3-noc.yaml b/Documentation/devicetree/bindings/arm/omap/ti,omap-l3-noc.yaml
> new file mode 100644
> index 0000000000000..a72a0f4e64332
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/omap/ti,omap-l3-noc.yaml
> @@ -0,0 +1,149 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/omap/ti,omap-l3-noc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI OMAP L3 Network On Chip (NoC) Interconnect
> +
> +maintainers:
> +  - Santosh Shilimkar <santosh.shilimkar@ti.com>
> +  - Sricharan R <r.sricharan@ti.com>
> +
> +description:
> +  The L3 interconnect is an implementation of the generic NoC IP provided by
> +  Arteris. OMAP3 uses the SMX variant while OMAP4/5, DRA7, and AM4372 use the
> +  NoC variant.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: ti,omap3-l3-smx
> +          - const: simple-bus
> +      - enum:
> +          - ti,omap4-l3-noc
> +          - ti,omap5-l3-noc
> +          - ti,dra7-l3-noc
> +          - ti,am4372-l3-noc
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 3

Need to define what each region is.

> +
> +  interrupts:
> +    minItems: 2
> +    maxItems: 2

Need to define what each interrupt is.

> +
> +  ti,hwmods:
> +    description: hwmod names for each NoC domain.
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    deprecated: true
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^(.*@[0-9a-fA-F]+|regulator-abb-mpu)$":

I suspect that regulator-abb-mpu should be moved out of this node.

A-F is generally not used for unit-addresses. Do we need it?

Rob
