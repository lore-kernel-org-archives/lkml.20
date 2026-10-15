Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415194ED18A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062993; cv=none; b=EzdDIhc8vFegKJdQrJhedFHg8NJdO5J9VEyauz3e6SwaywYgc5yLvMlX6NmUEPHg8UA5jOGrpTw0IkiLNQJLKlKU62Q4xU+x+Tp+qqUWaeopaoAvmOOmnQGaRw78lvckrNwzvW9OEU8LW1Jf+eLYaUYVypynoB501c5B/T5UtxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062993; c=relaxed/simple;
	bh=hcEs1EESDACSG5FDi0QNjOuOs0/cXvky+phx60RikVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tTjaMr7aRR2VoG4qQLgMqP0MS9oFTYubBfTQDwttGHPYTQlaLDaT4UhX0ZF6lfFXp1Hlio9HiyJzE6WMKgtpvH62/Ehb2dPWJ7NIHS/tPwi2icUQcz1o9BnIFb7TpocNe0iUffdNdipcOtFcnepJjEhmK5+Rpm5ycZpF63BgywI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XsVovh7f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XsVovh7f"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 297C92F8;
	Thu, 15 Oct 2026 13:14:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792062865;
	bh=hcEs1EESDACSG5FDi0QNjOuOs0/cXvky+phx60RikVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XsVovh7fQHvjw45Ls2tbeRsulV4sYjocwfUZcPjLFbV47udYL4Fe3+IyyNsKAZiPt
	 E24YPIr28ONbb641NaJZqna0wM42wRVbEYnePI48+lwUj/tAZCdexWYXzSZwLJE3rp
	 qf5ihr4l7r5dBGj7Xai8EAkVIpsZ7//vpB5fpqFA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 15 Oct 2026 14:15:52 +0300
Subject: [PATCH v5 01/13] drm/bridge: tc358762: Clean up register defines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-tc358762-fixes-v5-1-7cd721a6451b@ideasonboard.com>
References: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
In-Reply-To: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
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
 bh=hcEs1EESDACSG5FDi0QNjOuOs0/cXvky+phx60RikVg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq0LYEzsJro3jK1pHnpUI7oQrZtK0pXvQS//8e8
 M2itL9bkE+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCatC2BAAKCRD6PaqMvJYe
 9dgiEACx1EvHIDxdoaPYpELqLC3J0fExWHWzdwCHcb0iw4Y5OHM8kInbnNXJzqkktJ3V1GSr4jW
 cEy/dl3Sx7bfu2Uu7h9VC0gN4FYFuZDOt4Jws71cUQqaCB+sXMO9Y9CjLZ6aF4Qqgm9hhFU/sw9
 UjOP/3dlT5NpP7kB/k3okYDoONWOppF6tdUp8ZBT3dY3kZtcZGXk+ygbDGLeT7PMXz9WoxmionN
 4cnjm9lwq1mOOpBg0gxs6bX3GDFG178lx8cNaHs7Ybfu1LPjRp/SSqlq3o8BxpV2XAO0ezffkXF
 T9BVb6IBdtsKdf4YCeaHFAW+3is49WWbqSLjGkIM4MnNJxy1JBegIXTmBIvzaE2eL97pgkjT5nm
 w5D8Zy5QngPOhXKXnuiRlstCcXPwhcY8OZX5pfgPSO9n2mp/gvgCKZx+wp9M0dsXjCNiaJeS9ZQ
 +lO/ftbEVOPT8OssiGs/ZdQT6oTCZTPTyKVgtOU8N1vpPzgq6fu96ZAOEgQwC1aRtMYjUAuDSlH
 26t0/fqV3p2RZBIdwpKQ192xgCoxIxyJIZtSdsCWdo99sPhD+DHJn226l1Z9FNTbuDZ8ExWt4GI
 oueOAVPp6/ak6c8eCUYgve7Hq5KOKw9d+wWXD7KTrg+jWr1bF65YuvAHa8ReTHtva2KvMn5kcUE
 BTxM2BSPjNtqeiw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Move the defines around and rename for clarity and consistency. No
functional change.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 76564d5e4f69..097d2f331a16 100644
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

