Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909985;
	b=NbxAQrryzvzJVKjAQXSVFLFxDN+mAW6EzO6sKUUoWCFYuO8TlHwzH8/yq3yLw1BLzMKf
	 wXVT42XmO/YA13PsrekYmV+ObqeJK3waZWFskwWOvpVB+VJ0FJzjGBUKwo9Eg1CQSynrE
	 omHjo1/hqCuBXE9Wdgokxl8Sh6pniUHLle8Yzag1PgoAOgw2wdjto0W4ZZPWm0DpSDDes
	 JN/2ODgOd3UyjwYIgv4/dUo0MXHqJYXHEUg6oriWp+AlB1LQ8J6sQsm4we1DJKPPb7xKM
	 PEueLBKbnP8rdwV4XaUrbYatiiDxoKJ8Gc+BDQlugIwvJfHrgD7UFPtETozaY7R3bow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909985;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=s8ovy2ctIYpvpl8sbX75T7jexueFzluuIUa2B2ordO4=;
	b=k44sjrs5RApr2Mbk4Ys6oLpB1JNNod7Okt2aGHfeqUrV05H2sQYLBSlSR4QNSFJBYn78
	 KK57vWJGAUvOgT3MW084HF11SLJAG2kzI7R2KD6hbr3F7qDxlzSraDMl9vzwXfm0/WydK
	 l7NUA7gtVvnWQwCPp8Ncchssfno5L9iDSpRGROAOc+FwTjAU9M9fyv+s6J1DnEYWcidNu
	 aONgm6sjMaEItpyTUEWfzTTWWkONwNbxfGUO9g/+GVDa6O618v8ygQjQ2Q03nh0TNIYHW
	 o48s3jG+8JPd/+8H2Tq2F3SudmbS2sfOnTXFnw/3yrr+skFEvVHSud02nEr258GPcgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YHfLTTEk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1904606A323;
	Tue, 17 Nov 2026 10:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YHfLTTEk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A8E1F000C4;
	Tue, 17 Nov 2026 10:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909985;
	bh=s8ovy2ctIYpvpl8sbX75T7jexueFzluuIUa2B2ordO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YHfLTTEkDydHFHaWcIeVqdA79txK629SbKLIPwQaO51Cd6VWQD1MCEFrqW0YOre3y
	 DEhlC4RPeI8kKdBOkW44U6eif4m2IjXiAeCq56CYu01HP6H3lO+8ZKjLP7Ji1YLBkA
	 /ziLgp/EdWtq6ATjQjpjfMxwpfQ9iEEyPdmnHL93QPdn87cU+0+LsezhL7RwoemaDn
	 T0ZM4kxypu0aLQj7Gjpm7lcinLk4QWDmDzu+shRnLyB71wlUb8SSGf/MTlVZauvRZn
	 z19Rv796c9zYtM4sINmunBK+itcvF5QNGJyLH77bPfJUSXIucEQCKjmCwSwTV5xbZ1
	 DS5EWN5GsvWqQ==
Message-ID: <5be284b8-f321-4a9f-be59-7c85f5805fe9@kernel.org>
Date: Tue, 17 Nov 2026 11:06:19 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: xlnx,spdif: describe AXI4-Stream
 and audio clocks
To: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Michal Simek <michal.simek@amd.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, git@amd.com
References: <20261117085739.3807943-1-katta.dhanunjanrao@amd.com>
 <20261117085739.3807943-2-katta.dhanunjanrao@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261117085739.3807943-2-katta.dhanunjanrao@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/11/2026 09:57, Dhanunjanrao Katta wrote:
> The SPDIF IP is fed by three clocks: the audio clock used at the
> SPDIF/AES3 interface, the AXI4-Lite control clock and the AXI4-Stream
> data clock. So far the binding described only two of them and carried
> the audio clock frequency in the custom "xlnx,aud_clk_i" property.
> 
> Describe the AXI4-Stream clock and pick its name from the IP mode,
> s_axis_aclk for the transmitter and m_axis_aclk for the receiver. The
> minimum clock count stays at two, so that device trees written against
> the earlier binding keep validating and the third clock is effectively
> optional.
> 
> Mark "xlnx,aud_clk_i" deprecated instead of removing it. The frequency
> it carries is available from the rate of the audio clock, but the
> property is part of the published binding and device trees in the field
> still pass it. As the binding sets "additionalProperties: false",
> removing the property outright would make those device trees fail
> validation.
> 
> Make "xlnx,spdif-mode" required. The conditional that selects the

That's ABI break.

> AXI4-Stream clock name keys on that property, and a conditional with no
> "required" entry of its own also matches when the property is absent.
> A device tree omitting the mode would therefore have been held to the
> transmitter clock name by default. Requiring the property turns the
> omission into a clear validation failure instead.

You need to explain why, not what. Entire commit msg looks LLM written,
honestly difficult to parse. LLM is not supposed to be used to write
commit msg, because it means you did not understand what you did here.

> 
> Signed-off-by: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
> ---
>  .../devicetree/bindings/sound/xlnx,spdif.yaml | 54 +++++++++++++++----
>  1 file changed, 44 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/xlnx,spdif.yaml b/Documentation/devicetree/bindings/sound/xlnx,spdif.yaml
> index a45d8a0755fe..a4abca2027d3 100644
> --- a/Documentation/devicetree/bindings/sound/xlnx,spdif.yaml
> +++ b/Documentation/devicetree/bindings/sound/xlnx,spdif.yaml
> @@ -14,6 +14,28 @@ maintainers:
>  
>  allOf:
>    - $ref: dai-common.yaml#
> +  - if:

Move allOf to the bottom, before additional/unevaluatedProps

> +      properties:
> +        xlnx,spdif-mode:
> +          const: 1
> +      required:
> +        - xlnx,spdif-mode
> +    then:
> +      properties:
> +        clock-names:
> +          minItems: 2
> +          items:
> +            - const: aud_clk_i
> +            - const: s_axi_aclk
> +            - const: s_axis_aclk
> +    else:
> +      properties:
> +        clock-names:
> +          minItems: 2
> +          items:
> +            - const: aud_clk_i
> +            - const: s_axi_aclk
> +            - const: m_axis_aclk

That's the same clock. Just call it "axis"


>  
>  properties:
>    compatible:
> @@ -28,15 +50,15 @@ properties:
>        - description: SPDIF audio interrupt
>  
>    clock-names:
> -    items:
> -      - const: aud_clk_i
> -      - const: s_axi_aclk
> +    minItems: 2
> +    maxItems: 3

List stays here with minItems

>  
>    clocks:
> -    minItems: 1
> +    minItems: 2
>      items:
> -      - description: input audio clock
> -      - description: clock for the AXI data stream
> +      - description: Audio clock input used at the SPDIF/AES3 interface
> +      - description: AXI4-Lite clock
> +      - description: AXI4-Stream clock
>  
>    xlnx,spdif-mode:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -49,8 +71,10 @@ properties:
>  
>    xlnx,aud_clk_i:
>      $ref: /schemas/types.yaml#/definitions/uint32
> +    deprecated: true
>      description:
> -      Input audio clock frequency. It affects the sampling rate.
> +      Frequency of the audio clock input. Superseded by the rate of the
> +      clock named aud_clk_i.
>  
>  required:
>    - compatible
> @@ -58,6 +82,7 @@ required:
>    - interrupts
>    - clock-names
>    - clocks
> +  - xlnx,spdif-mode

ABI break


Best regards,
Krzysztof
