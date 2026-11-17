Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794912691;
	b=wMDnNMxMDD2b11ELNXra1SYSrBeellNh88rfvhMOaTeRLOigxssqyScgMHGqq4/Sdg4q
	 JrmL/+sP3VjzwrRPrmK9p/cbPPIsUSWdbrWrQn1V0sUU+FXa2OqqBrzYXT6RH5cc3sNzV
	 R1rez2R6Ea/xvTBRNYQO60ixUbgjhVRa8M9Zb8w2n6JDYiARvYoooeq2mHI5lSXZf8Ztw
	 9n+3KGlXz1RTf/FAYsKEJRAqgFE3ZVwZJgqmgelxmE+7XfYTCyNsnp3dv/5bNEeEvxGfQ
	 fUyLUb6e4NU3j2Jv0BSBHIb2Ne3HSUpqV4AQYzjYiv1H2kSLkHcF1HfWP612eOUguYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912691;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nMlv9XAeG2Hk0P9SHGi5/gPZW8Mt6L5IUPtNELduYCs=;
	b=3BYVQ/h1dUBQIiO21rrz3kBX3XBB0MuTEz/YxVAzMNXgImscl4S14vaLZonih7MipsUy
	 h5cOlwPykpclJKuztiPKB9D5kA7pgMZVZzV7+uDbpgyFR9wXtcuMEWfiCEXSUmGJ74OfM
	 WGbCvqexDU/wR5fFJqKSnwusn1Aeb+CArSNLDEt1AD0kvT9oV5glg0tG6QxrJWPEKVHrb
	 JvZ172v6lZ37IJpVS4z4giM4AKFpPiiXfwsG/F0MVQNYZ9ESM37x7bYjy74moF8XQoF5c
	 k33Vz0d8F0n4BfJ2QzCwXPjODmcqIIvUNChjCOL/r8AUbwZcde6qulShWQsjq7R2dew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VLZ2FoDj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616A3606A32F;
	Tue, 17 Nov 2026 10:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VLZ2FoDj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794912691;
	b=nNpTW9sEfJ9FGBlqIhFMX/ZcA9PyZrRg125NpHUmuxqrO0tFjPgIdt9PrMzNR/brIDA4
	 7rt3jlJy/yPqFmgqje2nJTgM5TAA7HBvQzEhTGLIXxK19fQop5lnYFCGphDbcCleZZO2S
	 oJKC2KA9MKPGVYJSAU1EVHITqaFFdRe/Ad6sWd+xcYlZHoDm9p8KbLWr7X8puihTu7akO
	 GE2D+meC8mJ7rOO4IayAHXsHbFOgXXqx6PVk0U7s2Xk1nroFKHBpH6+xHxOsA8nhhtYSp
	 g96Jje8vWZvVRzN+BBCbyT6UPZ250NQs8iJH78PmfvasMh+JJr7I+s/6ohECOqvRtVQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794912691;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nMlv9XAeG2Hk0P9SHGi5/gPZW8Mt6L5IUPtNELduYCs=;
	b=e7ZZKYB8skz2jqKel4x0G/CriDVZ3Zjv/dgN34Nih/cGOAtm8HbDfoi6GGhXmB9hhxZD
	 wvdtL5b8yHbGYyaVdbyEKDdBldlBwh3l/ikSTOHnQbwwc6d1HMx86V/FAtqhayL1aImEY
	 D5VlAfrSyneR8IHhNrup5uV6YocUZy1XqfVhdTQyWp3+Ab1Rsn/8DEGQPZ8EdA949Uwax
	 M3B4GxZnlv6oD0klxsvfuVZb/Sq8AgaLG+S7jsl/Dw99Qiu48E4TTdElIJNlCc4yz0bFS
	 p6IF3Nre5HdIHq/kZ+ijsU10bO4kX58CQwSJYBK3JgTVuJ4lyIPGaAjWjTGxhwMLLYQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FC7D1F000CA;
	Tue, 17 Nov 2026 10:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794912691;
	bh=nMlv9XAeG2Hk0P9SHGi5/gPZW8Mt6L5IUPtNELduYCs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VLZ2FoDj6bg2tfV4JqL7u10vehqqVEg1HyoBwSZ2TmLBPaIwRjGTMlDRCnnO55ere
	 uwgzwf8uqcUbnyMrBmZGBea5BGYkXFsAOILSahn0zSkVNqsxd4Nr7LKH2UpDsKVwjl
	 j7ZDyP7EeZqPKUT+H/NbysFa5QWhX6gi+1qg/BwTWd1RpPB4peFhkNY4rnpKZT/V9m
	 Y3WKNdr0XlzqM1uybJP55N6eAATONzZDV16GdP8yrh+R83FiVXyGYDWcl0rzgh0aYS
	 yXR765LZY1A1/UbngzYDHzWjTMqkiTInOUiEmSMjAhYfTXl6+TqLm9QNajygIdMSnS
	 hkcoJstQcDRzA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C0FAC4A7B2;
	Tue, 17 Nov 2026 10:51:29 +0000 (UTC)
From: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Date: Tue, 17 Nov 2026 18:50:17 +0800
Subject: [PATCH net-next v12 2/6] net: wwan: t9xx: Add control plane
 transaction layer framework
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-t9xx_driver_v1-v12-2-e181b616b820@compal.com>
References: <20261117-t9xx_driver_v1-v12-0-e181b616b820@compal.com>
In-Reply-To: <20261117-t9xx_driver_v1-v12-0-e181b616b820@compal.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Jack Wu <jackbb_wu@compal.com>, 
 Wen-Zhi Huang <wen-zhi.huang@mediatek.com>, 
 Shi-Wei Yeh <shi-wei.yeh@mediatek.com>, 
 Minano Tseng <Minano.tseng@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Robert Yu <robert_yu@compal.com>, 
 Jeff Chang <Jeff_Chang@compal.com>, Eric Dumazet <edumazet@kernel.org>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794912687; l=4974;
 i=jackbb_wu@compal.com; s=20260526; h=from:subject:message-id;
 bh=ixrZq4OYr6aU0FeCIyjgyAmo3Nh8JgyHqzlLoKWT9xg=;
 b=NgK0fBJcqYeWnlGggVMbjF/K32Shl9pJD66i89+sJK2C8hRWGO5rhkUsEia13hTt8MSOedDPC
 W97EuOIY3F5AzrJQsGPlXQ9TGhsdwBp/araV3mxqFT1CeLv+9AUd7ve
X-Developer-Key: i=jackbb_wu@compal.com; a=ed25519;
 pk=VH1prTWixNl8OEUPPSfII3p46MzJpQN8J3+ecE1tZXg=
X-Endpoint-Received: by B4 Relay for jackbb_wu@compal.com/20260526 with
 auth_id=793
X-Original-From: Jack Wu <jackbb_wu@compal.com>
Reply-To: jackbb_wu@compal.com
Content-Transfer-Encoding: 7bit

From: Jack Wu <jackbb_wu@compal.com>

Introduce the control plane and transaction layer framework
for the T9XX WWAN driver. This patch adds the core data
structures (mtk_ctrl_blk, mtk_ctrl_trans) and initialization
entry points that subsequent patches build upon.

The control plane block (ctrl_blk) starts out with only the
device back-pointer and an opaque pointer to the transport
context; later patches add the port layer and FSM hooks to
it. The actual DMA engine and TX/RX service
implementations are added in subsequent patches, and
mtk_ctrl_init() and mtk_ctrl_exit() get their first callers
there, in pcie/mtk_trans_ctrl.c.

Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
 drivers/net/wwan/t9xx/Makefile              |  1 +
 drivers/net/wwan/t9xx/mtk_ctrl_plane.c      | 45 +++++++++++++++++++++++++++++
 drivers/net/wwan/t9xx/mtk_ctrl_plane.h      | 21 ++++++++++++++
 drivers/net/wwan/t9xx/mtk_dev.h             |  3 ++
 drivers/net/wwan/t9xx/pcie/mtk_pci.c        |  1 +
 drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h | 19 ++++++++++++
 6 files changed, 90 insertions(+)

diff --git a/drivers/net/wwan/t9xx/Makefile b/drivers/net/wwan/t9xx/Makefile
index bd6063c85c2b..0a07507f1ddf 100644
--- a/drivers/net/wwan/t9xx/Makefile
+++ b/drivers/net/wwan/t9xx/Makefile
@@ -6,4 +6,5 @@ ccflags-y += -I$(src)
 obj-$(CONFIG_MTK_T9XX) += mtk_t9xx.o
 
 mtk_t9xx-y := \
+	mtk_ctrl_plane.o \
 	pcie/mtk_pci.o
diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.c b/drivers/net/wwan/t9xx/mtk_ctrl_plane.c
new file mode 100644
index 000000000000..18f0573ac653
--- /dev/null
+++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022, MediaTek Inc.
+ */
+
+#include <linux/device.h>
+
+#include "mtk_ctrl_plane.h"
+
+/**
+ * mtk_ctrl_init() - Initialize the control plane block.
+ * @mdev: Pointer to the MTK modem device.
+ *
+ * Allocates and initializes the control plane block
+ * associated with @mdev.  Runs once per bind; the allocation is
+ * devres managed and is released at unbind, not by
+ * mtk_ctrl_exit().
+ *
+ * Return: 0 on success, -ENOMEM on allocation failure.
+ */
+int mtk_ctrl_init(struct mtk_md_dev *mdev)
+{
+	struct mtk_ctrl_blk *ctrl_blk;
+
+	ctrl_blk = devm_kzalloc(mdev->dev, sizeof(*ctrl_blk), GFP_KERNEL);
+	if (!ctrl_blk)
+		return -ENOMEM;
+
+	ctrl_blk->mdev = mdev;
+	mdev->ctrl_blk = ctrl_blk;
+
+	return 0;
+}
+
+/**
+ * mtk_ctrl_exit() - Clean up the control plane block.
+ * @mdev: Pointer to the MTK modem device.
+ *
+ * Clears the control plane block pointer. The allocation
+ * itself is managed by devres and freed on driver detach.
+ */
+void mtk_ctrl_exit(struct mtk_md_dev *mdev)
+{
+	mdev->ctrl_blk = NULL;
+}
diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.h b/drivers/net/wwan/t9xx/mtk_ctrl_plane.h
new file mode 100644
index 000000000000..46f1ab9f0551
--- /dev/null
+++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2022, MediaTek Inc.
+ */
+
+#ifndef __MTK_CTRL_PLANE_H__
+#define __MTK_CTRL_PLANE_H__
+
+#include <linux/skbuff.h>
+
+#include "mtk_dev.h"
+
+struct mtk_ctrl_blk {
+	struct mtk_md_dev *mdev;
+	void *ctrl_hw_priv;
+};
+
+int mtk_ctrl_init(struct mtk_md_dev *mdev);
+void mtk_ctrl_exit(struct mtk_md_dev *mdev);
+
+#endif /* __MTK_CTRL_PLANE_H__ */
diff --git a/drivers/net/wwan/t9xx/mtk_dev.h b/drivers/net/wwan/t9xx/mtk_dev.h
index fc25418bb957..ff3cbaa4329e 100644
--- a/drivers/net/wwan/t9xx/mtk_dev.h
+++ b/drivers/net/wwan/t9xx/mtk_dev.h
@@ -28,12 +28,15 @@ enum mtk_dev_evt_d2h {
 	DEV_EVT_D2H_ASYNC_HS_NOTIFY_MD	= BIT(6),
 };
 
+struct mtk_ctrl_blk;
+
 /* mtk_md_dev defines the structure of MTK modem device */
 struct mtk_md_dev {
 	struct device *dev;
 	void *hw_priv;
 	u32 hw_ver;
 	char dev_str[MTK_DEV_STR_LEN];
+	struct mtk_ctrl_blk *ctrl_blk;
 };
 
 #endif /* __MTK_DEV_H__ */
diff --git a/drivers/net/wwan/t9xx/pcie/mtk_pci.c b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
index cf59038f0906..3dd8efa374ff 100644
--- a/drivers/net/wwan/t9xx/pcie/mtk_pci.c
+++ b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 
 #include "mtk_dev.h"
+#include "mtk_trans_ctrl.h"
 #include "mtk_pci.h"
 #include "mtk_pci_reg.h"
 
diff --git a/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h b/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h
new file mode 100644
index 000000000000..9b42f33bd008
--- /dev/null
+++ b/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2022, MediaTek Inc.
+ */
+
+#ifndef __MTK_TRANS_CTRL_H__
+#define __MTK_TRANS_CTRL_H__
+
+#include <linux/list.h>
+#include <linux/skbuff.h>
+#include <linux/types.h>
+
+#include "mtk_dev.h"
+
+struct mtk_ctrl_trans {
+	struct mtk_md_dev *mdev;
+};
+
+#endif

-- 
2.34.1


