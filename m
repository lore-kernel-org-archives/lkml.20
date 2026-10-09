Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F52237C0FD;
	Fri,  9 Oct 2026 03:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515951; cv=none; b=cKR8KM47CBt8VjpE27mIL+EgdE6J5UT76grrQoOn7dZFH0xWqDxhFTX6xXNnLqz+c1j67rvldARjQihGH3FK4pCFQuSJlYhxAoNXUfPEbh1zWRkWUhAtNMzsrWgPyNkHTOLltQu+20drZBu4xyDPPG7t6xueFMlcfh/kSMPbcMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515951; c=relaxed/simple;
	bh=sr4aO+I/entmMZ8JCT+QlWp2I4E0ZCpUfm9WN2ZSTd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iFnMImn3EZKTllzQ75FabvFm1n/g65rqGsA1J4pfcOM0Ee9Sum5pEr8JowvQoBVA5x2fOjgWd4xavqrZl96XATAiFWIyR4IPjuxDzLPAzcnFXxL9skhKBxLvxqn73BD7V0d6ZqDZNMsVXBTxoPl34EPQnyhf4v4mJuIlZRNo1VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1791515870t69f91405
X-QQ-Originating-IP: nHOD05SkEyMVfrOgKznxlEQq6/k5vIGyj/c/FhbiQhI=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11386624745954632910
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:16:04 +0800
Subject: [PATCH v2 12/20] drm/msm/dp: Rebuild the eDP stream on modesets
 leaving self refresh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-msm-dp-hdr10-v2-12-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dragon@radxa.com, Xilin Wu <sophon@radxa.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4291; i=sophon@radxa.com;
 h=from:subject:message-id; bh=sr4aO+I/entmMZ8JCT+QlWp2I4E0ZCpUfm9WN2ZSTd4=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlYqWP44a65XaCs05dpNocKLe7ff3nQ+bkd6X+Utj
 p2T4xcd7ihlYRDjYpAVU2RRiGeYy16Ze+2pWKkezBxWJpAhDFycAjARiQOMDCvrn6pG14Uc4H7u
 V3f+o+fe845Lalvuht76fnbpu/8+NU2MDHvf9M/gqXUu3bPpj4lIycPfL/d1fbkQYKoZk3s2bl7
 Ech4A
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M2GOzXfxLYLpIMn2z5lv065V4+9CFVWeAVDaKYQsqt9+wSL3a71ZdGFT
	KRomiJDb9y5N5BSrk8s4G8PABpSScmYusMsFUzNX8lZb6JPSvSaHEn2RsWO0TJf3N2yq0m1
	4bQ4+AyWE3myXYp0iLP3i9k+zhpKpaKngQO3osQ2+92KbtT2VDenuBB1XF88Mdu9Fh+rImM
	lrTdPUMEOz539X5PlnzVeq+ACBD8X9b+xZSsfeC+2nTEzVYJAO4uMT7miD//7yXbwIBMlyj
	UPU3pEvlY/ElQGMJalCMhrmFmkMm/aQbBr/KtGgcU1ppXv73jgtvAszBWCaJETPLykJfNIO
	U6nX0A0W2r3BoCeIWwHeuIi8xgBq7DYBEHPU863SptIRdugWvmsqxZDMnGXdmYl+4z6qbS+
	50+QZaDL+GbxsCFKI5+9o6ABX7sawIDzyNli0aEVJ8ostdZDSqjCS5OfxHjCRcLBuNhFFv3
	c1VAFWx7lPWdvPP5zn9vdYLA0BOWAySV/Tq+B93+45aUq/lX2Ni2ha7qU9WFNSkaJ10bP/H
	pGZJOYW2F7Rz/OGUVvb40uxrpOzfXZWfuAB22tU6f7ad7U4pRylpD3bPDI1nQey02seqnnG
	ZFnbJD636t9hEZSpKVqTOBXavqhzWkHOtsWNyoK9pAD44gSUiVim8wenTpxnBwL4AcdlX63
	5gher7UnrcHeoAremViWTDu6agGhbih/dgwmXeSnznGfw1aG7dXP7cRf+0vGlGXLMTa2ype
	OyAJyFEWBoi39GJo/qRm+zdmfE2gf4/Drdp4MwrRmB2Zb+THHKYMoPm0znE53TE+E5vdaWx
	ALfHRJvcFybNvSAsl4+rJn/QxBxAfHzU4r7JE5tTDiJAAmMRraKgtXr5hGe5swa8OqinU87
	sAwjbHckQ6mrCTJ3UjB/gxtrXUbpUWxOfkNEua3z8X/lb4F67h48Kk6BlnXEK3DsRHG1GmS
	NOYpaB0tJ33VSgtdo0MNlpNC+BaTQWo0OncjRUzZrssAQGGBID0vkuctpj21aMlBLyvFwDU
	Mc0fQCwLXzL8q/FySyMa3HCexlwutGMRDjjjno46T12QpjQ+ifck2veCqTy44mrODDFvOVV
	g==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

The atomic helpers skip bridge disable when an active CRTC leaves self
refresh. The eDP enable callback also takes a fast path that only exits
PSR, so a concurrent modeset can leave the retained stream using its old
configuration, including the output depth.

Exit PSR and tear down the retained stream in pre-enable when leaving self
refresh with mode_changed or connectors_changed set. Install the new state
and run the normal stream enable sequence afterwards. Keep the fast path
for ordinary self-refresh exits: active_changed alone does not require
rebuilding the stream.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_drm.c   | 24 +++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_utils.c |  7 +++++++
 drivers/gpu/drm/msm/dp/dp_utils.h |  4 ++++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 8c4446b12925..df224ae46d9d 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -14,6 +14,7 @@
 #include "msm_kms.h"
 #include "dp_audio.h"
 #include "dp_drm.h"
+#include "dp_utils.h"
 
 /**
  * msm_dp_bridge_get_modes - callback to add drm modes via drm_mode_probed_add()
@@ -54,6 +55,26 @@ static void msm_dp_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->msm_dp_display;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+
+	crtc = drm_atomic_get_new_crtc_for_encoder(state, drm_bridge->encoder);
+	if (!crtc)
+		return;
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	/*
+	 * The helpers skip bridge disable when waking an active CRTC from
+	 * self refresh, even when its color configuration requires a modeset.
+	 * Tear down the retained stream before installing the new state.
+	 */
+	if (dp->is_edp && dp->power_on && old_crtc_state->self_refresh_active &&
+	    new_crtc_state->active && msm_dp_utils_psr_needs_modeset(new_crtc_state)) {
+		msm_dp_display_set_psr(dp, false);
+		msm_dp_display_atomic_disable(dp);
+		msm_dp_display_atomic_post_disable(dp);
+	}
 
 	msm_dp_display_atomic_pre_enable(dp, state);
 }
@@ -157,7 +178,8 @@ static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 
 	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
 
-	if (old_crtc_state && old_crtc_state->self_refresh_active) {
+	if (dp->power_on && old_crtc_state && old_crtc_state->self_refresh_active &&
+	    !msm_dp_utils_psr_needs_modeset(drm_atomic_get_new_crtc_state(state, crtc))) {
 		msm_dp_display_set_psr(dp, false);
 		return;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
index 226b370ce8fe..72bae48a1fe0 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.c
+++ b/drivers/gpu/drm/msm/dp/dp_utils.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/types.h>
+#include <drm/drm_crtc.h>
 
 #include "dp_utils.h"
 
@@ -87,3 +88,9 @@ void msm_dp_utils_pack_sdp_header(const struct dp_sdp_header *sdp_header,
 		FIELD_PREP(HEADER_3_MASK, sdp_header->HB3) |
 		FIELD_PREP(PARITY_3_MASK, msm_dp_utils_calculate_parity(sdp_header->HB3));
 }
+
+bool msm_dp_utils_psr_needs_modeset(const struct drm_crtc_state *state)
+{
+	/* active_changed alone also describes a normal self-refresh exit. */
+	return state->mode_changed || state->connectors_changed;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
index 2fdb89efc57c..5d86c978dffd 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.h
+++ b/drivers/gpu/drm/msm/dp/dp_utils.h
@@ -10,6 +10,8 @@
 #include <linux/bits.h>
 #include <drm/display/drm_dp_helper.h>
 
+struct drm_crtc_state;
+
 #define HEADER_BYTE_0_BIT	 0
 #define PARITY_BYTE_0_BIT	 8
 #define HEADER_BYTE_1_BIT	16
@@ -34,4 +36,6 @@ u8 msm_dp_utils_calculate_parity(u32 data);
 void msm_dp_utils_pack_sdp_header(const struct dp_sdp_header *sdp_header,
 				  u32 header_buff[2]);
 
+bool msm_dp_utils_psr_needs_modeset(const struct drm_crtc_state *state);
+
 #endif /* _DP_UTILS_H_ */

-- 
2.56.0

