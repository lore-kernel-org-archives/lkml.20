Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19156286A4
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790412167; cv=none; b=bGACv1zjQojH3CL6JQaBzcd6M+szjib4snDqwuoGcxTMBV1SrHabZEMCPOsWpJxNEEV0c1ohG0cEBsn70qhCe23ZO8tiuKbTDWHMyOvVfZVfe66PCX0+54gs7GaR3MWdd21RQMo9F+AgNKXUjYiLKpuH7yAVqUHCciUj1WrrTxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790412167; c=relaxed/simple;
	bh=OpP6bakpKsCRPiFsW3JcnQpiV9Lm4ipMp0hYM5XGiBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MmtPqz5kA7apuizYx7AeB3MJqqN7WZx7ttWf5hmlIA+05sLC+GT2fZLr97OUspmdJFkro6RMXdpIBrD/BTEZQS6RGQIgwinE5tE8FYBKxXfYw29W9aL4BK5h+AbG7ym/7CAf9AU67GLuFmAdU0xys5lKlpHtoQsLNLSP/v/GJKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDSbjbiF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDSbjbiF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8CA51F000FF;
	Sat, 26 Sep 2026 08:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790412165;
	bh=V2AoDkHxt5/ck9ZyVPAFqWeUoxXW3bq3RmcY+WbOVMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UDSbjbiFlxck3G3UTrDTNp+LBwXGOGJgGWH/TI22gK2RQ9e4khhack8IOymoenAoG
	 //PI20I/PaLEdbgOnUOMEmOg4ZBRQXulshPCcN4rIsaMgPlZruNC3ZtqiJ0cQ4Dgk2
	 503Rhmjw0Hz6JxAwkOrp//mDsVBsPubn/zs6FVZ0qLpEXfmW0EL95EsYXIIQBO3/gH
	 1ee29WJ/vm8pLLWdJbEkXyP3BFkCuqQF5yeUmPSKJvddvSuN6s6ps7CoOyCMWPsrwI
	 Yg7clPL5wuGZhUuWBYQKhSbD6mMov1pBWwQndkC7LcYwy1j2gCs3fJGV3o0eNZ1GQE
	 9ivwAli37OWvA==
Date: Sat, 26 Sep 2026 10:42:32 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 6/6] phy: rockchip: usbdp: Add USB-C state without DP
 enabled
Message-ID: <rdx2u4cnxgbdkumgh4oaux7wvmb545ygcnuidpp6yvfntjtwgb@i7w72g4ebc62>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
 <20260915-b4-rockchip-usbdp-cleanup-part3-v15-6-9ad90a456953@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-6-9ad90a456953@collabora.com>

On Tue, Sep 15, 2026 at 05:32:53PM +0200, Sebastian Reichel wrote:
> The driver currently only differs between 4 lanes DP mode or combined DP
> + USB3 mode. This makes sense from a lane routing point of view, as the
> hardware only has 2 lanes of USB3.
> 
> But adding a separate state for USB-only helps with power management,
> since we always power up all PHY parts according to the current hardware
> setup to avoid data stream interruptions. Even if some lanes are muxed
> to the DP controller there is no need to keep the DP side enabled if
> something without DP AltMode is plugged into USB-C.
> 
> This potentially triggers some more USB reconnections during the PD
> AltMode negotiation when switching from USB-only to combined USB+DP
> mode. This should be fine, as the cable is freshly plugged at this
> point.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
