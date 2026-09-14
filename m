Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E732E6CA6;
	Mon, 14 Sep 2026 10:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380897; cv=none; b=M7MJ4Q928wj0jB1oI2z7CQAW7Wr+z2c1KTN2015TAYTlzodyygP8TYrYf19+l6urL21FYhtHn+oCwWs8m61sTOGJKYGyZUG1xJpiKrYoGW5xZAF1KyR4pMXxklkqzcJfpkrM2s2E9N+46/1yEhSGe4OQC55mN9kQpEX60XhFnyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380897; c=relaxed/simple;
	bh=L9BQcZ89GV6RGkDsIMoT1B+9EdqsSp5iDpytDOlQlII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ux+D3TE8i+w4Gy51Pa6zfR4NHuQ6jK82OXFe4Jiy2JBkG482jCtI0KGfzJdc6PAnnWIBWgeEIUKUKY0zghVYTGBjizgc+FQpYKPHppf+RUd1BcsguMw99w8wUCK2qwJD8VScgH0znAt8KDFmVi7pgadSgL2rLL1FTB7eZWrBZwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YS4of+TH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YS4of+TH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570EE1F000FF;
	Mon, 14 Sep 2026 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789380891;
	bh=SRUSOiwe0L/larYPjqxFmRfsiCTKfw6OLlxz+WzrfBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YS4of+THBrhzwlUaYoWEfqfVVWZ2jgZmXD+XvQbGoQe2mHSU+sr6rbVJFmnmAmPVh
	 uECaHAucYYJuoQ3d4WJUMHZDlWQIskMSeRGlaSWhZnL1dwuxBPjsFanxQFpcD54rUJ
	 AuqoAaIKp+TpCuJwsKJJthQyIGSlHhIc1P3PUNVwX2I2M3Te4TY8HXm7Hq5Cq4Troy
	 8X48d27Exa3KmNzi4YejVEIknRPWETwIz+1qIZLgcjvrKnGE+nDlwGl3Om7eEOIzbo
	 ZCrCHpGGVytewWJqKBtPIDeCo3VxwmxI1frrVRosaPC7O8ss6zWBunTtZNVrqAita0
	 nKqGBtwCT0wUA==
Date: Mon, 14 Sep 2026 12:14:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/3] dt-bindings: arm: fsl: add Free Mobile Nodebox v3
 CPU Module
Message-ID: <20260914-private-psychedelic-scorpion-9c74ad@quoll>
References: <20260913-for-upstream-nbxv3-dts-v6-0-058566b93ba1@free.fr>
 <20260913-for-upstream-nbxv3-dts-v6-2-058566b93ba1@free.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260913-for-upstream-nbxv3-dts-v6-2-058566b93ba1@free.fr>

On Sun, Sep 13, 2026 at 02:35:25PM +0200, Vincent Jardin wrote:
> Add DT compatible string for the Free Mobile Nodebox v3 CPU Module, an
> NXP LX2160A based board.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

