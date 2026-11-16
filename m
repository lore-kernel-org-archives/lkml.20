Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832700;
	b=dgPj7p6mS3fgg9hb6UlfIO7sJ4f2L0wsdjT/QSpWWenOGDgWWFu7qy20pnyutduuBEiP
	 h4rG6gQyeqT9voocwelU0F0AAz+R8pULQ4LdOxo7vEgq6ET838BoNBz7UJXEWe/2OxGL/
	 CFSLVM6zcbtrimlgwws9MXIvaXgc7cdQdQIp8NBwtHfJSPhH9X+4vW9oQ35g0TlubApm2
	 aPMlyzn8V8NOJOAFEMiqJYQhcRY14qz5F6Foh2BZQ/RnOJYhSWSrweQ6NdL/t3RHM4Pgs
	 QIKlpvb0Gcy/AmZlcvIxh6OZ6PGnnXjKEzQw9YGhvXBo9Xd+TSuSCG4c6LvK38iVZSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832700;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mma1p3Olxpcr1uyRLTYWQ4yU5K7NKi279XVuRQPWbaI=;
	b=U3ju5hhzw6UZt3/eu9AnMEnpOaothJhPvkEaZxJkB12UbEJCIZp7oXtY24K1Y/JF0VY0
	 VW82tagaVLqCnMAxe995DXNOsPhWNJbzv8572Yxr0ytybVkM8zytuK0NPXO+UlFj7LGJm
	 VZl5zMME27tesOgfCBovmGlnmn+Aqaw5MdL9DH478qcwnZhWtLmUZg7jSNh2788r/gbOH
	 v+1s6kszQVEbTukPRQF44VEJskNI9lIPKVuNRPes57jE28cOA3RE/WmConHXHw+MlroZf
	 Rqgcqm84gQtCd1eCXD9lB1onc0H0DexPLNKb3LyiCCiQbdQWJngxQEAZ0EiS3lw9Dww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HAH8iWXm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A159606A323;
	Mon, 16 Nov 2026 12:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HAH8iWXm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0F51F000C4;
	Mon, 16 Nov 2026 12:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794832699;
	bh=mma1p3Olxpcr1uyRLTYWQ4yU5K7NKi279XVuRQPWbaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HAH8iWXmLrujVJdakpe7xbu48T+MrfY6/JXWiO+R746WS+eDCVyrgQQ1uRt0rXkYI
	 Ba2SyeSMM2LdZQf/Git1nC3uGcWrPnfwoxe3xsL1p8oOd8pSVedXFuTFxMjvb9ZFTj
	 acvBLlyKH/ThnbGez+q9MaYzQ0cg6cxeMke2QRGHfWePJCgbxzz+KaE0/pJwVlzQgz
	 XzYMuiCEPMkNF/SGowGMdJR5AjhpfHg1U/qS2I28ugWUxrugfY0P3UrTweE+rHNcen
	 HQKxRtN9d9bw75qjGkYzSEW47KKz8BcyOJEgdwu73XdX1Fy6TN4S9s7v7bjNuTDWHa
	 1xjFgYpnAf4bQ==
Date: Mon, 16 Nov 2026 13:38:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: mfd: x-powers,axp152: Add the AXP2101
Message-ID: <20261116-foamy-honorable-loon-d441c4@quoll>
References: <20261115171150.64431-1-olivier@mgcrea.io>
 <20261115171150.64431-2-olivier@mgcrea.io>
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
In-Reply-To: <20261115171150.64431-2-olivier@mgcrea.io>

On Sun, Nov 15, 2026 at 06:11:44PM +0100, Olivier Louvignes wrote:
> The AXP2101's interrupt line is optional, as for the AXP313A and the
> AXP15060: the driver then registers only the regulators. It has no DCDC
> frequency setting.
> 
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---
>  Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

