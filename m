Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109257;
	b=jEwi2bdOTR8BgTfAdL6eC7KBsJEwZa1mKcnhqGv0a43ih32NpUnng/HpZ2UOTlhpwlfO
	 EF98MjkU8Oh4oITGVzhVRAOGuJs4NOVysDm2bYMOfBvaxHQ2TpAX9VLV4qLyx0khzuR2+
	 yFOKi7VeAs5YzDggAg5if1isYop3pkWyDvBpHZBp0GsJG5NLiBnyiLS/x1TawnyL+Mpvj
	 xjPbi2pt2hUfr9ek+20fEjYXLr9ND2MhnCph/0wgprmHInPHjdH4c5i/4b5av0npJEsKI
	 3OvcqHX6jsP1XlTudJ+oHHQBHF810O/IQlhqBYIgGLKNEhEPRy+/DVV/wx1ZS9Cv5+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4ZUO0/RrkqHsNpo8fK7tPpZvASb/BT+Zvsy0BqgEIsw=;
	b=PQnvQx8W+0fkN+k86ClUVLKDHxrQ9mMOoa4hfxY766EF78pJ/6ZigcYdFTjfMZtXuomj
	 Md6tfJhOnRwlknS0QY0/BkoJAKUBHaGYXQkOCpfNjxG0tJb9/TL7yIO2M2oQawb9mVV8I
	 gb7AVBIlKS27wvZ0fgDluXJjjED/tSNwZTlBURWnTwBpXcXyHEslF6x9IyQJ5pZBMYv/w
	 UUqzNWPgSTC9KW4l4yM2wk1Z1bt6fKy/jyiW/HSZkcoZVrQQSxxq7naQ2rz40M882Cfau
	 ZQMwgzYQEnn5tWW+dwZDsfWz27+yh/6G4OnkvzTTo342Iszn6tY9bYQBWH2U5L8GSrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eJPipP+G;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23944606AA1C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23944606AA1C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eJPipP+G
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2546738f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109255; x=1793714055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ZUO0/RrkqHsNpo8fK7tPpZvASb/BT+Zvsy0BqgEIsw=;
        b=eJPipP+GH3TuJPsb7NHHtqVbAXgYhOE5DoleMwGo1NX1+018V6csS6+AZDg4V1WMy0
         EqzKoWDITLIJErsfOlYLxwuY5jaQgp0MtE+p4I2+j9hMs6YbCQKIC3eIl4LlntdvkC4e
         0PRfPj8CiC5TLFB6TZueWjfDuvsyLk92Kq3ZprDdbY0NIm817qdF22Fzr68hWAKIalQp
         p5oD79TXoe7EbQLJN+kYwjxOZGBlNSqn5v6ts6klf+gimgmXtxqLIgCmcq6huvDIPfnI
         7TkLVotGIWobXmVbiF/4mF4p/pTsdCT6nzNpVx++yXPQSIFJLOsU0S9PusHDe1Kn3Tf5
         hc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109255; x=1793714055;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZUO0/RrkqHsNpo8fK7tPpZvASb/BT+Zvsy0BqgEIsw=;
        b=ikUql22Tm1qAsJBfl0OQpMIhzM+J0Nk0Nv8q9erJS80pvTm/5DYHWHr+hbhbrViQVZ
         swxZmi590eUG0vOovdaB9F2wEvWIZeb3lM9s2kiedJPzAhX7z7ZvIo3fQew2RMK1yZAY
         1YgdzIXGT30BWuOAujQQ3Btmf0ePsRhtE68ZYukmPBCXJHm2RzMHkI5dMBu8LYWqJ2kx
         8rJ3xEeKQ3MeegioOEjaC0iEw0aDVmMDuhDSN3kvlKmLMoD7AxHG0SQ1kOL71joubcYz
         PtDV2tkxL2lTGsuYACUaSTY1bwS0zO7oGnN2fbKfmv7Y83Ji87vu2c4vmPq5PXrgC6UX
         w4Pw==
X-Forwarded-Encrypted: i=1; AKwUvBycN8i9qlooZn5MR1R4B+yYa0wh8PCVtVU0LFpM2L5y15+3qqaQppmyzXNLEmA+aNU87yc9iSwsUvnzx7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEkWCF0GAkmxr/FfeYvOYJbZ/L59TVDaYm6kLYvNF660drsi8N
	2u4xnq/+t/e0A4syZRFbzP60B/LPyjiNytIwo81Krwk/a2yxZDANLCcH
X-Gm-Gg: AYBFou0B9s8oNhqrw+sXQ1A38MWBsZmgydqCJeKKaKfU47SQZR+ei4jL6R6deV7HFqF
	trjMBjHvkSfAEvWdIdwiTN6mtEih3jnoGEPqUYQMjb7lge7G5SZt82Rm9WFfImdLU7Je7HJdNhG
	tNAr3DHe7KahtWAHKyy919B0UPPP3EzDf18NNIB96+GUZEvC8E222AQAh4q6sFQHylLt8VnUOq4
	kiZlSHIpq+l/+kB5kVuYYlUBo9+yGohtOC1o0iyFyZdt5MxA7WOufSeWVRcGX5DGeZT3xE10NtD
	AYsBYpcdzjWn60gOeoxcutJKBKV81D7QMG7OF81SzBq3itzlO5ktSuMlh/z/5vfDwt2b6SbEfLi
	S3Cz/teJGQimsJ1tF77XOHJpm7MzTc5Vkezc7C9JUrMf6EGDT806IDlO+EQPHDZkCW5hoDjAdTv
	19GONFxt7WMnvxgsD3QwjHa4acwxTssj/VYmYxTa30kRvWY0hiDVm21B2u/qHJbqE3mpKbJV5cU
	6pguWhIa5FlnSAUEdPdkhzsxn/ngEyM18nBMAa/1x/yiZCRrse8R4ZsokI7eL7M3Pg1aklLQOw/
	sAfdyW4=
X-Received: by 2002:a05:6000:41c3:b0:48e:3b48:6f1 with SMTP id ffacd0b85a97d-48e3eba6805mr18121353f8f.54.1793109255358;
        Tue, 27 Oct 2026 06:54:15 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:54:14 -0700 (PDT)
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
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>
Cc: Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
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
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 13/15] drm/client: splash: turn the BGRT image on panels mounted turned
Date: Tue, 27 Oct 2026 14:53:40 +0100
Message-Id: <20261027135342.2003632-14-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261027135342.2003632-1-maximpedraza@gmail.com>
References: <20261027135342.2003632-1-maximpedraza@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
 drivers/gpu/drm/clients/drm_splash.c | 70 +++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index 3f54bec87413..0bf9d969dd8f 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -412,11 +412,6 @@ static bool drm_splash_bgrt_available(struct drm_splash *splash)
 		return false;
 	}
 
-	if (efi_bgrt_status() & ACPI_BGRT_ORIENTATION_OFFSET) {
-		drm_dbg(client->dev, "splash: BGRT rotation bits set, skipping\n");
-		return false;
-	}
-
 	return true;
 }
 
@@ -449,6 +444,26 @@ static int drm_splash_bgrt_load(struct drm_splash *splash, const u8 **data,
 	return 0;
 }
 
+/*
+ * Since ACPI 6.2, bits 1-2 of the BGRT status say that the image is not
+ * pre-rotated for a panel mounted turned, and by how much it has to be
+ * turned to show upright on it: 0, 90, 180 or 270 degrees, which firmware
+ * and userspace (Plymouth) apply counter clockwise, as DRM counts them.
+ */
+static unsigned int drm_splash_bgrt_rotation(void)
+{
+	switch ((efi_bgrt_status() & ACPI_BGRT_ORIENTATION_OFFSET) >> 1) {
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
@@ -724,11 +739,21 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 	}
 
 	if (splash->src == DRM_SPLASH_SRC_BGRT) {
-		x_pad = efi_bgrt_image_offset_x();
-		y_pad = efi_bgrt_image_offset_y();
-
-		if (x_pad > scanout->width - bmp_width ||
-		    y_pad > scanout->height - bmp_height) {
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
+		unsigned int xo = efi_bgrt_image_offset_x();
+		unsigned int yo = efi_bgrt_image_offset_y();
+
+		if (xo > lw || bmp_width > lw - xo ||
+		    yo > lh || bmp_height > lh - yo) {
 			drm_err(client->dev, "splash: BGRT image would overflow\n");
 			return -EINVAL;
 		}
@@ -744,11 +769,30 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 		 * edge of the display, looking quite bad.
 		 */
 
-		if (x_pad != (scanout->width - bmp_width) / 2) {
+		if (xo != (lw - bmp_width) / 2) {
 			drm_err(client->dev, "splash: BGRT sanity check failed\n");
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
@@ -823,8 +867,10 @@ static enum drm_splash_source drm_splash_pick_source(struct drm_splash *splash)
 		return DRM_SPLASH_SRC_DT;
 	}
 
-	if (drm_splash_bgrt_available(splash))
+	if (drm_splash_bgrt_available(splash)) {
+		splash->rotation = drm_splash_bgrt_rotation();
 		return DRM_SPLASH_SRC_BGRT;
+	}
 
 	if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP))
 		return DRM_SPLASH_SRC_BMP;
-- 
2.39.5

