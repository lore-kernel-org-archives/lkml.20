Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793536203;
	b=RcjTvWlp7WxRvcwkq9Xel8QggbpnPAHtJLv7vxyFDTu/iGYYIPJ34cSre0dhG9puoLx1
	 g8Q99JJg7GPFgqPqk6s/wkrcw27t2a01JTFzXqupBUD8SGBWT3NeIeZRQC4etHJQUZkD3
	 bwghWnqesLcFVLk5vcoQgX/nhj0iur6kq1dorqJ8EfuBqOkbdzbcDpwxjw9INTmjeWliw
	 6BcwccIryz8oGy50AwnVPYMnXkhZ3tUliAZWOKR9er+w0dJS+OWxaBiknXn93zYfeBZvI
	 Ll3p1SEcbNz4TX2XcCCuP2XWZnJeJEQ6AWWzbRieCk+7q4jwNAP8GpC3cYK6OgxoqJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793536203;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=srVkZLRUEsh8lNsFW8ZIvMUhr7jAKJQIa5Ah85ra2m0=;
	b=YdrNfPgylz8ssaAXTspNzPk8+WvbLDdMs0Xatvi4uzl7ZIp/evdufDeqEL7HquxYmL3B
	 xwA/rPQ1AfiZMPiVkw6AyJkMMDqTfbYtzMD2zIwqfX26LWOnKld/oyQQawAOdX8B2ZsME
	 ax7dZxfMLAi1WrXxASd7hji6CT71A6pHOWa4zeMEW8/udcy4dmdVw+6SUTsLOI4wTiWvq
	 oZUhwBZb/2NMs3tb1m4JUJqxuQ07lT+Gn3VrLPNV2K3riSdO5I4F1RLjKj9Jf7RyCuxmd
	 N2mrUHifkTwQ0qPAd+jwExTB3lGgj1AqMRySksLAD3c07gtZuskvLYq+t3wuQ1eAXpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=softbase.tech;
	spf=pass smtp.mailfrom=softbase.tech;
	dkim=pass header.d=softbase.tech header.i=@softbase.tech header.a=rsa-sha256 header.s=protonmail3 header.b=BAn452or;
	arc=none smtp.remote-ip=185.70.43.170
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC3060A2601
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 12:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAC3060A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=softbase.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=softbase.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=softbase.tech header.i=@softbase.tech header.a=rsa-sha256 header.s=protonmail3 header.b=BAn452or
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=softbase.tech;
	s=protonmail3; t=1793536201; x=1793795401;
	bh=srVkZLRUEsh8lNsFW8ZIvMUhr7jAKJQIa5Ah85ra2m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BAn452orHYLqFv4T18JvTB8a/SaBxAvjg6X8JnaY+tm9r0tWAzcHf3dsQrwlex8++
	 PBsZ5Q2BimfCnl+6iRbbGMxrMNoAQoEURsFf/jMteqS0ISUiUZcp66wTSCg9+A9/KY
	 C0t4eXevYDJ1YLw2p9Hc21KS/ZqJWUS89VvZtfLRLI4Q4XeNrwJQ6AZeVpuGfDOk4v
	 bFnZz8GHw03oyjQBpQF6vAbsZkZI3ZGv8ZYT6X7jkXVq/ryYxnskwCZ0cNQHSIys2X
	 xWHu2qIhShh7wlULTx7H3rKXUf4xx/G414P7sYmb1d/6VspbEjyb9oooqfkRxLB8MP
	 6XwyebhP9o3ug==
X-Pm-Submission-Id: 4jHZ0l0mRLz2Sd2x
From: "Beat M. Liechti" <beat@softbase.tech>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Federico Amedeo Izzo <federico@izzo.pro>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Beat M. Liechti" <beat@softbase.tech>
Subject: [PATCH v2 2/2] drm/msm: drop the CTM modeset hack from msm_atomic_check()
Date: Sun,  1 Nov 2026 13:26:58 +0100
Message-ID: <20261101122943.8155-3-beat@softbase.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101122943.8155-1-beat@softbase.tech>
References: <20261101095754.33840-1-beat@softbase.tech>
 <20261101122943.8155-1-beat@softbase.tech>
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

msm_atomic_check() forces a modeset, and sets allow_modeset on behalf
of userspace, whenever the CTM property of a CRTC is set or cleared.
This was added so that DPU could reserve DSPP blocks for the CTM.

DPU is the only msm display driver that exposes color management, and
dpu_crtc_check_mode_changed() now requires a modeset whenever the DSPP
requirement changes, for both CTM and GAMMA_LUT. The generic check is
therefore redundant. It also forces needless modesets when the CTM is
toggled while a GAMMA_LUT keeps the DSPPs reserved, and it overrides
the userspace decision about modesets.

Remove it, as the FIXME suggested. Commits that toggle the CTM without
DRM_MODE_ATOMIC_ALLOW_MODESET now fail with -EINVAL instead of
silently becoming a modeset.

Assisted-by: LLM
Signed-off-by: Beat M. Liechti <beat@softbase.tech>
---
 drivers/gpu/drm/msm/msm_atomic.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index a8babf1db..7b480981b 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -185,22 +185,7 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
-	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
-	struct drm_crtc *crtc;
-	int i, ret = 0;
-
-	/*
-	 * FIXME: stop setting allow_modeset and move this check to the DPU
-	 * driver.
-	 */
-	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
-				      new_crtc_state, i) {
-		if ((old_crtc_state->ctm && !new_crtc_state->ctm) ||
-		    (!old_crtc_state->ctm && new_crtc_state->ctm)) {
-			new_crtc_state->mode_changed = true;
-			state->allow_modeset = true;
-		}
-	}
+	int ret = 0;
 
 	if (kms && kms->funcs && kms->funcs->check_mode_changed)
 		ret = kms->funcs->check_mode_changed(kms, state);
-- 
2.53.0

