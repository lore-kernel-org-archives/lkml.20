Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EA350AC01
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584818; cv=none; b=WGSEN4oRyfloUDYaEyg5M6hPzs6W2YyrDuD/vHQzgs58rQkJ2St1U0aNkG5584IGu6XMCqPWJXqhLeW7lTWw5pt+RpbxC/9ZkgslVEOJonkyXDyswPrlph0Ia/k7JQh+fP6kbwwOva/0R2bnOx2tXmfj92X0TaCqYT/oCU/U/MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584818; c=relaxed/simple;
	bh=unw5zMwdvMtoBVFWdrNPB7qFOqUjieNs37XXGa9Ul+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YfPIxq/nYyV/TBCAzr8dMfisrRd85LwgBcGyb+eoXcI4XZ0TBtEpSNUfuTistkoJVb5UpcU0PpwenkMMjXbjZ5W9rWLHLK1+dylJkL2A42CA6DbZWkfFrfpTolMadLIiuV9vYePfpTV4lH5csKc+Ukk2ZAalhBNRGsDgAr5GrxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LCdqRi/b; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LCdqRi/b"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso1152905ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791584807; x=1792189607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJ3I7IGk7h8CZdV1vx7rtIKO45AeWKr5K8KA6AozVQQ=;
        b=LCdqRi/b6BbDLniKKbC/PBZX4qViYyzDBwkzWD+NB76ieRHZTr7cgx2yKIqEO2go05
         YVIhSwqI7gMA7xHnPYqg+LglctWMksOHBpDVnB1OWF5jvr2KvIRXWVz/osHaUqXNHAJW
         bepsRhz3dV5zttp8OETMm2kePSMtNodKSDJ7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584807; x=1792189607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJ3I7IGk7h8CZdV1vx7rtIKO45AeWKr5K8KA6AozVQQ=;
        b=Gh/Kl7L+wqpioKmlovPCRzPn/YEm17Y0WclDccaZW2tuRWcR7q9Vy6IDjzTWPZNEjb
         0H95tWf9Nm2B0/CK4JbDI/N+okWqLXy76J4NX17l4CkLUmUQmFMmoGUj2u6lCMTT7Q7G
         rbUOEM3QLOn0m2+MdBecErTYZA7mSqcZRfgEYDenr0VoJjiqBNk3s5lkvGBPAESyKYHA
         dnyTzzBuAh8Ri2fr8yb+6XVpZ/2i3sxzg9Qe0sL72xyT8BlyvzVBJjXkM/8e3JQAWf1u
         6jpdJrZj+XvWWgI5r4/kgl2djnSRgyhZ0BPO12CEtvgkKb9MSvZrwn9g+3LrgjTKb4z/
         1X9w==
X-Forwarded-Encrypted: i=1; AKwUvBxi4IXXkgz6UeTn0HmBlmQF6IWul07fQ+iL2rmY24YKSMVTPJIvDlQnCgq2vrgOdnOs8YA1fOW+7SVg0XU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ2PO7tQ0x1VCzvtvFJruqprZ39oViuwbfUKlwJwZDga0MICOK
	FqPvVdqR/xEdLnl3mTwKIh384Lq3IiD4ucTK9fcjqO4Qg2KAq1H9shrDfLVIrcZwqA==
X-Gm-Gg: AYBFou2Mlioxi+C0Awqymo45I21ps9wXLL3cYwNz7npqKtqH0lxRr6/pba6fGRvIYUk
	Fz937YfJLT3Dk5KhLYUy+rgsyjSEGrrmZ5qIXaFHQswp5Cboie3VAZudiafcI+NInfbfJWWJBby
	83YEgeQDsLwyNiLQexc7ZUltBWRYc5GLRZFLMHkBfz4WIjgBxKvPE23jJeciDXsZfPuvVBSoeol
	Aw05DUMd+lxIp/JUoWZCv2g5i2ScnUYufZSnfF/JHCtuPuTgO35gx5CypTRQv6sMtPgAfih0glz
	oI0ee/Xs+nSkZI3dO4G1OTGNEnNF4dFeiutmQD/+4VK6afzkMbctzhfxksKWISW0i1pZatt1Kda
	b17EaLNiAz5Qk1whgWTnJDTDoyncGSsIalO0nkngxJVeYkmrM6XufXz3HZ3PAqvM5P/9Gn9/EQJ
	SWA6UuV9sPFvR2OQoP3qRe3l2ZkUUezsGj1uGX6OJoy492ZFgDhrIJiCdo5s1eIzQppLoHKwkFd
	NMLTO9eYUuPIEaGNzSof93VlIJZRlWRrxIbCVACJhTwJ3KIQdkT4E1Wt5DKezHo2fHdw9G0M8kE
	HA==
X-Received: by 2002:a17:902:e748:b0:2dd:c100:4259 with SMTP id d9443c01a7336-2e842f13e23mr27084475ad.61.1791584806549;
        Fri, 09 Oct 2026 15:26:46 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (35.152.82.34.bc.googleusercontent.com. [34.82.152.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e503sm16660725ad.17.2026.10.09.15.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:26:45 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 09 Oct 2026 22:25:36 +0000
Subject: [PATCH v5 11/11] HID: spi-hid: add panel follower support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-send-upstream-v5-11-384af01da3ee@chromium.org>
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
In-Reply-To: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791584797; l=11787;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=unw5zMwdvMtoBVFWdrNPB7qFOqUjieNs37XXGa9Ul+g=;
 b=KnSO/SunBYCSYVcTxf/1/1PsL30eDfCPt51pZKFhaLoM0NIknoyjS8KoWf0PGZwmKqD3HsyZm
 Gw/GqK4yxqFCHYwKlw/fz1f7ENvFKKQiEc68BcNjoIqFCS/mRUt2w5I
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
index 66bfc251bd91..106e92b71ffb 100644
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
@@ -1501,6 +1508,110 @@ const struct attribute_group *spi_hid_groups[] = {
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
@@ -1516,10 +1627,11 @@ int spi_hid_core_probe(struct spi_device *spi, struct spihid_ops *ops,
 		return -ENOMEM;
 
 	shid->spi = spi;
-	shid->power_state = HIDSPI_ON;
+	shid->power_state = HIDSPI_OFF;
 	shid->ops = ops;
 	shid->conf = conf;
 	set_bit(SPI_HID_RESET_PENDING, &shid->flags);
+	shid->is_panel_follower = drm_is_panel_follower(&spi->dev);
 
 	spi_set_drvdata(spi, shid);
 
@@ -1534,6 +1646,7 @@ int spi_hid_core_probe(struct spi_device *spi, struct spihid_ops *ops,
 	init_completion(&shid->reset_done);
 
 	INIT_WORK(&shid->reset_work, spi_hid_reset_work);
+	INIT_WORK(&shid->panel_follower_work, spi_hid_panel_follower_work);
 
 	/*
 	 * we need to allocate the buffer without knowing the maximum
@@ -1544,20 +1657,6 @@ int spi_hid_core_probe(struct spi_device *spi, struct spihid_ops *ops,
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
@@ -1577,21 +1676,17 @@ int spi_hid_core_probe(struct spi_device *spi, struct spihid_ops *ops,
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
 
@@ -1605,15 +1700,27 @@ void spi_hid_core_remove(struct spi_device *spi)
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
 
@@ -1621,6 +1728,9 @@ static int spi_hid_core_pm_suspend(struct device *dev)
 {
 	struct spi_hid *shid = dev_get_drvdata(dev);
 
+	if (shid->is_panel_follower)
+		return 0;
+
 	return spi_hid_suspend(shid);
 }
 
@@ -1628,6 +1738,9 @@ static int spi_hid_core_pm_resume(struct device *dev)
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
2.56.0.385.gd3acb90ef8-goog

