Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999318;
	b=Fm9b48ReBQbHsExURJ8uZqORHKn1Mj9pIHWLZ8Nqg7Z4nS8QOQ3QZMdh9bbf3PNN7D7l
	 BiK0/yjjA5fPc5F4qu1g6p8i0Sd0006QwkzOytfJMfIVnY5m5IPRLABv1HbCTOzjNbg+h
	 aRXetmkVNpPQy8izMaD7eree3UmNPifeZt0Jl07MsZMHFMKjv8WCamlDZATHd55/gDE3c
	 MIOSSWM4/wqgSVy93KPC4AW+Ak7AV3FgtbKzg2pqt22vgP0wKmhex1OHqoMxWhRVNXy2v
	 wCCHPJvzejRRohKyuow2gG6JLC+I8/OdknBeppPGBU9zmnIR5WDVIzPFoAwrNr++IoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999318;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=A9EGVBKkrkz1X1MPL0NIUMm6e0BXOgjEpTvvw/7s/20=;
	b=SgALe7etdKmN5ltArB5kyOHCNvJYFVU9iHhbEIIgmhZNM26GBwzGFNEf+qHyJEncX2Av
	 M7cCMM2qzQ7djdWaUDS6lTuZWfERm/q2XPRSnxguRhwQ7UEfhPOClVsPfSLSw4ZcVAK5f
	 epCbuBUknToi1oHD9k8WhN8nu3KqJLV07dHG4oDDFIEE87J5zpoNfZKSztnp8u3JhikNu
	 g1EPMBx3rw8jqIkaU9y9i8jvLpsdrn+TKjKeYc7kwomULWC9w5xv/nO3plRuMX6TkTedD
	 6ivWMb6uwrZBIucZdrgD9vPTV9PSEQ/Ix0xMIMoLIxyTiHyIWvNPdUq1t33UP9NWzew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ItyfWi21;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16889606A31A;
	Mon, 26 Oct 2026 07:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ItyfWi21
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FC01F01825;
	Mon, 26 Oct 2026 07:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792999317;
	bh=A9EGVBKkrkz1X1MPL0NIUMm6e0BXOgjEpTvvw/7s/20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ItyfWi21wEo1RismX/BZZZ3L9JrNV7K+fx+vGxsiR+zLmr0JARZEaElYMbMcP7aJl
	 aJaYmW92PibTGdZBxibriScjNFjREcQ/mRi/cix/KRPniU+nh2wrGRXvIwwfuL9SH6
	 Rop9dnzO6ed1qE/Mfdk4vrm5RRNCZnROUHxZAeoswFo1GAoYHQcRlXXIX2SNRatail
	 ASAaDlf2B01L6mxDViCLvW+I8ir8AFwGHejlwDuhU6/Igypr+zoUNSp5eEVFtOX0Vd
	 mp+zg/zF4xxjj5Iz8fP3OSR5Fw7k2uEcNNhi4P571v3Nk72eHd5SD7cvNg1nNt/MkS
	 CIWdlY+FGxn0Q==
Date: Mon, 26 Oct 2026 08:21:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lars Rask <lars.rask@axis.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	kernel@axis.com
Subject: Re: [PATCH 2/2] dt-bindings: display: sitronix,st75156: add example
 for SPI
Message-ID: <20261026-judicious-exotic-beetle-a5d7ff@quoll>
References: <20261022-add_st75156_support-v1-0-582525a39a39@axis.com>
 <20261022-add_st75156_support-v1-2-582525a39a39@axis.com>
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
In-Reply-To: <20261022-add_st75156_support-v1-2-582525a39a39@axis.com>

On Thu, Oct 22, 2026 at 05:31:06PM +0200, Lars Rask wrote:
> From: Lars Rask <lars.rask@axis.com>
> 
> Add example for using st75156 with SPI.

Your patch does not add example but entire binding. Please describe your
patches appropriately.

> 
> Signed-off-by: Lars Rask <lars.rask@axis.com>
> ---
>  .../bindings/display/sitronix,st75156.yaml         | 67 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 68 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/sitronix,st75156.yaml b/Documentation/devicetree/bindings/display/sitronix,st75156.yaml
> new file mode 100644
> index 000000000000..a3897ddc5e38
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sitronix,st75156.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sitronix,st75156.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sitronix ST75156 Display Controller
> +
> +maintainers:
> +  - Marcus Folkesson <marcus.folkesson@gmail.com>
> +
> +description:
> +  Sitronix ST75156 is a monochrome dot matrix LCD panel used in SPI 4-wire mode.
> +
> +allOf:
> +  - $ref: panel/panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: sitronix,st75156
> +

Everything looks the same as sitronix,st7571, so why this cannot be
added there?

Best regards,
Krzysztof

