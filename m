Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436505;
	b=yemQJOUImNDvnMwJH1oPLt3otm5rHrvonoN1hIR7soAc8jsedTHMYUZP8tPn4YEy0BMB
	 CHVyP6TUVJztkFtL3uZuNTXZygsw+rBNOPFW2yDhTaZI6IlWNeV0nFfTtkzItjcK+VC7U
	 /KqCro/2imT9J17D9QL1drkLntWE0/YojeS/5qpkBJzCaSWk2LsDN8CzPnIQ5HlqsBlZg
	 RtnOH51FNt0L9LBLZ4/3XnZ+f5A9xqT7NEXuaVOjw81W+Plsh3/cC11f5gNrXdI/chVu7
	 D++0DWghS5TkLMp8JaPHEDhV/fCMfHe7iu4TQGJxWqEqVB2Yi2h3sTMqzfEN83U5m7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Y274FTxmYUf/DB32r7y0TPNxArDWceGAMS3nEe5VkhQ=;
	b=qGw2RxTSfVVxcaaHCVr0rgWvjmNQ02XZsmHy4CSPBxNoKiEpeiUybQgnbnWxgsUw7Cee
	 WrnHWbtnmVJBI5LB4gRYXdqd4DEjORYsTmFzN/C1ENXXjl8J4wfEtyXduUFzcP5vSFzcF
	 mjkb8mys7WPYnJxo4FNuEMsi/Kov9o9fuPGbnzu4dmbDexnlRjLdD4Uzc/XMf3MbDJqJt
	 QJnigzGfxk+gIzuAJ8Cw9ZaWo1v/xNXOT+ZimzswsxADXzUKMnpm4iTASQvd9aEv0/rSB
	 L9hyaLZEWf9+ecDl6AfdgtLKmrPU37TjUQCUNPDe1fZDEWil1CyNHl9BrWL44xYeqFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WXSm9StN;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF8560A262C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF8560A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WXSm9StN
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9eb579c0eso7925745ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792436504; x=1793041304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y274FTxmYUf/DB32r7y0TPNxArDWceGAMS3nEe5VkhQ=;
        b=WXSm9StNeip5WrR3Wjoa/TKhkiiPRntjCZ1+X18Qi/8d4Qf4ccjYiEf5gvvsJWt8I7
         bHlUHOvt/u1aGdJhHyOJLciuJ0h1KHPOVHjpKKJvCKCQxQhE5jj9M5KjjpamxhryJY8C
         JPT9p+1purQBv8fw4DA2kBcferO0Vc0V7FZHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436504; x=1793041304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y274FTxmYUf/DB32r7y0TPNxArDWceGAMS3nEe5VkhQ=;
        b=DKGzUjBvoz2C+q+i9avZezsxgEOZ2e8camTEmiGZUmzfhA2za38WMGP7LUOBO0GFhB
         NGOh/pBzc7KIJ/7zXu71oRYkLi0BUReH17lCKqGbCKfeewV62ykJfU78WOUp4nYzxb3F
         gm4L7VqsWly2ZH58g5PJU3SPBcUQaf/EDc1MR7uoy896R9PJQwgD34yc5ETvSN2ZZiCH
         tozHkyc18WvXLxmxZciaKNp171Ko0+q0Xb7A4hio+RqdV81uzn3HMV6phlaEpdSnu95V
         n8TQ18p+cq86LUteHdAyz25SuFdJDRzUyOIaGbTFe5mX1Rb0JR4pWts2fNkTvq0w4Zdl
         Aegw==
X-Forwarded-Encrypted: i=1; AKwUvBxBHdo9ZXorf7Wyhqg/xEkrQh+QU14s8zSjLbF3Cm0OU2DOGLvQZTZE/f7K+czbKIzb8TrDaebhWJUUSrc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjHpu74Pq6sMqgH0HydBj0zQ2uI5NLap0b/ZoCnEDM0ufHwplp
	/qMtYjgHb37lzFEN1Lbsoh7wk9nAhJdjCVU4/gNXfyst1dNSWrgv2LXpIEYW7g2btQ==
X-Gm-Gg: AYBFou3h+tHGrNrxaeOZntKnDepVPxVmPvCZzwIhZhhHaMy7iTOEs2zsTzfu7kaYLzi
	s7wqq9X/bzOPx0goSOO1Lt+JhyYVhBTtaUk8D06FL2BRxfqprf1vERga757awZYZRe2kPlIfd7s
	X8xwUxxfdk3m+/44/a/+kmMrV4rdz8l68hTrxcZXVp5l01zyJtktR1tVDP8j4fyxlAJxnr+yhdc
	u30aQCL5ajStc0BDWQUYaP7Kl/Bn1sdZw95HEXPqCMy0bY56X9jNJKNlfdK7SAeQOQHlKFhkJcc
	mxJqCTEf4DXDVtK6HEfv9hPKwHKm6s46zdu0koRADv2E1/3gEevk4ozuswqO86nYbb6yVTolj2P
	AwJXNKGGC2FwPpinskJjB9iY4JFs33tn/n9kXgljHC0UNbh3H0HHYtw9I77gEFEBfrS2SL56hgx
	31qvdLcHXtcECwuwHG/OU7HHee6J+U+PAorGab69D0KMhC9itDrrAZszKnMAIiySI8vrlL6YaHm
	v5CCBgNZFzWXrJeBurE+OHKkDZ5ECfR+m6BZ0K30aA3mNCRPTOgimmgzhn5bVC9pJrBlGiiF2L5
	8bHLog==
X-Received: by 2002:a17:903:196b:b0:2e8:422e:19c5 with SMTP id d9443c01a7336-2e9a6c13951mr68093305ad.55.1792436503515;
        Mon, 19 Oct 2026 12:01:43 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151e1b7esm4473105ad.75.2026.10.19.12.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:01:42 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Mon, 19 Oct 2026 19:01:23 +0000
Subject: [PATCH v6 11/11] HID: spi-hid: add panel follower support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-send-upstream-v6-11-cb9ba4b3d6fa@chromium.org>
References: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
In-Reply-To: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792436487; l=11787;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=58Z5ay6cDlPDvzDgbQSMgMYgeRWx5N4kbp52bg9SFvU=;
 b=vtse1LNlmFkZ8YhPhTjehDIf2rFltt7WFZ1zjOUr0uz2IK85yhSTsNvjAL8GKUxAVeLxD10rn
 iCi51tQF17nDero898EYpCdb5JD+LUTOfy4/WnsPpCXQo7mq4ZJJaRg
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

Add support to spi-hid to be a panel follower.

Tested-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 drivers/hid/spi-hid/Kconfig        |   4 +
 drivers/hid/spi-hid/spi-hid-core.c | 213 ++++++++++++++++++++++++++++---------
 drivers/hid/spi-hid/spi-hid-core.h |   7 ++
 3 files changed, 174 insertions(+), 50 deletions(-)

diff --git a/drivers/hid/spi-hid/Kconfig b/drivers/hid/spi-hid/Kconfig
index 63f202975ac3..656dbda1c5d8 100644
--- a/drivers/hid/spi-hid/Kconfig
+++ b/drivers/hid/spi-hid/Kconfig
@@ -13,6 +13,7 @@ if SPI_HID
 config SPI_HID_ACPI
 	tristate "HID over SPI transport layer ACPI driver"
 	depends on ACPI
+	depends on DRM || !DRM
 	select RESET_CONTROLLER
 	select SPI_HID_CORE
 	help
@@ -29,6 +30,7 @@ config SPI_HID_ACPI
 config SPI_HID_OF
 	tristate "HID over SPI transport layer Open Firmware driver"
 	depends on OF
+	depends on DRM || !DRM
 	select SPI_HID_CORE
 	help
 	  Say Y here if you use a keyboard, a touchpad, a touchscreen, or any
@@ -43,4 +45,6 @@ config SPI_HID_OF
 
 config SPI_HID_CORE
 	tristate
+	# We need to call into panel code so if DRM=m, this can't be 'y'
+	depends on DRM || !DRM
 endif
diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/spi-hid-core.c
index c2232d5959b8..8b2e21be5107 100644
--- a/drivers/hid/spi-hid/spi-hid-core.c
+++ b/drivers/hid/spi-hid/spi-hid-core.c
@@ -281,7 +281,9 @@ static int spi_hid_suspend(struct spi_hid *shid)
 			if (error) {
 				dev_err(dev, "%s failed to suspend hid driver: %d\n",
 					__func__, error);
-				return error;
+				/* A follower powers off with the panel anyway. */
+				if (!shid->is_panel_follower)
+					return error;
 			}
 		}
 	}
@@ -311,6 +313,9 @@ static int spi_hid_suspend(struct spi_hid *shid)
 				dev_err(dev, "%s: could not power down\n", __func__);
 				shid->regulator_error_count++;
 				shid->regulator_last_error = error;
+			}
+			/* A follower powers off with the panel anyway. */
+			if (error && !shid->is_panel_follower) {
 				/*
 				 * Undo partial suspend before returning error.
 				 * Complete the reset; RESET_PENDING stays set
@@ -346,26 +351,28 @@ static int spi_hid_resume(struct spi_hid *shid)
 		return 0;
 	}
 
-	if (!device_may_wakeup(dev)) {
-		if (shid->power_state == HIDSPI_OFF) {
-			shid->ops->assert_reset(shid->ops);
+	/*
+	 * Check power_state, not device_may_wakeup(): power/wakeup can change
+	 * while the device is off.
+	 */
+	if (shid->power_state == HIDSPI_OFF) {
+		shid->ops->assert_reset(shid->ops);
 
-			shid->ops->sleep_minimal_reset_delay(shid->ops);
+		shid->ops->sleep_minimal_reset_delay(shid->ops);
 
-			error = shid->ops->power_up(shid->ops);
-			if (error) {
-				dev_err(dev, "%s: could not power up\n", __func__);
-				shid->regulator_error_count++;
-				shid->regulator_last_error = error;
-				/* Suspend runs next even if resume fails. */
-				enable_irq(shid->spi->irq);
-				return error;
-			}
-			shid->power_state = HIDSPI_ON;
-			reinit_completion(&shid->reset_done);
-			shid->ops->deassert_reset(shid->ops);
-			was_reset = true;
+		error = shid->ops->power_up(shid->ops);
+		if (error) {
+			dev_err(dev, "%s: could not power up\n", __func__);
+			shid->regulator_error_count++;
+			shid->regulator_last_error = error;
+			/* Suspend runs next even if resume fails. */
+			enable_irq(shid->spi->irq);
+			return error;
 		}
+		shid->power_state = HIDSPI_ON;
+		reinit_completion(&shid->reset_done);
+		shid->ops->deassert_reset(shid->ops);
+		was_reset = true;
 	}
 
 	enable_irq(shid->spi->irq);
@@ -1504,6 +1511,110 @@ const struct attribute_group *spi_hid_groups[] = {
 };
 EXPORT_SYMBOL_GPL(spi_hid_groups);
 
+/*
+ * At the end of probe we initialize the device:
+ *   0) assert reset, bias the interrupt line
+ *   1) sleep minimal reset delay
+ *   2) power up the device
+ *   3) deassert reset (high)
+ * After this we expect an IRQ with a reset response.
+ */
+static int spi_hid_dev_init(struct spi_hid *shid)
+{
+	struct spi_device *spi = shid->spi;
+	struct device *dev = &spi->dev;
+	int error;
+
+	guard(mutex)(&shid->power_lock);
+
+	shid->ops->assert_reset(shid->ops);
+
+	shid->ops->sleep_minimal_reset_delay(shid->ops);
+
+	error = shid->ops->power_up(shid->ops);
+	if (error) {
+		dev_err(dev, "%s: could not power up\n", __func__);
+		shid->regulator_error_count++;
+		shid->regulator_last_error = error;
+		return error;
+	}
+
+	shid->power_state = HIDSPI_ON;
+	error = shid->ops->deassert_reset(shid->ops);
+	if (error) {
+		dev_err(dev, "%s: failed to deassert reset: %d\n", __func__, error);
+		shid->ops->power_down(shid->ops);
+		shid->power_state = HIDSPI_OFF;
+		return error;
+	}
+
+	enable_irq(spi->irq);
+
+	return 0;
+}
+
+static void spi_hid_panel_follower_work(struct work_struct *work)
+{
+	struct spi_hid *shid = container_of(work, struct spi_hid,
+					    panel_follower_work);
+	int error;
+
+	/* Also does the first power up: probe leaves the device off. */
+	error = spi_hid_resume(shid);
+	if (error)
+		dev_warn(&shid->spi->dev, "Power on failed: %d\n", error);
+	/* Even a failed resume enables the IRQ; let suspend undo it. */
+	WRITE_ONCE(shid->panel_follower_work_finished, true);
+}
+
+static int spi_hid_panel_follower_resume(struct drm_panel_follower *follower)
+{
+	struct spi_hid *shid = container_of(follower, struct spi_hid, panel_follower);
+
+	/* Powering on can be slow; don't block the panel's power up. */
+	WRITE_ONCE(shid->panel_follower_work_finished, false);
+	schedule_work(&shid->panel_follower_work);
+
+	return 0;
+}
+
+static int spi_hid_panel_follower_suspend(struct drm_panel_follower *follower)
+{
+	struct spi_hid *shid = container_of(follower, struct spi_hid, panel_follower);
+
+	cancel_work_sync(&shid->panel_follower_work);
+
+	if (!READ_ONCE(shid->panel_follower_work_finished))
+		return 0;
+
+	return spi_hid_suspend(shid);
+}
+
+static const struct drm_panel_follower_funcs
+				spi_hid_panel_follower_prepare_funcs = {
+	.panel_prepared = spi_hid_panel_follower_resume,
+	.panel_unpreparing = spi_hid_panel_follower_suspend,
+};
+
+static int spi_hid_register_panel_follower(struct spi_hid *shid)
+{
+	struct device *dev = &shid->spi->dev;
+
+	shid->panel_follower.funcs = &spi_hid_panel_follower_prepare_funcs;
+
+	/*
+	 * If we're not in control of our own power up/power down then we can't
+	 * do the logic to manage wakeups. Give a warning if a user thought
+	 * that was possible then force the capability off.
+	 */
+	if (device_can_wakeup(dev)) {
+		dev_warn(dev, "Can't wakeup if following panel\n");
+		device_set_wakeup_capable(dev, false);
+	}
+
+	return drm_panel_add_follower(dev, &shid->panel_follower);
+}
+
 int spi_hid_core_probe(struct spi_device *spi, struct spihid_ops *ops,
 		       struct spi_hid_conf *conf)
 {
@@ -1519,10 +1630,11 @@ int spi_hid_core_probe(struct spi_device *spi, struct spihid_ops *ops,
 		return -ENOMEM;
 
 	shid->spi = spi;
-	shid->power_state = HIDSPI_ON;
+	shid->power_state = HIDSPI_OFF;
 	shid->ops = ops;
 	shid->conf = conf;
 	set_bit(SPI_HID_RESET_PENDING, &shid->flags);
+	shid->is_panel_follower = drm_is_panel_follower(&spi->dev);
 
 	spi_set_drvdata(spi, shid);
 
@@ -1537,6 +1649,7 @@ int spi_hid_core_probe(struct spi_device *spi, struct spihid_ops *ops,
 	init_completion(&shid->reset_done);
 
 	INIT_WORK(&shid->reset_work, spi_hid_reset_work);
+	INIT_WORK(&shid->panel_follower_work, spi_hid_panel_follower_work);
 
 	/*
 	 * we need to allocate the buffer without knowing the maximum
@@ -1547,20 +1660,6 @@ int spi_hid_core_probe(struct spi_device *spi, struct spihid_ops *ops,
 	if (error)
 		return error;
 
-	/*
-	 * At the end of probe we initialize the device:
-	 *   0) assert reset, bias the interrupt line
-	 *   1) sleep minimal reset delay
-	 *   2) request IRQ
-	 *   3) power up the device
-	 *   4) deassert reset (high)
-	 * After this we expect an IRQ with a reset response.
-	 */
-
-	shid->ops->assert_reset(shid->ops);
-
-	shid->ops->sleep_minimal_reset_delay(shid->ops);
-
 	error = devm_request_threaded_irq(dev, spi->irq, NULL, spi_hid_dev_irq,
 					  IRQF_ONESHOT | IRQF_NO_AUTOEN, dev_name(&spi->dev), shid);
 	if (error) {
@@ -1580,21 +1679,17 @@ int spi_hid_core_probe(struct spi_device *spi, struct spihid_ops *ops,
 		}
 	}
 
-	error = shid->ops->power_up(shid->ops);
-	if (error) {
-		dev_err(dev, "%s: could not power up\n", __func__);
-		return error;
-	}
-
-	error = shid->ops->deassert_reset(shid->ops);
-	if (error) {
-		dev_err(dev, "%s: failed to deassert reset: %d\n", __func__, error);
-		shid->ops->power_down(shid->ops);
-		return error;
+	if (shid->is_panel_follower) {
+		error = spi_hid_register_panel_follower(shid);
+		if (error)
+			return dev_err_probe(dev, error,
+					     "Failed to register panel follower\n");
+	} else {
+		error = spi_hid_dev_init(shid);
+		if (error)
+			return error;
 	}
 
-	enable_irq(spi->irq);
-
 	dev_dbg(dev, "%s: d3 -> %s\n", __func__,
 		spi_hid_power_mode_string(shid->power_state));
 
@@ -1608,15 +1703,27 @@ void spi_hid_core_remove(struct spi_device *spi)
 	struct device *dev = &spi->dev;
 	int error;
 
+	if (shid->is_panel_follower) {
+		drm_panel_remove_follower(&shid->panel_follower);
+		/* Already cancelled by panel_unpreparing; be explicit. */
+		cancel_work_sync(&shid->panel_follower_work);
+	}
+
+	/*
+	 * Follower suspend above can be skipped. Disabling again is
+	 * fine: nothing re-enables the IRQ before devres frees it.
+	 */
 	disable_irq(spi->irq);
 	disable_work_sync(&shid->reset_work);
 
 	spi_hid_stop_hid(shid);
 
-	shid->ops->assert_reset(shid->ops);
-	error = shid->ops->power_down(shid->ops);
-	if (error)
-		dev_err(dev, "failed to disable regulator\n");
+	if (shid->power_state != HIDSPI_OFF) {
+		shid->ops->assert_reset(shid->ops);
+		error = shid->ops->power_down(shid->ops);
+		if (error)
+			dev_err(dev, "failed to disable regulator\n");
+	}
 }
 EXPORT_SYMBOL_GPL(spi_hid_core_remove);
 
@@ -1624,6 +1731,9 @@ static int spi_hid_core_pm_suspend(struct device *dev)
 {
 	struct spi_hid *shid = dev_get_drvdata(dev);
 
+	if (shid->is_panel_follower)
+		return 0;
+
 	return spi_hid_suspend(shid);
 }
 
@@ -1631,6 +1741,9 @@ static int spi_hid_core_pm_resume(struct device *dev)
 {
 	struct spi_hid *shid = dev_get_drvdata(dev);
 
+	if (shid->is_panel_follower)
+		return 0;
+
 	return spi_hid_resume(shid);
 }
 
diff --git a/drivers/hid/spi-hid/spi-hid-core.h b/drivers/hid/spi-hid/spi-hid-core.h
index 0b3248aedfce..631897dd9e8a 100644
--- a/drivers/hid/spi-hid/spi-hid-core.h
+++ b/drivers/hid/spi-hid/spi-hid-core.h
@@ -10,6 +10,8 @@
 #include <linux/hid-over-spi.h>
 #include <linux/spi/spi.h>
 
+#include <drm/drm_panel.h>
+
 /* Protocol message size constants */
 #define SPI_HID_READ_APPROVAL_LEN		5
 #define SPI_HID_OUTPUT_HEADER_LEN		8
@@ -56,6 +58,10 @@ struct spi_hid {
 	struct spi_hid_input_buf *input;	/* Input buffer. */
 	struct spi_hid_input_buf *response;	/* Response buffer. */
 
+	struct drm_panel_follower panel_follower;
+	bool	is_panel_follower;
+	bool	panel_follower_work_finished;
+
 	u16 response_length;
 	u16 bufsize;
 	/* Response type awaited by a sync request, 0 if none. Protected by io_lock. */
@@ -70,6 +76,7 @@ struct spi_hid {
 	unsigned long flags;	/* device flags. */
 
 	struct work_struct reset_work;
+	struct work_struct panel_follower_work;
 
 	/*
 	 * Serializes request/response transactions: held from sending a

-- 
2.56.0.212.g129ede20d9-goog

