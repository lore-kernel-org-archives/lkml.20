Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1178E39A04C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135929; cv=none; b=nV5WvJXPY/eT1U47OQU53hhgfe27Ru/nejU7MmsLteUx2OzlG8XYmt1Bk1sCLnup0Z+10Ee5/C5WSoh/VmIQWMAUFGNuJxuCzzwJ6vnGBY8dCrSZWkCSHHjMVQ/M1dR4VOfEfSFdH6bVNa3JXwQHvSSMnymyyeuzocgmQgVT3zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135929; c=relaxed/simple;
	bh=Eosq4HSwlZnbxs+Sj3CugmJo42pZqa8ZJ7QvTYvOScs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FEzLpN4g4PRUnZuHXPeMcAU0Yz78qBJt+tCiMJfmWe1IcUlXoVnpe2qHx9Vkl0UxE6CWhRMuDbh1EjhvkoWgfIZP3kDLc49fJxFKl8F6aDTLasgphdTFZ1nro7oIgfISjeUVOfzrZAzI/9FBUoX9F8hLAsyho/WlNXUYhS8yM0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQ5yzkFf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQ5yzkFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7411F000C4;
	Fri, 16 Oct 2026 07:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792135927;
	bh=+5JlYCPOjs2Z7BXDEhIgV/W5EOCC9AIQbjCj+aN5IlI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KQ5yzkFfqvb4fF6iLOu+ZeRW2yPqMHXqDHKGpAC8pfesHoohIFxC9gALXAvvHocbW
	 yAcfI2r+pKYipStt91NbzkllCdhkrQuzTCQN2ize3Tht6T6sXO5ONQKmi9pMjTlTz6
	 U8R6Z3uPADGN/DsFFaw/XiWRb0HgaGLycP8cnsq7lYxz41Ziy13zxVU2BmDHD6XHLW
	 FNrseHmeUWT6HcSpwJ87fxuS7/a+ozuCHSsyvKakrMGUL4HjtNFLL8YN2/fJSr9Iaj
	 NxSLnz7IMRFj8qd234npOBSt00HdJxQxsA5tssaWOf7kjg+CxUPULx5VIOZrBnCTCG
	 dVbg3eDLCz37Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 16 Oct 2026 09:31:35 +0200
Subject: [PATCH v5 03/14] drm/atomic: Use __GFP_ZERO instead of explicit
 memset in drm_atomic_get_connector_state()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-drm-reset-state-flag-v5-3-dad2d64b693b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Eosq4HSwlZnbxs+Sj3CugmJo42pZqa8ZJ7QvTYvOScs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkXLz1y9j/BF1ScfvBT5drCu6m3C30TXnpcYd1gxbty9
 1OtK2KhHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiOScZ6xMrOK3dptvbyvAV
 HJ3Z+cfat7FbYuG7o/unRUx32aK3qzXdTUSz08Ejln3+otnTBUScGeu0LHS8qrY3/v3NP+flgrr
 761Xepfx8vmDvEwVdB/duuaB9134ovO21NYhM/vO7KXV2khYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_atomic_get_connector_state() function grows the connectors array
with krealloc_array() when the requested connector index exceeds the
current allocation, then zeroes the new entries with a separate memset()
call.

Since krealloc_array() supports the __GFP_ZERO flag to zero newly
allocated memory, the explicit memset() is unnecessary.

Pass __GFP_ZERO to krealloc_array() and drop the manual memset().

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 43b58e9b25e4..80436adcfb7f 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1388,18 +1388,15 @@ drm_atomic_get_connector_state(struct drm_atomic_commit *state,
 	if (index >= state->num_connector) {
 		struct __drm_connnectors_state *c;
 		int alloc = max(index + 1, config->num_connector);
 
 		c = krealloc_array(state->connectors, alloc,
-				   sizeof(*state->connectors), GFP_KERNEL);
+				   sizeof(*state->connectors), GFP_KERNEL | __GFP_ZERO);
 		if (!c)
 			return ERR_PTR(-ENOMEM);
 
 		state->connectors = c;
-		memset(&state->connectors[state->num_connector], 0,
-		       sizeof(*state->connectors) * (alloc - state->num_connector));
-
 		state->num_connector = alloc;
 	}
 
 	connector_state = drm_atomic_get_new_connector_state(state, connector);
 	if (connector_state)

-- 
2.55.0

