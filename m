Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C42F346774
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789270921; cv=none; b=MWdOrXSuwjJq2rr1sdYfnlOzJPEBQlOG8wUTueqEAYBtvr/GYhp+yyYwGB0Ce8ftcHKqGOnZEaxAgXewiyJ28aMZbMqYsZKVmIjc9mrbwMhC+ZYWYaKXiFnSnCc0WvefDg1L2FJ/EJLBg1aW7bln8f+N3tzQrx86mORnyFw9I1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789270921; c=relaxed/simple;
	bh=MQi0CJ/fz7tg5s+eLvlNcw0LS2EBxH9xVWjWGdQ246o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lzWIpS7Bo7iw8TbLonlqclH+57WI7tuM6HHI7M5AO0un0HMN9ggGLJXKodeHhQR6C9VflEUpAJPbqdbmtFvDSkyugr1GVhT7TYRT7Vy6JXFgt/eJsfig4tyk67ZkntSy5BE64mUW7/TKrTCiJ4mFvucxwmaZZjPJldg5YTQeDx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDF799cq; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDF799cq"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939ca12ab70so133758785a.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789270918; x=1789875718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJp5ud/myTFefNhCI2ZzWiRr2kbld/3n70B98OUzWtQ=;
        b=kDF799cqAa+MUyHN0lyY+sVQ6Bd/JIgTBMz0jogn9Ri+HGcyixWki6ER/ebPBggcV6
         jKWEtI3GRn2ng1byPwX9IhHpLv8CdzUsskW06GNZDVTu7NujZsvyfJBI8sXy4z8GfSsa
         zfhYAFgeewf14W0dSe876eKi4/5FIyNKOuPqa6/fGJ4AXTPKejwKe689DZ7YzRuJhpgF
         kgKrI1A9QW38gZSga+79dLl2jMLPsbSfS1EbjsjIIPmHO5EoTgo4s06gWCuILvJoullR
         WsdJFCvyJVM3Qxqs80+7gWdxqSw2O1N7kfEj4JkiyqSdND2JSsjwJTjprpuB24G5l8zA
         njOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789270918; x=1789875718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJp5ud/myTFefNhCI2ZzWiRr2kbld/3n70B98OUzWtQ=;
        b=Ct7I+MBv+dLibUbne0BxFV3u6QtlmvC/bfdHk+RcvU8LfPclSf8x9QR+6rT+2LImmZ
         uZclECE1drt6QusDanGkB9rYDkF6fOExlrA5XYpIi42ihP+5meytj7YtP/EpNs9HJBmI
         Y+bPqTVIVscHTsAaBc09c44X8Yj8TbdhnFCZ5IFDwyllbTyP9054iW2kCMzJVLVAn/Tq
         77Z/iSWBjnKi3pREMznzVPa9o9wRx9gK1Oip+AEbap6xTNxKwfxVN/oBsjBpUkw0eVrA
         FvzKkWCUKXN5ZUlKBVvyHmlYyeifwyDx5AkNAk1KHIArh1YB5Ub8IgO01WS6/Yuf0mn+
         +j+g==
X-Forwarded-Encrypted: i=1; AKwUvBwpUE8tei19OwIxFVdWPaoUdlZcirUm0fTsTVzVUK5Tm/+iz1NNXkVP5AFvg0P3zd2Mru9gfNh0TAR2KHw=@vger.kernel.org
X-Gm-Message-State: AFuF++ksoc1k0/zTxm5CaxtX4wVjwWrTN8VmHPLwQ5OjoOh7PrYn4okK
	XC+Q/TTlWNuYudBeAVZK7tqk81i0EhEceY6Xvc54I/8xht5JoBw6mog=
X-Gm-Gg: AYBFou3+ce+B78oxWBA0+2EeAKVwk4RMqeiC9TNvevHX68pBuAKuJy8Qd4LyTYoH53r
	C/6ESRFnvO3L9Vzha3FAVJBUzkwf5UH6+y25qLDvRKehyctBvxF2zwvacVWYP9RUBqllo60EYQm
	0PLJm+QdzrDJkaTNhbN8f0d9+PmwDvGIddvQlN2TIttIi9ejqZdBb/UV38153Bii2DT6SiTgBbE
	IGLaxCubBBLE8wRTjpV2kI4rKgLIoCjmQ/7iXwsuEPTdOO8M8Up/sDd53MxBgllsoagcdIDCRZ3
	L3ygkI5tqna+tBcCBZ3MbOe2GSH/S4IWCM1S+fdkCmMyiKG6upo8ft6Hbi2+uDWptGnvrHeHQzT
	Nu7abzqSDRhQ0buH9gwAZdNuS6a11qxlE1tODNYaL89y08A7RwLnvZlq0aE+gaLN0r1k2x735L9
	LAZEx1C2pZlou29F7I3ds9/boZDnaPh423W/w2NZrsJHp7dH/4A1UddcudYGrJCvPsPy42sRf+j
	tm6ueQpCOWJJKoVQSKRsBxeRj1bGVMclqWVRFB5mw3L1FNvVyIhqIjM16MeCDpPRZim46QhpXgo
	Ejct62biu3V+pvjPkw34/8cVRn23
X-Received: by 2002:a05:620a:d8d:b0:939:597:e7af with SMTP id af79cd13be357-93a038fa617mr775671985a.35.1789270918119;
        Sat, 12 Sep 2026 20:41:58 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80d453esm652916385a.38.2026.09.12.20.41.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 20:41:57 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	linux-serial@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] tty: serial: meson: fix UART driver lifetime
Date: Sat, 12 Sep 2026 23:41:48 -0400
Message-ID: <20260913034148.15068-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moving Amlogic UART registration into probe left the first driver
registration behind if uart_add_one_port() failed. Adding the separate
ttyS driver later also exposed a global last-port test: removing the last
port of one driver kept it registered whenever the other had a port.

Track whether probe registered the driver and undo it when port addition
fails. On remove, retain the current driver only if a remaining port maps
to that driver. Serialize the shared lifecycle decisions against parallel
probe and remove operations.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: bcb5645f99ef ("tty: serial: meson: redesign the module to platform_driver")
Fixes: e71aab9d6132 ("tty: serial: meson: apply ttyS devname instead of ttyAML for new SoCs")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/tty/serial/meson_uart.c | 52 +++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index a6cb2a535..4bd9d9826 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -80,6 +81,7 @@ static struct uart_driver meson_uart_driver_ttyAML;
 static struct uart_driver meson_uart_driver_ttyS;
 
 static struct uart_port *meson_ports[AML_UART_PORT_NUM];
+static DEFINE_MUTEX(meson_uart_mutex);
 
 struct meson_uart_data {
 	struct uart_driver *uart_driver;
@@ -692,6 +694,16 @@ static struct uart_driver *meson_uart_current(const struct meson_uart_data *pd)
 		pd->uart_driver : &meson_uart_driver_ttyAML;
 }
 
+static bool meson_uart_has_ports(struct uart_driver *uart_driver)
+{
+	for (int id = 0; id < AML_UART_PORT_NUM; id++)
+		if (meson_ports[id] &&
+		    meson_uart_current(meson_ports[id]->private_data) == uart_driver)
+			return true;
+
+	return false;
+}
+
 static int meson_uart_probe(struct platform_device *pdev)
 {
 	const struct meson_uart_data *priv_data;
@@ -702,6 +714,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 	int ret = 0;
 	int irq;
 	bool has_rtscts;
+	bool registered = false;
 
 	if (pdev->dev.of_node)
 		pdev->id = of_alias_get_id(pdev->dev.of_node, "serial");
@@ -731,11 +744,6 @@ static int meson_uart_probe(struct platform_device *pdev)
 	of_property_read_u32(pdev->dev.of_node, "fifo-size", &fifosize);
 	has_rtscts = of_property_read_bool(pdev->dev.of_node, "uart-has-rtscts");
 
-	if (meson_ports[pdev->id]) {
-		return dev_err_probe(&pdev->dev, -EBUSY,
-				     "port %d already allocated\n", pdev->id);
-	}
-
 	port = devm_kzalloc(&pdev->dev, sizeof(struct uart_port), GFP_KERNEL);
 	if (!port)
 		return -ENOMEM;
@@ -748,11 +756,22 @@ static int meson_uart_probe(struct platform_device *pdev)
 
 	uart_driver = meson_uart_current(priv_data);
 
+	mutex_lock(&meson_uart_mutex);
+
+	if (meson_ports[pdev->id]) {
+		ret = dev_err_probe(&pdev->dev, -EBUSY,
+				    "port %d already allocated\n", pdev->id);
+		goto out_unlock;
+	}
+
 	if (!uart_driver->state) {
 		ret = uart_register_driver(uart_driver);
-		if (ret)
-			return dev_err_probe(&pdev->dev, ret,
-					     "can't register uart driver\n");
+		if (ret) {
+			ret = dev_err_probe(&pdev->dev, ret,
+					    "can't register uart driver\n");
+			goto out_unlock;
+		}
+		registered = true;
 	}
 
 	port->iotype = UPIO_MEM;
@@ -781,9 +800,14 @@ static int meson_uart_probe(struct platform_device *pdev)
 	}
 
 	ret = uart_add_one_port(uart_driver, port);
-	if (ret)
+	if (ret) {
 		meson_ports[pdev->id] = NULL;
+		if (registered)
+			uart_unregister_driver(uart_driver);
+	}
 
+out_unlock:
+	mutex_unlock(&meson_uart_mutex);
 	return ret;
 }
 
@@ -794,15 +818,19 @@ static void meson_uart_remove(struct platform_device *pdev)
 
 	port = platform_get_drvdata(pdev);
 	uart_driver = meson_uart_current(port->private_data);
+
+	mutex_lock(&meson_uart_mutex);
 	uart_remove_one_port(uart_driver, port);
 	meson_ports[pdev->id] = NULL;
 
-	for (int id = 0; id < AML_UART_PORT_NUM; id++)
-		if (meson_ports[id])
-			return;
+	if (meson_uart_has_ports(uart_driver))
+		goto out_unlock;
 
 	/* No more available uart ports, unregister uart driver */
 	uart_unregister_driver(uart_driver);
+
+out_unlock:
+	mutex_unlock(&meson_uart_mutex);
 }
 
 static struct meson_uart_data meson_g12a_uart_data = {
-- 
2.47.1

