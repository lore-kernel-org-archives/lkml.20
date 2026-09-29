Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871D3524AF4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687194; cv=none; b=F8d3vi+ldnvLcmMIkr7Mu62rXxF6GGsG2lPJgQavDtUQR3fRCtphNdffIKfY5g6JqnJ40OvIhhUwmxHHQ359+kWJFlX5tzGa3n16szU0Txxd2e44tX4WdP44YnX7i9w46c3gJIBqk+Hj7M76iwABHgZrxt9V5lQ0R9M++2QIvnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687194; c=relaxed/simple;
	bh=E+SoyM3wZnYL7zAxxRPMWuhQ88ZtIEqQmaydJIWdN9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KwNb8/vCpqdpxf8r24rR4EC5ytosoGlXBF1W+EOzr9apaxx2uP0M1MmB39r6yvwgemzyEfSRmgwFAUgQdTaEcPu08ZHcQ5QUVS4pgQeZ0O+AWHMqxaGW/8IxB/4DsWoNc1f1BmV9e+pS1q2muvElqzIYQyDObcE06cM4ETAcQMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qKmQ4hlo; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qKmQ4hlo"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc79c0d2bbbso1491991a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687191; x=1791291991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5LyVPNhnJ5Rp7yPTDFXlLblOQWcWIIfQuz7DLHUCd8=;
        b=qKmQ4hloNMUzClUEeqfv/19VWZaIcU22TAYfSOhnHm4rrYVejrSOxQgpp1pTJF2umC
         hJmaOaCxucZz+zJnMaSVfDW4MF9Gh2ave8Uty6OPliiH1gbE4IbSx8LOzJYSDcr1ZyAl
         8lJ35CeSuUvCjKyulyHtuuHLvLep1BcR9gbhkA3Pxe02u9J7QlCQjrDYNdD2tvonZsl7
         tox4QLZJ1pM4ldwgw2X00QY/LYDnXwTQUuySQNRXnxYcgTntuSb1Xbx247kukrtFeOQe
         CO5wK9b0JYEn5jdH+lFu9cQtt0eu5OrxGegQE0+je7rPydh/aEm1/PF5axC0ktENaESI
         9qzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687191; x=1791291991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5LyVPNhnJ5Rp7yPTDFXlLblOQWcWIIfQuz7DLHUCd8=;
        b=oFO9vz3Yi3XYTrQtMVP0P5RzJgIVQCeXUF2+XKZ4DdIE2pC+jlGdwQL0ykP8hAzqpf
         46lvpe63MAZxRPLA39Eonii7VoEnGtTtpAMQXErSNLdR1MaCQfgxxFbt8P+MrjQhO7Zw
         LRQhpDuibRnzo/j8fQUh0Yq26CBNyNmmp2dw9X3a+iERsRZ9EyLUr1DxE90mm7EDbAoj
         eWz2O0e04PRCeVD96uL7Zbn+XOvYufun0hMFLO6pU8Y9xyVRafHIMTVZjr4pskdFxskd
         kcSrUjKN+asYwU0qjMl7ney+WS7P+AEWLBjdAeDI4eT+39NCNi/1hIozJ/J5qslBbOUF
         yGMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxj6igM2uEbvLor++EhcGmHpejdSkJQ9TNyD1CavhBBtvEQUMFFXFvWZhOqfgXzJzs7p3J1ytkQks60s3g=@vger.kernel.org
X-Gm-Message-State: AFuF++khL5YpeVAPLfDKFAZ5aqnvuKvsWdZB2GFrKz+c1hXiw9dUO5Vj
	wF/Q+DR9QskdeclRYhsXty1i5lGJtwtGQBJk5q4gImBca1K1v9qiy3no
X-Gm-Gg: AYBFou2Q2GgbkKPR6GbSWveEQnqCxD3m6FIgOEsUKzMPen02oq+BWqpq9TAQG1mHUF7
	D+d8PHk14aptoj8vE3tybAIO2s2uLNVke1+6d6q9lIgcve6ES24PmdKGITHfvxDvfxxe9nedraA
	9EvgwmT0ci1g0REXpSttgUfAXT2Mk+N5XDewYmfyyygwQ45LZYwZ2E3JMXnhGEfp+zka6jvMAhC
	YwpVQ85cfZc7kNZOoBpTkTmFcwUadYKik4BXdgr/N7tYeYan+QgqaDz/uEz608DKO0k71CitRkl
	Lz3utBrgL+TIqVf9IXL31pg37pnPOzAF2d7aaCkZVteHj2tUr74b/hQSLEA8I4WuhnHZdcGtJT1
	j7AU3/0XmSHziwzGxUh2n5npVeG2CsDiKPS5NMy2mmfENplwhn9KTYumzEMpxNp9cEbPDL0e08o
	q6+8CqDzO6yztGsnf5HSBd8qcGOAMLJ8tMtEQNeQ7N1LPSWA3v1rY/2u/fbEbHtdUBwtebFKeHc
	TDUnONsKdV3IQ==
X-Received: by 2002:a05:6300:44:b0:3dd:85a9:55ac with SMTP id adf61e73a8af0-3de26db6d92mr12641170637.37.1790687191466;
        Tue, 29 Sep 2026 06:06:31 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e115e41asm841108b3a.10.2026.09.29.06.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:06:30 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	yongxing.mou@oss.qualcomm.com,
	Joonhoe Kim <26rote@gmail.com>
Subject: [PATCH] drm/msm/dp: hold one runtime PM reference per plugged state
Date: Tue, 29 Sep 2026 22:06:27 +0900
Message-ID: <20260929130627.959-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The plug handler takes a runtime PM reference every time it runs and
sets dp->plugged; the unplug handler drops a single reference when
dp->plugged is set. msm_dp_bridge_detect() also takes a reference and
marks the sink plugged, and keeps that reference as well -- on every
detect while the sink stays connected. On top of that, in the current
tree the plug handler runs more than once per plug:
drm_bridge_connector_detect() calls .detect() and then .hpd_notify(),
and pmic_glink altmode reports an IRQ_HPD as "connected" too. Every
extra reference is leaked on unplug.

On a Lenovo TB323FU (SM8850, DP over the USB-C port via pmic_glink
altmode) the DP controller's usage count reached 28-34 after a few
plugs (rpm_usage tracepoint), so the controller never runtime-suspended
after the display was unplugged. It in turn kept the MDSS core GDSC on
while all displays were off.

Make the plugged state own exactly one reference: the plug handler
only takes it when the sink was not plugged yet, and detect() returns
its own reference when the plugged state already holds one, or drops
both when it finds the sink gone.

With this the count stays at 1-3 while a display is connected, the
controller suspends 3-4 s after unplug, MDSS suspends and its GDSC
powers off on DPMS off, and replugging (quickly or after 20 s) still
brings the picture back. Only tested on this device.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Related pending work: "drm: handle IRQ_HPD events correctly" v5
(https://lore.kernel.org/all/20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com/)
removes the IRQ_HPD-as-plug path, and MST v7 26/35
(https://lore.kernel.org/all/20260929-msm-dp-mst-v7-26-4b81473185e7@oss.qualcomm.com/)
the detect-based hpd_notify for DP; the reference that
msm_dp_bridge_detect() keeps is leaked either way. MST v7 27/35 touches
the same lines as the first hunk; happy to rebase on top of it.

 drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6abe30bdff12..4e47b659c71d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -412,10 +412,17 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret) {
-		DRM_ERROR("failed to pm_runtime_resume\n");
-		return ret;
+	/*
+	 * The plugged state holds one runtime PM reference, dropped by the
+	 * unplug handler. The Type-C side repeats "connected" notifications,
+	 * and detect() may have seen the sink first: take it only once.
+	 */
+	if (!dp->plugged) {
+		ret = pm_runtime_resume_and_get(&pdev->dev);
+		if (ret) {
+			DRM_ERROR("failed to pm_runtime_resume\n");
+			return ret;
+		}
 	}
 
 	msm_dp_aux_enable_xfers(dp->aux, true);
@@ -897,6 +904,7 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	struct drm_dp_desc desc;
 	bool phy_deinit;
+	bool was_plugged;
 	int ret;
 
 	dp = to_dp_bridge(bridge)->msm_dp_display;
@@ -910,6 +918,7 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 		return status;
 	}
 
+	was_plugged = priv->plugged;
 	phy_deinit = msm_dp_display_host_phy_init(priv);
 
 	msm_dp_aux_enable_xfers(priv->aux, true);
@@ -960,6 +969,12 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 		}
 
 		pm_runtime_put_sync(&dp->pdev->dev);
+		/* the sink is gone: drop the plugged state's reference too */
+		if (was_plugged)
+			pm_runtime_put_sync(&dp->pdev->dev);
+	} else if (was_plugged) {
+		/* the plugged state already holds its reference */
+		pm_runtime_put_sync(&dp->pdev->dev);
 	}
 
 	return status;

base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
-- 
2.43.0

