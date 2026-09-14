Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86BC3B2FF7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385944; cv=none; b=ixzLhZrP6T9/dndw52OaDw372PNj54HcoWzLiFoaSwRfHlowtlgW0uFQoo/ia8LQYQKM4XwdULux9XTuFWffNjFKshIAf0CV7IDl+nosZ65yCEYTdp/LhVH5f5XZrbsdNkqSgdZ7SWg2h6RkPzDtuRo1ohzmxki7ZPc5a+I3RDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385944; c=relaxed/simple;
	bh=nzaw1ZAmtOROpgCKmG5DjRksvIPCMA3GYz9v8u/qerU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l9dDGr7ocjN+ekqAgcxAPWu1VVICUIkDXdj/tSp2IaXuIhccfnSOa9nAjqLFNnWzgg8PZVcvl320Goj17H26UZ1wHv3QR5fge1gfiQfBkESn73JwkyyRjp2Z/x47F6rHx5DDgQ3UPILr/4g9N/5WTbQweQiJ4KFvi13CapOU62w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/roNM34; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/roNM34"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso524802a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789385942; x=1789990742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zbek3cNhmINKfcKEFQeZ34orcON/ITUbplZKcMIGouo=;
        b=L/roNM34BUUAjtnQP7Pk7v53dwOAxM1rBAP6bQ9UgN5YRxOcDVmoKV0/bzVxpOwsp0
         Thx3DYQascfxtKkbqXPiIOlTWSS2/2pxvxbtdHJQ4gKhnXId5FKvxpNnlCRKgDrqdqNJ
         GSjDxrY+KSnxGONtsRh0FzQ/oOUoxqcoYV85d2n0QMubu39LzKK7aaOzXiUxfsrvGQwk
         H04j7JjpgIsQ2tYNrZsnfC5/GrjYv7BHtsMyHspBZKXoX/gJeIHpjw469DqrQfZdLebQ
         dSz+lVVgYJJAaySp7zq95xF0JxPgAutoS3PiSmlmkpCV99dhP11idLAaUGaQ+w12EuQ5
         6pVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385942; x=1789990742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbek3cNhmINKfcKEFQeZ34orcON/ITUbplZKcMIGouo=;
        b=AZTDHcBn/N0JGoa7Bw2Db7rbASr7M9QU4qmTsdn5ROa+3l+yaTCnNkpmezOnUaAbOo
         0cwn+hKVZ7tnU2N4qsy+47vnappzprKNkLrnAf3BJdm9u9YshakxArjpSVTCFkdKSPnf
         kc/Xp7z4fP8+l1pVO49/nWQjbs4yhZ0jNKmrnE0AleLzOgCqRmA6dqwNyhMdLNJp+dct
         9Ra0f9h8Cu2EQtXtX9/PC3sPuZg8TVzMsCl0ntxZ4LNkZw/6WqnpepOR1sVn4BQJLjO4
         rNLnmpJOzag4mFmt88TGaMhEz0nnKRGZL2wtmzulvoT7LSeIEl38UkoGSY39QNdaIsCn
         b8FQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVqUmMsXPWozM1647ZTx7cA+rJg1WNz9lKHj0isWpvRc+fTG5myYXf5D76XlWfyEZD1dR+ZoorznaGDZI=@vger.kernel.org
X-Gm-Message-State: AFuF++le/mWJvK6awXFNNbrIwUoQIciErCtuTLxRohHyz6Pqmv1pwjPl
	bc1CPjeJx9YWF/STYlTgBCXjdyNxM+49XAlKBnccxZAceXooKjIfkBg1a/y/JQ==
X-Gm-Gg: AYBFou0hQgaLaJR3+Alo7myAKeFh9RK5vUVFvTolJTNyFJS0UVJaKWXFM3yOFFIXpNV
	+dssvDidLXvPpRr7FpVa3R7IFVTDF/Og/P0gPXlhCl1TpA5LepV0GUsf1cGyrNx/+/ZW23XsZP9
	NlmMu7zLgeckoZpCuNAocJF3geTCHhMC6PF/ZeBW/zkDikJ6Z5KX3xOyjZWG4hmI9/ZqXlaat0b
	GO1e5AOGx4HGyC/TcFGKqJTcfwdPnXOhQK17qBC9gGmau8rcqLvZX5G5AuYG36kKVji/ZyifRxF
	vfw1UK9aNUmf0GVx/Hfd17Hv289ogOQRA0EOsIeCPdEkpTj9CjYUBcJ4OdI0Wma6IOY97z+TPB+
	2fF2DQo5hNY4xfoX4G00uyQHSG7FJc6CL1YpGVGuJhHqjSE8MVpENjGCF7XgRjfkz2G8kOlIiYp
	sfujBO4pY5mgJln9iEoeKKH5nOUS7U0SXtu2XAB2BU56D/Vh/gCQfeF/JGQt3cdVYZqLx10vHJn
	VmYwBgqVOnX/lJE
X-Received: by 2002:a17:90b:4c0a:b0:398:ba46:1d9f with SMTP id 98e67ed59e1d1-39dec4e1a4emr2279547a91.13.1789385941910;
        Mon, 14 Sep 2026 04:39:01 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994d8af1sm21910095a91.11.2026.09.14.04.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:39:01 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans
Date: Mon, 14 Sep 2026 18:38:56 +0700
Message-Id: <20260914113856.1987128-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_enable() runs unconditionally in probe, but its devm cleanup
is only registered when control GPIOs are present, so alarm-only fans
never get pm_runtime_disable() on unbind.

v2's fix moved pm_runtime_enable() earlier and opened a sysfs race; v3
fixed that. Guenter asked this version also close the other two PM
issues Sashiko found: a pm_enabled guard so an early probe failure
can't drop a PM ref that was never taken, and a lock around the
enable-and-check block so a racing sysfs write can't double-take one.

Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260901111903.660681-1-congnt264@gmail.com
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v4:
- Covers the other 2 PM findings Guenter asked for: pm_enabled guard
  on gpio_fan_stop(), and a lock around the enable-and-check block.

 drivers/hwmon/gpio-fan.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 084828e1e281..93dd685c4fa5 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -46,6 +46,7 @@ struct gpio_fan_data {
 	struct gpio_desc	*alarm_gpio;
 	struct work_struct	alarm_work;
 	struct regulator	*supply;
+	bool			pm_enabled;
 };
 
 /*
@@ -522,10 +523,21 @@ static void gpio_fan_stop(void *data)
 	struct gpio_fan_data *fan_data = data;
 
 	mutex_lock(&fan_data->lock);
-	set_fan_speed(data, 0);
+	/* set_fan_speed(0) drops a PM ref; only valid once PM is enabled. */
+	if (fan_data->pm_enabled)
+		set_fan_speed(data, 0);
+	else
+		__set_fan_ctrl(fan_data, fan_data->speed[0].ctrl_val);
 	mutex_unlock(&fan_data->lock);
+}
 
-	pm_runtime_disable(fan_data->dev);
+static void gpio_fan_pm_runtime_disable(void *data)
+{
+	struct gpio_fan_data *fan_data = data;
+
+	/* Registered before pm_runtime_enable() runs; skip if it never did. */
+	if (fan_data->pm_enabled)
+		pm_runtime_disable(fan_data->dev);
 }
 
 static int gpio_fan_probe(struct platform_device *pdev)
@@ -553,6 +565,11 @@ static int gpio_fan_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(fan_data->supply),
 				     "Failed to get fan-supply");
 
+	/* Register before gpio_fan_stop() so LIFO teardown runs that first. */
+	err = devm_add_action_or_reset(dev, gpio_fan_pm_runtime_disable, fan_data);
+	if (err)
+		return err;
+
 	/* Configure control GPIOs if available. */
 	if (fan_data->gpios && fan_data->num_gpios > 0) {
 		if (!fan_data->speed || fan_data->num_speed <= 1)
@@ -580,16 +597,22 @@ static int gpio_fan_probe(struct platform_device *pdev)
 			return err;
 	}
 
+	/* Lock so a racing sysfs write can't double-take a PM ref here. */
+	mutex_lock(&fan_data->lock);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
+	fan_data->pm_enabled = true;
 	/* If current GPIO state is active, mark RPM as active as well */
 	if (fan_data->speed_index > 0) {
 		int ret;
 
 		ret = pm_runtime_resume_and_get(&pdev->dev);
-		if (ret)
+		if (ret) {
+			mutex_unlock(&fan_data->lock);
 			return ret;
+		}
 	}
+	mutex_unlock(&fan_data->lock);
 
 	/* Optional cooling device register for Device tree platforms */
 	fan_data->cdev = devm_thermal_of_child_cooling_device_register(dev, np,
-- 
2.25.1

