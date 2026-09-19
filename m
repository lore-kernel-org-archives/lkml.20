Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5663A375AC6
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789789741; cv=none; b=EO+JqFf3/sL/TGClKDX8UoE+kZgwCfUXicxLbR2Ka/4U2IPLLpbySMAvfnY0KUEtB8nJZ4Woqge0tldv5cFk6metX5in9whXLvDjsmPHJrUQXMm527EQP/95EPak4Xgt75dJBaRucONZDX8gdX6cg4+NXsyRqlhV9Fenk9xXMjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789789741; c=relaxed/simple;
	bh=JBH8MDzcvvi+r6wI/Z2Cm5FBUNLcs91Aeym16RYKnHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKJtjVqFs45Jmw72arelBYgcLgjBFj/D2EqEObNKkGAB4ap0JMqUIgvzSBexrxfP4tqaCWKX4DZwGtqJO/QHVAHOFtyNq6JcYp9o8hTvUOjAeoeu/ZAcS7RVijAa3svvVm5zgzK1ksQtQw/BxTR+q/qZZpfMdEQFV7rOpSGrNZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJGjynhy; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJGjynhy"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b43b20bso9996335ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789789739; x=1790394539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8FXnxErYEXBEufif2ljGTGmGGFij1tLBBaVqaNV1c4=;
        b=XJGjynhyTEc2+QbojZagyYjnGNpxLAFC1XH9sdD9gbU/lab9soFXB7I+65e4UkY9SL
         HJBXzm3fNm4zg5AYQlCs9M9iEGPmavpuIcHDNfk5EQKptYVrazqfBb8ia8Z113OsUf81
         z/S8QblAIaqxOt+c3nqUBmGcfPo2o3mlqEOElpN2XQJNvnWg/++Uk42aAFRSOwUHv7IC
         1cZNsAtYNP6/B9gLhpktdG5csGvKpwshLJkopUd0oUivE94jEdA7f6Tx+nZEjf3Q1onU
         TSpksozU7srtwOQUTQ2DjQ0ycNkuVXOrMXrKKDvqplzQnGdL8/YsyvKuoHcuevYfeFGI
         77Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789789739; x=1790394539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m8FXnxErYEXBEufif2ljGTGmGGFij1tLBBaVqaNV1c4=;
        b=wPITPreuh5qveG8aDQ5IRUHTOip2P36kHu4ioIGWCEV+AgIYnhzk0PS7I+9eSn7C3k
         bKY69Za/0Dd2wh+hrnFYRhZNmt/WUL1C2bqCedzEJmpE4HWdpYhPHSCxuABGT9Cnk/+e
         roFxPXbIxJzB/CZJYIbWw2ZyUUDakxWtHz4cW1cabO5G/3HECvC88cGGQQrtyfBW0Zf8
         RehTTvvwLbFQA3zBbYKLI0eTEnMjT322GDMJU54FKv144pMJ3e0sC8FJjYtoJf/0VPlU
         tSrrEJAxEj2t5Ou69E3pvxH8TrieLZNdHJ2Ih3mAD8qeZZp8m5ZSY4nqyUhotqQ4/XGx
         n0Lg==
X-Forwarded-Encrypted: i=1; AKwUvBxOoiwiWSu7fUkkO3SuOF+Eyns3w7PzWC9aYftKoeGH0OBvjIeic6FsEJCdKYAN3m6Q7OU4+1V+VYqFhrM=@vger.kernel.org
X-Gm-Message-State: AFuF++knah0WYt+QLr+jugxG7QGFulyyDU+VeXTK6EOIDErXik63zcA9
	pqqwyAfRowx7muyaGtqiMQ0sc2a9Bfcxr/nG5YJDCRt1aBnxLbC0bjo=
X-Gm-Gg: AYBFou31oIs7nlvNtImuZWN6PCAeg1zoYGWWBw3HPIWd8CCDIRxCl45b2Yb3MHkfJrH
	c74BMaE5sISCMJZ/daRW5VLx4AyNpRfamed6RqYAZYzO0WlYgCtU0u39jGXdVGfTQn2ucLPyexl
	e2fEv7yZGc9g2xwvanI2IpJ0EQsQ/SUhHksSdVSWdZJoyEt/rVvQj48PrvnhYtxQREMIKc1ku4L
	iucrghZJPUWvnlzcUYjwmqn96ZoAsqxmFvVW4SI/oomDQaL0OqOXp2SOv7gnFve4kA8LAuAeNru
	r6R63NmH6AFkL35Yej9W5dTsUaStVJsHn5IvEU0pskTw1A+3GR7j1Kpd63PSNBeN95+7qKPpetV
	VFlZ1IAanFHe0gMrbjoNmToJeII5SpTOBaoNOYbTDSg64H9ZIk0hPZbFjOw6oYiCNmC7A7R/vMJ
	JmFihqlcbTg3ksH/JpjxCDnjWRou7Z9vY6NJr2sRjZ0aZvr2cJtubSgS8J57ybcvrMysS+1z4U3
	pOUPx2cIzNO2yFIgmLjXFAcjdis1ThYG6ygJOaL916gRIuQQ9hGncv00QlkFFRnZyAk4ZTo/nZj
	WOE=
X-Received: by 2002:a17:90b:574f:b0:39e:6a81:f34f with SMTP id 98e67ed59e1d1-39e6a81fd3cmr3118804a91.41.1789789739453;
        Fri, 18 Sep 2026 20:48:59 -0700 (PDT)
Received: from codespaces-2db70c.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c4ba12csm2305479a91.11.2026.09.18.20.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 20:48:59 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH 1/2] firmware: raspberrypi: Handle device registration errors
Date: Sat, 19 Sep 2026 03:48:39 +0000
Message-ID: <20260919034840.28593-2-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919034840.28593-1-triet.hoang.dev@gmail.com>
References: <20260919034840.28593-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the return value of platform_device_register_data() when
registering the hwmon and clock devices. Propagate registration failures
to the firmware probe instead of silently ignoring them.

Use local platform device pointers so the global pointers are only
updated after successful registration. If clock registration fails,
unregister the previously registered hwmon device before releasing the
firmware instance.

Keep the existing behavior of skipping hwmon registration when the
RPI_FIRMWARE_GET_THROTTLED request fails.

Fixes: 70eea1bbb556 ("firmware: raspberrypi: Register hwmon driver")
Fixes: 91f2cf4a6b21 ("firmware: raspberrypi: register clk device")
Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/firmware/raspberrypi.c | 57 ++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 0aa322e9a2e7..88c3de9ce67a 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -197,22 +197,31 @@ rpi_firmware_print_firmware_revision(struct rpi_firmware *fw)
 	dev_info(fw->cl.dev, "Attached to firmware from %ptT\n", &date_and_time);
 }
 
-static void
+static int
 rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
 {
+	struct platform_device *pdev;
 	u32 packet;
-	int ret = rpi_firmware_property(fw, RPI_FIRMWARE_GET_THROTTLED,
-					&packet, sizeof(packet));
+	int ret;
 
+	ret = rpi_firmware_property(fw, RPI_FIRMWARE_GET_THROTTLED,
+				    &packet, sizeof(packet));
 	if (ret)
-		return;
+		return 0;
+
+	pdev = platform_device_register_data(dev, "raspberrypi-hwmon",
+					     -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
 
-	rpi_hwmon = platform_device_register_data(dev, "raspberrypi-hwmon",
-						  -1, NULL, 0);
+	rpi_hwmon = pdev;
+
+	return 0;
 }
 
-static void rpi_register_clk_driver(struct device *dev)
+static int rpi_register_clk_driver(struct device *dev)
 {
+	struct platform_device *pdev;
 	struct device_node *firmware;
 
 	/*
@@ -224,11 +233,17 @@ static void rpi_register_clk_driver(struct device *dev)
 					   "raspberrypi,firmware-clocks");
 	if (firmware) {
 		of_node_put(firmware);
-		return;
+		return 0;
 	}
 
-	rpi_clk = platform_device_register_data(dev, "raspberrypi-clk",
-						-1, NULL, 0);
+	pdev = platform_device_register_data(dev, "raspberrypi-clk",
+					     -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	rpi_clk = pdev;
+
+	return 0;
 }
 
 unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int id)
@@ -277,6 +292,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpi_firmware *fw;
+	int ret;
 
 	/*
 	 * Memory will be freed by rpi_firmware_delete() once all users have
@@ -292,7 +308,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 
 	fw->chan = mbox_request_channel(&fw->cl, 0);
 	if (IS_ERR(fw->chan)) {
-		int ret = PTR_ERR(fw->chan);
+		ret = PTR_ERR(fw->chan);
 		kfree(fw);
 		return dev_err_probe(dev, ret, "Failed to get mbox channel\n");
 	}
@@ -303,10 +319,25 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, fw);
 
 	rpi_firmware_print_firmware_revision(fw);
-	rpi_register_hwmon_driver(dev, fw);
-	rpi_register_clk_driver(dev);
+
+	ret = rpi_register_hwmon_driver(dev, fw);
+	if (ret)
+		goto err_put_fw;
+
+	ret = rpi_register_clk_driver(dev);
+	if (ret)
+		goto err_unregister_hwmon;
 
 	return 0;
+
+err_unregister_hwmon:
+	platform_device_unregister(rpi_hwmon);
+	rpi_hwmon = NULL;
+err_put_fw:
+	platform_set_drvdata(pdev, NULL);
+	rpi_firmware_put(fw);
+
+	return ret;
 }
 
 static void rpi_firmware_shutdown(struct platform_device *pdev)
-- 
2.53.0

