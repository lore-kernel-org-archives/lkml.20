Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F69DF72;
	Sun, 13 Sep 2026 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789292324; cv=none; b=l+uN3mid7bmwfkuKuFHpTqDBhoqRcXrc/XFbZBp4FVFN2IwkkmZQVOulmJ8tfezMpwKzf9cfbdWroPeE7yUS1uRpOJkvBhDp7nwIVEbDjUNbpYr0gVjD2isEph/SHOz7+KIF4ck9AWEvj8m/0PG+d8wLiEUkWwfbNJe/QbT+1d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789292324; c=relaxed/simple;
	bh=SgT+GZViOsLE/gWOqh5auM2q1L5EpP+0aGn3DM5NbQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BX745V0VDDV4y/GQKNk/oQ84oDcuQLJ1DrnJ1rKQmJmx8PgHTdp5LCXTihHoljTwkrJZp3BYjahirs1NWOM1ZoNCA/i7yBOjMk6kQMfyUWM/nNtuVExJTilAeYKCf4B/uZivXvGyG1/za4v5jxbtDZvDTAOJXheh0jezAmt8WnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJmaS8OG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJmaS8OG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243121F000FF;
	Sun, 13 Sep 2026 09:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789292322;
	bh=ZR8/XvZpu6CEn400z/4mVVRkUpepYVnx7Lvac3s0vvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QJmaS8OG0bH7S2h3wqWn9dtxr8SOpQ/+1/1NLiaXS2NWnK2JrqYGm2rbzaifGM8p5
	 iX4acB3B6f96E/kHzvxLTZJD7Gao4XLu/MNKF5CYD7CH2xdHFO5Z58Lwpf0kb02sSE
	 Pe+QHtniBCzc/2I/P99ibYawHmkFl4CIdX4Wihu0/g9JuzJ4LsWL+tmLl5uF6SsIsY
	 i0mBzLGuyYUDkzMk58xCwN2Q03TJ6VT0pqYvDQHQL4rG1efuamOMNB+Bzo69DzOqvo
	 bGUBJLI5zjiSoBwzRSTkCfa+OzrgFUU0t1W9AknLtxT7i24RhUT0QuVqYLSXnv0Xhr
	 swPWCjDGoFxhA==
Date: Sun, 13 Sep 2026 11:38:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: sound: amlogic: add schemas for audin
 components
Message-ID: <20260913-sophisticated-musical-grebe-6e7e42@quoll>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
 <20260912-audin-v1-1-7fbefe928711@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260912-audin-v1-1-7fbefe928711@baylibre.com>

On Sat, Sep 12, 2026 at 12:14:31AM +0200, Valerio Setti wrote:
> Add schemas for "amlogic,meson-gx-audin" and "amlogic,meson-gx-audin-fifo".
> They provide I2S audio input support to the Meson GX platforms (GXBB/GXL).
> 

A nit, subject: drop second/last, redundant "schemas for". The
"dt-bindings" prefix is already stating that these are bindings so
schemas.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

OTOH, subject prefix is incorrect.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  .../sound/amlogic,meson-gx-audin-fifo.yaml         | 52 ++++++++++++
>  .../bindings/sound/amlogic,meson-gx-audin.yaml     | 96 ++++++++++++++++++++++
>  2 files changed, 148 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml
> new file mode 100644
> index 000000000000..a01fe22b9786
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,meson-gx-audin-fifo.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic GX AUDIN FIFO controller
> +
> +maintainers:
> +  - Valerio Setti <vsetti@baylibre.com>
> +
> +description: |-

Drop |-

> +  AUDIN FIFO receives audio data from backend interfaces (ex: I2S, SPDIF),
> +  stores them into a FIFO in a configurable way and then bulk copies all the
> +  data in RAM when the FIFO is full.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller@[0-9a-f]+$"
> +
> +  compatible:
> +    items:
> +      - enum:
> +          - amlogic,meson-gxbb-audin-fifo
> +          - amlogic,meson-gxl-audin-fifo
> +      - const: amlogic,meson-gx-audin-fifo
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    audio-controller@80 {
> +      compatible = "amlogic,meson-gxbb-audin-fifo",
> +                   "amlogic,meson-gx-audin-fifo";

What sort of Spc is amlogic,meson-gx? git grep gives me zero (and family
names are not allowed, see writing bindings).

> +      reg = <0x80 0x1c>;

Are you sure a few registers are a separate device? No other resources
here and this is child of audin, so really does not look like a
separate device.


Best regards,
Krzysztof

