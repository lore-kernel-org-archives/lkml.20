Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943AF2F3C0E;
	Tue,  6 Oct 2026 14:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791296182; cv=none; b=CK8hVkGV7IquqoweiEKbCYFHj5F/M1ASZdN+RNuxK+KyzLRWxEyw8dcrRUCEd/Pcf4Uf0VajvyzRcaZo9RRHtDkc7M6SPEkfeRIavBT5+33jkeDH/7u+JIdc7NkVIBPL46Y1jUGYZ3b4mYHrWeoZFrCvLq67ppZdLkL2h2GbqpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791296182; c=relaxed/simple;
	bh=n8OE6sUU/22v8JYzcIXDQZhxlASUOVM3TzT5eZMXjqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K97zX5p3ObctpaOcvfoSZrlBV2SKs4e1WM3LU21k45sWofmFIqrF4Zmk6gJZ8Hu7gYLzGsnJXSLcw/Ud+vfv0nExlaNO6C1sd5XPpYyjQ4fHLXlp8E0vFYHAS8eekzhh1W4/X0eIPZKkAt6+gchh6H5Lt95b09dfl6k86Bbu4mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NyCEzdx9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NyCEzdx9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C5F1F000FF;
	Tue,  6 Oct 2026 14:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791296181;
	bh=uh0/HDHa65h1Y4pZiTg3gOriE1GFv13Xms4g8A5nBys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NyCEzdx9Ydf+B17eOZH1EF2eKJERKZHytvtlIuTT3Ioz042V1cTVG4aN0wNTPUMXZ
	 LOd66+UCOI4k1iWV8RiE9hDDzlsb0O3kMdpr/x7IToGOZ9T+zTwgiF+CVmPhDrLo5A
	 zdndmiRjb+kq1kN2b/HlLDabnTjMKOofvnF4YSmlJp9s4BSAQybyfzhpyTLQIEp51m
	 eNrvdGG800yNfg8RUtnr4A8aGRB9qdgtWnZm9m1k0DqrfbiIftYMzhQmi5KHmDo/iv
	 5NvS8UwDwqsDELQnZH8XXcgTq2cxlkLRRcrtgix3nzo63Q08I3bKTdoQ9EznCVS0jh
	 m0OHHarEmlAEw==
Date: Tue, 6 Oct 2026 09:16:20 -0500
From: Rob Herring <robh@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
	Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v8 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add
 binding
Message-ID: <20261006141620.GA1950759-robh@kernel.org>
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
 <20260928-b4-qaif-shikra-audio-v8-1-ac618057fe85@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-b4-qaif-shikra-audio-v8-1-ac618057fe85@oss.qualcomm.com>

On Mon, Sep 28, 2026 at 06:22:51PM +0530, Harendra Gautam wrote:
> Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
> controller used on the Shikra audio platform.
> 
> QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> interfaces and the internal Bolero/WCD codec. Platform Devicetree files
> need a binding to describe the controller resources, DAI cells and per-
> interface AIF configuration, and named constants to avoid raw numeric IDs
> in sound-dai references and child-node reg values.
> 
> Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
> aif-interface child nodes required by the controller.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,shikra-qaif-cpu.yaml       | 305 +++++++++++++++++++++
>  1 file changed, 305 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
> new file mode 100644
> index 000000000000..5cabbe54d6fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml

> +
> +  reg:
> +    maxItems: 1
> +    description: QAIF core registers

Drop the description.

> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      QAIF summary interrupt for this Execution Engine. Signals DMA period
> +      completion, buffer underflow/overflow, error response, audio interface
> +      underflow/overflow, interface-group done, rate detector and VFR events.
> +
> +  iommus:
> +    maxItems: 1
> +    description: Phandle to apps_smmu node with sid mask

Drop. The exact provider is outside the scope of this binding.

[...]

> +patternProperties:
> +  '^aif@[0-9a-f]+$':
> +    type: object
> +    description:
> +      QAIF AIF interface child node for PCM, TDM or MI2S configuration.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          DAI ID of the AIF interface (QAIF_MI2S_AIF* or QAIF_TDM_AIF*).
> +
> +      dai-format:
> +        description: Serial audio interface format (MI2S, TDM or PCM).
> +        enum: [i2s, dsp_a, dsp_b]
> +
> +      dai-tdm-slot-width:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [8, 16, 24, 32]
> +        description:
> +          Slot width in bits.
> +
> +      dai-tdm-slot-num:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Number of slots per lane.
> +        minimum: 1
> +        maximum: 32
> +
> +      dai-tdm-slot-rx-mask:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          Active RX slots, one entry per slot. A nonzero value marks the
> +          slot as active.
> +        minItems: 1
> +        maxItems: 32
> +
> +      dai-tdm-slot-tx-mask:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array

These are all common properties. Don't redefine the type. You need to 
reference the common schema (at the object/node level, not per 
property).

> +        description:
> +          Active TX slots, one entry per slot. A nonzero value marks the
> +          slot as active.
> +        minItems: 1
> +        maxItems: 32
> +
> +      qcom,qaif-aif-lane-map:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          Per-lane direction map, one entry per lane starting from lane 0.
> +          Use 0 for TX (output/speaker) and 1 for RX (input/mic).
> +        minItems: 1
> +        maxItems: 8
> +        items:
> +          enum: [0, 1]

Can't you use a single uint32 bit mask for this?

Rob
