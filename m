Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030383CFF49;
	Mon, 28 Sep 2026 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589980; cv=none; b=Je9ymNSy5FtqVQuaG6pkTxQSl5F53n4j9iTjjjk1GCYZj8KAL2hbNyMKg401k3ZUJDS5clUKMGrjOYEEGkvKUiv1Mjat1ukjHxrnHCx552G+KEQE+s3yvk9WyT9TYguVRGfJTNcYvFpeNYX6PjyFRUtENKyyunKgER+CyCbkG3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589980; c=relaxed/simple;
	bh=h3kFj6cg9mTnCNLZylShgCtUXIFnOSUyMdj+MVDCUwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBURMeMMAAtktb5aO57G5THhs++T+G+nW9lpj3ITUGETuTWVEZToPtUwl1GLiKdHo8heQITpeCjmrieCK3+8Q0MRv5BGzID7k+dT3cxnfNxWkPngz0z9VsjXAkYWiRRY6VSQvc1Dl1MFO57nOh08xgv6PHewaB39MvCsMNun+gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLYQInke; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLYQInke"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4AF1F000FF;
	Mon, 28 Sep 2026 10:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790589978;
	bh=H7XMA2MyPtBGtHXeBa0Gg30v8MrdMWY70pIih3+O+nU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nLYQInke1hVftuPeMgwThpqe0Mjj+b2eCbhn3arNW0/pCnjLOpz8fNXhTQRnNHWtV
	 e0vY4gCSvnrGfhJKvp9MwAUeB59vS+fAX8GcN+llR6iY9WfbtQN4j80fSAo7yhbbUE
	 4/RvgUctm2go+NN9Qxw4YUcQtLwgL2SS8emeN2q9uVV056i4mm5M0uY0v7sqn2IJHM
	 c8IyXw5/FzyM7wjyweR2F0cMUsaQHIHHZDzpwQZPSWIp+4tHBou0zJfhz3YMZZ5HPl
	 AwvyRtkn0hCWEevXo+k1krz40W2Pz6eksAPd5UabC/SvB/GJ2FK/D+gG9oAE3HflQq
	 EBv81YZXp9tgA==
Date: Mon, 28 Sep 2026 12:06:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 12/27] dt-bindings: gpu: panthor: Document
 panthor-arbitration bindings
Message-ID: <20260928-satisfied-rigorous-boobook-9dcef4@quoll>
References: <20260922204535.2850094-1-karunika.choo@arm.com>
 <20260922204535.2850094-13-karunika.choo@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922204535.2850094-13-karunika.choo@arm.com>

On Tue, Sep 22, 2026 at 09:45:06PM +0100, Karunika Choo wrote:
> Mali 5th-Gen AM GPUs expose arbitration registers outside the GPU node.
> The arbitration device contains partition-control and resource-group
> register blocks used to grant, yield, and close access windows.
> 
> Document partition and resource-group child nodes, each with its own
> register range, interrupt and hardware ID.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  .../gpu/arm,mali-gen5-am-arbitration.yaml     | 125 ++++++++++++++++++
>  .../bindings/gpu/arm,mali-gen5-am-system.yaml |   9 ++
>  2 files changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-arbitration.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-arbitration.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-arbitration.yaml
> new file mode 100644
> index 0000000000000..9ea2b4bb9a344
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am-arbitration.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright 2026 ARM Limited. All rights reserved.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/arm,mali-gen5-am-arbitration.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Mali 5th-Gen GPU Arbitration Device
> +
> +maintainers:
> +  - Liviu Dudau <liviu.dudau@arm.com>
> +  - Boris Brezillon <boris.brezillon@collabora.com>
> +
> +description:
> +  The arbitration device manages partition-control and resource-group blocks.
> +  Each block is described by a child node with its own register range,
> +  interrupt and hardware ID. Partition and resource-group IDs are separate
> +  namespaces. Access-window IDs are global to the GPU.
> +
> +properties:
> +  $nodename:
> +    const: panthor-arbitration

Same comments. I stopped review here except one more point:


> +
> +  compatible:
> +    const: arm,mali-gen5-am-arbitration
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^partition@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Partition control block and its initial resource assignments.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: Partition control register range.
> +
> +      interrupts:
> +        maxItems: 1
> +        description: Partition control interrupt.
> +
> +      arm,id:
> +        $ref: /schemas/types.yaml#/definitions/uint32

IDs are not allowed. See writing bindings or DTS101 slides.

Best regards,
Krzysztof

