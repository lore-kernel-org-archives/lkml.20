Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F49041BA63
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182897; cv=none; b=sseCJv5O2naGIAzLVdgp33QWdsHb9Nz/fmTwsmg/tj11NbSoae9uOdOsINmWgxLrYxRG2syHeJd4TL9dL961tFKt1qM0AMhqi9AucPEh3rvego8pSKvKMZxKXKqeQvaTxm7Q7YTmX4UUM7WVcS8IBZ3tyDBoUy1GInKWZ0pwVec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182897; c=relaxed/simple;
	bh=64K2cghv9Pu2xpnXUBYhri9wjrzdmxCfnbz+dJ+v7CA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TIQQXHsb35TZsVlSW9MmUVLXjP+60y5+ID5R7HfDjYiJ5phSiHdz2khDDDevcuWSJbatBfvTkIXxArVEDUsgTOrJNesMcmqoDY/jDZGpgQMB3C0z2DCQijKKRK6Rk1WiFTnlwW5vjLQ+8McmY5Ju2ZygmzPNbZzC2dPSCTfjUDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=CMLcfY9L; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="CMLcfY9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1788182888; x=1788442088;
	bh=3fdS3EZrph4HPHI4SWA+jBFn4XLmDsXX2TCBKNHGKYY=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=CMLcfY9LMqElBerz4Y0gbbLazZXPBSBZdl0dTTKpUV/lc3HJaSca8he9IjoHfBibw
	 QUUYhsdcaLRdk4Kir3R4e9Qrl4/LZmE3vwT5aZGuJpVyy/hfVj5hyAvm9+5//xKQMH
	 tDof5RSTyxK5wRDIvDhixY9WPbi7lw6kZ/buAbIGv5Se+HkR7AubplOtmIOR13FExE
	 GzhJQHv7DKCvk9OzX3WbKRVjF6dLBjGn4YxeBug6Y8OvWtAYqzFGIQTMIBwoPqXy1H
	 KG5rP0qQtzZauMnj1T50lKnCV6IS2Xruk5hP4C6XRtzr0vOUYHEFAUPGDaKRfIH4dK
	 p/FaToipswH0w==
X-Pm-Submission-Id: 4hYVDQ0gLBz2Schm
From: Esben Haabendal <esben@geanix.com>
Date: Mon, 31 Aug 2026 15:27:46 +0200
Subject: [PATCH v4 4/4] drm/bridge: nwl-dsi: Correct MIPI DSI horizontal
 sync timing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-nwl-dsi-fixes-v4-4-6a2a1cb23910@geanix.com>
References: <20260831-nwl-dsi-fixes-v4-0-6a2a1cb23910@geanix.com>
In-Reply-To: <20260831-nwl-dsi-fixes-v4-0-6a2a1cb23910@geanix.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Fabio Estevam <festevam@gmail.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Sam Ravnborg <sam@ravnborg.org>
Cc: Esben Haabendal <esben@geanix.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, "Oliver F. Brown" <oliver.brown@oss.nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788182874; l=4295;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=64K2cghv9Pu2xpnXUBYhri9wjrzdmxCfnbz+dJ+v7CA=;
 b=YLqsr0ZSDA2TJ+CpZrx6XWdrlH2XyAh4K5+wi1c98Erjem/qUGO+Q4MF61X2YPRl5dky0V533
 +05wNbV9QW3BJaTdchwTc/YmIC3Y97qeheTxN+xOm5QAjliWl0Xap0k
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

The NWL MIPI Host controller registers specifies the horizontal front
porch, sync pulse, and back porch in DSI packet payload size in bytes (ie.
not in pixel clocks).

The calculation for this is (mostly) described in section 13.6.3.5.1.2 of
the i.MX 8M Dual/8M QuadLite/8M Quad Applications Processors Reference
Manual (rev. 3.1). The formula shown there does not take packet header size
into account though.

The formula implemented here converts the hfp, hsa, and hbp to DSI packet
bytes and then subtracts the number of packet header bytes.

It is worth noting that these values only needs to match approximately,
according to the reference manual.

Based on commit in NXP vendor tree
commit f2a61699749d ("LF-7981-4: drm/bridge: nwl-dsi: Correct MIPI DSI horizontal sync timing")

Signed-off-by: Esben Haabendal <esben@geanix.com>
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: Oliver F. Brown <oliver.brown@oss.nxp.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 60 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index f3f4334136c0..eb604733eea0 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -22,6 +22,7 @@
 #include <linux/reset.h>
 #include <linux/sys_soc.h>
 #include <linux/time64.h>
+#include <linux/math64.h>
 
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
@@ -264,6 +265,9 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
 	bool burst_mode;
 	int hfront_porch, hback_porch, vfront_porch, vback_porch;
 	int hsync_len, vsync_len;
+	int hfp, hbp, hsa;
+	u64 hs_clk_rate, pclk_rate;
+	int h_blank, pkt_hdr_len, pkt_len;
 
 	hfront_porch = dsi->mode.hsync_start - dsi->mode.hdisplay;
 	hsync_len = dsi->mode.hsync_end - dsi->mode.hsync_start;
@@ -317,9 +321,59 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
 			      dsi->mode.hdisplay);
 	}
 
-	nwl_dsi_write(dsi, NWL_DSI_HFP, hfront_porch);
-	nwl_dsi_write(dsi, NWL_DSI_HBP, hback_porch);
-	nwl_dsi_write(dsi, NWL_DSI_HSA, hsync_len);
+	hs_clk_rate = dsi->phy_cfg.mipi_dphy.hs_clk_rate;
+	pclk_rate = (u64)dsi->mode.clock * 1000;
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "hs_clk_rate: %llu Hz\n", hs_clk_rate);
+
+	/*
+	 * Calculate the bytes needed, according to the RM formula:
+	 * Time of DPI event = time to transmit x number of bytes on the DSI interface
+	 * dpi_event_size * dpi_pclk_period = dsi_bytes * 8 * hs_bit_period / num_lanes
+	 * ===>
+	 * dsi_bytes = dpi_event_size * dpi_pclk_period * num_lanes / (8 * hs_bit_period)
+	 * ===> (substituting period = 1 / rate)
+	 * dsi_bytes = dpi_event_size * num_lanes * hs_clk_rate / (8 * dpi_pclk_rate)
+	 */
+	hfp = DIV64_U64_ROUND_UP((u64)hfront_porch * dsi->lanes * hs_clk_rate, 8 * pclk_rate);
+	hbp = DIV64_U64_ROUND_UP((u64)hback_porch * dsi->lanes * hs_clk_rate, 8 * pclk_rate);
+	hsa = DIV64_U64_ROUND_UP((u64)hsync_len * dsi->lanes * hs_clk_rate, 8 * pclk_rate);
+
+	/* Make sure horizontal blankins are even numbers */
+	hfp = roundup(hfp, 2);
+	hbp = roundup(hbp, 2);
+	hsa = roundup(hsa, 2);
+
+	/*
+	 * We need to subtract the packet header length: 32
+	 * In order to make sure we don't get negative values,
+	 * subtract a proportional value to the total length of the
+	 * horizontal blanking duration.
+	 */
+	h_blank = hfp + hbp + hsa;
+
+	if (h_blank) {
+		pkt_len = min(hfp, roundup(((hfp * 100 / h_blank) * 32) / 100, 2));
+		pkt_hdr_len = pkt_len;
+		hfp -= pkt_len;
+
+		pkt_len = min(hbp, roundup(((hbp * 100 / h_blank) * 32) / 100, 2));
+		pkt_hdr_len += pkt_len;
+		hbp -= pkt_len;
+
+		pkt_len = min(hsa, 32 - pkt_hdr_len);
+		pkt_hdr_len += pkt_len;
+		hsa -= pkt_len;
+		if (pkt_hdr_len != 32)
+			dev_warn(dsi->dev,
+				 "Unable to subtract packet header length fully: %d left\n",
+				 32 - pkt_hdr_len);
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Register values: hfp=%d hbp=%d hsa=%d\n", hfp, hbp, hsa);
+
+	nwl_dsi_write(dsi, NWL_DSI_HFP, hfp);
+	nwl_dsi_write(dsi, NWL_DSI_HBP, hbp);
+	nwl_dsi_write(dsi, NWL_DSI_HSA, hsa);
 
 	nwl_dsi_write(dsi, NWL_DSI_ENABLE_MULT_PKTS, 0x0);
 	nwl_dsi_write(dsi, NWL_DSI_BLLP_MODE, 0x1);

-- 
2.55.0

