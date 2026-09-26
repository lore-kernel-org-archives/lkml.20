Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6E6302146;
	Sat, 26 Sep 2026 03:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790393316; cv=none; b=jRYkl7slW4JSALlK/L7s9dv91p/cubEf/mAYr2uapmmFnaCFiafVntqM3aZnvJQnUmn0lMKY7hLlXCZZJR7KO/x5Da2G4pb1mFmNdV9XlpxLO4clfv23voa6vZeDdtCoUGLDG5M8DcHfGyQqjBxtGYyh3Sq/JnxDibE8nXBNvD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790393316; c=relaxed/simple;
	bh=y+JiOpe+T+CJvp42Xk+8WPE52MBKptMeTH/7LVQRUwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJiL/GpPnYoOlA7d2YW0stb97mXmkdNE7CSiwePuJUuWcAYxPAisO4bsCnV52ln5eryvvXNQyquTTx7B5qYd01O3ZnN+p/oMz5l7Vw7Ny44FPSpY5xyH3SwaGeg6cSwA1mYD+5MRgEO3Ye9nNVnU5ELcBobbJ8xugza8wCw1YDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDw4uRxs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDw4uRxs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F851F000FF;
	Sat, 26 Sep 2026 03:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790393314;
	bh=wiIuEcxJHxHcC9qQ4G2FrJQ6QHq9Q5CgIOwL5I1TyD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CDw4uRxsgwF6gEQnfAe/EPbjMXGNFyCujdlTCYvYSZo6bF6iJTsr3KTLRm4X5QLtu
	 4YY/gwk1uBiSHECVcWJAdHbENyN7OLh+3/wamTzLJy9Clsfi35StQbrBM5zxtS/J59
	 nyBaePuHyAJkhslRtnoSrF88aGZXZszpiMZGCntuerIAtGTRk1E3ntJfwv3oIRTVj3
	 ad0ORYDu4S54XwnGKajN4nJXe0Mk2WGKONjTjeXvTRwq/ECEcE5WSxtZ9Nbc65ZHKl
	 CQ14xNWBbZnI/DfOyTqw5tk9ojxOGrrc4y/YFW+Qr0aQtEzsj9sl2WjlL7JU7RFXXz
	 9ysjv96UtnmjA==
Date: Sat, 26 Sep 2026 05:28:18 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v15 03/16] phy: rockchip: usbdp: Do not lose USB3 PHY
 status
Message-ID: <yriwlzd7fiolepmi2rkdgdis5bk634biomttmdwdxiqcdgv5g4@ps3efdu6q5pe>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-3-80e2c11d1ce8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-3-80e2c11d1ce8@collabora.com>

On Tue, Sep 15, 2026 at 03:49:50PM +0200, Sebastian Reichel wrote:
> By default (i.e. without manually enabling runtime PM) DWC3 requests the
> USB3 PHY once and keeps it enabled all the time. When DisplayPort is
> being requested later on, a mode change is needed. This re-initializes
> the PHY. During re-initialization the status variable has incorrectly
> been cleared, which means the tracking information for USB3 is lost.
> 
> This is not an immediate problem, since the DP side keeps the PHY
> enabled. But once DP is toggled off, the whole PHY will be disabled.
> This is a problem, because the USB side still needs it powered.
> 
> Fix things by not clearing the status flags.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
