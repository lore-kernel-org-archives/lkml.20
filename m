Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385798;
	b=CtttMdxgjg4FzjcFMj+RNnSu4uc41/yKQsTOz/9zoWY/beHq2BRtoHkRNt4+cY4PBtcy
	 WOfsFh44Ys8spsj/gSzytZyVJJ7Mj9eKu5jmZc3u/fOPHR1eG8oSCEu5/wS23/+UgDCOa
	 sgksB0FhKoZuMr9LNCTxa9Os6gNYuweCCxWqKjth0X9C06A28I1v/sb8X1aqG5rVu7uaq
	 C3xWJdZX63EVL0KGCBp91uBpAatKIayQiEhgR+54XuYFs49R8XmIus8pC1+xL5bzfRdky
	 ShbMhrRxR4ny6VM9zfVufDqq0xqktFp9j+kiODldOxfuHjtmJg6cHX/GeMfyF/3OHBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385798;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RVZrgOyVkiXqp0MONEZh77gJdk6FnfJEGOHwQdbpEFI=;
	b=IjjySlPOqqdrVjwcz7EDEHrPT0pYyc8bCJPt0p2GCs5j7uGShPiCSMdYog1TNk61ohdk
	 qpu0h03Cc6QnRz6VdosETY6wCJL/dOiG/+TIcf7HUea0LQo2qEHwy8ZG9Ar72EsM/rH7u
	 XKD4NimhEzepNiyCwTWBwadTwmLLMJoyvEN0RP7LV+m3JBy99wKKu7o/i6mOiEDbaOg/2
	 KUr3133GVuh1Mu+rc36+GnBo7j9yKJAvv5ptUV3s49JLneE0/Jcr0/fFC1aKgzkxYVx7u
	 xYXuR2RgKgPIDH2nt7JUTNYtbkvUnrd0ZZrf7pIn6rs3YiW8PAdgjyiw/pb09AYZcEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c4sSOhoa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E3A606A31C;
	Wed, 11 Nov 2026 08:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c4sSOhoa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4391F00A05;
	Wed, 11 Nov 2026 08:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385797;
	bh=RVZrgOyVkiXqp0MONEZh77gJdk6FnfJEGOHwQdbpEFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c4sSOhoax4846Sm9s4e82/Rs04iR7kCTRRxOWk0VK4irafISeSbGpiNYCebEblujo
	 wzEIke7okrmE8AAWDq1jT/wc4vftJBxLHopPWUbUHzJfu3hGohDmAlSEQ+rUnmLb9R
	 FXe0r7ultt29u2TcwrfFv4R4t14BDjYxl9lSRUN7c+C+2csiDYUDENzpyuBGJeeO8L
	 +WX1cCY19SGRgSGCZkPqE0nyK/xmsrkaQgID6h95RZ+VI3HNb2WDobRJCGGa99ue/u
	 rRgNmeXBywlg5OCfS7pE3Yx40OwLyPA6UIUADs8CDxxaGrAUhnq//mm06Z5wVhFGul
	 +f6lKLnMXGIFg==
Date: Wed, 11 Nov 2026 09:29:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 11/28] dt-bindings: gpu: panthor: Document AM system
 bindings
Message-ID: <20261111-grumpy-carp-of-superiority-eddeb9@quoll>
References: <20261110153907.3241978-1-karunika.choo@arm.com>
 <20261110153907.3241978-12-karunika.choo@arm.com>
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
In-Reply-To: <20261110153907.3241978-12-karunika.choo@arm.com>

On Tue, Nov 10, 2026 at 03:38:32PM +0000, Karunika Choo wrote:
> Mali 5th-Gen AM GPUs expose an AM_SYSTEM block for GPU-wide control and
> the AM_ASSIGN block for HW resource assignment outside the GPU
> job submission register window.
> 
> Document the system node compatible, register and interrupt resources,
> GPU clock, and assignment properties for HW resource assignment.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
> v2:
> - Add an optional AM_ASSIGN register range. Require this range when the
>   assignments node is present.
> - Describe resource-group assignments for AXI buses, partitions, slices
>   and access windows on partition-capable GPUs.
> - Allow gpu-arbitration child nodes and the #address-cells, #size-cells
>   and ranges properties.
> - Remove the panthor-system node-name restriction.
> - Remove gpu-supply from the schema and example.
> - Add an example with assignments for partition-capable GPU with four
>   resource groups.
> - Move the MAINTAINERS update to the GPU schema patch.
> 
>  .../bindings/gpu/arm,mali-gen5-am-system.yaml | 196 ++++++++++++++++++
>  1 file changed, 196 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-system.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-system.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-system.yaml
> new file mode 100644
> index 0000000000000..9e0477b8b723a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-system.yaml
> @@ -0,0 +1,196 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright 2026 ARM Limited. All rights reserved.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/arm,mali-gen5-am-system.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Mali 5th-Gen GPU System Device
> +
> +maintainers:
> +  - Liviu Dudau <liviu.dudau@arm.com>
> +  - Boris Brezillon <boris.brezillon@collabora.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: arm,mali-gen5-am-system
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2

Why is this flexible? There is no description in the binding which would
explain oddities in choices of hardware representation.

> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: system
> +      - const: assign
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  dma-coherent: true
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true

Both need to be const or enum.

> +
> +  ranges: true
> +
> +  assignments:

Do not mix nodes with and without bus addressing. That's mess.

> +    type: object
> +    additionalProperties: false
> +    description:
> +      Resource group HW resource assignment. Only valid for partition-capable
> +      GPUs.
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +      "#size-cells":
> +        const: 0
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +
> +    patternProperties:
> +      "^resource-group@[0-3]$":
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          reg:
> +            items:
> +              - maximum: 3
> +            description: Resource group number.
> +
> +          arm,axi-bus:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            maximum: 1
> +            default: 0
> +            description:
> +              Static resource-group to AXI bus assignment. Valid field values
> +              are 0 for AXI_A and 1 for AXI_B.
> +
> +          arm,partition-mask:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            maximum: 0xf
> +            default: 0
> +            description:
> +              Static partition-control to resource-group assignment. Bit N
> +              selects partition control ID N. Mask must be disjoint across
> +              resource groups. Unassigned partitions will be assigned to
> +              resource group 0 by default.
> +
> +          arm,slice-mask:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            maximum: 0xff
> +            default: 0
> +            description:
> +              Static slice to resource-group assignment. Bit N selects slice ID
> +              N. Mask must be disjoint across resource groups. Unassigned slices
> +              will be assigned to resource group 0 by default.
> +
> +          arm,access-window-mask:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            maximum: 0xffff
> +            default: 0
> +            description:
> +              Static access-window to resource-group assignment.  Bit N selects
> +              access window ID N. Masks must be disjoint across resource groups.
> +              Unassigned access-windows will be assigned to resource group 0 by
> +              default.
> +
> +        required:
> +          - reg
> +
> +patternProperties:
> +  '^gpu-arbitration@[a-f0-9]+$':
> +    $ref: arm,mali-gen5-am-arbitration.yaml#

There is no such file. You did not really test it.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false

This goes after allOf: block.

> +
> +allOf:
> +  - if:
> +      required:
> +        - assignments
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        reg-names:
> +          minItems: 2
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpu-system@68000000 {
> +      compatible = "arm,mali-gen5-am-system";
> +      reg = <0x68000000 0x10000>;
> +      reg-names = "system";
> +      interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&mali_gpu_clk>;
> +    };
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpu-system@68000000 {
> +      compatible = "arm,mali-gen5-am-system";
> +      reg = <0x68000000 0x10000>, <0x68010000 0x10000>;
> +      reg-names = "system", "assign";
> +      interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&mali_gpu_clk>;
> +
> +      assignments {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        resource-group@0 {
> +          reg = <0>;
> +          arm,axi-bus = <0>;
> +          arm,partition-mask = <0x1>;
> +          arm,slice-mask = <0x3>;
> +          arm,access-window-mask = <0xf>;
> +        };
> +
> +        resource-group@1 {
> +          reg = <1>;
> +          arm,axi-bus = <0>;
> +          arm,partition-mask = <0x2>;
> +          arm,slice-mask = <0xc>;
> +          arm,access-window-mask = <0xf0>;
> +        };
> +
> +        resource-group@2 {
> +          reg = <2>;
> +          arm,axi-bus = <1>;
> +          arm,partition-mask = <0x4>;
> +          arm,slice-mask = <0x30>;
> +          arm,access-window-mask = <0xf00>;
> +        };
> +
> +        resource-group@3 {
> +          reg = <3>;
> +          arm,axi-bus = <1>;
> +          arm,partition-mask = <0x8>;
> +          arm,slice-mask = <0xc0>;
> +          arm,access-window-mask = <0xf000>;
> +        };

Your example is incomplete.

Best regards,
Krzysztof

