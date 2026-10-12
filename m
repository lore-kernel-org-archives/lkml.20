Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809892E717B;
	Mon, 12 Oct 2026 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823260; cv=none; b=uI/Xa8nigljMvMCeJCM9Ok1JGGFeMn3Z6Qd/A+0T8+EfNwW4iNlaEOQhzJlDLArqA/fNlzf1YgsJMGusyGi8rGbQLL+sVIMmxSi9ujG5uxh4nmmPx2R+JPWdMNs7Uti183JlkG6v0vF7MNHpTXLCucpVjS5iEN5y4Vm/0XaHPz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823260; c=relaxed/simple;
	bh=psu8SUNxGWOkv+ylpg3Mn+GzzgQJS+IaRBtMvOCtzD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pi5aMlbxd2t3u3AuC4cH/j+rBa2CKhw/H1UDiDcRtKSRHOzLGmdJYFPooDR82/35DT7uKedsvbb7OMDlJHNFoCYZeHbEaYQSuWNhYvexum0GbZVn39lGl42SFUIAxb7BzP/p3QzvpkkH3LzhQf7ZAUxKs0RmormIVU6YggUoHn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hnc5ghg+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hnc5ghg+"
Received: from killaraus.ideasonboard.com (i68975AE2.versanet.de [104.151.90.226])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 548F322B;
	Mon, 12 Oct 2026 18:38:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791823134;
	bh=psu8SUNxGWOkv+ylpg3Mn+GzzgQJS+IaRBtMvOCtzD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hnc5ghg+R78pkLio/XQ2zib4fsPKVAHorkCShNxFoD4zgwwrLD2NIcUtbT8pUvzTs
	 Xw7bWX9M0vc7aktIrGNXxW1xwOq8V/a33mjOSm1DBMdHOXTOUhKAVVU4UyMX6bkCXr
	 Irp4BHU/3pyjtlDvlqUucJq65YtM9uPKgarMmyk0=
Date: Mon, 12 Oct 2026 18:40:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 0/3] Add VGA support for Apalis iMX6
Message-ID: <20261012164054.GA56180@killaraus.ideasonboard.com>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>

On Mon, Oct 12, 2026 at 04:25:22AM -0300, Leonardo Costa wrote:
> This series adds a device tree overlay that enables the VGA output on Apalis
> iMX6, which is driven from a parallel RGB interface passing through a
> non-programmable video DAC.
> 
> The video DAC is a simple resistor network gated by an active-low
> data-enable signal. For the bridge to work properly, this series also
> changes the following in the dt-bindings and simple-bridge driver:
> 
> - dt-bindings: Add a new compatible for the bridge in the simple-bridge
>   binding. This is necessary because the existing dumb-vga-dac compatible
>   doesn't describe a data-enable signal polarity.
> 
> - simple-bridge: Add the VGA bridge match-table entry and timings
>   struct, setting the DRM_BUS_FLAG_DE_LOW flag for the bridge.

Is there schematics available anywhere ? That would help reviewing the
series ?

> 
> This change depends on another patch, and should be applied after it:
> 
> - https://lore.kernel.org/all/20261002-v1-simple-bridge-atomic-check-v1-1-ef5d8332b078@toradex.com/T/#u
> 
>   Adds the atomic_check function to the simple-bridge driver, which
>   allows the data-enable bus flag to be propagated through the DRM
>   pipeline. This is necessary for the VGA to work correctly on the
>   Apalis iMX6.
> 
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---
> Leonardo Costa (3):
>       dt-bindings: display: bridge: simple: Add the Toradex Apalis iMX6 VGA DAC bridge
>       drm/bridge: simple-bridge: Add Toradex RGB to VGA DAC bridge
>       ARM: dts: imx6q-apalis: Add VGA overlay
> 
>  .../bindings/display/bridge/simple-bridge.yaml     |  1 +
>  arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
>  .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 79 ++++++++++++++++++++++
>  drivers/gpu/drm/bridge/simple-bridge.c             | 10 +++
>  4 files changed, 111 insertions(+)
> ---
> base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
> change-id: 20260928-v1-apalis-imx6-enable-vga-5c7ba6b358fe

-- 
Regards,

Laurent Pinchart
