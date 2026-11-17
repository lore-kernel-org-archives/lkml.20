Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917401;
	b=lalz/8mfH91NMyED8KitB0X+K88yb76sg4WrGy5zzqZ9OgJYjFsVsCiyEfSSyFvRS1fp
	 aIA9izaxJMWq2zSrK+yQcsr+5NpguNL6VTCRxHMQ+9v2Rb8rlfNTn9wMUceTiMBjxoqTf
	 McQWCJEbA81WVPYZi9NIk4m5CCyn3vQ8Ki3VJaOuc8uaew0M06VL7Mr76peKlvr3ODezA
	 OyGMoNFiLpMAbXjkyyQpLYC6+FJ795S4MbgYKvTtentSYq0HRyn6ccT+ljBvYz5CJ5zpe
	 zTcgb8rbFJIceKFdSr1CNf88HAJNEqswfoPsgjYeTMukV6gWEP6iG3kaFt2GAZSlA4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PvhRwGpG/bx47LbZ5+rPkxTM1RKyVIDPm5XEYb7/QQc=;
	b=jkoZQptSb1pqf4pnVs8sESeAjTvpm7bNlXJpPTBP2qVFxr4JzGlzCEGqtJFw2UHRkG8T
	 TfRDcrymKKBlmepnYFWM+gIu9aVSZk+IZPVLRAzd9i4FWA2092KDjXfoABV+caebOK2nN
	 93cxwh/ggNX4zE1XPQDwXkqn+GuxViR7z5BprVXPltR64GF+03yc7nlEa7HFbZcRTiEoH
	 QP+angFlWIulOhnZAGvHQ1NJvalIpwmoRevu8lcomKNbUOuXRleDjbwYPv2EEAyzhccTR
	 5+bR+a37IWr6is7rFO8VEKaAQB/2hmj82cZaoGVoEZzLX8TlWVXCvNlA+iWX/ny3RJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lqEoq3rS;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D927606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D927606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lqEoq3rS
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49d64a88222so519238f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794917400; x=1795522200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PvhRwGpG/bx47LbZ5+rPkxTM1RKyVIDPm5XEYb7/QQc=;
        b=lqEoq3rS7CGKKd1FRoH6cg5jsVy/s17zm7ks2uS8qdsYtYMnuEt/W7dmHQkSsVu/Sy
         Vk7wxPGG8XL4pDq9fGbATaFcjP2DolOFNEQhhN9l4tbsWm6CjfaKNQzT4UFydcmBIXw4
         BrjPrSux1n1ItxPmWD33uaINk7P+ty4Q9rvtg6f5XA63Fi8hEjCFJBS/xPTNCfFOwBJt
         nYlhINgsthLCujf9eyqDLqEOdWSfhf3MvSnmU0yJNhhV7XohJZsjCgFiY4+hD3f/ShZo
         HFbRQTRjjgrmUZ+TXelczF9MHcGlGMi+R1GMH2xpg/2tc+JzpRj6Nq9e3U8k4Q+A1lgx
         /kbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917400; x=1795522200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvhRwGpG/bx47LbZ5+rPkxTM1RKyVIDPm5XEYb7/QQc=;
        b=XjKJ0xbuCFcf/OC8DiJexdUjdB5c24l1YQtMs8aieJw2uAY11eSfwYKNqd8ASTxgSb
         bk4n3VYunB2eO8AkE/88D1qG9mNE6WKzWRhebAwllgASCZ6HPQxqN/DkTU520aEM7DyJ
         D6DkIxqLhDsWZz20kY0FELR2l4kQj1N/RIb38eW1jL4UbudCsUC0nPSx6Z33gVbTDfkg
         ZquEPnIPuYER5FuQRWTvyiSNJc0HmykOhIQ6+eQPZvIGAX8i/fd/0d2XYbM8AjpFHHb6
         GYUKUSgWeV5dnC0Jek8ql5YNu1sYeAVFVkx+Ulj1Sp2/pb2d4YBeLNPJp4d+jiOS9kXJ
         iv0w==
X-Forwarded-Encrypted: i=1; AL+hErHGrmJ9cDS9NvBco0HZdPvXca0kIsIvefuWz8IUQ+v5GmTMKrvyoJcFkKxU33N+YKRpOVmDjKQZKgug7SU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KjI/rsULAgp4h/93MrkULxEG6eVCkLCDednT67c/hx0w/kVwb
	tHQLhzOuxqfAK5NfkKT/UgmjKvocVudQdWr1jtnoMXK7TN+q60ti7jJg
X-Gm-Gg: AYBFou3jfsy0WNgz/NQb6VRMyBY48o6nJdNCB1sVWUMIdrmRf4sHDiRs6KjNWdpGUG8
	pA1oodwP0QsSXIK2O65ofCsiJlZHFVQNatQqN+bVY6Fe6k6OoR9ueOqYzRymUZoOTeTMr2Ek0bw
	tIL+Ti03Us9XwKSFeUiEQqBWlfM0wEx5qyBz4DIkUTaRyzq+O9cUy6mxzkTQVxe0/koF/DwCHtl
	fJC08xflRInRQjQF1dufEHtj3yEbw/57OLxik+YLyDj4mqTcdl66u1pJeCw7869YdZ6NBhESzo+
	ZtGPPi0SjxIw9Jh2LcmDjAHsrEDcLJDjD8crb2/X1KBe8xeRM5NRJ5wCVJo/9/DK/MAnb1KPNv+
	USBLgkN5WLefKMBMrvt0siULj3kZjG0CEUefq6vRGeQ2coqjVmaucgWYaa2VPRvDgfBo1msQTu+
	I9BrulQq81WO/wV75OHaYFzqDNuehPprYu/QTsZkVMnpvi5GHN9xcJZME1WSQcBak7bH1FAwfOE
	8WhwGF6zk8CE1rfyATyu/rosqyRNoFFqCdBdzBFfZOTOaMNwo48abILVNX7XmG0aeL/weqU4W2d
	rvJUQd5MSuvy3zeAX9ICrIynLPyJh9myfNV1iJ/bCTN5Bg==
X-Received: by 2002:a05:600c:3493:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb78381293mr54280755e9.9.1794917399581;
        Tue, 17 Nov 2026 04:09:59 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783e9288sm66515085e9.15.2026.11.17.04.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:09:59 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] soc: mediatek: mt8167-mmsys: fix errors in multiple-output display paths
Date: Tue, 17 Nov 2026 13:09:12 +0100
Message-ID: <20261117120934.728612-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Some display blocks can be used to define multiple-output pipelines.
The current code uses mtk_mmsys_update_bits to clear the mask bits and
set the desired output block bit when initializing or disconnecting a
pipeline. This breaks multiple output pipelines (only the last one set
produces output).

Fix this by using the block bit alone as mask for multiple output route
components.

Also address some unfortunate copy and paste errors in routes between
OVL<->WDMA0, DITHER0<->UFOE and DITHER0<->WDMA0.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Fixes: 96c2b43b1fb3 ("soc: mediatek: mt8167-mmsys: add routes for all display paths")
---
Changes in v2:
- Added Fixes tag

v1: [1]

[1] https://lore.kernel.org/linux-mediatek/20261117113402.728183-1-l.scorcia@gmail.com/

 drivers/soc/mediatek/mt8167-mmsys.h | 32 +++++++++++++++++++----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index 858779ace895..45df210b5775 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -79,7 +79,7 @@
 static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 	/* OVL0<->COLOR0 */
 	MMSYS_ROUTE(OVL, 0, COLOR, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, MT8167_OVL0_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, MT8167_OVL0_MOUT_EN_COLOR0,
 		    MT8167_OVL0_MOUT_EN_COLOR0),
 	MMSYS_ROUTE(OVL, 0, COLOR, 0,
 		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, MT8167_COLOR0_SEL_IN_MASK,
@@ -87,26 +87,36 @@ static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 
 	/* OVL0<->WDMA0 */
 	MMSYS_ROUTE(OVL, 0, WDMA, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, MT8167_OVL0_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, MT8167_OVL0_MOUT_EN_WDMA0,
 		    MT8167_OVL0_MOUT_EN_WDMA0),
 	MMSYS_ROUTE(OVL, 0, WDMA, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN, MT8167_COLOR0_SEL_IN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN, MT8167_WDMA0_SEL_IN_MASK,
 		    MT8167_WDMA0_SEL_IN_OVL0),
 
-	/* DITHER0 outputs */
+	/* DITHER0 output to RDMA */
 	MMSYS_ROUTE(DITHER, 0, RDMA, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_RDMA0,
 		    MT8167_DITHER_MOUT_EN_RDMA0),
+
+	/* DITHER<->UFOE */
 	MMSYS_ROUTE(DITHER, 0, UFOE, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_UFOE,
 		    MT8167_DITHER_MOUT_EN_UFOE),
+	MMSYS_ROUTE(DITHER, 0, UFOE, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_SEL_IN, MT8167_UFOE_SEL_IN_MASK,
+		    MT8167_UFOE_SEL_IN_DITHER),
+
+	/* DITHER<->WDMA */
 	MMSYS_ROUTE(DITHER, 0, WDMA, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_WDMA0,
 		    MT8167_DITHER_MOUT_EN_WDMA0),
+	MMSYS_ROUTE(DITHER, 0, WDMA, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN, MT8167_WDMA0_SEL_IN_MASK,
+		    MT8167_WDMA0_SEL_IN_DITHER),
 
 	/* UFOE<->DSI0 */
 	MMSYS_ROUTE(UFOE, 0, DSI, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_DSI0,
 		    MT8167_UFOE_MOUT_EN_DSI0),
 	MMSYS_ROUTE(UFOE, 0, DSI, 0,
 		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
@@ -114,7 +124,7 @@ static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 
 	/* UFOE<->DPI0 */
 	MMSYS_ROUTE(UFOE, 0, DPI, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_DPI0,
 		    MT8167_UFOE_MOUT_EN_DPI0),
 	MMSYS_ROUTE(UFOE, 0, DPI, 0,
 		    MT8167_DISP_REG_CONFIG_DISP_DPI0_SEL_IN, MT8167_DPI0_SEL_IN_MASK,
@@ -122,7 +132,7 @@ static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 
 	/* UFOE<->DPI1 */
 	MMSYS_ROUTE(UFOE, 0, DPI, 1,
-		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_DPI1,
 		    MT8167_UFOE_MOUT_EN_DPI1),
 	MMSYS_ROUTE(UFOE, 0, DPI, 1,
 		    MT8167_DISP_REG_CONFIG_DISP_DPI1_SEL_IN, MT8167_DPI1_SEL_IN_MASK,
@@ -130,7 +140,7 @@ static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 
 	/* UFOE<->WDMA0 */
 	MMSYS_ROUTE(UFOE, 0, WDMA, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_WDMA0,
 		    MT8167_UFOE_MOUT_EN_WDMA0),
 	MMSYS_ROUTE(UFOE, 0, WDMA, 0,
 		    MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN, MT8167_WDMA0_SEL_IN_MASK,
-- 
2.43.0

