Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598615172FA;
	Thu, 15 Oct 2026 10:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060605; cv=none; b=YKVfE86vDm/ettXzJpQjVA6mwuOEswYCfodEJSaqC0+HHWm1JG91oJGEu2d1OXt1kijr/eQ+hDbNmn+Zz+8S5wOMfPDy2ByRlciMBHqH5Pe/Af+JJBjvdSVJQki71d+UYfRveHRWZd01Em00jaEFQCLcZ1H96Ttnln//4LOV+9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060605; c=relaxed/simple;
	bh=s4YUPMSL1/a17aVK9zchD+uCISsgBVnbKXNEnFBRmU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4JN1mTxNSIaVSIT/LVoSGEGbxOv0NaN4cCg6I0YS2sSpNlD51gTqZrhZwL/3iyNNtvksWVrSbfbWw6ltaNKyGSAde2DGm72oa5x3rH0rJrRwaxoCnGOZxZ76VRUOTYmdZsnHU4E9C4SbndmPVJhI19NWzxB2uPI2Bg72l//YX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYFuoLpa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYFuoLpa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE4F1F000C5;
	Thu, 15 Oct 2026 10:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060604;
	bh=DveVuAyBUJ8UMZ0cZ+ipTPCd4E9bOopYRJjExLCFVNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PYFuoLpa4S2ogn3JwuKVZszT0moMT16Y8TiLQW3mzfRK13fEdJroX6Gm7SEjfAPg2
	 a1xNqKfRnVcD104sjQLSvU9o0pCMp/5yYkHCKM7vJFCIg/ZeV9giZz5YFOHBgXsh94
	 SdatFZ22xVPTB1gbPJul09PYijB1/rKa+3RDLTx2QMJAPbVUxmyT3cIdjVEScc019T
	 GGg84LDTHUcDfjK8nc6nAGP0BjlVndYdx83nG6DkifFemQC+5bJHbGQynaym01pmdg
	 H+e/2oIz/EkW2F6NeV/zv3mlfRX4wub8YJmos2fTXqPD3Q9EpDFOVeZEQKaAvqsitn
	 PdcXiVCupGxfg==
Date: Thu, 15 Oct 2026 12:36:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hyunuk Son <hyunuk.son@irondevice.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	kiseok.jo@irondevice.com, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add Iron Device MA5311
Message-ID: <20261015-gregarious-flawless-cuttlefish-145cab@quoll>
References: <20261015060408.128711-1-hyunuk.son@irondevice.com>
 <20261015060408.128711-2-hyunuk.son@irondevice.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015060408.128711-2-hyunuk.son@irondevice.com>

On Thu, Oct 15, 2026 at 03:04:06PM +0900, Hyunuk Son wrote:
> Add a Device Tree binding for the Iron Device MA5311
> audio codec.
> 
> The binding describes the properties required to identify
> the codec and configure its connections to the host audio
> controller.

Drpo, obvious. Explain the hardware.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Hyunuk Son <hyunuk.son@irondevice.com>
> ---
>  .../bindings/sound/irondevice,ma5311.yaml     | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml b/Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml
> new file mode 100644
> index 000000000..ae4a13c29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/irondevice,ma5311.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/irondevice,ma5311.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Iron Device MA5311 Audio Codec
> +
> +maintainers:
> +  - Hyunuk Son <hyunuk.son@irondevice.com>
> +
> +description:
> +  The MA5311 is an audio device providing digital speaker amplification,
> +  analog input conversion, and audio DSP functionality.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - irondevice,ma5311
> +    description:
> +      Requires two I2C Channel.

Not sure what is I2C channel... like two SDA/SCL lines? Anyway, this
goes to description.

> +
> +  reg:
> +    items:
> +      - description: I2C address for control registers
> +      - description: I2C address for ADC registers
> +
> +  reg-names:
> +    items:
> +      - const: control
> +      - const: adc
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO connected to the active-low RSTN pin.
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Interrupt from the active-low INTN fault and thermal warning output.
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - '#sound-dai-cells'
> +
> +additionalProperties: false

unevaluatedProperties instead


> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        audio-codec@3e {
> +            compatible = "irondevice,ma5311";
> +            reg = <0x3e>, <0x3f>;
> +            #sound-dai-cells = <1>;
> +            reg-names = "control", "adc";

Make the example complete.


Best regards,
Krzysztof

