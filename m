Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253EF47206D;
	Tue,  1 Sep 2026 08:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252279; cv=none; b=nlUmS4YSmKvQ+Whx20qMi+PeeXK7QWOOgGRdu7QCkTiXY9AIIWb+lyvurwvo2GQeSYciCWISL4VEFjTys+eS1+rs2STVMH3l8mG9t3E/sHZs9XO1iRhT3hXkd6J5OCAo39ahgxjMvYNCqonv5xgTYUv2NbQnNESN/nq1ZXDtTY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252279; c=relaxed/simple;
	bh=waLokgTKeCW2/XIr1GwolejHVqtzD1sMDk0xPPgq8u8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgS0aCdY4vMnpjmKvTMHZT7U3Hktd92GlXjumPBrf83MkRZrLELFxll3KT05c3tHOh2+JBPL8s91SxehtF0RgMNbzFkM2G0LXyUq2gavNvinv90kMPMgai7Y79q3886FUxz3Sud4Ag/Vnk1Y8lAWK+UJxQT/GVD0vpkuS5KFBhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVHIjT7E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVHIjT7E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E3B1F00A3D;
	Tue,  1 Sep 2026 08:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788252270;
	bh=nWVnKg9MLKgmRi+FrsceWTa+c5GkaZWyU4XQHMrCz/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fVHIjT7EzW3w5KsGUaNKdS3cC/LRF22hV9DAPH8PNyUt2YriP1NcEOBLsiYmh3CkH
	 MQhkg8sfLbHvlJfwwS+fAlet/QILfaIgR7+88OUAmyjLL7+ViYZZZ2DQrjHfvzPunZ
	 zGDvmHJk70l3rEV62rfwKsaExIE9ei43psS/eNz2QQBM4hq0b4jEedxSDF5swszF2F
	 H6+lFlEU9GoExd81STzxk5tKMbikN+cNHI72kisumndOASJjtbJJpL579tKAHFO3iO
	 NI6bfzvqfC8+WwP4VRmfvOBBRl2t+PacGG8MLMVGH2pzeGzME/eWEgcelJXNkj7Ejm
	 Wbg61PdKrcPBQ==
Date: Tue, 1 Sep 2026 10:44:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	=?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 4/5] dt-bindings: arm: fsl: add compatible for new
 Skov i.MX8MP variant
Message-ID: <20260901-awesome-mahogany-starfish-e90aa5@quoll>
References: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
 <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-4-e2e635452ba9@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-4-e2e635452ba9@pengutronix.de>

On Mon, Aug 31, 2026 at 10:17:41AM +0200, Steffen Trumtrar wrote:
> In preparation for adding a new device tree variant with a different 7"
> panel, describe the DT compatible in the binding.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Just squash these two patches. Adding compatible per patch is just
churn.

Best regards,
Krzysztof

