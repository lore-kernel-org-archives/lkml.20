Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5629E4F68D7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741098; cv=none; b=lApHTcEnEGCXMJIwPHwj+5gZMLJI9gjrhBGzvpWHjl7EEMEHmsyU53NyHQIM1kh3ySaca+x4ccLPeoSvBV8G0ftdXXeu1qNE75WvkQL2YCBC3544Z9hcYdEThOgapp/+QMGYw/Nz512M5PeYZ9Zrd8GsU7vMU2S4zev9a17VdH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741098; c=relaxed/simple;
	bh=EahHIB+82aiYlh6Ob+7rXwGmj9ORLofauuIYcAtEVoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T5G3OA3pcizY3J66mkwz51DsWAdIyzUw8gPgX1hELq09sQDpXH3rDOOJLrkHL1VPK7+sOFBOWD7rTsR/CP3rQ47XTINkND/l1JH1SSPKn5JCuD3TPgdvprHQhVsJtgew85CbUE17768ldYpallXzs5fsOwWvrmG1E7fZSq5kWMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTTkDKvU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTTkDKvU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC5F1F00898;
	Fri, 18 Sep 2026 14:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789741097;
	bh=Wm/cjA47XwWzJbdZtNRqfomyf11E7/lPxwK2lVerdU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jTTkDKvUpo9VVDbDnp4hfGZv/C56KWYFca7Ul99QB8+PsgzA5s/VTpN0W5c1KCz5K
	 tGbic/6ia1kAH3flyrJERa4Rmte7sCAirFf99LvQ1XOYe0BgJStccRDYF7DtvsSRFk
	 OmBbAUno3bVy6seuZFQDiV/UiKnMpVJCRgxupvhD6bQT7wPfToSVwoWg1iHU6f+IZF
	 3+KKcaCM/rTNZrjxbpk2X2I+05cwiM8ps/ld8hWxU2SxQSHlVHDd5rzG4oq3AN4zsR
	 guT8RcrhCQhjdcpN6X1ktx+k/s6REIQaBhPJ6TQylAtCLIftR2z/Dg63+HAH9qYb5c
	 g7DqIBhQwYd4Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 18 Sep 2026 16:17:53 +0200
Subject: [PATCH v4 04/13] drm/atomic: Create function to insert CRTC state
 into a commit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-drm-reset-state-flag-v4-4-5ad106370f05@kernel.org>
References: <20260918-drm-reset-state-flag-v4-0-5ad106370f05@kernel.org>
In-Reply-To: <20260918-drm-reset-state-flag-v4-0-5ad106370f05@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2660; i=mripard@kernel.org;
 h=from:subject:message-id; bh=EahHIB+82aiYlh6Ob+7rXwGmj9ORLofauuIYcAtEVoc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlrPQQ3CC9LrxN+8furxRItoxPSpVcf3szK+W0vK7WYX
 e/J+YaSjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARThbG+sCdH+/zntWVkOFI
 bZt16MntG+Xry2b9KeFtNbQwztu1bsf6/Y+sJ3+cqBSWndN7edsiHsb6HFHureeMdpnJPNRMjvi
 RUBO9/cJCSY3HlYdbHRpPXngWsOroyav73C/sfCVaJlfo+3MLAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_get_crtc_state() allocates a new CRTC state by duplicating
the current one and inserts it into the atomic commit as a single
operation.

However, a later change will need to insert a CRTC state into a
commit without going through the full allocation and duplication path
in drm_atomic_get_crtc_state().

Extract the state insertion logic into a new static
drm_atomic_commit_set_crtc_state() helper, and convert
drm_atomic_get_crtc_state() to use it.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 80436adcfb7f..178eca95d0e3 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -431,10 +431,25 @@ void __drm_atomic_commit_free(struct kref *ref)
 
 	drm_dev_put(dev);
 }
 EXPORT_SYMBOL(__drm_atomic_commit_free);
 
+static void drm_atomic_commit_set_crtc_state(struct drm_atomic_commit *commit,
+					     struct drm_crtc *crtc,
+					     struct drm_crtc_state *crtc_state)
+{
+	int index = drm_crtc_index(crtc);
+
+	drm_modeset_lock_assert_held(&crtc->mutex);
+
+	commit->crtcs[index].state_to_destroy = crtc_state;
+	commit->crtcs[index].old_state = crtc->state;
+	commit->crtcs[index].new_state = crtc_state;
+	commit->crtcs[index].ptr = crtc;
+	crtc_state->state = commit;
+}
+
 /**
  * drm_atomic_get_crtc_state - get CRTC state
  * @state: global atomic state object
  * @crtc: CRTC to get state object for
  *
@@ -453,11 +468,11 @@ EXPORT_SYMBOL(__drm_atomic_commit_free);
  */
 struct drm_crtc_state *
 drm_atomic_get_crtc_state(struct drm_atomic_commit *state,
 			  struct drm_crtc *crtc)
 {
-	int ret, index = drm_crtc_index(crtc);
+	int ret;
 	struct drm_crtc_state *crtc_state;
 
 	WARN_ON(!state->acquire_ctx);
 	drm_WARN_ON(state->dev, state->checked);
 
@@ -471,15 +486,11 @@ drm_atomic_get_crtc_state(struct drm_atomic_commit *state,
 
 	crtc_state = crtc->funcs->atomic_duplicate_state(crtc);
 	if (!crtc_state)
 		return ERR_PTR(-ENOMEM);
 
-	state->crtcs[index].state_to_destroy = crtc_state;
-	state->crtcs[index].old_state = crtc->state;
-	state->crtcs[index].new_state = crtc_state;
-	state->crtcs[index].ptr = crtc;
-	crtc_state->state = state;
+	drm_atomic_commit_set_crtc_state(state, crtc, crtc_state);
 
 	drm_dbg_atomic(state->dev, "Added [CRTC:%d:%s] %p state to %p\n",
 		       crtc->base.id, crtc->name, crtc_state, state);
 
 	return crtc_state;

-- 
2.55.0

