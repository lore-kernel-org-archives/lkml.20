Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0044F3A9619
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135939; cv=none; b=CmNfbCR9KA5vy7POBeY8GiM2lHclH0QAo8rX/+CrgmvrZTrKkUsjzbTFXVwuY8VUQiFaGctU9P7YpYQF0dd5zlgcsXCiy2QC2kvsoGDvBKCQPNH3gSMdgITH1Bow9wGn79lC2Lhhc4YRPM5nXPq2e7/m+GXqz86XO3CHVN/xR/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135939; c=relaxed/simple;
	bh=KEMrmhvprTD4/mCdsj7x0QKXOeK/+X+Jd7TGTCc1GVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iiocdw0U8d5N+pVIiB1d9vzUgzmX7ult8b8KcSPzilWfTWRHuXVVnUoiYlKZM7YTDOVXtZgbro4+kmOpytrO8/oCIsrmt2+Bf4TOwbXgatX1b5sGmI+I/MCZEa52qP2EtEOnncD41Mv3Sv1GbjDJEvDpaXPN1e/DqWhD0h6sJuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0ae0fCy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0ae0fCy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05B91F000C5;
	Fri, 16 Oct 2026 07:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792135937;
	bh=IKp8rk9wlk/oQEwtQFCQILA8QKgqHLehtlj8FulGwXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=E0ae0fCy1tGqE26iLilceHI4c545sFsnKy2OHo3Zyd3xZv2LRnQl7h3sXoWYJrOyY
	 SKQHewPsTMyaWvN3PduM63fPVD1MwUlJOYnwokkZiEb934DrlcsRocWqqNU6HrpUWd
	 Copi6m70Vq454WuJAV1aeITgs1hPLhDQDbsGxfXx2+vUFXzGszuSLBpyGtktaOBQ6j
	 Yut3IOZZa73XIKJSpxRQII36oe8h0XfDbuej24MmmBxJMN+dYnAjxcO41xFrrRepKR
	 PTP05f99gKhDCF0UfZhdS0d2OOHau66+WvpamawUS/fmu4EdMIUrT50waxiD2rSGeY
	 thpHWzrgquB9Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 16 Oct 2026 09:31:37 +0200
Subject: [PATCH v5 05/14] drm/atomic: Create function to insert plane state
 into a commit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-drm-reset-state-flag-v5-5-dad2d64b693b@kernel.org>
References: <20261016-drm-reset-state-flag-v5-0-dad2d64b693b@kernel.org>
In-Reply-To: <20261016-drm-reset-state-flag-v5-0-dad2d64b693b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2782; i=mripard@kernel.org;
 h=from:subject:message-id; bh=KEMrmhvprTD4/mCdsj7x0QKXOeK/+X+Jd7TGTCc1GVg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkXLz3+JRHyf9t0IWOp6RtmFFWemtvk+/DXu8Y1e9f05
 NX2bGZS7ZjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATOSTN2HDZyYFPcMPn4qDf
 P/ozHHpcJpyefYWvSEB2Wq+Pamr3FwvzNe53HKzFZjMs5rnivkS4kLFOwTfGaO4C2eI5rdF8ys9
 2LmLZfF3w/RaVY24vZr55zS4to89vH7foWsk0BkPpKSwK+tMA
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 178eca95d0e3..b26458ee98d8 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -628,10 +628,25 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
 	}
 
 	return 0;
 }
 
+static void drm_atomic_commit_set_plane_state(struct drm_atomic_commit *commit,
+					      struct drm_plane *plane,
+					      struct drm_plane_state *plane_state)
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
+}
+
 /**
  * drm_atomic_get_plane_state - get plane state
  * @state: global atomic state object
  * @plane: plane to get state object for
  *
@@ -646,11 +661,11 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
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
 
@@ -669,15 +684,11 @@ drm_atomic_get_plane_state(struct drm_atomic_commit *state,
 
 	plane_state = plane->funcs->atomic_duplicate_state(plane);
 	if (!plane_state)
 		return ERR_PTR(-ENOMEM);
 
-	state->planes[index].state_to_destroy = plane_state;
-	state->planes[index].ptr = plane;
-	state->planes[index].old_state = plane->state;
-	state->planes[index].new_state = plane_state;
-	plane_state->state = state;
+	drm_atomic_commit_set_plane_state(state, plane, plane_state);
 
 	drm_dbg_atomic(plane->dev, "Added [PLANE:%d:%s] %p state to %p\n",
 		       plane->base.id, plane->name, plane_state, state);
 
 	if (plane_state->crtc) {

-- 
2.55.0

