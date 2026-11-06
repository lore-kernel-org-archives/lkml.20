Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960500;
	b=wehyHfV+XeDoFlgD69lad/HlCqo3peJX7wIbVOnB5UxGLTyU0Y80roUrahqcDQhNRgCV
	 dUqmPukJU6Yma3NIFJzZNb9TkDquae9ak2zbZ26tltbmIeQruV9yO9649s50WXVGW5FT2
	 fBcbiWDSsDxaICm462LP5yfzzlAQHrquZSTtPb0LJTXCItmZ9xht3kiZBaBXtVZMYUCy8
	 oGapgnb6acUpsjh2VIfYkI5adWhhIIGq+B6Z+YDeHfbrfn3Mgloqd0mmqbo7ZeYzOcZt5
	 kgZso7MaIohcZdHqMlaZl1iR8Kb2rS2g2asFd5RUoo4BKKnnpr2Hi3Uucq2e4UvOaQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960500;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oCiDdG9uKBtwL1j/tc0kENtt1MdhR46jXVdAFzVfJO8=;
	b=ayu8T+feRX81SeeFKARbjOWnGDYw6RZv+YbhSx/+GGMY4mcUFaTu/wnZDkwtoxXNieXV
	 PxoVwtzIMUWD976a9VbRIRco9RT916IQdnu45gvllhDXN9NqDbAK3NjjkjE1ukqVXCLRk
	 8sznfAFw2/VUDxIvRYoNIHi/s4uz75dJrYyIGEIlpW6gxad9DzH6zmFLWVqEv3bt8xker
	 ptu8oiRDqUMjEznXGoPUf8S3QvZbXyd1aH3UpCAP/5lUaRk7Q6bOIyyupMuu1cao7NFy/
	 ZTv436L9Ky7HAHSW2Pc548U8XznUvGgw0vZXU8hkVuVFbdo3LdKRMy+ZRhXkmHZQ3ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WzRbqro9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91109606D807;
	Fri,  6 Nov 2026 10:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WzRbqro9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FF91F008A5;
	Fri,  6 Nov 2026 10:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793960500;
	bh=oCiDdG9uKBtwL1j/tc0kENtt1MdhR46jXVdAFzVfJO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WzRbqro9+jgKZCOnxyV5Qf2FXBVqSRiUdrte9IIL+inQw1Asb9j9CaLguI3Q0K8y/
	 Ps4Ef11TTWv9wmJkjrgZdyYBdXgrwh3FdgLXZF7EoT5g5ZYiPGk26tKrshMayt7jWa
	 Oq9Nsj3tZDxojVnZriW71FFEGOBOa6ghfEhNgn+dlN5qWdjLDBRiNi5UKKsUu0F8Lj
	 A7mTcOfayLNU0/TIYhQ7nh2+ldFWBZVPpG5p48rfVjHsG88Ezxd2YpvSKXfImwpg5U
	 sZ5dJOir4gQVYIKs2/ymgFvIoXa8P5MPenH/eVBeevZ7L2CmFphhPmcTAZ1kp/0lx8
	 Pu41zXcg4YKqA==
Date: Fri, 6 Nov 2026 11:21:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Simeon Marijon <simeon.marijon@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: stm32: allow TAMP nvram child
 node for syscon
Message-ID: <20261106-tireless-cobra-of-passion-1fca1d@quoll>
References: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
 <20261104-upstream_nvram_reworked-v4-2-144024496a44@foss.st.com>
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
In-Reply-To: <20261104-upstream_nvram_reworked-v4-2-144024496a44@foss.st.com>

On Wed, Nov 04, 2026 at 04:20:09PM +0100, Patrice Chotard wrote:
> The STM32 TAMP node (compatible "st,stm32-tamp", "syscon", "simple-mfd")
> exposes its backup registers through an nvram child node described by
> nvmem/st,stm32-tamp-nvram.yaml. That requires the TAMP node to carry
> "#address-cells", "#size-cells", "ranges" and an "nvram@..." child.
> 
> st,stm32-syscon.yaml uses "additionalProperties: false" and only allowed
> into the DTSI made "make dtbs_check" fail on every STM32MP TAMP node:
> 
>   tamp@5c00a000 (st,stm32-tamp): 'nvram@5c00a100', 'ranges' do not match
>   any of the regexes: '^pinctrl-[0-9]+$'
> 
> Allow the addressing properties and the nvram child, gated on the
> st,stm32-tamp compatible so the other syscon variants stay strict.
> "#size-cells" may be 1 or 2: the STM32MP21 soc bus uses two size cells
> (an empty "ranges" requires the node to match its parent) while the
> other STM32MP SoCs use one.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml        | 38 ++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index a559f8b03b84..51cb565e05ed 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -43,13 +43,19 @@ properties:
>      const: 1
>  
>    "#size-cells":
> -    const: 1
> +    enum: [1, 2]
> +
> +  ranges: true

Addition of ranges should be separate commit, because you are fixing
existing device which can have phy child.

>  
>  patternProperties:
>    "^phy@2[48]00$":
>      type: object
>      $ref: /schemas/phy/st,stm32-usb2phy.yaml
>  
> +  "^nvram@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/nvmem/st,stm32-tamp-nvram.yaml
> +
>  required:
>    - compatible
>    - reg
> @@ -84,11 +90,37 @@ allOf:
>          - phy@2800
>      else:
>        properties:
> -        '#address-cells': false
>          '#clock-cells': false
> -        '#size-cells': false
>          phy@2400: false
>          phy@2800: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32-tamp
> +    then:
> +      required:
> +        - "#address-cells"
> +        - "#size-cells"
> +        - ranges

This has ABI impact and is not really necessary, as the child node is
not required either. Drop these three.

> +    else:
> +      properties:
> +        ranges: false
> +      patternProperties:
> +        "^nvram@[0-9a-f]+$": false

Best regards,
Krzysztof

