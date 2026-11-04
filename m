Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801647;
	b=Nz8ms1hZiKpWhIJPTN0zVNVKffGZ4blIpA6e1l7l9yBcTXZgRy3oyxdjTjWpcTAkeKDU
	 LQTTt5kakAe0iyNj0tXJnBpbHzsAIgwU2hH790689ySwUhnXNpjaovytUw31yHPJVoS9q
	 rFnBePojOAsAWn0SMxA107ljOQIUT1Wr1nqu0JX6ecbnN5nSnDNjINhWZKDvXZygGQPio
	 Fe9QjW9BuWzszoH+bOSs1jQWPa0Ug0+Y1O7H8ajxv5KICpke6xhFfjECshUcO3ieEekeb
	 qNL9SjUG3CUMO8jQSMCqLw5bXgH0RUTdqEsyIyLXPhCRE4kZYJZTDLlQgGFG7xounqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801647;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gTtjULh/8f9ZR1N5ixvyj6WDRhr10YU+oPLd2ieduno=;
	b=LKeWGWih4sp1WvssKb1sYBr4b+Xr6ERbGF1D5ZSvfENRdlnPrfsRqm99bkVaKH25WE5g
	 pf+Pnq5H+4jPKdE0tOl7J27Ovo7W8nf9sNW4J/bfOXouiFedSUaJO386vZXcRhlmP3UMn
	 9NKZgokuyWFUcb/nk+vi6gBEt/Q186B2PP8mJWjeAHhiSOZDVRDWkOCGjEAZUgE/9mfxb
	 aGgBIHg2elc8lQOFAaRKs0ZjTsXgrLUZC5qgOCjVVipvMVKekBGeJsKsNJEpGyW5a7sHj
	 hYsCvSSj9Eeh69hiEHEe+JXNeVdf/uTIrgbT2+uXagxv70nNEjT7qs8aHTJmTCUUUYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYkdfO47;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DCF606A329;
	Wed,  4 Nov 2026 14:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYkdfO47
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65ACC1F000C1;
	Wed,  4 Nov 2026 14:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801646;
	bh=gTtjULh/8f9ZR1N5ixvyj6WDRhr10YU+oPLd2ieduno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bYkdfO47tFcxFbjzLYF4f0ptUsIHo5KYn6HFfugcgGH1OK2thxapT+tUE7GxS5m6I
	 dWoQCH2wvcEOrLpDGAJ6Yc4/SwMAprwsvAGpyWxekObfnbUheXIgudGjqXGB8syJ/6
	 JhhsBDPTZAnOoYNGoZkQ7l5VJO6MkcEYjtHvFlyDQp/3JqqMPQ7Tcj6xkGlBRWM9N3
	 x/VZ/vvlaQWEvGYMsZfQyC5bBNpsgmhhEL0tZULku5kp5etiT7UCLEKVICm2zsaKNt
	 BQ8M7psa+AV1Cp9c6necySaewRcSa5Kdc5dLYXreJCMh2q6B/7crh729OR5GGKwXFs
	 e7VBg/GHH1FPA==
Date: Wed, 4 Nov 2026 15:14:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: spmi: Add SmartDV SPMI controller
Message-ID: <20261104-colossal-illustrious-guppy-87efca@quoll>
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-3-vamshigajjela@google.com>
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
In-Reply-To: <20261103042608.387626-3-vamshigajjela@google.com>

On Tue, Nov 03, 2026 at 09:56:06AM +0530, vamshi gajjela wrote:
> From: Vamshi Gajjela <vamshigajjela@google.com>
> 
> Document the device tree bindings for the SmartDV IP Solutions MIPI SPMI
> master controller ("smartdv,spmi").
> 
> This controller IP is integrated in Google Tensor SoCs starting with the
> G5 generation (codename: laguna, canonically written as "lga"), so add
> "google,lga-spmi" with a fallback to "smartdv,spmi".
> 
> Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
> ---
>  .../bindings/spmi/smartdv,spmi.yaml           | 126 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml b/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
> new file mode 100644
> index 000000000000..e0512e60d932
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/smartdv,spmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SmartDV IP Solutions SPMI Controller
> +
> +maintainers:
> +  - Vamshi Gajjela <vamshigajjela@google.com>
> +
> +description:
> +  SmartDV IP Solutions MIPI System Power Management Interface (SPMI) master
> +  controller supporting MIPI SPMI Specification versions 1.0 and 2.0.
> +
> +allOf:
> +  - $ref: spmi.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: google,lga-spmi
> +          - const: smartdv,spmi
> +      - const: smartdv,spmi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      Core clock to the controller from which SPMI SCL is derived. Optional if
> +      the controller uses a free-running clock and clock-frequency is specified.

Don't repeat constraints in free form text. Just create proper
constraints.

> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description:
> +      Input core clock frequency in Hz when the controller uses a free-running
> +      clock not described in clocks.

Why clock would not be described in clocks? From where does it come?

> +
> +  smartdv,master-arb-enable:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    default: 0
> +    description:
> +      Enable master bus arbitration phase (0 = disable, 1 = enable).
> +
> +  smartdv,master-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 3
> +    default: 0
> +    description:
> +      Master ID for the controller on the SPMI bus.

smartdv,bus-id, I guess

> +
> +  smartdv,spmi-version:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    default: 0
> +    description:
> +      MIPI SPMI specification version used for transfers (0 for MIPI SPMI v1.0,
> +      1 for MIPI SPMI v2.0).

And why would that be board level configuration?

> +
> +  smartdv,arb-retry-limit:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    default: 32
> +    description:
> +      Maximum number of times the master retries a command when losing bus
> +      arbitration.
> +
> +  smartdv,prescaler:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    default: 0
> +    description:
> +      Clock divider value to generate SPMI SCL from the input core clock. Writing
> +      1 divides the system clock by 2; more generally, a non-zero value n
> +      divides the system clock by 2 * n.
> +
> +  smartdv,read-latency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    default: 32
> +    description:
> +      Number of SPMI SCL clock cycles to pause during bus turnaround on read
> +      commands to allow the target device to fetch data.
> +
> +  smartdv,arb-scl-delay:

Except Conor's comments, some of the properties here should use proper
units.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 3
> +    default: 0
> +    description:
> +      Delay between arbitration and Sequence Start Condition (SSC) when the
> +      controller is the Bus Owner Master (BOM).
> +
> +required:
> +  - compatible
> +  - reg

Best regards,
Krzysztof

