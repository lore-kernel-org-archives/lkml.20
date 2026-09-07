Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B3C4756C9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780508; cv=none; b=P5zq2LYPM/QI8jR21palQ0VTNYPWQlh0DRJT9Bn8Lhh/cdCwTrYAPd/5pHtlSXNufjNpUxQK7aSzaZUjNy8AA/iwSuQWfYsNqaCX92FYHsoMzHeR8JtzJvxZYERAXf73wr7rjU8h+dgaxE92K/wV8bEVfUNi9fLI3HrzmP2Im6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780508; c=relaxed/simple;
	bh=ByJymXy7iqh5fd0ek5s2J9GZXNnRiQFtJvcTdP3VZYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1P8a7eNZfFbXhULh+0TMDtJlcITTMsA7X3Osqm7B0y7KyqbcXnrqe1m5lxSyjByAi6+mpr2PyGqzhZfIO1WxgIfu4I173IsuoXzLApg9R+XePiOeVAEViXLL38DeGJSdIUP8C90eud4ioUPOYfXGSsguCf3dKTmM+/N+zTzFB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nKV4KAZF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nKV4KAZF"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06E0F4B0;
	Mon,  7 Sep 2026 13:26:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788780409;
	bh=ByJymXy7iqh5fd0ek5s2J9GZXNnRiQFtJvcTdP3VZYk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nKV4KAZFSl+rfF32HfcNXUCL2QUaiiJoSEHFzSyt0e5DEdzzB5Hbo5f56LdFmJZJy
	 R9XCQaJc4H3Il+SWEzV54WYYEwwCPoNqcksUDMqUQE/P4rIMo/knq0BbYHHpFOz/o/
	 tkB9VqcNmIIaH7g5pViTQtZRfMvI9094GqtDFuog=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 07 Sep 2026 14:27:56 +0300
Subject: [PATCH v4 01/13] drm/bridge: tc358762: Clean up register defines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-tc358762-fixes-v4-1-e3fc3ab5cd83@ideasonboard.com>
References: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
In-Reply-To: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
To: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2518;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ByJymXy7iqh5fd0ek5s2J9GZXNnRiQFtJvcTdP3VZYk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqnp/R45v02mRnpwiGJyKMgPs5iVEvJIBZXCiZf
 5cuCf26hIKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap6f0QAKCRD6PaqMvJYe
 9W6JEACO3otQ8o6mOmdcmD8xaME8XIOSPFZCVLyZm3quWB0poee4TxvQ67x2CP5ZXA+tuJ/1TLl
 RmPOZ2A/eumeckaAKovEC6xUle6GtCzeIFFGQV6fdav8aNnOb0yrglLnYvAIEMcaDwix/kv1GIm
 1U9DEmeg81YYG0THNdgYiuUEN8761KCVTy3C9Ss3I8Ho3FS880Thbg7c+Xaejm0hqzQjOy7/iIH
 LcZVdXDr+5P133coZlDYjYvOLzRDoFzd8vek+7sPWRfKJ5vIthMOShiWLK30fsgLsRyMW1C7Sqo
 AbsLSYs/2rY8y8zQ0i1SqXxYGeHfEHwVuuYysJtxuWmOZYujPfqWJt51uNv+S2F2jxEofj2jN48
 JpmD76zgCd7fGXT609UQiy0RFpb/D8VOIjQvPzc7aEW/Z4y/Ql4q5hv9gF7GTiHWhiCe590+rf8
 vvfi23pQfYZ2bjmodQdsdmg0yLiymdrYIvZRWz+aWvStnJPV2Qi2raXaApoNoiMMsb+SM8oLoCA
 5vrFML1cwp+LujxwhsyqPmDY55KNSoZG2kokPnKaOttNHCE7UCLm6ouqayLfBCaXbPjTnjuRW+v
 5dgQwfLK/kBs6UpQzYLxVr+n6W+2aKR0cuMlZi7p31MzHuHYoMgco6KGeKS2erafKXNVpD1PNuO
 khiJPRxk0D5Vpow==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Move the defines around and rename for clarity and consistency. No
functional change.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 6aa93b3274dd..dc20f253c7ad 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -28,17 +28,22 @@
 
 /* PPI layer registers */
 #define PPI_STARTPPI		0x0104 /* START control bit */
+#define PPI_STARTPPI_STARTPPI	BIT(0)
+
 #define PPI_LPTXTIMECNT		0x0114 /* LPTX timing signal */
 #define PPI_D0S_ATMR		0x0144
 #define PPI_D1S_ATMR		0x0148
 #define PPI_D0S_CLRSIPOCOUNT	0x0164 /* Assertion timer for Lane 0 */
 #define PPI_D1S_CLRSIPOCOUNT	0x0168 /* Assertion timer for Lane 1 */
-#define PPI_START_FUNCTION	1
 
 /* DSI layer registers */
 #define DSI_STARTDSI		0x0204 /* START control bit of DSI-TX */
+#define DSI_STARTDSI_STARTDSI	BIT(0)
+
 #define DSI_LANEENABLE		0x0210 /* Enables each lane */
-#define DSI_RX_START		1
+#define DSI_LANEENABLE_CLEN	BIT(0)
+#define DSI_LANEENABLE_L0EN	BIT(1)
+#define DSI_LANEENABLE_L1EN	BIT(2)
 
 /* LCDC/DPI Host Registers, based on guesswork that this matches TC358764 */
 #define LCDCTRL			0x0420 /* Video Path Control */
@@ -59,14 +64,8 @@
 /* System Controller Registers */
 #define SYSCTRL			0x0464
 
-/* System registers */
 #define LPX_PERIOD		3
 
-/* Lane enable PPI and DSI register bits */
-#define LANEENABLE_CLEN		BIT(0)
-#define LANEENABLE_L0EN		BIT(1)
-#define LANEENABLE_L1EN		BIT(2)
-
 struct tc358762 {
 	struct device *dev;
 	struct drm_bridge bridge;
@@ -117,7 +116,7 @@ static int tc358762_init(struct tc358762 *ctx)
 	u32 lcdctrl;
 
 	tc358762_write(ctx, DSI_LANEENABLE,
-		       LANEENABLE_L0EN | LANEENABLE_CLEN);
+		       DSI_LANEENABLE_L0EN | DSI_LANEENABLE_CLEN);
 	tc358762_write(ctx, PPI_D0S_CLRSIPOCOUNT, 5);
 	tc358762_write(ctx, PPI_D1S_CLRSIPOCOUNT, 5);
 	tc358762_write(ctx, PPI_D0S_ATMR, 0);
@@ -140,8 +139,8 @@ static int tc358762_init(struct tc358762 *ctx)
 	tc358762_write(ctx, SYSCTRL, 0x040f);
 	msleep(100);
 
-	tc358762_write(ctx, PPI_STARTPPI, PPI_START_FUNCTION);
-	tc358762_write(ctx, DSI_STARTDSI, DSI_RX_START);
+	tc358762_write(ctx, PPI_STARTPPI, PPI_STARTPPI_STARTPPI);
+	tc358762_write(ctx, DSI_STARTDSI, DSI_STARTDSI_STARTDSI);
 
 	msleep(100);
 

-- 
2.43.0

