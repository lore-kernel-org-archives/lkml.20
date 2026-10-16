Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583573E558F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135943; cv=none; b=qST/2y5Z7dD1x3sTmkXYgGKp5VqICS+Pj8mT9XZMDStAZQt5xXBfjW6Atcp/8nFUm+hcIPOuMSxkm4pozrwc1q+lcUqeawA0c0bx5irq6hCQgak/owrWskLsFq73CZy032ydaoj+4LvyecAq3RFfeuruljVIR/bMdHcuBYdh+YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135943; c=relaxed/simple;
	bh=zNcs7+qm9vBMoxymLjhKYQQ7h6RxRbv20qwl0ST1XsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gz1zMq14JcpieykJ9GyoooJZF1UfkrtC4bhpRC58lG2y3EgEU25d11RH9VA1+Pqq+ajDWH8LIqGsKvfFsWaGpVFfAKigBijYmIrPMFn3G+adIFLnT6PWULdwzAXXSe4zTJppVHVQ9JIPFV8n2ubzPamjmWsotLnR4eV9djzhBe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2uo5AqA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2uo5AqA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAC21F000C4;
	Fri, 16 Oct 2026 07:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792135941;
	bh=TFxcbguLUVDbJo+3W9hN+xXu1muwi+d7iaXkEhvopfA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Q2uo5AqAhUw7P4um/AeAjJL3mijGH12ez1TBECMtypTswIjszAzFKzmqVzRv5+twp
	 FAhzgPdRF8Fh0Himc87jXLM/+US07MmSWcKXem9pQX1SCdRuhj8NuuRSNnEQsIEd1B
	 OgCS9bBGU4SBIfcrlbdLRX1Oehof5RmupO4iLBWI7EiLEhqpphGDFz7dvQIoNq5l39
	 fv0SUwhO67ofrogSQKb6itjv07NPy30pLgvE9SLoCfrBgI/aWJ10nxlzZztBQtW95/
	 qh3ZGP7d9GenjmW2QuSzRTOb0pKpHxbnLf7+/Oct58XYvrzt9KlunDOWy+4hbLuPHw
	 LuaNSXBx2elhw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 16 Oct 2026 09:31:38 +0200
Subject: [PATCH v5 06/14] drm/atomic: Create function to insert colorop
 state into a commit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-drm-reset-state-flag-v5-6-dad2d64b693b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2932; i=mripard@kernel.org;
 h=from:subject:message-id; bh=zNcs7+qm9vBMoxymLjhKYQQ7h6RxRbv20qwl0ST1XsA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkXLz2OWh4utGffI5P9H+O/v3+jaaHWlDO5P0OD/wVHl
 EY6s/vfjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRNFvGho0PM/W2WX1ddfWV
 nc2dWf6cLAr6jgprD6/kO1Of+uLMPEG3qoDb8xY6OAhuMbHPLq9/ytjQ5PbjVTSrHJvJvc+Pfc3
 W87aZa0k61BU/W1WpFiS/MDmHY9b+rIXHTs/acUBYumOrQgEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_get_colorop_state() allocates a new colorop state by
duplicating the current one and inserts it into the atomic commit as
a single operation.

However, a later change will need to insert a colorop state into a
commit without going through the full allocation and duplication path
in drm_atomic_get_colorop_state().

Extract the state insertion logic into a new static
drm_atomic_commit_set_colorop_state() helper, and convert
drm_atomic_get_colorop_state() to use it.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index b26458ee98d8..807b575ecc54 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -702,10 +702,25 @@ drm_atomic_get_plane_state(struct drm_atomic_commit *state,
 
 	return plane_state;
 }
 EXPORT_SYMBOL(drm_atomic_get_plane_state);
 
+static void drm_atomic_commit_set_colorop_state(struct drm_atomic_commit *commit,
+						struct drm_colorop *colorop,
+						struct drm_colorop_state *colorop_state)
+{
+	int index = drm_colorop_index(colorop);
+
+	drm_modeset_lock_assert_held(&colorop->plane->mutex);
+
+	commit->colorops[index].state_to_destroy = colorop_state;
+	commit->colorops[index].old_state = colorop->state;
+	commit->colorops[index].new_state = colorop_state;
+	commit->colorops[index].ptr = colorop;
+	colorop_state->state = commit;
+}
+
 /**
  * drm_atomic_get_colorop_state - get colorop state
  * @state: global atomic state object
  * @colorop: colorop to get state object for
  *
@@ -721,11 +736,11 @@ EXPORT_SYMBOL(drm_atomic_get_plane_state);
  */
 struct drm_colorop_state *
 drm_atomic_get_colorop_state(struct drm_atomic_commit *state,
 			     struct drm_colorop *colorop)
 {
-	int ret, index = drm_colorop_index(colorop);
+	int ret;
 	struct drm_colorop_state *colorop_state;
 
 	WARN_ON(!state->acquire_ctx);
 
 	colorop_state = drm_atomic_get_new_colorop_state(state, colorop);
@@ -738,15 +753,11 @@ drm_atomic_get_colorop_state(struct drm_atomic_commit *state,
 
 	colorop_state = drm_atomic_helper_colorop_duplicate_state(colorop);
 	if (!colorop_state)
 		return ERR_PTR(-ENOMEM);
 
-	state->colorops[index].state_to_destroy = colorop_state;
-	state->colorops[index].ptr = colorop;
-	state->colorops[index].old_state = colorop->state;
-	state->colorops[index].new_state = colorop_state;
-	colorop_state->state = state;
+	drm_atomic_commit_set_colorop_state(state, colorop, colorop_state);
 
 	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d:%d] %p state to %p\n",
 		       colorop->base.id, colorop->type, colorop_state, state);
 
 	return colorop_state;

-- 
2.55.0

