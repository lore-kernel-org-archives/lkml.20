Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356070;
	b=ul5b0CTXQOMpU5tr1+G752dmqppCqjxtl3VQfiChjbt77VtDxERnNv2ZnHfd2pcW3306
	 fYz/+Zs3w7E2abwISWDwG+jPmoDLJMElGeFXP1qN0g8bflCgPqRgkT+uTQSh/r9wLnNVc
	 9tXC1Ae7pcApIZUys+t39mdFzX5hdIwkQjYt2w59F9kMZ3ecVXiySk63xa9IolgSPk9x9
	 qFtw1DjkIw8ebY9yDolhrD2KiPRob8HNN42IzXiyf/mdu+s7hNNB763k9pkhFrSpg1GRK
	 2gAUt5IRHLg0mQN6DpUzVjJZRMFwLiqmxmGhMp5s7hIh8q8ZXN7IZwuAC1tYpEc/h5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356070;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=RymG5Zs9FwMJtITbzdgvGCkoIgIBEM6um3giVlZIMck=;
	b=wFWShO7OWqQrfEsGHwbyk+Zgezyp4bYFxBjibWsoe01UaYy1gg2Bx1jmFUmWKINAcdkM
	 /OXTAvMfYipywQBfJvF+MbcnbcfnfYyHzBavzdzJifAz/82J9cBbV+dks2WBvZlUMqlkg
	 N9pVObQSWVYKzlQAYUgd5n/W/8waJMMTqNU+k3kiZ3A53oX7/wpUpHnMVVkO9a+e20bOq
	 8SLrzsqKlwAgioHSI3BLOMPLUK1EdQ4aJDEqV19HV/1PIYgrMkV7Gg1cndcTvgTN7casH
	 0C4lilXsVAJvMAmi2g3hHi1hjE187klxNyhlglXNeb5j0836lGA3z49sQ/ZxQpJ1wGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bZcLkSiy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D85F606A334
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bZcLkSiy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112351F000C1;
	Fri, 30 Oct 2026 10:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356069;
	bh=RymG5Zs9FwMJtITbzdgvGCkoIgIBEM6um3giVlZIMck=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bZcLkSiynlmM8mmekL2+i7H1+ZOSrbnf75FBYKtErwXYHPas26GMjT+dMEaTggWx0
	 ShLhUU0BjTuyOiAKjoe+iotdxyNGZZz3O9jD+Ggiu8nfRBKUfTTgpvpalwnSKUAkr2
	 k3NM/Vz7hXZC+Fx00HM3jz2hxhZJq7URdDstG2Y4oEolEVFJaoZQtB/Aiuj3kntd8l
	 uMPrWQs+Niakas3pMR3C4rXu5zrOEJ09dgdoemimSVhIGLg1dRtkCxPTOXzouBc3j1
	 zstygkeZL0rl8KN27napRTH0HqhoVvxgqvJ7VG93zOv0VZK4gvxptNBuCfuspDC/Sq
	 g2uB1fcF0mn8Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 30 Oct 2026 11:27:33 +0100
Subject: [PATCH v7 01/16] drm/amd/display: Fix planes atomic_create_state
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
Message-Id: <20261030-drm-reset-state-flag-v7-1-4e55eaeae683@kernel.org>
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
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628; i=mripard@kernel.org;
 h=from:subject:message-id; bh=HLVzeyqKpswstRmnOeZPJueli10TkjAEfdifLM4/WJw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlPCsWvWfD6/niZt29lWPjkBffXvTnOU7n88lmvBoOJn
 Hb58vWcHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiZ70Y69TuL/SI+uT1kPnQ
 FMOQ7/Fzw97fF2nSSVDnO8PSGmAkckpg/dQDrU8mdqtJG32fsuvsf8b6hNRPW75M2C0eza543Wb
 Lw3M/jS6U5sw4tzwxoqJT6++co1yBvgv8r2W5mmzOl7izU5wJAA==
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

