Received: from host3.o27bbn.ondsl.gr (host3.o27bbn.ondsl.gr [79.129.74.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6603A9636
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.129.74.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802187; cv=none; b=bY9Q3cAuAIl0xkOthIsTSZUL0J55/aolzW5dd/9De4F7mTNGZ7iI8+a86Cpc9PZRIZhZd7GjCy6oSAgfqcmZVNai7bFRm6Z1o00CINP/j1k08+ZNst6IJUPDDZsw5E397uqZxQaRHliWw4eqJ7r6b0a8natnGRyRww+ekMkuhc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802187; c=relaxed/simple;
	bh=wWb8d+K/uOwMCUxQ4Pbo/GOt1HnCYUoW6iCjYG233uw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SidsqSo/FwhzebZae5q212uflHSku+hIo6EDCCQInrR78iLEBsEf/j+w3CwICLDJj+K+EoRRWSyAZEhhQC09P+ynRQrBzns5fEaAnuypcfDBjvhHcsKY84NvaUes9HswXxMHzk7RDpqnmFLuqKpWWkF1GBPFTTXDBhpSYPpecDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=e-psn.eu; spf=pass smtp.mailfrom=e-psn.eu; dkim=pass (2048-bit key) header.d=e-psn.eu header.i=@e-psn.eu header.b=WnipDGmi; arc=none smtp.client-ip=79.129.74.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=e-psn.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=e-psn.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=e-psn.eu header.i=@e-psn.eu header.b="WnipDGmi"
Received: from fed-dev01.e-psn.eu (unknown [10.200.200.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.e-psn.eu (Postfix) with ESMTPSA id A968A3842BDB;
	Mon, 12 Oct 2026 10:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=e-psn.eu; s=default;
	t=1791801811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R3u/xoF0WTJ6scNnLunH/qa/admVdlhl+wAKEfumpCw=;
	b=WnipDGmiyrfkrr+qo6mwqXWYUeVF6HwBBq1o9y4Z8FbUr6u0ejynnrjBIwhnooIF30QWYa
	42FAYA48Mxz7qeRgBg4nNk35NhT1x4jBYGFMI9afaGlhBuDe/6GjzgOwHG6PRZyG7r4nNM
	mPYani/mNgivLqAbMPRSrsQ6+mWllxIiWt8iAVzU+kaYj1TKyHT5UK6usrT1IMiLPPDV7B
	ZWb0VQhLtpp6CHMUmmlBqhhC/6j1rsTVGNK7m+kN5ydBaK5eu4iZNgrUdfQU0u1t0wAPny
	IfuScAvORqzRIauHTiBkz9AHcWCzLt1Dlk8GE0O5axJGwbBuHzSahdSPcFuxag==
From: Constantinos Chalkias <cch@e-psn.eu>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe/hwmon: refresh Battlemage thermal telemetry under force-wake
Date: Mon, 12 Oct 2026 13:42:45 +0300
Message-ID: <20261012104245.2108030-1-cch@e-psn.eu>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Flag-Threshold: 6

On Battlemage, thermal telemetry can remain stale after the GT returns
to RC6 following sustained workloads.

On an Intel Arc Pro B70, package and VRAM temperature telemetry may stop
refreshing after a long inference workload. Fan telemetry can also
become invalid while the physical blower remains elevated.

Acquire the GT force-wake domain around Battlemage thermal MMIO reads
and allow a short settling interval before reading the register. Route
package, VRAM and VRAM-channel availability reads through the helper.

Testing showed that an immediate read, as well as a 100-300 us delay,
could leave telemetry stale. A 500-1000 us delay recovered correctly
across repeated inference-to-idle cycles.

The change is restricted to Battlemage, where the behavior has been
reproduced and validated.

Signed-off-by: Constantinos Chalkias <cch@e-psn.eu>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 51 ++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5edeac961ec3..fee358ab9a6b 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -3,6 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/delay.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/hwmon.h>
 #include <linux/jiffies.h>
@@ -14,6 +15,7 @@
 #include "regs/xe_mchbar_regs.h"
 #include "regs/xe_pcode_regs.h"
 #include "xe_device.h"
+#include "xe_force_wake.h"
 #include "xe_hwmon.h"
 #include "xe_mmio.h"
 #include "xe_pcode.h"
@@ -946,14 +948,43 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
 	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
 }
 
-static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
+static int xe_hwmon_temp_mmio_read(struct xe_hwmon *hwmon,
+				   struct xe_reg reg, u32 *reg_val)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
+
+	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
+		struct xe_gt *gt = xe_root_mmio_gt(hwmon->xe);
+
+		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+
+		if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
+			return -ETIMEDOUT;
+
+		/*
+		 * Allow thermal telemetry to refresh after leaving RC6
+		 * before reading the temperature register.
+		 */
+		usleep_range(500, 1000);
+
+		*reg_val = xe_mmio_read32(mmio, reg);
+		return 0;
+	}
+
+	*reg_val = xe_mmio_read32(mmio, reg);
+
+	return 0;
+}
+
+static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
+{
 	int vram_id = channel - CHANNEL_VRAM_N;
 	struct xe_reg vram_reg;
+	u32 reg_val;
 
 	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
-	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
+	if (!xe_reg_is_valid(vram_reg) ||
+	    xe_hwmon_temp_mmio_read(hwmon, vram_reg, &reg_val) || !reg_val)
 		return false;
 
 	/* Create label only for available vram channel */
@@ -1025,15 +1056,19 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 static int
 xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 {
-	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
-	u64 reg_val;
+	u32 reg_val;
+	int ret;
 
 	switch (attr) {
 	case hwmon_temp_input:
 		switch (channel) {
 		case CHANNEL_PKG:
 		case CHANNEL_VRAM:
-			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
+			ret = xe_hwmon_temp_mmio_read(hwmon,
+						      xe_hwmon_get_reg(hwmon, REG_TEMP, channel),
+						      &reg_val);
+			if (ret)
+				return ret;
 
 			/* HW register value is in degrees Celsius, convert to millidegrees. */
 			*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
@@ -1043,7 +1078,11 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 		case CHANNEL_PCIE:
 			return get_pcie_temp(hwmon, val);
 		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
-			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
+			ret = xe_hwmon_temp_mmio_read(hwmon,
+						      xe_hwmon_get_reg(hwmon, REG_TEMP, channel),
+						      &reg_val);
+			if (ret)
+				return ret;
 			/*
 			 * This temperature format is 24 bit [31:8] signed integer and 8 bit
 			 * [7:0] fraction.
-- 
2.56.0

