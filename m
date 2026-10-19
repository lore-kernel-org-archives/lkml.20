Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821664A7CA7;
	Mon, 19 Oct 2026 09:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401215; cv=none; b=dColdy/HWvb+x75IpERrrBLsl90WWaNm0C1ziH9yLX64xZjcO3z65PowI6UQruyPBjFuHB1SHv3BSvdrIkhsqKVii251pvsVUeYfciG4Cckt0T97Z/kXdrQ0Vwcy7kcXbSAOW4uXchezmuEXJ7b1HUUUuADsAuIVuN9Jj4cg8V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401215; c=relaxed/simple;
	bh=GzKWcGjbfZG1NEm7Ozu5YhknnWtaz3wlww88AAsCa88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpeITFQ7Hd8ht7vtLt/ODxMyLt2jFZiAym7bAN9vgkW/vSmkqOW2oTk+94Wyve//Ug3oqO1kyUu6gcoM/p/7DhA4nzSAGm6JnkvizfEsFzkyAdn7wjRbVGAgfW/8s7L0ViXp6V1gLXTGMFYfuo9dkvThTKrRhQX+SS3+Hi3kRsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOT8TFo9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOT8TFo9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5431F000C4;
	Mon, 19 Oct 2026 09:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792401208;
	bh=aocQ5BSz662k7TnnzdiDWN8srMNdEjEJUuzG2/8V/QI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kOT8TFo9InwqtTFbuE2Mghy2cRy3iqg9o+ICVbb7xwwPuxd9xAHTIeu26GDNKHacd
	 hnxU5ymoch6DZOXj6ELeLK1/2DlEOAW8OWrOdSD6zwg0ecFHYdNqa6rmS7LASdcpQO
	 sI22L5kBZyq9CZFHoMgdCJlJy48RKfJxKSMqErtVxlFUYL0q+H5W2fUM2vpBVQZ3aH
	 T8VxWBqlcDjjaA0DJjskyijiu6EOE9DhXTzDwkucAxUpaC88Ydw6wfv1x5QViaY4zS
	 3evYVNfrkslkf1mcfzdnp7X1lk6VfUH7iXq6A1cMLJcmoSB3WcRQkMULr3FVfN8LLs
	 3TT21O4SmwM+Q==
Date: Mon, 19 Oct 2026 11:13:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: tglx@kernel.org, radu@rendec.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, afaerber@suse.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, cy.huang@realtek.com, 
	stanley_chang@realtek.com
Subject: Re: [PATCH v5 3/8] dt-bindings: mfd: realtek,rtd1xxx: Add interrupt
 controller child node
Message-ID: <20261019-prophetic-moth-of-youth-40dbd6@quoll>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-4-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261018160653.3940371-4-eleanor.lin@realtek.com>

On Mon, Oct 19, 2026 at 12:06:48AM +0800, Yu-Chun Lin wrote:
> Allow an interrupt controller as a child node by referencing the
> rtd1319-intc-iso schema, update additionalProperties to
> unevaluatedProperties, and append a usage example.

I do not see that "update".

> 
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  .../bindings/mfd/realtek,rtd1xxx.yaml         | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
> index 717e29c37b36..b21e14df2879 100644
> --- a/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
> +++ b/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
> @@ -65,6 +65,10 @@ properties:
>      const: 1
>  
>  patternProperties:
> +  "^interrupt-controller":
> +    $ref: /schemas/interrupt-controller/realtek,rtd1319-intc-iso.yaml
> +    unevaluatedProperties: false
> +
>    '@[0-9a-f]+$':
>      type: object

What is this for then? Should it be removed?

>  
> @@ -76,3 +80,27 @@ required:
>    - reg
>  
>  additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    syscon@7000 {
> +        compatible = "realtek,rtd1625-iso", "syscon", "simple-mfd";
> +        reg = <0x7000 0x1000>;
> +        ranges = <0x0 0x7000 0x1000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;

Why do you have cells it your child has no addressing?

> +
> +        interrupt-controller {

So the binding requires children with unit address, yes?

Best regards,
Krzysztof

