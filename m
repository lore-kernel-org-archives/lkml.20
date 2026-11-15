Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732242;
	b=SznjoqqpFbbtbxWYKy5XK7SxSC4+gCZQUYl4DmiuEwp3249AMD43JLv37Vie3ys9Vo1G
	 vMXi6AL2zryNcIO7dsesczQAc537WWeAjcmhr21gVriAUiItJzXRu3Pte/Rny2x0p25kj
	 CHO4FDBgtJNnPe8CT/+JbJnKludE2WJuCeekhZ7EWW+Zl+t9pRmGQeE6Ri+Xlf/mGbwlg
	 +5b6RgLpxrpfNcUpAUp807V/7agXsJvu5kJbrMQURw3ABa3uTDdbU7pD8F99L/AG3mrrA
	 BZZvg1lWbZ7kbbzkphdZyq1QHcOFMXIjelby4uFotTK/T/5AoYWsVWziHk1MQXwtC4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c8zL0xJ+Nrq3y09bK0+T/gH6VpxbNnLiMK3PaKQzs4A=;
	b=w7IAl1ZUWTjJF7D77aiX9PWr/0YgQ+fmd7AWvW8nxpnUhxEbuKDG9FrqEDgHAzh/EAV5
	 vQN3CZgaHSV7tWo0cTuiyJVMeekUw8KJ3/U4nGVcD7HnBUUwgSH9Vk5Tl4oTI6mvzICAR
	 l8Tn3YERKOQYqQxjwWC5Y8nyl0CwlvS1Kp8Lxhu1ABKijxjeyXQbWayD8SyaHOzsaYqOz
	 o4VrWMn7C/s/2Loa0EJULAVbUz+TQX3W489tne3sCIDroZDT1MutxWyuz72cIVpX+14lH
	 YHPx9lFPG0YY0MjHjf1lItRF3fVtGgNCzXlCPOL3an5YkPCH+0qH2/knm1IQAXM3A2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d06OyEq1;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFFD606A332
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBFFD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d06OyEq1
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so25876666b.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732240; x=1795337040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c8zL0xJ+Nrq3y09bK0+T/gH6VpxbNnLiMK3PaKQzs4A=;
        b=d06OyEq1BafG/SaUh3Z4vQtMBEUMcpXRhHIQakzBBfpa8heva1RzUmeenk76caOJ+h
         7ivY0YmHSc2XFnI4xEwpakiflqtvfOphy1Hnx3OAjCwQFO4TIuRGbRPAbtAHMgKVbZRS
         tbMyZd2h17Q1EgWZ+RgL+CoTqhZ497Utlj7ukpkgfVayDJvAdB5+gEv0roLXyBJC7+W2
         X3GaELUo7w0wdzVUNGQvsbAHu+YvaDPp5dISorpQKGLbmTtDYmPDwymt4KETB58J3XJd
         C+11ulTdhHpHaTnaOsVUN8C5DjJXDRhOMBEs5dE13PEjMvLNebG4ItoyEdsm2AAV/lUX
         vupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732240; x=1795337040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c8zL0xJ+Nrq3y09bK0+T/gH6VpxbNnLiMK3PaKQzs4A=;
        b=DF47YNTIJlEN8P0eK1VHXK9m/GgDX/AZbgVV8szOK7rkAo/IkKimy2jtqiK9kLXwd4
         lBRqYkjH4LIDzVyuKcTrcg4ODmcthewZVUf8FeSQ67L1MXfAvkj7PYnTdlfbn0ONecg3
         w4otM3/LFOWYI3svGqgcNX+06BpJi6PFMb35pBSFGWc+vTMrVJ4uioupAOxtkhgNxRsX
         Fssrz4rlwLGVTuIpkrw0VNQS9Wc6Kv94ebCnYfF3cJ2nv0F7eyX46QixQmrJZjh9X+is
         I7r9v1QM4taznK5rUFD4MY605f38xuEJCz6i02//xtOA2nyVZ1Uq5K4UpoYj6q9Lzy7E
         BYpA==
X-Forwarded-Encrypted: i=1; AL+hErH2sV1vbR+ivLFF9610+MyoG/cnd4o2ofOYNqjFzrTI9bNXwl9zsc3no50PP6wEJSvmEA/oPgR3nDaHP1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LIb2sxBTnjLdtsAsikFayKwXX2QzuxC8hLfY5hCNAxxJgNV6x
	lJwn7pTMINv4t5KgQsciG1KEu4LQSTUoVFeEW/17NPQLlPNCfzw31T3d
X-Gm-Gg: AYBFou0NbyoH3ShlKMzbJV1vHtZoZZQ2nRR+ZwuNF48V3rqTFkAzVzMTHL9vFAgOmso
	v2sGTioa7xV+1Gmat7xaKSqtDGzbJrqjnos8bClr7oExXWqR8WqgG/7VbOOlMXF2x3K17LYKmxW
	DQwcWdzgvm37zjfRLgi0+Zfo2LFg9l1iZqYhkxsekVifauIb84HjcNcrtOqJk6U9hetAtD7Ylly
	7an00oebsuMH/1l8gcH1IkdsPFxOdtceUxOg+AcNBFcDPZP2OhK+dgSUo2YPaZO16wscIQ+l7Wy
	x0aKFD0L/kkugN+rVSns4yGiRdgW9BngANR+neG9TQ8BKxogPCv8jK/GSbQCpAN8KJXZcNaHOIV
	wYlaZONjZ/9aRqatCGeBkVfF4iK7hJ1cOnhjKHjk+bThEAo5bGzbEVDyqI0Ya4KME3CIq/B/FhH
	AueHL71zLU1NGs9wFB3maG/CEbuVHzYlLWtFjgogMZjt6JaL7TBiQrpEMyTOo1U7Trs1Ju7mOzO
	Avmy8AXTI0Adetv01PGPg4CZQ3k4j5BJ8FC+3tcS5xbCx2qgaaf63H0t4am64TUd1UK6HDooGCE
	/AkV9+bXy9GeM3zmacmPK4sNb4Nvog8RhaqpjX3QObb87LmmRp5iNo0TN9Yd9DjvZ1StH+mWzV/
	x7JuzfW9hnA==
X-Received: by 2002:a17:907:c0f:b0:c4c:c62a:b9b3 with SMTP id a640c23a62f3a-c50963bda36mr622465166b.22.1794732240230;
        Sun, 15 Nov 2026 00:44:00 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b979e9sm288937866b.85.2026.11.15.00.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:43:59 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] leds: lm3533: Clean up probe and use managed helpers
Date: Sun, 15 Nov 2026 10:43:46 +0200
Message-ID: <20261115084347.70592-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115084347.70592-1-clamor95@gmail.com>
References: <20261115084347.70592-1-clamor95@gmail.com>
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

Clean up the lm3533 LED driver probe and remove routines by adopting
managed device helpers and modernizing error handling:

- Introduce a local `struct device *dev` variable to clean up repeated
  `&pdev->dev` references.
- Use `dev_err_probe()` for cleaner error handling on invalid IDs and
  LED class registration failures.
- Switch to `devm_led_classdev_register()` to automatically handle LED
  class device unregistration, removing the need for manual cleanup in
  error paths and the `remove` hook.
- Remove redundant `dev_dbg()` statements and cleanup unused cleanup
  labels.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/leds/leds-lm3533.c | 48 +++++++++++---------------------------
 1 file changed, 14 insertions(+), 34 deletions(-)

diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index d5997cbd88dfc..7db1105bee5c2 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -633,22 +633,19 @@ static int lm3533_led_setup(struct lm3533_led *led)
 
 static int lm3533_led_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct lm3533 *lm3533;
 	struct lm3533_led *led;
 	int ret;
 
-	dev_dbg(&pdev->dev, "%s\n", __func__);
-
-	lm3533 = dev_get_drvdata(pdev->dev.parent);
+	lm3533 = dev_get_drvdata(dev->parent);
 	if (!lm3533)
 		return -EINVAL;
 
-	if (pdev->id < 0 || pdev->id >= LM3533_LVCTRLBANK_COUNT) {
-		dev_err(&pdev->dev, "illegal LED id %d\n", pdev->id);
-		return -EINVAL;
-	}
+	if (pdev->id < 0 || pdev->id >= LM3533_LVCTRLBANK_COUNT)
+		return dev_err_probe(dev, -EINVAL, "Illegal LED id %d\n", pdev->id);
 
-	led = devm_kzalloc_obj(&pdev->dev, *led);
+	led = devm_kzalloc_obj(dev, *led);
 	if (!led)
 		return -ENOMEM;
 
@@ -662,14 +659,12 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	led->cdev.groups = lm3533_led_attribute_groups;
 	led->id = pdev->id;
 
-	led->cdev.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d",
-					pdev->name, led->id);
+	led->cdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s-%d", pdev->name, led->id);
 	if (!led->cdev.name)
 		return -ENOMEM;
 
 	led->cdev.default_trigger = "none";
-	device_property_read_string(&pdev->dev, "linux,default-trigger",
-				    &led->cdev.default_trigger);
+	device_property_read_string(dev, "linux,default-trigger", &led->cdev.default_trigger);
 
 	mutex_init(&led->mutex);
 
@@ -683,45 +678,30 @@ static int lm3533_led_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, led);
 
-	ret = led_classdev_register(&pdev->dev, &led->cdev);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register LED %d\n", pdev->id);
-		return ret;
-	}
+	ret = devm_led_classdev_register(dev, &led->cdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register LED %d\n", pdev->id);
 
 	led->cb.dev = led->cdev.dev;
 
-	device_property_read_u32(&pdev->dev, "led-max-microamp",
-				 &led->max_current);
+	device_property_read_u32(dev, "led-max-microamp", &led->max_current);
 	led->max_current = clamp(led->max_current, LM3533_MAX_CURRENT_MIN,
 				 LM3533_MAX_CURRENT_MAX);
 
-	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->pwm);
+	device_property_read_u32(dev, "ti,pwm-config-mask", &led->pwm);
 
 	ret = lm3533_led_setup(led);
 	if (ret)
-		goto err_deregister;
-
-	ret = lm3533_ctrlbank_enable(&led->cb);
-	if (ret)
-		goto err_deregister;
-
-	return 0;
-
-err_deregister:
-	led_classdev_unregister(&led->cdev);
+		return ret;
 
-	return ret;
+	return lm3533_ctrlbank_enable(&led->cb);
 }
 
 static void lm3533_led_remove(struct platform_device *pdev)
 {
 	struct lm3533_led *led = platform_get_drvdata(pdev);
 
-	dev_dbg(&pdev->dev, "%s\n", __func__);
-
 	lm3533_ctrlbank_disable(&led->cb);
-	led_classdev_unregister(&led->cdev);
 }
 
 static void lm3533_led_shutdown(struct platform_device *pdev)
-- 
2.53.0

