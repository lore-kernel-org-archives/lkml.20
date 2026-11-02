Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642633;
	b=bEOeGcrZrsbxAvONeEC3BThW5n4Kkcy4xyaHRojcpQ7fbfu92/WB7NC65qdA8y+JXAB1
	 DDPHnGVdTK7ImveseSp1MYGeuRcD944+93eEtI23lpHX23f7qD2R6e8BSMCjOcQrpB3dh
	 GzQDROTNUBKH0rLD1vN+4HSiQngHrwDQqKHxoiD23Wnq4RyxKoZ2X1j1sBU0mtr9rsxwr
	 8QbQSdxOelBlLzBDuEM6PYyto4/QueMx5TNh1Y1wOyvdQbgFRhXvJ7SXkzSWadg2H8tuL
	 dcfKXYVBbOrl287FOqUcHUqAZTSHtSTETbH5KeAJyR+Mt0gZdDz+IQNQaAMR3OfO/7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642633;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F+gmxQTPC4wezyLiYoG9/rImxUx/D4yw8wxnxUnmqyE=;
	b=esl5U21iJd2pqq4RN6iDvcgnc+6D5k2JkijgvN548rERpId8pbj3IOoCFkSkEqBlBXEV
	 TPjtZtwjRy5G1+2u4V+erYISASu0p2qi2HQtnoHRDQy4VRfGT4ql/JO+W3IHG5umKyV0L
	 RfLznUONm86pjEOw2V/L3+nLsS3F8r3LruZuK5yNGIEo+YsfCxUN/qB3V3jcds8rjEEl6
	 kA1rPIRb+IQm+kGjxRemuVioKP3/JcDuKiOcrz1X7onpXNJZu6mSwzF/iFPysGc8IjgWC
	 GKzFXyxueo5xzL1gviUf7tmTpl+QYmRhOfY/8821ytS5YVNcei55LLXNQQjihw7A2xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YTY6k2aH;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE764606BA43;
	Mon,  2 Nov 2026 18:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE764606BA43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YTY6k2aH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793642633; x=1825178633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R49+20M6TZI2L1UUxewLHo7LHCCDA7KYWdkcaNXcl9M=;
  b=YTY6k2aHr14MBf8LgPX7h6x4VxiuouLYjZx6B58CyugL9hiAgEEXsYnF
   g44eBmOs5ng0YpXTktSxbuVG8K2+49Me2T5EvwO7wAWaUibgLIAtWEcrP
   jzUeGorLyobtz4oY0dqlCr0MeB8mh/tckZk0qAmcqUQ4aBIF2RxGeY089
   IOBl8RRKTV+RujooHkGYj+D2kZcZ409wvmvuVbsFkyjxhUYjnW7aLIcZx
   HD6gmiEZy95uodPFnYVBOhjoe0mbNQ88ZElENFP8tqqhkJ0HfY8g8c0oq
   J2AOCg7BPa5EmR6ooAr590LcONHu8eudx+yUQGyt9MDD9BTHN4efmvPhY
   A==;
X-CSE-ConnectionGUID: 0YvoTplCQhKAwOGphXhVzw==
X-CSE-MsgGUID: Ngn7gCvpRe25cdM4xjf4Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2235487"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2235487"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 10:03:51 -0800
X-CSE-ConnectionGUID: yQTTUNT7Q/6dJ/Yy7sUleQ==
X-CSE-MsgGUID: OcctZF9IQi65lWS7RGm4fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6169208"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2026 10:03:48 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	vkoul@kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 5/7] ASoC: Intel: avs: SoundWire support
Date: Mon,  2 Nov 2026 19:10:40 +0100
Message-Id: <20261102181042.1922005-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102181042.1922005-1-cezary.rojewski@intel.com>
References: <20261102181042.1922005-1-cezary.rojewski@intel.com>
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
 sound/soc/intel/Kconfig         |   1 +
 sound/soc/intel/avs/Makefile    |   4 ++
 sound/soc/intel/avs/avs.h       |   1 +
 sound/soc/intel/avs/cnl.c       |  23 ++++++-
 sound/soc/intel/avs/core.c      |  22 +++++++
 sound/soc/intel/avs/loader.c    |   3 +
 sound/soc/intel/avs/registers.h |   4 ++
 sound/soc/intel/avs/soundwire.c | 112 ++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/soundwire.h |  56 ++++++++++++++++
 9 files changed, 224 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/intel/avs/soundwire.c
 create mode 100644 sound/soc/intel/avs/soundwire.h

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 63367364916a..4e453b55fc04 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -106,6 +106,7 @@ config SND_SOC_INTEL_AVS
 	select SND_HDA_EXT_CORE
 	select SND_HDA_DSP_LOADER
 	select SND_INTEL_DSP_CONFIG
+	select SND_INTEL_SOUNDWIRE_ACPI if SOUNDWIRE_INTEL != n
 	select WANT_DEV_COREDUMP
 	help
 	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 576dc0da381d..1d48953c7a31 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -14,6 +14,10 @@ ifneq ($(CONFIG_DEBUG_FS),)
 snd-soc-avs-y += probes.o debugfs.o
 endif
 
+ifneq ($(CONFIG_SOUNDWIRE_INTEL),)
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
index 31fd9f251d6c..7090b91572d8 100644
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
+		u32 wakests;
+
+		if (adspis2 != UINT_MAX && (adspis2 & AVS_ADSP_ADSPIS2_SNDW))
+			ret = avs_sdw_thread(irq, adev);
+
+		wakests = snd_hdac_adsp_readl(adev, adev->sdw->shim_base + SDW_SHIM_WAKESTS);
+		if (wakests) {
+			avs_sdw_process_wakeen_event(adev);
+			ret = IRQ_HANDLED;
+		}
+	}
+
 	return ret;
 }
 
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 9413027e1e32..f9f25f651a9e 100644
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
@@ -587,6 +603,9 @@ static void avs_pci_remove(struct pci_dev *pci)
 	avs_dsp_op(adev, int_control, false);
 	snd_hdac_ext_bus_ppcap_int_enable(bus, false);
 
+	avs_sdw_enable_irq(adev, false);
+	avs_sdw_exit(adev);
+
 	/* it is safe to remove all codecs from the system now */
 	list_for_each_entry_safe(hdev, save, &bus->codec_list, list)
 		snd_hda_codec_unregister(hdac_to_hda_codec(hdev));
@@ -661,6 +680,7 @@ static int avs_suspend_common(struct avs_dev *adev, bool low_power)
 	}
 
 	avs_ipc_block(adev->ipc);
+	avs_sdw_enable_irq(adev, false);
 	avs_dsp_op(adev, int_control, false);
 	snd_hdac_ext_bus_ppcap_int_enable(bus, false);
 
@@ -720,6 +740,8 @@ static int avs_resume_common(struct avs_dev *adev, bool low_power, bool purge)
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
index 000000000000..c2a6db08a3af
--- /dev/null
+++ b/sound/soc/intel/avs/soundwire.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2026 Intel Corporation
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
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
+	ret = sdw_intel_acpi_scan(ACPI_HANDLE(adev->dev), &info);
+	if (ret < 0)
+		return -ENODEV;
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
+	if (adev->sdw) {
+		sdw_intel_exit(adev->sdw);
+		adev->sdw = NULL;
+	}
+}
+
+// TODO split tgl vs mtl
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
index 000000000000..96ce29ab21a3
--- /dev/null
+++ b/sound/soc/intel/avs/soundwire.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2021-2026 Intel Corporation
+ *
+ * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+ *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+ */
+
+#ifndef __SOUND_SOC_INTEL_AVS_SOUNDWIRE_H
+#define __SOUND_SOC_INTEL_AVS_SOUNDWIRE_H
+
+#include <linux/irqreturn.h>
+
+struct avs_dev;
+
+#if IS_ENABLED(CONFIG_SOUNDWIRE_INTEL)
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

