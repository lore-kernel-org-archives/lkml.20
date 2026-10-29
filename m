Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266334;
	b=ekb5oA8xw3laKLO1iqLsfHO7jcZZQiXeXuESIC2+q+QGNQKIiGvsBAySsdsYkbbVxfNY
	 5xxNqoXbF7X09zNzWVH9EKKTz/Fh9F4lDg5d5Jic/84MuxFmpUR//ey8pC2CUGw2j2s3H
	 Rm/Gc9+Vc1mRGfdG2uHEixNQ/74tYT1T7xEvs4HEuwQeCzBPcIEq5q+gh7AxN3rcdzzkm
	 a0jz7epLG9IFGTiPZEGkKC9GmoSLXZf4Umwkfv5rvya9UaT7LTQ87bQZ3bRsbfFPc6GWM
	 q6qvwmdB6+cx5NcW8Tgkf/PRwr+ptjgxRDV/5rkLiuT4/cxC/20CJoLjYKYQJoC34Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266334;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6XNj4Gpi3S44V1kUATueDFWe3fANO+BJZY0+ntjIOyU=;
	b=4ognA+aqMZpNJ+8ZPnlVAfEmTX8Mqq1DzVbuc4Z21ab2ivfwmb4Jky+/y5hEMUurePpL
	 xkmtuN8EA1/AFr7R4CdWCWzHX6hJyVrvtFm73SBLSQLEx+XeF2xxkS2RrCoNtLupOg5uL
	 Sgn+dmBCmRjtfABAu128m6gU3voCUO1h0Y5IDoskuqhn2r/KErX8jTj48TP06Wt8Y2Ohq
	 9oEKmBVCzql9L0FlhJ6/fJIeqys5z1nis5TI0Pi7v26NtOzm7xZVR3CiUjhuKazO52WWB
	 wscn3bDD1pRuOafqCAHWZgTuhMlp6Hmc9r47pwcFqqVj+BGdB4m6IvJImgoqkzceUEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RmNzoq2k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD90606A31F;
	Thu, 29 Oct 2026 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RmNzoq2k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1351F01828;
	Thu, 29 Oct 2026 09:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793266333;
	bh=6XNj4Gpi3S44V1kUATueDFWe3fANO+BJZY0+ntjIOyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RmNzoq2k1G+FGUC9nMzIEw6oJQbIIKw22qcuHYVEw3dRSU2Q96T8Su0VfG9im0EfJ
	 3Qx+43MVLIu2jox6ZFyyV5umeH18YQtwdEkgQvpgpTRycEVj9slO3IyjU08zyyvDf1
	 22cvgIoJHQb0w3cwfjls7BEHGVsrNf6EKUO1ZmleA+lUM7HafDwMZ+ihdiKdiDA1os
	 nQXMsbOHwn1X8LtPuusnXCQ2d0pG8nww+YZsEtoFz+smY/UFARdiLKZktXPwAcyviH
	 7cPuv0W0GlwKCXMJM4U5la3YHMfk7tKimM+LOUs5q2dwbVlKzzkYFwgGdi0QvclOWf
	 4ImkNQLuoEeyg==
Date: Thu, 29 Oct 2026 10:32:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: an7581-afe: add support for reset and
 secondary IRQ conf
Message-ID: <20261029-brainy-faithful-dogfish-da1731@quoll>
References: <20261026101026.34318-1-ansuelsmth@gmail.com>
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
In-Reply-To: <20261026101026.34318-1-ansuelsmth@gmail.com>

On Mon, Oct 26, 2026 at 11:10:24AM +0100, Christian Marangi wrote:
> Driver got support for configuring the secondary IRQ configuration to

This is confusing wording, I see no commit adding support which is
implied by "got support". "Got" meaning it never had one but at some
point it "got" it. When?

> support full-duplex mode (playback and capture at the same time) and also
> to reset via the dedicated SoC reset line.
> 
> Add the property to support it and make update the example accordingly for
> a more specific register mapping.
> 
> Also add the missing #sound-dai-cells property required for the generic
> sound node structure.
> 
> Previous register node definition doesn't prevent normal execution of the
> AFE driver as the additional IRQ register is placed at the end of all the
> previous AFE configurations.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/sound/airoha,an7581-afe.yaml     | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> index 80d9e87f1470..86d006559436 100644
> --- a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> +++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> @@ -14,15 +14,25 @@ properties:
>      const: airoha,an7581-afe
>  
>    reg:
> -    maxItems: 1
> +    items:
> +      - description: base AFE register
> +      - description: secondary IRQ option register

That's ABI break but maybe just original commit adding the binding was
incorrect.

>  
>    interrupts:
>      maxItems: 1
>  
> +  resets:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
> +  - resets

Another ABI break. Please explain in the commit msg what is happening.

Best regards,
Krzysztof

