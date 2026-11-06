Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977935;
	b=A8JAING3shLgbrK+hfhH8Xm7o1hb0gZoOV5Rm2BFMy9aCGokEGoOT5hqoRpYz1wWqGJs
	 1lh/8UOZh5RQvYZJqwRKPea2TzJvPlZZRWVaKJ7l6DHcbjzwtcZlZTlrsl9SuwRx8KpIW
	 z7yVs8chsIol5H59TGySBGWxU9wO6tMP7k/4sMKgf1BEHgiBlODXAFMHBcw5hFKZCsatR
	 VpAZ589WJmAIfFosvC83w5iE9uV40vtF3FJSV/Xijl3fYBJqLdI1onGrXBSQ92k+kq1tM
	 jOVRp/EDMFX95+GA2ZnfTnPY9uNLTWNEieAcd3SYU+FR6vM0sBzOA39DqO7ukRVICHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977935;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hYAhdRZ346GdySQVm8ErITnE75pewwTHH/p/a0LZ4bg=;
	b=3IL5ClC+1QnyiWdfdh7ubemewe/8E7Ix9spl4aTG2tCB3IQ0j0gAFsXEZ11VcyCQC72+
	 4MDtCqb2GOcNLHV7DCJT50W91zOnt4WFRxRsyvHV5uXAR5iyrR5jiuhUebytbMlDuXrIp
	 vEjoHlJNcUGrRuHaEBCMnuCEMkM48g4X+GuA941+z11nTQDb6LdIcY2DxR8ggVB+ZPLeV
	 ScZT3uc2JTXbNI+aMot8w/1VCVr1Yx99xhpcJ/amRNbuL4mJhJ0mmoF0sT666OLJ3s3AU
	 907s0X6CB9g4wTSlQPf0PKpICdHEiZmD/RC+7hfy3eRqUlbBWqYbNS6gbkFyaLavRcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gojR8o9V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F46C606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gojR8o9V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4681F008A7;
	Fri,  6 Nov 2026 15:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793977935;
	bh=hYAhdRZ346GdySQVm8ErITnE75pewwTHH/p/a0LZ4bg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gojR8o9Vz8rMHwL4OvOwqt3sWaBUwqynD/NYppvqBWwi6x+XQURLAms6v27+clPEF
	 dEZzTouUtrWd3UzjGSdIphjhX8Xs1jQKBRifobgu5U3mwDps9fAoX3F/BwsYvfXo9x
	 zT929y2H4Udpmi5PYq/k98oBuQz96LUOyx44K3U6ntM1OwJ8kTtd7X5s7LUtdtmlOk
	 qpSms9muW5kBwVYw1AiybVPKvsjXtYPEBuAvUkWlwEyn1N0GGy19e+h+fVpmTF6Bf0
	 FiqnEm9xQbSB71MYupQqw0yEPzm6a/TcwmkXF55qFIwYwVm8vNneRRdK8ljSE8cZ6A
	 UUg97AuJGk3Jw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 06 Nov 2026 16:11:45 +0100
Subject: [PATCH v8 7/7] drm/vkms: Add driver-specific plane property for
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
Message-Id: <20261106-drm-reset-state-flag-v8-7-50fd046b705f@kernel.org>
References: <20261106-drm-reset-state-flag-v8-0-50fd046b705f@kernel.org>
In-Reply-To: <20261106-drm-reset-state-flag-v8-0-50fd046b705f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5674; i=mripard@kernel.org;
 h=from:subject:message-id; bh=PzcuUCLqW+hrny0SdJ5K+Atc69gzwY7AsRho41Hd/pk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlv3xmxX09Zdm/LgvXxIVbyt020AzbZfBdg2fRm3rNG2
 fD74XMLO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEwtUZayXkYj5fmr37srG9
 x+uf3Q+8L16fXPolQrbTvGHx3OUp12v8u0qaQ9dxR791VfwwbZ6WN2PDmoIk2fLZL55p+N4uT9y
 z6kPEaf3cWVJfbsTvtS4xWXYz+qHxpmu31V1fx+zMv7Hhwo0AAA==
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
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vkms/vkms_drv.h   |  3 ++
 drivers/gpu/drm/vkms/vkms_plane.c | 63 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index dea6cad3f1b9..384616095b45 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -147,4 +147,5 @@ struct conversion_matrix {
  *		     struct vkms_plane_state must ensure that this pointer is valid
  * @conversion_matrix: matrix used for yuv formats to convert to rgb
+ * @vkms_test_do_not_use_value: driver-specific property for testing only
  */
 struct vkms_plane_state {
@@ -153,8 +154,10 @@ struct vkms_plane_state {
 	pixel_read_line_t pixel_read_line;
 	struct conversion_matrix conversion_matrix;
+	unsigned int vkms_test_do_not_use_value;
 };
 
 struct vkms_plane {
 	struct drm_plane base;
+	struct drm_property *vkms_test_do_not_use_property;
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index fd3d34dcf0fe..42513cb462ac 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -12,8 +12,12 @@
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
@@ -55,4 +59,5 @@ static struct drm_plane_state *
 vkms_plane_duplicate_state(struct drm_plane *plane)
 {
+	struct vkms_plane_state *old_state = to_vkms_plane_state(plane->state);
 	struct vkms_plane_state *vkms_state;
 
@@ -61,4 +66,6 @@ vkms_plane_duplicate_state(struct drm_plane *plane)
 		return NULL;
 
+	vkms_state->vkms_test_do_not_use_value = old_state->vkms_test_do_not_use_value;
+
 	__drm_gem_duplicate_shadow_plane_state(plane, &vkms_state->base);
 
@@ -86,5 +93,7 @@ static void vkms_plane_destroy_state(struct drm_plane *plane,
 static struct drm_plane_state *vkms_plane_create_state(struct drm_plane *plane)
 {
+	struct vkms_plane *vkms_plane = to_vkms_plane(plane);
 	struct vkms_plane_state *vkms_state;
+	u64 val;
 
 	vkms_state = kzalloc_obj(*vkms_state);
@@ -96,12 +105,51 @@ static struct drm_plane_state *vkms_plane_create_state(struct drm_plane *plane)
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
@@ -284,4 +332,15 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
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

-- 
2.55.0

