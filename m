Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4B9599A52
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889480; cv=none; b=j53H5LBszXhlvOcIL5G6DQsuTmiY4cnn5gOWG0vaOvDsTcTLWkf62WWEds5rpVx2zjynPS/0H4pOt2qGT4b1mDaQYY4mZLFiWtyMaxJ1K51CIc6bIX45qi80Mnkho/caCVRkf9XyGYPZHvHrH6G26QxiWXaAmCHL6U8fLwsx+X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889480; c=relaxed/simple;
	bh=hc6ZuX7B5l+uxCyGyy0uxZcdQDBI+zQbtClyyGJbFxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RyKh6jbJmJjpO6ClKNA/dqnzZ/DSh+KF2Vt9Tvx3qIgH06MpeOrmvt3TQiZ5ZArvoAa0nusm5LvMMcm5z+UTQPmWcPmEAZnx1V4jN/ECE5qLMY+PIsgnw6M+1HGaWR/6ckUhGQ7yBCm/b29MQjlRVC3GeZjatrJQNVgZ//lOeoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOzCEftI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOzCEftI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so40069455e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889476; x=1789494276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LV0nGy7Prgird+t9YLnwanXWuEc7A0E5cLswUODru1c=;
        b=TOzCEftIKhEqtLSPEYeGsCQUHBLCz4IvZ3qOnxz0YFXOazoA5m0CY+zmw+uf8LDKIU
         RnY8qGOhUCTVyqITzGyofpcWQgO9tqbmlHk3yHuSidk0P1NqCJZ18euj4+73W+2DK7hR
         2SQanr3r/sXQBi6D8F2dLGTZMhM83aFftb5ZRGaaBx8u9xEgJ/vvTDOD4ijIAYaTOp4z
         sR8giExiVHR2eI81DvYX3/ql89oIKBV8/hy/rl+K3lvIe//qix1d0z8UBxOiCLsNa//9
         KN3LdWOWJsiIa9gECn1LToOpA0psYKvE5PXa7KuyVq7dzHu5mc2yIDuhuo2IokpVzd+X
         t6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889476; x=1789494276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LV0nGy7Prgird+t9YLnwanXWuEc7A0E5cLswUODru1c=;
        b=fyM99dF1oZCq/m7FrYu7xYLu8z24+cFiN3VlN/rW0bbj0VVlAaDwThs/qa3AGy6FqX
         o35MgzqN2uhtAJCEjaTZwZukdAidrRusjXjnOHiX8e01TO7vtszcPs7SknebysUiEjB7
         GWKoOc/DiBpCkVqWbUoNUlhCvJq+OFcPMU7zSeqSmoZROkXB37sxpkQyCgt8bOO01uRI
         baE4CnCC8hss1RAPVq8QjaJvmvkOj/b99Vzhq5S9HYTcP8fWbxJyulrJvchf5IrnTHpT
         FnO2e8k9ja6bK+D6MXBJ/Qo2hDIppfimwiiKf3g5rlCykRQ622t3GciCFSpO48Tm5t4Y
         dHVw==
X-Forwarded-Encrypted: i=1; AKwUvBwpTrJS7Zs4tjlON2dD1Bc6uKxuQ6VvLgZoCdPGxZ+h57V7APIw54v68VR9adaTxfGJiJ1kI3fQfDFzA6g=@vger.kernel.org
X-Gm-Message-State: AFuF++nio0Wkk4GjChqkr1Xo0sZARIX9b4XJVg3ppuqdvX+My9odAoE/
	kMZFne2OF4ZH2yHXlLYLtXrvAGs8c+XHw4wt0dpx2Fsd8UzFQJYMMRz0
X-Gm-Gg: AYBFou2Smm+3a20dEalBhjloONMvL7EG0BRWMwxYWXHizKKq/AaVI8GZIfTxeuhEnsK
	E+qFpmW0N2sOSklpOPrQcS6BVCR2L2OE4MOW47p4pVVGvgA4J1LZWi46EwCf0TAIpYElko/Gv6O
	nf23DiaLBucTtj67zoaA5/5h6qZxad+G0YTrZ825r9c8Lj7OV34iLY28F2EoHo7qk1a5UIu1gTD
	aiCXJviNkbJe/D1npVD68umPf0EVbu0QoOFzfyTc82yjk66QafEgzxGx3zSnJO+Ksz0SZIdM1B0
	b6YWBF3v5hb5OQlTfKaOyww//ZqFJ9DGHbLA6mUPFNtbaQs6k8YgA4jAZhtsISHRtxUI3qUKFfI
	FzDeGnB71OJGqBP9XmFkPuqXWtwe4sYTuMhD8bxTFH6Hn500AAAYMqgW2vQI1vd1lwhB59lgnjd
	Jm4gVTyc/HNrNaK+kwB43ClIh+1ILHE9ujRRp0KBJW7bHuSU6BASh5sSsv
X-Received: by 2002:a05:600c:190b:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-49cfa20cd63mr290493175e9.20.1788889476492;
        Tue, 08 Sep 2026 10:44:36 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:36 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 6/8] dt-bindings: reset: Add mmsys reset ids for mt8167
Date: Tue,  8 Sep 2026 19:38:33 +0200
Message-ID: <20260908174259.9009-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the SoC data sheet mt8167 has 28 mmsys resets. Add the IDs
that can be used in device trees to identify subsystem resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dt-bindings/reset/mediatek,mt8167-mmsys.h | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-mmsys.h

diff --git a/include/dt-bindings/reset/mediatek,mt8167-mmsys.h b/include/dt-bindings/reset/mediatek,mt8167-mmsys.h
new file mode 100644
index 000000000000..b21f67b3b55c
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt8167-mmsys.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+#ifndef _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_
+#define _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_
+
+/* MMSYS reset IDs */
+#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
+#define MT8167_MMSYS_SW0_RST_B_SMI_LARB0	1
+#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
+#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
+#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
+#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
+#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8
+#define MT8167_MMSYS_SW0_RST_B_FAKE_ENG		9
+#define MT8167_MMSYS_SW0_RST_B_MUTEX		10
+#define MT8167_MMSYS_SW0_RST_B_DISP_OVL0	11
+#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA0	12
+#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA1	13
+#define MT8167_MMSYS_SW0_RST_B_DISP_WDMA0	14
+#define MT8167_MMSYS_SW0_RST_B_DISP_COLOR	15
+#define MT8167_MMSYS_SW0_RST_B_DISP_CCORR	16
+#define MT8167_MMSYS_SW0_RST_B_DISP_AAL		17
+#define MT8167_MMSYS_SW0_RST_B_DISP_GAMMA	18
+#define MT8167_MMSYS_SW0_RST_B_DISP_DITHER	19
+#define MT8167_MMSYS_SW0_RST_B_DISP_UFOE	20
+#define MT8167_MMSYS_SW0_RST_B_DISP_PWM		21
+#define MT8167_MMSYS_SW0_RST_B_DSI0		22
+#define MT8167_MMSYS_SW0_RST_B_DPI0		23
+#define MT8167_MMSYS_SW0_RST_B_MIPI_TX_CONFIG	24
+#define MT8167_MMSYS_SW1_RST_B_LVDS_ENCODER	25
+#define MT8167_MMSYS_SW1_RST_B_DPI1		26
+#define MT8167_MMSYS_SW1_RST_B_HDMI		27
+
+#endif  /* _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_ */
-- 
2.43.0

