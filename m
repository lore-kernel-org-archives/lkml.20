Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AD01F12FB;
	Sat, 26 Sep 2026 04:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790395477; cv=none; b=k7Imv0QA/1Yod6tqHb5YmivK2LC8o3+2JEuogktaQ/c8rMqs6lla/X2q8EKbq5HrsfKpwCfia8J3bYKRFHMBekD/naWQTNkX3DJks7ZUv9k+bDs7d5kAmgklFeICKZl7To9dS4SmrliADPgH1bcKIwd7QFkIjgpi7pDGKsd3KNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790395477; c=relaxed/simple;
	bh=zrx3p39Pv9buQ/wqymq+JRlodo6arpzwp+Iv4wtasis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/BMMdXsplhxQIHpL70qfDzHGhbL5uFnVbfeF7cwPcWt+JdJ1mZkf+69Jr6vXHgDAnmtCt+TrPqy8YCgvn9sel10YbKHmHzTvAWIQe+eOMD9vFXbgRuMvKZqC5ozmLFMP3eBQwbIv+wmCJPiGir+wug1rLvFgrR8Y2lelAplqpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FpM5+rnV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FpM5+rnV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4BD1F000FF;
	Sat, 26 Sep 2026 04:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790395475;
	bh=xOUdZyaE4ZM74h/zxVnXNgegJ6IkaZJcYOAv1Dl9nzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FpM5+rnVVdGtECbvQlEoMK/d8cozDmixctv/d+o5Q68UYuWWjUE5b3QM3bEtuna1v
	 xeAvjVWg9mOisCT6dkPzPHbD6I2b3WetxQMK2N35naNQINRGZ7AO0UwiuHKakbqOXY
	 f+3A0clTtptG0MApsK2tZ05Idw98vZLzGfzuKbxZbGxWmiVsBeH8TULsr+8VFkQ5Tb
	 UnruqkD+Xl8jI7dK3BpQcEl4Hv4oU1DEffFOO5FoqSa5cxCeJpfWRoGDc3jNJAOpsZ
	 +s/zbtOWFrkPHeh96WiHvs4R2iAt6OPLt32e+oc/RnkE8souTrvCbO6L1HLy6yDESb
	 mOqnK7avDNFEg==
Date: Sat, 26 Sep 2026 06:04:16 +0200
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
Subject: Re: [PATCH v15 12/16] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
Message-ID: <rzxb3np7snoj52rn2cx2rfemelk3kyjpd2dr5v357td4vkrpma@cxun5v7lnojp>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-12-80e2c11d1ce8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-12-80e2c11d1ce8@collabora.com>

On Tue, Sep 15, 2026 at 03:49:59PM +0200, Sebastian Reichel wrote:
> In theory the DP controller could request 4 lanes when the PHY is
> restricted to 2 lanes as the other half is used by USB3.
> 
> With the current user (DW-DP) this cannot happen, but as the check is
> cheap and users might change in the future protect things accordingly.
> Not doing so would corrupt USB3 usage by the following code configuring
> the voltages.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.kernel.org/
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
