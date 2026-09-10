Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32AA55293A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068334; cv=none; b=cZXIouiseCUek+uCuOn22KyGxl/6nS4B3GXpeV2qPQsKyD4Qvt7wOT/LFdj4uTicbG7+WQBtXksnBmsGf9PlDb3ZGsY6EOw2JOAqVniQDokYiFMpkIiNjVZU89QoX53O2oGqttQjRhGyvNz7Vn0xU3469NMBk/UftJ/g69rsuGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068334; c=relaxed/simple;
	bh=NI3xH8wKPDkjduTHyTXkUAaG4Hx9hBJEr5Q4eAegmPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsynpqSWi7ot7GazUYgU/z4FFw3LX9Vvch9flvE1phlO6AwVQd4ioJ3kwYUnpW5+852+MawN6A6abTfVPnC+GT3EbVu9/xa7tb0n/vjV+qL3E7s/GWcGb+lfdgwABc4bmb82pxP655IixSwCeZobAIb70+YjZnfqyiyAk8/+jM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzn8LsUD; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzn8LsUD"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4bdf8acd6so203301a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789068332; x=1789673132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+PeYuTXLJN0HyhAFocaxbl7I4I0JEiUHMhHC88VArJc=;
        b=kzn8LsUDgcNArjZhG7Ni65yljvUrum+Zt8vqor4687eXNBIBoxbsK2MH5M0L61wtUZ
         OksZaY33ou9miicQ0eB92Dr7Tiz9Xmo2Dy3OYVOkXbPGHxRwzqRzk4WFN4TosyMSjHae
         odBLUpcZph2KjCCinqd1ybOVOdEGqnvKJW+zDrI/qhvBeBtMCUJ/7Xv2Ph4Huh5Tpl8U
         sTe1sQan4QgE/UvMGBZgz6Y1Zn5tWPlJi5YbbObct4ZfbF4yImnfsaDow2kuk1GDMPvI
         2cztAL5uX9kJ1tLN5frWcDoQk2g9Cfvy32KWeQKK5+Gtgt5CZJ2wOl8h6rlDk7WQM5J8
         3PSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789068332; x=1789673132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+PeYuTXLJN0HyhAFocaxbl7I4I0JEiUHMhHC88VArJc=;
        b=NJ0qTBK/Ju4oIM1K2Qz6x8rVFfCuw802vRTTP9iJhzlvyKoDCQB6a8IhafbZFZs5MT
         tA/rj+50UUTWVFLn9TbZPk2mVZoh/ysO7Nmaa/Q88oZcwFHg+KZFpd/p/L7g98xAzPm5
         LCKZ+fOBOJjOEFTgkhDrk6OfUHu9OjtoYgfI6ixQozr2Z4r9l8PiG0u+LEq1JmPuMOXE
         0y58fuSU/z6QQpv7Nbt/bQKmTuPxzS4r24kSC3tYfcc9Bu0/e4tndz4pqgohQhMsPALo
         Vixn3jA/I/YBdWWecnyf6b8Qt7T7dfYlJP83bMZfnD5j5ilRK92u0sq5CYbawE5lv04V
         /gFw==
X-Forwarded-Encrypted: i=1; AKwUvBydo3/XmIQ5HAWjS06O/rpE8dO+Fv51vH9ihiHvsuTMrEWxe77576NV/1T40jZP/7O300F91rP1grxsVvE=@vger.kernel.org
X-Gm-Message-State: AFuF++lWt2OYMSQqIAgTBXkGef/Wnvn66+wsVMjEDhJJMwV6R8EnPcih
	JQ62nAkmB1Wz03kAQP3nOpzcYHCWRAKtqQxfuYLddBKx5Hg01IbARKbZ
X-Gm-Gg: AYBFou2miUGPklK0M5ILzJtOCs1dF406Hu0oKyw80zzMfky/w+Y3u7YndyyiOVcEAND
	ghTD/bFb9fHchFFcyYZ9TohtqaSl45PYTRm+FiqLFcU4pIVerdg55MiCAXHPUGwdk6wjEZCJcrf
	xpRNjOM6EZoi1tpGbq0HpIFsiIfvJHjnwQCygK0GhU/fyKDiKz54ddstxVDgtJvLGr6uN1oHP0d
	jPk4yY7m1+GGkZY0GmazTlYqINrNA89XvhFjBJ4+JSgtvSa9q7Ui5XP5sTGcpqiLncUScD4g/zi
	FvyoqXdYmT0yPXElhlWrZeIiP7Gbt1uB8DHNXnIh6P7Y7aYQjaa/zjqKMlb9Rwbw/OqvxFUw6dA
	TJ0gck0aznBEas3Y9KSDNljy81z8R1y+M/uLKpfmcW4BX7Sbu3SQ8Gw396oY5WcXAvJJZq7ITrk
	1FKN01/GmydVxhV1n0G/qvzUDllwtSn1Bpifp/dwnpQ6DWrTsj5LZBnfpD7Hem8UgyHd/LLW8x
X-Received: by 2002:a05:6a20:3c8d:b0:3d0:8cbb:8c2d with SMTP id adf61e73a8af0-3daed2183cemr810896637.4.1789068331771;
        Thu, 10 Sep 2026 12:25:31 -0700 (PDT)
Received: from fox.. ([43.242.224.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f1e434sm228408eec.22.2026.09.10.12.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:25:31 -0700 (PDT)
From: Roshan Kumar <roshaen09@gmail.com>
To: linusw@kernel.org,
	dri-devel@lists.freedesktop.org
Cc: leandro.ribeiro@collabora.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	pimyn@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/pl111: drop alpha formats the hardware cannot scan out
Date: Fri, 11 Sep 2026 00:55:26 +0530
Message-ID: <20260910192526.137057-1-roshaen09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825105427.686619-1-roshaen09@gmail.com>
References: <20260825105427.686619-1-roshaen09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PL110/PL111 controller scans out a single framebuffer and never
blends its alpha channel with anything. In every pixel-format table
each alpha-carrying entry (ARGB/ABGR in 8888, 1555 and 4444) maps to
exactly the same register configuration as its XRGB/XBGR counterpart,
so the alpha byte was never used by the hardware.

Commit 860e748bddcc ("drm: ensure blend mode supported if pixel format
with alpha exposed") added validation that warns when a plane exposes
alpha formats without a pixel blend mode property, and PL111 does exactly
that. With panic_on_warn enabled the warning prevents the syzkaller
vexpress-a15 manager from booting.

Drivers should not report formats they do not support, so remove the
alpha formats from all variant tables: the generic PL110, PL111 and
Nomadik tables in pl111_drv.c and the board-specific Integrator, IM-PD1,
Versatile and RealView/Versatile-Express tables in pl111_versatile.c,
plus the now dead case labels in the display setup and the Versatile
syscon connector switch, instead of advertising a blend mode property.
Behavior is unchanged for userspace that picks an XRGB/XBGR/RGB format;
alpha-picking clients fall back to the identical X variant.

Link: https://github.com/google/syzkaller/issues/7805
Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format with alpha exposed")
Signed-off-by: Roshan Kumar <roshaen09@gmail.com>

Changes in v2: drop the alpha formats entirely instead of advertising a
DRM_MODE_BLEND_PIXEL_NONE property, per review feedback from Thomas
Zimmermann. Leandro's Reviewed-by from v1 is not carried as the
approach changed.

Changes in v3: v2 missed the board-specific variant tables in
pl111_versatile.c (Integrator, IM-PD1, Versatile, RealView and
Versatile Express), which still exposed alpha formats and would fall
through to the WARN_ONCE default in pl111_display_enable() on those
boards. Pointed out by the sashiko AI reviewer.
---
 drivers/gpu/drm/pl111/pl111_display.c   |  6 ------
 drivers/gpu/drm/pl111/pl111_drv.c       | 16 ----------------
 drivers/gpu/drm/pl111/pl111_versatile.c | 18 ------------------
 3 files changed, 40 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index 5d10bc5fdf1f..e1b513d36c27 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -267,14 +267,12 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 		if (priv->variant->st_bitmux_control)
 			cntl |= CNTL_ST_LCDBPP24_PACKED;
 		break;
-	case DRM_FORMAT_ABGR8888:
 	case DRM_FORMAT_XBGR8888:
 		if (priv->variant->st_bitmux_control)
 			cntl |= CNTL_LCDBPP24 | CNTL_BGR;
 		else
 			cntl |= CNTL_LCDBPP24;
 		break;
-	case DRM_FORMAT_ARGB8888:
 	case DRM_FORMAT_XRGB8888:
 		if (priv->variant->st_bitmux_control)
 			cntl |= CNTL_LCDBPP24;
@@ -297,13 +295,11 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 		else
 			cntl |= CNTL_LCDBPP16_565 | CNTL_BGR;
 		break;
-	case DRM_FORMAT_ABGR1555:
 	case DRM_FORMAT_XBGR1555:
 		cntl |= CNTL_LCDBPP16;
 		if (priv->variant->st_bitmux_control)
 			cntl |= CNTL_ST_1XBPP_5551 | CNTL_BGR;
 		break;
-	case DRM_FORMAT_ARGB1555:
 	case DRM_FORMAT_XRGB1555:
 		cntl |= CNTL_LCDBPP16;
 		if (priv->variant->st_bitmux_control)
@@ -311,13 +307,11 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 		else
 			cntl |= CNTL_BGR;
 		break;
-	case DRM_FORMAT_ABGR4444:
 	case DRM_FORMAT_XBGR4444:
 		cntl |= CNTL_LCDBPP16_444;
 		if (priv->variant->st_bitmux_control)
 			cntl |= CNTL_ST_1XBPP_444 | CNTL_BGR;
 		break;
-	case DRM_FORMAT_ARGB4444:
 	case DRM_FORMAT_XRGB4444:
 		cntl |= CNTL_LCDBPP16_444;
 		if (priv->variant->st_bitmux_control)
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index ac7b1d12a0f5..2175ac953795 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -341,13 +341,9 @@ static void pl111_amba_shutdown(struct amba_device *amba_dev)
  * This early variant lacks the 565 and 444 pixel formats.
  */
 static const u32 pl110_pixel_formats[] = {
-	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_ABGR1555,
 	DRM_FORMAT_XBGR1555,
-	DRM_FORMAT_ARGB1555,
 	DRM_FORMAT_XRGB1555,
 };
 
@@ -361,19 +357,13 @@ static const struct pl111_variant_data pl110_variant = {
 
 /* RealView, Versatile Express etc use this modern variant */
 static const u32 pl111_pixel_formats[] = {
-	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_BGR565,
 	DRM_FORMAT_RGB565,
-	DRM_FORMAT_ABGR1555,
 	DRM_FORMAT_XBGR1555,
-	DRM_FORMAT_ARGB1555,
 	DRM_FORMAT_XRGB1555,
-	DRM_FORMAT_ABGR4444,
 	DRM_FORMAT_XBGR4444,
-	DRM_FORMAT_ARGB4444,
 	DRM_FORMAT_XRGB4444,
 };
 
@@ -387,19 +377,13 @@ static const struct pl111_variant_data pl111_variant = {
 static const u32 pl110_nomadik_pixel_formats[] = {
 	DRM_FORMAT_RGB888,
 	DRM_FORMAT_BGR888,
-	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_BGR565,
 	DRM_FORMAT_RGB565,
-	DRM_FORMAT_ABGR1555,
 	DRM_FORMAT_XBGR1555,
-	DRM_FORMAT_ARGB1555,
 	DRM_FORMAT_XRGB1555,
-	DRM_FORMAT_ABGR4444,
 	DRM_FORMAT_XBGR4444,
-	DRM_FORMAT_ARGB4444,
 	DRM_FORMAT_XRGB4444,
 };
 
diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
index 0d8331a3909f..9a60f10231b1 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.c
+++ b/drivers/gpu/drm/pl111/pl111_versatile.c
@@ -209,9 +209,7 @@ static void pl111_versatile_enable(struct drm_device *drm, u32 format)
 	drm_info(drm, "enable Versatile CLCD connectors\n");
 
 	switch (format) {
-	case DRM_FORMAT_ABGR8888:
 	case DRM_FORMAT_XBGR8888:
-	case DRM_FORMAT_ARGB8888:
 	case DRM_FORMAT_XRGB8888:
 		val |= SYS_CLCD_MODE_888;
 		break;
@@ -221,9 +219,7 @@ static void pl111_versatile_enable(struct drm_device *drm, u32 format)
 	case DRM_FORMAT_RGB565:
 		val |= SYS_CLCD_MODE_565_B_LSB;
 		break;
-	case DRM_FORMAT_ABGR1555:
 	case DRM_FORMAT_XBGR1555:
-	case DRM_FORMAT_ARGB1555:
 	case DRM_FORMAT_XRGB1555:
 		val |= SYS_CLCD_MODE_5551;
 		break;
@@ -266,44 +262,30 @@ static void pl111_realview_clcd_enable(struct drm_device *drm, u32 format)
 
 /* PL110 pixel formats for Integrator, vanilla PL110 */
 static const u32 pl110_integrator_pixel_formats[] = {
-	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_ABGR1555,
 	DRM_FORMAT_XBGR1555,
-	DRM_FORMAT_ARGB1555,
 	DRM_FORMAT_XRGB1555,
 };
 
 /* Extended PL110 pixel formats for Integrator and Versatile */
 static const u32 pl110_versatile_pixel_formats[] = {
-	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_BGR565, /* Uses external PLD */
 	DRM_FORMAT_RGB565, /* Uses external PLD */
-	DRM_FORMAT_ABGR1555,
 	DRM_FORMAT_XBGR1555,
-	DRM_FORMAT_ARGB1555,
 	DRM_FORMAT_XRGB1555,
 };
 
 static const u32 pl111_realview_pixel_formats[] = {
-	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_BGR565,
 	DRM_FORMAT_RGB565,
-	DRM_FORMAT_ABGR1555,
 	DRM_FORMAT_XBGR1555,
-	DRM_FORMAT_ARGB1555,
 	DRM_FORMAT_XRGB1555,
-	DRM_FORMAT_ABGR4444,
 	DRM_FORMAT_XBGR4444,
-	DRM_FORMAT_ARGB4444,
 	DRM_FORMAT_XRGB4444,
 };
 
-- 
2.43.0

