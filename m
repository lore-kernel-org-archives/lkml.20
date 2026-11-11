Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386033;
	b=doFU2cJPJn2Q73kWczhJ4sw+dXBli1GwJMVL2PTUjFo2s5n1ApgkyjDfMdb+7GCsFxco
	 l6DmanExYSrT+H/VSFOZcbsYdz9ctgkfUdwrrFKoGqp8Ub0CuEYLonQ6xhgf3qwHTkAtm
	 xSl/WKqK2LFjqNCU5iMrB14PZv74f5CUm+Na9vWDryf+5kJI3y8lSKtcLSv9WTKyH4ZAy
	 7vKKdZ5NjfxSUwjQ6wqsfCdAwAa/lM58H7TiHmThP+FEDE25Hw7lsNeZyELgiZAEIAgTw
	 /TFFCklfKkwhbG1m19dra1e6Nb+GfQDyEkzFTmi/HLLlCpNZIQq8tI8KHOOfUxJ31ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386033;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Aweo+tJhnL86UrvNv/J+OCTFK4mXOMODVZ4r79O8PEc=;
	b=sbW+KJgKewiATYCJdueqKoDnrvfJv2AEzsc1+p34hMzZp8dyp6L5C0N01M+h3e1G4R6L
	 wYEpwcbZCNAxhnG+NJtxl9ankmy3Vf+Xj3lfhpmc3/zDQt3dqkDcasKPG1/ldlrPq3CXX
	 ohh/mGtTHeoeauLWKmCiHQngqqeHHlX9lr12iigejvuQvFKXpNsxrIWs02z4o1ruZLvrc
	 9LnEGjyK/XhRGoYeOZSaH4C1g0NTdmEqBxbIv2Z5ZXgIv0O2+B2NVI52o81veCAYm3Knf
	 ezn8OFXO2vSUpHXNnwcrwJl2z0vg08JbqwvxFh6fk9IslVRPyjEGP4NHABM2pQ8OqiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJeIE03A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEF6606A31C;
	Wed, 11 Nov 2026 08:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJeIE03A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C4E1F00A05;
	Wed, 11 Nov 2026 08:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794386033;
	bh=Aweo+tJhnL86UrvNv/J+OCTFK4mXOMODVZ4r79O8PEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KJeIE03Av3oZr42uMj+iPjbWDhzQQPdej1CmLdjdS6t4J1M2bWAufKUcozM+lxlob
	 IWBfoLCBvg4+8n5gIqzqgEpVxgT1/BVLzDp6vOWkYLVVfo9redgQOtLRTphLKVZ3D8
	 KacPrhj23LrGa/p0N4QRmixtJdb6PxgQ+bCu2zVIY5oh4fPGk12WCMx8mWBzR10lOo
	 a2pRxXGtLlLTHAa3J85Gu459y8bwMtfKFmc7S6md42pfk0wmpP0u6+fMjVhf0ScdEt
	 P+VdgTkjeM8rrv2PJ0Y7rnEvHg/VTf2V7uELk3tG0WesoIYA0OxTnKmtRQNEM7T+Yy
	 enjTa0vMYP+3A==
Date: Wed, 11 Nov 2026 09:33:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 08/28] dt-bindings: gpu: mali-gen5-am: Add Mali
 5th-Gen AM schema
Message-ID: <20261111-accelerated-pretty-spoonbill-0afdcc@quoll>
References: <20261110153907.3241978-1-karunika.choo@arm.com>
 <20261110153907.3241978-9-karunika.choo@arm.com>
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
In-Reply-To: <20261110153907.3241978-9-karunika.choo@arm.com>

On Tue, Nov 10, 2026 at 03:38:29PM +0000, Karunika Choo wrote:
> Add a separate device-tree schema for Mali 5th-Gen AM GPUs.
> 
> AM_GOVERNOR controls GPU frequency. The GPU node does not accept OPP,
> cooling or GPU supply properties.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
> v2:
> - Move arm,mali-gen5-am support from arm,mali-valhall-csf.yaml to a
>   separate arm,mali-gen5-am.yaml schema.
> - Move the AM GPU example to the new schema and add the interrupt
>   binding headers.
> - Add the new schema to the Panthor MAINTAINERS entry.
> 
>  .../bindings/gpu/arm,mali-gen5-am.yaml        | 90 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-gen5-am.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am.yaml
> new file mode 100644
> index 0000000000000..6349888e1ae2a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-gen5-am.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/arm,mali-gen5-am.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Mali 5th Gen AM GPU
> +
> +maintainers:
> +  - Liviu Dudau <liviu.dudau@arm.com>
> +  - Boris Brezillon <boris.brezillon@collabora.com>
> +
> +properties:
> +  $nodename:
> +    pattern: '^gpu@[a-f0-9]+$'

Same comments as last time.

> +
> +  compatible:
> +    const: arm,mali-gen5-am

Same comments as last time. Seems like you just ignore review, so I will
finish here.

Respond to review. Dropping from DT patchwork.

Best regards,
Krzysztof

