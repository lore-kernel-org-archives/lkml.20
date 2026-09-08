Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01266548551
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878141; cv=none; b=pXWAAI9xNHP8o92KnEyOWEBL25kynlOiCLSY/IWqpbs+CC4tDeQcaZkEik6JRWrJUopJn2JXLDVhf4BSCLJaXTReY1NM6ZZommItAWEPKzmEGdppieKkZ8GDLcOqUuNvuFKxaR6XcFAw8kenrWo3BIrYVidyAN4sXWMgiKFV2T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878141; c=relaxed/simple;
	bh=norOsKJSzhagJvOfVR7DhL/TvimASvnyTfHuJ3JakF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IzAVVec4QRElBm2A2/MDrZk7T73vL8tyl7eUwSVlLidmL2B7z5pOz2n+nmQbhjXKmjCniedQIGZodZ0TXy6fIaRvr1FzrchLxoXBsFtuulBl2JcbAt8Di4r6u8dTHJOJTn891ZwFVNsySA9M2sLGsSPlDS+rnbtZVtCTh+j6uGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEoB3Kdu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEoB3Kdu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815EE1F00AC4;
	Tue,  8 Sep 2026 14:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788878131;
	bh=XMX13DtPDDnyfrT120bG1968XXiMmSlCAD2GolHcyVY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GEoB3KduVPc01tcYEIO5KOnyQn8BuXVS+a4NBE7w49HkSSc0rYPbkiqEq/ssz2IO4
	 +ZQnc1rlTsoI8tZeMGB9tZpupdB+Rssb2ATAQKjUfwJfJy0XGpVGWiCoSOFyD7YYfD
	 4ZbzuRS37eTW3k4vZwK7v31rCdcLzbmit1Ynj8W2MsQsLeXyOMnETuIrHetrLwAezG
	 pyeq3xLCnKCHZTRnq2IO+GZcvPNu0Y8Vw4CV3mGTHqQvDYd8rE4qdoSjEx7fKT31yb
	 W/0GwK2FkTUD/nfNX4/K7AEWOiRkT+jDTyMtEW7Sv0/IftZ9BK9RFgg8xUSJnuK1bc
	 n32ddQ0NavmVA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 08 Sep 2026 16:35:05 +0200
Subject: [PATCH v3 04/11] drm/atomic: Create function to insert colorop
 state into a commit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-drm-reset-state-flag-v3-4-905570f387a4@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2972; i=mripard@kernel.org;
 h=from:subject:message-id; bh=norOsKJSzhagJvOfVR7DhL/TvimASvnyTfHuJ3JakF4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkLZGX627PvOfkniETfr0q78jYrODRLPD22dNtsd79q2
 1P2ToYdU1kYhDkZZMUUWZ7IhJ1e3r64ysF+5Q+YOaxMIEMYuDgFYCJBdxlrBY9N2cI/O6HI8Abr
 Elk/tndxlXdt7lkdXnFl1+zQS7wFm+zLNL+907l0wkIg/Kb79qtpjPU+s9TM0y4psM7+2P3P+/6
 jbysOLHNasnduqMKauHZP7pCNOhoXmRbtsQxi/PuhRc+C7TQA
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

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f62323679f44..f6a31c9d477d 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -704,10 +704,27 @@ drm_atomic_get_plane_state(struct drm_atomic_commit *state,
 
 	return plane_state;
 }
 EXPORT_SYMBOL(drm_atomic_get_plane_state);
 
+static int drm_atomic_commit_set_colorop_state(struct drm_atomic_commit *commit,
+					       struct drm_colorop *colorop,
+					       struct drm_colorop_state *colorop_state)
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
+
+	return 0;
+}
+
 /**
  * drm_atomic_get_colorop_state - get colorop state
  * @state: global atomic state object
  * @colorop: colorop to get state object for
  *
@@ -723,11 +740,11 @@ EXPORT_SYMBOL(drm_atomic_get_plane_state);
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
@@ -740,15 +757,15 @@ drm_atomic_get_colorop_state(struct drm_atomic_commit *state,
 
 	colorop_state = drm_atomic_helper_colorop_duplicate_state(colorop);
 	if (!colorop_state)
 		return ERR_PTR(-ENOMEM);
 
-	state->colorops[index].state_to_destroy = colorop_state;
-	state->colorops[index].ptr = colorop;
-	state->colorops[index].old_state = colorop->state;
-	state->colorops[index].new_state = colorop_state;
-	colorop_state->state = state;
+	ret = drm_atomic_commit_set_colorop_state(state, colorop, colorop_state);
+	if (ret) {
+		drm_colorop_atomic_destroy_state(colorop, colorop_state);
+		return ERR_PTR(ret);
+	}
 
 	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d:%d] %p state to %p\n",
 		       colorop->base.id, colorop->type, colorop_state, state);
 
 	return colorop_state;

-- 
2.55.0

