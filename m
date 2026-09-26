Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A92322C73
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790399831; cv=none; b=IAYyHXBJDF8nMGc5MTt1cDcC/Rd1DN3TejA1u7679K7v+9kj2RGXGceuJeoHBPrrhyxP8jOZ5HMdj9afA0fapuMFeKg+0eexFtjCavnOhmEIFLVt4uOCVFB+IIWCYJWIpeqBB5Biwc/FQSPQr8zQcUjCMkjmuxlLZoCBfX2Evv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790399831; c=relaxed/simple;
	bh=GRp8MdzGudENeWvHz0EuPgU49E6IjaTaLWCLq9HNbIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEoGa2NE03CysAnvmzJu66+bxOkDb4TPJC6ccgPwB5kSIBqJjIDYFyCIDK2Hw1OE5vYcFUNpGaKKx/SYQ1DtIzXKqhl559hEVAdRRFsh8atxfqVWa5hWWfNKPpVR9u13pQnRgWHbGuhqONXo2fiZM7RWFNaJh+WXAp4y30OYd18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YoAA97Zj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YoAA97Zj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753381F000FF;
	Sat, 26 Sep 2026 05:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790399830;
	bh=dmbsubwsJv6grfemhX1Zv6FjAqGw9tQVhCke8CNIAq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YoAA97ZjK1QOxsWw63FzE5sARM6ZMj8DWFBc+7bzzT1Djt2Rez+xGc+w/GMo9xSf5
	 HcEDCUZlv9IPocsHFMOFaYjt81l9F1tincOwDWr5gS5uzoXS9DMaSrx5hHslvabVLw
	 GNS3UULju4WMGNWPRGwc7FuR1iA1XFHekg5EA2U0kA1ZLcInzYEfhAnDcAvobBplZl
	 bqqwHKz6k3PaUo+jhIoxjBb5XDXS54nY15BZUEZeXjOiaqGKzOcNxTsYnSyQJpajM1
	 q9GD6fg3Vsrf01cjqUIfD3AGMb9jyiJu/ZWh4pTgQgwyMuJHf1zpmZu22ZMdE2p3Ff
	 NFTMyL+kP5QLw==
Date: Sat, 26 Sep 2026 07:16:52 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 08/11] phy: rockchip: usbdp: Add some extra debug
 messages
Message-ID: <wqvcii3xylpu6e4kfvvundtj2v6x5nhe7hhxdlw6j7njtv7gm3@pdhlgezhpcem>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-8-8d507cb1174f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-8-8d507cb1174f@collabora.com>

On Tue, Sep 15, 2026 at 05:06:11PM +0200, Sebastian Reichel wrote:
> It's useful to log PHY reinit to ease debugging issues around
> USB-C hotplugging.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
