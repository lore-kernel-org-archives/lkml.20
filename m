Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D981E4BC006
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854600; cv=none; b=Cq7UydtJCSM6IwcafOnoP5zlxJIxNxn8dQ045rCk9ENwJyimPE/gKpbkvq6jy78PcNQrnvS01M/9DhFcwvf86DeW4oIFyhnvByRm973o1jLebvAq9FK/Kdjcv1S3hZa7htuABnn19gyC+IbbK+hfii2azhEwT3dH9mmAmTP564g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854600; c=relaxed/simple;
	bh=aTG/uz+tVhkKtaJIGX4Cd8rrk2gEkeMnqZ89kfxyTwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NsS/Ds56AAqj5lrjvotoH/fYwW/YQrDyEfLlgOcs2+HrfoAI2JYoxQDvvAtYwjq3+lX68ZnTVlj4BSQTaDS9iSCUmsXFeop/bPQoYwk/vWO2JkKMQ2UBry7sCvVDDbLOkov8AunCidcC7Wm4EMonKkty20olfY2ngLTpNzHZH68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdlg9N/3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdlg9N/3"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47de0093c42so128354f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854593; x=1788459393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dMiJJYqXk3kfgLrjtvNLpclwwx4oSYqJYc7envt2b2E=;
        b=gdlg9N/3Nh7FrKHvnG0KJ9xxCQJIB/t3cHnmOg3fPdNHkWMKUy/XzB7KxtQHFN28St
         sUdQiTazbl8JyE5JxI9lszwXhnqIL5kC3jYbKb9omzRv7y6AaO1zPzmFjScY4clIIarl
         ftRgp6g2HZDEO8I2csic24xECj9yPM2p+btAEgHnf+Qv5QsHGa03idiI2iI0tNEGI8Wp
         lKvXOPQ+xukVauqV2o7nfWzUwpHB4Za1x/3wh8VOPv911vPb0WHezCAhuDvMZAOp9cBW
         t0WBNZjl9oLa4Z3IHKrZGW58X55Ut5fvePQwtske+0cHoDd3oQsCtAzldCk+6Z55M9p1
         50Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854593; x=1788459393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dMiJJYqXk3kfgLrjtvNLpclwwx4oSYqJYc7envt2b2E=;
        b=ZBalRMeArQbxQOrnEDG7VHWEfwTeacM5kGShKWGwfFBaOFWxvrYKO3tU4SEBTkU/kv
         QDKWhCyUp2luTFVmwuY50JJr7ARniKmlsfcbuML/R0mysLYjHqoLwH6aMNigdfeTm035
         PvPcPR3YJp0dZougaUN9gPDHPXfZ4677wTZPJmAx790JkLHmBIbKR1SPyxW3J+18Q1TB
         OMO6jjQZLa/6A/8aKUbVdQ48nXm/W9sdD3Od0uv1Zgn80GgDRkC761GVqewjlRuOLpYL
         eEs91HvL5zE4SPEwLHJHTPAzPi5Y+kG6uT5kN3e+kADnL5JtoyYp5binRAZRLyVJ7HdC
         cPSw==
X-Gm-Message-State: AFuF++kS2uJji9cgLC1v1C9HYnGghC2U9h7ihZsF9F4A37asvKVbS8YF
	aE9kBm2j8s5xF/ARw6DHrm8oxp74kClSVCes1GKJ5SMnkiC+zMiBOVWf
X-Gm-Gg: AR+sD12J8/F8mpJoc88PSU+JWcT2dpYcrRybTn24qlyTs1/1KmMvz8NVLrXXltCTask
	au5uKdvgoMsVRAu4qozh6Jw9jil8ALOP1w//FN1oR90+ZmDpAciqOcNAGJIESEW36148dd+1y0C
	4s/s9+MZVJjucEiUr1hG7iV2YhXlpTO8xeTJ8sEsXs5/CCS2RuNJl84p51Xb+aX6YMAk4b+GrfQ
	0XWuLj5vQacAdVMmgOvAEMgJwb03Lce0Zx8my/+hobHRfERmGB7cKfT0DX2ef9vz8vaYlshHyV5
	y58zH89BT5D+AmaccrZcMu9dQOHLc/y9yKLggvADjaMC7keSJIUcQu4lpXitTH/x9IfF8uPfD2M
	q/+JiTKI9eo+h3CvDT2i3yqq7NRbC1663J4z9ETMtCOyYPc7LX2Lue8mm9jVFX28wcpN2DanpzY
	tYSXu3cNOFBeZsNTq0+st1BqBmQEXbkB/0oYZPJ3fmM6Xdibt62r59FamIY7lz/XPG3inz+zbg9
	L+YTZ4uxdmymLJQ2/hikZ1T3xoXWGG7lXQzm1EahFTg
X-Received: by 2002:a05:6000:381:b0:482:552f:ef68 with SMTP id ffacd0b85a97d-482f79ccac5mr817136f8f.19.1787854592778;
        Thu, 27 Aug 2026 11:16:32 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dbf33sm11328702f8f.23.2026.08.27.11.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:16:31 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 1/4] platform/x86: x86-android-tablets: Fix GPIO software node matching
Date: Thu, 27 Aug 2026 20:16:24 +0200
Message-ID: <20260827181627.2427880-2-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181627.2427880-1-mauriziocasciano7@gmail.com>
References: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
 <20260827181627.2427880-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio_secondary_fwnode_init() attaches each provider software node to the
ACPI device. The registered gpio_device has a different primary fwnode,
so gpio_device_find_by_fwnode() never sees that secondary node and
software-node GPIO consumers defer indefinitely.

Find the gpio_device by its matching label and attach the secondary node
directly to that device. Keep the returned reference until the managed
cleanup action unsets the node.

Fixes: 1448c2d2ca5c ("platform/x86: x86-android-tablets: enable fwnode matching of GPIO chips")
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 .../platform/x86/x86-android-tablets/core.c   | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 5db794d65eb5..8dfd15afdca2 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -16,6 +16,7 @@
 #include <linux/dmi.h>
 #include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/irq.h>
 #include <linux/module.h>
@@ -364,9 +365,10 @@ static const struct software_node *cherryview_gpiochip_node_group[] = {
 
 static void gpio_secondary_unset(void *data)
 {
-	struct device *dev = data;
+	struct gpio_device *gdev = data;
 
-	set_secondary_fwnode(dev, NULL);
+	set_secondary_fwnode(gpio_device_to_device(gdev), NULL);
+	gpio_device_put(gdev);
 }
 
 static void gpio_secondary_unregister_node_group(void *data)
@@ -396,20 +398,23 @@ static int gpio_secondary_fwnode_init(struct device *parent)
 		return ret;
 
 	for (swnode = gpiochip_node_group; *swnode; swnode++) {
-		struct device *dev __free(put_device) =
-				acpi_bus_find_device_by_name((*swnode)->name);
-		if (!dev)
+		struct gpio_device *gdev;
+
+		gdev = gpio_device_find_by_label((*swnode)->name);
+		if (!gdev)
 			return dev_err_probe(parent,
 					     -ENODEV, "Failed to find the required GPIO controller: %s\n",
 					     (*swnode)->name);
 
 		fwnode = software_node_fwnode(*swnode);
-		if (WARN_ON(!fwnode))
+		if (WARN_ON(!fwnode)) {
+			gpio_device_put(gdev);
 			return -ENOENT;
+		}
 
-		set_secondary_fwnode(dev, fwnode);
+		set_secondary_fwnode(gpio_device_to_device(gdev), fwnode);
 
-		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, dev);
+		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, gdev);
 		if (ret)
 			return ret;
 	}
-- 
2.53.0

