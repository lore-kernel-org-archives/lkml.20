Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F6E5474F;
	Sat, 29 Aug 2026 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788008811; cv=none; b=LLnEWoiqaSQIbmZWDUxbcIOcTWkdY2irr40neP/6hQc1Vt981JzEKGNcAFl/rVKlsUvud9ULS4XOEYwRxm3PZBSLFcldA5B5IrqWHDZ4pvS4fi1fEnHWpXIrzHxXkHAqFDq5chpUiQfpjDYvzNOshIXRXpU1XxTYIPBMTn8rC0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788008811; c=relaxed/simple;
	bh=cCauXrC/bvEWWmuAeczaqiHNRpfcepfKAkAqqypm6s0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G/6HqXKFOdvTCokVMjfG09aG8zVLVaQR4edXq6J4gE1enmp8psVuIiUnmZmYkSUFztsCiFi9HhJdv4QQoXDi+d8dU86YE5rrrpDAn42uBbgcp55TWXOwkDwKVVNkwJNWSP5/ukX23kk9Uq7IOCt5LW84p8RikwCo+dIIIVr5IqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6vQJha5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6vQJha5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23D5CC2BCF5;
	Sat, 29 Aug 2026 13:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788008811;
	bh=cCauXrC/bvEWWmuAeczaqiHNRpfcepfKAkAqqypm6s0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=S6vQJha5GJmTgyJxG4sduYBknLaGGphLXEHOxnOgKZ6QbMi7jwbDNaoejfmDLcBFg
	 1jmWHdxXVnMtrRCxzt2MObFTm0LES6jEFzsL+GHqCEW9yHXIJLJVthsveNJnnVdMt9
	 HJ779UDbGundhb+upobsCKRPq8MWuM3mtNCD7ZOoKuM/NkW6UPlS+J/NKH3gi83CYw
	 UqUPJPSfz/M5mhjW8AuDrXp6W2htnz2Z2NhFnq4evDnGJCKzF0DM4fvjPm9L9GWQKM
	 wozEUgGoRmquqDCVrdMgR8w1nFDt8UZ+j5dJyquXlgatVTAZTNzB4J7kpClrzHvp6I
	 vuec+55zPKeoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BEEC61DE1;
	Sat, 29 Aug 2026 13:06:51 +0000 (UTC)
From: Muzaffer Kadir via B4 Relay <devnull+muzafferkadir.mainlining.org@kernel.org>
Date: Sat, 29 Aug 2026 16:06:34 +0300
Subject: [PATCH v2 2/2] media: i2c: imx258: Add reset-gpio support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-imx258-add-reset-gpio-patch-v2-2-bfd27891e225@mainlining.org>
References: <20260829-imx258-add-reset-gpio-patch-v2-0-bfd27891e225@mainlining.org>
In-Reply-To: <20260829-imx258-add-reset-gpio-patch-v2-0-bfd27891e225@mainlining.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: git@luigi311.com, pavel@ucw.cz, tomm.merciai@gmail.com, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Muzaffer Kadir <muzafferkadir@mainlining.org>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788008809; l=2313;
 i=muzafferkadir@mainlining.org; s=20260816; h=from:subject:message-id;
 bh=AbYnmMAAO6Q9SZ+P54cCQpoqnvvpRe+zS71V1ysAPrU=;
 b=q9yuk/z81n9lwAaG9CVZRENF6xYpN494oOHBNgm4PDrgsUWBU/jpJuYhF2X2VZb7LQnaLhOW7
 rxMdLz8rY0pCjBy0VOet2rdRknrGvoZ+AXn1bbyN275zh+Yxf7l5+df
X-Developer-Key: i=muzafferkadir@mainlining.org; a=ed25519;
 pk=4zkv4suQ3cYcO4Z7CrV8JSSjEGLBGepUtvQCFjgnYIU=
X-Endpoint-Received: by B4 Relay for muzafferkadir@mainlining.org/20260816
 with auth_id=954
X-Original-From: Muzaffer Kadir <muzafferkadir@mainlining.org>
Reply-To: muzafferkadir@mainlining.org

From: Muzaffer Kadir <muzafferkadir@mainlining.org>

reset-gpio is already documented in dt-bindings but never implemented
in the driver.

Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
---
 drivers/media/i2c/imx258.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 9c3a6579df0d..4a0663e816b5 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -9,6 +9,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/unaligned.h>
+#include <linux/gpio/consumer.h>
 
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
@@ -681,6 +682,7 @@ struct imx258 {
 
 	struct clk *clk;
 	struct regulator_bulk_data supplies[IMX258_NUM_SUPPLIES];
+	struct gpio_desc *reset_gpio;
 };
 
 static inline struct imx258 *to_imx258(struct v4l2_subdev *_sd)
@@ -1127,10 +1129,23 @@ static int imx258_power_on(struct device *dev)
 	ret = clk_prepare_enable(imx258->clk);
 	if (ret) {
 		dev_err(dev, "failed to enable clock\n");
-		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
+		goto err_disable_regulators;
+	}
+
+	ret = gpiod_set_value_cansleep(imx258->reset_gpio, 0);
+	if (ret) {
+		dev_err(dev, "failed to deassert reset\n");
+		goto err_disable_clk;
 	}
 	fsleep(400);
 
+	return ret;
+
+err_disable_clk:
+	clk_disable_unprepare(imx258->clk);
+err_disable_regulators:
+	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
+
 	return ret;
 }
 
@@ -1139,6 +1154,7 @@ static int imx258_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx258 *imx258 = to_imx258(sd);
 
+	gpiod_set_value_cansleep(imx258->reset_gpio, 1);
 	clk_disable_unprepare(imx258->clk);
 	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
 
@@ -1383,6 +1399,12 @@ static int imx258_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	imx258->reset_gpio = devm_gpiod_get_optional(imx258->dev, "reset",
+		GPIOD_OUT_HIGH);
+	if (IS_ERR(imx258->reset_gpio))
+		return dev_err_probe(imx258->dev, PTR_ERR(imx258->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
 	ret = imx258_get_regulators(imx258);
 	if (ret)
 		return dev_err_probe(imx258->dev, ret,

-- 
2.54.0


