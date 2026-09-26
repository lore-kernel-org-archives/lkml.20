Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E72F282F1C;
	Sat, 26 Sep 2026 03:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790393632; cv=none; b=DH/YIg5PnsYTiCYje3S9rffchOF2qUksFwM82qQsMbBDylsatc+CWERbZaTzPMYomb5AMMIM+Tf6qDcYZKNqe2kJXbP4/D39lgN24KFg7JZogi2ow34LzoxrwkoOmdEVCVzHY7DV+8CrulJD0j1f7rMv0uKPnRHFrSmtiQw6264=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790393632; c=relaxed/simple;
	bh=6JAJ4fxTxVgoDo++NhS+JIb5LHZWk6XXkPqQgaK8SmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZECYTCdBLEfL3qCfADO7PGCbSwswvAlGf+hl3A+bj8u/zb7APsJxP3bl9NS82EEB3tvny5tqtO8Bzf+TgapRG9p/VJDxZBCqOcLLNtINxGOlKbfIR9w3iD0uEFaUi5cdCd081pLS6PC7jlZAIeNRdU6BL+MaKxSBllw7SZ94p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPYWDtP0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPYWDtP0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA58B1F000FF;
	Sat, 26 Sep 2026 03:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790393630;
	bh=jf1FH52jwHgmL5zPjI/lMbEvsc5J4y9mrndOtK0fvKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TPYWDtP0OrK+F8SdC2HWTJnV2b8oqaGUweRy3xPpc4tDcfq6EnyVNF+j/5lkEkXef
	 w4bnEjb2qPZtAFtCGuvLi0QxxwWfOD2LCVg6qaRyg1QaFDlYZYJkbyvQ8e8+cdyvX9
	 lx39p7JslJ6B4FZ9ntwMb6By7qjJPc8HXdB/Hhd3aq8a3tldQMztprMNFBwTyovcii
	 0PfwTh8OMFjNvL4coegGmIJbeYdUccEq2u4NBbvHvzp/2rK7w3z7oMNfEH0vO6wjfL
	 SdalEgR5RQW3nDTY9QYGCXzitRBNmHMYLsC58uaSyoYXc4A3d7ATGEUpCQCdF0hHuW
	 oVfdcFn7kwTVg==
Date: Sat, 26 Sep 2026 05:33:34 +0200
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
Subject: Re: [PATCH v15 06/16] phy: rockchip: usbdp: Drop seamless DP takeover
Message-ID: <zuabgt3rv3bhpjxayb5rvdak6ocnigy6ip4avzkjo3lltwtjps@f3hc5lrqjj2t>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-6-80e2c11d1ce8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-6-80e2c11d1ce8@collabora.com>

On Tue, Sep 15, 2026 at 03:49:53PM +0200, Sebastian Reichel wrote:
> Right now the DRM drivers do not support seamless DP takeover and I'm
> I'm not aware of any bootloader implementing this feature either.
> 
> In any case this feature would be limited to boards using the USBDP PHY
> for a DP or eDP connection instead of the more commonly USB-C connector.
> With USB-C's DP AltMode a seamless DP takeover requires handing over the
> state of the TCPM state machine from the bootloader to the kernel. This
> in turn requires a huge amount of work to keep the state machine
> implementations synchronized. It's very unlikely we will see somebody
> implementing that in the foreseeable future.
> 
> As the current code is obviously buggy and untested, let's simply drop
> support for seamless DP takeover. It can be re-implemented cleanly once
> somebody adds all missing bits.
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
