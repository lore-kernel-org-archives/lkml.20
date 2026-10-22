Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677233;
	b=RMjRU/Ju2bUss5c7x00ZxOScFXjWDo1+fmbZ1w2R8GlI6vwyhfy3Di2bmUbmUlHzHboH
	 UPq0EmjV2hd7I2hAxT2MfMksILy+dZE67H0CelMNFvEAKtxtirfktbNodv6kmFfhXqADc
	 ff4g2kD8NYgSI/THtkQzFgxiQG0jjQTPpM4weKspffhW8GfteeIv8bahyWDV3A+LJdGXx
	 wFM/V8N4CkejCDqYQ6nS/N7/0t8lzDR4BO/35FxrAU8yLS7m8zSF0nYEwvwJlk0uHc7LJ
	 CZelxOJITOWEKp3SHyrEusaWeg+5z1tHsgRPDL1KnpPNwbvhHouVSC2ITva3WgD4YqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677233;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fBR/d2kDO7ofonwugntYIl0PHaKrMZ/PUvdO3M4g6VM=;
	b=vN+/bY9yrajQ42sPy0l5pZtS2mh+HtVQWsd+DtskK/vkoJhuQjZqf1PjfGWPEBZkBWlA
	 n3GQJfGL/GI2/RQCvTxEuM8IPNRMp/3IjWfJMxnhYK3jnhK7QtSIVEFl0OcsF3GxBknjK
	 E3B5OOd3eJaKwYIiy0ek/W49IupY1Qzl3cza+ibJcCD/zCOkXZyyxeJCSW3W952GQC5uC
	 fH2H0vvbgmfYxnG2MfxPP56fHcoBBmPj0lf2Ip7Lung8ZR4BTHr60zxf3/ez3MB0XrO79
	 5ZXujcrbipyoYHqmFu0wYhuUuoHFykNJIl9iQ/+wwETJMOF1hQT5FliAulkTLNfA0AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6p6sHnY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F084660A3824
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6p6sHnY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCAA1F000C4;
	Thu, 22 Oct 2026 13:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677232;
	bh=fBR/d2kDO7ofonwugntYIl0PHaKrMZ/PUvdO3M4g6VM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=b6p6sHnYP2Fg1CCpUzai8MwAl7Tq9u/BQ6uB1FVfp+1kYKz3q9X36QrPHmjUUU5zz
	 y7GIgI0zOQk5JU2mvnKneY31AIOuN6pP/+XJXiKRRZbPR/a/Z5D3oQdv99oLJemBTB
	 fAicE0aA1+GX8dRUMMubLxaoDsZ8y46Nf1rDFJIAQz3kku6POhTNoXYsMhQlh+15IQ
	 p1RwcaOUdAdUtUOpNSAve5zSCCrDwpsAognFuTMrk12bmevNpL5fHSdMIiIaAyWmO3
	 ltv6SJthTYuAewmOFmP9Wf0RMkoWN3cKzjHuNCD7VEG6+hWJKuVX3CurRAJ9ElUune
	 rNAYP9vnnbohw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 15:53:11 +0200
Subject: [PATCH v6 10/15] drm/atomic: Add
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
Message-Id: <20261022-drm-reset-state-flag-v6-10-f36d640b7e76@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3340; i=mripard@kernel.org;
 h=from:subject:message-id; bh=eNy3jfcG0T74BgjzpyssXa+LxgGLkHAW2kof6DzNhSc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3RN152C64dwu26Kw9t3COl66BkLz8231zlMQeuR8P2
 zrp8uLejqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCR3ScZGxof2HmEiqq0qryY
 PcOERUQ+8eaMqBu+LT6+sRfO391un12a9rY98FhANttfTkuxV3ctGRvWna2bm9JqPcNgnYPuy8O
 pV20XJk7r5Fm6WjdM5pyC9rXPX/SSq57rHF2VKOTncUtodSYA
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
@@ -1601,4 +1601,53 @@ drm_atomic_get_new_bridge_state(const struct drm_atomic_commit *state,
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
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 3ae35b09c0cf..72c3d420f40c 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -703,4 +703,6 @@ drm_atomic_commit_alloc(struct drm_device *dev);
 void drm_atomic_commit_clear(struct drm_atomic_commit *state);
 
+bool drm_atomic_implements_create_state(struct drm_device *dev);
+
 /**
  * drm_atomic_commit_get - acquire a reference to the atomic state

-- 
2.55.0

