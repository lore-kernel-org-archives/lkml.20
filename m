Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8B64C8C5A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293117; cv=none; b=OsWpHpBHiq/UeTR6Vj+4xYRN2zLQrKtQctG4tKnnkHXSaCh6+4lDkOQSN7OjmZAcSqzLypHnplxi4/W/uiFx1JCN9FIevSfUE/dLg4RiIKNogGaQkXCYeKMXxo3e67BFWQhI9GrKNiNXptxOXo8ITKDT40Uf5R2aAEubZGwD1I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293117; c=relaxed/simple;
	bh=CwqVpfW5z2yOmptdAsDoPF46KOoDDSI+MVi0EV/la8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cSEpOKIGrZlaxpN6ckCOejQMzAo8BrvCoqNom79u/FocpLLfHJsH4/CXxof1C6nwjtizugd0t4sTcssJnKWFrlFm4uqcL+fBlUXQD/Zkpgw6ZM7TBp2YNbHgOcpnEqypARv4sWhgyKrpVJVdm16A5twiQ2qJ9aFam6TE+x/8dIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dlmss0YO; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dlmss0YO"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb752so227253a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790293116; x=1790897916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NkUiZl+VXWJ7LnfDyzh1qcCSWVwBQESldFOBOhNixg=;
        b=Dlmss0YOREW63N6yfr3mJBCvg7MxhY3ItCAVrfpuwXrJdFLv8iK2BjIkeA3wzy/S/Y
         +GuKf9Cn1yqSRizu3mB5dFZc3WF7fL9c89ijaGhUYHkKkSZU0JHmhypibdeVnuxXGb6K
         dnuf2Ejezaz9jTakI6e1FGbeWQ0if0e0mvi1GiE8IbRzIoemkFghaa2gfY3arywuj4zi
         eeplU4lzuRiAhZd4BRnuh4eS4IMdkoBWx5UMqGT5tAag8l+IYJ4trtcuHz3sRk7QyuxN
         il0/9/xCjiJh4lFQrgvREQsjyXBaZNxPBasvxijbtponEclF1dgUzL1NAUap2/rDEf5Q
         F78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293116; x=1790897916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/NkUiZl+VXWJ7LnfDyzh1qcCSWVwBQESldFOBOhNixg=;
        b=vgWIol87zYoxLOrPM2jGVIOfYk/HQSCdpAAZUcDbzix6XyJjBSd1ECDZYIlNAAgTN3
         HM6J3C2fdodQKVcNPlRHcaaVwJgCS4+GLEdFigXv5dytHmpiRAVd8xjt6CHp7V8YxDPP
         c6pFWnC7rGM3CSMKdlUBR7CeTUMRmexuxZYOJEhHXWtWDN9x+SFni0nTXehfIEJv70yZ
         IpfNAPDNmox0c8GJc3K/4RggzBvAPaRqYpq1GXknBQaPMVTpdGdPhByZg3wALa8mDazJ
         ggnA3HEc84N3QCr7FcXxvh8x382lnuSYCa5dromLwdAyiJ6MxiKZPjN4FE7gdxT5p9vo
         5s/A==
X-Forwarded-Encrypted: i=1; AKwUvBwuQPSeOlhE5ART9pl0+fbd5k5N/RskksW1AhUyqiflpF8rUwSexn1hK4b11rmQGJq3o9mguveg9MyAv1c=@vger.kernel.org
X-Gm-Message-State: AFuF++no0lYAijGN1k0u24PCP/lXwEMKIha/UQ+ScUWeWi3ea46AXHmT
	xZY2yE7dgtaSJDcHnhcODcVPIserda2MwSQbelq9lKluZWliZO+7m4Na
X-Gm-Gg: AYBFou3nZBHOYte84Oycfy0ertgwEcH90AzB2snFfAYGehJcU0HH4mO2YlmVul5gxbx
	+ZjtC+1iCVTmwUrPvzqFbtLDWbi7Znw3F/KeZ/ts8tcEWNjr4xz50Elqyn32qMaj32vvVGJfGQ9
	qXa8GDbT8uM7BOo59iAEATr4bMfwFOje3auNPuGwY139fMIbwm6d/CNaiiQUMrcZmdhW1Hk1y5q
	Sy0xO0V/I+w8Bt1JUI3D93bAzrMWSQAqxo2FTmbd+Gb2vYWcfPjQoKZrebHYS+pKcz6nFCB2UMH
	HLP9YNtsERzfpV4Q2FBVtN3ZByYtxQx0fX/SunBrZvzpLMKI9XTlyg2alhTrcIohwqeXZ4cqs5V
	IDdYwStN1nsDMfaAYzV4zSl43BZp13giVBg51xMrI2vn6mR46XA01rO0XqC3h6rDmF956rugd4z
	37Hlo0b5Tt4N25xu47vMJVN2sR3DGVUjZ6q16HVvC+9uHF1726dwXpjSgqhXbb4zsW4dcZu36HS
	i7ZKE7Uq5g1iU3KlnQdTUfW7QODrlZs3S2AGrNtJr8o9zJp/bB7uGSZJvX9iB4Mobqr0dh9hRvz
	3UCogzPSWOMGUpBprrRjOfSjW1Kllidd3wLAFYDNCY4BwGFKAw==
X-Received: by 2002:a17:90a:d44b:b0:39e:218c:d47c with SMTP id 98e67ed59e1d1-3a098587430mr3610558a91.9.1790293115660;
        Thu, 24 Sep 2026 16:38:35 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b7d11124sm1307931a91.10.2026.09.24.16.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:38:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3 1/2] usb: bcma: add regulator support
Date: Thu, 24 Sep 2026 16:38:30 -0700
Message-ID: <20260924233831.127617-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924233831.127617-1-rosenp@gmail.com>
References: <20260924233831.127617-1-rosenp@gmail.com>
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

Add support for the standard regulator interface. Each core obtains its
(shared) VBUS supply through devm_regulator_get() and the regulator core
reference-counts the enable/disable requests, allowing both controllers to
drive one GPIO without conflicts.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/host/bcma-hcd.c | 55 +++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
index 519386255886..cb253cae29ae 100644
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
@@ -280,14 +282,23 @@ static int bcma_hcd_usb20_ns_init(struct bcma_hcd_device *bcma_hcd)
 	return 0;
 }
 
-static void bcma_hci_platform_power_gpio(struct bcma_device *dev, bool val)
+static int bcma_hci_platform_power(struct bcma_device *dev, bool on)
 {
 	struct bcma_hcd_device *usb_dev = bcma_get_drvdata(dev);
+	int err;
+
+	if (usb_dev->gpio_desc)
+		return gpiod_set_value(usb_dev->gpio_desc, on);
 
-	if (!usb_dev->gpio_desc)
-		return;
+	if (!usb_dev->regulator)
+		return 0;
 
-	gpiod_set_value(usb_dev->gpio_desc, val);
+	if (on)
+		err = regulator_enable(usb_dev->regulator);
+	else
+		err = regulator_disable(usb_dev->regulator);
+
+	return err;
 }
 
 static const struct usb_ehci_pdata ehci_pdata = {
@@ -395,12 +406,12 @@ static int bcma_hcd_usb30_init(struct bcma_hcd_device *bcma_hcd)
 static int bcma_hcd_probe(struct bcma_device *core)
 {
 	int err;
+	struct device *dev = &core->dev;
 	struct bcma_hcd_device *usb_dev;
 
 	/* TODO: Probably need checks here; is the core connected? */
 
-	usb_dev = devm_kzalloc(&core->dev, sizeof(struct bcma_hcd_device),
-			       GFP_KERNEL);
+	usb_dev = devm_kzalloc(dev, sizeof(*usb_dev), GFP_KERNEL);
 	if (!usb_dev)
 		return -ENOMEM;
 	usb_dev->core = core;
@@ -409,7 +420,15 @@ static int bcma_hcd_probe(struct bcma_device *core)
 						     GPIOD_OUT_HIGH);
 	if (IS_ERR(usb_dev->gpio_desc))
 		return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_desc),
-				     "error obtaining VCC GPIO");
+				     "error obtaining VBUS GPIO");
+
+	usb_dev->regulator = devm_regulator_get(dev, "vbus");
+	if (IS_ERR(usb_dev->regulator))
+		return dev_err_probe(dev, PTR_ERR(usb_dev->regulator), "error obtaining VBUS regulator");
+
+	err = regulator_enable(usb_dev->regulator);
+	if (err)
+		return dev_err_probe(dev, err, "error enabling VBUS regulator");
 
 	switch (core->id.id) {
 	case BCMA_CORE_USB20_HOST:
@@ -427,13 +446,16 @@ static int bcma_hcd_probe(struct bcma_device *core)
 		err = bcma_hcd_usb30_init(usb_dev);
 		break;
 	default:
-		return -ENODEV;
+		err = -ENODEV;
 	}
 	if (err)
-		return err;
+		goto error;
 
 	bcma_set_drvdata(core, usb_dev);
 	return 0;
+error:
+	regulator_disable(usb_dev->regulator);
+	return err;
 }
 
 static void bcma_hcd_remove(struct bcma_device *dev)
@@ -447,12 +469,13 @@ static void bcma_hcd_remove(struct bcma_device *dev)
 	if (ehci_dev)
 		platform_device_unregister(ehci_dev);
 
+	regulator_disable(usb_dev->regulator);
 	bcma_core_disable(dev, 0);
 }
 
 static void bcma_hcd_shutdown(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, false);
+	bcma_hci_platform_power(dev, false);
 	bcma_core_disable(dev, 0);
 }
 
@@ -460,7 +483,11 @@ static void bcma_hcd_shutdown(struct bcma_device *dev)
 
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
@@ -468,7 +495,11 @@ static int bcma_hcd_suspend(struct bcma_device *dev)
 
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

