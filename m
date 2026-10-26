Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000034;
	b=KQ4nafnZRJs1wZ4EA3uNJ92rlsh5jVhY6NXfo07nQC1wPE2gZeLVNQ+2+A0VWxbHae8a
	 uLcK1gVYUjZthwhxUCv1CDeGJk6u1o5MV6VEWDryDuerD5YSvu15DzJKRHEDUr5qE6feM
	 6me/ClPfiEyLr3Dep/YkFQbdCppKONTbyHKja86MWpAhtZaHulc/kuwFcWo3L9WdmgTLu
	 zDw049kdEB68FmRfCKrASSv30GCVLJPB2qpo3AaxM1abJuOK49Jx+gg63YkQmCdIQ6sby
	 grEx104O6NFnjs84Pm5Kc2ZX6bn0E5rL9b79/gIPpOfjZlyG9BpQfI1fl/usBsACwHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F8U0LKvHGA5PLMBRYsbuaSBNWEEM8e/eqX0yoWLbYmU=;
	b=J1k6Xeq+ORW+EYIqBt8oE3d1UeeIblX5+Ro4QiCHhW0PJEBJETryUgEj9we5yj7ef4Vy
	 ficsPJZW0a53WuFxhf/Waz1Yt74r3XB1EVbvIFv5RtbCijAEK3mELAZ9v5uZj7BsRJ2HW
	 qtElnxA62sFxwWbOzwHTw6IuKQ7it2f3tSKGgt8M4TQShynfiwSDwEU7NLawWFqDjB9kU
	 B9zpe89S9m7R+oKGGYX2XU8s46IQZ0TjSXEtvLK3DIOurPKzASRk0HXuxxRWrXM7wdzWZ
	 IE313DVrDTpqZaYw3GLwPTzjmLhVQZzueI2ymync16Rhvdxmb08tOgLMLTGvwPdk5EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Iv7Jv4BW;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4121C606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4121C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Iv7Jv4BW
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab28f3e4dcso30277211fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793000032; x=1793604832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8U0LKvHGA5PLMBRYsbuaSBNWEEM8e/eqX0yoWLbYmU=;
        b=Iv7Jv4BWEjH3RCZxW59xap37rB2DpPqWMaBupTktmbSB457Ye6EljU6meZDw9BgwLX
         sNQ4QXuCJGIMDYCuHWOe/up3oHvsvmZp60g3XpEEgRtQf3ecGpSjdxqo04VYhaw1O9xg
         nD9ZYEwMAIvTJu9OJzvZXZ74l5hWSo5K1zcCgYfP4IF0Qfgsh6B20bGmX9aXk+tkurVh
         gZUR/glYKjTLgHVPZ5W3POEn1TMoKVSQgFOv0P6LsBOugdnNaJG7SwawOW/ieEDd90O2
         z4MbNFAlEZUARLqcKIkN6tKCMBwUJTxW+KE5MEDok7TLmOIoIVf70OLlPRKNdCK+3OcK
         aDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793000032; x=1793604832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8U0LKvHGA5PLMBRYsbuaSBNWEEM8e/eqX0yoWLbYmU=;
        b=equgzVK1k1rnbILoiAGcz1U2FvIuZ+E/CI/uWKQQyTUvCROH0zQ5nVrWyAtvWg4vGi
         G+QCXCtA6K90TIshSScdwlr3Aaa5M8cudp8yl/2wCN1j3sfaEBdGQMV8dc8YXGaeOb/O
         7MW8+SqT3/c3EUxIDOCuMQqhfW93+mXWHqqGUVFjdJcw8oyIVrlOi9BxHwVh/D6KQ8/G
         MZ5aZv3SRVYIyJT+S2cV5b/ucLKKMPgj1JVbsLThUZXp9piWg0JoMuPUM8ZmGIGqji4c
         LaXCpFk5ORkZtttG5flANtfI8Uyuzg/2jmK/xYZN1gCZ5tVQTukyjIDEGTckqEBl2e+0
         +Bsw==
X-Forwarded-Encrypted: i=1; AKwUvByWS6VcMORD59zyp2PCbCsm4qaBne+ZDmQvG0mHk02w4C+Kt34RuYSR+wm9Px7cG9o+UZSPPiG7CWY16fg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuFAqYYq+NY66JK8ZAnBKRSo0Un+5caHlGo/BX/2HCH11+hpTB
	S+R3R9aK81PeEX7+3BxEr+ncrnPr24pMQ2gHOBI1f36ZjYRowyN5hgNT
X-Gm-Gg: AYBFou1KVpdUupqkHGlw/hTvfhb22ia2dJ1pDZfUGAST4WKR0B9BfzFzqJRc3sEMIuC
	P+C/Rg/akot2UFqdBfA8AYMuMLGz4lCBIiiTdYdNEv7xmhZ8V0J+cKFocbEJKDiNRL1LsFqwdGk
	Z8zZiwnsO3mivI/SAa/A96wc4EPYeEL+Jdv2ttrGVq8luCzmSLbJlkfiWgg1moUFbOVczZe3jMr
	HG8zmUQ5qjdGPkgvZhRSdrRGXvpXNGK9mbK+fKK8GfRUiowl1lWYhgj7k7fUZfeXv6TwaXjHhrO
	gAB/1g/Ibsi1vY21p3y4ZjsY6pM1Ykp5x75Vn2eDk8JzyPYcHutGnXDDgD16jqrlXxlU6kZbeZg
	eRFKJD9CEmXaY92XfSZH6izzihAEd1QFgJ1HCypltiOhm6xCHvWgDh/5zLgYsHR++9HbFg6OV5N
	CHaWXdB/4jc38gbBkByqPScsrgH+nrAQXFK5GUpSV5moeXBHu/PEiedlgtVIzqTH8X9NCXWokFK
	ZdIYLcGB1+QTbnqpOoVnR2lSN/FGa9eCB/pIwLXsD+gKn/eEw3OJI+Wp3vIZ5ca8CaFxtx/4SS5
	pQErbw/0ROONEUY87MTXP06g1c38VZWkWxk/HyjdkbkOPhd7tGM9pw==
X-Received: by 2002:a05:6512:3c9a:b0:5bc:f296:a12b with SMTP id 2adb3069b0e04-5bfb7449714mr1568356e87.26.1793000032116;
        Mon, 26 Oct 2026 00:33:52 -0700 (PDT)
Received: from localhost ([178.214.243.78])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfc085a3d2sm236852e87.10.2026.10.26.00.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:33:50 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Alex Hung <alex.hung@amd.com>,
	Alvin Lee <Alvin.Lee2@amd.com>,
	Jun Lei <Jun.Lei@amd.com>,
	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
	Fangzhi Zuo <jerry.zuo@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	Josh Kasten <jkasten@gmail.com>
Subject: [PATCH v2] drm/amd/display: set allow_freesync before validating a new stream
Date: Mon, 26 Oct 2026 12:33:45 +0500
Message-ID: <20261026073345.297491-1-mikhail.v.gavrilov@gmail.com>
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

After resume from S3, DC enables SubVP on a single FreeSync display at
a high refresh rate, although dcn32_allow_subvp_high_refresh_rate() is
meant to keep SubVP off that configuration ("For single display cases,
freesync must be disabled").  On an RX 7900 XTX driving a FreeSync TV
at 3840x2160@120, amdgpu_dm_capabilities reports sub-viewport disabled
after boot and enabled after "rtcwake -m mem", and the memory clock
starts switching.  It stays that way until a later commit re-validates
the state; a CRTC gamma change (toggling Night Light) turns SubVP off
again.

The policy reads dc_stream_state::allow_freesync while the new state
is validated, but amdgpu_dm sets that field only in
amdgpu_dm_update_freesync_state_on_stream(), on the first flip after
the commit.  A stream created by a modeset is therefore validated as
if FreeSync were off.  On resume, dm_destroy_cached_state() drops the
streams and forces a modeset, so the resumed state is validated
without FreeSync.

Set allow_freesync in amdgpu_dm_get_freesync_config_for_crtc(), which
atomic check calls for every active CRTC and which already writes
ignore_msa_timing_param to the stream.  It uses vrr_supported, the
condition the flip-time value is derived from.  With this change the
same TV keeps SubVP disabled across "rtcwake -m mem".

On this machine SubVP is also what exposes the single-frame scanout
corruption reported in the thread linked below, so the FreeSync
setting stopped working as a workaround after every suspend.

Fixes: 87f0c16e0eeb ("drm/amd/display: Enable SubVP for high refresh rate displays")
Link: https://lore.kernel.org/all/20260829010525.29935-1-mikhail.v.gavrilov@gmail.com/
Link: https://gitlab.freedesktop.org/drm/amd/-/work_items/5714#note_3736349
Tested-by: Josh Kasten <jkasten@gmail.com>
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
v2:
 - Rebased onto amd-staging-drm-next, where vrr_supported also depends
   on vrr_timing_valid, so v1 no longer applied there.  No functional
   change.
 - Added Tested-by from Josh Kasten, who ran v2 on next-20261023 (the
   file is the same there as in amd-staging-drm-next) and saw SubVP
   stay disabled across rtcwake with FreeSync enabled.
 
v1: https://lore.kernel.org/all/20261018221726.27259-1-mikhail.v.gavrilov@gmail.com/

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c
index 386ba88c57c6..936a899aef00 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c
@@ -170,6 +170,14 @@ void amdgpu_dm_get_freesync_config_for_crtc(
 					vrefresh <= aconnector->max_vfreq &&
 					vrr_timing_valid;
 
+	/*
+	 * DC reads allow_freesync while validating the new state, for example
+	 * to keep SubVP off a single FreeSync display, but it is otherwise set
+	 * only on the first flip after the commit.  Set it here, so that a
+	 * stream created by this commit is not validated without it.
+	 */
+	new_crtc_state->stream->allow_freesync = new_crtc_state->vrr_supported;
+
 	if (new_crtc_state->vrr_supported) {
 		new_crtc_state->stream->ignore_msa_timing_param = true;
 		fs_vid_mode = new_crtc_state->freesync_config.state == VRR_STATE_ACTIVE_FIXED;
-- 
2.56.0

