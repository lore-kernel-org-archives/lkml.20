Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDA2371CE9;
	Sat, 26 Sep 2026 03:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790393435; cv=none; b=XHqbLmO77C/kZhYPSZKmNPrkOkPr4ijoDszokqZk1k3pN6bBETrBHtA/YoHz9+YqH/uUhq0CvbEXYe1Jef75pOqYttyDFSUS5MmEOpz5Uyo5Oh1nfFRzBt+gjUgZEGw+agJ7sHovKlA511QsSWxMvjYV4cXFSf9MFRbqjTSoEHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790393435; c=relaxed/simple;
	bh=vGj8GW+JABu/P6bZyE3YYG9p7TQ37Szlbw91gruDUfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4M+7h88vdRG6i4Pdm13vGle+rovPN3uMOBJX4kiuT/oTv2d8MN0cWVPrOjspd71u9wM1ZM5nxCIJwMWof/IxK7q13D+yLskD9KNccDFSVu5SRClOFARwXhTYt/oQ7FGKU5Y96goH5PuevEilu41yc0IwxHUHSr0jN0U7AkWbZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P56hscMj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P56hscMj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27241F000FF;
	Sat, 26 Sep 2026 03:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790393429;
	bh=0tjl432vTB1/RxQoxphlMy3vxL19wMdIIx/XIy1XXaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P56hscMjemKRrSfSpBib9EPK+8htmF1XvGOAzY3DdgA2RQxClSgLaUrEh8sOH5I09
	 BhvZxI/MCLcWzLZdGnJ9aRRD2TRjnrKqIhfZq1U/feQkbL9aLSX/z9qduoyKlM4aaQ
	 IzMuj3+RXDIvgu2MKksua1s3inWPwy3YBdFwXYlT4WXsGJjB/wX/audzcTIZzylQfG
	 qQI6liUinBuHvWxfOj7wfWbPNeXuJZg6qscby9QNVsWa3DsSqSlY74NIAkOa6cobGZ
	 W12r7ShPqSW4JLIUYsID8Wu/YtfmOCmRY6tZV3Ee95BaJ/wwM0pj2YLctYK6zjs/bW
	 6qGbkkf9jsD+g==
Date: Sat, 26 Sep 2026 05:30:07 +0200
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
	devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v15 04/16] phy: rockchip: usbdp: Fix
 devm_clk_bulk_get_all check
Message-ID: <vbzcpznlyxsuqbfnn3ywpuvk4kpokgodd73tgv27i6szk3acpv@5kt2d2rprpcn>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-4-80e2c11d1ce8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-4-80e2c11d1ce8@collabora.com>

On Tue, Sep 15, 2026 at 03:49:51PM +0200, Sebastian Reichel wrote:
> If devm_clk_bulk_get_all() returns -EPROBE_DEFER, it is replaced with
> -ENODEV, permanently failing the driver probe instead of allowing it to
> defer. Avoid masking the error code to fix the issue.
> 
> This effectively drops returning -ENODEV in case no clocks are being
> described in DT. This special case will now be handled by the follow-up
> check searching for "refclk" and exit with -EINVAL.
> 
> None of this will be hit in practice, since the driver is only used by
> RK3588 and RK3576 - on these platforms the DT is validated to contain
> the clocks and the clock driver is force probed early. Thus there is
> no need to backport this.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
