Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D1A384CF5;
	Fri,  9 Oct 2026 03:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515933; cv=none; b=pWj/siBBw4qLw/YOqpeN0971qmk7NixWzLUXKfu0/d53T/uYwJ9R9xj0doQjKRBj3lKE/woH8wA8DyxMrUo6nMIh2HQ+6e5RmqQ2gj4NT2DU1bYAUTH1dj1N+JLUD4HFwpnP4+Qmq9err2R97LErSbG7Kty1iGpMSZtadLL6W1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515933; c=relaxed/simple;
	bh=4U9Nmsy1uYb82VMp2QQ+dOjRfnyMbjdVCFQc3Q/Ljg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQa/eoKmqBfJOKd4JEe2Y4JFXrl4aGq1pYqOMOjRk/nsqV8g7uYywv91l+MvKD7S7ouvBaWArZ0q2qKcTe/Whs+RRmKIJQO6APaeMEL86meaN3LsLqpbUGvSdkKx8tkM+N9mzellcrPEFc0GTVB2p7YZ5v/crDPxPX0KmKWSSOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1791515846teda7ddcf
X-QQ-Originating-IP: ll4UOsQI2GjH/rTZmdJovT7JYtS+9/6bQa8Au5skvjI=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7874777080659291572
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:15:58 +0800
Subject: [PATCH v2 06/20] drm/msm/dp: Keep runtime PM calls outside the
 connection lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-msm-dp-hdr10-v2-6-1835d4966da3@radxa.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3743; i=sophon@radxa.com;
 h=from:subject:message-id; bh=4U9Nmsy1uYb82VMp2QQ+dOjRfnyMbjdVCFQc3Q/Ljg8=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlboR7QsYLp/rCH9tMCZ358nr7acvqXxG5Nf0/+dq
 Tk3qvbnd5SyMIhxMciKKbIoxDPMZa/MvfZUrFQPZg4rE8gQBi5OAZjIDSGG/z4L2o+xeM+OuDOl
 wLV9dfJFJwe+33P3TCmf8HWhrZrMRCWGf9ZSonba3/dd7HRafVlE+rezWv/7DSo2n+TlWrdmz5K
 24AAA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OezpMYl8oadHqaIgANuMSk6DDUAhfMinjSe62GslEBE0YbPpursx9J1R
	/MKRoaWYeHyGaD04Yyan4WvtVAAxXQ0VJ2fS6l1cyLjYtCs4zqDsFItZHGPSZROIdtMINOa
	D3i88dc8ApcEK4LhGultasJ3MhSiganBDV4g1Y7dBjSJnT7I8dTuYuykdM9k4f8OBdyQHa1
	E5caRwdoaq9qdMcSgHAi707jcyTxPFn6LZ2eSxS/JWVwz8wao67rigeJM0iUAtOZkOiGguv
	eb9iVvW312SdzhRqMZGsCGCkVCI3k7ny6I1zlb90DJqXqePUbvCijH4Ne2O1+cn+wxFWQVF
	ouHZem5Jgn+2z3mvIBBbTjnh10VKXrLmZsByogMlgy6G/t3skTwg+NzNykqagajhPoRwGap
	uP3jOlXbudbbyV7n8x29ys6sz7UOx8V/8jnqfFdcXLkd8ojsDP8+kQDD8qg4BzViG96997p
	sjVO08E2BIn4CTLpSKT3SUs0fY0TpkUPFV83Nw8KY5evmVkmx1219WUlsgzd34sICMwxYUr
	POcPUiFp87hA+YUYaeVRnoyJ7NKw/CB1/31T3Z5s5S5iDgeK24kjJHlTtWYwYK888+nhusu
	mH7N4xIijZ0WM20heRCqETLzS0bkGioJxmnTW0jeAQp5Rl+eHwViCQ5QZi7BkdNc1iqqvC9
	z4j7vvMJUaTUu/0lUsIkvRXmWtqFHBWPnCpS9yisMXEyRvQCA8nXbLkZIVL+SqNiwziW/kg
	ku7WRL6Lkz03g8X24RsJ+E8lZLre+CUSAKbSJYa3N4QqszsmDFIsOEjNOUJLagggMBV3hkf
	K3sDByV7TF/5e6bbrxxJjPkaXehUXU68M0FK/f2RIurABOMTfFU1flOXBhHcqnRIJqc1WGt
	XPO/Fme4a/DjpGx3xcKPXmHm/ZNsPVARkla8NC+VLmfXwe241XLSPPb74burfXBTxHoQd6J
	Beg8kj6YAMk4HpJ01jMPyWHLZIeFv6c638yexkVIUcTFU6h/4eo6Il5/yJtx5E2k03dbQVV
	06TgAuQ8N/3FIGwZJnzWTadIqjGxkwIMRYogCkaLWSYaeBKy2ovuOq7ct3CYbJ9oYnmXyy/
	A==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Runtime suspend disables the display IRQ synchronously. Calling it while
holding plugged_lock can wait for an HPD IRQ thread that needs the same
lock. Acquiring a runtime PM reference under that lock can also wait for
an in-progress suspend with the same dependency.

Acquire runtime PM references before taking plugged_lock in plug and
detect handling, and release them after unlocking in unplug and detect
handling. Keep connection state and PHY operations protected while the
runtime PM reference holds the controller active.

This prepares for serializing stream operations with HPD processing
without extending the connection lock over synchronous runtime PM calls.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3ca039ff57b8..32a2ac89d8ed 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -409,14 +409,14 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	guard(mutex)(&dp->plugged_lock);
-
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
 		return ret;
 	}
 
+	mutex_lock(&dp->plugged_lock);
+
 	msm_dp_aux_enable_xfers(dp->aux, true);
 
 	msm_dp_display_host_phy_init(dp);
@@ -428,6 +428,7 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 			dp->link->sink_count);
 
 	dp->plugged = true;
+	mutex_unlock(&dp->plugged_lock);
 
 	return ret;
 };
@@ -450,7 +451,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 {
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
-	guard(mutex)(&dp->plugged_lock);
+	mutex_lock(&dp->plugged_lock);
 
 	dp->panel->video_test = false;
 
@@ -460,8 +461,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	if (!dp->plugged)
+	if (!dp->plugged) {
+		mutex_unlock(&dp->plugged_lock);
 		return 0;
+	}
 
 	/* Don't forget modes for eDP */
 	if (!dp->msm_dp_display.is_edp)
@@ -488,10 +491,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	if (dp->plugged) {
-		pm_runtime_put_sync(&pdev->dev);
-		dp->plugged = false;
-	}
+	dp->plugged = false;
+	mutex_unlock(&dp->plugged_lock);
+
+	pm_runtime_put_sync(&pdev->dev);
 
 	return 0;
 }
@@ -899,19 +902,22 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	struct drm_dp_desc desc;
 	bool phy_deinit;
+	bool put;
 	int ret;
 
 	dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	guard(mutex)(&priv->plugged_lock);
 	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
 		return status;
 	}
 
+	mutex_lock(&priv->plugged_lock);
+	put = false;
+
 	phy_deinit = msm_dp_display_host_phy_init(priv);
 
 	msm_dp_aux_enable_xfers(priv->aux, true);
@@ -961,8 +967,12 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 			msm_dp_display_host_phy_exit(priv);
 		}
 
-		pm_runtime_put_sync(&dp->pdev->dev);
+		put = true;
 	}
+	mutex_unlock(&priv->plugged_lock);
+
+	if (put)
+		pm_runtime_put_sync(&dp->pdev->dev);
 
 	return status;
 }

-- 
2.56.0

