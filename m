Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5510E49AA54
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 19:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884757; cv=none; b=kLDaMiRN59cuu0oekxzfQ6+XuugeZx3kmMrPYPnh3BZn7JtHvx3MV7ris0KohbfUHowbq5b766tkF7elEQPWsneJaaJS6WPeK/1k4qWQ4ZF+K0Cn2gSKEFj++IU+dk1ariC0/UMRoxnwJWTJU5hU6coOUpHfG+27OzDzLCIBvzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884757; c=relaxed/simple;
	bh=qG8UzuDcZ64WrR4bdPr+wECAUBeSYE1XoeEczL4GqnU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f/OU8IO2UcGr5E7MF/RO6tfSbDVSr//uo6hT4LqZOeNnJwySlfSzYb7n4fxLo8KNXH154TCDGLpdGZnLoVEtSXamOInU7Jug8eOVz59ne1ZHYtRmMskZwaLjb8fU6sVYyjNY+cjCAcYopnmZTX6+ZIq8+O44pqywGF5DE1wHYhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hF6hjJ1Q; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hF6hjJ1Q"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso43262625e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790884752; x=1791489552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XVc+fU/zcPUru0u/1bv2Cu0U8wgH+3PGO04gz/Rcw/g=;
        b=hF6hjJ1QQ1jq110jwclgCbvcLgwfI3gdFXB/J+ndOa6dwoi8vp6K/K5Qjb0VAx1Zvs
         Uh35xxvNMmprmr4FjMfcL1W9sZAvovkpoQjmhLA58vnOXiV5wC+2+8KrII/7KdP55sFJ
         yA3LN5LIGxSUL3lufZ8MUIivHSSHGHyWcYHtdAFrqCfOwrKYfdl8kgximPDIh0UVgMKr
         T2QwLDPWFxFtVxEWnkoqiPOVqJZJKbv5JCx3G4OpYiOKq93mIuLV9h4e199esYC+pCNa
         85HkXRrgb1hAbnPJ8TeSnzZwiCRILaax+98rC3liq8A+285q7as42bFTBPUII2dhEVeA
         KxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884752; x=1791489552;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVc+fU/zcPUru0u/1bv2Cu0U8wgH+3PGO04gz/Rcw/g=;
        b=0w759q7Bog4/SBWRg8D7bRrCuSHWpLpI8f+aSeUU58TpIf5GpZCassHP1R8HX8fIkT
         dbH3tHgrcp9EzDsEtGlx7fUGckLjYaMSLlXxbt9C1RAaIyb0YedAPjyUNxt5jL4ujAgC
         sJaLRrG6zqeB9+e7/a3yiqff7vc5Q4oR33Rf76L3HSq5pAxX2WUPhIuAl6RhzzQLuDmv
         IL8ZovFq1ZKQ7VVK4KaGII3J80kGFnABEb3DbVSOfKM8/lCo64EtPC73sa1fJ2SamPRp
         Ed+htT3gM9BaUlNpXdWJ/ZucSzO8WIFNvqEf13TC9lgfyltUXVoatWZ5q3RrBN0bnaRP
         QyzQ==
X-Forwarded-Encrypted: i=1; AKwUvByK2YS+irV+fpZaQmcdfRZfR1UIKoaj3tDOUELWzMLs9ztMgmVAraUjTKReiR+NXtIHqHiGrWAJn37CgTU=@vger.kernel.org
X-Gm-Message-State: AFuF++lnpLNWk5nBVpKN+sXoYom9suBYpD/0RPWqGHmn9/uj5r5+E2k8
	TXOjG79hfhmpwA+aRTFOaz2p75c/KTCWzdcem2tvMb9ccjHAuT2y6Skm
X-Gm-Gg: AYBFou1O4BhIdTvRHnP4TW/N+sPzNI3+LB2FP2y1HbJDJmYtejq7T63MR0VS10Q8UIH
	SfdvW7KmAdVrmvtE2PdpgCR13nK4XSIumy23vHmaC73FqHR67aziId+KoYo9DdW63Hb4cZIuovv
	wVCpkNpaSIByNIY//xfnj/Xf8JC6HtfSDSM7gXyBZEur8rfA/c7ure7UY/UdnDahh+7rs4SrNP6
	PBDG1yfDYgWUQyCF6jvK5kKcYxYe5KsxkAJdGBAAt7xrNHhF+gKodWhrCK7mZomJe14PsqezkVe
	E98PhKeQaTj1GOu9+1QDhJckt8bh4RwWwnKnBVl6qXx5eXBFCT9BdvkNntdxZAdnttN1LIcOzRT
	cGb+feN2yNotGIaZEhqKjtlAARnk8sP7OW09JAeoA8inC0HFJDSC1x6+8DyzPBlNv/Awt3sruvO
	+VO1/n6xXMIwoRNNAYfRxQkyrkkuKhkAnAdG7ix3yUJ7OcGekx97PnQzpQyKJUky3uPp06GgqK1
	678VXqIzNPxKQp9Xx8nmjQWFUhI1/7HKHEg
X-Received: by 2002:a05:600c:3b01:b0:49f:ce72:e930 with SMTP id 5b1f17b1804b1-4a02758eed8mr12271135e9.34.1790884751563;
        Thu, 01 Oct 2026 12:59:11 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276f92d9sm15031045e9.4.2026.10.01.12.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:59:11 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Francesco Valla <francesco@valla.it>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 11/13] drm/client: splash: turn the BGRT image on panels mounted turned
Date: Thu,  1 Oct 2026 21:58:45 +0200
Message-Id: <20261001195847.141192-12-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261001195847.141192-1-maximpedraza@gmail.com>
References: <20261001195847.141192-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since ACPI 6.2, bits 1-2 of the BGRT status tell that the firmware
image is not pre-rotated and how far it has to be turned to show
upright on a panel mounted turned. The client skipped such images
altogether, so tablets and 2-in-1s with a portrait panel got no splash.

Turn the image as the bits say. The values count 90 degree steps
counter clockwise, as Plymouth, the main user of the BGRT, applies
them, and as DRM_MODE_ROTATE_* count, which is what they become.

The offsets need more care. For such an image the firmware gives them
on the upright screen, while the client draws into the buffer as it is
scanned out, which on a panel mounted turned is the upright screen
turned the other way. Check them and apply the efifb sanity check in
the upright frame, then move the image's rectangle into the buffer's
frame. An image without the bits is drawn at its offsets as before:
the buffer is the frame the firmware drew it in, so a pre-rotated image
needs none of the guessing userspace has to do for it.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/drm_splash.c | 77 ++++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index 30ba6573424e..34f3c3910be1 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -388,14 +388,14 @@ static bool drm_splash_bgrt_available(struct drm_splash *splash)
 		return false;
 	}
 
-	if (bgrt_tab.status & ACPI_BGRT_ORIENTATION_OFFSET) {
-		drm_info(client->dev, "splash: BGRT rotation bits set, skipping");
-		return false;
-	}
-
 	return true;
 }
 
+static inline u8 drm_splash_bgrt_get_status(void)
+{
+	return bgrt_tab.status;
+}
+
 static inline unsigned int drm_splash_bgrt_get_xoffset(void)
 {
 	return bgrt_tab.image_offset_x;
@@ -445,6 +445,11 @@ static inline unsigned int drm_splash_bgrt_get_yoffset(void)
 	return 0;
 }
 
+static inline u8 drm_splash_bgrt_get_status(void)
+{
+	return 0;
+}
+
 static inline int drm_splash_bgrt_load(struct drm_splash *splash,
 				       const u8 **data, size_t *size)
 {
@@ -452,6 +457,26 @@ static inline int drm_splash_bgrt_load(struct drm_splash *splash,
 }
 #endif // CONFIG_DRM_CLIENT_SPLASH_SRC_BGRT
 
+/*
+ * Since ACPI 6.2, bits 1-2 of the BGRT status say that the image is not
+ * pre-rotated for a panel mounted turned, and by how much it has to be
+ * turned to show upright on it: 0, 90, 180 or 270 degrees, which firmware
+ * and userspace (Plymouth) apply counter clockwise, as DRM counts them.
+ */
+static unsigned int drm_splash_bgrt_rotation(void)
+{
+	switch ((drm_splash_bgrt_get_status() & ACPI_BGRT_ORIENTATION_OFFSET) >> 1) {
+	case 1:
+		return DRM_MODE_ROTATE_90;
+	case 2:
+		return DRM_MODE_ROTATE_180;
+	case 3:
+		return DRM_MODE_ROTATE_270;
+	default:
+		return DRM_MODE_ROTATE_0;
+	}
+}
+
 static u32 drm_splash_find_usable_format(struct drm_plane *plane,
 					 u32 preferred_format)
 {
@@ -709,11 +734,21 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 	}
 
 	if (splash->src == DRM_SPLASH_SRC_BGRT) {
-		x_pad = drm_splash_bgrt_get_xoffset();
-		y_pad = drm_splash_bgrt_get_yoffset();
-
-		if ((x_pad + bmp_width) > scanout->width ||
-		    (y_pad + bmp_height) > scanout->height) {
+		/*
+		 * The BGRT offsets place the upright image on the upright
+		 * screen, which for a panel mounted turned is not the frame
+		 * the buffer is scanned out in. Work in that frame, then move
+		 * the image's rectangle into the buffer's.
+		 */
+		bool quarter = splash->rotation &
+			       (DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270);
+		unsigned int lw = quarter ? scanout->height : scanout->width;
+		unsigned int lh = quarter ? scanout->width : scanout->height;
+		unsigned int xo = drm_splash_bgrt_get_xoffset();
+		unsigned int yo = drm_splash_bgrt_get_yoffset();
+
+		if (xo > lw || bmp_width > lw - xo ||
+		    yo > lh || bmp_height > lh - yo) {
 			drm_err(client->dev, "splash: BGRT image would overflow");
 			return -EINVAL;
 		}
@@ -730,11 +765,30 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 		 * the display looking quite bad.
 		 */
 
-		if (x_pad != (scanout->width - bmp_width) / 2) {
+		if (xo != (lw - bmp_width) / 2) {
 			drm_err(client->dev, "splash: BGRT sanity check failed");
 			return -EINVAL;
 		}
 #endif
+
+		switch (splash->rotation) {
+		case DRM_MODE_ROTATE_90:
+			x_pad = yo;
+			y_pad = lw - xo - bmp_width;
+			break;
+		case DRM_MODE_ROTATE_180:
+			x_pad = lw - xo - bmp_width;
+			y_pad = lh - yo - bmp_height;
+			break;
+		case DRM_MODE_ROTATE_270:
+			x_pad = lh - yo - bmp_height;
+			y_pad = xo;
+			break;
+		default:
+			x_pad = xo;
+			y_pad = yo;
+			break;
+		}
 	} else {
 		x_pad = drm_splash_place_axis(splash->pos_x, splash->off_x,
 					      scanout->width, img_w);
@@ -818,6 +872,7 @@ static enum drm_splash_source drm_splash_pick_source(struct drm_splash *splash)
 	/* The BGRT carries no colour: firmware splashes sit on black */
 	if (drm_splash_bgrt_available(splash)) {
 		splash->bg_color = CONFIG_DRM_CLIENT_SPLASH_BACKGROUND_COLOR;
+		splash->rotation = drm_splash_bgrt_rotation();
 		return DRM_SPLASH_SRC_BGRT;
 	}
 
-- 
2.39.5

