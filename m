Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501128;
	b=aMMPaNz6Np4sbPDF7e5yTuLcfdWR70oZiyu8cfxLpLTelwkvIwhKxlA5btn7BT0YS/2V
	 XqA8RuSceP1g5s06UssnSWnQ8cCwwvns48PPZA4E5XKTLJURb74Hn8g1y4+2A9rmP9zOT
	 oc3ESh1zZsPB/yo6LDgrmoWyXiOinsERQxcl1wqK1BsHwCyC7kp7oz32hMeIIjtSzC1RH
	 0CpHVuQZ3JX2kXp7o5lbft8hizxL7XG5VHppwVgF3EmLOdsCUu2wiqDkaaEit6y+04u0N
	 7gvmbaW9Z8hyNNa8A96y2K9Op//r7G7Sld1NW4JhZE24H1FsZ2cmcSqGiSjY1Q7t/Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501128;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=UkOSdliZy5NcC9iMihtdWt/3rQm4DJPq0I8hePeq5xk=;
	b=gZBcZcFCTcdtlpL9D0b2qijUO5iAMtbOxrYEJg3Mb2WuLPyzoA5deRJZhUd7teKpjWd9
	 iqdKXk3NNeNSHSKOPJH4fQ1LrcPudC82ygFca77XunuuRh1htBzD0L99dI0llqvPis+IT
	 ddqYHHV8HaHRr4/qxzqkohT99q5QWrG0oDGCvlHkqvyUP21ZK8nOZ8evXRw4X6wjm/xuK
	 GxmSt/LWhwnB43oK1CsAUgG3kO1NzlUqvw8F766qX+dSWmmVgk8SWB8Sm0jp4zXYsJyVw
	 TiAGIMEG1fH6q69zFINiSFacZaftmnhsvQq0ze5HIToOoJWxTUDLjliCjtA62Nw0JnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fpWOFN1v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3894606A8AF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fpWOFN1v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C574F1F000C5;
	Thu, 12 Nov 2026 16:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501128;
	bh=UkOSdliZy5NcC9iMihtdWt/3rQm4DJPq0I8hePeq5xk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fpWOFN1vavLYXGNl9+6FwowcA1CoHeVTNRdO/Flzlii1VupvIBoQD95a4D1IF9KBT
	 V4gLsORdmifhocB5l8rL79Tck/cnTgqXtHTMKGJtomQLCKFBz2H0j7j8xaXSvKJTaS
	 SxKgY3/1Fl3i28r9DqSk0hwmU21Dxad3UINn7bp0nhucwWhklhOhmxr6qCcd68lDEn
	 RcG2KAFfGKUa8yPxY00rnom+xwTbo4PuUUsgTbivSb7whSBYpt4INApBnV5LOi/Uhe
	 Lb13lXBz+if24JROr2cQcP8Z8UWiFP7XA5MXklRU0l4syUZwS7gTvhuyqPmgPEP+n7
	 /MOwjDwYGNymQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 12 Nov 2026 17:31:50 +0100
Subject: [PATCH v10 1/9] drm/amd/display: Fix planes atomic_create_state
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
Message-Id: <20261112-drm-reset-state-flag-v10-1-cefaa1ed056d@kernel.org>
References: <20261112-drm-reset-state-flag-v10-0-cefaa1ed056d@kernel.org>
In-Reply-To: <20261112-drm-reset-state-flag-v10-0-cefaa1ed056d@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlfX/67xxYR495kVH7++ueDJ0qOL7iy1V/Fo6hYYmnn4
 i9XBSsOd0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ/M9nbLgdWBO0/Ghhm6uo
 +vclFYu27U1t+ta0zmz2sU+WfBGvLnFUJu+aveOSZVaU2kFmQ83zixnrCx+J2iS4JDosOyg682n
 6k5O8e9c/Xf1DRVRlwfV2K6NUtbsVlR/mpW592bOVP7WQf0U4AA==
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

