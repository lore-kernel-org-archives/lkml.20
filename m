Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFC83BB135
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788102319; cv=none; b=G6pWwUKb+rC3MBJ+OrwntV5BSwI08kFRc/wlrnQTutc76MYN6d/AePi9vG/0Buxjq/Ogct69XaL+KejFEDzjLLGXa/JojLEL7b0Lu5GW5MpPiZU/mCJZUP/5ANmyeMkr0dGF7gFNm5XXySNRY5aNwjXct0bgdydfqbt9H8or/0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788102319; c=relaxed/simple;
	bh=cgvbhSgZotIrgJh6ig27ZO2A9khgZqxKpiN3/Rs9emg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qC77okl7SuASFKm5pqv7NEjmRlZ1IuSzOtpORVqw4CTLy4tTTHD1T2hBWuzPTxayXiKDf2ttFFKExQPLfwatwoYcvV+6RVsTfyEU3tVmNeahNPBwmF+TuJffgq82H8NAm9IQlgniFvg0/kI4fR17TtMXyLOxQbhMmgb/viEMUrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyb9rjuW; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyb9rjuW"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d91ff7d9acso1172755ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788102315; x=1788707115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wk1SXiAVSOQd9bAY/y1d0H1Ln41409FfOwQavikz/jA=;
        b=iyb9rjuWV1QofowVV6iZjdBlkyAisgLSUO3RGyqouvOWLMdhYlnDM5kEPFo5KDiwaV
         KjiWFuuf+SH1ExpuIKkLBR5UC9c7Vo17zttQrzfYmR6U6YHFqdmkLEKTpsRO8HBT58UA
         Bu2yICl1lUSBAcyxT+UDdUAyne4FB8kW4wEkhjF41paxP1H8On4QZ94d5olvGVRuooxy
         2wbzxYV5AFZvLPfAqF8MZkLaotFIr4kiCl2gVrqjE/ukNVkM5izmSfOA+LXSoKIVnme0
         z0HUgmXorR3gmlqHXhl7kInASRXECWccg9kQJtLYUoqQ+ebnXggOS/YaFamWWWwmSC4m
         430Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788102315; x=1788707115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wk1SXiAVSOQd9bAY/y1d0H1Ln41409FfOwQavikz/jA=;
        b=JIzv27KWPEHkEzqJISk5UnHPBflmB+2Zk81Yalnte8tiiJMVN3wC//hkpI6bChDfSh
         mPyu/oWRCi+tuT5cF+9UQNzc0AHTAVAHjOTdfIQvJZ/3yklmGHsF7TvUClek7g+px8S1
         QCOOlIPyqk8D/IYxjK/EIzpyjVMbRH4R/UfoTJkcCK2dvkH9XXtiISezuva4CwCWJsHA
         u+64r+7Z0n/YunAFswFTTzZ89X4em+oD/A9tfeQT2nTAMcZReAs6xbGDjbUjd/W8LfN6
         cXAcxV8uxnWbthZ+GdmQxVesal01Otd++UarOFUm7ZCFs7JJROAMDsaBLkRc+lXREy3s
         EIlg==
X-Forwarded-Encrypted: i=1; AKwUvBwHSf6pWclxVKzCJHAJWG7Lb00F5kx93yr6ges43vnaQOhNBMDECZ5ajjkdsOBCWIbMp/Tinwnq7ZBSM3g=@vger.kernel.org
X-Gm-Message-State: AFuF++lW+X+K5AGvh6cC0G5sH2Iga5MuDAri1gKAyr/vSWXzmAnK70iN
	woG9fHOTXTdbr4SfDTZL6zeNG5cHTzrBLmCtfRyL1Cjveh3UTnZVyjv6
X-Gm-Gg: AYBFou09LXYLlNpKkd5L2EhyS60s/nTpRTEjC1yr+xjHyCrjaNBIy1une5BwqMtUiSc
	3kxsS/3jHJL7X5FweA4kyfixwElFoLhcSKrHsxKPfZ6BZksv+LZgSA9Obp9PPJhP4JAbHQpfxzX
	i25xqy4sva+lQuiBKtfV7znQnV7yZYn62PIwnr0lo1xCvxMF8jhcMpxaSzsj56w3zbfjx/Q4lUS
	2eRj3eoO0+s64puMneIldnkGBfGGlNLneeIWxbMu0INEoOrWw8ZccxcutcJ6BIZbSlrxwRT/NRT
	NLLP+1un/FQehEPEYxG4NUuo+bGvuSAmeStrPE2eB28nlaqrbMAtEwhhX+oxGU7fxZHseaIR2m4
	EXMouAyOe1l00FFcv0147cwJDA9o5NfZfdzOEvggm9r2rDIGIRAQnNxDLEixzNHJ6dUNQeJ6g+V
	1XZqNjWiSfwcOKr2e3QjwpSLiliAuFh8pLvgVt8ymVtJz3xuauQT7B69cZAx89/4w/oS6cY128u
	mMwFQ==
X-Received: by 2002:a17:903:390f:b0:2d8:d4d3:3fbd with SMTP id d9443c01a7336-2d8d4d340a5mr111990395ad.17.1788102314920;
        Sun, 30 Aug 2026 08:05:14 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm19898384eec.20.2026.08.30.08.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 08:05:14 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans
Date: Sun, 30 Aug 2026 22:05:08 +0700
Message-Id: <20260830150508.1475105-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260828105018.2392383-1-congnt264@gmail.com>
References: <20260828105018.2392383-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_enable() runs unconditionally in probe, but the devm cleanup
that calls pm_runtime_disable() is only registered when control GPIOs
are present. Alarm-only fans never get it, so unbind warns about the
missing disable.

Switch to devm_pm_runtime_enable(), registered before gpio_fan_stop()'s
devm action so LIFO teardown runs gpio_fan_stop() first. gpio_fan_stop()
calls set_fan_speed(0) -> pm_runtime_put_sync(), which needs PM still
enabled to reach gpio_fan_runtime_suspend() and turn the regulator off;
registering enable after gpio_fan_stop() (as v1 did) reverses that order
and leaves the regulator on.

Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/b9792be3-fcd6-468c-9149-7e33640ee167@roeck-us.net
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
- v1's devm_pm_runtime_enable() was registered after gpio_fan_stop()'s
  devm action, reversing LIFO teardown order and leaving the regulator
  enabled on unbind (Guenter/Sashiko). Moved it earlier so gpio_fan_stop()
  registers first.

 drivers/hwmon/gpio-fan.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 084828e1e281..988f52d11ce2 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -524,8 +524,6 @@ static void gpio_fan_stop(void *data)
 	mutex_lock(&fan_data->lock);
 	set_fan_speed(data, 0);
 	mutex_unlock(&fan_data->lock);
-
-	pm_runtime_disable(fan_data->dev);
 }
 
 static int gpio_fan_probe(struct platform_device *pdev)
@@ -553,6 +551,16 @@ static int gpio_fan_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(fan_data->supply),
 				     "Failed to get fan-supply");
 
+	/*
+	 * Register before gpio_fan_stop()'s devm action: LIFO teardown must
+	 * run gpio_fan_stop() (needs PM enabled to disable the regulator)
+	 * before this disables PM.
+	 */
+	pm_runtime_set_suspended(&pdev->dev);
+	err = devm_pm_runtime_enable(&pdev->dev);
+	if (err)
+		return err;
+
 	/* Configure control GPIOs if available. */
 	if (fan_data->gpios && fan_data->num_gpios > 0) {
 		if (!fan_data->speed || fan_data->num_speed <= 1)
@@ -580,8 +588,6 @@ static int gpio_fan_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
 	/* If current GPIO state is active, mark RPM as active as well */
 	if (fan_data->speed_index > 0) {
 		int ret;
-- 
2.25.1

