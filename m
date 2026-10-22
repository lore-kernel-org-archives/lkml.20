Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677219;
	b=nBZVUHlCBpjrTIBtHvfk9Dt4mdbEpB4759p/ZCzYlAnb5T4N8Yewo0HGvMVvpd4ZV9Ed
	 J4HVuAMJKMiqtOjXokc85p1oCcYt4iY91qQ1GqoIsfvWz3Wq81Kfyb+XN2aULfdsyupze
	 vezDwpmFWd45tygPoH7VUr5GHxhIWc1ufAGLWl7ANJdpSvoxCaomipRYYP2/HhBpJHBaB
	 EiDGZjMYJPkWnrLSlZE/2x/et5Gjkyn/JW4bHvFHyoSQyrqslbovKRvaQniFAu2JrGtpG
	 DUElTXkrJWkcikWeiCT4NxaZaYYc0GY0qI29C3y+qvufIzDOLv75cdVlk68a8eH1fqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677219;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=mTDmY50binhv4KAhOwDjYuuuzxrs3fracWCulNAzN7A=;
	b=hWMXoYfYyQsfvoqhxExBTTsFrPqORROB+xqUYBPRvGUhcD9z4U3xV2MGREu8yKRLMfwW
	 4TkV2vh/qCNgqf+9fTDDgLpfzVY4jB0lGaRr54CO/a6s/IBVJCEUB5+R0d5Q/0Uo25ck4
	 6hnW7zKakdab4w/pbnit+rqOQ12WxwumWrKgFnoq+JOe+toqqDO1ZP10uaCGThzo6aPms
	 ReFg5mCb5BgpxPMgAv9KHNyym65Xk6uY+wUUt8S09K6C6Cs7dc1eV2HgZ6dWrQ1acglit
	 1uWP3amwt/BymCzF6DXtemqKOcOMOosDRGBJx+V1UJukW/AsuRa8cAaElx1h8FGGE/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jjKTsqfu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F85606A326
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jjKTsqfu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD1F1F000C1;
	Thu, 22 Oct 2026 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677218;
	bh=mTDmY50binhv4KAhOwDjYuuuzxrs3fracWCulNAzN7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jjKTsqfuU60TMwiTZt8Z4AaEEIgXoh1AYVIfhKzAHT3foYHIPstJiAXoiajRzOdni
	 NTXDGcuNHPHD6/TQ96bFG/8O2K5Ef4x07D+uMAvRAOV30Ukz9ha2CrJE6+D9QDD9ns
	 0BB+pro278zIMZ+7YzD+ibfXrRoM+ZtKwlU9uJ8/yNo5KTV7wKrCjVwiC6C92JU2ln
	 +fD0Tw1/Nbt+zHHdTs5YX7OeQQRq+Iq+LgEPUnM5Z7qCnRWMXP0SyjQASHKFdKQ00Y
	 3oeZGCxtoT3eo3TVLENXb0eKVVGo6TfSDq0L9jXt9kEjHLpMN5D7eiCsgXvt2ZXtGP
	 te608JMZSsydQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 15:53:07 +0200
Subject: [PATCH v6 06/15] drm/atomic: Create function to insert plane state
 into a commit
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
Message-Id: <20261022-drm-reset-state-flag-v6-6-f36d640b7e76@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2304; i=mripard@kernel.org;
 h=from:subject:message-id; bh=41LUGhYJAROn0oZPZrkQUy7D8c62RSMKcGFPg+lAdDc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3RF3LqgujlXqcVY3dRXYw2d9VfJRZYmB6Mf/FJq/Hr
 ry6GZ87prIwCHMyyIopsjyRCTu9vH1xlYP9yh8wc1iZQIYwcHEKwERucDI27En7FRPL5u40Nyq4
 XVSv6flG+e+vN194O+X4BcnHBdEnE5ol3zryXbIqmnyo+OSr7f2HGRuOfdvGluWhrVGaVXmkkuf
 9qi8n580XW3x5naIK79TGEw+m5U8pfadbeEXsTmfF4+fV758AAA==
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
@@ -631,4 +631,19 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
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
@@ -649,5 +664,5 @@ drm_atomic_get_plane_state(struct drm_atomic_commit *state,
 			  struct drm_plane *plane)
 {
-	int ret, index = drm_plane_index(plane);
+	int ret;
 	struct drm_plane_state *plane_state;
 
@@ -672,9 +687,5 @@ drm_atomic_get_plane_state(struct drm_atomic_commit *state,
 		return ERR_PTR(-ENOMEM);
 
-	state->planes[index].state_to_destroy = plane_state;
-	state->planes[index].ptr = plane;
-	state->planes[index].old_state = plane->state;
-	state->planes[index].new_state = plane_state;
-	plane_state->state = state;
+	drm_atomic_commit_set_plane_state(state, plane, plane_state);
 
 	drm_dbg_atomic(plane->dev, "Added [PLANE:%d:%s] %p state to %p\n",

-- 
2.55.0

