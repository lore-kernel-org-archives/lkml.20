Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0AF48FF9D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990776; cv=none; b=ZXN3boBoPO9PwHNeQpcvEAv72ajsoGy2Hj9+dbW1BYq6vZo+pRPa9eO1TfQ4eLr7P2ncjEUhjZBa3eUNkht8F0y0NNpDgbJcC2Ug9wSYqH6hlLX0BDtVyQV8VuwitCCglsHDooWEkZeAuAV05xTF4EfLeQYaYSQYRkNvIJFPeC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990776; c=relaxed/simple;
	bh=Dyuw7OL70k7bueAia/xPeU+Lz1UkLCcbOOpGZltm9ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikZwKnMpUo+23guEbe92OfQOfKVa9XHcM+6X7MCabDEMqBmQu6EQP07/nVsWXKZ+CS0D4iQouMNcIj9F70JQt4hbeG8sJ73NglSQGwhvJTBIM4iTECVncK7NKnRB2M0nY1S3ML2rtqUhNyPnnoImczWu/YrIuOKuXiOXAQeNCeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oBcchlp3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oBcchlp3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso39836055e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789990771; x=1790595571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZPzbTlxntaUSPDIDTplyVsLAQNaZBVDPsqLjNTEB+0=;
        b=oBcchlp3hd+9i8KHLuA8c714P7WzSZNiQrwm7Ts10kNqMGR9RcGuWKq/08ThFpeXrJ
         ZIWM1gSxQUVPhPJtjFoMhgafyo60rMk72CYF7N/5WIcb1IhwbYKs8+zeLtak87A1H4z9
         qNSLqeLmFvuoHI2lNcmWZVg+Zx7iYiUtTsINiJMyjxMoP0MVpQ7rxSt7RrhN3/22IV9n
         n1ea13KuRfpFm3LRjHj/ps5gMfMqbSS5YibrdwmT7lN5ebMgqecf5wxaY6an3/PIgqS6
         de18BhnCdoW39MQATsqtjNJoQerteHoIN9bvDY9xXPjXpg/sQyrG6b1CrY/YDxqona00
         0mQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990771; x=1790595571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZPzbTlxntaUSPDIDTplyVsLAQNaZBVDPsqLjNTEB+0=;
        b=gUHgw0n2t7POi3GReqcL8YYfb0ymjopxnwb1oGYEyQVA2SOAD2Au/qYOAqi2fg0Az6
         Ol9J8mO0wXuu+3NYKz4TT0zZ/huQjF3jwqsQNPHHyahYIs7Evyb3oKZMpuMD7Ak9McZG
         pDpI6GzdKG82TskPRZRk9J+X6+JJ8GKzk1DiOpLCYLwLzAr59pDS7wvCYXIH4wTP7vlg
         9kxSDVzaxvcRf1Nl2w1JcBYiCPBoO6XOPO8hsu26MdE5WVAoYeAT8nAp0U5nOZkqL7wg
         2QFYGdkJCpSx462MdnSYKOK9YpnPPO/W0oFWmUU26+WBxtABMY0TEfG6RsLBLvGVfqaY
         4XRg==
X-Forwarded-Encrypted: i=1; AKwUvBxEWNz8afiW785sRlz1Yg2qBNEKNJabFkRN6NfDUXY9O/dfBGUmSl1AM5VTXToWg+lTKkMgZC+6NrxsA5M=@vger.kernel.org
X-Gm-Message-State: AFuF++nEBadG2dDcxJOufaDr+3+9WSKLj+LmQV6MDvhFKrfqMDPLf9Og
	Ubu4jAodWiR379UUAYyvUEsi1iVXqcmqfRHE/HLZ8eZu3NFpOI73FEe/
X-Gm-Gg: AYBFou1OcCYXl8WW+u0QOdPuqbXMHEWCVzaF6gCmXN1Wq/t1hoZngMrJCo3rvjFYktm
	x0/qamILr8wHQzta+0mPGPBS29BDg49G9ZQZwAWTsciX8Ur6iUEjRyuJz9QX/zdoRp4mKISvAEk
	IqNQIW+Rk0IQUaJ6rvNrGzpfFwyW8dYRWXcvGTeoKkpF2czj4AZaOsk3OzNzws7FZC/Pj4qIBZ1
	YcZS15E10UmDD48REVw+u1uiJA+mBYsiRoKZLQEQReKZ1Na+nf+VxTm6e3kQgZZt9qoPFc0+h1W
	l93Cv/cIJ+2YjZ02G2Dhh8cMBZO56O1nr/xAeOIZAtUND/U0TQxwqohFwzMRXbQ8w5OUnMXR8fp
	izL+b7CzHZQWXv32Zt0uRKLJDTL0ayQ7mJ7axtmgjWt4vfmABjhjJCtU2Kt5eNOrx+CyvRUetTz
	nTyyBwYosNnuMEkwY0hpL4ZRQHhLpx24mrBOWbh9zJSizdCpCRCQVy5KiT+DQ4oFMD5/Y=
X-Received: by 2002:a05:600c:3b9d:b0:49f:bd3c:bc1f with SMTP id 5b1f17b1804b1-49fc573b54amr177641685e9.26.1789990771240;
        Mon, 21 Sep 2026 04:39:31 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc57547easm244273865e9.3.2026.09.21.04.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:39:30 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] soc: mediatek: mt8167-mmsys: add routes for all display paths
Date: Mon, 21 Sep 2026 13:38:57 +0200
Message-ID: <20260921113914.779393-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921113914.779393-1-l.scorcia@gmail.com>
References: <20260921113914.779393-1-l.scorcia@gmail.com>
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h | 193 ++++++++++++++++++++++++++--
 1 file changed, 184 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index 001379373507..7da81b668871 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -5,35 +5,210 @@
 
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
+		    MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN, MT8167_WDMA0_SEL_IN_MASK,
+		    MT8167_WDMA0_SEL_IN_OVL0),
+
+	/* DITHER0 output to RDMA */
 	MMSYS_ROUTE(DITHER, 0, RDMA, 0,
 		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
 		    MT8167_DITHER_MOUT_EN_RDMA0),
-	MMSYS_ROUTE(OVL, 0, COLOR, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
-		    COLOR0_SEL_IN_OVL0),
-	MMSYS_ROUTE(RDMA, 0, DSI, 0,
+
+	/* DITHER<->UFOE */
+	MMSYS_ROUTE(DITHER, 0, UFOE, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
+		    MT8167_DITHER_MOUT_EN_UFOE),
+	MMSYS_ROUTE(DITHER, 0, UFOE, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_SEL_IN, MT8167_UFOE_SEL_IN_MASK,
+		    MT8167_UFOE_SEL_IN_DITHER),
+
+	/* DITHER<->WDMA */
+	MMSYS_ROUTE(DITHER, 0, WDMA, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
+		    MT8167_DITHER_MOUT_EN_WDMA0),
+	MMSYS_ROUTE(DITHER, 0, WDMA, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN, MT8167_WDMA0_SEL_IN_MASK,
+		    MT8167_WDMA0_SEL_IN_DITHER),
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
+	MMSYS_ROUTE(RDMA, 1, DSI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
+		    MT8167_DSI0_SEL_IN_RDMA1),
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

