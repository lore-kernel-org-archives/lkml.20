Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA97354DADA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878137; cv=none; b=ePdE+KVTkfJhbXMTyp9eKqCCweieCteUtW58s8JtrKmnuWZkEGmPL3A74/dg9wKZFdfmoJUi8vqhBodCE34Y+MDQDQLshN+3DmJ+XyBnco3ZAbWVn1XF6PbYT8cy214oVYq5w+c+CXqx0ookfknQhbt25k4D/QPJ0WzIGodk8wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878137; c=relaxed/simple;
	bh=SBXepA+Kzx2kmCXRTs2XA6GB/9sKhpv4dQQh4KGM1yE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J81IxhNhHK+N/nITAf87Qb/NwuuG2PVj2RMTrvNl9jjeUwp3lZ9OTHeEaj4wGs90t3fookIHH5C2PgB4Hxu+nNtqOQGLs4LTg6RMZJBAX5Aibyi1gfoZAa6EWi7dofk7iwW5tyfElUPBWrNe+05gzFOXYKOHJ4bK6Ndsw4KAJk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEz2sfP/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEz2sfP/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B860C1F00ACA;
	Tue,  8 Sep 2026 14:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788878127;
	bh=bqBWshvt3L6MTIRaqkZiDc6MNSNPGD81ogLG36xTIIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BEz2sfP/ZwE43hDKsTyCe3K9a1usqzxP2GqopSFANewtxzFAF78Rt0Gq3FQqrUZDK
	 4fx+h5+G1O6B/wmcVZJUG4e/XPeotusY80Uq3GgBoRGJGAs5sK9u1exr74VDgWOevA
	 g+pAAmIh3uwDFUvaTHWQweiDvfR0x9hl//XA2vqHO2I5URSyf7UAYC2OpQxyKZUoaH
	 mD5Lq0SXO3O1VgUxeVz+v1my4wJ94UTdLw/rWTRyBaX6gIg8CTa4NxmdpPooyR5FDF
	 mxHBXfs13g4LzqZQY7SuhB/Kiw7qYC0sOEJgL5AVN37FMRgP33ECeGhAyPw1Na8WHX
	 8JCCFtiIz9s1Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 08 Sep 2026 16:35:04 +0200
Subject: [PATCH v3 03/11] drm/atomic: Create function to insert plane state
 into a commit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-drm-reset-state-flag-v3-3-905570f387a4@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2806; i=mripard@kernel.org;
 h=from:subject:message-id; bh=SBXepA+Kzx2kmCXRTs2XA6GB/9sKhpv4dQQh4KGM1yE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkLZGUCKrn1cxZYyWvt5SnhZlp0JTpPwP+QjJdmy4sa8
 2Pqxzd1TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgInsZWZs+DIlMy7uwq2Cidyz
 g841bbi569PDVKXz1++/XyHHHH6pzCb3mo7xtEsn+7fMF5D72/lLnLFOZV91guXCk3MzamXym1I
 WrX97xGjS37l9r+LuCTO6L1ZLfXNbYf/d8CjtbVJ7XS0WbJMGAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_get_plane_state() allocates a new plane state by
duplicating the current one and inserts it into the atomic commit as
a single operation.

However, a later change will need to insert a plane state into a
commit without going through the full allocation and duplication path
in drm_atomic_get_plane_state().

Extract the state insertion logic into a new static
drm_atomic_commit_set_plane_state() helper, and convert
drm_atomic_get_plane_state() to use it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 153d959bd4ff..f62323679f44 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -624,10 +624,27 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
 	}
 
 	return 0;
 }
 
+static int drm_atomic_commit_set_plane_state(struct drm_atomic_commit *commit,
+					     struct drm_plane *plane,
+					     struct drm_plane_state *plane_state)
+{
+	int index = drm_plane_index(plane);
+
+	drm_modeset_lock_assert_held(&plane->mutex);
+
+	commit->planes[index].state_to_destroy = plane_state;
+	commit->planes[index].old_state = plane->state;
+	commit->planes[index].new_state = plane_state;
+	commit->planes[index].ptr = plane;
+	plane_state->state = commit;
+
+	return 0;
+}
+
 /**
  * drm_atomic_get_plane_state - get plane state
  * @state: global atomic state object
  * @plane: plane to get state object for
  *
@@ -642,11 +659,11 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
  */
 struct drm_plane_state *
 drm_atomic_get_plane_state(struct drm_atomic_commit *state,
 			  struct drm_plane *plane)
 {
-	int ret, index = drm_plane_index(plane);
+	int ret;
 	struct drm_plane_state *plane_state;
 
 	WARN_ON(!state->acquire_ctx);
 	drm_WARN_ON(state->dev, state->checked);
 
@@ -665,15 +682,15 @@ drm_atomic_get_plane_state(struct drm_atomic_commit *state,
 
 	plane_state = plane->funcs->atomic_duplicate_state(plane);
 	if (!plane_state)
 		return ERR_PTR(-ENOMEM);
 
-	state->planes[index].state_to_destroy = plane_state;
-	state->planes[index].ptr = plane;
-	state->planes[index].old_state = plane->state;
-	state->planes[index].new_state = plane_state;
-	plane_state->state = state;
+	ret = drm_atomic_commit_set_plane_state(state, plane, plane_state);
+	if (ret) {
+		plane->funcs->atomic_destroy_state(plane, plane_state);
+		return ERR_PTR(ret);
+	}
 
 	drm_dbg_atomic(plane->dev, "Added [PLANE:%d:%s] %p state to %p\n",
 		       plane->base.id, plane->name, plane_state, state);
 
 	if (plane_state->crtc) {

-- 
2.55.0

