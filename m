Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D664E4772BB;
	Fri, 18 Sep 2026 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726443; cv=none; b=mljyLna2AG8wpbSfrQ2RLD4sd6+TM/D8I3xyUwMJrbLbcpQbG2GB1TIZ95dK/oxeLFpyua4rtrADQrYkj0fWxkjh9gzvk+DmouJLn3RiUGpTZSC7U62I83cevwB2yqDrX2+APfTgj50Wwhwxj6oahnu7J3etHo3OhOJjBFYDd94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726443; c=relaxed/simple;
	bh=QtFSPOZML7iWivBiJDinPXzJPNKswELe+H1vLxBK3RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXxU/MF6La1MVaYXTi275newm1EOQAfFR1g7tknDvevlJEdBNDOCX+1IJKv1gB6mvsiwNSOVwmO3pYJcN5tWxDojT/L1McvYrAdo6U0HJoX2RewdHj6Vu2y9D1ec8NIY6fwnQx9rQiZlmr41mRlcQhBherGgqy20IAIunuwqWOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2G8rIIC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2G8rIIC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81FA1F000FF;
	Fri, 18 Sep 2026 10:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789726441;
	bh=M2B2XEKjPe4LCjLLw2M8XlMx+q2Zitn3iz8MKERGyWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X2G8rIICM5WKXN3aom0hEklSVCF7mwP5aEG53nQ7igzVoDg+hQYhH/+MMS27XJrRB
	 3YOmh2qvbehAbitA0AvlL51a3SX6h+WCM9tk/wJ4r6+dDn0EOhdgaOo0wBn8Rn3pIK
	 hVyL/Uav/JNYMlwdUfhWtgvZeTzrqlGx5sQmTtjyBgmpL08NTDY06yFO/N1y/tkpsQ
	 c7p1tJ5q75pMfKIOD5ZZMzwRtWiFlv0diBALUHs9jxor95Bxe7MVXPzdGV8p5LPCNG
	 2Th2kQ67I0xkYsB2dt+dwQeXTUgxF7FStQUYp4U1y0U6ILIRTIhGIKARL0slXP4MW2
	 frsv2MyQfhPgQ==
Date: Fri, 18 Sep 2026 12:13:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Adam Azuddin <azuddinadam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, jesszhan0024@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
	andersson@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add RAiO RA8875 display
 controller
Message-ID: <20260918-augmented-holistic-hippo-82acf7@quoll>
References: <20260916175942.3186804-1-azuddinadam@gmail.com>
 <20260916175942.3186804-2-azuddinadam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916175942.3186804-2-azuddinadam@gmail.com>

On Thu, Sep 17, 2026 at 01:59:41AM +0800, Adam Azuddin wrote:
> The RA8875 is an SPI-connected TFT display controller by RAiO
> Technology Inc. It supports display resolutions of up to 800x480.
> 
> Add YAML binding schema for the RA8875 controller, along with

Don use "YAML binding schema". It's redundant. You add bindings.

> the raio vendor prefix for RAiO Technology Inc.

Or better drop entire sentence, not really needed.

> 
> Assisted-by: LLM
> Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
> ---
>  .../bindings/display/panel/raio,ra8875.yaml   | 66 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
> new file mode 100644
> index 000000000000..f6f4867495dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/raio,ra8875.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RAiO RA8875 Display Controller
> +
> +maintainers:
> +  - Adam Azuddin <azuddinadam@gmail.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  This binding is for display panels using an RAiO RA8875 controller
> +  connected via SPI.

Describe hardware, not the binding.

Please instruct your LLM to actually read Linux kernel documentation
before making commits.

> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: raio,ra8875
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    maximum: 25000000
> +
> +  display-timings:
> +    $ref: /schemas/display/panel/display-timings.yaml#

This property is not needed here, you can drop, while still requiring it
in the required block.

No supplies? No reset pins?

> +
> +required:
> +  - compatible
> +  - reg
> +  - display-timings
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ra8875: ra8875@0 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

> +            compatible = "raio,ra8875";
> +            reg = <0>;
> +            spi-max-frequency = <16000000>;

Best regards,
Krzysztof

