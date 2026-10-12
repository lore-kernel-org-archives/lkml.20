Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B5146E00C;
	Mon, 12 Oct 2026 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796298; cv=none; b=kBWyT1Eh+OaKgM/jG6xHN33NcJiwRZBY1wZfhxF2gf0xfHEu2zm8aYbpbh+3nbr42thVu9XjQ7h5+eaI5vkWyHpi0Nd8y1a4VVZK0drArCb6JYVxSpJytLUzLAnMhn/2lUt7xTv/Pu3VoN7axilQMYVsZaknumok0ZPAbtFx8II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796298; c=relaxed/simple;
	bh=3Vdm0a9A/5ymjOw1ZIT1ZC4jQl04JsvYB7EdKuGgyWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1Nd6FKmM9HhRY5Fb6+a2tZXP/Tn5DtIn+CMM/51ZoiUmJ9L0YTzldYtQD/CEUV3fOOLwjzp4SeH3f8cWKtkf9bteZUROlvPOvp8CDXnyZXWkqUHrYcDkNMWxLBEhmpAx9ejvQ8wd3HoEEN27YV9eFTuv0qJ0RWymhgdzYtQR2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYtxnamK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYtxnamK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36AFD1F0089B;
	Mon, 12 Oct 2026 09:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791796297;
	bh=1E5SaWc/cKCS/1ATP4paow4zRbQLnhYetlOxl3rHYWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KYtxnamKo3vTFnRwth3uG2AXTiopO+TYRswAvGTLfMigNDPANM/J2+Ks2YLOCBwB9
	 5VIzWIcIGQzKzVbR2J1PvAFmQexRAeZKL+N9HOEaZkJplz5TRA7NHaYXZpAzSxjjsR
	 6eo/yVLEstGEgdW4gB7fTA42Gj8VJF6s5cHo9EmA4dJAM4R+YXSgUzxxSfSufBOYJE
	 dTEs+I1c9I7j7+XNgBo4VNKFDmw/RrVF+Xm/evngGJch7pzxaFIorYnduOuJlqDt3J
	 LkgrEV51IIx9PfsAyy+R1n08TgAmD+Tm/urUm+RXQUAxuVC7Ls0P8VWlcESEzvpe8N
	 EyJDbamIFwgcw==
Date: Mon, 12 Oct 2026 11:11:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Yang <mmyangfl@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] regulator: dt-bindings: add hi3798cv200 regulator
Message-ID: <20261012-taupe-grebe-of-nirvana-f32c6e@quoll>
References: <20261009214404.722628-1-mmyangfl@gmail.com>
 <20261009214404.722628-2-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009214404.722628-2-mmyangfl@gmail.com>

On Sat, Oct 10, 2026 at 05:43:39AM +0800, David Yang wrote:
> The PMOC block of the HiSilicon STB SoCs (Hi3798cv200/mv100/mv200)
> drives an external converter with a PWM signal. Add dt-binding doc.
> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  .../hisilicon,hi3798cv200-regulator.yaml      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/hisilicon,hi3798cv200-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/hisilicon,hi3798cv200-regulator.yaml b/Documentation/devicetree/bindings/regulator/hisilicon,hi3798cv200-regulator.yaml
> new file mode 100644
> index 000000000000..812d94aca1f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/hisilicon,hi3798cv200-regulator.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/hisilicon,hi3798cv200-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HiSilicon STB voltage regulator
> +
> +maintainers:
> +  - David Yang <mmyangfl@gmail.com>
> +
> +description: |
> +  HiSilicon STB SoCs (Hi3798cv200/mv100/mv200) provide PWM outputs in the PMOC
> +  block which drive an external converter.

SoCs rarely provide supplies for themselves (they are rather called
power domains in such case) and above wording suggests this is actually
something external. It also speaks about PWM but binding has no PWM.

> +
> +  The voltage range depends on the board design: reference designs specify
> +  0.65 V to 1.15 V for the Hi3798cv200, and 0.7 V to 1.25 V for the Hi3798mv200;
> +  a customized board has to figure out its own. The regulator itself has no
> +  other source of calibration.
> +
> +properties:
> +  compatible:
> +    const: hisilicon,hi3798cv200-regulator
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - regulator-min-microvolt
> +  - regulator-max-microvolt
> +
> +allOf:
> +  - $ref: regulator.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    vddcpu: regulator@8a23018 {

Drop unused label

> +        compatible = "hisilicon,hi3798cv200-regulator";
> +        reg = <0x8a23018 0x4>;

And one word is rarely a device, which adds to the confusion.

Best regards,
Krzysztof

