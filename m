Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702951;
	b=zwuUohLFgN3OL7Djq9gQty+vpwKStlIRQnXoSI9n424MxcqxiIB9Y+wu6ckj+nT2CgUE
	 WSVxakDc/N0kcHZrv+WLocU6FLwgH17O55rCLHVqko+LIrBbnT0QbcrPod8DryQUlrmda
	 FQT/t0goxnP+tn6AoAtthnD7OWlb+w8biofAdcf8S7ju6B67ZLxiYQ5dntc//5mlnxUXL
	 +1ekBko6vRTG7gDp0hhpj739PWwbIHlLIt7Yz7cPrb4xYSm4wIabEZvDbosLqKXqNhgR1
	 L9KdA9LjHSY8MW79IsOw3DtFgYhxC/o0mmGFrjArWUljUmo8P7HYU6zj03HRZ3nrS9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702951;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=x3jybUZUjli2SkdPvv0VvHSWCQMmhs4hSkS0vW9Fq+w=;
	b=WyIVUu/LbhUYI5kAMCYL1q5GOg/vUsFO+3t40POgNhvV77yIiClFtDtu2Ep5pAia8BYX
	 4O0UZ2RFq8OhtxMfnPdF4R9Q2nfpnqM+V669U9ILMvKTY+hbIAQYdTe+/K1fAWWVa6r4T
	 NXYcqIRqdq5LMh635HRTj8EfhqEzaNxPdQIob4nIR+BGvtQuXqNt1QM6zHUYacpwaTs4P
	 KHGMCnSiUufQBE8Xx5I+FRRg5hWvPzkGOAtixUuoThjsyj13SFvIh2GFTZcRrM2Mt6epd
	 tHHurgWtl6UXb89svS8wTtggABMZ2vjLFk0xBCnqXH2C7IA9/c+aIQAEgeVx2IA44cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EeV2jRvk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE89F606FAE3;
	Tue,  3 Nov 2026 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EeV2jRvk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9B31F000C1;
	Tue,  3 Nov 2026 10:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793702950;
	bh=x3jybUZUjli2SkdPvv0VvHSWCQMmhs4hSkS0vW9Fq+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EeV2jRvkMNGFnMwNJQSil8aFaPnCkKT2tIw0ZU+QpTC9eGsW2oWIG9dDmSuC7HmsV
	 jJ9xZMzGAYi7NxibwLTbhmrV+7ldV7X1PBnxlGB7pEshYdPyic0kRRWUG/hz4W7ZB8
	 SG7FDhOsIP914u2JGK/dX1St3+LrMmGlAtx5pqKDjwx8fZhfiueHvabpffkv6tcFBI
	 JXjq6aStNJ6z/j2GxyJJAnedpYt7sIGA/5dttGuw0YNgMVpERAnUlJYtMPQeviuLBZ
	 HkwVbfB5zZuZvX/IPM3pCaSKqKZ7xlEbg3l9+sMvnpqweDyy1Va2u0MPFh3K7SIoQM
	 32eqYDnVKj3Hw==
Date: Tue, 3 Nov 2026 11:49:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Adam Azuddin <azuddinadam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, jesszhan0024@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
	andersson@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: display: panel: Add RAiO RA8875
 display controller
Message-ID: <20261103-zippy-quantum-bat-98b5ed@quoll>
References: <20261030083737.47188-1-azuddinadam@gmail.com>
 <20261030083737.47188-2-azuddinadam@gmail.com>
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
In-Reply-To: <20261030083737.47188-2-azuddinadam@gmail.com>

On Fri, Oct 30, 2026 at 04:37:35PM +0800, Adam Azuddin wrote:
> The RA8875 is an SPI-connected TFT display controller by RAiO
> Technology Inc. It supports display resolutions of up to 800x480.
> 
> Assisted-by: LLM

You can drop this.

> Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
> ---
>  .../bindings/display/panel/raio,ra8875.yaml   | 87 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
> new file mode 100644
> index 000000000000..661398bda0ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/raio,ra8875.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RAiO RA8875 Display Controller
> +
> +maintainers:
> +  - Adam Azuddin <azuddinadam@gmail.com>
> +
> +description:
> +  The RA8875 is a TFT LCD controller for panels up to 800x480 pixels.
> +  It can be connected to the host via 8080/6800 parallel interface,
> +  SPI or I2C.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: raio,ra8875
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description:
> +      3.3 V supply for the IO pins, the oscillator IO pins, the ADC pins
> +      and the internal LDO. The 1.8 V core rail is generated internally.
> +
> +  reset-gpios:
> +    description:
> +      GPIO connected to the active-low RST# pin. Optional, since the board
> +      may instead use an RC reset circuit.
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      INT# pin, active low. Signals RA8875 interrupt events such as touch
> +      panel, key scan, DMA, BTE and font access completion. Optional, since
> +      the host can poll the interrupt status register instead.

Last sentence is not correct. What driver can do is here less relevant.
Question is whether hardware datasheet allows interrupt being not
connected.

> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - display-timings
> +  - vdd-supply

Best regards,
Krzysztof

