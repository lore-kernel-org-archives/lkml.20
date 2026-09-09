Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B998A3D667F;
	Wed,  9 Sep 2026 09:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946392; cv=none; b=jsfHa1SPuKQK18QGGAfPedk4EXtUbFdDEXrwDOUWL1Lr0LAAi38fAlzvwJhNnFY4wcokbaFzP3qlw5qeiSaa8sMibYY6vobX+UkaOLEaHtENXbUDUQhuuc6N/4YPu993USNJ3CvaQMHpbEA4a+tRypFeJ/hfTc5zNoe82QvnMXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946392; c=relaxed/simple;
	bh=wdZApZYaiZG1Y8bA+60plhVDI6c5ZPFntOlo4trYkN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlFQJpBNsDuIgaeYMdwtWxTe2oLt91PPNHLRolFxbBLKKGdfNYOZPFKQ9A1y0KelGOo3k6Hnc94Q+pwMFXkPNQ3CrtwcS3wbnvRVKIqIu7dsHVNHGRU/4bV5oTb7mwLyUUoqqLbgJoLNNC/Qw2vBR8+7eZFTHlCbUh5ZL7kc1Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3wGIwqQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3wGIwqQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77841F00A3E;
	Wed,  9 Sep 2026 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788946373;
	bh=ENgg144+K/LFoBOMAkxQ/vRCNIFP/WT7XCgMLXS8a+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n3wGIwqQrnMdX2cCwOPhDa1Na7aLFlcNAymviUj2y8gXlRAjPSJVot59ygcg9ymkM
	 V3OKmePVMfM4a7OFuxN6mkG807GjhjzsmIi6TufRNu3lnrNbYuWngzMSV80lSWHdZo
	 vMZ7rzWg+MacSolN7WPbyVpDU5qOQ1kM1EO+FvHNSLPFbWnl9ZRcwjKNEtRHg66oDH
	 z2t/2Pcwl25eQ3EQhObI15zDiEzMx/x6T4CQRfMZD4OLiXBwEMoYVibIrSXQrdsVAD
	 X7bF1xNia1Xymf+FdA6YbQlP8r6xj/iWsFKh3BINwwfQGrIRRgIgHvkhK+CeHjiOOG
	 pjppWwhsJGW5w==
Date: Wed, 9 Sep 2026 11:32:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: fsl: add freemobile,nbxv3 board
Message-ID: <20260909-notorious-hog-of-rain-8bdc19@quoll>
References: <20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr>
 <20260908-for-upstream-nbxv3-dts-v3-2-1d88b2c11680@free.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260908-for-upstream-nbxv3-dts-v3-2-1d88b2c11680@free.fr>

On Tue, Sep 08, 2026 at 04:12:44AM +0200, Vincent Jardin wrote:
> Add the Free Mobile Nodebox v3 CPU module to the list of
> NXP, former Freescale, LX2160A-based boards.
> 
> The board's root is:
>   "freemobile,nbxv3", "fsl,lx2160a"
> and the DTS is at
>   arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts.

This paragraph is irrelevant.

> 
> It is needed for
>   make CHECK_DTBS=y

So is this. Also not really correct, ABI needs to be documented
regardless.

Please use `git log` to understand how such commits can be written.

Best regards,
Krzysztof

