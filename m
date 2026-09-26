Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD95539526F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790399272; cv=none; b=HrlOs9UplO/xS/mMECwa3wMP1BWOMRSPnCRxUyh2N1wKk0XaGOOG/U7xXZA7exqFYWbo8Hx6DnVXxrcGZOd7/Rq7U4jmS7gaCOQvIT8+sO2e5AzPShrcP/FDh061LOcM07vgoe9gFStot5vJsysWWXTJAzzAwFT7bEzAagAt1T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790399272; c=relaxed/simple;
	bh=i23a6BYtRJJi5JkKAPQyO0iqbZ9gjRRhy8IW5lTmfT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uErXVfJkmweC86TMPHLfQi0LZvZ8fQ2SXIRBzajCBOSzZ0p88Mp8jVe1FLeYfBBeXiptG7S2DS8rwpkDaHSzCx/E8fQAR70qVuRw6MFLInh/IdKhKOqjI6yECw5iqwFzc5OKmpPPlQdNu8j4Z4MrAILknNahGwDsrxYf4Iz5Dqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzsJ9KSP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzsJ9KSP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C1F1F000FF;
	Sat, 26 Sep 2026 05:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790399271;
	bh=uBIWcy1vQsXuPrlyorhunI9NkbUS7DCLeu13z27U1xQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IzsJ9KSPcy59rat2nVUbGyObxX9QWfGKaDnFH0gNG5g7VeLa1pKxsPv8J7E6tzqhU
	 ExufGabs0NSfALHSt8Eh2IgwDT8RDtLJ3kN6GMMYi5QDyqLsxKmH4qJ9MF+FRDtQJD
	 h/DozJzhDvY/3vBjDjO9vKsSkDJB9Q4d4hgBu75pT7r08a21cZEqDCSGw4Yw7az51X
	 8lu1HaHXceMzOWOcMWScUGN4AttB7f8ckAnhRLJxJdCWlOidRdBwEPrSsdzYZmAwSr
	 Ao+RXyzbrE9XfdzNdMMNfOYPPjjDK/IP1kcU6dv3LCO5hsQrnR0zKiQxZYe9WHtbqh
	 kTqXqVkLlnsvQ==
Date: Sat, 26 Sep 2026 07:07:37 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 02/11] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
Message-ID: <hcvfjkpdmdjwguxuiaskugz57hp5w3srymnixmoak77renx2po@zmrjqrey7yot>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-2-8d507cb1174f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-2-8d507cb1174f@collabora.com>

On Tue, Sep 15, 2026 at 05:06:05PM +0200, Sebastian Reichel wrote:
> Right now the mode_change property is set whenever the mode changes
> between USB-only, DP-only and USB-DP. It is needed, because on any
> mode change the PHY needs to be re-initialized. Apparently at least
> DP also requires a re-init when the cable orientation is changed,
> which is currently not being done (except when the orientation switch
> also involves a mode change). Prepare for this by renaming mode_change
> to phy_needs_reinit.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
