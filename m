Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A9639E164
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792361855; cv=none; b=CkgMshBmQ1Xcx5TxY1lvW18MI/oHw+2udgGLq7Qb4uQ7H8wTtWfXAJ72YN1+tWEslWjybqnD46cfZ0LYB4/fJEe6mB7CNbfGemmgYMP5mnjGpaHTUMHvmVRocIVm1FAY0y/bsp/iHudc5UjMtT0vYZxIt1Wzsddvf4PUExBw/K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792361855; c=relaxed/simple;
	bh=z7Q6lTYTs4EbXKb1DjFff2cwqua2rRbn3u+3K+dQjQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+doquY6kcskm7rs2fRQsEDC2S+aNrFg0lMRx0deld5/hby5BkDSSaMowe0Y9vrULbH3X3aNBfhY3yUH4aOItuZ+L8gbnoJjB4D4aXLXVM3sgphYPMWM6lyMEZDAv6GyyLaIr1thpDh1b/joN9ve8wBIsDsH+Mj5QBDsl9EJk64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsnL4Hjt; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsnL4Hjt"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso14169465e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792361852; x=1792966652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nAF9oPetXs/1/u0SmZXy5Zxa0XcvT5gTByOb4pwMeyU=;
        b=IsnL4HjtW7GtPVVBetuWv8PMY2i3vt22dzSq7Qh3FIlk1XLW80kDstTrD5wUDBp8Jn
         fXOSUhN2Su6HWoPkmqCTG1QAqkE5WtMJqLdMJTY9p04lNGbAZ4ulOXmOV+SyGHbs/k1X
         NKjffX+nI49+uEGcjo4WaffU+bWHVxy2LdJF8aqFFM4JwbtHcOjaP1kNHOGkTJIWFCaY
         lBxoGiUelrbXTtJdn4aQsQb5kumaG6nhuGDjIEDD4umCye+q4Ni2Yk43BSdGcUff2rsT
         l7MWCozM53p/1nxz9TVhMID7B9jTmAmBmQjYNODjnHD2DIopIM4tz6mhcvIv5n/7tBVW
         Oy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792361852; x=1792966652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nAF9oPetXs/1/u0SmZXy5Zxa0XcvT5gTByOb4pwMeyU=;
        b=L1eFW/0iRiD4CZjdeNy6b9JtmBqNKtfPQlcPRHQFDfaVeWom/iKzA4g1SYblzFfFwj
         0yTvazJb83oFI4taNkgNZ3PCXk4DhzujTA6DZToKoB2YTodtcef2dcByP39kdej4ijXc
         kP4Ks2rU5fF/yIGwJlrprPnyTHSzzQh1lRDJGEhdSLRg0nPPeMN21A3Oyde1TD14nwUm
         iwCayxUuEvPC9vphFsaxq7tsASJ/HueTRXqIHgebeth/SvpWxv2lvSrOybYvaA3lUwJH
         a0kltJjtreV27an+CzUhufR2KKT94p38NvhC6GvbwdszfQJrDi3C28SGWldKCRQYq1OI
         QAjA==
X-Forwarded-Encrypted: i=1; AKwUvBx/lkgP+ksQQ7JYZSb6leACX+pwqGkgttEeEGjBhHsBwRT8EX/iA4QxRF5in1BSzJkICoW7WFKu2rxz7F4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0OhAr7GJ95nx3NhVRtY+Av+nuEtyeUBfWURbPHWNES9DwwtY2
	hNQHvl1RFIGx0bWPEjPi8qHq3JTE89iO3WebKJuizubHKhcP4Z5MhgV0
X-Gm-Gg: AYBFou1MRmi9vykN3SraV3pTKWd9yibf3lIvpuf/1v4qGW0VmMU9uUWcvAS3MTFKJSh
	sRvUfm7rzBONOyZXpVPZGwoquvih04VsJmvjg9dMOsXH7RNtjpBoTbPAsHfoYl6fwPQThgsaVoD
	e/VDz/kvn3r2TTPFRM67qF4HE2TJbpVxeJsytIGFD721IHLIDBoazShy9dhssvpFA3k2wH2kzDL
	Y9509bBdz8ZoXgCEtbSKPSNq5V8QMMPXWIWXFhprKKqmeIFf9cNDz4Ua/m4ZwRwHLzslalXnOX0
	0Ke5zcCQQGr+6rRFSzKwcyBzHDLGUS6bEBIch+yns7LMLXNwRqAbaEd4iClJU/hd8JFkkr2kgML
	VFY1zfMGwRHHDowXAO8DdbMTpTj2hmQyFW8n0doJtP+FdOGcx4rfLC2IFSYOBabE5epzhzLie76
	zSHZJT36xcAXKsPOD/AG182niesNPC/mwOX4aF2Bl8UhMOvCIdyfDzPLxZjTw+MNEB/Ii4sjPEF
	mZWoZdFWSinId3Kp7Rqf3Ar82lzOgF1mFX9rU5ZL38lJS4MQNE2GPgQ+wJbxog5AlKJNw==
X-Received: by 2002:a05:600c:8219:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a1d76031bfmr129943605e9.20.1792361851851;
        Sun, 18 Oct 2026 15:17:31 -0700 (PDT)
Received: from localhost ([178.214.243.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d85f92d9sm155398425e9.4.2026.10.18.15.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:17:31 -0700 (PDT)
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
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH] drm/amd/display: set allow_freesync before validating a new stream
Date: Mon, 19 Oct 2026 03:17:26 +0500
Message-ID: <20261018221726.27259-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c
index 7e484adb4120..f26dd206dffa 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c
@@ -128,6 +128,14 @@ void amdgpu_dm_get_freesync_config_for_crtc(
 					vrefresh >= aconnector->min_vfreq &&
 					vrefresh <= aconnector->max_vfreq;
 
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

