Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513753;
	b=Wo/nb3FMQrM5AS46iQPsmIurXWbMvkA257rm06wvq+1QxGL4GIlXkcY4cZE1tjl/GRoD
	 67Th5EI2GktI/jlKbMx//kkQLnb7miyZ16ISwf2vJ1y/pLAICIvfLzk5p8E8z8NAx78pT
	 vnjRYGpzLbJu0fC6jkeym3V56I2jdFwG54oa0vjpvNNEYA4lwMM6fjBCwOOG6HNwr2URG
	 +jBxCAWB+8s9oQ/YsXAblheWhzu1Jjr1Akq7s8SWbBQwwY2s4Yos3vWQmzYV7Y/8rm0n8
	 OA/zV0aU/6TOwmG9DngShrhHv30SCOi3wfr1JOhODSG/euKHNQ6nt02TkxjI+CftgQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513753;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+jdyq0Zfmu33A//X/4Q8SrSfQyWMMoDDtV5zWpBiENk=;
	b=SH59YE7r9b5dK5sGEhRwZmZ1IlJzN4DgEdsL1x5UN+pWA83QsxZ5i9zaQUrW7L+Tz0+A
	 HldbvPMH/DDcUa+2m8N/KHCZdEJQGYEtoCiD6kBKeXHclcBYKI4QnTrLk7AErMdGcThgr
	 qaWfWBcscoZgPniLyxhnBJXQbocEL45FoiNWpUWvlQL2sCv5FEgqp75WX+HHa1cK78D9c
	 ++dx/hUVREY0ZafUGcr0C5OVaEB4GhnQrihbM4TetyfDQC90VDzGCW0oLMh7M6ZP44N5/
	 JGmxd6AJHPgt6wl1bDIMFibbOw66fOXA5qB36eIsvtnkn+5eDchxmtbZcFPTrfReDUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a8foUJMU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3F0606A319;
	Tue, 20 Oct 2026 16:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a8foUJMU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7161F000C4;
	Tue, 20 Oct 2026 16:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792513752;
	bh=+jdyq0Zfmu33A//X/4Q8SrSfQyWMMoDDtV5zWpBiENk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a8foUJMUqu5P8nKNaWlNLtBvXMXfnCOSwrfbCydwXzOCOwyOLWOebj+1l10GTer8h
	 zsAEyQyGQeia0G4wyPi8tP1/HOz3S1r6tDqL0O0E+QAaxHrxPasJbjvusut16walxr
	 2LyYRwbJnG68aDBb+FHDuG2OVSWQfJkotjPte4vOcuw+eISVmy0eBtTPL2Mz4eLmKk
	 aidzs3wwJ0pkxCpHds+sahsI6kBunz76pRCaGuflKNYQ/kkZ5XJlFS2UGfO7rcRBKR
	 d5Dd+DhMu5yPj6Lhbah+g+UMaR3fghb9giemCvasfEds9TP68TCT0zTjQU5q2mkom1
	 GaGDfgsY9luRA==
Date: Tue, 20 Oct 2026 11:29:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v10 1/3] dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
Message-ID: <179251375007.3988760.929772865298588176.robh@kernel.org>
References: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
 <20261020-upstream_pcie_rc-v10-1-fba209af8656@aspeedtech.com>
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
In-Reply-To: <20261020-upstream_pcie_rc-v10-1-fba209af8656@aspeedtech.com>


On Tue, 20 Oct 2026 19:59:49 +0800, Jacky Chou wrote:
> Introduce device-binding for ASPEED AST2600/2700 PCIe PHY.
> The PHY provides the physical layer used by the PCIe
> controller when operating in root complex mode.
> 
> Describe the compatible strings, register range, clocks and
> phy-cells value required by the PHY provider.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../bindings/phy/aspeed,ast2600-pcie-phy.yaml      | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

