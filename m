Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1333D5C31
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627653; cv=none; b=BG3gF+rpeez2U3+SNyNtbiFzPSmZ9kQITMh2/QbOFz54CEr18xhCocARKuOxDDQ/nVVa3AoaP+ZUroKIgVka2b2MOz3wAM9koV9O96n/8eaY6DEuhD0a8Dip+pffgPmF9oeCnABUYOjMi4Y6FdzSbJwRL/zFFb1wLIvvN+twFEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627653; c=relaxed/simple;
	bh=MDg77Vnq8u03KI3oB6qoZm7xt/WwRUdAERRRJnOgjzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYSqX0bsNG5BmlSQoSif557FMb3VH1dsdPyAkHTLaTPMiiSAX4OUiRkVO/VQu/jRcE+yuAU4Ath7IMUU64TTlSGpJxeGrz2QYOkCgGF2co1ihUyjdXNMyBj4kPEoOJ2wIkeDECEj38pVFWd2sydwsenZMzOueI5uMPUshbaKJe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABugNpNy; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABugNpNy"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35903777bbcso16852eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791627650; x=1792232450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xuE7TEiZUlY3stwbxLZ96YrVlSM7HQb7YiNc8MwTzXw=;
        b=ABugNpNyAAhWB0mmhbdeHg864Z9Pb4QccTFnqrdd9Qlamj0UZdGCOuea/0m1VBTbE2
         dEK1Kt9weLNAr2YPDTKDgD8vQYyVOgwGut5JUkB+tZtvLFbohH7zt46XV/Lq/MB4DEbU
         0s24gMUpV6vxaHw+Yy8CWbl1/RJekgtIb2rhPcjJD51IBDuRBNKQSnsyuJQkbKUIP22p
         6AAGN3kWRzwhqingCSFPpWc57ZvON355SJaTQ3dTVML3a0dVOI3a1RbROI8/52ZmXx5B
         muaU8Ex6Bp/VQS7c3gFtlW4f1Jbixx8G/X+8srlGA7SRaCUnPQfs59WOIUVWqVRblgj9
         yFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791627650; x=1792232450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xuE7TEiZUlY3stwbxLZ96YrVlSM7HQb7YiNc8MwTzXw=;
        b=XQCQGNUjnuV3gnUhtJ5YicAagI/r8s/i465weq5w92lr0Vg7si/rAovEw3khHGAjOm
         +QOomx3renIr0GABGUrCZtfBAnSfM8Ezq0JW8xdOh9FYWXcUt+4y3XpzB/fhaXDxIkOT
         mthYz/DOZ8uzB6oFJovK5fXepq//h4fNCOBJitdecsIIcFhd1JV6SRv/aIKSoCsNnQev
         LP/LITW78f+2tQDKibmcArT5qymuFMffunUynt5K87PzC1tJ4AVO8ti824tFT9Jvfnhc
         obuJxEMPeCpGJNI+nOYmOLDb4ahlpI8qVnO8oLNpKDE8d2cEMujxVF2mRdFjmYbqvsDJ
         PhTA==
X-Forwarded-Encrypted: i=1; AKwUvBzrHLny9BqKSM9tVvMyEmZ5Ko8ZnElrCoAV5OhsZDQHLMHmOisQWxR8otBDYqjzrX2NYF5TLKhRYG14gtA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIY/ol5idqh/zSypV5MsNk/SEj5wekt9KLuhQw2op3o8el2ckVU
	7fugVqyWSP7AU9p7vmnEIroUOf27sHYijGUzAt4MqM1vGiXWdQFlOc2U
X-Gm-Gg: AYBFou2AfGlvJZxDUDTifmqOXQEJvLJ+8hffYU0kLLV10wvgDXosk4dZ6ThgCoozKte
	2CW9Pkuu39QtClSGoGGxsXnJ7O+0wLoPQJi+A84PUSubvz1nQ4x4yVwwf7x2x7Z//5MaQ3n4Kdc
	jQYmjoWC/XLg3QvbeNkXw7p/glV9HABorS7SgQPymC6ZGFKbJW+fjU750AsZqyyF4ZD4FP2khey
	sBKnpyRN8/RJb4Jpvumn2lPdlNeJQbEOZZIthHOThfCNdkWM+oSqw8FzbQgu46pMTU+pGyfJLYG
	JRXT4sYdzEYSClMjC98uvd8hw2RMb5x7ggAecpm61e14IRWCF4N0vXT2aqVggevwMttzH8xTaci
	Wc6ggwmXutEmZ/iiYfwbR+IpAqc+gLPL6D4BDJzv0oWVUcjXm9htWLvMGTF7pvA2MM5lu+Vo0pX
	AEBFTlG40dIvAAbD8tjhKOEyhjvdV4RQDt4OlECZ3lIqWm5OX0reEiyX362ACY/lLTFRn1DcGlr
	OLkbylNUyEfCX+BTymTdZ4oIEs=
X-Received: by 2002:a05:701b:42c2:10b0:146:85b9:970b with SMTP id a92af1059eb24-16a610c9bc8mr6864953c88.39.1791627650014;
        Sat, 10 Oct 2026 03:20:50 -0700 (PDT)
Received: from chitransh.. ([2401:4900:c920:95f0:d96a:36c9:8c1e:6661])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm12429714c88.19.2026.10.10.03.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:20:49 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: ilpo.jarvinen@linux.intel.com
Cc: hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v4 1/2] platform/x86: dell-uart-backlight: extract dell_uart_bl_init() from probe
Date: Sat, 10 Oct 2026 15:50:11 +0530
Message-ID: <20261010102012.110394-2-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010102012.110394-1-chitranshmandhaniya@gmail.com>
References: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
 <20261010102012.110394-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Move the UART backlight initialization sequence (get_version,
set_bl_power, get_brightness and backlight device registration) out of
dell_uart_bl_serdev_probe() into a new dell_uart_bl_init() helper.

No functional change. This is a preparatory refactor so that a
follow-up patch can inspect the return value of dell_uart_bl_init()
and take an alternative code path on failure.

Tested on OptiPlex AIO 7410 35W (01KP8D) and OptiPlex AIO 7420 35W
(0914RT) -- driver behaviour unchanged, backlight probes identically.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../platform/x86/dell/dell-uart-backlight.c   | 59 ++++++++++---------
 1 file changed, 32 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..e3b7f1beda5b 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -267,40 +267,19 @@ static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
 	.write_wakeup = serdev_device_write_wakeup,
 };
 
-static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
+static int dell_uart_bl_init(struct device *dev, struct dell_uart_backlight *dell_bl)
 {
 	u8 get_version[GET_CMD_LEN], resp[MAX_RESP_LEN];
 	struct backlight_properties props = {};
-	struct dell_uart_backlight *dell_bl;
-	struct device *dev = &serdev->dev;
 	int ret;
 
-	dell_bl = devm_kzalloc(dev, sizeof(*dell_bl), GFP_KERNEL);
-	if (!dell_bl)
-		return -ENOMEM;
-
-	mutex_init(&dell_bl->mutex);
-	init_waitqueue_head(&dell_bl->wait_queue);
-	dell_bl->dev = dev;
-
-	serdev_device_set_drvdata(serdev, dell_bl);
-	serdev_device_set_client_ops(serdev, &dell_uart_bl_serdev_ops);
-
-	ret = devm_serdev_device_open(dev, serdev);
-	if (ret)
-		return dev_err_probe(dev, ret, "opening UART device\n");
-
-	/* 9600 bps, no flow control, these are the default but set them to be sure */
-	serdev_device_set_baudrate(serdev, 9600);
-	serdev_device_set_flow_control(serdev, false);
-
 	get_version[0] = DELL_SOF(GET_CMD_LEN);
 	get_version[1] = CMD_GET_VERSION;
 	get_version[2] = dell_uart_checksum(get_version, 2);
 
 	ret = dell_uart_bl_command(dell_bl, get_version, GET_CMD_LEN, resp, MAX_RESP_LEN);
 	if (ret)
-		return dev_err_probe(dev, ret, "getting firmware version\n");
+		return ret;
 
 	dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + RESP_DATA);
 
@@ -318,13 +297,39 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 	props.max_brightness = DELL_BL_MAX_BRIGHTNESS;
 	props.power = dell_bl->power;
 
-	dell_bl->bl = devm_backlight_device_register(dev, "dell_uart_backlight",
-						     dev, dell_bl,
-						     &dell_uart_backlight_ops,
-						     &props);
+	dell_bl->bl = devm_backlight_device_register(dev, "dell_uart_backlight", dev, dell_bl,
+						     &dell_uart_backlight_ops, &props);
 	return PTR_ERR_OR_ZERO(dell_bl->bl);
 }
 
+static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
+{
+	struct dell_uart_backlight *dell_bl;
+	struct device *dev = &serdev->dev;
+	int ret;
+
+	dell_bl = devm_kzalloc(dev, sizeof(*dell_bl), GFP_KERNEL);
+	if (!dell_bl)
+		return -ENOMEM;
+
+	mutex_init(&dell_bl->mutex);
+	init_waitqueue_head(&dell_bl->wait_queue);
+	dell_bl->dev = dev;
+
+	serdev_device_set_drvdata(serdev, dell_bl);
+	serdev_device_set_client_ops(serdev, &dell_uart_bl_serdev_ops);
+
+	ret = devm_serdev_device_open(dev, serdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "opening UART device\n");
+
+	/* 9600 bps, no flow control, these are the default but set them to be sure */
+	serdev_device_set_baudrate(serdev, 9600);
+	serdev_device_set_flow_control(serdev, false);
+
+	return dell_uart_bl_init(dev, dell_bl);
+}
+
 static struct serdev_device_driver dell_uart_bl_serdev_driver = {
 	.probe = dell_uart_bl_serdev_probe,
 	.driver = {
-- 
2.43.0

