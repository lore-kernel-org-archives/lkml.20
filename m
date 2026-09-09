Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF0635200F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940203; cv=none; b=tA1XjoXo3ce8vrEFbxOCbUsmbNkWcoOZw7kgX410k6+OvNjaWln87sDVU9Cxb5LQ78HE0oLenCkaw1ybfhUqX+b5LnzhBLqkmvu59HUOYU50T0rkknCHEEhj43aysfTYFlrp3TKWDEi9SFI2hGMcCdM//ZhLaF0y70sXwS3fH0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940203; c=relaxed/simple;
	bh=2lcY/v2EgbUPgA/1aOJqqs1qlDVM93ZrztdIVMuzHgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQDBJfy54LDcT40J34wGs4KtqV14L4BXs6xPwgcvQXOYjn2THrVLudQnYO+UdbIGQaPpFJfSKi6RKqRJnFaLspNWWSyCfwa+iloi2ERKxP7+FETvolAkS2sh/ZqwLHPjSnBtOllyc3wNPJVXXHub+PDY/fDfDNhd9oL5AFe9Z9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/ROcGQ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/ROcGQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F511F00A3A;
	Wed,  9 Sep 2026 07:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788940202;
	bh=tFiS6PtJDB+tdoVRAxcZAbZDOvowamoHaenAhpOzI/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T/ROcGQ31AiJhvirGu6tbN1vkHNW6LQC42hvbYwheinYEXHgcZrb5VbKHj4I/nsJ4
	 8ZxN2f2bFehNP/HMdpt7CSLIy93Ni39CU4SEYGL8cKxg9NCoiCqtBrbyQ1BNvKDJU+
	 FKe6LItn3Jgwo4xD69Ou254tlQhJkVgwy1Zau9Y9fYTizIhARUgd5lM8SKQBqVHmJ7
	 dO0AJ94IVOz7/RX9XP0yWN0YrXLYmcUoPCG8zwjNPAKKTbDZ1ptb7AjIIUf83zYRq7
	 O2O54h9gYambCj7C/nCOtPfRBEC34u//sXnkMKQ1RxI1mWTL+U7BsFrj99oBq4jaUV
	 I/yG5uv5NGFyw==
Date: Wed, 9 Sep 2026 09:49:54 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, johan@kernel.org, 
	kishon@kernel.org, rogerq@ti.com, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v6 2/4] phy: ti: pipe3: Fix clock resource leak on probe
 errors
Message-ID: <wfrsq66kmpd2hrfaub5ywe64pzahj2r3ns7mmyhwt75n2mwiwu@6ddlpgoo6emc>
References: <20260619030214.1779043-1-zenghongling@kylinos.cn>
 <20260619030214.1779043-3-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260619030214.1779043-3-zenghongling@kylinos.cn>

On Fri, Jun 19, 2026 at 11:02:12AM +0800, Hongling Zeng wrote:
> When devm_phy_create() or devm_of_phy_provider_register() fails,
> the refclk that was enabled earlier is not disabled, causing a
> resource leak.
> 
> Fix this by adding an error handling path to disable the clock
> when these functions fail.
> 
> Fixes: 234738ea3390 ("phy: ti-pipe3: move clk initialization to a separate function")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> 
> ---
>  Change in v2:
>   -Add pm_runtime_disable() in error path (reported by Sashiko AI).
> ---
>  change in v3:
>   -Fix unbalanced clock disable by checking clk_prepare_enable()return value and
> setting sata_refclk_enabledonly on success.
>   -Fix error path teardown order to match ti_pipe3_remove()(disable clock before
> disabling runtime PM).
> ---
>  change in v4:
>   -Fix the patch version
> ---
> Change in v5:
>   -Add Fix ignored clock enable return value in init patch
> ---
> Change in v6:
>  -Fix all clock leak paths comprehensively:
>  -PCIe syscon update failure path
>  -SATA DPLL lock check path (also fix incorrect return logic)
>  -SATA errata path in ti_pipe3_exit()
> ---
>  drivers/phy/ti/phy-ti-pipe3.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/ti/phy-ti-pipe3.c b/drivers/phy/ti/phy-ti-pipe3.c
> index b8c055893742..2d36fe4c4218 100644
> --- a/drivers/phy/ti/phy-ti-pipe3.c
> +++ b/drivers/phy/ti/phy-ti-pipe3.c
> @@ -834,21 +834,39 @@ static int ti_pipe3_probe(struct platform_device *pdev)
>  	 */
>  	if (phy->mode == PIPE3_MODE_SATA) {
>  		if (!IS_ERR(phy->refclk)) {
> -			clk_prepare_enable(phy->refclk);
> +			ret = clk_prepare_enable(phy->refclk);
> +			if (ret) {
> +				dev_err(dev, "Failed to enable refclk %d\n", ret);
> +				goto err_pm_disable;
> +			}
>  			phy->sata_refclk_enabled = true;
>  		}
>  	}
>  
>  	generic_phy = devm_phy_create(dev, NULL, &ops);
> -	if (IS_ERR(generic_phy))
> -		return PTR_ERR(generic_phy);
> +	if (IS_ERR(generic_phy)) {
> +		ret = PTR_ERR(generic_phy);
> +		goto err_clk_disable;
> +	}
>  
>  	phy_set_drvdata(generic_phy, phy);
>  
>  	ti_pipe3_power_off(generic_phy);
>  
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> -	return PTR_ERR_OR_ZERO(phy_provider);
> +	if (IS_ERR(phy_provider)) {
> +		ret = PTR_ERR(phy_provider);
> +		goto err_clk_disable;
> +	}
> +
> +	return 0;
> +
> +err_clk_disable:
> +	if (phy->sata_refclk_enabled && !IS_ERR(phy->refclk))

'!IS_ERR(phy->refclk)' check is redundant since the 'phy->sata_refclk_enabled'
flag is set only when refclk is valid. 

- Mani

-- 
மணிவண்ணன் சதாசிவம்
