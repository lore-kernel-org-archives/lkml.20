Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1572E7367
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 14:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038042; cv=none; b=rEETKBWjydTLDBUWd44CbxDhN4s/Ccsfz/m7VQP7q/EV5vmf1A3qiT+NygtRm+0chIdSRdwSGAUXaED7Ke1OZJS9dONQmbe0tBwdU6KYcOPTqCywiRNwRTqUXqHkMdFhm1/fsqgTMFlVZbYM0NMOKmUTLAy76QjnS4cGPraxbGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038042; c=relaxed/simple;
	bh=f/KV1QDCEZQ3clXmLniWG9uilxdqRFtCQZ+AkuXLcBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGvC8PcUBvA/dgtBKuj7VAFs3WS+xkjVcJw48EeYJFmgej+wr2AWPP/NeDuu5iLuhVjIDNZvpr00OlAfV9Z7gZeBf4r6qQp2MIa20QZDgpAogYLx5/0uzIttEWxrtbFwDUo1+CyViFwD8X56Zi98pbRVADA0sjoV85ssbrQhlNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQLdvN5k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQLdvN5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78321F0089C;
	Sat,  3 Oct 2026 14:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791038040;
	bh=AFR639q8tbGk2o2B7bnw3EP7nlm2AxE19opzLE9d4MY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PQLdvN5kALf6gJs73wjnLUlULwRHpG5ddyq+nlsq5nKLkvhk2vfQwyfN+NPRPkC2H
	 Oi4t+Bm4kV3aMZHP51vZLtSRRe3JhiKeQAfGKgt/1eFSXW8kV5beZBqyGCbCh86cn7
	 gVpon8b+BBA07NzoUaf0684GUFRFdWBhwrcqaGzFANB+UUq8mtNlYWJpdbkOHpCP+V
	 r9S/wHF2XRanD5eAczJfi2fpAQiLzKMW+2HnQkBBJiKKCbMDth0l4WGU+EmVuGtRXg
	 +pNPiwqJAIFDYnwQkAz53N98WVBEDeSrcDe2Ry/CGpOWI3fpOqid16SerRcZJv00ya
	 0PiEX5Z8SsNXQ==
Date: Sat, 3 Oct 2026 16:33:57 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com
Subject: Re: [PATCH v2 0/4] phy: rockchip: inno-usb2: ensure PHY is running
 when clock is requested
Message-ID: <asESVQlMjOYfHk_M@parshuram>
References: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com>

On 01-10-26, 15:12, Sebastian Reichel wrote:
> This was noticed on RK3588 EVB1 when resuming from system suspend. This
> is technically a fix, but its unclear when the bug was introduced and
> system suspend is broken on RK3588 for quite a while and not just due
> to this problem. So I think this fix can be merged the normal way via
> linux-next.

This looks fine to me, can you check the sashiko issues reported...

> 
> Changes in v2:
> - Link to v1: https://patch.msgid.link/20260908-phy-rockchip-inno-usb2-clock-fix-v1-1-f7d59c31b908@collabora.com
> - Move suspend exit code from rockchip_usb2phy_power_on into a
>   separate patch and reuse it in the clock prepare function;
>   move is done in a separate patch
> - Updated commit messages with proper rationale
> - Added one more patch dropping useless assignment
>   of rport->suspended directly after calling
>   rockchip_usb2phy_power_on/off
> - Add one more patch unifying and simplifying the debug
>   messages for phy init/power_on/power_off/exit
> 
> ---
> To: Vinod Koul <vkoul@kernel.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Manivannan Sadhasivam <mani@kernel.org>
> To: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-phy@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Igor Paunovic <royalnet026@gmail.com>
> Cc: kernel@collabora.com
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> ---
> Sebastian Reichel (4):
>       phy: rockchip: inno-usb2: simplify and unify PHY op debug messages
>       phy: rockchip: inno-usb2: drop duplicated update of rport->suspended
>       phy: rockchip: inno-usb2: move suspend handling into new function
>       phy: rockchip: inno-usb2: move suspend handling into clock prepare/unprepare for RK3588/RK3576
> 
>  drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 85 +++++++++++++++++++--------
>  1 file changed, 59 insertions(+), 26 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884
> 
> Best regards,
> --  
> Sebastian Reichel <sebastian.reichel@collabora.com>

-- 
~Vinod
