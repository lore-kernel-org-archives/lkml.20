Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF2F45563A;
	Fri,  2 Oct 2026 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933091; cv=none; b=dT2FQulyubuTJoNKptXBeilA9OwjNXD+PN2x5aL/qXk/u+1kvuvbJd/yyIJYQBxt5nkCl548yeMIx8K3ls+ZlfdFceLuN63EVuptRDpoZCUfNJPa3r5AI5Yea9SIThY+T2zVlCQHQN9kzVOQEh0Yg0b3F+mT5PSDx4soiPM8erY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933091; c=relaxed/simple;
	bh=O3nRINVLkWHQ4r9IIjnIZQOSmvquBks245oSmvR4gKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcaEeUBcQP3SIj2zlFZNw0PnOl6fNRDXovLRwEObVIWmhkUSBqX773K0VHDh0dRsuIpD826/YaDlqpgicAmeOEXxYC54HTbK5HzW620SxVgtChaAxczFA7EDgIPyWX/9nfZIdn6y4ep7MlOUnvH7A7GM62SdYO5MddW8hpEmdug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNfhITaA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNfhITaA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8031F000FF;
	Fri,  2 Oct 2026 09:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790933089;
	bh=sspt/fP36As20fuJhsLuvVeSjvOsGDiZOOk9QMjN5X0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aNfhITaAIwoEb/OvK7YZRvIkH9xuAFFJIclIEqqhZFSV2hbE1zgQwLKtipq7wMsxk
	 /CkMlNQnjRQABpWC0V7KfNQhr5YF0VoCdJwOu2LGB4Rci3FPIguQmK8nTh4iHjRYH/
	 26XF9zeL6lnSHCMrWrXPRCDBRMncOlSsvks2tJsvgZh4yzY13lW1xNDBiHXRi41Yn/
	 QzhiDbAVSe9PIA6W2vMCE0HofiLT/BcSyz1BR07YTehZHUClGcdZIvBUnRe15QgiP4
	 MXHdSyUH2skZek5PbAU3D8eYOqbS/b/bhai5LJxc4Py60KdaAzhsg0O7+1dNXAlVr5
	 LQp9o4YXPtAyQ==
Date: Fri, 2 Oct 2026 11:24:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] ASoC: stm32: add mdf dai support
Message-ID: <20261002-gleeful-lurking-swift-5926ab@quoll>
References: <20261001145702.2628429-1-olivier.moysan@foss.st.com>
 <20261001145702.2628429-4-olivier.moysan@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001145702.2628429-4-olivier.moysan@foss.st.com>

On Thu, Oct 01, 2026 at 04:56:47PM +0200, Olivier Moysan wrote:
> +static struct platform_driver stm32_amdf_driver = {
> +	.driver = {
> +		   .name = STM32_AMDF_DRV_NAME,
> +		   .of_match_table = stm32_amdf_of_match,
> +		   },
> +	.probe = stm32_amdf_probe,
> +	.remove = stm32_amdf_remove,
> +};
> +
> +module_platform_driver(stm32_amdf_driver);
> +
> +MODULE_DESCRIPTION("stm32 MDF DAI driver");
> +MODULE_AUTHOR("Olivier Moysan <olivier.moysan@foss.st.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" STM32_AMDF_DRV_NAME);

Why do you need this? You have OF table, no? Does it mean that OF table
is redundant and should be dropped?

Best regards,
Krzysztof

