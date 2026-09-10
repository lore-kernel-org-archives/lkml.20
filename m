Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C57E4BB266
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051875; cv=none; b=N9l8y7lA0M5Vy+BKJLWk8NggQENJ1IguN09kWgsNvR2b1r1Zw8ZGtSlurnx/3tvj3pXYuHf6VQppjsfHeHJmwUt2SkLzXuen7DVUGwTzr2HWVY00Uv3QPRPPrX0udRJLzx+AMj6X/xl3p6PNv7g9h9Vr2EAxdK71k6Y+sLVbw9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051875; c=relaxed/simple;
	bh=Wsosi7+zRF+Zd/bIRFV/BRB65RlCubyCxSqesFNv+8A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aC9NFhfsaBo8kySav9eqjnV+2101ujZ0xlYW46Jp83SHZrQ4xT6toWOSK/L7jgSyGw5dswk9NQt1G/JKuNU7PGB11I+Uq596qXbjRCVrvkgtV2sQpQNW+9VYUgrYkQmII/EA+f8Cq/Fan4Ij9ZGza34hjPC9XRDcE7jresnMhqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericchancf.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BJ6dyejc; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericchancf.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BJ6dyejc"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db0a41434bso131260115ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789051872; x=1789656672; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VFhy93n6Rb/y4cA3aaIcOvTxc0gTIiwSK8DV0XBamcA=;
        b=BJ6dyejcZBllc1AT56GZeuTZA6pC11EeudKWQ1ARTvrUuHV6AjAuh1EYjk8/1mb7+L
         3yQbPGxekyQrXmQn26/GpVgLglDemryOIn/IECN2h42s+BV9G+e3VXNz2OFCRBztTdrX
         0OqFvX85CN6g3QCzc82OGcm7aYAUGdT3MRjKghPTFamo7JG1E86t4LcnBXc7wVB055Ap
         bx34wbnIhr1iH2rGQGuPjB4/5eDcAgTfQzfp2e07dfTNDDhVFCPeWsMP4mJjiCsEXrjl
         c2tx+MFKHvPQhdJk25wzFweyxG5GjIhu7If/8tqM4j69O+8UqDA4NvKMomKGYyukXKM0
         onMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051872; x=1789656672;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VFhy93n6Rb/y4cA3aaIcOvTxc0gTIiwSK8DV0XBamcA=;
        b=cNDaUZst5hWbaGbeT8PsYvvw3u/nVNezfZT+OJpslLeOzPGLmOPDraIrQrHAyPdZvm
         a+4jRCgw4g3zyevndHAwh0rKgOXmMYknLXzqSxGS86cdG5AxA0jL64/XzuMDX6G/sXg6
         eKadKmBGBKRAeocgMKv3lT6G61UFUF7oG+oXsq+DY595K45Vh/QDgztIPL49/odc/v8C
         KxQLXNQPAArtO2Om6RQ5M/nTiT71AtMZC6F8ItKRoERb30OXoi7Vs3TI5aE9k4J1B8fu
         rfsyg/vVaiHKUaDetICG4D1+Xi434TSyKgJYqQTSMb7Yjl4fEN87dVu50ZEY5wtnoOy0
         p2gw==
X-Forwarded-Encrypted: i=1; AKwUvBwdobcjagCr3W5wiEjdRJNyGeKv4ZC92NDZhcAT7zUsV9kcag4BFXKgKZu1tsUlnqf0ovFUB3nMom+75Ws=@vger.kernel.org
X-Gm-Message-State: AFuF++ls+1thD+wvNoereuXnXVuQM4y0+NxjTbMdEXx84NZ36zh9UQTw
	X9ww9MznEyZi8F4cRdw9P8yqyszFlFKr0RgnR84K1AbYPdhlhEoKt+z8MHkhSXrylz+6tLBuJQn
	xupmRCh4I3L/biSuwuXUatA==
X-Received: from pllx5.prod.google.com ([2002:a17:902:7c05:b0:2dd:1e7c:bcec])
 (user=ericchancf job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:46cd:b0:2db:39da:90f2 with SMTP id d9443c01a7336-2dd07809f49mr112539965ad.8.1789051872100;
 Thu, 10 Sep 2026 07:51:12 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:51:06 +0000
In-Reply-To: <20260910145107.3640991-1-ericchancf@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910145107.3640991-1-ericchancf@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910145107.3640991-2-ericchancf@google.com>
Subject: [PATCH 1/2] coresight: Add missing dev_pm_ops to AMBA drivers
From: Eric Chan <ericchancf@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Leo Yan <leo.yan@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Eric Chan <ericchancf@google.com>
Content-Type: text/plain; charset="UTF-8"

When ACPI or MMIO platform driver support was added for TMC, CATU, and
ETM4x, runtime PM support was hooked up for their platform drivers via
respective dev_pm_ops, but setting the .pm pointer in their AMBA drivers
was missed.

As a result, when these devices are probed via the AMBA bus, runtime
power management does not invoke their runtime suspend/resume callbacks,
leaving device clocks (such as atclk and pclk) unmanaged during runtime
PM transitions.

Move the AMBA drivers next to their platform drivers and hook up
dev_pm_ops to their drv.pm pointers across TMC, CATU, and ETM4x.

Fixes: 70750e257aab ("coresight: tmc: Move ACPI support from AMBA driver to platform driver")
Fixes: 23567323857d ("coresight: catu: Move ACPI support from AMBA driver to platform driver")
Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Chan <ericchancf@google.com>
---
 drivers/hwtracing/coresight/coresight-catu.c  | 21 +++++++++--------
 .../coresight/coresight-etm4x-core.c          | 21 +++++++++--------
 .../hwtracing/coresight/coresight-tmc-core.c  | 23 ++++++++++---------
 3 files changed, 34 insertions(+), 31 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ad8dafea7d2f..d9a12d5e48fa 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -612,16 +612,6 @@ static const struct amba_id catu_ids[] = {
 
 MODULE_DEVICE_TABLE(amba, catu_ids);
 
-static struct amba_driver catu_driver = {
-	.drv = {
-		.name			= "coresight-catu",
-		.suppress_bind_attrs	= true,
-	},
-	.probe				= catu_probe,
-	.remove				= catu_remove,
-	.id_table			= catu_ids,
-};
-
 static int catu_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -702,6 +692,17 @@ static struct platform_driver catu_platform_driver = {
 	},
 };
 
+static struct amba_driver catu_driver = {
+	.drv = {
+		.name			= "coresight-catu",
+		.pm			= &catu_dev_pm_ops,
+		.suppress_bind_attrs	= true,
+	},
+	.probe				= catu_probe,
+	.remove				= catu_remove,
+	.id_table			= catu_ids,
+};
+
 static int __init catu_init(void)
 {
 	int ret;
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2247ad55d444..ace5e077a10c 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2460,16 +2460,6 @@ static const struct amba_id etm4_ids[] = {
 
 MODULE_DEVICE_TABLE(amba, etm4_ids);
 
-static struct amba_driver etm4x_amba_driver = {
-	.drv = {
-		.name   = "coresight-etm4x",
-		.suppress_bind_attrs = true,
-	},
-	.probe		= etm4_probe_amba,
-	.remove         = etm4_remove_amba,
-	.id_table	= etm4_ids,
-};
-
 #ifdef CONFIG_PM
 static int etm4_runtime_suspend(struct device *dev)
 {
@@ -2528,6 +2518,17 @@ static struct platform_driver etm4_platform_driver = {
 	},
 };
 
+static struct amba_driver etm4x_amba_driver = {
+	.drv = {
+		.name   = "coresight-etm4x",
+		.pm	= &etm4_dev_pm_ops,
+		.suppress_bind_attrs = true,
+	},
+	.probe		= etm4_probe_amba,
+	.remove         = etm4_remove_amba,
+	.id_table	= etm4_ids,
+};
+
 static int __init etm4x_init(void)
 {
 	int ret;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..ece2e8c9be26 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -953,17 +953,6 @@ static const struct amba_id tmc_ids[] = {
 
 MODULE_DEVICE_TABLE(amba, tmc_ids);
 
-static struct amba_driver tmc_driver = {
-	.drv = {
-		.name   = "coresight-tmc",
-		.suppress_bind_attrs = true,
-	},
-	.probe		= tmc_probe,
-	.shutdown	= tmc_shutdown,
-	.remove		= tmc_remove,
-	.id_table	= tmc_ids,
-};
-
 static int tmc_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -1044,6 +1033,18 @@ static struct platform_driver tmc_platform_driver = {
 	},
 };
 
+static struct amba_driver tmc_driver = {
+	.drv = {
+		.name   = "coresight-tmc",
+		.pm	= &tmc_dev_pm_ops,
+		.suppress_bind_attrs = true,
+	},
+	.probe		= tmc_probe,
+	.shutdown	= tmc_shutdown,
+	.remove		= tmc_remove,
+	.id_table	= tmc_ids,
+};
+
 static int __init tmc_init(void)
 {
 	return coresight_init_driver("tmc", &tmc_driver, &tmc_platform_driver);
-- 
2.55.0.1003.g10538fe699-goog

