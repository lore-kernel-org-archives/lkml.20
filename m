Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB585385515
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120075; cv=none; b=VYEQQcvRPGaatxHhMoM1LNBeLDTaMYU87nwa2HKPY0N1KsE9TwFsXFCwDXe0pkDUC8Qek53GPKiK7+tJbOO76ZtVqI3jh9dPostcDCzvL57oS/qVO55zTKkoIvCKBHXSdYw3KcWO1xfaK5jjqetLixw89sa4R6nY/oF/sfU6UOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120075; c=relaxed/simple;
	bh=TVzdjqsY0vYeIS7HHhx+RFa6m9nNumgd6ofEvkUhlDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t8CQNkHoZr3hDQ07wCnsGYxJ8GOeaxXXQNirsTo+a2aAb2d2Ho7ii9xjrHjH+ziBZNswGeBZgkoEdOsb4cxBDXWUVVhETS8WccCPs/tMdON2Ij5O5duNAh/U+HxT6Z9/ICGbexf7a6P+HweeYzpzWsk1+euJ/lgr/w8XbM/XHB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/jjt2gm; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/jjt2gm"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-535f9de49fcso13661801cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120072; x=1792724872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Si+t2hYlvfYPsnMUPj99el8itGnuSc/9LUEQeaAR/Ks=;
        b=H/jjt2gmNb0HQITb6aV6mm0nBWpYV+GEZ7+OFFodieaARjzg+4JeFWDxSR6MQgtTFY
         UAN63Fs/E8kSenHl1CXn4S36bZS4PwjoB/shwjOqLuvM4ozRucrYM3LjF6SMzWh1iAgF
         UP1zwCOEJM4JOaMVIPFA/jUClv6U0QMc4+k8+XW2h5LWaOUZB8lGATobujTB6LNiQ0DQ
         cWSYQpQeioKemiNLK1BNfDmfws87zDlmOIRHHseeIjuarJCCP6iWKQ2/TXgGvDizIATf
         hhAYx3uk0hGRAheB7ujC7mBWiOOkzzvs0lQvUc9H3OCtLwqQ0ZhrK6iEcrwTbeAEjCrt
         +TNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120072; x=1792724872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Si+t2hYlvfYPsnMUPj99el8itGnuSc/9LUEQeaAR/Ks=;
        b=ly9hG0MkrzWvV7L5ZPxsYdPUQgIl1TdonJe1N1MjBU5jnji/mfLOIZ/QFF2b5W2pIP
         CY7ZoeGIPBfPw4dOSnx6jXZeQwjjqjR4AgtEsj2kkNlB5yzx9CJnYq1ILoeNowuEbT7O
         Mj3XOnN2Viy2a9dceaJQkDVT1JT3bgT9g9Z/WtP78uQ3JsvQX20ItuwMYbXb1yv1sHFV
         mCCJLc072OzqAlztZfqXBzv/6K12Y79Lk5txldv0RUqSmbs+3p8Jxr36XXT8HIv6tMvs
         3cn6aJ9hWhCCZuNNfk9xGSOZsGh5KgGZgh3yl5uzLwWROcWmpAJmkl0yvfDzzoEgsIjE
         zCww==
X-Forwarded-Encrypted: i=1; AKwUvBx3V02QaO87yEk8buGxBUX4W8ENLBgTyZw8fzFR3KxKLAAKmWlQ4nFmuMYO24bak/Do6rJ3r4HLuvGJz30=@vger.kernel.org
X-Gm-Message-State: AFq9FYIR25I6npBo8rs3viuEQer3xp7F0JDKxmPDEPngM7fO/xMWlt/Y
	3u0JmmkbEVHTMIS5SXUiJZhqh3y7ZlJqg+GQheddS0BI8n/983iWVfk=
X-Gm-Gg: AYBFou2TCX2nC8TlZdkNnnPSchvuxSwZfFwjazyiBrTxXQs9ULCaCO36fHzNqR2FQns
	XETLzKVP8fEqwLQVaHBEKwtpQ22xVOXaNan+jF7InljYNWsOpSA4siZXIkkv/FdWFlcb4qwby2S
	dk0cPCaKjglPXsvH0SCPQvemp7XRKWfpCcWk1m0yAyrhaL3RDPDV1Gh8D38ZjAXbTfvf3Tuvi/W
	5uyjlf9y3I6J73u+D/yD6H8pmyUXPxMN82zZCKqY8Lz+KLwP03GRuOnFHO3nwwwe+iPOXGDHrNy
	LRol+hZeL58yLS1ndyaDa/Q/cztFvO9dn4fTtYyeJ/Bw2VjLesNC5F64E5vXqVibrhuWkKn8Uda
	fN4rAx4RqDvslY+ew4fCRpO9zRc3Kh5qiUPotDyHR8F4czJVRQrqUewt6c2gHhxcmjtNiBwkkIW
	SjJSCdSiWq7ZcWaG4L+eGrsUyV5SPOKemOa7SkVSlGVCotOyNlFUFY/uMSeJOU7t0BLWsaIYRXW
	lKSuseJyDZTmPqI4g8zXA9k0gmOHacrESbX/a38EyXhQi3IoDLdlsmqme+QaPTUbC5lS7CDKpJ9
	G0EI/NbhV3S5+LdGz/FfvqK/3WybbKIoTeOG/g8=
X-Received: by 2002:a05:622a:2445:b0:535:6a51:1f71 with SMTP id d75a77b69052e-5359fb86868mr339236021cf.54.1792120072257;
        Thu, 15 Oct 2026 20:07:52 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb1af26sm11435556d6.33.2026.10.15.20.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:07:51 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] hwmon: (sht15) Stop deferred work before releasing its resources
Date: Thu, 15 Oct 2026 23:07:49 -0400
Message-ID: <20261016030749.3689266-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A measurement can return while read_work still accesses GPIOs or
re-enables the IRQ. Regulator notifications can likewise leave
update_supply_work using the regulator after it is released.

On removal and the applicable probe error paths, disable and drain
read_work before freeing the IRQ. Unregister the regulator notifier
before canceling update_supply_work.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 251eb40f5ccd ("hwmon: sht15 humidity sensor driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (x86_64). No runtime testing.

 drivers/hwmon/sht15.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index 7bb2105..6c5b2a1 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -31,6 +31,7 @@
 #include <linux/bitrev.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
+#include <linux/workqueue.h>
 
 /* Commands */
 #define SHT15_MEASURE_TEMP		0x03
@@ -986,15 +987,15 @@ static int sht15_probe(struct platform_device *pdev)
 	disable_irq_nosync(gpiod_to_irq(data->data));
 	ret = sht15_connection_reset(data);
 	if (ret)
-		goto err_release_reg;
+		goto err_release_irq;
 	ret = sht15_soft_reset(data);
 	if (ret)
-		goto err_release_reg;
+		goto err_release_irq;
 
 	ret = sysfs_create_group(&pdev->dev.kobj, &sht15_attr_group);
 	if (ret) {
 		dev_err(&pdev->dev, "sysfs create failed\n");
-		goto err_release_reg;
+		goto err_release_irq;
 	}
 
 	data->hwmon_dev = hwmon_device_register(data->dev);
@@ -1007,9 +1008,13 @@ static int sht15_probe(struct platform_device *pdev)
 
 err_release_sysfs_group:
 	sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
+err_release_irq:
+	disable_work_sync(&data->read_work);
+	devm_free_irq(&pdev->dev, gpiod_to_irq(data->data), data);
 err_release_reg:
 	if (!IS_ERR(data->reg)) {
 		regulator_unregister_notifier(data->reg, &data->nb);
+		cancel_work_sync(&data->update_supply_work);
 		regulator_disable(data->reg);
 	}
 	return ret;
@@ -1023,12 +1028,17 @@ static void sht15_remove(struct platform_device *pdev)
 	hwmon_device_unregister(data->hwmon_dev);
 	sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
 
+	/* The read work can re-enable the IRQ, so stop it before freeing IRQ. */
+	disable_work_sync(&data->read_work);
+	devm_free_irq(&pdev->dev, gpiod_to_irq(data->data), data);
+
 	ret = sht15_soft_reset(data);
 	if (ret)
 		dev_err(&pdev->dev, "Failed to reset device (%pe)\n", ERR_PTR(ret));
 
 	if (!IS_ERR(data->reg)) {
 		regulator_unregister_notifier(data->reg, &data->nb);
+		cancel_work_sync(&data->update_supply_work);
 		regulator_disable(data->reg);
 	}
 }
