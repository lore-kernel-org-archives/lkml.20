Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292876;
	b=CC6880ZWp9EHb5MSk1xxd30tvWKwIa+3uOUqRNlBq4b9JvWG2COxsYeqsvwAtI8vSyBI
	 AndAUGJTmKMvCOn4nlbJTEAhrVuoeyacMvuZxLMvunecRedqaWy2lAoG5VAVrQnH3L8vJ
	 fAfpgieEcc+neUWCF0Tl+jI1FnYHRCry/CL90KJTWYtAC1YZ6e7A38WH8YZ63UsdPCWm6
	 nB/br8Sc6ninu2F0e/N2BWZA3GNAWZfhliEwGMYfJBaBuwZm3ocL9sctRb55NtHjwPtwS
	 QxEL4UlT7+2O32M0vCnGJRtsrflueq7z5DLasrED46+hO2VW5ZbBwGW9f8JEyDmxHXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292876;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=Ju225KbHIU2fp8N7PevdwnGpTaCG0uk/rmjsK0tlWc0=;
	b=K5NSvYRBqcHRzYEjRmMe8PDP2FEoqHPxbxRYE6Iphf090SBSMTPjbBYMKaaZ+P8oiPh9
	 zaz8ZIjN6sP/YtyJMhBDir9iY2L0MzzYbpRvS8tItBFYITyAWbiPZeUSjZ/Rrr5SSQZXe
	 qU64bmqMJLs2rUI08bTNtiY2FztpBoQJ80gETxajFbJTdYMxaY5SfiZX777gt6Ju/FXJo
	 B55c4gwbhK43RhYqCOKToTZovrH2RCgiLhS2S5+1CcLrBMWPRyfXeEiNAKlN64sBPPu2/
	 L0BSsXjGlqbBqFrB3AikyecHpIhJi8bc+Po+RSdjSJct3lms8baRr2cuUKN8n8ZD+VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0BA606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E0BA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jFr1B0QG0zKnGf;
	Thu, 29 Oct 2026 17:54:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793292862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ju225KbHIU2fp8N7PevdwnGpTaCG0uk/rmjsK0tlWc0=;
	b=lEyRdwXxW4OJWIXmuBPEw8XY+Z57bHrc6WDQQwp+sirchgsSn3uwKpy/jGj2+Q4+FRbWz4
	+nt7K3Rn1OVs+p24/MVl25dgOTOgCPWH3kbF4DmkEQ+rEDtd2F40hStK0glOdzOi/RLUsL
	RA8+f86wfEraBoPgmKdHlJz8eurAdlMvDVyqnnXlRg/oiHekAj9uOISRRlQXw4XNtCUHHD
	4OsqfD0hsjQ9D2pnbCuukg3C5eM1EmEYOqKcMCOemKv01/jTyTOqPGRvBJVIpv4PEn1MmS
	VnGlwWacGdP+UlSDyT2zZQZ5wxBkbHqa5dbzdAcac3NhA0m3r5uVgxnUnicLrA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Ray Wu <ray.wu@amd.com>,
	Chenyu Chen <chen-yu.chen@amd.com>,
	Hersen Wu <hersenxs.wu@amd.com>,
	Roman Li <Roman.Li@amd.com>,
	Alex Hung <alex.hung@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: Take every stream out of self-refresh before a modeset
Date: Thu, 29 Oct 2026 16:54:20 +0000
Message-ID: <20261029165420.2255749-1-hugo@hsal.es>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jFr1B0QG0zKnGf

Commit 3c108046e1d6 ("drm/amd/display: Add power module on Linux")
dropped amdgpu_dm_psr_disable_all() and amdgpu_dm_replay_disable_all()
from amdgpu_dm_commit_streams(). Since then, a modeset only disables
self-refresh on the CRTCs in the commit, so an eDP on another CRTC stays
in PSR through dc_commit_streams()

Commit 6ee90e88b976 ("drm/amd/display: PSR eDP p-state warning occurs
intermittently after unplug DP") added that disable-all for this very
case. With it gone, turning off or unplugging an HDMI monitor while the
eDP is in PSR hangs DMUB on a Cezanne laptop (DCN 2.1), on the first
try:

  dc_dmub_srv_log_diagnostic_data: DMCUB error
  Error queueing DMUB command: status=2

The eDP then stays frozen until a GPU reset

Do the same through the power module's events. When a CRTC that is or
was active needs a modeset, raise the PSR and Replay pause events on
every stream mod_power tracks and wait for self-refresh to exit, before
amdgpu_dm_mod_power_update_streams() changes the stream set. Clear them
on the commit's streams after amdgpu_dm_mod_power_setup_streams(), since
enabling a stream clears psr_feature_enabled until then. Use
psr_event_pause and replay_event_pause rather than the hw_programming
events, which a fast update on the eDP can clear in
amdgpu_dm_enable_self_refresh() while the modeset is still running

Fixes: 3c108046e1d6 ("drm/amd/display: Add power module on Linux")
Signed-off-by: Hugo Sales <hugo@hsal.es>
---
Tested on an ASUS ROG Flow X13 (Cezanne, DMUB 0x0101002B) with PSR 1 on
the eDP. That's the only hardware I have, and PSR there needs
DC_PSR_MASK and "drm/amd/display: Don't require DMUB PSR caps before
DCN 3.0", which I'm sending next. With this patch, 50 HDMI unplugs in a
row with the eDP in PSR went through without a DMUB error. The same
kernel without it hung on the first

Ray, Leo: 3c108046e1d6 doesn't say whether leaving the other CRTCs in
self-refresh was intended. If newer DMUB firmware copes with an external
link going away during PSR, I can limit this to DCN 2.1

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index dfbc384fbbdb4..54eee9e2393fa 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4443,6 +4443,105 @@ STATIC_IFN_KUNIT void dm_clear_writeback(struct amdgpu_display_manager *dm,
 }
 EXPORT_IF_KUNIT(dm_clear_writeback);
 
+static bool amdgpu_dm_self_refresh_pause_needed(struct drm_atomic_commit *state)
+{
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	struct drm_crtc *crtc;
+	int i;
+
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i)
+		if (drm_atomic_crtc_needs_modeset(new_crtc_state) &&
+		    (old_crtc_state->active || new_crtc_state->active))
+			return true;
+
+	return false;
+}
+
+static bool amdgpu_dm_is_new_modeset_stream(struct drm_atomic_commit *state,
+					    const struct dc_stream_state *stream)
+{
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_crtc *crtc;
+	int i;
+
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
+		if (drm_atomic_crtc_needs_modeset(new_crtc_state) &&
+		    to_dm_crtc_state(new_crtc_state)->stream == stream)
+			return true;
+
+	return false;
+}
+
+/*
+ * A modeset CRTC may have no PSR or Replay, such as an HDMI output being
+ * turned off, while an eDP on another CRTC is still in self-refresh. Pause
+ * self-refresh on every stream mod_power tracks before
+ * amdgpu_dm_mod_power_update_streams() changes the set: the old streams of
+ * the CRTCs in the commit and the unchanged streams of the new state.
+ * Unlike hw_programming, which a fast update on another CRTC clears, the
+ * pause holds until amdgpu_dm_resume_self_refresh()
+ */
+static void amdgpu_dm_pause_self_refresh(struct drm_atomic_commit *state,
+					 struct amdgpu_display_manager *dm,
+					 struct dc_state *dc_state)
+{
+	struct drm_crtc_state *old_crtc_state;
+	struct dc_stream_state *stream;
+	struct drm_crtc *crtc;
+	int i;
+
+	if (!amdgpu_dm_self_refresh_pause_needed(state))
+		return;
+
+	guard(mutex)(&dm->dc_lock);
+	dc_exit_ips_for_hw_access(dm->dc);
+
+	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
+		stream = to_dm_crtc_state(old_crtc_state)->stream;
+		if (!old_crtc_state->active || !stream)
+			continue;
+
+		amdgpu_dm_psr_set_event(dm, stream, true, psr_event_pause, true);
+		amdgpu_dm_replay_set_event(dm, stream, true, replay_event_pause, true);
+	}
+
+	for (i = 0; i < dc_state->stream_count; i++) {
+		stream = dc_state->streams[i];
+		if (amdgpu_dm_is_new_modeset_stream(state, stream))
+			continue;
+
+		amdgpu_dm_psr_set_event(dm, stream, true, psr_event_pause, true);
+		amdgpu_dm_replay_set_event(dm, stream, true, replay_event_pause, true);
+	}
+}
+
+/*
+ * Ends amdgpu_dm_pause_self_refresh() on the streams of the commit, which
+ * mod_power tracks from amdgpu_dm_mod_power_update_streams() on, even if
+ * dc_commit_streams() failed. mod_power keeps events across
+ * mod_power_replace_stream(), so the replaced streams carry the pause too.
+ * Runs after amdgpu_dm_mod_power_setup_streams(), since enabling a stream
+ * clears psr_feature_enabled and replay_feature_enabled on its link until
+ * then, and the set_event helpers skip a link without them
+ */
+static void amdgpu_dm_resume_self_refresh(struct drm_atomic_commit *state,
+					  struct amdgpu_display_manager *dm,
+					  struct dc_state *dc_state)
+{
+	int i;
+
+	if (!dc_state || !amdgpu_dm_self_refresh_pause_needed(state))
+		return;
+
+	guard(mutex)(&dm->dc_lock);
+	for (i = 0; i < dc_state->stream_count; i++) {
+		amdgpu_dm_psr_set_event(dm, dc_state->streams[i], false,
+					psr_event_pause, false);
+		amdgpu_dm_replay_set_event(dm, dc_state->streams[i], false,
+					   replay_event_pause, false);
+	}
+}
+
 /**
  * amdgpu_dm_mod_power_update_streams - update mod_power stream state
  * @state: the drm atomic state
@@ -4627,6 +4726,7 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_commit *state,
 		acrtc->wb_enabled = false;
 	}
 
+	amdgpu_dm_pause_self_refresh(state, dm, dc_state);
 	amdgpu_dm_mod_power_update_streams(state, dm);
 
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
@@ -5370,6 +5470,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_commit *state)
 	}
 
 	amdgpu_dm_mod_power_setup_streams(state, dm);
+	amdgpu_dm_resume_self_refresh(state, dm, dc_state);
 
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, j)
 		if (new_crtc_state->async_flip)

base-commit: ba496bb837882eb1af58f41572fc289e46c77b8c
-- 
2.56.0

