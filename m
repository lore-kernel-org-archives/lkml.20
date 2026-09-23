Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99651266581
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790129982; cv=none; b=F4frs6NZrHDFY1EA6dGXY3ZtS2YwcfenEVBt//syGmJqk2xgjVTJL2h0F3IJCRNcliEyFXztKRD05lYsRMUwl0tabHZ/c1bnZLQF4XmsCFwVTeydP8r8yidrq0nUnwINEwBRB0urRjWEXHiRMez/Q25R3U6fsoySbyEKf/z6zLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790129982; c=relaxed/simple;
	bh=yeoozMOBAPscK9CJul77EhmZLidRkoePYC/PeZy9YR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r/ZQamE9WSk5vgQFtuNKc8FKjtiXYJU7Ffwr48lL4NMPC67tH2e9XIqdsFX3qVkodSeyuCWfbw/mlAxwhUu6ZUuK9/fpulT7ljTMtgPoDZ//yAkieSR1nCHs8+ZbTXsDt+Y45vIc8PObDeY3YFDLAudjgOzeByEfRtuvqWn2HM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeTlXrk+; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeTlXrk+"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-532db7db0c6so4320351cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790129979; x=1790734779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=caXTtPj1dEs62sQQ1E9/TMQFbqUzSaglq9nrKjxoqck=;
        b=ZeTlXrk+VKp3Szi5He0tntDeDCykaLokX8fsEvSQAcdK9f7StAMzT40riHxzzh5kCV
         UIWfsErK27ItCfiw9frBGbDgu3sdV17ebwh8p4GfYTGPh5yLVVpK14L8AHy+omVb/frX
         VkByuTkPDEj8+rfr2RCKPWoOWaDIkNAj74JrNDFQExz2rWezKSUSK1gbBX6rMOQiTC62
         HAlIobfnLgCwqm5Opzm62dZgwFanKY60hdDO2HOKI2iBRxPA7lc3iOmOlUGtF2UJXo/Y
         5jVsGxa1WOQQJ+SsKRtTgzk7t/UHQITuu1f9p0/MQ8862d//6EGpirKrL0++hqNGk7wj
         gizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790129979; x=1790734779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=caXTtPj1dEs62sQQ1E9/TMQFbqUzSaglq9nrKjxoqck=;
        b=g70+nBFBpHbpj/0zbt4wyr0Z6Tbo74ehRXR6dmtjEMwP+6onaEDyZTylmxNBCCIwx2
         Zm027NchoK58bI6FC6kIfZJ1U/2MIMDzJP54prJnlquiseWjb19s5zj+mJBV3zU/XPEn
         Cf+tsd0ubb2lZY37n/Y0pPAvuOuU2fuN4A4HC0Znm+wmQHYGnFZn3JDVD8K/+pbYHISn
         hmuRT5Re/3ia8IknKr1LiCffcA5pLDnYtMnnZYVfTAviO0LK+JkFXDs91uFuZFbxWw1H
         Aox5vtcxQNBHQvXOxaH6TF/jFNDxl7gIIOYX0V0UvF7RE0C8UAEdnOqCD/900wrzxduA
         eHOw==
X-Forwarded-Encrypted: i=1; AKwUvByiCed0HYaAW4xV+b0yhvTsoyXm0XdsMDtuDYjpau/bhiZy3VA+PXGlXpJ1mYRD73bhxOHoo4VEtOESG7s=@vger.kernel.org
X-Gm-Message-State: AFuF++lG2h60W1E5pmW9bQ9d5fbhy/V5q1uOIH0ZgH/QU74zVUdG/hYH
	eFLXMSSgVy54q2Ffw8IG1HXzXzv/LsmFnlfZ/I7e/hRNacipDD/WQ9R4J8DWOp3C1fTkFSY=
X-Gm-Gg: AYBFou18S0/a7Y9qVTD5UZykwgT3Djv9kzx3U8hLT3tKYKOEdj8aaXH6UgxwZ3P6VEV
	ZMhMqrUEmoZB7/CNi01hEqKP7iQwSvwl7BgOy4eeV3/eBS6cbAq7SqjFbeFIE8Y+R/PoSRpJfvb
	4qpQ9o/aNJher97qy9lGtCHmxyoSEVvr/fEppUc5GMJLumYMei+A2MSwsm9ejXbcmfmFZJ/X0Cd
	yWUGpRULmCkR7b83IcPstFkqFlF00W5S171NGtF235PWcfbEXAWmV+1b1/wtSzk/cMxd+06a+dv
	ngpLEhtz/GTjhOar5URR9onMMdBTBtSwEbRo8d2KdwRQMoZHgUVicq9UcVKW7V/Gc5I/zz//Jld
	TZV5YcKU1LUL7aTtZoRp5RxIoZFwSGcnggTfioxwq8lzR6NM/bc+/HGYRgH9SJY9Y+zf87jH8FN
	4YbljmNuLRmFkWpiJaUXMU20Bii8JpjQk0MYKae00N7S5QOEqIa5wagzlY9nbyfWACzWITcsldH
	Y++FmCyxrez9kSMMj2NUBwTnEgkz5hifJOOysH1oVmFF/OfoINshs04C+/E1gG8M8CkGAt+nvtt
	KwnN4x7ca3iti2XAzP7GLY2qee6R
X-Received: by 2002:a05:622a:406:b0:531:190c:85d8 with SMTP id d75a77b69052e-532eac9ea80mr21968421cf.43.1790129979398;
        Tue, 22 Sep 2026 19:19:39 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c440a66sm10919026d6.29.2026.09.22.19.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:19:38 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Support Opensource <support.opensource@diasemi.com>,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] mfd: da9150: Balance IRQ wake on teardown
Date: Tue, 22 Sep 2026 22:19:36 -0400
Message-ID: <20260923021936.957065-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DA9150 enables IRQ wake after registering its regmap IRQ chip, but does not
disable it on a later probe failure or driver removal. This leaves the wake
depth elevated after the handler is removed, and repeated bind attempts can
accumulate the imbalance.

Remember whether enabling IRQ wake succeeded and balance only a successful
call. Remove MFD children first so their nested IRQ users are gone, then
disable wake before removing the regmap IRQ chip. Preserve the existing
non-fatal behavior when IRQ wake cannot be enabled.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: b8fce55c09d3 ("mfd: Add support for DA9150 combined charger & fuel-gauge device")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Record enable_irq_wake() success in one assignment. (Lee Jones)
- Keep the irq_wake_enabled checks. disable_irq_wake() after a failed
  enable warns about an unbalanced wake disable.

 drivers/mfd/da9150-core.c       | 8 ++++++--
 include/linux/mfd/da9150/core.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
index 5c59cc869fb3e2a6ac5aaea7426f38241cb92cb1..19325d72a27e7e12aa8acb121b5bc115305b4231 100644
--- a/drivers/mfd/da9150-core.c
+++ b/drivers/mfd/da9150-core.c
@@ -450,7 +450,7 @@ static int da9150_probe(struct i2c_client *client)
 
 	da9150->irq_base = regmap_irq_chip_get_base(da9150->regmap_irq_data);
 
-	enable_irq_wake(da9150->irq);
+	da9150->irq_wake_enabled = !enable_irq_wake(da9150->irq);
 
 	ret = mfd_add_devices(da9150->dev, -1, da9150_devs,
 			      ARRAY_SIZE(da9150_devs), NULL,
@@ -463,6 +463,8 @@ static int da9150_probe(struct i2c_client *client)
 	return 0;
 
 mfd_fail:
+	if (da9150->irq_wake_enabled)
+		disable_irq_wake(da9150->irq);
 	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
 regmap_irq_fail:
 	i2c_unregister_device(da9150->core_qif);
@@ -474,8 +476,10 @@ static void da9150_remove(struct i2c_client *client)
 {
 	struct da9150 *da9150 = i2c_get_clientdata(client);
 
-	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
 	mfd_remove_devices(da9150->dev);
+	if (da9150->irq_wake_enabled)
+		disable_irq_wake(da9150->irq);
+	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
 	i2c_unregister_device(da9150->core_qif);
 }
 
diff --git a/include/linux/mfd/da9150/core.h b/include/linux/mfd/da9150/core.h
index d116d5f3ef561288756477e7170400b47d65e180..369698036d1aa5d1722f6459946f38abfc8cf350 100644
--- a/include/linux/mfd/da9150/core.h
+++ b/include/linux/mfd/da9150/core.h
@@ -65,6 +65,7 @@ struct da9150 {
 	struct regmap_irq_chip_data *regmap_irq_data;
 	int irq;
 	int irq_base;
+	bool irq_wake_enabled;
 };
 
 /* Device I/O - Query Interface for FG and standard register access */

-- 
2.47.1

base-commit: df2908090cda368b01ff43709f51890076c56157
