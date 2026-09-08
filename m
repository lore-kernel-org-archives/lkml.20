Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749BD2475F7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845545; cv=none; b=UQBuOKVOft4MVDBW2p2POf6A+Ofw4IxBGFUk+5oyTNwJhGRGOf+wq3cXW57xKKuWH2V1R+CB2FEHuUr4+b+nXNj1NiRnm+4n7FBhXlXePDoG45NB8zobEvVby/Aed78/k+Ex0hQNXlvj8Lf49rAD9DXSR81D96x28KIxU3Nq1TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845545; c=relaxed/simple;
	bh=BUEFBi7BhLlZIE5vAE1BqHgeqpKUHbP6UUaZ/4gBUDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ic9QpAqujDsFSAmQfcWhvjwFLFTpdRCuXBhQw086JEcWupj0GxC4jF7xjBqSR219l3vjQ55l5DNA2iFj+E0scMEqCpUtVLGJrKoRjF7PZTGIsbQDpv0HTWdE5/bfAM6nJsxuMD2VYX1w2f1DXYw5Wn0KX9JjwkUOgC874I7VsxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaMXiA1K; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaMXiA1K"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d6so169002a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845544; x=1789450344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9F97joUpaeTJjnoK9hNmBns6HWtkcsHpFMF6nJgaGxc=;
        b=gaMXiA1K/OU3BC0VL9q8yH/UUcEZuCp/vC/4bKeHJlqfaMT7ftfQCFDbKZEpCYlHv1
         MXFpXRv0BwZeVKvAMvq8GtgtJx5lTkRqpkwup05n4C9ipML0y1duCxG8QYb5Nw4a3ID/
         uRY8u0r+PqD8Xhhpr7FJXkUXAYhL25Encj6Xk3TXorclY2jBTBDFLboTmyvnBJEgkvhV
         8oXInkR/li8DrF3HeMgpQodjFTX1JRTbKykTMT9qiSt21apbxCMN7lSJalp4dYNZmJbe
         1mA+Bf/i2cJyvKji6r6Kr8zR9kTKj8JxST6aWycIDiMdeev0psqRCFCqX28CNQHcCaOc
         HQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845544; x=1789450344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9F97joUpaeTJjnoK9hNmBns6HWtkcsHpFMF6nJgaGxc=;
        b=DSQHfePN65k+FcMLOEaDytajDRXjbKC7IiGuYHCIqgXFUrYFkdhkR/oRwI29nPLmBn
         gXifPa4RznNqVw1o5K5WDyLKltyLbuL2TeGiAle8/YKmoEhle9DWvh4YM6BR6p6lEDKV
         +h3Yqwz8gYaP+zGhROBCc6crhkS6ZnL5+3Y0tMg5GIM6QOZU9gV8uYE4CPoaMvQ09/av
         QTi++SW3+hc92MlTS/mGJkucYxKeLPP4Mp+AiL81AMJCmBnZi6nk0ZETm8qSbO+J+5pE
         RFViu0rcsoHVnads1iHfEmDtm6hYBP0Vszu1jCRvNcCNUENpKP364hduChYN/g5ftuye
         rvag==
X-Forwarded-Encrypted: i=1; AKwUvBzLOrLCKmCmbu5G2px4xmS1tyFiMs7nhwsZ+WgAlq/1xhOXzwLf6lneJuwBizTwng0mDNi6kYwmss0kY2k=@vger.kernel.org
X-Gm-Message-State: AFuF++lw9wsXAtn8Il15IYxF3H3y3C7THip8H5o+0j3jVPoxs+e+8fYJ
	mmgEdtzTYlUY09RZhMN9bCMPHH19Mp7fCf3h3kpkOS5JlMmRG+klCaxD
X-Gm-Gg: AYBFou3HdxpyAeQkJwv6TDTCbF//iiekqezoq51PRlof/aJ7+FXWuuOtRvpfpmfZVa4
	1nM67dDcho+WfwhBhYs/XnTZQ/2ohCv3Nt+5fZD6ngWcmzjagjEGqrS8RimaBRmnkuAGnkmcvoP
	cE7bpAuN+ua/Q2gtxZYqFZoEikD6g5SARpl02aWV631Xs4ekH0uf/1RL5C4jWReS2Fm18hhuIAl
	pwpxD2PKU6HgcCJWWMmpCVaOk6EGjoNlJowLDVNkQfKcFXKqRL5NxjAFrkG1QmkuX2fxjmkJtwY
	EgQyNna/MKV5oDcirviZWjHkGpkRGtjoJYo9uzy+ELKv2Wck0237TOvUR7xDfS8kiidtg+UrmYo
	DWXac/KAoJpxbV9N3RukwC7VyssgMB/nqd3dMKMzTJKMCtxDN8vlnZIUOkMousiAIxwxzmQ+NFs
	o99MwJlyj1f2Y+3fNOPIdTnsURoS291f+YKJZa+T7j633uUgEwamBy+T/5AlX+eCPMkBS2GzcH7
	twS/kDhX35+YN6OER+bjdKqoT/PDZHHUVhS17Hxw9aXhg6GMSsp/jtFqSGHnFeDBgSe8nU2GgzK
	wDinqC7SGxPQhBD8YaQpzO5pmjoAsQy5vc3dQg==
X-Received: by 2002:a05:6a21:3204:b0:3d3:ad6e:9cdd with SMTP id adf61e73a8af0-3da9d98ddd3mr4188414637.11.1788845543542;
        Mon, 07 Sep 2026 22:32:23 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4554a312dsm5041424a12.29.2026.09.07.22.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:32:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] leds: rgb: qcom-lpg: Use fwnode APIs for LED parsing
Date: Mon,  7 Sep 2026 22:32:21 -0700
Message-ID: <20260908053221.29955-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert LED and channel parsing in lpg_add_led() and
lpg_parse_channel() from DT-specific helpers to the fwnode API.
The probe loop now uses device_for_each_child_node_scoped(),
dropping explicit node lifetime handling.

Behaviour is unchanged for device tree: fwnode_get_child_node_count()
and both child iteration helpers skip unavailable children on OF,
and the fwnode handle is passed straight to LED registration.

cdev->default_trigger is only assigned when
fwnode_property_read_string() succeeds, so an absent
linux,default-trigger property no longer yields an uninitialized
pointer.

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 36 ++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index d7d6518de30f..dcc8e6f14c8b 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -11,6 +11,7 @@
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/pwm.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -1342,7 +1343,7 @@ static int lpg_add_pwm(struct lpg *lpg)
 	return ret;
 }
 
-static int lpg_parse_channel(struct lpg *lpg, struct device_node *np,
+static int lpg_parse_channel(struct lpg *lpg, struct fwnode_handle *fw,
 			     struct lpg_channel **channel)
 {
 	struct lpg_channel *chan;
@@ -1350,17 +1351,18 @@ static int lpg_parse_channel(struct lpg *lpg, struct device_node *np,
 	u32 reg;
 	int ret;
 
-	ret = of_property_read_u32(np, "reg", &reg);
+	ret = fwnode_property_read_u32(fw, "reg", &reg);
 	if (ret || !reg || reg > lpg->num_channels)
-		return dev_err_probe(lpg->dev, -EINVAL, "invalid \"reg\" of %pOFn\n", np);
+		return dev_err_probe(lpg->dev, -EINVAL,
+				     "invalid \"reg\" of %s\n", fwnode_get_name(fw));
 
 	chan = &lpg->channels[reg - 1];
 	chan->in_use = true;
 
-	ret = of_property_read_u32(np, "color", &color);
+	ret = fwnode_property_read_u32(fw, "color", &color);
 	if (ret < 0 && ret != -EINVAL)
 		return dev_err_probe(lpg->dev, ret,
-				     "failed to parse \"color\" of %pOF\n", np);
+				     "failed to parse \"color\" of %s\n", fwnode_get_name(fw));
 
 	chan->color = color;
 
@@ -1369,25 +1371,26 @@ static int lpg_parse_channel(struct lpg *lpg, struct device_node *np,
 	return 0;
 }
 
-static int lpg_add_led(struct lpg *lpg, struct device_node *np)
+static int lpg_add_led(struct lpg *lpg, struct fwnode_handle *fw)
 {
 	struct led_init_data init_data = {};
 	struct led_classdev *cdev;
 	struct mc_subled *info;
 	struct lpg_led *led;
+	const char *trigger;
 	const char *state;
 	int num_channels;
 	u32 color = 0;
 	int ret;
 	int i;
 
-	ret = of_property_read_u32(np, "color", &color);
+	ret = fwnode_property_read_u32(fw, "color", &color);
 	if (ret < 0 && ret != -EINVAL)
 		return dev_err_probe(lpg->dev, ret,
-			      "failed to parse \"color\" of %pOF\n", np);
+			      "failed to parse \"color\" of %s\n", fwnode_get_name(fw));
 
 	if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
-		num_channels = of_get_available_child_count(np);
+		num_channels = fwnode_get_child_node_count(fw);
 	else
 		num_channels = 1;
 
@@ -1403,7 +1406,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 		if (!info)
 			return -ENOMEM;
 		i = 0;
-		for_each_available_child_of_node_scoped(np, child) {
+		fwnode_for_each_available_child_node_scoped(fw, child) {
 			ret = lpg_parse_channel(lpg, child, &led->channels[i]);
 			if (ret < 0)
 				return ret;
@@ -1426,7 +1429,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 			cdev->pattern_clear = lpg_pattern_mc_clear;
 		}
 	} else {
-		ret = lpg_parse_channel(lpg, np, &led->channels[0]);
+		ret = lpg_parse_channel(lpg, fw, &led->channels[0]);
 		if (ret < 0)
 			return ret;
 
@@ -1441,14 +1444,15 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 		}
 	}
 
-	cdev->default_trigger = of_get_property(np, "linux,default-trigger", NULL);
+	if (!fwnode_property_read_string(fw, "linux,default-trigger", &trigger))
+		cdev->default_trigger = trigger;
 
 	if (lpg->lpg_chan_sdam)
 		cdev->max_brightness = PPG_MAX_LED_BRIGHTNESS;
 	else
 		cdev->max_brightness = LPG_RESOLUTION_9BIT - 1;
 
-	if (!of_property_read_string(np, "default-state", &state) &&
+	if (!fwnode_property_read_string(fw, "default-state", &state) &&
 	    !strcmp(state, "on"))
 		cdev->brightness = cdev->max_brightness;
 	else
@@ -1456,7 +1460,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 
 	cdev->brightness_set_blocking(cdev, cdev->brightness);
 
-	init_data.fwnode = of_fwnode_handle(np);
+	init_data.fwnode = fw;
 
 	if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
 		ret = devm_led_classdev_multicolor_register_ext(lpg->dev, &led->mcdev, &init_data);
@@ -1638,8 +1642,8 @@ static int lpg_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	for_each_available_child_of_node_scoped(pdev->dev.of_node, np) {
-		ret = lpg_add_led(lpg, np);
+	device_for_each_child_node_scoped(&pdev->dev, child) {
+		ret = lpg_add_led(lpg, child);
 		if (ret)
 			return ret;
 	}
-- 
2.55.0

