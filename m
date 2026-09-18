Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF66D35674A;
	Fri, 18 Sep 2026 21:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789767322; cv=none; b=DNe4Pi9dSwJb9sokug6ZDP4GZv859Lw1oA0r7Nfr/xB6YSrF4qa0lfsdV8RONc0m9fF3p+Kbszd89I8uNwscaK37E/tkStVXUohoHjfKWAUfRA5GMnPLPnCzUtKK9HUbFECSI3LAA1ZxUyHSOTukNcUOO/u+Ef/F1KHUzeSRc8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789767322; c=relaxed/simple;
	bh=cRJ+PVM/y4zy/Zu1yfhqH5rqt0ISqNKOL1eFVVH+e3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSr8dL1+vdNIuXu6WZ0EntSS2uoDg3rLSL1fUQromNBGLLctDSi4lD52SVinrCdADLzQaEZeqTaAf9Y33BFDz3WTwTP33CqAL5miUs2lvKiy3vKua/3l6EbWSXLd0H/CKUy0dFlCpi1iILMGXy5L5yoN+YzsVRU/Ujprwsa8JxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3D8k9lf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3D8k9lf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333951F000FF;
	Fri, 18 Sep 2026 21:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789767320;
	bh=ej3xKpckrpjvUc2u6qoLx+3TMAOcBxUdzeIFFyYah/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U3D8k9lfVGUmG3mrLdr956SF7/Qr5CBRsP2flicGDEQ75+/x23Gz7gEdh0FeSfeOc
	 PtLQM0QAfD4jSijXXjL4vzXI/6kdfmRD88xSJ3dmf+R3sAyp21mlzRfKw1lTn0TlzF
	 hqAhbwz9JnTygIoS1AqYKAxjH+LxQNrOjuS/SYtCmlfLlojf8j18w8Z9scv2QOkyBp
	 atgWD6pI9o9jsvuHdvoiMD7K1I57B49g/DdD+oFyuxRM89OeePA1MRjBeXiiHtFqZP
	 1dax3Bv/8ODg6IBwW/ZFtA5wD5LFllEGvbfA4UlFc84SJQItxe8xF9MlnBv/5mbZST
	 GvNXUIA+atX0A==
Date: Fri, 18 Sep 2026 16:35:18 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: Add Novatek NT37705
Message-ID: <20260918213518.GA2337779-robh@kernel.org>
References: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
 <20260918-fp6-panel-v2-1-6695c4008920@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-fp6-panel-v2-1-6695c4008920@fairphone.com>

On Fri, Sep 18, 2026 at 04:40:04PM +0200, Luca Weiss wrote:
> Novatek NT37705 is a display driver IC used to drive AMOLED DSI panels.
> 
> Describe it and the panel in the Fairphone (Gen. 6) (BJ631JHM-T71-D900
> from BOE) using it.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/81a3c207-4d8f-490f-8e2a-6f3f4c2acd35@kernel.org/
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/display/panel/novatek,nt37705.yaml    | 72 ++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml
> new file mode 100644
> index 000000000000..1c796599f6fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml

Did novatek,nt37705 get dropped as a compatible, but the filename 
remains?

> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/novatek,nt37705.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT37705-based DSI display panels
> +
> +maintainers:
> +  - Luca Weiss <luca.weiss@fairphone.com>
> +
> +description:
> +  The Novatek NT37705 is a generic DSI Panel IC used to control AMOLED panels.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    contains:

As sashiko reports, "contains" is too loose.

> +      const: boe,bj631jhm-t71-d900
> +
> +  reg:
> +    maxItems: 1
> +
> +  vddio-supply:
> +    description: I/O voltage rail
> +
> +  dvdd-supply:
> +    description: Digital voltage rail
> +
> +  vci-supply:
> +    description: Analog voltage rail
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - vddio-supply
> +  - dvdd-supply
> +  - vci-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "boe,bj631jhm-t71-d900";
> +            reg = <0>;
> +
> +            reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
> +
> +            vci-supply = <&vreg_l19b>;
> +            vddio-supply = <&vreg_l9b>;
> +            dvdd-supply = <&vreg_oled_dvdd_1p2>;
> +
> +            port {
> +                panel_in_0: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> 
> -- 
> 2.55.0
> 
