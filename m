Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F2D3D6CD5;
	Fri,  9 Oct 2026 10:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541370; cv=none; b=cLeaRB3pmCAazt6YKD0P6GyeQBu/DRCzoTiLMx+IDzUpMcvwwpZrBOgLkOcXK4b6TliD/w4H0Jq1A0gI1hylIv1/zrY+o94N7djOu5b1b0mWxxuO47x4EK57RKcehUlQK0cx/iO/XPxx0YJH3j/ZztTNFa+sJv7YvEZ+tIeJhn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541370; c=relaxed/simple;
	bh=Hd0FMdzu0y1SF/lIOubkmZBiDg7SLtjvRGJ+Vxmy4KA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7eomoRfmZna2j3wse2FtHnzbsxaRkEJYdvC9/+PRR5oeuWBw2su1kZIZslwnY9AD15jTLIhlSxxNRyTmq1z0nAdUZnX2qbqrCd8MUoyVExA7BhtvHSYeP0jHB8sHeaTtifa9MBjDcNCzSvnGQuen6XocNY46zxxPg7mkrg6P8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNtbgk/H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNtbgk/H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2186F1F000FF;
	Fri,  9 Oct 2026 10:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791541368;
	bh=aiuVVmjDxFja6mEi48+BQ4MgfN4UMQG6MWoTBxBEvCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NNtbgk/HDvEUXitP5GQ3CoS1QSFn0VHVJWNdFpTDDbz8+vz4UVXoox4HjB/zIqlVi
	 CC4i9ojkFBOrRIEwH5Nxirvvvd0uGBbVeOxGBsjTmF/9W/52Ve40MCVrs5M27ammhG
	 8dDNIpvHzodHNMnFIGJXqNLvlbdZpYzd3zej7JqlbiHW29VG9m7bL7hUoEJINWkr7X
	 xbxFJ2hGIPZWCd4UdjZOISr7fQ3MgQPRGsmnm4WS1XRs4RGN/YIdv2x9EE8VOE3QvF
	 sKfw+8cUyC2i22aBbtyMJBG1bPgSNCUNX5sZKm1JyryEjfkAh3jWQFOsTjr7YI+fZd
	 /z8HAb/kF14Vw==
Date: Fri, 9 Oct 2026 12:22:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	=?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 2/3] arm64: dts: imx8mp-skov-revc: convert to overlays
Message-ID: <20261009-aspiring-wild-bull-1affaa@quoll>
References: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
 <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-2-11fa90f531fc@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-2-11fa90f531fc@pengutronix.de>

On Thu, Oct 08, 2026 at 11:16:00AM +0200, Steffen Trumtrar wrote:
> The i.MX8MP Skov RevC jutouch 10" and Tian 7" variants are pretty
> similar, apart from the Display and touch controller.
> 
> Move the common bindings to imx8mp-skov-revc-touch.dts and convert both
> variants to use overlays applied on this base version.
> 
> Add a compatible for revC-based Skov boards with a touch panel for the
> common dts.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +

I guess "squash these two" under second binding patch was confusing.
Squash these two bindings patches.

This style generates checkpatch warning, which of course could be a
false positive but git history would tell you we never do that.

Best regards,
Krzysztof

