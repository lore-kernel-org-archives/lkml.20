Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553422;
	b=4m46IfhoUC1qGHV2YGHy5qodsiRuwXjK4vkJEUAj9HXyGT1QpmDV/ZRyXLv60riiMdoo
	 dYjOga0u9zQf1cwPHfyUup9sil/WK+QQxKfJvrlkWj4/SdQoWjOCoOUHfUH9JfVnbbwRq
	 JtRxFZHRx4NNHEERQw2OmFTTZgLWEGEAz9y+XE5nVmrzGccxghLjblfD/uCRQA4ei35pc
	 dG+ZpBV+tT+043FvHnczDUJReAilTzCyFZ86PjuXeeRXfI6WOFziSkfGy2GIEQFFzHpM2
	 lQMCkTmG+ho4IvnITdhI33dHTNs1OAc6CCEnTRjxtQXzdCVP8VwlV2ppR7FIqghEVBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553422;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=jlz4yAXFlCLddpIKqlcUUKEQPJQbALduC2YYrpZf6jI=;
	b=VlEPN9q7Qs8XBF/tLUTvJ3hYme/nHLlGu8OG+MBhmf97LCH9HY2rDzSmRwV6gCj4Ur5U
	 Z95aLPtc5eJyyEeAmg1t1h7dRjFOTk9CsJZUpdRrSDJ9KVxZSaKXilyb4Uw9NyJsJF26g
	 bDM65nGWi96g8X0KSC32wBrAihphJemgWGR3CTUL0F9H0H92it/IxaQiLxrhf8yL1orNm
	 EZ4QtZ2bXOzYiLM5b7/2l/P6A89jbs8XUhzYlrHEY+EpZ/jKlGwScJwlWWXzn583JOJjk
	 MlQGtt6qSvr0hahpHkA3eP99fw9bKyCaNxsGJm0LhIAwus4Xle/qbFD9mPclilh/Ezg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lb1AQ8QN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1349B606A31F;
	Wed, 21 Oct 2026 03:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lb1AQ8QN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159A51F000C9;
	Wed, 21 Oct 2026 03:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792553421;
	bh=jlz4yAXFlCLddpIKqlcUUKEQPJQbALduC2YYrpZf6jI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lb1AQ8QNcJ5TpHSken/esH7w1Q4cbkTAgABJzIhuwNKcrW75N23Pif2C1+BgVD1SZ
	 +E4MI1zGyaa8cvK38W+AV+M6dL1Q+NPLOhrTN4TV1QJTjy+XW8prajnikO7QDecqIm
	 ZIkMF2s/Vam4OXzlkbrRm3u7XQ4T1KH42W1KibzBMkGWgfumOpvRQiMtuVAjRy4qs+
	 +PGn5h4s1dCW+N6DCRwr5rRZ4znI2lNjHlOu/bs9HleiZkFg3t65VIreR5+pD6t7Ya
	 zxt5iPTb6FMjrWJYL4autYSkuZnQsZ6GLsJcSQMgpurxyPwBrHZMGICDHuEkoSEqBG
	 +px0aasmivaRQ==
Date: Tue, 20 Oct 2026 22:30:19 -0500
From: Rob Herring <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 03/21] ASoC: dt-bindings: Add binding for Apple
 Silicon Mac audio
Message-ID: <20261021033019.GA4002608-robh@kernel.org>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
 <20261018-macaudio-v3-3-abdff7741dea@gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261018-macaudio-v3-3-abdff7741dea@gmail.com>

On Sun, Oct 18, 2026 at 03:53:57PM +1000, James Calligeros wrote:
> From: Martin Povišer <povik+lin@cutebit.org>
> 
> Add a binding for the primary audio subsystem found on Apple Silicon
> Macs. This binding integrates the codecs and SoC I2S peripheral
> used for driving the headset jack and speaker arrays on all Apple
> Silicon Macs. The internal microphones on this platform are
> connected to a distinct coprocessor and are not part of this
> "main" audio subsystem.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> Co-developed-by: James Calligeros <jcalligeros99@gmail.com>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/apple,macaudio.yaml   | 212 +++++++++++++++++++++++++
>  1 file changed, 212 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
> new file mode 100644
> index 000000000000..af8e9686ba7b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
> @@ -0,0 +1,212 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/apple,macaudio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sound peripheral integration for Apple Silicon Macs
> +
> +description:
> +  The speakers and headphone jack on Apple Silicon Macs are
> +  part of an integrated audio subsystem comprising of Apple's
> +  I2S peripheral (MCA) and a series of codecs. The machines
> +  have a wide variety of topologies ranging from a simple
> +  mono speaker in the desktops to complex stereo arrays with
> +  dual-opposed woofers and tweeters all driven by their own
> +  mono amplifiers. This arrangement can be expressed as a
> +  set of DAI links, where the MCA ports each codec is connected
> +  to are represented by the CPU side of the link.

Wrap lines at 80 chars.

> +
> +maintainers:
> +  - James Calligeros <jcalligeros99@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - apple,j180-macaudio
> +              - apple,j274-macaudio
> +              - apple,j293-macaudio
> +              - apple,j313-macaudio
> +              - apple,j314-macaudio
> +              - apple,j316-macaudio
> +              - apple,j375-macaudio
> +              - apple,j413-macaudio
> +              - apple,j415-macaudio
> +              - apple,j456-macaudio
> +              - apple,j473-macaudio
> +      - items:
> +          - enum:
> +              - apple,j493-macaudio
> +          - const: apple,j293-macaudio
> +      - items:
> +          - enum:
> +              - apple,j414-macaudio
> +              - apple,j504-macaudio
> +              - apple,j514-macaudio
> +          - const: apple,j314-macaudio
> +      - items:
> +          - enum:
> +              - apple,j416-macaudio
> +              - apple,j516-macaudio
> +          - const: apple,j316-macaudio
> +      - items:
> +          - enum:
> +              - apple,j475-macaudio
> +              - apple,j575-macaudio
> +          - const: apple,j375-macaudio
> +      - items:
> +          - enum:
> +              - apple,j613-macaudio
> +          - const: apple,j413-macaudio
> +      - items:
> +          - enum:
> +              - apple,j615-macaudio
> +          - const: apple,j415-macaudio
> +      - items:
> +          - enum:
> +              - apple,j457-macaudio
> +          - const: apple,j456-macaudio
> +      - items:
> +          - enum:
> +              - apple,j474-macaudio
> +          - const: apple,j473-macaudio
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  model:
> +    description:
> +      Model name for presentation to users
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +patternProperties:
> +  "^dai-link(@[0-9a-f]+)?$":
> +    description: |

Don't need '|'.

> +      Node for each sound peripheral such as the speaker array, headphones jack,
> +      or microphone.
> +    type: object
> +    $ref: tdm-slot.yaml#
> +    additionalProperties: false

Using tdm-slot.yaml properties, but then disallowing any of them?

> +
> +    properties:
> +      reg:
> +        maxItems: 1

Constraints on the reg values?

> +
> +      link-name:
> +        description: Name for the peripheral
> +        enum: [ Headphone Jack, Speaker, Speakers ]
> +        $ref: /schemas/types.yaml#/definitions/string
> +
> +      codec:
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          sound-dai:
> +            minItems: 1
> +            maxItems: 8
> +            description: |
> +              DAI list with the CODEC-side DAIs connected to the above CPU-side
> +              DAIs and involved in this sound peripheral.
> +
> +              The list is in left/right order if applicable. If there are more
> +              than one CPU-side DAIs (there can be two), the CODECs must be
> +              listed first those connected to the first CPU, then those
> +              connected to the second.
> +
> +              In addition, on some machines with many speaker codecs, the CODECs
> +              are listed in this fixed order:
> +
> +              Four speakers: Left Front, Left Rear, Right Front, Right Rear
> +              Six speakers: Left Woofer 1, Left Tweeter, Left Woofer 2,
> +                            Right Woofer 1, Right Tweeter, Right Woofer 2
> +
> +        required:
> +          - sound-dai
> +
> +      cpu:
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          sound-dai:
> +            minItems: 1
> +            maxItems: 2
> +            description: |
> +              DAI list with CPU-side I2S ports involved in this peripheral.
> +
> +        required:
> +          - sound-dai
> +
> +    patternProperties:
> +      "^dai-tdm-idle-mode-[0-9]$":
> +        $ref: tdm-slot.yaml#/properties/dai-tdm-idle-mode

Extend tdm-slot.yaml if it doesn't work for you instead of defining a 
new property using an existing property.

> +
> +      "^dai-tdm-slot-tx-idle-mask-[0-9]$":
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Idle slot mask. A bit being set to 1 indicates
> +          that the corresponding TDM slot is inactive/idle.

Extend tdm-slot.yaml...

Rob
