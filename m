Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568487;
	b=H7cQA5GjDQHlObzlTfBSZrtRAFFhuYFZAZ3jEym3cQ0AdSU3/1m06gwP8jMvSk5UgsHq
	 Lb6+BixRXYCBSC2YCMKIYfr8izD5Yv5VFsGoOPi3DHEHSjfJWHA3m1djDf6psjWk8V5ih
	 JaetCbz/Vba2RjLWOGCHKSPQIe+TxHd3qSZlJdQM/EHv2IhOrIN4nex6EbZy6wFZGgXoq
	 N1ehAhdPZFAA15TTzp6D1nSIBUwxDNR97HQ/laDZLI7rA0jVsomNDjopqvTAY36XGfuBF
	 HsEtMaizMttqHFo2JnAHCjYp2XwiUoNRYHwCb/gmwPf6/AetaNrLLLROxVIE/1TkK0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568487;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RSjAt/HMlDCwd9HAhZBJnMn5PppCuKBya5A5l4sbxrI=;
	b=oFeEBFf8xB7yERTO69xq71DI0SpiH1Z/DJdhQYnCdIXprCktOF7VSzjYxxllLQHaC+am
	 7NTJfOH/Ffi24gT5ftO29l1vVJap249nwJnzgWUZ4nun9VAViqRxpmbjCA22QszIED2+U
	 5SlB0e9asKlTNHV1Rte08z9dmT7xgzbDQlmWpKkZ5NbQwXsu7c3MOqLBkgB+olCXkjhIG
	 mZjJyIjzXndmJOtqpAqu0xXpNlN4TBcNMp7el1g+vM7dnSOMjn9jvaqim7rB1EYvOwzr4
	 wV+0JtJ0RIrpSzCg2TIQD+2vIHC5fiu7cDHA0zbyz8IasT2ixtu4JAQatwC9n43obEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lnQwca+G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F55606A31C;
	Fri, 13 Nov 2026 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lnQwca+G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2771F000C4;
	Fri, 13 Nov 2026 11:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568486;
	bh=RSjAt/HMlDCwd9HAhZBJnMn5PppCuKBya5A5l4sbxrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lnQwca+GRqb9FF4YvJn83TpBwSIlBwMgzgMqa9qPEp9/y9n7wHAJ/l/2c8O2SOW0w
	 x8xiuInuRmiCjyQPxaMeOhcfUze8puQ9IygTHDbFqSYTmAcyyYmCYaTL/JnzpCs3W2
	 lczZCuss7/p4R7vt4obWXmRXhMneCtr1cEKgvro/pVyuk0vnhSk2MRt9QLTVLKMOhF
	 cbRugcTm0ap1ukMQvjQVVM36tuxOUYZIH2pWymCzixTQ61GHGvVIv9yT+rOUHidVZS
	 nTYkQwaRgAYy/7Oa3kx86UM143eBeSL+uPbwTQJn6PUsANzWb52tKpcFbgeewwKXHJ
	 zIT3TTAHVikig==
Date: Fri, 13 Nov 2026 12:14:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: mediatek: Add MT8173 Amazon suez
Message-ID: <20261113-marigold-narwhal-of-kindness-8ea023@quoll>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
 <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-1-77b47cdea702@gmail.com>
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
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-1-77b47cdea702@gmail.com>

On Wed, Nov 11, 2026 at 12:19:50PM -0600, Ryan Brue wrote:
> Add an entry for the MT8173 based Amazon Fire HD 10 (2017) tablet,
> codename suez.
> 
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

