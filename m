Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887552;
	b=J+X1mqGAD3IPJ1pPrjl/52Z2HY1Ogij6HAYmCeb3N8B/q7XE8REZ0UXk4xYsNpZsRKy6
	 ySOY66VYMLph9C2JAbQRie0qEIIV2blZcrW6+T5gbYsrL4AokxQRc8/kYl85PbMza/wwU
	 n3CgkMsrOKluzdmavNJdN+s1TdUAEISb7COW/WCd4lF/O96g0ioYJem3+YUgf7MxnGfrk
	 z/EGVFzgY3VPOd0nQTnCPxkEpa/BUydWkc0WzEtbnKK7ssGjc3x4pPggqYfanv1ssmzxA
	 iseQUNJBYkatk63xNk5+OIURzlmEF/F+8ZMAMpj149amNvZZtPehZD6HlcbeQKN9dSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BaPNG1o4TaNPyIULQFVW76nhwslGMnxXokk7UDVRgLU=;
	b=3YEjeQr7fw6q0W1PlNoWhynNzmZFtuhv7cdoTWXFY8IvJb0lIPrq8yyiYRsi7DWumREN
	 2VdgxiP/Yz3i2VCU9HIV/ikaeysuGIMVya/1oOwGcNjWic/AD82vETtBWb7trThBrZImG
	 Ut5PvJzJVH/4RxgYHZLGbrFbJfwA2FMO/BW8fDIPQp82ueD/QLcb2oFlJdeViPBZaWDpj
	 HtkoAv5qgO2e4PBNX3UAA3+JIL9o3++rScBVJZD+r9jsppNPWsT8PyC8eMniFfMCvP6bN
	 4eE56Bj4gXLyYvodCs1v/DcDiFzp3yrl4Pyxs02JRW7gM47F2HcPs2HIVMh6f8FE7Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iYnqlS5A;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4504B606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4504B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iYnqlS5A
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4919a880834so370326f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887550; x=1794492350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BaPNG1o4TaNPyIULQFVW76nhwslGMnxXokk7UDVRgLU=;
        b=iYnqlS5A5O/RI9tOlUkyUvOGSkSFzgx+WO2dFGPEVq7BLQ6Mz7hdDtSvAI3osyqjTd
         e8giWTEeWXLul8cmexq3LpV+ZoGyjfSqPbpNjqDBfZ6wWLaUoVbwMU/gZLGvlWVcRsNQ
         zp2zJzA+Na7qbRlUz6M/FuOA0JLs+EsHZAf8KojaRc2MdmdW3SyXjYXKmhOQwsJV53jN
         kvtInIq6IWGoc8QuvCzA5s1waqXtbnh9Q5vxiJBbRLQP/lI6UbGOxMdplAjyjEcWnR7X
         Xzj6OQq8yiu2H13WMOUN3e2MOiposv7lli4r0wDxOQurCS9xfTwqqo+2icK5mn6NzvMg
         c3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887550; x=1794492350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BaPNG1o4TaNPyIULQFVW76nhwslGMnxXokk7UDVRgLU=;
        b=sL0b051blSkPCMWFYzFWIrONHh8p9tZiccz7Z7zZzIdpq52qIFmXPMxugvw6dmsLMn
         LoLKe7WOsJcCZpPIwjtm9GM6bzVWU92PrQ1y21g2DwESp7JHCPCyDJKxZRAEXdMKczhT
         vDHjYWkF5tamBRE1KI/ZObvJKvC6x69kbgSS4eMc/ClW+w61HD7VCkqr1ArgqRHUixhi
         mS9mTPYXMu9rBoCbH9txcdrnHRxvj6YKXsZXbTEe0638CeV6sZp2xG3zCsWz+lTlmZbS
         VX9Di0Z2CmE2UKisVdpCnsgJuhGhvyZi/eMEIcycQ58k5JVAgMAxOCkHx3sjdvZsKFIC
         CghQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXwYNcfGAUcDEodeU4LSYu3X5nyFnVg42FqjtblgGBf+bEVGRwwPAZ5ynrJAnfmjI9k4TfoiuuJwJFvFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NcMQCL3LpQZwbqweRBaY8WWyoscqaihPneA8mz4AP7O45Jf1c
	FTpOIYc3sA/taNJ+AjhgKtMeDFkeQ+hotC1Y1Wc3RHQsAd3PiGiT8Eg6
X-Gm-Gg: AYBFou3IDIBTZIJcc1+qDgP+KWyo4E79lxeehI6xbUyJE0hoTvZe+VcevhIsHYODDbh
	b3FQb6nkqI3PVn5PD1oDNYVb1WyqOrItYYIS0uGYGrw+JxnKN8VzsUGL9O42tQ6cUopcTLf9TtJ
	w4M0frsrxg18Z0vNZr2Rh2KndEhncezwGPThoRVIbKVo4J18U+iA+aMrs/ZXdHqBNsnPVtrnhR1
	HvLlktK5D9Zha1t4SdNvDogY4nS7cd6lJEEURaDxrAp52KMhNGdDK9W9bboWWk+//1YCNFUVkMH
	oQmGLwsxPzFz1yzbV1v9o+wH88PuTONb+3AtKjb9+wgEJssBw93XgnH1TtuEmDE26z784ALjl0N
	MyeauFUyBU3h5GwdqFTQdLu8eUL+mPhL4jYxf4Ye6owpxPRhEark4u4/ZiCpWovpC1sEQocOXz3
	Cdg5sZEyXfAAVEow32uj0tuoKosPHEUWeF+pfr3FZoY8MgnK/+Hj/V/ZPdJcmazoYnRJi6Xvq8k
	ENrxpQIRDGdia3eAeDx4VPSpmnTDPiqhPZzTPyXS/udoRwoWujiNg4vMj8K5LE0cF6Ixs934XbB
	5d4JkSa7HG5Xtd/zLX7x4tXdTT3nhRrpwP+IAbXDUVq+yGsCQg==
X-Received: by 2002:a05:6000:29d9:b0:48b:10c8:2181 with SMTP id ffacd0b85a97d-48e6e2f6ec4mr27255759f8f.27.1793887549455;
        Thu, 05 Nov 2026 06:05:49 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11454111f8f.45.2026.11.05.06.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:05:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 02/10] drm/panel: Convert Hitachi TX10D07VM0BAA to use MIPI DBI bus
Date: Thu,  5 Nov 2026 16:05:02 +0200
Message-ID: <20261105140510.165165-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105140510.165165-1-clamor95@gmail.com>
References: <20261105140510.165165-1-clamor95@gmail.com>
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

Switch from a generic platform driver to a dedicated MIPI DBI driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 167 ++++++++----------
 1 file changed, 78 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
index 83c2af1be9755..d5d7ba2096608 100644
--- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
+++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
@@ -14,6 +14,7 @@
 #include <video/mipi_display.h>
 
 #include <drm/drm_mipi_dbi.h>
+#include <drm/drm_mipi_dbi_bus.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_tx10d07vm0baa_supplies[] = {
 
 struct hitachi_tx10d07vm0baa {
 	struct drm_panel panel;
-	struct mipi_dbi *dbi;
+	struct mipi_dbi_device *dbi;
 
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset_gpio;
@@ -36,13 +37,12 @@ static inline struct hitachi_tx10d07vm0baa *to_hitachi_tx10d07vm0baa(struct drm_
 	return container_of(panel, struct hitachi_tx10d07vm0baa, panel);
 }
 
-#define panel_dbi_command(priv, cmd, seq...) \
+#define panel_dbi_command(dbidev, cmd, seq...) \
 ({ \
 	const u8 d[] = { seq }; \
-	struct drm_panel *panel = &(priv)->panel; \
-	struct device *dev = panel->dev; \
+	struct device *dev = &(dbidev)->dev; \
 	int ret; \
-	ret = mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE(d)); \
+	ret = mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SIZE(d)); \
 	if (ret) \
 		dev_err_ratelimited(dev, "error %d when sending command %#02x\n", ret, cmd); \
 	ret; \
@@ -54,10 +54,6 @@ static int hitachi_tx10d07vm0baa_prepare(struct drm_panel *panel)
 	struct device *dev = panel->dev;
 	int ret;
 
-	priv->dbi = dev_get_drvdata(dev->parent);
-	if (!priv->dbi)
-		return -ENODEV;
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(hitachi_tx10d07vm0baa_supplies), priv->supplies);
@@ -79,123 +75,116 @@ static int hitachi_tx10d07vm0baa_enable(struct drm_panel *panel)
 {
 	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
 
-	panel_dbi_command(priv, MIPI_DCS_SET_PARTIAL_ROWS, 0x00, 0x00, 0x03, 0x1f);
-	panel_dbi_command(priv, MIPI_DCS_SET_SCROLL_AREA, 0x00, 0x00, 0x03, 0x20,
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_PARTIAL_ROWS, 0x00, 0x00, 0x03, 0x1f);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_SCROLL_AREA, 0x00, 0x00, 0x03, 0x20,
 			  0x00, 0x00);
 
-	panel_dbi_command(priv, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
-	panel_dbi_command(priv, MIPI_DCS_SET_SCROLL_START, 0x00, 0x00);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_SCROLL_START, 0x00, 0x00);
 
-	panel_dbi_command(priv, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_24BIT);
-	panel_dbi_command(priv, MIPI_DCS_SET_TEAR_SCANLINE, 0x00, 0x00);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_24BIT);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_TEAR_SCANLINE, 0x00, 0x00);
 
-	panel_dbi_command(priv, 0x71, 0x00);		/* Ex_Vsync_en */
+	panel_dbi_command(priv->dbi, 0x71, 0x00);		/* Ex_Vsync_en */
 
-	panel_dbi_command(priv, 0xb2, 0x00);		/* VCSEL */
-	panel_dbi_command(priv, 0xb4, 0xaa);		/* setvgmpm */
-	panel_dbi_command(priv, 0xb5, 0x33);		/* rbias1 */
-	panel_dbi_command(priv, 0xb6, 0x03);		/* rbias2 */
+	panel_dbi_command(priv->dbi, 0xb2, 0x00);		/* VCSEL */
+	panel_dbi_command(priv->dbi, 0xb4, 0xaa);		/* setvgmpm */
+	panel_dbi_command(priv->dbi, 0xb5, 0x33);		/* rbias1 */
+	panel_dbi_command(priv->dbi, 0xb6, 0x03);		/* rbias2 */
 
-	panel_dbi_command(priv, 0xb7, 0x1a, 0x33, 0x03, 0x03,
+	panel_dbi_command(priv->dbi, 0xb7, 0x1a, 0x33, 0x03, 0x03,
 			  0x03, 0x00, 0x00, 0x01, 0x02, 0x00,
 			  0x00, 0x04, 0x00, 0x01, 0x01, 0x01);	/* set_ddvdhp */
-	panel_dbi_command(priv, 0xb8, 0x1c, 0x53, 0x03, 0x03,
+	panel_dbi_command(priv->dbi, 0xb8, 0x1c, 0x53, 0x03, 0x03,
 			  0x00, 0x01, 0x02, 0x00, 0x00, 0x04,
 			  0x00, 0x01, 0x01);			/* set_ddvdhm */
 
-	panel_dbi_command(priv, 0xb9, 0x0a, 0x01, 0x01, 0x00,
+	panel_dbi_command(priv->dbi, 0xb9, 0x0a, 0x01, 0x01, 0x00,
 			  0x00, 0x00, 0x02, 0x00, 0x02, 0x01);	/* set_vgh */
-	panel_dbi_command(priv, 0xba, 0x0f, 0x01, 0x01, 0x00,
+	panel_dbi_command(priv->dbi, 0xba, 0x0f, 0x01, 0x01, 0x00,
 			  0x00, 0x00, 0x02, 0x00, 0x02, 0x01);	/* set_vgl */
-	panel_dbi_command(priv, 0xbb, 0x00, 0x00, 0x00, 0x00,
+	panel_dbi_command(priv->dbi, 0xbb, 0x00, 0x00, 0x00, 0x00,
 			  0x01, 0x02, 0x01);			/* set_vcl */
 
-	panel_dbi_command(priv, 0xc1, 0x01);		/* number of lines */
-	panel_dbi_command(priv, 0xc2, 0x08);		/* number of fp lines */
-	panel_dbi_command(priv, 0xc3, 0x04);		/* gateset(1) */
-	panel_dbi_command(priv, 0xc4, 0x4c);		/* 1h period */
-	panel_dbi_command(priv, 0xc5, 0x03);		/* source precharge */
-	panel_dbi_command(priv, 0xc6, 0xc4, 0x04);	/* source precharge timing */
-	panel_dbi_command(priv, 0xc7, 0x00);		/* source level */
-	panel_dbi_command(priv, 0xc8, 0x02);		/* number of bp lines */
-	panel_dbi_command(priv, 0xc9, 0x10);		/* gateset(2) */
-	panel_dbi_command(priv, 0xca, 0x04, 0x04);	/* gateset(3) */
-	panel_dbi_command(priv, 0xcb, 0x03);		/* gateset(4) */
-	panel_dbi_command(priv, 0xcc, 0x12);		/* gateset(5) */
-	panel_dbi_command(priv, 0xcd, 0x12);		/* gateset(6) */
-	panel_dbi_command(priv, 0xce, 0x30);		/* gateset(7) */
-	panel_dbi_command(priv, 0xcf, 0x30);		/* gateset(8) */
-	panel_dbi_command(priv, 0xd0, 0x40);		/* gateset(9) */
-	panel_dbi_command(priv, 0xd1, 0x22);		/* flhw */
-	panel_dbi_command(priv, 0xd2, 0x22);		/* vckhw */
-	panel_dbi_command(priv, 0xd3, 0x04);		/* flt */
-	panel_dbi_command(priv, 0xd4, 0x14);		/* tctrl */
-	panel_dbi_command(priv, 0xd6, 0x02);		/* dotinv */
-	panel_dbi_command(priv, 0xd7, 0x00);		/* on/off sequence period */
-
-	panel_dbi_command(priv, 0xd8, 0x01, 0x05, 0x06, 0x0d,
+	panel_dbi_command(priv->dbi, 0xc1, 0x01);		/* number of lines */
+	panel_dbi_command(priv->dbi, 0xc2, 0x08);		/* number of fp lines */
+	panel_dbi_command(priv->dbi, 0xc3, 0x04);		/* gateset(1) */
+	panel_dbi_command(priv->dbi, 0xc4, 0x4c);		/* 1h period */
+	panel_dbi_command(priv->dbi, 0xc5, 0x03);		/* source precharge */
+	panel_dbi_command(priv->dbi, 0xc6, 0xc4, 0x04);	/* source precharge timing */
+	panel_dbi_command(priv->dbi, 0xc7, 0x00);		/* source level */
+	panel_dbi_command(priv->dbi, 0xc8, 0x02);		/* number of bp lines */
+	panel_dbi_command(priv->dbi, 0xc9, 0x10);		/* gateset(2) */
+	panel_dbi_command(priv->dbi, 0xca, 0x04, 0x04);	/* gateset(3) */
+	panel_dbi_command(priv->dbi, 0xcb, 0x03);		/* gateset(4) */
+	panel_dbi_command(priv->dbi, 0xcc, 0x12);		/* gateset(5) */
+	panel_dbi_command(priv->dbi, 0xcd, 0x12);		/* gateset(6) */
+	panel_dbi_command(priv->dbi, 0xce, 0x30);		/* gateset(7) */
+	panel_dbi_command(priv->dbi, 0xcf, 0x30);		/* gateset(8) */
+	panel_dbi_command(priv->dbi, 0xd0, 0x40);		/* gateset(9) */
+	panel_dbi_command(priv->dbi, 0xd1, 0x22);		/* flhw */
+	panel_dbi_command(priv->dbi, 0xd2, 0x22);		/* vckhw */
+	panel_dbi_command(priv->dbi, 0xd3, 0x04);		/* flt */
+	panel_dbi_command(priv->dbi, 0xd4, 0x14);		/* tctrl */
+	panel_dbi_command(priv->dbi, 0xd6, 0x02);		/* dotinv */
+	panel_dbi_command(priv->dbi, 0xd7, 0x00);		/* on/off sequence period */
+
+	panel_dbi_command(priv->dbi, 0xd8, 0x01, 0x05, 0x06, 0x0d,
 			  0x18, 0x09, 0x22, 0x23, 0x00);		/* ponseqa */
-	panel_dbi_command(priv, 0xd9, 0x24, 0x01);			/* ponseqb */
-	panel_dbi_command(priv, 0xde, 0x09, 0x0f, 0x21, 0x12,
+	panel_dbi_command(priv->dbi, 0xd9, 0x24, 0x01);			/* ponseqb */
+	panel_dbi_command(priv->dbi, 0xde, 0x09, 0x0f, 0x21, 0x12,
 			  0x04);					/* ponseqc */
 
-	panel_dbi_command(priv, 0xdf, 0x02, 0x06, 0x06, 0x06,
+	panel_dbi_command(priv->dbi, 0xdf, 0x02, 0x06, 0x06, 0x06,
 			  0x06, 0x00);					/* pofseqa */
-	panel_dbi_command(priv, 0xe0, 0x01);				/* pofseqb */
+	panel_dbi_command(priv->dbi, 0xe0, 0x01);				/* pofseqb */
 
-	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0xff);
-	panel_dbi_command(priv, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x40);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0xff);
+	panel_dbi_command(priv->dbi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x40);
 
-	panel_dbi_command(priv, 0xe2, 0x00, 0x00);		/* cabc pwm */
-	panel_dbi_command(priv, 0xe3, 0x03);			/* cabc */
-	panel_dbi_command(priv, 0xe4, 0x66, 0x7b, 0x90, 0xa5,
+	panel_dbi_command(priv->dbi, 0xe2, 0x00, 0x00);		/* cabc pwm */
+	panel_dbi_command(priv->dbi, 0xe3, 0x03);			/* cabc */
+	panel_dbi_command(priv->dbi, 0xe4, 0x66, 0x7b, 0x90, 0xa5,
 			  0xbb, 0xc7, 0xe1, 0xe5);		/* cabc brightness */
-	panel_dbi_command(priv, 0xe5, 0xc5, 0xc5, 0xc9, 0xc9,
+	panel_dbi_command(priv->dbi, 0xe5, 0xc5, 0xc5, 0xc9, 0xc9,
 			  0xd1, 0xe1, 0xf1, 0xfe);		/* cabc brightness */
-	panel_dbi_command(priv, 0xe7, 0x2a);			/* cabc */
-	panel_dbi_command(priv, 0xe8, 0x00);			/* brt_rev */
-	panel_dbi_command(priv, 0xe9, 0x00);			/* tefreq */
+	panel_dbi_command(priv->dbi, 0xe7, 0x2a);			/* cabc */
+	panel_dbi_command(priv->dbi, 0xe8, 0x00);			/* brt_rev */
+	panel_dbi_command(priv->dbi, 0xe9, 0x00);			/* tefreq */
 
-	panel_dbi_command(priv, 0xea, 0x01);			/* high speed ram */
+	panel_dbi_command(priv->dbi, 0xea, 0x01);			/* high speed ram */
 
-	panel_dbi_command(priv, 0xeb, 0x00, 0x33, 0x0e, 0x15,
+	panel_dbi_command(priv->dbi, 0xeb, 0x00, 0x33, 0x0e, 0x15,
 			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting r pos */
-	panel_dbi_command(priv, 0xec, 0x00, 0x33, 0x0e, 0x15,
+	panel_dbi_command(priv->dbi, 0xec, 0x00, 0x33, 0x0e, 0x15,
 			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting r neg */
-	panel_dbi_command(priv, 0xed, 0x00, 0x33, 0x0e, 0x15,
+	panel_dbi_command(priv->dbi, 0xed, 0x00, 0x33, 0x0e, 0x15,
 			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting g pos */
-	panel_dbi_command(priv, 0xee, 0x00, 0x33, 0x0e, 0x15,
+	panel_dbi_command(priv->dbi, 0xee, 0x00, 0x33, 0x0e, 0x15,
 			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting g neg */
-	panel_dbi_command(priv, 0xef, 0x00, 0x33, 0x0e, 0x15,
+	panel_dbi_command(priv->dbi, 0xef, 0x00, 0x33, 0x0e, 0x15,
 			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting b pos */
-	panel_dbi_command(priv, 0xf0, 0x00, 0x33, 0x0e, 0x15,
+	panel_dbi_command(priv->dbi, 0xf0, 0x00, 0x33, 0x0e, 0x15,
 			  0xb7, 0x78, 0x88, 0x0f);		/* gamma setting b neg */
 
-	panel_dbi_command(priv, MIPI_DCS_EXIT_SLEEP_MODE);
+	panel_dbi_command(priv->dbi, MIPI_DCS_EXIT_SLEEP_MODE);
 	msleep(110);
 
-	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_ON);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_DISPLAY_ON);
 
 	return 0;
 }
 
-static int hitachi_tx10d07vm0baa_disable(struct drm_panel *panel)
+static int hitachi_tx10d07vm0baa_unprepare(struct drm_panel *panel)
 {
 	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
 
-	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_OFF);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_DISPLAY_OFF);
 	msleep(35);
 
-	panel_dbi_command(priv, MIPI_DCS_ENTER_SLEEP_MODE);
+	panel_dbi_command(priv->dbi, MIPI_DCS_ENTER_SLEEP_MODE);
 	msleep(50);
 
-	return 0;
-}
-
-static int hitachi_tx10d07vm0baa_unprepare(struct drm_panel *panel)
-{
-	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(hitachi_tx10d07vm0baa_supplies), priv->supplies);
 
@@ -238,15 +227,14 @@ static int hitachi_tx10d07vm0baa_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs hitachi_tx10d07vm0baa_panel_funcs = {
 	.prepare = hitachi_tx10d07vm0baa_prepare,
 	.enable = hitachi_tx10d07vm0baa_enable,
-	.disable = hitachi_tx10d07vm0baa_disable,
 	.unprepare = hitachi_tx10d07vm0baa_unprepare,
 	.get_modes = hitachi_tx10d07vm0baa_get_modes,
 };
 
-static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
+static int hitachi_tx10d07vm0baa_probe(struct mipi_dbi_device *dbi)
 {
-	struct device *dev = &pdev->dev;
 	struct hitachi_tx10d07vm0baa *priv;
+	struct device *dev = &dbi->dev;
 	int ret;
 
 	priv = devm_drm_panel_alloc(dev, struct hitachi_tx10d07vm0baa, panel,
@@ -264,6 +252,9 @@ static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
 				     "Failed to get reset gpio\n");
 
+	priv->dbi = dbi;
+	mipi_dbi_set_drvdata(dbi, priv);
+
 	ret = drm_panel_of_backlight(&priv->panel);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
@@ -272,9 +263,7 @@ static int hitachi_tx10d07vm0baa_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add panel\n");
 
-	platform_set_drvdata(pdev, priv);
-
-	return 0;
+	return devm_mipi_dbi_attach(dev, dbi);
 }
 
 static const struct of_device_id hitachi_tx10d07vm0baa_of_match[] = {
@@ -283,14 +272,14 @@ static const struct of_device_id hitachi_tx10d07vm0baa_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, hitachi_tx10d07vm0baa_of_match);
 
-static struct platform_driver hitachi_tx10d07vm0baa_driver = {
+static struct mipi_dbi_driver hitachi_tx10d07vm0baa_driver = {
 	.driver = {
 		.name = "panel-hitachi-tx10d07vm0baa",
 		.of_match_table = hitachi_tx10d07vm0baa_of_match,
 	},
 	.probe = hitachi_tx10d07vm0baa_probe,
 };
-module_platform_driver(hitachi_tx10d07vm0baa_driver);
+module_mipi_dbi_driver(hitachi_tx10d07vm0baa_driver);
 
 MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
 MODULE_DESCRIPTION("HITACHI TX10D07VM0BAA MIPI DBI Type B panel driver");
-- 
2.53.0

