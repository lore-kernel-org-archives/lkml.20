Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E3A42DA20;
	Mon, 31 Aug 2026 13:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183398; cv=none; b=W89FnZS0imKWI+OI3kFTX/SEaDrGK74yvzwnWFOUFuo2qrAFANbZ2W8Ku/0NAXdz38ausnSSz/rlCyarh+FLIy5ATtlRQUcboHcLLFvt+k244Kar6vELX15wi1i7dhwzzRiELGzKWQ7BEIJnl7Co1MFfNjEgcwZWvLi495MRLbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183398; c=relaxed/simple;
	bh=8cEVuI0cwRWEQIB80MzkJ1sJnBDi+nXRRCp/lPNqvOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRle+pjOyHOlJPcgDnrRo7zZLxRoarXzkMG08tAWb4VKdbQv9XLZRfiCOjpKE3h7sbDYgUVWayImmccYiMexdu/DW7R8jhFHnU2qRGs3wnKYa+WoED/dk6x4EvooO6mPLUk4UDM/EYAF/GvPCtWm7oeCPcDSBb+KDYSZZlTD1go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBXJ4cCh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBXJ4cCh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7819C1F000E9;
	Mon, 31 Aug 2026 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183396;
	bh=+OMa8Ih155PVJeVTe5EYTcczdcfldm2UcGJZZGpV1go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NBXJ4cCh9uk/EJzmJDww4u39YjImYD3aZJN5P5vzMd4avGHf3fH/mWqL7EDM1bYni
	 BidPrGBoTdwysdTmKAh8cqRhgC0QHOpSHyBwEvBUK7r/AFexy9DyC52ZUYrb1ezD0v
	 ARXImshNKeZdRfdPe8rAi5P4XG+XIDNGnq2tz7NeN8cmBM9RGqRGX8Cr134DFHeGkP
	 BV/CG+cXRA6y5ka7hbozTz/w1XNPmTgGDhdc335rcijeShZdu8BPqAHmSwMk4w/Wgd
	 zQxcvGqbsAywoLdwd95rXoBWF7HGkbZ+cAdKgqHv4pUhlxTpg80PzJmprYjZ6GUi05
	 OmSVnBtYVGASA==
Date: Mon, 31 Aug 2026 08:36:35 -0500
From: Rob Herring <robh@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, daniel.baluta@nxp.com, simona.toaca@nxp.com,
	goledhruva@gmail.com, m-chawdhry@ti.com
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert TI TWL6040 to DT schema
Message-ID: <20260831133635.GA712512-robh@kernel.org>
References: <20260817100207.2970303-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817100207.2970303-1-egbostina@gmail.com>

On Mon, Aug 17, 2026 at 10:02:07AM +0000, Eduard Bostina wrote:
> Convert the Texas Instruments TWL6040 audio codecs family bindings to DT
> schema.
> 
> During the conversion, the following updates were made:
> - Changed 'twl6040,audpwron-gpio' to 'ti,audpwron-gpio', which was
>   misnamed in the old txt binding.
> - Made 'gpio-controller', '#gpio-cells', and 'ti,audpwron-gpio' optional
>   because modern platforms do not require them.
> - Renamed the vibra 'vddvibl_uV'/'vddvibr_uV' properties to
>   'ti,vddvibl-uV'/'ti,vddvibr-uV', the names actually read by the
>   twl6040-vibra driver.
> - Required 'vddvibl-supply' and 'vddvibr-supply' when the 'vibra' child
>   node is present, since the twl6040-vibra driver unconditionally
>   requests both.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
> Changes in v3:
> - Required 'vddvibl-supply' and 'vddvibr-supply' when the 'vibra' child
>   node is present, since the twl6040-vibra driver requests both
>   unconditionally.
> 
> Link to v2: https://lore.kernel.org/all/20260816092847.2522994-1-egbostina@gmail.com/
> Link to v1: https://lore.kernel.org/all/20260815083451.2147129-1-egbostina@gmail.com/
> 
>  .../devicetree/bindings/mfd/ti,twl6040.yaml   | 151 ++++++++++++++++++
>  .../devicetree/bindings/mfd/twl6040.txt       |  67 --------
>  2 files changed, 151 insertions(+), 67 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/twl6040.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
> new file mode 100644
> index 000000000000..0d4e620d25a5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
> @@ -0,0 +1,151 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TWL6040 family audio codec
> +
> +maintainers:
> +  - Eduard Bostina <egbostina@gmail.com>
> +
> +description:
> +  The TWL6040s are 8-channel high quality low-power audio codecs providing
> +  audio, vibra and GPO functionality on OMAP4+ platforms. They are connected
> +  to the host processor via i2c for commands, McPDM for audio data and
> +  commands.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,twl6040
> +      - ti,twl6041
> +
> +  reg:
> +    const: 0x4b
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 1
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  ti,audpwron-gpio:
> +    maxItems: 1
> +    description: Power on GPIO line for the twl6040
> +
> +  vio-supply:
> +    description: Regulator for the twl6040 VIO supply
> +
> +  v2v1-supply:
> +    description: Regulator for the twl6040 V2V1 supply
> +
> +  enable-active-high:
> +    type: boolean
> +    description: To power on the twl6040 during boot.
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum:
> +        - clk32k
> +        - mclk
> +
> +  vddvibl-supply:
> +    description: Regulator for the left vibra motor
> +
> +  vddvibr-supply:
> +    description: Regulator for the right vibra motor
> +
> +  vibra:
> +    type: object
> +    additionalProperties: false

blank line

> +    properties:
> +      ti,vibldrv-res:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Resistance parameter for left driver

blank line

> +      ti,vibrdrv-res:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Resistance parameter for right driver

and so on...

With those fixes,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


> +      ti,viblmotor-res:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Resistance parameter for left motor
> +      ti,vibrmotor-res:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Resistance parameter for right motor
> +      ti,vddvibl-uV:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: vddvibl default voltage if it needs to be changed
> +      ti,vddvibr-uV:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: vddvibr default voltage if it needs to be changed
