Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE90B38838F;
	Fri,  9 Oct 2026 03:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.74.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791516025; cv=none; b=MVloM8NOHZ+RAsEgszdphIBVvs4eV8Nf24h57irZ2j/kaKLTyTsZ5Xb2kQIjQpl/HUIguzkgqcSQ4xiuvVME0ocGDM9HeFj6IcMziEignMuYMmW6xSeAyc57eFEcVo3rUdGUpc+mEIVp3QfCM3/rA/RJTD2fnbqhNACpyZMRQr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791516025; c=relaxed/simple;
	bh=UjFIXijNr1pzmNLWjNFf1sbanjbBvQlfCd9rr2qiLaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U6ANtwWxDpbL+Ggcm+TU9g4nwhIbbK1DSJ6P1MPIrtWKAxTgci3f63OZMu2QnMjOXJStsJoNq9CGFiH1ZMJqRYd1DbceoyBoHzx2tLUS08J68XmDPoUwzm/Ud3DPLubXI6JiNL4/HS3MUd1SekKKj2qM5Px5Ubd4IjdoUzYqsbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=114.132.74.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1791515886ta7242542
X-QQ-Originating-IP: l+W6hRlVtBHQfDWT8V5zz4miNkGZI0SAE1TvYswxTT0=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:18:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9731896443966331316
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:16:08 +0800
Subject: [PATCH v2 16/20] drm/msm/dp: Disable PSR for YUV420 streams
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-msm-dp-hdr10-v2-16-1835d4966da3@radxa.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5080; i=sophon@radxa.com;
 h=from:subject:message-id; bh=UjFIXijNr1pzmNLWjNFf1sbanjbBvQlfCd9rr2qiLaU=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlZVBVVpuU+p3cWf4v31vXBZ2o2ZVZOu5KW/T5Lf2
 Kllzvu6o5SFQYyLQVZMkUUhnmEue2XutadipXowc1iZQIYwcHEKwEQezGBkuNjxsdN1b9v61IvP
 p8347R0Z2LJhgUqx5G7G5T+e2LCuqWH4Zx+yY1LK+o/czg7rD5ikq+X4mXud4tH/Gu8eftVm1vp
 ENgA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MN7J+qOXnZ1LDH2Nj3Cy8EmdqsBlYTKsQ30UcFhZ9dD8ZxYdG4lCGiQL
	AkEDrVv5lQOTiGvLBmKCBNmIXiDWg+PawGqzwAEK1ZJcHUwjjmuIGCNDCK/cWpcFaua/hwZ
	PnW/qsM1BxgpXUSd1J5WM8bPvTX6pV1wPOcNXGoSLKkXkdS6mp/1Fgp2Oqa8GtzKqRngNfc
	Bp5u8bTkziOIvTF/9YfOiE5yj01Fonre1FEBlrSZCQ2glEybwSFqpJPKFs/HZkep47wx6al
	xfQnh02Gt1/o+TaokaAaGF3rbzRLiQz8jTVDhEqnOh3NurJd0hMMAFWeI97lksE0ex+Q3Z+
	H6iFGVDLh3O4UdM/mkPDp9u/5cx+hPDPc8RH+9tqnX1DjJiRQOW0Ae+uDOKfTovD9pHbWBm
	5KyRI8DSb6sX8voL/Ia7hSwLfDYjIE+DwuOrxUDSsDTzzJpEKtcE5ThM5vvr+gRIuF+6Llv
	jvwQvLzZX8E5G5A3lL73MgrwILKBroNcbyTfYZydYaDZyA4txfC9kDDFv9W+ebPHjpLpuuU
	UtEwl4p5LAZXrzl5lHeOFYrVLJU5JMNamEwPLx39vUOQG9gpu33pnib+pwUeLvqvd/KRyEx
	IB1YFpRZdareiRrBKYXhEx+KsEb1WA+jGCIXI/mON2/tKFWjOuAUZOXLvpddONbbqJRwJFk
	PS6+yttkjmA4vLL8Syln9mNUTuU99deN7TlAfK7tGLG1oaf2mC+HoU40A+uv/837BRrcig2
	BIVvAZ1u4DtqXC2uUuRRKUgrVswGgTOjp4VWHNVoQXQynmJ8mC9l/CAY0SZa8c/2yomtU7t
	TB9txQjJEhkVKrFZM3vnYCkZBk3heunNIez07p46oCtGbZkV7Y+q1ZlQusiAEbbL8YpzgWr
	iBX2UBqAGruooa1l1OyQ/5wrhZZpJz2m46lcLJU/Eq1sICRZEHfdwOI7F7f6yVUi91Fg77A
	EBil8LIbkm77/ZfxhhwbKh0L638EjJcWquDFu3XYF3ii9sBH5u/6u8s0iCQT2wwQWmryhtV
	jhk5YQQ97cFRH+h3OL5QD8Am32A7iA08R4PPMCxUGFggSY+ReCmDR3z2gnJE+mT1ejPe1Tk
	q1g/RrBdT8l
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

YUV420 uses colorimetry VSC packets, which cannot share the automatic
PSR packet generator. Do not advertise self-refresh eligibility for
these streams while disabling PSR in the controller and sink.

Compute eligibility after the common atomic check and reject an
incompatible self-refresh entry. Clear the automatic VSC generation bit
for YUV420 and restore PSR configuration when returning to RGB.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 ++++++++++++-------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.c     | 16 ++++++++++++----
 4 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 783cafb22374..82ef8e405543 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -411,7 +411,7 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 
 	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
 
-	if (msm_dp_panel->psr_cap.version)
+	if (msm_dp_panel->psr_cap.version && !msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
 
 	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
@@ -1914,7 +1914,7 @@ static void msm_dp_ctrl_psr_exit(struct msm_dp_ctrl_private *ctrl)
 }
 
 void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl,
-			    struct msm_dp_panel *panel)
+			    struct msm_dp_panel *panel, bool enable)
 {
 	struct msm_dp_ctrl_private *ctrl = container_of(msm_dp_ctrl,
 			struct msm_dp_ctrl_private, msm_dp_ctrl);
@@ -1923,15 +1923,20 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl,
 	if (!panel->psr_cap.version)
 		return;
 
-	/* enable PSR1 function */
+	/* Colorimetry VSC packets cannot share the PSR packet generator. */
 	cfg = msm_dp_read_link(ctrl, REG_PSR_CONFIG);
-	cfg |= PSR1_SUPPORTED;
+	if (enable)
+		cfg |= PSR1_SUPPORTED;
+	else
+		cfg &= ~PSR1_SUPPORTED;
 	msm_dp_write_link(ctrl, REG_PSR_CONFIG, cfg);
 
-	msm_dp_ctrl_config_psr_interrupt(ctrl);
-	msm_dp_ctrl_enable_sdp(ctrl);
+	if (enable) {
+		msm_dp_ctrl_config_psr_interrupt(ctrl);
+		msm_dp_ctrl_enable_sdp(ctrl);
+	}
 
-	cfg = DP_PSR_ENABLE;
+	cfg = enable ? DP_PSR_ENABLE : 0;
 	drm_dp_dpcd_write(ctrl->aux, DP_PSR_EN_CFG, &cfg, 1);
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 42c5f847cb02..4dd604ef9f1b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -46,7 +46,7 @@ void msm_dp_ctrl_irq_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl,
 			 struct msm_dp_panel *panel, bool enable);
 void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl,
-			    struct msm_dp_panel *panel);
+			    struct msm_dp_panel *panel, bool enable);
 
 int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 486348113b8a..234cb2373451 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -822,7 +822,8 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
 	msm_dp_display_handle_plugged_change(msm_dp_display, true);
 
 	if (msm_dp_display->psr_supported)
-		msm_dp_ctrl_config_psr(dp->ctrl, dp->panel);
+		msm_dp_ctrl_config_psr(dp->ctrl, dp->panel,
+				       !dp->panel->msm_dp_mode.out_fmt_is_yuv_420);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 9f1aa87a3687..6b01eeeb1aef 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -204,19 +204,27 @@ static int msm_edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
 				   struct drm_connector_state *conn_state)
 {
 	struct msm_dp *dp = to_dp_bridge(drm_bridge)->msm_dp_display;
+	int ret;
 
 	if (WARN_ON(!conn_state))
 		return -ENODEV;
 
-	conn_state->self_refresh_aware = dp->psr_supported;
-
+	conn_state->self_refresh_aware = false;
 	if (!conn_state->crtc || !crtc_state)
 		return 0;
 
-	if (crtc_state->self_refresh_active && !dp->psr_supported)
+	ret = msm_dp_bridge_atomic_check(drm_bridge, bridge_state, crtc_state, conn_state);
+	if (ret)
+		return ret;
+
+	/* Match the PSR configuration applied when enabling this stream. */
+	conn_state->self_refresh_aware = dp->psr_supported &&
+		!drm_mode_is_420_only(&conn_state->connector->display_info,
+				    &crtc_state->adjusted_mode);
+	if (crtc_state->self_refresh_active && !conn_state->self_refresh_aware)
 		return -EINVAL;
 
-	return msm_dp_bridge_atomic_check(drm_bridge, bridge_state, crtc_state, conn_state);
+	return 0;
 }
 
 static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,

-- 
2.56.0

