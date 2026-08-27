Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E013DD867
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872609; cv=none; b=c6PRSQeDcrsjN662wdJY2CvrLoEU/crA2/RLcESIGLfNCiwW3Wew1FmPiq9RKFf0kXCecYXjhDxMw04fFbZhAW7G6blfStPKu5ErozXSxcbEwr2h2PjJdxSEtP3YIyM/vzr5Gpx8K1egzqii29Russ2e3N2P3PCEEj98qhvB1jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872609; c=relaxed/simple;
	bh=n567tHGqvor1+SDF3naMt/LtkzaL4BIx5mwW0lj2VXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWSZFjgSDF+2C51rs3L7+U0mq5JH37tlNYN7ruoSxdn4U9Jry0s/bCNMWIqcBesJlva39DVWJqd5PGUR338N1gvlxAqdyjNWxwDLaeGQgIG5sRF31a/mlHo1T5cLQgqvIFIOX1PfYj03SbzVM23GAPqUJwxBs54V2fgEEVc9bJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pNJGxtYw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pNJGxtYw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso2385045e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872606; x=1788477406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+9S170MlscuNSfo8WIf7pJC/QBmqFjzihs/uLiPowo=;
        b=pNJGxtYwssZylexF3uJoA+WGlzU58BY1O6WR8Fe7I+RIPx4bkOeZUtWH+UBY1dehJ+
         00CK4for+gx2ajBgNRRXFk3/MwGB/ZIlxUEOPc7AFSOBYqwqreQTJgIdMovHrSKez16m
         bS/YHxLuIjy+rPXgsZcZk88sTpu7i9d3u7SsbC3Dw7K3z/dujSK7qPbgwEFCzb0uWpT0
         cmaKmw8alRQtZ9FueurPWFge+nrgWkSYyPP4UGc0846O9LKaG4U8p4c73sbe5wd5gaLl
         ieCk3TCJptkxanZO71fRbynj92H1BsUINPRxTWw+xs/zy7H2yRfAs8dQ1RXLIBSDODEk
         GqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872606; x=1788477406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+9S170MlscuNSfo8WIf7pJC/QBmqFjzihs/uLiPowo=;
        b=Bp8E3Ok86bqBrkW/mSMSGyEzfYXSOnXwXc8YmyD55sp5RL+msV13nLRiieGJCe9tJB
         rt+KhDpaJDiox+lQaurKMYdvf3DJ6BiWVA7+QPD41N3Q3BV15lZCyLFQC5uQ/GLlqfPM
         kHDhQWkZUx0LLPJEampQQmdhtUTImrw8E/IFmPghI33YSB/x1ozJzvnKziFjzDRSISUf
         SIzskAbLSI2dpFZmK1Ga5X+HWvPRNa273V6LTdPXYsCJn9/W2L+FZJZzRIvZzm3qfbrL
         fEfrSsGL5OmbdhRWEsDamFSHdXCqNp3lkT4la81laRcPjjOT0sfErukl38bCczUNbb4a
         q8Xg==
X-Forwarded-Encrypted: i=1; AHgh+RrRklf7YXvvyS7mlRLH+6qhLUyUrlS0UMWKncBMfqBYq4k/tP67TIxj5lqOgdiFOvU1gNKMpX4LymRB1CI=@vger.kernel.org
X-Gm-Message-State: AFuF++nrdiXPLNlESEff152n7mMIwAgrVtgJi25iV4lrMFxAyF+mKudE
	U/HpVK/KbF2LedEDMSMarQJK6ALTolUQi6s6RzD12+nb8vxV/xYbQ90P
X-Gm-Gg: AR+sD10au3NF1r6mfGcu5K+fwr1Tj2B/gcGbMlBP2/zmrqQ+5FwrJTwWP0w2u9RJIAj
	5U99HnHm1nVn3VIWbzRGr7+K/HDOMwALoq/DbSowUyv/RNhyPc5mYPG70wa4Su4Hvzwi2oCfwxP
	tcUFXtzy6F5FDqSFhO48scogsXsXmiaf46v/glxOkLd0dyrr/9gPpOAFKmiDRo9ig6YVwLk3ILu
	gIM0/r8eKvZal5EeUp03wSdA00GfoqEPl1PrwxOETraNSlXdzUa2XbzJRl7TxWoF5swuyPuywgS
	07xojZp+D9OA6jvpXr0bjGamHSPnKeJxf2GKMEKDbfp0GpKHK1aABv2pf+7sQqtFMAC5K2OQeKP
	wSXO+JAEqD0QpAWZiOmN6AJDxV5wJbwz28C/5C0ybRtvVZNEq+7jfmWGG6tFhkr1OPZKyjhndFV
	za6fYqHDlwqavVwW1depyumqwwp9nf1fOkovt3GrbzT7t82uqJk1Rb0+8YLGXHtYPA2HvUfaZV6
	YybTlZJwoRx5Dw+QHhJOkKup8njofyXlk7zemlnkEqof2qgd3S9zk1e
X-Received: by 2002:a05:600c:870c:b0:499:dc34:bdc with SMTP id 5b1f17b1804b1-49b91c1c401mr40582115e9.1.1787872605613;
        Thu, 27 Aug 2026 16:16:45 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9269f1b6sm9835725e9.4.2026.08.27.16.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:16:44 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 2/2] Input: drv260x: Fix suspend and resume sequencing
Date: Fri, 28 Aug 2026 01:16:37 +0200
Message-ID: <4454f96d3f5b78db90732cea5c1b1373ed0a2d65.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.input-v2.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.input-v2.1787872237.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Force-feedback playback is queued asynchronously, but system suspend
can cut the enable GPIO and vbat supply while the worker is pending.
Quiesce the worker and reject new playback requests after suspend
begins.

The enable pin also disables I2C and resets volatile configuration.
Raise it before communicating on resume, observe the startup delay,
and rerun device initialization. Restore the same state if regulator
shutdown aborts suspend.

Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/input/misc/drv260x.c | 42 ++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/drv260x.c b/drivers/input/misc/drv260x.c
index f26a9052edd2..c64a86bc9bfd 100644
--- a/drivers/input/misc/drv260x.c
+++ b/drivers/input/misc/drv260x.c
@@ -181,6 +181,7 @@
  * @work: Work item used to off load the enable/disable of the vibration
  * @enable_gpio: Pointer to the gpio used for enable/disabling
  * @regulator: Pointer to the regulator for the IC
+ * @suspended: Whether force-feedback work must remain quiesced
  * @magnitude: Magnitude of the vibration event
  * @mode: The operating mode of the IC (LRA_NO_CAL, ERM or LRA)
  * @library: The vibration library to be used
@@ -194,6 +195,7 @@ struct drv260x_data {
 	struct work_struct work;
 	struct gpio_desc *enable_gpio;
 	struct regulator *regulator;
+	bool suspended;
 	u8 magnitude;
 	u32 mode;
 	u32 library;
@@ -215,6 +217,13 @@ static int drv260x_calculate_voltage(unsigned int voltage)
 	return (voltage * 255 / 5600);
 }
 
+static void drv260x_set_suspended(struct drv260x_data *haptics,
+				  bool suspended)
+{
+	scoped_guard(spinlock_irqsave, &haptics->input_dev->event_lock)
+		haptics->suspended = suspended;
+}
+
 static void drv260x_worker(struct work_struct *work)
 {
 	struct drv260x_data *haptics = container_of(work, struct drv260x_data, work);
@@ -243,6 +252,9 @@ static int drv260x_haptics_play(struct input_dev *input, void *data,
 {
 	struct drv260x_data *haptics = input_get_drvdata(input);
 
+	if (haptics->suspended)
+		return 0;
+
 	/* Scale u16 magnitude into u8 register value */
 	if (effect->u.rumble.strong_magnitude > 0)
 		haptics->magnitude = effect->u.rumble.strong_magnitude >> 8;
@@ -583,17 +595,21 @@ static int drv260x_probe(struct i2c_client *client)
 static int drv260x_suspend(struct device *dev)
 {
 	struct drv260x_data *haptics = dev_get_drvdata(dev);
-	int error;
+	int error, restore_error;
 
 	guard(mutex)(&haptics->input_dev->mutex);
 
 	if (input_device_enabled(haptics->input_dev)) {
+		drv260x_set_suspended(haptics, true);
+		cancel_work_sync(&haptics->work);
+
 		error = regmap_update_bits(haptics->regmap,
 					   DRV260X_MODE,
 					   DRV260X_STANDBY_MASK,
 					   DRV260X_STANDBY);
 		if (error) {
 			dev_err(dev, "Failed to set standby mode\n");
+			drv260x_set_suspended(haptics, false);
 			return error;
 		}
 
@@ -602,9 +618,15 @@ static int drv260x_suspend(struct device *dev)
 		error = regulator_disable(haptics->regulator);
 		if (error) {
 			dev_err(dev, "Failed to disable regulator\n");
-			regmap_update_bits(haptics->regmap,
-					   DRV260X_MODE,
-					   DRV260X_STANDBY_MASK, 0);
+
+			gpiod_set_value(haptics->enable_gpio, 1);
+			usleep_range(250, 500);
+			restore_error = drv260x_init(haptics);
+			if (restore_error)
+				dev_err(dev, "Failed to restore configuration: %d\n",
+					restore_error);
+
+			drv260x_set_suspended(haptics, false);
 			return error;
 		}
 	}
@@ -626,16 +648,18 @@ static int drv260x_resume(struct device *dev)
 			return error;
 		}
 
-		error = regmap_update_bits(haptics->regmap,
-					   DRV260X_MODE,
-					   DRV260X_STANDBY_MASK, 0);
+		gpiod_set_value(haptics->enable_gpio, 1);
+		usleep_range(250, 500);
+
+		error = drv260x_init(haptics);
 		if (error) {
-			dev_err(dev, "Failed to unset standby mode\n");
+			dev_err(dev, "Failed to restore configuration: %d\n", error);
+			gpiod_set_value(haptics->enable_gpio, 0);
 			regulator_disable(haptics->regulator);
 			return error;
 		}
 
-		gpiod_set_value(haptics->enable_gpio, 1);
+		drv260x_set_suspended(haptics, false);
 	}
 
 	return 0;
-- 
2.53.0

