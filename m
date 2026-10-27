Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136610;
	b=vZPQ6b4YW1ie+VRBV5NmZ5I/6KwH9O1G1ejT/zROytb9WOWMLgCkkxvarF5p0i5kQ7y1
	 qJNrO4IsxTjs7x+22w1gPrP+XRkiJpaeqFBeI33E8jFO5VtSFTl1lSGUbQlYY9D5lV/9X
	 3qCbymMO2b2uajH7HGXyc/jEQ6hbi1qWM5GV0/E64yQpSjG5Jgk4RI1aTd9HaDFrqpCS/
	 ZcTJl7c2pChbe1UIHHFoJFwQAdk93jgoCGoNxZgPn4LGxTTXxmvH7HPlRNe5vBU+Jx2BS
	 nrkyqp3zCx8te6Wzk0TGZ0FjwhbY6AqA6Wg52/dEXMRl/Vcc3bp0VWYbZbYNpNU56iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6gipOOWgeaOwF/UIt+824d1BT64gveasiEWFg06c6nI=;
	b=pc7Ux/mlJlV3Z44CFGLtrmjHmGZC7MhfD95bUOFj+Idu5/D4aD66TfcphQ4l4hqINa4K
	 Ksv/Na/Xy5Qo6qd2mv5d3TpWUPTuoybsBxABZJZKHW5ULvU2cEzpK19AkKD1IICT9cg2j
	 BfOLMEwIvaWYI98TGjjLWiPqnvcsMUDKFoLU8KQ7SduMkC06pEHmRR/aYjMd99V4m0IRA
	 jTjvITpnRMRaiEWP+1ycrpGt8oJiwK3rPpj/QvrcBPk9uYxcxKkpltunTSu3YhFxuvtt9
	 D2OY2M5A42lKiKqOFHJmkqatlPH2mKXCzb1LCSWwyslbl+Aond1qNmo6O/NPMMmxRuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="t6Lg/ovg";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44065606A329
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44065606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6Lg/ovg
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15943c9c005so389071c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136604; x=1793741404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6gipOOWgeaOwF/UIt+824d1BT64gveasiEWFg06c6nI=;
        b=t6Lg/ovgB8NIRGmMMqGcmjl/8ilJ8W7uaqJyGKuEMNPgFDpsqCwpvkSM5C097mgacP
         zS8KSKq11JdqUMKdrbBOuqSiICdITpjrAf8gdAduhaYoOqjfl4lz5BTy6si7uFhChwmB
         YZNRerYco9AKrDfOMrs83xSL9E4LCn+vdyZXQa/C5vFXhgnvEDUndQqhBntZ9AlCyv6d
         LF2qhoRUmj+OR4rz4zwwYZMPnsRvypOj1X3HSHd3ReZXAXYbpNyocduH3lozZ6Ji7hRD
         q1XIIQ3PEt1nqcfHH7ZBAa1AbUFTvMWv7cXohxnpcRH2H+GgjlTSy3pexXsyXZ2Pp+x8
         eJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136604; x=1793741404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6gipOOWgeaOwF/UIt+824d1BT64gveasiEWFg06c6nI=;
        b=ZH7Svnf5wAC/Oh6jjACHjWhMuCb33fEtGS/UXHo5Uxgm1oVe8UA1TmzMYt8PkCGI4X
         4zToWBANrbCOFkJMHwQzk06fWB5zKfNYjGTHfjoz6X1L2V0W/a/nMeO6bszCKkO1aCry
         oe3kanMHsP1wP9K7jyakrWhpfQXrBlzzY9w1+PnwXVbbXoXSdcfftCC/UZVmcrgWEUwW
         gKvzs9TKWlc5GbH1xWWznS+SnZwZfuA0figuPA9svLRPJDHy2PDL/rR9Kd9KZ6GStIWH
         kCDXnsIiRAXGkSaCJq4yT6UF7gH4sbHHoBDqChdrPLndcqm3ScSuiayO3zekl1/mUtYk
         NHrg==
X-Forwarded-Encrypted: i=1; AKwUvBycqgIWH3LqUQQ7C5KN8u+Ek1rnfcDhCxXgJnLk33i6QDehKcV+mCHE+P0mKSG43Hp0TKAwW0vjr3qpgU0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLElY2UmwxFajd6wEk8LOa4iLPUifMHciM4/kdSk5r+J7rGeSzG
	aiIWSNC9RdrFA0joND6kXMHcKeHGUMz3rQE/DL9fLLydIo1QHhTATQU6
X-Gm-Gg: AYBFou0x8DnqG/XHVK5iZzLtYWu3TwIvDT3rFiHvz3nJmvdQ8lhbbrnP7AxocWCt5E1
	He26zqtmgUmbTeCmsv7bSlYWYAJTOuEW8J+FlzvxgIz54EkCrLx5engyBZ1g7MhKT/xeQeHWgG0
	DrDMsMdRShn7da52uRZXjw7K8qcppXhQ/6zDp/GOytpfL+xYk9QV7VVPxAjhtDocuop8lek8Qi0
	67yOmbhDjV4Zqhztj6QddrLG3rTWTXQ8EfVmaMAja3RWL7MlnO6XePXzpQemXnmTkLakosd3LGa
	6vTK0uC7dHCH9DRcZQYG2thrJnUU+zuPh7cibojFtFwu/ifKcUVws4yY3rPeX0Eqb1O439P6zvA
	c4BFiLVdHVN1cY22mFYIjAbj6XZCVWXJAOEJYOKpFsmU53BRp3goCPe+rgmBWaxywd7Vhze82S9
	RLiogdj4WyoZANLj7IgI+f65xmzHy3Md1sRSLJHrA5xX66xHYQialzbm2lMZDQ1rj29n+B2JtjE
	WsOAofnUOFjGmKOYOVl5dDqsiX5hglfjaH0P5/HI5QEn1xR6UVHT1ZA7C87DiRnkckDmDMtRvCO
	N4amVX64JHe1uOlFFTVW3Hq7t7KRwYLpZpmIBNAQ49XY
X-Received: by 2002:a05:701b:4549:20b0:149:cfa4:9b3b with SMTP id a92af1059eb24-1a6c800e40cmr679118c88.3.1793136603878;
        Tue, 27 Oct 2026 14:30:03 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d7ed488fsm723725c88.7.2026.10.27.14.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:30:03 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 27 Oct 2026 14:29:55 -0700
Subject: [PATCH 1/4] ARM: s3c: crag6410-module: convert GPIO lookup tables
 to property entries
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
Message-Id: <20261027-crag6410-module-swnode-v1-1-2f885799b6ad@gmail.com>
References: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
In-Reply-To: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Static property entries support defining GPIOs and are more similar to
device tree properties, without being prone to losing the association
between device and lookup table due to device name changes. Convert the
extension module definitions to use software nodes and property entries
instead of GPIO lookup tables.

This also fixes lookup failures introduced during the transition to GPIO
descriptors, where the GPIO controller label was incorrectly specified
as "GPION" instead of matching the chip name, corrects the LDO enable
GPIO lookup name for WM5102 to match what the driver requests, and
drops the custom device name for WM8958 that was only needed for the
old lookup table and broke matching against regulator consumer supplies.

Fixes: cb15d8e6cbe8 ("ASoC: codec: arizona: Convert to use GPIO descriptors")
Fixes: 729f02ec02ae ("ASoC: wm8996: Convert to GPIO descriptors")
Fixes: 8563cfe39ba5 ("ASoC: wm5100: Convert to GPIO descriptors")
Fixes: 0119b2a24eb5 ("ASoC: wm2200: Convert to GPIO descriptors")
Fixes: b53d47775651 ("ASoC: wm0010: Convert to GPIO descriptors")
Fixes: 7676e667c841 ("ARM: s3c64xx: Tidy up handling of regulator GPIO lookups")
Fixes: 1d2f46814d20 ("regulator: wm8994: Pass descriptor instead of GPIO number")
Fixes: e1739e86f0cb ("regulator: arizona-ldo1: Look up a descriptor and pass to the core")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410-module.c | 196 ++++++++++++++++---------------
 1 file changed, 102 insertions(+), 94 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index 14b0f9cc103e..471a1ea967e6 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -10,6 +10,8 @@
 #include <linux/i2c.h>
 #include <linux/spi/spi.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
+#include <linux/property.h>
 
 #include <linux/mfd/wm831x/irq.h>
 #include <linux/mfd/wm831x/gpio.h>
@@ -32,14 +34,15 @@
 
 #include "crag6410.h"
 
-static struct gpiod_lookup_table wm0010_gpiod_table = {
-	.dev_id = "spi0.0", /* SPI device name */
-	.table = {
-		/* Active high for Glenfarclas Rev 2 */
-		GPIO_LOOKUP("GPION", 6,
-			    "reset", GPIO_ACTIVE_HIGH),
-		{ },
-	},
+static const struct property_entry wm0010_properties[] = {
+	/* Active high for Glenfarclas Rev 2 */
+	PROPERTY_ENTRY_GPIO("reset-gpios",
+			    SAMSUNG_GPIO_NODE('N'), 6, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node wm0010_swnode = {
+	.properties = wm0010_properties,
 };
 
 static struct wm0010_pdata wm0010_pdata = {
@@ -54,7 +57,8 @@ static struct spi_board_info wm1253_devs[] = {
 		.chip_select	= 0,
 		.mode		= SPI_MODE_0,
 		.irq		= S3C_EINT(4),
-		.platform_data = &wm0010_pdata,
+		.platform_data	= &wm0010_pdata,
+		.swnode		= &wm0010_swnode,
 	},
 };
 
@@ -66,19 +70,23 @@ static struct spi_board_info balblair_devs[] = {
 		.chip_select	= 0,
 		.mode		= SPI_MODE_0,
 		.irq		= S3C_EINT(4),
-		.platform_data = &wm0010_pdata,
+		.platform_data	= &wm0010_pdata,
+		.swnode		= &wm0010_swnode,
 	},
 };
 
-static struct gpiod_lookup_table wm5100_gpiod_table = {
-	.dev_id = "1-001a", /* Device 001a on I2C bus 1 */
-	.table = {
-		GPIO_LOOKUP("GPION", 7,
-			    "wlf,ldo1ena", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("wm5100", 3,
-			    "hp-pol", GPIO_ACTIVE_HIGH),
-		{ },
-	},
+static const struct software_node wm5100_swnode;
+
+static const struct property_entry wm5100_properties[] = {
+	PROPERTY_ENTRY_GPIO("wlf,ldo1ena-gpios",
+			    SAMSUNG_GPIO_NODE('N'), 7, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("hp-pol-gpios",
+			    &wm5100_swnode, 3, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node wm5100_swnode = {
+	.properties = wm5100_properties,
 };
 
 static struct wm5100_pdata wm5100_pdata = {
@@ -127,13 +135,14 @@ static struct wm8996_retune_mobile_config wm8996_retune[] = {
 	},
 };
 
-static struct gpiod_lookup_table wm8996_gpiod_table = {
-	.dev_id = "1-001a", /* Device 001a on I2C bus 1 */
-	.table = {
-		GPIO_LOOKUP("GPION", 7,
-			    "wlf,ldo1ena", GPIO_ACTIVE_HIGH),
-		{ },
-	},
+static const struct property_entry wm8996_properties[] = {
+	PROPERTY_ENTRY_GPIO("wlf,ldo1ena-gpios",
+			    SAMSUNG_GPIO_NODE('N'), 7, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node wm8996_swnode = {
+	.properties = wm8996_properties,
 };
 
 static struct wm8996_pdata wm8996_pdata __initdata = {
@@ -176,6 +185,7 @@ static const struct i2c_board_info wm1254_devs[] = {
 	{ I2C_BOARD_INFO("wm8996", 0x1a),
 	  .platform_data = &wm8996_pdata,
 	  .irq = GLENFARCLAS_PMIC_IRQ_BASE + WM831X_IRQ_GPIO_2,
+	  .swnode = &wm8996_swnode,
 	},
 	{ I2C_BOARD_INFO("wm9081", 0x6c),
 	  .platform_data = &wm9081_pdata, },
@@ -185,6 +195,7 @@ static const struct i2c_board_info wm1255_devs[] = {
 	{ I2C_BOARD_INFO("wm5100", 0x1a),
 	  .platform_data = &wm5100_pdata,
 	  .irq = GLENFARCLAS_PMIC_IRQ_BASE + WM831X_IRQ_GPIO_2,
+	  .swnode = &wm5100_swnode,
 	},
 	{ I2C_BOARD_INFO("wm9081", 0x6c),
 	  .platform_data = &wm9081_pdata, },
@@ -217,22 +228,23 @@ static struct wm8994_pdata wm8994_pdata = {
 	},
 };
 
+static const struct property_entry wm8994_properties[] = {
+	PROPERTY_ENTRY_GPIO("wlf,ldo1ena-gpios",
+			    SAMSUNG_GPIO_NODE('N'), 6, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("wlf,ldo2ena-gpios",
+			    SAMSUNG_GPIO_NODE('N'), 4, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node wm8994_swnode = {
+	.properties = wm8994_properties,
+};
+
 static const struct i2c_board_info wm1277_devs[] = {
 	{ I2C_BOARD_INFO("wm8958", 0x1a),  /* WM8958 is the superset */
 	  .platform_data = &wm8994_pdata,
 	  .irq = GLENFARCLAS_PMIC_IRQ_BASE + WM831X_IRQ_GPIO_2,
-	  .dev_name = "wm8958",
-	},
-};
-
-static struct gpiod_lookup_table wm8994_gpiod_table = {
-	.dev_id = "i2c-wm8958", /* I2C device name */
-	.table = {
-		GPIO_LOOKUP("GPION", 6,
-			    "wlf,ldo1ena", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("GPION", 4,
-			    "wlf,ldo2ena", GPIO_ACTIVE_HIGH),
-		{ },
+	  .swnode = &wm8994_swnode,
 	},
 };
 
@@ -246,6 +258,20 @@ static struct arizona_pdata wm5102_reva_pdata = {
 	},
 };
 
+static const struct software_node wm5102_reva_swnode;
+
+static const struct property_entry wm5102_reva_properties[] = {
+	PROPERTY_ENTRY_GPIO("wlf,ldoena-gpios",
+			    SAMSUNG_GPIO_NODE('N'), 7, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("wlf,micd-pol-gpios",
+			    &wm5102_reva_swnode, 4, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node wm5102_reva_swnode = {
+	.properties = wm5102_reva_properties,
+};
+
 static struct spi_board_info wm5102_reva_spi_devs[] = {
 	[0] = {
 		.modalias	= "wm5102",
@@ -255,18 +281,8 @@ static struct spi_board_info wm5102_reva_spi_devs[] = {
 		.mode		= SPI_MODE_0,
 		.irq		= GLENFARCLAS_PMIC_IRQ_BASE +
 				  WM831X_IRQ_GPIO_2,
-		.platform_data = &wm5102_reva_pdata,
-	},
-};
-
-static struct gpiod_lookup_table wm5102_reva_gpiod_table = {
-	.dev_id = "spi0.1", /* SPI device name */
-	.table = {
-		GPIO_LOOKUP("GPION", 7,
-			    "wlf,ldoena", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("arizona", 4,
-			    "wlf,micd-pol", GPIO_ACTIVE_HIGH),
-		{ },
+		.platform_data	= &wm5102_reva_pdata,
+		.swnode		= &wm5102_reva_swnode,
 	},
 };
 
@@ -279,6 +295,20 @@ static struct arizona_pdata wm5102_pdata = {
 	},
 };
 
+static const struct software_node wm5102_swnode;
+
+static const struct property_entry wm5102_properties[] = {
+	PROPERTY_ENTRY_GPIO("wlf,ldoena-gpios",
+			    SAMSUNG_GPIO_NODE('N'), 7, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("wlf,micd-pol-gpios",
+			    &wm5102_swnode, 2, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node wm5102_swnode = {
+	.properties = wm5102_properties,
+};
+
 static struct spi_board_info wm5102_spi_devs[] = {
 	[0] = {
 		.modalias	= "wm5102",
@@ -288,18 +318,8 @@ static struct spi_board_info wm5102_spi_devs[] = {
 		.mode		= SPI_MODE_0,
 		.irq		= GLENFARCLAS_PMIC_IRQ_BASE +
 				  WM831X_IRQ_GPIO_2,
-		.platform_data = &wm5102_pdata,
-	},
-};
-
-static struct gpiod_lookup_table wm5102_gpiod_table = {
-	.dev_id = "spi0.1", /* SPI device name */
-	.table = {
-		GPIO_LOOKUP("GPION", 7,
-			    "wlf,ldo1ena", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("arizona", 2,
-			    "wlf,micd-pol", GPIO_ACTIVE_HIGH),
-		{ },
+		.platform_data	= &wm5102_pdata,
+		.swnode		= &wm5102_swnode,
 	},
 };
 
@@ -312,7 +332,8 @@ static struct spi_board_info wm5110_spi_devs[] = {
 		.mode		= SPI_MODE_0,
 		.irq		= GLENFARCLAS_PMIC_IRQ_BASE +
 				  WM831X_IRQ_GPIO_2,
-		.platform_data = &wm5102_reva_pdata,
+		.platform_data	= &wm5102_reva_pdata,
+		.swnode		= &wm5102_reva_swnode,
 	},
 };
 
@@ -327,18 +348,21 @@ static struct wm2200_pdata wm2200_pdata = {
 	},
 };
 
-static struct gpiod_lookup_table wm2200_gpiod_table = {
-	.dev_id = "1-003a", /* Device 003a on I2C bus 1 */
-	.table = {
-		GPIO_LOOKUP("GPION", 7,
-			    "wlf,ldo1ena", GPIO_ACTIVE_HIGH),
-		{ },
-	},
+static const struct property_entry wm2200_properties[] = {
+	PROPERTY_ENTRY_GPIO("wlf,ldo1ena-gpios",
+			    SAMSUNG_GPIO_NODE('N'), 7, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node wm2200_swnode = {
+	.properties = wm2200_properties,
 };
 
 static const struct i2c_board_info wm2200_i2c[] = {
 	{ I2C_BOARD_INFO("wm2200", 0x3a),
-	  .platform_data = &wm2200_pdata, },
+	  .platform_data = &wm2200_pdata,
+	  .swnode = &wm2200_swnode,
+	},
 };
 
 static const struct {
@@ -349,8 +373,6 @@ static const struct {
 	int num_i2c_devs;
 	const struct spi_board_info *spi_devs;
 	int num_spi_devs;
-
-	struct gpiod_lookup_table *gpiod_table;
 } gf_mods[] = {
 	{ .id = 0x01, .rev = 0xff, .name = "1250-EV1 Springbank" },
 	{ .id = 0x02, .rev = 0xff, .name = "1251-EV1 Jura" },
@@ -371,36 +393,29 @@ static const struct {
 	{ .id = 0x21, .rev = 0xff, .name = "1275-EV1 Mortlach" },
 	{ .id = 0x25, .rev = 0xff, .name = "1274-EV1 Glencadam" },
 	{ .id = 0x31, .rev = 0xff, .name = "1253-EV1 Tomatin",
-	  .spi_devs = wm1253_devs, .num_spi_devs = ARRAY_SIZE(wm1253_devs),
-	  .gpiod_table = &wm0010_gpiod_table },
+	  .spi_devs = wm1253_devs, .num_spi_devs = ARRAY_SIZE(wm1253_devs) },
 	{ .id = 0x32, .rev = 0xff, .name = "XXXX-EV1 Caol Illa" },
 	{ .id = 0x33, .rev = 0xff, .name = "XXXX-EV1 Oban" },
 	{ .id = 0x34, .rev = 0xff, .name = "WM0010-6320-CS42 Balblair",
 	  .spi_devs = balblair_devs,
 	  .num_spi_devs = ARRAY_SIZE(balblair_devs) },
 	{ .id = 0x39, .rev = 0xff, .name = "1254-EV1 Dallas Dhu",
-	  .i2c_devs = wm1254_devs, .num_i2c_devs = ARRAY_SIZE(wm1254_devs),
-	  .gpiod_table = &wm8996_gpiod_table },
+	  .i2c_devs = wm1254_devs, .num_i2c_devs = ARRAY_SIZE(wm1254_devs) },
 	{ .id = 0x3a, .rev = 0xff, .name = "1259-EV1 Tobermory",
 	  .i2c_devs = wm1259_devs, .num_i2c_devs = ARRAY_SIZE(wm1259_devs) },
 	{ .id = 0x3b, .rev = 0xff, .name = "1255-EV1 Kilchoman",
-	  .i2c_devs = wm1255_devs, .num_i2c_devs = ARRAY_SIZE(wm1255_devs),
-	  .gpiod_table = &wm5100_gpiod_table },
+	  .i2c_devs = wm1255_devs, .num_i2c_devs = ARRAY_SIZE(wm1255_devs) },
 	{ .id = 0x3c, .rev = 0xff, .name = "1273-EV1 Longmorn" },
 	{ .id = 0x3d, .rev = 0xff, .name = "1277-EV1 Littlemill",
-	  .i2c_devs = wm1277_devs, .num_i2c_devs = ARRAY_SIZE(wm1277_devs),
-	  .gpiod_table = &wm8994_gpiod_table },
+	  .i2c_devs = wm1277_devs, .num_i2c_devs = ARRAY_SIZE(wm1277_devs) },
 	{ .id = 0x3e, .rev = 0, .name = "WM5102-6271-EV1-CS127 Amrut",
 	  .spi_devs = wm5102_reva_spi_devs,
-	  .num_spi_devs = ARRAY_SIZE(wm5102_reva_spi_devs),
-	  .gpiod_table = &wm5102_reva_gpiod_table },
+	  .num_spi_devs = ARRAY_SIZE(wm5102_reva_spi_devs) },
 	{ .id = 0x3e, .rev = -1, .name = "WM5102-6271-EV1-CS127 Amrut",
 	  .spi_devs = wm5102_spi_devs,
-	  .num_spi_devs = ARRAY_SIZE(wm5102_spi_devs),
-	  .gpiod_table = &wm5102_gpiod_table },
+	  .num_spi_devs = ARRAY_SIZE(wm5102_spi_devs) },
 	{ .id = 0x3f, .rev = -1, .name = "WM2200-6271-CS90-M-REV1",
-	  .i2c_devs = wm2200_i2c, .num_i2c_devs = ARRAY_SIZE(wm2200_i2c),
-	  .gpiod_table = &wm2200_gpiod_table },
+	  .i2c_devs = wm2200_i2c, .num_i2c_devs = ARRAY_SIZE(wm2200_i2c) },
 };
 
 static int wlf_gf_module_probe(struct i2c_client *i2c)
@@ -420,10 +435,6 @@ static int wlf_gf_module_probe(struct i2c_client *i2c)
 					    rev == gf_mods[i].rev))
 			break;
 
-	gpiod_add_lookup_table(&wm5102_reva_gpiod_table);
-	gpiod_add_lookup_table(&wm5102_gpiod_table);
-	gpiod_add_lookup_table(&wm8994_gpiod_table);
-
 	if (i < ARRAY_SIZE(gf_mods)) {
 		dev_info(&i2c->dev, "%s revision %d\n",
 			 gf_mods[i].name, rev + 1);
@@ -436,9 +447,6 @@ static int wlf_gf_module_probe(struct i2c_client *i2c)
 
 		spi_register_board_info(gf_mods[i].spi_devs,
 					gf_mods[i].num_spi_devs);
-
-		if (gf_mods[i].gpiod_table)
-			gpiod_add_lookup_table(gf_mods[i].gpiod_table);
 	} else {
 		dev_warn(&i2c->dev, "Unknown module ID 0x%x revision %d\n",
 			 id, rev + 1);

-- 
2.56.0.307.g5fe7bd680c-goog

