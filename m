Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10DA18D62A;
	Sat, 17 Oct 2026 17:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257873; cv=none; b=ojLE6eZUKG0U95wmPS0D14IsgvjAZUpup34YpEuDjM26HsMXOv9TiVd6lVD9/bjhTd/6m9lL9FqrqlydUJ7Y/Q7c5PudrwPKaoj8dKWhevbqCniSM5IiMQ/Qxi+qyYUDZp+bpE9zASA0CS40qaTu0AW+exUptJX0kwZk0SdUjCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257873; c=relaxed/simple;
	bh=pYQb55FNnYrg/PjbDQ9mlPCLdI5y4pVtxidLaFV3pT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5unXefXsEoQ8NrUwxTKmHwWTgc6bxGALRcsWDBzkzhjxfZePlkRbHOWoBVd2qtoKoePmqH2WYqZGO1QU9gWRHL6jYvPP8ma4fDA5ibRwPQGdqVj7hyMUwWAAUwSQ3YWMSK/jQNEVprpdmjaOcmj2OUeY8bM/saNs0pnKH/YRlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORf3IN3i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORf3IN3i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 003A71F000C4;
	Sat, 17 Oct 2026 17:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792257872;
	bh=sSDpwvN0yoSV1vrqdzCv4HHzV9QnxibI1Q5Gk8f/Jl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ORf3IN3ieNKp3nEkixkDrUvQWzbomLdlA+SRHSLCDzLpC4Rtb1fcX3rH05tjOQrea
	 V5MuOw96wMT3IuIfmeNXHE4HiSAWtXzadA5sMzr6ZTBlsFrphODQuB5NUJyb+Vf6sO
	 sBoi3OLggVRyEqXPI5HfD3nJJ1dgs8ZL4DmS4RTamSqnh925mREQWlrW2RxflvFRA3
	 Ihq674RpOyfvXBN+UOIptJ5btQplfQ2vNX2gd5+DE9VI9SiAPIw7kPKcKBSB2tbi8s
	 nTjTpCOIzWE8MErPWpgUMl2s2Gof3Xoys2+9mOAQ1dm4EoEf9ZA7EHkONvZoFOkZD+
	 2idtfG4elTVHg==
Date: Sat, 17 Oct 2026 19:24:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason Yang <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Guochun Huang <hero.huang@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Riesch <michael.riesch@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/8] phy: rockchip-samsung-dcphy: Add a second PHY for
 the receiver
Message-ID: <20261017-merry-crystal-crow-d2a4c9@quoll>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-5-e63b49eabe2d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016-dcphy-rx-v1-v5-5-e63b49eabe2d@gmail.com>

On Fri, Oct 16, 2026 at 04:56:39PM +0800, Jason Yang wrote:
  static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
>  	.configure = samsung_mipi_dcphy_tx_configure,
>  	.power_on  = samsung_mipi_dcphy_tx_power_on,
> @@ -1520,6 +1538,15 @@ static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
>  	.owner	   = THIS_MODULE,
>  };
>  
> +static const struct phy_ops samsung_mipi_dcphy_rx_ops = {
> +	.configure = samsung_mipi_dcphy_rx_configure,
> +	.power_on  = samsung_mipi_dcphy_rx_power_on,
> +	.power_off = samsung_mipi_dcphy_rx_power_off,
> +	.init = samsung_mipi_dcphy_init,
> +	.exit = samsung_mipi_dcphy_exit,
> +	.owner	   = THIS_MODULE,
> +};
> +
>  static const struct regmap_config samsung_mipi_dcphy_regmap_config = {
>  	.name = "dcphy",
>  	.reg_bits = 32,
> @@ -1532,19 +1559,42 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
>  					    const struct of_phandle_args *args)
>  {
>  	struct samsung_mipi_dcphy *samsung = dev_get_drvdata(dev);
> +	/* Device trees without the second cell describe the transmitter. */
> +	u32 direction = PHY_DIRECTION_TX;
> +	u32 type;
>  
> -	if (args->args_count != 1) {

So this is the part which prevents change in the ABI (see Rob's comment).

Why was the driver coded that way?

> +	if (args->args_count < 1 || args->args_count > 2) {

And you repeat the pattern, so if third argument is added, DTS does not
work with existing kernel.

Why?

Best regards,
Krzysztof

