Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501141;
	b=tm6FVxkqFa71OU/wqNhaeO600iHlNxlgcjPemUu9IU04Waz1Y7oAT0WEB2Dnyhr3CXCb
	 a+kybWLpPwD9aFFgjPhi41PlgzlN2KlBPOMBXwPZZxxW/gIys013vexMA7Ktha2+krjy8
	 r0xTgEURR1/opFPFo7kqEDWz1ou9ijLl27Kw+H9IPdCrd+JIqzsrWfMAHfwJtnDZqOJWM
	 uohi5s/n9byii4hg980qpcNtK0GQVSuR9iOjsrH7K4R3wnoFL+o/A58C3S+i2i+q2O3Y0
	 iysonwoXwubHiHgOi8TQDv6IgEyD0pMKem7lEzPpKf8X0saocOegkNkQxskbR5gYq4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501141;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=IK06K6MQBECuIUNklXJJ1e7MILzdFrcFN8KSljlqPhY=;
	b=KDZfvsRpKCJdfp6iZl2FGztijRE1Shp7OITT1bN2+7axWeNihWqtPRG/6rAvqNCv/VpX
	 qR+V1bfJydNR4YOGr+aoMBKXJt23qq0rdj52pfZ6tolyVXmHieIq1phi5VZisD1MGeaLc
	 SLfsFuoWT5oGgbEta60LP0afQEoMk6idP0dvl+6z7g1ObhAePf70jN06IFfvgaDwm6SlL
	 qVCidm1nua+e/xjUT6Ejd/08Zat71exFjzkqiAG8fxP7FkOhtZMUo+TE9BILKVjum/Gim
	 eqQWr7ErjggG0to8wEAW33GgMb1aNKkwcVkJ5rU2GY58YuBT7MC+sOkCJa0tos/o+PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nWEh0f+V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3791B606A891
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nWEh0f+V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C08C1F000C9;
	Thu, 12 Nov 2026 16:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501140;
	bh=IK06K6MQBECuIUNklXJJ1e7MILzdFrcFN8KSljlqPhY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nWEh0f+VoZwU3kbg2hPVmVULRi1yPPf7PAKlduldjlg1I5vCfvydFWFLXm9mV2cDu
	 G+tZRmoTIDDdLiHYIAX+gk0s/trZT8Sc2iVluhwzgh2+gVKxYXu67x5iQAF1AVPF+c
	 XSk13fwPgtieawoxVIkbG86aJfqOEnaUtLjAkv526jLJPuEUsXb6T51scKv0hGehCb
	 HzjwwhgciJB3KLNbPOfhqnqbiTdpa1qXlt6Hh27z9b1ScT4MhngmV0id+5tDDBI3MS
	 8JU3fjZ5TT3g152gZrUsKtUxD0iSYwhlBA6xud1m1/aiEl7O40X4hzxVyfMnOKTIht
	 /+73mM95zotvg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 12 Nov 2026 17:31:54 +0100
Subject: [PATCH v10 5/9] drm/amd/display: Take over the current stream and
 dc_state
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
Message-Id: <20261112-drm-reset-state-flag-v10-5-cefaa1ed056d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4877; i=mripard@kernel.org;
 h=from:subject:message-id; bh=+2bQgIjtV6naBU0maTRuT8nAW4TJ+nxq4tsm5xK+MVY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlfXzFc173xhOH4Q4a5GukPFn6RlLjZsXtD8Bdj9Tfec
 /OnMIildkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJlKoz1oclHTsu3eflGsz0
 4D9Tp+31aM+FE6VX3tsde1Zd5txP2ac7f0zQKjBLUKr4uCXw6dSf2owNc+8qPJw3y0a+Nf5n0Bw
 5hgjdgnUb5ljH2Qv4Wf7ofWT0iGXZfNNzD2wPdXXyN85uvf4LAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_commit_fill_with_defaults() builds its commits out of
states created through atomic_create_state() instead of duplicating
the current state. A created state comes with no stream nor dc_state,
while a duplicated state carries the ones in use, with their
reference.

The update passes of amdgpu_dm_atomic_check() release the stream and
dc_state in use and clear the pointer of the new state, on top of the
reference the current state drops when it gets destroyed. Those
releases are only balanced if the new state brought a reference of
its own, so a commit that disables or reconfigures a live CRTC or
plane through a created state over-releases and frees the stream
early, leading to a use-after-free when the current state gets
destroyed. The paths that keep a CRTC or a plane enabled without a
modeset also work on the stream and dc_state through the new state,
and hit BUG_ON(dm_new_crtc_state->stream == NULL) since it never had
one.

Take the stream and dc_state of the current state over, with a
reference, at the beginning of amdgpu_dm_atomic_check(), like a
duplicated state would have carried them. This has to happen before
the update passes clear the stream of the new states: past that
point, a state whose stream was cleared can't be told apart from a
created one.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

To: Harry Wentland <harry.wentland@amd.com>
To: Leo Li <sunpeng.li@amd.com>
To: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>
To: Christian König <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0ea45ab12119..b2eddb87dd5c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6279,10 +6279,60 @@ STATIC_IFN_KUNIT int amdgpu_dm_atomic_check(struct drm_device *dev,
 	struct drm_dp_mst_topology_state *mst_state;
 	struct dsc_mst_fairness_vars vars[MAX_PIPES] = {0};
 
 	trace_amdgpu_dm_atomic_check_begin(state);
 
+	/*
+	 * A CRTC or a plane that stays enabled keeps its stream and
+	 * dc_state: a duplicated state carries them over, with their
+	 * reference, but a state created through atomic_create_state()
+	 * comes with neither. Take them over from the current state,
+	 * with a reference, like a duplicated state would.
+	 *
+	 * The reference is needed when the update passes below
+	 * reconfigure the CRTC or plane: they release the stream and
+	 * dc_state in use and clear the pointer of the new state then,
+	 * on top of the reference the current state drops when it gets
+	 * destroyed, so that release is only balanced if the new state
+	 * brought a reference of its own. The pointer is needed when
+	 * they don't: the paths that keep a CRTC or a plane enabled
+	 * without a modeset work on the stream and dc_state through
+	 * the new state.
+	 *
+	 * A stream or a dc_state in the current state means the CRTC
+	 * or the plane is enabled, since they are cleared when it gets
+	 * disabled, so the conditions below already single out the
+	 * live objects. They deliberately don't check whether this
+	 * commit keeps them enabled on top of that: the update passes
+	 * release the stream and dc_state of the CRTC or plane being
+	 * disabled too, so their new state has to bring the reference
+	 * just the same.
+	 *
+	 * This has to run before the update passes below clear the
+	 * stream of the new states: past that point, a state whose
+	 * stream was cleared can't be told apart from a created one.
+	 */
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
+		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
+		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
+
+		if (!dm_new_crtc_state->stream && dm_old_crtc_state->stream) {
+			dm_new_crtc_state->stream = dm_old_crtc_state->stream;
+			dc_stream_retain(dm_new_crtc_state->stream);
+		}
+	}
+
+	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
+		struct dm_plane_state *dm_old_plane_state = to_dm_plane_state(old_plane_state);
+		struct dm_plane_state *dm_new_plane_state = to_dm_plane_state(new_plane_state);
+
+		if (!dm_new_plane_state->dc_state && dm_old_plane_state->dc_state) {
+			dm_new_plane_state->dc_state = dm_old_plane_state->dc_state;
+			dc_plane_state_retain(dm_new_plane_state->dc_state);
+		}
+	}
+
 	ret = drm_atomic_helper_check_modeset(dev, state);
 	if (ret) {
 		drm_dbg_atomic(dev, "drm_atomic_helper_check_modeset() failed: %pe\n", ERR_PTR(ret));
 		goto fail;
 	}

-- 
2.56.0

