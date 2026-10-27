Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793071578;
	b=wonFiCp8SnLfSDKk875onJEAvFkZh2VGXZSyr56lGxL07wwc/OuJWGOib9X1lsOVlS3A
	 NipfQcr1BWGc9unOJOv4QNP8xgXbuQf6umUheTOCnVPlRYdaJqAVRrvKolKvgf6wOHyC0
	 5kuwJAioC1hP4gSGSONru23Z5DAjMuQanSqGpM0XtxnknjRJX/SBtJxQARfGbTOO8yqUG
	 vvwvsXbqs4zGeUy6Qn8VUHi73arhrIKwXofVR4Vv+kW+g6S8uzWmEhNDutRHKppsdb1D5
	 kD9uRD4Oimmxq8yqj7PQ6O2gDVd8XK9tXO5AdCy58yqLwa1sFZynpGFd8e1LZDowCJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793071578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2QK2iE7noXFpUwQUNk0LfJ3uQv+Asv37AvrfE0uGxCo=;
	b=gNM2P1Moum2I2GWrlZ1VSFvWzOAIGSdDTWmqb13XhQfUhzfgbzqq6iKTmVJJ9kvolspV
	 JAGXJhADVTUoM5WXsK2yxZMM4wZGneiVk+qXaXD+Iv1d9ZKHFi3dOkIG8jxB2XK3YMKET
	 Ft/96safZ2O4Yau7+w3PrI7l2J/V1vVEyy5n++pKoF3+/a8tE2KJu4Y21tLUChT7HFMqk
	 lMZipNBr+EdvBjWaxMxDycSuO31O6fa0UKm7bqORWHEPcoFL6De592lroO0vupPAa7GN7
	 yfKFl2KW2CaY/vHIKuw7OwonIZ92TNDBHbiNzNTiOxaypEVOaHfejrTK9IxfY4oTJcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=peE75+7g;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DC9606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0DC9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=peE75+7g
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-18cdcfc05ffso4526173c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793071577; x=1793676377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2QK2iE7noXFpUwQUNk0LfJ3uQv+Asv37AvrfE0uGxCo=;
        b=peE75+7giTLgdy0neqNE+JHr8K/D+on9j8SKao4hj7hAu/Wbm5v5rH00RFK8CJx1qZ
         mHQ1q2xpj4F/gbbgfG2AWJKh+fSisAgSbnrlcC38YjhxTuXOdgUDGe8gZRDlik8U1Ytd
         DaGFJvYg/aW8JxXWKSwm4R8qAQ9xKP3LWXvhQ2IY8Y+ShvFF89ErNRAYQCo2EFCmNBoN
         RzD9XWfm5V4EbfuKJ5oSAMwOhnmkl7KXzl2vTAbQTFVRTbYULDsiTd8TX84tquj5aRfG
         Nnx6evrTPRvDPH87t9dy8eoVSg8sGJE0W2voOo8dJOTo99BFweHJpu+ARo78Vc0P/DU/
         QsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793071577; x=1793676377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2QK2iE7noXFpUwQUNk0LfJ3uQv+Asv37AvrfE0uGxCo=;
        b=jo1qHi2Pgd55+qlMHBTNtNgD0gvo257QJ9bCrsnoQ9hNE5zwnQgbfHhH3c1XRnZa1h
         j0gI5wFPcYJh9mvVFBzHyR6XAJ7F/13vyjYy9AWmRszWWlnm4QHEyi5oWKIUgbk8XrJ/
         6cWU+IdypPbVaWVFC7JKOgiGY7WQOsIWlK+HFY56cAk60rtG3cWQGlmpFGprwIhYyd/1
         yHdqQSYoF/zf3P186nN5YHH/k3kuo+IAJ7FzSPBhgGK9S2rTYY4ODPkPIJ+DKvSIHnTL
         MH9tQwULgy8xwi4vAYcmH8BBODtjeRjHsjCJen4dE3Je1OMYofU+6mXyDVs5u9n6b4W9
         3eyg==
X-Forwarded-Encrypted: i=1; AKwUvBzDqY9tSpU7ELdRqaO7T/ljsymURZuJAhHn3puuLOooSDWgq2X1EdLC+y+D/X7vGufwMatpUA8uGLPbzHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZXJyT9wFn9ilXXtKnSLXj7PsO9hGMRh+zzXrdT6m1r4BQMd6Y
	/qWPYdOkFC976/syIhmY4Xc7sJsYjnVvMC7QvLd0/C/fxosIHJFN4pjG
X-Gm-Gg: AYBFou2zqYxwhuQLiRYw3yjSuavkwXK5WKERaOElmei/cerYjULH/UFtsxRvQYoCSjE
	LvtyPZetaa/nW+nIOeEtAQ+3fUyYtdkjAnTFP/D6OhkXvbLU2fDhThiMBdKswrrIMlXlvlW2wyB
	fyE4l2hfLxN2uaMBlNijW0TeZM85iVGMGMv9XnGtGOceSLmbkoIfuPKLF7AeuZVUAiM9jN8Wxkv
	RayBrCV3AiTMI4aROW43QHjzIkJJjXqp6UnTBHXFSU5V4ByIDL6MhEHGBmjDjcEAPB1nwhATiIu
	RxX+NuKPT7WffB1hYx6c1CyOLEo0we+2WqEMpvGv5T/oi1k+c9Aovqq2jdcGQ4zOuguaGFifcHU
	r1ydlSTIFpEAgUt8ccGdY3wzlC0SRPn0kFcFGT9eaQEWEwkfRWIPO9I+nxzERgUYUDoYJZxyedh
	fOpiJR5cWRcdMbYNbRB7SHBdffmsKzC4a+iFHutJq7L09D4tIvx1BnLnaWQ5a0GULV36MuKhTRx
	0lrMlJksPAf/0yqH28Ps6jLyUP877Quamj1p2GIz4L9D5ApUT1P6v19a0Y4Govcmpwg2U2OcYOe
	TNCl3SWCm5mPEaSUaA==
X-Received: by 2002:a05:7022:b886:b0:16a:b995:dc7c with SMTP id a92af1059eb24-19935be80e7mr11905109c88.21.1793071576759;
        Mon, 26 Oct 2026 20:26:16 -0700 (PDT)
Received: from lgs.. ([47.82.67.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm32317865c88.9.2026.10.26.20.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:26:16 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: twl6040: fix IRQ action memory leaks during teardown
Date: Tue, 27 Oct 2026 11:26:08 +0800
Message-ID: <20261027032609.119226-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

twl6040_remove() currently removes the regmap IRQ chip before
removing the MFD child devices. This destroys the IRQ mappings
before the child drivers can release their interrupt handlers.

The parent driver also registers READY and thermal interrupt
handlers using devm_request_threaded_irq(). These handlers are
normally released by device-managed cleanup after remove returns,
when the corresponding IRQ descriptors have already been removed.

Consequently, free_irq() cannot find the IRQ descriptors and the
allocated struct irqaction objects are not freed. The associated
IRQ threads also cannot be stopped through the normal cleanup path.

The probe error paths have a similar issue, as they destroy the IRQ
chip before the device-managed IRQ handlers are released.

Remove the MFD child devices first, then explicitly free the
parent's READY and thermal IRQ handlers using devm_free_irq()
before removing the regmap IRQ chip.

Also update the probe error paths to release successfully requested
IRQs before destroying their mappings.

This issue was found by our static analysis tool under development.

Fixes: ab7edb149c75 ("mfd: twl6040: Convert to use regmap_irq")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mfd/twl6040.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/twl6040.c b/drivers/mfd/twl6040.c
index 562a0f939f6e..7b05d21cd17d 100644
--- a/drivers/mfd/twl6040.c
+++ b/drivers/mfd/twl6040.c
@@ -745,7 +745,7 @@ static int twl6040_probe(struct i2c_client *client)
 					"twl6040_irq_th", twl6040);
 	if (ret) {
 		dev_err(twl6040->dev, "Thermal IRQ request failed: %d\n", ret);
-		goto readyirq_err;
+		goto thirq_err;
 	}
 
 	/*
@@ -791,10 +791,14 @@ static int twl6040_probe(struct i2c_client *client)
 	ret = mfd_add_devices(&client->dev, -1, twl6040->cells, children,
 			      NULL, 0, NULL);
 	if (ret)
-		goto readyirq_err;
+		goto mfd_err;
 
 	return 0;
 
+mfd_err:
+	devm_free_irq(twl6040->dev, twl6040->irq_th, twl6040);
+thirq_err:
+	devm_free_irq(twl6040->dev, twl6040->irq_ready, twl6040);
 readyirq_err:
 	regmap_del_irq_chip(twl6040->irq, twl6040->irq_data);
 gpio_err:
@@ -809,9 +813,10 @@ static void twl6040_remove(struct i2c_client *client)
 	if (twl6040->power_count)
 		twl6040_power(twl6040, 0);
 
-	regmap_del_irq_chip(twl6040->irq, twl6040->irq_data);
-
 	mfd_remove_devices(&client->dev);
+	devm_free_irq(twl6040->dev, twl6040->irq_th, twl6040);
+	devm_free_irq(twl6040->dev, twl6040->irq_ready, twl6040);
+	regmap_del_irq_chip(twl6040->irq, twl6040->irq_data);
 
 	regulator_bulk_disable(TWL6040_NUM_SUPPLIES, twl6040->supplies);
 }
-- 
2.43.0

