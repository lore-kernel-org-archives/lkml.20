Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794361055;
	b=yRiGjimKbIhfCj/5i8bDRaOpCG9BDSuBVeT7Q4/ERw20E9x5oF48FuhMcDhclRa6Mydd
	 uM2995ccCy0d+fLqNyhOIT7a4zrDNRyPMCsFI9CKg5Txq2UTdko4BDc1psoYMZ/2adiTm
	 ZEhvV5VMnZISNI9GPP4S8ywQqgau3C655YlMo4FiLvUOA6ukQFRwsHRFtf3JTPJA/Mu+q
	 eOYZXxI4/KnkJAj1shaqjia1hAg7cNwn+U6RjhSrU5f4RaEdNgY1xKBa7qCPmm2o4zFFx
	 +xNjg4ceplRW7V/ykDgDn20kR/9mk6HL6sHWC8NfBrSt2ZAaCOrXPDa53ZOqaczLxmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361055;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Vcp5eI8JJb1RnVVTP7/VW38KUPuSkqgudGy8DfnBQ6o=;
	b=sf5b4zjQOUBvlsEwUbwAsvEDS/upHAaLWAZara4S0u4L/YLu8A0MdTgkvfz94I1zXwB2
	 6kYraxgI3eZ/L5Jrr0NGN80sgj9d1MuxPet0qLwhekpOTCTPU9xCgapPA4DMIgQn9JToe
	 YmIzsa8V7PiItarEEYX/tegxQcwkQrPOGuEDdbnEV66SXaLkEhoKOFs5aUoIlrH1A6VcP
	 GWj83IHLESI/KaqeKJLEF/kwfaolXK08YxRO2BYGYDuDsoMYHFD9HrP49xedthhhfCj/h
	 AC3RACe/Ehk0MNv64UxM2Tmxyl2imnpsmY3hJ6N0Vd6XUwgWPrFsK3VjUVeicEBeVYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98B9606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C98B9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b2d14968c9so30294577b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:37:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794361054; x=1794965854;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vcp5eI8JJb1RnVVTP7/VW38KUPuSkqgudGy8DfnBQ6o=;
        b=IecfsQAwzdZVjUKusfHNDdm+y3dG7IPN5bMlEv/zzu/jsVBbQYb1WeEfC+zlbLuazk
         KW7sWYHKN9qiSvDsMVaaDCMhgsfNyXYXfGzlbmHW3mKyoY2xloq53rD8E72GXmL27j/v
         saAzIYzlBRVXcEvkYlINgOtc+muSe86xer6mUHqBCApcUwnfdt+wzzrDID+x8+pMdGtq
         dTcnIHi3SzuFeyf2073cr9OwVVGCx6SdjK8NFzwBS5nmsm7YRHB2W52B4NFuHOVDN5jz
         WxrTQiiPdq+LkSsooj6zzGjL9xEP0+egBzkgPBBSRrK1ollZc/YSFg2bqD6Dm6vp54uj
         AKcg==
X-Forwarded-Encrypted: i=1; AL+hErHiALCk2CWyCOErOQrqtb8XrWDt4Ntu4aROjJmhTX0H59iwms2I+MNR2z3q/tgw2LaxiNre78b/f/Nwn30=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ttnEE4Kd0BwjaePf+qD3PS/EQwWeuBqjKV6r7Td/8WsmSkD9a
	eKVZWemLZtezpFyVe8SLvDjvPekCYZE/uGsNS+4zFNQitT7c8sGou+zHM90iBIe4q4U=
X-Gm-Gg: AYBFou0cBT/TSa0XNfeNtKdb8u3ugF8R3afcmMZdC7iKI8J0KCWhNrKG5rZwAtbvLIw
	0NZRxbU2ZgFo3s21tSO+ttrF9yRQVPjbemcyLN/A+NzaIsJF1uNjrE1rAujwG145ZOz1jNmpA4t
	H7/pMg1ryPjBFpg/x3jSxvupqCuxMYqVQvahr7W3qrEKv/iI4CZ0jgZGzJifWyF4zk1u7ZAZh82
	nP/LJ/Odo60gx/VA48YLOBMm9weSmZOFX93PyPfDpQpxEBF3QPoGag2I8qpk+WVpkiuMyeIDP/s
	iEs7v8Z2GfWWeJPJaxY2rO3UImg3cd+LjIcZU1YBVxTGxrV+aP3Z1QI/gntQZBuVNJ+ytRjiWNL
	Utu+Xgb3lh7moUAWtJsJChRJo+KEzsGUQ85DiqaUC8OMjQHXfxMaFuriWDnAEp9G8uTmVmJi+aj
	HBJr+jf8rN9LJJQmURGgcxS/PAlPcFfB3GT2L3y7e/DrNC5v9ums8xaWPPv+Vwu1Ru7ZoxsNf9+
	kTl509duwQIhQjLfGxVZ1XI2SKO4/axM5afCWD9dPUAmWMa2wkFBUClezOe0B4BB3moppp2Jrk2
	xPEE04LZUSHA406XgHt1YMORRfXIc8AVm9TI+M0fRJFNW5G/e+CbY5H0D4L7sm64BRoPXHP9D1X
	Zky64OIkQByaGzgyhMA2owPEs6ibMM2OW1ivV5j6y+2Qi7+jmr6LOuLEhyJEHa5Z9Y3YJx9FGxg
	kfRUve3LFYIjKMm0kV56yuZjrC
X-Received: by 2002:a05:690c:82:b0:8b3:5eaf:29fc with SMTP id 00721157ae682-8b3a80632fcmr7901627b3.27.1794361053615;
        Tue, 10 Nov 2026 17:37:33 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39324ba4fsm33625677b3.4.2026.11.10.17.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:37:32 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Tue, 10 Nov 2026 20:37:11 -0500
Subject: [PATCH RFC] drm/sysfb: Copy damage outside the DIRTYFB ioctl
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-sysfb-dirtyfb-v1-1-8571d455ccbe@telaak.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MD3eLK4rQk3ZTMopJKIJ2UmpJoaJCWmGRmYKQE1FNQlJqWWQE2L1o
 pyM1ZKRYiWFyalJWaXAIySam2FgAGuYcydgAAAA==
X-Change-ID: 20261110-sysfb-dirtyfb-beda10fab602
To: Thomas Zimmermann <tzimmermann@suse.de>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

The sysfb drivers implement DIRTYFB with drm_atomic_helper_dirtyfb(),
which runs a blocking commit. The commit waits for the framebuffer's
fences, so the ioctl doesn't return until the GPU has finished
rendering into the framebuffer.

Xorg's modesetting driver calls DIRTYFB from its main thread after
every frame. When a separate GPU renders for a sysfb display, X then
blocks for as long as the GPU takes to render the client's frame. With
a game running, X took a median of 1.85 s to answer a pointer query.

Queue the damage instead and copy it from a worker. The worker still
waits for the fences, so nothing unfinished reaches the screen, and
damage that arrives while a copy is pending is merged into it.

With this change, X answers in a median of 23 ms and the game's frame
rate is unchanged.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
This is an RFC because I'm not sure DIRTYFB may return before the copy
is done. The fbdev emulation already defers its damage to a worker,
but userspace might rely on DIRTYFB being synchronous. If the approach
is fine, would you rather have it as a nonblocking mode of
drm_atomic_helper_dirtyfb() for all drivers instead of in sysfb?

I hit this on an Intel Atom CE5300 board, where simpledrm drives the
display and the SoC's PowerVR SGX545 GPU renders with a driver I'm
writing (not upstream yet). I haven't reproduced it with an upstream
GPU driver, but nothing in the stall is specific to the GPU.
---
 drivers/gpu/drm/sysfb/corebootdrm.c       |   3 +
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h  |  15 ++-
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 154 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/sysfb/efidrm.c            |   3 +
 drivers/gpu/drm/sysfb/ofdrm.c             |   3 +
 drivers/gpu/drm/sysfb/simpledrm.c         |   3 +
 drivers/gpu/drm/sysfb/vesadrm.c           |   3 +
 7 files changed, 183 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sysfb/corebootdrm.c b/drivers/gpu/drm/sysfb/corebootdrm.c
index 853da9a..4ca359b 100644
--- a/drivers/gpu/drm/sysfb/corebootdrm.c
+++ b/drivers/gpu/drm/sysfb/corebootdrm.c
@@ -206,6 +206,9 @@ static int corebootdrm_mode_config_init(struct corebootdrm_device *cdev,
 	int ret;
 
 	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
+	ret = drm_sysfb_damage_init(sysfb);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index 6dab27b..59c4064 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -5,6 +5,8 @@
 
 #include <linux/container_of.h>
 #include <linux/iosys-map.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
 
 #include <video/pixel_format.h>
 
@@ -81,6 +83,12 @@ struct drm_sysfb_device {
 
 	/* hardware-framebuffer kernel address */
 	struct iosys_map fb_addr;
+
+	/* damage from DIRTYFB, copied to the hardware framebuffer by damage_work */
+	spinlock_t damage_lock;
+	struct drm_framebuffer *damage_fb;
+	struct drm_rect damage;
+	struct work_struct damage_work;
 };
 
 static inline struct drm_sysfb_device *to_drm_sysfb_device(struct drm_device *dev)
@@ -203,8 +211,13 @@ int drm_sysfb_connector_helper_get_modes(struct drm_connector *connector);
  * Mode config
  */
 
+int drm_sysfb_damage_init(struct drm_sysfb_device *sysfb);
+struct drm_framebuffer *drm_sysfb_fb_create(struct drm_device *dev, struct drm_file *file,
+					    const struct drm_format_info *info,
+					    const struct drm_mode_fb_cmd2 *mode_cmd);
+
 #define DRM_SYSFB_MODE_CONFIG_FUNCS \
-	.fb_create = drm_gem_fb_create_with_dirty, \
+	.fb_create = drm_sysfb_fb_create, \
 	.atomic_check = drm_atomic_helper_check, \
 	.atomic_commit = drm_atomic_helper_commit
 
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
index 13df092..e77f0c0 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
@@ -12,6 +12,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_panic.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -612,3 +613,156 @@ int drm_sysfb_connector_helper_get_modes(struct drm_connector *connector)
 	return drm_connector_helper_get_modes_fixed(connector, &sysfb->fb_mode);
 }
 EXPORT_SYMBOL(drm_sysfb_connector_helper_get_modes);
+
+/*
+ * Damage
+ *
+ * DIRTYFB returns at once: the damage is merged into one pending rectangle,
+ * and a worker hands it to drm_atomic_helper_dirtyfb(). That commit waits for
+ * the framebuffer's fences, the GPU work that last rendered into it, before
+ * the CPU copies it to the hardware framebuffer. Done in the ioctl, the wait
+ * blocks the compositor for as long as that rendering takes. Damage that
+ * arrives while the worker runs is merged and copied by the next run, so none
+ * is dropped.
+ */
+
+static void drm_sysfb_damage_work(struct work_struct *work)
+{
+	struct drm_sysfb_device *sysfb = container_of(work, struct drm_sysfb_device,
+						      damage_work);
+	struct drm_framebuffer *fb;
+	struct drm_clip_rect clip;
+	int idx, ret;
+
+	spin_lock(&sysfb->damage_lock);
+	fb = sysfb->damage_fb;
+	sysfb->damage_fb = NULL;
+	clip.x1 = sysfb->damage.x1;
+	clip.y1 = sysfb->damage.y1;
+	clip.x2 = sysfb->damage.x2;
+	clip.y2 = sysfb->damage.y2;
+	spin_unlock(&sysfb->damage_lock);
+	if (!fb)
+		return;
+
+	if (drm_dev_enter(&sysfb->dev, &idx)) {
+		ret = drm_atomic_helper_dirtyfb(fb, NULL, 0, 0, &clip, 1);
+		if (ret)
+			drm_err_ratelimited(&sysfb->dev, "damage update failed: %d\n", ret);
+		drm_dev_exit(idx);
+	}
+	drm_framebuffer_put(fb);
+}
+
+static void drm_sysfb_damage_fini(struct drm_device *dev, void *arg)
+{
+	struct drm_sysfb_device *sysfb = arg;
+
+	cancel_work_sync(&sysfb->damage_work);
+	if (sysfb->damage_fb)
+		drm_framebuffer_put(sysfb->damage_fb);
+	sysfb->damage_fb = NULL;
+}
+
+/**
+ * drm_sysfb_damage_init - Set up deferred damage for a sysfb device
+ * @sysfb: the device
+ *
+ * Call after drmm_mode_config_init(). Framebuffers from drm_sysfb_fb_create()
+ * then copy their damage outside the DIRTYFB ioctl.
+ *
+ * Returns: 0 on success, or a negative errno.
+ */
+int drm_sysfb_damage_init(struct drm_sysfb_device *sysfb)
+{
+	spin_lock_init(&sysfb->damage_lock);
+	INIT_WORK(&sysfb->damage_work, drm_sysfb_damage_work);
+
+	return drmm_add_action_or_reset(&sysfb->dev, drm_sysfb_damage_fini, sysfb);
+}
+EXPORT_SYMBOL(drm_sysfb_damage_init);
+
+static void drm_sysfb_damage_bounds(struct drm_framebuffer *fb, unsigned int flags,
+				    const struct drm_clip_rect *clips, unsigned int num_clips,
+				    struct drm_rect *r)
+{
+	unsigned int inc = 1;
+
+	if (!clips || !num_clips) {
+		drm_rect_init(r, 0, 0, fb->width, fb->height);
+		return;
+	}
+	if (flags & DRM_MODE_FB_DIRTY_ANNOTATE_COPY) {
+		inc = 2;
+		num_clips /= 2;
+	}
+	drm_rect_init(r, clips->x1, clips->y1, clips->x2 - clips->x1, clips->y2 - clips->y1);
+	for (unsigned int i = 1; i < num_clips; i++) {
+		clips += inc;
+		r->x1 = min_t(int, r->x1, clips->x1);
+		r->y1 = min_t(int, r->y1, clips->y1);
+		r->x2 = max_t(int, r->x2, clips->x2);
+		r->y2 = max_t(int, r->y2, clips->y2);
+	}
+}
+
+static int drm_sysfb_fb_dirty(struct drm_framebuffer *fb, struct drm_file *file,
+			      unsigned int flags, unsigned int color,
+			      struct drm_clip_rect *clips, unsigned int num_clips)
+{
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(fb->dev);
+	struct drm_rect r;
+	bool queue = false;
+
+	drm_sysfb_damage_bounds(fb, flags, clips, num_clips, &r);
+
+	spin_lock(&sysfb->damage_lock);
+	/* Pending damage of another framebuffer is copied first. */
+	while (sysfb->damage_fb && sysfb->damage_fb != fb) {
+		spin_unlock(&sysfb->damage_lock);
+		flush_work(&sysfb->damage_work);
+		spin_lock(&sysfb->damage_lock);
+	}
+	if (!sysfb->damage_fb) {
+		drm_framebuffer_get(fb);
+		sysfb->damage_fb = fb;
+		sysfb->damage = r;
+		queue = true;
+	} else {
+		sysfb->damage.x1 = min(sysfb->damage.x1, r.x1);
+		sysfb->damage.y1 = min(sysfb->damage.y1, r.y1);
+		sysfb->damage.x2 = max(sysfb->damage.x2, r.x2);
+		sysfb->damage.y2 = max(sysfb->damage.y2, r.y2);
+	}
+	spin_unlock(&sysfb->damage_lock);
+
+	if (queue)
+		queue_work(system_dfl_wq, &sysfb->damage_work);
+	return 0;
+}
+
+static const struct drm_framebuffer_funcs drm_sysfb_fb_funcs = {
+	.destroy = drm_gem_fb_destroy,
+	.create_handle = drm_gem_fb_create_handle,
+	.dirty = drm_sysfb_fb_dirty,
+};
+
+/**
+ * drm_sysfb_fb_create - &drm_mode_config_funcs.fb_create for sysfb devices
+ * @dev: the device
+ * @file: the DRM file of the caller
+ * @info: the pixel format
+ * @mode_cmd: the framebuffer from userspace
+ *
+ * Like drm_gem_fb_create_with_dirty(), but the framebuffer's damage is copied
+ * outside the DIRTYFB ioctl (drm_sysfb_damage_init()).
+ *
+ * Returns: the framebuffer, or an ERR_PTR() on failure.
+ */
+struct drm_framebuffer *drm_sysfb_fb_create(struct drm_device *dev, struct drm_file *file,
+					    const struct drm_format_info *info,
+					    const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	return drm_gem_fb_create_with_funcs(dev, file, info, mode_cmd, &drm_sysfb_fb_funcs);
+}
+EXPORT_SYMBOL(drm_sysfb_fb_create);
diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
index 8b19f43..0ef093a 100644
--- a/drivers/gpu/drm/sysfb/efidrm.c
+++ b/drivers/gpu/drm/sysfb/efidrm.c
@@ -299,6 +299,9 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
 	 */
 
 	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ERR_PTR(ret);
+	ret = drm_sysfb_damage_init(sysfb);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
index c412555..4d31bb6 100644
--- a/drivers/gpu/drm/sysfb/ofdrm.c
+++ b/drivers/gpu/drm/sysfb/ofdrm.c
@@ -1021,6 +1021,9 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	 */
 
 	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ERR_PTR(ret);
+	ret = drm_sysfb_damage_init(sysfb);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index deaeb7d..c40a6c5 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -813,6 +813,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	 */
 
 	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ERR_PTR(ret);
+	ret = drm_sysfb_damage_init(sysfb);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index 1668aab..812db4a 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -539,6 +539,9 @@ static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
 	 */
 
 	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ERR_PTR(ret);
+	ret = drm_sysfb_damage_init(sysfb);
 	if (ret)
 		return ERR_PTR(ret);
 

---
base-commit: 41b5458595c60143d0ebaa1e032c9cda5d764dff
change-id: 20261110-sysfb-dirtyfb-beda10fab602

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>

