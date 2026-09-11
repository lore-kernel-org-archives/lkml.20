Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997B2468C3A;
	Fri, 11 Sep 2026 08:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116366; cv=none; b=gtQsN8dHD3bgkknXwcz7Ikdk6H5uSUbv+LhgWws0dpJPSJ87MU1HN01YdwnY9dAcq/0WN/E6GbZk1bOj0lLlApXAb1LTs90/UY5Yd4XyGT/MC4aL55aexB0Zqsp5spodmmzHPt/+d9IxaNXKvc1QXGm63vxqL2L60QlGr5veAy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116366; c=relaxed/simple;
	bh=qRZzlgdMJCpg5Htq/j+6uLKj7py8gemOhfvTlq0seLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dam2KOcIvKskT6XKyv0vhM6OyIcoQHSYZtkSMl54hKmZtpU9/XLCpCijKBvbzm+EodEwY4HiedAtHaIhdziv8Q6J63Yq4P7rJlOcNlLpTGPLV6q3lsQIqZPMlfBLugvNExqQNSOyEBiPtCtUw289BlI5C/fdFWjjwd+nUOsvuTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1ZvhnSn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1ZvhnSn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E121F000FF;
	Fri, 11 Sep 2026 08:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789116360;
	bh=CWURi/OAjUySGGOpW3UuHtRxYUZ6xZ7M+UQy5dsFeQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M1ZvhnSnPCYnIbKiz//1LTYVpGYRTCG0ldTO8J01KAz3bcCWF+OdZvvVHclSZHMsN
	 9Qb0IAHVsI6wA2aFzjm3/ZwWpvJl6mxcMmtHCc3anBlfHAuufDwK+1DN5w1qPN2tcv
	 TpAcApWYaPAN1xDWhrMK/FDFvggzU/WMcaQaGfs9mB7cj6kenI6JjX6no/y9qvlWxS
	 FI7ZwqlBpR1pqsayHyd3PxgO+cdgvGr1pETtwbGQyJY5eFeMHzmAQ1DBiYHjK6Yswo
	 NnzF+v1P2u1bZs4i8sINpu+p0tBOw5NqlfNC0ttMnTUyqVqLXesbmLIF6GH7Fr+3O9
	 teHHlr6QF8JyQ==
Date: Fri, 11 Sep 2026 10:45:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: Saravanan Sekar <sravanhome@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] regulator: dt-bindings: Add MPS MPQ4210
Message-ID: <20260911-gaur-of-satisfying-action-1a3b0f@quoll>
References: <20260910-mpq4210-regulator-v1-0-d37e208dfc8d@vaisala.com>
 <20260910-mpq4210-regulator-v1-1-d37e208dfc8d@vaisala.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910-mpq4210-regulator-v1-1-d37e208dfc8d@vaisala.com>

On Thu, Sep 10, 2026 at 08:51:41AM +0000, Tapio Reijonen wrote:
> The MPQ4210 is a 40V synchronous four-switch buck-boost controller with
> an I2C interface. Its output voltage is programmed through an 11-bit
> feedback reference DAC covering 0 to 2.047V in 1mV steps, and is then
> scaled by an external feedback resistor divider, so the divider ratio
> has to be described in the device tree for the driver to translate
> reference voltages into output voltages.
> 
> The divider is given in ohms rather than the kilo ohms used by
> mps,mp886x.yaml because the bottom resistor is not necessarily a whole
> number of kilo ohms.
> 
> The same divider scales the reference ramp rate, so unlike the other
> bindings that scale by a feedback divider there is no portable value a
> board can copy into regulator-ramp-delay. Describe how the selectable
> rates are derived from the four reference slew rates, and show the
> calculation in the example.
> 
> Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
> ---
>  .../devicetree/bindings/regulator/mps,mpq4210.yaml | 69 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml b/Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e9e7a87e7533d0948927a459e9af711d1e07e572
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mps,mpq4210.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Monolithic Power Systems MPQ4210 buck-boost regulator
> +
> +maintainers:
> +  - Tapio Reijonen <tapio.reijonen@vaisala.com>
> +
> +description:
> +  The MPQ4210 is a synchronous four-switch buck-boost controller with an I2C
> +  interface. The output voltage is programmed through an 11-bit feedback
> +  reference DAC and scaled by an external feedback resistor divider.
> +
> +  The controller ramps the feedback reference at 38, 50, 75 or 150 mV/ms.
> +  The divider scales the ramp rate along with the voltage, so the output
> +  ramp rates that regulator-ramp-delay can select are those values
> +  multiplied by (R1 + R2) / R2.
> +
> +allOf:
> +  - $ref: regulator.yaml#
> +
> +properties:
> +  compatible:
> +    const: mps,mpq4210
> +
> +  reg:
> +    maxItems: 1
> +
> +  enable-gpios:
> +    description: GPIO connected to the EN pin. If absent, EN is assumed to
> +      be permanently asserted.
> +    maxItems: 1
> +
> +  mps,fb-voltage-divider:
> +    description: An array of two integers containing the resistor values R1
> +      and R2 of the output feedback voltage divider in ohms.

Nope, use common property suffix - ohms.

If this was applied, please send a fixup now.

Best regards,
Krzysztof

