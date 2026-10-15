Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79294FE2D7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063002; cv=none; b=j4Aoc4mwbl6Z9PS2RU6lQZLS8T3nfiBSaGkBdK+f2fHJyIbpZO8O/VEPMjamhjnxHh3HtoxLxa1GSIGcOkI2uWMp2wcTcnGHI81HXm07+pNlTWOy80lyfhKjFLLNGLLtameRjjao20tIKsQacOxytZJSY3SV7aezD6LiG06zTiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063002; c=relaxed/simple;
	bh=+nFQtxFFynf+jDfolcK2GFFb3OyIB5wHYX5vygEBrnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cA9nEPt4/JmcqbK1PdfhN9gsUGCf6PtmxiBk5bRylaWrH3F4uKKzfFDBJmqgMJkTIY5D8+csPPD4k2eM7T54x8NmQMEURnpNvPRQ9ldyAVAfuQw7txwy+iO+2bmCDYexJa0ulAlRogcctGCT0TIINPemE/zVTSjFBEp4cEt9/VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=P3OxeOWI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P3OxeOWI"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C0BA874;
	Thu, 15 Oct 2026 13:14:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792062868;
	bh=+nFQtxFFynf+jDfolcK2GFFb3OyIB5wHYX5vygEBrnU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P3OxeOWI6PpdrM0Ti7b3lu9i2yI34IxOz5bJ2S1Qyy2qOvZD7PZORVTftAO4GOYpN
	 SY+HSJL8NfqmIahkC09+h+gKM2AKSlaaF51RGOPuJ8mAg6welm/ex/UZNEuhjcKY01
	 aR4U3aKgwB+P2VTD/3L5RKPWkxsXq4lSyEAh6Thc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 15 Oct 2026 14:15:55 +0300
Subject: [PATCH v5 04/13] drm/bridge: tc358762: Configure SYSCTRL first
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-tc358762-fixes-v5-4-7cd721a6451b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=+nFQtxFFynf+jDfolcK2GFFb3OyIB5wHYX5vygEBrnU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq0LYFZvN/CyX6eh2vNoe9geYlXz2aqC75pJy5H
 v2fzMx/XeaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCatC2BQAKCRD6PaqMvJYe
 9SMpD/kBAOXa+utuKo61UXQatORkBy8SPmkIVZFLnu1Trw77fgpphyKVRcapRxpTlLJj1enR8a9
 UbKFIh+VwmbCW/+G9RuRZcXtctppDvNw5/6k5uASL96x2Lh3jWYLxE1BTj1PU9B4+hnoCVJC0Yl
 oOr5xhpJR1g8MhaSMk87vBD2m+Nc6Aia/ueripuTz6j5obRNt3bPLcoRcbqQnN1DDry66ps1un3
 PxDyNvDfASSA7SldiF2meA5SL5n2NqOi7y3mTQ4RL7SKYr97FfBW01D36++v05qFIjDUxWMJg1E
 MRNAMdRnzrm/8ddPqZzxzlpVydpOq4dncL4a0F/O80Bd04xgK757XX9wIOy5TVxYl/mBzdj0MaB
 uih0tisYcv8jEYtTDAPqObNTKujWnEimkqtPb0jbtRRsUxs5LcKCovOsnvaWSncHyDMhKoJImHD
 2PsA3SD2RxbvKAdl1RIFNRSrfQuiwWHXNK/RY1zQNAnDvZNi+TKO5jN2+yLTlbfapIJluth59n/
 eVpB7+DnQgKTLdqc0+GS2Fp/iypXEs3lF1qqHXGgyYCP3vQYCZLSp40kRWnCj158db064ZtunV5
 qbKk8Av3pkz5yFZ78zppEeXeyIBfrJSByBjSm2q9pIWTDUkDvVVerKICztsINwwdkXlgrFb0mhq
 lZYext2/FgZ5iug==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

SYSCTRL affects the DPI output and the clock tree, but we configure it
late, when the DPI output is already enabled and clocks are running.

Move the SYSCTRL configuration to the beginning, before anything is
enabled.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 26671dc66874..f5ee781275fc 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -134,6 +134,13 @@ static int tc358762_init(struct tc358762 *ctx)
 {
 	u32 lcdctrl;
 
+	tc358762_write(ctx, SYSCTRL,
+		       FIELD_PREP(SYSCTRL_DPIDATA_IO_MASK, SYSCTRL_DPIDATA_IO_4MA) |
+		       FIELD_PREP(SYSCTRL_DPISTB_IO_MASK, SYSCTRL_DPISTB_IO_4MA) |
+		       FIELD_PREP(SYSCTRL_PCLKDIV_MASK, SYSCTRL_PCLKDIV_DIV_3));
+
+	msleep(100);
+
 	tc358762_write(ctx, DSI_LANEENABLE,
 		       DSI_LANEENABLE_L0EN | DSI_LANEENABLE_CLEN);
 	tc358762_write(ctx, PPI_D0S_CLRSIPOCOUNT, 5);
@@ -157,13 +164,6 @@ static int tc358762_init(struct tc358762 *ctx)
 
 	tc358762_write(ctx, LCDCTRL, lcdctrl);
 
-	tc358762_write(ctx, SYSCTRL,
-		       FIELD_PREP(SYSCTRL_DPIDATA_IO_MASK, SYSCTRL_DPIDATA_IO_4MA) |
-		       FIELD_PREP(SYSCTRL_DPISTB_IO_MASK, SYSCTRL_DPISTB_IO_4MA) |
-		       FIELD_PREP(SYSCTRL_PCLKDIV_MASK, SYSCTRL_PCLKDIV_DIV_3));
-
-	msleep(100);
-
 	tc358762_write(ctx, PPI_STARTPPI, PPI_STARTPPI_STARTPPI);
 	tc358762_write(ctx, DSI_STARTDSI, DSI_STARTDSI_STARTDSI);
 

-- 
2.43.0

