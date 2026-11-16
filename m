Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824277;
	b=h4iiWhh/UxE/gy5SdYq1StLuNMhbpRlKb98Xsbi0Hp2Fufo79+Tn3hK4yV/7tgyIs197
	 O8AJbsbASKfM0otyCs0gGbUEHsZCI8KPDd7WBEW9Yt5Bqzl3y1uA40j6LH0kZI0WR1ofM
	 hqhF+Y4bBP+vc88zHomi8NkRjWx8YNU6Y3nmqc10/DySKbQxEmpTPJdCphbNQY/QVjzV9
	 rspfFELDADPetmgBCzTV15gl+p3PjARrjF0aM+srXo6bSQ0ymAJH8AcIxZSx78wZ+2/In
	 LoshQ5X5tBPF/EW7OjCvRInaX+DaG/sGfd3SmS3fZ5GcjSi7u3S0Mdy/z9Qj/gFo6Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824277;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=F89nUrTgTW9xYZPBXI7Pqgf+VPI7MvQTdaidT4DpoCc=;
	b=ksXRWQtLZaeBw3JIEPnfc8QOd6KjYUzrg5IQbWP9Gnd/dCo8X/3F1LvZGswXg6TvTg/U
	 UkUuRXqodJHfDUUm7Lgxdxdi6QSM4W7bT4+N6Xvgu/yHob3VjYNlAR2qZgabOKbEgPnbg
	 GPi7nkL2o6H6/Rl9g62yEuK6qIRE5tI13AKqq8gcTWuk4LgU4hF47nnJ6LeHqQxXwyBWU
	 Z0mamyB6/1BzCaDz8mMUdtJLVsyHqmyeJqr0Z4JUOTgWQPpyWPvkyaOd7oIacC07090Jq
	 ZRSQ6mTF506qZneQnDYL/cAHBbijyWXs6QeJTEKOctPsyi5iekUHp18uSPtGfbHuOaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESXnhM7q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25C8606A88A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESXnhM7q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431131F000C9;
	Mon, 16 Nov 2026 10:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824276;
	bh=F89nUrTgTW9xYZPBXI7Pqgf+VPI7MvQTdaidT4DpoCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ESXnhM7qtgPl/L21Hn7XQPMcPZq2kxugK+1sPbsz/sw0wlFgq/Sf94ru04+lxLzXI
	 bPZU4Mzvj8jgfdTO/XY/8c41FP7Sbvg9l0Dr/eRfyZYcnyGz8ZlHOq7Ed/pkObjBy7
	 a2E8Rnz866X2Q6q0sc8aOuKF4IyKA+X0um0F8xnRHTjw8mi5wl5EduGnqSmhYqRS9H
	 AdwcODGFOHEbJRjXyNsBtUWFJbZFVB2VXNUVO6vCYF9jSNIEWyZ7Xax35rOYdxSGb4
	 QZ1QriOUBhX5K3MDNtyk6KmGLCbmWmSeVSpJaIhE3cnMqWBrQtMES9chPpYsWoZwv2
	 8lAVLOgHJSG/Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 16 Nov 2026 11:17:25 +0100
Subject: [PATCH v11 9/9] drm/vkms: Add driver-specific plane property for
 testing
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
Message-Id: <20261116-drm-reset-state-flag-v11-9-378b3f7bef32@kernel.org>
References: <20261116-drm-reset-state-flag-v11-0-378b3f7bef32@kernel.org>
In-Reply-To: <20261116-drm-reset-state-flag-v11-0-378b3f7bef32@kernel.org>
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
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Oarora Etimis <oaroraetimis@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6559; i=mripard@kernel.org;
 h=from:subject:message-id; bh=eTu/tROUGbzsr5SqVR3GDx6tDiau6kptF3sxrTjq01U=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm/bpgUqjIGPtOMY9jxaZFr5NSwX5ZqmpOXKx9nKsyfL
 SUWwdLXMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACbSKMpYH87zi1F9laXDvE8F
 vyO+ChxpZpO4ctCxJLh/VrYx/3F+lb+5rEmNSr8qVP8nf/r+1qOVsU5haQ3bvaNHDAoN9VcEvLY
 rXhBTx7JgG/+apYwTzM6uqy8WqH1qaW2UoNjysOM38womMwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The DRM_MODE_ATOMIC_RESET flag allows userspace to reset all object
states to their defaults before applying new property values. Testing
that this mechanism works correctly requires a property that the test
can set to a non-default value and then verify is properly reset.

Using a standard property for this is problematic: compositors like
Mutter enumerate and track all known properties, making it difficult
to isolate the reset behavior from the compositor's own property
management.

Add a "vkms-test-do-not-use-in-prod" range property to vkms planes.
The property is stored in vkms_plane_state, duplicated across state
copies, and initialized from its registered default in
atomic_create_state via drm_object_property_get_default_value().

Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vkms/vkms_drv.h   |  3 ++
 drivers/gpu/drm/vkms/vkms_plane.c | 63 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index dea6cad3f1b9..384616095b45 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -144,20 +144,23 @@ struct conversion_matrix {
  * @base: base plane state
  * @frame_info: data required for composing computation
  * @pixel_read_line: function to read a pixel line in this plane. The creator of a
  *		     struct vkms_plane_state must ensure that this pointer is valid
  * @conversion_matrix: matrix used for yuv formats to convert to rgb
+ * @vkms_test_do_not_use_value: driver-specific property for testing only
  */
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
 	struct vkms_frame_info frame_info;
 	pixel_read_line_t pixel_read_line;
 	struct conversion_matrix conversion_matrix;
+	unsigned int vkms_test_do_not_use_value;
 };
 
 struct vkms_plane {
 	struct drm_plane base;
+	struct drm_property *vkms_test_do_not_use_property;
 };
 
 struct vkms_color_lut {
 	struct drm_color_lut *base;
 	size_t lut_length;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index fd3d34dcf0fe..42513cb462ac 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -9,14 +9,18 @@
 #include <drm/drm_colorop.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_print.h>
+#include <drm/drm_property.h>
 
 #include "vkms_drv.h"
 #include "vkms_formats.h"
 
+#define to_vkms_plane(target) \
+	container_of_const(target, struct vkms_plane, base)
+
 static const u32 vkms_formats[] = {
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_BGRA8888,
 	DRM_FORMAT_RGBA8888,
@@ -52,16 +56,19 @@ static const u32 vkms_formats[] = {
 };
 
 static struct drm_plane_state *
 vkms_plane_duplicate_state(struct drm_plane *plane)
 {
+	struct vkms_plane_state *old_state = to_vkms_plane_state(plane->state);
 	struct vkms_plane_state *vkms_state;
 
 	vkms_state = kzalloc_obj(*vkms_state);
 	if (!vkms_state)
 		return NULL;
 
+	vkms_state->vkms_test_do_not_use_value = old_state->vkms_test_do_not_use_value;
+
 	__drm_gem_duplicate_shadow_plane_state(plane, &vkms_state->base);
 
 	return &vkms_state->base.base;
 }
 
@@ -83,28 +90,69 @@ static void vkms_plane_destroy_state(struct drm_plane *plane,
 	kfree(vkms_state);
 }
 
 static struct drm_plane_state *vkms_plane_create_state(struct drm_plane *plane)
 {
+	struct vkms_plane *vkms_plane = to_vkms_plane(plane);
 	struct vkms_plane_state *vkms_state;
+	u64 val;
 
 	vkms_state = kzalloc_obj(*vkms_state);
 	if (!vkms_state) {
 		DRM_ERROR("Cannot allocate vkms_plane_state\n");
 		return ERR_PTR(-ENOMEM);
 	}
 
 	__drm_gem_shadow_plane_state_init(plane, &vkms_state->base);
 
+	if (!drm_object_property_get_default_value(&plane->base,
+						   vkms_plane->vkms_test_do_not_use_property,
+						   &val))
+		vkms_state->vkms_test_do_not_use_value = val;
+
 	return &(&vkms_state->base)->base;
 }
 
+static int vkms_plane_atomic_set_property(struct drm_plane *plane,
+					  struct drm_plane_state *state,
+					  struct drm_property *property,
+					  uint64_t val)
+{
+	struct vkms_plane *vkms_plane = to_vkms_plane(plane);
+	struct vkms_plane_state *vkms_state = to_vkms_plane_state(state);
+
+	if (property == vkms_plane->vkms_test_do_not_use_property) {
+		vkms_state->vkms_test_do_not_use_value = val;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int vkms_plane_atomic_get_property(struct drm_plane *plane,
+					  const struct drm_plane_state *state,
+					  struct drm_property *property,
+					  uint64_t *val)
+{
+	const struct vkms_plane_state *vkms_state = to_vkms_plane_state(state);
+	const struct vkms_plane *vkms_plane = to_vkms_plane(plane);
+
+	if (property == vkms_plane->vkms_test_do_not_use_property) {
+		*val = vkms_state->vkms_test_do_not_use_value;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static const struct drm_plane_funcs vkms_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
-	.atomic_create_state = vkms_plane_create_state,
-	.atomic_duplicate_state = vkms_plane_duplicate_state,
+	.atomic_set_property	= vkms_plane_atomic_set_property,
+	.atomic_get_property	= vkms_plane_atomic_get_property,
+	.atomic_create_state	= vkms_plane_create_state,
+	.atomic_duplicate_state	= vkms_plane_duplicate_state,
 	.atomic_destroy_state	= vkms_plane_destroy_state,
 };
 
 static void vkms_plane_atomic_update(struct drm_plane *plane,
 				     struct drm_atomic_commit *state)
@@ -281,10 +329,21 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
 					  DRM_COLOR_YCBCR_BT601,
 					  DRM_COLOR_YCBCR_FULL_RANGE);
 
+	plane->vkms_test_do_not_use_property =
+		drm_property_create_range(dev, 0,
+					  "vkms-test-do-not-use-in-prod",
+					  0, U32_MAX);
+	if (!plane->vkms_test_do_not_use_property)
+		return ERR_PTR(-ENOMEM);
+
+	drm_object_attach_property(&plane->base.base,
+				   plane->vkms_test_do_not_use_property,
+				   0);
+
 	if (vkms_config_plane_get_default_pipeline(plane_cfg))
 		vkms_initialize_colorops(&plane->base);
 
 	return plane;
 }

-- 
2.56.1

