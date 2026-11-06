Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977918;
	b=oGTaY4+qEH2HDOFBP5M9jRu6G+5vBMM15L62wScGKEHEtuQzG3+3jW5KWuxK86RlSBWz
	 LUay7QNAX/w2dHsrNNvKNEd1agXloHjhDXkoW7ZfMKW2kgC3V+H3VSm8/b8dc9HVbyVk5
	 nzfw3+UpFdYfcWBIwH7fX5gb0W6hsSuve7t7X1esfbDKEqSKDHscXZX/VrIdukSp8eiVt
	 8K3DlK/y78kCO56NuHJG/+iP5+PUagB2Kh85vIUsGX5pc4K5gl1uieS53Lrcu/6uocFT2
	 RvvHN4O0W1BSKXdFJktMuFOC/U32+otcz8swE2A2KIQgRitWrltM5cBQu5ohkG86/8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977918;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fBR/d2kDO7ofonwugntYIl0PHaKrMZ/PUvdO3M4g6VM=;
	b=sStJqZWjOhD5LVIq2/2lDLI4CRJrjkskUrtvdTrjcZKhr4dcybZCwc0WTBJ0yJHS32MV
	 MDaECm2xMyEQfEKLU74Cq/PVwEmOjsZw0YQJfGiDcSJGygLuYYnxVXats8othFtrxnL19
	 G90cph/BjHzMQFiFl62gpak4jXbhbPTVAuX+lZdk7HLRr2Sq7yFlxEnIZDNKyxG5lZp2T
	 9A1aUOrhon4Vg1TCdli1t8F8YLVikUIdsprCa8J5GcRWcV4gltNj2cRuhJ/WgmL+QHxJi
	 +ng3zvYH0xQzweIIkXgw+gl7nOmE0KKVdKt90U5cm7lFPKTBO9qNYnye11az5YvfYyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E5MkiU4O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B729D606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E5MkiU4O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C606A1F008A2;
	Fri,  6 Nov 2026 15:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793977917;
	bh=fBR/d2kDO7ofonwugntYIl0PHaKrMZ/PUvdO3M4g6VM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=E5MkiU4OkCagSJTioDoqawNCSolUj0Lfd3dcSFbpbyQrs3H3laSMpCLHesKF6aTli
	 RRZIav9d+5CawdLmWR4TBB3VOGtdP2Vbxfx1LjPqQKcAoSnjN4kOpv4Sb4coveH4cr
	 05Et8b85DQQ10gYTqJnGdnsuTavEjwUhhUNRlRYrMPenBnGT56xrOoKqZm+t7BzT5s
	 tYhrXZDYn9+YYxCMl2g+iYrssHDCOhgNdDGduAf2iVeBcFH/tJDvl8GoZAEBPfP0go
	 XOX2fQK+qgWl/yTymlMCdn8ATV4BTLAbKSbQfPn3SfN32MifHogFoRmPAwf2cFgz+Y
	 5LDbD1qHZUrAw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 06 Nov 2026 16:11:40 +0100
Subject: [PATCH v8 2/7] drm/atomic: Add
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
Message-Id: <20261106-drm-reset-state-flag-v8-2-50fd046b705f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3340; i=mripard@kernel.org;
 h=from:subject:message-id; bh=eNy3jfcG0T74BgjzpyssXa+LxgGLkHAW2kof6DzNhSc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlv3+mrxR8tvem7V9Lur4THu7LP36QPcP3doVYibWlef
 Xe5537RjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRWW6M9S4bnub+WhXVwPTZ
 3z+fbd/kSX1Xtb2vqUnkL7vz+/3Enbvie8+2sx1h4m5o/l2blvckg7GKef2s1E3HHbNTnul0C70
 S3/mrtvxoytLKzmqB0289LLX8DxtXdV28tvvGl6lrPG/svVwHAA==
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

