Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF454FC8F1
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958862; cv=none; b=Pc8y8nebDxxTp5XUdv6CRT1cmaqKOcrur9UfnDpIIi4Rrjs3NbETfB/4A/jBDsApQ+hFlMc5cRUyzwdvVvBXwIJdaQyQiqYV1uG5Wab2bugzoH0iBpKeeyZm5taXjsicrwIYLv7LsW9NZJq89MZV3u2JNMGDtrP3ipNFpLnQvJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958862; c=relaxed/simple;
	bh=rpx6xCWk0/Al0q84wetqqUunfVZMrP2gWEeAUC5k6M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7WeJrAseDlAPB2FRpMsFChN/jmZQpBQzqorfnFJADNJVD38pR6C+o8vn0r/UQpUiOHwF/euMBh6seWq2+5OeiymrWykdgPwkZOeezXHR5Suz0yz7P3Dc0slzU8z7PmD4VbLIBgDSy5jG844bDZG7HquytJ0N6ELSK1onTaziVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ys+GhMp7; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ys+GhMp7"
Received: by mail-pz2-f36.google.com with SMTP id d2e1a72fcca58-88a0f29ce98so901431b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790958860; x=1791563660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGha0pB3KL0+MKddnYNqCM0e/D+sXpNkHDk9Hc/S60s=;
        b=Ys+GhMp7zzg7ooHyGN79aeDvVwbxKkHFzcSampmlDcsy+kj3NZY/l0NkyNHxYn+Jlr
         8mhZZM0TGtDdwpwlxFs5RllCYPmsaphvWEUvhLCKHvqkgXEgiqTioE1BmP7MBu1UEDlh
         +q67WkcO1dQfR/UP9XI+0nnM6sC4lWLiQjDGzdmZXu7MDUpDNH97jwuVgk63md8aSO7z
         G0pwjphz5wQzwyNSzE1iBd+t9/YHSwmOZOI6yfb5CEOOGwHzeiLGGXPnmssHnCSuM9o7
         JTYb3FIqXnpP0mEDUjAhoBAGBy+ucJDrreI7aAt1bbCmPoNolRvnR9Jl+5DcFCz+eW56
         Qdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958860; x=1791563660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vGha0pB3KL0+MKddnYNqCM0e/D+sXpNkHDk9Hc/S60s=;
        b=jRzWe9aZusVhfn0Ty8LIQ6q7S1E2B639HpVNiXAYzTeRI9XeZqpUfbZJ3u7bWueWMg
         oT+zLpbeRAsF2imlJD+yx+rz5F7wda2eOtMIZr9/+Ej4S3qw+xkSfrGyC6HL8RZvi4Fj
         LeUjZLf87bptcj4q9zdIHR4xUEdLJH/Q0M8zTbrGrBfCD+mIe9JxOMCp2IDBLJBhBgdD
         6Ty42Sj5zZ1PVK8N2VpNQsGo54tHBj/LqjdMib3i8dIG6X8QYmCTpENXi9ZZkLYIUKiU
         cVi1ut8s14dyJYArrpuvl2btc4GX/EwxRpfOCfMbO2oZp8/F4sjGYBn08//e51xYchTP
         8r+Q==
X-Gm-Message-State: AFuF++laWUaTsOa1TD+COeP0Y8ZanOFsk27vVEFJanvekr5alZ6jHOQO
	8rvlM9N4am/YRAsSHifUIHGqDmU12y6s8U5+RbzbHvhqqa70Wsu5PAH5Cwu3f3GJ
X-Gm-Gg: AYBFou2W1ZNhE42C/CFTngCHfpSbQgHqMeQ8VR8v5rZQBY6I8enJJEMf3BInWtrpk+M
	Z8H+CjeX11NyFbGBeFwU8DuQQkgb1k9Yyj4wEXh3EzyDa5p32CBix9PVXFHjVznBL6oi8EMEe7Q
	xtHC5agHboGM4ONwFgVDLsEJbSLgoy2gzHn0FT8ixdvOfFHHHwVB0CZhLWbGiLWTqYolW8yxC8B
	481/ZelPYRLRddvK81goohJnqz6F7KRfxPlU+8LSG6YZ/QhVckGuTNdO+4PoJU7mUnnEtZ29DN5
	qmtZLGFiRxlj4sPXVpn7NRIwUJ4ZxTwSuIa9HZbFbsJNmJ+hv3Y2F1rmBQ2LTIVDrZz7dlBXZyn
	E1b0yW2scNsxuZAwgKIkDE9jySVhw56qOR/8gtUg2eySwu32wHMYY+/1X9cIj7nZtIqpuncISyP
	/v8Ghfo3cGvIidul/yq44Sk2ziWUxa4wrGQikK0HJaS5wkMP2ZI5tDcL1pTL3VL/32aMt5KwtN1
	W9xKA==
X-Received: by 2002:a05:6a00:1888:b0:857:7384:b5fa with SMTP id d2e1a72fcca58-88af4d362a1mr3471138b3a.22.1790958860365;
        Fri, 02 Oct 2026 09:34:20 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968b6absm1135149b3a.2.2026.10.02.09.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:34:19 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	lee@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v12 7/9] platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
Date: Fri,  2 Oct 2026 09:33:48 -0700
Message-ID: <20261002163350.1248431-8-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002163350.1248431-1-tchatard@gmail.com>
References: <20261002163350.1248431-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell Latitude 5285 2-in-1 has two cameras connected through a TPS68470
PMIC/clock/GPIO hub:

  Front: OV5670 (ACPI INT3479) on I2C4
  Back:  OV8858 (ACPI INT3477) on I2C2, daisy-chained behind the TPS68470
         S_I2C port (controlled by reg 0x43 S_I2C_CTL)

Add the regulator supply map, GPIO lookup tables and a static clock
consumer list (for both sensors, to work around the broken INT3479 _DEP)
for this machine, and wire it into the board-data DMI table.

Regulator mapping:
  CORE -> dvdd/INT3477, ANA -> avdd/INT3477, VSIO -> dovdd/INT3477 (opens
  the S_I2C passthrough), AUX1 -> dvdd/INT3479, AUX2 -> dovdd/INT3479,
  VIO kept always_on. VSIO also supplies avdd for INT3479 (OV5670).

Assisted-by: LLM
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 160 ++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index c2ec802fc..90094732e 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -464,6 +464,159 @@ static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_data =
 	},
 };
 
+/* Settings for Dell Latitude 5285 2-in-1 */
+
+/*
+ * The BIOS leaves GNVS field C0TP at zero, which causes INT3479's _DEP to
+ * resolve to PCI0 instead of the INT3472 device. Provide a static clock
+ * consumer list so probe registers MCLK lookups for both sensors regardless
+ * of the broken _DEP traversal.
+ */
+static const struct tps68470_clk_consumer dell_5285_clk_consumers[] = {
+	{ .consumer_dev_name = "i2c-INT3477:00" },	/* OV8858 rear camera */
+	{ .consumer_dev_name = "i2c-INT3479:00" },	/* OV5670 front camera */
+};
+
+static struct regulator_consumer_supply dell_5285_int3477_ana_consumer_supplies[] = {
+	REGULATOR_SUPPLY("avdd", "i2c-INT3477:00"),
+};
+
+static struct regulator_consumer_supply dell_5285_int3477_core_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-INT3477:00"),
+};
+
+/*
+ * VSIO controls the S_I2C_CTL passthrough; its voltage must match VIO
+ * (both 1800600 uV). dovdd/INT3477 enables the passthrough when OV8858
+ * opens its I2C path. avdd/INT3479 provides the OV5670 analog supply.
+ */
+static struct regulator_consumer_supply dell_5285_int3477_vsio_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-INT3477:00"),
+	REGULATOR_SUPPLY("avdd", "i2c-INT3479:00"),
+};
+
+static struct regulator_consumer_supply dell_5285_int3479_aux1_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-INT3479:00"),
+};
+
+static struct regulator_consumer_supply dell_5285_int3479_aux2_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
+};
+
+static const struct regulator_init_data dell_5285_tps68470_core_reg_init_data = {
+	.constraints = {
+		.min_uV = 1200000,
+		.max_uV = 1200000,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_core_consumer_supplies),
+	.consumer_supplies = dell_5285_int3477_core_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_ana_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_ana_consumer_supplies),
+	.consumer_supplies = dell_5285_int3477_ana_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_vcm_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = 0,
+	.consumer_supplies = NULL,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_vsio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_vsio_consumer_supplies),
+	.consumer_supplies = dell_5285_int3477_vsio_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_aux1_reg_init_data = {
+	.constraints = {
+		.min_uV = 1213200,
+		.max_uV = 1213200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3479_aux1_consumer_supplies),
+	.consumer_supplies = dell_5285_int3479_aux1_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_aux2_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3479_aux2_consumer_supplies),
+	.consumer_supplies = dell_5285_int3479_aux2_consumer_supplies,
+};
+
+static const struct tps68470_regulator_platform_data dell_5285_tps68470_pdata = {
+	.reg_init_data = {
+		[TPS68470_CORE] = &dell_5285_tps68470_core_reg_init_data,
+		[TPS68470_ANA] = &dell_5285_tps68470_ana_reg_init_data,
+		[TPS68470_VCM] = &dell_5285_tps68470_vcm_reg_init_data,
+		[TPS68470_VIO] = &common_tps68470_vio_reg_init_data,
+		[TPS68470_VSIO] = &dell_5285_tps68470_vsio_reg_init_data,
+		[TPS68470_AUX1] = &dell_5285_tps68470_aux1_reg_init_data,
+		[TPS68470_AUX2] = &dell_5285_tps68470_aux2_reg_init_data,
+	},
+};
+
+static struct gpiod_lookup_table dell_5285_int3477_gpios = {
+	.dev_id = "i2c-INT3477:00",
+	.table = {
+		/*
+		 * TPS68470 GPIO9 = s_resetn (secondary camera reset, active-low)
+		 * TPS68470 GPIO7 = s_enable (secondary camera enable/powerdown)
+		 * These logic outputs are specifically designed for secondary
+		 * camera control on the TPS68470. Matches Surface Go pattern.
+		 */
+		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("tps68470-gpio", 7, "powerdown", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
+static struct gpiod_lookup_table dell_5285_int3479_gpios = {
+	.dev_id = "i2c-INT3479:00",
+	.table = {
+		GPIO_LOOKUP("tps68470-gpio", 3, "reset", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("tps68470-gpio", 4, "powerdown", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
+static const struct int3472_tps68470_board_data dell_5285_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:05",
+	.tps68470_regulator_pdata = &dell_5285_tps68470_pdata,
+	.n_clk_consumers = ARRAY_SIZE(dell_5285_clk_consumers),
+	.clk_consumers = dell_5285_clk_consumers,
+	.n_gpiod_lookups = 2,
+	.tps68470_gpio_lookup_tables = {
+		&dell_5285_int3477_gpios,
+		&dell_5285_int3479_gpios,
+	},
+};
+
 static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 	{
 		.matches = {
@@ -524,6 +677,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		},
 		.driver_data = (void *)&intel_nvl_tps68470_board_data,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
+		},
+		.driver_data = (void *)&dell_5285_tps68470_board_data,
+	},
 	{ }
 };
 
-- 
2.53.0

