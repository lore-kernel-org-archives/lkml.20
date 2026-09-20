Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8443E1CE8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938844; cv=none; b=XF7DuK8mbUetn7JnJmCAXvl0q7KB1u5zZbtdPuu33FHIhlnfJbmTvTWT5GooE7cKz8BxHXoPx7zYo8kUjOTifolmTL/Bjp1yryKd6pRwGisWEQDWwqBDXV8AGQ0W7B52RssABbl8WG97RRI6wap/c6SSL9yuF/PvvLvEZG/6plA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938844; c=relaxed/simple;
	bh=l/UUepTpO0Qk/KuhJ2sVwmu3RIKJO4nGvtoqYcUOboE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E61zr0NNN9g3nrHs5jwQlTC0/Gnh4B77gjo27wgGWajggtqsGjmICsrA8qmYYMLGM+sTuMw+U06HbozlSIG4rZfCgmum9cBMMp8ZuL5o5j/oXYIs2uJWPDkFwZeuxl6E9JXEtC9O18/iWmvfDC69URzUG0Hnw0bBlbsL/DL57ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pxFlvGKN; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pxFlvGKN"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so2063558a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789938843; x=1790543643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNN8eipdLX6K7kQkCh1wCd5ubolRJmwOq01XK22sELg=;
        b=pxFlvGKNAut0zXGIPps6QBo76SaIvaP7LupGHFbdTwfXziQDT44b8XI6fb2l/G9k5w
         xI8hRPfj4b4ZbtYtsKQOP5j9UfMgnQ286YfRGQ7ogNrJiYVjP8lQpK/aglktywhdZ+c2
         Xr1CG10uhDdUVRKEUfNPWlvh8bNY7YEhZ5cXSFnwAiV0s3nvVCBf7O87ETJcM7AdJu5g
         XmUSieJwPZNCLDFlv/4jvb+r5QKsregXenfmPdC+CdqcmYk56X8MtMEtBtIVcJHiRY2R
         YJEjL+5/mleRaMCXA/nD0+eH9uKPdwjnJqwvrY9E0w7zlSuEqb5jE/hVE4RRgpjOVHP0
         qPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938843; x=1790543643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNN8eipdLX6K7kQkCh1wCd5ubolRJmwOq01XK22sELg=;
        b=jC9mdwsytrcw7yRAk0h3CkSHS+PZPPiEh6q7iWkUtxam/frIVrdGp1PQI/VemN2LaM
         L2RNCTMPWGaxUwV4PQ5EJWjjWpobp+svhS9xZAumyLkmSOZUSr5cLV17me7vEmYD0Nzm
         RQgrRj2sJ1L5JrPZ/MKVsGDHEISH7e/NFR9ggd7jrMvDQo9iOlK6laO8L9a7QSIXqaU+
         IdMgT596FbNCavGKq6O2VoXlwituFTKD+IMeLVXf5u9zMNUV+RAH8L+z2nITo5WceshT
         C37CnXUwpedp3wEH3VSw7q5tjYuL2HQRtR+kewfWuPlszeFYsLpE109aZI3UoAQ1LeAE
         cIkw==
X-Forwarded-Encrypted: i=1; AKwUvBxGJIBaUmaDhfY26obqaFjoqUd/qE/l3dgzOU1i6GH1nF5HUlL13YVXjLfI9aJAHNwq5VLZA9HoJdejf7A=@vger.kernel.org
X-Gm-Message-State: AFuF++lMH6bkWsUm0TGbkwKQtM95RgDMlPYx7j+9lFwTvqHlqFm4eOhw
	//RqoV28pkW0Z64ghxU4a0kxxDCx9jHYRzMYG0hMDgYXI+BuwPQ+yiU1
X-Gm-Gg: AYBFou07Sn5T8wTfFcLuEUUKZ5jlZlR767G6v8HCMaMka2pP85jwAXBbUPVz1vY/ZIZ
	4aQZ1ehnxwCfT18aki61DrpivoBZJ6JyI4QtJbTw1qPujhaA7L8VQLfv1kHqL4DpUxPU9N/9vb9
	PBUsJD+6yZ+sJC1z6/ne4cqoEMO4Axwtt5P5WIpAaAVS7hqKy3BzEd4iaWivk4hK3k1f1z4SPPn
	bBjX2tNp05cROoNvGZQVeLR19xt51SAlCvQRefCXN4jMw5O8ZhCu3R0DlLqWqwvmQJRuG43aFWo
	bBDgM89hf2hLXTSqD5c0MPBeJjnrL9gX8GbH56PIvj3wj2rKlqh3MuTgMLg6XOzXXVqvvqpMm/5
	9B3irh9nvAlT9KjTXhFPam8VOZpvcnFvl6BLekCfnZfwHP2b5qdyiG4NPifkQXhL1EKPqOkfndE
	iEC9SYXhFQBe2FVvfh98vQTeNVmwUqesf5SLepmn1pbqG2iE4skdZMPErfL/+fK7E7qwgAlGsRu
	m+dLYMj7MxPq5PTHoH+KpJUcrI4qz4V9dvgqpsVsOy7pohnwM1dEe/E+JobHRXVgqiDOU02uN5l
	mRNRImohFwJZXq+94nY8VQpt8mEYcnkmxR/k5tl5+EGqk1yZ
X-Received: by 2002:a17:90a:d40e:b0:39e:6c6a:656f with SMTP id 98e67ed59e1d1-39e6c6a6787mr7048137a91.50.1789938842656;
        Sun, 20 Sep 2026 14:14:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm10609743a91.4.2026.09.20.14.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 14:14:02 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 1/2] usb: bcma: control VBUS via a regulator instead of a GPIO
Date: Sun, 20 Sep 2026 14:13:55 -0700
Message-ID: <20260920211356.186967-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920211356.186967-1-rosenp@gmail.com>
References: <20260920211356.186967-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcma-hcd drives the USB power line by grabbing the undocumented
"vcc-gpio" from the controller node and poking it through gpiolib.
Besides relying on a non-standard binding, this cannot work on boards
such as the NETGEAR R7000 and R8000 where one chipcommon GPIO powers
both the USB2 and USB3 cores: the two controllers each request that
GPIO exclusively, so the second one fails with -EBUSY and its port
stays dead.

Use the standard regulator interface instead. Each core obtains its
(shared) VBUS supply through devm_regulator_get_optional() and the
regulator core reference-counts the enable/disable requests, allowing
both controllers to drive one GPIO without conflicts.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/host/bcma-hcd.c | 45 +++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
index 519386255886..394ba9e5a7f7 100644
--- a/drivers/usb/host/bcma-hcd.c
+++ b/drivers/usb/host/bcma-hcd.c
@@ -20,12 +20,12 @@
  */
 #include <linux/bcma/bcma.h>
 #include <linux/delay.h>
-#include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/usb/ehci_pdriver.h>
 #include <linux/usb/ohci_pdriver.h>
 
@@ -40,7 +40,7 @@ struct bcma_hcd_device {
 	struct bcma_device *core;
 	struct platform_device *ehci_dev;
 	struct platform_device *ohci_dev;
-	struct gpio_desc *gpio_desc;
+	struct regulator *regulator;
 };
 
 /* Wait for bitmask in a register to get set or cleared.
@@ -280,14 +280,20 @@ static int bcma_hcd_usb20_ns_init(struct bcma_hcd_device *bcma_hcd)
 	return 0;
 }
 
-static void bcma_hci_platform_power_gpio(struct bcma_device *dev, bool val)
+static int bcma_hci_platform_power(struct bcma_device *dev, bool on)
 {
 	struct bcma_hcd_device *usb_dev = bcma_get_drvdata(dev);
+	int err;
+
+	if (!usb_dev->regulator)
+		return 0;
 
-	if (!usb_dev->gpio_desc)
-		return;
+	if (on)
+		err = regulator_enable(usb_dev->regulator);
+	else
+		err = regulator_disable(usb_dev->regulator);
 
-	gpiod_set_value(usb_dev->gpio_desc, val);
+	return err;
 }
 
 static const struct usb_ehci_pdata ehci_pdata = {
@@ -405,11 +411,14 @@ static int bcma_hcd_probe(struct bcma_device *core)
 		return -ENOMEM;
 	usb_dev->core = core;
 
-	usb_dev->gpio_desc = devm_gpiod_get_optional(&core->dev, "vcc",
-						     GPIOD_OUT_HIGH);
-	if (IS_ERR(usb_dev->gpio_desc))
-		return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_desc),
-				     "error obtaining VCC GPIO");
+	usb_dev->regulator = devm_regulator_get_optional(&core->dev, "vbus");
+	if (IS_ERR(usb_dev->regulator)) {
+		return PTR_ERR(usb_dev->regulator);
+
+	err = regulator_enable(usb_dev->regulator);
+	if (err)
+		return dev_err_probe(&core->dev, err,
+				     "error enabling VCC regulator");
 
 	switch (core->id.id) {
 	case BCMA_CORE_USB20_HOST:
@@ -452,7 +461,7 @@ static void bcma_hcd_remove(struct bcma_device *dev)
 
 static void bcma_hcd_shutdown(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, false);
+	bcma_hci_platform_power(dev, false);
 	bcma_core_disable(dev, 0);
 }
 
@@ -460,7 +469,11 @@ static void bcma_hcd_shutdown(struct bcma_device *dev)
 
 static int bcma_hcd_suspend(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, false);
+	int err;
+
+	err = bcma_hci_platform_power(dev, false);
+	if (err)
+		return err;
 	bcma_core_disable(dev, 0);
 
 	return 0;
@@ -468,7 +481,11 @@ static int bcma_hcd_suspend(struct bcma_device *dev)
 
 static int bcma_hcd_resume(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, true);
+	int err;
+
+	err = bcma_hci_platform_power(dev, true);
+	if (err)
+		return err;
 	bcma_core_enable(dev, 0);
 
 	return 0;
-- 
2.55.0

