Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA9838B14C;
	Sat, 26 Sep 2026 04:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790396944; cv=none; b=Nx2OO5y1XHZ61FK0zpvJKl2YJVj8/SW2Dgcuhfc39V42zVEBMUSCoP6mkDyN7uT16dAAUQZDasI9SnN+zECewfnGcVyv+0G9mcklKeQjegUlNGu4qvPTfHGXe+KPMRWG0lUFaG3HRNwFQHOLw3mw8INm9lXFCm+pGhNVbBDG8f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790396944; c=relaxed/simple;
	bh=Z6ZT0vivWlsZQh8HPvLF2XG/EsfP/dtECkx3LFbT5gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/t+XqU+4cgLBpBdQuxxktRd991fWMFtuv3Ck4yrGJt/wxyGjFNBnUcVFIog2WhyowszCq67+5lMQD0cFcTrbL+srTZhvlbjNsx+0FQ3o4Xk99qrVsrPfKxWz7cBMWumchOJXbZsevsGTP6WJLobIqrerLrKQRg6/ZLV9HbjHfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKhnyb6h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKhnyb6h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB011F000FF;
	Sat, 26 Sep 2026 04:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790396942;
	bh=boCS0SjFdnwWnbkE5+zTwiuOZv4ydq9+oFzVHWADI/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TKhnyb6h2ZXJuRPB7K6KSjYmrAU0t8F8802JIMaGkYXTN1UnVX95iG270wGedFOFB
	 OjD6OxumDMzEvCVgTvyZ26ktX2/yqIwilYPSa+gJdFsTRSNX5qefzMlMSCnDsx4Vrr
	 +uAhHNZWotyyYVSqsUYxMAIwzgmT58tKMTOIckzCBnOXX67mC61AMhNGAz3EYFtuh8
	 HUWHcMfdFv/MK7sxsB3NmrKeLBbrR2rhwGXD/dfjb6hQmTLr3z0gRdUleI6HYDsorL
	 ypNAdQuwwpqGRNMTC8FgiHLUoqQtzyZXcq6IKLegWdzWoNET0/1BbYubCck+P3poZS
	 YSpwL+UzM0iUg==
Date: Sat, 26 Sep 2026 06:28:42 +0200
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
Subject: Re: [PATCH v15 16/16] phy: rockchip: usbdp: Register DP aux bridge
Message-ID: <ti26a3uyhfftlkhojhv56gxi3wzfeo7wj6a6rbm5eyqwgrxyxm@snn2psfln6d2>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-16-80e2c11d1ce8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-16-80e2c11d1ce8@collabora.com>

On Tue, Sep 15, 2026 at 03:50:03PM +0200, Sebastian Reichel wrote:
> Add support to use USB-C connectors with the DP altmode helper code on
> devicetree based platforms. To get this working there must be a DRM
> bridge chain from the DisplayPort controller to the USB-C connector.
> E.g. on Rockchip RK3576:
> 
> root@rk3576 # cat /sys/kernel/debug/dri/0/encoder-0/bridges
> bridge[0]: dw_dp_bridge_funcs
>         refcount: 7
>         type: [10] DP
>         OF: /soc/dp@27e40000:rockchip,rk3576-dp
>         ops: [0x47] detect edid hpd
> bridge[1]: drm_aux_bridge_funcs
>         refcount: 4
>         type: [0] Unknown
>         OF: /soc/phy@2b010000:rockchip,rk3576-usbdp-phy
>         ops: [0x0]
> bridge[2]: drm_aux_hpd_bridge_funcs
>         refcount: 5
>         type: [10] DP
>         OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
>         ops: [0x4] hpd
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
