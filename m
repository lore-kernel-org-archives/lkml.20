Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263288;
	b=IiuxMLjcSWaPeqff+bqF+852M7ynj1KDLfj55P+8NZylZNWFag676jbT9QJtb21JZ4AR
	 XVWzvbyz80tLFlFsvE0RvkvhdtfDS/4WBpnskITdKlMKTf7rucxrLsgNBWBXp7kooCMeP
	 d58adZR/v0/ZO7E/LJuHh5k8tKW9u2kiqNErhB4TAHkwSl2TS2YIIWaFt8U6no0POQVk9
	 otU+FGRDWLIXb9q39KTxUBblxQsCLT5WWHNS9yvi7KKhYJtIfz+d5GUp4PD02SvyogtLD
	 p50GB+Jzax5XxoB4WopRg9i9Sla6iPLkTFfO++m7/UxQCCZ61+4qv/FW5ttWl1Bj8Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263288;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ph3uTFUelSiSKTQqka1CpNf7qSfk3+fcBBtyySM6iTI=;
	b=xSN5e+H3MmuQH2jxTU3nd0t9gS4NvkZ6GDafwuvyygtcdWi0N4De1B+o+xbPRLPIX3oA
	 C9IrjncNnqu5yG/egfjCdI7DVVngsyU6eEqqx1hiG499kB2YS8YHeE93FI6uVQn5kiqz+
	 t7lch5EBs3lwr1BIIJuIKDkwu7TZYqYyVmAN23w6DITVVtmXdX98ZKDQoWVyQ/9bQnuOe
	 zDI+Ww0A9JOM8PWY4jvSmxC/hWzqCD+eDy2P7m8rPTZr3j5QrM6KMgjpn2RKqgrOWbDA3
	 /JNk8XkcSXEUca51s9WRk4KgjoTIoFqkYeij9e0iB8ufjZV1bbUBqU7eoxORSNNWMoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W9OZRfPJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEC8606A31C;
	Thu, 29 Oct 2026 08:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W9OZRfPJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4471F01828;
	Thu, 29 Oct 2026 08:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793263288;
	bh=Ph3uTFUelSiSKTQqka1CpNf7qSfk3+fcBBtyySM6iTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W9OZRfPJTN7jDvmlKxjnRfW4FiJ8kFac0E9UkTFFvaca97IAN9PdjMU7VujS2dRGr
	 iv9moZeWMMbMe8RJMVhTo0F8YM/hJOwhgN251zcF3DYnFXWys2ZetQzqC4LQv9AtT+
	 YxWn9iduTpXgW6iEpDm44gGNCV711yrYdGev6jSJ2y+vRj5zGefxyzpV2UWNZFoun6
	 Do2DLYfNnG60a1i9ewJif9WF+TRPaqtRhCQbQtoFMLhSwQETBiwYwBvut7o+JwZ634
	 b8ST6Glf+skeJWmmFwx1xjc6s+HtZuKDffN+a8D8juJQwGJ4SQd043tSzGWsIjqFww
	 sPwENvAt3MVEg==
Date: Thu, 29 Oct 2026 09:41:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/4] regulator: dt-bindings: Add TI LM51772 support
Message-ID: <20261029-indefinable-bustard-of-ampleness-44abaf@quoll>
References: <20261027-paul-lm51772-v2-0-b2a767e34722@bootlin.com>
 <20261027-paul-lm51772-v2-1-b2a767e34722@bootlin.com>
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
In-Reply-To: <20261027-paul-lm51772-v2-1-b2a767e34722@bootlin.com>

On Tue, Oct 27, 2026 at 10:39:23AM +0100, Paul Louvel wrote:
> +          regulator-temp-warn-kelvin:
> +            enum: [0, 1, 368, 383, 398, 413]
> +
> +          regulator-ramp-delay:
> +            enum: [40000, 20000, 1000, 500]
> +
> +          regulator-min-microvolt:
> +            minimum: 1000000
> +            maximum: 48000000
> +
> +          regulator-max-microvolt:
> +            minimum: 1000000
> +            maximum: 48000000
> +
> +          regulator-min-microamp:
> +            minimum: 500000
> +            maximum: 7000000
> +
> +          regulator-max-microamp:
> +            minimum: 500000
> +            maximum: 7000000
> +
> +        unevaluatedProperties: false

Place this line after description, that's the convention for child nodes
for readability.

> +
> +      vcc1:
> +        type: object
> +        $ref: regulator.yaml#
> +        description: |
> +          LDO regulator for auxiliary use.
> +          It can used to power, for example, a PD controller that will drive this PMIC.
> +
> +        properties:
> +          regulator-min-microvolt:
> +            minimum: 5000000
> +            maximum: 5000000
> +
> +          regulator-max-microvolt:
> +            minimum: 5000000
> +            maximum: 5000000
> +
> +        unevaluatedProperties: false

Place this line after description, that's the convention for child nodes
for readability.

> +
> +    additionalProperties: false

Place this line after description (for relevant block), that's the
convention for child nodes for readability.

> +
> +  ti,sync-pin:
> +    description: |
> +      Selects the function of the SYNC pin, used when several converters
> +      operate in parallel.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [input-rising, input-falling, output-rising, output-falling]
> +    default: input-rising
> +
> +  ti,ivp-thres-microvolt:

Use either existing over-voltage-threshold-microvolt from battery schema
or ti,ovp-microvolt from the other TI binding.

> +    description: |
> +      Input Overvoltage Protection and Regulation Threshold.
> +      It shall avoid any damage to the device in case the current flows from the
> +      output to the input and the input source cannot sink current.
> +      This threshold is used for IVP (Input Voltage Protection) and IVR (Input
> +      Voltage Regulation).
> +    oneOf:
> +      - multipleOf: 125000
> +        minimum: 4750000
> +        maximum: 23250000
> +      - multipleOf: 250000
> +        minimum: 23500000
> +        maximum: 50000000
> +    default: 50000000
> +
> +  ti,ivp:
> +    description: Enable the IVP feature of the regulator.
> +    type: boolean
> +
> +  ti,ivr:
> +    description: Enable the IVR feature of the regulator.
> +    type: boolean

Why wouldn't you want to enable these two always?

> +
> +  ti,nint:
> +    description: |
> +      Configures the nFLT/nINT pin to act as an interrupt pin.
> +
> +      nFLT mode: The pin remains low until the cause of the status change ceases.
> +      In this mode use an level irq trigger.
> +
> +      nINT mode: The pin is asserted low to signal a status change.
> +      In this mode use an edge irq trigger.
> +    type: boolean
> +
> +  ti,cable-drop-compensation:
> +    description: |
> +      The cable drop compensation feature helps to keep the output voltage at the
> +      nominal value over a wide range of load current without the need for
> +      additional remote sensing. The cable drop compensation measures the
> +      current and offsets the output voltage proportionally to the measured
> +      current.
> +    type: boolean
> +
> +dependencies:
> +  ti,ivr: ["ti,ivp"]
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

Best regards,
Krzysztof

