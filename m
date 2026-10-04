Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F1536D9E9
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131495; cv=none; b=QPOchSnotUH/+KZEhJlP3W9A4kYMqlcQ8w5K2ZQpRYBqu1do5rGQjBYz5OGBdO+Pa4e1WpvIyvf+pE4zW6+6pynAonMYl1cp77eRmolk9TKKL/xiVAoO/Z38jr3wL++iQnogac2QqUDUtavg7lKUruMbnnSeu4FajPrIRKdFFRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131495; c=relaxed/simple;
	bh=gr0swvEQ0IvAy7Ct+2h58VUn/TehcKJEfIt0P7+gIsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OyfCoKh43xAilmTJg3cOhGdx2ILk7TTh0Dz5mOG2XYWeJnN8Jzjjn303vQtqwwIk+yI1VqiH3wkDu+qfrLDv4vdKCNZEK9AYoyRumwiF3pnFmbWRlO8OmqaOmhB6M7RpLbVor9Kw4+4xMr/CBD3SjupzylY2XZGmZM9T/6V3+dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOvfsGS8; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOvfsGS8"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so3809595e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791131491; x=1791736291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLhusyP0ZK9/MPigGSZNdEACXF2TD7fqbQDb9u0lwRw=;
        b=iOvfsGS89kY5Oytu8EmrN9kzcwz4qsaZanLw5A0dXlSOgOrnp+oJtLrdftpJj8qMGu
         U1VbAF9cYpEJMN3GlBKYF13zyBLBxvraOEoNftgBZwu9jSiY6zXKz8f3bNEIqz2xtiPW
         l5ZBqaAogMJdTYWddBHpI8isuRMC1e3T6h57oDhaxn6CkuvZjqXrEq7hwrj61Jgl4/el
         xmEYnfgI58ck5vd4btZIYV8V222veXffjbOCZh5ouBPmDuZqCVjkY1MCctUAybqSpD7o
         xhiAZ38CeekRqOHfq7dWC0YP9SixgmWHtuhd8EpomYr1JMAVY12pmlLfKrCy7TBTKi29
         cOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791131491; x=1791736291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sLhusyP0ZK9/MPigGSZNdEACXF2TD7fqbQDb9u0lwRw=;
        b=CUM1M/apQvwY4ei65G203Se3No9EFh3U/ay4HBwrc+ZCkL+tvCcnn1LPOlOL0pjNry
         ku8/1LIo8vOLSfIxswJjM161DTRpASodMGM5p5uwz0e3Sn0bBZZeySPsBq6O7E9mShjb
         bYkJDVTg3qnVAeB4UsmvuFxKaZJj8V+OTy/9lwZ7o/JReKt/gXpAoEijzj4PBRbJu545
         4L0G/Dih3z8WT2s3IP+yi7Sl4pjvsIPED0P35q2GhZ3b9BYH6CYeC6tmCYi4flrLPaD9
         na4Vb/qj1024PUxlX1VRrsM7P0VtuFXB23uDuEq3n6ytYTUz9IQAvXv0RxNANe05FD2z
         W6Xw==
X-Forwarded-Encrypted: i=1; AKwUvByfabHjTlsDonwCJbsrdEpQ/pS+P0bF4eEyvwBF+3UXy5kVpgvXZKaeMHHa5Rm+ilsIS5UGywSMzgawoKM=@vger.kernel.org
X-Gm-Message-State: AFuF++nGrGx1NIgwCGJt8R8xhqGyFMJlfPvg6NPew4PtCfTrCeu93s1H
	sWIqrH938/l76AWvjh5dgsfcOh/5likY6GiF9VvPy0qMPMffol3Fj3DS
X-Gm-Gg: AYBFou3qgqj0vM1xTc7wkAcd3JJ/tZZHVZmah+IsAP5Bmb57KKDBXtWhuSpcZjsA4kG
	4JEkwjBXmqWmJmiBfozxzymB8JaAxAGq00K/iUg7PV0p4soXfBNPH7vwAM6kgVlX9o6Lz8BiIAg
	hrmFNZAsJLL10Qj3zJA/Ep5Il77zlqi/zHItWLOdPwbXbaHRZzvKm/3lrj1QaN7CY9t6Hp6VTWt
	t468KaOTw27ewKkqhEpe2ugkbzWCymwmq2hsli9bxKchKV7HDJ7Urx2sWul06JKLb6pUimOu5IA
	WT9C7xua2n4Ny+ORMquCNQNOfQ/lGpH5FOv6u1XK0kqmGhMIFlvSGSisNbkgHM5ei6TOQ/ZX916
	XaC4F4glmkBZ0CAbr7sEO2Ssd2FySjwGQ2TSDKtagGsopTlzx2krPKiNYzZQHVKYkKgQoimlSBJ
	rYMcxAFRYkxRkgI3+YGD6OP8GcWBFa2Ut74SjXLFaNrv4i/nLcZQQ7fyScvKYm8gsKskHNyGLXI
	dt9yVjy6r2/JwaeHRs=
X-Received: by 2002:a05:600c:3b05:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-4a027561e0fmr137493995e9.13.1791131491320;
        Sun, 04 Oct 2026 09:31:31 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm315365035e9.1.2026.10.04.09.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:31:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH v2 2/7] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Sun,  4 Oct 2026 19:31:09 +0300
Message-ID: <20261004163114.181800-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004163114.181800-1-clamor95@gmail.com>
References: <20261004163114.181800-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parameterize configuration based on bus flags passed from the bridge or
panel. The list of supported flags includes now pixel clock polarity,
display enable (DE) polarity, and data alignment.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/rgb.c | 41 ++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index bc1c93c7554c5..8167447cec900 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -103,14 +104,24 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
-	u32 value;
+	struct drm_bridge_state *bridge_state;
+	u32 bus_flags, value;
+
+	/* Get but flags from the bridge state. */
+	bridge_state = drm_bridge_get_current_state(output->bridge);
+	if (bridge_state)
+		bus_flags = bridge_state->input_bus_cfg.flags;
+	else
+		bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
+			    DRM_BUS_FLAG_DE_HIGH |
+			    DRM_BUS_FLAG_DATA_MSB_TO_LSB;
 
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
 
-	/* configure H- and V-sync signal polarities */
+	/* configure H- and V-sync and pixel clock signal polarities */
 	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -123,11 +134,31 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	else
 		value &= ~LVS_OUTPUT_POLARITY_LOW;
 
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
+		value &= ~LSC0_OUTPUT_POLARITY_LOW;
+	else
+		value |= LSC0_OUTPUT_POLARITY_LOW;
+
 	tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1));
 
-	/* XXX: parameterize? */
-	value = DISP_DATA_FORMAT_DF1P1C | DISP_ALIGNMENT_MSB |
-		DISP_ORDER_RED_BLUE;
+	/* configure DE signal polarities */
+	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(3));
+
+	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
+		value |= LSPI_OUTPUT_POLARITY_LOW;
+	else
+		value &= ~LSPI_OUTPUT_POLARITY_LOW;
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

