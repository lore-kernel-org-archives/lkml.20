Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCB54FC35B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741113; cv=none; b=S2AtkBjS3YRwYBxbCsff5cJuGwnZZr/v60vc+F8QZnuOYrL2EdWHRanrFtvbej5fj6e9NjfIwkgO+YqlAFv6ZWGUQkYJ7kzvIUsVIeO9zQqU/SrB7YRdk4wIfDE67kDUxIQYnEhbd3YX1h+RDWyLNCSi4TnDNu9c/94Ra1vs2OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741113; c=relaxed/simple;
	bh=wXk2Y5M+awlDWKtwntUWZ0UdnIAVQvnJhc1Lp9fPWU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cY2VFMqvX+0B+Siylgi3qmokPcxLo63xFs6vgVFkT3VG3wOGf9GbQ2R0pqoE4JHQNBcRfrlhcZLuaqClJ0cDEXtnC2r9WzQUv2Lg4E7booRWw/2X5G0H1aAxc5cwJZj4ZjzdnifBCunzcTtlUWNbR2oDOzIS0Fd1QIVn7Ln545c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5iNTDwD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5iNTDwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BBE1F00898;
	Fri, 18 Sep 2026 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789741112;
	bh=wyTpr/ZMCwHBif2mu3Ul/cDM0OI59usyJD3PsBn5vRg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=S5iNTDwDsAEcm82lQlAYVIihKMskQJYvk+1MTogcp6voagEs2BuoXBTAD61U7DL4E
	 TaZ7pnZd2Sy5/Fcs/RYtJZHYNdCk02hkYcDP4Vs3Dc1C/rN/pl5cwAqA14A8a1JI8/
	 me7XXo/OujR4rhS56o4cZlezR/4e+Omh/hbRDJb/GknvxUp0oks5eaLN4zrGS1lOL+
	 tzZkWKcd8F50usuZDYQiI6uqDnldWQtY/ANLIQS6FqtvZ0KO7LlBRCaI7nSHsqDKu/
	 EwqLJ1YxABTblUhJq+VcgL2Y64xDqij5qvi4YBztoRSdg0Ne+vTGBtNVWMlYdO5O05
	 uV5R1iNrgCEwQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 18 Sep 2026 16:17:57 +0200
Subject: [PATCH v4 08/13] drm/atomic: Create function to insert connector
 state into a commit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-drm-reset-state-flag-v4-8-5ad106370f05@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4215; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wXk2Y5M+awlDWKtwntUWZ0UdnIAVQvnJhc1Lp9fPWU4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlrPYTezPpte1OK+daU0qmzv1Wc2Xr8b9FmeZ2fcglf2
 b5JB7bmdExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJbHzGWCvtVNe5OvTSamVn
 bkkHlbKH/05PTDlxWyA4k6ui4KdZ6svSydwbHfdXvPbImaGzNsB7MmPDvMPzquokq+auXhsVGbb
 4QPhe5k3RT7a9PflA+tPtnrnbwnMvriu+Mp0pNTp+x5Fk+y5TAA==
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

