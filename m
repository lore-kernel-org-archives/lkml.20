Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326586;
	b=0pt1I9dqUcA9H2TonMdxvoJZ9zTuPP5OyqzoF4+JN5VRK7SJdrpiIi4tdMQftwterC/e
	 Bym+eNZASY5b9SYWSN0mkzwb76gv2KhHIEXmT5uHLnQO4LnS+b/VB2HyJw3biOp94btCO
	 IjGKl9yCCAoDTdr4LUocedJJG9c6kOH+qm8OqIjkjJsulUX9R6DQGYr8wNv2RxMSqFwWI
	 5gfZICPtr3i23oI3BT1CPDBK3SdYg7YDmDNUSu28qStnMQGE6EegsQwY54kcAFd3cKUKC
	 cjIHJoA8ayL+7MNKl8EW+f1X09PepfYHK1hR88q/+2gx7yZg/7lIyDlpT333XuiNVUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326586;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=UIwZGk1fss5VEwFZyoqOH1fKZV4VjLTrLWw0MlUbRbs=;
	b=BcFJIZaR1vsvv0ylV++EZDPVOlhvc4N/AzkUxwDv7h7usmuduqdBdGQXWrGBRa+Kmn8/
	 OAYKidHxviLf624nRBnbW/D963+bLOCbtyIG1cjaxJqO7YN6lMQ2TVJPUIaSkhuBX3eoE
	 QpNUZjOjr4w5eZY/4wHQ+ktYTh5FbPIXYySVSCktZfHKTmSiApZXY/xFah0eB5r/WArNq
	 dsQTrIpUJukwk0rUSHCnpmQp7N4C8x4KJr+tDCpXWYnFbW8w8+Q/u0mp3e+OeD7/HhTIp
	 XTrltLIte1BR5H7YT+/TWnCxdRGizy5YdzIXuOZdXzbVpDdre8Z5tmg845Zb44oVjsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NvsIXLXW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D4960A2609
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NvsIXLXW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD601F008A6;
	Tue, 10 Nov 2026 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794326585;
	bh=UIwZGk1fss5VEwFZyoqOH1fKZV4VjLTrLWw0MlUbRbs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NvsIXLXWr0lAj+bsed51+DS+egBDml9leb/5sFvbfqOVrEY+2U37/pgFFFK8KPNb+
	 0igKyAPzo8v7iMGbLaBu8PPfPJVrni6v/xIGn1Mxu/3/vzchWzLKvkfNepobi7mjXc
	 rICeu/LR3LDn4L5/m42onEIWOaZrMumS3pTmFNAWHCv6L39mh4Xps5F7yVeiXA9hVQ
	 MwFrA5lXRh5+MOvHEUleRQx2iygN6TTh4UankXdF54UK1ZzLpeeM1bKAff+00Ehrp6
	 OHlOhq2EfqyTRLbtUh5Rs8cTOgoaMOjXoWaLq6PssbV9CFHMZOf0+ot47URaT5Dl4N
	 VG+cmv5YFhOOQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 10 Nov 2026 17:02:49 +0100
Subject: [PATCH v9 02/10] drm/atomic: Add
 drm_atomic_implements_create_state() helper
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
Message-Id: <20261110-drm-reset-state-flag-v9-2-ddb0e26324a0@kernel.org>
References: <20261110-drm-reset-state-flag-v9-0-ddb0e26324a0@kernel.org>
In-Reply-To: <20261110-drm-reset-state-flag-v9-0-ddb0e26324a0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3638; i=mripard@kernel.org;
 h=from:subject:message-id; bh=t+dM6RtwOtArpaJ7UnLd4NKGqXFn+ejP/ReNUhyWUcU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmfHXSCzq7m25Cjup5/3xbFC1/17xhJp7rzWKln6lg+W
 7A09rl3x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjI3l2MDdP4S5mMLXkPzowX
 uSU3a9OG1Aq9rkP6phsnJN2pql3zapvWqwb3/zH8rSvzfjhPWl3Fy1hfnN8rEPX4oeu5izqNdv7
 JuuF8hifrn0jlFrD/DRZ3LBfYstnSWdFX3e7x5xv5/Kn+YgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The atomic reset path will need to create pristine default states from
scratch for every plane, CRTC, and connector. This requires all of them
to implement the atomic_create_state hook.

Introduce a drm_atomic_implements_create_state() helper that iterates
over all planes, CRTCs, and connectors and returns whether they all
provide the hook. Color operations are excluded since they always use
drm_atomic_helper_colorop_create_state() directly.

This will be used both as a precondition before filling a commit with
default states, and to report the device capability to userspace.

Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 49 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_atomic.h     |  2 ++
 2 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 81591173265d..7a77051096c9 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1598,10 +1598,59 @@ drm_atomic_get_new_bridge_state(const struct drm_atomic_commit *state,
 
 	return drm_priv_to_bridge_state(obj_state);
 }
 EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
 
+/**
+ * drm_atomic_implements_create_state - check if a device supports creating pristine states
+ * @dev: DRM device
+ *
+ * Check whether every plane, CRTC, and connector in @dev implements the
+ * &drm_plane_funcs.atomic_create_state, &drm_crtc_funcs.atomic_create_state,
+ * and &drm_connector_funcs.atomic_create_state hooks respectively. These hooks
+ * are required to create default states from scratch rather than duplicating
+ * the current state.
+ *
+ * Color operations are not checked because they always use
+ * drm_atomic_helper_colorop_create_state() and do not have a per-driver hook.
+ *
+ * Returns:
+ * True if all objects implement atomic_create_state, false otherwise.
+ */
+bool drm_atomic_implements_create_state(struct drm_device *dev)
+{
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *connector;
+	struct drm_plane *plane;
+	struct drm_crtc *crtc;
+
+	/*
+	 * colorops don't have an atomic_create_state hook but
+	 * drm_atomic_helper_colorop_create_state()
+	 */
+
+	drm_for_each_plane(plane, dev)
+		if (!plane->funcs->atomic_create_state)
+			return false;
+
+	drm_for_each_crtc(crtc, dev)
+		if (!crtc->funcs->atomic_create_state)
+			return false;
+
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (!connector->funcs->atomic_create_state) {
+			drm_connector_list_iter_end(&conn_iter);
+			return false;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	return true;
+}
+EXPORT_SYMBOL(drm_atomic_implements_create_state);
+
 /**
  * drm_atomic_add_encoder_bridges - add bridges attached to an encoder
  * @state: atomic state
  * @encoder: DRM encoder
  *
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 3ae35b09c0cf..72c3d420f40c 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -700,10 +700,12 @@ int drm_crtc_commit_wait(struct drm_crtc_commit *commit);
 
 struct drm_atomic_commit * __must_check
 drm_atomic_commit_alloc(struct drm_device *dev);
 void drm_atomic_commit_clear(struct drm_atomic_commit *state);
 
+bool drm_atomic_implements_create_state(struct drm_device *dev);
+
 /**
  * drm_atomic_commit_get - acquire a reference to the atomic state
  * @state: The atomic state
  *
  * Returns a new reference to the @state

-- 
2.56.0

