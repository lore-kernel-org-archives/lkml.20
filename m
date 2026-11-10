Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347753;
	b=v5AFmWZQq+FW++KfjcMqAxNtPaAQbMpUVTCDx4oCIYYmSIAvDJE97L9l2jJCe97iZsBL
	 S+drucbuSmSo5xtPIUPe7C0YUBuQnoqLqW2mXLgOw3HEo2BYGzJ8aQG6BT9VRfHSMEYiN
	 L8o6qiICgKq2I6Zwhonf73rDVLl8LtGBi1Dsj+iHEXDVQMnbLGIKstr++jJuG43LGFVJ6
	 68OyYdSouFLRNkSl9rWnfn7srp16w/8jEm/nGCnXWObMkjcRY0SfeEmVLieoLWzWy3pYB
	 Gs2RUg+X7T795xrG5Sa1/SGgTE5eCnDvT3pBXWZnyqNXEDyJed6PkemwSt5ST+HyfOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=NSNgF70HdhR2g8AfyHRx/cqCBUDACybZx2f3pH5bJsU=;
	b=A9FrwoTt0HUeoYhOENsFS5fL845vHhrqUQxjlu2TsM4m01zI7Rk5d9cQid4EE+FrY81X
	 bM1xF3/Gw3+E1oTObWHCm/TFSTUfT/HkUtbrfN8wwfCl6Im5T0QQuuq6Ukhn0x/sWV3XS
	 jgJVOzQXskh7brJMdaJp6XJJuuOQsazqYK8+6nI1pOcnhHH8Tko0AX2yIybipvNFi/J/8
	 UJIRrpIEs1KB8tC/lPjUbQuJIxkjl5ZczpdwJ0jbCU9uEk8fk+zVdWALGnxJhLNe7xQCT
	 /MroENtDnP/dZXDClgYXsw5WtD5JCVx+BjugIm2OIAu3kU/PGxis+22xB15hLEDEfsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IwOC5rw9;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DBB606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88DBB606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IwOC5rw9
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so21525305e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347752; x=1794952552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NSNgF70HdhR2g8AfyHRx/cqCBUDACybZx2f3pH5bJsU=;
        b=IwOC5rw9YTA77WvT6voP8L/M1nq33eLXPDd8S5R/mxbDsauEe03m5vNZlyT8+oXUHP
         bbwz63ECp3mH/tPdephhYpfksAbVj1qiojQQXy3nG0rf7FLYFYJaxbJ28Cf8v4UAngXL
         v/lqqmzlJO6x2d8PyepX7Cjrx5lD8d6z9MC+C0QhM+xDQum0tWWHNq2n1i//5CxcSpzh
         uQtInS8KrOCduKOpVlhuyjkw5JBhwnGzzwAvHRgTkC+35EkROQT/bA+noLpoSs2iHGN4
         XtITrYpzX+FIGuIUOsi++RUOixQcfelzCt5ZTjxM4GOR2R694D9HmPJhdSW1mnzG9IX+
         yGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347752; x=1794952552;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSNgF70HdhR2g8AfyHRx/cqCBUDACybZx2f3pH5bJsU=;
        b=HDCtDfY9yrtvAHa+ly5ImdDzTCyOeK96YXdaGi7A9dFpFucqyVgKF9s14VsjK30P9I
         0EmBcUFn99PGF7GAlm9pUGPStengWdWU+g5aQgRohHDA5+j4Mz+iQfFbD1z0lGxI40h9
         EFxC7sDxf4j7vXc45V0fgTd5iHkPrBec797zjA/saWN3t3AYIIiTAcNMjJnfKbB/aC1i
         qeC+y6fnuTFuNWBvoDYnImnSq5B07Gf1crP6MN+VsUE7wRqPJCJatn8AED/4HwzFdjWF
         /GOCdPyZ83V/aQ2sw7k94WV2o5udiXzSE3yL31MOzZ0C24HFuqwHkhGOv0Vu1ljT0cFf
         dMJQ==
X-Forwarded-Encrypted: i=1; AL+hErFhKnkSzn//g8a8u2VYVyfumyB6a+Q4h/Fwu8YCwye7jIYUajGHBfK5/ktrNsJwgZCjEbi5LBV9Ki1eB2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w5lvdDhOyh5KT68yJr0xt7t3sHW+EfM+DxELMpeJ97PX+rVw3
	M2yQ27ym3+OdOWxvrFOybrxv5BilzD8Z4FRL1iw+9jbsUgk1fPDvP6pDI4ICF8I+ANg=
X-Gm-Gg: AYBFou2+yumuvQAcTtIdsMeJBzcTXXKZ/p1gaEo3CfAPNRbe2AINmvj4wIv8xgEVi7p
	AOELeSJrOsnZ58cIeA/wASrkfCm1gtQ2x+0N5Aale9lbi0OQSQdfBnjx4tgtLKhtqEkGW4uNc83
	MioEuOOCFWb6q7w6bGrXkJCMttZkbf2j0YutlH23iYv2Fl9d6CcWxiHaHKNEfK8KXNx734vvAfF
	VkSd89O2TITVAOz9Gfe+fgPJ4m3VNNFqq7owW+V+4ywhahEipd2E2obd1wYRzWH3qqYk46HjQUo
	8n+j8GQPXQDzrsNpzw6ppQJRrUrVhr5X0OzOYW2Hoh1S9UZ78NeHc0Yy3f1RN7qfneQmiIuHZUp
	bAqRCI9tgcAwH3dzzEM3092GsmKnCEs8IyGOLt9PHwcCoukSEq+F9mh7mX6nmTRIxNwd6p6a1WM
	waV92aYLd/xuI44tpKr/mw+jmQgqVESzWKV8bXYreuALJJ/6SwR7QVl67WdKfDghyi7vP72rWSw
	LOh7DEPj27KP9qBYzyB5qWODWHagUzfD8n36x+uNKEzj6F4BXu2Fe2jgxtZfZOs7L7Q0GS/SN6N
	rMxz/eYC4qSQci8w+XI5sZfdihm75qobOEz2
X-Received: by 2002:a05:600c:3554:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4ba0937ded6mr6010335e9.31.1794347752002;
        Tue, 10 Nov 2026 13:55:52 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba0204ee67sm92142165e9.13.2026.11.10.13.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:55:51 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 03/20] mfd: kempld: Simplify device abstraction
Date: Tue, 10 Nov 2026 22:54:28 +0100
Message-ID:  <f751652cc2cee4addd2168e66e6d89bde275f39c.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7728; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=UDmSiiwBKlGcr/aufgewospfWd+ziqZKrky2D0HJgVk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85Kat77sixyat3+wLEe3Mq8MnsuYwVLOZSrRg 5fg4VmgHaOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSmgAKCRCPgPtYfRL+ Tg9bB/9Mts1geBTCuTFPs6HI9XsRhKIQk/0ow4oTSCURTJF1t2BdVw1fXmclmgrvRZdTesPOW50 aq0W8fV0s3xt6IiiuWIm0mwsx4hLt3QJbuR7yW2HjteGqXWpMNBGUtQXzXciCmGjRAoZYNqH1HS epPLhEZJfRgKWgRoiqritGOlojcf5nUXtCXgrmrCJpurf0th2t3BlnGyOpg5Nl8Fcl7EgcZCGbB Y8dTTyJxt/JxVAVj9yCfOeWpS1LoM4k8e0X8uQpoKjscdHOOJw9Jbk2W6iuDsNzf8uKXGOZzu/4 ARNjrQgY56q7m0JeMboo69tSAyIxAw9LmVGuEPh2AtkMLnVc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The devices that are created by the driver from DMI data and also ACPI
devices all use the same platform data. Other devices don't exist. (A
provider of such a device would need to know about struct
kempld_platform_data, but none of the other consumers of
<linux/mfd/kempld.h> creates devices.)

Simplify the driver by hardcoding this instead of using the ACPI
abstraction for multi-variant support without real variants.

Then apart from .gpio_base all members of `struct kempld_platform_data`
are only used in drivers/mfd/kempld-core.c, so they can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/kempld-core.c  | 64 ++++++++++----------------------------
 include/linux/mfd/kempld.h | 12 -------
 2 files changed, 16 insertions(+), 60 deletions(-)

diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index 47062f876e5d..fbbff3eac500 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -118,25 +118,19 @@ static struct resource kempld_ioresource = {
 };
 
 static const struct kempld_platform_data kempld_platform_data_generic = {
-	.pld_clock		= KEMPLD_CLK,
-	.ioresource		= &kempld_ioresource,
-	.get_hardware_mutex	= kempld_get_hardware_mutex,
-	.release_hardware_mutex	= kempld_release_hardware_mutex,
-	.get_info		= kempld_get_info_generic,
-	.register_cells		= kempld_register_cells_generic,
 };
 
 static struct platform_device *kempld_pdev;
 
-static int kempld_create_platform_device(const struct kempld_platform_data *pdata)
+static int kempld_create_platform_device(void)
 {
 	const struct platform_device_info pdevinfo = {
 		.name = "kempld",
 		.id = PLATFORM_DEVID_NONE,
-		.res = pdata->ioresource,
+		.res = &kempld_ioresource,
 		.num_res = 1,
-		.data = pdata,
-		.size_data = sizeof(*pdata),
+		.data = &kempld_platform_data_generic,
+		.size_data = sizeof(kempld_platform_data_generic),
 	};
 
 	kempld_pdev = platform_device_register_full(&pdevinfo);
@@ -235,10 +229,8 @@ EXPORT_SYMBOL_GPL(kempld_write32);
  */
 void kempld_get_mutex(struct kempld_device_data *pld)
 {
-	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
-
 	mutex_lock(&pld->lock);
-	pdata->get_hardware_mutex(pld);
+	kempld_get_hardware_mutex(pld);
 }
 EXPORT_SYMBOL_GPL(kempld_get_mutex);
 
@@ -248,9 +240,7 @@ EXPORT_SYMBOL_GPL(kempld_get_mutex);
  */
 void kempld_release_mutex(struct kempld_device_data *pld)
 {
-	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
-
-	pdata->release_hardware_mutex(pld);
+	kempld_release_hardware_mutex(pld);
 	mutex_unlock(&pld->lock);
 }
 EXPORT_SYMBOL_GPL(kempld_release_mutex);
@@ -266,10 +256,9 @@ EXPORT_SYMBOL_GPL(kempld_release_mutex);
 static int kempld_get_info(struct kempld_device_data *pld)
 {
 	int ret;
-	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
 	char major, minor;
 
-	ret = pdata->get_info(pld);
+	ret = kempld_get_info_generic(pld);
 	if (ret)
 		return ret;
 
@@ -296,20 +285,6 @@ static int kempld_get_info(struct kempld_device_data *pld)
 	return 0;
 }
 
-/*
- * kempld_register_cells - register cell drivers
- *
- * This function registers cell drivers for the detected hardware by calling
- * the configured kempld_register_cells_XXXX function which is responsible
- * to detect and register the needed cell drivers.
- */
-static int kempld_register_cells(struct kempld_device_data *pld)
-{
-	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
-
-	return pdata->register_cells(pld);
-}
-
 static const char *kempld_get_type_string(struct kempld_device_data *pld)
 {
 	const char *version_type;
@@ -399,12 +374,12 @@ static int kempld_detect_device(struct kempld_device_data *pld)
 		 pld->info.version, kempld_get_type_string(pld),
 		 pld->info.spec_major, pld->info.spec_minor);
 
-	return kempld_register_cells(pld);
+	return kempld_register_cells_generic(pld);
 }
 
 static int kempld_probe(struct platform_device *pdev)
 {
-	const struct kempld_platform_data *pdata;
+	const struct kempld_platform_data *pdata = &kempld_platform_data_generic;
 	struct device *dev = &pdev->dev;
 	struct kempld_device_data *pld;
 	struct resource *ioport;
@@ -415,16 +390,10 @@ static int kempld_probe(struct platform_device *pdev)
 		 * No kempld_pdev device has been registered in kempld_init,
 		 * so we seem to be probing an ACPI platform device.
 		 */
-		pdata = device_get_match_data(dev);
-		if (!pdata)
-			return -ENODEV;
-
 		ret = platform_device_add_data(pdev, pdata, sizeof(*pdata));
 		if (ret)
 			return ret;
-	} else if (kempld_pdev == pdev) {
-		pdata = dev_get_platdata(dev);
-	} else {
+	} else if (kempld_pdev != pdev) {
 		/*
 		 * The platform device we are probing is not the one we
 		 * registered in kempld_init using the DMI table, so this one
@@ -451,7 +420,7 @@ static int kempld_probe(struct platform_device *pdev)
 
 	pld->io_index = pld->io_base;
 	pld->io_data = pld->io_base + 1;
-	pld->pld_clock = pdata->pld_clock;
+	pld->pld_clock = KEMPLD_CLK;
 	pld->dev = dev;
 
 	mutex_init(&pld->lock);
@@ -463,15 +432,14 @@ static int kempld_probe(struct platform_device *pdev)
 static void kempld_remove(struct platform_device *pdev)
 {
 	struct kempld_device_data *pld = platform_get_drvdata(pdev);
-	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
 
 	mfd_remove_devices(&pdev->dev);
-	pdata->release_hardware_mutex(pld);
+	kempld_release_hardware_mutex(pld);
 }
 
 static const struct acpi_device_id kempld_acpi_table[] = {
-	{ "KEM0000", (kernel_ulong_t)&kempld_platform_data_generic },
-	{ "KEM0001", (kernel_ulong_t)&kempld_platform_data_generic },
+	{ "KEM0000" },
+	{ "KEM0001" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, kempld_acpi_table);
@@ -787,13 +755,13 @@ static int __init kempld_init(void)
 	if (force_device_id[0]) {
 		for (id = kempld_dmi_table; id->matches[0].slot != DMI_NONE; id++)
 			if (strstr(id->ident, force_device_id))
-				if (!kempld_create_platform_device(&kempld_platform_data_generic))
+				if (!kempld_create_platform_device())
 					break;
 		if (id->matches[0].slot == DMI_NONE)
 			return -ENODEV;
 	} else {
 		for (id = dmi_first_match(kempld_dmi_table); id; id = dmi_first_match(id+1))
-			if (kempld_create_platform_device(&kempld_platform_data_generic))
+			if (kempld_create_platform_device())
 				break;
 	}
 	return platform_driver_register(&kempld_driver);
diff --git a/include/linux/mfd/kempld.h b/include/linux/mfd/kempld.h
index 5d75071eaaea..d7a823ba1a7a 100644
--- a/include/linux/mfd/kempld.h
+++ b/include/linux/mfd/kempld.h
@@ -97,22 +97,10 @@ struct kempld_device_data {
 
 /**
  * struct kempld_platform_data - PLD hardware configuration structure
- * @pld_clock:			PLD clock frequency
  * @gpio_base:			GPIO base pin number
- * @ioresource:			IO addresses of the PLD
- * @get_hardware_mutex:		PLD specific get_mutex callback
- * @release_hardware_mutex:	PLD specific release_mutex callback
- * @get_info:			PLD specific get_info callback
- * @register_cells:		PLD specific register_cells callback
  */
 struct kempld_platform_data {
-	u32				pld_clock;
 	int				gpio_base;
-	struct resource			*ioresource;
-	void (*get_hardware_mutex)	(struct kempld_device_data *);
-	void (*release_hardware_mutex)	(struct kempld_device_data *);
-	int (*get_info)			(struct kempld_device_data *);
-	int (*register_cells)		(struct kempld_device_data *);
 };
 
 extern void kempld_get_mutex(struct kempld_device_data *pld);
-- 
2.56.0.rc1

