Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966934;
	b=jqev/+qNY1eEoRr7ITof8O7jGcquTqgkSU1Oy7UTAWe5PvZ3rZNwF+2qhdAnhljiC9/k
	 MiFEv3kb4VWzZw8hINZCaUahQDKjm9ulBPvuR/uCJ7/b6lYI9wlK7E8S3Fv1cBc3A2pI0
	 R0kK9RbFSGFQZHRP64AXHFtdw8ohexrWckU9BPwspGloqB2oe6qHR+NEIRZvJa1Q5zQGk
	 8z1644WNp+pLBgqm0aQDf77VeUMbNsc5pOoFQGrROX1DKZNvK/XhDvTMVpn2wfoVQcLNT
	 vqLJTRZ9uqosyO5+px6Udt3/fW23SxaswVG0kFSgCYdZ70F2YqYAeaCdfQFF5bhBO0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966934;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nLvBhsnSr96nI+vqaqJTh9hMoYtGR1nhO9TgjOez53g=;
	b=2K3nS9wtcIpdThdC/gy887Tz55fhlPJF4qjBgleyhi13poOoWB6kv+rMbIZJWtj7E4bv
	 EAGKG4FcTxXGQ1TQ0kpu3IfUhWt0krwPSLUgUkhvs6ZorzRivrzbubQixHdcoI2d5sGoW
	 79siDaqBOUS/NMZx01pg+T8H991Rsu99EiCkj4dxKya8fGjQ0lYwLITvI9rjTsiRPscKh
	 4sYz+co1fehcQKRN4tgy6cWtptWXL2vYFRTeIghej2JjWHZTLed1t31KeGqea7o1OtPYg
	 6CrHl9RLJhbDNCYKT04Ve/t6GKrKz1MosQyPiPOSldjAWaHrxNQ2H+XAUBs4J3nL4yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wtg5Iy7+;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7CF606EE93;
	Fri,  6 Nov 2026 12:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E7CF606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wtg5Iy7+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793966934; x=1825502934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/rRCf8V3uJC7KYer/AoygYArFabkMj+ft98L5TmvVBA=;
  b=Wtg5Iy7+0h+Vr1P19fkuBRi5qU/fAN6IIepzUzvctbKIUnpfWiCWUjMC
   WYcPhAJtBYPV6nUc6QtFnpAU1aLEmcn5QryTqZd92nw93POp9LUVOBQ8h
   czwOR5Qhf4nRsPYwQirHvVMkTCKbtiUbbgFJmpSWWUalh/Rc+XGLizAe6
   o/CE8MtSq0N9C1LxgxgH2Snu3A0nV80v4Swmzp4HndJZ0sBtEr4V3dIl/
   JQPnPi+6rJLY70ASp0mXYKTnr1buGyR9L0A8cb355ePBKTpibPjmI7eQ4
   o72xjAUeYMWimcoYNCqPpr8IG7D/A0pE3fUw/Gn7W7qz22nLWPRbJXMxp
   g==;
X-CSE-ConnectionGUID: YgLgPhvvSHmXmM8Aj1xUwA==
X-CSE-MsgGUID: +OGWBGbsTB6ZM/F8Ik91/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2655386"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2655386"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 04:08:53 -0800
X-CSE-ConnectionGUID: pyQVO+QRSiiiu/fB1DTLXw==
X-CSE-MsgGUID: 54YOQXklTyGkOLl7PDg+Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7146640"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa004.jf.intel.com with ESMTP; 06 Nov 2026 04:08:51 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	yung-chuan.liao@linux.intel.com,
	vkoul@kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 5/7] ASoC: Intel: avs: SoundWire support
Date: Fri,  6 Nov 2026 13:15:55 +0100
Message-Id: <20261106121557.2338556-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106121557.2338556-1-cezary.rojewski@intel.com>
References: <20261106121557.2338556-1-cezary.rojewski@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SoundWire device is part of the Intel HDAudio PCI device. To support
transfer over SoundWire interface it has to be accounted for when
probing the parent device.

Most of the actual job is done by the SoundWire library which is already
part of the kernel. Utilize it in the core functions of the driver to
enumerate SoundWire component and service its interrupts.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig         |   8 +++
 sound/soc/intel/avs/Makefile    |   4 ++
 sound/soc/intel/avs/avs.h       |   1 +
 sound/soc/intel/avs/cnl.c       |  23 ++++++-
 sound/soc/intel/avs/core.c      |  21 ++++++
 sound/soc/intel/avs/loader.c    |   3 +
 sound/soc/intel/avs/registers.h |   4 ++
 sound/soc/intel/avs/soundwire.c | 112 ++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/soundwire.h |  56 ++++++++++++++++
 9 files changed, 230 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/intel/avs/soundwire.c
 create mode 100644 sound/soc/intel/avs/soundwire.h

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 63367364916a..c765eee25763 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -106,12 +106,20 @@ config SND_SOC_INTEL_AVS
 	select SND_HDA_EXT_CORE
 	select SND_HDA_DSP_LOADER
 	select SND_INTEL_DSP_CONFIG
+	select SND_INTEL_SOUNDWIRE_ACPI if SOUNDWIRE_INTEL != n
 	select WANT_DEV_COREDUMP
 	help
 	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
 	  capabilities. This includes Skylake, Kabylake, Amberlake and
 	  Apollolake.
 
+config SND_SOC_INTEL_AVS_SOUNDWIRE
+	tristate
+	default SND_SOC_INTEL_AVS
+	depends on SND_SOC_INTEL_AVS
+	depends on SOUNDWIRE_INTEL
+	depends on !(SOUNDWIRE_INTEL=m && SND_SOC_INTEL_AVS=y)
+
 # Machine board drivers
 source "sound/soc/intel/avs/boards/Kconfig"
 
diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 576dc0da381d..042e8dd232f8 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -14,6 +14,10 @@ ifneq ($(CONFIG_DEBUG_FS),)
 snd-soc-avs-y += probes.o debugfs.o
 endif
 
+ifneq ($(CONFIG_SND_SOC_INTEL_AVS_SOUNDWIRE),)
+snd-soc-avs-y += soundwire.o
+endif
+
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
 
 # Machine support
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index b3af2c4126be..40e65639adb2 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -136,6 +136,7 @@ struct avs_dev {
 	void __iomem *dsp_ba;
 	const struct avs_spec *spec;
 	struct avs_ipc *ipc;
+	struct sdw_intel_ctx *sdw;
 
 	struct avs_fw_cfg fw_cfg;
 	struct avs_hw_cfg hw_cfg;
diff --git a/sound/soc/intel/avs/cnl.c b/sound/soc/intel/avs/cnl.c
index 31fd9f251d6c..58e5b0f3fa47 100644
--- a/sound/soc/intel/avs/cnl.c
+++ b/sound/soc/intel/avs/cnl.c
@@ -6,11 +6,16 @@
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
 //
 
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_intel.h>
 #include <sound/hdaudio_ext.h>
 #include "avs.h"
 #include "debug.h"
 #include "messages.h"
 #include "registers.h"
+#include "soundwire.h"
 
 static void avs_cnl_ipc_interrupt(struct avs_dev *adev)
 {
@@ -61,16 +66,30 @@ static void avs_cnl_ipc_interrupt(struct avs_dev *adev)
 irqreturn_t avs_cnl_dsp_interrupt(struct avs_dev *adev, int irq)
 {
 	u32 adspis = snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPIS);
+	u32 adspis2 = snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPIS2);
 	irqreturn_t ret = IRQ_NONE;
 
-	if (adspis == UINT_MAX)
+	if (adspis == UINT_MAX && adspis2 == UINT_MAX)
 		return ret;
 
-	if (adspis & AVS_ADSP_ADSPIS_IPC) {
+	if (adspis != UINT_MAX && (adspis & AVS_ADSP_ADSPIS_IPC)) {
 		avs_cnl_ipc_interrupt(adev);
 		ret = IRQ_HANDLED;
 	}
 
+	if (adev->sdw) {
+		u16 wakests;
+
+		if (adspis2 != UINT_MAX && (adspis2 & AVS_ADSP_ADSPIS2_SNDW))
+			ret = avs_sdw_thread(irq, adev);
+
+		wakests = snd_hdac_adsp_readw(adev, adev->sdw->shim_base + SDW_SHIM_WAKESTS);
+		if (wakests && wakests != U16_MAX) {
+			avs_sdw_process_wakeen_event(adev);
+			ret = IRQ_HANDLED;
+		}
+	}
+
 	return ret;
 }
 
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 9413027e1e32..83c19d3e91e6 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -31,6 +31,7 @@
 #include "debug.h"
 #include "messages.h"
 #include "pcm.h"
+#include "soundwire.h"
 
 static u32 pgctl_mask = AZX_PGCTL_LSRMD_MASK;
 module_param(pgctl_mask, uint, 0444);
@@ -230,6 +231,11 @@ static void avs_hda_probe_work(struct work_struct *work)
 	list_for_each_entry(hlink, &bus->hlink_list, list)
 		snd_hdac_ext_bus_link_put(bus, hlink);
 
+	/* Soundwire component is optional */
+	ret = avs_sdw_probe(adev);
+	if (ret && ret != -ENODEV)
+		dev_err(adev->dev, "failed to probe sdw: %d\n", ret);
+
 	snd_hdac_ext_bus_ppcap_enable(bus, true);
 	snd_hdac_ext_bus_ppcap_int_enable(bus, true);
 	avs_debugfs_init(adev);
@@ -240,6 +246,14 @@ static void avs_hda_probe_work(struct work_struct *work)
 
 	acpi_nhlt_get_gbl_table();
 
+	ret = avs_sdw_startup(adev);
+	if (ret) {
+		dev_err(adev->dev, "failed to startup sdw: %d\n", ret);
+		return;
+	}
+
+	avs_sdw_enable_irq(adev, true);
+
 	avs_register_all_boards(adev);
 
 	/* configure PM */
@@ -561,6 +575,8 @@ static void avs_pci_shutdown(struct pci_dev *pci)
 	snd_hdac_bus_stop_chip(bus);
 	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, false);
 
+	avs_sdw_enable_irq(adev, false);
+
 	pci_free_irq(pci, 0, adev);
 	pci_free_irq(pci, 0, bus);
 	pci_free_irq_vectors(pci);
@@ -579,11 +595,13 @@ static void avs_pci_remove(struct pci_dev *pci)
 
 	acpi_nhlt_put_gbl_table();
 	avs_debugfs_exit(adev);
+	avs_sdw_exit(adev);
 
 	if (avs_platattr_test(adev, CLDMA))
 		hda_cldma_free(&code_loader);
 
 	snd_hdac_stop_streams_and_chip(bus);
+	avs_sdw_enable_irq(adev, false);
 	avs_dsp_op(adev, int_control, false);
 	snd_hdac_ext_bus_ppcap_int_enable(bus, false);
 
@@ -661,6 +679,7 @@ static int avs_suspend_common(struct avs_dev *adev, bool low_power)
 	}
 
 	avs_ipc_block(adev->ipc);
+	avs_sdw_enable_irq(adev, false);
 	avs_dsp_op(adev, int_control, false);
 	snd_hdac_ext_bus_ppcap_int_enable(bus, false);
 
@@ -720,6 +739,8 @@ static int avs_resume_common(struct avs_dev *adev, bool low_power, bool purge)
 		return ret;
 	}
 
+	avs_sdw_enable_irq(adev, true);
+
 	return 0;
 }
 
diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index bebdc79ec88e..27d09a3bb5ef 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -18,6 +18,7 @@
 #include "messages.h"
 #include "registers.h"
 #include "topology.h"
+#include "soundwire.h"
 
 #define AVS_ROM_STS_MASK		0xFF
 #define AVS_ROM_INIT_DONE		0x1
@@ -345,6 +346,8 @@ static int avs_imr_load_basefw(struct avs_dev *adev)
 	if (ret < 0)
 		return ret;
 
+	avs_sdw_process_wakeen_event(adev);
+
 	ret = wait_for_completion_timeout(&adev->fw_ready,
 					  msecs_to_jiffies(AVS_FW_INIT_TIMEOUT_MS));
 	if (!ret) {
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index 97767882ffa1..9e403cfb04fa 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -25,11 +25,15 @@
 #define AVS_ADSP_REG_ADSPCS		(AVS_ADSP_GEN_BASE + 0x04)
 #define AVS_ADSP_REG_ADSPIC		(AVS_ADSP_GEN_BASE + 0x08)
 #define AVS_ADSP_REG_ADSPIS		(AVS_ADSP_GEN_BASE + 0x0C)
+#define AVS_ADSP_REG_ADSPIC2		(AVS_ADSP_GEN_BASE + 0x10)
+#define AVS_ADSP_REG_ADSPIS2		(AVS_ADSP_GEN_BASE + 0x14)
 
 #define AVS_ADSP_ADSPIC_IPC		BIT(0)
 #define AVS_ADSP_ADSPIC_CLDMA		BIT(1)
 #define AVS_ADSP_ADSPIS_IPC		BIT(0)
 #define AVS_ADSP_ADSPIS_CLDMA		BIT(1)
+#define AVS_ADSP_ADSPIC2_SNDW		BIT(5)
+#define AVS_ADSP_ADSPIS2_SNDW		BIT(5)
 
 #define AVS_ADSPCS_CRST_MASK(cm)	(cm)
 #define AVS_ADSPCS_CSTALL_MASK(cm)	((cm) << 8)
diff --git a/sound/soc/intel/avs/soundwire.c b/sound/soc/intel/avs/soundwire.c
new file mode 100644
index 000000000000..35bb7ed56bef
--- /dev/null
+++ b/sound/soc/intel/avs/soundwire.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2026 Intel Corporation
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amade@asmblr.net>
+//
+
+#include <linux/acpi.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_intel.h>
+#include <sound/hdaudio_ext.h>
+#include "avs.h"
+#include "registers.h"
+#include "soundwire.h"
+
+static struct sdw_intel_hw_ops avs_sdw_cnl_ops;
+
+int avs_sdw_probe(struct avs_dev *adev)
+{
+	struct hdac_bus *hbus = &adev->base.core;
+	struct sdw_intel_acpi_info info;
+	struct sdw_intel_ctx *ctx;
+	struct sdw_intel_res res;
+	int ret;
+
+	if (avs_platattr_test(adev, ALTHDA))
+		return -ENODEV;
+
+	ret = sdw_intel_acpi_scan(ACPI_HANDLE(adev->dev), &info);
+	if (ret || !info.link_mask)
+		return ret;
+
+	memset(&res, 0, sizeof(res));
+	res.mmio_base = adev->dsp_ba;
+	res.shim_base = SDW_SHIM_BASE;
+	res.alh_base = SDW_ALH_BASE;
+	res.ext = false;
+	res.irq = adev->base.core.irq;
+	res.handle = info.handle;
+	res.parent = adev->dev;
+	res.dev = adev->dev;
+	res.clock_stop_quirks = SDW_INTEL_CLK_STOP_BUS_RESET;
+	res.hbus = hbus;
+
+	memcpy(&avs_sdw_cnl_ops, &sdw_intel_cnl_hw_ops, sizeof(avs_sdw_cnl_ops));
+	avs_sdw_cnl_ops.register_dai = NULL;
+	res.hw_ops = &avs_sdw_cnl_ops;
+
+	/* we could filter links here if needed, e.g.: for quirks */
+	res.count = info.count;
+	res.link_mask = info.link_mask;
+
+	ctx = sdw_intel_probe(&res);
+	if (!ctx) {
+		dev_err(adev->dev, "SoundWire probe failed\n");
+		return -EINVAL;
+	}
+
+	adev->sdw = ctx;
+	return 0;
+}
+
+int avs_sdw_startup(struct avs_dev *adev)
+{
+	if (adev->sdw)
+		return sdw_intel_startup(adev->sdw);
+	return 0;
+}
+
+void avs_sdw_exit(struct avs_dev *adev)
+{
+	if (adev->sdw)
+		sdw_intel_exit(adev->sdw);
+}
+
+static void sdw_intel_enable_irq(void __iomem *mmio_base, bool enable)
+{
+	u32 val;
+
+	val = readl(mmio_base + AVS_ADSP_REG_ADSPIC2);
+
+	if (enable)
+		val |= AVS_ADSP_ADSPIC2_SNDW;
+	else
+		val &= ~AVS_ADSP_ADSPIC2_SNDW;
+
+	writel(val, mmio_base + AVS_ADSP_REG_ADSPIC2);
+}
+
+void avs_sdw_enable_irq(struct avs_dev *adev, bool enable)
+{
+	if (adev->sdw)
+		sdw_intel_enable_irq(adev->dsp_ba, enable);
+}
+
+void avs_sdw_process_wakeen_event(struct avs_dev *adev)
+{
+	if (adev->sdw)
+		sdw_intel_process_wakeen_event(adev->sdw);
+}
+
+irqreturn_t avs_sdw_thread(int irq, struct avs_dev *adev)
+{
+	if (adev->sdw)
+		return sdw_intel_thread(irq, adev->sdw);
+	return IRQ_HANDLED;
+}
+
+MODULE_IMPORT_NS("SOUNDWIRE_INTEL");
+MODULE_IMPORT_NS("SOUNDWIRE_INTEL_INIT");
+MODULE_IMPORT_NS("SND_INTEL_SOUNDWIRE_ACPI");
diff --git a/sound/soc/intel/avs/soundwire.h b/sound/soc/intel/avs/soundwire.h
new file mode 100644
index 000000000000..e57e29ed16bf
--- /dev/null
+++ b/sound/soc/intel/avs/soundwire.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2021-2026 Intel Corporation
+ *
+ * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+ *          Amadeusz Slawinski <amade@asmblr.net>
+ */
+
+#ifndef __SOUND_SOC_INTEL_AVS_SOUNDWIRE_H
+#define __SOUND_SOC_INTEL_AVS_SOUNDWIRE_H
+
+#include <linux/irqreturn.h>
+
+struct avs_dev;
+
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_AVS_SOUNDWIRE)
+
+int avs_sdw_probe(struct avs_dev *adev);
+int avs_sdw_startup(struct avs_dev *adev);
+void avs_sdw_exit(struct avs_dev *adev);
+void avs_sdw_enable_irq(struct avs_dev *adev, bool enable);
+void avs_sdw_process_wakeen_event(struct avs_dev *adev);
+irqreturn_t avs_sdw_thread(int irq, struct avs_dev *adev);
+
+#else
+
+static inline int avs_sdw_probe(struct avs_dev *adev)
+{
+	return 0;
+}
+
+static inline int avs_sdw_startup(struct avs_dev *adev)
+{
+	return 0;
+}
+
+static inline void avs_sdw_exit(struct avs_dev *adev)
+{
+}
+
+static inline void avs_sdw_enable_irq(struct avs_dev *adev, bool enable)
+{
+}
+
+static inline void avs_sdw_process_wakeen_event(struct avs_dev *adev)
+{
+}
+
+static inline irqreturn_t avs_sdw_thread(int irq, struct avs_dev *adev)
+{
+	return IRQ_HANDLED;
+}
+
+#endif
+
+#endif /* __SOUND_SOC_INTEL_AVS_SOUNDWIRE_H */
-- 
2.34.1

