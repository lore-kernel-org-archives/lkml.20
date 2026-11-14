Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620641;
	b=xoBxA+ZubGxYgKEIxKn8bnbOcAOodZm9jpFEgY65kPmaAiZKuXeI4stUYxrGJqXzRnwl
	 UQR6otTFWX2eMAVpNtA0WwA7VUwfDNB2bF2S9VtDA0iewng4qv4siAvzOCwt9Ze+aHQY+
	 2duJMd2TeSJgPbj2oyyHH8HFC6OSQ7EXdKuXJJvIRPx3OqFIP3s8mirLndZdSL6S5XpeA
	 KluREaqEhco0gXlZHjUvqKkk0tV9rb6bgWkfbMMtJPDH76tfZX3FEgVOuEMI+caLP8fak
	 7bpKkKC94rpvqUm8LEXJrYdhkDLVpYirbFTAMVHJkRD8lDr72pBj92PBM+updQIfDlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z5fnz0J6vpb3Ewmw43nxWynz3ZbXtBhlPwMnvHWjbog=;
	b=0RLHeRea7U+Bd20pWAVF7+jK9ZJHcfBEiTgDiIzW2UZv7BHV7zH/SoqnL4VbBT+F3dtM
	 /UwsyBDhuSDM3OF4n4qJKaHJ4wRBm9zSPFeVy/6fx/e/9tIR8c8JP7BT4uv4NDNE6kd1f
	 YPxtguc+rIHPc7FOESBAnpqP80mwkw2QxtqAzyFrEU1+7A+avIToXuKJX467B7TyK7mXh
	 v8JNJ8GNlatmCQbBW2iM8rW9VrD76RsiYSCYz7ZjhWpL7EUcoGCHLvZuLYPfl32nNIKVX
	 4i67ho2GrY0RA2v80tif2ICgqmhGHFWanfPF1WdidHUL7llgVEX88grBm4BHuJXJYIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzSqDX3C;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468A6606A885
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 468A6606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzSqDX3C
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d30639709so282019966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794620639; x=1795225439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5fnz0J6vpb3Ewmw43nxWynz3ZbXtBhlPwMnvHWjbog=;
        b=dzSqDX3Cs7BLrqqyl+mDnFdk6XVcYqk075Mh1zgRbnkLHYBA+bAbzx3tX2xLuklLXn
         onvu/V1hW9Wxpe5jsk2rGPU1QS0Gu4xNZZAhGKd8DsDrPAGpVhOqMRbLJFEk7GwEeHZf
         68lDaB5JLkeejylrwcLmmmRcyLWtpR9UElYAV6uDXXVrHvd01BkQFZXMJEV8vciMpxJK
         VJE4+/d+QK2UlQm373Fah915FmysSI/VjzzvENbEpeWClqDah1ao5vLQAYvhMjBVeIG0
         X53bzdGk0jIY/1ULNxEvQg1aEHHkgtQ9FBowVWDqw87kwtjGCGFV9MFyz0v6GU1NJBBh
         bVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794620639; x=1795225439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5fnz0J6vpb3Ewmw43nxWynz3ZbXtBhlPwMnvHWjbog=;
        b=GXGH4d7gn+Cw/dknroR8ZClQGeSwKYOki9snoMisvkFIedV9715ukxgh1D/T7ksnZG
         F7mMdkQX++JOkobC1ugf1TEPxPDxLvtMjieWrILc3HQzWry3h6M2P3BTrms2kOLm1j/H
         TMW3R68uCf5f7i2XGiKYDdDOs/Rb6XuXSWtG1vajHkhtGLuwS3HHH8yYlCUHc6dGf/5m
         QcSBHBoGGNGPAqdpzINOo7AWfb+6UTiNs4pLk1oBlDPD8YanF1EPnJvWfX57hObKei9j
         LD7xjp4KH+N/5BjFQVZ/cncOYxEcJSQWnFkZgRu8rZkEue0gMKD31hOhTSKoMvMbeewR
         4ZGA==
X-Forwarded-Encrypted: i=1; AL+hErHJESxaK6ZCqzZdQ0LbOC+zP3lLt8gcYTtjoDfZwuVuCNk0izGgAKFtHGH7Yw5o0o3LzuuH6M5anKJx094=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CocmqiWHa9ETpm/EM92uGdMnXzH8cF4OHNfe/kXfhJp+RxmxS
	Cbbtq+mn8UyX7MDLQu13+TTe+LB1qWVpyNruN+Sgd0IHhnav8jtlfvj+
X-Gm-Gg: AYBFou1UJuZMq0F36vIFNdRwEnaX7wZlcd9/TmYezOU8C/UG0i6PXAmk7CiHnfKlQwM
	baSMPDm3lm6nLfnJqtEJCITicRI0ypb4fIrdaYrxpwtMnnlOPMT4kVhj8niWW8lDuewLsPnhNQi
	XK8P46TDWG0MNYiiRjCQN7TZQFeXs2R078celDZhREdkNNidaNV+b6LUazqYANjHosN8WTEJqPo
	oPfIn/ewGMfYgm8OeAMb/Uu/96U/seMaP2NkRl8cwLuwXw0SrnzoURmiWtGL6SzQCXQrklAzwPV
	FC04xuLwqffwaZ0iWaO2fGaU8aCR3l9gHyO8AD8muQDt0L3i/HbswB+lRoa6SO0GIYgQeHR+KwO
	8B8zOb2Y82So6xJNqMRnbrX7NAhXOh0+zNwl05e4iap+KRt8yEsgBjnrk/JlkhD5xQiwBOC2xX5
	1TO/anvSUfdTsoWIyYJdSalxdOeUGRl+pRIx/GJd68Mhi12IBjhdi+pYxNBY1kzZypzfYOOFaa8
	ShcraMEXTTUlfuUPyGME1R5+Scw1TwqZK/NAh2FzbPBpRhDoMbKhVeBOK/6jB6Apkk5FEb57e/O
	EDvLvKzZ2j9p9uS7C4MH2Cz2k/LPplq8EeS0ZqvdCpnRnbbU+tT7A9ZPWhzufeIKdKh6kRTOJba
	FXshFxqSmte32UwaFSIHEIzQYPkENNoSuNfAAPGorotL5
X-Received: by 2002:a17:907:9305:b0:c2e:4e08:19ab with SMTP id a640c23a62f3a-c50963d50e5mr364215466b.16.1794620639602;
        Fri, 13 Nov 2026 17:43:59 -0800 (PST)
Received: from SMOK.angora-ide.ts.net (mm-156-219-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.219.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5a4c1sm161402666b.48.2026.11.13.17.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:43:59 -0800 (PST)
From: ElXreno <elxreno@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	ville.syrjala@linux.intel.com,
	ankit.k.nautiyal@intel.com,
	mitulkumar.ajitkumar.golani@intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	ElXreno <elxreno@gmail.com>
Subject: [PATCH 3/7] drm/i915/vrr: Leave the transcoder to the joiner primary
Date: Sat, 14 Nov 2026 04:43:31 +0300
Message-ID: <20261114014335.2132756-4-elxreno@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114014335.2132756-1-elxreno@gmail.com>
References: <20261114014335.2132756-1-elxreno@gmail.com>
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

All joined pipes run off the transcoder of the primary, and the crtc
states of the secondaries are copies of the primary's state, the VRR
state included. The commit therefore reaches the transcoder level VRR
functions for every joined pipe: intel_pre_update_crtc() calls
intel_vrr_set_transcoder_timings() for each crtc whose VRR parameters
changed, intel_pre_plane_update() and commit_pipe_post_planes() call
intel_vrr_disable() and intel_vrr_enable(), and both commit paths
call intel_vrr_send_push() and intel_vrr_check_push_sent() per crtc.

Do these once, from the primary. When disabling VRR also switch the
active timings of all joined pipes as soon as the transcoder has left
VRR mode, rather than leaving the secondaries on the VRR timings
until their own turn comes.

The check in intel_vrr_set_transcoder_timings() drops the second,
identical programming of the transcoder that a joined fixed refresh
rate configuration gets today. Everything else depends on vrr.enable,
which is never set with the joiner yet, so there is no other
functional change. In particular the push a secondary sends for the
PSR and Panel Replay frame change is left as it is.

The checks in intel_vrr_set_transcoder_timings(), intel_vrr_send_push(),
intel_vrr_enable() and intel_vrr_disable() are the ones Ankit Nautiyal
posted in "drm/i915/vrr: Handle joiner with vrr", last in [1].

[1] https://lore.kernel.org/intel-gfx/20250224061717.1095226-14-ankit.k.nautiyal@intel.com/

Suggested-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: ElXreno <elxreno@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 15 ++++++++++++--
 drivers/gpu/drm/i915/display/intel_vrr.c     | 21 ++++++++++++++++++++
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9a503b25ae47..20b1103e3de4 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1237,10 +1237,21 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
 
 	intel_psr_pre_plane_update(state, crtc);
 
-	if (intel_crtc_vrr_disabling(state, crtc)) {
+	/* The joined pipes are handled in one go from the primary */
+	if (intel_crtc_vrr_disabling(state, crtc) &&
+	    !intel_crtc_is_joiner_secondary(old_crtc_state)) {
+		struct intel_crtc *pipe_crtc;
+
 		intel_vrr_disable(old_crtc_state);
 		intel_vrr_dcb_reset(old_crtc_state, crtc);
-		intel_crtc_update_active_timings(old_crtc_state, false);
+
+		for_each_intel_crtc_in_pipe_mask(display, pipe_crtc,
+						 intel_crtc_joined_pipe_mask(old_crtc_state)) {
+			const struct intel_crtc_state *old_pipe_crtc_state =
+				intel_atomic_get_old_crtc_state(state, pipe_crtc);
+
+			intel_crtc_update_active_timings(old_pipe_crtc_state, false);
+		}
 
 		/*
 		 * VRR is being disabled seamlessly (no modeset, Panel Replay
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index a5a5d11380a4..668c495e7407 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -19,6 +19,7 @@
 #include "intel_de.h"
 #include "intel_dip.h"
 #include "intel_dip_regs.h"
+#include "intel_display.h"
 #include "intel_display_limits.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
@@ -674,6 +675,10 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 	if (!HAS_VRR(display))
 		return;
 
+	/* The joined pipes drive one transcoder, so program it once. */
+	if (intel_crtc_is_joiner_secondary(crtc_state))
+		return;
+
 	/*
 	 * Bspec says:
 	 * "(note: VRR needs to be programmed after
@@ -773,6 +778,13 @@ void intel_vrr_send_push(struct intel_dsb *dsb,
 	if (!crtc_state->vrr.enable && !intel_psr_use_trans_push(crtc_state))
 		return;
 
+	/*
+	 * A VRR push latches all joined pipes at once, it is up to the
+	 * primary to send it once every one of them has been armed.
+	 */
+	if (crtc_state->vrr.enable && intel_crtc_is_joiner_secondary(crtc_state))
+		return;
+
 	if (dsb)
 		intel_dsb_nonpost_start(dsb);
 
@@ -793,6 +805,9 @@ void intel_vrr_check_push_sent(struct intel_dsb *dsb,
 	if (!crtc_state->vrr.enable)
 		return;
 
+	if (intel_crtc_is_joiner_secondary(crtc_state))
+		return;
+
 	/*
 	 * Make sure the push send bit has cleared. This should
 	 * already be the case as long as the caller makes sure
@@ -1005,6 +1020,9 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 	if (!crtc_state->vrr.enable)
 		return;
 
+	if (intel_crtc_is_joiner_secondary(crtc_state))
+		return;
+
 	intel_vrr_set_vrr_timings(crtc_state);
 	intel_vrr_enable_dc_balancing(crtc_state);
 
@@ -1019,6 +1037,9 @@ void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
 	if (!old_crtc_state->vrr.enable)
 		return;
 
+	if (intel_crtc_is_joiner_secondary(old_crtc_state))
+		return;
+
 	if (!intel_vrr_always_use_vrr_tg(display))
 		intel_vrr_tg_disable(old_crtc_state);
 
-- 
2.56.0

