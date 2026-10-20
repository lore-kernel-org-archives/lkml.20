Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481131;
	b=ndU7AcTQY6a8z0LtWl4SETWAAyIIiIZyRhgSubNbMGTNrO2fkC4K+lyc/GyXK5Dfuuok
	 mvJqmZkCl//HO8Ws+ZFWjpEumHAnrObKOOfgH4ieIxidgXC8GrZ2qRf/2gB/mlB+n9OFL
	 buCXlcgTERpUZl77muVd4XbrG/TkLV/jDDNU5zHSyimOMMbzy12Xax/hVXCFJlqR3uhB/
	 8J2M+eC/D6avbpjECAIxstfaoB5Tp1xJeiHOzHiv6GwdKxk3sFnlyfbNdVhxPYsg9o1Pu
	 ewiIU+neZ4DGbZ4Wajj/awmh4lIiNoTGXRGD8Mk8i+rzZMZMfq6CH9bd7b9Vjumf4DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481131;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8xB8FYz4oxX2w21g5nKV4kypEOwJSPCjPKMx0/jwa8g=;
	b=AMKANJeNM+tqYP0w3IvRIHx1wWPeOFutxX5QKqyi1zzz+cnxz6ayLZLGZEvP3Co9Ujxy
	 uf+H84FyTEEqc7ll/X5S93cMISBDbvVhYX3wbKmoe0E5IM0/B/ekEvFnsHIb0+zzbtilY
	 r1g+GJ2I5GhlbA3CUdv8XaepwSEq2UvhLvPG7AJ2nDF0idF+Yh/MiHWXP5Dt1tPJKJNba
	 gcBcaSJeJ0RF85yl0bA5+wB+/fstFuO42pzsFxS9VdxLH3uhGYOOzW4iU8MReEBzO6RtB
	 rfL4924SlghuJ54zr2F1lsK0Le5m3KLqqosRPMPWxDSRCDPFhwpluwwFAdT/tQogUiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oanCaXqW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4FE606A319;
	Tue, 20 Oct 2026 07:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oanCaXqW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9151F000C4;
	Tue, 20 Oct 2026 07:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792481130;
	bh=8xB8FYz4oxX2w21g5nKV4kypEOwJSPCjPKMx0/jwa8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oanCaXqWqYLCzZkaQbIbhwCzF/OfbG8cZljO+8ElHv4AJidiUR5OLG9Mgw0cMn1Es
	 nHbL0bKTulNnHIn3YJGXbzhw0knur2ojwkMO6h72votLsJDQlHMnYaoBfNRPBUny0Z
	 rBv2fdhb8SLSSHmhvlmP2ChAF5zMYFkwENn97uyZAZQOAIKXgJjkTNqliK4MAFpP5a
	 rP0Cfmn9RfA8eBI4KoUcBTOnV87CuB8QeNwXrbBmvRgVhRyHgEycLu/XoQbmi/+mzH
	 HhxBLZzpelVoPBegoWypcPhyRapqRRVw6vaCyDn6ZFRrvndnxIL2PuU4eSMCBQhHxz
	 p5jhrDCDmIbbw==
Date: Tue, 20 Oct 2026 09:25:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: tglx@kernel.org, radu@rendec.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, afaerber@suse.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, cy.huang@realtek.com, 
	stanley_chang@realtek.com
Subject: Re: [PATCH v5 1/8] dt-bindings: interrupt-controller: Add support
 for Realtek DHC SoCs
Message-ID: <20261020-electronic-robin-of-infinity-f620ea@quoll>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-2-eleanor.lin@realtek.com>
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
In-Reply-To: <20261018160653.3940371-2-eleanor.lin@realtek.com>

On Mon, Oct 19, 2026 at 12:06:46AM +0800, Yu-Chun Lin wrote:
> +properties:
> +  compatible:
> +    enum:
> +      - realtek,rtd1319-intc-iso
> +      - realtek,rtd1319-intc-misc
> +      - realtek,rtd1319d-intc-iso
> +      - realtek,rtd1319d-intc-misc
> +      - realtek,rtd1619b-intc-iso
> +      - realtek,rtd1619b-intc-misc
> +      - realtek,rtd1625-intc-iso
> +      - realtek,rtd1625-intc-isom
> +      - realtek,rtd1625-intc-misc
> +
> +  interrupt-controller: true
> +
> +  '#address-cells':
> +    const: 0
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 4
> +    description:
> +      Contains the GIC SPI interrupts mapped to the external interrupt lines.
> +
> +  "#interrupt-cells":

Do not mix style of qotes.

> +    description:
> +      Specifies the number of cells in an interrupt specifier.
> +      For realtek,rtd1625-intc-misc, the first cell specifies the interrupt
> +      bank and the second cell specifies the interrupt ID within that bank.
> +      Other variants use one cell to specify the interrupt ID.

Missing constraints, e.g. enum.

> +
> +required:
> +  - compatible
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - '#address-cells'
> +  - interrupts
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - realtek,rtd1319-intc-iso
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Miscellaneous interrupts
> +            - description: RTC interrupt
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - realtek,rtd1319d-intc-iso
> +            - realtek,rtd1619b-intc-iso
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Miscellaneous interrupts
> +            - description: Watchdog interrupt
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - realtek,rtd1319-intc-misc
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Miscellaneous interrupts
> +            - description: Watchdog interrupt
> +            - description: Uart1 interrupt
> +            - description: Uart2 interrupt
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - realtek,rtd1319d-intc-misc
> +            - realtek,rtd1619b-intc-misc
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Miscellaneous interrupts
> +            - description: Uart1 interrupt
> +            - description: Uart2 interrupt
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - realtek,rtd1625-intc-iso
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Miscellaneous interrupts
> +            - description: Uart9 interrupt
> +            - description: RTC interrupt

RTC should be second

> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - realtek,rtd1625-intc-isom
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Miscellaneous interrupts
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - realtek,rtd1625-intc-misc
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Miscellaneous interrupts
> +            - description: Uart3 interrupts

UART1

> +            - description: Uart1 interrupt

UART2

> +            - description: Uart2 interrupt

UART3

> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - realtek,rtd1625-intc-misc
> +    then:
> +      properties:
> +        "#interrupt-cells":
> +          const: 2
> +    else:
> +      properties:
> +        "#interrupt-cells":
> +          const: 1

Best regards,
Krzysztof

