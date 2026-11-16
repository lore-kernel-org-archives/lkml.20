Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813840;
	b=dok1i58jd5Ks0ZeE9NGLla15wKysNhciVP+lwwhxFqFElXS/IWGF5ilcmYGsdOK2YIwH
	 FkrBRPveAB2LI93Pjo9GqpajhtzFeHvXJvnoBXpS5l9xYggu/1DCkos7seiUO/CPHArLV
	 zKp9beEPBa8bDDDn6CbIYz8lXSjHu7EabXFPs/T411ZhHvHsjQcbaBRh5mwrlsOxZLEha
	 Fcx2ReA/1Zz+bCexu4LM/8vDdnD2mb6qhLZ0JkZ9yFg8jkkhQHm5ggDL5WY/DJAbdOtae
	 OSEtP0rQrJVakJmPivIwrpQeVuLfARIBYhBbIzFp7aO7+DRvHAk/Z/9Rrl0qga93thg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813840;
	h=DMARC-Filter:DKIM-Signature:Date:Subject:Content-Type:
	 Content-Transfer-Encoding:Cc:From:References:X-Original-From:
	 X-Lms-Return-Path:Received:In-Reply-To:To:Message-Id:Mime-Version;
	bh=Z80VUx6d6hrRg1pV/qZnwseIW//FIadB0fYMXfAZx8Q=;
	b=L39DGAbGoGOBk+B9/W8LItuao93TbwPCtCTOuYJZ30HLLQy4E5+x8AYg0cMe2TnKYWHI
	 DRGUfVNWNMrvZ84WHU99UqFWpqBtTIONoSRdohl0ifXBBbpHpqHbf1UmCOyKur+CytSBh
	 AprsHbg+HsDLCeLoYWGSW1MfMmEf/xx6MaKiLvpdG3/5c08M8aliBv51qZaV7jl3ykYWM
	 1801DkkEUighBu2AK402hi9V/CM7ccwNSWhO5MfD34v8NFkDFNP6ioNS9VVnasx+H8WkC
	 cV4HwZfZpdZUf06BsZpDQ5+KvH3Qa56iYYLRD9y0lTNMeU+eANVDSskF9avpIdCL66Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bedmex.com;
	spf=none smtp.mailfrom=bedmex.com;
	dkim=pass header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b="oPucT/dQ";
	arc=none smtp.remote-ip=209.127.231.19
Received: from va-2-19.ptr.blmpb.com (va-2-19.ptr.blmpb.com [209.127.231.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B630606A88E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B630606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bedmex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=oPucT/dQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=bedmex-com.20200927.dkim.feishu.cn; t=1794813833;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Z80VUx6d6hrRg1pV/qZnwseIW//FIadB0fYMXfAZx8Q=;
 b=oPucT/dQWkhGVmpnFRB8gveBQ0OvBdyjspyIrZ0klL8Ae35yVJdbdHrWbm2BRXLCzjcLRg
 xBRuD4j9FpHDiTvb2QSxVbeJnrM7/SlgTw7D1gcnzszzrmEmHQr7Otyi+/0jaWKxCUV+C6
 MNwAQqZrMWXDaVJxl9TnM0/cy/9EJxDgMuKl2wYlK/XX1JZS4CaiJ9PlHKDiVEcE5hpTpA
 ab7QOE0aIqeFPlFx9Yq+fhQEqRLFmdXrQD9daDB45lMRvSddAG/2MEoEd5pSD3QW3yF5vV
 iDxZeNu8o0NyaD94XQxuMYFBi60JNj6AJLK9G5rhVcnQNV4b+fFpkxo+ZAdJZg==
Date: Mon, 16 Nov 2026 15:23:22 +0800
Subject: [PATCH wireless-next v5 3/4] wifi: aic: Add the AIC8800D80 and D80N FullMAC driver
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "Johannes Berg" <johannes@sipsolutions.net>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Zhirun Liu" <zhirunliu@aicsemi.com>, 
	"Dijia Xu" <dijiaxu@aicsemi.com>, "Chunqiu Liu" <chunqiuliu@aicsemi.com>, 
	"Liheng Wei" <liheng.wei@bedmex.com>, <yanli.yang@bedmex.com>
From: "Yanli Yang" <yanli.yang@bedmex.com>
References: <179481380235.4.7388336477392853157@bedmex.com>
X-Original-From: Yanli Yang <yanli.yang@bedmex.com>
X-Lms-Return-Path: <lba+26afaaf86+4571d6+vger.kernel.org+yanli.yang@bedmex.com>
Received: from [127.0.1.1] ([36.141.79.164]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 15:23:48 +0800
In-Reply-To: <179481380235.4.7388336477392853157@bedmex.com>
To: <linux-wireless@vger.kernel.org>
Message-Id: <179481380240.4.5564040872791747367@bedmex.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

From: Zhirun Liu <zhirunliu@aicsemi.com>

Add the cfg80211 interface and TX/RX data paths for AIC8800D80 U02 and
AIC8800D80N SDIO Wi-Fi. Expose station operation on the 2.4 GHz and 5 GHz
bands through cfg80211/nl80211, with scanning, connection management,
key configuration and station statistics.

Implement transmit queues, receive reordering and packet delivery, and
register firmware-derived capabilities with cfg80211. Propagate the
cfg80211 channel restrictions and power limits to the firmware through
the regulatory notifier.

Add the AIC Kconfig and Makefiles and build a single aic8800_fdrv module.
Keep the initial selectable configuration restricted to station mode.
Retain the existing non-station source behind disabled configuration
branches, together with the optional allocation helpers.

This patch depends on the firmware and transport sources in patch 2.
The next patch connects the complete driver to the wireless build.

Signed-off-by: Chunqiu Liu <chunqiuliu@aicsemi.com>
Signed-off-by: Zhirun Liu <zhirunliu@aicsemi.com>
Signed-off-by: Yanli Yang <yanli.yang@bedmex.com>
---
 drivers/net/wireless/aic/Kconfig              |   16 +
 drivers/net/wireless/aic/Makefile             |    3 +
 drivers/net/wireless/aic/aic8800_fdrv/Kconfig |   90 +
 .../net/wireless/aic/aic8800_fdrv/Makefile    |   36 +
 .../wireless/aic/aic8800_fdrv/aicwf_bfmer.c   |   93 +
 .../wireless/aic/aic8800_fdrv/aicwf_main.c    | 5114 +++++++++++++++++
 .../wireless/aic/aic8800_fdrv/aicwf_mesh.c    |   33 +
 .../aic/aic8800_fdrv/aicwf_mod_params.c       |  644 +++
 .../aic/aic8800_fdrv/aicwf_mu_group.c         |  653 +++
 .../wireless/aic/aic8800_fdrv/aicwf_radar.c   | 1969 +++++++
 .../aic/aic8800_fdrv/aicwf_resv_mem.c         |  106 +
 .../net/wireless/aic/aic8800_fdrv/aicwf_rx.c  | 2434 ++++++++
 .../aic/aic8800_fdrv/aicwf_rx_prealloc.c      |   99 +
 .../net/wireless/aic/aic8800_fdrv/aicwf_tx.c  | 1469 +++++
 .../net/wireless/aic/aic8800_fdrv/aicwf_txq.c | 1368 +++++
 .../aic/aic8800_fdrv/aicwf_txq_prealloc.c     |   55 +
 16 files changed, 14182 insertions(+)
 create mode 100644 drivers/net/wireless/aic/Kconfig
 create mode 100644 drivers/net/wireless/aic/Makefile
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/Kconfig
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/Makefile
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_bfmer.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_main.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_mesh.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_mod_params.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_mu_group.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_radar.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_resv_mem.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx_prealloc.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_tx.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq_prealloc.c

diff --git a/drivers/net/wireless/aic/Kconfig b/drivers/net/wireless/aic/Kconfig
new file mode 100644
index 000000000000..338ab1cb97ff
--- /dev/null
+++ b/drivers/net/wireless/aic/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config WLAN_VENDOR_AIC
+	bool "AIC devices"
+	default y
+	help
+	  Say Y to expose the AIC8800D80 U02 / AIC8800D80N SDIO Wi-Fi driver.
+	  The first upstreaming target is a narrow D80/D80N SDIO station
+	  configuration; legacy transport, Bluetooth, Android, test and
+	  manufacturing build switches are intentionally not exposed.
+
+if WLAN_VENDOR_AIC
+
+source "drivers/net/wireless/aic/aic8800_fdrv/Kconfig"
+
+endif # WLAN_VENDOR_AIC
diff --git a/drivers/net/wireless/aic/Makefile b/drivers/net/wireless/aic/Makefile
new file mode 100644
index 000000000000..3e4620989aaf
--- /dev/null
+++ b/drivers/net/wireless/aic/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_AIC8800_WLAN_SUPPORT) += aic8800_fdrv/
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/Kconfig b/drivers/net/wireless/aic/aic8800_fdrv/Kconfig
new file mode 100644
index 000000000000..6416c9c7a5b0
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/Kconfig
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menuconfig AIC8800_WLAN_SUPPORT
+	tristate "AIC8800D80 U02 / AIC8800D80N SDIO station support"
+	depends on MMC
+	depends on CFG80211
+	select CRYPTO_LIB_MD5
+	help
+	  Enable the AIC8800D80 U02 and AIC8800D80N (D80N, D80LN, D40N,
+	  D40LN) FullMAC Wi-Fi driver for the first upstreaming baseline.
+	  This build is restricted to the SDIO station path and uses
+	  cfg80211/nl80211 for normal Wi-Fi operation. The driver also
+	  downloads and starts the chip firmware.
+
+	  Firmware files are loaded from the aic/aic8800d80/ and
+	  aic/aic8800d80n/ subdirectories of the kernel firmware search
+	  path for AIC8800D80 and AIC8800D80N, respectively.
+
+	  If unsure, say N.
+
+if AIC8800_WLAN_SUPPORT
+
+config AIC8800_SDIO_SUPPORT
+	def_bool y
+	help
+	  Build the shared SDIO transport for AIC8800D80 and AIC8800D80N.
+
+config AIC8800_SDIO_PWRCTRL
+	def_bool y
+	depends on AIC8800_SDIO_SUPPORT
+	help
+	  Enable SDIO active/sleep transitions and the inactivity timer used
+	  by the driver. This is a required feature of the AIC8800D80 and
+	  AIC8800D80N SDIO configurations, independent of system suspend support.
+
+config AIC8800_AUTO_POWERSAVE
+        def_bool y
+        depends on AIC8800_SDIO_PWRCTRL
+        help
+	  Low-power configuration within the chip
+
+config AIC8800_USE_5G
+	def_bool y
+	help
+	  Enable the 5 GHz band. The AIC8800D80 is a dual-band device;
+	  keep this on for the upstream station baseline.
+
+config RESV_MEM_SUPPORT
+	bool "Reserve the SDIO TX aggregation buffer per device"
+	depends on AIC8800_SDIO_SUPPORT
+	help
+	  Allocate the SDIO TX aggregation buffer as soon as the device is
+	  probed and keep it until the device is removed, instead of
+	  allocating it when the SDIO bus is brought up.
+
+	  If unsure, say N.
+
+config PREALLOC_TXQ
+	bool "Preallocate the TX queue array"
+	help
+	  Allocate the TX queue array separately and keep it until the
+	  device is removed, instead of embedding it in the wiphy private
+	  data.
+
+	  If unsure, say N.
+
+config AICWF_FULLMAC
+	def_bool y
+
+# Preserve the enabled features of the SDIO station baseline.
+config AIC8800_RX_REORDER
+	def_bool y
+
+config AIC8800_ARP_OFFLOAD
+	def_bool y
+
+config AIC8800_RX_NETIF_RECV_SKB
+	def_bool y
+
+config AIC8800_STA_ONLY
+	def_bool y
+	help
+	  Limit the initial upstream driver to station mode. The AP, P2P,
+	  monitor and mesh implementations remain in the source tree
+	  so they can be enabled when those modes are ready for upstream.
+
+config AIC8800_NONSTA_SUPPORT
+	def_bool y if !AIC8800_STA_ONLY
+
+endif # AIC8800_WLAN_SUPPORT
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/Makefile b/drivers/net/wireless/aic/aic8800_fdrv/Makefile
new file mode 100644
index 000000000000..d80b3f134e75
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/Makefile
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0
+
+
+obj-$(CONFIG_AIC8800_WLAN_SUPPORT) += aic8800_fdrv.o
+
+aic8800_fdrv-y := \
+	aicwf_msg_tx.o \
+	aicwf_msg_rx.o \
+	aicwf_utils.o \
+	aicwf_cmds.o \
+	aicwf_strs.o \
+	aicwf_rx.o \
+	aicwf_tx.o \
+	aicwf_txq.o \
+	aicwf_main.o \
+	aicwf_mod_params.o \
+	aicwf_platform.o \
+	aicwf_chip_8800d80.o \
+	aicwf_chip_8800d80n.o \
+	aicwf_chip_ops.o \
+	aicwf_compat_8800d80.o \
+	aicwf_compat_8800d80n.o
+
+aic8800_fdrv-$(CONFIG_AIC8800_SDIO_SUPPORT) += \
+	sdio_host.o \
+	aicwf_txrxif.o \
+	aicwf_sdio.o \
+	aicwf_rx_prealloc.o
+
+aic8800_fdrv-$(CONFIG_AIC8800_NONSTA_SUPPORT) += aicwf_mesh.o
+aic8800_fdrv-$(CONFIG_RESV_MEM_SUPPORT) += aicwf_resv_mem.o
+aic8800_fdrv-$(CONFIG_PREALLOC_TXQ) += aicwf_txq_prealloc.o
+
+ccflags-y += -I$(srctree)
+ccflags-y += -I$(src)
+ccflags-y += -DAIC_TRACE_INCLUDE_PATH=$(src)
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_bfmer.c b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_bfmer.c
new file mode 100644
index 000000000000..56102ce0dab4
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_bfmer.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ ******************************************************************************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief VHT Beamformer function definitions
+ *
+ ******************************************************************************
+ */
+
+#include "aicwf_bfmer.h"
+#include <linux/slab.h>
+
+int aicwf_bfmer_report_add(struct aicwf_hw *aicwf_hw, struct aicwf_sta *aicwf_sta,
+			   unsigned int length)
+{
+	gfp_t flags;
+	struct aicwf_bfmer_report *bfm_report;
+
+	if (in_softirq())
+		flags = GFP_ATOMIC;
+	else
+		flags = GFP_KERNEL;
+
+	/* Allocate a structure that will contain the beamforming report */
+	bfm_report = kmalloc(sizeof(*bfm_report) + length, flags);
+
+	/* Check report allocation */
+	if (!bfm_report) {
+		/* Do not use beamforming */
+		return -1;
+	}
+
+	/* Store report length */
+	bfm_report->length = length;
+
+	/*
+	 * Need to provide a Virtual Address to the MAC so that it can
+	 * upload the received Beamforming Report in driver memory
+	 */
+	bfm_report->dma_addr = dma_map_single(aicwf_hw->dev, &bfm_report->report[0],
+					      length, DMA_FROM_DEVICE);
+
+	/* Check DMA mapping result */
+	if (dma_mapping_error(aicwf_hw->dev, bfm_report->dma_addr)) {
+		/* Free allocated report */
+		kfree(bfm_report);
+		/* And leave */
+		return -1;
+	}
+
+	/* Store report structure */
+	aicwf_sta->bfm_report = bfm_report;
+
+	return 0;
+}
+
+void aicwf_bfmer_report_del(struct aicwf_hw *aicwf_hw, struct aicwf_sta *aicwf_sta)
+{
+	/* Verify if a report has been allocated */
+	if (aicwf_sta->bfm_report) {
+		struct aicwf_bfmer_report *bfm_report = aicwf_sta->bfm_report;
+
+		/* Unmap DMA region */
+		dma_unmap_single(aicwf_hw->dev, bfm_report->dma_addr, bfm_report->length,
+				 DMA_BIDIRECTIONAL);
+
+		/* Free allocated report structure and clean the pointer */
+		kfree(bfm_report);
+		aicwf_sta->bfm_report = NULL;
+	}
+}
+
+#ifdef CONFIG_AICWF_FULLMAC
+u8 aicwf_bfmer_get_rx_nss(const struct ieee80211_vht_cap *vht_capa)
+{
+	int i;
+	u8 rx_nss = 0;
+	u16 rx_mcs_map = le16_to_cpu(vht_capa->supp_mcs.rx_mcs_map);
+
+	for (i = 7; i >= 0; i--) {
+		u8 mcs = (rx_mcs_map >> (2 * i)) & 3;
+
+		if (mcs != IEEE80211_VHT_MCS_NOT_SUPPORTED) {
+			rx_nss = i + 1;
+			break;
+		}
+	}
+
+	return rx_nss;
+}
+#endif /* CONFIG_AICWF_FULLMAC */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_main.c b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_main.c
new file mode 100644
index 000000000000..6cc6eb349023
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_main.c
@@ -0,0 +1,5114 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ ******************************************************************************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief Entry point of the driver
+ *
+ ******************************************************************************
+ */
+
+#include "hal_desc.h"
+#include "aicwf_defs.h"
+#include "aicwf_msg_tx.h"
+#include "aicwf_radar.h"
+#include <linux/ctype.h>
+#include <linux/etherdevice.h>
+#include <linux/if_arp.h>
+#include <linux/inetdevice.h>
+#include <linux/module.h>
+#include <linux/netdevice.h>
+#include <linux/pm.h>
+#include <linux/vmalloc.h>
+#include <generated/utsrelease.h>
+#include <net/cfg80211.h>
+#include <net/ip.h>
+#include <net/netlink.h>
+#ifdef CONFIG_AICWF_BFMER
+#include "aicwf_bfmer.h"
+#endif //(CONFIG_AICWF_BFMER)
+#include "aicwf_txrxif.h"
+#include "aicwf_config.h"
+#include "aicwf_events.h"
+#include "aicwf_main.h"
+#include "aicwf_sdio.h"
+#include "aicwf_compat_8800d80.h"
+#include "aicwf_chip_ops.h"
+
+#define RW_DRV_DESCRIPTION "RivieraWaves 11nac driver for Linux cfg80211"
+#define RW_DRV_COPYRIGHT   "Copyright(c) 2015-2017 RivieraWaves"
+#define RW_DRV_AUTHOR      "RivieraWaves S.A.S"
+
+#define AICWF_HT_CAPABILITIES								\
+	{										\
+		.ht_supported = true,							\
+		.cap = 0,								\
+		.ampdu_factor = IEEE80211_HT_MAX_AMPDU_64K,				\
+		.ampdu_density = IEEE80211_HT_MPDU_DENSITY_16,				\
+		.mcs =									\
+		{									\
+			.rx_mask =							\
+				{							\
+					0xff,						\
+					0,						\
+					0,						\
+					0,						\
+					0,						\
+					0,						\
+					0,						\
+					0,						\
+					0,						\
+					0,						\
+				},							\
+			.rx_highest = cpu_to_le16(65),					\
+			.tx_params = IEEE80211_HT_MCS_TX_DEFINED,			\
+		},									\
+	}
+
+#define AICWF_VHT_CAPABILITIES									\
+	{											\
+		.vht_supported = false,								\
+		.cap = (7 << IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_SHIFT),		\
+		.vht_mcs = {									\
+			.rx_mcs_map = cpu_to_le16(IEEE80211_VHT_MCS_SUPPORT_0_9 << 0 |		\
+						  IEEE80211_VHT_MCS_NOT_SUPPORTED << 2 |	\
+						  IEEE80211_VHT_MCS_NOT_SUPPORTED << 4 |	\
+						  IEEE80211_VHT_MCS_NOT_SUPPORTED << 6 |	\
+						  IEEE80211_VHT_MCS_NOT_SUPPORTED << 8 |	\
+						  IEEE80211_VHT_MCS_NOT_SUPPORTED << 10 |	\
+						  IEEE80211_VHT_MCS_NOT_SUPPORTED << 12 |	\
+						  IEEE80211_VHT_MCS_NOT_SUPPORTED << 14),	\
+			.tx_mcs_map = cpu_to_le16(IEEE80211_VHT_MCS_SUPPORT_0_9 << 0 |		\
+						  IEEE80211_VHT_MCS_NOT_SUPPORTED << 2 |	\
+						  IEEE80211_VHT_MCS_NOT_SUPPORTED << 4 |	\
+						  IEEE80211_VHT_MCS_NOT_SUPPORTED << 6 |	\
+						  IEEE80211_VHT_MCS_NOT_SUPPORTED << 8 |	\
+						  IEEE80211_VHT_MCS_NOT_SUPPORTED << 10 |	\
+						  IEEE80211_VHT_MCS_NOT_SUPPORTED << 12 |	\
+						  IEEE80211_VHT_MCS_NOT_SUPPORTED << 14),	\
+		}										\
+	}
+
+#define AICWF_HE_CAPABILITIES									\
+	{											\
+		.has_he = false,								\
+		.he_cap_elem = {								\
+				.mac_cap_info[0] = 0,						\
+				.mac_cap_info[1] = 0,						\
+				.mac_cap_info[2] = 0,						\
+				.mac_cap_info[3] = 0,						\
+				.mac_cap_info[4] = 0,						\
+				.mac_cap_info[5] = 0,						\
+				.phy_cap_info[0] = 0,						\
+				.phy_cap_info[1] = 0,						\
+				.phy_cap_info[2] = 0,						\
+				.phy_cap_info[3] = 0,						\
+				.phy_cap_info[4] = 0,						\
+				.phy_cap_info[5] = 0,						\
+				.phy_cap_info[6] = 0,						\
+				.phy_cap_info[7] = 0,						\
+				.phy_cap_info[8] = 0,						\
+				.phy_cap_info[9] = 0,						\
+				.phy_cap_info[10] = 0,						\
+			},									\
+		.he_mcs_nss_supp = {								\
+				.rx_mcs_80 = cpu_to_le16(0xfffa),				\
+				.tx_mcs_80 = cpu_to_le16(0xfffa),				\
+				.rx_mcs_160 = cpu_to_le16(0xffff),				\
+				.tx_mcs_160 = cpu_to_le16(0xffff),				\
+				.rx_mcs_80p80 = cpu_to_le16(0xffff),				\
+				.tx_mcs_80p80 = cpu_to_le16(0xffff),				\
+			},									\
+		.ppe_thres = {0x08, 0x1c, 0x07},						\
+	}
+
+#define RATE(_bitrate, _hw_rate, _flags)							\
+	{											\
+		.bitrate = (_bitrate),								\
+		.flags = (_flags),								\
+		.hw_value = (_hw_rate),								\
+	}
+
+#define CHAN(_freq)										\
+	{											\
+		.center_freq = (_freq), .max_power = 30, /* FIXME */				\
+	}
+
+static struct ieee80211_rate aicwf_ratetable[] = {
+	RATE(10, 0x00, 0),
+	RATE(20, 0x01, IEEE80211_RATE_SHORT_PREAMBLE),
+	RATE(55, 0x02, IEEE80211_RATE_SHORT_PREAMBLE),
+	RATE(110, 0x03, IEEE80211_RATE_SHORT_PREAMBLE),
+	RATE(60, 0x04, 0),
+	RATE(90, 0x05, 0),
+	RATE(120, 0x06, 0),
+	RATE(180, 0x07, 0),
+	RATE(240, 0x08, 0),
+	RATE(360, 0x09, 0),
+	RATE(480, 0x0A, 0),
+	RATE(540, 0x0B, 0),
+};
+
+/* The channels indexes here are not used anymore */
+static struct ieee80211_channel aicwf_2ghz_channels[] = {
+	CHAN(2412),
+	CHAN(2417),
+	CHAN(2422),
+	CHAN(2427),
+	CHAN(2432),
+	CHAN(2437),
+	CHAN(2442),
+	CHAN(2447),
+	CHAN(2452),
+	CHAN(2457),
+	CHAN(2462),
+	CHAN(2467),
+	CHAN(2472),
+	CHAN(2484),
+};
+
+static struct ieee80211_channel aicwf_5ghz_channels[] = {
+	CHAN(5180), // 36 -   20MHz
+	CHAN(5200), // 40 -   20MHz
+	CHAN(5220), // 44 -   20MHz
+	CHAN(5240), // 48 -   20MHz
+	CHAN(5260), // 52 -   20MHz
+	CHAN(5280), // 56 -   20MHz
+	CHAN(5300), // 60 -   20MHz
+	CHAN(5320), // 64 -   20MHz
+	CHAN(5500), // 100 -  20MHz
+	CHAN(5520), // 104 -  20MHz
+	CHAN(5540), // 108 -  20MHz
+	CHAN(5560), // 112 -  20MHz
+	CHAN(5580), // 116 -  20MHz
+	CHAN(5600), // 120 -  20MHz
+	CHAN(5620), // 124 -  20MHz
+	CHAN(5640), // 128 -  20MHz
+	CHAN(5660), // 132 -  20MHz
+	CHAN(5680), // 136 -  20MHz
+	CHAN(5700), // 140 -  20MHz
+	CHAN(5720), // 144 -  20MHz
+	CHAN(5745), // 149 -  20MHz
+	CHAN(5765), // 153 -  20MHz
+	CHAN(5785), // 157 -  20MHz
+	CHAN(5805), // 161 -  20MHz
+	CHAN(5825), // 165 -  20MHz
+};
+
+static const struct ieee80211_sband_iftype_data aicwf_he_capa[1] = {
+	{
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+		.types_mask = BIT(NL80211_IFTYPE_STATION) | BIT(NL80211_IFTYPE_AP),
+#else
+		.types_mask = BIT(NL80211_IFTYPE_STATION),
+#endif
+		.he_cap = AICWF_HE_CAPABILITIES,
+	},
+};
+
+static const struct ieee80211_supported_band aicwf_band_2ghz = {
+	.channels = aicwf_2ghz_channels,
+	.n_channels = ARRAY_SIZE(aicwf_2ghz_channels),
+	.bitrates = aicwf_ratetable,
+	.n_bitrates = ARRAY_SIZE(aicwf_ratetable),
+	.ht_cap = AICWF_HT_CAPABILITIES,
+	.vht_cap = AICWF_VHT_CAPABILITIES,
+};
+
+static const struct ieee80211_supported_band aicwf_band_5ghz = {
+	.channels = aicwf_5ghz_channels,
+	.n_channels = ARRAY_SIZE(aicwf_5ghz_channels),
+	.bitrates = &aicwf_ratetable[4],
+	.n_bitrates = ARRAY_SIZE(aicwf_ratetable) - 4,
+	.ht_cap = AICWF_HT_CAPABILITIES,
+	.vht_cap = AICWF_VHT_CAPABILITIES,
+};
+
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+static struct ieee80211_iface_limit aicwf_limits[] = {
+	{.max = 1, .types = BIT(NL80211_IFTYPE_STATION)},
+	{.max = 1, .types = BIT(NL80211_IFTYPE_AP)},
+#ifdef CONFIG_AIC8800_USE_P2P0
+	{.max = 2,
+#else
+	{.max = 1,
+#endif
+	 .types = BIT(NL80211_IFTYPE_P2P_CLIENT) | BIT(NL80211_IFTYPE_P2P_GO)},
+#ifndef CONFIG_AIC8800_USE_P2P0
+	{
+		.max = 1,
+		.types = BIT(NL80211_IFTYPE_P2P_DEVICE),
+	}
+#endif
+};
+
+static struct ieee80211_iface_limit aicwf_limits_dfs[] = {
+	{.max = NX_VIRT_DEV_MAX, .types = BIT(NL80211_IFTYPE_AP)}};
+
+static const struct ieee80211_iface_combination aicwf_combinations[] = {
+	{
+		.limits = aicwf_limits,
+		.n_limits = ARRAY_SIZE(aicwf_limits),
+#ifdef CONFIG_AIC8800_MCC
+		.num_different_channels = NX_CHAN_CTXT_CNT,
+#else
+		.num_different_channels = 1,
+#endif
+		.max_interfaces = NX_VIRT_DEV_MAX,
+	},
+	/* Keep this combination as the last one */
+	{
+		.limits = aicwf_limits_dfs,
+		.n_limits = ARRAY_SIZE(aicwf_limits_dfs),
+		.num_different_channels = 1,
+		.max_interfaces = NX_VIRT_DEV_MAX,
+		.radar_detect_widths =
+			(BIT(NL80211_CHAN_WIDTH_20_NOHT) | BIT(NL80211_CHAN_WIDTH_20) |
+			 BIT(NL80211_CHAN_WIDTH_40) | BIT(NL80211_CHAN_WIDTH_80)),
+	}};
+#endif
+
+/* There isn't a lot of sense in it, but you can transmit anything you like */
+static const struct ieee80211_txrx_stypes
+	aicwf_default_mgmt_stypes[NUM_NL80211_IFTYPES] = {
+		[NL80211_IFTYPE_STATION] = {
+			.tx = 0xffff,
+			.rx = (BIT(IEEE80211_STYPE_ACTION >> 4) |
+			       BIT(IEEE80211_STYPE_PROBE_REQ >> 4) |
+			       BIT(IEEE80211_STYPE_AUTH >> 4)),
+		},
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+		[NL80211_IFTYPE_AP] = {
+			.tx = 0xffff,
+			.rx = (BIT(IEEE80211_STYPE_ASSOC_REQ >> 4) |
+			       BIT(IEEE80211_STYPE_REASSOC_REQ >> 4) |
+			       BIT(IEEE80211_STYPE_PROBE_REQ >> 4) |
+			       BIT(IEEE80211_STYPE_DISASSOC >> 4) |
+			       BIT(IEEE80211_STYPE_AUTH >> 4) |
+			       BIT(IEEE80211_STYPE_DEAUTH >> 4) |
+			       BIT(IEEE80211_STYPE_ACTION >> 4)),
+		},
+		[NL80211_IFTYPE_AP_VLAN] = {
+			/* copy AP */
+			.tx = 0xffff,
+			.rx = (BIT(IEEE80211_STYPE_ASSOC_REQ >> 4) |
+			       BIT(IEEE80211_STYPE_REASSOC_REQ >> 4) |
+			       BIT(IEEE80211_STYPE_PROBE_REQ >> 4) |
+			       BIT(IEEE80211_STYPE_DISASSOC >> 4) |
+			       BIT(IEEE80211_STYPE_AUTH >> 4) |
+			       BIT(IEEE80211_STYPE_DEAUTH >> 4) |
+			       BIT(IEEE80211_STYPE_ACTION >> 4)),
+		},
+		[NL80211_IFTYPE_P2P_CLIENT] = {
+			.tx = 0xffff,
+			.rx = (BIT(IEEE80211_STYPE_ACTION >> 4) |
+			       BIT(IEEE80211_STYPE_PROBE_REQ >> 4)),
+		},
+		[NL80211_IFTYPE_P2P_GO] = {
+			.tx = 0xffff,
+			.rx = (BIT(IEEE80211_STYPE_ASSOC_REQ >> 4) |
+			       BIT(IEEE80211_STYPE_REASSOC_REQ >> 4) |
+			       BIT(IEEE80211_STYPE_PROBE_REQ >> 4) |
+			       BIT(IEEE80211_STYPE_DISASSOC >> 4) |
+			       BIT(IEEE80211_STYPE_AUTH >> 4) |
+			       BIT(IEEE80211_STYPE_DEAUTH >> 4) |
+			       BIT(IEEE80211_STYPE_ACTION >> 4)),
+		},
+		[NL80211_IFTYPE_P2P_DEVICE] = {
+			.tx = 0xffff,
+			.rx = (BIT(IEEE80211_STYPE_ACTION >> 4) |
+			       BIT(IEEE80211_STYPE_PROBE_REQ >> 4)),
+		},
+		[NL80211_IFTYPE_MESH_POINT] = {
+			.tx = 0xffff,
+			.rx = (BIT(IEEE80211_STYPE_ACTION >> 4) |
+			       BIT(IEEE80211_STYPE_AUTH >> 4) |
+			       BIT(IEEE80211_STYPE_DEAUTH >> 4)),
+		},
+#endif
+};
+
+static const u32 aicwf_cipher_suites[] = {
+	WLAN_CIPHER_SUITE_WEP40,
+	WLAN_CIPHER_SUITE_WEP104,
+	WLAN_CIPHER_SUITE_TKIP,
+	WLAN_CIPHER_SUITE_CCMP,
+	WLAN_CIPHER_SUITE_AES_CMAC,
+	WLAN_CIPHER_SUITE_SMS4,
+};
+
+static const int aicwf_ac2hwq[1][NL80211_NUM_ACS] = {
+	{[NL80211_TXQ_Q_VO] = AICWF_HWQ_VO,
+	 [NL80211_TXQ_Q_VI] = AICWF_HWQ_VI,
+	 [NL80211_TXQ_Q_BE] = AICWF_HWQ_BE,
+	 [NL80211_TXQ_Q_BK] = AICWF_HWQ_BK}};
+
+const int aicwf_tid2hwq[IEEE80211_NUM_TIDS] = {
+	AICWF_HWQ_BE,
+	AICWF_HWQ_BK,
+	AICWF_HWQ_BK,
+	AICWF_HWQ_BE,
+	AICWF_HWQ_VI,
+	AICWF_HWQ_VI,
+	AICWF_HWQ_VO,
+	AICWF_HWQ_VO,
+	/* TID_8 is used for management frames */
+	AICWF_HWQ_VO,
+	/* At the moment, all others TID are mapped to BE */
+	AICWF_HWQ_BE,
+	AICWF_HWQ_BE,
+	AICWF_HWQ_BE,
+	AICWF_HWQ_BE,
+	AICWF_HWQ_BE,
+	AICWF_HWQ_BE,
+	AICWF_HWQ_BE,
+};
+
+static const int aicwf_hwq2uapsd[NL80211_NUM_ACS] = {
+	[AICWF_HWQ_VO] = IEEE80211_WMM_IE_STA_QOSINFO_AC_VO,
+	[AICWF_HWQ_VI] = IEEE80211_WMM_IE_STA_QOSINFO_AC_VI,
+	[AICWF_HWQ_BE] = IEEE80211_WMM_IE_STA_QOSINFO_AC_BE,
+	[AICWF_HWQ_BK] = IEEE80211_WMM_IE_STA_QOSINFO_AC_BK,
+};
+
+#define P2P_ALIVE_TIME_MS    (1 * 1000)
+#define P2P_ALIVE_TIME_COUNT 200
+
+/*********************************************************************
+ * helper
+ *********************************************************************/
+struct aicwf_sta *aicwf_get_sta(struct aicwf_hw *aicwf_hw, const u8 *mac_addr)
+{
+	int i;
+
+	for (i = 0; i < NX_REMOTE_STA_MAX; i++) {
+		struct aicwf_sta *sta = &aicwf_hw->sta_table[i];
+
+		if (sta->valid && memcmp(mac_addr, &sta->mac_addr, 6) == 0)
+			return sta;
+	}
+	return NULL;
+}
+
+void aicwf_enable_wapi(struct aicwf_hw *aicwf_hw)
+{
+	aicwf_hw->wiphy->n_cipher_suites++;
+	aicwf_hw->wiphy->flags |= WIPHY_FLAG_CONTROL_PORT_PROTOCOL;
+}
+
+u8 *aicwf_build_bcn(struct aicwf_bcn *bcn, struct cfg80211_beacon_data *new)
+{
+	u8 *buf, *pos;
+
+	if (new->head) {
+		u8 *head = kmalloc(new->head_len, GFP_KERNEL);
+
+		if (!head)
+			return NULL;
+
+		kfree(bcn->head);
+
+		bcn->head = head;
+		bcn->head_len = new->head_len;
+		memcpy(bcn->head, new->head, new->head_len);
+	}
+	if (new->tail) {
+		u8 *tail = kmalloc(new->tail_len, GFP_KERNEL);
+
+		if (!tail)
+			return NULL;
+
+		kfree(bcn->tail);
+
+		bcn->tail = tail;
+		bcn->tail_len = new->tail_len;
+		memcpy(bcn->tail, new->tail, new->tail_len);
+	}
+
+	if (!bcn->head)
+		return NULL;
+
+	bcn->tim_len = 6;
+	bcn->len = bcn->head_len + bcn->tail_len + bcn->ies_len + bcn->tim_len;
+
+	buf = kmalloc(bcn->len, GFP_KERNEL);
+	if (!buf)
+		return NULL;
+
+	// Build the beacon buffer
+	pos = buf;
+	memcpy(pos, bcn->head, bcn->head_len);
+	pos += bcn->head_len;
+	*pos++ = WLAN_EID_TIM;
+	*pos++ = 4;
+	*pos++ = 0;
+	*pos++ = bcn->dtim;
+	*pos++ = 0;
+	*pos++ = 0;
+
+	if (bcn->tail) {
+		memcpy(pos, bcn->tail, bcn->tail_len);
+		pos += bcn->tail_len;
+	}
+	if (bcn->ies)
+		memcpy(pos, bcn->ies, bcn->ies_len);
+
+	return buf;
+}
+
+static void aicwf_del_bcn(struct aicwf_bcn *bcn)
+{
+	kfree(bcn->head);
+	bcn->head = NULL;
+	bcn->head_len = 0;
+
+	kfree(bcn->tail);
+	bcn->tail = NULL;
+
+	bcn->tail_len = 0;
+
+	kfree(bcn->ies);
+	bcn->ies = NULL;
+	bcn->ies_len = 0;
+	bcn->tim_len = 0;
+	bcn->dtim = 0;
+	bcn->len = 0;
+}
+
+/*
+ * Link channel ctxt to a vif and thus increments count for this context.
+ */
+void aicwf_chanctx_link(struct aicwf_vif *vif, u8 ch_idx,
+			struct cfg80211_chan_def *chandef)
+{
+	struct aicwf_chanctx *ctxt;
+
+	if (ch_idx >= NX_CHAN_CTXT_CNT) {
+		WARN(1, "Invalid channel ctxt id %d", ch_idx);
+		return;
+	}
+
+	vif->ch_index = ch_idx;
+	ctxt = &vif->aicwf_hw->chanctx_table[ch_idx];
+	ctxt->count++;
+
+	// For now chandef is NULL for STATION interface
+	if (chandef && !ctxt->chan_def.chan)
+		ctxt->chan_def = *chandef;
+}
+
+/*
+ * Unlink channel ctxt from a vif and thus decrements count for this context
+ */
+void aicwf_chanctx_unlink(struct aicwf_vif *vif)
+{
+	struct aicwf_chanctx *ctxt;
+
+	if (vif->ch_index == AICWF_CH_NOT_SET)
+		return;
+
+	ctxt = &vif->aicwf_hw->chanctx_table[vif->ch_index];
+
+	if (ctxt->count == 0)
+		WARN(1, "Chan ctxt ref count is already 0");
+	else
+		ctxt->count--;
+
+	if (ctxt->count == 0) {
+		if (vif->ch_index == vif->aicwf_hw->cur_chanctx) {
+			/* If current chan ctxt is no longer linked to a vif
+			 * disable radar detection (no need to check if it was activated)
+			 */
+			aicwf_radar_detection_enable(&vif->aicwf_hw->radar,
+						     AICWF_RADAR_DETECT_DISABLE,
+						     AICWF_RADAR_RIU);
+		}
+		/* set chan to null, so that if this ctxt is relinked to a vif that
+		 * don't have channel information, don't use wrong information
+		 */
+		ctxt->chan_def.chan = NULL;
+	}
+	vif->ch_index = AICWF_CH_NOT_SET;
+}
+
+int aicwf_chanctx_valid(struct aicwf_hw *aicwf_hw, u8 ch_idx)
+{
+	if (ch_idx >= NX_CHAN_CTXT_CNT ||
+	    !aicwf_hw->chanctx_table[ch_idx].chan_def.chan) {
+		return 0;
+	}
+
+	return 1;
+}
+
+static void aicwf_del_csa(struct aicwf_vif *vif)
+{
+	struct aicwf_csa *csa = vif->ap.csa;
+
+	if (!csa)
+		return;
+
+	aicwf_del_bcn(&csa->bcn);
+	kfree(csa);
+	vif->ap.csa = NULL;
+}
+
+static void aicwf_csa_finish(struct work_struct *ws)
+{
+	struct aicwf_csa *csa = container_of(ws, struct aicwf_csa, work);
+	struct aicwf_vif *vif = csa->vif;
+	struct aicwf_hw *aicwf_hw = vif->aicwf_hw;
+	int error = csa->status;
+	u8 *buf, *pos;
+
+	buf = kmalloc(csa->bcn.len, GFP_KERNEL);
+	if (!buf)
+		return;
+	pos = buf;
+
+	memcpy(pos, csa->bcn.head, csa->bcn.head_len);
+	pos += csa->bcn.head_len;
+	*pos++ = WLAN_EID_TIM;
+	*pos++ = 4;
+	*pos++ = 0;
+	*pos++ = csa->bcn.dtim;
+	*pos++ = 0;
+	*pos++ = 0;
+	if (csa->bcn.tail) {
+		memcpy(pos, csa->bcn.tail, csa->bcn.tail_len);
+		pos += csa->bcn.tail_len;
+	}
+	if (csa->bcn.ies)
+		memcpy(pos, csa->bcn.ies, csa->bcn.ies_len);
+
+	if (!error) {
+		error = aicwf_send_bcn(aicwf_hw, buf, vif->vif_index, csa->bcn.len);
+		if (error)
+			return;
+		error = aicwf_send_bcn_change(aicwf_hw, vif->vif_index, 0, csa->bcn.len,
+					      csa->bcn.head_len, csa->bcn.tim_len, NULL);
+	}
+
+	if (error) {
+		cfg80211_stop_iface(aicwf_hw->wiphy, &vif->wdev, GFP_KERNEL);
+	} else {
+		wiphy_lock(aicwf_hw->wiphy);
+		spin_lock_bh(&aicwf_hw->cb_lock);
+		aicwf_chanctx_unlink(vif);
+		aicwf_chanctx_link(vif, csa->ch_idx, &csa->chandef);
+		if (aicwf_hw->cur_chanctx == csa->ch_idx) {
+			aicwf_radar_detection_enable_on_cur_channel(aicwf_hw);
+			aicwf_txq_vif_start(vif, AICWF_TXQ_STOP_CHAN, aicwf_hw);
+		} else {
+			aicwf_txq_vif_stop(vif, AICWF_TXQ_STOP_CHAN, aicwf_hw);
+		}
+		spin_unlock_bh(&aicwf_hw->cb_lock);
+		cfg80211_ch_switch_notify(vif->ndev, &csa->chandef, 0);
+		wiphy_unlock(aicwf_hw->wiphy);
+	}
+
+	aicwf_del_csa(vif);
+}
+
+/**
+ * aicwf_external_auth_enable - Enable external authentication on a vif
+ *
+ * @vif: VIF on which external authentication must be enabled
+ *
+ * External authentication requires to start TXQ for unknown STA in
+ * order to send auth frame pusehd by user space.
+ * Note: It is assumed that fw is on the correct channel.
+ */
+void aicwf_external_auth_enable(struct aicwf_vif *vif)
+{
+	vif->sta.external_auth = true;
+	aicwf_txq_unk_vif_init(vif);
+	aicwf_txq_start(aicwf_txq_vif_get(vif, NX_UNK_TXQ_TYPE), 0);
+}
+
+/**
+ * aicwf_external_auth_disable - Disable external authentication on a vif
+ *
+ * @vif: VIF on which external authentication must be disabled
+ */
+void aicwf_external_auth_disable(struct aicwf_vif *vif)
+{
+	if (!vif->sta.external_auth)
+		return;
+
+	vif->sta.external_auth = false;
+	aicwf_txq_unk_vif_deinit(vif);
+}
+
+/**
+ * aicwf_update_mesh_power_mode - Recompute the power mode of a mesh VIF
+ *
+ * @vif: mesh VIF  for which power mode is updated
+ *
+ * Does nothing if vif is not a mesh point interface.
+ * Since firmware doesn't support one power save mode per link select the
+ * most "active" power mode among all mesh links.
+ * Indeed as soon as we have to be active on one link we might as well be
+ * active on all links.
+ *
+ * If there is no link then the power mode for next peer is used;
+ */
+void aicwf_update_mesh_power_mode(struct aicwf_vif *vif)
+{
+	enum nl80211_mesh_power_mode mesh_pm;
+	struct aicwf_sta *sta;
+	struct mesh_config mesh_conf;
+	struct mesh_update_cfm cfm;
+	u32 mask;
+
+	if (AICWF_VIF_TYPE(vif) != NL80211_IFTYPE_MESH_POINT)
+		return;
+
+	if (list_empty(&vif->ap.sta_list)) {
+		mesh_pm = vif->ap.next_mesh_pm;
+	} else {
+		mesh_pm = NL80211_MESH_POWER_DEEP_SLEEP;
+		list_for_each_entry(sta, &vif->ap.sta_list, list) {
+			if (sta->valid && sta->mesh_pm < mesh_pm)
+				mesh_pm = sta->mesh_pm;
+		}
+	}
+
+	if (mesh_pm == vif->ap.mesh_pm)
+		return;
+
+	mask = BIT(NL80211_MESHCONF_POWER_MODE - 1);
+	mesh_conf.power_mode = mesh_pm;
+	if (aicwf_send_mesh_update_req(vif->aicwf_hw, vif, mask, &mesh_conf, &cfm) ||
+	    cfm.status)
+		return;
+
+	vif->ap.mesh_pm = mesh_pm;
+}
+
+static const char *const s_conn_state[] = {
+	"AICWF_DRV_STATUS_DISCONNECTED",
+	"AICWF_DRV_STATUS_DISCONNECTING",
+	"AICWF_DRV_STATUS_CONNECTING",
+	"AICWF_DRV_STATUS_CONNECTED",
+	"AICWF_DRV_STATUS_ROAMING",
+};
+
+void aicwf_set_conn_state(atomic_t *drv_conn_state, int state)
+{
+	if ((int)atomic_read(drv_conn_state) != state) {
+		pr_debug("drv_conn_state:%p %s --> %s\n",
+			 drv_conn_state,
+			 s_conn_state[(int)atomic_read(drv_conn_state)],
+			 s_conn_state[state]);
+		atomic_set(drv_conn_state, state);
+	}
+}
+
+/*********************************************************************
+ * netdev callbacks
+ ********************************************************************/
+/*
+ * int (*ndo_open)(struct net_device *dev);
+ *     This function is called when network device transistions to the up
+ *     state.
+ *
+ * - Start FW if this is the first interface opened
+ * - Add interface at fw level
+ */
+static int aicwf_open(struct net_device *dev)
+{
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct aicwf_hw *aicwf_hw = aicwf_vif->aicwf_hw;
+	struct mm_add_if_cfm add_if_cfm;
+	int error = 0;
+	u8 aicwf_rx_gain = 0x0E;
+	int err = 0;
+	int waiting_counter = 10;
+
+	while (test_bit(AICWF_DEV_STARTED, &aicwf_vif->drv_flags)) {
+		msleep(100);
+		dev_dbg(&dev->dev, "waiting for aicwf_close\n");
+		waiting_counter--;
+		if (waiting_counter == 0) {
+			dev_err(aicwf_hw->dev, "error waiting for close time out\n");
+			break;
+		}
+	}
+
+	if (READ_ONCE(aicwf_hw->regdom_failed))
+		return -EIO;
+
+	// Check if it is the first opened VIF
+	if (aicwf_hw->vif_started == 0) {
+		error = aicwf_send_me_chan_config_req(aicwf_hw);
+		if (error)
+			return error;
+
+		// Start the FW
+		error = aicwf_send_start(aicwf_hw);
+		if (error)
+			return error;
+
+		error = aic_chip_set_rx_gain(aicwf_hw, aicwf_rx_gain);
+		if (error)
+			return error;
+
+		/* Device is now started */
+	}
+
+	set_bit(AICWF_DEV_STARTED, &aicwf_vif->drv_flags);
+	aicwf_set_conn_state(&aicwf_vif->drv_conn_state, AICWF_DRV_STATUS_DISCONNECTED);
+	dev_dbg(&dev->dev, "aicwf_vif->drv_flags:%d\n",
+		(int)aicwf_vif->drv_flags);
+
+	if (AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_P2P_CLIENT ||
+	    AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_P2P_GO) {
+		if (!aicwf_hw->is_p2p_alive &&
+		    (aicwf_hw->p2p_dev_vif && !aicwf_hw->p2p_dev_vif->up)) {
+			err = aicwf_send_add_if(aicwf_hw,
+						aicwf_hw->p2p_dev_vif->wdev.address,
+						AICWF_VIF_TYPE(aicwf_hw->p2p_dev_vif),
+						false, &add_if_cfm);
+			if (err)
+				return -EIO;
+
+			if (add_if_cfm.status != 0)
+				return -EIO;
+
+			/* Save the index retrieved from LMAC */
+			spin_lock_bh(&aicwf_hw->cb_lock);
+			aicwf_hw->p2p_dev_vif->vif_index = add_if_cfm.inst_nbr;
+			aicwf_hw->p2p_dev_vif->up = true;
+			aicwf_hw->vif_started++;
+			aicwf_hw->vif_table[add_if_cfm.inst_nbr] = aicwf_hw->p2p_dev_vif;
+			spin_unlock_bh(&aicwf_hw->cb_lock);
+			aicwf_hw->is_p2p_alive = 1;
+#ifndef CONFIG_AIC8800_USE_P2P0
+			mod_timer(&aicwf_hw->p2p_alive_timer,
+				  jiffies + msecs_to_jiffies(1000));
+			atomic_set(&aicwf_hw->p2p_alive_timer_count, 0);
+#endif
+		}
+	}
+
+	if (AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_AP_VLAN) {
+		/* For AP_vlan use same fw and drv indexes. We ensure that this index
+		 * will not be used by fw for another vif by taking index >=
+		 * NX_VIRT_DEV_MAX
+		 */
+		add_if_cfm.inst_nbr = aicwf_vif->drv_vif_index;
+		netif_tx_stop_all_queues(dev);
+
+		/* Save the index retrieved from LMAC */
+		spin_lock_bh(&aicwf_hw->cb_lock);
+		aicwf_vif->vif_index = add_if_cfm.inst_nbr;
+		aicwf_vif->up = true;
+		aicwf_hw->vif_started++;
+		aicwf_hw->vif_table[add_if_cfm.inst_nbr] = aicwf_vif;
+		dev_dbg(&dev->dev, "ap create vif in aicwf_hw->vif_table[%d]\n", aicwf_vif->vif_index);
+		spin_unlock_bh(&aicwf_hw->cb_lock);
+	} else {
+		/* Forward the information to the LMAC,
+		 * p2p value not used in FMAC configuration, iftype is sufficient
+		 */
+		error = aicwf_send_add_if(aicwf_hw, aicwf_vif->wdev.address,
+					  AICWF_VIF_TYPE(aicwf_vif), false, &add_if_cfm);
+		if (error) {
+			dev_dbg(&dev->dev, "add if fail\n");
+			return error;
+		}
+
+		if (add_if_cfm.status != 0) {
+			dev_err(aicwf_hw->dev, "add_if: Status Error(%d)\n", add_if_cfm.status);
+			return -EIO;
+		}
+
+		/* Save the index retrieved from LMAC */
+		spin_lock_bh(&aicwf_hw->cb_lock);
+		aicwf_vif->vif_index = add_if_cfm.inst_nbr;
+		aicwf_vif->up = true;
+		aicwf_hw->vif_started++;
+		aicwf_hw->vif_table[add_if_cfm.inst_nbr] = aicwf_vif;
+		dev_dbg(&dev->dev, "sta create vif in aicwf_hw->vif_table[%d]\n", aicwf_vif->vif_index);
+		spin_unlock_bh(&aicwf_hw->cb_lock);
+
+#ifdef CONFIG_AIC8800_USE_P2P0
+		if (aicwf_vif->is_p2p_vif) {
+			aicwf_hw->p2p_dev_vif = aicwf_vif;
+			aicwf_hw->is_p2p_alive = 1;
+		}
+#endif
+	}
+
+	if (AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_MONITOR) {
+		aicwf_hw->monitor_vif = aicwf_vif->vif_index;
+		if (aicwf_vif->ch_index != AICWF_CH_NOT_SET) {
+			// Configure the monitor channel
+			error = aicwf_send_config_monitor_req
+				(aicwf_hw,
+				 &aicwf_hw->chanctx_table[aicwf_vif->ch_index].chan_def,
+				 NULL);
+		}
+	}
+
+	netif_start_queue(dev);
+
+	return error;
+}
+
+bool aicwf_scan_complete(struct aicwf_hw *aicwf_hw, struct wireless_dev *wdev,
+			 bool aborted)
+{
+	struct cfg80211_scan_info info = { .aborted = aborted };
+	struct cfg80211_scan_request *request;
+
+	spin_lock_bh(&aicwf_hw->scan_lock);
+	request = aicwf_hw->scan_request;
+	if (!request || (wdev && request->wdev != wdev)) {
+		spin_unlock_bh(&aicwf_hw->scan_lock);
+		return false;
+	}
+
+	aicwf_hw->scan_request = NULL;
+	WRITE_ONCE(aicwf_hw->scanning, 0);
+	/* Serialize notification with ndo_stop and release PM before a new scan. */
+#ifdef CONFIG_AIC8800_SCHED_SCAN
+	if (aicwf_hw->is_sched_scan) {
+		if (!aborted)
+			cfg80211_sched_scan_results(aicwf_hw->wiphy,
+						    aicwf_hw->sched_scan_req->reqid);
+		kfree(request);
+		aicwf_hw->is_sched_scan = false;
+	} else {
+#endif
+		cfg80211_scan_done(request, &info);
+#ifdef CONFIG_AIC8800_SCHED_SCAN
+	}
+#endif
+	aicwf_sdio_scan_activity_put(aicwf_hw);
+	spin_unlock_bh(&aicwf_hw->scan_lock);
+
+	return true;
+}
+
+static bool aicwf_scan_pending(struct aicwf_hw *aicwf_hw,
+			       struct wireless_dev *wdev)
+{
+	bool pending;
+
+	spin_lock_bh(&aicwf_hw->scan_lock);
+	pending = aicwf_hw->scan_request &&
+		  aicwf_hw->scan_request->wdev == wdev;
+	spin_unlock_bh(&aicwf_hw->scan_lock);
+
+	return pending;
+}
+
+/*
+ * int (*ndo_stop)(struct net_device *dev);
+ *     This function is called when network device transistions to the down
+ *     state.
+ *
+ * - Remove interface at fw level
+ * - Reset FW if this is the last interface opened
+ */
+static int aicwf_close(struct net_device *dev)
+{
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct aicwf_hw *aicwf_hw = aicwf_vif->aicwf_hw;
+	int ret;
+	struct aicwf_bus *bus_if = NULL;
+	struct aic_sdio_dev *sdiodev = NULL;
+	int waiting_counter = 20;
+	int test_counter = 0;
+
+	test_counter = waiting_counter;
+	while (atomic_read(&aicwf_vif->drv_conn_state) == (int)AICWF_DRV_STATUS_DISCONNECTING ||
+	       atomic_read(&aicwf_vif->drv_conn_state) == (int)AICWF_DRV_STATUS_CONNECTING) {
+		dev_dbg(&dev->dev, "wifi is connecting or disconnecting, waiting 200ms for state to stable\n");
+		msleep(200);
+		test_counter--;
+		if (test_counter == 0) {
+			dev_err(aicwf_hw->dev, "connecting or disconnecting, not finish\n");
+			//WARN_ON(1);
+			break;
+		}
+	}
+
+	netdev_info(dev, "close\n");
+
+	aicwf_radar_cancel_cac(&aicwf_hw->radar);
+
+	/* Abort scan request on the vif */
+	if (aicwf_scan_complete(aicwf_hw, &aicwf_vif->wdev, true)) {
+		ret = aicwf_send_scanu_cancel_req(aicwf_hw, NULL);
+		mdelay(35); // make sure firmware take affect
+		if (ret)
+			netdev_warn(dev, "scan cancel failed during close: %d\n", ret);
+	}
+
+	if (aicwf_hw->roc_elem && aicwf_hw->roc_elem->wdev == &aicwf_vif->wdev) {
+		dev_dbg(&dev->dev, "clear roc\n");
+		/* Initialize RoC element pointer to NULL, indicate that RoC can be
+		 * started
+		 */
+		kfree(aicwf_hw->roc_elem);
+		aicwf_hw->roc_elem = NULL;
+	}
+
+	aicwf_vif->up = false;
+	dev_dbg(&dev->dev, "aicwf_vif[%d] down\n",
+		aicwf_vif->vif_index);
+
+	if (netif_carrier_ok(dev)) {
+		if (AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_STATION ||
+		    AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_P2P_CLIENT) {
+			cfg80211_disconnected(dev, WLAN_REASON_DEAUTH_LEAVING, NULL, 0,
+					      true, GFP_ATOMIC);
+			netif_tx_stop_all_queues(dev);
+			netif_carrier_off(dev);
+			usleep_range(1000, 2000);
+		} else if (AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_AP_VLAN) {
+			netif_carrier_off(dev);
+		} else {
+			netdev_warn(dev, "ap not stopped when disabling interface\n");
+		}
+	}
+
+	bus_if = dev_get_drvdata(aicwf_hw->dev);
+	if (bus_if)
+		sdiodev = bus_if->sdiodev;
+	if (sdiodev && sdiodev->bus_if->state != BUS_DOWN_ST) {
+		if (AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_STATION ||
+		    AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_P2P_CLIENT) {
+			test_counter = waiting_counter;
+			if (atomic_read(&aicwf_vif->drv_conn_state) ==
+			    (int)AICWF_DRV_STATUS_CONNECTED) {
+				aicwf_set_conn_state(&aicwf_vif->drv_conn_state,
+						     AICWF_DRV_STATUS_DISCONNECTING);
+				aicwf_send_sm_disconnect_req(aicwf_hw, aicwf_vif, 3);
+				while (atomic_read(&aicwf_vif->drv_conn_state) ==
+				       (int)AICWF_DRV_STATUS_DISCONNECTING) {
+					dev_dbg(&dev->dev, "wifi is disconnecting, waiting 100ms for state to stable\n");
+					msleep(100);
+					test_counter--;
+					if (test_counter == 0)
+						break;
+				}
+			}
+		}
+#ifdef CONFIG_AIC8800_USE_P2P0
+		if (!aicwf_vif->is_p2p_vif ||
+		    (aicwf_vif->is_p2p_vif && aicwf_hw->is_p2p_alive)) {
+			if (aicwf_vif->is_p2p_vif)
+				aicwf_hw->is_p2p_alive = 0;
+#endif
+			aicwf_send_remove_if(aicwf_hw, aicwf_vif->vif_index, false);
+#ifdef CONFIG_AIC8800_USE_P2P0
+		}
+#endif
+	}
+	/* Ensure that we won't process disconnect ind */
+	spin_lock_bh(&aicwf_hw->cb_lock);
+
+	aicwf_hw->vif_table[aicwf_vif->vif_index] = NULL;
+
+	aicwf_chanctx_unlink(aicwf_vif);
+
+	if (AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_MONITOR)
+		aicwf_hw->monitor_vif = AICWF_INVALID_VIF;
+
+	aicwf_hw->vif_started--;
+	spin_unlock_bh(&aicwf_hw->cb_lock);
+
+	if (aicwf_hw->vif_started == 0) {
+		/* This also lets both ipc sides remain in sync before resetting */
+		if (sdiodev->bus_if->state != BUS_DOWN_ST) {
+			ret = aicwf_send_reset(aicwf_hw);
+			if (!ret && aicwf_hw->testmode == 0)
+				ret = aicwf_send_me_config_req(aicwf_hw);
+			if (!ret && !READ_ONCE(aicwf_hw->regdom_failed))
+				ret = aicwf_send_me_chan_config_req(aicwf_hw);
+			if (ret) {
+				WRITE_ONCE(aicwf_hw->regdom_failed, true);
+				wiphy_err(aicwf_hw->wiphy,
+					  "Failed to restore firmware configuration: %d\n",
+					  ret);
+			}
+		}
+	}
+
+	clear_bit(AICWF_DEV_STARTED, &aicwf_vif->drv_flags);
+	dev_dbg(&dev->dev, "aicwf_vif->drv_flags:%d\n",
+		(int)aicwf_vif->drv_flags);
+
+	return 0;
+}
+
+/*
+ * struct net_device_stats* (*ndo_get_stats)(struct net_device *dev);
+ *	Called when a user wants to get the network device usage
+ *	statistics. Drivers must do one of the following:
+ *	1. Define @ndo_get_stats64 to fill in a zero-initialised
+ *	rtnl_link_stats64 structure passed by the caller.
+ *	2. Define @ndo_get_stats to update a net_device_stats structure
+ *	(which should normally be dev->stats) and return a pointer to
+ *	it. The structure may be changed asynchronously only if each
+ *	field is written atomically.
+ *	3. Update dev->stats asynchronously and atomically, and define
+ *	neither operation.
+ */
+static struct net_device_stats *aicwf_get_stats(struct net_device *dev)
+{
+	struct aicwf_vif *vif = netdev_priv(dev);
+
+	return &vif->net_stats;
+}
+
+/*
+ * u16 (*ndo_select_queue)(struct net_device *dev, struct sk_buff *skb,
+ *                         struct net_device *sb_dev);
+ *	Called to decide which queue to when device supports multiple
+ *	transmit queues.
+ */
+
+#ifndef CONFIG_AIC8800_ONE_TXQ
+static u16 aicwf_select_queue(struct net_device *dev,
+			      struct sk_buff *skb,
+			      struct net_device *sb_dev)
+{
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+
+	return aicwf_select_txq(aicwf_vif, skb);
+}
+#endif
+
+/*
+ * int (*ndo_set_mac_address)(struct net_device *dev, void *addr);
+ *	This function  is called when the Media Access Control address
+ *	needs to be changed. If this interface is not defined, the
+ *	mac address can not be changed.
+ */
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY) || defined(CONFIG_AIC8800_SUPPORT_REALTIME_CHANGE_MAC)
+static int aicwf_set_mac_address(struct net_device *dev, void *addr)
+{
+	struct sockaddr *sa = addr;
+	int ret = 0;
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+
+	dev_dbg(&dev->dev, "enter\n");
+
+	ret = eth_mac_addr(dev, sa);
+	dev_dbg(&dev->dev, "set %02X:%02X:%02X:%02X:%02X:%02X\n",
+		dev->dev_addr[0], dev->dev_addr[1], dev->dev_addr[2],
+		dev->dev_addr[3], dev->dev_addr[4], dev->dev_addr[5]);
+	memcpy(aicwf_vif->wdev.address, dev->dev_addr, 6);
+
+	return ret;
+}
+#endif
+
+static const struct net_device_ops aicwf_netdev_ops = {
+	.ndo_open = aicwf_open,
+	.ndo_stop = aicwf_close,
+	.ndo_start_xmit = aicwf_start_xmit,
+	.ndo_get_stats = aicwf_get_stats,
+#ifndef CONFIG_AIC8800_ONE_TXQ
+	.ndo_select_queue = aicwf_select_queue,
+#endif
+#ifdef CONFIG_AIC8800_SUPPORT_REALTIME_CHANGE_MAC
+	.ndo_set_mac_address = aicwf_set_mac_address
+#endif
+	/* unused interface */
+	//    .ndo_set_features = aicwf_set_features,
+	//    .ndo_set_rx_mode != aicwf_set_multicast_list,
+};
+
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+static const struct net_device_ops aicwf_netdev_monitor_ops = {
+	.ndo_open = aicwf_open,
+	.ndo_stop = aicwf_close,
+	.ndo_get_stats = aicwf_get_stats,
+	.ndo_set_mac_address = aicwf_set_mac_address,
+};
+#endif
+
+static void aicwf_netdev_setup(struct net_device *dev)
+{
+	ether_setup(dev);
+	dev->priv_flags &= ~IFF_TX_SKB_SHARING;
+	dev->netdev_ops = &aicwf_netdev_ops;
+	dev->needs_free_netdev = true;
+	dev->watchdog_timeo = AICWF_TX_LIFETIME_MS;
+
+	dev->needed_headroom = sizeof(struct aicwf_txhdr) + AICWF_SWTXHDR_ALIGN_SZ;
+#ifdef CONFIG_AICWF_AMSDUS_TX
+	dev->needed_headroom =
+		max(dev->needed_headroom,
+		    (unsigned short)(sizeof(struct aicwf_amsdu_txhdr) +
+				     sizeof(struct ethhdr) + 4 +
+				     sizeof(rfc1042_header) + 2));
+#endif /* CONFIG_AICWF_AMSDUS_TX */
+
+	dev->hw_features = 0;
+}
+
+/*********************************************************************
+ * Cfg80211 callbacks (and helper)
+ *********************************************************************/
+static struct aicwf_vif *aicwf_interface_add(struct aicwf_hw *aicwf_hw,
+					     const char *name,
+					     unsigned char name_assign_type,
+					     enum nl80211_iftype type,
+					     struct vif_params *params)
+{
+	struct net_device *ndev;
+	struct aicwf_vif *vif;
+	int min_idx, max_idx;
+	int vif_idx = -1;
+	int i;
+
+	if (IS_ENABLED(CONFIG_AIC8800_STA_ONLY) &&
+	    type != NL80211_IFTYPE_STATION)
+		return NULL;
+
+#ifndef CONFIG_AIC8800_ONE_TXQ
+	int nx_nb_ndev_txq = NX_NB_NDEV_TXQ;
+
+	if (aicwf_hw->chip_ops->is_old_ic)
+		nx_nb_ndev_txq = NX_NB_NDEV_TXQ_FOR_OLD_IC;
+#endif
+
+	dev_dbg(aicwf_hw->dev, "%s, %d\n", name, type);
+	// Look for an available VIF
+
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	if (type == NL80211_IFTYPE_AP_VLAN) {
+		min_idx = NX_VIRT_DEV_MAX;
+		max_idx = NX_VIRT_DEV_MAX + NX_REMOTE_STA_MAX;
+	} else {
+#endif
+		min_idx = 0;
+		max_idx = NX_VIRT_DEV_MAX;
+
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	}
+#endif
+
+	for (i = min_idx; i < max_idx; i++) {
+		if (aicwf_hw->avail_idx_map & BIT(i)) {
+			vif_idx = i;
+			break;
+		}
+	}
+	if (vif_idx < 0)
+		return NULL;
+
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY) && !defined(CONFIG_AICWF_MON_DATA)
+	list_for_each_entry(vif, &aicwf_hw->vifs, list) {
+		// Check if monitor interface already exists or type is monitor
+		if (AICWF_VIF_TYPE(vif) == NL80211_IFTYPE_MONITOR ||
+		    type == NL80211_IFTYPE_MONITOR) {
+			wiphy_err(aicwf_hw->wiphy,
+				  "Monitor+Data interface support (MON_DATA) disabled\n");
+			return NULL;
+		}
+	}
+#endif
+
+#ifndef CONFIG_AIC8800_ONE_TXQ
+	ndev = alloc_netdev_mqs(sizeof(*vif), name, name_assign_type,
+				aicwf_netdev_setup, nx_nb_ndev_txq, 1);
+#else
+	ndev = alloc_netdev_mqs(sizeof(*vif), name, name_assign_type,
+				aicwf_netdev_setup, 1, 1);
+#endif
+
+	if (!ndev)
+		return NULL;
+
+	vif = netdev_priv(ndev);
+	vif->key_has_add = 0;
+	ndev->ieee80211_ptr = &vif->wdev;
+	vif->wdev.wiphy = aicwf_hw->wiphy;
+	vif->aicwf_hw = aicwf_hw;
+	vif->ndev = ndev;
+	vif->drv_vif_index = vif_idx;
+	SET_NETDEV_DEV(ndev, wiphy_dev(vif->wdev.wiphy));
+	vif->wdev.netdev = ndev;
+	vif->wdev.iftype = type;
+	vif->up = false;
+	vif->ch_index = AICWF_CH_NOT_SET;
+	memset(&vif->net_stats, 0, sizeof(vif->net_stats));
+	vif->is_p2p_vif = 0;
+
+	switch (type) {
+	case NL80211_IFTYPE_STATION:
+		vif->sta.ap = NULL;
+		vif->sta.tdls_sta = NULL;
+		vif->sta.external_auth = false;
+		break;
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	case NL80211_IFTYPE_P2P_CLIENT:
+		vif->sta.ap = NULL;
+		vif->sta.tdls_sta = NULL;
+		vif->sta.external_auth = false;
+		vif->is_p2p_vif = 1;
+		break;
+	case NL80211_IFTYPE_MESH_POINT:
+		INIT_LIST_HEAD(&vif->ap.mpath_list);
+		INIT_LIST_HEAD(&vif->ap.proxy_list);
+		vif->ap.create_path = false;
+		vif->ap.generation = 0;
+		vif->ap.mesh_pm = NL80211_MESH_POWER_ACTIVE;
+		vif->ap.next_mesh_pm = NL80211_MESH_POWER_ACTIVE;
+		fallthrough;
+		// no break
+	case NL80211_IFTYPE_AP:
+		INIT_LIST_HEAD(&vif->ap.sta_list);
+		memset(&vif->ap.bcn, 0, sizeof(vif->ap.bcn));
+		break;
+	case NL80211_IFTYPE_P2P_GO:
+		INIT_LIST_HEAD(&vif->ap.sta_list);
+		memset(&vif->ap.bcn, 0, sizeof(vif->ap.bcn));
+		vif->is_p2p_vif = 1;
+		break;
+	case NL80211_IFTYPE_AP_VLAN: {
+		struct aicwf_vif *master_vif;
+		bool found = false;
+
+		list_for_each_entry(master_vif, &aicwf_hw->vifs, list) {
+			if (AICWF_VIF_TYPE(master_vif) == NL80211_IFTYPE_AP &&
+			    !(!memcmp(master_vif->ndev->dev_addr, params->macaddr,
+				      ETH_ALEN))) {
+				found = true;
+				break;
+			}
+		}
+
+		if (!found)
+			goto err;
+
+		vif->ap_vlan.master = master_vif;
+		vif->ap_vlan.sta_4a = NULL;
+		break;
+	}
+	case NL80211_IFTYPE_MONITOR:
+		ndev->type = ARPHRD_IEEE80211_RADIOTAP;
+		ndev->netdev_ops = &aicwf_netdev_monitor_ops;
+		break;
+#endif
+	default:
+		break;
+	}
+
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	if (type == NL80211_IFTYPE_AP_VLAN) {
+		memcpy((void *)ndev->dev_addr, (const void *)params->macaddr, ETH_ALEN);
+		memcpy((void *)vif->wdev.address, (const void *)params->macaddr,
+		       ETH_ALEN);
+	} else {
+#endif
+		unsigned char mac_addr[6];
+
+		memcpy(mac_addr, aicwf_hw->wiphy->perm_addr, ETH_ALEN);
+		mac_addr[5] ^= vif_idx;
+		eth_hw_addr_set(ndev, mac_addr);
+		memcpy(vif->wdev.address, mac_addr, ETH_ALEN);
+
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	}
+#endif
+
+	dev_dbg(aicwf_hw->dev, "interface add:%x %x %x %x %x %x\n", vif->wdev.address[0],
+		vif->wdev.address[1], vif->wdev.address[2], vif->wdev.address[3],
+		vif->wdev.address[4], vif->wdev.address[5]);
+
+	if (params) {
+		vif->use_4addr = params->use_4addr;
+		ndev->ieee80211_ptr->use_4addr = params->use_4addr;
+	} else {
+		vif->use_4addr = false;
+	}
+	if (cfg80211_register_netdevice(ndev))
+		goto err;
+
+	spin_lock_bh(&aicwf_hw->cb_lock);
+	list_add_tail(&vif->list, &aicwf_hw->vifs);
+	spin_unlock_bh(&aicwf_hw->cb_lock);
+	aicwf_hw->avail_idx_map &= ~BIT(vif_idx);
+
+	return vif;
+
+err:
+	free_netdev(ndev);
+	return NULL;
+}
+
+void aicwf_p2p_alive_timeout(struct timer_list *t)
+{
+	struct aicwf_hw *aicwf_hw;
+	struct aicwf_vif *aicwf_vif;
+	struct aicwf_vif *aicwf_vif1, *tmp;
+	u8 p2p = 0;
+
+	//aicwf_hw = from_timer(aicwf_hw, t, p2p_alive_timer);
+	aicwf_hw = timer_container_of(aicwf_hw, t, p2p_alive_timer);
+	aicwf_vif = aicwf_hw->p2p_dev_vif;
+
+	list_for_each_entry_safe(aicwf_vif1, tmp, &aicwf_hw->vifs, list) {
+		if ((aicwf_hw->avail_idx_map & BIT(aicwf_vif1->drv_vif_index)) == 0) {
+			switch (AICWF_VIF_TYPE(aicwf_vif1)) {
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+			case NL80211_IFTYPE_P2P_CLIENT:
+			case NL80211_IFTYPE_P2P_GO:
+				aicwf_hw->is_p2p_alive = 1;
+				p2p = 1;
+				break;
+#endif
+			default:
+				break;
+			}
+		}
+	}
+
+	if (p2p)
+		atomic_set(&aicwf_hw->p2p_alive_timer_count, 0);
+	else
+		atomic_inc(&aicwf_hw->p2p_alive_timer_count);
+
+	if (atomic_read(&aicwf_hw->p2p_alive_timer_count) < P2P_ALIVE_TIME_COUNT) {
+		mod_timer(&aicwf_hw->p2p_alive_timer,
+			  jiffies + msecs_to_jiffies(P2P_ALIVE_TIME_MS));
+		return;
+	}
+	atomic_set(&aicwf_hw->p2p_alive_timer_count, 0);
+
+	aicwf_hw->is_p2p_alive = 0;
+	if (aicwf_vif->up) {
+		aicwf_send_remove_if(aicwf_hw, aicwf_vif->vif_index, true);
+
+		/* Ensure that we won't process disconnect ind */
+		spin_lock_bh(&aicwf_hw->cb_lock);
+
+		aicwf_vif->up = false;
+		aicwf_hw->vif_table[aicwf_vif->vif_index] = NULL;
+		pr_debug("aicwf_vif[%d] down\n",
+			 aicwf_vif->vif_index);
+		aicwf_hw->vif_started--;
+		spin_unlock_bh(&aicwf_hw->cb_lock);
+	}
+}
+
+/*********************************************************************
+ * Cfg80211 callbacks (and helper)
+ *********************************************************************/
+static struct wireless_dev *
+aicwf_virtual_interface_add(struct aicwf_hw *aicwf_hw, const char *name,
+			    unsigned char name_assign_type,
+			    enum nl80211_iftype type, struct vif_params *params)
+{
+	struct wireless_dev *wdev = NULL;
+	struct aicwf_vif *vif;
+	int min_idx, max_idx;
+	int vif_idx = -1;
+	int i;
+
+	pr_debug("%d, %s\n", type, name);
+
+	if (type == NL80211_IFTYPE_AP_VLAN) {
+		min_idx = NX_VIRT_DEV_MAX;
+		max_idx = NX_VIRT_DEV_MAX + NX_REMOTE_STA_MAX;
+	} else {
+		min_idx = 0;
+		max_idx = NX_VIRT_DEV_MAX;
+	}
+
+	for (i = min_idx; i < max_idx; i++) {
+		if (aicwf_hw->avail_idx_map & BIT(i)) {
+			vif_idx = i;
+			break;
+		}
+	}
+
+	if (vif_idx < 0) {
+		pr_debug("virtual_interface_add %s fail\n", name);
+		return NULL;
+	}
+
+	vif = kzalloc_obj(*vif, GFP_KERNEL);
+	if (unlikely(!vif)) {
+		pr_debug("could not allocate wireless device\n");
+		return NULL;
+	}
+	wdev = &vif->wdev;
+	wdev->wiphy = aicwf_hw->wiphy;
+	wdev->iftype = type;
+
+	pr_debug("ifname=%s, wdev=%p, vif_idx=%d\n", name,
+		 wdev, vif_idx);
+
+#ifndef CONFIG_AIC8800_USE_P2P0
+	vif->is_p2p_vif = 1;
+	vif->aicwf_hw = aicwf_hw;
+	vif->vif_index = vif_idx;
+	vif->wdev.wiphy = aicwf_hw->wiphy;
+	vif->drv_vif_index = vif_idx;
+	vif->up = false;
+	vif->ch_index = AICWF_CH_NOT_SET;
+	memset(&vif->net_stats, 0, sizeof(vif->net_stats));
+	vif->use_4addr = false;
+
+	spin_lock_bh(&aicwf_hw->cb_lock);
+	list_add_tail(&vif->list, &aicwf_hw->vifs);
+	spin_unlock_bh(&aicwf_hw->cb_lock);
+
+	if (aicwf_hw->is_p2p_alive == 0) {
+		aicwf_hw->is_p2p_alive = 0;
+		aicwf_hw->is_p2p_connected = 0;
+		aicwf_hw->p2p_dev_vif = vif;
+		atomic_set(&aicwf_hw->p2p_alive_timer_count, 0);
+	}
+#endif
+	aicwf_hw->avail_idx_map &= ~BIT(vif_idx);
+
+	memcpy(vif->wdev.address, aicwf_hw->wiphy->perm_addr, ETH_ALEN);
+	vif->wdev.address[5] ^= vif_idx;
+	pr_debug("p2p dev addr=%x %x %x %x %x %x\n", vif->wdev.address[0],
+		 vif->wdev.address[1], vif->wdev.address[2], vif->wdev.address[3],
+		 vif->wdev.address[4], vif->wdev.address[5]);
+
+	return wdev;
+}
+
+/*
+ * @brief Retrieve the aicwf_sta object allocated for a given MAC address
+ * and a given role.
+ */
+static struct aicwf_sta *aicwf_retrieve_sta(struct aicwf_hw *aicwf_hw,
+					    struct aicwf_vif *aicwf_vif, u8 *addr,
+					    __le16 fc, bool ap)
+{
+	if (ap) {
+		/* only deauth, disassoc and action are bufferable MMPDUs */
+		bool bufferable = ieee80211_is_deauth(fc) ||
+				  ieee80211_is_disassoc(fc) ||
+				  ieee80211_is_action(fc);
+
+		/* Check if the packet is bufferable or not */
+		if (bufferable) {
+			/* Check if address is a broadcast or a multicast address */
+			if (is_broadcast_ether_addr(addr) ||
+			    is_multicast_ether_addr(addr)) {
+				/* Returned STA pointer */
+				struct aicwf_sta *aicwf_sta =
+					&aicwf_hw->sta_table[aicwf_vif->ap.bcmc_index];
+
+				if (aicwf_sta->valid)
+					return aicwf_sta;
+			} else {
+				/* Returned STA pointer */
+				struct aicwf_sta *aicwf_sta;
+
+				/* Go through list of STAs linked with the provided VIF */
+				spin_lock_bh(&aicwf_vif->aicwf_hw->cb_lock);
+				list_for_each_entry(aicwf_sta, &aicwf_vif->ap.sta_list, list) {
+					if (aicwf_sta->valid &&
+					    ether_addr_equal(aicwf_sta->mac_addr, addr)) {
+						/* Return the found STA */
+						spin_unlock_bh(&aicwf_vif->aicwf_hw->cb_lock);
+						return aicwf_sta;
+					}
+				}
+				spin_unlock_bh(&aicwf_vif->aicwf_hw->cb_lock);
+			}
+		}
+	} else {
+		return aicwf_vif->sta.ap;
+	}
+
+	return NULL;
+}
+
+/*
+ * @add_virtual_intf: create a new virtual interface with the given name,
+ *	must set the struct wireless_dev's iftype. Beware: You must create
+ *	the new netdev in the wiphy's network namespace! Returns the struct
+ *	wireless_dev, or an ERR_PTR. For P2P device wdevs, the driver must
+ *	also set the address member in the wdev.
+ */
+static struct wireless_dev *
+aicwf_cfg80211_add_iface(struct wiphy *wiphy, const char *name,
+			 unsigned char name_assign_type,
+			 enum nl80211_iftype type, struct vif_params *params)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct wireless_dev *wdev;
+
+	if (IS_ENABLED(CONFIG_AIC8800_STA_ONLY) &&
+	    type != NL80211_IFTYPE_STATION)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	if (type != NL80211_IFTYPE_P2P_DEVICE) {
+		struct aicwf_vif *vif =
+			aicwf_interface_add(aicwf_hw, name, name_assign_type, type, params);
+		if (!vif)
+			return ERR_PTR(-EINVAL);
+		return &vif->wdev;
+	}
+	wdev = aicwf_virtual_interface_add(aicwf_hw, name, name_assign_type, type,
+					   params);
+	if (!wdev)
+		return ERR_PTR(-EINVAL);
+	return wdev;
+}
+
+/*
+ * @del_virtual_intf: remove the virtual interface
+ */
+static int aicwf_cfg80211_del_iface(struct wiphy *wiphy,
+				    struct wireless_dev *wdev)
+{
+	struct net_device *dev = wdev->netdev;
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif = container_of(wdev, struct aicwf_vif, wdev);
+
+	dev_dbg(&wiphy->dev, "del_iface: %p, %x\n", wdev, wdev->address[5]);
+
+	if (!dev || !aicwf_vif->ndev) {
+		cfg80211_unregister_wdev(wdev);
+		spin_lock_bh(&aicwf_hw->cb_lock);
+		list_del(&aicwf_vif->list);
+		spin_unlock_bh(&aicwf_hw->cb_lock);
+		aicwf_hw->avail_idx_map |= BIT(aicwf_vif->drv_vif_index);
+		aicwf_vif->ndev = NULL;
+		kfree(aicwf_vif);
+		return 0;
+	}
+
+	netdev_info(dev, "remove interface\n");
+
+	if (dev->reg_state == NETREG_REGISTERED) {
+		/* Will call aicwf_close if interface is UP */
+		cfg80211_unregister_netdevice(dev);
+	}
+
+	spin_lock_bh(&aicwf_hw->cb_lock);
+	list_del(&aicwf_vif->list);
+	spin_unlock_bh(&aicwf_hw->cb_lock);
+	aicwf_hw->avail_idx_map |= BIT(aicwf_vif->drv_vif_index);
+	aicwf_vif->ndev = NULL;
+
+	/* Clear the priv in adapter */
+	dev->ieee80211_ptr = NULL;
+
+	return 0;
+}
+
+/*
+ * @change_virtual_intf: change type/configuration of virtual interface,
+ *	keep the struct wireless_dev's iftype updated.
+ */
+static int aicwf_cfg80211_change_iface(struct wiphy *wiphy,
+				       struct net_device *dev,
+				       enum nl80211_iftype type,
+				       struct vif_params *params)
+{
+#ifndef CONFIG_AICWF_MON_DATA
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+#endif
+	struct aicwf_vif *vif = netdev_priv(dev);
+	struct mm_add_if_cfm add_if_cfm;
+	bool p2p = false;
+	int ret;
+
+	dev_dbg(&wiphy->dev, "change_if: %d to %d, %d, %d", vif->wdev.iftype, type,
+		NL80211_IFTYPE_P2P_CLIENT, NL80211_IFTYPE_STATION);
+
+	if (IS_ENABLED(CONFIG_AIC8800_STA_ONLY) &&
+	    type != NL80211_IFTYPE_STATION)
+		return -EOPNOTSUPP;
+
+#ifndef CONFIG_AICWF_MON_DATA
+	if (type == NL80211_IFTYPE_MONITOR &&
+	    AICWF_VIF_TYPE(vif) != NL80211_IFTYPE_MONITOR) {
+		struct aicwf_vif *vif_el;
+
+		list_for_each_entry(vif_el, &aicwf_hw->vifs, list) {
+			// Check if data interface already exists
+			if (vif_el != vif &&
+			    AICWF_VIF_TYPE(vif) != NL80211_IFTYPE_MONITOR) {
+				wiphy_err(aicwf_hw->wiphy,
+					  "Monitor+Data interface support (MON_DATA) disabled\n");
+				return -EIO;
+			}
+		}
+	}
+#endif
+
+	// Reset to default case (i.e. not monitor)
+	dev->type = ARPHRD_ETHER;
+	dev->netdev_ops = &aicwf_netdev_ops;
+
+	switch (type) {
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	case NL80211_IFTYPE_P2P_CLIENT:
+#endif
+	case NL80211_IFTYPE_STATION:
+		vif->sta.ap = NULL;
+		vif->sta.tdls_sta = NULL;
+		vif->sta.external_auth = false;
+		break;
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	case NL80211_IFTYPE_MESH_POINT:
+		INIT_LIST_HEAD(&vif->ap.mpath_list);
+		INIT_LIST_HEAD(&vif->ap.proxy_list);
+		vif->ap.create_path = false;
+		vif->ap.generation = 0;
+		fallthrough;
+		// no break
+	case NL80211_IFTYPE_AP:
+	case NL80211_IFTYPE_P2P_GO:
+		INIT_LIST_HEAD(&vif->ap.sta_list);
+		memset(&vif->ap.bcn, 0, sizeof(vif->ap.bcn));
+		break;
+	case NL80211_IFTYPE_AP_VLAN:
+		return -EPERM;
+	case NL80211_IFTYPE_MONITOR:
+		dev->type = ARPHRD_IEEE80211_RADIOTAP;
+		dev->netdev_ops = &aicwf_netdev_monitor_ops;
+		break;
+#endif
+	default:
+		break;
+	}
+
+	vif->wdev.iftype = type;
+	if (params->use_4addr != -1)
+		vif->use_4addr = params->use_4addr;
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	if (type == NL80211_IFTYPE_P2P_CLIENT || type == NL80211_IFTYPE_P2P_GO)
+		p2p = true;
+#endif
+
+	if (vif->up) {
+		/* Abort scan request on the vif */
+		if (aicwf_scan_pending(vif->aicwf_hw, &vif->wdev)) {
+			ret = aicwf_send_scanu_cancel_req(vif->aicwf_hw, NULL);
+			if (ret) {
+				dev_err(&wiphy->dev, "scanu_cancel fail\n");
+				return ret;
+			}
+		}
+		ret = aicwf_send_remove_if(vif->aicwf_hw, vif->vif_index, false);
+		if (ret) {
+			dev_dbg(&wiphy->dev, "remove_if fail\n");
+			return ret;
+		}
+		vif->aicwf_hw->vif_table[vif->vif_index] = NULL;
+		dev_dbg(&wiphy->dev, "change_if from %d\n", vif->vif_index);
+		ret = aicwf_send_add_if(vif->aicwf_hw, vif->wdev.address,
+					AICWF_VIF_TYPE(vif), p2p, &add_if_cfm);
+		if (ret) {
+			dev_dbg(&wiphy->dev, "add if fail\n");
+			return ret;
+		}
+		if (add_if_cfm.status != 0) {
+			dev_dbg(&wiphy->dev, "add if status fail\n");
+			return -EIO;
+		}
+
+		dev_dbg(&wiphy->dev, "change_if to %d\n", add_if_cfm.inst_nbr);
+		/* Save the index retrieved from LMAC */
+		spin_lock_bh(&vif->aicwf_hw->cb_lock);
+		vif->vif_index = add_if_cfm.inst_nbr;
+		vif->aicwf_hw->vif_table[add_if_cfm.inst_nbr] = vif;
+		spin_unlock_bh(&vif->aicwf_hw->cb_lock);
+	}
+
+	return 0;
+}
+
+static int __maybe_unused aicwf_cfgp2p_start_p2p_device(struct wiphy *wiphy,
+							struct wireless_dev *wdev)
+{
+	int ret = 0;
+
+	// do nothing
+	dev_dbg(&wiphy->dev, "p2P interface started\n");
+
+	return ret;
+}
+
+static void __maybe_unused aicwf_cfgp2p_stop_p2p_device(struct wiphy *wiphy,
+							struct wireless_dev *wdev)
+{
+	int ret = 0;
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif = container_of(wdev, struct aicwf_vif, wdev);
+	/* Abort scan request on the vif */
+	if (aicwf_scan_complete(aicwf_hw, &aicwf_vif->wdev, true)) {
+		ret = aicwf_send_scanu_cancel_req(aicwf_hw, NULL);
+		if (ret)
+			dev_dbg(&wiphy->dev, "scanu_cancel fail\n");
+	}
+
+	if (aicwf_vif == aicwf_hw->p2p_dev_vif) {
+		aicwf_hw->is_p2p_alive = 0;
+		if (timer_pending(&aicwf_hw->p2p_alive_timer))
+			//del_timer_sync(&aicwf_hw->p2p_alive_timer);
+			timer_delete_sync(&aicwf_hw->p2p_alive_timer);
+
+		if (aicwf_vif->up) {
+			aicwf_send_remove_if(aicwf_hw, aicwf_vif->vif_index, true);
+			/* Ensure that we won't process disconnect ind */
+			spin_lock_bh(&aicwf_hw->cb_lock);
+			aicwf_vif->up = false;
+			aicwf_hw->vif_table[aicwf_vif->vif_index] = NULL;
+			dev_dbg(&wiphy->dev, "aicwf_vif[%d] down\n",
+				aicwf_vif->vif_index);
+			aicwf_hw->vif_started--;
+			spin_unlock_bh(&aicwf_hw->cb_lock);
+		}
+	}
+	dev_dbg(&wiphy->dev, "exit. P2P interface stopped\n");
+}
+
+/*
+ * @scan: Request to do a scan. If returning zero, the scan request is given
+ *	the driver, and will be valid until passed to cfg80211_scan_done().
+ *	For scan results, call cfg80211_inform_bss(); you can call this outside
+ *	the scan/scan_done bracket too.
+ */
+static int aicwf_scan(struct wiphy *wiphy,
+		      struct cfg80211_scan_request *request, bool sched_scan)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif =
+		container_of(request->wdev, struct aicwf_vif, wdev);
+	int error;
+
+	if (aicwf_hw->testmode)
+		return -EBUSY;
+
+	if ((int)atomic_read(&aicwf_vif->drv_conn_state) == (int)AICWF_DRV_STATUS_CONNECTING) {
+		dev_err(&wiphy->dev, "wifi is connecting, return it\n");
+		return -EBUSY;
+	}
+
+	if ((AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_STATION ||
+	     AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_P2P_CLIENT) &&
+	    aicwf_vif->sta.external_auth) {
+		dev_err(&wiphy->dev, "scan about: external auth\n");
+		return -EBUSY;
+	}
+
+	spin_lock_bh(&aicwf_hw->scan_lock);
+	if (aicwf_hw->scan_request || !aicwf_sdio_scan_activity_get(aicwf_hw)) {
+		spin_unlock_bh(&aicwf_hw->scan_lock);
+		return -EBUSY;
+	}
+
+	aicwf_hw->scan_request = request;
+	WRITE_ONCE(aicwf_hw->scanning, 1);
+#ifdef CONFIG_AIC8800_SCHED_SCAN
+	aicwf_hw->is_sched_scan = sched_scan;
+#endif
+	spin_unlock_bh(&aicwf_hw->scan_lock);
+
+	error = aicwf_send_scanu_req(aicwf_hw, aicwf_vif, request);
+	if (error) {
+		spin_lock_bh(&aicwf_hw->scan_lock);
+		if (aicwf_hw->scan_request == request) {
+			aicwf_hw->scan_request = NULL;
+			WRITE_ONCE(aicwf_hw->scanning, 0);
+#ifdef CONFIG_AIC8800_SCHED_SCAN
+			aicwf_hw->is_sched_scan = false;
+#endif
+			aicwf_sdio_scan_activity_put(aicwf_hw);
+		} else {
+			/* A completion already accepted this request; do not reject it. */
+			error = 0;
+		}
+		spin_unlock_bh(&aicwf_hw->scan_lock);
+		return error;
+	}
+
+	return 0;
+}
+
+static int aicwf_cfg80211_scan(struct wiphy *wiphy,
+			       struct cfg80211_scan_request *request)
+{
+	return aicwf_scan(wiphy, request, false);
+}
+
+/*
+ * @add_key: add a key with the given parameters. @mac_addr will be %NULL
+ *	when adding a group key.
+ */
+static int aicwf_cfg80211_add_key(struct wiphy *wiphy, struct wireless_dev *wdev,
+				  int link_id,
+				  u8 key_index, enum nl80211_key_type key_type,
+				  const u8 *mac_addr, struct key_params *params)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct net_device *netdev = wdev->netdev;
+	struct aicwf_vif *vif = netdev_priv(netdev);
+	int i, error = 0;
+	struct mm_key_add_cfm key_add_cfm;
+	u8 cipher = 0;
+	struct aicwf_sta *sta = NULL;
+	struct aicwf_key *aicwf_key;
+
+	if (key_type != NL80211_KEYTYPE_GROUP &&
+	    key_type != NL80211_KEYTYPE_PAIRWISE)
+		return -EOPNOTSUPP;
+
+	if (mac_addr) {
+		sta = aicwf_get_sta(aicwf_hw, mac_addr);
+		if (!sta)
+			return -EINVAL;
+		aicwf_key = &sta->key;
+		if (vif->wdev.iftype == NL80211_IFTYPE_STATION ||
+		    vif->wdev.iftype == NL80211_IFTYPE_P2P_CLIENT)
+			vif->sta.paired_cipher_type = params->cipher;
+	} else {
+		aicwf_key = &vif->key[key_index];
+		vif->key_has_add = 1;
+		if (vif->wdev.iftype == NL80211_IFTYPE_STATION ||
+		    vif->wdev.iftype == NL80211_IFTYPE_P2P_CLIENT)
+			vif->sta.group_cipher_type = params->cipher;
+	}
+
+	/* Retrieve the cipher suite selector */
+	switch (params->cipher) {
+	case WLAN_CIPHER_SUITE_WEP40:
+		cipher = MAC_CIPHER_WEP40;
+		break;
+	case WLAN_CIPHER_SUITE_WEP104:
+		cipher = MAC_CIPHER_WEP104;
+		break;
+	case WLAN_CIPHER_SUITE_TKIP:
+		cipher = MAC_CIPHER_TKIP;
+		break;
+	case WLAN_CIPHER_SUITE_CCMP:
+		cipher = MAC_CIPHER_CCMP;
+		break;
+	case WLAN_CIPHER_SUITE_AES_CMAC:
+		cipher = MAC_CIPHER_BIP_CMAC_128;
+		break;
+	case WLAN_CIPHER_SUITE_SMS4: {
+		// Need to reverse key order
+		u8 tmp, *key = (u8 *)params->key;
+
+		cipher = MAC_CIPHER_WPI_SMS4;
+		for (i = 0; i < WPI_SUBKEY_LEN / 2; i++) {
+			tmp = key[i];
+			key[i] = key[WPI_SUBKEY_LEN - 1 - i];
+			key[WPI_SUBKEY_LEN - 1 - i] = tmp;
+		}
+		for (i = 0; i < WPI_SUBKEY_LEN / 2; i++) {
+			tmp = key[i + WPI_SUBKEY_LEN];
+			key[i + WPI_SUBKEY_LEN] = key[WPI_KEY_LEN - 1 - i];
+			key[WPI_KEY_LEN - 1 - i] = tmp;
+		}
+		break;
+	}
+	default:
+		return -EINVAL;
+	}
+
+	vif->key_flag = false;
+	error = aicwf_send_key_add(aicwf_hw, vif->vif_index,
+				   (sta ? sta->sta_idx : 0xFF),
+				   key_type == NL80211_KEYTYPE_PAIRWISE,
+				   (u8 *)params->key, params->key_len,
+				   key_index, cipher, &key_add_cfm);
+	if (error)
+		return error;
+
+	if (key_add_cfm.status != 0) {
+		dev_err(&wiphy->dev, "key_add: Status Error(%d)\n", key_add_cfm.status);
+		return -EIO;
+	}
+
+	/* Save the index retrieved from LMAC */
+	aicwf_key->hw_idx = key_add_cfm.hw_key_idx;
+
+	return 0;
+}
+
+/*
+ * @get_key: get information about the key with the given parameters.
+ *	@mac_addr will be %NULL when requesting information for a group
+ *	key. All pointers given to the @callback function need not be valid
+ *	after it returns. This function should return an error if it is
+ *	not possible to retrieve the key, -ENOENT if it doesn't exist.
+ *
+ */
+static int aicwf_cfg80211_get_key(struct wiphy *wiphy, struct wireless_dev *wdev,
+				  int link_id,
+				  u8 key_index, enum nl80211_key_type key_type,
+				  const u8 *mac_addr, void *cookie,
+				  void (*callback)(void *cookie, struct key_params *))
+{
+	return -1;
+}
+
+/*
+ * @del_key: remove a key given the @mac_addr (%NULL for a group key)
+ *	and @key_index, return -ENOENT if the key doesn't exist.
+ */
+static int aicwf_cfg80211_del_key(struct wiphy *wiphy, struct wireless_dev *wdev,
+				  int link_id,
+				  u8 key_index, enum nl80211_key_type key_type,
+				  const u8 *mac_addr)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct net_device *netdev = wdev->netdev;
+	struct aicwf_vif *vif = netdev_priv(netdev);
+	int error;
+	struct aicwf_sta *sta = NULL;
+	struct aicwf_key *aicwf_key;
+
+	if (!vif->key_flag && vif->wdev.iftype == NL80211_IFTYPE_STATION)
+		return 0;
+
+	if (mac_addr) {
+		sta = aicwf_get_sta(aicwf_hw, mac_addr);
+		if (!sta)
+			return -EINVAL;
+		aicwf_key = &sta->key;
+		if (vif->wdev.iftype == NL80211_IFTYPE_STATION ||
+		    vif->wdev.iftype == NL80211_IFTYPE_P2P_CLIENT)
+			vif->sta.paired_cipher_type = 0xff;
+	} else {
+		aicwf_key = &vif->key[key_index];
+		vif->key_has_add = 0;
+		if (vif->wdev.iftype == NL80211_IFTYPE_STATION ||
+		    vif->wdev.iftype == NL80211_IFTYPE_P2P_CLIENT)
+			vif->sta.group_cipher_type = 0xff;
+	}
+
+	error = aicwf_send_key_del(aicwf_hw, aicwf_key->hw_idx);
+
+	aicwf_key->hw_idx = 0;
+	return error;
+}
+
+/*
+ * @set_default_key: set the default key on an interface
+ */
+static int aicwf_cfg80211_set_default_key(struct wiphy *wiphy,
+					  struct net_device *netdev,
+					  int link_id,
+					  u8 key_index, bool unicast,
+					  bool multicast)
+{
+	return 0;
+}
+
+/*
+ * @set_default_mgmt_key: set the default management frame key on an interface
+ */
+static int aicwf_cfg80211_set_default_mgmt_key(struct wiphy *wiphy,
+					       struct wireless_dev *wdev,
+					       int link_id,
+					       u8 key_index)
+{
+	return 0;
+}
+
+/*
+ * @connect: Connect to the ESS with the specified parameters. When connected,
+ *	call cfg80211_connect_result() with status code %WLAN_STATUS_SUCCESS.
+ *	If the connection fails for some reason, call cfg80211_connect_result()
+ *	with the status from the AP.
+ *	(invoked with the wireless_dev mutex held)
+ */
+static int aicwf_cfg80211_connect(struct wiphy *wiphy, struct net_device *dev,
+				  struct cfg80211_connect_params *sme)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct sm_connect_cfm sm_connect_cfm;
+	int error = 0;
+	int is_wep = (sme->crypto.cipher_group == WLAN_CIPHER_SUITE_WEP40 ||
+		      sme->crypto.cipher_group == WLAN_CIPHER_SUITE_WEP104 ||
+		      sme->crypto.ciphers_pairwise[0] == WLAN_CIPHER_SUITE_WEP40 ||
+		      sme->crypto.ciphers_pairwise[0] == WLAN_CIPHER_SUITE_WEP104);
+
+	if ((int)atomic_read(&aicwf_vif->drv_conn_state) == (int)AICWF_DRV_STATUS_CONNECTED) {
+		dev_dbg(&wiphy->dev, "this connection is roam\n");
+		aicwf_vif->sta.is_roam = true;
+	} else {
+		aicwf_vif->sta.is_roam = false;
+	}
+
+	if ((int)atomic_read(&aicwf_vif->drv_conn_state) == (int)AICWF_DRV_STATUS_DISCONNECTING ||
+	    (int)atomic_read(&aicwf_vif->drv_conn_state) == (int)AICWF_DRV_STATUS_CONNECTING) {
+		dev_err(&wiphy->dev, "driver is disconnecting or connecting ,return it\n");
+		return 0;
+	}
+
+	if (aicwf_vif->sta.is_roam)
+		aicwf_set_conn_state(&aicwf_vif->drv_conn_state, (int)AICWF_DRV_STATUS_ROAMING);
+	else
+		aicwf_set_conn_state(&aicwf_vif->drv_conn_state, (int)AICWF_DRV_STATUS_CONNECTING);
+
+	if (is_wep) {
+		if (sme->auth_type == NL80211_AUTHTYPE_AUTOMATIC) {
+			if (aicwf_vif->wep_enabled && aicwf_vif->wep_auth_err) {
+				if (aicwf_vif->last_auth_type == NL80211_AUTHTYPE_SHARED_KEY)
+					sme->auth_type = NL80211_AUTHTYPE_OPEN_SYSTEM;
+				else
+					sme->auth_type = NL80211_AUTHTYPE_SHARED_KEY;
+			} else {
+				if (aicwf_vif->wep_enabled && !aicwf_vif->wep_auth_err)
+					sme->auth_type = aicwf_vif->last_auth_type;
+				else
+					sme->auth_type = NL80211_AUTHTYPE_SHARED_KEY;
+			}
+			dev_dbg(&wiphy->dev, "auto: use sme->auth_type = %d\n",
+				sme->auth_type);
+		} else {
+			if (aicwf_vif->wep_enabled && aicwf_vif->wep_auth_err &&
+			    sme->auth_type == aicwf_vif->last_auth_type) {
+				if (sme->auth_type == NL80211_AUTHTYPE_SHARED_KEY) {
+					sme->auth_type = NL80211_AUTHTYPE_OPEN_SYSTEM;
+					dev_dbg(&wiphy->dev, "start connect, auth_type changed, shared --> open\n");
+				} else if (sme->auth_type == NL80211_AUTHTYPE_OPEN_SYSTEM) {
+					sme->auth_type = NL80211_AUTHTYPE_SHARED_KEY;
+					dev_dbg(&wiphy->dev, "start connect, auth_type changed, open --> shared\n");
+				}
+			}
+		}
+	}
+
+	/* For SHARED-KEY authentication, must install key first */
+	if (sme->auth_type == NL80211_AUTHTYPE_SHARED_KEY && sme->key) {
+		struct key_params key_params;
+
+		key_params.key = (u8 *)sme->key;
+		key_params.seq = NULL;
+		key_params.key_len = sme->key_len;
+		key_params.seq_len = 0;
+		key_params.cipher = sme->crypto.cipher_group;
+		aicwf_cfg80211_add_key(wiphy, &aicwf_vif->wdev, 0,
+				       sme->key_idx, NL80211_KEYTYPE_GROUP,
+				       NULL, &key_params);
+	} else if (sme->auth_type == NL80211_AUTHTYPE_SAE &&
+		  !(sme->flags & CONNECT_REQ_EXTERNAL_AUTH_SUPPORT)) {
+		netdev_err(dev,
+			   "does not support sae without external authentication\n");
+		return -EINVAL;
+	}
+
+	if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_P2P_CLIENT)
+		aicwf_hw->is_p2p_connected = 1;
+
+	if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_STATION ||
+	    aicwf_vif->wdev.iftype == NL80211_IFTYPE_P2P_CLIENT) {
+		aicwf_vif->sta.paired_cipher_type = 0xff;
+		aicwf_vif->sta.group_cipher_type = 0xff;
+	}
+
+	/* Forward the information to the LMAC */
+	error = aicwf_send_sm_connect_req(aicwf_hw, aicwf_vif, sme, &sm_connect_cfm);
+	if (error)
+		return error;
+
+	// Check the status
+	switch (sm_connect_cfm.status) {
+	case CO_OK:
+		error = 0;
+		break;
+	case CO_BUSY:
+		error = -EINPROGRESS;
+		break;
+	case CO_OP_IN_PROGRESS:
+		error = -EALREADY;
+		break;
+	default:
+		error = -EIO;
+		break;
+	}
+
+	return error;
+}
+
+/*
+ * @disconnect: Disconnect from the BSS/ESS.
+ *	(invoked with the wireless_dev mutex held)
+ */
+static int aicwf_cfg80211_disconnect(struct wiphy *wiphy, struct net_device *dev,
+				     u16 reason_code)
+{
+	int ret = 0;
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+
+	dev_dbg(&wiphy->dev, "drv_vif_index:%d disconnect reason:%d\n",
+		aicwf_vif->drv_vif_index, reason_code);
+
+	if (atomic_read(&aicwf_vif->drv_conn_state) == AICWF_DRV_STATUS_DISCONNECTED) {
+		dev_err(&wiphy->dev, "this\n");
+		WARN_ON(1);
+		return -EBUSY;
+	}
+
+	if (atomic_read(&aicwf_vif->drv_conn_state) == AICWF_DRV_STATUS_DISCONNECTING) {
+		dev_err(&wiphy->dev, "wifi is disconnecting, return it:%d\n", reason_code);
+		return -EBUSY;
+	}
+
+	if (atomic_read(&aicwf_vif->drv_conn_state) == AICWF_DRV_STATUS_CONNECTED ||
+	    atomic_read(&aicwf_vif->drv_conn_state) == AICWF_DRV_STATUS_CONNECTING ||
+	    atomic_read(&aicwf_vif->drv_conn_state) == AICWF_DRV_STATUS_ROAMING) {
+		aicwf_set_conn_state(&aicwf_vif->drv_conn_state, AICWF_DRV_STATUS_DISCONNECTING);
+		aicwf_vif->key_flag = true;
+		ret = aicwf_send_sm_disconnect_req(aicwf_hw, aicwf_vif, reason_code);
+		if (aicwf_hw->sdiodev->bus_if->state == BUS_DOWN_ST) {
+			dev_dbg(&wiphy->dev, "bus is down %d\n", ret);
+			aicwf_set_conn_state(&aicwf_vif->drv_conn_state,
+					     AICWF_DRV_STATUS_DISCONNECTED);
+		}
+		return ret;
+	}
+
+	return 0;
+}
+
+#ifdef CONFIG_AIC8800_SCHED_SCAN
+static int aicwf_cfg80211_sched_scan_stop(struct wiphy *wiphy,
+					  struct net_device *ndev,
+					  u64 reqid)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	// struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	dev_dbg(&wiphy->dev, "enter wiphy:%p\n", wiphy);
+
+	if (aicwf_scan_pending(aicwf_hw, ndev->ieee80211_ptr)) {
+		dev_dbg(&wiphy->dev, "aicwf_send_scanu_cancel_req\n");
+		return aicwf_send_scanu_cancel_req(aicwf_hw, NULL);
+	} else {
+		return 0;
+	}
+}
+
+static int
+aicwf_cfg80211_sched_scan_start(struct wiphy *wiphy, struct net_device *dev,
+				struct cfg80211_sched_scan_request *request)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct cfg80211_scan_request *scan_request = NULL;
+
+	int ret = 0;
+	int index = 0;
+
+	dev_dbg(&wiphy->dev, "enter wiphy:%p\n", wiphy);
+
+	if (aicwf_hw->is_sched_scan || aicwf_hw->scanning) {
+		dev_err(&wiphy->dev, "is_sched_scanning and scanning, busy");
+		return -EBUSY;
+	}
+
+	scan_request = (struct cfg80211_scan_request *)
+			kmalloc_obj(struct cfg80211_scan_request, GFP_KERNEL);
+
+	scan_request->ssids = request->ssids;
+	scan_request->n_channels = request->n_channels;
+	scan_request->n_ssids = request->n_match_sets;
+	scan_request->no_cck = false;
+	scan_request->ie = request->ie;
+	scan_request->ie_len = request->ie_len;
+	scan_request->flags = request->flags;
+
+	scan_request->wiphy = wiphy;
+	scan_request->scan_start = request->scan_start;
+	memcpy(scan_request->mac_addr, request->mac_addr, ETH_ALEN);
+	memcpy(scan_request->mac_addr_mask, request->mac_addr_mask, ETH_ALEN);
+	aicwf_hw->sched_scan_req = request;
+	scan_request->wdev = &aicwf_vif->wdev;
+	dev_dbg(&wiphy->dev, "scan_request->n_channels:%d\n",
+		scan_request->n_channels);
+	dev_dbg(&wiphy->dev, "scan_request->n_ssids:%d\n",
+		scan_request->n_ssids);
+
+	for (index = 0; index < scan_request->n_ssids; index++) {
+		memset(scan_request->ssids[index].ssid, 0, IEEE80211_MAX_SSID_LEN);
+
+		memcpy(scan_request->ssids[index].ssid,
+		       request->match_sets[index].ssid.ssid, IEEE80211_MAX_SSID_LEN);
+
+		scan_request->ssids[index].ssid_len = request->match_sets[index].ssid.ssid_len;
+
+		dev_dbg(&wiphy->dev, "request ssid:%s len:%d\n",
+			scan_request->ssids[index].ssid,
+			scan_request->ssids[index].ssid_len);
+	}
+
+	for (index = 0; index < scan_request->n_channels; index++) {
+		scan_request->channels[index] = request->channels[index];
+
+		dev_dbg(&wiphy->dev, "scan_request->channels[%d]:%d\n",
+			index, scan_request->channels[index]->center_freq);
+
+		if (!scan_request->channels[index]) {
+			dev_err(&wiphy->dev, "channels is null!\n");
+			continue;
+		}
+	}
+
+	if (aicwf_hw->scanning) {
+		dev_err(&wiphy->dev, "scanning, about it");
+		kfree(scan_request);
+		return -EBUSY;
+	}
+	ret = aicwf_scan(wiphy, scan_request, true);
+	if (ret)
+		kfree(scan_request);
+	return ret;
+}
+#endif // CONFIG_AIC8800_SCHED_SCAN
+
+/*
+ * @external_auth: indicates result of offloaded authentication processing from
+ *     user space
+ */
+static int
+aicwf_cfg80211_external_auth(struct wiphy *wiphy, struct net_device *dev,
+			     struct cfg80211_external_auth_params *params)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+
+	if (!aicwf_vif->sta.external_auth)
+		return -EINVAL;
+
+	aicwf_external_auth_disable(aicwf_vif);
+	return aicwf_send_sm_external_auth_required_rsp(aicwf_hw, aicwf_vif,
+						       params->status);
+}
+
+/*
+ * @add_station: Add a new station.
+ */
+static int __maybe_unused aicwf_cfg80211_add_station(struct wiphy *wiphy,
+						     struct wireless_dev *wdev,
+						     const u8 *mac,
+						     struct station_parameters *params)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct net_device *dev = wdev->netdev;
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct me_sta_add_cfm me_sta_add_cfm;
+	int error = 0;
+
+	WARN_ON(AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_AP_VLAN);
+
+	/* Do not add TDLS station */
+	if (params->sta_flags_set & BIT(NL80211_STA_FLAG_TDLS_PEER))
+		return 0;
+
+	/* Indicate we are in a STA addition process - This will allow handling
+	 * potential PS mode change indications correctly
+	 */
+	aicwf_hw->adding_sta = true;
+
+	/* Forward the information to the LMAC */
+	error = aicwf_send_me_sta_add(aicwf_hw, params, mac, aicwf_vif->vif_index,
+				      &me_sta_add_cfm);
+	if (error)
+		return error;
+
+	// Check the status
+	switch (me_sta_add_cfm.status) {
+	case CO_OK: {
+		struct aicwf_sta *sta = &aicwf_hw->sta_table[me_sta_add_cfm.sta_idx];
+		int tid;
+
+		sta->aid = params->aid;
+		sta->sta_idx = me_sta_add_cfm.sta_idx;
+		sta->ch_idx = aicwf_vif->ch_index;
+		sta->vif_idx = aicwf_vif->vif_index;
+		sta->vlan_idx = sta->vif_idx;
+		sta->qos = (params->sta_flags_set & BIT(NL80211_STA_FLAG_WME)) != 0;
+		sta->ht = params->link_sta_params.ht_capa ? 1 : 0;
+		sta->vht = params->link_sta_params.vht_capa ? 1 : 0;
+		sta->acm = 0;
+		sta->key.hw_idx = 0;
+
+		if (params->local_pm != NL80211_MESH_POWER_UNKNOWN)
+			sta->mesh_pm = params->local_pm;
+		else
+			sta->mesh_pm = aicwf_vif->ap.next_mesh_pm;
+		aicwf_update_mesh_power_mode(aicwf_vif);
+
+		for (tid = 0; tid < NX_NB_TXQ_PER_STA; tid++) {
+			int uapsd_bit = aicwf_hwq2uapsd[aicwf_tid2hwq[tid]];
+
+			if (params->uapsd_queues & uapsd_bit)
+				sta->uapsd_tids |= 1 << tid;
+			else
+				sta->uapsd_tids &= ~(1 << tid);
+		}
+		memcpy(sta->mac_addr, mac, ETH_ALEN);
+
+		/* Ensure that we won't process PS change or channel switch ind */
+		spin_lock_bh(&aicwf_hw->cb_lock);
+		aicwf_txq_sta_init(aicwf_hw, sta, aicwf_txq_vif_get_status(aicwf_vif));
+		list_add_tail(&sta->list, &aicwf_vif->ap.sta_list);
+		sta->valid = true;
+		aicwf_ps_bh_enable(aicwf_hw, sta,
+				   sta->ps.active || me_sta_add_cfm.pm_state);
+		spin_unlock_bh(&aicwf_hw->cb_lock);
+
+		error = 0;
+
+		if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_AP ||
+		    aicwf_vif->wdev.iftype == NL80211_IFTYPE_P2P_GO) {
+			struct station_info sinfo;
+
+			memset(&sinfo, 0, sizeof(struct station_info));
+			sinfo.assoc_req_ies = NULL;
+			sinfo.assoc_req_ies_len = 0;
+			cfg80211_new_sta(&aicwf_vif->wdev, sta->mac_addr, &sinfo,
+					 GFP_KERNEL);
+		}
+#ifdef CONFIG_AICWF_BFMER
+		if (aicwf_hw->mod_params->bfmer)
+			aicwf_send_bfmer_enable(aicwf_hw, sta,
+						params->link_sta_params.vht_capa);
+
+		aicwf_mu_group_sta_init(sta, params->link_sta_params.vht_capa);
+#endif /* CONFIG_AICWF_BFMER */
+
+#define PRINT_STA_FLAG(f)                                                      \
+	(params->sta_flags_set & BIT(NL80211_STA_FLAG_##f) ? "[" #f "]" : "")
+
+		netdev_info(dev, "add sta %d %pM flags=%s%s%s%s%s%s%s\n", sta->sta_idx,
+			    mac, PRINT_STA_FLAG(AUTHORIZED),
+			    PRINT_STA_FLAG(SHORT_PREAMBLE), PRINT_STA_FLAG(WME),
+			    PRINT_STA_FLAG(MFP), PRINT_STA_FLAG(AUTHENTICATED),
+			    PRINT_STA_FLAG(TDLS_PEER), PRINT_STA_FLAG(ASSOCIATED));
+#undef PRINT_STA_FLAG
+		break;
+	}
+	default:
+		error = -EBUSY;
+		break;
+	}
+
+	aicwf_hw->adding_sta = false;
+
+	return error;
+}
+
+/*
+ * @del_station: Remove a station
+ */
+static int aicwf_cfg80211_del_station(struct wiphy *wiphy,
+				      struct wireless_dev *wdev,
+				      struct station_del_parameters *params)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct net_device *dev = wdev->netdev;
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct aicwf_sta *cur, *tmp;
+	int error = 0, found = 0;
+	const u8 *mac = NULL;
+#ifdef CONFIG_AIC8800_RX_REORDER
+	struct reord_ctrl_info *reord_info, *reord_tmp;
+	u8 *macaddr;
+	struct aicwf_rx_priv *rx_priv;
+#endif
+	dev_dbg(&wiphy->dev, "%pM\n", mac);
+
+	if (params)
+		mac = params->mac;
+
+	do {
+		spin_lock_bh(&aicwf_hw->cb_lock);
+		if (list_empty(&aicwf_vif->ap.sta_list)) {
+			spin_unlock_bh(&aicwf_hw->cb_lock);
+			break;
+		}
+
+		list_for_each_entry_safe(cur, tmp, &aicwf_vif->ap.sta_list, list) {
+			if (!mac || !memcmp(cur->mac_addr, mac, ETH_ALEN)) {
+				found = 1;
+				break;
+			}
+		}
+
+		if (found) {
+			cur->ps.active = false;
+			cur->valid = false;
+			list_del(&cur->list);
+		}
+		spin_unlock_bh(&aicwf_hw->cb_lock);
+
+		if (found) {
+			netdev_info(dev, "del sta %d %pM\n", cur->sta_idx, cur->mac_addr);
+			if (cur->vif_idx != cur->vlan_idx) {
+				struct aicwf_vif *vlan_vif;
+
+				vlan_vif = aicwf_hw->vif_table[cur->vlan_idx];
+				if (vlan_vif->up) {
+					if (AICWF_VIF_TYPE(vlan_vif) == NL80211_IFTYPE_AP_VLAN &&
+					    vlan_vif->use_4addr) {
+						vlan_vif->ap_vlan.sta_4a = NULL;
+					} else {
+						WARN(1,
+						     "Deleting sta belonging to VLAN other than AP_VLAN 4A");
+					}
+				}
+			}
+			if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_AP ||
+			    aicwf_vif->wdev.iftype == NL80211_IFTYPE_P2P_GO) {
+				cfg80211_del_sta(&aicwf_vif->wdev, cur->mac_addr,
+						 GFP_KERNEL);
+			}
+
+#ifdef CONFIG_AIC8800_RX_REORDER
+			rx_priv = aicwf_hw->sdiodev->rx_priv;
+			if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_STATION ||
+			    aicwf_vif->wdev.iftype == NL80211_IFTYPE_P2P_CLIENT) {
+				//WARN_ON_ONCE(); // should be other function
+			} else if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_AP ||
+				   aicwf_vif->wdev.iftype == NL80211_IFTYPE_P2P_GO) {
+				macaddr = cur->mac_addr;
+				dev_dbg(&wiphy->dev, "deinit:macaddr:%x,%x,%x,%x,%x,%x\n",
+					macaddr[0], macaddr[1], macaddr[2],
+					macaddr[3], macaddr[4], macaddr[5]);
+				spin_lock_bh(&rx_priv->stas_reord_lock);
+				list_for_each_entry_safe(reord_info, reord_tmp,
+							 &rx_priv->stas_reord_list, list) {
+					dev_dbg(&wiphy->dev, "reord_mac:%x,%x,%x,%x,%x,%x\n",
+						reord_info->mac_addr[0], reord_info->mac_addr[1],
+						reord_info->mac_addr[2], reord_info->mac_addr[3],
+						reord_info->mac_addr[4], reord_info->mac_addr[5]);
+					if (!memcmp(reord_info->mac_addr, macaddr, 6)) {
+						reord_deinit_sta(rx_priv, reord_info);
+						break;
+					}
+				}
+				spin_unlock_bh(&rx_priv->stas_reord_lock);
+			}
+#endif
+			aicwf_txq_sta_deinit(aicwf_hw, cur);
+			error = aicwf_send_me_sta_del(aicwf_hw, cur->sta_idx, false);
+			if (error != 0 && error != -EPIPE)
+				return error;
+
+#ifdef CONFIG_AICWF_BFMER
+			// Disable Beamformer if supported
+			aicwf_bfmer_report_del(aicwf_hw, cur);
+			aicwf_mu_group_sta_del(aicwf_hw, cur);
+#endif /* CONFIG_AICWF_BFMER */
+		}
+
+		if (mac)
+			break;
+	} while (1);
+
+	aicwf_update_mesh_power_mode(aicwf_vif);
+
+	if (!found && mac)
+		return -ENOENT;
+	else
+		return 0;
+}
+
+void apm_staloss_work_process(struct work_struct *work)
+{
+	struct aicwf_hw *aicwf_hw = container_of(work, struct aicwf_hw, apm_staloss_work);
+	struct aicwf_sta *cur, *tmp;
+	int error = 0;
+
+#ifdef CONFIG_AIC8800_RX_REORDER
+	struct reord_ctrl_info *reord_info, *reord_tmp;
+	u8 *macaddr;
+	struct aicwf_rx_priv *rx_priv;
+#endif
+	struct aicwf_vif *aicwf_vif;
+	bool found = false;
+	const u8 *mac = aicwf_hw->sta_mac_addr;
+
+	// Look for VIF entry
+	list_for_each_entry(aicwf_vif, &aicwf_hw->vifs, list) {
+		if (aicwf_vif->vif_index == aicwf_hw->apm_vif_idx) {
+			found = true;
+			break;
+		}
+	}
+
+	pr_debug("apm vif idx=%d, found=%d, mac addr=%pM\n",
+		 aicwf_hw->apm_vif_idx, found, mac);
+	if (!found || !aicwf_vif ||
+	    (AICWF_VIF_TYPE(aicwf_vif) != NL80211_IFTYPE_AP &&
+	     AICWF_VIF_TYPE(aicwf_vif) != NL80211_IFTYPE_P2P_GO)) {
+		return;
+	}
+
+	found = false;
+	spin_lock_bh(&aicwf_hw->cb_lock);
+	list_for_each_entry_safe(cur, tmp, &aicwf_vif->ap.sta_list, list) {
+		if (mac && !memcmp(cur->mac_addr, mac, ETH_ALEN)) {
+			found = true;
+			break;
+		}
+	}
+	if (found) {
+		cur->ps.active = false;
+		cur->valid = false;
+		list_del(&cur->list);
+	}
+	spin_unlock_bh(&aicwf_hw->cb_lock);
+
+	if (found) {
+		netdev_info(aicwf_vif->ndev, "del sta %d %pM\n", cur->sta_idx,
+			    cur->mac_addr);
+		if (cur->vif_idx != cur->vlan_idx) {
+			struct aicwf_vif *vlan_vif;
+
+			vlan_vif = aicwf_hw->vif_table[cur->vlan_idx];
+			if (vlan_vif->up) {
+				if (AICWF_VIF_TYPE(vlan_vif) == NL80211_IFTYPE_AP_VLAN &&
+				    vlan_vif->use_4addr)
+					vlan_vif->ap_vlan.sta_4a = NULL;
+				WARN(1, "Deleting sta belonging to VLAN other than AP_VLAN 4A");
+			}
+		}
+
+#ifdef CONFIG_AIC8800_RX_REORDER
+		rx_priv = aicwf_hw->sdiodev->rx_priv;
+		if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_STATION ||
+		    aicwf_vif->wdev.iftype == NL80211_IFTYPE_P2P_CLIENT) {
+			//WARN_ON_ONCE(); // should be other function
+		} else if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_AP ||
+			   aicwf_vif->wdev.iftype == NL80211_IFTYPE_P2P_GO) {
+			macaddr = cur->mac_addr;
+			pr_debug("deinit:macaddr:%x,%x,%x,%x,%x,%x\n",
+				 macaddr[0], macaddr[1], macaddr[2],
+				 macaddr[3], macaddr[4], macaddr[5]);
+			spin_lock_bh(&rx_priv->stas_reord_lock);
+			list_for_each_entry_safe(reord_info, reord_tmp,
+						 &rx_priv->stas_reord_list, list) {
+				pr_debug("reord_mac:%x,%x,%x,%x,%x,%x\n",
+					 reord_info->mac_addr[0], reord_info->mac_addr[1],
+					 reord_info->mac_addr[2], reord_info->mac_addr[3],
+					 reord_info->mac_addr[4], reord_info->mac_addr[5]);
+				if (!memcmp(reord_info->mac_addr, macaddr, 6)) {
+					reord_deinit_sta(rx_priv, reord_info);
+					break;
+				}
+			}
+			spin_unlock_bh(&rx_priv->stas_reord_lock);
+		}
+#endif
+		aicwf_txq_sta_deinit(aicwf_hw, cur);
+		error = aicwf_send_me_sta_del(aicwf_hw, cur->sta_idx, false);
+		if (error != 0 && error != -EPIPE)
+			return;
+#ifdef CONFIG_AICWF_BFMER
+		// Disable Beamformer if supported
+		aicwf_bfmer_report_del(aicwf_hw, cur);
+		aicwf_mu_group_sta_del(aicwf_hw, cur);
+#endif /* CONFIG_AICWF_BFMER */
+
+	} else {
+		pr_debug("sta not found: %pM\n", mac);
+		return;
+	}
+
+	aicwf_update_mesh_power_mode(aicwf_vif);
+}
+
+void apm_probe_sta_work_process(struct work_struct *work)
+{
+	struct apm_probe_sta *probe_sta =
+		container_of(work, struct apm_probe_sta, apmprobesta_work);
+	struct aicwf_vif *aicwf_vif =
+		container_of(probe_sta, struct aicwf_vif, sta_probe);
+	bool found = false;
+	struct aicwf_sta *cur, *tmp;
+
+	u8 *mac = aicwf_vif->sta_probe.sta_mac_addr;
+
+	spin_lock_bh(&aicwf_vif->aicwf_hw->cb_lock);
+	list_for_each_entry_safe(cur, tmp, &aicwf_vif->ap.sta_list, list) {
+		if (!memcmp(cur->mac_addr, mac, ETH_ALEN)) {
+			found = true;
+			break;
+		}
+	}
+	spin_unlock_bh(&aicwf_vif->aicwf_hw->cb_lock);
+
+	pr_debug("sta %pM found = %d\n", mac, found);
+	if (found)
+		cfg80211_probe_status(aicwf_vif->ndev, mac,
+				      (u64)aicwf_vif->sta_probe.probe_id, -1,
+				      true, 0, false, GFP_ATOMIC);
+	else
+		cfg80211_probe_status(aicwf_vif->ndev, mac,
+				      (u64)aicwf_vif->sta_probe.probe_id, -1,
+				      false, 0, false, GFP_ATOMIC);
+	aicwf_vif->sta_probe.probe_id++;
+}
+
+/*
+ * @change_station: Modify a given station. Note that flags changes are not much
+ *	validated in cfg80211, in particular the auth/assoc/authorized flags
+ *	might come to the driver in invalid combinations -- make sure to check
+ *	them, also against the existing state! Drivers must call
+ *	cfg80211_check_station_change() to validate the information.
+ */
+static int __maybe_unused aicwf_cfg80211_change_station(struct wiphy *wiphy,
+							struct wireless_dev *wdev,
+							const u8 *mac,
+							struct station_parameters *params)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct net_device *dev = wdev->netdev;
+	struct aicwf_vif *vif = netdev_priv(dev);
+	struct aicwf_sta *sta;
+
+	sta = aicwf_get_sta(aicwf_hw, mac);
+	if (!sta) {
+		/* Add the TDLS station */
+		if (params->sta_flags_set & BIT(NL80211_STA_FLAG_TDLS_PEER)) {
+			struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+			struct me_sta_add_cfm me_sta_add_cfm;
+			int error = 0;
+
+			/* Indicate we are in a STA addition process - This will allow
+			 * handling potential PS mode change indications correctly
+			 */
+			aicwf_hw->adding_sta = true;
+
+			/* Forward the information to the LMAC */
+			error = aicwf_send_me_sta_add(aicwf_hw, params, mac,
+						      aicwf_vif->vif_index, &me_sta_add_cfm);
+			if (error)
+				return error;
+
+			// Check the status
+			switch (me_sta_add_cfm.status) {
+			case CO_OK: {
+				int tid;
+
+				sta = &aicwf_hw->sta_table[me_sta_add_cfm.sta_idx];
+				sta->aid = params->aid;
+				sta->sta_idx = me_sta_add_cfm.sta_idx;
+				sta->ch_idx = aicwf_vif->ch_index;
+				sta->vif_idx = aicwf_vif->vif_index;
+				sta->vlan_idx = sta->vif_idx;
+				sta->qos =
+					(params->sta_flags_set & BIT(NL80211_STA_FLAG_WME)) != 0;
+				sta->ht = params->link_sta_params.ht_capa ? 1 : 0;
+				sta->vht = params->link_sta_params.vht_capa ? 1 : 0;
+				sta->acm = 0;
+				for (tid = 0; tid < NX_NB_TXQ_PER_STA; tid++) {
+					int uapsd_bit = aicwf_hwq2uapsd[aicwf_tid2hwq[tid]];
+
+					if (params->uapsd_queues & uapsd_bit)
+						sta->uapsd_tids |= 1 << tid;
+					else
+						sta->uapsd_tids &= ~(1 << tid);
+				}
+				memcpy(sta->mac_addr, mac, ETH_ALEN);
+				/* Ensure that we won't process PS change or channel switch ind
+				 */
+				spin_lock_bh(&aicwf_hw->cb_lock);
+				aicwf_txq_sta_init(aicwf_hw, sta,
+						   aicwf_txq_vif_get_status(aicwf_vif));
+				if (aicwf_vif->tdls_status == TDLS_SETUP_RSP_TX) {
+					aicwf_vif->tdls_status = TDLS_LINK_ACTIVE;
+					sta->tdls.initiator = true;
+					sta->tdls.active = true;
+				}
+				/* Set TDLS channel switch capability */
+				if ((params->ext_capab[3] & WLAN_EXT_CAPA4_TDLS_CHAN_SWITCH) &&
+				    !aicwf_vif->tdls_chsw_prohibited)
+					sta->tdls.chsw_allowed = true;
+				aicwf_vif->sta.tdls_sta = sta;
+				sta->valid = true;
+				spin_unlock_bh(&aicwf_hw->cb_lock);
+#ifdef CONFIG_AICWF_BFMER
+				if (aicwf_hw->mod_params->bfmer)
+					aicwf_send_bfmer_enable(aicwf_hw, sta,
+								params->link_sta_params.vht_capa);
+
+				aicwf_mu_group_sta_init(sta, NULL);
+#endif /* CONFIG_AICWF_BFMER */
+
+#define PRINT_STA_FLAG(f)                                                      \
+	(params->sta_flags_set & BIT(NL80211_STA_FLAG_##f) ? "[" #f "]" : "")
+
+				netdev_info(dev, "add %s TDLS sta %d %pM flags=%s%s%s%s%s%s%s\n",
+					    sta->tdls.initiator ? "initiator" : "responder",
+					    sta->sta_idx, mac, PRINT_STA_FLAG(AUTHORIZED),
+					    PRINT_STA_FLAG(SHORT_PREAMBLE), PRINT_STA_FLAG(WME),
+					    PRINT_STA_FLAG(MFP), PRINT_STA_FLAG(AUTHENTICATED),
+					    PRINT_STA_FLAG(TDLS_PEER), PRINT_STA_FLAG(ASSOCIATED));
+#undef PRINT_STA_FLAG
+
+				break;
+			}
+			default:
+				error = -EBUSY;
+				break;
+			}
+			aicwf_hw->adding_sta = false;
+		} else {
+			return -EINVAL;
+		}
+	}
+
+	if (params->sta_flags_mask & BIT(NL80211_STA_FLAG_AUTHORIZED))
+		aicwf_send_me_set_control_port_req
+		(aicwf_hw,
+		 (params->sta_flags_set & BIT(NL80211_STA_FLAG_AUTHORIZED)) != 0,
+		 sta->sta_idx);
+
+	if (AICWF_VIF_TYPE(vif) == NL80211_IFTYPE_MESH_POINT) {
+		if (params->sta_modify_mask & STATION_PARAM_APPLY_PLINK_STATE) {
+			if (params->plink_state < NUM_NL80211_PLINK_STATES) {
+				aicwf_send_mesh_peer_update_ntf(aicwf_hw, vif, sta->sta_idx,
+								params->plink_state);
+			}
+		}
+
+		if (params->local_pm != NL80211_MESH_POWER_UNKNOWN) {
+			sta->mesh_pm = params->local_pm;
+			aicwf_update_mesh_power_mode(vif);
+		}
+	}
+
+	if (params->vlan) {
+		u8 vlan_idx;
+
+		vif = netdev_priv(params->vlan);
+		vlan_idx = vif->vif_index;
+
+		if (sta->vlan_idx != vlan_idx) {
+			struct aicwf_vif *old_vif;
+
+			old_vif = aicwf_hw->vif_table[sta->vlan_idx];
+			aicwf_txq_sta_switch_vif(sta, old_vif, vif);
+			sta->vlan_idx = vlan_idx;
+
+			if (AICWF_VIF_TYPE(vif) == NL80211_IFTYPE_AP_VLAN &&
+			    vif->use_4addr) {
+				WARN(vif->ap_vlan.sta_4a,
+				     "4A AP_VLAN interface with more than one sta");
+				vif->ap_vlan.sta_4a = sta;
+			}
+
+			if (AICWF_VIF_TYPE(old_vif) == NL80211_IFTYPE_AP_VLAN &&
+			    old_vif->use_4addr) {
+				old_vif->ap_vlan.sta_4a = NULL;
+			}
+		}
+	}
+	return 0;
+}
+
+/*
+ * @start_ap: Start acting in AP mode defined by the parameters.
+ */
+static int __maybe_unused aicwf_cfg80211_start_ap(struct wiphy *wiphy,
+						  struct net_device *dev,
+						  struct cfg80211_ap_settings *settings)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct apm_start_cfm apm_start_cfm;
+	struct aicwf_ipc_elem_var elem;
+	struct aicwf_sta *sta;
+	int error = 0;
+
+	INIT_WORK(&aicwf_vif->sta_probe.apmprobesta_work, apm_probe_sta_work_process);
+	aicwf_vif->sta_probe.apmprobesta_wq =
+		create_singlethread_workqueue("apmprobe_wq");
+	if (!aicwf_vif->sta_probe.apmprobesta_wq) {
+		dev_err(&wiphy->dev, "insufficient memory to create apmprobe_wq\n");
+		return -ENOBUFS;
+	}
+
+	if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_P2P_GO)
+		aicwf_hw->is_p2p_connected = 1;
+	/* Forward the information to the LMAC */
+	error = aicwf_send_apm_start_req(aicwf_hw, aicwf_vif, settings,
+					 &apm_start_cfm, &elem);
+	if (error)
+		goto end;
+
+	// Check the status
+	switch (apm_start_cfm.status) {
+	case CO_OK: {
+		u8 txq_status = 0;
+
+		aicwf_vif->ap.bcmc_index = apm_start_cfm.bcmc_idx;
+		aicwf_vif->ap.flags = 0;
+		aicwf_vif->ap.csa = NULL;
+		sta = &aicwf_hw->sta_table[apm_start_cfm.bcmc_idx];
+		sta->valid = true;
+		sta->aid = 0;
+		sta->sta_idx = apm_start_cfm.bcmc_idx;
+		sta->ch_idx = apm_start_cfm.ch_idx;
+		sta->vif_idx = aicwf_vif->vif_index;
+		sta->qos = false;
+		sta->acm = 0;
+		sta->ps.active = false;
+		aicwf_mu_group_sta_init(sta, NULL);
+		spin_lock_bh(&aicwf_hw->cb_lock);
+		aicwf_chanctx_link(aicwf_vif, apm_start_cfm.ch_idx, &settings->chandef);
+		if (aicwf_hw->cur_chanctx != apm_start_cfm.ch_idx)
+			txq_status = AICWF_TXQ_STOP_CHAN;
+
+		aicwf_txq_vif_init(aicwf_hw, aicwf_vif, txq_status);
+		spin_unlock_bh(&aicwf_hw->cb_lock);
+
+		netif_tx_start_all_queues(dev);
+		netif_carrier_on(dev);
+		error = 0;
+		/* If the AP channel is already the active, we probably skip radar
+		 * activation on MM_CHANNEL_SWITCH_IND (unless another vif use this
+		 * ctxt). In anycase retest if radar detection must be activated
+		 */
+		if (txq_status == 0)
+			aicwf_radar_detection_enable_on_cur_channel(aicwf_hw);
+		break;
+	}
+	case CO_BUSY:
+		error = -EINPROGRESS;
+		break;
+	case CO_OP_IN_PROGRESS:
+		error = -EALREADY;
+		break;
+	default:
+		error = -EIO;
+		break;
+	}
+
+	if (error)
+		netdev_info(dev, "failed to start AP %d\n", error);
+	else
+		netdev_info(dev, "ap started: ch=%d, bcmc_idx=%d channel=%d bw=%d\n",
+			    aicwf_vif->ch_index, aicwf_vif->ap.bcmc_index,
+			    ((settings->chandef).chan)->center_freq,
+			    ((settings->chandef).width));
+
+end:
+	return error;
+}
+
+/*
+ * @change_beacon: Change the beacon parameters for an access point mode
+ *	interface. This should reject the call when AP mode wasn't started.
+ */
+
+static int __maybe_unused aicwf_cfg80211_change_beacon(struct wiphy *wiphy,
+						       struct net_device *dev,
+						       struct cfg80211_ap_update *info)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *vif = netdev_priv(dev);
+	struct aicwf_bcn *bcn = &vif->ap.bcn;
+	u8 *buf;
+	int error = 0;
+
+	// Build the beacon
+	buf = aicwf_build_bcn(bcn, &info->beacon);
+	if (!buf)
+		return -ENOMEM;
+
+	aicwf_send_bcn(aicwf_hw, buf, vif->vif_index, bcn->len);
+
+	// Forward the information to the LMAC
+	error = aicwf_send_bcn_change(aicwf_hw, vif->vif_index, 0, bcn->len,
+				      bcn->head_len, bcn->tim_len, NULL);
+
+	return error;
+}
+
+/*
+ * * @stop_ap: Stop being an AP, including stopping beaconing.
+ */
+static int __maybe_unused aicwf_cfg80211_stop_ap(struct wiphy *wiphy,
+						 struct net_device *dev,
+						 unsigned int link_id)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+
+	netif_tx_stop_all_queues(dev);
+	netif_carrier_off(dev);
+
+	if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_P2P_GO)
+		aicwf_hw->is_p2p_connected = 0;
+	aicwf_radar_cancel_cac(&aicwf_hw->radar);
+	aicwf_send_apm_stop_req(aicwf_hw, aicwf_vif);
+	spin_lock_bh(&aicwf_hw->cb_lock);
+	aicwf_chanctx_unlink(aicwf_vif);
+	spin_unlock_bh(&aicwf_hw->cb_lock);
+
+	/* delete any remaining STA */
+	while (!list_empty(&aicwf_vif->ap.sta_list))
+		aicwf_cfg80211_del_station(wiphy, &aicwf_vif->wdev, NULL);
+
+	/* delete BC/MC STA */
+	aicwf_txq_vif_deinit(aicwf_hw, aicwf_vif);
+	aicwf_del_bcn(&aicwf_vif->ap.bcn);
+	aicwf_del_csa(aicwf_vif);
+
+	flush_workqueue(aicwf_vif->sta_probe.apmprobesta_wq);
+	destroy_workqueue(aicwf_vif->sta_probe.apmprobesta_wq);
+
+	netdev_info(dev, "ap stopped\n");
+
+	return 0;
+}
+
+/*
+ * @set_monitor_channel: Set the monitor mode channel for the device. If other
+ *	interfaces are active this callback should reject the configuration.
+ *	If no interfaces are active or the device is down, the channel should
+ *	be stored for when a monitor interface becomes active.
+ *
+ * Also called internaly with chandef set to NULL simply to retrieve the channel
+ * configured at firmware level.
+ */
+static int aicwf_cfg80211_set_monitor_channel(struct wiphy *wiphy, struct net_device *dev,
+					      struct cfg80211_chan_def *chandef)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif;
+	struct me_config_monitor_cfm cfm;
+
+	if (aicwf_hw->monitor_vif == AICWF_INVALID_VIF)
+		return -EINVAL;
+
+	aicwf_vif = aicwf_hw->vif_table[aicwf_hw->monitor_vif];
+
+	// Do nothing if monitor interface is already configured with the requested
+	// channel
+	if (aicwf_chanctx_valid(aicwf_hw, aicwf_vif->ch_index)) {
+		struct aicwf_chanctx *ctxt;
+
+		ctxt = &aicwf_vif->aicwf_hw->chanctx_table[aicwf_vif->ch_index];
+		if (chandef && cfg80211_chandef_identical(&ctxt->chan_def, chandef))
+			return 0;
+	}
+
+	// Always send command to firmware. It allows to retrieve channel context
+	// index and its configuration.
+	if (aicwf_send_config_monitor_req(aicwf_hw, chandef, &cfm))
+		return -EIO;
+
+	// Always re-set channel context info
+	aicwf_chanctx_unlink(aicwf_vif);
+
+	// If there is also a STA interface not yet connected then monitor interface
+	// will only have a channel context after the connection of the STA
+	// interface.
+	if (cfm.chan_index != AICWF_CH_NOT_SET) {
+		struct cfg80211_chan_def mon_chandef;
+
+		if (aicwf_hw->vif_started > 1) {
+			// In this case we just want to update the channel context index not
+			// the channel configuration
+			aicwf_chanctx_link(aicwf_vif, cfm.chan_index, NULL);
+			return -EBUSY;
+		}
+
+		mon_chandef.chan = ieee80211_get_channel(wiphy, cfm.chan.prim20_freq);
+		mon_chandef.center_freq1 = cfm.chan.center1_freq;
+		mon_chandef.center_freq2 = cfm.chan.center2_freq;
+		mon_chandef.width = chnl2bw[cfm.chan.type];
+		aicwf_chanctx_link(aicwf_vif, cfm.chan_index, &mon_chandef);
+	}
+
+	return 0;
+}
+
+/*
+ * @set_wiphy_params: Notify that wiphy parameters have changed;
+ *	@changed bitfield (see &enum wiphy_params_flags) describes which values
+ *	have changed. The actual parameter values are available in
+ *	struct wiphy. If returning an error, no value should be changed.
+ */
+static int aicwf_cfg80211_set_wiphy_params(struct wiphy *wiphy, int radio_idx,
+					   u32 changed)
+{
+	return 0;
+}
+
+/*
+ * @set_tx_power: set the transmit power according to the parameters,
+ *	the power passed is in mBm, to get dBm use MBM_TO_DBM(). The
+ *	wdev may be %NULL if power was set for the wiphy, and will
+ *	always be %NULL unless the driver supports per-vif TX power
+ *	(as advertised by the nl80211 feature flag.)
+ */
+static int aicwf_cfg80211_set_tx_power(struct wiphy *wiphy,
+				       struct wireless_dev *wdev,
+				       int radio_idx,
+				       enum nl80211_tx_power_setting type,
+				       int mbm)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *vif;
+	int limit, ret;
+
+	if (READ_ONCE(aicwf_hw->regdom_failed))
+		return -EIO;
+
+	switch (type) {
+	case NL80211_TX_POWER_AUTOMATIC:
+		limit = S8_MAX;
+		break;
+	case NL80211_TX_POWER_LIMITED:
+		if (mbm < DBM_TO_MBM(S8_MIN) || mbm >= DBM_TO_MBM(S8_MAX))
+			return -ERANGE;
+		/* Round down so the firmware never exceeds the requested limit. */
+		limit = mbm < 0 ? -DIV_ROUND_UP(-mbm, 100) : MBM_TO_DBM(mbm);
+		break;
+	case NL80211_TX_POWER_FIXED:
+		/* The per-channel firmware interface only specifies upper limits. */
+		return -EOPNOTSUPP;
+	default:
+		return -EINVAL;
+	}
+
+	WRITE_ONCE(aicwf_hw->tx_power_limit, limit);
+	ret = aicwf_send_me_chan_config_req(aicwf_hw);
+	if (ret) {
+		list_for_each_entry(vif, &aicwf_hw->vifs, list) {
+			if (vif->up)
+				cfg80211_stop_iface(wiphy, &vif->wdev, GFP_KERNEL);
+		}
+	}
+	return ret;
+}
+
+static int aicwf_cfg80211_set_txq_params(struct wiphy *wiphy,
+					 struct net_device *dev,
+					 struct ieee80211_txq_params *params)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	u8 hw_queue, aifs, cwmin, cwmax;
+	u32 param;
+
+	hw_queue = aicwf_ac2hwq[0][params->ac];
+
+	aifs = params->aifs;
+	cwmin = fls(params->cwmin);
+	cwmax = fls(params->cwmax);
+
+	/* Store queue information in general structure */
+	param = (u32)(aifs << 0);
+	param |= (u32)(cwmin << 4);
+	param |= (u32)(cwmax << 8);
+	param |= (u32)(params->txop) << 12;
+
+	/* Send the MM_SET_EDCA_REQ message to the FW */
+	return aicwf_send_set_edca(aicwf_hw, hw_queue, param, false,
+				  aicwf_vif->vif_index);
+}
+
+/*
+ * @remain_on_channel: Request the driver to remain awake on the specified
+ *	channel for the specified duration to complete an off-channel
+ *	operation (e.g., public action frame exchange). When the driver is
+ *	ready on the requested channel, it must indicate this with an event
+ *	notification by calling cfg80211_ready_on_channel().
+ */
+static int aicwf_cfg80211_remain_on_channel_(struct wiphy *wiphy,
+					     struct wireless_dev *wdev,
+					     struct ieee80211_channel *chan,
+					     unsigned int duration, u64 cookie,
+					     bool mgmt_roc_flag)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	// struct aicwf_vif *aicwf_vif = netdev_priv(wdev->netdev);
+	struct aicwf_vif *aicwf_vif = container_of(wdev, struct aicwf_vif, wdev);
+	struct aicwf_roc_elem *roc_elem;
+	struct mm_add_if_cfm add_if_cfm;
+	struct mm_remain_on_channel_cfm roc_cfm;
+	int error;
+
+	/* For debug purpose (use ftrace kernel option) */
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_roc(aicwf_vif->vif_index, chan->center_freq, duration);
+#endif
+	/* Check that no other RoC procedure has been launched */
+	if (aicwf_hw->roc_elem) {
+		usleep_range(2000, 4000);
+		if (aicwf_hw->roc_elem) {
+			dev_dbg(&wiphy->dev, "remain_on_channel fail\n");
+			return -EBUSY;
+		}
+	}
+
+	dev_dbg(&wiphy->dev, "remain:%d,%d,%d\n",
+		aicwf_vif->vif_index, aicwf_vif->is_p2p_vif,
+		aicwf_hw->is_p2p_alive);
+#ifdef CONFIG_AIC8800_USE_P2P0
+	if (aicwf_vif->is_p2p_vif) {
+#else
+	if (aicwf_vif == aicwf_hw->p2p_dev_vif && !aicwf_vif->up) {
+#endif
+		if (!aicwf_hw->is_p2p_alive) {
+			error = aicwf_send_add_if(aicwf_hw, aicwf_vif->wdev.address,
+						  // wdev->netdev->dev_addr,
+						  AICWF_VIF_TYPE(aicwf_vif),
+						  false, &add_if_cfm);
+			if (error)
+				return -EIO;
+
+			if (add_if_cfm.status != 0)
+				return -EIO;
+
+			/* Save the index retrieved from LMAC */
+			spin_lock_bh(&aicwf_hw->cb_lock);
+			aicwf_vif->vif_index = add_if_cfm.inst_nbr;
+			aicwf_vif->up = true;
+			aicwf_hw->vif_started++;
+			aicwf_hw->vif_table[add_if_cfm.inst_nbr] = aicwf_vif;
+			spin_unlock_bh(&aicwf_hw->cb_lock);
+			aicwf_hw->is_p2p_alive = 1;
+#ifndef CONFIG_AIC8800_USE_P2P0
+			mod_timer(&aicwf_hw->p2p_alive_timer,
+				  jiffies + msecs_to_jiffies(1000));
+			atomic_set(&aicwf_hw->p2p_alive_timer_count, 0);
+#endif
+		} else {
+#ifndef CONFIG_AIC8800_USE_P2P0
+			mod_timer(&aicwf_hw->p2p_alive_timer,
+				  jiffies + msecs_to_jiffies(1000));
+			atomic_set(&aicwf_hw->p2p_alive_timer_count, 0);
+#endif
+		}
+	}
+	/* Allocate a temporary RoC element */
+	roc_elem = kmalloc_obj(*roc_elem, GFP_KERNEL);
+
+	/* Verify that element has well been allocated */
+	if (!roc_elem)
+		return -ENOMEM;
+
+	/* Initialize the RoC information element */
+	roc_elem->wdev = wdev;
+	roc_elem->chan = chan;
+	roc_elem->duration = duration;
+	roc_elem->cookie = cookie;
+	roc_elem->mgmt_roc = mgmt_roc_flag;
+	roc_elem->on_chan = false;
+
+	/* Initialize the OFFCHAN TX queue to allow off-channel transmissions */
+	aicwf_txq_offchan_init(aicwf_vif);
+
+	/* Forward the information to the FMAC */
+	aicwf_hw->roc_elem = roc_elem;
+	error = aicwf_send_roc(aicwf_hw, aicwf_vif, chan, duration, &roc_cfm);
+
+	/* If no error, keep all the information for handling of end of procedure */
+	if (error == 0) {
+		if (roc_cfm.status) {
+			// failed to roc
+			aicwf_hw->roc_elem = NULL;
+			kfree(roc_elem);
+			aicwf_txq_offchan_deinit(aicwf_vif);
+			return -EBUSY;
+		}
+	} else {
+		/* Free the allocated element */
+		aicwf_hw->roc_elem = NULL;
+		kfree(roc_elem);
+		aicwf_txq_offchan_deinit(aicwf_vif);
+	}
+
+	return error;
+}
+
+static int aicwf_cfg80211_remain_on_channel(struct wiphy *wiphy,
+					    struct wireless_dev *wdev,
+					    struct ieee80211_channel *chan,
+					    unsigned int duration, u64 cookie,
+					    const u8 *rx_addr)
+{
+	return aicwf_cfg80211_remain_on_channel_(wiphy, wdev, chan,
+						duration, cookie, false);
+}
+
+/*
+ * @cancel_remain_on_channel: Cancel an on-going remain-on-channel operation.
+ *	This allows the operation to be terminated prior to timeout based on
+ *	the duration value.
+ */
+static int aicwf_cfg80211_cancel_remain_on_channel(struct wiphy *wiphy,
+						   struct wireless_dev *wdev,
+						   u64 cookie)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	struct aicwf_vif *aicwf_vif =
+		container_of(wdev, struct aicwf_vif, wdev); // netdev_priv(wdev->netdev);
+#endif
+
+	/* For debug purpose (use ftrace kernel option) */
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_cancel_roc(aicwf_vif->vif_index);
+#endif
+	/* Check if a RoC procedure is pending */
+	if (!aicwf_hw->roc_elem)
+		return 0;
+
+	/* Forward the information to the FMAC */
+	return aicwf_send_cancel_roc(aicwf_hw);
+}
+
+static inline bool IS_2P4GHZ(int freq)
+{
+	return (freq >= 2412 && freq <= 2484);
+}
+
+static inline bool IS_5GHZ(int freq)
+{
+	return (freq >= 4000 && freq <= 5895);
+}
+
+#define DEFAULT_NOISE_FLOOR_2GHZ (-89)
+#define DEFAULT_NOISE_FLOOR_5GHZ (-92)
+
+/*
+ * @dump_survey: get site survey information.
+ */
+static int aicwf_cfg80211_dump_survey(struct wiphy *wiphy,
+				      struct net_device *netdev, int idx,
+				      struct survey_info *info)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct ieee80211_supported_band *sband;
+	struct aicwf_survey_info *aicwf_survey;
+
+	if (idx >= ARRAY_SIZE(aicwf_hw->survey))
+		return -ENOENT;
+
+	aicwf_survey = &aicwf_hw->survey[idx];
+
+	// Check if provided index matches with a supported 2.4GHz channel
+	sband = wiphy->bands[NL80211_BAND_2GHZ];
+	if (sband && idx >= sband->n_channels) {
+		idx -= sband->n_channels;
+		sband = NULL;
+	}
+
+	if (aicwf_hw->band_5g_support) {
+		if (!sband) {
+			// Check if provided index matches with a supported 5GHz channel
+			sband = wiphy->bands[NL80211_BAND_5GHZ];
+
+			if (!sband || idx >= sband->n_channels)
+				return -ENOENT;
+		}
+	} else {
+		if (!sband || idx >= sband->n_channels)
+			return -ENOENT;
+	}
+
+	// Fill the survey
+	info->channel = &sband->channels[idx];
+	info->filled = aicwf_survey->filled;
+
+	if (aicwf_survey->filled != 0) {
+		info->time = (u64)aicwf_survey->chan_time_ms;
+		info->time_busy = (u64)aicwf_survey->chan_time_busy_ms;
+		// info->noise = aicwf_survey->noise_dbm;
+		info->noise =
+			((IS_2P4GHZ(info->channel->center_freq)) ? DEFAULT_NOISE_FLOOR_2GHZ
+			 : (IS_5GHZ(info->channel->center_freq))
+				 ? DEFAULT_NOISE_FLOOR_5GHZ
+				 : DEFAULT_NOISE_FLOOR_5GHZ);
+
+		// Set the survey report as not used
+		if (info->noise == 0)
+			aicwf_survey->filled = 0;
+		else
+			aicwf_survey->filled |= SURVEY_INFO_NOISE_DBM;
+	}
+
+	return 0;
+}
+
+/*
+ * @get_channel: Get the current operating channel for the virtual interface.
+ *	For monitor interfaces, it should return %NULL unless there's a single
+ *	current monitoring channel.
+ */
+static int aicwf_cfg80211_get_channel(struct wiphy *wiphy,
+				      struct wireless_dev *wdev,
+				      unsigned int link_id,
+				      struct cfg80211_chan_def *chandef)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif = container_of(wdev, struct aicwf_vif, wdev);
+	struct aicwf_chanctx *ctxt;
+
+	if (!aicwf_vif->up)
+		return -ENODATA;
+
+	if (aicwf_vif->vif_index == aicwf_hw->monitor_vif)
+		// retrieve channel from firmware
+		aicwf_cfg80211_set_monitor_channel(wiphy, aicwf_vif->ndev, NULL);
+
+	// Check if channel context is valid
+	if (!aicwf_chanctx_valid(aicwf_hw, aicwf_vif->ch_index))
+		return -ENODATA;
+
+	ctxt = &aicwf_hw->chanctx_table[aicwf_vif->ch_index];
+	*chandef = ctxt->chan_def;
+	return 0;
+}
+
+/*
+ * @mgmt_tx: Transmit a management frame.
+ */
+
+static int aicwf_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
+				  struct cfg80211_mgmt_tx_params *params,
+				  u64 cookie)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif =
+		container_of(wdev, struct aicwf_vif, wdev); // netdev_priv(wdev->netdev);
+	struct aicwf_sta *aicwf_sta;
+	struct ieee80211_channel *channel = params->chan;
+	const u8 *buf = params->buf;
+	struct ieee80211_mgmt *mgmt = (void *)buf;
+	bool ap = false;
+	bool offchan = false;
+
+	/* Check if provided VIF is an AP or a STA one */
+	switch (AICWF_VIF_TYPE(aicwf_vif)) {
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	case NL80211_IFTYPE_AP_VLAN:
+		aicwf_vif = aicwf_vif->ap_vlan.master;
+		fallthrough;
+	case NL80211_IFTYPE_AP:
+	case NL80211_IFTYPE_P2P_GO:
+	case NL80211_IFTYPE_MESH_POINT:
+		ap = true;
+		break;
+	case NL80211_IFTYPE_P2P_CLIENT:
+#endif
+	case NL80211_IFTYPE_STATION:
+	default:
+		break;
+	}
+
+	/* Get STA on which management frame has to be sent */
+	aicwf_sta =
+		aicwf_retrieve_sta(aicwf_hw, aicwf_vif, mgmt->da, mgmt->frame_control, ap);
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_mgmt_tx((channel) ? channel->center_freq : 0, aicwf_vif->vif_index,
+		      (aicwf_sta) ? aicwf_sta->sta_idx : 0xFF, mgmt);
+#endif
+	if (ap || aicwf_sta)
+		goto send_frame;
+
+	/* Not an AP interface sending frame to unknown STA:
+	 * This is allowed for external authetication
+	 */
+	if (aicwf_vif->sta.external_auth && ieee80211_is_auth(mgmt->frame_control))
+		goto send_frame;
+
+	/* Otherwise ROC is needed */
+	if (!channel) {
+		dev_dbg(&wiphy->dev, "mgmt_tx fail since channel\n");
+		return -EINVAL;
+	}
+
+	/* Check that a RoC is already pending */
+	if (aicwf_hw->roc_elem) {
+		/* Get VIF used for current ROC */
+		struct aicwf_vif *aicwf_roc_vif =
+			container_of(aicwf_hw->roc_elem->wdev, struct aicwf_vif,
+				     wdev); // netdev_priv(aicwf_hw->roc_elem->wdev->netdev);
+
+		/* Check if RoC channel is the same than the required one */
+		if (aicwf_hw->roc_elem->chan->center_freq != channel->center_freq ||
+		    aicwf_vif->vif_index != aicwf_roc_vif->vif_index) {
+			dev_dbg(&wiphy->dev, "mgmt rx chan invalid: %d, %d",
+				aicwf_hw->roc_elem->chan->center_freq, channel->center_freq);
+			return -EINVAL;
+		}
+	} else {
+		int error;
+
+		dev_dbg(&wiphy->dev, "mgmt rx remain on chan\n");
+
+		/* Start a ROC procedure for 30ms */
+		error = aicwf_cfg80211_remain_on_channel_(wiphy, wdev, channel, 30,
+							  cookie, true);
+		if (error) {
+			dev_dbg(&wiphy->dev, "mgmt rx chan err\n");
+			return error;
+		}
+	}
+	offchan = true;
+
+send_frame:
+	return aicwf_start_mgmt_xmit(aicwf_vif, aicwf_sta, params, offchan, cookie);
+}
+
+/*
+ * @start_radar_detection: Start radar detection in the driver.
+ */
+static int __maybe_unused aicwf_cfg80211_start_radar_detection(struct wiphy *wiphy,
+							       struct net_device *dev,
+							       struct cfg80211_chan_def *chandef,
+							       u32 cac_time_ms, int link_id)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct apm_start_cac_cfm cfm;
+
+	aicwf_radar_start_cac(&aicwf_hw->radar, cac_time_ms, aicwf_vif);
+	aicwf_send_apm_start_cac_req(aicwf_hw, aicwf_vif, chandef, &cfm);
+
+	if (cfm.status == CO_OK) {
+		spin_lock_bh(&aicwf_hw->cb_lock);
+		aicwf_chanctx_link(aicwf_vif, cfm.ch_idx, chandef);
+		if (aicwf_hw->cur_chanctx == aicwf_vif->ch_index)
+			aicwf_radar_detection_enable(&aicwf_hw->radar,
+						     AICWF_RADAR_DETECT_REPORT,
+						     AICWF_RADAR_RIU);
+		spin_unlock_bh(&aicwf_hw->cb_lock);
+	} else {
+		return -EIO;
+	}
+	return 0;
+}
+
+/*
+ * @update_ft_ies: Provide updated Fast BSS Transition information to the
+ *	driver. If the SME is in the driver/firmware, this information can be
+ *	used in building Authentication and Reassociation Request frames.
+ */
+static int aicwf_cfg80211_update_ft_ies(struct wiphy *wiphy, struct net_device *dev,
+					struct cfg80211_update_ft_ies_params *ftie)
+{
+	return 0;
+}
+
+/*
+ * @set_cqm_rssi_config: Configure connection quality monitor RSSI threshold.
+ */
+static int aicwf_cfg80211_set_cqm_rssi_config(struct wiphy *wiphy,
+					      struct net_device *dev,
+					      s32 rssi_thold,
+					      u32 rssi_hyst)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+
+	return aicwf_send_cfg_rssi_req(aicwf_hw, aicwf_vif->vif_index, rssi_thold,
+				      rssi_hyst);
+}
+
+/*
+ *
+ * @channel_switch: initiate channel-switch procedure (with CSA). Driver is
+ *	responsible for veryfing if the switch is possible. Since this is
+ *	inherently tricky driver may decide to disconnect an interface later
+ *	with cfg80211_stop_iface(). This doesn't mean driver can accept
+ *	everything. It should do it's best to verify requests and reject them
+ *	as soon as possible.
+ */
+static int __maybe_unused aicwf_cfg80211_channel_switch(struct wiphy *wiphy,
+							struct net_device *dev,
+							struct cfg80211_csa_settings *params)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *vif = netdev_priv(dev);
+	struct aicwf_bcn *bcn, *bcn_after;
+	struct aicwf_csa *csa;
+	u16 csa_oft[BCN_MAX_CSA_CPT];
+	u8 *buf;
+	int i, error = 0;
+
+	if (vif->ap.csa)
+		return -EBUSY;
+
+	if (params->n_counter_offsets_beacon > BCN_MAX_CSA_CPT)
+		return -EINVAL;
+
+	/* Build the new beacon with CSA IE */
+	bcn = &vif->ap.bcn;
+	buf = aicwf_build_bcn(bcn, &params->beacon_csa);
+	if (!buf)
+		return -ENOMEM;
+
+	memset(csa_oft, 0, sizeof(csa_oft));
+	for (i = 0; i < params->n_counter_offsets_beacon; i++)
+		csa_oft[i] =
+			params->counter_offsets_beacon[i] + bcn->head_len + bcn->tim_len;
+
+	/* If count is set to 0 (i.e anytime after this beacon) force it to 2 */
+	if (params->count == 0) {
+		params->count = 2;
+		for (i = 0; i < params->n_counter_offsets_beacon; i++)
+			buf[csa_oft[i]] = 2;
+	}
+
+	error = aicwf_send_bcn(aicwf_hw, buf, vif->vif_index, bcn->len);
+	if (error)
+		goto end;
+
+	/* Build the beacon to use after CSA. It will only be sent to fw once
+	 * CSA is over, but do it before sending the beacon as it must be ready
+	 * when CSA is finished.
+	 */
+	csa = kzalloc_obj(*csa, GFP_KERNEL);
+	if (!csa) {
+		error = -ENOMEM;
+		goto end;
+	}
+
+	bcn_after = &csa->bcn;
+	buf = aicwf_build_bcn(bcn_after, &params->beacon_after);
+	if (!buf) {
+		error = -ENOMEM;
+		aicwf_del_csa(vif);
+		goto end;
+	}
+
+	error = aicwf_send_bcn(aicwf_hw, buf, vif->vif_index, bcn_after->len);
+	if (error)
+		goto end;
+
+	vif->ap.csa = csa;
+	csa->vif = vif;
+	csa->chandef = params->chandef;
+
+	/* Send new Beacon. FW will extract channel and count from the beacon */
+	error = aicwf_send_bcn_change(aicwf_hw, vif->vif_index, 0, bcn->len,
+				      bcn->head_len, bcn->tim_len, csa_oft);
+
+	if (error) {
+		aicwf_del_csa(vif);
+		goto end;
+	} else {
+		INIT_WORK(&csa->work, aicwf_csa_finish);
+		cfg80211_ch_switch_started_notify(dev, &csa->chandef, 0, params->count,
+						  false);
+	}
+end:
+	return error;
+}
+
+/*
+ * @tdls_oper: execute TDLS operation
+ */
+static int __maybe_unused aicwf_cfg80211_tdls_oper(struct wiphy *wiphy,
+						   struct net_device *dev,
+						   const u8 *peer, enum nl80211_tdls_operation oper)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	int error;
+
+	if (oper != NL80211_TDLS_DISABLE_LINK)
+		return 0;
+
+	if (!aicwf_vif->sta.tdls_sta) {
+		dev_dbg(&wiphy->dev, "tdls station %pM does not exist\n", peer);
+		return -ENOLINK;
+	}
+
+	if (memcmp(aicwf_vif->sta.tdls_sta->mac_addr, peer, ETH_ALEN) == 0) {
+		/* Disable Channel Switch */
+		if (!aicwf_send_tdls_cancel_chan_switch_req(aicwf_hw, aicwf_vif,
+							    aicwf_vif->sta.tdls_sta, NULL))
+			aicwf_vif->sta.tdls_sta->tdls.chsw_en = false;
+
+		netdev_info(dev, "del TDLS sta %d %pM\n",
+			    aicwf_vif->sta.tdls_sta->sta_idx,
+			    aicwf_vif->sta.tdls_sta->mac_addr);
+		/* Ensure that we won't process PS change ind */
+		spin_lock_bh(&aicwf_hw->cb_lock);
+		aicwf_vif->sta.tdls_sta->ps.active = false;
+		aicwf_vif->sta.tdls_sta->valid = false;
+		spin_unlock_bh(&aicwf_hw->cb_lock);
+		aicwf_txq_sta_deinit(aicwf_hw, aicwf_vif->sta.tdls_sta);
+		error = aicwf_send_me_sta_del(aicwf_hw,
+					      aicwf_vif->sta.tdls_sta->sta_idx,
+					      true);
+		if (error != 0 && error != -EPIPE)
+			return error;
+
+#ifdef CONFIG_AICWF_BFMER
+		// Disable Beamformer if supported
+		aicwf_bfmer_report_del(aicwf_hw, aicwf_vif->sta.tdls_sta);
+		aicwf_mu_group_sta_del(aicwf_hw, aicwf_vif->sta.tdls_sta);
+#endif /* CONFIG_AICWF_BFMER */
+
+		/* Set TDLS not active */
+		aicwf_vif->sta.tdls_sta->tdls.active = false;
+		// Remove TDLS station
+		aicwf_vif->tdls_status = TDLS_LINK_IDLE;
+		aicwf_vif->sta.tdls_sta = NULL;
+	}
+
+	return 0;
+}
+
+/*
+ * @tdls_channel_switch: enable TDLS channel switch
+ */
+static int __maybe_unused aicwf_cfg80211_tdls_channel_switch(struct wiphy *wiphy,
+							     struct net_device *dev,
+							     const u8 *addr, u8 oper_class,
+							     struct cfg80211_chan_def *chandef)
+{
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_sta *aicwf_sta = aicwf_vif->sta.tdls_sta;
+	struct tdls_chan_switch_cfm cfm;
+	int error;
+
+	if (!aicwf_sta || memcmp(addr, aicwf_sta->mac_addr, ETH_ALEN)) {
+		dev_dbg(&wiphy->dev, "tdls station %pM doesn't exist\n", addr);
+		return -ENOLINK;
+	}
+
+	if (!aicwf_sta->tdls.chsw_allowed) {
+		dev_dbg(&wiphy->dev, "tdls station %pM does not support TDLS channel switch\n", addr);
+		return -EOPNOTSUPP;
+	}
+
+	error = aicwf_send_tdls_chan_switch_req(aicwf_hw, aicwf_vif, aicwf_sta,
+						aicwf_sta->tdls.initiator, oper_class,
+						chandef, &cfm);
+	if (error)
+		return error;
+
+	if (!cfm.status) {
+		aicwf_sta->tdls.chsw_en = true;
+		return 0;
+	}
+	dev_dbg(&wiphy->dev, "tdls channel switch already enabled and only one is supported\n");
+	return -EALREADY;
+}
+
+/*
+ * @tdls_cancel_channel_switch: disable TDLS channel switch
+ */
+static void __maybe_unused
+aicwf_cfg80211_tdls_cancel_channel_switch(struct wiphy *wiphy,
+					  struct net_device *dev,
+					  const u8 *addr)
+{
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_sta *aicwf_sta = aicwf_vif->sta.tdls_sta;
+	struct tdls_cancel_chan_switch_cfm cfm;
+
+	if (!aicwf_sta)
+		return;
+
+	if (!aicwf_send_tdls_cancel_chan_switch_req(aicwf_hw, aicwf_vif, aicwf_sta,
+						    &cfm))
+		aicwf_sta->tdls.chsw_en = false;
+}
+
+/*
+ * @change_bss: Modify parameters for a given BSS (mainly for AP mode).
+ */
+static int __maybe_unused aicwf_cfg80211_change_bss(struct wiphy *wiphy,
+						    struct net_device *dev,
+						    struct bss_parameters *params)
+{
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	int res = -EOPNOTSUPP;
+
+	if ((AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_AP ||
+	     AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_P2P_GO) &&
+	    params->ap_isolate > -1) {
+		if (params->ap_isolate)
+			aicwf_vif->ap.flags |= AICWF_AP_ISOLATE;
+		else
+			aicwf_vif->ap.flags &= ~AICWF_AP_ISOLATE;
+		res = 0;
+	}
+	return res;
+}
+
+static void aicwf_convert_sta_flags(u32 flags, struct station_info *sinfo)
+{
+	struct nl80211_sta_flag_update *sfu;
+
+	sinfo->filled |= BIT(NL80211_STA_INFO_STA_FLAGS);
+	sfu = &sinfo->sta_flags;
+	sfu->mask = BIT(NL80211_STA_FLAG_WME) | BIT(NL80211_STA_FLAG_AUTHORIZED) |
+		    BIT(NL80211_STA_FLAG_ASSOCIATED) |
+		    BIT(NL80211_STA_FLAG_AUTHENTICATED);
+
+	if (flags == (u32)AICWF_DRV_STATUS_CONNECTED) {
+		sfu->set |= (BIT(NL80211_STA_FLAG_WME) | BIT(NL80211_STA_FLAG_AUTHORIZED) |
+			     BIT(NL80211_STA_FLAG_ASSOCIATED) |
+			     BIT(NL80211_STA_FLAG_AUTHENTICATED));
+	}
+	sfu->mask |= BIT(NL80211_STA_FLAG_TDLS_PEER);
+	sfu->set &= ~BIT(NL80211_STA_FLAG_TDLS_PEER);
+}
+
+static void aicwf_fill_bss_param(struct station_info *sinfo,
+				 struct aicwf_vif *vif)
+{
+	u16 capability = 0;
+
+	sinfo->filled |= BIT(NL80211_STA_INFO_BSS_PARAM);
+	sinfo->bss_param.beacon_interval =
+		(vif->sta.b_interval > 0) ? vif->sta.b_interval : 100;
+	sinfo->bss_param.dtim_period =
+		(vif->sta.dtim_peroid > 0) ? vif->sta.dtim_peroid : 1;
+
+	capability = vif->sta.capability;
+	if (capability & WLAN_CAPABILITY_SHORT_PREAMBLE)
+		sinfo->bss_param.flags |= BSS_PARAM_FLAGS_SHORT_PREAMBLE;
+	if (capability & WLAN_CAPABILITY_SHORT_SLOT_TIME)
+		sinfo->bss_param.flags |= BSS_PARAM_FLAGS_SHORT_SLOT_TIME;
+}
+
+static int aicwf_fill_station_info(struct aicwf_sta *sta, struct aicwf_vif *vif,
+				   struct station_info *sinfo)
+{
+	struct aicwf_sta_stats *stats = &sta->stats;
+	struct rx_vector_1 *rx_vect1 = &stats->last_rx.rx_vect1;
+	union aicwf_rate_ctrl_info *rate_info;
+	struct mm_get_sta_info_cfm cfm;
+
+	aicwf_send_get_sta_info_req(vif->aicwf_hw, sta->sta_idx, &cfm);
+	sinfo->tx_failed = cfm.txfailed;
+	rate_info = (union aicwf_rate_ctrl_info *)&cfm.rate_info;
+
+	struct aicwf_hw *aicwf_hw = vif->aicwf_hw;
+
+	if (aicwf_hw)
+		dev_dbg(aicwf_hw->dev,
+			"modTx%d:%d TxIndex:%d ModRx%d:%d RxHTIndex:%d RxVHTIndex:%d RxHEIndex:%d RSSI:%d\n",
+			rate_info->bw_tx, rate_info->format_mod_tx,
+			rate_info->mcs_index_tx, rx_vect1->ch_bw, rx_vect1->format_mod,
+			rx_vect1->ht.mcs, rx_vect1->vht.mcs, rx_vect1->he.mcs,
+			(s8)cfm.rssi);
+
+	switch (rate_info->format_mod_tx) {
+	case FORMATMOD_NON_HT:
+	case FORMATMOD_NON_HT_DUP_OFDM:
+		sinfo->txrate.flags = 0;
+		sinfo->txrate.legacy = tx_legrates_lut_rate[rate_info->mcs_index_tx];
+		break;
+	case FORMATMOD_HT_MF:
+	case FORMATMOD_HT_GF:
+		sinfo->txrate.flags = RATE_INFO_FLAGS_MCS;
+		sinfo->txrate.mcs = rate_info->mcs_index_tx;
+		break;
+	case FORMATMOD_VHT:
+		sinfo->txrate.flags = RATE_INFO_FLAGS_VHT_MCS;
+		sinfo->txrate.mcs = rate_info->mcs_index_tx;
+		break;
+	case FORMATMOD_HE_MU:
+	case FORMATMOD_HE_SU:
+	case FORMATMOD_HE_ER:
+		sinfo->txrate.flags = RATE_INFO_FLAGS_HE_MCS;
+		sinfo->txrate.mcs = rate_info->mcs_index_tx;
+		break;
+	default:
+		return -EINVAL;
+	}
+	switch (rate_info->bw_tx) {
+	case PHY_CHNL_BW_20:
+		sinfo->txrate.bw = RATE_INFO_BW_20;
+		break;
+	case PHY_CHNL_BW_40:
+		sinfo->txrate.bw = RATE_INFO_BW_40;
+		break;
+	case PHY_CHNL_BW_80:
+		sinfo->txrate.bw = RATE_INFO_BW_80;
+		break;
+	case PHY_CHNL_BW_160:
+		sinfo->txrate.bw = RATE_INFO_BW_160;
+		break;
+	default:
+		sinfo->txrate.bw = RATE_INFO_BW_HE_RU;
+		break;
+	}
+
+	sinfo->txrate.nss = 1;
+	sinfo->filled |=
+		(BIT(NL80211_STA_INFO_TX_BITRATE) | BIT(NL80211_STA_INFO_TX_FAILED));
+
+	if (AICWF_VIF_TYPE(vif) == NL80211_IFTYPE_STATION ||
+	    AICWF_VIF_TYPE(vif) == NL80211_IFTYPE_P2P_CLIENT) {
+		sinfo->connected_time =
+			jiffies_to_msecs(jiffies - vif->sta.link_time) / 1000;
+		sinfo->filled |= BIT(NL80211_STA_INFO_CONNECTED_TIME);
+	}
+
+	sinfo->inactive_time =
+		jiffies_to_msecs(jiffies - vif->aicwf_hw->stats.last_tx);
+	sinfo->rx_bytes = vif->net_stats.rx_bytes;
+	sinfo->tx_bytes = vif->net_stats.tx_bytes;
+	sinfo->tx_packets = vif->net_stats.tx_packets;
+	sinfo->rx_packets = vif->net_stats.rx_packets;
+	sinfo->signal = (s8)cfm.rssi;
+	sinfo->rxrate.nss = 1;
+
+	switch (rx_vect1->ch_bw) {
+	case PHY_CHNL_BW_20:
+		sinfo->rxrate.bw = RATE_INFO_BW_20;
+		break;
+	case PHY_CHNL_BW_40:
+		sinfo->rxrate.bw = RATE_INFO_BW_40;
+		break;
+	case PHY_CHNL_BW_80:
+		sinfo->rxrate.bw = RATE_INFO_BW_80;
+		break;
+	case PHY_CHNL_BW_160:
+		sinfo->rxrate.bw = RATE_INFO_BW_160;
+		break;
+	default:
+		sinfo->rxrate.bw = RATE_INFO_BW_HE_RU;
+		break;
+	}
+
+	switch (rx_vect1->format_mod) {
+	case FORMATMOD_NON_HT:
+	case FORMATMOD_NON_HT_DUP_OFDM:
+		sinfo->rxrate.flags = 0;
+		sinfo->rxrate.legacy = legrates_lut[rx_vect1->leg_rate].rate;
+		break;
+	case FORMATMOD_HT_MF:
+	case FORMATMOD_HT_GF:
+		sinfo->rxrate.flags = RATE_INFO_FLAGS_MCS;
+		if (rx_vect1->ht.short_gi)
+			sinfo->rxrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
+		sinfo->rxrate.mcs = rx_vect1->ht.mcs;
+		break;
+	case FORMATMOD_VHT:
+		sinfo->rxrate.flags = RATE_INFO_FLAGS_VHT_MCS;
+		if (rx_vect1->vht.short_gi)
+			sinfo->rxrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
+		sinfo->rxrate.mcs = rx_vect1->vht.mcs;
+		break;
+	case FORMATMOD_HE_MU:
+		sinfo->rxrate.he_ru_alloc = rx_vect1->he.ru_size;
+		fallthrough;
+	case FORMATMOD_HE_SU:
+	case FORMATMOD_HE_ER:
+		sinfo->rxrate.flags = RATE_INFO_FLAGS_HE_MCS;
+		sinfo->rxrate.mcs = rx_vect1->he.mcs;
+		sinfo->rxrate.he_gi = rx_vect1->he.gi_type;
+		sinfo->rxrate.he_dcm = rx_vect1->he.dcm;
+		break;
+	default:
+		return -EINVAL;
+	}
+	sinfo->filled |=
+		(BIT(NL80211_STA_INFO_INACTIVE_TIME) |
+		 BIT(NL80211_STA_INFO_RX_BYTES64) | BIT(NL80211_STA_INFO_TX_BYTES64) |
+		 BIT(NL80211_STA_INFO_RX_PACKETS) | BIT(NL80211_STA_INFO_TX_PACKETS) |
+		 BIT(NL80211_STA_INFO_SIGNAL) | BIT(NL80211_STA_INFO_RX_BITRATE));
+	return 0;
+}
+
+/*
+ * @get_station: get station information for the station identified by @mac
+ */
+static int aicwf_cfg80211_get_station(struct wiphy *wiphy,
+				      struct wireless_dev *wdev,
+				      const u8 *mac,
+				      struct station_info *sinfo)
+{
+	struct net_device *dev = wdev->netdev;
+	struct aicwf_vif *vif = netdev_priv(dev);
+	struct aicwf_sta *sta = NULL;
+
+	if (AICWF_VIF_TYPE(vif) == NL80211_IFTYPE_MONITOR) {
+		return -EINVAL;
+	} else if (AICWF_VIF_TYPE(vif) == NL80211_IFTYPE_STATION ||
+		 AICWF_VIF_TYPE(vif) == NL80211_IFTYPE_P2P_CLIENT) {
+		if (vif->sta.ap && ether_addr_equal(vif->sta.ap->mac_addr, mac))
+			sta = vif->sta.ap;
+		if (sta) {
+			aicwf_convert_sta_flags((u32)atomic_read(&vif->drv_conn_state),
+						sinfo);
+			aicwf_fill_bss_param(sinfo, vif);
+			return aicwf_fill_station_info(sta, vif, sinfo);
+		}
+	} else {
+		struct aicwf_sta *sta_iter;
+
+		spin_lock_bh(&vif->aicwf_hw->cb_lock);
+		list_for_each_entry(sta_iter, &vif->ap.sta_list, list) {
+			if (sta_iter->valid && ether_addr_equal(sta_iter->mac_addr, mac)) {
+				sta = sta_iter;
+				break;
+			}
+		}
+		spin_unlock_bh(&vif->aicwf_hw->cb_lock);
+		if (sta)
+			return aicwf_fill_station_info(sta, vif, sinfo);
+	}
+
+	return -ENOENT;
+}
+
+/*
+ * @dump_station: dump station callback -- resume dump at index @idx
+ */
+static int aicwf_cfg80211_dump_station(struct wiphy *wiphy,
+				       struct wireless_dev *wdev, int idx, u8 *mac,
+				       struct station_info *sinfo)
+{
+	struct net_device *dev = wdev->netdev;
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_sta *sta_iter, *sta = NULL;
+	struct mesh_peer_info_cfm peer_info_cfm;
+	struct cfg80211_bss *bss = NULL;
+	const struct cfg80211_bss_ies *ies;
+	const u8 *tim = NULL;
+	int i = 0;
+
+	if (AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_STATION ||
+	    AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_P2P_CLIENT) {
+		if (idx == 0) {
+			bss = cfg80211_get_bss(wiphy, NULL, aicwf_vif->sta.bssid,
+					       aicwf_vif->sta.ssid, aicwf_vif->sta.ssid_len,
+					       dev->ieee80211_ptr->conn_bss_type,
+					       IEEE80211_PRIVACY_ANY);
+			if (bss) {
+				aicwf_vif->sta.capability = bss->capability;
+				aicwf_vif->sta.b_interval = bss->beacon_interval;
+				rcu_read_lock();
+				ies = rcu_dereference(bss->beacon_ies);
+				if (ies && ies->len > 0) {
+					tim = cfg80211_find_ie(WLAN_EID_TIM,
+							       ies->data, ies->len);
+					if (tim && tim[1] >= 2)
+						aicwf_vif->sta.dtim_peroid = *(tim + 3);
+				}
+				rcu_read_unlock();
+				cfg80211_put_bss(wiphy, bss);
+			}
+			memcpy(mac, aicwf_vif->sta.bssid, ETH_ALEN);
+			return aicwf_cfg80211_get_station(wiphy, wdev, mac, sinfo);
+		}
+		return -ENOENT;
+	}
+
+	if (AICWF_VIF_TYPE(aicwf_vif) != NL80211_IFTYPE_MESH_POINT)
+		return -EOPNOTSUPP;
+
+	list_for_each_entry(sta_iter, &aicwf_vif->ap.sta_list, list) {
+		if (i < idx) {
+			i++;
+			continue;
+		}
+		sta = sta_iter;
+		break;
+	}
+
+	if (!sta)
+		return -ENOENT;
+
+	/* Forward the information to the UMAC */
+	if (aicwf_send_mesh_peer_info_req(aicwf_hw, aicwf_vif, sta->sta_idx,
+					  &peer_info_cfm))
+		return -ENOMEM;
+
+	/* Copy peer MAC address */
+	memcpy(mac, &sta->mac_addr, ETH_ALEN);
+
+	/* Fill station information */
+	sinfo->llid = peer_info_cfm.local_link_id;
+	sinfo->plid = peer_info_cfm.peer_link_id;
+	sinfo->plink_state = peer_info_cfm.link_state;
+	sinfo->local_pm = peer_info_cfm.local_ps_mode;
+	sinfo->peer_pm = peer_info_cfm.peer_ps_mode;
+	sinfo->nonpeer_pm = peer_info_cfm.non_peer_ps_mode;
+	sinfo->filled =
+		(BIT(NL80211_STA_INFO_LLID) | BIT(NL80211_STA_INFO_PLID) |
+		 BIT(NL80211_STA_INFO_PLINK_STATE) | BIT(NL80211_STA_INFO_LOCAL_PM) |
+		 BIT(NL80211_STA_INFO_PEER_PM) | BIT(NL80211_STA_INFO_NONPEER_PM));
+
+	return 0;
+}
+
+/*
+ * @add_mpath: add a fixed mesh path
+ */
+static int __maybe_unused aicwf_cfg80211_add_mpath(struct wiphy *wiphy,
+						   struct net_device *dev,
+						   const u8 *dst, const u8 *next_hop)
+{
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct mesh_path_update_cfm cfm;
+
+	if (AICWF_VIF_TYPE(aicwf_vif) != NL80211_IFTYPE_MESH_POINT)
+		return -EOPNOTSUPP;
+
+	return aicwf_send_mesh_path_update_req(aicwf_hw, aicwf_vif, dst, next_hop,
+					      &cfm);
+}
+
+/*
+ * @del_mpath: delete a given mesh path
+ */
+static int __maybe_unused aicwf_cfg80211_del_mpath(struct wiphy *wiphy,
+						   struct net_device *dev,
+						   const u8 *dst)
+{
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct mesh_path_update_cfm cfm;
+
+	if (AICWF_VIF_TYPE(aicwf_vif) != NL80211_IFTYPE_MESH_POINT)
+		return -EOPNOTSUPP;
+
+	return aicwf_send_mesh_path_update_req(aicwf_hw, aicwf_vif, dst, NULL, &cfm);
+}
+
+/*
+ * @change_mpath: change a given mesh path
+ */
+static int __maybe_unused aicwf_cfg80211_change_mpath(struct wiphy *wiphy,
+						      struct net_device *dev,
+						      const u8 *dst, const u8 *next_hop)
+{
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct mesh_path_update_cfm cfm;
+
+	if (AICWF_VIF_TYPE(aicwf_vif) != NL80211_IFTYPE_MESH_POINT)
+		return -EOPNOTSUPP;
+
+	return aicwf_send_mesh_path_update_req(aicwf_hw, aicwf_vif,
+					      dst, next_hop, &cfm);
+}
+
+/*
+ * @get_mpath: get a mesh path for the given parameters
+ */
+static int __maybe_unused aicwf_cfg80211_get_mpath(struct wiphy *wiphy,
+						   struct net_device *dev,
+						   u8 *dst, u8 *next_hop,
+						   struct mpath_info *pinfo)
+{
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct aicwf_mesh_path *mesh_path = NULL;
+	struct aicwf_mesh_path *cur;
+
+	if (AICWF_VIF_TYPE(aicwf_vif) != NL80211_IFTYPE_MESH_POINT)
+		return -EOPNOTSUPP;
+
+	list_for_each_entry(cur, &aicwf_vif->ap.mpath_list, list) {
+		/*
+		 * Compare the path target address and the provided destination address
+		 */
+		if (memcmp(dst, &cur->tgt_mac_addr, ETH_ALEN))
+			continue;
+
+		mesh_path = cur;
+		break;
+	}
+
+	if (!mesh_path)
+		return -ENOENT;
+
+	/* Copy next HOP MAC address */
+	if (mesh_path->p_nhop_sta)
+		memcpy(next_hop, &mesh_path->p_nhop_sta->mac_addr, ETH_ALEN);
+
+	/* Fill path information */
+	pinfo->filled = 0;
+	pinfo->generation = aicwf_vif->ap.generation;
+
+	return 0;
+}
+
+/*
+ * @dump_mpath: dump mesh path callback -- resume dump at index @idx
+ */
+static int __maybe_unused aicwf_cfg80211_dump_mpath(struct wiphy *wiphy,
+						    struct net_device *dev,
+						    int idx, u8 *dst, u8 *next_hop,
+						    struct mpath_info *pinfo)
+{
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct aicwf_mesh_path *mesh_path = NULL;
+	struct aicwf_mesh_path *cur;
+	int i = 0;
+
+	if (AICWF_VIF_TYPE(aicwf_vif) != NL80211_IFTYPE_MESH_POINT)
+		return -EOPNOTSUPP;
+
+	list_for_each_entry(cur, &aicwf_vif->ap.mpath_list, list) {
+		if (i < idx) {
+			i++;
+			continue;
+		}
+
+		mesh_path = cur;
+		break;
+	}
+
+	if (!mesh_path)
+		return -ENOENT;
+
+	/* Copy target and next hop MAC address */
+	memcpy(dst, &mesh_path->tgt_mac_addr, ETH_ALEN);
+	if (mesh_path->p_nhop_sta)
+		memcpy(next_hop, &mesh_path->p_nhop_sta->mac_addr, ETH_ALEN);
+
+	/* Fill path information */
+	pinfo->filled = 0;
+	pinfo->generation = aicwf_vif->ap.generation;
+
+	return 0;
+}
+
+/*
+ * @get_mpp: get a mesh proxy path for the given parameters
+ */
+static int __maybe_unused aicwf_cfg80211_get_mpp(struct wiphy *wiphy,
+						 struct net_device *dev,
+						 u8 *dst, u8 *mpp, struct mpath_info *pinfo)
+{
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct aicwf_mesh_proxy *mesh_proxy = NULL;
+	struct aicwf_mesh_proxy *cur;
+
+	if (AICWF_VIF_TYPE(aicwf_vif) != NL80211_IFTYPE_MESH_POINT)
+		return -EOPNOTSUPP;
+
+	list_for_each_entry(cur, &aicwf_vif->ap.proxy_list, list) {
+		if (cur->local)
+			continue;
+
+		/*
+		 * Compare the path target address and the provided destination address
+		 */
+		if (memcmp(dst, &cur->ext_sta_addr, ETH_ALEN))
+			continue;
+
+		mesh_proxy = cur;
+		break;
+	}
+
+	if (!mesh_proxy)
+		return -ENOENT;
+
+	memcpy(mpp, &mesh_proxy->proxy_addr, ETH_ALEN);
+
+	/* Fill path information */
+	pinfo->filled = 0;
+	pinfo->generation = aicwf_vif->ap.generation;
+
+	return 0;
+}
+
+/*
+ * @dump_mpp: dump mesh proxy path callback -- resume dump at index @idx
+ */
+static int __maybe_unused aicwf_cfg80211_dump_mpp(struct wiphy *wiphy,
+						  struct net_device *dev,
+						  int idx, u8 *dst, u8 *mpp,
+						  struct mpath_info *pinfo)
+{
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct aicwf_mesh_proxy *mesh_proxy = NULL;
+	struct aicwf_mesh_proxy *cur;
+	int i = 0;
+
+	if (AICWF_VIF_TYPE(aicwf_vif) != NL80211_IFTYPE_MESH_POINT)
+		return -EOPNOTSUPP;
+
+	list_for_each_entry(cur, &aicwf_vif->ap.proxy_list, list) {
+		if (cur->local)
+			continue;
+
+		if (i < idx) {
+			i++;
+			continue;
+		}
+
+		mesh_proxy = cur;
+		break;
+	}
+
+	if (!mesh_proxy)
+		return -ENOENT;
+
+	/* Copy target MAC address */
+	memcpy(dst, &mesh_proxy->ext_sta_addr, ETH_ALEN);
+	memcpy(mpp, &mesh_proxy->proxy_addr, ETH_ALEN);
+
+	/* Fill path information */
+	pinfo->filled = 0;
+	pinfo->generation = aicwf_vif->ap.generation;
+
+	return 0;
+}
+
+/*
+ * @get_mesh_config: Get the current mesh configuration
+ */
+static int __maybe_unused aicwf_cfg80211_get_mesh_config(struct wiphy *wiphy,
+							 struct net_device *dev,
+							 struct mesh_config *conf)
+{
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+
+	if (AICWF_VIF_TYPE(aicwf_vif) != NL80211_IFTYPE_MESH_POINT)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+/*
+ * @update_mesh_config: Update mesh parameters on a running mesh.
+ */
+static int __maybe_unused aicwf_cfg80211_update_mesh_config(struct wiphy *wiphy,
+							    struct net_device *dev, u32 mask,
+							    const struct mesh_config *nconf)
+{
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct mesh_update_cfm cfm;
+	int status;
+
+	if (AICWF_VIF_TYPE(aicwf_vif) != NL80211_IFTYPE_MESH_POINT)
+		return -EOPNOTSUPP;
+
+	if (mask & CO_BIT(NL80211_MESHCONF_POWER_MODE - 1)) {
+		aicwf_vif->ap.next_mesh_pm = nconf->power_mode;
+
+		if (!list_empty(&aicwf_vif->ap.sta_list)) {
+			// If there are mesh links we don't want to update the power mode
+			// It will be updated with aicwf_update_mesh_power_mode() when the
+			// ps mode of a link is updated or when a new link is added/removed
+			mask &= ~BIT(NL80211_MESHCONF_POWER_MODE - 1);
+
+			if (!mask)
+				return 0;
+		}
+	}
+
+	status = aicwf_send_mesh_update_req(aicwf_hw, aicwf_vif, mask, nconf, &cfm);
+
+	if (!status && cfm.status != 0)
+		status = -EINVAL;
+
+	return status;
+}
+
+/*
+ * @join_mesh: join the mesh network with the specified parameters
+ * (invoked with the wireless_dev mutex held)
+ */
+static int __maybe_unused aicwf_cfg80211_join_mesh(struct wiphy *wiphy,
+						   struct net_device *dev,
+						   const struct mesh_config *conf,
+						   const struct mesh_setup *setup)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct mesh_start_cfm mesh_start_cfm;
+	int error = 0;
+	u8 txq_status = 0;
+	/* STA for BC/MC traffic */
+	struct aicwf_sta *sta;
+
+	if (AICWF_VIF_TYPE(aicwf_vif) != NL80211_IFTYPE_MESH_POINT)
+		return -EOPNOTSUPP;
+
+	/* Forward the information to the UMAC */
+	error = aicwf_send_mesh_start_req(aicwf_hw, aicwf_vif, conf, setup,
+					  &mesh_start_cfm);
+	if (error)
+		return error;
+
+	/* Check the status */
+	switch (mesh_start_cfm.status) {
+	case CO_OK:
+		aicwf_vif->ap.bcmc_index = mesh_start_cfm.bcmc_idx;
+		aicwf_vif->ap.flags = 0;
+		aicwf_vif->use_4addr = true;
+		aicwf_vif->user_mpm = setup->user_mpm;
+
+		sta = &aicwf_hw->sta_table[mesh_start_cfm.bcmc_idx];
+		sta->valid = true;
+		sta->aid = 0;
+		sta->sta_idx = mesh_start_cfm.bcmc_idx;
+		sta->ch_idx = mesh_start_cfm.ch_idx;
+		sta->vif_idx = aicwf_vif->vif_index;
+		sta->qos = true;
+		sta->acm = 0;
+		sta->ps.active = false;
+		aicwf_mu_group_sta_init(sta, NULL);
+		spin_lock_bh(&aicwf_hw->cb_lock);
+		aicwf_chanctx_link(aicwf_vif, mesh_start_cfm.ch_idx,
+				   (struct cfg80211_chan_def *)(&setup->chandef));
+
+		if (aicwf_hw->cur_chanctx != mesh_start_cfm.ch_idx)
+			txq_status = AICWF_TXQ_STOP_CHAN;
+
+		aicwf_txq_vif_init(aicwf_hw, aicwf_vif, txq_status);
+		spin_unlock_bh(&aicwf_hw->cb_lock);
+
+		netif_tx_start_all_queues(dev);
+		netif_carrier_on(dev);
+
+		/* If the AP channel is already the active, we probably skip radar
+		 * activation on MM_CHANNEL_SWITCH_IND (unless another vif use this
+		 * ctxt). In anycase retest if radar detection must be activated
+		 */
+		if (aicwf_hw->cur_chanctx == mesh_start_cfm.ch_idx)
+			aicwf_radar_detection_enable_on_cur_channel(aicwf_hw);
+
+		break;
+
+	case CO_BUSY:
+		error = -EINPROGRESS;
+		break;
+
+	default:
+		error = -EIO;
+		break;
+	}
+
+	/* Print information about the operation */
+	if (error)
+		netdev_info(dev, "failed to start MP %d\n", error);
+	else
+		netdev_info(dev, "mp started: ch=%d, bcmc_idx=%d\n", aicwf_vif->ch_index,
+			    aicwf_vif->ap.bcmc_index);
+
+	return error;
+}
+
+/*
+ * @leave_mesh: leave the current mesh network
+ * (invoked with the wireless_dev mutex held)
+ */
+static int __maybe_unused aicwf_cfg80211_leave_mesh(struct wiphy *wiphy,
+						    struct net_device *dev)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct mesh_stop_cfm mesh_stop_cfm;
+	int error = 0;
+
+	error = aicwf_send_mesh_stop_req(aicwf_hw, aicwf_vif, &mesh_stop_cfm);
+
+	if (error == 0) {
+		/* Check the status */
+		switch (mesh_stop_cfm.status) {
+		case CO_OK:
+			spin_lock_bh(&aicwf_hw->cb_lock);
+			aicwf_chanctx_unlink(aicwf_vif);
+			aicwf_radar_cancel_cac(&aicwf_hw->radar);
+			spin_unlock_bh(&aicwf_hw->cb_lock);
+			/* delete BC/MC STA */
+			aicwf_txq_vif_deinit(aicwf_hw, aicwf_vif);
+			aicwf_del_bcn(&aicwf_vif->ap.bcn);
+
+			netif_tx_stop_all_queues(dev);
+			netif_carrier_off(dev);
+
+			break;
+
+		default:
+			error = -EIO;
+			break;
+		}
+	}
+
+	if (error)
+		netdev_info(dev, "failed to stop MP\n");
+	else
+		netdev_info(dev, "mp stopped\n");
+
+	return 0;
+}
+
+static struct cfg80211_ops aicwf_cfg80211_ops = {
+	.add_virtual_intf = aicwf_cfg80211_add_iface,
+	.del_virtual_intf = aicwf_cfg80211_del_iface,
+	.change_virtual_intf = aicwf_cfg80211_change_iface,
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	.start_p2p_device = aicwf_cfgp2p_start_p2p_device,
+	.stop_p2p_device = aicwf_cfgp2p_stop_p2p_device,
+#endif
+	.scan = aicwf_cfg80211_scan,
+	.connect = aicwf_cfg80211_connect,
+	.disconnect = aicwf_cfg80211_disconnect,
+	.add_key = aicwf_cfg80211_add_key,
+	.get_key = aicwf_cfg80211_get_key,
+	.del_key = aicwf_cfg80211_del_key,
+	.set_default_key = aicwf_cfg80211_set_default_key,
+	.set_default_mgmt_key = aicwf_cfg80211_set_default_mgmt_key,
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	.add_station = aicwf_cfg80211_add_station,
+	.del_station = aicwf_cfg80211_del_station,
+#endif
+	.change_station = aicwf_cfg80211_change_station,
+	.mgmt_tx = aicwf_cfg80211_mgmt_tx,
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	.start_ap = aicwf_cfg80211_start_ap,
+	.change_beacon = aicwf_cfg80211_change_beacon,
+	.stop_ap = aicwf_cfg80211_stop_ap,
+	.set_monitor_channel = aicwf_cfg80211_set_monitor_channel,
+#endif
+	//  .mgmt_frame_register = aicwf_cfg80211_mgmt_frame_register,
+	/*
+	 * unused interface
+	 */
+	.set_wiphy_params = aicwf_cfg80211_set_wiphy_params,
+	.set_txq_params = aicwf_cfg80211_set_txq_params,
+	.set_tx_power = aicwf_cfg80211_set_tx_power,
+	//    .get_tx_power = aicwf_cfg80211_get_tx_power,
+	.get_station = aicwf_cfg80211_get_station,
+	.dump_station = aicwf_cfg80211_dump_station,
+	.remain_on_channel = aicwf_cfg80211_remain_on_channel,
+	.cancel_remain_on_channel = aicwf_cfg80211_cancel_remain_on_channel,
+	.dump_survey = aicwf_cfg80211_dump_survey,
+	.get_channel = aicwf_cfg80211_get_channel,
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	.start_radar_detection = aicwf_cfg80211_start_radar_detection,
+#endif
+	.update_ft_ies = aicwf_cfg80211_update_ft_ies,
+	.set_cqm_rssi_config = aicwf_cfg80211_set_cqm_rssi_config,
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	.channel_switch = aicwf_cfg80211_channel_switch,
+	.tdls_channel_switch = aicwf_cfg80211_tdls_channel_switch,
+	.tdls_cancel_channel_switch = aicwf_cfg80211_tdls_cancel_channel_switch,
+	//.tdls_mgmt = aicwf_cfg80211_tdls_mgmt,
+	/*
+	 * unused interface
+	 */
+	.tdls_oper = aicwf_cfg80211_tdls_oper,
+	.change_bss = aicwf_cfg80211_change_bss,
+#endif
+	.external_auth = aicwf_cfg80211_external_auth,
+#ifdef CONFIG_AIC8800_SCHED_SCAN
+	.sched_scan_start = aicwf_cfg80211_sched_scan_start,
+	.sched_scan_stop = aicwf_cfg80211_sched_scan_stop,
+#endif
+};
+
+/*********************************************************************
+ * Init/Exit functions
+ *********************************************************************/
+static void aicwf_wdev_unregister(struct aicwf_hw *aicwf_hw)
+{
+	struct aicwf_vif *aicwf_vif, *tmp;
+
+	/* RX must not queue APM work again while interfaces are being removed. */
+	disable_work_sync(&aicwf_hw->apm_staloss_work);
+	timer_shutdown_sync(&aicwf_hw->p2p_alive_timer);
+	rtnl_lock();
+	/* ndo_stop still needs TX, RX and firmware confirmations. */
+	cfg80211_shutdown_all_interfaces(aicwf_hw->wiphy);
+	wiphy_lock(aicwf_hw->wiphy);
+	aicwf_sdio_quiesce(aicwf_hw->sdiodev);
+	aicwf_platform_off(aicwf_hw, NULL);
+	aicwf_cmd_mgr_deinit(aicwf_hw->cmd_mgr);
+	list_for_each_entry_safe(aicwf_vif, tmp, &aicwf_hw->vifs, list)
+		aicwf_cfg80211_del_iface(aicwf_hw->wiphy, &aicwf_vif->wdev);
+	wiphy_unlock(aicwf_hw->wiphy);
+	rtnl_unlock();
+}
+
+static void aicwf_set_vers(struct aicwf_hw *aicwf_hw)
+{
+	u32 vers = aicwf_hw->version_cfm.version_lmac;
+
+	snprintf(aicwf_hw->wiphy->fw_version, sizeof(aicwf_hw->wiphy->fw_version),
+		 "%d.%d.%d.%d", (vers & (0xff << 24)) >> 24,
+		 (vers & (0xff << 16)) >> 16, (vers & (0xff << 8)) >> 8,
+		 (vers & (0xff << 0)) >> 0);
+}
+
+static void aicwf_reg_notifier(struct wiphy *wiphy,
+			       struct regulatory_request *request)
+{
+	struct aicwf_hw *aicwf_hw = wiphy_priv(wiphy);
+	int ret;
+
+	/* cfg80211 has already applied the rules to this wiphy's channels. */
+	aicwf_radar_set_domain(&aicwf_hw->radar, request->dfs_region);
+	ret = aicwf_send_me_chan_config_req(aicwf_hw);
+	if (ret)
+		cfg80211_shutdown_all_interfaces(wiphy);
+}
+
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+static void aicwf_enable_mesh(struct aicwf_hw *aicwf_hw)
+{
+	struct wiphy *wiphy = aicwf_hw->wiphy;
+
+	if (!aicwf_mod_params.mesh)
+		return;
+
+	aicwf_cfg80211_ops.get_station = aicwf_cfg80211_get_station;
+	aicwf_cfg80211_ops.dump_station = aicwf_cfg80211_dump_station;
+	aicwf_cfg80211_ops.add_mpath = aicwf_cfg80211_add_mpath;
+	aicwf_cfg80211_ops.del_mpath = aicwf_cfg80211_del_mpath;
+	aicwf_cfg80211_ops.change_mpath = aicwf_cfg80211_change_mpath;
+	aicwf_cfg80211_ops.get_mpath = aicwf_cfg80211_get_mpath;
+	aicwf_cfg80211_ops.dump_mpath = aicwf_cfg80211_dump_mpath;
+	aicwf_cfg80211_ops.get_mpp = aicwf_cfg80211_get_mpp;
+	aicwf_cfg80211_ops.dump_mpp = aicwf_cfg80211_dump_mpp;
+	aicwf_cfg80211_ops.get_mesh_config = aicwf_cfg80211_get_mesh_config;
+	aicwf_cfg80211_ops.update_mesh_config = aicwf_cfg80211_update_mesh_config;
+	aicwf_cfg80211_ops.join_mesh = aicwf_cfg80211_join_mesh;
+	aicwf_cfg80211_ops.leave_mesh = aicwf_cfg80211_leave_mesh;
+
+	wiphy->flags |= (WIPHY_FLAG_MESH_AUTH | WIPHY_FLAG_IBSS_RSN);
+	wiphy->features |= NL80211_FEATURE_USERSPACE_MPM;
+	wiphy->interface_modes |= BIT(NL80211_IFTYPE_MESH_POINT);
+
+	aicwf_limits[0].types |= BIT(NL80211_IFTYPE_MESH_POINT);
+	aicwf_limits_dfs[0].types |= BIT(NL80211_IFTYPE_MESH_POINT);
+}
+#endif
+
+/*
+ *
+ */
+
+int aicwf_ic_system_init(struct aicwf_hw *aicwf_hw)
+{
+	u32 mem_addr;
+	struct dbg_mem_read_cfm rd_mem_addr_cfm;
+
+	mem_addr = 0x40500000;
+
+	if (aicwf_send_dbg_mem_read_req(aicwf_hw, mem_addr, &rd_mem_addr_cfm))
+		return -1;
+
+	aicwf_hw->chip_id = (u8)(rd_mem_addr_cfm.memdata >> 16);
+
+	if (aicwf_send_dbg_mem_read_req(aicwf_hw, 0x00000020, &rd_mem_addr_cfm)) {
+		dev_err(aicwf_hw->dev, "[0x00000020] rd fail\n");
+		return -1;
+	}
+	aicwf_hw->chip_sub_id = (u8)(rd_mem_addr_cfm.memdata);
+
+	dev_dbg(aicwf_hw->dev, "chip_id=%x, chip_sub_id=%x!!\n", aicwf_hw->chip_id,
+		aicwf_hw->chip_sub_id);
+
+#ifdef CONFIG_OOB
+	int ret;
+
+	ret = aic_chip_ic_system_init(aicwf_hw, &rd_mem_addr_cfm);
+	if (ret) {
+		dev_err(aicwf_hw->dev, "aic_chip_ic_system_init fail: %d\n", ret);
+		return -1;
+	}
+#endif
+
+	if (aicwf_platform_on(aicwf_hw, NULL))
+		return -1;
+	return 0;
+}
+
+int aicwf_ic_rf_init(struct aicwf_hw *aicwf_hw)
+{
+	struct mm_set_rf_calib_cfm cfm;
+	int ret = 0;
+
+	ret = aic_chip_set_rf_config(aicwf_hw, &cfm);
+	if (ret)
+		return -1;
+	return 0;
+}
+
+/**
+ * aicwf_task - Process the TX hardware queues
+ * @data: Driver private data passed to the tasklet
+ */
+static void aicwf_task(unsigned long data)
+{
+	struct aicwf_hw *aicwf_hw = (struct aicwf_hw *)data;
+
+	spin_lock_bh(&aicwf_hw->tx_lock);
+	aicwf_hwq_process_all(aicwf_hw);
+	spin_unlock_bh(&aicwf_hw->tx_lock);
+}
+
+static void aicwf_wakeup_sources_deinit(struct aicwf_hw *aicwf_hw)
+{
+	wakeup_source_unregister(aicwf_hw->ws_tx);
+	wakeup_source_unregister(aicwf_hw->ws_rx);
+	wakeup_source_unregister(aicwf_hw->ws_irqrx);
+	wakeup_source_unregister(aicwf_hw->ws_pwrctrl);
+	wakeup_source_unregister(aicwf_hw->ws_scan);
+	aicwf_hw->ws_tx = NULL;
+	aicwf_hw->ws_rx = NULL;
+	aicwf_hw->ws_irqrx = NULL;
+	aicwf_hw->ws_pwrctrl = NULL;
+	aicwf_hw->ws_scan = NULL;
+}
+
+static int aicwf_wakeup_sources_init(struct aicwf_hw *aicwf_hw)
+{
+	if (!IS_ENABLED(CONFIG_PM_SLEEP))
+		return 0;
+
+	aicwf_hw->ws_tx = wakeup_source_register(aicwf_hw->dev, "aicwf-tx");
+	if (!aicwf_hw->ws_tx)
+		goto err;
+
+	aicwf_hw->ws_rx = wakeup_source_register(aicwf_hw->dev, "aicwf-rx");
+	if (!aicwf_hw->ws_rx)
+		goto err;
+
+	aicwf_hw->ws_irqrx = wakeup_source_register(aicwf_hw->dev, "aicwf-irq-rx");
+	if (!aicwf_hw->ws_irqrx)
+		goto err;
+
+	aicwf_hw->ws_pwrctrl = wakeup_source_register(aicwf_hw->dev, "aicwf-pwrctrl");
+	if (!aicwf_hw->ws_pwrctrl)
+		goto err;
+
+	aicwf_hw->ws_scan = wakeup_source_register(aicwf_hw->dev, "aicwf-scan");
+	if (aicwf_hw->ws_scan)
+		return 0;
+
+err:
+	aicwf_wakeup_sources_deinit(aicwf_hw);
+	return -ENOMEM;
+}
+
+int aicwf_cfg80211_init(struct aicwf_plat *aicwf_plat, void **platform_data)
+{
+	struct aicwf_hw *aicwf_hw;
+	int ret = 0;
+	struct wiphy *wiphy;
+	struct aicwf_vif *vif;
+	int i;
+	struct mm_get_fw_version_cfm fw_version = {};
+	size_t fw_version_len;
+	struct mm_get_mac_addr_cfm mac_addr_cfm __aligned(2) = {};
+	struct mm_set_stack_start_cfm set_start_cfm;
+#ifdef CONFIG_AIC8800_TEMP_COMP
+	struct mm_set_vendor_swconfig_cfm swconfig_cfm;
+#endif
+	/* create a new wiphy for use with cfg80211 */
+	pr_debug("sizeof(struct aicwf_hw):%d\n",
+		 (int)sizeof(struct aicwf_hw));
+	wiphy = wiphy_new(&aicwf_cfg80211_ops, sizeof(struct aicwf_hw));
+
+	if (!wiphy) {
+		dev_err(aicwf_platform_get_dev(aicwf_plat),
+			"failed to create new wiphy\n");
+		ret = -ENOMEM;
+		goto err_out;
+	}
+
+	aicwf_hw = wiphy_priv(wiphy);
+	aicwf_hw->wiphy = wiphy;
+	aicwf_hw->plat = aicwf_plat;
+	aicwf_hw->dev = aicwf_platform_get_dev(aicwf_plat);
+	aicwf_hw->sdiodev = aicwf_plat->sdiodev;
+	aicwf_hw->chip_ops = aic_chip_ops_select(aicwf_hw->sdiodev->chipid);
+	aicwf_defrag_init(aicwf_hw);
+	aicwf_plat->sdiodev->aicwf_hw = aicwf_hw;
+	aicwf_hw->cmd_mgr = &aicwf_plat->sdiodev->cmd_mgr;
+	aicwf_hw->mod_params = &aicwf_mod_params;
+	aicwf_plat_userconfig_init(aicwf_hw);
+	aicwf_hw->tcp_pacing_shift = 7;
+	atomic_set(&aicwf_hw->scan_activity_held, 0);
+	spin_lock_init(&aicwf_hw->scan_lock);
+
+#ifdef CONFIG_AIC8800_SCHED_SCAN
+	aicwf_hw->is_sched_scan = false;
+#endif // CONFIG_AIC8800_SCHED_SCAN
+
+	INIT_LIST_HEAD(&aicwf_hw->vifs);
+	mutex_init(&aicwf_hw->reg_lock);
+	init_completion(&aicwf_hw->chan_config_complete);
+	aicwf_hw->tx_power_limit = S8_MAX;
+	mutex_init(&aicwf_hw->mutex);
+	spin_lock_init(&aicwf_hw->tx_lock);
+	spin_lock_init(&aicwf_hw->cb_lock);
+
+	tasklet_init(&aicwf_hw->task, aicwf_task, (unsigned long)aicwf_hw);
+	timer_setup(&aicwf_hw->p2p_alive_timer, aicwf_p2p_alive_timeout, 0);
+
+	INIT_WORK(&aicwf_hw->apm_staloss_work, apm_staloss_work_process);
+	aicwf_hw->apm_staloss_wq = create_singlethread_workqueue("apm_staloss_wq");
+	if (!aicwf_hw->apm_staloss_wq) {
+		dev_err(aicwf_hw->dev, "insufficient memory to create apm_staloss workqueue\n");
+		ret = -ENOMEM;
+		goto err_cache;
+	}
+
+	ret = aicwf_wakeup_sources_init(aicwf_hw);
+	if (ret)
+		goto err_cache;
+	ret = aicwf_init_aic(aicwf_hw);
+	if (ret)
+		goto err_cache;
+
+	ret = aicwf_bus_start(aicwf_hw->sdiodev->bus_if);
+	if (ret)
+		goto err_cache;
+
+	ret = aic_chip_fw_download(aicwf_hw);
+	if (ret)
+		goto err_cache;
+	ret = aicwf_sdio_fw_started(aicwf_hw->sdiodev);
+	if (ret)
+		goto err_cache;
+
+	/* set device pointer for wiphy */
+	set_wiphy_dev(wiphy, aicwf_hw->dev);
+
+	/* Create cache to allocate sw_txhdr */
+	aicwf_hw->sw_txhdr_cache = KMEM_CACHE(aicwf_sw_txhdr, 0);
+	if (!aicwf_hw->sw_txhdr_cache) {
+		wiphy_err(wiphy, "Cannot allocate cache for sw TX header\n");
+		ret = -ENOMEM;
+		goto err_cache;
+	}
+
+	aicwf_hw->vif_started = 0;
+	aicwf_hw->monitor_vif = AICWF_INVALID_VIF;
+	aicwf_hw->adding_sta = false;
+
+	for (i = 0; i < NX_VIRT_DEV_MAX + NX_REMOTE_STA_MAX; i++)
+		aicwf_hw->avail_idx_map |= BIT(i);
+
+	aicwf_hwq_init(aicwf_hw);
+
+#ifdef CONFIG_PREALLOC_TXQ
+	aicwf_hw->txq = aicwf_prealloc_txq_alloc(&aicwf_hw->sdiodev->prealloc_txq,
+						 sizeof(struct aicwf_txq) * NX_NB_TXQ);
+	if (!aicwf_hw->txq) {
+		ret = -ENOMEM;
+		goto err_cache;
+	}
+#endif
+
+	for (i = 0; i < NX_NB_TXQ; i++)
+		aicwf_hw->txq[i].idx = TXQ_INACTIVE;
+
+	aicwf_mu_group_init(aicwf_hw);
+
+	/*
+	 * Initialize RoC element pointer to NULL, indicate that RoC can be started
+	 */
+	aicwf_hw->roc_elem = NULL;
+
+	wiphy->mgmt_stypes = aicwf_default_mgmt_stypes;
+
+	// init ic system
+	ret = aicwf_ic_system_init(aicwf_hw);
+	if (ret)
+		goto err_lmac_reqs;
+
+	ret = aic_chip_set_stack_start(aicwf_hw, &set_start_cfm);
+	if (ret)
+		goto err_lmac_reqs;
+
+	pr_debug("is 5g support = %d, vendor_info = 0x%02X\n",
+		 set_start_cfm.is_5g_support, set_start_cfm.vendor_info);
+	aicwf_hw->band_5g_support = set_start_cfm.is_5g_support;
+	aicwf_hw->vendor_info = set_start_cfm.vendor_info;
+
+	ret = aicwf_send_get_fw_version_req(aicwf_hw, &fw_version);
+	if (ret)
+		goto err_lmac_reqs;
+	if (fw_version.fw_version_len > sizeof(fw_version.fw_version)) {
+		dev_err(aicwf_hw->dev, "invalid firmware version length: %u\n",
+			fw_version.fw_version_len);
+		ret = -EBADMSG;
+		goto err_lmac_reqs;
+	}
+	dev_info(aicwf_hw->dev, "firmware version: %.*s\n",
+		 (int)fw_version.fw_version_len, fw_version.fw_version);
+	fw_version_len = min_t(size_t, fw_version.fw_version_len,
+			       sizeof(wiphy->fw_version) - 1);
+	memcpy(wiphy->fw_version, fw_version.fw_version, fw_version_len);
+	wiphy->fw_version[fw_version_len] = '\0';
+	fw_version_len = min_t(size_t, fw_version.fw_version_len,
+			       sizeof(aicwf_hw->fw_version) - 1);
+	memcpy(aicwf_hw->fw_version, fw_version.fw_version, fw_version_len);
+	aicwf_hw->fw_version[fw_version_len] = '\0';
+
+	memcpy(aicwf_hw->he_capa, aicwf_he_capa, sizeof(aicwf_he_capa));
+	aicwf_hw->bands[NL80211_BAND_2GHZ] = aicwf_band_2ghz;
+	memcpy(aicwf_hw->channels_2ghz, aicwf_2ghz_channels,
+	       sizeof(aicwf_2ghz_channels));
+	aicwf_hw->bands[NL80211_BAND_2GHZ].channels = aicwf_hw->channels_2ghz;
+	ieee80211_set_sband_iftype_data(&aicwf_hw->bands[NL80211_BAND_2GHZ],
+					aicwf_hw->he_capa);
+	wiphy->bands[NL80211_BAND_2GHZ] = &aicwf_hw->bands[NL80211_BAND_2GHZ];
+	if (aicwf_hw->band_5g_support) {
+		aicwf_hw->bands[NL80211_BAND_5GHZ] = aicwf_band_5ghz;
+		memcpy(aicwf_hw->channels_5ghz, aicwf_5ghz_channels,
+		       sizeof(aicwf_5ghz_channels));
+		aicwf_hw->bands[NL80211_BAND_5GHZ].channels = aicwf_hw->channels_5ghz;
+		ieee80211_set_sband_iftype_data(&aicwf_hw->bands[NL80211_BAND_5GHZ],
+						aicwf_hw->he_capa);
+		wiphy->bands[NL80211_BAND_5GHZ] = &aicwf_hw->bands[NL80211_BAND_5GHZ];
+	}
+
+	wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION);
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	wiphy->interface_modes |=
+		BIT(NL80211_IFTYPE_AP) |
+		BIT(NL80211_IFTYPE_AP_VLAN) | BIT(NL80211_IFTYPE_P2P_CLIENT) |
+		BIT(NL80211_IFTYPE_P2P_GO) |
+#ifndef CONFIG_AIC8800_USE_P2P0
+		BIT(NL80211_IFTYPE_P2P_DEVICE) |
+#endif
+		BIT(NL80211_IFTYPE_MONITOR);
+#endif
+
+	wiphy->flags |= WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH |
+			WIPHY_FLAG_4ADDR_STATION | WIPHY_FLAG_4ADDR_AP;
+	wiphy->max_num_csa_counters = BCN_MAX_CSA_CPT;
+#endif
+
+	wiphy->max_remain_on_channel_duration = aicwf_hw->mod_params->roc_dur_max;
+	wiphy->features |= NL80211_FEATURE_SK_TX_STATUS |
+			   NL80211_FEATURE_VIF_TXPOWER;
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	wiphy->features |= NL80211_FEATURE_NEED_OBSS_SCAN |
+			   NL80211_FEATURE_ACTIVE_MONITOR |
+			   NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE;
+#endif
+	wiphy->features |= NL80211_FEATURE_SAE;
+
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	if (aicwf_mod_params.tdls)
+		/* TDLS support */
+		wiphy->features |= NL80211_FEATURE_TDLS_CHANNEL_SWITCH;
+	wiphy->iface_combinations = aicwf_combinations;
+	/* -1 not to include combination with radar detection, will be re-added in
+	 * aicwf_handle_dynparams if supported
+	 */
+	wiphy->n_iface_combinations = ARRAY_SIZE(aicwf_combinations) - 1;
+#endif
+	wiphy->reg_notifier = aicwf_reg_notifier;
+	wiphy->signal_type = CFG80211_SIGNAL_TYPE_MBM;
+	aicwf_enable_wapi(aicwf_hw);
+	wiphy->cipher_suites = aicwf_cipher_suites;
+	wiphy->n_cipher_suites = ARRAY_SIZE(aicwf_cipher_suites);
+	aicwf_hw->ext_capa[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING;
+	aicwf_hw->ext_capa[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF;
+	wiphy->extended_capabilities = aicwf_hw->ext_capa;
+	wiphy->extended_capabilities_mask = aicwf_hw->ext_capa;
+	wiphy->extended_capabilities_len = ARRAY_SIZE(aicwf_hw->ext_capa);
+
+#ifdef CONFIG_AIC8800_SCHED_SCAN
+	wiphy->max_sched_scan_reqs = 1;
+	wiphy->max_sched_scan_ssids = SCAN_SSID_MAX; // 16;
+	wiphy->max_match_sets = SCAN_SSID_MAX;       // 16;
+	wiphy->max_sched_scan_ie_len = 2048;
+#endif // CONFIG_AIC8800_SCHED_SCAN
+
+	// init ic rf
+	ret = aicwf_ic_rf_init(aicwf_hw);
+	if (ret)
+		goto err_lmac_reqs;
+
+	ret = aicwf_send_get_macaddr_req(aicwf_hw, &mac_addr_cfm);
+	if (ret)
+		goto err_lmac_reqs;
+
+	if (is_valid_ether_addr(mac_addr_cfm.mac_addr)) {
+		ether_addr_copy(wiphy->perm_addr, mac_addr_cfm.mac_addr);
+		dev_dbg(aicwf_hw->dev, "using EFUSE MAC address %pM\n",
+			wiphy->perm_addr);
+	} else {
+		eth_random_addr(wiphy->perm_addr);
+		dev_warn(aicwf_hw->dev,
+			 "invalid EFUSE MAC address, using random address %pM\n",
+			 wiphy->perm_addr);
+	}
+
+	/* Reset FW */
+	ret = aicwf_send_reset(aicwf_hw);
+	if (ret)
+		goto err_lmac_reqs;
+
+#ifdef CONFIG_AIC8800_TEMP_COMP
+	aicwf_send_set_temp_comp_req(aicwf_hw, &swconfig_cfm);
+#endif
+
+	ret = aicwf_send_version_req(aicwf_hw, &aicwf_hw->version_cfm);
+	if (ret)
+		goto err_lmac_reqs;
+	aicwf_set_vers(aicwf_hw);
+
+	ret = aicwf_handle_dynparams(aicwf_hw, aicwf_hw->wiphy);
+	if (ret)
+		goto err_lmac_reqs;
+
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	aicwf_enable_mesh(aicwf_hw);
+#endif
+	aicwf_radar_detection_init(&aicwf_hw->radar);
+
+	/* Set parameters to firmware */
+	if (!aicwf_hw->chip_ops->limit_by_testmode || !aicwf_hw->testmode) {
+		ret = aicwf_send_me_config_req(aicwf_hw);
+		if (ret)
+			goto err_lmac_reqs;
+	}
+
+	ret = wiphy_register(wiphy);
+	if (ret) {
+		wiphy_err(wiphy, "Could not register wiphy device\n");
+		goto err_register_wiphy;
+	}
+
+	/* Do not expose an interface until the effective limits are confirmed. */
+	wiphy_lock(wiphy);
+	ret = aicwf_send_me_chan_config_req(aicwf_hw);
+	wiphy_unlock(wiphy);
+	if (ret)
+		goto err_add_interface;
+
+	*platform_data = aicwf_hw;
+
+	rtnl_lock();
+
+	/* Add an initial station interface */
+	vif = aicwf_interface_add(aicwf_hw, "wlan%d", NET_NAME_UNKNOWN,
+				  NL80211_IFTYPE_STATION, NULL);
+
+	rtnl_unlock();
+
+	if (!vif) {
+		wiphy_err(wiphy, "Failed to instantiate a network device\n");
+		ret = -ENOMEM;
+		goto err_add_interface;
+	}
+
+	pr_debug("new interface create %s\n", vif->ndev->name);
+
+#if defined(CONFIG_AIC8800_USE_P2P0) && \
+	!IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+
+	rtnl_lock();
+	/* Add an initial p2p0 interface */
+	vif = aicwf_interface_add(aicwf_hw, "p2p%d", NET_NAME_UNKNOWN,
+				  NL80211_IFTYPE_STATION, NULL);
+	if (vif)
+		vif->is_p2p_vif = 1;
+	rtnl_unlock();
+
+	if (!vif) {
+		wiphy_err(wiphy, "Failed to instantiate a network device\n");
+		ret = -ENOMEM;
+		goto err_add_interface;
+	}
+
+	pr_debug("new interface create %s\n", vif->ndev->name);
+	aicwf_hw->is_p2p_alive = 0;
+	aicwf_hw->is_p2p_connected = 0;
+	atomic_set(&aicwf_hw->p2p_alive_timer_count, 0);
+#endif
+
+#ifdef CONFIG_AIC8800_TEMP_CONTROL
+	aicwf_hw->started_jiffies = 0;
+	aicwf_hw->temp = 0;
+	aicwf_tp_ctrl_init(aicwf_hw->sdiodev);
+#endif
+
+	return 0;
+
+err_add_interface:
+	aicwf_wdev_unregister(aicwf_hw);
+	wiphy_unregister(aicwf_hw->wiphy);
+err_register_wiphy:
+err_lmac_reqs:
+err_cache:
+	timer_shutdown_sync(&aicwf_hw->p2p_alive_timer);
+	if (aicwf_hw->apm_staloss_wq)
+		disable_work_sync(&aicwf_hw->apm_staloss_work);
+	aicwf_sdio_quiesce(aicwf_hw->sdiodev);
+	aicwf_platform_off(aicwf_hw, NULL);
+	aicwf_cmd_mgr_deinit(aicwf_hw->cmd_mgr);
+	aicwf_defrag_deinit(aicwf_hw);
+	if (aicwf_hw->apm_staloss_wq)
+		destroy_workqueue(aicwf_hw->apm_staloss_wq);
+	kmem_cache_destroy(aicwf_hw->sw_txhdr_cache);
+	aicwf_wakeup_sources_deinit(aicwf_hw);
+	aicwf_plat->sdiodev->aicwf_hw = NULL;
+	wiphy_free(wiphy);
+err_out:
+	return ret;
+}
+
+void aicwf_cfg80211_deinit(struct aicwf_hw *aicwf_hw)
+{
+	struct mm_set_stack_start_cfm set_start_cfm;
+
+	if (aicwf_hw->sdiodev->bus_if->state != BUS_DOWN_ST)
+		aicwf_send_set_stack_start_req(aicwf_hw, 0, 0, 0, 0, &set_start_cfm);
+
+	aicwf_hw->fwlog_en = 0;
+#ifdef CONFIG_AIC8800_TEMP_CONTROL
+	aicwf_tp_ctrl_deinit(aicwf_hw->sdiodev);
+#endif
+
+	aicwf_wdev_unregister(aicwf_hw);
+	wiphy_unregister(aicwf_hw->wiphy);
+	destroy_workqueue(aicwf_hw->apm_staloss_wq);
+	aicwf_defrag_deinit(aicwf_hw);
+	aicwf_radar_detection_deinit(&aicwf_hw->radar);
+	kmem_cache_destroy(aicwf_hw->sw_txhdr_cache);
+	aicwf_wakeup_sources_deinit(aicwf_hw);
+	aicwf_hw->sdiodev->aicwf_hw = NULL;
+	wiphy_free(aicwf_hw->wiphy);
+}
+
+static int __init aicwf_mod_init(void)
+{
+	return aicwf_sdio_register();
+}
+
+static void __exit aicwf_mod_exit(void)
+{
+	aicwf_sdio_exit();
+}
+
+module_init(aicwf_mod_init);
+module_exit(aicwf_mod_exit);
+
+MODULE_DESCRIPTION(RW_DRV_DESCRIPTION);
+MODULE_AUTHOR(RW_DRV_COPYRIGHT " " RW_DRV_AUTHOR);
+MODULE_LICENSE("GPL");
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_mesh.c b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_mesh.c
new file mode 100644
index 000000000000..88934428ffdd
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_mesh.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ ******************************************************************************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief mesh function
+ *
+ ******************************************************************************
+ */
+
+#include "aicwf_mesh.h"
+
+struct aicwf_mesh_proxy *aicwf_get_mesh_proxy_info(struct aicwf_vif *p_aicwf_vif,
+						   u8 *p_sta_addr, bool local)
+{
+	struct aicwf_mesh_proxy *p_mesh_proxy = NULL;
+	struct aicwf_mesh_proxy *p_cur_proxy;
+
+	/* Look for proxied devices with provided address */
+	list_for_each_entry(p_cur_proxy, &p_aicwf_vif->ap.proxy_list, list) {
+		if (p_cur_proxy->local != local)
+			continue;
+
+		if (!memcmp(&p_cur_proxy->ext_sta_addr, p_sta_addr, ETH_ALEN)) {
+			p_mesh_proxy = p_cur_proxy;
+			break;
+		}
+	}
+
+	/* Return the found information */
+	return p_mesh_proxy;
+}
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_mod_params.c b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_mod_params.c
new file mode 100644
index 000000000000..a9e6eadfc686
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_mod_params.c
@@ -0,0 +1,644 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ ******************************************************************************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief Set driver configuration defaults
+ *
+ ******************************************************************************
+ */
+#include <linux/rtnetlink.h>
+
+#include "hal_desc.h"
+#include "aicwf_defs.h"
+#include "aicwf_main.h"
+#include "aicwf_tx.h"
+
+#ifdef CONFIG_AICWF_FULLMAC
+#define COMMON_PARAM(name, default) .name = default,
+#define SOFTMAC_PARAM(name, default)
+#define FULLMAC_PARAM(name, default) .name = default,
+#endif /* CONFIG_AICWF_FULLMAC */
+
+struct aicwf_mod_params aicwf_mod_params = {
+	/* common parameters */
+	COMMON_PARAM(ht_on, true)
+	COMMON_PARAM(vht_on, true)
+	COMMON_PARAM(he_on, true)
+	COMMON_PARAM(mcs_map, IEEE80211_VHT_MCS_SUPPORT_0_9)
+	COMMON_PARAM(he_mcs_map, IEEE80211_HE_MCS_SUPPORT_0_11)
+	COMMON_PARAM(he_ul_on, false)
+	COMMON_PARAM(ldpc_on, true)
+	COMMON_PARAM(stbc_on, true)
+	COMMON_PARAM(gf_rx_on, false)
+	COMMON_PARAM(phy_cfg, 2)
+	COMMON_PARAM(uapsd_timeout, 300)
+	COMMON_PARAM(ap_uapsd_on, false)
+	COMMON_PARAM(sgi, true)
+	COMMON_PARAM(sgi80, false)
+	COMMON_PARAM(use_2040, 1)
+	COMMON_PARAM(nss, 1)
+	COMMON_PARAM(amsdu_rx_max, 2)
+	COMMON_PARAM(bfmee, true)
+	COMMON_PARAM(bfmer, false)
+	COMMON_PARAM(mesh, false)
+	COMMON_PARAM(murx, true)
+	COMMON_PARAM(mutx, true)
+	COMMON_PARAM(mutx_on, true)
+	COMMON_PARAM(use_80, false)
+	COMMON_PARAM(roc_dur_max, 500)
+	COMMON_PARAM(listen_itv, 0)
+	COMMON_PARAM(listen_bcmc, true)
+	COMMON_PARAM(lp_clk_ppm, 20)
+	COMMON_PARAM(ps_on, true)
+	COMMON_PARAM(tx_lft, AICWF_TX_LIFETIME_MS)
+	COMMON_PARAM(amsdu_maxnb, NX_TX_PAYLOAD_MAX)
+	// By default, only enable UAPSD for Voice queue (see
+	// IEEE80211_DEFAULT_UAPSD_QUEUE comment)
+	COMMON_PARAM(uapsd_queues, IEEE80211_WMM_IE_STA_QOSINFO_AC_VO)
+	COMMON_PARAM(tdls, false)
+	COMMON_PARAM(uf, false)
+	COMMON_PARAM(auto_reply, false)
+	COMMON_PARAM(ftl, "")
+	COMMON_PARAM(dpsm, false)
+
+	/* SOFTMAC only parameters */
+	SOFTMAC_PARAM(mfp_on, false)
+	SOFTMAC_PARAM(gf_on, false)
+	SOFTMAC_PARAM(bwsig_on, true)
+	SOFTMAC_PARAM(dynbw_on, true)
+	SOFTMAC_PARAM(agg_tx, true)
+	SOFTMAC_PARAM(amsdu_force, 2)
+	SOFTMAC_PARAM(rc_probes_on, false)
+	SOFTMAC_PARAM(cmon, true)
+	SOFTMAC_PARAM(hwscan, true)
+	SOFTMAC_PARAM(autobcn, true)
+	SOFTMAC_PARAM(dpsm, true)
+
+	/* FULLMAC only parameters */
+	FULLMAC_PARAM(ant_div, true)
+};
+
+static const int mcs_map_to_rate[4][3] = {
+	[PHY_CHNL_BW_20][IEEE80211_VHT_MCS_SUPPORT_0_7] = 65,
+	[PHY_CHNL_BW_20][IEEE80211_VHT_MCS_SUPPORT_0_8] = 78,
+	[PHY_CHNL_BW_20][IEEE80211_VHT_MCS_SUPPORT_0_9] = 78,
+	[PHY_CHNL_BW_40][IEEE80211_VHT_MCS_SUPPORT_0_7] = 135,
+	[PHY_CHNL_BW_40][IEEE80211_VHT_MCS_SUPPORT_0_8] = 162,
+	[PHY_CHNL_BW_40][IEEE80211_VHT_MCS_SUPPORT_0_9] = 180,
+	[PHY_CHNL_BW_80][IEEE80211_VHT_MCS_SUPPORT_0_7] = 292,
+	[PHY_CHNL_BW_80][IEEE80211_VHT_MCS_SUPPORT_0_8] = 351,
+	[PHY_CHNL_BW_80][IEEE80211_VHT_MCS_SUPPORT_0_9] = 390,
+	[PHY_CHNL_BW_160][IEEE80211_VHT_MCS_SUPPORT_0_7] = 585,
+	[PHY_CHNL_BW_160][IEEE80211_VHT_MCS_SUPPORT_0_8] = 702,
+	[PHY_CHNL_BW_160][IEEE80211_VHT_MCS_SUPPORT_0_9] = 780,
+};
+
+#define MAX_VHT_RATE(map, nss, bw) (mcs_map_to_rate[bw][map] * (nss))
+
+static void aicwf_set_vht_capa(struct aicwf_hw *aicwf_hw, struct wiphy *wiphy)
+{
+	struct ieee80211_supported_band *band_5ghz =
+		wiphy->bands[NL80211_BAND_5GHZ];
+	struct ieee80211_supported_band *band_2ghz =
+		wiphy->bands[NL80211_BAND_2GHZ];
+
+	int i;
+	int nss = aicwf_hw->mod_params->nss;
+	int mcs_map;
+	int mcs_map_max;
+	int bw_max;
+
+	if (!aicwf_hw->mod_params->vht_on)
+		return;
+
+	band_2ghz->vht_cap.vht_supported = true;
+	if (aicwf_hw->mod_params->sgi80)
+		band_2ghz->vht_cap.cap |= IEEE80211_VHT_CAP_SHORT_GI_80;
+	if (aicwf_hw->mod_params->stbc_on)
+		band_2ghz->vht_cap.cap |= IEEE80211_VHT_CAP_RXSTBC_1;
+	if (aicwf_hw->mod_params->ldpc_on)
+		band_2ghz->vht_cap.cap |= IEEE80211_VHT_CAP_RXLDPC;
+	if (aicwf_hw->mod_params->bfmee) {
+		band_2ghz->vht_cap.cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
+		band_2ghz->vht_cap.cap |= 3 << IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
+	}
+	if (nss > 1)
+		band_2ghz->vht_cap.cap |= IEEE80211_VHT_CAP_TXSTBC;
+
+	// Update the AMSDU max RX size (not shifted as located at offset 0 of the
+	// VHT cap)
+	band_2ghz->vht_cap.cap |= aicwf_hw->mod_params->amsdu_rx_max;
+
+	if (aicwf_hw->mod_params->bfmer) {
+		band_2ghz->vht_cap.cap |= IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE;
+		/* Set number of sounding dimensions */
+		band_2ghz->vht_cap.cap |=
+			(nss - 1) << IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_SHIFT;
+	}
+	if (aicwf_hw->mod_params->murx)
+		band_2ghz->vht_cap.cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
+	if (aicwf_hw->mod_params->mutx)
+		band_2ghz->vht_cap.cap |= IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE;
+
+	/*
+	 * MCS map:
+	 * These capabilities are filled according to the configured MCS map.
+	 * However currently we have some limitations due to FPGA clock constraints
+	 * that prevent always using the range of MCS that is defined by the
+	 * parameter:
+	 *   - in RX, 2SS, we support up to MCS7
+	 *   - in TX, 2SS, we support up to MCS8
+	 */
+	// Get max supported BW
+	if (aicwf_hw->mod_params->use_80)
+		bw_max = PHY_CHNL_BW_80;
+	else if (aicwf_hw->mod_params->use_2040)
+		bw_max = PHY_CHNL_BW_40;
+	else
+		bw_max = PHY_CHNL_BW_20;
+
+	// Check if MCS map should be limited to MCS0_8 due to the standard. Indeed
+	// in BW20, MCS9 is not supported in 1 and 2 SS
+	if (aicwf_hw->mod_params->use_2040)
+		mcs_map_max = IEEE80211_VHT_MCS_SUPPORT_0_9;
+	else
+		mcs_map_max = IEEE80211_VHT_MCS_SUPPORT_0_8;
+
+	mcs_map = min_t(int, aicwf_hw->mod_params->mcs_map, mcs_map_max);
+
+	nss = min_t(int, nss, 16);
+
+	band_2ghz->vht_cap.vht_mcs.rx_mcs_map = cpu_to_le16(0);
+	for (i = 0; i < nss; i++) {
+		band_2ghz->vht_cap.vht_mcs.rx_mcs_map |=
+			cpu_to_le16(mcs_map << (i * 2));
+		band_2ghz->vht_cap.vht_mcs.rx_highest =
+			cpu_to_le16(MAX_VHT_RATE(mcs_map, nss, bw_max));
+		mcs_map = IEEE80211_VHT_MCS_SUPPORT_0_7;
+	}
+	for (; i < 8; i++) {
+		band_2ghz->vht_cap.vht_mcs.rx_mcs_map |=
+			cpu_to_le16(IEEE80211_VHT_MCS_NOT_SUPPORTED << (i * 2));
+	}
+
+	mcs_map = min_t(int, aicwf_hw->mod_params->mcs_map, mcs_map_max);
+	band_2ghz->vht_cap.vht_mcs.tx_mcs_map = cpu_to_le16(0);
+	for (i = 0; i < nss; i++) {
+		band_2ghz->vht_cap.vht_mcs.tx_mcs_map |=
+			cpu_to_le16(mcs_map << (i * 2));
+		band_2ghz->vht_cap.vht_mcs.tx_highest =
+			cpu_to_le16(MAX_VHT_RATE(mcs_map, nss, bw_max));
+		mcs_map = min_t(int, aicwf_hw->mod_params->mcs_map,
+				IEEE80211_VHT_MCS_SUPPORT_0_8);
+	}
+	for (; i < 8; i++) {
+		band_2ghz->vht_cap.vht_mcs.tx_mcs_map |=
+			cpu_to_le16(IEEE80211_VHT_MCS_NOT_SUPPORTED << (i * 2));
+	}
+
+	if (!aicwf_hw->mod_params->use_80) {
+#ifdef CONFIG_VENDOR_AICWF_VHT_NO80
+		band_2ghz->vht_cap.cap |= IEEE80211_VHT_CAP_NOT_SUP_WIDTH_80;
+#endif
+		band_2ghz->vht_cap.cap &= ~IEEE80211_VHT_CAP_SHORT_GI_80;
+	}
+
+	if (aicwf_hw->band_5g_support) {
+		band_5ghz->vht_cap.vht_supported = true;
+		if (aicwf_hw->mod_params->sgi80)
+			band_5ghz->vht_cap.cap |= IEEE80211_VHT_CAP_SHORT_GI_80;
+		if (aicwf_hw->mod_params->stbc_on)
+			band_5ghz->vht_cap.cap |= IEEE80211_VHT_CAP_RXSTBC_1;
+		if (aicwf_hw->mod_params->ldpc_on)
+			band_5ghz->vht_cap.cap |= IEEE80211_VHT_CAP_RXLDPC;
+		if (aicwf_hw->mod_params->bfmee) {
+			band_5ghz->vht_cap.cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
+			band_5ghz->vht_cap.cap |= 3 << IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
+		}
+		if (nss > 1)
+			band_5ghz->vht_cap.cap |= IEEE80211_VHT_CAP_TXSTBC;
+
+		// Update the AMSDU max RX size (not shifted as located at offset 0 of
+		// the VHT cap)
+		band_5ghz->vht_cap.cap |= aicwf_hw->mod_params->amsdu_rx_max;
+
+		if (aicwf_hw->mod_params->bfmer) {
+			band_5ghz->vht_cap.cap |= IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE;
+			/* Set number of sounding dimensions */
+			band_5ghz->vht_cap.cap |=
+				(nss - 1) << IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_SHIFT;
+		}
+		if (aicwf_hw->mod_params->murx)
+			band_5ghz->vht_cap.cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
+		if (aicwf_hw->mod_params->mutx)
+			band_5ghz->vht_cap.cap |= IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE;
+
+		/*
+		 * MCS map:
+		 * This capabilities are filled according to the mcs_map module
+		 * parameter. However currently we have some limitations due to FPGA
+		 * clock constraints that prevent always using the range of MCS that is
+		 * defined by the parameter:
+		 *   - in RX, 2SS, we support up to MCS7
+		 *   - in TX, 2SS, we support up to MCS8
+		 */
+		// Get max supported BW
+		if (aicwf_hw->mod_params->use_80)
+			bw_max = PHY_CHNL_BW_80;
+		else if (aicwf_hw->mod_params->use_2040)
+			bw_max = PHY_CHNL_BW_40;
+		else
+			bw_max = PHY_CHNL_BW_20;
+
+		// Check if MCS map should be limited to MCS0_8 due to the standard.
+		// Indeed in BW20, MCS9 is not supported in 1 and 2 SS
+		if (aicwf_hw->mod_params->use_2040)
+			mcs_map_max = IEEE80211_VHT_MCS_SUPPORT_0_9;
+		else
+			mcs_map_max = IEEE80211_VHT_MCS_SUPPORT_0_8;
+
+		mcs_map = min_t(int, aicwf_hw->mod_params->mcs_map, mcs_map_max);
+		band_5ghz->vht_cap.vht_mcs.rx_mcs_map = cpu_to_le16(0);
+		for (i = 0; i < nss; i++) {
+			band_5ghz->vht_cap.vht_mcs.rx_mcs_map |=
+				cpu_to_le16(mcs_map << (i * 2));
+			band_5ghz->vht_cap.vht_mcs.rx_highest =
+				cpu_to_le16(MAX_VHT_RATE(mcs_map, nss, bw_max));
+			mcs_map = IEEE80211_VHT_MCS_SUPPORT_0_7;
+		}
+		for (; i < 8; i++) {
+			band_5ghz->vht_cap.vht_mcs.rx_mcs_map |=
+				cpu_to_le16(IEEE80211_VHT_MCS_NOT_SUPPORTED << (i * 2));
+		}
+
+		mcs_map = min_t(int, aicwf_hw->mod_params->mcs_map, mcs_map_max);
+		band_5ghz->vht_cap.vht_mcs.tx_mcs_map = cpu_to_le16(0);
+		for (i = 0; i < nss; i++) {
+			band_5ghz->vht_cap.vht_mcs.tx_mcs_map |=
+				cpu_to_le16(mcs_map << (i * 2));
+			band_5ghz->vht_cap.vht_mcs.tx_highest =
+				cpu_to_le16(MAX_VHT_RATE(mcs_map, nss, bw_max));
+			mcs_map = min_t(int, aicwf_hw->mod_params->mcs_map,
+					IEEE80211_VHT_MCS_SUPPORT_0_8);
+		}
+		for (; i < 8; i++) {
+			band_5ghz->vht_cap.vht_mcs.tx_mcs_map |=
+				cpu_to_le16(IEEE80211_VHT_MCS_NOT_SUPPORTED << (i * 2));
+		}
+
+		if (!aicwf_hw->mod_params->use_80) {
+#ifdef CONFIG_VENDOR_AICWF_VHT_NO80
+			band_5ghz->vht_cap.cap |= IEEE80211_VHT_CAP_NOT_SUP_WIDTH_80;
+#endif
+			band_5ghz->vht_cap.cap &= ~IEEE80211_VHT_CAP_SHORT_GI_80;
+		}
+	}
+}
+
+static void aicwf_set_ht_capa(struct aicwf_hw *aicwf_hw, struct wiphy *wiphy)
+{
+	struct ieee80211_supported_band *band_5ghz =
+		wiphy->bands[NL80211_BAND_5GHZ];
+	struct ieee80211_supported_band *band_2ghz =
+		wiphy->bands[NL80211_BAND_2GHZ];
+	int i;
+	int nss = aicwf_hw->mod_params->nss;
+
+	if (!aicwf_hw->mod_params->ht_on) {
+		band_2ghz->ht_cap.ht_supported = false;
+		if (aicwf_hw->band_5g_support)
+			band_5ghz->ht_cap.ht_supported = false;
+		return;
+	}
+
+	if (aicwf_hw->mod_params->stbc_on)
+		band_2ghz->ht_cap.cap |= 1 << IEEE80211_HT_CAP_RX_STBC_SHIFT;
+	if (aicwf_hw->mod_params->ldpc_on)
+		band_2ghz->ht_cap.cap |= IEEE80211_HT_CAP_LDPC_CODING;
+	if (aicwf_hw->mod_params->use_2040) {
+		band_2ghz->ht_cap.mcs.rx_mask[4] = 0x1; /* MCS32 */
+		band_2ghz->ht_cap.cap |= IEEE80211_HT_CAP_SUP_WIDTH_20_40;
+		band_2ghz->ht_cap.mcs.rx_highest = cpu_to_le16(135 * nss);
+	} else {
+		band_2ghz->ht_cap.mcs.rx_highest = cpu_to_le16(65 * nss);
+	}
+	if (nss > 1)
+		band_2ghz->ht_cap.cap |= IEEE80211_HT_CAP_TX_STBC;
+
+	// Update the AMSDU max RX size
+	if (aicwf_hw->mod_params->amsdu_rx_max)
+		band_2ghz->ht_cap.cap |= IEEE80211_HT_CAP_MAX_AMSDU;
+
+	if (aicwf_hw->mod_params->sgi) {
+		band_2ghz->ht_cap.cap |= IEEE80211_HT_CAP_SGI_20;
+		if (aicwf_hw->mod_params->use_2040) {
+			band_2ghz->ht_cap.cap |= IEEE80211_HT_CAP_SGI_40;
+			band_2ghz->ht_cap.mcs.rx_highest = cpu_to_le16(150 * nss);
+		} else {
+			band_2ghz->ht_cap.mcs.rx_highest = cpu_to_le16(72 * nss);
+		}
+	}
+	if (aicwf_hw->mod_params->gf_rx_on)
+		band_2ghz->ht_cap.cap |= IEEE80211_HT_CAP_GRN_FLD;
+
+	nss = min_t(int, nss, IEEE80211_HT_MCS_MASK_LEN);
+
+	for (i = 0; i < nss; i++)
+		band_2ghz->ht_cap.mcs.rx_mask[i] = 0xFF;
+
+	if (aicwf_hw->band_5g_support)
+		band_5ghz->ht_cap = band_2ghz->ht_cap;
+}
+
+static void aicwf_set_he_capa(struct aicwf_hw *aicwf_hw, struct wiphy *wiphy)
+{
+	struct ieee80211_supported_band *band_5ghz =
+		wiphy->bands[NL80211_BAND_5GHZ];
+	struct ieee80211_supported_band *band_2ghz =
+		wiphy->bands[NL80211_BAND_2GHZ];
+	int i;
+	int nss = aicwf_hw->mod_params->nss;
+	struct ieee80211_sta_he_cap *he_cap;
+	int mcs_map;
+
+	if (!aicwf_hw->mod_params->he_on) {
+		band_2ghz->iftype_data = NULL;
+		band_2ghz->n_iftype_data = 0;
+
+		if (aicwf_hw->band_5g_support) {
+			band_5ghz->iftype_data = NULL;
+			band_5ghz->n_iftype_data = 0;
+		}
+		return;
+	}
+	he_cap = &aicwf_hw->he_capa[0].he_cap;
+	he_cap->has_he = true;
+	he_cap->he_cap_elem.mac_cap_info[2] |= IEEE80211_HE_MAC_CAP2_ALL_ACK;
+
+	if (aicwf_hw->mod_params->use_2040) {
+		he_cap->he_cap_elem.phy_cap_info[0] |=
+			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G;
+		he_cap->ppe_thres[0] |= 0x10;
+	}
+	if (aicwf_hw->mod_params->use_80) {
+		he_cap->ppe_thres[0] |= 0x20;
+		he_cap->ppe_thres[2] |= 0xc0;
+		he_cap->ppe_thres[3] |= 0x07;
+	}
+	he_cap->he_cap_elem.phy_cap_info[0] |=
+		IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G;
+	if (aicwf_hw->mod_params->ldpc_on) {
+		he_cap->he_cap_elem.phy_cap_info[1] |=
+			IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD;
+	} else {
+		// If no LDPC is supported, we have to limit to MCS0_9, as LDPC is
+		// mandatory for MCS 10 and 11
+		aicwf_hw->mod_params->he_mcs_map = min_t(int, aicwf_hw->mod_params->mcs_map,
+							 IEEE80211_HE_MCS_SUPPORT_0_9);
+	}
+	he_cap->he_cap_elem.phy_cap_info[1] |=
+		IEEE80211_HE_PHY_CAP1_HE_LTF_AND_GI_FOR_HE_PPDUS_0_8US |
+		IEEE80211_HE_PHY_CAP1_MIDAMBLE_RX_TX_MAX_NSTS;
+
+	he_cap->he_cap_elem.phy_cap_info[2] |=
+		IEEE80211_HE_PHY_CAP2_MIDAMBLE_RX_TX_MAX_NSTS |
+		IEEE80211_HE_PHY_CAP2_NDP_4x_LTF_AND_3_2US |
+		IEEE80211_HE_PHY_CAP2_DOPPLER_RX;
+	if (aicwf_hw->mod_params->stbc_on)
+		he_cap->he_cap_elem.phy_cap_info[2] |=
+			IEEE80211_HE_PHY_CAP2_STBC_RX_UNDER_80MHZ;
+
+	he_cap->he_cap_elem.phy_cap_info[3] |=
+		IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_16_QAM |
+		IEEE80211_HE_PHY_CAP3_DCM_MAX_RX_NSS_1 |
+		IEEE80211_HE_PHY_CAP3_RX_PARTIAL_BW_SU_IN_20MHZ_MU;
+
+	if (aicwf_hw->mod_params->bfmee) {
+		he_cap->he_cap_elem.phy_cap_info[4] |=
+			IEEE80211_HE_PHY_CAP4_SU_BEAMFORMEE;
+		he_cap->he_cap_elem.phy_cap_info[4] |=
+			IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_4;
+	}
+	he_cap->he_cap_elem.phy_cap_info[5] |=
+		IEEE80211_HE_PHY_CAP5_NG16_SU_FEEDBACK |
+		IEEE80211_HE_PHY_CAP5_NG16_MU_FEEDBACK;
+	he_cap->he_cap_elem.phy_cap_info[6] |=
+		IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_42_SU |
+		IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_75_MU |
+		IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMING_FB |
+		IEEE80211_HE_PHY_CAP6_TRIG_MU_BEAMFORMING_PARTIAL_BW_FB |
+		IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT |
+		IEEE80211_HE_PHY_CAP6_PARTIAL_BANDWIDTH_DL_MUMIMO;
+	he_cap->he_cap_elem.phy_cap_info[7] |=
+		IEEE80211_HE_PHY_CAP7_HE_SU_MU_PPDU_4XLTF_AND_08_US_GI;
+	he_cap->he_cap_elem.phy_cap_info[8] |=
+		IEEE80211_HE_PHY_CAP8_20MHZ_IN_40MHZ_HE_PPDU_IN_2G;
+	he_cap->he_cap_elem.phy_cap_info[9] |=
+		IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_COMP_SIGB |
+		IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_NON_COMP_SIGB;
+
+	if (aicwf_hw->chip_ops->is_old_ic) {
+		mcs_map = min_t(int, aicwf_hw->mod_params->he_mcs_map,
+				IEEE80211_HE_MCS_SUPPORT_0_9);
+	} else {
+		mcs_map = aicwf_hw->mod_params->he_mcs_map;
+	}
+
+	memset(&he_cap->he_mcs_nss_supp, 0, sizeof(he_cap->he_mcs_nss_supp));
+
+	nss = min_t(int, nss, 16);
+
+	for (i = 0; i < nss; i++) {
+		__le16 unsup_for_ss =
+			cpu_to_le16(IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2));
+		he_cap->he_mcs_nss_supp.rx_mcs_80 |= cpu_to_le16(mcs_map << (i * 2));
+		he_cap->he_mcs_nss_supp.rx_mcs_160 |= unsup_for_ss;
+		he_cap->he_mcs_nss_supp.rx_mcs_80p80 |= unsup_for_ss;
+		mcs_map = IEEE80211_HE_MCS_SUPPORT_0_7;
+	}
+	for (; i < 8; i++) {
+		__le16 unsup_for_ss =
+			cpu_to_le16(IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2));
+		he_cap->he_mcs_nss_supp.rx_mcs_80 |= unsup_for_ss;
+		he_cap->he_mcs_nss_supp.rx_mcs_160 |= unsup_for_ss;
+		he_cap->he_mcs_nss_supp.rx_mcs_80p80 |= unsup_for_ss;
+	}
+	mcs_map = aicwf_hw->mod_params->he_mcs_map;
+	for (i = 0; i < nss; i++) {
+		__le16 unsup_for_ss =
+			cpu_to_le16(IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2));
+		he_cap->he_mcs_nss_supp.tx_mcs_80 |= cpu_to_le16(mcs_map << (i * 2));
+		he_cap->he_mcs_nss_supp.tx_mcs_160 |= unsup_for_ss;
+		he_cap->he_mcs_nss_supp.tx_mcs_80p80 |= unsup_for_ss;
+		mcs_map = min_t(int, aicwf_hw->mod_params->he_mcs_map,
+				IEEE80211_HE_MCS_SUPPORT_0_7);
+	}
+	for (; i < 8; i++) {
+		__le16 unsup_for_ss =
+			cpu_to_le16(IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2));
+		he_cap->he_mcs_nss_supp.tx_mcs_80 |= unsup_for_ss;
+		he_cap->he_mcs_nss_supp.tx_mcs_160 |= unsup_for_ss;
+		he_cap->he_mcs_nss_supp.tx_mcs_80p80 |= unsup_for_ss;
+	}
+
+	if (aicwf_hw->band_5g_support) {
+		he_cap = &aicwf_hw->he_capa[0].he_cap;
+		he_cap->has_he = true;
+		he_cap->he_cap_elem.mac_cap_info[2] |= IEEE80211_HE_MAC_CAP2_ALL_ACK;
+		if (aicwf_hw->mod_params->use_2040) {
+			he_cap->he_cap_elem.phy_cap_info[0] |=
+				IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G;
+			he_cap->ppe_thres[0] |= 0x10;
+		}
+		if (aicwf_hw->mod_params->use_80) {
+			he_cap->ppe_thres[0] |= 0x20;
+			he_cap->ppe_thres[2] |= 0xc0;
+			he_cap->ppe_thres[3] |= 0x07;
+		}
+
+		he_cap->he_cap_elem.phy_cap_info[0] |=
+			IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G;
+
+		if (aicwf_hw->mod_params->ldpc_on) {
+			he_cap->he_cap_elem.phy_cap_info[1] |=
+				IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD;
+		} else {
+			// If no LDPC is supported, we have to limit to MCS0_9, as LDPC is
+			// mandatory for MCS 10 and 11
+			aicwf_hw->mod_params->he_mcs_map = min_t(int, aicwf_hw->mod_params->mcs_map,
+								 IEEE80211_HE_MCS_SUPPORT_0_9);
+		}
+		he_cap->he_cap_elem.phy_cap_info[1] |=
+			IEEE80211_HE_PHY_CAP1_HE_LTF_AND_GI_FOR_HE_PPDUS_0_8US |
+			IEEE80211_HE_PHY_CAP1_MIDAMBLE_RX_TX_MAX_NSTS;
+		he_cap->he_cap_elem.phy_cap_info[2] |=
+			IEEE80211_HE_PHY_CAP2_MIDAMBLE_RX_TX_MAX_NSTS |
+			IEEE80211_HE_PHY_CAP2_NDP_4x_LTF_AND_3_2US |
+			IEEE80211_HE_PHY_CAP2_DOPPLER_RX;
+		if (aicwf_hw->mod_params->stbc_on)
+			he_cap->he_cap_elem.phy_cap_info[2] |=
+				IEEE80211_HE_PHY_CAP2_STBC_RX_UNDER_80MHZ;
+		he_cap->he_cap_elem.phy_cap_info[3] |=
+			IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_16_QAM |
+			IEEE80211_HE_PHY_CAP3_DCM_MAX_RX_NSS_1 |
+			IEEE80211_HE_PHY_CAP3_RX_PARTIAL_BW_SU_IN_20MHZ_MU;
+		if (aicwf_hw->mod_params->bfmee) {
+			he_cap->he_cap_elem.phy_cap_info[4] |=
+				IEEE80211_HE_PHY_CAP4_SU_BEAMFORMEE;
+			he_cap->he_cap_elem.phy_cap_info[4] |=
+				IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_4;
+		}
+		he_cap->he_cap_elem.phy_cap_info[5] |=
+			IEEE80211_HE_PHY_CAP5_NG16_SU_FEEDBACK |
+			IEEE80211_HE_PHY_CAP5_NG16_MU_FEEDBACK;
+		he_cap->he_cap_elem.phy_cap_info[6] |=
+			IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_42_SU |
+			IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_75_MU |
+			IEEE80211_HE_PHY_CAP6_TRIG_SU_BEAMFORMING_FB |
+			IEEE80211_HE_PHY_CAP6_TRIG_MU_BEAMFORMING_PARTIAL_BW_FB |
+			IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT |
+			IEEE80211_HE_PHY_CAP6_PARTIAL_BANDWIDTH_DL_MUMIMO;
+
+		he_cap->he_cap_elem.phy_cap_info[7] |=
+			IEEE80211_HE_PHY_CAP7_HE_SU_MU_PPDU_4XLTF_AND_08_US_GI;
+		he_cap->he_cap_elem.phy_cap_info[8] |=
+			IEEE80211_HE_PHY_CAP8_20MHZ_IN_40MHZ_HE_PPDU_IN_2G;
+		he_cap->he_cap_elem.phy_cap_info[9] |=
+			IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_COMP_SIGB |
+			IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USING_MU_WITH_NON_COMP_SIGB;
+
+		if (aicwf_hw->chip_ops->is_old_ic) {
+			mcs_map = min_t(int, aicwf_hw->mod_params->he_mcs_map,
+					IEEE80211_HE_MCS_SUPPORT_0_9);
+		} else {
+			mcs_map = aicwf_hw->mod_params->he_mcs_map;
+		}
+
+		memset(&he_cap->he_mcs_nss_supp, 0, sizeof(he_cap->he_mcs_nss_supp));
+		for (i = 0; i < nss; i++) {
+			__le16 unsup_for_ss =
+				cpu_to_le16(IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2));
+			he_cap->he_mcs_nss_supp.rx_mcs_80 |=
+				cpu_to_le16(mcs_map << (i * 2));
+			he_cap->he_mcs_nss_supp.rx_mcs_160 |= unsup_for_ss;
+			he_cap->he_mcs_nss_supp.rx_mcs_80p80 |= unsup_for_ss;
+			mcs_map = IEEE80211_HE_MCS_SUPPORT_0_7;
+		}
+		for (; i < 8; i++) {
+			__le16 unsup_for_ss =
+				cpu_to_le16(IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2));
+			he_cap->he_mcs_nss_supp.rx_mcs_80 |= unsup_for_ss;
+			he_cap->he_mcs_nss_supp.rx_mcs_160 |= unsup_for_ss;
+			he_cap->he_mcs_nss_supp.rx_mcs_80p80 |= unsup_for_ss;
+		}
+		mcs_map = aicwf_hw->mod_params->he_mcs_map;
+		for (i = 0; i < nss; i++) {
+			__le16 unsup_for_ss =
+				cpu_to_le16(IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2));
+			he_cap->he_mcs_nss_supp.tx_mcs_80 |=
+				cpu_to_le16(mcs_map << (i * 2));
+			he_cap->he_mcs_nss_supp.tx_mcs_160 |= unsup_for_ss;
+			he_cap->he_mcs_nss_supp.tx_mcs_80p80 |= unsup_for_ss;
+			mcs_map = min_t(int, aicwf_hw->mod_params->he_mcs_map,
+					IEEE80211_HE_MCS_SUPPORT_0_7);
+		}
+		for (; i < 8; i++) {
+			__le16 unsup_for_ss =
+				cpu_to_le16(IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2));
+			he_cap->he_mcs_nss_supp.tx_mcs_80 |= unsup_for_ss;
+			he_cap->he_mcs_nss_supp.tx_mcs_160 |= unsup_for_ss;
+			he_cap->he_mcs_nss_supp.tx_mcs_80p80 |= unsup_for_ss;
+		}
+	}
+}
+
+static void aicwf_set_wiphy_params(struct aicwf_hw *aicwf_hw, struct wiphy *wiphy)
+{
+#ifdef CONFIG_AICWF_FULLMAC
+	/* FULLMAC specific parameters */
+	wiphy->flags |= WIPHY_FLAG_REPORTS_OBSS;
+	wiphy->max_scan_ssids = SCAN_SSID_MAX;
+	wiphy->max_scan_ie_len = SCANU_MAX_IE_LEN;
+#endif /* CONFIG_AICWF_FULLMAC */
+
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	if (aicwf_hw->mod_params->tdls) {
+		/* TDLS support */
+		wiphy->flags |= WIPHY_FLAG_SUPPORTS_TDLS;
+#ifdef CONFIG_AICWF_FULLMAC
+		/* TDLS external setup support */
+		wiphy->flags |= WIPHY_FLAG_TDLS_EXTERNAL_SETUP;
+#endif
+	}
+
+	if (aicwf_hw->mod_params->ap_uapsd_on)
+		wiphy->flags |= WIPHY_FLAG_AP_UAPSD;
+#endif
+
+#ifdef CONFIG_AICWF_FULLMAC
+	if (aicwf_hw->mod_params->ps_on)
+		wiphy->flags |= WIPHY_FLAG_PS_ON_BY_DEFAULT;
+	else
+		wiphy->flags &= ~WIPHY_FLAG_PS_ON_BY_DEFAULT;
+#endif
+}
+
+int aicwf_handle_dynparams(struct aicwf_hw *aicwf_hw, struct wiphy *wiphy)
+{
+	/* Set chip capabilities */
+	aic_chip_init_capa(aicwf_hw);
+	/* Set wiphy parameters */
+	aicwf_set_wiphy_params(aicwf_hw, wiphy);
+	/* Set VHT capabilities */
+	aicwf_set_vht_capa(aicwf_hw, wiphy);
+	/* Set HE capabilities */
+	aicwf_set_he_capa(aicwf_hw, wiphy);
+	/* Set HT capabilities */
+	aicwf_set_ht_capa(aicwf_hw, wiphy);
+	/* Set RF specific parameters (shall be done last as it might change some
+	 * capabilities previously set)
+	 */
+	return 0;
+}
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_mu_group.c b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_mu_group.c
new file mode 100644
index 000000000000..be67912434c8
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_mu_group.c
@@ -0,0 +1,653 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ ******************************************************************************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief mu group information
+ *
+ ******************************************************************************
+ */
+
+#include "aicwf_defs.h"
+#include "aicwf_events.h"
+#include "aicwf_msg_tx.h"
+
+/**
+ * aicwf_mu_group_sta_init - Initialize group information for a STA
+ * @sta: STA to initialize
+ * @vht_cap: VHT capabilities advertised by the STA, or %NULL
+ */
+void aicwf_mu_group_sta_init(struct aicwf_sta *sta,
+			     const struct ieee80211_vht_cap *vht_cap)
+{
+	sta->group_info.map = 0;
+	sta->group_info.cnt = 0;
+	sta->group_info.active.next = LIST_POISON1;
+	sta->group_info.update.next = LIST_POISON1;
+	sta->group_info.last_update = 0;
+	sta->group_info.traffic = 0;
+	sta->group_info.group = 0;
+
+	if (!vht_cap ||
+	    !(le32_to_cpu(vht_cap->vht_cap_info) &
+	      IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE)) {
+		sta->group_info.map = AICWF_SU_GROUP;
+	}
+}
+
+/**
+ * aicwf_mu_group_sta_del - Remove a sta from all MU group
+ *
+ * @aicwf_hw: main driver data
+ * @sta: STA to remove
+ *
+ * Remove one sta from all the MU groups it belongs to.
+ */
+void aicwf_mu_group_sta_del(struct aicwf_hw *aicwf_hw, struct aicwf_sta *sta)
+{
+	struct aicwf_mu_info *mu = &aicwf_hw->mu;
+	int i, j, group_id;
+	bool lock_taken;
+	u64 map;
+
+	lock_taken = (down_interruptible(&mu->lock) == 0);
+
+	map = sta->group_info.map & AICWF_MU_GROUP_MASK;
+	for (group_id = (fls64(map) - 1); group_id > 0;
+	     map &= ~(u64)BIT_ULL(group_id), group_id = (fls64(map) - 1)) {
+		struct aicwf_mu_group *group = aicwf_mu_group_from_id(mu, group_id);
+
+		for (i = 0; i < NX_USER_MAX && group->users[i] == sta; i++) {
+			group->users[i] = NULL;
+			group->user_cnt--;
+			/* Don't keep group with only one user */
+			if (group->user_cnt == 1) {
+				for (j = 0; j < NX_USER_MAX && group->users[j]; j++) {
+					group->users[j]->group_info.cnt--;
+					group->users[j]->group_info.map &=
+						~BIT_ULL(group->group_id);
+					if (group->users[j]->group_info.group == group_id)
+						group->users[j]->group_info.group = 0;
+					group->user_cnt--;
+					break;
+				}
+				mu->group_cnt--;
+				trace_mu_group_delete(group->group_id);
+			} else {
+				trace_mu_group_update(group);
+			}
+			break;
+		}
+
+		WARN((i == NX_USER_MAX), "sta %d doesn't belongs to group %d",
+		     sta->sta_idx, group_id);
+	}
+
+	sta->group_info.map = 0;
+	sta->group_info.cnt = 0;
+	sta->group_info.traffic = 0;
+
+	if (sta->group_info.active.next != LIST_POISON1)
+		list_del(&sta->group_info.active);
+
+	if (sta->group_info.update.next != LIST_POISON1)
+		list_del(&sta->group_info.update);
+
+	if (lock_taken)
+		up(&mu->lock);
+}
+
+/**
+ * aicwf_mu_group_sta_get_map - Get the list of group a STA belongs to
+ *
+ * @sta: pointer to the sta
+ *
+ * Return: Bitfield of groups to which the STA belongs, or 0 for a NULL STA.
+ */
+u64 aicwf_mu_group_sta_get_map(struct aicwf_sta *sta)
+{
+	if (sta)
+		return sta->group_info.map;
+	return 0;
+}
+
+/**
+ * aicwf_mu_group_sta_get_pos - Get sta position in a group
+ *
+ * @aicwf_hw: main driver data
+ * @sta: pointer to the sta
+ * @group_id: Group id
+ *
+ * Return: Position of @sta in @group_id, or -1 if the STA does not belong to
+ * the group or the group identifier is invalid.
+ */
+int aicwf_mu_group_sta_get_pos(struct aicwf_hw *aicwf_hw, struct aicwf_sta *sta,
+			       int group_id)
+{
+	struct aicwf_mu_group *group;
+	int i;
+
+	group = aicwf_mu_group_from_id(&aicwf_hw->mu, group_id);
+	if (!group)
+		return -1;
+
+	for (i = 0; i < NX_USER_MAX; i++) {
+		if (group->users[i] == sta)
+			return i;
+	}
+
+	WARN(1, "sta %d doesn't belongs to group %d", sta->sta_idx, group_id);
+	return -1;
+}
+
+/**
+ * aicwf_mu_group_move_head - Move (or add) one element at the top of a list
+ *
+ * @list: list pointer
+ * @elem: element to move (or add) at the top of @list
+ *
+ */
+static inline void aicwf_mu_group_move_head(struct list_head *list,
+					    struct list_head *elem)
+{
+	if (elem->next != LIST_POISON1)
+		__list_del_entry(elem);
+
+	list_add(elem, list);
+}
+
+/**
+ * aicwf_mu_group_remove_users - Remove all the users of a group
+ *
+ * @mu: pointer on MU info
+ * @group: pointer on group to remove users from
+ *
+ * Loop over all users one group and remove this group from their
+ * map (and count).
+ * Each users is also added to the update_sta list, so that group info
+ * will be resent to fw for this user.
+ */
+static inline void aicwf_mu_group_remove_users(struct aicwf_mu_info *mu,
+					       struct aicwf_mu_group *group)
+{
+	struct aicwf_sta *sta;
+	int i, group_id = group->group_id;
+
+	for (i = 0; i < NX_USER_MAX && group->users[i]; i++) {
+		sta = group->users[i];
+		group->users[i] = NULL;
+		sta->group_info.cnt--;
+		sta->group_info.map &= ~BIT_ULL(group_id);
+		aicwf_mu_group_move_head(&mu->update_sta, &sta->group_info.update);
+	}
+
+	if (group->user_cnt)
+		mu->group_cnt--;
+	group->user_cnt = 0;
+	trace_mu_group_delete(group_id);
+}
+
+/**
+ * aicwf_mu_group_add_users - Add users to a group
+ *
+ * @mu: pointer on MU info
+ * @group: pointer on group to add users in
+ * @nb_user: number of users to ad
+ * @users: table of user to add
+ *
+ * Add @nb_users to @group (which may already have users)
+ * Each new users is added to the first free position.
+ * It is assume that @group has at least @nb_user free position. If it is not
+ * case it only add the number of users needed to complete the group.
+ * Each users (effectively added to @group) is also added to the update_sta
+ * list, so that group info will be resent to fw for this user.
+ */
+static inline void aicwf_mu_group_add_users(struct aicwf_mu_info *mu,
+					    struct aicwf_mu_group *group,
+					    int nb_user, struct aicwf_sta **users)
+{
+	int i, j, group_id = group->group_id;
+
+	if (!group->user_cnt)
+		mu->group_cnt++;
+
+	j = 0;
+
+	for (i = 0; i < nb_user; i++) {
+		for (; j < NX_USER_MAX; j++) {
+			if (!group->users[j]) {
+				group->users[j] = users[i];
+				users[i]->group_info.cnt++;
+				users[i]->group_info.map |= BIT_ULL(group_id);
+
+				aicwf_mu_group_move_head(&mu->update_sta,
+							 &users[i]->group_info.update);
+				group->user_cnt++;
+				j++;
+				break;
+			}
+
+			WARN(j == (NX_USER_MAX - 1),
+			     "Too many user for group %d (nb_user=%d)", group_id,
+			     group->user_cnt + nb_user - i);
+		}
+	}
+
+	trace_mu_group_update(group);
+}
+
+/*
+ * aicwf_mu_group_create_one - create on group with a specific group of user
+ *
+ * @mu: pointer on MU info
+ * @nb_user: number of user to include in the group (<= NX_USER_MAX)
+ * @users: table of users
+ *
+ * Try to create a new group with a specific group of users.
+ * 1- First it checks if a group containing all this users already exists.
+ *
+ * 2- Then it checks if it is possible to complete a group which already
+ *    contains at least one user.
+ *
+ * 3- Finally it create a new group. To do so, it take the last group of
+ *    the active_groups list, remove all its current users and add the new ones
+ *
+ * In all cases, the group selected is moved at the top of the active_groups
+ * list
+ *
+ * @return 1 if a new group has been created and 0 otherwise
+ */
+static int aicwf_mu_group_create_one(struct aicwf_mu_info *mu, int nb_user,
+				     struct aicwf_sta **users, int *nb_group_left)
+{
+	int i, group_id;
+	struct aicwf_mu_group *group;
+	u64 group_match;
+#if NX_USER_MAX > 2
+	u64 group_avail;
+#endif
+
+	group_match = users[0]->group_info.map;
+#if NX_USER_MAX > 2
+	group_avail = users[0]->group_info.map;
+#endif
+	for (i = 1; i < nb_user; i++) {
+		group_match &= users[i]->group_info.map;
+#if NX_USER_MAX > 2
+		group_avail |= users[i]->group_info.map;
+#endif
+	}
+
+	if (group_match) {
+		/* a group (or more) with all the users already exist */
+		group_id = AICWF_GET_FIRST_GROUP_ID(group_match);
+		group = aicwf_mu_group_from_id(mu, group_id);
+		aicwf_mu_group_move_head(&mu->active_groups, &group->list);
+		return 0;
+	}
+#if NX_USER_MAX > 2
+	if (group_avail) {
+		/* check if we can complete a group */
+		struct aicwf_sta *users2[NX_USER_MAX];
+		int nb_user2;
+
+		for (group_id = (fls64(group_avail) - 1); group_id > 0;
+		     group_avail &= ~(u64)BIT_ULL(group_id),
+		     group_id = (fls64(group_avail) - 1)) {
+			group = aicwf_mu_group_from_id(mu, group_id);
+			if (group->user_cnt == NX_USER_MAX)
+				continue;
+
+			nb_user2 = 0;
+			for (i = 0; i < nb_user; i++) {
+				if (!(users[i]->group_info.map & BIT_ULL(group_id))) {
+					users2[nb_user2] = users[i];
+					nb_user2++;
+				}
+			}
+
+			if ((group->user_cnt + nb_user2) <= NX_USER_MAX) {
+				aicwf_mu_group_add_users(mu, group, nb_user2, users2);
+				aicwf_mu_group_move_head(&mu->active_groups, &group->list);
+				return 0;
+			}
+		}
+	}
+#endif /* NX_USER_MAX > 2 */
+
+	/* create a new group */
+	group = list_last_entry(&mu->active_groups, struct aicwf_mu_group, list);
+	aicwf_mu_group_remove_users(mu, group);
+	aicwf_mu_group_add_users(mu, group, nb_user, users);
+	aicwf_mu_group_move_head(&mu->active_groups, &group->list);
+	(*nb_group_left)--;
+
+	return 1;
+}
+
+/**
+ * aicwf_mu_group_create - Create new groups containing one specific sta
+ *
+ * @mu: pointer on MU info
+ * @sta: sta to add in each group
+ * @nb_group_left: maximum number to new group allowed. (updated on exit)
+ *
+ * This will try to create "all the possible" group with a specific sta being
+ * a member of all these group.
+ * The function simply loops over the @active_sta list (starting from @sta).
+ * When it has (NX_USER_MAX - 1) users it try to create a new group with
+ * these users (plus @sta).
+ * Loops end when there is no more users, or no more new group is allowed
+ *
+ */
+static void aicwf_mu_group_create(struct aicwf_mu_info *mu, struct aicwf_sta *sta,
+				  int *nb_group_left)
+{
+	struct aicwf_sta *user_sta = sta;
+	struct aicwf_sta *users[NX_USER_MAX];
+	int nb_user = 1;
+
+	users[0] = sta;
+	while (*nb_group_left) {
+		list_for_each_entry_continue(user_sta, &mu->active_sta,
+					     group_info.active) {
+			users[nb_user] = user_sta;
+			if (++nb_user == NX_USER_MAX)
+				break;
+		}
+
+		if (nb_user > 1) {
+			if (aicwf_mu_group_create_one(mu, nb_user, users, nb_group_left))
+				(*nb_group_left)--;
+
+			if (nb_user < NX_USER_MAX)
+				break;
+			nb_user = 1;
+		} else {
+			break;
+		}
+	}
+}
+
+/*
+ * aicwf_mu_group_work - process function of the "group_work"
+ *
+ * The work is scheduled when several sta (MU beamformee capable) are active.
+ * When called, the @active_sta contains the list of the active sta (starting
+ * from the most recent one), and @active_groups is the list of all possible
+ * groups ordered so that the first one is the most recently used.
+ *
+ * This function will create new groups, starting from group containing the
+ * most "active" sta.
+ * For example if the list of sta is :
+ * sta8 -> sta3 -> sta4 -> sta7 -> sta1
+ * and the number of user per group is 3, it will create grooups :
+ * - sta8 / sta3 / sta4
+ * - sta8 / sta7 / sta1
+ * - sta3 / sta4 / sta7
+ * - sta3 / sta1
+ * - sta4 / sta7 / sta1
+ * - sta7 / sta1
+ *
+ * To create new group, the least used group are first selected.
+ * It is only allowed to create NX_MU_GROUP_MAX per iteration.
+ *
+ * Once groups have been updated, mu group information is update to the fw.
+ * To do so it use the @update_sta list to know which sta has been affected.
+ * As it is necessary to wait for fw confirmation before using this new group
+ * MU is temporarily disabled during group update
+ *
+ * Work is then rescheduled.
+ *
+ * At the end of the function, both @active_sta and @update_sta list are empty.
+ *
+ * Note:
+ * - This is still a WIP, and will require more tuning
+ * - not all combinations are created, to avoid to much processing.
+ * - reschedule delay should be adaptative
+ */
+static void aicwf_mu_group_work(struct work_struct *ws)
+{
+	struct delayed_work *dw = container_of(ws, struct delayed_work, work);
+	struct aicwf_mu_info *mu = container_of(dw, struct aicwf_mu_info, group_work);
+	struct aicwf_hw *aicwf_hw = container_of(mu, struct aicwf_hw, mu);
+	struct aicwf_sta *sta, *next;
+	int nb_group_left = NX_MU_GROUP_MAX;
+
+	if (WARN(!aicwf_hw->mod_params->mutx,
+		 "In group formation work, but mutx disabled"))
+		return;
+
+	if (down_interruptible(&mu->lock) != 0)
+		return;
+
+	mu->update_count++;
+	if (!mu->update_count)
+		mu->update_count++;
+
+	list_for_each_entry_safe(sta, next, &mu->active_sta, group_info.active) {
+		if (nb_group_left)
+			aicwf_mu_group_create(mu, sta, &nb_group_left);
+
+		sta->group_info.last_update = mu->update_count;
+		list_del(&sta->group_info.active);
+	}
+
+	if (!list_empty(&mu->update_sta)) {
+		list_for_each_entry_safe(sta, next, &mu->update_sta, group_info.update)	{
+			aicwf_send_mu_group_update_req(aicwf_hw, sta);
+			list_del(&sta->group_info.update);
+		}
+	}
+
+	mu->next_group_select = jiffies;
+	aicwf_mu_group_sta_select(aicwf_hw);
+	up(&mu->lock);
+}
+
+/**
+ * aicwf_mu_group_init - Initialize MU groups
+ *
+ * @aicwf_hw: main driver data
+ *
+ * Initialize all MU group
+ */
+void aicwf_mu_group_init(struct aicwf_hw *aicwf_hw)
+{
+	struct aicwf_mu_info *mu = &aicwf_hw->mu;
+	int i;
+
+	INIT_LIST_HEAD(&mu->active_groups);
+	INIT_LIST_HEAD(&mu->active_sta);
+	INIT_LIST_HEAD(&mu->update_sta);
+
+	for (i = 0; i < NX_MU_GROUP_MAX; i++) {
+		int j;
+
+		mu->groups[i].user_cnt = 0;
+		mu->groups[i].group_id = i + 1;
+		for (j = 0; j < NX_USER_MAX; j++)
+			mu->groups[i].users[j] = NULL;
+		list_add(&mu->groups[i].list, &mu->active_groups);
+	}
+
+	mu->update_count = 1;
+	mu->group_cnt = 0;
+	mu->next_group_select = jiffies;
+	INIT_DELAYED_WORK(&mu->group_work, aicwf_mu_group_work);
+	sema_init(&mu->lock, 1);
+}
+
+/**
+ * aicwf_mu_set_active_sta - mark a STA as active
+ *
+ * @aicwf_hw: main driver data
+ * @sta: pointer to the sta
+ * @traffic: Number of buffers to add in the sta's traffic counter
+ *
+ * If @sta is MU beamformee capable (and MU-MIMO tx is enabled) move the
+ * sta at the top of the @active_sta list.
+ * It also schedule the group_work if not already scheduled and the list
+ * contains more than one sta.
+ *
+ * If a STA was already in the list during the last group update
+ * (i.e. sta->group_info.last_update == mu->update_count) it is not added
+ * back to the list until a sta that wasn't active during the last update is
+ * added. This is to avoid scheduling group update with a list of sta that
+ * were all already in the list during previous update.
+ *
+ * It is called with mu->lock taken.
+ */
+void aicwf_mu_set_active_sta(struct aicwf_hw *aicwf_hw, struct aicwf_sta *sta,
+			     int traffic)
+{
+	struct aicwf_mu_info *mu = &aicwf_hw->mu;
+
+	if (!sta || (sta->group_info.map & AICWF_SU_GROUP))
+		return;
+
+	sta->group_info.traffic += traffic;
+
+	if (sta->group_info.last_update != mu->update_count ||
+	    !list_empty(&mu->active_sta)) {
+		aicwf_mu_group_move_head(&mu->active_sta, &sta->group_info.active);
+
+		if (!delayed_work_pending(&mu->group_work) &&
+		    !list_is_singular(&mu->active_sta)) {
+			schedule_delayed_work(&mu->group_work,
+					      msecs_to_jiffies(AICWF_MU_GROUP_INTERVAL));
+		}
+	}
+}
+
+/**
+ * aicwf_mu_set_active_group - mark a MU group as active
+ *
+ * @aicwf_hw: main driver data
+ * @group_id: Group id
+ *
+ * move a group at the top of the @active_groups list
+ */
+void aicwf_mu_set_active_group(struct aicwf_hw *aicwf_hw, int group_id)
+{
+	struct aicwf_mu_info *mu = &aicwf_hw->mu;
+	struct aicwf_mu_group *group = aicwf_mu_group_from_id(mu, group_id);
+
+	aicwf_mu_group_move_head(&mu->active_groups, &group->list);
+}
+
+/**
+ * aicwf_mu_group_sta_select - Select the best group for MU stas
+ *
+ * @aicwf_hw: main driver data
+ *
+ * For each MU capable client of AP interfaces this function tries to select
+ * the best group to use.
+ *
+ * In first pass, gather information from all stations to form statistics
+ * for each group for the previous @AICWF_MU_GROUP_SELECT_INTERVAL interval:
+ * - number of buffers transmitted
+ * - number of user
+ *
+ * Then groups with more than 2 active users, are assigned after being ordered
+ * by traffic :
+ * - group with highest traffic is selected: set this group for all its users
+ * - update nb_users for all others group (as one sta may be in several groups)
+ * - select the next group that have still mor than 2 users and assign it.
+ * - continue until all group are processed
+ *
+ */
+void aicwf_mu_group_sta_select(struct aicwf_hw *aicwf_hw)
+{
+	struct aicwf_mu_info *mu = &aicwf_hw->mu;
+	int nb_users[NX_MU_GROUP_MAX + 1];
+	int traffic[NX_MU_GROUP_MAX + 1];
+	int order[NX_MU_GROUP_MAX + 1];
+	struct aicwf_sta *sta;
+	struct aicwf_vif *vif;
+	struct list_head *head;
+	u64 map;
+	int i, j, update, group_id, tmp, cnt = 0;
+
+	if (!mu->group_cnt || time_before(jiffies, mu->next_group_select))
+		return;
+
+	list_for_each_entry(vif, &aicwf_hw->vifs, list) {
+		if (AICWF_VIF_TYPE(vif) != NL80211_IFTYPE_AP)
+			continue;
+
+#ifdef CONFIG_AICWF_FULLMAC
+		head = &vif->ap.sta_list;
+#else
+		head = &vif->stations;
+#endif /* CONFIG_AICWF_FULLMAC */
+
+		memset(nb_users, 0, sizeof(nb_users));
+		memset(traffic, 0, sizeof(traffic));
+		list_for_each_entry(sta, head, list) {
+			int sta_traffic = sta->group_info.traffic;
+
+			/* reset statistics for next selection */
+			sta->group_info.traffic = 0;
+			if (sta->group_info.group)
+				trace_mu_group_selection(sta, 0);
+			sta->group_info.group = 0;
+
+			if (sta->group_info.cnt == 0 ||
+			    sta_traffic < AICWF_MU_GROUP_MIN_TRAFFIC)
+				continue;
+
+			map = sta->group_info.map & AICWF_MU_GROUP_MASK;
+			for (group_id = (fls64(map) - 1); group_id > 0;
+			     map &= ~(u64)BIT_ULL(group_id), group_id = (fls64(map) - 1)) {
+				nb_users[group_id]++;
+				traffic[group_id] += sta_traffic;
+
+				/* list group with 2 users or more */
+				if (nb_users[group_id] == 2)
+					order[cnt++] = group_id;
+			}
+		}
+
+		/* reorder list of group with more that 2 users */
+		update = 1;
+		while (update) {
+			update = 0;
+			for (i = 0; i < cnt - 1; i++) {
+				if (traffic[order[i]] < traffic[order[i + 1]]) {
+					tmp = order[i];
+					order[i] = order[i + 1];
+					order[i + 1] = tmp;
+					update = 1;
+				}
+			}
+		}
+
+		/* now assign group in traffic order */
+		for (i = 0; i < cnt; i++) {
+			struct aicwf_mu_group *group;
+
+			group_id = order[i];
+			if (nb_users[group_id] < 2)
+				continue;
+
+			group = aicwf_mu_group_from_id(mu, group_id);
+			for (j = 0; j < NX_USER_MAX && group->users[j]; j++) {
+				trace_mu_group_selection(group->users[j], group_id);
+				group->users[j]->group_info.group = group_id;
+
+				map = group->users[j]->group_info.map & AICWF_MU_GROUP_MASK;
+				for (tmp = (fls64(map) - 1); tmp > 0;
+				     map &= ~(u64)BIT_ULL(tmp), tmp = (fls64(map) - 1)) {
+					if (group_id != tmp)
+						nb_users[tmp]--;
+				}
+			}
+		}
+	}
+
+	mu->next_group_select =
+		jiffies + msecs_to_jiffies(AICWF_MU_GROUP_SELECT_INTERVAL);
+	mu->next_group_select |= 1;
+}
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_radar.c b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_radar.c
new file mode 100644
index 000000000000..c682c4f192a7
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_radar.c
@@ -0,0 +1,1969 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ ******************************************************************************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @file aicwf_radar.c
+ *
+ * @brief Functions to handle radar detection
+ * Radar detection is copied (and adapted) from ath driver source code.
+ *
+ ******************************************************************************
+ */
+#include <linux/kernel.h>
+#include <linux/ktime.h>
+#include <linux/list.h>
+#include <net/mac80211.h>
+
+#include "aicwf_defs.h"
+#include "aicwf_events.h"
+#include "aicwf_msg_tx.h"
+#include "aicwf_radar.h"
+
+/*
+ * tolerated deviation of radar time stamp in usecs on both sides
+ * TODO: this might need to be HW-dependent
+ */
+#define PRI_TOLERANCE 16
+
+/**
+ * struct radar_types - contains array of patterns defined for one DFS domain
+ * @region: DFS regulatory domain
+ * @num_radar_types: number of radar types to follow
+ * @spec_riu: radar patterns for the RIU detector
+ * @spec_fcu: radar patterns for the FCU detector
+ */
+struct radar_types {
+	enum nl80211_dfs_regions region;
+	u32 num_radar_types;
+	const struct radar_detector_specs *spec_riu;
+	const struct radar_detector_specs *spec_fcu;
+};
+
+/* percentage on ppb threshold to trigger detection */
+#define MIN_PPB_THRESH  50
+#define PPB_THRESH(PPB) (((PPB) * MIN_PPB_THRESH + 50) / 100)
+//#define PRF2PRI(PRF)    ((1000000 + (PRF) / 2) / (PRF))
+#define PRF2PRI(PRF) \
+	({ \
+		typeof(PRF) _prf = (PRF); \
+		((1000000 + (_prf) / 2) / (_prf)); \
+	})
+
+/* width tolerance */
+#define WIDTH_TOLERANCE 2
+#define WIDTH_LOWER(X)  (X)
+#define WIDTH_UPPER(X)  (X)
+
+static inline struct radar_detector_specs
+	ETSI_PATTERN_SHORT(u8 ID, u8 WMIN, u8 WMAX, u16 PMIN, u16 PMAX, u8 PPB)
+{
+	struct radar_detector_specs spec = {
+		.type_id = ID,
+		.width_min = WIDTH_LOWER(WMIN),
+		.width_max = WIDTH_UPPER(WMAX),
+		.pri_min = (PRF2PRI(PMAX) - PRI_TOLERANCE),
+		.pri_max = (PRF2PRI(PMIN) + PRI_TOLERANCE),
+		.num_pri = 1,
+		.ppb = PPB,
+		.ppb_thresh = PPB_THRESH(PPB),
+		.max_pri_tolerance = PRI_TOLERANCE,
+		.type = RADAR_WAVEFORM_SHORT
+	};
+	return spec;
+}
+
+static inline struct radar_detector_specs
+	ETSI_PATTERN_INTERLEAVED(u8 ID, u8 WMIN, u8 WMAX, u16 PMIN, u16 PMAX,
+				 u16 PRFMIN, u16 PRFMAX, u8 PPB)
+{
+	struct radar_detector_specs spec = {
+		.type_id = ID,
+		.width_min = WIDTH_LOWER(WMIN),
+		.width_max = WIDTH_UPPER(WMAX),
+		.pri_min = (PRF2PRI(PMAX) * (PRFMIN) - PRI_TOLERANCE),
+		.pri_max = (PRF2PRI(PMIN) * (PRFMAX) + PRI_TOLERANCE),
+		.num_pri = PRFMAX,
+		.ppb = (PPB) * (PRFMAX),
+		.ppb_thresh = PPB_THRESH(PPB),
+		.max_pri_tolerance = PRI_TOLERANCE,
+		.type = RADAR_WAVEFORM_INTERLEAVED
+	};
+	return spec;
+}
+
+/* radar types as defined by ETSI EN-301-893 v1.7.1 */
+static const struct radar_detector_specs etsi_radar_ref_types_v17_riu[] = {
+	{0,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 (((1000000 + (700) / 2) / (700)) - PRI_TOLERANCE),
+	 (((1000000 + (700) / 2) / (700)) + PRI_TOLERANCE),
+	 1,
+	 18,
+	 PPB_THRESH(18),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{1,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(10),
+	 (((1000000 + (1000) / 2) / (1000)) - PRI_TOLERANCE),
+	 (((1000000 + (200) / 2) / (200)) + PRI_TOLERANCE),
+	 1,
+	 10,
+	 PPB_THRESH(10),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{2,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(22),
+	 (((1000000 + (1600) / 2) / (1600)) - PRI_TOLERANCE),
+	 (((1000000 + (200) / 2) / (200)) + PRI_TOLERANCE),
+	 1,
+	 15,
+	 PPB_THRESH(15),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{3,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(22),
+	 (((1000000 + (4000) / 2) / (4000)) - PRI_TOLERANCE),
+	 (((1000000 + (2300) / 2) / (2300)) + PRI_TOLERANCE),
+	 1,
+	 25,
+	 PPB_THRESH(25),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{4,
+	 WIDTH_LOWER(20),
+	 WIDTH_UPPER(38),
+	 (((1000000 + (4000) / 2) / (4000)) - PRI_TOLERANCE),
+	 (((1000000 + (2000) / 2) / (2000)) + PRI_TOLERANCE),
+	 1,
+	 20,
+	 PPB_THRESH(20),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{5,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 (((1000000 + (400) / 2) / (400)) * 2 - PRI_TOLERANCE),
+	 (((1000000 + (300) / 2) / (300)) * 3 + PRI_TOLERANCE),
+	 3,
+	 10 * 3,
+	 PPB_THRESH(10),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_INTERLEAVED},
+	{6,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 (((1000000 + (1200) / 2) / (1200)) * 2 - PRI_TOLERANCE),
+	 (((1000000 + (400) / 2) / (400)) * 3 + PRI_TOLERANCE),
+	 3,
+	 15 * 3,
+	 PPB_THRESH(15),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_INTERLEAVED},
+};
+
+static const struct radar_detector_specs etsi_radar_ref_types_v17_fcu[] = {
+	{0,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 (((1000000 + (700) / 2) / (700)) - PRI_TOLERANCE),
+	 (((1000000 + (700) / 2) / (700)) + PRI_TOLERANCE),
+	 1,
+	 18,
+	 PPB_THRESH(18),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{1,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 (((1000000 + (1000) / 2) / (1000)) - PRI_TOLERANCE),
+	 (((1000000 + (200) / 2) / (200)) + PRI_TOLERANCE),
+	 1,
+	 10,
+	 PPB_THRESH(10),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{2,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(16),
+	 (((1000000 + (1600) / 2) / (1600)) - PRI_TOLERANCE),
+	 (((1000000 + (200) / 2) / (200)) + PRI_TOLERANCE),
+	 1,
+	 15,
+	 PPB_THRESH(15),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{3,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(16),
+	 (((1000000 + (4000) / 2) / (4000)) - PRI_TOLERANCE),
+	 (((1000000 + (2300) / 2) / (2300)) + PRI_TOLERANCE),
+	 1,
+	 25,
+	 PPB_THRESH(25),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{4,
+	 WIDTH_LOWER(20),
+	 WIDTH_UPPER(34),
+	 (((1000000 + (4000) / 2) / (4000)) - PRI_TOLERANCE),
+	 (((1000000 + (2000) / 2) / (2000)) + PRI_TOLERANCE),
+	 1,
+	 20,
+	 PPB_THRESH(20),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{5,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 (((1000000 + (400) / 2) / (400)) * 2 - PRI_TOLERANCE),
+	 (((1000000 + (300) / 2) / (300)) * 3 + PRI_TOLERANCE),
+	 3,
+	 10 * 3,
+	 PPB_THRESH(10),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_INTERLEAVED},
+	{6,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 (((1000000 + (1200) / 2) / (1200)) * 2 - PRI_TOLERANCE),
+	 (((1000000 + (400) / 2) / (400)) * 3 + PRI_TOLERANCE),
+	 3,
+	 15 * 3,
+	 PPB_THRESH(15),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_INTERLEAVED},
+};
+
+static const struct radar_types etsi_radar_types_v17 = {
+	.region = NL80211_DFS_ETSI,
+	.num_radar_types = ARRAY_SIZE(etsi_radar_ref_types_v17_riu),
+	.spec_riu = etsi_radar_ref_types_v17_riu,
+	.spec_fcu = etsi_radar_ref_types_v17_fcu,
+};
+
+static inline struct radar_detector_specs
+	FCC_PATTERN(u8 ID, u8 WMIN, u8 WMAX, u16 PMIN, u16 PMAX,
+		    u16 PRF, u8 PPB, enum radar_waveform_type TYPE)
+{
+	struct radar_detector_specs spec = {
+		.type_id = ID,
+		.width_min = WIDTH_LOWER(WMIN),
+		.width_max = WIDTH_UPPER(WMAX),
+		.pri_min = (PMIN) - PRI_TOLERANCE,
+		.pri_max = (PMAX) * (PRF) + PRI_TOLERANCE,
+		.num_pri = PRF,
+		.ppb = (PPB) * (PRF),
+		.ppb_thresh = PPB_THRESH(PPB),
+		.max_pri_tolerance = PRI_TOLERANCE,
+		.type = TYPE
+	};
+	return spec;
+}
+
+static const struct radar_detector_specs fcc_radar_ref_types_riu[] = {
+	{0,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 1428 - PRI_TOLERANCE,
+	 1428 * 1 + PRI_TOLERANCE,
+	 1,
+	 18 * 1,
+	 PPB_THRESH(18),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{1,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 518 - PRI_TOLERANCE,
+	 3066 * 1 + PRI_TOLERANCE,
+	 1,
+	 102 * 1,
+	 PPB_THRESH(102),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_WEATHER},
+	{2,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 150 - PRI_TOLERANCE,
+	 230 * 1 + PRI_TOLERANCE,
+	 1,
+	 23 * 1,
+	 PPB_THRESH(23),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{3,
+	 WIDTH_LOWER(6),
+	 WIDTH_UPPER(20),
+	 200 - PRI_TOLERANCE,
+	 500 * 1 + PRI_TOLERANCE,
+	 1,
+	 16 * 1,
+	 PPB_THRESH(16),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{4,
+	 WIDTH_LOWER(10),
+	 WIDTH_UPPER(28),
+	 200 - PRI_TOLERANCE,
+	 500 * 1 + PRI_TOLERANCE,
+	 1,
+	 12 * 1,
+	 PPB_THRESH(12),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{5,
+	 WIDTH_LOWER(50),
+	 WIDTH_UPPER(110),
+	 1000 - PRI_TOLERANCE,
+	 2000 * 1 + PRI_TOLERANCE,
+	 1,
+	 8 * 1,
+	 PPB_THRESH(8),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_LONG},
+	{6,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 333 - PRI_TOLERANCE,
+	 333 * 1 + PRI_TOLERANCE,
+	 1,
+	 9 * 1,
+	 PPB_THRESH(9),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+};
+
+static const struct radar_detector_specs fcc_radar_ref_types_fcu[] = {
+	{0,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 1428 - PRI_TOLERANCE,
+	 1428 * 1 + PRI_TOLERANCE,
+	 1,
+	 18 * 1,
+	 PPB_THRESH(18),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{1,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 518 - PRI_TOLERANCE,
+	 3066 * 1 + PRI_TOLERANCE,
+	 1,
+	 102 * 1,
+	 PPB_THRESH(102),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_WEATHER},
+	{2,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 150 - PRI_TOLERANCE,
+	 230 * 1 + PRI_TOLERANCE,
+	 1,
+	 23 * 1,
+	 PPB_THRESH(23),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{3,
+	 WIDTH_LOWER(6),
+	 WIDTH_UPPER(12),
+	 200 - PRI_TOLERANCE,
+	 500 * 1 + PRI_TOLERANCE,
+	 1,
+	 16 * 1,
+	 PPB_THRESH(16),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{4,
+	 WIDTH_LOWER(10),
+	 WIDTH_UPPER(22),
+	 200 - PRI_TOLERANCE,
+	 500 * 1 + PRI_TOLERANCE,
+	 1,
+	 12 * 1,
+	 PPB_THRESH(12),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{5,
+	 WIDTH_LOWER(50),
+	 WIDTH_UPPER(104),
+	 1000 - PRI_TOLERANCE,
+	 2000 * 1 + PRI_TOLERANCE,
+	 1,
+	 8 * 1,
+	 PPB_THRESH(8),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_LONG},
+	{6,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 333 - PRI_TOLERANCE,
+	 333 * 1 + PRI_TOLERANCE,
+	 1,
+	 9 * 1,
+	 PPB_THRESH(9),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+};
+
+static const struct radar_types fcc_radar_types = {
+	.region = NL80211_DFS_FCC,
+	.num_radar_types = ARRAY_SIZE(fcc_radar_ref_types_riu),
+	.spec_riu = fcc_radar_ref_types_riu,
+	.spec_fcu = fcc_radar_ref_types_fcu,
+};
+
+#define JP_PATTERN FCC_PATTERN
+static const struct radar_detector_specs jp_radar_ref_types_riu[] = {
+	{0,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 1428 - PRI_TOLERANCE,
+	 1428 * 1 + PRI_TOLERANCE,
+	 1,
+	 18 * 1,
+	 PPB_THRESH(18),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{1,
+	 WIDTH_LOWER(2),
+	 WIDTH_UPPER(8),
+	 3846 - PRI_TOLERANCE,
+	 3846 * 1 + PRI_TOLERANCE,
+	 1,
+	 18 * 1,
+	 PPB_THRESH(18),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{2,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 1388 - PRI_TOLERANCE,
+	 1388 * 1 + PRI_TOLERANCE,
+	 1,
+	 18 * 1,
+	 PPB_THRESH(18),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{3,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 4000 - PRI_TOLERANCE,
+	 4000 * 1 + PRI_TOLERANCE,
+	 1,
+	 18 * 1,
+	 PPB_THRESH(18),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{4,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 150 - PRI_TOLERANCE,
+	 230 * 1 + PRI_TOLERANCE,
+	 1,
+	 23 * 1,
+	 PPB_THRESH(23),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{5,
+	 WIDTH_LOWER(6),
+	 WIDTH_UPPER(20),
+	 200 - PRI_TOLERANCE,
+	 500 * 1 + PRI_TOLERANCE,
+	 1,
+	 16 * 1,
+	 PPB_THRESH(16),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{6,
+	 WIDTH_LOWER(10),
+	 WIDTH_UPPER(28),
+	 200 - PRI_TOLERANCE,
+	 500 * 1 + PRI_TOLERANCE,
+	 1,
+	 12 * 1,
+	 PPB_THRESH(12),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{7,
+	 WIDTH_LOWER(50),
+	 WIDTH_UPPER(110),
+	 1000 - PRI_TOLERANCE,
+	 2000 * 1 + PRI_TOLERANCE,
+	 1,
+	 8 * 1,
+	 PPB_THRESH(8),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_LONG},
+	{8,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 333 - PRI_TOLERANCE,
+	 333 * 1 + PRI_TOLERANCE,
+	 1,
+	 9 * 1,
+	 PPB_THRESH(9),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+};
+
+static const struct radar_detector_specs jp_radar_ref_types_fcu[] = {
+	{0,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 1428 - PRI_TOLERANCE,
+	 1428 * 1 + PRI_TOLERANCE,
+	 1,
+	 18 * 1,
+	 PPB_THRESH(18),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{1,
+	 WIDTH_LOWER(2),
+	 WIDTH_UPPER(6),
+	 3846 - PRI_TOLERANCE,
+	 3846 * 1 + PRI_TOLERANCE,
+	 1,
+	 18 * 1,
+	 PPB_THRESH(18),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{2,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 1388 - PRI_TOLERANCE,
+	 1388 * 1 + PRI_TOLERANCE,
+	 1,
+	 18 * 1,
+	 PPB_THRESH(18),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{3,
+	 WIDTH_LOWER(2),
+	 WIDTH_UPPER(2),
+	 4000 - PRI_TOLERANCE,
+	 4000 * 1 + PRI_TOLERANCE,
+	 1,
+	 18 * 1,
+	 PPB_THRESH(18),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{4,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 150 - PRI_TOLERANCE,
+	 230 * 1 + PRI_TOLERANCE,
+	 1,
+	 23 * 1,
+	 PPB_THRESH(23),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{5,
+	 WIDTH_LOWER(6),
+	 WIDTH_UPPER(12),
+	 200 - PRI_TOLERANCE,
+	 500 * 1 + PRI_TOLERANCE,
+	 1,
+	 16 * 1,
+	 PPB_THRESH(16),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{6,
+	 WIDTH_LOWER(10),
+	 WIDTH_UPPER(22),
+	 200 - PRI_TOLERANCE,
+	 500 * 1 + PRI_TOLERANCE,
+	 1,
+	 12 * 1,
+	 PPB_THRESH(12),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+	{7,
+	 WIDTH_LOWER(50),
+	 WIDTH_UPPER(104),
+	 1000 - PRI_TOLERANCE,
+	 2000 * 1 + PRI_TOLERANCE,
+	 1,
+	 8 * 1,
+	 PPB_THRESH(8),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_LONG},
+	{8,
+	 WIDTH_LOWER(0),
+	 WIDTH_UPPER(8),
+	 333 - PRI_TOLERANCE,
+	 333 * 1 + PRI_TOLERANCE,
+	 1,
+	 9 * 1,
+	 PPB_THRESH(9),
+	 PRI_TOLERANCE,
+	 RADAR_WAVEFORM_SHORT},
+};
+
+static const struct radar_types jp_radar_types = {
+	.region = NL80211_DFS_JP,
+	.num_radar_types = ARRAY_SIZE(jp_radar_ref_types_riu),
+	.spec_riu = jp_radar_ref_types_riu,
+	.spec_fcu = jp_radar_ref_types_fcu,
+};
+
+static const struct radar_types *dfs_domains[] = {
+	&etsi_radar_types_v17,
+	&fcc_radar_types,
+	&jp_radar_types,
+};
+
+/**
+ * struct pri_detector_ops - PRI detector ops (dependent of waveform type)
+ * @init : Initialize pri_detector structure
+ * @add_pulse : Add a pulse to the pri-detector
+ * @reset_on_pri_overflow : Should the pri_detector be resetted when pri
+ * overflow
+ */
+struct pri_detector_ops {
+	void (*init)(struct pri_detector *pde);
+	struct pri_sequence *(*add_pulse)(struct pri_detector *pde, u16 len, u64 ts,
+					  u16 pri);
+	int reset_on_pri_overflow;
+};
+
+/******************************************************************************
+ * PRI (pulse repetition interval) sequence detection
+ *****************************************************************************/
+/*
+ * Singleton Pulse and Sequence Pools
+ *
+ * Instances of pri_sequence and pulse_elem are kept in singleton pools to
+ * reduce the number of dynamic allocations. They are shared between all
+ * instances and grow up to the peak number of simultaneously used objects.
+ *
+ * Memory is freed after all references to the pools are released.
+ */
+static u32 singleton_pool_references;
+static LIST_HEAD(pulse_pool);
+static LIST_HEAD(pseq_pool);
+static DEFINE_SPINLOCK(pool_lock);
+
+static void pool_register_ref(void)
+{
+	spin_lock_bh(&pool_lock);
+	singleton_pool_references++;
+	spin_unlock_bh(&pool_lock);
+}
+
+static void pool_deregister_ref(void)
+{
+	spin_lock_bh(&pool_lock);
+	singleton_pool_references--;
+	if (singleton_pool_references == 0) {
+		/* free singleton pools with no references left */
+		struct pri_sequence *ps, *ps0;
+		struct pulse_elem *p, *p0;
+
+		list_for_each_entry_safe(p, p0, &pulse_pool, head) {
+			list_del(&p->head);
+			kfree(p);
+		}
+		list_for_each_entry_safe(ps, ps0, &pseq_pool, head) {
+			list_del(&ps->head);
+			kfree(ps);
+		}
+	}
+	spin_unlock_bh(&pool_lock);
+}
+
+static void pool_put_pulse_elem(struct pulse_elem *pe)
+{
+	spin_lock_bh(&pool_lock);
+	list_add(&pe->head, &pulse_pool);
+	spin_unlock_bh(&pool_lock);
+}
+
+static void pool_put_pseq_elem(struct pri_sequence *pse)
+{
+	spin_lock_bh(&pool_lock);
+	list_add(&pse->head, &pseq_pool);
+	spin_unlock_bh(&pool_lock);
+}
+
+static struct pri_sequence *pool_get_pseq_elem(void)
+{
+	struct pri_sequence *pse = NULL;
+
+	spin_lock_bh(&pool_lock);
+	if (!list_empty(&pseq_pool)) {
+		pse = list_first_entry(&pseq_pool, struct pri_sequence, head);
+		list_del(&pse->head);
+	}
+	spin_unlock_bh(&pool_lock);
+
+	if (!pse)
+		pse = kmalloc_obj(*pse, GFP_ATOMIC);
+	return pse;
+}
+
+static struct pulse_elem *pool_get_pulse_elem(void)
+{
+	struct pulse_elem *pe = NULL;
+
+	spin_lock_bh(&pool_lock);
+	if (!list_empty(&pulse_pool)) {
+		pe = list_first_entry(&pulse_pool, struct pulse_elem, head);
+		list_del(&pe->head);
+	}
+	spin_unlock_bh(&pool_lock);
+	return pe;
+}
+
+static struct pulse_elem *pulse_queue_get_tail(struct pri_detector *pde)
+{
+	struct list_head *l = &pde->pulses;
+
+	if (list_empty(l))
+		return NULL;
+	return list_entry(l->prev, struct pulse_elem, head);
+}
+
+static bool pulse_queue_dequeue(struct pri_detector *pde)
+{
+	struct pulse_elem *p = pulse_queue_get_tail(pde);
+
+	if (p) {
+		list_del_init(&p->head);
+		pde->count--;
+		/* give it back to pool */
+		pool_put_pulse_elem(p);
+	}
+	return (pde->count > 0);
+}
+
+/**
+ * pulse_queue_check_window - remove pulses older than window
+ * @pde: pointer on pri_detector
+ *
+ *  dequeue pulse that are too old.
+ */
+static void pulse_queue_check_window(struct pri_detector *pde)
+{
+	u64 min_valid_ts;
+	struct pulse_elem *p;
+
+	/* there is no delta time with less than 2 pulses */
+	if (pde->count < 2)
+		return;
+
+	if (pde->last_ts <= pde->window_size)
+		return;
+
+	min_valid_ts = pde->last_ts - pde->window_size;
+	while ((p = pulse_queue_get_tail(pde)) != NULL) {
+		if (p->ts >= min_valid_ts)
+			return;
+		pulse_queue_dequeue(pde);
+	}
+}
+
+/*
+ * pulse_queue_enqueue - Queue one pulse
+ * @pde: pointer on pri_detector
+ *
+ * Add one pulse to the list. If the maximum number of pulses
+ * if reached, remove oldest one.
+ */
+static bool pulse_queue_enqueue(struct pri_detector *pde, u64 ts)
+{
+	struct pulse_elem *p = pool_get_pulse_elem();
+
+	if (!p) {
+		p = kmalloc_obj(*p, GFP_ATOMIC);
+		if (!p)
+			return false;
+	}
+	INIT_LIST_HEAD(&p->head);
+	p->ts = ts;
+	list_add(&p->head, &pde->pulses);
+	pde->count++;
+	pde->last_ts = ts;
+	pulse_queue_check_window(pde);
+	if (pde->count >= pde->max_count)
+		pulse_queue_dequeue(pde);
+
+	return true;
+}
+
+/***************************************************************************
+ * Short waveform
+ **************************************************************************/
+/*
+ * pde_get_multiple() - get number of multiples considering a given tolerance
+ * @return factor if abs(val - factor*fraction) <= tolerance, 0 otherwise
+ */
+static u32 pde_get_multiple(u32 val, u32 fraction, u32 tolerance)
+{
+	u32 remainder;
+	u32 factor;
+	u32 delta;
+
+	if (fraction == 0)
+		return 0;
+
+	delta = (val < fraction) ? (fraction - val) : (val - fraction);
+
+	if (delta <= tolerance)
+		/* val and fraction are within tolerance */
+		return 1;
+
+	factor = val / fraction;
+	remainder = val % fraction;
+	if (remainder > tolerance) {
+		/* no exact match */
+		if ((fraction - remainder) <= tolerance)
+			/* remainder is within tolerance */
+			factor++;
+		else
+			factor = 0;
+	}
+	return factor;
+}
+
+/**
+ * pde_short_create_sequences - create_sequences function for
+ *                              SHORT/WEATHER/INTERLEAVED radar waveform
+ * @pde: pointer on pri_detector
+ * @ts: timestamp of the pulse
+ * @min_count: Minimum number of pulse to be present in the sequence.
+ *             (With this pulse there is already a sequence with @min_count
+ *              pulse, so if we can't create a sequence with more pulse don't
+ *              create it)
+ * @return: false if an error occurred (memory allocation) true otherwise
+ *
+ * For each pulses queued check if we can create a sequence with
+ * pri = (ts - pulse_queued.ts) which contains more than @min_count pulses.
+ *
+ */
+static bool pde_short_create_sequences(struct pri_detector *pde, u64 ts,
+				       u32 min_count)
+{
+	struct pulse_elem *p;
+	u16 pulse_idx = 0;
+
+	list_for_each_entry(p, &pde->pulses, head) {
+		struct pri_sequence ps, *new_ps;
+		struct pulse_elem *p2;
+		u32 tmp_false_count;
+		u64 min_valid_ts;
+		u32 delta_ts = ts - p->ts;
+
+		pulse_idx++;
+
+		if (delta_ts < pde->rs->pri_min)
+			/* ignore too small pri */
+			continue;
+
+		if (delta_ts > pde->rs->pri_max)
+			/* stop on too large pri (sorted list) */
+			break;
+
+		/* build a new sequence with new potential pri */
+		ps.count = 2;
+		ps.count_falses = pulse_idx - 1;
+		ps.first_ts = p->ts;
+		ps.last_ts = ts;
+		ps.pri = ts - p->ts;
+		ps.dur = ps.pri * (pde->rs->ppb - 1) + 2 * pde->rs->max_pri_tolerance;
+
+		p2 = p;
+		tmp_false_count = 0;
+		if (ps.dur > ts)
+			min_valid_ts = 0;
+		else
+			min_valid_ts = ts - ps.dur;
+		/* check which past pulses are candidates for new sequence */
+		list_for_each_entry_continue(p2, &pde->pulses, head) {
+			u32 factor;
+
+			if (p2->ts < min_valid_ts)
+				/* stop on crossing window border */
+				break;
+			/* check if pulse match (multi)PRI */
+			factor = pde_get_multiple(ps.last_ts - p2->ts, ps.pri,
+						  pde->rs->max_pri_tolerance);
+			if (factor > 0) {
+				ps.count++;
+				ps.first_ts = p2->ts;
+				/*
+				 * on match, add the intermediate falses
+				 * and reset counter
+				 */
+				ps.count_falses += tmp_false_count;
+				tmp_false_count = 0;
+			} else {
+				/* this is a potential false one */
+				tmp_false_count++;
+			}
+		}
+		if (ps.count <= min_count) {
+			/* did not reach minimum count, drop sequence */
+			continue;
+		}
+		/* this is a valid one, add it */
+		ps.deadline_ts = ps.first_ts + ps.dur;
+		if (pde->rs->type == RADAR_WAVEFORM_WEATHER) {
+			ps.ppb_thresh = 19000000 / (360 * ps.pri);
+			ps.ppb_thresh = PPB_THRESH(ps.ppb_thresh);
+		} else {
+			ps.ppb_thresh = pde->rs->ppb_thresh;
+		}
+
+		new_ps = pool_get_pseq_elem();
+		if (!new_ps)
+			return false;
+		memcpy(new_ps, &ps, sizeof(ps));
+		INIT_LIST_HEAD(&new_ps->head);
+		list_add(&new_ps->head, &pde->sequences);
+	}
+	return true;
+}
+
+/**
+ * pde_short_add_to_existing_seqs - add_to_existing_seqs function for
+ *                                  SHORT/WEATHER/INTERLEAVED radar waveform
+ * @pde: pointer on pri_detector
+ * @ts: timestamp of the pulse
+ *
+ * Check all sequemces created for this pde.
+ *  - If the sequence is too old delete it.
+ *  - Else if the delta with the previous pulse match the pri of the sequence
+ *    add the pulse to this sequence. If the pulse cannot be added it is added
+ *    to the false pulses for this sequence
+ *
+ * Return: Length of the longest sequence to which the pulse was added.
+ */
+static u32 pde_short_add_to_existing_seqs(struct pri_detector *pde, u64 ts)
+{
+	u32 max_count = 0;
+	struct pri_sequence *ps, *ps2;
+
+	list_for_each_entry_safe(ps, ps2, &pde->sequences, head) {
+		u32 delta_ts;
+		u32 factor;
+
+		/* first ensure that sequence is within window */
+		if (ts > ps->deadline_ts) {
+			list_del_init(&ps->head);
+			pool_put_pseq_elem(ps);
+			continue;
+		}
+
+		delta_ts = ts - ps->last_ts;
+		factor =
+			pde_get_multiple(delta_ts, ps->pri, pde->rs->max_pri_tolerance);
+
+		if (factor > 0) {
+			ps->last_ts = ts;
+			ps->count++;
+
+			if (max_count < ps->count)
+				max_count = ps->count;
+		} else {
+			ps->count_falses++;
+		}
+	}
+	return max_count;
+}
+
+/**
+ * pde_short_check_detection - check_detection function for
+ *                             SHORT/WEATHER/INTERLEAVED radar waveform
+ * @pde: pointer on pri_detector
+ *
+ * Check all sequemces created for this pde.
+ *  - If a sequence contains more pulses than the threshold and more matching
+ *    that false pulses.
+ *
+ * Return: The first complete sequence, or %NULL if none is complete.
+ */
+static struct pri_sequence *pde_short_check_detection(struct pri_detector *pde)
+{
+	struct pri_sequence *ps;
+
+	if (list_empty(&pde->sequences))
+		return NULL;
+
+	list_for_each_entry(ps, &pde->sequences, head) {
+		/*
+		 * we assume to have enough matching confidence if we
+		 * 1) have enough pulses
+		 * 2) have more matching than false pulses
+		 */
+		if (ps->count >= ps->ppb_thresh &&
+		    ps->count * pde->rs->num_pri > ps->count_falses) {
+			return ps;
+		}
+	}
+	return NULL;
+}
+
+/**
+ * pde_short_init - init function for
+ *                  SHORT/WEATHER/INTERLEAVED radar waveform
+ * @pde: pointer on pri_detector
+ *
+ * Initialize pri_detector window size to the maximun size of one burst
+ * for the radar specification associated.
+ */
+static void pde_short_init(struct pri_detector *pde)
+{
+	pde->window_size = pde->rs->pri_max * pde->rs->ppb * pde->rs->num_pri;
+	pde->max_count = pde->rs->ppb * 2;
+}
+
+static void pri_detector_reset(struct pri_detector *pde, u64 ts);
+/**
+ *  pde_short_add_pulse - Add pulse to a pri_detector for
+ *                        SHORT/WEATHER/INTERLEAVED radar waveform
+ *
+ * @pde : pointer on pri_detector
+ * @len : width of the pulse
+ * @ts  : timestamp of the pulse received
+ * @pri : Delta in us with the previous pulse.
+ *        (0 means that delta in bigger than 65535 us)
+ *
+ * Process on pulse within this pri_detector
+ * - First try to add it to existing sequence
+ * - Then try to create a new and longest sequence
+ * - Check if this pulse complete a sequence
+ * - If not save this pulse in the list
+ *
+ * Return: The completed sequence, or %NULL if the pulse did not complete one.
+ */
+static struct pri_sequence *pde_short_add_pulse(struct pri_detector *pde,
+						u16 len, u64 ts, u16 pri)
+{
+	u32 max_updated_seq;
+	struct pri_sequence *ps;
+	const struct radar_detector_specs *rs = pde->rs;
+
+	if (pde->count == 0) {
+		/* This is the first pulse after reset, no need to check sequences */
+		pulse_queue_enqueue(pde, ts);
+		return NULL;
+	}
+
+	if ((ts - pde->last_ts) < rs->max_pri_tolerance) {
+		/* if delta to last pulse is too short, don't use this pulse */
+		return NULL;
+	}
+
+	max_updated_seq = pde_short_add_to_existing_seqs(pde, ts);
+
+	if (!pde_short_create_sequences(pde, ts, max_updated_seq)) {
+		pri_detector_reset(pde, ts);
+		return NULL;
+	}
+
+	ps = pde_short_check_detection(pde);
+
+	if (!ps)
+		pulse_queue_enqueue(pde, ts);
+
+	return ps;
+}
+
+/*
+ * pri detector ops to detect short radar waveform
+ * A Short waveform is defined by :
+ *   The width of pulses.
+ *   The interval between two pulses inside a burst (called pri)
+ *   (some waveform may have or 2/3 interleaved pri)
+ *   The number of pulses per burst (ppb)
+ */
+static struct pri_detector_ops pri_detector_short = {
+	.init = pde_short_init,
+	.add_pulse = pde_short_add_pulse,
+	.reset_on_pri_overflow = 1,
+};
+
+/***************************************************************************
+ * Long waveform
+ **************************************************************************/
+#define LONG_RADAR_DURATION           12000000
+#define LONG_RADAR_BURST_MIN_DURATION (12000000 / 20)
+#define LONG_RADAR_MAX_BURST          20
+
+/**
+ * pde_long_init - init function for LONG radar waveform
+ * @pde: pointer on pri_detector
+ *
+ * Initialize pri_detector window size to the long waveform radar
+ * waveform (ie. 12s) and max_count
+ */
+static void pde_long_init(struct pri_detector *pde)
+{
+	pde->window_size = LONG_RADAR_DURATION;
+	pde->max_count = LONG_RADAR_MAX_BURST; /* only count burst not pulses */
+}
+
+/**
+ *  pde_long_add_pulse - Add pulse to a pri_detector for
+ *                       LONG radar waveform
+ *
+ * @pde : pointer on pri_detector
+ * @len : width of the pulse
+ * @ts  : timestamp of the pulse received
+ * @pri : Delta in us with the previous pulse.
+ *
+ *
+ * For long pulse we only handle one sequence. Since each burst
+ * have a different set of parameters (number of pulse, pri) than
+ * the previous one we only use pulse width to add the pulse in the
+ * sequence.
+ * We only queue one pulse per burst and valid the radar when enough burst
+ * has been detected.
+ *
+ * Return: The completed sequence, or %NULL if radar was not detected.
+ */
+static struct pri_sequence *pde_long_add_pulse(struct pri_detector *pde,
+					       u16 len, u64 ts, u16 pri)
+{
+	struct pri_sequence *ps;
+	const struct radar_detector_specs *rs = pde->rs;
+
+	if (list_empty(&pde->sequences)) {
+		/* First pulse, create a new sequence */
+		ps = pool_get_pseq_elem();
+		if (!ps)
+			return NULL;
+
+		/*For long waveform, "count" represents the number of burst detected */
+		ps->count = 1;
+		/*"count_false" represents the number of pulse in the current burst */
+		ps->count_falses = 1;
+		ps->first_ts = ts;
+		ps->last_ts = ts;
+		ps->deadline_ts = ts + pde->window_size;
+		ps->pri = 0;
+		INIT_LIST_HEAD(&ps->head);
+		list_add(&ps->head, &pde->sequences);
+		pulse_queue_enqueue(pde, ts);
+	} else {
+		u32 delta_ts;
+
+		ps = (struct pri_sequence *)pde->sequences.next;
+
+		delta_ts = ts - ps->last_ts;
+		ps->last_ts = ts;
+
+		if (delta_ts < rs->pri_max) {
+			/* ignore pulse too close from previous one */
+		} else if ((delta_ts >= rs->pri_min) && (delta_ts <= rs->pri_max)) {
+			/*
+			 * this is a new pulse in the current burst, ignore it
+			 * (i.e don't queue it)
+			 */
+			ps->count_falses++;
+		} else if ((ps->count > 2) &&
+				   (ps->dur + delta_ts) < LONG_RADAR_BURST_MIN_DURATION) {
+			/* not enough time between burst, ignore pulse */
+		} else {
+			/* a new burst */
+			ps->count++;
+			ps->count_falses = 1;
+
+			/* reset the start of the sequence if deadline reached */
+			if (ts > ps->deadline_ts) {
+				struct pulse_elem *p;
+				u64 min_valid_ts;
+
+				min_valid_ts = ts - pde->window_size;
+				while ((p = pulse_queue_get_tail(pde)) != NULL) {
+					if (p->ts >= min_valid_ts) {
+						ps->first_ts = p->ts;
+						ps->deadline_ts = p->ts + pde->window_size;
+						break;
+					}
+					pulse_queue_dequeue(pde);
+					ps->count--;
+				}
+			}
+
+			/*
+			 * valid radar if enough burst detected and delta with first burst
+			 * is at least duration/2
+			 */
+			if (ps->count > pde->rs->ppb_thresh &&
+			    (ts - ps->first_ts) > (pde->window_size / 2)) {
+				return ps;
+			}
+			pulse_queue_enqueue(pde, ts);
+			ps->dur = delta_ts;
+		}
+	}
+	return NULL;
+}
+
+/*
+ * pri detector ops to detect long radar waveform
+ */
+static struct pri_detector_ops pri_detector_long = {
+	.init = pde_long_init,
+	.add_pulse = pde_long_add_pulse,
+	.reset_on_pri_overflow = 0,
+};
+
+/***************************************************************************
+ * PRI detector init/reset/exit/get
+ **************************************************************************/
+/**
+ * pri_detector_init - Create a new PRI detector
+ *
+ * @dpd: dfs_pattern_detector instance pointer
+ * @radar_type: index of radar pattern
+ * @freq: Frequency of the pri detector
+ *
+ * Return: The allocated detector, or %NULL if allocation failed.
+ */
+struct pri_detector *pri_detector_init(struct dfs_pattern_detector *dpd,
+				       u16 radar_type, u16 freq)
+{
+	struct pri_detector *pde;
+
+	pde = kzalloc_obj(*pde, GFP_ATOMIC);
+	if (!pde)
+		return NULL;
+
+	INIT_LIST_HEAD(&pde->sequences);
+	INIT_LIST_HEAD(&pde->pulses);
+	INIT_LIST_HEAD(&pde->head);
+	list_add(&pde->head, &dpd->detectors[radar_type]);
+
+	pde->rs = &dpd->radar_spec[radar_type];
+	pde->freq = freq;
+
+	if (pde->rs->type == RADAR_WAVEFORM_LONG) {
+		/* for LONG WAVEFORM */
+		pde->ops = &pri_detector_long;
+	} else {
+		/* for SHORT, WEATHER and INTERLEAVED */
+		pde->ops = &pri_detector_short;
+	}
+
+	/* Init dependent of specs */
+	pde->ops->init(pde);
+
+	pool_register_ref();
+	return pde;
+}
+
+/**
+ * pri_detector_reset - Reset pri_detector
+ *
+ * @pde: pointer on pri_detector
+ * @ts: New ts reference for the pri_detector
+ *
+ * free pulse queue and sequences list and give objects back to pools
+ */
+static void pri_detector_reset(struct pri_detector *pde, u64 ts)
+{
+	struct pri_sequence *ps, *ps0;
+	struct pulse_elem *p, *p0;
+
+	list_for_each_entry_safe(ps, ps0, &pde->sequences, head) {
+		list_del_init(&ps->head);
+		pool_put_pseq_elem(ps);
+	}
+	list_for_each_entry_safe(p, p0, &pde->pulses, head) {
+		list_del_init(&p->head);
+		pool_put_pulse_elem(p);
+	}
+	pde->count = 0;
+	pde->last_ts = ts;
+}
+
+/**
+ *  pri_detector_exit - Delete pri_detector
+ *
+ *  @pde: pointer on pri_detector
+ */
+static void pri_detector_exit(struct pri_detector *pde)
+{
+	pri_detector_reset(pde, 0);
+	pool_deregister_ref();
+	list_del(&pde->head);
+	kfree(pde);
+}
+
+/**
+ * pri_detector_get - Get a PRI detector for a given frequency and type
+ * @dpd: dfs_pattern_detector instance pointer
+ * @freq: frequency in MHz
+ * @radar_type: index of radar pattern
+ *
+ * Return existing pri detector for the given frequency or return a
+ * newly create one.
+ * Pri detector are "merged" by frequency so that if a pri detector for a freq
+ * of +/- 2Mhz already exists don't create a new one.
+ *
+ * Maybe will need to adapt frequency merge for pattern with chirp.
+ *
+ * Return: An existing or newly allocated detector, or %NULL on allocation
+ * failure.
+ */
+static struct pri_detector *pri_detector_get(struct dfs_pattern_detector *dpd,
+					     u16 freq, u16 radar_type)
+{
+	struct pri_detector *pde, *cur = NULL;
+
+	list_for_each_entry(pde, &dpd->detectors[radar_type], head) {
+		if (pde->freq == freq) {
+			if (pde->count)
+				return pde;
+			cur = pde;
+		} else if (pde->freq - 2 == freq && pde->count) {
+			return pde;
+		} else if (pde->freq + 2 == freq && pde->count) {
+			return pde;
+		}
+	}
+
+	if (cur)
+		return cur;
+	else
+		return pri_detector_init(dpd, radar_type, freq);
+}
+
+/******************************************************************************
+ * DFS Pattern Detector
+ *****************************************************************************/
+/**
+ * dfs_pattern_detector_reset() - reset all channel detectors
+ *
+ * @dpd: dfs_pattern_detector
+ */
+static void dfs_pattern_detector_reset(struct dfs_pattern_detector *dpd)
+{
+	struct pri_detector *pde;
+	int i;
+
+	for (i = 0; i < dpd->num_radar_types; i++) {
+		if (!list_empty(&dpd->detectors[i]))
+			list_for_each_entry(pde, &dpd->detectors[i], head)
+				pri_detector_reset(pde, dpd->last_pulse_ts);
+	}
+
+	dpd->last_pulse_ts = 0;
+	dpd->prev_jiffies = jiffies;
+}
+
+/*
+ * dfs_pattern_detector_reset() - delete all channel detectors
+ *
+ * @dpd: dfs_pattern_detector
+ */
+static void dfs_pattern_detector_exit(struct dfs_pattern_detector *dpd)
+{
+	struct pri_detector *pde, *pde0;
+	int i;
+
+	for (i = 0; i < dpd->num_radar_types; i++) {
+		if (!list_empty(&dpd->detectors[i]))
+			list_for_each_entry_safe(pde, pde0, &dpd->detectors[i], head)
+				pri_detector_exit(pde);
+	}
+
+	kfree(dpd);
+}
+
+/**
+ * dfs_pattern_detector_pri_overflow - reset all channel detectors on pri
+ *                                     overflow
+ * @dpd: dfs_pattern_detector
+ */
+static void dfs_pattern_detector_pri_overflow(struct dfs_pattern_detector *dpd)
+{
+	struct pri_detector *pde;
+	int i;
+
+	for (i = 0; i < dpd->num_radar_types; i++) {
+		if (!list_empty(&dpd->detectors[i]))
+			list_for_each_entry(pde, &dpd->detectors[i], head)
+				if (pde->ops->reset_on_pri_overflow)
+					pri_detector_reset(pde, dpd->last_pulse_ts);
+	}
+}
+
+/**
+ * dfs_pattern_detector_add_pulse - Process one pulse
+ *
+ * @dpd: dfs_pattern_detector
+ * @chain: Chain that correspond to this pattern_detector (only for debug)
+ * @freq: frequency of the pulse
+ * @pri: Delta with previous pulse. (0 if delta is too big for u16)
+ * @len: width of the pulse
+ * @now: jiffies value when pulse was received
+ *
+ * Get (or create) the channel_detector for this frequency. Then add the pulse
+ * in each pri_detector created in this channel_detector.
+ *
+ *
+ * Return: %true if the pulse completes a radar pattern, otherwise %false.
+ */
+static bool dfs_pattern_detector_add_pulse(struct dfs_pattern_detector *dpd,
+					   enum aicwf_radar_chain chain,
+					   u16 freq, u16 pri, u16 len, u32 now)
+{
+	u32 i;
+
+	/*
+	 * pulses received for a non-supported or un-initialized
+	 * domain are treated as detected radars for fail-safety
+	 */
+	if (dpd->region == NL80211_DFS_UNSET)
+		return true;
+
+	/* Compute pulse time stamp */
+	if (pri == 0) {
+		u32 delta_jiffie;
+
+		if (unlikely(now < dpd->prev_jiffies))
+			delta_jiffie = 0xffffffff - dpd->prev_jiffies + now;
+		else
+			delta_jiffie = now - dpd->prev_jiffies;
+		dpd->last_pulse_ts += jiffies_to_usecs(delta_jiffie);
+		dpd->prev_jiffies = now;
+		dfs_pattern_detector_pri_overflow(dpd);
+	} else {
+		dpd->last_pulse_ts += pri;
+	}
+
+	for (i = 0; i < dpd->num_radar_types; i++) {
+		struct pri_sequence *ps;
+		struct pri_detector *pde;
+		const struct radar_detector_specs *rs = &dpd->radar_spec[i];
+
+		/* no need to look up for pde if len is not within range */
+		if (rs->width_min > len || rs->width_max < len)
+			continue;
+
+		pde = pri_detector_get(dpd, freq, i);
+		ps = pde->ops->add_pulse(pde, len, dpd->last_pulse_ts, pri);
+
+		if (ps) {
+#ifdef AIC8800_CREATE_TRACE_POINTS
+			trace_radar_detected(chain, dpd->region, pde->freq, i, ps->pri);
+#endif
+			// reset everything instead of just the channel detector
+			dfs_pattern_detector_reset(dpd);
+			return true;
+		}
+	}
+
+	return false;
+}
+
+/*
+ * get_dfs_domain_radar_types() - get radar types for a given DFS domain
+ * @param domain DFS domain
+ * @return radar_types ptr on success, NULL if DFS domain is not supported
+ */
+static const struct radar_types *
+get_dfs_domain_radar_types(enum nl80211_dfs_regions region)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(dfs_domains); i++) {
+		if (dfs_domains[i]->region == region)
+			return dfs_domains[i];
+	}
+	return NULL;
+}
+
+/**
+ * get_dfs_max_radar_types - Get the maximum number of radar types
+ *
+ * Return: Maximum number of radar patterns supported by any region.
+ */
+static u16 get_dfs_max_radar_types(void)
+{
+	u32 i;
+	u16 max = 0;
+
+	for (i = 0; i < ARRAY_SIZE(dfs_domains); i++) {
+		if (dfs_domains[i]->num_radar_types > max)
+			max = dfs_domains[i]->num_radar_types;
+	}
+	return max;
+}
+
+/*
+ * dfs_pattern_detector_set_domain - set DFS domain
+ *
+ * @dpd: dfs_pattern_detector
+ * @region: DFS region
+ *
+ * set DFS domain, resets detector lines upon domain changes
+ */
+static bool dfs_pattern_detector_set_domain(struct dfs_pattern_detector *dpd,
+					    enum nl80211_dfs_regions region,
+					    u8 chain)
+{
+	const struct radar_types *rt;
+	struct pri_detector *pde, *pde0;
+	int i;
+
+	if (dpd->region == region)
+		return true;
+
+	dpd->region = NL80211_DFS_UNSET;
+
+	rt = get_dfs_domain_radar_types(region);
+	if (!rt)
+		return false;
+
+	/* delete all pri detectors for previous DFS domain */
+	for (i = 0; i < dpd->num_radar_types; i++) {
+		if (!list_empty(&dpd->detectors[i]))
+			list_for_each_entry_safe(pde, pde0, &dpd->detectors[i], head)
+				pri_detector_exit(pde);
+	}
+
+	if (chain == AICWF_RADAR_RIU)
+		dpd->radar_spec = rt->spec_riu;
+	else
+		dpd->radar_spec = rt->spec_fcu;
+	dpd->num_radar_types = rt->num_radar_types;
+
+	dpd->region = region;
+	return true;
+}
+
+/*
+ * dfs_pattern_detector_init - Initialize dfs_pattern_detector
+ *
+ * @region: DFS region
+ * @return: pointer on dfs_pattern_detector
+ *
+ */
+static struct dfs_pattern_detector *
+dfs_pattern_detector_init(enum nl80211_dfs_regions region, u8 chain)
+{
+	struct dfs_pattern_detector *dpd;
+	u16 i, max_radar_type = get_dfs_max_radar_types();
+
+	dpd = kmalloc(sizeof(*dpd) + max_radar_type * sizeof(dpd->detectors[0]),
+		      GFP_KERNEL);
+	if (!dpd)
+		return NULL;
+
+	dpd->region = NL80211_DFS_UNSET;
+	dpd->enabled = AICWF_RADAR_DETECT_DISABLE;
+	dpd->last_pulse_ts = 0;
+	dpd->prev_jiffies = jiffies;
+	dpd->num_radar_types = 0;
+	for (i = 0; i < max_radar_type; i++)
+		INIT_LIST_HEAD(&dpd->detectors[i]);
+
+	if (dfs_pattern_detector_set_domain(dpd, region, chain))
+		return dpd;
+
+	kfree(dpd);
+	return NULL;
+}
+
+/******************************************************************************
+ * driver interface
+ *****************************************************************************/
+static u16 aicwf_radar_get_center_freq(struct aicwf_hw *aicwf_hw, u8 chain)
+{
+	if (chain == AICWF_RADAR_FCU)
+		return aicwf_hw->phy.sec_chan.center_freq1;
+
+	if (chain == AICWF_RADAR_RIU) {
+#ifdef CONFIG_AICWF_FULLMAC
+		if (!aicwf_chanctx_valid(aicwf_hw, aicwf_hw->cur_chanctx)) {
+			WARN(1, "Radar pulse without channel information");
+		} else {
+			return aicwf_hw->chanctx_table[aicwf_hw->cur_chanctx]
+				.chan_def.center_freq1;
+		}
+#endif /* CONFIG_AICWF_FULLMAC */
+	}
+
+	return 0;
+}
+
+static void aicwf_radar_detected(struct aicwf_hw *aicwf_hw)
+{
+#ifdef CONFIG_AICWF_FULLMAC
+	struct cfg80211_chan_def chan_def;
+
+	if (!aicwf_chanctx_valid(aicwf_hw, aicwf_hw->cur_chanctx)) {
+		WARN(1, "Radar detected without channel information");
+		return;
+	}
+
+	/*
+	 * recopy chan_def in local variable because aicwf_radar_cancel_cac may
+	 * clean the variable (if in CAC and it's the only vif using this context)
+	 * and CAC should be aborted before reporting the radar.
+	 */
+	chan_def = aicwf_hw->chanctx_table[aicwf_hw->cur_chanctx].chan_def;
+
+	aicwf_radar_cancel_cac(&aicwf_hw->radar);
+	cfg80211_radar_event(aicwf_hw->wiphy, &chan_def, GFP_KERNEL);
+
+#endif /* CONFIG_AICWF_FULLMAC */
+}
+
+static void aicwf_radar_process_pulse(struct work_struct *ws)
+{
+	struct aicwf_radar *radar =
+		container_of(ws, struct aicwf_radar, detection_work);
+	struct aicwf_hw *aicwf_hw = container_of(radar, struct aicwf_hw, radar);
+	int chain;
+	u32 pulses[AICWF_RADAR_LAST][AICWF_RADAR_PULSE_MAX];
+	u16 pulses_count[AICWF_RADAR_LAST];
+	u32 now =
+		jiffies; /* would be better to store jiffies value in IT handler */
+
+	/* recopy pulses locally to avoid too long spin_lock */
+	spin_lock_bh(&radar->lock);
+	for (chain = AICWF_RADAR_RIU; chain < AICWF_RADAR_LAST; chain++) {
+		int start, count;
+
+		count = radar->pulses[chain].count;
+		start = radar->pulses[chain].index - count;
+		if (start < 0)
+			start += AICWF_RADAR_PULSE_MAX;
+
+		pulses_count[chain] = count;
+		if (count == 0)
+			continue;
+
+		if ((start + count) > AICWF_RADAR_PULSE_MAX) {
+			u16 count1 = (AICWF_RADAR_PULSE_MAX - start);
+
+			memcpy(&pulses[chain][0], &radar->pulses[chain].buffer[start],
+			       count1 * sizeof(struct radar_pulse));
+			memcpy(&pulses[chain][count1], &radar->pulses[chain].buffer[0],
+			       (count - count1) * sizeof(struct radar_pulse));
+		} else {
+			memcpy(&pulses[chain][0], &radar->pulses[chain].buffer[start],
+			       count * sizeof(struct radar_pulse));
+		}
+		radar->pulses[chain].count = 0;
+	}
+	spin_unlock_bh(&radar->lock);
+
+	/* now process pulses */
+	for (chain = AICWF_RADAR_RIU; chain < AICWF_RADAR_LAST; chain++) {
+		int i;
+		u16 freq;
+
+		if (pulses_count[chain] == 0)
+			continue;
+
+		freq = aicwf_radar_get_center_freq(aicwf_hw, chain);
+
+		for (i = 0; i < pulses_count[chain]; i++) {
+			struct radar_pulse *p = (struct radar_pulse *)&pulses[chain][i];
+#ifdef AIC8800_CREATE_TRACE_POINTS
+			trace_radar_pulse(chain, p);
+#endif
+			if (dfs_pattern_detector_add_pulse(radar->dpd[chain], chain,
+							   (s16)freq + (2 * p->freq),
+							   p->rep, (p->len * 2), now)) {
+				u16 idx = radar->detected[chain].index;
+
+				if (chain == AICWF_RADAR_RIU) {
+					/* operating chain, inform upper layer to change channel */
+					if (radar->dpd[chain]->enabled ==
+						AICWF_RADAR_DETECT_REPORT) {
+						aicwf_radar_detected(aicwf_hw);
+						/*
+						 * no need to report new radar until upper layer
+						 * set a new channel. This prevent warning if a
+						 * new radar is	detected while mac80211 is
+						 * changing channel
+						 */
+						aicwf_radar_detection_enable
+							(radar, AICWF_RADAR_DETECT_DISABLE, chain);
+						/*
+						 * purge any event received since the beginning
+						 * of the function (we are sure not to interfer
+						 * with tasklet as we disable detection just
+						 * before)
+						 */
+						radar->pulses[chain].count = 0;
+					}
+				}
+
+				radar->detected[chain].freq[idx] = (s16)freq + (2 * p->freq);
+				radar->detected[chain].time[idx] = ktime_get_real_seconds();
+				radar->detected[chain].index =
+					((idx + 1) % NX_NB_RADAR_DETECTED);
+				radar->detected[chain].count++;
+				/* no need to process next pulses for this chain */
+				break;
+			}
+		}
+	}
+}
+
+#ifdef CONFIG_AICWF_FULLMAC
+static void aicwf_radar_cac_work(struct work_struct *ws)
+{
+	struct delayed_work *dw = container_of(ws, struct delayed_work, work);
+	struct aicwf_radar *radar = container_of(dw, struct aicwf_radar, cac_work);
+	struct aicwf_hw *aicwf_hw = container_of(radar, struct aicwf_hw, radar);
+	struct aicwf_chanctx *ctxt;
+
+	if (!radar->cac_vif) {
+		WARN(1, "CAC finished but no vif set");
+		return;
+	}
+
+	ctxt = &aicwf_hw->chanctx_table[radar->cac_vif->ch_index];
+	cfg80211_cac_event(radar->cac_vif->ndev, &ctxt->chan_def,
+			   NL80211_RADAR_CAC_FINISHED, GFP_KERNEL, 0);
+	aicwf_send_apm_stop_cac_req(aicwf_hw, radar->cac_vif);
+	aicwf_chanctx_unlink(radar->cac_vif);
+
+	radar->cac_vif = NULL;
+}
+#endif /* CONFIG_AICWF_FULLMAC */
+
+bool aicwf_radar_detection_init(struct aicwf_radar *radar)
+{
+	spin_lock_init(&radar->lock);
+
+	radar->dpd[AICWF_RADAR_RIU] =
+		dfs_pattern_detector_init(NL80211_DFS_UNSET, AICWF_RADAR_RIU);
+	if (!radar->dpd[AICWF_RADAR_RIU])
+		return false;
+
+	radar->dpd[AICWF_RADAR_FCU] =
+		dfs_pattern_detector_init(NL80211_DFS_UNSET, AICWF_RADAR_FCU);
+	if (!radar->dpd[AICWF_RADAR_FCU]) {
+		aicwf_radar_detection_deinit(radar);
+		return false;
+	}
+
+	INIT_WORK(&radar->detection_work, aicwf_radar_process_pulse);
+#ifdef CONFIG_AICWF_FULLMAC
+	INIT_DELAYED_WORK(&radar->cac_work, aicwf_radar_cac_work);
+	radar->cac_vif = NULL;
+#endif /* CONFIG_AICWF_FULLMAC */
+	return true;
+}
+
+void aicwf_radar_detection_deinit(struct aicwf_radar *radar)
+{
+	if (radar->dpd[AICWF_RADAR_RIU]) {
+		dfs_pattern_detector_exit(radar->dpd[AICWF_RADAR_RIU]);
+		radar->dpd[AICWF_RADAR_RIU] = NULL;
+	}
+	if (radar->dpd[AICWF_RADAR_FCU]) {
+		dfs_pattern_detector_exit(radar->dpd[AICWF_RADAR_FCU]);
+		radar->dpd[AICWF_RADAR_FCU] = NULL;
+	}
+}
+
+bool aicwf_radar_set_domain(struct aicwf_radar *radar,
+			    enum nl80211_dfs_regions region)
+{
+	if (!radar->dpd[0])
+		return false;
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_radar_set_region(region);
+#endif
+	return (dfs_pattern_detector_set_domain(radar->dpd[AICWF_RADAR_RIU], region,
+						AICWF_RADAR_RIU) &&
+		dfs_pattern_detector_set_domain(radar->dpd[AICWF_RADAR_FCU], region,
+						AICWF_RADAR_FCU));
+}
+
+void aicwf_radar_detection_enable(struct aicwf_radar *radar, u8 enable, u8 chain)
+{
+	if (chain < AICWF_RADAR_LAST) {
+#ifdef AIC8800_CREATE_TRACE_POINTS
+		trace_radar_enable_detection(radar->dpd[chain]->region, enable, chain);
+#endif
+		spin_lock_bh(&radar->lock);
+		radar->dpd[chain]->enabled = enable;
+		spin_unlock_bh(&radar->lock);
+	}
+}
+
+bool aicwf_radar_detection_is_enable(struct aicwf_radar *radar, u8 chain)
+{
+	return radar->dpd[chain]->enabled != AICWF_RADAR_DETECT_DISABLE;
+}
+
+#ifdef CONFIG_AICWF_FULLMAC
+void aicwf_radar_start_cac(struct aicwf_radar *radar, u32 cac_time_ms,
+			   struct aicwf_vif *vif)
+{
+	WARN(radar->cac_vif, "CAC already in progress");
+	radar->cac_vif = vif;
+	schedule_delayed_work(&radar->cac_work, msecs_to_jiffies(cac_time_ms));
+}
+
+void aicwf_radar_cancel_cac(struct aicwf_radar *radar)
+{
+	struct aicwf_hw *aicwf_hw = container_of(radar, struct aicwf_hw, radar);
+
+	if (!radar->cac_vif)
+		return;
+
+	if (cancel_delayed_work(&radar->cac_work)) {
+		struct aicwf_chanctx *ctxt;
+
+		ctxt = &aicwf_hw->chanctx_table[radar->cac_vif->ch_index];
+		aicwf_send_apm_stop_cac_req(aicwf_hw, radar->cac_vif);
+		cfg80211_cac_event(radar->cac_vif->ndev, &ctxt->chan_def,
+				   NL80211_RADAR_CAC_ABORTED, GFP_KERNEL, 0);
+		aicwf_chanctx_unlink(radar->cac_vif);
+	}
+
+	radar->cac_vif = NULL;
+}
+
+void aicwf_radar_detection_enable_on_cur_channel(struct aicwf_hw *aicwf_hw)
+{
+	struct aicwf_chanctx *ctxt;
+
+	/* If no information on current channel do nothing */
+	if (!aicwf_chanctx_valid(aicwf_hw, aicwf_hw->cur_chanctx))
+		return;
+
+	ctxt = &aicwf_hw->chanctx_table[aicwf_hw->cur_chanctx];
+	if (ctxt->chan_def.chan->flags & IEEE80211_CHAN_RADAR) {
+		aicwf_radar_detection_enable(&aicwf_hw->radar, AICWF_RADAR_DETECT_REPORT,
+					     AICWF_RADAR_RIU);
+	} else {
+		aicwf_radar_detection_enable(&aicwf_hw->radar, AICWF_RADAR_DETECT_DISABLE,
+					     AICWF_RADAR_RIU);
+	}
+}
+#endif /* CONFIG_AICWF_FULLMAC */
+
+/*****************************************************************************
+ * Debug functions
+ *****************************************************************************/
+static int aicwf_radar_dump_pri_detector(char *buf, size_t len,
+					 struct pri_detector *pde)
+{
+	char freq_info[] = "Freq = %3.dMhz\n";
+	char seq_info[] = " pri    | count | false\n";
+	struct pri_sequence *seq;
+	int res, write = 0;
+
+	if (list_empty(&pde->sequences))
+		return 0;
+
+	if (!buf) {
+		int nb_seq = 1;
+
+		list_for_each_entry(seq, &pde->sequences, head) {
+			nb_seq++;
+		}
+
+		return (sizeof(freq_info) + nb_seq * sizeof(seq_info));
+	}
+
+	res = scnprintf(buf, len, freq_info, pde->freq);
+	write += res;
+	len -= res;
+
+	res = scnprintf(&buf[write], len, "%s", seq_info);
+	write += res;
+	len -= res;
+
+	list_for_each_entry(seq, &pde->sequences, head) {
+		res = scnprintf(&buf[write], len, " %6.d |   %2.d  |    %.2d\n",
+				seq->pri, seq->count, seq->count_falses);
+		write += res;
+		len -= res;
+	}
+
+	return write;
+}
+
+int aicwf_radar_dump_pattern_detector(char *buf, size_t len,
+				      struct aicwf_radar *radar, u8 chain)
+{
+	struct dfs_pattern_detector *dpd = radar->dpd[chain];
+	char info[] = "Type = %3.d\n";
+	struct pri_detector *pde;
+	int i, res, write = 0;
+
+	/* if buf is NULL return size needed for dump */
+	if (!buf) {
+		int size_needed = 0;
+
+		for (i = 0; i < dpd->num_radar_types; i++) {
+			list_for_each_entry(pde, &dpd->detectors[i], head) {
+				size_needed += aicwf_radar_dump_pri_detector(NULL, 0, pde);
+			}
+			size_needed += sizeof(info);
+
+			return size_needed;
+		}
+	}
+
+	/* */
+	for (i = 0; i < dpd->num_radar_types; i++) {
+		res = scnprintf(&buf[write], len, info, i);
+
+		write += res;
+		len -= res;
+
+		list_for_each_entry(pde, &dpd->detectors[i], head) {
+			res = aicwf_radar_dump_pri_detector(&buf[write], len, pde);
+			write += res;
+			len -= res;
+		}
+	}
+
+	return write;
+}
+
+int aicwf_radar_dump_radar_detected(char *buf, size_t len,
+				    struct aicwf_radar *radar, u8 chain)
+{
+	struct aicwf_radar_detected *detect = &radar->detected[chain];
+	char info[] = "2001/02/02 - 02:20 5126MHz\n";
+	int idx, i, res, write = 0;
+	int count = detect->count;
+
+	if (count > NX_NB_RADAR_DETECTED)
+		count = NX_NB_RADAR_DETECTED;
+
+	if (!buf)
+		return (count * sizeof(info)) + 1;
+
+	idx = (detect->index - detect->count) % NX_NB_RADAR_DETECTED;
+
+	for (i = 0; i < count; i++) {
+		struct tm tm;
+
+		time64_to_tm(detect->time[idx], 0, &tm);
+		res =
+			scnprintf(&buf[write], len, "%.4d/%.2d/%.2d - %.2d:%.2d %4.4dMHz\n",
+				  (int)tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
+				  tm.tm_hour, tm.tm_min, detect->freq[idx]);
+		write += res;
+		len -= res;
+
+		idx = (idx + 1) % NX_NB_RADAR_DETECTED;
+	}
+
+	return write;
+}
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_resv_mem.c b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_resv_mem.c
new file mode 100644
index 000000000000..b3ee4ba83104
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_resv_mem.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ ******************************************************************************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief reserved skb memory
+ *
+ ******************************************************************************
+ */
+#include <linux/printk.h>
+#include <linux/skbuff.h>
+
+#include "aicwf_resv_mem.h"
+
+static const u32 aicwf_resv_mem_size[AIC_RESV_MEM_NUM] = {
+	[AIC_RESV_MEM_TXDATA] = 1536 * 64,
+};
+
+static const char *const aicwf_resv_mem_name[AIC_RESV_MEM_NUM] = {
+	[AIC_RESV_MEM_TXDATA] = "resv_mem_txdata",
+};
+
+/**
+ * aicwf_resv_mem_init - Reserve the buffers for the lifetime of a device
+ * @pool: Pool to fill, owned by the SDIO device
+ *
+ * A buffer that cannot be allocated here is allocated on first use by
+ * aicwf_resv_mem_alloc_skb().
+ */
+void aicwf_resv_mem_init(struct aicwf_resv_mem *pool)
+{
+	int i;
+
+	for (i = 0; i < AIC_RESV_MEM_NUM; i++) {
+		pool->entry[i].used = false;
+		pool->entry[i].skb = dev_alloc_skb(aicwf_resv_mem_size[i]);
+	}
+}
+
+/**
+ * aicwf_resv_mem_deinit - Release the buffers that are not handed out
+ * @pool: Pool filled by aicwf_resv_mem_init()
+ */
+void aicwf_resv_mem_deinit(struct aicwf_resv_mem *pool)
+{
+	int i;
+
+	for (i = 0; i < AIC_RESV_MEM_NUM; i++) {
+		if (!pool->entry[i].used && pool->entry[i].skb)
+			dev_kfree_skb(pool->entry[i].skb);
+		pool->entry[i].skb = NULL;
+	}
+}
+
+/**
+ * aicwf_resv_mem_alloc_skb - Acquire a reserved socket buffer
+ * @pool: Pool filled by aicwf_resv_mem_init()
+ * @length: Minimum required buffer size
+ * @id: Reserved-buffer identifier
+ *
+ * Return: The reserved buffer, or %NULL if it is too small, already in use,
+ * or cannot be allocated.
+ */
+struct sk_buff *aicwf_resv_mem_alloc_skb(struct aicwf_resv_mem *pool,
+					 unsigned int length,
+					 enum aicwf_resv_mem_id id)
+{
+	struct aicwf_resv_mem_entry *entry = &pool->entry[id];
+
+	if (aicwf_resv_mem_size[id] < length) {
+		pr_err("no enough mem\n");
+		return NULL;
+	}
+
+	if (entry->used) {
+		pr_err("mem in use\n");
+		return NULL;
+	}
+
+	if (!entry->skb) {
+		entry->skb = dev_alloc_skb(aicwf_resv_mem_size[id]);
+		if (!entry->skb)
+			return NULL;
+	}
+
+	pr_debug("alloc %s success, id: %d, size: %u\n",
+		 aicwf_resv_mem_name[id], id, aicwf_resv_mem_size[id]);
+
+	entry->used = true;
+	return entry->skb;
+}
+
+/**
+ * aicwf_resv_mem_kfree_skb - Release a reserved socket buffer for reuse
+ * @pool: Pool filled by aicwf_resv_mem_init()
+ * @skb: Reserved buffer returned by aicwf_resv_mem_alloc_skb()
+ * @id: Reserved-buffer identifier
+ */
+void aicwf_resv_mem_kfree_skb(struct aicwf_resv_mem *pool, struct sk_buff *skb,
+			      enum aicwf_resv_mem_id id)
+{
+	pool->entry[id].used = false;
+	pr_debug("free %s success, id: %d, size: %u\n",
+		 aicwf_resv_mem_name[id], id, aicwf_resv_mem_size[id]);
+}
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx.c b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx.c
new file mode 100644
index 000000000000..748467719b7c
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx.c
@@ -0,0 +1,2434 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ ******************************************************************************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @file aicwf_rx.c
+ *
+ * @brief RX handle
+ *
+ ******************************************************************************
+ */
+
+#include <linux/bitfield.h>
+#include <linux/etherdevice.h>
+#include <linux/ieee80211.h>
+#include <net/ieee80211_radiotap.h>
+
+#include "aicwf_txrxif.h"
+#include "aicwf_config.h"
+#include "aicwf_defs.h"
+#include "aicwf_events.h"
+#include "aicwf_rx.h"
+#include "aicwf_tx.h"
+#ifdef CONFIG_AIC8800_ARP_OFFLOAD
+#include "aicwf_msg_tx.h"
+#include <linux/ip.h>
+#include <linux/udp.h>
+#include <net/ip.h>
+#endif
+
+#ifndef IEEE80211_MAX_CHAINS
+#define IEEE80211_MAX_CHAINS 4
+#endif
+
+const u16 tx_legrates_lut_rate[] = {10,  20,  55,  110, 60,  90,
+				    120, 180, 240, 360, 480, 540};
+
+const struct aicwf_legrate legrates_lut[] = {
+	[0] = {.idx = 0, .rate = 10},    [1] = {.idx = 1, .rate = 20},
+	[2] = {.idx = 2, .rate = 55},    [3] = {.idx = 3, .rate = 110},
+	[4] = {.idx = -1, .rate = 0},    [5] = {.idx = -1, .rate = 0},
+	[6] = {.idx = -1, .rate = 0},    [7] = {.idx = -1, .rate = 0},
+	[8] = {.idx = 10, .rate = 480},  [9] = {.idx = 8, .rate = 240},
+	[10] = {.idx = 6, .rate = 120},  [11] = {.idx = 4, .rate = 60},
+	[12] = {.idx = 11, .rate = 540}, [13] = {.idx = 9, .rate = 360},
+	[14] = {.idx = 7, .rate = 180},  [15] = {.idx = 5, .rate = 90},
+};
+
+struct vendor_radiotap_hdr {
+	u8 oui[3];
+	u8 subns;
+	u16 len;
+	u8 data[];
+};
+
+/**
+ * aicwf_rx_get_vif - Return pointer to the destination vif
+ *
+ * @aicwf_hw: main driver data
+ * @vif_idx: vif index present in rx descriptor
+ *
+ * Select the vif that should receive this frame. Returns NULL if the
+ * destination vif is not active or vif is not specified in the descriptor.
+ *
+ * Return: The active destination VIF, or %NULL if none was selected.
+ */
+static inline struct aicwf_vif *aicwf_rx_get_vif(struct aicwf_hw *aicwf_hw,
+						 int vif_idx)
+{
+	struct aicwf_vif *aicwf_vif = NULL;
+
+	if (vif_idx >= 0 && vif_idx < NX_VIRT_DEV_MAX) {
+		aicwf_vif = aicwf_hw->vif_table[vif_idx];
+
+		if (!aicwf_vif) {
+			dev_err(aicwf_hw->dev, "aicwf_hw->vif_table[%d] NULL\n",
+				vif_idx);
+			return NULL;
+		} else if (!aicwf_vif->up) {
+			dev_err(aicwf_hw->dev, "aicwf_hw->vif_table[%d] is down\n", vif_idx);
+			return NULL;
+		}
+	}
+
+	return aicwf_vif;
+}
+
+/**
+ * aicwf_rx_vector_convert - Convert a legacy RX vector into a new RX vector
+ * format
+ *
+ * @aicwf_hw: main driver data.
+ * @rx_vect1: Rx vector 1 descriptor of the received frame.
+ * @rx_vect2: Rx vector 2 descriptor of the received frame.
+ */
+static void aicwf_rx_vector_convert(struct aicwf_hw *aicwf_hw,
+				    struct rx_vector_1 *rx_vect1,
+				    struct rx_vector_2 *rx_vect2)
+{
+	struct rx_vector_1_old rx_vect1_leg;
+	struct rx_vector_2_old rx_vect2_leg;
+	u32 phy_vers = aicwf_hw->version_cfm.version_phy_2;
+
+	// Check if we need to do the conversion. Only if old modem is used
+	if (__MDM_MAJOR_VERSION(phy_vers) > 0) {
+		rx_vect1->rssi1 = rx_vect1->rssi_leg;
+		return;
+	}
+	// Copy the received vector locally
+	memcpy(&rx_vect1_leg, rx_vect1, sizeof(struct rx_vector_1_old));
+
+	// Reset it
+	memset(rx_vect1, 0, sizeof(struct rx_vector_1));
+
+	// Perform the conversion
+	rx_vect1->format_mod = rx_vect1_leg.format_mod;
+	rx_vect1->ch_bw = rx_vect1_leg.ch_bw;
+	rx_vect1->antenna_set = rx_vect1_leg.antenna_set;
+	rx_vect1->leg_length = rx_vect1_leg.leg_length;
+	rx_vect1->leg_rate = rx_vect1_leg.leg_rate;
+	rx_vect1->rssi1 = rx_vect1_leg.rssi1;
+
+	switch (rx_vect1->format_mod) {
+	case FORMATMOD_NON_HT:
+	case FORMATMOD_NON_HT_DUP_OFDM:
+		rx_vect1->leg.lsig_valid = rx_vect1_leg.lsig_valid;
+		rx_vect1->leg.chn_bw_in_non_ht = rx_vect1_leg.num_extn_ss;
+		rx_vect1->leg.dyn_bw_in_non_ht = rx_vect1_leg.dyn_bw;
+		break;
+	case FORMATMOD_HT_MF:
+	case FORMATMOD_HT_GF:
+		rx_vect1->ht.aggregation = rx_vect1_leg.aggregation;
+		rx_vect1->ht.fec = rx_vect1_leg.fec_coding;
+		rx_vect1->ht.lsig_valid = rx_vect1_leg.lsig_valid;
+		rx_vect1->ht.length = rx_vect1_leg.ht_length;
+		rx_vect1->ht.mcs = rx_vect1_leg.mcs;
+		rx_vect1->ht.num_extn_ss = rx_vect1_leg.num_extn_ss;
+		rx_vect1->ht.short_gi = rx_vect1_leg.short_gi;
+		rx_vect1->ht.smoothing = rx_vect1_leg.smoothing;
+		rx_vect1->ht.sounding = rx_vect1_leg.sounding;
+		rx_vect1->ht.stbc = rx_vect1_leg.stbc;
+		break;
+	case FORMATMOD_VHT:
+		rx_vect1->vht.beamformed = !rx_vect1_leg.smoothing;
+		rx_vect1->vht.fec = rx_vect1_leg.fec_coding;
+		rx_vect1->vht.length = rx_vect1_leg.ht_length | rx_vect1_leg._ht_length	<< 8;
+		rx_vect1->vht.mcs = rx_vect1_leg.mcs & 0x0F;
+		rx_vect1->vht.nss =
+			rx_vect1_leg.stbc ? rx_vect1_leg.n_sts / 2 : rx_vect1_leg.n_sts;
+		rx_vect1->vht.doze_not_allowed = rx_vect1_leg.doze_not_allowed;
+		rx_vect1->vht.short_gi = rx_vect1_leg.short_gi;
+		rx_vect1->vht.sounding = rx_vect1_leg.sounding;
+		rx_vect1->vht.stbc = rx_vect1_leg.stbc;
+		rx_vect1->vht.group_id = rx_vect1_leg.group_id;
+		rx_vect1->vht.partial_aid = rx_vect1_leg.partial_aid;
+		rx_vect1->vht.first_user = rx_vect1_leg.first_user;
+		break;
+	}
+
+	if (!rx_vect2)
+		return;
+
+	// Copy the received vector 2 locally
+	memcpy(&rx_vect2_leg, rx_vect2, sizeof(struct rx_vector_2_old));
+
+	// Reset it
+	memset(rx_vect2, 0, sizeof(struct rx_vector_2));
+
+	rx_vect2->rcpi1 = rx_vect2_leg.rcpi;
+	rx_vect2->rcpi2 = rx_vect2_leg.rcpi;
+	rx_vect2->rcpi3 = rx_vect2_leg.rcpi;
+	rx_vect2->rcpi4 = rx_vect2_leg.rcpi;
+
+	rx_vect2->evm1 = rx_vect2_leg.evm1;
+	rx_vect2->evm2 = rx_vect2_leg.evm2;
+	rx_vect2->evm3 = rx_vect2_leg.evm3;
+	rx_vect2->evm4 = rx_vect2_leg.evm4;
+}
+
+/**
+ * aicwf_rx_statistic - save some statistics about received frames
+ *
+ * @aicwf_hw: main driver data.
+ * @hw_rxhdr: Rx Hardware descriptor of the received frame.
+ * @sta: STA that sent the frame.
+ */
+static void aicwf_rx_statistic(struct aicwf_hw *aicwf_hw,
+			       struct hw_rxhdr *hw_rxhdr, struct aicwf_sta *sta)
+{
+	struct aicwf_stats *stats = &aicwf_hw->stats;
+	struct aicwf_rx_rate_stats *rate_stats = &sta->stats.rx_rate;
+	struct rx_vector_1 *rxvect = &hw_rxhdr->hwvect.rx_vect1;
+	int mpdu, ampdu, mpdu_prev, rate_idx;
+
+	/* save complete hwvect */
+	sta->stats.last_rx = hw_rxhdr->hwvect;
+
+	/* update ampdu rx stats */
+	mpdu = hw_rxhdr->hwvect.mpdu_cnt;
+	ampdu = hw_rxhdr->hwvect.ampdu_cnt;
+	mpdu_prev = stats->ampdus_rx_map[ampdu];
+
+	if (mpdu_prev < mpdu)
+		stats->ampdus_rx_miss += mpdu - mpdu_prev - 1;
+	else
+		stats->ampdus_rx[mpdu_prev]++;
+	stats->ampdus_rx_map[ampdu] = mpdu;
+
+	/* update rx rate statistic */
+	if (!rate_stats->size)
+		return;
+
+	if (rxvect->format_mod > FORMATMOD_NON_HT_DUP_OFDM) {
+		int mcs;
+		int bw = rxvect->ch_bw;
+		int sgi;
+		int nss;
+
+		switch (rxvect->format_mod) {
+		case FORMATMOD_HT_MF:
+		case FORMATMOD_HT_GF:
+			mcs = rxvect->ht.mcs % 8;
+			nss = rxvect->ht.mcs / 8;
+			sgi = rxvect->ht.short_gi;
+			rate_idx = N_CCK + N_OFDM + nss * 32 + mcs * 4 + bw * 2 + sgi;
+			break;
+		case FORMATMOD_VHT:
+			mcs = rxvect->vht.mcs;
+			nss = rxvect->vht.nss;
+			sgi = rxvect->vht.short_gi;
+			rate_idx =
+				N_CCK + N_OFDM + N_HT + nss * 80 + mcs * 8 + bw * 2 + sgi;
+			break;
+		case FORMATMOD_HE_SU:
+			mcs = rxvect->he.mcs;
+			nss = rxvect->he.nss;
+			sgi = rxvect->he.gi_type;
+			rate_idx = N_CCK + N_OFDM + N_HT + N_VHT + nss * 144 + mcs * 12 +
+					   bw * 3 + sgi;
+			break;
+		default:
+			mcs = rxvect->he.mcs;
+			nss = rxvect->he.nss;
+			sgi = rxvect->he.gi_type;
+			rate_idx = N_CCK + N_OFDM + N_HT + N_VHT + N_HE_SU + nss * 216 +
+					   mcs * 18 + rxvect->he.ru_size * 3 + sgi;
+			break;
+		}
+	} else {
+		int idx = legrates_lut[rxvect->leg_rate].idx;
+
+		if (idx < 4)
+			rate_idx = idx * 2 + rxvect->pre_type;
+		else
+			rate_idx = N_CCK + idx - 4;
+	}
+	if (rate_idx >= 0 && rate_idx < rate_stats->size) {
+		if (!rate_stats->table[rate_idx])
+			rate_stats->rate_cnt++;
+		rate_stats->table[rate_idx]++;
+		rate_stats->cpt++;
+	} else {
+		wiphy_err(aicwf_hw->wiphy, "RX: Invalid index conversion => %d/%d\n",
+			  rate_idx, rate_stats->size);
+	}
+}
+
+/**
+ * aicwf_rx_data_skb_resend - Resend one received data frame
+ *
+ * @aicwf_hw: Main driver data
+ * @aicwf_vif: VIF that received the buffer
+ * @skb: Received socket buffer
+ * @rxhdr: Hardware receive descriptor
+ *
+ * Copy the received frame into a buffer with enough headroom and queue it for
+ * transmission on the same wireless interface.
+ */
+
+void aicwf_rx_data_skb_resend(struct aicwf_hw *aicwf_hw, struct aicwf_vif *aicwf_vif,
+			      struct sk_buff *skb, struct hw_rxhdr *rxhdr)
+{
+	struct sk_buff *rx_skb = skb;
+	struct sk_buff *skb_copy;
+
+	rx_skb->dev = aicwf_vif->ndev;
+	skb_reset_mac_header(rx_skb);
+	/* resend pkt on wireless interface */
+	/*
+	 * always need to copy buffer when forward=0 to get enough headrom for
+	 * tsdesc
+	 */
+	skb_copy = skb_copy_expand
+		(rx_skb, sizeof(struct aicwf_txhdr) + AICWF_SWTXHDR_ALIGN_SZ + 3 + 24 + 8,
+		0, GFP_ATOMIC);
+
+	if (skb_copy) {
+		int res;
+
+		skb_copy->protocol = htons(ETH_P_802_3);
+		skb_reset_network_header(skb_copy);
+		skb_reset_mac_header(skb_copy);
+
+		aicwf_vif->is_resending = true;
+		res = dev_queue_xmit(skb_copy);
+		aicwf_vif->is_resending = false;
+		/* note: buffer is always consummed by dev_queue_xmit */
+		if (res == NET_XMIT_DROP) {
+			aicwf_vif->net_stats.rx_dropped++;
+			aicwf_vif->net_stats.tx_dropped++;
+		} else if (res != NET_XMIT_SUCCESS) {
+			netdev_err(aicwf_vif->ndev,
+				   "failed to re-send buffer to driver: %d\n", res);
+			aicwf_vif->net_stats.tx_errors++;
+		}
+	} else {
+		netdev_err(aicwf_vif->ndev, "failed to copy skb\n");
+	}
+}
+
+static void aicwf_rx_data_skb_forward(struct aicwf_hw *aicwf_hw,
+				      struct aicwf_vif *aicwf_vif,
+				      struct sk_buff *skb,
+				      struct hw_rxhdr *rxhdr)
+{
+	struct sk_buff *rx_skb;
+
+	rx_skb = skb;
+	rx_skb->dev = aicwf_vif->ndev;
+	skb_reset_mac_header(rx_skb);
+
+	/* Update statistics */
+	aicwf_vif->net_stats.rx_packets++;
+	aicwf_vif->net_stats.rx_bytes += rx_skb->len;
+
+	rx_skb->protocol = eth_type_trans(rx_skb, aicwf_vif->ndev);
+	memset(rx_skb->cb, 0, sizeof(rx_skb->cb));
+
+#ifdef CONFIG_AIC8800_RX_NETIF_RECV_SKB // modify by aic
+	local_bh_disable();
+	netif_receive_skb(rx_skb);
+	local_bh_enable();
+#else
+	if (in_interrupt()) {
+		netif_rx(rx_skb);
+	} else {
+		/*
+		 * If the receive is not processed inside an ISR, the softirqd must be
+		 * woken explicitly to service the NET_RX_SOFTIRQ.
+		 * * In 2.6 kernels, this is handledby netif_rx_ni(), but in earlier
+		 * kernels, we need to do it manually.
+		 */
+		netif_rx_ni(rx_skb);
+	}
+#endif
+
+	aicwf_hw->stats.last_rx = jiffies;
+}
+
+bool aicwf_rx_data_skb(struct aicwf_hw *aicwf_hw, struct aicwf_vif *aicwf_vif,
+		       struct sk_buff *skb, struct hw_rxhdr *rxhdr)
+{
+	struct sk_buff_head list;
+	struct sk_buff *rx_skb;
+	bool amsdu = rxhdr->flags_is_amsdu;
+	u8 flags_dst_idx = rxhdr->flags_dst_idx;
+	bool resend = false, forward = true;
+
+	skb->dev = aicwf_vif->ndev;
+
+	__skb_queue_head_init(&list);
+
+	if (amsdu) {
+		aicwf_rxdata_process_amsdu
+			(aicwf_hw, skb, rxhdr->flags_vif_idx,
+			&list); // rxhdr not used below since skb free!
+	} else {
+		aicwf_hw->stats.amsdus_rx[0]++;
+		__skb_queue_head(&list, skb);
+	}
+
+	if (skb_queue_empty(&list))
+		return forward;
+
+	if ((AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_AP ||
+	     AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_AP_VLAN ||
+	     AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_P2P_GO) &&
+	     !(aicwf_vif->ap.flags & AICWF_AP_ISOLATE)) {
+		const struct ethhdr *eth;
+
+		rx_skb = skb_peek(&list);
+		skb_reset_mac_header(rx_skb);
+		eth = eth_hdr(rx_skb);
+
+		if (unlikely(is_multicast_ether_addr(eth->h_dest))) {
+			/*
+			 * broadcast pkt need to be forward to upper layer and resent
+			 * on wireless interface
+			 */
+			resend = true;
+		} else {
+			/*
+			 * unicast pkt for STA inside the BSS, no need to forward to upper
+			 * layer simply resend on wireless interface
+			 */
+			if (flags_dst_idx != AICWF_INVALID_STA) {
+				struct aicwf_sta *sta = &aicwf_hw->sta_table[flags_dst_idx];
+
+				if (sta->valid && sta->vlan_idx == aicwf_vif->vif_index) {
+					forward = false;
+					resend = true;
+				}
+			}
+		}
+	} else if (AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_MESH_POINT) {
+		const struct ethhdr *eth;
+
+		rx_skb = skb_peek(&list);
+		skb_reset_mac_header(rx_skb);
+		eth = eth_hdr(rx_skb);
+
+		if (!is_multicast_ether_addr(eth->h_dest)) {
+			/*
+			 * unicast pkt for STA inside the BSS, no need to forward to upper
+			 * layer simply resend on wireless interface
+			 */
+			if (flags_dst_idx != AICWF_INVALID_STA) {
+				forward = false;
+				resend = true;
+			}
+		}
+	}
+
+	while (!skb_queue_empty(&list)) {
+		rx_skb = __skb_dequeue(&list);
+
+		/* resend pkt on wireless interface */
+		if (resend) {
+			struct sk_buff *skb_copy;
+			/*
+			 * always need to copy buffer when forward=0 to get enough headrom
+			 * for tsdesc
+			 */
+			skb_copy = skb_copy_expand(rx_skb,
+						   sizeof(struct aicwf_txhdr) +
+						   AICWF_SWTXHDR_ALIGN_SZ + 3 + 24 + 8,
+						   0, GFP_ATOMIC);
+
+			if (skb_copy) {
+				int res;
+
+				skb_copy->protocol = htons(ETH_P_802_3);
+				skb_reset_network_header(skb_copy);
+				skb_reset_mac_header(skb_copy);
+
+				aicwf_vif->is_resending = true;
+				res = dev_queue_xmit(skb_copy);
+				aicwf_vif->is_resending = false;
+				/* note: buffer is always consummed by dev_queue_xmit */
+				if (res == NET_XMIT_DROP) {
+					aicwf_vif->net_stats.rx_dropped++;
+					aicwf_vif->net_stats.tx_dropped++;
+				} else if (res != NET_XMIT_SUCCESS) {
+					netdev_err(aicwf_vif->ndev,
+						   "failed to re-send buffer to driver: %d\n",
+						   res);
+					aicwf_vif->net_stats.tx_errors++;
+				}
+			} else {
+				netdev_err(aicwf_vif->ndev, "failed to copy skb\n");
+			}
+		}
+
+		/* forward pkt to upper layer */
+		if (forward) {
+			/* Update statistics */
+			aicwf_vif->net_stats.rx_packets++;
+			aicwf_vif->net_stats.rx_bytes += rx_skb->len;
+
+			rx_skb->protocol = eth_type_trans(rx_skb, aicwf_vif->ndev);
+#ifdef CONFIG_AIC8800_ARP_OFFLOAD
+			if (AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_STATION ||
+			    AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_P2P_CLIENT)
+				arpoffload_proc(rx_skb, aicwf_vif);
+#endif
+			memset(rx_skb->cb, 0, sizeof(rx_skb->cb));
+
+#ifdef CONFIG_AIC8800_RX_NETIF_RECV_SKB // modify by aic
+			local_bh_disable();
+			netif_receive_skb(rx_skb);
+			local_bh_enable();
+#else
+			if (in_interrupt()) {
+				netif_rx(rx_skb);
+			} else {
+				/*
+				 * If the receive is not processed inside an ISR, the softirqd
+				 * must be woken explicitly to service the NET_RX_SOFTIRQ.
+				 * * In 2.6 kernels, this is handledby netif_rx_ni(), but in
+				 * earlier kernels, we need to do it manually.
+				 */
+				netif_rx_ni(rx_skb);
+			}
+#endif
+
+			aicwf_hw->stats.last_rx = jiffies;
+		}
+	}
+
+	return forward;
+}
+
+/*
+ * aicwf_rx_mgmt - Process one 802.11 management frame
+ *
+ * @aicwf_hw: main driver data
+ * @aicwf_vif: vif to upload the buffer to
+ * @skb: skb received
+ * @rxhdr: HW rx descriptor
+ *
+ * Forward the management frame to a given interface.
+ */
+static void aicwf_rx_mgmt(struct aicwf_hw *aicwf_hw, struct aicwf_vif *aicwf_vif,
+			  struct sk_buff *skb, struct hw_rxhdr *hw_rxhdr)
+{
+	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)skb->data;
+	struct rx_vector_1 *rxvect = &hw_rxhdr->hwvect.rx_vect1;
+
+	if (ieee80211_is_mgmt(mgmt->frame_control) &&
+	    (skb->len <= 24 || skb->len > 768)) {
+		dev_dbg(aicwf_hw->dev, "mgmt err\n");
+		return;
+	}
+	if (ieee80211_is_beacon(mgmt->frame_control)) {
+		if (skb->len < offsetof(struct ieee80211_mgmt, u.beacon.variable))
+			return;
+		if ((AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_MESH_POINT) &&
+		    hw_rxhdr->flags_new_peer) {
+			/* TODO: the value of parameter sig_dbm need to be confirmed */
+			cfg80211_notify_new_peer_candidate
+			(aicwf_vif->ndev, mgmt->sa, mgmt->u.beacon.variable,
+			 skb->len - offsetof(struct ieee80211_mgmt, u.beacon.variable),
+			 rxvect->rssi1, GFP_ATOMIC);
+		} else {
+			cfg80211_report_obss_beacon(aicwf_hw->wiphy, skb->data, skb->len,
+						    hw_rxhdr->phy_info.phy_prim20_freq,
+						    rxvect->rssi1);
+		}
+	} else if (skb->len >= offsetofend(struct ieee80211_mgmt, u.deauth.reason_code) &&
+		   (ieee80211_is_deauth(mgmt->frame_control) ||
+				ieee80211_is_disassoc(mgmt->frame_control)) &&
+				   (le16_to_cpu(mgmt->u.deauth.reason_code) ==
+					WLAN_REASON_CLASS2_FRAME_FROM_NONAUTH_STA ||
+					le16_to_cpu(mgmt->u.deauth.reason_code) ==
+					WLAN_REASON_CLASS3_FRAME_FROM_NONASSOC_STA)) {
+		cfg80211_rx_unprot_mlme_mgmt(aicwf_vif->ndev, skb->data, skb->len);
+	} else if ((AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_STATION) &&
+			   (ieee80211_is_action(mgmt->frame_control) &&
+				(mgmt->u.action.category == 6))) {
+		struct cfg80211_ft_event_params ft_event;
+
+		ft_event.target_ap = (uint8_t *)&mgmt->u.action + ETH_ALEN + 2;
+		ft_event.ies = (uint8_t *)&mgmt->u.action + ETH_ALEN * 2 + 2;
+		if (skb->len < ft_event.ies - (uint8_t *)mgmt)
+			return;
+		ft_event.ies_len = skb->len - (ft_event.ies - (uint8_t *)mgmt);
+		ft_event.ric_ies = NULL;
+		ft_event.ric_ies_len = 0;
+		cfg80211_ft_event(aicwf_vif->ndev, &ft_event);
+	} else {
+		cfg80211_rx_mgmt(&aicwf_vif->wdev, hw_rxhdr->phy_info.phy_prim20_freq,
+				 rxvect->rssi1, skb->data, skb->len, 0);
+	}
+}
+
+/*
+ * aicwf_rx_mgmt_any - Process one 802.11 management frame
+ *
+ * @aicwf_hw: main driver data
+ * @skb: skb received
+ * @rxhdr: HW rx descriptor
+ *
+ * Process the management frame and free the corresponding skb.
+ * If vif is not specified in the rx descriptor, the frame is uploaded
+ * on all active vifs.
+ */
+static void aicwf_rx_mgmt_any(struct aicwf_hw *aicwf_hw, struct sk_buff *skb,
+			      struct hw_rxhdr *hw_rxhdr)
+{
+	struct aicwf_vif *aicwf_vif;
+	int vif_idx = hw_rxhdr->flags_vif_idx;
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_mgmt_rx(hw_rxhdr->phy_info.phy_prim20_freq, vif_idx,
+		      hw_rxhdr->flags_sta_idx, (struct ieee80211_mgmt *)skb->data);
+#endif
+	if (vif_idx == AICWF_INVALID_VIF) {
+		list_for_each_entry(aicwf_vif, &aicwf_hw->vifs, list) {
+			if (!aicwf_vif->up)
+				continue;
+			aicwf_rx_mgmt(aicwf_hw, aicwf_vif, skb, hw_rxhdr);
+		}
+	} else {
+		aicwf_vif = aicwf_rx_get_vif(aicwf_hw, vif_idx);
+		if (aicwf_vif)
+			aicwf_rx_mgmt(aicwf_hw, aicwf_vif, skb, hw_rxhdr);
+	}
+
+	dev_kfree_skb(skb);
+}
+
+/**
+ * aicwf_rx_rtap_hdrlen - Return radiotap header length
+ *
+ * @rxvect: Rx vector used to fill the radiotap header
+ * @has_vend_rtap: boolean indicating if vendor specific data is present
+ *
+ * Compute the length of the radiotap header based on @rxvect and vendor
+ * specific data (if any).
+ *
+ * Return: Required radiotap header length in bytes.
+ */
+static u8 aicwf_rx_rtap_hdrlen(struct rx_vector_1 *rxvect, bool has_vend_rtap)
+{
+	u8 rtap_len;
+
+	/* Compute radiotap header length */
+	rtap_len = sizeof(struct ieee80211_radiotap_header) + 8;
+
+	// Check for multiple antennas
+	if (hweight32(rxvect->antenna_set) > 1)
+		// antenna and antenna signal fields
+		rtap_len += 4 * hweight8(rxvect->antenna_set);
+
+	// TSFT
+	if (!has_vend_rtap) {
+		rtap_len = ALIGN(rtap_len, 8);
+		rtap_len += 8;
+	}
+
+	// IEEE80211_HW_SIGNAL_DBM
+	rtap_len++;
+
+	// Check if single antenna
+	if (hweight32(rxvect->antenna_set) == 1)
+		rtap_len++; // Single antenna
+
+	// padding for RX FLAGS
+	rtap_len = ALIGN(rtap_len, 2);
+
+	// Check for HT frames
+	if (rxvect->format_mod == FORMATMOD_HT_MF ||
+	    rxvect->format_mod == FORMATMOD_HT_GF)
+		rtap_len += 3;
+
+	// Check for AMPDU
+	if (!(has_vend_rtap) &&
+	    (rxvect->format_mod >= FORMATMOD_VHT ||
+	     (rxvect->format_mod > FORMATMOD_NON_HT_DUP_OFDM &&
+	      rxvect->ht.aggregation))) {
+		rtap_len = ALIGN(rtap_len, 4);
+		rtap_len += 8;
+	}
+
+	// Check for VHT frames
+	if (rxvect->format_mod == FORMATMOD_VHT) {
+		rtap_len = ALIGN(rtap_len, 2);
+		rtap_len += 12;
+	}
+
+	// Check for HE frames
+	if (rxvect->format_mod == FORMATMOD_HE_SU) {
+		rtap_len = ALIGN(rtap_len, 2);
+		rtap_len += sizeof(struct ieee80211_radiotap_he);
+	}
+
+	// Check for multiple antennas
+	if (hweight32(rxvect->antenna_set) > 1) {
+		// antenna and antenna signal fields
+		rtap_len += 2 * hweight8(rxvect->antenna_set);
+	}
+
+	// Check for vendor specific data
+	if (has_vend_rtap) {
+		/* vendor presence bitmap */
+		rtap_len += 4;
+		/* alignment for fixed 6-byte vendor data header */
+		rtap_len = ALIGN(rtap_len, 2);
+	}
+
+	return rtap_len;
+}
+
+/**
+ * aicwf_rx_add_rtap_hdr - Add radiotap header to sk_buff
+ *
+ * @aicwf_hw: main driver data
+ * @skb: skb received (will include the radiotap header)
+ * @rxvect: Rx vector
+ * @phy_info: Information regarding the phy
+ * @hwvect: HW Info (NULL if vendor specific data is available)
+ * @rtap_len: Length of the radiotap header
+ * @vend_rtap_len: radiotap vendor length (0 if not present)
+ * @vend_it_present: radiotap vendor present
+ *
+ * Builds a radiotap header and add it to @skb.
+ */
+static void aicwf_rx_add_rtap_hdr(struct aicwf_hw *aicwf_hw, struct sk_buff *skb,
+				  struct rx_vector_1 *rxvect,
+				  struct phy_channel_info_desc *phy_info,
+				  struct hw_vect *hwvect, int rtap_len,
+				  u8 vend_rtap_len, u32 vend_it_present)
+{
+	struct ieee80211_radiotap_header *rtap;
+	u8 *pos;
+	int rate_idx;
+	__le32 *it_present;
+	u32 it_present_val = 0;
+	bool fec_coding = false;
+	bool short_gi = false;
+	bool stbc = false;
+	bool aggregation = false;
+
+	rtap = (struct ieee80211_radiotap_header *)skb_push(skb, rtap_len);
+	memset((u8 *)rtap, 0, rtap_len);
+
+	rtap->it_version = 0;
+	rtap->it_pad = 0;
+	rtap->it_len = cpu_to_le16(rtap_len + vend_rtap_len);
+
+	it_present = &rtap->it_present;
+
+	// Check for multiple antennas
+	if (hweight32(rxvect->antenna_set) > 1) {
+		int chain;
+		unsigned long chains = rxvect->antenna_set;
+
+		for_each_set_bit(chain, &chains, IEEE80211_MAX_CHAINS) {
+			it_present_val |= BIT(IEEE80211_RADIOTAP_EXT) |
+					  BIT(IEEE80211_RADIOTAP_RADIOTAP_NAMESPACE);
+			put_unaligned_le32(it_present_val, it_present);
+			it_present++;
+			it_present_val = BIT(IEEE80211_RADIOTAP_ANTENNA) |
+					 BIT(IEEE80211_RADIOTAP_DBM_ANTSIGNAL);
+		}
+	}
+
+	// Check if vendor specific data is present
+	if (vend_rtap_len) {
+		it_present_val |= BIT(IEEE80211_RADIOTAP_VENDOR_NAMESPACE) |
+						  BIT(IEEE80211_RADIOTAP_EXT);
+		put_unaligned_le32(it_present_val, it_present);
+		it_present++;
+		it_present_val = vend_it_present;
+	}
+
+	put_unaligned_le32(it_present_val, it_present);
+	pos = (void *)(it_present + 1);
+
+	// IEEE80211_RADIOTAP_TSFT
+	if (hwvect) {
+		rtap->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_TSFT);
+		// padding
+		while ((pos - (u8 *)rtap) & 7)
+			*pos++ = 0;
+		put_unaligned_le64((((u64)le32_to_cpu(hwvect->tsf_hi) << 32) +
+						(u64)le32_to_cpu(hwvect->tsf_lo)),
+						pos);
+		pos += 8;
+	}
+
+	// IEEE80211_RADIOTAP_FLAGS
+	rtap->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_FLAGS);
+	if (hwvect && !hwvect->frm_successful_rx)
+		*pos |= IEEE80211_RADIOTAP_F_BADFCS;
+	if (!rxvect->pre_type && rxvect->format_mod <= FORMATMOD_NON_HT_DUP_OFDM)
+		*pos |= IEEE80211_RADIOTAP_F_SHORTPRE;
+	pos++;
+
+	// IEEE80211_RADIOTAP_RATE
+	// check for HT, VHT or HE frames
+	if (rxvect->format_mod >= FORMATMOD_HE_SU) {
+		rate_idx = rxvect->he.mcs;
+		fec_coding = rxvect->he.fec;
+		stbc = rxvect->he.stbc;
+		aggregation = true;
+		*pos = 0;
+	} else if (rxvect->format_mod == FORMATMOD_VHT) {
+		rate_idx = rxvect->vht.mcs;
+		fec_coding = rxvect->vht.fec;
+		short_gi = rxvect->vht.short_gi;
+		stbc = rxvect->vht.stbc;
+		aggregation = true;
+		*pos = 0;
+	} else if (rxvect->format_mod > FORMATMOD_NON_HT_DUP_OFDM) {
+		rate_idx = rxvect->ht.mcs;
+		fec_coding = rxvect->ht.fec;
+		short_gi = rxvect->ht.short_gi;
+		stbc = rxvect->ht.stbc;
+		aggregation = rxvect->ht.aggregation;
+		*pos = 0;
+	} else {
+		struct ieee80211_supported_band *band =
+			aicwf_hw->wiphy->bands[phy_info->phy_band];
+		rtap->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_RATE);
+		rate_idx = legrates_lut[rxvect->leg_rate].idx;
+		if (phy_info->phy_band == NL80211_BAND_5GHZ)
+			rate_idx -= 4;
+		if (WARN_ON_ONCE(rate_idx < 0 || rate_idx >= band->n_bitrates))
+			*pos = 0;
+		else
+			*pos = DIV_ROUND_UP(band->bitrates[rate_idx].bitrate, 5);
+	}
+	pos++;
+
+	// IEEE80211_RADIOTAP_CHANNEL
+	rtap->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_CHANNEL);
+	put_unaligned_le16(phy_info->phy_prim20_freq, pos);
+	pos += 2;
+
+	if (phy_info->phy_band == NL80211_BAND_5GHZ)
+		put_unaligned_le16(IEEE80211_CHAN_OFDM | IEEE80211_CHAN_5GHZ, pos);
+	else if (rxvect->format_mod > FORMATMOD_NON_HT_DUP_OFDM)
+		put_unaligned_le16(IEEE80211_CHAN_DYN | IEEE80211_CHAN_2GHZ, pos);
+	else
+		put_unaligned_le16(IEEE80211_CHAN_CCK | IEEE80211_CHAN_2GHZ, pos);
+	pos += 2;
+
+	if (hweight32(rxvect->antenna_set) == 1) {
+		// IEEE80211_RADIOTAP_DBM_ANTSIGNAL
+		rtap->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_DBM_ANTSIGNAL);
+		*pos++ = rxvect->rssi1;
+
+		// IEEE80211_RADIOTAP_ANTENNA
+		rtap->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_ANTENNA);
+		*pos++ = rxvect->antenna_set;
+	}
+
+	// IEEE80211_RADIOTAP_RX_FLAGS
+	rtap->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_RX_FLAGS);
+	// 2 byte alignment
+	if ((pos - (u8 *)rtap) & 1)
+		*pos++ = 0;
+	put_unaligned_le16(0, pos);
+	// Right now, we only support fcs error (no RX_FLAG_FAILED_PLCP_CRC)
+	pos += 2;
+
+	// Check if HT
+	if (rxvect->format_mod == FORMATMOD_HT_MF ||
+	    rxvect->format_mod == FORMATMOD_HT_GF) {
+		rtap->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_MCS);
+		*pos++ = IEEE80211_RADIOTAP_MCS_HAVE_MCS |
+				 IEEE80211_RADIOTAP_MCS_HAVE_GI |
+				 IEEE80211_RADIOTAP_MCS_HAVE_BW;
+		*pos = 0;
+		if (short_gi)
+			*pos |= IEEE80211_RADIOTAP_MCS_SGI;
+		if (rxvect->ch_bw == PHY_CHNL_BW_40)
+			*pos |= IEEE80211_RADIOTAP_MCS_BW_40;
+		if (rxvect->format_mod == FORMATMOD_HT_GF)
+			*pos |= IEEE80211_RADIOTAP_MCS_FMT_GF;
+		if (fec_coding)
+			*pos |= IEEE80211_RADIOTAP_MCS_FEC_LDPC;
+		*pos++ |= stbc << IEEE80211_RADIOTAP_MCS_STBC_SHIFT;
+		*pos++ = rate_idx;
+	}
+
+	// check for HT or VHT frames
+	if (aggregation && hwvect) {
+		// 4 byte alignment
+		while ((pos - (u8 *)rtap) & 3)
+			pos++;
+		rtap->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_AMPDU_STATUS);
+		put_unaligned_le32(hwvect->ampdu_cnt, pos);
+		pos += 4;
+		put_unaligned_le32(0, pos);
+		pos += 4;
+	}
+
+	// Check for VHT frames
+	if (rxvect->format_mod == FORMATMOD_VHT) {
+		u16 vht_details = IEEE80211_RADIOTAP_VHT_KNOWN_GI |
+						  IEEE80211_RADIOTAP_VHT_KNOWN_BANDWIDTH;
+		u8 vht_nss = rxvect->vht.nss + 1;
+
+		rtap->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_VHT);
+
+		if (rxvect->ch_bw == PHY_CHNL_BW_160 && phy_info->phy_center2_freq)
+			vht_details &= ~IEEE80211_RADIOTAP_VHT_KNOWN_BANDWIDTH;
+		put_unaligned_le16(vht_details, pos);
+		pos += 2;
+
+		// flags
+		if (short_gi)
+			*pos |= IEEE80211_RADIOTAP_VHT_FLAG_SGI;
+		if (stbc)
+			*pos |= IEEE80211_RADIOTAP_VHT_FLAG_STBC;
+		pos++;
+
+		// bandwidth
+		if (rxvect->ch_bw == PHY_CHNL_BW_40)
+			*pos++ = 1;
+		if (rxvect->ch_bw == PHY_CHNL_BW_80)
+			*pos++ = 4;
+		else if ((rxvect->ch_bw == PHY_CHNL_BW_160) &&
+			 phy_info->phy_center2_freq)
+			*pos++ = 0; // 80P80
+		else if (rxvect->ch_bw == PHY_CHNL_BW_160)
+			*pos++ = 11;
+		else // 20 MHz
+			*pos++ = 0;
+
+		// MCS/NSS
+		*pos = (rate_idx << 4) | vht_nss;
+		pos += 4;
+		if (fec_coding)
+			*pos |= IEEE80211_RADIOTAP_CODING_LDPC_USER0;
+		pos++;
+		// group ID
+		pos++;
+		// partial_aid
+		pos += 2;
+	}
+
+	// Check for HE frames
+	if (rxvect->format_mod == FORMATMOD_HE_SU) {
+		struct ieee80211_radiotap_he he;
+#define HE_PREP(f, val) cpu_to_le16(FIELD_PREP(IEEE80211_RADIOTAP_HE_##f, val))
+#define D1_KNOWN(f)     cpu_to_le16(IEEE80211_RADIOTAP_HE_DATA1_##f##_KNOWN)
+#define D2_KNOWN(f)     cpu_to_le16(IEEE80211_RADIOTAP_HE_DATA2_##f##_KNOWN)
+
+		he.data1 = D1_KNOWN(DATA_MCS) | D1_KNOWN(BSS_COLOR) |
+				   D1_KNOWN(BEAM_CHANGE) | D1_KNOWN(UL_DL) | D1_KNOWN(CODING) |
+				   D1_KNOWN(STBC) | D1_KNOWN(BW_RU_ALLOC) | D1_KNOWN(DOPPLER) |
+				   D1_KNOWN(DATA_DCM);
+		he.data2 = D2_KNOWN(GI) | D2_KNOWN(TXBF);
+
+		if (stbc) {
+			he.data6 |= HE_PREP(DATA6_NSTS, 2);
+			he.data3 |= HE_PREP(DATA3_STBC, 1);
+		} else {
+			he.data6 |= HE_PREP(DATA6_NSTS, rxvect->he.nss);
+		}
+
+		he.data3 |= HE_PREP(DATA3_BSS_COLOR, rxvect->he.bss_color);
+		he.data3 |= HE_PREP(DATA3_BEAM_CHANGE, rxvect->he.beam_change);
+		he.data3 |= HE_PREP(DATA3_UL_DL, rxvect->he.uplink_flag);
+		he.data3 |= HE_PREP(DATA3_BSS_COLOR, rxvect->he.bss_color);
+		he.data3 |= HE_PREP(DATA3_DATA_MCS, rxvect->he.mcs);
+		he.data3 |= HE_PREP(DATA3_DATA_DCM, rxvect->he.dcm);
+		he.data3 |= HE_PREP(DATA3_CODING, rxvect->he.fec);
+
+		he.data5 |= HE_PREP(DATA5_GI, rxvect->he.gi_type);
+		he.data5 |= HE_PREP(DATA5_TXBF, rxvect->he.beamformed);
+		he.data5 |= HE_PREP(DATA5_LTF_SIZE, rxvect->he.he_ltf_type + 1);
+
+		switch (rxvect->ch_bw) {
+		case PHY_CHNL_BW_20:
+			he.data5 |=
+				HE_PREP(DATA5_DATA_BW_RU_ALLOC,
+					IEEE80211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC_20MHZ);
+			break;
+		case PHY_CHNL_BW_40:
+			he.data5 |=
+				HE_PREP(DATA5_DATA_BW_RU_ALLOC,
+					IEEE80211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC_40MHZ);
+			break;
+		case PHY_CHNL_BW_80:
+			he.data5 |=
+				HE_PREP(DATA5_DATA_BW_RU_ALLOC,
+					IEEE80211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC_80MHZ);
+			break;
+		case PHY_CHNL_BW_160:
+			he.data5 |=
+				HE_PREP(DATA5_DATA_BW_RU_ALLOC,
+					IEEE80211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC_160MHZ);
+			break;
+		default:
+			WARN_ONCE(1, "Invalid SU BW %d\n", rxvect->ch_bw);
+		}
+
+		he.data6 |= HE_PREP(DATA6_DOPPLER, rxvect->he.doppler);
+
+		/* ensure 2 byte alignment */
+		while ((pos - (u8 *)rtap) & 1)
+			pos++;
+		rtap->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_HE);
+		if ((pos + sizeof(he)) <= (u8 *)rtap + rtap_len) {
+			u8 *src = (u8 *)&he;
+			u8 *dst = pos;
+
+			for (size_t i = 0; i < sizeof(he); i++)
+				dst[i] = src[i];
+			pos += sizeof(he);
+		} else {
+			dev_err(aicwf_hw->dev, "not enough space for HE radiotap data\n");
+			return;
+		}
+		//memcpy(pos, &he, sizeof(he));
+		//pos += sizeof(he);
+	}
+
+	// Rx Chains
+	if (hweight32(rxvect->antenna_set) > 1) {
+		int chain;
+		unsigned long chains = rxvect->antenna_set;
+		u8 rssis[4] = {rxvect->rssi1, rxvect->rssi1, rxvect->rssi1,
+					   rxvect->rssi1};
+
+		for_each_set_bit(chain, &chains, IEEE80211_MAX_CHAINS) {
+			*pos++ = rssis[chain];
+			*pos++ = chain;
+		}
+	}
+}
+
+/**
+ * aicwf_rx_monitor - Add a radiotap header and deliver a monitor frame
+ *
+ * @aicwf_hw: main driver data
+ * @aicwf_vif: vif that received the buffer
+ * @skb: sk_buff received
+ * @hw_rxhdr_ptr: Pointer to HW RX header
+ * @rtap_len: Radiotap Header length
+ *
+ * Add a radiotap header to the received socket buffer and send it to netdev.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+static int aicwf_rx_monitor(struct aicwf_hw *aicwf_hw, struct aicwf_vif *aicwf_vif,
+			    struct sk_buff *skb, struct hw_rxhdr *hw_rxhdr_ptr,
+			    u8 rtap_len)
+{
+	skb->dev = aicwf_vif->ndev;
+
+	if (aicwf_vif->wdev.iftype != NL80211_IFTYPE_MONITOR) {
+		netdev_err(aicwf_vif->ndev, "not a monitor vif\n");
+		return -1;
+	}
+
+	/* Add RadioTap Header */
+	if (skb_headroom(skb) < rtap_len) {
+		if (pskb_expand_head(skb, rtap_len, 0, GFP_ATOMIC)) {
+			dev_err(aicwf_hw->dev, "failed to expand skb headroom for radiotap header\n");
+			return -ENOMEM;
+		}
+		aicwf_rx_add_rtap_hdr(aicwf_hw, skb, &hw_rxhdr_ptr->hwvect.rx_vect1,
+				      &hw_rxhdr_ptr->phy_info, &hw_rxhdr_ptr->hwvect,
+				      rtap_len, 0, 0);
+	} else {
+		aicwf_rx_add_rtap_hdr(aicwf_hw, skb, &hw_rxhdr_ptr->hwvect.rx_vect1,
+				      &hw_rxhdr_ptr->phy_info, &hw_rxhdr_ptr->hwvect,
+				      rtap_len, 0, 0);
+	}
+
+	skb_reset_mac_header(skb);
+	skb->ip_summed = CHECKSUM_UNNECESSARY;
+	skb->pkt_type = PACKET_OTHERHOST;
+	skb->protocol = htons(ETH_P_802_2);
+
+	local_bh_disable();
+	netif_receive_skb(skb);
+	local_bh_enable();
+
+	return 0;
+}
+
+#ifdef CONFIG_AIC8800_ARP_OFFLOAD
+
+static void handle_dhcp_ack(u8 *option, u16 offset, struct dhcpinfo *dhcph,
+			    struct aicwf_vif *aicwf_vif)
+{
+	if (option[offset] == DHCP_OPTION_MESSAGE_TYPE &&
+	    option[offset + 2] == DHCP_ACK) {
+		struct aicwf_hw *aicwf_hw = aicwf_vif->aicwf_hw;
+
+		if (aicwf_hw)
+			dev_dbg(aicwf_hw->dev, "paired=%x, should=%x\n",
+				aicwf_vif->sta.paired_cipher_type,
+				WLAN_CIPHER_SUITE_CCMP);
+
+		if (aicwf_vif->sta.paired_cipher_type == WLAN_CIPHER_SUITE_CCMP ||
+		    aicwf_vif->sta.paired_cipher_type == WLAN_CIPHER_SUITE_AES_CMAC ||
+		    (aicwf_vif->sta.group_cipher_type == 0xff &&
+		     aicwf_vif->sta.paired_cipher_type == 0xff)) {
+			aicwf_send_arpoffload_en_req(aicwf_vif->aicwf_hw, aicwf_vif, dhcph->yiaddr, 1);
+		} else {
+			aicwf_send_arpoffload_en_req(aicwf_vif->aicwf_hw, aicwf_vif, dhcph->yiaddr, 0);
+		}
+	}
+}
+
+void arpoffload_proc(struct sk_buff *skb, struct aicwf_vif *aicwf_vif)
+{
+	struct iphdr *iphead;
+	struct udphdr *udph;
+	struct dhcpinfo *dhcph;
+	unsigned int ip_len, ip_hdr_len, udp_len, length, offset = 0;
+	u8 *option;
+
+	if (skb->protocol != htons(ETH_P_IP) ||
+	    !pskb_may_pull(skb, sizeof(*iphead)))
+		return;
+
+	iphead = (struct iphdr *)skb->data;
+	if (iphead->version != 4 || iphead->ihl < 5 ||
+	    iphead->protocol != IPPROTO_UDP || ip_is_fragment(iphead))
+		return;
+
+	ip_hdr_len = iphead->ihl * 4;
+	ip_len = ntohs(iphead->tot_len);
+	if (ip_len > skb->len || ip_len < ip_hdr_len + sizeof(*udph) ||
+	    !pskb_may_pull(skb, ip_hdr_len + sizeof(*udph)))
+		return;
+
+	udph = (struct udphdr *)(skb->data + ip_hdr_len);
+	udp_len = ntohs(udph->len);
+	if (udph->source != htons(SERVER_PORT) ||
+	    udph->dest != htons(CLIENT_PORT) ||
+	    udp_len > ip_len - ip_hdr_len ||
+	    udp_len < sizeof(*udph) + offsetof(struct dhcpinfo, options) ||
+	    !pskb_may_pull(skb, ip_hdr_len + udp_len))
+		return;
+
+	dhcph = (struct dhcpinfo *)(skb->data + ip_hdr_len + sizeof(*udph));
+	if (dhcph->cookie != htonl(DHCP_MAGIC) || dhcph->op != 2 ||
+	    memcmp(dhcph->chaddr, aicwf_vif->ndev->dev_addr, ETH_ALEN))
+		return;
+
+	length = udp_len - sizeof(*udph) - offsetof(struct dhcpinfo, options);
+	option = (u8 *)dhcph + offsetof(struct dhcpinfo, options);
+	while (offset < length) {
+		u8 code = option[offset];
+		u8 option_len;
+
+		if (code == DHCP_OPTION_END)
+			break;
+		if (!code) { /* DHCP padding is a single byte. */
+			offset++;
+			continue;
+		}
+		if (length - offset < 2)
+			break;
+		option_len = option[offset + 1];
+		if (option_len > length - offset - 2)
+			break;
+		if (code == DHCP_OPTION_MESSAGE_TYPE && option_len == 1)
+			handle_dhcp_ack(option, offset, dhcph, aicwf_vif);
+		offset += 2 + option_len;
+	}
+}
+#endif
+
+#ifdef CONFIG_AIC8800_RX_REORDER
+void reord_rxframe_free(spinlock_t *lock, struct list_head *q,
+			struct list_head *list)
+{
+	spin_lock_bh(lock);
+	list_add(list, q);
+	spin_unlock_bh(lock);
+}
+
+struct recv_msdu *reord_rxframe_alloc(spinlock_t *lock, struct list_head *q)
+{
+	struct recv_msdu *rxframe;
+
+	spin_lock_bh(lock);
+	if (list_empty(q)) {
+		spin_unlock_bh(lock);
+		return NULL;
+	}
+	rxframe = list_entry(q->next, struct recv_msdu, rxframe_list);
+	list_del_init(q->next);
+	spin_unlock_bh(lock);
+	return rxframe;
+}
+
+struct reord_ctrl_info *reord_init_sta(struct aicwf_rx_priv *rx_priv,
+				       const u8 *mac_addr)
+{
+	u8 i = 0;
+	struct reord_ctrl *preorder_ctrl = NULL;
+	struct reord_ctrl_info *reord_info;
+	struct aicwf_bus *bus_if = rx_priv->sdiodev->bus_if;
+
+	if (bus_if->state == BUS_DOWN_ST || !rx_priv) {
+		dev_err(bus_if->dev, "bad stat!\n");
+		return NULL;
+	}
+
+	pr_debug("%pM\n", mac_addr);
+	reord_info = kmalloc_obj(*reord_info, GFP_ATOMIC);
+	if (!reord_info)
+		return NULL;
+
+	memcpy(reord_info->mac_addr, mac_addr, ETH_ALEN);
+	for (i = 0; i < 8; i++) {
+		preorder_ctrl = &reord_info->preorder_ctrl[i];
+		preorder_ctrl->enable = true;
+		preorder_ctrl->ind_sn = 0xffff;
+		preorder_ctrl->wsize_b = AICWF_REORDER_WINSIZE;
+		preorder_ctrl->rx_priv = rx_priv;
+		INIT_LIST_HEAD(&preorder_ctrl->reord_list);
+		spin_lock_init(&preorder_ctrl->reord_list_lock);
+		timer_setup(&preorder_ctrl->reord_timer, reord_timeout_handler, 0);
+		INIT_WORK(&preorder_ctrl->reord_timer_work, reord_timeout_worker);
+	}
+
+	return reord_info;
+}
+
+int reord_flush_tid(struct aicwf_rx_priv *rx_priv, struct sk_buff *skb, u8 tid)
+{
+	struct reord_ctrl_info *reord_info;
+	struct reord_ctrl *preorder_ctrl;
+	struct aicwf_vif *aicwf_vif = (struct aicwf_vif *)rx_priv->aicwf_vif;
+	struct ethhdr *eh = (struct ethhdr *)(skb->data);
+	u8 *mac;
+	unsigned long flags;
+	u8 found = 0;
+	struct list_head *phead, *plist;
+	struct recv_msdu *prframe;
+
+	if (!aicwf_vif || skb->len < ETH_HLEN ||
+	    tid >= ARRAY_SIZE(reord_info->preorder_ctrl))
+		return -EINVAL;
+
+	if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_STATION ||
+	    aicwf_vif->wdev.iftype == NL80211_IFTYPE_P2P_CLIENT) {
+		mac = eh->h_dest;
+	} else if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_AP ||
+		   aicwf_vif->wdev.iftype == NL80211_IFTYPE_P2P_GO) {
+		mac = eh->h_source;
+	} else {
+		struct aicwf_hw *aicwf_hw = aicwf_vif->aicwf_hw;
+
+		if (aicwf_hw)
+			dev_err(aicwf_hw->dev, "error mode:%d!\n", aicwf_vif->wdev.iftype);
+		dev_kfree_skb(skb);
+		return -1;
+	}
+
+	spin_lock_bh(&rx_priv->stas_reord_lock);
+	list_for_each_entry(reord_info, &rx_priv->stas_reord_list, list) {
+		if (!memcmp(mac, reord_info->mac_addr, ETH_ALEN)) {
+			found = 1;
+			preorder_ctrl = &reord_info->preorder_ctrl[tid];
+			break;
+		}
+	}
+	if (!found) {
+		spin_unlock_bh(&rx_priv->stas_reord_lock);
+		return 0;
+	}
+	spin_unlock_bh(&rx_priv->stas_reord_lock);
+
+	if (!preorder_ctrl->enable)
+		return 0;
+	spin_lock_irqsave(&preorder_ctrl->reord_list_lock, flags);
+	phead = &preorder_ctrl->reord_list;
+	while (1) {
+		if (list_empty(phead))
+			break;
+		plist = phead->next;
+		prframe = list_entry(plist, struct recv_msdu, reord_pending_list);
+		reord_single_frame_ind(rx_priv, prframe);
+		list_del_init(&prframe->reord_pending_list);
+	}
+
+	pr_debug("flush:tid=%d", tid);
+	preorder_ctrl->enable = false;
+	spin_unlock_irqrestore(&preorder_ctrl->reord_list_lock, flags);
+	if (timer_pending(&preorder_ctrl->reord_timer))
+		timer_delete_sync(&preorder_ctrl->reord_timer);
+	cancel_work_sync(&preorder_ctrl->reord_timer_work);
+
+	return 0;
+}
+
+void reord_deinit_sta(struct aicwf_rx_priv *rx_priv,
+		      struct reord_ctrl_info *reord_info)
+{
+	u8 i = 0;
+	unsigned long flags;
+	struct reord_ctrl *preorder_ctrl = NULL;
+
+	if (!rx_priv) {
+		pr_err("bad rx_priv!\n");
+		return;
+	}
+
+	for (i = 0; i < 8; i++) {
+		struct recv_msdu *req, *next;
+
+		preorder_ctrl = &reord_info->preorder_ctrl[i];
+		spin_lock_irqsave(&preorder_ctrl->reord_list_lock, flags);
+		list_for_each_entry_safe(req, next, &preorder_ctrl->reord_list,
+					 reord_pending_list) {
+			list_del_init(&req->reord_pending_list);
+			if (req->pkt)
+				dev_kfree_skb(req->pkt);
+			req->pkt = NULL;
+			reord_rxframe_free(&rx_priv->freeq_lock,
+					   &rx_priv->rxframes_freequeue,
+					   &req->rxframe_list);
+		}
+		spin_unlock_irqrestore(&preorder_ctrl->reord_list_lock, flags);
+		if (timer_pending(&preorder_ctrl->reord_timer))
+			timer_delete_sync(&preorder_ctrl->reord_timer);
+		cancel_work_sync(&preorder_ctrl->reord_timer_work);
+	}
+	list_del(&reord_info->list);
+	kfree(reord_info);
+}
+
+int reord_single_frame_ind(struct aicwf_rx_priv *rx_priv,
+			   struct recv_msdu *prframe)
+{
+	struct list_head *rxframes_freequeue = NULL;
+	struct sk_buff *skb = NULL;
+	struct aicwf_vif *aicwf_vif = (struct aicwf_vif *)rx_priv->aicwf_vif;
+	struct sk_buff_head list;
+	struct sk_buff *rx_skb;
+
+	rxframes_freequeue = &rx_priv->rxframes_freequeue;
+	skb = prframe->pkt;
+
+	if (!skb) {
+		struct aicwf_hw *aicwf_hw = aicwf_vif->aicwf_hw;
+
+		if (aicwf_hw)
+			dev_err(aicwf_hw->dev, "skb is NULL\n");
+		return -1;
+	}
+
+	if (!prframe->forward) {
+		dev_kfree_skb(skb);
+		prframe->pkt = NULL;
+		reord_rxframe_free(&rx_priv->freeq_lock, rxframes_freequeue,
+				   &prframe->rxframe_list);
+		return 0;
+	}
+
+	__skb_queue_head_init(&list);
+	if (prframe->is_amsdu) {
+		aicwf_rxdata_process_amsdu
+			(aicwf_vif->aicwf_hw, skb, aicwf_vif->vif_index,
+			 &list); // rxhdr not used below since skb free!
+	} else {
+		__skb_queue_head(&list, skb);
+	}
+
+	while (!skb_queue_empty(&list)) {
+		rx_skb = __skb_dequeue(&list);
+
+		aicwf_vif->net_stats.rx_packets++;
+		aicwf_vif->net_stats.rx_bytes += rx_skb->len;
+
+		rx_skb->dev = aicwf_vif->ndev;
+		rx_skb->protocol = eth_type_trans(rx_skb, aicwf_vif->ndev);
+
+#ifdef CONFIG_AIC8800_ARP_OFFLOAD
+		if (AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_STATION ||
+		    AICWF_VIF_TYPE(aicwf_vif) == NL80211_IFTYPE_P2P_CLIENT) {
+			arpoffload_proc(rx_skb, aicwf_vif);
+		}
+#endif
+		memset(rx_skb->cb, 0, sizeof(rx_skb->cb));
+
+#ifdef CONFIG_AIC8800_RX_NETIF_RECV_SKB // AIDEN test
+		local_bh_disable();
+		netif_receive_skb(rx_skb);
+		local_bh_enable();
+#else
+		if (in_interrupt()) {
+			netif_rx(rx_skb);
+		} else {
+			/*
+			 * If the receive is not processed inside an ISR, the softirqd must
+			 * be woken explicitly to service the NET_RX_SOFTIRQ.
+			 * * In 2.6 kernels, this is handledby netif_rx_ni(), but in earlier
+			 * kernels, we need to do it manually.
+			 */
+			netif_rx_ni(rx_skb);
+		}
+#endif /* CONFIG_AIC8800_RX_NETIF_RECV_SKB */
+	}
+
+	prframe->pkt = NULL;
+	reord_rxframe_free(&rx_priv->freeq_lock, rxframes_freequeue,
+			   &prframe->rxframe_list);
+
+	return 0;
+}
+
+bool reord_rxframes_process(struct aicwf_rx_priv *rx_priv,
+			    struct reord_ctrl *preorder_ctrl, int bforced)
+{
+	struct list_head *phead, *plist;
+	struct recv_msdu *prframe;
+	bool b_pkt_in_buf = false;
+
+	if (bforced) {
+		phead = &preorder_ctrl->reord_list;
+		if (list_empty(phead))
+			return false;
+
+		plist = phead->next;
+		prframe = list_entry(plist, struct recv_msdu, reord_pending_list);
+		preorder_ctrl->ind_sn = prframe->seq_num;
+	}
+
+	phead = &preorder_ctrl->reord_list;
+	if (list_empty(phead))
+		return b_pkt_in_buf;
+
+	list_for_each_entry(prframe, phead, reord_pending_list)	{
+		if (!SN_LESS(preorder_ctrl->ind_sn, prframe->seq_num)) {
+			if (SN_EQUAL(preorder_ctrl->ind_sn, prframe->seq_num))
+				preorder_ctrl->ind_sn = (preorder_ctrl->ind_sn + 1) & 0xFFF;
+		} else {
+			b_pkt_in_buf = true;
+			break;
+		}
+	}
+
+	return b_pkt_in_buf;
+}
+
+void reord_rxframes_ind(struct aicwf_rx_priv *rx_priv,
+			struct reord_ctrl *preorder_ctrl)
+{
+	struct list_head *phead, *plist;
+	struct recv_msdu *prframe;
+
+	phead = &preorder_ctrl->reord_list;
+	while (1) {
+		if (list_empty(phead))
+			break;
+
+		plist = phead->next;
+		prframe = list_entry(plist, struct recv_msdu, reord_pending_list);
+
+		if (!SN_LESS(preorder_ctrl->ind_sn, prframe->seq_num)) {
+			list_del_init(&prframe->reord_pending_list);
+			reord_single_frame_ind(rx_priv, prframe);
+		} else {
+			break;
+		}
+	}
+}
+
+void reord_timeout_handler(struct timer_list *t)
+{
+	//struct reord_ctrl *preorder_ctrl = from_timer(preorder_ctrl, t, reord_timer);
+	struct reord_ctrl *preorder_ctrl = timer_container_of(preorder_ctrl, t, reord_timer);
+
+	if (!work_pending(&preorder_ctrl->reord_timer_work))
+		schedule_work(&preorder_ctrl->reord_timer_work);
+}
+
+void reord_timeout_worker(struct work_struct *work)
+{
+	struct reord_ctrl *preorder_ctrl =
+		container_of(work, struct reord_ctrl, reord_timer_work);
+	struct aicwf_rx_priv *rx_priv = preorder_ctrl->rx_priv;
+
+	spin_lock_bh(&preorder_ctrl->reord_list_lock);
+	if (reord_rxframes_process(rx_priv, preorder_ctrl, true) == true) {
+		mod_timer(&preorder_ctrl->reord_timer,
+			  jiffies + msecs_to_jiffies(REORDER_UPDATE_TIME));
+	}
+
+	reord_rxframes_ind(rx_priv, preorder_ctrl);
+	spin_unlock_bh(&preorder_ctrl->reord_list_lock);
+}
+
+int reord_process_unit(struct aicwf_rx_priv *rx_priv, struct sk_buff *skb,
+		       u16 seq_num, u8 tid, u8 forward, u8 is_amsdu)
+{
+	int ret = 0;
+	u8 *mac;
+	struct recv_msdu *pframe;
+	struct reord_ctrl *preorder_ctrl;
+	struct reord_ctrl_info *reord_info;
+	struct aicwf_vif *aicwf_vif = (struct aicwf_vif *)rx_priv->aicwf_vif;
+	struct ethhdr *eh = (struct ethhdr *)(skb->data);
+	u8 is_mcast;
+
+	if (!aicwf_vif || skb->len <= ETH_HLEN ||
+	    tid >= ARRAY_SIZE(reord_info->preorder_ctrl)) {
+		dev_kfree_skb(skb);
+		return -1;
+	}
+
+	is_mcast = is_multicast_ether_addr(eh->h_dest);
+
+	pframe =
+		reord_rxframe_alloc(&rx_priv->freeq_lock, &rx_priv->rxframes_freequeue);
+	if (!pframe) {
+		dev_kfree_skb(skb);
+		return -1;
+	}
+
+	INIT_LIST_HEAD(&pframe->reord_pending_list);
+	pframe->seq_num = seq_num;
+	pframe->tid = tid;
+	pframe->rx_data = skb->data;
+	pframe->pkt = skb;
+	pframe->forward = forward;
+	preorder_ctrl = pframe->preorder_ctrl;
+	pframe->is_amsdu = is_amsdu;
+
+	if ((ntohs(eh->h_proto) == ETH_P_PAE) || is_mcast)
+		return reord_single_frame_ind(rx_priv, pframe);
+
+	if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_STATION ||
+	    aicwf_vif->wdev.iftype == NL80211_IFTYPE_P2P_CLIENT) {
+		mac = eh->h_dest;
+	} else if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_AP ||
+		 aicwf_vif->wdev.iftype == NL80211_IFTYPE_P2P_GO) {
+		mac = eh->h_source;
+	} else {
+		dev_kfree_skb(skb);
+		return -1;
+	}
+
+	spin_lock_bh(&rx_priv->stas_reord_lock);
+	list_for_each_entry(reord_info, &rx_priv->stas_reord_list, list) {
+		if (!memcmp(mac, reord_info->mac_addr, ETH_ALEN)) {
+			preorder_ctrl = &reord_info->preorder_ctrl[pframe->tid];
+			break;
+		}
+	}
+
+	if (&reord_info->list == &rx_priv->stas_reord_list) {
+		reord_info = reord_init_sta(rx_priv, mac);
+		if (!reord_info) {
+			spin_unlock_bh(&rx_priv->stas_reord_lock);
+			dev_kfree_skb(skb);
+			return -1;
+		}
+		list_add_tail(&reord_info->list, &rx_priv->stas_reord_list);
+		preorder_ctrl = &reord_info->preorder_ctrl[pframe->tid];
+	} else {
+		if (!preorder_ctrl->enable) {
+			preorder_ctrl->enable = true;
+			preorder_ctrl->ind_sn = 0xffff;
+			preorder_ctrl->wsize_b = AICWF_REORDER_WINSIZE;
+			preorder_ctrl->rx_priv = rx_priv;
+		}
+	}
+	spin_unlock_bh(&rx_priv->stas_reord_lock);
+
+	if (!preorder_ctrl->enable) {
+		spin_lock_bh(&preorder_ctrl->reord_list_lock);
+		preorder_ctrl->ind_sn = pframe->seq_num;
+		reord_single_frame_ind(rx_priv, pframe);
+		preorder_ctrl->ind_sn = (preorder_ctrl->ind_sn + 1) % 4096;
+		spin_unlock_bh(&rx_priv->stas_reord_lock);
+		return 0;
+	}
+
+	spin_lock_bh(&preorder_ctrl->reord_list_lock);
+	if (reord_need_check(preorder_ctrl, pframe->seq_num)) {
+		if (skb->len > 42 && pframe->rx_data[42] == 0x80) { // RTP packet
+			if (pframe->seq_num == preorder_ctrl->ind_sn) {
+				pr_debug("pframe->seq_num1:%d\n",
+					 pframe->seq_num);
+				reord_single_frame_ind(rx_priv, pframe); // not need to reorder
+			} else {
+				pr_debug("free pframe->seq_num:%d\n",
+					 pframe->seq_num);
+				if (pframe->pkt) {
+					dev_kfree_skb(pframe->pkt);
+					pframe->pkt = NULL;
+				}
+				reord_rxframe_free(&rx_priv->freeq_lock,
+						   &rx_priv->rxframes_freequeue,
+						   &pframe->rxframe_list);
+			}
+		} else {
+			reord_single_frame_ind(rx_priv, pframe); // not need to reorder
+		}
+		spin_unlock_bh(&preorder_ctrl->reord_list_lock);
+		return 0;
+	}
+
+	if (reord_rxframe_enqueue(preorder_ctrl, pframe)) {
+		spin_unlock_bh(&preorder_ctrl->reord_list_lock);
+		goto fail;
+	}
+
+	if (reord_rxframes_process(rx_priv, preorder_ctrl, false) == true) {
+		if (!timer_pending(&preorder_ctrl->reord_timer)) {
+			ret = mod_timer(&preorder_ctrl->reord_timer,
+					jiffies +
+					msecs_to_jiffies(REORDER_UPDATE_TIME));
+		}
+	} else {
+		if (timer_pending(&preorder_ctrl->reord_timer))
+			//ret = del_timer(&preorder_ctrl->reord_timer);
+			ret = timer_delete(&preorder_ctrl->reord_timer);
+	}
+
+	reord_rxframes_ind(rx_priv, preorder_ctrl);
+	spin_unlock_bh(&preorder_ctrl->reord_list_lock);
+
+	return 0;
+
+fail:
+	if (pframe->pkt) {
+		dev_kfree_skb(pframe->pkt);
+		pframe->pkt = NULL;
+	}
+	reord_rxframe_free(&rx_priv->freeq_lock, &rx_priv->rxframes_freequeue,
+			   &pframe->rxframe_list);
+	return ret;
+}
+
+int reord_need_check(struct reord_ctrl *preorder_ctrl, u16 seq_num)
+{
+	u8 wsize = preorder_ctrl->wsize_b;
+	u16 wend = (preorder_ctrl->ind_sn + wsize - 1) & 0xFFF;
+
+	if (preorder_ctrl->ind_sn == 0xFFFF)
+		preorder_ctrl->ind_sn = seq_num;
+
+	if (SN_LESS(seq_num, preorder_ctrl->ind_sn))
+		return -1;
+
+	if (SN_EQUAL(seq_num, preorder_ctrl->ind_sn)) {
+		preorder_ctrl->ind_sn = (preorder_ctrl->ind_sn + 1) & 0xFFF;
+	} else if (SN_LESS(wend, seq_num)) {
+		if (seq_num >= (wsize - 1))
+			preorder_ctrl->ind_sn = seq_num - (wsize - 1);
+		else
+			preorder_ctrl->ind_sn = 0xFFF - (wsize - (seq_num + 1)) + 1;
+	}
+
+	return 0;
+}
+
+int reord_rxframe_enqueue(struct reord_ctrl *preorder_ctrl,
+			  struct recv_msdu *prframe)
+{
+	struct list_head *preord_list = &preorder_ctrl->reord_list;
+	struct list_head *phead, *plist;
+	struct recv_msdu *pnextrframe;
+
+	phead = preord_list;
+	plist = phead->next;
+
+	while (phead != plist) {
+		pnextrframe = list_entry(plist, struct recv_msdu, reord_pending_list);
+		if (SN_LESS(pnextrframe->seq_num, prframe->seq_num)) {
+			plist = plist->next;
+			continue;
+		} else if (SN_EQUAL(pnextrframe->seq_num, prframe->seq_num)) {
+			return -1;
+		}
+		break;
+	}
+	list_add_tail(&prframe->reord_pending_list, plist);
+
+	return 0;
+}
+#endif /* CONFIG_AIC8800_RX_REORDER */
+
+void remove_sec_hdr_mgmt_frame(struct hw_rxhdr *hw_rxhdr, struct sk_buff *skb)
+{
+	u8 hdr_len = 24;
+	u8 mgmt_header[24] = {0};
+
+	if (!hw_rxhdr->hwvect.ga_frame) {
+		if (((skb->data[0] & 0x0C) == 0) &&
+		    (skb->data[1] & 0x40) == 0x40) { // protect management frame
+			pr_debug("frame type %x\n", skb->data[0]);
+			if (hw_rxhdr->hwvect.decr_status == AICWF_RX_HD_DECR_CCMP128) {
+				memcpy(mgmt_header, skb->data, hdr_len);
+				skb_pull(skb, 8);
+				memcpy(skb->data, mgmt_header, hdr_len);
+				hw_rxhdr->hwvect.len -= 8;
+			} else {
+				pr_debug("unsupport decr_status:%d\n",
+					 hw_rxhdr->hwvect.decr_status);
+			}
+		}
+	}
+}
+
+void aicwf_defrag_init(struct aicwf_hw *aicwf_hw)
+{
+	INIT_LIST_HEAD(&aicwf_hw->defrag_list);
+	INIT_LIST_HEAD(&aicwf_hw->defrag_expired_list);
+	spin_lock_init(&aicwf_hw->defrag_lock);
+	aicwf_hw->defrag_stopping = false;
+}
+
+void defrag_timeout_cb(struct timer_list *t)
+{
+	struct defrag_ctrl_info *defrag_ctrl =
+		timer_container_of(defrag_ctrl, t, defrag_timer);
+	struct aicwf_hw *aicwf_hw = defrag_ctrl->aicwf_hw;
+
+	spin_lock_bh(&aicwf_hw->defrag_lock);
+	if (!list_empty(&defrag_ctrl->list)) {
+		dev_kfree_skb(defrag_ctrl->skb);
+		defrag_ctrl->skb = NULL;
+		/* Keep the timer reachable until another context can join it. */
+		list_move_tail(&defrag_ctrl->list, &aicwf_hw->defrag_expired_list);
+	}
+	spin_unlock_bh(&aicwf_hw->defrag_lock);
+}
+
+static void aicwf_defrag_drain(struct aicwf_hw *aicwf_hw, struct list_head *head)
+{
+	struct defrag_ctrl_info *defrag_ctrl;
+
+	spin_lock_bh(&aicwf_hw->defrag_lock);
+	while (!list_empty(head)) {
+		defrag_ctrl = list_first_entry(head, struct defrag_ctrl_info, list);
+		/* An empty node transfers ownership away from the timer callback. */
+		list_del_init(&defrag_ctrl->list);
+		spin_unlock_bh(&aicwf_hw->defrag_lock);
+
+		timer_shutdown_sync(&defrag_ctrl->defrag_timer);
+		dev_kfree_skb(defrag_ctrl->skb);
+		kfree(defrag_ctrl);
+
+		spin_lock_bh(&aicwf_hw->defrag_lock);
+	}
+	spin_unlock_bh(&aicwf_hw->defrag_lock);
+}
+
+void aicwf_defrag_deinit(struct aicwf_hw *aicwf_hw)
+{
+	/* The caller must join RX before releasing aicwf_hw. */
+	spin_lock_bh(&aicwf_hw->defrag_lock);
+	aicwf_hw->defrag_stopping = true;
+	spin_unlock_bh(&aicwf_hw->defrag_lock);
+
+	aicwf_defrag_drain(aicwf_hw, &aicwf_hw->defrag_list);
+	aicwf_defrag_drain(aicwf_hw, &aicwf_hw->defrag_expired_list);
+}
+
+void aicwf_rxdata_process_amsdu(struct aicwf_hw *aicwf_hw, struct sk_buff *skb,
+				u8 vif_idx, struct sk_buff_head *list)
+{
+	unsigned int len_alligned = 0;
+	unsigned int sublen = 0;
+	struct sk_buff *sub_skb = NULL;
+	struct aicwf_vif *aicwf_vif;
+
+	/* |amsdu sub1 | amsdu sub2 | ... */
+	len_alligned = 0;
+	sublen = 0;
+	sub_skb = NULL;
+	while (skb->len >= ETH_HLEN) {
+		sublen = (skb->data[12] << 8) | (skb->data[13]);
+		/* The existing conversion removes six LLC bytes. */
+		if (sublen < 8 || sublen > skb->len - ETH_HLEN)
+			break;
+		if (skb->len > (sublen + 14)) {
+			len_alligned = roundup(sublen + 14, 4);
+		} else if (skb->len == (sublen + 14)) {
+			len_alligned = sublen + 14;
+		} else {
+			dev_dbg(aicwf_hw->dev, "accroding to amsdu: this will not happen\n");
+			break;
+		}
+		/* debug trace */
+		//			sublen,skb->data[0], skb->data[1], skb->data[12],
+		// skb->data[13]);
+		sub_skb = __dev_alloc_skb(sublen - 6 + 12, GFP_ATOMIC);
+		if (!sub_skb)
+			break;
+		skb_put(sub_skb, sublen - 6 + 12);
+		memcpy(sub_skb->data, skb->data, MAC_ADDR_LEN);
+		memcpy(&sub_skb->data[6], &skb->data[6], MAC_ADDR_LEN);
+		memcpy(&sub_skb->data[12], &skb->data[14 + 6], sublen - 6);
+
+		aicwf_vif = aicwf_rx_get_vif(aicwf_hw, vif_idx);
+		if (!aicwf_vif) {
+			dev_dbg(aicwf_hw->dev, "frame received but no active vif %d", vif_idx);
+			dev_kfree_skb(sub_skb);
+			break;
+		}
+
+		__skb_queue_tail(list, sub_skb);
+
+		/* debug trace */
+		// if (!aicwf_rx_data_skb(aicwf_hw, aicwf_vif, sub_skb, hw_rxhdr))
+		//     dev_kfree_skb(sub_skb);
+		/* The final subframe need not include alignment padding. */
+		skb_pull(skb, min_t(unsigned int, len_alligned, skb->len));
+	}
+	dev_kfree_skb(skb);
+}
+
+static void find_defrag_info(struct aicwf_hw *aicwf_hw, u16 seq_num,
+			     u8 tid, u8 sta_idx,
+			     struct defrag_ctrl_info **defrag_info,
+			     struct defrag_ctrl_info **defrag_info_tmp)
+{
+	struct defrag_ctrl_info *iter;
+
+	if (!list_empty(&aicwf_hw->defrag_list)) {
+		list_for_each_entry(iter, &aicwf_hw->defrag_list, list) {
+			if (iter->sn == seq_num &&
+			    iter->tid == tid &&
+			    iter->sta_idx == sta_idx) {
+				*defrag_info_tmp = iter;
+				*defrag_info = *defrag_info_tmp;
+				break;
+			}
+		}
+	}
+}
+
+static int process_fragment_reassembly(struct defrag_ctrl_info *defrag_info,
+				       u16 frag_num, struct sk_buff *skb,
+				       u8 pull_len, struct aicwf_hw *aicwf_hw,
+				       u8 *is_frag)
+{
+	if (!defrag_info)
+		return 1;
+
+	*is_frag = 1;
+	if (defrag_info->next_fn != frag_num) {
+		dev_dbg(aicwf_hw->dev, "discard:%d:%d\n",
+			defrag_info->next_fn, frag_num);
+		dev_kfree_skb(skb);
+		spin_unlock_bh(&aicwf_hw->defrag_lock);
+		return 0;
+	}
+
+	if (pull_len < 8 || skb->len < pull_len - 8 ||
+	    skb->len - (pull_len - 8) > skb_tailroom(defrag_info->skb)) {
+		dev_kfree_skb(skb);
+		spin_unlock_bh(&aicwf_hw->defrag_lock);
+		return 0;
+	}
+
+	skb_put_data(defrag_info->skb, skb->data + pull_len - 8,
+		     skb->len - (pull_len - 8));
+
+	defrag_info->frm_len += skb->len - (pull_len - 8);
+	defrag_info->next_fn++;
+
+	dev_kfree_skb(skb);
+	spin_unlock_bh(&aicwf_hw->defrag_lock);
+
+	return 0;
+}
+
+static inline void find_matching_defrag_info(struct aicwf_hw *aicwf_hw,
+					     u16 seq_num, u8 tid, u8 sta_idx,
+					     struct defrag_ctrl_info **defrag_info,
+					     struct defrag_ctrl_info **defrag_info_tmp)
+{
+	struct defrag_ctrl_info *iter;
+
+	list_for_each_entry(iter, &aicwf_hw->defrag_list, list) {
+		if (iter->sn == seq_num &&
+		    iter->tid == tid &&
+		    iter->sta_idx == sta_idx) {
+			*defrag_info_tmp = iter;
+			*defrag_info = *defrag_info_tmp;
+			break;
+		}
+	}
+}
+
+static int process_defrag_reassembly(struct aicwf_hw *aicwf_hw,
+				     struct defrag_ctrl_info *defrag_info,
+				     u16 frag_num,
+				     struct sk_buff *skb,
+				     u8 pull_len,
+				     struct hw_rxhdr *hw_rxhdr,
+				     u8 *is_frag,
+				     struct aicwf_vif **aicwf_vif,
+				     struct sk_buff **skb_tmp)
+{
+	struct hw_rxhdr hw_rxhdr_copy;
+
+	if (!defrag_info) {
+		spin_unlock_bh(&aicwf_hw->defrag_lock);
+		return 1;
+	}
+
+	if (defrag_info->next_fn != frag_num) {
+		dev_dbg(aicwf_hw->dev, "discard:%d:%d\n",
+			defrag_info->next_fn, frag_num);
+		dev_kfree_skb(skb);
+		spin_unlock_bh(&aicwf_hw->defrag_lock);
+		return 0;
+	}
+
+	if (pull_len < 8 || skb->len < pull_len - 8 ||
+	    skb->len - (pull_len - 8) > skb_tailroom(defrag_info->skb)) {
+		dev_kfree_skb(skb);
+		spin_unlock_bh(&aicwf_hw->defrag_lock);
+		return 0;
+	}
+
+	skb_put_data(defrag_info->skb, skb->data + pull_len - 8,
+		     skb->len - (pull_len - 8));
+	defrag_info->frm_len += skb->len - (pull_len - 8);
+	*is_frag = 1;
+
+	*aicwf_vif = aicwf_rx_get_vif(aicwf_hw, hw_rxhdr->flags_vif_idx);
+	if (!*aicwf_vif) {
+		dev_dbg(aicwf_hw->dev, "frame received but no active vif %d",
+			hw_rxhdr->flags_vif_idx);
+		dev_kfree_skb(skb);
+		spin_unlock_bh(&aicwf_hw->defrag_lock);
+		return 0;
+	}
+
+	hw_rxhdr_copy = *hw_rxhdr;
+	dev_kfree_skb(skb);
+	*skb_tmp = defrag_info->skb;
+	defrag_info->skb = NULL;
+	list_del_init(&defrag_info->list);
+	spin_unlock_bh(&aicwf_hw->defrag_lock);
+	timer_shutdown_sync(&defrag_info->defrag_timer);
+	kfree(defrag_info);
+
+	if (!aicwf_rx_data_skb(aicwf_hw, *aicwf_vif, *skb_tmp, &hw_rxhdr_copy))
+		dev_kfree_skb(*skb_tmp);
+
+	return 0;
+}
+
+static inline void check_packet_forward_flags(struct aicwf_hw *aicwf_hw,
+					      struct hw_rxhdr *hw_rxhdr,
+					      struct aicwf_vif *aicwf_vif,
+					      bool *resend,
+					      bool *forward)
+{
+	if (hw_rxhdr->flags_dst_idx != AICWF_INVALID_STA) {
+		struct aicwf_sta *sta = &aicwf_hw->sta_table[hw_rxhdr->flags_dst_idx];
+
+		if (sta->valid && sta->vlan_idx == aicwf_vif->vif_index) {
+			*resend = true;
+			*forward = false;
+		}
+	}
+}
+
+u8 aicwf_rxdataind(struct aicwf_hw *aicwf_hw, void *hostid, void *rx_priv)
+{
+	struct hw_rxhdr *hw_rxhdr;
+	struct rxdesc_tag *rxdesc = NULL;
+	struct aicwf_vif *aicwf_vif;
+	struct sk_buff *skb = hostid;
+	int msdu_offset = sizeof(struct hw_rxhdr) + 2;
+	u16 status = 0;
+	struct aicwf_rx_priv *rx_priv_tmp;
+	u8 hdr_len = 24;
+	u8 ra[MAC_ADDR_LEN] = {0};
+	u8 ta[MAC_ADDR_LEN] = {0};
+	u8 ether_type[2] = {0};
+	u8 pull_len = 0;
+	u16 seq_num = 0;
+	u8 frag_num = 0;
+	u8 tid = 0;
+	u8 is_qos = 0;
+	u8 is_frag = 0;
+	struct defrag_ctrl_info *defrag_info = NULL;
+	struct defrag_ctrl_info *defrag_info_tmp = NULL;
+	struct sk_buff *skb_tmp = NULL;
+	u8 sta_idx = 0;
+	u16 frame_ctrl;
+	u8 is_amsdu = 0;
+	bool resend = false, forward = true;
+	const struct ethhdr *eth;
+
+	if (skb->len < msdu_offset + 2)
+		goto drop;
+	hw_rxhdr = (struct hw_rxhdr *)skb->data;
+	if (hw_rxhdr->hwvect.len > skb->len - (msdu_offset + 2))
+		goto drop;
+
+	if (hw_rxhdr->is_monitor_vif) {
+		status = RX_STAT_MONITOR;
+		dev_dbg(aicwf_hw->dev, "monitor rx\n");
+	}
+
+	if (hw_rxhdr->flags_upload)
+		status |= RX_STAT_FORWARD;
+
+	/* Check if we need to delete the buffer */
+	if (status & RX_STAT_DELETE) {
+		/* Remove the SK buffer from the rxbuf_elems table */
+		/* Free the buffer */
+		dev_kfree_skb(skb);
+		goto end;
+	}
+
+	/* Check if we need to forward the buffer coming from a monitor interface */
+	if (status & RX_STAT_MONITOR) {
+		struct sk_buff *skb_monitor;
+		struct hw_rxhdr hw_rxhdr_copy;
+		u8 rtap_len;
+		u16 frm_len;
+
+		// Check if monitor interface exists and is open
+		aicwf_vif = aicwf_rx_get_vif(aicwf_hw, aicwf_hw->monitor_vif);
+		if (!aicwf_vif) {
+			dev_err(aicwf_hw->dev,
+				"received monitor frame but there is no monitor interface open\n");
+			goto check_len_update;
+		}
+
+		aicwf_rx_vector_convert(aicwf_hw, &hw_rxhdr->hwvect.rx_vect1,
+					&hw_rxhdr->hwvect.rx_vect2);
+		rtap_len = aicwf_rx_rtap_hdrlen(&hw_rxhdr->hwvect.rx_vect1, false);
+
+		// Move skb->data pointer to MAC Header or Ethernet header
+		skb->data += (msdu_offset + 2); // sdio/usb word align
+
+		// Save frame length
+		frm_len = hw_rxhdr->hwvect.len;
+
+		// Reserve space for frame
+		skb->len = frm_len;
+
+		if (status == RX_STAT_MONITOR) {
+			/*
+			 * Remove the SK buffer from the rxbuf_elems table. It will also
+			 * unmap the buffer and then sync the buffer for the cpu
+			 */
+
+			// Check if there is enough space to add the radiotap header
+			if (skb_headroom(skb) > rtap_len) {
+				skb_monitor = skb;
+
+				// Duplicate the HW Rx Header to override with the radiotap
+				// header
+				memcpy(&hw_rxhdr_copy, hw_rxhdr, sizeof(hw_rxhdr_copy));
+
+				hw_rxhdr = &hw_rxhdr_copy;
+
+				skb_reset_tail_pointer(skb);
+				skb->len = 0;
+				skb_reset_tail_pointer(skb_monitor);
+				skb_monitor->len = 0;
+				skb_put(skb_monitor, frm_len);
+				if (aicwf_rx_monitor(aicwf_hw, aicwf_vif,
+						     skb_monitor, hw_rxhdr, rtap_len))
+					dev_kfree_skb(skb_monitor);
+			} else {
+				// Duplicate the skb and extend the headroom
+				skb_monitor = skb_copy_expand(skb, rtap_len, 0, GFP_ATOMIC);
+
+				// Reset original skb->data pointer
+				skb->data = (void *)hw_rxhdr;
+
+				skb_reset_tail_pointer(skb);
+				skb->len = 0;
+				skb_reset_tail_pointer(skb_monitor);
+				skb_monitor->len = 0;
+				skb_put(skb_monitor, frm_len);
+				if (aicwf_rx_monitor(aicwf_hw, aicwf_vif,
+						     skb_monitor, hw_rxhdr, rtap_len))
+					dev_kfree_skb(skb_monitor);
+			}
+		} else {
+			skb->data = (void *)hw_rxhdr;
+
+			wiphy_err(aicwf_hw->wiphy,
+				  "RX status %d is invalid when MON_DATA is disabled\n",
+				  status);
+			goto check_len_update;
+		}
+
+		if (status == RX_STAT_MONITOR) {
+			status |= RX_STAT_ALLOC;
+			if (skb_monitor != skb)
+				dev_kfree_skb(skb);
+		}
+	}
+
+check_len_update:
+	/* Check if we need to update the length */
+	if (status & RX_STAT_LEN_UPDATE) {
+		if (rxdesc)
+			hw_rxhdr->hwvect.len = rxdesc->frame_len;
+
+		if (status & RX_STAT_ETH_LEN_UPDATE) {
+			/* Update Length Field inside the Ethernet Header */
+			struct ethhdr *hdr =
+				(struct ethhdr *)((u8 *)hw_rxhdr + msdu_offset);
+
+			if (rxdesc)
+				hdr->h_proto = htons(rxdesc->frame_len - sizeof(struct ethhdr));
+		}
+
+		goto end;
+	}
+
+	/* Check if it must be discarded after informing upper layer */
+	if (status & RX_STAT_SPURIOUS) {
+		struct ieee80211_hdr *hdr;
+
+		hdr = (struct ieee80211_hdr *)(skb->data + msdu_offset);
+		aicwf_vif = aicwf_rx_get_vif(aicwf_hw, hw_rxhdr->flags_vif_idx);
+		if (aicwf_vif) {
+			cfg80211_rx_spurious_frame(aicwf_vif->ndev, hdr->addr2, 0,
+						   GFP_ATOMIC);
+		}
+		goto end;
+	}
+
+	/* Check if we need to forward the buffer */
+	if (status & RX_STAT_FORWARD) {
+		aicwf_rx_vector_convert(aicwf_hw, &hw_rxhdr->hwvect.rx_vect1,
+					&hw_rxhdr->hwvect.rx_vect2);
+		skb_pull(skb, msdu_offset + 2); //+2 since sdio align 58->60
+		if (skb->len < 24)
+			goto drop;
+
+#define MAC_FCTRL_MOREFRAG 0x0400
+		frame_ctrl = (skb->data[1] << 8) | skb->data[0];
+		seq_num = ((skb->data[22] & 0xf0) >> 4) | (skb->data[23] << 4);
+		frag_num = (skb->data[22] & 0x0f);
+		is_amsdu = 0;
+
+		if ((skb->data[0] & 0x0f) == 0x08) {
+			if ((skb->data[0] & 0x80) == 0x80) { // qos data
+				hdr_len = 26;
+				if (skb->len < hdr_len)
+					goto drop;
+				tid = skb->data[24] & 0x0F;
+				is_qos = 1;
+				if (skb->data[24] & 0x80)
+					is_amsdu = 1;
+			}
+
+			if (skb->data[1] & 0x80) // htc
+				hdr_len += 4;
+
+			if ((skb->data[1] & 0x3) == 0x1) { // to ds
+				memcpy(ra, &skb->data[16], MAC_ADDR_LEN);
+				memcpy(ta, &skb->data[10], MAC_ADDR_LEN);
+			} else if ((skb->data[1] & 0x3) == 0x2) { // from ds
+				memcpy(ta, &skb->data[16], MAC_ADDR_LEN);
+				memcpy(ra, &skb->data[4], MAC_ADDR_LEN);
+			}
+
+			pull_len += (hdr_len + 8);
+
+			switch (hw_rxhdr->hwvect.decr_status) {
+			case AICWF_RX_HD_DECR_CCMP128:
+				pull_len += 8; // ccmp_header
+				break;
+			case AICWF_RX_HD_DECR_TKIP:
+				pull_len += 8; // tkip_header
+				break;
+			case AICWF_RX_HD_DECR_WEP:
+				pull_len += 4; // wep_header
+				break;
+			case AICWF_RX_HD_DECR_WAPI:
+				pull_len += 18; // wapi_header
+				break;
+
+			default:
+				break;
+			}
+			if (skb->len < pull_len - 8)
+				goto drop;
+			/* Only the first non-A-MSDU fragment carries an LLC header. */
+			if (!frag_num && !is_amsdu) {
+				if (skb->len < pull_len)
+					goto drop;
+				memcpy(ether_type, skb->data + pull_len - 2, 2);
+			}
+			if (is_amsdu)
+				hw_rxhdr->flags_is_amsdu = 1;
+			else
+				hw_rxhdr->flags_is_amsdu = 0;
+
+			if (is_amsdu)
+				skb_pull(skb, pull_len - 8);
+
+			if (hw_rxhdr->flags_dst_idx != AICWF_INVALID_STA)
+				sta_idx = hw_rxhdr->flags_dst_idx;
+
+			if (!hw_rxhdr->flags_need_reord &&
+			    ((frame_ctrl & MAC_FCTRL_MOREFRAG) || frag_num)) {
+				aicwf_defrag_drain(aicwf_hw, &aicwf_hw->defrag_expired_list);
+				dev_dbg(aicwf_hw->dev, "rxfrag:%d,%d,%d,sn=%d,%d\n",
+					(frame_ctrl & MAC_FCTRL_MOREFRAG), frag_num, skb->len,
+					seq_num, pull_len);
+				if (frame_ctrl & MAC_FCTRL_MOREFRAG) {
+					spin_lock_bh(&aicwf_hw->defrag_lock);
+					if (aicwf_hw->defrag_stopping) {
+						spin_unlock_bh(&aicwf_hw->defrag_lock);
+						goto drop;
+					}
+					if (!list_empty(&aicwf_hw->defrag_list)) {
+						find_defrag_info(aicwf_hw, seq_num, tid, sta_idx,
+								 &defrag_info, &defrag_info_tmp);
+					}
+					/* debug trace */
+					// frag_num, skb->len);
+					if (process_fragment_reassembly(defrag_info, frag_num,
+									skb, pull_len,
+									aicwf_hw, &is_frag) == 0)
+						return 0;
+					if (frag_num) {
+						spin_unlock_bh(&aicwf_hw->defrag_lock);
+						goto drop;
+					}
+					defrag_info =
+						kzalloc_obj(struct defrag_ctrl_info, GFP_ATOMIC);
+					if (!defrag_info) {
+						dev_dbg(aicwf_hw->dev, "no defrag_ctrl_info\n");
+						dev_kfree_skb(skb);
+						spin_unlock_bh(&aicwf_hw->defrag_lock);
+						return 0;
+					}
+					defrag_info->skb = __dev_alloc_skb(2000, GFP_ATOMIC);
+					if (!defrag_info->skb) {
+						dev_kfree_skb(skb);
+						kfree(defrag_info);
+						spin_unlock_bh(&aicwf_hw->defrag_lock);
+						return 0;
+					}
+					is_frag = 1;
+					skb_pull(skb, pull_len);
+					skb_push(skb, 14);
+					memcpy(skb->data, ra, MAC_ADDR_LEN);
+					memcpy(&skb->data[6], ta, MAC_ADDR_LEN);
+					memcpy(&skb->data[12], ether_type, 2);
+					defrag_info->sn = seq_num;
+					defrag_info->next_fn = 1;
+					defrag_info->tid = tid;
+					defrag_info->sta_idx = sta_idx;
+
+					if (skb->len > skb_tailroom(defrag_info->skb)) {
+						dev_kfree_skb(defrag_info->skb);
+						kfree(defrag_info);
+						spin_unlock_bh(&aicwf_hw->defrag_lock);
+						goto drop;
+					}
+					skb_put_data(defrag_info->skb, skb->data, skb->len);
+					defrag_info->frm_len = skb->len;
+					defrag_info->aicwf_hw = aicwf_hw;
+					/* debug trace */
+					// defrag_info->skb, defrag_info->skb->head,
+					// defrag_info->skb->tail, defrag_info->skb->end,
+					// defrag_info->frm_len, skb->len);
+					INIT_LIST_HEAD(&defrag_info->list);
+					timer_setup(&defrag_info->defrag_timer,
+						    defrag_timeout_cb, 0);
+					list_add_tail(&defrag_info->list,
+						      &aicwf_hw->defrag_list);
+					mod_timer(&defrag_info->defrag_timer,
+						  jiffies + msecs_to_jiffies(DEFRAG_MAX_WAIT));
+					spin_unlock_bh(&aicwf_hw->defrag_lock);
+					dev_kfree_skb(skb);
+					return 0;
+				}
+				spin_lock_bh(&aicwf_hw->defrag_lock);
+				if (aicwf_hw->defrag_stopping) {
+					spin_unlock_bh(&aicwf_hw->defrag_lock);
+					goto drop;
+				}
+				find_matching_defrag_info(aicwf_hw, seq_num, tid, sta_idx,
+							  &defrag_info, &defrag_info_tmp);
+				if (process_defrag_reassembly(aicwf_hw, defrag_info, frag_num,
+							      skb, pull_len, hw_rxhdr, &is_frag,
+							      &aicwf_vif, &skb_tmp) == 0)
+					return 0;
+			}
+
+			/* A continuation without a matching reassembly cannot be decoded. */
+			if (frag_num)
+				goto drop;
+
+			if (!is_frag && !is_amsdu) {
+				skb_pull(skb, pull_len);
+				skb_push(skb, 14);
+				memcpy(skb->data, ra, MAC_ADDR_LEN);
+				memcpy(&skb->data[6], ta, MAC_ADDR_LEN);
+				memcpy(&skb->data[12], ether_type, 2);
+			}
+		}
+
+		if (hw_rxhdr->flags_is_80211_mpdu) {
+			if (!hw_rxhdr->hwvect.ga_frame &&
+			    ieee80211_is_mgmt(cpu_to_le16(frame_ctrl)) &&
+			    ieee80211_has_protected(cpu_to_le16(frame_ctrl)) &&
+			    hw_rxhdr->hwvect.decr_status == AICWF_RX_HD_DECR_CCMP128 &&
+			    skb->len < 24 + 8)
+				goto drop;
+			remove_sec_hdr_mgmt_frame(hw_rxhdr, skb);
+			aicwf_rx_mgmt_any(aicwf_hw, skb, hw_rxhdr);
+		} else {
+			aicwf_vif = aicwf_rx_get_vif(aicwf_hw, hw_rxhdr->flags_vif_idx);
+
+			if (!aicwf_vif) {
+				dev_err(aicwf_hw->dev, "frame received but no active vif %d\n",
+					hw_rxhdr->flags_vif_idx);
+				dev_kfree_skb(skb);
+				goto end;
+			}
+
+			if ((hw_rxhdr->flags_sta_idx != AICWF_INVALID_STA &&
+			     hw_rxhdr->flags_sta_idx >= ARRAY_SIZE(aicwf_hw->sta_table)) ||
+			    (hw_rxhdr->flags_dst_idx != AICWF_INVALID_STA &&
+			     hw_rxhdr->flags_dst_idx >= ARRAY_SIZE(aicwf_hw->sta_table)))
+				goto drop;
+
+			if (hw_rxhdr->flags_sta_idx != AICWF_INVALID_STA) {
+				struct aicwf_sta *sta;
+
+				sta = &aicwf_hw->sta_table[hw_rxhdr->flags_sta_idx];
+				aicwf_rx_statistic(aicwf_hw, hw_rxhdr, sta);
+
+				if (sta->vlan_idx != aicwf_vif->vif_index) {
+					if (sta->vlan_idx >= ARRAY_SIZE(aicwf_hw->vif_table))
+						goto drop;
+					aicwf_vif = aicwf_hw->vif_table[sta->vlan_idx];
+					if (!aicwf_vif) {
+						dev_kfree_skb(skb);
+						goto end;
+					}
+				}
+
+				if (hw_rxhdr->flags_is_4addr && !aicwf_vif->use_4addr) {
+					cfg80211_rx_unexpected_4addr_frame
+						(aicwf_vif->ndev, sta->mac_addr, 0,
+						 GFP_ATOMIC);
+				}
+			}
+
+			skb->priority = 256 + tid; // hw_rxhdr->flags_user_prio;
+
+#ifdef CONFIG_AIC8800_RX_REORDER
+			rx_priv_tmp = rx_priv;
+			rx_priv_tmp->aicwf_vif = (void *)aicwf_vif;
+
+			if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_STATION ||
+			    aicwf_vif->wdev.iftype == NL80211_IFTYPE_P2P_CLIENT) {
+				if (is_qos && hw_rxhdr->flags_need_reord)
+					reord_process_unit((struct aicwf_rx_priv *)rx_priv, skb,
+							   seq_num, tid, 1,
+							   hw_rxhdr->flags_is_amsdu);
+				else if (is_qos && !hw_rxhdr->flags_need_reord) {
+					reord_flush_tid((struct aicwf_rx_priv *)rx_priv, skb, tid);
+					if (!aicwf_rx_data_skb(aicwf_hw, aicwf_vif, skb, hw_rxhdr) &&
+					    !hw_rxhdr->flags_is_amsdu)
+						dev_kfree_skb(skb);
+				} else {
+					if (!aicwf_rx_data_skb(aicwf_hw, aicwf_vif, skb, hw_rxhdr) &&
+					    !hw_rxhdr->flags_is_amsdu)
+						dev_kfree_skb(skb);
+				}
+			} else if ((aicwf_vif->wdev.iftype == NL80211_IFTYPE_AP) ||
+					   (aicwf_vif->wdev.iftype == NL80211_IFTYPE_P2P_GO)) {
+				skb_reset_mac_header(skb);
+				eth = eth_hdr(skb);
+				/* debug trace */
+				// skb->data[13], skb->len);
+
+				if (unlikely(is_multicast_ether_addr(eth->h_dest))) {
+					/*
+					 * broadcast pkt need to be forwarded to upper layer and
+					 * resent on wireless interface
+					 */
+					resend = true;
+				} else {
+					/*
+					 * unicast pkt for STA inside the BSS, no need to forward to
+					 * upper layer simply resend on wireless interface
+					 */
+					check_packet_forward_flags(aicwf_hw, hw_rxhdr,
+								   aicwf_vif, &resend,
+								   &forward);
+				}
+
+				if (resend)
+					aicwf_rx_data_skb_resend(aicwf_hw, aicwf_vif, skb, hw_rxhdr);
+
+				if (forward) {
+					if (is_qos && hw_rxhdr->flags_need_reord) {
+						reord_process_unit
+							((struct aicwf_rx_priv *)rx_priv, skb,
+							 seq_num, tid, 1,
+							 hw_rxhdr->flags_is_amsdu);
+					} else if (is_qos && !hw_rxhdr->flags_need_reord) {
+						reord_flush_tid
+							((struct aicwf_rx_priv *)rx_priv, skb,
+							 tid);
+						aicwf_rx_data_skb_forward(aicwf_hw, aicwf_vif, skb,
+									  hw_rxhdr);
+					} else {
+						aicwf_rx_data_skb_forward(aicwf_hw, aicwf_vif, skb,
+									  hw_rxhdr);
+					}
+				} else if (resend) {
+					if (is_qos && hw_rxhdr->flags_need_reord)
+						reord_process_unit
+							((struct aicwf_rx_priv *)rx_priv, skb,
+							 seq_num, tid, 0,
+							 hw_rxhdr->flags_is_amsdu);
+					else if (is_qos && !hw_rxhdr->flags_need_reord) {
+						reord_flush_tid
+							((struct aicwf_rx_priv *)rx_priv, skb,
+							 tid);
+						dev_kfree_skb(skb);
+					}
+				} else {
+					dev_kfree_skb(skb);
+				}
+			}
+#else
+			if (!aicwf_rx_data_skb(aicwf_hw, aicwf_vif, skb, hw_rxhdr))
+				dev_kfree_skb(skb);
+#endif
+		}
+	}
+
+end:
+	return 0;
+
+drop:
+	dev_kfree_skb(skb);
+	return 0;
+}
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx_prealloc.c b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx_prealloc.c
new file mode 100644
index 000000000000..2cec88fc8c20
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx_prealloc.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ ******************************************************************************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief rx memory prealloc function
+ *
+ ******************************************************************************
+ */
+
+#include "aicwf_rx_prealloc.h"
+
+#ifdef CONFIG_PREALLOC_RX_SKB
+struct aicwf_rx_buff_list aic_rx_buff_list;
+
+static int aic_rxbuff_num_max = 30;
+
+struct rx_buff *aicwf_prealloc_rxbuff_alloc(spinlock_t *lock)
+{
+	unsigned long flags;
+	struct rx_buff *rxbuff = NULL;
+
+	spin_lock_irqsave(lock, flags);
+	if (list_empty(&aic_rx_buff_list.rxbuff_list)) {
+		spin_unlock_irqrestore(lock, flags);
+		pr_err("%d, rxbuff list is empty\n", __LINE__);
+		return NULL;
+	}
+	rxbuff = list_first_entry(&aic_rx_buff_list.rxbuff_list, struct rx_buff,
+				  queue);
+	list_del_init(&rxbuff->queue);
+	atomic_dec(&aic_rx_buff_list.rxbuff_list_len);
+
+	spin_unlock_irqrestore(lock, flags);
+	memset(rxbuff->data, 0, AICWF_RXBUFF_SIZE);
+	rxbuff->len = 0;
+	rxbuff->start = NULL;
+	rxbuff->read = NULL;
+	rxbuff->end = NULL;
+
+	return rxbuff;
+}
+
+void aicwf_prealloc_rxbuff_free(struct rx_buff *rxbuff, spinlock_t *lock)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(lock, flags);
+	list_add_tail(&rxbuff->queue, &aic_rx_buff_list.rxbuff_list);
+	atomic_inc(&aic_rx_buff_list.rxbuff_list_len);
+	spin_unlock_irqrestore(lock, flags);
+}
+
+int aicwf_prealloc_init(void)
+{
+	struct rx_buff *rxbuff;
+	int i = 0;
+
+	INIT_LIST_HEAD(&aic_rx_buff_list.rxbuff_list);
+
+	for (i = 0; i < aic_rxbuff_num_max; i++) {
+		rxbuff = kzalloc_obj(*rxbuff, GFP_KERNEL);
+		if (rxbuff) {
+			rxbuff->data =
+				kzalloc(AICWF_RXBUFF_SIZE, GFP_KERNEL);
+			if (!rxbuff->data) {
+				pr_err("failed to alloc rxbuff data\n");
+				kfree(rxbuff);
+				continue;
+			}
+			rxbuff->len = 0;
+			rxbuff->start = NULL;
+			rxbuff->read = NULL;
+			rxbuff->end = NULL;
+			list_add_tail(&rxbuff->queue, &aic_rx_buff_list.rxbuff_list);
+			atomic_inc(&aic_rx_buff_list.rxbuff_list_len);
+		}
+	}
+
+	pr_debug("pre alloc rxbuff list len: %d\n",
+		 (int)atomic_read(&aic_rx_buff_list.rxbuff_list_len));
+	return 0;
+}
+
+void aicwf_prealloc_exit(void)
+{
+	struct rx_buff *rxbuff;
+	struct rx_buff *pos;
+
+	pr_debug("free pre alloc rxbuff list %d\n",
+		 (int)atomic_read(&aic_rx_buff_list.rxbuff_list_len));
+	list_for_each_entry_safe(rxbuff, pos, &aic_rx_buff_list.rxbuff_list, queue) {
+		list_del_init(&rxbuff->queue);
+		kfree(rxbuff->data);
+		kfree(rxbuff);
+	}
+}
+#endif
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_tx.c b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_tx.c
new file mode 100644
index 000000000000..3b0c95827a76
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_tx.c
@@ -0,0 +1,1469 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ ******************************************************************************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @file aicwf_tx.c
+ *
+ * @brief tx handle
+ *
+ ******************************************************************************
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/etherdevice.h>
+#include <net/sock.h>
+
+#include "aicwf_txrxif.h"
+#include "aicwf_config.h"
+#include "aicwf_defs.h"
+#include "aicwf_events.h"
+#include "aicwf_mesh.h"
+#include "aicwf_msg_tx.h"
+#include "aicwf_tx.h"
+
+/******************************************************************************
+ * Power Save functions
+ *****************************************************************************/
+/**
+ * aicwf_set_traffic_status - Inform FW if traffic is available for STA in PS
+ *
+ * @aicwf_hw: Driver main data
+ * @sta: Sta in PS mode
+ * @available: whether traffic is buffered for the STA
+ * @ps_id: type of PS data requested (@LEGACY_PS_ID or @UAPSD_ID)
+ */
+void aicwf_set_traffic_status(struct aicwf_hw *aicwf_hw, struct aicwf_sta *sta,
+			      bool available, u8 ps_id)
+{
+	if (sta->tdls.active) {
+		aicwf_send_tdls_peer_traffic_ind_req(aicwf_hw,
+						     aicwf_hw->vif_table[sta->vif_idx]);
+	} else {
+		bool uapsd = (ps_id != LEGACY_PS_ID);
+
+		aicwf_send_me_traffic_ind(aicwf_hw, sta->sta_idx, uapsd, available);
+#ifdef AIC8800_CREATE_TRACE_POINTS
+		trace_ps_traffic_update(sta->sta_idx, available, uapsd);
+#endif
+	}
+}
+
+/**
+ * aicwf_ps_bh_enable - Enable/disable PS mode for one STA
+ *
+ * @aicwf_hw: Driver main data
+ * @sta: Sta which enters/leaves PS mode
+ * @enable: PS mode status
+ *
+ * This function will enable/disable PS mode for one STA.
+ * When enabling PS mode:
+ *  - Stop all STA's txq for AICWF_TXQ_STOP_STA_PS reason
+ *  - Count how many buffers are already ready for this STA
+ *  - For BC/MC sta, update all queued SKB to use hw_queue BCMC
+ *  - Update TIM if some packet are ready
+ *
+ * When disabling PS mode:
+ *  - Start all STA's txq for AICWF_TXQ_STOP_STA_PS reason
+ *  - For BC/MC sta, update all queued SKB to use hw_queue AC_BE
+ *  - Update TIM if some packet are ready (otherwise fw will not update TIM
+ *    in beacon for this STA)
+ *
+ * All counter/skb updates are protected from TX path by taking tx_lock
+ *
+ * NOTE: _bh_ in function name indicates that this function is called
+ * from a bottom_half tasklet.
+ */
+void aicwf_ps_bh_enable(struct aicwf_hw *aicwf_hw, struct aicwf_sta *sta,
+			bool enable)
+{
+	struct aicwf_txq *txq;
+
+	if (enable) {
+#ifdef AIC8800_CREATE_TRACE_POINTS
+		trace_ps_enable(sta);
+#endif
+		spin_lock_bh(&aicwf_hw->tx_lock);
+		sta->ps.active = true;
+		sta->ps.sp_cnt[LEGACY_PS_ID] = 0;
+		sta->ps.sp_cnt[UAPSD_ID] = 0;
+		aicwf_txq_sta_stop(sta, AICWF_TXQ_STOP_STA_PS, aicwf_hw);
+
+		if (is_multicast_sta(aicwf_hw, sta->sta_idx)) {
+			txq = aicwf_txq_sta_get(sta, 0, aicwf_hw);
+			sta->ps.pkt_ready[LEGACY_PS_ID] = skb_queue_len(&txq->sk_list);
+			sta->ps.pkt_ready[UAPSD_ID] = 0;
+			// txq->hwq = &aicwf_hw->hwq[AICWF_HWQ_BCMC];
+		} else {
+			int i;
+
+			sta->ps.pkt_ready[LEGACY_PS_ID] = 0;
+			sta->ps.pkt_ready[UAPSD_ID] = 0;
+
+#ifdef CONFIG_MAC80211_TXQ
+			for (i = 0, txq = aicwf_txq_sta_get(sta, 0);
+			     i < NX_NB_TXQ_PER_STA;
+			     i++, txq = aicwf_txq_sta_get(sta, i))
+#elif defined(CONFIG_AICWF_FULLMAC)
+			for (i = 0, txq = aicwf_txq_sta_get(sta,
+							    0, aicwf_hw);
+			     i < (is_multicast_sta(aicwf_hw, sta->sta_idx) ? 1 : NX_NB_TXQ_PER_STA);
+			     i++, txq++)
+#endif
+			{
+				sta->ps.pkt_ready[txq->ps_id] += skb_queue_len(&txq->sk_list);
+			}
+		}
+
+		spin_unlock_bh(&aicwf_hw->tx_lock);
+	} else {
+#ifdef AIC8800_CREATE_TRACE_POINTS
+		trace_ps_disable(sta->sta_idx);
+#endif
+		spin_lock_bh(&aicwf_hw->tx_lock);
+		sta->ps.active = false;
+
+		if (is_multicast_sta(aicwf_hw, sta->sta_idx)) {
+			txq = aicwf_txq_sta_get(sta, 0, aicwf_hw);
+			txq->hwq = &aicwf_hw->hwq[AICWF_HWQ_BE];
+			txq->push_limit = 0;
+		} else {
+			int i;
+
+#ifdef CONFIG_MAC80211_TXQ
+			for (i = 0, txq = aicwf_txq_sta_get(sta, 0);
+			     i < NX_NB_TXQ_PER_STA;
+			     i++, txq = aicwf_txq_sta_get(sta, i))
+#elif defined(CONFIG_AICWF_FULLMAC)
+			for (i = 0, txq = aicwf_txq_sta_get(sta,
+							    0, aicwf_hw);
+			     i < (is_multicast_sta(aicwf_hw, sta->sta_idx) ? 1 : NX_NB_TXQ_PER_STA);
+			     i++, txq++)
+#endif
+			{
+				txq->push_limit = 0;
+			}
+		}
+
+		aicwf_txq_sta_start(sta, AICWF_TXQ_STOP_STA_PS, aicwf_hw);
+		spin_unlock_bh(&aicwf_hw->tx_lock);
+		tasklet_schedule(&aicwf_hw->task);
+	}
+}
+
+/**
+ * aicwf_ps_bh_traffic_req - Handle traffic request for STA in PS mode
+ *
+ * @aicwf_hw: Driver main data
+ * @sta: Sta which enters/leaves PS mode
+ * @pkt_req: number of pkt to push
+ * @ps_id: type of PS data requested (@LEGACY_PS_ID or @UAPSD_ID)
+ *
+ * This function will make sure that @pkt_req are pushed to fw
+ * whereas the STA is in PS mode.
+ * If request is 0, send all traffic
+ * If request is greater than available pkt, reduce request
+ * Note: request will also be reduce if txq credits are not available
+ *
+ * All counter updates are protected from TX path by taking tx_lock
+ *
+ * NOTE: _bh_ in function name indicates that this function is called
+ * from the bottom_half tasklet.
+ */
+void aicwf_ps_bh_traffic_req(struct aicwf_hw *aicwf_hw, struct aicwf_sta *sta,
+			     u16 pkt_req, u8 ps_id)
+{
+	int pkt_ready_all;
+	struct aicwf_txq *txq;
+	int schedule = 0;
+
+	if (!sta->ps.active) {
+		dev_dbg(aicwf_hw->dev, "sta %pM is not in Power Save mode", sta->mac_addr);
+		return;
+	}
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_ps_traffic_req(sta, pkt_req, ps_id);
+#endif
+	spin_lock_bh(&aicwf_hw->tx_lock);
+
+	/*
+	 * Fw may ask to stop a service period with PS_SP_INTERRUPTED. This only
+	 * happens for p2p-go interface if NOA starts during a service period
+	 */
+	if (pkt_req == PS_SP_INTERRUPTED && ps_id == UAPSD_ID) {
+		int tid;
+
+		sta->ps.sp_cnt[ps_id] = 0;
+#ifdef CONFIG_MAC80211_TXQ
+		for (tid = 0, txq = aicwf_txq_sta_get(sta, 0); tid < NX_NB_TXQ_PER_STA;
+		     tid++, txq = aicwf_txq_sta_get(sta, tid))
+#elif defined(CONFIG_AICWF_FULLMAC)
+		for (tid = 0, txq = aicwf_txq_sta_get(sta, 0, aicwf_hw);
+		     tid < (is_multicast_sta(aicwf_hw, sta->sta_idx) ? 1 : NX_NB_TXQ_PER_STA);
+		     tid++, txq++)
+#endif
+		{
+			txq->push_limit = 0;
+		}
+
+		goto done;
+	}
+
+	pkt_ready_all = (sta->ps.pkt_ready[ps_id] - sta->ps.sp_cnt[ps_id]);
+
+	/*
+	 * Don't start SP until previous one is finished or we don't have
+	 * packet ready (which must not happen for U-APSD)
+	 */
+	if (sta->ps.sp_cnt[ps_id] || pkt_ready_all <= 0)
+		goto done;
+
+	/* Adapt request to what is available. */
+	if (pkt_req == 0 || pkt_req > pkt_ready_all)
+		pkt_req = pkt_ready_all;
+
+	/* Reset the SP counter */
+	sta->ps.sp_cnt[ps_id] = 0;
+	schedule = 1;
+
+	/* "dispatch" the request between txq */
+	if (is_multicast_sta(aicwf_hw, sta->sta_idx)) {
+		txq = aicwf_txq_sta_get(sta, 0, aicwf_hw);
+		// if (txq->credits <= 0)
+		//     goto done;
+		if (pkt_req > txq->credits)
+			pkt_req = txq->credits;
+		txq->push_limit = pkt_req;
+		sta->ps.sp_cnt[ps_id] = pkt_req;
+		aicwf_txq_add_to_hw_list(txq);
+	} else {
+		int i, tid;
+#ifdef CONFIG_AICWF_FULLMAC
+		for (i = 0, tid = nx_tid_prio[0],
+		     txq = aicwf_txq_sta_get(sta, tid, aicwf_hw);
+		     i < NX_NB_TID_PER_STA;
+		     i++, tid = nx_tid_prio[i], txq = aicwf_txq_sta_get(sta, tid, aicwf_hw))
+#endif
+		{
+			u16 txq_len = skb_queue_len(&txq->sk_list);
+
+			if (txq->ps_id != ps_id)
+				continue;
+
+			if (txq_len > txq->credits)
+				txq_len = txq->credits;
+
+			if (txq_len == 0)
+				continue;
+
+			if (txq_len < pkt_req) {
+				/*
+				 * Not enough pkt queued in this txq, add this
+				 * txq to hwq list and process next txq
+				 */
+				pkt_req -= txq_len;
+				txq->push_limit = txq_len;
+				sta->ps.sp_cnt[ps_id] += txq_len;
+				aicwf_txq_add_to_hw_list(txq);
+			} else {
+				/*
+				 * Enough pkt in this txq to comlete the request
+				 * add this txq to hwq list and stop processing txq
+				 */
+				txq->push_limit = pkt_req;
+				sta->ps.sp_cnt[ps_id] += pkt_req;
+				aicwf_txq_add_to_hw_list(txq);
+				break;
+			}
+		}
+	}
+
+done:
+	spin_unlock_bh(&aicwf_hw->tx_lock);
+	if (schedule)
+		tasklet_schedule(&aicwf_hw->task);
+}
+
+/******************************************************************************
+ * TX functions
+ *****************************************************************************/
+#define PRIO_STA_NULL 0xAA
+
+static const int aicwf_down_hwq2tid[3] = {
+	[AICWF_HWQ_BK] = 2,
+	[AICWF_HWQ_BE] = 3,
+	[AICWF_HWQ_VI] = 5,
+};
+
+static void aicwf_downgrade_ac(struct aicwf_sta *sta, struct sk_buff *skb)
+{
+	s8 ac = aicwf_tid2hwq[skb->priority];
+
+	if (WARN(ac > AICWF_HWQ_VO, "Unexepcted ac %d for skb before downgrade", ac))
+		ac = AICWF_HWQ_VO;
+
+	while (sta->acm & BIT(ac)) {
+		if (ac == AICWF_HWQ_BK) {
+			skb->priority = 1;
+			return;
+		}
+		ac--;
+		skb->priority = aicwf_down_hwq2tid[ac];
+	}
+}
+
+u16 aicwf_select_txq(struct aicwf_vif *aicwf_vif, struct sk_buff *skb)
+{
+	struct aicwf_hw *aicwf_hw = aicwf_vif->aicwf_hw;
+	struct wireless_dev *wdev = &aicwf_vif->wdev;
+	struct aicwf_sta *sta = NULL;
+	struct aicwf_txq *txq;
+	u16 netdev_queue;
+	bool tdls_mgmgt_frame = false;
+	int nx_bcmc_txq_ndev_idx = NX_BCMC_TXQ_NDEV_IDX;
+
+	if (aicwf_hw->chip_ops->is_old_ic)
+		nx_bcmc_txq_ndev_idx = NX_BCMC_TXQ_NDEV_IDX_FOR_OLD_IC;
+
+	switch (wdev->iftype) {
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	case NL80211_IFTYPE_P2P_CLIENT:
+#endif
+	case NL80211_IFTYPE_STATION: {
+		struct ethhdr *eth;
+
+		eth = (struct ethhdr *)skb->data;
+		if (eth->h_proto == cpu_to_be16(ETH_P_TDLS))
+			tdls_mgmgt_frame = true;
+
+		if (aicwf_vif->tdls_status == TDLS_LINK_ACTIVE &&
+		    aicwf_vif->sta.tdls_sta &&
+		    memcmp(eth->h_dest, aicwf_vif->sta.tdls_sta->mac_addr, ETH_ALEN) == 0)
+			sta = aicwf_vif->sta.tdls_sta;
+		else
+			sta = aicwf_vif->sta.ap;
+		break;
+	}
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	case NL80211_IFTYPE_AP_VLAN:
+		if (aicwf_vif->ap_vlan.sta_4a) {
+			sta = aicwf_vif->ap_vlan.sta_4a;
+			break;
+		}
+
+		/*
+		 * AP_VLAN interface is not used for a 4A STA,
+		 * fallback searching sta amongs all AP's clients
+		 */
+		aicwf_vif = aicwf_vif->ap_vlan.master;
+		fallthrough;
+	case NL80211_IFTYPE_AP:
+	case NL80211_IFTYPE_P2P_GO: {
+		struct aicwf_sta *cur;
+		struct ethhdr *eth = (struct ethhdr *)skb->data;
+
+		if (is_multicast_ether_addr(eth->h_dest)) {
+			sta = &aicwf_hw->sta_table[aicwf_vif->ap.bcmc_index];
+		} else {
+			spin_lock_bh(&aicwf_vif->aicwf_hw->cb_lock);
+			list_for_each_entry(cur, &aicwf_vif->ap.sta_list, list) {
+				if (!memcmp(cur->mac_addr, eth->h_dest, ETH_ALEN)) {
+					sta = cur;
+					break;
+				}
+			}
+			spin_unlock_bh(&aicwf_vif->aicwf_hw->cb_lock);
+		}
+
+		break;
+	}
+#if IS_ENABLED(CONFIG_AIC8800_NONSTA_SUPPORT)
+	case NL80211_IFTYPE_MESH_POINT: {
+		struct ethhdr *eth = (struct ethhdr *)skb->data;
+
+		if (!aicwf_vif->is_resending) {
+			/*
+			 * If ethernet source address is not the address of a mesh wireless
+			 * interface, we are proxy for this address and have to inform the
+			 * HW
+			 */
+			if (memcmp(&eth->h_source[0], &aicwf_vif->ndev->perm_addr[0],
+				   ETH_ALEN)) {
+				/* Check if LMAC is already informed */
+				if (!aicwf_get_mesh_proxy_info(aicwf_vif, (u8 *)&eth->h_source,
+							       true)) {
+					aicwf_send_mesh_proxy_add_req(aicwf_hw, aicwf_vif,
+								      (u8 *)&eth->h_source);
+				}
+			}
+		}
+
+		if (is_multicast_ether_addr(eth->h_dest)) {
+			sta = &aicwf_hw->sta_table[aicwf_vif->ap.bcmc_index];
+		} else {
+			/* Path to be used */
+			struct aicwf_mesh_path *p_mesh_path = NULL;
+			struct aicwf_mesh_path *p_cur_path;
+			/* Check if destination is proxied by a peer Mesh STA */
+			struct aicwf_mesh_proxy *p_mesh_proxy =
+				aicwf_get_mesh_proxy_info(aicwf_vif, (u8 *)&eth->h_dest, false);
+			/* Mesh Target address */
+			struct mac_addr *p_tgt_mac_addr;
+
+			if (p_mesh_proxy)
+				p_tgt_mac_addr = &p_mesh_proxy->proxy_addr;
+			else
+				p_tgt_mac_addr = (struct mac_addr *)&eth->h_dest;
+
+			/* Look for path with provided target address */
+			list_for_each_entry(p_cur_path, &aicwf_vif->ap.mpath_list, list)	{
+				if (!memcmp(&p_cur_path->tgt_mac_addr, p_tgt_mac_addr,
+					    ETH_ALEN)) {
+					p_mesh_path = p_cur_path;
+					break;
+				}
+			}
+
+			if (p_mesh_path) {
+				sta = p_mesh_path->p_nhop_sta;
+			} else {
+				aicwf_send_mesh_path_create_req(aicwf_hw, aicwf_vif,
+								(u8 *)p_tgt_mac_addr);
+			}
+		}
+
+		break;
+	}
+#endif
+#endif
+	default:
+		break;
+	}
+
+	if (sta && sta->qos) {
+		if (tdls_mgmgt_frame) {
+			skb_set_queue_mapping(skb,
+					      NX_STA_NDEV_IDX(skb->priority, sta->sta_idx));
+		} else {
+			/* use the data classifier to determine what 802.1d tag the
+			 * data frame has
+			 */
+			skb->priority = cfg80211_classify8021d(skb, NULL) &
+							IEEE80211_QOS_CTL_TAG1D_MASK;
+		}
+		if (sta->acm)
+			aicwf_downgrade_ac(sta, skb);
+
+		txq = aicwf_txq_sta_get(sta, skb->priority, aicwf_hw);
+		netdev_queue = txq->ndev_idx;
+	} else if (sta) {
+		skb->priority = 0xFF;
+		txq = aicwf_txq_sta_get(sta, 0, aicwf_hw);
+		netdev_queue = txq->ndev_idx;
+	} else {
+		/*
+		 * This packet will be dropped in xmit function, still need to select
+		 * an active queue for xmit to be called. As it most likely to happen
+		 * for AP interface, select BCMC queue
+		 * (TODO: select another queue if BCMC queue is stopped)
+		 */
+		skb->priority = PRIO_STA_NULL;
+		netdev_queue = nx_bcmc_txq_ndev_idx;
+	}
+
+#ifndef CONFIG_AIC8800_ONE_TXQ
+	WARN_ON_ONCE(netdev_queue >= NX_NB_NDEV_TXQ);
+#endif
+
+	return netdev_queue;
+}
+
+/**
+ * aicwf_set_more_data_flag - Update MORE_DATA flag in tx sw desc
+ *
+ * @aicwf_hw: Driver main data
+ * @sw_txhdr: Header for pkt to be pushed
+ *
+ * If STA is in PS mode
+ *  - Set EOSP in case the packet is the last of the UAPSD service period
+ *  - Set MORE_DATA flag if more pkt are ready for this sta
+ *  - Update TIM if this is the last pkt buffered for this sta
+ *
+ * note: tx_lock already taken.
+ */
+static inline void aicwf_set_more_data_flag(struct aicwf_hw *aicwf_hw,
+					    struct aicwf_sw_txhdr *sw_txhdr)
+{
+	struct aicwf_sta *sta = sw_txhdr->aicwf_sta;
+	struct aicwf_vif *vif = sw_txhdr->aicwf_vif;
+	struct aicwf_txq *txq = sw_txhdr->txq;
+
+	if (unlikely(sta->ps.active)) {
+		sta->ps.pkt_ready[txq->ps_id]--;
+		sta->ps.sp_cnt[txq->ps_id]--;
+#ifdef AIC8800_CREATE_TRACE_POINTS
+		trace_ps_push(sta);
+#endif
+		if ((txq->ps_id == UAPSD_ID ||
+		     vif->wdev.iftype == NL80211_IFTYPE_MESH_POINT ||
+		     sta->tdls.active) &&
+		    !sta->ps.sp_cnt[txq->ps_id]) {
+			sw_txhdr->desc.host.flags |= TXU_CNTRL_EOSP;
+		}
+
+		if (sta->ps.pkt_ready[txq->ps_id])
+			sw_txhdr->desc.host.flags |= TXU_CNTRL_MORE_DATA;
+		else
+			aicwf_set_traffic_status(aicwf_hw, sta, false, txq->ps_id);
+	}
+}
+
+/**
+ * aicwf_get_tx_priv - Get STA and tid for one skb
+ *
+ * @aicwf_vif: vif ptr
+ * @skb: skb
+ * @tid: pointer updated with the tid to use for this skb
+ *
+ * @return: pointer on the destination STA (may be NULL)
+ *
+ * skb has already been parsed in aicwf_select_queue function
+ * simply re-read information form skb.
+ */
+static struct aicwf_sta *aicwf_get_tx_priv(struct aicwf_vif *aicwf_vif,
+					   struct sk_buff *skb, u8 *tid)
+{
+	struct aicwf_hw *aicwf_hw = aicwf_vif->aicwf_hw;
+	struct aicwf_sta *sta;
+	int sta_idx;
+	int nx_remote_sta_max = NX_REMOTE_STA_MAX;
+	int nx_bcmc_txq_ndev_idx = NX_BCMC_TXQ_NDEV_IDX;
+
+	if (aicwf_hw->chip_ops->is_old_ic) {
+		nx_remote_sta_max = NX_REMOTE_STA_MAX_FOR_OLD_IC;
+		nx_bcmc_txq_ndev_idx = NX_BCMC_TXQ_NDEV_IDX_FOR_OLD_IC;
+	}
+
+	*tid = skb->priority;
+	if (unlikely(skb->priority == PRIO_STA_NULL))
+		return NULL;
+
+	int ndev_idx = skb_get_queue_mapping(skb);
+
+	if (ndev_idx == nx_bcmc_txq_ndev_idx)
+		sta_idx = nx_remote_sta_max + master_vif_idx(aicwf_vif);
+	else
+		sta_idx = ndev_idx / NX_NB_TID_PER_STA;
+	sta = &aicwf_hw->sta_table[sta_idx];
+
+	return sta;
+}
+
+/**
+ * aicwf_prep_tx - Prepare buffer for DMA transmission
+ *
+ * @aicwf_hw: Driver main data
+ * @txhdr: Tx descriptor
+ *
+ * Maps hw_txhdr and buffer data for transmission via DMA.
+ * - Data buffer with be downloaded by embebded side.
+ * - hw_txhdr will be uploaded by embedded side when buffer has been
+ *   transmitted over the air.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+static int aicwf_prep_tx(struct aicwf_hw *aicwf_hw, struct aicwf_txhdr *txhdr)
+{
+	return 0;
+}
+
+/**
+ *  aicwf_tx_push - Push one packet to fw
+ *
+ * @aicwf_hw: Driver main data
+ * @txhdr: tx desc of the buffer to push
+ * @flags: push flags (see @aicwf_push_flags)
+ *
+ * Push one packet to fw. Sw desc of the packet has already been updated.
+ * Only MORE_DATA flag will be set if needed.
+ */
+void aicwf_tx_push(struct aicwf_hw *aicwf_hw, struct aicwf_txhdr *txhdr, int flags)
+{
+	struct aicwf_sw_txhdr *sw_txhdr = txhdr->sw_hdr;
+	struct sk_buff *skb = sw_txhdr->skb;
+	struct aicwf_txq *txq = sw_txhdr->txq;
+	u16 hw_queue = txq->hwq->id;
+	int user = 0;
+
+	lockdep_assert_held(&aicwf_hw->tx_lock);
+
+	/* RETRY flag is not always set so retest here */
+	if (txq->nb_retry) {
+		flags |= AICWF_PUSH_RETRY;
+		txq->nb_retry--;
+		if (txq->nb_retry == 0) {
+			WARN(skb != txq->last_retry_skb,
+			     "last retry buffer is not the expected one");
+			txq->last_retry_skb = NULL;
+		}
+	} else if (!(flags & AICWF_PUSH_RETRY)) {
+		txq->pkt_sent++;
+	}
+#ifdef CONFIG_AICWF_AMSDUS_TX
+	if (txq->amsdu == sw_txhdr) {
+		WARN((flags & AICWF_PUSH_RETRY), "End A-MSDU on a retry");
+		aicwf_hw->stats.amsdus[sw_txhdr->amsdu.nb - 1].done++;
+		txq->amsdu = NULL;
+	} else if (!(flags & AICWF_PUSH_RETRY) &&
+			   !(sw_txhdr->desc.host.flags & TXU_CNTRL_AMSDU)) {
+		aicwf_hw->stats.amsdus[0].done++;
+	}
+#endif /* CONFIG_AICWF_AMSDUS_TX */
+
+	/*
+	 * Wait here to update hw_queue, as for multicast STA hwq may change
+	 * between queue and push (because of PS)
+	 */
+	sw_txhdr->hw_queue = hw_queue;
+
+	// sw_txhdr->desc.host.packet_addr = hw_queue; //use packet_addr field for
+	// hw_txq
+	sw_txhdr->desc.host.ac = hw_queue; // use ac field for hw_txq
+#ifdef CONFIG_AICWF_MUMIMO_TX
+	/* MU group is only selected during hwq processing */
+	sw_txhdr->desc.host.mumimo_info = txq->mumimo_info;
+	user = AICWF_TXQ_POS_ID(txq);
+#endif /* CONFIG_AICWF_MUMIMO_TX */
+
+	if (sw_txhdr->aicwf_sta) {
+		/* only for AP mode */
+		aicwf_set_more_data_flag(aicwf_hw, sw_txhdr);
+	}
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_push_desc(skb, sw_txhdr, flags);
+#endif
+
+	txq->pkt_pushed[user]++;
+
+	if (txq->push_limit)
+		txq->push_limit--;
+
+	if (((sw_txhdr->desc.host.flags & TXU_CNTRL_MGMT) &&
+	     (*(skb->data + sw_txhdr->headroom) == 0xd0 ||
+	      *(skb->data + sw_txhdr->headroom) == 0x10 ||
+	      *(skb->data + sw_txhdr->headroom) == 0x30)) ||
+		    sw_txhdr->desc.host.ethertype == cpu_to_be16(ETH_P_PAE) ||
+		    sw_txhdr->desc.host.ethertype == cpu_to_be16(0x88b4)) {
+		sw_txhdr->need_cfm = 1;
+		sw_txhdr->desc.host.hostid =
+			((1 << 31) | aicwf_hw->sdio_env.txdesc_free_idx[0]);
+		aicwf_sdio_host_txdesc_push(&aicwf_hw->sdio_env, 0, (long)skb);
+		dev_dbg(aicwf_hw->dev, "need cfm ethertype:%8x,user_idx=%d, skb=%p\n",
+			sw_txhdr->desc.host.ethertype,
+			aicwf_hw->sdio_env.txdesc_free_idx[0], skb);
+	} else {
+		sw_txhdr->need_cfm = 0;
+		sw_txhdr->desc.host.hostid = 0;
+
+		sw_txhdr->aicwf_vif->net_stats.tx_packets++;
+		sw_txhdr->aicwf_vif->net_stats.tx_bytes += sw_txhdr->frame_len;
+		aicwf_hw->stats.last_tx = jiffies;
+	}
+	aicwf_frame_tx((void *)(aicwf_hw->sdiodev), skb);
+	aicwf_hw->stats.cfm_balance[hw_queue]++;
+}
+
+/**
+ * aicwf_tx_retry - Push an AMPDU pkt that need to be retried
+ *
+ * @aicwf_hw: Driver main data
+ * @skb: pkt to re-push
+ * @txhdr: tx desc of the pkt to re-push
+ * @sw_retry: Indicates if fw decide to retry this buffer
+ *            (i.e. it has never been transmitted over the air)
+ *
+ * Called when a packet needs to be repushed to the firmware.
+ * First update sw descriptor and then queue it in the retry list.
+ */
+static void aicwf_tx_retry(struct aicwf_hw *aicwf_hw, struct sk_buff *skb,
+			   struct aicwf_txhdr *txhdr, bool sw_retry)
+{
+	struct aicwf_sw_txhdr *sw_txhdr = txhdr->sw_hdr;
+	struct tx_cfm_tag *cfm = &txhdr->hw_hdr.cfm;
+	struct aicwf_txq *txq = sw_txhdr->txq;
+
+	if (!sw_retry) {
+		/* update sw desc */
+		sw_txhdr->desc.host.flags |= TXU_CNTRL_RETRY;
+
+#ifdef CONFIG_AICWF_AMSDUS_TX
+		if (sw_txhdr->desc.host.flags & TXU_CNTRL_AMSDU)
+			aicwf_hw->stats.amsdus[sw_txhdr->amsdu.nb - 1].failed++;
+#endif
+	}
+
+	/* MORE_DATA will be re-set if needed when pkt will be repushed */
+	sw_txhdr->desc.host.flags &= ~TXU_CNTRL_MORE_DATA;
+
+	cfm->status.value = 0;
+
+	txq->credits++;
+	if (txq->credits > 0)
+		aicwf_txq_start(txq, AICWF_TXQ_STOP_FULL);
+
+	/* Queue the buffer */
+	aicwf_txq_queue_skb(skb, txq, aicwf_hw, true);
+}
+
+#ifdef CONFIG_AICWF_AMSDUS_TX
+/* return size of subframe (including header) */
+static inline int aicwf_amsdu_subframe_length(struct ethhdr *eth, int eth_len)
+{
+	/*
+	 * ethernet header is replaced with amdsu header that have the same size
+	 * Only need to check if LLC/SNAP header will be added
+	 */
+	int len = eth_len;
+
+	if (ntohs(eth->h_proto) >= ETH_P_802_3_MIN)
+		len += sizeof(rfc1042_header) + 2;
+	return len;
+}
+
+static inline bool aicwf_amsdu_is_aggregable(struct sk_buff *skb)
+{
+	/* need to add some check on buffer to see if it can be aggregated ? */
+	return true;
+}
+
+/*
+ * aicwf_amsdu_del_subframe_header - remove AMSDU header
+ *
+ * amsdu_txhdr: amsdu tx descriptor
+ *
+ * Move back the ethernet header at the "beginning" of the data buffer.
+ * (which has been moved in @aicwf_amsdu_add_subframe_header)
+ */
+static void aicwf_amsdu_del_subframe_header(struct aicwf_amsdu_txhdr *amsdu_txhdr)
+{
+	struct sk_buff *skb = amsdu_txhdr->skb;
+	struct ethhdr *eth;
+	u8 *pos;
+
+	pos = skb->data;
+	pos += sizeof(struct aicwf_amsdu_txhdr);
+	eth = (struct ethhdr *)pos;
+	pos += amsdu_txhdr->pad + sizeof(struct ethhdr);
+
+	if (ntohs(eth->h_proto) >= ETH_P_802_3_MIN)
+		pos += sizeof(rfc1042_header) + 2;
+
+	memmove(pos, eth, sizeof(*eth));
+	skb_pull(skb, (pos - skb->data));
+}
+
+/*
+ * aicwf_amsdu_add_subframe_header - Add AMSDU header and link subframe
+ *
+ * @aicwf_hw Driver main data
+ * @skb Buffer to aggregate
+ * @sw_txhdr Tx descriptor for the first A-MSDU subframe
+ *
+ * return 0 on success, -1 otherwise
+ *
+ * This functions Add A-MSDU header and LLC/SNAP header in the buffer
+ * and update sw_txhdr of the first subframe to link this buffer.
+ * If an error happens, the buffer will be queued as a normal buffer.
+ *
+ *
+ *            Before           After
+ *         +-------------+  +-------------+
+ *         | HEADROOM    |  | HEADROOM    |
+ *         |             |  +-------------+ <- data
+ *         |             |  | amsdu_txhdr |
+ *         |             |  | * pad size  |
+ *         |             |  +-------------+
+ *         |             |  | ETH hdr     | keep original eth hdr
+ *         |             |  |             | to restore it once transmitted
+ *         |             |  +-------------+ <- packet_addr[x]
+ *         |             |  | Pad         |
+ *         |             |  +-------------+
+ * data -> +-------------+  | AMSDU HDR   |
+ *         | ETH hdr     |  +-------------+
+ *         |             |  | LLC/SNAP    |
+ *         +-------------+  +-------------+
+ *         | DATA        |  | DATA        |
+ *         |             |  |             |
+ *         +-------------+  +-------------+
+ *
+ * Called with tx_lock hold
+ */
+static int aicwf_amsdu_add_subframe_header(struct aicwf_hw *aicwf_hw,
+					   struct sk_buff *skb,
+					   struct aicwf_sw_txhdr *sw_txhdr)
+{
+	struct aicwf_amsdu *amsdu = &sw_txhdr->amsdu;
+	struct aicwf_amsdu_txhdr *amsdu_txhdr;
+	struct ethhdr *amsdu_hdr, *eth = (struct ethhdr *)skb->data;
+	int headroom_need, map_len, msdu_len;
+	dma_addr_t dma_addr;
+	u8 *pos, *map_start;
+
+	msdu_len = skb->len - sizeof(*eth);
+	headroom_need = sizeof(*amsdu_txhdr) + amsdu->pad + sizeof(*amsdu_hdr);
+	if (ntohs(eth->h_proto) >= ETH_P_802_3_MIN) {
+		headroom_need += sizeof(rfc1042_header) + 2;
+		msdu_len += sizeof(rfc1042_header) + 2;
+	}
+
+	/* we should have enough headroom (checked in xmit) */
+	if (WARN_ON(skb_headroom(skb) < headroom_need))
+		return -1;
+
+	/* allocate headroom */
+	pos = skb_push(skb, headroom_need);
+	amsdu_txhdr = (struct aicwf_amsdu_txhdr *)pos;
+	pos += sizeof(*amsdu_txhdr);
+
+	/* move eth header */
+	memmove(pos, eth, sizeof(*eth));
+	eth = (struct ethhdr *)pos;
+	pos += sizeof(*eth);
+
+	/* Add padding from previous subframe */
+	map_start = pos;
+	memset(pos, 0, amsdu->pad);
+	pos += amsdu->pad;
+
+	/* Add AMSDU hdr */
+	amsdu_hdr = (struct ethhdr *)pos;
+	memcpy(amsdu_hdr->h_dest, eth->h_dest, ETH_ALEN);
+	memcpy(amsdu_hdr->h_source, eth->h_source, ETH_ALEN);
+	amsdu_hdr->h_proto = htons(msdu_len);
+	pos += sizeof(*amsdu_hdr);
+
+	if (ntohs(eth->h_proto) >= ETH_P_802_3_MIN) {
+		memcpy(pos, rfc1042_header, sizeof(rfc1042_header));
+		pos += sizeof(rfc1042_header);
+	}
+
+	/* MAP (and sync) memory for DMA */
+	map_len = msdu_len + amsdu->pad + sizeof(*amsdu_hdr);
+	dma_addr =
+		dma_map_single(aicwf_hw->dev, map_start, map_len, DMA_BIDIRECTIONAL);
+	if (WARN_ON(dma_mapping_error(aicwf_hw->dev, dma_addr))) {
+		pos -= sizeof(*eth);
+		memmove(pos, eth, sizeof(*eth));
+		skb_pull(skb, headroom_need);
+		return -1;
+	}
+
+	/* update amdsu_txhdr */
+	amsdu_txhdr->map_len = map_len;
+	amsdu_txhdr->dma_addr = dma_addr;
+	amsdu_txhdr->skb = skb;
+	amsdu_txhdr->pad = amsdu->pad;
+	amsdu_txhdr->msdu_len = msdu_len;
+
+	/* update aicwf_sw_txhdr (of the first subframe) */
+	WARN_ON_ONCE(amsdu->nb != sw_txhdr->desc.host.packet_cnt);
+
+	sw_txhdr->desc.host.packet_addr[amsdu->nb] = dma_addr;
+	sw_txhdr->desc.host.packet_len[amsdu->nb] = map_len;
+	sw_txhdr->desc.host.packet_cnt++;
+	amsdu->nb++;
+
+	amsdu->pad = AMSDU_PADDING(map_len - amsdu->pad);
+	list_add_tail(&amsdu_txhdr->list, &amsdu->hdrs);
+	amsdu->len += map_len;
+
+	trace_amsdu_subframe(sw_txhdr);
+	return 0;
+}
+
+/*
+ * aicwf_amsdu_add_subframe - Add this buffer as an A-MSDU subframe if possible
+ *
+ * @aicwf_hw Driver main data
+ * @skb Buffer to aggregate if possible
+ * @sta Destination STA
+ * @txq sta's txq used for this buffer
+ *
+ * Tyr to aggregate the buffer in an A-MSDU. If it succeed then the
+ * buffer is added as a new A-MSDU subframe with AMSDU and LLC/SNAP
+ * headers added (so FW won't have to modify this subframe).
+ *
+ * To be added as subframe :
+ * - sta must allow amsdu
+ * - buffer must be aggregable (to be defined)
+ * - at least one other aggregable buffer is pending in the queue
+ *  or an a-msdu (with enough free space) is currently in progress
+ *
+ * returns true if buffer has been added as A-MDSP subframe, false otherwise
+ *
+ */
+static bool aicwf_amsdu_add_subframe(struct aicwf_hw *aicwf_hw,
+				     struct sk_buff *skb, struct aicwf_sta *sta,
+				     struct aicwf_txq *txq)
+{
+	bool res = false;
+	struct ethhdr *eth;
+
+	/* immediately return if amsdu are not allowed for this sta */
+	if (!txq->amsdu_len || aicwf_hw->mod_params->amsdu_maxnb < 2 ||
+	    !aicwf_amsdu_is_aggregable(skb))
+		return false;
+
+	spin_lock_bh(&aicwf_hw->tx_lock);
+	if (txq->amsdu) {
+		/*
+		 * aggreagation already in progress, add this buffer if enough space
+		 * available, otherwise end the current amsdu
+		 */
+		struct aicwf_sw_txhdr *sw_txhdr = txq->amsdu;
+
+		eth = (struct ethhdr *)(skb->data);
+
+		if (((sw_txhdr->amsdu.len + sw_txhdr->amsdu.pad +
+			  aicwf_amsdu_subframe_length(eth, skb->len)) > txq->amsdu_len) ||
+			aicwf_amsdu_add_subframe_header(aicwf_hw, skb, sw_txhdr)) {
+			txq->amsdu = NULL;
+			goto end;
+		}
+
+		if (sw_txhdr->amsdu.nb >= aicwf_hw->mod_params->amsdu_maxnb) {
+			aicwf_hw->stats.amsdus[sw_txhdr->amsdu.nb - 1].done++;
+			/* max number of subframes reached */
+			txq->amsdu = NULL;
+		}
+	} else {
+		/*
+		 * Check if a new amsdu can be started with the previous buffer
+		 * (if any) and this one
+		 */
+		struct sk_buff *skb_prev = skb_peek_tail(&txq->sk_list);
+		struct aicwf_txhdr *txhdr;
+		struct aicwf_sw_txhdr *sw_txhdr;
+		int len1, len2;
+
+		if (!skb_prev || !aicwf_amsdu_is_aggregable(skb_prev))
+			goto end;
+
+		txhdr = (struct aicwf_txhdr *)skb_prev->data;
+		sw_txhdr = txhdr->sw_hdr;
+		if (sw_txhdr->amsdu.len ||
+		    (sw_txhdr->desc.host.flags & TXU_CNTRL_RETRY))
+			/* previous buffer is already a complete amsdu or a retry */
+			goto end;
+
+		eth = (struct ethhdr *)(skb_prev->data + sw_txhdr->headroom);
+		len1 = aicwf_amsdu_subframe_length(eth,
+						   (sw_txhdr->frame_len + sizeof(struct ethhdr)));
+
+		eth = (struct ethhdr *)(skb->data);
+		len2 = aicwf_amsdu_subframe_length(eth, skb->len);
+
+		if (len1 + AMSDU_PADDING(len1) + len2 > txq->amsdu_len)
+			/* not enough space to aggregate those two buffers */
+			goto end;
+
+		/*
+		 * Add subframe header.
+		 * Note: Fw will take care of adding AMDSU header for the first
+		 * subframe while generating 802.11 MAC header
+		 */
+		INIT_LIST_HEAD(&sw_txhdr->amsdu.hdrs);
+		sw_txhdr->amsdu.len = len1;
+		sw_txhdr->amsdu.nb = 1;
+		sw_txhdr->amsdu.pad = AMSDU_PADDING(len1);
+		if (aicwf_amsdu_add_subframe_header(aicwf_hw, skb, sw_txhdr))
+			goto end;
+
+		sw_txhdr->desc.host.flags |= TXU_CNTRL_AMSDU;
+
+		if (sw_txhdr->amsdu.nb < aicwf_hw->mod_params->amsdu_maxnb)
+			txq->amsdu = sw_txhdr;
+		else
+			aicwf_hw->stats.amsdus[sw_txhdr->amsdu.nb - 1].done++;
+	}
+
+	res = true;
+
+end:
+	spin_unlock_bh(&aicwf_hw->tx_lock);
+	return res;
+}
+#endif /* CONFIG_AICWF_AMSDUS_TX */
+
+/*
+ * netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb,
+ *                               struct net_device *dev);
+ *	Called when a packet needs to be transmitted.
+ *	Must return NETDEV_TX_OK , NETDEV_TX_BUSY.
+ *        (can also return NETDEV_TX_LOCKED if NETIF_F_LLTX)
+ *
+ *  - Initialize the descriptor for this pkt (stored in skb before data)
+ *  - Push the pkt in the corresponding Txq
+ *  - If possible (i.e. credit available and not in PS) the pkt is pushed
+ *    to fw
+ */
+netdev_tx_t aicwf_start_xmit(struct sk_buff *skb, struct net_device *dev)
+{
+	struct aicwf_vif *aicwf_vif = netdev_priv(dev);
+	struct aicwf_hw *aicwf_hw = aicwf_vif->aicwf_hw;
+	struct aicwf_txhdr *txhdr;
+	struct aicwf_sw_txhdr *sw_txhdr;
+	struct txdesc_api *desc;
+	struct aicwf_sta *sta;
+	struct aicwf_txq *txq;
+	int headroom;
+	int max_headroom;
+	int hdr_pads;
+
+	u16 frame_len;
+	u8 tid;
+
+	struct ethhdr eth_t;
+
+#ifdef CONFIG_AIC8800_ONE_TXQ
+	skb->queue_mapping = aicwf_select_txq(aicwf_vif, skb);
+#endif
+
+	if (unlikely(READ_ONCE(aicwf_hw->regdom_failed)))
+		goto free;
+
+	sk_pacing_shift_update(skb->sk, aicwf_hw->tcp_pacing_shift);
+	max_headroom = sizeof(struct aicwf_txhdr);
+
+	/* check whether the current skb can be used */
+	if (skb_shared(skb) || (skb_headroom(skb) < max_headroom) ||
+	    (skb_cloned(skb) && (dev->priv_flags & IFF_BRIDGE_PORT))) {
+		struct sk_buff *newskb =
+			skb_copy_expand(skb, max_headroom, 0, GFP_ATOMIC);
+		if (unlikely(!newskb))
+			goto free;
+
+		dev_kfree_skb_any(skb);
+
+		skb = newskb;
+	}
+
+	//if (skb->priority < 3)
+	//	skb->priority = 0;
+
+	memcpy(&eth_t, skb->data, sizeof(struct ethhdr));
+
+	/* Get the STA id and TID information */
+	sta = aicwf_get_tx_priv(aicwf_vif, skb, &tid);
+	if (!sta)
+		goto free;
+
+	txq = aicwf_txq_sta_get(sta, tid, aicwf_hw);
+	if (txq->idx == TXQ_INACTIVE)
+		goto free;
+
+#ifdef CONFIG_AICWF_AMSDUS_TX
+	if (aicwf_amsdu_add_subframe(aicwf_hw, skb, sta, txq))
+		return NETDEV_TX_OK;
+#endif
+
+	/* Retrieve the pointer to the Ethernet data */
+	// eth = (struct ethhdr *)skb->data;
+
+	skb_pull(skb, 14);
+	// hdr_pads  = AICWF_SWTXHDR_ALIGN_PADS((long)eth);
+	hdr_pads = AICWF_SWTXHDR_ALIGN_PADS((long)skb->data);
+	headroom = sizeof(struct aicwf_txhdr) + hdr_pads;
+
+	skb_push(skb, headroom);
+
+	txhdr = (struct aicwf_txhdr *)skb->data;
+	sw_txhdr = kmem_cache_alloc(aicwf_hw->sw_txhdr_cache, GFP_ATOMIC);
+	if (unlikely(!sw_txhdr))
+		goto free;
+	txhdr->sw_hdr = sw_txhdr;
+	desc = &sw_txhdr->desc;
+
+	frame_len = (u16)skb->len - headroom; // - sizeof(*eth);
+
+	sw_txhdr->txq = txq;
+	sw_txhdr->frame_len = frame_len;
+	sw_txhdr->aicwf_sta = sta;
+	sw_txhdr->aicwf_vif = aicwf_vif;
+	sw_txhdr->skb = skb;
+	sw_txhdr->headroom = headroom;
+
+#ifdef CONFIG_AICWF_AMSDUS_TX
+	sw_txhdr->amsdu.len = 0;
+	sw_txhdr->amsdu.nb = 0;
+#endif
+	// Fill-in the descriptor
+	memcpy(&desc->host.eth_dest_addr, eth_t.h_dest, ETH_ALEN);
+	memcpy(&desc->host.eth_src_addr, eth_t.h_source, ETH_ALEN);
+	desc->host.ethertype = eth_t.h_proto;
+	desc->host.staid = sta->sta_idx;
+	desc->host.tid = tid;
+	desc->host.vif_idx = aicwf_vif->vif_index;
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	if (unlikely(aicwf_vif->wdev.iftype == NL80211_IFTYPE_AP_VLAN))
+		desc->host.vif_idx = aicwf_vif->ap_vlan.master->vif_index;
+#endif
+
+	if (aicwf_vif->use_4addr && sta->sta_idx < NX_REMOTE_STA_MAX)
+		desc->host.flags = TXU_CNTRL_USE_4ADDR;
+	else
+		desc->host.flags = 0;
+
+	if (aicwf_vif->tdls_status == TDLS_LINK_ACTIVE && aicwf_vif->sta.tdls_sta &&
+	    (memcmp(desc->host.eth_dest_addr.array,
+		    aicwf_vif->sta.tdls_sta->mac_addr, ETH_ALEN) == 0)) {
+		desc->host.flags |= TXU_CNTRL_TDLS;
+		aicwf_vif->sta.tdls_sta->tdls.last_tid = desc->host.tid;
+		// aicwf_vif->sta.tdls_sta->tdls.last_sn = desc->host.sn;
+	}
+
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_MESH_POINT) {
+		if (aicwf_vif->is_resending)
+			desc->host.flags |= TXU_CNTRL_MESH_FWD;
+	}
+#endif
+
+#ifdef CONFIG_AICWF_SPLIT_TX_BUF
+	desc->host.packet_len[0] = frame_len;
+#else
+	desc->host.packet_len = frame_len;
+#endif
+
+	txhdr->hw_hdr.cfm.status.value = 0;
+
+	if (unlikely(aicwf_prep_tx(aicwf_hw, txhdr))) {
+		kmem_cache_free(aicwf_hw->sw_txhdr_cache, sw_txhdr);
+		skb_pull(skb, headroom);
+		dev_kfree_skb_any(skb);
+		return NETDEV_TX_BUSY;
+	}
+
+	spin_lock_bh(&aicwf_hw->tx_lock);
+	if (aicwf_txq_queue_skb(skb, txq, aicwf_hw, false))
+		aicwf_hwq_process(aicwf_hw, txq->hwq);
+	spin_unlock_bh(&aicwf_hw->tx_lock);
+
+	return NETDEV_TX_OK;
+
+free:
+	dev_kfree_skb_any(skb);
+
+	return NETDEV_TX_OK;
+}
+
+/**
+ * aicwf_start_mgmt_xmit - Transmit a management frame
+ *
+ * @vif: Vif that send the frame
+ * @sta: Destination of the frame. May be NULL if the destiantion is unknown
+ *       to the AP.
+ * @params: Mgmt frame parameters
+ * @offchan: Indicate whether the frame must be send via the offchan TXQ.
+ *           (is is redundant with params->offchan ?)
+ * @cookie: identifies the frame with upper layers
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+
+int aicwf_start_mgmt_xmit(struct aicwf_vif *vif, struct aicwf_sta *sta,
+			  struct cfg80211_mgmt_tx_params *params, bool offchan,
+			  u64 cookie)
+{
+	struct aicwf_hw *aicwf_hw = vif->aicwf_hw;
+	struct aicwf_txhdr *txhdr;
+	struct aicwf_sw_txhdr *sw_txhdr;
+	struct txdesc_api *desc;
+	struct sk_buff *skb;
+	u16 frame_len, headroom;
+	u8 *data;
+	int nx_off_chan_txq_idx = NX_OFF_CHAN_TXQ_IDX;
+	struct aicwf_txq *txq;
+	bool robust;
+	const u8 *buf = params->buf;
+	size_t len = params->len;
+	bool no_cck = params->no_cck;
+
+	if (READ_ONCE(aicwf_hw->regdom_failed))
+		return -EIO;
+
+	dev_dbg(aicwf_hw->dev, "mgmt xmit %x %x ", buf[0], buf[1]);
+
+	if (aicwf_hw->chip_ops->is_old_ic)
+		nx_off_chan_txq_idx = NX_OFF_CHAN_TXQ_IDX_FOR_OLD_IC;
+
+	headroom = sizeof(struct aicwf_txhdr);
+	frame_len = len;
+
+	/* Set TID and Queues indexes */
+	if (sta) {
+		txq = aicwf_txq_sta_get(sta, 8, aicwf_hw);
+	} else {
+		if (offchan)
+			txq = &aicwf_hw->txq[nx_off_chan_txq_idx];
+		else
+			txq = aicwf_txq_vif_get(vif, NX_UNK_TXQ_TYPE);
+	}
+
+	/* Ensure that TXQ is active */
+	if (txq->idx == TXQ_INACTIVE) {
+		netdev_dbg(vif->ndev, "txq inactive\n");
+		return -EBUSY;
+	}
+
+	/*
+	 * Create a SK Buff object that will contain the provided data
+	 */
+	skb = dev_alloc_skb(headroom + frame_len);
+
+	if (!skb)
+		return -ENOMEM;
+
+	/*
+	 * Move skb->data pointer in order to reserve room for aicwf_txhdr
+	 * headroom value will be equal to sizeof(struct aicwf_txhdr)
+	 */
+	skb_reserve(skb, headroom);
+
+	/*
+	 * Extend the buffer data area in order to contain the provided packet
+	 * len value (for skb) will be equal to param->len
+	 */
+	data = skb_put(skb, frame_len);
+	/* Copy the provided data */
+	memcpy(data, buf, frame_len);
+
+	robust = ieee80211_is_robust_mgmt_frame(skb);
+
+	/* Update CSA counter if present */
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	if (unlikely(params->n_csa_offsets) &&
+	    vif->wdev.iftype == NL80211_IFTYPE_AP && vif->ap.csa) {
+		int i;
+
+		data = skb->data;
+		for (i = 0; i < params->n_csa_offsets; i++)
+			data[params->csa_offsets[i]] = vif->ap.csa->count;
+	}
+#endif
+
+	/*
+	 * Go back to the beginning of the allocated data area
+	 * skb->data pointer will move backward
+	 */
+	skb_push(skb, headroom);
+
+	/* Fill the TX Header */
+	txhdr = (struct aicwf_txhdr *)skb->data;
+
+	txhdr->hw_hdr.cfm.status.value = 0;
+
+	/* Fill the SW TX Header */
+	sw_txhdr = kmem_cache_alloc(aicwf_hw->sw_txhdr_cache, GFP_ATOMIC);
+	if (unlikely(!sw_txhdr)) {
+		dev_kfree_skb(skb);
+		return -ENOMEM;
+	}
+	txhdr->sw_hdr = sw_txhdr;
+
+	sw_txhdr->txq = txq;
+	sw_txhdr->frame_len = frame_len;
+	sw_txhdr->cookie = cookie;
+	sw_txhdr->aicwf_sta = sta;
+	sw_txhdr->aicwf_vif = vif;
+	sw_txhdr->skb = skb;
+	sw_txhdr->headroom = headroom;
+#ifdef CONFIG_AICWF_AMSDUS_TX
+	sw_txhdr->amsdu.len = 0;
+	sw_txhdr->amsdu.nb = 0;
+#endif
+
+	/* Fill the Descriptor to be provided to the MAC SW */
+	desc = &sw_txhdr->desc;
+
+	desc->host.ethertype = 0;
+	desc->host.staid = (sta) ? sta->sta_idx : 0xFF;
+	desc->host.vif_idx = vif->vif_index;
+	desc->host.tid = 0xFF;
+	desc->host.flags = TXU_CNTRL_MGMT;
+	if (robust)
+		desc->host.flags |= TXU_CNTRL_MGMT_ROBUST;
+
+#ifdef CONFIG_AICWF_SPLIT_TX_BUF
+	desc->host.packet_len[0] = frame_len;
+#else
+	desc->host.packet_len = frame_len;
+#endif
+
+	if (no_cck)
+		desc->host.flags |= TXU_CNTRL_MGMT_NO_CCK;
+
+	/* Get DMA Address */
+	if (unlikely(aicwf_prep_tx(aicwf_hw, txhdr))) {
+		kmem_cache_free(aicwf_hw->sw_txhdr_cache, sw_txhdr);
+		dev_kfree_skb(skb);
+		return -EBUSY;
+	}
+
+	spin_lock_bh(&aicwf_hw->tx_lock);
+	if (aicwf_txq_queue_skb(skb, txq, aicwf_hw, false))
+		aicwf_hwq_process(aicwf_hw, txq->hwq);
+	spin_unlock_bh(&aicwf_hw->tx_lock);
+
+	return 0;
+}
+
+/**
+ * aicwf_txdatacfm - FW callback for TX confirmation
+ * @pthis: Main driver data
+ * @host_id: Socket buffer associated with the confirmation
+ *
+ * Context: Called with the TX lock held.
+ * Return: 0 when the confirmation was handled, or a negative error code.
+ */
+int aicwf_txdatacfm(void *pthis, void *host_id)
+{
+	struct aicwf_hw *aicwf_hw = (struct aicwf_hw *)pthis;
+	struct sk_buff *skb = host_id;
+	struct aicwf_txhdr *txhdr;
+	union aicwf_hw_txstatus aicwf_txst;
+	struct aicwf_sw_txhdr *sw_txhdr;
+	struct aicwf_hwq *hwq;
+	struct aicwf_txq *txq;
+	int headroom;
+
+	txhdr = (struct aicwf_txhdr *)skb->data;
+	sw_txhdr = txhdr->sw_hdr;
+
+	/* Read status in the TX control header */
+	aicwf_txst = txhdr->hw_hdr.cfm.status;
+
+	/* Check status in the header. If status is null, it means that the buffer
+	 * was not transmitted and we have to return immediately
+	 */
+	if (aicwf_txst.value == 0)
+		return -1;
+
+	if (aicwf_hw->sdiodev->bus_if->state == BUS_DOWN_ST) {
+		headroom = sw_txhdr->headroom;
+		kmem_cache_free(aicwf_hw->sw_txhdr_cache, sw_txhdr);
+		skb_pull(skb, headroom);
+		consume_skb(skb);
+		return 0;
+	}
+
+	txq = sw_txhdr->txq;
+	/* don't use txq->hwq as it may have changed between push and confirm */
+	hwq = &aicwf_hw->hwq[sw_txhdr->hw_queue];
+	aicwf_txq_confirm_any(aicwf_hw, txq, hwq, sw_txhdr);
+
+	/* Update txq and HW queue credits */
+	if (sw_txhdr->desc.host.flags & TXU_CNTRL_MGMT) {
+		pr_debug("done=%d retry_required=%d sw_retry_required=%d acknowledged=%d\n",
+			 aicwf_txst.tx_done, aicwf_txst.retry_required,
+			 aicwf_txst.sw_retry_required, aicwf_txst.acknowledged);
+#ifdef AIC8800_CREATE_TRACE_POINTS
+		trace_mgmt_cfm(sw_txhdr->aicwf_vif->vif_index,
+			       (sw_txhdr->aicwf_sta) ? sw_txhdr->aicwf_sta->sta_idx : 0xFF,
+			       aicwf_txst.acknowledged);
+#endif
+		/* Confirm transmission to CFG80211 */
+		cfg80211_mgmt_tx_status(&sw_txhdr->aicwf_vif->wdev, sw_txhdr->cookie,
+					(skb->data + sw_txhdr->headroom),
+					sw_txhdr->frame_len, aicwf_txst.acknowledged,
+					GFP_ATOMIC);
+	} else if ((txq->idx != TXQ_INACTIVE) &&
+			   (aicwf_txst.retry_required || aicwf_txst.sw_retry_required)) {
+		bool sw_retry = (aicwf_txst.sw_retry_required) ? true : false;
+
+		/* Reset the status */
+		txhdr->hw_hdr.cfm.status.value = 0;
+
+		/* The confirmed packet was part of an AMPDU and not acked
+		 * correctly, so reinject it in the TX path to be retried
+		 */
+		aicwf_tx_retry(aicwf_hw, skb, txhdr, sw_retry);
+		return 0;
+	}
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_skb_confirm(skb, txq, hwq, &txhdr->hw_hdr.cfm);
+#endif
+	/* STA may have disconnect (and txq stopped) when buffers were stored
+	 * in fw. In this case do nothing when they're returned
+	 */
+	if (txq->idx != TXQ_INACTIVE) {
+		/* continue service period */
+		if (unlikely(txq->push_limit && !aicwf_txq_is_full(txq)))
+			aicwf_txq_add_to_hw_list(txq);
+	}
+
+	if (txhdr->hw_hdr.cfm.ampdu_size)
+		aicwf_hw->stats.ampdus_tx[txhdr->hw_hdr.cfm.ampdu_size - 1]++;
+
+#ifdef CONFIG_AICWF_AMSDUS_TX
+	txq->amsdu_len = txhdr->hw_hdr.cfm.amsdu_size;
+#endif
+
+	/* Update statistics */
+	sw_txhdr->aicwf_vif->net_stats.tx_packets++;
+	sw_txhdr->aicwf_vif->net_stats.tx_bytes += sw_txhdr->frame_len;
+
+	/* Release SKBs */
+#ifdef CONFIG_AICWF_AMSDUS_TX
+	if (sw_txhdr->desc.host.flags & TXU_CNTRL_AMSDU) {
+		struct aicwf_amsdu_txhdr *amsdu_txhdr;
+
+		list_for_each_entry(amsdu_txhdr, &sw_txhdr->amsdu.hdrs, list) {
+			aicwf_amsdu_del_subframe_header(amsdu_txhdr);
+			consume_skb(amsdu_txhdr->skb);
+		}
+	}
+#endif /* CONFIG_AICWF_AMSDUS_TX */
+
+	headroom = sw_txhdr->headroom;
+	kmem_cache_free(aicwf_hw->sw_txhdr_cache, sw_txhdr);
+	skb_pull(skb, headroom);
+	consume_skb(skb);
+
+	return 0;
+}
+
+/**
+ * aicwf_txq_credit_update - Update credit for one txq
+ *
+ * @aicwf_hw: Driver main data
+ * @sta_idx: STA idx
+ * @tid: TID
+ * @update: offset to apply in txq credits
+ *
+ * Called when fw send ME_TX_CREDITS_UPDATE_IND message.
+ * Apply @update to txq credits, and stop/start the txq if needed
+ */
+void aicwf_txq_credit_update(struct aicwf_hw *aicwf_hw, int sta_idx, u8 tid,
+			     s8 update)
+{
+	struct aicwf_sta *sta = &aicwf_hw->sta_table[sta_idx];
+	struct aicwf_txq *txq;
+
+	txq = aicwf_txq_sta_get(sta, tid, aicwf_hw);
+
+	spin_lock_bh(&aicwf_hw->tx_lock);
+
+	if (txq->idx != TXQ_INACTIVE) {
+#ifdef AIC8800_CREATE_TRACE_POINTS
+		trace_credit_update(txq, update);
+#endif
+		if (txq->credits <= 0)
+			aicwf_txq_stop(txq, AICWF_TXQ_STOP_FULL);
+		else
+			aicwf_txq_start(txq, AICWF_TXQ_STOP_FULL);
+	}
+
+	spin_unlock_bh(&aicwf_hw->tx_lock);
+}
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq.c b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq.c
new file mode 100644
index 000000000000..5b56aa9501ad
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq.c
@@ -0,0 +1,1368 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ ****************************************************************************************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @file aicwf_txq.c
+ *
+ * @brief tx queue function
+ *
+ ****************************************************************************************
+ */
+
+#include "aicwf_defs.h"
+#include "aicwf_events.h"
+#include "aicwf_tx.h"
+
+/******************************************************************************
+ * Utils functions
+ *****************************************************************************/
+#ifdef CONFIG_AICWF_FULLMAC
+const int nx_tid_prio[NX_NB_TID_PER_STA] = {7, 6, 5, 4, 3, 0, 2, 1};
+
+static inline int aicwf_txq_sta_idx(struct aicwf_hw *aicwf_hw,
+				    struct aicwf_sta *sta, u8 tid)
+{
+	if (is_multicast_sta(aicwf_hw, sta->sta_idx)) {
+		if (aicwf_hw->chip_ops->is_old_ic)
+			return NX_FIRST_VIF_TXQ_IDX_FOR_OLD_IC + sta->vif_idx;
+
+		return NX_FIRST_VIF_TXQ_IDX + sta->vif_idx;
+	}
+
+	return (sta->sta_idx * NX_NB_TXQ_PER_STA) + tid;
+}
+
+static inline int aicwf_txq_vif_idx(struct aicwf_vif *vif, u8 type)
+{
+	if (vif->aicwf_hw->chip_ops->is_old_ic)
+		return NX_FIRST_VIF_TXQ_IDX_FOR_OLD_IC + master_vif_idx(vif) +
+		       (type * NX_VIRT_DEV_MAX);
+
+	return NX_FIRST_VIF_TXQ_IDX + master_vif_idx(vif) +
+	       (type * NX_VIRT_DEV_MAX);
+}
+
+struct aicwf_txq *aicwf_txq_sta_get(struct aicwf_sta *sta, u8 tid,
+				    struct aicwf_hw *aicwf_hw)
+{
+	if (tid >= NX_NB_TXQ_PER_STA)
+		tid = 0;
+
+	return &aicwf_hw->txq[aicwf_txq_sta_idx(aicwf_hw, sta, tid)];
+}
+
+struct aicwf_txq *aicwf_txq_vif_get(struct aicwf_vif *vif, u8 type)
+{
+	if (type > NX_UNK_TXQ_TYPE)
+		type = NX_BCMC_TXQ_TYPE;
+
+	return &vif->aicwf_hw->txq[aicwf_txq_vif_idx(vif, type)];
+}
+
+static inline struct aicwf_sta *aicwf_txq_2_sta(struct aicwf_txq *txq)
+{
+	return txq->sta;
+}
+
+#endif /* CONFIG_AICWF_FULLMAC */
+
+/******************************************************************************
+ * Init/Deinit functions
+ *****************************************************************************/
+/*
+ * aicwf_txq_init - Initialize a TX queue
+ *
+ * @txq: TX queue to be initialized
+ * @idx: TX queue index
+ * @status: TX queue initial status
+ * @hwq: Associated HW queue
+ * @ndev: Net device this queue belongs to
+ *        (may be null for non netdev txq)
+ *
+ * Each queue is initialized with the credit of @NX_TXQ_INITIAL_CREDITS.
+ */
+static void aicwf_txq_init(struct aicwf_hw *aicwf_hw, struct aicwf_txq *txq,
+			   int idx, u8 status,
+			   struct aicwf_hwq *hwq, int tid,
+#ifdef CONFIG_AICWF_FULLMAC
+			   struct aicwf_sta *sta, struct net_device *ndev
+#endif
+			  )
+{
+	int i;
+	int nx_first_unk_txq_idx = NX_FIRST_UNK_TXQ_IDX;
+	int nx_bcmc_txq_ndev_idx = NX_BCMC_TXQ_NDEV_IDX;
+	int nx_first_vif_txq_idx = NX_FIRST_VIF_TXQ_IDX;
+
+	if (aicwf_hw->chip_ops->is_old_ic) {
+		nx_first_unk_txq_idx = NX_FIRST_UNK_TXQ_IDX_FOR_OLD_IC;
+		nx_bcmc_txq_ndev_idx = NX_BCMC_TXQ_NDEV_IDX_FOR_OLD_IC;
+		nx_first_vif_txq_idx = NX_FIRST_VIF_TXQ_IDX_FOR_OLD_IC;
+	}
+
+	txq->idx = idx;
+	txq->status = status;
+	txq->credits = NX_TXQ_INITIAL_CREDITS;
+	txq->pkt_sent = 0;
+	skb_queue_head_init(&txq->sk_list);
+	txq->last_retry_skb = NULL;
+	txq->nb_retry = 0;
+	txq->hwq = hwq;
+	txq->sta = sta;
+	for (i = 0; i < NX_USER_MAX; i++)
+		txq->pkt_pushed[i] = 0;
+	txq->push_limit = 0;
+	txq->tid = tid;
+#ifdef CONFIG_MAC80211_TXQ
+	txq->nb_ready_mac80211 = 0;
+#endif
+#ifdef CONFIG_AICWF_FULLMAC
+	txq->ps_id = LEGACY_PS_ID;
+	if (idx < nx_first_vif_txq_idx) {
+		int sta_idx = sta->sta_idx;
+		int tid = idx - (sta_idx * NX_NB_TXQ_PER_STA);
+
+		if (tid < NX_NB_TID_PER_STA)
+			txq->ndev_idx = NX_STA_NDEV_IDX(tid, sta_idx);
+		else
+			txq->ndev_idx = NDEV_NO_TXQ;
+	} else if (idx < nx_first_unk_txq_idx) {
+		txq->ndev_idx = nx_bcmc_txq_ndev_idx;
+	} else {
+		txq->ndev_idx = NDEV_NO_TXQ;
+	}
+	txq->ndev = ndev;
+#ifdef CONFIG_AICWF_AMSDUS_TX
+	txq->amsdu = NULL;
+	txq->amsdu_len = 0;
+#endif /* CONFIG_AICWF_AMSDUS_TX */
+#endif /* CONFIG_AICWF_FULLMAC */
+}
+
+/**
+ * aicwf_txq_flush - Flush all buffers queued for a TXQ
+ *
+ * @aicwf_hw: main driver data
+ * @txq: txq to flush
+ */
+void aicwf_txq_flush(struct aicwf_hw *aicwf_hw, struct aicwf_txq *txq)
+{
+	struct sk_buff *skb;
+
+	while ((skb = skb_dequeue(&txq->sk_list)) != NULL) {
+		struct aicwf_sw_txhdr *sw_txhdr =
+			((struct aicwf_txhdr *)skb->data)->sw_hdr;
+
+#ifdef CONFIG_AICWF_AMSDUS_TX
+		if (sw_txhdr->desc.host.packet_cnt > 1) {
+			struct aicwf_amsdu_txhdr *amsdu_txhdr;
+
+			list_for_each_entry(amsdu_txhdr, &sw_txhdr->amsdu.hdrs, list) {
+				dev_kfree_skb_any(amsdu_txhdr->skb);
+			}
+		}
+#endif
+		kmem_cache_free(aicwf_hw->sw_txhdr_cache, sw_txhdr);
+
+#ifdef CONFIG_AICWF_FULLMAC
+		dev_kfree_skb_any(skb);
+#endif /* CONFIG_AICWF_FULLMAC */
+	}
+}
+
+/**
+ * aicwf_txq_deinit - De-initialize a TX queue
+ *
+ * @aicwf_hw: Driver main data
+ * @txq: TX queue to be de-initialized
+ * Any buffer stuck in a queue will be freed.
+ */
+static void aicwf_txq_deinit(struct aicwf_hw *aicwf_hw, struct aicwf_txq *txq)
+{
+	if (txq->idx == TXQ_INACTIVE)
+		return;
+
+	spin_lock_bh(&aicwf_hw->tx_lock);
+	aicwf_txq_del_from_hw_list(txq);
+	txq->idx = TXQ_INACTIVE;
+	spin_unlock_bh(&aicwf_hw->tx_lock);
+
+	aicwf_txq_flush(aicwf_hw, txq);
+}
+
+/**
+ * aicwf_txq_vif_init - Initialize all TXQ linked to a vif
+ *
+ * @aicwf_hw: main driver data
+ * @aicwf_vif: Pointer on VIF
+ * @status: Initial txq status
+ *
+ * Softmac : 1 VIF TXQ per HWQ
+ *
+ * Fullmac : 1 VIF TXQ for BC/MC
+ *           1 VIF TXQ for MGMT to unknown STA
+ */
+void aicwf_txq_vif_init(struct aicwf_hw *aicwf_hw, struct aicwf_vif *aicwf_vif,
+			u8 status)
+{
+	struct aicwf_txq *txq;
+	int idx;
+
+#ifdef CONFIG_AICWF_FULLMAC
+	txq = aicwf_txq_vif_get(aicwf_vif, NX_BCMC_TXQ_TYPE);
+	idx = aicwf_txq_vif_idx(aicwf_vif, NX_BCMC_TXQ_TYPE);
+	aicwf_txq_init(aicwf_hw, txq, idx, status, &aicwf_hw->hwq[AICWF_HWQ_BE], 0,
+		       &aicwf_hw->sta_table[aicwf_vif->ap.bcmc_index], aicwf_vif->ndev);
+
+	txq = aicwf_txq_vif_get(aicwf_vif, NX_UNK_TXQ_TYPE);
+	idx = aicwf_txq_vif_idx(aicwf_vif, NX_UNK_TXQ_TYPE);
+	aicwf_txq_init(aicwf_hw, txq, idx, status, &aicwf_hw->hwq[AICWF_HWQ_VO], TID_MGT, NULL,
+		       aicwf_vif->ndev);
+
+#endif /* CONFIG_AICWF_FULLMAC */
+}
+
+/**
+ * aicwf_txq_vif_deinit - Deinitialize all TXQ linked to a vif
+ *
+ * @aicwf_hw: main driver data
+ * @aicwf_vif: Pointer on VIF
+ */
+void aicwf_txq_vif_deinit(struct aicwf_hw *aicwf_hw, struct aicwf_vif *aicwf_vif)
+{
+	struct aicwf_txq *txq;
+
+#ifdef CONFIG_AICWF_FULLMAC
+	txq = aicwf_txq_vif_get(aicwf_vif, NX_BCMC_TXQ_TYPE);
+	aicwf_txq_deinit(aicwf_hw, txq);
+
+	txq = aicwf_txq_vif_get(aicwf_vif, NX_UNK_TXQ_TYPE);
+	aicwf_txq_deinit(aicwf_hw, txq);
+
+#endif /* CONFIG_AICWF_FULLMAC */
+}
+
+/**
+ * aicwf_txq_sta_init - Initialize TX queues for a STA
+ *
+ * @aicwf_hw: Main driver data
+ * @aicwf_sta: STA for which tx queues need to be initialized
+ * @status: Initial txq status
+ *
+ * This function initialize all the TXQ associated to a STA.
+ * Softmac : 1 TXQ per TID
+ *
+ * Fullmac : 1 TXQ per TID (limited to 8)
+ *           1 TXQ for MGMT
+ */
+void aicwf_txq_sta_init(struct aicwf_hw *aicwf_hw, struct aicwf_sta *aicwf_sta,
+			u8 status)
+{
+	struct aicwf_txq *txq;
+	int tid, idx;
+
+#ifdef CONFIG_AICWF_FULLMAC
+	struct aicwf_vif *aicwf_vif = aicwf_hw->vif_table[aicwf_sta->vif_idx];
+
+	idx = aicwf_txq_sta_idx(aicwf_hw, aicwf_sta, 0);
+
+#ifdef CONFIG_MAC80211_TXQ
+	for (tid = 0, txq = aicwf_txq_sta_get(aicwf_sta, 0); tid < NX_NB_TXQ_PER_STA;
+	     tid++, txq = aicwf_txq_sta_get(aicwf_sta, tid))
+#elif defined(CONFIG_AICWF_FULLMAC)
+	for (tid = 0, txq = aicwf_txq_sta_get(aicwf_sta, 0, aicwf_hw);
+	     tid < (is_multicast_sta(aicwf_hw, aicwf_sta->sta_idx) ? 1 : NX_NB_TXQ_PER_STA);
+	     tid++, txq++)
+#endif
+	{
+		aicwf_txq_init(aicwf_hw, txq, idx, status, &aicwf_hw->hwq[aicwf_tid2hwq[tid]], tid,
+			       aicwf_sta, aicwf_vif->ndev);
+		txq->ps_id =
+			aicwf_sta->uapsd_tids & (1 << tid) ? UAPSD_ID : LEGACY_PS_ID;
+		idx++;
+	}
+
+#endif /* CONFIG_AICWF_FULLMAC */
+}
+
+/**
+ * aicwf_txq_sta_deinit - Deinitialize TX queues for a STA
+ *
+ * @aicwf_hw: Main driver data
+ * @aicwf_sta: STA for which tx queues need to be deinitialized
+ */
+void aicwf_txq_sta_deinit(struct aicwf_hw *aicwf_hw, struct aicwf_sta *aicwf_sta)
+{
+	struct aicwf_txq *txq;
+	int tid;
+
+#ifdef CONFIG_MAC80211_TXQ
+	for (tid = 0, txq = aicwf_txq_sta_get(aicwf_sta, 0); tid < NX_NB_TXQ_PER_STA;
+	     tid++, txq = aicwf_txq_sta_get(aicwf_sta, tid))
+#elif defined(CONFIG_AICWF_FULLMAC)
+	for (tid = 0, txq = aicwf_txq_sta_get(aicwf_sta, 0, aicwf_hw);
+	     tid < (is_multicast_sta(aicwf_hw, aicwf_sta->sta_idx) ? 1 : NX_NB_TXQ_PER_STA);
+	     tid++, txq++)
+#endif
+	{
+		aicwf_txq_deinit(aicwf_hw, txq);
+	}
+}
+
+#ifdef CONFIG_AICWF_FULLMAC
+/**
+ * aicwf_txq_unk_vif_init - Initialize TXQ for unknown STA linked to a vif
+ *
+ * @aicwf_vif: Pointer on VIF
+ */
+void aicwf_txq_unk_vif_init(struct aicwf_vif *aicwf_vif)
+{
+	struct aicwf_hw *aicwf_hw = aicwf_vif->aicwf_hw;
+	struct aicwf_txq *txq;
+	int idx;
+
+	txq = aicwf_txq_vif_get(aicwf_vif, NX_UNK_TXQ_TYPE);
+	idx = aicwf_txq_vif_idx(aicwf_vif, NX_UNK_TXQ_TYPE);
+	aicwf_txq_init(aicwf_hw, txq, idx, 0, &aicwf_hw->hwq[AICWF_HWQ_VO], TID_MGT, NULL,
+		       aicwf_vif->ndev);
+}
+
+/**
+ * aicwf_txq_unk_vif_deinit - Deinitialize the unknown-STA TX queue for a VIF
+ *
+ * @aicwf_vif: VIF that owns the queue
+ */
+void aicwf_txq_unk_vif_deinit(struct aicwf_vif *aicwf_vif)
+{
+	struct aicwf_txq *txq;
+
+	txq = aicwf_txq_vif_get(aicwf_vif, NX_UNK_TXQ_TYPE);
+	aicwf_txq_deinit(aicwf_vif->aicwf_hw, txq);
+}
+
+/**
+ * aicwf_txq_offchan_init - Initialize the off-channel TX queue
+ *
+ * @aicwf_vif: VIF that owns the queue
+ *
+ * The off-channel queue is active only for the duration of remain-on-channel.
+ */
+void aicwf_txq_offchan_init(struct aicwf_vif *aicwf_vif)
+{
+	struct aicwf_hw *aicwf_hw = aicwf_vif->aicwf_hw;
+	struct aicwf_txq *txq;
+	int nx_off_chan_txq_idx = NX_OFF_CHAN_TXQ_IDX;
+
+	if (aicwf_hw->chip_ops->is_old_ic)
+		nx_off_chan_txq_idx = NX_OFF_CHAN_TXQ_IDX_FOR_OLD_IC;
+
+	txq = &aicwf_hw->txq[nx_off_chan_txq_idx];
+	aicwf_txq_init(aicwf_hw, txq, nx_off_chan_txq_idx, AICWF_TXQ_STOP_CHAN,
+		       &aicwf_hw->hwq[AICWF_HWQ_VO], TID_MGT, NULL, aicwf_vif->ndev);
+}
+
+/**
+ * aicwf_txq_offchan_deinit - Deinitialize the off-channel TX queue
+ *
+ * @aicwf_vif: Interface that owns the queue
+ *
+ * Any buffer remaining in the queue is freed.
+ */
+void aicwf_txq_offchan_deinit(struct aicwf_vif *aicwf_vif)
+{
+	struct aicwf_txq *txq;
+
+	int nx_off_chan_txq_idx = NX_OFF_CHAN_TXQ_IDX;
+
+	if (aicwf_vif->aicwf_hw->chip_ops->is_old_ic)
+		nx_off_chan_txq_idx = NX_OFF_CHAN_TXQ_IDX_FOR_OLD_IC;
+
+	txq = &aicwf_vif->aicwf_hw->txq[nx_off_chan_txq_idx];
+	aicwf_txq_deinit(aicwf_vif->aicwf_hw, txq);
+}
+
+/**
+ * aicwf_txq_tdls_vif_init - Initialize TXQ vif for TDLS
+ *
+ * @aicwf_vif: Pointer on VIF
+ */
+void aicwf_txq_tdls_vif_init(struct aicwf_vif *aicwf_vif)
+{
+	struct aicwf_hw *aicwf_hw = aicwf_vif->aicwf_hw;
+
+	if (!(aicwf_hw->wiphy->flags & WIPHY_FLAG_SUPPORTS_TDLS))
+		return;
+
+	aicwf_txq_unk_vif_init(aicwf_vif);
+}
+
+/**
+ * aicwf_txq_tdls_vif_deinit - Deinitialize TXQ vif for TDLS
+ *
+ * @aicwf_vif: Pointer on VIF
+ */
+void aicwf_txq_tdls_vif_deinit(struct aicwf_vif *aicwf_vif)
+{
+	struct aicwf_hw *aicwf_hw = aicwf_vif->aicwf_hw;
+
+	if (!(aicwf_hw->wiphy->flags & WIPHY_FLAG_SUPPORTS_TDLS))
+		return;
+
+	aicwf_txq_unk_vif_deinit(aicwf_vif);
+}
+#endif
+
+/******************************************************************************
+ * Start/Stop functions
+ *****************************************************************************/
+/**
+ * aicwf_txq_add_to_hw_list - Add TX queue to a HW queue schedule list.
+ *
+ * @txq: TX queue to add
+ *
+ * Add the TX queue if not already present in the HW queue list.
+ * To be called with tx_lock hold
+ */
+void aicwf_txq_add_to_hw_list(struct aicwf_txq *txq)
+{
+	if (!(txq->status & AICWF_TXQ_IN_HWQ_LIST)) {
+#ifdef AIC8800_CREATE_TRACE_POINTS
+		trace_txq_add_to_hw(txq);
+#endif
+		txq->status |= AICWF_TXQ_IN_HWQ_LIST;
+		list_add_tail(&txq->sched_list, &txq->hwq->list);
+		txq->hwq->need_processing = true;
+	}
+}
+
+/**
+ * aicwf_txq_del_from_hw_list - Delete TX queue from a HW queue schedule list.
+ *
+ * @txq: TX queue to delete
+ *
+ * Remove the TX queue from the HW queue list if present.
+ * To be called with tx_lock hold
+ */
+void aicwf_txq_del_from_hw_list(struct aicwf_txq *txq)
+{
+	if (txq->status & AICWF_TXQ_IN_HWQ_LIST) {
+#ifdef AIC8800_CREATE_TRACE_POINTS
+		trace_txq_del_from_hw(txq);
+#endif
+		txq->status &= ~AICWF_TXQ_IN_HWQ_LIST;
+		list_del(&txq->sched_list);
+	}
+}
+
+/**
+ * aicwf_txq_skb_ready - Check if skb are available for the txq
+ *
+ * @txq: Pointer on txq
+ * Return: %true if buffers are ready to be pushed, otherwise %false.
+ */
+static inline bool aicwf_txq_skb_ready(struct aicwf_txq *txq)
+{
+#ifdef CONFIG_MAC80211_TXQ
+	if (txq->nb_ready_mac80211 != NOT_MAC80211_TXQ)
+		return ((txq->nb_ready_mac80211 > 0) ||
+			!skb_queue_empty(&txq->sk_list));
+	else
+#endif
+		return !skb_queue_empty(&txq->sk_list);
+}
+
+/**
+ * aicwf_txq_start - Try to Start one TX queue
+ *
+ * @txq: TX queue to start
+ * @reason: reason why the TX queue is started (among AICWF_TXQ_STOP_xxx)
+ *
+ * Re-start the TX queue for one reason.
+ * If after this the txq is no longer stopped and some buffers are ready,
+ * the TX queue is also added to HW queue list.
+ * To be called with tx_lock hold
+ */
+void aicwf_txq_start(struct aicwf_txq *txq, u16 reason)
+{
+	WARN_ON_ONCE(!txq);
+	if (txq->idx != TXQ_INACTIVE && (txq->status & reason)) {
+#ifdef AIC8800_CREATE_TRACE_POINTS
+		trace_txq_start(txq, reason);
+#endif
+		txq->status &= ~reason;
+		if (!aicwf_txq_is_stopped(txq) && aicwf_txq_skb_ready(txq))
+			aicwf_txq_add_to_hw_list(txq);
+	}
+}
+
+/**
+ * aicwf_txq_stop - Stop one TX queue
+ *
+ * @txq: TX queue to stop
+ * @reason: reason why the TX queue is stopped (among AICWF_TXQ_STOP_xxx)
+ *
+ * Stop the TX queue. It will remove the TX queue from HW queue list
+ * To be called with tx_lock hold
+ */
+void aicwf_txq_stop(struct aicwf_txq *txq, u16 reason)
+{
+	WARN_ON_ONCE(!txq);
+	if (txq->idx != TXQ_INACTIVE) {
+#ifdef AIC8800_CREATE_TRACE_POINTS
+		trace_txq_stop(txq, reason);
+#endif
+		txq->status |= reason;
+		aicwf_txq_del_from_hw_list(txq);
+	}
+}
+
+/**
+ * aicwf_txq_sta_start - Start all TX queues linked to a STA
+ *
+ * @aicwf_sta: STA whose TX queues must be re-started
+ * @reason: Stop-reason bits to clear
+ * @aicwf_hw: Driver main data
+ *
+ * Restart all the TX queues of the STA for the specified reason:
+ * - AICWF_TXQ_STOP_STA_PS: the STA is no longer in power save mode
+ * - AICWF_TXQ_STOP_VIF_PS: the VIF is in power save mode (p2p absence)
+ * - AICWF_TXQ_STOP_CHAN: the STA's VIF is now on the current active channel
+ *
+ * A queue with a ready buffer and no other stop reason is added to its hardware
+ * queue list.
+ *
+ * Context: Called with the TX lock held.
+ */
+void aicwf_txq_sta_start(struct aicwf_sta *aicwf_sta, u16 reason
+#ifdef CONFIG_AICWF_FULLMAC
+						,
+						struct aicwf_hw *aicwf_hw
+#endif
+)
+{
+	struct aicwf_txq *txq;
+	int tid;
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_txq_sta_start(aicwf_sta->sta_idx);
+#endif
+#ifdef CONFIG_MAC80211_TXQ
+	for (tid = 0, txq = aicwf_txq_sta_get(aicwf_sta, 0); tid < NX_NB_TXQ_PER_STA;
+	     tid++, txq = aicwf_txq_sta_get(aicwf_sta, tid))
+#elif defined(CONFIG_AICWF_FULLMAC)
+	for (tid = 0, txq = aicwf_txq_sta_get(aicwf_sta, 0, aicwf_hw);
+	     tid < (is_multicast_sta(aicwf_hw, aicwf_sta->sta_idx) ? 1 : NX_NB_TXQ_PER_STA);
+	     tid++, txq++)
+#endif
+	{
+		aicwf_txq_start(txq, reason);
+	}
+}
+
+/**
+ * aicwf_txq_sta_stop - Stop all TX queues linked to a STA
+ *
+ * @aicwf_sta: STA whose TX queues must be stopped
+ * @reason: Stop-reason bits to set
+ * @aicwf_hw: Driver main data
+ *
+ * Stop all the TX queues of the STA for the specified reason:
+ * - AICWF_TXQ_STOP_STA_PS: the STA is in power save mode
+ * - AICWF_TXQ_STOP_VIF_PS: the VIF is in power save mode (p2p absence)
+ * - AICWF_TXQ_STOP_CHAN: the STA's VIF is not on the current active channel
+ *
+ * Affected queues are removed from their hardware queue lists.
+ *
+ * Context: Called with the TX lock held.
+ */
+void aicwf_txq_sta_stop(struct aicwf_sta *aicwf_sta, u16 reason
+#ifdef CONFIG_AICWF_FULLMAC
+					   ,
+					   struct aicwf_hw *aicwf_hw
+#endif
+)
+{
+	struct aicwf_txq *txq;
+	int tid;
+
+	if (!aicwf_sta)
+		return;
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_txq_sta_stop(aicwf_sta->sta_idx);
+#endif
+#ifdef CONFIG_MAC80211_TXQ
+	for (tid = 0, txq = aicwf_txq_sta_get(aicwf_sta, 0); tid < NX_NB_TXQ_PER_STA;
+	     tid++, txq = aicwf_txq_sta_get(aicwf_sta, tid))
+#elif defined(CONFIG_AICWF_FULLMAC)
+	for (tid = 0, txq = aicwf_txq_sta_get(aicwf_sta, 0, aicwf_hw);
+	     tid < (is_multicast_sta(aicwf_hw, aicwf_sta->sta_idx) ? 1 : NX_NB_TXQ_PER_STA);
+	     tid++, txq++)
+#endif
+	{
+		aicwf_txq_stop(txq, reason);
+	}
+}
+
+#ifdef CONFIG_AICWF_FULLMAC
+void aicwf_txq_tdls_sta_start(struct aicwf_vif *aicwf_vif, u16 reason,
+			      struct aicwf_hw *aicwf_hw)
+{
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_txq_vif_start(aicwf_vif->vif_index);
+#endif
+	spin_lock_bh(&aicwf_hw->tx_lock);
+
+	if (aicwf_vif->sta.tdls_sta)
+		aicwf_txq_sta_start(aicwf_vif->sta.tdls_sta, reason, aicwf_hw);
+
+	spin_unlock_bh(&aicwf_hw->tx_lock);
+}
+#endif
+
+#ifdef CONFIG_AICWF_FULLMAC
+void aicwf_txq_tdls_sta_stop(struct aicwf_vif *aicwf_vif, u16 reason,
+			     struct aicwf_hw *aicwf_hw)
+{
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_txq_vif_stop(aicwf_vif->vif_index);
+#endif
+	spin_lock_bh(&aicwf_hw->tx_lock);
+
+	if (aicwf_vif->sta.tdls_sta)
+		aicwf_txq_sta_stop(aicwf_vif->sta.tdls_sta, reason, aicwf_hw);
+
+	spin_unlock_bh(&aicwf_hw->tx_lock);
+}
+#endif
+
+#ifdef CONFIG_AICWF_FULLMAC
+static inline void
+aicwf_txq_vif_for_each_sta(struct aicwf_hw *aicwf_hw, struct aicwf_vif *aicwf_vif,
+			   void (*f)(struct aicwf_sta *, u16, struct aicwf_hw *),
+			   u16 reason) {
+	switch (AICWF_VIF_TYPE(aicwf_vif)) {
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	case NL80211_IFTYPE_P2P_CLIENT:
+#endif
+	case NL80211_IFTYPE_STATION: {
+		if (aicwf_vif->tdls_status == TDLS_LINK_ACTIVE)
+			f(aicwf_vif->sta.tdls_sta, reason, aicwf_hw);
+		if (!WARN_ON(!aicwf_vif->sta.ap))
+			f(aicwf_vif->sta.ap, reason, aicwf_hw);
+		break;
+	}
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	case NL80211_IFTYPE_AP_VLAN:
+		aicwf_vif = aicwf_vif->ap_vlan.master;
+		fallthrough;
+	case NL80211_IFTYPE_AP:
+	case NL80211_IFTYPE_MESH_POINT:
+	case NL80211_IFTYPE_P2P_GO: {
+		struct aicwf_sta *sta;
+
+		list_for_each_entry(sta, &aicwf_vif->ap.sta_list, list) {
+			f(sta, reason, aicwf_hw);
+		}
+		break;
+	}
+#endif
+	default:
+		//WARN_ON_ONCE();
+		break;
+	}
+}
+#endif
+
+/**
+ * aicwf_txq_vif_start - Start the TX queues associated with a VIF
+ *
+ * @aicwf_vif: VIF whose queues should be started
+ * @reason: Stop-reason bits to clear
+ * @aicwf_hw: Driver main data
+ *
+ * Iterate over all STAs associated with the VIF and restart their queues for
+ * @reason. This function takes the TX lock.
+ */
+void aicwf_txq_vif_start(struct aicwf_vif *aicwf_vif, u16 reason,
+			 struct aicwf_hw *aicwf_hw)
+{
+	struct aicwf_txq *txq;
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_txq_vif_start(aicwf_vif->vif_index);
+#endif
+	spin_lock_bh(&aicwf_hw->tx_lock);
+
+#ifdef CONFIG_AICWF_FULLMAC
+	// Reject if monitor interface
+	if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_MONITOR)
+		goto end;
+
+	if (aicwf_vif->roc_tdls && aicwf_vif->sta.tdls_sta &&
+	    aicwf_vif->sta.tdls_sta->tdls.chsw_en) {
+		aicwf_txq_sta_start(aicwf_vif->sta.tdls_sta, reason, aicwf_hw);
+	}
+	if (!aicwf_vif->roc_tdls) {
+		aicwf_txq_vif_for_each_sta(aicwf_hw, aicwf_vif, aicwf_txq_sta_start,
+					   reason);
+	}
+
+	txq = aicwf_txq_vif_get(aicwf_vif, NX_BCMC_TXQ_TYPE);
+	aicwf_txq_start(txq, reason);
+	txq = aicwf_txq_vif_get(aicwf_vif, NX_UNK_TXQ_TYPE);
+	aicwf_txq_start(txq, reason);
+
+end:
+#endif /* CONFIG_AICWF_FULLMAC */
+
+	spin_unlock_bh(&aicwf_hw->tx_lock);
+}
+
+/**
+ * aicwf_txq_vif_stop - Stop the TX queues associated with a VIF
+ *
+ * @aicwf_vif: VIF whose queues should be stopped
+ * @reason: Stop-reason bits to set
+ * @aicwf_hw: Driver main data
+ *
+ * Iterate over all STAs associated with the VIF and stop their queues for
+ * @reason. This function takes the TX lock.
+ */
+void aicwf_txq_vif_stop(struct aicwf_vif *aicwf_vif, u16 reason,
+			struct aicwf_hw *aicwf_hw)
+{
+	struct aicwf_txq *txq;
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_txq_vif_stop(aicwf_vif->vif_index);
+#endif
+	spin_lock_bh(&aicwf_hw->tx_lock);
+
+#ifdef CONFIG_AICWF_FULLMAC
+	// Reject if monitor interface
+	if (aicwf_vif->wdev.iftype == NL80211_IFTYPE_MONITOR)
+		goto end;
+
+	aicwf_txq_vif_for_each_sta(aicwf_hw, aicwf_vif, aicwf_txq_sta_stop, reason);
+
+	txq = aicwf_txq_vif_get(aicwf_vif, NX_BCMC_TXQ_TYPE);
+	aicwf_txq_stop(txq, reason);
+	txq = aicwf_txq_vif_get(aicwf_vif, NX_UNK_TXQ_TYPE);
+	aicwf_txq_stop(txq, reason);
+
+end:
+#endif /* CONFIG_AICWF_FULLMAC */
+
+	spin_unlock_bh(&aicwf_hw->tx_lock);
+}
+
+#ifdef CONFIG_AICWF_FULLMAC
+
+/**
+ * aicwf_txq_offchan_start - Start the TX queue for off-channel frames
+ *
+ * @aicwf_hw: Driver main data
+ */
+void aicwf_txq_offchan_start(struct aicwf_hw *aicwf_hw)
+{
+	struct aicwf_txq *txq;
+	int nx_off_chan_txq_idx = NX_OFF_CHAN_TXQ_IDX;
+
+	if (aicwf_hw->chip_ops->is_old_ic)
+		nx_off_chan_txq_idx = NX_OFF_CHAN_TXQ_IDX_FOR_OLD_IC;
+
+	txq = &aicwf_hw->txq[nx_off_chan_txq_idx];
+	spin_lock_bh(&aicwf_hw->tx_lock);
+	aicwf_txq_start(txq, AICWF_TXQ_STOP_CHAN);
+	spin_unlock_bh(&aicwf_hw->tx_lock);
+}
+
+/**
+ * aicwf_txq_sta_switch_vif - Associate TXQs linked to a STA with a new VIF
+ *
+ * @sta: STA whose TX queues must be switched
+ * @old_vif: VIF currently associated with the STA (may no longer be active)
+ * @new_vif: New VIF to associate with the STA
+ *
+ * This function will switch the vif (i.e. the netdev) associated to all STA's
+ * TX queues. This is used when AP_VLAN interfaces are created or removed.
+ */
+void aicwf_txq_sta_switch_vif(struct aicwf_sta *sta, struct aicwf_vif *old_vif,
+			      struct aicwf_vif *new_vif)
+{
+	struct aicwf_hw *aicwf_hw = new_vif->aicwf_hw;
+	struct aicwf_txq *txq;
+	int i;
+
+	/* start TXQ on the new interface, and update ndev field in txq */
+	if (!netif_carrier_ok(new_vif->ndev))
+		netif_carrier_on(new_vif->ndev);
+	txq = aicwf_txq_sta_get(sta, 0, aicwf_hw);
+	for (i = 0; i < NX_NB_TID_PER_STA; i++, txq++) {
+		txq->ndev = new_vif->ndev;
+		netif_wake_subqueue(txq->ndev, txq->ndev_idx);
+	}
+}
+#endif /* CONFIG_AICWF_FULLMAC */
+
+/******************************************************************************
+ * TXQ queue/schedule functions
+ *****************************************************************************/
+/**
+ * aicwf_txq_queue_skb - Queue a buffer in a TX queue
+ *
+ * @skb: Buffer to queue
+ * @txq: TX Queue in which the buffer must be added
+ * @aicwf_hw: Driver main data
+ * @retry: Should it be queued in the retry list
+ *
+ * @return: Return 1 if txq has been added to hwq list, 0 otherwise
+ *
+ * Add a buffer in the buffer list of the TX queue
+ * and add this TX queue in the HW queue list if the txq is not stopped.
+ * If this is a retry packet it is added after the last retry packet or at the
+ * beginning if there is no retry packet queued.
+ *
+ * If the STA is in PS mode and this is the first packet queued for this txq
+ * update TIM.
+ *
+ * To be called with tx_lock hold
+ */
+int aicwf_txq_queue_skb(struct sk_buff *skb, struct aicwf_txq *txq,
+			struct aicwf_hw *aicwf_hw, bool retry)
+{
+#ifdef CONFIG_AICWF_FULLMAC
+	if (unlikely(txq->sta && txq->sta->ps.active)) {
+		txq->sta->ps.pkt_ready[txq->ps_id]++;
+#ifdef AIC8800_CREATE_TRACE_POINTS
+		trace_ps_queue(txq->sta);
+#endif
+		if (txq->sta->ps.pkt_ready[txq->ps_id] == 1)
+			aicwf_set_traffic_status(aicwf_hw, txq->sta, true, txq->ps_id);
+	}
+#endif
+
+	if (!retry) {
+		/* add buffer in the sk_list */
+		skb_queue_tail(&txq->sk_list, skb);
+	} else {
+		if (txq->last_retry_skb)
+			skb_append(txq->last_retry_skb, skb, &txq->sk_list);
+		else
+			skb_queue_head(&txq->sk_list, skb);
+
+		txq->last_retry_skb = skb;
+		txq->nb_retry++;
+	}
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_txq_queue_skb(skb, txq, retry);
+#endif
+	/* Flowctrl corresponding netdev queue if needed */
+#ifdef CONFIG_AICWF_FULLMAC
+#ifndef CONFIG_AIC8800_ONE_TXQ
+
+#ifdef CONFIG_AIC8800_TX_NETIF_FLOWCTRL
+	if (txq->ndev_idx != NDEV_NO_TXQ &&
+	    ((skb_queue_len(&txq->sk_list) > AICWF_NDEV_FLOW_CTRL_STOP) &&
+	    !aicwf_hw->sdiodev->flowctrl)) {
+#else
+	/* If too many buffer are queued for this TXQ stop netdev queue */
+	if (txq->ndev_idx != NDEV_NO_TXQ &&
+	    (skb_queue_len(&txq->sk_list) > AICWF_NDEV_FLOW_CTRL_STOP)) {
+#endif
+
+		txq->status |= AICWF_TXQ_NDEV_FLOW_CTRL;
+		netif_stop_subqueue(txq->ndev, txq->ndev_idx);
+#ifdef CREATE_TRACE_POINT
+		trace_txq_flowctrl_stop(txq);
+#endif
+	}
+#endif /* CONFIG_AIC8800_ONE_TXQ */
+#else  /* ! CONFIG_AICWF_FULLMAC */
+
+	if (!retry && ++txq->hwq->len == txq->hwq->len_stop) {
+		trace_hwq_flowctrl_stop(txq->hwq->id);
+		ieee80211_stop_queue(aicwf_hw->hw, txq->hwq->id);
+		aicwf_hw->stats.queues_stops++;
+	}
+#endif /* CONFIG_AICWF_FULLMAC */
+
+	/* add it in the hwq list if not stopped and not yet present */
+	if (!aicwf_txq_is_stopped(txq)) {
+		aicwf_txq_add_to_hw_list(txq);
+		return 1;
+	}
+
+	return 0;
+}
+
+/**
+ * aicwf_txq_confirm_any - Process buffer confirmed by fw
+ *
+ * @aicwf_hw: Driver main data
+ * @txq: TX Queue
+ * @hwq: HW Queue
+ * @sw_txhdr: software descriptor of the confirmed packet
+ *
+ * Process a buffer returned by the fw. It doesn't check buffer status
+ * and only does systematic counter update:
+ * - hw credit
+ * - buffer pushed to fw
+ *
+ * To be called with tx_lock hold
+ */
+void aicwf_txq_confirm_any(struct aicwf_hw *aicwf_hw, struct aicwf_txq *txq,
+			   struct aicwf_hwq *hwq, struct aicwf_sw_txhdr *sw_txhdr)
+{
+	int user = 0;
+
+#ifdef CONFIG_AICWF_MUMIMO_TX
+	user = AICWF_MUMIMO_INFO_POS_ID(sw_txhdr->desc.host.mumimo_info);
+
+	if (txq->idx != TXQ_INACTIVE && txq->pkt_pushed[user] == 1 &&
+	    txq->status & AICWF_TXQ_STOP_MU_POS)
+		aicwf_txq_start(txq, AICWF_TXQ_STOP_MU_POS);
+
+#endif /* CONFIG_AICWF_MUMIMO_TX */
+
+	if (txq->pkt_pushed[user])
+		txq->pkt_pushed[user]--;
+
+	hwq->need_processing = true;
+	aicwf_hw->stats.cfm_balance[hwq->id]--;
+}
+
+/******************************************************************************
+ * HWQ processing
+ *****************************************************************************/
+static inline bool aicwf_txq_take_mu_lock(struct aicwf_hw *aicwf_hw)
+{
+	bool res = false;
+#ifdef CONFIG_AICWF_MUMIMO_TX
+	if (aicwf_hw->mod_params->mutx)
+		res = (down_trylock(&aicwf_hw->mu.lock) == 0);
+#endif /* CONFIG_AICWF_MUMIMO_TX */
+	return res;
+}
+
+static inline void aicwf_txq_release_mu_lock(struct aicwf_hw *aicwf_hw)
+{
+#ifdef CONFIG_AICWF_MUMIMO_TX
+	up(&aicwf_hw->mu.lock);
+#endif /* CONFIG_AICWF_MUMIMO_TX */
+}
+
+static inline void aicwf_txq_set_mu_info(struct aicwf_hw *aicwf_hw,
+					 struct aicwf_txq *txq, int group_id,
+					 int pos)
+{
+#ifdef CONFIG_AICWF_MUMIMO_TX
+	trace_txq_select_mu_group(txq, group_id, pos);
+	if (group_id) {
+		txq->mumimo_info = group_id | (pos << 6);
+		aicwf_mu_set_active_group(aicwf_hw, group_id);
+	} else {
+		txq->mumimo_info = 0;
+	}
+#endif /* CONFIG_AICWF_MUMIMO_TX */
+}
+
+static inline s8 aicwf_txq_get_credits(struct aicwf_txq *txq)
+{
+	s8 cred = txq->credits;
+	/*
+	 * if destination is in PS mode, push_limit indicates the maximum
+	 * number of packet that can be pushed on this txq.
+	 */
+	if (txq->push_limit && cred > txq->push_limit)
+		cred = txq->push_limit;
+	return cred;
+}
+
+/**
+ * skb_queue_extract - Extract buffer from skb list
+ *
+ * @list: List of skb to extract from
+ * @head: List of skb to append to
+ * @nb_elt: Number of skb to extract
+ *
+ * extract the first @nb_elt of @list and append them to @head
+ * It is assume that:
+ * - @list contains more that @nb_elt
+ * - There is no need to take @list nor @head lock to modify them
+ */
+static inline void skb_queue_extract(struct sk_buff_head *list,
+				     struct sk_buff_head *head, int nb_elt)
+{
+	int i;
+	struct sk_buff *first, *last, *ptr;
+
+	ptr = list->next;
+	first = ptr;
+	for (i = 0; i < nb_elt; i++)
+		ptr = ptr->next;
+
+	last = ptr->prev;
+
+	/* unlink nb_elt in list */
+	list->qlen -= nb_elt;
+	list->next = ptr;
+	ptr->prev = (struct sk_buff *)list;
+
+	/* append nb_elt at end of head */
+	head->qlen += nb_elt;
+	last->next = (struct sk_buff *)head;
+	head->prev->next = first;
+	first->prev = head->prev;
+	head->prev = last;
+}
+
+#ifdef CONFIG_MAC80211_TXQ
+/**
+ * aicwf_txq_mac80211_dequeue - Dequeue buffer from mac80211 txq and
+ *                             add them to push list
+ *
+ * @aicwf_hw: Main driver data
+ * @sk_list: List of buffer to push (initialized without lock)
+ * @txq: TXQ to dequeue buffers from
+ * @max: Max number of buffer to dequeue
+ *
+ * Dequeue buffer from mac80211 txq, prepare them for transmission and chain
+ * them to the list of buffer to push.
+ *
+ * Return: %true if no buffers remain in the mac80211 TX queue, otherwise
+ * %false.
+ */
+static bool aicwf_txq_mac80211_dequeue(struct aicwf_hw *aicwf_hw,
+				       struct sk_buff_head *sk_list,
+				       struct aicwf_txq *txq, int max)
+{
+	struct ieee80211_txq *mac_txq;
+	struct sk_buff *skb;
+	unsigned long mac_txq_len;
+
+	if (txq->nb_ready_mac80211 == NOT_MAC80211_TXQ)
+		return true;
+
+	mac_txq = container_of((void *)txq, struct ieee80211_txq, drv_priv);
+
+	for (; max > 0; max--) {
+		skb = aicwf_tx_dequeue_prep(aicwf_hw, mac_txq);
+		if (!skb)
+			return true;
+
+		__skb_queue_tail(sk_list, skb);
+	}
+
+	/*
+	 * re-read mac80211 txq current length.
+	 * It is mainly for debug purpose to trace dropped packet. There is no
+	 * problems to have nb_ready_mac80211 != actual mac80211 txq length
+	 */
+	ieee80211_txq_get_depth(mac_txq, &mac_txq_len, NULL);
+	if (txq->nb_ready_mac80211 > mac_txq_len)
+		trace_txq_drop(txq, txq->nb_ready_mac80211 - mac_txq_len);
+	txq->nb_ready_mac80211 = mac_txq_len;
+
+	return (txq->nb_ready_mac80211 == 0);
+}
+#endif
+
+/**
+ * aicwf_txq_get_skb_to_push - Get list of buffer to push for one txq
+ *
+ * @aicwf_hw: main driver data
+ * @hwq: HWQ on wich buffers will be pushed
+ * @txq: TXQ to get buffers from
+ * @user: user position to use
+ * @sk_list_push: list to update
+ *
+ *
+ * This function will returned a list of buffer to push for one txq.
+ * It will take into account the number of credit of the HWQ for this user
+ * position and TXQ (and push_limit).
+ * This allow to get a list that can be pushed without having to test for
+ * hwq/txq status after each push
+ *
+ * If a MU group has been selected for this txq, it will also update the
+ * counter for the group
+ *
+ * Return: %true if the TX queue has no ready buffer after this batch,
+ * otherwise %false.
+ */
+static bool aicwf_txq_get_skb_to_push(struct aicwf_hw *aicwf_hw,
+				      struct aicwf_hwq *hwq, struct aicwf_txq *txq,
+				      int user,
+				      struct sk_buff_head *sk_list_push)
+{
+	int nb_ready = skb_queue_len(&txq->sk_list);
+	int credits = aicwf_txq_get_credits(txq);
+	bool res = false;
+
+	__skb_queue_head_init(sk_list_push);
+
+	if (credits >= nb_ready) {
+		skb_queue_splice_init(&txq->sk_list, sk_list_push);
+#ifdef CONFIG_MAC80211_TXQ
+		res = aicwf_txq_mac80211_dequeue(aicwf_hw, sk_list_push, txq,
+						 credits - nb_ready);
+		credits = skb_queue_len(sk_list_push);
+#else
+		res = true;
+		credits = nb_ready;
+#endif
+	} else {
+		skb_queue_extract(&txq->sk_list, sk_list_push, credits);
+
+		/*
+		 * When processing PS service period (i.e. push_limit != 0), no longer
+		 * process this txq if the buffers extracted will complete the SP for
+		 * this txq
+		 */
+		if (txq->push_limit && credits == txq->push_limit)
+			res = true;
+	}
+
+	aicwf_mu_set_active_sta(aicwf_hw, aicwf_txq_2_sta(txq), credits);
+
+	return res;
+}
+
+/**
+ * aicwf_txq_select_user - Select User queue for a txq
+ *
+ * @aicwf_hw: main driver data
+ * @mu_lock: true is MU lock is taken
+ * @txq: TXQ to select MU group for
+ * @hwq: HWQ for the TXQ
+ * @user: Updated with user position selected
+ *
+ * Return: %true if the TX queue can be processed, otherwise %false.
+ *
+ * This function selects the MU group to use for a TXQ.
+ * The selection is done as follow:
+ *
+ * - return immediately for STA that don't belongs to any group and select
+ *   group 0 / user 0
+ *
+ * - If MU tx is disabled (by user mutx_on, or because mu group are being
+ *   updated !mu_lock), select group 0 / user 0
+ *
+ * - Use the best group selected by @aicwf_mu_group_sta_select.
+ *
+ *   Each time a group is selected (except for the first case where sta
+ *   doesn't belongs to a MU group), the function checks that no buffer is
+ *   pending for this txq on another user position. If this is the case stop
+ *   the txq (AICWF_TXQ_STOP_MU_POS) and return false.
+ *
+ */
+static bool aicwf_txq_select_user(struct aicwf_hw *aicwf_hw, bool mu_lock,
+				  struct aicwf_txq *txq, struct aicwf_hwq *hwq,
+				  int *user)
+{
+	int pos = 0;
+#ifdef CONFIG_AICWF_MUMIMO_TX
+	int id, group_id = 0;
+	struct aicwf_sta *sta = aicwf_txq_2_sta(txq);
+
+	/* for sta that belong to no group return immediately */
+	if (!sta || !sta->group_info.cnt)
+		goto end;
+
+	/* If MU is disabled, need to check user */
+	if (!aicwf_hw->mod_params->mutx_on || !mu_lock)
+		goto check_user;
+
+	/* Use the "best" group selected */
+	group_id = sta->group_info.group;
+
+	if (group_id > 0)
+		pos = aicwf_mu_group_sta_get_pos(aicwf_hw, sta, group_id);
+
+check_user:
+	/* check that we can push on this user position */
+#if NX_USER_MAX == 2
+	id = (pos + 1) & 0x1;
+	if (txq->pkt_pushed[id]) {
+		aicwf_txq_stop(txq, AICWF_TXQ_STOP_MU_POS);
+		return false;
+	}
+
+#else
+	for (id = 0; id < NX_USER_MAX; id++) {
+		if (id != pos && txq->pkt_pushed[id]) {
+			aicwf_txq_stop(txq, AICWF_TXQ_STOP_MU_POS);
+			return false;
+		}
+	}
+#endif
+
+end:
+	aicwf_txq_set_mu_info(aicwf_hw, txq, group_id, pos);
+#endif /* CONFIG_AICWF_MUMIMO_TX */
+
+	*user = pos;
+	return true;
+}
+
+#define ALL_HWQ_MASK ((1 << NX_USER_MAX) - 1)
+
+/**
+ * aicwf_hwq_process - Process one HW queue list
+ *
+ * @aicwf_hw: Driver main data
+ * @hwq: HW queue to process
+ *
+ * Iterate over all TX queues linked to this hardware queue and push as many
+ * buffers as possible. A TX queue on the list has at least one buffer.
+ * - If a TX queue has no buffer, remove it and process the next queue.
+ * - If a TX queue has no credit or reaches its push limit, remove it and
+ *   process the next queue.
+ * - If the hardware queue is full, preserve fair ordering for the next call.
+ *
+ * To be called when HW queue list is modified:
+ * - when a buffer is pushed on a TX queue
+ * - when new credits are received
+ * - when a STA returns from Power Save mode or receives traffic request.
+ * - when Channel context change
+ *
+ * Context: Called with the TX lock held.
+ */
+void aicwf_hwq_process(struct aicwf_hw *aicwf_hw, struct aicwf_hwq *hwq)
+{
+	struct aicwf_txq *txq, *next;
+	int user;
+	bool mu_enable;
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_process_hw_queue(hwq);
+#endif
+	hwq->need_processing = false;
+
+	mu_enable = aicwf_txq_take_mu_lock(aicwf_hw);
+
+	list_for_each_entry_safe(txq, next, &hwq->list, sched_list) {
+		struct aicwf_txhdr *txhdr = NULL;
+		struct sk_buff_head sk_list_push;
+		struct sk_buff *skb;
+		bool txq_empty;
+#ifdef AIC8800_CREATE_TRACE_POINTS
+		trace_process_txq(txq);
+#endif
+		/* sanity check for debug */
+		WARN_ON_ONCE(!(txq->status & AICWF_TXQ_IN_HWQ_LIST));
+		if (txq->idx == TXQ_INACTIVE) {
+			dev_dbg(aicwf_hw->dev, "txq->idx == TXQ_INACTIVE\n");
+			aicwf_txq_del_from_hw_list(txq);
+			aicwf_txq_flush(aicwf_hw, txq);
+			continue;
+		}
+		WARN_ON_ONCE(txq->idx == TXQ_INACTIVE);
+		WARN_ON_ONCE(txq->credits <= 0);
+		WARN_ON_ONCE(!aicwf_txq_skb_ready(txq));
+
+		if (!aicwf_txq_select_user(aicwf_hw, mu_enable, txq, hwq, &user)) {
+			dev_dbg(aicwf_hw->dev, "select user:%d\n", user);
+			continue;
+		}
+
+		txq_empty =
+			aicwf_txq_get_skb_to_push(aicwf_hw, hwq, txq, user, &sk_list_push);
+		while ((skb = __skb_dequeue(&sk_list_push)) != NULL) {
+			txhdr = (struct aicwf_txhdr *)skb->data;
+			aicwf_tx_push(aicwf_hw, txhdr, 0);
+		}
+
+		if (txq_empty) {
+			aicwf_txq_del_from_hw_list(txq);
+			txq->pkt_sent = 0;
+		} else if (aicwf_txq_is_scheduled(txq)) {
+			/* txq not empty,
+			 * To avoid starving need to process other txq in the list
+			 * For better aggregation, need to send "as many consecutive
+			 * pkt as possible" for he same txq
+			 * ==> Add counter to trigger txq switch
+			 */
+			if (txq->pkt_sent > hwq->size) {
+				txq->pkt_sent = 0;
+				list_rotate_left(&hwq->list);
+			}
+		}
+
+#ifdef CONFIG_AICWF_FULLMAC
+		/* Unable to complete PS traffic request because of hwq credit */
+		if (txq->push_limit && txq->sta) {
+			if (txq->ps_id == LEGACY_PS_ID) {
+				/* for legacy PS abort SP and wait next ps-poll */
+				txq->sta->ps.sp_cnt[txq->ps_id] -= txq->push_limit;
+				txq->push_limit = 0;
+			}
+			/* for u-apsd need to complete the SP to send EOSP frame */
+		}
+#ifndef CONFIG_AIC8800_ONE_TXQ
+		/* restart netdev queue if number of queued buffer is below threshold */
+#ifdef CONFIG_AIC8800_TX_NETIF_FLOWCTRL
+		if (unlikely(txq->status & AICWF_TXQ_NDEV_FLOW_CTRL) &&
+		    (skb_queue_len(&txq->sk_list) < AICWF_NDEV_FLOW_CTRL_RESTART)) {
+#else
+		if (unlikely(txq->status & AICWF_TXQ_NDEV_FLOW_CTRL) &&
+		    skb_queue_len(&txq->sk_list) < AICWF_NDEV_FLOW_CTRL_RESTART) {
+#endif
+
+			txq->status &= ~AICWF_TXQ_NDEV_FLOW_CTRL;
+			netif_wake_subqueue(txq->ndev, txq->ndev_idx);
+#ifdef AIC8800_CREATE_TRACE_POINTS
+			trace_txq_flowctrl_restart(txq);
+#endif
+		}
+#endif /* CONFIG_AIC8800_ONE_TXQ */
+#endif /* CONFIG_AICWF_FULLMAC */
+	}
+
+	if (mu_enable)
+		aicwf_txq_release_mu_lock(aicwf_hw);
+}
+
+/**
+ * aicwf_hwq_process_all - Process all HW queue list
+ *
+ * @aicwf_hw: Driver main data
+ *
+ * Loop over all HWQ, and process them if needed
+ * To be called with tx_lock hold
+ */
+void aicwf_hwq_process_all(struct aicwf_hw *aicwf_hw)
+{
+	int id;
+
+	aicwf_mu_group_sta_select(aicwf_hw);
+
+	for (id = ARRAY_SIZE(aicwf_hw->hwq) - 1; id >= 0; id--) {
+		if (aicwf_hw->hwq[id].need_processing)
+			aicwf_hwq_process(aicwf_hw, &aicwf_hw->hwq[id]);
+	}
+}
+
+static const int nx_txdesc_cnt[] = {
+	NX_TXDESC_CNT0, NX_TXDESC_CNT1, NX_TXDESC_CNT2, NX_TXDESC_CNT3,
+#if NX_TXQ_CNT == 5
+	NX_TXDESC_CNT4,
+#endif
+};
+
+/**
+ * aicwf_hwq_init - Initialize all hwq structures
+ *
+ * @aicwf_hw: Driver main data
+ *
+ */
+void aicwf_hwq_init(struct aicwf_hw *aicwf_hw)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(aicwf_hw->hwq); i++) {
+		struct aicwf_hwq *hwq = &aicwf_hw->hwq[i];
+
+		hwq->id = i;
+		hwq->size = nx_txdesc_cnt[i];
+		INIT_LIST_HEAD(&hwq->list);
+	}
+}
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq_prealloc.c b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq_prealloc.c
new file mode 100644
index 000000000000..695a208af7f1
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq_prealloc.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ ******************************************************************************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief txq prealloc mem
+ *
+ ******************************************************************************
+ */
+#include <linux/bug.h>
+#include <linux/printk.h>
+#include <linux/slab.h>
+
+#include "aicwf_txq_prealloc.h"
+
+#define MAX_TXQ_SIZE (100 * 1024)
+
+/**
+ * aicwf_prealloc_txq_alloc - Allocate or reuse the preallocated TX queue
+ * @prealloc: Queue holder owned by the SDIO device
+ * @size: Required queue size in bytes
+ *
+ * Return: Pointer to the queue buffer, or %NULL if allocation failed.
+ */
+void *aicwf_prealloc_txq_alloc(struct aicwf_prealloc_txq *prealloc,
+			       size_t size)
+{
+	WARN_ON_ONCE(size > MAX_TXQ_SIZE);
+
+	if (prealloc->txq && prealloc->size != size) {
+		pr_debug("size is diff will to be kzalloc\n");
+		kfree(prealloc->txq);
+		prealloc->txq = NULL;
+	}
+
+	if (!prealloc->txq) {
+		prealloc->txq = kzalloc(size, GFP_KERNEL);
+		prealloc->size = size;
+	} else {
+		pr_debug("txq not need to kzalloc\n");
+	}
+
+	return prealloc->txq;
+}
+
+/**
+ * aicwf_prealloc_txq_free - Free the preallocated TX queue
+ * @prealloc: Queue holder owned by the SDIO device
+ */
+void aicwf_prealloc_txq_free(struct aicwf_prealloc_txq *prealloc)
+{
+	kfree(prealloc->txq);
+	prealloc->txq = NULL;
+}
