Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD1541D207
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791954818; cv=none; b=BKkZmCkO12GG34r9T78/bqk/918h7rcHptsRuAftRl2PhxOqVC9zL+uJK1PFuC9Wmk9tCeB5r/QtwPYc84ATFcyKJxwENo/AS2jUqTrR78DJMEa7q+kM74yhjMY6yvx4uf/+cGhhmysAZf3soLgGe8QndeswHNNiBqJJ+c1bSvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791954818; c=relaxed/simple;
	bh=MQqoQaB1FyoyMJ+K6yDem6WMrchPow1EhO4d1DLyKj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=shPIgwg1c6L56kR1L8BNng88SqkGRqNhhWJ4mqon0XzpNyXDLsZexNBVxag5ssEuCUv4Z1dJienZNO/tdFQi3VNQ4ctl1lcRgBrMPm9Rbkfi7jSnOhc709uXasmd9vVWbOel8Ao9pxL16d79hsBui1I10cz15vcwJgZ2AYqvmvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aznMqGAa; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aznMqGAa"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so4120729eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791954816; x=1792559616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDi1ZUpchAKrAeynCZ008rcYzeK/yq/xfHew59IB4Z8=;
        b=aznMqGAabPfsZK8qdbwxW614EkmctvdX4zNWe1xKXsU5mpn8aBpnNi3k2ggtJ2w36U
         OV9fkrbXv1E2ltrpbJlmHJ6lPX09Y5c2mIMFn56NVEIGKDaOeo3BbSs5ipkeXSkyFxm1
         10djiTOzIVJiFBJp6FYrBTJC2zCJ1I+C/aNnzIpPmriDXyZe2QjTEx/T2fXu3VV904e0
         R4HAyy3FE76AVNY/EAzVWck3ft8emOxtHR3HTesH/mdLVRAvnzK6qpk//GD+3jemT0VN
         P06b8ogTrBJQWwIcG4f1iYegL0w7zi3NaEyfWYR/ZrrzntZl6XUTDTrnSuQtf0mRXNQH
         vrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791954816; x=1792559616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDi1ZUpchAKrAeynCZ008rcYzeK/yq/xfHew59IB4Z8=;
        b=YrvQHxMQ0RuhXTwF75LbIm5vifX0/6jkilPgbeLMzTLx6TnkTzUburnV1sioLdYEpR
         pFbaHzRbIaiSyhCOx2hGxSKJE/qhRxa5QK+z/1T0mUeqJLbytLYy7ed57iMVNWozZ41P
         Xo/FI4pFgM2yXACxs+LQLBsg3hWD0YJ8jvDf3FnBZG6qbJLr1fhkRp8zD3/bObXlHPcg
         /fjC8P6bjR8NOB3W8P3Pyct6QgYW9Ugtj0kQMl5TMWjyFoCfsYf7V6+gE+AVGTEr4QGv
         cae+1JFKVbLp+aLblXJ0CZK4VEInuIrPXzKm+ODbn2oYecgJGjEx3TKBj+mP/suCihWj
         IvmA==
X-Forwarded-Encrypted: i=1; AKwUvBwYBFKQDZsZHwcdmLbMKQ3xvJs0FCJitnj1gnIZ4CfG1q2GDQKCl+H+k9jnxdqsmj+1llyDEmzgluxfdvw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKudRhHahC6AKpsFmbw5CrOgEOH5gfI6hHcEztQ60MD/6bGZUlP
	a3ztdDZ70bnkiOjWTEASlf/d1ozkHIWE2yoqP+nRZZQ0WLb/v3LoLhJB
X-Gm-Gg: AYBFou075FP4FEEQlQE6DOsm7gQvHbnRnnpz1nIyoL3VMw7vYrly0JNr8QuNBQVnTym
	B/XaUr60QIa0mDzqmew2V0Eu/SCEMdow1ib7d0Kvg6R6Ky5uTYkqt/TLqL8UHZYahwwv+mlgp78
	2qGumnViZP5QLnpuWQucuP+q4oncx5tUdZyUW3TuiW2L30Aiy4fYlmbrUuLSsuYljzDbBviqc+E
	4xMMa+2r/FHxtGl0Yfh3Hr++K9PY1X2rjFhEs8eAZHLIp4S0CeI3PhEQZA+FglnjD29xyq2F7vI
	+UfRIHHQssmo+QaMaycEsVuAzkjo9HsG0PfG/HX259RZs8O9e+ekIKwH67lsnMqlpfac/OxN96K
	/mByCMD24dvh7D2uI4YJC65BnGX3XAjsfywhUK23gYDjv2t2Qceed2J3Y8WmcVvMA9LbV9di9dV
	1Z4akSglZgXyAPBjeLQphPaDqPgh/+3YbTubKi3odBeF+8HFgqPCGwfrV1qTHR/m3OMkB1EhKFM
	rp6D4XCyqR/T2CTatr9zvttPu3Wvnuu1PlqyESyeoyef4VAslCTifrUN8P8kOI=
X-Received: by 2002:a05:7300:2216:b0:351:28d9:4908 with SMTP id 5a478bee46e88-3537db99e8amr27762456eec.0.1791954816356;
        Tue, 13 Oct 2026 22:13:36 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:875a:117f:b9ea:5a08])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm51629125eec.21.2026.10.13.22.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 22:13:35 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Michael Zaidman <michael.zaidman@gmail.com>,
	Rishi Gupta <gupt21@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	David Barksdale <dbarksdale@uplogix.com>,
	Andrej Shadura <andrew@shadura.me>,
	Johannes Roith <johannes@gnu-linux.rocks>,
	linux-input@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] HID: Use hidraw_instance() in drivers
Date: Tue, 13 Oct 2026 22:13:23 -0700
Message-ID: <20261014051326.3784498-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261014051326.3784498-1-dmitry.torokhov@gmail.com>
References: <20261014051326.3784498-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of directly dereferencing struct hidraw to inspect minor device
numbers, use hidraw_instance(). This removes the dependency of these
drivers on the internal struct hidraw layout.

For hid-cp2112, fall back to dev_name() when hidraw is not available.
For hid-led and hid-u2fzero, require CONFIG_HIDRAW and propagate errors
if hidraw is unavailable.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/Kconfig       |  3 +++
 drivers/hid/hid-cp2112.c  | 13 ++++++++-----
 drivers/hid/hid-led.c     |  8 ++++++--
 drivers/hid/hid-u2fzero.c |  8 ++++++--
 4 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index f9bcaeb66385..1d2657edab27 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -587,6 +587,7 @@ config HID_LCPOWER
 
 config HID_LED
 	tristate "Simple RGB LED support"
+	depends on HIDRAW
 	depends on LEDS_CLASS
 	help
 	Support for simple RGB LED devices. Currently supported are:
@@ -1252,6 +1253,7 @@ config HID_TOPRE
 
 config HID_THINGM
 	tristate "ThingM blink(1) USB RGB LED"
+	depends on HIDRAW
 	depends on LEDS_CLASS
 	select HID_LED
 	help
@@ -1285,6 +1287,7 @@ config HID_UDRAW_PS3
 config HID_U2FZERO
 	tristate "U2F Zero LED and RNG support"
 	depends on USB_HID
+	depends on HIDRAW
 	depends on LEDS_CLASS
 	depends on HW_RANDOM
 	help
diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 04379db93571..148946b04bff 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -1225,7 +1225,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	struct gpio_irq_chip *girq;
 	struct i2c_timings timings;
 	u32 addr;
-	int ret;
+	int ret, instance;
 
 	dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
@@ -1330,9 +1330,13 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	dev->adap.algo		= &smbus_algorithm;
 	dev->adap.algo_data	= dev;
 	dev->adap.dev.parent	= &hdev->dev;
-	snprintf(dev->adap.name, sizeof(dev->adap.name),
-		 "CP2112 SMBus Bridge on hidraw%d",
-		 ((struct hidraw *)hdev->hidraw)->minor);
+	instance = hidraw_instance(hdev);
+	if (instance >= 0)
+		snprintf(dev->adap.name, sizeof(dev->adap.name),
+			 "CP2112 SMBus Bridge on hidraw%d", instance);
+	else
+		snprintf(dev->adap.name, sizeof(dev->adap.name),
+			 "CP2112 SMBus Bridge on %s", dev_name(&hdev->dev));
 	dev->hwversion = buf[2];
 	init_waitqueue_head(&dev->wait);
 
@@ -1494,4 +1498,3 @@ module_hid_driver(cp2112_driver);
 MODULE_DESCRIPTION("Silicon Labs HID USB to SMBus master bridge");
 MODULE_AUTHOR("David Barksdale <dbarksdale@uplogix.com>");
 MODULE_LICENSE("GPL");
-
diff --git a/drivers/hid/hid-led.c b/drivers/hid/hid-led.c
index 7d82f8d426bb..63fd723d9e69 100644
--- a/drivers/hid/hid-led.c
+++ b/drivers/hid/hid-led.c
@@ -448,7 +448,7 @@ static int hidled_init_rgb(struct hidled_rgb *rgb, unsigned int minor)
 static int hidled_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct hidled_device *ldev;
-	unsigned int minor;
+	int minor;
 	int ret, i;
 
 	ldev = devm_kzalloc(&hdev->dev, sizeof(*ldev), GFP_KERNEL);
@@ -488,7 +488,11 @@ static int hidled_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret)
 		return ret;
 
-	minor = ((struct hidraw *) hdev->hidraw)->minor;
+	minor = hidraw_instance(hdev);
+	if (minor < 0) {
+		hid_hw_stop(hdev);
+		return minor;
+	}
 
 	for (i = 0; i < ldev->config->num_leds; i++) {
 		ldev->rgb[i].ldev = ldev;
diff --git a/drivers/hid/hid-u2fzero.c b/drivers/hid/hid-u2fzero.c
index 82404b6e2d25..83e223c12cd6 100644
--- a/drivers/hid/hid-u2fzero.c
+++ b/drivers/hid/hid-u2fzero.c
@@ -307,7 +307,7 @@ static int u2fzero_probe(struct hid_device *hdev,
 			 const struct hid_device_id *id)
 {
 	struct u2fzero_device *dev;
-	unsigned int minor;
+	int minor;
 	int ret;
 
 	if (!hid_is_usb(hdev))
@@ -347,7 +347,11 @@ static int u2fzero_probe(struct hid_device *hdev,
 
 	dev->present = true;
 
-	minor = ((struct hidraw *) hdev->hidraw)->minor;
+	minor = hidraw_instance(hdev);
+	if (minor < 0) {
+		ret = minor;
+		goto err_free_urb;
+	}
 
 	ret = u2fzero_init_led(dev, minor);
 	if (ret)
-- 
2.56.0.385.gd3acb90ef8-goog
