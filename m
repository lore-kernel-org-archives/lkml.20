Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DB44B9201
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403851; cv=none; b=ga3qZWObGEBHCHF5c3NqzrCNmED65HRROTB6OLIj+4IRQ3NDGh4GxAEGRwByAJ92tNwtCZp40rEL7K7gIljpwDcSCyKUinG41gntOkW6mjctVvtOFy2CH+/cjY+VyLyAylM9lR0PShkda+wRoRx0fp8vuAemMUNFU+zC0lwuAv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403851; c=relaxed/simple;
	bh=gqHFQkDqt01PNe3dmhsrva6agIu6Wotd2DKXwpYNp60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hs1a8yAzzqp6nP46AjLD8iN8nDL8hL3Ibr9L7OKEbuEtOkg3m1yDqqAGEvn2hLywGozaZNe06Os81CcOlaCvV5hKljF4nZBgPS3Yl+ghBCmT/zIkgOPcOdW1ehlvLTenz41gzcCh9XV9Kd8cAM0qtowwSoBsV9HWZze5UIPGLig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPYIuYDz; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPYIuYDz"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1434722f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403847; x=1793008647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXz6d61M5KD13QHimY2yBAnDg5P4a0+gl+DKibpYues=;
        b=TPYIuYDzCdBqBPa4E5p68F1gRXoaF8O77/6zZGBw4PLV+l6mS4oP4/nU+5Rruz0CFn
         8ZaU6GybbnAAX18KKxLk7GR84VVdK/w71SU9ZBtyuMF8nMq8LMhqSdcRTLPm+LmkB9Ma
         vgkFxOIU7XqwgXMIlsLqjDbLhZX5q/VUR0xvCrc8ED3NkgxnSj6HMCpBYYcYZlL5QONh
         jRu/S4K74Xu27Nk7xviZMKxq+xvrMxCfUtZ+mae1ms0tYyLGxHJ6N3slHboxAEPKzxG7
         tul7jJkPvrNfsbP128wQWuGg4Mmarah5uC24uGKzol2j2TC+0mlZ3dI1m/ttFI/GFuH0
         L89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403847; x=1793008647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXz6d61M5KD13QHimY2yBAnDg5P4a0+gl+DKibpYues=;
        b=agpDJQpGanxgbgL5IyTxdTXkmjgcB+fU03fAMGuzlya4gUBXm5+o5O+DNv0g6OBV6y
         pAJOMGljlq6x0Wm5ktMGofyEYw+oNWXZ1SS85MdZwWb9HGuVWJzrkXsgMm8mh+AKfOyu
         dHCnGMRar1WlP0CNuKb0ZyS4EHGPhXqP7eanhp0f3jMPWx+3E4Y2hTGmxATZKU4QjJmD
         AQzq4Heg94Nf7Xfo6jUGj9cVW/RzMOTYbgeItKA88BOSfA420LciNyZDYjiJB1OoYKuF
         yr2pGkah4Uhwa6144tVh4vQSA4e4rmmi9sBbZUQlSHekQFMcImbpTBLK8UiZ5UOqrddY
         AIlA==
X-Forwarded-Encrypted: i=1; AKwUvBzyt/qpyCPUZEunVbRKSoXK9WtTV7FxY3xhVCWDic0raVR88ncYAutk0d9fAt1NyCpEdM5EQn17DFMx6No=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXUjoyray/x+VU9+b269JkiDrQedmXbiEton2i2f6FJpV2Vhab
	4gPAjfnq+DGYSw/8P9CyPDs78YY1lKXQ6e7DNRDZvFcsltDJ1UW5X9J6
X-Gm-Gg: AYBFou2nJKJ4XrfT0d7Fu1eC3PBTXy/3L/X8ix4i9NEyuj6TgmW6ZxM5ItyeXYhN2eo
	0wKhNCi/pGfD+Uzd1ulZTK7bRleop8EDfRtxv9TexQRUFBiW9TDaGhm1DYC1qWEdI9/OyU0m7GD
	WF7cnN160HIP7O9rT+kSAxjpDLXj86z3skSwUpF2mvTrvMPYEidN3Nk1UU3fuQhGIWLGGYGutdk
	t8D5HoWKGsYtCMdB13XrDZoW2EpvL6HT8cY0ZID8lQT4Y2tcwK35lrx6as62rYZ93iSN4gsvBbN
	Zd16WBpHwfCQx+ydc3LtnN2SETntNn0z2bxekME5YbH/2ULXLRW8WLvgTqqmru0wRYEb0Sh8znd
	MVwJXRvq3MOEfAqJrBumbui4Z6zwJAZPd3slZtJfamFd+1wa0A+BxKgbc1cBCjkzaykEzm0Q1KX
	IxFmEFxGELwicGR7+2Lbqoljk5h9zeo2+O1wanhEqPh1ASUqTg37uxU5X1kM1xNJuG1Rw2SVfzP
	ST63CvWvbFFVYHUpqo=
X-Received: by 2002:a05:6000:22ca:b0:48e:d57:9bad with SMTP id ffacd0b85a97d-48e1afe328bmr362780f8f.3.1792403847147;
        Mon, 19 Oct 2026 02:57:27 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm21740089f8f.42.2026.10.19.02.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:57:26 -0700 (PDT)
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
Subject: [PATCH v3 2/7] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Mon, 19 Oct 2026 12:57:00 +0300
Message-ID: <20261019095705.91062-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019095705.91062-1-clamor95@gmail.com>
References: <20261019095705.91062-1-clamor95@gmail.com>
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
index b6d09a8d8e5ea..da9e37fe36689 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -104,14 +105,24 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
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
+		bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+			    DRM_BUS_FLAG_DE_HIGH |
+			    DRM_BUS_FLAG_DATA_MSB_TO_LSB;
 
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
 
-	/* configure H- and V-sync signal polarities */
+	/* configure H- and V-sync and pixel clock signal polarities */
 	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -124,11 +135,31 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
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

