Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326583;
	b=QnCCRva8E90uhjVCUXwN0ASeIE4eY0ImxszJ3KPzBo55k7vbt1hWo4+ZoAurdBtphPSa
	 Dc/lnUZkvonAwm+H/DpWPeNbz2KBRaHBTpEq/ps3kOs1PZAoV3cMueLQhMzFtqn5AJg1c
	 8tI0eOO9pZqO7oSkFBY27FlSwuHpIF8JRRlBy+gGY68zx4HhJUZRQ5Ixov23L7W9F0ABK
	 5+ClQ2MFVG/L6ocX6xdpOzBDNMkXr2ekizvS2JaXohR/BKzc3KRZZblvYmltsUG1Q/PaM
	 MmiKnWqkEQ79+rDC6MbwJNbqUiQYknoZo/FD2ItzQ6/6Vu3gxB2bsQeMlqJQoyM+A5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326583;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=UkOSdliZy5NcC9iMihtdWt/3rQm4DJPq0I8hePeq5xk=;
	b=1VA9HcKHz9Wt/ZcnqOjtmtybAy+uS1MwaUKzSnE8R72jTvloU/US8dfUl6VZIG6w/aRg
	 ButFxJ1TbupwB8B9iLOyAKrVgx6Jw9Nfx1CZvMAptpNhqBbPkrGzhONKcrRKRxiJE+aWS
	 UfdrRGpHVIajzWpnRQMp5nKhGLFaHAlWzUDYdc2x6NUdR9raxzXtCrxgkFUgURMeb1mzf
	 9Iwm43ch/nSgRnwxDGgRjVummhw81Q7ZWjZHimp6yJ8mOuG1Ur+cVztMt5CbXdrxyftUY
	 0I3BFq3+RahxxpUiOI/urCrjqpor/BbV3WJEs/zKvGEU3m96dlKAGKZuiTgGPvIhzzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SIYnvH1g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B50606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SIYnvH1g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0241F008A2;
	Tue, 10 Nov 2026 16:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794326582;
	bh=UkOSdliZy5NcC9iMihtdWt/3rQm4DJPq0I8hePeq5xk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SIYnvH1g5qwQgJy7rUfsceO7ga5ZEXmW7pESO04RqKET9BDCdMBqDHAAOU9fya5g0
	 rvSLmnIuTHCuwaLyrCtOqdytVdtYEWzLIfS72G4ry9PemSI6hBP6ecPcAyPpuQTDyj
	 t7JaIPLWAaFUES+fW3W1cNRTo+gBJkMfw5RODpDtnZhBkjVGhvSMSb2fPnOP3JF0Tr
	 iH88+ZPqxXHH1aRYdlC8PP9wI7SGGlHrcB04GrvVXAx0/PCZC03NC79yD/5FnG2Vzu
	 8hOb/MKYYGIsbd3VKGksXUPAn6o+qTDn4MKhCmUnZuBJ41iUBqpxDEGFGcex9UH9MF
	 PxwEVr+noaDwQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 10 Nov 2026 17:02:48 +0100
Subject: [PATCH v9 01/10] drm/amd/display: Fix planes atomic_create_state
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261110-drm-reset-state-flag-v9-1-ddb0e26324a0@kernel.org>
References: <20261110-drm-reset-state-flag-v9-0-ddb0e26324a0@kernel.org>
In-Reply-To: <20261110-drm-reset-state-flag-v9-0-ddb0e26324a0@kernel.org>
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
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1941; i=mripard@kernel.org;
 h=from:subject:message-id; bh=zI+tdKHs08TxNrStUefce1G/xTYeY9pNWe0/0yA5fbQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmfHXS+hXh3p1nvNlnVKXuugWVZbdUqzbr43bEd2w6zH
 e625fnXMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACYS+JSx4Ypn040lKWdmZK/Z
 lnBhgYGSgHxyUMxuy4dxXM82aAo+9pp5tOOB8t7LPL/sYl3YfaZHMNaH/zzJvENGkHHJ12DhuUm
 5SwK3Gv9+azR7WkNz5sfvJouu1jeeqfx17kJ9+6M7pkH/1AMB
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
Reviewed-by: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

To: Harry Wentland <harry.wentland@amd.com>
To: Leo Li <sunpeng.li@amd.com>
To: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>
To: Christian König <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 91398230d408..31101c810bac 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1801,13 +1801,10 @@ STATIC_IFN_KUNIT struct drm_plane_state *amdgpu_dm_plane_drm_plane_create_state(
 		kfree(amdgpu_state->plane_info);
 		kfree(amdgpu_state);
 		return ERR_PTR(-ENOMEM);
 	}
 
-	if (plane->state)
-		plane->funcs->atomic_destroy_state(plane, plane->state);
-
 	__drm_atomic_helper_plane_state_init(&amdgpu_state->base, plane);
 	amdgpu_state->degamma_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
 	amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
 	amdgpu_state->shaper_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
 	amdgpu_state->blend_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;

-- 
2.56.0

