Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C5D195B1A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792029396; cv=none; b=Fe6OpQmg+pdvK11GraFxVuAJUb7EBznPgLIleV93h87lua9KSTliNIiAqb0RbcUqgoxO7p+hKSf5iXhI+wcmH8H9Lsz4Bl3sA+4v1WJCs0ZDO9UWHLbfd+niJcs4ZpCGMqj5ugAvqmluKFUUSGpZgFjHGkdzuST518eH/1SLAuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792029396; c=relaxed/simple;
	bh=rEr0SuVn7nZ9MjGQg/bSCKwbMj++w/gb0WSIVoNsmao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kchuhxe0LoO/30Lc7tA/njuhKKKW35qCNKStzWxwBK19+x8AP5BQIuAt6ZPt5Jz0hLgasWCHeOhznUVY+pBhP8Wy2ff4iPCHmxQQkYDnJJGECLPJfevik2XcZIb3H/NuMRUiRWtX6MvMMa6QRpiIPebO3iqn31sxCf5X1Q12xfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwpoG2PQ; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwpoG2PQ"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3550c917fd3so2196316eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792029394; x=1792634194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1FsLNvJbfAGqqWf52h0nbW4N3/eLeJk37u/bFcrI00=;
        b=rwpoG2PQMFuL+h8bkmk205kayVhWhT7iQh64W9cXnHPqRYdnF/t6EcW9m0x6XcifNT
         968iem3byvFqQGcuBHQKRqXylI1yK/I+fI362tgqIMJYz8UXI6ZspJYc6dar3U++0wUB
         BRqFKV22+iKgzufd3/a1r3L+l3lsyBvIuZeXy93VZl3LlFXOrXiCbqPlaE8gDwhjxl2z
         il+OXOmHdVTnrq64c1THkBU08C7o3MOsbLGQ4UARRdiY/RX5mWzbLAD494ywoUS1AAJS
         vFWXBf5iRSmkpjUApsDySINv7FFjYE04NBwAfKOKbmGAPe/8iV144WZClL7sQr2fGRSL
         fBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792029394; x=1792634194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1FsLNvJbfAGqqWf52h0nbW4N3/eLeJk37u/bFcrI00=;
        b=B9h3tqz8Ma72luNBLieImIMbOSbxaQMgdomhABvbmk62Q2K5Kt0t9lcbHcr7wNHPPo
         /5UYDvyyjtlxYhCBKnrUKSqA3AFtK/mIwWAJ5iiNN+8s9zvhe/XUTGD7eG34jbOi1Tr2
         uaMF7qsA1d0OcrJIi3D+jnEqxTzDl4DEivm/wblpYMsspfh0fnjSoWSyc3YsiulpwqxL
         3Ph114uKbq2pYDCUALFgh588SqybvzPyelBnDZjpE0is+CJLapOUGSXaOEasWAbtfHct
         y7bos6HxXp/ILevSGCI3HJKMrZ9MUitC/QqSjS3RKwPXCzwjdU1ZBaxB8th7Q3D9+3JA
         Facw==
X-Forwarded-Encrypted: i=1; AKwUvBy9m7qGY18ZqtF+pVIgHnkMbJq6MZqBYqSgrY2WBiFFyVKEAnxHVMx9TM1mrPlSeWYHWp/qg0/vrCDBlYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKj/EXliGbLi1KqgeQhT6qJMJrt5pvRd6Io5/Thl4qokxsq2Nxu
	h3Fyfy1cKgFoJXztJHzGkmSmHjJPB/TFE3pnnLNDODFmYnJtCh5szv23JOhluoEE
X-Gm-Gg: AYBFou1iPyDL2tbRi3EjU4M2kxdQka1+oaZ3NwxkGl1BtSfS8/TUSvojQzITsXxXa2M
	iBGhw/Si5Q1T7pEopN79m7xJQfhjjQWni7li2FYsI+v/Mfl2ioSKueLt/HWab6ilTn9Rq515emS
	rvKFCnhH9q2sgyvIO7dMFnwjECVPVo7pU1brWi4VQcyWW7KkStqaQUP2TziY23V5yOOhRo3t6Mf
	PCOuP/EYGYXr/iBhGS4yh0k5p58IeuKbiEwlvOF+lUaGD6n+B1Aqk011Rcon2BTCxmoE0tbK7mI
	ZMCuCfviOImqEAx3DsL4mfPQqgJ6HKi1eWLIfYmM3W4fo5cBkZ+6e8nXARyZ1TtHan8dkpW+63h
	UGMg1MafqZOJgIr1DDSrlbpy9kVHrS5421JIhZYZ1V7uVmq+8Kix2oIVl1tOh2F+AzducWszLyP
	TpsrjFnA+0m2txDtmkZ9zTAthfIQi2nhXdIl4tzQP7JIlH3syWjvumfoan1klJRai+Chhz2jeyb
	cAa0/c=
X-Received: by 2002:a05:693c:2a04:b0:35e:1807:cedf with SMTP id 5a478bee46e88-35e18171411mr4108373eec.1.1792029394233;
        Wed, 14 Oct 2026 18:56:34 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:a490:42fc:1e02:1d0b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b690af3easm27111347eec.1.2026.10.14.18.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:56:33 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: vireshk@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Subject: [PATCH v3] staging: greybus: replace PTR_ERR() with %pe in error messages
Date: Thu, 15 Oct 2026 07:26:24 +0530
Message-ID: <20261015015624.22031-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Use %pe to print error pointers directly and display their
error names.

Keep PTR_ERR() calls when the numeric error value is needed
for returning the error code.

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
v3:
- Extend the %pe conversion throughout Greybus, as suggested by Alex Elder.

v2:
- Use %pe in the firmware management case, as suggested by Jeremy Clifton,
  to match the other cases.

v1: https://lore.kernel.org/outreachy/as0nhVbagZa8Birm@user/T/#t
---
 drivers/staging/greybus/arche-apb-ctrl.c | 18 +++++++++---------
 drivers/staging/greybus/arche-platform.c |  8 ++++----
 drivers/staging/greybus/fw-core.c        | 16 ++++++++--------
 drivers/staging/greybus/uart.c           |  2 +-
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 4302c2226126..fa4d2d88dc3f 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -145,8 +145,8 @@ static int fw_flashing_seq(struct platform_device *pdev)
 		apb->spi_en = devm_gpiod_get(dev, "spi-en", flags);
 		if (IS_ERR(apb->spi_en)) {
 			ret = PTR_ERR(apb->spi_en);
-			dev_err(dev, "Failed requesting SPI bus en GPIO: %d\n",
-				ret);
+			dev_err(dev, "Failed requesting SPI bus en GPIO: %pe\n",
+				apb->spi_en);
 			return ret;
 		}
 	}
@@ -323,14 +323,14 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
 	apb->resetn = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(apb->resetn)) {
 		ret = PTR_ERR(apb->resetn);
-		dev_err(dev, "Failed requesting reset GPIO: %d\n", ret);
+		dev_err(dev, "Failed requesting reset GPIO: %pe\n", apb->resetn);
 		return ret;
 	}
 
 	apb->boot_ret = devm_gpiod_get(dev, "boot-ret", GPIOD_OUT_LOW);
 	if (IS_ERR(apb->boot_ret)) {
 		ret = PTR_ERR(apb->boot_ret);
-		dev_err(dev, "Failed requesting bootret GPIO: %d\n", ret);
+		dev_err(dev, "Failed requesting bootret GPIO: %pe\n", apb->boot_ret);
 		return ret;
 	}
 
@@ -338,7 +338,7 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
 	apb->pwroff = devm_gpiod_get_optional(dev, "pwr-off", GPIOD_IN);
 	if (IS_ERR(apb->pwroff)) {
 		ret = PTR_ERR(apb->pwroff);
-		dev_err(dev, "Failed requesting pwroff_n GPIO: %d\n", ret);
+		dev_err(dev, "Failed requesting pwroff_n GPIO: %pe\n", apb->pwroff);
 		return ret;
 	}
 
@@ -346,14 +346,14 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
 	apb->clk_en = devm_gpiod_get_optional(dev, "clock-en", GPIOD_OUT_LOW);
 	if (IS_ERR(apb->clk_en)) {
 		ret = PTR_ERR(apb->clk_en);
-		dev_err(dev, "Failed requesting APB clock en GPIO: %d\n", ret);
+		dev_err(dev, "Failed requesting APB clock en GPIO: %pe\n", apb->clk_en);
 		return ret;
 	}
 
 	apb->pwrdn = devm_gpiod_get(dev, "pwr-down", GPIOD_OUT_LOW);
 	if (IS_ERR(apb->pwrdn)) {
 		ret = PTR_ERR(apb->pwrdn);
-		dev_warn(dev, "Failed requesting power down GPIO: %d\n", ret);
+		dev_warn(dev, "Failed requesting power down GPIO: %pe\n", apb->pwrdn);
 		return ret;
 	}
 
@@ -368,12 +368,12 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
 
 	apb->pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (IS_ERR(apb->pinctrl)) {
-		dev_err(&pdev->dev, "could not get pinctrl handle\n");
+		dev_err(&pdev->dev, "could not get pinctrl handle: %pe\n", apb->pinctrl);
 		return PTR_ERR(apb->pinctrl);
 	}
 	apb->pin_default = pinctrl_lookup_state(apb->pinctrl, "default");
 	if (IS_ERR(apb->pin_default)) {
-		dev_err(&pdev->dev, "could not get default pin state\n");
+		dev_err(&pdev->dev, "could not get default pin state: %pe\n", apb->pin_default);
 		return PTR_ERR(apb->pin_default);
 	}
 
diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index de5de59ea8ab..a97ac59c6f01 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -445,7 +445,7 @@ static int arche_platform_probe(struct platform_device *pdev)
 	arche_pdata->svc_reset = devm_gpiod_get(dev, "svc,reset", flags);
 	if (IS_ERR(arche_pdata->svc_reset)) {
 		ret = PTR_ERR(arche_pdata->svc_reset);
-		dev_err(dev, "failed to request svc-reset GPIO: %d\n", ret);
+		dev_err(dev, "failed to request svc-reset GPIO: %pe\n", arche_pdata->svc_reset);
 		return ret;
 	}
 	arche_platform_set_state(arche_pdata, ARCHE_PLATFORM_STATE_OFF);
@@ -454,7 +454,7 @@ static int arche_platform_probe(struct platform_device *pdev)
 						  GPIOD_OUT_LOW);
 	if (IS_ERR(arche_pdata->svc_sysboot)) {
 		ret = PTR_ERR(arche_pdata->svc_sysboot);
-		dev_err(dev, "failed to request sysboot0 GPIO: %d\n", ret);
+		dev_err(dev, "failed to request sysboot0 GPIO: %pe\n", arche_pdata->svc_sysboot);
 		return ret;
 	}
 
@@ -471,7 +471,7 @@ static int arche_platform_probe(struct platform_device *pdev)
 	arche_pdata->svc_ref_clk = devm_clk_get(dev, "svc_ref_clk");
 	if (IS_ERR(arche_pdata->svc_ref_clk)) {
 		ret = PTR_ERR(arche_pdata->svc_ref_clk);
-		dev_err(dev, "failed to get svc_ref_clk: %d\n", ret);
+		dev_err(dev, "failed to get svc_ref_clk: %pe\n", arche_pdata->svc_ref_clk);
 		return ret;
 	}
 
@@ -484,7 +484,7 @@ static int arche_platform_probe(struct platform_device *pdev)
 						  GPIOD_IN);
 	if (IS_ERR(arche_pdata->wake_detect)) {
 		ret = PTR_ERR(arche_pdata->wake_detect);
-		dev_err(dev, "Failed requesting wake_detect GPIO: %d\n", ret);
+		dev_err(dev, "Failed requesting wake_detect GPIO: %pe\n", arche_pdata->wake_detect);
 		return ret;
 	}
 
diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index 2016a74f137f..78321be80013 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
@@ -93,8 +93,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			if (IS_ERR(connection)) {
 				ret = PTR_ERR(connection);
 				dev_err(&bundle->dev,
-					"failed to create management connection (%d)\n",
-					ret);
+					"failed to create management connection (%pe)\n",
+					connection);
 				goto err_destroy_connections;
 			}
 
@@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  gb_fw_download_request_handler);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create download connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->download_connection = connection;
 			}
@@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  NULL);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create SPI connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create SPI connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->spi_connection = connection;
 			}
@@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  NULL);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create Authentication connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create Authentication connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->cap_connection = connection;
 			}
diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 172cf900eaf0..59a112cf47a0 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -951,7 +951,7 @@ static int gb_tty_init(void)
 					 TTY_DRIVER_DYNAMIC_DEV |
 					 TTY_DRIVER_RESET_SAVED_TERMIOS);
 	if (IS_ERR(gb_tty_driver)) {
-		pr_err("Can not allocate tty driver\n");
+		pr_err("Can not allocate tty driver: %pe\n", gb_tty_driver);
 		retval = PTR_ERR(gb_tty_driver);
 		goto fail_unregister_dev;
 	}
-- 
2.43.0

