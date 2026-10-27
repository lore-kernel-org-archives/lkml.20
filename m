Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093780;
	b=aM53CdwJgxmE2OzTpizfYW+yMNsB59K1Rte+upqSSe0oa/5JWv5qhcbGRU4h82Xuekv5
	 uyFjpHuiwzDCzd4AfIavcRhPhWbh0U1J+JT76qirBVPxURWP68BeQY3dpF4kQ0UF8iIsd
	 FOud+ul91eu9zpk98kUEUOv9Ot2wkt1NetmnPPiUvlB0RfPG3Q3nziyBCxSpVp8qVHGo1
	 AVtGbponDuZRRpGgHxAd8NTytdNU4g4Ggd7sycKjEQwRCNNI8XUrHAnLse23MfLxybV4t
	 5cK31VswJlxj9W6URBQRoi4bY3FqnDbm6c56q9SGkeGN/vpjrpRoiKWogYx8I6ruaOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093780;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Dplzi2jZF0nyquCM7rHIi1KSd7Abrm4kSHyoRVVxXRA=;
	b=sGD7rD3OkqMZlVW0YTU2iBrb7ZVQBkmy9FkbNo//fcg+lDJbb5Nz361MPGvQJuNW+beL
	 Fr53vJB/oHhz10hsKMPf2L5znBaXm1AdwXCeen6U1DeyKOEvA6UAwpRuve+rt+OPEs+BF
	 4S9+UAR0YzixPX7jhXWzey9SSoEAUA84JkwIhr2I4xW8v4SxFrmd5FIYgy8/3ueb1yW0d
	 Xdh01rQ9suUdiF0pBYDax56tejY68rVFgR+KxK+cj+cKqhQUZFUG9u86KRHlYxaEWi1tC
	 jsuNfoc1CbMoCnxjXOiCFM6GgFERX1IK6drrd4ISC8Nid33/cQ1kqHxhURPIyAGIsig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Aj/lYZAN";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC937606A31A;
	Tue, 27 Oct 2026 09:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Aj/lYZAN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 539271F01825;
	Tue, 27 Oct 2026 09:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793093779;
	bh=Dplzi2jZF0nyquCM7rHIi1KSd7Abrm4kSHyoRVVxXRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Aj/lYZAN94E+6oT9IogJZDY05+cE2hW1lTqN2T63l9yDpAGpWcsfyg1/t3Mup8w30
	 wJjK3nV1p6T1ggPDeD/x5scfRxApF9EkOpoFvra2dF1dLjxxEvI4+iQjc/xtIbu+dr
	 5kPrz9bMduX6FgzsCDjVqlOXmucjsI92g8Ehw5Z9jJKVA6sDxbkBQj5STdbeoMp7qt
	 2caDa5n3rjWAjXs0iIlQmsdE4PISikdcKPzWaAk2MThAmkzgeALKqWVro8pFRGh8Qt
	 ZkbmWMND8JyQKudyxAK2deV7K7NfXYveO387oxAbggPHn1s+t7c5nUHzlWrZXUzADs
	 hBTXght82atfA==
Date: Tue, 27 Oct 2026 10:36:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	andrew@lunn.ch
Subject: Re: [PATCH v9 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Message-ID: <20261027-savvy-powerful-seahorse-cc1079@quoll>
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
 <20261027034911.99482-2-prasanth.padarthi10@gmail.com>
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
In-Reply-To: <20261027034911.99482-2-prasanth.padarthi10@gmail.com>

On Tue, Oct 27, 2026 at 09:19:10AM +0530, Prasanth Kumar Padarthi wrote:
> Document the ASRock Rack B650D4U BMC, which uses an ASPEED AST2600.
> 
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index b7e70868e..3e6133e2b 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -79,6 +79,7 @@ properties:
>            - enum:
>                - ampere,mtjefferson-bmc
>                - ampere,mtmitchell-bmc
> +              - asrock,b650d4u-bmc

That's v9, so where is the changelog? I see in cover letter only v8, no
links to lore disucssions, either.

What happened here with previous versions and reviews? And why is this
placed in non-alphabetical order?

>                - aspeed,ast2600-evb

Best regards,
Krzysztof

