Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26AB2E7F39;
	Fri, 11 Sep 2026 08:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116827; cv=none; b=sz9vb11xATi/Pl/HnIQZCgW6dyoii4XXKGSX1Mg8FxphkH6Hrc359BFRVY2Bcd9ORd1ZvjpspBIm4WJ4XGwYRtYbVNWrcDaizEZBf4VYcajDMsl75URx7YZpY84qCff4UqP5EyUkio90Zafvg+n0AI2z6wxqIb34RgmX3oi+XdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116827; c=relaxed/simple;
	bh=hKG5P0tTq4RzoNZpCTbQPdMBJ2cV3b+axlhcsqqp73o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZCAOPcniOBVYvfCEDSvvYNTvF/1apyKG6J87Cja4Uq7dpEfcuBjoWDQGLY2VLFK3UcV8A+7xoGu16Bs110Kdg1djV9LVD14OxDnzsrXmx22bCoZcEutEs0gHikhztMhXizxpnBV0tXxr1ZO3GRDOoGgItfcOle1atkbsMai5Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8jmrs9P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8jmrs9P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D671F000FF;
	Fri, 11 Sep 2026 08:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789116825;
	bh=kgSConEeaNKwRfeQHsprcVAJQzgQ9r9vYuhm0YayU6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h8jmrs9PBevDtTd4sRaOokYoR/qPc8H6BRrhVczX7pKyCqtn8SCIwEFXZ0Q1zROcq
	 qP1eN9mIcpaxU8sFS5UPNg+ypt/CSSErUM5W8u8ynQnrvTC2TwRxRoLpJ3lfYhKejC
	 /VcFj+a+7i/MFJb9v9GCwfgi2uMuxbplTdWG9G85NIvMpWhrwLuPxyfVb47en2fKXQ
	 QoCra8sH/NOy3fhvCNQ9QNxc+RxTR1ANnn4LLHNP1p5rUwXYTdP1z/0K3+f/j5cI/F
	 /NTOvtaMmYwVqK7nLDR9qI5TF/9FhOy+ayL5cw8W03+eXzHvh2i2XGMKtkiCoLTEB6
	 OkDjkiv3boAaA==
Date: Fri, 11 Sep 2026 10:53:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Luca Weiss <luca.weiss@fairphone.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: dw9800: Redocument DW9800K
Message-ID: <20260911-savvy-gazelle-from-tartarus-4ebddd@quoll>
References: <20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com>
 <20260910-b4-dw9800k_cleanup-v1-1-608255ea61ab@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910-b4-dw9800k_cleanup-v1-1-608255ea61ab@fairphone.com>

On Thu, Sep 10, 2026 at 04:54:16PM +0200, Griffin Kroah-Hartman wrote:
> The DW9800K's properties are too different to justify sharing the same
> bindings file as the dw9719, Create a separate bindings documentation

Say here something useful which not immediately visible from the diff -
which properties are different?

> for the Dongwoon Anatech DW9800K with it's updated properties.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  .../bindings/media/i2c/dongwoon,dw9719.yaml        |  1 -
>  .../bindings/media/i2c/dongwoon,dw9800k.yaml       | 91 ++++++++++++++++++++++
>  2 files changed, 91 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
> index 8e8d62436e0d..38db0764c0f7 100644
> --- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
> @@ -21,7 +21,6 @@ properties:
>        - dongwoon,dw9718s
>        - dongwoon,dw9719
>        - dongwoon,dw9761
> -      - dongwoon,dw9800k
>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
> new file mode 100644
> index 000000000000..046c0a88bcef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9800k.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dongwoon Anatech DW9800K Bi-Direction Voice Coil Motor (Bi-VCM) Controller
> +
> +maintainers:
> +  - Luca Weiss <luca.weiss@fairphone.com>
> +  - Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> +
> +description:
> +  The Dongwoon DW9800K is a single 10-bit digital-to-analog converter with
> +  +-130 mA output current sink capability, designed for linear control of
> +  bi-directional voice coil motors (Bi-VCM) in camera lenses. This chip
> +  provides a Smart Actuator Control (SAC) mode intended for minimizing
> +  mechanical vibration.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - dongwoon,dw9800k
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: VDD power supply, can range from 2.3V to 4.8V
> +
> +  dongwoon,sac-mode:
> +    description: >
> +      Slew Rate Control mode to use: direct, LSC (Linear Slope Control) or
> +      SAC2-SAC5 (Smart Actuator Control).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # Direct mode
> +      - 1 # LSC mode
> +      - 2 # SAC2 mode (operation time# 0.48 x Tvib)
> +      - 3 # SAC3 mode (operation time# 0.72 x Tvib)
> +      - 4 # SAC4 mode (operation time# 1.20 x Tvib)
> +      - 5 # SAC5 mode (operation time# 1.64 x Tvib)
> +    default: 3
> +
> +  dongwoon,clock-presc:

Why this cannot be named the same? Commit msg should answer such
questions.

> +    description:
> +      Indication of VCM internal clock dividing rate select, as one multiple
> +      factor to calculate VCM ring periodic time Tvib.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 #  Dividing Rate -  2
> +      - 1 #  Dividing Rate -  1
> +      - 2 #  Dividing Rate -  1/2
> +      - 3 #  Dividing Rate -  1/4
> +      - 4 #  Dividing Rate -  8
> +      - 5 #  Dividing Rate -  4
> +    default: 1
> +
> +  dongwoon,timing-control:

So it seems you have only one different property, quite a difference
comparing to bold statement in commit msg?

Best regards,
Krzysztof

