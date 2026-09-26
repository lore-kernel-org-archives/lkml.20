Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316DE331EB5
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790409316; cv=none; b=B0lcbnAqL9dgjbJeV/Nf/Y7vu1bDEf/Wa7xWinOIAPuYv3zvR/0pLGBpn+AYJAac5s7GNEmrzU4qbS4ghZd1xhfJTpYFHh95Yn+OVMwvvIvZn+Z4j+qSkUnTtjjCPArfzqotXVmgiyUlpAr5+H2aDHOIK4UYxjXpP3dR7+5sP/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790409316; c=relaxed/simple;
	bh=aT7t3QidARE3PuizES3jfTJZCho7lmxvo7F9xNNqxYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROQm+suDS5fnzn5dRBUE4Wb+JrZh7E7smcOe2kHwOWFpdWNTvhx/bzjT/VEYU6FRgRP5zpBvG1DLYZdZoJAdIXa2fDuX3D+39Qi9mUtl1B5e7zGwMTkNBu773XmV64g0VUXw1ZfNtese+dx00VPrjoGsKhWNHtzNKRBjMnQGxj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nw8RAwck; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nw8RAwck"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9281F000FF;
	Sat, 26 Sep 2026 07:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790409314;
	bh=GwqnBwRVIsXRmAyRc8E8Ijh+jmQBFm2/IFbbIbxTCKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nw8RAwckFc8w9qeay/H8ZADcvi7dKiR7OsXOjQ8dlqrRmM1IEqKzdBOH+G0hDFe6P
	 r6Yq7+iL+LhiKfY8+dG97aAKl1KMOzgKEPDkpQmX95p7b5Of91/szL+0sHeFG0YOzR
	 sVZKq9PpqAs5VAYdp8tGFWCR+aXDIw7xKpPfSgSBiUTJcT4jZtvjG8U+jpNeZqBWes
	 xlwso6VnNctjdRTTsHvDHPBOHXbFJ42+zHpJqBPly4Cg+K6lhEbotkpcofO4+irj/o
	 PAWdia6ZZVgalw01zhEuBqmoDBN8e+HsKGf1OXBdRqqZd/ifMiDJPHq7nL4KZOzkeb
	 YNhboKlk4US5A==
Date: Sat, 26 Sep 2026 09:54:56 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 1/6] phy: rockchip: usbdp: Add phy reset notification
 support
Message-ID: <zbqy5gqtmprapsqpodoohyxs6gml6swkie6fy7fxszfvtfgz6c@eae55gdmknaw>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
 <20260915-b4-rockchip-usbdp-cleanup-part3-v15-1-9ad90a456953@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-1-9ad90a456953@collabora.com>

On Tue, Sep 15, 2026 at 05:32:48PM +0200, Sebastian Reichel wrote:
> To resolve issues with running into permanent "cmn ana lcpll lock
> timeout" errors after a few device replugs, add support for reset
> notifications, which will be handled by the DWC3 driver to gracefully
> handle the PHY being disabled. This avoids corrupting the controller's
> internal state and the PIPE interface between the USB3 controller and
> the PHY, thus fixing the issue.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-usbdp.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index e748acdd2d31..0f39982c70b1 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1004,24 +1004,39 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
>  	}
>  
>  	if (udphy->status == UDPHY_MODE_NONE) {
> +		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
> +
> +		rk_udphy_u3_port_disable(udphy, true);

This change is not described in the commit message.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
