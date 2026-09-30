Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0370445AFC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751966; cv=none; b=IsElfLDN+6u1E2YLYPFsdchexiQRY66oROEN7MLwjPwyGJ8dEbiCsBKnURHMsZpy5J3l9kj+l2eupH8SPkQ861d9D1YguEQsVAV0JAPaRi7X8htxVOQRLuS+HxUnB9I/nfkQN465VzDUVz20LLSWihWwEXJhp9BseIzrveHyQPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751966; c=relaxed/simple;
	bh=Ha01hsZDiYdgpSf73lToPHzbXl2XlTznc+VkbTZDF/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLpDYjasXB2DbGU2fM0OzMgtkcSi7DqUljlA6PsN6esz8zNTnVPSROAAtg4pHNKDdtv/h5vp4hgmNux5GPB4ZGWktnJsGHSJ8GyyU/kiEW1qIxuz6ZxBfI5qgvNngi3wm/dgkd8Jq6bwLnWKlFUqkMLyzRUEf4VJQbf9eI5YDg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ra4fq7ob; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ra4fq7ob"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso3001946f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751959; x=1791356759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvheFf3XK3bdnPCaCOmKnThnJ8pBY5xBPxq0xunjLCk=;
        b=ra4fq7obcKNyz+B5Kp8w4ukzfSiDFBX9NpafdZy4Edt0eWOiLPFCWa7prR3UjD1fVq
         9PPvwqO5PKYk16grj9CiKtavxJRbT+BQE9LHaJgeJMp0cNO9YxunBzPXz4VCv/TncfxG
         nDQuD+CQsQyxkey/G187rplVgjroB3v6IQywT0bgMbLaoqh0uNBFFWPgqu82Kik0E9Ll
         D6LesyrPjEKB/qtjQszWfrdLSJsagZtyzuNQZ6weHpFGYyt2OaSdq8wKVgcmuEpmDdFU
         c+fCWg/kBgP8mTiiaG3whBeo7etSM4/PHeDg/NRDf7XdW/4outerQIuBy2O1/ta7MnKX
         BSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751959; x=1791356759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvheFf3XK3bdnPCaCOmKnThnJ8pBY5xBPxq0xunjLCk=;
        b=pk4nnICg4D15RzVoWJUmOTTs8jc73PtO7jP8DPduus0dvHzsH6BKIH96j4vUOKZfKd
         fB3/IkzEeb+eASDa6/3V5syTXbTWRA2D71mcqotI6haj9xwvrVd3Mdgg7J6ohApxypbX
         uLoMap5m/EdQ1bJLZuzJn6qcz2O8DVQtVVthrN5e8+J28a8GP8A88vZcBs0lkjYeqBlE
         E/t7rkXhZHSS71+QZylHADkQ9Tm5QGoaPHNDSXi634fnpOLSK1FfWDZcd37yowTpK6Bo
         dMmPAjzLI/ih17HSHT/WT/4ULiewEZhWlLPWvt9QjR+5HLR9VbDqoGw9SfopV+6WCr1A
         kzTw==
X-Forwarded-Encrypted: i=1; AKwUvBzJP6LnP7Xdpci0iXc2LRfdw1O2XCz956lDLXaKF2N1FMRjofjIk7fy99TXQcLMvowvnFiz6j8wVP283xM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLj4c3UFwyhkJFeYWYDUr0RnmxDoCGeRTyKPC1yYSDnWeBF8tOb
	hQ2TFgFhcLUjgGiYly335ywSCYbwnQAqeqcznbV+3fUkS4iyd+k7ptyC
X-Gm-Gg: AYBFou2gi3Qp68GKSZzbhdl5PLCPQedantzU4to0T84LIXazt3a/tKpNDq+GKADIdJg
	ACx2aEcuPepY5M3zSD1NsDyz5OKjqeMvPVGENvFTFq5a/6ctgxzDlCPunMDPYdINN7WQrJHZi82
	iCbywaSUN51THzW6QbJx9heMwjItXsbQRNNyjJZ//cIvrBaJnSqbcC03blSqUv7PmnNvIPw/xpp
	XWv1pQbzrpNXdhzXeAvksUQcns+qQyjjvycwg8T2aXeqcIrof9nh6brdhNw7rAO9vnCORAAydxC
	uN7efxcrYwkvzb5p3wNoCtsDO74V/NfX88MlugeG3dStqHQVpY6MNwyRLqQYomPQu+MLA6erYti
	543TUfHMt2A9ttlTQeflhVlhzcKkyJX5qjjlXTO1I9BtUZzSEYE38JzWSERwMdYkpjEXVROyYYK
	7jsZmjNr2DflL48dW1jwRzNSCH0UQJDDy+wf4y5Ji0fxGOmGTzB9pogsYRtYPrYXBUo1YElV6bR
	U+XUojHfUgVLL1yEL7znLI9pmGOFA==
X-Received: by 2002:adf:e00d:0:20b0:488:89ad:56c0 with SMTP id ffacd0b85a97d-48b03c72c0amr13090f8f.11.1790751958677;
        Wed, 30 Sep 2026 00:05:58 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f5bcdsm1145150f8f.27.2026.09.30.00.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:05:57 -0700 (PDT)
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
Subject: [PATCH v1 2/6] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Wed, 30 Sep 2026 10:05:31 +0300
Message-ID: <20260930070535.47130-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930070535.47130-1-clamor95@gmail.com>
References: <20260930070535.47130-1-clamor95@gmail.com>
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
 drivers/gpu/drm/tegra/rgb.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index bc1c93c7554c5..e72e076b13d5f 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -103,14 +104,19 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
-	u32 value;
+	struct drm_bridge_state *bridge_state;
+	u32 bus_flags, value;
+
+	/* Get but flags from the bridge state. */
+	bridge_state = drm_bridge_get_current_state(output->bridge);
+	bus_flags = bridge_state->input_bus_cfg.flags;
 
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
 
-	/* configure H- and V-sync signal polarities */
+	/* configure H- and V-sync and pixel clock signal polarities */
 	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -123,11 +129,31 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	else
 		value &= ~LVS_OUTPUT_POLARITY_LOW;
 
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE)
+		value |= LSC0_OUTPUT_POLARITY_LOW;
+	else
+		value &= ~LSC0_OUTPUT_POLARITY_LOW;
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

