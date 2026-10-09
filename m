Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F3118C332;
	Fri,  9 Oct 2026 10:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541284; cv=none; b=m2GZ1krLvsaY1TStQ66clSMnYboiLXB8Y+O6ApVTt0tEibOrFglNsxLW84PWEF+QLIC7dt1ZZKPAHbmq0oGbqausprpNt1/FH0oE0wpee1S9nAGm8yqXxWdlROxFvFM+Q7lqp6Poz51dasUjbWzokWjhlb+6q6iw4xJe0g97QKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541284; c=relaxed/simple;
	bh=moHaDFIMODiT0YRwtqriryLz2iA3eyfBKiLRFVitD98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufBpq5QdE0oF2w4iRGyxIVfZyMMtobdQijL59eirKibxn0IXghNAFFy9t5GoeiP8Ork/6wRoLpTkcDEnm3V9cXDvGUSBsfacMRfnN45MWRLE4YcuVugTssgbIHAuIZXnF+3ljz3YayT0kt7eqOJUfiOl3DGVzT4TpFEGZdOd6fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5cvMEgL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5cvMEgL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7654C1F000FF;
	Fri,  9 Oct 2026 10:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791541282;
	bh=YIpPz1UpL3BQdxIYnLSMw5YshVJjbS8hyfzOYYSfnhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y5cvMEgLaLkeEj2DUK34+2bylqpEZVynN5T0cYRkzBCUfc+Rnd+eRFJ4QzX/4zdDz
	 3A/LJdi/4FVwRQg5HoQrNJZyZepbdi4tCWvBz/4Wag+Hr85uEBMYdFUn9SqlaLibIl
	 yicsJa0nQi4Qb9H1vMwpXrkODEDqdt4mWxbqjdgUwPKr8mHAHWjd5FiK+MEZWQ1iwO
	 4E/SoDsM7dmXLmNiP2pU3gViTBVs2qWewhD6n4CuZPDEBG/CtRtBHfkGpgKvYZX525
	 4uI0kFt9f7XX03G3YcM6fB6Q5vkKZ6+L1BnF+EWwy/5zvRXxBO6dlFpW0xwCHy0UQ5
	 NS6Be/cluAiew==
Date: Fri, 9 Oct 2026 12:21:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	=?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 1/3] arm64: dts: freescale: imx8mp: skov: fix sort
 order
Message-ID: <20261009-obedient-vulture-of-courtesy-6a061c@quoll>
References: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
 <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-1-11fa90f531fc@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-1-11fa90f531fc@pengutronix.de>

On Thu, Oct 08, 2026 at 11:15:59AM +0200, Steffen Trumtrar wrote:
> The imx8mp-skov-revc-jutouch should be alphabetically before the
> imx8mp-skov-revc-tian variant.
> 
> Sort the entries in the correct order.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 95ae85ab4adf5..49025ae465f22 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -475,8 +475,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb

Odd diff hunk. Next has offset difference of 300 (!!!), thus this
suggests you develop on some old tree.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

