Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792487954;
	b=f1B4mmvfW3qantDP8JvlEwzVzgXXrbBGJKjmEnvRZQa1PX21pUzbZadlJcv2tLgjLfwn
	 2cPEcBygXnIZkIbwdl7DOtiQyQDyqN5kkj3uI+bmBsSd+RkGwsc68Aqdx3YLvLmswFo2h
	 rUDfGQMLaOiWEMm3kU5RuSEh8m/5n6h9aSX7XSxb6wbRjRSXZI+7yr1H2DOktXuWpuG/S
	 JlFEbau22bsZq4YEv5Hpnai6DkF9lCvBS+iiVPEZRHTR7gVO0SuXawPPUiZ5/V1Tx/Efa
	 gs/aOWRa4ObhkQxUoTRHLHRYe/olNLo33yorbCZVI+yeB3DmmuVWxDvttiqUSR3M1Ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487954;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:In-Reply-To:
	 References:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=4qJbhDueB81+tPuWcRR2Jg6rPFktFnxMsGcG4bGELWg=;
	b=Ol5NZYODJKJTlOtHnr6vFkMlNNJrQhFYFBuGGqehZ72Yk8GQdiV7mFw7GVs0YsNj5f+d
	 FS/iXqeqb/0P5RnB921EiQ9cb0//EUmYVh8ovgSjDnFpuMu4OftZk8ExfZ2kTbYBQaJM+
	 Pb8ulf5AAXoxulLM3g+aIO8qEE82D1t5pkWDhLpzd3JV1xc92OPmRGPN9Ycs9tNeXJdtX
	 6GtQDklahZ+rQyLJwGA6tBU3OMWe+xcl9w5ct6EjbR0nZNQYhrryvx3/Ld4i88pClcbsu
	 zUAEFtBLHwOLFm4fNKbalZveVrnHHVkpAiiFPcY+vaGvoy9qkv83LPjJpxty2FmzEug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=meVbhBq1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDF8606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=meVbhBq1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792487953;
	b=ZV4Xo23btX9bAAtBJRuPsdaJ4ExQgGTMJXjmKxvglE8MasGu8VqXC4amf3ZgUNybclKp
	 eq/UXZHbIOWNYHgqD5xNJvvMv67xQh/d+6xMDNbs2TDnCiQ6H92so9vF1rJJWrBohwlFo
	 7UMRFTnb0wc1/3zsb2JrBQPshlYFvmpDtpYnF4dGFne6x6N122o5v2e+Lt3oO4sYCGpdJ
	 v6pTZ1AwlUWz5TJjq+zuoYCQBDd2o8Nu6kl3HVtpdwMsZxzN0wtNs/UmDyaC6fJ/MvUvD
	 gC8WIfEt5AED1x5hN9Sr0lxtWLf4rq4AAreqz4XuiuMq0GT67uNmBwNsWtf0UB9/FuQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792487953;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:In-Reply-To:References:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4qJbhDueB81+tPuWcRR2Jg6rPFktFnxMsGcG4bGELWg=;
	b=uqJnv1Myxm22TbUyTARmq1QwJbbpm6zB/eJ5twkntK3rlEEy5VKcGnLq+KUHeib44L8q
	 MF8Hr030A1k0+Yh3eaF4G9sfUiKEgth7IgJls75zuuuH1anN+AdyZeSwM/R1KqjT1Hynw
	 YtRHABgbAYQDiUvg5AKWvqGkkQ7l9CmhVVGubCfAje2HSD9e2fq4VlSSuEiudjxTkGxht
	 siy4AccVb0HweH1ylazkaJonQgBkxyJbu9DpKe9dkHWtSdOANJwy5f6dE/Y9DW0nPRyK/
	 ObLVQlc2eRCn5A8nJqybkTXKOc+o6fc+Ociw+CSDnpXfuzolnd0xn4ahjNDEaKP2KGw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D40551F000C4;
	Tue, 20 Oct 2026 09:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792487953;
	bh=4qJbhDueB81+tPuWcRR2Jg6rPFktFnxMsGcG4bGELWg=;
	h=From:Date:Subject:In-Reply-To:References:To:Cc:Reply-To;
	b=meVbhBq1NhmLKWUg7RTShEac2BdOnx6H3Y/k4el4AKT4cgn7GwiYLfEJBRN5+M36y
	 bzTibISxvMh4JfMO4CRisz0JEifQUjT5WsxuskCMPiKHjl5chGhrqiGIcf2VY8Ftzz
	 wEPa+kI2GIbgtDwEKD4yTU27e29HWmPAYomfHl0HclFxXC9RV7J09ZxhVz3ikxJQpR
	 9JlCkH2Tob9WTEQhIV4lRJHMOTtDEeAJXoKzjTw7OzUmk6gV0Jp76pFbXC+Hqm4i3Y
	 RsJLLrqHJH8A11tu4LmOtXO/mWqD3E7rw7VY7JTEBNiudY6VEeJkTfhazEPCo3XsqU
	 EbA6PI7KOXWkA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 30940406D4;
	Tue, 20 Oct 2026 09:19:12 +0000 (UTC)
From: Vladyslav Yamkovyi via B4 Relay <devnull+hex.aleph0.ai@kernel.org>
Date: Tue, 20 Oct 2026 11:19:12 +0200
Subject: [PATCH v2] drm/i915/psr: Use register notifications during async
 flips
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
Message-Id: <20261020-fix-psr-async-trans-push-v2-1-5282017ba8ea@aleph0.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr0K6drSFUKIr72FYtGVqaxSaDhAJ4
 e626AFcTf7k/Ze/MsLokdilWFnE2ZMf+hTKQ8GMU/0dwXcps5KXUnBRgfVvCBRB0dIbGKPqCcJ
 EDrRVsq552XDTsFQPERO7q2/tN9OkH2jG7MuEVoSgk8G4/OriC0YfTr+bCedpHOKyr5tFNv0xZ
 BYgALE5a1sJLaW9qicGx4/Ks3bbtg9bn1139AAAAA==
X-Change-ID: 20261013-fix-psr-async-trans-push-bfa6550270c7
In-Reply-To: <20261013-fix-psr-async-trans-push-v1-1-ee79bf31b66f@aleph0.ai>
References: <20261013-fix-psr-async-trans-push-v1-1-ee79bf31b66f@aleph0.ai>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792487951; l=6884;
 i=hex@aleph0.ai; s=20261013; h=from:subject:message-id;
 bh=qpQHd14VRb2xAvTSBwHDgWqfyncSp1FaXBXGgUUAOR4=;
 b=N9q0FCAIL40xYH6e3ysER68/zdF08bff0J3B0g++9pHWpnzPOrl5b9jE4iWCxVClDB2Pq9jc3
 ZEuPm9BsqKhBCMzuw/O1FlrV06JnEaw7uuQQKY+0v2aC0tRJI8ZOjJy
X-Developer-Key: i=hex@aleph0.ai; a=ed25519;
 pk=faUPQ+UBdMQ6ZcbVM9ytjGUZvrhV8mzf+ctgaoVsZy0=
X-Endpoint-Received: by B4 Relay for hex@aleph0.ai/20261013 with
 auth_id=1170
X-Original-From: Vladyslav Yamkovyi <hex@aleph0.ai>
Reply-To: hex@aleph0.ai
Content-Transfer-Encoding: 7bit

From: Vladyslav Yamkovyi <hex@aleph0.ai>

Async flips skip the TRANS_PUSH sent by intel_pipe_update_end().
On platforms using TRANS_PUSH for PSR frame-change notifications,
an async flip from self refresh can therefore lose its completion
event and freeze scanout.

Select register-based frame-change notifications for an async request
and while any plane remains in async mode. Restore TRANS_PUSH when
the CRTC returns to synchronous operation. Update the selector under
the PSR lock before programming the planes, preserving the current
VRR enable state.

Fixes: 129a4da11707 ("drm/i915/psr: Use TRANS_PUSH to trigger frame change event")
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9582
Link: https://lore.kernel.org/dri-devel/20261013-fix-psr-async-trans-push-v1-1-ee79bf31b66f@aleph0.ai/
Cc: stable@vger.kernel.org
Signed-off-by: Vladyslav Yamkovyi <hex@aleph0.ai>
---
v2: Don't send a push for async flips; instead stop using TRANS_PUSH as
the PSR frame change event while async flips are in use (Ville). No push
is sent for async flips, so intel_vrr_check_push_sent() is unaffected
(Jouni).

Tested on Panther Lake (eDP, PSR2, Panel Replay with and without VRR).

I could not determine whether LNL_TRANS_PUSH_PSR_PR_EN may be changed
while the PSR/PR source is enabled (Bspec 69984 is not public).
The patch changes it in pre-plane update, after the previous commit's
hardware programming has completed and before the planes are programmed.
Exiting PSR around the switch added about one refresh interval at fixed
refresh and about 40 ms with Panel Replay+VRR in local tests.
Is changing the selector without exiting PSR supported?
---
 drivers/gpu/drm/i915/display/intel_display.c | 11 +++++++++++
 drivers/gpu/drm/i915/display/intel_psr.c     | 10 +++++++++-
 drivers/gpu/drm/i915/display/intel_vrr.c     | 17 ++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_vrr.h     |  2 ++
 4 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index d5d4453f283b..92e2b6100ec8 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7412,6 +7412,8 @@ static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
 				     struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(state);
+	const struct intel_crtc_state *old_crtc_state =
+		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -7438,6 +7440,15 @@ static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
 		!intel_crtc_needs_modeset(new_crtc_state) &&
 		!intel_crtc_needs_fastset(new_crtc_state);
 
+	/*
+	 * DSB frame-change notification uses the old CRTC state, whereas
+	 * DSB wait handling uses the new policy. Change the notification
+	 * mechanism on the CPU path before programming the planes.
+	 */
+	if (intel_psr_use_trans_push(old_crtc_state) !=
+	    intel_psr_use_trans_push(new_crtc_state))
+		new_crtc_state->use_dsb = false;
+
 	intel_color_prepare_commit(state, crtc);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 00d0146b2600..4c862fa8d795 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3187,6 +3187,12 @@ void intel_psr_pre_plane_update(struct intel_atomic_state *state,
 				wm_optimization_wa(intel_dp, new_crtc_state);
 		}
 
+		if (psr->enabled &&
+		    intel_psr_use_trans_push(old_crtc_state) !=
+		    intel_psr_use_trans_push(new_crtc_state))
+			intel_vrr_psr_frame_change_update(old_crtc_state,
+							  new_crtc_state);
+
 		mutex_unlock(&psr->lock);
 	}
 }
@@ -4660,7 +4666,9 @@ bool intel_psr_use_trans_push(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 
-	return HAS_PSR_TRANS_PUSH_FRAME_CHANGE(display) && crtc_state->has_psr;
+	/* Keep register notifications while any plane remains in async mode. */
+	return HAS_PSR_TRANS_PUSH_FRAME_CHANGE(display) && crtc_state->has_psr &&
+		!crtc_state->uapi.async_flip && !crtc_state->async_flip_planes;
 }
 
 bool intel_psr_pr_async_video_timing_supported(struct intel_dp *intel_dp)
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index d43a06907d18..4f691ca50ea3 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -758,7 +758,7 @@ static u32 trans_vrr_push(const struct intel_crtc_state *crtc_state,
 	if (send_push)
 		trans_vrr_push |= TRANS_PUSH_SEND;
 
-	if (HAS_PSR_TRANS_PUSH_FRAME_CHANGE(display))
+	if (intel_psr_use_trans_push(crtc_state))
 		trans_vrr_push |= LNL_TRANS_PUSH_PSR_PR_EN;
 
 	return trans_vrr_push;
@@ -1059,6 +1059,21 @@ void intel_vrr_psr_frame_change_enable(const struct intel_crtc_state *crtc_state
 		       trans_vrr_push(crtc_state, false));
 }
 
+void intel_vrr_psr_frame_change_update(const struct intel_crtc_state *old_crtc_state,
+				       const struct intel_crtc_state *new_crtc_state)
+{
+	struct intel_display *display = to_intel_display(old_crtc_state);
+	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
+	u32 push = trans_vrr_push(old_crtc_state, false);
+
+	/* VRR enable/disable has not run yet; preserve the old timing state. */
+	push &= ~LNL_TRANS_PUSH_PSR_PR_EN;
+	if (intel_psr_use_trans_push(new_crtc_state))
+		push |= LNL_TRANS_PUSH_PSR_PR_EN;
+
+	intel_de_write(display, TRANS_PUSH(display, cpu_transcoder), push);
+}
+
 bool intel_vrr_is_fixed_rr(const struct intel_crtc_state *crtc_state)
 {
 	return crtc_state->vrr.flipline &&
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
index 19c7990be1b2..c2ca4db5acfe 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr.h
@@ -35,6 +35,8 @@ void intel_vrr_dcb_increment_flip_count(struct intel_crtc_state *crtc_state,
 bool intel_vrr_is_push_sent(const struct intel_crtc_state *crtc_state);
 void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state);
 void intel_vrr_psr_frame_change_enable(const struct intel_crtc_state *crtc_state);
+void intel_vrr_psr_frame_change_update(const struct intel_crtc_state *old_crtc_state,
+				       const struct intel_crtc_state *new_crtc_state);
 void intel_vrr_get_config(struct intel_crtc_state *crtc_state);
 int intel_vrr_vmax_vtotal(const struct intel_crtc_state *crtc_state);
 int intel_vrr_vmin_vtotal(const struct intel_crtc_state *crtc_state);

---
base-commit: 24d867f5e671c78760ab39087a57c25ad98e1f42
change-id: 20261013-fix-psr-async-trans-push-bfa6550270c7


