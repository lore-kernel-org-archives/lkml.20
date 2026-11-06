Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966926;
	b=OFOoB8X2QqXus3B69frktBeWydrZlaDn97rnZbSVUpSzqyrUo9dksTGQ9ChrB4A+9+r+
	 /EM1fMWcJtnek0tPptb6sBLVfSQwhpc/wbKV0/gfqB+BDiCW89p/TXuIMBMBb6cUYS6ci
	 qVVIhn6YuW9k4RPwMtRvzKcYUzu4rH2HDtVrhf0P0qpxmtYVUp7iBKPiXtBfB27T1kGBE
	 r6LWsJrztBjGOLeVaNYdBDduZrhcJUNL/N/9ahi+yp4d0A7M5d8CLvXMaZ2JuUykKnuQy
	 lwCK2t2ysFyL1WjlVnvCNxhgVypTWHoCL/Oi8TIlDYVIxfoVEFpvfuZ7fKf5p40eVLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966926;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jv7s6wKtvgrG/6AROL2c2mKHsFVPsByfE69r6ZjY/9w=;
	b=0VtdElgP86zV6+HYoRs6gC1SFXUFKzRuy0y+4zYhdNkCelpGQ+JINrTZj7YnP+V0oF0j
	 glgYAlj1KDjcE69aAS4/7JQ+l2VoFvHVTo8LYs5Vp1J5OBVaCvMHDKH3t/va3VanRWA8v
	 BUalIEPNJk3UFHnk1Oz0KYYLnQNA+hYTLhfUf27VvO2g/z8GrB7s6DKVkCncW+aVLHYKB
	 2AAqx8cRSKT3fj7ATF5G2DCgoVkr2RZo+eCnWLcy3lvmAjd4bMyd6/17/r9BN+NlAKjD7
	 Elej+mKDUwxovkxZmROPEHmYeRd3a1sxkwWFzrd6r4xag57mUDyOEbqHZrhhkJ+6DyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lmsp5+sC;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90424606D802;
	Fri,  6 Nov 2026 12:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90424606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lmsp5+sC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793966926; x=1825502926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ik6jUwpU4CWlr3ADDU0YSu7LPtxWfjCl64QCDy4nosk=;
  b=Lmsp5+sCYw2t1+V3u9ixy2KBwHuNhYVoU25dzgpKCRJ1da5tqCG9gM+O
   oPwGi997ujYOIIKouMgC5lS8j3fx/vAUFBxCA9jbuLpxxkRav9pyK7iJc
   KbuP23KolZCtdvCDSKKRWI2ZnQLZ0TcGvLjotXG2WMtEgIrAaH+56aElg
   MF363eduJrpgzzXsKyM8ovRqRluKFbq8tDYewtJ9A21+23L0rnUqrhtXk
   Q/W3YGXGIcmzJLl0bJO3sTxlomIc/aD+jRNvx+NirjdDC/KI25B0h6jIk
   1VpRRoE6UpJee2iePnekUgt8HBflFtYD/qUJMZXYhGzBfaFLOUushG1FM
   w==;
X-CSE-ConnectionGUID: b5Aswvg/SzaPK9zwHez/Fg==
X-CSE-MsgGUID: 6R/XSA18TG282fCQR3Dscw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2655362"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2655362"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 04:08:46 -0800
X-CSE-ConnectionGUID: V/X3LJtrSlGRyrWJzMuHnA==
X-CSE-MsgGUID: 86TSnPlHR+eZZGdl5lHAcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7146619"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa004.jf.intel.com with ESMTP; 06 Nov 2026 04:08:43 -0800
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
Subject: [PATCH v3 2/7] soundwire: intel: Allow for dynamic assignment of PDIs
Date: Fri,  6 Nov 2026 13:15:52 +0100
Message-Id: <20261106121557.2338556-3-cezary.rojewski@intel.com>
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

Currently, PDIs are assigned upfront based on the DAI IDs. Some drivers
do not assign anything upfront and request a free PDI when streaming is
about to start.

Provide assign/release() functions to allow them to be assigned
dynamically. This also streamlines the process of assigning/releasing
PDIs with what is done in HDAudio library (sound/hda) for HDAudio
streams, see snd_hdac_stream_assign/release().

As resource availability-check is typically done during dai->startup()
whilst hardware/firmware configuration occurs on dai->hw_params(), add
sdw_intel_pdi_config() to maintain this logical split - assign on
start(), configure on hw_params(). Existing code does all of that in
intel_hw_params() so the logical split is not possible.

Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 drivers/soundwire/cadence_master.c    | 64 +++++++++++++++++++++++++++
 drivers/soundwire/cadence_master.h    | 25 ++---------
 drivers/soundwire/intel.c             | 24 +++++++---
 include/linux/soundwire/sdw_cadence.h | 35 +++++++++++++++
 include/linux/soundwire/sdw_intel.h   |  7 +++
 5 files changed, 128 insertions(+), 27 deletions(-)
 create mode 100644 include/linux/soundwire/sdw_cadence.h

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index a0a63b76793e..6c1ad11c6583 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -17,6 +17,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_cadence.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <linux/workqueue.h>
@@ -1835,6 +1836,7 @@ int sdw_cdns_probe(struct sdw_cdns *cdns)
 
 	mutex_init(&cdns->status_update_lock);
 
+	spin_lock_init(&cdns->pdi_lock);
 	INIT_WORK(&cdns->work, cdns_update_slave_status_work);
 	INIT_DELAYED_WORK(&cdns->attach_dwork, cdns_check_attached_status_dwork);
 
@@ -1991,6 +1993,68 @@ struct sdw_cdns_pdi *sdw_cdns_alloc_pdi(struct sdw_cdns *cdns,
 }
 EXPORT_SYMBOL(sdw_cdns_alloc_pdi);
 
+/**
+ * sdw_cdns_assign_pdi - Assign a PDI
+ * @bus: SoundWire bus instance
+ * @dir: Data direction
+ *
+ * Return: A valid PDI instance or %NULL if none available.
+ */
+struct sdw_cdns_pdi *sdw_cdns_assign_pdi(struct sdw_bus *bus, u32 dir)
+{
+	struct sdw_cdns *cdns = bus_to_cdns(bus);
+	struct sdw_cdns_streams *stream = &cdns->pcm;
+	struct sdw_cdns_pdi *pdis, *pdi;
+	size_t num_pdis;
+	int i;
+
+	if (dir == SDW_DATA_DIR_RX) {
+		num_pdis = stream->num_in;
+		pdis = stream->in;
+	} else {
+		num_pdis = stream->num_out;
+		pdis = stream->out;
+	}
+
+	spin_lock(&cdns->pdi_lock);
+	for (i = 0; i < num_pdis; i++) {
+		if (!pdis[i].assigned) {
+			pdi = &pdis[i];
+			goto found;
+		}
+	}
+
+	for (i = 0; i < stream->num_bd; i++) {
+		if (!stream->bd[i].assigned) {
+			pdi = &stream->bd[i];
+			goto found;
+		}
+	}
+
+	spin_unlock(&cdns->pdi_lock);
+	return NULL;
+found:
+	pdi->dir = dir;
+	pdi->assigned = true;
+	spin_unlock(&cdns->pdi_lock);
+	return pdi;
+}
+EXPORT_SYMBOL(sdw_cdns_assign_pdi);
+
+/**
+ * sdw_cdns_release_pdi() - Release a PDI
+ * @bus: SoundWire bus instance
+ * @pdi: PDI instance
+ */
+void sdw_cdns_release_pdi(struct sdw_bus *bus, struct sdw_cdns_pdi *pdi)
+{
+	struct sdw_cdns *cdns = bus_to_cdns(bus);
+
+	guard(spinlock)(&cdns->pdi_lock);
+	pdi->assigned = false;
+}
+EXPORT_SYMBOL(sdw_cdns_release_pdi);
+
 /*
  * the MIPI SoundWire CRC8 polynomial is X^8 + X^6 + X^3 + X^2 + 1, MSB first
  * The value is (1)01001101 = 0x4D
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index f4e41a9ab165..c3339c1e98ff 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -6,6 +6,8 @@
 #ifndef __SDW_CADENCE_H
 #define __SDW_CADENCE_H
 
+#include <linux/soundwire/sdw_cadence.h>
+
 #define SDW_CADENCE_GSYNC_KHZ		4 /* 4 kHz */
 #define SDW_CADENCE_GSYNC_HZ		(SDW_CADENCE_GSYNC_KHZ * 1000)
 
@@ -17,27 +19,6 @@
 
 #define SDW_CADENCE_MCP_IP_OFFSET	0x4000
 
-/**
- * struct sdw_cdns_pdi: PDI (Physical Data Interface) instance
- *
- * @num: pdi number
- * @intel_alh_id: link identifier
- * @l_ch_num: low channel for PDI
- * @h_ch_num: high channel for PDI
- * @ch_count: total channel count for PDI
- * @dir: data direction
- * @type: stream type, (only PCM supported)
- */
-struct sdw_cdns_pdi {
-	int num;
-	int intel_alh_id;
-	int l_ch_num;
-	int h_ch_num;
-	int ch_count;
-	enum sdw_data_direction dir;
-	enum sdw_stream_type type;
-};
-
 /**
  * struct sdw_cdns_streams: Cadence stream data structure
  *
@@ -114,6 +95,7 @@ struct sdw_cdns_dai_runtime {
  * @ports: Data ports
  * @num_ports: Total number of data ports
  * @pcm: PCM streams
+ * @pdi_lock: synchronizes assignment of PDIs found in PCM streams
  * @registers: Cadence registers
  * @link_up: Link status
  * @msg_count: Messages sent on bus
@@ -140,6 +122,7 @@ struct sdw_cdns {
 	int num_ports;
 
 	struct sdw_cdns_streams pcm;
+	spinlock_t pdi_lock;
 
 	int pdi_loopback_source;
 	int pdi_loopback_target;
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index af65214836b4..0baa032fb4e8 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -674,6 +674,22 @@ intel_pdi_alh_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
 	intel_writel(alh, SDW_ALH_STRMZCFG(pdi->intel_alh_id), conf);
 }
 
+/**
+ * sdw_intel_pdi_config - Configure specified PDI
+ * @bus: SoundWire bus instance
+ * @pdi: PDI instance to configure
+ */
+void sdw_intel_pdi_config(struct sdw_bus *bus, struct sdw_cdns_pdi *pdi)
+{
+	struct sdw_cdns *cdns = bus_to_cdns(bus);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+
+	intel_pdi_shim_configure(sdw, pdi);
+	intel_pdi_alh_configure(sdw, pdi);
+	sdw_cdns_config_stream(cdns, pdi->ch_count, pdi->dir, pdi);
+}
+EXPORT_SYMBOL(sdw_intel_pdi_config);
+
 static int intel_params_stream(struct sdw_intel *sdw,
 			       struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai,
@@ -745,9 +761,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 
 	/* do run-time configurations for SHIM, ALH and PDI/PORT */
-	intel_pdi_shim_configure(sdw, pdi);
-	intel_pdi_alh_configure(sdw, pdi);
-	sdw_cdns_config_stream(cdns, ch, dir, pdi);
+	sdw_intel_pdi_config(&cdns->bus, dai_runtime->pdi);
 
 	/* store pdi and hw_params, may be needed in prepare step */
 	dai_runtime->paused = false;
@@ -823,9 +837,7 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 		else
 			dir = SDW_DATA_DIR_TX;
 
-		intel_pdi_shim_configure(sdw, dai_runtime->pdi);
-		intel_pdi_alh_configure(sdw, dai_runtime->pdi);
-		sdw_cdns_config_stream(cdns, ch, dir, dai_runtime->pdi);
+		sdw_intel_pdi_config(&cdns->bus, dai_runtime->pdi);
 
 		/* Inform DSP about PDI stream number */
 		ret = intel_params_stream(sdw, substream, dai,
diff --git a/include/linux/soundwire/sdw_cadence.h b/include/linux/soundwire/sdw_cadence.h
new file mode 100644
index 000000000000..331b21adafc4
--- /dev/null
+++ b/include/linux/soundwire/sdw_cadence.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* Copyright(c) 2024-2026 Intel Corporation */
+
+#ifndef ___SDW_CADENCE_H
+#define ___SDW_CADENCE_H
+
+#include <linux/soundwire/sdw.h>
+
+/**
+ * struct sdw_cdns_pdi: PDI (Physical Data Interface) instance
+ *
+ * @num: pdi number
+ * @intel_alh_id: link identifier
+ * @l_ch_num: low channel for PDI
+ * @h_ch_num: high channel for PDI
+ * @ch_count: total channel count for PDI
+ * @dir: data direction
+ * @type: stream type, (only PCM supported)
+ * @assigned: whether PDI is in use
+ */
+struct sdw_cdns_pdi {
+	int num;
+	int intel_alh_id;
+	int l_ch_num;
+	int h_ch_num;
+	int ch_count;
+	enum sdw_data_direction dir;
+	enum sdw_stream_type type;
+	bool assigned;
+};
+
+struct sdw_cdns_pdi *sdw_cdns_assign_pdi(struct sdw_bus *bus, u32 dir);
+void sdw_cdns_release_pdi(struct sdw_bus *bus, struct sdw_cdns_pdi *pdi);
+
+#endif
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 4547dcc710e5..fbfb216bd90c 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -7,6 +7,7 @@
 #include <linux/acpi.h>
 #include <linux/irqreturn.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_cadence.h>
 
 /*********************************************************************
  * cAVS and ACE1.x definitions
@@ -386,6 +387,8 @@ void sdw_intel_exit(struct sdw_intel_ctx *ctx);
 
 irqreturn_t sdw_intel_thread(int irq, void *dev_id);
 
+void sdw_intel_pdi_config(struct sdw_bus *bus, struct sdw_cdns_pdi *pdi);
+
 #else
 
 static inline int sdw_intel_acpi_scan(acpi_handle parent_handle, struct sdw_intel_acpi_info *info)
@@ -416,6 +419,10 @@ static inline irqreturn_t sdw_intel_thread(int irq, void *dev_id)
 	return 0;
 }
 
+static inline void sdw_intel_pdi_config(struct sdw_bus *bus, struct sdw_cdns_pdi *pdi)
+{
+}
+
 #endif
 
 #define SDW_INTEL_QUIRK_MASK_BUS_DISABLE      BIT(1)
-- 
2.34.1

