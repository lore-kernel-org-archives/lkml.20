Received: from mail-pj2-f32.google.com (mail-pj2-f32.google.com [74.125.227.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A9E3C1D5E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700513; cv=none; b=eTZwXxQSnaYpuuR/d0K1dC8ubNWtFebhS/RwY/ciPYVah5Z0RCJfIXpRK1E0APZDfbrSYzIxbVmP8uIkKsm0KiwBqnXSDGCzCi0lCum86oMOiBlT4NTrxhvm68eahneoFsrgEYO1wVBaiFygCNsUmf3nzRY5IoQy2yJiIc7KRe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700513; c=relaxed/simple;
	bh=TOT2KHfl2DUHhJTWzsm37Dsjh4xTuhAz0zDPlGY/foU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JZlaxfrlworuykGRP8oPhAuwDMeSEpvI8R1Kte0c/kH54f/37EP/foO6nHZpclJDIO6c1QyZAfwAcULz4bB3lcAGcbUoK8bHg54ZKnRp6AhHwvb3/d/HdNXxj00EPBpKmkJx0S/m+guRgLqtr4eC5FC9xRMv4qeJ88gmciLZ1xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sNw7f4Iy; arc=none smtp.client-ip=74.125.227.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sNw7f4Iy"
Received: by mail-pj2-f32.google.com with SMTP id d9443c01a7336-2d747f05ffdso1809775ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700508; x=1790305308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=toYt9rYplhPBNw8uYg7TjR1uc/+s1ghvN6xnP+MGyco=;
        b=sNw7f4IyXME6yLcOY2shpas2cRDyc8Smcl0ICezCYTOX074TvUb+bGMqHBf3lZdWG9
         CHqO4TyBBCSwFaKKIzApbug5R29+VJREUsTGXBDeD+hFgi3tz9J1Yc77s+XNbioTDPik
         q5pdGS6dhwtEZomsnGitzYmobepgr4l3FoEHgM+2BiWkwGaUSsVMTGYlL77W6WObKZxy
         klavGEXxorTP+CwVFswkSiECQB1zhB5ZlLQ1d3fV3GnIqbflrxLiZmF9FPvutR2GGrrT
         8FA0dysKx4+MziKZ45poG1OVhXRVqHxHurjE0QzdLNnFj8BzX9buZR0F7MiwmYn1z0hD
         nX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700508; x=1790305308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=toYt9rYplhPBNw8uYg7TjR1uc/+s1ghvN6xnP+MGyco=;
        b=0CrwPiYo12MxPTo4U/XoQTK1edeKGMwbFIaj48tAITSsklAVf2gsfax2RP/wdpOxbf
         p1v8slFm9VZNk11Zkn4wGkKcGivjr6QwC9l9IGF2K9MnIQY8s+2gnAlXwim44ZEUKjtI
         EOhh91EhcvuiqyGe+4WyGFGMaqasZkaVdMzHwNPDAFqVRa0tBromT8TqFshJPJhv+ugN
         +0ezMjN6X7WhDlekjFnnZyiIcOKCDxQh4eBQrAynBW8tRCZ5z/3WPdJGjgllOadjtnX8
         lGof0npbPy1o9EQEkngwWNE+kvkOH2883KruNdNdYxvPvq+7vggH8XjgHeVdjGIGWeRO
         dOsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEeut9dH5Yeil8++NFwKxxIIfuFGbCjI0I0n46/s0j0S7362mgqFIe6Iod5k4VthjT4oAWkcxnbZ8wUMs=@vger.kernel.org
X-Gm-Message-State: AFuF++knnfBk7H3pEtgh81S5rW3hVoxtQaHQxkSoxNeNCcDxx4nLYJ+f
	XLzBARSwzw7oFGHbes08rk5NHV8yD6F/iaN2Mfkil7Q4hHQA93rp+AmS
X-Gm-Gg: AYBFou01Nqn9op+DH5Z/rKZzYcZUWYLhxn4+2OYbrweedJGv10s/Cx+RNdaxIplPECt
	gop3EIuo3/XMjNPc73gtBFLly0ZxCkwtzJiPdFdnqJuKXZ5bTfAEeHMY+qGWY4HU/TUezb6LF69
	1wNEJlaTVb61qa9qwK2fvIlXGOs+qRRvK7tEIOYBdPyqgpjHETOseZvaIOMq4Nsbcl60tZ/6Yam
	a3mbrxk41OdGorE0zKREYTrMBctSntFFu1+L1npg8JMAATHYzwovrvU3Fh0hD7BH8GFb5SnPtBR
	YBFMkMNE1WvyorkpB1B4o3vvImoyL4os1HKji2+0GamcMjQPwz8N7zeM7G5UdQGEJNsEhi4DnR4
	yNUhwxhq0PQ3IkJCWUkjccIStMOAOcTs/PEawRlzlJ9FYel4OO9KWXHnrU7NUK8iCyJhcntZGJz
	8RRHaz4xwYx8+8f7NXF8i7r8S/H6/uZxypW4E9xdri3WmkXD+74Eq/fjZ+rEOJN1sXU2zLJL96i
	pBC1fTa1dDJ2gixhFqvuNsv+Bi8J8mufkQ7vsevzwNKmeewk+DNnivYYxelGsg=
X-Received: by 2002:a17:90b:52cf:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39e54bd0941mr2537352a91.15.1789700508027;
        Thu, 17 Sep 2026 20:01:48 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:47 -0700 (PDT)
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
Subject: [PATCH v7 4/7] drm/verisilicon: add DC8000 (DCUltraLite) display controller support
Date: Fri, 18 Sep 2026 11:01:22 +0800
Message-ID: <20260918030125.315978-5-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030125.315978-1-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
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
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
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

