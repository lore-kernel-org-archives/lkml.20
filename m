Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553802;
	b=Q7Rj6+U5zN2O6AhzL6emVJdPYn9mWDbtPJ+sf2XeT8D66bxtlJBdrYOA4S3b5U8nfsfn
	 hF0fMPrHIliGoR+zDN6PKE8SWvp4oSOHlMTO/RBgZHlZXFUf2uPo8Q01MAa3aty+obM6V
	 X4yK/TIxDT/kcSURKB6RixVC0TSxAELHhxvXarJdngFYhSp6FYTa2Vj2rO/sA9ElQNnlW
	 nnDRnRXWo4GCRBs1Y1JekIp1W+egu2ElpT8n/aVpsv89JEZvVyzEK5rONLJwjSV/UMM5/
	 S+UJdrFLWyWSEwX1sV6u/u7xcamhsLFMoVg4yJNnI+4LYpNVkGqG83F1HFSIIOHykmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553802;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6NC/JN2JREI3RGV12yJNvA9XP4YHZPHGpcAz098RpYg=;
	b=NHcp4J5qeg67cTVIBCuPWHfPUYitRsITU3xFTDt14JRgNz3sTECIiejDykc27VzXiNWj
	 4Ty2Kl9OhVJqNO5E+A6Xqu58Y9md7nnb/N57kK5hTe3KtbjwxyPZvk/Bq8/F6i6V1jQ73
	 LaxywooUATZ6KnNFc0Q+JACosSh35/5cVlgr52WffOrjhoZwpSwn4uJTWpLBTUfRsxvsj
	 luBR90LriPa+SD+Se6BdBBUjpGqXhPvaTtKSzpESIU5oEXOMfvyxpzgIKpX3P0nc3kXgD
	 aL+0NkzWY6nhHB7RG5JZTvwYszJtnNuD3sePuRbzso3h8dJHr/A/VrbHdpf8xp4Qxiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z9XMq1Ib;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF35606A319;
	Wed, 21 Oct 2026 03:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z9XMq1Ib
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D65C1F000C9;
	Wed, 21 Oct 2026 03:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792553801;
	bh=6NC/JN2JREI3RGV12yJNvA9XP4YHZPHGpcAz098RpYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z9XMq1Ib0AizH5WVkF6YGPu5OzGGsTNhl4vRTj8352pEMdSULDQAA4WW9X9Gu4bGK
	 odaP8bVEFpA0z2GQDguQoiiUYQebc4+ql5IoEC96/3OH8Swzo7847zWKL5a030akuT
	 6HT6lWPzIqN5FS40wFL8omLMxHBdWgPo2NPDI3BW7/7m9e0j5ZDzZJpdKhukAia/xC
	 sxFMyJQ7IyMMKSPXMZFHL/J8BRU9Y3Pxqm90338MUYRSuv/w2i8zKuIhE9ZBsUW2H9
	 w/MVgVtGhyHh/xcwSBnh0SoShW37l/WNB2xFrEo8VhmuXrwxbappkQ2slQBCzCUlaG
	 YsIcVw8HckOeA==
Date: Tue, 20 Oct 2026 22:36:40 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH v3 1/4] regulator: dt-bindings: maxim,max8907: Convert to
 DT schema
Message-ID: <20261021033640.GA4071976-robh@kernel.org>
References: <20261019101750.125439-1-clamor95@gmail.com>
 <20261019101750.125439-2-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019101750.125439-2-clamor95@gmail.com>

On Mon, Oct 19, 2026 at 01:17:47PM +0300, Svyatoslav Ryhel wrote:
> Convert Maxim MAX8907 regulator binding from text to DT schema. Reference
> to nvidia,tegra-regulators-coupling in child regulator nodes.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---


> +patternProperties:
> +  "^in-v[1-3]-supply$":
> +    $ref: /schemas/types.yaml#/definitions/phandle

Drop. '-supply' already has a type.

> +    description:
> +      The input supply for SD1, SD2 and SD3.
> +
> +  "^in([1-9]|1[0-9]|20)-supply$":
> +    $ref: /schemas/types.yaml#/definitions/phandle

Drop. '-supply' already has a type.

> +    description:
> +      The input supply for LDO1 - LDO20.
