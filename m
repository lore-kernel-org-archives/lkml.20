Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDB13D3002
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303936; cv=none; b=TITcFnQYDcsw4ol7XL0tCgM1UWHXsby14EOnTyRS1K8ovuZQlgFocvcOC4OrhDTs99e5sCwPvq5ECUBRW+8PcM8ZAORdsemYluV06Q4i5IfOO0G5xoT/W0gJqMnMlLQUFfrM6WEIB0O6A94J9CHtJ20eWE7+UEus1oNnEWimKUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303936; c=relaxed/simple;
	bh=WbMfdK/eyZJynE1W/XkPmTttiyGMyXB1NhVqTfoICG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JnknzX+NQwv5q8N3alMNLxMQBCltVr+6tYu+h3nLEAwYrb/+JeJIGBxTIeNi5O2awsxyCy9BTjcl6SmbPzTKFS9rvg+Ao+bzDAVsDs1xTea7UyRKku8Hz6Jj04Zi6hJuTsZz/XAcEepBAg/2HZU+FV/74c8mTSieH+WKViB0kZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5SSu68H; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5SSu68H"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so2221898eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303934; x=1792908734; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNEBAbWY/CxdBni1bXmXRsfCsUtcrtBZszExfd59OMk=;
        b=T5SSu68HKT+8WxmMFITdF7S59LrLtc+BU4LGG+EFKMZ0t75hcRwYMu5e4Oy481sZdN
         52S/swBruKKvWwOSOhsDBFG/j0qohph0ZGBDPymr46fWBs496PQp6TeczJcRdAnZGgha
         BXGjBXHelh7BjMiKEfYetll+MrHw8sEsE+xeoj8r8zdxZZtVBo+avirIR5rUgNKXL8rt
         VpRWmKDMhUTqx8AWxHbLiyqUHlHjWEs+eeivbFA6B6uSbrHdEY4HIqmQq/b4B+ePyFoI
         iZk60Zmjfpo/jaL7soYYgjvIhHScqXpXlhJfTGqWwJge8FwcsxIRW+CA9BVejumg+BOx
         lzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303934; x=1792908734;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNEBAbWY/CxdBni1bXmXRsfCsUtcrtBZszExfd59OMk=;
        b=x0RwvmFNa/ZspUkhWkq0LvCD7GMvjLnq1r7OfvCYRbE93XqdWNiUYgl3ZHntMh7A7W
         vZRD7E5kPJqZdods1mDjZ6ffNqwidlIY3/vEr+u68xfu6cWnQ5vq3p0gPPiAGpj9GIVe
         unfrPwntZ0WFnqfTzKRDDTDvAYQ//DlaQrmHmwJvpCiCrSUEVrKxgI1DXfBZjU4U0E3x
         mMn6ujJHCP/joKAAn3IXhwQHMugkf9dlfNhbIxDw8bAMxTOJrO/vJbtHxXwuDReuL/R7
         cdGyMHM3nGq6xdXVV2UgaD98LpK7jpKzwZOgXLRzOdzhbscBA2tTSbyvvd3qIiNJfRrx
         XTlA==
X-Forwarded-Encrypted: i=1; AKwUvBxI04eCRBS2sE4Uh2YA3LzeVMx1PK2E02qZitcjxmbYM/JSJ4CnJ691B0MlZePa8xdrfEaqqCiKdwNZu98=@vger.kernel.org
X-Gm-Message-State: AFq9FYKK2XDLE4u9qIJTCYkQMdWeEruP9NROzTaPrkx6BhnPpFqJ/dl9
	HcMBZe+VHND/Pd7WdygR4fW20tGSd6Us0clkp2rzA79/fHpx04+Sbjiz
X-Gm-Gg: AYBFou3Kb9C3TMwW2VWgD0dKR+bRcOnw3Hk8HbXfjOri9AAfMWQ8n/TdishMigwIFRP
	7KYIF7zPe/To+UqIcpKXWhSrvXCmG8Tp8W/huytim1q/dBHuEreziYyc5xCvhrYjPC0J0CSozsc
	ulfCb6kHs8sVe95OYYWxz1c0hKj2vbPhxI8l9IOhse/fA+sprRnc1YbujDsgdSJAyrQWX7Iu9w5
	D2ZJTwsuWRGJklkHldGJndQMchE6h1niRp9NIrxG/65WwkUrBFSdufoueo9WSSRrjlr/0P+GU/w
	LwBNy8EjL8eLImWQCYIL5WeyB/7a/qyLjkEjv63VLBcK+To9j4VTgfmlhMCta7Bw1ssf4b4EE3W
	//8+6ZDg7VETgjhGk+IfhkvTrohwodgDEq53LLfRBuZkgWpYEPuo2EYUcM+e9RHs0YNX0v6lAz5
	adkaiVIzqMglXHih9lrQ55sayWOHmAN0zwu7G+E6AnyTAkDj4Qai6yqAgZ9x27YkgGZHhGIhcv/
	plgswP36OTZMJ0Gye4G5Bddtz4abfruEt5czuRRHel4MwwtvA==
X-Received: by 2002:a05:7301:470e:b0:358:8bd2:fda1 with SMTP id 5a478bee46e88-361a2649752mr6073652eec.30.1792303934037;
        Sat, 17 Oct 2026 23:12:14 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:297c:6f48:9e5:4e5b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm20989445eec.10.2026.10.17.23.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:12:13 -0700 (PDT)
Date: Sat, 17 Oct 2026 23:12:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: da9055_onkey - switch to using managed resources
Message-ID: <atRjCWI0PXs840rl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Switch the driver to use devm_input_allocate_device(),
devm_delayed_work_autocancel(), and devm_request_threaded_irq() to
simplify error handling in probe and drop the remove() callback (which
also had a leftover broken regmap_irq_get_virq() call on an already
mapped virtual IRQ). Also use input_set_capability() to advertise
KEY_POWER support and drop unneeded error messages.

Reported-by: Myeonghun Pak <mhun512@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/da9055_onkey.c | 59 ++++++++-----------------------
 1 file changed, 15 insertions(+), 44 deletions(-)

diff --git a/drivers/input/misc/da9055_onkey.c b/drivers/input/misc/da9055_onkey.c
index 3e4fc2f01011..25845106b920 100644
--- a/drivers/input/misc/da9055_onkey.c
+++ b/drivers/input/misc/da9055_onkey.c
@@ -7,6 +7,7 @@
  * Author: David Dajun Chen <dchen@diasemi.com>
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/input.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -45,7 +46,6 @@ static void da9055_onkey_query(struct da9055_onkey *onkey)
 	 */
 	if (key_stat)
 		schedule_delayed_work(&onkey->work, msecs_to_jiffies(10));
-
 }
 
 static void da9055_onkey_work(struct work_struct *work)
@@ -80,72 +80,43 @@ static int da9055_onkey_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	onkey = devm_kzalloc(&pdev->dev, sizeof(*onkey), GFP_KERNEL);
-	if (!onkey) {
-		dev_err(&pdev->dev, "Failed to allocate memory\n");
+	if (!onkey)
 		return -ENOMEM;
-	}
 
-	input_dev = input_allocate_device();
-	if (!input_dev) {
-		dev_err(&pdev->dev, "Failed to allocate memory\n");
+	input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!input_dev)
 		return -ENOMEM;
-	}
 
 	onkey->input = input_dev;
 	onkey->da9055 = da9055;
 	input_dev->name = "da9055-onkey";
 	input_dev->phys = "da9055-onkey/input0";
-	input_dev->dev.parent = &pdev->dev;
 
-	input_dev->evbit[0] = BIT_MASK(EV_KEY);
-	__set_bit(KEY_POWER, input_dev->keybit);
+	input_set_capability(input_dev, EV_KEY, KEY_POWER);
 
-	INIT_DELAYED_WORK(&onkey->work, da9055_onkey_work);
+	err = devm_delayed_work_autocancel(&pdev->dev, &onkey->work,
+					   da9055_onkey_work);
+	if (err)
+		return err;
 
-	err = request_threaded_irq(irq, NULL, da9055_onkey_irq,
-				   IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
-				   "ONKEY", onkey);
-	if (err < 0) {
-		dev_err(&pdev->dev,
-			"Failed to register ONKEY IRQ %d, error = %d\n",
-			irq, err);
-		goto err_free_input;
-	}
+	err = devm_request_threaded_irq(&pdev->dev, irq, NULL, da9055_onkey_irq,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					"ONKEY", onkey);
+	if (err)
+		return err;
 
 	err = input_register_device(input_dev);
 	if (err) {
 		dev_err(&pdev->dev, "Unable to register input device, %d\n",
 			err);
-		goto err_free_irq;
+		return err;
 	}
 
-	platform_set_drvdata(pdev, onkey);
-
 	return 0;
-
-err_free_irq:
-	free_irq(irq, onkey);
-	cancel_delayed_work_sync(&onkey->work);
-err_free_input:
-	input_free_device(input_dev);
-
-	return err;
-}
-
-static void da9055_onkey_remove(struct platform_device *pdev)
-{
-	struct da9055_onkey *onkey = platform_get_drvdata(pdev);
-	int irq = platform_get_irq_byname(pdev, "ONKEY");
-
-	irq = regmap_irq_get_virq(onkey->da9055->irq_data, irq);
-	free_irq(irq, onkey);
-	cancel_delayed_work_sync(&onkey->work);
-	input_unregister_device(onkey->input);
 }
 
 static struct platform_driver da9055_onkey_driver = {
 	.probe	= da9055_onkey_probe,
-	.remove	= da9055_onkey_remove,
 	.driver	= {
 		.name	= "da9055-onkey",
 	},
-- 
2.56.0.176.g3575e65682-goog


-- 
Dmitry
