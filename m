Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0113B71DB
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788099457; cv=none; b=mCSDPdxEMOyk7W9j0VAcX1Vksg+UDYteHT/SewCcbk59f29iIXli3aTq6qhfqhh4Tmn/TESWWm6mRZp7LztC7Dbwc+Fcgg9lpVQV50Bj/93fKFNCM5nfZwgEYT6KdepRlNz53C2a36EI7kf6wJlaS+vdgFUILVJ7mKz1QnohJUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788099457; c=relaxed/simple;
	bh=YYpAuj1PY1RFub7ck2lahF5Gc0M1QLmgcRGitoqusDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LxXcYTHyVJLa3lTw3df5FU8y7GLxUHmrd6DQ3qSTxmZKoPbZM2HEkFhe18yx0SHKruzy7b63WU4uYciFZoakPHxyR9MmcVmruletWEGqO0+YDMFikyBhmW9ApmqqaP8aENtRO+HdnTTiL1Vn0P+Em4B293vE37YcYuzh4DquZ6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MjXjvjIQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MjXjvjIQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so30332385e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788099451; x=1788704251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mm6NKReOgq/ERbyVD64APvzyNDdk3/BeVLkOCPhJjJU=;
        b=MjXjvjIQyqAnfMtqjxZDo3WbQJE1XZzNjMLboeja0zBZv4IqFXp4SBqNIYHkW6/hzd
         68ixfsZq+bhXE8VoUyPIOQh6ssCR7EV4wAbXGtoSaugAGLwyW3bEXdtw5sxF/lE4Siay
         63s9F1vgV5b37jR8gz4h3PsG/Ltc5vlHNA4wmG+lKiVEF23BqjTvuBWJKKwrI+iD5HVn
         rXJnitPtwN3gYAlRD7eOlU2PcTPiGN+aTAYLWdx96hX7Cem1MBUvGm6LSmOaH1i5Kei/
         dnlA6jucmjGfaKGzxHej55dOJkeeie3uXT5VyzySyBqFJDYGbk/MMLpRv/ss72CSdMiO
         rS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788099451; x=1788704251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mm6NKReOgq/ERbyVD64APvzyNDdk3/BeVLkOCPhJjJU=;
        b=K/2WHOtam6SeQj8WpKW8j4Tix4CavfJ4YUI4hqh1i9dQymBy/hhuQl7NUveB198qHq
         Q3sgeIxkGGS+pfRmEQAVild02ADJHNR3sv0DRKKUQJ7nk/PR3nhIV7qkn83J9LiNwicK
         OM1rhsmj+4AHl1UTd9/I9Xp1P1H6tF8hALsU6YxI1DlIHePp8EB4wTRRhVRAH/72iGs2
         IOkrSFuMpVUVLRgeUyPydfGnmNzUwtB5v/vq2MjM2/V/3GgBov2BN2hWSwpdqkIUUgUx
         yjdw7t4fjo0lHoSeDkm/4VsMB2VCliVddC05yLpZX5zpI+srDt2Rx6sMCA4eL4QTMTqU
         WEgA==
X-Forwarded-Encrypted: i=1; AHgh+RrnPw38IBNfWTVAZFAt5zid+E6X+wkD++XFgh+2gnHcRqMbYORMra1Xe1Q8hPTYC4xeWAzQeXPKsldEdk8=@vger.kernel.org
X-Gm-Message-State: AFuF++ms+9a94g2SFHbxy1wRwdFjq6cD2D/Tznmx+Gt4nZQMJPKW70td
	CfTRX+BiT+WlZJ3Lk0iQA+mvvB42wpu/2hjuDP9P1ILe+svJFZ4jMetO
X-Gm-Gg: AR+sD10X0QY3V6p7+Lq0Fc0mf62bsXsTmCTxnNLvb6wkhR5SUyQUiQ9ah6vbN9XQ/zA
	MBC3smBJ+AMHe3ZvNQWSWdxFZqqHQELK/mm4jxH1kNkh4uzowaWWaq7NPMg6no1PG3OaKsKGT/Q
	BaVMY+rB0SQR1quBszNJRAOkLxwBY2Nm8raZQIJ+sqy//haVYmGp8gi/wIKA9JaAf1DqtckLyJi
	QdoftMAAE0ZuhLUEGlJoksES3UgvTRPIe5CrCMb4lAXAvTp3Wg/bxV4ZIMOlkDGlMEZX95q1XOX
	fycF1Hv3gju19ckTySO0ZcO8PC6smed6dxRdL0PShGOMjOhXxAg/nbDCDjVnPnZygLnkEAynN/u
	9kUkcPnrKes5NzOpsWH/iSQkhJryJcSgAAaJmjSdu2qQauh8cP+c6V8Xj0YL4Ztf6oN96ozfFbG
	ELoCaVhIEBXpI/dKWPThS3hB85uRk/wk/cUZqAlgo5P3lsBPOTeH1SlR2cX5WKMaJG4/foHkWPB
	TZFyhrMNfmVYjxa+Gkzbd008e9eJHx7emXocGMSnHcx/uIwxB9XiQ==
X-Received: by 2002:a05:600c:4e14:b0:499:ae94:be05 with SMTP id 5b1f17b1804b1-49b91bd78c0mr339903405e9.0.1788099451081;
        Sun, 30 Aug 2026 07:17:31 -0700 (PDT)
Received: from 1Z10 ([37.161.215.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc1076sm203877985e9.3.2026.08.30.07.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 07:17:30 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko AI review <sashiko-bot@kernel.org>,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4] Input: drv260x: Fix suspend and resume sequencing
Date: Sun, 30 Aug 2026 16:17:28 +0200
Message-ID: <20260830141728.53320-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829230740.126461F000E9@smtp.kernel.org>
References: <20260829230740.126461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Force-feedback playback is queued asynchronously, but system suspend
can cut power while the worker is pending. Disable and drain the work
item before entering standby, and keep it disabled until resume has
restored communication.

The enable GPIO gates I2C access without resetting the device. Raise it
and observe the startup delay before leaving standby after resume or a
failed regulator shutdown.

Use explicit mutex locking with goto-based error unwinding, and balance
the work disable count on every resume error path so a later successful
resume can restore playback.

Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/linux-input/20260829230740.126461F000E9@smtp.kernel.org/
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://lore.kernel.org/linux-input/apLD91vzHIrLOPWC@google.com/
Assisted-by: Codex:gpt-5.6-sol [sparse]
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/input/misc/drv260x.c | 50 ++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/input/misc/drv260x.c b/drivers/input/misc/drv260x.c
index 6c5c4c53753b..b6499b2fcd8d 100644
--- a/drivers/input/misc/drv260x.c
+++ b/drivers/input/misc/drv260x.c
@@ -569,18 +569,20 @@ static int drv260x_probe(struct i2c_client *client)
 static int drv260x_suspend(struct device *dev)
 {
 	struct drv260x_data *haptics = dev_get_drvdata(dev);
-	int error;
+	int error, restore_error;
 
-	guard(mutex)(&haptics->input_dev->mutex);
+	mutex_lock(&haptics->input_dev->mutex);
 
 	if (input_device_enabled(haptics->input_dev)) {
+		disable_work_sync(&haptics->work);
+
 		error = regmap_update_bits(haptics->regmap,
 					   DRV260X_MODE,
 					   DRV260X_STANDBY_MASK,
 					   DRV260X_STANDBY);
 		if (error) {
 			dev_err(dev, "Failed to set standby mode\n");
-			return error;
+			goto err_enable_work;
 		}
 
 		gpiod_set_value(haptics->enable_gpio, 0);
@@ -588,14 +590,25 @@ static int drv260x_suspend(struct device *dev)
 		error = regulator_disable(haptics->regulator);
 		if (error) {
 			dev_err(dev, "Failed to disable regulator\n");
-			regmap_update_bits(haptics->regmap,
-					   DRV260X_MODE,
-					   DRV260X_STANDBY_MASK, 0);
-			return error;
+			goto err_leave_standby;
 		}
 	}
 
+	mutex_unlock(&haptics->input_dev->mutex);
 	return 0;
+
+err_leave_standby:
+	gpiod_set_value(haptics->enable_gpio, 1);
+	fsleep(250);
+	restore_error = regmap_update_bits(haptics->regmap,
+					   DRV260X_MODE,
+					   DRV260X_STANDBY_MASK, 0);
+	if (restore_error)
+		dev_err(dev, "Failed to leave standby mode: %d\n", restore_error);
+err_enable_work:
+	enable_work(&haptics->work);
+	mutex_unlock(&haptics->input_dev->mutex);
+	return error;
 }
 
 static int drv260x_resume(struct device *dev)
@@ -603,28 +616,39 @@ static int drv260x_resume(struct device *dev)
 	struct drv260x_data *haptics = dev_get_drvdata(dev);
 	int error;
 
-	guard(mutex)(&haptics->input_dev->mutex);
+	mutex_lock(&haptics->input_dev->mutex);
 
 	if (input_device_enabled(haptics->input_dev)) {
 		error = regulator_enable(haptics->regulator);
 		if (error) {
 			dev_err(dev, "Failed to enable regulator\n");
-			return error;
+			goto err_enable_work;
 		}
 
+		gpiod_set_value(haptics->enable_gpio, 1);
+		fsleep(250);
+
 		error = regmap_update_bits(haptics->regmap,
 					   DRV260X_MODE,
 					   DRV260X_STANDBY_MASK, 0);
 		if (error) {
-			dev_err(dev, "Failed to unset standby mode\n");
-			regulator_disable(haptics->regulator);
-			return error;
+			dev_err(dev, "Failed to leave standby mode: %d\n", error);
+			goto err_disable_regulator;
 		}
 
-		gpiod_set_value(haptics->enable_gpio, 1);
+		enable_work(&haptics->work);
 	}
 
+	mutex_unlock(&haptics->input_dev->mutex);
 	return 0;
+
+err_disable_regulator:
+	gpiod_set_value(haptics->enable_gpio, 0);
+	regulator_disable(haptics->regulator);
+err_enable_work:
+	enable_work(&haptics->work);
+	mutex_unlock(&haptics->input_dev->mutex);
+	return error;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(drv260x_pm_ops, drv260x_suspend, drv260x_resume);
-- 
2.53.0

