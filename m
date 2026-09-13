Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6949232395;
	Sun, 13 Sep 2026 09:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789291885; cv=none; b=MlfJrmAvEdJ4RdOY5Wg/a7VugLzRxA+BjUJAK2lQwXdFqa3TOb5cEFw8W9cietikfOPyE9v65swHVtsH3iNqo2OPfGdBBbLbnQO1tYpUMNuGAqN72HFwhWLxW26zqA6JTVwm0yVwWfBGrQTf0tzA05fnwqiRsRM2YuE9btlTg9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789291885; c=relaxed/simple;
	bh=og6+0nJwNmpP492I8odpqMFLOss5JEcXC+lEAzM7McE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qw/+jC2sTefm8r5TJ/iVqJZ3Cxh7S+R9gM9yujZe98iwyq+kKbywRcy2rGR7O3Kji4WbJCxzsEHGa8FKujcXxWdtdOAPlOQ1+VZfGs+qLicQQrPo+JdzF3thkOfJ2ujjcyUlm2XUa4yQ+AItebFiVzDKWuG1poitaviavxQ6LBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f18M25m1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f18M25m1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CA31F000FF;
	Sun, 13 Sep 2026 09:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789291884;
	bh=NoI29qaUrBCrJ0UkngJFgdYXXciOF2qxoCQ5axDHzew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f18M25m1UE+mSGxC0FC2S/zGAVqpWLM0UCXkD/aytZ4FMn2/cWbwLJy3HfYlSkvW8
	 hgj+xt8axoK2I8tcV86Sd3AVCYlCQ9TUyhQ9jxYGOvwEfmE/fR7BdxezPB/xHkAKg3
	 /aON78c5tK/KLj453p9eTE3fYCMovFw9xNsyGTJgvVNZskjYrmeBxqa1RFsINlyzLj
	 pDAe4vy0Jn/lIPJLIY40RMQB7Lsk5Iv21NJ2RXO3qNEzd4gKRm1sh2Yq5wNiXlEmDK
	 7xOPh5z2zuWBiTStWepnOYjJ/zywSDYKqeaSQ9CVP1m8Jd5e11FzUkF63ZG2hyrNsf
	 DZ3ocqIDkz18g==
Date: Sun, 13 Sep 2026 11:31:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ryanbrue.dev@gmail.com
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: Add bindings for
 Novatek NT51021
Message-ID: <20260913-fearless-bloodhound-of-poetry-1c8ffe@quoll>
References: <20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org>
 <20260911-qcom-novatek-nt51021-panels-v2-1-135e3190a7fb@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911-qcom-novatek-nt51021-panels-v2-1-135e3190a7fb@mainlining.org>

On Fri, Sep 11, 2026 at 06:38:00PM +0300, Nickolay Goppen wrote:
> Novatek NT51021 is a display driver IC that can drive DSI panel. It
> is also present in the BOE TV101WUM-NX0 video mode panel, which is a WUXGA
> panel with a resolution of 1200x1920 and 10.1 inches size. It is found in
> Xiaomi Mi Pad 4 Plus. Also it's present in the BOE-TV080WUM-NX2 video mode
> panel, which also has a resolution of 1200x1920, but 8 inches size. It is
> found in Xiaomi Mi Pad 4.

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> 
> This patch adds the bindings for display driver for the IC, with support

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> added for this BOE TV101WUM-NX0 and TV080WUM-NX2 WUXGA video mode panels.
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  .../bindings/display/panel/novatek,nt51021.yaml    | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
> new file mode 100644
> index 000000000000..550aefaead46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/novatek,nt51021.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT51021 based DSI display Panels
> +
> +maintainers:
> +  - Nickolay Goppen <setotau@mainlining.org>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The NT51021 IC from Novatek is a generic DSI Panel IC used to drive dsi
> +  panels.
> +  Right now, support is added only for a BOE WUXGA LCD display panels with a
> +  resolution of 1200x1920. They are video mode DSI panels.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - boe,tv101wum-nx0
> +          - boe,tv080wum-nx2
> +      - const: novatek,nt51021
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: phandle of gpio for reset line - This should be 8mA, gpio
> +      can be configured using mux, pinctrl, pinctrl-names (active low)
> +
> +  vdd-supply:
> +    description: phandle of the regulator that provides the supply voltage
> +      for digital circuits
> +
> +  avdd-supply:
> +    description: phandle of the regulator that provides the supply voltage
> +      for analog circuits
> +
> +  havdd-supply:
> +    description: phandle of the regulator that provides the supply voltage
> +      for analog circuits
> +
> +  port: true
> +  backlight: true

You can drop these two

> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - avdd-supply
> +  - havdd-supply
> +  - reset-gpios
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |+
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi0 {

dsi


Best regards,
Krzysztof

