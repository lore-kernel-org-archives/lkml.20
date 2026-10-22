Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675423;
	b=5GgewYVJlW4YGiDb6BSujszlRNYbvuhV4Rp/x1ifop+cresqn0Fd2JhGtHZgD9Rzegh1
	 ZObkyHe5SRW/6HyBh+zJjsRihdbYc1Xj5+zz0YQfkJzyOroJkwofDXsUM4iy9fD+FFkKJ
	 VlnJvc8QNmU/rPxovSdIsxyDH79fVwQxcqdbp9VDSvUDUxA58MBTKkFOwonT2JJan4naJ
	 QLY3q+3oImumFnHgJl6/N9mGpc2dYGhxnkRBtWSYGm61R9/nrSTxRYXk6En/l4ujf4uts
	 09erDm3ky1Q9Utrf9A0PBbNki3y5lht8eFSn4gnAV73gC+rNdWl8mLuIprV8vojqfFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KXz6d61M5KD13QHimY2yBAnDg5P4a0+gl+DKibpYues=;
	b=VaZEM3HpyY8k+w5dni9BWfeel+uhoy7rh4Fa0FYR96JCH8qAg4o35T8lhzg333+TF3au
	 yIn6C12LC6wMDg8m+pu6mCwzP7T/czSzM1UYmnyIhmB2/4xnNhdtbrFTtiieYj3Xy0/+G
	 t3u0M+6KeZ6C6+bQQtJ0tBbkPV/0wClJ31r/xiXu2fD49wHjWc3J3fxSNZZ6qdYV5A6hq
	 1fD8TPw8/nSCj05pUlmPeNAq4yuXfflPtuqwN1sj9sFOsodYoz0VxTjfTF7diLl8ydN5O
	 pyE6IxYAajVBgMs+1YL0OBQx9jnsaDk/zE4N3IEfiD47JJqh7KVWiB6wbG5RyDufcfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EkBhmq5m;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114B7606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 114B7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EkBhmq5m
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso604614a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675421; x=1793280221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXz6d61M5KD13QHimY2yBAnDg5P4a0+gl+DKibpYues=;
        b=EkBhmq5mBZV4neeVDw3QDVYVEpHfN65BO1zRCLBetcTnYmtQ8fKgUb63Tkq7PWTe4c
         b/5boo7iDILM7RZo8aeoBa5xJmEF79qzTZnRhuFKbpRL/tEspXknbeATPQQZIszfe0yY
         BqMpzr1PcNClD2DHPMmxKTqlmmYDfbj4vOje874AJozMoeEUX1MgU5C/yGh7Imzak9jP
         Bg3bocwEAH7sKC/WABhRJldPF4pfMCvAs81Qhp85o14fkjySemSfpOEgVEjT3o23mEMR
         8O2eUSQmyaG9icElecDr7XSjsYD6Ugvdd7FjMXgemakb4CWsJxDnKt/T73QzZoZOphms
         xqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675421; x=1793280221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXz6d61M5KD13QHimY2yBAnDg5P4a0+gl+DKibpYues=;
        b=Wl/5xTlXprLWCks4SArx2eCFXuIHGBoVhv2hXC+nWPu7amLHlWNt4z8u1ZauuHTX4S
         KDyBimdIG6HwMf3Fb4q691AgInIgy3GmxRgKVewhUTZp57QDaJBwWdAWLJ3djFNYnBF/
         ofeM6sLZfb6hjKBKiJ4fGm2DgpeIYTtxofiqFr/+2P3NOc1anU8I2PfsGES9pZAwydSw
         vDG6BM8CazghhYRLQ+WB6vKIhZ0uAw7FoMs1tXFaaZgMc8D4qliMC4TcDoNedcqYiUu/
         wqCgwxY8IRM4/X1m2RAJ4LGAnAX41EDKTpVUqeC2HE7uKPtKYI8RSl8CijivQb4bWJzH
         P4Uw==
X-Forwarded-Encrypted: i=1; AKwUvBxyf/fXvZnTuV1NFOdrCiTnL8D+rcTSpjZZRsEkF3rg1TFr2ibw7IVm/m68BLT8Rzd80ymxy/218UtkxH0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKX5UDF5Wl2Li6619w+tGf5jH2R8PcIcGPbmtL/PVAteSh7WXd5
	5nShZ081zB/DKwya9HqJ1e9y5BFceOyWaAazMyEBHLyXDpS8ZwG+u+nJ
X-Gm-Gg: AYBFou0kRl1OkDbDyruqx83qza9NheLlRju6G9B6ZghEVSDaAS45reo7cpP5c0g/zdj
	C5SfhyUtlvWCwGkw9DoME0Upyj1v6tZo0kZL1C4lVZMWDBtzqz/8hy3pNY5PQ4C3KWiqAAdSTsU
	y/+ePOwnPIHxiad1WKvSPyGMkw334zJNOwGYhlhgt7HAGNxeFrQZ0p+tZvXtnyEPfIyFeNzuvvw
	nB0WoqOReXwbHUsYm1VnXhHBZtS/ZSggCc3Fusx76KIAXoAr6FUvAZLNc0Ymu4aHIufwv8tu+kX
	d53AEhSv2/1CK9m7tF2IseMwCjOZOJuQOo5BGuyWqIlz6tA4gZHNbBVJHk89Ui7WOSx46EBf0fj
	IFdDS9mHCV/4DbbmTCMBtWcOwn3vZRJbBwlbYovI0pd/X0ElnPE6V5jJ/cZ3lmj617kqkU+AAqQ
	TeBmBvMeQTFbj0xxgccZiQrPm4Bd84FZG0YXaW/uLAh15Hd9xfMdQKz2KZTKNJQNkHPlii+gEhO
	bYDAuqGQLG14KTxbMyZ76fZ/xN9bRNpJY5yeO2GByCKqpwn4bBRz1l2m0jQuiUduKZ/O6k16gFo
	3l75DRRV1M6YCJDTxmTu1aE=
X-Received: by 2002:a05:6402:4246:10b0:6ae:1895:3b3e with SMTP id 4fb4d7f45d1cf-6b41d5cfd2emr2354555a12.6.1792675421106;
        Thu, 22 Oct 2026 06:23:41 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm1818061a12.27.2026.10.22.06.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:23:38 -0700 (PDT)
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
Subject: [PATCH v4 5/7] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Thu, 22 Oct 2026 16:22:57 +0300
Message-ID: <20261022132259.240717-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022132259.240717-1-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
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

