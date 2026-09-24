Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1DE49B5AD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273441; cv=pass; b=MuOzOjrW5Vw2Z33zkqk1ti9QIo7X0Nt6NZiYfkoE00zP463HKS93/pUbzwanwL7NPtXqJovkaacpwwVTukLc4v5utRvM/L1OgzxtcYyO7OPlk2AWTX5BpJHFJDRA4W9EkYt5VwfahhA7Q24gWeT4LfXmq6xiRbVRSqJpNyYE8jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273441; c=relaxed/simple;
	bh=gjre2d//pLL35O2CFo/5bmFFpp2uslvlgfO9zx+gAgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y+xTJKbPuF785plhM+TO3u+QWr8WaoqjI6a7D7E6Q0BedIw34G7Xih7VzpUJNJSChoD6jzs05wSPkYuF0V/qL//Wcilf/boeT0/IfkdrD5sRB7h6z5QH0pAVRo2mp9AUZDVo13UMBCdBmtnNxy/ppwJ97tPeo+DcwYza9WdbWKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=cClYqDG4; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="cClYqDG4"
ARC-Seal: i=1; a=rsa-sha256; t=1790273407; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=My0CIGUlKBP8OM9fu7ri1hgSWL1uUCvT31nOE2ClZQZW6hoXF1LEOs32BzVuPn5CkA76xhWFq0e8CSKu2xw//KkbpBfdksssziQjf2lSuaE+oW3K0WBft9/ua/zFvpWSfYFIafcp4Usow6zjvYv0biz5Sz8sghDILX6HN62c0bs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790273407; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qigAaY9WXoJkoUdhy+BS7+ht2S8XyDcYsJXfsXz1pnY=; 
	b=dCXIO2cFqUp5wSwl979SsVNINKTcxJ6az8MpXjsSV5XTS4nDZ6GIGdXOSY7HGDx0OF7GZcbXQWCdU3ZHhy5i2ZF8LDY9PPy8kms/QWSE1BRBGzYqCONAi9Smhidv2CD8CYVpBkRrTsUawdkR9q1MguHiYnKwwI2YQJf+xPNuzjc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790273407;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=qigAaY9WXoJkoUdhy+BS7+ht2S8XyDcYsJXfsXz1pnY=;
	b=cClYqDG4Eu93PPYyJO3R9+iiizSQdOIRvPVPOtJp6ePSRn5ASGSJ7fTFS/B2BLnH
	N618DIGgRRWt7ANJnyOVTBUACVH3zC8Vqt6IuipiKG7oMXPcQ/YN3SoKotBZ/Q3EXXe
	fpA1ievGcDqVtlg+biujI2nKXjziyEN1PUi69VUg=
Received: by smtp.zohomail.com with SMTPS id 1790273405278186.28737005661958;
	Thu, 24 Sep 2026 11:10:05 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Thu, 24 Sep 2026 19:09:22 +0100
Subject: [PATCH v10 05/15] drm/panfrost: Consolidate device clock
 management and reset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260924-claude-fixes-v10-5-755929b3cc19@collabora.com>
References: <20260924-claude-fixes-v10-0-755929b3cc19@collabora.com>
In-Reply-To: <20260924-claude-fixes-v10-0-755929b3cc19@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 "Marty E. Plummer" <hanetzer@startmail.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6334;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=gjre2d//pLL35O2CFo/5bmFFpp2uslvlgfO9zx+gAgY=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqtWdYvKVgHn1RyPqngf7f1D4Kq6ZkhlkJw2Z2q
 LSJXTjabZeJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCarVnWAAKCRAOJn5M7lND
 PZeFDACUsM1HJEGavjIVQilFHfoQM4YZBV6JhAQjUV4Auc+0mJj7yOBOs/6FCmzkqHoBXjJjrRx
 euLHCYnLPP34YoCJibnBPjnMUH+qC5S5h1wRFT/6swzz/qcGuP4vZjkRqKOo7X3Favee3k86z8B
 ofCuWt+Z2KA3gT+RnPT6vw0WNDOxRA5KxOUbH+wJJmFpphCGMIBEPBDclyhg5duaNswONe0PuBD
 ZiMK+ks3V7I0ccARKKXz17QRdOC8ztx4sqYj5rk/KWrPwo4SnDhw1ls3HBsmXVoQXfEGGS1GVT3
 wufkcUFrsqsYXbXqQdjp6vGTMyWBsAq4ZkVJfcCZMVKYzRKiGC8pyMLlYueCbo1XNFvpCJlXhK6
 xKGGVnlhrQ7/7xYMBwmbHyucJROyLYwRrc7BioeZKKxNB3JEQeLoa2o5UciGXGqskdB6bBYFeYY
 xAh7TkLX1ilRVpKCXUd5LvIcHeK/K50005Q3yyqEwzrUe+8e5nuv8OqoMP4FMfs3BCnRE=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

Gather all clock enables and disables into a single function to avoid
repetitions between driver init/fini and device resume/suspend, since
these clocks are always handled in bulk.

Also do clk (un)prepares and dis/enables at the same time, since the
clk_prepare_* family of functions can simply increase the refcnt of
an already prepared clock.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 118 +++++++++++++----------------
 1 file changed, 52 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index b3a53504bd01..9f2b1967a398 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -34,10 +34,46 @@ static void panfrost_reset_fini(struct panfrost_device *pfdev)
 	reset_control_assert(pfdev->rstc);
 }
 
-static int panfrost_clk_init(struct panfrost_device *pfdev)
+static int panfrost_clks_enable(struct panfrost_device *pfdev, bool on_resume)
 {
 	int err;
+
+	err = clk_prepare_enable(pfdev->clock);
+	if (err)
+		return err;
+
+	err = clk_prepare_enable(pfdev->bus_clock);
+	if (err)
+		goto disable_clock;
+
+	if (on_resume) {
+		err = clk_prepare_enable(pfdev->bus_ace_clock);
+		if (err)
+			goto disable_bus_clock;
+	}
+
+	return 0;
+
+disable_bus_clock:
+	clk_disable_unprepare(pfdev->bus_clock);
+disable_clock:
+	clk_disable_unprepare(pfdev->clock);
+
+	return err;
+}
+
+static void panfrost_clks_disable(struct panfrost_device *pfdev, bool on_suspend)
+{
+	if (on_suspend)
+		clk_disable_unprepare(pfdev->bus_ace_clock);
+	clk_disable_unprepare(pfdev->bus_clock);
+	clk_disable_unprepare(pfdev->clock);
+}
+
+static int panfrost_clk_init(struct panfrost_device *pfdev)
+{
 	unsigned long rate;
+	int err;
 
 	pfdev->clock = devm_clk_get(pfdev->base.dev, NULL);
 	if (IS_ERR(pfdev->clock)) {
@@ -48,53 +84,31 @@ static int panfrost_clk_init(struct panfrost_device *pfdev)
 	rate = clk_get_rate(pfdev->clock);
 	dev_info(pfdev->base.dev, "clock rate = %lu\n", rate);
 
-	err = clk_prepare_enable(pfdev->clock);
-	if (err)
-		return err;
-
 	pfdev->bus_clock = devm_clk_get_optional(pfdev->base.dev, "bus");
 	if (IS_ERR(pfdev->bus_clock)) {
-		dev_err(pfdev->base.dev, "get bus_clock failed %ld\n",
-			PTR_ERR(pfdev->bus_clock));
 		err = PTR_ERR(pfdev->bus_clock);
-		goto disable_clock;
+		dev_err(pfdev->base.dev, "get bus_clock failed %d\n", err);
+		return err;
 	}
 
 	if (pfdev->bus_clock) {
 		rate = clk_get_rate(pfdev->bus_clock);
 		dev_info(pfdev->base.dev, "bus_clock rate = %lu\n", rate);
-
-		err = clk_prepare_enable(pfdev->bus_clock);
-		if (err)
-			goto disable_clock;
 	}
 
 	pfdev->bus_ace_clock = devm_clk_get_optional(pfdev->base.dev, "bus_ace");
 	if (IS_ERR(pfdev->bus_ace_clock)) {
 		err = PTR_ERR(pfdev->bus_ace_clock);
 		dev_err(pfdev->base.dev, "get bus_ace_clock failed %d\n", err);
-		goto disable_bus_clock;
+		return err;
 	}
 
-	err = clk_prepare_enable(pfdev->bus_ace_clock);
-	if (err)
-		goto disable_bus_clock;
-
-	return 0;
-
-disable_bus_clock:
-	clk_disable_unprepare(pfdev->bus_clock);
-disable_clock:
-	clk_disable_unprepare(pfdev->clock);
-
-	return err;
+	return panfrost_clks_enable(pfdev, true);
 }
 
 static void panfrost_clk_fini(struct panfrost_device *pfdev)
 {
-	clk_disable_unprepare(pfdev->bus_ace_clock);
-	clk_disable_unprepare(pfdev->bus_clock);
-	clk_disable_unprepare(pfdev->clock);
+	panfrost_clks_disable(pfdev, true);
 }
 
 static int panfrost_regulator_init(struct panfrost_device *pfdev)
@@ -436,34 +450,17 @@ static int panfrost_device_runtime_resume(struct device *dev)
 		if (ret)
 			return ret;
 
-		ret = clk_enable(pfdev->clock);
-		if (ret)
-			goto err_clk;
-
-		ret = clk_enable(pfdev->bus_clock);
-		if (ret)
-			goto err_bus_clk;
-
-		ret = clk_enable(pfdev->bus_ace_clock);
-		if (ret)
-			goto err_bus_ace_clk;
+		ret = panfrost_clks_enable(pfdev, true);
+		if (ret) {
+			reset_control_assert(pfdev->rstc);
+			return ret;
+		}
 	}
 
 	panfrost_device_reset(pfdev, true);
 	panfrost_devfreq_resume(pfdev);
 
 	return 0;
-
-err_bus_ace_clk:
-	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
-		clk_disable(pfdev->bus_clock);
-err_bus_clk:
-	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
-		clk_disable(pfdev->clock);
-err_clk:
-	if (pfdev->comp->pm_features & BIT(GPU_PM_RT))
-		reset_control_assert(pfdev->rstc);
-	return ret;
 }
 
 static int panfrost_device_runtime_suspend(struct device *dev)
@@ -480,9 +477,7 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 	panfrost_gpu_power_off(pfdev);
 
 	if (pfdev->comp->pm_features & BIT(GPU_PM_RT)) {
-		clk_disable(pfdev->bus_ace_clock);
-		clk_disable(pfdev->bus_clock);
-		clk_disable(pfdev->clock);
+		panfrost_clks_disable(pfdev, true);
 		reset_control_assert(pfdev->rstc);
 	}
 
@@ -506,13 +501,9 @@ static int panfrost_device_resume(struct device *dev)
 	}
 
 	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
-		ret = clk_enable(pfdev->clock);
+		ret = panfrost_clks_enable(pfdev, false);
 		if (ret)
 			goto err_clk;
-
-		ret = clk_enable(pfdev->bus_clock);
-		if (ret)
-			goto err_bus_clk;
 	}
 
 	ret = pm_runtime_force_resume(dev);
@@ -523,10 +514,7 @@ static int panfrost_device_resume(struct device *dev)
 
 err_resume:
 	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
-		clk_disable(pfdev->bus_clock);
-err_bus_clk:
-	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
-		clk_disable(pfdev->clock);
+		panfrost_clks_disable(pfdev, false);
 err_clk:
 	if (pfdev->comp->pm_features & BIT(GPU_PM_VREG_OFF))
 		dev_pm_opp_set_opp(dev, NULL);
@@ -542,10 +530,8 @@ static int panfrost_device_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
-		clk_disable(pfdev->bus_clock);
-		clk_disable(pfdev->clock);
-	}
+	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
+		panfrost_clks_disable(pfdev, false);
 
 	if (pfdev->comp->pm_features & BIT(GPU_PM_VREG_OFF))
 		dev_pm_opp_set_opp(dev, NULL);

-- 
2.55.0

