Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482422;
	b=R54y5BXieQLMZAJXvgBTs4jbTmAJZ5qOy0UxiV0Dvij41EceFX3AtDJvZXZL4ZnSyA3e
	 uywkdgJSI1GiFuSVSR3t17IU5Kg01T06nzFUcIg3/cZAXPRSWEX1UuWUBpDeKuFIoAIFD
	 TNGOAfFchPZ00LONzGqNFr6tcLdD2ykoCjV122Sn83snLvIbq3oUPNpdBlxPb2t06Lz9/
	 OkhbRhFYMwBBRYze2z2nw1LbomdX8ft8SvgJyCBvzEbgpmNwS/bSrNiNA+NayYpFfy+/7
	 mhmC2Pz8xTE+9xzqMfm6jJng6hdCkHUppqMhTBiN6X2eS+TEHRYPd42fNM0AeoJA1Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482422;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=D0muWOhoQ0tEZKS30AGh6Dci91ILHagLlBaq3eYFtng=;
	b=Hsb6StaVhwnGvyjyaFw07NTijYXgr8g428iLHuM5XeNteE0nV1E6OfcTfchUCSm4bd4S
	 WmAxm9+i+4pRdkCzcsFpN3nMlMjrO/P5ad/gcGsJGbGnGiNjOogsKd+8OOPiB9hBTI3xV
	 qVFYVpiCjoauDqd9RNZ0Lu2eGzk09anZxS4flXrMfS8U0jwsiRkkp4zVUiJzB+CfZ+7mV
	 jC20BjjjB2rORC0qwfRfnmoSGWXuQSxOZVx6N6J06RD3GfgkUKVKvdapOAMLKOdsiQVtm
	 1sZBbzgJUfEU7mzAxMJLPfSb7VnI7BoGXJIrymv1bHzTfsWzRtZsyYpk0LnQtUIvCUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="W/JWJ4q0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A871F606C161;
	Thu, 12 Nov 2026 11:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W/JWJ4q0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6431F00AD8;
	Thu, 12 Nov 2026 11:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482422;
	bh=D0muWOhoQ0tEZKS30AGh6Dci91ILHagLlBaq3eYFtng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=W/JWJ4q0trAwrNUTMwd48kyOdE2oujP6zEW7lypxH+tskkuk6rRNqy4YJh89lu78D
	 Gh5dV03HXI5iRQphl6ZGbAJ6NCrAL41KUSaQ/+G+BW3+Zvzkr8t+McTSt0KeqWAjdW
	 xr+Xo7GyAIS+KcH2f6d5Rv0DqPS/cIAzvrlkHSMeM10o++oMq7xgMT6oOvngoya4aE
	 94WFzO6LV5PAwfglSdn64Xn5CiPBGeQR/ORM6gw1tahivyOIhkVI9Y5V8pgq95g2aK
	 QsMO4WjgcD1KoTTzlvHnVeY9w3eIe0aIemLcC01Pym/FKr+F3LdF3//EQd77bF/eYM
	 DIueSeqbKbvnQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, 
 Jacky Chou <jacky_chou@aspeedtech.com>
Cc: linux-aspeed@lists.ozlabs.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
References: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
Subject: Re: [PATCH v10 0/3] Add ASPEED PCIe PHY support
Message-Id: <179448241801.492462.15920568972028232724.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 16:50:18 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 20 Oct 2026 19:59:48 +0800, Jacky Chou wrote:
> This patch series adds support for the ASPEED PCIe PHY, including the
> device tree bindings and the PCIe PHY driver.
> 
> Summary of changes:
> - Add device tree binding documents for ASPEED PCIe PHY
> - Implement ASPEED PCIe PHY driver, including reference clock handling
>   and an AST2700 host bridge reset sequence
> - Update MAINTAINERS for the new bindings and driver
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
      commit: 020ee21a7ae584f116183867c41e8f8bddecaae7
[2/3] phy: aspeed: Add ASPEED PCIe PHY driver
      commit: 256cc8295557c134421d0b48ea37f6c9d4f232fe
[3/3] MAINTAINERS: Add ASPEED PCIe PHY driver
      commit: be45a1d5c3fed409d909d031547183144a806718

Best regards,
-- 
~Vinod


