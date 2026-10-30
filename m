Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356108;
	b=sHzqCSufFE0W0GqaE53ZrJGMDqtsfIVrMCBaY8E497ECEZqoDF6z+RDSwO2dtLbqeAgL
	 kwW8ZJbInmRcndYDnjUaqWydu3uVUr35LrriG6JCD7avQfLBPDB9/Rh9jYtiuH6tWNit1
	 6omsfTRsg2q9H1EH6aYHe+q2t5NKkkYCBX0TRbIh4yQGkh7RaHvlXQgUJWci0SyqNTr4c
	 2zY3qyyOsGvwbfPefT1ai45mWWN7dJWRoVlwXEQ1R+jAWl6/NruW9fXPLCMDuxuguP+rA
	 1iRxXie2Xdd1QCfEps6PukPGJIdx+jlNCvhAE2egIw1epujSqTwf8LUHji7zOmNK+eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356108;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fBR/d2kDO7ofonwugntYIl0PHaKrMZ/PUvdO3M4g6VM=;
	b=XIc3MS9M0I65BI55X2OGhA5PD5i3Ti6HXfpQq2g3jbnR0eZcawkSEisPHF5gHTpI4aOE
	 KfwxVEeigF64C57jQ2Lfiqpf6p0L+EF7ho4NhQM8LUbf5LmNf8NjlJPJWStE3Puoj/cyV
	 8N7mHrO2IXjWTnfV1Vz5L9AbV/z6QlTA19WR8WP/EhMYdoDxcCmSWVcv2B1V0rQKBHrn/
	 /Fb/ybwPpimrQDqXvx3wm32FB7agto0YDaVF+fAu/9ZuiSp+wRVFU07etu/2RzLDdcLR3
	 DtwMOoZ6fJkPPO7pufOLa8eS5eEdqpfqqGkyCqHszn9j/HEIfn8c8nwLirflc9vRwFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E35HDiT2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49B060A3826
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E35HDiT2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC34C1F00A1C;
	Fri, 30 Oct 2026 10:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356107;
	bh=fBR/d2kDO7ofonwugntYIl0PHaKrMZ/PUvdO3M4g6VM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=E35HDiT2rHtM/j6xBaCX9KeP1yEl1MEIQYEPDDHMbtAJvtO8MzHplhw19F32FF/C6
	 BT2JqIEtJIkQpSBnPDq4s3U4c20YUyCAxhufbuEjHezpuZf8sbzLbfRy5Pt816HJsr
	 qMXKgwRSMCZycunZK20vdrILdqW3iCJT+KOP9rSTDcyCjEt2gwyBESxYD4VvTlPLYA
	 lOcDlbytRAQnreJqMQfmhnXt5cHVpO32Ol7GwTpSrxevOZGV/JOROQsJAJfHWw72uK
	 MalUo371B52z7K5UUdzPPCDy3Ob+xgQItOC5aOZRHCY7MEKXZDecQWo9/6FRuTtcb+
	 5SXgxBB1cbnSA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 30 Oct 2026 11:27:43 +0100
Subject: [PATCH v7 11/16] drm/atomic: Add
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
Message-Id: <20261030-drm-reset-state-flag-v7-11-4e55eaeae683@kernel.org>
References: <20261030-drm-reset-state-flag-v7-0-4e55eaeae683@kernel.org>
In-Reply-To: <20261030-drm-reset-state-flag-v7-0-4e55eaeae683@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlPCmWqKlguC4erJrlGqfS+/+sZ0rXStiLzsCdb5/66S
 S8dvSw7prIwCHMyyIopsjyRCTu9vH1xlYP9yh8wc1iZQIYwcHEKwEScIhjrY1//4BQ4E/mUI8Ws
 JJg1cmaTxgKv20m3J6t6fJj/X2sP945DPL7bqmX/brwxVzhhqcY8xoYDp1/KH+H8cvdQ5b/Vu/s
 N2m9fL4+ION+8aaGhUQj3E8eCu1Kqx7+sYOV19U7Nlej0OwcA
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

