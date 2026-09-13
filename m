Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D820533F37A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311618; cv=none; b=USs7qMSdOTgGTjrsgQhqZKhf+IfrSkyXDHBr+zDm+2EjHWUU6HTDfA7oZfzfBvuDZTpFa2C54fYrilFWcc6+zwReAP6l75MteIPthQwji6qmBmTeyojAFmPfy0q2ryDHgc99AzceT1nie0niNw0LKrlQEAfBTpncd0gp9pct9EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311618; c=relaxed/simple;
	bh=DwPp2HkWQO6qcGBPqXNMiD7gLL4HfMQuCnHnKBFbtEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VG461gFRpN6oI0o3bIR1WiSdSkOZT0uNYgS8l/lpBPxCdv9b5UYP7q1UMkh19lUxsFbRrxoglsGYSgKUbkF1KUz1qr94RuykVlDJdrvQBXTkHjD+f8BNa0TZAVkPcXB6MM3dCSzFL1ONzc/qnrQrIxcxupVtm8a1oWML1zk+X4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pS54VIal; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pS54VIal"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4aa02a269so1895243a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311616; x=1789916416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbLN5q31GQxj4DJ6F6WcgB1JNfvwxcLXSAMVbVPmGVE=;
        b=pS54VIalBzyOpCStnomJSBzPJvevFQ5Zv3b7jhdWOneGdSmXSs8mcH7UvpVQTp3Ofv
         FDFzez4KGckV4LSgUpP0xRaGD2J8zXYEyOeEbeyxqpx9fZ407kZIzqmZRMqSy7b612ew
         6wCV6hFoACvDblAkD3tUaaXmIhL5TNU/wokydlqG2DXw3T+t6YqMOivK/BdnxUv6QBXw
         +cDACsWFvnFSpg9JjNkN2yCMbnH9vBnUNqav8Kp8SENY/jOo6/bVoDY/1uZhjtIzIyM1
         1HxvzsvdpZH6vnJnpXslPzEk0SthyWYcNg3jb7xpgWPzWegaQXKHuctPMJJlr4EKsjz5
         689A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311616; x=1789916416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbLN5q31GQxj4DJ6F6WcgB1JNfvwxcLXSAMVbVPmGVE=;
        b=cu7YLDcqkl5ymLZKgIBqgAbhtTArAdL+f3tswS+60kL3o0V9FdYtm/TsNeNtoM48xB
         rU4fS9FyKZJfI3pwV8ER6Tp/f//a9nyev2vQEW2PfQthbWAoeLf4W6kyZ0Lg0j01ajcv
         rdqsRcv1U9Q7wYitjmYR8+6yyy2ZV7DHiomyXgvfoTRRXF3QzrndAMHxj0AY6PmIb6IR
         IB9+n+BCuxsB7eIyT8E2VY/zsiXpO+A25/7s9x+wvzrq4NUOVFFopyzFmEX2H1JQJ8Oy
         NaRKx55RVEoioKi37W7fa1iTdoFDDDJdzteLyMCT4gFfkEP3sZkv4bz5aonBp+9B0mXK
         ifsw==
X-Forwarded-Encrypted: i=1; AKwUvBzjytbINB1atftl3hDQneat5P1teucuClj9Oc96Nmho7aQuGqaj4A19sZ3Sj0qZ2kG2uebiWTQNXAAI6DU=@vger.kernel.org
X-Gm-Message-State: AFuF++lZGTuEXGQcb8c/S8RkT5fcCylWlrsL8+332mW/hG56O+Y7NJ6G
	9GJd9FBFY4anDXGod5kTrpN1tpuTvs5kNenj/Hdgf5JFysxRSlROIjZH
X-Gm-Gg: AYBFou3+OcLqUMwrs0YX2qTVVxgPIjwXftx+zhl1W+w5NgimAWl3Pd3RGZFN3BfypUB
	x7gCPKDvL9y0NEvyMkOghtj0CovvwACsrAuEL6yWFivSgZ3L9NkOGQZtmuq8vZkn0InzR8nBthy
	OLqbbTAoXSEKAtfFcBbgY4JNOdSuGiSGXx8/qZf+ElyrZcYHqh1eMP3yNanYGo+d2WtcFHmT2U9
	jsMsk+cLjGZ6wOqpybHIB8KxZVcHlvsHa+NFo6uGQIAPDC1RL443tDBGz/iaae6AEoePQLl1xSe
	Y0XhpBrIqAsMFyJ3X+As4IAMGiMssP8X5SQNxM6XPBWQHJQN+NMjcupOS/jIuxNh7/fPYsJ7xVU
	fbYCzOoA+GZNjWnS0OsC74Wub6aLaq0GsHzyO8BmMX3TNe5KxIAWa/nGKo2Rtr1InXBvGwUxn/N
	fo4YWjAZEYU1Fnh5wZBZYgdb9qXH/Z/G/KtaJi1xzkJW9fnIfDcuee1vPNycnZHjXGW3jNAewkL
	LzR4lnjFsI=
X-Received: by 2002:a05:6a21:140a:b0:3d1:66cb:d49 with SMTP id adf61e73a8af0-3daed46b0e3mr24749980637.4.1789311615337;
        Sun, 13 Sep 2026 08:00:15 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.08.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 08:00:14 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v9 8/9] thermal/drivers/exynos: Add missing drvdata assignment in Exynos TMU probe
Date: Sun, 13 Sep 2026 20:28:36 +0530
Message-ID: <20260913145905.9404-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dev_set_drvdata(&pdev->dev, data) early in the probe function,
ensuring that the driver data is properly registered and accessible
throughout the lifecycle of the device.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 0e7b92035850..fe56a48be5fe 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1125,6 +1125,8 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	dev_set_drvdata(&pdev->dev, data);
+
 	data->clk = devm_clk_get_prepared(dev, "tmu_apbif");
 	if (IS_ERR(data->clk))
 		return dev_err_probe(dev, PTR_ERR(data->clk),
-- 
2.55.0

