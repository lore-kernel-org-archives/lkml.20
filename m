Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611529;
	b=u33IB8c9YpJdBgYE6/MdwTSro4fQYY4Cng2EW0nbGwuZ+vJsOgR/y+wm7prBsithzEG2
	 R6QRpN4DGFWvzHprmBkYJdWlwRgQagAKVdVzePMENv3TGhcn16Y75h9I0qtYIcwWgx4YL
	 wgjrx2ifwkf1Nyu9Ts4yhRVHzpaz6FeogY29Q4HEoLEnRWOWAduaRfn45SSlm9RvJjFR2
	 xxr+ORBE7Ljs5h0+jiSTCrpDCnv/Hd89FLOoJ+o9476kw63TUtD6VnKYwOFsna/Gq1GK4
	 xJ35WlfNqmeAFGanJ1KyPuy8I/BSYM2hYqUfm4cFRNfcqU04w6psDHaT9NuRSpkPVAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611529;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=sjHZhQzE15Kt9KXOlQ3oT44i9YD+vnyIxOdIg0SdHR0=;
	b=M01ptgy8EeEd1rjMeUbq6Tsh01Mo8XvbSyPRD0tTyS/l+0E2z2urzjPWGfwd9eSrs5Km
	 nntc8TLGbp50kY1NY6vJOVshPY8VjUWDiy4xCg1LlRmUF7YN0bwFjUoNV44H/0GrqeFaT
	 +ChWX12pmO0WY0IoGd1aKZzBBAj8K6opJQsSEPiksf8p1BiFljR/wIWOU2C8jU/qc3qPd
	 mgAP3wRTSDqMYubewkRzF/BKVidP5BqqnkFJ46ge6BToCNAzA1MjnFRDa6OHnERlGi8JI
	 I6nIT5MvWibB9wONat3B/s/FAL4SosIpWCEvdxOM4NS4rEF/4Mp14ET0JF+eCcpSuRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=byXqQID0;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FE8606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36FE8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=byXqQID0
X-UUID: 53ed7648d69f11f18dc8c9802ae25ab1-20261102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sjHZhQzE15Kt9KXOlQ3oT44i9YD+vnyIxOdIg0SdHR0=;
	b=byXqQID07K5jkv+W0gkS7U9x3gR9YdYkHCr5e5LV+BOXb4sotWuUwl9TForvwQmZxt3fW4yMZ0/I0H4kj5EnP3FAEVn5qIwD9UIw6PZIz8SZ0DrZi+MPFA6HSaUXhWdqio8T8NDHf5kDAoMRf+bBSnXfpaC6hDz9STehY6TCyyE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:03811a32-e754-4127-ac23-07b5fc4e91b7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:cd3602ee-6961-456c-adce-6d277e14e6ad,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 53ed7648d69f11f18dc8c9802ae25ab1-20261102
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1353858474; Mon, 02 Nov 2026 17:25:22 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Nov 2026 17:25:20 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Nov 2026 17:25:20 +0800
From: santino.wang <santino.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
	<arnab.layek@mediatek.com>, Santino Wang <santino.wang@mediatek.com>
Subject: [RFC PATCH 02/11] soc: mediatek: dram-ecc: add the SMC interface to the secure firmware
Date: Mon, 2 Nov 2026 17:23:24 +0800
Message-ID: <20261102092334.138759-3-santino.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102092334.138759-1-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
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
Content-Type: text/plain
X-MTK: N

From: Santino Wang <santino.wang@mediatek.com>

The error containment policy and the CE storm protection are enforced
by the secure firmware. Add helpers that read and write the
corresponding settings through vendor-specific SMC calls, so the
sysfs attributes added by later patches can configure them.

Nothing calls these helpers yet.

Signed-off-by: Santino Wang <santino.wang@mediatek.com>
---
 drivers/soc/mediatek/dram-ecc/core/Makefile |   3 +-
 drivers/soc/mediatek/dram-ecc/core/smc.c    | 137 ++++++++++++++++++++
 drivers/soc/mediatek/dram-ecc/core/smc.h    |  55 ++++++++
 3 files changed, 194 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/smc.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/smc.h

diff --git a/drivers/soc/mediatek/dram-ecc/core/Makefile b/drivers/soc/mediatek/dram-ecc/core/Makefile
index 77751c836027..429347bfd057 100644
--- a/drivers/soc/mediatek/dram-ecc/core/Makefile
+++ b/drivers/soc/mediatek/dram-ecc/core/Makefile
@@ -3,4 +3,5 @@
 obj-$(CONFIG_MTK_DRAM_ECC) += mtk_dram_ecc.o
 
 mtk_dram_ecc-y := \
-	main.o
+	main.o \
+	smc.o
diff --git a/drivers/soc/mediatek/dram-ecc/core/smc.c b/drivers/soc/mediatek/dram-ecc/core/smc.c
new file mode 100644
index 000000000000..1f7a195d8b58
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/smc.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#include <linux/arm-smccc.h>
+#include <linux/errno.h>
+
+#include "smc.h"
+
+static int smc_set(u64 subcmd, u64 val)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(MTK_SIP_DRAM_ECC_SET_POLICY_AARCH64,
+		      subcmd, val, 0, 0, 0, 0, 0, &res);
+	return (int)(long)res.a0;
+}
+
+static int smc_get(u64 subcmd, u64 *val)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(MTK_SIP_DRAM_ECC_SET_POLICY_AARCH64,
+		      subcmd, 0, 0, 0, 0, 0, 0, &res);
+	if ((int)(long)res.a0 != 0)
+		return (int)(long)res.a0;
+	*val = res.a1;
+	return 0;
+}
+
+int mtk_dram_ecc_smc_containment_set_enabled(bool enabled)
+{
+	return smc_set(MTK_ECC_SMC_CONTAINMENT_SET_ENABLED, enabled ? 1 : 0);
+}
+
+int mtk_dram_ecc_smc_containment_get_enabled(bool *enabled)
+{
+	u64 val;
+	int ret = smc_get(MTK_ECC_SMC_CONTAINMENT_GET_ENABLED, &val);
+
+	if (!ret)
+		*enabled = (val != 0);
+	return ret;
+}
+
+int mtk_dram_ecc_smc_containment_set_default_severity(bool recoverable)
+{
+	return smc_set(MTK_ECC_SMC_CONTAINMENT_SET_DEFAULT_SEVERITY, recoverable ? 1 : 0);
+}
+
+int mtk_dram_ecc_smc_containment_get_default_severity(bool *recoverable)
+{
+	u64 val;
+	int ret = smc_get(MTK_ECC_SMC_CONTAINMENT_GET_DEFAULT_SEVERITY, &val);
+
+	if (!ret)
+		*recoverable = (val != 0);
+	return ret;
+}
+
+int mtk_dram_ecc_smc_storm_set_threshold(u32 val)
+{
+	return smc_set(MTK_ECC_SMC_STORM_SET_THRESHOLD, val);
+}
+
+int mtk_dram_ecc_smc_storm_get_threshold(u32 *val)
+{
+	u64 v;
+	int ret = smc_get(MTK_ECC_SMC_STORM_GET_THRESHOLD, &v);
+
+	if (!ret)
+		*val = (u32)v;
+	return ret;
+}
+
+int mtk_dram_ecc_smc_storm_set_time_window(u32 val)
+{
+	return smc_set(MTK_ECC_SMC_STORM_SET_TIME_WINDOW, val);
+}
+
+int mtk_dram_ecc_smc_storm_get_time_window(u32 *val)
+{
+	u64 v;
+	int ret = smc_get(MTK_ECC_SMC_STORM_GET_TIME_WINDOW, &v);
+
+	if (!ret)
+		*val = (u32)v;
+	return ret;
+}
+
+int mtk_dram_ecc_smc_storm_set_cooldown(u32 val)
+{
+	return smc_set(MTK_ECC_SMC_STORM_SET_COOLDOWN, val);
+}
+
+int mtk_dram_ecc_smc_storm_get_cooldown(u32 *val)
+{
+	u64 v;
+	int ret = smc_get(MTK_ECC_SMC_STORM_GET_COOLDOWN, &v);
+
+	if (!ret)
+		*val = (u32)v;
+	return ret;
+}
+
+int mtk_dram_ecc_smc_range_add(u64 addr_from, u64 addr_to, bool recoverable)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(MTK_SIP_DRAM_ECC_SET_POLICY_AARCH64, MTK_ECC_SMC_RANGE_ADD,
+		      addr_from, addr_to, recoverable ? 1 : 0, 0, 0, 0, &res);
+	return (int)(long)res.a0;
+}
+
+int mtk_dram_ecc_smc_range_clear(void)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(MTK_SIP_DRAM_ECC_SET_POLICY_AARCH64, MTK_ECC_SMC_RANGE_CLEAR,
+		      0, 0, 0, 0, 0, 0, &res);
+	return (int)(long)res.a0;
+}
+
+int mtk_dram_ecc_smc_range_get(u32 index, u64 *addr_from, u64 *addr_to, bool *recoverable)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(MTK_SIP_DRAM_ECC_SET_POLICY_AARCH64, MTK_ECC_SMC_RANGE_GET,
+		      index, 0, 0, 0, 0, 0, &res);
+	if ((int)(long)res.a0 != 0)
+		return -ENOENT;
+
+	*addr_from = res.a1;
+	*addr_to = res.a2;
+	*recoverable = (res.a3 != 0);
+	return 0;
+}
diff --git a/drivers/soc/mediatek/dram-ecc/core/smc.h b/drivers/soc/mediatek/dram-ecc/core/smc.h
new file mode 100644
index 000000000000..712c01d28bf4
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/smc.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#ifndef _MTK_DRAM_ECC_SMC_H_
+#define _MTK_DRAM_ECC_SMC_H_
+
+#include <linux/arm-smccc.h>
+
+#define MTK_SIP_DRAM_ECC_SET_POLICY_AARCH64 \
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64, \
+			   ARM_SMCCC_OWNER_SIP, 0x542)
+
+/*
+ * Sub-commands for MTK_SIP_DRAM_ECC_SET_POLICY:
+ *   x1 = sub-command
+ *   x2 = payload
+ *   return a0 = 0 on success, negative on error
+ *   return a1 = value (GET commands only)
+ */
+enum mtk_dram_ecc_smc_subcmd {
+	MTK_ECC_SMC_CONTAINMENT_SET_ENABLED          = 0,
+	MTK_ECC_SMC_CONTAINMENT_GET_ENABLED          = 1,
+	MTK_ECC_SMC_CONTAINMENT_SET_DEFAULT_SEVERITY = 2,
+	MTK_ECC_SMC_CONTAINMENT_GET_DEFAULT_SEVERITY = 3,
+	MTK_ECC_SMC_STORM_SET_THRESHOLD              = 4,
+	MTK_ECC_SMC_STORM_GET_THRESHOLD              = 5,
+	MTK_ECC_SMC_STORM_SET_TIME_WINDOW            = 6,
+	MTK_ECC_SMC_STORM_GET_TIME_WINDOW            = 7,
+	MTK_ECC_SMC_STORM_SET_COOLDOWN               = 8,
+	MTK_ECC_SMC_STORM_GET_COOLDOWN               = 9,
+	MTK_ECC_SMC_STORM_SET_FORCE_REENABLE         = 10,
+	MTK_ECC_SMC_RANGE_ADD                        = 11,
+	MTK_ECC_SMC_RANGE_CLEAR                      = 12,
+	MTK_ECC_SMC_RANGE_GET                        = 13,
+};
+
+int mtk_dram_ecc_smc_containment_set_enabled(bool enabled);
+int mtk_dram_ecc_smc_containment_get_enabled(bool *enabled);
+int mtk_dram_ecc_smc_containment_set_default_severity(bool recoverable);
+int mtk_dram_ecc_smc_containment_get_default_severity(bool *recoverable);
+int mtk_dram_ecc_smc_storm_set_threshold(u32 val);
+int mtk_dram_ecc_smc_storm_get_threshold(u32 *val);
+int mtk_dram_ecc_smc_storm_set_time_window(u32 val);
+int mtk_dram_ecc_smc_storm_get_time_window(u32 *val);
+int mtk_dram_ecc_smc_storm_set_cooldown(u32 val);
+int mtk_dram_ecc_smc_storm_get_cooldown(u32 *val);
+
+/* addr_from/addr_to: [addr_from, addr_to) range, recoverable: false=fatal/true=recoverable. */
+int mtk_dram_ecc_smc_range_add(u64 addr_from, u64 addr_to, bool recoverable);
+int mtk_dram_ecc_smc_range_clear(void);
+/* Returns -ENOENT if index has no entry (also signals end-of-table). */
+int mtk_dram_ecc_smc_range_get(u32 index, u64 *addr_from, u64 *addr_to, bool *recoverable);
+
+#endif /* _MTK_DRAM_ECC_SMC_H_ */
-- 
2.45.2

