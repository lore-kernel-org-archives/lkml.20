Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898FB377A8F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052570; cv=none; b=aNbYoq3oKr5NMajVgarZ3Iw2kdxHWttVJXqpDyQmeA3g2k+zKaOF5U0iJ9Lg8N7prKgGXmNwoOencwwMxzOg2zMorsSDrrquboCVV1dPtZzjinhDoKr3y6WlZ2Z/kzkoWMK0AywoYBhHiIusxyETLU0Bx+MG6bPiLoysfQAuuYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052570; c=relaxed/simple;
	bh=tivYpWGaLAT33m5esem/EoR3Bvjxuk+1Oas+5V5uYkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S6MgsgmupJ43gWVwZp51Yikc+HQQgmztiAYvAec++7kZUTf3WxizBE4CQPQDsm3fIyrp3FRL4Q5osBo8AF0yLG3zYUyrwZ8Dqe8X+KwguFnkg1WnY9/IQ+ifFSVcczuQwnMteup2O6fmVmqwas2Qef+9aUoLE8+TStpObouK2dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPEnnGiw; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPEnnGiw"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-157fe9d771bso2393257c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792052567; x=1792657367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TcZt7Qvk7+v3cat0JxOTXru0H5LpefDJps5uH3TVt8g=;
        b=MPEnnGiwGt7jHea9/PGH5FzLJywzSR77+xOHajqoiIFky8Jdw//iAiZKuC49QubVpO
         eAvvxkbZr/7YF919Fuqn6WjHRxugBs5QXYqT5PBAd65BjnPy658XJPZJzLt45Ni9GBIY
         GWx8wUsvJx80hijw26atlGk9Hn9JJdVTwg/rJM7E3+iAswGqMww51aHBYMGzh07ixY2e
         VzzIYNXmzvBYqm/Bsgj52aVLRoilodCp1GibtVT41rjKjQ38ZzJgxAasjcMMrUW72dBl
         gRrsLs8Re0bMS8M5HvsLPe8vd2IhcZW6oqq5FERa2vL8OvEASAvghFho85ffMEcdSZ5V
         Foyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052567; x=1792657367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TcZt7Qvk7+v3cat0JxOTXru0H5LpefDJps5uH3TVt8g=;
        b=qOcUMNWwaMGxpCXNP36ZymAe/eEUkLrqqZ9lq7aER6BmoTh4TtWR+Wycfho/zzj3hj
         GSUSspszpLJ78OZyHsuDTmRrcGXEJdbFQZLLDTq5OOyqMMqRnGFZFP6USxnjnCtYt5jE
         YPpdr8/i9+tJwVkq4srFFgCuZ9SjAcylqwhqDq+wrSeh3xStpmubD8eKteWuZuRobWC7
         p3it884BQ89jl2WeTlP8dEDtv4A+l8VDfH3ke+m7Xg9nH8uNkU5+EhUjTFbc34gXIvSU
         FfqM4mYQ9RjUH+zynDcckLtOOVZdWdADvnBdA0rXb3AyJKqVkuUXabOxP4t+dnjOuSgS
         6Ysg==
X-Forwarded-Encrypted: i=1; AKwUvBye0e/rzGfxH35e4FO6i5WAm0SQqotxe3p18hZdDIWnSreOmeeRi83qXdsDMqV35mVKtAmcK7QumdMPJak=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ544WJ/OzsYV6lJ+2kjdzicvCDgKsJs3p64Psp7z8JiaWE+iBl
	mRjBYsamR7+TeS3paGKeyiI3P+yhGTDIFgJDPv1yYihC/vTF4osW/Jpl
X-Gm-Gg: AYBFou23CtsTu+8h7Wiwtr2msqpBJjUdYku8oLNQtMRqaAG6J8lBET7emzs/EJAirKu
	rREr5TVe9w5vAwkv9tUeKlHOpWJWE+KM5zdO3Be8h80fA7+F2Wwdw3RVFxvRF/T94ryJJ2xVRBY
	B+aZ7RgeO9JQo5hXOuvHCUxmnc0kNVfSMO7H05vnxBbj6rgrIdDDwDeubOOYU8e78czoBnHKQXb
	NWXmCoeK3kxXaK10UtEX0Nx//jziLWZkkU8Dg6AF/sqyuhoB+HlOy8V2/Q4R6mZsFCnJ+ZMpI22
	infqSZwN8HnA26MD3YKZysqha4IRY0GquMoH6uooKql8fTRxyvgEgOH5EMVbCRnieWBPIQjDLr7
	y2iRT9YTjoehj/whEKVNqz7oKe6+9i9kqfCfh7SDzflBOukQDmfhQ18T92eGtLm+AB3kNT2UVij
	H+Ptev9AwQXypH1w3VYDPOccEcqdV8Wdukeh5TZlLYbxhK0gSsOV9wPlLI29gUrfLhRcLih20d4
	O7Usw==
X-Received: by 2002:a05:701b:4212:20b0:168:e942:4e62 with SMTP id a92af1059eb24-16a61789c56mr25359603c88.40.1792052567428;
        Thu, 15 Oct 2026 01:22:47 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:a490:42fc:1e02:1d0b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a32eb7ebsm63977236c88.12.2026.10.15.01.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:22:46 -0700 (PDT)
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
Subject: [PATCH v4] staging: greybus: replace PTR_ERR() with %pe in error messages
Date: Thu, 15 Oct 2026 13:52:38 +0530
Message-ID: <20261015082238.65187-1-pavankumaryalagada@gmail.com>
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
v4:
- Return error codes directly instead of storing them in ret,
  as suggested by Julia Lawall.
- Remove the unused ret variable.

v3:
- Extend the %pe conversion throughout Greybus, as suggested by Alex Elder.

v2:
- Use %pe in the firmware management case, as suggested by Jeremy Clifton,
  to match the other cases.

v1: https://lore.kernel.org/outreachy/as0nhVbagZa8Birm@user/T/#t
---
 drivers/staging/greybus/arche-apb-ctrl.c | 37 ++++++++++--------------
 drivers/staging/greybus/arche-platform.c | 26 +++++++----------
 drivers/staging/greybus/fw-core.c        | 16 +++++-----
 drivers/staging/greybus/uart.c           |  2 +-
 4 files changed, 35 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 4302c2226126..d30174310828 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -144,10 +144,9 @@ static int fw_flashing_seq(struct platform_device *pdev)
 
 		apb->spi_en = devm_gpiod_get(dev, "spi-en", flags);
 		if (IS_ERR(apb->spi_en)) {
-			ret = PTR_ERR(apb->spi_en);
-			dev_err(dev, "Failed requesting SPI bus en GPIO: %d\n",
-				ret);
-			return ret;
+			dev_err(dev, "Failed requesting SPI bus en GPIO: %pe\n",
+				apb->spi_en);
+			return PTR_ERR(apb->spi_en);
 		}
 	}
 
@@ -318,43 +317,37 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
 				struct arche_apb_ctrl_drvdata *apb)
 {
 	struct device *dev = &pdev->dev;
-	int ret;
 
 	apb->resetn = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(apb->resetn)) {
-		ret = PTR_ERR(apb->resetn);
-		dev_err(dev, "Failed requesting reset GPIO: %d\n", ret);
-		return ret;
+		dev_err(dev, "Failed requesting reset GPIO: %pe\n", apb->resetn);
+		return PTR_ERR(apb->resetn);
 	}
 
 	apb->boot_ret = devm_gpiod_get(dev, "boot-ret", GPIOD_OUT_LOW);
 	if (IS_ERR(apb->boot_ret)) {
-		ret = PTR_ERR(apb->boot_ret);
-		dev_err(dev, "Failed requesting bootret GPIO: %d\n", ret);
-		return ret;
+		dev_err(dev, "Failed requesting bootret GPIO: %pe\n", apb->boot_ret);
+		return PTR_ERR(apb->boot_ret);
 	}
 
 	/* It's not mandatory to support power management interface */
 	apb->pwroff = devm_gpiod_get_optional(dev, "pwr-off", GPIOD_IN);
 	if (IS_ERR(apb->pwroff)) {
-		ret = PTR_ERR(apb->pwroff);
-		dev_err(dev, "Failed requesting pwroff_n GPIO: %d\n", ret);
-		return ret;
+		dev_err(dev, "Failed requesting pwroff_n GPIO: %pe\n", apb->pwroff);
+		return PTR_ERR(apb->pwroff);
 	}
 
 	/* Do not make clock mandatory as of now (for DB3) */
 	apb->clk_en = devm_gpiod_get_optional(dev, "clock-en", GPIOD_OUT_LOW);
 	if (IS_ERR(apb->clk_en)) {
-		ret = PTR_ERR(apb->clk_en);
-		dev_err(dev, "Failed requesting APB clock en GPIO: %d\n", ret);
-		return ret;
+		dev_err(dev, "Failed requesting APB clock en GPIO: %pe\n", apb->clk_en);
+		return PTR_ERR(apb->clk_en);
 	}
 
 	apb->pwrdn = devm_gpiod_get(dev, "pwr-down", GPIOD_OUT_LOW);
 	if (IS_ERR(apb->pwrdn)) {
-		ret = PTR_ERR(apb->pwrdn);
-		dev_warn(dev, "Failed requesting power down GPIO: %d\n", ret);
-		return ret;
+		dev_warn(dev, "Failed requesting power down GPIO: %pe\n", apb->pwrdn);
+		return PTR_ERR(apb->pwrdn);
 	}
 
 	/* Regulators are optional, as we may have fixed supply coming in */
@@ -368,12 +361,12 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
 
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
index de5de59ea8ab..8e75accc34b6 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -444,35 +444,32 @@ static int arche_platform_probe(struct platform_device *pdev)
 
 	arche_pdata->svc_reset = devm_gpiod_get(dev, "svc,reset", flags);
 	if (IS_ERR(arche_pdata->svc_reset)) {
-		ret = PTR_ERR(arche_pdata->svc_reset);
-		dev_err(dev, "failed to request svc-reset GPIO: %d\n", ret);
-		return ret;
+		dev_err(dev, "failed to request svc-reset GPIO: %pe\n", arche_pdata->svc_reset);
+		return PTR_ERR(arche_pdata->svc_reset);
 	}
 	arche_platform_set_state(arche_pdata, ARCHE_PLATFORM_STATE_OFF);
 
 	arche_pdata->svc_sysboot = devm_gpiod_get(dev, "svc,sysboot",
 						  GPIOD_OUT_LOW);
 	if (IS_ERR(arche_pdata->svc_sysboot)) {
-		ret = PTR_ERR(arche_pdata->svc_sysboot);
-		dev_err(dev, "failed to request sysboot0 GPIO: %d\n", ret);
-		return ret;
+		dev_err(dev, "failed to request sysboot0 GPIO: %pe\n", arche_pdata->svc_sysboot);
+		return PTR_ERR(arche_pdata->svc_sysboot);
 	}
 
 	/* setup the clock request gpio first */
 	arche_pdata->svc_refclk_req = devm_gpiod_get(dev, "svc,refclk-req",
 						     GPIOD_IN);
 	if (IS_ERR(arche_pdata->svc_refclk_req)) {
-		ret = PTR_ERR(arche_pdata->svc_refclk_req);
-		dev_err(dev, "failed to request svc-clk-req GPIO: %d\n", ret);
-		return ret;
+		dev_err(dev, "failed to request svc-clk-req GPIO: %pe\n",
+			arche_pdata->svc_refclk_req);
+		return PTR_ERR(arche_pdata->svc_refclk_req);
 	}
 
 	/* setup refclk2 to follow the pin */
 	arche_pdata->svc_ref_clk = devm_clk_get(dev, "svc_ref_clk");
 	if (IS_ERR(arche_pdata->svc_ref_clk)) {
-		ret = PTR_ERR(arche_pdata->svc_ref_clk);
-		dev_err(dev, "failed to get svc_ref_clk: %d\n", ret);
-		return ret;
+		dev_err(dev, "failed to get svc_ref_clk: %pe\n", arche_pdata->svc_ref_clk);
+		return PTR_ERR(arche_pdata->svc_ref_clk);
 	}
 
 	platform_set_drvdata(pdev, arche_pdata);
@@ -483,9 +480,8 @@ static int arche_platform_probe(struct platform_device *pdev)
 	arche_pdata->wake_detect = devm_gpiod_get(dev, "svc,wake-detect",
 						  GPIOD_IN);
 	if (IS_ERR(arche_pdata->wake_detect)) {
-		ret = PTR_ERR(arche_pdata->wake_detect);
-		dev_err(dev, "Failed requesting wake_detect GPIO: %d\n", ret);
-		return ret;
+		dev_err(dev, "Failed requesting wake_detect GPIO: %pe\n", arche_pdata->wake_detect);
+		return PTR_ERR(arche_pdata->wake_detect);
 	}
 
 	arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_IDLE);
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

