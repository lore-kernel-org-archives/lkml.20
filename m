Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FB4339376;
	Fri, 11 Sep 2026 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116474; cv=none; b=mVcvaYkyQebVCs3webLBqXVR5gsntddf/1vBXDa2rakYoYrqJXD8WYJ+LrNsxcDv+NY3eXhCY1vuo0hfxplUEHTzqMSf2orTsiM0tufCEmwrEnApVBAHBrq2pOHSP5oAiKCUzB9sFLRzuRf179qCIAvBT/O6kt71gWWOUU8jYFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116474; c=relaxed/simple;
	bh=/k0HmIVfwRp1r98JlbpsdF0cuIG//jVS79UzPfXdCfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6L0xmUsf1u90P1JwZijK0LWfdkWUxLXJnGs3gp6Og3s89yWkSNmsSUb2o4tp8CXBS2WDKJvI5rWnP+2JCNvtem6na27yKJ+eJxx/0MxLnudCx0Iu07yfEezeIywja/H7+BerHBlFQG/cIeIR+lLO6FMTUJcl2J1R2mVX5YbQaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKBkS4kL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKBkS4kL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B5E1F000FF;
	Fri, 11 Sep 2026 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789116472;
	bh=VKWEfBt7WvFReq3E3/cEOsq0CGvWl4f2Ylunt+Kk9gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lKBkS4kLtja6upngeOs2y9+xmcYZK5zy/MgcV+b5TVCV9EQRs3zn6rcZuwWw1vWYc
	 i2wr+UT2wwveO1rCo0uTsc4XjuuhsipEDa/mjzUIr+hMa0U7X5Eh+PwLjloOgeLVX7
	 H2TZmNOa2CUXv2MQE72mWauX/PkurQ9Y9SBNf1TDQP9j2NKppKlwdOLT3usL+BXLeD
	 4nRwyungZwSN+jpRDx1zXwgKnLJlFs2QRSnC7fyWjcK9DR1lPrw0d7OoYeDUbqs2p9
	 EgujoIS0xJXAPhRbApQToPDSCHtqkEZMjYOyfPnL9/FFXNRIK2A8OwrfBj80/1EQnN
	 plPmNfGyb+zyg==
Date: Fri, 11 Sep 2026 10:47:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/7] dt-bindings: arm: fsl: Add Toradex OSM iMX91/iMX93
Message-ID: <20260911-dexterous-elastic-alligator-6517b8@quoll>
References: <20260910101616.139270-1-francesco@dolcini.it>
 <20260910101616.139270-3-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910101616.139270-3-francesco@dolcini.it>

On Thu, Sep 10, 2026 at 12:16:08PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add bindings for the Toradex OSM iMX91 and OSM iMX93 SoMs and the
> OSM Development Board they can be mated with.
> 
> The Toradex OSM iMX91 and OSM iMX93 are OSM 1.2-compliant SoMs based
> on the NXP i.MX91 and i.MX93 SoCs, respectively.
> 
> Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx91
> Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx93
> Link: https://www.toradex.com/products/carrier-board/osm-development-board
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

