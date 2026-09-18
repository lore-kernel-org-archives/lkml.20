Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FCF4FDE7F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741125; cv=none; b=Yp8kN1qtux8zt6PuqUd6BInatRS2bu9MGXxAiJ9UIOIY1DfB/s4OFCRzU1jj3Cqli6U+AR58YQMZvWXWfKxPXIuvyrUYyPxLCUMolcveLEAPpz4Y9GO97Q8RLl94FS/HCb1sGxQ7NIZboGLD8cFip+x6yWu+4df3TCL5HLVPDPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741125; c=relaxed/simple;
	bh=zzvBXbMjAwZ0/KZw8aDVlC4NQJFPbEgXUUSYv1Y+V+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhWjm8q2408g9xjUJO2Kp/uTnRsnYmE0fa9CysBavydpr0Ok+GPEscwGhCtTWhOcAlZvaeFR9iGX3xEPZ78wL73Lmg8hvieZ42Sh9F4pocxVxnD1uOmkmiqFTm8xtXJ92Sx9QxO6En1lk71Pit93QP/EEc6YfK45HofefAMcaoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0Q/fjcC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0Q/fjcC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBCA51F000FF;
	Fri, 18 Sep 2026 14:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789741123;
	bh=2CPTv1J842nMwHMWJhCqTkdcv33ReicjRMjhrF4Rc1c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=m0Q/fjcC3lE8AiM/bb756zMQY3UgKr7F8IMecHrcz/ss3pO5vEh8jlJBIiulPpyMv
	 ZiHXsyKiRmnQAaJVnHmTUIC1C7PDQvPxfWt1p4wJ1sIOGGm5cayvTyYpOCfnG4/IKD
	 fm/5fchWQ0pYf8zDe6v7/08RLQ2BgQfVh4AuSerff3DODlL5j2jEqNucEa9rzxujor
	 dEQ6+QgQ5GlbhjadxZZ7cpHV5VXnOnDz7tcgHfJ0t8zND9UPlYchhucOag3vjE7Gs7
	 5hu+5PN/3pQYJkmWufy/x0vsYcX6JgfMKLQAcX3Yzx0TZEB8kc6/NtQ0rmd00R7OuG
	 m/SXYZgRFL7HA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 18 Sep 2026 16:18:00 +0200
Subject: [PATCH v4 11/13] drm/atomic-uapi: Add DRM_MODE_ATOMIC_RESET flag
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-drm-reset-state-flag-v4-11-5ad106370f05@kernel.org>
References: <20260918-drm-reset-state-flag-v4-0-5ad106370f05@kernel.org>
In-Reply-To: <20260918-drm-reset-state-flag-v4-0-5ad106370f05@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Daniel Stone <daniels@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, 
 =?utf-8?q?Jonas_=C3=85dahl?= <jadahl@redhat.com>, 
 =?utf-8?q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Sebastian Wick <sebastian.wick@redhat.com>, Simon Ser <contact@emersion.fr>, 
 Victoria Brekenfeld <victoria@system76.com>, 
 Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6277; i=mripard@kernel.org;
 h=from:subject:message-id; bh=QxLmGr8FIlnpGqZI5c8vL0af5SOBJ665zMb2Fp0RHS0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlrPUQ2edwWjJ6laNyR+nX9PaFW5Si7np+Wi9ojZb7cc
 9J0+pvSMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACaS/5mxms18RfQnVX39b30b
 19+ri9U11tzddsWrqp57foDLyrT+lnPvc7nlVbfe1rsbvq+y4rEgY5110XYR2VdnXJ1WzH0dJtv
 F2ODUpPF01fsyvoXzfmwpO79E2tUosu6Ch+X8HXf/Gc2f/wMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

From: Sebastian Wick <sebastian.wick@redhat.com>

Userspace currently has no atomic way to reset all KMS object states
to their defaults. To bring a display pipeline to a known state, a
compositor must explicitly set every property on every object, which
requires tracking which properties exist and what their defaults are.

Introduce DRM_MODE_ATOMIC_RESET (0x0800) which, when passed to the
atomic ioctl, fills the commit with default states for all KMS
objects before applying the properties supplied in the request.
Properties not explicitly included in the commit remain at their
defaults (CRTCs inactive, planes disabled, connectors unbound, and
so on).

The flag cannot be combined with DRM_MODE_PAGE_FLIP_ASYNC, since a
full state reset is incompatible with an async flip.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
Co-developed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c      |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c | 18 ++++++++++++++++++
 drivers/gpu/drm/drm_ioctl.c       |  3 +++
 include/uapi/drm/drm.h            | 10 ++++++++++
 include/uapi/drm/drm_mode.h       | 14 +++++++++++++-
 5 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index b039edaa3271..0c5999695436 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1611,10 +1611,13 @@ EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
  * the current state.
  *
  * Color operations are not checked because they always use
  * drm_atomic_helper_colorop_create_state() and do not have a per-driver hook.
  *
+ * This is used to report the %DRM_CAP_ATOMIC_RESET capability to userspace,
+ * and as a precondition in drm_atomic_commit_fill_with_defaults().
+ *
  * Returns:
  * True if all objects implement atomic_create_state, false otherwise.
  */
 bool drm_atomic_implements_create_state(struct drm_device *dev)
 {
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 4acfb588c412..1cbd7f81a09b 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1664,10 +1664,17 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 		drm_dbg_atomic(dev,
 			       "commit failed: page-flip event requested with test-only commit\n");
 		return -EINVAL;
 	}
 
+	if ((arg->flags & DRM_MODE_ATOMIC_RESET) &&
+			(arg->flags & DRM_MODE_PAGE_FLIP_ASYNC)) {
+		drm_dbg_atomic(dev,
+			       "commit failed: reset cannot be combined with async flip\n");
+		return -EINVAL;
+	}
+
 	state = drm_atomic_commit_alloc(dev);
 	if (!state)
 		return -ENOMEM;
 
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
@@ -1679,10 +1686,21 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	copied_objs = 0;
 	copied_props = 0;
 	fence_state = NULL;
 	num_fences = 0;
 
+	if (arg->flags & DRM_MODE_ATOMIC_RESET) {
+		if (!drm_atomic_implements_create_state(dev)) {
+			ret = -EOPNOTSUPP;
+			goto out;
+		}
+
+		ret = drm_atomic_commit_fill_with_defaults(state);
+		if (ret)
+			goto out;
+	}
+
 	for (i = 0; i < arg->count_objs; i++) {
 		uint32_t obj_id, count_props;
 		struct drm_mode_object *obj;
 
 		if (get_user(obj_id, objs_ptr + copied_objs)) {
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 0dbf04d4aa9e..e589d93871e2 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -303,10 +303,13 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
 		break;
 	case DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP:
 		req->value = drm_core_check_feature(dev, DRIVER_ATOMIC) &&
 			     dev->mode_config.async_page_flip;
 		break;
+	case DRM_CAP_ATOMIC_RESET:
+		req->value = drm_atomic_implements_create_state(dev);
+		break;
 	default:
 		return -EINVAL;
 	}
 	return 0;
 }
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index bc7ef7684099..b6e2f2edd122 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -793,10 +793,20 @@ struct drm_gem_change_handle {
  * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC for atomic
  * commits.
  */
 #define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP	0x15
 
+/**
+ * DRM_CAP_ATOMIC_RESET
+ *
+ * If set to 1, the driver supports the &DRM_MODE_ATOMIC_RESET flag in
+ * &DRM_IOCTL_MODE_ATOMIC commits. When supported, userspace can pass that
+ * flag to reset all KMS object states to their defaults before applying
+ * property changes.
+ */
+#define DRM_CAP_ATOMIC_RESET	0x16
+
 /* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
 	__u64 capability;
 	__u64 value;
 };
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index ed1a660a3dfd..32eb3f650d7a 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1326,10 +1326,21 @@ struct drm_mode_destroy_dumb {
  * To the best of the driver's knowledge, visual artifacts are guaranteed to
  * not appear when this flag is not set. Some sinks might display visual
  * artifacts outside of the driver's control.
  */
 #define DRM_MODE_ATOMIC_ALLOW_MODESET 0x0400
+/**
+ * DRM_MODE_ATOMIC_RESET
+ *
+ * Reset all KMS object states (CRTCs, planes, connectors, color operations)
+ * to their default values before applying the properties in this commit.
+ * Properties not explicitly included in the commit will remain at their
+ * defaults (CRTCs inactive, planes disabled, connectors unbound, etc.).
+ *
+ * This flag cannot be combined with &DRM_MODE_PAGE_FLIP_ASYNC.
+ */
+#define DRM_MODE_ATOMIC_RESET 0x0800
 
 /**
  * DRM_MODE_ATOMIC_FLAGS
  *
  * Bitfield of flags accepted by the &DRM_IOCTL_MODE_ATOMIC IOCTL in
@@ -1338,11 +1349,12 @@ struct drm_mode_destroy_dumb {
 #define DRM_MODE_ATOMIC_FLAGS (\
 		DRM_MODE_PAGE_FLIP_EVENT |\
 		DRM_MODE_PAGE_FLIP_ASYNC |\
 		DRM_MODE_ATOMIC_TEST_ONLY |\
 		DRM_MODE_ATOMIC_NONBLOCK |\
-		DRM_MODE_ATOMIC_ALLOW_MODESET)
+		DRM_MODE_ATOMIC_ALLOW_MODESET |\
+		DRM_MODE_ATOMIC_RESET)
 
 struct drm_mode_atomic {
 	__u32 flags;
 	__u32 count_objs;
 	__u64 objs_ptr;

-- 
2.55.0

