Received: from mta0.migadu.com (out-5.mta0.migadu.com [91.218.175.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAAD527587
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876205; cv=none; b=YND6LDKhWNDHmS+CLJZU+r/3RUhN+s8qPf3HsnLs5aFY0g9ZCsBOsdeg6lfg44Ju1LQliCfH7X0zGs9aH2UaicAHZIh1S06ZxnSMRLWl/CffXHaNo6kobkKcg3ctTnKZOlizZBWPspxziqo1SbXcuyFQIDB0pC1ht0ITBhMj0eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876205; c=relaxed/simple;
	bh=SoALhT7ctD/Ofq5oEPYAXAkgPEKatIJv6UIilwTDtfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7waVy1kfg04J209cYwY70a5a6EtkeVtLohxoZ81saiwGEZ6TuJ8MP3HyCCWcte272yyFu6SbzCbuqN9VI+4SI5WOR9ImA6ElYm9qDJYfYzGGT9SfJFSTFV6SRMqj+1YejSU/am2+WLas6QOL/TK2IC6Qa9MqmXDMvWzoxVNTLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=kNnE23VM; arc=none smtp.client-ip=91.218.175.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="kNnE23VM"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SoALhT7ctD/Ofq5oEPYAXAkgPEKatIJv6UIilwTDtfw=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790876201; v=1; x=1791481001;
 b=kNnE23VMQUox9UleXFY4PNjn7rrveHEZaklWe3JIC+p0zRHUJ6HokdlBNuZ4jiVY+4MfZlQT
 z524uyUVnXHwC8OhWLIK3y1bCuYTwppQgwB13mU7AOMBWnkcduQgoxSN8ZFnaHdfKLo3m9OrME8
 VpsYKGlMcX88ZrdhtUWHSd2k8xASY42Q0tMgKgBgltJGovtLIuqNUwuZzBz91MAAe7F8qjrc3Za
 mTPQF8rDQmEQnxJ4rvf5HjMuIKo+llhoWVQ5mfS8Cdxmfk/nkP4g/s67Q4JOJfoLN5tX/rxACBG
 X/S81yc61Se6niAHcjjZh3s0yz0XIykiXzsNMDFQZPSRw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0533d356648de116;
	Thu, 01 Oct 2026 17:36:40 +0000
X-Mizu-Trace-ID: 0533d356648de116
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Jacob Chen <jacob-chen@iotwrt.com>
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 3/3] media: rkisp1: Switch to modern PM_OPS
Date: Thu,  1 Oct 2026 19:34:53 +0200
Message-ID: <20261001173610.158931-4-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001173610.158931-1-diederik@cknow-tech.com>
References: <20261001173610.158931-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A new set of modern PM_OPS macros got defined in commit
1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old ones")

Switch to those new macros so that the PM callbacks are always seen by the
compiler, but discarded if not used. This lets us drop the __maybe_unused
annotation from the callback functions.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index f90e01301943..e619a949dbc9 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -305,7 +305,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
  * Power
  */
 
-static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
+static int rkisp1_runtime_suspend(struct device *dev)
 {
 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
 
@@ -331,7 +331,7 @@ static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
 	return pinctrl_pm_select_sleep_state(dev);
 }
 
-static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
+static int rkisp1_runtime_resume(struct device *dev)
 {
 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
 	int ret;
@@ -351,9 +351,8 @@ static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rkisp1_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(rkisp1_runtime_suspend, rkisp1_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	RUNTIME_PM_OPS(rkisp1_runtime_suspend, rkisp1_runtime_resume, NULL)
 };
 
 /* ----------------------------------------------------------------------------
@@ -815,7 +814,7 @@ static struct platform_driver rkisp1_drv = {
 	.driver = {
 		.name = RKISP1_DRIVER_NAME,
 		.of_match_table = of_match_ptr(rkisp1_of_match),
-		.pm = &rkisp1_pm_ops,
+		.pm = pm_ptr(&rkisp1_pm_ops),
 	},
 	.probe = rkisp1_probe,
 	.remove = rkisp1_remove,
-- 
2.55.0

