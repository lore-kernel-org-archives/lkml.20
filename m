Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080E454704D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790399793; cv=none; b=mEeLFxrrE5CLWhDhAuc0yud2oRsWfgyXozGFHtLH7eUXzhvqfBaydrrjcOQQiHWwT0rMlZbPEH6LrFjwATPkxfuVcl2/gKBtMlzk+FHSaOM7BpNXsYr17hHhb29UMwCdbVUrj4o9W4rPFrgjLOJwN+5px29ZSFgZ87OE1qMWwmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790399793; c=relaxed/simple;
	bh=r+xqU6XV5RF4CyEqI7nUvL/ntwjHdrY9QgCqwtjGWlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EC/438RC7yftA5xy4sW91SqUfScUdCs4bJEcMYjU+X/XSDE4H6pIIT6OVTLRsDu2hARkH1p+T0u4BUwWdkq7+mhorevPucjP9I54AE/gyABMhc40L31d0FZ2itM6049QC/GdEcgMkaOWXNfv3x1xeiCYECEQMS9FVSzEvJ2i2Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbapK8RG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbapK8RG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE611F000FF;
	Sat, 26 Sep 2026 05:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790399791;
	bh=JfX+s/Rj3EZVwKgY0T/HU2G6C2z+npd4jy7BQreJ1TI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BbapK8RGn0VbM0QdxOR9zO1pX18IO//gqzZRxcJ533Wjs0mhq9ACOMSYmN9oIbv0o
	 +HRyCBZsVLJiuiBNdSVMUbTAJG7gEG95T/aQYENdbnpSCgyobsd7ra7zLu58r54rC9
	 t8iW0xiX65uvkwVx8Jsuk85KPKw4EA7ND3aUKld2NOhpLkF9i8iA8aTfQE1qgk+q6p
	 Eyz7q8XOWXhZoSZxqsYhQ2Ba+wYQosrkTr9k2k8mKroGg7VhMOzDGhkzQBfcWmZ0hp
	 KeaGBVSy+k1oTVuvCaRhOsFLEBZRN27zKC1EQPDHOWJs3CAjOowj25sfP/tap6wjYX
	 wMeRdRn4CRwMA==
Date: Sat, 26 Sep 2026 07:16:13 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 07/11] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
Message-ID: <2pgdtb5su76q36vqrqp4as3cbejhr7heiqcp4e7d4gjug3lvm4@xyyvwcn5jhn5>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-7-8d507cb1174f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-7-8d507cb1174f@collabora.com>

On Tue, Sep 15, 2026 at 05:06:10PM +0200, Sebastian Reichel wrote:
> rk_udphy_dp_phy_configure() accesses some variables from the struct
> rk_udphy, which are updated independently from the USB-C framework.
> 
> The USB-C mux/orientation switch functions already hold a mutex to
> ensure mutual exclusive access to the struct rk_udphy states, so
> simply hold the same one in the DP PHY configuration function.
> 
> Reproducing problems due to this on real hardware would be really hard,
> but could be possible when quickly re-connecting the USB-C connector.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-phy/20260612164627.23D391F000E9@smtp.kernel.org/
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
