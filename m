Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677244;
	b=Gl0ZQYVcmRjR96NUkwggze6t7m+stjF0gMCz0ON77EFv/muYmD76sv++371zV4VZjZDu
	 N5buAPKDa3He5k4E2VPE742LoqzGV+3QSBn7WKmsfDguM/y+eC8FAvOvnlvOp6w9bC1Fr
	 5JpXHCw6giaXnEErsYo7+mJt1VJXO9d9gAvycBda7DbHdKdSHcSHhDUPkv8t8HbChQTPs
	 9JlXdXov6zg0YWDIqlYkc7x8K3MHCtKliDHr5VQEOwYbmv+B3lXhldfbDWThoxEcu23qD
	 66drG+JqXM+W4640LzTkhmmdjbGrVcqHXnNI4Oru+vjOUO9r+4VM2H7aN/udixYrp0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677244;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=o5gtiULA1NZC2U6J/Oa0bNCG28fMGm4tgbHrjXTYLYM=;
	b=KtnBG6KlM47Gf+pZwcbjBQ8dmW5K+96+YHy0Q0jbhiTBNGGA9498vPhkV2D7W1sLgquR
	 TSrfQkYGQF375eIVQ6cickfKo2H9YoB3+Py9ByBc7Z/GNJ90LLy1h9Rhxw8JyE40yqreI
	 e4UsZyq6LCwuDoNUF9Hcth8x5+Npv1ONc6dGYmRp+gHxqFii0ZV2X7Ofcbk8qpdtW8rsE
	 LuklnJ4sZotL64BktRnh/qdRttoPQ0jLgScfI7yJlGCf3d6h7xq4tNbBdHT2qC/BOF25i
	 1Nm/bGoL8ktnNRhWkbU0o/RRbbhXdfU2A3jMF/ibJ11bltnvKkm+LBX7ZkKd5v8KrEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NB8fDpfL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA674606A338
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NB8fDpfL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B551F000CB;
	Thu, 22 Oct 2026 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677243;
	bh=o5gtiULA1NZC2U6J/Oa0bNCG28fMGm4tgbHrjXTYLYM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NB8fDpfLm6vSFgEr73PdM9gvE0PAsHA2JSGW2F1Oj1iibLxPvjn5Jbv8MuLnkUYnV
	 +Dq3Fu06EGc1iKbixV3vIbEy7iCsUUPrEawZe3J3igEUr7mn8czH2C7+VoxyRPmb+0
	 QQUcLGRqc2oTABBqWOxpcxZSr+6gq3436j7aEtGQtamowY4JB59bFFs1itq19c/Lf/
	 l+PhyFmL4hoGBDVrY6P9myezIlwpjaAJInvXXgnCMqhm4gzaWo4iFz/49yNBvQ82bv
	 UgJ4RfsNF6I9AZ1e02DcamaI+drDxtBT3XG+ZgVqPzCl59KW5muHKL/uiyLNWgQzvk
	 jxaTJPvgu1xdw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 15:53:14 +0200
Subject: [PATCH v6 13/15] drm/atomic-uapi: Add DRM_MODE_ATOMIC_RESET flag
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
Message-Id: <20261022-drm-reset-state-flag-v6-13-f36d640b7e76@kernel.org>
References: <20261022-drm-reset-state-flag-v6-0-f36d640b7e76@kernel.org>
In-Reply-To: <20261022-drm-reset-state-flag-v6-0-f36d640b7e76@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5059; i=mripard@kernel.org;
 h=from:subject:message-id; bh=pF0lhGmgxx8fbjAQrzFFtkSE3++zqMO9whXwChkhTUw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3RD2U2BX/nGo4lLUpxddyrtfLzriN5/LUO46waepIH
 RI6NO1Kx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhIXgJjrVRbwdv3Oxtm3SxP
 SNGIXnShY7uAFtul3RmBlpHraxeqcvUW9Ou8DX1w6VPNpoDMg3YXGOs99yduqpkxwy/b4MwD9rB
 dh6bdlxNaNTXw1fk7q5/YvBZ8EyKxbXVTsEfdqq7bH4vcHvwBAA==
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
Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c      |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c | 18 ++++++++++++++++++
 drivers/gpu/drm/drm_ioctl.c       |  3 +++
 include/uapi/drm/drm.h            | 10 ++++++++++
 include/uapi/drm/drm_mode.h       | 14 +++++++++++++-
 5 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index c3c38695814f..e7867da2d921 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1614,4 +1614,7 @@ EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
  * drm_atomic_helper_colorop_create_state() and do not have a per-driver hook.
  *
+ * This is used to report the %DRM_CAP_ATOMIC_RESET capability to userspace,
+ * and as a precondition in drm_atomic_commit_fill_with_defaults().
+ *
  * Returns:
  * True if all objects implement atomic_create_state, false otherwise.
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 1eebcf6f5e05..9ff1ddecb8ed 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1674,4 +1674,11 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
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
@@ -1689,4 +1696,15 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	num_fences = 0;
 
+	if (arg->flags & DRM_MODE_ATOMIC_RESET) {
+		if (!drm_atomic_implements_create_state(dev)) {
+			ret = -EOPNOTSUPP;
+			goto out;
+		}
+
+		ret = drm_atomic_commit_fill_with_defaults(file_priv, state);
+		if (ret)
+			goto out;
+	}
+
 	for (i = 0; i < arg->count_objs; i++) {
 		uint32_t obj_id, count_props;
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 0dbf04d4aa9e..e589d93871e2 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -306,4 +306,7 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
 			     dev->mode_config.async_page_flip;
 		break;
+	case DRM_CAP_ATOMIC_RESET:
+		req->value = drm_atomic_implements_create_state(dev);
+		break;
 	default:
 		return -EINVAL;
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index bc7ef7684099..b6e2f2edd122 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -796,4 +796,14 @@ struct drm_gem_change_handle {
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
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index ed1a660a3dfd..32eb3f650d7a 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1329,4 +1329,15 @@ struct drm_mode_destroy_dumb {
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
@@ -1341,5 +1352,6 @@ struct drm_mode_destroy_dumb {
 		DRM_MODE_ATOMIC_TEST_ONLY |\
 		DRM_MODE_ATOMIC_NONBLOCK |\
-		DRM_MODE_ATOMIC_ALLOW_MODESET)
+		DRM_MODE_ATOMIC_ALLOW_MODESET |\
+		DRM_MODE_ATOMIC_RESET)
 
 struct drm_mode_atomic {

-- 
2.55.0

