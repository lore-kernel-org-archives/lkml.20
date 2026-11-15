Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733125;
	b=l0DdjEAjixxVbB7NbNw9nAVdaannBN9SYtTHz6O4sT1fP2QEmuEYOyaG9DId/GXc7ALM
	 uxNzV4xZ7YdR1PnKdWXBMy0Op4ila5M5lNUbR4TzW7H/JZt8qDzZApW/XrtOZNZTLNuwe
	 ZWJ4GajTD7lTFYeQ73UXuv2LrbaHNH8NukGRHeNsuY9vhz1gWLinqQOqGvzzSiSaWV093
	 rvkYS54kT7NMtjKhDCKryoGPf5GIpNYNHbln61toEriUmdA924pH0n24VtMPGxql9teSB
	 XTFeNojsgLpvBVb/J6bV+iaAXR8ynp2/HfwjUKbtFLzVzJjxhvmNBaB8oiLE2Txd5Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OGNmGa1Br9n6frn3nwEVCEsKkFtJfXt6cNs+YxljAoM=;
	b=0Mt6hgEIEghbQrg6bhGMtuzRV6nf6lYvPxtXJiRtepdXGWgU2E1QIi+n9mszTBWhI3oh
	 mDxdQk9X/1M/T7NjZlrmi5gzIAwGeP/K+JXHr+YB/jVLKYAKJSNvrDVDNnu4lvh1ZLw1q
	 Alhkl0v0A07S0n0FzHiy2ywPC0WQS2F/YIZeNRGxAjH33kmZkRWklTU6q0/uUOhoEUYTF
	 eRfO3Qi0WBgRp+/ICwgWC6zpXIn9uXd0eYK0vT4ci6oVi9dBXmQdObyq8y7ROY6fjYU4o
	 JsBhCrZOVOWy+8MZj6mZ+7jGupc1d+zf1S9OIVMwSqENes1g2oaQ0aR/sEwKvnbhXcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fJPvdkAf;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90987606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90987606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fJPvdkAf
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b704171bc9so3274695a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733123; x=1795337923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGNmGa1Br9n6frn3nwEVCEsKkFtJfXt6cNs+YxljAoM=;
        b=fJPvdkAfErUl548UaXUBcUplQQnGoATS0mtlwKA8TgiqXKYiisBS9YT49BbrpaI72Z
         jkjXZz35jd/FFzkGSepn5/5zUjyhJlBS2xLf3yHzsWHMUXuAao3Wx3NZ+wAusPYCWBzf
         22uDc6BTJxJjKwDfisPL/qlwhDgxqIiCzbl2OEesmN2vejxYVqTlRJDnYT1lqsshGOfL
         Q84tl0+712kdYCIBuCNBz1TowbUc4VyiUzbOzWCLMbsbD6M3zc14u2Snk8NGdd/nFOlS
         iIlwMi9wcG/vo65h5dCZrOLgerhkMiAmiMlpHFgYUXOxP6EAmgjU/Aj98EpSaR1DqglT
         OuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733123; x=1795337923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGNmGa1Br9n6frn3nwEVCEsKkFtJfXt6cNs+YxljAoM=;
        b=hu8/+GzpgLZ9nHJxDymN9Z2HWU4sVtObQAvtp0+JaveBRJsLZsPYUMBFMj+bbfmNbc
         3Ejov+r1pp14ksVoUM0c1PDix6vYuDILkJTXrjCZGPqkCwrvX1LglaDIzTu7juSEEsJT
         DGuwMuiA4R6pE7GwwrrX+9qROX0DLFjlrJqPIxmhQYXqkifJUHNL2QfbiFpccuYq2L65
         NrFKr6JMCsfHMjFgI3GEjV0wolX9cVaA0olxi54bYqKRbe/YRgTARNsNuBC+5fl8hLfh
         wr6SWmCkOuJj5Ha2dJIQ1wsCavgtWyz8GUJqaeDHGDquDLH9KwgE6y8JaSQE56GYTmpk
         8WDA==
X-Forwarded-Encrypted: i=1; AL+hErEbVUFVbN7cwEzRyl636kXwt2T3YivvgjTCUVIRkBpdpW3WpHQV1tYxeMKx5oabNuvQp7vxdeJ2pufjvYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FdByJ3YaHuu7drSBk+FWMQudQEeUwyDTO/rOgOIbaP8cNfTpE
	igKh603s0G09UrjmMfJKdRc95fwh7ytmg8A80NJyS2Hn2uXu3ILxIyNf
X-Gm-Gg: AYBFou0GQM9mY36TPCSnFstsd5ojaNuMX1poZv67g4Gn8ZgeWx8S9KW9BpDoA2zW5xu
	eFhouHMyq3Lro8tmjSfbJ9a0A/827u7yRC2LycNd5Du4rUcvImapkVOk7j8vEz2wIXH5CrEYlFs
	nBnbxRb9x47QZqLEnOqfbfmnImUvOfT7lCEiBMfEGDidZ31qKuYm/ZPIojjO+VdIBIo/7iDKHHv
	JDOEN/oskHwc3wVs8yBuYU7d706qSK5ohZGNtQQD7rrELY8/lJXuFimSGKgHh+kYngqtYvLiw2f
	hOYCCBwQs5wiRa9glW5TVRDLSHFbQjBnjhpNsUmiRZv5FK7RBFZAEWru25WLHEfPHTQnAIaD75L
	0KLNeBuUK8Gei5eMbwGkc5GF92BY57KfP7RONgQ15eIInSmI6mQlE84Op0+5BKPm0IeT2YLaKAt
	KwdOMOx4WVY4VHYzTfInkARFPElEo/RMHqUMRx+lfcrr5MOj5EHzQKlo+CUwuABRTzeEE0aR06p
	nvyCmYE5DSFmoMMgvSoJRv6zmzt0zBUu+plZXep7A0mTncSX/isbJISbskDDP0EV8RPBr2aBMFg
	gGqM0GBqUqOH6v+zuwBS0row99IWpgh++HuW3xgg9eoICnE18hcUob9UkFhxymKXXk88qWEbmz4
	JA3X7eVBgtbeDq5wxrTfOnnz+1yfI15Bt
X-Received: by 2002:a17:907:6d02:b0:c4d:4d5b:4bd6 with SMTP id a640c23a62f3a-c509654df6emr572900666b.41.1794733122786;
        Sun, 15 Nov 2026 00:58:42 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:41 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 3/4] mfd: aat2870: Convert to use OF bindings
Date: Sun, 15 Nov 2026 10:58:24 +0200
Message-ID: <20261115085826.89641-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115085826.89641-1-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conversion of the AAT2870 driver to use OF bindings requires a few complex
changes that should be done simultaneously.

The AAT2870 essentially provides two functions via child devices:
backlight and regulators. Both functions are fairly self-sufficient and
may not be populated on the final board. Consequently, the MFD
registration API was replaced with of_platform_populate(), and each
sub-device was given its own compatible string.

Additionally, aat2870-core utilizes an enable GPIO. Obtaining this GPIO
was converted to use modern gpiod/OF helpers, allowing the redundant
aat2870_enable() and aat2870_disable() helpers to be removed.

The aat2870-regulator driver was updated to register each of the four LDOs
from a dedicated OF node using modern regulator framework.

The aat2870-backlight driver was changed to populate all required
properties from a dedicated Device Tree node. Its channel map was updated
to use u8 instead of int. Furthermore, because the maximum current is now
parsed as an absolute value rather than an enum entry, the calculation and
application of the maximum current were updated accordingly.

All of the changes above allow platform data to be removed entirely.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backlight
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/aat2870-core.c            | 128 +++++----------------
 drivers/regulator/aat2870-regulator.c | 159 +++++++++++---------------
 drivers/video/backlight/aat2870_bl.c  |  51 +++++----
 include/linux/mfd/aat2870.h           |  95 +--------------
 4 files changed, 127 insertions(+), 306 deletions(-)

diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index 5d43fd1da96e9..f5409dd91efb3 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -6,17 +6,23 @@
  * Author: Jin Park <jinyoungp@nvidia.com>
  */
 
-#include <linux/kernel.h>
-#include <linux/init.h>
 #include <linux/debugfs.h>
-#include <linux/slab.h>
-#include <linux/uaccess.h>
-#include <linux/i2c.h>
 #include <linux/delay.h>
-#include <linux/gpio/legacy.h>
-#include <linux/mfd/core.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/mfd/aat2870.h>
+#include <linux/of_platform.h>
 #include <linux/regulator/machine.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+
+struct aat2870_register {
+	bool readable;
+	bool writeable;
+	u8 value;
+};
 
 static struct aat2870_register aat2870_regs[AAT2870_REG_NUM] = {
 	/* readable, writeable, value */
@@ -61,34 +67,6 @@ static struct aat2870_register aat2870_regs[AAT2870_REG_NUM] = {
 	{ 0, 1, 0x00 },	/* 0x26 AAT2870_LDO_EN */
 };
 
-static struct mfd_cell aat2870_devs[] = {
-	{
-		.name = "aat2870-backlight",
-		.id = AAT2870_ID_BL,
-		.pdata_size = sizeof(struct aat2870_bl_platform_data),
-	},
-	{
-		.name = "aat2870-regulator",
-		.id = AAT2870_ID_LDOA,
-		.pdata_size = sizeof(struct regulator_init_data),
-	},
-	{
-		.name = "aat2870-regulator",
-		.id = AAT2870_ID_LDOB,
-		.pdata_size = sizeof(struct regulator_init_data),
-	},
-	{
-		.name = "aat2870-regulator",
-		.id = AAT2870_ID_LDOC,
-		.pdata_size = sizeof(struct regulator_init_data),
-	},
-	{
-		.name = "aat2870-regulator",
-		.id = AAT2870_ID_LDOD,
-		.pdata_size = sizeof(struct regulator_init_data),
-	},
-};
-
 static int __aat2870_read(struct aat2870_data *aat2870, u8 addr, u8 *val)
 {
 	int ret;
@@ -196,22 +174,6 @@ static int aat2870_update(struct aat2870_data *aat2870, u8 addr, u8 mask,
 	return ret;
 }
 
-static inline void aat2870_enable(struct aat2870_data *aat2870)
-{
-	if (aat2870->en_pin >= 0)
-		gpio_set_value(aat2870->en_pin, 1);
-
-	aat2870->is_enable = 1;
-}
-
-static inline void aat2870_disable(struct aat2870_data *aat2870)
-{
-	if (aat2870->en_pin >= 0)
-		gpio_set_value(aat2870->en_pin, 0);
-
-	aat2870->is_enable = 0;
-}
-
 #ifdef CONFIG_DEBUG_FS
 static ssize_t aat2870_dump_reg(struct aat2870_data *aat2870, char *buf)
 {
@@ -332,9 +294,7 @@ static inline void aat2870_init_debugfs(struct aat2870_data *aat2870)
 
 static int aat2870_i2c_probe(struct i2c_client *client)
 {
-	struct aat2870_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct aat2870_data *aat2870;
-	int i, j;
 	int ret = 0;
 
 	aat2870 = devm_kzalloc_obj(&client->dev, struct aat2870_data);
@@ -347,60 +307,27 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
 	aat2870->reg_cache = aat2870_regs;
 
-	if (pdata->en_pin < 0)
-		aat2870->en_pin = -1;
-	else
-		aat2870->en_pin = pdata->en_pin;
+	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
+						  GPIOD_OUT_HIGH);
+	if (IS_ERR(aat2870->en_pin))
+		return dev_err_probe(&client->dev, PTR_ERR(aat2870->en_pin),
+				     "Failed to get EN GPIO\n");
 
-	aat2870->init = pdata->init;
-	aat2870->uninit = pdata->uninit;
 	aat2870->read = aat2870_read;
 	aat2870->write = aat2870_write;
 	aat2870->update = aat2870_update;
 
 	mutex_init(&aat2870->io_lock);
 
-	if (aat2870->init)
-		aat2870->init(aat2870);
-
-	if (aat2870->en_pin >= 0) {
-		ret = devm_gpio_request_one(&client->dev, aat2870->en_pin,
-					GPIOF_OUT_INIT_HIGH, "aat2870-en");
-		if (ret < 0) {
-			dev_err(&client->dev,
-				"Failed to request GPIO %d\n", aat2870->en_pin);
-			return ret;
-		}
-	}
-
-	aat2870_enable(aat2870);
-
-	for (i = 0; i < pdata->num_subdevs; i++) {
-		for (j = 0; j < ARRAY_SIZE(aat2870_devs); j++) {
-			if ((pdata->subdevs[i].id == aat2870_devs[j].id) &&
-					!strcmp(pdata->subdevs[i].name,
-						aat2870_devs[j].name)) {
-				aat2870_devs[j].platform_data =
-					pdata->subdevs[i].platform_data;
-				break;
-			}
-		}
-	}
-
-	ret = mfd_add_devices(aat2870->dev, 0, aat2870_devs,
-			      ARRAY_SIZE(aat2870_devs), NULL, 0, NULL);
-	if (ret != 0) {
-		dev_err(aat2870->dev, "Failed to add subdev: %d\n", ret);
-		goto out_disable;
+	ret = devm_of_platform_populate(&client->dev);
+	if (ret) {
+		gpiod_set_value_cansleep(aat2870->en_pin, 0);
+		return dev_err_probe(&client->dev, ret, "Failed to populate cells\n");
 	}
 
 	aat2870_init_debugfs(aat2870);
 
 	return 0;
-
-out_disable:
-	aat2870_disable(aat2870);
-	return ret;
 }
 
 static int aat2870_i2c_suspend(struct device *dev)
@@ -408,7 +335,7 @@ static int aat2870_i2c_suspend(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct aat2870_data *aat2870 = i2c_get_clientdata(client);
 
-	aat2870_disable(aat2870);
+	gpiod_set_value_cansleep(aat2870->en_pin, 0);
 
 	return 0;
 }
@@ -420,7 +347,7 @@ static int aat2870_i2c_resume(struct device *dev)
 	struct aat2870_register *reg = NULL;
 	int i;
 
-	aat2870_enable(aat2870);
+	gpiod_set_value_cansleep(aat2870->en_pin, 1);
 
 	/* restore registers */
 	for (i = 0; i < AAT2870_REG_NUM; i++) {
@@ -435,6 +362,12 @@ static int aat2870_i2c_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(aat2870_pm_ops, aat2870_i2c_suspend,
 				aat2870_i2c_resume);
 
+static const struct of_device_id aat2870_match_table[] = {
+	{ .compatible = "skyworks,aat2870" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aat2870_match_table);
+
 static const struct i2c_device_id aat2870_i2c_id_table[] = {
 	{ "aat2870" },
 	{ }
@@ -443,6 +376,7 @@ static const struct i2c_device_id aat2870_i2c_id_table[] = {
 static struct i2c_driver aat2870_i2c_driver = {
 	.driver = {
 		.name			= "aat2870",
+		.of_match_table		= aat2870_match_table,
 		.pm			= pm_sleep_ptr(&aat2870_pm_ops),
 		.suppress_bind_attrs	= true,
 	},
diff --git a/drivers/regulator/aat2870-regulator.c b/drivers/regulator/aat2870-regulator.c
index 970d86f2bbb81..73b6d06858cff 100644
--- a/drivers/regulator/aat2870-regulator.c
+++ b/drivers/regulator/aat2870-regulator.c
@@ -15,73 +15,74 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/mfd/aat2870.h>
-
-struct aat2870_regulator {
-	struct aat2870_data *aat2870;
-	struct regulator_desc desc;
-
-	u8 enable_addr;
-	u8 enable_shift;
-	u8 enable_mask;
-
-	u8 voltage_addr;
-	u8 voltage_shift;
-	u8 voltage_mask;
+#include <linux/regulator/of_regulator.h>
+
+#define AAT2870_LDO_AB_A_MASK    GENMASK(7, 4)
+#define AAT2870_LDO_AB_B_MASK    GENMASK(3, 0)
+#define AAT2870_LDO_CD_C_MASK    GENMASK(7, 4)
+#define AAT2870_LDO_CD_D_MASK    GENMASK(3, 0)
+
+/* Device IDs */
+enum aat2870_regulator_id {
+	AAT2870_ID_LDOA,
+	AAT2870_ID_LDOB,
+	AAT2870_ID_LDOC,
+	AAT2870_ID_LDOD
 };
 
 static int aat2870_ldo_set_voltage_sel(struct regulator_dev *rdev,
 				       unsigned selector)
 {
-	struct aat2870_regulator *ri = rdev_get_drvdata(rdev);
-	struct aat2870_data *aat2870 = ri->aat2870;
+	struct aat2870_data *aat2870 = rdev_get_drvdata(rdev);
+	const struct regulator_desc *rdesc = rdev->desc;
 
-	return aat2870->update(aat2870, ri->voltage_addr, ri->voltage_mask,
-			       selector << ri->voltage_shift);
+	return aat2870->update(aat2870, rdesc->vsel_reg, rdesc->vsel_mask,
+			       (selector << __ffs(rdesc->vsel_mask)) & rdesc->vsel_mask);
 }
 
 static int aat2870_ldo_get_voltage_sel(struct regulator_dev *rdev)
 {
-	struct aat2870_regulator *ri = rdev_get_drvdata(rdev);
-	struct aat2870_data *aat2870 = ri->aat2870;
+	struct aat2870_data *aat2870 = rdev_get_drvdata(rdev);
+	const struct regulator_desc *rdesc = rdev->desc;
 	u8 val;
 	int ret;
 
-	ret = aat2870->read(aat2870, ri->voltage_addr, &val);
+	ret = aat2870->read(aat2870, rdesc->vsel_reg, &val);
 	if (ret)
 		return ret;
 
-	return (val & ri->voltage_mask) >> ri->voltage_shift;
+	return (val & rdesc->vsel_mask) >> __ffs(rdesc->vsel_mask);
 }
 
 static int aat2870_ldo_enable(struct regulator_dev *rdev)
 {
-	struct aat2870_regulator *ri = rdev_get_drvdata(rdev);
-	struct aat2870_data *aat2870 = ri->aat2870;
+	struct aat2870_data *aat2870 = rdev_get_drvdata(rdev);
+	const struct regulator_desc *rdesc = rdev->desc;
 
-	return aat2870->update(aat2870, ri->enable_addr, ri->enable_mask,
-			       ri->enable_mask);
+	return aat2870->update(aat2870, rdesc->enable_reg, rdesc->enable_mask,
+			       rdesc->enable_mask);
 }
 
 static int aat2870_ldo_disable(struct regulator_dev *rdev)
 {
-	struct aat2870_regulator *ri = rdev_get_drvdata(rdev);
-	struct aat2870_data *aat2870 = ri->aat2870;
+	struct aat2870_data *aat2870 = rdev_get_drvdata(rdev);
+	const struct regulator_desc *rdesc = rdev->desc;
 
-	return aat2870->update(aat2870, ri->enable_addr, ri->enable_mask, 0);
+	return aat2870->update(aat2870, rdesc->enable_reg, rdesc->enable_mask, 0);
 }
 
 static int aat2870_ldo_is_enabled(struct regulator_dev *rdev)
 {
-	struct aat2870_regulator *ri = rdev_get_drvdata(rdev);
-	struct aat2870_data *aat2870 = ri->aat2870;
+	struct aat2870_data *aat2870 = rdev_get_drvdata(rdev);
+	const struct regulator_desc *rdesc = rdev->desc;
 	u8 val;
 	int ret;
 
-	ret = aat2870->read(aat2870, ri->enable_addr, &val);
+	ret = aat2870->read(aat2870, rdesc->enable_reg, &val);
 	if (ret)
 		return ret;
 
-	return val & ri->enable_mask ? 1 : 0;
+	return (val & rdesc->enable_mask) >> __ffs(rdesc->enable_mask);
 }
 
 static const struct regulator_ops aat2870_ldo_ops = {
@@ -101,84 +102,60 @@ static const unsigned int aat2870_ldo_voltages[] = {
 	3000000, 3100000, 3200000, 3300000,
 };
 
-#define AAT2870_LDO(ids)				\
-	{						\
-		.desc = {				\
-			.name = #ids,			\
-			.id = AAT2870_ID_##ids,		\
-			.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
-			.volt_table = aat2870_ldo_voltages, \
-			.ops = &aat2870_ldo_ops,	\
-			.type = REGULATOR_VOLTAGE,	\
-			.owner = THIS_MODULE,		\
-		},					\
-	}
+#define AAT2870_LDO(ids, match, vsel, vmask) {		\
+	.name = #ids,					\
+	.of_match = (match),				\
+	.id = AAT2870_ID_##ids,				\
+	.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
+	.volt_table = aat2870_ldo_voltages,		\
+	.ops = &aat2870_ldo_ops,			\
+	.type = REGULATOR_VOLTAGE,			\
+	.owner = THIS_MODULE,				\
+	.vsel_reg = (vsel),				\
+	.vsel_mask = (vmask),				\
+	.enable_reg = AAT2870_LDO_EN,			\
+	.enable_mask = BIT(AAT2870_ID_##ids),		\
+}
 
-static struct aat2870_regulator aat2870_regulators[] = {
-	AAT2870_LDO(LDOA),
-	AAT2870_LDO(LDOB),
-	AAT2870_LDO(LDOC),
-	AAT2870_LDO(LDOD),
+static const struct regulator_desc aat2870_regulators[] = {
+	AAT2870_LDO(LDOA, "ldo-a", AAT2870_LDO_AB, AAT2870_LDO_AB_A_MASK),
+	AAT2870_LDO(LDOB, "ldo-b", AAT2870_LDO_AB, AAT2870_LDO_AB_B_MASK),
+	AAT2870_LDO(LDOC, "ldo-c", AAT2870_LDO_CD, AAT2870_LDO_CD_C_MASK),
+	AAT2870_LDO(LDOD, "ldo-d", AAT2870_LDO_CD, AAT2870_LDO_CD_D_MASK),
 };
 
-static struct aat2870_regulator *aat2870_get_regulator(int id)
-{
-	struct aat2870_regulator *ri = NULL;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(aat2870_regulators); i++) {
-		ri = &aat2870_regulators[i];
-		if (ri->desc.id == id)
-			break;
-	}
-
-	if (i == ARRAY_SIZE(aat2870_regulators))
-		return NULL;
-
-	ri->enable_addr = AAT2870_LDO_EN;
-	ri->enable_shift = id - AAT2870_ID_LDOA;
-	ri->enable_mask = 0x1 << ri->enable_shift;
-
-	ri->voltage_addr = (id - AAT2870_ID_LDOA) / 2 ?
-			   AAT2870_LDO_CD : AAT2870_LDO_AB;
-	ri->voltage_shift = (id - AAT2870_ID_LDOA) % 2 ? 0 : 4;
-	ri->voltage_mask = 0xF << ri->voltage_shift;
-
-	return ri;
-}
-
 static int aat2870_regulator_probe(struct platform_device *pdev)
 {
-	struct aat2870_regulator *ri;
+	struct device *dev = &pdev->dev;
 	struct regulator_config config = { };
 	struct regulator_dev *rdev;
 
-	ri = aat2870_get_regulator(pdev->id);
-	if (!ri) {
-		dev_err(&pdev->dev, "Invalid device ID, %d\n", pdev->id);
-		return -EINVAL;
-	}
-	ri->aat2870 = dev_get_drvdata(pdev->dev.parent);
-
-	config.dev = &pdev->dev;
-	config.driver_data = ri;
-	config.init_data = dev_get_platdata(&pdev->dev);
+	config.dev = dev;
+	config.driver_data = dev_get_drvdata(dev->parent);
 
-	rdev = devm_regulator_register(&pdev->dev, &ri->desc, &config);
-	if (IS_ERR(rdev)) {
-		dev_err(&pdev->dev, "Failed to register regulator %s\n",
-			ri->desc.name);
-		return PTR_ERR(rdev);
+	for (int i = 0; i < ARRAY_SIZE(aat2870_regulators); i++) {
+		rdev = devm_regulator_register(dev, &aat2870_regulators[i], &config);
+		if (IS_ERR(rdev)) {
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "Failed to register regulator %s\n",
+					     aat2870_regulators[i].name);
+		}
 	}
-	platform_set_drvdata(pdev, rdev);
 
 	return 0;
 }
 
+static const struct of_device_id aat2870_regulator_match_table[] = {
+	{ .compatible = "skyworks,aat2870-regulator" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aat2870_regulator_match_table);
+
 static struct platform_driver aat2870_regulator_driver = {
 	.driver = {
 		.name	= "aat2870-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = aat2870_regulator_match_table,
 	},
 	.probe	= aat2870_regulator_probe,
 };
diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index ea955b55bca18..9c68884a97d6d 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -15,11 +15,19 @@
 #include <linux/backlight.h>
 #include <linux/mfd/aat2870.h>
 
+/* Backlight has 8 channels, each bit represents one channel */
+#define AAT2870_BL_CH_ALL	0xff
+
+/* Backlight current magnitude (uA), 450uA current is eq to 0 */
+#define AAT2870_CURRENT_MIN	450
+#define AAT2870_CURRENT_MAX	27900
+#define AAT2870_CURRENT_STEP	900
+
 struct aat2870_bl_driver_data {
 	struct platform_device *pdev;
 	struct backlight_device *bd;
 
-	int channels;
+	u8 channels;
 	int brightness; /* current brightness */
 };
 
@@ -29,7 +37,7 @@ static inline int aat2870_bl_enable(struct aat2870_bl_driver_data *aat2870_bl)
 			= dev_get_drvdata(aat2870_bl->pdev->dev.parent);
 
 	return aat2870->write(aat2870, AAT2870_BL_CH_EN,
-			      (u8)aat2870_bl->channels);
+			      aat2870_bl->channels);
 }
 
 static inline int aat2870_bl_disable(struct aat2870_bl_driver_data *aat2870_bl)
@@ -84,24 +92,12 @@ static const struct backlight_ops aat2870_bl_ops = {
 
 static int aat2870_bl_probe(struct platform_device *pdev)
 {
-	struct aat2870_bl_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct aat2870_bl_driver_data *aat2870_bl;
 	struct backlight_device *bd;
 	struct backlight_properties props;
+	u32 max_current = AAT2870_CURRENT_MAX;
 	int ret = 0;
 
-	if (!pdata) {
-		dev_err(&pdev->dev, "No platform data\n");
-		ret = -ENXIO;
-		goto out;
-	}
-
-	if (pdev->id != AAT2870_ID_BL) {
-		dev_err(&pdev->dev, "Invalid device ID, %d\n", pdev->id);
-		ret = -EINVAL;
-		goto out;
-	}
-
 	aat2870_bl = devm_kzalloc_obj(&pdev->dev, struct aat2870_bl_driver_data);
 	if (!aat2870_bl) {
 		ret = -ENOMEM;
@@ -126,19 +122,19 @@ static int aat2870_bl_probe(struct platform_device *pdev)
 
 	aat2870_bl->bd = bd;
 
-	if (pdata->channels > 0)
-		aat2870_bl->channels = pdata->channels;
-	else
-		aat2870_bl->channels = AAT2870_BL_CH_ALL;
+	aat2870_bl->channels = AAT2870_BL_CH_ALL;
+	device_property_read_u8(&pdev->dev, "skyworks,channels", &aat2870_bl->channels);
+
+	device_property_read_u32(&pdev->dev, "led-max-microamp", &max_current);
+	max_current = clamp(max_current, AAT2870_CURRENT_MIN, AAT2870_CURRENT_MAX);
+	max_current /= AAT2870_CURRENT_STEP;
 
 	/*
 	 * The maximum number of brightness steps is determined by the max current.
-	 * The aat2870_current enum maps directly to the allowed brightness steps.
+	 * The max_current value calculated above maps to the allowed brightness
+	 * steps with +1 offset since max_current 0 is still 450uA.
 	 */
-	if (pdata->max_current > 0)
-		bd->props.max_brightness = pdata->max_current;
-	else
-		bd->props.max_brightness = AAT2870_CURRENT_27_9;
+	bd->props.max_brightness = max_current + 1;
 
 	aat2870_bl->brightness = 0;
 	bd->props.power = BACKLIGHT_POWER_ON;
@@ -166,9 +162,16 @@ static void aat2870_bl_remove(struct platform_device *pdev)
 	backlight_update_status(bd);
 }
 
+static const struct of_device_id aat2870_bl_match_table[] = {
+	{ .compatible = "skyworks,aat2870-backlight" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aat2870_bl_match_table);
+
 static struct platform_driver aat2870_bl_driver = {
 	.driver = {
 		.name	= "aat2870-backlight",
+		.of_match_table = aat2870_bl_match_table,
 	},
 	.probe		= aat2870_bl_probe,
 	.remove		= aat2870_bl_remove,
diff --git a/include/linux/mfd/aat2870.h b/include/linux/mfd/aat2870.h
index c7a3c53eba681..a7b482b790b4e 100644
--- a/include/linux/mfd/aat2870.h
+++ b/include/linux/mfd/aat2870.h
@@ -54,80 +54,13 @@
 #define AAT2870_LDO_EN		0x26
 #define AAT2870_REG_NUM		0x27
 
-/* Device IDs */
-enum aat2870_id {
-	AAT2870_ID_BL,
-	AAT2870_ID_LDOA,
-	AAT2870_ID_LDOB,
-	AAT2870_ID_LDOC,
-	AAT2870_ID_LDOD
-};
-
-/* Backlight channels */
-#define AAT2870_BL_CH1		0x01
-#define AAT2870_BL_CH2		0x02
-#define AAT2870_BL_CH3		0x04
-#define AAT2870_BL_CH4		0x08
-#define AAT2870_BL_CH5		0x10
-#define AAT2870_BL_CH6		0x20
-#define AAT2870_BL_CH7		0x40
-#define AAT2870_BL_CH8		0x80
-#define AAT2870_BL_CH_ALL	0xFF
-
-/* Backlight current magnitude (mA) */
-enum aat2870_current {
-	AAT2870_CURRENT_0_45 = 1,
-	AAT2870_CURRENT_0_90,
-	AAT2870_CURRENT_1_80,
-	AAT2870_CURRENT_2_70,
-	AAT2870_CURRENT_3_60,
-	AAT2870_CURRENT_4_50,
-	AAT2870_CURRENT_5_40,
-	AAT2870_CURRENT_6_30,
-	AAT2870_CURRENT_7_20,
-	AAT2870_CURRENT_8_10,
-	AAT2870_CURRENT_9_00,
-	AAT2870_CURRENT_9_90,
-	AAT2870_CURRENT_10_8,
-	AAT2870_CURRENT_11_7,
-	AAT2870_CURRENT_12_6,
-	AAT2870_CURRENT_13_5,
-	AAT2870_CURRENT_14_4,
-	AAT2870_CURRENT_15_3,
-	AAT2870_CURRENT_16_2,
-	AAT2870_CURRENT_17_1,
-	AAT2870_CURRENT_18_0,
-	AAT2870_CURRENT_18_9,
-	AAT2870_CURRENT_19_8,
-	AAT2870_CURRENT_20_7,
-	AAT2870_CURRENT_21_6,
-	AAT2870_CURRENT_22_5,
-	AAT2870_CURRENT_23_4,
-	AAT2870_CURRENT_24_3,
-	AAT2870_CURRENT_25_2,
-	AAT2870_CURRENT_26_1,
-	AAT2870_CURRENT_27_0,
-	AAT2870_CURRENT_27_9
-};
-
-struct aat2870_register {
-	bool readable;
-	bool writeable;
-	u8 value;
-};
-
 struct aat2870_data {
 	struct device *dev;
 	struct i2c_client *client;
 
 	struct mutex io_lock;
 	struct aat2870_register *reg_cache; /* register cache */
-	int en_pin; /* enable GPIO pin (if < 0, ignore this value) */
-	bool is_enable;
-
-	/* init and uninit for platform specified */
-	int (*init)(struct aat2870_data *aat2870);
-	void (*uninit)(struct aat2870_data *aat2870);
+	struct gpio_desc *en_pin;
 
 	/* i2c io funcntions */
 	int (*read)(struct aat2870_data *aat2870, u8 addr, u8 *val);
@@ -135,30 +68,4 @@ struct aat2870_data {
 	int (*update)(struct aat2870_data *aat2870, u8 addr, u8 mask, u8 val);
 };
 
-struct aat2870_subdev_info {
-	int id;
-	const char *name;
-	void *platform_data;
-};
-
-struct aat2870_platform_data {
-	int en_pin; /* enable GPIO pin (if < 0, ignore this value) */
-
-	struct aat2870_subdev_info *subdevs;
-	int num_subdevs;
-
-	/* init and uninit for platform specified */
-	int (*init)(struct aat2870_data *aat2870);
-	void (*uninit)(struct aat2870_data *aat2870);
-};
-
-struct aat2870_bl_platform_data {
-	/* backlight channels, default is AAT2870_BL_CH_ALL */
-	int channels;
-	/* backlight current magnitude, default is AAT2870_CURRENT_27_9 */
-	int max_current;
-	/* maximum brightness, default is 255 */
-	int max_brightness;
-};
-
 #endif /* __LINUX_MFD_AAT2870_H */
-- 
2.53.0

