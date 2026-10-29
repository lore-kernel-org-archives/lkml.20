Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267495;
	b=j1Jd2t08BcpVPzlHAc5QL4zQIRWOPiTu4ykxmgjdCfPkErIhHRf+uBvAXBAO/4mXwpcL
	 F2Pj+CPFx55JIaG2pNxfkjpRlJHwN98dZ3P60nIe9UBdnc4Sl2ssOAvESz7N3suIOw3/e
	 d2iFXJExKGo7LONZ4O38Z4DIyhEb13YSlvDWjtLNmf2grCLeLDf/P8ejryl+ijoJQUzfT
	 v6tM0rdo/E+jfWr/qJ2bC81JxHoGiXfJH6cDLl/NqX96HqsA9z7ysSfJ4Vi2hb7kS7+UA
	 zUfDneyRrpFNywdWICsauem7bBGrOsVHPDML6d3kvhT05xWLJArcbvtpKUQ/+oAAaCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267495;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZrDU5unb+/T4yF2u2+zJeMQA2Fa/YM0sDkOzIuNIOD8=;
	b=zwsit/ldsCd2aIugRfXHwQUUG9KaVVdZsqnGWKil+FYrIdjld6lbbnWlXsML76cQHhoJ
	 iDRFHM9TOrpNxRevQumsaKTeEjRN2eS0V6QOAWq4rtg/b8XiWCEX93VL1koWmI1zwUEXD
	 ozYHWU6rXo5OZcMcNXnNUyqrvZCYjubR31XXuo1ufHoC2mmexfUQZrPqhhqkMtS2zh82f
	 p049wcP1PuHp+mggwi7MRcF9UIWYoGny9VXCDKlyMC2brMCczFdeDOjiWDcSZqKKdCWju
	 4i4ZaWJV1lutU6Px/nW3oFKWD79KH61wLSNEbm64CPTG4fy4u1mOdOe80XiYzbeZVrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RzkRbN1A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAC0606A31A;
	Thu, 29 Oct 2026 09:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RzkRbN1A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E2F1F01825;
	Thu, 29 Oct 2026 09:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793267495;
	bh=ZrDU5unb+/T4yF2u2+zJeMQA2Fa/YM0sDkOzIuNIOD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RzkRbN1AQOWsju/INxyeR8LepG3KPjEBLYl3lBkWKEx2Bj68VKmlGk9BCrLscuSw/
	 IXQyyN/JH/ysxLkEeJKrjl2b3M6Z5jbKI/4tRexgXL4sdjiydl4sy6G7Pf/TB24IEs
	 P+rCGFvW1hhELvxhX8T+eNzmW8EJmtzzp7HBzq8ZfQ4XEfsXxoV+UgDQnEci+qIb7q
	 mCRlBaUGKyCHIFIDk60BuuYk5kL9IMO8VFmsR1AdBoOHAeYBY+810O0KsCg6mo6zAO
	 gt/9T2+K9UEoUKfiqPaipA7YVCqNR+ct37oXxxpnaDAwPv14cnuIKkzKzlI5unzeT6
	 e7sWNVgI0Hbjg==
Date: Thu, 29 Oct 2026 10:51:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add NVIDIA MGX Vera C2 BMC
Message-ID: <20261029-camouflaged-enchanted-mushroom-d447ef@quoll>
References: <cover.1793243187.git.jackyhuang@nvidia.com>
 <ed348a94c9432eeea53f50448a61d93f99de7821.1793243187.git.jackyhuang@nvidia.com>
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
In-Reply-To: <ed348a94c9432eeea53f50448a61d93f99de7821.1793243187.git.jackyhuang@nvidia.com>

On Thu, Oct 29, 2026 at 01:58:07PM +0900, Jacky Huang wrote:
> Add the board compatible for the NVIDIA MGX Vera C2 BMC, which is
> based on the ASPEED AST2600 SoC.
> 
> Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

