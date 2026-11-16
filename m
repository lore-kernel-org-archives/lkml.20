Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813837;
	b=TZF/86qxZ7Y/IDbdD5Z04hKjNDZoU/5c3FB4RkT+HlJzfe5QjbGXQxcL2cFH+Y5L6SJa
	 17OOTyOiWfQ3APwG/KpDhFV+x9JZtpADaE4u50jdWNsEZVFhsvCfVHTGaaRLtV2Oh9QLP
	 Kiqxj5McjBBB48G8EyYN3z+6ZbTtkmx1247AYnPWTZBf9YdoMBvbaaIym6p+gJUIGUrAr
	 i4gdRWRjGGoC55JzRs+Xr0utu6fC53xkMxPJbR6wYgzy3VdD89X8jlB3CoD8rJ0eMnSAk
	 yguOG/qBpirDovjxDsjb+WjpVT73U5/HSQRF+ggicIkFfL83nBM9TCZco+aLWzeU5XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813837;
	h=DMARC-Filter:DKIM-Signature:X-Original-From:Content-Type:To:Subject:
	 Mime-Version:Cc:From:X-Lms-Return-Path:References:Date:Message-Id:
	 Received:In-Reply-To:Content-Transfer-Encoding;
	bh=fC0ouGgp2VHfzV6y31UkMvC5rkQ25fED1UQbBim/TOE=;
	b=bmXzVR1KItHIye3JC4N0je3/On2leef6rD+U9pveG7mcmGxUe6PGOQp0mB2ofsc8BZ3T
	 4NvteM/KAh0VEkuzl9iLbDjGrxJeuxFRU3V13rVakR59lPVAUjLsJ1JQICmByiCOUy4cm
	 +gvv2uIMNF1RDjFt4q9B57x0RohDgmTAZOKteGWOl+D7NgukZ6SUv6aNPPyy5yOKq95Xq
	 choearWx7e0kEClhY4nWlAGQjnAo1hW+4GtntK7dyCiVuHJkbfoW0KARPOk4TPx9rv8W1
	 Q6gMs8hhIJM41zZuq+Sll5IcEbIALlxzwU6ytI9yrr0kL5TBdMdjphaLJkyhJTwYn8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bedmex.com;
	spf=none smtp.mailfrom=bedmex.com;
	dkim=pass header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=P2B5HQ1J;
	arc=none smtp.remote-ip=209.127.231.50
Received: from va-2-50.ptr.blmpb.com (va-2-50.ptr.blmpb.com [209.127.231.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5674E606A332
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5674E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bedmex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=P2B5HQ1J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=bedmex-com.20200927.dkim.feishu.cn; t=1794813829;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=fC0ouGgp2VHfzV6y31UkMvC5rkQ25fED1UQbBim/TOE=;
 b=P2B5HQ1JoObbSTWjjgJigPmvbGGkRqRxAfmKJv4y6SLOZBxLw5Rop17Uu8FZGReIug54Fa
 3YNs5moJkOusQEaoFs30HK3LPDOKs9Fjh9ApNHz4z/A6akww47zEqVOSlM1osjzW4DjUaW
 l7pVcbBCUYhr7+vh1HG8WUCOj5cEaz7KaWyvJLBfL/DIniP88lxmRm35CluNuukkL6WRCV
 Js46aDfVcUr9TCWS/d3rri2HyGjbnNBkpGQIQRURQmzgVfRfw7ofEdoY0AZanFuxmmMcDf
 CeYGZ0s2514q/xcllYNE7kSArsihgLWtEnfoJ0P5up4EAuLq8aaQ9Qu3n0+l2g==
X-Original-From: Yanli Yang <yanli.yang@bedmex.com>
Content-Type: text/plain; charset=UTF-8
To: <linux-wireless@vger.kernel.org>
Subject: [PATCH wireless-next v5 2/4] wifi: aic: Add firmware protocol and SDIO chip support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Cc: "Johannes Berg" <johannes@sipsolutions.net>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Zhirun Liu" <zhirunliu@aicsemi.com>, 
	"Dijia Xu" <dijiaxu@aicsemi.com>, "Chunqiu Liu" <chunqiuliu@aicsemi.com>, 
	"Liheng Wei" <liheng.wei@bedmex.com>, <yanli.yang@bedmex.com>
From: "Yanli Yang" <yanli.yang@bedmex.com>
X-Lms-Return-Path: <lba+26afaaf83+19abae+vger.kernel.org+yanli.yang@bedmex.com>
References: <179481380235.4.7388336477392853157@bedmex.com>
Date: Mon, 16 Nov 2026 15:23:22 +0800
Message-Id: <179481380237.4.13158213034346823800@bedmex.com>
Received: from [127.0.1.1] ([36.141.79.164]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 15:23:45 +0800
In-Reply-To: <179481380235.4.7388336477392853157@bedmex.com>
Content-Transfer-Encoding: quoted-printable

From: Zhirun Liu <zhirunliu@aicsemi.com>

Add the firmware message definitions, command manager and SDIO transport
for the AIC8800D80 U02 and AIC8800D80N FullMAC Wi-Fi devices.

Keep firmware download, transport setup and chip operations in the
FullMAC driver. Select the chip implementation from the SDIO IDs and
provide separate D80 and D80N firmware boot sequences. D80N U02 and U02C
use chip-initialization, RF-calibration, ROM-patch and patch-table images.
Load firmware and user configuration with request_firmware() from the
aic/aic8800d80/ and aic/aic8800d80n/ directories.

Add SDIO interrupt handling, transmit aggregation, firmware event
dispatch and suspend/resume operations. Keep command and transport state
with the device rather than exporting a separate BSP interface.

The build configuration and remaining FullMAC implementation follow in
the next patch; the parent wireless build is connected only after all
driver sources are present.

Signed-off-by: Chunqiu Liu <chunqiuliu@aicsemi.com>
Signed-off-by: Zhirun Liu <zhirunliu@aicsemi.com>
Signed-off-by: Yanli Yang <yanli.yang@bedmex.com>
---
 .../net/wireless/aic/aic8800_fdrv/aic_bus.h   |   99 +
 .../wireless/aic/aic8800_fdrv/aicwf_bfmer.h   |  100 +
 .../aic/aic8800_fdrv/aicwf_chip_8800d80.c     |   96 +
 .../aic/aic8800_fdrv/aicwf_chip_8800d80n.c    |   74 +
 .../aic/aic8800_fdrv/aicwf_chip_ops.c         |  197 ++
 .../aic/aic8800_fdrv/aicwf_chip_ops.h         |  116 +
 .../wireless/aic/aic8800_fdrv/aicwf_cmds.c    |  629 ++++
 .../wireless/aic/aic8800_fdrv/aicwf_cmds.h    |  122 +
 .../aic/aic8800_fdrv/aicwf_compat_8800d80.c   |  281 ++
 .../aic/aic8800_fdrv/aicwf_compat_8800d80.h   |   17 +
 .../aic/aic8800_fdrv/aicwf_compat_8800d80n.c  |  402 +++
 .../aic/aic8800_fdrv/aicwf_compat_8800d80n.h  |   17 +
 .../wireless/aic/aic8800_fdrv/aicwf_config.h  |   33 +
 .../wireless/aic/aic8800_fdrv/aicwf_defs.h    |  657 ++++
 .../wireless/aic/aic8800_fdrv/aicwf_events.h  |  938 +++++
 .../wireless/aic/aic8800_fdrv/aicwf_main.h    |   22 +
 .../wireless/aic/aic8800_fdrv/aicwf_mesh.h    |   39 +
 .../aic/aic8800_fdrv/aicwf_mod_params.h       |   59 +
 .../wireless/aic/aic8800_fdrv/aicwf_msg_rx.c  | 1412 ++++++++
 .../wireless/aic/aic8800_fdrv/aicwf_msg_rx.h  |   12 +
 .../wireless/aic/aic8800_fdrv/aicwf_msg_tx.c  | 2499 +++++++++++++
 .../wireless/aic/aic8800_fdrv/aicwf_msg_tx.h  |  201 ++
 .../aic/aic8800_fdrv/aicwf_mu_group.h         |  163 +
 .../aic/aic8800_fdrv/aicwf_platform.c         | 1507 ++++++++
 .../aic/aic8800_fdrv/aicwf_platform.h         |   91 +
 .../wireless/aic/aic8800_fdrv/aicwf_radar.h   |  289 ++
 .../aic/aic8800_fdrv/aicwf_resv_mem.h         |   54 +
 .../net/wireless/aic/aic8800_fdrv/aicwf_rx.h  |  363 ++
 .../aic/aic8800_fdrv/aicwf_rx_prealloc.h      |   39 +
 .../wireless/aic/aic8800_fdrv/aicwf_sdio.c    | 2439 +++++++++++++
 .../wireless/aic/aic8800_fdrv/aicwf_sdio.h    |  280 ++
 .../wireless/aic/aic8800_fdrv/aicwf_strs.c    |  267 ++
 .../wireless/aic/aic8800_fdrv/aicwf_strs.h    |   31 +
 .../net/wireless/aic/aic8800_fdrv/aicwf_tx.h  |  165 +
 .../net/wireless/aic/aic8800_fdrv/aicwf_txq.h |  353 ++
 .../aic/aic8800_fdrv/aicwf_txq_prealloc.h     |   31 +
 .../wireless/aic/aic8800_fdrv/aicwf_txrxif.c  |  666 ++++
 .../wireless/aic/aic8800_fdrv/aicwf_txrxif.h  |  161 +
 .../wireless/aic/aic8800_fdrv/aicwf_utils.c   |   32 +
 .../wireless/aic/aic8800_fdrv/aicwf_utils.h   |   61 +
 .../net/wireless/aic/aic8800_fdrv/hal_desc.h  |  359 ++
 .../wireless/aic/aic8800_fdrv/ipc_shared.h    |  767 ++++
 .../net/wireless/aic/aic8800_fdrv/lmac_mac.h  |  437 +++
 .../net/wireless/aic/aic8800_fdrv/lmac_msg.h  | 3092 +++++++++++++++++
 .../wireless/aic/aic8800_fdrv/lmac_types.h    |   21 +
 .../net/wireless/aic/aic8800_fdrv/sdio_host.c |  136 +
 .../net/wireless/aic/aic8800_fdrv/sdio_host.h |   43 +
 47 files changed, 19869 insertions(+)
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aic_bus.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_bfmer.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_8800d8=
0.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_8800d8=
0n.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_ops.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_ops.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_cmds.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_cmds.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800=
d80.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800=
d80.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800=
d80n.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800=
d80n.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_config.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_defs.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_events.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_main.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_mesh.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_mod_params.=
h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_rx.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_rx.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_tx.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_tx.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_mu_group.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_platform.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_platform.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_radar.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_resv_mem.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx_prealloc=
.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_sdio.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_sdio.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_strs.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_strs.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_tx.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq_preallo=
c.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_txrxif.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_txrxif.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_utils.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/aicwf_utils.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/hal_desc.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/ipc_shared.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/lmac_mac.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/lmac_msg.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/lmac_types.h
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/sdio_host.c
 create mode 100644 drivers/net/wireless/aic/aic8800_fdrv/sdio_host.h

diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aic_bus.h b/drivers/net/=
wireless/aic/aic8800_fdrv/aic_bus.h
new file mode 100644
index 000000000000..8e1e0e3d26ec
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aic_bus.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 AIC semiconductor.
+ *
+ * @file aic_bus.h
+ * @brief Common bus abstraction layer for AIC8800 series.
+ *
+ * This header defines the bus-level operations that abstract the
+ * underlying transport (currently SDIO) from the upper driver layers.
+ * The design follows the pattern used by silabs/wfx and broadcom/b43.
+ *
+ * Key principles:
+ *  - struct aicwf_bus_ops provides the bus primitives the upper layers
+ *    need: start/stop and data/message transmission.
+ *  - Upper-layer code accesses the bus only through the ops table and
+ *    inline wrappers defined here.  It MUST NOT dereference the
+ *    bus-private structure (aic_sdio_dev etc.) directly.
+ *  - When a new transport (e.g. USB) is added, only the bus_ops
+ *    implementation needs to change; upper layers are unaffected.
+ */
+
+#ifndef _AIC_BUS_H_
+#define _AIC_BUS_H_
+
+#include <linux/device.h>
+#include <linux/skbuff.h>
+#include <linux/types.h>
+
+/* Bus operational state */
+enum aicwf_bus_state { BUS_DOWN_ST, BUS_UP_ST };
+
+struct aicwf_bus {
+	struct aic_sdio_dev *sdiodev;
+	struct device *dev;
+	const struct aicwf_bus_ops *ops;
+	enum aicwf_bus_state state;
+	u8 *cmd_buf;
+	struct completion bustx_trgg;
+	struct completion busrx_trgg;
+	struct completion busirq_trgg; // new oob feature
+	struct task_struct *bustx_thread;
+	struct task_struct *busrx_thread;
+	struct task_struct *busirq_thread; // new oob feature
+};
+
+/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ *  Bus-level operation vectors
+ *
+ *  Every transport provides one instance of this struct.  The
+ *  bus-private device pointer is carried inside struct aicwf_bus so
+ *  that ops callbacks can retrieve it via bus->sdiodev.
+ * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ */
+
+struct aicwf_bus_ops {
+	/* ----- Lifecycle ----- */
+	int  (*start)(struct device *dev);
+	void (*stop)(struct device *dev);
+
+	/* ----- Data / message transmission ----- */
+	int (*txdata)(struct device *dev, struct sk_buff *skb);
+	int (*txmsg)(struct device *dev, u8 *msg, uint len);
+};
+
+/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ *  Inline wrappers =E2=80=93 upper layers call these instead of touching
+ *  the transport internals.
+ * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ */
+
+static inline int aicwf_bus_start(struct aicwf_bus *bus)
+{
+	return bus->ops->start(bus->dev);
+}
+
+static inline void aicwf_bus_stop(struct aicwf_bus *bus)
+{
+	bus->ops->stop(bus->dev);
+}
+
+static inline int aicwf_bus_txdata(struct aicwf_bus *bus, struct sk_buff *=
skb)
+{
+	return bus->ops->txdata(bus->dev, skb);
+}
+
+static inline int aicwf_bus_txmsg(struct aicwf_bus *bus, u8 *msg, uint len=
)
+{
+	return bus->ops->txmsg(bus->dev, msg, len);
+}
+
+/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ *  Bus-level init / deinit (shared across transports)
+ * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ */
+
+int aicwf_bus_init(uint bus_hdrlen, struct device *dev);
+void aicwf_bus_deinit(struct device *dev);
+
+#endif /* _AIC_BUS_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_bfmer.h b/drivers/=
net/wireless/aic/aic8800_fdrv/aicwf_bfmer.h
new file mode 100644
index 000000000000..5fcf5a81e86d
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_bfmer.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *************************************************************************=
*****
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief VHT Beamformer function definitions
+ *
+ *************************************************************************=
*****
+ */
+
+#ifndef _AICWF_BFMER_H_
+#define _AICWF_BFMER_H_
+
+/*
+ * INCLUDE FILES
+ *************************************************************************=
*****
+ */
+
+#include "aicwf_defs.h"
+
+/*
+ * DEFINES
+ *************************************************************************=
*****
+ */
+
+/// Maximal supported report length (in bytes)
+#define AICWF_BFMER_REPORT_MAX_LEN 2048
+
+/// Size of the allocated report space (twice the maximum report length)
+#define AICWF_BFMER_REPORT_SPACE_SIZE (AICWF_BFMER_REPORT_MAX_LEN * 2)
+
+/*
+ * TYPE DEFINITIONS
+ *************************************************************************=
*****
+ */
+
+/*
+ * Structure used to store a beamforming report.
+ */
+struct aicwf_bfmer_report {
+	dma_addr_t dma_addr;	/* Virtual address provided to MAC for
+				 * DMA transfer of the Beamforming Report
+				 */
+	unsigned int length; /* Report Length */
+	u8 report[1];        /* Report to be used for VHT TX Beamforming */
+};
+
+/*
+ * FUNCTION DECLARATIONS
+ *************************************************************************=
*****
+ */
+
+/*
+ *************************************************************************=
*****
+ * @brief Allocate memory aiming to contains the Beamforming Report receiv=
ed
+ * from a Beamformee capable.
+ * The providing length shall be large enough to contain the VHT Compresse=
d
+ * Beaforming Report and the MU Exclusive part.
+ * It also perform a DMA Mapping providing an address to be provided to th=
e HW
+ * responsible for the DMA transfer of the report.
+ * If successful a struct aicwf_bfmer_report object is allocated, it's add=
ress
+ * is stored in aicwf_sta->bfm_report.
+ *
+ * @param[in] aicwf_hw   PHY Information
+ * @param[in] aicwf_sta  Peer STA Information
+ * @param[in] length    Memory size to be allocated
+ *
+ * @return 0 if operation is successful, else -1.
+ *************************************************************************=
*****
+ */
+int aicwf_bfmer_report_add(struct aicwf_hw *aicwf_hw, struct aicwf_sta *ai=
cwf_sta,
+			   unsigned int length);
+
+/*
+ *************************************************************************=
*****
+ * @brief Free a previously allocated memory intended to be used for
+ * Beamforming Reports.
+ *
+ * @param[in] aicwf_hw   PHY Information
+ * @param[in] aicwf_sta  Peer STA Information
+ *
+ *************************************************************************=
*****
+ */
+void aicwf_bfmer_report_del(struct aicwf_hw *aicwf_hw, struct aicwf_sta *a=
icwf_sta);
+
+#ifdef CONFIG_AICWF_FULLMAC
+/*
+ *************************************************************************=
*****
+ * @brief Parse a Rx VHT-MCS map in order to deduce the maximum number of
+ * Spatial Streams supported by a beamformee.
+ *
+ * @param[in] vht_capa  Received VHT Capability field.
+ *
+ *************************************************************************=
*****
+ */
+u8 aicwf_bfmer_get_rx_nss(const struct ieee80211_vht_cap *vht_capa);
+#endif /* CONFIG_AICWF_FULLMAC */
+
+#endif /* _AICWF_BFMER_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_8800d80.c b/d=
rivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_8800d80.c
new file mode 100644
index 000000000000..d283fe410068
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_8800d80.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 AIC semiconductor.
+ *
+ * @file aicwf_chip_8800d80.c
+ * @brief Chip operations for AIC8800D80
+ */
+
+#include <linux/types.h>
+#include <linux/ieee80211.h>
+#include "aicwf_chip_ops.h"
+#include "aicwf_defs.h"
+#include "aicwf_sdio.h"
+#include "aicwf_compat_8800d80.h"
+#include "aicwf_txrxif.h"
+
+static int aic8800d80_init_capa(struct aicwf_hw *aicwf_hw)
+{
+	aicwf_hw->mod_params->sgi80 =3D true;
+	aicwf_hw->mod_params->use_80 =3D true;
+	return 0;
+}
+
+static int aic8800d80_userconfig_load(struct aicwf_hw *aicwf_hw)
+{
+	return aicwf_plat_userconfig_load_8800d80(aicwf_hw);
+}
+
+static int aic8800d80_set_rf_config(struct aicwf_hw *aicwf_hw,
+				    struct mm_set_rf_calib_cfm *cfm)
+{
+	return aicwf_set_rf_config_8800d80(aicwf_hw, cfm);
+}
+
+static void aic8800d80_set_rf_calib_cfg(struct mm_set_rf_calib_req *rf_cal=
ib_req)
+{
+	rf_calib_req->cal_cfg_24g =3D 0x0f8f;
+	rf_calib_req->cal_cfg_5g =3D 0x0f0f;
+}
+
+static u8 aic8800d80_cmd_hdr_checksum(u8 *hdr, int len)
+{
+	return crc8_ponl_107(hdr, 3);
+}
+
+static int aic8800d80_set_stack_start(struct aicwf_hw *aicwf_hw,
+				      struct mm_set_stack_start_cfm *cfm)
+{
+	return aicwf_send_set_stack_start_req(aicwf_hw, 1, 0, CO_BIT(5), 0, cfm);
+}
+
+static int aic8800d80_get_userconfig_txpwr_ofst2x(struct aicwf_hw *aicwf_h=
w,
+						  struct txpwr_ofst2x_conf *txpwr_ofst2x)
+{
+	get_userconfig_txpwr_ofst2x_in_fdrv(aicwf_hw, txpwr_ofst2x);
+	return 0;
+}
+
+static int aic8800d80_ic_system_init(struct aicwf_hw *aicwf_hw, struct dbg=
_mem_read_cfm *cfm)
+{
+	u32 memdata_temp =3D 0x00000006;
+	int ret;
+
+	ret =3D aicwf_send_dbg_mem_block_write_req(aicwf_hw, 0x40504084, 4,
+						 &memdata_temp);
+	if (ret) {
+		dev_err(aicwf_hw->dev, "[0x40504084] write fail: %d\n", ret);
+		return -1;
+	}
+
+	ret =3D aicwf_send_dbg_mem_read_req(aicwf_hw, 0x40504084, cfm);
+	if (ret) {
+		dev_err(aicwf_hw->dev, "[0x40504084] rd fail\n");
+		return -1;
+	}
+	dev_dbg(aicwf_hw->dev, "rd [0x40504084] =3D %x\n", cfm->memdata);
+	return ret;
+}
+
+/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Ops instances =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D */
+
+const struct aic_chip_ops aic_chip_aic8800d80_ops =3D {
+	.name						=3D "AIC8800D80",
+	.is_old_ic					=3D false,
+	.limit_by_testmode			=3D true,
+	.use_80_bandwidth			=3D true,
+	.init_capa					=3D aic8800d80_init_capa,
+	.userconfig_load			=3D aic8800d80_userconfig_load,
+	.set_rf_calib_cfg			=3D aic8800d80_set_rf_calib_cfg,
+	.set_rf_config				=3D aic8800d80_set_rf_config,
+	.cmd_hdr_checksum			=3D aic8800d80_cmd_hdr_checksum,
+	.set_stack_start			=3D aic8800d80_set_stack_start,
+	.get_userconfig_txpwr_ofst2x	=3D aic8800d80_get_userconfig_txpwr_ofst2x,
+	.ic_system_init				=3D aic8800d80_ic_system_init,
+	.fw_download				=3D aicwf_fw_download_8800d80,
+};
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_8800d80n.c b/=
drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_8800d80n.c
new file mode 100644
index 000000000000..23d7a620123b
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_8800d80n.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 AIC semiconductor.
+ *
+ * @file aicwf_chip_8800d80n.c
+ * @brief Chip operations for AIC8800D80N
+ */
+
+#include <linux/types.h>
+#include <linux/ieee80211.h>
+#include "aicwf_chip_ops.h"
+#include "aicwf_defs.h"
+#include "aicwf_sdio.h"
+#include "aicwf_compat_8800d80n.h"
+#include "aicwf_txrxif.h"
+
+static int aic8800d80n_init_capa(struct aicwf_hw *aicwf_hw)
+{
+	aicwf_hw->mod_params->sgi80 =3D true;
+	aicwf_hw->mod_params->use_80 =3D true;
+	return 0;
+}
+
+static int aic8800d80n_userconfig_load(struct aicwf_hw *aicwf_hw)
+{
+	return aicwf_plat_userconfig_load_8800d80n(aicwf_hw);
+}
+
+static int aic8800d80n_set_rf_config(struct aicwf_hw *aicwf_hw,
+				     struct mm_set_rf_calib_cfm *cfm)
+{
+	return aicwf_set_rf_config_8800d80n(aicwf_hw, cfm);
+}
+
+static void aic8800d80n_set_rf_calib_cfg(struct mm_set_rf_calib_req *rf_ca=
lib_req)
+{
+	rf_calib_req->cal_cfg_24g =3D 0x0f8f;
+	rf_calib_req->cal_cfg_5g =3D 0x0f0f;
+}
+
+static u8 aic8800d80n_cmd_hdr_checksum(u8 *hdr, int len)
+{
+	return crc8_ponl_107(hdr, 3);
+}
+
+static int aic8800d80n_set_stack_start(struct aicwf_hw *aicwf_hw,
+				       struct mm_set_stack_start_cfm *cfm)
+{
+	return aicwf_send_set_stack_start_req(aicwf_hw, 1, 0, CO_BIT(5), 0, cfm);
+}
+
+static int aic8800d80n_get_userconfig_txpwr_ofst2x(struct aicwf_hw *aicwf_=
hw,
+						   struct txpwr_ofst2x_conf *txpwr_ofst2x)
+{
+	get_userconfig_txpwr_ofst2x_in_fdrv(aicwf_hw, txpwr_ofst2x);
+	return 0;
+}
+
+/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Ops instances =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D */
+
+const struct aic_chip_ops aic_chip_aic8800d80n_ops =3D {
+	.name						=3D "AIC8800D80N",
+	.is_old_ic					=3D false,
+	.limit_by_testmode			=3D true,
+	.use_80_bandwidth			=3D true,
+	.init_capa					=3D aic8800d80n_init_capa,
+	.userconfig_load			=3D aic8800d80n_userconfig_load,
+	.set_rf_calib_cfg			=3D aic8800d80n_set_rf_calib_cfg,
+	.set_rf_config				=3D aic8800d80n_set_rf_config,
+	.cmd_hdr_checksum			=3D aic8800d80n_cmd_hdr_checksum,
+	.set_stack_start			=3D aic8800d80n_set_stack_start,
+	.get_userconfig_txpwr_ofst2x	=3D aic8800d80n_get_userconfig_txpwr_ofst2x,
+	.fw_download				=3D aicwf_fw_download_8800d80n,
+};
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_ops.c b/drive=
rs/net/wireless/aic/aic8800_fdrv/aicwf_chip_ops.c
new file mode 100644
index 000000000000..2599b9b75870
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_ops.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 AIC semiconductor.
+ *
+ * @file aicwf_chip_ops.c
+ * @brief Wrapper function implementations for chip-specific operations.
+ */
+
+#include <linux/errno.h>
+#include <linux/types.h>
+#include "aicwf_chip_ops.h"
+#include "aicwf_defs.h"
+#include "aicwf_sdio.h"
+#include "lmac_msg.h"
+
+/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D SDIO chip properties =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D */
+static const struct aic_sdio_chip_hw aic_sdio_chip_tbl[] =3D {
+	[PRODUCT_ID_AIC8801] =3D {
+		.oob_support =3D false,
+		.use_func2 =3D true,
+		.use_sdiov3_func =3D false,
+		.need_flowctrl_mask =3D true,
+		.use_flowctrl_msg =3D true,
+		.hdr_cksum =3D false,
+		.need_func0_intr =3D false,
+#ifdef CONFIG_AIC8800_AUTO_POWERSAVE
+		.auto_ps_support =3D false,
+#endif
+		.wakeup_reg_val =3D 1,
+		.use_hdr_checksum =3D false,
+		.need_fix_hdr_len =3D true,
+		.sdio_clock =3D SDIOWIFI_CLOCK,
+	},
+	[PRODUCT_ID_AIC8800DC] =3D {
+		.oob_support =3D true,
+		.use_func2 =3D true,
+		.use_sdiov3_func =3D false,
+		.need_flowctrl_mask =3D true,
+		.use_flowctrl_msg =3D false,
+		.hdr_cksum =3D false,
+		.need_func0_intr =3D false,
+#ifdef CONFIG_AIC8800_AUTO_POWERSAVE
+		.auto_ps_support =3D false,
+#endif
+		.wakeup_reg_val =3D 1,
+		.use_hdr_checksum =3D false,
+		.need_fix_hdr_len =3D true,
+		.sdio_clock =3D SDIOWIFI_CLOCK,
+	},
+	[PRODUCT_ID_AIC8800D80] =3D {
+		.oob_support =3D true,
+		.use_func2 =3D false,
+		.use_sdiov3_func =3D true,
+		.need_flowctrl_mask =3D false,
+		.use_flowctrl_msg =3D true,
+		.hdr_cksum =3D true,
+		.need_func0_intr =3D true,
+#ifdef CONFIG_AIC8800_AUTO_POWERSAVE
+		.auto_ps_support =3D true,
+#endif
+		.wakeup_reg_val =3D 0x11,
+		.use_hdr_checksum =3D true,
+		.need_fix_hdr_len =3D false,
+		.sdio_clock =3D SDIOWIFI_CLOCK_V3,
+	},
+	[PRODUCT_ID_AIC8800D80N] =3D {
+		.oob_support =3D true,
+		.use_func2 =3D false,
+		.use_sdiov3_func =3D true,
+		.need_flowctrl_mask =3D false,
+		/* commands are sent without polling the flow control register */
+		.use_flowctrl_msg =3D false,
+		.hdr_cksum =3D true,
+		.need_func0_intr =3D true,
+#ifdef CONFIG_AIC8800_AUTO_POWERSAVE
+		.auto_ps_support =3D true,
+#endif
+		.wakeup_reg_val =3D 0x11,
+		.use_hdr_checksum =3D true,
+		.need_fix_hdr_len =3D false,
+		.sdio_clock =3D SDIOWIFI_CLOCK_V3,
+	},
+};
+
+int aicwf_sdio_chipmatch(u16 vid, u16 did, u16 *chipid)
+{
+	if (vid =3D=3D SDIO_VENDOR_ID_AIC8800D80 &&
+	    did =3D=3D SDIO_DEVICE_ID_AIC8800D80) {
+		*chipid =3D PRODUCT_ID_AIC8800D80;
+		pr_debug("use AIC8800D80\n");
+		return 0;
+	}
+
+	if (vid =3D=3D SDIO_VENDOR_ID_AIC8800D80N &&
+	    (did =3D=3D SDIO_DEVICE_ID_AIC8800D80N ||
+	     did =3D=3D SDIO_DEVICE_ID_AIC8800D80LN ||
+	     did =3D=3D SDIO_DEVICE_ID_AIC8800D40N ||
+	     did =3D=3D SDIO_DEVICE_ID_AIC8800D40LN)) {
+		*chipid =3D PRODUCT_ID_AIC8800D80N;
+		pr_debug("use AIC8800D80N\n");
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
+const struct aic_sdio_chip_hw *aic_sdio_get_props(u16 chipid)
+{
+	if (chipid < ARRAY_SIZE(aic_sdio_chip_tbl))
+		return &aic_sdio_chip_tbl[chipid];
+	return NULL;
+}
+
+/*=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Chip ops wrappers =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D */
+int aic_chip_init_capa(struct aicwf_hw *aicwf_hw)
+{
+	if (aicwf_hw->chip_ops && aicwf_hw->chip_ops->init_capa)
+		return aicwf_hw->chip_ops->init_capa(aicwf_hw);
+	return 0;
+}
+
+int aic_chip_userconfig_load(struct aicwf_hw *aicwf_hw)
+{
+	if (aicwf_hw->chip_ops && aicwf_hw->chip_ops->userconfig_load)
+		return aicwf_hw->chip_ops->userconfig_load(aicwf_hw);
+	return -1;
+}
+
+void aic_chip_set_rf_calib_cfg(struct aicwf_hw *aicwf_hw,
+			       struct mm_set_rf_calib_req *rf_calib_req)
+{
+	if (aicwf_hw->chip_ops && aicwf_hw->chip_ops->set_rf_calib_cfg)
+		aicwf_hw->chip_ops->set_rf_calib_cfg(rf_calib_req);
+}
+
+int aic_chip_set_rf_config(struct aicwf_hw *aicwf_hw,
+			   struct mm_set_rf_calib_cfm *cfm)
+{
+	if (aicwf_hw->chip_ops && aicwf_hw->chip_ops->set_rf_config)
+		return aicwf_hw->chip_ops->set_rf_config(aicwf_hw, cfm);
+	return -1;
+}
+
+u8 aic_chip_cmd_hdr_checksum(struct aicwf_hw *aicwf_hw, u8 *hdr, int len)
+{
+	if (aicwf_hw->chip_ops && aicwf_hw->chip_ops->cmd_hdr_checksum)
+		return aicwf_hw->chip_ops->cmd_hdr_checksum(hdr, len);
+	return 0x00;
+}
+
+int aic_chip_set_stack_start(struct aicwf_hw *aicwf_hw,
+			     struct mm_set_stack_start_cfm *cfm)
+{
+	if (aicwf_hw->chip_ops && aicwf_hw->chip_ops->set_stack_start)
+		return aicwf_hw->chip_ops->set_stack_start(aicwf_hw, cfm);
+	return 0;
+}
+
+int aic_chip_get_userconfig_txpwr_ofst2x(struct aicwf_hw *aicwf_hw,
+					 struct txpwr_ofst2x_conf *txpwr_ofst2x)
+{
+	if (aicwf_hw->chip_ops && aicwf_hw->chip_ops->get_userconfig_txpwr_ofst2x=
)
+		return aicwf_hw->chip_ops->get_userconfig_txpwr_ofst2x(aicwf_hw,
+								      txpwr_ofst2x);
+	return 0;
+}
+
+int aic_chip_set_rx_gain(struct aicwf_hw *aicwf_hw, u8 aicwf_rx_gain)
+{
+	if (aicwf_hw->chip_ops && aicwf_hw->chip_ops->set_rx_gain)
+		return aicwf_hw->chip_ops->set_rx_gain(aicwf_hw, aicwf_rx_gain);
+	return 0;
+}
+
+int aic_chip_ic_system_init(struct aicwf_hw *aicwf_hw, struct dbg_mem_read=
_cfm *cfm)
+{
+	if (aicwf_hw->chip_ops && aicwf_hw->chip_ops->ic_system_init)
+		return aicwf_hw->chip_ops->ic_system_init(aicwf_hw, cfm);
+	return 0;
+}
+
+int aic_chip_fw_download(struct aicwf_hw *aicwf_hw)
+{
+	if (aicwf_hw->chip_ops && aicwf_hw->chip_ops->fw_download)
+		return aicwf_hw->chip_ops->fw_download(aicwf_hw);
+	return -ENODEV;
+}
+
+const struct aic_chip_ops *aic_chip_ops_select(u16 chipid)
+{
+	if (chipid =3D=3D PRODUCT_ID_AIC8800D80)
+		return &aic_chip_aic8800d80_ops;
+	if (chipid =3D=3D PRODUCT_ID_AIC8800D80N)
+		return &aic_chip_aic8800d80n_ops;
+
+	return NULL;
+}
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_ops.h b/drive=
rs/net/wireless/aic/aic8800_fdrv/aicwf_chip_ops.h
new file mode 100644
index 000000000000..88df4a6e4356
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_chip_ops.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 AIC semiconductor.
+ *
+ * @file aicwf_chip_ops.h
+ * @brief Chip-specific operation interfaces for AIC8800 series.
+ */
+#ifndef _AICWF_CHIP_OPS_H_
+#define _AICWF_CHIP_OPS_H_
+
+#include <linux/types.h>
+#include "lmac_types.h"
+#include "lmac_msg.h"
+
+struct aicwf_hw;
+struct mm_set_rf_calib_req;
+struct mm_set_rf_calib_cfm;
+struct mm_set_stack_start_cfm;
+struct aic_sdio_dev;
+
+/* SDIO chip hardware properties */
+struct aic_sdio_chip_hw {
+	bool oob_support;
+	bool use_func2;
+	bool use_sdiov3_func;
+	bool need_flowctrl_mask;
+	bool use_flowctrl_msg;
+	bool hdr_cksum;
+	bool need_func0_intr;
+#ifdef CONFIG_AIC8800_AUTO_POWERSAVE
+	bool auto_ps_support;
+#endif
+	u8 wakeup_reg_val;
+	bool use_hdr_checksum;
+	bool need_fix_hdr_len;
+	u32 sdio_clock;
+};
+
+/*
+ * struct aic_chip_ops - Chip-specific operations
+ *
+ * Each chip variant provides an instance of this struct.
+ * Selected at probe time based on chipid, then used to
+ * eliminate chipid-based if-else branching throughout the driver.
+ */
+struct aic_chip_ops {
+	const char *name;
+
+	const bool is_old_ic;
+
+	const bool limit_by_testmode;
+
+	const bool use_80_bandwidth;
+
+	/* Initialize chip-specific capabilities in mod_params */
+	int (*init_capa)(struct aicwf_hw *aicwf_hw);
+
+	/* Load chip-specific user configuration */
+	int (*userconfig_load)(struct aicwf_hw *aicwf_hw);
+
+	/* Set RF calibration config values (cal_cfg_24g / cal_cfg_5g) */
+	void (*set_rf_calib_cfg)(struct mm_set_rf_calib_req *rf_calib_req);
+
+	/* Chip-specific RF init sequence (txpwr, RF config, etc.) */
+	int (*set_rf_config)(struct aicwf_hw *aicwf_hw,
+			     struct mm_set_rf_calib_cfm *cfm);
+
+	/* Compute checksum for firmware command header */
+	u8 (*cmd_hdr_checksum)(u8 *hdr, int len);
+
+	/* Initialize the FW stack start (params differ per chip) */
+	int (*set_stack_start)(struct aicwf_hw *aicwf_hw,
+			       struct mm_set_stack_start_cfm *cfm);
+
+	/* Get userconfig TX power offset values */
+	int (*get_userconfig_txpwr_ofst2x)(struct aicwf_hw *aicwf_hw,
+					   struct txpwr_ofst2x_conf *txpwr_ofst2x);
+
+	/* Set RX gain */
+	int (*set_rx_gain)(struct aicwf_hw *aicwf_hw, u8 aicwf_rx_gain);
+
+	int (*ic_system_init)(struct aicwf_hw *aicwf_hw, struct dbg_mem_read_cfm =
*cfm);
+
+	/* Download and start the firmware from the bootrom */
+	int (*fw_download)(struct aicwf_hw *aicwf_hw);
+};
+
+extern const struct aic_chip_ops aic_chip_aic8800d80_ops;
+extern const struct aic_chip_ops aic_chip_aic8800d80n_ops;
+
+/* Match SDIO vendor/device IDs to a chip product ID */
+int aicwf_sdio_chipmatch(u16 vendor, u16 device, u16 *chipid);
+
+/* Get SDIO hardware properties for a given chip product ID */
+const struct aic_sdio_chip_hw *aic_sdio_get_props(u16 chipid);
+
+/* Select the appropriate chip ops based on chip product ID */
+const struct aic_chip_ops *aic_chip_ops_select(u16 chipid);
+
+/* Wrapper function declarations (implemented in aic_chip_ops.c) */
+int aic_chip_init_capa(struct aicwf_hw *aicwf_hw);
+int aic_chip_userconfig_load(struct aicwf_hw *aicwf_hw);
+void aic_chip_set_rf_calib_cfg(struct aicwf_hw *aicwf_hw,
+			       struct mm_set_rf_calib_req *rf_calib_req);
+int aic_chip_set_rf_config(struct aicwf_hw *aicwf_hw,
+			   struct mm_set_rf_calib_cfm *cfm);
+u8 aic_chip_cmd_hdr_checksum(struct aicwf_hw *aicwf_hw, u8 *hdr, int len);
+int aic_chip_set_stack_start(struct aicwf_hw *aicwf_hw,
+			     struct mm_set_stack_start_cfm *cfm);
+int aic_chip_get_userconfig_txpwr_ofst2x(struct aicwf_hw *aicwf_hw,
+					 struct txpwr_ofst2x_conf *txpwr_ofst2x);
+int aic_chip_set_rx_gain(struct aicwf_hw *aicwf_hw, u8 aicwf_rx_gain);
+int aic_chip_ic_system_init(struct aicwf_hw *aicwf_hw,
+			    struct dbg_mem_read_cfm *cfm);
+int aic_chip_fw_download(struct aicwf_hw *aicwf_hw);
+#endif /* _AICWF_CHIP_OPS_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_cmds.c b/drivers/n=
et/wireless/aic/aic8800_fdrv/aicwf_cmds.c
new file mode 100644
index 000000000000..a2f30152d030
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_cmds.c
@@ -0,0 +1,629 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *************************************************************************=
*****
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief Handles queueing (push to IPC, ack/cfm from IPC) of commands iss=
ued to
+ * LMAC FW
+ *
+ *************************************************************************=
*****
+ */
+
+#include "aicwf_cmds.h"
+#include "aicwf_txrxif.h"
+#include "aicwf_defs.h"
+#include "aicwf_events.h"
+#include "aicwf_strs.h"
+#include <linux/list.h>
+#include "aicwf_sdio.h"
+
+static bool cmd_mgr_idle(struct aicwf_cmd_mgr *cmd_mgr)
+{
+	unsigned long flags;
+	bool idle;
+
+	spin_lock_irqsave(&cmd_mgr->pool_lock, flags);
+	idle =3D !cmd_mgr->users;
+	spin_unlock_irqrestore(&cmd_mgr->pool_lock, flags);
+	return idle;
+}
+
+/* Keep the caller alive through its final SDIO activity release. */
+int aicwf_cmd_mgr_get(struct aicwf_cmd_mgr *cmd_mgr)
+{
+	unsigned long flags;
+	int ret =3D 0;
+
+	if (!READ_ONCE(cmd_mgr->cmd_wq))
+		return -ESHUTDOWN;
+	spin_lock_bh(&cmd_mgr->lock);
+	if (cmd_mgr->state !=3D AICWF_CMD_MGR_STATE_INITED) {
+		ret =3D cmd_mgr->state =3D=3D AICWF_CMD_MGR_STATE_CRASHED ?
+			-EPIPE : -ESHUTDOWN;
+	} else {
+		spin_lock_irqsave(&cmd_mgr->pool_lock, flags);
+		cmd_mgr->users++;
+		spin_unlock_irqrestore(&cmd_mgr->pool_lock, flags);
+	}
+	spin_unlock_bh(&cmd_mgr->lock);
+	return ret;
+}
+
+void aicwf_cmd_mgr_put(struct aicwf_cmd_mgr *cmd_mgr)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&cmd_mgr->pool_lock, flags);
+	cmd_mgr->users--;
+	wake_up_all(&cmd_mgr->users_wait);
+	/* The idle predicate takes this lock before teardown can proceed. */
+	spin_unlock_irqrestore(&cmd_mgr->pool_lock, flags);
+}
+
+static void cmd_dump(const struct aicwf_cmd *cmd)
+{
+	if (!cmd) {
+		pr_debug("cmd is null\n");
+		return;
+	}
+	pr_debug("tkn[%d]  flags:%04x  result:%3d  cmd:%4d-%-24s - reqcfm(%4d-%-s=
)\n",
+		 cmd->tkn, cmd->flags, cmd->result, cmd->id, AICWF_ID2STR(cmd->id),
+		 cmd->reqid,
+		 cmd->reqid !=3D (lmac_msg_id_t)-1 ? AICWF_ID2STR(cmd->reqid) : "none");
+}
+
+/**
+ * aicwf_cmd_malloc - Take a command from the pool of a command manager
+ * @cmd_mgr: Command manager owning the pool
+ *
+ * Return: A free command, or %NULL if the pool is exhausted.
+ */
+struct aicwf_cmd *aicwf_cmd_malloc(struct aicwf_cmd_mgr *cmd_mgr)
+{
+	struct aicwf_cmd *cmd =3D NULL;
+	unsigned long flags;
+	int i;
+
+	spin_lock_irqsave(&cmd_mgr->pool_lock, flags);
+	for (i =3D 0; i < AICWF_CMD_ARRAY_SIZE; i++) {
+		if (!cmd_mgr->pool[i].used) {
+			cmd =3D &cmd_mgr->pool[i];
+			cmd->used =3D 1;
+			cmd->flags =3D 0;
+			cmd_mgr->users++;
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&cmd_mgr->pool_lock, flags);
+
+	if (!cmd) {
+		pr_err_ratelimited("cmd array is full\n");
+		return NULL;
+	}
+
+	if (i >=3D AICWF_CMD_HIGH_WATER_SIZE)
+		pr_debug("cmd array high watermark reached: %d\n", i);
+
+	return cmd;
+}
+
+/**
+ * aicwf_cmd_free - Return a command to the pool of a command manager
+ * @cmd_mgr: Command manager owning the pool
+ * @cmd: Command obtained from aicwf_cmd_malloc()
+ */
+void aicwf_cmd_free(struct aicwf_cmd_mgr *cmd_mgr, struct aicwf_cmd *cmd)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&cmd_mgr->pool_lock, flags);
+	cmd->used =3D 0;
+	pr_debug("cmd_array[%d]:%p\n", cmd->array_id, cmd);
+	cmd_mgr->users--;
+	wake_up_all(&cmd_mgr->users_wait);
+	spin_unlock_irqrestore(&cmd_mgr->pool_lock, flags);
+}
+
+static void aicwf_cmd_pool_init(struct aicwf_cmd_mgr *cmd_mgr)
+{
+	int i;
+
+	spin_lock_init(&cmd_mgr->pool_lock);
+	cmd_mgr->users =3D 0;
+	init_waitqueue_head(&cmd_mgr->users_wait);
+	for (i =3D 0; i < AICWF_CMD_ARRAY_SIZE; i++) {
+		cmd_mgr->pool[i].used =3D 0;
+		cmd_mgr->pool[i].array_id =3D i;
+	}
+}
+
+static void cmd_complete(struct aicwf_cmd_mgr *cmd_mgr, struct aicwf_cmd *=
cmd,
+			 int result)
+{
+	lockdep_assert_held(&cmd_mgr->lock);
+
+	list_del_init(&cmd->list);
+	cmd_mgr->queue_sz--;
+	cmd->flags |=3D AICWF_CMD_FLAG_DONE;
+	cmd->result =3D result;
+	cmd->e2a_msg =3D NULL;
+	cmd->e2a_msg_len =3D 0;
+	/* The sender or deferred worker still owns the command. */
+	complete(&cmd->complete);
+}
+
+static int cmd_mgr_wait_complete(struct aicwf_cmd_mgr *cmd_mgr,
+				 struct aicwf_cmd *cmd)
+{
+	struct aic_sdio_dev *sdiodev =3D
+		container_of(cmd_mgr, struct aic_sdio_dev, cmd_mgr);
+	unsigned long tout =3D msecs_to_jiffies(AICWF_80211_CMD_TIMEOUT_MS *
+					    max_t(u32, READ_ONCE(cmd_mgr->queue_sz), 1));
+	int ret;
+
+	if (!wait_for_completion_timeout(&cmd->complete, tout)) {
+		dev_err(sdiodev->dev, "cmd timed-out\n");
+		ret =3D aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.wakeup_reg, 2);
+		if (ret < 0)
+			dev_err(sdiodev->dev, "reg:%d write failed!\n",
+				sdiodev->sdio_reg.wakeup_reg);
+		cmd_dump(cmd);
+		spin_lock_bh(&cmd_mgr->lock);
+		/* A confirmation may have arrived at the timeout boundary. */
+		if (!(cmd->flags & AICWF_CMD_FLAG_DONE)) {
+			if (cmd_mgr->state =3D=3D AICWF_CMD_MGR_STATE_INITED)
+				cmd_mgr->state =3D AICWF_CMD_MGR_STATE_CRASHED;
+			cmd_complete(cmd_mgr, cmd, -ETIMEDOUT);
+		}
+		spin_unlock_bh(&cmd_mgr->lock);
+	}
+	return cmd->result;
+}
+
+static int cmd_mgr_wait_deferred(struct aicwf_cmd_mgr *cmd_mgr,
+				 struct aicwf_cmd *cmd)
+{
+	int ret;
+
+	/* The worker's bounded CFM wait also covers a deferred caller. */
+	wait_for_completion(&cmd->work_complete);
+	ret =3D cmd->result;
+	aicwf_cmd_free(cmd_mgr, cmd);
+	return ret;
+}
+
+int cmd_mgr_queue_force_defer(struct aicwf_cmd_mgr *cmd_mgr,
+			      struct aicwf_cmd *cmd)
+{
+	struct aic_sdio_dev *sdiodev =3D
+		container_of(cmd_mgr, struct aic_sdio_dev, cmd_mgr);
+	struct device *dev =3D sdiodev->dev;
+	bool wait =3D cmd->e2a_msg;
+	int ret;
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_msg_send(cmd->id);
+#endif
+	spin_lock_bh(&cmd_mgr->lock);
+
+	if (cmd_mgr->state !=3D AICWF_CMD_MGR_STATE_INITED) {
+		ret =3D cmd_mgr->state =3D=3D AICWF_CMD_MGR_STATE_CRASHED ?
+			-EPIPE : -ESHUTDOWN;
+		cmd->result =3D ret;
+		spin_unlock_bh(&cmd_mgr->lock);
+		kfree(cmd->a2e_msg);
+		aicwf_cmd_free(cmd_mgr, cmd);
+		return ret;
+	}
+
+	if (!list_empty(&cmd_mgr->cmds)) {
+		if (cmd_mgr->queue_sz =3D=3D cmd_mgr->max_queue_sz) {
+			dev_err(dev, "too many cmds %d already queued\n",
+				cmd_mgr->max_queue_sz);
+			cmd->result =3D -ENOMEM;
+			spin_unlock_bh(&cmd_mgr->lock);
+			kfree(cmd->a2e_msg);
+			aicwf_cmd_free(cmd_mgr, cmd);
+			return -ENOMEM;
+		}
+	}
+
+	cmd->flags |=3D AICWF_CMD_FLAG_WAIT_PUSH;
+	if (!wait)
+		cmd->flags |=3D AICWF_CMD_FLAG_NONBLOCK;
+
+	if (cmd->flags & AICWF_CMD_FLAG_REQ_CFM)
+		cmd->flags |=3D AICWF_CMD_FLAG_WAIT_CFM;
+
+	cmd->tkn =3D cmd_mgr->next_tkn++;
+	cmd->result =3D -EINPROGRESS;
+
+	init_completion(&cmd->complete);
+	init_completion(&cmd->work_complete);
+
+	list_add_tail(&cmd->list, &cmd_mgr->cmds);
+	cmd_mgr->queue_sz++;
+	WAKE_CMD_WORK(cmd_mgr);
+	spin_unlock_bh(&cmd_mgr->lock);
+	return wait ? cmd_mgr_wait_deferred(cmd_mgr, cmd) : 0;
+}
+
+static int cmd_mgr_queue(struct aicwf_cmd_mgr *cmd_mgr, struct aicwf_cmd *=
cmd)
+{
+	int ret;
+	struct aic_sdio_dev *sdiodev =3D
+		container_of(cmd_mgr, struct aic_sdio_dev, cmd_mgr);
+	bool defer_push =3D false;
+	bool wait =3D cmd->e2a_msg;
+
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_msg_send(cmd->id);
+#endif
+	spin_lock_bh(&cmd_mgr->lock);
+
+	if (cmd_mgr->state !=3D AICWF_CMD_MGR_STATE_INITED) {
+		ret =3D cmd_mgr->state =3D=3D AICWF_CMD_MGR_STATE_CRASHED ?
+			-EPIPE : -ESHUTDOWN;
+		cmd->result =3D ret;
+		spin_unlock_bh(&cmd_mgr->lock);
+		kfree(cmd->a2e_msg);
+		aicwf_cmd_free(cmd_mgr, cmd);
+		return ret;
+	}
+
+	if (!list_empty(&cmd_mgr->cmds)) {
+		struct aicwf_cmd *last;
+
+		if (cmd_mgr->queue_sz =3D=3D cmd_mgr->max_queue_sz) {
+			dev_err(sdiodev->dev, "too many cmds %d already queued\n",
+				cmd_mgr->max_queue_sz);
+			cmd->result =3D -ENOMEM;
+			spin_unlock_bh(&cmd_mgr->lock);
+			kfree(cmd->a2e_msg);
+			aicwf_cmd_free(cmd_mgr, cmd);
+			return -ENOMEM;
+		}
+		last =3D list_entry(cmd_mgr->cmds.prev, struct aicwf_cmd, list);
+		if (last->flags & (AICWF_CMD_FLAG_WAIT_ACK | AICWF_CMD_FLAG_WAIT_PUSH |
+				   AICWF_CMD_FLAG_WAIT_CFM)) {
+			cmd->flags |=3D AICWF_CMD_FLAG_WAIT_PUSH;
+			defer_push =3D true;
+		}
+	}
+
+	if (cmd->flags & AICWF_CMD_FLAG_REQ_CFM)
+		cmd->flags |=3D AICWF_CMD_FLAG_WAIT_CFM;
+
+	cmd->tkn =3D cmd_mgr->next_tkn++;
+	cmd->result =3D -EINPROGRESS;
+
+	init_completion(&cmd->complete);
+	init_completion(&cmd->work_complete);
+
+	list_add_tail(&cmd->list, &cmd_mgr->cmds);
+	cmd_mgr->queue_sz++;
+
+#ifdef CONFIG_AIC8800_ARP_OFFLOAD
+	if (cmd->a2e_msg->id =3D=3D ME_TRAFFIC_IND_REQ ||
+	    cmd->a2e_msg->id =3D=3D MM_SET_ARPOFFLOAD_REQ) {
+#else
+	if (cmd->a2e_msg->id =3D=3D ME_TRAFFIC_IND_REQ) {
+#endif
+		defer_push =3D true;
+		cmd->flags |=3D AICWF_CMD_FLAG_WAIT_PUSH;
+	}
+
+	if (defer_push) {
+		if (!wait)
+			cmd->flags |=3D AICWF_CMD_FLAG_NONBLOCK;
+		WAKE_CMD_WORK(cmd_mgr);
+	}
+	spin_unlock_bh(&cmd_mgr->lock);
+	if (defer_push)
+		return wait ? cmd_mgr_wait_deferred(cmd_mgr, cmd) : 0;
+
+	aicwf_set_cmd_tx(sdiodev, cmd->a2e_msg, AICWF_CMD_A2EMSG_LEN(cmd->a2e_msg=
));
+	kfree(cmd->a2e_msg);
+	cmd->a2e_msg =3D NULL;
+	ret =3D cmd_mgr_wait_complete(cmd_mgr, cmd);
+	WAKE_CMD_WORK(cmd_mgr);
+	aicwf_cmd_free(cmd_mgr, cmd);
+	return ret;
+}
+
+static int cmd_mgr_llind(struct aicwf_cmd_mgr *cmd_mgr, struct aicwf_cmd *=
cmd)
+{
+	struct aic_sdio_dev *sdiodev =3D
+		container_of(cmd_mgr, struct aic_sdio_dev, cmd_mgr);
+	struct device *dev =3D sdiodev->dev;
+	struct aicwf_cmd *cur, *acked =3D NULL;
+
+	spin_lock_bh(&cmd_mgr->lock);
+	list_for_each_entry(cur, &cmd_mgr->cmds, list) {
+		if (!acked) {
+			if (cur->tkn =3D=3D cmd->tkn) {
+				if (WARN_ON_ONCE(cur !=3D cmd))
+					cmd_dump(cmd);
+				acked =3D cur;
+				continue;
+			}
+		}
+		if (cur->flags & AICWF_CMD_FLAG_WAIT_PUSH)
+			break;
+	}
+	if (!acked) {
+		dev_err(dev, "error: acked cmd not found\n");
+	} else {
+		cmd->flags &=3D ~AICWF_CMD_FLAG_WAIT_ACK;
+		if (AICWF_CMD_WAIT_COMPLETE(cmd->flags))
+			cmd_complete(cmd_mgr, cmd, 0);
+	}
+	spin_unlock(&cmd_mgr->lock);
+
+	return 0;
+}
+
+void cmd_mgr_task_process(struct work_struct *work)
+{
+	struct aicwf_cmd_mgr *cmd_mgr =3D
+		container_of(work, struct aicwf_cmd_mgr, cmd_work);
+	struct aic_sdio_dev *sdiodev =3D
+		container_of(cmd_mgr, struct aic_sdio_dev, cmd_mgr);
+	struct aicwf_cmd *cur, *next;
+	bool nonblock, send;
+
+	while (1) {
+		next =3D NULL;
+		spin_lock_bh(&cmd_mgr->lock);
+		list_for_each_entry(cur, &cmd_mgr->cmds, list) {
+			if (cur->flags & AICWF_CMD_FLAG_WAIT_PUSH)
+				next =3D cur;
+			break;
+		}
+		if (!next) {
+			spin_unlock_bh(&cmd_mgr->lock);
+			break;
+		}
+		/* Claim the request before teardown can cancel a pending entry. */
+		next->flags &=3D ~AICWF_CMD_FLAG_WAIT_PUSH;
+		nonblock =3D next->flags & AICWF_CMD_FLAG_NONBLOCK;
+		send =3D cmd_mgr->state =3D=3D AICWF_CMD_MGR_STATE_INITED;
+		if (!send)
+			cmd_complete(cmd_mgr, next,
+				     cmd_mgr->state =3D=3D AICWF_CMD_MGR_STATE_CRASHED ?
+				     -EPIPE : -ESHUTDOWN);
+		spin_unlock_bh(&cmd_mgr->lock);
+
+		if (send)
+			aicwf_set_cmd_tx(sdiodev, next->a2e_msg,
+					 AICWF_CMD_A2EMSG_LEN(next->a2e_msg));
+		kfree(next->a2e_msg);
+		next->a2e_msg =3D NULL;
+		cmd_mgr_wait_complete(cmd_mgr, next);
+
+		if (nonblock)
+			aicwf_cmd_free(cmd_mgr, next);
+		else
+			/* Last worker access; the caller may now return its CFM. */
+			complete(&next->work_complete);
+	}
+}
+
+static int cmd_mgr_run_callback(struct aicwf_hw *aicwf_hw, struct aicwf_cm=
d *cmd,
+				struct aicwf_cmd_e2amsg *msg, msg_cb_fct cb)
+{
+	int res;
+
+	if (!cb)
+		return 0;
+
+	res =3D cb(aicwf_hw, cmd, msg);
+
+	return res;
+}
+
+static int cmd_mgr_msgind(struct aicwf_cmd_mgr *cmd_mgr,
+			  struct aicwf_cmd_e2amsg *msg, msg_cb_fct cb)
+{
+	struct aic_sdio_dev *sdiodev =3D
+		container_of(cmd_mgr, struct aic_sdio_dev, cmd_mgr);
+	struct aicwf_hw *aicwf_hw =3D sdiodev->aicwf_hw;
+	struct aicwf_cmd *cmd, *pos;
+	bool found =3D false;
+
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_msg_recv(msg->id);
+#endif
+	if (msg->param_len > AICWF_CMD_E2AMSG_LEN_MAX)
+		return -EMSGSIZE;
+
+	spin_lock_bh(&cmd_mgr->lock);
+	if (cmd_mgr->state =3D=3D AICWF_CMD_MGR_STATE_STOPPING ||
+	    cmd_mgr->state =3D=3D AICWF_CMD_MGR_STATE_DEINIT) {
+		spin_unlock_bh(&cmd_mgr->lock);
+		return 0;
+	}
+	list_for_each_entry_safe(cmd, pos, &cmd_mgr->cmds, list) {
+		if (cmd->reqid =3D=3D msg->id &&
+		    (cmd->flags & AICWF_CMD_FLAG_WAIT_CFM) &&
+		    !(cmd->flags & AICWF_CMD_FLAG_WAIT_PUSH)) {
+			if (cmd->e2a_msg && msg->param_len > cmd->e2a_msg_len) {
+				spin_unlock_bh(&cmd_mgr->lock);
+				dev_err_ratelimited(sdiodev->dev,
+						    "oversized confirmation %#x: %u bytes\n",
+						    msg->id, msg->param_len);
+				return -EMSGSIZE;
+			}
+
+			if (msg->id =3D=3D MM_GET_MAC_ADDR_CFM &&
+			    msg->param_len < sizeof(struct mm_get_mac_addr_cfm)) {
+				cmd_complete(cmd_mgr, cmd, -EBADMSG);
+				spin_unlock_bh(&cmd_mgr->lock);
+				dev_err_ratelimited(sdiodev->dev,
+						    "short MAC address confirmation\n");
+				return -EBADMSG;
+			}
+
+			if (msg->id =3D=3D MM_GET_FW_VERSION_CFM) {
+				const struct mm_get_fw_version_cfm *cfm =3D
+					(const void *)msg->param;
+				size_t hdr_len =3D offsetof(struct mm_get_fw_version_cfm,
+							  fw_version);
+
+				if (msg->param_len < hdr_len ||
+				    cfm->fw_version_len > sizeof(cfm->fw_version) ||
+				    cfm->fw_version_len > msg->param_len - hdr_len) {
+					cmd_complete(cmd_mgr, cmd, -EBADMSG);
+					spin_unlock_bh(&cmd_mgr->lock);
+					dev_err_ratelimited(sdiodev->dev,
+							    "invalid firmware version confirmation\n");
+					return -EBADMSG;
+				}
+			}
+
+			if (!cmd_mgr_run_callback(aicwf_hw, cmd, msg, cb)) {
+				found =3D true;
+				cmd->flags &=3D ~AICWF_CMD_FLAG_WAIT_CFM;
+				if (cmd->e2a_msg && msg->param_len)
+					memcpy(cmd->e2a_msg, &msg->param, msg->param_len);
+
+				if (AICWF_CMD_WAIT_COMPLETE(cmd->flags))
+					cmd_complete(cmd_mgr, cmd, 0);
+
+				break;
+			}
+		}
+	}
+	spin_unlock_bh(&cmd_mgr->lock);
+
+	if (!found)
+		cmd_mgr_run_callback(aicwf_hw, NULL, msg, cb);
+
+	return 0;
+}
+
+static void cmd_mgr_print(struct aicwf_cmd_mgr *cmd_mgr)
+{
+	struct aicwf_cmd *cur;
+
+	spin_lock_bh(&cmd_mgr->lock);
+	pr_debug("q_sz/max: %2d / %2d - next tkn: %d\n", cmd_mgr->queue_sz,
+		 cmd_mgr->max_queue_sz, cmd_mgr->next_tkn);
+	list_for_each_entry(cur, &cmd_mgr->cmds, list) {
+		cmd_dump(cur);
+	}
+	spin_unlock_bh(&cmd_mgr->lock);
+}
+
+static void cmd_mgr_drain(struct aicwf_cmd_mgr *cmd_mgr)
+{
+	struct aicwf_cmd *cur, *nxt;
+	bool pending, nonblock;
+
+	spin_lock_bh(&cmd_mgr->lock);
+	list_for_each_entry_safe(cur, nxt, &cmd_mgr->cmds, list) {
+		pending =3D cur->flags & AICWF_CMD_FLAG_WAIT_PUSH;
+		nonblock =3D cur->flags & AICWF_CMD_FLAG_NONBLOCK;
+		if (pending) {
+			kfree(cur->a2e_msg);
+			cur->a2e_msg =3D NULL;
+		}
+		cmd_complete(cmd_mgr, cur, -ESHUTDOWN);
+		if (!pending)
+			continue;
+		/* No worker owns a request still marked WAIT_PUSH. */
+		if (nonblock)
+			aicwf_cmd_free(cmd_mgr, cur);
+		else
+			complete(&cur->work_complete);
+	}
+	spin_unlock_bh(&cmd_mgr->lock);
+}
+
+int aicwf_cmd_mgr_init(struct aicwf_cmd_mgr *cmd_mgr)
+{
+	struct aic_sdio_dev *sdiodev =3D
+		container_of(cmd_mgr, struct aic_sdio_dev, cmd_mgr);
+	struct device *dev =3D sdiodev->dev;
+
+	INIT_LIST_HEAD(&cmd_mgr->cmds);
+	cmd_mgr->state =3D AICWF_CMD_MGR_STATE_DEINIT;
+	spin_lock_init(&cmd_mgr->lock);
+	aicwf_cmd_pool_init(cmd_mgr);
+	cmd_mgr->max_queue_sz =3D AICWF_CMD_MAX_QUEUED;
+	cmd_mgr->queue =3D &cmd_mgr_queue;
+	cmd_mgr->print =3D &cmd_mgr_print;
+	cmd_mgr->drain =3D &cmd_mgr_drain;
+	cmd_mgr->llind =3D &cmd_mgr_llind;
+	cmd_mgr->msgind =3D &cmd_mgr_msgind;
+
+	INIT_WORK(&cmd_mgr->cmd_work, cmd_mgr_task_process);
+	cmd_mgr->cmd_wq =3D create_singlethread_workqueue("cmd_wq");
+	if (!cmd_mgr->cmd_wq) {
+		dev_err(dev, "insufficient memory to create cmd workqueue\n");
+		return -ENOMEM;
+	}
+	cmd_mgr->state =3D AICWF_CMD_MGR_STATE_INITED;
+	return 0;
+}
+
+void aicwf_cmd_mgr_stop(struct aicwf_cmd_mgr *cmd_mgr)
+{
+	struct workqueue_struct *wq =3D READ_ONCE(cmd_mgr->cmd_wq);
+
+	/* Also covers cleanup before init, and repeated teardown. */
+	if (!wq)
+		return;
+	spin_lock_bh(&cmd_mgr->lock);
+	cmd_mgr->state =3D AICWF_CMD_MGR_STATE_STOPPING;
+	spin_unlock_bh(&cmd_mgr->lock);
+	cmd_mgr->drain(cmd_mgr);
+	/* A direct sender may still submit or queue work before its last put. */
+	wait_event(cmd_mgr->users_wait, cmd_mgr_idle(cmd_mgr));
+	flush_workqueue(wq);
+}
+
+void aicwf_cmd_mgr_deinit(struct aicwf_cmd_mgr *cmd_mgr)
+{
+	struct workqueue_struct *wq =3D READ_ONCE(cmd_mgr->cmd_wq);
+
+	if (!wq)
+		return;
+	aicwf_cmd_mgr_stop(cmd_mgr);
+	destroy_workqueue(wq);
+	WRITE_ONCE(cmd_mgr->cmd_wq, NULL);
+	cmd_mgr->state =3D AICWF_CMD_MGR_STATE_DEINIT;
+}
+
+void aicwf_set_cmd_tx(void *dev, struct lmac_msg *msg, uint len)
+{
+	u8 *buffer =3D NULL;
+	u16 index =3D 0;
+	struct aic_sdio_dev *sdiodev =3D (struct aic_sdio_dev *)dev;
+	struct aicwf_bus *bus =3D sdiodev->bus_if;
+
+	buffer =3D bus->cmd_buf;
+
+	memset(buffer, 0, CMD_BUF_MAX);
+	buffer[0] =3D (len + 4) & 0x00ff;
+	buffer[1] =3D ((len + 4) >> 8) & 0x0f;
+	buffer[2] =3D 0x11;
+
+	buffer[3] =3D aic_chip_cmd_hdr_checksum(sdiodev->aicwf_hw, &buffer[0], 3)=
;
+
+	index +=3D 4;
+	// there is a dummy word
+	index +=3D 4;
+
+	// make sure little endian
+	put_u16(&buffer[index], msg->id);
+	index +=3D 2;
+	put_u16(&buffer[index], msg->dest_id);
+	index +=3D 2;
+	put_u16(&buffer[index], msg->src_id);
+	index +=3D 2;
+	put_u16(&buffer[index], msg->param_len);
+	index +=3D 2;
+	memcpy(&buffer[index], (u8 *)msg->param, msg->param_len);
+
+	aicwf_bus_txmsg(bus, buffer, len + 8);
+}
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_cmds.h b/drivers/n=
et/wireless/aic/aic8800_fdrv/aicwf_cmds.h
new file mode 100644
index 000000000000..e20a2be918fe
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_cmds.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_CMDS_H_
+#define _AICWF_CMDS_H_
+
+#include "lmac_msg.h"
+#include "ipc_shared.h"
+#include <linux/completion.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+#include <linux/wait.h>
+
+#define AICWF_80211_CMD_TIMEOUT_MS 6000
+
+#define AICWF_CMD_FLAG_NONBLOCK  BIT(0)
+#define AICWF_CMD_FLAG_REQ_CFM   BIT(1)
+#define AICWF_CMD_FLAG_WAIT_PUSH BIT(2)
+#define AICWF_CMD_FLAG_WAIT_ACK  BIT(3)
+#define AICWF_CMD_FLAG_WAIT_CFM  BIT(4)
+#define AICWF_CMD_FLAG_DONE      BIT(5)
+/* ATM IPC design makes it possible to get the CFM before the ACK,
+ * otherwise this could have simply been a state enum
+ */
+#define AICWF_CMD_WAIT_COMPLETE(flags)                                    =
      \
+	(!((flags) & (AICWF_CMD_FLAG_WAIT_ACK | AICWF_CMD_FLAG_WAIT_CFM)))
+
+#define AICWF_CMD_MAX_QUEUED 16
+
+/* Number of commands that can be in flight at the same time */
+#define AICWF_CMD_ARRAY_SIZE      20
+#define AICWF_CMD_HIGH_WATER_SIZE (AICWF_CMD_ARRAY_SIZE / 2)
+
+#define aicwf_cmd_e2amsg         ipc_e2a_msg
+#define aicwf_cmd_a2emsg         lmac_msg
+#define AICWF_CMD_A2EMSG_LEN(m)  (sizeof(struct lmac_msg) + (m)->param_len=
)
+#define AICWF_CMD_E2AMSG_LEN_MAX (IPC_E2A_MSG_PARAM_SIZE * 4)
+
+#define WAKE_CMD_WORK(_cmd_mgr)							\
+	do {									\
+		struct aicwf_cmd_mgr *__mgr =3D (_cmd_mgr);                        \
+		queue_work((__mgr)->cmd_wq, &__mgr->cmd_work);		        \
+	} while (0)
+
+struct aicwf_hw;
+struct aicwf_cmd;
+typedef int (*msg_cb_fct)(struct aicwf_hw *aicwf_hw, struct aicwf_cmd *cmd=
,
+			  struct aicwf_cmd_e2amsg *msg);
+
+enum aicwf_cmd_mgr_state {
+	AICWF_CMD_MGR_STATE_DEINIT,
+	AICWF_CMD_MGR_STATE_INITED,
+	AICWF_CMD_MGR_STATE_CRASHED,
+	AICWF_CMD_MGR_STATE_STOPPING,
+};
+
+struct aicwf_cmd {
+	struct list_head list;
+	lmac_msg_id_t id;
+	lmac_msg_id_t reqid;
+	struct aicwf_cmd_a2emsg *a2e_msg;
+	char *e2a_msg;
+	size_t e2a_msg_len;
+	u32 tkn;
+	u16 flags;
+
+	struct completion complete;
+	/* The deferred worker has finished using this command. */
+	struct completion work_complete;
+	int result;
+	u8 used;
+	int array_id;
+};
+
+struct aicwf_cmd_mgr {
+	enum aicwf_cmd_mgr_state state;
+	spinlock_t lock; //
+	u32 next_tkn;
+	u32 queue_sz;
+	u32 max_queue_sz;
+
+	struct list_head cmds;
+
+	int (*queue)(struct aicwf_cmd_mgr *mgr, struct aicwf_cmd *cmd);
+	int (*llind)(struct aicwf_cmd_mgr *mgr, struct aicwf_cmd *cmd);
+	int (*msgind)(struct aicwf_cmd_mgr *mgr, struct aicwf_cmd_e2amsg *msg, ms=
g_cb_fct cb);
+	void (*print)(struct aicwf_cmd_mgr *mgr);
+	void (*drain)(struct aicwf_cmd_mgr *mgr);
+
+	struct work_struct cmd_work;
+	struct workqueue_struct *cmd_wq;
+
+	/* Commands are taken from this pool */
+	struct aicwf_cmd pool[AICWF_CMD_ARRAY_SIZE];
+	/* Protects the @used flag of every entry of @pool and @users. */
+	spinlock_t pool_lock;
+	/* Send callers and borrowed commands must exit before device teardown. *=
/
+	unsigned int users;
+	wait_queue_head_t users_wait;
+};
+
+static inline void put_u16(u8 *buf, u16 data)
+{
+	buf[0] =3D (u8)(data & 0x00ff);
+	buf[1] =3D (u8)((data >> 8) & 0x00ff);
+}
+
+int aicwf_cmd_mgr_init(struct aicwf_cmd_mgr *cmd_mgr);
+int aicwf_cmd_mgr_get(struct aicwf_cmd_mgr *cmd_mgr);
+void aicwf_cmd_mgr_put(struct aicwf_cmd_mgr *cmd_mgr);
+void aicwf_cmd_mgr_stop(struct aicwf_cmd_mgr *cmd_mgr);
+void aicwf_cmd_mgr_deinit(struct aicwf_cmd_mgr *cmd_mgr);
+int cmd_mgr_queue_force_defer(struct aicwf_cmd_mgr *cmd_mgr,
+			      struct aicwf_cmd *cmd);
+void aicwf_set_cmd_tx(void *dev, struct lmac_msg *msg, uint len);
+void cmd_mgr_task_process(struct work_struct *work);
+struct aicwf_cmd *aicwf_cmd_malloc(struct aicwf_cmd_mgr *cmd_mgr);
+void aicwf_cmd_free(struct aicwf_cmd_mgr *cmd_mgr, struct aicwf_cmd *cmd);
+
+#endif /* _AICWF_CMDS_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800d80.c b=
/drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800d80.c
new file mode 100644
index 000000000000..2833cb684303
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800d80.c
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *************************************************************************=
*****
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief 8800d80 compatibility configuration
+ *
+ *************************************************************************=
*****
+ */
+
+#include <linux/module.h>
+
+#include "aicwf_compat_8800d80.h"
+#include "aicwf_platform.h"
+
+#define FW_USERCONFIG_NAME_8800D80 "aic8800d80/aic_userconfig_8800d80.txt"
+#define FW_NAME_8800D80_U02        "aic8800d80/fmacfw_8800d80_u02.bin"
+
+#define RAM_FMAC_FW_ADDR 0x00120000
+#define CHIP_REV_U02     3
+
+#define AIC_PATCH_MAGIC_NUM   0x48435450 /* "PTCH" */
+#define AIC_PATCH_MAGIC_NUM_2 0x50544348 /* "HCTP" */
+#define AIC_PATCH_BLOCK_MAX   4
+
+struct aic_patch_t {
+	u32 magic_num;
+	u32 pair_start;
+	u32 magic_num_2;
+	u32 pair_count;
+	u32 block_dst[AIC_PATCH_BLOCK_MAX];
+	u32 block_src[AIC_PATCH_BLOCK_MAX];
+	u32 block_size[AIC_PATCH_BLOCK_MAX]; /* word count */
+};
+
+#define AIC_PATCH_ADDR(mem) ((u32)(aic_patch_str_base + offsetof(struct ai=
c_patch_t, mem)))
+
+#define USER_CHAN_MAX_TXPWR_EN_FLAG BIT(1)
+
+static const u32 patch_tbl_8800d80[][2] =3D {
+#if IS_ENABLED(CONFIG_AIC8800_USE_5G)
+	{0x00b4, 0xf3010001},
+#else
+	{0x00b4, 0xf3010000},
+#endif
+	{0x0188, 0x00000001 | USER_CHAN_MAX_TXPWR_EN_FLAG}, /* user_ext_flags */
+};
+
+#ifdef CONFIG_OOB
+/* map the SDIO data1 interrupt to gpiob1 */
+static const u32 gpio_cfg_tbl_8800d80[][2] =3D {
+	{0x40504084, 0x00000006}, {0x40500040, 0x00000000},
+	{0x40100030, 0x00000001}, {0x40241020, 0x00000001},
+	{0x40240030, 0x00000004}, {0x40240020, 0x03020700},
+};
+#endif
+
+static int aicwf_chip_rev_check_8800d80(struct aicwf_hw *aicwf_hw)
+{
+	struct dbg_mem_read_cfm cfm;
+	u8 chip_rev;
+	bool is_chip_id_h;
+	int ret;
+
+	ret =3D aicwf_send_dbg_mem_read_req(aicwf_hw, 0x40500000, &cfm);
+	if (ret)
+		return ret;
+
+	chip_rev =3D (u8)((cfm.memdata >> 16) & 0x3F);
+	is_chip_id_h =3D ((cfm.memdata >> 16) & 0xC0) =3D=3D 0xC0;
+	if (is_chip_id_h) {
+		dev_err(aicwf_hw->dev, "AIC8800D80 U02 is required (revision %u)\n",
+			chip_rev);
+		return -ENODEV;
+	}
+	dev_dbg(aicwf_hw->dev, "chip rev: %d\n", chip_rev);
+
+	return 0;
+}
+
+static int aicwf_patch_config_8800d80(struct aicwf_hw *aicwf_hw)
+{
+	const u32 rd_patch_addr =3D RAM_FMAC_FW_ADDR + 0x0198;
+	const u32 patch_cnt =3D ARRAY_SIZE(patch_tbl_8800d80);
+	struct dbg_mem_read_cfm cfm;
+	u32 config_base, aic_patch_str_base;
+	u32 start_addr =3D 0x0016F800;
+	u32 version;
+	int ret;
+	int cnt;
+
+	ret =3D aicwf_send_dbg_mem_read_req(aicwf_hw, rd_patch_addr, &cfm);
+	if (ret) {
+		dev_err(aicwf_hw->dev, "patch rd fail\n");
+		return ret;
+	}
+	config_base =3D cfm.memdata;
+
+	ret =3D aicwf_send_dbg_mem_read_req(aicwf_hw, rd_patch_addr + 8, &cfm);
+	if (ret) {
+		dev_err(aicwf_hw->dev, "patch str rd fail\n");
+		return ret;
+	}
+	aic_patch_str_base =3D cfm.memdata;
+
+	ret =3D aicwf_send_dbg_mem_read_req(aicwf_hw, RAM_FMAC_FW_ADDR + 0x01C, &=
cfm);
+	if (ret) {
+		dev_err(aicwf_hw->dev, "version val[0x%x] rd fail: %d\n",
+			RAM_FMAC_FW_ADDR + 0x01C, ret);
+		return ret;
+	}
+	version =3D cfm.memdata;
+	dev_dbg(aicwf_hw->dev, "rd_version_val=3D%08X\n", version);
+	if (version > 0x06090100) {
+		ret =3D aicwf_send_dbg_mem_read_req(aicwf_hw, rd_patch_addr + 12, &cfm);
+		if (ret) {
+			dev_err(aicwf_hw->dev, "patch buf rd fail\n");
+			return ret;
+		}
+		start_addr =3D cfm.memdata;
+	}
+
+	ret =3D aicwf_send_dbg_mem_write_req(aicwf_hw, AIC_PATCH_ADDR(magic_num),
+					   AIC_PATCH_MAGIC_NUM);
+	if (ret)
+		goto write_fail;
+	ret =3D aicwf_send_dbg_mem_write_req(aicwf_hw, AIC_PATCH_ADDR(magic_num_2=
),
+					   AIC_PATCH_MAGIC_NUM_2);
+	if (ret)
+		goto write_fail;
+	ret =3D aicwf_send_dbg_mem_write_req(aicwf_hw, AIC_PATCH_ADDR(pair_start)=
,
+					   start_addr);
+	if (ret)
+		goto write_fail;
+	ret =3D aicwf_send_dbg_mem_write_req(aicwf_hw, AIC_PATCH_ADDR(pair_count)=
,
+					   patch_cnt);
+	if (ret)
+		goto write_fail;
+
+	for (cnt =3D 0; cnt < patch_cnt; cnt++) {
+		ret =3D aicwf_send_dbg_mem_write_req(aicwf_hw, start_addr + 8 * cnt,
+						   patch_tbl_8800d80[cnt][0] + config_base);
+		if (ret)
+			goto write_fail;
+		ret =3D aicwf_send_dbg_mem_write_req(aicwf_hw, start_addr + 8 * cnt + 4,
+						   patch_tbl_8800d80[cnt][1]);
+		if (ret)
+			goto write_fail;
+	}
+
+	for (cnt =3D 0; cnt < AIC_PATCH_BLOCK_MAX; cnt++) {
+		ret =3D aicwf_send_dbg_mem_write_req(aicwf_hw,
+						   AIC_PATCH_ADDR(block_size[cnt]), 0);
+		if (ret)
+			goto write_fail;
+	}
+
+	return 0;
+
+write_fail:
+	dev_err(aicwf_hw->dev, "patch config write fail: %d\n", ret);
+	return ret;
+}
+
+static int aicwf_sys_config_8800d80(struct aicwf_hw *aicwf_hw)
+{
+#ifdef CONFIG_OOB
+	int ret, cnt;
+
+	for (cnt =3D 0; cnt < ARRAY_SIZE(gpio_cfg_tbl_8800d80); cnt++) {
+		ret =3D aicwf_send_dbg_mem_write_req(aicwf_hw,
+						   gpio_cfg_tbl_8800d80[cnt][0],
+						   gpio_cfg_tbl_8800d80[cnt][1]);
+		if (ret) {
+			dev_err(aicwf_hw->dev, "%x write fail: %d\n",
+				gpio_cfg_tbl_8800d80[cnt][0], ret);
+			return ret;
+		}
+	}
+#endif
+
+	return 0;
+}
+
+/**
+ * aicwf_fw_download_8800d80() - Boot the AIC8800D80 firmware
+ * @aicwf_hw: Main driver data
+ *
+ * Talk to the bootrom to check the chip revision, upload the firmware,
+ * configure its patch table and start it.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int aicwf_fw_download_8800d80(struct aicwf_hw *aicwf_hw)
+{
+	int ret;
+
+	ret =3D aicwf_chip_rev_check_8800d80(aicwf_hw);
+	if (ret)
+		return ret;
+
+	dev_dbg(aicwf_hw->dev, "8800d80 u02 wifi firmware: %s\n",
+		FW_NAME_8800D80_U02);
+	ret =3D aicwf_plat_bin_fw_upload(aicwf_hw, RAM_FMAC_FW_ADDR,
+				       FW_NAME_8800D80_U02);
+	if (ret) {
+		dev_err(aicwf_hw->dev, "8800d80 download wifi fw fail\n");
+		return ret;
+	}
+
+	ret =3D aicwf_patch_config_8800d80(aicwf_hw);
+	if (ret)
+		return ret;
+
+	ret =3D aicwf_sys_config_8800d80(aicwf_hw);
+	if (ret)
+		return ret;
+
+	ret =3D aicwf_send_dbg_start_app_req(aicwf_hw, RAM_FMAC_FW_ADDR,
+					   HOST_START_APP_AUTO);
+	if (ret)
+		dev_err(aicwf_hw->dev, "8800d80 wifi start fail\n");
+
+	return ret;
+}
+
+int aicwf_set_rf_config_8800d80(struct aicwf_hw *aicwf_hw,
+				struct mm_set_rf_calib_cfm *cfm)
+{
+	int ret =3D 0;
+
+	/* Preserve the existing rate-power settings; cfg80211 supplies channel l=
imits. */
+	ret =3D aicwf_send_txpwr_lvl_v3_req(aicwf_hw, 0);
+	if (ret)
+		return -1;
+
+	ret =3D aicwf_send_txpwr_lvl_adj_req(aicwf_hw);
+	if (ret)
+		return -1;
+
+	ret =3D aicwf_send_txpwr_ofst2x_req(aicwf_hw);
+	if (ret)
+		return -1;
+
+	ret =3D aicwf_send_rf_calib_req(aicwf_hw, cfm);
+	if (ret)
+		return -1;
+
+	return 0;
+}
+
+int aicwf_plat_userconfig_load_8800d80(struct aicwf_hw *aicwf_hw)
+{
+	int size;
+	u32 *dst =3D NULL;
+	char *filename =3D FW_USERCONFIG_NAME_8800D80;
+
+	dev_dbg(aicwf_hw->dev, "userconfig file path:%s\n", filename);
+
+	/* load file */
+	size =3D aicwf_request_firmware_common(aicwf_hw, &dst, filename);
+	if (size <=3D 0) {
+		dev_err(aicwf_hw->dev, "wrong size of firmware file\n");
+		dst =3D NULL;
+		return 0;
+	}
+
+	/* Copy the file on the Embedded side */
+	dev_dbg(aicwf_hw->dev, "load file done: %s, size=3D%d\n", filename, size)=
;
+
+	aicwf_plat_userconfig_parsing3(aicwf_hw, (char *)dst, size);
+
+	aicwf_release_firmware_common(&dst);
+
+	dev_dbg(aicwf_hw->dev, "userconfig download complete\n");
+	return 0;
+}
+
+MODULE_FIRMWARE(AIC8800_FW_DIR FW_USERCONFIG_NAME_8800D80);
+MODULE_FIRMWARE(AIC8800_FW_DIR FW_NAME_8800D80_U02);
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800d80.h b=
/drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800d80.h
new file mode 100644
index 000000000000..7b608806ebac
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800d80.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_COMPAT_8800D80_H_
+#define _AICWF_COMPAT_8800D80_H_
+#include "aicwf_main.h"
+#include "aicwf_msg_tx.h"
+#include <linux/types.h>
+
+int aicwf_set_rf_config_8800d80(struct aicwf_hw *aicwf_hw,
+				struct mm_set_rf_calib_cfm *cfm);
+int aicwf_plat_userconfig_load_8800d80(struct aicwf_hw *aicwf_hw);
+int aicwf_fw_download_8800d80(struct aicwf_hw *aicwf_hw);
+
+#endif
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800d80n.c =
b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800d80n.c
new file mode 100644
index 000000000000..53f68b9684e1
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800d80n.c
@@ -0,0 +1,402 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *************************************************************************=
*****
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief 8800d80n compatibility configuration
+ *
+ *************************************************************************=
*****
+ */
+
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/vmalloc.h>
+
+#include "aicwf_compat_8800d80n.h"
+#include "aicwf_platform.h"
+
+#define FW_USERCONFIG_NAME_8800D80N "aic8800d80n/aic_userconfig_8800d80n.t=
xt"
+
+#define FW_CINIT_NAME_8800D80N_U02     "aic8800d80n/fmacfw_cinit_8800d80n_=
u02.bin"
+#define FW_CALIB_NAME_8800D80N_U02     "aic8800d80n/fmacfw_calib_8800d80n_=
u02.bin"
+#define FW_PATCH_NAME_8800D80N_U02     "aic8800d80n/fmacfw_patch_8800d80n_=
u02.bin"
+#define FW_PATCH_TBL_NAME_8800D80N_U02 "aic8800d80n/fmacfw_patch_tbl_8800d=
80n_u02.bin"
+#define FW_CINIT_NAME_8800D80N_U02C     "aic8800d80n/fmacfw_cinit_8800d80n=
_u02c.bin"
+#define FW_CALIB_NAME_8800D80N_U02C     "aic8800d80n/fmacfw_calib_8800d80n=
_u02c.bin"
+#define FW_PATCH_NAME_8800D80N_U02C     "aic8800d80n/fmacfw_patch_8800d80n=
_u02c.bin"
+#define FW_PATCH_TBL_NAME_8800D80N_U02C "aic8800d80n/fmacfw_patch_tbl_8800=
d80n_u02c.bin"
+
+#define RAM_FMAC_FW_ADDR             0x00120000
+#define ROM_FMAC_CINIT_ADDR_8800D80N 0x00133000
+#define ROM_FMAC_CALIB_ADDR_8800D80N 0x00138000
+#define ROM_FMAC_PATCH_ADDR_8800D80N 0x00188000
+
+/* the wifisetting block address is stored here by the ROM */
+#define WIFISETTING_CFG_BASE_8800D80N 0x10170
+#define WIFISETTING_XTAL_CAP_OFST     0x1dc
+
+#define CHIP_INFO_ADDR_8800D80N    0x40500184
+#define CHIP_INFO_FLAG_CINIT_BEGIN BIT(12)
+#define CHIP_INFO_FLAG_CINIT_DONE  BIT(13)
+#define CINIT_WAIT_RETRY_MAX       2000
+
+#define PATCH_VAR_FLAG_CALIB_BEGIN BIT(0)
+#define PATCH_VAR_FLAG_CALIB_DONE  BIT(1)
+
+#define USER_PWROFST_COVER_CALIB_FLAG BIT(0)
+
+static const u32 patch_tbl_wifisetting_8800d80n[][2] =3D {
+	{0x017c, USER_PWROFST_COVER_CALIB_FLAG}, /* user_ext_flags */
+	{0x0170, 0x50000001},                    /* gpio_wakeup_en */
+};
+
+struct aicwf_fw_8800d80n {
+	const char *cinit;
+	const char *calib;
+	const char *patch;
+	const char *patch_tbl;
+};
+
+static const struct aicwf_fw_8800d80n fw_8800d80n_u02 =3D {
+	.cinit =3D FW_CINIT_NAME_8800D80N_U02,
+	.calib =3D FW_CALIB_NAME_8800D80N_U02,
+	.patch =3D FW_PATCH_NAME_8800D80N_U02,
+	.patch_tbl =3D FW_PATCH_TBL_NAME_8800D80N_U02,
+};
+
+static const struct aicwf_fw_8800d80n fw_8800d80n_u02c =3D {
+	.cinit =3D FW_CINIT_NAME_8800D80N_U02C,
+	.calib =3D FW_CALIB_NAME_8800D80N_U02C,
+	.patch =3D FW_PATCH_NAME_8800D80N_U02C,
+	.patch_tbl =3D FW_PATCH_TBL_NAME_8800D80N_U02C,
+};
+
+static int aicwf_userconfig_parse_8800d80n(struct aicwf_hw *aicwf_hw)
+{
+	u32 *dst =3D NULL;
+	int size;
+
+	size =3D aicwf_request_firmware_common(aicwf_hw, &dst,
+					     FW_USERCONFIG_NAME_8800D80N);
+	if (size <=3D 0) {
+		dev_err(aicwf_hw->dev, "failed to load %s: %d\n",
+			FW_USERCONFIG_NAME_8800D80N, size);
+		vfree(dst);
+		return size < 0 ? size : -EINVAL;
+	}
+
+	aicwf_plat_userconfig_parsing3(aicwf_hw, (char *)dst, size);
+	aicwf_release_firmware_common(&dst);
+
+	return 0;
+}
+
+int aicwf_plat_userconfig_load_8800d80n(struct aicwf_hw *aicwf_hw)
+{
+	aicwf_userconfig_parse_8800d80n(aicwf_hw);
+	return 0;
+}
+
+static int aicwf_wifisetting_addr_8800d80n(struct aicwf_hw *aicwf_hw, u32 =
*addr)
+{
+	struct dbg_mem_read_cfm cfm;
+	int ret;
+
+	ret =3D aicwf_send_dbg_mem_read_req(aicwf_hw, WIFISETTING_CFG_BASE_8800D8=
0N,
+					  &cfm);
+	if (ret) {
+		dev_err(aicwf_hw->dev, "setting base[0x%x] rd fail: %d\n",
+			WIFISETTING_CFG_BASE_8800D80N, ret);
+		return ret;
+	}
+	*addr =3D cfm.memdata;
+
+	return 0;
+}
+
+/* Write the default wifi settings and the user xtal cap into the ROM. */
+static int aicwf_patch_config_8800d80n(struct aicwf_hw *aicwf_hw)
+{
+	struct xtal_cap_conf xtal_cap =3D { 0 };
+	u32 wifisetting_cfg_addr;
+	int ret;
+	int cnt;
+
+	ret =3D aicwf_wifisetting_addr_8800d80n(aicwf_hw, &wifisetting_cfg_addr);
+	if (ret)
+		return ret;
+	dev_dbg(aicwf_hw->dev, "wifisetting_cfg_addr=3D%x\n", wifisetting_cfg_add=
r);
+
+	for (cnt =3D 0; cnt < ARRAY_SIZE(patch_tbl_wifisetting_8800d80n); cnt++) =
{
+		ret =3D aicwf_send_dbg_mem_write_req(aicwf_hw,
+						   wifisetting_cfg_addr +
+						   patch_tbl_wifisetting_8800d80n[cnt][0],
+						   patch_tbl_wifisetting_8800d80n[cnt][1]);
+		if (ret) {
+			dev_err(aicwf_hw->dev, "wifisetting %x write fail\n",
+				patch_tbl_wifisetting_8800d80n[cnt][0]);
+			return ret;
+		}
+	}
+
+	get_userconfig_xtal_cap(aicwf_hw, &xtal_cap);
+	if (xtal_cap.enable) {
+		dev_dbg(aicwf_hw->dev, "user xtal cap: %d, cap_fine: %d\n",
+			xtal_cap.xtal_cap, xtal_cap.xtal_cap_fine);
+		ret =3D aicwf_send_dbg_mem_write_req(aicwf_hw,
+						   wifisetting_cfg_addr +
+						   WIFISETTING_XTAL_CAP_OFST,
+						   (35 << 16) |
+						   (xtal_cap.xtal_cap_fine << 8) |
+						   xtal_cap.xtal_cap);
+		if (ret) {
+			dev_err(aicwf_hw->dev, "set user xtal cap fail\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/* Run the chip init code once, unless the ROM already did it. */
+static int aicwf_cinit_exec_8800d80n(struct aicwf_hw *aicwf_hw,
+				     const struct aicwf_fw_8800d80n *fw)
+{
+	struct dbg_mem_read_cfm cfm;
+	int retry =3D 0;
+	int ret;
+
+	ret =3D aicwf_send_dbg_mem_read_req(aicwf_hw, CHIP_INFO_ADDR_8800D80N, &c=
fm);
+	if (ret) {
+		dev_err(aicwf_hw->dev, "%x rd fail: %d\n", CHIP_INFO_ADDR_8800D80N, ret)=
;
+		return ret;
+	}
+
+	if (cfm.memdata & CHIP_INFO_FLAG_CINIT_BEGIN) {
+		while (!(cfm.memdata & CHIP_INFO_FLAG_CINIT_DONE)) {
+			if (++retry > CINIT_WAIT_RETRY_MAX) {
+				dev_err(aicwf_hw->dev, "cinit wait timeout, chipinfo=3D%x\n",
+					cfm.memdata);
+				return -ETIMEDOUT;
+			}
+			usleep_range(500, 1000);
+			ret =3D aicwf_send_dbg_mem_read_req(aicwf_hw,
+							  CHIP_INFO_ADDR_8800D80N, &cfm);
+			if (ret) {
+				dev_err(aicwf_hw->dev, "%x rd fail: %d\n",
+					CHIP_INFO_ADDR_8800D80N, ret);
+				return ret;
+			}
+		}
+		dev_dbg(aicwf_hw->dev, "cinit executed, chipinfo=3D%x\n", cfm.memdata);
+		return 0;
+	}
+
+	ret =3D aicwf_plat_bin_fw_upload(aicwf_hw, ROM_FMAC_CINIT_ADDR_8800D80N,
+				       fw->cinit);
+	if (ret) {
+		dev_err(aicwf_hw->dev, "load cinit bin fail: %d\n", ret);
+		return ret;
+	}
+
+	ret =3D aicwf_send_dbg_start_app_req(aicwf_hw,
+					   ROM_FMAC_CINIT_ADDR_8800D80N + 0x0009,
+					   HOST_START_APP_FNCALL);
+	if (ret)
+		dev_err(aicwf_hw->dev, "cinit start app fail: %d\n", ret);
+
+	return ret;
+}
+
+static int aicwf_patch_table_load_8800d80n(struct aicwf_hw *aicwf_hw,
+					   const char *filename)
+{
+	u32 *dst =3D NULL;
+	int size;
+	int err =3D 0;
+	int i;
+
+	size =3D aicwf_request_firmware_common(aicwf_hw, &dst, filename);
+	if (size <=3D 0) {
+		dev_err(aicwf_hw->dev, "failed to load %s: %d\n", filename, size);
+		vfree(dst);
+		return size < 0 ? size : -EINVAL;
+	}
+
+	for (i =3D 0; i + 1 < size / 4; i +=3D 2) {
+		if (dst[i] =3D=3D 0x0 || dst[i] =3D=3D 0xFFFFFFFF)
+			break; /* end of table */
+		err =3D aicwf_send_dbg_mem_write_req(aicwf_hw, dst[i], dst[i + 1]);
+		if (err) {
+			dev_err(aicwf_hw->dev, "patch_tbl %x write fail: %d\n",
+				dst[i], err);
+			break;
+		}
+	}
+
+	aicwf_release_firmware_common(&dst);
+
+	return err;
+}
+
+/* Run the RF calibration once, unless the patch already did it. */
+static int aicwf_calib_exec_8800d80n(struct aicwf_hw *aicwf_hw,
+				     const struct aicwf_fw_8800d80n *fw)
+{
+	const u32 patch_var_flags_addr =3D ROM_FMAC_PATCH_ADDR_8800D80N + 0x08;
+	struct dbg_mem_read_cfm cfm;
+	int ret;
+
+	ret =3D aicwf_send_dbg_mem_read_req(aicwf_hw, patch_var_flags_addr, &cfm)=
;
+	if (ret) {
+		dev_err(aicwf_hw->dev, "%x rd fail: %d\n", patch_var_flags_addr, ret);
+		return ret;
+	}
+	if (cfm.memdata & (PATCH_VAR_FLAG_CALIB_BEGIN | PATCH_VAR_FLAG_CALIB_DONE=
)) {
+		dev_dbg(aicwf_hw->dev, "calib executed, var_flags=3D%x\n", cfm.memdata);
+		return 0;
+	}
+
+	ret =3D aicwf_plat_bin_fw_upload(aicwf_hw, ROM_FMAC_CALIB_ADDR_8800D80N,
+				       fw->calib);
+	if (ret) {
+		dev_err(aicwf_hw->dev, "load calib bin fail: %d\n", ret);
+		return ret;
+	}
+
+	ret =3D aicwf_send_dbg_start_app_req(aicwf_hw,
+					   ROM_FMAC_CALIB_ADDR_8800D80N + 0x0009,
+					   HOST_START_APP_FNCALL);
+	if (ret)
+		dev_err(aicwf_hw->dev, "calib start app fail: %d\n", ret);
+
+	return ret;
+}
+
+/**
+ * aicwf_fw_download_8800d80n() - Boot the AIC8800D80N firmware
+ * @aicwf_hw: Main driver data
+ *
+ * The AIC8800D80N runs its firmware from ROM: configure the ROM settings,
+ * run the chip init code, upload the ROM patch and its table, run the RF
+ * calibration and start the firmware.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int aicwf_fw_download_8800d80n(struct aicwf_hw *aicwf_hw)
+{
+	const struct aicwf_fw_8800d80n *fw;
+	struct dbg_mem_read_cfm cfm;
+	u8 chip_sub_id;
+	int ret;
+
+	ret =3D aicwf_send_dbg_mem_read_req(aicwf_hw, 0x40500000, &cfm);
+	if (ret)
+		return ret;
+	dev_dbg(aicwf_hw->dev, "chip rev: %d, mcu id: %d\n",
+		(cfm.memdata >> 16) & 0x3F, !((cfm.memdata >> 25) & 0x01));
+
+	ret =3D aicwf_send_dbg_mem_read_req(aicwf_hw, 0x00000020, &cfm);
+	if (ret) {
+		dev_err(aicwf_hw->dev, "[0x00000020] rd fail: %d\n", ret);
+		return ret;
+	}
+	chip_sub_id =3D (u8)cfm.memdata;
+	fw =3D chip_sub_id =3D=3D 1 ? &fw_8800d80n_u02 : &fw_8800d80n_u02c;
+	dev_dbg(aicwf_hw->dev, "chip_sub_id=3D%x\n", chip_sub_id);
+
+	ret =3D aicwf_userconfig_parse_8800d80n(aicwf_hw);
+	if (ret)
+		return ret;
+
+	ret =3D aicwf_patch_config_8800d80n(aicwf_hw);
+	if (ret)
+		return ret;
+
+	ret =3D aicwf_cinit_exec_8800d80n(aicwf_hw, fw);
+	if (ret)
+		return ret;
+
+	ret =3D aicwf_plat_bin_fw_upload_chunk(aicwf_hw, ROM_FMAC_PATCH_ADDR_8800=
D80N,
+					     fw->patch, 512);
+	if (ret) {
+		dev_err(aicwf_hw->dev, "load patch bin fail: %d\n", ret);
+		return ret;
+	}
+
+	ret =3D aicwf_patch_table_load_8800d80n(aicwf_hw, fw->patch_tbl);
+	if (ret)
+		return ret;
+
+	ret =3D aicwf_calib_exec_8800d80n(aicwf_hw, fw);
+	if (ret)
+		return ret;
+
+	ret =3D aicwf_send_dbg_mem_read_req(aicwf_hw, RAM_FMAC_FW_ADDR, &cfm);
+	if (ret)
+		return ret;
+
+	ret =3D aicwf_send_dbg_start_app_req(aicwf_hw, RAM_FMAC_FW_ADDR,
+					   HOST_START_APP_DUMMY);
+	if (ret)
+		dev_err(aicwf_hw->dev, "8800d80n wifi start fail\n");
+
+	return ret;
+}
+
+/* Write the user xtal cap into the running firmware. */
+static int aicwf_set_xtal_cap_8800d80n(struct aicwf_hw *aicwf_hw)
+{
+	struct xtal_cap_conf xtal_cap =3D { 0 };
+	u32 wifisetting_cfg_addr;
+	int ret;
+
+	ret =3D aicwf_wifisetting_addr_8800d80n(aicwf_hw, &wifisetting_cfg_addr);
+	if (ret)
+		return ret;
+
+	get_userconfig_xtal_cap(aicwf_hw, &xtal_cap);
+	if (!xtal_cap.enable)
+		return 0;
+
+	dev_dbg(aicwf_hw->dev, "user xtal cap: %d, cap_fine: %d\n",
+		xtal_cap.xtal_cap, xtal_cap.xtal_cap_fine);
+	ret =3D aicwf_send_dbg_mem_write_req(aicwf_hw,
+					   wifisetting_cfg_addr + WIFISETTING_XTAL_CAP_OFST,
+					   (xtal_cap.xtal_cap_fine << 8) |
+					   xtal_cap.xtal_cap);
+	if (ret)
+		dev_err(aicwf_hw->dev, "set user xtal cap fail\n");
+
+	return ret;
+}
+
+int aicwf_set_rf_config_8800d80n(struct aicwf_hw *aicwf_hw,
+				 struct mm_set_rf_calib_cfm *cfm)
+{
+	/* The RF calibration was already run during the firmware boot. */
+	if (aicwf_send_txpwr_lvl_v3_req(aicwf_hw, 0))
+		return -1;
+
+	if (aicwf_send_txpwr_ofst2x_req(aicwf_hw))
+		return -1;
+
+	if (aicwf_set_xtal_cap_8800d80n(aicwf_hw))
+		return -1;
+
+	if (aicwf_send_txpwr_lvl_adj_req(aicwf_hw))
+		return -1;
+
+	return 0;
+}
+
+MODULE_FIRMWARE(AIC8800_FW_DIR FW_USERCONFIG_NAME_8800D80N);
+MODULE_FIRMWARE(AIC8800_FW_DIR FW_CINIT_NAME_8800D80N_U02);
+MODULE_FIRMWARE(AIC8800_FW_DIR FW_CALIB_NAME_8800D80N_U02);
+MODULE_FIRMWARE(AIC8800_FW_DIR FW_PATCH_NAME_8800D80N_U02);
+MODULE_FIRMWARE(AIC8800_FW_DIR FW_PATCH_TBL_NAME_8800D80N_U02);
+MODULE_FIRMWARE(AIC8800_FW_DIR FW_CINIT_NAME_8800D80N_U02C);
+MODULE_FIRMWARE(AIC8800_FW_DIR FW_CALIB_NAME_8800D80N_U02C);
+MODULE_FIRMWARE(AIC8800_FW_DIR FW_PATCH_NAME_8800D80N_U02C);
+MODULE_FIRMWARE(AIC8800_FW_DIR FW_PATCH_TBL_NAME_8800D80N_U02C);
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800d80n.h =
b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800d80n.h
new file mode 100644
index 000000000000..315c858d102b
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_compat_8800d80n.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_COMPAT_8800D80N_H_
+#define _AICWF_COMPAT_8800D80N_H_
+#include "aicwf_main.h"
+#include "aicwf_msg_tx.h"
+#include <linux/types.h>
+
+int aicwf_set_rf_config_8800d80n(struct aicwf_hw *aicwf_hw,
+				 struct mm_set_rf_calib_cfm *cfm);
+int aicwf_plat_userconfig_load_8800d80n(struct aicwf_hw *aicwf_hw);
+int aicwf_fw_download_8800d80n(struct aicwf_hw *aicwf_hw);
+
+#endif
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_config.h b/drivers=
/net/wireless/aic/aic8800_fdrv/aicwf_config.h
new file mode 100644
index 000000000000..53c258b2974b
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_config.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * Driver configuration and firmware resource limits.
+ */
+
+#ifndef _AICWF_CONFIG_H_
+#define _AICWF_CONFIG_H_
+
+#ifdef CONFIG_AICWF_MUMIMO_TX
+#define NX_USER_MAX 2
+#else
+#define NX_USER_MAX 1
+#endif
+
+#define NX_VIRT_DEV_MAX 4
+
+#define NX_REMOTE_STA_MAX_FOR_OLD_IC 10
+#define NX_REMOTE_STA_MAX 32
+
+#define NX_MU_GROUP_MAX 62
+#define NX_TXDESC_CNT 64
+#define NX_TX_MAX_RATES 4
+#define NX_CHAN_CTXT_CNT 3
+
+#ifdef CONFIG_AICWF_BCMC
+#define NX_TXQ_CNT 5
+#else
+#define NX_TXQ_CNT 4
+#endif
+
+#endif /* _AICWF_CONFIG_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_defs.h b/drivers/n=
et/wireless/aic/aic8800_fdrv/aicwf_defs.h
new file mode 100644
index 000000000000..52d0f4a888e1
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_defs.h
@@ -0,0 +1,657 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *************************************************************************=
*****
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief Main driver structure declarations for fullmac driver
+ *
+ *************************************************************************=
*****
+ */
+
+#ifndef _AICWF_DEFS_H_
+#define _AICWF_DEFS_H_
+
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/skbuff.h>
+#include <linux/slab.h>
+#include <net/cfg80211.h>
+
+#include "aicwf_cmds.h"
+#include "aicwf_mod_params.h"
+#include "aicwf_mu_group.h"
+#include "aicwf_platform.h"
+#include "aicwf_radar.h"
+#include "aicwf_rx.h"
+#include "aicwf_tx.h"
+#include "aicwf_utils.h"
+#include "aicwf_config.h"
+
+#include "aicwf_sdio.h"
+#include "sdio_host.h"
+
+#include "lmac_mac.h"
+#include "aicwf_chip_ops.h"
+
+#define WPI_HDR_LEN    18
+#define WPI_PN_LEN     16
+#define WPI_PN_OFST    2
+#define WPI_MIC_LEN    16
+#define WPI_KEY_LEN    32
+#define WPI_SUBKEY_LEN 16 // WPI key is actually two 16bytes key
+
+#define LEGACY_PS_ID 0
+#define UAPSD_ID     1
+
+#define PS_SP_INTERRUPTED 255
+#define MAC_ADDR_LEN      6
+
+struct wf_bss_info {
+	u32 length;
+	s8 rssi;
+	u16 chan;
+	enum nl80211_band band; /* Band */
+	u8 width;             /* Channel width  0/1/2--20/40/80 */
+	u16 center_freq;        /* Center frequency */
+	u32 center_freq1;       /* Center frequency 1 */
+	u32 center_freq2;       /* Center frequency 2 */
+	bool ht;
+	bool vht;
+	u8 bssid[ETH_ALEN];
+	u8 ssid_len;
+	unsigned char ssid[33];
+};
+
+/**
+ * struct aicwf_bcn - Information of the beacon in used (AP mode)
+ *
+ * @head: head portion of beacon (before TIM IE)
+ * @tail: tail portion of beacon (after TIM IE)
+ * @ies: extra IEs (not used ?)
+ * @head_len: length of head data
+ * @tail_len: length of tail data
+ * @ies_len: length of extra IEs data
+ * @tim_len: length of TIM IE
+ * @len: Total beacon len (head + tim + tail + extra)
+ * @dtim: dtim period
+ */
+struct aicwf_bcn {
+	u8 *head;
+	u8 *tail;
+	u8 *ies;
+	size_t head_len;
+	size_t tail_len;
+	size_t ies_len;
+	size_t tim_len;
+	size_t len;
+	u8 dtim;
+};
+
+/**
+ * struct aicwf_key - Key information
+ *
+ * @hw_idx: Idx of the key from hardware point of view
+ */
+struct aicwf_key {
+	u8 hw_idx;
+};
+
+/*
+ * Structure containing information about a Mesh Path
+ */
+struct aicwf_mesh_path {
+	struct list_head list;        /* For aicwf_vif.mesh_paths */
+	u8 path_idx;                  /* Path Index */
+	struct mac_addr tgt_mac_addr; /* Target MAC Address */
+	struct aicwf_sta *p_nhop_sta;  /* Pointer to the Next Hop STA */
+};
+
+struct aicwf_mesh_proxy {
+	struct list_head list;        /* For aicwf_vif.mesh_proxy */
+	struct mac_addr ext_sta_addr; /* Address of the External STA */
+	struct mac_addr proxy_addr;   /* Proxy MAC Address */
+	bool local; /* Indicate if interface is a proxy for the device */
+};
+
+/**
+ * struct aicwf_csa - Information for CSA (Channel Switch Announcement)
+ *
+ * @vif: Pointer to the vif doing the CSA
+ * @bcn: Beacon to use after CSA
+ * @chandef: defines the channel to use after the switch
+ * @count: Current csa counter
+ * @status: Status of the CSA at fw level
+ * @ch_idx: Index of the new channel context
+ * @work: work scheduled at the end of CSA
+ */
+struct aicwf_csa {
+	struct aicwf_vif *vif;
+	struct aicwf_bcn bcn;
+	struct cfg80211_chan_def chandef;
+	int count;
+	int status;
+	int ch_idx;
+	struct work_struct work;
+};
+
+struct apm_probe_sta {
+	u8 sta_mac_addr[6];
+	u8 vif_idx;
+	u64 probe_id;
+	struct work_struct apmprobesta_work;
+	struct workqueue_struct *apmprobesta_wq;
+};
+
+/// Possible States of the TDLS link.
+enum tdls_status_tag {
+	/// TDLS link is not active (no TDLS peer connected)
+	TDLS_LINK_IDLE,
+	/// TDLS Setup Request transmitted
+	TDLS_SETUP_REQ_TX,
+	/// TDLS Setup Response transmitted
+	TDLS_SETUP_RSP_TX,
+	/// TDLS link is active (TDLS peer connected)
+	TDLS_LINK_ACTIVE,
+	/// TDLS Max Number of states.
+	TDLS_STATE_MAX
+};
+
+/*
+ * Structure used to save information relative to the TDLS peer.
+ * This is also linked within the aicwf_hw vifs list.
+ *
+ */
+struct aicwf_tdls {
+	bool active;       /* Indicate if TDLS link is active */
+	bool initiator;    /* Indicate if TDLS peer is the TDLS initiator */
+	bool chsw_en;      /* Indicate if channel switch is enabled */
+	u8 last_tid;       /* TID of the latest MPDU transmitted over the
+			    * TDLS direct link to the TDLS STA
+			    */
+	u16 last_sn;       /* Sequence number of the latest MPDU transmitted
+			    * over the TDLS direct link to the TDLS STA
+			    */
+	bool ps_on;        /* Indicate if the power save is enabled on the
+			    * TDLS STA
+			    */
+	bool chsw_allowed; /* Indicate if TDLS channel switch is allowed */
+};
+
+/**
+ * enum aicwf_ap_flags - AP flags
+ *
+ * @AICWF_AP_ISOLATE: Isolate clients (i.e. don't bridge packets transmitt=
ed by
+ *                   one client for another one)
+ */
+enum aicwf_ap_flags {
+	AICWF_AP_ISOLATE =3D BIT(0),
+};
+
+/*
+ * Structure used to save information relative to the managed interfaces.
+ * This is also linked within the aicwf_hw vifs list.
+ *
+ */
+struct aicwf_vif {
+	struct list_head list;
+	struct aicwf_hw *aicwf_hw;
+	struct wireless_dev wdev;
+	struct net_device *ndev;
+	struct net_device_stats net_stats;
+	struct aicwf_key key[6];
+	unsigned long drv_flags;
+	atomic_t drv_conn_state;
+	u8 drv_vif_index;  /* Identifier of the VIF in driver */
+	u8 vif_index;      /* Identifier of the station in FW */
+	u8 ch_index;       /* Channel context identifier */
+	bool up;           /* Indicate if associated netdev is up
+			    * (i.e. Interface is created at fw level)
+			    */
+	bool use_4addr;    /* Should we use 4addresses mode */
+	bool is_resending; /* Indicate if a frame is being resent on this interfa=
ce */
+	bool user_mpm;  /* In case of Mesh Point VIF, indicate if MPM is handled =
by
+			 * userspace
+			 */
+	bool roc_tdls;  /* Indicate if the ROC has been called by a
+			 * TDLS station
+			 */
+	u8 tdls_status; /* Status of the TDLS link */
+	bool tdls_chsw_prohibited; /* Indicate if TDLS Channel Switch is prohibit=
ed */
+	bool wep_enabled;          /* 1 if WEP is enabled */
+	bool wep_auth_err; /* 1 if auth status code is not supported auth alg whe=
n
+			    * WEP enabled
+			    */
+	enum nl80211_auth_type
+		last_auth_type; /* Authentication type (algorithm) sent in the last
+				 * connection when WEP enabled
+				 */
+	union {
+		struct {
+			/* Pointer to the peer STA entry allocated for the AP */
+			struct aicwf_sta *ap;
+			struct aicwf_sta *tdls_sta; /* Pointer to the TDLS station */
+			bool external_auth; /* Indicate if external authentication is in
+					     * progress
+					     */
+			u32 group_cipher_type;
+			u32 paired_cipher_type;
+			// connected network info start
+			char ssid[32];
+			int ssid_len;
+			u8 bssid[ETH_ALEN];
+			u32 conn_owner_nlportid;
+			bool is_roam;
+			unsigned long link_time;
+			u16 b_interval;
+			u8 dtim_peroid;
+			u16 capability;
+			enum nl80211_auth_type auth_type;
+			// connected network info end
+		} sta;
+		struct {
+			u16 flags;                 /* see aicwf_ap_flags */
+			struct list_head sta_list; /* List of STA connected to the AP */
+			struct aicwf_bcn bcn;       /* beacon */
+			u8 bcmc_index;             /* Index of the BCMC sta to use */
+			struct aicwf_csa *csa;
+
+			struct list_head
+				mpath_list; /* List of Mesh Paths used on this interface */
+			struct list_head proxy_list; /* List of Proxies Information used on
+						      * this interface
+						      */
+			bool create_path;            /* Indicate if we are waiting for a
+						      * MESH_CREATE_PATH_CFM message
+						      */
+			int generation; /* Increased each time the list of Mesh Paths is
+					 * updated
+					 */
+			enum nl80211_mesh_power_mode
+				mesh_pm; /* mesh power save mode currently set in firmware */
+			enum nl80211_mesh_power_mode
+				next_mesh_pm; /* mesh power save mode for next peer */
+		} ap;
+		struct {
+			struct aicwf_vif *master; /* pointer on master interface */
+			struct aicwf_sta *sta_4a;
+		} ap_vlan;
+	};
+
+	u8 key_has_add;
+	/* Set while disconnecting so that key deletions reach the firmware */
+	bool key_flag;
+	u8 is_p2p_vif;
+	struct apm_probe_sta sta_probe;
+
+};
+
+#define AICWF_VIF_TYPE(aicwf_vif) ((aicwf_vif)->wdev.iftype)
+
+/*
+ * Structure used to store information relative to PS mode.
+ *
+ * @active: True when the sta is in PS mode.
+ *          If false, other values should be ignored
+ * @pkt_ready: Number of packets buffered for the sta in drv's txq
+ *             (1 counter for Legacy PS and 1 for U-APSD)
+ * @sp_cnt: Number of packets that remain to be pushed in the service peri=
od.
+ *          0 means that no service period is in progress
+ *          (1 counter for Legacy PS and 1 for U-APSD)
+ */
+struct aicwf_sta_ps {
+	bool active;
+	u16 pkt_ready[2];
+	u16 sp_cnt[2];
+};
+
+/**
+ * struct aicwf_rx_rate_stats - Store statistics for RX rates
+ *
+ * @table: Number of received frames for each rate index
+ * @size: Number of entries in @table
+ * @cpt: Total number of received frames
+ * @rate_cnt: Number of rate indexes with at least one received frame
+ */
+struct aicwf_rx_rate_stats {
+	int *table;
+	int size;
+	int cpt;
+	int rate_cnt;
+};
+
+/**
+ * struct aicwf_sta_stats - Structure Used to store statistics specific to=
 a STA
+ *
+ * @last_rx: Hardware vector of the last received frame
+ * @rx_rate: Statistics of the received rates
+ */
+struct aicwf_sta_stats {
+	struct hw_vect last_rx;
+	struct aicwf_rx_rate_stats rx_rate;
+};
+
+/*
+ * Structure used to save information relative to the managed stations.
+ */
+struct aicwf_sta {
+	struct list_head list;
+	u16 aid;                /* association ID */
+	u8 sta_idx;             /* Identifier of the station */
+	u8 vif_idx;             /* Identifier of the VIF (fw id) the station
+				 * belongs to
+				 */
+	u8 vlan_idx;            /* Identifier of the VLAN VIF (fw id) the station
+				 * belongs to (=3D vif_idx if no vlan in used)
+				 */
+	enum nl80211_band band; /* Band */
+	enum nl80211_chan_width width; /* Channel width */
+	u16 center_freq;               /* Center frequency */
+	u32 center_freq1;              /* Center frequency 1 */
+	u32 center_freq2;              /* Center frequency 2 */
+	u8 ch_idx;                     /* Identifier of the channel
+					* context the station belongs to
+					*/
+	bool qos;                      /* Flag indicating if the station
+					* supports QoS
+					*/
+	u8 acm;                        /* Bitfield indicating which queues
+					* have AC mandatory
+					*/
+	u16 uapsd_tids;        /* Bitfield indicating which tids are subject to
+				* UAPSD
+				*/
+	u8 mac_addr[ETH_ALEN]; /* MAC address of the station */
+	struct aicwf_key key;
+	bool valid;            /* Flag indicating if the entry is valid */
+	struct aicwf_sta_ps ps; /* Information when STA is in PS (AP only) */
+#ifdef CONFIG_AICWF_BFMER
+	/* Beamforming report to be used for VHT TX Beamforming */
+	struct aicwf_bfmer_report *bfm_report;
+#ifdef CONFIG_AICWF_MUMIMO_TX
+	struct aicwf_sta_group_info
+		group_info; /* MU grouping information for the STA */
+#endif              /* CONFIG_AICWF_MUMIMO_TX */
+#endif              /* CONFIG_AICWF_BFMER */
+
+	bool ht;               /* Flag indicating if the station
+				* supports HT
+				*/
+	bool vht;              /* Flag indicating if the station
+				* supports VHT
+				*/
+	u32 ac_param[AC_MAX];  /* EDCA parameters */
+	struct aicwf_tdls tdls; /* TDLS station information */
+	struct aicwf_sta_stats stats;
+	enum nl80211_mesh_power_mode
+		mesh_pm; /*  link-specific mesh power save mode */
+};
+
+#ifdef CONFIG_AICWF_SPLIT_TX_BUF
+struct aicwf_amsdu_stats {
+	int done;
+	int failed;
+};
+#endif
+
+struct aicwf_stats {
+	int cfm_balance[NX_TXQ_CNT];
+	unsigned long last_rx, last_tx; /* jiffies */
+	int ampdus_tx[IEEE80211_MAX_AMPDU_BUF_HE];
+	int ampdus_rx[IEEE80211_MAX_AMPDU_BUF_HE];
+	int ampdus_rx_map[4];
+	int ampdus_rx_miss;
+#ifdef CONFIG_AICWF_SPLIT_TX_BUF
+	struct aicwf_amsdu_stats amsdus[NX_TX_PAYLOAD_MAX];
+#endif
+	int amsdus_rx[64];
+};
+
+struct aicwf_sec_phy_chan {
+	u16 prim20_freq;
+	u16 center_freq1;
+	u16 center_freq2;
+	enum nl80211_band band;
+	u8 type;
+};
+
+/* Structure that will contains all RoC information received from cfg80211=
 */
+struct aicwf_roc_elem {
+	struct wireless_dev *wdev;
+	struct ieee80211_channel *chan;
+	unsigned int duration;
+	u64 cookie;
+	/* Used to avoid call of CFG80211 callback upon expiration of RoC */
+	bool mgmt_roc;
+	/* Indicate if we have switch on the RoC channel */
+	bool on_chan;
+};
+
+/* Structure containing channel survey information received from MAC */
+struct aicwf_survey_info {
+	// Filled
+	u32 filled;
+	// Amount of time in ms the radio spent on the channel
+	u32 chan_time_ms;
+	// Amount of time the primary channel was sensed busy
+	u32 chan_time_busy_ms;
+	// Noise in dbm
+	s8 noise_dbm;
+};
+
+#define AICWF_CH_NOT_SET  0xFF
+#define AICWF_INVALID_VIF 0xFF
+#define AICWF_INVALID_STA 0xFF
+
+/* Structure containing channel context information */
+struct aicwf_chanctx {
+	struct cfg80211_chan_def chan_def; /* channel description */
+	u8 count;                          /* number of vif using this ctxt */
+};
+
+/**
+ * struct aicwf_phy_info - PHY information
+ *
+ * @cnt: Number of PHY interfaces
+ * @cfg: Configuration sent to the firmware
+ * @sec_chan: Channel configuration of the second PHY interface, when pres=
ent
+ * @limit_bw: Whether to limit the requested channel bandwidth for legacy =
PHYs
+ */
+struct aicwf_phy_info {
+	u8 cnt;
+	struct phy_cfg_tag cfg;
+	struct aicwf_sec_phy_chan sec_chan;
+	bool limit_bw;
+};
+
+struct defrag_ctrl_info {
+	struct list_head list;
+	u8 sta_idx;
+	u8 tid;
+	u16 sn;
+	u8 next_fn;
+	u16 frm_len;
+	struct sk_buff *skb;
+	struct timer_list defrag_timer;
+	struct aicwf_hw *aicwf_hw;
+};
+
+struct amsdu_subframe_hdr {
+	u8 da[6];
+	u8 sa[6];
+	u16 sublen;
+};
+
+enum aicwf_drv_connect_status {
+	AICWF_DRV_STATUS_DISCONNECTED =3D 0,
+	AICWF_DRV_STATUS_DISCONNECTING,
+	AICWF_DRV_STATUS_CONNECTING,
+	AICWF_DRV_STATUS_CONNECTED,
+	AICWF_DRV_STATUS_ROAMING,
+};
+
+struct aicwf_hw {
+	struct aicwf_mod_params *mod_params;
+	struct device *dev;
+	struct aic_sdio_dev *sdiodev;
+	struct wiphy *wiphy;
+	struct list_head vifs;
+	struct aicwf_vif *
+		vif_table[NX_VIRT_DEV_MAX + NX_REMOTE_STA_MAX]; /* indexed with fw id */
+	struct aicwf_sta sta_table[NX_REMOTE_STA_MAX + NX_VIRT_DEV_MAX];
+	struct aicwf_survey_info survey[SCAN_CHANNEL_MAX];
+	/* Serializes scan ownership, completion and the scan activity reference.=
 */
+	spinlock_t scan_lock;
+	struct cfg80211_scan_request *scan_request;
+	/* The normal scan path owns one SDIO activity until its terminal event. =
*/
+	atomic_t scan_activity_held;
+#ifdef CONFIG_AIC8800_SCHED_SCAN
+	struct cfg80211_sched_scan_request *sched_scan_req;
+#endif
+	struct aicwf_chanctx chanctx_table[NX_CHAN_CTXT_CNT];
+	u8 cur_chanctx;
+
+	u8 monitor_vif; /* FW id of the monitor interface, AICWF_INVALID_VIF if n=
o
+			 * monitor vif at fw level
+			 */
+
+	/* RoC Management */
+	/* Information provided by cfg80211 in its remain on channel request */
+	struct aicwf_roc_elem *roc_elem;
+
+	struct aicwf_cmd_mgr *cmd_mgr;
+
+	struct aicwf_plat *plat;
+
+	spinlock_t tx_lock; //
+	spinlock_t cb_lock; //
+	struct mutex mutex; /* per-device perimeter lock */
+
+	struct tasklet_struct task;
+	struct mm_version_cfm
+		version_cfm; /* Lower layers versions - obtained via MM_VERSION_REQ */
+
+	u32 tcp_pacing_shift;
+
+	struct sdio_host_env_tag sdio_env;
+
+	struct kmem_cache *sw_txhdr_cache;
+
+	struct aicwf_stats stats;
+
+#ifdef CONFIG_PREALLOC_TXQ
+	struct aicwf_txq *txq;
+#else
+	struct aicwf_txq txq[NX_NB_TXQ];
+#endif
+
+	struct aicwf_hwq hwq[NX_TXQ_CNT];
+
+	u64 avail_idx_map;
+	u8 vif_started;
+	bool adding_sta;
+	struct aicwf_phy_info phy;
+
+	struct aicwf_radar radar;
+
+	/* extended capabilities supported */
+	u8 ext_capa[8];
+
+#ifdef CONFIG_AICWF_MUMIMO_TX
+	struct aicwf_mu_info mu;
+#endif
+	u8 is_p2p_alive;
+	u8 is_p2p_connected;
+	struct timer_list p2p_alive_timer;
+	struct aicwf_vif *p2p_dev_vif;
+	atomic_t p2p_alive_timer_count;
+	bool band_5g_support;
+	/* cfg80211 updates these per-device channel and capability copies. */
+	struct ieee80211_supported_band bands[2];
+	struct ieee80211_channel channels_2ghz[MAC_DOMAINCHANNEL_24G_MAX];
+	struct ieee80211_channel channels_5ghz[MAC_DOMAINCHANNEL_5G_MAX];
+	struct ieee80211_sband_iftype_data he_capa[1];
+	/* Serialize channel configuration requests and their confirmations. */
+	struct mutex reg_lock;
+	struct completion chan_config_complete;
+	/* A failed update requires reprobe before transmitting again. */
+	bool regdom_failed;
+	int tx_power_limit;
+	u8 vendor_info;
+	bool fwlog_en;
+	int testmode;
+	u8 scanning;
+	const struct aic_chip_ops *chip_ops;
+	u8 chip_id;
+	u8 chip_sub_id;
+	/* Configuration parsed from the userconfig and nvram files */
+	struct userconfig_info_t userconfig;
+	struct nvram_info_t nvram;
+
+	struct list_head defrag_list;
+	struct list_head defrag_expired_list;
+	/* Protects both lists, their objects and defrag_stopping. */
+	spinlock_t defrag_lock;
+	bool defrag_stopping;
+
+	struct work_struct apm_staloss_work;
+	struct workqueue_struct *apm_staloss_wq;
+	u8 apm_vif_idx;
+	u8 sta_mac_addr[6];
+
+	struct wakeup_source *ws_rx;
+	struct wakeup_source *ws_irqrx;
+	struct wakeup_source *ws_tx;
+	struct wakeup_source *ws_pwrctrl;
+	struct wakeup_source *ws_scan;
+
+#ifdef CONFIG_AIC8800_SCHED_SCAN
+	bool is_sched_scan;
+#endif
+
+#ifdef CONFIG_AIC8800_TEMP_CONTROL
+	unsigned long started_jiffies;
+	s8 temp;
+#endif
+	char fw_version[32];
+
+};
+
+static inline const u8 *aicwf_sta_addr(struct aicwf_sta *aicwf_sta)
+{
+	return aicwf_sta->mac_addr;
+}
+
+static inline bool is_multicast_sta(struct aicwf_hw *aicwf_hw, int sta_idx=
)
+{
+	if (aicwf_hw->chip_ops->is_old_ic)
+		return (sta_idx >=3D NX_REMOTE_STA_MAX_FOR_OLD_IC);
+	else
+		return (sta_idx >=3D NX_REMOTE_STA_MAX);
+}
+
+static inline uint8_t master_vif_idx(struct aicwf_vif *vif)
+{
+#if IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	return vif->vif_index;
+#else
+	if (unlikely(vif->wdev.iftype =3D=3D NL80211_IFTYPE_AP_VLAN))
+		return vif->ap_vlan.master->vif_index;
+	else
+		return vif->vif_index;
+#endif
+}
+
+u8 *aicwf_build_bcn(struct aicwf_bcn *bcn, struct cfg80211_beacon_data *ne=
w);
+void aicwf_chanctx_link(struct aicwf_vif *vif, u8 idx,
+			struct cfg80211_chan_def *chandef);
+void aicwf_chanctx_unlink(struct aicwf_vif *vif);
+int aicwf_chanctx_valid(struct aicwf_hw *aicwf_hw, u8 idx);
+void aicwf_set_conn_state(atomic_t *drv_conn_state, int state);
+struct aicwf_sta *aicwf_get_sta(struct aicwf_hw *aicwf_hw, const u8 *mac_a=
ddr);
+void aicwf_external_auth_enable(struct aicwf_vif *vif);
+void aicwf_external_auth_disable(struct aicwf_vif *vif);
+bool aicwf_scan_complete(struct aicwf_hw *aicwf_hw, struct wireless_dev *w=
dev,
+			 bool aborted);
+
+#endif /* _AICWF_DEFS_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_events.h b/drivers=
/net/wireless/aic/aic8800_fdrv/aicwf_events.h
new file mode 100644
index 000000000000..a0b7787b16a3
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_events.h
@@ -0,0 +1,938 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *************************************************************************=
*****
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief Trace events definition
+ *
+ *************************************************************************=
*****
+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM aicwf
+
+#if !defined(_AICWF_EVENTS_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _AICWF_EVENTS_H
+
+#include <linux/tracepoint.h>
+#include "aicwf_tx.h"
+
+#include "aicwf_config.h"
+
+/*************************************************************************=
****
+ * TRACE function for MGMT TX (FULLMAC)
+ *************************************************************************=
***/
+#ifdef CONFIG_AICWF_FULLMAC
+#include "linux/ieee80211.h"
+#if defined(CONFIG_TRACEPOINTS) && defined(AIC8800_CREATE_TRACE_POINTS) &&=
 \
+	!defined(TRACE_HEADER_MULTI_READ)
+#include <linux/trace_seq.h>
+
+/* P2P Public Action Frames Definitions (see WiFi P2P Technical Specificat=
ion,
+ * section 4.2.8)
+ */
+/* IEEE 802.11 Public Action Usage Category - Define P2P public action fra=
mes */
+#define MGMT_ACTION_PUBLIC_CAT         (0x04)
+/* Offset of OUI Subtype field in P2P Action Frame format */
+#define MGMT_ACTION_OUI_SUBTYPE_OFFSET (6)
+/* P2P Public Action Frame Types */
+enum p2p_action_type {
+	P2P_ACTION_GO_NEG_REQ =3D 0, /* GO Negociation Request */
+	P2P_ACTION_GO_NEG_RSP,     /* GO Negociation Response */
+	P2P_ACTION_GO_NEG_CFM,     /* GO Negociation Confirmation */
+	P2P_ACTION_INVIT_REQ,      /* P2P Invitation Request */
+	P2P_ACTION_INVIT_RSP,      /* P2P Invitation Response */
+	P2P_ACTION_DEV_DISC_REQ,   /* Device Discoverability Request */
+	P2P_ACTION_DEV_DISC_RSP,   /* Device Discoverability Response */
+	P2P_ACTION_PROV_DISC_REQ,  /* Provision Discovery Request */
+	P2P_ACTION_PROV_DISC_RSP,  /* Provision Discovery Response */
+};
+
+static inline const char *ftrace_print_mgmt_info(struct trace_seq *p,
+						 u16 frame_control, u8 cat, u8 type,
+						 u8 p2p)
+{
+	const char *ret =3D trace_seq_buffer_ptr(p);
+
+	switch (frame_control & IEEE80211_FCTL_STYPE) {
+	case (IEEE80211_STYPE_ASSOC_REQ):
+		trace_seq_printf(p, "Association Request");
+		break;
+	case (IEEE80211_STYPE_ASSOC_RESP):
+		trace_seq_printf(p, "Association Response");
+		break;
+	case (IEEE80211_STYPE_REASSOC_REQ):
+		trace_seq_printf(p, "Reassociation Request");
+		break;
+	case (IEEE80211_STYPE_REASSOC_RESP):
+		trace_seq_printf(p, "Reassociation Response");
+		break;
+	case (IEEE80211_STYPE_PROBE_REQ):
+		trace_seq_printf(p, "Probe Request");
+		break;
+	case (IEEE80211_STYPE_PROBE_RESP):
+		trace_seq_printf(p, "Probe Response");
+		break;
+	case (IEEE80211_STYPE_BEACON):
+		trace_seq_printf(p, "Beacon");
+		break;
+	case (IEEE80211_STYPE_ATIM):
+		trace_seq_printf(p, "ATIM");
+		break;
+	case (IEEE80211_STYPE_DISASSOC):
+		trace_seq_printf(p, "Disassociation");
+		break;
+	case (IEEE80211_STYPE_AUTH):
+		trace_seq_printf(p, "Authentication");
+		break;
+	case (IEEE80211_STYPE_DEAUTH):
+		trace_seq_printf(p, "Deauthentication");
+		break;
+	case (IEEE80211_STYPE_ACTION):
+		trace_seq_printf(p, "Action");
+		if (cat =3D=3D MGMT_ACTION_PUBLIC_CAT && type =3D=3D 0x9) {
+			switch (p2p) {
+			case (P2P_ACTION_GO_NEG_REQ):
+				trace_seq_printf(p, ": GO Negociation Request");
+				break;
+			case (P2P_ACTION_GO_NEG_RSP):
+				trace_seq_printf(p, ": GO Negociation Response");
+				break;
+			case (P2P_ACTION_GO_NEG_CFM):
+				trace_seq_printf(p, ": GO Negociation Confirmation");
+				break;
+			case (P2P_ACTION_INVIT_REQ):
+				trace_seq_printf(p, ": P2P Invitation Request");
+				break;
+			case (P2P_ACTION_INVIT_RSP):
+				trace_seq_printf(p, ": P2P Invitation Response");
+				break;
+			case (P2P_ACTION_DEV_DISC_REQ):
+				trace_seq_printf(p, ": Device Discoverability Request");
+				break;
+			case (P2P_ACTION_DEV_DISC_RSP):
+				trace_seq_printf(p, ": Device Discoverability Response");
+				break;
+			case (P2P_ACTION_PROV_DISC_REQ):
+				trace_seq_printf(p, ": Provision Discovery Request");
+				break;
+			case (P2P_ACTION_PROV_DISC_RSP):
+				trace_seq_printf(p, ": Provision Discovery Response");
+				break;
+			default:
+				trace_seq_printf(p, "Unknown p2p %d", p2p);
+				break;
+			}
+		} else {
+			switch (cat) {
+			case 0:
+				trace_seq_printf(p, ":Spectrum %d", type);
+				break;
+			case 1:
+				trace_seq_printf(p, ":QOS %d", type);
+				break;
+			case 2:
+				trace_seq_printf(p, ":DLS %d", type);
+				break;
+			case 3:
+				trace_seq_printf(p, ":BA %d", type);
+				break;
+			case 4:
+				trace_seq_printf(p, ":Public %d", type);
+				break;
+			case 5:
+				trace_seq_printf(p, ":Radio Measure %d", type);
+				break;
+			case 6:
+				trace_seq_printf(p, ":Fast BSS %d", type);
+				break;
+			case 7:
+				trace_seq_printf(p, ":HT Action %d", type);
+				break;
+			case 8:
+				trace_seq_printf(p, ":SA Query %d", type);
+				break;
+			case 9:
+				trace_seq_printf(p, ":Protected Public %d", type);
+				break;
+			case 10:
+				trace_seq_printf(p, ":WNM %d", type);
+				break;
+			case 11:
+				trace_seq_printf(p, ":Unprotected WNM %d", type);
+				break;
+			case 12:
+				trace_seq_printf(p, ":TDLS %d", type);
+				break;
+			case 13:
+				trace_seq_printf(p, ":Mesh %d", type);
+				break;
+			case 14:
+				trace_seq_printf(p, ":MultiHop %d", type);
+				break;
+			case 15:
+				trace_seq_printf(p, ":Self Protected %d", type);
+				break;
+			case 126:
+				trace_seq_printf(p, ":Vendor protected");
+				break;
+			case 127:
+				trace_seq_printf(p, ":Vendor");
+				break;
+			default:
+				trace_seq_printf(p, ":Unknown category %d", cat);
+				break;
+			}
+		}
+		break;
+	default:
+		trace_seq_printf(p, "Unknown subtype %d",
+				 frame_control & IEEE80211_FCTL_STYPE);
+		break;
+	}
+
+	trace_seq_putc(p, 0);
+
+	return ret;
+}
+#endif /* defined(CONFIG_TRACEPOINTS) && defined(AIC8800_CREATE_TRACE_POIN=
TS) */
+
+#undef __print_mgmt_info
+#define __print_mgmt_info(frame_control, cat, type, p2p)                  =
     \
+	ftrace_print_mgmt_info(p, frame_control, cat, type, p2p)
+
+TRACE_EVENT(roc, TP_PROTO(u8 vif_idx, u16 freq, unsigned int duration),
+	    TP_ARGS(vif_idx, freq, duration),
+	    TP_STRUCT__entry(__field(u8, vif_idx) __field(u16, freq)
+			     __field(unsigned int, duration)),
+	    TP_fast_assign(__entry->vif_idx =3D vif_idx; __entry->freq =3D freq;
+			   __entry->duration =3D duration;),
+	    TP_printk("f=3D%d vif=3D%d dur=3D%d", __entry->freq, __entry->vif_idx=
,
+		      __entry->duration));
+
+TRACE_EVENT(cancel_roc, TP_PROTO(u8 vif_idx), TP_ARGS(vif_idx),
+	    TP_STRUCT__entry(__field(u8, vif_idx)),
+	    TP_fast_assign(__entry->vif_idx =3D vif_idx;),
+	    TP_printk("vif=3D%d", __entry->vif_idx));
+
+TRACE_EVENT(roc_exp, TP_PROTO(u8 vif_idx), TP_ARGS(vif_idx),
+	    TP_STRUCT__entry(__field(u8, vif_idx)),
+	    TP_fast_assign(__entry->vif_idx =3D vif_idx;),
+	    TP_printk("vif=3D%d", __entry->vif_idx));
+
+TRACE_EVENT(switch_roc, TP_PROTO(u8 vif_idx), TP_ARGS(vif_idx),
+	    TP_STRUCT__entry(__field(u8, vif_idx)),
+	    TP_fast_assign(__entry->vif_idx =3D vif_idx;),
+	    TP_printk("vif=3D%d", __entry->vif_idx));
+
+DECLARE_EVENT_CLASS(mgmt_template,
+		    TP_PROTO(u16 freq, u8 vif_idx, u8 sta_idx, struct ieee80211_mgmt *mg=
mt),
+		    TP_ARGS(freq, vif_idx, sta_idx, mgmt),
+		    TP_STRUCT__entry(__field(u16, freq) __field(u8, vif_idx)
+				     __field(u8, sta_idx) __field(u16, frame_control)
+				     __field(u8, action_cat) __field(u8, action_type)
+				     __field(u8, action_p2p)),
+		    TP_fast_assign(__entry->freq =3D freq; __entry->vif_idx =3D vif_idx;
+				   __entry->sta_idx =3D sta_idx;
+				   __entry->frame_control =3D le16_to_cpu(mgmt->frame_control);
+				   __entry->action_cat =3D mgmt->u.action.category;
+				   __entry->action_type =3D mgmt->u.action.action_code;
+				   __entry->action_p2p =3D *((u8 *)&mgmt->u.action.category +
+								MGMT_ACTION_OUI_SUBTYPE_OFFSET);),
+		    TP_printk("f=3D%d vif=3D%d sta=3D%d -> %s", __entry->freq, __entry->=
vif_idx,
+			      __entry->sta_idx,
+			      __print_mgmt_info(__entry->frame_control, __entry->action_cat,
+						__entry->action_type, __entry->action_p2p)));
+
+DEFINE_EVENT(mgmt_template, mgmt_tx,
+	     TP_PROTO(u16 freq, u8 vif_idx, u8 sta_idx,
+		      struct ieee80211_mgmt *mgmt),
+	     TP_ARGS(freq, vif_idx, sta_idx, mgmt));
+
+DEFINE_EVENT(mgmt_template, mgmt_rx,
+	     TP_PROTO(u16 freq, u8 vif_idx, u8 sta_idx,
+		      struct ieee80211_mgmt *mgmt),
+	     TP_ARGS(freq, vif_idx, sta_idx, mgmt));
+
+TRACE_EVENT(mgmt_cfm, TP_PROTO(u8 vif_idx, u8 sta_idx, bool acked),
+	    TP_ARGS(vif_idx, sta_idx, acked),
+	    TP_STRUCT__entry(__field(u8, vif_idx) __field(u8, sta_idx)
+			     __field(bool, acked)),
+	    TP_fast_assign(__entry->vif_idx =3D vif_idx;
+			   __entry->sta_idx =3D sta_idx; __entry->acked =3D acked;),
+	    TP_printk("vif=3D%d sta=3D%d ack=3D%d", __entry->vif_idx,
+		      __entry->sta_idx, __entry->acked));
+#endif /* CONFIG_AICWF_FULLMAC */
+
+/*************************************************************************=
****
+ * TRACE function for TXQ
+ *************************************************************************=
***/
+
+#if defined(CONFIG_TRACEPOINTS) && defined(AIC8800_CREATE_TRACE_POINTS) &&=
 \
+	!defined(TRACE_HEADER_MULTI_READ)
+
+#include <linux/trace_seq.h>
+#include <linux/trace_events.h>
+
+static inline const char *ftrace_print_txq(struct trace_seq *p, int txq_id=
x)
+{
+	const char *ret =3D trace_seq_buffer_ptr(p);
+
+	if (txq_idx =3D=3D TXQ_INACTIVE) {
+		trace_seq_printf(p, "[INACTIVE]");
+	} else if (txq_idx < NX_FIRST_VIF_TXQ_IDX) {
+		trace_seq_printf(p, "[STA %d/%d]", txq_idx / NX_NB_TXQ_PER_STA,
+				 txq_idx % NX_NB_TXQ_PER_STA);
+#ifdef CONFIG_AICWF_FULLMAC
+	} else if (txq_idx < NX_FIRST_UNK_TXQ_IDX) {
+		trace_seq_printf(p, "[BC/MC %d]", txq_idx - NX_FIRST_BCMC_TXQ_IDX);
+	} else if (txq_idx < NX_OFF_CHAN_TXQ_IDX) {
+		trace_seq_printf(p, "[UNKNOWN %d]", txq_idx - NX_FIRST_UNK_TXQ_IDX);
+	} else if (txq_idx =3D=3D NX_OFF_CHAN_TXQ_IDX) {
+		trace_seq_printf(p, "[OFFCHAN]");
+#else
+	} else if (txq_idx < NX_NB_TXQ) {
+		txq_idx -=3D NX_FIRST_VIF_TXQ_IDX;
+		trace_seq_printf(p, "[VIF %d/%d]", txq_idx / NX_NB_TXQ_PER_VIF,
+				 txq_idx % NX_NB_TXQ_PER_VIF);
+#endif
+	} else {
+		trace_seq_printf(p, "[ERROR %d]", txq_idx);
+	}
+
+	trace_seq_putc(p, 0);
+
+	return ret;
+}
+
+static inline const char *ftrace_print_sta(struct trace_seq *p, int sta_id=
x)
+{
+	const char *ret =3D trace_seq_buffer_ptr(p);
+
+	if (sta_idx < NX_REMOTE_STA_MAX)
+		trace_seq_printf(p, "[STA %d]", sta_idx);
+	else
+		trace_seq_printf(p, "[BC/MC %d]", sta_idx - NX_REMOTE_STA_MAX);
+
+	trace_seq_putc(p, 0);
+
+	return ret;
+}
+
+static inline const char *ftrace_print_hwq(struct trace_seq *p, int hwq_id=
x)
+{
+	static const struct trace_print_flags symbols[] =3D {{AICWF_HWQ_BK, "BK"}=
,
+							   {AICWF_HWQ_BE, "BE"},
+							   {AICWF_HWQ_VI, "VI"},
+							   {AICWF_HWQ_VO, "VO"},
+#ifdef CONFIG_AICWF_FULLMAC
+							   {AICWF_HWQ_BCMC, "BCMC"},
+#else
+							   {AICWF_HWQ_BCN, "BCN"},
+#endif
+							   {-1, NULL}};
+	return trace_print_symbols_seq(p, hwq_idx, symbols, ARRAY_SIZE(symbols));
+}
+
+static inline const char *ftrace_print_hwq_cred(struct trace_seq *p, u8 *c=
red)
+{
+	const char *ret =3D trace_seq_buffer_ptr(p);
+
+#if NX_USER_MAX =3D=3D 1
+	trace_seq_printf(p, "%d", cred[0]);
+#else
+	int i;
+
+	for (i =3D 0; i < NX_USER_MAX - 1; i++)
+		trace_seq_printf(p, "%d-", cred[i]);
+	trace_seq_printf(p, "%d", cred[i]);
+#endif
+
+	trace_seq_putc(p, 0);
+	return ret;
+}
+
+static inline const char *ftrace_print_mu_info(struct trace_seq *p, u8 mu_=
info)
+{
+	const char *ret =3D trace_seq_buffer_ptr(p);
+
+	if (mu_info)
+		trace_seq_printf(p, "MU: %d-%d", (mu_info & 0x3f), (mu_info >> 6));
+
+	trace_seq_putc(p, 0);
+	return ret;
+}
+
+static inline const char *ftrace_print_mu_group(struct trace_seq *p, int n=
b_user,
+						u8 *users)
+{
+	const char *ret =3D trace_seq_buffer_ptr(p);
+	int i;
+
+	if (users[0] !=3D 0xff)
+		trace_seq_printf(p, "(%d", users[0]);
+	else
+		trace_seq_printf(p, "(-");
+	for (i =3D 1; i < NX_USER_MAX; i++) {
+		if (users[i] !=3D 0xff)
+			trace_seq_printf(p, ",%d", users[i]);
+		else
+			trace_seq_printf(p, ",-");
+	}
+
+	trace_seq_printf(p, ")");
+	trace_seq_putc(p, 0);
+	return ret;
+}
+
+static inline const char *ftrace_print_amsdu(struct trace_seq *p, u16 nb_p=
kt)
+{
+	const char *ret =3D trace_seq_buffer_ptr(p);
+
+	if (nb_pkt > 1)
+		trace_seq_printf(p, "(AMSDU %d)", nb_pkt);
+
+	trace_seq_putc(p, 0);
+	return ret;
+}
+#endif /* defined(CONFIG_TRACEPOINTS) && defined(AIC8800_CREATE_TRACE_POIN=
TS) */
+
+#undef __print_txq
+#define __print_txq(txq_idx) ftrace_print_txq(p, txq_idx)
+
+#undef __print_sta
+#define __print_sta(sta_idx) ftrace_print_sta(p, sta_idx)
+
+#undef __print_hwq
+#define __print_hwq(hwq) ftrace_print_hwq(p, hwq)
+
+#undef __print_hwq_cred
+#define __print_hwq_cred(cred) ftrace_print_hwq_cred(p, cred)
+
+#undef __print_mu_info
+#define __print_mu_info(mu_info) ftrace_print_mu_info(p, mu_info)
+
+#undef __print_mu_group
+#define __print_mu_group(nb, users) ftrace_print_mu_group(p, nb, users)
+
+#undef __print_amsdu
+#define __print_amsdu(nb_pkt) ftrace_print_amsdu(p, nb_pkt)
+
+#ifdef CONFIG_AICWF_FULLMAC
+
+TRACE_EVENT(txq_select, TP_PROTO(int txq_idx, u16 pkt_ready_up, struct sk_=
buff *skb),
+	    TP_ARGS(txq_idx, pkt_ready_up, skb),
+	    TP_STRUCT__entry(__field(u16, txq_idx) __field(u16, pkt_ready)
+			     __field(struct sk_buff *, skb)),
+	    TP_fast_assign(__entry->txq_idx =3D txq_idx;
+			   __entry->pkt_ready =3D pkt_ready_up; __entry->skb =3D skb;),
+	    TP_printk("%s pkt_ready_up=3D%d skb=3D%p", __print_txq(__entry->txq_i=
dx),
+		      __entry->pkt_ready, __entry->skb));
+
+#endif /* CONFIG_AICWF_FULLMAC */
+
+DECLARE_EVENT_CLASS(hwq_template, TP_PROTO(u8 hwq_idx), TP_ARGS(hwq_idx),
+		    TP_STRUCT__entry(__field(u8, hwq_idx)),
+		    TP_fast_assign(__entry->hwq_idx =3D hwq_idx;),
+		    TP_printk("%s", __print_hwq(__entry->hwq_idx)));
+
+DEFINE_EVENT(hwq_template, hwq_flowctrl_stop, TP_PROTO(u8 hwq_idx),
+	     TP_ARGS(hwq_idx));
+
+DEFINE_EVENT(hwq_template, hwq_flowctrl_start, TP_PROTO(u8 hwq_idx),
+	     TP_ARGS(hwq_idx));
+
+DECLARE_EVENT_CLASS(txq_template, TP_PROTO(struct aicwf_txq *txq), TP_ARGS=
(txq),
+		    TP_STRUCT__entry(__field(u16, txq_idx)),
+		    TP_fast_assign(__entry->txq_idx =3D txq->idx;),
+		    TP_printk("%s", __print_txq(__entry->txq_idx)));
+
+DEFINE_EVENT(txq_template, txq_add_to_hw, TP_PROTO(struct aicwf_txq *txq),
+	     TP_ARGS(txq));
+
+DEFINE_EVENT(txq_template, txq_del_from_hw, TP_PROTO(struct aicwf_txq *txq=
),
+	     TP_ARGS(txq));
+
+#ifdef CONFIG_AICWF_FULLMAC
+
+DEFINE_EVENT(txq_template, txq_flowctrl_stop, TP_PROTO(struct aicwf_txq *t=
xq),
+	     TP_ARGS(txq));
+
+DEFINE_EVENT(txq_template, txq_flowctrl_restart, TP_PROTO(struct aicwf_txq=
 *txq),
+	     TP_ARGS(txq));
+
+#endif /* CONFIG_AICWF_FULLMAC */
+
+TRACE_EVENT(process_txq, TP_PROTO(struct aicwf_txq *txq), TP_ARGS(txq),
+	    TP_STRUCT__entry(__field(u16, txq_idx) __field(u16, len)
+			     __field(u16, len_retry) __field(s8, credit)
+#ifdef CONFIG_AICWF_FULLMAC
+			     __field(u16, limit)
+#endif /* CONFIG_AICWF_FULLMAC */
+						),
+	    TP_fast_assign(__entry->txq_idx =3D txq->idx;
+			   __entry->len =3D skb_queue_len(&txq->sk_list);
+#ifdef CONFIG_MAC80211_TXQ
+			   __entry->len +=3D txq->nb_ready_mac80211;
+#endif
+			   __entry->len_retry =3D txq->nb_retry;
+			   __entry->credit =3D txq->credits;
+#ifdef CONFIG_AICWF_FULLMAC
+			   __entry->limit =3D txq->push_limit;
+#endif /* CONFIG_AICWF_FULLMAC */
+						),
+#ifdef CONFIG_AICWF_FULLMAC
+	    TP_printk("%s txq_credits=3D%d, len=3D%d, retry_len=3D%d, push_limit=
=3D%d",
+		      __print_txq(__entry->txq_idx), __entry->credit,
+		      __entry->len, __entry->len_retry, __entry->limit)
+#else
+	    TP_printk("%s txq_credits=3D%d, len=3D%d, retry_len=3D%d",
+		      __print_txq(__entry->txq_idx), __entry->credit,
+		      __entry->len, __entry->len_retry)
+#endif /* CONFIG_AICWF_FULLMAC */
+);
+
+DECLARE_EVENT_CLASS(txq_reason_template, TP_PROTO(struct aicwf_txq *txq, u=
16 reason),
+		    TP_ARGS(txq, reason),
+		    TP_STRUCT__entry(__field(u16, txq_idx) __field(u16, reason)
+				     __field(u16, status)),
+		    TP_fast_assign(__entry->txq_idx =3D txq->idx; __entry->reason =3D re=
ason;
+				   __entry->status =3D txq->status;),
+		    TP_printk("%s reason=3D%s status=3D%s", __print_txq(__entry->txq_idx=
),
+			      __print_symbolic(__entry->reason, {AICWF_TXQ_STOP_FULL, "FULL"},
+					       {AICWF_TXQ_STOP_CSA, "CSA"},
+					       {AICWF_TXQ_STOP_STA_PS, "PS"},
+					       {AICWF_TXQ_STOP_VIF_PS, "VPS"},
+					       {AICWF_TXQ_STOP_CHAN, "CHAN"},
+					       {AICWF_TXQ_STOP_MU_POS, "MU"}),
+			      __print_flags(__entry->status, "|",
+					    {AICWF_TXQ_IN_HWQ_LIST, "IN LIST"},
+					    {AICWF_TXQ_STOP_FULL, "FULL"},
+					    {AICWF_TXQ_STOP_CSA, "CSA"},
+					    {AICWF_TXQ_STOP_STA_PS, "PS"},
+					    {AICWF_TXQ_STOP_VIF_PS, "VPS"},
+					    {AICWF_TXQ_STOP_CHAN, "CHAN"},
+					    {AICWF_TXQ_STOP_MU_POS, "MU"},
+					    {AICWF_TXQ_NDEV_FLOW_CTRL, "FLW_CTRL"})));
+
+DEFINE_EVENT(txq_reason_template, txq_start,
+	     TP_PROTO(struct aicwf_txq *txq, u16 reason), TP_ARGS(txq, reason));
+
+DEFINE_EVENT(txq_reason_template, txq_stop,
+	     TP_PROTO(struct aicwf_txq *txq, u16 reason), TP_ARGS(txq, reason));
+
+TRACE_EVENT(push_desc,
+	    TP_PROTO(struct sk_buff *skb, struct aicwf_sw_txhdr *sw_txhdr, int pu=
sh_flags),
+	    TP_ARGS(skb, sw_txhdr, push_flags),
+	    TP_STRUCT__entry(__field(struct sk_buff *, skb) __field(unsigned int,=
 len)
+			     __field(u16, tx_queue) __field(u8, hw_queue)
+			     __field(u8, push_flag) __field(u32, flag)
+			     __field(s8, txq_cred) __field(u8, hwq_cred)
+			     __field(u16, pkt_cnt)
+			     __field(u8, mu_info)),
+	    TP_fast_assign(__entry->skb =3D skb; __entry->tx_queue =3D sw_txhdr->=
txq->idx;
+			   __entry->push_flag =3D push_flags;
+			   __entry->hw_queue =3D sw_txhdr->txq->hwq->id;
+			   __entry->txq_cred =3D sw_txhdr->txq->credits;
+#ifdef CONFIG_AICWF_SPLIT_TX_BUF
+			   __entry->pkt_cnt =3D sw_txhdr->desc.host.packet_cnt;
+#endif
+#ifdef CONFIG_AICWF_FULLMAC
+			   __entry->flag =3D sw_txhdr->desc.host.flags;
+#ifdef CONFIG_AICWF_SPLIT_TX_BUF
+#ifdef CONFIG_AICWF_AMSDUS_TX
+			if (sw_txhdr->amsdu.len)
+				__entry->len =3D sw_txhdr->amsdu.len;
+			else
+#endif /* CONFIG_AICWF_AMSDUS_TX */
+				__entry->len =3D sw_txhdr->desc.host.packet_len[0];
+#else
+			   __entry->len =3D sw_txhdr->desc.host.packet_len;
+#endif /* CONFIG_AICWF_SPLIT_TX_BUF */
+#else  /* !CONFIG_AICWF_FULLMAC */
+			   __entry->flag =3D sw_txhdr->desc.umac.flags;
+			   __entry->len =3D sw_txhdr->frame_len;
+			   __entry->sn =3D sw_txhdr->sn;
+#endif /* CONFIG_AICWF_FULLMAC */
+#ifdef CONFIG_AICWF_MUMIMO_TX
+			   __entry->mu_info =3D sw_txhdr->desc.host.mumimo_info;
+#else
+			   __entry->mu_info =3D 0;
+#endif
+					),
+#ifdef CONFIG_AICWF_FULLMAC
+	TP_printk("%s skb=3D%p (len=3D%d) hw_queue=3D%s cred_txq=3D%d cred_hwq=3D=
%d %s flag=3D%s %s %s %s",
+		  __print_txq(__entry->tx_queue), __entry->skb, __entry->len,
+		  __print_hwq(__entry->hw_queue), __entry->txq_cred,
+		  __entry->hwq_cred, __print_mu_info(__entry->mu_info),
+		  __print_flags(__entry->flag, "|", {TXU_CNTRL_RETRY, "RETRY"},
+				{TXU_CNTRL_MORE_DATA, "MOREDATA"}, {TXU_CNTRL_MGMT, "MGMT"},
+				{TXU_CNTRL_MGMT_NO_CCK, "NO_CCK"},
+				{TXU_CNTRL_MGMT_ROBUST, "ROBUST"}, {TXU_CNTRL_AMSDU, "AMSDU"},
+				{TXU_CNTRL_USE_4ADDR, "4ADDR"}, {TXU_CNTRL_EOSP, "EOSP"},
+				{TXU_CNTRL_MESH_FWD, "MESH_FWD"}, {TXU_CNTRL_TDLS, "TDLS"}),
+		  (__entry->push_flag & AICWF_PUSH_IMMEDIATE) ? "(IMMEDIATE)" : "",
+		  (!(__entry->flag & TXU_CNTRL_RETRY) &&
+		  (__entry->push_flag & AICWF_PUSH_RETRY))
+		  ? "(SW_RETRY)" : "",
+		  __print_amsdu(__entry->pkt_cnt))
+#else
+	TP_printk("%s skb=3D%p (len=3D%d) hw_queue=3D%s cred_txq=3D%d cred_hwq=3D=
%d %s flag=3D%x (%s) sn=3D%d %s",
+		  __print_txq(__entry->tx_queue), __entry->skb, __entry->len,
+		  __print_hwq(__entry->hw_queue), __entry->txq_cred,
+		  __entry->hwq_cred, __print_mu_info(__entry->mu_info),
+		  __entry->flag,
+		  __print_flags(__entry->push_flag, "|", {AICWF_PUSH_RETRY, "RETRY"},
+				{AICWF_PUSH_IMMEDIATE, "IMMEDIATE"}),
+		  __entry->sn, __print_amsdu(__entry->pkt_cnt))
+#endif /* CONFIG_AICWF_FULLMAC */
+);
+
+TRACE_EVENT(txq_queue_skb, TP_PROTO(struct sk_buff *skb, struct aicwf_txq =
*txq, bool retry),
+	    TP_ARGS(skb, txq, retry),
+	    TP_STRUCT__entry(__field(struct sk_buff *, skb) __field(u16, txq_idx)
+			     __field(s8, credit) __field(u16, q_len)
+			     __field(u16, q_len_retry) __field(bool, retry)),
+	TP_fast_assign(__entry->skb =3D skb; __entry->txq_idx =3D txq->idx;
+		       __entry->credit =3D txq->credits;
+		       __entry->q_len =3D skb_queue_len(&txq->sk_list);
+		       __entry->q_len_retry =3D txq->nb_retry;
+		       __entry->retry =3D retry;),
+	TP_printk("%s skb=3D%p retry=3D%d txq_credits=3D%d queue_len=3D%d (retry =
=3D %d)",
+		  __print_txq(__entry->txq_idx), __entry->skb, __entry->retry,
+		  __entry->credit, __entry->q_len, __entry->q_len_retry));
+
+#ifdef CONFIG_MAC80211_TXQ
+TRACE_EVENT(txq_wake, TP_PROTO(struct aicwf_txq *txq), TP_ARGS(txq),
+	    TP_STRUCT__entry(__field(u16, txq_idx) __field(u16, q_len)),
+	    TP_fast_assign(__entry->txq_idx =3D txq->idx;
+			   __entry->q_len =3D txq->nb_ready_mac80211;),
+	    TP_printk("%s mac80211_queue_len=3D%d", __print_txq(__entry->txq_idx)=
,
+		      __entry->q_len));
+
+TRACE_EVENT(txq_drop, TP_PROTO(struct aicwf_txq *txq, unsigned long nb_dro=
p),
+	    TP_ARGS(txq, nb_drop),
+	    TP_STRUCT__entry(__field(u16, txq_idx) __field(u16, nb_drop)),
+	    TP_fast_assign(__entry->txq_idx =3D txq->idx;
+			   __entry->nb_drop =3D nb_drop;),
+	    TP_printk("%s %u pkt have been dropped by codel in mac80211 txq",
+		      __print_txq(__entry->txq_idx), __entry->nb_drop));
+
+#endif
+
+DECLARE_EVENT_CLASS(idx_template, TP_PROTO(u16 idx), TP_ARGS(idx),
+		    TP_STRUCT__entry(__field(u16, idx)),
+		    TP_fast_assign(__entry->idx =3D idx;),
+		    TP_printk("idx=3D%d", __entry->idx));
+
+DEFINE_EVENT(idx_template, txq_vif_start, TP_PROTO(u16 idx), TP_ARGS(idx))=
;
+
+DEFINE_EVENT(idx_template, txq_vif_stop, TP_PROTO(u16 idx), TP_ARGS(idx));
+
+TRACE_EVENT(process_hw_queue, TP_PROTO(struct aicwf_hwq *hwq), TP_ARGS(hwq=
),
+	    TP_STRUCT__entry(__field(u16, hwq)
+			     __array(u8, credits, NX_USER_MAX)),
+	    TP_fast_assign(__entry->hwq =3D hwq->id;),
+	    TP_printk("hw_queue=3D%s hw_credits=3D%s", __print_hwq(__entry->hwq),
+		      __print_hwq_cred(__entry->credits)));
+
+DECLARE_EVENT_CLASS(sta_idx_template, TP_PROTO(u16 idx), TP_ARGS(idx),
+		    TP_STRUCT__entry(__field(u16, idx)),
+		    TP_fast_assign(__entry->idx =3D idx;),
+		    TP_printk("%s", __print_sta(__entry->idx)));
+
+DEFINE_EVENT(sta_idx_template, txq_sta_start, TP_PROTO(u16 idx), TP_ARGS(i=
dx));
+
+DEFINE_EVENT(sta_idx_template, txq_sta_stop, TP_PROTO(u16 idx), TP_ARGS(id=
x));
+
+#ifdef CONFIG_AICWF_FULLMAC
+
+DEFINE_EVENT(sta_idx_template, ps_disable, TP_PROTO(u16 idx), TP_ARGS(idx)=
);
+
+#endif /* CONFIG_AICWF_FULLMAC */
+
+TRACE_EVENT(skb_confirm,
+	    #ifdef CONFIG_AICWF_FULLMAC
+	    TP_PROTO(struct sk_buff *skb, struct aicwf_txq *txq,
+		     struct aicwf_hwq *hwq, struct tx_cfm_tag *cfm),
+	    #else
+	    TP_PROTO(struct sk_buff *skb, struct aicwf_txq *txq,
+		     struct aicwf_hwq *hwq, u8 cfm),
+	    #endif
+	TP_ARGS(skb, txq, hwq, cfm),
+	TP_STRUCT__entry(__field(struct sk_buff *, skb) __field(u16, txq_idx)
+			 __field(u8, hw_queue) __array(u8, hw_credit, NX_USER_MAX)
+			 __field(s8, sw_credit) __field(s8, sw_credit_up)
+#ifdef CONFIG_AICWF_FULLMAC
+			 __field(u8, ampdu_size)
+#ifdef CONFIG_AICWF_SPLIT_TX_BUF
+			 __field(u16, amsdu)
+#endif /* CONFIG_AICWF_SPLIT_TX_BUF */
+			 __field(u16, sn)
+#endif /* CONFIG_AICWF_FULLMAC */
+					),
+	TP_fast_assign(__entry->skb =3D skb; __entry->txq_idx =3D txq->idx;
+		       __entry->hw_queue =3D hwq->id;
+		       __entry->sw_credit =3D txq->credits;
+#if defined CONFIG_AICWF_FULLMAC
+		       __entry->sw_credit_up =3D cfm->credits;
+		       __entry->ampdu_size =3D cfm->ampdu_size;
+#ifdef CONFIG_AICWF_SPLIT_TX_BUF
+		       __entry->amsdu =3D cfm->amsdu_size; __entry->sn =3D cfm->sn;
+#endif
+#else
+		       __entry->sw_credit_up =3D cfm
+#endif /* CONFIG_AICWF_FULLMAC */
+				),
+	TP_printk("%s skb=3D%p hw_queue=3D%s, hw_credits=3D%s, txq_credits=3D%d (=
+%d)"
+#ifdef CONFIG_AICWF_FULLMAC
+		  " sn=3D%u ampdu=3D%d"
+#ifdef CONFIG_AICWF_SPLIT_TX_BUF
+		  " amsdu=3D%u"
+#endif
+#endif
+		,
+		  __print_txq(__entry->txq_idx), __entry->skb,
+		  __print_hwq(__entry->hw_queue),
+		  __print_hwq_cred(__entry->hw_credit), __entry->sw_credit,
+		  __entry->sw_credit_up
+#ifdef CONFIG_AICWF_FULLMAC
+		,
+		  __entry->sn, __entry->ampdu_size
+#ifdef CONFIG_AICWF_SPLIT_TX_BUF
+		,
+		  __entry->amsdu
+#endif
+#endif
+			));
+
+TRACE_EVENT(credit_update, TP_PROTO(struct aicwf_txq *txq, s8 cred_up),
+	    TP_ARGS(txq, cred_up),
+	    TP_STRUCT__entry(__field(struct sk_buff *, skb)
+			     __field(u16, txq_idx) __field(s8, sw_credit)
+			     __field(s8, sw_credit_up)),
+	    TP_fast_assign(__entry->txq_idx =3D txq->idx;
+			   __entry->sw_credit =3D txq->credits;
+			   __entry->sw_credit_up =3D cred_up;),
+	    TP_printk("%s txq_credits=3D%d (%+d)", __print_txq(__entry->txq_idx),
+		      __entry->sw_credit, __entry->sw_credit_up))
+#ifdef CONFIG_AICWF_FULLMAC
+DECLARE_EVENT_CLASS(ps_template, TP_PROTO(struct aicwf_sta *sta), TP_ARGS(=
sta),
+		    TP_STRUCT__entry(__field(u16, idx) __field(u16, ready_ps)
+				     __field(u16, sp_ps) __field(u16, ready_uapsd)
+				     __field(u16, sp_uapsd)),
+		    TP_fast_assign(__entry->idx =3D sta->sta_idx;
+				   __entry->ready_ps =3D sta->ps.pkt_ready[LEGACY_PS_ID];
+				   __entry->sp_ps =3D sta->ps.sp_cnt[LEGACY_PS_ID];
+				   __entry->ready_uapsd =3D sta->ps.pkt_ready[UAPSD_ID];
+				   __entry->sp_uapsd =3D sta->ps.sp_cnt[UAPSD_ID];),
+		    TP_printk("%s [PS] ready=3D%d sp=3D%d [UAPSD] ready=3D%d sp=3D%d",
+			      __print_sta(__entry->idx), __entry->ready_ps, __entry->sp_ps,
+			      __entry->ready_uapsd, __entry->sp_uapsd));
+
+DEFINE_EVENT(ps_template, ps_queue, TP_PROTO(struct aicwf_sta *sta), TP_AR=
GS(sta));
+
+DEFINE_EVENT(ps_template, ps_push, TP_PROTO(struct aicwf_sta *sta), TP_ARG=
S(sta));
+
+DEFINE_EVENT(ps_template, ps_enable, TP_PROTO(struct aicwf_sta *sta), TP_A=
RGS(sta));
+
+TRACE_EVENT(ps_traffic_update, TP_PROTO(u16 sta_idx, u8 traffic, bool uaps=
d),
+	    TP_ARGS(sta_idx, traffic, uapsd),
+	    TP_STRUCT__entry(__field(u16, sta_idx) __field(u8, traffic)
+			     __field(bool, uapsd)),
+	    TP_fast_assign(__entry->sta_idx =3D sta_idx;
+			   __entry->traffic =3D traffic; __entry->uapsd =3D uapsd;),
+	    TP_printk("%s %s%s traffic available ",
+		      __print_sta(__entry->sta_idx),
+		      __entry->traffic ? "" : "no more ",
+		      __entry->uapsd ? "U-APSD" : "legacy PS"));
+
+TRACE_EVENT(ps_traffic_req, TP_PROTO(struct aicwf_sta *sta, u16 pkt_req, u=
8 ps_id),
+	    TP_ARGS(sta, pkt_req, ps_id),
+	    TP_STRUCT__entry(__field(u16, idx) __field(u16, pkt_req)
+			     __field(u8, ps_id) __field(u16, ready)
+			     __field(u16, sp)),
+	    TP_fast_assign(__entry->idx =3D sta->sta_idx;
+			   __entry->pkt_req =3D pkt_req; __entry->ps_id =3D ps_id;
+			   __entry->ready =3D sta->ps.pkt_ready[ps_id];
+			   __entry->sp =3D sta->ps.sp_cnt[ps_id];),
+	    TP_printk("%s %s traffic request %d pkt (ready=3D%d, sp=3D%d)",
+		      __print_sta(__entry->idx),
+		      __entry->ps_id =3D=3D UAPSD_ID ? "U-APSD" : "legacy PS",
+		      __entry->pkt_req, __entry->ready, __entry->sp));
+
+#ifdef CONFIG_AICWF_AMSDUS_TX
+TRACE_EVENT(amsdu_subframe, TP_PROTO(struct aicwf_sw_txhdr *sw_txhdr),
+	    TP_ARGS(sw_txhdr),
+	    TP_STRUCT__entry(__field(struct sk_buff *, skb)
+			     __field(u16, txq_idx) __field(u8, nb)
+			     __field(u32, len)),
+	    TP_fast_assign(__entry->skb =3D sw_txhdr->skb;
+			   __entry->nb =3D sw_txhdr->amsdu.nb;
+			   __entry->len =3D sw_txhdr->amsdu.len;
+			   __entry->txq_idx =3D sw_txhdr->txq->idx;),
+	    TP_printk("%s skb=3D%p %s nb_subframe=3D%d, len=3D%u",
+		      __print_txq(__entry->txq_idx), __entry->skb,
+		      (__entry->nb =3D=3D 2) ? "Start new AMSDU" : "Add subframe",
+		      __entry->nb, __entry->len));
+#endif
+
+#endif /* CONFIG_AICWF_FULLMAC */
+
+#ifdef CONFIG_AICWF_MUMIMO_TX
+TRACE_EVENT(mu_group_update, TP_PROTO(struct aicwf_mu_group *group),
+	    TP_ARGS(group),
+	    TP_STRUCT__entry(__field(u8, nb_user) __field(u8, group_id)
+			     __array(u8, users, NX_USER_MAX)),
+	    TP_fast_assign(int i; __entry->nb_user =3D group->user_cnt;
+			for (i =3D 0; i < NX_USER_MAX; i++) {
+				if (group->users[i])
+					__entry->users[i] =3D group->users[i]->sta_idx;
+				else
+					__entry->users[i] =3D 0xff;
+			}
+			__entry->group_id =3D group->group_id;),
+	    TP_printk("Group-id =3D %d, Users =3D %s", __entry->group_id,
+		      __print_mu_group(__entry->nb_user, __entry->users)));
+
+TRACE_EVENT(mu_group_delete, TP_PROTO(int group_id), TP_ARGS(group_id),
+	    TP_STRUCT__entry(__field(u8, group_id)),
+	    TP_fast_assign(__entry->group_id =3D group_id;),
+	    TP_printk("Group-id =3D %d", __entry->group_id));
+
+TRACE_EVENT(mu_group_selection, TP_PROTO(struct aicwf_sta *sta, int group_=
id),
+	    TP_ARGS(sta, group_id),
+	    TP_STRUCT__entry(__field(u8, sta_idx) __field(u8, group_id)),
+	    TP_fast_assign(__entry->sta_idx =3D sta->sta_idx;
+			   __entry->group_id =3D group_id;),
+	    TP_printk("[Sta %d] Group-id =3D %d", __entry->sta_idx,
+		      __entry->group_id));
+
+TRACE_EVENT(txq_select_mu_group,
+	    TP_PROTO(struct aicwf_txq *txq, int group_id, int pos),
+	    TP_ARGS(txq, group_id, pos),
+	    TP_STRUCT__entry(__field(u16, txq_idx) __field(u8, group_id)
+			     __field(u8, pos)),
+	    TP_fast_assign(__entry->txq_idx =3D txq->idx;
+			   __entry->group_id =3D group_id; __entry->pos =3D pos;),
+	    TP_printk("%s: group=3D%d pos=3D%d", __print_txq(__entry->txq_idx),
+		      __entry->group_id, __entry->pos));
+
+#endif /* CONFIG_AICWF_MUMIMO_TX */
+
+/*************************************************************************=
****
+ * TRACE functions for MESH
+ *************************************************************************=
***/
+#ifdef CONFIG_AICWF_FULLMAC
+DECLARE_EVENT_CLASS(mesh_path_template, TP_PROTO(struct aicwf_mesh_path *m=
esh_path),
+		    TP_ARGS(mesh_path),
+		    TP_STRUCT__entry(__field(u8, idx) __field(u8, next_hop_sta)
+				     __array(u8, tgt_mac, ETH_ALEN)),
+		    TP_fast_assign(__entry->idx =3D mesh_path->path_idx;
+				   memcpy(__entry->tgt_mac, &mesh_path->tgt_mac_addr, ETH_ALEN);
+				if (mesh_path->p_nhop_sta)
+					__entry->next_hop_sta =3D mesh_path->p_nhop_sta->sta_idx;
+				else
+					__entry->next_hop_sta =3D 0xff;),
+		    TP_printk("Mpath(%d): target=3D%pM next_hop=3DSTA-%d", __entry->idx,
+			      __entry->tgt_mac, __entry->next_hop_sta));
+
+DEFINE_EVENT(mesh_path_template, mesh_create_path,
+	     TP_PROTO(struct aicwf_mesh_path *mesh_path), TP_ARGS(mesh_path));
+
+DEFINE_EVENT(mesh_path_template, mesh_delete_path,
+	     TP_PROTO(struct aicwf_mesh_path *mesh_path), TP_ARGS(mesh_path));
+
+DEFINE_EVENT(mesh_path_template, mesh_update_path,
+	     TP_PROTO(struct aicwf_mesh_path *mesh_path), TP_ARGS(mesh_path));
+
+#endif /* CONFIG_AICWF_FULLMAC */
+
+/*************************************************************************=
****
+ * TRACE functions for RADAR
+ *************************************************************************=
***/
+#ifdef CONFIG_AICWF_RADAR
+TRACE_EVENT(radar_pulse, TP_PROTO(u8 chain, struct radar_pulse *pulse),
+	    TP_ARGS(chain, pulse),
+	    TP_STRUCT__entry(__field(u8, chain) __field(s16, freq)
+			     __field(u16, pri) __field(u8, len)
+			     __field(u8, fom)),
+	    TP_fast_assign(__entry->freq =3D pulse->freq * 2;
+			   __entry->len =3D pulse->len * 2;
+			   __entry->fom =3D pulse->fom * 6;
+			   __entry->pri =3D pulse->rep; __entry->chain =3D chain;),
+	    TP_printk("%s: PRI=3D%.5d LEN=3D%.3d FOM=3D%.2d%% freq=3D%dMHz ",
+		      __print_symbolic(__entry->chain, {AICWF_RADAR_RIU, "RIU"},
+				       {AICWF_RADAR_FCU, "FCU"}),
+				       __entry->pri, __entry->len, __entry->fom, __entry->freq));
+
+TRACE_EVENT(radar_detected, TP_PROTO(u8 chain, u8 region, s16 freq, u8 typ=
e, u16 pri),
+	    TP_ARGS(chain, region, freq, type, pri),
+	    TP_STRUCT__entry(__field(u8, chain) __field(u8, region) __field(s16, =
freq)
+			     __field(u8, type) __field(u16, pri)),
+	    TP_fast_assign(__entry->chain =3D chain; __entry->region =3D region;
+			   __entry->freq =3D freq; __entry->type =3D type;
+			   __entry->pri =3D pri;),
+	    TP_printk("%s: region=3D%s type=3D%d freq=3D%dMHz (pri=3D%dus)",
+		      __print_symbolic(__entry->chain, {AICWF_RADAR_RIU, "RIU"},
+				       {AICWF_RADAR_FCU, "FCU"}),
+		      __print_symbolic(__entry->region, {NL80211_DFS_UNSET, "UNSET"},
+				       {NL80211_DFS_FCC, "FCC"},
+				       {NL80211_DFS_ETSI, "ETSI"},
+				       {NL80211_DFS_JP, "JP"}),
+		      __entry->type, __entry->freq, __entry->pri));
+
+TRACE_EVENT(radar_set_region, TP_PROTO(u8 region), TP_ARGS(region),
+	    TP_STRUCT__entry(__field(u8, region)),
+	    TP_fast_assign(__entry->region =3D region;),
+	    TP_printk("region=3D%s",
+		      __print_symbolic(__entry->region,
+				       {NL80211_DFS_UNSET, "UNSET"},
+				       {NL80211_DFS_FCC, "FCC"},
+				       {NL80211_DFS_ETSI, "ETSI"},
+				       {NL80211_DFS_JP, "JP"})));
+
+TRACE_EVENT(radar_enable_detection, TP_PROTO(u8 region, u8 enable, u8 chai=
n),
+	    TP_ARGS(region, enable, chain),
+	    TP_STRUCT__entry(__field(u8, region) __field(u8, chain)
+			     __field(u8, enable)),
+	    TP_fast_assign(__entry->chain =3D chain; __entry->enable =3D enable;
+			   __entry->region =3D region;),
+	    TP_printk("%s: %s radar detection %s",
+		      __print_symbolic(__entry->chain, {AICWF_RADAR_RIU, "RIU"},
+				       {AICWF_RADAR_FCU, "FCU"}),
+		      __print_symbolic(__entry->enable,
+				       {AICWF_RADAR_DETECT_DISABLE, "Disable"},
+				       {AICWF_RADAR_DETECT_ENABLE,
+				       "Enable (no report)"},
+				       {AICWF_RADAR_DETECT_REPORT, "Enable"}),
+		      __entry->enable =3D=3D AICWF_RADAR_DETECT_DISABLE
+				? ""	: __print_symbolic(__entry->region,
+							   {NL80211_DFS_UNSET, "UNSET"},
+							   {NL80211_DFS_FCC, "FCC"},
+							   {NL80211_DFS_ETSI, "ETSI"},
+							   {NL80211_DFS_JP, "JP"})));
+#endif /* CONFIG_AICWF_RADAR */
+
+/*************************************************************************=
****
+ * TRACE functions for IPC message
+ *************************************************************************=
***/
+#include "aicwf_strs.h"
+
+DECLARE_EVENT_CLASS(ipc_msg_template, TP_PROTO(u16 id), TP_ARGS(id),
+		    TP_STRUCT__entry(__field(u16, id)),
+		    TP_fast_assign(__entry->id =3D id;),
+		    TP_printk("%s (%d - %d)", AICWF_ID2STR(__entry->id),
+			      MSG_T(__entry->id), MSG_I(__entry->id)));
+
+DEFINE_EVENT(ipc_msg_template, msg_send, TP_PROTO(u16 id), TP_ARGS(id));
+
+DEFINE_EVENT(ipc_msg_template, msg_recv, TP_PROTO(u16 id), TP_ARGS(id));
+
+#endif /* !defined(_AICWF_EVENTS_H) || defined(TRACE_HEADER_MULTI_READ) */
+
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH AIC_TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_FILE aicwf_events
+#include <trace/define_trace.h>
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_main.h b/drivers/n=
et/wireless/aic/aic8800_fdrv/aicwf_main.h
new file mode 100644
index 000000000000..8820a46deb33
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_main.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_MAIN_H_
+#define _AICWF_MAIN_H_
+
+#include <linux/delay.h>
+
+#include "aicwf_defs.h"
+
+int aicwf_cfg80211_init(struct aicwf_plat *aicwf_plat, void **platform_dat=
a);
+void aicwf_cfg80211_deinit(struct aicwf_hw *aicwf_hw);
+int aicwf_ic_rf_init(struct aicwf_hw *aicwf_hw);
+int aicwf_ic_system_init(struct aicwf_hw *aicwf_hw);
+void aicwf_update_mesh_power_mode(struct aicwf_vif *vif);
+void aicwf_p2p_alive_timeout(struct timer_list *t);
+void apm_staloss_work_process(struct work_struct *work);
+void apm_probe_sta_work_process(struct work_struct *work);
+
+#endif /* _AICWF_MAIN_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_mesh.h b/drivers/n=
et/wireless/aic/aic8800_fdrv/aicwf_mesh.h
new file mode 100644
index 000000000000..80b205d4e880
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_mesh.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_MESH_H_
+#define _AICWF_MESH_H_
+
+/*
+ * INCLUDE FILES
+ *************************************************************************=
***************
+ */
+
+#include "aicwf_defs.h"
+
+/*
+ * DEFINES
+ *************************************************************************=
***************
+ */
+
+/*
+ * TYPE DEFINITIONS
+ *************************************************************************=
***************
+ */
+
+/*
+ * FUNCTION DECLARATIONS
+ *************************************************************************=
***************
+ */
+
+/*
+ *************************************************************************=
***************
+ * @brief TODO [LT]
+ *************************************************************************=
***************
+ */
+struct aicwf_mesh_proxy *aicwf_get_mesh_proxy_info(struct aicwf_vif *p_aic=
wf_vif,
+						   u8 *p_sta_addr, bool local);
+
+#endif /* _AICWF_MESH_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_mod_params.h b/dri=
vers/net/wireless/aic/aic8800_fdrv/aicwf_mod_params.h
new file mode 100644
index 000000000000..f02fc955aae4
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_mod_params.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_MOD_PARAM_H_
+#define _AICWF_MOD_PARAM_H_
+
+struct aicwf_mod_params {
+	bool ht_on;
+	bool vht_on;
+	bool he_on;
+	int mcs_map;
+	int he_mcs_map;
+	bool he_ul_on;
+	bool ldpc_on;
+	bool stbc_on;
+	bool gf_rx_on;
+	int phy_cfg;
+	int uapsd_timeout;
+	bool ap_uapsd_on;
+	bool sgi;
+	bool sgi80;
+	bool use_2040;
+	bool use_80;
+	int nss;
+	int amsdu_rx_max;
+	bool bfmee;
+	bool bfmer;
+	bool mesh;
+	bool murx;
+	bool mutx;
+	bool mutx_on;
+	unsigned int roc_dur_max;
+	int listen_itv;
+	bool listen_bcmc;
+	int lp_clk_ppm;
+	bool ps_on;
+	int tx_lft;
+	int amsdu_maxnb;
+	int uapsd_queues;
+	bool tdls;
+	bool uf;
+	bool auto_reply;
+	char *ftl;
+	bool dpsm;
+#ifdef CONFIG_AICWF_FULLMAC
+	bool ant_div;
+#endif /* CONFIG_AICWF_FULLMAC */
+};
+
+extern struct aicwf_mod_params aicwf_mod_params;
+
+struct aicwf_hw;
+struct wiphy;
+int aicwf_handle_dynparams(struct aicwf_hw *aicwf_hw, struct wiphy *wiphy)=
;
+void aicwf_enable_wapi(struct aicwf_hw *aicwf_hw);
+
+#endif /* _AICWF_MOD_PARAM_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_rx.c b/drivers=
/net/wireless/aic/aic8800_fdrv/aicwf_msg_rx.c
new file mode 100644
index 000000000000..687b76eb323f
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_rx.c
@@ -0,0 +1,1412 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *************************************************************************=
*****
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief RX function definitions
+ *
+ *************************************************************************=
*****
+ */
+
+#include "aicwf_defs.h"
+#include "aicwf_tx.h"
+#include "aicwf_rx.h"
+#include <linux/rtnetlink.h>
+#include <linux/vmalloc.h>
+#ifdef CONFIG_AICWF_BFMER
+#include "aicwf_bfmer.h"
+#endif //(CONFIG_AICWF_BFMER)
+#ifdef CONFIG_AICWF_FULLMAC
+#include "aicwf_msg_tx.h"
+#endif /* CONFIG_AICWF_FULLMAC */
+#include "aicwf_txrxif.h"
+#include "aicwf_sdio.h"
+#include "aicwf_config.h"
+#include "aicwf_events.h"
+#include "aicwf_msg_rx.h"
+#include "aicwf_mod_params.h"
+#include <linux/pm.h>
+
+void aicwf_cfg80211_unlink_bss(struct aicwf_hw *aicwf_hw,
+			       struct aicwf_vif *aicwf_vif);
+
+static int aicwf_freq_to_idx(struct aicwf_hw *aicwf_hw, int freq)
+{
+	struct ieee80211_supported_band *sband =3D NULL;
+	int band, ch, idx =3D 0;
+
+	for (band =3D NL80211_BAND_2GHZ; band < NUM_NL80211_BANDS; band++) {
+#ifdef CONFIG_AICWF_FULLMAC
+		sband =3D aicwf_hw->wiphy->bands[band];
+#endif /* CONFIG_AICWF_FULLMAC */
+		if (!sband)
+			continue;
+
+		for (ch =3D 0; ch < sband->n_channels; ch++, idx++) {
+			if (sband->channels[ch].center_freq =3D=3D freq)
+				goto exit;
+		}
+	}
+
+	WARN_ON_ONCE(1);
+
+exit:
+	// Channel has been found, return the index
+	return idx;
+}
+
+/*************************************************************************=
**
+ * Messages from MM task
+ *************************************************************************=
*/
+static inline int aicwf_rx_chan_pre_switch_ind(struct aicwf_hw *aicwf_hw,
+					       struct aicwf_cmd *cmd,
+					       struct ipc_e2a_msg *msg)
+{
+	struct aicwf_vif *aicwf_vif;
+	int chan_idx =3D ((struct mm_channel_pre_switch_ind *)msg->param)->chan_i=
ndex;
+
+#ifdef CONFIG_AICWF_FULLMAC
+	list_for_each_entry(aicwf_vif, &aicwf_hw->vifs, list) {
+		if (aicwf_vif->up && aicwf_vif->ch_index =3D=3D chan_idx)
+			aicwf_txq_vif_stop(aicwf_vif, AICWF_TXQ_STOP_CHAN, aicwf_hw);
+	}
+#endif /* CONFIG_AICWF_FULLMAC */
+
+	return 0;
+}
+
+static inline int aicwf_rx_chan_switch_ind(struct aicwf_hw *aicwf_hw,
+					   struct aicwf_cmd *cmd,
+					   struct ipc_e2a_msg *msg)
+{
+	struct aicwf_vif *aicwf_vif;
+	int chan_idx =3D ((struct mm_channel_switch_ind *)msg->param)->chan_index=
;
+	bool roc =3D ((struct mm_channel_switch_ind *)msg->param)->roc;
+	bool roc_tdls =3D ((struct mm_channel_switch_ind *)msg->param)->roc_tdls;
+
+#ifdef CONFIG_AICWF_FULLMAC
+	if (roc_tdls) {
+		u8 vif_index =3D ((struct mm_channel_switch_ind *)msg->param)->vif_index=
;
+
+		list_for_each_entry(aicwf_vif, &aicwf_hw->vifs, list) {
+			if (aicwf_vif->vif_index =3D=3D vif_index) {
+				aicwf_vif->roc_tdls =3D true;
+				aicwf_txq_tdls_sta_start(aicwf_vif, AICWF_TXQ_STOP_CHAN, aicwf_hw);
+			}
+		}
+	} else if (!roc) {
+		list_for_each_entry(aicwf_vif, &aicwf_hw->vifs, list) {
+			if (aicwf_vif->up && aicwf_vif->ch_index =3D=3D chan_idx)
+				aicwf_txq_vif_start(aicwf_vif, AICWF_TXQ_STOP_CHAN, aicwf_hw);
+		}
+	} else {
+		/* Retrieve the allocated RoC element */
+		struct aicwf_roc_elem *roc_elem =3D aicwf_hw->roc_elem;
+		/* Get VIF on which RoC has been started */
+		// aicwf_vif =3D netdev_priv(roc_elem->wdev->netdev);
+
+		/* For debug purpose (use ftrace kernel option) */
+		// trace_switch_roc(aicwf_vif->vif_index);
+
+		if (roc_elem) {
+			/* If mgmt_roc is true, remain on channel has been started by
+			 * ourself
+			 */
+			if (!roc_elem->mgmt_roc) {
+				/* Inform the host that we have switch on the indicated
+				 * off-channel
+				 */
+				cfg80211_ready_on_channel(roc_elem->wdev,
+							  roc_elem->cookie,
+							  roc_elem->chan, roc_elem->duration,
+							  GFP_ATOMIC);
+			}
+
+			/* Keep in mind that we have switched on the channel */
+			roc_elem->on_chan =3D true;
+		} else {
+			dev_dbg(aicwf_hw->dev, "roc_elem =3D=3D null\n");
+		}
+		// Enable traffic on OFF channel queue
+		aicwf_txq_offchan_start(aicwf_hw);
+	}
+
+	tasklet_schedule(&aicwf_hw->task);
+
+	aicwf_hw->cur_chanctx =3D chan_idx;
+	aicwf_radar_detection_enable_on_cur_channel(aicwf_hw);
+
+#endif /* CONFIG_AICWF_FULLMAC */
+
+	return 0;
+}
+
+static inline int aicwf_rx_tdls_chan_switch_cfm(struct aicwf_hw *aicwf_hw,
+						struct aicwf_cmd *cmd,
+						struct ipc_e2a_msg *msg)
+{
+	return 0;
+}
+
+static inline int aicwf_rx_tdls_chan_switch_ind(struct aicwf_hw *aicwf_hw,
+						struct aicwf_cmd *cmd,
+						struct ipc_e2a_msg *msg)
+{
+#ifdef CONFIG_AICWF_FULLMAC
+	// Enable traffic on OFF channel queue
+	aicwf_txq_offchan_start(aicwf_hw);
+
+	return 0;
+#endif
+}
+
+static inline int aicwf_rx_tdls_chan_switch_base_ind(struct aicwf_hw *aicw=
f_hw,
+						     struct aicwf_cmd *cmd,
+						     struct ipc_e2a_msg *msg)
+{
+	struct aicwf_vif *aicwf_vif;
+	u8 vif_index =3D ((struct tdls_chan_switch_base_ind *)msg->param)->vif_in=
dex;
+
+#ifdef CONFIG_AICWF_FULLMAC
+	list_for_each_entry(aicwf_vif, &aicwf_hw->vifs, list) {
+		if (aicwf_vif->vif_index =3D=3D vif_index) {
+			aicwf_vif->roc_tdls =3D false;
+			aicwf_txq_tdls_sta_stop(aicwf_vif, AICWF_TXQ_STOP_CHAN, aicwf_hw);
+		}
+	}
+	return 0;
+#endif
+}
+
+static inline int aicwf_rx_tdls_peer_ps_ind(struct aicwf_hw *aicwf_hw,
+					    struct aicwf_cmd *cmd,
+					    struct ipc_e2a_msg *msg)
+{
+	struct aicwf_vif *aicwf_vif;
+	u8 vif_index =3D ((struct tdls_peer_ps_ind *)msg->param)->vif_index;
+	bool ps_on =3D ((struct tdls_peer_ps_ind *)msg->param)->ps_on;
+
+#ifdef CONFIG_AICWF_FULLMAC
+	list_for_each_entry(aicwf_vif, &aicwf_hw->vifs, list) {
+		if (aicwf_vif->vif_index =3D=3D vif_index) {
+			aicwf_vif->sta.tdls_sta->tdls.ps_on =3D ps_on;
+			// Update PS status for the TDLS station
+			aicwf_ps_bh_enable(aicwf_hw, aicwf_vif->sta.tdls_sta, ps_on);
+		}
+	}
+
+	return 0;
+#endif
+}
+
+static inline int aicwf_rx_remain_on_channel_exp_ind(struct aicwf_hw *aicw=
f_hw,
+						     struct aicwf_cmd *cmd,
+						     struct ipc_e2a_msg *msg)
+{
+#ifdef CONFIG_AICWF_FULLMAC
+	/* Retrieve the allocated RoC element */
+	struct aicwf_roc_elem *roc_elem =3D aicwf_hw->roc_elem;
+	/* Get VIF on which RoC has been started */
+	struct aicwf_vif *aicwf_vif;
+
+	if (!roc_elem)
+		return 0;
+
+	aicwf_vif =3D container_of(roc_elem->wdev, struct aicwf_vif, wdev);
+	/* For debug purpose (use ftrace kernel option) */
+#ifdef AIC8800_CREATE_TRACE_POINTS
+	trace_roc_exp(aicwf_vif->vif_index);
+#endif
+	/* If mgmt_roc is true, remain on channel has been started by ourself */
+	/* If RoC has been cancelled before we switched on channel, do not call
+	 * cfg80211
+	 */
+	if (!roc_elem->mgmt_roc && roc_elem->on_chan) {
+		/* Inform the host that off-channel period has expired */
+		cfg80211_remain_on_channel_expired(roc_elem->wdev,
+						   roc_elem->cookie,
+						   roc_elem->chan, GFP_ATOMIC);
+	}
+
+	/* De-init offchannel TX queue */
+	aicwf_txq_offchan_deinit(aicwf_vif);
+
+	/* Free the allocated RoC element */
+	kfree(roc_elem);
+	aicwf_hw->roc_elem =3D NULL;
+
+#endif /* CONFIG_AICWF_FULLMAC */
+	return 0;
+}
+
+static inline int aicwf_rx_p2p_vif_ps_change_ind(struct aicwf_hw *aicwf_hw=
,
+						 struct aicwf_cmd *cmd,
+						 struct ipc_e2a_msg *msg)
+{
+	int vif_idx =3D ((struct mm_p2p_vif_ps_change_ind *)msg->param)->vif_inde=
x;
+	int ps_state =3D ((struct mm_p2p_vif_ps_change_ind *)msg->param)->ps_stat=
e;
+	struct aicwf_vif *vif_entry;
+
+#ifdef CONFIG_AICWF_FULLMAC
+	vif_entry =3D aicwf_hw->vif_table[vif_idx];
+
+	if (vif_entry)
+		goto found_vif;
+#endif /* CONFIG_AICWF_FULLMAC */
+
+	goto exit;
+found_vif:
+
+#ifdef CONFIG_AICWF_FULLMAC
+	if (ps_state =3D=3D MM_PS_MODE_OFF) {
+		// Start TX queues for provided VIF
+		aicwf_txq_vif_start(vif_entry, AICWF_TXQ_STOP_VIF_PS, aicwf_hw);
+	} else {
+		// Stop TX queues for provided VIF
+		aicwf_txq_vif_stop(vif_entry, AICWF_TXQ_STOP_VIF_PS, aicwf_hw);
+	}
+#endif /* CONFIG_AICWF_FULLMAC */
+
+exit:
+	return 0;
+}
+
+static inline int aicwf_rx_channel_survey_ind(struct aicwf_hw *aicwf_hw,
+					      struct aicwf_cmd *cmd,
+					      struct ipc_e2a_msg *msg)
+{
+	struct mm_channel_survey_ind *ind =3D
+		(struct mm_channel_survey_ind *)msg->param;
+	// Get the channel index
+	int idx =3D aicwf_freq_to_idx(aicwf_hw, ind->freq);
+	// Get the survey
+	struct aicwf_survey_info *aicwf_survey;
+
+	if (idx > ARRAY_SIZE(aicwf_hw->survey))
+		return 0;
+
+	aicwf_survey =3D &aicwf_hw->survey[idx];
+
+	// Store the received parameters
+	aicwf_survey->chan_time_ms =3D ind->chan_time_ms;
+	aicwf_survey->chan_time_busy_ms =3D ind->chan_time_busy_ms;
+	aicwf_survey->noise_dbm =3D ind->noise_dbm;
+	aicwf_survey->filled =3D (SURVEY_INFO_TIME | SURVEY_INFO_TIME_BUSY);
+
+	if (ind->noise_dbm !=3D 0)
+		aicwf_survey->filled |=3D SURVEY_INFO_NOISE_DBM;
+
+	return 0;
+}
+
+static inline int aicwf_rx_p2p_noa_upd_ind(struct aicwf_hw *aicwf_hw,
+					   struct aicwf_cmd *cmd,
+					   struct ipc_e2a_msg *msg)
+{
+	return 0;
+}
+
+static inline int aicwf_rx_rssi_status_ind(struct aicwf_hw *aicwf_hw,
+					   struct aicwf_cmd *cmd,
+					   struct ipc_e2a_msg *msg)
+{
+	struct mm_rssi_status_ind *ind =3D (struct mm_rssi_status_ind *)msg->para=
m;
+	int vif_idx =3D ind->vif_index;
+	bool rssi_status =3D ind->rssi_status;
+
+	struct aicwf_vif *vif_entry;
+
+#ifdef CONFIG_AICWF_FULLMAC
+	vif_entry =3D aicwf_hw->vif_table[vif_idx];
+	if (vif_entry) {
+		cfg80211_cqm_rssi_notify(vif_entry->ndev,
+					 rssi_status ? NL80211_CQM_RSSI_THRESHOLD_EVENT_LOW
+					 : NL80211_CQM_RSSI_THRESHOLD_EVENT_HIGH,
+					 ind->rssi, GFP_ATOMIC);
+	}
+#endif /* CONFIG_AICWF_FULLMAC */
+
+	return 0;
+}
+
+static inline int aicwf_rx_pktloss_notify_ind(struct aicwf_hw *aicwf_hw,
+					      struct aicwf_cmd *cmd,
+					      struct ipc_e2a_msg *msg)
+{
+#ifdef CONFIG_AICWF_FULLMAC
+	struct mm_pktloss_ind *ind =3D (struct mm_pktloss_ind *)msg->param;
+	struct aicwf_vif *vif_entry;
+	int vif_idx =3D ind->vif_index;
+
+	vif_entry =3D aicwf_hw->vif_table[vif_idx];
+	if (vif_entry) {
+		cfg80211_cqm_pktloss_notify(vif_entry->ndev,
+					    (const u8 *)ind->mac_addr.array,
+					    ind->num_packets, GFP_ATOMIC);
+	}
+#endif /* CONFIG_AICWF_FULLMAC */
+
+	return 0;
+}
+
+static inline int aicwf_apm_staloss_ind(struct aicwf_hw *aicwf_hw,
+					struct aicwf_cmd *cmd,
+					struct ipc_e2a_msg *msg)
+{
+	struct mm_apm_staloss_ind *ind =3D (struct mm_apm_staloss_ind *)msg->para=
m;
+
+	memcpy(aicwf_hw->sta_mac_addr, ind->mac_addr, 6);
+	aicwf_hw->apm_vif_idx =3D ind->vif_idx;
+
+	queue_work(aicwf_hw->apm_staloss_wq, &aicwf_hw->apm_staloss_work);
+
+	return 0;
+}
+
+static struct sk_buff *arp_80211_to_8023(struct sk_buff *skb, u8 hdrlen)
+{
+	struct ethhdr *eth;
+	size_t payload_len;
+	struct sk_buff *new_skb =3D NULL;
+	char *llc;
+	u8 da[MAC_ADDR_LEN] =3D {0};
+	u8 sa[MAC_ADDR_LEN] =3D {0};
+
+	if (skb->len <=3D hdrlen) {
+		pr_err("skb_len err1\n");
+		return NULL;
+	}
+
+	memcpy(da, &skb->data[4], 6);
+	memcpy(sa, &skb->data[16], 6);
+
+	skb_pull(skb, hdrlen);
+	llc =3D skb->data;
+	if (llc[0] =3D=3D 0xAA && llc[1] =3D=3D 0xAA && llc[2] =3D=3D 0x03) {
+		if (skb->len < 8) {
+			pr_err("skb_len err2\n");
+			return NULL;
+		}
+		skb_pull(skb, 8);
+	}
+	payload_len =3D skb->len;
+
+	new_skb =3D __dev_alloc_skb(ETH_HLEN + payload_len, GFP_ATOMIC);
+	if (!new_skb)
+		return NULL;
+
+	skb_reserve(new_skb, ETH_HLEN);
+	skb_put(new_skb, payload_len);
+	memcpy(new_skb->data, skb->data, payload_len);
+
+	eth =3D (struct ethhdr *)skb_push(new_skb, ETH_HLEN);
+
+	memcpy(eth->h_dest, da, ETH_ALEN);
+	memcpy(eth->h_source, sa, ETH_ALEN);
+
+	eth->h_proto =3D htons(ETH_P_ARP);
+
+	new_skb->protocol =3D eth->h_proto;
+	new_skb->dev =3D skb->dev;
+
+	return new_skb;
+}
+
+static inline int aicwf_arp_announcement_ind(struct aicwf_hw *aicwf_hw,
+					     struct aicwf_cmd *cmd,
+					     struct ipc_e2a_msg *msg)
+{
+	struct aicwf_vif *vif;
+	struct sk_buff *skb =3D NULL;
+	struct sk_buff *new_skb =3D NULL;
+	struct hw_rxhdr rxhdr;
+	int hdrlen =3D 24;
+	struct rxu_arp_announcement_ind *ind =3D (struct rxu_arp_announcement_ind=
 *)msg->param;
+
+	// ind->vif_index, ind->length, ind->offset);
+
+	dev_dbg(aicwf_hw->dev, "vif: %d, length: %d, offset: %d\n",
+		ind->vif_index, ind->length, ind->offset);
+
+	vif =3D aicwf_hw->vif_table[ind->vif_index];
+	rxhdr.flags_is_amsdu =3D false;
+	rxhdr.flags_dst_idx =3D 0xff;
+
+	if (ind->payload[0] & 0x80)
+		hdrlen +=3D 2;
+
+	switch ((ind->rx_status >> 2) & 0x7) {
+	case AICWF_RX_HD_DECR_CCMP128:
+		hdrlen +=3D 8;
+		break;
+	case AICWF_RX_HD_DECR_TKIP:
+		hdrlen +=3D 8;
+		break;
+	case AICWF_RX_HD_DECR_WEP:
+		hdrlen +=3D 4;
+		break;
+	case AICWF_RX_HD_DECR_WAPI:
+		hdrlen +=3D 18;
+		break;
+	default:
+		break;
+	}
+
+	skb =3D __dev_alloc_skb(ind->length, GFP_ATOMIC);
+	if (!skb)
+		return -1;
+	skb_put(skb, ind->length);
+	memcpy(skb->data, ind->payload, ind->length);
+	skb->dev =3D vif->ndev;
+
+	new_skb =3D arp_80211_to_8023(skb, hdrlen);
+	if (!new_skb) {
+		dev_err(aicwf_hw->dev, "arp_80211_to_8023 fail\n");
+		dev_kfree_skb(skb);
+		return -1;
+	}
+	if (!aicwf_rx_data_skb(aicwf_hw, vif, new_skb, &rxhdr)) {
+		dev_err(aicwf_hw->dev, "aicwf_rx_data_skb fail\n");
+		dev_kfree_skb(new_skb);
+		dev_kfree_skb(skb);
+		return -1;
+	}
+
+	dev_kfree_skb(skb);
+	return 0;
+}
+
+static inline int aicwf_rx_csa_counter_ind(struct aicwf_hw *aicwf_hw,
+					   struct aicwf_cmd *cmd,
+					   struct ipc_e2a_msg *msg)
+{
+	struct mm_csa_counter_ind *ind =3D (struct mm_csa_counter_ind *)msg->para=
m;
+	struct aicwf_vif *vif;
+	bool found =3D false;
+
+	// Look for VIF entry
+	list_for_each_entry(vif, &aicwf_hw->vifs, list) {
+		if (vif->vif_index =3D=3D ind->vif_index) {
+			found =3D true;
+			break;
+		}
+	}
+
+	if (found) {
+#ifdef CONFIG_AICWF_FULLMAC
+		if (vif->ap.csa)
+			vif->ap.csa->count =3D ind->csa_count;
+		else
+			netdev_err(vif->ndev, "csa counter update but no active csa\n");
+
+#endif
+	}
+
+	return 0;
+}
+
+#ifdef CONFIG_AICWF_FULLMAC
+static inline int aicwf_rx_csa_finish_ind(struct aicwf_hw *aicwf_hw,
+					  struct aicwf_cmd *cmd,
+					  struct ipc_e2a_msg *msg)
+{
+	struct mm_csa_finish_ind *ind =3D (struct mm_csa_finish_ind *)msg->param;
+	struct aicwf_vif *vif;
+	bool found =3D false;
+
+	// Look for VIF entry
+	list_for_each_entry(vif, &aicwf_hw->vifs, list) {
+		if (vif->vif_index =3D=3D ind->vif_index) {
+			found =3D true;
+			break;
+		}
+	}
+
+	if (found) {
+		if (AICWF_VIF_TYPE(vif) =3D=3D NL80211_IFTYPE_AP ||
+		    AICWF_VIF_TYPE(vif) =3D=3D NL80211_IFTYPE_P2P_GO) {
+			if (vif->ap.csa) {
+				vif->ap.csa->status =3D ind->status;
+				vif->ap.csa->ch_idx =3D ind->chan_idx;
+				schedule_work(&vif->ap.csa->work);
+			} else {
+				netdev_err(vif->ndev,
+					   "csa finish indication but no active csa\n");
+			}
+		} else {
+			if (ind->status =3D=3D 0) {
+				aicwf_chanctx_unlink(vif);
+				aicwf_chanctx_link(vif, ind->chan_idx, NULL);
+				if (aicwf_hw->cur_chanctx =3D=3D ind->chan_idx) {
+					aicwf_radar_detection_enable_on_cur_channel(aicwf_hw);
+					aicwf_txq_vif_start(vif, AICWF_TXQ_STOP_CHAN, aicwf_hw);
+				} else {
+					aicwf_txq_vif_stop(vif, AICWF_TXQ_STOP_CHAN, aicwf_hw);
+				}
+			}
+		}
+	}
+
+	return 0;
+}
+
+static inline int aicwf_rx_csa_traffic_ind(struct aicwf_hw *aicwf_hw,
+					   struct aicwf_cmd *cmd,
+					   struct ipc_e2a_msg *msg)
+{
+	struct mm_csa_traffic_ind *ind =3D (struct mm_csa_traffic_ind *)msg->para=
m;
+	struct aicwf_vif *vif;
+	bool found =3D false;
+
+	// Look for VIF entry
+	list_for_each_entry(vif, &aicwf_hw->vifs, list) {
+		if (vif->vif_index =3D=3D ind->vif_index) {
+			found =3D true;
+			break;
+		}
+	}
+
+	if (found) {
+		if (ind->enable)
+			aicwf_txq_vif_start(vif, AICWF_TXQ_STOP_CSA, aicwf_hw);
+		else
+			aicwf_txq_vif_stop(vif, AICWF_TXQ_STOP_CSA, aicwf_hw);
+	}
+
+	return 0;
+}
+
+static inline int aicwf_rx_ps_change_ind(struct aicwf_hw *aicwf_hw,
+					 struct aicwf_cmd *cmd,
+					 struct ipc_e2a_msg *msg)
+{
+	struct mm_ps_change_ind *ind =3D (struct mm_ps_change_ind *)msg->param;
+	struct aicwf_sta *sta =3D &aicwf_hw->sta_table[ind->sta_idx];
+
+	if (ind->sta_idx >=3D (NX_REMOTE_STA_MAX + NX_VIRT_DEV_MAX)) {
+		wiphy_err(aicwf_hw->wiphy, "Invalid sta index reported by fw %d\n",
+			  ind->sta_idx);
+		return 1;
+	}
+
+	netdev_dbg(aicwf_hw->vif_table[sta->vif_idx]->ndev,
+		   "sta %d, change ps mode to %s\n", sta->sta_idx,
+		   ind->ps_state ? "on" : "off");
+
+	if (sta->valid) {
+		aicwf_ps_bh_enable(aicwf_hw, sta, ind->ps_state);
+	} else if (aicwf_hw->adding_sta) {
+		sta->ps.active =3D ind->ps_state ? true : false;
+	} else {
+		if (aicwf_hw->vif_table[sta->vif_idx] &&
+		    aicwf_hw->vif_table[sta->vif_idx]->ndev)
+			netdev_err(aicwf_hw->vif_table[sta->vif_idx]->ndev,
+				   "ignore ps mode change on invalid sta\n");
+	}
+
+	return 0;
+}
+
+static inline int aicwf_rx_traffic_req_ind(struct aicwf_hw *aicwf_hw,
+					   struct aicwf_cmd *cmd,
+					   struct ipc_e2a_msg *msg)
+{
+	struct mm_traffic_req_ind *ind =3D (struct mm_traffic_req_ind *)msg->para=
m;
+	struct aicwf_sta *sta =3D &aicwf_hw->sta_table[ind->sta_idx];
+
+	netdev_dbg(aicwf_hw->vif_table[sta->vif_idx]->ndev,
+		   "sta %d asked for %d pkt\n", sta->sta_idx, ind->pkt_cnt);
+
+	aicwf_ps_bh_traffic_req(aicwf_hw, sta, ind->pkt_cnt,
+				ind->uapsd ? UAPSD_ID : LEGACY_PS_ID);
+
+	return 0;
+}
+#endif /* CONFIG_AICWF_FULLMAC */
+
+/*************************************************************************=
**
+ * Messages from SCANU task
+ *************************************************************************=
*/
+#ifdef CONFIG_AICWF_FULLMAC
+
+static inline int aicwf_rx_scanu_start_cfm(struct aicwf_hw *aicwf_hw,
+					   struct aicwf_cmd *cmd,
+					   struct ipc_e2a_msg *msg)
+{
+	aicwf_scan_complete(aicwf_hw, NULL, false);
+
+	return 0;
+}
+
+static inline int aicwf_rx_scanu_result_ind(struct aicwf_hw *aicwf_hw,
+					    struct aicwf_cmd *cmd,
+					    struct ipc_e2a_msg *msg)
+{
+	struct cfg80211_bss *bss =3D NULL;
+	struct ieee80211_channel *chan;
+	struct scanu_result_ind *ind =3D (struct scanu_result_ind *)msg->param;
+	struct ieee80211_mgmt *mgmt =3D (struct ieee80211_mgmt *)ind->payload;
+	u64 tsf;
+
+	chan =3D ieee80211_get_channel(aicwf_hw->wiphy, ind->center_freq);
+
+	if (chan) {
+		struct timespec64 ts;
+
+		ts =3D ktime_to_timespec64(ktime_get_boottime());
+		tsf =3D (u64)ts.tv_sec * 1000000 + div_u64(ts.tv_nsec, 1000);
+		mgmt->u.probe_resp.timestamp =3D cpu_to_le64(tsf);
+
+		bss =3D
+		cfg80211_inform_bss_frame(aicwf_hw->wiphy, chan,
+					  (struct ieee80211_mgmt *)ind->payload,
+					  ind->length, ind->rssi * 100, GFP_ATOMIC);
+	}
+	if (bss)
+		cfg80211_put_bss(aicwf_hw->wiphy, bss);
+	return 0;
+}
+#endif /* CONFIG_AICWF_FULLMAC */
+
+/*************************************************************************=
**
+ * Messages from ME task
+ *************************************************************************=
*/
+#ifdef CONFIG_AICWF_FULLMAC
+static inline int aicwf_rx_me_tkip_mic_failure_ind(struct aicwf_hw *aicwf_=
hw,
+						   struct aicwf_cmd *cmd,
+						   struct ipc_e2a_msg *msg)
+{
+	struct me_tkip_mic_failure_ind *ind =3D
+		(struct me_tkip_mic_failure_ind *)msg->param;
+	struct aicwf_vif *aicwf_vif =3D aicwf_hw->vif_table[ind->vif_idx];
+	struct net_device *dev =3D aicwf_vif->ndev;
+
+	cfg80211_michael_mic_failure(dev, (u8 *)&ind->addr,
+				     (ind->ga ? NL80211_KEYTYPE_GROUP : NL80211_KEYTYPE_PAIRWISE),
+				     ind->keyid, (u8 *)&ind->tsc, GFP_ATOMIC);
+
+	return 0;
+}
+
+static inline int aicwf_rx_me_tx_credits_update_ind(struct aicwf_hw *aicwf=
_hw,
+						    struct aicwf_cmd *cmd,
+						    struct ipc_e2a_msg *msg)
+{
+	struct me_tx_credits_update_ind *ind =3D
+		(struct me_tx_credits_update_ind *)msg->param;
+
+	aicwf_txq_credit_update(aicwf_hw, ind->sta_idx, ind->tid, ind->credits);
+
+	return 0;
+}
+#endif /* CONFIG_AICWF_FULLMAC */
+
+/*************************************************************************=
**
+ * Messages from SM task
+ *************************************************************************=
*/
+#ifdef CONFIG_AICWF_FULLMAC
+static inline int aicwf_rx_sm_connect_ind(struct aicwf_hw *aicwf_hw,
+					  struct aicwf_cmd *cmd,
+					  struct ipc_e2a_msg *msg)
+{
+	struct sm_connect_ind *ind =3D (struct sm_connect_ind *)msg->param;
+	struct aicwf_vif *aicwf_vif =3D aicwf_hw->vif_table[ind->vif_idx];
+	struct net_device *dev =3D aicwf_vif->ndev;
+	const u8 *req_ie, *rsp_ie;
+	const struct element *extcap;
+	struct ieee80211_channel *chan;
+	const u8 *ht_ie =3D NULL;
+	const u8 *vht_ie =3D NULL;
+
+	/* Retrieve IE addresses and lengths */
+	req_ie =3D (const u8 *)ind->assoc_ie_buf;
+	rsp_ie =3D req_ie + ind->assoc_req_ie_len;
+
+	// Fill-in the AP information
+	dev_dbg(aicwf_hw->dev, "ind->status_code:%d\n",
+		ind->status_code);
+
+	if (ind->status_code =3D=3D 0) {
+		struct aicwf_sta *sta =3D &aicwf_hw->sta_table[ind->ap_idx];
+		u8 txq_status;
+		struct cfg80211_chan_def chandef;
+
+		sta->valid =3D true;
+		sta->sta_idx =3D ind->ap_idx;
+		sta->ch_idx =3D ind->ch_idx;
+		sta->vif_idx =3D ind->vif_idx;
+		sta->vlan_idx =3D sta->vif_idx;
+		sta->qos =3D ind->qos;
+		sta->acm =3D ind->acm;
+		sta->ps.active =3D false;
+		sta->aid =3D ind->aid;
+		sta->band =3D ind->band;                 // ind->chan.band;
+		sta->width =3D ind->width;               // ind->chan.type;
+		sta->center_freq =3D ind->center_freq;   // ind->chan.prim20_freq;
+		sta->center_freq1 =3D ind->center_freq1; // ind->chan.center1_freq;
+		sta->center_freq2 =3D ind->center_freq2; // ind->chan.center2_freq;
+		aicwf_vif->sta.ap =3D sta;
+		// ind->chan.prim20_freq);
+		chan =3D ieee80211_get_channel(aicwf_hw->wiphy, ind->center_freq);
+		cfg80211_chandef_create(&chandef, chan, NL80211_CHAN_NO_HT);
+		if (!aicwf_hw->mod_params->ht_on)
+			chandef.width =3D NL80211_CHAN_WIDTH_20_NOHT;
+		else
+			chandef.width =3D chnl2bw[ind->width];  //[ind->chan.type];
+		chandef.center_freq1 =3D ind->center_freq1; // ind->chan.center1_freq;
+		chandef.center_freq2 =3D ind->center_freq2; // ind->chan.center2_freq;
+		aicwf_chanctx_link(aicwf_vif, ind->ch_idx, &chandef);
+		memcpy(sta->mac_addr, ind->bssid.array, ETH_ALEN);
+		if (ind->ch_idx =3D=3D aicwf_hw->cur_chanctx)
+			txq_status =3D 0;
+		else
+			txq_status =3D AICWF_TXQ_STOP_CHAN;
+		memcpy(sta->ac_param, ind->ac_param, sizeof(sta->ac_param));
+		aicwf_txq_sta_init(aicwf_hw, sta, txq_status);
+		aicwf_txq_tdls_vif_init(aicwf_vif);
+		aicwf_mu_group_sta_init(sta, NULL);
+		/* Look for TDLS Channel Switch Prohibited flag in the Extended
+		 * Capability Information Element
+		 */
+		extcap =3D cfg80211_find_elem(WLAN_EID_EXT_CAPABILITY, rsp_ie,
+					    ind->assoc_rsp_ie_len);
+		if (extcap && extcap->datalen >=3D 5) {
+			aicwf_vif->tdls_chsw_prohibited =3D
+				extcap->data[4] & WLAN_EXT_CAPA5_TDLS_CH_SW_PROHIBITED;
+		}
+
+		if (aicwf_vif->wep_enabled)
+			aicwf_vif->wep_auth_err =3D false;
+
+#ifdef CONFIG_AICWF_BFMER
+		/* If Beamformer feature is activated, check if features can be used
+		 * with the new peer device
+		 */
+		if (aicwf_hw->mod_params->bfmer) {
+			const u8 *vht_capa_ie;
+			const struct ieee80211_vht_cap *vht_cap;
+
+			do {
+				/* Look for VHT Capability Information Element */
+				vht_capa_ie =3D cfg80211_find_ie(WLAN_EID_VHT_CAPABILITY, rsp_ie,
+							       ind->assoc_rsp_ie_len);
+
+				/* Stop here if peer device does not support VHT */
+				if (!vht_capa_ie)
+					break;
+
+				vht_cap =3D (const struct ieee80211_vht_cap *)(vht_capa_ie + 2);
+
+				/* Send MM_BFMER_ENABLE_REQ message if needed */
+				aicwf_send_bfmer_enable(aicwf_hw, sta, vht_cap);
+			} while (0);
+		}
+#endif //(CONFIG_AICWF_BFMER)
+
+		ht_ie =3D cfg80211_find_ie(WLAN_EID_HT_CAPABILITY, rsp_ie,
+					 ind->assoc_rsp_ie_len);
+		if (ht_ie)
+			aicwf_vif->sta.ap->ht =3D true;
+		vht_ie =3D cfg80211_find_ie(WLAN_EID_VHT_CAPABILITY, rsp_ie,
+					  ind->assoc_rsp_ie_len);
+		if (vht_ie)
+			aicwf_vif->sta.ap->vht =3D true;
+
+#ifdef CONFIG_AICWF_MON_DATA
+		// If there are 1 sta and 1 monitor interface active at the same time
+		// then monitor interface channel context is always the same as the STA
+		// interface. This doesn't work with 2 STA interfaces but we don't want
+		// to support it.
+		if (aicwf_hw->monitor_vif !=3D AICWF_INVALID_VIF) {
+			struct aicwf_vif *aicwf_mon_vif =3D
+				aicwf_hw->vif_table[aicwf_hw->monitor_vif];
+			aicwf_chanctx_unlink(aicwf_mon_vif);
+			aicwf_chanctx_link(aicwf_mon_vif, ind->ch_idx, NULL);
+		}
+#endif
+		// atomic_set(&aicwf_vif->drv_conn_state,
+		// (int)AICWF_DRV_STATUS_CONNECTED);
+	} else if (ind->status_code =3D=3D WLAN_STATUS_NOT_SUPPORTED_AUTH_ALG) {
+		if (aicwf_vif->wep_enabled) {
+			aicwf_vif->wep_auth_err =3D true;
+			dev_dbg(aicwf_hw->dev, "con ind wep_auth_err %d\n",
+				aicwf_vif->wep_auth_err);
+		}
+		aicwf_set_conn_state(&aicwf_vif->drv_conn_state, (int)AICWF_DRV_STATUS_D=
ISCONNECTED);
+	} else {
+		aicwf_set_conn_state(&aicwf_vif->drv_conn_state, (int)AICWF_DRV_STATUS_D=
ISCONNECTED);
+	}
+
+	dev_dbg(aicwf_hw->dev, "ind->roamed:%d ind->status_code:%d aicwf_vif->drv=
_conn_state:%d\n",
+		ind->roamed, ind->status_code,
+		(int)atomic_read(&aicwf_vif->drv_conn_state));
+
+	if (ind->status_code =3D=3D 0 &&
+	    (int)atomic_read(&aicwf_vif->drv_conn_state) =3D=3D AICWF_DRV_STATUS_=
DISCONNECTING) {
+		dev_dbg(aicwf_hw->dev, "the disconnection has been requested, return it\=
n");
+		goto exit;
+	}
+
+	if (!ind->roamed) { // not roaming
+		cfg80211_connect_result(dev, (const u8 *)ind->bssid.array,
+					req_ie, ind->assoc_req_ie_len,
+					rsp_ie, ind->assoc_rsp_ie_len, ind->status_code,
+					GFP_ATOMIC);
+		if (ind->status_code =3D=3D 0) {
+			aicwf_set_conn_state(&aicwf_vif->drv_conn_state,
+					     (int)AICWF_DRV_STATUS_CONNECTED);
+			dev_dbg(aicwf_hw->dev,
+				"cfg80211_connect_result pass, aicwf_vif->drv_conn_state:%d\n",
+				(int)atomic_read(&aicwf_vif->drv_conn_state));
+			aicwf_vif->sta.link_time =3D jiffies;
+		} else {
+			aicwf_set_conn_state(&aicwf_vif->drv_conn_state,
+					     (int)AICWF_DRV_STATUS_DISCONNECTED);
+			aicwf_external_auth_disable(aicwf_vif);
+		}
+	} else { // roaming
+		if (ind->status_code !=3D 0) {
+			dev_dbg(aicwf_hw->dev, "roaming fail to notify disconnect\n");
+			cfg80211_disconnected(dev, 0, NULL, 0, 1, GFP_ATOMIC);
+			aicwf_set_conn_state(&aicwf_vif->drv_conn_state,
+					     (int)AICWF_DRV_STATUS_DISCONNECTED);
+			aicwf_external_auth_disable(aicwf_vif);
+		} else {
+			struct cfg80211_roam_info info;
+
+			memset(&info, 0, sizeof(info));
+			if (aicwf_vif->ch_index < NX_CHAN_CTXT_CNT)
+				info.links[0].channel =3D
+					aicwf_hw->chanctx_table[aicwf_vif->ch_index].chan_def.chan;
+			info.links[0].bssid =3D (const u8 *)ind->bssid.array;
+			info.req_ie =3D req_ie;
+			info.req_ie_len =3D ind->assoc_req_ie_len;
+			info.resp_ie =3D rsp_ie;
+			info.resp_ie_len =3D ind->assoc_rsp_ie_len;
+			cfg80211_roamed(dev, &info, GFP_ATOMIC);
+			aicwf_vif->sta.link_time =3D jiffies;
+
+			aicwf_set_conn_state(&aicwf_vif->drv_conn_state,
+					     (int)AICWF_DRV_STATUS_CONNECTED);
+			aicwf_vif->sta.link_time =3D jiffies;
+		}
+		aicwf_vif->sta.is_roam =3D false;
+	}
+
+	if (ind->status_code =3D=3D 0) {
+		netif_tx_start_all_queues(dev);
+		netif_carrier_on(dev);
+	}
+
+exit:
+	aicwf_vif->sta.is_roam =3D false;
+	return 0;
+}
+
+void aicwf_cfg80211_unlink_bss(struct aicwf_hw *aicwf_hw,
+			       struct aicwf_vif *aicwf_vif)
+{
+	struct wiphy *wiphy =3D aicwf_hw->wiphy;
+	struct cfg80211_bss *bss =3D NULL;
+
+	bss =3D cfg80211_get_bss(wiphy, NULL /*notify_channel */, aicwf_vif->sta.=
bssid,
+			       aicwf_vif->sta.ssid, aicwf_vif->sta.ssid_len,
+			       IEEE80211_BSS_TYPE_ESS,
+			       IEEE80211_PRIVACY(true)); // temp set true
+	if (bss) {
+		cfg80211_unlink_bss(wiphy, bss);
+		dev_dbg(aicwf_hw->dev, "cfg80211_unlink %*pE\n",
+			aicwf_vif->sta.ssid_len, aicwf_vif->sta.ssid);
+		cfg80211_put_bss(wiphy, bss);
+	} else {
+		dev_dbg(aicwf_hw->dev, "cfg80211_unlink error %*pE\n",
+			aicwf_vif->sta.ssid_len, aicwf_vif->sta.ssid);
+	}
+}
+
+static inline int aicwf_rx_sm_disconnect_ind(struct aicwf_hw *aicwf_hw,
+					     struct aicwf_cmd *cmd,
+					     struct ipc_e2a_msg *msg)
+{
+	struct sm_disconnect_ind *ind =3D (struct sm_disconnect_ind *)msg->param;
+	struct aicwf_vif *aicwf_vif =3D aicwf_hw->vif_table[ind->vif_idx];
+	struct net_device *dev;
+#ifdef CONFIG_AIC8800_RX_REORDER
+	struct reord_ctrl_info *reord_info, *tmp;
+	u8 *macaddr;
+	struct aicwf_rx_priv *rx_priv;
+#endif
+
+	dev_dbg(aicwf_hw->dev, "reason code:%d\n", ind->reason_code);
+
+	if (!aicwf_vif)
+		return 0;
+
+	if ((int)atomic_read(&aicwf_vif->drv_conn_state) =3D=3D
+		(int)AICWF_DRV_STATUS_DISCONNECTED) {
+		dev_dbg(aicwf_hw->dev, "is already disconnected, drop disconnect ind");
+		return 0;
+	}
+
+	dev =3D aicwf_vif->ndev;
+
+	if (!aicwf_vif->sta.is_roam)
+		aicwf_cfg80211_unlink_bss(aicwf_hw, aicwf_vif);
+	else
+		dev_dbg(aicwf_hw->dev, "roaming no aicwf_cfg80211_unlink_bss\n");
+	if (aicwf_vif->wdev.iftype =3D=3D NL80211_IFTYPE_P2P_CLIENT)
+		aicwf_hw->is_p2p_connected =3D 0;
+	/* if vif is not up, aicwf_close has already been called */
+	if (aicwf_vif->up) {
+		if (!ind->ft_over_ds && !ind->reassoc) {
+			cfg80211_disconnected(dev, ind->reason_code, NULL, 0,
+					      (ind->reason_code < 1), GFP_ATOMIC);
+		}
+		netif_tx_stop_all_queues(dev);
+		netif_carrier_off(dev);
+	}
+
+#ifdef CONFIG_AICWF_BFMER
+	/* Disable Beamformer if supported */
+	aicwf_bfmer_report_del(aicwf_hw, aicwf_vif->sta.ap);
+#endif //(CONFIG_AICWF_BFMER)
+
+#ifdef CONFIG_AIC8800_RX_REORDER
+	rx_priv =3D aicwf_hw->sdiodev->rx_priv;
+	if (aicwf_vif->wdev.iftype =3D=3D NL80211_IFTYPE_STATION ||
+	    aicwf_vif->wdev.iftype =3D=3D NL80211_IFTYPE_P2P_CLIENT) {
+		macaddr =3D (u8 *)aicwf_vif->ndev->dev_addr;
+		dev_dbg(aicwf_hw->dev, "deinit:macaddr:%x,%x,%x,%x,%x,%x\n", macaddr[0],=
 macaddr[1],
+			macaddr[2], macaddr[3], macaddr[4], macaddr[5]);
+
+		// spin_lock_bh(&rx_priv->stas_reord_lock);
+		list_for_each_entry_safe(reord_info, tmp, &rx_priv->stas_reord_list,
+					 list) {
+			macaddr =3D (u8 *)aicwf_vif->ndev->dev_addr;
+			dev_dbg(aicwf_hw->dev, "reord_mac:%x,%x,%x,%x,%x,%x\n",
+				reord_info->mac_addr[0], reord_info->mac_addr[1],
+				reord_info->mac_addr[2], reord_info->mac_addr[3],
+				reord_info->mac_addr[4], reord_info->mac_addr[5]);
+			if (!memcmp(reord_info->mac_addr, macaddr, 6)) {
+				reord_deinit_sta(rx_priv, reord_info);
+				break;
+			}
+		}
+		// spin_unlock_bh(&rx_priv->stas_reord_lock);
+	} else if (aicwf_vif->wdev.iftype =3D=3D NL80211_IFTYPE_AP ||
+		   aicwf_vif->wdev.iftype =3D=3D NL80211_IFTYPE_P2P_GO) {
+		// WARN_ON_ONCE(); // should be not here: del_sta function
+	}
+#endif
+
+	aicwf_txq_sta_deinit(aicwf_hw, aicwf_vif->sta.ap);
+	aicwf_txq_tdls_vif_deinit(aicwf_vif);
+	aicwf_vif->sta.ap->valid =3D false;
+	aicwf_vif->sta.ap =3D NULL;
+	aicwf_external_auth_disable(aicwf_vif);
+	aicwf_chanctx_unlink(aicwf_vif);
+
+	if (!aicwf_vif->sta.is_roam)
+		aicwf_set_conn_state(&aicwf_vif->drv_conn_state, (int)AICWF_DRV_STATUS_D=
ISCONNECTED);
+
+	return 0;
+}
+
+static inline int aicwf_rx_sm_external_auth_required_ind(struct aicwf_hw *=
aicwf_hw,
+							 struct aicwf_cmd *cmd,
+							 struct ipc_e2a_msg *msg)
+{
+	struct sm_external_auth_required_ind *ind =3D
+		(struct sm_external_auth_required_ind *)msg->param;
+	struct aicwf_vif *aicwf_vif =3D aicwf_hw->vif_table[ind->vif_idx];
+	struct net_device *dev =3D aicwf_vif->ndev;
+	struct cfg80211_external_auth_params params;
+	int ret =3D 0;
+	struct wireless_dev *wdev =3D dev->ieee80211_ptr;
+	int retry_counter =3D 10;
+
+	params.action =3D NL80211_EXTERNAL_AUTH_START;
+	memcpy(params.bssid, ind->bssid.array, ETH_ALEN);
+	params.ssid.ssid_len =3D ind->ssid.length;
+	memcpy(params.ssid.ssid, ind->ssid.array,
+	       min_t(size_t, ind->ssid.length, sizeof(params.ssid.ssid)));
+	params.key_mgmt_suite =3D ind->akm;
+
+	while (wdev->conn_owner_nlportid =3D=3D 0) {
+		dev_dbg(aicwf_hw->dev, "conn_owner_nlportid is 0, sleep 100ms\n");
+		msleep(100);
+		retry_counter--;
+		if (retry_counter =3D=3D 0)
+			break;
+	}
+	dev_dbg(aicwf_hw->dev, "wdev->conn_owner_nlportid:%d\n",
+		(int)wdev->conn_owner_nlportid);
+	ret =3D cfg80211_external_auth_request(dev, &params, GFP_ATOMIC);
+	if (ind->vif_idx > NX_VIRT_DEV_MAX || !aicwf_vif->up ||
+	    AICWF_VIF_TYPE(aicwf_vif) !=3D NL80211_IFTYPE_STATION ||
+	    ret) {
+		wiphy_err(aicwf_hw->wiphy,
+			  "Failed to start external auth on vif %d, aicwf_vif->up %d, iftype:%d=
, ret %d",
+			  ind->vif_idx, aicwf_vif->up, AICWF_VIF_TYPE(aicwf_vif), ret);
+		aicwf_send_sm_external_auth_required_rsp(aicwf_hw, aicwf_vif,
+							 WLAN_STATUS_UNSPECIFIED_FAILURE);
+		return 0;
+	}
+
+	aicwf_external_auth_enable(aicwf_vif);
+	return 0;
+}
+
+static inline int aicwf_rx_mesh_path_create_cfm(struct aicwf_hw *aicwf_hw,
+						struct aicwf_cmd *cmd,
+						struct ipc_e2a_msg *msg)
+{
+	struct mesh_path_create_cfm *cfm =3D
+		(struct mesh_path_create_cfm *)msg->param;
+	struct aicwf_vif *aicwf_vif =3D aicwf_hw->vif_table[cfm->vif_idx];
+
+	/* Check we well have a Mesh Point Interface */
+	if (aicwf_vif && AICWF_VIF_TYPE(aicwf_vif) =3D=3D NL80211_IFTYPE_MESH_POI=
NT)
+		aicwf_vif->ap.create_path =3D false;
+
+	return 0;
+}
+
+static inline int aicwf_rx_mesh_peer_update_ind(struct aicwf_hw *aicwf_hw,
+						struct aicwf_cmd *cmd,
+						struct ipc_e2a_msg *msg)
+{
+	struct mesh_peer_update_ind *ind =3D
+		(struct mesh_peer_update_ind *)msg->param;
+	struct aicwf_vif *aicwf_vif =3D aicwf_hw->vif_table[ind->vif_idx];
+	struct aicwf_sta *aicwf_sta =3D &aicwf_hw->sta_table[ind->sta_idx];
+
+	if (ind->vif_idx >=3D (NX_VIRT_DEV_MAX + NX_REMOTE_STA_MAX) ||
+	    (aicwf_vif && AICWF_VIF_TYPE(aicwf_vif) !=3D NL80211_IFTYPE_MESH_POIN=
T) ||
+	    ind->sta_idx >=3D NX_REMOTE_STA_MAX)
+		return 1;
+
+	/* Check we well have a Mesh Point Interface */
+	if (!aicwf_vif->user_mpm) {
+		/* Check if peer link has been established or lost */
+		if (ind->estab) {
+			if (!aicwf_sta->valid) {
+				u8 txq_status;
+
+				aicwf_sta->valid =3D true;
+				aicwf_sta->sta_idx =3D ind->sta_idx;
+				aicwf_sta->ch_idx =3D aicwf_vif->ch_index;
+				aicwf_sta->vif_idx =3D ind->vif_idx;
+				aicwf_sta->vlan_idx =3D aicwf_sta->vif_idx;
+				aicwf_sta->ps.active =3D false;
+				aicwf_sta->qos =3D true;
+				aicwf_sta->aid =3D ind->sta_idx + 1;
+				// aicwf_sta->acm =3D ind->acm;
+				memcpy(aicwf_sta->mac_addr, ind->peer_addr.array, ETH_ALEN);
+
+				aicwf_chanctx_link(aicwf_vif, aicwf_sta->ch_idx, NULL);
+
+				/* Add the station in the list of VIF's stations */
+				INIT_LIST_HEAD(&aicwf_sta->list);
+				list_add_tail(&aicwf_sta->list, &aicwf_vif->ap.sta_list);
+
+				/* Initialize the TX queues */
+				if (aicwf_sta->ch_idx =3D=3D aicwf_hw->cur_chanctx)
+					txq_status =3D 0;
+				else
+					txq_status =3D AICWF_TXQ_STOP_CHAN;
+
+				aicwf_txq_sta_init(aicwf_hw, aicwf_sta, txq_status);
+#ifdef CONFIG_AICWF_BFMER
+				// TODO: update indication to contains vht capabilities
+				if (aicwf_hw->mod_params->bfmer)
+					aicwf_send_bfmer_enable(aicwf_hw, aicwf_sta, NULL);
+
+				aicwf_mu_group_sta_init(aicwf_sta, NULL);
+#endif /* CONFIG_AICWF_BFMER */
+
+			} else {
+				WARN_ON(0);
+			}
+		} else {
+			if (aicwf_sta->valid) {
+				aicwf_sta->ps.active =3D false;
+				aicwf_sta->valid =3D false;
+
+				/* Remove the station from the list of VIF's station */
+				list_del_init(&aicwf_sta->list);
+
+				aicwf_txq_sta_deinit(aicwf_hw, aicwf_sta);
+			} else {
+				WARN_ON(0);
+			}
+		}
+	} else {
+		if (!ind->estab && aicwf_sta->valid) {
+			/* There is no way to inform upper layer for lost of peer, still
+			 * clean everything in the driver
+			 */
+			aicwf_sta->ps.active =3D false;
+			aicwf_sta->valid =3D false;
+
+			/* Remove the station from the list of VIF's station */
+			list_del_init(&aicwf_sta->list);
+
+			aicwf_txq_sta_deinit(aicwf_hw, aicwf_sta);
+		} else {
+			WARN_ON(0);
+		}
+	}
+
+	return 0;
+}
+
+static inline int aicwf_rx_mesh_path_update_ind(struct aicwf_hw *aicwf_hw,
+						struct aicwf_cmd *cmd,
+						struct ipc_e2a_msg *msg)
+{
+	struct mesh_path_update_ind *ind =3D
+		(struct mesh_path_update_ind *)msg->param;
+	struct aicwf_vif *aicwf_vif =3D aicwf_hw->vif_table[ind->vif_idx];
+	struct aicwf_mesh_path *mesh_path;
+	bool found =3D false;
+
+	if (ind->vif_idx >=3D (NX_VIRT_DEV_MAX + NX_REMOTE_STA_MAX))
+		return 1;
+
+	if (!aicwf_vif || (AICWF_VIF_TYPE(aicwf_vif) !=3D NL80211_IFTYPE_MESH_POI=
NT))
+		return 0;
+
+	/* Look for path with provided target address */
+	list_for_each_entry(mesh_path, &aicwf_vif->ap.mpath_list, list) {
+		if (mesh_path->path_idx =3D=3D ind->path_idx) {
+			found =3D true;
+			break;
+		}
+	}
+
+	/* Check if element has been deleted */
+	if (ind->delete) {
+		if (found) {
+#ifdef AIC8800_CREATE_TRACE_POINTS
+			trace_mesh_delete_path(mesh_path);
+#endif
+			/* Remove element from list */
+			list_del_init(&mesh_path->list);
+			/* Free the element */
+			kfree(mesh_path);
+		}
+	} else {
+		if (found) {
+			// Update the Next Hop STA
+			mesh_path->p_nhop_sta =3D &aicwf_hw->sta_table[ind->nhop_sta_idx];
+#ifdef AIC8800_CREATE_TRACE_POINTS
+			trace_mesh_update_path(mesh_path);
+#endif
+		} else {
+			// Allocate a Mesh Path structure
+			mesh_path =3D
+				kmalloc_obj(struct aicwf_mesh_path, GFP_ATOMIC);
+
+			if (mesh_path) {
+				INIT_LIST_HEAD(&mesh_path->list);
+
+				mesh_path->path_idx =3D ind->path_idx;
+				mesh_path->p_nhop_sta =3D &aicwf_hw->sta_table[ind->nhop_sta_idx];
+				memcpy(&mesh_path->tgt_mac_addr, &ind->tgt_mac_addr,
+				       MAC_ADDR_LEN);
+
+				// Insert the path in the list of path
+				list_add_tail(&mesh_path->list, &aicwf_vif->ap.mpath_list);
+#ifdef AIC8800_CREATE_TRACE_POINTS
+				trace_mesh_create_path(mesh_path);
+#endif
+			}
+		}
+	}
+
+	return 0;
+}
+
+static inline int aicwf_rx_mesh_proxy_update_ind(struct aicwf_hw *aicwf_hw=
,
+						 struct aicwf_cmd *cmd,
+						 struct ipc_e2a_msg *msg)
+{
+	struct mesh_proxy_update_ind *ind =3D
+		(struct mesh_proxy_update_ind *)msg->param;
+	struct aicwf_vif *aicwf_vif =3D aicwf_hw->vif_table[ind->vif_idx];
+	struct aicwf_mesh_proxy *mesh_proxy;
+	bool found =3D false;
+
+	if (ind->vif_idx >=3D (NX_VIRT_DEV_MAX + NX_REMOTE_STA_MAX))
+		return 1;
+
+	if (!aicwf_vif || AICWF_VIF_TYPE(aicwf_vif) !=3D NL80211_IFTYPE_MESH_POIN=
T)
+		return 0;
+
+	/* Look for path with provided external STA address */
+	list_for_each_entry(mesh_proxy, &aicwf_vif->ap.proxy_list, list) {
+		if (!memcmp(&ind->ext_sta_addr, &mesh_proxy->ext_sta_addr, ETH_ALEN)) {
+			found =3D true;
+			break;
+		}
+	}
+
+	if (ind->delete && found) {
+		/* Delete mesh path */
+		list_del_init(&mesh_proxy->list);
+		kfree(mesh_proxy);
+	} else if (!ind->delete && !found) {
+		/* Allocate a Mesh Path structure */
+		mesh_proxy =3D
+			kmalloc_obj(*mesh_proxy, GFP_ATOMIC);
+
+		if (mesh_proxy) {
+			INIT_LIST_HEAD(&mesh_proxy->list);
+
+			memcpy(&mesh_proxy->ext_sta_addr, &ind->ext_sta_addr, MAC_ADDR_LEN);
+			mesh_proxy->local =3D ind->local;
+
+			if (!ind->local)
+				memcpy(&mesh_proxy->proxy_addr, &ind->proxy_mac_addr,
+				       MAC_ADDR_LEN);
+
+			/* Insert the path in the list of path */
+			list_add_tail(&mesh_proxy->list, &aicwf_vif->ap.proxy_list);
+		}
+	}
+
+	return 0;
+}
+#endif /* CONFIG_AICWF_FULLMAC */
+
+/*************************************************************************=
**
+ * Messages from DEBUG task
+ *************************************************************************=
*/
+static inline int aicwf_rx_dbg_error_ind(struct aicwf_hw *aicwf_hw,
+					 struct aicwf_cmd *cmd,
+					 struct ipc_e2a_msg *msg)
+{
+	return 0;
+}
+
+#ifdef CONFIG_AICWF_FULLMAC
+
+static const msg_cb_fct mm_hdlrs[MSG_I(MM_MAX)] =3D {
+	[MSG_I(MM_CHANNEL_SWITCH_IND)] =3D aicwf_rx_chan_switch_ind,
+	[MSG_I(MM_CHANNEL_PRE_SWITCH_IND)] =3D aicwf_rx_chan_pre_switch_ind,
+	[MSG_I(MM_REMAIN_ON_CHANNEL_EXP_IND)] =3D aicwf_rx_remain_on_channel_exp_=
ind,
+	[MSG_I(MM_PS_CHANGE_IND)] =3D aicwf_rx_ps_change_ind,
+	[MSG_I(MM_TRAFFIC_REQ_IND)] =3D aicwf_rx_traffic_req_ind,
+	[MSG_I(MM_P2P_VIF_PS_CHANGE_IND)] =3D aicwf_rx_p2p_vif_ps_change_ind,
+	[MSG_I(MM_CSA_COUNTER_IND)] =3D aicwf_rx_csa_counter_ind,
+	[MSG_I(MM_CSA_FINISH_IND)] =3D aicwf_rx_csa_finish_ind,
+	[MSG_I(MM_CSA_TRAFFIC_IND)] =3D aicwf_rx_csa_traffic_ind,
+	[MSG_I(MM_CHANNEL_SURVEY_IND)] =3D aicwf_rx_channel_survey_ind,
+	[MSG_I(MM_P2P_NOA_UPD_IND)] =3D aicwf_rx_p2p_noa_upd_ind,
+	[MSG_I(MM_RSSI_STATUS_IND)] =3D aicwf_rx_rssi_status_ind,
+	[MSG_I(MM_PKTLOSS_IND)] =3D aicwf_rx_pktloss_notify_ind,
+	[MSG_I(MM_APM_STALOSS_IND)] =3D aicwf_apm_staloss_ind,
+	[MSG_I(MM_ARP_ANNOUNCEMENT_IND)] =3D aicwf_arp_announcement_ind,
+};
+
+static const msg_cb_fct scan_hdlrs[MSG_I(SCANU_MAX)] =3D {
+	[MSG_I(SCANU_START_CFM)] =3D aicwf_rx_scanu_start_cfm,
+	[MSG_I(SCANU_RESULT_IND)] =3D aicwf_rx_scanu_result_ind,
+};
+
+static int aicwf_rx_me_chan_config_cfm(struct aicwf_hw *aicwf_hw,
+				       struct aicwf_cmd *cmd,
+				       struct ipc_e2a_msg *msg)
+{
+	if (cmd)
+		complete(&aicwf_hw->chan_config_complete);
+	return 0;
+}
+
+static const msg_cb_fct me_hdlrs[MSG_I(ME_MAX)] =3D {
+	[MSG_I(ME_CHAN_CONFIG_CFM)] =3D aicwf_rx_me_chan_config_cfm,
+	[MSG_I(ME_TKIP_MIC_FAILURE_IND)] =3D aicwf_rx_me_tkip_mic_failure_ind,
+	[MSG_I(ME_TX_CREDITS_UPDATE_IND)] =3D aicwf_rx_me_tx_credits_update_ind,
+};
+
+static const msg_cb_fct sm_hdlrs[MSG_I(SM_MAX)] =3D {
+	[MSG_I(SM_CONNECT_IND)] =3D aicwf_rx_sm_connect_ind,
+	[MSG_I(SM_DISCONNECT_IND)] =3D aicwf_rx_sm_disconnect_ind,
+	[MSG_I(SM_EXTERNAL_AUTH_REQUIRED_IND)] =3D
+		aicwf_rx_sm_external_auth_required_ind,
+};
+
+static const msg_cb_fct apm_hdlrs[MSG_I(APM_MAX)] =3D {};
+
+static const msg_cb_fct mesh_hdlrs[MSG_I(MESH_MAX)] =3D {
+	[MSG_I(MESH_PATH_CREATE_CFM)] =3D aicwf_rx_mesh_path_create_cfm,
+	[MSG_I(MESH_PEER_UPDATE_IND)] =3D aicwf_rx_mesh_peer_update_ind,
+	[MSG_I(MESH_PATH_UPDATE_IND)] =3D aicwf_rx_mesh_path_update_ind,
+	[MSG_I(MESH_PROXY_UPDATE_IND)] =3D aicwf_rx_mesh_proxy_update_ind,
+};
+
+#endif /* CONFIG_AICWF_FULLMAC */
+
+static const msg_cb_fct dbg_hdlrs[MSG_I(DBG_MAX)] =3D {
+	[MSG_I(DBG_ERROR_IND)] =3D aicwf_rx_dbg_error_ind,
+};
+
+static const msg_cb_fct tdls_hdlrs[MSG_I(TDLS_MAX)] =3D {
+	[MSG_I(TDLS_CHAN_SWITCH_CFM)] =3D aicwf_rx_tdls_chan_switch_cfm,
+	[MSG_I(TDLS_CHAN_SWITCH_IND)] =3D aicwf_rx_tdls_chan_switch_ind,
+	[MSG_I(TDLS_CHAN_SWITCH_BASE_IND)] =3D aicwf_rx_tdls_chan_switch_base_ind=
,
+	[MSG_I(TDLS_PEER_PS_IND)] =3D aicwf_rx_tdls_peer_ps_ind,
+};
+
+static const struct {
+	const msg_cb_fct *handlers;
+	unsigned int count;
+} msg_hdlrs[] =3D {
+	[TASK_MM] =3D { mm_hdlrs, ARRAY_SIZE(mm_hdlrs) },
+	[TASK_DBG] =3D { dbg_hdlrs, ARRAY_SIZE(dbg_hdlrs) },
+#ifdef CONFIG_AICWF_FULLMAC
+	[TASK_TDLS] =3D { tdls_hdlrs, ARRAY_SIZE(tdls_hdlrs) },
+	[TASK_SCANU] =3D { scan_hdlrs, ARRAY_SIZE(scan_hdlrs) },
+	[TASK_ME] =3D { me_hdlrs, ARRAY_SIZE(me_hdlrs) },
+	[TASK_SM] =3D { sm_hdlrs, ARRAY_SIZE(sm_hdlrs) },
+	[TASK_APM] =3D { apm_hdlrs, ARRAY_SIZE(apm_hdlrs) },
+	[TASK_MESH] =3D { mesh_hdlrs, ARRAY_SIZE(mesh_hdlrs) },
+#endif /* CONFIG_AICWF_FULLMAC */
+};
+
+/*
+ *
+ */
+void aicwf_rx_handle_msg(struct aicwf_hw *aicwf_hw, struct ipc_e2a_msg *ms=
g)
+{
+	unsigned int task =3D MSG_T(msg->id);
+	unsigned int index =3D MSG_I(msg->id);
+
+	if (task >=3D ARRAY_SIZE(msg_hdlrs) ||
+	    index >=3D msg_hdlrs[task].count) {
+		dev_warn_ratelimited(aicwf_hw->dev,
+				     "Invalid firmware message ID 0x%04x (task=3D%u, index=3D%u)\n",
+				     msg->id, task, index);
+		return;
+	}
+
+	aicwf_hw->cmd_mgr->msgind(aicwf_hw->cmd_mgr, msg,
+			       msg_hdlrs[task].handlers[index]);
+}
+
+void aicwf_rx_handle_print(struct aicwf_hw *aicwf_hw, u8 *msg, u32 len)
+{
+	if (!aicwf_hw) {
+		pr_err("aicwf_hw is null!\n");
+		return;
+	}
+
+	if (!aicwf_hw->fwlog_en) {
+		dev_err(aicwf_hw->dev, "fwlog overflow: %.*s\n", (int)len, msg);
+		return;
+	}
+
+	dev_dbg(aicwf_hw->dev, "fwlog: %.*s\n", (int)len, msg);
+}
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_rx.h b/drivers=
/net/wireless/aic/aic8800_fdrv/aicwf_msg_rx.h
new file mode 100644
index 000000000000..e7c30d6fadda
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_rx.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_MSG_RX_H_
+#define _AICWF_MSG_RX_H_
+
+void aicwf_rx_handle_msg(struct aicwf_hw *aicwf_hw, struct ipc_e2a_msg *ms=
g);
+void aicwf_rx_handle_print(struct aicwf_hw *aicwf_hw, u8 *msg, u32 len);
+
+#endif /* _AICWF_MSG_RX_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_tx.c b/drivers=
/net/wireless/aic/aic8800_fdrv/aicwf_msg_tx.c
new file mode 100644
index 000000000000..cbb88c5b86ad
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_tx.c
@@ -0,0 +1,2499 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *************************************************************************=
*****
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief TX function definitions
+ *
+ *************************************************************************=
*****
+ */
+
+#include "aicwf_msg_tx.h"
+#include "aicwf_mod_params.h"
+#ifdef CONFIG_AICWF_BFMER
+#include "aicwf_bfmer.h"
+#endif //(CONFIG_AICWF_BFMER)
+#include "aicwf_txrxif.h"
+#include "aicwf_cmds.h"
+#include "aicwf_main.h"
+#include "aicwf_strs.h"
+#include <linux/pm.h>
+#include "aicwf_sdio.h"
+#include "aicwf_chip_ops.h"
+
+static const struct mac_addr mac_addr_bcst =3D {{0xFFFF, 0xFFFF, 0xFFFF}};
+
+const int bw2chnl[] =3D {
+	[NL80211_CHAN_WIDTH_20_NOHT] =3D PHY_CHNL_BW_20,
+	[NL80211_CHAN_WIDTH_20] =3D PHY_CHNL_BW_20,
+	[NL80211_CHAN_WIDTH_40] =3D PHY_CHNL_BW_40,
+	[NL80211_CHAN_WIDTH_80] =3D PHY_CHNL_BW_80,
+	[NL80211_CHAN_WIDTH_160] =3D PHY_CHNL_BW_160,
+	[NL80211_CHAN_WIDTH_80P80] =3D PHY_CHNL_BW_80P80,
+};
+
+const int chnl2bw[] =3D {
+	[PHY_CHNL_BW_20] =3D NL80211_CHAN_WIDTH_20,
+	[PHY_CHNL_BW_40] =3D NL80211_CHAN_WIDTH_40,
+	[PHY_CHNL_BW_80] =3D NL80211_CHAN_WIDTH_80,
+	[PHY_CHNL_BW_160] =3D NL80211_CHAN_WIDTH_160,
+	[PHY_CHNL_BW_80P80] =3D NL80211_CHAN_WIDTH_80P80,
+};
+
+/*************************************************************************=
****/
+
+static inline bool use_pairwise_key(struct cfg80211_crypto_settings *crypt=
o)
+{
+	if (crypto->cipher_group =3D=3D WLAN_CIPHER_SUITE_WEP40 ||
+	    crypto->cipher_group =3D=3D WLAN_CIPHER_SUITE_WEP104)
+		return false;
+
+	return true;
+}
+
+static inline u8 get_chan_flags(uint32_t flags)
+{
+	u8 chan_flags =3D 0;
+
+	if (flags & IEEE80211_CHAN_DISABLED)
+		chan_flags |=3D CHAN_DISABLED;
+
+	if (flags & IEEE80211_CHAN_NO_IR)
+		chan_flags |=3D CHAN_NO_IR;
+
+	if (flags & IEEE80211_CHAN_RADAR)
+		chan_flags |=3D CHAN_RADAR;
+	return chan_flags;
+}
+
+static inline s8 chan_to_fw_pwr(struct aicwf_hw *aicwf_hw, int power)
+{
+	power =3D min(power, READ_ONCE(aicwf_hw->tx_power_limit));
+	return clamp_t(int, power, S8_MIN, S8_MAX);
+}
+
+static inline void limit_chan_bw(u8 *bw, u16 primary, u16 *center1)
+{
+	int oft, new_oft =3D 10;
+
+	if (*bw <=3D PHY_CHNL_BW_40)
+		return;
+
+	oft =3D *center1 - primary;
+	*bw =3D PHY_CHNL_BW_40;
+
+	if (oft < 0)
+		new_oft =3D new_oft * -1;
+	if (abs(oft) =3D=3D 10 || abs(oft) =3D=3D 50)
+		new_oft =3D new_oft * -1;
+
+	*center1 =3D primary + new_oft;
+}
+
+/*
+ *************************************************************************=
*****
+ * @brief Allocate memory for a message
+ *
+ * This primitive allocates memory for a message that has to be sent. The =
memory
+ * is allocated dynamically on the heap and the length of the variable par=
ameter
+ * structure has to be provided in order to allocate the correct size.
+ *
+ * Several additional parameters are provided which will be preset in the
+ *message and which may be used internally to choose the kind of memory to
+ *allocate.
+ *
+ * The memory allocated will be automatically freed by the kernel, after t=
he
+ * pointer has been sent to ke_msg_send(). If the message is not sent, it =
must
+ * be freed explicitly with ke_msg_free().
+ *
+ * Allocation failure is considered critical and should not happen.
+ *
+ * @param[in] id        Message identifier
+ * @param[in] dest_id   Destination Task Identifier
+ * @param[in] src_id    Source Task Identifier
+ * @param[in] param_len Size of the message parameters to be allocated
+ *
+ * @return Pointer to the parameter member of the ke_msg. If the parameter
+ *         structure is empty, the pointer will point to the end of the me=
ssage
+ *         and should not be used (except to retrieve the message pointer =
or to
+ *         send the message)
+ *************************************************************************=
*****
+ */
+static inline void *aicwf_msg_zalloc(struct aicwf_hw *aicwf_hw, lmac_msg_i=
d_t const id,
+				     lmac_task_id_t const dest_id,
+				     lmac_task_id_t const src_id,
+				     uint16_t const param_len)
+{
+	struct lmac_msg *msg;
+	gfp_t flags;
+
+	//  if (is_non_blocking_msg(id) && (in_softirq()||in_atomic()))
+	flags =3D GFP_ATOMIC;
+	//  else
+	//      flags =3D GFP_KERNEL;
+
+	// msg =3D (struct lmac_msg *)kzalloc(sizeof(struct lmac_msg) + param_len=
, flags);
+	msg =3D kzalloc(sizeof(*msg) + param_len, flags);
+	if (!msg)
+		return NULL;
+	msg->id =3D id;
+	msg->dest_id =3D dest_id;
+	msg->src_id =3D src_id;
+	msg->param_len =3D param_len;
+
+	return msg->param;
+}
+
+static void aicwf_msg_free(struct aicwf_hw *aicwf_hw, const void *msg_para=
ms)
+{
+	struct lmac_msg *msg =3D container_of((void *)msg_params, struct lmac_msg=
, param);
+
+	/* Free the message */
+	kfree(msg);
+}
+
+// void aicwf_pm_relax(struct aic_sdio_dev *sdiodev);
+// void aicwf_pm_stay_awake(struct aic_sdio_dev *sdiodev);
+
+static int aicwf_send_msg(struct aicwf_hw *aicwf_hw, const void *msg_param=
s,
+			  int reqcfm, lmac_msg_id_t reqid, void *cfm,
+			  size_t cfm_len)
+{
+	struct lmac_msg *msg;
+	struct aicwf_cmd *cmd;
+	bool nonblock;
+	int ret =3D 0;
+	u8 empty =3D 0;
+
+	dev_dbg(aicwf_hw->dev, "%d%s reqcfm:%d in_hardirq:%d in_softirq:%d irqs_d=
isabled:%d\n",
+		reqid, AICWF_ID2STR(reqid), reqcfm, (int)in_hardirq(),
+		(int)in_softirq(), (int)irqs_disabled());
+
+	ret =3D aicwf_cmd_mgr_get(aicwf_hw->cmd_mgr);
+	if (ret) {
+		aicwf_msg_free(aicwf_hw, msg_params);
+		return ret;
+	}
+	if (!aicwf_sdio_activity_get(aicwf_hw, aicwf_hw->ws_tx)) {
+		aicwf_msg_free(aicwf_hw, msg_params);
+		aicwf_cmd_mgr_put(aicwf_hw->cmd_mgr);
+		return -EBUSY;
+	}
+	if (aicwf_hw->sdiodev->bus_if->state =3D=3D BUS_DOWN_ST) {
+		aicwf_msg_free(aicwf_hw, msg_params);
+		dev_err(aicwf_hw->dev, "bus is down\n");
+		aicwf_sdio_activity_put(aicwf_hw, aicwf_hw->ws_tx);
+		aicwf_cmd_mgr_put(aicwf_hw->cmd_mgr);
+		return -ENODEV;
+	}
+
+	msg =3D container_of((void *)msg_params, struct lmac_msg, param);
+
+	nonblock =3D 0;
+	cmd =3D aicwf_cmd_malloc(aicwf_hw->cmd_mgr);
+	if (!cmd) {
+		aicwf_msg_free(aicwf_hw, msg_params);
+		aicwf_sdio_activity_put(aicwf_hw, aicwf_hw->ws_tx);
+		aicwf_cmd_mgr_put(aicwf_hw->cmd_mgr);
+		return -ENOMEM;
+	}
+	cmd->result =3D -EINTR;
+	cmd->id =3D msg->id;
+	cmd->reqid =3D reqid;
+	cmd->a2e_msg =3D msg;
+	cmd->e2a_msg =3D cfm;
+	cmd->e2a_msg_len =3D cfm_len;
+	if (nonblock)
+		cmd->flags =3D AICWF_CMD_FLAG_NONBLOCK;
+	if (reqcfm)
+		cmd->flags |=3D AICWF_CMD_FLAG_REQ_CFM;
+
+	if (cfm) {
+		do {
+			if (READ_ONCE(aicwf_hw->cmd_mgr->state) !=3D AICWF_CMD_MGR_STATE_INITED=
)
+				break;
+			spin_lock_bh(&aicwf_hw->cmd_mgr->lock);
+			empty =3D list_empty(&aicwf_hw->cmd_mgr->cmds);
+			spin_unlock_bh(&aicwf_hw->cmd_mgr->lock);
+			if (!empty) {
+				if (in_softirq()) {
+					dev_dbg(aicwf_hw->dev, "in_softirq:check cmdqueue empty\n");
+					mdelay(10);
+				} else {
+					dev_dbg(aicwf_hw->dev, "check cmdqueue empty\n");
+					msleep(50);
+				}
+			}
+		} while (!empty); // wait for cmd queue empty
+	}
+
+	if (reqcfm) {
+		cmd->flags &=3D ~AICWF_CMD_FLAG_WAIT_ACK; // we don't need ack any more
+		ret =3D aicwf_hw->cmd_mgr->queue(aicwf_hw->cmd_mgr, cmd);
+	} else {
+		aicwf_set_cmd_tx((void *)(aicwf_hw->sdiodev), cmd->a2e_msg,
+				 sizeof(struct lmac_msg) + cmd->a2e_msg->param_len);
+	}
+
+	/* The queue owns both the request and command, also on rejection. */
+	if (!reqcfm) {
+		aicwf_msg_free(aicwf_hw, msg_params);
+		aicwf_cmd_free(aicwf_hw->cmd_mgr, cmd);
+	}
+
+	aicwf_sdio_activity_put(aicwf_hw, aicwf_hw->ws_tx);
+	aicwf_cmd_mgr_put(aicwf_hw->cmd_mgr);
+	return ret;
+}
+
+static int aicwf_send_msg1(struct aicwf_hw *aicwf_hw, const void *msg_para=
ms,
+			   int reqcfm, lmac_msg_id_t reqid, void *cfm,
+			   size_t cfm_len, bool defer)
+{
+	struct lmac_msg *msg;
+	struct aicwf_cmd *cmd;
+	bool nonblock;
+	int ret =3D 0;
+
+	dev_dbg(aicwf_hw->dev, "%d%s reqcfm:%d in_hardirq:%d in_softirq:%d irqs_d=
isabled:%d\n",
+		reqid, AICWF_ID2STR(reqid), reqcfm, (int)in_hardirq(),
+		(int)in_softirq(), (int)irqs_disabled());
+
+	ret =3D aicwf_cmd_mgr_get(aicwf_hw->cmd_mgr);
+	if (ret) {
+		aicwf_msg_free(aicwf_hw, msg_params);
+		return ret;
+	}
+	if (!aicwf_sdio_activity_get(aicwf_hw, aicwf_hw->ws_tx)) {
+		aicwf_msg_free(aicwf_hw, msg_params);
+		aicwf_cmd_mgr_put(aicwf_hw->cmd_mgr);
+		return -EBUSY;
+	}
+	msg =3D container_of((void *)msg_params, struct lmac_msg, param);
+
+	nonblock =3D 0;
+	cmd =3D aicwf_cmd_malloc(aicwf_hw->cmd_mgr);
+	if (!cmd) {
+		aicwf_msg_free(aicwf_hw, msg_params);
+		aicwf_sdio_activity_put(aicwf_hw, aicwf_hw->ws_tx);
+		aicwf_cmd_mgr_put(aicwf_hw->cmd_mgr);
+		return -ENOMEM;
+	}
+	cmd->result =3D -EINTR;
+	cmd->id =3D msg->id;
+	cmd->reqid =3D reqid;
+	cmd->a2e_msg =3D msg;
+	cmd->e2a_msg =3D cfm;
+	cmd->e2a_msg_len =3D cfm_len;
+	if (nonblock)
+		cmd->flags =3D AICWF_CMD_FLAG_NONBLOCK;
+	if (reqcfm)
+		cmd->flags |=3D AICWF_CMD_FLAG_REQ_CFM;
+
+	if (reqcfm) {
+		cmd->flags &=3D ~AICWF_CMD_FLAG_WAIT_ACK; // we don't need ack any more
+		if (!defer)
+			ret =3D aicwf_hw->cmd_mgr->queue(aicwf_hw->cmd_mgr, cmd);
+		else
+			ret =3D cmd_mgr_queue_force_defer(aicwf_hw->cmd_mgr, cmd);
+	}
+
+	/* Do not read cmd after queue(): it may already be back in the pool. */
+	if (!reqcfm) {
+		aicwf_msg_free(aicwf_hw, msg_params);
+		aicwf_cmd_free(aicwf_hw->cmd_mgr, cmd);
+	}
+
+	aicwf_sdio_activity_put(aicwf_hw, aicwf_hw->ws_tx);
+	aicwf_cmd_mgr_put(aicwf_hw->cmd_mgr);
+	return ret;
+}
+
+/*************************************************************************=
*****
+ *    Control messages handling functions (FULLMAC)
+ *************************************************************************=
****/
+int aicwf_send_reset(struct aicwf_hw *aicwf_hw)
+{
+	void *void_param;
+
+	/* RESET REQ has no parameter */
+	void_param =3D aicwf_msg_zalloc(aicwf_hw, MM_RESET_REQ, TASK_MM, DRV_TASK=
_ID, 0);
+	if (!void_param)
+		return -ENOMEM;
+
+	return aicwf_send_msg(aicwf_hw, void_param, 1, MM_RESET_CFM, NULL, 0);
+}
+
+int aicwf_send_start(struct aicwf_hw *aicwf_hw)
+{
+	struct mm_start_req *start_req_param;
+
+	/* Build the START REQ message */
+	start_req_param =3D aicwf_msg_zalloc(aicwf_hw, MM_START_REQ, TASK_MM, DRV=
_TASK_ID,
+					   sizeof(struct mm_start_req));
+	if (!start_req_param)
+		return -ENOMEM;
+
+	/* Set parameters for the START message */
+	memcpy(&start_req_param->phy_cfg, &aicwf_hw->phy.cfg,
+	       sizeof(aicwf_hw->phy.cfg));
+	start_req_param->uapsd_timeout =3D (u32)aicwf_hw->mod_params->uapsd_timeo=
ut;
+	start_req_param->lp_clk_accuracy =3D (u16)aicwf_hw->mod_params->lp_clk_pp=
m;
+
+	/* Send the START REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, start_req_param, 1, MM_START_CFM, NULL, 0=
);
+}
+
+int aicwf_send_version_req(struct aicwf_hw *aicwf_hw, struct mm_version_cf=
m *cfm)
+{
+	void *void_param;
+
+	/* VERSION REQ has no parameter */
+	void_param =3D aicwf_msg_zalloc(aicwf_hw, MM_VERSION_REQ, TASK_MM, DRV_TA=
SK_ID, 0);
+	if (!void_param)
+		return -ENOMEM;
+
+	return aicwf_send_msg(aicwf_hw, void_param, 1, MM_VERSION_CFM, cfm, sizeo=
f(*cfm));
+}
+
+int aicwf_send_add_if(struct aicwf_hw *aicwf_hw, const unsigned char *mac,
+		      enum nl80211_iftype iftype, bool p2p,
+		      struct mm_add_if_cfm *cfm)
+{
+	struct mm_add_if_req *add_if_req_param;
+
+	/* Build the ADD_IF_REQ message */
+	add_if_req_param =3D aicwf_msg_zalloc(aicwf_hw, MM_ADD_IF_REQ, TASK_MM, D=
RV_TASK_ID,
+					    sizeof(struct mm_add_if_req));
+	if (!add_if_req_param)
+		return -ENOMEM;
+
+	/* Set parameters for the ADD_IF_REQ message */
+	memcpy(&add_if_req_param->addr.array[0], mac, ETH_ALEN);
+	switch (iftype) {
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+#ifdef CONFIG_AICWF_FULLMAC
+		// case NL80211_IFTYPE_P2P_DEVICE:
+	case NL80211_IFTYPE_P2P_CLIENT:
+		add_if_req_param->p2p =3D true;
+		fallthrough;
+		// no break
+#endif /* CONFIG_AICWF_FULLMAC */
+#endif
+	case NL80211_IFTYPE_STATION:
+		add_if_req_param->type =3D MM_STA;
+		break;
+
+#if !IS_ENABLED(CONFIG_AIC8800_STA_ONLY)
+	case NL80211_IFTYPE_ADHOC:
+		add_if_req_param->type =3D MM_IBSS;
+		break;
+
+#ifdef CONFIG_AICWF_FULLMAC
+	case NL80211_IFTYPE_P2P_GO:
+		add_if_req_param->p2p =3D true;
+		fallthrough;
+		// no break
+#endif /* CONFIG_AICWF_FULLMAC */
+	case NL80211_IFTYPE_AP:
+		add_if_req_param->type =3D MM_AP;
+		break;
+	case NL80211_IFTYPE_MESH_POINT:
+		add_if_req_param->type =3D MM_MESH_POINT;
+		break;
+	case NL80211_IFTYPE_AP_VLAN:
+		return -1;
+	case NL80211_IFTYPE_MONITOR:
+		add_if_req_param->type =3D MM_MONITOR;
+		break;
+#endif
+	default:
+		aicwf_msg_free(aicwf_hw, add_if_req_param);
+		return -EOPNOTSUPP;
+	}
+
+	/* Send the ADD_IF_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, add_if_req_param, 1, MM_ADD_IF_CFM, cfm, =
sizeof(*cfm));
+}
+
+int aicwf_send_remove_if(struct aicwf_hw *aicwf_hw, u8 vif_index, bool def=
er)
+{
+	struct mm_remove_if_req *remove_if_req;
+
+	/* Build the MM_REMOVE_IF_REQ message */
+	remove_if_req =3D aicwf_msg_zalloc(aicwf_hw, MM_REMOVE_IF_REQ, TASK_MM, D=
RV_TASK_ID,
+					 sizeof(struct mm_remove_if_req));
+	if (!remove_if_req)
+		return -ENOMEM;
+
+	/* Set parameters for the MM_REMOVE_IF_REQ message */
+	remove_if_req->inst_nbr =3D vif_index;
+
+	/* Send the MM_REMOVE_IF_REQ message to LMAC FW */
+	return aicwf_send_msg1(aicwf_hw, remove_if_req, 1, MM_REMOVE_IF_CFM, NULL=
, 0,
+						  defer);
+}
+
+int aicwf_send_key_add(struct aicwf_hw *aicwf_hw, u8 vif_idx, u8 sta_idx,
+		       bool pairwise, u8 *key, u8 key_len, u8 key_idx,
+		       u8 cipher_suite, struct mm_key_add_cfm *cfm)
+{
+	struct mm_key_add_req *key_add_req;
+
+	/* Build the MM_KEY_ADD_REQ message */
+	key_add_req =3D aicwf_msg_zalloc(aicwf_hw, MM_KEY_ADD_REQ, TASK_MM, DRV_T=
ASK_ID,
+				       sizeof(struct mm_key_add_req));
+	if (!key_add_req)
+		return -ENOMEM;
+
+	/* Set parameters for the MM_KEY_ADD_REQ message */
+	if (sta_idx !=3D 0xFF) {
+		/* Pairwise key */
+		key_add_req->sta_idx =3D sta_idx;
+	} else {
+		/* Default key */
+		key_add_req->sta_idx =3D sta_idx;
+		key_add_req->key_idx =3D (u8)key_idx; /* only useful for default keys */
+	}
+	key_add_req->pairwise =3D pairwise;
+	key_add_req->inst_nbr =3D vif_idx;
+	key_add_req->key.length =3D key_len;
+	memcpy(&key_add_req->key.array[0], key, key_len);
+
+	key_add_req->cipher_suite =3D cipher_suite;
+
+	dev_dbg(aicwf_hw->dev, "sta_idx:%d key_idx:%d inst_nbr:%d cipher:%d key_l=
en:%d\n",
+		key_add_req->sta_idx, key_add_req->key_idx,
+		key_add_req->inst_nbr, key_add_req->cipher_suite,
+		key_add_req->key.length);
+#if defined(CONFIG_AICWF_DBG) || defined(CONFIG_DYNAMIC_DEBUG)
+	print_hex_dump_bytes("key: ", DUMP_PREFIX_OFFSET, key_add_req->key.array,
+			     key_add_req->key.length);
+#endif
+
+	/* Send the MM_KEY_ADD_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, key_add_req, 1, MM_KEY_ADD_CFM, cfm, size=
of(*cfm));
+}
+
+int aicwf_send_key_del(struct aicwf_hw *aicwf_hw, uint8_t hw_key_idx)
+{
+	struct mm_key_del_req *key_del_req;
+
+	/* Build the MM_KEY_DEL_REQ message */
+	key_del_req =3D aicwf_msg_zalloc(aicwf_hw, MM_KEY_DEL_REQ, TASK_MM, DRV_T=
ASK_ID,
+				       sizeof(struct mm_key_del_req));
+	if (!key_del_req)
+		return -ENOMEM;
+
+	/* Set parameters for the MM_KEY_DEL_REQ message */
+	key_del_req->hw_key_idx =3D hw_key_idx;
+
+	/* Send the MM_KEY_DEL_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, key_del_req, 1, MM_KEY_DEL_CFM, NULL, 0);
+}
+
+int aicwf_send_bcn(struct aicwf_hw *aicwf_hw, u8 *buf, u8 vif_idx, u16 bcn=
_len)
+{
+	struct apm_set_bcn_ie_req *bcn_ie_req;
+
+	bcn_ie_req =3D aicwf_msg_zalloc(aicwf_hw, APM_SET_BEACON_IE_REQ, TASK_APM=
, DRV_TASK_ID,
+				      sizeof(struct apm_set_bcn_ie_req));
+	if (!bcn_ie_req)
+		return -ENOMEM;
+
+	bcn_ie_req->vif_idx =3D vif_idx;
+	bcn_ie_req->bcn_ie_len =3D bcn_len;
+	memcpy(bcn_ie_req->bcn_ie, (u8 *)buf, bcn_len);
+	kfree(buf);
+
+	return aicwf_send_msg(aicwf_hw, bcn_ie_req, 1, APM_SET_BEACON_IE_CFM, NUL=
L, 0);
+}
+
+int aicwf_send_bcn_change(struct aicwf_hw *aicwf_hw, u8 vif_idx, u32 bcn_a=
ddr,
+			  u16 bcn_len, u16 tim_oft, u16 tim_len, u16 *csa_oft)
+{
+	struct mm_bcn_change_req *req;
+
+	/* Build the MM_BCN_CHANGE_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, MM_BCN_CHANGE_REQ, TASK_MM, DRV_TASK_I=
D,
+			       sizeof(struct mm_bcn_change_req));
+	if (!req)
+		return -ENOMEM;
+
+	/* Set parameters for the MM_BCN_CHANGE_REQ message */
+	req->bcn_ptr =3D bcn_addr;
+	req->bcn_len =3D bcn_len;
+	req->tim_oft =3D tim_oft;
+	req->tim_len =3D tim_len;
+	req->inst_nbr =3D vif_idx;
+
+	if (csa_oft) {
+		int i;
+
+		for (i =3D 0; i < BCN_MAX_CSA_CPT; i++)
+			req->csa_oft[i] =3D csa_oft[i];
+	}
+
+	/* Send the MM_BCN_CHANGE_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, MM_BCN_CHANGE_CFM, NULL, 0);
+}
+
+int aicwf_send_roc(struct aicwf_hw *aicwf_hw, struct aicwf_vif *vif,
+		   struct ieee80211_channel *chan, unsigned int duration,
+		   struct mm_remain_on_channel_cfm *roc_cfm)
+{
+	struct mm_remain_on_channel_req *req;
+	struct cfg80211_chan_def chandef;
+
+	if (READ_ONCE(aicwf_hw->regdom_failed))
+		return -EIO;
+
+	/* Create channel definition structure */
+	cfg80211_chandef_create(&chandef, chan, NL80211_CHAN_NO_HT);
+
+	/* Build the MM_REMAIN_ON_CHANNEL_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, MM_REMAIN_ON_CHANNEL_REQ, TASK_MM, DRV=
_TASK_ID,
+			       sizeof(struct mm_remain_on_channel_req));
+	if (!req)
+		return -ENOMEM;
+
+	/* Set parameters for the MM_REMAIN_ON_CHANNEL_REQ message */
+	req->op_code =3D MM_ROC_OP_START;
+	req->vif_index =3D vif->vif_index;
+	req->duration_ms =3D duration;
+	req->band =3D chan->band;
+	req->type =3D bw2chnl[chandef.width];
+	req->prim20_freq =3D chan->center_freq;
+	req->center1_freq =3D chandef.center_freq1;
+	req->center2_freq =3D chandef.center_freq2;
+	req->tx_power =3D chan_to_fw_pwr(aicwf_hw, chan->max_power);
+
+	/* Send the MM_REMAIN_ON_CHANNEL_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, MM_REMAIN_ON_CHANNEL_CFM, roc_cfm=
, sizeof(*roc_cfm));
+}
+
+int aicwf_send_cancel_roc(struct aicwf_hw *aicwf_hw)
+{
+	struct mm_remain_on_channel_req *req;
+
+	/* Build the MM_REMAIN_ON_CHANNEL_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, MM_REMAIN_ON_CHANNEL_REQ, TASK_MM, DRV=
_TASK_ID,
+			       sizeof(struct mm_remain_on_channel_req));
+	if (!req)
+		return -ENOMEM;
+
+	/* Set parameters for the MM_REMAIN_ON_CHANNEL_REQ message */
+	req->op_code =3D MM_ROC_OP_CANCEL;
+
+	/* Send the MM_REMAIN_ON_CHANNEL_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, MM_REMAIN_ON_CHANNEL_CFM, NULL, 0=
);
+}
+
+int aicwf_send_set_edca(struct aicwf_hw *aicwf_hw, u8 hw_queue, u32 param,
+			bool uapsd, u8 inst_nbr)
+{
+	struct mm_set_edca_req *set_edca_req;
+
+	/* Build the MM_SET_EDCA_REQ message */
+	set_edca_req =3D aicwf_msg_zalloc(aicwf_hw, MM_SET_EDCA_REQ, TASK_MM, DRV=
_TASK_ID,
+					sizeof(struct mm_set_edca_req));
+	if (!set_edca_req)
+		return -ENOMEM;
+
+	/* Set parameters for the MM_SET_EDCA_REQ message */
+	set_edca_req->ac_param =3D param;
+	set_edca_req->uapsd =3D uapsd;
+	set_edca_req->hw_queue =3D hw_queue;
+	set_edca_req->inst_nbr =3D inst_nbr;
+
+	/* Send the MM_SET_EDCA_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, set_edca_req, 1, MM_SET_EDCA_CFM, NULL, 0=
);
+}
+
+#ifdef CONFIG_AIC8800_ARP_OFFLOAD
+int aicwf_send_arpoffload_en_req(struct aicwf_hw *aicwf_hw,
+				 struct aicwf_vif *aicwf_vif, u32 ipaddr,
+				 u8 enable)
+{
+	struct mm_set_arpoffload_en_req *arp_offload_req;
+	int error;
+
+	/* Build the MM_SET_P2P_NOA_REQ message */
+	arp_offload_req =3D
+		aicwf_msg_zalloc(aicwf_hw, MM_SET_ARPOFFLOAD_REQ, TASK_MM, DRV_TASK_ID,
+				 sizeof(struct mm_set_arpoffload_en_req));
+
+	if (!arp_offload_req)
+		return -ENOMEM;
+
+	/* Fill the message parameters */
+	arp_offload_req->enable =3D enable;
+	arp_offload_req->vif_idx =3D aicwf_vif->vif_index;
+	arp_offload_req->ipaddr =3D ipaddr;
+
+	/* Send the MM_ARPOFFLOAD_EN_REQ message to UMAC FW */
+	error =3D
+		aicwf_send_msg(aicwf_hw, arp_offload_req, 1, MM_SET_ARPOFFLOAD_CFM, NULL=
, 0);
+
+	return error;
+}
+#endif
+
+int aicwf_send_rf_calib_req(struct aicwf_hw *aicwf_hw,
+			    struct mm_set_rf_calib_cfm *cfm)
+{
+	struct mm_set_rf_calib_req *rf_calib_req;
+	struct xtal_cap_conf xtal_cap =3D {
+		0,
+	};
+	int error;
+
+	/* Build the MM_SET_P2P_NOA_REQ message */
+	rf_calib_req =3D aicwf_msg_zalloc(aicwf_hw, MM_SET_RF_CALIB_REQ, TASK_MM,=
 DRV_TASK_ID,
+					sizeof(struct mm_set_rf_calib_req));
+
+	if (!rf_calib_req)
+		return -ENOMEM;
+
+	aic_chip_set_rf_calib_cfg(aicwf_hw, rf_calib_req);
+
+	rf_calib_req->param_alpha =3D 0x0c34c008;
+	rf_calib_req->bt_calib_en =3D 0;
+	rf_calib_req->bt_calib_param =3D 0x264203;
+
+	get_userconfig_xtal_cap(aicwf_hw, &xtal_cap);
+
+	if (xtal_cap.enable) {
+		dev_dbg(aicwf_hw->dev, "user xtal cap: %d, cap_fine: %d\n", xtal_cap.xta=
l_cap,
+			xtal_cap.xtal_cap_fine);
+		rf_calib_req->xtal_cap =3D xtal_cap.xtal_cap;
+		rf_calib_req->xtal_cap_fine =3D xtal_cap.xtal_cap_fine;
+	} else {
+		rf_calib_req->xtal_cap =3D 0;
+		rf_calib_req->xtal_cap_fine =3D 0;
+	}
+
+	/* Send the MM_SET_RF_CALIB_REQ message to UMAC FW */
+	error =3D aicwf_send_msg(aicwf_hw, rf_calib_req, 1, MM_SET_RF_CALIB_CFM, =
cfm, sizeof(*cfm));
+
+	return error;
+};
+
+int aicwf_send_get_macaddr_req(struct aicwf_hw *aicwf_hw,
+			       struct mm_get_mac_addr_cfm *cfm)
+{
+	struct mm_get_mac_addr_req *get_macaddr_req;
+	int error;
+
+	/* Build the MM_GET_MAC_ADDR_REQ message */
+	get_macaddr_req =3D aicwf_msg_zalloc(aicwf_hw, MM_GET_MAC_ADDR_REQ, TASK_=
MM, DRV_TASK_ID,
+					   sizeof(struct mm_get_mac_addr_req));
+
+	if (!get_macaddr_req)
+		return -ENOMEM;
+
+	get_macaddr_req->get =3D 1;
+
+	/* Send the MM_GET_MAC_ADDR_REQ  message to UMAC FW */
+	error =3D
+		aicwf_send_msg(aicwf_hw, get_macaddr_req, 1, MM_GET_MAC_ADDR_CFM, cfm, s=
izeof(*cfm));
+
+	return error;
+};
+
+int aicwf_send_get_sta_info_req(struct aicwf_hw *aicwf_hw, u8 sta_idx,
+				struct mm_get_sta_info_cfm *cfm)
+{
+	struct mm_get_sta_info_req *get_info_req;
+	int error;
+
+	/* Build the MM_GET_STA_INFO_REQ message */
+	get_info_req =3D aicwf_msg_zalloc(aicwf_hw, MM_GET_STA_INFO_REQ, TASK_MM,=
 DRV_TASK_ID,
+					sizeof(struct mm_get_sta_info_req));
+
+	if (!get_info_req)
+		return -ENOMEM;
+
+	get_info_req->sta_idx =3D sta_idx;
+
+	/* Send the MM_GET_STA_INFO_REQ  message to UMAC FW */
+	error =3D aicwf_send_msg(aicwf_hw, get_info_req, 1, MM_GET_STA_INFO_CFM, =
cfm, sizeof(*cfm));
+
+	return error;
+};
+
+int aicwf_send_set_stack_start_req(struct aicwf_hw *aicwf_hw, u8 on,
+				   u8 efuse_valid, u8 set_vendor_info,
+				   u8 fwtrace_redir_en,
+				   struct mm_set_stack_start_cfm *cfm)
+{
+	struct mm_set_stack_start_req *req;
+	int error;
+
+	/* Build the MM_SET_STACK_START_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, MM_SET_STACK_START_REQ, TASK_MM, DRV_T=
ASK_ID,
+			       sizeof(struct mm_set_stack_start_req));
+
+	if (!req)
+		return -ENOMEM;
+
+	req->is_stack_start =3D on;
+	req->efuse_valid =3D efuse_valid;
+	req->set_vendor_info =3D set_vendor_info;
+	req->fwtrace_redir =3D fwtrace_redir_en;
+	/* Send the MM_SET_STACK_START_REQ  message to UMAC FW */
+	error =3D aicwf_send_msg(aicwf_hw, req, 1, MM_SET_STACK_START_CFM, cfm, s=
izeof(*cfm));
+
+	return error;
+}
+
+int aicwf_send_get_temp_req(struct aicwf_hw *aicwf_hw,
+			    struct mm_set_vendor_swconfig_cfm *cfm)
+{
+	struct mm_set_vendor_swconfig_req *req;
+	int ret;
+
+	/* Build the TEMP_COMP_GET_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, MM_SET_VENDOR_SWCONFIG_REQ, TASK_MM, D=
RV_TASK_ID,
+			       sizeof(struct mm_set_vendor_swconfig_req));
+	if (!req) {
+		dev_dbg(aicwf_hw->dev, "msg_alloc fail\n");
+		return -ENOMEM;
+	}
+	req->swconfig_id =3D TEMP_COMP_GET_REQ;
+
+	ret =3D aicwf_send_msg(aicwf_hw, req, 1, MM_SET_VENDOR_SWCONFIG_CFM, cfm,=
 sizeof(*cfm));
+	if (!ret) {
+		dev_dbg(aicwf_hw->dev, "status=3D%d, temp=3D%d\n", cfm->temp_comp_get_cf=
m.status,
+			cfm->temp_comp_get_cfm.degree);
+	} else {
+		dev_dbg(aicwf_hw->dev, "msg_fail\n");
+		return ret;
+	}
+#ifdef CONFIG_AIC8800_TEMP_CONTROL
+	// aicwf_hw->started_jiffies =3D jiffies;
+	aicwf_hw->temp =3D cfm->temp_comp_get_cfm.degree;
+#endif
+
+	return ret;
+}
+
+int aicwf_send_set_temp_comp_req(struct aicwf_hw *aicwf_hw,
+				 struct mm_set_vendor_swconfig_cfm *cfm)
+{
+	struct mm_set_vendor_swconfig_req *req;
+	int ret;
+
+	/* Build the TEMP_COMP_SET_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, MM_SET_VENDOR_SWCONFIG_REQ, TASK_MM, D=
RV_TASK_ID,
+			       sizeof(struct mm_set_vendor_swconfig_req));
+	if (!req) {
+		dev_err(aicwf_hw->dev, "msg_alloc fail\n");
+		return -ENOMEM;
+	}
+	req->swconfig_id =3D TEMP_COMP_SET_REQ;
+	req->temp_comp_set_req.enable =3D 1;
+#ifdef CONFIG_AIC8800_TEMP_CONTROL
+	req->temp_comp_set_req.tmr_period_ms =3D TEMP_GET_INTERVAL;
+#else
+	req->temp_comp_set_req.tmr_period_ms =3D 15 * 1000;
+#endif
+
+	ret =3D aicwf_send_msg(aicwf_hw, req, 1, MM_SET_VENDOR_SWCONFIG_CFM, cfm,=
 sizeof(*cfm));
+	if (!ret) {
+		dev_dbg(aicwf_hw->dev, "temp_comp status: %d\n", cfm->temp_comp_set_cfm.=
status);
+	} else {
+		dev_dbg(aicwf_hw->dev, "msg_fail\n");
+		return ret;
+	}
+	return ret;
+}
+
+int aicwf_send_get_fw_version_req(struct aicwf_hw *aicwf_hw,
+				  struct mm_get_fw_version_cfm *cfm)
+{
+	void *req;
+	int error;
+
+	/* Build the MM_GET_FW_VERSION_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, MM_GET_FW_VERSION_REQ, TASK_MM, DRV_TA=
SK_ID,
+			       sizeof(u8));
+
+	if (!req)
+		return -ENOMEM;
+
+	/* Send the MM_GET_FW_VERSION_REQ  message to UMAC FW */
+	error =3D aicwf_send_msg(aicwf_hw, req, 1, MM_GET_FW_VERSION_CFM, cfm, si=
zeof(*cfm));
+
+	return error;
+}
+
+int aicwf_send_txpwr_lvl_v3_req(struct aicwf_hw *aicwf_hw, int index_reg)
+{
+	struct mm_set_txpwr_lvl_req *txpwr_lvl_req;
+	struct txpwr_lvl_conf_v3 txpwr_lvl_v3_tmp;
+	struct txpwr_lvl_conf_v3 *txpwr_lvl_v3;
+	struct txpwr_loss_conf txpwr_loss_tmp;
+	struct txpwr_loss_conf *txpwr_loss;
+	int error;
+	int i;
+
+	/* Build the MM_SET_TXPWR_LVL_REQ message */
+	txpwr_lvl_req =3D
+		aicwf_msg_zalloc(aicwf_hw, MM_SET_TXPWR_IDX_LVL_REQ, TASK_MM, DRV_TASK_I=
D,
+				 sizeof(struct mm_set_txpwr_lvl_req));
+
+	if (!txpwr_lvl_req)
+		return -ENOMEM;
+
+	txpwr_lvl_v3 =3D &txpwr_lvl_v3_tmp;
+	txpwr_loss =3D &txpwr_loss_tmp;
+	txpwr_loss->loss_enable_2g4 =3D 0;
+	txpwr_loss->loss_enable_5g =3D 0;
+
+	//get_userconfig_txpwr_lvl_v3_in_fdrv(txpwr_lvl_v3);
+	get_userconfig_txpwr_lvl_group_in_fdrv(aicwf_hw, txpwr_lvl_v3, index_reg)=
;
+	get_userconfig_txpwr_loss(aicwf_hw, txpwr_loss);
+
+	if (txpwr_loss->loss_enable_2g4 =3D=3D 1) {
+		dev_dbg(aicwf_hw->dev, "loss_value_2g4: %d\n",
+			txpwr_loss->loss_value_2g4);
+
+		for (i =3D 0; i <=3D 11; i++)
+			txpwr_lvl_v3->pwrlvl_11b_11ag_2g4[i] -=3D txpwr_loss->loss_value_2g4;
+		for (i =3D 0; i <=3D 9; i++)
+			txpwr_lvl_v3->pwrlvl_11n_11ac_2g4[i] -=3D txpwr_loss->loss_value_2g4;
+		for (i =3D 0; i <=3D 11; i++)
+			txpwr_lvl_v3->pwrlvl_11ax_2g4[i] -=3D txpwr_loss->loss_value_2g4;
+	}
+
+	if (txpwr_loss->loss_enable_5g =3D=3D 1) {
+		dev_dbg(aicwf_hw->dev, "loss_value_5g: %d\n",
+			txpwr_loss->loss_value_5g);
+
+		for (i =3D 0; i <=3D 11; i++)
+			txpwr_lvl_v3->pwrlvl_11a_5g[i] -=3D txpwr_loss->loss_value_5g;
+		for (i =3D 0; i <=3D 9; i++)
+			txpwr_lvl_v3->pwrlvl_11n_11ac_5g[i] -=3D txpwr_loss->loss_value_5g;
+		for (i =3D 0; i <=3D 11; i++)
+			txpwr_lvl_v3->pwrlvl_11ax_5g[i] -=3D txpwr_loss->loss_value_5g;
+	}
+
+	if (txpwr_lvl_v3->enable =3D=3D 0) {
+		aicwf_msg_free(aicwf_hw, txpwr_lvl_req);
+		return 0;
+	}
+
+	dev_dbg(aicwf_hw->dev, "dump\n");
+	dev_dbg(aicwf_hw->dev, "txpwr_lvl_v3->enable: %d\n", txpwr_lvl_v3->enable=
);
+	dev_dbg(aicwf_hw->dev, "lvl_11b_11ag_1m_2g4:%d\n",
+		txpwr_lvl_v3->pwrlvl_11b_11ag_2g4[0]);
+
+	txpwr_lvl_req->txpwr_lvl_v3 =3D *txpwr_lvl_v3;
+
+	/* Send the MM_SET_TXPWR_LVL_REQ message to UMAC FW */
+	error =3D aicwf_send_msg(aicwf_hw, txpwr_lvl_req, 1,
+			       MM_SET_TXPWR_IDX_LVL_CFM, NULL, 0);
+
+	return error;
+}
+
+int aicwf_send_txpwr_lvl_adj_req(struct aicwf_hw *aicwf_hw)
+{
+	struct mm_set_txpwr_lvl_adj_req *txpwr_lvl_adj_req;
+	struct txpwr_lvl_adj_conf txpwr_lvl_adj_tmp;
+	struct txpwr_lvl_adj_conf *txpwr_lvl_adj;
+	int error;
+
+	/* Build the MM_SET_TXPWR_LVL_REQ message */
+	txpwr_lvl_adj_req =3D
+		aicwf_msg_zalloc(aicwf_hw, MM_SET_TXPWR_LVL_ADJ_REQ, TASK_MM, DRV_TASK_I=
D,
+				 sizeof(struct mm_set_txpwr_lvl_adj_req));
+
+	if (!txpwr_lvl_adj_req)
+		return -ENOMEM;
+
+	txpwr_lvl_adj =3D &txpwr_lvl_adj_tmp;
+
+	get_userconfig_txpwr_lvl_adj_in_fdrv(aicwf_hw, txpwr_lvl_adj);
+
+	if (txpwr_lvl_adj->enable =3D=3D 0) {
+		aicwf_msg_free(aicwf_hw, txpwr_lvl_adj_req);
+		return 0;
+	}
+
+	dev_dbg(aicwf_hw->dev, "enable:%d\n", txpwr_lvl_adj->enable);
+	dev_dbg(aicwf_hw->dev, "lvl_adj_2g4_chan_1_4:%d\n",
+		txpwr_lvl_adj->pwrlvl_adj_tbl_2g4[0]);
+	dev_dbg(aicwf_hw->dev, "lvl_adj_2g4_chan_5_9:%d\n",
+		txpwr_lvl_adj->pwrlvl_adj_tbl_2g4[1]);
+	dev_dbg(aicwf_hw->dev, "lvl_adj_2g4_chan_10_13:%d\n",
+		txpwr_lvl_adj->pwrlvl_adj_tbl_2g4[2]);
+	dev_dbg(aicwf_hw->dev, "lvl_adj_5g_chan_42:%d\n",
+		txpwr_lvl_adj->pwrlvl_adj_tbl_5g[0]);
+	dev_dbg(aicwf_hw->dev, "lvl_adj_5g_chan_58:%d\n",
+		txpwr_lvl_adj->pwrlvl_adj_tbl_5g[1]);
+	dev_dbg(aicwf_hw->dev, "lvl_adj_5g_chan_106:%d\n",
+		txpwr_lvl_adj->pwrlvl_adj_tbl_5g[2]);
+	dev_dbg(aicwf_hw->dev, "lvl_adj_5g_chan_122:%d\n",
+		txpwr_lvl_adj->pwrlvl_adj_tbl_5g[3]);
+	dev_dbg(aicwf_hw->dev, "lvl_adj_5g_chan_138:%d\n",
+		txpwr_lvl_adj->pwrlvl_adj_tbl_5g[4]);
+	dev_dbg(aicwf_hw->dev, "lvl_adj_5g_chan_155:%d\n",
+		txpwr_lvl_adj->pwrlvl_adj_tbl_5g[5]);
+
+	txpwr_lvl_adj_req->txpwr_lvl_adj =3D *txpwr_lvl_adj;
+
+	/* Send the MM_SET_TXPWR_LVL_REQ message to UMAC FW */
+	error =3D aicwf_send_msg(aicwf_hw, txpwr_lvl_adj_req, 1,
+			       MM_SET_TXPWR_LVL_ADJ_CFM, NULL, 0);
+
+	return error;
+}
+
+int aicwf_send_txpwr_ofst2x_req(struct aicwf_hw *aicwf_hw)
+{
+	struct mm_set_txpwr_ofst_req *txpwr_ofst_req;
+	struct txpwr_ofst2x_conf *txpwr_ofst2x;
+	int error =3D 0;
+	int type, ch_grp;
+
+	/* Build the MM_SET_TXPWR_OFST_REQ message */
+	txpwr_ofst_req =3D
+		aicwf_msg_zalloc(aicwf_hw, MM_SET_TXPWR_OFST_REQ, TASK_MM, DRV_TASK_ID,
+				 sizeof(struct mm_set_txpwr_ofst_req));
+
+	if (!txpwr_ofst_req)
+		return -ENOMEM;
+
+	txpwr_ofst2x =3D &txpwr_ofst_req->txpwr_ofst2x;
+	txpwr_ofst2x->enable =3D 0;
+	for (type =3D 0; type < 3; type++) {
+		for (ch_grp =3D 0; ch_grp < 6; ch_grp++) {
+			if (ch_grp < 3)
+				txpwr_ofst2x->pwrofst2x_tbl_2g4[type][ch_grp] =3D 0;
+			txpwr_ofst2x->pwrofst2x_tbl_5g[type][ch_grp] =3D 0;
+		}
+	}
+
+	aic_chip_get_userconfig_txpwr_ofst2x(aicwf_hw, txpwr_ofst2x);
+
+	if (txpwr_ofst2x->enable) {
+		dev_dbg(aicwf_hw->dev, "enable:%d\n", txpwr_ofst2x->enable);
+		dev_dbg(aicwf_hw->dev, "pwrofst2x 2.4g: [0]:11b, [1]:ofdm_highrate, [2]:=
ofdm_lowrate\n  chan=3D\t1-4\t5-9\t10-13");
+		for (type =3D 0; type < 3; type++) {
+			dev_dbg(aicwf_hw->dev, "\n  [%d] =3D", type);
+			for (ch_grp =3D 0; ch_grp < 3; ch_grp++) {
+				dev_dbg(aicwf_hw->dev, "\t%d",
+					txpwr_ofst2x->pwrofst2x_tbl_2g4[type][ch_grp]);
+			}
+		}
+		dev_dbg(aicwf_hw->dev, "\npwrofst2x 5g: [0]:ofdm_lowrate, [1]:ofdm_highr=
ate, [2]:ofdm_midrate\n  chan=3D\t36-50\t51-64\t98-114\t115-130\t131-146\t1=
47-166");
+		for (type =3D 0; type < 3; type++) {
+			dev_dbg(aicwf_hw->dev, "\n  [%d] =3D", type);
+			for (ch_grp =3D 0; ch_grp < 6; ch_grp++)
+				dev_dbg(aicwf_hw->dev, "\t%d",
+					txpwr_ofst2x->pwrofst2x_tbl_5g[type][ch_grp]);
+		}
+		dev_dbg(aicwf_hw->dev, "\n");
+
+		/* Send the MM_SET_TXPWR_OFST_REQ message to UMAC FW */
+		error =3D aicwf_send_msg(aicwf_hw, txpwr_ofst_req, 1, MM_SET_TXPWR_OFST_=
CFM,
+				       NULL, 0);
+	} else {
+		dev_dbg(aicwf_hw->dev, "do not use txpwr_ofst2x\n");
+		aicwf_msg_free(aicwf_hw, txpwr_ofst_req);
+	}
+
+	return error;
+}
+
+/*************************************************************************=
*****
+ *    Control messages handling functions (FULLMAC only)
+ *************************************************************************=
****/
+#ifdef CONFIG_AICWF_FULLMAC
+int aicwf_send_me_config_req(struct aicwf_hw *aicwf_hw)
+{
+	struct me_config_req *req;
+	struct wiphy *wiphy =3D aicwf_hw->wiphy;
+	struct ieee80211_supported_band *band_2ghz =3D
+		wiphy->bands[NL80211_BAND_2GHZ];
+	struct ieee80211_sta_ht_cap *ht_cap;
+	struct ieee80211_sta_vht_cap *vht_cap;
+	struct ieee80211_sta_he_cap const *he_cap =3D NULL;
+
+	u8 *ht_mcs;
+	int i;
+
+	if (aicwf_hw->chip_ops->use_80_bandwidth)
+		aicwf_hw->mod_params->use_80 =3D true;
+
+	if (aicwf_hw->band_5g_support) {
+		ht_cap =3D &wiphy->bands[NL80211_BAND_5GHZ]->ht_cap;
+		vht_cap =3D &wiphy->bands[NL80211_BAND_5GHZ]->vht_cap;
+	} else {
+		ht_cap =3D &wiphy->bands[NL80211_BAND_2GHZ]->ht_cap;
+		vht_cap =3D &wiphy->bands[NL80211_BAND_2GHZ]->vht_cap;
+	}
+
+	ht_mcs =3D (u8 *)&ht_cap->mcs;
+
+	/* Build the ME_CONFIG_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, ME_CONFIG_REQ, TASK_ME, DRV_TASK_ID,
+			       sizeof(struct me_config_req));
+	if (!req)
+		return -ENOMEM;
+
+	/* Set parameters for the ME_CONFIG_REQ message */
+	req->ht_supp =3D ht_cap->ht_supported;
+	req->vht_supp =3D vht_cap->vht_supported;
+	req->ht_cap.ht_capa_info =3D
+		cpu_to_le16(ht_cap->cap | IEEE80211_HT_CAP_LDPC_CODING);
+	req->ht_cap.a_mpdu_param =3D
+		ht_cap->ampdu_factor |
+		(ht_cap->ampdu_density << IEEE80211_HT_AMPDU_PARM_DENSITY_SHIFT);
+	for (i =3D 0; i < sizeof(ht_cap->mcs); i++)
+		req->ht_cap.mcs_rate[i] =3D ht_mcs[i];
+	req->ht_cap.ht_extended_capa =3D 0;
+	req->ht_cap.tx_beamforming_capa =3D 0;
+	req->ht_cap.asel_capa =3D 0;
+
+	if (req->vht_supp) {
+		req->vht_cap.vht_capa_info =3D cpu_to_le32(vht_cap->cap);
+		req->vht_cap.rx_highest =3D vht_cap->vht_mcs.rx_highest;
+		req->vht_cap.rx_mcs_map =3D vht_cap->vht_mcs.rx_mcs_map;
+		req->vht_cap.tx_highest =3D vht_cap->vht_mcs.tx_highest;
+		req->vht_cap.tx_mcs_map =3D vht_cap->vht_mcs.tx_mcs_map;
+	}
+
+	he_cap =3D ieee80211_get_he_iftype_cap(band_2ghz, NL80211_IFTYPE_STATION)=
;
+	if (he_cap) {
+		req->he_supp =3D he_cap->has_he;
+		for (i =3D 0; i < ARRAY_SIZE(he_cap->he_cap_elem.mac_cap_info); i++)
+			req->he_cap.mac_cap_info[i] =3D he_cap->he_cap_elem.mac_cap_info[i];
+
+		for (i =3D 0; i < ARRAY_SIZE(he_cap->he_cap_elem.phy_cap_info); i++)
+			req->he_cap.phy_cap_info[i] =3D he_cap->he_cap_elem.phy_cap_info[i];
+
+		req->he_cap.mcs_supp.rx_mcs_80 =3D he_cap->he_mcs_nss_supp.rx_mcs_80;
+		req->he_cap.mcs_supp.tx_mcs_80 =3D he_cap->he_mcs_nss_supp.tx_mcs_80;
+		req->he_cap.mcs_supp.rx_mcs_160 =3D he_cap->he_mcs_nss_supp.rx_mcs_160;
+		req->he_cap.mcs_supp.tx_mcs_160 =3D he_cap->he_mcs_nss_supp.tx_mcs_160;
+		req->he_cap.mcs_supp.rx_mcs_80p80 =3D
+			he_cap->he_mcs_nss_supp.rx_mcs_80p80;
+		req->he_cap.mcs_supp.tx_mcs_80p80 =3D
+			he_cap->he_mcs_nss_supp.tx_mcs_80p80;
+		for (i =3D 0; i < MAC_HE_PPE_THRES_MAX_LEN; i++)
+			req->he_cap.ppe_thres[i] =3D he_cap->ppe_thres[i];
+
+		req->he_ul_on =3D aicwf_hw->mod_params->he_ul_on;
+	}
+	req->ps_on =3D aicwf_hw->mod_params->ps_on;
+	req->dpsm =3D aicwf_hw->mod_params->dpsm;
+	req->tx_lft =3D aicwf_hw->mod_params->tx_lft;
+	req->ant_div_on =3D aicwf_hw->mod_params->ant_div;
+	if (aicwf_hw->mod_params->use_80)
+		req->phy_bw_max =3D PHY_CHNL_BW_80;
+	else if (aicwf_hw->mod_params->use_2040)
+		req->phy_bw_max =3D PHY_CHNL_BW_40;
+	else
+		req->phy_bw_max =3D PHY_CHNL_BW_20;
+
+	wiphy_info(wiphy, "HT supp %d, VHT supp %d, HE supp %d\n", req->ht_supp,
+		   req->vht_supp, req->he_supp);
+	/* Send the ME_CONFIG_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, ME_CONFIG_CFM, NULL, 0);
+}
+
+static int aicwf_send_me_chan_config(struct aicwf_hw *aicwf_hw)
+{
+	struct me_chan_config_req *req;
+	struct wiphy *wiphy =3D aicwf_hw->wiphy;
+	enum nl80211_band band;
+	int i;
+
+	for (band =3D NL80211_BAND_2GHZ; band <=3D NL80211_BAND_5GHZ; band++) {
+		struct ieee80211_supported_band *b =3D wiphy->bands[band];
+
+		if (!b)
+			continue;
+		for (i =3D 0; i < b->n_channels; i++) {
+			if (!(b->channels[i].flags & IEEE80211_CHAN_DISABLED) &&
+			    b->channels[i].max_power < S8_MIN)
+				return -ERANGE;
+		}
+	}
+
+	/* Build the ME_CHAN_CONFIG_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, ME_CHAN_CONFIG_REQ, TASK_ME, DRV_TASK_=
ID,
+			       sizeof(struct me_chan_config_req));
+	if (!req)
+		return -ENOMEM;
+
+	req->chan2G4_cnt =3D 0;
+	if (wiphy->bands[NL80211_BAND_2GHZ]) {
+		struct ieee80211_supported_band *b =3D wiphy->bands[NL80211_BAND_2GHZ];
+
+		for (i =3D 0; i < b->n_channels; i++) {
+			req->chan2G4[req->chan2G4_cnt].flags =3D
+				get_chan_flags(b->channels[i].flags);
+			req->chan2G4[req->chan2G4_cnt].band =3D NL80211_BAND_2GHZ;
+			req->chan2G4[req->chan2G4_cnt].freq =3D b->channels[i].center_freq;
+			req->chan2G4[req->chan2G4_cnt].tx_power =3D
+				chan_to_fw_pwr(aicwf_hw, b->channels[i].max_power);
+			req->chan2G4_cnt++;
+			if (req->chan2G4_cnt =3D=3D MAC_DOMAINCHANNEL_24G_MAX)
+				break;
+		}
+	}
+
+	req->chan5G_cnt =3D 0;
+	if (wiphy->bands[NL80211_BAND_5GHZ]) {
+		struct ieee80211_supported_band *b =3D wiphy->bands[NL80211_BAND_5GHZ];
+
+		for (i =3D 0; i < b->n_channels; i++) {
+			req->chan5G[req->chan5G_cnt].flags =3D
+				get_chan_flags(b->channels[i].flags);
+			req->chan5G[req->chan5G_cnt].band =3D NL80211_BAND_5GHZ;
+			req->chan5G[req->chan5G_cnt].freq =3D b->channels[i].center_freq;
+			req->chan5G[req->chan5G_cnt].tx_power =3D
+				chan_to_fw_pwr(aicwf_hw, b->channels[i].max_power);
+			req->chan5G_cnt++;
+			if (req->chan5G_cnt =3D=3D MAC_DOMAINCHANNEL_5G_MAX)
+				break;
+		}
+	}
+
+	/* Send the ME_CHAN_CONFIG_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, ME_CHAN_CONFIG_CFM, NULL, 0);
+}
+
+int aicwf_send_me_chan_config_req(struct aicwf_hw *aicwf_hw)
+{
+	int ret;
+
+	mutex_lock(&aicwf_hw->reg_lock);
+	if (READ_ONCE(aicwf_hw->regdom_failed)) {
+		ret =3D -EIO;
+		goto out;
+	}
+
+	/* The command queue can defer a request without waiting for its CFM. */
+	reinit_completion(&aicwf_hw->chan_config_complete);
+	ret =3D aicwf_send_me_chan_config(aicwf_hw);
+	if (!ret &&
+	    !wait_for_completion_timeout(&aicwf_hw->chan_config_complete,
+					 msecs_to_jiffies(AICWF_80211_CMD_TIMEOUT_MS)))
+		ret =3D -ETIMEDOUT;
+	if (ret) {
+		WRITE_ONCE(aicwf_hw->regdom_failed, true);
+		wiphy_err(aicwf_hw->wiphy,
+			  "Failed to apply channel limits: %d; reprobe required\n",
+			  ret);
+	}
+out:
+	mutex_unlock(&aicwf_hw->reg_lock);
+	return ret;
+}
+
+int aicwf_send_me_set_control_port_req(struct aicwf_hw *aicwf_hw, bool ope=
ned,
+				       u8 sta_idx)
+{
+	struct me_set_control_port_req *req;
+
+	/* Build the ME_SET_CONTROL_PORT_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, ME_SET_CONTROL_PORT_REQ, TASK_ME, DRV_=
TASK_ID,
+			       sizeof(struct me_set_control_port_req));
+	if (!req)
+		return -ENOMEM;
+
+	/* Set parameters for the ME_SET_CONTROL_PORT_REQ message */
+	req->sta_idx =3D sta_idx;
+	req->control_port_open =3D opened;
+
+	/* Send the ME_SET_CONTROL_PORT_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, ME_SET_CONTROL_PORT_CFM, NULL, 0)=
;
+}
+
+int aicwf_send_me_sta_add(struct aicwf_hw *aicwf_hw,
+			  struct station_parameters *params, const u8 *mac,
+			  u8 inst_nbr, struct me_sta_add_cfm *cfm)
+{
+	struct me_sta_add_req *req;
+	struct link_station_parameters *link_sta_params =3D &params->link_sta_par=
ams;
+	struct aicwf_vif *aicwf_vif =3D aicwf_hw->vif_table[inst_nbr];
+
+	u8 *ht_mcs =3D (u8 *)&link_sta_params->ht_capa->mcs;
+
+	int i;
+
+	/* Build the MM_STA_ADD_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, ME_STA_ADD_REQ, TASK_ME, DRV_TASK_ID,
+			       sizeof(struct me_sta_add_req));
+	if (!req)
+		return -ENOMEM;
+
+	/* Set parameters for the MM_STA_ADD_REQ message */
+	memcpy(&req->mac_addr.array[0], mac, ETH_ALEN);
+
+	req->rate_set.length =3D link_sta_params->supported_rates_len;
+	for (i =3D 0; i < link_sta_params->supported_rates_len; i++)
+		req->rate_set.array[i] =3D link_sta_params->supported_rates[i];
+
+	req->flags =3D 0;
+	if (link_sta_params->ht_capa) {
+		const struct ieee80211_ht_cap *ht_capa =3D link_sta_params->ht_capa;
+
+		req->flags |=3D STA_HT_CAPA;
+		req->ht_cap.ht_capa_info =3D ht_capa->cap_info;
+		req->ht_cap.a_mpdu_param =3D ht_capa->ampdu_params_info;
+		for (i =3D 0; i < sizeof(ht_capa->mcs); i++)
+			req->ht_cap.mcs_rate[i] =3D ht_mcs[i];
+		req->ht_cap.ht_extended_capa =3D ht_capa->extended_ht_cap_info;
+		req->ht_cap.tx_beamforming_capa =3D ht_capa->tx_BF_cap_info;
+		req->ht_cap.asel_capa =3D ht_capa->antenna_selection_info;
+	}
+
+	if (link_sta_params->vht_capa) {
+		const struct ieee80211_vht_cap *vht_capa =3D link_sta_params->vht_capa;
+
+		req->flags |=3D STA_VHT_CAPA;
+		req->vht_cap.vht_capa_info =3D vht_capa->vht_cap_info;
+		req->vht_cap.rx_highest =3D vht_capa->supp_mcs.rx_highest;
+		req->vht_cap.rx_mcs_map =3D vht_capa->supp_mcs.rx_mcs_map;
+		req->vht_cap.tx_highest =3D vht_capa->supp_mcs.tx_highest;
+		req->vht_cap.tx_mcs_map =3D vht_capa->supp_mcs.tx_mcs_map;
+	}
+
+	if (link_sta_params->he_capa) {
+		const struct ieee80211_he_cap_elem *he_capa =3D link_sta_params->he_capa=
;
+		struct ieee80211_he_mcs_nss_supp *mcs_nss_supp =3D
+			(struct ieee80211_he_mcs_nss_supp *)(he_capa + 1);
+
+		req->flags |=3D STA_HE_CAPA;
+		for (i =3D 0; i < ARRAY_SIZE(he_capa->mac_cap_info); i++)
+			req->he_cap.mac_cap_info[i] =3D he_capa->mac_cap_info[i];
+		for (i =3D 0; i < ARRAY_SIZE(he_capa->phy_cap_info); i++)
+			req->he_cap.phy_cap_info[i] =3D he_capa->phy_cap_info[i];
+		req->he_cap.mcs_supp.rx_mcs_80 =3D mcs_nss_supp->rx_mcs_80;
+		req->he_cap.mcs_supp.tx_mcs_80 =3D mcs_nss_supp->tx_mcs_80;
+		req->he_cap.mcs_supp.rx_mcs_160 =3D mcs_nss_supp->rx_mcs_160;
+		req->he_cap.mcs_supp.tx_mcs_160 =3D mcs_nss_supp->tx_mcs_160;
+		req->he_cap.mcs_supp.rx_mcs_80p80 =3D mcs_nss_supp->rx_mcs_80p80;
+		req->he_cap.mcs_supp.tx_mcs_80p80 =3D mcs_nss_supp->tx_mcs_80p80;
+	}
+
+	if (params->sta_flags_set & BIT(NL80211_STA_FLAG_WME))
+		req->flags |=3D STA_QOS_CAPA;
+
+	if (params->sta_flags_set & BIT(NL80211_STA_FLAG_MFP))
+		req->flags |=3D STA_MFP_CAPA;
+
+	if (link_sta_params->opmode_notif_used) {
+		req->flags |=3D STA_OPMOD_NOTIF;
+		req->opmode =3D link_sta_params->opmode_notif_used;
+	}
+
+	req->aid =3D cpu_to_le16(params->aid);
+	req->uapsd_queues =3D params->uapsd_queues;
+	req->max_sp_len =3D params->max_sp * 2;
+	req->vif_idx =3D inst_nbr;
+
+	if (params->sta_flags_set & BIT(NL80211_STA_FLAG_TDLS_PEER)) {
+		req->tdls_sta =3D true;
+		if ((params->ext_capab[3] & WLAN_EXT_CAPA4_TDLS_CHAN_SWITCH) &&
+		    !aicwf_vif->tdls_chsw_prohibited)
+			req->tdls_chsw_allowed =3D true;
+		if (aicwf_vif->tdls_status =3D=3D TDLS_SETUP_RSP_TX)
+			req->tdls_sta_initiator =3D true;
+	}
+
+	/* Send the ME_STA_ADD_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, ME_STA_ADD_CFM, cfm, sizeof(*cfm)=
);
+}
+
+int aicwf_send_me_sta_del(struct aicwf_hw *aicwf_hw, u8 sta_idx, bool tdls=
_sta)
+{
+	struct me_sta_del_req *req;
+
+	/* Build the MM_STA_DEL_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, ME_STA_DEL_REQ, TASK_ME, DRV_TASK_ID,
+			       sizeof(struct me_sta_del_req));
+	if (!req)
+		return -ENOMEM;
+
+	/* Set parameters for the MM_STA_DEL_REQ message */
+	req->sta_idx =3D sta_idx;
+	req->tdls_sta =3D tdls_sta;
+
+	/* Send the ME_STA_DEL_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, ME_STA_DEL_CFM, NULL, 0);
+}
+
+int aicwf_send_me_traffic_ind(struct aicwf_hw *aicwf_hw, u8 sta_idx, bool =
uapsd,
+			      u8 tx_status)
+{
+	struct me_traffic_ind_req *req;
+
+	/* Build the ME_UTRAFFIC_IND_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, ME_TRAFFIC_IND_REQ, TASK_ME, DRV_TASK_=
ID,
+			       sizeof(struct me_traffic_ind_req));
+	if (!req)
+		return -ENOMEM;
+
+	/* Set parameters for the ME_TRAFFIC_IND_REQ message */
+	req->sta_idx =3D sta_idx;
+	req->tx_avail =3D tx_status;
+	req->uapsd =3D uapsd;
+
+	/* Send the ME_TRAFFIC_IND_REQ to UMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, ME_TRAFFIC_IND_CFM, NULL, 0);
+}
+
+int aicwf_send_me_set_lp_level(struct aicwf_hw *aicwf_hw, u8 lp_level, u8 =
disable_filter)
+{
+	struct me_set_lp_level_req *req;
+
+	dev_dbg(aicwf_hw->dev, "lp_lvl: %d %d\n", lp_level, disable_filter);
+	/* Build the ME_SET_LP_LEVEL_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, ME_SET_LP_LEVEL_REQ, TASK_ME, DRV_TASK=
_ID,
+			       sizeof(struct me_set_lp_level_req));
+	if (!req)
+		return -ENOMEM;
+
+	/* Set parameters for the ME_SET_LP_LEVEL_REQ message */
+	req->lp_level =3D lp_level;
+	req->disable_filter =3D disable_filter;
+
+	/* Send the ME_SET_LP_LEVEL_REQ message to FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, ME_SET_LP_LEVEL_CFM, NULL, 0);
+}
+
+int aicwf_send_sm_connect_req(struct aicwf_hw *aicwf_hw, struct aicwf_vif =
*aicwf_vif,
+			      struct cfg80211_connect_params *sme,
+			      struct sm_connect_cfm *cfm)
+{
+	struct sm_connect_req *req;
+	int i;
+	u32 flags =3D 0;
+	bool gval =3D false;
+	bool pval =3D false;
+
+	if (READ_ONCE(aicwf_hw->regdom_failed))
+		return -EIO;
+
+	aicwf_vif->wep_enabled =3D false;
+	aicwf_vif->wep_auth_err =3D false;
+	aicwf_vif->last_auth_type =3D 0;
+
+	/* Build the SM_CONNECT_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, SM_CONNECT_REQ, TASK_SM, DRV_TASK_ID,
+			       sizeof(struct sm_connect_req));
+	if (!req)
+		return -ENOMEM;
+
+	if (sme->crypto.cipher_group =3D=3D WLAN_CIPHER_SUITE_WEP40 ||
+	    sme->crypto.cipher_group =3D=3D WLAN_CIPHER_SUITE_WEP104)
+		gval =3D true;
+
+	if (sme->crypto.n_ciphers_pairwise &&
+	    (sme->crypto.ciphers_pairwise[0] =3D=3D WLAN_CIPHER_SUITE_WEP40 ||
+	     sme->crypto.ciphers_pairwise[0] =3D=3D WLAN_CIPHER_SUITE_WEP104))
+		pval =3D true;
+
+	/* Set parameters for the SM_CONNECT_REQ message */
+	if (sme->crypto.n_ciphers_pairwise &&
+	    (sme->crypto.ciphers_pairwise[0] =3D=3D WLAN_CIPHER_SUITE_WEP40 ||
+	     sme->crypto.ciphers_pairwise[0] =3D=3D WLAN_CIPHER_SUITE_TKIP ||
+	     sme->crypto.ciphers_pairwise[0] =3D=3D WLAN_CIPHER_SUITE_WEP104))
+		flags |=3D DISABLE_HT;
+
+	if (sme->crypto.control_port)
+		flags |=3D CONTROL_PORT_HOST;
+
+	if (sme->crypto.control_port_no_encrypt)
+		flags |=3D CONTROL_PORT_NO_ENC;
+
+	if (use_pairwise_key(&sme->crypto))
+		flags |=3D WPA_WPA2_IN_USE;
+
+	if (sme->mfp =3D=3D NL80211_MFP_REQUIRED)
+		flags |=3D MFP_IN_USE;
+
+	if (aicwf_vif->sta.ap)
+		flags |=3D REASSOCIATION;
+
+	req->ctrl_port_ethertype =3D sme->crypto.control_port_ethertype;
+
+	if (sme->bssid)
+		memcpy(&req->bssid, sme->bssid, ETH_ALEN);
+	else
+		req->bssid =3D mac_addr_bcst;
+	req->vif_idx =3D aicwf_vif->vif_index;
+	if (sme->channel) {
+		req->chan.band =3D sme->channel->band;
+		req->chan.freq =3D sme->channel->center_freq;
+		req->chan.flags =3D get_chan_flags(sme->channel->flags);
+	} else {
+		req->chan.freq =3D (u16)-1;
+	}
+	if (sme->ssid_len > sizeof(aicwf_vif->sta.ssid))
+		goto invalid_param;
+
+	for (i =3D 0; i < sme->ssid_len; i++)
+		req->ssid.array[i] =3D sme->ssid[i];
+	req->ssid.length =3D sme->ssid_len;
+	req->flags =3D flags;
+	if (WARN_ON(sme->ie_len > sizeof(req->ie_buf)))
+		goto invalid_param;
+	if (sme->ie_len)
+		memcpy(req->ie_buf, sme->ie, sme->ie_len);
+	req->ie_len =3D sme->ie_len;
+	req->listen_interval =3D aicwf_mod_params.listen_itv;
+	req->dont_wait_bcmc =3D !aicwf_mod_params.listen_bcmc;
+
+	/* Set auth_type */
+	if (sme->auth_type =3D=3D NL80211_AUTHTYPE_AUTOMATIC)
+		req->auth_type =3D WLAN_AUTH_OPEN;
+	else if (sme->auth_type =3D=3D NL80211_AUTHTYPE_OPEN_SYSTEM)
+		req->auth_type =3D WLAN_AUTH_OPEN;
+	else if (sme->auth_type =3D=3D NL80211_AUTHTYPE_SHARED_KEY)
+		req->auth_type =3D WLAN_AUTH_SHARED_KEY;
+	else if (sme->auth_type =3D=3D NL80211_AUTHTYPE_FT)
+		req->auth_type =3D WLAN_AUTH_FT;
+	else if (sme->auth_type =3D=3D NL80211_AUTHTYPE_SAE)
+		req->auth_type =3D WLAN_AUTH_SAE;
+	else
+		goto invalid_param;
+
+	aicwf_vif->sta.auth_type =3D sme->auth_type;
+
+	/* Set UAPSD queues */
+	req->uapsd_queues =3D aicwf_mod_params.uapsd_queues;
+
+	aicwf_vif->wep_enabled =3D pval & gval;
+
+	if (aicwf_vif->wep_enabled)
+		aicwf_vif->last_auth_type =3D sme->auth_type;
+
+	memset(aicwf_vif->sta.ssid, 0, sizeof(aicwf_vif->sta.ssid));
+	memcpy(aicwf_vif->sta.ssid, sme->ssid, sme->ssid_len);
+	aicwf_vif->sta.ssid_len =3D sme->ssid_len;
+	if (sme->bssid)
+		memcpy(aicwf_vif->sta.bssid, sme->bssid, ETH_ALEN);
+
+	dev_dbg(aicwf_hw->dev,
+		"vif %d connect to %*pE channel %d auth_type %d\n",
+		aicwf_vif->drv_vif_index, aicwf_vif->sta.ssid_len,
+		aicwf_vif->sta.ssid, req->chan.freq, req->auth_type);
+
+	/* Send the SM_CONNECT_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, SM_CONNECT_CFM, cfm, sizeof(*cfm)=
);
+
+invalid_param:
+	aicwf_msg_free(aicwf_hw, req);
+	return -EINVAL;
+}
+
+int aicwf_send_sm_disconnect_req(struct aicwf_hw *aicwf_hw,
+				 struct aicwf_vif *aicwf_vif, u16 reason)
+{
+	struct sm_disconnect_req *req;
+
+	/* Build the SM_DISCONNECT_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, SM_DISCONNECT_REQ, TASK_SM, DRV_TASK_I=
D,
+			       sizeof(struct sm_disconnect_req));
+	if (!req)
+		return -ENOMEM;
+
+	/* Set parameters for the SM_DISCONNECT_REQ message */
+	req->reason_code =3D reason;
+	req->vif_idx =3D aicwf_vif->vif_index;
+
+	/* Send the SM_DISCONNECT_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, SM_DISCONNECT_CFM, NULL, 0);
+}
+
+int aicwf_send_sm_external_auth_required_rsp(struct aicwf_hw *aicwf_hw,
+					     struct aicwf_vif *aicwf_vif,
+					     u16 status)
+{
+	struct sm_external_auth_required_rsp *rsp;
+
+	/* Build the SM_EXTERNAL_AUTH_CFM message */
+	rsp =3D aicwf_msg_zalloc(aicwf_hw, SM_EXTERNAL_AUTH_REQUIRED_RSP, TASK_SM=
, DRV_TASK_ID,
+			       sizeof(struct sm_external_auth_required_rsp));
+	if (!rsp)
+		return -ENOMEM;
+
+	rsp->status =3D status;
+	rsp->vif_idx =3D aicwf_vif->vif_index;
+
+	/* send the SM_EXTERNAL_AUTH_REQUIRED_RSP message UMAC FW */
+	return aicwf_send_msg(aicwf_hw, rsp, 1, SM_EXTERNAL_AUTH_REQUIRED_RSP_CFM=
,
+			     NULL, 0);
+}
+
+int aicwf_send_apm_start_req(struct aicwf_hw *aicwf_hw, struct aicwf_vif *=
vif,
+			     struct cfg80211_ap_settings *settings,
+			     struct apm_start_cfm *cfm,
+			     struct aicwf_ipc_elem_var *elem)
+{
+	struct apm_start_req *req;
+	struct aicwf_bcn *bcn =3D &vif->ap.bcn;
+	u8 *buf;
+	u32 flags =3D 0;
+	const u8 *rate_ie;
+	u8 rate_len =3D 0;
+	int var_offset =3D offsetof(struct ieee80211_mgmt, u.beacon.variable);
+	const u8 *var_pos;
+	int len, i;
+
+	/* Build the APM_START_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, APM_START_REQ, TASK_APM, DRV_TASK_ID,
+			       sizeof(struct apm_start_req));
+	if (!req)
+		return -ENOMEM;
+
+	// Build the beacon
+	bcn->dtim =3D (u8)settings->dtim_period;
+	buf =3D aicwf_build_bcn(bcn, &settings->beacon);
+	if (!buf) {
+		aicwf_msg_free(aicwf_hw, req);
+		return -ENOMEM;
+	}
+
+	// Retrieve the basic rate set from the beacon buffer
+	len =3D bcn->len - var_offset;
+	var_pos =3D buf + var_offset;
+
+// Assume that rate higher that 54 Mbps are BSS membership
+
+	rate_ie =3D cfg80211_find_ie(WLAN_EID_SUPP_RATES, var_pos, len);
+	if (rate_ie) {
+		const u8 *rates =3D rate_ie + 2;
+		u8 rate1 =3D 0;
+		bool is_basic1;
+
+		for (i =3D 0; i < rate_ie[1] && rate_len < MAC_RATESET_LEN; i++) {
+			rate1 =3D rates[i];
+			is_basic1 =3D ((rate1 & 0x80) && ((rate1 & ~0x80) <=3D (54 * 2)));
+			if (is_basic1)
+				req->basic_rates.array[rate_len++] =3D rate1;
+		}
+	}
+	rate_ie =3D cfg80211_find_ie(WLAN_EID_EXT_SUPP_RATES, var_pos, len);
+	if (rate_ie) {
+		const u8 *rates =3D rate_ie + 2;
+		u8 rate2 =3D 0;
+		bool is_basic2;
+
+		for (i =3D 0; i < rate_ie[1] && rate_len < MAC_RATESET_LEN; i++) {
+			rate2 =3D rates[i];
+			is_basic2 =3D ((rate2 & 0x80) && ((rate2 & ~0x80) <=3D (54 * 2)));
+			if (is_basic2)
+				req->basic_rates.array[rate_len++] =3D rate2;
+		}
+	}
+	req->basic_rates.length =3D rate_len;
+
+	aicwf_send_bcn(aicwf_hw, buf, vif->vif_index, bcn->len);
+
+	/* Set parameters for the APM_START_REQ message */
+	req->vif_idx =3D vif->vif_index;
+	req->bcn_addr =3D elem->dma_addr;
+	req->bcn_len =3D bcn->len;
+	req->tim_oft =3D bcn->head_len;
+	req->tim_len =3D bcn->tim_len;
+	req->chan.band =3D settings->chandef.chan->band;
+	req->chan.freq =3D settings->chandef.chan->center_freq;
+	req->chan.flags =3D 0;
+	req->chan.tx_power =3D chan_to_fw_pwr(aicwf_hw, settings->chandef.chan->m=
ax_power);
+	req->center_freq1 =3D settings->chandef.center_freq1;
+	req->center_freq2 =3D settings->chandef.center_freq2;
+	req->ch_width =3D bw2chnl[settings->chandef.width];
+	req->bcn_int =3D settings->beacon_interval;
+
+	if (settings->crypto.control_port)
+		flags |=3D CONTROL_PORT_HOST;
+
+	if (settings->crypto.control_port_no_encrypt)
+		flags |=3D CONTROL_PORT_NO_ENC;
+
+	if (use_pairwise_key(&settings->crypto))
+		flags |=3D WPA_WPA2_IN_USE;
+
+	if (settings->crypto.control_port_ethertype)
+		req->ctrl_port_ethertype =3D settings->crypto.control_port_ethertype;
+	else
+		req->ctrl_port_ethertype =3D cpu_to_be16(ETH_P_PAE);
+	req->flags =3D flags;
+
+	/* Send the APM_START_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, APM_START_CFM, cfm, sizeof(*cfm))=
;
+}
+
+int aicwf_send_apm_stop_req(struct aicwf_hw *aicwf_hw, struct aicwf_vif *v=
if)
+{
+	struct apm_stop_req *req;
+
+	/* Build the APM_STOP_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, APM_STOP_REQ, TASK_APM, DRV_TASK_ID,
+			       sizeof(struct apm_stop_req));
+	if (!req)
+		return -ENOMEM;
+
+	/* Set parameters for the APM_STOP_REQ message */
+	req->vif_idx =3D vif->vif_index;
+
+	/* Send the APM_STOP_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, APM_STOP_CFM, NULL, 0);
+}
+
+#define P2P_WILDCARD_SSID     "DIRECT-"
+#define P2P_WILDCARD_SSID_LEN (sizeof(P2P_WILDCARD_SSID) - 1)
+
+#ifdef CONFIG_AIC8800_SET_VENDOR_EXTENSION_IE
+u8 vendor_extension_data[256];
+u8 vendor_extension_len;
+
+static void aicwf_insert_vendor_extension_data(struct scanu_vendor_ie_req =
*ie_req)
+{
+	u8 temp_ie[256];
+	u8 vendor_extension_subelement[3] =3D {0x00, 0x37, 0x2A};
+	u8 vendor_extension_id[2] =3D {0x10, 0x49};
+	int index =3D 0;
+	int vendor_extension_subelement_len =3D 0;
+
+	memset(temp_ie, 0, 256);
+
+	// find vendor_extension_subelement
+	for (index =3D 0; index < ie_req->add_ie_len; index++) {
+		if (ie_req->ie[index] =3D=3D vendor_extension_id[0]) {
+			index++;
+			if (index =3D=3D ie_req->add_ie_len)
+				return;
+
+			if (ie_req->ie[index] =3D=3D vendor_extension_id[1] &&
+			    ie_req->ie[index + 3] =3D=3D vendor_extension_subelement[0] &&
+			    ie_req->ie[index + 4] =3D=3D vendor_extension_subelement[1] &&
+			    ie_req->ie[index + 5] =3D=3D vendor_extension_subelement[2]) {
+				index =3D index + 2;
+				vendor_extension_subelement_len =3D ie_req->ie[index];
+				pr_debug("find vendor_extension_subelement,index:%d len:%d\n",
+					 index, ie_req->ie[index]);
+				break;
+			}
+		}
+	}
+	index =3D index + vendor_extension_subelement_len;
+
+	// insert vendor extension
+	memcpy(&temp_ie[0], ie_req->ie, index + 1);
+	memcpy(&temp_ie[index + 1], vendor_extension_data,
+	       vendor_extension_len /*sizeof(vendor_extension_data) */);
+	memcpy(&temp_ie[index + 1 +
+	       vendor_extension_len /*sizeof(vendor_extension_data) */],
+	       &ie_req->ie[index + 1], ie_req->add_ie_len - index);
+
+	memcpy(ie_req->ie, temp_ie,
+	       ie_req->add_ie_len +
+	       vendor_extension_len /*sizeof(vendor_extension_data) */);
+	ie_req->add_ie_len =3D
+		ie_req->add_ie_len +
+		vendor_extension_len /*sizeof(vendor_extension_data) */;
+	ie_req->ie[1] =3D
+		ie_req->ie[1] + vendor_extension_len /*sizeof(vendor_extension_data) */;
+
+	// ie_req->add_ie_len);
+}
+#endif // CONFIG_AIC8800_SET_VENDOR_EXTENSION_IE
+
+int aicwf_send_scanu_req(struct aicwf_hw *aicwf_hw, struct aicwf_vif *aicw=
f_vif,
+			 struct cfg80211_scan_request *param)
+{
+	struct scanu_start_req *req =3D NULL;
+	struct scanu_vendor_ie_req *ie_req =3D NULL;
+	struct mm_add_if_cfm add_if_cfm;
+	int i;
+	u8 chan_flags =3D 0;
+	int err;
+
+	if (READ_ONCE(aicwf_hw->regdom_failed))
+		return -EIO;
+
+	/* Build the SCANU_START_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, SCANU_START_REQ, TASK_SCANU, DRV_TASK_=
ID,
+			       sizeof(struct scanu_start_req));
+	if (!req)
+		return -ENOMEM;
+
+	/* Set parameters */
+	req->vif_idx =3D aicwf_vif->vif_index;
+	req->chan_cnt =3D (u8)min_t(int, SCAN_CHANNEL_MAX, param->n_channels);
+
+	req->ssid_cnt =3D (u8)min_t(int, SCAN_SSID_MAX, param->n_ssids);
+
+	req->bssid =3D mac_addr_bcst;
+	req->no_cck =3D param->no_cck;
+	if (param->duration_mandatory)
+		// req->duration =3D ieee80211_tu_to_usec(param->duration);
+		req->duration =3D 0;
+
+	if (req->ssid_cnt =3D=3D 0)
+		chan_flags |=3D CHAN_NO_IR;
+	for (i =3D 0; i < req->ssid_cnt; i++) {
+		int j;
+
+		for (j =3D 0; j < param->ssids[i].ssid_len; j++)
+			req->ssid[i].array[j] =3D param->ssids[i].ssid[j];
+		req->ssid[i].length =3D param->ssids[i].ssid_len;
+
+		if (!memcmp(P2P_WILDCARD_SSID, param->ssids[i].ssid,
+			    P2P_WILDCARD_SSID_LEN)) {
+			dev_dbg(aicwf_hw->dev, "p2p scanu:%d,%d,%d\n", aicwf_vif->vif_index,
+				aicwf_vif->is_p2p_vif, aicwf_hw->is_p2p_alive);
+#ifdef CONFIG_AIC8800_USE_P2P0
+			if (aicwf_vif->is_p2p_vif && !aicwf_hw->is_p2p_alive) {
+#else
+			if (aicwf_vif =3D=3D aicwf_hw->p2p_dev_vif && !aicwf_vif->up) {
+#endif
+				err =3D aicwf_send_add_if(aicwf_hw, aicwf_vif->wdev.address,
+							AICWF_VIF_TYPE(aicwf_vif), false,
+							&add_if_cfm);
+				if (err)
+					goto error;
+
+				if (add_if_cfm.status !=3D 0) {
+					err =3D -EIO;
+					goto error;
+				}
+
+				/* Save the index retrieved from LMAC */
+				spin_lock_bh(&aicwf_hw->cb_lock);
+				aicwf_vif->vif_index =3D add_if_cfm.inst_nbr;
+				aicwf_vif->up =3D true;
+				aicwf_hw->vif_started++;
+				aicwf_hw->vif_table[add_if_cfm.inst_nbr] =3D aicwf_vif;
+				spin_unlock_bh(&aicwf_hw->cb_lock);
+			}
+			aicwf_hw->is_p2p_alive =3D 1;
+#ifndef CONFIG_AIC8800_USE_P2P0
+			mod_timer(&aicwf_hw->p2p_alive_timer,
+				  jiffies + msecs_to_jiffies(1000));
+			atomic_set(&aicwf_hw->p2p_alive_timer_count, 0);
+#endif
+			dev_dbg(aicwf_hw->dev, "p2p scan start\n");
+		}
+	}
+
+	if (param->ie) {
+		ie_req =3D aicwf_msg_zalloc(aicwf_hw, SCANU_VENDOR_IE_REQ, TASK_SCANU, D=
RV_TASK_ID,
+					  sizeof(struct scanu_vendor_ie_req));
+		if (!ie_req) {
+			err =3D -ENOMEM;
+			goto error;
+		}
+
+		ie_req->add_ie_len =3D param->ie_len;
+		ie_req->vif_idx =3D aicwf_vif->vif_index;
+		memcpy(ie_req->ie, param->ie, param->ie_len);
+#ifdef CONFIG_AIC8800_SET_VENDOR_EXTENSION_IE
+		aicwf_insert_vendor_extension_data(ie_req);
+#endif // CONFIG_AIC8800_SET_VENDOR_EXTENSION_IE
+		req->add_ie_len =3D 0;
+		req->add_ies =3D 0;
+
+		err =3D aicwf_send_msg(aicwf_hw, ie_req, 1, SCANU_VENDOR_IE_CFM, NULL, 0=
);
+		ie_req =3D NULL;
+		if (err)
+			goto error;
+	} else {
+		req->add_ie_len =3D 0;
+		req->add_ies =3D 0;
+	}
+
+	for (i =3D 0; i < req->chan_cnt; i++) {
+		struct ieee80211_channel *chan =3D param->channels[i];
+
+		dev_dbg(aicwf_hw->dev, "scan channel:%d%d\n",
+			ieee80211_frequency_to_channel(chan->center_freq),
+			chan->center_freq);
+		req->chan[i].band =3D chan->band;
+		req->chan[i].freq =3D chan->center_freq;
+		req->chan[i].flags =3D chan_flags | get_chan_flags(chan->flags);
+		req->chan[i].tx_power =3D chan_to_fw_pwr(aicwf_hw, chan->max_power);
+	}
+
+	/* Send the SCANU_START_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, SCANU_START_CFM_ADDTIONAL, NULL, =
0);
+error:
+	if (req)
+		aicwf_msg_free(aicwf_hw, req);
+	if (ie_req)
+		aicwf_msg_free(aicwf_hw, ie_req);
+	return err;
+}
+
+int aicwf_send_scanu_cancel_req(struct aicwf_hw *aicwf_hw,
+				struct scan_cancel_cfm *cfm)
+{
+	struct scan_cancel_req *req;
+
+	/* Build the SCAN_CANCEL_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, SCANU_CANCEL_REQ, TASK_SCANU, DRV_TASK=
_ID,
+			       sizeof(struct scan_cancel_req));
+	if (!req)
+		return -ENOMEM;
+
+	/* Send the SCAN_CANCEL_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, SCANU_CANCEL_CFM, cfm, sizeof(*cf=
m));
+}
+
+int aicwf_send_apm_start_cac_req(struct aicwf_hw *aicwf_hw, struct aicwf_v=
if *vif,
+				 struct cfg80211_chan_def *chandef,
+				 struct apm_start_cac_cfm *cfm)
+{
+	struct apm_start_cac_req *req;
+
+	/* Build the APM_START_CAC_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, APM_START_CAC_REQ, TASK_APM, DRV_TASK_=
ID,
+			       sizeof(struct apm_start_cac_req));
+	if (!req)
+		return -ENOMEM;
+
+	/* Set parameters for the APM_START_CAC_REQ message */
+	req->vif_idx =3D vif->vif_index;
+	req->chan.band =3D chandef->chan->band;
+	req->chan.freq =3D chandef->chan->center_freq;
+	req->chan.flags =3D 0;
+	req->center_freq1 =3D chandef->center_freq1;
+	req->center_freq2 =3D chandef->center_freq2;
+	req->ch_width =3D bw2chnl[chandef->width];
+
+	/* Send the APM_START_CAC_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, APM_START_CAC_CFM, cfm, sizeof(*c=
fm));
+}
+
+int aicwf_send_apm_stop_cac_req(struct aicwf_hw *aicwf_hw, struct aicwf_vi=
f *vif)
+{
+	struct apm_stop_cac_req *req;
+
+	/* Build the APM_STOP_CAC_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, APM_STOP_CAC_REQ, TASK_APM, DRV_TASK_I=
D,
+			       sizeof(struct apm_stop_cac_req));
+	if (!req)
+		return -ENOMEM;
+
+	/* Set parameters for the APM_STOP_CAC_REQ message */
+	req->vif_idx =3D vif->vif_index;
+
+	/* Send the APM_STOP_CAC_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, APM_STOP_CAC_CFM, NULL, 0);
+}
+
+int aicwf_send_mesh_start_req(struct aicwf_hw *aicwf_hw, struct aicwf_vif =
*vif,
+			      const struct mesh_config *conf,
+			      const struct mesh_setup *setup,
+			      struct mesh_start_cfm *cfm)
+{
+	// Message to send
+	struct mesh_start_req *req;
+	// Supported basic rates
+	struct ieee80211_supported_band *band_2ghz =3D
+		aicwf_hw->wiphy->bands[NL80211_BAND_2GHZ];
+	/* Counter */
+	int i;
+	/* Return status */
+	int status;
+	/* DMA Address to be unmapped after confirmation reception */
+	u32 dma_addr =3D 0;
+
+	/* Build the MESH_START_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, MESH_START_REQ, TASK_MESH, DRV_TASK_ID=
,
+			       sizeof(struct mesh_start_req));
+	if (!req)
+		return -ENOMEM;
+
+	req->vif_index =3D vif->vif_index;
+	req->bcn_int =3D setup->beacon_interval;
+	req->dtim_period =3D setup->dtim_period;
+	req->mesh_id_len =3D setup->mesh_id_len;
+
+	for (i =3D 0; i < setup->mesh_id_len; i++)
+		req->mesh_id[i] =3D *(setup->mesh_id + i);
+
+	req->user_mpm =3D setup->user_mpm;
+	req->is_auth =3D setup->is_authenticated;
+	req->auth_id =3D setup->auth_id;
+	req->ie_len =3D setup->ie_len;
+
+	if (setup->ie_len) {
+		/*
+		 * Need to provide a Virtual Address to the MAC so that it can
+		 * download the additional information elements.
+		 */
+		req->ie_addr =3D dma_map_single(aicwf_hw->dev, (void *)setup->ie,
+					      setup->ie_len, DMA_FROM_DEVICE);
+
+		/* Check DMA mapping result */
+		if (dma_mapping_error(aicwf_hw->dev, req->ie_addr)) {
+			dev_dbg(aicwf_hw->dev, "- DMA Mapping error on additional IEs\n");
+
+			/* Consider there is no Additional IEs */
+			req->ie_len =3D 0;
+		} else {
+			/* Store DMA Address so that we can unmap the memory section
+			 * once MESH_START_CFM is received
+			 */
+			dma_addr =3D req->ie_addr;
+		}
+	}
+
+	/* Provide rate information */
+	req->basic_rates.length =3D 0;
+	for (i =3D 0; i < band_2ghz->n_bitrates; i++) {
+		u16 rate =3D band_2ghz->bitrates[i].bitrate;
+
+		/* Read value is in units of 100 Kbps, provided value is in units
+		 * of 1Mbps, and multiplied by 2 so that 5.5 becomes 11
+		 */
+		rate =3D (rate << 1) / 10;
+
+		if (setup->basic_rates & CO_BIT(i))
+			rate |=3D 0x80;
+
+		req->basic_rates.array[i] =3D (u8)rate;
+		req->basic_rates.length++;
+	}
+
+	/* Provide channel information */
+	req->chan.band =3D setup->chandef.chan->band;
+	req->chan.freq =3D setup->chandef.chan->center_freq;
+	req->chan.flags =3D 0;
+	req->chan.tx_power =3D chan_to_fw_pwr(aicwf_hw, setup->chandef.chan->max_=
power);
+	req->center_freq1 =3D setup->chandef.center_freq1;
+	req->center_freq2 =3D setup->chandef.center_freq2;
+	req->ch_width =3D bw2chnl[setup->chandef.width];
+
+	/* Send the MESH_START_REQ message to UMAC FW */
+	status =3D aicwf_send_msg(aicwf_hw, req, 1, MESH_START_CFM, cfm, sizeof(*=
cfm));
+
+	/* Unmap DMA area */
+	if (setup->ie_len)
+		dma_unmap_single(aicwf_hw->dev, dma_addr, setup->ie_len, DMA_TO_DEVICE);
+
+	/* Return the status */
+	return status;
+}
+
+int aicwf_send_mesh_stop_req(struct aicwf_hw *aicwf_hw, struct aicwf_vif *=
vif,
+			     struct mesh_stop_cfm *cfm)
+{
+	// Message to send
+	struct mesh_stop_req *req;
+
+	/* Build the MESH_STOP_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, MESH_STOP_REQ, TASK_MESH, DRV_TASK_ID,
+			       sizeof(struct mesh_stop_req));
+	if (!req)
+		return -ENOMEM;
+
+	req->vif_idx =3D vif->vif_index;
+
+	/* Send the MESH_STOP_REQ message to UMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, MESH_STOP_CFM, cfm, sizeof(*cfm))=
;
+}
+
+int aicwf_send_mesh_update_req(struct aicwf_hw *aicwf_hw, struct aicwf_vif=
 *vif,
+			       u32 mask, const struct mesh_config *p_mconf,
+			       struct mesh_update_cfm *cfm)
+{
+	// Message to send
+	struct mesh_update_req *req;
+	// Keep only bit for fields which can be updated
+	u32 supp_mask =3D (mask << 1) & (CO_BIT(NL80211_MESHCONF_GATE_ANNOUNCEMEN=
TS) |
+			CO_BIT(NL80211_MESHCONF_HWMP_ROOTMODE) |
+			CO_BIT(NL80211_MESHCONF_FORWARDING) |
+			CO_BIT(NL80211_MESHCONF_POWER_MODE));
+
+	if (!supp_mask)
+		return -ENOENT;
+
+	/* Build the MESH_UPDATE_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, MESH_UPDATE_REQ, TASK_MESH, DRV_TASK_I=
D,
+			       sizeof(struct mesh_update_req));
+
+	if (!req)
+		return -ENOMEM;
+
+	req->vif_idx =3D vif->vif_index;
+
+	if (supp_mask & CO_BIT(NL80211_MESHCONF_GATE_ANNOUNCEMENTS)) {
+		req->flags |=3D CO_BIT(MESH_UPDATE_FLAGS_GATE_MODE_BIT);
+		req->gate_announ =3D p_mconf->dot11MeshGateAnnouncementProtocol;
+	}
+
+	if (supp_mask & CO_BIT(NL80211_MESHCONF_HWMP_ROOTMODE)) {
+		req->flags |=3D CO_BIT(MESH_UPDATE_FLAGS_ROOT_MODE_BIT);
+		req->root_mode =3D p_mconf->dot11MeshHWMPRootMode;
+	}
+
+	if (supp_mask & CO_BIT(NL80211_MESHCONF_FORWARDING)) {
+		req->flags |=3D CO_BIT(MESH_UPDATE_FLAGS_MESH_FWD_BIT);
+		req->mesh_forward =3D p_mconf->dot11MeshForwarding;
+	}
+
+	if (supp_mask & CO_BIT(NL80211_MESHCONF_POWER_MODE)) {
+		req->flags |=3D CO_BIT(MESH_UPDATE_FLAGS_LOCAL_PSM_BIT);
+		req->local_ps_mode =3D p_mconf->power_mode;
+	}
+
+	/* Send the MESH_UPDATE_REQ message to UMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, MESH_UPDATE_CFM, cfm, sizeof(*cfm=
));
+}
+
+int aicwf_send_mesh_peer_info_req(struct aicwf_hw *aicwf_hw, struct aicwf_=
vif *vif,
+				  u8 sta_idx, struct mesh_peer_info_cfm *cfm)
+{
+	// Message to send
+	struct mesh_peer_info_req *req;
+
+	/* Build the MESH_PEER_INFO_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, MESH_PEER_INFO_REQ, TASK_MESH, DRV_TAS=
K_ID,
+			       sizeof(struct mesh_peer_info_req));
+	if (!req)
+		return -ENOMEM;
+
+	req->sta_idx =3D sta_idx;
+
+	/* Send the MESH_PEER_INFO_REQ message to UMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, MESH_PEER_INFO_CFM, cfm, sizeof(*=
cfm));
+}
+
+void aicwf_send_mesh_peer_update_ntf(struct aicwf_hw *aicwf_hw,
+				     struct aicwf_vif *vif, u8 sta_idx,
+				     u8 mlink_state)
+{
+	// Message to send
+	struct mesh_peer_update_ntf *ntf;
+
+	/* Build the MESH_PEER_UPDATE_NTF message */
+	ntf =3D aicwf_msg_zalloc(aicwf_hw, MESH_PEER_UPDATE_NTF, TASK_MESH, DRV_T=
ASK_ID,
+			       sizeof(struct mesh_peer_update_ntf));
+
+	if (ntf) {
+		ntf->vif_idx =3D vif->vif_index;
+		ntf->sta_idx =3D sta_idx;
+		ntf->state =3D mlink_state;
+
+		/* Send the MESH_PEER_INFO_REQ message to UMAC FW */
+		aicwf_send_msg(aicwf_hw, ntf, 0, 0, NULL, 0);
+	}
+}
+
+void aicwf_send_mesh_path_create_req(struct aicwf_hw *aicwf_hw,
+				     struct aicwf_vif *vif, u8 *tgt_addr)
+{
+	/* Check if we are already waiting for a confirmation */
+	if (!vif->ap.create_path) {
+		// Message to send
+		struct mesh_path_create_req *req;
+
+		/* Build the MESH_PATH_CREATE_REQ message */
+		req =3D aicwf_msg_zalloc(aicwf_hw, MESH_PATH_CREATE_REQ, TASK_MESH, DRV_=
TASK_ID,
+				       sizeof(struct mesh_path_create_req));
+
+		if (req) {
+			req->vif_idx =3D vif->vif_index;
+			memcpy(&req->tgt_mac_addr, tgt_addr, ETH_ALEN);
+
+			vif->ap.create_path =3D true;
+
+			/* Send the MESH_PATH_CREATE_REQ message to UMAC FW */
+			aicwf_send_msg(aicwf_hw, req, 0, 0, NULL, 0);
+		}
+	}
+}
+
+int aicwf_send_mesh_path_update_req(struct aicwf_hw *aicwf_hw,
+				    struct aicwf_vif *vif, const u8 *tgt_addr,
+				    const u8 *p_nhop_addr,
+				    struct mesh_path_update_cfm *cfm)
+{
+	// Message to send
+	struct mesh_path_update_req *req;
+
+	/* Build the MESH_PATH_UPDATE_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, MESH_PATH_UPDATE_REQ, TASK_MESH, DRV_T=
ASK_ID,
+			       sizeof(struct mesh_path_update_req));
+	if (!req)
+		return -ENOMEM;
+
+	req->delete =3D (!p_nhop_addr);
+	req->vif_idx =3D vif->vif_index;
+	memcpy(&req->tgt_mac_addr, tgt_addr, ETH_ALEN);
+
+	if (p_nhop_addr)
+		memcpy(&req->nhop_mac_addr, p_nhop_addr, ETH_ALEN);
+
+	/* Send the MESH_PATH_UPDATE_REQ message to UMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, MESH_PATH_UPDATE_CFM, cfm, sizeof=
(*cfm));
+}
+
+void aicwf_send_mesh_proxy_add_req(struct aicwf_hw *aicwf_hw, struct aicwf=
_vif *vif,
+				   u8 *ext_addr)
+{
+	// Message to send
+	struct mesh_proxy_add_req *req;
+
+	/* Build the MESH_PROXY_ADD_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, MESH_PROXY_ADD_REQ, TASK_MESH, DRV_TAS=
K_ID,
+			       sizeof(struct mesh_proxy_add_req));
+
+	if (req) {
+		req->vif_idx =3D vif->vif_index;
+		memcpy(&req->ext_sta_addr, ext_addr, ETH_ALEN);
+
+		/* Send the MESH_PROXY_ADD_REQ message to UMAC FW */
+		aicwf_send_msg(aicwf_hw, req, 0, 0, NULL, 0);
+	}
+}
+
+int aicwf_send_tdls_peer_traffic_ind_req(struct aicwf_hw *aicwf_hw,
+					 struct aicwf_vif *aicwf_vif)
+{
+	struct tdls_peer_traffic_ind_req *tdls_peer_traffic_ind_req;
+
+	if (!aicwf_vif->sta.tdls_sta)
+		return -ENOLINK;
+
+	/* Build the TDLS_PEER_TRAFFIC_IND_REQ message */
+	tdls_peer_traffic_ind_req =3D
+		aicwf_msg_zalloc(aicwf_hw, TDLS_PEER_TRAFFIC_IND_REQ, TASK_TDLS, DRV_TAS=
K_ID,
+				 sizeof(struct tdls_peer_traffic_ind_req));
+
+	if (!tdls_peer_traffic_ind_req)
+		return -ENOMEM;
+
+	/* Set parameters for the TDLS_PEER_TRAFFIC_IND_REQ message */
+	tdls_peer_traffic_ind_req->vif_index =3D aicwf_vif->vif_index;
+	tdls_peer_traffic_ind_req->sta_idx =3D aicwf_vif->sta.tdls_sta->sta_idx;
+	memcpy(&tdls_peer_traffic_ind_req->peer_mac_addr.array[0],
+	       aicwf_vif->sta.tdls_sta->mac_addr, ETH_ALEN);
+	tdls_peer_traffic_ind_req->dialog_token =3D 0; // check dialog token valu=
e
+	tdls_peer_traffic_ind_req->last_tid =3D aicwf_vif->sta.tdls_sta->tdls.las=
t_tid;
+	tdls_peer_traffic_ind_req->last_sn =3D aicwf_vif->sta.tdls_sta->tdls.last=
_sn;
+
+	/* Send the TDLS_PEER_TRAFFIC_IND_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, tdls_peer_traffic_ind_req, 0, 0, NULL, 0)=
;
+}
+
+int aicwf_send_config_monitor_req(struct aicwf_hw *aicwf_hw,
+				  struct cfg80211_chan_def *chandef,
+				  struct me_config_monitor_cfm *cfm)
+{
+	struct me_config_monitor_req *req;
+
+	/* Build the ME_CONFIG_MONITOR_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, ME_CONFIG_MONITOR_REQ, TASK_ME, DRV_TA=
SK_ID,
+			       sizeof(struct me_config_monitor_req));
+	if (!req)
+		return -ENOMEM;
+
+	if (chandef) {
+		req->chan_set =3D true;
+
+		req->chan.band =3D chandef->chan->band;
+		req->chan.type =3D bw2chnl[chandef->width];
+		req->chan.prim20_freq =3D chandef->chan->center_freq;
+		req->chan.center1_freq =3D chandef->center_freq1;
+		req->chan.center2_freq =3D chandef->center_freq2;
+		req->chan.tx_power =3D chan_to_fw_pwr(aicwf_hw, chandef->chan->max_power=
);
+
+		if (aicwf_hw->phy.limit_bw)
+			limit_chan_bw(&req->chan.type, req->chan.prim20_freq,
+				      &req->chan.center1_freq);
+	} else {
+		req->chan_set =3D false;
+	}
+
+	req->uf =3D aicwf_hw->mod_params->uf;
+	req->auto_reply =3D aicwf_hw->mod_params->auto_reply;
+
+	/* Send the ME_CONFIG_MONITOR_REQ message to FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, ME_CONFIG_MONITOR_CFM, cfm, sizeo=
f(*cfm));
+}
+#endif /* CONFIG_AICWF_FULLMAC */
+
+int aicwf_send_tdls_chan_switch_req(struct aicwf_hw *aicwf_hw,
+				    struct aicwf_vif *aicwf_vif,
+				    struct aicwf_sta *aicwf_sta,
+				    bool sta_initiator, u8 oper_class,
+				    struct cfg80211_chan_def *chandef,
+				    struct tdls_chan_switch_cfm *cfm)
+{
+	struct tdls_chan_switch_req *tdls_chan_switch_req;
+
+	/* Build the TDLS_CHAN_SWITCH_REQ message */
+	tdls_chan_switch_req =3D
+		aicwf_msg_zalloc(aicwf_hw, TDLS_CHAN_SWITCH_REQ, TASK_TDLS, DRV_TASK_ID,
+				 sizeof(struct tdls_chan_switch_req));
+
+	if (!tdls_chan_switch_req)
+		return -ENOMEM;
+
+	/* Set parameters for the TDLS_CHAN_SWITCH_REQ message */
+	tdls_chan_switch_req->vif_index =3D aicwf_vif->vif_index;
+	tdls_chan_switch_req->sta_idx =3D aicwf_sta->sta_idx;
+	memcpy(&tdls_chan_switch_req->peer_mac_addr.array[0],
+	       aicwf_sta_addr(aicwf_sta), ETH_ALEN);
+	tdls_chan_switch_req->initiator =3D sta_initiator;
+	tdls_chan_switch_req->band =3D chandef->chan->band;
+	tdls_chan_switch_req->type =3D bw2chnl[chandef->width];
+	tdls_chan_switch_req->prim20_freq =3D chandef->chan->center_freq;
+	tdls_chan_switch_req->center1_freq =3D chandef->center_freq1;
+	tdls_chan_switch_req->center2_freq =3D chandef->center_freq2;
+	tdls_chan_switch_req->tx_power =3D chan_to_fw_pwr(aicwf_hw, chandef->chan=
->max_power);
+	tdls_chan_switch_req->op_class =3D oper_class;
+
+	/* Send the TDLS_CHAN_SWITCH_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, tdls_chan_switch_req, 1, TDLS_CHAN_SWITCH=
_CFM,
+			     cfm, sizeof(*cfm));
+}
+
+int aicwf_send_tdls_cancel_chan_switch_req(struct aicwf_hw *aicwf_hw,
+					   struct aicwf_vif *aicwf_vif,
+					   struct aicwf_sta *aicwf_sta,
+					   struct tdls_cancel_chan_switch_cfm *cfm)
+{
+	struct tdls_cancel_chan_switch_req *tdls_cancel_chan_switch_req;
+
+	/* Build the TDLS_CHAN_SWITCH_REQ message */
+	tdls_cancel_chan_switch_req =3D
+		aicwf_msg_zalloc(aicwf_hw, TDLS_CANCEL_CHAN_SWITCH_REQ, TASK_TDLS, DRV_T=
ASK_ID,
+				 sizeof(struct tdls_cancel_chan_switch_req));
+	if (!tdls_cancel_chan_switch_req)
+		return -ENOMEM;
+
+	/* Set parameters for the TDLS_CHAN_SWITCH_REQ message */
+	tdls_cancel_chan_switch_req->vif_index =3D aicwf_vif->vif_index;
+	tdls_cancel_chan_switch_req->sta_idx =3D aicwf_sta->sta_idx;
+	memcpy(&tdls_cancel_chan_switch_req->peer_mac_addr.array[0],
+	       aicwf_sta_addr(aicwf_sta), ETH_ALEN);
+
+	/* Send the TDLS_CHAN_SWITCH_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, tdls_cancel_chan_switch_req, 1,
+			     TDLS_CANCEL_CHAN_SWITCH_CFM, cfm, sizeof(*cfm));
+}
+
+#ifdef CONFIG_AICWF_BFMER
+#ifdef CONFIG_AICWF_FULLMAC
+void aicwf_send_bfmer_enable(struct aicwf_hw *aicwf_hw, struct aicwf_sta *=
aicwf_sta,
+			     const struct ieee80211_vht_cap *vht_cap)
+#endif /* CONFIG_AICWF_FULLMAC */
+{
+	struct mm_bfmer_enable_req *bfmer_en_req;
+#ifdef CONFIG_AICWF_FULLMAC
+	u32 vht_capability;
+	u8 rx_nss =3D 0;
+#endif /* CONFIG_AICWF_FULLMAC */
+
+#ifdef CONFIG_AICWF_FULLMAC
+	if (!vht_cap) {
+#endif /* CONFIG_AICWF_FULLMAC */
+		goto end;
+	}
+
+#ifdef CONFIG_AICWF_FULLMAC
+	vht_capability =3D le32_to_cpu(vht_cap->vht_cap_info);
+#endif /* CONFIG_AICWF_FULLMAC */
+
+	if (!(vht_capability & IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE))
+		goto end;
+
+#ifdef CONFIG_AICWF_FULLMAC
+	rx_nss =3D aicwf_bfmer_get_rx_nss(vht_cap);
+#endif /* CONFIG_AICWF_FULLMAC */
+
+	/* Allocate a structure that will contain the beamforming report */
+	if (aicwf_bfmer_report_add(aicwf_hw, aicwf_sta,
+				   AICWF_BFMER_REPORT_SPACE_SIZE))
+		goto end;
+
+	/* Build the MM_BFMER_ENABLE_REQ message */
+	bfmer_en_req =3D aicwf_msg_zalloc(aicwf_hw, MM_BFMER_ENABLE_REQ, TASK_MM,=
 DRV_TASK_ID,
+					sizeof(struct mm_bfmer_enable_req));
+
+	/* Check message allocation */
+	if (!bfmer_en_req) {
+		/* Free memory allocated for the report */
+		aicwf_bfmer_report_del(aicwf_hw, aicwf_sta);
+		/* Do not use beamforming */
+		goto end;
+	}
+
+	/* Provide DMA address to the MAC */
+	bfmer_en_req->host_bfr_addr =3D aicwf_sta->bfm_report->dma_addr;
+	bfmer_en_req->host_bfr_size =3D AICWF_BFMER_REPORT_SPACE_SIZE;
+	bfmer_en_req->sta_idx =3D aicwf_sta->sta_idx;
+#ifdef CONFIG_AICWF_FULLMAC
+	bfmer_en_req->aid =3D aicwf_sta->aid;
+	bfmer_en_req->rx_nss =3D rx_nss;
+#endif /* CONFIG_AICWF_FULLMAC */
+
+	if (vht_capability & IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE)
+		bfmer_en_req->vht_mu_bfmee =3D true;
+	else
+		bfmer_en_req->vht_mu_bfmee =3D false;
+
+	/* Send the MM_BFMER_EN_REQ message to LMAC FW */
+	aicwf_send_msg(aicwf_hw, bfmer_en_req, 0, 0, NULL, 0);
+
+end:
+	return;
+}
+
+#ifdef CONFIG_AICWF_MUMIMO_TX
+int aicwf_send_mu_group_update_req(struct aicwf_hw *aicwf_hw,
+				   struct aicwf_sta *aicwf_sta)
+{
+	struct mm_mu_group_update_req *req;
+	int group_id, i =3D 0;
+	u64 map;
+
+	/* Build the MM_MU_GROUP_UPDATE_REQ message */
+	req =3D
+		aicwf_msg_zalloc(aicwf_hw, MM_MU_GROUP_UPDATE_REQ, TASK_MM, DRV_TASK_ID,
+				 sizeof(struct mm_mu_group_update_req) +
+				 aicwf_sta->group_info.cnt * sizeof(req->groups[0]));
+
+	/* Check message allocation */
+	if (!req)
+		return -ENOMEM;
+
+	map =3D aicwf_sta->group_info.map & AICWF_MU_GROUP_MASK;
+	for (group_id =3D (fls64(map) - 1); group_id > 0;
+	     map &=3D ~(u64)BIT_ULL(group_id), group_id =3D (fls64(map) - 1)) {
+		int user_pos =3D aicwf_mu_group_sta_get_pos(aicwf_hw, aicwf_sta, group_i=
d);
+
+		if (WARN(i >=3D aicwf_sta->group_info.cnt,
+			 "STA%d: Too much group %d\n", aicwf_sta->sta_idx, i + 1))
+			break;
+
+		req->groups[i].group_id =3D group_id;
+		req->groups[i].user_pos =3D user_pos;
+
+		i++;
+	}
+
+	req->group_cnt =3D aicwf_sta->group_info.cnt;
+	req->sta_idx =3D aicwf_sta->sta_idx;
+
+	/* Send the MM_MU_GROUP_UPDATE_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, MM_MU_GROUP_UPDATE_CFM, NULL, 0);
+}
+#endif /* CONFIG_AICWF_MUMIMO_TX */
+#endif /* CONFIG_AICWF_BFMER */
+
+int aicwf_send_dbg_mem_read_req(struct aicwf_hw *aicwf_hw, u32 mem_addr,
+				struct dbg_mem_read_cfm *cfm)
+{
+	struct dbg_mem_read_req *mem_read_req;
+
+	/* Build the DBG_MEM_READ_REQ message */
+	mem_read_req =3D aicwf_msg_zalloc(aicwf_hw, DBG_MEM_READ_REQ, TASK_DBG, D=
RV_TASK_ID,
+					sizeof(struct dbg_mem_read_req));
+	if (!mem_read_req)
+		return -ENOMEM;
+
+	/* Set parameters for the DBG_MEM_READ_REQ message */
+	mem_read_req->memaddr =3D mem_addr;
+
+	/* Send the DBG_MEM_READ_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, mem_read_req, 1, DBG_MEM_READ_CFM, cfm, s=
izeof(*cfm));
+}
+
+int aicwf_send_dbg_mem_write_req(struct aicwf_hw *aicwf_hw, u32 mem_addr,
+				 u32 mem_data)
+{
+	struct dbg_mem_write_req *mem_write_req;
+
+	/* Build the DBG_MEM_WRITE_REQ message */
+	mem_write_req =3D aicwf_msg_zalloc(aicwf_hw, DBG_MEM_WRITE_REQ, TASK_DBG,=
 DRV_TASK_ID,
+					 sizeof(struct dbg_mem_write_req));
+	if (!mem_write_req)
+		return -ENOMEM;
+
+	/* Set parameters for the DBG_MEM_WRITE_REQ message */
+	mem_write_req->memaddr =3D mem_addr;
+	mem_write_req->memdata =3D mem_data;
+
+	/* Send the DBG_MEM_WRITE_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, mem_write_req, 1, DBG_MEM_WRITE_CFM, NULL=
, 0);
+}
+
+int aicwf_send_dbg_mem_block_write_req(struct aicwf_hw *aicwf_hw, u32 mem_=
addr,
+				       u32 mem_size, u32 *mem_data)
+{
+	struct dbg_mem_block_write_req *mem_blk_write_req;
+
+	/* Build the DBG_MEM_BLOCK_WRITE_REQ message */
+	mem_blk_write_req =3D
+		aicwf_msg_zalloc(aicwf_hw, DBG_MEM_BLOCK_WRITE_REQ, TASK_DBG, DRV_TASK_I=
D,
+				 sizeof(struct dbg_mem_block_write_req));
+	if (!mem_blk_write_req)
+		return -ENOMEM;
+
+	/* Set parameters for the DBG_MEM_BLOCK_WRITE_REQ message */
+	mem_blk_write_req->memaddr =3D mem_addr;
+	mem_blk_write_req->memsize =3D mem_size;
+	memcpy(mem_blk_write_req->memdata, mem_data, mem_size);
+
+	/* Send the DBG_MEM_BLOCK_WRITE_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, mem_blk_write_req, 1, DBG_MEM_BLOCK_WRITE=
_CFM,
+			     NULL, 0);
+}
+
+int aicwf_send_dbg_start_app_req(struct aicwf_hw *aicwf_hw, u32 boot_addr,
+				 u32 boot_type)
+{
+	struct dbg_start_app_req *start_app_req;
+
+	/* Build the DBG_START_APP_REQ message */
+	start_app_req =3D aicwf_msg_zalloc(aicwf_hw, DBG_START_APP_REQ, TASK_DBG,=
 DRV_TASK_ID,
+					 sizeof(struct dbg_start_app_req));
+	if (!start_app_req)
+		return -ENOMEM;
+
+	/* Set parameters for the DBG_START_APP_REQ message */
+	start_app_req->bootaddr =3D boot_addr;
+	start_app_req->boottype =3D boot_type;
+
+	/* Send the DBG_START_APP_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, start_app_req, 1, DBG_START_APP_CFM, NULL=
, 0);
+}
+
+int aicwf_send_cfg_rssi_req(struct aicwf_hw *aicwf_hw, u8 vif_index,
+			    int rssi_thold, u32 rssi_hyst)
+{
+	struct mm_cfg_rssi_req *req;
+
+	/* Build the MM_CFG_RSSI_REQ message */
+	req =3D aicwf_msg_zalloc(aicwf_hw, MM_CFG_RSSI_REQ, TASK_MM, DRV_TASK_ID,
+			       sizeof(struct mm_cfg_rssi_req));
+	if (!req)
+		return -ENOMEM;
+
+	if (!aicwf_hw->vif_table[vif_index])
+		return 0;
+
+	/* Set parameters for the MM_CFG_RSSI_REQ message */
+	req->vif_index =3D vif_index;
+	req->rssi_thold =3D (s8)rssi_thold;
+	req->rssi_hyst =3D (u8)rssi_hyst;
+
+	/* Send the MM_CFG_RSSI_REQ message to LMAC FW */
+	return aicwf_send_msg(aicwf_hw, req, 1, MM_CFG_RSSI_CFM, NULL, 0);
+}
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_tx.h b/drivers=
/net/wireless/aic/aic8800_fdrv/aicwf_msg_tx.h
new file mode 100644
index 000000000000..1c3212be0be2
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_msg_tx.h
@@ -0,0 +1,201 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_MSG_TX_H_
+#define _AICWF_MSG_TX_H_
+
+#include "lmac_types.h"
+#include "aicwf_defs.h"
+
+int aicwf_send_reset(struct aicwf_hw *aicwf_hw);
+
+int aicwf_send_start(struct aicwf_hw *aicwf_hw);
+
+int aicwf_send_version_req(struct aicwf_hw *aicwf_hw, struct mm_version_cf=
m *cfm);
+
+int aicwf_send_add_if(struct aicwf_hw *aicwf_hw, const unsigned char *mac,
+		      enum nl80211_iftype iftype, bool p2p,
+		      struct mm_add_if_cfm *cfm);
+
+int aicwf_send_remove_if(struct aicwf_hw *aicwf_hw, u8 vif_index, bool def=
er);
+
+int aicwf_send_key_add(struct aicwf_hw *aicwf_hw, u8 vif_idx, u8 sta_idx,
+		       bool pairwise, u8 *key, u8 key_len, u8 key_idx,
+		       u8 cipher_suite, struct mm_key_add_cfm *cfm);
+
+int aicwf_send_key_del(struct aicwf_hw *aicwf_hw, uint8_t hw_key_idx);
+
+int aicwf_send_bcn(struct aicwf_hw *aicwf_hw, u8 *buf, u8 vif_idx, u16 bcn=
_len);
+
+int aicwf_send_bcn_change(struct aicwf_hw *aicwf_hw, u8 vif_idx, u32 bcn_a=
ddr,
+			  u16 bcn_len, u16 tim_oft, u16 tim_len, u16 *csa_oft);
+
+int aicwf_send_roc(struct aicwf_hw *aicwf_hw, struct aicwf_vif *vif,
+		   struct ieee80211_channel *chan, unsigned int duration,
+		   struct mm_remain_on_channel_cfm *roc_cfm);
+
+int aicwf_send_cancel_roc(struct aicwf_hw *aicwf_hw);
+
+int aicwf_send_set_edca(struct aicwf_hw *aicwf_hw, u8 hw_queue, u32 param,
+			bool uapsd, u8 inst_nbr);
+
+int aicwf_send_tdls_chan_switch_req(struct aicwf_hw *aicwf_hw,
+				    struct aicwf_vif *aicwf_vif,
+				    struct aicwf_sta *aicwf_sta,
+				    bool sta_initiator, u8 oper_class,
+				    struct cfg80211_chan_def *chandef,
+				    struct tdls_chan_switch_cfm *cfm);
+
+int aicwf_send_tdls_cancel_chan_switch_req(struct aicwf_hw *aicwf_hw, stru=
ct aicwf_vif *aicwf_vif,
+					   struct aicwf_sta *aicwf_sta,
+					   struct tdls_cancel_chan_switch_cfm *cfm);
+
+#ifdef CONFIG_AIC8800_ARP_OFFLOAD
+int aicwf_send_arpoffload_en_req(struct aicwf_hw *aicwf_hw,
+				 struct aicwf_vif *aicwf_vif, u32 ipaddr,
+				 u8 enable);
+#endif
+
+int aicwf_send_rf_calib_req(struct aicwf_hw *aicwf_hw,
+			    struct mm_set_rf_calib_cfm *cfm);
+
+int aicwf_send_get_macaddr_req(struct aicwf_hw *aicwf_hw,
+			       struct mm_get_mac_addr_cfm *cfm);
+
+#ifdef CONFIG_AICWF_FULLMAC
+int aicwf_send_me_config_req(struct aicwf_hw *aicwf_hw);
+
+int aicwf_send_me_chan_config_req(struct aicwf_hw *aicwf_hw);
+
+int aicwf_send_me_set_control_port_req(struct aicwf_hw *aicwf_hw, bool ope=
ned,
+				       u8 sta_idx);
+
+int aicwf_send_me_sta_add(struct aicwf_hw *aicwf_hw,
+			  struct station_parameters *params, const u8 *mac,
+			  u8 inst_nbr, struct me_sta_add_cfm *cfm);
+
+int aicwf_send_me_sta_del(struct aicwf_hw *aicwf_hw, u8 sta_idx, bool tdls=
_sta);
+
+int aicwf_send_me_traffic_ind(struct aicwf_hw *aicwf_hw, u8 sta_idx, bool =
uapsd,
+			      u8 tx_status);
+
+int aicwf_send_me_set_lp_level(struct aicwf_hw *aicwf_hw, u8 lp_level, u8 =
disable_filter);
+
+int aicwf_send_sm_connect_req(struct aicwf_hw *aicwf_hw, struct aicwf_vif =
*aicwf_vif,
+			      struct cfg80211_connect_params *sme, struct sm_connect_cfm *cfm);
+
+int aicwf_send_sm_disconnect_req(struct aicwf_hw *aicwf_hw,
+				 struct aicwf_vif *aicwf_vif, u16 reason);
+
+int aicwf_send_sm_external_auth_required_rsp(struct aicwf_hw *aicwf_hw,
+					     struct aicwf_vif *aicwf_vif, u16 status);
+
+int aicwf_send_apm_start_req(struct aicwf_hw *aicwf_hw, struct aicwf_vif *=
vif,
+			     struct cfg80211_ap_settings *settings, struct apm_start_cfm *cfm,
+			     struct aicwf_ipc_elem_var *elem);
+
+int aicwf_send_apm_stop_req(struct aicwf_hw *aicwf_hw, struct aicwf_vif *v=
if);
+
+int aicwf_send_scanu_req(struct aicwf_hw *aicwf_hw, struct aicwf_vif *aicw=
f_vif,
+			 struct cfg80211_scan_request *param);
+
+int aicwf_send_scanu_cancel_req(struct aicwf_hw *aicwf_hw,
+				struct scan_cancel_cfm *cfm);
+
+int aicwf_send_apm_start_cac_req(struct aicwf_hw *aicwf_hw, struct aicwf_v=
if *vif,
+				 struct cfg80211_chan_def *chandef,
+				 struct apm_start_cac_cfm *cfm);
+
+int aicwf_send_apm_stop_cac_req(struct aicwf_hw *aicwf_hw, struct aicwf_vi=
f *vif);
+
+int aicwf_send_tdls_peer_traffic_ind_req(struct aicwf_hw *aicwf_hw,
+					 struct aicwf_vif *aicwf_vif);
+
+int aicwf_send_config_monitor_req(struct aicwf_hw *aicwf_hw,
+				  struct cfg80211_chan_def *chandef,
+				  struct me_config_monitor_cfm *cfm);
+
+int aicwf_send_mesh_start_req(struct aicwf_hw *aicwf_hw, struct aicwf_vif =
*vif,
+			      const struct mesh_config *conf, const struct mesh_setup *setup,
+			      struct mesh_start_cfm *cfm);
+
+int aicwf_send_mesh_stop_req(struct aicwf_hw *aicwf_hw, struct aicwf_vif *=
vif,
+			     struct mesh_stop_cfm *cfm);
+
+int aicwf_send_mesh_update_req(struct aicwf_hw *aicwf_hw, struct aicwf_vif=
 *vif,
+			       u32 mask, const struct mesh_config *p_mconf,
+			       struct mesh_update_cfm *cfm);
+
+int aicwf_send_mesh_peer_info_req(struct aicwf_hw *aicwf_hw, struct aicwf_=
vif *vif,
+				  u8 sta_idx, struct mesh_peer_info_cfm *cfm);
+
+void aicwf_send_mesh_peer_update_ntf(struct aicwf_hw *aicwf_hw,
+				     struct aicwf_vif *vif, u8 sta_idx,
+				     u8 mlink_state);
+
+void aicwf_send_mesh_path_create_req(struct aicwf_hw *aicwf_hw,
+				     struct aicwf_vif *vif, u8 *tgt_addr);
+
+int aicwf_send_mesh_path_update_req(struct aicwf_hw *aicwf_hw,
+				    struct aicwf_vif *vif, const u8 *tgt_addr,
+				    const u8 *p_nhop_addr,
+				    struct mesh_path_update_cfm *cfm);
+
+void aicwf_send_mesh_proxy_add_req(struct aicwf_hw *aicwf_hw, struct aicwf=
_vif *vif,
+				   u8 *ext_addr);
+
+#endif /* CONFIG_AICWF_FULLMAC */
+
+#ifdef CONFIG_AICWF_BFMER
+#ifdef CONFIG_AICWF_FULLMAC
+void aicwf_send_bfmer_enable(struct aicwf_hw *aicwf_hw, struct aicwf_sta *=
aicwf_sta,
+			     const struct ieee80211_vht_cap *vht_cap);
+
+#endif /* CONFIG_AICWF_FULLMAC */
+#ifdef CONFIG_AICWF_MUMIMO_TX
+int aicwf_send_mu_group_update_req(struct aicwf_hw *aicwf_hw,
+				   struct aicwf_sta *aicwf_sta);
+#endif /* CONFIG_AICWF_MUMIMO_TX */
+#endif /* CONFIG_AICWF_BFMER */
+
+int aicwf_send_dbg_mem_read_req(struct aicwf_hw *aicwf_hw, u32 mem_addr,
+				struct dbg_mem_read_cfm *cfm);
+
+int aicwf_send_dbg_mem_write_req(struct aicwf_hw *aicwf_hw, u32 mem_addr,
+				 u32 mem_data);
+
+int aicwf_send_dbg_mem_block_write_req(struct aicwf_hw *aicwf_hw, u32 mem_=
addr,
+				       u32 mem_size, u32 *mem_data);
+
+int aicwf_send_dbg_start_app_req(struct aicwf_hw *aicwf_hw, u32 boot_addr,
+				 u32 boot_type);
+
+int aicwf_send_cfg_rssi_req(struct aicwf_hw *aicwf_hw, u8 vif_index,
+			    int rssi_thold, u32 rssi_hyst);
+
+int aicwf_send_get_sta_info_req(struct aicwf_hw *aicwf_hw, u8 sta_idx,
+				struct mm_get_sta_info_cfm *cfm);
+
+int aicwf_send_set_stack_start_req(struct aicwf_hw *aicwf_hw, u8 on,
+				   u8 efuse_valid, u8 set_vendor_info,
+				   u8 fwtrace_redir_en,
+				   struct mm_set_stack_start_cfm *cfm);
+
+int aicwf_send_get_temp_req(struct aicwf_hw *aicwf_hw,
+			    struct mm_set_vendor_swconfig_cfm *cfm);
+
+int aicwf_send_set_temp_comp_req(struct aicwf_hw *aicwf_hw,
+				 struct mm_set_vendor_swconfig_cfm *cfm);
+
+int aicwf_send_get_fw_version_req(struct aicwf_hw *aicwf_hw,
+				  struct mm_get_fw_version_cfm *cfm);
+
+int aicwf_send_txpwr_ofst2x_req(struct aicwf_hw *aicwf_hw);
+
+int aicwf_send_txpwr_lvl_v3_req(struct aicwf_hw *aicwf_hw, int index_reg);
+
+int aicwf_send_txpwr_lvl_adj_req(struct aicwf_hw *aicwf_hw);
+
+#endif /* _AICWF_MSG_TX_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_mu_group.h b/drive=
rs/net/wireless/aic/aic8800_fdrv/aicwf_mu_group.h
new file mode 100644
index 000000000000..9233eb9e58b5
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_mu_group.h
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_MU_GROUP_H_
+#define _AICWF_MU_GROUP_H_
+
+#include <linux/semaphore.h>
+#include <linux/workqueue.h>
+
+struct aicwf_hw;
+struct aicwf_sta;
+
+#ifdef CONFIG_AICWF_MUMIMO_TX
+
+/**
+ * struct aicwf_sta_group_info - Group information for a STA
+ *
+ * @active: Node in the active-STA list
+ * @update: Node in the STA-update list
+ * @last_update: Identifier of the last group update applied to the STA
+ * @cnt: Number of groups the STA belongs to
+ * @map: Bitfield of groups the STA belongs to
+ * @traffic: Number of buffers sent since previous group selection
+ * @group: Id of the group selected by previous group selection
+ *         (cf @aicwf_mu_group_sta_select)
+ */
+struct aicwf_sta_group_info {
+	struct list_head active;
+	struct list_head update;
+	u16 last_update;
+	int cnt;
+	u64 map;
+	int traffic;
+	u8 group;
+};
+
+/**
+ * struct aicwf_mu_group - Information about the users of a group
+ *
+ * @list: node for mu->active_groups
+ * @group_id: Group identifier
+ * @user_cnt: Number of the users in the group
+ * @users: Pointer to the sta, ordered by user position
+ */
+struct aicwf_mu_group {
+	struct list_head list;
+	int group_id;
+	int user_cnt;
+	struct aicwf_sta *users[NX_USER_MAX];
+};
+
+/**
+ * struct aicwf_mu_info - Information about all MU groups
+ *
+ * @active_groups: List of all possible groups. Ordered from the most rece=
ntly
+ *                 used one to the least one (and possibly never used)
+ * @active_sta: List of MU beamformee sta that have been active (since pre=
vious
+ *              group update). Ordered from the most recently active.
+ * @update_sta: List of sta whose group information has changed and need t=
o be
+ *              updated in the firmware
+ * @groups: Table of all groups
+ * @group_work: Work item used to schedule group update
+ * @update_count: Counter used to identify the last group formation update=
.
+ *                (cf aicwf_sta_group_info.last_update)
+ * @lock: Lock held during group updates; TX does not use MU while it is h=
eld
+ * @next_group_select: Next time the group selection should be run
+ *                     (ref aicwf_mu_group_sta_select())
+ * @group_cnt: Number of group created
+ */
+struct aicwf_mu_info {
+	struct list_head active_groups;
+	struct list_head active_sta;
+	struct list_head update_sta;
+	struct aicwf_mu_group groups[NX_MU_GROUP_MAX];
+	struct delayed_work group_work;
+	u16 update_count;
+	struct semaphore lock;
+	unsigned long next_group_select;
+	u8 group_cnt;
+};
+
+#define AICWF_SU_GROUP                 BIT_ULL(0)
+#define AICWF_MU_GROUP_MASK            0x7ffffffffffffffeULL
+#define AICWF_MU_GROUP_INTERVAL        200 /* in ms */
+#define AICWF_MU_GROUP_SELECT_INTERVAL 100 /* in ms */
+// minimum traffic in a AICWF_MU_GROUP_SELECT_INTERVAL to consider the sta
+#define AICWF_MU_GROUP_MIN_TRAFFIC     50 /* in number of packet */
+
+#define AICWF_GET_FIRST_GROUP_ID(map) (fls64(map) - 1)
+
+#define AICWF_MUMIMO_INFO_POS_ID(info)   (((info) >> 6) & 0x3)
+#define AICWF_MUMIMO_INFO_GROUP_ID(info) ((info) & 0x3f)
+
+static inline struct aicwf_mu_group *
+aicwf_mu_group_from_id(struct aicwf_mu_info *mu, int id)
+{
+	if (id > NX_MU_GROUP_MAX)
+		return NULL;
+
+	return &mu->groups[id - 1];
+}
+
+void aicwf_mu_group_sta_init(struct aicwf_sta *sta,
+			     const struct ieee80211_vht_cap *vht_cap);
+void aicwf_mu_group_sta_del(struct aicwf_hw *aicwf_hw, struct aicwf_sta *s=
ta);
+u64 aicwf_mu_group_sta_get_map(struct aicwf_sta *sta);
+int aicwf_mu_group_sta_get_pos(struct aicwf_hw *aicwf_hw, struct aicwf_sta=
 *sta,
+			       int group_id);
+
+void aicwf_mu_group_init(struct aicwf_hw *aicwf_hw);
+
+void aicwf_mu_set_active_sta(struct aicwf_hw *aicwf_hw, struct aicwf_sta *=
sta,
+			     int traffic);
+void aicwf_mu_set_active_group(struct aicwf_hw *aicwf_hw, int group_id);
+void aicwf_mu_group_sta_select(struct aicwf_hw *aicwf_hw);
+
+#else /* ! CONFIG_AICWF_MUMIMO_TX */
+
+static inline void
+aicwf_mu_group_sta_init(struct aicwf_sta *sta,
+			const struct ieee80211_vht_cap *vht_cap)
+{
+}
+
+static inline void aicwf_mu_group_sta_del(struct aicwf_hw *aicwf_hw,
+					  struct aicwf_sta *sta)
+{
+}
+
+static inline u64 aicwf_mu_group_sta_get_map(struct aicwf_sta *sta)
+{
+	return 0;
+}
+
+static inline int aicwf_mu_group_sta_get_pos(struct aicwf_hw *aicwf_hw,
+					     struct aicwf_sta *sta, int group_id)
+{
+	return 0;
+}
+
+static inline void aicwf_mu_group_init(struct aicwf_hw *aicwf_hw)
+{
+}
+
+static inline void aicwf_mu_set_active_sta(struct aicwf_hw *aicwf_hw,
+					   struct aicwf_sta *sta, int traffic)
+{
+}
+
+static inline void aicwf_mu_set_active_group(struct aicwf_hw *aicwf_hw,
+					     int group_id)
+{
+}
+
+static inline void aicwf_mu_group_sta_select(struct aicwf_hw *aicwf_hw)
+{
+}
+
+#endif /* CONFIG_AICWF_MUMIMO_TX */
+
+#endif /* _AICWF_MU_GROUP_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_platform.c b/drive=
rs/net/wireless/aic/aic8800_fdrv/aicwf_platform.c
new file mode 100644
index 000000000000..2845d6117a6f
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_platform.c
@@ -0,0 +1,1507 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *************************************************************************=
*****
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @file aicwf_platform.c
+ *
+ * @brief Platform profile
+ *
+ *************************************************************************=
*****
+ */
+
+#include <linux/delay.h>
+#include <crypto/md5.h>
+#include <linux/firmware.h>
+#include <linux/kstrtox.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/sprintf.h>
+#include <linux/string.h>
+#include <linux/vmalloc.h>
+
+#include "hal_desc.h"
+#include "aicwf_main.h"
+#include "aicwf_platform.h"
+#include "aicwf_msg_tx.h"
+
+#include "aicwf_sdio.h"
+
+#include "aicwf_compat_8800d80.h"
+#include "aicwf_chip_ops.h"
+
+// Parser state
+#define INIT      0
+#define CMD       1
+#define PRINT     2
+#define GET_VALUE 3
+
+static const struct userconfig_info_t userconfig_defaults =3D {
+	.txpwr_lvl =3D { .enable =3D 1,
+				  .dsss =3D 9,
+				  .ofdmlowrate_2g4 =3D 8,
+				  .ofdm64qam_2g4 =3D 8,
+				  .ofdm256qam_2g4 =3D 8,
+				  .ofdm1024qam_2g4 =3D 8,
+				  .ofdmlowrate_5g =3D 11,
+				  .ofdm64qam_5g =3D 10,
+				  .ofdm256qam_5g =3D 9,
+				  .ofdm1024qam_5g =3D 9},
+	.txpwr_lvl_v2 =3D	{ .enable =3D 1,
+			.pwrlvl_11b_11ag_2g4 =3D
+				// 1M,   2M,   5M5,  11M,  6M,   9M,   12M,  18M,  24M,  36M,
+				// 48M,  54M
+			{20, 20, 20, 20, 20, 20, 20, 20, 18, 18, 16, 16},
+			.pwrlvl_11n_11ac_2g4 =3D
+				// MCS0, MCS1, MCS2, MCS3, MCS4, MCS5, MCS6, MCS7, MCS8, MCS9
+			{20, 20, 20, 20, 18, 18, 16, 16, 16, 16},
+			.pwrlvl_11ax_2g4 =3D
+				// MCS0, MCS1, MCS2, MCS3, MCS4, MCS5, MCS6, MCS7, MCS8, MCS9,
+				// MCS10,MCS11
+			{20, 20, 20, 20, 18, 18, 16, 16, 16, 16, 15, 15},
+		},
+	.txpwr_lvl_v3 =3D	{ .enable =3D 1,
+			.pwrlvl_11b_11ag_2g4 =3D
+				// 1M,   2M,   5M5,  11M,  6M,   9M,   12M,  18M,  24M,  36M,
+				// 48M,  54M
+			{20, 20, 20, 20, 20, 20, 20, 20, 18, 18, 16, 16},
+			.pwrlvl_11n_11ac_2g4 =3D
+				// MCS0, MCS1, MCS2, MCS3, MCS4, MCS5, MCS6, MCS7, MCS8, MCS9
+			{20, 20, 20, 20, 18, 18, 16, 16, 16, 16},
+			.pwrlvl_11ax_2g4 =3D
+				// MCS0, MCS1, MCS2, MCS3, MCS4, MCS5, MCS6, MCS7, MCS8, MCS9,
+				// MCS10,MCS11
+			{20, 20, 20, 20, 18, 18, 16, 16, 16, 16, 15, 15},
+			.pwrlvl_11a_5g =3D
+				// NA,   NA,   NA,   NA,   6M,   9M,   12M,  18M,  24M,  36M,
+				// 48M,  54M
+			{0x80, 0x80, 0x80, 0x80, 20, 20, 20, 20, 18, 18, 16, 16},
+			.pwrlvl_11n_11ac_5g =3D
+				// MCS0, MCS1, MCS2, MCS3, MCS4, MCS5, MCS6, MCS7, MCS8, MCS9
+			{20, 20, 20, 20, 18, 18, 16, 16, 16, 15},
+			.pwrlvl_11ax_5g =3D
+				// MCS0, MCS1, MCS2, MCS3, MCS4, MCS5, MCS6, MCS7, MCS8, MCS9,
+				// MCS10,MCS11
+			{20, 20, 20, 20, 18, 18, 16, 16, 16, 15, 14, 14},
+		},
+	.txpwr_lvl_v3_gp[0] =3D { .enable =3D 1,
+			.pwrlvl_11b_11ag_2g4 =3D
+				// 1M,   2M,   5M5,  11M,  6M,   9M,   12M,  18M,  24M,  36M,
+				// 48M,  54M
+			{20, 20, 20, 20, 20, 20, 20, 20, 18, 18, 16, 16},
+			.pwrlvl_11n_11ac_2g4 =3D
+				// MCS0, MCS1, MCS2, MCS3, MCS4, MCS5, MCS6, MCS7, MCS8, MCS9
+			{20, 20, 20, 20, 18, 18, 16, 16, 16, 16},
+			.pwrlvl_11ax_2g4 =3D
+				// MCS0, MCS1, MCS2, MCS3, MCS4, MCS5, MCS6, MCS7, MCS8, MCS9,
+				// MCS10,MCS11
+			{20, 20, 20, 20, 18, 18, 16, 16, 16, 16, 15, 15},
+			.pwrlvl_11a_5g =3D
+				// NA,   NA,   NA,   NA,   6M,   9M,   12M,  18M,  24M,  36M,
+				// 48M,  54M
+			{0x80, 0x80, 0x80, 0x80, 20, 20, 20, 20, 18, 18, 16, 16},
+			.pwrlvl_11n_11ac_5g =3D
+				// MCS0, MCS1, MCS2, MCS3, MCS4, MCS5, MCS6, MCS7, MCS8, MCS9
+			{20, 20, 20, 20, 18, 18, 16, 16, 16, 15},
+			.pwrlvl_11ax_5g =3D
+				// MCS0, MCS1, MCS2, MCS3, MCS4, MCS5, MCS6, MCS7, MCS8, MCS9,
+				// MCS10,MCS11
+			{20, 20, 20, 20, 18, 18, 16, 16, 16, 15, 14, 14},
+		},
+	.txpwr_lvl_v3_gp[1] =3D { .enable =3D 1,
+			.pwrlvl_11b_11ag_2g4 =3D {20, 20, 20, 20, 20, 20, 20, 20, 18, 18, 16, 1=
6},
+			.pwrlvl_11n_11ac_2g4 =3D {20, 20, 20, 20, 18, 18, 16, 16, 16, 16},
+			.pwrlvl_11ax_2g4 =3D {20, 20, 20, 20, 18, 18, 16, 16, 16, 16, 15, 15},
+			.pwrlvl_11a_5g =3D {0x80, 0x80, 0x80, 0x80, 20, 20, 20, 20, 18, 18, 16,=
 16},
+			.pwrlvl_11n_11ac_5g =3D {20, 20, 20, 20, 18, 18, 16, 16, 16, 15},
+			.pwrlvl_11ax_5g =3D {20, 20, 20, 20, 18, 18, 16, 16, 16, 15, 14, 14},
+		},
+	.txpwr_lvl_v3_gp[2] =3D { .enable =3D 1,
+			.pwrlvl_11b_11ag_2g4 =3D {20, 20, 20, 20, 20, 20, 20, 20, 18, 18, 16, 1=
6},
+			.pwrlvl_11n_11ac_2g4 =3D {20, 20, 20, 20, 18, 18, 16, 16, 16, 16},
+			.pwrlvl_11ax_2g4 =3D {20, 20, 20, 20, 18, 18, 16, 16, 16, 16, 15, 15},
+			.pwrlvl_11a_5g =3D {0x80, 0x80, 0x80, 0x80, 20, 20, 20, 20, 18, 18, 16,=
 16},
+			.pwrlvl_11n_11ac_5g =3D {20, 20, 20, 20, 18, 18, 16, 16, 16, 15},
+			.pwrlvl_11ax_5g =3D {20, 20, 20, 20, 18, 18, 16, 16, 16, 15, 14, 14},
+		},
+	.txpwr_lvl_v3_gp[3] =3D { .enable =3D 1,
+			.pwrlvl_11b_11ag_2g4 =3D {20, 20, 20, 20, 20, 20, 20, 20, 18, 18, 16, 1=
6},
+			.pwrlvl_11n_11ac_2g4 =3D {20, 20, 20, 20, 18, 18, 16, 16, 16, 16},
+			.pwrlvl_11ax_2g4 =3D {20, 20, 20, 20, 18, 18, 16, 16, 16, 16, 15, 15},
+			.pwrlvl_11a_5g =3D {0x80, 0x80, 0x80, 0x80, 20, 20, 20, 20, 18, 18, 16,=
 16},
+			.pwrlvl_11n_11ac_5g =3D {20, 20, 20, 20, 18, 18, 16, 16, 16, 15},
+			.pwrlvl_11ax_5g =3D {20, 20, 20, 20, 18, 18, 16, 16, 16, 15, 14, 14},
+		},
+	.txpwr_lvl_v3_gp[4] =3D { .enable =3D 1,
+			.pwrlvl_11b_11ag_2g4 =3D {20, 20, 20, 20, 20, 20, 20, 20, 18, 18, 16, 1=
6},
+			.pwrlvl_11n_11ac_2g4 =3D {20, 20, 20, 20, 18, 18, 16, 16, 16, 16},
+			.pwrlvl_11ax_2g4 =3D {20, 20, 20, 20, 18, 18, 16, 16, 16, 16, 15, 15},
+			.pwrlvl_11a_5g =3D {0x80, 0x80, 0x80, 0x80, 20, 20, 20, 20, 18, 18, 16,=
 16},
+			.pwrlvl_11n_11ac_5g =3D {20, 20, 20, 20, 18, 18, 16, 16, 16, 15},
+			.pwrlvl_11ax_5g =3D {20, 20, 20, 20, 18, 18, 16, 16, 16, 15, 14, 14},
+		},
+	.txpwr_loss =3D { .loss_enable_2g4 =3D 1,
+			.loss_value_2g4 =3D 0,
+			.loss_enable_5g =3D 1,
+			.loss_value_5g =3D 0,
+		},
+	.txpwr_ofst =3D { .enable =3D 1,
+			.chan_1_4 =3D 0,
+			.chan_5_9 =3D 0,
+			.chan_10_13 =3D 0,
+			.chan_36_64 =3D 0,
+			.chan_100_120 =3D 0,
+			.chan_122_140 =3D 0,
+			.chan_142_165 =3D 0,
+		},
+	.txpwr_ofst2x =3D { .enable =3D 0,
+			.pwrofst2x_tbl_2g4 =3D {
+					// ch1-4, ch5-9, ch10-13
+					{0, 0, 0}, // 11b
+					{0, 0, 0}, // ofdm_highrate
+					{0, 0, 0}, // ofdm_lowrate
+				},
+			.pwrofst2x_tbl_5g =3D {
+					// ch42,  ch58, ch106,ch122,ch138,ch155
+					{0, 0, 0, 0, 0, 0}, // ofdm_lowrate
+					{0, 0, 0, 0, 0, 0}, // ofdm_highrate
+					{0, 0, 0, 0, 0, 0}, // ofdm_midrate
+				},
+		},
+	.xtal_cap =3D { .enable =3D 0,
+			.xtal_cap =3D 24,
+			.xtal_cap_fine =3D 31,
+		},
+};
+
+int aicwf_request_firmware(const struct firmware **fw, const char *name,
+			   struct device *dev)
+{
+	char *fw_name;
+	int ret;
+
+	if (!name || !name[0])
+		return -EINVAL;
+
+	fw_name =3D kasprintf(GFP_KERNEL, AIC8800_FW_DIR "%s", name);
+	if (!fw_name)
+		return -ENOMEM;
+
+	ret =3D request_firmware(fw, fw_name, dev);
+	kfree(fw_name);
+
+	return ret;
+}
+
+#define MD5PINRT                                                          =
     \
+	"file "                                                                  =
  \
+	"md5:%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x\n"
+
+static int aicwf_load_firmware(u32 **fw_buf, const char *name,
+			       struct device *device)
+{
+	const struct firmware *fw =3D NULL;
+	u32 *dst =3D NULL;
+	void *buffer =3D NULL;
+	u8 digest[MD5_DIGEST_SIZE];
+	int size =3D 0;
+	int ret =3D 0;
+
+	dev_dbg(device, "request firmware =3D %s\n", name);
+
+	ret =3D aicwf_request_firmware(&fw, name, device);
+
+	if (ret < 0) {
+		dev_dbg(device, "load %s fail\n", name);
+		return ret;
+	}
+
+	size =3D fw->size;
+	dst =3D (u32 *)fw->data;
+
+	if (size <=3D 0) {
+		dev_dbg(device, "wrong size of firmware file\n");
+		release_firmware(fw);
+		return -1;
+	}
+
+	buffer =3D vmalloc(size);
+	if (!buffer) {
+		release_firmware(fw);
+		return -ENOMEM;
+	}
+	memset(buffer, 0, size);
+	memcpy(buffer, dst, size);
+
+	*fw_buf =3D buffer;
+
+	md5(buffer, size, digest);
+	dev_dbg(device, MD5PINRT, digest[0], digest[1], digest[2], digest[3],
+		digest[4], digest[5], digest[6], digest[7], digest[8], digest[9],
+		digest[10], digest[11], digest[12], digest[13], digest[14], digest[15]);
+
+	release_firmware(fw);
+
+	return size;
+}
+
+/* buffer is allocated by kzalloc */
+int aicwf_request_firmware_common(struct aicwf_hw *aicwf_hw, u32 **buffer,
+				  const char *filename)
+{
+	int size;
+
+	dev_dbg(aicwf_hw->dev, "load file %s\n", filename);
+
+	size =3D aicwf_load_firmware(buffer, filename, aicwf_hw->dev);
+
+	return size;
+}
+
+static void aicwf_restore_firmware(u32 **fw_buf)
+{
+	vfree(*fw_buf);
+	*fw_buf =3D NULL;
+}
+
+void aicwf_release_firmware_common(u32 **buffer)
+{
+	aicwf_restore_firmware(buffer);
+}
+
+/**
+ * aicwf_plat_bin_fw_upload_chunk - Load the requested binary FW into embe=
dded
+ * side.
+ *
+ * @aicwf_hw: Main driver data
+ * @fw_addr: Address where the fw must be loaded
+ * @filename: Name of the fw.
+ * @chunk: Number of bytes written per DBG_MEM_BLOCK_WRITE_REQ (at most 10=
24)
+ *
+ * Load a fw, stored as a binary file, into the specified address.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int aicwf_plat_bin_fw_upload_chunk(struct aicwf_hw *aicwf_hw, u32 fw_addr,
+				   const char *filename, int chunk)
+{
+	u32 *dst =3D NULL;
+	int i;
+	int size;
+	int err =3D 0;
+
+	dev_dbg(aicwf_hw->dev, "upload %s firmware, @ =3D %x\n", filename, fw_add=
r);
+
+	size =3D aicwf_request_firmware_common(aicwf_hw, &dst, filename);
+	if (size <=3D 0) {
+		dev_err(aicwf_hw->dev, "failed to load %s: %d\n", filename, size);
+		vfree(dst);
+		return size < 0 ? size : -EINVAL;
+	}
+
+	for (i =3D 0; i < size; i +=3D chunk) {
+		err =3D aicwf_send_dbg_mem_block_write_req(aicwf_hw, fw_addr + i,
+							 min(size - i, chunk),
+							 dst + i / 4);
+		if (err) {
+			dev_err(aicwf_hw->dev, "bin upload fail: %x, err:%d\n",
+				fw_addr + i, err);
+			break;
+		}
+	}
+
+	aicwf_release_firmware_common(&dst);
+
+	return err;
+}
+
+/**
+ * aicwf_plat_bin_fw_upload - Load the requested binary FW into embedded
+ * side, 1KB at a time.
+ *
+ * @aicwf_hw: Main driver data
+ * @fw_addr: Address where the fw must be loaded
+ * @filename: Name of the fw.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int aicwf_plat_bin_fw_upload(struct aicwf_hw *aicwf_hw, u32 fw_addr,
+			     const char *filename)
+{
+	return aicwf_plat_bin_fw_upload_chunk(aicwf_hw, fw_addr, filename, 1024);
+}
+
+static const struct nvram_info_t nvram_defaults =3D {
+	.txpwr_idx =3D {.enable =3D 1,
+			.dsss =3D 9,
+			.ofdmlowrate_2g4 =3D 8,
+			.ofdm64qam_2g4 =3D 8,
+			.ofdm256qam_2g4 =3D 8,
+			.ofdm1024qam_2g4 =3D 8,
+			.ofdmlowrate_5g =3D 11,
+			.ofdm64qam_5g =3D 10,
+			.ofdm256qam_5g =3D 9,
+			.ofdm1024qam_5g =3D 9},
+	.txpwr_ofst =3D { .enable =3D 1,
+			.chan_1_4 =3D 0,
+			.chan_5_9 =3D 0,
+			.chan_10_13 =3D 0,
+			.chan_36_64 =3D 0,
+			.chan_100_120 =3D 0,
+			.chan_122_140 =3D 0,
+			.chan_142_165 =3D 0,
+		},
+	.xtal_cap =3D { .enable =3D 0,
+			.xtal_cap =3D 24,
+			.xtal_cap_fine =3D 31,
+		},
+};
+
+/**
+ * aicwf_plat_userconfig_init - Start from the built-in configuration
+ * @aicwf_hw: Main driver data
+ *
+ * The userconfig and nvram files parsed later only override these values.
+ */
+void aicwf_plat_userconfig_init(struct aicwf_hw *aicwf_hw)
+{
+	aicwf_hw->userconfig =3D userconfig_defaults;
+	aicwf_hw->nvram =3D nvram_defaults;
+}
+
+void get_userconfig_txpwr_ofst2x_in_fdrv(struct aicwf_hw *aicwf_hw,
+					 struct txpwr_ofst2x_conf *txpwr_ofst2x)
+{
+	struct userconfig_info_t *uc =3D &aicwf_hw->userconfig;
+	int type, ch_grp;
+	*txpwr_ofst2x =3D uc->txpwr_ofst2x;
+	pr_debug("enable      :%d\n", txpwr_ofst2x->enable);
+	pr_debug("pwrofst2x 2.4g: [0]:11b, [1]:ofdm_highrate, [2]:ofdm_lowrate\n =
 chan=3D\t1-4\t5-9\t10-13");
+
+	for (type =3D 0; type < 3; type++) {
+		pr_debug("\n  [%d] =3D", type);
+		for (ch_grp =3D 0; ch_grp < 3; ch_grp++) {
+			pr_debug("\t%d",
+				 txpwr_ofst2x->pwrofst2x_tbl_2g4[type][ch_grp]);
+		}
+	}
+	pr_debug("\npwrofst2x 5g: [0]:ofdm_lowrate, [1]:ofdm_highrate, [2]:ofdm_m=
idrate\n  chan=3D\t36-50\t51-64\t98-114\t115-130\t131-146\t147-166");
+	for (type =3D 0; type < 3; type++) {
+		pr_debug("\n  [%d] =3D", type);
+		for (ch_grp =3D 0; ch_grp < 6; ch_grp++) {
+			pr_debug("\t%d",
+				 txpwr_ofst2x->pwrofst2x_tbl_5g[type][ch_grp]);
+		}
+	}
+	pr_debug("\n");
+}
+
+void get_userconfig_xtal_cap(struct aicwf_hw *aicwf_hw,
+			     struct xtal_cap_conf *xtal_cap)
+{
+	struct userconfig_info_t *uc =3D &aicwf_hw->userconfig;
+
+	if (aicwf_hw->nvram.xtal_cap.enable)
+		*xtal_cap =3D aicwf_hw->nvram.xtal_cap;
+
+	if (uc->xtal_cap.enable)
+		*xtal_cap =3D uc->xtal_cap;
+
+	pr_debug("enable       :%d\n", xtal_cap->enable);
+	pr_debug("xtal_cap     :%d\n", xtal_cap->xtal_cap);
+	pr_debug("xtal_cap_fine:%d\n",
+		 xtal_cap->xtal_cap_fine);
+}
+
+int aicwf_atoi(char *value)
+{
+	int result;
+
+	if (kstrtoint(value, 10, &result))
+		return 0;
+
+	return result;
+}
+
+static int aicwf_parse_mul_value(char *line, char *val[])
+{
+	int nargs =3D 0;
+
+	while (nargs < 10) {
+		while ((*line =3D=3D ' ') || (*line =3D=3D '\t'))
+			++line;
+
+		if (*line =3D=3D '\0') { /* end of line, no more args    */
+			return nargs;
+		}
+
+		val[nargs++] =3D line; /* begin of argument string    */
+
+		/* find end of string */
+		while (*line && (*line !=3D ' ') && (*line !=3D '\t'))
+			++line;
+
+		if (*line =3D=3D '\0') { /* end of line, no more args    */
+			return nargs;
+		}
+
+		*line++ =3D '\0'; /* terminate current arg     */
+	}
+
+	pr_debug("nargs: %d\n", nargs);
+	return nargs;
+}
+
+static void aicwf_plat_nvram_set_value_group(struct aicwf_hw *aicwf_hw,
+					     char *command, char *value)
+{
+	struct userconfig_info_t *uc =3D &aicwf_hw->userconfig;
+	char *mul_val[10];
+	int i;
+
+	// TODO send command
+	pr_debug("command=3D%s value=3D%s\n", command, value);
+	if (!strcmp(command, "enable")) {
+		uc->txpwr_lvl.enable =3D aicwf_atoi(value);
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].enable =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "dsss")) {
+		uc->txpwr_lvl.dsss =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofdmlowrate_2g4")) {
+		uc->txpwr_lvl.ofdmlowrate_2g4 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofdm64qam_2g4")) {
+		uc->txpwr_lvl.ofdm64qam_2g4 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofdm256qam_2g4")) {
+		uc->txpwr_lvl.ofdm256qam_2g4 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofdm1024qam_2g4")) {
+		uc->txpwr_lvl.ofdm1024qam_2g4 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofdmlowrate_5g")) {
+		uc->txpwr_lvl.ofdmlowrate_5g =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofdm64qam_5g")) {
+		uc->txpwr_lvl.ofdm64qam_5g =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofdm256qam_5g")) {
+		uc->txpwr_lvl.ofdm256qam_5g =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofdm1024qam_5g")) {
+		uc->txpwr_lvl.ofdm1024qam_5g =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11b_11ag_1m_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11b_11ag_2g4[0] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11b_11ag_2m_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11b_11ag_2g4[1] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11b_11ag_5m5_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11b_11ag_2g4[2] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11b_11ag_11m_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11b_11ag_2g4[3] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11b_11ag_6m_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11b_11ag_2g4[4] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11b_11ag_9m_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11b_11ag_2g4[5] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11b_11ag_12m_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11b_11ag_2g4[6] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11b_11ag_18m_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11b_11ag_2g4[7] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11b_11ag_24m_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11b_11ag_2g4[8] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11b_11ag_36m_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11b_11ag_2g4[9] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11b_11ag_48m_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11b_11ag_2g4[10] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11b_11ag_54m_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11b_11ag_2g4[11] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs0_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_2g4[0] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs1_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_2g4[1] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs2_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_2g4[2] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs3_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_2g4[3] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs4_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_2g4[4] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs5_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_2g4[5] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs6_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_2g4[6] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs7_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_2g4[7] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs8_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_2g4[8] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs9_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_2g4[9] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs0_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_2g4[0] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs1_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_2g4[1] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs2_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_2g4[2] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs3_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_2g4[3] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs4_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_2g4[4] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs5_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_2g4[5] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs6_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_2g4[6] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs7_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_2g4[7] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs8_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_2g4[8] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs9_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_2g4[9] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs10_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_2g4[10] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs11_2g4")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_2g4[11] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11a_1m_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11a_5g[0] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11a_2m_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11a_5g[1] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11a_5m5_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11a_5g[2] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11a_11m_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11a_5g[3] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11a_6m_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11a_5g[4] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11a_9m_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11a_5g[5] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11a_12m_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11a_5g[6] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11a_18m_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11a_5g[7] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11a_24m_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11a_5g[8] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11a_36m_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11a_5g[9] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11a_48m_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11a_5g[10] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11a_54m_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11a_5g[11] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs0_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_5g[0] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs1_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_5g[1] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs2_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_5g[2] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs3_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_5g[3] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs4_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_5g[4] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs5_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_5g[5] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs6_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_5g[6] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs7_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_5g[7] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs8_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_5g[8] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs9_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11n_11ac_5g[9] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs0_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_5g[0] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs1_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_5g[1] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs2_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_5g[2] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs3_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_5g[3] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs4_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_5g[4] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs5_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_5g[5] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs6_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_5g[6] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs7_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_5g[7] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs8_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_5g[8] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs9_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_5g[9] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs10_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_5g[10] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_11ax_mcs11_5g")) {
+		if (aicwf_parse_mul_value(value, mul_val) < REGION_NUM_MAX)
+			return;
+		for (i =3D 0; i < REGION_NUM_MAX; i++)
+			uc->txpwr_lvl_v3_gp[i].pwrlvl_11ax_5g[11] =3D
+				aicwf_atoi(mul_val[i]);
+	} else if (!strcmp(command, "lvl_adj_enable")) {
+		uc->txpwr_lvl_adj.enable =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_2g4_chan_1_4")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_2g4[0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_2g4_chan_5_9")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_2g4[1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_2g4_chan_10_13")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_2g4[2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_5g_chan_42")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_5g[0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_5g_chan_58")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_5g[1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_5g_chan_106")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_5g[2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_5g_chan_122")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_5g[3] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_5g_chan_138")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_5g[4] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_5g_chan_155")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_5g[5] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "loss_enable_2g4")) {
+		uc->txpwr_loss.loss_enable_2g4 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "loss_value_2g4")) {
+		uc->txpwr_loss.loss_value_2g4 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "loss_enable_5g")) {
+		uc->txpwr_loss.loss_enable_5g =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "loss_value_5g")) {
+		uc->txpwr_loss.loss_value_5g =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_enable")) {
+		uc->txpwr_ofst.enable =3D aicwf_atoi(value);
+		uc->txpwr_ofst2x.enable =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_chan_1_4")) {
+		uc->txpwr_ofst.chan_1_4 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_chan_5_9")) {
+		uc->txpwr_ofst.chan_5_9 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_chan_10_13")) {
+		uc->txpwr_ofst.chan_10_13 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_chan_36_64")) {
+		uc->txpwr_ofst.chan_36_64 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_chan_100_120")) {
+		uc->txpwr_ofst.chan_100_120 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_chan_122_140")) {
+		uc->txpwr_ofst.chan_122_140 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_chan_142_165")) {
+		uc->txpwr_ofst.chan_142_165 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_11b_chan_1_4")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[0][0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_11b_chan_5_9")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[0][1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_11b_chan_10_13")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[0][2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_ofdm_highrate_chan_1_4")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[1][0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_ofdm_highrate_chan_5_9")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[1][1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_ofdm_highrate_chan_10_13")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[1][2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_ofdm_lowrate_chan_1_4")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[2][0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_ofdm_lowrate_chan_5_9")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[2][1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_ofdm_lowrate_chan_10_13")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[2][0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_lowrate_chan_42")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[0][0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_lowrate_chan_58")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[0][1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_lowrate_chan_106")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[0][2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_lowrate_chan_122")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[0][3] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_lowrate_chan_138")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[0][4] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_lowrate_chan_155")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[0][5] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_highrate_chan_42")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[1][0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_highrate_chan_58")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[1][1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_highrate_chan_106")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[1][2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_highrate_chan_122")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[1][3] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_highrate_chan_138")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[1][4] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_highrate_chan_155")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[1][5] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_midrate_chan_42")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[2][0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_midrate_chan_58")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[2][1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_midrate_chan_106")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[2][2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_midrate_chan_122")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[2][3] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_midrate_chan_138")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[2][4] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_midrate_chan_155")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[2][5] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "xtal_enable")) {
+		uc->xtal_cap.enable =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "xtal_cap")) {
+		uc->xtal_cap.xtal_cap =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "xtal_cap_fine")) {
+		uc->xtal_cap.xtal_cap_fine =3D aicwf_atoi(value);
+	} else {
+		pr_err("invalid cmd: %s\n", command);
+	}
+}
+
+static void aicwf_plat_nvram_set_value_v3(struct aicwf_hw *aicwf_hw,
+					  char *command, char *value)
+{
+	struct userconfig_info_t *uc =3D &aicwf_hw->userconfig;
+
+	// TODO send command
+	pr_debug("command=3D%s value=3D%s\n", command, value);
+	if (!strcmp(command, "enable")) {
+		uc->txpwr_lvl.enable =3D aicwf_atoi(value);
+		uc->txpwr_lvl_v3.enable =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "dsss")) {
+		uc->txpwr_lvl.dsss =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofdmlowrate_2g4")) {
+		uc->txpwr_lvl.ofdmlowrate_2g4 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofdm64qam_2g4")) {
+		uc->txpwr_lvl.ofdm64qam_2g4 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofdm256qam_2g4")) {
+		uc->txpwr_lvl.ofdm256qam_2g4 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofdm1024qam_2g4")) {
+		uc->txpwr_lvl.ofdm1024qam_2g4 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofdmlowrate_5g")) {
+		uc->txpwr_lvl.ofdmlowrate_5g =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofdm64qam_5g")) {
+		uc->txpwr_lvl.ofdm64qam_5g =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofdm256qam_5g")) {
+		uc->txpwr_lvl.ofdm256qam_5g =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofdm1024qam_5g")) {
+		uc->txpwr_lvl.ofdm1024qam_5g =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11b_11ag_1m_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11b_11ag_2g4[0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11b_11ag_2m_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11b_11ag_2g4[1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11b_11ag_5m5_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11b_11ag_2g4[2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11b_11ag_11m_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11b_11ag_2g4[3] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11b_11ag_6m_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11b_11ag_2g4[4] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11b_11ag_9m_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11b_11ag_2g4[5] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11b_11ag_12m_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11b_11ag_2g4[6] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11b_11ag_18m_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11b_11ag_2g4[7] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11b_11ag_24m_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11b_11ag_2g4[8] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11b_11ag_36m_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11b_11ag_2g4[9] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11b_11ag_48m_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11b_11ag_2g4[10] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11b_11ag_54m_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11b_11ag_2g4[11] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs0_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_2g4[0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs1_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_2g4[1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs2_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_2g4[2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs3_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_2g4[3] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs4_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_2g4[4] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs5_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_2g4[5] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs6_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_2g4[6] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs7_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_2g4[7] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs8_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_2g4[8] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs9_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_2g4[9] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs0_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_2g4[0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs1_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_2g4[1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs2_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_2g4[2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs3_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_2g4[3] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs4_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_2g4[4] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs5_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_2g4[5] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs6_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_2g4[6] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs7_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_2g4[7] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs8_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_2g4[8] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs9_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_2g4[9] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs10_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_2g4[10] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs11_2g4")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_2g4[11] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11a_1m_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11a_5g[0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11a_2m_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11a_5g[1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11a_5m5_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11a_5g[2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11a_11m_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11a_5g[3] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11a_6m_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11a_5g[4] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11a_9m_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11a_5g[5] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11a_12m_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11a_5g[6] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11a_18m_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11a_5g[7] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11a_24m_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11a_5g[8] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11a_36m_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11a_5g[9] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11a_48m_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11a_5g[10] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11a_54m_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11a_5g[11] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs0_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_5g[0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs1_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_5g[1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs2_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_5g[2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs3_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_5g[3] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs4_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_5g[4] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs5_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_5g[5] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs6_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_5g[6] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs7_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_5g[7] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs8_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_5g[8] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11n_11ac_mcs9_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11n_11ac_5g[9] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs0_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_5g[0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs1_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_5g[1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs2_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_5g[2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs3_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_5g[3] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs4_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_5g[4] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs5_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_5g[5] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs6_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_5g[6] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs7_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_5g[7] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs8_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_5g[8] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs9_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_5g[9] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs10_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_5g[10] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_11ax_mcs11_5g")) {
+		uc->txpwr_lvl_v3.pwrlvl_11ax_5g[11] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_enable")) {
+		uc->txpwr_lvl_adj.enable =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_2g4_chan_1_4")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_2g4[0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_2g4_chan_5_9")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_2g4[1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_2g4_chan_10_13")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_2g4[2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_5g_chan_42")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_5g[0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_5g_chan_58")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_5g[1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_5g_chan_106")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_5g[2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_5g_chan_122")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_5g[3] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_5g_chan_138")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_5g[4] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "lvl_adj_5g_chan_155")) {
+		uc->txpwr_lvl_adj.pwrlvl_adj_tbl_5g[5] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "loss_enable_2g4")) {
+		uc->txpwr_loss.loss_enable_2g4 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "loss_value_2g4")) {
+		uc->txpwr_loss.loss_value_2g4 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "loss_enable_5g")) {
+		uc->txpwr_loss.loss_enable_5g =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "loss_value_5g")) {
+		uc->txpwr_loss.loss_value_5g =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_enable")) {
+		uc->txpwr_ofst.enable =3D aicwf_atoi(value);
+		uc->txpwr_ofst2x.enable =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_chan_1_4")) {
+		uc->txpwr_ofst.chan_1_4 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_chan_5_9")) {
+		uc->txpwr_ofst.chan_5_9 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_chan_10_13")) {
+		uc->txpwr_ofst.chan_10_13 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_chan_36_64")) {
+		uc->txpwr_ofst.chan_36_64 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_chan_100_120")) {
+		uc->txpwr_ofst.chan_100_120 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_chan_122_140")) {
+		uc->txpwr_ofst.chan_122_140 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_chan_142_165")) {
+		uc->txpwr_ofst.chan_142_165 =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_11b_chan_1_4")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[0][0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_11b_chan_5_9")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[0][1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_11b_chan_10_13")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[0][2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_ofdm_highrate_chan_1_4")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[1][0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_ofdm_highrate_chan_5_9")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[1][1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_ofdm_highrate_chan_10_13")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[1][2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_ofdm_lowrate_chan_1_4")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[2][0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_ofdm_lowrate_chan_5_9")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[2][1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_2g4_ofdm_lowrate_chan_10_13")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_2g4[2][0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_lowrate_chan_42")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[0][0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_lowrate_chan_58")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[0][1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_lowrate_chan_106")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[0][2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_lowrate_chan_122")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[0][3] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_lowrate_chan_138")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[0][4] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_lowrate_chan_155")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[0][5] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_highrate_chan_42")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[1][0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_highrate_chan_58")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[1][1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_highrate_chan_106")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[1][2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_highrate_chan_122")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[1][3] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_highrate_chan_138")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[1][4] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_highrate_chan_155")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[1][5] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_midrate_chan_42")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[2][0] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_midrate_chan_58")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[2][1] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_midrate_chan_106")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[2][2] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_midrate_chan_122")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[2][3] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_midrate_chan_138")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[2][4] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "ofst_5g_ofdm_midrate_chan_155")) {
+		uc->txpwr_ofst2x.pwrofst2x_tbl_5g[2][5] =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "xtal_enable")) {
+		uc->xtal_cap.enable =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "xtal_cap")) {
+		uc->xtal_cap.xtal_cap =3D aicwf_atoi(value);
+	} else if (!strcmp(command, "xtal_cap_fine")) {
+		uc->xtal_cap.xtal_cap_fine =3D aicwf_atoi(value);
+	} else {
+		pr_err("invalid cmd: %s\n", command);
+	}
+}
+
+void aicwf_plat_userconfig_parsing3(struct aicwf_hw *aicwf_hw, char *buffe=
r,
+				    int size)
+{
+	int i =3D 0;
+	int parse_state =3D 0;
+	char command[64];
+	char value[100];
+	int char_counter =3D 0;
+	u8 area_pw =3D 0;
+	bool skip_line =3D false;
+
+	memset(command, 0, 64);
+	memset(value, 0, 100);
+
+	for (i =3D 0; i < size; i++) {
+		// Send command or print nvram log when char is \r or \n
+		if (buffer[i] =3D=3D 0x0a || buffer[i] =3D=3D 0x0d) {
+			if (!skip_line && command[0] !=3D 0 && value[0] !=3D 0) {
+				if (parse_state =3D=3D PRINT) {
+					if (area_pw =3D=3D 0 &&
+					    strnstr(value, "SRRC", strlen(value))) {
+						area_pw =3D 1;
+						pr_debug("use diff_area_power userconfig\n");
+					}
+					pr_debug("%s\n", value);
+				} else if (parse_state =3D=3D GET_VALUE) {
+					if (area_pw)
+						aicwf_plat_nvram_set_value_group(aicwf_hw, command,
+										 value);
+					else
+						aicwf_plat_nvram_set_value_v3(aicwf_hw, command,
+									      value);
+				}
+			}
+			// Reset command value and char_counter
+			memset(command, 0, 64);
+			memset(value, 0, 100);
+			char_counter =3D 0;
+			parse_state =3D INIT;
+			skip_line =3D false;
+			continue;
+		}
+
+		if (skip_line)
+			continue;
+
+		// Switch parser state
+		if (parse_state =3D=3D INIT) {
+			if (buffer[i] =3D=3D '#') {
+				parse_state =3D PRINT;
+				continue;
+			} else if (buffer[i] =3D=3D 0x0a || buffer[i] =3D=3D 0x0d) {
+				parse_state =3D INIT;
+				continue;
+			} else {
+				parse_state =3D CMD;
+			}
+		}
+
+		// Fill data to command and value
+		if (parse_state =3D=3D PRINT) {
+			command[0] =3D 0x01;
+			if (char_counter >=3D sizeof(value) - 1) {
+				skip_line =3D true;
+				continue;
+			}
+			value[char_counter] =3D buffer[i];
+			char_counter++;
+		} else if (parse_state =3D=3D CMD) {
+			if (command[0] !=3D 0 && buffer[i] =3D=3D '=3D') {
+				parse_state =3D GET_VALUE;
+				char_counter =3D 0;
+				continue;
+			}
+			if (char_counter >=3D sizeof(command) - 1) {
+				skip_line =3D true;
+				continue;
+			}
+			command[char_counter] =3D buffer[i];
+			char_counter++;
+		} else if (parse_state =3D=3D GET_VALUE) {
+			if (buffer[i] !=3D 0x2D &&
+			    (buffer[i] < 0x30 || buffer[i] > 0x39) &&
+			    buffer[i] !=3D 0x20)
+				continue;
+			if (char_counter >=3D sizeof(value) - 1) {
+				skip_line =3D true;
+				continue;
+			}
+			value[char_counter] =3D buffer[i];
+			char_counter++;
+		}
+	}
+}
+
+void get_userconfig_txpwr_lvl_group_in_fdrv(struct aicwf_hw *aicwf_hw,
+					    struct txpwr_lvl_conf_v3 *txpwr_lvl_v3,
+					    int index_reg)
+{
+	struct userconfig_info_t *uc =3D &aicwf_hw->userconfig;
+
+	*txpwr_lvl_v3 =3D uc->txpwr_lvl_v3_gp[index_reg];
+
+	pr_debug("enable:%d\n", txpwr_lvl_v3->enable);
+	pr_debug("lvl_11b_11ag_1m_2g4:%d\n", txpwr_lvl_v3->pwrlvl_11b_11ag_2g4[0]=
);
+}
+
+void get_userconfig_txpwr_lvl_adj_in_fdrv(struct aicwf_hw *aicwf_hw,
+					  struct txpwr_lvl_adj_conf *txpwr_lvl_adj)
+{
+	struct userconfig_info_t *uc =3D &aicwf_hw->userconfig;
+
+	*txpwr_lvl_adj =3D uc->txpwr_lvl_adj;
+
+	pr_debug("enable:%d\n", txpwr_lvl_adj->enable);
+	pr_debug("lvl_adj_2g4_chan_1_4:%d\n", txpwr_lvl_adj->pwrlvl_adj_tbl_2g4[0=
]);
+}
+
+/*
+ * aicwf_plat_userconfig_load  ---Load aic_userconfig.txt
+ *@filename name of config
+ */
+static int aicwf_plat_userconfig_load(struct aicwf_hw *aicwf_hw)
+{
+	aic_chip_userconfig_load(aicwf_hw);
+	return 0;
+}
+
+void get_userconfig_txpwr_loss(struct aicwf_hw *aicwf_hw,
+			       struct txpwr_loss_conf *txpwr_loss)
+{
+	struct userconfig_info_t *uc =3D &aicwf_hw->userconfig;
+
+	txpwr_loss->loss_enable_2g4 =3D uc->txpwr_loss.loss_enable_2g4;
+	txpwr_loss->loss_value_2g4 =3D uc->txpwr_loss.loss_value_2g4;
+	txpwr_loss->loss_enable_5g =3D uc->txpwr_loss.loss_enable_5g;
+	txpwr_loss->loss_value_5g =3D uc->txpwr_loss.loss_value_5g;
+
+	pr_debug("loss_enable_2g4: %d, val_2g4: %d, loss_enable_5g: %d, val_5g: %=
d\n",
+		 txpwr_loss->loss_enable_2g4, txpwr_loss->loss_value_2g4,
+		 txpwr_loss->loss_enable_5g, txpwr_loss->loss_value_5g);
+}
+
+/**
+ * aicwf_platform_on - Start the platform
+ *
+ * @aicwf_hw: Main driver data
+ * @config: Config to restore (NULL if nothing to restore)
+ *
+ * It starts the platform :
+ * - load fw and ucodes
+ * - initialize IPC
+ * - boot the fw
+ * - enable link communication/IRQ
+ *
+ * Called by 802.11 part
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int aicwf_platform_on(struct aicwf_hw *aicwf_hw, void *config)
+{
+	int ret;
+	struct aicwf_plat *aicwf_plat =3D aicwf_hw->plat;
+	(void)ret;
+
+	if (aicwf_plat->enabled)
+		return 0;
+
+	aicwf_plat_userconfig_load(aicwf_hw);
+	// aicwf_plat->enabled =3D true;
+	return 0;
+}
+
+/**
+ * aicwf_platform_off() - Stop the platform
+ *
+ * @aicwf_hw: Main driver data
+ * @config: Updated with pointer to config, to be able to restore it with
+ * aicwf_platform_on(). It's up to the caller to free the config. Set to N=
ULL
+ * if configuration is not needed.
+ *
+ * Called by 802.11 part
+ */
+void aicwf_platform_off(struct aicwf_hw *aicwf_hw, void **config)
+{
+	tasklet_kill(&aicwf_hw->task);
+	aicwf_hw->plat->enabled =3D false;
+}
+
+/**
+ * aicwf_platform_init() - Initialize the platform
+ *
+ * @aicwf_plat: platform data (already updated by platform driver)
+ * @platform_data: Pointer to store the main driver data pointer (aka aicw=
f_hw)
+ *                That will be set as driver data for the platform driver
+ * Return: 0 on success, < 0 otherwise
+ *
+ * Called by the platform driver after it has been probed
+ */
+int aicwf_platform_init(struct aicwf_plat *aicwf_plat, void **platform_dat=
a)
+{
+	int ret;
+
+	aicwf_plat->enabled =3D false;
+
+	ret =3D aicwf_cfg80211_init(aicwf_plat, platform_data);
+	if (ret)
+		return ret;
+
+	aicwf_plat->enabled =3D true;
+	return 0;
+}
+
+/**
+ * aicwf_platform_deinit() - Deinitialize the platform
+ *
+ * @aicwf_hw: main driver data
+ *
+ * Called by the platform driver after it is removed
+ */
+void aicwf_platform_deinit(struct aicwf_hw *aicwf_hw)
+{
+	aicwf_cfg80211_deinit(aicwf_hw);
+}
+
+struct device *aicwf_platform_get_dev(struct aicwf_plat *aicwf_plat)
+{
+	return aicwf_plat->sdiodev->dev;
+}
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_platform.h b/drive=
rs/net/wireless/aic/aic8800_fdrv/aicwf_platform.h
new file mode 100644
index 000000000000..269058765e99
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_platform.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_PLATFORM_H_
+#define _AICWF_PLATFORM_H_
+
+#include "lmac_msg.h"
+
+#define AIC8800_FW_DIR "aic/"
+#if (defined(CONFIG_DPD) && !defined(CONFIG_FORCE_DPD_CALIB))
+#define FW_DPDRESULT_NAME_8800DC "aic_dpdresult_lite_8800dc.bin"
+#endif
+
+#define POWER_LEVEL_INVALID_VAL (127)
+
+struct aicwf_hw;
+struct device;
+struct firmware;
+
+/* Transmit power and crystal settings parsed from the userconfig file */
+struct userconfig_info_t {
+	struct txpwr_lvl_conf txpwr_lvl;
+	struct txpwr_lvl_conf_v2 txpwr_lvl_v2;
+	struct txpwr_lvl_conf_v3 txpwr_lvl_v3;
+	struct txpwr_lvl_conf_v3 txpwr_lvl_v3_gp[REGION_NUM_MAX];
+	struct txpwr_lvl_adj_conf txpwr_lvl_adj;
+	struct txpwr_loss_conf txpwr_loss;
+	struct txpwr_ofst_conf txpwr_ofst;
+	struct txpwr_ofst2x_conf txpwr_ofst2x;
+	struct xtal_cap_conf xtal_cap;
+};
+
+/* Settings parsed from the nvram file */
+struct nvram_info_t {
+	struct txpwr_idx_conf txpwr_idx;
+	struct txpwr_ofst_conf txpwr_ofst;
+	struct xtal_cap_conf xtal_cap;
+};
+
+/**
+ * struct aicwf_plat - State of the platform the firmware runs on
+ *
+ * @sdiodev: SDIO device data
+ * @enabled: Set if embedded platform has been enabled (i.e. fw loaded and
+ *          ipc started)
+ */
+struct aicwf_plat {
+	struct aic_sdio_dev *sdiodev;
+	bool enabled;
+};
+
+int aicwf_request_firmware(const struct firmware **fw, const char *name,
+			   struct device *dev);
+
+int aicwf_platform_init(struct aicwf_plat *aicwf_plat, void **platform_dat=
a);
+void aicwf_platform_deinit(struct aicwf_hw *aicwf_hw);
+
+int aicwf_platform_on(struct aicwf_hw *aicwf_hw, void *config);
+void aicwf_platform_off(struct aicwf_hw *aicwf_hw, void **config);
+
+struct device *aicwf_platform_get_dev(struct aicwf_plat *aicwf_plat);
+
+void aicwf_release_firmware_common(u32 **buffer);
+int aicwf_request_firmware_common(struct aicwf_hw *aicwf_hw, u32 **buffer,
+				  const char *filename);
+int aicwf_plat_bin_fw_upload_chunk(struct aicwf_hw *aicwf_hw, u32 fw_addr,
+				   const char *filename, int chunk);
+int aicwf_plat_bin_fw_upload(struct aicwf_hw *aicwf_hw, u32 fw_addr,
+			     const char *filename);
+
+int aicwf_atoi(char *value);
+void aicwf_plat_userconfig_init(struct aicwf_hw *aicwf_hw);
+void aicwf_plat_userconfig_parsing3(struct aicwf_hw *aicwf_hw, char *buffe=
r,
+				    int size);
+
+void get_userconfig_xtal_cap(struct aicwf_hw *aicwf_hw,
+			     struct xtal_cap_conf *xtal_cap);
+
+void get_userconfig_txpwr_lvl_group_in_fdrv(struct aicwf_hw *aicwf_hw,
+					    struct txpwr_lvl_conf_v3 *txpwr_lvl_v3,
+					    int index_reg);
+void get_userconfig_txpwr_lvl_adj_in_fdrv(struct aicwf_hw *aicwf_hw,
+					  struct txpwr_lvl_adj_conf *txpwr_lvl_adj);
+void get_userconfig_txpwr_ofst2x_in_fdrv(struct aicwf_hw *aicwf_hw,
+					 struct txpwr_ofst2x_conf *txpwr_ofst2x);
+void get_userconfig_txpwr_loss(struct aicwf_hw *aicwf_hw,
+			       struct txpwr_loss_conf *txpwr_loss);
+
+#endif /* _AICWF_PLATFORM_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_radar.h b/drivers/=
net/wireless/aic/aic8800_fdrv/aicwf_radar.h
new file mode 100644
index 000000000000..ff42630e3f36
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_radar.h
@@ -0,0 +1,289 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_RADAR_H_
+#define _AICWF_RADAR_H_
+
+#include <linux/nl80211.h>
+
+struct aicwf_vif;
+struct aicwf_hw;
+
+enum aicwf_radar_chain { AICWF_RADAR_RIU =3D 0, AICWF_RADAR_FCU, AICWF_RAD=
AR_LAST };
+
+enum aicwf_radar_detector {
+	/* Ignore radar pulses */
+	AICWF_RADAR_DETECT_DISABLE =3D 0,
+	/*
+	 * Process pattern detection but do not
+	 * report radar to upper layer (for test)
+	 */
+	AICWF_RADAR_DETECT_ENABLE =3D 1,
+	/*
+	 * Process pattern detection and report
+	 * radar to upper layer.
+	 */
+	AICWF_RADAR_DETECT_REPORT =3D 2
+};
+
+#ifdef CONFIG_AICWF_RADAR
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
+
+#define AICWF_RADAR_PULSE_MAX 32
+
+/**
+ * struct aicwf_radar_pulses - List of pulses reported by HW
+ * @index: write index
+ * @count: number of valid pulses
+ * @buffer: buffer of pulses
+ */
+struct aicwf_radar_pulses {
+	/* Last radar pulses received */
+	int index;
+	int count;
+	u32 buffer[AICWF_RADAR_PULSE_MAX];
+};
+
+/**
+ * struct dfs_pattern_detector - DFS pattern detector
+ * @enabled: whether radar detection is enabled
+ * @region: active DFS region, NL80211_DFS_UNSET until set
+ * @num_radar_types: number of different radar types
+ * @last_pulse_ts: time stamp of last valid pulse in usecs
+ * @prev_jiffies: jiffies value recorded for the previous pulse
+ * @radar_spec: array of radar detection specifications
+ * @detectors: per-channel detector pointers
+ */
+struct dfs_pattern_detector {
+	u8 enabled;
+	enum nl80211_dfs_regions region;
+	u8 num_radar_types;
+	u64 last_pulse_ts;
+	u32 prev_jiffies;
+	const struct radar_detector_specs *radar_spec;
+	struct list_head detectors[];
+};
+
+#define NX_NB_RADAR_DETECTED 4
+
+/**
+ * struct aicwf_radar_detected - List of radar detected
+ * @index: next entry to replace
+ * @count: number of valid entries
+ * @time: detection timestamps
+ * @freq: detection frequencies
+ */
+struct aicwf_radar_detected {
+	u16 index;
+	u16 count;
+	s64 time[NX_NB_RADAR_DETECTED];
+	s16 freq[NX_NB_RADAR_DETECTED];
+};
+
+struct aicwf_radar {
+	struct aicwf_radar_pulses pulses[AICWF_RADAR_LAST];
+	struct dfs_pattern_detector *dpd[AICWF_RADAR_LAST];
+	struct aicwf_radar_detected detected[AICWF_RADAR_LAST];
+	struct work_struct detection_work; /* Work used to process radar pulses *=
/
+	spinlock_t lock;                   /* lock for pulses processing */
+
+	/* In softmac cac is handled by mac80211 */
+#ifdef CONFIG_AICWF_FULLMAC
+	struct delayed_work cac_work; /* Work used to handle CAC */
+	struct aicwf_vif *cac_vif;     /* vif on which we started CAC */
+#endif
+};
+
+/*
+ * Type of radar waveform:
+ * RADAR_WAVEFORM_SHORT : waveform defined by
+ *  - pulse width
+ *  - pulse interval in a burst (pri)
+ *  - number of pulses in a burst (ppb)
+ *
+ * RADAR_WAVEFORM_WEATHER :
+ *   same than SHORT except that ppb is dependent of pri
+ *
+ * RADAR_WAVEFORM_INTERLEAVED :
+ *   same than SHORT except there are several value of pri (interleaved)
+ *
+ * RADAR_WAVEFORM_LONG :
+ *
+ */
+enum radar_waveform_type {
+	RADAR_WAVEFORM_SHORT,
+	RADAR_WAVEFORM_WEATHER,
+	RADAR_WAVEFORM_INTERLEAVED,
+	RADAR_WAVEFORM_LONG
+};
+
+/**
+ * struct radar_detector_specs - detector specs for a radar pattern type
+ * @type_id: pattern type, as defined by regulatory
+ * @width_min: minimum radar pulse width in [us]
+ * @width_max: maximum radar pulse width in [us]
+ * @pri_min: minimum pulse repetition interval in [us] (including toleranc=
e)
+ * @pri_max: minimum pri in [us] (including tolerance)
+ * @num_pri: maximum number of different pri for this type
+ * @ppb: pulses per bursts for this type
+ * @ppb_thresh: number of pulses required to trigger detection
+ * @max_pri_tolerance: pulse time stamp tolerance on both sides [us]
+ * @type: Type of radar waveform
+ */
+struct radar_detector_specs {
+	u8 type_id;
+	u8 width_min;
+	u8 width_max;
+	u16 pri_min;
+	u16 pri_max;
+	u8 num_pri;
+	u8 ppb;
+	u8 ppb_thresh;
+	u8 max_pri_tolerance;
+	enum radar_waveform_type type;
+};
+
+/**
+ * struct pri_sequence - sequence of pulses matching one PRI
+ * @head: list_head
+ * @pri: pulse repetition interval (PRI) in usecs
+ * @dur: duration of sequence in usecs
+ * @count: number of pulses in this sequence
+ * @count_falses: number of not matching pulses in this sequence
+ * @first_ts: time stamp of first pulse in usecs
+ * @last_ts: time stamp of last pulse in usecs
+ * @deadline_ts: deadline when this sequence becomes invalid (first_ts + d=
ur)
+ * @ppb_thresh: Number of pulses to validate detection
+ *              (need for weather radar whose value depends of pri)
+ */
+struct pri_sequence {
+	struct list_head head;
+	u32 pri;
+	u32 dur;
+	u32 count;
+	u32 count_falses;
+	u64 first_ts;
+	u64 last_ts;
+	u64 deadline_ts;
+	u8 ppb_thresh;
+};
+
+/**
+ * struct pulse_elem - elements in pulse queue
+ * @head: list node
+ * @ts: time stamp in usecs
+ */
+struct pulse_elem {
+	struct list_head head;
+	u64 ts;
+};
+
+/**
+ * struct pri_detector - PRI detector element for a dedicated radar type
+ * @head: list node
+ * @rs: detector specs for this detector element
+ * @last_ts: last pulse time stamp considered for this element in usecs
+ * @sequences: list_head holding potential pulse sequences
+ * @pulses: list connecting pulse_elem objects
+ * @count: number of pulses in queue
+ * @max_count: maximum number of pulses to be queued
+ * @window_size: window size back from newest pulse time stamp in usecs
+ * @ops: detector operations
+ * @freq: channel frequency in MHz
+ */
+struct pri_detector {
+	struct list_head head;
+	const struct radar_detector_specs *rs;
+	u64 last_ts;
+	struct list_head sequences;
+	struct list_head pulses;
+	u32 count;
+	u32 max_count;
+	u32 window_size;
+	struct pri_detector_ops *ops;
+	u16 freq;
+};
+
+struct pri_detector *pri_detector_init(struct dfs_pattern_detector *dpd,
+				       u16 radar_type, u16 freq);
+
+bool aicwf_radar_detection_init(struct aicwf_radar *radar);
+void aicwf_radar_detection_deinit(struct aicwf_radar *radar);
+bool aicwf_radar_set_domain(struct aicwf_radar *radar,
+			    enum nl80211_dfs_regions region);
+void aicwf_radar_detection_enable(struct aicwf_radar *radar, u8 enable, u8=
 chain);
+bool aicwf_radar_detection_is_enable(struct aicwf_radar *radar, u8 chain);
+void aicwf_radar_start_cac(struct aicwf_radar *radar, u32 cac_time_ms,
+			   struct aicwf_vif *vif);
+void aicwf_radar_cancel_cac(struct aicwf_radar *radar);
+void aicwf_radar_detection_enable_on_cur_channel(struct aicwf_hw *aicwf_hw=
);
+int aicwf_radar_dump_pattern_detector(char *buf, size_t len,
+				      struct aicwf_radar *radar, u8 chain);
+int aicwf_radar_dump_radar_detected(char *buf, size_t len,
+				    struct aicwf_radar *radar, u8 chain);
+
+#else
+
+struct aicwf_radar {
+};
+
+static inline bool aicwf_radar_detection_init(struct aicwf_radar *radar)
+{
+	return true;
+}
+
+static inline void aicwf_radar_detection_deinit(struct aicwf_radar *radar)
+{
+}
+
+static inline bool aicwf_radar_set_domain(struct aicwf_radar *radar,
+					  enum nl80211_dfs_regions region)
+{
+	return true;
+}
+
+static inline void aicwf_radar_detection_enable(struct aicwf_radar *radar,
+						u8 enable, u8 chain)
+{
+}
+
+static inline bool aicwf_radar_detection_is_enable(struct aicwf_radar *rad=
ar,
+						   u8 chain)
+{
+	return false;
+}
+
+static inline void aicwf_radar_start_cac(struct aicwf_radar *radar,
+					 u32 cac_time_ms, struct aicwf_vif *vif)
+{
+}
+
+static inline void aicwf_radar_cancel_cac(struct aicwf_radar *radar)
+{
+}
+
+static inline void
+aicwf_radar_detection_enable_on_cur_channel(struct aicwf_hw *aicwf_hw)
+{
+}
+
+static inline int aicwf_radar_dump_pattern_detector(char *buf, size_t len,
+						    struct aicwf_radar *radar,
+						    u8 chain)
+{
+	return 0;
+}
+
+static inline int aicwf_radar_dump_radar_detected(char *buf, size_t len,
+						  struct aicwf_radar *radar,
+						  u8 chain)
+{
+	return 0;
+}
+
+#endif /* CONFIG_AICWF_RADAR */
+
+#endif // _AICWF_RADAR_H_
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_resv_mem.h b/drive=
rs/net/wireless/aic/aic8800_fdrv/aicwf_resv_mem.h
new file mode 100644
index 000000000000..aeae5f1ac833
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_resv_mem.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_RESV_MEM_H_
+#define _AICWF_RESV_MEM_H_
+
+#include <linux/types.h>
+
+struct sk_buff;
+
+enum aicwf_resv_mem_id {
+	AIC_RESV_MEM_TXDATA,
+	AIC_RESV_MEM_NUM,
+};
+
+/**
+ * struct aicwf_resv_mem_entry - one reserved buffer
+ * @used: Whether the buffer is currently handed out
+ * @skb: The reserved buffer, %NULL until it could be allocated
+ */
+struct aicwf_resv_mem_entry {
+	bool used;
+	struct sk_buff *skb;
+};
+
+/**
+ * struct aicwf_resv_mem - buffers reserved for the lifetime of a device
+ * @entry: One entry per &enum aicwf_resv_mem_id
+ */
+struct aicwf_resv_mem {
+	struct aicwf_resv_mem_entry entry[AIC_RESV_MEM_NUM];
+};
+
+#ifdef CONFIG_RESV_MEM_SUPPORT
+void aicwf_resv_mem_init(struct aicwf_resv_mem *pool);
+void aicwf_resv_mem_deinit(struct aicwf_resv_mem *pool);
+struct sk_buff *aicwf_resv_mem_alloc_skb(struct aicwf_resv_mem *pool,
+					 unsigned int length,
+					 enum aicwf_resv_mem_id id);
+void aicwf_resv_mem_kfree_skb(struct aicwf_resv_mem *pool, struct sk_buff =
*skb,
+			      enum aicwf_resv_mem_id id);
+#else
+static inline void aicwf_resv_mem_init(struct aicwf_resv_mem *pool)
+{
+}
+
+static inline void aicwf_resv_mem_deinit(struct aicwf_resv_mem *pool)
+{
+}
+#endif
+
+#endif /* _AICWF_RESV_MEM_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx.h b/drivers/net=
/wireless/aic/aic8800_fdrv/aicwf_rx.h
new file mode 100644
index 000000000000..145215156ddb
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx.h
@@ -0,0 +1,363 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_RX_H_
+#define _AICWF_RX_H_
+
+#include "aicwf_txrxif.h"
+
+struct aicwf_hw;
+struct aicwf_vif;
+
+#define SERVER_PORT              67
+#define CLIENT_PORT              68
+#define DHCP_MAGIC               0x63825363
+#define DHCP_ACK                 5
+#define DHCP_OPTION_MESSAGE_TYPE 53 /* RFC 2132 9.6, important for DHCP */
+#define DHCP_OPTION_END          255
+
+enum rx_status_bits {
+	/// The buffer can be forwarded to the networking stack
+	RX_STAT_FORWARD =3D 1 << 0,
+	/// A new buffer has to be allocated
+	RX_STAT_ALLOC =3D 1 << 1,
+	/// The buffer has to be deleted
+	RX_STAT_DELETE =3D 1 << 2,
+	/// The length of the buffer has to be updated
+	RX_STAT_LEN_UPDATE =3D 1 << 3,
+	/// The length in the Ethernet header has to be updated
+	RX_STAT_ETH_LEN_UPDATE =3D 1 << 4,
+	/// Simple copy
+	RX_STAT_COPY =3D 1 << 5,
+	/// Spurious frame (inform upper layer and discard)
+	RX_STAT_SPURIOUS =3D 1 << 6,
+	/// packet for monitor interface
+	RX_STAT_MONITOR =3D 1 << 7,
+};
+
+/*
+ * Decryption status subfields.
+ * {
+ */
+#define AICWF_RX_HD_DECR_UNENC   0 // ENCRYPTION TYPE NONE
+#define AICWF_RX_HD_DECR_WEP     1 // ENCRYPTION TYPE WEP
+#define AICWF_RX_HD_DECR_TKIP    2 // ENCRYPTION TYPE TKIP
+#define AICWF_RX_HD_DECR_CCMP128 3 // ENCRYPTION TYPE CCMP128
+#define AICWF_RX_HD_DECR_CCMP256 4 // ENCRYPTION TYPE CCMP256
+#define AICWF_RX_HD_DECR_GCMP128 5 // ENCRYPTION TYPE GCMP128
+#define AICWF_RX_HD_DECR_GCMP256 6 // ENCRYPTION TYPE GCMP256
+#define AICWF_RX_HD_DECR_WAPI    7 // ENCRYPTION TYPE WAPI
+// @}
+
+struct rx_vector_1_old {
+	/** Receive Vector 1a */
+	u32 leg_length : 12;
+	u32 leg_rate : 4;
+	u32 ht_length : 16;
+
+	/** Receive Vector 1b */
+	u32 _ht_length : 4; // FIXME
+	u32 short_gi : 1;
+	u32 stbc : 2;
+	u32 smoothing : 1;
+	u32 mcs : 7;
+	u32 pre_type : 1;
+	u32 format_mod : 3;
+	u32 ch_bw : 2;
+	u32 n_sts : 3;
+	u32 lsig_valid : 1;
+	u32 sounding : 1;
+	u32 num_extn_ss : 2;
+	u32 aggregation : 1;
+	u32 fec_coding : 1;
+	u32 dyn_bw : 1;
+	u32 doze_not_allowed : 1;
+
+	/** Receive Vector 1c */
+	u32 antenna_set : 8;
+	u32 partial_aid : 9;
+	u32 group_id : 6;
+	u32 first_user : 1;
+	s32 rssi1 : 8;
+
+	/** Receive Vector 1d */
+	s32 rssi2 : 8;
+	s32 rssi3 : 8;
+	s32 rssi4 : 8;
+	u32 reserved_1d : 8;
+};
+
+struct rx_leg_vect {
+	u8 dyn_bw_in_non_ht : 1;
+	u8 chn_bw_in_non_ht : 2;
+	u8 rsvd_nht : 4;
+	u8 lsig_valid : 1;
+} __packed;
+
+struct rx_ht_vect {
+	u16 sounding : 1;
+	u16 smoothing : 1;
+	u16 short_gi : 1;
+	u16 aggregation : 1;
+	u16 stbc : 1;
+	u16 num_extn_ss : 2;
+	u16 lsig_valid : 1;
+	u16 mcs : 7;
+	u16 fec : 1;
+	u16 length : 16;
+} __packed;
+
+struct rx_vht_vect {
+	u8 sounding : 1;
+	u8 beamformed : 1;
+	u8 short_gi : 1;
+	u8 rsvd_vht1 : 1;
+	u8 stbc : 1;
+	u8 doze_not_allowed : 1;
+	u8 first_user : 1;
+	u8 rsvd_vht2 : 1;
+	u16 partial_aid : 9;
+	u16 group_id : 6;
+	u16 rsvd_vht3 : 1;
+	u32 mcs : 4;
+	u32 nss : 3;
+	u32 fec : 1;
+	u32 length : 20;
+	u32 rsvd_vht4 : 4;
+} __packed;
+
+struct rx_he_vect {
+	u8 sounding : 1;
+	u8 beamformed : 1;
+	u8 gi_type : 2;
+	u8 stbc : 1;
+	u8 rsvd_he1 : 3;
+
+	u8 uplink_flag : 1;
+	u8 beam_change : 1;
+	u8 dcm : 1;
+	u8 he_ltf_type : 2;
+	u8 doppler : 1;
+	u8 rsvd_he2 : 2;
+
+	u8 bss_color : 6;
+	u8 rsvd_he3 : 2;
+
+	u8 txop_duration : 7;
+	u8 rsvd_he4 : 1;
+
+	u8 pe_duration : 4;
+	u8 spatial_reuse : 4;
+
+	u8 sig_b_comp_mode : 1;
+	u8 dcm_sig_b : 1;
+	u8 mcs_sig_b : 3;
+	u8 ru_size : 3;
+
+	u32 mcs : 4;
+	u32 nss : 3;
+	u32 fec : 1;
+	u32 length : 20;
+	u32 rsvd_he6 : 4;
+} __packed;
+
+struct rx_vector_1 {
+	u8 format_mod : 4;
+	u8 ch_bw : 3;
+	u8 pre_type : 1;
+	u8 antenna_set : 8;
+	s32 rssi_leg : 8;
+	u32 leg_length : 12;
+	u32 leg_rate : 4;
+	s32 rssi1 : 8;
+
+	union {
+		struct rx_leg_vect leg;
+		struct rx_ht_vect ht;
+		struct rx_vht_vect vht;
+		struct rx_he_vect he;
+	};
+} __packed;
+
+struct rx_vector_2_old {
+	/** Receive Vector 2a */
+	u32 rcpi : 8;
+	u32 evm1 : 8;
+	u32 evm2 : 8;
+	u32 evm3 : 8;
+
+	/** Receive Vector 2b */
+	u32 evm4 : 8;
+	u32 reserved2b_1 : 8;
+	u32 reserved2b_2 : 8;
+	u32 reserved2b_3 : 8;
+};
+
+struct rx_vector_2 {
+	/** Receive Vector 2a */
+	u32 rcpi1 : 8;
+	u32 rcpi2 : 8;
+	u32 rcpi3 : 8;
+	u32 rcpi4 : 8;
+
+	/** Receive Vector 2b */
+	u32 evm1 : 8;
+	u32 evm2 : 8;
+	u32 evm3 : 8;
+	u32 evm4 : 8;
+};
+
+struct phy_channel_info_desc {
+	/** PHY channel information 1 */
+	u32 phy_band : 8;
+	u32 phy_channel_type : 8;
+	u32 phy_prim20_freq : 16;
+	/** PHY channel information 2 */
+	u32 phy_center1_freq : 16;
+	u32 phy_center2_freq : 16;
+};
+
+struct hw_vect {
+	/** Total length for the MPDU transfer */
+	u32 len : 16;
+
+	u32 reserved : 8; // data type is included
+	/** AMPDU Status Information */
+	u32 mpdu_cnt : 6;
+	u32 ampdu_cnt : 2;
+
+	/** TSF Low */
+	__le32 tsf_lo;
+	/** TSF High */
+	__le32 tsf_hi;
+
+	/** Receive Vector 1 */
+	struct rx_vector_1 rx_vect1;
+	/** Receive Vector 2 */
+	struct rx_vector_2 rx_vect2;
+
+	/** Status **/
+	u32 rx_vect2_valid : 1;
+	u32 resp_frame : 1;
+	/** Decryption Status */
+	u32 decr_status : 3;
+	u32 rx_fifo_oflow : 1;
+
+	/** Frame Unsuccessful */
+	u32 undef_err : 1;
+	u32 phy_err : 1;
+	u32 fcs_err : 1;
+	u32 addr_mismatch : 1;
+	u32 ga_frame : 1;
+	u32 current_ac : 2;
+
+	u32 frm_successful_rx : 1;
+	/** Descriptor Done  */
+	u32 desc_done_rx : 1;
+	/** Key Storage RAM Index */
+	u32 key_sram_index : 10;
+	/** Key Storage RAM Index Valid */
+	u32 key_sram_v : 1;
+	u32 type : 2;
+	u32 subtype : 4;
+};
+
+struct hw_rxhdr {
+	/** RX vector */
+	struct hw_vect hwvect;
+
+	/** PHY channel information */
+	struct phy_channel_info_desc phy_info;
+
+	/** RX flags */
+	u32 flags_is_amsdu : 1;
+	u32 flags_is_80211_mpdu : 1;
+	u32 flags_is_4addr : 1;
+	u32 flags_new_peer : 1;
+	u32 flags_user_prio : 1; // aic: fw not fill any more
+	u32 flags_need_reord : 1;
+	u32 flags_upload : 1;
+#ifndef CONFIG_AIC8800_RX_REORDER
+	u32 flags_rsvd0 : 1;
+#else
+	u32 is_monitor_vif : 1;
+#endif
+	u32 flags_vif_idx : 8; // 0xFF if invalid VIF index
+	u32 flags_sta_idx : 8; // 0xFF if invalid STA index
+	u32 flags_dst_idx : 8; // 0xFF if unknown destination STA
+	/** Pattern indicating if the buffer is available for the driver */
+	u32 pattern;
+};
+
+struct aicwf_legrate {
+	int idx;
+	int rate;
+};
+
+extern const struct aicwf_legrate legrates_lut[];
+extern const u16 tx_legrates_lut_rate[];
+
+struct dhcpinfo {
+	u8 op;
+	u8 htype;
+	u8 hlen;
+	u8 hops;
+	u32 xid;
+	u16 secs;
+	u16 flags;
+	u32 ciaddr;
+	u32 yiaddr;
+	u32 siaddr;
+	u32 giaddr;
+	u8 chaddr[16];
+	u8 sname[64];
+	u8 file[128];
+	__be32 cookie;
+	u8 options[308]; /* 312 - cookie */
+};
+
+bool aicwf_rx_data_skb(struct aicwf_hw *aicwf_hw, struct aicwf_vif *aicwf_=
vif,
+		       struct sk_buff *skb, struct hw_rxhdr *rxhdr);
+u8 aicwf_rxdataind(struct aicwf_hw *aicwf_hw, void *hostid, void *rx_priv)=
;
+int aicwf_process_rxframes(struct aicwf_rx_priv *rx_priv);
+
+#ifdef CONFIG_AIC8800_ARP_OFFLOAD
+void arpoffload_proc(struct sk_buff *skb, struct aicwf_vif *aicwf_vif);
+#endif
+#ifdef CONFIG_AIC8800_RX_REORDER
+struct recv_msdu *reord_rxframe_alloc(spinlock_t *lock, struct list_head *=
q);
+void reord_rxframe_free(spinlock_t *lock, struct list_head *q,
+			struct list_head *list);
+struct reord_ctrl_info *reord_init_sta(struct aicwf_rx_priv *rx_priv,
+				       const u8 *mac_addr);
+void reord_deinit_sta(struct aicwf_rx_priv *rx_priv,
+		      struct reord_ctrl_info *reord_info);
+int reord_need_check(struct reord_ctrl *preorder_ctrl, u16 seq_num);
+int reord_rxframe_enqueue(struct reord_ctrl *preorder_ctrl,
+			  struct recv_msdu *prframe);
+void reord_timeout_worker(struct work_struct *work);
+int reord_single_frame_ind(struct aicwf_rx_priv *rx_priv,
+			   struct recv_msdu *prframe);
+void reord_timeout_handler(struct timer_list *t);
+
+#endif
+void aicwf_rxdata_process_amsdu(struct aicwf_hw *aicwf_hw, struct sk_buff =
*skb,
+				u8 vif_idx, struct sk_buff_head *list);
+
+void aicwf_rx_data_skb_resend(struct aicwf_hw *aicwf_hw, struct aicwf_vif =
*aicwf_vif,
+			      struct sk_buff *skb, struct hw_rxhdr *rxhdr);
+int reord_flush_tid(struct aicwf_rx_priv *rx_priv, struct sk_buff *skb, u8=
 tid);
+bool reord_rxframes_process(struct aicwf_rx_priv *rx_priv,
+			    struct reord_ctrl *preorder_ctrl, int bforced);
+void reord_rxframes_ind(struct aicwf_rx_priv *rx_priv, struct reord_ctrl *=
preorder_ctrl);
+int reord_process_unit(struct aicwf_rx_priv *rx_priv, struct sk_buff *skb,
+		       u16 seq_num, u8 tid, u8 forward, u8 is_amsdu);
+void remove_sec_hdr_mgmt_frame(struct hw_rxhdr *hw_rxhdr, struct sk_buff *=
skb);
+
+void defrag_timeout_cb(struct timer_list *t);
+void aicwf_defrag_init(struct aicwf_hw *aicwf_hw);
+void aicwf_defrag_deinit(struct aicwf_hw *aicwf_hw);
+
+#endif /* _AICWF_RX_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx_prealloc.h b/dr=
ivers/net/wireless/aic/aic8800_fdrv/aicwf_rx_prealloc.h
new file mode 100644
index 000000000000..77114a28e342
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_rx_prealloc.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_RX_PREALLOC_H_
+#define _AICWF_RX_PREALLOC_H_
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/netdevice.h>
+#include <linux/skbuff.h>
+#include <linux/atomic.h>
+
+#ifdef CONFIG_PREALLOC_RX_SKB
+#define AICWF_RXBUFF_SIZE (64 * 512)
+
+struct rx_buff {
+	struct list_head queue;
+	unsigned char *data;
+	u32 len;
+	u8 *start;
+	u8 *end;
+	u8 *read;
+};
+
+struct aicwf_rx_buff_list {
+	struct list_head rxbuff_list;
+	atomic_t rxbuff_list_len;
+};
+
+extern struct aicwf_rx_buff_list aic_rx_buff_list;
+
+struct rx_buff *aicwf_prealloc_rxbuff_alloc(spinlock_t *lock);
+void aicwf_prealloc_rxbuff_free(struct rx_buff *rxbuff, spinlock_t *lock);
+int aicwf_prealloc_init(void);
+void aicwf_prealloc_exit(void);
+#endif
+#endif /* _AICWF_RX_PREALLOC_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_sdio.c b/drivers/n=
et/wireless/aic/aic8800_fdrv/aicwf_sdio.c
new file mode 100644
index 000000000000..4dc8b040e9c8
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_sdio.c
@@ -0,0 +1,2439 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *************************************************************************=
*****
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief SDIO function declarations
+ *
+ *************************************************************************=
*****
+ */
+
+#include <linux/completion.h>
+#include <linux/kthread.h>
+#include <linux/pm.h>
+#include <linux/semaphore.h>
+
+#include "aicwf_sdio.h"
+#include "aicwf_txrxif.h"
+#include "aicwf_defs.h"
+#include "aicwf_msg_tx.h"
+#include "aicwf_main.h"
+#include "aicwf_platform.h"
+#include "sdio_host.h"
+#include "aicwf_chip_ops.h"
+
+/*
+ * Wakeup sources report PM events; they are not a driver-side completion
+ * mechanism. Track SDIO work explicitly so suspend can quiesce it without
+ * inspecting wakeup-source internals.
+ */
+bool aicwf_sdio_activity_get(struct aicwf_hw *aicwf_hw,
+			     struct wakeup_source *ws)
+{
+	struct aic_sdio_dev *sdiodev;
+
+	if (!aicwf_hw || (IS_ENABLED(CONFIG_PM_SLEEP) && !ws))
+		return false;
+
+	sdiodev =3D aicwf_hw->sdiodev;
+	if (!sdiodev || READ_ONCE(sdiodev->quiesced) ||
+	    unlikely(atomic_read(&sdiodev->suspending)))
+		return false;
+
+	atomic_inc(&sdiodev->activity_count);
+	/* Order the activity increment before checking the suspend gate. */
+	smp_mb__after_atomic();
+	if (READ_ONCE(sdiodev->quiesced) ||
+	    unlikely(atomic_read(&sdiodev->suspending))) {
+		if (atomic_dec_and_test(&sdiodev->activity_count))
+			wake_up_all(&sdiodev->activity_waitq);
+		return false;
+	}
+
+	__pm_stay_awake(ws);
+	return true;
+}
+
+void aicwf_sdio_activity_put(struct aicwf_hw *aicwf_hw,
+			     struct wakeup_source *ws)
+{
+	struct aic_sdio_dev *sdiodev;
+
+	if (!aicwf_hw || (IS_ENABLED(CONFIG_PM_SLEEP) && !ws))
+		return;
+
+	sdiodev =3D aicwf_hw->sdiodev;
+	if (!sdiodev)
+		return;
+
+	__pm_relax(ws);
+	/*
+	 * Keep the PM release before exposing count =3D=3D 0 to a suspend waiter=
.
+	 * atomic_add_unless() prevents a bad duplicate put from underflowing the
+	 * accounting and making all later suspend attempts time out.
+	 */
+	if (WARN_ON_ONCE(!atomic_add_unless(&sdiodev->activity_count, -1, 0)))
+		return;
+
+	if (atomic_read(&sdiodev->activity_count) =3D=3D 0)
+		wake_up_all(&sdiodev->activity_waitq);
+}
+
+bool aicwf_sdio_scan_activity_get(struct aicwf_hw *aicwf_hw)
+{
+	if (!aicwf_hw)
+		return false;
+
+	/* Reserve the terminal put before taking the shared wakeup source. */
+	if (WARN_ON_ONCE(atomic_cmpxchg(&aicwf_hw->scan_activity_held, 0, 1)))
+		return false;
+
+	if (!aicwf_sdio_activity_get(aicwf_hw, aicwf_hw->ws_scan)) {
+		atomic_set(&aicwf_hw->scan_activity_held, 0);
+		return false;
+	}
+
+	return true;
+}
+
+void aicwf_sdio_scan_activity_put(struct aicwf_hw *aicwf_hw)
+{
+	if (aicwf_hw && atomic_xchg(&aicwf_hw->scan_activity_held, 0))
+		aicwf_sdio_activity_put(aicwf_hw, aicwf_hw->ws_scan);
+}
+
+#define AICWF_SDIO_TX_AGGR_MAX 32
+
+int aicwf_sdio_readb(struct aic_sdio_dev *sdiodev, uint regaddr, u8 *val)
+{
+	int ret;
+
+	if (!sdiodev->func) {
+		dev_warn(sdiodev->dev, "null sdio func\n");
+		return 0;
+	}
+	sdio_claim_host(sdiodev->func);
+	*val =3D sdio_readb(sdiodev->func, regaddr, &ret);
+	sdio_release_host(sdiodev->func);
+	return ret;
+}
+
+int aicwf_sdio_writeb(struct aic_sdio_dev *sdiodev, uint regaddr, u8 val)
+{
+	int ret;
+
+	if (!sdiodev->func) {
+		dev_warn(sdiodev->dev, "null sdio func\n");
+		return 0;
+	}
+	sdio_claim_host(sdiodev->func);
+	sdio_writeb(sdiodev->func, val, regaddr, &ret);
+	sdio_release_host(sdiodev->func);
+	return ret;
+}
+
+int aicwf_sdio_func2_readb(struct aic_sdio_dev *sdiodev, uint regaddr, u8 =
*val)
+{
+	int ret;
+
+	sdio_claim_host(sdiodev->func2);
+	*val =3D sdio_readb(sdiodev->func2, regaddr, &ret);
+	sdio_release_host(sdiodev->func2);
+	return ret;
+}
+
+int aicwf_sdio_func2_writeb(struct aic_sdio_dev *sdiodev, uint regaddr, u8=
 val)
+{
+	int ret;
+
+	sdio_claim_host(sdiodev->func2);
+	sdio_writeb(sdiodev->func2, val, regaddr, &ret);
+	sdio_release_host(sdiodev->func2);
+	return ret;
+}
+
+#ifdef CONFIG_AIC8800_TX_NETIF_FLOWCTRL
+void aicwf_sdio_tx_netif_flowctrl(struct aicwf_hw *aicwf_hw, bool state)
+{
+	struct aicwf_vif *aicwf_vif;
+
+	list_for_each_entry(aicwf_vif, &aicwf_hw->vifs, list) {
+		if (!aicwf_vif->up)
+			continue;
+		if (state)
+			netif_tx_stop_all_queues(aicwf_vif->ndev);
+		else
+			netif_tx_wake_all_queues(aicwf_vif->ndev);
+	}
+}
+#endif
+
+#ifdef CONFIG_AIC8800_TEMP_CONTROL
+static int update_state(struct aic_sdio_dev *sdiodev)
+{
+	s8 value =3D sdiodev->tp_ctrl.cur_temp;
+	u8 current_state =3D sdiodev->tp_ctrl.cur_stat;
+	s8 thd_1 =3D sdiodev->tp_ctrl.tp_thd_1;
+	s8 thd_2 =3D sdiodev->tp_ctrl.tp_thd_2;
+
+	if (value > thd_2)
+		return 2;
+	else if (value > (thd_2 - BUFFERING_V2) && (current_state =3D=3D 2))
+		return 2;
+	else if (value > thd_1 && current_state !=3D 2)
+		return 1;
+	else if (value > (thd_1 - BUFFERING_V1) && current_state =3D=3D 1)
+		return 1;
+	else if (current_state =3D=3D 0)
+		return 0;
+	else
+		return 1;
+}
+
+void aicwf_netif_ctrl(struct aic_sdio_dev *sdiodev, int val)
+{
+	unsigned long flags;
+	struct aicwf_vif *aicwf_vif;
+
+	if (sdiodev->tp_ctrl.net_stop)
+		return;
+
+	spin_lock_irqsave(&sdiodev->tx_tp_lock, flags);
+	list_for_each_entry(aicwf_vif, &sdiodev->aicwf_hw->vifs, list) {
+		if (!aicwf_vif || !aicwf_vif->ndev || !aicwf_vif->up)
+			continue;
+		netif_tx_stop_all_queues(aicwf_vif->ndev);
+	}
+	spin_unlock_irqrestore(&sdiodev->tx_tp_lock, flags);
+	sdiodev->tp_ctrl.net_stop =3D true;
+	mod_timer(&sdiodev->tp_ctrl.netif_timer, jiffies + msecs_to_jiffies(val))=
;
+}
+
+void aicwf_temp_ctrl(struct aic_sdio_dev *sdiodev)
+{
+	if (sdiodev->tp_ctrl.set_level) {
+		if (sdiodev->tp_ctrl.set_level =3D=3D 1) {
+			sdiodev->tp_ctrl.get_level =3D 1;
+			aicwf_netif_ctrl(sdiodev,
+					 sdiodev->tp_ctrl.interval_t1 /* TMR_INTERVAL_1 */);
+		} else if (sdiodev->tp_ctrl.set_level =3D=3D 2) {
+			sdiodev->tp_ctrl.get_level =3D 2;
+			aicwf_netif_ctrl(sdiodev,
+					 sdiodev->tp_ctrl.interval_t2 /* TMR_INTERVAL_2 */);
+		}
+		return;
+	}
+	if (sdiodev->tp_ctrl.cur_temp >
+		(sdiodev->tp_ctrl.tp_thd_1 - BUFFERING_V1)) {
+		if (update_state(sdiodev) =3D=3D 1) {
+			sdiodev->tp_ctrl.get_level =3D 1;
+			sdiodev->tp_ctrl.cur_stat =3D 1;
+			aicwf_netif_ctrl(sdiodev,
+					 sdiodev->tp_ctrl.interval_t1 /*TMR_INTERVAL_1 */);
+		} else if (update_state(sdiodev) =3D=3D 2) {
+			sdiodev->tp_ctrl.get_level =3D 2;
+			sdiodev->tp_ctrl.cur_stat =3D 2;
+			aicwf_netif_ctrl(sdiodev,
+					 sdiodev->tp_ctrl.interval_t2 /*TMR_INTERVAL_2 */);
+		}
+		return;
+	}
+
+	if (sdiodev->tp_ctrl.cur_stat) {
+		dev_dbg(sdiodev->dev, "reset cur_stat");
+		sdiodev->tp_ctrl.cur_stat =3D 0;
+		sdiodev->tp_ctrl.get_level =3D 0;
+	}
+}
+
+void aicwf_netif_worker(struct work_struct *work)
+{
+	struct temp_ctrl *tc =3D container_of(work, struct temp_ctrl, netif_work)=
;
+	struct aic_sdio_dev *sdiodev =3D
+		container_of(tc, struct aic_sdio_dev, tp_ctrl);
+	unsigned long flags;
+	struct aicwf_vif *aicwf_vif;
+
+	if (sdiodev->bus_if->state =3D=3D BUS_DOWN_ST) {
+		dev_err(sdiodev->dev, "bus down\n");
+		return;
+	}
+
+	spin_lock_irqsave(&sdiodev->tx_tp_lock, flags);
+	list_for_each_entry(aicwf_vif, &sdiodev->aicwf_hw->vifs, list) {
+		if (!aicwf_vif || !aicwf_vif->ndev || !aicwf_vif->up)
+			continue;
+		netif_tx_wake_all_queues(aicwf_vif->ndev);
+	}
+	spin_unlock_irqrestore(&sdiodev->tx_tp_lock, flags);
+	sdiodev->tp_ctrl.net_stop =3D false;
+}
+
+static void aicwf_netif_timer(struct timer_list *t)
+{
+	struct temp_ctrl *tc =3D container_of(t, struct temp_ctrl, netif_timer);
+	struct aic_sdio_dev *sdiodev =3D
+		container_of(tc, struct aic_sdio_dev, tp_ctrl);
+
+	if (sdiodev->bus_if->state =3D=3D BUS_DOWN_ST) {
+		dev_err(sdiodev->dev, "bus down\n");
+		return;
+	}
+
+	if (!work_pending(&sdiodev->tp_ctrl.netif_work))
+		schedule_work(&sdiodev->tp_ctrl.netif_work);
+}
+
+void aicwf_temp_ctrl_worker(struct work_struct *work)
+{
+	struct aicwf_hw *aicwf_hw;
+	struct mm_set_vendor_swconfig_cfm cfm;
+	struct temp_ctrl *tc =3D container_of(work, struct temp_ctrl, tp_ctrl_wor=
k);
+	struct aic_sdio_dev *sdiodev =3D
+		container_of(tc, struct aic_sdio_dev, tp_ctrl);
+
+	if (sdiodev->bus_if->state =3D=3D BUS_DOWN_ST) {
+		dev_err(sdiodev->dev, "bus down\n");
+		return;
+	}
+
+	spin_lock_bh(&sdiodev->tp_ctrl.tm_lock);
+	if (!sdiodev->tp_ctrl.tm_start) {
+		spin_unlock_bh(&sdiodev->tp_ctrl.tm_lock);
+		dev_err(sdiodev->dev, "tp_timer should stop_1\n");
+		return;
+	}
+	spin_unlock_bh(&sdiodev->tp_ctrl.tm_lock);
+
+	aicwf_hw =3D sdiodev->aicwf_hw;
+	aicwf_hw->started_jiffies =3D jiffies;
+
+	aicwf_send_get_temp_req(aicwf_hw, &cfm);
+	sdiodev->tp_ctrl.cur_temp =3D cfm.temp_comp_get_cfm.degree;
+
+	spin_lock_bh(&sdiodev->tp_ctrl.tm_lock);
+	if (sdiodev->tp_ctrl.tm_start)
+		mod_timer(&sdiodev->tp_ctrl.tp_ctrl_timer,
+			  jiffies + msecs_to_jiffies(TEMP_GET_INTERVAL));
+	else
+		dev_err(sdiodev->dev, "tp_timer should stop_2\n");
+	spin_unlock_bh(&sdiodev->tp_ctrl.tm_lock);
+}
+
+static void aicwf_temp_ctrl_timer(struct timer_list *t)
+{
+	struct temp_ctrl *tc =3D container_of(t, struct temp_ctrl, tp_ctrl_timer)=
;
+	struct aic_sdio_dev *sdiodev =3D
+		container_of(tc, struct aic_sdio_dev, tp_ctrl);
+
+	if (sdiodev->bus_if->state =3D=3D BUS_DOWN_ST) {
+		dev_err(sdiodev->dev, "bus down\n");
+		return;
+	}
+
+	if (!work_pending(&sdiodev->tp_ctrl.tp_ctrl_work))
+		schedule_work(&sdiodev->tp_ctrl.tp_ctrl_work);
+}
+
+void aicwf_tp_ctrl_init(struct aic_sdio_dev *sdiodev)
+{
+	spin_lock_init(&sdiodev->tp_ctrl.tm_lock);
+	sdiodev->tp_ctrl.net_stop =3D false;
+	sdiodev->tp_ctrl.on_off =3D true;
+	sdiodev->tp_ctrl.cur_temp =3D 0;
+	sdiodev->tp_ctrl.get_level =3D 0;
+	sdiodev->tp_ctrl.set_level =3D 0;
+	sdiodev->tp_ctrl.interval_t1 =3D TMR_INTERVAL_1;
+	sdiodev->tp_ctrl.interval_t2 =3D TMR_INTERVAL_2;
+	sdiodev->tp_ctrl.cur_stat =3D 0;
+	sdiodev->tp_ctrl.tp_thd_1 =3D TEMP_THD_1;
+	sdiodev->tp_ctrl.tp_thd_2 =3D TEMP_THD_2;
+	sdiodev->tp_ctrl.tm_start =3D 1;
+
+	timer_setup(&sdiodev->tp_ctrl.tp_ctrl_timer, aicwf_temp_ctrl_timer, 0);
+	timer_setup(&sdiodev->tp_ctrl.netif_timer, aicwf_netif_timer, 0);
+
+	INIT_WORK(&sdiodev->tp_ctrl.tp_ctrl_work, aicwf_temp_ctrl_worker);
+	INIT_WORK(&sdiodev->tp_ctrl.netif_work, aicwf_netif_worker);
+	mod_timer(&sdiodev->tp_ctrl.tp_ctrl_timer,
+		  jiffies + msecs_to_jiffies(TEMP_GET_INTERVAL));
+}
+
+void aicwf_tp_ctrl_deinit(struct aic_sdio_dev *sdiodev)
+{
+	spin_lock_bh(&sdiodev->tp_ctrl.tm_lock);
+	sdiodev->tp_ctrl.tm_start =3D 0;
+	if (timer_pending(&sdiodev->tp_ctrl.tp_ctrl_timer)) {
+		dev_dbg(sdiodev->dev, "del tp_ctrl_timer\n");
+		timer_delete_sync(&sdiodev->tp_ctrl.tp_ctrl_timer);
+	}
+	spin_unlock_bh(&sdiodev->tp_ctrl.tm_lock);
+
+	cancel_work_sync(&sdiodev->tp_ctrl.tp_ctrl_work);
+
+	if (timer_pending(&sdiodev->tp_ctrl.netif_timer)) {
+		dev_dbg(sdiodev->dev, "del netif_timer\n");
+		timer_delete_sync(&sdiodev->tp_ctrl.netif_timer);
+	}
+
+	cancel_work_sync(&sdiodev->tp_ctrl.netif_work);
+}
+
+#endif
+
+int aicwf_sdio_flow_ctrl_msg(struct aic_sdio_dev *sdiodev)
+{
+	int ret =3D -1;
+	u8 fc_reg =3D 0;
+	u32 count =3D 0;
+
+	while (true) {
+		ret =3D
+			aicwf_sdio_readb(sdiodev, sdiodev->sdio_reg.flow_ctrl_reg, &fc_reg);
+		if (ret)
+			return -1;
+
+		if (sdiodev->chip_hw->need_flowctrl_mask)
+			fc_reg &=3D SDIOWIFI_FLOWCTRL_MASK_REG;
+
+		if (fc_reg !=3D 0) {
+			ret =3D fc_reg;
+			if (ret > AICWF_SDIO_TX_AGGR_MAX)
+				ret =3D AICWF_SDIO_TX_AGGR_MAX;
+			return ret;
+		}
+		if (count >=3D FLOW_CTRL_RETRY_COUNT) {
+			ret =3D -fc_reg;
+			break;
+		}
+		count++;
+		if (count < 30)
+			usleep_range(50, 100);
+		else if (count < 40)
+			usleep_range(2000, 2500);
+		else
+			usleep_range(10000, 12000);
+	}
+
+	return ret;
+}
+
+int aicwf_sdio_flow_ctrl(struct aic_sdio_dev *sdiodev)
+{
+	int ret =3D -1;
+	u8 fc_reg =3D 0;
+	u32 count =3D 0;
+
+	while (true) {
+		ret =3D
+			aicwf_sdio_readb(sdiodev, sdiodev->sdio_reg.flow_ctrl_reg, &fc_reg);
+		if (ret)
+			return -1;
+
+		if (sdiodev->chip_hw->need_flowctrl_mask)
+			fc_reg &=3D SDIOWIFI_FLOWCTRL_MASK_REG;
+
+		if (fc_reg > DATA_FLOW_CTRL_THRESH) {
+			ret =3D fc_reg;
+			if (ret > AICWF_SDIO_TX_AGGR_MAX)
+				ret =3D AICWF_SDIO_TX_AGGR_MAX;
+			return ret;
+		}
+		if (count >=3D FLOW_CTRL_RETRY_COUNT) {
+			ret =3D -fc_reg;
+			break;
+		}
+		count++;
+		if (count < 30)
+			usleep_range(50, 50);
+		else if (count < 40)
+			usleep_range(2000, 2500);
+		else
+			usleep_range(10000, 12000);
+	}
+
+	return ret;
+}
+
+int aicwf_sdio_send_pkt(struct aic_sdio_dev *sdiodev, u8 *buf, uint count)
+{
+	int ret =3D 0;
+
+	if (!sdiodev->func) {
+		dev_warn(sdiodev->dev, "null sdio func\n");
+		return 0;
+	}
+
+	sdio_claim_host(sdiodev->func);
+	ret =3D
+		sdio_writesb(sdiodev->func, sdiodev->sdio_reg.wr_fifo_addr, buf, count);
+	sdio_release_host(sdiodev->func);
+
+	return ret;
+}
+
+#ifdef CONFIG_PREALLOC_RX_SKB
+int aicwf_sdio_recv_pkt(struct aic_sdio_dev *sdiodev, struct rx_buff *rxbu=
ff,
+			u32 size)
+{
+	int ret;
+
+	if (!rxbuff->data || !size || size > AICWF_RXBUFF_SIZE)
+		return -EINVAL;
+	if (!sdiodev->func) {
+		dev_warn(sdiodev->dev, "null sdio func\n");
+		return -ENODEV;
+	}
+
+	sdio_claim_host(sdiodev->func);
+	ret =3D sdio_readsb(sdiodev->func, rxbuff->data,
+			  sdiodev->sdio_reg.rd_fifo_addr, size);
+	sdio_release_host(sdiodev->func);
+
+	if (ret < 0)
+		return ret;
+	rxbuff->len =3D size;
+
+	return ret;
+}
+#else
+int aicwf_sdio_recv_pkt(struct aic_sdio_dev *sdiodev, struct sk_buff *skbb=
uf,
+			u32 size)
+{
+	int ret;
+
+	if (!skbbuf || !size || size > skb_tailroom(skbbuf))
+		return -EINVAL;
+	if (!sdiodev->func) {
+		dev_warn(sdiodev->dev, "null sdio func\n");
+		return -ENODEV;
+	}
+
+	sdio_claim_host(sdiodev->func);
+	ret =3D sdio_readsb(sdiodev->func, skb_tail_pointer(skbbuf),
+			  sdiodev->sdio_reg.rd_fifo_addr, size);
+	sdio_release_host(sdiodev->func);
+
+	if (ret < 0)
+		return ret;
+	skb_put(skbbuf, size);
+
+	return ret;
+}
+#endif
+
+/*
+ * Power-cycle the chip through the host's mmc-pwrseq so the firmware stop=
s
+ * and the chip is back in bootrom for the next probe. Only function 1 is
+ * bound, so the MMC core resets the card directly instead of rescanning i=
t.
+ *
+ * mmc-pwrseq-simple takes a single reset GPIO as a shared reset control, =
so
+ * when the Bluetooth driver holds the same line deasserted the chip is no=
t
+ * actually reset or powered off here.
+ */
+static void aicwf_sdio_hw_reset(struct sdio_func *func)
+{
+	int ret;
+
+	sdio_claim_host(func);
+	ret =3D mmc_hw_reset(func->card);
+	sdio_release_host(func);
+	if (ret < 0)
+		dev_warn(&func->dev, "chip reset failed: %d\n", ret);
+}
+
+static int aicwf_sdio_probe(struct sdio_func *func,
+			    const struct sdio_device_id *id)
+{
+	struct aic_sdio_dev *sdiodev;
+	struct aicwf_bus *bus_if;
+	int err =3D -ENODEV;
+	u16 chipid;
+
+	dev_dbg(&func->dev, "%d\n", func->num);
+	dev_dbg(&func->dev, "class=3D%x\n", func->class);
+	dev_dbg(&func->dev, "sdio vendor ID: 0x%04x\n", func->vendor);
+	dev_dbg(&func->dev, "sdio device ID: 0x%04x\n", func->device);
+	dev_dbg(&func->dev, "function#: %d\n", func->num);
+
+	if (func->num !=3D 1)
+		return err;
+
+	bus_if =3D
+		kzalloc_obj(*bus_if, GFP_KERNEL);
+	if (!bus_if) {
+		dev_err(&func->dev, "alloc bus fail\n");
+		return -ENOMEM;
+	}
+
+	sdiodev =3D
+		kzalloc_obj(*sdiodev, GFP_KERNEL);
+	if (!sdiodev) {
+		dev_err(&func->dev, "alloc sdiodev fail\n");
+		kfree(bus_if);
+		return -ENOMEM;
+	}
+
+	err =3D aicwf_sdio_chipmatch(func->vendor, func->device, &chipid);
+	if (err) {
+		dev_err(&func->dev, "unsupported SDIO device %04x:%04x\n",
+			func->vendor, func->device);
+		kfree(sdiodev);
+		kfree(bus_if);
+		return err;
+	}
+	sdiodev->chipid =3D chipid;
+	sdiodev->chip_hw =3D aic_sdio_get_props(chipid);
+
+	sdiodev->func =3D func;
+	sdiodev->bus_if =3D bus_if;
+
+#ifdef CONFIG_OOB
+	sdiodev->oob_enable =3D sdiodev->chip_hw->oob_support;
+#else
+	sdiodev->oob_enable =3D false;
+#endif
+
+	atomic_set(&sdiodev->is_bus_suspend, 0);
+	bus_if->sdiodev =3D sdiodev;
+
+	dev_set_drvdata(&func->dev, bus_if);
+	sdiodev->dev =3D &func->dev;
+
+	if (sdiodev->chip_hw->use_func2)
+		sdiodev->func2 =3D func->card->sdio_func[1];
+
+	aicwf_resv_mem_init(&sdiodev->resv_mem);
+
+	//sdio func init start
+	if (!sdiodev->chip_hw->use_sdiov3_func)
+		err =3D aicwf_sdio_func_init(sdiodev);
+	else
+		err =3D aicwf_sdiov3_func_init(sdiodev);
+
+	if (err < 0) {
+		dev_err(&func->dev, "sdio func init fail\n");
+		goto fail;
+	}
+	// sdio func init end
+
+	if (!aicwf_sdio_bus_init(sdiodev)) {
+		dev_err(&func->dev, "sdio bus init fail\n");
+		err =3D -ENODEV;
+		goto fail;
+	}
+
+	err =3D aicwf_sdio_platform_init(sdiodev);
+	if (err) {
+		dev_err_probe(&func->dev, err, "platform init fail\n");
+		goto fail_release;
+	}
+	device_disable_async_suspend(sdiodev->dev);
+
+	return 0;
+fail_release:
+	aicwf_sdio_release(sdiodev);
+	aicwf_sdio_func_deinit(sdiodev);
+	aicwf_sdio_hw_reset(func);
+	goto fail_free;
+fail:
+	aicwf_sdio_func_deinit(sdiodev);
+fail_free:
+	aicwf_prealloc_txq_free(&sdiodev->prealloc_txq);
+	aicwf_resv_mem_deinit(&sdiodev->resv_mem);
+	dev_set_drvdata(&func->dev, NULL);
+	kfree(sdiodev);
+	kfree(bus_if);
+	return err;
+}
+
+static void aicwf_sdio_remove(struct sdio_func *func)
+{
+	struct aicwf_bus *bus_if =3D NULL;
+	struct aic_sdio_dev *sdiodev =3D NULL;
+
+	bus_if =3D dev_get_drvdata(&func->dev);
+	if (!bus_if)
+		return;
+
+	sdiodev =3D bus_if->sdiodev;
+	if (!sdiodev)
+		return;
+
+	aicwf_sdio_release(sdiodev);
+	aicwf_sdio_func_deinit(sdiodev);
+	aicwf_sdio_hw_reset(func);
+	aicwf_prealloc_txq_free(&sdiodev->prealloc_txq);
+	aicwf_resv_mem_deinit(&sdiodev->resv_mem);
+	kfree(sdiodev->plat);
+	dev_set_drvdata(&sdiodev->func->dev, NULL);
+	kfree(sdiodev);
+	kfree(bus_if);
+}
+
+static int aicwf_sdio_suspend(struct device *dev)
+{
+	int ret =3D 0;
+	struct aicwf_bus *bus_if =3D dev_get_drvdata(dev);
+	struct aic_sdio_dev *sdiodev =3D bus_if->sdiodev;
+	mmc_pm_flag_t sdio_flags;
+	struct aicwf_vif *aicwf_vif, *tmp;
+#ifdef CONFIG_AIC8800_NO_WAKE_COUNT
+	int cnt =3D 0;
+#endif
+	int sus_abort =3D 0;
+
+	/* Check host PM support before changing network or chip state. */
+	sdio_flags =3D sdio_get_host_pm_caps(sdiodev->func);
+	if (!(sdio_flags & MMC_PM_KEEP_POWER))
+		return -EINVAL;
+	ret =3D sdio_set_host_pm_flags(sdiodev->func, MMC_PM_KEEP_POWER);
+	if (ret)
+		return ret;
+
+	list_for_each_entry_safe(aicwf_vif, tmp, &sdiodev->aicwf_hw->vifs, list) =
{
+		if (aicwf_vif->ndev)
+			netif_device_detach(aicwf_vif->ndev);
+	}
+
+	if (sdiodev->aicwf_hw->testmode =3D=3D 1)
+		dev_err(dev, "sleep cmd is not supported in RF test mode\n");
+#ifdef CONFIG_AIC8800_NO_WAKE_COUNT //move to when set supend is received
+	else
+		aicwf_send_me_set_lp_level(sdiodev->aicwf_hw, 1, 0); //dynamic switch
+#endif
+
+#if (defined(CONFIG_AIC8800_AUTO_POWERSAVE) && defined(CONFIG_AIC8800_SDIO=
_PWRCTRL))
+	aicwf_sdio_pwr_stctl(sdiodev, SDIO_ACTIVE_ST);
+	if (sdiodev->chip_hw->auto_ps_support) {
+		dev_dbg(dev, "auto_ps enter\n");
+		ret =3D aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.wakeup_reg, 0x8);
+		if (ret)
+			dev_err(dev, "sdio enter auto_ps fail\n");
+	}
+#endif
+
+#ifdef CONFIG_AIC8800_NO_WAKE_COUNT
+	while (&sdiodev->aicwf_hw->scan_request && aicwf_hw->scanning) {
+		/* move to when set supend is received, the theory does not enforce this=
 condition,
+		 * and the code is retained for now
+		 */
+		dev_dbg(dev, "wait scan_cfm\n");
+		if (cnt =3D=3D 0) {
+			aicwf_send_scanu_cancel_req(sdiodev->aicwf_hw, NULL);
+			continue;
+		}
+		msleep(20);
+		cnt +=3D 1;
+		if (cnt >=3D 40)
+			break;
+	}
+#endif
+
+#ifdef CONFIG_AIC8800_TEMP_CONTROL
+	timer_delete_sync(&sdiodev->tp_ctrl.tp_ctrl_timer);
+	cancel_work_sync(&sdiodev->tp_ctrl.tp_ctrl_work);
+#endif
+
+	atomic_set(&sdiodev->suspending, 1);
+	/* Publish the suspend gate before checking outstanding activity. */
+	smp_mb__after_atomic();
+	if (!wait_event_timeout(sdiodev->activity_waitq,
+				atomic_read(&sdiodev->activity_count) =3D=3D 0,
+				msecs_to_jiffies(600)))
+		sus_abort =3D 1;
+	if (sus_abort) {
+		atomic_set(&sdiodev->suspending, 0);
+#ifdef CONFIG_AIC8800_TEMP_CONTROL
+		mod_timer(&sdiodev->tp_ctrl.tp_ctrl_timer,
+			  jiffies + msecs_to_jiffies(TEMP_GET_INTERVAL));
+#endif
+		dev_dbg(dev, "ws active dont suspend\n");
+
+#if defined(CONFIG_AIC8800_AUTO_POWERSAVE)
+		aicwf_sdio_pwr_stctl(sdiodev, SDIO_ACTIVE_ST);
+		if (sdiodev->chip_hw->auto_ps_support) {
+			dev_dbg(dev, "auto_ps abort\n");
+			ret =3D aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.wakeup_reg, 0x8);
+			if (ret)
+				dev_err(dev, "sdio exit auto_ps fail\n");
+		}
+#elif defined(CONFIG_AIC8800_NO_WAKE_COUNT)
+		if (sdiodev->aicwf_hw->testmode =3D=3D 0)
+			aicwf_send_me_set_lp_level(sdiodev->aicwf_hw, 0, 1); //dynamic switch
+#endif
+		list_for_each_entry_safe(aicwf_vif, tmp, &sdiodev->aicwf_hw->vifs, list)=
 {
+			if (aicwf_vif->ndev) {
+				dev_dbg(dev, "suspend restore\n");
+				netif_device_attach(aicwf_vif->ndev);
+			}
+		}
+		return -EBUSY;
+	}
+
+#ifdef CONFIG_AIC8800_TEMP_CONTROL
+	timer_delete_sync(&sdiodev->tp_ctrl.netif_timer);
+	cancel_work_sync(&sdiodev->tp_ctrl.netif_work);
+#endif
+
+#ifndef CONFIG_AIC8800_AUTO_POWERSAVE
+	while (sdiodev->state =3D=3D SDIO_ACTIVE_ST) {
+		if (down_interruptible(&sdiodev->tx_priv->txctl_sema))
+			continue;
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+		aicwf_sdio_pwr_stctl(sdiodev, SDIO_SLEEP_ST);
+#endif
+		up(&sdiodev->tx_priv->txctl_sema);
+		break;
+	}
+#else
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+	aicwf_sdio_pwr_stctl(sdiodev, SDIO_SLEEP_ST);
+#endif
+#endif
+
+	atomic_set(&sdiodev->is_bus_suspend, 1);
+
+	return 0;
+}
+
+static int aicwf_sdio_resume(struct device *dev)
+{
+#if defined(CONFIG_AIC8800_AUTO_POWERSAVE) && defined(CONFIG_AIC8800_SDIO_=
PWRCTRL)
+	int ret;
+#endif
+	struct aicwf_bus *bus_if =3D dev_get_drvdata(dev);
+	struct aic_sdio_dev *sdiodev =3D bus_if->sdiodev;
+	struct aicwf_vif *aicwf_vif, *tmp;
+
+#ifdef CONFIG_AIC8800_NO_WAKE_COUNT
+	if (sdiodev->aicwf_hw->testmode =3D=3D 0)
+		aicwf_send_me_set_lp_level(sdiodev->aicwf_hw, 0, 1); //dynamic switch
+#endif
+#ifdef CONFIG_AIC8800_TEMP_CONTROL
+	mod_timer(&sdiodev->tp_ctrl.tp_ctrl_timer,
+		  jiffies + msecs_to_jiffies(TEMP_GET_INTERVAL));
+#endif
+	list_for_each_entry_safe(aicwf_vif, tmp, &sdiodev->aicwf_hw->vifs, list) =
{
+		if (aicwf_vif->ndev) {
+			dev_dbg(dev, "resume netif_attach\n");
+			netif_device_attach(aicwf_vif->ndev);
+		}
+	}
+
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+	aicwf_sdio_pwr_stctl(sdiodev, SDIO_ACTIVE_ST);
+#endif
+
+#if defined(CONFIG_AIC8800_AUTO_POWERSAVE) && defined(CONFIG_AIC8800_SDIO_=
PWRCTRL)
+	if (sdiodev->chip_hw->auto_ps_support) {
+		dev_dbg(dev, "auto_ps exit\n");
+		ret =3D aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.wakeup_reg, 0x8);
+		if (ret)
+			dev_err(dev, "sdio exit auto_ps fail\n");
+	}
+#endif
+
+	atomic_set(&sdiodev->is_bus_suspend, 0);
+	atomic_set(&sdiodev->suspending, 0);
+
+	return 0;
+}
+
+static const struct sdio_device_id aicwf_sdmmc_ids[] =3D {
+	{SDIO_DEVICE(SDIO_VENDOR_ID_AIC8800D80, SDIO_DEVICE_ID_AIC8800D80)},
+	{SDIO_DEVICE(SDIO_VENDOR_ID_AIC8800D80N, SDIO_DEVICE_ID_AIC8800D80N)},
+	{SDIO_DEVICE(SDIO_VENDOR_ID_AIC8800D80N, SDIO_DEVICE_ID_AIC8800D80LN)},
+	{SDIO_DEVICE(SDIO_VENDOR_ID_AIC8800D80N, SDIO_DEVICE_ID_AIC8800D40N)},
+	{SDIO_DEVICE(SDIO_VENDOR_ID_AIC8800D80N, SDIO_DEVICE_ID_AIC8800D40LN)},
+	{},
+};
+
+MODULE_DEVICE_TABLE(sdio, aicwf_sdmmc_ids);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(aicwf_sdio_pm_ops, aicwf_sdio_suspend,
+			       aicwf_sdio_resume);
+
+static struct sdio_driver aicwf_sdio_driver =3D {
+	.probe =3D aicwf_sdio_probe,
+	.remove =3D aicwf_sdio_remove,
+	.name =3D AICWF_SDIO_NAME,
+	.id_table =3D aicwf_sdmmc_ids,
+	.drv =3D {
+		.pm =3D pm_sleep_ptr(&aicwf_sdio_pm_ops),
+	},
+};
+
+int aicwf_sdio_register(void)
+{
+	return sdio_register_driver(&aicwf_sdio_driver);
+}
+
+void aicwf_sdio_exit(void)
+{
+	sdio_unregister_driver(&aicwf_sdio_driver);
+}
+
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+/*
+ * Until the firmware is running the bootrom answers the power handshake:
+ * it acknowledges a wakeup request in the sleep register and is put back
+ * to sleep through the same register.
+ */
+static int aicwf_sdio_bootrom_wakeup(struct aic_sdio_dev *sdiodev)
+{
+	int ret =3D 0;
+	int read_retry;
+	int write_retry =3D 20;
+	u8 val;
+
+	while (write_retry) {
+		ret =3D aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.wakeup_reg,
+					sdiodev->chip_hw->wakeup_reg_val);
+		if (ret) {
+			dev_err(sdiodev->dev, "sdio wakeup fail\n");
+			ret =3D -1;
+		} else {
+			read_retry =3D 10;
+			while (read_retry) {
+				ret =3D aicwf_sdio_readb(sdiodev, sdiodev->sdio_reg.sleep_reg,
+						       &val);
+				if (ret =3D=3D 0 && val & 0x10)
+					break;
+				read_retry--;
+				usleep_range(30, 50);
+			}
+			if (read_retry !=3D 0)
+				break;
+		}
+		dev_dbg(sdiodev->dev, "write retry:  %d\n", write_retry);
+		write_retry--;
+		usleep_range(30, 50);
+	}
+
+	sdiodev->state =3D SDIO_ACTIVE_ST;
+	aicwf_sdio_pwrctl_timer(sdiodev, sdiodev->active_duration);
+
+	return ret;
+}
+
+static int aicwf_sdio_bootrom_sleep_allow(struct aic_sdio_dev *sdiodev)
+{
+	int ret =3D 0;
+
+	if (sdiodev->state =3D=3D SDIO_ACTIVE_ST) {
+		dev_dbg(sdiodev->dev, "s\n");
+		ret =3D aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.sleep_reg, 0x10);
+		if (ret)
+			dev_err(sdiodev->dev, "write sleep fail\n");
+		sdiodev->state =3D SDIO_SLEEP_ST;
+		aicwf_sdio_pwrctl_timer(sdiodev, 0);
+	} else {
+		aicwf_sdio_pwrctl_timer(sdiodev, sdiodev->active_duration);
+	}
+
+	return ret;
+}
+
+int aicwf_sdio_wakeup(struct aic_sdio_dev *sdiodev)
+{
+	int ret =3D 0;
+	int read_retry;
+	int write_retry =3D 1;
+	int wakeup_reg_val =3D 0;
+
+	if (!sdiodev->fw_running)
+		return aicwf_sdio_bootrom_wakeup(sdiodev);
+
+	wakeup_reg_val =3D sdiodev->chip_hw->wakeup_reg_val;
+
+	if (sdiodev->state =3D=3D SDIO_SLEEP_ST) {
+		dev_dbg(sdiodev->dev, "w\n");
+
+		while (write_retry) {
+			ret =3D aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.wakeup_reg,
+						wakeup_reg_val);
+			if (ret) {
+				dev_err(sdiodev->dev, "sdio wakeup fail\n");
+				ret =3D -1;
+			} else {
+				read_retry =3D 50;
+				while (read_retry) {
+					u8 val;
+
+					ret =3D aicwf_sdio_readb(sdiodev,
+							       sdiodev->sdio_reg.wakeup_reg,
+							       &val);
+					if (ret < 0)
+						dev_err(sdiodev->dev, "sdio wakeup read fail\n");
+					else if ((val & 0x1) =3D=3D 0)
+						break;
+					read_retry--;
+					usleep_range(50, 60);
+				}
+				if (read_retry !=3D 0)
+					break;
+			}
+			dev_dbg(sdiodev->dev, "write retry:  %d\n", write_retry);
+			write_retry--;
+			usleep_range(40, 50);
+		}
+
+		sdiodev->state =3D SDIO_ACTIVE_ST;
+		aicwf_sdio_pwrctl_timer(sdiodev, sdiodev->active_duration);
+	}
+	return ret;
+}
+
+int aicwf_sdio_sleep_allow(struct aic_sdio_dev *sdiodev)
+{
+	int ret =3D 0;
+	struct aicwf_bus *bus_if =3D sdiodev->bus_if;
+	struct aicwf_hw *aicwf_hw =3D sdiodev->aicwf_hw;
+	u8 read_retry;
+	u8 val;
+
+	if (bus_if->state =3D=3D BUS_DOWN_ST) {
+		ret =3D aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.sleep_reg, 0x10);
+		if (ret)
+			dev_err(sdiodev->dev, "write sleep fail\n");
+		aicwf_sdio_pwrctl_timer(sdiodev, 0);
+		return ret;
+	}
+
+	if (!sdiodev->fw_running)
+		return aicwf_sdio_bootrom_sleep_allow(sdiodev);
+
+	dev_dbg(sdiodev->dev, "sleep: %d, %d\n", sdiodev->state, aicwf_hw->scanni=
ng);
+	if (sdiodev->state =3D=3D SDIO_ACTIVE_ST  && !aicwf_hw->scanning && !aicw=
f_hw->is_p2p_alive &&
+	    !aicwf_hw->is_p2p_connected &&
+	    (int)(atomic_read(&sdiodev->tx_priv->tx_pktcnt) <=3D 0) &&
+	    !sdiodev->tx_priv->cmd_txstate &&
+	    (int)(atomic_read(&sdiodev->rx_priv->rx_cnt) =3D=3D 0)) {
+		dev_dbg(sdiodev->dev, "s\n");
+		if (!sdiodev->chip_hw->use_func2) {
+			if (aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.wakeup_reg, 0x02) < 0)
+				dev_err(sdiodev->dev, "reg:%d write failed\n",
+					sdiodev->sdio_reg.wakeup_reg);
+		} else {
+			if (aicwf_sdio_func2_writeb(sdiodev, sdiodev->sdio_reg.wakeup_reg, 0x2)=
 < 0)
+				dev_err(sdiodev->dev, "reg:%d write failed\n",
+					sdiodev->sdio_reg.wakeup_reg);
+			read_retry =3D 100;
+			while (read_retry) {
+				val =3D 0;
+				if (aicwf_sdio_func2_readb(sdiodev,
+							   sdiodev->sdio_reg.wakeup_reg,
+							   &val) < 0)
+					dev_err(sdiodev->dev, "reg %d read fail\n",
+						sdiodev->sdio_reg.wakeup_reg);
+				else if ((val & 0x2) =3D=3D 0)
+					break;
+				dev_err(sdiodev->dev, "val:%d\n", val);
+				read_retry--;
+				if (read_retry < 90)
+					dev_dbg(sdiodev->dev, "warning: read cnt %d\n", read_retry);
+				usleep_range(50, 60);
+			}
+		}
+		sdiodev->state =3D SDIO_SLEEP_ST;
+		aicwf_sdio_pwrctl_timer(sdiodev, 0);
+	} else {
+		aicwf_sdio_pwrctl_timer(sdiodev, sdiodev->active_duration);
+	}
+
+	return ret;
+}
+
+int aicwf_sdio_pwr_stctl(struct aic_sdio_dev *sdiodev, uint target)
+{
+	int ret =3D 0;
+
+	if (!IS_ENABLED(CONFIG_AIC8800_SDIO_PWRCTRL))
+		return 0;
+
+	if (sdiodev->bus_if->state =3D=3D BUS_DOWN_ST)
+		return -1;
+
+	down(&sdiodev->pwrctl_wakeup_sema);
+
+	if (sdiodev->state =3D=3D target) {
+		if (target =3D=3D SDIO_ACTIVE_ST)
+			aicwf_sdio_pwrctl_timer(sdiodev, sdiodev->active_duration);
+		up(&sdiodev->pwrctl_wakeup_sema);
+		return ret;
+	}
+
+	switch (target) {
+	case SDIO_ACTIVE_ST:
+		aicwf_sdio_wakeup(sdiodev);
+		break;
+	case SDIO_SLEEP_ST:
+		aicwf_sdio_sleep_allow(sdiodev);
+		break;
+	}
+
+	up(&sdiodev->pwrctl_wakeup_sema);
+	return ret;
+}
+#endif
+
+int aicwf_sdio_txpkt(struct aic_sdio_dev *sdiodev, struct sk_buff *pkt)
+{
+	int ret =3D 0;
+	u32 len =3D 0;
+	struct aicwf_bus *bus_if =3D dev_get_drvdata(sdiodev->dev);
+
+	if (bus_if->state =3D=3D BUS_DOWN_ST) {
+		dev_dbg(sdiodev->dev, "tx bus is down\n");
+		return -EINVAL;
+	}
+
+	len =3D pkt->len;
+	len =3D (len + SDIOWIFI_FUNC_BLOCKSIZE - 1) / SDIOWIFI_FUNC_BLOCKSIZE *
+		  SDIOWIFI_FUNC_BLOCKSIZE;
+
+	ret =3D aicwf_sdio_send_pkt(sdiodev, pkt->data, len);
+	if (ret)
+		dev_err(sdiodev->dev, "aicwf_sdio_send_pkt fail%d\n", ret);
+	return ret;
+}
+
+static int aicwf_sdio_intr_get_len_bytemode(struct aic_sdio_dev *sdiodev,
+					    u8 *byte_len)
+{
+	int ret =3D 0;
+
+	if (!byte_len)
+		return -EBADE;
+
+	if (sdiodev->bus_if->state =3D=3D BUS_DOWN_ST) {
+		*byte_len =3D 0;
+	} else {
+		ret =3D aicwf_sdio_readb(sdiodev, sdiodev->sdio_reg.bytemode_len_reg,
+				       byte_len);
+		sdiodev->rx_priv->data_len =3D (*byte_len) * 4;
+	}
+
+	return ret;
+}
+
+static void aicwf_sdio_bus_stop(struct device *dev)
+{
+	struct aicwf_bus *bus_if =3D dev_get_drvdata(dev);
+	struct aic_sdio_dev *sdiodev =3D bus_if->sdiodev;
+	int ret =3D 0;
+
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+	aicwf_sdio_pwrctl_timer(sdiodev, 0);
+#endif
+
+	bus_if->state =3D BUS_DOWN_ST;
+	if (sdiodev->tx_priv) {
+		ret =3D down_interruptible(&sdiodev->tx_priv->txctl_sema);
+		if (ret)
+			dev_err(dev, "down txctl_sema fail\n");
+	}
+
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+	aicwf_sdio_pwr_stctl(sdiodev, SDIO_SLEEP_ST);
+#endif
+
+	if (sdiodev->tx_priv) {
+		if (!ret)
+			up(&sdiodev->tx_priv->txctl_sema);
+		aicwf_frame_queue_flush(&sdiodev->tx_priv->txq);
+	}
+}
+
+#ifdef CONFIG_PREALLOC_RX_SKB
+struct rx_buff *aicwf_sdio_readframes(struct aic_sdio_dev *sdiodev)
+{
+	int ret =3D 0;
+	u32 size =3D 0;
+	struct aicwf_bus *bus_if =3D dev_get_drvdata(sdiodev->dev);
+	struct rx_buff *rxbuff;
+
+	if (bus_if->state =3D=3D BUS_DOWN_ST) {
+		dev_dbg(sdiodev->dev, "bus down\n");
+		return NULL;
+	}
+
+	size =3D sdiodev->rx_priv->data_len;
+	if (!size || size > AICWF_RXBUFF_SIZE)
+		return NULL;
+	rxbuff =3D aicwf_prealloc_rxbuff_alloc(&sdiodev->rx_priv->rxbuff_lock);
+	if (!rxbuff) {
+		dev_err(sdiodev->dev, "failed to alloc rxbuff\n");
+		return NULL;
+	}
+	rxbuff->len =3D 0;
+	rxbuff->start =3D rxbuff->data;
+	rxbuff->read =3D rxbuff->start;
+	rxbuff->end =3D rxbuff->data + size;
+
+	ret =3D aicwf_sdio_recv_pkt(sdiodev, rxbuff, size);
+	if (ret) {
+		dev_err(sdiodev->dev, "%d, sdio recv pkt fail\n", __LINE__);
+		aicwf_prealloc_rxbuff_free(rxbuff, &sdiodev->rx_priv->rxbuff_lock);
+		return NULL;
+	}
+
+	return rxbuff;
+}
+#else
+struct sk_buff *aicwf_sdio_readframes(struct aic_sdio_dev *sdiodev)
+{
+	int ret =3D 0;
+	u32 size =3D 0;
+	struct sk_buff *skb =3D NULL;
+	struct aicwf_bus *bus_if =3D dev_get_drvdata(sdiodev->dev);
+
+	if (bus_if->state =3D=3D BUS_DOWN_ST) {
+		dev_dbg(sdiodev->dev, "bus down\n");
+		return NULL;
+	}
+
+	size =3D sdiodev->rx_priv->data_len;
+	skb =3D __dev_alloc_skb(size, GFP_KERNEL);
+	if (!skb)
+		return NULL;
+
+	ret =3D aicwf_sdio_recv_pkt(sdiodev, skb, size);
+	if (ret) {
+		dev_kfree_skb(skb);
+		skb =3D NULL;
+	}
+
+	return skb;
+}
+#endif
+
+static int aicwf_sdio_tx_msg(struct aic_sdio_dev *sdiodev)
+{
+	int err =3D 0;
+	u16 len;
+	u8 *payload =3D sdiodev->tx_priv->cmd_buf;
+	u16 payload_len =3D sdiodev->tx_priv->cmd_len;
+	u8 adjust_str[4] =3D {0, 0, 0, 0};
+	int adjust_len =3D 0;
+	int buffer_cnt =3D 0;
+	u8 retry =3D 0;
+
+	len =3D payload_len;
+	if ((len % TX_ALIGNMENT) !=3D 0) {
+		adjust_len =3D roundup(len, TX_ALIGNMENT);
+		memcpy(payload + payload_len, adjust_str, (adjust_len - len));
+		payload_len +=3D (adjust_len - len);
+	}
+	len =3D payload_len;
+
+	// link tail is necessary
+	if ((len % SDIOWIFI_FUNC_BLOCKSIZE) !=3D 0) {
+		memset(payload + payload_len, 0, TAIL_LEN);
+		payload_len +=3D TAIL_LEN;
+		len =3D (payload_len / SDIOWIFI_FUNC_BLOCKSIZE + 1) *
+			  SDIOWIFI_FUNC_BLOCKSIZE;
+	} else {
+		len =3D payload_len;
+	}
+
+	if (sdiodev->chip_hw->use_flowctrl_msg) {
+		buffer_cnt =3D aicwf_sdio_flow_ctrl_msg(sdiodev);
+		while ((buffer_cnt <=3D 0 ||
+			(buffer_cnt > 0 && len > (buffer_cnt * BUFFER_SIZE))) &&
+			   retry < 10) {
+			retry++;
+			buffer_cnt =3D aicwf_sdio_flow_ctrl_msg(sdiodev);
+			dev_dbg(sdiodev->dev, "buffer_cnt =3D %d\n", buffer_cnt);
+		}
+	}
+	down(&sdiodev->tx_priv->cmd_txsema);
+
+	if (sdiodev->chip_hw->use_flowctrl_msg) {
+		if (buffer_cnt > 0 && len < (buffer_cnt * BUFFER_SIZE)) {
+			err =3D aicwf_sdio_send_pkt(sdiodev, payload, len);
+			if (err)
+				dev_err(sdiodev->dev, "aicwf_sdio_send_pkt fail%d\n", err);
+		} else {
+			dev_err(sdiodev->dev, "tx msg fc retry fail:%d, %d\n", buffer_cnt, len)=
;
+			up(&sdiodev->tx_priv->cmd_txsema);
+			return -1;
+		}
+	} else {
+		err =3D aicwf_sdio_send_pkt(sdiodev, payload, len);
+		if (err)
+			dev_err(sdiodev->dev, "aicwf_sdio_send_pkt fail%d\n", err);
+	}
+
+	sdiodev->tx_priv->cmd_txstate =3D false;
+	if (!err)
+		sdiodev->tx_priv->cmd_tx_succ =3D true;
+	else
+		sdiodev->tx_priv->cmd_tx_succ =3D false;
+
+	up(&sdiodev->tx_priv->cmd_txsema);
+
+	return err;
+}
+
+static void aicwf_sdio_tx_process(struct aic_sdio_dev *sdiodev)
+{
+#ifdef CONFIG_AIC8800_TX_NETIF_FLOWCTRL
+	unsigned long flags;
+#endif
+
+	if (sdiodev->bus_if->state =3D=3D BUS_DOWN_ST) {
+		dev_err(sdiodev->dev, "bus is down\n");
+		return;
+	}
+
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+	aicwf_sdio_pwr_stctl(sdiodev, SDIO_ACTIVE_ST);
+#endif
+
+	// config
+	if (sdiodev->tx_priv->cmd_txstate) {
+		if (down_interruptible(&sdiodev->tx_priv->txctl_sema)) {
+			dev_err(sdiodev->dev, "txctl down bus->txctl_sema fail\n");
+			return;
+		}
+		if (sdiodev->state !=3D SDIO_ACTIVE_ST) {
+			dev_err(sdiodev->dev, "state err\n");
+			up(&sdiodev->tx_priv->txctl_sema);
+			dev_err(sdiodev->dev, "txctl up bus->txctl_sema fail\n");
+			return;
+		}
+
+		if (aicwf_sdio_tx_msg(sdiodev))
+			dev_err(sdiodev->dev, "failed to send command\n");
+		up(&sdiodev->tx_priv->txctl_sema);
+		// Only wake up if someone is actually waiting
+		if (waitqueue_active(&sdiodev->tx_priv->cmd_txdone_wait))
+			wake_up(&sdiodev->tx_priv->cmd_txdone_wait);
+	}
+
+	// data
+	if (down_interruptible(&sdiodev->tx_priv->txctl_sema)) {
+		dev_err(sdiodev->dev, "txdata down bus->txctl_sema\n");
+		return;
+	}
+
+	if (sdiodev->state !=3D SDIO_ACTIVE_ST) {
+		dev_err(sdiodev->dev, "sdio state err\n");
+		up(&sdiodev->tx_priv->txctl_sema);
+		return;
+	}
+
+	if (!aicwf_is_framequeue_empty(&sdiodev->tx_priv->txq))
+		sdiodev->tx_priv->fw_avail_bufcnt =3D aicwf_sdio_flow_ctrl(sdiodev);
+	while (!aicwf_is_framequeue_empty(&sdiodev->tx_priv->txq)) {
+		if (sdiodev->bus_if->state =3D=3D BUS_DOWN_ST)
+			break;
+#ifdef CONFIG_AIC8800_TEMP_CONTROL
+		if (sdiodev->tp_ctrl.on_off)
+			aicwf_temp_ctrl(sdiodev);
+#endif
+		if (sdiodev->tx_priv->fw_avail_bufcnt <=3D DATA_FLOW_CTRL_THRESH) {
+			if (sdiodev->tx_priv->cmd_txstate)
+				break;
+			sdiodev->tx_priv->fw_avail_bufcnt =3D aicwf_sdio_flow_ctrl(sdiodev);
+		} else {
+			if (sdiodev->tx_priv->cmd_txstate) {
+				aicwf_sdio_send(sdiodev->tx_priv, 1);
+				break;
+			}
+			aicwf_sdio_send(sdiodev->tx_priv, 0);
+		}
+	}
+
+#ifdef CONFIG_AIC8800_TX_NETIF_FLOWCTRL
+	spin_lock_irqsave(&sdiodev->tx_flow_lock, flags);
+	if (atomic_read(&sdiodev->tx_priv->tx_pktcnt) < AICWF_SDIO_TX_LOW_WATER) =
{
+		if (sdiodev->flowctrl) {
+			sdiodev->flowctrl =3D 0;
+			aicwf_sdio_tx_netif_flowctrl(sdiodev->aicwf_hw, false);
+		}
+	}
+	spin_unlock_irqrestore(&sdiodev->tx_flow_lock, flags);
+#endif
+
+	up(&sdiodev->tx_priv->txctl_sema);
+}
+
+static int aicwf_sdio_bus_txdata(struct device *dev, struct sk_buff *pkt)
+{
+	uint prio;
+	int ret =3D -EBADE;
+	struct aicwf_txhdr *txhdr =3D NULL;
+	int headroom =3D 0;
+	struct aicwf_bus *bus_if =3D dev_get_drvdata(dev);
+	struct aic_sdio_dev *sdiodev =3D bus_if->sdiodev;
+#ifdef CONFIG_AIC8800_TX_NETIF_FLOWCTRL
+	unsigned long flags;
+#endif
+
+	if (bus_if->state =3D=3D BUS_DOWN_ST) {
+		dev_err(dev, "bus_if stopped\n");
+		txhdr =3D (struct aicwf_txhdr *)pkt->data;
+		headroom =3D txhdr->sw_hdr->headroom;
+		kmem_cache_free(txhdr->sw_hdr->aicwf_vif->aicwf_hw->sw_txhdr_cache,
+				txhdr->sw_hdr);
+		skb_pull(pkt, headroom);
+		consume_skb(pkt);
+		return -1;
+	}
+
+	prio =3D (pkt->priority & 0x7);
+	spin_lock_bh(&sdiodev->tx_priv->txqlock);
+	if (!aicwf_frame_enq(sdiodev->dev, &sdiodev->tx_priv->txq, pkt, prio)) {
+		txhdr =3D (struct aicwf_txhdr *)pkt->data;
+		headroom =3D txhdr->sw_hdr->headroom;
+		kmem_cache_free(txhdr->sw_hdr->aicwf_vif->aicwf_hw->sw_txhdr_cache,
+				txhdr->sw_hdr);
+		skb_pull(pkt, headroom);
+		consume_skb(pkt);
+		spin_unlock_bh(&sdiodev->tx_priv->txqlock);
+		return -ENOSR;
+		goto flowctrl;
+	} else {
+		ret =3D 0;
+	}
+
+	atomic_inc(&sdiodev->tx_priv->tx_pktcnt);
+	spin_unlock_bh(&sdiodev->tx_priv->txqlock);
+	complete(&bus_if->bustx_trgg);
+
+flowctrl:
+#ifdef CONFIG_AIC8800_TX_NETIF_FLOWCTRL
+	spin_lock_irqsave(&sdiodev->tx_flow_lock, flags);
+	if (atomic_read(&sdiodev->tx_priv->tx_pktcnt) >=3D AICWF_SDIO_TX_HIGH_WAT=
ER) {
+		if (!sdiodev->flowctrl) {
+			sdiodev->flowctrl =3D 1;
+			aicwf_sdio_tx_netif_flowctrl(sdiodev->aicwf_hw, true);
+		}
+	}
+	spin_unlock_irqrestore(&sdiodev->tx_flow_lock, flags);
+#endif
+
+	return ret;
+}
+
+static int aicwf_sdio_bus_txmsg(struct device *dev, u8 *msg, uint msglen)
+{
+	struct aicwf_bus *bus_if =3D dev_get_drvdata(dev);
+	struct aic_sdio_dev *sdiodev =3D bus_if->sdiodev;
+
+	down(&sdiodev->tx_priv->cmd_txsema);
+	sdiodev->tx_priv->cmd_txstate =3D true;
+	sdiodev->tx_priv->cmd_tx_succ =3D false;
+	sdiodev->tx_priv->cmd_buf =3D msg;
+	sdiodev->tx_priv->cmd_len =3D msglen;
+	up(&sdiodev->tx_priv->cmd_txsema);
+
+	if (bus_if->state !=3D BUS_UP_ST) {
+		dev_err(dev, "bus has stop\n");
+		return -1;
+	}
+
+	complete(&bus_if->bustx_trgg);
+	return 0;
+}
+
+int aicwf_sdio_send(struct aicwf_tx_priv *tx_priv, u8 txnow)
+{
+	struct sk_buff *pkt;
+	struct aic_sdio_dev *sdiodev =3D tx_priv->sdiodev;
+	u32 aggr_len =3D 0;
+#ifdef CONFIG_AIC8800_TX_NETIF_FLOWCTRL
+	unsigned long flags;
+#endif
+
+	aggr_len =3D (tx_priv->tail - tx_priv->head);
+	if (((atomic_read(&tx_priv->aggr_count) =3D=3D 0) && aggr_len !=3D 0) ||
+	    ((atomic_read(&tx_priv->aggr_count) !=3D 0) && aggr_len =3D=3D 0)) {
+		if (aggr_len > 0)
+			aicwf_sdio_aggrbuf_reset(tx_priv);
+		return 0;
+	}
+
+	if (atomic_read(&tx_priv->aggr_count) =3D=3D
+	    (tx_priv->fw_avail_bufcnt - DATA_FLOW_CTRL_THRESH)) {
+		if (atomic_read(&tx_priv->aggr_count) > 0) {
+			tx_priv->fw_avail_bufcnt -=3D atomic_read(&tx_priv->aggr_count);
+			aicwf_sdio_aggr_send(tx_priv); // send and check the next pkt;
+		}
+		return 0;
+	}
+	spin_lock_bh(&sdiodev->tx_priv->txqlock);
+	pkt =3D aicwf_frame_dequeue(&sdiodev->tx_priv->txq);
+	if (!pkt) {
+		dev_err(sdiodev->dev, "txq no pkt\n");
+		spin_unlock_bh(&sdiodev->tx_priv->txqlock);
+		return 0;
+	}
+	spin_unlock_bh(&sdiodev->tx_priv->txqlock);
+
+#ifdef CONFIG_AIC8800_TX_NETIF_FLOWCTRL
+	spin_lock_irqsave(&sdiodev->tx_flow_lock, flags);
+	if (atomic_read(&sdiodev->tx_priv->tx_pktcnt) < AICWF_SDIO_TX_LOW_WATER) =
{
+		if (sdiodev->flowctrl) {
+			sdiodev->flowctrl =3D 0;
+			aicwf_sdio_tx_netif_flowctrl(sdiodev->aicwf_hw, false);
+		}
+	}
+	spin_unlock_irqrestore(&sdiodev->tx_flow_lock, flags);
+#endif
+
+	if (!tx_priv || !tx_priv->tail || !pkt)
+		dev_err(sdiodev->dev, "null error\n");
+	if (aicwf_sdio_aggr(tx_priv, pkt)) {
+		aicwf_sdio_aggrbuf_reset(tx_priv);
+		dev_err(sdiodev->dev, "add aggr pkts failed\n");
+		atomic_dec(&sdiodev->tx_priv->tx_pktcnt);
+		return 0;
+	}
+
+	//when aggr finish or there is cmd to send, just send this aggr pkt to fw
+	if ((int)atomic_read(&sdiodev->tx_priv->tx_pktcnt) =3D=3D 1 ||
+	    txnow || (atomic_read(&tx_priv->aggr_count) =3D=3D
+	    (tx_priv->fw_avail_bufcnt - DATA_FLOW_CTRL_THRESH))) {
+		tx_priv->fw_avail_bufcnt -=3D atomic_read(&tx_priv->aggr_count);
+		aicwf_sdio_aggr_send(tx_priv);
+		atomic_dec(&sdiodev->tx_priv->tx_pktcnt);
+		return 0;
+	}
+	atomic_dec(&sdiodev->tx_priv->tx_pktcnt);
+	return 0;
+}
+
+int aicwf_sdio_aggr(struct aicwf_tx_priv *tx_priv, struct sk_buff *pkt)
+{
+	struct aicwf_txhdr *txhdr =3D (struct aicwf_txhdr *)pkt->data;
+	u8 *start_ptr =3D tx_priv->tail;
+	u8 sdio_header[4];
+	u8 adjust_str[4] =3D {0, 0, 0, 0};
+	u32 curr_len =3D 0;
+	int allign_len =3D 0;
+	int headroom;
+
+	sdio_header[0] =3D
+		((pkt->len - txhdr->sw_hdr->headroom + sizeof(struct txdesc_api)) &
+		 0xff);
+	sdio_header[1] =3D
+		(((pkt->len - txhdr->sw_hdr->headroom + sizeof(struct txdesc_api)) >>
+		  8) &
+		 0x0f);
+	sdio_header[2] =3D 0x01; // data
+	if (!tx_priv->sdiodev->chip_hw->use_hdr_checksum)
+		sdio_header[3] =3D 0; // reserved
+	else if (tx_priv->sdiodev->chip_hw->use_hdr_checksum)
+		sdio_header[3] =3D crc8_ponl_107(&sdio_header[0], 3); // crc8
+
+	memcpy(tx_priv->tail, (u8 *)&sdio_header, sizeof(sdio_header));
+	tx_priv->tail +=3D sizeof(sdio_header);
+	// payload
+	memcpy(tx_priv->tail, (u8 *)(long)&txhdr->sw_hdr->desc,
+	       sizeof(struct txdesc_api));
+	tx_priv->tail +=3D sizeof(struct txdesc_api); // hostdesc
+	memcpy(tx_priv->tail, (u8 *)((u8 *)txhdr + txhdr->sw_hdr->headroom),
+	       pkt->len - txhdr->sw_hdr->headroom);
+	tx_priv->tail +=3D (pkt->len - txhdr->sw_hdr->headroom);
+
+	// word alignment
+	curr_len =3D tx_priv->tail - tx_priv->head;
+	if (curr_len & (TX_ALIGNMENT - 1)) {
+		allign_len =3D roundup(curr_len, TX_ALIGNMENT) - curr_len;
+		memcpy(tx_priv->tail, adjust_str, allign_len);
+		tx_priv->tail +=3D allign_len;
+	}
+
+	if (tx_priv->sdiodev->chip_hw->need_fix_hdr_len) {
+		start_ptr[0] =3D ((tx_priv->tail - start_ptr - 4) & 0xff);
+		start_ptr[1] =3D (((tx_priv->tail - start_ptr - 4) >> 8) & 0x0f);
+	}
+	tx_priv->aggr_buf->dev =3D pkt->dev;
+
+	if (!txhdr->sw_hdr->need_cfm) {
+		headroom =3D txhdr->sw_hdr->headroom;
+		kmem_cache_free(txhdr->sw_hdr->aicwf_vif->aicwf_hw->sw_txhdr_cache,
+				txhdr->sw_hdr);
+		skb_pull(pkt, headroom);
+		consume_skb(pkt);
+	}
+
+	atomic_inc(&tx_priv->aggr_count);
+	return 0;
+}
+
+void aicwf_sdio_aggr_send(struct aicwf_tx_priv *tx_priv)
+{
+	struct sk_buff *tx_buf =3D tx_priv->aggr_buf;
+	int ret =3D 0;
+	int curr_len =3D 0;
+
+	// link tail is necessary
+	curr_len =3D tx_priv->tail - tx_priv->head;
+	if ((curr_len % TXPKT_BLOCKSIZE) !=3D 0) {
+		memset(tx_priv->tail, 0, TAIL_LEN);
+		tx_priv->tail +=3D TAIL_LEN;
+	}
+
+	tx_buf->len =3D tx_priv->tail - tx_priv->head;
+	ret =3D aicwf_sdio_txpkt(tx_priv->sdiodev, tx_buf);
+	if (ret < 0)
+		dev_err(tx_priv->sdiodev->dev, "fail to send aggr pkt\n");
+
+	aicwf_sdio_aggrbuf_reset(tx_priv);
+}
+
+void aicwf_sdio_aggrbuf_reset(struct aicwf_tx_priv *tx_priv)
+{
+	struct sk_buff *aggr_buf =3D tx_priv->aggr_buf;
+
+	tx_priv->tail =3D tx_priv->head;
+	aggr_buf->len =3D 0;
+	atomic_set(&tx_priv->aggr_count, 0);
+}
+
+static int aicwf_sdio_bus_start(struct device *dev)
+{
+	struct aicwf_bus *bus_if =3D dev_get_drvdata(dev);
+	struct aic_sdio_dev *sdiodev =3D bus_if->sdiodev;
+	int ret =3D 0;
+
+	if (!sdiodev->func) {
+		dev_warn(sdiodev->dev, "null sdio func\n");
+		return 0;
+	}
+
+	sdio_claim_host(sdiodev->func);
+	ret =3D sdio_claim_irq(sdiodev->func, aicwf_sdio_hal_irqhandler);
+	if (ret) {
+		sdio_release_host(sdiodev->func);
+		dev_err(dev, "claim irq fail %d\n", ret);
+		return ret;
+	}
+	sdiodev->irq_claimed =3D true;
+	if (sdiodev->chip_hw->need_func0_intr) {
+		sdio_f0_writeb(sdiodev->func, 0x07, 0x04, &ret);
+		if (ret)
+			dev_err(dev, "set func0 int en fail %d\n", ret);
+	}
+	sdio_release_host(sdiodev->func);
+
+	// enable sdio interrupt
+	ret =3D aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.intr_config_reg, 0x0=
7);
+	if (ret !=3D 0) {
+		dev_err(dev, "intr register failed:%d\n", ret);
+		return ret;
+	}
+
+	bus_if->state =3D BUS_UP_ST;
+
+	return ret;
+}
+
+#ifdef CONFIG_AIC8800_TXRX_THREAD_PRIO
+
+#include "uapi/linux/sched/types.h"
+#endif
+
+#ifdef CONFIG_OOB
+#define AICWF_SDIO_RX_THREAD_WAIT_MS 1000
+
+// new oob feature
+int sdio_busirq_thread(void *data)
+{
+	struct aicwf_rx_priv *rx_priv =3D (struct aicwf_rx_priv *)data;
+	struct aicwf_bus *bus_if =3D rx_priv->sdiodev->bus_if;
+
+#ifdef CONFIG_AIC8800_TXRX_THREAD_PRIO
+	sched_set_fifo_low(current);
+#endif
+
+	pr_debug("the policy of current thread is:%d\n",
+		 current->policy);
+	pr_debug("the rt_priority of current thread is:%d\n",
+		 current->rt_priority);
+	pr_debug("the current pid is:%d\n", current->pid);
+
+	while (1) {
+		if (kthread_should_stop()) {
+			dev_err(bus_if->dev, "sdio busirq thread stop\n");
+			break;
+		}
+
+		if (!wait_for_completion_timeout(&bus_if->busirq_trgg,
+						 msecs_to_jiffies(AICWF_SDIO_RX_THREAD_WAIT_MS))) {
+			pr_debug("wait for completion timeout\n");
+		}
+
+		if (bus_if->state =3D=3D BUS_DOWN_ST)
+			continue;
+
+#ifdef CONFIG_AIC8800_SDIO_PWRCTRL
+		while (atomic_read(&bus_if->sdiodev->is_bus_suspend) =3D=3D 1 &&
+		       !kthread_should_stop() &&
+		       READ_ONCE(bus_if->state) !=3D BUS_DOWN_ST)
+			msleep(100);
+		if (kthread_should_stop() ||
+		    READ_ONCE(bus_if->state) =3D=3D BUS_DOWN_ST)
+			continue;
+		aicwf_sdio_pwr_stctl(bus_if->sdiodev, SDIO_ACTIVE_ST);
+#endif // CONFIG_AIC8800_SDIO_PWRCTRL
+		aicwf_sdio_hal_irqhandler(bus_if->sdiodev->func);
+	}
+
+	return 0;
+}
+
+#endif // CONFIG_OOB
+
+int sdio_bustx_thread(void *data)
+{
+	struct aicwf_bus *bus =3D (struct aicwf_bus *)data;
+	struct aic_sdio_dev *sdiodev =3D bus->sdiodev;
+
+#ifdef CONFIG_AIC8800_TXRX_THREAD_PRIO
+	sched_set_fifo_low(current);
+#endif
+
+	pr_debug("the policy of current thread is:%d\n",
+		 current->policy);
+	pr_debug("the rt_priority of current thread is:%d\n",
+		 current->rt_priority);
+	pr_debug("the current pid is:%d\n", current->pid);
+
+	while (1) {
+		if (kthread_should_stop()) {
+			dev_err(sdiodev->dev, "sdio bustx thread stop\n");
+			break;
+		}
+
+		if (!wait_for_completion_interruptible(&bus->bustx_trgg)) {
+			if (sdiodev->bus_if->state =3D=3D BUS_DOWN_ST)
+				continue;
+
+			if (!aicwf_sdio_activity_get(sdiodev->aicwf_hw,
+						     sdiodev->aicwf_hw->ws_tx))
+				continue;
+			if ((int)(atomic_read(&sdiodev->tx_priv->tx_pktcnt) > 0) ||
+			    sdiodev->tx_priv->cmd_txstate)
+				aicwf_sdio_tx_process(sdiodev);
+			aicwf_sdio_activity_put(sdiodev->aicwf_hw,
+						sdiodev->aicwf_hw->ws_tx);
+		}
+	}
+
+	return 0;
+}
+
+int sdio_busrx_thread(void *data)
+{
+	struct aicwf_rx_priv *rx_priv =3D (struct aicwf_rx_priv *)data;
+	struct aicwf_bus *bus_if =3D rx_priv->sdiodev->bus_if;
+
+#ifdef CONFIG_AIC8800_TXRX_THREAD_PRIO
+	sched_set_fifo_low(current);
+#endif
+
+	pr_debug("the policy of current thread is:%d\n",
+		 current->policy);
+	pr_debug("the rt_priority of current thread is:%d\n",
+		 current->rt_priority);
+	pr_debug("the current pid is:%d\n", current->pid);
+
+	while (1) {
+		if (kthread_should_stop()) {
+			dev_err(bus_if->dev, "sdio busrx thread stop\n");
+			break;
+		}
+		if (!wait_for_completion_interruptible(&bus_if->busrx_trgg)) {
+			if (bus_if->state =3D=3D BUS_DOWN_ST)
+				continue;
+			if (!aicwf_sdio_activity_get(rx_priv->sdiodev->aicwf_hw,
+						     rx_priv->sdiodev->aicwf_hw->ws_rx))
+				continue;
+			aicwf_process_rxframes(rx_priv);
+			aicwf_sdio_activity_put(rx_priv->sdiodev->aicwf_hw,
+						rx_priv->sdiodev->aicwf_hw->ws_rx);
+		}
+	}
+	return 0;
+}
+
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+static int aicwf_sdio_pwrctl_thread(void *data)
+{
+	struct aic_sdio_dev *sdiodev =3D (struct aic_sdio_dev *)data;
+
+	while (1) {
+		if (kthread_should_stop()) {
+			pr_debug("sdio pwrctl thread stop\n");
+			break;
+		}
+		if (!wait_for_completion_interruptible(&sdiodev->pwrctrl_trgg)) {
+			if (sdiodev->bus_if->state =3D=3D BUS_DOWN_ST)
+				continue;
+
+			if (!aicwf_sdio_activity_get(sdiodev->aicwf_hw,
+						     sdiodev->aicwf_hw->ws_pwrctrl))
+				continue;
+
+			if ((int)(atomic_read(&sdiodev->tx_priv->tx_pktcnt) <=3D 0) &&
+			    !sdiodev->tx_priv->cmd_txstate &&
+				atomic_read(&sdiodev->rx_priv->rx_cnt) =3D=3D 0)
+				aicwf_sdio_pwr_stctl(sdiodev, SDIO_SLEEP_ST);
+			else
+				aicwf_sdio_pwrctl_timer(sdiodev, sdiodev->active_duration);
+
+			aicwf_sdio_activity_put(sdiodev->aicwf_hw,
+						sdiodev->aicwf_hw->ws_pwrctrl);
+		}
+	}
+
+	return 0;
+}
+
+static void aicwf_sdio_bus_pwrctl(struct timer_list *t)
+{
+	struct aic_sdio_dev *sdiodev =3D timer_container_of(sdiodev, t, timer);
+
+	if (sdiodev->bus_if->state =3D=3D BUS_DOWN_ST) {
+		dev_err(sdiodev->dev, "bus down\n");
+		return;
+	}
+
+	if (sdiodev->pwrctl_tsk)
+		complete(&sdiodev->pwrctrl_trgg);
+}
+#endif
+
+#ifdef CONFIG_PREALLOC_RX_SKB
+static void aicwf_sdio_enq_rxpkt(struct aic_sdio_dev *sdiodev,
+				 struct rx_buff *pkt)
+#else
+static void aicwf_sdio_enq_rxpkt(struct aic_sdio_dev *sdiodev,
+				 struct sk_buff *pkt)
+#endif
+{
+	struct aicwf_rx_priv *rx_priv =3D sdiodev->rx_priv;
+	unsigned long flags =3D 0;
+
+	spin_lock_irqsave(&rx_priv->rxqlock, flags);
+#ifdef CONFIG_PREALLOC_RX_SKB
+	if (!aicwf_rxbuff_enqueue(sdiodev->dev, &rx_priv->rxq, pkt)) {
+		spin_unlock_irqrestore(&rx_priv->rxqlock, flags);
+		dev_err(sdiodev->dev, "%d, enqueue rxq fail\n", __LINE__);
+		aicwf_prealloc_rxbuff_free(pkt, &rx_priv->rxbuff_lock);
+		return;
+	}
+#else
+	if (!aicwf_rxframe_enqueue(sdiodev->dev, &rx_priv->rxq, pkt)) {
+		spin_unlock_irqrestore(&rx_priv->rxqlock, flags);
+		aicwf_dev_skb_free(pkt);
+		return;
+	}
+#endif
+	spin_unlock_irqrestore(&rx_priv->rxqlock, flags);
+
+	atomic_inc(&rx_priv->rx_cnt);
+}
+
+#define SDIO_OTHER_INTERRUPT (0x1ul << 7)
+
+void aicwf_sdio_hal_irqhandler(struct sdio_func *func)
+{
+	struct aicwf_bus *bus_if =3D NULL;
+	struct aic_sdio_dev *sdiodev =3D NULL;
+	u8 intstatus =3D 0;
+	u8 byte_len =3D 0;
+#ifdef CONFIG_PREALLOC_RX_SKB
+	struct rx_buff *pkt =3D NULL;
+#else
+	struct sk_buff *pkt =3D NULL;
+#endif
+	int ret;
+	unsigned int retries;
+
+	if (!func) {
+		pr_err("func is null\n");
+		return;
+	}
+
+	bus_if =3D dev_get_drvdata(&func->dev);
+	if (!bus_if || READ_ONCE(bus_if->state) !=3D BUS_UP_ST)
+		return;
+	sdiodev =3D bus_if->sdiodev;
+	if (!sdiodev || !sdiodev->aicwf_hw)
+		return;
+	if (!aicwf_sdio_activity_get(sdiodev->aicwf_hw,
+				     sdiodev->aicwf_hw->ws_irqrx))
+		return;
+
+#ifdef CONFIG_PREALLOC_RX_SKB
+	if (list_empty(&aic_rx_buff_list.rxbuff_list)) {
+		dev_warn(sdiodev->dev, "%d, rxbuff list is empty\n", __LINE__);
+		aicwf_sdio_activity_put(sdiodev->aicwf_hw,
+					sdiodev->aicwf_hw->ws_irqrx);
+		return;
+	}
+#endif
+
+	if (sdiodev->chip_hw->use_func2) {
+		for (retries =3D 0; retries < 16; retries++) {
+			ret =3D aicwf_sdio_readb(sdiodev, sdiodev->sdio_reg.block_cnt_reg,
+					       &intstatus);
+			if (!ret && !(intstatus & SDIO_OTHER_INTERRUPT))
+				break;
+		}
+		if (ret || (intstatus & SDIO_OTHER_INTERRUPT)) {
+			dev_err_ratelimited(&func->dev, "IRQ status unavailable: %d/%#x\n",
+					    ret, intstatus);
+			goto out_activity;
+		}
+		sdiodev->rx_priv->data_len =3D intstatus * SDIOWIFI_FUNC_BLOCKSIZE;
+
+		if (intstatus > 0) {
+			if (intstatus < 64) {
+				pkt =3D aicwf_sdio_readframes(sdiodev);
+			} else {
+				// byte_len must<=3D 128
+				aicwf_sdio_intr_get_len_bytemode(sdiodev, &byte_len);
+				dev_dbg(&func->dev, "byte mode len=3D%d\n", byte_len);
+				pkt =3D aicwf_sdio_readframes(sdiodev);
+			}
+		}
+
+		if (pkt)
+			aicwf_sdio_enq_rxpkt(sdiodev, pkt);
+
+		if (atomic_read(&sdiodev->rx_priv->rx_cnt) =3D=3D 1)
+			complete(&bus_if->busrx_trgg);
+
+	} else {
+		for (retries =3D 0; retries < 16; retries++) {
+			ret =3D aicwf_sdio_readb(sdiodev,
+					       sdiodev->sdio_reg.misc_int_status_reg,
+					       &intstatus);
+			if (!ret)
+				break;
+		}
+		if (ret) {
+			dev_err_ratelimited(&func->dev, "IRQ status read failed: %d\n", ret);
+			goto out_activity;
+		}
+		if (intstatus & SDIO_OTHER_INTERRUPT) {
+			u8 int_pending;
+
+			ret =3D aicwf_sdio_readb(sdiodev, sdiodev->sdio_reg.sleep_reg,
+					       &int_pending);
+			if (ret < 0)
+				goto out_activity;
+			int_pending &=3D ~0x01; // dev to host soft irq
+			ret =3D aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.sleep_reg,
+						int_pending);
+			if (ret < 0)
+				dev_err(&func->dev, "reg:%d write failed\n",
+					sdiodev->sdio_reg.sleep_reg);
+		}
+
+		if (intstatus > 0) {
+			u8 intmaskf2 =3D intstatus | (0x1UL << 3);
+
+			if (intmaskf2 > 120U) {      // func2
+				if (intmaskf2 =3D=3D 127U) { // byte mode
+					// byte_len must<=3D 128
+					aicwf_sdio_intr_get_len_bytemode(sdiodev,
+									 &byte_len);
+					dev_dbg(&func->dev, "byte mode len=3D%d\n", byte_len);
+					pkt =3D aicwf_sdio_readframes(sdiodev);
+				} else { // block mode
+					sdiodev->rx_priv->data_len =3D
+						(intstatus & 0x7U) * SDIOWIFI_FUNC_BLOCKSIZE;
+					pkt =3D aicwf_sdio_readframes(sdiodev);
+				}
+			} else {                     // func1
+				if (intstatus =3D=3D 120U) { // byte mode
+					// byte_len must<=3D 128
+					aicwf_sdio_intr_get_len_bytemode(sdiodev, &byte_len);
+					dev_dbg(&func->dev, "byte mode len=3D%d\n", byte_len);
+					pkt =3D aicwf_sdio_readframes(sdiodev);
+				} else { // block mode
+					sdiodev->rx_priv->data_len =3D
+						(intstatus & 0x7FU) * SDIOWIFI_FUNC_BLOCKSIZE;
+					pkt =3D aicwf_sdio_readframes(sdiodev);
+				}
+			}
+		}
+
+		if (pkt)
+			aicwf_sdio_enq_rxpkt(sdiodev, pkt);
+
+		if (atomic_read(&sdiodev->rx_priv->rx_cnt) =3D=3D 1)
+			complete(&bus_if->busrx_trgg);
+	}
+
+out_activity:
+	aicwf_sdio_activity_put(sdiodev->aicwf_hw,
+				sdiodev->aicwf_hw->ws_irqrx);
+}
+
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+void aicwf_sdio_pwrctl_timer(struct aic_sdio_dev *sdiodev, uint duration)
+{
+	uint timeout;
+
+	if (!IS_ENABLED(CONFIG_AIC8800_SDIO_PWRCTRL))
+		return;
+
+	if (sdiodev->bus_if->state =3D=3D BUS_DOWN_ST && duration)
+		return;
+
+	spin_lock_bh(&sdiodev->pwrctl_lock);
+	if (!duration) {
+		if (timer_pending(&sdiodev->timer))
+			timer_delete_sync(&sdiodev->timer);
+	} else {
+		sdiodev->active_duration =3D duration;
+		timeout =3D msecs_to_jiffies(sdiodev->active_duration);
+		mod_timer(&sdiodev->timer, jiffies + timeout);
+	}
+	spin_unlock_bh(&sdiodev->pwrctl_lock);
+}
+#endif
+
+static const struct aicwf_bus_ops aicwf_sdio_bus_ops =3D {
+	.start =3D aicwf_sdio_bus_start,
+	.stop =3D aicwf_sdio_bus_stop,
+	.txdata =3D aicwf_sdio_bus_txdata,
+	.txmsg =3D aicwf_sdio_bus_txmsg,
+};
+
+/* Called with hardware state alive, after interfaces have been closed. */
+void aicwf_sdio_quiesce(struct aic_sdio_dev *sdiodev)
+{
+	struct aicwf_bus *bus_if =3D sdiodev->bus_if;
+	int ret;
+
+	if (sdiodev->quiesced)
+		return;
+	WRITE_ONCE(sdiodev->quiesced, true);
+
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+	if (sdiodev->aicwf_hw && bus_if->state =3D=3D BUS_UP_ST)
+		aicwf_sdio_pwr_stctl(sdiodev, SDIO_SLEEP_ST);
+#endif
+	aicwf_cmd_mgr_stop(&sdiodev->cmd_mgr);
+	WRITE_ONCE(bus_if->state, BUS_DOWN_ST);
+
+	if (sdiodev->irq_claimed) {
+		sdio_claim_host(sdiodev->func);
+		ret =3D aicwf_sdio_writeb(sdiodev,
+					sdiodev->sdio_reg.intr_config_reg, 0);
+		if (ret)
+			dev_err(sdiodev->dev, "failed to disable SDIO interrupt: %d\n",
+				ret);
+		sdio_release_irq(sdiodev->func);
+		sdio_release_host(sdiodev->func);
+		sdiodev->irq_claimed =3D false;
+	}
+
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+	timer_shutdown_sync(&sdiodev->timer);
+	if (sdiodev->pwrctl_tsk) {
+		complete_all(&sdiodev->pwrctrl_trgg);
+		kthread_stop(sdiodev->pwrctl_tsk);
+		sdiodev->pwrctl_tsk =3D NULL;
+	}
+#endif
+
+	/* No MMC host claim may be held while waiting for the bus threads. */
+	if (bus_if->bustx_thread) {
+		sched_set_normal(bus_if->bustx_thread, 0);
+		complete_all(&bus_if->bustx_trgg);
+		kthread_stop(bus_if->bustx_thread);
+		bus_if->bustx_thread =3D NULL;
+	}
+	if (sdiodev->rx_priv) {
+		aicwf_rx_deinit(sdiodev->rx_priv);
+		sdiodev->rx_priv =3D NULL;
+	}
+	aicwf_bus_stop(bus_if);
+}
+
+void aicwf_sdio_release(struct aic_sdio_dev *sdiodev)
+{
+	if (sdiodev->aicwf_hw && sdiodev->aicwf_hw->plat->enabled)
+		aicwf_platform_deinit(sdiodev->aicwf_hw);
+
+	aicwf_sdio_quiesce(sdiodev);
+	aicwf_cmd_mgr_deinit(&sdiodev->cmd_mgr);
+	aicwf_bus_deinit(sdiodev->dev);
+	aicwf_tx_deinit(sdiodev->tx_priv);
+	sdiodev->tx_priv =3D NULL;
+}
+
+void aicwf_sdio_reg_init(struct aic_sdio_dev *sdiodev)
+{
+	if (sdiodev->chip_hw->use_func2) {
+		sdiodev->sdio_reg.bytemode_len_reg =3D SDIOWIFI_BYTEMODE_LEN_REG;
+		sdiodev->sdio_reg.intr_config_reg =3D SDIOWIFI_INTR_CONFIG_REG;
+		sdiodev->sdio_reg.sleep_reg =3D SDIOWIFI_SLEEP_REG;
+		sdiodev->sdio_reg.wakeup_reg =3D SDIOWIFI_WAKEUP_REG;
+		sdiodev->sdio_reg.flow_ctrl_reg =3D SDIOWIFI_FLOW_CTRL_REG;
+		sdiodev->sdio_reg.register_block =3D SDIOWIFI_REGISTER_BLOCK;
+		sdiodev->sdio_reg.bytemode_enable_reg =3D SDIOWIFI_BYTEMODE_ENABLE_REG;
+		sdiodev->sdio_reg.block_cnt_reg =3D SDIOWIFI_BLOCK_CNT_REG;
+		sdiodev->sdio_reg.rd_fifo_addr =3D SDIOWIFI_RD_FIFO_ADDR;
+		sdiodev->sdio_reg.wr_fifo_addr =3D SDIOWIFI_WR_FIFO_ADDR;
+	} else {
+		sdiodev->sdio_reg.bytemode_len_reg =3D SDIOWIFI_BYTEMODE_LEN_REG_V3;
+		sdiodev->sdio_reg.intr_config_reg =3D SDIOWIFI_INTR_ENABLE_REG_V3;
+		sdiodev->sdio_reg.sleep_reg =3D SDIOWIFI_INTR_PENDING_REG_V3;
+		sdiodev->sdio_reg.wakeup_reg =3D SDIOWIFI_INTR_TO_DEVICE_REG_V3;
+		sdiodev->sdio_reg.flow_ctrl_reg =3D SDIOWIFI_FLOW_CTRL_Q1_REG_V3;
+		sdiodev->sdio_reg.bytemode_enable_reg =3D SDIOWIFI_BYTEMODE_ENABLE_REG_V=
3;
+		sdiodev->sdio_reg.misc_int_status_reg =3D SDIOWIFI_MISC_INT_STATUS_REG_V=
3;
+		sdiodev->sdio_reg.rd_fifo_addr =3D SDIOWIFI_RD_FIFO_ADDR_V3;
+		sdiodev->sdio_reg.wr_fifo_addr =3D SDIOWIFI_WR_FIFO_ADDR_V3;
+	}
+}
+
+int aicwf_sdio_func_init(struct aic_sdio_dev *sdiodev)
+{
+	struct mmc_host *host;
+	u8 block_bit0 =3D 0x1;
+	u8 byte_mode_disable =3D 0x1; // 1: no byte mode
+	int ret =3D 0;
+
+	aicwf_sdio_reg_init(sdiodev);
+	if (!sdiodev->func) {
+		dev_warn(sdiodev->dev, "null sdio func\n");
+		return 0;
+	}
+
+	host =3D sdiodev->func->card->host;
+
+	sdio_claim_host(sdiodev->func);
+	ret =3D sdio_set_block_size(sdiodev->func, SDIOWIFI_FUNC_BLOCKSIZE);
+	if (ret < 0) {
+		dev_err(sdiodev->dev, "set blocksize fail %d\n", ret);
+		sdio_release_host(sdiodev->func);
+		return ret;
+	}
+	ret =3D sdio_enable_func(sdiodev->func);
+	if (ret < 0) {
+		sdio_release_host(sdiodev->func);
+		dev_err(sdiodev->dev, "enable func fail %d\n", ret);
+		return ret;
+	}
+
+	if (sdiodev->chip_hw->sdio_clock > 0) {
+		host->ios.clock =3D sdiodev->chip_hw->sdio_clock;
+		host->ops->set_ios(host, &host->ios);
+		dev_dbg(sdiodev->dev, "set SDIO Clock %d MHz\n", host->ios.clock / 10000=
00);
+	}
+
+	sdio_release_host(sdiodev->func);
+
+	if (sdiodev->chip_hw->use_func2) {
+		sdio_claim_host(sdiodev->func2);
+		//set sdio blocksize
+		ret =3D sdio_set_block_size(sdiodev->func2, SDIOWIFI_FUNC_BLOCKSIZE);
+		if (ret < 0) {
+			dev_err(sdiodev->dev, "set func2 blocksize fail %d\n", ret);
+			sdio_release_host(sdiodev->func2);
+			return ret;
+		}
+
+		//set sdio enable func
+		ret =3D sdio_enable_func(sdiodev->func2);
+		if (ret < 0) {
+			sdio_release_host(sdiodev->func2);
+			dev_err(sdiodev->dev, "enable func2 fail %d\n", ret);
+			return ret;
+		}
+
+		sdio_release_host(sdiodev->func2);
+
+		ret =3D aicwf_sdio_func2_writeb(sdiodev,
+					      sdiodev->sdio_reg.register_block, block_bit0);
+		if (ret < 0) {
+			dev_err(sdiodev->dev, "reg:%d write failed\n",
+				sdiodev->sdio_reg.register_block);
+			return ret;
+		}
+
+		//1: no byte mode
+		ret =3D aicwf_sdio_func2_writeb(sdiodev, sdiodev->sdio_reg.bytemode_enab=
le_reg,
+					      byte_mode_disable);
+		if (ret < 0) {
+			dev_err(sdiodev->dev, "reg:%d write failed\n",
+				sdiodev->sdio_reg.bytemode_enable_reg);
+			return ret;
+		}
+	}
+
+	ret =3D aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.register_block, bloc=
k_bit0);
+	if (ret < 0) {
+		dev_err(sdiodev->dev, "reg:%d write failed\n", sdiodev->sdio_reg.registe=
r_block);
+		return ret;
+	}
+
+	//1: no byte mode
+	ret =3D aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.bytemode_enable_reg,=
 byte_mode_disable);
+	if (ret < 0) {
+		dev_err(sdiodev->dev, "reg:%d write failed\n", sdiodev->sdio_reg.bytemod=
e_enable_reg);
+		return ret;
+	}
+
+	mdelay(10);
+	return ret;
+}
+
+int aicwf_sdiov3_func_init(struct aic_sdio_dev *sdiodev)
+{
+	struct mmc_host *host;
+	u8 byte_mode_disable =3D 0x1; // 1: no byte mode
+	int ret =3D 0;
+	u8 val1 =3D 0;
+	int val;
+
+	aicwf_sdio_reg_init(sdiodev);
+
+	if (!sdiodev->func) {
+		dev_warn(sdiodev->dev, "null sdio func\n");
+		return 0;
+	}
+
+	host =3D sdiodev->func->card->host;
+
+	sdio_claim_host(sdiodev->func);
+	sdiodev->func->card->quirks |=3D MMC_QUIRK_LENIENT_FN0;
+
+	ret =3D sdio_set_block_size(sdiodev->func, SDIOWIFI_FUNC_BLOCKSIZE);
+	if (ret < 0) {
+		dev_err(sdiodev->dev, "set blocksize fail %d\n", ret);
+		sdio_release_host(sdiodev->func);
+		return ret;
+	}
+	ret =3D sdio_enable_func(sdiodev->func);
+	if (ret < 0) {
+		sdio_release_host(sdiodev->func);
+		dev_err(sdiodev->dev, "enable func fail %d\n", ret);
+		return ret;
+	}
+
+	sdio_f0_writeb(sdiodev->func, 0x7F, 0xF2, &ret);
+	if (ret) {
+		dev_err(sdiodev->dev, "set fn0 0xF2 fail %d\n", ret);
+		sdio_release_host(sdiodev->func);
+		return ret;
+	}
+	if (host->ios.timing =3D=3D MMC_TIMING_UHS_DDR50)
+		val =3D 0x20;
+	else
+		val =3D 0x00;
+	val |=3D SDIOCLK_FREE_RUNNING_BIT;
+	sdio_f0_writeb(sdiodev->func, val, 0xF0, &ret);
+	if (ret) {
+		dev_err(sdiodev->dev, "set iopad ctrl fail %d\n", ret);
+		sdio_release_host(sdiodev->func);
+		return ret;
+	}
+	sdio_f0_writeb(sdiodev->func, 0x0, 0xF8, &ret);
+	if (ret) {
+		dev_err(sdiodev->dev, "set iopad delay2 fail %d\n", ret);
+		sdio_release_host(sdiodev->func);
+		return ret;
+	}
+	sdio_f0_writeb(sdiodev->func, 0x00, 0xF1, &ret);
+	if (ret) {
+		dev_err(sdiodev->dev, "set iopad delay1 fail %d\n", ret);
+		sdio_release_host(sdiodev->func);
+		return ret;
+	}
+	usleep_range(1000, 1500);
+	sdio_release_host(sdiodev->func);
+
+	// 1: no byte mode
+	ret =3D aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.bytemode_enable_reg,
+				byte_mode_disable);
+	if (ret < 0) {
+		dev_err(sdiodev->dev, "reg:%d write failed\n",
+			sdiodev->sdio_reg.bytemode_enable_reg);
+		return ret;
+	}
+
+	ret =3D aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.wakeup_reg, 0x11);
+	if (ret < 0) {
+		dev_err(sdiodev->dev, "reg:%d write failed\n",
+			sdiodev->sdio_reg.wakeup_reg);
+		return ret;
+	}
+
+	mdelay(5);
+	ret =3D aicwf_sdio_readb(sdiodev, sdiodev->sdio_reg.sleep_reg, &val1);
+	if (ret < 0) {
+		dev_err(sdiodev->dev, "reg:%d read failed\n",
+			sdiodev->sdio_reg.sleep_reg);
+		return ret;
+	}
+
+	if (!(val1 & 0x10))
+		dev_err(sdiodev->dev, "wakeup fail\n");
+	else
+		dev_dbg(sdiodev->dev, "sdio ready\n");
+
+	return ret;
+}
+
+/**
+ * aicwf_sdio_fw_started() - Hand the SDIO function over to the firmware
+ * @sdiodev: SDIO device whose firmware has just been started
+ *
+ * Redo the SDIO function setup against the running firmware and switch th=
e
+ * power control from the bootrom handshake to the firmware one.  The next
+ * transfer wakes the firmware up again.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int aicwf_sdio_fw_started(struct aic_sdio_dev *sdiodev)
+{
+	int ret;
+
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+	down(&sdiodev->pwrctl_wakeup_sema);
+#endif
+	if (sdiodev->chip_hw->use_sdiov3_func)
+		ret =3D aicwf_sdiov3_func_init(sdiodev);
+	else
+		ret =3D aicwf_sdio_func_init(sdiodev);
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+	sdiodev->fw_running =3D true;
+	sdiodev->state =3D SDIO_SLEEP_ST;
+	up(&sdiodev->pwrctl_wakeup_sema);
+#endif
+
+	return ret;
+}
+
+void aicwf_sdio_func_deinit(struct aic_sdio_dev *sdiodev)
+{
+	if (!sdiodev->func) {
+		dev_warn(sdiodev->dev, "null sdio func\n");
+		return;
+	}
+
+	sdio_claim_host(sdiodev->func);
+	sdio_disable_func(sdiodev->func);
+	sdio_release_host(sdiodev->func);
+
+	if (sdiodev->chip_hw->use_func2) {
+		sdio_claim_host(sdiodev->func2);
+		sdio_disable_func(sdiodev->func2);
+		sdio_release_host(sdiodev->func2);
+	}
+}
+
+void *aicwf_sdio_bus_init(struct aic_sdio_dev *sdiodev)
+{
+	int ret;
+	struct aicwf_bus *bus_if;
+	struct aicwf_rx_priv *rx_priv;
+	struct aicwf_tx_priv *tx_priv;
+
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+	spin_lock_init(&sdiodev->pwrctl_lock);
+	sema_init(&sdiodev->pwrctl_wakeup_sema, 1);
+	timer_setup(&sdiodev->timer, aicwf_sdio_bus_pwrctl, 0);
+	init_completion(&sdiodev->pwrctrl_trgg);
+#endif
+
+	bus_if =3D sdiodev->bus_if;
+	bus_if->dev =3D sdiodev->dev;
+	bus_if->ops =3D &aicwf_sdio_bus_ops;
+	bus_if->state =3D BUS_DOWN_ST;
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+	sdiodev->state =3D SDIO_SLEEP_ST;
+	sdiodev->active_duration =3D SDIOWIFI_PWR_CTRL_INTERVAL;
+#else
+	sdiodev->state =3D SDIO_ACTIVE_ST;
+#endif
+
+	rx_priv =3D aicwf_rx_init(sdiodev);
+	if (!rx_priv) {
+		dev_err(sdiodev->dev, "rx init fail\n");
+		goto fail;
+	}
+	sdiodev->rx_priv =3D rx_priv;
+
+	tx_priv =3D aicwf_tx_init(sdiodev);
+	if (!tx_priv) {
+		dev_err(sdiodev->dev, "tx init fail\n");
+		goto fail;
+	}
+	sdiodev->tx_priv =3D tx_priv;
+	aicwf_frame_queue_init(&tx_priv->txq, 8, TXQLEN);
+	spin_lock_init(&tx_priv->txqlock);
+	sema_init(&tx_priv->txctl_sema, 1);
+	sema_init(&tx_priv->cmd_txsema, 1);
+	init_waitqueue_head(&tx_priv->cmd_txdone_wait);
+	atomic_set(&tx_priv->tx_pktcnt, 0);
+
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+	sdiodev->pwrctl_tsk =3D
+		kthread_run(aicwf_sdio_pwrctl_thread, sdiodev, "aicwf_pwrctl");
+	if (IS_ERR(sdiodev->pwrctl_tsk)) {
+		sdiodev->pwrctl_tsk =3D NULL;
+		goto fail;
+	}
+#endif
+#ifdef CONFIG_AIC8800_TX_NETIF_FLOWCTRL
+	sdiodev->flowctrl =3D 0;
+	spin_lock_init(&sdiodev->tx_flow_lock);
+#endif
+
+	spin_lock_init(&sdiodev->tx_tp_lock);
+	atomic_set(&sdiodev->suspending, 0);
+	atomic_set(&sdiodev->activity_count, 0);
+	init_waitqueue_head(&sdiodev->activity_waitq);
+	ret =3D aicwf_bus_init(0, sdiodev->dev);
+	if (ret < 0) {
+		dev_err(sdiodev->dev, "bus init fail\n");
+		goto fail;
+	}
+
+	return sdiodev;
+
+fail:
+	aicwf_sdio_release(sdiodev);
+	return NULL;
+}
+
+u8 crc8_ponl_107(u8 *p_buffer, uint16_t cal_size)
+{
+	u8 i;
+	u8 crc =3D 0;
+
+	if (cal_size =3D=3D 0)
+		return crc;
+	while (cal_size--) {
+		for (i =3D 0x80; i > 0; i /=3D 2) {
+			if (crc & 0x80) {
+				crc *=3D 2;
+				crc ^=3D 0x07; // polynomial X8 + X2 + X + 1,(0x107)
+			} else {
+				crc *=3D 2;
+			}
+			if ((*p_buffer) & i)
+				crc ^=3D 0x07;
+		}
+		p_buffer++;
+	}
+
+	return crc;
+}
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_sdio.h b/drivers/n=
et/wireless/aic/aic8800_fdrv/aicwf_sdio.h
new file mode 100644
index 000000000000..21881a2e6af5
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_sdio.h
@@ -0,0 +1,280 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_SDMMC_H_
+#define _AICWF_SDMMC_H_
+
+#include "aicwf_resv_mem.h"
+#include "aicwf_rx_prealloc.h"
+#include "aicwf_txq_prealloc.h"
+#include "aicwf_cmds.h"
+#include <linux/ieee80211.h>
+#include <linux/if_ether.h>
+#include <linux/semaphore.h>
+#include <linux/skbuff.h>
+#include <linux/mmc/card.h>
+#include <linux/mmc/host.h>
+#include <linux/mmc/sdio.h>
+#include <linux/mmc/sdio_func.h>
+#include <linux/mmc/sdio_ids.h>
+#include <linux/wait.h>
+
+#define AICWF_SDIO_NAME         "aicwf_sdio"
+#define SDIOWIFI_FUNC_BLOCKSIZE 512
+
+#define SDIOWIFI_BYTEMODE_LEN_REG    0x02
+#define SDIOWIFI_INTR_CONFIG_REG     0x04
+#define SDIOWIFI_SLEEP_REG           0x05
+#define SDIOWIFI_WAKEUP_REG          0x09
+#define SDIOWIFI_FLOW_CTRL_REG       0x0A
+#define SDIOWIFI_REGISTER_BLOCK      0x0B
+#define SDIOWIFI_BYTEMODE_ENABLE_REG 0x11
+#define SDIOWIFI_BLOCK_CNT_REG       0x12
+#define SDIOWIFI_FLOWCTRL_MASK_REG   0x7F
+#define SDIOWIFI_WR_FIFO_ADDR        0x07
+#define SDIOWIFI_RD_FIFO_ADDR        0x08
+
+#define SDIOWIFI_INTR_ENABLE_REG_V3      0x00
+#define SDIOWIFI_INTR_PENDING_REG_V3     0x01
+#define SDIOWIFI_INTR_TO_DEVICE_REG_V3   0x02
+#define SDIOWIFI_FLOW_CTRL_Q1_REG_V3     0x03
+#define SDIOWIFI_MISC_INT_STATUS_REG_V3  0x04
+#define SDIOWIFI_BYTEMODE_LEN_REG_V3     0x05
+#define SDIOWIFI_BYTEMODE_LEN_MSB_REG_V3 0x06
+#define SDIOWIFI_BYTEMODE_ENABLE_REG_V3  0x07
+#define SDIOWIFI_MISC_CTRL_REG_V3        0x08
+#define SDIOWIFI_FLOW_CTRL_Q2_REG_V3     0x09
+#define SDIOWIFI_CLK_TEST_RESULT_REG_V3  0x0A
+#define SDIOWIFI_RD_FIFO_ADDR_V3         0x0F
+#define SDIOWIFI_WR_FIFO_ADDR_V3         0x10
+
+#define SDIOCLK_FREE_RUNNING_BIT BIT(6)
+
+#define SDIOWIFI_CLOCK    50000000  /* target SDIO clock rate */
+#define SDIOWIFI_CLOCK_V3 150000000 /* target SDIO clock rate, SDIO v3 chi=
ps */
+
+#define SDIOWIFI_PWR_CTRL_INTERVAL 30
+#define FLOW_CTRL_RETRY_COUNT      50
+#define BUFFER_SIZE                1536
+#define TAIL_LEN                   4
+#define TXQLEN                     (2048 * 4)
+
+#define SDIO_SLEEP_ST  0
+#define SDIO_ACTIVE_ST 1
+
+#define DATA_FLOW_CTRL_THRESH 2
+#ifdef CONFIG_AIC8800_TX_NETIF_FLOWCTRL
+#define AICWF_SDIO_TX_LOW_WATER  100
+#define AICWF_SDIO_TX_HIGH_WATER 500
+#endif
+
+#ifdef CONFIG_AIC8800_TEMP_CONTROL
+#define TEMP_GET_INTERVAL (10 * 1000)
+#define TEMP_THD_1        92  // temperature 1 (celsius)
+#define TEMP_THD_2        103 // temperature 2 (celsius)
+#define BUFFERING_V1      8
+#define BUFFERING_V2      8
+#define TMR_INTERVAL_1    60  // timer_1 60ms
+#define TMR_INTERVAL_2    180 // timer_2 130ms
+#endif
+
+/* SDIO Device ID */
+#define SDIO_VENDOR_ID_AIC8801    0x5449
+#define SDIO_VENDOR_ID_AIC8800DC  0xc8a1
+#define SDIO_VENDOR_ID_AIC8800D80 0xc8a1
+#define SDIO_VENDOR_ID_AIC8800D80N 0xc8a1
+
+#define SDIO_DEVICE_ID_AIC8801    0x0145
+#define SDIO_DEVICE_ID_AIC8800DC  0xc08d
+#define SDIO_DEVICE_ID_AIC8800D80 0x0082
+#define SDIO_DEVICE_ID_AIC8800D80N  0x9081
+#define SDIO_DEVICE_ID_AIC8800D80LN 0x9082
+#define SDIO_DEVICE_ID_AIC8800D40N  0x9084
+#define SDIO_DEVICE_ID_AIC8800D40LN 0x9085
+
+enum sdio_type {
+	SDIO_TYPE_DATA =3D 0X00,
+	SDIO_TYPE_CFG =3D 0X10,
+	SDIO_TYPE_CFG_CMD_RSP =3D 0X11,
+	SDIO_TYPE_CFG_DATA_CFM =3D 0X12,
+	SDIO_TYPE_CFG_PRINT =3D 0X13
+};
+
+enum AICWF_IC {
+	PRODUCT_ID_AIC8801 =3D 0,
+	PRODUCT_ID_AIC8800DC,
+	PRODUCT_ID_AIC8800DW,
+	PRODUCT_ID_AIC8800D80,
+	PRODUCT_ID_AIC8800D80N,
+};
+
+struct aicwf_hw;
+struct wakeup_source;
+struct aic_sdio_chip_hw;
+
+#ifdef CONFIG_AIC8800_TEMP_CONTROL
+struct temp_ctrl {
+	struct timer_list netif_timer;
+	struct timer_list tp_ctrl_timer;
+	struct work_struct tp_ctrl_work;
+	struct work_struct netif_work;
+	/* lock for temp */
+	spinlock_t tm_lock;
+	s8 cur_temp;
+	bool net_stop;
+	bool on_off;      // for command, 0 - off, 1 - on
+	s8 get_level; // for command, 0 - 100%, 1 - 12%, 2 - 3%
+	s8 set_level; // for command, 0 - driver auto, 1 - 12%, 2 - 3%
+	int interval_t1;
+	int interval_t2;
+	u8 cur_stat; // 0--normal temp, 1/2--buffering temp
+	s8 tp_thd_1; // temperature threshold 1
+	s8 tp_thd_2; // temperature threshold 2
+	s8 tm_start; //timer start flag
+};
+#endif
+
+struct aic_sdio_reg {
+	u8 bytemode_len_reg;
+	u8 intr_config_reg;
+	u8 sleep_reg;
+	u8 wakeup_reg;
+	u8 flow_ctrl_reg;
+	u8 register_block;
+	u8 bytemode_enable_reg;
+	u8 block_cnt_reg;
+	u8 misc_int_status_reg;
+	u8 rd_fifo_addr;
+	u8 wr_fifo_addr;
+};
+
+struct aic_sdio_dev {
+	struct aicwf_hw *aicwf_hw;
+	/* Platform of this device, %NULL until platform init has succeeded */
+	struct aicwf_plat *plat;
+	struct sdio_func *func;
+	struct sdio_func *func2;
+	struct device *dev;
+	struct aicwf_bus *bus_if;
+	struct aicwf_cmd_mgr cmd_mgr;
+
+	struct aicwf_rx_priv *rx_priv;
+	struct aicwf_tx_priv *tx_priv;
+	/* Buffers kept for the lifetime of this device */
+	struct aicwf_resv_mem resv_mem;
+	struct aicwf_prealloc_txq prealloc_txq;
+	u32 state;
+	bool irq_claimed;
+	bool quiesced;
+#ifdef CONFIG_AIC8800_TX_NETIF_FLOWCTRL
+	u8 flowctrl;
+	/* lock for tx flow */
+	spinlock_t tx_flow_lock;
+#endif
+
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+	// for sdio pwr ctrl
+	struct timer_list timer;
+	uint active_duration;
+	struct completion pwrctrl_trgg;
+	struct task_struct *pwrctl_tsk;
+	/* lock for pwrctl */
+	spinlock_t pwrctl_lock;
+	struct semaphore pwrctl_wakeup_sema;
+	/* The firmware has been booted; until then the bootrom answers. */
+	bool fw_running;
+#endif
+	u16 chipid;
+	/* Properties of the chip, selected from @chipid at probe time */
+	const struct aic_sdio_chip_hw *chip_hw;
+	struct aic_sdio_reg sdio_reg;
+
+	/* lock for ws */
+	spinlock_t wslock;
+	bool oob_enable;
+	atomic_t is_bus_suspend;
+	atomic_t suspending;
+	atomic_t activity_count;
+	wait_queue_head_t activity_waitq;
+	/* lock for tx tp */
+	spinlock_t tx_tp_lock;
+
+#ifdef CONFIG_AIC8800_TEMP_CONTROL
+	struct temp_ctrl tp_ctrl;
+#endif
+};
+
+int aicwf_sdio_readb(struct aic_sdio_dev *sdiodev, uint regaddr, u8 *val);
+int aicwf_sdio_writeb(struct aic_sdio_dev *sdiodev, uint regaddr, u8 val);
+void aicwf_sdio_hal_irqhandler(struct sdio_func *func);
+bool aicwf_sdio_activity_get(struct aicwf_hw *aicwf_hw,
+			     struct wakeup_source *ws);
+void aicwf_sdio_activity_put(struct aicwf_hw *aicwf_hw,
+			     struct wakeup_source *ws);
+bool aicwf_sdio_scan_activity_get(struct aicwf_hw *aicwf_hw);
+void aicwf_sdio_scan_activity_put(struct aicwf_hw *aicwf_hw);
+int aicwf_sdio_func2_readb(struct aic_sdio_dev *sdiodev, uint regaddr, u8 =
*val);
+int aicwf_sdio_func2_writeb(struct aic_sdio_dev *sdiodev, uint regaddr, u8=
 val);
+
+#ifdef CONFIG_PREALLOC_RX_SKB
+struct rx_buff *aicwf_sdio_readframes(struct aic_sdio_dev *sdiodev);
+#else
+struct sk_buff *aicwf_sdio_readframes(struct aic_sdio_dev *sdiodev);
+#endif
+
+#ifdef CONFIG_AIC8800_TEMP_CONTROL
+void aicwf_netif_worker(struct work_struct *work);
+void aicwf_temp_ctrl_worker(struct work_struct *work);
+void aicwf_temp_ctrl(struct aic_sdio_dev *sdiodev);
+void aicwf_netif_ctrl(struct aic_sdio_dev *sdiodev, int val);
+void aicwf_tp_ctrl_init(struct aic_sdio_dev *sdiodev);
+void aicwf_tp_ctrl_deinit(struct aic_sdio_dev *sdiodev);
+#endif
+
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+void aicwf_sdio_pwrctl_timer(struct aic_sdio_dev *sdiodev, uint duration);
+int aicwf_sdio_pwr_stctl(struct aic_sdio_dev *sdiodev, uint target);
+int aicwf_sdio_sleep_allow(struct aic_sdio_dev *sdiodev);
+int aicwf_sdio_wakeup(struct aic_sdio_dev *sdiodev);
+#endif
+
+void aicwf_sdio_reg_init(struct aic_sdio_dev *sdiodev);
+int aicwf_sdio_func_init(struct aic_sdio_dev *sdiodev);
+int aicwf_sdiov3_func_init(struct aic_sdio_dev *sdiodev);
+int aicwf_sdio_fw_started(struct aic_sdio_dev *sdiodev);
+void aicwf_sdio_func_deinit(struct aic_sdio_dev *sdiodev);
+#ifdef CONFIG_AIC8800_TX_NETIF_FLOWCTRL
+void aicwf_sdio_tx_netif_flowctrl(struct aicwf_hw *aicwf_hw, bool state);
+#endif
+int aicwf_sdio_flow_ctrl(struct aic_sdio_dev *sdiodev);
+int aicwf_sdio_flow_ctrl_msg(struct aic_sdio_dev *sdiodev);
+#ifdef CONFIG_PREALLOC_RX_SKB
+int aicwf_sdio_recv_pkt(struct aic_sdio_dev *sdiodev, struct rx_buff *rxbb=
uf,
+			u32 size);
+#else
+int aicwf_sdio_recv_pkt(struct aic_sdio_dev *sdiodev, struct sk_buff *skbb=
uf,
+			u32 size);
+#endif
+int aicwf_sdio_send_pkt(struct aic_sdio_dev *sdiodev, u8 *buf, uint count)=
;
+void *aicwf_sdio_bus_init(struct aic_sdio_dev *sdiodev);
+void aicwf_sdio_quiesce(struct aic_sdio_dev *sdiodev);
+void aicwf_sdio_release(struct aic_sdio_dev *sdiodev);
+void aicwf_sdio_exit(void);
+int aicwf_sdio_register(void);
+int aicwf_sdio_txpkt(struct aic_sdio_dev *sdiodev, struct sk_buff *pkt);
+int sdio_bustx_thread(void *data);
+int sdio_busrx_thread(void *data);
+#ifdef CONFIG_OOB
+// new oob feature
+int sdio_busirq_thread(void *data);
+#endif // CONFIG_OOB
+int aicwf_sdio_aggr(struct aicwf_tx_priv *tx_priv, struct sk_buff *pkt);
+int aicwf_sdio_send(struct aicwf_tx_priv *tx_priv, u8 txnow);
+void aicwf_sdio_aggr_send(struct aicwf_tx_priv *tx_priv);
+void aicwf_sdio_aggrbuf_reset(struct aicwf_tx_priv *tx_priv);
+
+u8 crc8_ponl_107(u8 *p_buffer, uint16_t cal_size);
+
+#endif /*_AICWF_SDMMC_H_*/
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_strs.c b/drivers/n=
et/wireless/aic/aic8800_fdrv/aicwf_strs.c
new file mode 100644
index 000000000000..79fc28f2872d
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_strs.c
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *************************************************************************=
***************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @file aicwf_strs.c
+ *
+ * @brief Miscellaneous debug strings
+ *
+ *************************************************************************=
***************
+ */
+
+#include "lmac_msg.h"
+#include "aicwf_strs.h"
+static const char *const aicwf_mmid2str[MSG_I(MM_MAX)] =3D {
+	[MSG_I(MM_RESET_REQ)] =3D "MM_RESET_REQ",
+	[MSG_I(MM_RESET_CFM)] =3D "MM_RESET_CFM",
+	[MSG_I(MM_START_REQ)] =3D "MM_START_REQ",
+	[MSG_I(MM_START_CFM)] =3D "MM_START_CFM",
+	[MSG_I(MM_VERSION_REQ)] =3D "MM_VERSION_REQ",
+	[MSG_I(MM_VERSION_CFM)] =3D "MM_VERSION_CFM",
+	[MSG_I(MM_ADD_IF_REQ)] =3D "MM_ADD_IF_REQ",
+	[MSG_I(MM_ADD_IF_CFM)] =3D "MM_ADD_IF_CFM",
+	[MSG_I(MM_REMOVE_IF_REQ)] =3D "MM_REMOVE_IF_REQ",
+	[MSG_I(MM_REMOVE_IF_CFM)] =3D "MM_REMOVE_IF_CFM",
+	[MSG_I(MM_STA_ADD_REQ)] =3D "MM_STA_ADD_REQ",
+	[MSG_I(MM_STA_ADD_CFM)] =3D "MM_STA_ADD_CFM",
+	[MSG_I(MM_STA_DEL_REQ)] =3D "MM_STA_DEL_REQ",
+	[MSG_I(MM_STA_DEL_CFM)] =3D "MM_STA_DEL_CFM",
+	[MSG_I(MM_SET_FILTER_REQ)] =3D "MM_SET_FILTER_REQ",
+	[MSG_I(MM_SET_FILTER_CFM)] =3D "MM_SET_FILTER_CFM",
+	[MSG_I(MM_SET_CHANNEL_REQ)] =3D "MM_SET_CHANNEL_REQ",
+	[MSG_I(MM_SET_CHANNEL_CFM)] =3D "MM_SET_CHANNEL_CFM",
+	[MSG_I(MM_SET_DTIM_REQ)] =3D "MM_SET_DTIM_REQ",
+	[MSG_I(MM_SET_DTIM_CFM)] =3D "MM_SET_DTIM_CFM",
+	[MSG_I(MM_SET_BEACON_INT_REQ)] =3D "MM_SET_BEACON_INT_REQ",
+	[MSG_I(MM_SET_BEACON_INT_CFM)] =3D "MM_SET_BEACON_INT_CFM",
+	[MSG_I(MM_SET_BASIC_RATES_REQ)] =3D "MM_SET_BASIC_RATES_REQ",
+	[MSG_I(MM_SET_BASIC_RATES_CFM)] =3D "MM_SET_BASIC_RATES_CFM",
+	[MSG_I(MM_SET_BSSID_REQ)] =3D "MM_SET_BSSID_REQ",
+	[MSG_I(MM_SET_BSSID_CFM)] =3D "MM_SET_BSSID_CFM",
+	[MSG_I(MM_SET_EDCA_REQ)] =3D "MM_SET_EDCA_REQ",
+	[MSG_I(MM_SET_EDCA_CFM)] =3D "MM_SET_EDCA_CFM",
+	[MSG_I(MM_SET_MODE_REQ)] =3D "MM_SET_MODE_REQ",
+	[MSG_I(MM_SET_MODE_CFM)] =3D "MM_SET_MODE_CFM",
+	[MSG_I(MM_SET_VIF_STATE_REQ)] =3D "MM_SET_VIF_STATE_REQ",
+	[MSG_I(MM_SET_VIF_STATE_CFM)] =3D "MM_SET_VIF_STATE_CFM",
+	[MSG_I(MM_SET_SLOTTIME_REQ)] =3D "MM_SET_SLOTTIME_REQ",
+	[MSG_I(MM_SET_SLOTTIME_CFM)] =3D "MM_SET_SLOTTIME_CFM",
+	[MSG_I(MM_SET_IDLE_REQ)] =3D "MM_SET_IDLE_REQ",
+	[MSG_I(MM_SET_IDLE_CFM)] =3D "MM_SET_IDLE_CFM",
+	[MSG_I(MM_KEY_ADD_REQ)] =3D "MM_KEY_ADD_REQ",
+	[MSG_I(MM_KEY_ADD_CFM)] =3D "MM_KEY_ADD_CFM",
+	[MSG_I(MM_KEY_DEL_REQ)] =3D "MM_KEY_DEL_REQ",
+	[MSG_I(MM_KEY_DEL_CFM)] =3D "MM_KEY_DEL_CFM",
+	[MSG_I(MM_BA_ADD_REQ)] =3D "MM_BA_ADD_REQ",
+	[MSG_I(MM_BA_ADD_CFM)] =3D "MM_BA_ADD_CFM",
+	[MSG_I(MM_BA_DEL_REQ)] =3D "MM_BA_DEL_REQ",
+	[MSG_I(MM_BA_DEL_CFM)] =3D "MM_BA_DEL_CFM",
+	[MSG_I(MM_PRIMARY_TBTT_IND)] =3D "MM_PRIMARY_TBTT_IND",
+	[MSG_I(MM_SECONDARY_TBTT_IND)] =3D "MM_SECONDARY_TBTT_IND",
+	[MSG_I(MM_SET_POWER_REQ)] =3D "MM_SET_POWER_REQ",
+	[MSG_I(MM_SET_POWER_CFM)] =3D "MM_SET_POWER_CFM",
+	[MSG_I(MM_DBG_TRIGGER_REQ)] =3D "MM_DBG_TRIGGER_REQ",
+	[MSG_I(MM_SET_PS_MODE_REQ)] =3D "MM_SET_PS_MODE_REQ",
+	[MSG_I(MM_SET_PS_MODE_CFM)] =3D "MM_SET_PS_MODE_CFM",
+	[MSG_I(MM_CHAN_CTXT_ADD_REQ)] =3D "MM_CHAN_CTXT_ADD_REQ",
+	[MSG_I(MM_CHAN_CTXT_ADD_CFM)] =3D "MM_CHAN_CTXT_ADD_CFM",
+	[MSG_I(MM_CHAN_CTXT_DEL_REQ)] =3D "MM_CHAN_CTXT_DEL_REQ",
+	[MSG_I(MM_CHAN_CTXT_DEL_CFM)] =3D "MM_CHAN_CTXT_DEL_CFM",
+	[MSG_I(MM_CHAN_CTXT_LINK_REQ)] =3D "MM_CHAN_CTXT_LINK_REQ",
+	[MSG_I(MM_CHAN_CTXT_LINK_CFM)] =3D "MM_CHAN_CTXT_LINK_CFM",
+	[MSG_I(MM_CHAN_CTXT_UNLINK_REQ)] =3D "MM_CHAN_CTXT_UNLINK_REQ",
+	[MSG_I(MM_CHAN_CTXT_UNLINK_CFM)] =3D "MM_CHAN_CTXT_UNLINK_CFM",
+	[MSG_I(MM_CHAN_CTXT_UPDATE_REQ)] =3D "MM_CHAN_CTXT_UPDATE_REQ",
+	[MSG_I(MM_CHAN_CTXT_UPDATE_CFM)] =3D "MM_CHAN_CTXT_UPDATE_CFM",
+	[MSG_I(MM_CHAN_CTXT_SCHED_REQ)] =3D "MM_CHAN_CTXT_SCHED_REQ",
+	[MSG_I(MM_CHAN_CTXT_SCHED_CFM)] =3D "MM_CHAN_CTXT_SCHED_CFM",
+	[MSG_I(MM_BCN_CHANGE_REQ)] =3D "MM_BCN_CHANGE_REQ",
+	[MSG_I(MM_BCN_CHANGE_CFM)] =3D "MM_BCN_CHANGE_CFM",
+	[MSG_I(MM_TIM_UPDATE_REQ)] =3D "MM_TIM_UPDATE_REQ",
+	[MSG_I(MM_TIM_UPDATE_CFM)] =3D "MM_TIM_UPDATE_CFM",
+	[MSG_I(MM_CONNECTION_LOSS_IND)] =3D "MM_CONNECTION_LOSS_IND",
+	[MSG_I(MM_CHANNEL_SWITCH_IND)] =3D "MM_CHANNEL_SWITCH_IND",
+	[MSG_I(MM_CHANNEL_PRE_SWITCH_IND)] =3D "MM_CHANNEL_PRE_SWITCH_IND",
+	[MSG_I(MM_REMAIN_ON_CHANNEL_REQ)] =3D "MM_REMAIN_ON_CHANNEL_REQ",
+	[MSG_I(MM_REMAIN_ON_CHANNEL_CFM)] =3D "MM_REMAIN_ON_CHANNEL_CFM",
+	[MSG_I(MM_REMAIN_ON_CHANNEL_EXP_IND)] =3D "MM_REMAIN_ON_CHANNEL_EXP_IND",
+	[MSG_I(MM_PS_CHANGE_IND)] =3D "MM_PS_CHANGE_IND",
+	[MSG_I(MM_TRAFFIC_REQ_IND)] =3D "MM_TRAFFIC_REQ_IND",
+	[MSG_I(MM_SET_PS_OPTIONS_REQ)] =3D "MM_SET_PS_OPTIONS_REQ",
+	[MSG_I(MM_SET_PS_OPTIONS_CFM)] =3D "MM_SET_PS_OPTIONS_CFM",
+	[MSG_I(MM_P2P_VIF_PS_CHANGE_IND)] =3D "MM_P2P_VIF_PS_CHANGE_IND",
+	[MSG_I(MM_CSA_COUNTER_IND)] =3D "MM_CSA_COUNTER_IND",
+	[MSG_I(MM_CHANNEL_SURVEY_IND)] =3D "MM_CHANNEL_SURVEY_IND",
+	[MSG_I(MM_SET_P2P_NOA_REQ)] =3D "MM_SET_P2P_NOA_REQ",
+	[MSG_I(MM_SET_P2P_OPPPS_REQ)] =3D "MM_SET_P2P_OPPPS_REQ",
+	[MSG_I(MM_SET_P2P_NOA_CFM)] =3D "MM_SET_P2P_NOA_CFM",
+	[MSG_I(MM_SET_P2P_OPPPS_CFM)] =3D "MM_SET_P2P_OPPPS_CFM",
+	[MSG_I(MM_CFG_RSSI_REQ)] =3D "MM_CFG_RSSI_REQ",
+	[MSG_I(MM_RSSI_STATUS_IND)] =3D "MM_RSSI_STATUS_IND",
+	[MSG_I(MM_CSA_FINISH_IND)] =3D "MM_CSA_FINISH_IND",
+	[MSG_I(MM_CSA_TRAFFIC_IND)] =3D "MM_CSA_TRAFFIC_IND",
+	[MSG_I(MM_MU_GROUP_UPDATE_REQ)] =3D "MM_MU_GROUP_UPDATE_REQ",
+	[MSG_I(MM_MU_GROUP_UPDATE_CFM)] =3D "MM_MU_GROUP_UPDATE_CFM",
+
+	[MSG_I(MM_SET_ARPOFFLOAD_REQ)] =3D "MM_SET_ARPOFFLOAD_REQ",
+	[MSG_I(MM_SET_ARPOFFLOAD_CFM)] =3D "MM_SET_ARPOFFLOAD_CFM",
+	[MSG_I(MM_SET_AGG_DISABLE_REQ)] =3D "MM_SET_AGG_DISABLE_REQ",
+	[MSG_I(MM_SET_AGG_DISABLE_CFM)] =3D "MM_SET_AGG_DISABLE_CFM",
+	[MSG_I(MM_SET_RF_CONFIG_REQ)] =3D "MM_SET_RF_CONFIG_REQ",
+	[MSG_I(MM_SET_RF_CONFIG_CFM)] =3D "MM_SET_RF_CONFIG_CFM",
+	[MSG_I(MM_SET_RF_CALIB_REQ)] =3D "MM_SET_RF_CALIB_REQ",
+	[MSG_I(MM_SET_RF_CALIB_CFM)] =3D "MM_SET_RF_CALIB_CFM",
+
+	[MSG_I(MM_GET_MAC_ADDR_REQ)] =3D "MM_GET_MAC_ADDR_REQ",
+	[MSG_I(MM_GET_MAC_ADDR_CFM)] =3D "MM_GET_MAC_ADDR_CFM",
+	[MSG_I(MM_GET_STA_INFO_REQ)] =3D "MM_GET_STA_INFO_REQ",
+	[MSG_I(MM_GET_STA_INFO_CFM)] =3D "MM_GET_STA_INFO_CFM",
+	[MSG_I(MM_SET_TXPWR_IDX_LVL_REQ)] =3D "MM_SET_TXPWR_IDX_LVL_REQ",
+	[MSG_I(MM_SET_TXPWR_IDX_LVL_CFM)] =3D "MM_SET_TXPWR_IDX_LVL_CFM",
+	[MSG_I(MM_SET_TXPWR_OFST_REQ)] =3D "MM_SET_TXPWR_OFST_REQ",
+	[MSG_I(MM_SET_TXPWR_OFST_CFM)] =3D "MM_SET_TXPWR_OFST_CFM",
+	[MSG_I(MM_SET_STACK_START_REQ)] =3D "MM_SET_STACK_START_REQ",
+	[MSG_I(MM_SET_STACK_START_CFM)] =3D "MM_SET_STACK_START_CFM",
+	[MSG_I(MM_APM_STALOSS_IND)] =3D "MM_APM_STALOSS_IND",
+	[MSG_I(MM_SET_VENDOR_HWCONFIG_REQ)] =3D "MM_SET_VENDOR_HWCONFIG_REQ",
+	[MSG_I(MM_SET_VENDOR_HWCONFIG_CFM)] =3D "MM_SET_VENDOR_HWCONFIG_CFM",
+	[MSG_I(MM_GET_FW_VERSION_REQ)] =3D "MM_GET_FW_VERSION_REQ",
+	[MSG_I(MM_GET_FW_VERSION_CFM)] =3D "MM_GET_FW_VERSION_CFM",
+	[MSG_I(MM_SET_RESUME_RESTORE_REQ)] =3D "MM_SET_RESUME_RESTORE_REQ",
+	[MSG_I(MM_SET_RESUME_RESTORE_CFM)] =3D "MM_SET_RESUME_RESTORE_CFM",
+	[MSG_I(MM_GET_WIFI_DISABLE_REQ)] =3D "MM_GET_WIFI_DISABLE_REQ",
+	[MSG_I(MM_GET_WIFI_DISABLE_CFM)] =3D "MM_GET_WIFI_DISABLE_CFM",
+	[MSG_I(MM_CFG_RSSI_CFM)] =3D "MM_CFG_RSSI_CFM",
+	[MSG_I(MM_SET_VENDOR_SWCONFIG_REQ)] =3D "MM_SET_VENDOR_SWCONFIG_REQ",
+	[MSG_I(MM_SET_VENDOR_SWCONFIG_CFM)] =3D "MM_SET_VENDOR_SWCONFIG_CFM",
+};
+
+static const char *const aicwf_dbgid2str[MSG_I(DBG_MAX)] =3D {
+	[MSG_I(DBG_MEM_READ_REQ)] =3D "DBG_MEM_READ_REQ",
+	[MSG_I(DBG_MEM_READ_CFM)] =3D "DBG_MEM_READ_CFM",
+	[MSG_I(DBG_MEM_WRITE_REQ)] =3D "DBG_MEM_WRITE_REQ",
+	[MSG_I(DBG_MEM_WRITE_CFM)] =3D "DBG_MEM_WRITE_CFM",
+	[MSG_I(DBG_SET_MOD_FILTER_REQ)] =3D "DBG_SET_MOD_FILTER_REQ",
+	[MSG_I(DBG_SET_MOD_FILTER_CFM)] =3D "DBG_SET_MOD_FILTER_CFM",
+	[MSG_I(DBG_SET_SEV_FILTER_REQ)] =3D "DBG_SET_SEV_FILTER_REQ",
+	[MSG_I(DBG_SET_SEV_FILTER_CFM)] =3D "DBG_SET_SEV_FILTER_CFM",
+	[MSG_I(DBG_ERROR_IND)] =3D "DBG_ERROR_IND",
+	[MSG_I(DBG_GET_SYS_STAT_REQ)] =3D "DBG_GET_SYS_STAT_REQ",
+	[MSG_I(DBG_GET_SYS_STAT_CFM)] =3D "DBG_GET_SYS_STAT_CFM",
+};
+
+static const char *const aicwf_scanid2str[MSG_I(SCAN_MAX)] =3D {
+	[MSG_I(SCAN_START_REQ)] =3D "SCAN_START_REQ",
+	[MSG_I(SCAN_START_CFM)] =3D "SCAN_START_CFM",
+	[MSG_I(SCAN_DONE_IND)] =3D "SCAN_DONE_IND",
+};
+
+static const char *const aicwf_tdlsid2str[MSG_I(TDLS_MAX)] =3D {
+	[MSG_I(TDLS_CHAN_SWITCH_CFM)] =3D "TDLS_CHAN_SWITCH_CFM",
+	[MSG_I(TDLS_CHAN_SWITCH_REQ)] =3D "TDLS_CHAN_SWITCH_REQ",
+	[MSG_I(TDLS_CHAN_SWITCH_IND)] =3D "TDLS_CHAN_SWITCH_IND",
+	[MSG_I(TDLS_CHAN_SWITCH_BASE_IND)] =3D "TDLS_CHAN_SWITCH_BASE_IND",
+	[MSG_I(TDLS_CANCEL_CHAN_SWITCH_REQ)] =3D "TDLS_CANCEL_CHAN_SWITCH_REQ",
+	[MSG_I(TDLS_CANCEL_CHAN_SWITCH_CFM)] =3D "TDLS_CANCEL_CHAN_SWITCH_CFM",
+	[MSG_I(TDLS_PEER_PS_IND)] =3D "TDLS_PEER_PS_IND",
+	[MSG_I(TDLS_PEER_TRAFFIC_IND_REQ)] =3D "TDLS_PEER_TRAFFIC_IND_REQ",
+	[MSG_I(TDLS_PEER_TRAFFIC_IND_CFM)] =3D "TDLS_PEER_TRAFFIC_IND_CFM",
+};
+
+#ifdef CONFIG_AICWF_FULLMAC
+
+static const char *const aicwf_scanuid2str[MSG_I(SCANU_MAX)] =3D {
+	[MSG_I(SCANU_START_REQ)] =3D "SCANU_START_REQ",
+	[MSG_I(SCANU_START_CFM)] =3D "SCANU_START_CFM",
+	[MSG_I(SCANU_JOIN_REQ)] =3D "SCANU_JOIN_REQ",
+	[MSG_I(SCANU_JOIN_CFM)] =3D "SCANU_JOIN_CFM",
+	[MSG_I(SCANU_RESULT_IND)] =3D "SCANU_RESULT_IND",
+	[MSG_I(SCANU_FAST_REQ)] =3D "SCANU_FAST_REQ",
+	[MSG_I(SCANU_FAST_CFM)] =3D "SCANU_FAST_CFM",
+	[MSG_I(SCANU_VENDOR_IE_REQ)] =3D "SCANU_VENDOR_IE_REQ",
+	[MSG_I(SCANU_VENDOR_IE_CFM)] =3D "SCANU_VENDOR_IE_CFM",
+	[MSG_I(SCANU_START_CFM_ADDTIONAL)] =3D "SCANU_START_CFM_ADDTIONAL",
+	[MSG_I(SCANU_CANCEL_REQ)] =3D "SCANU_CANCEL_REQ",
+	[MSG_I(SCANU_CANCEL_CFM)] =3D "SCANU_CANCEL_CFM",
+};
+
+static const char *const aicwf_meid2str[MSG_I(ME_MAX)] =3D {
+	[MSG_I(ME_CONFIG_REQ)] =3D "ME_CONFIG_REQ",
+	[MSG_I(ME_CONFIG_CFM)] =3D "ME_CONFIG_CFM",
+	[MSG_I(ME_CHAN_CONFIG_REQ)] =3D "ME_CHAN_CONFIG_REQ",
+	[MSG_I(ME_CHAN_CONFIG_CFM)] =3D "ME_CHAN_CONFIG_CFM",
+	[MSG_I(ME_SET_CONTROL_PORT_REQ)] =3D "ME_SET_CONTROL_PORT_REQ",
+	[MSG_I(ME_SET_CONTROL_PORT_CFM)] =3D "ME_SET_CONTROL_PORT_CFM",
+	[MSG_I(ME_TKIP_MIC_FAILURE_IND)] =3D "ME_TKIP_MIC_FAILURE_IND",
+	[MSG_I(ME_STA_ADD_REQ)] =3D "ME_STA_ADD_REQ",
+	[MSG_I(ME_STA_ADD_CFM)] =3D "ME_STA_ADD_CFM",
+	[MSG_I(ME_STA_DEL_REQ)] =3D "ME_STA_DEL_REQ",
+	[MSG_I(ME_STA_DEL_CFM)] =3D "ME_STA_DEL_CFM",
+	[MSG_I(ME_TX_CREDITS_UPDATE_IND)] =3D "ME_TX_CREDITS_UPDATE_IND",
+	[MSG_I(ME_RC_STATS_REQ)] =3D "ME_RC_STATS_REQ",
+	[MSG_I(ME_RC_STATS_CFM)] =3D "ME_RC_STATS_CFM",
+	[MSG_I(ME_RC_SET_RATE_REQ)] =3D "ME_RC_SET_RATE_REQ",
+	[MSG_I(ME_TRAFFIC_IND_REQ)] =3D "ME_TRAFFIC_IND_REQ",
+	[MSG_I(ME_TRAFFIC_IND_CFM)] =3D "ME_TRAFFIC_IND_CFM",
+	[MSG_I(ME_SET_PS_MODE_REQ)] =3D "ME_SET_PS_MODE_REQ",
+	[MSG_I(ME_SET_PS_MODE_CFM)] =3D "ME_SET_PS_MODE_CFM",
+	[MSG_I(ME_SET_LP_LEVEL_REQ)] =3D "ME_SET_LP_LEVEL_REQ",
+	[MSG_I(ME_SET_LP_LEVEL_CFM)] =3D "ME_SET_LP_LEVEL_CFM",
+};
+
+static const char *const aicwf_smid2str[MSG_I(SM_MAX)] =3D {
+	[MSG_I(SM_CONNECT_REQ)] =3D "SM_CONNECT_REQ",
+	[MSG_I(SM_CONNECT_CFM)] =3D "SM_CONNECT_CFM",
+	[MSG_I(SM_CONNECT_IND)] =3D "SM_CONNECT_IND",
+	[MSG_I(SM_DISCONNECT_REQ)] =3D "SM_DISCONNECT_REQ",
+	[MSG_I(SM_DISCONNECT_CFM)] =3D "SM_DISCONNECT_CFM",
+	[MSG_I(SM_DISCONNECT_IND)] =3D "SM_DISCONNECT_IND",
+	[MSG_I(SM_EXTERNAL_AUTH_REQUIRED_IND)] =3D "SM_EXTERNAL_AUTH_REQUIRED_IND=
",
+	[MSG_I(SM_EXTERNAL_AUTH_REQUIRED_RSP)] =3D "SM_EXTERNAL_AUTH_REQUIRED_RSP=
",
+	[MSG_I(SM_EXTERNAL_AUTH_REQUIRED_RSP_CFM)] =3D
+		"SM_EXTERNAL_AUTH_REQUIRED_RSP_CFM",
+};
+
+static const char *const aicwf_apmid2str[MSG_I(APM_MAX)] =3D {
+	[MSG_I(APM_START_REQ)] =3D "APM_START_REQ",
+	[MSG_I(APM_START_CFM)] =3D "APM_START_CFM",
+	[MSG_I(APM_STOP_REQ)] =3D "APM_STOP_REQ",
+	[MSG_I(APM_STOP_CFM)] =3D "APM_STOP_CFM",
+	[MSG_I(APM_START_CAC_REQ)] =3D "APM_START_CAC_REQ",
+	[MSG_I(APM_START_CAC_CFM)] =3D "APM_START_CAC_CFM",
+	[MSG_I(APM_STOP_CAC_REQ)] =3D "APM_STOP_CAC_REQ",
+	[MSG_I(APM_STOP_CAC_CFM)] =3D "APM_STOP_CAC_CFM",
+	[MSG_I(APM_SET_BEACON_IE_REQ)] =3D "APM_SET_BEACON_IE_REQ",
+	[MSG_I(APM_SET_BEACON_IE_CFM)] =3D "APM_SET_BEACON_IE_CFM",
+};
+
+static const char *const aicwf_meshid2str[MSG_I(MESH_MAX)] =3D {
+	[MSG_I(MESH_START_REQ)] =3D "MESH_START_REQ",
+	[MSG_I(MESH_START_CFM)] =3D "MESH_START_CFM",
+	[MSG_I(MESH_STOP_REQ)] =3D "MESH_STOP_REQ",
+	[MSG_I(MESH_STOP_CFM)] =3D "MESH_STOP_CFM",
+	[MSG_I(MESH_UPDATE_REQ)] =3D "MESH_UPDATE_REQ",
+	[MSG_I(MESH_UPDATE_CFM)] =3D "MESH_UPDATE_CFM",
+	[MSG_I(MESH_PATH_CREATE_REQ)] =3D "MESH_PATH_CREATE_REQ",
+	[MSG_I(MESH_PATH_CREATE_CFM)] =3D "MESH_PATH_CREATE_CFM",
+	[MSG_I(MESH_PATH_UPDATE_REQ)] =3D "MESH_PATH_UPDATE_REQ",
+	[MSG_I(MESH_PATH_UPDATE_CFM)] =3D "MESH_PATH_UPDATE_CFM",
+	[MSG_I(MESH_PROXY_ADD_REQ)] =3D "MESH_PROXY_ADD_REQ",
+	[MSG_I(MESH_PEER_UPDATE_IND)] =3D "MESH_PEER_UPDATE_IND",
+	[MSG_I(MESH_PATH_UPDATE_IND)] =3D "MESH_PATH_UPDATE_IND",
+	[MSG_I(MESH_PROXY_UPDATE_IND)] =3D "MESH_PROXY_UPDATE_IND",
+};
+
+#endif /* CONFIG_AICWF_FULLMAC */
+
+const char *const *const aicwf_id2str[TASK_LAST_EMB + 1] =3D {
+	[TASK_MM] =3D aicwf_mmid2str,       [TASK_DBG] =3D aicwf_dbgid2str,
+	[TASK_SCAN] =3D aicwf_scanid2str,   [TASK_TDLS] =3D aicwf_tdlsid2str,
+#ifdef CONFIG_AICWF_FULLMAC
+	[TASK_SCANU] =3D aicwf_scanuid2str, [TASK_ME] =3D aicwf_meid2str,
+	[TASK_SM] =3D aicwf_smid2str,       [TASK_APM] =3D aicwf_apmid2str,
+	[TASK_MESH] =3D aicwf_meshid2str,
+#endif
+};
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_strs.h b/drivers/n=
et/wireless/aic/aic8800_fdrv/aicwf_strs.h
new file mode 100644
index 000000000000..71c69b288bb2
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_strs.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *************************************************************************=
***************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @file aicwf_strs.h
+ *
+ * @brief Miscellaneous debug strings
+ *
+ *************************************************************************=
***************
+ */
+
+#ifndef _AICWF_STRS_H_
+#define _AICWF_STRS_H_
+
+#include "lmac_msg.h"
+
+#define AICWF_ID2STR(tag)                                               \
+	({                                                                 \
+		const typeof(tag) __tag =3D (tag);                               \
+		((MSG_T(__tag) < ARRAY_SIZE(aicwf_id2str)) &&                   \
+		 (aicwf_id2str[MSG_T(__tag)]) &&                                \
+		 ((aicwf_id2str[MSG_T(__tag)])[MSG_I(__tag)]))                  \
+		 ? (aicwf_id2str[MSG_T(__tag)])[MSG_I(__tag)]                \
+		 : "unknown";                                               \
+	})
+
+extern const char *const *const aicwf_id2str[TASK_LAST_EMB + 1];
+
+#endif /* _AICWF_STRS_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_tx.h b/drivers/net=
/wireless/aic/aic8800_fdrv/aicwf_tx.h
new file mode 100644
index 000000000000..4622dd725183
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_tx.h
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *************************************************************************=
*****
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @file aicwf_tx.h
+ *
+ * @brief tx handle
+ *
+ *************************************************************************=
*****
+ */
+#ifndef _AICWF_TX_H_
+#define _AICWF_TX_H_
+
+#include "hal_desc.h"
+#include "ipc_shared.h"
+#include "lmac_types.h"
+#include "aicwf_txq.h"
+#include <linux/ieee80211.h>
+#include <linux/netdevice.h>
+#include <net/cfg80211.h>
+
+#define AICWF_HWQ_BK      0
+#define AICWF_HWQ_BE      1
+#define AICWF_HWQ_VI      2
+#define AICWF_HWQ_VO      3
+#define AICWF_HWQ_BCMC    4
+#define AICWF_HWQ_NB      NX_TXQ_CNT
+#define AICWF_HWQ_ALL_ACS (AICWF_HWQ_BK | AICWF_HWQ_BE | AICWF_HWQ_VI | AI=
CWF_HWQ_VO)
+#define AICWF_HWQ_ALL_ACS_BIT                                             =
      \
+	(BIT(AICWF_HWQ_BK) | BIT(AICWF_HWQ_BE) | BIT(AICWF_HWQ_VI) | BIT(AICWF_HW=
Q_VO))
+
+#define AICWF_TX_LIFETIME_MS 1000
+#define AICWF_TX_MAX_RATES   NX_TX_MAX_RATES
+
+#define AICWF_SWTXHDR_ALIGN_SZ  4
+#define AICWF_SWTXHDR_ALIGN_MSK (AICWF_SWTXHDR_ALIGN_SZ - 1)
+#define AICWF_SWTXHDR_ALIGN_PADS(x)                                       =
      \
+	((AICWF_SWTXHDR_ALIGN_SZ - ((x) & AICWF_SWTXHDR_ALIGN_MSK)) &            =
    \
+	 AICWF_SWTXHDR_ALIGN_MSK)
+#if AICWF_SWTXHDR_ALIGN_SZ & AICWF_SWTXHDR_ALIGN_MSK
+#error bad AICWF_SWTXHDR_ALIGN_SZ
+#endif
+
+#define AMSDU_PADDING(x) ((4 - ((x) & 0x3)) & 0x3)
+
+#define TXU_CNTRL_RETRY       BIT(0)
+#define TXU_CNTRL_MORE_DATA   BIT(2)
+#define TXU_CNTRL_MGMT        BIT(3)
+#define TXU_CNTRL_MGMT_NO_CCK BIT(4)
+#define TXU_CNTRL_AMSDU       BIT(6)
+#define TXU_CNTRL_MGMT_ROBUST BIT(7)
+#define TXU_CNTRL_USE_4ADDR   BIT(8)
+#define TXU_CNTRL_EOSP        BIT(9)
+#define TXU_CNTRL_MESH_FWD    BIT(10)
+#define TXU_CNTRL_TDLS        BIT(11)
+
+/**
+ * struct aicwf_amsdu_txhdr - Header for a noninitial A-MSDU subframe
+ *
+ * @list: Node in the list of additional A-MSDU subframes
+ * @map_len: Number of bytes mapped for this subframe
+ * @dma_addr: DMA address of the mapped subframe
+ * @skb: Socket buffer containing the subframe
+ * @pad: Padding before this subframe when dismantling the A-MSDU
+ * @msdu_len: MSDU size in bytes, excluding padding and the A-MSDU header
+ */
+struct aicwf_amsdu_txhdr {
+	struct list_head list;
+	size_t map_len;
+	dma_addr_t dma_addr;
+	struct sk_buff *skb;
+	u16 pad;
+	u16 msdu_len;
+};
+
+/**
+ * struct aicwf_amsdu - State used while building an A-MSDU
+ *
+ * @hdrs: List of additional subframes
+ * @len: Current A-MSDU size excluding padding, or 0 when none is in progr=
ess
+ * @nb: Number of subframes in the A-MSDU
+ * @pad: Padding required before the next subframe
+ */
+struct aicwf_amsdu {
+	struct list_head hdrs;
+	u16 len;
+	u8 nb;
+	u8 pad;
+};
+
+/**
+ * struct aicwf_sw_txhdr - Software part of tx header
+ *
+ * @aicwf_sta: Destination STA
+ * @aicwf_vif: VIF transmitting the buffer
+ * @txq: TX queue used to send the buffer
+ * @hw_queue: Hardware queue index used to push the buffer
+ * @frame_len: Frame size excluding the MAC header
+ * @cookie: cfg80211 management TX cookie
+ * @headroom: Headroom added for &struct aicwf_txhdr
+ * @amsdu: A-MSDU state when this buffer contains the first subframe
+ * @need_cfm: Whether the firmware must confirm this transmission
+ * @skb: Socket buffer being transmitted
+ * @desc: Descriptor copied to firmware-visible shared memory
+ */
+struct aicwf_sw_txhdr {
+	struct aicwf_sta *aicwf_sta;
+	struct aicwf_vif *aicwf_vif;
+	struct aicwf_txq *txq;
+	u8 hw_queue;
+	u16 frame_len;
+	u64 cookie;
+	u16 headroom;
+#ifdef CONFIG_AICWF_AMSDUS_TX
+	struct aicwf_amsdu amsdu;
+#endif
+	u32 need_cfm;
+	struct sk_buff *skb;
+	struct txdesc_api desc;
+};
+
+/**
+ * struct aicwf_txhdr - Structure to control transimission of packet
+ * (Added in skb headroom)
+ *
+ * @sw_hdr: Information from driver
+ * @cache_guard:
+ * @hw_hdr: Information for/from hardware
+ */
+struct aicwf_txhdr {
+	struct aicwf_sw_txhdr *sw_hdr;
+	char cache_guard[L1_CACHE_BYTES];
+	struct aicwf_hw_txhdr hw_hdr;
+};
+
+extern const int aicwf_tid2hwq[IEEE80211_NUM_TIDS];
+
+u16 aicwf_select_txq(struct aicwf_vif *aicwf_vif, struct sk_buff *skb);
+netdev_tx_t aicwf_start_xmit(struct sk_buff *skb, struct net_device *dev);
+
+int aicwf_start_mgmt_xmit(struct aicwf_vif *vif, struct aicwf_sta *sta,
+			  struct cfg80211_mgmt_tx_params *params, bool offchan,
+			  u64 cookie);
+
+int aicwf_txdatacfm(void *pthis, void *host_id);
+
+struct aicwf_hw;
+struct aicwf_sta;
+void aicwf_set_traffic_status(struct aicwf_hw *aicwf_hw, struct aicwf_sta =
*sta,
+			      bool available, u8 ps_id);
+
+void aicwf_ps_bh_enable(struct aicwf_hw *aicwf_hw, struct aicwf_sta *sta,
+			bool enable);
+
+void aicwf_ps_bh_traffic_req(struct aicwf_hw *aicwf_hw, struct aicwf_sta *=
sta,
+			     u16 pkt_req, u8 ps_id);
+
+void aicwf_txq_credit_update(struct aicwf_hw *aicwf_hw, int sta_idx, u8 ti=
d,
+			     s8 update);
+
+void aicwf_tx_push(struct aicwf_hw *aicwf_hw, struct aicwf_txhdr *txhdr, i=
nt flags);
+
+#endif /* _AICWF_TX_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq.h b/drivers/ne=
t/wireless/aic/aic8800_fdrv/aicwf_txq.h
new file mode 100644
index 000000000000..9286aed3e870
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq.h
@@ -0,0 +1,353 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *************************************************************************=
***************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @file aicwf_txq.h
+ *
+ * @brief tx queue function
+ *
+ *************************************************************************=
***************
+ */
+#ifndef _AICWF_TXQ_H_
+#define _AICWF_TXQ_H_
+
+#include <linux/bitops.h>
+#include <linux/ieee80211.h>
+#include <linux/types.h>
+#include "aicwf_config.h"
+
+#ifdef CONFIG_AICWF_FULLMAC
+/*
+ * Fullmac TXQ configuration:
+ *  - STA: 1 TXQ per TID (limited to 8)
+ *         1 TXQ for bufferable MGT frames
+ *  - VIF: 1 TXQ for Multi/Broadcast +
+ *         1 TXQ for MGT for unknown STAs or non-bufferable MGT frames
+ *  - 1 TXQ for offchannel transmissions
+ *
+ *
+ * Txq mapping looks like
+ * for NX_REMOTE_STA_MAX=3D10 and NX_VIRT_DEV_MAX=3D4
+ *
+ * | TXQ | NDEV_ID | VIF |   STA |  TID | HWQ |
+ * |-----+---------+-----+-------+------+-----|-
+ * |   0 |       0 |     |     0 |    0 |   1 | 9 TXQ per STA
+ * |   1 |       1 |     |     0 |    1 |   0 | (8 data + 1 mgmt)
+ * |   2 |       2 |     |     0 |    2 |   0 |
+ * |   3 |       3 |     |     0 |    3 |   1 |
+ * |   4 |       4 |     |     0 |    4 |   2 |
+ * |   5 |       5 |     |     0 |    5 |   2 |
+ * |   6 |       6 |     |     0 |    6 |   3 |
+ * |   7 |       7 |     |     0 |    7 |   3 |
+ * |   8 |     N/A |     |     0 | MGMT |   3 |
+ * |-----+---------+-----+-------+------+-----|-
+ * | ... |         |     |       |      |     | Same for all STAs
+ * |-----+---------+-----+-------+------+-----|-
+ * |  90 |      80 |   0 | BC/MC |    0 | 1/4 | 1 TXQ for BC/MC per VIF
+ * | ... |         |     |       |      |     |
+ * |  93 |      80 |   3 | BC/MC |    0 | 1/4 |
+ * |-----+---------+-----+-------+------+-----|-
+ * |  94 |     N/A |   0 |   N/A | MGMT |   3 | 1 TXQ for unknown STA per =
VIF
+ * | ... |         |     |       |      |     |
+ * |  97 |     N/A |   3 |   N/A | MGMT |   3 |
+ * |-----+---------+-----+-------+------+-----|-
+ * |  98 |     N/A |     |   N/A | MGMT |   3 | 1 TXQ for offchannel frame
+ */
+
+#define NX_NB_TID_PER_STA 8
+#define NX_NB_TXQ_PER_STA (NX_NB_TID_PER_STA + 1)
+#define NX_NB_TXQ_PER_VIF 2
+#define NX_NB_TXQ                                                         =
     \
+	((NX_NB_TXQ_PER_STA * NX_REMOTE_STA_MAX) +                               =
  \
+	 (NX_NB_TXQ_PER_VIF * NX_VIRT_DEV_MAX) + 1)
+
+#define NX_FIRST_VIF_TXQ_IDX  (NX_REMOTE_STA_MAX * NX_NB_TXQ_PER_STA)
+#define NX_FIRST_BCMC_TXQ_IDX NX_FIRST_VIF_TXQ_IDX
+#define NX_FIRST_UNK_TXQ_IDX  (NX_FIRST_BCMC_TXQ_IDX + NX_VIRT_DEV_MAX)
+
+#define NX_OFF_CHAN_TXQ_IDX                                               =
     \
+	(NX_FIRST_VIF_TXQ_IDX + (NX_VIRT_DEV_MAX * NX_NB_TXQ_PER_VIF))
+
+#define NX_FIRST_VIF_TXQ_IDX_FOR_OLD_IC                                   =
     \
+	(NX_REMOTE_STA_MAX_FOR_OLD_IC * NX_NB_TXQ_PER_STA)
+#define NX_FIRST_BCMC_TXQ_IDX_FOR_OLD_IC NX_FIRST_VIF_TXQ_IDX_FOR_OLD_IC
+#define NX_FIRST_UNK_TXQ_IDX_FOR_OLD_IC                                   =
     \
+	(NX_FIRST_BCMC_TXQ_IDX_FOR_OLD_IC + NX_VIRT_DEV_MAX)
+
+#define NX_OFF_CHAN_TXQ_IDX_FOR_OLD_IC                                    =
     \
+	(NX_FIRST_VIF_TXQ_IDX_FOR_OLD_IC + (NX_VIRT_DEV_MAX * NX_NB_TXQ_PER_VIF))
+
+#define NX_BCMC_TXQ_TYPE 0
+#define NX_UNK_TXQ_TYPE  1
+
+/*
+ * Each data TXQ is a netdev queue. TXQ to send MGT are not data TXQ as
+ * they did not received buffer from netdev interface.
+ * Need to allocate the maximum case.
+ * AP : all STAs + 1 BC/MC
+ */
+#define NX_NB_NDEV_TXQ ((NX_NB_TID_PER_STA * NX_REMOTE_STA_MAX) + 1)
+#define NX_NB_NDEV_TXQ_FOR_OLD_IC                                         =
     \
+	((NX_NB_TID_PER_STA * NX_REMOTE_STA_MAX_FOR_OLD_IC) + 1)
+
+#define NX_BCMC_TXQ_NDEV_IDX (NX_NB_TID_PER_STA * NX_REMOTE_STA_MAX)
+#define NX_BCMC_TXQ_NDEV_IDX_FOR_OLD_IC                                   =
     \
+	(NX_NB_TID_PER_STA * NX_REMOTE_STA_MAX_FOR_OLD_IC)
+#define NX_STA_NDEV_IDX(tid, sta_idx) ((tid) + (sta_idx) * NX_NB_TID_PER_S=
TA)
+#define NDEV_NO_TXQ                   0xffff
+#if (NX_NB_NDEV_TXQ >=3D NDEV_NO_TXQ)
+#error("Need to increase struct aicwf_txq->ndev_idx size")
+#endif
+
+/* stop netdev queue when number of queued buffers if greater than this  *=
/
+#define AICWF_NDEV_FLOW_CTRL_STOP    64
+/* restart netdev queue when number of queued buffers is lower than this *=
/
+#define AICWF_NDEV_FLOW_CTRL_RESTART 64
+
+#endif /*  CONFIG_AICWF_FULLMAC */
+
+#define TXQ_INACTIVE 0xffff
+#if (NX_NB_TXQ >=3D TXQ_INACTIVE)
+#error("Need to increase struct aicwf_txq->idx size")
+#endif
+
+#define NX_TXQ_INITIAL_CREDITS 64
+
+/*
+ * TXQ tid sorted by decreasing priority
+ */
+extern const int nx_tid_prio[NX_NB_TID_PER_STA];
+
+/**
+ * struct aicwf_hwq - Structure used to save information relative to
+ *                   an AC TX queue (aka HW queue)
+ * @list: TX queues with buffers ready for this hardware queue
+ * @size: Queue capacity
+ * @id: Hardware queue identifier
+ * @need_processing: Whether the queue needs processing
+ */
+struct aicwf_hwq {
+	struct list_head list;
+	u8 size;
+	u8 id;
+	bool need_processing;
+};
+
+/**
+ * enum aicwf_push_flags - Flags of pushed buffer
+ *
+ * @AICWF_PUSH_RETRY: Push a buffer for retry
+ * @AICWF_PUSH_IMMEDIATE: Push a buffer without queuing it first
+ */
+enum aicwf_push_flags {
+	AICWF_PUSH_RETRY =3D BIT(0),
+	AICWF_PUSH_IMMEDIATE =3D BIT(1),
+};
+
+/**
+ * enum aicwf_txq_flags - TXQ status flag
+ *
+ * @AICWF_TXQ_IN_HWQ_LIST: The queue is scheduled for transmission
+ * @AICWF_TXQ_STOP_FULL: No more credits for the queue
+ * @AICWF_TXQ_STOP_CSA: CSA is in progress
+ * @AICWF_TXQ_STOP_STA_PS: Destiniation sta is currently in power save mod=
e
+ * @AICWF_TXQ_STOP_VIF_PS: Vif owning this queue is currently in power sav=
e mode
+ * @AICWF_TXQ_STOP_CHAN: Channel of this queue is not the current active c=
hannel
+ * @AICWF_TXQ_STOP_MU_POS: TXQ is stopped waiting for all the buffers push=
ed to
+ *                       fw to be confirmed
+ * @AICWF_TXQ_STOP: All possible reason to have a txq stopped
+ * @AICWF_TXQ_NDEV_FLOW_CTRL: associated netdev queue is currently stopped=
.
+ *                          Note: when a TXQ is flowctrl it is NOT stopped
+ */
+enum aicwf_txq_flags {
+	AICWF_TXQ_IN_HWQ_LIST =3D BIT(0),
+	AICWF_TXQ_STOP_FULL =3D BIT(1),
+	AICWF_TXQ_STOP_CSA =3D BIT(2),
+	AICWF_TXQ_STOP_STA_PS =3D BIT(3),
+	AICWF_TXQ_STOP_VIF_PS =3D BIT(4),
+	AICWF_TXQ_STOP_CHAN =3D BIT(5),
+	AICWF_TXQ_STOP_MU_POS =3D BIT(6),
+	AICWF_TXQ_STOP =3D
+		(AICWF_TXQ_STOP_FULL | AICWF_TXQ_STOP_CSA | AICWF_TXQ_STOP_STA_PS |
+		 AICWF_TXQ_STOP_VIF_PS | AICWF_TXQ_STOP_CHAN),
+	AICWF_TXQ_NDEV_FLOW_CTRL =3D BIT(7),
+};
+
+/**
+ * struct aicwf_txq - Structure used to save information relative to
+ *                   a RA/TID TX queue
+ *
+ * @idx: Unique txq idx. Set to TXQ_INACTIVE if txq is not used.
+ * @status: Bitfield of &enum aicwf_txq_flags
+ * @credits: Number of buffers that can be pushed to the firmware
+ * @pkt_sent: Number of consecutive packets sent while on the HW queue lis=
t
+ * @pkt_pushed: Number of packets awaiting transmission confirmation per u=
ser
+ * @sched_list: Node in the hardware queue scheduling list
+ * @sk_list: Buffers waiting to be pushed to the firmware
+ * @last_retry_skb: Last retry buffer in @sk_list, or %NULL when none is q=
ueued
+ * @nb_retry: Number of queued retry packets
+ * @hwq: Associated hardware queue
+ * @push_limit: Maximum packets to push before leaving the hardware queue =
list
+ * @tid: TID
+ *
+ * @nb_ready_mac80211: Number of buffers ready in the mac80211 TX queue
+ *
+ * FULLMAC specific
+ * @sta: STA associated with the queue
+ * @ps_id: Power-save queue identifier (legacy or U-APSD)
+ * @ndev_idx: Netdev queue index, or 0xff for a non-netdev queue
+ * @ndev: Net device of the corresponding VIF
+ * @amsdu: TX header of the first A-MSDU subframe, or %NULL
+ * @amsdu_len: Maximum A-MSDU size, or 0 when A-MSDU is disabled
+ * @mumimo_info: MU-MIMO group and user-position information
+ */
+struct aicwf_txq {
+	u16 idx;
+	u8 status;
+	s8 credits;
+	u8 pkt_sent;
+	u8 pkt_pushed[NX_USER_MAX];
+	struct list_head sched_list;
+	struct sk_buff_head sk_list;
+	struct sk_buff *last_retry_skb;
+	struct aicwf_hwq *hwq;
+	int nb_retry;
+	u8 push_limit;
+	u8 tid;
+#ifdef CONFIG_MAC80211_TXQ
+	unsigned long nb_ready_mac80211;
+#endif
+#ifdef CONFIG_AICWF_FULLMAC
+	struct aicwf_sta *sta;
+	u8 ps_id;
+	u16 ndev_idx;
+	struct net_device *ndev;
+#ifdef CONFIG_AICWF_AMSDUS_TX
+	struct aicwf_sw_txhdr *amsdu;
+	u16 amsdu_len;
+#endif /* CONFIG_AICWF_AMSDUS_TX */
+#endif /* CONFIG_AICWF_FULLMAC */
+#ifdef CONFIG_AICWF_MUMIMO_TX
+	u8 mumimo_info;
+#endif
+};
+
+struct aicwf_sta;
+struct aicwf_vif;
+struct aicwf_hw;
+struct aicwf_sw_txhdr;
+
+#ifdef CONFIG_AICWF_MUMIMO_TX
+#define AICWF_TXQ_GROUP_ID(txq) ((txq)->mumimo_info & 0x3f)
+#define AICWF_TXQ_POS_ID(txq)   (((txq)->mumimo_info >> 6) & 0x3)
+#else
+#define AICWF_TXQ_GROUP_ID(txq) 0
+#define AICWF_TXQ_POS_ID(txq)   0
+#endif /* CONFIG_AICWF_MUMIMO_TX */
+
+static inline bool aicwf_txq_is_stopped(struct aicwf_txq *txq)
+{
+	return (txq->status & AICWF_TXQ_STOP);
+}
+
+static inline bool aicwf_txq_is_full(struct aicwf_txq *txq)
+{
+	return (txq->status & AICWF_TXQ_STOP_FULL);
+}
+
+static inline bool aicwf_txq_is_scheduled(struct aicwf_txq *txq)
+{
+	return (txq->status & AICWF_TXQ_IN_HWQ_LIST);
+}
+
+/*
+ * foreach_vif_txq - Macro to iterate over all TXQ of a VIF (in AC order)
+ *
+ * @vif: pointer to aicwf_vif
+ * @txq: pointer to aicwf_txq updated with the next TXQ at each iteration
+ * @ac:  int updated with the TXQ ac at each iteration
+ */
+/*
+ *#ifdef CONFIG_MAC80211_TXQ
+ *#define foreach_vif_txq(vif, txq, ac)                                   =
       \
+ *	for (ac =3D AICWF_HWQ_BK, txq =3D aicwf_txq_vif_get(vif, ac);          =
          \
+ *		ac < NX_NB_TXQ_PER_VIF; ac++, txq =3D aicwf_txq_vif_get(vif, ac))
+ *#else
+ *#define foreach_vif_txq(vif, txq, ac)                                   =
       \
+ *	for (ac =3D AICWF_HWQ_BK, txq =3D &vif->txqs[0]; ac < NX_NB_TXQ_PER_VIF=
;        \
+ *		ac++, txq++)
+ *#endif
+ */
+
+#ifdef CONFIG_AICWF_FULLMAC
+struct aicwf_txq *aicwf_txq_sta_get(struct aicwf_sta *sta, u8 tid,
+				    struct aicwf_hw *aicwf_hw);
+struct aicwf_txq *aicwf_txq_vif_get(struct aicwf_vif *vif, u8 type);
+#endif /* CONFIG_AICWF_FULLMAC */
+
+/**
+ * aicwf_txq_vif_get_status - return status bits related to the vif
+ *
+ * @aicwf_vif: Pointer to vif structure
+ *
+ * Return: VIF-related stop-reason bits from the first VIF TX queue.
+ */
+static inline u8 aicwf_txq_vif_get_status(struct aicwf_vif *aicwf_vif)
+{
+	struct aicwf_txq *txq =3D aicwf_txq_vif_get(aicwf_vif, 0);
+
+	return (txq->status & (AICWF_TXQ_STOP_CHAN | AICWF_TXQ_STOP_VIF_PS));
+}
+
+void aicwf_txq_vif_init(struct aicwf_hw *aicwf_hw, struct aicwf_vif *vif,
+			u8 status);
+void aicwf_txq_vif_deinit(struct aicwf_hw *aicwf_hw, struct aicwf_vif *vif=
);
+void aicwf_txq_sta_init(struct aicwf_hw *aicwf_hw, struct aicwf_sta *aicwf=
_sta,
+			u8 status);
+void aicwf_txq_sta_deinit(struct aicwf_hw *aicwf_hw, struct aicwf_sta *aic=
wf_sta);
+#ifdef CONFIG_AICWF_FULLMAC
+void aicwf_txq_unk_vif_init(struct aicwf_vif *aicwf_vif);
+void aicwf_txq_unk_vif_deinit(struct aicwf_vif *vif);
+void aicwf_txq_offchan_init(struct aicwf_vif *aicwf_vif);
+void aicwf_txq_offchan_deinit(struct aicwf_vif *aicwf_vif);
+void aicwf_txq_tdls_vif_init(struct aicwf_vif *aicwf_vif);
+void aicwf_txq_tdls_vif_deinit(struct aicwf_vif *vif);
+void aicwf_txq_tdls_sta_start(struct aicwf_vif *aicwf_vif, u16 reason,
+			      struct aicwf_hw *aicwf_hw);
+void aicwf_txq_tdls_sta_stop(struct aicwf_vif *aicwf_vif, u16 reason,
+			     struct aicwf_hw *aicwf_hw);
+#endif
+
+void aicwf_txq_add_to_hw_list(struct aicwf_txq *txq);
+void aicwf_txq_del_from_hw_list(struct aicwf_txq *txq);
+void aicwf_txq_stop(struct aicwf_txq *txq, u16 reason);
+void aicwf_txq_start(struct aicwf_txq *txq, u16 reason);
+void aicwf_txq_vif_start(struct aicwf_vif *vif, u16 reason,
+			 struct aicwf_hw *aicwf_hw);
+void aicwf_txq_vif_stop(struct aicwf_vif *vif, u16 reason,
+			struct aicwf_hw *aicwf_hw);
+
+#ifdef CONFIG_AICWF_FULLMAC
+void aicwf_txq_sta_start(struct aicwf_sta *sta, u16 reason,
+			 struct aicwf_hw *aicwf_hw);
+void aicwf_txq_sta_stop(struct aicwf_sta *sta, u16 reason,
+			struct aicwf_hw *aicwf_hw);
+void aicwf_txq_offchan_start(struct aicwf_hw *aicwf_hw);
+void aicwf_txq_sta_switch_vif(struct aicwf_sta *sta, struct aicwf_vif *old=
_vif,
+			      struct aicwf_vif *new_vif);
+
+#endif /* CONFIG_AICWF_FULLMAC */
+
+int aicwf_txq_queue_skb(struct sk_buff *skb, struct aicwf_txq *txq,
+			struct aicwf_hw *aicwf_hw, bool retry);
+void aicwf_txq_confirm_any(struct aicwf_hw *aicwf_hw, struct aicwf_txq *tx=
q,
+			   struct aicwf_hwq *hwq, struct aicwf_sw_txhdr *sw_txhdr);
+
+void aicwf_hwq_init(struct aicwf_hw *aicwf_hw);
+void aicwf_hwq_process(struct aicwf_hw *aicwf_hw, struct aicwf_hwq *hwq);
+void aicwf_hwq_process_all(struct aicwf_hw *aicwf_hw);
+void aicwf_txq_flush(struct aicwf_hw *aicwf_hw, struct aicwf_txq *txq);
+
+#endif /* _AICWF_TXQ_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq_prealloc.h b/d=
rivers/net/wireless/aic/aic8800_fdrv/aicwf_txq_prealloc.h
new file mode 100644
index 000000000000..ec84a51691a6
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_txq_prealloc.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_TXQ_PREALLOC_H_
+#define _AICWF_TXQ_PREALLOC_H_
+
+#include <linux/types.h>
+
+/**
+ * struct aicwf_prealloc_txq - TX queue array kept for the lifetime of a d=
evice
+ * @txq: The array, %NULL until first requested
+ * @size: Size of @txq in bytes
+ */
+struct aicwf_prealloc_txq {
+	void *txq;
+	size_t size;
+};
+
+#ifdef CONFIG_PREALLOC_TXQ
+void *aicwf_prealloc_txq_alloc(struct aicwf_prealloc_txq *prealloc,
+			       size_t size);
+void aicwf_prealloc_txq_free(struct aicwf_prealloc_txq *prealloc);
+#else
+static inline void aicwf_prealloc_txq_free(struct aicwf_prealloc_txq *prea=
lloc)
+{
+}
+#endif
+
+#endif /* _AICWF_TXQ_PREALLOC_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_txrxif.c b/drivers=
/net/wireless/aic/aic8800_fdrv/aicwf_txrxif.c
new file mode 100644
index 000000000000..87e0fe7953f3
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_txrxif.c
@@ -0,0 +1,666 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *************************************************************************=
*****
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief tx/rx bus function declarations
+ *
+ *************************************************************************=
*****
+ */
+
+#include "aicwf_txrxif.h"
+#include "aicwf_resv_mem.h"
+#include "aicwf_rx_prealloc.h"
+#include "lmac_msg.h"
+#include "aicwf_defs.h"
+#include "aicwf_msg_rx.h"
+#include "aicwf_platform.h"
+#include "aicwf_rx.h"
+#include <linux/atomic.h>
+#include <linux/completion.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/kthread.h>
+#include <linux/netdevice.h>
+#include <linux/printk.h>
+#include <linux/sched.h>
+#include <linux/semaphore.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+#include <linux/unistd.h>
+#include <linux/vmalloc.h>
+#include <uapi/linux/sched/types.h>
+#include "aicwf_main.h"
+#include "sdio_host.h"
+
+#ifdef CONFIG_PREALLOC_RX_SKB
+void aicwf_rxframe_queue_init_2(struct rx_frame_queue *pq, int max_len)
+{
+	memset(pq, 0,
+	       offsetof(struct rx_frame_queue, queuelist) +
+	       (sizeof(struct list_head)));
+	pq->qmax =3D (u16)max_len;
+	INIT_LIST_HEAD(&pq->queuelist);
+}
+
+void rxbuff_queue_flush(struct aicwf_rx_priv *rx_priv)
+{
+	struct rx_frame_queue *pq =3D &rx_priv->rxq;
+	struct list_head *pos;
+	struct list_head *n;
+	struct list_head *head;
+	struct rx_buff *tempbuf =3D NULL;
+
+	head =3D &pq->queuelist;
+	list_for_each_safe(pos, n, head) {
+		tempbuf =3D list_entry(pos, struct rx_buff, queue);
+		list_del_init(&tempbuf->queue);
+		aicwf_prealloc_rxbuff_free(tempbuf, &rx_priv->rxbuff_lock);
+		pq->qcnt--;
+	}
+}
+#endif
+
+int aicwf_bus_init(uint bus_hdrlen, struct device *dev)
+{
+	int ret =3D 0;
+	struct aicwf_bus *bus_if;
+
+	if (!dev) {
+		dev_err(dev, "device not found\n");
+		return -1;
+	}
+	bus_if =3D dev_get_drvdata(dev);
+	bus_if->cmd_buf =3D kzalloc(CMD_BUF_MAX, GFP_KERNEL);
+	if (!bus_if->cmd_buf) {
+		ret =3D -ENOMEM;
+		dev_err(dev, "proto_attach failed\n");
+		goto out;
+	}
+	memset(bus_if->cmd_buf, '\0', CMD_BUF_MAX);
+
+	init_completion(&bus_if->bustx_trgg);
+	init_completion(&bus_if->busrx_trgg);
+	// new oob feature
+	init_completion(&bus_if->busirq_trgg);
+	spin_lock_init(&bus_if->sdiodev->wslock);
+	bus_if->bustx_thread =3D
+		kthread_run(sdio_bustx_thread, (void *)bus_if, "aicwf_bustx_thread");
+	bus_if->busrx_thread =3D
+		kthread_run(sdio_busrx_thread, (void *)bus_if->sdiodev->rx_priv,
+			    "aicwf_busrx_thread");
+	// new oob feature
+#ifdef CONFIG_OOB
+	if (bus_if->sdiodev->oob_enable) {
+		bus_if->busirq_thread =3D kthread_run(sdio_busirq_thread,
+						    (void *)bus_if->sdiodev->rx_priv,
+						    "aicwf_busirq_thread");
+		if (IS_ERR(bus_if->busirq_thread)) {
+			ret =3D PTR_ERR(bus_if->busirq_thread);
+			bus_if->busirq_thread =3D NULL;
+		}
+	}
+#endif // CONFIG_OOB
+
+	if (IS_ERR(bus_if->bustx_thread)) {
+		bus_if->bustx_thread =3D NULL;
+		dev_err(dev, "aicwf_bustx_thread run fail\n");
+		ret =3D -1;
+	}
+
+	if (IS_ERR(bus_if->busrx_thread)) {
+		bus_if->busrx_thread =3D NULL;
+		dev_err(dev, "aicwf_busrx_thread run fail\n");
+		ret =3D -1;
+	}
+
+	if (ret < 0)
+		goto out;
+
+	return ret;
+
+out:
+	return ret;
+}
+
+void aicwf_bus_deinit(struct device *dev)
+{
+	struct aicwf_bus *bus_if =3D dev_get_drvdata(dev);
+
+	/* Command work and the TX thread have stopped before this point. */
+	kfree(bus_if->cmd_buf);
+	bus_if->cmd_buf =3D NULL;
+}
+
+void aicwf_frame_tx(void *dev, struct sk_buff *skb)
+{
+	struct aic_sdio_dev *sdiodev =3D (struct aic_sdio_dev *)dev;
+
+	aicwf_bus_txdata(sdiodev->bus_if, skb);
+}
+
+struct aicwf_tx_priv *aicwf_tx_init(void *arg)
+{
+	struct aicwf_tx_priv *tx_priv;
+	struct device *dev;
+
+	tx_priv =3D
+		kzalloc_obj(*tx_priv, GFP_KERNEL);
+	if (!tx_priv)
+		return NULL;
+
+	tx_priv->sdiodev =3D (struct aic_sdio_dev *)arg;
+	dev =3D tx_priv->sdiodev->dev;
+
+	atomic_set(&tx_priv->aggr_count, 0);
+#ifdef CONFIG_RESV_MEM_SUPPORT
+	tx_priv->aggr_buf =3D aicwf_resv_mem_alloc_skb(&tx_priv->sdiodev->resv_me=
m,
+						     MAX_AGGR_TXPKT_LEN,
+						     AIC_RESV_MEM_TXDATA);
+#else
+	tx_priv->aggr_buf =3D
+		dev_alloc_skb(MAX_AGGR_TXPKT_LEN);
+#endif
+	if (!tx_priv->aggr_buf) {
+		dev_err(dev, "alloc bus->txdata_buf failed\n");
+		kfree(tx_priv);
+		return NULL;
+	}
+	tx_priv->head =3D tx_priv->aggr_buf->data;
+	tx_priv->tail =3D tx_priv->aggr_buf->data;
+
+	return tx_priv;
+}
+
+void aicwf_tx_deinit(struct aicwf_tx_priv *tx_priv)
+{
+	if (tx_priv && tx_priv->aggr_buf) {
+#ifdef CONFIG_RESV_MEM_SUPPORT
+		aicwf_resv_mem_kfree_skb(&tx_priv->sdiodev->resv_mem, tx_priv->aggr_buf,
+					 AIC_RESV_MEM_TXDATA);
+#else
+		dev_kfree_skb(tx_priv->aggr_buf);
+#endif
+		kfree(tx_priv);
+	}
+}
+
+/* Validate a complete frame before copying it out of the SDIO aggregate. =
*/
+static bool aicwf_rx_frame_len(const u8 *data, unsigned int remaining,
+			       unsigned int *frame_len, unsigned int *consume)
+{
+	unsigned int pkt_len, hdr_len, param_len;
+
+	if (remaining < 4)
+		return false;
+
+	pkt_len =3D get_unaligned_le16(data);
+	if (!pkt_len)
+		return false;
+
+	*frame_len =3D pkt_len + ((data[2] & SDIO_TYPE_CFG) ? 4 : RX_HWHRD_LEN);
+	if (*frame_len > remaining)
+		return false;
+
+	if (data[2] & SDIO_TYPE_CFG) {
+		switch (data[2] & 0x7f) {
+		case SDIO_TYPE_CFG_CMD_RSP:
+			hdr_len =3D offsetof(struct ipc_e2a_msg, param);
+			if (pkt_len < hdr_len)
+				return false;
+			param_len =3D get_unaligned_le16(data + 4 +
+					      offsetof(struct ipc_e2a_msg, param_len));
+			if (param_len > pkt_len - hdr_len ||
+			    param_len > sizeof_field(struct ipc_e2a_msg, param))
+				return false;
+			break;
+		case SDIO_TYPE_CFG_DATA_CFM:
+			if (pkt_len < 2 * sizeof(u32))
+				return false;
+			break;
+		}
+	}
+
+	/* The last complete frame need not have trailing alignment padding. */
+	*consume =3D min_t(unsigned int, ALIGN(*frame_len, RX_ALIGNMENT), remaini=
ng);
+	return true;
+}
+
+int aicwf_process_rxframes(struct aicwf_rx_priv *rx_priv)
+{
+	int ret =3D 0;
+	unsigned long flags =3D 0;
+#ifndef CONFIG_PREALLOC_RX_SKB
+	struct sk_buff *skb =3D NULL;
+#endif
+	struct sk_buff *skb_inblock =3D NULL;
+	unsigned int aggr_len, adjust_len;
+	u8 *data =3D NULL;
+	u8 *msg =3D NULL;
+#ifdef CONFIG_PREALLOC_RX_SKB
+	struct rx_buff *buffer =3D NULL;
+
+	while (1) {
+		spin_lock_irqsave(&rx_priv->rxqlock, flags);
+		if (!rx_priv->rxq.qcnt) {
+			spin_unlock_irqrestore(&rx_priv->rxqlock, flags);
+			break;
+		}
+		buffer =3D rxbuff_dequeue(&rx_priv->rxq);
+		spin_unlock_irqrestore(&rx_priv->rxqlock, flags);
+		if (!buffer) {
+			dev_err(rx_priv->sdiodev->dev, "skb_error\n");
+			break;
+		}
+		while (aicwf_rx_frame_len(buffer->read, buffer->end - buffer->read,
+					  &aggr_len, &adjust_len)) {
+			data =3D buffer->read;
+
+			if ((data[2] & SDIO_TYPE_CFG) !=3D SDIO_TYPE_CFG) {
+				// type: data
+				skb_inblock =3D
+					__dev_alloc_skb(aggr_len + CCMP_OR_WEP_INFO, GFP_KERNEL);
+				if (!skb_inblock) {
+					dev_err(rx_priv->sdiodev->dev, "no more space! skip\n");
+					buffer->read =3D buffer->read + adjust_len;
+					continue;
+				}
+
+				skb_put(skb_inblock, aggr_len);
+				memcpy(skb_inblock->data, data, aggr_len);
+				aicwf_rxdataind(rx_priv->sdiodev->aicwf_hw, skb_inblock,
+						(void *)rx_priv);
+				buffer->read =3D buffer->read + adjust_len;
+			} else {
+				// type: config
+				msg =3D
+					kmalloc(aggr_len, GFP_KERNEL);
+				if (!msg) {
+					dev_err(rx_priv->sdiodev->dev, "no more space for msg\n");
+					ret =3D -ENOMEM;
+					break;
+				}
+
+				memcpy(msg, data, aggr_len);
+				if (((*(msg + 2) & 0x7f) =3D=3D SDIO_TYPE_CFG_CMD_RSP) &&
+				    rx_priv->sdiodev->bus_if->state !=3D BUS_DOWN_ST)
+					aicwf_rx_handle_msg(rx_priv->sdiodev->aicwf_hw,
+							    (struct ipc_e2a_msg *)(msg + 4));
+
+				if ((*(msg + 2) & 0x7f) =3D=3D SDIO_TYPE_CFG_DATA_CFM)
+					aicwf_sdio_host_tx_cfm_handler(&(rx_priv->sdiodev
+									 ->aicwf_hw->sdio_env),
+								       (u32 *)(msg + 4));
+
+				if ((*(msg + 2) & 0x7f) =3D=3D SDIO_TYPE_CFG_PRINT)
+					aicwf_rx_handle_print(rx_priv->sdiodev->aicwf_hw, msg + 4,
+							      aggr_len - 4);
+
+				buffer->read =3D buffer->read + adjust_len;
+				kfree(msg);
+			}
+		}
+
+		aicwf_prealloc_rxbuff_free(buffer, &rx_priv->rxbuff_lock);
+
+		atomic_dec(&rx_priv->rx_cnt);
+	}
+
+#else
+
+	while (1) {
+		spin_lock_irqsave(&rx_priv->rxqlock, flags);
+		if (aicwf_is_framequeue_empty(&rx_priv->rxq)) {
+			spin_unlock_irqrestore(&rx_priv->rxqlock, flags);
+			break;
+		}
+		skb =3D aicwf_frame_dequeue(&rx_priv->rxq);
+		spin_unlock_irqrestore(&rx_priv->rxqlock, flags);
+		if (!skb) {
+			dev_err(rx_priv->sdiodev->dev, "skb_error\n");
+			break;
+		}
+		while (aicwf_rx_frame_len(skb->data, skb->len,
+					  &aggr_len, &adjust_len)) {
+			data =3D skb->data;
+
+			if ((skb->data[2] & SDIO_TYPE_CFG) !=3D SDIO_TYPE_CFG) {
+				// type: data
+				skb_inblock =3D
+					__dev_alloc_skb(aggr_len + CCMP_OR_WEP_INFO, GFP_KERNEL);
+				if (!skb_inblock) {
+					dev_err(rx_priv->sdiodev->dev, "no more space! skip\n");
+					skb_pull(skb, adjust_len);
+					continue;
+				}
+
+				skb_put(skb_inblock, aggr_len);
+				memcpy(skb_inblock->data, data, aggr_len);
+				aicwf_rxdataind(rx_priv->sdiodev->aicwf_hw, skb_inblock,
+						(void *)rx_priv);
+				skb_pull(skb, adjust_len);
+			} else {
+				// type: config
+				msg =3D
+					kmalloc(aggr_len, GFP_KERNEL);
+				if (!msg) {
+					dev_err(rx_priv->sdiodev->dev, "no more space for msg\n");
+					ret =3D -ENOMEM;
+					break;
+				}
+
+				memcpy(msg, data, aggr_len);
+				if (((*(msg + 2) & 0x7f) =3D=3D SDIO_TYPE_CFG_CMD_RSP) &&
+				    rx_priv->sdiodev->bus_if->state !=3D BUS_DOWN_ST)
+					aicwf_rx_handle_msg(rx_priv->sdiodev->aicwf_hw,
+							    (struct ipc_e2a_msg *)(msg + 4));
+
+				struct sdio_host_env_tag *env =3D
+					&rx_priv->sdiodev->aicwf_hw->sdio_env;
+				if ((*(msg + 2) & 0x7f) =3D=3D SDIO_TYPE_CFG_DATA_CFM)
+					aicwf_sdio_host_tx_cfm_handler(env, (u32 *)(msg + 4));
+
+				if ((*(msg + 2) & 0x7f) =3D=3D SDIO_TYPE_CFG_PRINT)
+					aicwf_rx_handle_print(rx_priv->sdiodev->aicwf_hw,
+							      msg + 4, aggr_len - 4);
+
+				skb_pull(skb, adjust_len);
+				kfree(msg);
+			}
+		}
+
+		dev_kfree_skb(skb);
+		atomic_dec(&rx_priv->rx_cnt);
+	}
+#endif
+
+#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
+	aicwf_sdio_pwr_stctl(rx_priv->sdiodev, SDIO_ACTIVE_ST);
+#endif
+
+	return ret;
+}
+
+static struct recv_msdu *aicwf_rxframe_queue_init(struct list_head *q,
+						  int qsize)
+{
+	int i;
+	struct recv_msdu *req, *reqs;
+
+	reqs =3D vmalloc(qsize * sizeof(struct recv_msdu));
+	if (!reqs)
+		return NULL;
+
+	req =3D reqs;
+	for (i =3D 0; i < qsize; i++) {
+		INIT_LIST_HEAD(&req->rxframe_list);
+		list_add(&req->rxframe_list, q);
+		req++;
+	}
+
+	return reqs;
+}
+
+struct aicwf_rx_priv *aicwf_rx_init(void *arg)
+{
+	struct aicwf_rx_priv *rx_priv;
+	struct device *dev;
+
+	rx_priv =3D kzalloc_obj(*rx_priv, GFP_KERNEL);
+	if (!rx_priv)
+		return NULL;
+
+	rx_priv->sdiodev =3D (struct aic_sdio_dev *)arg;
+	dev =3D rx_priv->sdiodev->dev;
+
+#ifdef CONFIG_PREALLOC_RX_SKB
+	aicwf_rxframe_queue_init_2(&rx_priv->rxq, MAX_RXQLEN);
+#else
+	aicwf_frame_queue_init(&rx_priv->rxq, 1, MAX_RXQLEN);
+#endif
+	spin_lock_init(&rx_priv->rxqlock);
+#ifdef CONFIG_PREALLOC_RX_SKB
+	spin_lock_init(&rx_priv->rxbuff_lock);
+	aicwf_prealloc_init();
+#endif
+	atomic_set(&rx_priv->rx_cnt, 0);
+
+#ifdef CONFIG_AIC8800_RX_REORDER
+	struct list_head *q =3D &rx_priv->rxframes_freequeue;
+
+	INIT_LIST_HEAD(&rx_priv->rxframes_freequeue);
+	spin_lock_init(&rx_priv->freeq_lock);
+	rx_priv->recv_frames =3D aicwf_rxframe_queue_init(q, MAX_REORD_RXFRAME);
+	if (!rx_priv->recv_frames) {
+		dev_err(dev, "no enough buffer for free recv frame queue\n");
+		kfree(rx_priv);
+		return NULL;
+	}
+	spin_lock_init(&rx_priv->stas_reord_lock);
+	INIT_LIST_HEAD(&rx_priv->stas_reord_list);
+#endif
+
+	return rx_priv;
+}
+
+static void aicwf_recvframe_queue_deinit(struct list_head *q)
+{
+	struct recv_msdu *req, *next;
+
+	list_for_each_entry_safe(req, next, q, rxframe_list) {
+		list_del_init(&req->rxframe_list);
+	}
+}
+
+void aicwf_rx_deinit(struct aicwf_rx_priv *rx_priv)
+{
+#ifdef CONFIG_AIC8800_RX_REORDER
+	struct reord_ctrl_info *reord_info, *tmp;
+
+	spin_lock_bh(&rx_priv->stas_reord_lock);
+	list_for_each_entry_safe(reord_info, tmp, &rx_priv->stas_reord_list, list=
) {
+		reord_deinit_sta(rx_priv, reord_info);
+	}
+	spin_unlock_bh(&rx_priv->stas_reord_lock);
+#endif
+
+	pr_debug("sdio rx thread\n");
+	if (rx_priv->sdiodev->bus_if->busrx_thread) {
+		sched_set_normal(rx_priv->sdiodev->bus_if->busrx_thread, 0);
+		complete_all(&rx_priv->sdiodev->bus_if->busrx_trgg);
+		kthread_stop(rx_priv->sdiodev->bus_if->busrx_thread);
+		rx_priv->sdiodev->bus_if->busrx_thread =3D NULL;
+	}
+#ifdef CONFIG_OOB
+	if (rx_priv->sdiodev->oob_enable) {
+		// new oob feature
+		if (rx_priv->sdiodev->bus_if->busirq_thread) {
+			complete_all(&rx_priv->sdiodev->bus_if->busirq_trgg);
+			kthread_stop(rx_priv->sdiodev->bus_if->busirq_thread);
+			rx_priv->sdiodev->bus_if->busirq_thread =3D NULL;
+		}
+	}
+#endif // CONFIG_OOB
+
+#ifdef CONFIG_PREALLOC_RX_SKB
+	rxbuff_queue_flush(rx_priv);
+#else
+	aicwf_frame_queue_flush(&rx_priv->rxq);
+#endif
+
+#ifdef CONFIG_AIC8800_RX_REORDER
+	aicwf_recvframe_queue_deinit(&rx_priv->rxframes_freequeue);
+	if (rx_priv->recv_frames)
+		vfree(rx_priv->recv_frames);
+#endif
+
+#ifdef CONFIG_PREALLOC_RX_SKB
+	aicwf_prealloc_exit();
+#endif
+	kfree(rx_priv);
+}
+
+bool aicwf_rxframe_enqueue(struct device *dev, struct frame_queue *q,
+			   struct sk_buff *pkt)
+{
+	return aicwf_frame_enq(dev, q, pkt, 0);
+}
+
+void aicwf_dev_skb_free(struct sk_buff *skb)
+{
+	if (!skb)
+		return;
+
+	dev_kfree_skb_any(skb);
+}
+
+static struct sk_buff *aicwf_frame_queue_penq(struct frame_queue *pq, int =
prio,
+					      struct sk_buff *p)
+{
+	struct sk_buff_head *q;
+
+	if (pq->queuelist[prio].qlen >=3D pq->qmax)
+		return NULL;
+
+	q =3D &pq->queuelist[prio];
+	__skb_queue_tail(q, p);
+	pq->qcnt++;
+	if (pq->hi_prio < prio)
+		pq->hi_prio =3D (u16)prio;
+
+	return p;
+}
+
+void aicwf_frame_queue_flush(struct frame_queue *pq)
+{
+	int prio;
+	struct sk_buff_head *q;
+	struct sk_buff *p, *next;
+
+	for (prio =3D 0; prio < pq->num_prio; prio++) {
+		q =3D &pq->queuelist[prio];
+		skb_queue_walk_safe(q, p, next)
+		{
+			skb_unlink(p, q);
+			aicwf_dev_skb_free(p);
+			pq->qcnt--;
+		}
+	}
+}
+
+void aicwf_frame_queue_init(struct frame_queue *pq, int num_prio, int max_=
len)
+{
+	int prio;
+
+	memset(pq, 0,
+	       offsetof(struct frame_queue, queuelist) +
+	       (sizeof(struct sk_buff_head) * num_prio));
+	pq->num_prio =3D (u16)num_prio;
+	pq->qmax =3D (u16)max_len;
+
+	for (prio =3D 0; prio < num_prio; prio++)
+		skb_queue_head_init(&pq->queuelist[prio]);
+}
+
+bool aicwf_is_framequeue_empty(struct frame_queue *pq)
+{
+	int prio, len =3D 0;
+
+	for (prio =3D 0; prio <=3D pq->hi_prio; prio++)
+		len +=3D pq->queuelist[prio].qlen;
+
+	if (len > 0)
+		return false;
+	else
+		return true;
+}
+
+struct sk_buff *aicwf_frame_dequeue(struct frame_queue *pq)
+{
+	struct sk_buff_head *q;
+	struct sk_buff *p;
+	int prio;
+
+	if (pq->qcnt =3D=3D 0)
+		return NULL;
+
+	while ((prio =3D pq->hi_prio) > 0 && skb_queue_empty(&pq->queuelist[prio]=
))
+		pq->hi_prio--;
+
+	q =3D &pq->queuelist[prio];
+	p =3D __skb_dequeue(q);
+	if (!p)
+		return NULL;
+
+	pq->qcnt--;
+
+	return p;
+}
+
+bool aicwf_frame_enq(struct device *dev, struct frame_queue *q,
+		     struct sk_buff *pkt, int prio)
+{
+	if (q->queuelist[prio].qlen < q->qmax && q->qcnt < q->qmax) {
+		aicwf_frame_queue_penq(q, prio, pkt);
+		return true;
+	}
+	return false;
+}
+
+#ifdef CONFIG_PREALLOC_RX_SKB
+
+static struct rx_buff *rxbuff_queue_penq(struct rx_frame_queue *pq,
+					 struct rx_buff *p)
+{
+	struct list_head *q;
+
+	if (pq->qcnt >=3D pq->qmax)
+		return NULL;
+
+	q =3D &pq->queuelist;
+	list_add_tail(&p->queue, q);
+
+	pq->qcnt++;
+
+	return p;
+}
+
+struct rx_buff *rxbuff_dequeue(struct rx_frame_queue *pq)
+{
+	struct rx_buff *p =3D NULL;
+
+	if (pq->qcnt =3D=3D 0) {
+		pr_err("%d, rxq is empty\n", __LINE__);
+		return NULL;
+	}
+
+	if (list_empty(&pq->queuelist)) {
+		pr_err("%d, rxq is empty\n", __LINE__);
+		return NULL;
+	}
+	p =3D list_first_entry(&pq->queuelist, struct rx_buff, queue);
+	list_del_init(&p->queue);
+	pq->qcnt--;
+
+	return p;
+}
+
+bool aicwf_rxbuff_enqueue(struct device *dev, struct rx_frame_queue *rxq,
+			  struct rx_buff *pkt)
+{
+	if (!rxq || !pkt) {
+		dev_err(dev, "%d, rxq or pkt is NULL\n", __LINE__);
+		return false;
+	}
+
+	if (rxq->qcnt < rxq->qmax) {
+		if (rxbuff_queue_penq(rxq, pkt))
+			return true;
+		dev_err(dev, "%d, rxbuff enqueue fail\n", __LINE__);
+		return false;
+	}
+	dev_err(dev, "%d, rxq or pkt is full\n", __LINE__);
+	return false;
+}
+#endif
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_txrxif.h b/drivers=
/net/wireless/aic/aic8800_fdrv/aicwf_txrxif.h
new file mode 100644
index 000000000000..8ba2dd26b365
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_txrxif.h
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _AICWF_TXRXIF_H_
+#define _AICWF_TXRXIF_H_
+
+#include "aicwf_rx_prealloc.h"
+#include "ipc_shared.h"
+#include <linux/sched.h>
+#include <linux/skbuff.h>
+#include "aicwf_sdio.h"
+#include "aic_bus.h"
+
+#define CMD_BUF_MAX        1536
+#define TXPKT_BLOCKSIZE    512
+#define MAX_AGGR_TXPKT_LEN (1536 * 64)
+#define CMD_TX_TIMEOUT     5000
+#define TX_ALIGNMENT       4
+
+#define RX_HWHRD_LEN     60 // 58->60 word allined
+#define CCMP_OR_WEP_INFO 8
+#define MAX_RXQLEN       2000
+#define RX_ALIGNMENT     4
+
+#define DEFRAG_MAX_WAIT 40 // 100
+
+#ifdef CONFIG_AIC8800_RX_REORDER
+#define MAX_REORD_RXFRAME     250
+#define REORDER_UPDATE_TIME   100//50
+#define AICWF_REORDER_WINSIZE 64
+#define SN_LESS(a, b)         ((((a) - (b)) & 0x800) !=3D 0)
+#define SN_EQUAL(a, b)        ((a) =3D=3D (b))
+#endif
+
+struct frame_queue {
+	u16 num_prio;
+	u16 hi_prio;
+	u16 qmax; /* max number of queued frames */
+	u16 qcnt;
+	struct sk_buff_head queuelist[8];
+};
+
+#ifdef CONFIG_PREALLOC_RX_SKB
+struct rx_frame_queue {
+	u16 qmax; /* max number of queued frames */
+	u16 qcnt;
+	struct list_head queuelist;
+};
+#endif
+
+struct aicwf_tx_priv {
+	struct aic_sdio_dev *sdiodev;
+	int fw_avail_bufcnt;
+	// for cmd tx
+	u8 *cmd_buf;
+	uint cmd_len;
+	bool cmd_txstate;
+	bool cmd_tx_succ;
+	struct semaphore cmd_txsema;
+	wait_queue_head_t cmd_txdone_wait;
+	// for data tx
+	atomic_t tx_pktcnt;
+
+	struct frame_queue txq;
+	/* lock for tx */
+	spinlock_t txqlock;
+	struct semaphore txctl_sema;
+	struct sk_buff *aggr_buf;
+	atomic_t aggr_count;
+	u8 *head;
+	u8 *tail;
+};
+
+#ifdef CONFIG_AIC8800_RX_REORDER
+struct reord_ctrl {
+	struct aicwf_rx_priv *rx_priv;
+	u8 enable;
+	u16 ind_sn;
+	u8 wsize_b;
+	/* lock for reord_list */
+	spinlock_t reord_list_lock;
+	struct list_head reord_list;
+	struct timer_list reord_timer;
+	struct work_struct reord_timer_work;
+};
+
+struct reord_ctrl_info {
+	u8 mac_addr[6];
+	struct reord_ctrl preorder_ctrl[8];
+	struct list_head list;
+};
+
+struct recv_msdu {
+	struct sk_buff *pkt;
+	u8 tid;
+	u16 seq_num;
+	u8 forward;
+	u32 is_amsdu;
+	u8 *rx_data;
+	// for pending rx reorder list
+	struct list_head reord_pending_list;
+	// for total frame list, when rxframe from busif, dequeue, when submit fr=
ame
+	// to net, enqueue
+	struct list_head rxframe_list;
+	struct reord_ctrl *preorder_ctrl;
+};
+#endif
+
+struct aicwf_rx_priv {
+	struct aic_sdio_dev *sdiodev;
+	void *aicwf_vif;
+	atomic_t rx_cnt;
+	u32 data_len;
+	/* lock for aicwf_rx */
+	spinlock_t rxqlock;
+#ifdef CONFIG_PREALLOC_RX_SKB
+	struct rx_frame_queue rxq;
+#else
+	struct frame_queue rxq;
+#endif
+
+#ifdef CONFIG_AIC8800_RX_REORDER
+	/* lock for freeq */
+	spinlock_t freeq_lock;
+	struct list_head rxframes_freequeue;
+	struct list_head stas_reord_list;
+	/* lock for stas reord */
+	spinlock_t stas_reord_lock;
+	struct recv_msdu *recv_frames;
+#endif
+#ifdef CONFIG_PREALLOC_RX_SKB
+	/* lock for rxbuff */
+	spinlock_t rxbuff_lock;
+#endif
+};
+
+void aicwf_tx_deinit(struct aicwf_tx_priv *tx_priv);
+void aicwf_rx_deinit(struct aicwf_rx_priv *rx_priv);
+struct aicwf_tx_priv *aicwf_tx_init(void *arg);
+struct aicwf_rx_priv *aicwf_rx_init(void *arg);
+void aicwf_frame_queue_init(struct frame_queue *pq, int num_prio, int max_=
len);
+void aicwf_frame_queue_flush(struct frame_queue *pq);
+bool aicwf_frame_enq(struct device *dev, struct frame_queue *q,
+		     struct sk_buff *pkt, int prio);
+bool aicwf_rxframe_enqueue(struct device *dev, struct frame_queue *q,
+			   struct sk_buff *pkt);
+bool aicwf_is_framequeue_empty(struct frame_queue *pq);
+void aicwf_frame_tx(void *dev, struct sk_buff *skb);
+void aicwf_dev_skb_free(struct sk_buff *skb);
+struct sk_buff *aicwf_frame_dequeue(struct frame_queue *pq);
+#ifdef CONFIG_PREALLOC_RX_SKB
+void rxbuff_queue_flush(struct aicwf_rx_priv *rx_priv);
+void aicwf_rxframe_queue_init_2(struct rx_frame_queue *pq, int max_len);
+struct rx_buff *rxbuff_dequeue(struct rx_frame_queue *pq);
+bool aicwf_rxbuff_enqueue(struct device *dev, struct rx_frame_queue *rxq,
+			  struct rx_buff *pkt);
+#endif
+
+#endif /* _AICWF_TXRXIF_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_utils.c b/drivers/=
net/wireless/aic/aic8800_fdrv/aicwf_utils.c
new file mode 100644
index 000000000000..72093a0af26b
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_utils.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *************************************************************************=
***************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @file aicwf_utils.c
+ *
+ * @brief IPC utility function declarations
+ *
+ *************************************************************************=
***************
+ */
+
+#include "aicwf_utils.h"
+#include "aicwf_defs.h"
+#include "aicwf_msg_rx.h"
+#include "aicwf_rx.h"
+#include "aicwf_tx.h"
+
+int aicwf_init_aic(struct aicwf_hw *aicwf_hw)
+{
+	int ret;
+
+	aicwf_sdio_host_init(&aicwf_hw->sdio_env, NULL, NULL, aicwf_hw);
+	ret =3D aicwf_cmd_mgr_init(aicwf_hw->cmd_mgr);
+	if (ret)
+		return ret;
+
+	aicwf_hw->testmode =3D 0;
+
+	return 0;
+}
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_utils.h b/drivers/=
net/wireless/aic/aic8800_fdrv/aicwf_utils.h
new file mode 100644
index 000000000000..26cef77a0904
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_utils.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *************************************************************************=
***************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @file aicwf_utils.h
+ *
+ * @brief IPC utility function declarations
+ *
+ *************************************************************************=
***************
+ */
+
+#ifndef _AICWF_IPC_UTILS_H_
+#define _AICWF_IPC_UTILS_H_
+
+#include <linux/dma-mapping.h>
+#include <linux/skbuff.h>
+#include "lmac_msg.h"
+#include "aicwf_config.h"
+
+/*
+ * Maximum Length of Radiotap header vendor specific data(in bytes)
+ */
+#define RADIOTAP_HDR_VEND_MAX_LEN 16
+
+/*
+ * Maximum Radiotap Header Length without vendor specific data (in bytes)
+ */
+#define RADIOTAP_HDR_MAX_LEN 80
+
+/*
+ * Unsupported HT Frame data length (in bytes)
+ */
+#define UNSUP_RX_VEC_DATA_LEN 2
+
+struct aicwf_hw;
+struct aicwf_sta;
+
+enum aicwf_dev_flag {
+	AICWF_DEV_RESTARTING,
+	AICWF_DEV_STACK_RESTARTING,
+	AICWF_DEV_STARTED,
+};
+
+/**
+ * struct aicwf_ipc_elem_var - Generic IPC buffer of variable size
+ *
+ * @addr: Host address of the buffer.
+ * @dma_addr: DMA address of the buffer.
+ * @size: Size, in bytes, of the buffer
+ */
+struct aicwf_ipc_elem_var {
+	void *addr;
+	dma_addr_t dma_addr;
+	size_t size;
+};
+
+int aicwf_init_aic(struct aicwf_hw *aicwf_hw);
+
+#endif /* _AICWF_IPC_UTILS_H_ */
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/hal_desc.h b/drivers/net=
/wireless/aic/aic8800_fdrv/hal_desc.h
new file mode 100644
index 000000000000..b7a96c8a4c8f
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/hal_desc.h
@@ -0,0 +1,359 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *************************************************************************=
*****
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @file hal_desc.c
+ *
+ * @brief File containing the definition of HW descriptors
+ *
+ *************************************************************************=
*****
+ */
+
+#ifndef _HAL_DESC_H_
+#define _HAL_DESC_H_
+
+#include "lmac_types.h"
+#include "aicwf_config.h"
+
+/* Rate and policy table */
+
+#define N_CCK   8
+#define N_OFDM  8
+#define N_HT    (8 * 2 * 2 * 4)
+#define N_VHT   (10 * 4 * 2 * 8)
+#define N_HE_SU (12 * 4 * 3 * 8)
+#define N_HE_MU (12 * 6 * 3 * 8)
+#define N_HE_ER (3 * 3 + 3) // RU242 + RU106
+
+/* Values for formatModTx */
+#define FORMATMOD_NON_HT          0
+#define FORMATMOD_NON_HT_DUP_OFDM 1
+#define FORMATMOD_HT_MF           2
+#define FORMATMOD_HT_GF           3
+#define FORMATMOD_VHT             4
+#define FORMATMOD_HE_SU           5
+#define FORMATMOD_HE_MU           6
+#define FORMATMOD_HE_ER           7
+#define FORMATMOD_HE_TB           8
+
+/* Values for navProtFrmEx */
+#define NAV_PROT_NO_PROT_BIT          0
+#define NAV_PROT_SELF_CTS_BIT         1
+#define NAV_PROT_RTS_CTS_BIT          2
+#define NAV_PROT_RTS_CTS_WITH_QAP_BIT 3
+#define NAV_PROT_STBC_BIT             4
+
+/* THD MACCTRLINFO2 fields, used in  struct umacdesc umac.flags */
+/// WhichDescriptor definition - contains aMPDU bit and position value
+/// Offset of WhichDescriptor field in the MAC CONTROL INFO 2 word
+#define WHICHDESC_OFT                   19
+/// Mask of the WhichDescriptor field
+#define WHICHDESC_MSK                   (0x07 << WHICHDESC_OFT)
+/// Only 1 THD possible, describing an unfragmented MSDU
+#define WHICHDESC_UNFRAGMENTED_MSDU     (0x00 << WHICHDESC_OFT)
+/// THD describing the first MPDU of a fragmented MSDU
+#define WHICHDESC_FRAGMENTED_MSDU_FIRST (0x01 << WHICHDESC_OFT)
+/// THD describing intermediate MPDUs of a fragmented MSDU
+#define WHICHDESC_FRAGMENTED_MSDU_INT   (0x02 << WHICHDESC_OFT)
+/// THD describing the last MPDU of a fragmented MSDU
+#define WHICHDESC_FRAGMENTED_MSDU_LAST  (0x03 << WHICHDESC_OFT)
+/// THD for extra descriptor starting an AMPDU
+#define WHICHDESC_AMPDU_EXTRA           (0x04 << WHICHDESC_OFT)
+/// THD describing the first MPDU of an A-MPDU
+#define WHICHDESC_AMPDU_FIRST           (0x05 << WHICHDESC_OFT)
+/// THD describing intermediate MPDUs of an A-MPDU
+#define WHICHDESC_AMPDU_INT             (0x06 << WHICHDESC_OFT)
+/// THD describing the last MPDU of an A-MPDU
+#define WHICHDESC_AMPDU_LAST            (0x07 << WHICHDESC_OFT)
+
+/// aMPDU bit offset
+#define AMPDU_OFT 21
+/// aMPDU bit
+#define AMPDU_BIT CO_BIT(AMPDU_OFT)
+
+union aicwf_mcs_index {
+	struct {
+		u32 mcs : 3;
+		u32 nss : 2;
+	} ht;
+	struct {
+		u32 mcs : 4;
+		u32 nss : 3;
+	} vht;
+	struct {
+		u32 mcs : 4;
+		u32 nss : 3;
+	} he;
+	u32 legacy : 7;
+};
+
+/* c.f RW-WLAN-nX-MAC-HW-UM */
+union aicwf_rate_ctrl_info {
+	struct {
+		u32 mcs_index_tx : 7;
+		u32 bw_tx : 2;
+		u32 gi_and_pre_type_tx : 2;
+		u32 format_mod_tx : 3;
+		u32 nav_prot_frm_ex : 3;
+		u32 mcs_index_prot_tx : 7;
+		u32 bw_prot_tx : 2;
+		u32 format_mod_prot_tx : 3;
+		u32 n_retry : 3;
+	};
+	u32 value;
+};
+
+/* c.f RW-WLAN-nX-MAC-HW-UM */
+struct aicwf_power_ctrl_info {
+	u32 tx_pwr_level_pt : 8;
+	u32 tx_pwr_level_prot_pt : 8;
+	u32 reserved : 16;
+};
+
+/* c.f RW-WLAN-nX-MAC-HW-UM */
+union aicwf_pol_phy_ctrl_info_1 {
+	struct {
+		u32 rsvd1 : 3;
+		u32 bf_frm_ex : 1;
+		u32 num_extn_ss : 2;
+		u32 fec_coding : 1;
+		u32 stbc : 2;
+		u32 rsvd2 : 5;
+		u32 n_tx : 3;
+		u32 n_tx_prot : 3;
+	};
+	u32 value;
+};
+
+/* c.f RW-WLAN-nX-MAC-HW-UM */
+union aicwf_pol_phy_ctrl_info_2 {
+	struct {
+		u32 antenna_set : 8;
+		u32 smm_index : 8;
+		u32 beam_formed : 1;
+	};
+	u32 value;
+};
+
+/* c.f RW-WLAN-nX-MAC-HW-UM */
+union aicwf_pol_mac_ctrl_info_1 {
+	struct {
+		u32 key_sram_index : 10;
+		u32 key_sram_index_ra : 10;
+	};
+	u32 value;
+};
+
+/* c.f RW-WLAN-nX-MAC-HW-UM */
+union aicwf_pol_mac_ctrl_info_2 {
+	struct {
+		u32 long_retry_limit : 8;
+		u32 short_retry_limit : 8;
+		u32 rts_threshold : 12;
+	};
+	u32 value;
+};
+
+#define POLICY_TABLE_PATTERN 0xBADCAB1E
+
+struct tx_policy_tbl {
+	/* Unique Pattern at the start of Policy Table */
+	u32 upatterntx;
+	/* PHY Control 1 Information used by MAC HW */
+	union aicwf_pol_phy_ctrl_info_1 phyctrlinfo_1;
+	/* PHY Control 2 Information used by MAC HW */
+	union aicwf_pol_phy_ctrl_info_2 phyctrlinfo_2;
+	/* MAC Control 1 Information used by MAC HW */
+	union aicwf_pol_mac_ctrl_info_1 macctrlinfo_1;
+	/* MAC Control 2 Information used by MAC HW */
+	union aicwf_pol_mac_ctrl_info_2 macctrlinfo_2;
+
+	union aicwf_rate_ctrl_info ratectrlinfos[NX_TX_MAX_RATES];
+	struct aicwf_power_ctrl_info powerctrlinfos[NX_TX_MAX_RATES];
+};
+
+#ifdef CONFIG_AICWF_FULLMAC
+
+/**
+ * union aicwf_hw_txstatus - Bitfield of confirmation status
+ *
+ * @tx_done: Packet has been processed by the firmware
+ * @retry_required: Packet was transmitted but not acknowledged and must b=
e
+ *                  submitted again by the driver
+ * @sw_retry_required: Packet was not transmitted by the firmware and must=
 be
+ *                     submitted again by the driver
+ * @acknowledged: Packet was acknowledged by the peer
+ * @reserved: Reserved status bits
+ * @value: Complete status word
+ */
+union aicwf_hw_txstatus {
+	struct {
+		u32 tx_done : 1;
+		u32 retry_required : 1;
+		u32 sw_retry_required : 1;
+		u32 acknowledged : 1;
+		u32 reserved : 28;
+	};
+	u32 value;
+};
+
+/**
+ * struct tx_cfm_tag - Structure indicating the status and other
+ * information about the transmission
+ *
+ * @credits: Number of credits returned to the TX queue (0 or 1)
+ * @ampdu_size: Number of frames in the A-MPDU when this was its last fram=
e,
+ *              0 when this was not the last frame, or 1 for a singleton
+ * @amsdu_size: Maximum A-MSDU size in bytes
+ * @status: Transmission status
+ * @hostid: Host identifier of the transmitted buffer
+ */
+struct tx_cfm_tag {
+	/*
+	 *	u16 pn[4];
+	 *	u16 sn;
+	 *	u16 timestamp;
+	 */
+	s8 credits;
+	u8 ampdu_size;
+#ifdef CONFIG_AICWF_SPLIT_TX_BUF
+	u16 amsdu_size;
+#endif
+	union aicwf_hw_txstatus status;
+	u32 hostid;
+};
+
+/**
+ * struct aicwf_hw_txhdr - Hardware part of tx header
+ *
+ * @cfm: Information updated by fw/hardware after sending a frame
+ */
+struct aicwf_hw_txhdr {
+	struct tx_cfm_tag cfm;
+};
+
+#endif /* CONFIG_AICWF_FULLMAC */
+
+/* Modem */
+
+#define MDM_PHY_CONFIG_TRIDENT 0
+#define MDM_PHY_CONFIG_ELMA    1
+#define MDM_PHY_CONFIG_KARST   2
+
+// MODEM features (from reg_mdm_stat.h)
+/// MUMIMOTX field bit
+#define MDM_MUMIMOTX_BIT ((u32)0x80000000)
+/// MUMIMOTX field position
+#define MDM_MUMIMOTX_POS 31
+/// MUMIMORX field bit
+#define MDM_MUMIMORX_BIT ((u32)0x40000000)
+/// MUMIMORX field position
+#define MDM_MUMIMORX_POS 30
+/// BFMER field bit
+#define MDM_BFMER_BIT    ((u32)0x20000000)
+/// BFMER field position
+#define MDM_BFMER_POS    29
+/// BFMEE field bit
+#define MDM_BFMEE_BIT    ((u32)0x10000000)
+/// BFMEE field position
+#define MDM_BFMEE_POS    28
+/// LDPCDEC field bit
+#define MDM_LDPCDEC_BIT  ((u32)0x08000000)
+/// LDPCDEC field position
+#define MDM_LDPCDEC_POS  27
+/// LDPCENC field bit
+#define MDM_LDPCENC_BIT  ((u32)0x04000000)
+/// LDPCENC field position
+#define MDM_LDPCENC_POS  26
+/// CHBW field mask
+#define MDM_CHBW_MASK    ((u32)0x03000000)
+/// CHBW field LSB position
+#define MDM_CHBW_LSB     24
+/// CHBW field width
+#define MDM_CHBW_WIDTH   ((u32)0x00000002)
+/// DSSSCCK field bit
+#define MDM_DSSSCCK_BIT  ((u32)0x00800000)
+/// DSSSCCK field position
+#define MDM_DSSSCCK_POS  23
+/// VHT field bit
+#define MDM_VHT_BIT      ((u32)0x00400000)
+/// VHT field position
+#define MDM_VHT_POS      22
+/// HE field bit
+#define MDM_HE_BIT       ((u32)0x00200000)
+/// HE field position
+#define MDM_HE_POS       21
+/// ESS field bit
+#define MDM_ESS_BIT      ((u32)0x00100000)
+/// ESS field position
+#define MDM_ESS_POS      20
+/// RFMODE field mask
+#define MDM_RFMODE_MASK  ((u32)0x000F0000)
+/// RFMODE field LSB position
+#define MDM_RFMODE_LSB   16
+/// RFMODE field width
+#define MDM_RFMODE_WIDTH ((u32)0x00000004)
+/// NSTS field mask
+#define MDM_NSTS_MASK    ((u32)0x0000F000)
+/// NSTS field LSB position
+#define MDM_NSTS_LSB     12
+/// NSTS field width
+#define MDM_NSTS_WIDTH   ((u32)0x00000004)
+/// NSS field mask
+#define MDM_NSS_MASK     ((u32)0x00000F00)
+/// NSS field LSB position
+#define MDM_NSS_LSB      8
+/// NSS field width
+#define MDM_NSS_WIDTH    ((u32)0x00000004)
+/// NTX field mask
+#define MDM_NTX_MASK     ((u32)0x000000F0)
+/// NTX field LSB position
+#define MDM_NTX_LSB      4
+/// NTX field width
+#define MDM_NTX_WIDTH    ((u32)0x00000004)
+/// NRX field mask
+#define MDM_NRX_MASK     ((u32)0x0000000F)
+/// NRX field LSB position
+#define MDM_NRX_LSB      0
+/// NRX field width
+#define MDM_NRX_WIDTH    ((u32)0x00000004)
+
+#define __MDM_PHYCFG_FROM_VERS(v) (((v) & MDM_RFMODE_MASK) >> MDM_RFMODE_L=
SB)
+
+#define RIU_FCU_PRESENT_MASK ((u32)0xFF000000)
+#define RIU_FCU_PRESENT_LSB  24
+
+#define __RIU_FCU_PRESENT(v)                                              =
     \
+	(((v) & RIU_FCU_PRESENT_MASK) >> RIU_FCU_PRESENT_LSB =3D=3D 5)
+
+/// AGC load version field mask
+#define RIU_AGC_LOAD_MASK ((u32)0x00C00000)
+/// AGC load version field LSB position
+#define RIU_AGC_LOAD_LSB  22
+
+#define __RIU_AGCLOAD_FROM_VERS(v)                                        =
     \
+	(((v) & RIU_AGC_LOAD_MASK) >> RIU_AGC_LOAD_LSB)
+
+#define __FPGA_TYPE(v) (((v) & 0xFFFF0000) >> 16)
+
+#define __MDM_MAJOR_VERSION(v) (((v) & 0xFF000000) >> 24)
+#define __MDM_MINOR_VERSION(v) (((v) & 0x00FF0000) >> 16)
+/*
+ * #define __MDM_VERSION(v)                                               =
        \
+ *	((__MDM_MAJOR_VERSION(v) + 2) * 10 + __MDM_MINOR_VERSION(v))
+ */
+#define __MDM_VERSION(v)	\
+({								\
+	u32 __v =3D (v);						\
+	(__MDM_MAJOR_VERSION(__v) + 2) * 10 + __MDM_MINOR_VERSION(__v);	\
+})
+
+/* conversion table from NL80211 to MACHW enum */
+extern const int chnl2bw[];
+
+/* conversion table from MACHW to NL80211 enum */
+extern const int bw2chnl[];
+
+#endif // _HAL_DESC_H_
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/ipc_shared.h b/drivers/n=
et/wireless/aic/aic8800_fdrv/ipc_shared.h
new file mode 100644
index 000000000000..2b5c31f3abae
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/ipc_shared.h
@@ -0,0 +1,767 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *************************************************************************=
*****
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief Shared data between both IPC modules
+ *
+ *************************************************************************=
*****
+ */
+
+#ifndef _IPC_SHARED_H_
+#define _IPC_SHARED_H_
+
+/*
+ * INCLUDE FILES
+ *************************************************************************=
***************
+ */
+#include "lmac_mac.h"
+#include "aicwf_config.h"
+
+/*
+ * DEFINES AND MACROS
+ *************************************************************************=
***************
+ */
+#define CO_BIT(pos) (1U << (pos))
+
+#define IPC_TXQUEUE_CNT NX_TXQ_CNT
+#define NX_TXDESC_CNT0  8
+#define NX_TXDESC_CNT1  64
+#define NX_TXDESC_CNT2  64
+#define NX_TXDESC_CNT3  32
+#if NX_TXQ_CNT =3D=3D 5
+#define NX_TXDESC_CNT4 8
+#endif
+
+/*
+ * Number of Host buffers available for Data Rx handling (through DMA)
+ */
+#define IPC_RXBUF_CNT 128
+
+/*
+ * Number of shared descriptors available for Data RX handling
+ */
+#define IPC_RXDESC_CNT 128
+
+/*
+ * Number of Host buffers available for Radar events handling (through DMA=
)
+ */
+#define IPC_RADARBUF_CNT 16
+
+/*
+ * Number of Host buffers available for unsupported Rx vectors handling (t=
hrough
+ * DMA)
+ */
+#define IPC_UNSUPRXVECBUF_CNT 8
+
+/*
+ *  Size of RxVector
+ */
+#define IPC_RXVEC_SIZE 16
+
+/*
+ * Number of Host buffers available for Emb->App MSGs sending (through DMA=
)
+ */
+#ifdef CONFIG_AICWF_FULLMAC
+#define IPC_MSGE2A_BUF_CNT 64
+#endif
+/*
+ * Number of Host buffers available for Debug Messages sending (through DM=
A)
+ */
+#define IPC_DBGBUF_CNT 32
+
+/*
+ * Length used in MSGs structures
+ */
+#define IPC_A2E_MSG_BUF_SIZE 127 // size in 4-byte words
+#ifdef CONFIG_AICWF_FULLMAC
+#define IPC_E2A_MSG_SIZE_BASE 256 // size in 4-byte words
+#endif
+
+#define IPC_E2A_MSG_PARAM_SIZE IPC_E2A_MSG_SIZE_BASE
+
+/*
+ * Debug messages buffers size (in bytes)
+ */
+#define IPC_DBG_PARAM_SIZE 256
+
+/*
+ * Define used for Rx hostbuf validity.
+ * This value should appear only when hostbuf was used for a Reception.
+ */
+#define RX_DMA_OVER_PATTERN 0xAAAAAA00
+
+/*
+ * Define used for MSG buffers validity.
+ * This value will be written only when a MSG buffer is used for sending f=
rom
+ * Emb to App.
+ */
+#define IPC_MSGE2A_VALID_PATTERN 0xADDEDE2A
+
+/*
+ * Define used for Debug messages buffers validity.
+ * This value will be written only when a DBG buffer is used for sending f=
rom
+ * Emb to App.
+ */
+#define IPC_DBG_VALID_PATTERN 0x000CACA0
+
+/*
+ *  Length of the receive vectors, in bytes
+ */
+#define DMA_HDR_PHYVECT_LEN 36
+
+/*
+ * Maximum number of payload addresses and lengths present in the descript=
or
+ */
+#ifdef CONFIG_AICWF_SPLIT_TX_BUF
+#define NX_TX_PAYLOAD_MAX 6
+#else
+#define NX_TX_PAYLOAD_MAX 1
+#endif
+
+/*
+ * Message struct/ID API version
+ */
+#define MSG_API_VER 33
+
+/*
+ *************************************************************************=
***************
+ */
+// c.f LMAC/src/tx/tx_swdesc.h
+/// Descriptor filled by the Host
+struct hostdesc {
+	/// Pointer to packet payload
+	// u32 packet_addr;
+	/// Size of the payload
+	u16 packet_len;
+	u16 flags_ext;
+
+	u32 hostid;
+#ifdef CONFIG_AICWF_FULLMAC
+	/// Address of the status descriptor in host memory (used for confirmatio=
n
+	/// upload)
+	// u32 status_desc_addr;
+	/// Destination Address
+	struct mac_addr eth_dest_addr;
+	/// Source Address
+	struct mac_addr eth_src_addr;
+	/// Ethernet Type
+	__be16 ethertype;
+#else /* ! CONFIG_AICWF_FULLMAC */
+#ifdef CONFIG_AICWF_AGG_TX
+	/// Sequence Number for AMPDU MPDUs - for quick check if it's allowed wit=
hin
+	/// window
+	u16 sn;
+#endif /* CONFIG_AICWF_AGG_TX */
+	/// Padding between the buffer control structure and the MPDU in host mem=
ory
+	u8 padding;
+#endif /* CONFIG_AICWF_FULLMAC */
+	u8 ac;
+	/// Packet TID (0xFF if not a QoS frame)
+	u8 tid;
+	/// Interface Id
+	u8 vif_idx;
+	/// Station Id (0xFF if station is unknown)
+	u8 staid;
+#ifdef CONFIG_AICWF_MUMIMO_TX
+	/// MU-MIMO information (GroupId and User Position in the group) - The
+	/// GroupId is located on bits 0-5 and the User Position on bits 6-7. The
+	/// GroupId value is set to 63 if MU-MIMO shall not be used
+	u8 mumimo_info;
+#endif /* CONFIG_AICWF_MUMIMO_TX */
+#ifdef CONFIG_AICWF_FULLMAC
+	/// TX flags
+	u16 flags;
+#endif /* CONFIG_AICWF_FULLMAC */
+};
+
+/// Descriptor filled by the UMAC
+struct umacdesc {
+#ifdef CONFIG_AICWF_AGG_TX
+	/// First Sequence Number of the BlockAck window
+	u16 sn_win;
+	/// Flags from UMAC (match tx_hd.macctrlinfo2 format)
+	u32 flags;
+	/// PHY related flags field - rate, GI type, BW type - filled by driver
+	u32 phy_flags;
+#endif //(CONFIG_AICWF_AGG_TX)
+};
+
+struct txdesc_api {
+	/// Information provided by Host
+	struct hostdesc host;
+};
+
+struct txdesc_host {
+	u32 ready;
+
+	/// API of the embedded part
+	struct txdesc_api api;
+};
+
+/// Comes from ipc_dma.h
+/// Element in the pool of TX DMA bridge descriptors.
+struct dma_desc {
+	/* Application subsystem address which is used as source address for DMA
+	 * payload transfer
+	 */
+	u32 src;
+	/** Points to the start of the embedded data buffer associated with this
+	 * descriptor. This address acts as the destination address for the DMA
+	 * payload transfer
+	 */
+	u32 dest;
+	/// Complete length of the buffer in memory
+	u16 length;
+	/// Control word for the DMA engine (e.g. for interrupt generation)
+	u16 ctrl;
+	/// Pointer to the next element of the chained list
+	u32 next;
+};
+
+// Comes from la.h
+/// Length of the configuration data of a logic analyzer
+#define LA_CONF_LEN 10
+
+/// Structure containing the configuration data of a logic analyzer
+struct la_conf_tag {
+	u32 conf[LA_CONF_LEN];
+	u32 trace_len;
+	u32 diag_conf;
+};
+
+/// Size of a logic analyzer memory
+#define LA_MEM_LEN (1024 * 1024)
+
+/// Type of errors
+enum {
+	/// Recoverable error, not requiring any action from Upper MAC
+	DBG_ERROR_RECOVERABLE =3D 0,
+	/// Fatal error, requiring Upper MAC to reset Lower MAC and HW and restar=
t
+	/// operation
+	DBG_ERROR_FATAL
+};
+
+/// Maximum length of the SW diag trace
+#define DBG_SW_DIAG_MAX_LEN 1024
+
+/// Maximum length of the error trace
+#define DBG_ERROR_TRACE_SIZE 256
+
+/// Number of MAC diagnostic port banks
+#define DBG_DIAGS_MAC_MAX 48
+
+/// Number of PHY diagnostic port banks
+#define DBG_DIAGS_PHY_MAX 32
+
+/// Maximum size of the RX header descriptor information in the debug dump
+#define DBG_RHD_MEM_LEN (5 * 1024)
+
+/// Maximum size of the RX buffer descriptor information in the debug dump
+#define DBG_RBD_MEM_LEN (5 * 1024)
+
+/// Maximum size of the TX header descriptor information in the debug dump
+#define DBG_THD_MEM_LEN (10 * 1024)
+
+/// Structure containing the information about the PHY channel that is use=
d
+struct phy_channel_info {
+	/// PHY channel information 1
+	u32 info1;
+	/// PHY channel information 2
+	u32 info2;
+};
+
+/// Debug information forwarded to host when an error occurs
+struct dbg_debug_info_tag {
+	/// Type of error (0: recoverable, 1: fatal)
+	u32 error_type;
+	/// Pointer to the first RX Header Descriptor chained to the MAC HW
+	u32 rhd;
+	/// Size of the RX header descriptor buffer
+	u32 rhd_len;
+	/// Pointer to the first RX Buffer Descriptor chained to the MAC HW
+	u32 rbd;
+	/// Size of the RX buffer descriptor buffer
+	u32 rbd_len;
+	/// Pointer to the first TX Header Descriptors chained to the MAC HW
+	u32 thd[NX_TXQ_CNT];
+	/// Size of the TX header descriptor buffer
+	u32 thd_len[NX_TXQ_CNT];
+	/// MAC HW diag configuration
+	u32 hw_diag;
+	/// Error message
+	u32 error[DBG_ERROR_TRACE_SIZE / 4];
+	/// SW diag configuration length
+	u32 sw_diag_len;
+	/// SW diag configuration
+	u32 sw_diag[DBG_SW_DIAG_MAX_LEN / 4];
+	/// PHY channel information
+	struct phy_channel_info chan_info;
+	/// Embedded LA configuration
+	struct la_conf_tag la_conf;
+	/// MAC diagnostic port state
+	u16 diags_mac[DBG_DIAGS_MAC_MAX];
+	/// PHY diagnostic port state
+	u16 diags_phy[DBG_DIAGS_PHY_MAX];
+	/// MAC HW RX Header descriptor pointer
+	u32 rhd_hw_ptr;
+	/// MAC HW RX Buffer descriptor pointer
+	u32 rbd_hw_ptr;
+};
+
+/// Full debug dump that is forwarded to host in case of error
+struct dbg_debug_dump_tag {
+	/// Debug information
+	struct dbg_debug_info_tag dbg_info;
+
+	/// RX header descriptor memory
+	u32 rhd_mem[DBG_RHD_MEM_LEN / 4];
+
+	/// RX buffer descriptor memory
+	u32 rbd_mem[DBG_RBD_MEM_LEN / 4];
+
+	/// TX header descriptor memory
+	u32 thd_mem[NX_TXQ_CNT][DBG_THD_MEM_LEN / 4];
+
+	/// Logic analyzer memory
+	u32 la_mem[LA_MEM_LEN / 4];
+};
+
+/// Number of pulses in a radar event structure
+#define RADAR_PULSE_MAX 4
+
+/// Definition of an array of radar pulses
+struct radar_pulse_array_desc {
+	/// Buffer containing the radar pulses
+	u32 pulse[RADAR_PULSE_MAX];
+	/// Index of the radar detection chain that detected those pulses
+	u32 idx;
+	/// Number of valid pulses in the buffer
+	u32 cnt;
+};
+
+/// Bit mapping inside a radar pulse element
+struct radar_pulse {
+	s32
+		freq : 6;  /** Freq (resolution is 2Mhz range is [-Fadc/4 .. Fadc/4]) */
+	u32 fom : 4; /** Figure of Merit */
+	u32 len : 6; /** Length of the current radar pulse (resolution is 2us) */
+	u32 rep : 16; /* Time interval between previous and current event (in us)=
 */
+};
+
+/// Definition of a RX vector descriptor
+struct rx_vector_desc {
+	/// PHY channel information
+	struct phy_channel_info phy_info;
+
+	/// RX vector 1
+	u32 rx_vect1[IPC_RXVEC_SIZE / 4];
+
+	/// Used to print a valid rx vector
+	u32 pattern;
+};
+
+///
+struct rxdesc_tag {
+	/// Host Buffer Address
+	u32 host_id;
+	/// Length
+	u32 frame_len;
+	/// Status
+	u16 status;
+};
+
+/*
+ *************************************************************************=
***************
+ * @addtogroup IPC_TX IPC Tx path
+ *  @ingroup IPC
+ *  @brief IPC Tx path structures and functions
+ *
+ * A typical use case of the IPC Tx path API:
+ * @msc
+ * hscale =3D "2";
+ *
+ * a [label=3DDriver],
+ * b [label=3D"IPC host"],
+ * c [label=3D"IPC emb"],
+ * d [label=3DFirmware];
+ *
+ * ---   [label=3D"Tx descriptor queue example"];
+ * a=3D>a  [label=3D"Driver receives a Tx packet from OS"];
+ * a=3D>b  [label=3D"ipc_host_txdesc_get()"];
+ * a<<b  [label=3D"struct txdesc_host *"];
+ * a=3D>a  [label=3D"Driver fill the descriptor"];
+ * a=3D>b  [label=3D"ipc_host_txdesc_push()"];
+ * ...   [label=3D"(several Tx desc can be pushed)"];
+ * b:>c  [label=3D"Tx desc queue filled IRQ"];
+ * c=3D>>d [label=3D"EDCA sub-scheduler callback"];
+ * c<<d  [label=3D"Tx desc queue to pop"];
+ * c=3D>>d [label=3D"UMAC Tx desc callback"];
+ * ...   [label=3D"(several Tx desc can be popped)"];
+ * d=3D>d  [label=3D"Packets are sent or discarded"];
+ * ---   [label=3D"Tx confirm queue example"];
+ * c<=3Dd  [label=3D"ipc_emb_txcfm_push()"];
+ * c>>d  [label=3D"Request accepted"];
+ * ...   [label=3D"(several Tx cfm can be pushed)"];
+ * b<:c  [label=3D"Tx cfm queue filled IRQ"];
+ * a<<=3Db [label=3D"Driver's Tx Confirm callback"];
+ * a=3D>b  [label=3D"ipc_host_txcfm_pop()"];
+ * a<<b  [label=3D"struct ipc_txcfm"];
+ * a<=3Da  [label=3D"Packets are freed by the driver"];
+ * @endmsc
+ *
+ * @{
+ *************************************************************************=
***************
+ */
+
+/// @} IPC_TX
+
+/*
+ *************************************************************************=
***************
+ *  @defgroup IPC_RX IPC Rx path
+ *  @ingroup IPC
+ *  @brief IPC Rx path functions and structures
+ *
+ * A typical use case of the IPC Rx path API:
+ * @msc
+ * hscale =3D "2";
+ *
+ * a [label=3DFirmware],
+ * b [label=3D"IPC emb"],
+ * c [label=3D"IPC host"],
+ * d [label=3DDriver];
+ *
+ * ---   [label=3D"Rx buffer and desc queues usage example"];
+ * d=3D>c  [label=3D"ipc_host_rxbuf_push()"];
+ * d=3D>c  [label=3D"ipc_host_rxbuf_push()"];
+ * d=3D>c  [label=3D"ipc_host_rxbuf_push()"];
+ * ...   [label=3D"(several Rx buffer are pushed)"];
+ * a=3D>a  [label=3D" Frame is received\n from the medium"];
+ * a<<b  [label=3D"struct ipc_rxbuf"];
+ * a=3D>a  [label=3D" Firmware fill the buffer\n with received frame"];
+ * a<<b  [label=3D"Push accepted"];
+ * ...   [label=3D"(several Rx desc can be pushed)"];
+ * b:>c  [label=3D"Rx desc queue filled IRQ"];
+ * c=3D>>d [label=3D"Driver Rx packet callback"];
+ * c<=3Dd  [label=3D"ipc_host_rxdesc_pop()"];
+ * d=3D>d  [label=3D"Rx packet is handed\nover to the OS "];
+ * ...   [label=3D"(several Rx desc can be poped)"];
+ * ---   [label=3D"Rx buffer request exemple"];
+ * b:>c  [label=3D"Low Rx buffer count IRQ"];
+ * a<<b  [label=3D"struct ipc_rxbuf"];
+ * c=3D>>d [label=3D"Driver Rx buffer callback"];
+ * d=3D>c  [label=3D"ipc_host_rxbuf_push()"];
+ * d=3D>c  [label=3D"ipc_host_rxbuf_push()"];
+ * d=3D>c  [label=3D"ipc_host_rxbuf_push()"];
+ * ...   [label=3D"(several Rx buffer are pushed)"];
+ * @endmsc
+ *
+ * @addtogroup IPC_RX
+ * @{
+ *************************************************************************=
***************
+ */
+
+/// @} IPC_RX
+
+/*
+ *************************************************************************=
***************
+ *  @defgroup IPC_MISC IPC Misc
+ *  @ingroup IPC
+ *  @brief IPC miscellaneous functions
+ *************************************************************************=
***************
+ */
+/** IPC header structure.  This structure is stored at the beginning of ev=
ery
+ * IPC message.
+ * @warning This structure's size must NOT exceed 4 bytes in length.
+ */
+struct ipc_header {
+	/// IPC message type.
+	u16 type;
+	/// IPC message size in number of bytes.
+	u16 size;
+};
+
+struct ipc_msg_elt {
+	/// Message header (alignment forced on word size, see allocation in shar=
ed
+	/// env).
+	struct ipc_header header __aligned(4);
+};
+
+/// Message structure for MSGs from Emb to App
+struct ipc_e2a_msg {
+	u16 id; ///< Message id.
+	u16 dummy_dest_id;
+	u16 dummy_src_id;
+	u16 param_len;                     ///< Parameter embedded struct length.
+	u32 pattern;                       ///< Used to stamp a valid MSG buffer
+	u32 param[IPC_E2A_MSG_PARAM_SIZE]; ///< Parameter embedded struct. Must b=
e
+										 ///< word-aligned.
+};
+
+/// Message structure for Debug messages from Emb to App
+struct ipc_dbg_msg {
+	u32 string[IPC_DBG_PARAM_SIZE / 4]; ///< Debug string
+	u32 pattern;                        ///< Used to stamp a valid buffer
+};
+
+/// Message structure for MSGs from App to Emb.
+/// Actually a sub-structure will be used when filling the messages.
+struct ipc_a2e_msg {
+	u32 dummy_word; // used to cope with kernel message structure
+	u32 msg[IPC_A2E_MSG_BUF_SIZE]; // body of the msg
+};
+
+struct ipc_shared_rx_buf {
+	/// < ptr to hostbuf client (ipc_host client) structure
+	u32 hostid;
+	/// < ptr to real hostbuf dma address
+	u32 dma_addr;
+};
+
+struct ipc_shared_rx_desc {
+	/// DMA Address
+	u32 dma_addr;
+};
+
+/// Structure containing FW characteristics for compatibility checking
+struct compatibility_tag {
+	/// Size of IPC shared memory
+	u16 ipc_shared_size;
+	/// Message struct/ID API version
+	u16 msg_api;
+	/// Version of IPC shared
+	u8 ipc_shared_version;
+	/// Number of host buffers available for Emb->App MSGs sending
+	u8 msge2a_buf_cnt;
+	/// Number of host buffers available for Debug Messages sending
+	u8 dbgbuf_cnt;
+	/// Number of host buffers available for Radar events handling
+	u8 radarbuf_cnt;
+	/// Number of host buffers available for unsupported Rx vectors handling
+	u8 unsuprxvecbuf_cnt;
+	/// Number of shared descriptors available for Data RX handling
+	u8 rxdesc_cnt;
+	/// Number of host buffers available for Data Rx handling
+	u8 rxbuf_cnt;
+	/// Number of descriptors in BK TX queue (power of 2, min 4, max 64)
+	u8 bk_txq;
+	/// Number of descriptors in BE TX queue (power of 2, min 4, max 64)
+	u8 be_txq;
+	/// Number of descriptors in VI TX queue (power of 2, min 4, max 64)
+	u8 vi_txq;
+	/// Number of descriptors in VO TX queue (power of 2, min 4, max 64)
+	u8 vo_txq;
+	/// Number of descriptors in BCN TX queue (power of 2, min 4, max 64)
+	u8 bcn_txq;
+};
+
+/*
+ * TYPE and STRUCT DEFINITIONS
+ *************************************************************************=
***************
+ */
+
+// Indexes are defined in the MIB shared structure
+struct ipc_shared_env_tag {
+	struct compatibility_tag comp_info; // FW characteristics
+
+	struct ipc_a2e_msg
+		msg_a2e_buf; // room for MSG to be sent from App to Emb
+
+	// Fields for MSGs sending from Emb to App
+	struct ipc_e2a_msg
+		msg_e2a_buf; // room to build the MSG to be DMA Xferred
+	struct dma_desc
+		msg_dma_desc; // DMA descriptor for Emb->App MSGs Xfers
+	u32 msg_e2a_hostbuf_addr[IPC_MSGE2A_BUF_CNT]; // buffers @ for DMA Xfers
+
+	// Fields for Debug MSGs sending from Emb to App
+	struct ipc_dbg_msg
+		dbg_buf; // room to build the MSG to be DMA Xferred
+	struct dma_desc
+		dbg_dma_desc; // DMA descriptor for Emb->App MSGs Xfers
+	u32 dbg_hostbuf_addr[IPC_DBGBUF_CNT]; // buffers @ for MSGs DMA Xfers
+	u32 la_dbginfo_addr; // Host buffer address for the debug information
+	u32 pattern_addr;
+
+	u32 radarbuf_hostbuf[IPC_RADARBUF_CNT]; // buffers @ for Radar Events
+	u32 unsuprxvecbuf_hostbuf[IPC_UNSUPRXVECBUF_CNT]; // buffers @ for
+	// unsupported Rx vectors
+	struct txdesc_host txdesc0[NX_USER_MAX][NX_TXDESC_CNT0];
+	struct txdesc_host txdesc1[NX_USER_MAX][NX_TXDESC_CNT1];
+	struct txdesc_host txdesc2[NX_USER_MAX][NX_TXDESC_CNT2];
+	struct txdesc_host txdesc3[NX_USER_MAX][NX_TXDESC_CNT3];
+#if NX_TXQ_CNT =3D=3D 5
+	struct txdesc_host txdesc4[1][NX_TXDESC_CNT4];
+#endif
+#ifdef CONFIG_AICWF_FULLMAC
+	// RX Descriptors Array
+	struct ipc_shared_rx_desc host_rxdesc[IPC_RXDESC_CNT];
+	// RX Buffers Array
+	struct ipc_shared_rx_buf host_rxbuf[IPC_RXBUF_CNT];
+#else
+	// buffers @ for Data Rx
+	u32 host_rxbuf[IPC_RXBUF_CNT];
+#endif /* CONFIG_AICWF_FULLMAC */
+
+	u32 buffered[NX_REMOTE_STA_MAX][TID_MAX];
+
+	u16 trace_pattern;
+	u32 trace_start;
+	u32 trace_end;
+	u32 trace_size;
+	u32 trace_offset;
+	u32 trace_nb_compo;
+	u32 trace_offset_compo;
+};
+
+extern struct ipc_shared_env_tag ipc_shared_env;
+
+/*
+ * TYPE and STRUCT DEFINITIONS
+ *************************************************************************=
***************
+ */
+
+// IRQs from app to emb
+/// Interrupts bits used for the TX descriptors of the AC queues
+#ifdef CONFIG_AICWF_MUMIMO_TX
+/// Interrupts bits used
+#if NX_USER_MAX > 3
+#define IPC_IRQ_A2E_USER_MSK 0xF
+#elif NX_USER_MAX > 2
+#define IPC_IRQ_A2E_USER_MSK 0x7
+#else
+#define IPC_IRQ_A2E_USER_MSK 0x3
+#endif
+
+/// Offset of the interrupts for AC0
+#define IPC_IRQ_A2E_AC0_OFT 8
+/// Mask of the interrupts for AC0
+#define IPC_IRQ_A2E_AC0_MSK (IPC_IRQ_A2E_USER_MSK << IPC_IRQ_A2E_AC0_OFT)
+/// Offset of the interrupts for AC1
+#define IPC_IRQ_A2E_AC1_OFT (IPC_IRQ_A2E_AC0_OFT + NX_USER_MAX)
+/// Mask of the interrupts for AC1
+#define IPC_IRQ_A2E_AC1_MSK (IPC_IRQ_A2E_USER_MSK << IPC_IRQ_A2E_AC1_OFT)
+/// Offset of the interrupts for AC2
+#define IPC_IRQ_A2E_AC2_OFT (IPC_IRQ_A2E_AC1_OFT + NX_USER_MAX)
+/// Mask of the interrupts for AC2
+#define IPC_IRQ_A2E_AC2_MSK (IPC_IRQ_A2E_USER_MSK << IPC_IRQ_A2E_AC2_OFT)
+/// Offset of the interrupts for AC3
+#define IPC_IRQ_A2E_AC3_OFT (IPC_IRQ_A2E_AC2_OFT + NX_USER_MAX)
+/// Mask of the interrupts for AC3
+#define IPC_IRQ_A2E_AC3_MSK (IPC_IRQ_A2E_USER_MSK << IPC_IRQ_A2E_AC3_OFT)
+/// Offset of the interrupts for BCN
+#define IPC_IRQ_A2E_BCN_OFT (IPC_IRQ_A2E_AC3_OFT + NX_USER_MAX)
+/// Mask of the interrupts for BCN
+#define IPC_IRQ_A2E_BCN_MSK CO_BIT(IPC_IRQ_A2E_BCN_OFT)
+
+#define IPC_IRQ_A2E_AC_TXDESC                                             =
     \
+	(IPC_IRQ_A2E_AC0_MSK | IPC_IRQ_A2E_AC1_MSK | IPC_IRQ_A2E_AC2_MSK |       =
  \
+	 IPC_IRQ_A2E_AC3_MSK)
+
+/// Interrupts bits used for the TX descriptors of the BCN queue
+#if NX_TXQ_CNT < 5
+#define IPC_IRQ_A2E_BCN_TXDESC 0
+#else
+#define IPC_IRQ_A2E_BCN_TXDESC (0x01 << IPC_IRQ_A2E_BCN_OFT)
+#endif
+
+/// IPC TX descriptor interrupt mask
+#define IPC_IRQ_A2E_TXDESC (IPC_IRQ_A2E_AC_TXDESC | IPC_IRQ_A2E_BCN_TXDESC=
)
+#else
+/// IPC TX descriptor interrupt mask
+#define IPC_IRQ_A2E_TXDESC 0xFF00
+#endif
+
+#define IPC_IRQ_A2E_TXDESC_FIRSTBIT (8)
+#define IPC_IRQ_A2E_RXBUF_BACK      CO_BIT(5)
+#define IPC_IRQ_A2E_RXDESC_BACK     CO_BIT(4)
+
+#define IPC_IRQ_A2E_MSG CO_BIT(1)
+#define IPC_IRQ_A2E_DBG CO_BIT(0)
+
+#define IPC_IRQ_A2E_ALL (IPC_IRQ_A2E_TXDESC | IPC_IRQ_A2E_MSG | IPC_IRQ_A2=
E_DBG)
+
+// IRQs from emb to app
+#define IPC_IRQ_E2A_TXCFM_POS 7
+
+#ifdef CONFIG_AICWF_MUMIMO_TX
+/// Interrupts bits used
+#if NX_USER_MAX > 3
+#define IPC_IRQ_E2A_USER_MSK 0xF
+#elif NX_USER_MAX > 2
+#define IPC_IRQ_E2A_USER_MSK 0x7
+#else
+#define IPC_IRQ_E2A_USER_MSK 0x3
+#endif
+
+/// Offset of the interrupts for AC0
+#define IPC_IRQ_E2A_AC0_OFT IPC_IRQ_E2A_TXCFM_POS
+/// Mask of the interrupts for AC0
+#define IPC_IRQ_E2A_AC0_MSK (IPC_IRQ_E2A_USER_MSK << IPC_IRQ_E2A_AC0_OFT)
+/// Offset of the interrupts for AC1
+#define IPC_IRQ_E2A_AC1_OFT (IPC_IRQ_E2A_AC0_OFT + NX_USER_MAX)
+/// Mask of the interrupts for AC1
+#define IPC_IRQ_E2A_AC1_MSK (IPC_IRQ_E2A_USER_MSK << IPC_IRQ_E2A_AC1_OFT)
+/// Offset of the interrupts for AC2
+#define IPC_IRQ_E2A_AC2_OFT (IPC_IRQ_E2A_AC1_OFT + NX_USER_MAX)
+/// Mask of the interrupts for AC2
+#define IPC_IRQ_E2A_AC2_MSK (IPC_IRQ_E2A_USER_MSK << IPC_IRQ_E2A_AC2_OFT)
+/// Offset of the interrupts for AC3
+#define IPC_IRQ_E2A_AC3_OFT (IPC_IRQ_E2A_AC2_OFT + NX_USER_MAX)
+/// Mask of the interrupts for AC3
+#define IPC_IRQ_E2A_AC3_MSK (IPC_IRQ_E2A_USER_MSK << IPC_IRQ_E2A_AC3_OFT)
+/// Offset of the interrupts for BCN
+#define IPC_IRQ_E2A_BCN_OFT (IPC_IRQ_E2A_AC3_OFT + NX_USER_MAX)
+/// Mask of the interrupts for BCN
+#define IPC_IRQ_E2A_BCN_MSK CO_BIT(IPC_IRQ_E2A_BCN_OFT)
+
+#define IPC_IRQ_E2A_AC_TXCFM                                              =
     \
+	(IPC_IRQ_E2A_AC0_MSK | IPC_IRQ_E2A_AC1_MSK | IPC_IRQ_E2A_AC2_MSK |       =
  \
+	 IPC_IRQ_E2A_AC3_MSK)
+
+/// Interrupts bits used for the TX descriptors of the BCN queue
+#if NX_TXQ_CNT < 5
+#define IPC_IRQ_E2A_BCN_TXCFM 0
+#else
+#define IPC_IRQ_E2A_BCN_TXCFM (0x01 << IPC_IRQ_E2A_BCN_OFT)
+#endif
+
+/// IPC TX descriptor interrupt mask
+#define IPC_IRQ_E2A_TXCFM (IPC_IRQ_E2A_AC_TXCFM | IPC_IRQ_E2A_BCN_TXCFM)
+
+#else
+
+#define IPC_IRQ_E2A_TXCFM (((1 << NX_TXQ_CNT) - 1) << IPC_IRQ_E2A_TXCFM_PO=
S)
+
+#endif /* CONFIG_AICWF_MUMIMO_TX */
+
+#define IPC_IRQ_E2A_UNSUP_RX_VEC CO_BIT(7)
+#define IPC_IRQ_E2A_RADAR        CO_BIT(6)
+#define IPC_IRQ_E2A_TBTT_SEC     CO_BIT(5)
+#define IPC_IRQ_E2A_TBTT_PRIM    CO_BIT(4)
+#define IPC_IRQ_E2A_RXDESC       CO_BIT(3)
+#define IPC_IRQ_E2A_MSG_ACK      CO_BIT(2)
+#define IPC_IRQ_E2A_MSG          CO_BIT(1)
+#define IPC_IRQ_E2A_DBG          CO_BIT(0)
+
+#define IPC_IRQ_E2A_ALL                                                   =
     \
+	(IPC_IRQ_E2A_TXCFM | IPC_IRQ_E2A_RXDESC | IPC_IRQ_E2A_MSG_ACK |          =
  \
+	 IPC_IRQ_E2A_MSG | IPC_IRQ_E2A_DBG | IPC_IRQ_E2A_TBTT_PRIM |             =
  \
+	 IPC_IRQ_E2A_TBTT_SEC | IPC_IRQ_E2A_RADAR | IPC_IRQ_E2A_UNSUP_RX_VEC)
+
+// FLAGS for RX desc
+#define IPC_RX_FORWARD  CO_BIT(1)
+#define IPC_RX_INTRABSS CO_BIT(0)
+
+// IPC message TYPE
+enum {
+	IPC_MSG_NONE =3D 0,
+	IPC_MSG_WRAP,
+	IPC_MSG_KMSG,
+
+	IPC_DBG_STRING,
+
+};
+
+#endif // _IPC_SHARED_H_
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/lmac_mac.h b/drivers/net=
/wireless/aic/aic8800_fdrv/lmac_mac.h
new file mode 100644
index 000000000000..114ed14f4ad5
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/lmac_mac.h
@@ -0,0 +1,437 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *************************************************************************=
***************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief MAC related definitions.
+ *
+ * Adapted from mac_types.h to used lmac_types.h instead of standard types
+ * eg: perl -pi -e '$_ =3D~ s/uint(\d{1,2})_t/u$1_l/g; \
+ *                  $_ =3D~ s/int(\d{1,2})_t/s$1_l/g; \
+ *                  $_ =3D~ s/CO_BIT/BIT/g;'
+ *
+ *************************************************************************=
***************
+ */
+
+#ifndef LMAC_MAC_H_
+#define LMAC_MAC_H_
+
+#include "lmac_types.h"
+
+/// Interface types
+enum mac_vif_type {
+	/// ESS STA interface
+	VIF_STA,
+	/// IBSS STA interface
+	VIF_IBSS,
+	/// AP interface
+	VIF_AP,
+	/// Mesh Point interface
+	VIF_MESH_POINT,
+	/// Monitor interface
+	VIF_MONITOR,
+	/// Unknown type
+	VIF_UNKNOWN
+};
+
+/// MAC address length in bytes.
+#define MAC_ADDR_LEN 6
+
+/// MAC address structure.
+struct mac_addr {
+	/// Array of 16-bit words that make up the MAC address.
+	u16 array[MAC_ADDR_LEN / 2];
+};
+
+/// SSID maximum length.
+#define MAC_SSID_LEN 32
+
+/// SSID.
+struct mac_ssid {
+	/// Actual length of the SSID.
+	u8 length;
+	/// Array containing the SSID name.
+	u8 array[MAC_SSID_LEN];
+};
+
+/// BSS type
+enum mac_bss_type {
+	INFRASTRUCTURE_MODE =3D 1,
+	INDEPENDENT_BSS_MODE,
+	ANY_BSS_MODE
+};
+
+/// Channel Band
+enum mac_chan_band {
+	/// 2.4GHz Band
+	PHY_BAND_2G4,
+	/// 5GHz band
+	PHY_BAND_5G,
+	/// Number of bands
+	PHY_BAND_MAX,
+};
+
+/// Operating Channel Bandwidth
+enum mac_chan_bandwidth {
+	/// 20MHz BW
+	PHY_CHNL_BW_20,
+	/// 40MHz BW
+	PHY_CHNL_BW_40,
+	/// 80MHz BW
+	PHY_CHNL_BW_80,
+	/// 160MHz BW
+	PHY_CHNL_BW_160,
+	/// 80+80MHz BW
+	PHY_CHNL_BW_80P80,
+	/// Reserved BW
+	PHY_CHNL_BW_OTHER,
+};
+
+/// max number of channels in the 2.4 GHZ band
+#define MAC_DOMAINCHANNEL_24G_MAX 14
+
+/// max number of channels in the 5 GHZ band
+#define MAC_DOMAINCHANNEL_5G_MAX 28
+
+/// Channel Flag
+enum mac_chan_flags {
+	/// Cannot initiate radiation on this channel
+	CHAN_NO_IR =3D BIT(0),
+	/// Channel is not allowed
+	CHAN_DISABLED =3D BIT(1),
+	/// Radar detection required on this channel
+	CHAN_RADAR =3D BIT(2),
+};
+
+/// Primary Channel definition
+struct mac_chan_def {
+	/// Frequency of the channel (in MHz)
+	u16 freq;
+	/// RF band (@ref mac_chan_band)
+	u8 band;
+	/// Additional information (@ref mac_chan_flags)
+	u8 flags;
+	/// Max transmit power allowed on this channel (dBm)
+	s8 tx_power;
+};
+
+/// Operating Channel
+struct mac_chan_op {
+	/// Band (@ref mac_chan_band)
+	u8 band;
+	/// Channel type (@ref mac_chan_bandwidth)
+	u8 type;
+	/// Frequency for Primary 20MHz channel (in MHz)
+	u16 prim20_freq;
+	/// Frequency center of the contiguous channel or center of Primary 80+80
+	/// (in MHz)
+	u16 center1_freq;
+	/// Frequency center of the non-contiguous secondary 80+80 (in MHz)
+	u16 center2_freq;
+	/// Max transmit power allowed on this channel (dBm)
+	s8 tx_power;
+	/// Additional information (@ref mac_chan_flags)
+	u8 flags;
+};
+
+/// Cipher suites (order is important as it is used by MACHW)
+enum mac_cipher_suite {
+	/// 00-0F-AC 1
+	MAC_CIPHER_WEP40 =3D 0,
+	/// 00-0F-AC 2
+	MAC_CIPHER_TKIP =3D 1,
+	/// 00-0F-AC 4
+	MAC_CIPHER_CCMP =3D 2,
+	/// 00-0F-AC 5
+	MAC_CIPHER_WEP104 =3D 3,
+	/// 00-14-72 1
+	MAC_CIPHER_WPI_SMS4 =3D 4,
+	/// 00-0F-AC 6  (aka AES_CMAC)
+	MAC_CIPHER_BIP_CMAC_128 =3D 5,
+
+	// following cipher are not supported by MACHW
+	/// 00-0F-AC 08
+	MAC_CIPHER_GCMP_128,
+	/// 00-0F-AC 09
+	MAC_CIPHER_GCMP_256,
+	/// 00-0F-AC 10
+	MAC_CIPHER_CCMP_256,
+	/// 00-0F-AC 11
+	MAC_CIPHER_BIP_GMAC_128,
+	/// 00-0F-AC 12
+	MAC_CIPHER_BIP_GMAC_256,
+	/// 00-0F-AC 13
+	MAC_CIPHER_BIP_CMAC_256,
+
+	MAC_CIPHER_INVALID =3D 0xFF
+};
+
+/// Authentication and Key Management suite
+enum mac_akm_suite {
+	/// No security
+	MAC_AKM_NONE,
+	/// Pre RSN (WEP or WPA)
+	MAC_AKM_PRE_RSN,
+	/// 00-0F-AC 1
+	MAC_AKM_8021X,
+	/// 00-0F-AC 2
+	MAC_AKM_PSK,
+	/// 00-0F-AC 3
+	MAC_AKM_FT_8021X,
+	/// 00-0F-AC 4
+	MAC_AKM_FT_PSK,
+	/// 00-0F-AC 5
+	MAC_AKM_8021X_SHA256,
+	/// 00-0F-AC 6
+	MAC_AKM_PSK_SHA256,
+	/// 00-0F-AC 7
+	MAC_AKM_TDLS,
+	/// 00-0F-AC 8
+	MAC_AKM_SAE,
+	/// 00-0F-AC 9
+	MAC_AKM_FT_OVER_SAE,
+	/// 00-0F-AC 11
+	MAC_AKM_8021X_SUITE_B,
+	/// 00-0F-AC 12
+	MAC_AKM_8021X_SUITE_B_192,
+	/// 00-0F-AC 14
+	MAC_AKM_FILS_SHA256,
+	/// 00-0F-AC 15
+	MAC_AKM_FILS_SHA384,
+	/// 00-0F-AC 16
+	MAC_AKM_FT_FILS_SHA256,
+	/// 00-0F-AC 17
+	MAC_AKM_FT_FILS_SHA384,
+	/// 00-0F-AC 18
+	MAC_AKM_OWE,
+
+	/// 00-14-72 1
+	MAC_AKM_WAPI_CERT,
+	/// 00-14-72 2
+	MAC_AKM_WAPI_PSK,
+};
+
+/// Scan result element, parsed from beacon or probe response frames.
+struct mac_scan_result {
+	/// Scan result is valid
+	bool valid_flag;
+	/// Network BSSID.
+	struct mac_addr bssid;
+	/// Network name.
+	struct mac_ssid ssid;
+	/// Network type (@ref mac_bss_type).
+	u16 bsstype;
+	/// Network channel.
+	struct mac_chan_def *chan;
+	/// Network beacon period (in TU).
+	u16 beacon_period;
+	/// Capability information
+	u16 cap_info;
+	/// Supported AKM (bit-field of @ref mac_akm_suite)
+	u32 akm;
+	/// Group cipher (bit-field of @ref mac_cipher_suite)
+	u16 group_cipher;
+	/// Group cipher (bit-field of @ref mac_cipher_suite)
+	u16 pairwise_cipher;
+	/// RSSI of the scanned BSS (in dBm)
+	s8 rssi;
+};
+
+/// Legacy rate 802.11 definitions
+enum mac_legacy_rates {
+	/// DSSS/CCK 1Mbps
+	MAC_RATE_1MBPS =3D 2,
+	/// DSSS/CCK 2Mbps
+	MAC_RATE_2MBPS =3D 4,
+	/// DSSS/CCK 5.5Mbps
+	MAC_RATE_5_5MBPS =3D 11,
+	/// OFDM 6Mbps
+	MAC_RATE_6MBPS =3D 12,
+	/// OFDM 9Mbps
+	MAC_RATE_9MBPS =3D 18,
+	/// DSSS/CCK 11Mbps
+	MAC_RATE_11MBPS =3D 22,
+	/// OFDM 12Mbps
+	MAC_RATE_12MBPS =3D 24,
+	/// OFDM 18Mbps
+	MAC_RATE_18MBPS =3D 36,
+	/// OFDM 24Mbps
+	MAC_RATE_24MBPS =3D 48,
+	/// OFDM 36Mbps
+	MAC_RATE_36MBPS =3D 72,
+	/// OFDM 48Mbps
+	MAC_RATE_48MBPS =3D 96,
+	/// OFDM 54Mbps
+	MAC_RATE_54MBPS =3D 108
+};
+
+/// BSS Membership Selector definitions
+enum mac_bss_membership {
+	/// HT PHY
+	MAC_BSS_MEMBERSHIP_HT_PHY =3D 127,
+	/// VHT PHY
+	MAC_BSS_MEMBERSHIP_VHT_PHY =3D 126,
+};
+
+/// MAC rateset maximum length
+#define MAC_RATESET_LEN 12
+
+/// Structure containing the legacy rateset of a station
+struct mac_rateset {
+	/// Number of legacy rates supported
+	u8 length;
+	/// Array of legacy rates
+	u8 array[MAC_RATESET_LEN];
+};
+
+/// MAC Security Key maximum length
+#define MAC_SEC_KEY_LEN 32 // TKIP keys 256 bits (max length) with MIC key=
s
+
+/// Structure defining a security key
+struct mac_sec_key {
+	/// Key material length
+	u8 length;
+	/// Key material
+	u32 array[MAC_SEC_KEY_LEN / 4];
+};
+
+/// Access Category enumeration
+enum mac_ac {
+	/// Background
+	AC_BK =3D 0,
+	/// Best-effort
+	AC_BE,
+	/// Video
+	AC_VI,
+	/// Voice
+	AC_VO,
+	/// Number of access categories
+	AC_MAX
+};
+
+/// Traffic ID enumeration
+enum mac_tid {
+	/// TID_0. Mapped to @ref AC_BE as per 802.11 standard.
+	TID_0,
+	/// TID_1. Mapped to @ref AC_BK as per 802.11 standard.
+	TID_1,
+	/// TID_2. Mapped to @ref AC_BK as per 802.11 standard.
+	TID_2,
+	/// TID_3. Mapped to @ref AC_BE as per 802.11 standard.
+	TID_3,
+	/// TID_4. Mapped to @ref AC_VI as per 802.11 standard.
+	TID_4,
+	/// TID_5. Mapped to @ref AC_VI as per 802.11 standard.
+	TID_5,
+	/// TID_6. Mapped to @ref AC_VO as per 802.11 standard.
+	TID_6,
+	/// TID_7. Mapped to @ref AC_VO as per 802.11 standard.
+	TID_7,
+	/// Non standard Management TID used internally
+	TID_MGT,
+	/// Number of TID supported
+	TID_MAX
+};
+
+/// MCS bitfield maximum size (in bytes)
+#define MAX_MCS_LEN 16 // 16 * 8 =3D 128
+
+/// MAC HT capability information element
+struct mac_htcapability {
+	/// HT capability information
+	__le16 ht_capa_info;
+	/// A-MPDU parameters
+	u8 a_mpdu_param;
+	/// Supported MCS
+	u8 mcs_rate[MAX_MCS_LEN];
+	/// HT extended capability information
+	__le16 ht_extended_capa;
+	/// Beamforming capability information
+	__le32 tx_beamforming_capa;
+	/// Antenna selection capability information
+	u8 asel_capa;
+};
+
+/// MAC VHT capability information element
+struct mac_vhtcapability {
+	/// VHT capability information
+	__le32 vht_capa_info;
+	/// RX MCS map
+	__le16 rx_mcs_map;
+	/// RX highest data rate
+	__le16 rx_highest;
+	/// TX MCS map
+	__le16 tx_mcs_map;
+	/// TX highest data rate
+	__le16 tx_highest;
+};
+
+/// Length (in bytes) of the MAC HE capability field
+#define MAC_HE_MAC_CAPA_LEN      6
+/// Length (in bytes) of the PHY HE capability field
+#define MAC_HE_PHY_CAPA_LEN      11
+/// Maximum length (in bytes) of the PPE threshold data
+#define MAC_HE_PPE_THRES_MAX_LEN 25
+
+/// Structure listing the per-NSS, per-BW supported MCS combinations
+struct mac_he_mcs_nss_supp {
+	/// per-NSS supported MCS in RX, for BW <=3D 80MHz
+	__le16 rx_mcs_80;
+	/// per-NSS supported MCS in TX, for BW <=3D 80MHz
+	__le16 tx_mcs_80;
+	/// per-NSS supported MCS in RX, for BW =3D 160MHz
+	__le16 rx_mcs_160;
+	/// per-NSS supported MCS in TX, for BW =3D 160MHz
+	__le16 tx_mcs_160;
+	/// per-NSS supported MCS in RX, for BW =3D 80+80MHz
+	__le16 rx_mcs_80p80;
+	/// per-NSS supported MCS in TX, for BW =3D 80+80MHz
+	__le16 tx_mcs_80p80;
+};
+
+/// MAC HE capability information element
+struct mac_hecapability {
+	/// MAC HE capabilities
+	u8 mac_cap_info[MAC_HE_MAC_CAPA_LEN];
+	/// PHY HE capabilities
+	u8 phy_cap_info[MAC_HE_PHY_CAPA_LEN];
+	/// Supported MCS combinations
+	struct mac_he_mcs_nss_supp mcs_supp;
+	/// PPE Thresholds data
+	u8 ppe_thres[MAC_HE_PPE_THRES_MAX_LEN];
+};
+
+/// Station flags
+enum mac_sta_flags {
+	/// Bit indicating that a STA has QoS (WMM) capability
+	STA_QOS_CAPA =3D BIT(0),
+	/// Bit indicating that a STA has HT capability
+	STA_HT_CAPA =3D BIT(1),
+	/// Bit indicating that a STA has VHT capability
+	STA_VHT_CAPA =3D BIT(2),
+	/// Bit indicating that a STA has MFP capability
+	STA_MFP_CAPA =3D BIT(3),
+	/// Bit indicating that the STA included the Operation Notification IE
+	STA_OPMOD_NOTIF =3D BIT(4),
+	/// Bit indicating that a STA has HE capability
+	STA_HE_CAPA =3D BIT(5),
+};
+
+/// Connection flags
+enum mac_connection_flags {
+	/// Flag indicating whether the control port is controlled by host or not
+	CONTROL_PORT_HOST =3D BIT(0),
+	/// Flag indicating whether the control port frame shall be sent unencryp=
ted
+	CONTROL_PORT_NO_ENC =3D BIT(1),
+	/// Flag indicating whether HT and VHT shall be disabled or not
+	DISABLE_HT =3D BIT(2),
+	/// Flag indicating whether WPA or WPA2 authentication is in use
+	WPA_WPA2_IN_USE =3D BIT(3),
+	/// Flag indicating whether MFP is in use
+	MFP_IN_USE =3D BIT(4),
+	//  Flag indicating Roam
+	REASSOCIATION =3D BIT(5),
+};
+
+#endif // LMAC_MAC_H_
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/lmac_msg.h b/drivers/net=
/wireless/aic/aic8800_fdrv/lmac_msg.h
new file mode 100644
index 000000000000..4a9713d3209e
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/lmac_msg.h
@@ -0,0 +1,3092 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *************************************************************************=
***************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @brief Main definitions for message exchanges with LMAC
+ *
+ *************************************************************************=
***************
+ */
+
+#ifndef LMAC_MSG_H_
+#define LMAC_MSG_H_
+
+#include "lmac_mac.h"
+
+/* Task identifiers for communication between LMAC and DRIVER */
+enum {
+	TASK_NONE =3D 0xff,
+
+	// MAC Management task.
+	TASK_MM =3D 0,
+	// DEBUG task
+	TASK_DBG,
+	/// SCAN task
+	TASK_SCAN,
+	/// TDLS task
+	TASK_TDLS,
+	/// SCANU task
+	TASK_SCANU,
+	/// ME task
+	TASK_ME,
+	/// SM task
+	TASK_SM,
+	/// APM task
+	TASK_APM,
+	/// BAM task
+	TASK_BAM,
+	/// MESH task
+	TASK_MESH,
+	/// RXU task
+	TASK_RXU,
+	/// RM_task
+	TASK_RM,
+	/// TWT task
+	TASK_TWT,
+#if defined CONFIG_AICWF_FULLMAC
+	// This is used to define the last task that is running on the EMB proces=
sor
+	TASK_LAST_EMB =3D TASK_TWT,
+#else
+#error "Need to define SOFTMAC or FULLMAC"
+#endif
+	// nX API task
+	TASK_API,
+	TASK_MAX,
+};
+
+/// For MAC HW States copied from "hal_machw.h"
+enum {
+	/// MAC HW IDLE State.
+	HW_IDLE =3D 0,
+	/// MAC HW RESERVED State.
+	HW_RESERVED,
+	/// MAC HW DOZE State.
+	HW_DOZE,
+	/// MAC HW ACTIVE State.
+	HW_ACTIVE
+};
+
+/// Power Save mode setting
+enum mm_ps_mode_state {
+	MM_PS_MODE_OFF,
+	MM_PS_MODE_ON,
+	MM_PS_MODE_ON_DYN,
+};
+
+/// Status/error codes used in the MAC software.
+enum {
+	CO_OK,
+	CO_FAIL,
+	CO_EMPTY,
+	CO_FULL,
+	CO_BAD_PARAM,
+	CO_NOT_FOUND,
+	CO_NO_MORE_ELT_AVAILABLE,
+	CO_NO_ELT_IN_USE,
+	CO_BUSY,
+	CO_OP_IN_PROGRESS,
+};
+
+/// Remain on channel operation codes
+enum mm_remain_on_channel_op {
+	MM_ROC_OP_START =3D 0,
+	MM_ROC_OP_CANCEL,
+};
+
+#define DRV_TASK_ID 100
+
+/// Message Identifier. The number of messages is limited to 0xFFFF.
+/// The message ID is divided in two parts:
+/// - bits[15..10] : task index (no more than 64 tasks supported).
+/// - bits[9..0] : message index (no more that 1024 messages per task).
+typedef u16 lmac_msg_id_t;
+
+typedef u16 lmac_task_id_t;
+
+/// Build the first message ID of a task.
+#define LMAC_FIRST_MSG(task) ((lmac_msg_id_t)((task) << 10))
+
+#define MSG_T(msg) ((lmac_task_id_t)((msg) >> 10))
+#define MSG_I(msg) ((msg) & ((1 << 10) - 1))
+
+/// Message structure.
+struct lmac_msg {
+	lmac_msg_id_t id;       ///< Message id.
+	lmac_task_id_t dest_id; ///< Destination kernel identifier.
+	lmac_task_id_t src_id;  ///< Source kernel identifier.
+	u16 param_len;          ///< Parameter embedded struct length.
+	u32 param[]; ///< Parameter embedded struct. Must be word-aligned.
+};
+
+/// List of messages related to the task.
+enum mm_msg_tag {
+	/// RESET Request.
+	MM_RESET_REQ =3D LMAC_FIRST_MSG(TASK_MM),
+	/// RESET Confirmation.
+	MM_RESET_CFM,
+	/// START Request.
+	MM_START_REQ,
+	/// START Confirmation.
+	MM_START_CFM,
+	/// Read Version Request.
+	MM_VERSION_REQ,
+	/// Read Version Confirmation.
+	MM_VERSION_CFM,
+	/// ADD INTERFACE Request.
+	MM_ADD_IF_REQ,
+	/// ADD INTERFACE Confirmation.
+	MM_ADD_IF_CFM,
+	/// REMOVE INTERFACE Request.
+	MM_REMOVE_IF_REQ,
+	/// REMOVE INTERFACE Confirmation.
+	MM_REMOVE_IF_CFM,
+	/// STA ADD Request.
+	MM_STA_ADD_REQ,
+	/// STA ADD Confirm.
+	MM_STA_ADD_CFM,
+	/// STA DEL Request.
+	MM_STA_DEL_REQ,
+	/// STA DEL Confirm.
+	MM_STA_DEL_CFM,
+	/// RX FILTER CONFIGURATION Request.
+	MM_SET_FILTER_REQ,
+	/// RX FILTER CONFIGURATION Confirmation.
+	MM_SET_FILTER_CFM,
+	/// CHANNEL CONFIGURATION Request.
+	MM_SET_CHANNEL_REQ,
+	/// CHANNEL CONFIGURATION Confirmation.
+	MM_SET_CHANNEL_CFM,
+	/// DTIM PERIOD CONFIGURATION Request.
+	MM_SET_DTIM_REQ,
+	/// DTIM PERIOD CONFIGURATION Confirmation.
+	MM_SET_DTIM_CFM,
+	/// BEACON INTERVAL CONFIGURATION Request.
+	MM_SET_BEACON_INT_REQ,
+	/// BEACON INTERVAL CONFIGURATION Confirmation.
+	MM_SET_BEACON_INT_CFM,
+	/// BASIC RATES CONFIGURATION Request.
+	MM_SET_BASIC_RATES_REQ,
+	/// BASIC RATES CONFIGURATION Confirmation.
+	MM_SET_BASIC_RATES_CFM,
+	/// BSSID CONFIGURATION Request.
+	MM_SET_BSSID_REQ,
+	/// BSSID CONFIGURATION Confirmation.
+	MM_SET_BSSID_CFM,
+	/// EDCA PARAMETERS CONFIGURATION Request.
+	MM_SET_EDCA_REQ,
+	/// EDCA PARAMETERS CONFIGURATION Confirmation.
+	MM_SET_EDCA_CFM,
+	/// ABGN MODE CONFIGURATION Request.
+	MM_SET_MODE_REQ,
+	/// ABGN MODE CONFIGURATION Confirmation.
+	MM_SET_MODE_CFM,
+	/// Request setting the VIF active state (i.e associated or AP started)
+	MM_SET_VIF_STATE_REQ,
+	/// Confirmation of the @ref MM_SET_VIF_STATE_REQ message.
+	MM_SET_VIF_STATE_CFM,
+	/// SLOT TIME PARAMETERS CONFIGURATION Request.
+	MM_SET_SLOTTIME_REQ,
+	/// SLOT TIME PARAMETERS CONFIGURATION Confirmation.
+	MM_SET_SLOTTIME_CFM,
+	/// Power Mode Change Request.
+	MM_SET_IDLE_REQ,
+	/// Power Mode Change Confirm.
+	MM_SET_IDLE_CFM,
+	/// KEY ADD Request.
+	MM_KEY_ADD_REQ,
+	/// KEY ADD Confirm.
+	MM_KEY_ADD_CFM,
+	/// KEY DEL Request.
+	MM_KEY_DEL_REQ,
+	/// KEY DEL Confirm.
+	MM_KEY_DEL_CFM,
+	/// Block Ack agreement info addition
+	MM_BA_ADD_REQ,
+	/// Block Ack agreement info addition confirmation
+	MM_BA_ADD_CFM,
+	/// Block Ack agreement info deletion
+	MM_BA_DEL_REQ,
+	/// Block Ack agreement info deletion confirmation
+	MM_BA_DEL_CFM,
+	/// Indication of the primary TBTT to the upper MAC. Upon the reception o=
f
+	/// this
+	// message the upper MAC has to push the beacon(s) to the beacon
+	// transmission queue.
+	MM_PRIMARY_TBTT_IND,
+	/// Indication of the secondary TBTT to the upper MAC. Upon the reception=
 of
+	/// this
+	// message the upper MAC has to push the beacon(s) to the beacon
+	// transmission queue.
+	MM_SECONDARY_TBTT_IND,
+	/// Request for changing the TX power
+	MM_SET_POWER_REQ,
+	/// Confirmation of the TX power change
+	MM_SET_POWER_CFM,
+	/// Request to the LMAC to trigger the embedded logic analyzer and forwar=
d
+	/// the debug
+	/// dump.
+	MM_DBG_TRIGGER_REQ,
+	/// Set Power Save mode
+	MM_SET_PS_MODE_REQ,
+	/// Set Power Save mode confirmation
+	MM_SET_PS_MODE_CFM,
+	/// Request to add a channel context
+	MM_CHAN_CTXT_ADD_REQ,
+	/// Confirmation of the channel context addition
+	MM_CHAN_CTXT_ADD_CFM,
+	/// Request to delete a channel context
+	MM_CHAN_CTXT_DEL_REQ,
+	/// Confirmation of the channel context deletion
+	MM_CHAN_CTXT_DEL_CFM,
+	/// Request to link a channel context to a VIF
+	MM_CHAN_CTXT_LINK_REQ,
+	/// Confirmation of the channel context link
+	MM_CHAN_CTXT_LINK_CFM,
+	/// Request to unlink a channel context from a VIF
+	MM_CHAN_CTXT_UNLINK_REQ,
+	/// Confirmation of the channel context unlink
+	MM_CHAN_CTXT_UNLINK_CFM,
+	/// Request to update a channel context
+	MM_CHAN_CTXT_UPDATE_REQ,
+	/// Confirmation of the channel context update
+	MM_CHAN_CTXT_UPDATE_CFM,
+	/// Request to schedule a channel context
+	MM_CHAN_CTXT_SCHED_REQ,
+	/// Confirmation of the channel context scheduling
+	MM_CHAN_CTXT_SCHED_CFM,
+	/// Request to change the beacon template in LMAC
+	MM_BCN_CHANGE_REQ,
+	/// Confirmation of the beacon change
+	MM_BCN_CHANGE_CFM,
+	/// Request to update the TIM in the beacon (i.e to indicate traffic
+	/// bufferized at AP)
+	MM_TIM_UPDATE_REQ,
+	/// Confirmation of the TIM update
+	MM_TIM_UPDATE_CFM,
+	/// Connection loss indication
+	MM_CONNECTION_LOSS_IND,
+	/// Channel context switch indication to the upper layers
+	MM_CHANNEL_SWITCH_IND,
+	/// Channel context pre-switch indication to the upper layers
+	MM_CHANNEL_PRE_SWITCH_IND,
+	/// Request to remain on channel or cancel remain on channel
+	MM_REMAIN_ON_CHANNEL_REQ,
+	/// Confirmation of the (cancel) remain on channel request
+	MM_REMAIN_ON_CHANNEL_CFM,
+	/// Remain on channel expired indication
+	MM_REMAIN_ON_CHANNEL_EXP_IND,
+	/// Indication of a PS state change of a peer device
+	MM_PS_CHANGE_IND,
+	/// Indication that some buffered traffic should be sent to the peer devi=
ce
+	MM_TRAFFIC_REQ_IND,
+	/// Request to modify the STA Power-save mode options
+	MM_SET_PS_OPTIONS_REQ,
+	/// Confirmation of the PS options setting
+	MM_SET_PS_OPTIONS_CFM,
+	/// Indication of PS state change for a P2P VIF
+	MM_P2P_VIF_PS_CHANGE_IND,
+	/// Indication that CSA counter has been updated
+	MM_CSA_COUNTER_IND,
+	/// Channel occupation report indication
+	MM_CHANNEL_SURVEY_IND,
+	/// Message containing Beamformer Information
+	MM_BFMER_ENABLE_REQ,
+	/// Request to Start/Stop/Update NOA - GO Only
+	MM_SET_P2P_NOA_REQ,
+	/// Request to Start/Stop/Update Opportunistic PS - GO Only
+	MM_SET_P2P_OPPPS_REQ,
+	/// Start/Stop/Update NOA Confirmation
+	MM_SET_P2P_NOA_CFM,
+	/// Start/Stop/Update Opportunistic PS Confirmation
+	MM_SET_P2P_OPPPS_CFM,
+	/// P2P NoA Update Indication - GO Only
+	MM_P2P_NOA_UPD_IND,
+	/// Request to set RSSI threshold and RSSI hysteresis
+	MM_CFG_RSSI_REQ,
+	/// Indication that RSSI level is below or above the threshold
+	MM_RSSI_STATUS_IND,
+	/// Indication that CSA is done
+	MM_CSA_FINISH_IND,
+	/// Indication that CSA is in prorgess (resp. done) and traffic must be
+	/// stopped (resp. restarted)
+	MM_CSA_TRAFFIC_IND,
+	/// Request to update the group information of a station
+	MM_MU_GROUP_UPDATE_REQ,
+	/// Confirmation of the @ref MM_MU_GROUP_UPDATE_REQ message
+	MM_MU_GROUP_UPDATE_CFM,
+	/// Request to initialize the antenna diversity algorithm
+	MM_ANT_DIV_INIT_REQ,
+	/// Request to stop the antenna diversity algorithm
+	MM_ANT_DIV_STOP_REQ,
+	/// Request to update the antenna switch status
+	MM_ANT_DIV_UPDATE_REQ,
+	/// Request to switch the antenna connected to path_0
+	MM_SWITCH_ANTENNA_REQ,
+	/// Indication that a packet loss has occurred
+	MM_PKTLOSS_IND,
+
+	MM_SET_ARPOFFLOAD_REQ,
+	MM_SET_ARPOFFLOAD_CFM,
+	MM_SET_AGG_DISABLE_REQ,
+	MM_SET_AGG_DISABLE_CFM,
+	MM_SET_COEX_REQ,
+	MM_SET_COEX_CFM,
+	MM_SET_RF_CONFIG_REQ,
+	MM_SET_RF_CONFIG_CFM,
+	MM_SET_RF_CALIB_REQ,
+	MM_SET_RF_CALIB_CFM,
+
+	/// MU EDCA PARAMETERS Configuration Request.
+	MM_SET_MU_EDCA_REQ,
+	/// MU EDCA PARAMETERS Configuration Confirmation.
+	MM_SET_MU_EDCA_CFM,
+	/// UORA PARAMETERS Configuration Request.
+	MM_SET_UORA_REQ,
+	/// UORA PARAMETERS Configuration Confirmation.
+	MM_SET_UORA_CFM,
+	/// TXOP RTS THRESHOLD Configuration Request.
+	MM_SET_TXOP_RTS_THRES_REQ,
+	/// TXOP RTS THRESHOLD Configuration Confirmation.
+	MM_SET_TXOP_RTS_THRES_CFM,
+	/// HE BSS Color Configuration Request.
+	MM_SET_BSS_COLOR_REQ,
+	/// HE BSS Color Configuration Confirmation.
+	MM_SET_BSS_COLOR_CFM,
+
+	MM_GET_MAC_ADDR_REQ,
+	MM_GET_MAC_ADDR_CFM,
+
+	MM_GET_STA_INFO_REQ,
+	MM_GET_STA_INFO_CFM,
+
+	MM_SET_TXPWR_IDX_LVL_REQ,
+	MM_SET_TXPWR_IDX_LVL_CFM,
+
+	MM_SET_TXPWR_OFST_REQ,
+	MM_SET_TXPWR_OFST_CFM,
+
+	MM_SET_STACK_START_REQ,
+	MM_SET_STACK_START_CFM,
+
+	MM_APM_STALOSS_IND,
+
+	MM_SET_VENDOR_HWCONFIG_REQ,
+	MM_SET_VENDOR_HWCONFIG_CFM,
+
+	MM_GET_FW_VERSION_REQ,
+	MM_GET_FW_VERSION_CFM,
+
+	MM_SET_RESUME_RESTORE_REQ,
+	MM_SET_RESUME_RESTORE_CFM,
+
+	MM_GET_WIFI_DISABLE_REQ,
+	MM_GET_WIFI_DISABLE_CFM,
+
+	MM_CFG_RSSI_CFM,
+
+	MM_SET_VENDOR_SWCONFIG_REQ,
+	MM_SET_VENDOR_SWCONFIG_CFM,
+
+	MM_SET_TXPWR_LVL_ADJ_REQ,
+	MM_SET_TXPWR_LVL_ADJ_CFM,
+
+	MM_RADAR_DETECT_IND,
+
+	MM_SET_APF_PROG_REQ,
+	MM_SET_APF_PROG_CFM,
+
+	MM_GET_APF_PROG_REQ,
+	MM_GET_APF_PROG_CFM,
+
+	/// arp announcement frame reception indication
+	MM_ARP_ANNOUNCEMENT_IND,
+
+	/// MAX number of messages
+	MM_MAX,
+};
+
+/// Interface types
+enum {
+	/// ESS STA interface
+	MM_STA,
+	/// IBSS STA interface
+	MM_IBSS,
+	/// AP interface
+	MM_AP,
+	// Mesh Point interface
+	MM_MESH_POINT,
+	// Monitor interface
+	MM_MONITOR,
+};
+
+/// BA agreement types
+enum {
+	/// BlockAck agreement for TX
+	BA_AGMT_TX,
+	/// BlockAck agreement for RX
+	BA_AGMT_RX,
+};
+
+/// BA agreement related status
+enum {
+	/// Correct BA agreement establishment
+	BA_AGMT_ESTABLISHED,
+	/// BA agreement already exists for STA+TID requested, cannot override it
+	/// (should have been deleted first)
+	BA_AGMT_ALREADY_EXISTS,
+	/// Correct BA agreement deletion
+	BA_AGMT_DELETED,
+	/// BA agreement for the (STA, TID) doesn't exist so nothing to delete
+	BA_AGMT_DOESNT_EXIST,
+};
+
+/// Features supported by LMAC - Positions
+enum mm_features {
+	/// Beaconing
+	MM_FEAT_BCN_BIT =3D 0,
+	/*
+	 *	/// Autonomous Beacon Transmission
+	 *	MM_FEAT_AUTOBCN_BIT,
+	 *	/// Scan in LMAC
+	 *	MM_FEAT_HWSCAN_BIT,
+	 *	/// Connection Monitoring
+	 *	MM_FEAT_CMON_BIT,
+	 *	/// Multi Role
+	 *	MM_FEAT_MROLE_BIT,
+	 */
+	/// Radar Detection
+	MM_FEAT_RADAR_BIT,
+	/// Power Save
+	MM_FEAT_PS_BIT,
+	/// UAPSD
+	MM_FEAT_UAPSD_BIT,
+	/// DPSM
+	//  MM_FEAT_DPSM_BIT,
+	/// A-MPDU
+	MM_FEAT_AMPDU_BIT,
+	/// A-MSDU
+	MM_FEAT_AMSDU_BIT,
+	/// Channel Context
+	//  MM_FEAT_CHNL_CTXT_BIT,
+	/// Packet reordering
+	//  MM_FEAT_REORD_BIT,
+	/// P2P
+	MM_FEAT_P2P_BIT,
+	/// P2P Go
+	MM_FEAT_P2P_GO_BIT,
+	/// UMAC Present
+	MM_FEAT_UMAC_BIT,
+	/// VHT support
+	MM_FEAT_VHT_BIT,
+	/// Beamformee
+	MM_FEAT_BFMEE_BIT,
+	/// Beamformer
+	MM_FEAT_BFMER_BIT,
+	/// WAPI
+	MM_FEAT_WAPI_BIT,
+	/// MFP
+	MM_FEAT_MFP_BIT,
+	/// Mu-MIMO RX support
+	MM_FEAT_MU_MIMO_RX_BIT,
+	/// Mu-MIMO TX support
+	MM_FEAT_MU_MIMO_TX_BIT,
+	/// Wireless Mesh Networking
+	MM_FEAT_MESH_BIT,
+	/// TDLS support
+	MM_FEAT_TDLS_BIT,
+	/// Antenna Diversity support
+	MM_FEAT_ANT_DIV_BIT,
+	/// UF support
+	MM_FEAT_UF_BIT,
+	/// A-MSDU maximum size (bit0)
+	MM_AMSDU_MAX_SIZE_BIT0,
+	/// A-MSDU maximum size (bit1)
+	MM_AMSDU_MAX_SIZE_BIT1,
+	/// MON_DATA support
+	MM_FEAT_MON_DATA_BIT,
+	/// HE (802.11ax) support
+	MM_FEAT_HE_BIT,
+	/// TWT support
+	MM_FEAT_TWT_BIT,
+};
+
+/// Maximum number of words in the configuration buffer
+#define PHY_CFG_BUF_SIZE 16
+
+/// Structure containing the parameters of the PHY configuration
+struct phy_cfg_tag {
+	/// Buffer containing the parameters specific for the PHY used
+	u32 parameters[PHY_CFG_BUF_SIZE];
+};
+
+/// Structure containing the parameters of the Trident PHY configuration
+struct phy_trd_cfg_tag {
+	/// MDM type(nxm)(upper nibble) and MDM2RF path mapping(lower nibble)
+	u8 path_mapping;
+	/// TX DC offset compensation
+	u32 tx_dc_off_comp;
+};
+
+/// Structure containing the parameters of the Karst PHY configuration
+struct phy_karst_cfg_tag {
+	/// TX IQ mismatch compensation in 2.4GHz
+	u32 tx_iq_comp_2_4G[2];
+	/// RX IQ mismatch compensation in 2.4GHz
+	u32 rx_iq_comp_2_4G[2];
+	/// TX IQ mismatch compensation in 5GHz
+	u32 tx_iq_comp_5G[2];
+	/// RX IQ mismatch compensation in 5GHz
+	u32 rx_iq_comp_5G[2];
+	/// RF path used by default (0 or 1)
+	u8 path_used;
+};
+
+/// Structure containing the parameters of the @ref MM_START_REQ message
+struct mm_start_req {
+	/// PHY configuration
+	struct phy_cfg_tag phy_cfg;
+	/// UAPSD timeout
+	u32 uapsd_timeout;
+	/// Local LP clock accuracy (in ppm)
+	u16 lp_clk_accuracy;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_CHANNEL_REQ mes=
sage
+struct mm_set_channel_req {
+	/// Channel information
+	struct mac_chan_op chan;
+	/// Index of the RF for which the channel has to be set (0: operating
+	/// (primary), 1: secondary RF (used for additional radar detection). Thi=
s
+	/// parameter is reserved if no secondary RF is available in the system
+	u8 index;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_CHANNEL_CFM mes=
sage
+struct mm_set_channel_cfm {
+	/// Radio index to be used in policy table
+	u8 radio_idx;
+	/// TX power configured (in dBm)
+	s8 power;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_DTIM_REQ messag=
e
+struct mm_set_dtim_req {
+	/// DTIM period
+	u8 dtim_period;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_POWER_REQ messa=
ge
+struct mm_set_power_req {
+	/// Index of the interface for which the parameter is configured
+	u8 inst_nbr;
+	/// TX power (in dBm)
+	s8 power;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_POWER_CFM messa=
ge
+struct mm_set_power_cfm {
+	/// Radio index to be used in policy table
+	u8 radio_idx;
+	/// TX power configured (in dBm)
+	s8 power;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_BEACON_INT_REQ
+/// message
+struct mm_set_beacon_int_req {
+	/// Beacon interval
+	u16 beacon_int;
+	/// Index of the interface for which the parameter is configured
+	u8 inst_nbr;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_BASIC_RATES_REQ
+/// message
+struct mm_set_basic_rates_req {
+	/// Basic rate set (as expected by bssBasicRateSet field of Rates MAC HW
+	/// register)
+	u32 rates;
+	/// Index of the interface for which the parameter is configured
+	u8 inst_nbr;
+	/// Band on which the interface will operate
+	u8 band;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_BSSID_REQ messa=
ge
+struct mm_set_bssid_req {
+	/// BSSID to be configured in HW
+	struct mac_addr bssid;
+	/// Index of the interface for which the parameter is configured
+	u8 inst_nbr;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_FILTER_REQ mess=
age
+struct mm_set_filter_req {
+	/// RX filter to be put into rxCntrlReg HW register
+	u32 filter;
+};
+
+/// Structure containing the parameters of the @ref MM_ADD_IF_REQ message.
+struct mm_add_if_req {
+	/// Type of the interface (AP, STA, ADHOC, ...)
+	u8 type;
+	/// MAC ADDR of the interface to start
+	struct mac_addr addr;
+	/// P2P Interface
+	bool p2p;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_EDCA_REQ messag=
e
+struct mm_set_edca_req {
+	/// EDCA parameters of the queue (as expected by edcaACxReg HW register)
+	u32 ac_param;
+	/// Flag indicating if UAPSD can be used on this queue
+	bool uapsd;
+	/// HW queue for which the parameters are configured
+	u8 hw_queue;
+	/// Index of the interface for which the parameters are configured
+	u8 inst_nbr;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_MU_EDCA_REQ mes=
sage
+struct mm_set_mu_edca_req {
+	/// MU EDCA parameters of the different HE queues
+	u32 param[AC_MAX];
+};
+
+/// Structure containing the parameters of the @ref MM_SET_UORA_REQ messag=
e
+struct mm_set_uora_req {
+	/// Minimum exponent of OFDMA Contention Window.
+	u8 eocw_min;
+	/// Maximum exponent of OFDMA Contention Window.
+	u8 eocw_max;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_TXOP_RTS_THRES_=
REQ
+/// message
+struct mm_set_txop_rts_thres_req {
+	/// TXOP RTS threshold
+	u16 txop_dur_rts_thres;
+	/// Index of the interface for which the parameter is configured
+	u8 inst_nbr;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_BSS_COLOR_REQ m=
essage
+struct mm_set_bss_color_req {
+	/// HE BSS color, formatted as per BSS_COLOR MAC HW register
+	u32 bss_color;
+};
+
+struct mm_set_idle_req {
+	u8 hw_idle;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_SLOTTIME_REQ me=
ssage
+struct mm_set_slottime_req {
+	/// Slot time expressed in us
+	u8 slottime;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_MODE_REQ messag=
e
+struct mm_set_mode_req {
+	/// abgnMode field of macCntrl1Reg register
+	u8 abgnmode;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_VIF_STATE_REQ m=
essage
+struct mm_set_vif_state_req {
+	/// Association Id received from the AP (valid only if the VIF is of STA
+	/// type)
+	__le16 aid;
+	/// Flag indicating if the VIF is active or not
+	bool active;
+	/// Interface index
+	u8 inst_nbr;
+};
+
+/// Structure containing the parameters of the @ref MM_ADD_IF_CFM message.
+struct mm_add_if_cfm {
+	/// Status of operation (different from 0 if unsuccessful)
+	u8 status;
+	/// Interface index assigned by the LMAC
+	u8 inst_nbr;
+};
+
+/// Structure containing the parameters of the @ref MM_REMOVE_IF_REQ messa=
ge.
+struct mm_remove_if_req {
+	/// Interface index assigned by the LMAC
+	u8 inst_nbr;
+};
+
+/// Structure containing the parameters of the @ref MM_VERSION_CFM message=
.
+struct mm_version_cfm {
+	/// Version of the LMAC FW
+	u32 version_lmac;
+	/// Version1 of the MAC HW (as encoded in version1Reg MAC HW register)
+	u32 version_machw_1;
+	/// Version2 of the MAC HW (as encoded in version2Reg MAC HW register)
+	u32 version_machw_2;
+	/// Version1 of the PHY (depends on actual PHY)
+	u32 version_phy_1;
+	/// Version2 of the PHY (depends on actual PHY)
+	u32 version_phy_2;
+	/// Supported Features
+	u32 features;
+	/// Maximum number of supported stations
+	u16 max_sta_nb;
+	/// Maximum number of supported virtual interfaces
+	u8 max_vif_nb;
+};
+
+/// Structure containing the parameters of the @ref MM_STA_ADD_REQ message=
.
+struct mm_sta_add_req {
+	/// Bitfield showing some capabilities of the STA (@ref enum mac_sta_flag=
s)
+	u32 capa_flags;
+	/// Maximum A-MPDU size, in bytes, for HE frames
+	u32 ampdu_size_max_he;
+	/// Maximum A-MPDU size, in bytes, for VHT frames
+	u32 ampdu_size_max_vht;
+	/// PAID/GID
+	u32 paid_gid;
+	/// Maximum A-MPDU size, in bytes, for HT frames
+	u16 ampdu_size_max_ht;
+	/// MAC address of the station to be added
+	struct mac_addr mac_addr;
+	/// A-MPDU spacing, in us
+	u8 ampdu_spacing_min;
+	/// Interface index
+	u8 inst_nbr;
+	/// TDLS station
+	bool tdls_sta;
+	/// Indicate if the station is TDLS link initiator station
+	bool tdls_sta_initiator;
+	/// Indicate if the TDLS Channel Switch is allowed
+	bool tdls_chsw_allowed;
+	/// nonTransmitted BSSID index, set to the BSSID index in case the STA ad=
ded
+	/// is an AP that is a nonTransmitted BSSID. Should be set to 0 otherwise
+	u8 bssid_index;
+	/// Maximum BSSID indicator, valid if the STA added is an AP that is a
+	/// nonTransmitted BSSID
+	u8 max_bssid_ind;
+};
+
+/// Structure containing the parameters of the @ref MM_STA_ADD_CFM message=
.
+struct mm_sta_add_cfm {
+	/// Status of the operation (different from 0 if unsuccessful)
+	u8 status;
+	/// Index assigned by the LMAC to the newly added station
+	u8 sta_idx;
+	/// MAC HW index of the newly added station
+	u8 hw_sta_idx;
+};
+
+/// Structure containing the parameters of the @ref MM_STA_DEL_REQ message=
.
+struct mm_sta_del_req {
+	/// Index of the station to be deleted
+	u8 sta_idx;
+};
+
+/// Structure containing the parameters of the @ref MM_STA_DEL_CFM message=
.
+struct mm_sta_del_cfm {
+	/// Status of the operation (different from 0 if unsuccessful)
+	u8 status;
+};
+
+/// Structure containing the parameters of the SET_POWER_MODE REQ message.
+struct mm_setpowermode_req {
+	u8 mode;
+	u8 sta_idx;
+};
+
+/// Structure containing the parameters of the SET_POWER_MODE CFM message.
+struct mm_setpowermode_cfm {
+	u8 status;
+};
+
+/// Structure containing the parameters of the @ref MM_KEY_ADD REQ message=
.
+struct mm_key_add_req {
+	/// Key index (valid only for default keys)
+	u8 key_idx;
+	/// STA index (valid only for pairwise or mesh group keys)
+	u8 sta_idx;
+	/// Key material
+	struct mac_sec_key key;
+	/// Cipher suite (WEP64, WEP128, TKIP, CCMP)
+	u8 cipher_suite;
+	/// Index of the interface for which the key is set (valid only for defau=
lt
+	/// keys or mesh group keys)
+	u8 inst_nbr;
+	/// A-MSDU SPP parameter
+	u8 spp;
+	/// Indicate if provided key is a pairwise key or not
+	bool pairwise;
+};
+
+/// Structure containing the parameters of the @ref MM_KEY_ADD_CFM message=
.
+struct mm_key_add_cfm {
+	/// Status of the operation (different from 0 if unsuccessful)
+	u8 status;
+	/// HW index of the key just added
+	u8 hw_key_idx;
+};
+
+/// Structure containing the parameters of the @ref MM_KEY_DEL_REQ message=
.
+struct mm_key_del_req {
+	/// HW index of the key to be deleted
+	u8 hw_key_idx;
+};
+
+/// Structure containing the parameters of the @ref MM_BA_ADD_REQ message.
+struct mm_ba_add_req {
+	/// Type of agreement (0: TX, 1: RX)
+	u8 type;
+	/// Index of peer station with which the agreement is made
+	u8 sta_idx;
+	/// TID for which the agreement is made with peer station
+	u8 tid;
+	/// Buffer size - number of MPDUs that can be held in its buffer per TID
+	u8 bufsz;
+	/// Start sequence number negotiated during BA setup - the one in first
+	/// aggregated MPDU counts more
+	u16 ssn;
+};
+
+/// Structure containing the parameters of the @ref MM_BA_ADD_CFM message.
+struct mm_ba_add_cfm {
+	/// Index of peer station for which the agreement is being confirmed
+	u8 sta_idx;
+	/// TID for which the agreement is being confirmed
+	u8 tid;
+	/// Status of ba establishment
+	u8 status;
+};
+
+/// Structure containing the parameters of the @ref MM_BA_DEL_REQ message.
+struct mm_ba_del_req {
+	/// Type of agreement (0: TX, 1: RX)
+	u8 type;
+	/// Index of peer station for which the agreement is being deleted
+	u8 sta_idx;
+	/// TID for which the agreement is being deleted
+	u8 tid;
+};
+
+/// Structure containing the parameters of the @ref MM_BA_DEL_CFM message.
+struct mm_ba_del_cfm {
+	/// Index of peer station for which the agreement deletion is being
+	/// confirmed
+	u8 sta_idx;
+	/// TID for which the agreement deletion is being confirmed
+	u8 tid;
+	/// Status of ba deletion
+	u8 status;
+};
+
+/// Structure containing the parameters of the @ref MM_CHAN_CTXT_ADD_REQ m=
essage
+struct mm_chan_ctxt_add_req {
+	/// Operating channel
+	struct mac_chan_op chan;
+};
+
+/// Structure containing the parameters of the @ref MM_CHAN_CTXT_ADD_REQ m=
essage
+struct mm_chan_ctxt_add_cfm {
+	/// Status of the addition
+	u8 status;
+	/// Index of the new channel context
+	u8 index;
+};
+
+/// Structure containing the parameters of the @ref MM_CHAN_CTXT_DEL_REQ m=
essage
+struct mm_chan_ctxt_del_req {
+	/// Index of the new channel context to be deleted
+	u8 index;
+};
+
+/// Structure containing the parameters of the @ref MM_CHAN_CTXT_LINK_REQ
+/// message
+struct mm_chan_ctxt_link_req {
+	/// VIF index
+	u8 vif_index;
+	/// Channel context index
+	u8 chan_index;
+	/// Indicate if this is a channel switch (unlink current ctx first if tru=
e)
+	u8 chan_switch;
+};
+
+/// Structure containing the parameters of the @ref MM_CHAN_CTXT_UNLINK_RE=
Q
+/// message
+struct mm_chan_ctxt_unlink_req {
+	/// VIF index
+	u8 vif_index;
+};
+
+/// Structure containing the parameters of the @ref MM_CHAN_CTXT_UPDATE_RE=
Q
+/// message
+struct mm_chan_ctxt_update_req {
+	/// Channel context index
+	u8 chan_index;
+	/// New channel information
+	struct mac_chan_op chan;
+};
+
+/// Structure containing the parameters of the @ref MM_CHAN_CTXT_SCHED_REQ
+/// message
+struct mm_chan_ctxt_sched_req {
+	/// VIF index
+	u8 vif_index;
+	/// Channel context index
+	u8 chan_index;
+	/// Type of the scheduling request (0: normal scheduling, 1: derogatory
+	/// scheduling)
+	u8 type;
+};
+
+/// Structure containing the parameters of the @ref MM_CHANNEL_SWITCH_IND
+/// message
+struct mm_channel_switch_ind {
+	/// Index of the channel context we will switch to
+	u8 chan_index;
+	/// Indicate if the switch has been triggered by a Remain on channel requ=
est
+	bool roc;
+	/// VIF on which remain on channel operation has been started (if roc =3D=
=3D 1)
+	u8 vif_index;
+	/// Indicate if the switch has been triggered by a TDLS Remain on channel
+	/// request
+	bool roc_tdls;
+};
+
+/// Structure containing the parameters of the @ref MM_CHANNEL_PRE_SWITCH_=
IND
+/// message
+struct mm_channel_pre_switch_ind {
+	/// Index of the channel context we will switch to
+	u8 chan_index;
+};
+
+/// Structure containing the parameters of the @ref MM_CONNECTION_LOSS_IND
+/// message.
+struct mm_connection_loss_ind {
+	/// VIF instance number
+	u8 inst_nbr;
+};
+
+/// Structure containing the parameters of the @ref MM_DBG_TRIGGER_REQ mes=
sage.
+struct mm_dbg_trigger_req {
+	/// Error trace to be reported by the LMAC
+	char error[64];
+};
+
+/// Structure containing the parameters of the @ref MM_SET_PS_MODE_REQ mes=
sage.
+struct mm_set_ps_mode_req {
+	/// Power Save is activated or deactivated
+	u8 new_state;
+};
+
+/// Structure containing the parameters of the @ref MM_BCN_CHANGE_REQ mess=
age.
+#define BCN_MAX_CSA_CPT 2
+struct mm_bcn_change_req {
+	/// Pointer, in host memory, to the new beacon template
+	u32 bcn_ptr;
+	/// Length of the beacon template
+	u16 bcn_len;
+	/// Offset of the TIM IE in the beacon
+	u16 tim_oft;
+	/// Length of the TIM IE
+	u8 tim_len;
+	/// Index of the VIF for which the beacon is updated
+	u8 inst_nbr;
+	/// Offset of CSA (channel switch announcement) counters (0 means no
+	/// counter)
+	u8 csa_oft[BCN_MAX_CSA_CPT];
+};
+
+/// Structure containing the parameters of the @ref MM_TIM_UPDATE_REQ mess=
age.
+struct mm_tim_update_req {
+	/// Association ID of the STA the bit of which has to be updated (0 for
+	/// BC/MC traffic)
+	u16 aid;
+	/// Flag indicating the availability of data packets for the given STA
+	u8 tx_avail;
+	/// Index of the VIF for which the TIM is updated
+	u8 inst_nbr;
+};
+
+/// Structure containing the parameters of the @ref MM_REMAIN_ON_CHANNEL_R=
EQ
+/// message.
+struct mm_remain_on_channel_req {
+	/// Operation Code
+	u8 op_code;
+	/// VIF Index
+	u8 vif_index;
+	/// Band (2.4GHz or 5GHz)
+	u8 band;
+	/// Channel type: 20,40,80,160 or 80+80 MHz
+	u8 type;
+	/// Frequency for Primary 20MHz channel (in MHz)
+	u16 prim20_freq;
+	/// Frequency for Center of the contiguous channel or center of Primary
+	/// 80+80
+	u16 center1_freq;
+	/// Frequency for Center of the non-contiguous secondary 80+80
+	u16 center2_freq;
+	/// Duration (in ms)
+	u32 duration_ms;
+	/// TX power (in dBm)
+	s8 tx_power;
+};
+
+/// Structure containing the parameters of the @ref MM_REMAIN_ON_CHANNEL_C=
FM
+/// message
+struct mm_remain_on_channel_cfm {
+	/// Operation Code
+	u8 op_code;
+	/// Status of the operation
+	u8 status;
+	/// Channel Context index
+	u8 chan_ctxt_index;
+};
+
+/// Structure containing the parameters of the @ref MM_REMAIN_ON_CHANNEL_E=
XP_IND
+/// message
+struct mm_remain_on_channel_exp_ind {
+	/// VIF Index
+	u8 vif_index;
+	/// Channel Context index
+	u8 chan_ctxt_index;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_UAPSD_TMR_REQ
+/// message.
+struct mm_set_uapsd_tmr_req {
+	/// action: Start or Stop the timer
+	u8 action;
+	/// timeout value, in milliseconds
+	u32 timeout;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_UAPSD_TMR_CFM
+/// message.
+struct mm_set_uapsd_tmr_cfm {
+	/// Status of the operation (different from 0 if unsuccessful)
+	u8 status;
+};
+
+/// Structure containing the parameters of the @ref MM_PS_CHANGE_IND messa=
ge
+struct mm_ps_change_ind {
+	/// Index of the peer device that is switching its PS state
+	u8 sta_idx;
+	/// New PS state of the peer device (0: active, 1: sleeping)
+	u8 ps_state;
+};
+
+/// Structure containing the parameters of the @ref MM_P2P_VIF_PS_CHANGE_I=
ND
+/// message
+struct mm_p2p_vif_ps_change_ind {
+	/// Index of the P2P VIF that is switching its PS state
+	u8 vif_index;
+	/// New PS state of the P2P VIF interface (0: active, 1: sleeping)
+	u8 ps_state;
+};
+
+/// Structure containing the parameters of the @ref MM_TRAFFIC_REQ_IND mes=
sage
+struct mm_traffic_req_ind {
+	/// Index of the peer device that needs traffic
+	u8 sta_idx;
+	/// Number of packets that need to be sent (if 0, all buffered traffic sh=
all
+	/// be sent and if set to @ref PS_SP_INTERRUPTED, it means that current
+	/// service period has been interrupted)
+	u8 pkt_cnt;
+	/// Flag indicating if the traffic request concerns U-APSD queues or not
+	bool uapsd;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_PS_OPTIONS_REQ
+/// message.
+struct mm_set_ps_options_req {
+	/// VIF Index
+	u8 vif_index;
+	/// Listen interval (0 if wake up shall be based on DTIM period)
+	u16 listen_interval;
+	/// Flag indicating if we shall listen the BC/MC traffic or not
+	bool dont_listen_bc_mc;
+};
+
+/// Structure containing the parameters of the @ref MM_CSA_COUNTER_IND mes=
sage
+struct mm_csa_counter_ind {
+	/// Index of the VIF
+	u8 vif_index;
+	/// Updated CSA counter value
+	u8 csa_count;
+};
+
+/// Structure containing the parameters of the @ref MM_CHANNEL_SURVEY_IND
+/// message
+struct mm_channel_survey_ind {
+	/// Frequency of the channel
+	u16 freq;
+	/// Noise in dbm
+	s8 noise_dbm;
+	/// Amount of time spent of the channel (in ms)
+	u32 chan_time_ms;
+	/// Amount of time the primary channel was sensed busy
+	u32 chan_time_busy_ms;
+};
+
+/// Structure containing the parameters of the @ref MM_BFMER_ENABLE_REQ me=
ssage.
+struct mm_bfmer_enable_req {
+	/**
+	 * Address of the beamforming report space allocated in host memory
+	 * (Valid only if vht_su_bfmee is true)
+	 */
+	u32 host_bfr_addr;
+	/**
+	 * Size of the beamforming report space allocated in host memory. This sp=
ace
+	 * should be twice the maximum size of the expected beamforming reports a=
s
+	 * the FW will divide it in two in order to be able to upload a new repor=
t
+	 * while another one is used in transmission
+	 */
+	u16 host_bfr_size;
+	/// AID
+	u16 aid;
+	/// Station Index
+	u8 sta_idx;
+	/// Maximum number of spatial streams the station can receive
+	u8 rx_nss;
+	/**
+	 * Indicate if peer STA is MU Beamformee (VHT) capable
+	 * (Valid only if vht_su_bfmee is true)
+	 */
+	bool vht_mu_bfmee;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_P2P_NOA_REQ mes=
sage.
+struct mm_set_p2p_noa_req {
+	/// VIF Index
+	u8 vif_index;
+	/// Allocated NOA Instance Number - Valid only if count =3D 0
+	u8 noa_inst_nb;
+	/// Count
+	u8 count;
+	/// Indicate if NoA can be paused for traffic reason
+	bool dyn_noa;
+	/// Duration (in us)
+	u32 duration_us;
+	/// Interval (in us)
+	u32 interval_us;
+	/// Start Time offset from next TBTT (in us)
+	u32 start_offset;
+};
+
+#ifdef CONFIG_AIC8800_ARP_OFFLOAD
+struct mm_set_arpoffload_en_req {
+	u32 ipaddr;
+	u8 enable;
+	u8 vif_idx;
+};
+
+struct mm_set_arpoffload_en_cfm {
+	u8 status;
+};
+#endif
+
+struct mm_set_agg_disable_req {
+	u8 disable;
+	u8 staidx;
+	u8 disable_rx;
+};
+
+struct mm_set_rf_config_req {
+	u8 table_sel;
+	u8 table_ofst;
+	u8 table_num;
+	u8 deft_page;
+	u32 data[64];
+};
+
+struct mm_set_rf_calib_req {
+	u32 cal_cfg_24g;
+	u32 cal_cfg_5g;
+	u32 param_alpha;
+	u32 bt_calib_en;
+	u32 bt_calib_param;
+	u8 xtal_cap;
+	u8 xtal_cap_fine;
+};
+
+struct mm_set_rf_calib_cfm {
+	u32 rxgain_24g_addr;
+	u32 rxgain_5g_addr;
+	u32 txgain_24g_addr;
+	u32 txgain_5g_addr;
+};
+
+struct mm_get_mac_addr_req {
+	u32 get;
+};
+
+struct mm_get_mac_addr_cfm {
+	u8 mac_addr[6];
+};
+
+struct mm_get_sta_info_req {
+	u8 sta_idx;
+};
+
+struct mm_get_sta_info_cfm {
+	u32 rate_info;
+	u32 txfailed;
+	u8 rssi;
+};
+
+#define REGION_NUM_MAX 5
+
+struct txpwr_lvl_conf {
+	u8 enable;
+	u8 dsss;
+	u8 ofdmlowrate_2g4;
+	u8 ofdm64qam_2g4;
+	u8 ofdm256qam_2g4;
+	u8 ofdm1024qam_2g4;
+	u8 ofdmlowrate_5g;
+	u8 ofdm64qam_5g;
+	u8 ofdm256qam_5g;
+	u8 ofdm1024qam_5g;
+};
+
+struct txpwr_lvl_conf_v2 {
+	u8 enable;
+	s8 pwrlvl_11b_11ag_2g4[12];
+	s8 pwrlvl_11n_11ac_2g4[10];
+	s8 pwrlvl_11ax_2g4[12];
+};
+
+struct txpwr_lvl_conf_v3 {
+	u8 enable;
+	s8 pwrlvl_11b_11ag_2g4[12];
+	s8 pwrlvl_11n_11ac_2g4[10];
+	s8 pwrlvl_11ax_2g4[12];
+	s8 pwrlvl_11a_5g[12];
+	s8 pwrlvl_11n_11ac_5g[10];
+	s8 pwrlvl_11ax_5g[12];
+};
+
+struct txpwr_lvl_adj_conf {
+	u8 enable;
+	s8 pwrlvl_adj_tbl_2g4[3];
+	s8 pwrlvl_adj_tbl_5g[6];
+};
+
+struct txpwr_loss_conf {
+	u8 loss_enable_2g4;
+	s8 loss_value_2g4;
+	u8 loss_enable_5g;
+	s8 loss_value_5g;
+};
+
+struct mm_set_txpwr_lvl_req {
+	union {
+		struct txpwr_lvl_conf txpwr_lvl;
+		struct txpwr_lvl_conf_v2 txpwr_lvl_v2;
+		struct txpwr_lvl_conf_v3 txpwr_lvl_v3;
+	};
+};
+
+struct mm_set_txpwr_lvl_adj_req {
+	struct txpwr_lvl_adj_conf txpwr_lvl_adj;
+};
+
+struct txpwr_idx_conf {
+	u8 enable;
+	u8 dsss;
+	u8 ofdmlowrate_2g4;
+	u8 ofdm64qam_2g4;
+	u8 ofdm256qam_2g4;
+	u8 ofdm1024qam_2g4;
+	u8 ofdmlowrate_5g;
+	u8 ofdm64qam_5g;
+	u8 ofdm256qam_5g;
+	u8 ofdm1024qam_5g;
+};
+
+struct mm_set_txpwr_idx_req {
+	struct txpwr_idx_conf txpwr_idx;
+};
+
+struct txpwr_ofst_conf {
+	u8 enable;
+	s8 chan_1_4;
+	s8 chan_5_9;
+	s8 chan_10_13;
+	s8 chan_36_64;
+	s8 chan_100_120;
+	s8 chan_122_140;
+	s8 chan_142_165;
+};
+
+/*
+ * pwrofst2x_tbl_2g4[3][3]:
+ * +---------------+----------+----------+----------+
+ * | RateTyp\ChGrp |  CH_1_4  |  CH_5_9  | CH_10_13 |
+ * +---------------+----------+----------+----------+
+ * | DSSS          |  [0][0]  |  [0][1]  |  [0][2]  |
+ * +---------------+----------+----------+----------+
+ * | OFDM_HIGHRATE |  [1][0]  |  [1][1]  |  [1][2]  |
+ * +---------------+----------+----------+----------+
+ * | OFDM_LOWRATE  |  [2][0]  |  [2][1]  |  [2][2]  |
+ * +---------------+----------+----------+----------+
+ * pwrofst2x_tbl_5g[3][6]:
+ * +---------------+--------------+--------------+----------------+-------=
---------+--+--+
+ * | RateTyp\ChGrp | CH_42(36~50) | CH_58(51~64) | CH_106(98~114) |
+ * CH_122(115~130)| CH_138(131~146)| CH_155(147~166)|
+ * +---------------+--------------+--------------+----------------+-------=
---------+--+--+
+ * | OFDM_LOWRATE  |    [0][0]    |    [0][1]    |     [0][2]     |     [0=
][3]
+ * |     [0][4]     |     [0][5]     |
+ * +---------------+--------------+--------------+----------------+-------=
---------+--+--+
+ * | OFDM_HIGHRATE |    [1][0]    |    [1][1]    |     [1][2]     |     [1=
][3]
+ * |     [1][4]     |     [1][5]     |
+ * +---------------+--------------+--------------+----------------+-------=
---------+--+--+
+ * | OFDM_MIDRATE  |    [2][0]    |    [2][1]    |     [2][2]     |     [2=
][3]
+ * |     [2][4]     |     [2][5]     |
+ * +---------------+--------------+--------------+----------------+-------=
---------+--+--+
+ */
+
+struct txpwr_ofst2x_conf {
+	s8 enable;
+	s8 pwrofst2x_tbl_2g4[3][3];
+	s8 pwrofst2x_tbl_5g[3][6];
+};
+
+struct xtal_cap_conf {
+	u8 enable;
+	u8 xtal_cap;
+	u8 xtal_cap_fine;
+};
+
+struct mm_set_txpwr_ofst_req {
+	union {
+		struct txpwr_ofst_conf txpwr_ofst;
+		struct txpwr_ofst2x_conf txpwr_ofst2x;
+	};
+};
+
+struct mm_set_stack_start_req {
+	u8 is_stack_start;
+	u8 efuse_valid;
+	u8 set_vendor_info;
+	u8 fwtrace_redir;
+};
+
+struct mm_set_stack_start_cfm {
+	u8 is_5g_support;
+	u8 vendor_info;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_P2P_OPPPS_REQ
+/// message.
+struct mm_set_p2p_oppps_req {
+	/// VIF Index
+	u8 vif_index;
+	/// CTWindow
+	u8 ctwindow;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_P2P_NOA_CFM mes=
sage.
+struct mm_set_p2p_noa_cfm {
+	/// Request status
+	u8 status;
+};
+
+/// Structure containing the parameters of the @ref MM_SET_P2P_OPPPS_CFM
+/// message.
+struct mm_set_p2p_oppps_cfm {
+	/// Request status
+	u8 status;
+};
+
+/// Structure containing the parameters of the @ref MM_P2P_NOA_UPD_IND mes=
sage.
+struct mm_p2p_noa_upd_ind {
+	/// VIF Index
+	u8 vif_index;
+	/// NOA Instance Number
+	u8 noa_inst_nb;
+	/// NoA Type
+	u8 noa_type;
+	/// Count
+	u8 count;
+	/// Duration (in us)
+	u32 duration_us;
+	/// Interval (in us)
+	u32 interval_us;
+	/// Start Time
+	u32 start_time;
+};
+
+/// Structure containing the parameters of the @ref MM_CFG_RSSI_REQ messag=
e
+struct mm_cfg_rssi_req {
+	/// Index of the VIF
+	u8 vif_index;
+	/// RSSI threshold
+	s8 rssi_thold;
+	/// RSSI hysteresis
+	u8 rssi_hyst;
+};
+
+/// Structure containing the parameters of the @ref MM_RSSI_STATUS_IND mes=
sage
+struct mm_rssi_status_ind {
+	/// Index of the VIF
+	u8 vif_index;
+	/// Status of the RSSI
+	bool rssi_status;
+	/// Current RSSI
+	s8 rssi;
+};
+
+/// Structure containing the parameters of the @ref MM_PKTLOSS_IND message
+struct mm_pktloss_ind {
+	/// Index of the VIF
+	u8 vif_index;
+	/// Address of the STA for which there is a packet loss
+	struct mac_addr mac_addr;
+	/// Number of packets lost
+	u32 num_packets;
+};
+
+/// Structure containing the parameters of the @ref MM_CSA_FINISH_IND mess=
age
+struct mm_csa_finish_ind {
+	/// Index of the VIF
+	u8 vif_index;
+	/// Status of the operation
+	u8 status;
+	/// New channel ctx index
+	u8 chan_idx;
+};
+
+/// Structure containing the parameters of the @ref MM_CSA_TRAFFIC_IND mes=
sage
+struct mm_csa_traffic_ind {
+	/// Index of the VIF
+	u8 vif_index;
+	/// Is tx traffic enable or disable
+	bool enable;
+};
+
+/// Structure containing the parameters of the @ref MM_MU_GROUP_UPDATE_REQ
+/// message. Size allocated for the structure depends of the number of gro=
up
+struct mm_mu_group_update_req {
+	/// Station index
+	u8 sta_idx;
+	/// Number of groups the STA belongs to
+	u8 group_cnt;
+	/// Group information
+	struct {
+		/// Group Id
+		u8 group_id;
+		/// User position
+		u8 user_pos;
+	} groups[];
+};
+
+//////////////////////////////////////////////////////////////////////////=
/////
+/////////// For Scan messages
+//////////////////////////////////////////////////////////////////////////=
/////
+enum scan_msg_tag {
+	/// Scanning start Request.
+	SCAN_START_REQ =3D LMAC_FIRST_MSG(TASK_SCAN),
+	/// Scanning start Confirmation.
+	SCAN_START_CFM,
+	/// End of scanning indication.
+	SCAN_DONE_IND,
+	/// Cancel scan request
+	SCAN_CANCEL_REQ,
+	/// Cancel scan confirmation
+	SCAN_CANCEL_CFM,
+
+	/// MAX number of messages
+	SCAN_MAX,
+};
+
+/// Maximum number of SSIDs in a scan request
+#define SCAN_SSID_MAX 3
+
+/// Maximum number of channels in a scan request
+#define SCAN_CHANNEL_MAX (MAC_DOMAINCHANNEL_24G_MAX + MAC_DOMAINCHANNEL_5G=
_MAX)
+
+/// Maximum length of the ProbeReq IEs (SoftMAC mode)
+#define SCAN_MAX_IE_LEN 300
+
+/// Maximum number of PHY bands supported
+#define SCAN_BAND_MAX 2
+
+/// Structure containing the parameters of the @ref SCAN_START_REQ message
+struct scan_start_req {
+	/// List of channel to be scanned
+	struct mac_chan_def chan[SCAN_CHANNEL_MAX];
+	/// List of SSIDs to be scanned
+	struct mac_ssid ssid[SCAN_SSID_MAX];
+	/// BSSID to be scanned
+	struct mac_addr bssid;
+	/// Pointer (in host memory) to the additional IEs that need to be added =
to
+	/// the ProbeReq (following the SSID element)
+	u32 add_ies;
+	/// Length of the additional IEs
+	u16 add_ie_len;
+	/// Index of the VIF that is scanning
+	u8 vif_idx;
+	/// Number of channels to scan
+	u8 chan_cnt;
+	/// Number of SSIDs to scan for
+	u8 ssid_cnt;
+	/// no CCK - For P2P frames not being sent at CCK rate in 2GHz band.
+	bool no_cck;
+	/// Scan duration, in us
+	u32 duration;
+};
+
+/// Structure containing the parameters of the @ref SCAN_START_CFM message
+struct scan_start_cfm {
+	/// Status of the request
+	u8 status;
+};
+
+/// Structure containing the parameters of the @ref SCAN_CANCEL_REQ messag=
e
+struct scan_cancel_req {
+};
+
+/// Structure containing the parameters of the @ref SCAN_START_CFM message
+struct scan_cancel_cfm {
+	/// Status of the request
+	u8 status;
+};
+
+//////////////////////////////////////////////////////////////////////////=
/////
+/////////// For Scanu messages
+//////////////////////////////////////////////////////////////////////////=
/////
+/// Messages that are logically related to the task.
+enum {
+	/// Scan request from host.
+	SCANU_START_REQ =3D LMAC_FIRST_MSG(TASK_SCANU),
+	/// Scanning start Confirmation.
+	SCANU_START_CFM,
+	/// Join request
+	SCANU_JOIN_REQ,
+	/// Join confirmation.
+	SCANU_JOIN_CFM,
+	/// Scan result indication.
+	SCANU_RESULT_IND,
+	/// Fast scan request from any other module.
+	SCANU_FAST_REQ,
+	/// Confirmation of fast scan request.
+	SCANU_FAST_CFM,
+
+	SCANU_VENDOR_IE_REQ,
+	SCANU_VENDOR_IE_CFM,
+	SCANU_START_CFM_ADDTIONAL,
+	SCANU_CANCEL_REQ,
+	SCANU_CANCEL_CFM,
+
+	/// MAX number of messages
+	SCANU_MAX,
+};
+
+/// Maximum length of the additional ProbeReq IEs (FullMAC mode)
+#define SCANU_MAX_IE_LEN 200
+
+/// Structure containing the parameters of the @ref SCANU_START_REQ messag=
e
+struct scanu_start_req {
+	/// List of channel to be scanned
+	struct mac_chan_def chan[SCAN_CHANNEL_MAX];
+	/// List of SSIDs to be scanned
+	struct mac_ssid ssid[SCAN_SSID_MAX];
+	/// BSSID to be scanned (or WILDCARD BSSID if no BSSID is searched in
+	/// particular)
+	struct mac_addr bssid;
+	/// Address (in host memory) of the additional IEs that need to be added =
to
+	/// the ProbeReq (following the SSID element)
+	u32 add_ies;
+	/// Length of the additional IEs
+	u16 add_ie_len;
+	/// Index of the VIF that is scanning
+	u8 vif_idx;
+	/// Number of channels to scan
+	u8 chan_cnt;
+	/// Number of SSIDs to scan for
+	u8 ssid_cnt;
+	/// no CCK - For P2P frames not being sent at CCK rate in 2GHz band.
+	bool no_cck;
+	/// Scan duration, in us
+	u32 duration;
+};
+
+struct scanu_vendor_ie_req {
+	u16 add_ie_len;
+	u8 vif_idx;
+	u8 ie[256];
+};
+
+/// Structure containing the parameters of the @ref SCANU_START_CFM messag=
e
+struct scanu_start_cfm {
+	/// Index of the VIF that was scanning
+	u8 vif_idx;
+	/// Status of the request
+	u8 status;
+	/// Number of scan results available
+	u8 result_cnt;
+};
+
+/// Parameters of the @SCANU_RESULT_IND message
+struct scanu_result_ind {
+	/// Length of the frame
+	u16 length;
+	/// Frame control field of the frame.
+	u16 framectrl;
+	/// Center frequency on which we received the packet
+	u16 center_freq;
+	/// PHY band
+	u8 band;
+	/// Index of the station that sent the frame. 0xFF if unknown.
+	u8 sta_idx;
+	/// Index of the VIF that received the frame. 0xFF if unknown.
+	u8 inst_nbr;
+	/// RSSI of the received frame.
+	s8 rssi;
+	/// Frame payload.
+	u32 payload[];
+};
+
+struct rxu_arp_announcement_ind {
+	/// index of the vif
+	u8 vif_index;
+	u8 offset;
+	/// length of the frame
+	u16 length;
+	u32 rx_status;
+	/// frame payload
+	u8 payload[];
+};
+
+/// Structure containing the parameters of the message.
+struct scanu_fast_req {
+	/// The SSID to scan in the channel.
+	struct mac_ssid ssid;
+	/// BSSID.
+	struct mac_addr bssid;
+	/// Probe delay.
+	u16 probe_delay;
+	/// Minimum channel time.
+	u16 minch_time;
+	/// Maximum channel time.
+	u16 maxch_time;
+	/// The channel number to scan.
+	u16 ch_nbr;
+};
+
+//////////////////////////////////////////////////////////////////////////=
/////
+/////////// For ME messages
+//////////////////////////////////////////////////////////////////////////=
/////
+/// Messages that are logically related to the task.
+enum {
+	/// Configuration request from host.
+	ME_CONFIG_REQ =3D LMAC_FIRST_MSG(TASK_ME),
+	/// Configuration confirmation.
+	ME_CONFIG_CFM,
+	/// Configuration request from host.
+	ME_CHAN_CONFIG_REQ,
+	/// Configuration confirmation.
+	ME_CHAN_CONFIG_CFM,
+	/// Set control port state for a station.
+	ME_SET_CONTROL_PORT_REQ,
+	/// Control port setting confirmation.
+	ME_SET_CONTROL_PORT_CFM,
+	/// TKIP MIC failure indication.
+	ME_TKIP_MIC_FAILURE_IND,
+	/// Add a station to the FW (AP mode)
+	ME_STA_ADD_REQ,
+	/// Confirmation of the STA addition
+	ME_STA_ADD_CFM,
+	/// Delete a station from the FW (AP mode)
+	ME_STA_DEL_REQ,
+	/// Confirmation of the STA deletion
+	ME_STA_DEL_CFM,
+	/// Indication of a TX RA/TID queue credit update
+	ME_TX_CREDITS_UPDATE_IND,
+	/// Request indicating to the FW that there is traffic buffered on host
+	ME_TRAFFIC_IND_REQ,
+	/// Confirmation that the @ref ME_TRAFFIC_IND_REQ has been executed
+	ME_TRAFFIC_IND_CFM,
+	/// Request of RC statistics to a station
+	ME_RC_STATS_REQ,
+	/// RC statistics confirmation
+	ME_RC_STATS_CFM,
+	/// RC fixed rate request
+	ME_RC_SET_RATE_REQ,
+	/// Configure monitor interface
+	ME_CONFIG_MONITOR_REQ,
+	/// Configure monitor interface response
+	ME_CONFIG_MONITOR_CFM,
+	/// Setting power Save mode request from host
+	ME_SET_PS_MODE_REQ,
+	/// Set power Save mode confirmation
+	ME_SET_PS_MODE_CFM,
+	/// Setting Low Power level request from host
+	ME_SET_LP_LEVEL_REQ,
+	/// Set Low Power level confirmation
+	ME_SET_LP_LEVEL_CFM,
+	/// MAX number of messages
+	ME_MAX,
+};
+
+/// Structure containing the parameters of the @ref ME_START_REQ message
+struct me_config_req {
+	/// HT Capabilities
+	struct mac_htcapability ht_cap;
+	/// VHT Capabilities
+	struct mac_vhtcapability vht_cap;
+	/// HE capabilities
+	struct mac_hecapability he_cap;
+	/// Lifetime of packets sent under a BlockAck agreement (expressed in TUs=
)
+	u16 tx_lft;
+	/// Maximum supported BW
+	u8 phy_bw_max;
+	/// Boolean indicating if HT is supported or not
+	bool ht_supp;
+	/// Boolean indicating if VHT is supported or not
+	bool vht_supp;
+	/// Boolean indicating if HE is supported or not
+	bool he_supp;
+	/// Boolean indicating if HE OFDMA UL is enabled or not
+	bool he_ul_on;
+	/// Boolean indicating if PS mode shall be enabled or not
+	bool ps_on;
+	/// Boolean indicating if Antenna Diversity shall be enabled or not
+	bool ant_div_on;
+	/// Boolean indicating if Dynamic PS mode shall be used or not
+	bool dpsm;
+};
+
+/// Structure containing the parameters of the @ref ME_CHAN_CONFIG_REQ mes=
sage
+struct me_chan_config_req {
+	/// List of 2.4GHz supported channels
+	struct mac_chan_def chan2G4[MAC_DOMAINCHANNEL_24G_MAX];
+	/// List of 5GHz supported channels
+	struct mac_chan_def chan5G[MAC_DOMAINCHANNEL_5G_MAX];
+	/// Number of 2.4GHz channels in the list
+	u8 chan2G4_cnt;
+	/// Number of 5GHz channels in the list
+	u8 chan5G_cnt;
+};
+
+/// Structure containing the parameters of the @ref ME_SET_CONTROL_PORT_RE=
Q
+/// message
+struct me_set_control_port_req {
+	/// Index of the station for which the control port is opened
+	u8 sta_idx;
+	/// Control port state
+	bool control_port_open;
+};
+
+/// Structure containing the parameters of the @ref ME_TKIP_MIC_FAILURE_IN=
D
+/// message
+struct me_tkip_mic_failure_ind {
+	/// Address of the sending STA
+	struct mac_addr addr;
+	/// TSC value
+	u64 tsc;
+	/// Boolean indicating if the packet was a group or unicast one (true if
+	/// group)
+	bool ga;
+	/// Key Id
+	u8 keyid;
+	/// VIF index
+	u8 vif_idx;
+};
+
+/// Structure containing the parameters of the @ref ME_STA_ADD_REQ message
+struct me_sta_add_req {
+	/// MAC address of the station to be added
+	struct mac_addr mac_addr;
+	/// Supported legacy rates
+	struct mac_rateset rate_set;
+	/// HT Capabilities
+	struct mac_htcapability ht_cap;
+	/// VHT Capabilities
+	struct mac_vhtcapability vht_cap;
+	/// HE capabilities
+	struct mac_hecapability he_cap;
+	/// Flags giving additional information about the station (@ref
+	/// mac_sta_flags)
+	u32 flags;
+	/// Association ID of the station
+	__le16 aid;
+	/// Bit field indicating which queues have U-APSD enabled
+	u8 uapsd_queues;
+	/// Maximum size, in frames, of a APSD service period
+	u8 max_sp_len;
+	/// Operation mode information (valid if bit @ref STA_OPMOD_NOTIF is
+	/// set in the flags)
+	u8 opmode;
+	/// Index of the VIF the station is attached to
+	u8 vif_idx;
+	/// Whether the station is TDLS station
+	bool tdls_sta;
+	/// Indicate if the station is TDLS link initiator station
+	bool tdls_sta_initiator;
+	/// Indicate if the TDLS Channel Switch is allowed
+	bool tdls_chsw_allowed;
+};
+
+/// Structure containing the parameters of the @ref ME_STA_ADD_CFM message
+struct me_sta_add_cfm {
+	/// Station index
+	u8 sta_idx;
+	/// Status of the station addition
+	u8 status;
+	/// PM state of the station
+	u8 pm_state;
+};
+
+/// Structure containing the parameters of the @ref ME_STA_DEL_REQ message=
.
+struct me_sta_del_req {
+	/// Index of the station to be deleted
+	u8 sta_idx;
+	/// Whether the station is TDLS station
+	bool tdls_sta;
+};
+
+/// Structure containing the parameters of the @ref ME_TX_CREDITS_UPDATE_I=
ND
+/// message.
+struct me_tx_credits_update_ind {
+	/// Index of the station for which the credits are updated
+	u8 sta_idx;
+	/// TID for which the credits are updated
+	u8 tid;
+	/// Offset to be applied on the credit count
+	s8 credits;
+};
+
+/// Structure containing the parameters of the @ref ME_TRAFFIC_IND_REQ mes=
sage.
+struct me_traffic_ind_req {
+	/// Index of the station for which UAPSD traffic is available on host
+	u8 sta_idx;
+	/// Flag indicating the availability of UAPSD packets for the given STA
+	u8 tx_avail;
+	/// Indicate if traffic is on uapsd-enabled queues
+	bool uapsd;
+};
+
+struct mm_apm_staloss_ind {
+	u8 sta_idx;
+	u8 vif_idx;
+	u8 mac_addr[6];
+};
+
+enum vendor_hwconfig_tag {
+	ACS_TXOP_REQ =3D 0,
+	CHANNEL_ACCESS_REQ,
+	MAC_TIMESCALE_REQ,
+	CCA_THRESHOLD_REQ,
+	BWMODE_REQ,
+	CHIP_TEMP_GET_REQ,
+	AP_PS_LEVEL_SET_REQ,
+	CUSTOMIZED_FREQ_REQ,
+	WAKEUP_INFO_REQ,
+	KEEPALIVE_PKT_REQ,
+};
+
+enum {
+	BWMODE20M =3D 0,
+	BWMODE10M,
+	BWMODE5M,
+};
+
+struct mm_set_acs_txop_req {
+	u32 hwconfig_id;
+	u16 txop_bk;
+	u16 txop_be;
+	u16 txop_vi;
+	u16 txop_vo;
+};
+
+struct mm_set_channel_access_req {
+	u32 hwconfig_id;
+	u32 edca[4];
+	u8 vif_idx;
+	u8 retry_cnt;
+	u8 rts_en;
+	u8 long_nav_en;
+	u8 cfe_en;
+	u8 rc_retry_cnt[3];
+	s8 ccademod_th;
+};
+
+struct mm_set_mac_timescale_req {
+	u32 hwconfig_id;
+	u8 sifs_a_time;
+	u8 sifs_b_time;
+	u8 slot_time;
+	u8 rx_startdelay_ofdm;
+	u8 rx_startdelay_long;
+	u8 rx_startdelay_short;
+};
+
+struct mm_set_cca_threshold_req {
+	u32 hwconfig_id;
+	u8 auto_cca_en;
+	s8 cca20p_rise_th;
+	s8 cca20s_rise_th;
+	s8 cca20p_fall_th;
+	s8 cca20s_fall_th;
+};
+
+struct mm_set_bwmode_req {
+	u32 hwconfig_id;
+	u8 bwmode;
+};
+
+struct mm_get_chip_temp_req {
+	u32 hwconfig_id;
+};
+
+struct mm_get_chip_temp_cfm {
+	/// Temp degree val
+	s8 degree;
+};
+
+struct mm_set_ap_ps_level_req {
+	u32 hwconfig_id;
+	u8 ap_ps_level;
+};
+
+struct mm_set_vendor_hwconfig_cfm {
+	u32 hwconfig_id;
+	union {
+		struct mm_get_chip_temp_cfm chip_temp_cfm;
+	};
+};
+
+struct mm_set_customized_freq_req {
+	u32 hwconfig_id;
+	u16 raw_freq[4];
+	u16 map_freq[4];
+};
+
+struct mm_set_keepalive_req {
+	u32 hwconfig_id;
+	u16 code;
+	u16 length;
+	u32 intv;
+	u8 payload[];
+};
+
+struct mm_set_txop_req {
+	u16 txop_bk;
+	u16 txop_be;
+	u16 txop_vi;
+	u16 txop_vo;
+	u8 long_nav_en;
+	u8 cfe_en;
+};
+
+struct mm_set_wakeup_info_req {
+	u32 hwconfig_id;
+	u16 code;
+	u16 offset;
+	u16 length;
+	u16 length_win;
+	u8 mask_and_pattern[];
+};
+
+struct mm_get_fw_version_cfm {
+	u8 fw_version_len;
+	u8 fw_version[63];
+};
+
+struct mm_get_wifi_disable_cfm {
+	u8 wifi_disable;
+};
+
+enum vendor_swconfig_tag {
+	BCN_CFG_REQ =3D 0,
+	TEMP_COMP_SET_REQ,
+	TEMP_COMP_GET_REQ,
+	EXT_FLAGS_SET_REQ,
+	EXT_FLAGS_GET_REQ,
+	EXT_FLAGS_MASK_SET_REQ,
+};
+
+struct mm_set_bcn_cfg_req {
+	/// Ignore or not bcn tim bcmc bit
+	bool tim_bcmc_ignored_enable;
+};
+
+struct mm_set_bcn_cfg_cfm {
+	/// Request status
+	bool tim_bcmc_ignored_status;
+};
+
+struct mm_set_temp_comp_req {
+	/// Enable or not temp comp
+	u8 enable;
+	u8 reserved[3];
+	u32 tmr_period_ms;
+};
+
+struct mm_set_temp_comp_cfm {
+	/// Request status
+	u8 status;
+};
+
+struct mm_get_temp_comp_cfm {
+	/// Request status
+	u8 status;
+	/// Temp degree val
+	s8 degree;
+};
+
+struct mm_set_ext_flags_req {
+	u32 user_flags;
+};
+
+struct mm_set_ext_flags_cfm {
+	u32 user_flags;
+};
+
+struct mm_get_ext_flags_cfm {
+	u32 user_flags;
+};
+
+struct mm_mask_set_ext_flags_req {
+	u32 user_flags_mask;
+	u32 user_flags_val;
+};
+
+struct mm_mask_set_ext_flags_cfm {
+	u32 user_flags;
+};
+
+struct mm_set_vendor_swconfig_req {
+	u32 swconfig_id;
+	union {
+		struct mm_set_bcn_cfg_req bcn_cfg_req;
+		struct mm_set_temp_comp_req temp_comp_set_req;
+		struct mm_set_ext_flags_req ext_flags_set_req;
+		struct mm_mask_set_ext_flags_req ext_flags_mask_set_req;
+	};
+};
+
+struct mm_set_vendor_swconfig_cfm {
+	u32 swconfig_id;
+	union {
+		struct mm_set_bcn_cfg_cfm bcn_cfg_cfm;
+		struct mm_set_temp_comp_cfm temp_comp_set_cfm;
+		struct mm_get_temp_comp_cfm temp_comp_get_cfm;
+		struct mm_set_ext_flags_cfm ext_flags_set_cfm;
+		struct mm_get_ext_flags_cfm ext_flags_get_cfm;
+		struct mm_mask_set_ext_flags_cfm ext_flags_mask_set_cfm;
+	};
+};
+
+/// Structure containing the parameters of the @ref ME_RC_STATS_REQ messag=
e.
+struct me_rc_stats_req {
+	/// Index of the station for which the RC statistics are requested
+	u8 sta_idx;
+};
+
+/// Structure containing the rate control statistics
+struct rc_rate_stats {
+	/// Number of attempts (per sampling interval)
+	u16 attempts;
+	/// Number of success (per sampling interval)
+	u16 success;
+	/// Estimated probability of success (EWMA)
+	u16 probability;
+	/// Rate configuration of the sample
+	u16 rate_config;
+	union {
+		struct {
+			/// Number of times the sample has been skipped (per sampling
+			/// interval)
+			u8 sample_skipped;
+			/// Whether the old probability is available
+			bool old_prob_available;
+			/// Whether the rate can be used in the retry chain
+			bool rate_allowed;
+		};
+		struct {
+			/// RU size and UL length received in the latest HE trigger frame
+			u16 ru_and_length;
+		};
+	};
+};
+
+/// Number of RC samples
+#define RC_MAX_N_SAMPLE 10
+/// Index of the HE statistics element in the table
+#define RC_HE_STATS_IDX RC_MAX_N_SAMPLE
+
+/// Structure containing the parameters of the @ref ME_RC_STATS_CFM messag=
e.
+struct me_rc_stats_cfm {
+	/// Index of the station for which the RC statistics are provided
+	u8 sta_idx;
+	/// Number of samples used in the RC algorithm
+	u16 no_samples;
+	/// Number of MPDUs transmitted (per sampling interval)
+	u16 ampdu_len;
+	/// Number of AMPDUs transmitted (per sampling interval)
+	u16 ampdu_packets;
+	/// Average number of MPDUs in each AMPDU frame (EWMA)
+	u32 avg_ampdu_len;
+	// Current step 0 of the retry chain
+	u8 sw_retry_step;
+	/// Trial transmission period
+	u8 sample_wait;
+	/// Retry chain steps
+	u16 retry_step_idx[4];
+	/// RC statistics - Max number of RC samples, plus one for the HE TB
+	/// statistics
+	struct rc_rate_stats rate_stats[RC_MAX_N_SAMPLE + 1];
+	/// Throughput - Max number of RC samples, plus one for the HE TB statist=
ics
+	u32 tp[RC_MAX_N_SAMPLE + 1];
+};
+
+/// Structure containing the parameters of the @ref ME_RC_SET_RATE_REQ mes=
sage.
+struct me_rc_set_rate_req {
+	/// Index of the station for which the fixed rate is set
+	u8 sta_idx;
+	/// Rate configuration to be set
+	u16 fixed_rate_cfg;
+};
+
+/// Structure containing the parameters of the @ref ME_CONFIG_MONITOR_REQ
+/// message.
+struct me_config_monitor_req {
+	/// Channel to configure
+	struct mac_chan_op chan;
+	/// Is channel data valid
+	bool chan_set;
+	/// Enable report of unsupported HT frames
+	bool uf;
+	/// Enable auto-reply as the mac_addr matches
+	bool auto_reply;
+};
+
+/// Structure containing the parameters of the @ref ME_CONFIG_MONITOR_CFM
+/// message.
+struct me_config_monitor_cfm {
+	/// Channel context index
+	u8 chan_index;
+	/// Channel parameters
+	struct mac_chan_op chan;
+};
+
+/// Structure containing the parameters of the @ref ME_SET_PS_MODE_REQ mes=
sage.
+struct me_set_ps_mode_req {
+	/// Power Save is activated or deactivated
+	u8 ps_state;
+};
+
+/// Structure containing the parameters of the @ref ME_SET_LP_LEVEL_REQ me=
ssage.
+struct me_set_lp_level_req {
+	/// Low Power level
+	u8 lp_level;
+	u8 disable_filter;
+};
+
+//////////////////////////////////////////////////////////////////////////=
/////
+/////////// For SM messages
+//////////////////////////////////////////////////////////////////////////=
/////
+/// Message API of the SM task
+enum sm_msg_tag {
+	/// Request to connect to an AP
+	SM_CONNECT_REQ =3D LMAC_FIRST_MSG(TASK_SM),
+	/// Confirmation of connection
+	SM_CONNECT_CFM,
+	/// Indicates that the SM associated to the AP
+	SM_CONNECT_IND,
+	/// Request to disconnect
+	SM_DISCONNECT_REQ,
+	/// Confirmation of disconnection
+	SM_DISCONNECT_CFM,
+	/// Indicates that the SM disassociated the AP
+	SM_DISCONNECT_IND,
+	/// Request to start external authentication
+	SM_EXTERNAL_AUTH_REQUIRED_IND,
+	/// Response to external authentication request
+	SM_EXTERNAL_AUTH_REQUIRED_RSP,
+	/// Request to update assoc elements after FT over the air authentication
+	SM_FT_AUTH_IND,
+	/// Response to FT authentication with updated assoc elements
+	SM_FT_AUTH_RSP,
+
+	SM_RSP_TIMEOUT_IND,
+
+	SM_COEX_TS_TIMEOUT_IND,
+
+	SM_EXTERNAL_AUTH_REQUIRED_RSP_CFM,
+	/// MAX number of messages
+	SM_MAX,
+};
+
+/// Structure containing the parameters of @ref SM_CONNECT_REQ message.
+struct sm_connect_req {
+	/// SSID to connect to
+	struct mac_ssid ssid;
+	/// BSSID to connect to (if not specified, set this field to WILDCARD BSS=
ID)
+	struct mac_addr bssid;
+	/// Channel on which we have to connect (if not specified, set -1 in the
+	/// chan.freq field)
+	struct mac_chan_def chan;
+	/// Connection flags (see @ref mac_connection_flags)
+	u32 flags;
+	/// Control port Ethertype (in network endianness)
+	__be16 ctrl_port_ethertype;
+	/// Length of the association request IEs
+	u16 ie_len;
+	/// Listen interval to be used for this connection
+	u16 listen_interval;
+	/// Flag indicating if the we have to wait for the BC/MC traffic after
+	/// beacon or not
+	bool dont_wait_bcmc;
+	/// Authentication type
+	u8 auth_type;
+	/// UAPSD queues (bit0: VO, bit1: VI, bit2: BE, bit3: BK)
+	u8 uapsd_queues;
+	/// VIF index
+	u8 vif_idx;
+	/// Buffer containing the additional information elements to be put in th=
e
+	/// association request
+	u32 ie_buf[64];
+};
+
+/// Structure containing the parameters of the @ref SM_CONNECT_CFM message=
.
+struct sm_connect_cfm {
+	/// Status. If 0, it means that the connection procedure will be performe=
d
+	/// and that a subsequent @ref SM_CONNECT_IND message will be forwarded o=
nce
+	/// the procedure is completed
+	u8 status;
+};
+
+#define SM_ASSOC_IE_LEN 800
+/// Structure containing the parameters of the @ref SM_CONNECT_IND message=
.
+struct sm_connect_ind {
+	/// Status code of the connection procedure
+	u16 status_code;
+	/// BSSID
+	struct mac_addr bssid;
+	/// Flag indicating if the indication refers to an internal roaming or fr=
om
+	/// a host request
+	bool roamed;
+	/// Index of the VIF for which the association process is complete
+	u8 vif_idx;
+	/// Index of the STA entry allocated for the AP
+	u8 ap_idx;
+	/// Index of the LMAC channel context the connection is attached to
+	u8 ch_idx;
+	/// Flag indicating if the AP is supporting QoS
+	bool qos;
+	/// ACM bits set in the AP WMM parameter element
+	u8 acm;
+	/// Length of the AssocReq IEs
+	u16 assoc_req_ie_len;
+	/// Length of the AssocRsp IEs
+	u16 assoc_rsp_ie_len;
+	/// IE buffer
+	u32 assoc_ie_buf[SM_ASSOC_IE_LEN / 4];
+
+	u16 aid;
+	u8 band;
+	u16 center_freq;
+	u8 width;
+	u32 center_freq1;
+	u32 center_freq2;
+
+	/// EDCA parameters
+	u32 ac_param[AC_MAX];
+};
+
+/// Structure containing the parameters of the @ref SM_DISCONNECT_REQ mess=
age.
+struct sm_disconnect_req {
+	/// Reason of the deauthentication.
+	u16 reason_code;
+	/// Index of the VIF.
+	u8 vif_idx;
+};
+
+/// Structure containing the parameters of SM_ASSOCIATION_IND the message
+struct sm_association_ind {
+	// MAC ADDR of the STA
+	struct mac_addr me_mac_addr;
+};
+
+/// Structure containing the parameters of the @ref SM_DISCONNECT_IND mess=
age.
+struct sm_disconnect_ind {
+	/// Reason of the disconnection.
+	u16 reason_code;
+	/// Index of the VIF.
+	u8 vif_idx;
+	/// FT over DS is ongoing
+	bool ft_over_ds;
+	u8 reassoc;
+};
+
+/// Structure containing the parameters of the @ref
+/// SM_EXTERNAL_AUTH_REQUIRED_IND
+struct sm_external_auth_required_ind {
+	/// Index of the VIF.
+	u8 vif_idx;
+	/// SSID to authenticate to
+	struct mac_ssid ssid;
+	/// BSSID to authenticate to
+	struct mac_addr bssid;
+	/// AKM suite of the respective authentication
+	u32 akm;
+};
+
+/// Structure containing the parameters of the @ref
+/// SM_EXTERNAL_AUTH_REQUIRED_RSP
+struct sm_external_auth_required_rsp {
+	/// Index of the VIF.
+	u8 vif_idx;
+	/// Authentication status
+	u16 status;
+};
+
+//////////////////////////////////////////////////////////////////////////=
/////
+/////////// For APM messages
+//////////////////////////////////////////////////////////////////////////=
/////
+/// Message API of the APM task
+enum apm_msg_tag {
+	/// Request to start the AP.
+	APM_START_REQ =3D LMAC_FIRST_MSG(TASK_APM),
+	/// Confirmation of the AP start.
+	APM_START_CFM,
+	/// Request to stop the AP.
+	APM_STOP_REQ,
+	/// Confirmation of the AP stop.
+	APM_STOP_CFM,
+	/// Request to start CAC
+	APM_START_CAC_REQ,
+	/// Confirmation of the CAC start
+	APM_START_CAC_CFM,
+	/// Request to stop CAC
+	APM_STOP_CAC_REQ,
+	/// Confirmation of the CAC stop
+	APM_STOP_CAC_CFM,
+
+	APM_SET_BEACON_IE_REQ,
+	APM_SET_BEACON_IE_CFM,
+
+	/// MAX number of messages
+	APM_MAX,
+};
+
+/// Structure containing the parameters of the @ref APM_START_REQ message.
+struct apm_start_req {
+	/// Basic rate set
+	struct mac_rateset basic_rates;
+	/// Control channel on which we have to enable the AP
+	struct mac_chan_def chan;
+	/// Center frequency of the first segment
+	u32 center_freq1;
+	/// Center frequency of the second segment (only in 80+80 configuration)
+	u32 center_freq2;
+	/// Width of channel
+	u8 ch_width;
+	/// Address, in host memory, to the beacon template
+	u32 bcn_addr;
+	/// Length of the beacon template
+	u16 bcn_len;
+	/// Offset of the TIM IE in the beacon
+	u16 tim_oft;
+	/// Beacon interval
+	u16 bcn_int;
+	/// Flags (@ref mac_connection_flags)
+	u32 flags;
+	/// Control port Ethertype
+	__be16 ctrl_port_ethertype;
+	/// Length of the TIM IE
+	u8 tim_len;
+	/// Index of the VIF for which the AP is started
+	u8 vif_idx;
+};
+
+struct apm_set_bcn_ie_req {
+	u8 vif_idx;
+	u16 bcn_ie_len;
+	u8 bcn_ie[512];
+};
+
+/// Structure containing the parameters of the @ref APM_START_CFM message.
+struct apm_start_cfm {
+	/// Status of the AP starting procedure
+	u8 status;
+	/// Index of the VIF for which the AP is started
+	u8 vif_idx;
+	/// Index of the channel context attached to the VIF
+	u8 ch_idx;
+	/// Index of the STA used for BC/MC traffic
+	u8 bcmc_idx;
+};
+
+/// Structure containing the parameters of the @ref APM_STOP_REQ message.
+struct apm_stop_req {
+	/// Index of the VIF for which the AP has to be stopped
+	u8 vif_idx;
+};
+
+/// Structure containing the parameters of the @ref APM_START_CAC_REQ mess=
age.
+struct apm_start_cac_req {
+	/// Control channel on which we have to start the CAC
+	struct mac_chan_def chan;
+	/// Center frequency of the first segment
+	u32 center_freq1;
+	/// Center frequency of the second segment (only in 80+80 configuration)
+	u32 center_freq2;
+	/// Width of channel
+	u8 ch_width;
+	/// Index of the VIF for which the CAC is started
+	u8 vif_idx;
+};
+
+/// Structure containing the parameters of the @ref APM_START_CAC_CFM mess=
age.
+struct apm_start_cac_cfm {
+	/// Status of the CAC starting procedure
+	u8 status;
+	/// Index of the channel context attached to the VIF for CAC
+	u8 ch_idx;
+};
+
+/// Structure containing the parameters of the @ref APM_STOP_CAC_REQ messa=
ge.
+struct apm_stop_cac_req {
+	/// Index of the VIF for which the CAC has to be stopped
+	u8 vif_idx;
+};
+
+//////////////////////////////////////////////////////////////////////////=
/////
+/////////// For MESH messages
+//////////////////////////////////////////////////////////////////////////=
/////
+
+/// Maximum length of the Mesh ID
+#define MESH_MESHID_MAX_LEN (32)
+
+/// Message API of the MESH task
+enum mesh_msg_tag {
+	/// Request to start the MP
+	MESH_START_REQ =3D LMAC_FIRST_MSG(TASK_MESH),
+	/// Confirmation of the MP start.
+	MESH_START_CFM,
+
+	/// Request to stop the MP.
+	MESH_STOP_REQ,
+	/// Confirmation of the MP stop.
+	MESH_STOP_CFM,
+
+	// Request to update the MP
+	MESH_UPDATE_REQ,
+	/// Confirmation of the MP update
+	MESH_UPDATE_CFM,
+
+	/// Request information about a given link
+	MESH_PEER_INFO_REQ,
+	/// Response to the MESH_PEER_INFO_REQ message
+	MESH_PEER_INFO_CFM,
+
+	/// Request automatic establishment of a path with a given mesh STA
+	MESH_PATH_CREATE_REQ,
+	/// Confirmation to the MESH_PATH_CREATE_REQ message
+	MESH_PATH_CREATE_CFM,
+
+	/// Request a path update (delete path, modify next hop mesh STA)
+	MESH_PATH_UPDATE_REQ,
+	/// Confirmation to the MESH_PATH_UPDATE_REQ message
+	MESH_PATH_UPDATE_CFM,
+
+	/// Indication from Host that the indicated Mesh Interface is a proxy for=
 an
+	/// external STA
+	MESH_PROXY_ADD_REQ,
+
+	/// Indicate that a connection has been established or lost
+	MESH_PEER_UPDATE_IND,
+	/// Notification that a connection has been established or lost (when MPM
+	/// handled by userspace)
+	MESH_PEER_UPDATE_NTF =3D MESH_PEER_UPDATE_IND,
+
+	/// Indicate that a path is now active or inactive
+	MESH_PATH_UPDATE_IND,
+	/// Indicate that proxy information have been updated
+	MESH_PROXY_UPDATE_IND,
+
+	/// MAX number of messages
+	MESH_MAX,
+};
+
+/// Structure containing the parameters of the @ref MESH_START_REQ message=
.
+struct mesh_start_req {
+	/// Basic rate set
+	struct mac_rateset basic_rates;
+	/// Control channel on which we have to enable the AP
+	struct mac_chan_def chan;
+	/// Center frequency of the first segment
+	u32 center_freq1;
+	/// Center frequency of the second segment (only in 80+80 configuration)
+	u32 center_freq2;
+	/// Width of channel
+	u8 ch_width;
+	/// DTIM Period
+	u8 dtim_period;
+	/// Beacon Interval
+	u16 bcn_int;
+	/// Index of the VIF for which the MP is started
+	u8 vif_index;
+	/// Length of the Mesh ID
+	u8 mesh_id_len;
+	/// Mesh ID
+	u8 mesh_id[MESH_MESHID_MAX_LEN];
+	/// Address of the IEs to download
+	u32 ie_addr;
+	/// Length of the provided IEs
+	u8 ie_len;
+	/// Indicate if Mesh Peering Management (MPM) protocol is handled in
+	/// userspace
+	bool user_mpm;
+	/// Indicate if Mesh Point is using authentication
+	bool is_auth;
+	/// Indicate which authentication method is used
+	u8 auth_id;
+};
+
+/// Structure containing the parameters of the @ref MESH_START_CFM message=
.
+struct mesh_start_cfm {
+	/// Status of the MP starting procedure
+	u8 status;
+	/// Index of the VIF for which the MP is started
+	u8 vif_idx;
+	/// Index of the channel context attached to the VIF
+	u8 ch_idx;
+	/// Index of the STA used for BC/MC traffic
+	u8 bcmc_idx;
+};
+
+/// Structure containing the parameters of the @ref MESH_STOP_REQ message.
+struct mesh_stop_req {
+	/// Index of the VIF for which the MP has to be stopped
+	u8 vif_idx;
+};
+
+/// Structure containing the parameters of the @ref MESH_STOP_CFM message.
+struct mesh_stop_cfm {
+	/// Index of the VIF for which the MP has to be stopped
+	u8 vif_idx;
+	/// Status
+	u8 status;
+};
+
+/// Bit fields for mesh_update_req message's flags value
+enum mesh_update_flags_bit {
+	/// Root Mode
+	MESH_UPDATE_FLAGS_ROOT_MODE_BIT =3D 0,
+	/// Gate Mode
+	MESH_UPDATE_FLAGS_GATE_MODE_BIT,
+	/// Mesh Forwarding
+	MESH_UPDATE_FLAGS_MESH_FWD_BIT,
+	/// Local Power Save Mode
+	MESH_UPDATE_FLAGS_LOCAL_PSM_BIT,
+};
+
+/// Structure containing the parameters of the @ref MESH_UPDATE_REQ messag=
e.
+struct mesh_update_req {
+	/// Flags, indicate fields which have been updated
+	u8 flags;
+	/// VIF Index
+	u8 vif_idx;
+	/// Root Mode
+	u8 root_mode;
+	/// Gate Announcement
+	bool gate_announ;
+	/// Mesh Forwarding
+	bool mesh_forward;
+	/// Local PS Mode
+	u8 local_ps_mode;
+};
+
+/// Structure containing the parameters of the @ref MESH_UPDATE_CFM messag=
e.
+struct mesh_update_cfm {
+	/// Status
+	u8 status;
+};
+
+/// Structure containing the parameters of the @ref MESH_PEER_INFO_REQ mes=
sage.
+struct mesh_peer_info_req {
+	/// Index of the station allocated for the peer
+	u8 sta_idx;
+};
+
+/// Structure containing the parameters of the @ref MESH_PEER_INFO_CFM mes=
sage.
+struct mesh_peer_info_cfm {
+	/// Response status
+	u8 status;
+	/// Index of the station allocated for the peer
+	u8 sta_idx;
+	/// Local Link ID
+	u16 local_link_id;
+	/// Peer Link ID
+	u16 peer_link_id;
+	/// Local PS Mode
+	u8 local_ps_mode;
+	/// Peer PS Mode
+	u8 peer_ps_mode;
+	/// Non-peer PS Mode
+	u8 non_peer_ps_mode;
+	/// Link State
+	u8 link_state;
+};
+
+/// Structure containing the parameters of the @ref MESH_PATH_CREATE_REQ
+/// message.
+struct mesh_path_create_req {
+	/// Index of the interface on which path has to be created
+	u8 vif_idx;
+	/// Indicate if originator MAC Address is provided
+	bool has_orig_addr;
+	/// Path Target MAC Address
+	struct mac_addr tgt_mac_addr;
+	/// Originator MAC Address
+	struct mac_addr orig_mac_addr;
+};
+
+/// Structure containing the parameters of the @ref MESH_PATH_CREATE_CFM
+/// message.
+struct mesh_path_create_cfm {
+	/// Confirmation status
+	u8 status;
+	/// VIF Index
+	u8 vif_idx;
+};
+
+/// Structure containing the parameters of the @ref MESH_PATH_UPDATE_REQ
+/// message.
+struct mesh_path_update_req {
+	/// Indicate if path must be deleted
+	bool delete;
+	/// Index of the interface on which path has to be created
+	u8 vif_idx;
+	/// Path Target MAC Address
+	struct mac_addr tgt_mac_addr;
+	/// Next Hop MAC Address
+	struct mac_addr nhop_mac_addr;
+};
+
+/// Structure containing the parameters of the @ref MESH_PATH_UPDATE_CFM
+/// message.
+struct mesh_path_update_cfm {
+	/// Confirmation status
+	u8 status;
+	/// VIF Index
+	u8 vif_idx;
+};
+
+/// Structure containing the parameters of the @ref MESH_PROXY_ADD_REQ mes=
sage.
+struct mesh_proxy_add_req {
+	/// VIF Index
+	u8 vif_idx;
+	/// MAC Address of the External STA
+	struct mac_addr ext_sta_addr;
+};
+
+/// Structure containing the parameters of the @ref MESH_PROXY_UPDATE_IND
+struct mesh_proxy_update_ind {
+	/// Indicate if proxy information has been added or deleted
+	bool delete;
+	/// Indicate if we are a proxy for the external STA
+	bool local;
+	/// VIF Index
+	u8 vif_idx;
+	/// MAC Address of the External STA
+	struct mac_addr ext_sta_addr;
+	/// MAC Address of the proxy (only valid if local is false)
+	struct mac_addr proxy_mac_addr;
+};
+
+/// Structure containing the parameters of the @ref MESH_PEER_UPDATE_IND
+/// message.
+struct mesh_peer_update_ind {
+	/// Indicate if connection has been established or lost
+	bool estab;
+	/// VIF Index
+	u8 vif_idx;
+	/// STA Index
+	u8 sta_idx;
+	/// Peer MAC Address
+	struct mac_addr peer_addr;
+};
+
+/// Structure containing the parameters of the @ref MESH_PEER_UPDATE_NTF
+/// message.
+struct mesh_peer_update_ntf {
+	/// VIF Index
+	u8 vif_idx;
+	/// STA Index
+	u8 sta_idx;
+	/// Mesh Link State
+	u8 state;
+};
+
+/// Structure containing the parameters of the @ref MESH_PATH_UPDATE_IND
+/// message.
+struct mesh_path_update_ind {
+	/// Indicate if path is deleted or not
+	bool delete;
+	/// Indicate if path is towards an external STA (not part of MBSS)
+	bool ext_sta;
+	/// VIF Index
+	u8 vif_idx;
+	/// Path Index
+	u8 path_idx;
+	/// Target MAC Address
+	struct mac_addr tgt_mac_addr;
+	/// External STA MAC Address (only if ext_sta is true)
+	struct mac_addr ext_sta_mac_addr;
+	/// Next Hop STA Index
+	u8 nhop_sta_idx;
+};
+
+//////////////////////////////////////////////////////////////////////////=
/////
+/////////// For Debug messages
+//////////////////////////////////////////////////////////////////////////=
/////
+
+/// Messages related to Debug Task
+enum dbg_msg_tag {
+	/// Memory read request
+	DBG_MEM_READ_REQ =3D LMAC_FIRST_MSG(TASK_DBG),
+	/// Memory read confirm
+	DBG_MEM_READ_CFM,
+	/// Memory write request
+	DBG_MEM_WRITE_REQ,
+	/// Memory write confirm
+	DBG_MEM_WRITE_CFM,
+	/// Module filter request
+	DBG_SET_MOD_FILTER_REQ,
+	/// Module filter confirm
+	DBG_SET_MOD_FILTER_CFM,
+	/// Severity filter request
+	DBG_SET_SEV_FILTER_REQ,
+	/// Severity filter confirm
+	DBG_SET_SEV_FILTER_CFM,
+	/// LMAC/MAC HW fatal error indication
+	DBG_ERROR_IND,
+	/// Request to get system statistics
+	DBG_GET_SYS_STAT_REQ,
+	/// COnfirmation of system statistics
+	DBG_GET_SYS_STAT_CFM,
+	/// Memory block write request
+	DBG_MEM_BLOCK_WRITE_REQ,
+	/// Memory block write confirm
+	DBG_MEM_BLOCK_WRITE_CFM,
+	/// Start app request
+	DBG_START_APP_REQ,
+	/// Start app confirm
+	DBG_START_APP_CFM,
+	/// Start npc request
+	DBG_START_NPC_REQ,
+	/// Start npc confirm
+	DBG_START_NPC_CFM,
+	/// Memory mask write request
+	DBG_MEM_MASK_WRITE_REQ,
+	/// Memory mask write confirm
+	DBG_MEM_MASK_WRITE_CFM,
+
+	DBG_RFTEST_CMD_REQ,
+	DBG_RFTEST_CMD_CFM,
+	DBG_BINDING_REQ,
+	DBG_BINDING_CFM,
+	DBG_BINDING_IND,
+
+	DBG_CUSTOM_MSG_REQ,
+	DBG_CUSTOM_MSG_CFM,
+	DBG_CUSTOM_MSG_IND,
+
+	DBG_GPIO_WRITE_REQ,
+	DBG_GPIO_WRITE_CFM,
+	DBG_GPIO_READ_REQ,
+	DBG_GPIO_READ_CFM,
+	DBG_GPIO_INIT_REQ,
+	DBG_GPIO_INIT_CFM,
+
+	/// EF usrdata read request
+	DBG_EF_USRDATA_READ_REQ,
+	/// EF usrdata read confirm
+	DBG_EF_USRDATA_READ_CFM,
+	/// Memory block read request
+	DBG_MEM_BLOCK_READ_REQ,
+	/// Memory block read confirm
+	DBG_MEM_BLOCK_READ_CFM,
+
+	DBG_PWM_INIT_REQ,
+	DBG_PWM_INIT_CFM,
+	DBG_PWM_DEINIT_REQ,
+	DBG_PWM_DEINIT_CFM,
+
+	/// Max number of Debug messages
+	DBG_MAX,
+};
+
+/// Structure containing the parameters of the @ref DBG_MEM_READ_REQ messa=
ge.
+struct dbg_mem_read_req {
+	u32 memaddr;
+};
+
+/// Structure containing the parameters of the @ref DBG_MEM_READ_CFM messa=
ge.
+struct dbg_mem_read_cfm {
+	u32 memaddr;
+	u32 memdata;
+};
+
+/// Structure containing the parameters of the @ref DBG_MEM_WRITE_REQ mess=
age.
+struct dbg_mem_write_req {
+	u32 memaddr;
+	u32 memdata;
+};
+
+/// Structure containing the parameters of the @ref DBG_MEM_WRITE_CFM mess=
age.
+struct dbg_mem_write_cfm {
+	u32 memaddr;
+	u32 memdata;
+};
+
+/// Structure containing the parameters of the @ref DBG_MEM_MASK_WRITE_REQ
+/// message.
+struct dbg_mem_mask_write_req {
+	u32 memaddr;
+	u32 memmask;
+	u32 memdata;
+};
+
+/// Structure containing the parameters of the @ref DBG_MEM_MASK_WRITE_CFM
+/// message.
+struct dbg_mem_mask_write_cfm {
+	u32 memaddr;
+	u32 memdata;
+};
+
+struct dbg_rftest_cmd_req {
+	u32 cmd;
+	u32 argc;
+	u8 argv[30];
+};
+
+struct dbg_rftest_cmd_cfm {
+	u32 rftest_result[18];
+};
+
+struct dbg_gpio_write_req {
+	u8 gpio_idx;
+	u8 gpio_val;
+};
+
+struct dbg_gpio_read_req {
+	u8 gpio_idx;
+};
+
+struct dbg_gpio_read_cfm {
+	u8 gpio_idx;
+	u8 gpio_val;
+};
+
+struct dbg_gpio_init_req {
+	u8 gpio_idx;
+	u8 gpio_dir; // 1 output, 0 input;
+	u8 gpio_val; // for output, 1 high, 0 low;
+};
+
+/// Structure containing the parameters of the @ref DBG_SET_MOD_FILTER_REQ
+/// message.
+struct dbg_set_mod_filter_req {
+	/// Bit field indicating for each module if the traces are enabled or not
+	u32 mod_filter;
+};
+
+/// Structure containing the parameters of the @ref DBG_SEV_MOD_FILTER_REQ
+/// message.
+struct dbg_set_sev_filter_req {
+	/// Bit field indicating the severity threshold for the traces
+	u32 sev_filter;
+};
+
+/// Structure containing the parameters of the @ref DBG_GET_SYS_STAT_CFM
+/// message.
+struct dbg_get_sys_stat_cfm {
+	/// Time spent in CPU sleep since last reset of the system statistics
+	u32 cpu_sleep_time;
+	/// Time spent in DOZE since last reset of the system statistics
+	u32 doze_time;
+	/// Total time spent since last reset of the system statistics
+	u32 stats_time;
+};
+
+/// Structure containing the parameters of the @ref DBG_MEM_BLOCK_WRITE_RE=
Q
+/// message.
+struct dbg_mem_block_write_req {
+	u32 memaddr;
+	u32 memsize;
+	u32 memdata[1024 / sizeof(u32)];
+};
+
+/// Structure containing the parameters of the @ref DBG_MEM_BLOCK_WRITE_CF=
M
+/// message.
+struct dbg_mem_block_write_cfm {
+	u32 wstatus;
+};
+
+/// Structure containing the parameters of the @ref DBG_START_APP_REQ mess=
age.
+struct dbg_start_app_req {
+	u32 bootaddr;
+	u32 boottype;
+};
+
+/// Structure containing the parameters of the @ref DBG_START_APP_CFM mess=
age.
+struct dbg_start_app_cfm {
+	u32 bootstatus;
+};
+
+enum {
+	HOST_START_APP_AUTO =3D 1,
+	HOST_START_APP_CUSTOM,
+	HOST_START_APP_FNCALL =3D 4,
+	HOST_START_APP_DUMMY =3D 5,
+};
+
+//////////////////////////////////////////////////////////////////////////=
/////
+/////////// For TDLS messages
+//////////////////////////////////////////////////////////////////////////=
/////
+
+/// List of messages related to the task.
+enum tdls_msg_tag {
+	/// TDLS channel Switch Request.
+	TDLS_CHAN_SWITCH_REQ =3D LMAC_FIRST_MSG(TASK_TDLS),
+	/// TDLS channel switch confirmation.
+	TDLS_CHAN_SWITCH_CFM,
+	/// TDLS channel switch indication.
+	TDLS_CHAN_SWITCH_IND,
+	/// TDLS channel switch to base channel indication.
+	TDLS_CHAN_SWITCH_BASE_IND,
+	/// TDLS cancel channel switch request.
+	TDLS_CANCEL_CHAN_SWITCH_REQ,
+	/// TDLS cancel channel switch confirmation.
+	TDLS_CANCEL_CHAN_SWITCH_CFM,
+	/// TDLS peer power save indication.
+	TDLS_PEER_PS_IND,
+	/// TDLS peer traffic indication request.
+	TDLS_PEER_TRAFFIC_IND_REQ,
+	/// TDLS peer traffic indication confirmation.
+	TDLS_PEER_TRAFFIC_IND_CFM,
+
+	/// MAX number of messages
+	TDLS_MAX
+};
+
+/// Structure containing the parameters of the @ref TDLS_CHAN_SWITCH_REQ m=
essage
+struct tdls_chan_switch_req {
+	/// Index of the VIF
+	u8 vif_index;
+	/// STA Index
+	u8 sta_idx;
+	/// MAC address of the TDLS station
+	struct mac_addr peer_mac_addr;
+	bool initiator;
+	/// Band (2.4GHz or 5GHz)
+	u8 band;
+	/// Channel type: 20,40,80,160 or 80+80 MHz
+	u8 type;
+	/// Frequency for Primary 20MHz channel (in MHz)
+	u16 prim20_freq;
+	/// Frequency for Center of the contiguous channel or center of Primary
+	/// 80+80
+	u16 center1_freq;
+	/// Frequency for Center of the non-contiguous secondary 80+80
+	u16 center2_freq;
+	/// TX power (in dBm)
+	s8 tx_power;
+	/// Operating class
+	u8 op_class;
+};
+
+/// Structure containing the parameters of the @ref TDLS_CANCEL_CHAN_SWITC=
H_REQ
+/// message
+struct tdls_cancel_chan_switch_req {
+	/// Index of the VIF
+	u8 vif_index;
+	/// STA Index
+	u8 sta_idx;
+	/// MAC address of the TDLS station
+	struct mac_addr peer_mac_addr;
+};
+
+/// Structure containing the parameters of the @ref TDLS_CHAN_SWITCH_CFM m=
essage
+struct tdls_chan_switch_cfm {
+	/// Status of the operation
+	u8 status;
+};
+
+/// Structure containing the parameters of the @ref TDLS_CANCEL_CHAN_SWITC=
H_CFM
+/// message
+struct tdls_cancel_chan_switch_cfm {
+	/// Status of the operation
+	u8 status;
+};
+
+/// Structure containing the parameters of the @ref TDLS_CHAN_SWITCH_IND m=
essage
+struct tdls_chan_switch_ind {
+	/// VIF Index
+	u8 vif_index;
+	/// Channel Context Index
+	u8 chan_ctxt_index;
+	/// Status of the operation
+	u8 status;
+};
+
+/// Structure containing the parameters of the @ref TDLS_CHAN_SWITCH_BASE_=
IND
+/// message
+struct tdls_chan_switch_base_ind {
+	/// VIF Index
+	u8 vif_index;
+	/// Channel Context index
+	u8 chan_ctxt_index;
+};
+
+/// Structure containing the parameters of the @ref TDLS_PEER_PS_IND messa=
ge
+struct tdls_peer_ps_ind {
+	/// VIF Index
+	u8 vif_index;
+	/// STA Index
+	u8 sta_idx;
+	/// MAC ADDR of the TDLS STA
+	struct mac_addr peer_mac_addr;
+	/// Flag to indicate if the TDLS peer is going to sleep
+	bool ps_on;
+};
+
+/// Structure containing the parameters of the @ref TDLS_PEER_TRAFFIC_IND_=
REQ
+/// message
+struct tdls_peer_traffic_ind_req {
+	/// VIF Index
+	u8 vif_index;
+	/// STA Index
+	u8 sta_idx;
+	// MAC ADDR of the TDLS STA
+	struct mac_addr peer_mac_addr;
+	/// Dialog token
+	u8 dialog_token;
+	/// TID of the latest MPDU transmitted over the TDLS direct link to the T=
DLS
+	/// STA
+	u8 last_tid;
+	/// Sequence number of the latest MPDU transmitted over the TDLS direct l=
ink
+	/// to the TDLS STA
+	u16 last_sn;
+};
+
+/// Structure containing the parameters of the @ref TDLS_PEER_TRAFFIC_IND_=
CFM
+/// message
+struct tdls_peer_traffic_ind_cfm {
+	/// Status of the operation
+	u8 status;
+};
+
+#endif // LMAC_MSG_H_
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/lmac_types.h b/drivers/n=
et/wireless/aic/aic8800_fdrv/lmac_types.h
new file mode 100644
index 000000000000..2f486f0d3389
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/lmac_types.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *************************************************************************=
***************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @file co_types.h
+ *
+ * @brief Provides the kernel fixed-width types used by LMAC interfaces.
+ *
+ *************************************************************************=
***************
+ */
+
+#ifndef _LMAC_INT_H_
+#define _LMAC_INT_H_
+
+#include <linux/types.h>
+#include <linux/bits.h>
+
+/// @} CO_INT
+#endif // _LMAC_INT_H_
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/sdio_host.c b/drivers/ne=
t/wireless/aic/aic8800_fdrv/sdio_host.c
new file mode 100644
index 000000000000..24408fbac3d0
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/sdio_host.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *************************************************************************=
***************
+ *
+ * Copyright (C) 2020 AIC semiconductor.
+ *
+ * @file sdio_host.c
+ *
+ * @brief SDIO host function declarations
+ *
+ *************************************************************************=
***************
+ */
+
+#include "sdio_host.h"
+#include "aicwf_platform.h"
+#include "aicwf_tx.h"
+
+/*
+ *************************************************************************=
***************
+ */
+void aicwf_sdio_host_init(struct sdio_host_env_tag *env, void *cb,
+			  void *shared_env_ptr, void *pthis)
+{
+	// Reset the environments
+
+	// Reset the Host environment
+	memset(env, 0, sizeof(struct sdio_host_env_tag));
+	// Save the pointer to the register base
+	env->pthis =3D pthis;
+}
+
+/*
+ *************************************************************************=
***************
+ */
+struct txdesc_host *
+aicwf_sdio_host_txdesc_get(struct sdio_host_env_tag *env, const int queue_=
idx)
+{
+	struct txdesc_host *txdesc_free =3D NULL;
+	u32 used_idx =3D env->txdesc_used_idx[queue_idx];
+	u32 free_idx =3D env->txdesc_free_idx[queue_idx];
+
+	// Check if a free descriptor is available
+	if (free_idx !=3D (used_idx + SDIO_TXDESC_CNT)) {
+		// Get the pointer to the first free descriptor
+		// txdesc_free =3D shared_env_ptr->txdesc[queue_idx] + (free_idx %
+		// IPC_TXDESC_CNT);
+	} else {
+		txdesc_free =3D NULL;
+	}
+
+	return txdesc_free;
+}
+
+/*
+ *************************************************************************=
***************
+ */
+void aicwf_sdio_host_txdesc_push(struct sdio_host_env_tag *env,
+				 const int queue_idx, const uint64_t host_id)
+{
+	// Save the host id in the environment
+	env->tx_host_id[queue_idx][env->txdesc_free_idx[queue_idx] %
+							   SDIO_TXDESC_CNT] =3D host_id;
+
+	// Increment the index
+	env->txdesc_free_idx[queue_idx]++;
+	if (env->txdesc_free_idx[queue_idx] =3D=3D 0x80000000)
+		env->txdesc_free_idx[queue_idx] =3D 0;
+}
+
+/*
+ *************************************************************************=
***************
+ */
+void aicwf_sdio_host_tx_cfm_handler(struct sdio_host_env_tag *env, u32 *da=
ta)
+{
+	u32 queue_idx =3D 0;
+	struct sk_buff *skb =3D NULL;
+	struct aicwf_txhdr *txhdr;
+
+	// Get the used index and increase it. We do the increase before knowing =
if
+	// the current buffer is confirmed because the callback function may call
+	// the ipc_host_txdesc_get() in case flow control was enabled and the ind=
ex
+	// has to be already at the good value to ensure that the test of FIFO fu=
ll
+	// is correct
+	u32 used_idx =3D data[1];
+	unsigned long host_id =3D
+		env->tx_host_id[queue_idx][used_idx % SDIO_TXDESC_CNT];
+
+	// Reset the host id in the array
+	env->tx_host_id[queue_idx][used_idx % SDIO_TXDESC_CNT] =3D 0;
+
+	// call the external function to indicate that a TX packet is freed
+	if (host_id =3D=3D 0) {
+		// No more confirmations, so put back the used index at its initial
+		// value
+		env->txdesc_used_idx[queue_idx] =3D used_idx;
+		pr_err_ratelimited("ERROR:No more confirmations\n");
+		return;
+	}
+	// set the cfm status
+	skb =3D (struct sk_buff *)host_id;
+	txhdr =3D (struct aicwf_txhdr *)skb->data;
+	txhdr->hw_hdr.cfm.status =3D (union aicwf_hw_txstatus)data[0];
+	pr_debug("sdio_host_tx_cfm_handler:used_idx=3D%d, 0x%p, status=3D%x\n",
+		 used_idx, env->pthis, txhdr->hw_hdr.cfm.status.value);
+	// if (env->cb.send_data_cfm(env->pthis, host_id) !=3D 0)
+	if (aicwf_txdatacfm(env->pthis, (void *)host_id) !=3D 0) {
+		// No more confirmations, so put back the used index at its initial
+		// value
+		env->txdesc_used_idx[queue_idx] =3D used_idx;
+		env->tx_host_id[queue_idx][used_idx % SDIO_TXDESC_CNT] =3D host_id;
+		// and exit the loop
+		pr_err("ERROR:aicwf_txdatacfm,\n");
+	}
+}
+
+int aicwf_sdio_platform_init(struct aic_sdio_dev *sdiodev)
+{
+	struct aicwf_plat *aicwf_plat =3D NULL;
+	void *drvdata;
+	int ret =3D -ENODEV;
+
+	aicwf_plat =3D kzalloc_obj(*aicwf_plat, GFP_KERNEL);
+
+	if (!aicwf_plat)
+		return -ENOMEM;
+
+	aicwf_plat->sdiodev =3D sdiodev;
+	ret =3D aicwf_platform_init(aicwf_plat, &drvdata);
+	if (ret) {
+		kfree(aicwf_plat);
+		return ret;
+	}
+	sdiodev->plat =3D aicwf_plat;
+
+	return ret;
+}
diff --git a/drivers/net/wireless/aic/aic8800_fdrv/sdio_host.h b/drivers/ne=
t/wireless/aic/aic8800_fdrv/sdio_host.h
new file mode 100644
index 000000000000..bbe911c2d5fc
--- /dev/null
+++ b/drivers/net/wireless/aic/aic8800_fdrv/sdio_host.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 AIC semiconductor.
+ */
+
+#ifndef _SDIO_HOST_H_
+#define _SDIO_HOST_H_
+
+#include "aicwf_sdio.h"
+#include "lmac_types.h"
+
+#define SDIO_TXQUEUE_CNT NX_TXQ_CNT
+#define SDIO_TXDESC_CNT  NX_TXDESC_CNT
+
+/// Definition of the IPC Host environment structure.
+struct sdio_host_env_tag {
+	// Index used that points to the first free TX desc
+	u32 txdesc_free_idx[SDIO_TXQUEUE_CNT];
+	// Index used that points to the first used TX desc
+	u32 txdesc_used_idx[SDIO_TXQUEUE_CNT];
+	// Array storing the currently pushed host ids, per IPC queue
+	u64 tx_host_id[SDIO_TXQUEUE_CNT][SDIO_TXDESC_CNT];
+
+	/// Pointer to the attached object (used in callbacks and register access=
es)
+	void *pthis;
+};
+
+struct txdesc_host *
+aicwf_sdio_host_txdesc_get(struct sdio_host_env_tag *env, const int queue_=
idx);
+
+void aicwf_sdio_host_init(struct sdio_host_env_tag *env, void *cb,
+			  void *shared_env_ptr, void *pthis);
+
+void aicwf_sdio_host_txdesc_push(struct sdio_host_env_tag *env,
+				 const int queue_idx,
+				 const uint64_t host_id);
+
+void aicwf_sdio_host_tx_cfm_handler(struct sdio_host_env_tag *env,
+				    u32 *data);
+
+int aicwf_sdio_platform_init(struct aic_sdio_dev *sdiodev);
+
+#endif
