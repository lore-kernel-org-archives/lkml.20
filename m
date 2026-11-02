Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793580496;
	b=PHgZ5j+IOgajaBVzbqy9aNKRwIGdZHyoFtFeWm+Zgc8pB6NJN3H25bq8FlR/ucs//aHT
	 fhcSmlpDAijkOywir+QwSXiiGlqFU+KM9aJC9kELo5yuFYJVzkR1trr/AAAUAP39NGm0K
	 x4lPgtbRvqhheBig7/fASn0nJoqlL9u/0L6y2vmKxAJ594TDtHXMv6/gIMBTCa+psw8O+
	 5QkVh/HSIqKY/47SLmmBGny4aKrEPKqnw6oZhnUuY7VlhDqcW3jsxwpyigywAByjSvZsl
	 aFHdlDuPtu/iBqZwW8Myv0qKObeJ88RFlunrG0iZ4L2vt1Hdqi0EO2TqnJinWR1VIqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793580496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TFa0EQ/jMEbb9GS9xvK0BNyEEOcr4PcUqGB5uPGngVc=;
	b=NIScF3g27h9LX/6iH7saAnFzIodkHx6hCAymYK9AcH0Z9B2biu63fRAMpr1YM8n+rInH
	 SU4Dzt3rbVmY2GZsKBh2OE7DsAgJcvFIDoUJNrYvUmdxqd1Yai7ES3/vfn0cBxYeBFcb7
	 wnQFDV+suytOdDv6U65r5OiU6uaqOks2Ft6Uzmtc+osJqfSCCt4BJ297alcstvFyu7HV3
	 /5cOalis2GCIV3KNecfAg+9bK4j5gUr7/LfJjCmWBIXnr/BDElTrEjM1Zhy+vuQd/BGRP
	 6y5UrHRDcf2ZhzwVfToGQ8BSXiKx/Kegb8TJAg3ZFskCJLbPzyfiMChHGL2MHh/TXxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aXOils/j";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EED606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 00:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96EED606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXOils/j
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df8fe8513so2041742f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 16:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793580494; x=1794185294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFa0EQ/jMEbb9GS9xvK0BNyEEOcr4PcUqGB5uPGngVc=;
        b=aXOils/j+4x3fUKEo0TecqozQsVhSl5mIeLQN/yziPDeJvwpvN6tdnbtR6GfFtoFZq
         yuVF1tYhasngJGwMCyS0PpLrL35thT0fMM56XgAYaOenmmWK0VgUPDhtUg/p7voStALj
         ++0BlaUVk2xPEnB2BwF+iyHPJDAFjXUCkeqP1iRSEbKTmH/+E+SC1CsttMNPEXjuO5dC
         5uNqRGsiWtC6ScSM9MgqPR7rfUF8vDYBLGTmfWkbaD4vJ4fy6TvVj32V2F6uik2yPRG4
         /6RkVxV1Qaj4RuSiglsAutj6qsSJWzbSVHputFauzizdimhleeksR/ms9oVxws3fOKqg
         5Hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793580494; x=1794185294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFa0EQ/jMEbb9GS9xvK0BNyEEOcr4PcUqGB5uPGngVc=;
        b=IJKIctZWemNPnpbKEcXoHyMhxeDerAeGy2bvmSqBUCbQhqGCQtnlxwgk+dD4901AVX
         bIf0d1cu4jQjkuR19ZdPzKeLD5tx4XDkvoyy6y9B2i6CDfu09FccrXIkj7mivy6WOjkC
         kSaL5rvPkin/cQPJkHYaRuPSyvO7EK9jaln+ufd53KRNYZ4Q0+k7knCzQOpWC9mRJI7+
         PZ4TUfAxbzCjb7T/TQlVPwdUepjtWarZL1el6yIPanDpGCEutZwITJm7fMcnyFxIgbxD
         xjej9tsL1/mNPVRuUsa1db84zjh0xEzTNYYDe7qCF15OOR+MExGdnzFeuSu1MTAEPMCS
         08pg==
X-Forwarded-Encrypted: i=1; AKwUvBxxlcs0/T18vmFPg0U2Wa7OV6eHbvOshieCxNfgnNL5CQlcHFul88BnDaVKF4M2jjuXh+gWpKM6ys1iqVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VmFccAvUbIXUk3LV87XvNesuKD/6h8wN1P5ILTAPZpNqWNWix
	z80fJTzhwblR0n6upCxto1rSYab+mhVtwXjHBZlnIt6L11pbf3qR1HU1D21CwZw=
X-Gm-Gg: AYBFou3mA0lsowaYQrSrb3w64qQi72jtULEeQGRa2pNAehZSxc1MKT1TOqHEux5vSaq
	BBxMa8Uyd0zgCVA8i5QchJ2gKuzOl4HHVSJ/VcMZmnn0BuA/TQO/HOPSswCg1rEKiExCLx6W3B8
	JBbbxKGlWJH/QpyfZaHizULS/pdsQGup/xAiizdDBpFTkn1kqfjOFXYqjhCs3Ic3rGixtBGL+hZ
	OHn7J1eJ5RlBnq7GE5LcVSMFG7W4+WGXDkxkvSYEfz/Yq/1tdbX3h7jUZmDAK2gAaWPdzk4IBNz
	vK8/cPO+chyjbcvpNiBp24DkUiUCtPlS0qQAmTPyHg5lRPuMz1fhuVGbEXnhZZ/qXHNVr78fvpf
	IghFm5DW0pvxfQtByJRbMSKGz6qem0EyF55pUDQFpIN+uZ3W8YA8ttHFb/OM4xnjucGVNqZriUP
	0F6chRsFZB1E7BLOGfh2+Nsonu9nWTg5yZGeqB+9l4gxRn2LEvZgzAGHXyfdXYLvlcvMxgoLNDf
	UjQ5NV2RG+P8AXGGX1zziLFXaItdsn1FBDGB/DZY1WGuQItkrcC7MqoQQIEMhodVSVRlJIjy9fU
	IkqBdzfoEAIHmnERisdnmlcNd4zLUklD6RCJ
X-Received: by 2002:a05:6000:22c2:b0:48e:21d:7265 with SMTP id ffacd0b85a97d-48e6e50d69emr21050311f8f.34.1793580493996;
        Sun, 01 Nov 2026 16:48:13 -0800 (PST)
Received: from sasha-User.lan ([185.159.163.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7246fsm17044531f8f.19.2026.11.01.16.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 16:48:12 -0800 (PST)
From: Asdlerto Korry <korryasdlerto@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Asdlerto Korry <korryasdlerto@gmail.com>
Subject: [PATCH] media: i2c: imx258: Add support for the reset GPIO
Date: Mon,  2 Nov 2026 02:47:24 +0200
Message-Id: <20261102004724.346475-1-korryasdlerto@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binding documents an optional reset-gpios property for the XCLR pin,
but the driver never requests it. On boards that wire XCLR to a GPIO the
sensor then stays in reset (or is released at an undefined time before
its supplies and clock are up) and does not answer on I2C.

Request the GPIO as optional, keep the sensor in reset while it is
powered off, and release XCLR after the supplies and INCK are enabled,
followed by a delay before the first I2C access.

Found on a Samsung Galaxy M52 5G (SM7325), where the ultra-wide rear
camera (IMX258) has XCLR on a GPIO; with this change the sensor is
detected and streams.

Signed-off-by: Asdlerto Korry <korryasdlerto@gmail.com>
---
 drivers/media/i2c/imx258.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 065c33380f60..899dca4be650 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -4,6 +4,7 @@
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -681,6 +682,7 @@ struct imx258 {
 
 	struct clk *clk;
 	struct regulator_bulk_data supplies[IMX258_NUM_SUPPLIES];
+	struct gpio_desc *reset_gpio;
 };
 
 static inline struct imx258 *to_imx258(struct v4l2_subdev *_sd)
@@ -1130,9 +1132,18 @@ static int imx258_power_on(struct device *dev)
 	if (ret) {
 		dev_err(dev, "failed to enable clock\n");
 		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
+		return ret;
 	}
 
-	return ret;
+	if (imx258->reset_gpio) {
+		/* Release XCLR once the supplies and INCK are stable */
+		usleep_range(2000, 3000);
+		gpiod_set_value_cansleep(imx258->reset_gpio, 0);
+		/* Give the sensor time to boot before the first I2C access */
+		usleep_range(12000, 13000);
+	}
+
+	return 0;
 }
 
 static int imx258_power_off(struct device *dev)
@@ -1140,6 +1151,7 @@ static int imx258_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx258 *imx258 = to_imx258(sd);
 
+	gpiod_set_value_cansleep(imx258->reset_gpio, 1);
 	clk_disable_unprepare(imx258->clk);
 	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
 
@@ -1389,6 +1401,12 @@ static int imx258_probe(struct i2c_client *client)
 		return dev_err_probe(imx258->dev, ret,
 				     "failed to get regulators\n");
 
+	imx258->reset_gpio = devm_gpiod_get_optional(imx258->dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(imx258->reset_gpio))
+		return dev_err_probe(imx258->dev, PTR_ERR(imx258->reset_gpio),
+				     "failed to get reset gpio\n");
+
 	imx258->clk = devm_v4l2_sensor_clk_get_legacy(imx258->dev, NULL, false,
 						      0);
 	if (IS_ERR(imx258->clk))
-- 
2.25.1

