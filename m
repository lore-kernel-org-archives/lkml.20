Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB9A44E67E;
	Wed, 30 Sep 2026 12:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772202; cv=none; b=i4c6g1x6DopDI+6yjVGrlDIVMUvVyiIhgwqNQ/6T4X6xouZFWiBt78LcwvWDXrYVOBoqkAdGfa9ka/NXBT0aGiSPKjEG46PKql2HvocgxB2hLlgJFw9rt8fCj9192b4FjZ+yQiMPrMEsLgrOcbHj0YbFAJCazSkFXtzWCKAofJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772202; c=relaxed/simple;
	bh=UI8MWclcna3i912ApYu3ZkEYCbnyI0/V3H5NaAfD5xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YanBJCxdLQSRiHTGAZJN/LDEYEp3HlKh7S/Kq8S0LSxRQtLXmsB/UwfqcgsU1VRgOSWZQpgmEVjxiDtHqPTKRYChG65ddRnyeZKPPppsR+L7DxoL2iuDrOnYAc/hi0cVA/LVzDZCLLgCI2RSe8ZL/NhGmdJa8tlbWUxOJK5SKjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1790772160t1bf1ccbe
X-QQ-Originating-IP: EEFNbyufz4t4oGcF2h6wvs59l8IohGSawwKeAu5M4AU=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 30 Sep 2026 20:42:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7675296171041416644
EX-QQ-RecipientCnt: 16
From: Xilin Wu <sophon@radxa.com>
Date: Wed, 30 Sep 2026 20:41:52 +0800
Subject: [PATCH 08/13] drm/msm/dp: Rebuild the eDP stream on modesets
 leaving self refresh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-msm-dp-hdr10-v1-8-dbbf8b2b42bc@radxa.com>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
In-Reply-To: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4291; i=sophon@radxa.com;
 h=from:subject:message-id; bh=UI8MWclcna3i912ApYu3ZkEYCbnyI0/V3H5NaAfD5xk=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFl7mZcFPNY8yD9NbvK8Bdn8TSqTC8xW5Z68+ylTT7Ni7
 w/pn6tYO0pZGMS4GGTFFFkU4hnmslfmXnsqVqoHM4eVCWQIAxenAEzkQzDDX9mG/8WKN17/fmXw
 TV7+88kf5RF9pqr7f5qabnAx3h8nf5Thf1bNVIFjbLpXpm5cI133xeq/senP8oK5cp8V8m97Su9
 KYQUA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NyTsQ4JOu2J2N79cLSf3J6EkbNcIPutyKW868mULow8KO0STjgAIbh71
	HPhxUBcVXXZWBR3AkdnMtJ3PmKQL5h2PMSbhhfpmwMOyXVuAEFAkbkWR/c8CzEaCKkKPowM
	duzGUnBQy6jJiijpDS/lQWw4JKlo1MWPhmeKNRDeDgyULZvLQbXl5trGF5TgRuZyYj/PNWL
	gaO7l4CKlVUryC5oYhRtCpCfJX1JbnJv6au85F/cXF6LhJex9z2HBIbNc7iVbSeXw8P7cdx
	tXmdvalM8xjAs5jVLqoIdLXphV0JGwWCU7SDeatCy96mU1ejxFpy63eR7wgoln/f3LtpzDi
	bUaAPEasnVbJXbq6Tc9fN3WdWTM8NOPdbfCfZEPv+nr9NlF0ZJg+s1pr3Sax+i4zyaqF8z7
	HA1LFCIaaHn0yYTohGEbKewc0hoWmbQ/11dtookzcugDb1HCrsJB68cgzdKA7tyCH8OGfcw
	5D6G3+D0OWiehf05CjbsrW1ITC/zj1eNEHy2ieyeebZpeGJKQAGkZqAK5MhTalz4E6hk3Gv
	D3uGkKM7+SmDE+FJ/S7QpoEOH1rp3h/CltoHtoVOhm/ZHV8c61nQYBkRyQ2LGO3dwJcI1Wg
	qhMksUw1oc2hiBLlrva6sp8rrj5NfXdupHp9d7Qtw/niuJt+vd5/Ogv9/t96hK95dQ8H4el
	srnaluVS1HiwRGW9hLazWK8VoEqiWpbyyGr2S5EAaft2/IzO9Pq13YzK2Ss4Pq8J2f86ep2
	BlAR9httFtI2kQ6rYNYPOvL2Xkxvxyo2ARRYuLu/pA1R8D/nd5n0OX/qOb/cLDnkymzxjbi
	4hGn0dvRoQy0SIIPWxKwPFXgAAmPibdUi2BL+jk5FQw84xriClFdl8g2HMV4/KYNyhp3J65
	z5+t6LIQPmFn8TjlhqGiISwt+JvcpgscN9cV3tOR0/v5aptMSVCQZNFivg03RWPUFGZL8yl
	XNGW4h/qTY+XyjsuT9d/+iTiv+BDpAK1W+46Bgye0TV80cEAdJmRyY/5lO2irVjfwwEU9Qi
	oASWLL+4NeoGlCD4Os4gDiGiXkZi17i9SuaqOT+Aqx29hRzRKk+Y9Vfpg0agp4s4WC5zMta
	Q==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
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
index c1e4147bfef1..7332fbfe1644 100644
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
2.55.0

