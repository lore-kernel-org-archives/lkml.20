Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007007;
	b=mu5YOi5MvQ5Lry2aRD37s4gESbu8pMg7hQYBxhXDDmg7jxqcu00jFdJwzPCIK5T6V5Im
	 Km9Nl3J/lfESxoNt1VVkmHQpYS+27T75adFRZ4sbN2IcbAlUq/U/Vt8FNTsrHaQ6aRmOk
	 dS0YU8zVY0mFIxdX5fTPvF4QkZRxVFTWj3l5EuMygb3o/xq13alKukprKWfsj0z5sDTSW
	 1CiRIa4LpXNrWWrNXQqxANjbubn48xl7z9YEZMy6/3IISwcVghNFin0+M38w7OCb2hOhW
	 5wGY3Z7WZ2ZKFrTWXBJl50T05dDkNtCu0hj/9Pl05qE6apui6Ns7XbWEsETQapmg5tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007007;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FQtyCJ06lVsX0Nimye0bYWf0hXbKSfQwRhyJYFeu8uY=;
	b=tg4SCO8QVIyuwzNZQb2W4YVq1U3Inxg47loJYd++DYGAEPwO3P5NFF5ejfjmyEeGllBG
	 xfiudw4Jpe4oP4fXUn4qdnPuF8OYUmxYeb36o8p5Tf37ak/9PcS48dcd+HzV1RJuMKAJd
	 dziidu6db0OOQuGas1K6kkWw6umzA4MuEIS4kzHiH6ZmTZh2heS6B2hSWiWlUu0VvPonq
	 nqFEM3GiXOTv3V9MrqcOOxwegr7oR53sxigzEQN11KRt4JEqSpcCf42w/3m2aP8MrjKlY
	 R5OOZsIOWQGvUZBLGBFrglLzCIWBtm4QSz4X9mjwFtKwsJT5KrAwFglBLWVSC3fy3PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gmxzT+yZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2A6606A31D;
	Mon, 26 Oct 2026 09:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gmxzT+yZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A7F1F01825;
	Mon, 26 Oct 2026 09:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793007006;
	bh=FQtyCJ06lVsX0Nimye0bYWf0hXbKSfQwRhyJYFeu8uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gmxzT+yZWP/TCog/AfOmQjD4WiAAh/14wAnScKSWzD1qdgnJBeELkmgV9V3RdIcw/
	 rDp/0/J3AfKODNHQ9WVo7dG4cCd0yJA2gfHrLz+ERHJvi73WiZR8NoMoPnCoqMn7BV
	 ERbpEeymCgt05LFpxFnHAGc0R5c4O4CJ+9/WUAfYlOso3wwUBp/KiALWJ4dZsE/1Gp
	 M2ajiqaZgNOX4aS423q8zUObnFiLinbGcw57Ae2Xsjhu1Xyw8wyGrl4LxZ79JDs6lr
	 /oW1KnLsGTYnXNKUQUYr/iHJi84c4Unm6JfWnMoQMac/mc05yW1wvPTA9V1pt2GLzw
	 xqBcOivzpl8Wg==
Date: Mon, 26 Oct 2026 10:30:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: mfd: x-powers,axp152: Add the AXP2101
Message-ID: <20261026-brawny-gleaming-grasshopper-813f7d@quoll>
References: <20261023100401.67592-1-olivier@mgcrea.io>
 <20261023100401.67592-2-olivier@mgcrea.io>
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
In-Reply-To: <20261023100401.67592-2-olivier@mgcrea.io>

On Fri, Oct 23, 2026 at 12:03:55PM +0200, Olivier Louvignes wrote:
> The AXP2101's interrupt line is optional, as for the AXP313A and the
> AXP15060: the driver then registers only the regulators. It has no DCDC
> frequency setting.
> 
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---
>  Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> index 45f015d63df1..f5e2c8232581 100644
> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> @@ -68,6 +68,7 @@ allOf:
>            compatible:
>              contains:
>                enum:
> +                - x-powers,axp2101

Why breaking the order? Keep natural sorted.

>                  - x-powers,axp15060
>                  - x-powers,axp305
>                  - x-powers,axp313a
> @@ -84,6 +85,7 @@ allOf:
>              enum:
>                - x-powers,axp313a
>                - x-powers,axp323
> +              - x-powers,axp2101

Sorting is broken in original code but you placed it completely odd.
Neither keeping sorting of 3xx variants nor, between 15060 and 717.
What's the logic?

>                - x-powers,axp15060
>                - x-powers,axp717
>  
> @@ -108,6 +110,7 @@ properties:
>            - x-powers,axp806
>            - x-powers,axp809
>            - x-powers,axp813
> +          - x-powers,axp2101

Placement of these entries makes no sense.

>            - x-powers,axp15060
>        - items:
>            - const: x-powers,axp228
> -- 
> 2.39.5
> 
