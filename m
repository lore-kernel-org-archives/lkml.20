Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F78362138;
	Mon, 31 Aug 2026 22:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788215951; cv=none; b=BQyrdgbgzdiy6JO2CHGWGQW0MY95l8jJfIJ5W+9ECglGQTvH20gOlUIhK3UoH1MogXKrAjN8sPDNEeujt8Ggh/EwGkmtYiMVVZ1evWcQNaCWOMY3Ei5YdGtqv5JBNBNEms6+mbhNe/fC5W5ZkMva5kvF1/b2kL1lcN5dt/w4GiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788215951; c=relaxed/simple;
	bh=Jo0Dqa4f0OQM+TQSxhYX6bH9M6j4+4/eRDZJhvejqg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moZN17+d/0CVsAPLBcYbq3cPGoiF1CPtGCO35NqaOj0psPi3vC1MkRl9OjkBl3L0SwuQeUK3SaZdesuHI2BJPgrhLnVku/DTzmpQ5inZIGP1UCqfif8o0G7WLRAuScXSAQ57NUN2zMy2NZDMykKYUHRVQWNviXBGhYYoiXWNIos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSGHsVy0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSGHsVy0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E101F000E9;
	Mon, 31 Aug 2026 22:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788215949;
	bh=NgLuCSc5MZRS8g/zjyDJLlD9wWkbg/zA6QcbJG+zlaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cSGHsVy00l3fsBa/egcf9AsdUP/JsF85nroEWi+0N8R8Nh1WBKFqZRP3czxyOlCBH
	 bMSadqlJo/dsW8m2xyHeYnLN1X+RZ26qn49tpLWAr63NKdR8kx2S5E0DAIlacHtbSh
	 LhNS3G9Bwa/V8PmxKltU370XrN7glRYSrEkbDePNxFt1eCZPZsqUGKW2ZYQiZdkm5y
	 KHmGOB0qsZJrZFzJ9Hl6zh77c98yTeoUN/nLoDoLp1OsBtVJjOqI45qXL+Q8pszLZh
	 tjYwsCr/6oYpW16dnH4URUQpIL3Zb6vflwezuGc0K/L0xbmCd7xBlTUTmREIoOxH5T
	 YJ6AbtvRnIShA==
Date: Mon, 31 Aug 2026 17:39:06 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/8] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
Message-ID: <apYCal5G0S9cOWJf@baldur>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
 <20260831030147.1500616-2-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831030147.1500616-2-elson.serrao@oss.qualcomm.com>

On Sun, Aug 30, 2026 at 08:01:40PM -0700, Elson Serrao wrote:
> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
> High-Speed UTMI paths depending on the SoC. For example, SC7280 supports
> EUD on the primary UTMI path only, while SM8350 supports EUD on both
> primary and secondary UTMI paths.
> 
> Each UTMI path connects an independent USB controller/connector pair and
> forms its own role-switch domain. EUD routes traffic based on USB role.
> In device role the debug hub is inserted, while in host role it is
> bypassed.
> 
> The existing binding models EUD using a flattened ports representation.
> While sufficient for fixed device-role configurations, it cannot naturally
> associate a controller, connector, and role switch with a specific
> EUD-routable path. This is problematic for role-switch capable ports and
> becomes more pronounced on SoCs with multiple paths. In such cases, each
> path forms an independent role-switch domain and requires per-path role
> awareness.
> 
> Model each UTMI path as a separate child node with its own OF graph. This
> representation is used for role-aware EUD routing regardless of whether a
> SoC exposes one or two UTMI paths. Add an SM8350 compatible for
> dual-path EUD topologies. Retain support for the legacy flat ports
> representation on SC7280 for backward compatibility.
> 

Acked-by: Bjorn Andersson <andersson@kernel.org>

Please merge this together with the driver changes.

Regards,
Bjorn

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---
>  .../bindings/soc/qcom/qcom,eud.yaml           | 134 +++++++++++++++++-
>  1 file changed, 133 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> index 84218636c0d8..c377a77d623c 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> @@ -18,6 +18,7 @@ properties:
>      items:
>        - enum:
>            - qcom,sc7280-eud
> +          - qcom,sm8350-eud
>        - const: qcom,eud
>  
>    reg:
> @@ -45,10 +46,88 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: This port is to be attached to the type C connector.
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^eud-path@[0-1]$":
> +    type: object
> +    description:
> +      Represents one High-Speed UTMI path that EUD intercepts. Use eud-path nodes
> +      to associate role-switching behavior with specific port connections, allowing
> +      EUD to manage role transitions independently for each UTMI path.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: Path number
> +
> +      usb-role-switch:
> +        type: boolean
> +        description:
> +          Indicates that EUD relays USB role-switch events for this path and
> +          performs role-dependent UTMI routing accordingly. In device role,
> +          the EUD hub is inserted into this path to enable debug
> +          functionality. In host role, the EUD hub is bypassed and UTMI
> +          traffic flows directly between the PHY and the USB controller.
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +        description:
> +          These ports are to be attached to the endpoint of the USB controller node
> +          and USB connector node.
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: This port is to be attached to the USB controller.
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: This port is to be attached to the USB connector.
> +
> +    required:
> +      - reg
> +      - ports
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
> -  - ports
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sc7280-eud
> +    then:
> +      oneOf:
> +        - required:
> +            - ports
> +          properties:
> +            eud-path@0: false
> +            eud-path@1: false
> +        - required:
> +            - eud-path@0
> +          properties:
> +            ports: false
> +            eud-path@1: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8350-eud
> +    then:
> +      required:
> +        - eud-path@0
> +        - eud-path@1
> +      properties:
> +        ports: false
>  
>  additionalProperties: false
>  
> @@ -77,3 +156,56 @@ examples:
>              };
>          };
>      };
> +  - |
> +    eud@88e0000 {
> +        compatible = "qcom,sm8350-eud", "qcom,eud";
> +        reg = <0x88e0000 0x2000>,
> +              <0x88e2000 0x1000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        eud-path@0 {
> +            reg = <0>;
> +            usb-role-switch;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    eud_usb0: endpoint {
> +                        remote-endpoint = <&usb_1_dwc3_hs>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    eud_con0: endpoint {
> +                        remote-endpoint = <&pmic_glink_hs_in>;
> +                    };
> +                };
> +            };
> +        };
> +
> +        eud-path@1 {
> +            reg = <1>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    eud_usb1: endpoint {
> +                        remote-endpoint = <&usb_2_dwc3_hs>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    eud_con1: endpoint {
> +                        remote-endpoint = <&conn_2_hs_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 
