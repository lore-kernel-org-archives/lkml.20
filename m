Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE574219F2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135950; cv=none; b=SQ7u33qKQzhf2PAj0kZDbKQUtCSVglmEyZcq4bdxCwYQPPNK3my5E4JKvyejfSoWwGO3zM6wxGKAF4zH7piYK4XUlFfnA1hi4aQuqpykcBabeqHkWd56BtNC+XaRxyXhblEadO4bY4nTB9NC6gZab1H83jvG+96NJPN1Nh9TWVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135950; c=relaxed/simple;
	bh=GGroTtS/a57EsiNaGvVZs9n5vD89gX7/Y5Iw83ZVLxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q2qA4rdp5AjyBCXnUxGZX4BHoIk1fV8aMqfhnhzxAIbiHlHpp0mM+1aSELPVX0O2QDlMEFSq5DFSxZuD4qPIzOnV8VJaWJAnrVCc1a/wRdFGkLeHtHU9KdRe5bgG9lyNhCZXTsBFGeyCRVmJjYry29cHU0TG04NgdXlAVvsl1f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OrGj5kDu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OrGj5kDu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F9B1F000C4;
	Fri, 16 Oct 2026 07:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792135948;
	bh=VP9qYQlpov1TS0hX05NklVCYCqPiv0odnnRUv7qqG6s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OrGj5kDu/MdOga8a4BvAuT5yRr66U/1YFaqrgvCdT2dxgCxB/hE0jIDYhbMedcncQ
	 XXHJpabAQPQ7MQ07mL1iVRp8aYxRjl1d3VcN28mX19I4hutjpzRSuidkoPfBtn+qjl
	 +ydPQewHYH7dpgqkaps2CgyqlkZYuTgNDp2qfZFGjd1tilwZp+gpCCblRrwXcjBsoI
	 hb8ONUnaRcmB9p463Yfd9En+bws+Da+XmV6KtVXGZSPvPSL3C0qTt9kBVG/KFGP6B3
	 c01ageOE4leriA/0I8kr1RJBcXSkbr8GCFY2vBC5mMvpy6PYibwHUAVSzTRwF1gJrB
	 2hfl88+x7sV4g==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 16 Oct 2026 09:31:40 +0200
Subject: [PATCH v5 08/14] drm/atomic: Create function to insert connector
 state into a commit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-drm-reset-state-flag-v5-8-dad2d64b693b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4266; i=mripard@kernel.org;
 h=from:subject:message-id; bh=GGroTtS/a57EsiNaGvVZs9n5vD89gX7/Y5Iw83ZVLxc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkXLz0Rz7tv7MP1dndgYNqNEy23LCY2JTPnS0lkT7sTI
 ZYzd/L3jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRbi7GOgt2nwnVHIILdVd/
 uHdC/YVUmlUh+z2rmZ6i75TMnt3998i2uf2bkU1Vf4Xpc9P36ySXMTY82XxHQzSt1zPozNMUju3
 tzKXT/i4UuPht5r8cNRVxvnlrPqxN5Qw7kdz71FzYjdOMYxoA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_get_connector_state() allocates a new connector state by
duplicating the current one and inserts it into the atomic commit as
a single operation.

However, a later change will need to insert a connector state into a
commit without going through the full allocation and duplication path
in drm_atomic_get_connector_state().

Extract the state insertion logic, including the dynamic array
reallocation, into a new static
drm_atomic_commit_set_connector_state() helper, and convert
drm_atomic_get_connector_state() to use it.

Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 60 ++++++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 513e91ad2fdc..81591173265d 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1402,10 +1402,42 @@ drm_atomic_get_new_crtc_for_encoder(struct drm_atomic_commit *state,
 
 	return conn_state->crtc;
 }
 EXPORT_SYMBOL(drm_atomic_get_new_crtc_for_encoder);
 
+static int drm_atomic_commit_set_connector_state(struct drm_atomic_commit *commit,
+						 struct drm_connector *connector,
+						 struct drm_connector_state *connector_state)
+{
+	struct drm_mode_config *config = &connector->dev->mode_config;
+	int index = drm_connector_index(connector);
+
+	drm_modeset_lock_assert_held(&config->connection_mutex);
+
+	if (index >= commit->num_connector) {
+		struct __drm_connnectors_state *c;
+		int alloc = max(index + 1, config->num_connector);
+
+		c = krealloc_array(commit->connectors, alloc,
+				   sizeof(*commit->connectors), GFP_KERNEL | __GFP_ZERO);
+		if (!c)
+			return -ENOMEM;
+
+		commit->connectors = c;
+		commit->num_connector = alloc;
+	}
+
+	drm_connector_get(connector);
+	commit->connectors[index].state_to_destroy = connector_state;
+	commit->connectors[index].old_state = connector->state;
+	commit->connectors[index].new_state = connector_state;
+	commit->connectors[index].ptr = connector;
+	connector_state->state = commit;
+
+	return 0;
+}
+
 /**
  * drm_atomic_get_connector_state - get connector state
  * @state: global atomic state object
  * @connector: connector to get state object for
  *
@@ -1420,50 +1452,34 @@ EXPORT_SYMBOL(drm_atomic_get_new_crtc_for_encoder);
  */
 struct drm_connector_state *
 drm_atomic_get_connector_state(struct drm_atomic_commit *state,
 			  struct drm_connector *connector)
 {
-	int ret, index;
+	int ret;
 	struct drm_mode_config *config = &connector->dev->mode_config;
 	struct drm_connector_state *connector_state;
 
 	WARN_ON(!state->acquire_ctx);
 	drm_WARN_ON(state->dev, state->checked);
 
 	ret = drm_modeset_lock(&config->connection_mutex, state->acquire_ctx);
 	if (ret)
 		return ERR_PTR(ret);
 
-	index = drm_connector_index(connector);
-
-	if (index >= state->num_connector) {
-		struct __drm_connnectors_state *c;
-		int alloc = max(index + 1, config->num_connector);
-
-		c = krealloc_array(state->connectors, alloc,
-				   sizeof(*state->connectors), GFP_KERNEL | __GFP_ZERO);
-		if (!c)
-			return ERR_PTR(-ENOMEM);
-
-		state->connectors = c;
-		state->num_connector = alloc;
-	}
-
 	connector_state = drm_atomic_get_new_connector_state(state, connector);
 	if (connector_state)
 		return connector_state;
 
 	connector_state = connector->funcs->atomic_duplicate_state(connector);
 	if (!connector_state)
 		return ERR_PTR(-ENOMEM);
 
-	drm_connector_get(connector);
-	state->connectors[index].state_to_destroy = connector_state;
-	state->connectors[index].old_state = connector->state;
-	state->connectors[index].new_state = connector_state;
-	state->connectors[index].ptr = connector;
-	connector_state->state = state;
+	ret = drm_atomic_commit_set_connector_state(state, connector, connector_state);
+	if (ret) {
+		connector->funcs->atomic_destroy_state(connector, connector_state);
+		return ERR_PTR(ret);
+	}
 
 	drm_dbg_atomic(connector->dev, "Added [CONNECTOR:%d:%s] %p state to %p\n",
 			 connector->base.id, connector->name,
 			 connector_state, state);
 

-- 
2.55.0

