Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F622D738F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811693; cv=none; b=qd0J1J7w1GAGQkGM9BXP+gP8+Yk+Z1r49FjQAH7mAMTBrVW1NWXHDZOjbAiqN+mS/8S9UNvwbaxiiIqJmQ7Y1x2LV4F6rh64M+4BQYmcGh8Nqdqn2WLILpyM3OLeNoTPeeVJGriZwWxgwlkuNplaGrV6TPpJso42jU4mCLnbck4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811693; c=relaxed/simple;
	bh=kdEtRwUovOPru+UAYDbXjBb5S6FSWOuYIjGy9OHSBx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIHw0e7tcRTNo+kddQi+BEWtVHgWcqUhkHJvd5kNGBdnzWGtk56zlfsKCeOd9UtraqGTJdvTVKK0VS0YcPthTYzN1YM5hKveUSGK++Gkb8vm46wMWS4ZUP7t+nrGT3PLgqqN0C6i2QSeVGuy+/oN4LJdC4LspuEDIpkvgpnzTUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vi18rG/r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vi18rG/r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162C61F0089B;
	Mon, 12 Oct 2026 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791811691;
	bh=z3uQj8rmXX/RAU8ketplhZtR7BScD3XYlU78bGQDudw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vi18rG/rYDfi2sMxD4UF8pK429JysTdP0UukFs8Tcl4A8wlYvg+iD75byJknXdsue
	 pojbOlBrdKqRRsqz07kVKGDDFVGzYx8Lo7zc0lxE/1G/TmOk2BmDy8RH5EsPkT/3fb
	 y1sTLQ1GEnolJ1dJDBXgO6xS2vaMM7TtwNexTZezGar4WhcLqlsR24gMAe9qEjjS2t
	 1v8kkUNcjhLuIzxyhersJ5nVsuxgvQScghS9wvfdraAg03sqsrhadr1gF1FBPZYOV9
	 fSs41yHV7aQlf18xdOF34h5iNbSyl3nvq/NxP9vqHKd9OEeXpQHPpfkPY0ou4z6Spc
	 lTDB7vdxf6m1Q==
Date: Mon, 12 Oct 2026 18:58:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Justin Chen <justin.chen@broadcom.com>, 
	Al Cooper <alcooperx@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] phy: broadcom: brcm-usb: unwind clocks on probe failure
Message-ID: <aszekmfBKpAY-4WL@debian>
References: <20260913012956.16443-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260913012956.16443-1-mhun512@gmail.com>

On Sat, Sep 12, 2026 at 09:29:56PM -0400, Myeonghun Pak wrote:
> brcm_usb_phy_dvr_init() enables the optional USB2 and USB3 clocks before
> creating all PHYs and acquiring the remaining probe resources.  Several
> later failures return without disabling clocks that were already enabled,
> and deferred probe retries can keep increasing their enable counts.
> 
> Track each successful clock enable and unwind only those clocks, in reverse
> order, when initialization fails.  Keep the existing successful probe path
> unchanged.  This is limited to the BCM4908 and Broadcom STB USB PHY driver.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.
> 
> Fixes: 49859e55e364 ("phy: usb: phy-brcm-usb: Add Broadcom STB USB phy driver")
> Assisted-by: OpenAI:GPT-5.6
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/phy/broadcom/phy-brcm-usb.c | 48 +++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/phy/broadcom/phy-brcm-usb.c b/drivers/phy/broadcom/phy-brcm-usb.c
> index 59d756a10..273f7b586 100644
> --- a/drivers/phy/broadcom/phy-brcm-usb.c
> +++ b/drivers/phy/broadcom/phy-brcm-usb.c
> @@ -404,6 +404,8 @@ static int brcm_usb_phy_dvr_init(struct platform_device *pdev,
>  {
>  	struct device *dev = &pdev->dev;
>  	struct phy *gphy = NULL;
> +	bool usb_20_clk_enabled = false;
> +	bool usb_30_clk_enabled = false;
>  	int err;
>  
>  	priv->usb_20_clk = of_clk_get_by_name(dn, "sw_usb");
> @@ -413,15 +415,19 @@ static int brcm_usb_phy_dvr_init(struct platform_device *pdev,
>  		dev_info(dev, "Clock not found in Device Tree\n");
>  		priv->usb_20_clk = NULL;
>  	}
> -	err = clk_prepare_enable(priv->usb_20_clk);
> -	if (err)
> -		return err;
> +	if (priv->usb_20_clk) {
> +		err = clk_prepare_enable(priv->usb_20_clk);
> +		if (err)
> +			return err;
> +		usb_20_clk_enabled = true;

This looks ugly :( Either use two err labels or just club both
clk_disable_unprepare() calls in one err label as clk framework will bail out
safely if the clk pointer is NULL.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
