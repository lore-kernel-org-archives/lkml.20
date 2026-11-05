Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887572;
	b=mIYVQKZa7xdf5Y6fmUXFzIOW1CyomcEHrXtv/iLi71Zmk0zaDOKtH1RkMxdxIbNYYRpk
	 a+um8mcz0dH4ejpoWGSEAoJclTqsUFYkjNri55ZZSD12UZpcgVlqKUi/JrPue8wHdMoU/
	 yGYqo7xijJV5hf2hXyrTgf0c9vIwYZwJhQqPk6AoXwQxYsnO52HWwpQWIDXF8+FotwkCA
	 Ug/cYrGGa/yKVvPwEA86mO1dk8CN6ZuDN/n5uOLwth57wEZ9rZvAO9bOtY4Xaeb/D/jEn
	 ZE2lZ0M+dGbpuP5+Y1X5o6pgx78SN0Z4vwkVNIic92DhS63C+/d0lvbyBqoJbgXou5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
	b=gJzcr1CAojmLRvRSXYIriW8yzer5YmphU3SI3ViDnKn6G3MVF3rMhdHRfshbMp+OMfkP
	 Geby2I2Yhqkz6g3o/MWYzMe/axNKzWZG1amBd4U5Nnzpjau8QT+t3sGa+H5PRWLbc2Iq8
	 0wq1LF17D7u/PJ637mPbtfCOY4t1KkBs8XmHuOQssmM42JCu3meDUKmv0DBMjulyYeEDq
	 CyXEGFpZyRZrrbaVxnLWNpyokKylP5vLvQ9zx6LMPb20AGezJIihZE5NAaBnwIhTjxQQZ
	 Mfz3qqrVtjBx2EDIs1b5aak3Sc713ObUtCdev7j60EfBDVCm3FZATwHFV718yiFrGaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UeOavdYD;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81D4606D830
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A81D4606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UeOavdYD
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1195788f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887570; x=1794492370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
        b=UeOavdYDA9GU0sX0AIbUGnWqM0Qk4FJllDP19Y+wzPPKdyLCPH2T7CzOUJDdho6dYs
         aZnsmYJNYQOCdPemSGl3/wCasCvyVEeE4TJpJrlGB7ODypQuOqw/JDPwS1R8caJ4tlcW
         Y4K85Bpfh0ei98bnGyRgQcVZpPJ0NXvXqiiQXgIgm9fVIPJGJRaRl6IxWOmT3/Okzse8
         t+Ja2KQkaG6H6D4t4be/NdrHqXreSEIM7wT1/AkRQm/jovAtd5C4007e4bSUCeMMeaV9
         eDMmar98AfsVxt/z7DyAUFCyy+fDbftMdxftqkVYyTrlBrWUL7s6IV7O1JFq9d9q1ZLD
         unUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887570; x=1794492370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
        b=mO73rvWl+bIFp/Sb6x2hOiCEomLpVwLSHVNnuyMqqz/rFT7ippp02Ln2PcnPIvjMuZ
         PM8i2/vGK4KqMZhbSWATYRFXkl1vX9aR7nULalsHsGmyPBFqjBSATzh5JEKmtQIi5xZO
         WB231ZEtv8iihpZlfRrv6T2/tuc1gBq49C+tZ7FjKL+yAcjwoFL7ERBEH8FM+PbHDo6F
         apbuFtVm5Y4zhfj3mTKNnyQBEcembbcCF7Ag+4GhzEfzp3Iofah41YE33NHpg4ob4wmn
         DKtQzhhUadcU2wCU1b7f+w1niD9r8ZV1YPcld9yUzIFYtjkDSpBjgIJv4w3cUmgh+Za3
         B1uA==
X-Forwarded-Encrypted: i=1; AKwUvBxZ8iQdm/bPoaxKHrOJuhBVsVafFIl1JvtXjmCtGwOe+bit0sZpttOjyDwOE4HXMByT+RjSqAli5hIH8t8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hkRUmV2U8NGluzewZnWvC70xfnCgpKZKlw+c8Lc1mCUsuHqpY
	7T7vtdTGFKvy9NCpdJxHZY1y4KrJ4rKprxCdO+xOWEMvU+NrDe/1y60Y
X-Gm-Gg: AYBFou2A3nUGR0pzi/Li/OyQE151JUFiV+jvnCJm7pUYd2FGJdTaS0jp5Iq46fzdlvz
	1NYs8L9+VKuZYXBA1K3q6BukVufWnUKioxppupKBLsZlBuHOdTpAXH/jG66aAp+7Ugp0nCG4NAc
	M3Pijr7q0Rm0pZQXveHjMi3yFRdljP5RT6Gd7LGpjJjEznk1Mqe3macdjeylbbUxpOZiE/ddqsc
	hy9DCI7zQpgrI76OvVE1x8JMHbUs7qDv9yCB32P6x0Y6CrK8N8eadDznWJ3eEJV3OwEwIa2I0Qr
	iyERNnhhuDXPEHk3V8yQYUUBWfITz1z7TMWw5k0YHHZnMHKPTFMCUmswOFLcEn8mfrmVrLXF8NP
	zJ9NtdmisSuN/67Lkrugo1gInzdRh1xebzubpIBB3P+0RoDr995XS2H/TJeS0/wci79U/2htxGK
	flobVJHw2Sf/okzfkld0tzhbpDUqMfxJJjWHndKY2qFeANdWee10kMZ+hxL3bWXk+R2DC9jypUO
	4ns8imGmQdthqJNBNySaQvJ1pGpZxUD2s6Npsad6O7KJ12ttC5dqJu0LJooWaQnHo76L+U5Tj4Z
	KdNhgLb3/AvHgrKdNeD7bu55GUlVqsWA8BOFWXzIaq75XuPz+lU039tVzPCp5l/ntyTy/L4=
X-Received: by 2002:a05:6000:2c03:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e6e4fca93mr39774284f8f.51.1793887569888;
        Thu, 05 Nov 2026 06:06:09 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11454111f8f.45.2026.11.05.06.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:06:08 -0800 (PST)
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
Subject: [PATCH v6 08/10] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Thu,  5 Nov 2026 16:05:08 +0200
Message-ID: <20261105140510.165165-9-clamor95@gmail.com>
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

