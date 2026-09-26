Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DCC7081E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790409663; cv=none; b=turaxJBBLyWPIa4FeukCSIiHe0IAycZZ2docgJooYYmijRZnT72MpeLAZFoDF98Y2XGS0cYi6jkyOVQsx+aePZnhG7TnNCzYW+2u5q2oTLH/x1lTkb3z0JSReyult+WEC34cdUCo1wTx+9zzuomZLVzOoLfl4QUX6nNn2mSFfdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790409663; c=relaxed/simple;
	bh=T3Bpc2zCDG18aX8Xeagm8+hPCcQsCZCrZSFtEOhRms8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRitzrRb7FG2Fog8mhMoeMHNYax77hyG/I7PsDYUd6fUPP++OjBzwUi66JlD68PbF68zaKVTO8I3Fc8XqHJ35uCNPMV+D8KsTFaa6Yo+VPHGftOXgDuIGOXq4G+hal76aKKPBYSLzPVLKwtV+ORZFDJaslfK+vB/zWhIra5Hf6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBH2GJ7T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBH2GJ7T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B771F000FF;
	Sat, 26 Sep 2026 08:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790409661;
	bh=QK32ylyDoH0zAV4vwyAyLOZNTmoVdUY+VttMWRrH5ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jBH2GJ7TlAbuheZ6f41Ha5r5OuPJBAKdtbR7zFb51DfgxlYVjB+KOTXLoN+MIeSGa
	 A6oM80uvpfX+5F/Ct9kLzOyoHcQ5skBmxCMBj4uiyG1Zi+CyJYmGKTnpHhXvy1o9NJ
	 H1+ji0PTns1m+JixHXGSiXWoktZmnYZTDxCbm1ExkZK73vwhghEt/D89Vl1FOuWSa+
	 kNM1XVhXB7XTSL7zchwmJOkJcDw4getq2OkP7DCdBUTpDLyzukur3cnJLjVfse5/2l
	 qRHydKSXcoG0luBEDAacKNRW5qUpFlr3BXxa9qczM0sRqYbKwFTZHYzvNgMZ0A1Jrt
	 TPSUB5wC0lqMA==
Date: Sat, 26 Sep 2026 10:00:47 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 5/6] phy: rockchip: usbdp: Re-init PHY on mux change
Message-ID: <j4mqvu3tjzcjb2ghnwhwiyaf3qjdmwqvqtcary5tm4ni3dhbyk@yvqphx5drlmc>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
 <20260915-b4-rockchip-usbdp-cleanup-part3-v15-5-9ad90a456953@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-5-9ad90a456953@collabora.com>

On Tue, Sep 15, 2026 at 05:32:52PM +0200, Sebastian Reichel wrote:
> Ensure that the right part of the PHY are powered up when the
> mode changes. This ensures the PHY is re-initialized in the
> following two scenarios, which are currently broken:
> 
>  - cable orientation changes without DP being involved
>  - switching from DP-only into a mode with USB support
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
