Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EA73BB9F7;
	Sat, 17 Oct 2026 17:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259557; cv=none; b=TdFbye4Q7YY9hX6ryagvIiiiIG+A7Kovoik8Gb4zogp5amj+iZ6qadPJ9VittTcNK4FPpgNQYUP+9CT8Jl0qJVfL9+u24h2p0oXNo91oSF+8NeqZMwyCVdLXlOhGqJErocnItpu15f0sYo0hEyZaQOLtRdIHxtH7uMpZXI/ejVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259557; c=relaxed/simple;
	bh=Jo2FHXTkJtPu2fvGuVrv3A70r8NxjJrsOWgWcjkIr58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWfNV9/uW4qhEyrfODo2eEVEuyhp3RqT9Ii1xWPBJKpwoz7SnO91wb0IFsW/5UpeZ/MCOor3rvfI8R/mBuPMQan3PDJCCBb8Sk+OkmirJCD8EANjySLEyZaML2P80aX9TX5+I+PNxXUBYq4iyRnmdS8IZYrVrQQLaRtZhTdguWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVzoz7F8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVzoz7F8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85D91F000C5;
	Sat, 17 Oct 2026 17:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792259556;
	bh=vzg59Xkf4Lmvc7NfaNymuTJFzLiLBxFJ5cCPJCvEM6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DVzoz7F8prxSjPPCcYFu0iIWqStKwNasZL6ZqLLBfCL9F8oUcg1oOBl53sOGb1aNP
	 xsxRDXuAL4RzQuZ91EAFXVad3o4XJ6EtDNVxHHuPFh3N/WTB01H/MiziVdLSN3XvGi
	 6Lac4k55lyLtZgR7vvxQVd8vVry5DrD8aoXy7YmmhbkpnNjGU0DqEehx0qWDO++u0g
	 wo/5XjD+HTioy83qafn94Ux67uoLLKxYsgL0D4AT2HtsTzAvEA1UzvgMY3uCgrf0oN
	 xzl2kNefILUzkLyacq2Bsu3lF5bf8EmGKMEXz5vouLPICRF3n9BnkmRwlSkPiaIdz4
	 IDaGk93oVcIiQ==
Date: Sat, 17 Oct 2026 19:52:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Simeon Marijon <simeon.marijon@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: stm32: allow TAMP nvram child
 node for syscon
Message-ID: <20261017-valiant-exotic-heron-c0b6e8@quoll>
References: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
 <20261016-upstream_nvram_reworked-v3-2-f65908490cf7@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016-upstream_nvram_reworked-v3-2-f65908490cf7@foss.st.com>

On Fri, Oct 16, 2026 at 05:26:04PM +0200, Patrice Chotard wrote:
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

There are no children of tamp@5c00a000 in
arch/arm/boot/dts/st/stm32mp151.dtsi. How is it possible to reproduce
this warning?

Are you using some other patches bugs as a reason of change in bindings?

> 
> Allow the addressing properties and the nvram child, gated on the
> st,stm32-tamp compatible so the other syscon variants stay strict.
> "#size-cells" may be 1 or 2: the STM32MP21 soc bus uses two size cells
> (an empty "ranges" requires the node to match its parent) while the
> other STM32MP SoCs use one.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml        | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index 95d2319afe23..1aeb54867db2 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -39,6 +39,23 @@ properties:
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

You work on some weeks old tree.

> +
> +patternProperties:
> +  "^nvram@[0-9a-f]+$":
> +    type: object

additionalProperties true with ref or false with a compatible, just like
every other binding. See also display/msm for some examples.

> +    description:
> +      TAMP backup registers exposed as an NVMEM provider. See
> +      nvmem/st,stm32-tamp-nvram.yaml.
> +    required:
> +      - compatible

Best regards,
Krzysztof

