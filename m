Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385F33CFF49;
	Mon, 28 Sep 2026 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589935; cv=none; b=mKqAzkleg2KzFOnnmQuCn/KABrMZp0l4usZZupUd75mM7JP4+XOQd4eQ1AOk+e4JxqvD3VQQ/OT3EZ4gMVnxD4m+zSnGlkhs5cLrapWchuNns88hY8zlV951e6QXVPd65RhAN5QIfUPMCk6ll0i4KWoQE9MXSwUWKxV3aU9VfeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589935; c=relaxed/simple;
	bh=/doysIOq/NVxl2rVmuZK749aLf/1vlGmsfsw4VMzHkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJLS0nyiqs79bxriV9LaX1EtRyzEyW8lQaBirCzWUMC47NaU3aIhHU7EMilbohvJNzKq9Gxtxxf6ka+LWJ3SqJblJeXTJpb7A4X/MAuANPuBwrGpZVNkfc7Rblwikoac372rHMWOJvKfMdITd1w2+sTa+ENK+t2HqkoTWdzXtLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQ17o/57; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQ17o/57"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4121F000FF;
	Mon, 28 Sep 2026 10:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790589933;
	bh=JJDJn44L9MIQQG6KNAreRHrg9uO+c4Os3eCJKsUQEJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GQ17o/57KF9lHOA44UeSTaHk7XtYerxCYLFcQxkJgT3B+b1rxMOjKd7tKnT04DUsl
	 kUlNY/ezMrd9xbfDLY70jUnWLKYLNVEINxxeZvTvBZgTEc9bFBN9OZzxfvNrwD4UKR
	 a37Vz3YOYDhM8LeHPrnCFT2BkmsfPqUUijXfSB78iw9Vn01y0Zpf/HXhjq0jYO20xk
	 osgaS+Fj7XKs/UbIUhfaeyDQn3pjd5U84Vjs6U74Xpao+/NZnpe3VDW/8JrUgjGETw
	 zfkmDYhaIMbZcZsktmM81+0GKCMmXYWayBD2wLnG/CjbhbVfW1amMGg2G9vTFywCPe
	 YxqSsaOCkLZKA==
Date: Mon, 28 Sep 2026 12:05:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 10/27] dt-bindings: gpu: panthor: Document
 panthor-system bindings
Message-ID: <20260928-vehement-incredible-markhor-06685e@quoll>
References: <20260922204535.2850094-1-karunika.choo@arm.com>
 <20260922204535.2850094-11-karunika.choo@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922204535.2850094-11-karunika.choo@arm.com>

On Tue, Sep 22, 2026 at 09:45:04PM +0100, Karunika Choo wrote:
> Mali 5th-Gen AM GPUs expose an AM_SYSTEM block for GPU-wide control
> outside the main GPU register window.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> 
> Document the system node compatible, register and interrupt resources,
> GPU clock, and optional GPU regulator supply used by the AM_SYSTEM
> platform driver.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  .../bindings/gpu/arm,mali-gen5-am-system.yaml | 67 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-system.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-system.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-system.yaml
> new file mode 100644
> index 0000000000000..f0689bb8f05a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-system.yaml
> @@ -0,0 +1,67 @@
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
> +  $nodename:
> +    pattern: '^panthor-system@[a-f0-9]+$'

Nope. Why would we name devices based on driver?

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Drop the nodename completely.

> +
> +  compatible:
> +    oneOf:

Drop

> +      - items:

Probably drop... but:

> +          - const: arm,mali-gen5-am-system

How can this be used alone?


> +
> +  reg:
> +    items:
> +      - description: System register

so just maxItems: 1

> +
> +  reg-names:
> +    items:
> +      - const: system

Drop entire reg-names

> +
> +  interrupts:
> +    items:
> +      - description: System interrupt

keep it simple, maxItems: 1

> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Phandle to the GPU clock.

Drop description, obvious. Can this be something else than phandle? Can
a single clock for GPU can be something else than GPU clock?

> +
> +  gpu-supply: true

This should rather be named based on the pins/domains. Are you sure the
domain is called GPU?

> +
> +  dma-coherent: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    panthor_system: panthor-system@68000000 {

Drop unused label

Best regards,
Krzysztof

