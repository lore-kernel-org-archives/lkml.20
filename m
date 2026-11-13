Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568741;
	b=OVfDIcQ5fRfejZJdmAEZJHDIuJMUSQ3eogoW9oOwRtCxJ8oRG2wjPWW37kbI9uDKBVjU
	 5LtYf4q7kx6lxSTu1c0afR+HNywOhlopwTcKcnmcfLKBqgoqu+7mpfuLML2tl0nyTCZ30
	 BcpIsgQcZ9fmQvpOnAbat9iSgHAEpNSRlRTH7oQwzjOHfWLMRHqRJRKljjUJZPBX1Osao
	 rq/vf8blDeT3qiv66y1QNdXJOFx57mTt67W11lO/6mf5+ewRijfiCj8/dp1iQSpaF0URV
	 ZMv4vAZ/Q5obSyBBWmeK3p+UFbr+lNboU4FXb961eBxPDtMGdFeqnzF2OuDT7bpe5zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568741;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BhUc+loYeQeFAucZRhpK+U371nZnwy4R6sM3xX+qyWo=;
	b=w4oquhyzTvlz5l6s77bh4OGyRITCP8vNhsRpIGGxsAuA+JxzoddUejWIBqijeEdkj3e6
	 ZQKD50U6WYxrTSXxZA7CKnoDnqoSEpg73FvasngQiZNRBeliuQrOKsxUJaCM7Tw3rzr8Z
	 LRE6jgAFokm8QppzMEZi1NUDP49KHaNWPeiwD7fDt1dpdNV4rEBXYNHOKzBKsOvQfOzLX
	 IN9VqoCP33qFYwYxamR4CQExZ1RjDAu1XpPcWUVk5V3lFPyr0ezNcy4R9jzf7K2ZqfAtI
	 L+b5h/fA2udebtC2C/Snv/42chTmB5kkzeLL+rQIBV1tw+Dz4w8ZvE2dFBKJJVHHmrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ns32XsVF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B190E606A327;
	Fri, 13 Nov 2026 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ns32XsVF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529FE1F000C4;
	Fri, 13 Nov 2026 11:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568741;
	bh=BhUc+loYeQeFAucZRhpK+U371nZnwy4R6sM3xX+qyWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ns32XsVFdTP4pqhFzMv60fkFABb2IBWhKARd9fB0cMTO8dsEZdJZFgV1tWNB/NZdl
	 Vy/M42B5HSuuuZkMuAGWCAlSHIr5WHZ7/pYCjhdrYx7/S4A7t/BqyGEtCVDbA5WhQS
	 jpawoN7Idu7GJn477/uuWl0alf9XyaxNtEXFuU5KOgU6pHgSlxA9GN2ZJPVuXzUdd5
	 iEbBVwokokDUo144Jns2TMmkVHCYgx1NzaZiU61ak+nWfrRLK5Ewy6r9UBo8RNLBkQ
	 FHLahLWoRADi5IPvngUmyXr1dkQI9X/hgU/fLBm4A07857MUW0xJqSFu/VYWjwb4Hb
	 8V115NwoObfTQ==
Date: Fri, 13 Nov 2026 12:18:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: fsl: Add Aquila iMX95 with Lotus
 board
Message-ID: <20261113-elastic-sarcastic-trogon-dc2eb5@quoll>
References: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
 <20261112-b4-v1-aquila-lotus-dtbs-v1-1-ca150bb4b0f9@toradex.com>
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
In-Reply-To: <20261112-b4-v1-aquila-lotus-dtbs-v1-1-ca150bb4b0f9@toradex.com>

On Thu, Nov 12, 2026 at 11:37:33AM -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> Add the Lotus Carrier Board mated with the Toradex Aquila iMX95.
> 
> Link: https://www.toradex.com/products/carrier-board/lotus
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

