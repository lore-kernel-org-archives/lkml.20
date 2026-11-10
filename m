Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794278144;
	b=qhQK9TZVk1de0EqL8CrkrDui1wYpbGB8/AA3A15PkW9BwyC77H/WTy+Va+CWRAYEscMH
	 PmMN3lhLGG1vPwUwEMY265qVbQTk39+kPRpS6EkVT/8KKzcb1Dmeh4C+c4fH1kAJGTE7Z
	 Z/tu15CCN/2aE+VKCh+3C6sp4BbK2i4bybeVgOk3JP8TS36L8dv3fQgvlOx+RQmHb+9Ft
	 ybdmWab74YiLA82HMK++KIDJA1J9t46kDeabPfZaW0CDsvBzbuNsFq+wkqE3k3UIeT+F2
	 SiPzYrjFwXNhgrgSfHxp3o7BOs/IogJpFyEtJBNerO1lRzQRCE6gI46Hw7EL3xa8unA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4b8VMR0ToT11MGOGDl7IQcBDkYw4JTHYnJZ3xagfNUE=;
	b=WVUmt87SYz1VOFEBYkke5oU+a4Cx1+XWCKc1zCR5ov8omx8CKvsj4L8SNxkSGmnmDMFx
	 BS+sT7dhbkz/Sspt/7j1UbpHQO6BkEdU+se2ztG9vmdCFw1+3FBckKk3dFuvTwpxt5v8T
	 erfDleQYmzp7JBGb71KlXu1hTFsUmfSGvB0xcFTzEws7oq3gNabFAUG94OHzYWg2PM/22
	 3Jbi8faUrOL4jCeKCxn1Q0oNKag9BC0dr/vpqGfUnritIHUaP4ZrWumJjfUGPhb7K1DvP
	 lOHoaiSAgS2NRr3eBV18Wg5AnP3X6yNoRYHf4IXSWmas7xWHxvU1EcwYkvWO8maUuCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZJa/DLkb";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26F2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D26F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJa/DLkb
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d30639709so191339066b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:35:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794278141; cv=none;
        d=google.com; s=arc-20260327;
        b=PaBM4Skvjc2DcP/cVAIndNBvnfqOu80SLriPGecowdj5A90o90ez0UEsza7ZbIv3kp
         ltABZ3tFH2hIDoclZ5apEhEpTmN0cpvGfk/4RMuo/1Sc7ogZtHwDyq4SVkFtIChI28IC
         YnI83j8szBOvdedo0fK6eYfXNa/JMjKS9/f3G728nS4QMqhueOEzbpIcvx22/EACAnHM
         z7Spa7/VEuc/yY9dqitPFNSfAqJhZGxxb5T0R1e9MtKLmNMt9+PM182DH2BJQocDqe1o
         /bJbZDMswV+Y1y8I4/aBG7whuzuVINUxgFKiGJ2nru533WQjoIJUZwxBaNr7f63RjS63
         yFTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=4b8VMR0ToT11MGOGDl7IQcBDkYw4JTHYnJZ3xagfNUE=;
        fh=p9X6/Eh4+SW7cI56Gl7NehJsDv9s2B9YoD8bq5r1pas=;
        b=YQJQRzTP0jFdY5SkwHbKoxBMMTsvCozS3955EO27zmFxhiMMq9rsplBl1VtQrgVU3Z
         ItY58x8L6Cdb3ZXmj6HpYEuuqOwjVJjxDTF0HscuUMwwOWa7zROPsIjwrSitd9pVqiOY
         48oCxYBOVldrpWMF/kv1Xb4AkDEzF274tE1ZKmB31X5/8YHEq0RBfLVEYFZsOB7r0HgR
         Tbzj5qvqDC7PSRh3afkzA4P3dmFfGJLDwbCduFcJeFedXVs2KmrtkyOBspCbSyeQqOx1
         2NespDQozRJHPisBeY0UjndrJNZSSodQoXgnQhf/LhK5KbWP+soTc7btVdEaACONVo4w
         rNnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278141; x=1794882941; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4b8VMR0ToT11MGOGDl7IQcBDkYw4JTHYnJZ3xagfNUE=;
        b=ZJa/DLkbwFK13GYxif9rrBk9ZFMepmH7kYdlzvkEiIJhXqMFFQEbBTJOa2BkwztIem
         X1tAX5wYK/JV07jx3lDJonCdEFnL0fAlA+FfEm76mlqR5zB8k/FvXPQ9OnKhfXh2gJuX
         dgWJ1jVuYiRXaOL4T6zNpkJN5SWltL/abyNxbghyyvg8/15mNS4WiLQZn0T1eWLVs/T5
         +uXmdJDZgOnwBFpuK/P6vNLzxZ9EDrhRPYN9XpJpPEU/lHdQUnH7L8MyUQ1pAKTsYAD+
         XWvnGYdcjCBiL5vf7xcaDBVnYonKkyGDkSYytToSziNyJ59kFqvXYKcjc83pSAAP23Fp
         DgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278141; x=1794882941;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4b8VMR0ToT11MGOGDl7IQcBDkYw4JTHYnJZ3xagfNUE=;
        b=VYJs0LDxayqUW9aFAG0IIkHuESlAg35wDt/hLiyh+9f7MwMRQwiDl7IH/ZbNy0N3sI
         NpjmyRXGatY78RVsIOrPhLKvevEGC1S8k+lipmy+7+xulmNNEYyrcuSzwKi2gc77nNON
         r63cAtFfahtziZICJxupvqU1ZroCkDykw2NEg8aVt/yymlaGt2z4S2MTBhImloPgQZPu
         +Y3MCf3IPhuG7jv9dC5/SF01B2/b7Hk/JLh5u3zNhs1O7O3ix1mZew76cLMkNrXLXMLO
         o5Gaoh/oD72TAmlG0ff4lhzL1yjbqZwUH2YlLyBNhB1bz/s/vO0JmReJBPWEbtaqPgU/
         d6Xg==
X-Forwarded-Encrypted: i=1; AL+hErHdsf54lFG0jZqr5Z9XDrknsRCAIDQmKMokSNYRjyvWvb2IcX1hp0K3lDr3KGUvTJMGZ2EdCwhJ7gqHZdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hWjLngXmkoFuaHgHKVpRhBHISPLvo3AMZJfjKtUqSVuN6hQ4E
	ys3Eqs+HOaoed49FYtttFlaO92um+ygDNzj6ciNXxo8/w0vi7OYnPvHRAzxr35gOIhrQvma6VdD
	KVJcYapH1J/qc0cFPnFK6RMgq7YnqYQ==
X-Gm-Gg: AYBFou2Jw/1ebR/s0sCsMOFOkoFdc7Xu9tvzITpLJIY6NUwf0r7CgHNbqwezF/JCJ2f
	ZGlzIrX1bL10PfmVtmlk/p2/UFWJibFCbiHbNWb27knsGW20+lrXNwSMZAvaoAVMETY33S+/NBR
	ENKJd+L+JdrsyouEImv+67nUsV6AYVqv2aCr6ES97uGdCz0EsPbalqPPxQ8upbyLaG/USJbAiWL
	dPjYjSms1DKr0evVd07W5STe3M8GFIVomV9KImg4j6uUoRhogOfSZFZTTiQZ+UXHYhdQlruHCaU
	jfUCROyu8vD4gF+OHKq3IUxIiD+GAs8GPJnrSLs8xOgGVT/SfWzMqldhDm5FGItbyUMktSWNto2
	sUc1l7o6YoAIVRNV9cltKnLKjCQhtuOVdtRYH2tnGKxXWulfc46mKMmR07zztSUNcODhDvXgzhK
	kNLOfyB4m2Fprh6bQ9ISoewJ7OKuDIrHkTHk6npet01Bjo
X-Received: by 2002:a17:906:ef01:b0:c31:8c48:e18b with SMTP id
 a640c23a62f3a-c50494b5468mr87905566b.14.1794278141251; Mon, 09 Nov 2026
 18:35:41 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 10 Nov 2026 02:35:39 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
In-Reply-To: <CAGEsz8Gb=4JS4OAFKppe=LW6JYa2ssJ8APdJJX2Ou_BhzEvZxg@mail.gmail.com>
References: <CAGEsz8Gb=4JS4OAFKppe=LW6JYa2ssJ8APdJJX2Ou_BhzEvZxg@mail.gmail.com>
Date: Tue, 10 Nov 2026 02:35:39 +0000
X-Gm-Features: AclHuK8a2vf6Kdy8AdU3IyQjeInaPjr1EXSZeWDCZfS69AY6Gnq0Va-6HMxz_ls
Message-ID: <CAGEsz8FyKXrsy2GFmBO16mTN+d0KteHk-e7QoO3VsfHdeHs79g@mail.gmail.com>
Subject: [PATCH v2 2/2] mfd: wm831x: Align child IRQ resources and lifetime
To: Lee Jones <lee@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Ijae Kim <ae878000@gmail.com>, 
	patches@opensource.cirrus.com, mfd@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Onkey removal and battery IRQ error cleanup free unmapped platform IRQs
instead of the requested Linux IRQs. This can leave handlers registered
after their data is freed.

Pass the IRQ domain to MFD and use mapped resources in the children.
Manage onkey IRQ/work cleanup and unwind consumers before disposing IRQ
mappings on initialization failure. Retain polling for key release.

This issue was found by our static analysis tool under development.

Fixes: cd99758ba3bd ("mfd: Convert wm831x to irq_domain")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
No hardware testing.

diff --git a/drivers/input/misc/wm831x-on.c b/drivers/input/misc/wm831x-on.c
index 891f498ea..f8e49ac27 100644
--- a/drivers/input/misc/wm831x-on.c
+++ b/drivers/input/misc/wm831x-on.c
@@ -25,6 +25,7 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/workqueue.h>
+#include <linux/devm-helpers.h>
 #include <linux/mfd/wm831x/core.h>

 struct wm831x_on {
@@ -72,9 +73,12 @@ static int wm831x_on_probe(struct platform_device *pdev)
 {
 	struct wm831x *wm831x = dev_get_drvdata(pdev->dev.parent);
 	struct wm831x_on *wm831x_on;
-	int irq = wm831x_irq(wm831x, platform_get_irq(pdev, 0));
+	int irq = platform_get_irq(pdev, 0);
 	int ret;

+	if (irq < 0)
+		return irq;
+
 	wm831x_on = devm_kzalloc_obj(&pdev->dev, struct wm831x_on);
 	if (!wm831x_on) {
 		dev_err(&pdev->dev, "Can't allocate data\n");
@@ -82,13 +86,11 @@ static int wm831x_on_probe(struct platform_device *pdev)
 	}

 	wm831x_on->wm831x = wm831x;
-	INIT_DELAYED_WORK(&wm831x_on->work, wm831x_poll_on);

 	wm831x_on->dev = devm_input_allocate_device(&pdev->dev);
 	if (!wm831x_on->dev) {
 		dev_err(&pdev->dev, "Can't allocate input dev\n");
-		ret = -ENOMEM;
-		goto err;
+		return -ENOMEM;
 	}

 	wm831x_on->dev->evbit[0] = BIT_MASK(EV_KEY);
@@ -96,43 +98,28 @@ static int wm831x_on_probe(struct platform_device *pdev)
 	wm831x_on->dev->name = "wm831x_on";
 	wm831x_on->dev->phys = "wm831x_on/input0";

-	ret = request_threaded_irq(irq, NULL, wm831x_on_irq,
-				   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
-				   "wm831x_on",
-				   wm831x_on);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Unable to request IRQ: %d\n", ret);
-		goto err_input_dev;
-	}
 	ret = input_register_device(wm831x_on->dev);
 	if (ret) {
 		dev_dbg(&pdev->dev, "Can't register input device: %d\n", ret);
-		goto err_irq;
+		return ret;
 	}

-	platform_set_drvdata(pdev, wm831x_on);
+	ret = devm_delayed_work_autocancel(&pdev->dev, &wm831x_on->work,
+					   wm831x_poll_on);
+	if (ret)
+		return ret;

-	return 0;
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, wm831x_on_irq,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					"wm831x_on", wm831x_on);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Unable to request IRQ\n");

-err_irq:
-	free_irq(irq, wm831x_on);
-err_input_dev:
-err:
-	return ret;
-}
-
-static void wm831x_on_remove(struct platform_device *pdev)
-{
-	struct wm831x_on *wm831x_on = platform_get_drvdata(pdev);
-	int irq = platform_get_irq(pdev, 0);
-
-	free_irq(irq, wm831x_on);
-	cancel_delayed_work_sync(&wm831x_on->work);
+	return 0;
 }

 static struct platform_driver wm831x_on_driver = {
 	.probe		= wm831x_on_probe,
-	.remove		= wm831x_on_remove,
 	.driver		= {
 		.name	= "wm831x-on",
 	},
diff --git a/drivers/input/touchscreen/wm831x-ts.c
b/drivers/input/touchscreen/wm831x-ts.c
index 32b03889a..3651c2cd4 100644
--- a/drivers/input/touchscreen/wm831x-ts.c
+++ b/drivers/input/touchscreen/wm831x-ts.c
@@ -255,14 +255,11 @@ static int wm831x_ts_probe(struct platform_device *pdev)
 	 * If we have a direct IRQ use it, otherwise use the interrupt
 	 * from the WM831x IRQ controller.
 	 */
-	wm831x_ts->data_irq = wm831x_irq(wm831x,
-					 platform_get_irq_byname(pdev,
-								 "TCHDATA"));
+	wm831x_ts->data_irq = platform_get_irq_byname(pdev, "TCHDATA");
 	if (pdata && pdata->data_irq)
 		wm831x_ts->data_irq = pdata->data_irq;

-	wm831x_ts->pd_irq = wm831x_irq(wm831x,
-				       platform_get_irq_byname(pdev, "TCHPD"));
+	wm831x_ts->pd_irq = platform_get_irq_byname(pdev, "TCHPD");
 	if (pdata && pdata->pd_irq)
 		wm831x_ts->pd_irq = pdata->pd_irq;

diff --git a/drivers/mfd/wm831x-auxadc.c b/drivers/mfd/wm831x-auxadc.c
index 6280d4f38..e3357918b 100644
--- a/drivers/mfd/wm831x-auxadc.c
+++ b/drivers/mfd/wm831x-auxadc.c
@@ -285,3 +285,10 @@ void wm831x_auxadc_init(struct wm831x *wm831x)
 	if (!wm831x->auxadc_read)
 		wm831x->auxadc_read = wm831x_auxadc_read_polled;
 }
+
+void wm831x_auxadc_exit(struct wm831x *wm831x)
+{
+	if (wm831x->auxadc_read == wm831x_auxadc_read_irq)
+		free_irq(irq_find_mapping(wm831x->irq_domain,
+					  WM831X_IRQ_AUXADC_DATA), wm831x);
+}
diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
index df8e76e00..008e19f33 100644
--- a/drivers/mfd/wm831x-core.c
+++ b/drivers/mfd/wm831x-core.c
@@ -662,14 +662,6 @@ static const struct resource
wm8320_dcdc4_buck_resources[] = {
 	DEFINE_RES_IRQ_NAMED(WM831X_IRQ_UV_DC4, "UV"),
 };

-static const struct resource wm831x_gpio_resources[] = {
-	{
-		.start = WM831X_IRQ_GPIO_1,
-		.end   = WM831X_IRQ_GPIO_16,
-		.flags = IORESOURCE_IRQ,
-	},
-};
-
 static const struct resource wm831x_isink1_resources[] = {
 	{
 		.start = WM831X_CURRENT_SINK_1,
@@ -876,8 +868,6 @@ static const struct mfd_cell wm8310_devs[] = {
 	},
 	{
 		.name = "wm831x-gpio",
-		.num_resources = ARRAY_SIZE(wm831x_gpio_resources),
-		.resources = wm831x_gpio_resources,
 	},
 	{
 		.name = "wm831x-hwmon",
@@ -1030,8 +1020,6 @@ static const struct mfd_cell wm8311_devs[] = {
 	},
 	{
 		.name = "wm831x-gpio",
-		.num_resources = ARRAY_SIZE(wm831x_gpio_resources),
-		.resources = wm831x_gpio_resources,
 	},
 	{
 		.name = "wm831x-hwmon",
@@ -1160,8 +1148,6 @@ static const struct mfd_cell wm8312_devs[] = {
 	},
 	{
 		.name = "wm831x-gpio",
-		.num_resources = ARRAY_SIZE(wm831x_gpio_resources),
-		.resources = wm831x_gpio_resources,
 	},
 	{
 		.name = "wm831x-hwmon",
@@ -1306,8 +1292,6 @@ static const struct mfd_cell wm8320_devs[] = {
 	},
 	{
 		.name = "wm831x-gpio",
-		.num_resources = ARRAY_SIZE(wm831x_gpio_resources),
-		.resources = wm831x_gpio_resources,
 	},
 	{
 		.name = "wm831x-hwmon",
@@ -1622,27 +1606,27 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 	case WM8310:
 		ret = mfd_add_devices(wm831x->dev, wm831x_num,
 				      wm8310_devs, ARRAY_SIZE(wm8310_devs),
-				      NULL, 0, NULL);
+				      NULL, 0, wm831x->irq_domain);
 		break;

 	case WM8311:
 		ret = mfd_add_devices(wm831x->dev, wm831x_num,
 				      wm8311_devs, ARRAY_SIZE(wm8311_devs),
-				      NULL, 0, NULL);
-		if (!pdata->disable_touch)
-			mfd_add_devices(wm831x->dev, wm831x_num,
-					touch_devs, ARRAY_SIZE(touch_devs),
-					NULL, 0, NULL);
+				      NULL, 0, wm831x->irq_domain);
+		if (!ret && !pdata->disable_touch)
+			ret = mfd_add_devices(wm831x->dev, wm831x_num,
+					      touch_devs, ARRAY_SIZE(touch_devs),
+					      NULL, 0, wm831x->irq_domain);
 		break;

 	case WM8312:
 		ret = mfd_add_devices(wm831x->dev, wm831x_num,
 				      wm8312_devs, ARRAY_SIZE(wm8312_devs),
-				      NULL, 0, NULL);
-		if (!pdata->disable_touch)
-			mfd_add_devices(wm831x->dev, wm831x_num,
-					touch_devs, ARRAY_SIZE(touch_devs),
-					NULL, 0, NULL);
+				      NULL, 0, wm831x->irq_domain);
+		if (!ret && !pdata->disable_touch)
+			ret = mfd_add_devices(wm831x->dev, wm831x_num,
+					      touch_devs, ARRAY_SIZE(touch_devs),
+					      NULL, 0, wm831x->irq_domain);
 		break;

 	case WM8320:
@@ -1651,7 +1635,7 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 	case WM8326:
 		ret = mfd_add_devices(wm831x->dev, wm831x_num,
 				      wm8320_devs, ARRAY_SIZE(wm8320_devs),
-				      NULL, 0, NULL);
+				      NULL, 0, wm831x->irq_domain);
 		break;

 	default:
@@ -1676,7 +1660,7 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 	if (ret & WM831X_XTAL_ENA) {
 		ret = mfd_add_devices(wm831x->dev, wm831x_num,
 				      rtc_devs, ARRAY_SIZE(rtc_devs),
-				      NULL, 0, NULL);
+				      NULL, 0, wm831x->irq_domain);
 		if (ret != 0) {
 			dev_err(wm831x->dev, "Failed to add RTC: %d\n", ret);
 			goto err_irq;
@@ -1689,7 +1673,7 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 		/* Treat errors as non-critical */
 		ret = mfd_add_devices(wm831x->dev, wm831x_num, backlight_devs,
 				      ARRAY_SIZE(backlight_devs), NULL,
-				      0, NULL);
+				      0, wm831x->irq_domain);
 		if (ret < 0)
 			dev_err(wm831x->dev, "Failed to add backlight: %d\n",
 				ret);
@@ -1708,7 +1692,10 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 	return 0;

 err_irq:
+	mfd_remove_devices(wm831x->dev);
+	wm831x_auxadc_exit(wm831x);
 	wm831x_irq_exit(wm831x);
+	return ret;
 err:
 	mfd_remove_devices(wm831x->dev);
 	return ret;
diff --git a/drivers/mfd/wm831x-irq.c b/drivers/mfd/wm831x-irq.c
index defd5f173..200802612 100644
--- a/drivers/mfd/wm831x-irq.c
+++ b/drivers/mfd/wm831x-irq.c
@@ -595,6 +595,8 @@ int wm831x_irq_init(struct wm831x *wm831x, int irq)

 	if (!domain) {
 		dev_warn(wm831x->dev, "Failed to allocate IRQ domain\n");
+		if (irq_base)
+			irq_free_descs(irq_base, WM831X_NUM_IRQS);
 		return -EINVAL;
 	}

@@ -606,10 +608,20 @@ int wm831x_irq_init(struct wm831x *wm831x, int irq)
 	wm831x_set_bits(wm831x, WM831X_IRQ_CONFIG,
 			WM831X_IRQ_OD, i);

-	wm831x->irq = irq;
 	wm831x->irq_domain = domain;

 	if (irq) {
+		ret = request_threaded_irq(irq, NULL, wm831x_irq_thread,
+					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+					   "wm831x", wm831x);
+		if (ret != 0) {
+			dev_err(wm831x->dev, "Failed to request IRQ %d: %d\n",
+				irq, ret);
+			wm831x_irq_exit(wm831x);
+			return ret;
+		}
+		wm831x->irq = irq;
+
 		/* Try to flag /IRQ as a wake source; there are a number of
 		 * unconditional wake sources in the PMIC so this isn't
 		 * conditional but we don't actually care *too* much if it
@@ -620,15 +632,8 @@ int wm831x_irq_init(struct wm831x *wm831x, int irq)
 			dev_warn(wm831x->dev,
 				 "Can't enable IRQ as wake source: %d\n",
 				 ret);
-		}
-
-		ret = request_threaded_irq(irq, NULL, wm831x_irq_thread,
-					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
-					   "wm831x", wm831x);
-		if (ret != 0) {
-			dev_err(wm831x->dev, "Failed to request IRQ %d: %d\n",
-				irq, ret);
-			return ret;
+		} else {
+			wm831x->irq_wake = true;
 		}
 	} else {
 		dev_warn(wm831x->dev,
@@ -643,6 +648,15 @@ int wm831x_irq_init(struct wm831x *wm831x, int irq)

 void wm831x_irq_exit(struct wm831x *wm831x)
 {
-	if (wm831x->irq)
+	int i;
+
+	if (wm831x->irq) {
+		if (wm831x->irq_wake)
+			disable_irq_wake(wm831x->irq);
 		free_irq(wm831x->irq, wm831x);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(wm831x_irqs); i++)
+		irq_dispose_mapping(irq_find_mapping(wm831x->irq_domain, i));
+	irq_domain_remove(wm831x->irq_domain);
 }
diff --git a/drivers/power/supply/wm831x_power.c
b/drivers/power/supply/wm831x_power.c
index d4e85c233..c5914f13d 100644
--- a/drivers/power/supply/wm831x_power.c
+++ b/drivers/power/supply/wm831x_power.c
@@ -616,7 +616,7 @@ static int wm831x_power_probe(struct platform_device *pdev)
 		}
 	}

-	irq = wm831x_irq(wm831x, platform_get_irq_byname(pdev, "SYSLO"));
+	irq = platform_get_irq_byname(pdev, "SYSLO");
 	ret = request_threaded_irq(irq, NULL, wm831x_syslo_irq,
 				   IRQF_TRIGGER_RISING | IRQF_ONESHOT, "System power low",
 				   power);
@@ -626,7 +626,7 @@ static int wm831x_power_probe(struct platform_device *pdev)
 		goto err_battery;
 	}

-	irq = wm831x_irq(wm831x, platform_get_irq_byname(pdev, "PWR SRC"));
+	irq = platform_get_irq_byname(pdev, "PWR SRC");
 	ret = request_threaded_irq(irq, NULL, wm831x_pwr_src_irq,
 				   IRQF_TRIGGER_RISING | IRQF_ONESHOT, "Power source",
 				   power);
@@ -637,9 +637,7 @@ static int wm831x_power_probe(struct platform_device *pdev)
 	}

 	for (i = 0; i < ARRAY_SIZE(wm831x_bat_irqs); i++) {
-		irq = wm831x_irq(wm831x,
-				 platform_get_irq_byname(pdev,
-							 wm831x_bat_irqs[i]));
+		irq = platform_get_irq_byname(pdev, wm831x_bat_irqs[i]);
 		ret = request_threaded_irq(irq, NULL, wm831x_bat_irq,
 					   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					   wm831x_bat_irqs[i],
@@ -686,10 +684,10 @@ static int wm831x_power_probe(struct
platform_device *pdev)
 		irq = platform_get_irq_byname(pdev, wm831x_bat_irqs[i]);
 		free_irq(irq, power);
 	}
-	irq = wm831x_irq(wm831x, platform_get_irq_byname(pdev, "PWR SRC"));
+	irq = platform_get_irq_byname(pdev, "PWR SRC");
 	free_irq(irq, power);
 err_syslo:
-	irq = wm831x_irq(wm831x, platform_get_irq_byname(pdev, "SYSLO"));
+	irq = platform_get_irq_byname(pdev, "SYSLO");
 	free_irq(irq, power);
 err_battery:
 err_usb:
@@ -701,7 +699,6 @@ static int wm831x_power_probe(struct platform_device *pdev)
 static void wm831x_power_remove(struct platform_device *pdev)
 {
 	struct wm831x_power *wm831x_power = platform_get_drvdata(pdev);
-	struct wm831x *wm831x = wm831x_power->wm831x;
 	int irq, i;

 	if (wm831x_power->usb_phy) {
@@ -710,16 +707,14 @@ static void wm831x_power_remove(struct
platform_device *pdev)
 	}

 	for (i = 0; i < ARRAY_SIZE(wm831x_bat_irqs); i++) {
-		irq = wm831x_irq(wm831x,
-				 platform_get_irq_byname(pdev,
-							 wm831x_bat_irqs[i]));
+		irq = platform_get_irq_byname(pdev, wm831x_bat_irqs[i]);
 		free_irq(irq, wm831x_power);
 	}

-	irq = wm831x_irq(wm831x, platform_get_irq_byname(pdev, "PWR SRC"));
+	irq = platform_get_irq_byname(pdev, "PWR SRC");
 	free_irq(irq, wm831x_power);

-	irq = wm831x_irq(wm831x, platform_get_irq_byname(pdev, "SYSLO"));
+	irq = platform_get_irq_byname(pdev, "SYSLO");
 	free_irq(irq, wm831x_power);
 }

diff --git a/drivers/regulator/wm831x-dcdc.c b/drivers/regulator/wm831x-dcdc.c
index 2036735f0..5ce7cbb36 100644
--- a/drivers/regulator/wm831x-dcdc.c
+++ b/drivers/regulator/wm831x-dcdc.c
@@ -470,7 +470,7 @@ static int wm831x_buckv_probe(struct platform_device *pdev)
 		goto err;
 	}

-	irq = wm831x_irq(wm831x, platform_get_irq_byname(pdev, "UV"));
+	irq = platform_get_irq_byname(pdev, "UV");
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					wm831x_dcdc_uv_irq,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
@@ -481,7 +481,7 @@ static int wm831x_buckv_probe(struct platform_device *pdev)
 		goto err;
 	}

-	irq = wm831x_irq(wm831x, platform_get_irq_byname(pdev, "HC"));
+	irq = platform_get_irq_byname(pdev, "HC");
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					wm831x_dcdc_oc_irq,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
@@ -608,7 +608,7 @@ static int wm831x_buckp_probe(struct platform_device *pdev)
 		goto err;
 	}

-	irq = wm831x_irq(wm831x, platform_get_irq_byname(pdev, "UV"));
+	irq = platform_get_irq_byname(pdev, "UV");
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					wm831x_dcdc_uv_irq,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
@@ -726,7 +726,7 @@ static int wm831x_boostp_probe(struct platform_device *pdev)
 		return ret;
 	}

-	irq = wm831x_irq(wm831x, platform_get_irq_byname(pdev, "UV"));
+	irq = platform_get_irq_byname(pdev, "UV");
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					wm831x_dcdc_uv_irq,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
diff --git a/drivers/regulator/wm831x-isink.c b/drivers/regulator/wm831x-isink.c
index 5afd3094b..5c1cbaf66 100644
--- a/drivers/regulator/wm831x-isink.c
+++ b/drivers/regulator/wm831x-isink.c
@@ -160,7 +160,7 @@ static int wm831x_isink_probe(struct platform_device *pdev)
 		goto err;
 	}

-	irq = wm831x_irq(wm831x, platform_get_irq(pdev, 0));
+	irq = platform_get_irq(pdev, 0);
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					wm831x_isink_irq,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
diff --git a/drivers/regulator/wm831x-ldo.c b/drivers/regulator/wm831x-ldo.c
index 34a6d6cf7..7c91edb3f 100644
--- a/drivers/regulator/wm831x-ldo.c
+++ b/drivers/regulator/wm831x-ldo.c
@@ -279,7 +279,7 @@ static int wm831x_gp_ldo_probe(struct platform_device *pdev)
 		goto err;
 	}

-	irq = wm831x_irq(wm831x, platform_get_irq_byname(pdev, "UV"));
+	irq = platform_get_irq_byname(pdev, "UV");
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					wm831x_ldo_uv_irq,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
@@ -490,7 +490,7 @@ static int wm831x_aldo_probe(struct platform_device *pdev)
 		goto err;
 	}

-	irq = wm831x_irq(wm831x, platform_get_irq_byname(pdev, "UV"));
+	irq = platform_get_irq_byname(pdev, "UV");
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					wm831x_ldo_uv_irq,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
diff --git a/drivers/rtc/rtc-wm831x.c b/drivers/rtc/rtc-wm831x.c
index 1943cb1eb..35b09747d 100644
--- a/drivers/rtc/rtc-wm831x.c
+++ b/drivers/rtc/rtc-wm831x.c
@@ -402,7 +402,7 @@ static int wm831x_rtc_probe(struct platform_device *pdev)
 {
 	struct wm831x *wm831x = dev_get_drvdata(pdev->dev.parent);
 	struct wm831x_rtc *wm831x_rtc;
-	int alm_irq = wm831x_irq(wm831x, platform_get_irq_byname(pdev, "ALM"));
+	int alm_irq = platform_get_irq_byname(pdev, "ALM");
 	int ret = 0;

 	wm831x_rtc = devm_kzalloc_obj(&pdev->dev, *wm831x_rtc);
diff --git a/include/linux/mfd/wm831x/core.h b/include/linux/mfd/wm831x/core.h
index 511bcad87..0e34a39b6 100644
--- a/include/linux/mfd/wm831x/core.h
+++ b/include/linux/mfd/wm831x/core.h
@@ -368,6 +368,7 @@ struct wm831x {
 	enum wm831x_parent type;

 	int irq;  /* Our chip IRQ */
+	bool irq_wake;
 	struct mutex irq_lock;
 	struct irq_domain *irq_domain;
 	int irq_masks_cur[WM831X_NUM_IRQ_REGS];   /* Currently active value */
@@ -418,6 +419,7 @@ void wm831x_device_shutdown(struct wm831x *wm831x);
 int wm831x_irq_init(struct wm831x *wm831x, int irq);
 void wm831x_irq_exit(struct wm831x *wm831x);
 void wm831x_auxadc_init(struct wm831x *wm831x);
+void wm831x_auxadc_exit(struct wm831x *wm831x);

 static inline int wm831x_irq(struct wm831x *wm831x, int irq)
 {


On Tue, 10 Nov 2026 02:32:49 +0000, Myeonghun Pak <mhun512@gmail.com> wrote:
> Hi Lee and Dmitry,
>
> This series fixes WM831x IRQ resource mismatches and follows Dmitry's
> request for managed onkey IRQ/work cleanup and MFD-provided mapped IRQs.
> The provider and consumers are converted together to keep their IRQ
> resources consistent.
>
> Changes since v1:
> - Use managed IRQ/work cleanup instead of storing the onkey IRQ.
> - Move IRQ mapping into MFD and update all platform consumers.
> - Reject failed mappings and unwind consumers before removing the domain.
> - Retain polling for release detection; the chip only interrupts on assertion.
> - Drop the previous Reviewed-by tag because the implementation changed
>   substantially.
>
> Compile-tested with LLVM, W=1 (arm64), for all 11 changed C objects.
> No hardware testing.
>
> Previous discussion:
> https://lore.kernel.org/r/atJycIEnUZKVdTjW@google.com
>
> Thanks,
> Myeonghun
