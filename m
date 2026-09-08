Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C65654B1C8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878130; cv=none; b=HQa5ZSg+vx4AHsK1phk8qgouO5V13ErHtKsZczbEra6qNz9TjNPpq66uXrAzW6PUDNYOo/onO0qnMyv3FNchmPReOOEVt2pfVC/K355E05rlS4jrveFFCa9qa5RJVHoe9fdGC6XStHEEe0pB70PfDIk7hnIpWa3zYIfCVm7C5Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878130; c=relaxed/simple;
	bh=tUdqkKg02G7pZNM/cxmM4hrdK64B6/77cjhDvSy80wQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H/cX90VrZxfsJXUgnJqk4YI+bYT+WIFn7n9nIrcMLnQ58o31QaYjmF949v+2zvNUosNqguo/ecq516CmHf4srS9gpagzb9y9Kw7g6w0W4+O5RNpbUNuAJFaAn+caHMpDvtcpu3R86E9e4mhV3SpppywpxSzNZlByFx7rbuwSE9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAcXXL2P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAcXXL2P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B6B1F00A3E;
	Tue,  8 Sep 2026 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788878119;
	bh=rhbPg4XZXLlcdCtHG8r7d95+Q7hYT+p0CMQ+ukMM0+8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dAcXXL2PVD9eNa8FkFtNSvGEAy3REIco//NLmuzoZ0y+sqCNGOXo70KxKPkbshKjb
	 7ME4qeK26032suIE27/BdFJPz+JuNtde+5Dy6VvYOZFFdut0Gnh9O7IK9iWt5yxP+S
	 up0Nni72Kx/gLFCTz15ymwXjl2phG0KRn5ilQ7f4js28QQhwjMVibRw4jqu9Th5r5G
	 ezG8bkqOKmqpCA1vM+0tXC41eUnjsmAwFXuB2+BxK/SgLu47JWM/JGnSIvZXQzDnz9
	 lFuE8fzH3kOsfZNhxRHAEFrmAEBPo7F5Q3IxrDkGGxeg0Eaa6pZcd01WMYGzNxBTpL
	 /5tLmJ0cq//ZQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 08 Sep 2026 16:35:02 +0200
Subject: [PATCH v3 01/11] drm/atomic: colorop: Rename state to
 state_to_destroy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-drm-reset-state-flag-v3-1-905570f387a4@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3757; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tUdqkKg02G7pZNM/cxmM4hrdK64B6/77cjhDvSy80wQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkLZKV5+ObIWmew+75udTTa2twZEfP4ghLHfe6cpD1LF
 nYuEPfpmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABPZxcjYsNRsylRB30wXEdPd
 Tv+PT2nufr9Hft1iT1dZ9f0vL2Z1HUq9mzml6ajIhH+3b7yr37llI2PD7ufflN9qHSk+m+MtnPD
 q8i7eE32yerwz/lYZXZknfaOLNVvfYe9mLebNzY7fWj5pK6QCAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The atomic state tracking structures used to have a generic state
field to track the state to free when tearing down the
drm_atomic_commit. It has since been renamed to state_to_destroy in
__drm_planes_state, __drm_crtcs_state, __drm_connnectors_state, and
__drm_private_objs_state to better describe its purpose.

The colorop support has been added after that rename, but
__drm_colorops_state still uses the old state name. Rename it to
state_to_destroy for consistency, and add the matching kerneldoc.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c        |  6 +++---
 drivers/gpu/drm/drm_atomic_helper.c |  2 +-
 include/drm/drm_atomic.h            | 18 +++++++++++++++++-
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 45df6376f408..5c0f7b7024d1 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -341,13 +341,13 @@ void drm_atomic_commit_default_clear(struct drm_atomic_commit *state)
 
 		if (!colorop)
 			continue;
 
 		drm_colorop_atomic_destroy_state(colorop,
-						 state->colorops[i].state);
+						 state->colorops[i].state_to_destroy);
 		state->colorops[i].ptr = NULL;
-		state->colorops[i].state = NULL;
+		state->colorops[i].state_to_destroy = NULL;
 		state->colorops[i].old_state = NULL;
 		state->colorops[i].new_state = NULL;
 	}
 
 	for (i = 0; i < state->num_private_objs; i++) {
@@ -706,11 +706,11 @@ drm_atomic_get_colorop_state(struct drm_atomic_commit *state,
 
 	colorop_state = drm_atomic_helper_colorop_duplicate_state(colorop);
 	if (!colorop_state)
 		return ERR_PTR(-ENOMEM);
 
-	state->colorops[index].state = colorop_state;
+	state->colorops[index].state_to_destroy = colorop_state;
 	state->colorops[index].ptr = colorop;
 	state->colorops[index].old_state = colorop->state;
 	state->colorops[index].new_state = colorop_state;
 	colorop_state->state = state;
 
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 285aac3554df..c4752bd7d999 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3349,11 +3349,11 @@ int drm_atomic_helper_swap_state(struct drm_atomic_commit *state,
 		WARN_ON(colorop->state != old_colorop_state);
 
 		old_colorop_state->state = state;
 		new_colorop_state->state = NULL;
 
-		state->colorops[i].state = old_colorop_state;
+		state->colorops[i].state_to_destroy = old_colorop_state;
 		colorop->state = new_colorop_state;
 	}
 
 	drm_panic_lock(state->dev, flags);
 	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 88087910ab1a..00b3e9fc429a 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -157,11 +157,27 @@ struct drm_crtc_commit {
 	bool abort_completion;
 };
 
 struct __drm_colorops_state {
 	struct drm_colorop *ptr;
-	struct drm_colorop_state *state, *old_state, *new_state;
+
+	/**
+	 * @state_to_destroy:
+	 *
+	 * Used to track the @drm_colorop_state we will need to free
+	 * when tearing down the associated &drm_atomic_commit in
+	 * $drm_mode_config_funcs.atomic_state_clear or
+	 * drm_atomic_commit_default_clear().
+	 *
+	 * Before a commit, and the call to
+	 * drm_atomic_helper_swap_state() in particular, it points to
+	 * the same state than @new_state. After a commit, it points to
+	 * the same state than @old_state.
+	 */
+	struct drm_colorop_state *state_to_destroy;
+
+	struct drm_colorop_state *old_state, *new_state;
 };
 
 struct __drm_planes_state {
 	struct drm_plane *ptr;
 

-- 
2.55.0

