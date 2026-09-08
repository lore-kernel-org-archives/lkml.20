Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BB84F55D4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859744; cv=none; b=Do1R5ZFucQT5GhXYz7rPb855GQoN2TxEZjjhQXpVApAd/wgPcJbPxEcSI2c118q0kogAvfzFCmwm2IyDPTay8XViujnOuHWuYLyP1oj9HYchzypU72a55giChwCiryEOUshBuhjVDIcJALOex6bPKyDL0GoXxN5JVSW+4/D+sTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859744; c=relaxed/simple;
	bh=a0rRKvQpja4x9Wc4eVaiX2PDty0wVqc3KrTsnj6RKEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGPdHuk+UHV3QokxSaXOc6aMU0D7NCfFB5hgrvOQsWXwIQxrOzyOrOZMTpcsrihtBGSxgT/PHY/+Yead9xCnrmm5UNkCp6xW1sSAIOSWRbdPzoDyQpq8q+bCDKc10Vd0trmmxr4Gqcsj3wk9ppMb4m9GuhEkH/gVJNOuUw7M5Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3lBnxa3; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3lBnxa3"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d942c7cc2fso36318465ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859743; x=1789464543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmzVhnhLbLcNlB7eM5nEQlH5gSc4bZ2/+8H5Qa6R9LQ=;
        b=n3lBnxa3VZa2YEB0xh31PaTNjEJZaeCMCpeOZjQ5Nng+550I8PwNxDSj/Uqz2qzBDh
         ltnEBDZkAvl7TZw0fZovvZbEw+q2aC5E0kFIrQkl20mqxQEHvf6LvGAZQhRlpJqIW3M7
         0SfUyp70BK35MaDlsHYWs/Lg5cKfATcEwWsQnAzn2UOHUzF4SG4Nw0EbLiCRW70Kj8r5
         hsbhbRa9Q/Ap1jBudHphvmkCU9YzO56Z2P5t82WqmonRV8PmuYnNmfDUhtyh358eMwzv
         T4XtrOarJPpm6rLxbx16XWmIv6uEXucJ4FFPXIwM/KQh9QDj1oYjQxavXtwjCfLRV0lJ
         3cIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859743; x=1789464543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NmzVhnhLbLcNlB7eM5nEQlH5gSc4bZ2/+8H5Qa6R9LQ=;
        b=M6XS7acPVr3JZJhzml2C/SMn6H6E3Epoer1KFb+Nx30tn6P6EfiWZMJXjSsVk1l0qU
         xmV1cAMZmuZwj+U6UoDfS1H7Du6vrqQPnUQ0/Acnji5nS5cPw3IBx1ek4e0tVIfq5jBh
         uoEtXTpP6Zq4FoClyvNwGX2osHMXhSzBM7yRQI5ns9ObpbCmo7iYyLGa7vw0tjuUTGXi
         Lx5xhIGY2O8sch+eSZKFIgqarIXYSnoe9H5O0glT+N/LeeQ++ckpsB5oUP6cQ4im/xi/
         idHEfcnrZYEfeE4pXHjIAFqACQoo5SdGF3Hoh4BVkIlwVKgHvaxp7tlDW74ale8cRjqh
         hqYA==
X-Forwarded-Encrypted: i=1; AKwUvBw7r1EMs5ZNUVoJP0ZwKNmJ0ZOEn/t1B6Cj57PUVMAB8lbwFw25UTdUHKnEwUjAe2UtScK3Qyjcsk0GHLc=@vger.kernel.org
X-Gm-Message-State: AFuF++mhsEwqRIBPa+6L7a6dS1glV3k2zTaFk5aWZjMpFY/saOuEh1PQ
	E0fCIjE8Q5Qg4JGy7vK6I4Sd9rTw0Sz/oVT5j+efuKECia/EOkGXNEbD
X-Gm-Gg: AYBFou2X404edobiuOGyY9/G6g/Aqi1nU4pDJDOpDxDh6J/KrZag8CC97ARKPtUaZr7
	S0DGYTGmJN2QTOuSBR+YAgEsrrP8Y3+Rlw4+tdS3nCeF6AySmsMON74cmoJq1Vg9zWHAWWrQCHb
	xGTwMxldM9xnWFijkDUnZQxBdA+f7QkqdYimJrXp839+uj0jBPgNZxrOAdIhnZRT+VWfK4fc5V2
	qH6DjiWNzk3P2Lk1RQSGUI4Vb/vRk6a8h83nmfR+Hzsw5zpPVnmKcE7UYbaMmTzehRM8Vz+ZNEu
	M65Xi4RE6FBJAoV4ul9OG+Wn6F7c0bCniILaqCRo26UZ6umWeC/x5ZlBiTxEAYOJC3qrOGTkSkF
	af84qMIjuGSLB7bhLA663iNdqVlM6CKnhyb0UHtYRve7HS946T8ubRCKF5s8Pz8btlTIHjzF/x1
	5KYFoaSlTGtJygj7RPzlZ7gzpFcIjk27O8F8+ZFGQ1SnB5wFv0QvT04wwtskEfSt0N878urbOWJ
	hOUznPdVLvmHZan+BrAdLBDiEwMPjJ6qw3umJ9zDLnEmE3rP5yp
X-Received: by 2002:a17:90a:c10e:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39b2622b3afmr39437638a91.18.1788859742702;
        Tue, 08 Sep 2026 02:29:02 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm32109846a91.9.2026.09.08.02.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:29:02 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v6 4/6] drm/verisilicon: add DC8000 (DCUltraLite) display controller support
Date: Tue,  8 Sep 2026 17:28:38 +0800
Message-ID: <20260908092840.225220-5-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908092840.225220-1-a0987203069@gmail.com>
References: <20260908092840.225220-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Verisilicon DC IP family also ships in a DCUltraLite (DC8000
generation) configuration that lacks the DC8200's CONFIG_EX staging
registers and PANEL_START sync register, and exposes its VSYNC
interrupt through a differently laid out status/enable register pair.

Add a vs_dc_funcs implementation for the DC8000 generation in
vs_dc8000.c: framebuffer updates are latched directly through
FB_CONFIG's enable/reset/valid bits instead of a staging commit, panel
output starts as soon as PANEL_CONFIG.RUNNING is set with no separate
sync register to arm, and the VSYNC interrupt is acknowledged through
DISP_IRQ_STA/DISP_IRQ_EN.  Select this vtable in the probe path based
on the chip identity's generation field.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/Makefile    |  2 +-
 drivers/gpu/drm/verisilicon/vs_dc.c     |  5 +-
 drivers/gpu/drm/verisilicon/vs_dc.h     |  1 +
 drivers/gpu/drm/verisilicon/vs_dc8000.c | 92 +++++++++++++++++++++++++
 4 files changed, 98 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 9d4cd16452fa1..d2fd8e4dff242 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_drm.o vs_hwdb.o \
+verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o vs_dc8000.o vs_drm.o vs_hwdb.o \
 	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c b/drivers/gpu/drm/verisilicon/vs_dc.c
index 9729b693d360e..3e9e2c0264f5d 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.c
+++ b/drivers/gpu/drm/verisilicon/vs_dc.c
@@ -134,7 +134,10 @@ static int vs_dc_probe(struct platform_device *pdev)
 	dev_info(dev, "Found DC%x rev %x customer %x\n", dc->identity.model,
 		 dc->identity.revision, dc->identity.customer_id);
 
-	dc->funcs = &vs_dc8200_funcs;
+	if (dc->identity.generation == VSDC_GEN_DC8200)
+		dc->funcs = &vs_dc8200_funcs;
+	else
+		dc->funcs = &vs_dc8000_funcs;
 
 	if (port_count > dc->identity.display_count) {
 		dev_err(dev, "too many downstream ports than HW capability\n");
diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h b/drivers/gpu/drm/verisilicon/vs_dc.h
index 825f5dd6bf174..ac96ad7011994 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.h
+++ b/drivers/gpu/drm/verisilicon/vs_dc.h
@@ -66,5 +66,6 @@ struct vs_dc {
 };
 
 extern const struct vs_dc_funcs vs_dc8200_funcs;
+extern const struct vs_dc_funcs vs_dc8000_funcs;
 
 #endif /* _VS_DC_H_ */
diff --git a/drivers/gpu/drm/verisilicon/vs_dc8000.c b/drivers/gpu/drm/verisilicon/vs_dc8000.c
new file mode 100644
index 0000000000000..df7bd5bdd7f2a
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_dc8000.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Joey Lu <yclu4@nuvoton.com>
+ */
+
+#include <linux/regmap.h>
+
+#include <drm/drm_print.h>
+
+#include "vs_crtc_regs.h"
+#include "vs_dc.h"
+#include "vs_drm.h"
+#include "vs_primary_plane_regs.h"
+
+static void vs_dc8000_panel_enable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_RESET);
+}
+
+static void vs_dc8000_panel_disable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
+			  VSDC_FB_CONFIG_RESET);
+}
+
+static void vs_dc8000_crtc_begin(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_VALID);
+}
+
+static void vs_dc8000_crtc_flush(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
+			  VSDC_FB_CONFIG_VALID);
+}
+
+static void vs_dc8000_crtc_enable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
+			VSDC_FB_CONFIG_ENABLE);
+}
+
+static void vs_dc8000_crtc_disable_ex(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
+			  VSDC_FB_CONFIG_ENABLE);
+}
+
+static void vs_dc8000_enable_vblank(struct vs_dc *dc, unsigned int output)
+{
+	regmap_set_bits(dc->regs, VSDC_DISP_IRQ_EN,
+			VSDC_DISP_IRQ_VSYNC(output));
+}
+
+static void vs_dc8000_disable_vblank(struct vs_dc *dc, unsigned int output)
+{
+	regmap_clear_bits(dc->regs, VSDC_DISP_IRQ_EN,
+			  VSDC_DISP_IRQ_VSYNC(output));
+}
+
+static u32 vs_dc8000_irq_ack(struct vs_dc *dc)
+{
+	u32 hw_irqs, unified = 0, known = 0;
+	unsigned int i;
+
+	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &hw_irqs);
+
+	for (i = 0; i < VSDC_MAX_OUTPUTS; i++) {
+		known |= VSDC_DISP_IRQ_VSYNC(i);
+		if (hw_irqs & VSDC_DISP_IRQ_VSYNC(i))
+			unified |= VSDC_IRQ_VSYNC(i);
+	}
+
+	drm_WARN_ONCE(&dc->drm_dev->base, hw_irqs & ~known,
+		      "Unknown hardware IRQ bits: %#x\n", hw_irqs & ~known);
+
+	return unified;
+}
+
+const struct vs_dc_funcs vs_dc8000_funcs = {
+	.panel_enable_ex	= vs_dc8000_panel_enable_ex,
+	.panel_disable_ex	= vs_dc8000_panel_disable_ex,
+	.crtc_begin		= vs_dc8000_crtc_begin,
+	.crtc_flush		= vs_dc8000_crtc_flush,
+	.crtc_enable_ex		= vs_dc8000_crtc_enable_ex,
+	.crtc_disable_ex	= vs_dc8000_crtc_disable_ex,
+	.enable_vblank		= vs_dc8000_enable_vblank,
+	.disable_vblank		= vs_dc8000_disable_vblank,
+	.irq_ack		= vs_dc8000_irq_ack,
+};
-- 
2.43.0

