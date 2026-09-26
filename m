Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72DD3009CB;
	Sat, 26 Sep 2026 04:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790396466; cv=none; b=RpvXCBU6GJts4limXPWx/Qz879t1Nuoc6TZsrqik61eMXKtLd0kSJcoa60nd0f3tzdaTYGyemIy3hpS3ciQuOUdukAzm7H7gPdZeC3AScpbCBacfyqMaNL0hkLfFvnUQrXGhqMwhOXkPpe6YNpRlpgQxaKUPH9hi9kWdSCTNN0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790396466; c=relaxed/simple;
	bh=6avVBpGRjQpmjypTOOTxhhxRHWzux2AXxYi7YxbRs1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJ6OQIRE2zqMjhd+2xZhKrmcS+/UHM+3QvhpbiUa5/7dJ26YE61qKRM9BrzRlfw0YJgMB+qlYULVabcOdZuCMiq2n9ZJbLYHZ3lhPawFVNSIkVkdugpTmvA7vfY15iRVAK3SQLKEPLnU/QBmOdk5HgpXcR9XIPKkpNmB8f4s1Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oY+D7toN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oY+D7toN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5511F000FF;
	Sat, 26 Sep 2026 04:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790396465;
	bh=zVg6kyIA3oQ5VRc7uY2GimtumPTbXkZayceo4DWR9Zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oY+D7toNMIjgUTAssuya5MlJM155tCtb/vLMkULL9ubASUSrNz1w/xoHlDMDxDiH8
	 oGddMEDod89gxU+ErfMzAD7B4BpHbhrWw7hv68N2pbHWQM7cyYBdXRSfXJy0mydK9G
	 BiIOsiCt/QnCO3F8UXkqJVrERvaEbHybqrv+ddKbjsOG4FWRzGzwmystZcTAla7ggm
	 hp0px1SVdqPZxNfh+M+3VFBc0P/g+lsD4Y7X9hWVmGbqvS3JWWpNXRqEAE4tEPxQbc
	 46bWOl8zlmOSdtKtfOf0/DORSJgB9KtuMNkDFeIH0eBp5FUeGYAlUFAlsJQMj5jYc2
	 CRhfJ9lVNQ3XA==
Date: Sat, 26 Sep 2026 06:20:50 +0200
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
Subject: Re: [PATCH v15 15/16] phy: rockchip: usbdp: Cleanup DP lane
 selection function
Message-ID: <udkvgo2hdwnynae7fndztk56k7cxb2xt7onbqbe7qtti3qzqw3@y5hzgs6g4dvr>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-15-80e2c11d1ce8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-15-80e2c11d1ce8@collabora.com>

On Tue, Sep 15, 2026 at 03:50:02PM +0200, Sebastian Reichel wrote:
> Use FIELD_PREP_WM16() helpers to simplify the DP lane selection
> logic.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
