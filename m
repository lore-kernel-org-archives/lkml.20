Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501131;
	b=tnmTzNAf1SsUHCvxV1pPeSt6In1V65/ufV3MPnYKpMkNehAf19XqTeWrHToEBymOHOe3
	 7kSbyL+icC374/c7GhdwqG92PU/4B4N9JmhxYQvRj2MSjHwiYyUSdxVPZkeXsFJaB14J1
	 pZMfnBvV0geWRSFo7N3wt+pg00LgNcY0BT7LKyHJRwjcy5c07gM3dj4kIUMKPAS9Ky8D7
	 P8t3nIdgtdlm2UzJSsqq3a+MtrlXbP5K0JxtVReMgk7cytF9Nee9bL/saF6q934yy5RyX
	 erMOIjV63eLSk+e4Iz8JVngTuf18GuIDRQQLJYBMQEWQeMI0YCP9vTqKzcv3QjJVyGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501131;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=UIwZGk1fss5VEwFZyoqOH1fKZV4VjLTrLWw0MlUbRbs=;
	b=ycfDMuIimQlxyUccyBPWrwEPIDsNn6YfXzPoX8iCip0k9Oic0PNIwgPt33S/wif8UvcZ
	 Pl966Q+nSsFD2Qe8OD0zOnVJ1ZCpsy93p0TqopECNhgdDbSxKt+/AF1S9qAgnWo1QJMDk
	 HZogLg5dKFvnAEWNPTwBBvtQmxSkg/W31iJ/AGHL9ihD/ra951VVrdSgdrgXlPoDbNcRS
	 aeNDuG7FpJkxhQJk+DKaq+EracQkC1s+nSpnup70VWPgAOxCfQZHWSS/js1U/bcdc+dnm
	 eZhi/XnI3FH3F9enlbGMXJp7J3n9gYoJd1kYt2lHme5UnAl98OboXDP2O3MQiAlfJSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D/cle2e9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBCE60A2600
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D/cle2e9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11DE1F000C6;
	Thu, 12 Nov 2026 16:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501131;
	bh=UIwZGk1fss5VEwFZyoqOH1fKZV4VjLTrLWw0MlUbRbs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D/cle2e9SG5lMoCcUjpF9FSEa5U8kpuq2YvYEw1Io7ZcdEK602O+cQl2DrrQIEuSX
	 vhj6+8n7154Ue3Xh3588igxHPU7zGh/o+/A9jGeak/U+gisHnErFbJ8HmONnCbP/M0
	 xBKY1EnnsORyIo7Gexp9FpLaYQaLBMmmsVes6J974ND/2OZRG69ZRMjJEdISTGntl6
	 ycyL4+HwnGmyeT5DnpJ8rUGJxLKYqNQJJIiKKBApD67+y0lAZvx/Xr/mam9EFc1qph
	 6fX23Z7Q+//viq4vDkOSZsOqEcV7FTmEZrzFShC4Jdw6saJw8VqjUqE6+5bawZG5Ui
	 R09LYqYTN9ekw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 12 Nov 2026 17:31:51 +0100
Subject: [PATCH v10 2/9] drm/atomic: Add
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
Message-Id: <20261112-drm-reset-state-flag-v10-2-cefaa1ed056d@kernel.org>
References: <20261112-drm-reset-state-flag-v10-0-cefaa1ed056d@kernel.org>
In-Reply-To: <20261112-drm-reset-state-flag-v10-0-cefaa1ed056d@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlfX/77fFzr2gehxBUH5llG2MyaKHquYFOYg+6X+kd9q
 h8aLmurdkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJzFzEWCvwWyuZ9Y3yuV+P
 TzkqP328690871zLA1cPOK44kLFg1hFzY1GLbb3T5l1jeGc/cxKj4nHGOsVKzp/B4u37ryxc3v9
 hR7Pt3JV/tXMrGxsYJc7+nl4fvvJZeZ9Kgs6VqnW8Z47NaGXiAAA=
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

