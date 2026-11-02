Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642631;
	b=ZENcBerV2a6OXK3N2c1b7l1s0B30WcfYQZSacwVTXxRKX/7ueioeOLM9OQac7vhggJlc
	 7I7wN0NLf5slMmEAFdYuX+eRUPUpjvGFjcV+LAbRcwR3/3mlpS9QgJrIb+Z0jyklbfwHO
	 Mtd9t6jFBDLA5bc3cPvyI4PtGzjub5vKdTukeQ99pU8Nlyu5yWLP+BbJppmZl0Eix/9tk
	 pYSv4OjHjPqGFwIEIe1A+zgzsxEFOr/oA1mqLA8Us7jgxKKl/eLrOb1Z3l3DgDWwOwXrK
	 snf1Tyc+BcdXD2FGWVD0/ape2tru3eFaYIaejGZf+UVO1d4NFivhp5SYp6yYug/qpdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642631;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=plamnT2oKWq10xntSp/zPDXdIQ7wbqg58z2sfhTG+w8=;
	b=1REi4oOPY3jI0+cz/iQXXMXBSKctCtbAX1HAJEBuyqE9aexKivW9sRwND91qfvjUqMO4
	 fPIn757ZHTzd3UUAU/EsE2ybq63QmADqXBoa1n2DhyuFV7v/z/YRGqKyjfwlT397PptoU
	 kpVRWzXz0crwYNmz5fCxhr2ItkfYSKZWh/MNlz+jm6ZOP9o+fic8uHABUjFXHOzXN/IBf
	 UWrsWnCASNb7Yoj41fgKH4mkTUwNJSw7qPmXpyASmstDJhKV+AGUdaMVlIBFILgBjHniC
	 Dw2vBqPxoUV8LF6YdNFCPWV5izBNIFk0yKvSytDqEmGvmuFCv9J5C+ZrXxtEvkanoig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iadnwFKr;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C99606B0E4;
	Mon,  2 Nov 2026 18:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C99606B0E4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iadnwFKr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793642630; x=1825178630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DYlo461w+NPEFwzhZwJU1a0o45D7BhSALnMzZ+Nzmnc=;
  b=iadnwFKrPazLhoXRUnJh4bt4Fviy93J9jM0KBxNMmeYBwViSuB77Stsf
   PIt1nBYRp8LjwEUCztpf9cUJwg/2pAQjkdXuvvckan96zxt2BFQyYxbl9
   //2snNwzjDqVEmjNZOrN/vS3uxb5NK3w9VKX806G4OQQTDef7x0vEkpZY
   OckyBAmz1G71R12aKmrP5E+vN6rMcezS9YCD6FW504JYvcGLBX1qaulJw
   3aOAe2jiPyZjVgm4I0aeIaLmD2FKHGrSMdzqAtch4nYLyQIkpmdwORtGK
   /zIADtIDakmGja3645FY0eJ8LdGU7RDTAWCLUfCBdsVx6vA6VUYuLp4W4
   w==;
X-CSE-ConnectionGUID: tV3WsWvASqeUdXsJ6bwlpg==
X-CSE-MsgGUID: STKDfvr+RQSC24df3a2YKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2235468"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2235468"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 10:03:49 -0800
X-CSE-ConnectionGUID: QJnkyV34QAKj6yOEfPDyVQ==
X-CSE-MsgGUID: EGf5HG+zTs++pnGaeOYsnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6169174"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2026 10:03:40 -0800
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
Subject: [PATCH 2/7] soundwire: intel: Allow for dynamic assignment of PDIs
Date: Mon,  2 Nov 2026 19:10:37 +0100
Message-Id: <20261102181042.1922005-3-cezary.rojewski@intel.com>
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
 drivers/soundwire/cadence_master.h    | 24 ++--------
 drivers/soundwire/intel.c             | 16 +++++++
 include/linux/soundwire/sdw_cadence.h | 35 +++++++++++++++
 include/linux/soundwire/sdw_intel.h   |  7 +++
 5 files changed, 125 insertions(+), 21 deletions(-)
 create mode 100644 include/linux/soundwire/sdw_cadence.h

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index a0a63b76793e..9375db9c08a2 100644
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
+	/* Indexes 0/1 are reserved for the Bulk transfer. */
+	for (i = 2; i < stream->num_bd; i++) {
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
index f4e41a9ab165..f52c9cbec8a9 100644
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
@@ -140,6 +121,7 @@ struct sdw_cdns {
 	int num_ports;
 
 	struct sdw_cdns_streams pcm;
+	spinlock_t pdi_lock;
 
 	int pdi_loopback_source;
 	int pdi_loopback_target;
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index af65214836b4..d53fa3d299bc 100644
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
index 83021cc0f5b8..120f16b8d478 100644
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

