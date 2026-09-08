Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8F755199F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878158; cv=none; b=o958REPWnyO3JCfXXFtZvcl+9kGEIlnqmWGjKSd+kpDujzvkwKU83iDA1oUCf6IahQuSvE5MmSvMvkZEoqZRXb6Z3+Y6wsPAL03C5aKzetxH4TeUmxTyYtoY43izP9JHsKkrIFa80Om0PujDy95ZYoOq6WMFOcUCHHY5RwibXRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878158; c=relaxed/simple;
	bh=d0e1bkJn7+NMBwM9i+AZw5D06zeTuCeswC7oh2rs+hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/Z0QxZuY3SQ2HpvdF8ecqF0swWKwrTEE4vR5dLx1fSz8ywsmF5TzNKOEkAP8eShddLwwmT1DGpxCMPObUBXhbdUDdnuwpJ9B/kEVdTR0WnLa/Pn7e0BnLFxn7GugZ60qWVbjsbQPVBoLvl5SZZL3UXklZ6Ukif/P7a+GmUFwOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNKIXIv4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNKIXIv4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400CE1F00A3F;
	Tue,  8 Sep 2026 14:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788878143;
	bh=lJckSwA4yz1X6pqZcF1oUQ7YXY4uLF7/JNIqYv1gCVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FNKIXIv4bSTIwnWSG2vxkrFg+tdwSSGYJChV3hozQK/wrjpyDcxs4m/yHhW78cz00
	 FDFafSjU0wRYXpO91YsyLMYUGgA+nfEraigrhCiqSbLwmtqsPg/WXQpv2aIv/d+wx5
	 qtIpbAiYbfqgp2FeEaDOmszufT7YMGppJPnVacqkGUeCaJpTQHxxidaasm3TLFKnGU
	 Txog5PEOifAG1Nxm1csntQqeID4reFI3Ye5bVDcySC3N9/uGtfRXlLQqnBmUhYfMr4
	 IDiZSEqjvuDTjzPLcPTJ+qX2YsZsbZxgDGsL+VwUv1TnkPk+3963qAZ6LMymxSLpqL
	 hCcYQcfNkODhw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 08 Sep 2026 16:35:08 +0200
Subject: [PATCH v3 07/11] drm/atomic: Add drm_atomic_can_create_state()
 helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-drm-reset-state-flag-v3-7-905570f387a4@kernel.org>
References: <20260908-drm-reset-state-flag-v3-0-905570f387a4@kernel.org>
In-Reply-To: <20260908-drm-reset-state-flag-v3-0-905570f387a4@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3552; i=mripard@kernel.org;
 h=from:subject:message-id; bh=d0e1bkJn7+NMBwM9i+AZw5D06zeTuCeswC7oh2rs+hU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkLZOWOLmKMrl27XuLXjz/VVSxHtm0y3yPgPOVy10x/z
 lWP3Lo1O6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEKmYw1lcIH+NuXm66fenD
 fTGbZX86LXTNPLV9TbVXJvsq0bDMV1MSWec5qet9elL+SqHv18e074wN157O6rzfM7nqfPZOsSW
 i3Q/0Xctn7L8j+nDSs8knTr1aYr2AnVG21jYwewnvzkZmwe0fAQ==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The atomic reset path will need to create pristine default states from
scratch for every plane, CRTC, and connector. This requires all of them
to implement the atomic_create_state hook.

Introduce a drm_atomic_can_create_state() helper that iterates over all
planes, CRTCs, and connectors and returns whether they all provide the
hook. Color operations are excluded since they always use
drm_atomic_helper_colorop_create_state() directly.

This will be used both as a precondition before filling a commit with
default states, and to report the device capability to userspace.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 49 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_atomic.h     |  2 ++
 2 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 19678e8a2bd4..508a027398af 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1612,10 +1612,59 @@ drm_atomic_get_new_bridge_state(const struct drm_atomic_commit *state,
 
 	return drm_priv_to_bridge_state(obj_state);
 }
 EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
 
+/**
+ * drm_atomic_can_create_state - check if a device supports creating pristine states
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
+bool drm_atomic_can_create_state(struct drm_device *dev)
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
+EXPORT_SYMBOL(drm_atomic_can_create_state);
+
 /**
  * drm_atomic_add_encoder_bridges - add bridges attached to an encoder
  * @state: atomic state
  * @encoder: DRM encoder
  *
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 00b3e9fc429a..7dc26e3da65c 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -700,10 +700,12 @@ int drm_crtc_commit_wait(struct drm_crtc_commit *commit);
 
 struct drm_atomic_commit * __must_check
 drm_atomic_commit_alloc(struct drm_device *dev);
 void drm_atomic_commit_clear(struct drm_atomic_commit *state);
 
+bool drm_atomic_can_create_state(struct drm_device *dev);
+
 /**
  * drm_atomic_commit_get - acquire a reference to the atomic state
  * @state: The atomic state
  *
  * Returns a new reference to the @state

-- 
2.55.0

