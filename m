Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FAC51814A;
	Fri, 18 Sep 2026 18:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789757138; cv=none; b=gv8WrPqHuYidBartXSCibSg5DeE37lB7JoQozGffC8nAs0UgbTFBNZ4oeVsQEcJVqChmSZRbEH7Uhy+n5lDFgOC/d9P3xi1l6B77+q35NknPwFvtnfdlaxJuqIocukQoM3Q4u9LGGXays0QbvIjchYmWp2X8RnNgaSEN6DFZc8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789757138; c=relaxed/simple;
	bh=tXFJcMJta6Gk3hMEvgLbiI1qQcwIipRW42tXJFIZP7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1VDdeONP944hANT9lBSLeNCBmvcp77H25+Sgk6ChMPFkqKiINzW/LYrpsq41NvRP4BxrCpR/RqSFUGtJZfP+68b6J+e/qsPS4/W8dAa7HId++cy5o0YGTJgTb/dN0d32qaMM7/E73fRaT7kZzUBpIZmKo3GYLkKV+/eUlUy+gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8+wiRLH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8+wiRLH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02CC1F000FF;
	Fri, 18 Sep 2026 18:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789757130;
	bh=YovMfENuXVcxmX4rLuKB0zA8k0EptKTzSk5necfij5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a8+wiRLHPrcHcb6B1jIL+TNiMkajXKzfBVTIvqEUh6Jk90hiPYGFNhR9gvZmIfXpr
	 iFOipNzyedV+QUgQXcH32fWEvrMwz39UiumDFaCF927EEe6cnNu+sNKSFqCQ8SeD2v
	 K0O1eu2LyTYZVNWIIjdHZztQdx+X9Zny5k67Ng4/oBX/B/CfIeo4E3SItCFnVBr731
	 iqFOtZjf3EbFU72kHCOqtRshXXg/wYHY9DJMT39wY/vobe/UCdsx0G5ht/MG6rPsSH
	 fkvOl6qadOOPVyYvIh2HtELime1XvIu5Y9nHYoa+QuFruJNpxkusg81LW68mZoci+v
	 U6f2TTGaObVUQ==
Date: Fri, 18 Sep 2026 13:45:28 -0500
From: Rob Herring <robh@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Simeon Marijon <simeon.marijon@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: stm32: allow TAMP nvram child node
 for syscon
Message-ID: <20260918184528.GB1358633-robh@kernel.org>
References: <20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com>
 <20260910-upstream_nvram_reworked-v1-2-521c16175cef@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-upstream_nvram_reworked-v1-2-521c16175cef@foss.st.com>

On Thu, Sep 10, 2026 at 04:11:23PM +0200, Patrice Chotard wrote:
> The STM32 TAMP node (compatible "st,stm32-tamp", "syscon", "simple-mfd")
> exposes its backup registers through an nvram child node described by
> nvmem/st,stm32-tamp-nvram.yaml. That requires the TAMP node to carry
> "#address-cells", "#size-cells", "ranges" and an "nvram@..." child.
> 
> st,stm32-syscon.yaml uses "additionalProperties: false" and only allowed
> reg/clocks/#clock-cells, so wiring the nvram provider into the DTSI made
> "make dtbs_check" fail on every STM32MP TAMP node:
> 
>   tamp@5c00a000 (st,stm32-tamp): '#address-cells', '#size-cells',
>   'nvram@5c00a100', 'ranges' do not match any of the regexes:
>   '^pinctrl-[0-9]+$'
> 
> Allow the addressing properties and the nvram child, gated on the
> st,stm32-tamp compatible so the other syscon variants stay strict.
> "#size-cells" may be 1 or 2: the STM32MP21 soc bus uses two size cells
> (an empty "ranges" requires the node to match its parent) while the
> other STM32MP SoCs use one.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml        | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index 95d2319afe23..8a0e751591f6 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -39,6 +39,21 @@ properties:
>    "#clock-cells":
>      const: 0
>  
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    enum: [1, 2]
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^nvram@[0-9a-f]+$":
> +    type: object
> +    description:
> +      TAMP backup registers exposed as an NVMEM provider. See
> +      nvmem/st,stm32-tamp-nvram.yaml.

To ensure the node matches a schema:

       required:
         - compatible

Rob
