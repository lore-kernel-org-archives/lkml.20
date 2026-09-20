Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766F1274FDF;
	Sun, 20 Sep 2026 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902269; cv=none; b=reibndwaEJYCNqTHlh7DUPO7zm8bxHfVDvCLsgFmwFo1jbjcq8EoUR/KzMIfwcgkhfXIr6bt2NTOa3hxtNoSHBriKhRzDs0iHMmObp5F4RUbBkykEfmECQI7NxD+Mj22nU9dOws+Dcsc04eSSGrsdppWpYtaivO1acxYE+9kiIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902269; c=relaxed/simple;
	bh=P3SQOEgE/EcVl9uIkwwYf1g4PdVesjb3lxO/5Rp/cGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jTdkgkMGJHAIM6PDJUg0tovlvj5lesH7yf4S8miyLezSY73ydiwOYljDjTMp2RBew5qTM1kev+du1R95cjrotQOHzcmubgEZ8CcbkRRMnRMjqCoD+eDUGDns8hKKfbrvIQoPHnUioB/gzNuG1a/TykuNj9Y4BwwcDV3NtO8GwvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOPNlNEi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOPNlNEi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295A61F000FF;
	Sun, 20 Sep 2026 11:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789902268;
	bh=u8l6bCKfnpTk8lTywgNZZDMe6ju/mRjx+c2z09OSzvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hOPNlNEiYAZUe79Q9Liu85a8BGIIS8E0OfeJbsnGVr30TOXlPYqwXnomyBNvhhoUa
	 9u0xBttz1oe0wjaRhXXEd7VambHGaZcJiTWBZz1Zq71mW2VSBmy+mPyrwzeCibWhTF
	 5/oPtyVPci0x4N4DSD4+IEIEjVtd9wijm2klNEyaPT6qmnOGmQ0FnrzXaxu9cjnzGc
	 oZzdx5102V3sLiVIMQXEa6dIDJ/vOizWCF6igUmJZPPs+Vh/2QPI0ekWWU1x7gMsKZ
	 ZJqbPzTVzGkA44MbVy8lQRlD38p7h46RWQMj9/jqp0DZEl3CJq69Uu3kSrEVICvwxM
	 mCIpXa2QfEPmQ==
Date: Sun, 20 Sep 2026 13:04:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Antoine Gouby <antoine.gouby@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: Add Toradex OSM iMX95
Message-ID: <20260920-accurate-hallowed-aardwolf-ed281f@quoll>
References: <20260917102011.69071-1-francesco@dolcini.it>
 <20260917102011.69071-2-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917102011.69071-2-francesco@dolcini.it>

On Thu, Sep 17, 2026 at 12:20:08PM +0200, Francesco Dolcini wrote:
> From: Antoine Gouby <antoine.gouby@toradex.com>
> 
> Add Toradex OSM iMX95 SoM and the Toradex OSM development carrier board
> it can be combined with.
> 
> The Toradex OSM iMX95 is a SoM compliant with the OSM V1.2 specification
> from SGET using the NXP i.MX95 SoC and is available in Size L (45x45 mm).
> 
> Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx95
> Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 36e28e0e4ad9..9413c3e225ea 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1578,6 +1578,12 @@ properties:
>            - const: toradex,aquila-imx95     # Aquila iMX95 Module
>            - const: fsl,imx95

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

