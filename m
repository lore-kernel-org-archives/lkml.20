Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E94C3BB116
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 22:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790978747; cv=none; b=ZEF3bLbnbOCbSK1vdeWmlNWCuLE87mN33m8SelGvnKdkqWxYph9bIJqfocYTjGTYwPhm2r34jmOSWGa8r0NbBnthUFXB8+OQTWO7yELpgz5eV8d7L17cc1u7Skx3CeJpEaaHzVq9l4RjZreUBFqtSWfJU9kl3I+7Vne6cUK1X5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790978747; c=relaxed/simple;
	bh=01XW4uC/sGdUHWiw99Nd7VE9u7bEzoXNo4QNFV8NZy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PlmHWEpQvfVImkMKviNCxZd7m8IQsb1AoGPBOyJYNY+IgP/HQKyC42JOy9t8UBK4w4SOyam/UzsSBDIktO6SqA8Jpg/sw4Gjslyd5DHi65wF0/vhkrvoQtVQbqSqWJv/RjcfDjorPuZu3oj92LBsrwEuw8MeV+fcymmhq+3crb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+vyULPE; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+vyULPE"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f38so197885ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790978746; x=1791583546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8/HFUWluZhijz+URCNd+7IiH1oTyp6nTgJbUzgXg/4=;
        b=c+vyULPEsPxrvz8hR4E+VQD/8I0rPSXCXN4LKlUxvkqvkFSAk0DvwC8mmkMHnQUZVy
         2v9FjRbeS5vmn0SAc51K+IilUvF/B5jBfinZl0DReiWiqUW/vHfSZXeWUhcqC3eqTkZB
         h0/CBOKpdRrc1lDZt+4yHbKiT757G1W39NF/BNkGqB62FkAgzJAvQcgtx4tikO5yced7
         B6Psxcuo7W3uzlPEyxNMdeDLeBNoxslMitR7g1vFHSDsySkd58W5ns5XNZeF004vfjW5
         QMmyPu9nLI7aGnv8mlhWSh3PL4yosVvxSmgJRWPUstD215BPBQ3SIXL3XsxNj6BPS/81
         JSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790978746; x=1791583546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j8/HFUWluZhijz+URCNd+7IiH1oTyp6nTgJbUzgXg/4=;
        b=YYygmroPkb30GHBp7vFcWsJgfJFG8yvzDcSTNoUt2k9sFiC5xCeg60hRsKvEalKkU5
         mPty3RhxFh1VgsghgzW8t3sQ157/MFPc+z9vG7m++GW2jRap1P2RFpi9cCRx71OYeesg
         3TkWmeCisaQX0iUAzuv6A5Sg+LtRVAEG4ZWMnQJPSQkk1NcUT2ItXn1MLnT65D+gDHPo
         7QPVeN+u2G2MtvSKg0GfjNzassvKF+MkKLR+MjAovLS87/LXbAc1EUIZyTYDOUkDj4J7
         BB35D/jpAlKOow9DkOyRDLmoCgIfysF6VWtsS64IBq6rtSHv90pJZJs8uqJ8e0w9SCB+
         0C3g==
X-Gm-Message-State: AFq9FYJn/38izV3aNrv+lYn0WPv3lgFvcDM8Oln/RPTHTVvqyIqnNTbS
	WEJpaZwsAN+KFH8PRDEp+GC9YzD2xouCVPsJOs91GLxqOMTiyNIB8bjDKxlJnOPx
X-Gm-Gg: AYBFou2GdS+4wp9gD/v57ej9VNdLrLKTuhp8nh3OG0894AZnvbKKSmexOyNtGGlfgb0
	Wu3AUyAarIVVwkimJPbEPvFfb+4DmSorLV+GIoOMbZhYgai6KEBYjKHpdY16IcTeJzJ43SetcAo
	l+t34+UKeZ8UfqGfYtTMguhkGTH7yHmzNiRUAFT8VjIwHmg589LnwASTmMHPY6T8E3k9LvBCceq
	YTIWtTzi8nLyMQUqRHnQWdZhNU2aQEEgUqTjyoqA1kvtoE2Xo9DEpgwAm9EWk2X1Wt/PBARHnwA
	jSIJhXLts9ZIUjjOQpreREpVh9mw6m5qv8pH/7ABWbDpaLHjz6Lv5MFyCTbKMB5e93CBDDNqkJL
	G3BuHc3iPiVAYPPT/+G7s40AmPDGxWk2mjA4NOW/Hc7sYNC7q6udFmZ9HUVtKcJQ0OhyavUXAWM
	8X7BChAiz10yw3CP6j/c9ZILlKpP9dMHq43yJkXAd6aYHG9bssUHMT3PLwXz8245Othxs=
X-Received: by 2002:a17:902:f607:b0:2df:9556:6847 with SMTP id d9443c01a7336-2e49b7ff04emr31434085ad.70.1790978745585;
        Fri, 02 Oct 2026 15:05:45 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ad1a9sm12324835ad.43.2026.10.02.15.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 15:05:45 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	lee@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v12 9/9] media: ov8858: add ACPI device ID INT3477
Date: Fri,  2 Oct 2026 15:05:40 -0700
Message-ID: <20261002220540.1271601-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002163350.1248431-1-tchatard@gmail.com>
References: <20261002163350.1248431-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

Assisted-by: LLM
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..d106cad6f 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -7,6 +7,7 @@
 
 #include <linux/unaligned.h>
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -1981,11 +1982,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] __maybe_unused = {
+	{ .id = "INT3477" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
 		.of_match_table = ov8858_of_match,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_ids),
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.53.0

