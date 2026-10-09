Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F174F37F8BD;
	Fri,  9 Oct 2026 03:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515910; cv=none; b=GIR/NKa9A2q+kMxSAH5R3y87Ex6drm1csEfHN/sa/4hxkEAY/cl/KFTpmy7mbrRI3kJq/uvLYdXJrnhcmZ539N0JaF63JE6nRq2y64C5Q0L52iHXed2CTWmfCM4/39WsG8dL2PnMMTXjFbtyok8zsZXzIlnKOaM4ffh7kzNn/58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515910; c=relaxed/simple;
	bh=y0Qxe6uEfYyWn21dpm7+XJNy2fWN1WyeLFfBAJmoLMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RuDEu2KQCb8QT4m7OeD/khg2Xisv/VRlHhop9yRVdmA9yYrwnLBhiaDL1aLa2NzXB87mFYBuP5Bq0JWKOXqQhUl/CFYlFQPGIYXyUs+6JLaPCetMR+9IypfveHiUbC17l9qIO4KV3teH3keNgwPVXus+jDG5WFD5BjHMzapdUMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1791515850tc30037a9
X-QQ-Originating-IP: aSGd6OVV+xf3PiTsG/D4LwATaC3JbU9u/HkEDXPIHtY=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9398557567907882420
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:15:59 +0800
Subject: [PATCH v2 07/20] drm/msm/dp: Serialize stream operations with HPD
 processing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-msm-dp-hdr10-v2-7-1835d4966da3@radxa.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4913; i=sophon@radxa.com;
 h=from:subject:message-id; bh=y0Qxe6uEfYyWn21dpm7+XJNy2fWN1WyeLFfBAJmoLMI=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlZWMF5+vqL/zuyM03XtTtOrtp9YIOhhuzd4q+Wze
 F7m958MOkpZGMS4GGTFFFkU4hnmslfmXnsqVqoHM4eVCWQIAxenAEyko4Phr2jC5hMBzt56KSKe
 oauZThxVyWG8V7PdwDjcN1HrLoPzL4b/ETN5Cov0tgu5iW4+e9lup72H4dQpFq69qawBds++/Nj
 NAQA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NPENpt+PdOzTLQiSlp3my5zEMMJUQeOG7TexEguhCUdLCVr3kXmXK5Ot
	aqF756edWFQ92+RIXISUf/2GfI/D/gjQidBQTbygD4mgAUhlK0H2Qv0UyBQAdxndCbmTpBC
	SF3n529zMM/omdF3oz0m/g/TtUBYz4eggXhorVXq93CcRDlBJxwZOSA8U8j3GZXM/FDfyby
	0H0xKMLkHyqsHfa1dcufATApJsBfUAkSRYRhsZ52ZVwKXjFqHEb8eNF4t3bx3pfxbLsG7+U
	dF9t3seJEP/sUxgN/KtJGxmSMyLizaGb4itkQj07LIIzuUnqxd+asY/7dfOj/6H3NdyrQXV
	zeJpWEU4Pja1ENwjaca/BQB+5zjf4xv6+9DnHW4gxXV1gtcSUertr938d9xAlpy+sfomumT
	QZVRWbjPc39Xb7YqmxTUOX6G3K/NTw56gACPq2tAglf0LDZG3bsfJ102pOvbiL6tgIR+Cq2
	qKl8OTpBUbYjbF53TVTyu+fxShcqeUcQoZ/WQUmG2iS3YPvWAKpabsgPldE5us0e+I0nvIF
	F64hp5yIJ7mB+IO85qafPrqGhLcEwgKlUJ8xDPlxNS2Q2+Dex56aNeqhfmOPNzIB+ODiOsd
	frBUJeYeQ0j9WHHHufB3gMZuTCfxTUkgqc0yjWSHtOQYGlfycv9ft+QxGEbvFjsNuhpD7uV
	iqtpW66wN7eqJhy0i7AfCjc3kbUD9cM87Bve1vTGAhE+eeWdcNmOj4EgoBYqFcUSFLXz5cz
	riNOZm9BNP3VHZwzb0ZI9IC5e7ohUzOJMLFeMOmvQE5Hc0rzZxIv3786YjMbTU37O7ILZL6
	U1Khi7Kgo5WqucjShhZXxOsOFNOhA1LldVb81Xu0/hd+A9SqmABZP3KkASvmPzNN8H1Uru4
	6X0sO8Dl2Ax9Ocm5LvXCoDDsrtBWrQIGtqsxqqR9ZuTVC/SkA3oruA0Ekj87O49Mt8S1Nfa
	OkHwgJmV9CjU1vG0qlKQA4UajVzyO/sZp7zxoHqp4DHRKrYt0dWWlrN3k+J92Gy7BHmwilC
	EWkgptoElgqVbMjEqxFlfWN8xgScfPfhfO2bSzkKrLjReXJlwuJaUCDv0E+D8=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

HPD PHY test requests stop and restart the mainlink under plugged_lock,
but atomic stream enable and disable do not take that lock. Both paths
can check a resource flag before either updates it and acquire duplicate
clock or PHY references. They can also reset a link while the other path
is training it or enabling video.

Hold plugged_lock across link preparation, stream enable and post-enable,
and protect stream disable and PSR transitions with the same lock. Add
lock assertions to the internal stream helpers. Acquire the runtime PM
reference and handle the eDP plug event before entering the critical
section, and leave audio shutdown waits and runtime PM release outside.

This provides the serialization required by PHY ownership tracking and
the subsequent stream enable rollback paths.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 32a2ac89d8ed..787efbcb6c12 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -53,6 +53,7 @@ struct msm_dp_display_private {
 	bool phy_initialized;
 	bool audio_supported;
 
+	/* Serializes HPD, stream and PSR operations while runtime active. */
 	struct mutex plugged_lock;
 	bool plugged;
 
@@ -623,13 +624,10 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 	return 0;
 }
 
-static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
+static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
-	int rc = 0;
-	bool force_link_train = false;
-
-	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
+	int rc;
 
 	if (msm_dp_display->is_edp)
 		msm_dp_hpd_plug_handle(dp);
@@ -640,6 +638,19 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 		return rc;
 	}
 
+	return 0;
+}
+
+static int msm_dp_display_prepare_link_locked(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	int rc = 0;
+	bool force_link_train = false;
+
+	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
+
+	lockdep_assert_held(&dp->plugged_lock);
+
 	if (dp->link->sink_count == 0)
 		return -ENOTCONN;
 
@@ -664,6 +675,8 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 	int rc = 0;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
+	lockdep_assert_held(&dp->plugged_lock);
+
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
 	if (msm_dp_display->power_on) {
 		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
@@ -684,6 +697,8 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	lockdep_assert_held(&dp->plugged_lock);
+
 	rate = dp->link->link_params.rate;
 
 	if (dp->audio_supported) {
@@ -721,6 +736,8 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
+	lockdep_assert_held(&dp->plugged_lock);
+
 	if (!msm_dp_display->power_on)
 		return 0;
 
@@ -880,6 +897,8 @@ void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
 	}
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+	guard(mutex)(&dp->plugged_lock);
+
 	msm_dp_ctrl_set_psr(dp->ctrl, dp->panel, enter);
 }
 
@@ -1449,7 +1468,13 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	rc = msm_dp_display_prepare_link(dp);
+	rc = msm_dp_display_prepare(dp);
+	if (rc)
+		return;
+
+	guard(mutex)(&dp->plugged_lock);
+
+	rc = msm_dp_display_prepare_link_locked(dp);
 	if (rc) {
 		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
 		return;
@@ -1474,6 +1499,8 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	guard(mutex)(&msm_dp_display->plugged_lock);
+
 	/*
 	 * If .atomic_enable() bailed out - link training failure is the common
 	 * case - the mainlink was never brought up and ->power_on stayed false.
@@ -1511,7 +1538,8 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 
 	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
+	scoped_guard(mutex, &msm_dp_display->plugged_lock)
+		msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
 
 	msm_dp_display_unprepare(msm_dp_display);
 }

-- 
2.56.0

