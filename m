Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566503;
	b=F6WjBBOOHl4vqw77IXkt45dX3TaJj53E0sc6/ZhpbVQx/V3EIQzWtIBdKz0SnR9r0fDX
	 +VCSUck2cr7mjE9Ll0GcvHFztv0VbCgRQwApHwJ1KES15yF5cfAclb3EqULDf34ai6zg3
	 38enYv4DK3ZrP7f5Ddd0NZjtToh1WnGRBpJBSSl7IKI5BZWasutWsyxFdbQllIEaCWwbC
	 1f3Z0oVsA7IO9VXcOWnoRMu8K13g12ZtMWWO3c+GLz5lr/etxjO3EuvFDLTmh/bPVYSww
	 V2mvqHo4b7VOIntu3wXsYef934i68hzaiD6wzvpMc3bJhEVmVz1wm7hvSigwgr7xMmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566503;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UcfXrS0bmZcYIb/EzTJp2apjapiWA08HzvOHmmv056Q=;
	b=vL5yW6dhOnNAK8QVYxG9Sp3lAFuHPx8u+5WXuV0MCXn/4rph6Mw9u5imljkFiwfCOced
	 aGVWBfrq2vPSSmeepOoc7RWJ7gMsQWoWfvz3F28ar9zYTzCnSBZJBcONyUPpUG+MWtwI1
	 NCJYE5j5JO/yfA2nM2rqBgsNrL5fVkLDeb1qFptBwVyl6v/pKbwNoC2c9xvYWMo1YHumF
	 93uNl38xkIAw5ACVulxbTtL6kwUnD0CshZJaSPs94fOT2Q+9Z/kwsAP4cNM3haWWIdzY+
	 LIeYzfhFeWKuQF/+a6A3SmfEFQ2/xKXv+ZoujwR9RWJ+/CIOZdBGW8Kknr9Qq4r34kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VZYmpMG+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E822606A31C;
	Fri, 13 Nov 2026 10:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VZYmpMG+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F501F000C4;
	Fri, 13 Nov 2026 10:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794566502;
	bh=UcfXrS0bmZcYIb/EzTJp2apjapiWA08HzvOHmmv056Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VZYmpMG+ltxgghVvb2vloDRrpk9k+f8AqBkdOPJWCjVQq78f9WWcvEsLSg7+GHouB
	 FdDqAY6p8DpZo8I3Jn1Afq2Xs7snDLmmgcSSC4grAD9K1pKWT7z9UwKvwNLXErjo/U
	 b8sLM/tuRyDe55ZE0vNkhFM4RCjnex40ZJiitPJFv+Nb5BJAFP2X5tjFPWoF2/g6L5
	 CvqEGpARIahTsHqiMu2PWxf3wYs9FHHTxHyHRc/5nWeTkryyAhhnwA+koBCNhQxDPI
	 s4lrE1Qg8fPO4bs6qrXYq9WJ33mm1XSrgQsHA85UBHsOJlee7Un5y43f0DSF4m0jSD
	 rQ2832J6YE8Vg==
Date: Fri, 13 Nov 2026 11:41:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: cs35l45: Adds ABPE properties
Message-ID: <20261113-handsome-original-shrimp-abfae3@quoll>
References: <20261109-cs35l45-bpe-v1-0-9d7bc95a90a4@opensource.cirrus.com>
 <20261109-cs35l45-bpe-v1-1-9d7bc95a90a4@opensource.cirrus.com>
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
In-Reply-To: <20261109-cs35l45-bpe-v1-1-9d7bc95a90a4@opensource.cirrus.com>

On Mon, Nov 09, 2026 at 11:57:03AM -0600, Ricardo Rivera-Matos wrote:
> Adds devicetree properties to configure the amplifier brownout
> prevention engine (ABPE).
> 
> Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
> ---
>  .../devicetree/bindings/sound/cirrus,cs35l45.yaml  | 161 +++++++++++++++++++++
>  1 file changed, 161 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
> index e674811b22b2..2c118fa57ad1 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
> @@ -16,6 +16,62 @@ description: |
>  
>  allOf:
>    - $ref: dai-common.yaml#

Entire allOf goes to the bottom, before additional/unevaluatedProps

> +  - if:
> +      required:
> +        - cirrus,amplifier-bpe-enable
> +    then:
> +      required:
> +        - cirrus,amplifier-bpe-response-mode
> +        - cirrus,amplifier-bpe-thresholds-microvolt
> +        - cirrus,amplifier-bpe-attack-rates
> +        - cirrus,amplifier-bpe-hold-times-us

...

> +  cirrus,amplifier-bpe-attenuation-levels-db:
> +    description:
> +      Amplifier BPE logarithmic audio output attenuation for levels L3, L2,
> +      L1, L0, in whole dB steps. Half dB hardware settings are not
> +      supported.
> +    minItems: 4
> +    maxItems: 4
> +    items:
> +      minimum: 0
> +      maximum: 15
> +
> +  cirrus,amplifier-bpe-attenuation-levels-microvolt:
> +    description: |

Drop |, other places as well unless you need it.

> +      Amplifier BPE linear voltage audio output attenuation for levels L3,
> +      L2, L1, L0.
> +    minItems: 4
> +    maxItems: 4
> +    items:
> +      minimum: 187500
> +      maximum: 1000000
> +      multipleOf: 31250
> +

Best regards,
Krzysztof

