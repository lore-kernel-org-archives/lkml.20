Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16C822D7A1;
	Sat, 19 Sep 2026 06:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789800401; cv=none; b=M8nctqhpCgT9Bu9dOuoVFEcLtp0ySL0GdwcBVw6IXHPzj/BPVcJTk655TuWt6j4O8aZk+jNc7OeSWRBuegij2mvWeeBvSiPYhHo1CSUgXOXBi46oKsKEvlYywsH8MKVZammV/iFO2VO4SSeRmoHv+Mqi55eBnmv7CyMjF70fkVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789800401; c=relaxed/simple;
	bh=9rSDcW9bexOpCbCkD7PgguNzMAuVswgEc6mK09AtZ3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0lXvY63zJvQrAZws6/0Io7zH4pXCvXT59F8ZVDEvxxsDS4k9z+V1+nCtedOY7omkSkyVsvAeii9qRKqGytHjogTXTBnzjO1bpJBwMOZE32RHNBVycCMZ9k4cgGEPZU2ZQfQJPzIAT+w4RMW+fDNP1kpCe4DwUFCM6Z/UOMz20s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zzq8pKyF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zzq8pKyF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04CA1F000FF;
	Sat, 19 Sep 2026 06:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789800400;
	bh=5vk7OvicrTQRWGuZTF4fATOQub6s05myuBV5giJTLMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Zzq8pKyFIekr3ojnhCCzOd2e3OcZiBDr9VFA6CcCEkh2FlxDDU8Xu5jILCEUwgPKr
	 WC0Stvg6lfBJO3L12oTmGVjPu/TrHBkg9rV88Y6S6m3uSJMJWUNlGr94PJK4UbVjRq
	 ZSgyOEKBUCY5ahWvT6XbbZwJ8ngKxFr5SXFjdXDcxVIPc+wKbeAKusEjUV+uQdOOsP
	 jt2wefAK7Idi8to02UbxYom/2BVKBFkZFOI6sIPGaPRPBFNq9bRzvv7RjjMK0WUvEj
	 7AqtuTYqmgs7loBbSj19ye1lMKPU28EJu4V43mQKTctxatmmPGQlAKjGAC8MNZqF5d
	 Ryp83MTZMvB0g==
Message-ID: <c8d25275-3c45-4e9a-826c-cf856938d60e@kernel.org>
Date: Sat, 19 Sep 2026 08:46:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] dt-bindings: media: add apple,avd
To: Sofus Forstreuter <sofus.c@icloud.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-2-49977931f455@icloud.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260918-avd-v1-2-49977931f455@icloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/09/2026 15:15, Sofus Forstreuter wrote:
> Document the Apple Video Decoder. A hardware video decoder present on
> Apple hardware.
> 
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> ---
>  .../devicetree/bindings/media/apple,avd.yaml       | 112 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 113 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/apple,avd.yaml b/Documentation/devicetree/bindings/media/apple,avd.yaml
> new file mode 100644
> index 000000000000..34a4129d6a46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/apple,avd.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/apple,avd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Video Decoder (AVD)
> +
> +description: |
> +  AVD is a stateless video decode IP block present on Apple devices.
> +  Notably it includes an ARM Cortex-M3 and associated DMA controller.
> +  AVD is capable of decoding H264, H265, VP9 and AV1 on never SoCs.
> +
> +  The IP does not change much, with changes being mostly the CM3 having more
> +  memory and interrupts.
> +
> +maintainers:
> +  - Sofus Forstreuter <sofus.c@icloud.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - apple,t6030-avd
> +              - apple,t6031-avd
> +          - const: apple,t8122-avd
> +      - enum:
> +          - apple,t8103-avd
> +          - apple,t8112-avd
> +          - apple,t8122-avd
> +          - apple,t6000-avd
> +          - apple,t6020-avd
> +
> +  reg:
> +    minItems: 4
> +    items:
> +      - description: Cortex-M3 code (unsigned)
> +      - description: Cortex-M3 sram
> +      - description: Mailbox
> +      - description: Video decode control
> +      - description: DMA control
> +
> +  reg-names:
> +    items:
> +      - const: code
> +      - const: sram
> +      - const: mbox
> +      - const: ctrl

Sashiko comments are valid.

> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 3
> +    description: |
> +      The block contains 3 iommus, one for decode operations, one the DMA
> +      controller can use and the last for decoding drm-protected content.

List the items with description with minItems instead.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 2
> +    items:
> +      - description: mailbox 0
> +      - description: mailbox 1
> +      - description: mailbox 2
> +      - description: mailbox 3
> +      - description: flag 0
> +      - description: flag 1
> +      - description: DMA status
> +    description: |
> +      Notably there are no decode related interrupts. All decode related
> +      interrupts are sent to the CM3.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - reg-names
> +  - iommus
> +  - power-domains
> +  - resets
> +

Why properties are unconstrained per each variant? Why are they flexible?

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/apple-aic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        avd: avd@289080000 {

Drop unused label

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Don't use custom names, like apple. Codecs are usually video-codecs. Or
isp if this is ISP.

Best regards,
Krzysztof
