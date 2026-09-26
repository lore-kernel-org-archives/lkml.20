Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67515227EA7
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790400162; cv=none; b=Ge1Jgt3AQVONPkZ8oMUhexOD+wgLHIi+PVoMg3iW/LY1XnNEnpQfdWaZd5nt8daprCTxyOdOL8aINZJIUpFciX/ZhDV5olytS00lJdGao/LzNkkVnqhMtcYdf/4qEuov6oHYuFrEXVPVbR8E3BLx2Qgz97M8rwukULe7fW07ijM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790400162; c=relaxed/simple;
	bh=w5F2fmdvj6sSQuQOtYi2QOMYxwqzeVmYSsm60G0U50A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8jddZgi7d5PXHm28Mvzuryw9lEgtCpc/TDA4zPUOiGbhQqYGZ8aYmGni5pHl7f46OqaNNjUq43ETArEehTlBQQju0IitSjZgmAMR7dsg2gghXzV8Q/4Jw5rqzYh9l0nK2wqPQ5xgkyN1hdrInUchF7Vkf2b/RQepZorJSgOei0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhJmakD9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhJmakD9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8641F000FF;
	Sat, 26 Sep 2026 05:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790400160;
	bh=V4Uv0cSAB9UTyUWue5M6jsVbXMzQgfUfM+GObQtw8C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XhJmakD9rdsQmnm2CWbG95Z1z+2qjKqCcKx2EuRXqj7artFwYutKt3vY76nBQy/RH
	 2ZYGPuLKIJwD1ztMY33CK8jaGOnp4mvkBim/qKPUikGi/8M8JQVmVe2APgskOeBq5u
	 QspDVa/+mJfO6zMLbMBnti9g2bYxgQGR+GzzP2Z2Zyj6gw0s1Pmag/LUF78d1TunxV
	 Fy3OerQv5i11q4tJtFSnEcX5yJLofso5MoSZ0zuD+865mtSMSzG08CxkmgyCMGQpHL
	 0UydsJ/OI2IuBiQfAbTY4qVYOL2vXV7Gue7UmXi9VluCxFhcUwtasoerSncszCy0Ks
	 gGGP/DxO5/GBA==
Date: Sat, 26 Sep 2026 07:22:23 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 09/11] phy: rockchip: usbdp: Avoid xHCI SErrors
Message-ID: <ystdx2e7no6pepijitdwpqopt2k2lm7ubawzko6o2fr52oqzwk@qqaqsnrgrag3>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-9-8d507cb1174f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-9-8d507cb1174f@collabora.com>

On Tue, Sep 15, 2026 at 05:06:12PM +0200, Sebastian Reichel wrote:
> The USBDP PHY provides the PIPE clock to the USB3 controller, which
> means the PHY must be fully running when anything tries to access
> the xHCI registers.
> 
> When switching between USB3-only, USB3 + DP and DP-only mode, the
> PHY must be re-initialized resulting in a short period of the PHY
> being disabled. If the DWC3 driver decides to access the xHCI at
> this point the system will fail with an SError.
> 
> This patch avoids the problems by disabling the USB3 port before
> re-initializing it. This does a couple of things:
> 
> - forces phystatus to 0 from GRF (not from PHY)
> - switches PIPE clock source from PHY to UTMI (safe fallback clock)
> - num_u3_port=0
> 
> The last part will be ignored, as DWC3 already probed, but the
> clock re-routing will avoid the SError. There is a small delay
> afterwards to make sure the mux happened. The datasheet gives
> no hints how long it takes, so delay time is a guess.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
