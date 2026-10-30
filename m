Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359322;
	b=pT0U57c9MmHU/5zL7rnN/cX0QcuvP9QjpfE3Y2wjyAqeNbLEblwCK6PQ3dlt9fECKrQc
	 qTdbsZl1SurQ/f2regXSaNy8wyIYUPhqqg39ygT7Yi1WDw7RNN4L/YUDtqsrYpG162RhS
	 m4HBhYVhUChL55WOVzaF/Z6hu1h3ZGbcJ8KIQ/sfQpZVNVABRZjqPwIhUL7KSrXTGLYXj
	 5u/mKKKZcJKai042mUUs7yFxFz1zxFkO4v2iUvCdSgFODRMUDQ7KORdrEo6ET/jk4e1uK
	 Fo1tsuzH1vrhd+DhkppyiZh8sTlzyk2xsCkN9fDETfeNUFHtJDdBOwjj+bQY/mzzsUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vuufPDmq8YPQW8AY0Jp/JU0SY6cRQYf0nWENHHY4ooc=;
	b=nRB/AUNfZXYikdXkMqKc5UiMij24qLvKmyrkFVUleeljfrbdHMU17/bokVGTAR2yAUjK
	 W6o6qwVRk2J5BGlnomGMmewWkyIlXhCDKV2xeQ5RPpDg0qcsAgoOQ+B7R1EGGViQm8PQD
	 hkjgJIexGUwxZlg2uY7l/krp/RWzimHdI4GHE7EqoVqGZiwi49OXg5cJCp8QSYjvmG8Ox
	 ae3iGw7mmpAQt+RQJN3B6q4OLi66dCcVxux5cNlK/yz6RHFUMIFZ/emoUDF3ZNmlumUSo
	 ElxGtKWcUdzhPEEm+JOHS1SQXGyEgbIPoDLrfj2OGb0GmImr/LR8QCMibh20KsyLYFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PUTZ2qiR;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B68D606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B68D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PUTZ2qiR
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e10a70540so362745f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793359319; x=1793964119; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vuufPDmq8YPQW8AY0Jp/JU0SY6cRQYf0nWENHHY4ooc=;
        b=PUTZ2qiRirgz6nwNmDdZoYxxNaDm5c3nm0CWhcwhJyItDYZ7YbMQ1byIe34GqmI/Z4
         Se0+UayrkOoNnPm1IUJea3avAR0m7/jmt0QCVzLqzXhrWBvMQ3F22QWKRtTo7IZYL3kv
         1ObDOC5/OhUFcQOvWGVEgkUkCUfODWwcMk2xNEtZ48Ksgdu2hQ3kIPqu+6d5TR9Dnvpi
         TH5i/joH6IFFSAlH2qr63iK4+vfjES/nKwWMPdOChONSjihN85IFo9OFbEwdwNgpNNqy
         6H7lz90VK+FogphueqPrhWNuq/TujBd3LCNNFMJjb3RhtWVR6kr+VmBY2MkDHoMcbpbg
         pwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359319; x=1793964119;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vuufPDmq8YPQW8AY0Jp/JU0SY6cRQYf0nWENHHY4ooc=;
        b=FQyzdYsN53HGk6bbUOL28x41DFCA/jwPKQcf1O9k9msM2g4O/xv6fNTh3C05jjX2DI
         xStDAOBiMBxQfvDw7SY9MlFPhhPBNmMA0+PH3iMia4KSqeBC3CU1Infv2Be+jGwjnwFM
         igZdLZWDlFNVoKLJoPB1y6t16xZGWId/B+HLfzJTXa5DCZ5IrAkus1dhl3pWMTkbphKJ
         YfskXrrFk25YZ0Q4OFvZ4CZAxwMmNMKweykFib4KoBcCp/0JgJBwnTxcgjsU+vGbmRhx
         kJRbpm+cpEBhwEZOMao14hPsiTBPb/Z6IwYh2C6WOPyvf0hX3x4C6RxfAxCKFAIcQdwh
         M7vg==
X-Forwarded-Encrypted: i=1; AKwUvBxV1bED6Tfv8gH7nqasqZLwPthii35KhtVzSZS5BesMi4Oo9HpSjarhZvLcBvN0M8Zdgg5awfAuhlVgbys=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4ZHvRMt+ilPIR7Ggr3I+nLBA+0YMdJ4v1tLep/rBK2KYey6Xn
	9S0BLNrDmVSNiVRS9RW1m5KRQb6ATPlpRkptMibZyTRER2nLW3GjY2oiBAth8oUHKx4=
X-Gm-Gg: AYBFou2VvKCbcmhi9XRUVj9HT1hORzbGTTlOImQn+4Hp9MR3gmYDHELvldHf2nkwR5H
	1uE16ZlNYuCRKR981pZwY7hZed2d7ucwowpKlxcKhpeE0LTyvhcEFYmOUOtIqwlXzKZdTr5kEna
	QFg/hBZnvetZSncP+OEJboC8H8A2mmg9KkC1Y/V6bS1dOhhQ/qNjuepbA6HO+fEFYCYc9+M54RD
	YvbfFMSzpxzvjwaoOGIbJy2uwBmHaaA7+DPIpOCSEJqfJIk39XzAy7SQtQh125DWnKhY1lzbMPP
	fT1xLr4LK61s5ekB6aMt+TMItI2kyNMfebo6cDmPzhB+guafXDQttvIRs7i4TLLiPQMEXZ+fq0O
	Ni0Z165U9A0mL4fyaJBy2IiFSr3YX0/yp8sPig63y3iSwP2wM5AMALGZkyoh1dZCsnw+4H1aKTd
	Cs1jYa3FhD0e/SAvIbRdlm/BhoO8ZExyOPqg4wCzzYBWsGVh62mmTjdy/9UAAtLIuBBY0M88OSC
	Yk+UbJtET11NyjjEDwUCP0y3i9KXlQy3YTWAviDRgUO1VgHF/qoQyfvf9nWqZfO3O6yeuOoMnKi
	TBCgCvmSYUa8NAdR0gCU0M3KIpm6qH/4VeuT+Idu9XvRpVWH
X-Received: by 2002:a05:600c:8b06:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4ac17b2c907mr39680395e9.25.1793359319469;
        Fri, 30 Oct 2026 04:21:59 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3f9sm2939706f8f.4.2026.10.30.04.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:21:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 30 Oct 2026 12:20:47 +0100
Subject: [PATCH] drm/etnaviv: hold the core in reset while runtime
 suspended
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-etnaviv-rpm-reset-v1-1-f45761846329@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCQAxG4auUrA10YqvoVaSLdvzVCI4lGQeh9
 O6OuvwW7y3kMIXTsVnIUNT1mSrCpqF4G9MVrOdqklZ2oZUtI6exaGGbH2xwZO6kP0wS+7CPHdV
 uNlz0/Xuehr/9Nd0R83dE6/oBkhDNx3UAAAA=
X-Change-ID: 20261023-etnaviv-rpm-reset-4259b2c517c4
To: Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Simon Lenain <simon.lenain@thalesgroup.com>, 
 LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5557; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=68/E5Cj9ssNc1McLhgmPI5778X5fLNH57nbXqLBBDGo=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPaq/OqfR1uf6k/7KK+7GH+9tTdi5ZPf3CqxV8E+8r5
 lyU2fVHv6OUhUGMi0FWTJGlhrta/J2k1pdZ03Vuw8xhZQIZwsDFKQAT2XOT4X+ytdRJDcbMxxXn
 l6bdydN3uPrGLfZip+vhOfxp83o15s1h+F+TrXpzX+x8ZllvHqfIdO2dC+Ru7EwKWKubtu5gbfc
 NR04A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The reset is asserted at probe and released once, in etnaviv_gpu_init(),
and is never asserted again. Runtime suspend only stops the clocks, and the
power domain may then cut power to the core. On the next runtime resume,
the domain powers the core up again while the reset is still deasserted.

On the Amlogic A311D NPU, the power domain lifts isolation on a core that
is out of reset, which locks up the SoC on the first runtime resume after
a runtime suspend. Toggling the reset again solves the problem.

From an existing comment in the driver, the reset must be deasserted with
the clock running, so handle it together with the clocks. Rename the clock
helpers accordingly, as they now handle the reset as well. This way the
reset is properly handled whether or not CONFIG_PM is enabled.

Fixes: 6bde14ba5f7e ("drm/etnaviv: add optional reset support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
This was found while running the MobileNetV1 demo with Teflon on the
Khadas VIM3 (Amlogic A311D).
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 64 +++++++++++++++--------------------
 1 file changed, 28 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index e75dab5e407d..b372f454f676 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -175,29 +175,6 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value)
 	return 0;
 }
 
-static int etnaviv_gpu_reset_deassert(struct etnaviv_gpu *gpu)
-{
-	int ret;
-
-	/*
-	 * 32 core clock cycles (slowest clock) required before deassertion
-	 * 1 microsecond might match all implementations without computation
-	 */
-	usleep_range(1, 2);
-
-	ret = reset_control_deassert(gpu->rst);
-	if (ret)
-		return ret;
-
-	/*
-	 * 128 core clock cycles (slowest clock) required before any activity on AHB
-	 * 1 microsecond might match all implementations without computation
-	 */
-	usleep_range(1, 2);
-
-	return 0;
-}
-
 static inline bool etnaviv_is_model_rev(struct etnaviv_gpu *gpu, u32 model, u32 revision)
 {
 	return gpu->identity.model == model &&
@@ -842,12 +819,6 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 		goto pm_put;
 	}
 
-	ret = etnaviv_gpu_reset_deassert(gpu);
-	if (ret) {
-		dev_err(gpu->dev, "GPU reset deassert failed\n");
-		goto fail;
-	}
-
 	etnaviv_hw_identify(gpu);
 
 	if (gpu->identity.model == 0) {
@@ -1649,7 +1620,7 @@ static irqreturn_t irq_handler(int irq, void *data)
 	return ret;
 }
 
-static int etnaviv_gpu_clk_enable(struct etnaviv_gpu *gpu)
+static int etnaviv_gpu_clk_rst_enable(struct etnaviv_gpu *gpu)
 {
 	int ret;
 
@@ -1669,8 +1640,26 @@ static int etnaviv_gpu_clk_enable(struct etnaviv_gpu *gpu)
 	if (ret)
 		goto disable_clk_core;
 
+	/*
+	 * 32 core clock cycles (slowest clock) required before deassertion
+	 * 1 microsecond might match all implementations without computation
+	 */
+	usleep_range(1, 2);
+
+	ret = reset_control_deassert(gpu->rst);
+	if (ret)
+		goto disable_clk_shader;
+
+	/*
+	 * 128 core clock cycles (slowest clock) required before any activity on AHB
+	 * 1 microsecond might match all implementations without computation
+	 */
+	usleep_range(1, 2);
+
 	return 0;
 
+disable_clk_shader:
+	clk_disable_unprepare(gpu->clk_shader);
 disable_clk_core:
 	clk_disable_unprepare(gpu->clk_core);
 disable_clk_bus:
@@ -1681,8 +1670,11 @@ static int etnaviv_gpu_clk_enable(struct etnaviv_gpu *gpu)
 	return ret;
 }
 
-static int etnaviv_gpu_clk_disable(struct etnaviv_gpu *gpu)
+static int etnaviv_gpu_clk_rst_disable(struct etnaviv_gpu *gpu)
 {
+	/* The core may lose power: keep it in reset until it is clocked again */
+	reset_control_assert(gpu->rst);
+
 	clk_disable_unprepare(gpu->clk_shader);
 	clk_disable_unprepare(gpu->clk_core);
 	clk_disable_unprepare(gpu->clk_bus);
@@ -1817,7 +1809,7 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 		goto out_workqueue;
 
 	if (!IS_ENABLED(CONFIG_PM)) {
-		ret = etnaviv_gpu_clk_enable(gpu);
+		ret = etnaviv_gpu_clk_rst_enable(gpu);
 		if (ret < 0)
 			goto out_sched;
 	}
@@ -1863,7 +1855,7 @@ static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
 		pm_runtime_put_sync_suspend(gpu->dev);
 	} else {
 		etnaviv_gpu_hw_suspend(gpu);
-		etnaviv_gpu_clk_disable(gpu);
+		etnaviv_gpu_clk_rst_disable(gpu);
 	}
 
 	if (gpu->mmu_context)
@@ -2013,7 +2005,7 @@ static int etnaviv_gpu_rpm_suspend(struct device *dev)
 
 	gpu->state = ETNA_GPU_STATE_IDENTIFIED;
 
-	return etnaviv_gpu_clk_disable(gpu);
+	return etnaviv_gpu_clk_rst_disable(gpu);
 }
 
 static int etnaviv_gpu_rpm_resume(struct device *dev)
@@ -2021,7 +2013,7 @@ static int etnaviv_gpu_rpm_resume(struct device *dev)
 	struct etnaviv_gpu *gpu = dev_get_drvdata(dev);
 	int ret;
 
-	ret = etnaviv_gpu_clk_enable(gpu);
+	ret = etnaviv_gpu_clk_rst_enable(gpu);
 	if (ret)
 		return ret;
 
@@ -2029,7 +2021,7 @@ static int etnaviv_gpu_rpm_resume(struct device *dev)
 	if (gpu->state == ETNA_GPU_STATE_IDENTIFIED) {
 		ret = etnaviv_gpu_hw_resume(gpu);
 		if (ret) {
-			etnaviv_gpu_clk_disable(gpu);
+			etnaviv_gpu_clk_rst_disable(gpu);
 			return ret;
 		}
 	}

---
base-commit: 14c3f1cbcec18927f1b6faab03f0d95c0bd1da74
base-tree: https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
change-id: 20261023-etnaviv-rpm-reset-4259b2c517c4

Best regards,
--  
Jerome

