Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EC54BE43B;
	Fri,  9 Oct 2026 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555520; cv=none; b=J0lqGdQVYR7jiYnVBRSU++P7a//ixeQ+yuSrkd+sYUF/rEsVhwLF+oOwCotifGONoZpOwd1rjsgS1C1a+3Dw8JPFOcaZ8SRiX67I5Hrl+u2gCVO04q63sUuLU6Q8jowNwHCC2vpneCBRzzDZAzxHuKknaETZc0Ex+23ZZqtC1vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555520; c=relaxed/simple;
	bh=pLsCv1AilydwUHMJaa4zC/aXwSEh5JIpxdEsDR7eI8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rx2L+M8mLQf+u3gPQzofcer7osRIaALSxzW1eV3Hra3IrLrCfqwymSD8wndY58IifAGdM+0Yy/XOK+QLuqkxs0ajGr1TozUhSqTSVyceTZ0Uh4eTc8gM1tzHe81zNLmU/qKIC7u4ILhwoheUZEGxz4TK4lgnHrsavMLf0b2yIa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUKv80xn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUKv80xn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181D41F00893;
	Fri,  9 Oct 2026 14:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791555518;
	bh=P1xT8kIEPQsNlllxKNcDEkZl+24WAzqvZIpeRT/H2QA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CUKv80xnqp9wtqp/jx9LsP21bSwE648OTT9sAp5YbntX3nG+YcSdwSUC/oIJgxYjQ
	 CVpIrzIVLMcr0c0CCWD5b0spCReKAv7PYYXrA1x9ZTGU9emPu838Y4V7yNfIXGTf0V
	 pPpiJADOxFvVy4UwSGBNUWloJhrtFh2Ec2HCeHBzXNoGiDAP06ZNDFfC6t2AT5sbsU
	 hCwyfTQElhCcuQ2FI017sAQ5p22kKts54V6y5gF73ERYcoVw4O5vIymsMnfKP1/Zwp
	 X0mC34uWjb4q+EudakKEqTgcT/l/Jcryj/+026ANJciKsXVQCfrZtko1pR24VpLuNj
	 /+MbZTfmEGg1g==
Date: Fri, 9 Oct 2026 09:18:37 -0500
From: Rob Herring <robh@kernel.org>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	p.zabel@pengutronix.de, cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Message-ID: <20261009141837.GA1661224-robh@kernel.org>
References: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
 <20261009092552.2377960-2-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009092552.2377960-2-joakim.zhang@cixtech.com>

On Fri, Oct 09, 2026 at 05:25:49PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add the DT binding for the Cadence I2S-SC controller integrated in
> the CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo
> controller supporting standard I2S, left/right-justified and DSP
> formats, plus TDM operation with up to 16 slots.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/sound/cix,sky1-i2s-sc.yaml       | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
> new file mode 100644
> index 000000000000..3fdf2334c492
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/cix,sky1-i2s-sc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence I2S-SC controller
> +
> +maintainers:
> +  - Joakim Zhang <joakim.zhang@cixtech.com>
> +
> +description: |
> +  The Cadence I2S-SC controller integrated in the CIX SKY1 audio subsystem.
> +  It supports full-duplex stereo playback and capture in standard I2S,
> +  left/right-justified and DSP modes, as well as TDM operation with up to
> +  16 slots. The transmitter and receiver are started and stopped together
> +  by the controller.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: cix,sky1-i2s-sc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: hst
> +      - const: i2s
> +      - const: audio-clk0
> +      - const: audio-clk2
> +
> +  resets:
> +    maxItems: 1
> +
> +  dmas:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      One DMA channel for instances wired for a single direction, either
> +      "tx" or "rx", or two channels for both transmit and receive.
> +
> +  dma-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum: [ tx, rx ]
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - dmas
> +  - dma-names
> +  - "#sound-dai-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    audss_dmac: dma-controller {
> +        #dma-cells = <1>;
> +    };

Drop. We don't put providers in examples. What example made you think 
you needed it? And if you do, why not the clock, reset, and interrupt 
providers?

Rob
