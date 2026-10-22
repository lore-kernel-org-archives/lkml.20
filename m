Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677237;
	b=aaGy3RQ0L3589D3QLsiDPPJy3Qi44i84XLxpIflHuBmBiI0Q/iwbVU9EiM4gANiAJfmy
	 7w3x+ijzVp2hmZGSmT5lglFmT5YNxo5sI3v4SdHz1aO6wOQ9yrnAvBdde9UAMlT43hMeh
	 gmUWdtlbiMxKzt03cvwUDqE6+Qq8LPtVj4H0+I5v4XUXPhCGI53vmpOU4IKXpYlr8HPdR
	 sBhdtFuXPRyanpclTHEYsT8Cj7VEIE8Q4QuoA3LMJFROkLmLVzM64ZtDQpUca0Kr3MRXb
	 kCepgg9naIrGtdqQRX2zWhn/Znd9111cOmwNgoDn8e5bU/mTRIGlgAqy9Zc2/de8tLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677237;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=O4IMozYP08PnQMYBwMfhZ3uJKrffllKZ7I9Qvn1rQYw=;
	b=gdxow20cZzhRW6JEWEJF4fKL7/jMKZKQeolzz4uSz3QECsVWN/Kpw8qP4j1PmLVZhOQl
	 75yNUYjjCDhJxyUZhWu826bIS6CyZWVdzLeiapETudB+8ERecIZqD1gCLJva4og79+AmC
	 +RUkLMgQo/yEVvY9xTZtgiqICri804gemRBcrn9g/oVrNgv7EAsH/LmZvP8zPdpyFyAVw
	 ax/RlREeJpve9QYRJNlCqzhxWYZ5VkzokdcJNh7tOg2Om4hkEiMzdiHCYlYb6PNzpT48c
	 Ez0cYHo79pJ+L4xQOiIIMjNO2vhoVGGgQD4Gfuu6Z+/lsz5mPqEna3Ch5ZSS5MygYMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jjm0kvsx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA22260A3802
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jjm0kvsx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD3E1F000C5;
	Thu, 22 Oct 2026 13:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677236;
	bh=O4IMozYP08PnQMYBwMfhZ3uJKrffllKZ7I9Qvn1rQYw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Jjm0kvsxUoM6cj8+6Mmkh9wDA+eq54d+6ZCJGhmiZvZ84AFYo0NqHVT2a+9/QG/n6
	 jFkE/WkapmwOKXuaAsdVIC8Al0n26EOn/X0ucjPLTtUS7SuYvdn1Ivff5eZpPnLWip
	 sLZIgowTFeXMwzfKNu2toOQTO+dTmh3QxFEONZjei3zdkMdU1B6WsTRe6pg/B5LnnY
	 rP6DCuJbAOpV5qC8GuzXH7aQsnOBs6v+Km341A+R7mToL0Xr+/IF6l+ZcJORanKumH
	 6Exw3JvS4DyqQlar3L86hhknetoUHbcLv7cUZmLOUhQS60vtTCemmtNeq9XkTAvqFr
	 bN1tbLz3TBD9g==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 15:53:12 +0200
Subject: [PATCH v6 11/15] drm/atomic: Allow filling a commit with pristine
 object states
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
Message-Id: <20261022-drm-reset-state-flag-v6-11-f36d640b7e76@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6766; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wr2wA2j7r+WhpVhEV6CZXiNA0JOfrUn2lu2LA9cxvbw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3RD08C9cbGZ1nlCwPWadwkenOuplvfHs+9p7p2KF2r
 DfNzP1Ax1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIiZeMDdfarJSVXAX5VZ63
 HGKK4f/Qwnqp7Yn+Q24BS7kUDqsbkm/9s1e+YT5+d+rvG2kxCjl5jA0XG272F7jYnFNJ9v7Qf43
 hhY5MskON9ZHVO/etE+K97jXtsW4M16/0dVNW/3wtd4K57BIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The upcoming DRM_MODE_ATOMIC_RESET flag will need to create an atomic
commit that brings the entire device back to a pristine state, as if
no configuration had ever been applied.

Create drm_atomic_commit_fill_with_defaults() which iterates over all
CRTCs, planes, connectors, and color operations in the device and
inserts a fresh default state for each one into the commit. This uses
the atomic_create_state() hooks rather than atomic_duplicate_state(),
since atomic_create_state() provides exactly this pristine state on a
per-object basis.

Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 142 +++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_ioctl.c  |   1 +
 include/drm/drm_atomic.h     |   2 +
 3 files changed, 145 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 7a77051096c9..c3c38695814f 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1650,4 +1650,146 @@ bool drm_atomic_implements_create_state(struct drm_device *dev)
 EXPORT_SYMBOL(drm_atomic_implements_create_state);
 
+/**
+ * drm_atomic_commit_fill_with_defaults - populate a commit with pristine states
+ * @file_priv: DRM file the reset was requested from, or NULL
+ * @commit: atomic commit to fill
+ *
+ * Iterate over all CRTCs, planes, connectors, and color operations in
+ * the device and insert a freshly created default state for each one
+ * into @commit. The states are created through the atomic_create_state()
+ * hooks, producing the same initial state the driver starts with rather
+ * than a copy of the current hardware state.
+ *
+ * If @file_priv is a lessee, only the CRTCs, planes and connectors part
+ * of its lease are reset, and the other ones are left untouched.
+ * @file_priv is optional: if NULL, it is considered to not hold any
+ * lease, and all objects are reset.
+ *
+ * In the default state, all objects are disabled: CRTCs are inactive,
+ * planes are disabled, and connectors are unbound. Driver-specific
+ * properties such as color pipeline settings or max_bpc may carry
+ * non-zero defaults appropriate for basic display output.
+ *
+ * This is meant to be used with the %DRM_MODE_ATOMIC_RESET flag, which
+ * needs to bring the device back to a known baseline before applying
+ * userspace property changes on top.
+ *
+ * Returns:
+ * 0 on success, or a negative error code on failure.
+ */
+int drm_atomic_commit_fill_with_defaults(struct drm_file *file_priv,
+					 struct drm_atomic_commit *commit)
+{
+	struct drm_device *dev = commit->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_crtc *crtc;
+	struct drm_plane *plane;
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+	struct drm_colorop *colorop;
+	int ret;
+
+	drm_WARN_ON(dev, !commit->acquire_ctx);
+
+	/*
+	 * Private objects are ignored because none have userspace
+	 * properties we might want to reset. atomic_check
+	 * implementations will derive or infer their private obj state
+	 * from the state that will end up being committed anyway.
+	 */
+	drm_for_each_colorop(colorop, dev) {
+		struct drm_colorop_state *colorop_state;
+
+		if (!drm_lease_held(file_priv, colorop->plane->base.id))
+			continue;
+
+		ret = drm_modeset_lock(&colorop->plane->mutex, commit->acquire_ctx);
+		if (ret)
+			return ret;
+
+		colorop_state = drm_atomic_helper_colorop_create_state(colorop);
+		if (IS_ERR(colorop_state))
+			return PTR_ERR(colorop_state);
+
+		drm_atomic_commit_set_colorop_state(commit, colorop, colorop_state);
+	}
+
+	drm_for_each_plane(plane, dev) {
+		struct drm_plane_state *plane_state;
+
+		if (!drm_lease_held(file_priv, plane->base.id))
+			continue;
+
+		ret = drm_modeset_lock(&plane->mutex, commit->acquire_ctx);
+		if (ret)
+			return ret;
+
+		plane_state = plane->funcs->atomic_create_state(plane);
+		if (IS_ERR(plane_state))
+			return PTR_ERR(plane_state);
+
+		drm_atomic_commit_set_plane_state(commit, plane, plane_state);
+	}
+
+	drm_for_each_crtc(crtc, dev) {
+		struct drm_crtc_state *crtc_state;
+
+		if (!drm_lease_held(file_priv, crtc->base.id))
+			continue;
+
+		ret = drm_modeset_lock(&crtc->mutex, commit->acquire_ctx);
+		if (ret)
+			return ret;
+
+		crtc_state = crtc->funcs->atomic_create_state(crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+
+		drm_atomic_commit_set_crtc_state(commit, crtc, crtc_state);
+	}
+
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		struct drm_connector_state *connector_state;
+
+		if (!drm_lease_held(file_priv, connector->base.id))
+			continue;
+
+		ret = drm_modeset_lock(&config->connection_mutex, commit->acquire_ctx);
+		if (ret) {
+			drm_connector_list_iter_end(&conn_iter);
+			return ret;
+		}
+
+		/*
+		 * drm_atomic_implements_create_state() already checked
+		 * this, but connectors can be hotplugged between that
+		 * lockless check and the iteration here.
+		 */
+		if (!connector->funcs->atomic_create_state) {
+			drm_connector_list_iter_end(&conn_iter);
+			return -EOPNOTSUPP;
+		}
+
+		connector_state = connector->funcs->atomic_create_state(connector);
+		if (IS_ERR(connector_state)) {
+			drm_connector_list_iter_end(&conn_iter);
+			ret = PTR_ERR(connector_state);
+			return ret;
+		}
+
+		ret = drm_atomic_commit_set_connector_state(commit, connector, connector_state);
+		if (ret) {
+			connector->funcs->atomic_destroy_state(connector, connector_state);
+			drm_connector_list_iter_end(&conn_iter);
+			return ret;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_commit_fill_with_defaults);
+
 /**
  * drm_atomic_add_encoder_bridges - add bridges attached to an encoder
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 9039a39c4324..0dbf04d4aa9e 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -34,4 +34,5 @@
 #include <linux/uaccess.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_auth.h>
 #include <drm/drm_crtc.h>
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 72c3d420f40c..cac74d43a34d 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -704,4 +704,6 @@ void drm_atomic_commit_clear(struct drm_atomic_commit *state);
 
 bool drm_atomic_implements_create_state(struct drm_device *dev);
+int drm_atomic_commit_fill_with_defaults(struct drm_file *file_priv,
+					 struct drm_atomic_commit *commit);
 
 /**

-- 
2.55.0

