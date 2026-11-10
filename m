Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298572;
	b=NW0ULlN6KD6p4tfUsXjvWyAqq/lRvrdTOVPU44wydCXv4e2Ewe50KHePVrTkDQ4SZib1
	 gnmLmYfrfTnwiUPBviKbrQ7grd+8hHMsGLw+7iur1IyemPrZj4ErPN7lNV4ro1KEm21td
	 4ZOeGAhtFr+NMg7i+ZOS/kDQr1zNGp7ADP5Yj9jKFPm1Ta6ru2Vg5jiy17gBE/qgEYmLX
	 52PCfx3IeTD0GAw5vvT2030x7lYQE5h7TMhBgAj01+ZZXWMQGagk7YB7smjmcjqpRRRNR
	 B9/GPpq2nCUnyDc//0N9KfbIlDXpEbYfAZO+dGOWFkidIx5mjZ+/6ufuUs+vV8x1tTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298572;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vnhLj9uQ2n0hRVWZvDngQTqmw9KtxQ3EQlGh60Cbtxo=;
	b=tf2Q8RdJTv7iJ+4aaQ2ZipuvICkPbsrgRaw3/O/0Bevtgil7pYI45HlsxIfEbHMPXKnZ
	 v1nuCIBkEkLBB4M8/xX2jAkbmNzI4s//wQgJbSDjTtKm/qgviCwBc3AM64RmaBXehDqzC
	 S8AQwLw7K0WsZt+D7qmpg7Kr+E8SuXNYAatqyWafSxdwPlkutsZ8RoVL2k6J9JkOErBW5
	 bECWcwsJ6/Lcxh1sPq62TXXBROfoZF5o1LiVWuLGjaArd6uZEA+vn/W0WOZiHY5BLHMR1
	 vWldy0IixHePzxcvmP9DVEXhOdtVO+u5UJOO2JhCfSPOWJqaNbbmg3hL0ShqfUVqZZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WwdszGw5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ADD606A31C;
	Tue, 10 Nov 2026 08:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WwdszGw5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7C01F0089F;
	Tue, 10 Nov 2026 08:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298571;
	bh=vnhLj9uQ2n0hRVWZvDngQTqmw9KtxQ3EQlGh60Cbtxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WwdszGw5BCIinx5MHfSq3dnnQQ+MLDaCoA9wEYZ3DtHq+REBuxfbIweFqQSWkYkcM
	 jfqlnt347oF9Ar8LwTy8JF0O2uI1TtEci1mxe+HTtl0uVTJxYSi5VIPOX+7kK0kfKa
	 0kIMBNA/ZodobvP8uAbURT5H1pqjvs1aJKpDt+D43UaMyh5l655sz0IWGRNeoeXSpA
	 J9pw0biFgT792MABObS45AVWz7Bbad7wn7sIVedVGN1OaNl8zyhnV5MjmV98R59lW+
	 D9Wx79rZGVmlGJAWy2lguSDw8GnC15JQZ1df+qr/QtADONtGH5EP386W6ROYTel5Jv
	 i562845iCeWzQ==
Date: Tue, 10 Nov 2026 09:16:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gaurav Suman <gauravsuman007@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: media: i2c: Add Samsung S5K3M3 image
 sensor
Message-ID: <20261110-qualified-starfish-of-potency-0f7cde@quoll>
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-3-3d2e7b407516@gmail.com>
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
In-Reply-To: <20261109-sm8150-camera-v1-3-3d2e7b407516@gmail.com>

On Mon, Nov 09, 2026 at 10:38:21PM +0000, Gaurav Suman wrote:
> Add bindings for the Samsung S5K3M3 (ISOCELL 3M3) 13MP sensor, used
> as the wide camera of the LG G8x ThinQ.
> 
> This was written and tested with the help of an AI coding assistant
> (Claude Opus 5.5, Anthropic); I reviewed the change and the results.

Drop paragraph, it goes to the changelog, not commit msg. You need to
review better, because it has obvious and trivial misindentation. If you
just copied existing code you would see it is different. Instead of
using existing bindings as base, you just generated new stuff with new
issues.

I might be ignoring your contributions based on that.

> 
> Signed-off-by: Gaurav Suman <gauravsuman007@gmail.com>
> ---
>  .../bindings/media/i2c/samsung,s5k3m3.yaml         | 104 +++++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k3m3.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3m3.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..434f5d4326b726d0a65288a2a91b750e38a8706e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3m3.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/samsung,s5k3m3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S5K3M3 Image Sensor
> +
> +description:
> +  Samsung S5K3M3 (ISOCELL 3M3) is a 13MP image sensor controlled over a
> +  serial camera control bus. The driver supports 4160x3120 at 30 frames per
> +  second, RAW10 over a 4-lane MIPI D-PHY interface.

Drop driver.

> +
> +maintainers:
> +  - Gaurav Suman <gauravsuman007@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s5k3m3
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: MCLK supply clock.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: Active low GPIO connected to RESET pad of the sensor.
> +    maxItems: 1
> +
> +  vdda-supply:
> +    description: Analogue voltage supply, 2.8 volts.
> +
> +  vddd-supply:
> +    description: Digital core voltage supply.
> +
> +  vddio-supply:
> +    description: Digital I/O voltage supply, 1.8 volts.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - reset-gpios
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +      #include <dt-bindings/gpio/gpio.h>

Messed indentation.


Best regards,
Krzysztof

