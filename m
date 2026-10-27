Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109255;
	b=xV5Ubk49Qwa2BGing+/bm7uGuOAbK2PcEptIsHEk9G3TiKiJ2Et8TOUgRXyvssxkDvzO
	 vWx2kvdxqPQLM7Zaqk30lmPpZjaob6880p06cplhDyry0/nDIbdhW5hfAwNex093eLDG1
	 B1NyHv/k9Axm8g2W7k1iZUhu58DACCD/uiDFFkypD1f6ua5uvxZ3PqFM+3XlQsTvlX7jT
	 a4azlHbPRNgI6V8ZcwKNpoD6hWJopOsjKPhgYKPMn7x1b3JPjsv+LZPb8Hdq0mtsr5TQ8
	 aaaWt461YVT+eDI5niSsU4v24Zu/oI9FXwey6W0Nc4PmdSy6vK5jLbhp+vTdCzKY/3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IMpToc8GUbpePaS/6DB+RjKW/EgdDLHWVJxbsQxIDG0=;
	b=gtzlVf1cxnM8JaUDNIDR2dSlCjAj9ae7YW8dxcCQfoE/SkYUPJuh2C96rDxx+vt+0qts
	 0Mu1JKKgXrOyyiFqDiGYJEWwqEv702adD7LGxmLorfsHgYQ2SUnATebohf4yRhV8Dqmn2
	 QWNBLpGsbmW3dUhaaa132+cjzGnuDKKuu1KtbfPEIKKINHnNj/KCFFGko4/OJMGhNPZRt
	 ugjh8ZWQ7XYa2Ddwtik2ScbeU/jRDSGWIVGHMDPLfEBjMXDCA585qFKj3g4HVvzDSWHbs
	 bA5COKxR/QzT+JvYFYFotfUOnWmxSm0O2QWgXyr3N4E7qBGjK0QHEb/HR3sD3p351gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g/a7IWIa";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E674D60A6F6E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E674D60A6F6E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g/a7IWIa
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so23974255e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793109253; x=1793714053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IMpToc8GUbpePaS/6DB+RjKW/EgdDLHWVJxbsQxIDG0=;
        b=g/a7IWIaUlEuSLjlKCX3yHtkNeiiQRYTYC7D+Ng/EVl+KLbalqyl0FWv3PYFslZoTG
         gxcPx5MgXBZ0dLO3ijTzxRBFJbYKZ5tH6xPFppXm3HxeBSKp2IWn5SCmfsITujGEwRys
         7ED1ebhpbyji3P3TwrMKmTM34oZpTtQjaGxz9P0AIoeD84Ey6f8Pjx5EVIw1CxqPmpZU
         ATheQqGg/LdVvlAeGd6R+gR7jC7ZPsU1P/1xYvgk2s3AGyFeHCoMUCPzJXdIzWu5UisU
         PnblmJybqTSP3uR2ERfR6e5AGqsA/G0Yv3fFwtdu2dzENDoOW2+sSD7rCsvx7bR8k+Ii
         GkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109253; x=1793714053;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMpToc8GUbpePaS/6DB+RjKW/EgdDLHWVJxbsQxIDG0=;
        b=l80UZRGSObBMVM9+5Ks06qnO2/8dd5scpROFRrpOMDXnC2iB97UafMvgLXegw1Bsjy
         cgLgHPbra+D6eLjOgWCKKfShv6fusaQ+JOCetf0uoQ323WRgPDy4jVAvzHlCywItwyp4
         4M7sSTJ+9HN+qz6BCf/SBvbzdS2o3p2/Q/YWFEF/B/GlEOGNiX4VJ6naGul2DdJ4nWVU
         S4GNOvcqTXEoxdGlXLR1lxnukv+sNyIr6Sec4xFUUfDDUo3np3SRQRtk/vbjTpKauupj
         x/td2kxm4MJM9cyQiYQX354WBVAjYSCaZ+eW0WMkuZQ5JbFv6HTOw9QGusCFQyRIus0P
         Xr+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxBpZmNj3v7GH/iSxz9bzc+stM6svo/BMaQvTZ0DhUfZHWfADuQ8GouCT2HvTaqNVLgNaWeH5LH2D8JeZ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhdjcBknpN/1a0y30GrLoeKSigzQMwJ20PT7YgMn+rhVC5Edfk
	uEd0YrgJp/yytR3zOHgUB5aan9jyBqtVXfRVy++Kn7l56OfWQ6TwQkWa
X-Gm-Gg: AYBFou1Ldyi+THiJk/rTaOrlRkVfU9JebtfIBhL9D0sd82oEIpgMMgEtpCiMtk9F4HM
	0u9t0bn/4gR8Njv2d8GOFAJ2xwoYqF/NeOAtASBTNN70xJcSwsP0K5bF9XVfcSU9zNS2xxOH/BV
	uIVw0Ey5ECHT/Snb+uRWTNF1Dji0nsSKEDnnUhB8/MpGJuFPRBwHJcOlXoiwxf9U/4xS9r0jIk4
	6Gs17SZLqo6dttjxzgOi4uzVNUmK3i/fLuUXmFb8Uz88OD/olVweyk/ShchTthnnqIok9f3aG0O
	2w42jVLk3So/IAkr2UEQbcmOjQdJO0BETcsPLCwEDihhr/SBxm3myNfYcGmoIISwtbt+5z/SuIn
	xQVHKBYl34iJ9xgrUCcQt/fxmPOB2ss8UqvXuGx6hy7E9oYKuDG6lRcJgbrn15ssAFegXfIXYWL
	ZFtjQdgNieivv4EI1MTPLROFIs1gfNlc7dFEdxcoH1VQvGBQ6U0qG71y7vHSauGdPrEX1bs9gn7
	bawCEjgW54kEIx+62Fiku7QHvcbJkVQFoVWwLaOAeHJAi8oupCnGSxzQ1r8QA+HA19OVUz3H3Cm
	R/fvbLo=
X-Received: by 2002:a05:600c:6219:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4a35ac80a9emr181345205e9.6.1793109253262;
        Tue, 27 Oct 2026 06:54:13 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:54:12 -0700 (PDT)
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
Subject: [PATCH v6 12/15] drm/client: splash: take the background colour from the image source
Date: Tue, 27 Oct 2026 14:53:39 +0100
Message-Id: <20261027135342.2003632-13-maximpedraza@gmail.com>
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

A logo designed for a light background looks wrong framed in black, and
products that share a board support package differ in their colours as
much as in their logos. The background colour belongs with the image,
so a device tree image takes it from the optional "background-color" of
its node. A value that is not one cell of RGB888 is reported and left
out.

CONFIG_DRM_CLIENT_SPLASH_BACKGROUND_COLOR remains the colour wherever
the source says nothing, as with the BGRT, which carries no colour, and
the BMP loaded as firmware.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/Kconfig      |  3 ++-
 drivers/gpu/drm/clients/drm_splash.c | 33 +++++++++++++++++++++-------
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
index 172781bbc2d7..bb5fe5019756 100644
--- a/drivers/gpu/drm/clients/Kconfig
+++ b/drivers/gpu/drm/clients/Kconfig
@@ -104,7 +104,8 @@ config DRM_CLIENT_SPLASH_BACKGROUND_COLOR
 	default 0x000000
 	range 0x000000 0xffffff
 	help
-	  The splash background color, in RGB888 format.
+	  The splash background color, in RGB888 format, unless the image
+	  source has its own: a device tree image can carry its color.
 
 config DRM_CLIENT_SPLASH_SRC_DT
 	bool "Device tree as splash source"
diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index a50036155763..3f54bec87413 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -117,6 +117,8 @@ struct drm_splash {
 	s32 off_x, off_y;
 	/* One of DRM_MODE_ROTATE_*: turns the image, not the screen */
 	unsigned int rotation;
+	/* RGB888, from the image source or the kernel's default */
+	u32 bg_color;
 };
 
 static struct drm_splash *client_to_drm_splash(struct drm_client_dev *client)
@@ -272,12 +274,23 @@ static void drm_splash_dt_pair(struct drm_splash *splash,
 	*y = val[1];
 }
 
-/* The optional placement properties of the node, read once */
-static void drm_splash_dt_placement(struct drm_splash *splash,
-				    struct device_node *np)
+/* The optional properties of the node, read once */
+static void drm_splash_dt_props(struct drm_splash *splash,
+				struct device_node *np)
 {
 	u32 val;
 
+	/* The colour travels with the image; a bad one is reported */
+	if (of_property_present(np, "background-color")) {
+		if (of_property_count_u32_elems(np, "background-color") != 1 ||
+		    of_property_read_u32(np, "background-color", &val) ||
+		    val > 0xffffff)
+			drm_warn(splash->client.dev, "splash: %pOF: invalid %s\n",
+				 np, "background-color");
+		else
+			splash->bg_color = val;
+	}
+
 	drm_splash_dt_pair(splash, np, "logo-position", -1, 65535,
 			   &splash->pos_x, &splash->pos_y);
 	drm_splash_dt_pair(splash, np, "logo-offset", -65535, 65535,
@@ -375,8 +388,8 @@ static bool drm_splash_dt_open(struct drm_splash *splash)
 	return false;
 }
 
-static void drm_splash_dt_placement(struct drm_splash *splash,
-				    struct device_node *np)
+static void drm_splash_dt_props(struct drm_splash *splash,
+				struct device_node *np)
 {
 }
 
@@ -802,13 +815,17 @@ static int drm_splash_image_load(struct drm_splash *splash, const u8 **img_data,
  */
 static enum drm_splash_source drm_splash_pick_source(struct drm_splash *splash)
 {
+	/* Unless the source says otherwise, the kernel's default colour */
+	splash->bg_color = CONFIG_DRM_CLIENT_SPLASH_BACKGROUND_COLOR;
+
 	if (drm_splash_dt_open(splash)) {
-		drm_splash_dt_placement(splash, splash->dt_np);
+		drm_splash_dt_props(splash, splash->dt_np);
 		return DRM_SPLASH_SRC_DT;
 	}
 
 	if (drm_splash_bgrt_available(splash))
 		return DRM_SPLASH_SRC_BGRT;
+
 	if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP))
 		return DRM_SPLASH_SRC_BMP;
 
@@ -875,8 +892,8 @@ static void drm_splash_work(struct work_struct *work)
 			continue;
 
 		if (!scanout->bg_drawn) {
-			u32 rgb = CONFIG_DRM_CLIENT_SPLASH_BACKGROUND_COLOR;
-			u32 color = drm_draw_color_from_xrgb8888(rgb, scanout->format);
+			u32 color = drm_draw_color_from_xrgb8888(splash->bg_color,
+								 scanout->format);
 
 			/* Only success marks it done: a later pass retries */
 			ret = drm_splash_fill_solid_color(scanout->buffer, color);
-- 
2.39.5

