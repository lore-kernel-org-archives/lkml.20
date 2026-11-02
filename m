Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611531;
	b=gRxfHQ9IGk7dBToQ18C4B6uOMs+hc+tguLbvrgltXNcxjephSq8klu65gnvEiyB/8sZ0
	 zg8J0dCi2IkPBD9XijI2lw3TzVDPE6SFWlDhQXJcUWdCJtMzy7AMPTCVrFNzOd+c6vu19
	 hX0hci+yK59xVZU7LrlWAy6J0DLukghJEhQhln0Sg++Tqv7R9LePTtBz+Xk1OKIo0j7uY
	 6U5UnpVb90xJEuI9px2pgQla6sXq6oci6kXCm+x/FAIhxgTl6sDMXG5PLKe8kl0Xp6r+J
	 IaGfYDcfP7diP+6mB1en/5OFU90cbZLKNtCF/ti0ECFHTHLcnjSKtZoMljTomTLV1+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611531;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=lTjwY/2+/7AIo5B3ljUNqvFl2P2GrkRvV7sOf6/FKhc=;
	b=iRQ/0vCfDHiBnOCLqxQ8iuHINNKVTOQTtZ6i0dtSVqIxSYAcAnRQBuzNnbm3cwm4WWbU
	 Zgalfkr8vFJKzGRuaa8W0WjJgJuq2HvrDgbzyBGW08Y+pE5kSAthbGZQPQCdbE+mWe3+U
	 RJSkxohATOwbcNiIYglNcGe5b3DmnLrcWZp2F5ekNJ5e1XXqC6P9hY6KqTOaCWgljj53u
	 1JatMmVBSQr26tI+fpsqOwPpPnkzHBpXs4usfk7SCTx097DlzPcZQrT4ONh8sqYLbCyEC
	 q7+Mjye4DADMD6JSTDDqTWFAAcIzzM3jjQtzgC9uIjdl3jFiJ6uezNj9wASyrlgI+8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ElrDBMTT;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E71360A261B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E71360A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ElrDBMTT
X-UUID: 54791432d69f11f18dc8c9802ae25ab1-20261102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lTjwY/2+/7AIo5B3ljUNqvFl2P2GrkRvV7sOf6/FKhc=;
	b=ElrDBMTTFLF3NC5YZeyHB6IYbG+6/RkLH9Z2NwMI8tEjZTAdgvoA+qWDQlnPeaczpP9Lt+MKeLcI8pa2C/0peItAfp1N0kwnELNLbeymnw4JWLyjfcLry5EhEfY9hsmNT6mXq6mKxTMT/Wh4xL2mbm4VoomX3zseLSylCbhT/gA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:cbc7495e-ffb7-496c-80de-676699ede5af,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:589d4cbb-4006-44bb-949c-6e25a7b8dad4,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 54791432d69f11f18dc8c9802ae25ab1-20261102
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 845725033; Mon, 02 Nov 2026 17:25:23 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
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
Subject: [RFC PATCH 09/11] soc: mediatek: dram-ecc: add a generic netlink event interface
Date: Mon, 2 Nov 2026 17:23:31 +0800
Message-ID: <20261102092334.138759-10-santino.wang@mediatek.com>
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

Multicast every decoded corrected and uncorrectable error to user
space through a generic netlink family, so a monitoring daemon can
subscribe to events instead of polling the counters.

Signed-off-by: Santino Wang <santino.wang@mediatek.com>
---
 drivers/soc/mediatek/dram-ecc/core/Makefile   |  1 +
 .../mediatek/dram-ecc/core/ghes_notifier.c    |  3 +
 drivers/soc/mediatek/dram-ecc/core/main.c     | 10 ++-
 drivers/soc/mediatek/dram-ecc/core/netlink.c  | 83 +++++++++++++++++++
 drivers/soc/mediatek/dram-ecc/core/netlink.h  | 14 ++++
 include/uapi/linux/mtk_dram_ecc_netlink.h     | 44 ++++++++++
 6 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/netlink.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/netlink.h
 create mode 100644 include/uapi/linux/mtk_dram_ecc_netlink.h

diff --git a/drivers/soc/mediatek/dram-ecc/core/Makefile b/drivers/soc/mediatek/dram-ecc/core/Makefile
index 7c973831c9ef..1e2764914e9c 100644
--- a/drivers/soc/mediatek/dram-ecc/core/Makefile
+++ b/drivers/soc/mediatek/dram-ecc/core/Makefile
@@ -6,6 +6,7 @@ mtk_dram_ecc-y := \
 	main.o \
 	smc.o \
 	ghes_notifier.o \
+	netlink.o \
 	trace.o \
 	counters.o \
 	addresses.o \
diff --git a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
index a010ca652e86..701b0b28d358 100644
--- a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
+++ b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
@@ -28,6 +28,7 @@
 #include "mtk_dram_ecc_event.h"
 #include "ghes_notifier.h"
 #include "counters.h"
+#include "netlink.h"
 #include "policy/policy.h"
 #include "trace.h"
 
@@ -256,6 +257,7 @@ static int mtk_ghes_vendor_cb(struct notifier_block *nb, unsigned long severity,
 		if (ret == NOTIFY_BAD)
 			pr_warn_ratelimited("mtk-dram-ecc: kernel client rejected CE event for spa=0x%llx\n",
 					    evt.spa);
+		mtk_dram_ecc_netlink_notify(&evt);
 	} else {
 		unsigned long pfn = evt.spa >> PAGE_SHIFT;
 
@@ -305,6 +307,7 @@ static int mtk_ghes_vendor_cb(struct notifier_block *nb, unsigned long severity,
 		if (ret == NOTIFY_BAD)
 			pr_warn_ratelimited("mtk-dram-ecc: kernel client rejected UCE event for spa=0x%llx\n",
 					    evt.spa);
+		mtk_dram_ecc_netlink_notify(&evt);
 	}
 
 	return NOTIFY_OK;
diff --git a/drivers/soc/mediatek/dram-ecc/core/main.c b/drivers/soc/mediatek/dram-ecc/core/main.c
index 315bdcbd650a..320631b3a044 100644
--- a/drivers/soc/mediatek/dram-ecc/core/main.c
+++ b/drivers/soc/mediatek/dram-ecc/core/main.c
@@ -10,6 +10,7 @@
 #include "ghes_notifier.h"
 #include "counters.h"
 #include "addresses.h"
+#include "netlink.h"
 #include "trace.h"
 
 static struct class *mtk_dram_ecc_class;
@@ -37,10 +38,14 @@ static int __init mtk_dram_ecc_init(void)
 		goto err_class;
 	}
 
-	ret = mtk_dram_ecc_policy_init(mtk_dram_ecc_dev);
+	ret = mtk_dram_ecc_netlink_init();
 	if (ret)
 		goto err_dev;
 
+	ret = mtk_dram_ecc_policy_init(mtk_dram_ecc_dev);
+	if (ret)
+		goto err_netlink;
+
 	ret = mtk_dram_ecc_counters_init(&mtk_dram_ecc_dev->kobj);
 	if (ret)
 		goto err_policy;
@@ -68,6 +73,8 @@ static int __init mtk_dram_ecc_init(void)
 	mtk_dram_ecc_counters_exit();
 err_policy:
 	mtk_dram_ecc_policy_exit(mtk_dram_ecc_dev);
+err_netlink:
+	mtk_dram_ecc_netlink_exit();
 err_dev:
 	device_destroy(mtk_dram_ecc_class, MKDEV(0, 0));
 err_class:
@@ -86,6 +93,7 @@ static void __exit mtk_dram_ecc_exit(void)
 	mtk_dram_ecc_addresses_exit();
 	mtk_dram_ecc_counters_exit();
 	mtk_dram_ecc_policy_exit(mtk_dram_ecc_dev);
+	mtk_dram_ecc_netlink_exit();
 	device_destroy(mtk_dram_ecc_class, MKDEV(0, 0));
 	class_destroy(mtk_dram_ecc_class);
 	trace_mtk_dram_ecc_lifecycle(1);
diff --git a/drivers/soc/mediatek/dram-ecc/core/netlink.c b/drivers/soc/mediatek/dram-ecc/core/netlink.c
new file mode 100644
index 000000000000..bad96bbe4ed6
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/netlink.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#include <linux/module.h>
+#include <linux/errno.h>
+#include <linux/netlink.h>
+#include <linux/printk.h>
+#include <net/genetlink.h>
+#include <uapi/linux/mtk_dram_ecc_netlink.h>
+
+#include "mtk_dram_ecc_event.h"
+#include "netlink.h"
+
+static const struct genl_multicast_group mtk_dram_ecc_mcgrps[] = {
+	{ .name = MTK_DRAM_ECC_MCAST_GRP },
+};
+
+static struct genl_family mtk_dram_ecc_genl_family = {
+	.name      = MTK_DRAM_ECC_GENL_NAME,
+	.version   = MTK_DRAM_ECC_GENL_VERSION,
+	.maxattr   = MTK_DRAM_ECC_ATTR_MAX,
+	.mcgrps    = mtk_dram_ecc_mcgrps,
+	.n_mcgrps  = ARRAY_SIZE(mtk_dram_ecc_mcgrps),
+	.module    = THIS_MODULE,
+};
+
+int mtk_dram_ecc_netlink_init(void)
+{
+	return genl_register_family(&mtk_dram_ecc_genl_family);
+}
+
+void mtk_dram_ecc_netlink_exit(void)
+{
+	genl_unregister_family(&mtk_dram_ecc_genl_family);
+}
+
+void mtk_dram_ecc_netlink_notify(const struct mtk_dram_ecc_event *evt)
+{
+	struct sk_buff *skb;
+	void *hdr;
+	int ret;
+	u8 severity;
+
+	skb = genlmsg_new(NLMSG_GOODSIZE, GFP_ATOMIC);
+	if (!skb) {
+		pr_warn_ratelimited("mtk-dram-ecc: failed to allocate netlink event for spa=0x%llx\n",
+				    evt->spa);
+		return;
+	}
+
+	hdr = genlmsg_put(skb, 0, 0, &mtk_dram_ecc_genl_family, 0,
+			  MTK_DRAM_ECC_CMD_EVENT);
+	if (!hdr)
+		goto err;
+
+	severity = (evt->severity == MTK_DRAM_ECC_NOTIFY_CE) ?
+		   MTK_DRAM_ECC_SEV_CE : MTK_DRAM_ECC_SEV_UCE;
+
+	if (nla_put_u64_64bit(skb, MTK_DRAM_ECC_ATTR_SPA, evt->spa,
+			      MTK_DRAM_ECC_ATTR_UNSPEC) ||
+	    nla_put_u8(skb, MTK_DRAM_ECC_ATTR_SEVERITY, severity) ||
+	    nla_put_u8(skb, MTK_DRAM_ECC_ATTR_CHANNEL, evt->channel) ||
+	    nla_put_u8(skb, MTK_DRAM_ECC_ATTR_SUBCHANNEL, evt->subchannel) ||
+	    nla_put_u16(skb, MTK_DRAM_ECC_ATTR_RANK, evt->rank) ||
+	    nla_put_u16(skb, MTK_DRAM_ECC_ATTR_BANK, evt->bank) ||
+	    nla_put_u32(skb, MTK_DRAM_ECC_ATTR_ROW, evt->row) ||
+	    nla_put_u16(skb, MTK_DRAM_ECC_ATTR_COLUMN, evt->column))
+		goto err;
+
+	genlmsg_end(skb, hdr);
+	ret = genlmsg_multicast(&mtk_dram_ecc_genl_family, skb, 0, 0,
+				GFP_ATOMIC);
+	if (ret && ret != -ESRCH)
+		pr_warn_ratelimited("mtk-dram-ecc: failed to publish netlink event for spa=0x%llx: %d\n",
+				    evt->spa, ret);
+	return;
+
+err:
+	pr_warn_ratelimited("mtk-dram-ecc: failed to build netlink event for spa=0x%llx\n",
+			    evt->spa);
+	nlmsg_free(skb);
+}
diff --git a/drivers/soc/mediatek/dram-ecc/core/netlink.h b/drivers/soc/mediatek/dram-ecc/core/netlink.h
new file mode 100644
index 000000000000..a2e64789d7d7
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/netlink.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#ifndef _MTK_DRAM_ECC_NETLINK_H_
+#define _MTK_DRAM_ECC_NETLINK_H_
+
+#include "mtk_dram_ecc_event.h"
+
+int mtk_dram_ecc_netlink_init(void);
+void mtk_dram_ecc_netlink_exit(void);
+void mtk_dram_ecc_netlink_notify(const struct mtk_dram_ecc_event *evt);
+
+#endif /* _MTK_DRAM_ECC_NETLINK_H_ */
diff --git a/include/uapi/linux/mtk_dram_ecc_netlink.h b/include/uapi/linux/mtk_dram_ecc_netlink.h
new file mode 100644
index 000000000000..8b4a77722bdb
--- /dev/null
+++ b/include/uapi/linux/mtk_dram_ecc_netlink.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#ifndef _UAPI_MTK_DRAM_ECC_NETLINK_H_
+#define _UAPI_MTK_DRAM_ECC_NETLINK_H_
+
+#define MTK_DRAM_ECC_GENL_NAME    "mtk_dram_ecc"
+#define MTK_DRAM_ECC_GENL_VERSION 1
+#define MTK_DRAM_ECC_MCAST_GRP    "events"
+
+/* Commands */
+enum mtk_dram_ecc_cmd {
+	MTK_DRAM_ECC_CMD_UNSPEC,
+	MTK_DRAM_ECC_CMD_EVENT,
+	__MTK_DRAM_ECC_CMD_MAX,
+};
+
+#define MTK_DRAM_ECC_CMD_MAX (__MTK_DRAM_ECC_CMD_MAX - 1)
+
+/*
+ * Attributes. rank, bank, row and column are the DRAM controller address
+ * fields of the error.
+ */
+enum mtk_dram_ecc_attr {
+	MTK_DRAM_ECC_ATTR_UNSPEC,
+	MTK_DRAM_ECC_ATTR_SPA,       /* u64 - System Physical Address */
+	MTK_DRAM_ECC_ATTR_SEVERITY,  /* u8  - 0=CE, 1=UCE */
+	MTK_DRAM_ECC_ATTR_CHANNEL,   /* u8  - DRAM channel index */
+	MTK_DRAM_ECC_ATTR_SUBCHANNEL, /* u8  - DRAM sub-channel, 0 or 1 */
+	MTK_DRAM_ECC_ATTR_RANK,      /* u16 - DRAMC rank address */
+	MTK_DRAM_ECC_ATTR_BANK,      /* u16 - DRAMC bank address */
+	MTK_DRAM_ECC_ATTR_ROW,       /* u32 - DRAMC row address */
+	MTK_DRAM_ECC_ATTR_COLUMN,    /* u16 - DRAMC column address */
+	__MTK_DRAM_ECC_ATTR_MAX,
+};
+
+#define MTK_DRAM_ECC_ATTR_MAX (__MTK_DRAM_ECC_ATTR_MAX - 1)
+
+/* Severity values for MTK_DRAM_ECC_ATTR_SEVERITY */
+#define MTK_DRAM_ECC_SEV_CE  0
+#define MTK_DRAM_ECC_SEV_UCE 1
+
+#endif /* _UAPI_MTK_DRAM_ECC_NETLINK_H_ */
-- 
2.45.2

