Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677230;
	b=vbpAbCWIJNnTxnknwS6k78b6IZVDfn6ofXYm2U7zzzo0BiFMm11nE0AKejto1qWLQ3rP
	 dRpP2ctCssIuZ4Lja7IZbf3WcYTmv34JykwDKb1BZMM5dpyUVM+7ckK2mLfpbbemkM7y6
	 WfybdQpPUl1xP5ToJWQDiL+vqKIzb7GcwG5sz+aSQ2uaGG8okizcyuLAZmGQFlDgha5f4
	 GSXsHC3xSPnnUXH3uwrTlSdtgYzKr7mKlkL4/lePs3TG4TQTwQ/oMdD/9db0ysUE5hBFG
	 s0H906Q0claeus4lZuMlXboDXIWuKBiYqiiAwx6HsYfnEvQn+vdBp1Lm+JnLWPpS94A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677230;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6OCca06egYWlAwVkTs+cUvuzH9TznyqKs3FaTESZMz8=;
	b=hB0U0tiPRks1PHOGBhT/l2aRVab5l07pFfzfxb0PAjCLzpzeHXQYdx1iH84Rowso1SJ2
	 nvF+hw28R7TuqR+lbisiiooTzBfZlDXBk0PtLMKDkUQ9IOlDhh1vkCLpal82E3aHTo2Tf
	 8ltcQWX5KpjapoJMvVS7GRPeGkBOXME1dKbge98fmnvNkmPdIDkgReEPTrKf+rwNmPogf
	 RYNMXPMY3PpYW+2yc0k3m5xBnW4CwfgcWZEDosef82YQPJmsa8ldS1nFcG8G3wKhiCRtM
	 WH3rMJGYh2s/T+6wt9RpGzJ9DSxKMyEyRunQZtq9ZN+vRX2hfJGTTUAzQ+MjsmTdKGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HjFw8ykO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FD5606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HjFw8ykO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC4D1F000D0;
	Thu, 22 Oct 2026 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677229;
	bh=6OCca06egYWlAwVkTs+cUvuzH9TznyqKs3FaTESZMz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HjFw8ykO/avO9Ytc2N17PWDN9aYbwBV+6KB0j+dZzU4PrikLQntPW5FWpZU7R2GQK
	 cViNXx5R5SaKSprWJaIydZZZAsipWA1TS6VXA6jBrehCchP2JzU+J9Jznz0ii7I4KU
	 LaS4lNc7HfjQLvYAC8BoYCAJY6RAHxaparv2++Tre4/8ZtTM23m+plgy9XzkoLXH38
	 IftiAA2qf4jk9ReGSWaqqvpcfaMTJHETQLJUP80eQ16Anik8YBswOHFZxjKLWFpEKp
	 obFDkBS91TElyoBC0pTA146O3Pnql4aThNeMQnijGPYJ6FelRrP+oOU+rUh1EP2zu/
	 lqCEjRMRbj1Aw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 15:53:10 +0200
Subject: [PATCH v6 09/15] drm/atomic: Create function to insert connector
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
Message-Id: <20261022-drm-reset-state-flag-v6-9-f36d640b7e76@kernel.org>
References: <20261022-drm-reset-state-flag-v6-0-f36d640b7e76@kernel.org>
In-Reply-To: <20261022-drm-reset-state-flag-v6-0-f36d640b7e76@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3RN0/7Pu090nGToPncbkW+1tk/9593/dT8ubETKZzf
 xo8Q22udUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ9AQy1nCszmd79vrFSikD
 tbDzLQq3W/a8FhKysTKI0b8cqjUzPbr7awNfvvAFhXhFZY2+J/5BjPWh03Lm8KRvVj7+Oylww1l
 7oVAG96MdpqH+j/kD/h3rX3nh74f2sE9Hn5+/P6PFuaNU6wgA
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

