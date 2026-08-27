Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5C14C041B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854552; cv=none; b=rWoZona8eyN7kJrW9kItWtmELXe1jKjtlKBcj0EPRre+RA5UobRPALarXmaJr1xBcgvy0dDyeb6qh83RSU90cZ/JnkFtieywueRG7N0S6Tuw96rrphKMYHKf/SI5n5wmE6lrcWYV7XR7Ja4OCMcYHWbj5snZtRHDcbEr75PlvTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854552; c=relaxed/simple;
	bh=ckc8FkDkb9M0LAM+evqiPYa91VL4+DdqAnNqcyGfXYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rCVEBHJ440DT3nlaASnmtxfbgp1jL+JhsHDsY99pjq5sKZrzEkI4CCFMIiHL6EtTBNA6URrH0vaq1BpSh9xmdkvMLSETivEu9fYgc9u8vj8KqO00E1GeHvuOEsz1yeCx1gH2oGjeGc5RvLgAHDPZlrb2hL6o4kbvqXH9cm2er2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G58W74Sg; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G58W74Sg"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482dbc9a00bso912307f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854549; x=1788459349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=99K52MFrXitb/5eSxqqdY34LKDmtUZkM1XLavpfakFE=;
        b=G58W74SgJWM820oGwpThHeclSJ7f8ou+jYMF75ys/4WCoAah0q03UgHk1g9M703NBe
         wfSMI7ETbGcfpGVTFzIL8Zb7SE0WFgCqh6825Xxq/xLKRa39efAd/u/F0PocXMFbbd8t
         3AHNmLNtd4kEC87w7Q2OhtRuYlvizEDEN5gc7zjUEX+JIyPYe+YflbO/ZqBJ3C6D66Xv
         KJaAvmZKusBopRy08copmk+ptPM8srb1lNpNLDdsg1Gv4jOisJ+rrXqCTBymu75Th5pl
         YQjI7UnNTkjllOwpEQJsb9TWyaB7hYR24/EVyClFya69F/jQYo61jgrPLifgEQ4+0N5X
         hgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854549; x=1788459349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=99K52MFrXitb/5eSxqqdY34LKDmtUZkM1XLavpfakFE=;
        b=o44h4pq9x7Al7//Xlat+Btnks4CvZ/waElEaER9ruxgiHEaafoxqjxkCpEGaDP0QY/
         78MR3q6tYNUF0uFc+5HtjwvE2Jw4/K1glncGPihItpAKYcU6dlFaX7msWO1LsZnNLBBt
         SNraItqn9O1iRMkhfCp51PVzP6Zwi9voOwHo2QZmnYPAsC4fHgdXngrqEtVpM5WKCwwS
         gu/MBsjYyDDiVcURSbnTPjHVz1NN6+IcWVewxoeu4hWlMPt8UKmLSQnMtgzGcmBd62oB
         IlJFe+18DWYO5O2GqMq0wJt/mQKwQIg/A5c6eSVdJbXt5p7NMFGoRb6iEtmckfuZb32c
         7iog==
X-Forwarded-Encrypted: i=1; AHgh+RoVabGO1kwc2dG4T+zp8iyKDtqrKg6CZNEpbnk70UZRiXYfnI41eFhQE10IIWKq/iGLrLSHTx+dldOPd3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mmy5jSahBoeGuBrmLOj7dWzbujjr5PEYdcmGlrbMfrm1jNn+bb
	fJiPJ+xq25ORzRypwrH3/RzIsrCgDZeIpVm0Oanpw4JG/5m1LcGy4KGFw+h9pDWN
X-Gm-Gg: AR+sD11N1fXABnxmUctbDfV1ORfw5pcfwYCzIb/BLuTPCSEKBxKtpPZkaMxR7HPeiME
	VNVPDVjP/U+Kjue36BugTTSOYXMA1kIoxE730lxmU2/lINZuZ21m+MZPE0w54oNHFBt4prOeGbp
	bqZTUJM3r8eHHyvVtCBJOsRQgTvJJIVwA/rlvA2HFssvyWkuIy7rDd91mQ4F3cQMDNNRNdxOox4
	rE7nhH8owk4U3vw9u5Pdm4QUH3sO6yQtvQQFkUcEpS1IE9mhlltOFPmpN3jUpmBF7Jn3kp0+NQB
	/O54TNewwhrAUMe7xPPp4Kgm5MgFuYNoqvsIHUb6eaAHUoxZiWq9dQ3UquZfs1b+9fnl0Pq6oyB
	Dw5Tj3Lt2tIK+SLpJnr79UHjR87sfC6/RmdrBaRAiP9WOWBWKsRKXUr6+g23AApcROdAU8q+MrF
	nLIUQ6VW0a0fYDjZVLsYVzWUT5F8hpv0sJUlDfyFhKYPhMi1XJc3lTWXDT2satum13MfvoBXqEi
	Weo6UBiUGqix5cK14dXrC6OIo1i3aec+u52iu/9wSrA
X-Received: by 2002:a5d:5e8b:0:b0:482:e66d:aad2 with SMTP id ffacd0b85a97d-482eababe33mr7102056f8f.13.1787854549184;
        Thu, 27 Aug 2026 11:15:49 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f25d4sm10345679f8f.30.2026.08.27.11.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:15:48 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH] Input: drv260x: Fix suspend and resume sequencing
Date: Thu, 27 Aug 2026 20:15:45 +0200
Message-ID: <20260827181545.2426800-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
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
Tested on a Lenovo Yoga Book YB1-X91L with both DRV2604 devices. The
system completed an RTC-timed suspend-to-RAM and resumed without rebooting;
both force-feedback devices then uploaded and played sine effects without
drv260x, I2C or configuration-restore errors.

 drivers/input/misc/drv260x.c | 42 ++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/drv260x.c b/drivers/input/misc/drv260x.c
index 6c5c4c53753b1..36e867734fc1b 100644
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
 	haptics->mode = DRV260X_LRA_NO_CAL_MODE;
 
 	/* Scale u16 magnitude into u8 register value */
@@ -569,17 +581,21 @@ static int drv260x_probe(struct i2c_client *client)
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
 
@@ -588,9 +604,15 @@ static int drv260x_suspend(struct device *dev)
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
@@ -612,16 +634,18 @@ static int drv260x_resume(struct device *dev)
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

base-commit: 9a29ee801f525bcad71fea021bfe2a030885c8df
-- 
2.53.0
