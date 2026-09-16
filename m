Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC203348C54
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563397; cv=none; b=pUZESRWjFI8xqizuWSlUq7wFIhL9tdTbp4/ecPQtsJPl3seWTWyzaD0gNJ52cWcxGnSesS0bb72RmljL2iAA3vm2jIwWpk99kaIP7MPeT8ATHn/EECKyXkiFiCqy9b6KRTWeMFpolOigI9QZBpDTX+2oH1tKQD2nAA4ZdYUKUcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563397; c=relaxed/simple;
	bh=8i8Qr9F+LzOgZ9ctuIJBF35YtOXaQS3m8/GHuRgFMB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxNGzgoE3LNxxuFH4NK5DTZncZHvIfeiPbykJOcoHYrseNbnUKkLE3Ljbwa+PikZdUsSwJtDsiXuOq1CY5b1x1+FeSPl1vPkg5pIQXTq1dDGDiJuckecmU/FZ39Uh/ddKTS9GBgz662zo42o+lFQNhZu6G+RmD5RRqD35+HvJyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nbp/aGFT; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nbp/aGFT"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so604364f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789563390; x=1790168190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Or2QBqTu0XO5TqiywS1dagQ1+7oN0y+saD1nDD1L5c=;
        b=Nbp/aGFThc0TqUAMe9pcBGO/bubx37S/UvFKBXy2xy3P3Jqz5jVwN6pi4zruuZi+5I
         BXrbZyG/rAmburTNcIj/qxlqmVyduCHRANhQt/C9bsqZC0LkazeoJnkLct2SixIlK0fa
         g49RGTIeKE7+ffI2wwg9W9c8CktJMMdVbOdE5KgqmdZ8Cjt4Dhn2XG2mtzOyywaDYefI
         Yq1zeyzFLsmNFvLoq+sLLkxBUvft+OhFEnKxH52N23DgYacKkUKSa7k1nAIkq9KDOhm4
         xVtbjIWsqaSP1VH0qZNEeou5BTx9cRPQ+YyTQqNCqajNlbrozrZdh8pkUP6w5UqT6Wbl
         MSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789563390; x=1790168190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Or2QBqTu0XO5TqiywS1dagQ1+7oN0y+saD1nDD1L5c=;
        b=0JxP4a58nstgIPW+/qKTIPhVhFF4RJOtmz2eSykUwxPcSc7LSxoOkQyi+Kdkbtviw8
         JWGlaFgAMV4iDx3KHptSaXUrPyoi3EyLYUowMAud0ciQA/rdWSs2P1y5urIp6Lk86A5E
         o41tVaWrIhoO90nClogBedred7o4RVqYuyyI9/+h0GEyozQwRwa4cmJ8mQEP3LPSYHZf
         K9KQO672a7yiGolFHOvwMo0tP+RmZB8ADczKtIoCNEH129zMEAu91mRBgHsAP5yMNQLc
         hg2wUmJr59siR4rz8VVwbvbpjHz/In9viHO5qez+XuRQaq8BMT0NXh6kHkRa5N4+yql2
         cgBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBF3mgvDYH97Fc1p8Y8795XT7LYSJhfJnhng1AjqGhPNrOaqeyCYE9bbEgGHYglVV38SWXoZdfpEs+BgA=@vger.kernel.org
X-Gm-Message-State: AFuF++nu7rqL1Nj2+TRO189PukGcdFL622lzgx+0GP6ybP3kkPfcyTFp
	Q1vVTq6XdGSntTy5MYBevbuTSQOiuYvvsFtXuKltxVmtsxFtEbXRv4o4
X-Gm-Gg: AYBFou25YRSk4V2yDHPwbxDg7PvGnCHgnFclvf+ouBxUAlRQZIejGXv61wo/L2u10bW
	og6/Cyv7vPCRCgNL1JvqhUY60HZ6uPm9my2OnlYBVwQcp3pKvQDhCRCCU1ZnXMV7281kAr8rNV9
	MMmdDv92U8vQY5CuIo9DZJD0F1us0cNHbEMYNwzzdAhJAooHg1zzdlqGSax9M5vkA1e2myjkwtb
	69YQOvektIGp6qGoPcuKX3NWURAjBchAI+mvTEzlH9Vysu7zN+ErNjhY554POIjmN2NdL+O14fI
	4rr6Sxeois2LRpr/d4GI+B8D7B5SuI+xZG5aLp1ghgeZ9bFCUSJzZvG+L3x8DBxZefrT0Afe2D3
	dROqalPNBdNZ8u6aeM5IYu4J6P+LK+mdX59iL2KqaqCTuTxK8HriHFHw3ISSooON5LFIo0q1Wg5
	V9h3lWXRtdU4WkvBVHHlQmtPqL6NysYbq+tYAWrolRXXWpnRlwGMXrwq+WqAb1EqYUVcebIodnB
	G8qHphQQIY=
X-Received: by 2002:a05:6000:460c:b0:487:8ef:5303 with SMTP id ffacd0b85a97d-4870cf44007mr3126887f8f.34.1789563389559;
        Wed, 16 Sep 2026 05:56:29 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm6750729f8f.24.2026.09.16.05.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:56:29 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/2] phy: qcom: qmp-combo: hold a runtime PM reference in the typec callbacks
Date: Wed, 16 Sep 2026 14:56:18 +0200
Message-ID: <20260916125619.4587-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916125619.4587-1-okerixx@gmail.com>
References: <20260916125619.4587-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qmp_combo_typec_switch_set() and qmp_combo_typec_mux_set() tear the common
block down and bring it straight back up, calling qmp_combo_com_exit() and
qmp_combo_com_init() with force=true.  Both release and re-acquire the PHY
clocks.

Unlike the PHY operations, which the PHY core always invokes with a
runtime PM reference held - phy_pm_runtime_get_sync() in phy_init(),
phy_exit() and phy_power_on() - these two are typec_switch and typec_mux
callbacks and hold no such reference.  Releasing the clocks is then enough
to drop the device's last reference, so clk_core_unprepare() runs
pm_runtime_idle() and re-enters the driver through
qmp_combo_runtime_suspend(), which disables the very clocks that are being
torn down:

  gcc_usb3_prim_phy_pipe_clk already disabled
  WARNING: drivers/clk/clk.c:1259 at clk_core_disable+0x298/0x300
  Workqueue: events_freezable pmic_glink_altmode_worker
   clk_disable
   qmp_combo_runtime_suspend
   pm_generic_runtime_suspend
   genpd_runtime_suspend
   rpm_suspend
   rpm_idle
   __pm_runtime_idle
   clk_core_unprepare
   clk_core_unprepare
   clk_core_unprepare

qmp_combo_runtime_suspend() only checks init_count, which is still
non-zero at that point, so it proceeds and the clock enable and prepare
counts underflow.

Runtime PM is forbidden at probe, so this only becomes reachable once
userspace opts in through power/control - which is exactly what the
comment above pm_runtime_forbid() invites it to do.

Hold a runtime PM reference across the teardown and bringup so releasing
the clocks cannot re-enter the driver's own suspend callback.

Fixes: 2851117f8f42 ("phy: qcom-qmp-combo: Introduce orientation switching")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index fa1a91e67549..f6d3320a59d9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -16,6 +16,7 @@
 #include <linux/of_graph.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -5179,6 +5180,8 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
 	qmp->orientation = orientation;
 
 	if (qmp->init_count) {
+		guard(pm_runtime_active)(qmp->dev);
+
 		if (qmp->usb_init_count || qmp->usb4_init_count)
 			qmp_combo_usb_power_off(qmp->usb_phy);
 		qmp_combo_com_exit(qmp, true);
@@ -5265,6 +5268,8 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 	if (!qmp->init_count)
 		return 0;
 
+	guard(pm_runtime_active)(qmp->dev);
+
 	return qmp_combo_reconfigure_phy(qmp, new_mode);
 }
 
-- 
2.55.0

