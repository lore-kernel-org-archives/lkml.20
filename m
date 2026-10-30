Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356104;
	b=qQs513hu7i4luednBq2QUPOGCrbYZHvChmqZoz15cAKJu8p932notsK7h/BDx8dTugjM
	 Ig5cmIg4/3JpZ25b5YfXg8B4jGA3/a1KFbLYtFcM4KvduQwJfxCDe57Hl9OXnDwGxwfMD
	 fTgGVXnJIyhZ4P4u9wzoRsn3J67paoRPAK3yzt7S0g0mF5Z53bcD8gjhtGTEkBLtlytBM
	 hppFzuNAJAigF0WLY84gu5sCGp0Hvs1hTXDbb+cVP2fi467IRr4DCf21rjopDW0aggSfa
	 8ofEhjxbLX56vszrEAu7Nv5ugFa8l7jjKxaONn2NMDh+15rZN9+m+UBPawLJ+5gesyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356104;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6OCca06egYWlAwVkTs+cUvuzH9TznyqKs3FaTESZMz8=;
	b=NrEdsIR6qll5QTPHOt0zZKgoWkrnjXI0pPieb2q6ewKVHnoJZZu6qpyvlkxwfyZm1BBi
	 8kigFTACDS70u1A5Ecwsr3TKUHFfMp+FagYzTVT5nfMgQv9Tnjwn3tLy3fO4a5ltTSWWE
	 Tl04hhGKdKlFauBmFRrPeMydxX9BWo7KUkm2dbfBCdi37oc84kJV9BZxtr1s1xtH1Eo70
	 Wjf8wwT5bacF2AK3tAaAvPGtdg++HQVUR/k3D77miTqDvJigi5lRQl61NPpUN2z8TUF7I
	 MQpclEdMgdhsMMQADwBo53BJrqVsJP4qmdYK0uwm1aaoLDry9I7LQ75uFuQ2Y6UwlKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPnplA+x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ADB60A2620
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPnplA+x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357401F00A1C;
	Fri, 30 Oct 2026 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356103;
	bh=6OCca06egYWlAwVkTs+cUvuzH9TznyqKs3FaTESZMz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WPnplA+xG76zk2UicysALls3t5bj55ZxKPgb/mWE51U2KBViAbEp49n3FQ5m1WABp
	 txSEPJbghI37ycWEwnNid7DJzQg4CttCSGSbA0Jj4z1rJTfoGZnKy4UrxsAcQaOwFx
	 +51jXhcAGy+6hWvGBLkuFHoATjPQBveUSfjW8kiIMXyiwSwJGXNBSlCtYNSH64d+am
	 apP4sHeRSjnt2V4Z6ibCzvLWg0tlYjTo0DMHcQGe9F8DffrjSVoEs+1meFIvX1HX0u
	 cWoiCPHILeIXEZTW10CHv4PLPq6jm4Xu1jwhK4McuxBKZrqUVVnpIBWXws5hmkfsgj
	 hOPLEL7Q0GJ6Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 30 Oct 2026 11:27:42 +0100
Subject: [PATCH v7 10/16] drm/atomic: Create function to insert connector
 state into a commit
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
Message-Id: <20261030-drm-reset-state-flag-v7-10-4e55eaeae683@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3841; i=mripard@kernel.org;
 h=from:subject:message-id; bh=4N1f/VazZl18ma1rQKS+o923euu0mcNJmmmZyREtvXg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlPCqUD/GW/cFqvfPJ9i6T3OpUjVpNV5Tdu2HTY6ZvRB
 NOyO1e3dUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJlKxkbJj7lWNSyQW9fd5r
 tjceU2erVBWd3xcaV9iw7WBMgOH9fAvHirfWU5hET35Nl97g/2TuYcb6tM+9sbO73/Q5HZggJ/1
 Lfs98JSUennWTziVrulau8KtUvN2rFbl/YdfCW3dlk51+bKwEAA==
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
@@ -1405,4 +1405,36 @@ drm_atomic_get_new_crtc_for_encoder(struct drm_atomic_commit *state,
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
@@ -1423,5 +1455,5 @@ drm_atomic_get_connector_state(struct drm_atomic_commit *state,
 			  struct drm_connector *connector)
 {
-	int ret, index;
+	int ret;
 	struct drm_mode_config *config = &connector->dev->mode_config;
 	struct drm_connector_state *connector_state;
@@ -1434,19 +1466,4 @@ drm_atomic_get_connector_state(struct drm_atomic_commit *state,
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
@@ -1457,10 +1474,9 @@ drm_atomic_get_connector_state(struct drm_atomic_commit *state,
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

-- 
2.55.0

