Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190281;
	b=sCzyAQDHgs3Oo5fFT8qz6Vl9rJJjAXteboX22NOC8Me/8kBecZpjuEbk+0685o176+Xo
	 QPl3PsOdEGANRsboBkTZ7zHz4KxFOvXqHesLtkgly2EoWyH9natjUj2Fx26lf7zdCD9Zc
	 KwAzAwOUyMQwAiLnmKl7zjODHkJZSimaS4ZZ0PlM4ihUiDFhVubzNimnnRaBAs86L4/n4
	 /VO+UzGoEoyef9JSFu9sDH/Blv8NoZQPBxfehr48I1TM7G66rS+fkYiR64Z8FQSFEXTXF
	 jmgnVo25cgW4n59qydRdNQlqy+PTuZBuDUXWqXEak+vKW9iMVAn8GrzD5YU/tBZABzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190281;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ibet2l01uL0sQicQdCocbPY75uZsHOIF+psw9/xynio=;
	b=w4EK/bGDj6bhpfWzV38J1n1LY7YUFk18qISUphjU6VUb2O5PTokmuo75biLwgyE/6nK9
	 FO1HVWbInbjKCH1I6AfAdC8nYiEjKm82aa3UwuKKAEnRKkgQXz03hungAz+0DtgNQUCra
	 pu1/4ZfJ8+/7E3dZOBCDd2PU70yPra7iZ3ZxIVSTa/gf9Dn8WlGk+qTf5BaNmrVvej6cv
	 +zanAFhlUhLTbEJ+d4Rk39HQ6NrIxSXpi+9KTPzvXVCHWyQtUyKO+7j3PFzKcv/zZ95xK
	 KTh0LYgOSuNZtQh0N5oBQACLAXS2CTb4ZeaFteAKGYTPwbTfbkAk+JlCcnPRuK/5tbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bAZgREak;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491F0606A31A;
	Wed, 28 Oct 2026 12:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bAZgREak
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1542D1F01825;
	Wed, 28 Oct 2026 12:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793190280;
	bh=Ibet2l01uL0sQicQdCocbPY75uZsHOIF+psw9/xynio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bAZgREakVNGDMGcWK3OmAo3sl1hOc83HbRKPh43NKg9qSIyiV4YxIrtEQGMuFbOBO
	 8M2zB/rURAySlyxcZm83t9OKx7skQD+7TUP5oF6jge6Fv1/J3rKCmLsrOwTBuuJ0eZ
	 snab6WFgeImiOR6PlhXM4oT7xitIkpI9B6Xal0zodVzKxuWUsU6UMEMkyQY11t5Wyt
	 rj7B+JdG2nuDkQIhFQO51D/M9uoTg3x7p+33iRhT5YEEex7nb63mGvS2RLMn1fhhQo
	 XZxjcZyuJwgwwDGWMqnGaU43bZwQic+jeV3XdmUIsMDBPAHBRy3HBq8iePO3WNEfTJ
	 4XpkKliuUUK1A==
Date: Wed, 28 Oct 2026 13:24:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Moteen Shah <m-shah@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, nm@ti.com, 
	ssantosh@kernel.org, u-kumar1@ti.com, gehariprasath@ti.com, vigneshr@ti.com, 
	afd@ti.com, a-limaye@ti.com, y-abhilashchandra@ti.com, johan@kernel.org, 
	kees@kernel.org, jm@ti.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: ti: Document the
 ti,tda54-mcu-scm-conf binding
Message-ID: <20261028-inventive-screeching-bettong-9f4240@quoll>
References: <20261027083700.1964371-1-m-shah@ti.com>
 <20261027083700.1964371-2-m-shah@ti.com>
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
In-Reply-To: <20261027083700.1964371-2-m-shah@ti.com>

On Tue, Oct 27, 2026 at 02:06:58PM +0530, Moteen Shah wrote:
> TDA54's MCU domain exposes a shared scm_conf syscon region that other
> peripherals, including chipid, access into rather than owning a
> dedicated register window. Rather than a bare fallback entry in the
> generic syscon compatible list, give it a dedicated binding
> describing the region and the proxy/claim/lock arbitration scheme
> that gates write access to a subset of its registers.
> 

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> Some of the claimable registers are gate clock controls, so also
> document the required "#clock-cells" property that lets the node be
> referenced directly as a clock provider for those gates. The clock
> specifier selects the ePWM time-base gate by instance number.
> 
> Co-developed-by: Aniket Limaye <a-limaye@ti.com>
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>  .../soc/ti/ti,tda54-mcu-scm-conf.yaml         | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml b/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
> new file mode 100644
> index 0000000000000..111cbb739b5f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/ti/ti,tda54-mcu-scm-conf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TDA54 SoC MCU Domain System Control Module Configuration registers
> +
> +maintainers:
> +  - Aniket Limaye <a-limaye@ti.com>
> +  - Moteen Shah <m-shah@ti.com>
> +
> +description: |
> +  The TDA54 SoC's MCU domain exposes a System Control Module configuration
> +  register region (scm_conf) containing miscellaneous control and status
> +  registers for MCU domain peripherals, including the JTAGID/device
> +  identification registers, boot configuration and status registers, and
> +  device feature registers.
> +
> +  A subset of these registers is write-protected by a proxy/claim scheme:
> +  each register is mirrored across 8 proxy regions, and a host must unlock
> +  via LOCK_KICK. Any proxy other than proxy-0 must also claim a register
> +  through its CLAIM register before writing through that proxy. Proxy-0 is
> +  the default access proxy: its claim bits are tied low, so it needs no
> +  claim and can write any register that is not claimed by another proxy.
> +  For example: Proxy0's CLAIM0 register sits at offset 0x3100, while the
> +  same register mirrored at ProxyN sits at N * 0x4000 + 0x3100.
> +
> +  Each of the 8 proxy regions also has its own fault status and
> +  interrupt registers, but a fault can only be handled through proxy-0.
> +  Hence, interrupt/fault handling is not described by this binding.
> +
> +  Some of the claimable registers are gate clock controls (e.g. the
> +  ehrpwm_tbclk gates). This node is the clock provider for those gates;
> +  writes to them are still routed through the proxy claim scheme described
> +  above.
> +
> +properties:
> +  compatible:
> +    const: ti,tda54-mcu-scm-conf
> +
> +  reg:
> +    maxItems: 1
> +
> +  ti,proxy-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 7
> +    description:
> +      Proxy region (0-7) through which this node's clients access
> +      claimable registers and their fault status registers.

I don't get the need of this property. You have a one, specific device, so
why the proxy id would vary per board?

It also looks like re-implementing access controllers.

Best regards,
Krzysztof

