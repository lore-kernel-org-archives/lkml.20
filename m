Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808583;
	b=eIiSekmPPrdTP5Ona2SkI12rjuvjJoFwr5o/o456ZexsKR2umamZ4fx9RRTCIAieR18D
	 DI1oUk8uOFruDbQdDuROwW4MEhCGuBEytv/YyctXXaSz3EUBGvHU3SktP8zn8T122aVBB
	 I1O9QO2qNbIJYJ6c1n0cw0iSg6b4mCVU/8EUtbEfXx5oFhOiZ7WHPqj6X5Er57evuhLML
	 3YXNaHmGLiSzQjaacTGdIdMT/EQbzXOBgqdouY1lmgPXdKaFirdz/rhR2/KhAtCAEs8hr
	 882R2ICPLlErYw3pCw/EZGmGzg4PvCSbnSKKcjOfLcv5o/a/2P9tLco+pvHbPi93uHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=I/5XjpRkuugiUvajtiQst7cmnkAsliJPRUsIIgPB5lw=;
	b=s02n7pMTgoJm5YNT2pdyvBaDnVIZyDIg9DwNuft2ZeqOt1caCHAV6EffJ89DzAkBUW4a
	 4SMcqcKaU3hLuQx0pcRUbBFiCVeU6t3YKx3F2pYdeboQOztkhNOBONcY4UpFNkxdFRST2
	 nJDkr5WFx6W1a1uT3tgd4D8bBpkHcptQGjgxZ+aVbHm3JNLwPp9WMaRdAYz+QahLIumS5
	 bcOppwyXWzffc92ngHe6hUaQ3yfN6iOZSmLelqIyk1VDTwVjGvxlQdi9i9Ip0UMudmaQ+
	 6JodBrLkAXuYY50f1d6UV3+0Z0poaQoiB7aaM4uFYrM7s6BbYOcUEJJdvWMP3AAepTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IvOKyLc9;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A99606D80C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A99606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IvOKyLc9
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso8133495e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793808582; x=1794413382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/5XjpRkuugiUvajtiQst7cmnkAsliJPRUsIIgPB5lw=;
        b=IvOKyLc9phwAhdOEIy05IyB6L6/v0m3nxWhLFRvDrtoSK2rwOyfqnPm05PcW9c8RSg
         XBI1cdVuWzfzP51IHXkG+el9tL1PfjXwpyQ6/y98sSWSBAJ2uhGrawUGukJBw4YMgXAz
         Dn1AwNBZJ/h+csVtNJIOko78YoGQmndJHFlHkuO1tePbLs4744IzYhn+eVU01gVk4+2+
         4eVokbXy35YUmykftBYZxE4WSqy2MKO/9JY9pUMwiMOeyelKKJFaeVFp726MsnaKxTqy
         tUKGpvUW42xzTDEFGZELnk1lpSV5PTM1ZAOKshHSiAe9aDBBS7r1SUcGiwyuU7LF29Mp
         axQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808582; x=1794413382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/5XjpRkuugiUvajtiQst7cmnkAsliJPRUsIIgPB5lw=;
        b=V4GkbVPzvBCxO/nv3i5A9vRldsUnYnCPLdPu/Y069xYJeFggBo4NBtTsV0xuuh6mCA
         wz9718qTaoyhcF2UHoYByvphe1086oLeXNE9BeYZJPLGsesWBFNW/1S6Ar3x1cwKrIfu
         pW4xsk3lNpa71Zrn8RbOMUw0E/zsD01luh+w/f6GjdqwVJngSxeCdXX9aluOM1Yo0i9i
         nGhGpehWAv9zmRPnRAxfTTydhKwp8f8TMSiSpdB9sPBs1V2IayZ4PTcKBrwGXcyD3I1D
         ew3pPbjyHL2+JtbjRFi3Dn8y8hTPHhmM10l4c43734OuHEYdF1oeee2t2q0PoTT8MM6n
         hVdA==
X-Forwarded-Encrypted: i=1; AKwUvBwsQOCO5DYRCiesk6AIrBSb15U7D8tuiJAHBoIzSWys/J8YlvHcaFFBVAhqSN81q0FHDiMWNaim+nyji80=@vger.kernel.org
X-Gm-Message-State: APuU4Z8erCESJf3Xm59TCdqc7Kjw5zMDtGwf1bsf24CTSjYYZ7Ta32YZ
	R6u/JcMhsHAqI9EeCEOeTR0pIFl0kUr/EiIyv6CyUSqgHll+vZMrDbwjOfjWstth2lQ=
X-Gm-Gg: AYBFou3gp1GLlfvzQ4EjFyUETJ9UWqPzzdwa3blgAh8qh6rCpjqRTgnqFq3tCbtcoTb
	mClUo+vdAzuYUK5VCTtLU3R43iGVMoRROTmNTLlZcvvtzlPnjnS+jyMwJrppa3M11eHa94Irae1
	1FR1l747V6fD2emt43FJvzlMtv74axMW5oQp+/ueMN2lqknZUPMSTbfXs7TW1zRqRt9EVZ778OL
	UIbQXBpS49sywqR2Vckod7fGhABj1PQDx5Bw2boSnx0D4CMVJ5nMZwqYE/v88YlSDpF9Kc23haO
	1oqPe06FkRfM/kzePtLXqPkusLNP0DsUuCDT78mJ2oAQoXivq9huclb9F2rG3ZJ5JOkO/z8ADRM
	DtzsbxFbq6BeJ9NasRjlr1zCKJuyQhjaBGIqF7x4LjpuEMHxb0KabERBo+gkmnuW/H7+9tag5Pn
	8Q952zPwYjCEwmTdxTCb806xTDURkS/Eq/aOHEt2udlf47WMhw7UC4LR2Ngh8yqONQGwBjG0lia
	cW2SYMU3XuDRlTgM+DGkRHRNDh9Q5eFxBLxrq3CdWdvdJHMXuztAmUKEGUrOG85LenUkarC0N0p
	w80YTMHSeg4yeXX+0r1sotynhv9mEOgZl8zf1zo3JJQunQ==
X-Received: by 2002:a05:600c:8b01:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4ac1737c682mr380593515e9.8.1793808581916;
        Wed, 04 Nov 2026 08:09:41 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:458e:d526:4eee:2f63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm85089815e9.3.2026.11.04.08.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:09:41 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 04 Nov 2026 16:09:31 +0000
Subject: [PATCH v2 2/2] mfd: Use named initializers for acpi_device_id
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-acpi-mfd-v2-2-64b9dee3baaf@thegoodpenguin.co.uk>
References: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
In-Reply-To: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Zha Qipeng <qipeng.zha@intel.com>, Qunqin Zhao <zhaoqunqin@loongson.cn>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-crypto@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793808577; l=6931;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=Vj9aA4kkyLkATCkr6co8ZKsAFirU7o8I3IUzmoP+oTU=;
 b=/CnulND5qAnaKTESsxoCTPHT8xa5xKKx/FKC3JkDQ45uhPQYBjiw6v21n1uS5CQ2D0px0j8Dx
 AjLvUGtJn+2AYiELUoqAmHrCh/nqs72pLWkwd/sLS9OEwdhIQGQ6gBT
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mfd/axp20x-i2c.c              | 2 +-
 drivers/mfd/cs42l43-i2c.c             | 8 ++++----
 drivers/mfd/intel_pmc_bxt.c           | 2 +-
 drivers/mfd/intel_soc_pmic_bxtwc.c    | 2 +-
 drivers/mfd/intel_soc_pmic_chtdc_ti.c | 4 ++--
 drivers/mfd/intel_soc_pmic_chtwc.c    | 2 +-
 drivers/mfd/intel_soc_pmic_crc.c      | 4 ++--
 drivers/mfd/intel_soc_pmic_mrfld.c    | 4 ++--
 drivers/mfd/kempld-core.c             | 6 +++---
 drivers/mfd/loongson-se.c             | 2 +-
 drivers/mfd/upboard-fpga.c            | 6 +++---
 11 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 5c93136f977e..c5d0d35c7fb0 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -97,7 +97,7 @@ static const struct acpi_device_id axp20x_i2c_acpi_match[] = {
 		.id = "INT33F4",
 		.driver_data = AXP288_ID,
 	},
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, axp20x_i2c_acpi_match);
 #endif
diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index 2f1862199618..89dca295cc57 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -73,10 +73,10 @@ MODULE_DEVICE_TABLE(of, cs42l43_of_match);
 
 #if IS_ENABLED(CONFIG_ACPI)
 static const struct acpi_device_id cs42l43_acpi_match[] = {
-	{ "CSC4243", CS42L43_DEVID_VAL },
-	{ "CSC2A3B", CS42L43B_DEVID_VAL },
-	{ "CSC4244", CS42L43B_DEVID_VAL },
-	{}
+	{ .id = "CSC4243", .driver_data = CS42L43_DEVID_VAL },
+	{ .id = "CSC2A3B", .driver_data = CS42L43B_DEVID_VAL },
+	{ .id = "CSC4244", .driver_data = CS42L43B_DEVID_VAL },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cs42l43_acpi_match);
 #endif
diff --git a/drivers/mfd/intel_pmc_bxt.c b/drivers/mfd/intel_pmc_bxt.c
index e405d7513ca1..6a9ad1f135c7 100644
--- a/drivers/mfd/intel_pmc_bxt.c
+++ b/drivers/mfd/intel_pmc_bxt.c
@@ -414,7 +414,7 @@ static int intel_pmc_create_devices(struct intel_pmc_dev *pmc)
 }
 
 static const struct acpi_device_id intel_pmc_acpi_ids[] = {
-	{ "INT34D2" },
+	{ .id = "INT34D2" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, intel_pmc_acpi_ids);
diff --git a/drivers/mfd/intel_soc_pmic_bxtwc.c b/drivers/mfd/intel_soc_pmic_bxtwc.c
index 117517c171b5..08fedf3d3fee 100644
--- a/drivers/mfd/intel_soc_pmic_bxtwc.c
+++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
@@ -606,7 +606,7 @@ static int bxtwc_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(bxtwc_pm_ops, bxtwc_suspend, bxtwc_resume);
 
 static const struct acpi_device_id bxtwc_acpi_ids[] = {
-	{ "INT34D3", },
+	{ .id = "INT34D3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, bxtwc_acpi_ids);
diff --git a/drivers/mfd/intel_soc_pmic_chtdc_ti.c b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
index 6daf33e07ea0..49f4138961c8 100644
--- a/drivers/mfd/intel_soc_pmic_chtdc_ti.c
+++ b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
@@ -162,8 +162,8 @@ static int chtdc_ti_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(chtdc_ti_pm_ops, chtdc_ti_suspend, chtdc_ti_resume);
 
 static const struct acpi_device_id chtdc_ti_acpi_ids[] = {
-	{ "INT33F5" },
-	{ },
+	{ .id = "INT33F5" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, chtdc_ti_acpi_ids);
 
diff --git a/drivers/mfd/intel_soc_pmic_chtwc.c b/drivers/mfd/intel_soc_pmic_chtwc.c
index aa71a7d83fcd..413d2fd4f86a 100644
--- a/drivers/mfd/intel_soc_pmic_chtwc.c
+++ b/drivers/mfd/intel_soc_pmic_chtwc.c
@@ -261,7 +261,7 @@ static const struct i2c_device_id cht_wc_i2c_id[] = {
 };
 
 static const struct acpi_device_id cht_wc_acpi_ids[] = {
-	{ "INT34D3", },
+	{ .id = "INT34D3" },
 	{ }
 };
 
diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index 627a89334908..d39f73ae6773 100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -252,8 +252,8 @@ static int crystal_cove_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(crystal_cove_pm_ops, crystal_cove_suspend, crystal_cove_resume);
 
 static const struct acpi_device_id crystal_cove_acpi_match[] = {
-	{ "INT33FD" },
-	{ },
+	{ .id = "INT33FD" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, crystal_cove_acpi_match);
 
diff --git a/drivers/mfd/intel_soc_pmic_mrfld.c b/drivers/mfd/intel_soc_pmic_mrfld.c
index 77121775c1a3..531d8b8be44d 100644
--- a/drivers/mfd/intel_soc_pmic_mrfld.c
+++ b/drivers/mfd/intel_soc_pmic_mrfld.c
@@ -139,8 +139,8 @@ static int bcove_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id bcove_acpi_ids[] = {
-	{ "INTC100E" },
-	{}
+	{ .id = "INTC100E" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, bcove_acpi_ids);
 
diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index 47062f876e5d..399f1c97320c 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -470,9 +470,9 @@ static void kempld_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id kempld_acpi_table[] = {
-	{ "KEM0000", (kernel_ulong_t)&kempld_platform_data_generic },
-	{ "KEM0001", (kernel_ulong_t)&kempld_platform_data_generic },
-	{}
+	{ .id = "KEM0000", .driver_data = (kernel_ulong_t)&kempld_platform_data_generic },
+	{ .id = "KEM0001", .driver_data = (kernel_ulong_t)&kempld_platform_data_generic },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, kempld_acpi_table);
 
diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
index 3902ba377d69..49a95b8e4ca3 100644
--- a/drivers/mfd/loongson-se.c
+++ b/drivers/mfd/loongson-se.c
@@ -233,7 +233,7 @@ static int loongson_se_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id loongson_se_acpi_match[] = {
-	{ "LOON0011", 0 },
+	{ .id = "LOON0011" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson_se_acpi_match);
diff --git a/drivers/mfd/upboard-fpga.c b/drivers/mfd/upboard-fpga.c
index 9a9599dcb0a1..37c3c50aa6e4 100644
--- a/drivers/mfd/upboard-fpga.c
+++ b/drivers/mfd/upboard-fpga.c
@@ -300,9 +300,9 @@ static int upboard_fpga_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id upboard_fpga_acpi_match[] = {
-	{ "AANT0F01", (kernel_ulong_t)&upboard_up2_fpga_data },
-	{ "AANT0F04", (kernel_ulong_t)&upboard_up_fpga_data },
-	{}
+	{ .id = "AANT0F01", .driver_data = (kernel_ulong_t)&upboard_up2_fpga_data },
+	{ .id = "AANT0F04", .driver_data = (kernel_ulong_t)&upboard_up_fpga_data },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, upboard_fpga_acpi_match);
 

-- 
2.53.0

