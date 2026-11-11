Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392631;
	b=a6jo8En+vqzGigK3TVqHKCl76nbmpz8gtfjxFjlNXBX9RferW76BEowepMePoffRbCK+
	 vX4jFPlAD/cGfGhGY1wlgP71Hl4MahldAruaiRXutB2wckKGtHATQ2AhDWNSHWxidor/l
	 p44MTZ3YO7n1+spFOMJmA+kVLPrp2jNH4IzEJQ35FSyd7PvtImJ2caJykfDockEnffUMK
	 svuJTp/iypPe3PWcZYZDuWv1+b5ZVjp5XTVD4xvhhMpSthIHwfoqFmndK0AB+bTFtO8zF
	 DHPoFiVcJnAE2JZXaZyVJsGVvFjLmb165gU0fDU56XGubu5ZetPaXlZ1AoDZh8pgn1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lTtaukxftZVKFDau/7qTiVwTrbXKJ+iWU8/3orek9JQ=;
	b=G7pETZR8wxRYdCssTE/USXzwx5m3r4nNtqX+XPrbu1uDocjTfUI8v/al5k01iKZi73we
	 6suhz3eV8fduDG5qAivmiozeKienETwYuI7At10sNLHdiAOXpXCep6n8PVTvgDIPiCQqn
	 ISz/gKUuGVUIXFajVogycn0T/mxihfIV+btWJIRWwYYv0+6Z9zI6NolQcOlje2Uzie+Eg
	 wqbveokRzbLYmfF2Xu0ceN/WeKhc1as6PBvpJw1tEibXAvw7n4GTxjE0K/QT20SZ680HV
	 K3uwRBb+plLnnNiOlZK78nY4S7hyWeV8niR/FLKRo1Ky/kjrHbPKipq9qk2TTcdUR7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xo4Og1TI;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79352606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79352606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xo4Og1TI
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso18819695e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794392629; x=1794997429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTtaukxftZVKFDau/7qTiVwTrbXKJ+iWU8/3orek9JQ=;
        b=Xo4Og1TIX7ckk/BjmhvZmduOYR5ibKUGmBw+E00VCP1DxneWaTMNz+ypsQdxgUBFMm
         LxKEpdKuA/G8gxlNcYJYDOnPK0nMAxjmxYl09bCag/gjuqyxpT8NIWi6tlE+YSZl91+0
         hu4ObsdE7AN9J+40QkU4dL0ojAXLCIrzuM0CFxdkDMQqXjOVJfkZS4p+UwIn3Rcphgte
         3NuPgYm1ZsC5/MH2DAYXDncTmYFCt2UdUri7aa2KSx5b7K6+J17tPtaqWb5g3S6wfOg6
         H2oFJXtQu3fp5zx6gMkoK+LLf4jtEYYD7nSmDaBVAiPNjVooXQeoIbfBXmukrIo0qB3e
         YOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392629; x=1794997429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTtaukxftZVKFDau/7qTiVwTrbXKJ+iWU8/3orek9JQ=;
        b=ou8Xf6BKn6vZ2kJpHlzIMwcSMe611hkS78AdH8IBlaPVWjEcGNKuB1FpVqrqUfEyfI
         2Kp333N748RVYdiXyc7R4kIEsTXafPvWWAk9HBlblBR/Lgvc6kQL/BrZ8yj3+BcIjn46
         ys1hvJGLhKVs6nQRk5bMNVV+5rAM+5hNl69WhYV6xVph6sUV7WzGKThHrKz/fSPzqrFP
         htEN0178EYawEZpqgs9grG7gUtqn81/JkjfBmYaB1xs8HplQmvED4GXil6BAQLpnWrCk
         FSG0U0+6yZ3GZlWpMH99uIHYanXdFJ7E5+gOfOm1RST13IfU4Ego9SgIl/3LVRXlHJuo
         X7gg==
X-Forwarded-Encrypted: i=1; AL+hErGgn5ACtL2EEcOFcc+maAeIX/FCWkQunVmyaQMfJT18LoVHP2DwHfoKuGlyBqLRdb0Qv0hv70oSH3rpKZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z87KaKDLCilZ7wAE7lEgcKMhgJfdXZ2cBJzNmQVFVb+GbOSelf5
	aC+HyjutSrGyVhG34l4Q9HZJIKllmFRrwFZiILqKeh8fEdEB0eFpfyWY
X-Gm-Gg: AYBFou35Mq9yAc6zDG6aSk2k/Bac2A4jyc0UvPI+SNf0AxxjDBuwcK0wJBQOZrhxuvV
	/vyiweV3HRo3VUr8sBDF9Z6nDk1PmR4En9EYK+wqFmxs4z4kkRni7kZZd5EhmRQWYiu94gAvluK
	CRXHVJMHRdWHvf4qxzVhfME4KgChCkBd/evbpbXDuxx/4mPqYtCaJcpP0Ttu/qykk6GJQxHXWdg
	2xYosoi4ugKzcUHQlE8scHvprIf5Z63YMk4ZzmfNA7+zxFZCWKzfnLLobcx0rxhTkMQnEu/CLjB
	mJTepnOkzMkhdVtUko/uzQYu9Al/ZKJ4AyjNdyX+WLbhdny72o8WoVnqZgE347Nz6DdLu9U0VGI
	eGzFrE4noEds0k5ChWRLUbHD4pkRm9WgazNvR0zwTyGrP5LSD1R4Nt4BLixf7sMYWK+SOUWMXMg
	ebDgh4vaNa0/fdTYUjasl9CTBLIXGmgxxO6rgUTi1V+87W+4GmJB5Zx/oF606/1xtpAmIRef6Au
	EOYdItHO4HJgY/juYxc+hSU8zD8loBHz8p+ZFM/K6pV/0fl/TaWA+R/2BSsMhfDTX4vieZeizG4
	pO7FiVt5UOyMBLCLWsM0YxA7FxoetdmJFFLhtMNkeAyTuTRC8uTthcriJw==
X-Received: by 2002:a05:600c:190a:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4ba0936c0d2mr36442075e9.6.1794392628711;
        Wed, 11 Nov 2026 02:23:48 -0800 (PST)
Received: from fedora ([154.182.80.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204e22csm121569065e9.12.2026.11.11.02.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:23:48 -0800 (PST)
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
Subject: [PATCH v3] iio: adc: at91_adc: move to devm_* to fix NULL pointer deref
Date: Wed, 11 Nov 2026 12:13:45 +0200
Message-ID: <20261111101345.185122-1-abdelnasserhussein11@gmail.com>
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
v3:
 - Addressed review comments from Andy Shevchenko:
   - Removed the redundant dev_err() after devm_input_allocate_device().
   - Declared a local 'struct device *dev = &pdev->dev' and used it in
     at91_adc_probe().
   - Declared the loop iterator inside the for-loop.

v2:
 - Dropped the simple NULL check approach.
 - Refactored the driver to use devm_* API as suggested by Jonathan Cameron.
 - Removed manual cleanup functions and error paths entirely.
 - Inlined remaining trigger initialization into probe().

 drivers/iio/adc/at91_adc.c | 185 +++++++++++--------------------------
 1 file changed, 52 insertions(+), 133 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 0ac74ad92fca..5293229f3dfa 100644
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
@@ -924,13 +871,10 @@ static int at91_ts_register(struct iio_dev *idev,
 {
 	struct at91_adc_state *st = iio_priv(idev);
 	struct input_dev *input;
-	int ret;
 
-	input = input_allocate_device();
-	if (!input) {
-		dev_err(&idev->dev, "Failed to allocate TS device!\n");
+	input = devm_input_allocate_device(&pdev->dev);
+	if (!input)
 		return -ENOMEM;
-	}
 
 	input->name = DRIVER_NAME;
 	input->id.bustype = BUS_HOST;
@@ -951,8 +895,7 @@ static int at91_ts_register(struct iio_dev *idev,
 		if (st->touchscreen_type != ATMEL_ADC_TOUCHSCREEN_4WIRE) {
 			dev_err(&pdev->dev,
 				"This touchscreen controller only support 4 wires\n");
-			ret = -EINVAL;
-			goto err;
+			return -EINVAL;
 		}
 
 		input_set_abs_params(input, ABS_X, 0, (1 << MAX_RLPOS_BITS) - 1,
@@ -964,39 +907,27 @@ static int at91_ts_register(struct iio_dev *idev,
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
+	struct device *dev = &pdev->dev;
 	unsigned int prsc, mstrclk, ticks, adc_clk, adc_clk_khz, shtim;
-	struct device_node *node = pdev->dev.of_node;
+	struct device_node *node = dev->of_node;
 	int ret;
 	struct iio_dev *idev;
 	struct at91_adc_state *st;
 	u32 reg, prop;
 	const char *s;
 
-	idev = devm_iio_device_alloc(&pdev->dev, sizeof(struct at91_adc_state));
+	idev = devm_iio_device_alloc(dev, sizeof(struct at91_adc_state));
 	if (!idev)
 		return -ENOMEM;
 
 	st = iio_priv(idev);
 
-	st->caps = of_device_get_match_data(&pdev->dev);
+	st->caps = of_device_get_match_data(dev);
 
 	st->use_external = of_property_read_bool(node, "atmel,adc-use-external-triggers");
 
@@ -1041,7 +972,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, idev);
 
-	idev->name = dev_name(&pdev->dev);
+	idev->name = dev_name(dev);
 	idev->modes = INDIO_DIRECT_MODE;
 	idev->info = &at91_adc_info;
 
@@ -1060,25 +991,25 @@ static int at91_adc_probe(struct platform_device *pdev)
 	at91_adc_writel(st, AT91_ADC_IDR, 0xFFFFFFFF);
 
 	if (st->caps->has_tsmr)
-		ret = devm_request_irq(&pdev->dev, st->irq,
+		ret = devm_request_irq(dev, st->irq,
 				       at91_adc_9x5_interrupt, 0,
-				       pdev->dev.driver->name, idev);
+				       dev->driver->name, idev);
 	else
-		ret = devm_request_irq(&pdev->dev, st->irq,
+		ret = devm_request_irq(dev, st->irq,
 				       at91_adc_rl_interrupt, 0,
-				       pdev->dev.driver->name, idev);
+				       dev->driver->name, idev);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
+		return dev_err_probe(dev, ret,
 				     "Failed to allocate IRQ.\n");
 
-	st->clk = devm_clk_get_enabled(&pdev->dev, "adc_clk");
+	st->clk = devm_clk_get_enabled(dev, "adc_clk");
 	if (IS_ERR(st->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(st->clk),
+		return dev_err_probe(dev, PTR_ERR(st->clk),
 				     "Could not prepare or enable the clock.\n");
 
-	st->adc_clk = devm_clk_get_enabled(&pdev->dev, "adc_op_clk");
+	st->adc_clk = devm_clk_get_enabled(dev, "adc_op_clk");
 	if (IS_ERR(st->adc_clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(st->adc_clk),
+		return dev_err_probe(dev, PTR_ERR(st->adc_clk),
 				     "Could not prepare or enable the ADC clock.\n");
 
 	/*
@@ -1090,13 +1021,13 @@ static int at91_adc_probe(struct platform_device *pdev)
 	adc_clk = clk_get_rate(st->adc_clk);
 	adc_clk_khz = adc_clk / 1000;
 
-	dev_dbg(&pdev->dev, "Master clock is set as: %d Hz, adc_clk should set as: %d Hz\n",
+	dev_dbg(dev, "Master clock is set as: %d Hz, adc_clk should set as: %d Hz\n",
 		mstrclk, adc_clk);
 
 	prsc = (mstrclk / (2 * adc_clk)) - 1;
 
 	if (!st->startup_time)
-		return dev_err_probe(&pdev->dev, -EINVAL,
+		return dev_err_probe(dev, -EINVAL,
 				     "No startup time available.\n");
 	ticks = (*st->caps->calc_startup_ticks)(st->startup_time, adc_clk_khz);
 
@@ -1123,7 +1054,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 	/* Setup the ADC channels available on the board */
 	ret = at91_adc_channel_init(idev);
 	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret,
+		return dev_err_probe(dev, ret,
 				     "Couldn't initialize the channels.\n");
 
 	init_waitqueue_head(&st->wq_data_avail);
@@ -1137,14 +1068,26 @@ static int at91_adc_probe(struct platform_device *pdev)
 	if (!st->touchscreen_type) {
 		ret = at91_adc_buffer_init(idev);
 		if (ret < 0)
-			return dev_err_probe(&pdev->dev, ret,
+			return dev_err_probe(dev, ret,
 					     "Couldn't initialize the buffer.\n");
 
-		ret = at91_adc_trigger_init(idev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "Couldn't setup the triggers.\n");
-			at91_adc_buffer_remove(idev);
-			return ret;
+		st->trig = devm_kcalloc(dev,
+					st->caps->trigger_number, sizeof(*st->trig),
+					GFP_KERNEL);
+		if (!st->trig)
+			return -ENOMEM;
+
+		for (int i = 0; i < st->caps->trigger_number; i++) {
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
@@ -1154,36 +1097,13 @@ static int at91_adc_probe(struct platform_device *pdev)
 		at91_ts_hw_init(idev, adc_clk_khz);
 	}
 
-	ret = iio_device_register(idev);
+	ret = devm_iio_device_register(dev, idev);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "Couldn't register the device.\n");
-		goto error_iio_device_register;
+		dev_err(dev, "Couldn't register the device.\n");
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
@@ -1333,7 +1253,6 @@ MODULE_DEVICE_TABLE(of, at91_adc_dt_ids);
 
 static struct platform_driver at91_adc_driver = {
 	.probe = at91_adc_probe,
-	.remove = at91_adc_remove,
 	.driver = {
 		   .name = DRIVER_NAME,
 		   .of_match_table = at91_adc_dt_ids,
-- 
2.56.0

