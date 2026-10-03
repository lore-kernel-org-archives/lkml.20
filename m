Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9AB221F39;
	Sat,  3 Oct 2026 21:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791062312; cv=none; b=rHhsIHNgwgkwpdyQIdpeeot+y0XYTYwOpM0B7xUsRdmh498sZG6jpCrRuhMuKelt1jfas6/uoeW1tQZzw0JqDYuJWkx3/RK9IsWo6L/4KHjXVOWyzZ5w+9koclSZ4HWOna3inMz/R26zp11PqfZL2A9hd44d1nKktDIiDUIsnm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791062312; c=relaxed/simple;
	bh=RlKDGGrVWfLqxn07Sgrd8UkIFjHMbd7p4BW5/kvZmmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDkRXZ2Um14NMMJrYOU2Wi2xcT7wePBP8+w7sDr1jBm6s57rJXCddMNJKpKmPNWPRLhVFRB5TYjCq3wVPBVETyAJAQuDn94b5/eArS3m6uAuz9cqEd1df6ljyszG9qExD4rveAcRSvDMP7zbQMLjQqQAbKvjg+LB5SQJo+W1v4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayNfcK1r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayNfcK1r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE541F0089B;
	Sat,  3 Oct 2026 21:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791062311;
	bh=QFUWQ2qkbmbrXAMMVcxH3MVAzoCMw16GTny7iGm+v4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ayNfcK1r97THljNL5bFI2fITox4aT3MAPzMUumOiObDNFdrv1UlbvUk94hi1vmetS
	 3hkaJHTDr+ctf8BML31pJ9fixux3Q1jRHnxx7ELAVUDWA2gE9vcGL0+ZLTJOcV0ZRS
	 4sn9x9mPpcQqeHgEa06Ttyok5jgMRJHw2udYiHWlhVw/5Mq8++Z69ics5qErbhLGVe
	 cJTjVnYVZX3ymg9o2Hz1hT0iYPkXHYqGENM/nRTfq1RaCsJaEWwPKka3WdxuBftmJ1
	 gidi5k/fqG1um8OpG0BvbIRLt65QGM9mJjOsikFp3m2NX6LLW9uZ7IouRF180pL9vF
	 fY0vIRm6ajQdA==
Message-ID: <eeb7c9d4-ed3e-4b94-a590-0fcff1998971@kernel.org>
Date: Sat, 3 Oct 2026 23:18:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: bus: Add binding for Altera AXI Timeout
 Bridge
To: V.Yurkov.EXT@bruker.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vyacheslav Yurkov <uvv.mail@gmail.com>
References: <20261003-feature-timeout-ip-v1-0-8837c311d571@bruker.com>
 <20261003-feature-timeout-ip-v1-1-8837c311d571@bruker.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261003-feature-timeout-ip-v1-1-8837c311d571@bruker.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/10/2026 22:19, Vyacheslav Yurkov via B4 Relay wrote:
> From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> 
> Add a device tree binding for the Altera timeout bridge, which connects
> an Avalon bus to the HPS and provides an address space for child
> devices with a fall back to a simple bus.
> 
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
>  .../bindings/bus/altera-timeout-bridge.yaml        | 82 ++++++++++++++++++++++

Filename must match compatible and compatible has completely broken
format. Please look at DT spec or any other examples how compatibles are
created.


>  1 file changed, 82 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/bus/altera-timeout-bridge.yaml b/Documentation/devicetree/bindings/bus/altera-timeout-bridge.yaml
> new file mode 100644
> index 000000000000..b57a0966ba6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/altera-timeout-bridge.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/altera-timeout-bridge.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Altera Timeout Bridge
> +
> +maintainers:
> +  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> +
> +description: |
> +  Altera timeout bridge bus.

Useless description. You keep repeating the same.

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: altera-timeout-bridge
> +      - const: simple-bus

Why the fallback?

Your commit msg is also useless here, you just wrote what you did, not why.

I see no reason why generic "bus" like that should stay generic,
although you have entire commit msg to explain why this is different or
what is the versioning of this IP block.

Missing blank line.

> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ranges: true
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-parent
> +  - ranges
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +patternProperties:

This follows properties.

> +  "^[a-zA-Z][a-zA-Z0-9,+._-]*@[0-9a-f]+$":
> +    type: object
> +    description: |
> +      Device connected to the timeout bridge.
> +
> +    required:
> +      - compatible
> +      - reg
> +
> +    additionalProperties: true
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    intc: interrupt-controller {
> +        interrupt-controller;
> +        #interrupt-cells = <3>;
> +    };

Drop, irrelevant


> +
> +    timeout_bridge_hps@10000 {

Really, this is the style you send? So the toolset - dt-check-style - or
the Coding style mean nothing and you keep sending what you have in
downstream.



Best regards,
Krzysztof
