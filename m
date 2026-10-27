Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109251;
	b=zXr8uG2HC173e1ErfeT6YrBIDD5B9PuttJgwZ9Eg9yCz9cBS48hKR5jssa1CeNgcEaCf
	 VzWhA+ni68rai4O6xMfWYAF4icCiW9SIKiRKPA4qfpscUEpVa86ufFJiBs7ETnR346IY7
	 eTuKsBTBIZN/zp0W6YO7bmNsU8RYVMlVUlrMtq8TVevb8Xzjq2o8vUeO6qrwKXPPG/B9e
	 EDET5FT+zJROCDpkO+9Gr9FQ0Bmeh1UZeqM/rkRKmDWmB1J++PakOOgzoF2lXdeeVucfv
	 JQhf72CHWPUBBUoAb3UQZJC5W7oaEqpV+rciMErvgXP8+PsamwIZSe693UovMEqd5oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fU1UKpzBNuXU6ySePDsKYMB2Kq9NDiCM/53N3kd7ajQ=;
	b=EVh+uB4azIxSiUp14IGed59mDyDxe7hj33expcpqs96zgkVsB47TkWAbyL5K4Adw5U/c
	 2YnuwKyrdcTJ9sXshzPgbr4GiGzoatqSwCHVfY1TrbQRzyxw56TFtpYE3yTRNvFZBmhVa
	 s1hrUZpUFO3VqsNzyibDi/gOkZQxwM2jdVW0C9Z4xOFdLfynickE+6yp+Ye70nfX8Rj6w
	 x7FzDkKh3OSK9zFBGzp+Qvbd1X89N8v5Uc86UyE4Mq/KF+po9f1W3Hy3qoVub630ImmL0
	 5ffbX6eFYcjnw/rK07M509xSNrKuBJFzx+rhSKHgQL6Opc/HYjIl9noG4RFDF3TTI+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IqGU5Z+y;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEABD60A5BCC
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEABD60A5BCC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IqGU5Z+y
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so2496356f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109249; x=1793714049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fU1UKpzBNuXU6ySePDsKYMB2Kq9NDiCM/53N3kd7ajQ=;
        b=IqGU5Z+yI//Uf1f1InC3HbWaNBA9juMow4J6j21/IjLsy/OIkWb8l1dy+22F09jNzV
         pDR9l4AM1iB5b8gdMgCmA0McivtMFc6/ynrCQY5iULmmlvGkphtZuPZCoI6JVhhKEqpr
         Dg6sHWh0itWUOkLmnyLLremMAkJYHAFS3DgTLLk9/Ow9xQF2aPYwQB3ZcNOm9QJ5T/Rv
         rlGXXpvjjleJRsRRPJkYgVlQPOsMaNo8Jxb1RIA2rbddhAZpnELZLvMn5wkRBRDtEBMb
         +uugvAZLXOPIMdh37rUjulu/J+SLa8Lu5eURbtTL03+78xOqgArIfXFyBmKmKslt5eBh
         ANCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109249; x=1793714049;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fU1UKpzBNuXU6ySePDsKYMB2Kq9NDiCM/53N3kd7ajQ=;
        b=u7ayZCSwlUkvX5dcTKdZXjIe+Bf+xlP204WfOjr6eKqptEFFVJNb9E4IrOPnWdcvRm
         4M7l0R0TSx7ZJgitLq62VwqXQd6uNie/Ic2rIRTfXAYDo3qrhBwkFdGfthKsDQszDOq/
         lDjRO4BmBH4uxiGiLAA8oqz/KNfNJUQexmgvMSKj/dUiBzUCyCCzJgApmdjZPP/O+fzI
         hGkuLylp8bkRmtJigLerz00RzSH2kaJlpkIqo5j9V0DrR202aUNKeeFNwxJXelQhDeMT
         Cg1aGf1FJ+I35td6h41qVmTFpWnebt2FfRr7czTRY6EuW2c5Jk/Qh49fURkSi4riuDuS
         6gXg==
X-Forwarded-Encrypted: i=1; AKwUvBz2oNbgqRs3BspY5c2n1ez7dIXEIaiZrG9x4nP6ouaDo0+tfuWDu+h03opHERLxtUrdHGYaJ6f+MhJ3OnA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqaYeyV4FoAcC8vZQzl8a997dHNeVuf27YNpd/OdTajJCj8PT8
	mgICWnOKKZCFk8OMghrl8t4nv27T2ry1s67Zu1P2YgunTgKyXwXF4YoE
X-Gm-Gg: AYBFou110CTFzND3y/XONQC/5Kt+HL4hK/sTwCRVFBhbTtFfeMxhWVL4szowLeTlN+a
	rPOE2BBZztRlGUgUxSpJnGJknVGnC69/yTtYA1ulDBp5G8aAE52RsZ0kk1J99hRhHd7FjqcNmfF
	JWSALJQ1OTLMXEq6OgmsOKtFwLNZhXIHdxjESy5q0AR7FLNI+Hqc17wMKXwaQ1zjJI4LulWpSMB
	sg5XcWKyOmwtwni0Q/qnYY2zTTN1FBIuEUzex3P8dl2fxgK+M9+qZe8rGqsYTf6M30DJfXEgOCk
	FnQd5U7aGeT+T2OjVjYSsHHmiZ6zSr+bXtC65/jQMLNuauWdK/xaz4zkmOR7e9rJL3h02/Q5x7g
	LFWB6ZQb0DccvSyWkR124yB/96GyrIbbxD8Ca2u+VkOnDJdTRVTAbLtpgRvC12jFnVKNLWozjJN
	L+UxaKX+ix2C5w2VYYHUBqzaWMm3CL8eXPAjqQEVdBAmuGaryoyCm24ue5mxh2s5dbXBRF2RYUE
	wujfeig6nUI40Jyk/jCIUdx4DAbXY21BJt9N2Bx+2bZgaczenyxaTOEpWrWdmGVPRkuHG38RPyS
	OyATLnU=
X-Received: by 2002:adf:e186:0:b0:48d:eec5:d243 with SMTP id ffacd0b85a97d-48e3eb8b71emr19191940f8f.9.1793109249072;
        Tue, 27 Oct 2026 06:54:09 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:54:08 -0700 (PDT)
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
Subject: [PATCH v6 10/15] drm/client: splash: place the device tree image where it asks
Date: Tue, 27 Oct 2026 14:53:37 +0100
Message-Id: <20261027135342.2003632-11-maximpedraza@gmail.com>
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

A logo supplied by the device tree describes a particular product, and
where it lands on the panel matters: some panels only show part of the
mode, so the middle of the mode is not the middle of what the user
sees.

Read the optional "logo-position" and "logo-offset" properties of the
node. The position is the top left corner, with -1 on an axis meaning
centre on that axis, and the offset is added afterwards, which is the
only way to say "below the centre" when the device tree does not know
the image size, as with an image in a reserved region.

Both come straight from the device tree. A property that is not two
cells, or that is out of the binding's range, is reported and keeps its
default;
otherwise the sum is done in 64 bits and clamped, and a silly pair of
values lands the image against an edge rather than off the screen: the
blitters do not clip. Every other source keeps being centred, except
the BGRT, which keeps its own offsets.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/drm_splash.c | 82 ++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index 618c060f33d5..81070547390f 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -106,6 +106,14 @@ struct drm_splash {
 	size_t dt_len;
 
 	enum drm_splash_source src;
+
+	/*
+	 * Where the image goes, in screen pixels: a coordinate of -1 centres
+	 * it on that axis, and the offset is added afterwards. Only the device
+	 * tree asks for anything but the centre.
+	 */
+	s32 pos_x, pos_y;
+	s32 off_x, off_y;
 };
 
 static struct drm_splash *client_to_drm_splash(struct drm_client_dev *client)
@@ -238,6 +246,39 @@ static struct device_node *drm_splash_dt_node(struct drm_splash *splash)
 	return NULL;
 }
 
+/* An X and Y pair; anything but two cells from @min to @max is reported */
+static void drm_splash_dt_pair(struct drm_splash *splash,
+			       struct device_node *np, const char *name,
+			       s32 min, s32 max, s32 *x, s32 *y)
+{
+	u32 val[2];
+
+	if (!of_property_present(np, name))
+		return;
+
+	if (of_property_count_u32_elems(np, name) != 2 ||
+	    of_property_read_u32_array(np, name, val, 2) ||
+	    (s32)val[0] < min || (s32)val[0] > max ||
+	    (s32)val[1] < min || (s32)val[1] > max) {
+		drm_warn(splash->client.dev, "splash: %pOF: invalid %s\n",
+			 np, name);
+		return;
+	}
+
+	*x = val[0];
+	*y = val[1];
+}
+
+/* The optional placement properties of the node, read once */
+static void drm_splash_dt_placement(struct drm_splash *splash,
+				    struct device_node *np)
+{
+	drm_splash_dt_pair(splash, np, "logo-position", -1, 65535,
+			   &splash->pos_x, &splash->pos_y);
+	drm_splash_dt_pair(splash, np, "logo-offset", -65535, 65535,
+			   &splash->off_x, &splash->off_y);
+}
+
 /*
  * Find the image when the source is picked, and keep it for the outputs
  * plugged in later. A node whose image cannot be had leaves the other
@@ -307,6 +348,11 @@ static bool drm_splash_dt_open(struct drm_splash *splash)
 	return false;
 }
 
+static void drm_splash_dt_placement(struct drm_splash *splash,
+				    struct device_node *np)
+{
+}
+
 static int drm_splash_dt_load(struct drm_splash *splash,
 			      const u8 **data, size_t *size)
 {
@@ -428,6 +474,26 @@ static int drm_splash_fill_solid_color(struct drm_client_buffer *buffer,
 }
 
 #if IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT)
+/*
+ * Place the image along one axis of the screen. @pos is the coordinate asked
+ * for, or -1 to centre on that axis, and @off is added afterwards. Both may
+ * come from the device tree, so the sum is done wide enough not to wrap, and
+ * the result keeps the whole image on the screen: the blitters do not clip.
+ */
+static unsigned int drm_splash_place_axis(s32 pos, s32 off, unsigned int span,
+					  unsigned int size)
+{
+	s64 last = (s64)span - size;
+	s64 coord;
+
+	if (last <= 0)
+		return 0;
+
+	coord = pos == -1 ? last / 2 : pos;
+
+	return clamp_t(s64, coord + off, 0, last);
+}
+
 /* The rows of a 24 bpp BMP, bottom up or top down, upright in XRGB8888 */
 static void drm_splash_bmp_decode(u32 *dst, const u8 *src, unsigned int spitch,
 				  unsigned int width, unsigned int height,
@@ -595,9 +661,10 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 		}
 #endif
 	} else {
-		/* Center X and Y */
-		x_pad = (scanout->width - bmp_width) / 2;
-		y_pad = (scanout->height - bmp_height) / 2;
+		x_pad = drm_splash_place_axis(splash->pos_x, splash->off_x,
+					      scanout->width, bmp_width);
+		y_pad = drm_splash_place_axis(splash->pos_y, splash->off_y,
+					      scanout->height, bmp_height);
 	}
 
 	image_data = data + bitmap_offset;
@@ -659,8 +726,11 @@ static int drm_splash_image_load(struct drm_splash *splash, const u8 **img_data,
  */
 static enum drm_splash_source drm_splash_pick_source(struct drm_splash *splash)
 {
-	if (drm_splash_dt_open(splash))
+	if (drm_splash_dt_open(splash)) {
+		drm_splash_dt_placement(splash, splash->dt_np);
 		return DRM_SPLASH_SRC_DT;
+	}
+
 	if (drm_splash_bgrt_available(splash))
 		return DRM_SPLASH_SRC_BGRT;
 	if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP))
@@ -1114,6 +1184,10 @@ void drm_splash_register(struct drm_device *dev,
 	mutex_init(&splash->lock);
 	init_completion(&splash->fw_done);
 
+	/* Centred unless the image source asks otherwise */
+	splash->pos_x = -1;
+	splash->pos_y = -1;
+
 	if (format && format->num_planes == 1) {
 		splash->preferred_format = format->format;
 	} else {
-- 
2.39.5

