Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B8039DBD0;
	Fri,  9 Oct 2026 14:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555373; cv=none; b=u5AtN6pl/0eLoeowrsstmTzAY20MkY6tcbqDQMWupc2zMXZDnFU7KmqQSP3E6w1VqySdLBkTvgws3/4cK05edDgBjh/3gJoM7ULyhti57BG4kLNz3jV6rqye9x21D87AhIgb/2LxfK3XPkFiu59UkLHtWMjp8Lz8h+e2MCzQpg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555373; c=relaxed/simple;
	bh=HTto4x29Ky4tDdeScCouFY7b2C9/lvm82cKNmIN/yoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3iFRg7IxJ99UKYXJlQ2u0xn3xuHtUX4ppcVuUjNgGyprUhsdpMFOIdWCf7dpACZLJ49ZHsyraOU3NBkx2MZ+PTSfBZoPG2oVtthtFjmRxXo4FlANqeBpkaF1/fMsNyd4C9QThdqSISHFAC8n3P5sB8CFfErFep4Ciz2cGtajDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhUolgjd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhUolgjd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4051F00899;
	Fri,  9 Oct 2026 14:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791555367;
	bh=5mp4RnMe0TQZxUQ96A2OqhWXQwIeoTHhlaxX50LfJic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NhUolgjdT4xFpIJaLDiSOW9Fx/3UcRQiVWOExlWtRlCM+JExiGowDMCEGSwHEtnfG
	 ph4wqLPlHYk3yHyFYgdaKKtAyhZlxIg5rePCMSle3N1m4N5jiRI0F+rgc0gximz4gE
	 HGwESaoEV9h/0JQAZUI08YZSUbHyZ9sFXY+BChVjyCiyX6qDSXiKnPPVk/kEPsgUkK
	 r7ufkRbdRpisjOQFOJjrKaEfoBU9kyzf3L/GYQ6wamC0qP+2zHNBbCo6JhBEByZiy2
	 X8dhIJURzCuVSDrzN8zUtJzynOeqbp1KMhhSh7ZxwHKdzTKNBeMKGugL3GqLWPcaHp
	 WL8H+/u39/mpA==
Date: Fri, 9 Oct 2026 09:16:06 -0500
From: Rob Herring <robh@kernel.org>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	p.zabel@pengutronix.de, cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Message-ID: <20261009141606.GB1631855-robh@kernel.org>
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

Address the sashiko comment.

Rob
