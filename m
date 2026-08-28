Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A8B38A701;
	Fri, 28 Aug 2026 10:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787914325; cv=none; b=BPVFeYc4QOsssRILRvqzquOG88JuGaRdfenXWnKOxCcl3126GWdV5FVKNFkeXvD0uFwaqgxkV0Ioy4qxfidc9m+McEx4Bq2tMIqHmMTb1HCrtlz8hFENR3aECK1mriXGKIB7fD7RSBtFIjg0IOYzCPaaaoxV1vWmR+m41UIs/s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787914325; c=relaxed/simple;
	bh=5d1Etmt2K6uzSY/M4S6CODDgPVrnRfzbP2pC3gqthBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h+/HfRLOVg0OPBWnb+lp07dLtxlz7xg78r5cukSUZYSaWamgilOhEc89WI/g1miNO72ik7jV62lOlNqu8x4qwfA3as/JiSRTbsaEpNzsxSdE+J3c9fQZ53DLf+Tkg6qo4Y2OqbqQeRsV+GdNq3IZvykpj+Bl6k1CJoImS3E54mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIOnouq6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIOnouq6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D26EC2BCC7;
	Fri, 28 Aug 2026 10:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787914324;
	bh=5d1Etmt2K6uzSY/M4S6CODDgPVrnRfzbP2pC3gqthBM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=LIOnouq6FGynX7KjmaaTxYHknk112ECAHpmONkaueCgLzUH3/TSlLIdouFNnnauJC
	 QkNih4NJgh/IuAaVnNlPzp7GLff+dpsVuo+lOzWlsCtgstJY/ol73CeI7BaJPGnzMr
	 ioT/VUQ/knYDwsvfYx0AfbDuKPYCAVLkq6fPnxXbIdUtn+hxUyfXJ0vKTdmerGp936
	 mwU9JF0Kx5/zxlS3YVZo7TRLAc2AJ5pqfhLc65bJR06sATHmPSKz93TFlGp5FD1lVg
	 NVpnC0DHJBBXjZzmQq4YiLE/FXmjr/piBNuvSIYXjo3UXlhmCraqg2FXcNIQHOOF3C
	 bx8buchtiDgoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48CDCC61DCB;
	Fri, 28 Aug 2026 10:52:04 +0000 (UTC)
From: Muzaffer Kadir via B4 Relay <devnull+muzafferkadir.mainlining.org@kernel.org>
Date: Fri, 28 Aug 2026 13:51:47 +0300
Subject: [PATCH] media: i2c: imx258: Add reset-gpio support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-imx258-add-reset-gpio-patch-v1-1-633972d2a700@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQ5AMAwA0F+RnjVhTMaviMPSFj1g2UQk4t8tj
 u/yHkgSVRIMxQNRLk167Bl1WQCtfl8ElbPBVKarnLGo222sQ8+MUZKcuAQ9MPiTVqS2ccyNnXs
 iyEOIMuv97+P0vh/hRW3qbQAAAA==
X-Change-ID: 20260825-imx258-add-reset-gpio-patch-c438dd35f9cc
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: git@luigi311.com, pavel@ucw.cz, tomm.merciai@gmail.com, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Muzaffer Kadir <muzafferkadir@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787914322; l=3095;
 i=muzafferkadir@mainlining.org; s=20260816; h=from:subject:message-id;
 bh=K0S+hjXRamfbzSLaocvKAIe3EyDCb1YJZikydR5BEuc=;
 b=mjwp5RpdIhMaH1pNMCJ5xaW0CERNyBgRwYlJG2z3+TccO462CU5jd3zCCEWTr3EzakaORCNEx
 6IBnSq136srDLxgZiUy0s/fEBaI2XemBZih+Mkgl2SXHumI/QKC0ORB
X-Developer-Key: i=muzafferkadir@mainlining.org; a=ed25519;
 pk=4zkv4suQ3cYcO4Z7CrV8JSSjEGLBGepUtvQCFjgnYIU=
X-Endpoint-Received: by B4 Relay for muzafferkadir@mainlining.org/20260816
 with auth_id=954
X-Original-From: Muzaffer Kadir <muzafferkadir@mainlining.org>
Reply-To: muzafferkadir@mainlining.org

From: Muzaffer Kadir <muzafferkadir@mainlining.org>

reset-gpio is already documented in dt-bindings but never implemented
in the driver.
Reset deassert delay comes from Luis Garcia's and Ondrej Jirman's patch.

Link: https://lore.kernel.org/all/20240602201345.328737-22-git@luigi311.com
Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
---
I have a device that is not upstreamed yet (General Mobile Shamrock)
whose camera needs reset gpio to probe, it is documented for
dts check but not implemented for some reason.
With adding it rear camera on the device probes correctly.

I created this patch without knowing the older one that submitted
before: https://lore.kernel.org/all/20240602201345.328737-22-git@luigi311.com/

I don't fully know the correct reset timing so I was using a random wait before,
after I discovered existing patch I reused previous work for delay time after reset.
---
 drivers/media/i2c/imx258.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index bc9ee449a87c..af3f12c7452a 100644
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
@@ -1128,6 +1130,18 @@ static int imx258_power_on(struct device *dev)
 	if (ret) {
 		dev_err(dev, "failed to enable clock\n");
 		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
+		return ret;
+	}
+
+	if (imx258->reset_gpio) {
+		ret = gpiod_set_value_cansleep(imx258->reset_gpio, 0);
+		if (ret) {
+			dev_err(dev, "failed to deassert reset\n");
+			clk_disable_unprepare(imx258->clk);
+			regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
+			return ret;
+		}
+		usleep_range(400, 500);
 	}
 
 	return ret;
@@ -1138,6 +1152,7 @@ static int imx258_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx258 *imx258 = to_imx258(sd);
 
+	gpiod_set_value_cansleep(imx258->reset_gpio, 1);
 	clk_disable_unprepare(imx258->clk);
 	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
 
@@ -1382,6 +1397,11 @@ static int imx258_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	imx258->reset_gpio = devm_gpiod_get_optional(imx258->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(imx258->reset_gpio))
+		return dev_err_probe(imx258->dev, PTR_ERR(imx258->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
 	ret = imx258_get_regulators(imx258);
 	if (ret)
 		return dev_err_probe(imx258->dev, ret,

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260825-imx258-add-reset-gpio-patch-c438dd35f9cc

Best regards,
-- 
Muzaffer Kadir <muzafferkadir@mainlining.org>


