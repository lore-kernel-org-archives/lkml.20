Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677201;
	b=STKeDF3GEwQtqH3y/vZNCykLz/j0ziz9PpU7azz8Re8hPuTodf6DjTY/dxE9JyWd5qg+
	 5pjmPTD4JalF09KUp9iRtWO65pIjF6BxcpLwIE7/pq+qGIaUCUyYuhcN7Vizl/Mi6v2a1
	 C9LDpZ4pkFi/FwFMr+LQrs+yw7CkmEhDIMvCzPKx8G/TqndK58Z5InK/HTRfGvNyVk0iE
	 p+UO5zM4n+kulacxyLB2lKE4p2cXHsk2Lvh48GztPLmAA7smevxzvz9T8zJlu6DRqxpnx
	 t1a2NB7YOvoCgZw8pUVvQ/mw/czYSoRXdCYRn4d/UGtvaLtUrpNvvnPeyhgXYuPejvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677201;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=HRt7WehTKctLnGbeC7pLAnadKrHTL2sk3kSDhLhx7zo=;
	b=194RBogsscX9k8ZcqLHnWctzU/VM2sHqhquFXJK/B2hhNWSKjTJk642M5k66jiLtLZs1
	 Kde/ET34TkReFlWUydqHmp3s7jo8uXUEz77gTO10kQS9Qc+HGdyv9+u5fpSKNJeF+s5x/
	 mLsLK29JgnmMbTcDWOhmZk3o1+0kf1XOEgSP73Y4MIKTz0K5uUw8Qd5Jm5L/4s+bpLXhZ
	 YyfWEiPXbsflG76VaWoK3QWEUoR/h75kL8OyUF745CH9wVKXkMyacYpQJM13bRt5lgiVK
	 qPnNbpnXVe9YvL79Nd4iDpzAChbU7sTqAE/3RPB1bGOtwzQVeu9A+pI9XhbLXnAPupw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L+57qLBu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724DB60A2609
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L+57qLBu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940B51F000D0;
	Thu, 22 Oct 2026 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677201;
	bh=HRt7WehTKctLnGbeC7pLAnadKrHTL2sk3kSDhLhx7zo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=L+57qLBuGwCRdPb+IrY0wdf3hAeqmn9FYqvH9JM3eWEPUmPTFxh1cCricOrjbvG/j
	 ku4JsLFdJyakWLo0wEaCIX2jayOztmolQttZ25pMQf3TmZzTPjH/VCA7lzuG1wBj8z
	 spTWtyT7dKGgPy5V+THGwmPx/t9EvlZHDGNvhhIR+R8DurPWOxLvuUEXUsvnZnWeIW
	 /yVUQJfOIwAL7bZo7G6FSzbD4wRh56USkobymqjuu97n9v+tNPgpjqgYaBuZdg2qvu
	 o57ekE1lOpLYQzMnXLz2IW3HGwQkv2zeA2wE9mH5zymwkM2ZdYDjmSy+kwkwxnyX2P
	 kyPMQI6BvYxmw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 15:53:02 +0200
Subject: [PATCH v6 01/15] drm/amd/display: Fix planes atomic_create_state
 implementation
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
Message-Id: <20261022-drm-reset-state-flag-v6-1-f36d640b7e76@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367; i=mripard@kernel.org;
 h=from:subject:message-id; bh=jPfBSx0AuI4AiSP23xvBSmuv7S2aZHPRkqVpdnQnLP4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3RJ1ddpyrlnhcP91Y5H671vN3BTvfGEanXXHh/rqlr
 zFAJ+1vx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIbC9jvU/0zN++11+/Wd4t
 vujlR2mly9bHGBPXn5W7PyOx/kTvqkeXX926EtuxRGd5Wa1fX67QU8aGW+XKvZnHH7bOlHh1aFP
 T/KPm/dNds43rM8WONpc8sdSdfkapecqcY7ay3uyr6uyZ89cBAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Commit 2bcec01cf105 ("drm/amdgpu_dm: Convert to atomic_create_state")
converted the amdgpu planes to use atomic_create_state instead of reset.

Unlike reset, atomic_create_state is meant to allocate a new default
state without any side effect on the hardware or software state.

However, during the conversion we forgot to remove the call to destroy
the existing plane state if any. While this was expected from a reset
implementation, it's not for an atomic_create_state one. Remove it.

Fixes: 2bcec01cf105 ("drm/amdgpu_dm: Convert to atomic_create_state")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 2f88b9d65b82..779dabb7fc51 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1821,7 +1821,4 @@ STATIC_IFN_KUNIT struct drm_plane_state *amdgpu_dm_plane_drm_plane_create_state(
 	}
 
-	if (plane->state)
-		plane->funcs->atomic_destroy_state(plane, plane->state);
-
 	__drm_atomic_helper_plane_state_init(&amdgpu_state->base, plane);
 	amdgpu_state->degamma_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;

-- 
2.55.0

