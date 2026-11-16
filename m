Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824254;
	b=EHeBwtP03saumMGg33ERLN0fprI1pnEoHniPmiTDbMb+6EiSApTsbSUWOlAN7iZtUfu3
	 jJ5Ca2u+aQa7hNUDCbl87NP4nQP8JMuNSuFrFIFzX96nNL78yeZwWdYEDajTrhyicL02S
	 OcSEMPjXPfhrteZJ6hCeMr0BdMIeMcFAKOwRWaVropGEQiNgRp6WpoFHSS5G23/glGRCo
	 sNT5f+cELDHTZl85KqohngsRQ0gFm0WypbRsL+cyyaVywF2c9gVH2hYtGjxkh5pfwR3L2
	 s5p/TBGmF8Kr3uAm9ebPdSX6ytTAEiJREIudl7i2HJ1Ca90/GlwF5LbnbYs7jtEEgLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824254;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9PM2w9+ZdAbkirqUaelWFEVysP1HxWv35WZ7WYMciGA=;
	b=3VvPsqwb5L22gvU41e5uvk+Ei6fq6oRsG+XWzGzJFbZOqRPGVAp75Tj+YCkw8vOIWZjO
	 jx6LOgmGSjwzbECm4VX4GM0hHXhjmx5+/Gulae60wcLKb639Szy5WTLFg9R7OFCrh3IYc
	 V6YXOEugfDc93uVDPScHMOK8eH6ZtRvGN+jzHu8nksCmbd0H1PNBobTDYi9iakqo8O1ZQ
	 ZJJJaQBZGzXCHvRK2Ey4z1EznQLKngJl8dLv30ob0joBI3SaFdMy2TkizZDicR4WdD0LW
	 wRYTb8JF42G2AaJJ//eZxk4Azg3L3W7UYF8xNmKXaNSUa5jDtVdx8CxhW6LQQykmD0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5XiZSQZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741D0606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5XiZSQZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A311F000C4;
	Mon, 16 Nov 2026 10:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824254;
	bh=9PM2w9+ZdAbkirqUaelWFEVysP1HxWv35WZ7WYMciGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=O5XiZSQZt2s+r+cnf4ZaD8R6mxfWnBdtpci8bSZl/exOLp5DipAcFCO+rnipJetTW
	 Lu2KcUpLO6fa6BDSy/a2qCL2jyLeSGg0Ax30vrZLdbJuJNrCLDFaPFXzQAwqd++dEl
	 7Zwwk41X0j1eDxbedeUn0WQQvidlS1zjlPZaBXOLaoce5wrPF7mlzJeKU3h+wRwaej
	 Js70AQST+CM7PgphAr7wcvPmWIMwwqJMfQuRjFiwJqCA+7F9V6blJ5jGl1FQQCt0wU
	 /on8+fN98nU8vwzRPgfuH6S7F5LfYZRYI25iurivW2WbCCa0oS10DuuTE+hrEzlG1H
	 6LqZOFQJB5IXw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 16 Nov 2026 11:17:18 +0100
Subject: [PATCH v11 2/9] drm/atomic: Add
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
Message-Id: <20261116-drm-reset-state-flag-v11-2-378b3f7bef32@kernel.org>
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
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3638; i=mripard@kernel.org;
 h=from:subject:message-id; bh=RmXHPbjUrR0EibhXpIQxQVKQPswSv0z+XMj4h5ZLCnU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm/bhjezlJawqo4QdTt2ousf9Zy2SaP2HbIf3Oaf4PFx
 OKUT9G6jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRRYsZG2aYdDJYL53Ic6g5
 I6SgYsHf2vt/5viUsixkmbIgVtLM7a9407nq+zt7WmamTF0qn3eAmbFh5Wo76at1h+aaiPGZx9m
 EeLZP4XbVyvr3mX/fkisSitLPHRjq/2hMlHiz+lTbxJXObbsB
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
2.56.1

