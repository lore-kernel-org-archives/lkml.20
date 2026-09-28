Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A15F4F3EB5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790626971; cv=none; b=ge4bEMxwfyt8tsNgE9EL/rzPqjF5hgoZTHcpJ2f9UTe1cdO9lfi+JZA2gMWjSd+MkjrDkHKd+ykjNsNFG994LxPwUEMqtuaHmU1omQpMkuCJE0RdApZjk0NSdkWEH99llBmeR7fMDmE2btfc3ve9gjzOTTRdRRrUeehtAy/1hrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790626971; c=relaxed/simple;
	bh=T9ahMNZYggWFr7vFYd4M4/IiR7r4vDulkG2y99nse1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YfUHpMzT1XDT5XbZvPNfFw/6utBnsQ2GbnRFccaCJ6jpuupDphFDCfdu8ncK7Vs7GBHoOjZiVInTtSVkxwR+dQgKhmtXl4b+7GmaRBKTwHf9U7Kryiey0jiWv4h2fjIina/Oi4sJOLV3j9Phz+a1bk/KOrwoBHNEZtwjfFAPn/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIp2Q7y4; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIp2Q7y4"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d2c37b0bso1156493a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790626969; x=1791231769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sgsF2Qtfaph+w+K3mbgzWsO3GvvGyRwePyV4makA6yg=;
        b=OIp2Q7y48Gicj1RnZhEhd79J26VG/GBJc5FA9qzSRNQoFUty7Z3hXYwK/aRgqPtXlx
         aU6dhWJxeD0AqMtEpnOcDPCqAadAA6ojC4pT9c8a7tH+Fu8ZCaGhObZLtKyA3H7OrB61
         BWac6uTwL0fqn1FxfhUVAO2bRLM7OHI74PviQResyd1tRL1uNIzEy838ichs5V2B+tNP
         jj6sg5Q/fFjh5yaM+MgDBe5BwPIo78Lk84His9vw0mcWgKpyazsivHgQ4Lx7nqRZkJFD
         f17kM/TJ62A1Yam73HRUqGFX3bQ23Gq5kxZ7JisIYXdtDyo7qOmoFUyDFdiFOVZbdqzz
         W4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790626969; x=1791231769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sgsF2Qtfaph+w+K3mbgzWsO3GvvGyRwePyV4makA6yg=;
        b=tJj8aCo2AMDM9plMF0ZsVjf/9/N3HX7AEGYAZXy2HeVvNPcZooyFCTYTUjxh2ymg+t
         yKBE/ZB6nGnDQZ1j0Ka33yHae4aM4KMtOJX4Q99PfgfhQ+b6Gq3NhoBg4qQ5/ZYllu/c
         CE1KZnMhC/xpIgveCotg54BA5BiW2C1qh9bTLv8oZl7FmQtisKvTmk2kXsOMdWW3pAlY
         dVFWyyeQZXd/1FIk0ui/zVGGX25IofEl1l23794/YYU7k5DpZYd6f5Oa6MrF1nqHkqE4
         MHZfzE8SiaFqElL0Al7o8Oo5Y06NlggvZsn7MWcBYLjqHKu5o7JKENJ4DxKMs2RdeEym
         +JWg==
X-Forwarded-Encrypted: i=1; AKwUvBxwbRjrA3FEtaelIV5b2ct3hNpN4b+eCxreW/gMSLGPnzr0KOiDUEXZR+y0oQgWMT5Ama2ZWldFQoG1rMM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXjTYw+Uwu5coj7ynaih3oDVbJ50Zw+nOtFMlKRnJrKlagkolC
	l89llhjZ3di34P4oKYT4R4/lt3UKK/TxQRA4JgbI9w6KIlLZb/6+j7vIDsqrUpvP
X-Gm-Gg: AYBFou3faoXkv87GdYLSMJaeOntP7Gg8yDAc6i5A9m79y46m/mPi3Y3f0UAyohE0FB4
	gsCbMQcxZqyBCcLevjNifMN2I6iaEfvFqoj1YKQVUqLGAxWY21N56/Tr9gFL8aUWZHdqpYvTtcg
	RF8Yy4FbqtvLw5CDVmyVuCRpQajByjxH0wgmlalb0d3/ixpQkda25KmlDJ4Ukikv6RuyLNQXRfg
	RjjOU5CeMdv+dy7klzs24Luqv43z93y7mV1Si3YDFbsPC/d2S2kQZdpZKMkNrMZxDVZx1A0N8Jv
	R2XI6VzreCwe/S6LPls42cNp84vmRblmgtPry/Am+d91edtZ9uR1dTNLmh5AOgTptFNz69LmhNr
	DOdxG6uAzJPQzuEUBQQUx24H9+EYua4WorO3cm23Py48Isz56TYbKhAniFJS849xy0ddDb/BKhq
	PnnGHZlnUcqa8a2UJHdtT6l7sGeEXVJ/JOfb2pXdXOg55pYfOvSFBMSQe5HTh8iJvSvAHGyHvQe
	I0eSSQxdfZDKmJZT47TOOE8HWQQolqB1+XCTDeZ1VS8UM0vG4xaHyDGhyfNlqkrpddYdEI7rHda
	YuYcAgNUa9ip3tlIBL20p3IR7rtxQC/ESDB9HuYyTwWAPlla
X-Received: by 2002:a17:90b:2250:b0:39e:4c7f:8b1b with SMTP id 98e67ed59e1d1-3a098e37392mr11209444a91.32.1790626969508;
        Mon, 28 Sep 2026 13:22:49 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a492b019besm1072143a91.1.2026.09.28.13.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:22:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4] USB: bcma: add regulator support
Date: Mon, 28 Sep 2026 13:22:47 -0700
Message-ID: <20260928202247.51466-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Add support for the standard regulator interface. VBUS is fetched with
devm_regulator_get() so existing boards keep working. Those with
"vcc-gpio" are unchanged. A dummy regulator warning is now emitted to
encourage migration to the new regulator setup.

Both mechanisms now start with VBUS off and enable it only after the
host controller has been set up, so a SuperSpeed device no longer falls
back to high-speed because EHCI started with VBUS already on. VBUS is
dropped again on suspend, shutdown and remove.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: split into own patch as it's not dependent on dts changes.
 v3: don't drop GPIO.
 v2: fixup dts and keep GPIO working.
 drivers/usb/host/bcma-hcd.c | 38 ++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
index 9a5704358996..ef4d6746e588 100644
--- a/drivers/usb/host/bcma-hcd.c
+++ b/drivers/usb/host/bcma-hcd.c
@@ -26,6 +26,7 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/usb/ehci_pdriver.h>
 #include <linux/usb/ohci_pdriver.h>
 
@@ -41,6 +42,7 @@ struct bcma_hcd_device {
 	struct platform_device *ehci_dev;
 	struct platform_device *ohci_dev;
 	struct gpio_desc *gpio_desc;
+	struct regulator *regulator;
 };
 
 /* Wait for bitmask in a register to get set or cleared.
@@ -280,14 +282,18 @@ static int bcma_hcd_usb20_ns_init(struct bcma_hcd_device *bcma_hcd)
 	return 0;
 }
 
-static void bcma_hci_platform_power_gpio(struct bcma_device *dev, bool val)
+static int bcma_hci_platform_power(struct bcma_device *dev, bool on)
 {
 	struct bcma_hcd_device *usb_dev = bcma_get_drvdata(dev);
+	int err = 0;
 
-	if (!usb_dev->gpio_desc)
-		return;
+	if (usb_dev->gpio_desc)
+		err = gpiod_set_value(usb_dev->gpio_desc, on);
+	if (err)
+		return err;
 
-	gpiod_set_value(usb_dev->gpio_desc, val);
+	return on ? regulator_enable(usb_dev->regulator) :
+		    regulator_disable(usb_dev->regulator);
 }
 
 static const struct usb_ehci_pdata ehci_pdata = {
@@ -416,6 +422,11 @@ static int bcma_hcd_probe(struct bcma_device *core)
 		return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_desc),
 				     "error obtaining VCC GPIO");
 
+	usb_dev->regulator = devm_regulator_get(&core->dev, "vbus");
+	if (IS_ERR(usb_dev->regulator))
+		return dev_err_probe(&core->dev, PTR_ERR(usb_dev->regulator),
+				     "error obtaining VBUS regulator");
+
 	switch (core->id.id) {
 	case BCMA_CORE_USB20_HOST:
 		if (IS_ENABLED(CONFIG_ARM))
@@ -437,6 +448,10 @@ static int bcma_hcd_probe(struct bcma_device *core)
 	if (err)
 		return err;
 
+	err = regulator_enable(usb_dev->regulator);
+	if (err)
+		return dev_err_probe(&core->dev, err, "error enabling VBUS");
+
 	bcma_set_drvdata(core, usb_dev);
 	return 0;
 }
@@ -452,12 +467,13 @@ static void bcma_hcd_remove(struct bcma_device *dev)
 	if (ehci_dev)
 		platform_device_unregister(ehci_dev);
 
+	bcma_hci_platform_power(dev, false);
 	bcma_core_disable(dev, 0);
 }
 
 static void bcma_hcd_shutdown(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, false);
+	bcma_hci_platform_power(dev, false);
 	bcma_core_disable(dev, 0);
 }
 
@@ -465,7 +481,11 @@ static void bcma_hcd_shutdown(struct bcma_device *dev)
 
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
@@ -473,7 +493,11 @@ static int bcma_hcd_suspend(struct bcma_device *dev)
 
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

