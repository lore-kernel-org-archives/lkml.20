Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBE53F413A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548840; cv=none; b=Z6xg0LwN3Q/jYg6r93xmPcokOZs2oGxNF/Kx+NRihaHb1eg+a3de1FoJSMZ3/RUiYqVUZzZE7CiK3Y+V72LJBvjtkQPeBr2wGbou8UuMS6IZfsiMcWX2I6bBjC3LqtFbqXOOdJdDDg8TjJhMWz8iQiqP1O7TLr//fbHcT9tuEgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548840; c=relaxed/simple;
	bh=MDg77Vnq8u03KI3oB6qoZm7xt/WwRUdAERRRJnOgjzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDQMr5Bq0tzUhswt7h+JJ/is0dnoEVOl0B0SlX9J15WODVY4Ajdp/MDeP3YhetLTm/349eoZbKPo1dWv270GQXnJWPjA0xlOythc7KtWUTUoTiEg3FQJOIXuTZnQ5WMmxQfc3+ZF/R8kf833MURNtuuZ/vN03eXdzFq3WqL/dcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIC3xoE+; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIC3xoE+"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab33730821so413947a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791548829; x=1792153629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xuE7TEiZUlY3stwbxLZ96YrVlSM7HQb7YiNc8MwTzXw=;
        b=BIC3xoE+2iqdqZj54ZKv+GUgeWtYQwNqiN+K8dpw8d8eoEap1mjTSxUu5CcMnvYBB2
         t+FnllE/SUxlUnStZ+S+2VsymvFJIfwSNO6dxPn8TXpzDq8zLOnIl3qEW7fz3F7vPSVz
         V74e6VGGlJdgtb9c87r3CK7GDrQQdX71XCcMOJX6mJ+AKXId5GEvdOHvqpqS5BiqGAdp
         S5yLRh83niw41Ykkh5Pi0H2TOvkpG8frv/Un6Vlx6gCnM9w74aAZr9Wukbo3eN0ALBqn
         SUpQaYNfmtbs3B2FISSCzxrxMq9nBfIXBwm28vZQheVDkPdTF6kYsbg8mhgOcaCKqHh0
         IFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548829; x=1792153629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xuE7TEiZUlY3stwbxLZ96YrVlSM7HQb7YiNc8MwTzXw=;
        b=DBMm1jDI3xUUWoCWjorXF+S8TpnCrJW17R7F71vgpbKelxD88m0JGObGoSAw4gpKXL
         d1eefeLjN9NqDd3pwGFLLCV7I+9vPLjgIT6Jg7eux22JUbxX7GJRWjiE/S5CgKI20BZw
         gu5fQmTEHUKQzXzD703E+SSyHAL5JnTP+izsxDTiVIvUfJ2id6/cSmDv43vbN9Pa6UKc
         pbUnZfTb/fFczpc8IVfATwwJfiuCi4feaatKdJQ9JkE1Dbhpr0AjmIAkLWJJfLH/f8m5
         7+TL8lAxAJ999Kf0cXZt4OTtnb5U6hu7NNYHeQKtufedtXM5YBQM1p7V77TH3DQ/pD8q
         rzhA==
X-Forwarded-Encrypted: i=1; AKwUvBxZEzdojsde1W01wCqNcIqZZkEvBHKfe1pfju3zvQXdbnlnwYfP6x/i8tw87aAIul3Lk2QidQ3VEs2ljmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9jeLLF/oTO0qjc0X9EAk6BHOT1wUMSJ4gFTKsetsKZmEzFYjo
	H5m/3aXv8YOoRUSzbFIE0UWJaCUg9sHT2HadBcR/HWGCivfhTf8ym0O2
X-Gm-Gg: AYBFou2xZdhOw16ZT3xkTmD4/xLSGKh8KGKEPfFi4XLYV/JycuTUXTJ7HaPNgSTSNi2
	a8KIu4xw+38XTuNYxWFUiN9Jx5RnkWTcpspZrHT44omF9VneVS99LdDnBGUk8P9xLtYz8V20+A3
	3OohW2WIyD7TXxq7sXTVvl4jxg2ucqK8+An06/kVbPEdRdRqC6wPVEs1ojKU24g6XW3cJdqnVC4
	Bo++rospbDi2yZSHtAQde+RWMpL0Q5rMyTV8fMRnzrVAHg0p5m+0hTasTjpT68I3/FyFtXQGs0e
	5LZu64X7WfdwE1TaGR/PTi7mzHPHHSRqdDmuDFEzjjwUEXCByVMiApooaMhRx8hp8SsZ1fIiRqw
	+uj/kIM/zsAGJ5KHyUkWIC63HlBjcrUSZxJs5pXu+93LhVU4HuTGPmX1O3SJGAJV8tyZ+iAccbJ
	Dis9uWX4CgHRiHDRy8KOADfAZ2w0j94NrxIRGZeOq5d9uyEJzxNGbxkeH3Uxkgcvk2kZH4eyY1e
	M0clmC7cFkOQJdvmPctiXZbWHI=
X-Received: by 2002:a17:90b:2e08:b0:3a7:ecab:c4c7 with SMTP id 98e67ed59e1d1-3ab3a748058mr1804986a91.34.1791548829483;
        Fri, 09 Oct 2026 05:27:09 -0700 (PDT)
Received: from chitransh.. ([2401:4900:9397:bb62:5cb7:971b:ead7:8dc5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f4737esm3426729a91.7.2026.10.09.05.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:27:09 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v3 1/2] platform/x86: dell-uart-backlight: extract dell_uart_bl_init() from probe
Date: Fri,  9 Oct 2026 17:56:01 +0530
Message-ID: <20261009122602.56624-2-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009122602.56624-1-chitranshmandhaniya@gmail.com>
References: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
 <20261009122602.56624-1-chitranshmandhaniya@gmail.com>
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

