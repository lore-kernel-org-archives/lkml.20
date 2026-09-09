Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926C1453A48
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940374; cv=none; b=E9RtOlZFrZx71ewvF1kzvdb5O1lTjfsTiEH4C8qyutRgQUcXqMM+9NCKK+y00WtmfKN7bpuDB90bb8sgOgegkXtkaO2PzbN5Z9EuIouk4Q2bUWE0egKyZ84hUhQO4YgwFrHICpgZvBpfeo3lkRFdAh2d2/oBFPEBLeO/ThFZFMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940374; c=relaxed/simple;
	bh=wOGf247y6fmhFNKLxo5i+/YKeqTEwyda2J5SHiaXqC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9wVPuYjDYRocQrW3msC3bZevCqlLuUlxu9oBOfOVGXoEiaWLgt5mc2fFmxFiwB9QPnu84mXGA6Ly2ZVRhzUWF2947wmFTBztl4cdl0gs/nKBcRM0Spnqxpkm4t6jdXIzmNXk7nlg8GaqxYWe4i2Ma7T/H5rs6LNdlrwEo7L1yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9q1C/Xh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9q1C/Xh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326541F00A3A;
	Wed,  9 Sep 2026 07:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788940370;
	bh=+Hb9WaGL7B5ZivVRUVKYDvDVF9rNJrVmibTk1MpLEQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F9q1C/XhlB6s1BUNp8oo0hLcuTtnVUvswKl1NxrdwPw6BXWZ8CH+6Nf2ky45TWWY1
	 b6mZlTCSXQjzNxYSUuqltoMPWQaMyq5y1/k4Q1wOrpTr/wGmkz5t4A/EFHVD18fEHH
	 4c7/U4xYdeKmbVZTldlO750aNM2gLuEW1lYABE+UkmAH4ibc6qHAMDnJNweJ1C+ib4
	 zSgBpFcW9VxXq3Nwua7seG/yMqTtxoLnR0OGIrXqmbBqnWSVf0WGEanVOzA1q0l+VF
	 Bu7rQFKOKrZIWpxV9oar0ZN5y94uqlLA1lts1VmU8iKdFaWFBf39o3iTzifp2EIKb9
	 XDelccIFjogLA==
Date: Wed, 9 Sep 2026 09:52:42 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, johan@kernel.org, 
	kishon@kernel.org, rogerq@ti.com, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v6 3/4] phy: ti-pipe3: Fix EPROBE_DEFER handling for
 clock  resources
Message-ID: <m7mr6dgayt7kpibs632cb2bpvwxrj66vmscusqgpn47apcvrpq@di3nclql65bd>
References: <20260619030214.1779043-1-zenghongling@kylinos.cn>
 <20260619030214.1779043-4-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260619030214.1779043-4-zenghongling@kylinos.cn>

On Fri, Jun 19, 2026 at 11:02:13AM +0800, Hongling Zeng wrote:
> ti_pipe3_get_clk() has two issues with -EPROBE_DEFER error handling:
> 
> 1. When devm_clk_get() for sysclk fails, the function returns -EINVAL
>    instead of propagating the actual error code. This masks -EPROBE_DEFER
>    to -EINVAL, breaking the probe deferral mechanism and causing permanent
>    driver initialization failure on systems with non-deterministic probe
>    ordering.
> 
> 2. For SATA PHY refclk, the function ignores all errors to support older
>    DTBs missing the refclk property. However, this incorrectly ignores
>    -EPROBE_DEFER as well, causing the driver to proceed without waiting
>    for the clock provider to become available.
> 
> Fix both issues:
> - Return PTR_ERR(phy->sys_clk) instead of -EINVAL to propagate all
>   error codes including -EPROBE_DEFER
> - Use devm_clk_get_optional() for SATA refclk to handle optional
>   clocks while propagating -EPROBE_DEFER and other errors
> 
> Fixes: a70143bbef6b ("drivers: phy: usb3/pipe3: Adapt pipe3 driver to Generic PHY Framework")
> Fixes: 7f33912d2978 ("phy: ti-pipe3: Fix SATA across suspend/resume")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> 
> ---
> Change in v4:
>  -Merge refclk leak fix and EPROBE_DEFER fix into a single patch
>  -Use devm_clk_get_optional() for SATA refclk
>  -Drop manual -ENOENT handling
>  -Ensure error paths are fully symmetric
> ---
> Change in v5:
>  -Add Fix ignored clock enable return value in init patch
> ---
> Change in v6:
>  -Fix all clock leak paths comprehensively:
>  -PCIe syscon update failure path
>  -SATA DPLL lock check path (also fix incorrect return logic)
>  -SATA errata path in ti_pipe3_exit()
> ---
>  drivers/phy/ti/phy-ti-pipe3.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/ti/phy-ti-pipe3.c b/drivers/phy/ti/phy-ti-pipe3.c
> index 2d36fe4c4218..9ec228c2a940 100644
> --- a/drivers/phy/ti/phy-ti-pipe3.c
> +++ b/drivers/phy/ti/phy-ti-pipe3.c
> @@ -608,14 +608,20 @@ static int ti_pipe3_get_clk(struct ti_pipe3 *phy)
>  	struct clk *clk;
>  	struct device *dev = phy->dev;
>  
> -	phy->refclk = devm_clk_get(dev, "refclk");
> +	/*
> +	 * refclk is optional for SATA PHY to support older DTBs, but
> +	 * required for other modes. Use devm_clk_get_optional() for SATA
> +	 * which returns NULL for -ENOENT, allowing us to propagate all
> +	 * other errors including -EPROBE_DEFER.
> +	 */
> +	if (phy->mode == PIPE3_MODE_SATA)
> +		phy->refclk = devm_clk_get_optional(dev, "refclk");
> +	else
> +		phy->refclk = devm_clk_get(dev, "refclk");
> +
>  	if (IS_ERR(phy->refclk)) {
>  		dev_err(dev, "unable to get refclk\n");
> -		/* older DTBs have missing refclk in SATA PHY
> -		 * so don't bail out in case of SATA PHY.
> -		 */
> -		if (phy->mode != PIPE3_MODE_SATA)
> -			return PTR_ERR(phy->refclk);
> +		return PTR_ERR(phy->refclk);

As Sashiko noted, you need to switch to dev_err_probe() here and below to avoid
printing error during probe deferral.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
