Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287789;
	b=UTaK0kQf7D5iB4ZhdUMi9f9hESiaCpnpJpgfci3Op0yp9I8vRwGkr2tvvvCTeJINKGXb
	 hmUhNWta5k0W17qadWA0piNCFuhkITPjmCeSEMHbfi71yiIqXt+9CRnUZhLw39qw0YJ0H
	 sFk7RuCXkEpDO7SlgGQBCBQE+r1Z+a9LkylOncVVWu+lVfR8uxwxuNnpHFQGnHZIPY2mu
	 cRmcojxqwFnWj3enRn9IeQsjc1A2SSxQm4d58tRmLAXVSBPhJuZPg7qnk4KLA3zIXs+HN
	 wEQiHTvw46oeQwEEtE5uL+1+nXGTf2PmNO1bxP93hWpycXlUvWFDuiyhqP7n7ELyzpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
	b=thyNA9I5xzR9w/XAn8DjGG41VB1KejZbGLYEnKr6Pct6YTMqPJFExeaHE/OV3xilb+cT
	 JMFy0UztxTFXOsXgXVFQeMLJKB+xzbB1/qFDPLROShcydFORGML+g+yy8aWs3LYyhiXYw
	 XlU4RZB/UeaaBegy+uYp643511fgOuagRWBinHHdB6Q3mO8L0eGv5fb+ei4ykQ0s+irUb
	 S4U4MoMu/wVCnS5jXvZycJzbImJmIrIxIdgsVYhk8i9ei5O2mf3EBLjGhjkaulwkrBcjy
	 +/GWcbDY1VlSu0aj4PGEus+FwOxsYEjZ9rBwk5yQEhO8Pf2Ze3Hv1znyQPvxwgWnsQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I/Ayijzq";
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B27B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B27B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I/Ayijzq
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b413b0a974so3421823a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287787; x=1793892587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
        b=I/AyijzqJtk+0Keg1vkGw22wFN5Ptg6AEueeNJfZVfw/XLEHb4rT1UOB/I9jn4wGiQ
         gzrC1vAUUg0LLaGG6N8fsoJUBgGiOOwgtRNr4HzEkKJ1NDMFfCTxgmFwmD3o0/UM1vcv
         qRa4wgLoqUryVEz15l2Scf3SQzkuygPM4CleOcCkxJ7Eox7wy8YUCHKl1Ib2EiKzgITx
         VcImxrEOLuDAdjPcXfdxQPGoPpUyjggEOoBQzSYjuT3HXQ2ClGO40vBGHUzxzlGEq3AO
         z4TPJZ/WVs+LYSoZstlJ2SdIMsMuKbl3+3QMXSwE9/v7TDz4UQt+J023PZSB8HERFN/p
         m48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287787; x=1793892587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
        b=d3x+4j6INq7wssbmQuFqwzWUedMEd84t8XeH8ed8tRj/Z6Cxl+5f00FVlG7qllMeEx
         5r6OrLUL5NVXxUZ+XreVTGJ7pVUcTA9qlwikV0gDZ6Os8FIgUkO+sdGimKRb5R4uCp1D
         McLLA2rRmYY4JEIj56LNYUMtItQ4nietDBC00QuT//MWQ6MN6aQFiKKOs40ES4L0ilzv
         mRWfitpX8KoryxiSTH6P/4rhz/ewrhZK1m8nbxD6n+iFtN4AN7xgXY1i7LoDi+meOiFy
         B3ccz/XNX3GGN0+UEu+zh3iYNu32BmlrtTep+RSEldzJco2vG7YG91fCurUz7MWphgwV
         T9zg==
X-Forwarded-Encrypted: i=1; AKwUvBzaKoS2hoOdteRW2HSinHMwj4x7BrwuZXeZK8WiJMmxRf+ux+6F5AyPrBlXnk7Na+HV7BfG/oDAOeFSmgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpifAJgtFDRlkECDGy96sXduxtkfbmN02+pBwHZiE4A2AskJ5C
	ZIdyji40EC+b3hqGcn1+dI9d83/9xzGtmFu1e6rQM50Mez7zvBJIgoX7
X-Gm-Gg: AYBFou0+W/kOB7OSHDp73zLtLCwAAlvzaFKMWx+KGUU2XEuL2ZDCIA6YHLzRpCRQ6l7
	rXEw4IiZyTm112gXfp6CAH9+5WgkqMZyeGsxhZUmH89nwqJAtFrf8W8WvkqpQBTSEWKVkGiABD9
	hb5FEkBjYDh7wQnRZtaYwB2H17BQogc20fCg5FbDBMkdkCjAz7OhPoN+3f1xrq2v7gS+XFikZgQ
	6j9vWxDI8z6hrVT150KIrdSkzGQDLoKqMEQ/gYSQqam2aSsMEyd1Dz0IuQVmxmx77Ju3FXsbBNY
	RPyJSIbuee08M3Kzx2edC7fqnRTyOpQSXHRMrZzKZnNO5Hn4T6LMZFkvaG95XDWQ48IDDvULR8N
	DEJCkE1k7fhNGyla0zpoGchDXmBob3AtyB+9OhwhN/4VKvQ75IgRv5r+igIPEAs20DqA1T/8ORn
	AumWJ3eockFRS1kb79cOubtjgfCafSBU96LKbqwhGz20YNBfLOIN8oH43eiB4PkpNXa2Ao5hRUf
	NRnOuS8F1K7oxnXl8pd/6NW6eT+c4xb7QVznKKSr3l1lUmlIIthxA9xMupWSe3R423pQmjdo5h/
	V7onLlSpUpIKIUYXZfODMVxk7U2muq9YnNCv/M5M6qYV62bBNw==
X-Received: by 2002:a17:907:7250:b0:c2a:b1cc:158d with SMTP id a640c23a62f3a-c49bdf67b9emr532113866b.32.1793287786503;
        Thu, 29 Oct 2026 08:29:46 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:45 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v5 09/11] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Thu, 29 Oct 2026 17:29:07 +0200
Message-ID: <20261029152909.234584-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029152909.234584-1-clamor95@gmail.com>
References: <20261029152909.234584-1-clamor95@gmail.com>
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

Parameterize configuration based on bus flags passed from the bridge or
panel. The list of supported flags includes now pixel clock polarity,
display enable (DE) polarity, and data alignment.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/rgb.c | 39 +++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 7dea0cac61233..d8f41d1ca350e 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -106,6 +107,7 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder,
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
 	struct drm_connector_state *conn_state;
+	struct drm_bridge_state *bridge_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
 	struct drm_display_mode *mode;
@@ -117,12 +119,21 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder,
 	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
 	mode = &crtc_state->adjusted_mode;
 
+	/* Get but flags from the bridge state. */
+	bridge_state = drm_atomic_get_new_bridge_state(state, output->bridge);
+	if (bridge_state)
+		bus_flags = bridge_state->input_bus_cfg.flags;
+	else
+		bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+			    DRM_BUS_FLAG_DE_HIGH |
+			    DRM_BUS_FLAG_DATA_MSB_TO_LSB;
+
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
 
-	/* configure H- and V-sync signal polarities */
+	/* configure H- and V-sync and pixel clock signal polarities */
 	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -135,11 +146,31 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder,
 	else
 		value &= ~BIT(PIN_LVS);
 
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
+		value &= ~BIT(PIN_LSC0);
+	else
+		value |= BIT(PIN_LSC0);
+
 	tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1));
 
-	/* XXX: parameterize? */
-	value = DISP_DATA_FORMAT_DF1P1C | DISP_ALIGNMENT_MSB |
-		DISP_ORDER_RED_BLUE;
+	/* configure DE signal polarities */
+	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(3));
+
+	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
+		value |= BIT(PIN_LSPI);
+	else
+		value &= ~BIT(PIN_LSPI);
+
+	tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(3));
+
+	/* configure DATA order and alignment */
+	value = DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
+
+	if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
+		value |= DISP_ALIGNMENT_LSB;
+	else
+		value &= ~DISP_ALIGNMENT_LSB;
+
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONTROL);
 
 	tegra_dc_commit(rgb->dc);
-- 
2.53.0

