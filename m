Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAD6478E5F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780512; cv=none; b=qaFK2N1tujJC0yAOVuW8rUXkFpDCOu1yEaxt6hya5EhS40LsxuXIIidGCOgwwZsLF/Vy+9B8LIz4HYAlIh4kJ6GdaWICpKKWnDe8bo8SSH3omEMLJp3ygPxYZ4OjHWMPkDSXFhQTcCmZv3NN+WBHYg+g/UVHWpgx9QcbFY1C7HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780512; c=relaxed/simple;
	bh=/zUZOuY4dD2SaTqPRCbXni1NC8QJPYbJvXVdgiO3Eug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RFyg8LIOdS+boSvpgyDYd3pfAe+Ok//XpNWnMF7u2VGK0j1qWJ2NTXwXRi3WkU2zIrx4yWa6UKxqz3dB4aJ8AepSj1lGK02WornUiVjp2b6+tHnU9x3DK+oJLRZQ1CzUfwER2Bts/SYs2UYBU2DR5WdlyT4IXJlFBQ8uQOzPfRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YKKO3la/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YKKO3la/"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E01EEE4E;
	Mon,  7 Sep 2026 13:26:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788780411;
	bh=/zUZOuY4dD2SaTqPRCbXni1NC8QJPYbJvXVdgiO3Eug=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YKKO3la/g2ZFdq9DBNKpv0as7t0twGm2YqAck2C6bioUYBHsWeUozWFAvedYiRi5W
	 X7mhjeUrlBy1H+mVZzfhlLU5KrX3wTb5QpDowgqY4FlV8pOlSwGT+h6sGZnBpqyPY6
	 08DgVbHGaeIFkA+gfLCR+m5BfJz9/e0MdPDXmtMs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 07 Sep 2026 14:27:58 +0300
Subject: [PATCH v4 03/13] drm/bridge: tc358762: Improve LCDCTRL defines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-tc358762-fixes-v4-3-e3fc3ab5cd83@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3005;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=/zUZOuY4dD2SaTqPRCbXni1NC8QJPYbJvXVdgiO3Eug=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqnp/SjKoz/+Fg5L2o/pNMagg1rVyF7f6jHC95M
 rN9XQNlxoKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap6f0gAKCRD6PaqMvJYe
 9bUwD/9hQM4kjr5Hq46WkQgNlNmVdukFILA3cJM3ddfv6FBxJVXWb5DFujT/ubaVoaymr3ugAEd
 //C5rcRkWGDne3WUE+S4p8uRZ5Rt5BjhwBaDWIXjC8dfCOy1MgsoYrQS594tiFjse1Qqf97BiHo
 jQ3nc6x6SrgFwLXQ1rgk2ezRrg/AqQqxkdvf1ri5/6EQNjWIeQDj4Za/ekBeVm4z5eWTUQcfH+C
 RjXY0TIf8sOQGkZIFp+ZIFbISJZj8CQc6iIqey2+Sr4Edo2FNJwXbsfCm1909TmvXKG+PmFaLWQ
 gglqNJK6TPwcGi4cXFbUrvxMtE3vnFD567rO7VS61H1BMsaFy3pU76Kft5ROS4EFbyfRjH+ahel
 2d5aGvoiUL9nO68NqpMh++A9Hwb2Er4rclaGSW/DbfShDiYt13lFXxYQoWf9hvIdWIQ28P9k3ER
 iU/NRlI/En3fb0b/qERtajVf+YJeChW5jR0dA/x2rrozY+Ztb6Wq2uCDiUUjO+PaC6iTCGkuEP/
 AK/npIj6ATyLY1aovRZQjmxeJutPmkOql5FEjXY05wMua8QMysW6qKKt/ZoZYNA8f0h9p3341WP
 6anzzXyfcoPNVfm9FiiBdgsTgzt3Vo0ZbaHTaTQXexcGweSsgI8VSp06s9O449RSUKS5lZBT8VE
 lXtioP+PaxU4+FQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

LCDCTRL fields are quite wrong in the driver. Fix the field defines.

A few notes about the wrong fields:

LCDCTRL_VSDELAY(1) actually sets LCDCTRL_DCLK_POL
LCDCTRL_UNK6 | LCDCTRL_VTGEN actually set LCDCTRL_PXLFORM_RGB888
LCDCTRL_RGB888 actually sets LCDCTRL_DPI_EN

The total still resulted in a working display even if the defines were
quite wrong.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 5630cead7cd8..fcd741f5765d 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -46,17 +46,22 @@
 #define DSI_LANEENABLE_L0EN	BIT(1)
 #define DSI_LANEENABLE_L1EN	BIT(2)
 
-/* LCDC/DPI Host Registers, based on guesswork that this matches TC358764 */
+/* LCDC/DPI Registers */
 #define LCDCTRL			0x0420 /* Video Path Control */
 #define LCDCTRL_MSF		BIT(0) /* Magic square in RGB666 */
-#define LCDCTRL_VTGEN		BIT(4)/* Use chip clock for timing */
-#define LCDCTRL_UNK6		BIT(6) /* Unknown */
-#define LCDCTRL_EVTMODE		BIT(5) /* Event mode */
-#define LCDCTRL_RGB888		BIT(8) /* RGB888 mode */
-#define LCDCTRL_HSPOL		BIT(17) /* Polarity of HSYNC signal */
-#define LCDCTRL_DEPOL		BIT(18) /* Polarity of DE signal */
-#define LCDCTRL_VSPOL		BIT(19) /* Polarity of VSYNC signal */
-#define LCDCTRL_VSDELAY(v)	(((v) & 0xfff) << 20) /* VSYNC delay */
+#define LCDCTRL_VTGEN		BIT(1) /* Use chip clock for timing */
+#define LCDCTRL_PXLFORM		GENMASK_U32(6, 4)
+#define LCDCTRL_PXLFORM_RGB666		0	/* x:R:G:B 6:8:8:8 */
+#define LCDCTRL_PXLFORM_RGB666_24	1	/* x:R:x:G:x:B 2:6:2:6:2:6 */
+#define LCDCTRL_PXLFORM_RGB565		2	/* x:R:G:B 8:5:6:5 */
+#define LCDCTRL_PXLFORM_RGB565_1	3	/* x:R:x:G:x:B 3:5:2:6:3:5 */
+#define LCDCTRL_PXLFORM_RGB565_2	4	/* x:R:x:G:x:B:x 2:5:3:6:2:5:1 */
+#define LCDCTRL_PXLFORM_RGB888		5	/* R:G:B 8:8:8 */
+#define LCDCTRL_DPI_EN		BIT(8)
+#define LCDCTRL_HSYNC_POL	BIT(17) /* Polarity of HSYNC signal */
+#define LCDCTRL_DE_POL		BIT(18) /* Polarity of DE signal */
+#define LCDCTRL_VSYNC_POL	BIT(19) /* Polarity of VSYNC signal */
+#define LCDCTRL_DCLK_POL	BIT(20) /* Polarity of pixel clock */
 
 /* SPI Master Registers */
 #define SPICMR			0x0450
@@ -139,14 +144,16 @@ static int tc358762_init(struct tc358762 *ctx)
 
 	tc358762_write(ctx, SPICMR, 0x00);
 
-	lcdctrl = LCDCTRL_VSDELAY(1) | LCDCTRL_RGB888 |
-		  LCDCTRL_UNK6 | LCDCTRL_VTGEN;
+	lcdctrl = FIELD_PREP(LCDCTRL_PXLFORM, LCDCTRL_PXLFORM_RGB888) |
+		  LCDCTRL_DPI_EN;
+
+	lcdctrl |= LCDCTRL_DCLK_POL;
 
 	if (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC)
-		lcdctrl |= LCDCTRL_HSPOL;
+		lcdctrl |= LCDCTRL_HSYNC_POL;
 
 	if (ctx->mode.flags & DRM_MODE_FLAG_NVSYNC)
-		lcdctrl |= LCDCTRL_VSPOL;
+		lcdctrl |= LCDCTRL_VSYNC_POL;
 
 	tc358762_write(ctx, LCDCTRL, lcdctrl);
 

-- 
2.43.0

