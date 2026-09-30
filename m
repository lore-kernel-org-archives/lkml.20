Received: from mta1.migadu.com (out-38.mta1.migadu.com [95.215.58.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57CA4483BE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759784; cv=none; b=o9Qj8/rsF3bqLPGT+FBiNLOHoQ+WLwWUiUFjZWhwn1nqLFAXOWgaQ1mfVdBQc5iyGswDGrzhOeAOBqMp7Sk8z7XoDWf5u0ckZhowT1lqdHMI07NrD49CIwOY7bxJ7cETDrTA2PdW2dwBjXsjrM3e3nV/6zWq1fg8xKiyGLBsglA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759784; c=relaxed/simple;
	bh=GF+U/hw7WcPHBVh+HSbJ3knj3l/vkqtYcF1qErvdvEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tjDsRRUALJvGO3LRzXFCitt44vF7KG87iA+pJLIIS6g8N1Uwo5zdLacTxx07W7uwg5AiCuw33igIhhkUj6CRhu5owXiNGNFaD9jwxOZBG/w3e7suE9IT4VdA9k91xJi4NTulOoyYRbkQWFoppKJi1+XRduZ1pzYoW+icc/pvZ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=W5dq33Mk; arc=none smtp.client-ip=95.215.58.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="W5dq33Mk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GF+U/hw7WcPHBVh+HSbJ3knj3l/vkqtYcF1qErvdvEI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790759779; v=1; x=1791364579;
 b=W5dq33MkSJyq99qN/Hna0BMF3LoQRn6eYXExTpeo2Wu68NoyfE1iSuYs2V7WE3rCe3dpTjaY
 GVdjL+xTN4fZQxNd5ojX8DRmCDEhaDd+hRuxqo/AF2QYrvaad1FA3HNzygdv5y+68dG5KAd/QZ/
 HNZSItR207zrAaEzj0pliCFw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a14b5202803427cd;
	Wed, 30 Sep 2026 09:16:19 +0000
X-Mizu-Trace-ID: a14b5202803427cd
X-Migadu-Flow: FLOW_OUT
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v5 rtw-next 6/7] wifi: rtw88: 8723bs: add the RTL8723BS SDIO bind
Date: Wed, 30 Sep 2026 11:16:03 +0200
Message-ID: <20260930091604.52891-7-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930091604.52891-1-luka.gejak@linux.dev>
References: <20260930091604.52891-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SDIO module for the RTL8723BS, the SDIO variant of the
RTL8723B. It binds the Realtek SDIO device ids to the shared rtw88 SDIO
probe and points it at the RTL8723B chip information.

The device id table carries the same six ids the staging rtl8723bs
driver binds to this chip, so the staging driver can be dropped without
losing hardware support. I only have the 0xb723 variant to test with.
The other five are included for parity with staging, which has carried
them for years, rather than being left behind.

The RTL8723B chip support is based on the initial work by
Michael Straube <straube.linux@gmail.com>.
Link: https://github.com/mistraube/rtw88/tree/rtl8723bs

Co-developed-by: Michael Straube <straube.linux@gmail.com>
Signed-off-by: Michael Straube <straube.linux@gmail.com>
Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../net/wireless/realtek/rtw88/rtw8723bs.c    | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 drivers/net/wireless/realtek/rtw88/rtw8723bs.c

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8723bs.c b/drivers/net/wireless/realtek/rtw88/rtw8723bs.c
new file mode 100644
index 000000000000..62ad44db20de
--- /dev/null
+++ b/drivers/net/wireless/realtek/rtw88/rtw8723bs.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/* Copyright(c) 2026  Realtek Corporation
+ * Copyright(c) Michael Straube <straube.linux@gmail.com>
+ * Copyright(c) 2024-2026 Luka Gejak <luka.gejak@linux.dev>
+ */
+
+#include <linux/mmc/sdio_func.h>
+#include <linux/mmc/sdio_ids.h>
+#include <linux/module.h>
+#include "main.h"
+#include "rtw8723b.h"
+#include "sdio.h"
+
+static const struct sdio_device_id rtw_8723bs_id_table[] = {
+	{
+		SDIO_DEVICE(SDIO_VENDOR_ID_REALTEK,
+			    SDIO_DEVICE_ID_REALTEK_RTW8723BS),
+		.driver_data = (kernel_ulong_t)&rtw8723b_hw_spec,
+	},
+	{
+		SDIO_DEVICE(SDIO_VENDOR_ID_REALTEK, 0x0523),
+		.driver_data = (kernel_ulong_t)&rtw8723b_hw_spec,
+	},
+	{
+		SDIO_DEVICE(SDIO_VENDOR_ID_REALTEK, 0x0525),
+		.driver_data = (kernel_ulong_t)&rtw8723b_hw_spec,
+	},
+	{
+		SDIO_DEVICE(SDIO_VENDOR_ID_REALTEK, 0x0623),
+		.driver_data = (kernel_ulong_t)&rtw8723b_hw_spec,
+	},
+	{
+		SDIO_DEVICE(SDIO_VENDOR_ID_REALTEK, 0x0626),
+		.driver_data = (kernel_ulong_t)&rtw8723b_hw_spec,
+	},
+	{
+		SDIO_DEVICE(SDIO_VENDOR_ID_REALTEK, 0x0627),
+		.driver_data = (kernel_ulong_t)&rtw8723b_hw_spec,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(sdio, rtw_8723bs_id_table);
+
+static struct sdio_driver rtw_8723bs_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = rtw_8723bs_id_table,
+	.probe = rtw_sdio_probe,
+	.remove = rtw_sdio_remove,
+	.shutdown = rtw_sdio_shutdown,
+	.drv = {
+		.pm = &rtw_sdio_pm_ops,
+	}
+};
+module_sdio_driver(rtw_8723bs_driver);
+
+MODULE_AUTHOR("Luka Gejak <luka.gejak@linux.dev>");
+MODULE_AUTHOR("Michael Straube <straube.linux@gmail.com>");
+MODULE_DESCRIPTION("Realtek 802.11n wireless 8723bs driver");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.55.0

