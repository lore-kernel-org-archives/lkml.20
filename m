Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3F94D7978;
	Wed, 30 Sep 2026 12:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772197; cv=none; b=DS5dd0GZdp1bKwFqpmElKRTteR5AhsCr0EqYIbpFX16jB+jEF3tQ+FuvNbyGP+QRev+TUSFX1JjMNrAlz+5UOTGfNkY+EYaO1U4YsDTYTOjd8ahBfxm/wJvlNme7/mqF5+qOQcZILzKrFkGpCkoS7V0cvFGBGAHEu9BiCfElhRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772197; c=relaxed/simple;
	bh=a4IGsafgyKnughPqfb+gTDfDIqsfU4od/9aIZi6cjrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aImC7bxQ6bembGdCzwpkPtAiNXDD3Dok7wu/qLtq8WeOK2TjVf8SNwK0wmORFF0VcjmOlzbOBgQedF0bKmOEy+kSBv9gF0U5ogPHrHb5ypE5NynH2jGfGyWQbMgHRRfp1KDcqJQiGoIBSjBIsw9BqMa3TMdPS9UvWCH08HLIWzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1790772157t7d649573
X-QQ-Originating-IP: Iidu7VP4a111+giCVdqXAJh03guybrfOXCgSuwkCqXQ=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 30 Sep 2026 20:42:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15461729371588361155
EX-QQ-RecipientCnt: 16
From: Xilin Wu <sophon@radxa.com>
Date: Wed, 30 Sep 2026 20:41:51 +0800
Subject: [PATCH 07/13] drm/msm/dp: Track validity of cached sink link
 capabilities
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-msm-dp-hdr10-v1-7-dbbf8b2b42bc@radxa.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2441; i=sophon@radxa.com;
 h=from:subject:message-id; bh=a4IGsafgyKnughPqfb+gTDfDIqsfU4od/9aIZi6cjrE=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFl7mZcZ/L2w6UiRRcfjr29veyV82DVTcd/Vk3n+vm8UO
 rmrWruXdJSyMIhxMciKKbIoxDPMZa/MvfZUrFQPZg4rE8gQBi5OAZjIun5GhudXohg/mWb99bDl
 O/I3+QPXtUu7RcvvTW0512fw9ejhwixGhnflF+9WBBg9cp/0NnJhQd/xBtOM90kXr+22jX2k5G8
 ymxEA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Mw3/skGyA4U5DJo0AHCLJecYA0g/vf2BrUelUzAcK69ZOmkLVQOctfKs
	niF0bh+/PP3hKPw2ZCfAa+3tA/VsLvxFoR7OsMkghOXzIjbOPrx7diafRF5LM5QcpzSo12D
	J6opZ06KIHFDIVD8dUt79aP4tlxLqoh2vhh2krB27w8Vh2ozvWuviiiAyFGM2WPYA84SYYH
	ybFaQBuJ85qwhDSSMtisrqYNUjqz+lwM/wAjHlJbdZ+yQbPDPiY81tF8v8jnAh1+uBUEIsD
	9Po/96RR2fQD/Ll/Fqqr8OSP/tY5aWAQzNkGbIMoTEwfuHDP7H90xVbC9XiRA8PHc0LxzMJ
	7B2eVp8Y969UGN3RBR74tF/mcNN/1q7i/wva2duaB9lourH9IcGyjz2JY/Rqeqd+ZVuvZnz
	nIALoBqC3rkZ47a5XIzSiux8gqgE1fceWYb4Uffv7Lw8SzpmLrK+LrQ0lDuwQfNKAJOSDmM
	t37QJwOoeTEEd8lgeWQhYJ+mREAOcwKroQbv1Rru31BREO7oTlhRgtaD3M5T45raR24a3CB
	Pp871tiJvJTlK3f2MqUecLGgt5BsGLfiBdP3+NwLg9PCMnO0rOnreA3+0e5RsdrWNek9rMT
	iqpWt7tt7Co14goaDBDsZzefBpLYfXGQb40YneRElVq88xED2UFROUTJJu8886oNuOH0snW
	BWvz51o1wNo7MrKPDO7waKFnOvalSc6tIwtZ2RWZnwWM5Dg89Z7/N3zyT5s9ee6/rFUYNCR
	Aj78NXkX78Tg1dwmOUNXmVNp4ujCs8p3C390vKszlGtYWoTzvpkrQxg+AJgy5qDWYXszYHK
	jb683n6QJoVIzcFT2z4JhliHC6gRZFcFyFzXeQKCkBP9X2hTBTen4zjy9JP1iLJ4Pwj65ow
	RWz+ir07pWTDdDSVouwqKxvkVIPUw59Ny1cf4bG9zx58ya7D16PrXpSrzGPPtWB6Z3ly1iq
	rqU6hUPdFPCKt5gY8cYTWekXHAkxzQSTbG0WotxTfZovCpVQT7AvLi3vdLNeeE9y5VG6aEy
	Vp6WPoIGRWSZ5zLubPo0i9XQVgyHfwOeVRwJtCQBwRQKpWvsZcJjOsBBzMlhRyvBj97UP+y
	hqO1rIB500p
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

An eDP panel may not have been powered up when its mode is checked, and a
disconnected DP sink can leave cached link capabilities behind. The cached
values alone do not distinguish either case from a current read.

Track whether link capability discovery completed successfully. Clear the
flag before reading capabilities and on unplug, and set it only after the
downstream information has been read successfully. Subsequent atomic
checks can then defer checks against unknown capabilities until the sink
is accessible.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 drivers/gpu/drm/msm/dp/dp_panel.c   | 3 +++
 drivers/gpu/drm/msm/dp/dp_panel.h   | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1bfa6696d904..9c5b1cd200f8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -519,6 +519,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
+	dp->panel->link_caps_valid = false;
 	if (!dp->plugged)
 		return 0;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index fdf1a3f437ba..f7aac0d25c87 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -247,6 +247,7 @@ int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
+	msm_dp_panel->link_caps_valid = false;
 	rc = msm_dp_panel_read_dpcd(msm_dp_panel);
 	if (rc) {
 		DRM_ERROR("read dpcd failed %d\n", rc);
@@ -272,6 +273,8 @@ int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
 
 	rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel->dpcd,
 					 msm_dp_panel->downstream_ports);
+	if (!rc)
+		msm_dp_panel->link_caps_valid = true;
 	return rc;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 4519ac374220..4fe6af8b304e 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -38,6 +38,7 @@ struct msm_dp_panel {
 	struct msm_dp_panel_psr psr_cap;
 	bool video_test;
 	bool vsc_sdp_supported;
+	bool link_caps_valid;
 	u32 hw_revision;
 
 	u32 max_bw_code;

-- 
2.55.0

