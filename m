Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611528;
	b=g/B2YUo3LfxbdsU4zRjMnUfgFcU/et/Tt7yfNMwE49T3/YH6R2JhHUy1zLe6yiSowYaj
	 2Z2YzI5Grb+ha+Q9n8T7zkPyx5Eqp+vgzUZf9fozt2nVV9m271//0XahVVFNspmNNHU62
	 RUXC5l3AAd6O9YpJSzlypOuCkm92DNWz01e0MzwEBZ19Y0RoCOxaRDnyScV0Ctd9xNw0L
	 FEp1EoP4HvEQZrosFwRAdxusMJuE3HbeaHgGpVJZ2VEsKYkM6MXGHJ3BsrMjEUO4w0/8z
	 Hyy8zAJ3MOyxBoNTp+eQaF+b+br5yB49PCb3pqIoWbmgjnmu/WQLDfu10324aXuTIyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611528;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=182aLtUQDl6yVrGFjZWHHz/4bfGcfBF8JMLKZaHXAYg=;
	b=WXPT9NTW82SPsWALrVwo40jv7xntbD6mx2lDBoHZHfkMIIM+ie8CVM05T5Aq+POkuSb8
	 oCwxcpb+QfOgejZWUK7NzORvoElJWf469Q8aeSeRqTExtciwVnV+mXmteJZhkmhRqhlXz
	 qJ0xiVBMmuqqT5N3/xlFlTFseGGD0J2v6PSvCLaokUb7w/5QDHIlcvFCLdWfIeEwg67Se
	 vZPtY3LvTVvgP05oiB7a3Lx7I9qED6e1q0nOYOJGTxnubcBFUdot/FRcjYSbRurWwUL6z
	 muRESf2oxl63loTUIo0fJ5uT4uPTST5B+zdBSdbYGatJ7aEsgfSFg6GFypgSEx73jwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fG0zrikB;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB090606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB090606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fG0zrikB
X-UUID: 54134526d69f11f18dc8c9802ae25ab1-20261102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=182aLtUQDl6yVrGFjZWHHz/4bfGcfBF8JMLKZaHXAYg=;
	b=fG0zrikBP8S3c2fiLFaZVyZ9oEOTAKs0LlKRsb2VkwoqAfRkX+S/IWDKC+4hcdKZHX4iEUdBkU49lv37P6ZhYHmnDOTpvyOJtFi2fKB8n808Hr0styghDc1W7zqQU0ORcp3Nr28adnpc2TzaAdBWJ4jfQnwb8+EflGlSx4OLaKI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:ae4a73ea-4a34-4733-8bce-8118bfdbfdcd,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:d6f1a340-45ea-40f0-99fe-3ce442058644,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 54134526d69f11f18dc8c9802ae25ab1-20261102
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1770064451; Mon, 02 Nov 2026 17:25:22 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Nov 2026 17:25:21 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Nov 2026 17:25:21 +0800
From: santino.wang <santino.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
	<arnab.layek@mediatek.com>, Santino Wang <santino.wang@mediatek.com>
Subject: [RFC PATCH 03/11] soc: mediatek: dram-ecc: add tracepoints
Date: Mon, 2 Nov 2026 17:23:25 +0800
Message-ID: <20261102092334.138759-4-santino.wang@mediatek.com>
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

Add tracepoints for the driver lifecycle, corrected and uncorrectable
errors, and page retirement, so error handling can be followed with
ftrace without relying on the kernel log.

Signed-off-by: Santino Wang <santino.wang@mediatek.com>
---
 drivers/soc/mediatek/dram-ecc/core/Makefile |   5 +-
 drivers/soc/mediatek/dram-ecc/core/main.c   |   3 +
 drivers/soc/mediatek/dram-ecc/core/trace.c  |   6 +
 drivers/soc/mediatek/dram-ecc/core/trace.h  | 119 ++++++++++++++++++++
 4 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/trace.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/trace.h

diff --git a/drivers/soc/mediatek/dram-ecc/core/Makefile b/drivers/soc/mediatek/dram-ecc/core/Makefile
index 429347bfd057..66ce5d306a45 100644
--- a/drivers/soc/mediatek/dram-ecc/core/Makefile
+++ b/drivers/soc/mediatek/dram-ecc/core/Makefile
@@ -4,4 +4,7 @@ obj-$(CONFIG_MTK_DRAM_ECC) += mtk_dram_ecc.o
 
 mtk_dram_ecc-y := \
 	main.o \
-	smc.o
+	smc.o \
+	trace.o
+
+CFLAGS_trace.o := -I$(src)
diff --git a/drivers/soc/mediatek/dram-ecc/core/main.c b/drivers/soc/mediatek/dram-ecc/core/main.c
index 5000d1f3c7e3..ce6bd39fa303 100644
--- a/drivers/soc/mediatek/dram-ecc/core/main.c
+++ b/drivers/soc/mediatek/dram-ecc/core/main.c
@@ -7,6 +7,7 @@
 #include <linux/device/class.h>
 
 #include "mtk_dram_ecc.h"
+#include "trace.h"
 
 static struct class *mtk_dram_ecc_class;
 static struct device *mtk_dram_ecc_dev;
@@ -33,6 +34,7 @@ static int __init mtk_dram_ecc_init(void)
 		goto err_class;
 	}
 
+	trace_mtk_dram_ecc_lifecycle(0);
 	dev_info(mtk_dram_ecc_dev, "initialized\n");
 	return 0;
 
@@ -45,6 +47,7 @@ static void __exit mtk_dram_ecc_exit(void)
 {
 	device_destroy(mtk_dram_ecc_class, MKDEV(0, 0));
 	class_destroy(mtk_dram_ecc_class);
+	trace_mtk_dram_ecc_lifecycle(1);
 }
 
 module_init(mtk_dram_ecc_init);
diff --git a/drivers/soc/mediatek/dram-ecc/core/trace.c b/drivers/soc/mediatek/dram-ecc/core/trace.c
new file mode 100644
index 000000000000..9a8b20e48069
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/trace.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#define CREATE_TRACE_POINTS
+#include "trace.h"
diff --git a/drivers/soc/mediatek/dram-ecc/core/trace.h b/drivers/soc/mediatek/dram-ecc/core/trace.h
new file mode 100644
index 000000000000..d603fc38f0a7
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/trace.h
@@ -0,0 +1,119 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM mtk_dram_ecc
+
+#if !defined(_TRACE_MTK_DRAM_ECC_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_MTK_DRAM_ECC_H
+
+#include <linux/tracepoint.h>
+
+/* driver lifecycle - state: 0=init, 1=exit */
+
+TRACE_EVENT(mtk_dram_ecc_lifecycle,
+	TP_PROTO(int state),
+	TP_ARGS(state),
+	TP_STRUCT__entry(
+		__field(int, state)
+	),
+	TP_fast_assign(
+		__entry->state = state;
+	),
+	TP_printk("%s", __entry->state ? "driver removed" : "driver initialized")
+);
+
+/*
+ * ECC events - spa/channel/subchannel/rank/bank/row/column decoded from the
+ * ECCERR_INFO0/1 entry that determined severity (see ghes_notifier.c),
+ * mirroring ATF dram_ecc/mt8992/fiq.c's decode. No agent/master ID: ATF's
+ * GHES vendor section doesn't compute them (see mtk_dram_ecc_event.h).
+ */
+
+TRACE_EVENT(mtk_dram_ecc_ce,
+	TP_PROTO(u64 spa, u8 channel, u8 subch, u16 rank, u16 bank, u32 row,
+		 u16 column),
+	TP_ARGS(spa, channel, subch, rank, bank, row, column),
+	TP_STRUCT__entry(
+		__field(u64, spa)
+		__field(u8, channel)
+		__field(u8, subch)
+		__field(u16, rank)
+		__field(u16, bank)
+		__field(u32, row)
+		__field(u16, column)
+	),
+	TP_fast_assign(
+		__entry->spa     = spa;
+		__entry->channel = channel;
+		__entry->subch   = subch;
+		__entry->rank    = rank;
+		__entry->bank    = bank;
+		__entry->row     = row;
+		__entry->column  = column;
+	),
+	TP_printk("spa=0x%016llx ch=%u subch=%u rank=%u bank=%u row=%u column=%u",
+		  __entry->spa, __entry->channel, __entry->subch,
+		  __entry->rank, __entry->bank, __entry->row,
+		  __entry->column)
+);
+
+TRACE_EVENT(mtk_dram_ecc_uce,
+	TP_PROTO(u64 spa, u8 channel, u8 subch, u16 rank, u16 bank, u32 row,
+		 u16 column),
+	TP_ARGS(spa, channel, subch, rank, bank, row, column),
+	TP_STRUCT__entry(
+		__field(u64, spa)
+		__field(u8, channel)
+		__field(u8, subch)
+		__field(u16, rank)
+		__field(u16, bank)
+		__field(u32, row)
+		__field(u16, column)
+	),
+	TP_fast_assign(
+		__entry->spa     = spa;
+		__entry->channel = channel;
+		__entry->subch   = subch;
+		__entry->rank    = rank;
+		__entry->bank    = bank;
+		__entry->row     = row;
+		__entry->column  = column;
+	),
+	TP_printk("spa=0x%016llx ch=%u subch=%u rank=%u bank=%u row=%u column=%u",
+		  __entry->spa, __entry->channel, __entry->subch,
+		  __entry->rank, __entry->bank, __entry->row,
+		  __entry->column)
+);
+
+/* page retire */
+
+TRACE_EVENT(mtk_dram_ecc_page_retire,
+	TP_PROTO(u64 pfn, u32 count, u32 threshold, bool retired),
+	TP_ARGS(pfn, count, threshold, retired),
+	TP_STRUCT__entry(
+		__field(u64,  pfn)
+		__field(u32,  count)
+		__field(u32,  threshold)
+		__field(bool, retired)
+	),
+	TP_fast_assign(
+		__entry->pfn       = pfn;
+		__entry->count     = count;
+		__entry->threshold = threshold;
+		__entry->retired   = retired;
+	),
+	TP_printk("pfn=0x%llx count=%u threshold=%u retired=%s",
+		  __entry->pfn, __entry->count, __entry->threshold,
+		  __entry->retired ? "yes" : "no")
+);
+
+#endif /* _TRACE_MTK_DRAM_ECC_H */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace
+
+#include <trace/define_trace.h>
-- 
2.45.2

