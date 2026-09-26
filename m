Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C4A3A63FB
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790409605; cv=none; b=b/Ehu+lgbnytSloaQ6W3qajjN085YB86Ng6DFcxBgNrMBVhSOXJImowFJcml4dmF4IuJdRN7qkZSA+hVms7GyaEsrTsodbJZBZEP/qlqMiDxtFsU6eftUsi9PV9+6gkOCOelbO88b2t51oik6Lxwjf31TKTrSm1Q0ayJ5rm+lvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790409605; c=relaxed/simple;
	bh=NHYete7vjbTg+jKsxEbux0TVPXb9B2WLSvzL5qB6yC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BboFGWM/22fT9yBaZl2J8rkC3trm6nX9MPMsRrTSEtOmi+jPijD3Cla2MPNx1cE9DBDTlWBsPo5RMZRfd3ngCpEYENeLWumdYUSjO03iPwXfp9yGPnzAScb4wqxLUui5ZTbGiUmRSvo24zqX8ha6Iz6GHa1PPGeTOj9xdPQ9nMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3r2f5xM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3r2f5xM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A79A1F000FF;
	Sat, 26 Sep 2026 07:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790409604;
	bh=3+eweznmMsk2P2IzCzlZYwI84IrX3waF/RZqKOP1zaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d3r2f5xME8FiSRbcMOAzEW0t5VgVeFwMAMDFHU5fGjmONv+NgQ1efmgPYD5bLNVwj
	 4DnOhfOTMaqy6+EBBqEqkhWh4YLTE9SRxp0QHyp0kgEDqMH/jTtsuQNh363jHiyR5Y
	 9HjeOzD+hjx4Vwmjq9fLTR+PiSfKeRgK5VLWh7hCoqoHLlHGZlWfafn4wTxEMrRiHU
	 X1GTK0I7uzmF6tPEu8S1C7XK/D1dBkl6Wb+tq6EVYm/1iGIZywPQ/JR8yUEZFZGz9H
	 OwjPjUE128CxUx4HU5/l4uImHHUIiaMLeAtk6ksVOhQ/c16swTNhHkgn0A5EclI0HI
	 uVKszlRlS6qKA==
Date: Sat, 26 Sep 2026 09:59:44 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 4/6] phy: rockchip: usbdp: Fix power state handling
Message-ID: <o2xcbcpuzetrabvclyyauhrculkevfrmp7eeszlyviiphrcohi@ejg5wc3oq4bb>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
 <20260915-b4-rockchip-usbdp-cleanup-part3-v15-4-9ad90a456953@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-4-9ad90a456953@collabora.com>

On Tue, Sep 15, 2026 at 05:32:51PM +0200, Sebastian Reichel wrote:
> Restructure power state handling by introducing sw_mode in addition
> to the hw_mode field, so that the PHY knows about the currently
> supported modes from the hardware perspective, the current modes
> requested by software and the actual hardware status.
> 
> Now anything updating either the hardware or software state can simply
> update the status field and call rk_udphy_update_power_state().
> 
> This makes it a lot more obvious what is going on and also fixes a few
> potential resource leaks identified by Sashiko as a side-effect. For
> example if USB3 is requested by software while the USB-C is in DP-only
> mode, things are decently handled after this.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
