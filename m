Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF513ED5CD;
	Sun, 20 Sep 2026 18:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928852; cv=none; b=OF/Vzl4QzxbipoMRs4lGhtzlUUDfRkQhWKJlik24suwcpYuvuVUZMbl9fN7IUZnubWg7PyAeTYQAVHXjpdO1/w5mUboBHT0XTk7E5TbpgzGr4ZgH1SmPdV0LiDMcOwgle3hHa/WLIGQNL2x5eAKDvO5p7febcWNV/70qE79bUqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928852; c=relaxed/simple;
	bh=+39zWbxJTbIdcWHYEiYa7GfUhZ7/jv321vABY412XGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCvl4kjb8X1H7STDJY+VnEjJXUcLE9nXJxtMSAPbaXMTTFWedmfsXKdNV8lom5VBtcwnH0/j59WmrDX8hkyTk6Na9b0xCOpCWgEaleVENpgCeTd30kQs3P8nKIBPX382YWTJ2UgYvtitq3T/22XxpK0CmK64DnCZE3ioxkROcOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kw1X5ljY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kw1X5ljY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F1B1F000FF;
	Sun, 20 Sep 2026 18:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789928850;
	bh=o5p4jevbzCcNT8+15DGunWCaousHFOTOP1KQpTKa9Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kw1X5ljYdyuEx/BPqcdPHjTfSCZXvubINjRkiuwp8bRrfYloJ61juTEezvERFm7Uk
	 nZzUcMV7bkua/zEUx3SO+rDaV13RZ7Jc8CMJJDf0Ubwo+H5XNcDxRcQoTeioylwdTW
	 3kjJ0p0Xm1uKTYScNP9M7lNAauagOHZSGPR43cFfr6oqfomhUGky2eJN6OhIAv0NYN
	 bvw8wj/TvgqVxBXOCkfVfWTWzZN7d4aXpC1yHdwEcRdbSKd4GQrNAETBHSO7FqxYT4
	 0Yu5O2aclGFVkWRC+58AWGE75oGW1GcgYHtmOQASpAkKbLG3cScaS4gl6v68Sb3dhD
	 ydUMxy6ulU97Q==
Date: Sun, 20 Sep 2026 20:27:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
Message-ID: <20260920-therapeutic-wapiti-of-novelty-76abfc@quoll>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
 <20260919-send-dt-v1-2-365615a74ef3@studio.unibo.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260919-send-dt-v1-2-365615a74ef3@studio.unibo.it>

On Sat, Sep 19, 2026 at 09:44:18PM +0200, Nicolo Giuliani wrote:
> The Sophos XGS 87/107 desktop firewalls combine an AMD x86 host with a
> separate network processing unit (NPU). The NPU is a Marvell Armada CN9130
> SoC with its own eMMC and SPI NOR flash, connected to the x86 host over
> PCIe. It serves the front panel ports through a Marvell 88E6193X switch.
> 
> Document the compatible string of the NPU board, with the CN9130 SoC
> compatibles as fallbacks.
> 
> Assisted-by: LLM
> Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
> ---
>  Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
> index 7e77310da6..2e114139f1 100644
> --- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
> +++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
> @@ -136,4 +136,13 @@ properties:
>            - const: solidrun,cn9132-sr-cex7
>            - const: marvell,cn9130
>  

Looks like you add to the end of the file, not in correct spot.

> +      - description:
> +          Sophos XGS 87/107 network processing unit (Armada CN9130 SoC
> +          with an 88E6193X switch)
> +        items:
> +          - const: sophos,xgs107w-npu
> +          - const: marvell,cn9130

Why is cn9130 used once as final compatible and once as not?

> +          - const: marvell,armada-ap807-quad
> +          - const: marvell,armada-ap807

Best regards,
Krzysztof

