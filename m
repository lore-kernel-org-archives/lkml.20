Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924361;
	b=JGzVFykvxk+tIAzawLjyEmqBQlMOgCJ4yle9NwXiiUgGv9tTt2Y1uXm9EX3suWi2dnmK
	 DKVJvX6RQP1GK0vI7CoXZTkJaQMqs1F4Rl5mxMdaBq/N8qa1fxNw8CFy1nlRzQPXshh0g
	 98aN7AeJw2MWjQjW/dFFBMRpzU34lbM+39ve9TlOEUfbzl1pl01iHx51b3rsLZbAlI7Z0
	 aMqrK/IWgkqjBEs54xKANcWM8zSegFQYklHIgb0mtg1hLvK76ZcGSrcoRQXiRoPAGyitv
	 iXoX24mUGbcd96xzXPJjD/i6VWaN706D3YwlbIxCJ5HhSc4Zn/FhGqm+HiVjp7wTzPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YnUCdj0ZJZzzvPnpwhHMUkbSJzZL3zHDWabQB4+Fnv8=;
	b=o22IkYDTZkkv+JJagZ+DV+mSdimrXbpChrdMyqVBrAGHLb4xbSiJE1XjkRqLJmq7lG//
	 rkjRII/Ri63MZiNWOMgAj5W+UkebUXPw2Nb9HOucUufPSeFYKYaP1/2q2R1bV7aXYyga3
	 q2f75XLsTZcKQ3lVMy1ULtnvdmL9zelqHBt22tEfAYeDqLifLkn4AgMJyaNLuTr7oizoS
	 anwq2UycwHCnJjIAv08Wj4VmS/kKFUEiiOtb5f2XdSv/BCs+SfABOINWfwBQzZJDXAFKy
	 y45oXZ1cC4W8+2918j8I7DgpPO6LU9fKSDwdrchUeJomFxnBto4gNyXaN/c0+LLkk4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DTMNlgiw;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFCE606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BFCE606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DTMNlgiw
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so22492895e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794924359; x=1795529159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YnUCdj0ZJZzzvPnpwhHMUkbSJzZL3zHDWabQB4+Fnv8=;
        b=DTMNlgiwLWgjIaLKYHrNNvaGIMrvUBoBL/6IXu8ujmwcdUK9v/2UVooFSQT1nFbS0w
         nN6lysA2fltjqcb/aL8kbzSg9PZ3fv1IHHPikMdgJgXYWG5T5GvYBQXwW3Td388vg9LR
         FKV9e0SNVLMvrX4mh+Gek6CwHfSuSvN0NLUNU5wJOo3a5Yeio4BtuIGNZi+b527rEplf
         YrxXHR0T5Srus4zsmxDPnt8lx4tggHxK4qpcnkgurTN8VeBGHz5/fIH13aJ5NU8qlvV3
         E2M/WZag5ZGsNZ8KBN4Hgqhq/4eE2UY/MiJg3C2GHVqvWdrQvi1xA0PjpjibPDUY2Z3T
         PtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924359; x=1795529159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YnUCdj0ZJZzzvPnpwhHMUkbSJzZL3zHDWabQB4+Fnv8=;
        b=kYXOZCxz5lnoAf1KUuMU2SdWTnD9M1lQO34PelIspSdfvgt2qIhKogrXymdEaZWW2V
         c2ZdH5fjaa/ZV9DYBlX9KdRvTQlNzOfvagwQNA/eyi5q8VdkMF0Uo/nTgBO08AAL5+kf
         kWna9L0WPMqWMbZQTx6LsKR6MBe7YFvxwDsm+T8m3TzssBiW/PyIMyGDu5yr/V/JnxYm
         YibT4VIheq111v0DDJmDhLBB6mfIZPWqxBZYvmDEZjrkMlANVB1Gf0drYJqoJa8Yx2cV
         KinvKl3o+3Funyw/6MkDsWYNHr2N4LQt7HQZoTMeG86Vk0WmVeUmi7lTqY45yiBrbNOz
         jI7A==
X-Forwarded-Encrypted: i=1; AL+hErE3hsjaoqoNdeq6hv77cdgzo/ntw/nuFgWhdYWWgP023D7fPZChtst4BOauT2m9umy/7FuXF4i8V72y4UI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N8cJxMseKpeYFXDxvPtLxoMX+cvONzygPRkk3Kq6SNcIP45Ix
	g8RFZOSs9G6hWXRal8CuapTw+UMXazd5/z5063KEFBXwV59973jYwcuF
X-Gm-Gg: AYBFou1P8qCF42EVrMwy/nLNMaPDtW3Bfg3QXWWIF0lZSl/I6zFaghL8r2W/ylwbVlK
	fA9hPz9blAf8ghFfv6VEHkvJYay8URwqo9P1nb5byNG+mGeDzoL4hxlWECjQI+vAN3782VYO7pl
	C80clLKi7Au84pEyNk1Dysd3o9KmQ695sBe8xN0SNXhe4WBibYjp2OKLOqcjibnfUsBQ0bwfCaV
	GvdUazWpV3KhHxAZiPTkq53yuZr4DZkNuM8+BBzZr9u5MUTHP0wI1DkZpKQ9rQcUVoEzp92My9C
	ptmED2IvHZveN0NQz78FACKT4V/jPzkVPMgGphX2igMzc7P1IWy57pLVT3NmqXf+1M6Eg4R6er3
	K2mxmZqieIdg9SgisirD/M39HVhGCNbMTbtaGwtJnRUKz4JIoxlf8QQAUF+nmmia9YTpsY3MUgO
	MVlJ25V7NTMCnZFSw9CCMDAb4HQOpFax5wTKwPtHC0lcUPFHheKBzpCKAcZB6iaVfz2bMcNFmzt
	I1S+NOFP6XCdVrcpsfawtePSXTNYbEJxJJEADzBLsYj9Jf9YrcZBp4LelJ++HMmvfquzXWkrazj
	6YTiqDUCjJiHk+LjCL+2RJr9to7brFGqYFI57Q==
X-Received: by 2002:a05:600c:3f18:b0:4bb:6ac0:6dc0 with SMTP id 5b1f17b1804b1-4bb6ac06e5dmr155099075e9.29.1794924358798;
        Tue, 17 Nov 2026 06:05:58 -0800 (PST)
Received: from fedora ([154.183.162.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4de4cb1c3sm2623032f8f.8.2026.11.17.06.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:05:58 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com,
	amin.gattout@gmail.com,
	antoniu.miclaus@analog.com,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v4 3/3] iio: adc: at91_adc: convert to device-managed resources
Date: Tue, 17 Nov 2026 16:05:10 +0200
Message-ID: <20261117140510.391907-4-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
References: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
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

Convert the driver to device-managed APIs so that all resources are
freed automatically on probe failure and on driver detach:

  - allocate and register the IIO triggers directly in at91_adc_probe()
    with devm_iio_trigger_alloc() and devm_iio_trigger_register(),
    dropping at91_adc_allocate_trigger(), at91_adc_trigger_init() and
    at91_adc_trigger_remove() along with their manual rollback paths
  - set up the triggered buffer with devm_iio_triggered_buffer_setup()
    directly in at91_adc_probe(), dropping at91_adc_buffer_init() and
    at91_adc_buffer_remove()
  - allocate the touchscreen input device with
    devm_input_allocate_device(), dropping at91_ts_unregister() and the
    manual input_free_device() error path in at91_ts_register()
  - register the IIO device with devm_iio_device_register()

at91_adc_probe() no longer needs any error unwinding labels and
at91_adc_remove() is removed together with the platform driver's
.remove callback.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 187 ++++++++-----------------------------
 1 file changed, 39 insertions(+), 148 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 0553a08b8d24..e4cf5b1f231e 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -605,94 +605,6 @@ static const struct iio_trigger_ops at91_adc_trigger_ops = {
 	.set_trigger_state = &at91_adc_configure_trigger,
 };
 
-static struct iio_trigger *at91_adc_allocate_trigger(struct iio_dev *idev,
-						     const struct at91_adc_trigger *trigger)
-{
-	struct iio_trigger *trig;
-	int ret;
-
-	trig = iio_trigger_alloc(idev->dev.parent, "%s-dev%d-%s", idev->name,
-				 iio_device_id(idev), trigger->name);
-	if (trig == NULL)
-		return NULL;
-
-	iio_trigger_set_drvdata(trig, idev);
-	trig->ops = &at91_adc_trigger_ops;
-
-	ret = iio_trigger_register(trig);
-	if (ret) {
-		iio_trigger_free(trig);
-		return NULL;
-	}
-
-	return trig;
-}
-
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
-		if (!st->trig[i])
-			continue;
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
-		if (!st->trig[i])
-			continue;
-		iio_trigger_unregister(st->trig[i]);
-		iio_trigger_free(st->trig[i]);
-	}
-}
-
-static int at91_adc_buffer_init(struct iio_dev *idev)
-{
-	return iio_triggered_buffer_setup(idev, &iio_pollfunc_store_time,
-		&at91_adc_trigger_handler, NULL);
-}
-
-static void at91_adc_buffer_remove(struct iio_dev *idev)
-{
-	iio_triggered_buffer_cleanup(idev);
-}
-
 static int at91_adc_read_raw(struct iio_dev *idev,
 			     struct iio_chan_spec const *chan,
 			     int *val, int *val2, long mask)
@@ -928,13 +840,10 @@ static int at91_ts_register(struct iio_dev *idev,
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
@@ -952,12 +861,9 @@ static int at91_ts_register(struct iio_dev *idev,
 				     0, 0);
 		input_set_abs_params(input, ABS_PRESSURE, 0, 0xffffff, 0, 0);
 	} else {
-		if (st->touchscreen_type != ATMEL_ADC_TOUCHSCREEN_4WIRE) {
-			dev_err(&pdev->dev,
-				"This touchscreen controller only support 4 wires\n");
-			ret = -EINVAL;
-			goto err;
-		}
+		if (st->touchscreen_type != ATMEL_ADC_TOUCHSCREEN_4WIRE)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "This touchscreen controller only support 4 wires\n");
 
 		input_set_abs_params(input, ABS_X, 0, (1 << MAX_RLPOS_BITS) - 1,
 				     0, 0);
@@ -968,20 +874,7 @@ static int at91_ts_register(struct iio_dev *idev,
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
@@ -1140,15 +1033,39 @@ static int at91_adc_probe(struct platform_device *pdev)
 	 * trigger for classic adc.
 	 */
 	if (!st->touchscreen_type) {
-		ret = at91_adc_buffer_init(idev);
+		ret = devm_iio_triggered_buffer_setup(dev, idev,
+						      &iio_pollfunc_store_time,
+						      &at91_adc_trigger_handler,
+						      NULL);
 		if (ret < 0)
 			return dev_err_probe(dev, ret, "Couldn't initialize the buffer.\n");
 
-		ret = at91_adc_trigger_init(idev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "Couldn't setup the triggers.\n");
-			at91_adc_buffer_remove(idev);
-			return ret;
+		st->trig = devm_kcalloc(dev, st->caps->trigger_number,
+					sizeof(*st->trig), GFP_KERNEL);
+		if (!st->trig)
+			return -ENOMEM;
+
+		for (int i = 0; i < st->caps->trigger_number; i++) {
+			struct iio_trigger *trig;
+
+			if (st->caps->triggers[i].is_external && !st->use_external)
+				continue;
+
+			trig = devm_iio_trigger_alloc(dev, "%s-dev%d-%s",
+						      idev->name,
+						      iio_device_id(idev),
+						      st->caps->triggers[i].name);
+			if (!trig)
+				return -ENOMEM;
+
+			iio_trigger_set_drvdata(trig, idev);
+			trig->ops = &at91_adc_trigger_ops;
+
+			ret = devm_iio_trigger_register(dev, trig);
+			if (ret)
+				return ret;
+
+			st->trig[i] = trig;
 		}
 	} else {
 		ret = at91_ts_register(idev, pdev);
@@ -1158,36 +1075,11 @@ static int at91_adc_probe(struct platform_device *pdev)
 		at91_ts_hw_init(idev, adc_clk_khz);
 	}
 
-	ret = iio_device_register(idev);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Couldn't register the device.\n");
-		goto error_iio_device_register;
-	}
+	ret = devm_iio_device_register(dev, idev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Couldn't register the device.\n");
 
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
@@ -1337,7 +1229,6 @@ MODULE_DEVICE_TABLE(of, at91_adc_dt_ids);
 
 static struct platform_driver at91_adc_driver = {
 	.probe = at91_adc_probe,
-	.remove = at91_adc_remove,
 	.driver = {
 		   .name = DRIVER_NAME,
 		   .of_match_table = at91_adc_dt_ids,
-- 
2.56.0

