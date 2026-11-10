Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302947;
	b=1syV0o/TswXoiNtdFadHQCcj8xOyQ3KtwA3I9R+g6kZ245d820SU+d+KBDBi8Nqh386/
	 KKgvySofJixlRoQPiRRwsCcCzsWtErCWHYZU2IZgKPzLR/bL9Tp4HhWcOop4qND5D79rl
	 l2BUbk6WvfO00GyIxL2o1QcDcBVHdAhnNaG9TE0dM/T/tOJuWdHUpor++uLSyq9AdOuug
	 M9sbSCTmBj9Y8zTZ0x2QO+t5tUU6D+6I3J8Q4iHfNTRfRc0T2c0HdgM4EBjfB+EcRZHv7
	 6qLYinjq/NH5yrCcBfxJi6Cx3CiCnsWw/flZuFltRRdkXl35yxma9bajVQ4zbkWTUxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s1yLVKZqUlNj3njloZ4RcEDWvW8KSQFnV995646mHlk=;
	b=sHct+bWjLUWh6RmUWqLrTR4vYjKHU0Adj1/AHq7ZrzumELY40lgLXaAzQbv4pLpOn2eZ
	 D1mZX3X+4eQGqrGRBKHbO1pIsC0WMnQHVaEGX+fm3TyMoUr4CAkpSi9ie8RzXo8Pt5IUu
	 An76mttoc4qG1pwRswCoWrPZemySDXvXBHkFwMpy4HSchDypDd74y5TAOdQJp3CiK8xrU
	 w/R/AVIta9KP0HbdTaZNOhLWtby/LrsI7uXpZSWbv26buGHXcyI4Rd6CL8yFsEjuiNnvn
	 kuH+LbLVURuTPhHI3eIWGwbjmNzpJ3Yfu+CTVnepbdS7LyPUNsAQd3NhfEn6L+I+wWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UDxXKQMo;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94982606B147
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94982606B147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UDxXKQMo
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dee593f18so1130560f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794302945; x=1794907745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s1yLVKZqUlNj3njloZ4RcEDWvW8KSQFnV995646mHlk=;
        b=UDxXKQMoogTknpK1OPVncqXSm0G22RJgQ0FxIgPiMQaF2OJT500Q9tbbv+Tv+t5bOv
         4w4+ZxmMhb/fgy0FHH4HvD6vfIxqnkl62PfN6mzqtCgRUnOREeSSWtOQWr/3RpfQuzP9
         Ns9uxY/Hs523nHUL4cXA7tQPO+07rJxzz8OQ2lgiS3l53zWH2iYySdKiJjv9eoPrRR6+
         HG2NtC3puEQ2q0fLaWcsrC35e7r6LIpBPxaymZalvjNPFLK2YQNupKVOcThyOqqmsdXh
         NNTc4B1yrJzTS+OI2uma7W0eA97/oW3fgeNX2ntRzUoAQXjiYZXiIuGxDvrZXR6pSLpl
         001g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302945; x=1794907745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s1yLVKZqUlNj3njloZ4RcEDWvW8KSQFnV995646mHlk=;
        b=r0b6huk4xbh6W9Jfoq/fCroYI57TBtrtR7Kz0ouHsKc5rYUXAqXkgLQftX0xxV8F6f
         AMeJ6ZNC8qfnXtr6ZOy64aXqzesycUSmkGwUAFyshB/+6+PpzqMVFRPS/TqbpQeHq9gF
         fZEzZUb4xRdxqTktPVXOgfrbQNx5FL5CqJYv1LLP/41ExBoZiptJ60w5ZEV0q3cKWCKo
         byM/6YrD2m/3aY/2JZaGPrHU15pz+E1JWgasXd20kxCY8GnFwfEhlPEwEBgh3ow82416
         65nba+BxoSbKrZkB9Q/FbfQUxu25Cehf/JkVHZyt9wrbQWzbKIs58ckR86yf2i2+tt7P
         Gqww==
X-Forwarded-Encrypted: i=1; AL+hErE/yvtD0RoS/6tXgyF6Ozb58OnOOUdlVcAyqDlKhApVIjQs8Xk2GqrwUOHIEEgrw49C+hPzM4vomefRz5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zeY+4KXLERd382jOttnydAZCRjyrcxOCmSizq7i9PmDRZMDEs
	1hZN8bb37cIDyGZD3NjNEouF4FhH7SRI4+PrTTjAX44LiH6qVg2QZ+xA
X-Gm-Gg: AYBFou2YbYj5lHlaM8zCP9Wi1y1StgO4kYlA39I1dSJwH1q0bptJ8UgAp/11eLE0yqM
	IKiCzoXs9s/DVgYKRTw7bQsHbsh274eDhNCwHPX4JJCddTXDvWmFChpUtOn4UfsewlvAinMkn5W
	2tATe5cYudp3pDe65JYsBRpyveVjxsqgvSCsYp8AVeSxbYQGvFZUBAq1M3SvJEIi2stHIAm89D8
	ertQXb/c5ImM6PLiagYAtdy+eDV/yEeNv9XU3DUUufhtssccdFNs7mGSfDfQiS76aJMP1Ynm0Sm
	WmBTdJPFYtMYUK08GFBUWuRkDH7LhHK5EhGy7f/ZY/chYCumcQvZl68YIevvPmep1VjrbwwXKgY
	dgfoPCXqpdDnrKgPIFqntNvREmpaRJloqc4jnud6KhjsHXWQXcKeV0QCOkiJqAMhdmbSvuwO06h
	1/llW7q41DVc22NaZn4+oJgmG2WvUGEvr/piyXFWYQ9oIRrx0lVosWFGGYMZbG6IV3Pio+pZoWu
	D95ucqyRkQNm5QkzA9a85O4PkCRfRbjlFEdiK0afaGS+Oc4GOPQaJChy83xXNl4OKS7hD4MofX3
	AobnowCAxLWbceFMAHSnORxndQ08B8xmuBmf
X-Received: by 2002:a05:6000:3c5:b0:48e:f10:ceb8 with SMTP id ffacd0b85a97d-4982e641f90mr3524247f8f.11.1794302944660;
        Tue, 10 Nov 2026 01:29:04 -0800 (PST)
Received: from fedora ([154.182.80.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983f7801bbsm3839798f8f.5.2026.11.10.01.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:29:04 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v2] iio: adc: at91_adc: move to devm_* to fix NULL pointer deref
Date: Tue, 10 Nov 2026 11:28:48 +0200
Message-ID: <20261110092848.141854-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If 'atmel,adc-use-external-triggers' is not set in the device tree,
at91_adc_trigger_init() leaves the external trigger slots in st->trig
as NULL. The error paths and remove function unconditionally called
iio_trigger_unregister() and iio_trigger_free() on them, causing a
NULL pointer dereference.

Instead of just checking for NULL, refactor the driver to use the
device-managed (devm_*) API for registration and allocation. This
modernizes the code, eliminates the need for manual cleanup functions
(at91_adc_trigger_remove, at91_adc_buffer_remove, at91_ts_unregister,
and at91_adc_remove), and inherently fixes the NULL pointer dereference
since the core handles the cleanup of properly allocated triggers.

As part of this simplification, the remaining trigger initialization
logic has been inlined into at91_adc_probe().

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Fixes: 0e589d5fb317 ("ARM: AT91: IIO: Add AT91 ADC driver.")
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
v2:
 - Dropped the simple NULL check approach.
 - Refactored the driver to use devm_* API as suggested by Jonathan Cameron.
 - Removed manual cleanup functions and error paths entirely.
 - Inlined remaining trigger initialization into probe().

 drivers/iio/adc/at91_adc.c | 146 +++++++++----------------------------
 1 file changed, 33 insertions(+), 113 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 0ac74ad92fca..911838150116 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -608,85 +608,32 @@ static const struct iio_trigger_ops at91_adc_trigger_ops = {
 static struct iio_trigger *at91_adc_allocate_trigger(struct iio_dev *idev,
 						     const struct at91_adc_trigger *trigger)
 {
+	struct device *dev = idev->dev.parent;
 	struct iio_trigger *trig;
 	int ret;
 
-	trig = iio_trigger_alloc(idev->dev.parent, "%s-dev%d-%s", idev->name,
-				 iio_device_id(idev), trigger->name);
-	if (trig == NULL)
+	trig = devm_iio_trigger_alloc(dev, "%s-dev%d-%s", idev->name,
+				      iio_device_id(idev), trigger->name);
+	if (!trig)
 		return NULL;
 
 	iio_trigger_set_drvdata(trig, idev);
 	trig->ops = &at91_adc_trigger_ops;
 
-	ret = iio_trigger_register(trig);
-	if (ret) {
-		iio_trigger_free(trig);
+	ret = devm_iio_trigger_register(dev, trig);
+	if (ret)
 		return NULL;
-	}
 
 	return trig;
 }
 
-static int at91_adc_trigger_init(struct iio_dev *idev)
-{
-	struct at91_adc_state *st = iio_priv(idev);
-	int i, ret;
-
-	st->trig = devm_kcalloc(&idev->dev,
-				st->caps->trigger_number, sizeof(*st->trig),
-				GFP_KERNEL);
-
-	if (st->trig == NULL) {
-		ret = -ENOMEM;
-		goto error_ret;
-	}
-
-	for (i = 0; i < st->caps->trigger_number; i++) {
-		if (st->caps->triggers[i].is_external && !(st->use_external))
-			continue;
-
-		st->trig[i] = at91_adc_allocate_trigger(idev,
-							st->caps->triggers + i);
-		if (st->trig[i] == NULL) {
-			dev_err(&idev->dev,
-				"Could not allocate trigger %d\n", i);
-			ret = -ENOMEM;
-			goto error_trigger;
-		}
-	}
-
-	return 0;
-
-error_trigger:
-	for (i--; i >= 0; i--) {
-		iio_trigger_unregister(st->trig[i]);
-		iio_trigger_free(st->trig[i]);
-	}
-error_ret:
-	return ret;
-}
-
-static void at91_adc_trigger_remove(struct iio_dev *idev)
-{
-	struct at91_adc_state *st = iio_priv(idev);
-	int i;
-
-	for (i = 0; i < st->caps->trigger_number; i++) {
-		iio_trigger_unregister(st->trig[i]);
-		iio_trigger_free(st->trig[i]);
-	}
-}
-
 static int at91_adc_buffer_init(struct iio_dev *idev)
 {
-	return iio_triggered_buffer_setup(idev, &iio_pollfunc_store_time,
-		&at91_adc_trigger_handler, NULL);
-}
+	struct device *dev = idev->dev.parent;
 
-static void at91_adc_buffer_remove(struct iio_dev *idev)
-{
-	iio_triggered_buffer_cleanup(idev);
+	return devm_iio_triggered_buffer_setup(dev, idev,
+					       &iio_pollfunc_store_time,
+					       &at91_adc_trigger_handler, NULL);
 }
 
 static int at91_adc_read_raw(struct iio_dev *idev,
@@ -924,9 +871,8 @@ static int at91_ts_register(struct iio_dev *idev,
 {
 	struct at91_adc_state *st = iio_priv(idev);
 	struct input_dev *input;
-	int ret;
 
-	input = input_allocate_device();
+	input = devm_input_allocate_device(&pdev->dev);
 	if (!input) {
 		dev_err(&idev->dev, "Failed to allocate TS device!\n");
 		return -ENOMEM;
@@ -951,8 +897,7 @@ static int at91_ts_register(struct iio_dev *idev,
 		if (st->touchscreen_type != ATMEL_ADC_TOUCHSCREEN_4WIRE) {
 			dev_err(&pdev->dev,
 				"This touchscreen controller only support 4 wires\n");
-			ret = -EINVAL;
-			goto err;
+			return -EINVAL;
 		}
 
 		input_set_abs_params(input, ABS_X, 0, (1 << MAX_RLPOS_BITS) - 1,
@@ -964,27 +909,14 @@ static int at91_ts_register(struct iio_dev *idev,
 	st->ts_input = input;
 	input_set_drvdata(input, st);
 
-	ret = input_register_device(input);
-	if (ret)
-		goto err;
-
-	return ret;
-
-err:
-	input_free_device(input);
-	return ret;
-}
-
-static void at91_ts_unregister(struct at91_adc_state *st)
-{
-	input_unregister_device(st->ts_input);
+	return input_register_device(input);
 }
 
 static int at91_adc_probe(struct platform_device *pdev)
 {
 	unsigned int prsc, mstrclk, ticks, adc_clk, adc_clk_khz, shtim;
 	struct device_node *node = pdev->dev.of_node;
-	int ret;
+	int i, ret;
 	struct iio_dev *idev;
 	struct at91_adc_state *st;
 	u32 reg, prop;
@@ -1140,11 +1072,23 @@ static int at91_adc_probe(struct platform_device *pdev)
 			return dev_err_probe(&pdev->dev, ret,
 					     "Couldn't initialize the buffer.\n");
 
-		ret = at91_adc_trigger_init(idev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "Couldn't setup the triggers.\n");
-			at91_adc_buffer_remove(idev);
-			return ret;
+		st->trig = devm_kcalloc(&pdev->dev,
+					st->caps->trigger_number, sizeof(*st->trig),
+					GFP_KERNEL);
+		if (!st->trig)
+			return -ENOMEM;
+
+		for (i = 0; i < st->caps->trigger_number; i++) {
+			if (st->caps->triggers[i].is_external && !(st->use_external))
+				continue;
+
+			st->trig[i] = at91_adc_allocate_trigger(idev,
+								st->caps->triggers + i);
+			if (!st->trig[i]) {
+				dev_err(&idev->dev,
+					"Could not allocate trigger %d\n", i);
+				return -ENOMEM;
+			}
 		}
 	} else {
 		ret = at91_ts_register(idev, pdev);
@@ -1154,36 +1098,13 @@ static int at91_adc_probe(struct platform_device *pdev)
 		at91_ts_hw_init(idev, adc_clk_khz);
 	}
 
-	ret = iio_device_register(idev);
+	ret = devm_iio_device_register(&pdev->dev, idev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Couldn't register the device.\n");
-		goto error_iio_device_register;
+		return ret;
 	}
 
 	return 0;
-
-error_iio_device_register:
-	if (!st->touchscreen_type) {
-		at91_adc_trigger_remove(idev);
-		at91_adc_buffer_remove(idev);
-	} else {
-		at91_ts_unregister(st);
-	}
-	return ret;
-}
-
-static void at91_adc_remove(struct platform_device *pdev)
-{
-	struct iio_dev *idev = platform_get_drvdata(pdev);
-	struct at91_adc_state *st = iio_priv(idev);
-
-	iio_device_unregister(idev);
-	if (!st->touchscreen_type) {
-		at91_adc_trigger_remove(idev);
-		at91_adc_buffer_remove(idev);
-	} else {
-		at91_ts_unregister(st);
-	}
 }
 
 static int at91_adc_suspend(struct device *dev)
@@ -1333,7 +1254,6 @@ MODULE_DEVICE_TABLE(of, at91_adc_dt_ids);
 
 static struct platform_driver at91_adc_driver = {
 	.probe = at91_adc_probe,
-	.remove = at91_adc_remove,
 	.driver = {
 		   .name = DRIVER_NAME,
 		   .of_match_table = at91_adc_dt_ids,
-- 
2.56.0

