Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC21346D084;
	Fri,  9 Oct 2026 07:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530278; cv=none; b=Rjfr702XifQPrGFzyb29rhM1kjBF3/NYRD8c6Q6D3cYcWQMhUgBTZutnhKnQJyrS85ouezBKN8BmC4W4XMFHElmv9Zxjlu+boZKGZnTkwIHiUg6NSfZDTQ77V5HRFx8Pgy1qBto2Hp3q0C0Rcz7X9H43b2i0d+RDDBVWDYtOrz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530278; c=relaxed/simple;
	bh=mkC+CZh33GdrgCFqi9PE7/5lTTrQAIz9LHPzrs5e8C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWmwQZ0osewWC759Q1+1zDvPhhVB88J7oVHFeUdxTc6bQlj+5faLDH3fUtHQny5uKWEcPFF6agX2ZKRxoEp4z2W10166JW2Kgi2eTKbNInw4YzJtKpnPw6+VVXAPkFt0ePmk6CC1iq8cZAOXIiluXkY2amV2Mh6dpQ9IFvoOoCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9FEAAmJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9FEAAmJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37961F000FF;
	Fri,  9 Oct 2026 07:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791530276;
	bh=qI+415q4E5u/K30Ei0He1md1f8jr5YcEgEriT1ap3tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h9FEAAmJC9FwS+gXSVDcQG2rNWk/F0ybQyI6n7qzSoip58Nl9ThMoyvqF+6WcgQL5
	 kqUeOASwzAl9jrF09PpglkvIK82uu4OUH2tliTQ+1GYS/Q3VM+oBRCJ94qgdYpvAe6
	 8WyWXY6EAJE3vbPHBeE3eS5G2jx4jE/VZmm0UKoXOzU0dAbvFPzItfZKlfmG0n+8jq
	 FIOI8qu07S2kMlItCyKzr/DotJp2tYgIWKs4Kf7a+nd/bIv4aYaQ7YFxK2ZX8o+Ssj
	 5ePs4YSReTuDQnwi9wFotP7OKwOAA2xepcLR59pgzbsv4pVQrJ0So9NW4U2cw0lVNe
	 j65j+vgpPjjTA==
Date: Fri, 9 Oct 2026 09:17:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 05/21] ASoC: dt-bindings: Add binding for Apple
 Silicon Mac audio
Message-ID: <20261009-daring-objective-flounder-c0b66d@quoll>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>

On Sun, Oct 04, 2026 at 04:03:32PM +1000, James Calligeros wrote:
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
> +              - apple,j473-macaudio
> +              - apple,j456-macaudio
> +              - apple,j457-macaudio

Keep this list sorted.

> +      - items:
> +          - enum:
> +              - apple,j493-macaudio
> +          - const: apple,j293-macaudio

...

> +  model:
> +    description:
> +      Model name for presentation to users
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +patternProperties:
> +  "^dai-link(@[0-9a-f]+)?$":
> +    description: |
> +      Node for each sound peripheral such as the speaker array, headphones jack,
> +      or microphone.
> +    type: object
> +    $ref: tdm-slot.yaml#
> +

Drop blank line

> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      link-name:
> +        description: Name for the peripheral
> +        enum: [ Headphone Jack, Speaker, Speakers ]
> +        $ref: /schemas/types.yaml#/definitions/string
> +
> +      codec:
> +        type: object
> +

Drop blank line

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
> +

Drop blank line

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

This looks like you put several slots into one. TDM slot is for one
slot, no?

> +
> +      "^dai-tdm-slot-tx-idle-mask-[0-9]$":
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Idle slot mask. A bit being set to 1 indicates
> +          that the corresponding TDM slot is inactive/idle.
> +
> +    required:
> +      - reg
> +      - codec
> +      - cpu
> +
> +required:
> +  - compatible
> +  - model
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound {
> +      compatible = "apple,j416-macaudio", "apple,j316-macaudio";
> +      model = "MacBook Pro J416";
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      dai-link@0 {
> +        reg = <0>;
> +        link-name = "Speakers";
> +
> +        dai-tdm-idle-mode-0 = "zero";
> +        dai-tdm-idle-mode-3 = "zero";
> +        dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
> +        dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
> +
> +        codec {
> +          sound-dai = <&speaker_left_woof1>,
> +                      <&speaker_left_tweet>,
> +                      <&speaker_left_woof2>,
> +                      <&speaker_right_woof1>,
> +                      <&speaker_right_tweet>,
> +                      <&speaker_right_woof2>;
> +        };
> +
> +        cpu {
> +          sound-dai = <&mca 0>, <&mca 1>;
> +        };
> +      };
> +
> +      dai-link@1 {
> +        reg = <1>;
> +        link-name = "Headphone Jack";
> +
> +        codec {
> +          sound-dai = <&jack_codec>;
> +        };
> +
> +        cpu {
> +          sound-dai = <&mca 2>;

Example looks incomplete, you miss TDM slot properties.

> +        };
> +      };
> +    };
> 
> -- 
> 2.55.0
> 
