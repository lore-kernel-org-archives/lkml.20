Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407558;
	b=a8FgWFKU4JsW8Qua/griwjgRIJB9f8saxJ1A+hauJAWlv/uOe9SzyDKYBXAGvEKofAUU
	 fnxTGelrK+aq60LAg90WTSfjFgxokdO4k/zrLvvdvCFFuiqtSV+xdI95+oNbgzZ8Atp1k
	 wmybET/xhXFft2CcWAEUT/TboWAxeZUIzlBFtgws0UaY8VQm/RHNvemHLwmXAKybU3qwz
	 8I4IByxrBs4BsLkj+ondDV7r6jlq6HHqBTYZLnsdmniXG5rmj61NElavBM7fCmwupz9J/
	 OfLGjyR0v+/obW79dcwMiz+uStjDOD6AqKn0CZljUzAGef8Du+TzTi8BBtNsSyQUcRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=u2q57S1P8aLiRzndP7EZ4yhSSjdu/KIimRft1ZX+f7s=;
	b=BviAaaXJZAbzjzV6J/CeUm9ildJdkDQO7OiK1NbfDxd9AOtbTQITvbYM9DrJOVfs+XO8
	 WpRvi6c9IPg/ulOnWFp8bhvfIK0JIi1rGjVIVx345BUvuwEjwrW03MDlV6HH7rbwQNce1
	 kv78kwpG2/20evD5wp6WPzpVdEAN2cJvg5BEMt6eGTaMuOjKtjA1tp2iMLSxI5v2Y4JK1
	 naxW6L1cq5I10GzWnHMqppZCrwXPjkGNkgcEwjPY5G/V7Xb129pv2N5qycnc6KtV8JaRi
	 c2fZYD07djHI7TWcVVk4qOIrzQ8Nk7BR4Xxmes8DP+kVczO47ETgdQmxeA2VBmnrVhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGESD6D3;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF15F606A885
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF15F606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGESD6D3
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so20796585e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794407556; x=1795012356; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u2q57S1P8aLiRzndP7EZ4yhSSjdu/KIimRft1ZX+f7s=;
        b=kGESD6D3K5rNLXktY3XUbrN1LELRYhOLI4vtgb5J7UqgZe0eKNJEgP2mDmH6uZwK4M
         BiMOTHlZZFFXe7cRhCG/KhCN54/JGd74gxJ+L5CMq5ylf4bpJ1Ijo/m9EMproX0MAJUA
         oie3qUbyQtSjde5Xjhq+ynB8rT4dJLGTqfWWYdB5tqgfz9TUu49i+6lXtIFYUrSNI0Ep
         kpTVnATgKS82Rl+dbR55im460UtSO+ZxZ7SB6TcT0x8OPcyk7ALN/OxIhAqdSxiZV6cL
         Wp0eTR1aA1mPfEh/jXBJvI2fJPFySod8Ep5/eO1Li/ObLtx1AvqPHmFgdBaprWsjrRhg
         nz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407556; x=1795012356;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u2q57S1P8aLiRzndP7EZ4yhSSjdu/KIimRft1ZX+f7s=;
        b=1LnHRDeNlBGNEdy28XrGmznwalHc1q8Y/f1/s0Vn75EtPXuaxjw3aaoGtViY2oHA3m
         emWRLog4NJ0LVRmZMg0rLF6slm+hgoDFr6ZVCrdo6iAP76zzRlj4jFnt26sjq9zjC/hj
         UL/Gzatcyu/qIk7vzXNmC9S4H+t2/xJN4wZkayJw7yzy31bxYng+v5wLunLRe7L13xQX
         BF6b4hhX2+Vxmf299OxJ0fpquvsKbu7cTWsW2oHI33L3ktMldvjzzWKbHLMrvm49ixMU
         3LsRfAeGGh7t00FCHsC1OauE6JyKElSNzdA1s7W4zXd02BdS7EvcG/Z30yvGwuScKi29
         rFxw==
X-Forwarded-Encrypted: i=1; AL+hErG62XG8qKB8xhXPRcZlFbEGub3TP5GXMCfjXARFPo+/bY8KJP56tHga5MYGUdn4eRJrhO+AOnzwuiXL6QE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q92kiDelksE7uAhGhJLArsdNWqxyoYgX+YmqLPF3wcEOPviPT
	f3ODvH8A/EnzkTvqLcjTYxhy89TO7fS7azk6tv4VAPT37fQJC7Fr+50k
X-Gm-Gg: AYBFou00qwFIhbJZMBV2yc6Mld1Y3CNXJZ0BlnTPaFjhEwc1zl0qlUSUhCfAMEKxqiS
	ktDPhCJcVdM7vBshPtW3+8jGLsjpzaajKabVK6asyrIB/MYO2V5YPjTlcMHFcGbx1oR+lbBfGRZ
	d3PMsryeeyZpXQh1siJD098h23ECoGhmi5VPJ33SxAfRwfZD9/L1iZKx2E0s5FLqWWAL33jcDFq
	bCxsVVQ6VoZDdXebVdNjgIECwVHiYEfEJrtbkJQQ6x9THfA7sthY650YgXK4lENZ99J9Vl0eFki
	eRa3MwAE/rwjanBOX6yFuGReg5kSMFnho39q6ZCAAYoi8mPmYXvi78SoiKP0vS4Owx+aU8wJNl2
	hr8oVVnlAh0GMEIc9j+HX4DaM4i9qKBQWwqDVrEA7Fk1giRXNEUq+GGRxpOk2lbn/Dd9IVbQltJ
	S4dmxHwVJxiGxpxssiqPohn/X2iY3Jdebj9rZda9N5dVqnD/ynRcWQQjzm2gB8XKy74HyyUr5re
	t8GjiA6EJOpzMH7/ijfEa6NOVZ+8874dBfIvGQi5V5kfvO6EdszM5kM0hyKz69DiLJIYDODRFgW
	BQydJJfTPUPsNwHU0pxcH8U7lrdBbECJjClOB4th8KuXQrQ5XnANcbQIhxzYrUs=
X-Received: by 2002:a05:600c:1d1d:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ba09365d6fmr46922765e9.18.1794407555956;
        Wed, 11 Nov 2026 06:32:35 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e423dfsm62256485e9.1.2026.11.11.06.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:32:35 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Wed, 11 Nov 2026 14:32:24 +0000
Subject: [PATCH] drm/vkms: use a bitmask instead of a bool for composer
 users
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
Message-Id: <20261111-composer-v1-1-9d5fa94656f8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QpAQBBFf0XzbGt3axW/Ig+MwShWu0hp/93gv
 p2659wQKTBFqLIbAp0c2a8CJs8Ap3YdSXEvDFbbwsgU+mXzIinEsrDaGddhD3LfAg18fam6+Tk
 e3Uy4vz6k9ABvGo/TbAAAAA==
X-Change-ID: 20261111-composer-cc9620515bcd
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Oarora Etimis <oaroraetimis@gmail.com>
X-Mailer: b4 0.15.2

The composer has a single on/off switch, shared by the CRC reader and the
writeback job, and no record of who needs it. Either of them turns it off
for both:

  - with CRC being captured, cleaning up a writeback job stops the CRC
    entries;
  - with a writeback job pending, closing the CRC source leaves the frame
    uncomposed and its out-fence never signalled.

Replace the switch with a bitmask holding one bit per user, so a user only
clears its own bit and the composer stays active while any bit is set. The
vblank reference follows the bitmask: taken when it becomes non-zero and
dropped when it becomes zero again. vkms_set_composer() becomes
vkms_composer_get() and vkms_composer_put().

Fixes: dbd9d80c1b2e ("drm/vkms: Add support for writeback")

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
- Why not use a refcount? Because there are only a few users, and a bit
  per user shows the working state of each one. A repeated put() from the
  same user does nothing, and it also helps future work that makes the
  vblank timeout synchronous.

- Tested with vng: read crc/data and submitted three writeback jobs with a
  small libdrm helper. The entries kept coming at the full rate of the
  1024x768@60 mode, 235 to 237 of them over the 3.97 s the three jobs
  took, where the current code stops at five.
---
 Documentation/gpu/vkms.rst            |  5 -----
 drivers/gpu/drm/vkms/vkms_composer.c  | 34 ++++++++++++++++++++++++++--------
 drivers/gpu/drm/vkms/vkms_crtc.c      |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h       | 27 +++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_writeback.c |  4 ++--
 5 files changed, 52 insertions(+), 20 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 1e79e62a6bc4..fe7dc8def44a 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -246,11 +246,6 @@ module through configfs. Use/Test-cases:
 Writeback support
 -----------------
 
-- The writeback and CRC capture operations share the use of composer_enabled
-  boolean to ensure vblanks. Probably, when these operations work together,
-  composer_enabled needs to refcounting the composer state to proper work.
-  [Good to get started]
-
 - Add support for cloned writeback outputs and related test cases using a
   cloned output in the IGT kms_writeback.
 
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 0fc915a954ba..59f1dd50b5bd 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -711,19 +711,34 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
 	return 0;
 }
 
-void vkms_set_composer(struct vkms_output *out, bool enabled)
+void vkms_composer_get(struct vkms_output *out, u8 user)
 {
-	bool old_enabled;
+	bool was_enabled;
 
-	if (enabled)
-		drm_crtc_vblank_get(&out->crtc);
+	if (drm_crtc_vblank_get(&out->crtc))
+		return;
+
+	spin_lock_irq(&out->lock);
+	was_enabled = out->composer_users;
+	out->composer_users |= user;
+	spin_unlock_irq(&out->lock);
+
+	/* Another user already holds the reference for the composer. */
+	if (was_enabled)
+		drm_crtc_vblank_put(&out->crtc);
+}
+
+void vkms_composer_put(struct vkms_output *out, u8 user)
+{
+	bool was_set, enabled;
 
 	spin_lock_irq(&out->lock);
-	old_enabled = out->composer_enabled;
-	out->composer_enabled = enabled;
+	was_set = out->composer_users & user;
+	out->composer_users &= ~user;
+	enabled = out->composer_users;
 	spin_unlock_irq(&out->lock);
 
-	if (old_enabled)
+	if (was_set && !enabled)
 		drm_crtc_vblank_put(&out->crtc);
 }
 
@@ -735,7 +750,10 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
 	ret = vkms_crc_parse_source(src_name, &enabled);
 
-	vkms_set_composer(out, enabled);
+	if (enabled)
+		vkms_composer_get(out, VKMS_COMPOSER_CRC);
+	else
+		vkms_composer_put(out, VKMS_COMPOSER_CRC);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index fe17f49305a9..4e15abfd92a0 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -29,7 +29,7 @@ static bool vkms_crtc_handle_vblank_timeout(struct drm_crtc *crtc)
 	state = output->composer_state;
 	spin_unlock(&output->lock);
 
-	if (state && output->composer_enabled) {
+	if (state && READ_ONCE(output->composer_users)) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);
 
 		/* update frame_start only if a queued vkms_composer_worker()
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index dea6cad3f1b9..c3bb3cd46863 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -27,6 +27,9 @@
 
 #define VKMS_LUT_SIZE 256
 
+#define VKMS_COMPOSER_CRC  (1U << 0)
+#define VKMS_COMPOSER_WB   (1U << 1)
+
 /**
  * struct vkms_frame_info - Structure to store the state of a frame
  *
@@ -210,8 +213,9 @@ struct vkms_crtc_state {
  *	       vblank timestamps
  * @composer_workq: Ordered workqueue for @composer_state.composer_work.
  * @lock: Lock used to protect concurrent access to the composer
- * @composer_enabled: Protected by @lock, true when the VKMS composer is active (crc needed or
- *		      writeback)
+ * @composer_users: Bitmask of the users that need the VKMS composer; the composer is only
+ *		    active when it is non-zero. Updated under @lock, and read with
+ *		    READ_ONCE() from the vblank timeout.
  * @composer_state: Protected by @lock, current state of this VKMS output
  * @composer_lock: Lock used internally to protect @composer_state members
  */
@@ -222,7 +226,7 @@ struct vkms_output {
 	struct workqueue_struct *composer_workq;
 	spinlock_t lock;
 
-	bool composer_enabled;
+	u8 composer_users;
 	struct vkms_crtc_state *composer_state;
 
 	spinlock_t composer_lock;
@@ -317,7 +321,22 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
-void vkms_set_composer(struct vkms_output *out, bool enabled);
+
+/**
+ * vkms_composer_get() - Enable the composer for a user
+ * @out: VKMS output
+ * @user: bit of the user that needs the composer (VKMS_COMPOSER_CRC or
+ *	  VKMS_COMPOSER_WB)
+ */
+void vkms_composer_get(struct vkms_output *out, u8 user);
+
+/**
+ * vkms_composer_put() - Disable the composer for a user
+ * @out: VKMS output
+ * @user: bit of the user that no longer needs the composer
+ */
+void vkms_composer_put(struct vkms_output *out, u8 user);
+
 void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 858df1f89f66..7e2f82e44b39 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -118,7 +118,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 
 	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
 
-	vkms_set_composer(vkms_output, false);
+	vkms_composer_put(vkms_output, VKMS_COMPOSER_WB);
 	kfree(vkmsjob);
 }
 
@@ -141,7 +141,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	if (!conn_state)
 		return;
 
-	vkms_set_composer(output, true);
+	vkms_composer_get(output, VKMS_COMPOSER_WB);
 
 	active_wb = conn_state->writeback_job->priv;
 	wb_frame_info = &active_wb->wb_frame_info;

---
base-commit: 1116f4aee916ca13d3e40ce87e67835f51576fcb
change-id: 20261111-composer-cc9620515bcd

Best regards,
--  
Oarora Etimis <oaroraetimis@gmail.com>

