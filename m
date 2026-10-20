Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481913;
	b=AyP73/CZDoQ+Ptkdtg4x/ZhoOt04zIkoVtgoWVpcN3IuSIM474Fasz5RNYBa6dh613VH
	 YbbwmWyIb4kQ6dcToQu8H/mtsYK8WKFKfivTKiJph+tuOiY4MrJJ2MBm6LWxMtxEsmA5t
	 ctf5R0xoXiIVHyV/5mCchJbY6iMDPfmNfbdBYdPGZKvBhgNIQ1zRjjDSAFqIW6IPvaKsz
	 1kBZtla1RZmY8eQy6C9tAgOQBFCxlrTBbh3jM6dPyRf0DsxQzFwaSq2eVn4kB1PzjQWcU
	 JbeWv493U0wAWt4O27HCOuiJ5kQ+iokvwCdTyfCZpDQgP6CzbqlitY8TArmMf5dQ0hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481913;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oz6wrkWaiEX/dh/gMZoaUenwuxXGqpb8c6cRP28y4OA=;
	b=OP+W6joSwqm57pbSFDymc06S8Z2VyBB99q4WCqj6mn3fc0ERK/lcx3qYV4Cmdv/QJeRS
	 BYhQlBJ8ZhLOGeg1dVZjtGNRJbR+JTiP030jC0hF2WNZf0v1fKVoSqpHr3I7hzYREvoAW
	 l9Ju0PRxUz1w2r6BIDkfjb/BdPi4Ui391uBrYSdP48qwY0QZ7hfNuqMnHN17RrDBhVmWA
	 cBJyC0vVS7X6X2DHpzpqNt+g5gOKzLEBf/jycxlvCY2BVbHkv5JdFDtNZedaeRV7M1jEW
	 gBMaJWScG8MGydS6OaJDaEhw0Rlops1UPRe/ItJsTCcw/QVxUvOVxwZImOits0nv2zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YqOhXFPY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD6E606A319;
	Tue, 20 Oct 2026 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YqOhXFPY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04D01F000C4;
	Tue, 20 Oct 2026 07:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792481912;
	bh=oz6wrkWaiEX/dh/gMZoaUenwuxXGqpb8c6cRP28y4OA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YqOhXFPYgdaEkMMpfic3LrP+uQ2qIoUigKmyROg8/Y+7lcFjWc3nufb17duq+a8sX
	 T0J+X6XyNhwhrBoMGpBchKch3+KzTxVVmy7e7U/Xnma33dt7T4EBPlP7Cv/UihCbdu
	 eUZotqcMOU7VJZeKwZEBlDpDSZPxwnb1x0p7r1IvREg5AO4VdnEeQoKpNtS4yYC+9H
	 R/HczxB2W/PKjIq39KMY4Fs5DZQee3OtczbtA6NA7K3d24ChfWP1vny2TAOTFgcjk5
	 E8+NIAGr79w1QWHPUwHNvExiLb1gQrBwS57l5xqR8M5KA1/Q7BAS191JJotnNTIoSk
	 am7jbcVSbnO4g==
Date: Tue, 20 Oct 2026 09:38:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: fsa4480: Add an optional audio
 port/endpoint
Message-ID: <20261020-muscular-quizzical-elephant-fbb0e7@quoll>
References: <20261018225906.1265299-1-val@packett.cool>
 <20261018225906.1265299-2-val@packett.cool>
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
In-Reply-To: <20261018225906.1265299-2-val@packett.cool>

On Sun, Oct 18, 2026 at 07:58:56PM -0300, Val Packett wrote:
> To actually support analog audio output, the fsa4480 driver needs to
> deliver the hotplug notifications over the Type-C graph to an audio
> codec driver. Describe a second port intended for the codec. Keep it
> optional to make sure existing device trees do still validate.

Argumentation is questionable. We do not add bindings/DTS to represent
driver needs, but actual hardware connections, so please rephrase. See
qcom,wcd9390-usbss for examples, as it is the same block basically.

> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 90 +++++++++++++------
>  1 file changed, 63 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
> index 89b1fb90aeeb..9dfe95b6adf3 100644
> --- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
> +++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
> @@ -9,31 +9,11 @@ title: ON Semiconductor Analog Audio Switch
>  maintainers:
>    - Bjorn Andersson <bjorn.andersson@linaro.org>
>  
> -properties:
> -  compatible:
> -    oneOf:
> -      - const: fcs,fsa4480
> -      - items:
> -          - enum:
> -              - ocs,ocp96011
> -          - const: fcs,fsa4480
> -
> -  reg:
> -    maxItems: 1
> -
> -  interrupts:
> -    maxItems: 1
> -
> -  vcc-supply:
> -    description: power supply (2.7V-5.5V)
> -
> -  mode-switch: true
> -  orientation-switch: true
> -
> -  port:
> +$defs:
> +  controller-port:
>      $ref: /schemas/graph.yaml#/$defs/port-base
>      description:
> -      A port node to link the FSA4480 to a TypeC controller for the purpose of
> +      A port node to link the FSA4480 to a Type-C controller for the purpose of
>        handling altmode muxing and orientation switching.
>      unevaluatedProperties: false
>  
> @@ -69,15 +49,56 @@ properties:
>                    - AUX+ connected to SBU2
>                    - AUX- connected to SBU1
>  
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: fcs,fsa4480
> +      - items:
> +          - enum:
> +              - ocs,ocp96011
> +          - const: fcs,fsa4480
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  vcc-supply:
> +    description: power supply (2.7V-5.5V)
> +
> +  mode-switch: true
> +  orientation-switch: true
> +
> +  port:
> +    $ref: "#/$defs/controller-port"
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: "#/$defs/controller-port"
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          A port node to link the FSA4480 to an audio codec in order to
> +          notify it whenever an analog audio adapter is plugged/unplugged.

Same here

Best regards,
Krzysztof

