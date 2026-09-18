Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D204D47534C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754280; cv=none; b=YdFavsaX1XYn/inkPPzBk+fXSka4T3f1NSpCVo48HgMyMgcgsHuEyFjXAKVUHGe9x/wHMkTDchaiGKD83G2p2+5/8o0f5gYRYb4w13aKoFKn63qhEWHbZyDQdaHmHgh/S3oINnU/sovrHNcVMd0dPkLZycN7rffwhvLVfkzpZL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754280; c=relaxed/simple;
	bh=mOGJKQ43xQgshiJ/RtWUK+erzB9TLsSyj6m/UIbiQQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qn8cSQ5qX0Zkfhaz8R7wudT+o61pKQlADnYVj+U41HpvwxNICY3zkqN2veJwV1GA6XEy7rz1NApkwteXlXrmFRZMa1JnisRhV91a6I7sDDMpyBpyTj/RIBnw9ADrS6MXFJ+8tMsAjtk/l4zTpbxmXTF8ClEHueFOBr8KG3NeYnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHPb3vtr; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHPb3vtr"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so795676f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754271; x=1790359071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ylMW2foaHNEjV+ZwE7Us38p2iYChzzws4mregGYupM=;
        b=eHPb3vtrDPbOFNUz9qkxz7ONxMaFs8kQog4kNz1AWuOHDYfgCV2DTfWgekHJOq/hOO
         cp5Oib/hfB09nqW4FBtS8Ct0E01NxSfdhPHT85A/XpRmgONYh9UanzLineTa1v5EMjNA
         mHAbXe4bXLEk3V7ojw8ifrO9nmUlFs6ZPLinRFXNTaQk6jweXarOeRCmsIbgTRRG5rrP
         t0eETZ0NcUvEYtbb4zyfWzGGMjAEahCwS7YSCOTwRiG4BvpfDAvHiEaWnYc6tGEx9em/
         sGhyESpIUHYQuTHhENOeIOwHvtow3IrBWA8L928MDDXPRe/uNjMeFWjJV0ahbXDs3h56
         52Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754271; x=1790359071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ylMW2foaHNEjV+ZwE7Us38p2iYChzzws4mregGYupM=;
        b=Rl2hkJIiJItF2t6RsYdmGnipT4aBCcaGWl65Ptzg3dXdbhPhfn6Q4CjFefAEeRPCGs
         lC2ZTU6ZFDJn2V0SSKSpPXuh9VetWgzC42mHThjhy+WVV9xgjCSJmKxZlOj1ZLylSF4d
         o8JlXSzhqh76cNfKw9EdVuXwH1WA+LNXnyegfktvEgw8GscDZxdD5zPUiuiH/H029XMV
         KXnJAw7jAfrlTS7zQ1hcrANXQJBH21yU398TKrEc8twIkKtj6xwLM9kML5rX275jyG6D
         a99FwEbRwbcYI2yJFBlAOtP9URSXO2LG+4MqnjaVlKqDdB3Q9r5jOEoVpAv7LF9DXv+s
         KWLg==
X-Forwarded-Encrypted: i=1; AKwUvBycoPuLzt/rbckMOwWL7R3D9VFe5yyCX17xrV5V3epYn8Vu5a3qR797SKmVSUru4rKNosWK1fJMXckL7RU=@vger.kernel.org
X-Gm-Message-State: AFuF++lKNsoUmIqSAl0ip4janJq/KD/Pi6vxecND3HhDEsqB1MLjuRgl
	hCJApWuTiASCSJAIkRFvr3cmVG7etx3D4s6c+vR+FesSokkFY2nX7lYw
X-Gm-Gg: AYBFou3dYZqDs66L7JjfENN1hXQlUiAGXf4k4Uih4ASb/CwFE+vjP0b/1p9CMo7B/0l
	FC+RFkjWeeehntQakXIsZTTMwT/Y1DnYa+/VCeO1mg1zzg17TqBOzdQF5UUzZTSKs8XYYGHZnu7
	0ms4BPtMpfLxAujDh8NPAlXg/0/zJUUMyrBiqMuZ96D7RqG2g+apluA2PGlR1vCqep2NIXcHVJN
	mNPGtO2h093H5tWuVoBRVJBNqLSLVAJVOqeNBiJGmDwRRKshl4TlmuCl/EUIoKfGr4y7Jqloy8b
	Ly6UlQAa+eef8N0UBVYU8tXotNPpHYP9xZWA+Mk3wQ2zbAp40LlAUEVdGQ602XXJRqPWj8qTVZ4
	3Zz0YO7Pmq3vaoWzrA/GA/V8Z11PvUvZGxyw2qstsuRrYiasvegg3uQLVwonXJ9wFTSSLXuaOHL
	8HdWwYdGrbqalX28/3yedvmxwz+zjDzH657DDzs1kfY6FlHcPmnQhMaT9Is5mwujbHGso=
X-Received: by 2002:a5d:584c:0:b0:486:f45a:57a7 with SMTP id ffacd0b85a97d-4871e264829mr7609614f8f.16.1789754271218;
        Fri, 18 Sep 2026 10:57:51 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm268461f8f.14.2026.09.18.10.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:57:50 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] soc: mediatek: mt8167-mmsys: add routes for all display paths
Date: Fri, 18 Sep 2026 19:55:27 +0200
Message-ID: <20260918175736.355305-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918175736.355305-1-l.scorcia@gmail.com>
References: <20260918175736.355305-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt8167 display output pipeline can be configured in many different ways.
Add support for additional routes according to the SoC data sheet and
Android sources. There's a few inconsistencies between those two, but
assume the Android sources are correct since they are required to drive
HDMI output via DPI1.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h | 183 ++++++++++++++++++++++++++--
 1 file changed, 174 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index 001379373507..aab1774152c5 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -5,35 +5,200 @@
 
 #define MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x030
 #define MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN	0x038
+#define MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN	0x03c
 #define MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x058
+#define MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN	0x05c
+#define MT8167_DISP_REG_CONFIG_DISP_UFOE_SEL_IN		0x060
 #define MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN		0x064
+#define MT8167_DISP_REG_CONFIG_DISP_DPI0_SEL_IN		0x068
 #define MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN	0x06c
+#define MT8167_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL_IN	0x070
+#define MT8167_DISP_REG_CONFIG_DISP_DPI1_SEL_IN		0x074
+
+#define MT8167_OVL0_MOUT_EN_COLOR0			0x1
+#define MT8167_OVL0_MOUT_EN_WDMA0			0x2
+#define MT8167_OVL0_MOUT_EN_MASK			0x3
 
 #define MT8167_DITHER_MOUT_EN_RDMA0			0x1
+#define MT8167_DITHER_MOUT_EN_UFOE			0x2
+#define MT8167_DITHER_MOUT_EN_WDMA0			0x4
 #define MT8167_DITHER_MOUT_EN_MASK			0x7
 
-#define MT8167_RDMA0_SOUT_DSI0				0x2
-#define MT8167_RDMA0_SOUT_MASK				0x3
+#define MT8167_UFOE_MOUT_EN_DSI0			0x1
+#define MT8167_UFOE_MOUT_EN_DPI0			0x2
+/*
+ * For some reason Android sources and the data sheet don't agree here,
+ * the data sheet has UFOE_MOUT_EN_WDMA0 as 0x4 and does not mention DPI1.
+ */
+#define MT8167_UFOE_MOUT_EN_DPI1			0x4
+#define MT8167_UFOE_MOUT_EN_WDMA0			0x8
+#define MT8167_UFOE_MOUT_EN_MASK			0xF
+
+#define MT8167_COLOR0_SEL_IN_RDMA0			0x0
+#define MT8167_COLOR0_SEL_IN_OVL0			0x1
+#define MT8167_COLOR0_SEL_IN_MASK			0x1
+
+#define MT8167_WDMA0_SEL_IN_OVL0			0x0
+#define MT8167_WDMA0_SEL_IN_DITHER			0x1
+#define MT8167_WDMA0_SEL_IN_UFOE			0x2
+#define MT8167_WDMA0_SEL_IN_MASK			0x3
+
+#define MT8167_UFOE_SEL_IN_RDMA0			0x0
+#define MT8167_UFOE_SEL_IN_DITHER			0x1
+#define MT8167_UFOE_SEL_IN_MASK				0x1
 
+#define MT8167_DSI0_SEL_IN_UFOE				0x0
 #define MT8167_DSI0_SEL_IN_RDMA0			0x1
+#define MT8167_DSI0_SEL_IN_RDMA1			0x2
 #define MT8167_DSI0_SEL_IN_MASK				0x3
 
+#define MT8167_DPI0_SEL_IN_UFOE				0x0
+#define MT8167_DPI0_SEL_IN_RDMA0			0x1
+#define MT8167_DPI0_SEL_IN_RDMA1			0x2
+#define MT8167_DPI0_SEL_IN_MASK				0x3
+
+#define MT8167_DPI1_SEL_IN_UFOE				0x0
+#define MT8167_DPI1_SEL_IN_RDMA0			0x1
+#define MT8167_DPI1_SEL_IN_RDMA1			0x2
+#define MT8167_DPI1_SEL_IN_MASK				0x3
+
+#define MT8167_RDMA0_SOUT_UFOE				0x0
+#define MT8167_RDMA0_SOUT_COLOR0			0x1
+#define MT8167_RDMA0_SOUT_DSI0				0x2
+#define MT8167_RDMA0_SOUT_DPI0				0x3
+/* DPI1 is only defined in Android sources, not in the data sheet */
+#define MT8167_RDMA0_SOUT_DPI1				0x4
+#define MT8167_RDMA0_SOUT_MASK				0x7
+
+#define MT8167_RDMA1_SOUT_DSI0				0x0
+#define MT8167_RDMA1_SOUT_DPI0				0x1
+/* DPI1 is only defined in Android sources, not in the data sheet */
+#define MT8167_RDMA1_SOUT_DPI1				0x2
+#define MT8167_RDMA1_SOUT_MASK				0x3
+
 static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
+	/* OVL0<->COLOR0 */
 	MMSYS_ROUTE(OVL, 0, COLOR, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
-		    OVL0_MOUT_EN_COLOR0),
+		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, MT8167_OVL0_MOUT_EN_MASK,
+		    MT8167_OVL0_MOUT_EN_COLOR0),
+	MMSYS_ROUTE(OVL, 0, COLOR, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, MT8167_COLOR0_SEL_IN_MASK,
+		    MT8167_COLOR0_SEL_IN_OVL0),
+
+	/* OVL0<->WDMA0 */
+	MMSYS_ROUTE(OVL, 0, WDMA, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, MT8167_OVL0_MOUT_EN_MASK,
+		    MT8167_OVL0_MOUT_EN_WDMA0),
+	MMSYS_ROUTE(OVL, 0, WDMA, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, MT8167_COLOR0_SEL_IN_MASK,
+		    MT8167_WDMA0_SEL_IN_OVL0),
+
+	/* DITHER0 outputs */
 	MMSYS_ROUTE(DITHER, 0, RDMA, 0,
 		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
 		    MT8167_DITHER_MOUT_EN_RDMA0),
-	MMSYS_ROUTE(OVL, 0, COLOR, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
-		    COLOR0_SEL_IN_OVL0),
-	MMSYS_ROUTE(RDMA, 0, DSI, 0,
+	MMSYS_ROUTE(DITHER, 0, UFOE, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
+		    MT8167_DITHER_MOUT_EN_UFOE),
+	MMSYS_ROUTE(DITHER, 0, WDMA, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
+		    MT8167_DITHER_MOUT_EN_WDMA0),
+
+	/* UFOE<->DSI0 */
+	MMSYS_ROUTE(UFOE, 0, DSI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_MASK,
+		    MT8167_UFOE_MOUT_EN_DSI0),
+	MMSYS_ROUTE(UFOE, 0, DSI, 0,
 		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
-		    MT8167_DSI0_SEL_IN_RDMA0),
+		    MT8167_DSI0_SEL_IN_UFOE),
+
+	/* UFOE<->DPI0 */
+	MMSYS_ROUTE(UFOE, 0, DPI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_MASK,
+		    MT8167_UFOE_MOUT_EN_DPI0),
+	MMSYS_ROUTE(UFOE, 0, DPI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DPI0_SEL_IN, MT8167_DPI0_SEL_IN_MASK,
+		    MT8167_DPI0_SEL_IN_UFOE),
+
+	/* UFOE<->DPI1 */
+	MMSYS_ROUTE(UFOE, 0, DPI, 1,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_MASK,
+		    MT8167_UFOE_MOUT_EN_DPI1),
+	MMSYS_ROUTE(UFOE, 0, DPI, 1,
+		    MT8167_DISP_REG_CONFIG_DISP_DPI1_SEL_IN, MT8167_DPI1_SEL_IN_MASK,
+		    MT8167_DPI1_SEL_IN_UFOE),
+
+	/* UFOE<->WDMA0 */
+	MMSYS_ROUTE(UFOE, 0, WDMA, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_MASK,
+		    MT8167_UFOE_MOUT_EN_WDMA0),
+	MMSYS_ROUTE(UFOE, 0, WDMA, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN, MT8167_WDMA0_SEL_IN_MASK,
+		    MT8167_WDMA0_SEL_IN_UFOE),
+
+	/* RDMA0<->UFOE */
+	MMSYS_ROUTE(RDMA, 0, UFOE, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MASK,
+		    MT8167_RDMA0_SOUT_UFOE),
+	MMSYS_ROUTE(RDMA, 0, UFOE, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_SEL_IN, MT8167_UFOE_SEL_IN_MASK,
+		    MT8167_UFOE_SEL_IN_RDMA0),
+
+	/* RDMA0->COLOR0 */
+	MMSYS_ROUTE(RDMA, 0, COLOR, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MASK,
+		    MT8167_RDMA0_SOUT_COLOR0),
+	MMSYS_ROUTE(RDMA, 0, COLOR, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, MT8167_COLOR0_SEL_IN_MASK,
+		    MT8167_COLOR0_SEL_IN_RDMA0),
+
+	/* RDMA0<->DSI0 */
 	MMSYS_ROUTE(RDMA, 0, DSI, 0,
 		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MASK,
 		    MT8167_RDMA0_SOUT_DSI0),
+	MMSYS_ROUTE(RDMA, 0, DSI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
+		    MT8167_DSI0_SEL_IN_RDMA0),
+
+	/* RDMA0<->DPI0 */
+	MMSYS_ROUTE(RDMA, 0, DPI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MASK,
+		    MT8167_RDMA0_SOUT_DPI0),
+	MMSYS_ROUTE(RDMA, 0, DPI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DPI0_SEL_IN, MT8167_DPI0_SEL_IN_MASK,
+		    MT8167_DPI0_SEL_IN_RDMA0),
+
+	/* RDMA0<->DPI1 */
+	MMSYS_ROUTE(RDMA, 0, DPI, 1,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MASK,
+		    MT8167_RDMA0_SOUT_DPI1),
+	MMSYS_ROUTE(RDMA, 0, DPI, 1,
+		    MT8167_DISP_REG_CONFIG_DISP_DPI1_SEL_IN, MT8167_DPI1_SEL_IN_MASK,
+		    MT8167_DPI1_SEL_IN_RDMA0),
+
+	/* RDMA1<->DSI0 */
+	MMSYS_ROUTE(RDMA, 1, DSI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL_IN, MT8167_RDMA1_SOUT_MASK,
+		    MT8167_RDMA1_SOUT_DSI0),
+	MMSYS_ROUTE(RDMA, 1, DPI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
+		    MT8167_DPI0_SEL_IN_RDMA1),
+
+	/* RDMA1<->DPI0 */
+	MMSYS_ROUTE(RDMA, 1, DPI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL_IN, MT8167_RDMA1_SOUT_MASK,
+		    MT8167_RDMA1_SOUT_DPI0),
+	MMSYS_ROUTE(RDMA, 1, DPI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DPI0_SEL_IN, MT8167_DPI0_SEL_IN_MASK,
+		    MT8167_DPI0_SEL_IN_RDMA1),
+
+	/* RDMA1<->DPI1 */
+	MMSYS_ROUTE(RDMA, 1, DPI, 1,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL_IN, MT8167_RDMA1_SOUT_MASK,
+		    MT8167_RDMA1_SOUT_DPI1),
+	MMSYS_ROUTE(RDMA, 1, DPI, 1,
+		    MT8167_DISP_REG_CONFIG_DISP_DPI1_SEL_IN, MT8167_DPI1_SEL_IN_MASK,
+		    MT8167_DPI1_SEL_IN_RDMA1),
 };
 
 #endif /* __SOC_MEDIATEK_MT8167_MMSYS_H */
-- 
2.43.0

