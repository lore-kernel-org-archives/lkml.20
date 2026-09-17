Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F9C4C151A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643156; cv=none; b=jmxpD2kq4k9aiO3O5ClvUAayPca0UM7skEny/5QFI7aux1gKVt8P+yuTT11yHKJNrVIvZ9TjWfhShBYLB4VUmiS5wIwAF3iLmhhScd8r+vPVK2vjjjdFh7aK5T6OAhevl+QQBIWd1AZk1lwonOmgiJQg7NFZJ1tVhW1hiWOvcEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643156; c=relaxed/simple;
	bh=VHbxP4NKlWOtSD5WkpNSfXYZrPAY10l7ujxqWk8ocaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OPmufdI43xtotAfhgIFkZ6ClNMg9SGyRt6pg3SPIc12ZAS9vvsKxfea/KZm4Ru3na8GCmwSwuVfxaM3nHi3oJOgbQcR+sB3F7ZIUvGaH4ZaDZVm08AUfbgLxmc2cVWs8QSxfdroTM2o9yOnH6Nz45h4ANOYR+vCM5TntpJFdCHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=Cl+yCq84; arc=none smtp.client-ip=185.136.64.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="Cl+yCq84"
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260917110520b3108e04d50002077c
        for <linux-kernel@vger.kernel.org>;
        Thu, 17 Sep 2026 13:05:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MvfE6RVo7N77d1jPZq+4yUexpW1TVNW5JhHuRAUTj6k=;
 b=Cl+yCq84xzgJwvOh7DKuyayhyAWyV3Lca8I0hMx1xhKhUMS+cugBPqqs4Id6FYQeEbGTr4
 91VN9z3PsTacSI3BXRxftiLdwsGqf3LkKzaM1A8Hs9NSqpqD7FPuzo0PF914Nb6otaIfJeuI
 3mSaITvNIs0gjXKh+ATZ9SGYXWoB15+ByGhG4bpyqEJR0vsAi5tPWGEqT5/ZmDGkWzRATegV
 SZb/ySc2vfkPR7tjkoq59meiV4HdpxjqxZfZrnt3hOLeAFdU9a7rlZ/P495eUD3YY39GNpxf
 IKcKz2agBIYW/eccWHWIJQLdpCZmNGU8UwweyU3ejP32XH5NkpdK4FeA==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Frank Bodammer <frank.bodammer@siemens.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-kernel@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [PATCH 2/2] drm/panel: simple: Add support for Truly TFT320240-229-E panel
Date: Thu, 17 Sep 2026 13:05:15 +0200
Message-ID: <20260917110517.1053556-3-alexander.sverdlin@siemens.com>
In-Reply-To: <20260917110517.1053556-1-alexander.sverdlin@siemens.com>
References: <20260917110517.1053556-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Frank Bodammer <frank.bodammer@siemens.com>

Add display mode and panel descriptor for the Truly TFT320240-229-E
LCD panel.
Register the panel in the of_device_id table with the compatible
string "truly,tft320240-229-e".

Signed-off-by: Frank Bodammer <frank.bodammer@siemens.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index c95964ba25a95..bd7f6eaeb0deb 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -5114,6 +5114,32 @@ static const struct panel_desc tpk_f10a_0102 = {
 	},
 };
 
+static const struct drm_display_mode truly_tft320240_229_e_mode = {
+	.clock = 6410,
+	.hdisplay = 320,
+	.hsync_start = 320 + 8,
+	.hsync_end = 320 + 8 + 39,
+	.htotal = 320 + 8 + 39 + 4,
+	.vdisplay = 240,
+	.vsync_start = 240 + 8,
+	.vsync_end = 240 + 8 + 8,
+	.vtotal = 240 + 8 + 8 + 4,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc truly_tft320240_229_e = {
+	.modes = &truly_tft320240_229_e_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 70,
+		.height = 53,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct display_timing urt_umsh_8596md_timing = {
 	.pixelclock = { 33260000, 33260000, 33260000 },
 	.hactive = { 800, 800, 800 },
@@ -6167,6 +6193,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "tpk,f10a-0102",
 		.data = &tpk_f10a_0102,
+	}, {
+		.compatible = "truly,tft320240-229-e",
+		.data = &truly_tft320240_229_e,
 	}, {
 		.compatible = "urt,umsh-8596md-t",
 		.data = &urt_umsh_8596md_parallel,
-- 
2.55.0

