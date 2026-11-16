Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828304;
	b=gvP5JcEE1f/HE/Ef/iaGMn8o30HaWAytLTowlxtv3Ng6w10uY+1SfGe+v7MMgHUSDH8f
	 wtarfD0QeL58omwmqz+U0fgDYfSip1pGQ9mbdixszP0WDlDZUbGlVPxWUdZBC75ZBbNaI
	 Ed6Rg5rCbwiK+EwtWqv2hXWOj/XGHwaCgo7yRGohT+3Nbkmvb/Hd3tTjruo5naGXQ2MRv
	 j1HEcG7csMIG9F3mraM8CXdqKJh2BV1tCn69k+k43qVtrf2ZPE2YdIKDWEVTPPecgofmo
	 nY3UljQW6AS54ecqIJP7eXpih1ADpumAkBKcFZ7rZw3OrWO38cV6MuSjWtNHu17zjpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828304;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eIwoQCjr7sSj0vIAB37IuYU9H+c2hGghh5VTlhNpJ0E=;
	b=TfSSL92ZxR1bctbnHY5DGCLLcfzsc8E/FHrMMRawiMlSBU7z3UKLO/coJbeYpuWvijBq
	 o7BnMN8kl70X9iAKID+iSfsRCrzYPQaK39s1ufGru7+azjw5DWAGVfWUXs+DtPQ3ZCD4Q
	 5KNzFFmu92h7BiDfwL8cu8DAyTF1KwSWGb8MlhXbNRzQK6gA9LYPQDLBJvdss+yOjZKJx
	 2Tfdx81ETaXaBuWgytRtK6j5qU9mcklKX3uZNWBsROdbqdDxhYh/twYvNNgbtqVhYThjq
	 oDuT6Az3uRNKbOifx9QAwqVCbq8W+ExQ0Qy8EsTtFZuvNk1yQs3QuRS55vJIZYwiOqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SKSY95KC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9F5606D7A8;
	Mon, 16 Nov 2026 11:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SKSY95KC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCA81F000C4;
	Mon, 16 Nov 2026 11:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794828303;
	bh=eIwoQCjr7sSj0vIAB37IuYU9H+c2hGghh5VTlhNpJ0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SKSY95KC0u2jqsHTtnv98ctb8ZfxF+kt2pzTwhbMQAQl4wj4xa+ycVFCl5L0uFlBO
	 oaioRJogaHFdUBLkC9j1bIscY0JYJjvaWM8LFBHdrtkwmx/vFuVLGhys/E+b+VzPQk
	 HHlO4WJ6Y+Uo42lrnFFaLqXe8KbUM4Yp9BPlYEqaDWIjtH5yRRPzvhtq/6wGEGfurS
	 yF3WkAcoAgK5zVUUMLvZvh2sco/D14yXNBTQ8qT+v+4VJ/yI4iRbnDFTePtVHFTS9X
	 w0eM7cmkf4ziTQ/5y7PbGywMGHMupw7AhdxKI0iKKMkE2DjJcV1rZqK/5QGiD5Gb6Q
	 yWKUbr3Dj8rAA==
Date: Mon, 16 Nov 2026 12:24:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yanli Yang <yanli.yang@bedmex.com>
Cc: linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zhirun Liu <zhirunliu@aicsemi.com>, 
	Dijia Xu <dijiaxu@aicsemi.com>, Chunqiu Liu <chunqiuliu@aicsemi.com>, 
	Liheng Wei <liheng.wei@bedmex.com>
Subject: Re: [PATCH wireless-next v5 3/4] wifi: aic: Add the AIC8800D80 and
 D80N FullMAC driver
Message-ID: <20261116-silent-archetypal-fulmar-afff19@quoll>
References: <179481380235.4.7388336477392853157@bedmex.com>
 <179481380240.4.5564040872791747367@bedmex.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179481380240.4.5564040872791747367@bedmex.com>

On Mon, Nov 16, 2026 at 03:23:22PM +0800, Yanli Yang wrote:
> From: Zhirun Liu <zhirunliu@aicsemi.com>
> 
> Add the cfg80211 interface and TX/RX data paths for AIC8800D80 U02 and
> AIC8800D80N SDIO Wi-Fi. Expose station operation on the 2.4 GHz and 5 GHz
> bands through cfg80211/nl80211, with scanning, connection management,
> key configuration and station statistics.
> 
> Implement transmit queues, receive reordering and packet delivery, and
> register firmware-derived capabilities with cfg80211. Propagate the
> cfg80211 channel restrictions and power limits to the firmware through
> the regulatory notifier.
> 
> Add the AIC Kconfig and Makefiles and build a single aic8800_fdrv module.
> Keep the initial selectable configuration restricted to station mode.
> Retain the existing non-station source behind disabled configuration
> branches, together with the optional allocation helpers.
> 
> This patch depends on the firmware and transport sources in patch 2.
> The next patch connects the complete driver to the wireless build.
> 
> Signed-off-by: Chunqiu Liu <chunqiuliu@aicsemi.com>
> Signed-off-by: Zhirun Liu <zhirunliu@aicsemi.com>
> Signed-off-by: Yanli Yang <yanli.yang@bedmex.com>
> ---
>  drivers/net/wireless/aic/Kconfig              |   16 +
>  drivers/net/wireless/aic/Makefile             |    3 +
>  drivers/net/wireless/aic/aic8800_fdrv/Kconfig |   90 +
>  .../net/wireless/aic/aic8800_fdrv/Makefile    |   36 +
>  .../wireless/aic/aic8800_fdrv/aicwf_bfmer.c   |   93 +
>  .../wireless/aic/aic8800_fdrv/aicwf_main.c    | 5114 +++++++++++++++++
>  .../wireless/aic/aic8800_fdrv/aicwf_mesh.c    |   33 +
>  .../aic/aic8800_fdrv/aicwf_mod_params.c       |  644 +++
>  .../aic/aic8800_fdrv/aicwf_mu_group.c         |  653 +++
>  .../wireless/aic/aic8800_fdrv/aicwf_radar.c   | 1969 +++++++
>  .../aic/aic8800_fdrv/aicwf_resv_mem.c         |  106 +
>  .../net/wireless/aic/aic8800_fdrv/aicwf_rx.c  | 2434 ++++++++
>  .../aic/aic8800_fdrv/aicwf_rx_prealloc.c      |   99 +
>  .../net/wireless/aic/aic8800_fdrv/aicwf_tx.c  | 1469 +++++
>  .../net/wireless/aic/aic8800_fdrv/aicwf_txq.c | 1368 +++++
>  .../aic/aic8800_fdrv/aicwf_txq_prealloc.c     |   55 +
>  16 files changed, 14182 insertions(+)
>  create mode 100644 drivers/net/wireless/aic/Kconfig
>  create mode 100644 drivers/net/wireless/aic/Makefile
>  create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/Kconfig
>  create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/Makefile
>  create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_bfmer.c
>  create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_main.c
>  create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_mesh.c
>  create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_mod_params.c
>  create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_mu_group.c
>  create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_radar.c
>  create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_resv_mem.c
>  create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx.c
>  create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx_prealloc.c
>  create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_tx.c
>  create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq.c
>  create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq_prealloc.c
> 
> diff --git a/drivers/net/wireless/aic/Kconfig b/drivers/net/wireless/aic/Kconfig
> new file mode 100644
> index 000000000000..338ab1cb97ff
> --- /dev/null
> +++ b/drivers/net/wireless/aic/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config WLAN_VENDOR_AIC
> +	bool "AIC devices"
> +	default y
> +	help
> +	  Say Y to expose the AIC8800D80 U02 / AIC8800D80N SDIO Wi-Fi driver.
> +	  The first upstreaming target is a narrow D80/D80N SDIO station
> +	  configuration; legacy transport, Bluetooth, Android, test and
> +	  manufacturing build switches are intentionally not exposed.
> +
> +if WLAN_VENDOR_AIC
> +
> +source "drivers/net/wireless/aic/aic8800_fdrv/Kconfig"
> +
> +endif # WLAN_VENDOR_AIC
> diff --git a/drivers/net/wireless/aic/Makefile b/drivers/net/wireless/aic/Makefile
> new file mode 100644
> index 000000000000..3e4620989aaf
> --- /dev/null
> +++ b/drivers/net/wireless/aic/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_AIC8800_WLAN_SUPPORT) += aic8800_fdrv/
> diff --git a/drivers/net/wireless/aic/aic8800_fdrv/Kconfig b/drivers/net/wireless/aic/aic8800_fdrv/Kconfig
> new file mode 100644
> index 000000000000..6416c9c7a5b0
> --- /dev/null
> +++ b/drivers/net/wireless/aic/aic8800_fdrv/Kconfig
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +menuconfig AIC8800_WLAN_SUPPORT
> +	tristate "AIC8800D80 U02 / AIC8800D80N SDIO station support"
> +	depends on MMC
> +	depends on CFG80211
> +	select CRYPTO_LIB_MD5
> +	help
> +	  Enable the AIC8800D80 U02 and AIC8800D80N (D80N, D80LN, D40N,
> +	  D40LN) FullMAC Wi-Fi driver for the first upstreaming baseline.
> +	  This build is restricted to the SDIO station path and uses
> +	  cfg80211/nl80211 for normal Wi-Fi operation. The driver also
> +	  downloads and starts the chip firmware.
> +
> +	  Firmware files are loaded from the aic/aic8800d80/ and
> +	  aic/aic8800d80n/ subdirectories of the kernel firmware search
> +	  path for AIC8800D80 and AIC8800D80N, respectively.
> +
> +	  If unsure, say N.
> +
> +if AIC8800_WLAN_SUPPORT
> +
> +config AIC8800_SDIO_SUPPORT
> +	def_bool y
> +	help
> +	  Build the shared SDIO transport for AIC8800D80 and AIC8800D80N.
> +
> +config AIC8800_SDIO_PWRCTRL
> +	def_bool y
> +	depends on AIC8800_SDIO_SUPPORT
> +	help
> +	  Enable SDIO active/sleep transitions and the inactivity timer used
> +	  by the driver. This is a required feature of the AIC8800D80 and

Drop. Don't add your downstream config features.

> +	  AIC8800D80N SDIO configurations, independent of system suspend support.
> +
> +config AIC8800_AUTO_POWERSAVE
> +        def_bool y
> +        depends on AIC8800_SDIO_PWRCTRL
> +        help
> +	  Low-power configuration within the chip
> +
> +config AIC8800_USE_5G
> +	def_bool y

Why build option would be NOT to use 5 Ghz? Like, if I go to different
building with different WiFi I rebuild the kernel?

What?

Upstream kernel is MULTIPLATFORM.

> +	help
> +	  Enable the 5 GHz band. The AIC8800D80 is a dual-band device;
> +	  keep this on for the upstream station baseline.
> +
> +config RESV_MEM_SUPPORT

Why are you inventing more config symbols?

> +	bool "Reserve the SDIO TX aggregation buffer per device"
> +	depends on AIC8800_SDIO_SUPPORT
> +	help
> +	  Allocate the SDIO TX aggregation buffer as soon as the device is
> +	  probed and keep it until the device is removed, instead of
> +	  allocating it when the SDIO bus is brought up.
> +
> +	  If unsure, say N.
> +
> +config PREALLOC_TXQ
> +	bool "Preallocate the TX queue array"
> +	help
> +	  Allocate the TX queue array separately and keep it until the
> +	  device is removed, instead of embedding it in the wiphy private
> +	  data.
> +
> +	  If unsure, say N.
> +
> +config AICWF_FULLMAC
> +	def_bool y
> +
> +# Preserve the enabled features of the SDIO station baseline.
> +config AIC8800_RX_REORDER
> +	def_bool y
> +
> +config AIC8800_ARP_OFFLOAD
> +	def_bool y
> +
> +config AIC8800_RX_NETIF_RECV_SKB
> +	def_bool y
> +
> +config AIC8800_STA_ONLY
> +	def_bool y
> +	help
> +	  Limit the initial upstream driver to station mode. The AP, P2P,
> +	  monitor and mesh implementations remain in the source tree
> +	  so they can be enabled when those modes are ready for upstream.
> +
> +config AIC8800_NONSTA_SUPPORT
> +	def_bool y if !AIC8800_STA_ONLY

Almost nothing above makes sense.


Best regards,
Krzysztof

