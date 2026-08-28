Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC41038AC75
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787914345; cv=none; b=idk2+uDsYJ3hIap0hzzG89Gi2xSb1TcVVmnhykty8EjvMl9ISPNO+UnkjNmw7C3aJh5Z0evzHJ+72aBqg0NE0agLMjhqKAllu3RmiHvi/J7F/P+Ulti/IoEz+9t6bcOkYrIEJ9kMe3V79Qgs9QFklp/QzvkKmlCG1fTN0kdxTlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787914345; c=relaxed/simple;
	bh=pG1VnjiqgntQGI0qK/is14GUuCFDGLN/BKAmijvarkg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=acI2owA3P9VL1Ba4LfgdQrSO84VbhJeoFWxzB3qgaliV2n1ty3GCzdW11UvHqU5WhLu5VvrJrNheB0klGtR5yGjo7JzVEHU84fLqI6WoZy9SJpPMvL15s7pKpgwdHSQoB1o6/1YwCFgSPurEvWzS37LYCmVlRvEVfJKAa3sByUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AC8u1rC0; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AC8u1rC0"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39682983a0fso935523a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787914343; x=1788519143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iB6uEQEth2jXEYgRwt8eutJkoVjS6z8bcTn8n0MIRls=;
        b=AC8u1rC03Buk2Vf/vP9iYZwX1SE/fzF/KU0cEYVn5hnQEMMWcqjPNRRRCspDXENKhV
         52TFk/FZCptFEz45xZSWuxXGbUnPHiZx2cRka+srkY3GmNbMu/MsoHVvxoHcpwBmIHfU
         bbeATpNwHb8qHdUOcinDcTu1yq2rOk30dFOYCK5rDnTiZJnkKHRYr4ZhWdcHxaAy6g8C
         WlYbrA/j/pCPDjmZldxXSy1lQFoZ5L5FmY3MN+ghwisYFAgWH9RUAvuQbCfNW/gkoUY/
         /1AQkfdUhK40C9i2qJOGhFpWrPHM0OtgWS8iIwjCfXbFiv1gF5XGqoaKksit6Qb0qtIU
         FTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787914343; x=1788519143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iB6uEQEth2jXEYgRwt8eutJkoVjS6z8bcTn8n0MIRls=;
        b=KqvPtCwJPkYuC++h6Il/be5gxzlqiC+/L2/Q4Tex/P3lZxm1d1IPhBwjv+7hXbKV/l
         luaxS4021J/rxApnRC7H80KWNJbtBgTEp3ljg2vczLS3b11sdr72jfh/dV9//i8faNjk
         eknyc84nks4XTHGcJKA7anaFHUm86moqeauAMmkZoH8UyFP82eI35yGwzQoWe7MpoY1d
         aAS6DjJU56MwHTx1o+zOrOpkdcUfZ6gNZTB9cHVMdjWs7JQI8izlDWNOzOh4rs3NYOGp
         pdwqK0usIBobOwcTPm0IuYpqtrNCaPV+kIAKI8kPGIcDBKF4sc1GzsSW7E+8/HbpmR0o
         c5Cw==
X-Forwarded-Encrypted: i=1; AHgh+RpkOo4vAjRGuZMsP33XAKSrgeaJTGqPbW5cjS+OUc3B0eeYVL0ypOSgqbtFiDRLlryxGit9tleQeDPmOkg=@vger.kernel.org
X-Gm-Message-State: AFuF++lTQvri9SERQy/QyMcvzeCtyR34zgUCB5K+Wt2XNulvc+Qz/eGv
	Q/v+7X6o1aJngPpeUzTaS+QHCLgHhF5fsnuvUCQ7zJzw8xhWZb2/a8ER
X-Gm-Gg: AR+sD13uOwG6wV7gQ40zpuqqoZtmSHvpRcqRO6HRZGayQBrwhDlsvv13ouBMnAjK7hz
	4hyvXEEytnriuz9oeE5aKHNxgkQ/sGXIz8Unm0ooOEdxnfhPG68vaWW27kSGkRNjzfs24kiPzFM
	SHd+m0i/zpbjlW/alcVytdcgiwrINWWsnMoyJJuHeyXa9fcHAKjAyTHOz3PFhDWsGbcdHMjSl5K
	O6YJsALEGY9ZKzR+/3T4dS6x8e79Hb2zBkuJICBOLqjsqKXiA+/VN+EFGCJRsTSxttSodJ9P1Ax
	J0WbtYOpps6kBQxPC8OJFe4HxA396zh0o3Z49WRY9yr7JI8O6kIayB8xYfIAFT4Y28Y/edytZqj
	IqYR2vrEhX4T4hmCaaXHbyOD68aZOts4oqOdH5WA0x7+v21ovI/XCFoGKFL+7X6zY60NVzsJXyZ
	4B6LNZ3j1cQbTpuhzNNkmjlYd8P8/4iD6wrTvOrrg0l1ggdfWk3bxnrPm92vo7sRsIaze51Y+v+
	w==
X-Received: by 2002:a17:90b:5405:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-396d0de4c19mr12284740a91.6.1787914343069;
        Fri, 28 Aug 2026 03:52:23 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([42.116.29.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc08266sm2063274a91.11.2026.08.28.03.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:52:22 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans
Date: Fri, 28 Aug 2026 17:50:18 +0700
Message-Id: <20260828105018.2392383-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_enable() runs unconditionally at the end of probe, but the
devm action that calls pm_runtime_disable() is registered only when
control GPIOs are present. An alarm-only fan (no control GPIOs, alarm
GPIO optional) is a valid DT configuration; on unbind the runtime PM
core warns about the missing disable.

Use devm_pm_runtime_enable() so disable is automatic on device release,
and drop the redundant pm_runtime_disable() from gpio_fan_stop().

Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/hwmon/gpio-fan.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 084828e1e281..0bd5561b7a40 100644
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
@@ -581,7 +579,9 @@ static int gpio_fan_probe(struct platform_device *pdev)
 	}
 
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+	err = devm_pm_runtime_enable(&pdev->dev);
+	if (err)
+		return err;
 	/* If current GPIO state is active, mark RPM as active as well */
 	if (fan_data->speed_index > 0) {
 		int ret;
-- 
2.25.1

