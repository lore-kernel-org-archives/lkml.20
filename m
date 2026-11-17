Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915270;
	b=EHw9ohTtjgiVDoJThf6JnRqYdTWjsuusd+CBZK4OKxllx85HHSEZ22w+3sxyjcsd5bfs
	 T9DXUQHx88dsnOwSoNMVtxGBZ9Z2zmnyH442/HICupflBjqJ9Yknyl0JIHoqLnsHxrrk2
	 Ingb9eKPI5unC1VvSL7NUrbdyk58KW3h3dUn7msi9wNR4O7y3j+lmtw3ZdkV6p7ZtNwqi
	 8oIBsOTGvMX8A7udhkQK15H2kgd9H8VgQrGVt2eO0fibA3iyjpo63oFPADOqM4yRekPo0
	 cOBLzJLuTIX7XmeEhBkWZTjak5qQqwDt5Uc6PHct0PLqvklw9JcWwbwDuqdMKhPkFTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cZ1Q9nQisyzYOcK4GhJrAjo2iUyQx36OfgdeOTkK62o=;
	b=jXQlVJQA9HlXLl1eNUmFuv59GSVvjkUNxxLvRkrxHVhZolchPtGzW4goy0xBqxmDeycA
	 LMiNo7jj3s19no34DyCKlYbUxyP/o0YDa/X1d8iq4D5q9IZn2elgEWKyhLtQVnjZZExGt
	 1sytsyTWgV2WBJYII9f+tk2LsFPE4qo3c10A2vEqkSp8OP955jljKkoykSAPhBBzWtzip
	 otELGcoGoTSPdoz0OSuyi9UkO0EMSG9/gw9YDuJLOe9FuRe4+0OmJ6Wp3tMfmaLh0Luf6
	 /T2zCP07B7vcVb3EO1dOITD/aJJgMPqXsNqrSHxwq8cSn9ARQ76vb06qseVcq9wZOGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQfCqGFK;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876B3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 876B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQfCqGFK
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso28783995e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915269; x=1795520069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cZ1Q9nQisyzYOcK4GhJrAjo2iUyQx36OfgdeOTkK62o=;
        b=dQfCqGFKufI0ajKDHjCv9M5t3nuR+rValiVPv2Q7GYKyivvPL7eMPB1aQbDVfevO4c
         lPLiIS6F4dZaKDyUoUn/bHBHDCGEtnpCFrCNECQP4llVzUxeWLdKgvF73rBCu8JxQ6dV
         xw7rPbpZdxG2k23YcCEYjwcWJldakPVnOmwiBFzN7lrt6ar/py8xCyhIrxeSyXp1O3Wr
         vqzmYlxzCzRJLVaR0zbYzYBMoz5XFvBle9Ou3hu0lld/lc+x1x4sOXxg2BfEW5wq7lGN
         wN/OKNUwMHVeBNe7SROkPrY2cbFVvC+A9C+6q2NnFBeSFJ+iIrWDAFs9kuIR6CZ3mh/P
         anbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915269; x=1795520069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZ1Q9nQisyzYOcK4GhJrAjo2iUyQx36OfgdeOTkK62o=;
        b=pkvHrrb6vL9tHp5GLHDGyyi9/nRlo0rY+vCY9K0mMxwIX4aNEH67cTc2u1dhaivK4Z
         Qp2yhEJZqeTwFKWTiUkRgTPL5hO6lbdrysr28K9XjGa8nJVhBFtyTWN9kEyAuBrHHki0
         emuqSGQkk+m6R4YlidEBG+5o9cLM3eVdfUwzPKRLnMJtYO38rltRKNtAIc3wzPRpkNrj
         amZ4dxeMq62nRDNKmM7Yc3aM0hLBCbmoVxqXtn9WwXZ1bDlBwHFbNfTvaPUHIOsyEGXS
         ctRCj3QX2yIbymNp/dI8/58sUv/GBNG7VoOx6FxOi/iVsl7s8gWG1j/ZS1WXWJXQv0qr
         dAWA==
X-Forwarded-Encrypted: i=1; AL+hErFfrdupSKV05wZbeNjSw5Gij26fQD2a1ZUgWWw7OKGc8fdG5MhBu6YhT4bZKTWhHmDcJUtgs/cNcybnULA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/a0KEJZ6q2ZLloJ327u4gCLX/1FCUN5I3bHi45/3s42mIoXmMB
	+iLgFTI0ZzJqHQHWLozneyidLgn/Ia9KHQs+DotR7Olq0tXswAKxU/juzIHUug==
X-Gm-Gg: AYBFou1AFlvM1i8W/yVLDaUyrIFe69AkdI0hNL7JY7+bSxoH1/Ju5KuSuzx8QzEsu9w
	ZiL4uXynu5sMTSTv6U1V9aBGE9/sKVLuZYZokqLaJEZT0OX/DjJyiUX3V2dtUhvSvN7/MOCJdkG
	gNOwG1HY4tJ9+zjo84Gqu48bZLnQ3MAHf/axFdT80PRx4gSnKok9JNP1K5eyUkaDisNG8tYgmMS
	HDIL35wFn0rnYcRJ+k1arrK+rRy9Zd/geYiNl4TtAs6Bfcic6uTuqjdmaJJAOAgKXChUIxX+ooR
	R2Zv9lVDmJbE0IPOajioCA2GuTD9VN9UcETc89bIZZtlMy/BIIzFMIdFpzv7xM+bd5WYA7ZOOgT
	1THpQQzGt2eINCcN7Xk8bQ1X08dRCGSz3TDFD250us8iNw2ZV5gSg1SQ9nDijIKb3P25ZCCKhKQ
	NYw2MmN3naWiBOEwAocF5MVB7x7Qz9beHsKD4Vfvsoc04oKeqvqnib/KLIUI7w+ip2g8QzCTrq4
	JtRIXtf7+njW9xHlWDs1t8vnqOk+YrgU+wipW5z7j7YslrGqcVsmcd7TjEcAK409NUk4scYkQwZ
	oSJXzxnYxQAQRFhqzbJVTKqzvwxD4CyagL+HCCVWOWQB4A==
X-Received: by 2002:a05:600c:1d0e:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb55a7f5f3mr289084855e9.32.1794915268704;
        Tue, 17 Nov 2026 03:34:28 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm109015895e9.3.2026.11.17.03.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:34:28 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: mediatek: mt8167-mmsys: fix errors in multiple-output display paths
Date: Tue, 17 Nov 2026 12:33:47 +0100
Message-ID: <20261117113402.728183-1-l.scorcia@gmail.com>
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
---
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

