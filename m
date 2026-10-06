Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EBA3DD847
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281412; cv=none; b=JujBs+7cu8ZoiLmEUp1lUUgpwCeJPZ6aYTMq4MACoBtSPtFtkwUjsLMhzkRncNXawVaZXJIpecCAY3KpHLvJZtVRm/ZUWOsspkJXiO68hbOLTcIZHg8yYXcjMhRHYJQp1PsHx8/zJa6yzV5xeXpbH/APxzkMpkapy30ijmis1nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281412; c=relaxed/simple;
	bh=nK8O/BwUF4jE1rf0hTPhVYD0rPM4stFBnNoCSN2tngE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XieV+KVNVjeNcSf5HXjuqZ8aeDAB/cBKQzf7IJ+VsDjmgbP9FFyAbb9WNvWePXLV5sLDyQbfiHLsEcouP8UvyTFXLPbFlMV8bHYByx2G0cwvc285YnOyLxqlutQkoQth+8ckmKWQjoKGR0ixPCvOlXOlzNIcjWwh5v7lV5dohCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADtQZ5zh; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADtQZ5zh"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-86aecf49833so287114b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281410; x=1791886210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D+UMRNF0P4Tdy7PqXV6i1F/5xZ/jeivMN6gRI/5+NEc=;
        b=ADtQZ5zhobqcyRrRoyNCKLVQ2YZ1naSr840XqwKTeBB/0T09zjHrBNo7qrmiGLIcYz
         QmC1k+285L50UHcmI8hUPVHCOBYJTjDmVgGQIxINTtDhQLslFKl5pI/VyCxVh44MD3DR
         Tky1CURdytpOiBKSL0hgs4xy66NAQ0PW2zCUIJtepqcBbQL+kjYQB8OgSJle5TzKKDAO
         iN1rQsgaTmhF3i7LJG6oWzK5jPeC/Zu2o7zjfc7Aq/UWpS7CD8uzkJFn2Zg3FiCmJlPD
         6as0AD0o+7YBYJdkOpISUb7pqabxzWormnwf7Jua8xr8lA3j18wLn1drr4DMxELYBrEM
         IfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281410; x=1791886210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D+UMRNF0P4Tdy7PqXV6i1F/5xZ/jeivMN6gRI/5+NEc=;
        b=IvKJm7BDVtk6FTmjnJYnu0kbvxw2GI3QnhyQo+U0cIV6fQOUGw7eym5PmF+N3DCCFz
         Ql8KM5RbhPd7ErnCd3gFTII/tUERGA/njVcayNiPI69id3lHRpczbGD/TpNg/3oFgb6+
         85cHwwsT4q0jNdBA9l3qrAVusibtODfdjw37my6Xyq9k9R7EuiuBs9iNAlje2fbrbPAi
         Kojs1OLCARTnyowKJgXRYPHuRTw6fD6fDPFk67Hnm4Cq3uMZ1ToWP+b+KerFTAFi75Y3
         vLXaV0dlv1ZkcpcejgU1G1XVBfMsc+GgRPUsa95BoEUx5qSyyp/aj8XMJH/icSUdCRw1
         OODQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6k19vILD7JSh3NT+LzE6KhvuNRgjnfM7M8aBWu7oG2NApAGiuE7OZBCyKgC7ROyuoHgzcVYSHIIkQsDs=@vger.kernel.org
X-Gm-Message-State: AFuF++kK171Xs3WRGx97eH/4ChYyH1MzvVK8YbwvpILNL39TRQB1Du+Z
	zCcqIbQfN4eJ1pD+hjUcibq+eAgm443owIklpX4eHsJK7Jx6N6Fh1UBI
X-Gm-Gg: AYBFou293IC9bX/vEb1FhKjUann8dX8oP6O2spphMVdLDdeUN6n5uC9gQSmvEhY59mz
	BFBSdGvJhr1LLm/eohYF7Q4Pbb7Lz8xh+5QKEw9TUMDk9ETeDPvNvtEeEQKJrQz3tvtwCdgrbO1
	41g7cWIs0yu6T6fL+2y+WDqQ/FNPDtA3bkxKrDkRaLAKwW/llqalznIrPsLNu+auDTROvw9boXE
	hbxq6OYpvOJkrKJ14gavUwGa7VmJ5QOzpe158oub3+8M764kbTBYLjwIznvbNnOXreHBTWIKqls
	d/WvFauPEKp1JW2ZnDX/kYv/6zHxvne2MYhvOox92SrGVGR57uq2sehSA8a0BmGElFCSUXN9mz+
	zZGTNOGTSu5HWOZJsEC34ieWo4It92fc02M3ZO10Mw4qnKhcrajDI/0ux+AOPPg7sEXa/v/uHZa
	xc8B33YxLNrgzVlCTLipo+/R5P2IaEnA/FOZ3HIuKjN6RDajF9CtoUC0Gh/LejwLqpXRxqi22bX
	pEIV9+4elzpoGg/FA4=
X-Received: by 2002:a05:6a00:7603:b0:88c:fa50:1a8c with SMTP id d2e1a72fcca58-89047ee5d55mr1329643b3a.28.1791281409988;
        Tue, 06 Oct 2026 03:10:09 -0700 (PDT)
Received: from l (ec2-56-155-114-54.ap-northeast-3.compute.amazonaws.com. [56.155.114.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0b8f7198sm4592961b3a.9.2026.10.06.03.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:10:09 -0700 (PDT)
From: Liu Yufei <lyf98405@gmail.com>
X-Google-Original-From: Liu Yufei <lyf98405@gmail.com
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Yufei <lyf98405@gmail.com>
Subject: [PATCH v2 2/2] iio: proximity: Add driver for Vishay VCNL36829
Date: Tue,  6 Oct 2026 18:09:43 +0800
Message-ID: <20261006100943.78971-3-lyf98405@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006100943.78971-1-lyf98405@gmail.com>
References: <20261006100943.78971-1-lyf98405@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Liu Yufei <lyf98405@gmail.com>

Add an IIO driver for the Vishay VCNL36829 proximity sensor with
integrated VCSEL, connected over I2C.

At probe the driver enables the vdd and vddio supplies, waits for the
sensor to power up, checks the device ID, configures the VCSEL current
and photodiodes, and turns the proximity engine on. The sensor is put
back into shutdown when the device is removed.

The following attributes are exposed:
  - in_proximity0_raw
  - in_proximity_integration_time
  - in_proximity_integration_time_available

Datasheet: https://www.vishay.com/docs/80580/vcnl36829um.pdf
Assisted-by: LLM
Signed-off-by: Liu Yufei <lyf98405@gmail.com>
---
v2:
- Address review comments from Andy (see cover letter for details).

 MAINTAINERS                       |   1 +
 drivers/iio/proximity/Kconfig     |  11 ++
 drivers/iio/proximity/Makefile    |   1 +
 drivers/iio/proximity/vcnl36829.c | 298 ++++++++++++++++++++++++++++++
 4 files changed, 311 insertions(+)
 create mode 100644 drivers/iio/proximity/vcnl36829.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e6ef84b49..5612b9371 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28758,6 +28758,7 @@ VISHAY VCNL36829 PROXIMITY SENSOR DRIVER
 M:	Liu Yufei <lyf98405@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/proximity/vishay,vcnl36829.yaml
+F:	drivers/iio/proximity/vcnl36829.c
 
 VISHAY VEML3235 AMBIENT LIGHT SENSOR DRIVER
 M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
diff --git a/drivers/iio/proximity/Kconfig b/drivers/iio/proximity/Kconfig
index bb77fad2a..f3cec799d 100644
--- a/drivers/iio/proximity/Kconfig
+++ b/drivers/iio/proximity/Kconfig
@@ -233,6 +233,17 @@ config VCNL3020
 	  To compile this driver as a module, choose M here: the
 	  module will be called vcnl3020.
 
+config VCNL36829
+	tristate "Vishay VCNL36829 proximity sensor"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Say Y here if you want to build a driver for the Vishay VCNL36829
+	  proximity sensor with integrated VCSEL.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called vcnl36829.
+
 config VL53L0X_I2C
 	tristate "STMicroelectronics VL53L0X ToF ranger sensor (I2C)"
 	depends on I2C
diff --git a/drivers/iio/proximity/Makefile b/drivers/iio/proximity/Makefile
index 4352833dd..8a65e42fb 100644
--- a/drivers/iio/proximity/Makefile
+++ b/drivers/iio/proximity/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_SX9360)		+= sx9360.o
 obj-$(CONFIG_SX_COMMON) 	+= sx_common.o
 obj-$(CONFIG_SX9500)		+= sx9500.o
 obj-$(CONFIG_VCNL3020)		+= vcnl3020.o
+obj-$(CONFIG_VCNL36829)		+= vcnl36829.o
 obj-$(CONFIG_VL53L0X_I2C)	+= vl53l0x-i2c.o
 obj-$(CONFIG_VL53L1X_I2C)	+= vl53l1x-i2c.o
 obj-$(CONFIG_AW96103)		+= aw96103.o
diff --git a/drivers/iio/proximity/vcnl36829.c b/drivers/iio/proximity/vcnl36829.c
new file mode 100644
index 000000000..6ed7718f7
--- /dev/null
+++ b/drivers/iio/proximity/vcnl36829.c
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Vishay VCNL36829 Proximity Sensor driver
+ *
+ * Copyright (C) 2026 Liu Yufei <lyf98405@gmail.com>
+ */
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/device/devres.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/time.h>
+#include <linux/types.h>
+
+#include <linux/iio/iio.h>
+
+#define VCNL36829_PS_CONF1 0x00
+#define VCNL36829_PS_ON_MSK BIT(0)
+#define VCNL36829_PS_SD_MSK BIT(8)
+
+#define VCNL36829_PS_CONF2 0x01
+#define VCNL36829_PS_IT_MSK GENMASK(11, 8)
+
+#define VCNL36829_PS_CONF3 0x02
+#define VCNL36829_PS_CURRENT_EN_MSK BIT(3)
+#define VCNL36829_PS_CURRENT_MSK GENMASK(2, 0)
+#define VCNL36829_PD1_EN_MSK BIT(8)
+#define VCNL36829_PD2_EN_MSK BIT(9)
+#define VCNL36829_PD3_EN_MSK BIT(10)
+
+#define VCNL36829_PS_CONF5 0x08
+
+#define VCNL36829_DATA 0xF8
+#define VCNL36829_DEV_ID 0xFA
+
+#define VCNL36829_PS_CONF5_INIT 0x00A0
+#define VCNL36829_PS_CURRENT_18MA 0x7
+#define VCNL36829_PS_INT_TIME_25 0x1
+#define VCNL36829_DEV_ID_VAL 0x29
+
+static const int vcnl36829_it_range[] = {0, 25, 0, 25, 0, 375};
+
+struct vcnl36829_data {
+	struct regmap *regmap;
+};
+
+static bool vcnl36829_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case VCNL36829_DATA:
+	case VCNL36829_DEV_ID:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config vcnl36829_regmap_config = {
+	.name = "vcnl36829_regmap",
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = VCNL36829_DEV_ID,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+	.volatile_reg = vcnl36829_volatile_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+static int vcnl36829_read_raw(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan,
+			      int *val, int *val2, long mask)
+{
+	struct vcnl36829_data *data = iio_priv(indio_dev);
+	struct device *dev = regmap_get_device(data->regmap);
+	struct regmap *regmap = data->regmap;
+	unsigned int reg;
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		ret = regmap_read(regmap, chan->address, &reg);
+		if (ret) {
+			dev_err(dev, "Data read failed: %d\n", ret);
+			return ret;
+		}
+		*val = reg;
+		return IIO_VAL_INT;
+
+	case IIO_CHAN_INFO_INT_TIME:
+		ret = regmap_read(regmap, VCNL36829_PS_CONF2, &reg);
+		if (ret) {
+			dev_err(dev, "Data read failed: %d\n", ret);
+			return ret;
+		}
+		/*
+		 * PS_IT field 0 would mean 12.5us, which does not fit the
+		 * 25us step used here. The driver never programs field 0:
+		 * probe sets 25us and write_raw rejects anything below 25us,
+		 * so the field is always >= 1 and val2 = field * 25 holds.
+		 */
+		*val = 0;
+		*val2 = FIELD_GET(VCNL36829_PS_IT_MSK, reg) * 25;
+		return IIO_VAL_INT_PLUS_MICRO;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int vcnl36829_write_raw(struct iio_dev *indio_dev,
+			       struct iio_chan_spec const *chan, int val,
+			       int val2, long mask)
+{
+	struct vcnl36829_data *data = iio_priv(indio_dev);
+
+	switch (mask) {
+	case IIO_CHAN_INFO_INT_TIME: {
+		int ival = val2 / 25;
+		int fval = val2 % 25;
+
+		if (val != 0)
+			return -EINVAL;
+		if (ival < 1 || ival > 15)
+			return -EINVAL;
+		if (fval != 0)
+			return -EINVAL;
+		return regmap_update_bits(data->regmap,
+					  VCNL36829_PS_CONF2,
+					  VCNL36829_PS_IT_MSK,
+					  FIELD_PREP(VCNL36829_PS_IT_MSK, ival));
+	}
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int vcnl36829_read_avail(struct iio_dev *indio_dev,
+				struct iio_chan_spec const *chan,
+				const int **vals, int *type, int *length,
+				long mask)
+{
+	switch (mask) {
+	case IIO_CHAN_INFO_INT_TIME:
+		*length = 6;
+		*vals = vcnl36829_it_range;
+		*type = IIO_VAL_INT_PLUS_MICRO;
+		return IIO_AVAIL_RANGE;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info vcnl36829_info = {
+	.read_raw = vcnl36829_read_raw,
+	.write_raw = vcnl36829_write_raw,
+	.read_avail = vcnl36829_read_avail,
+};
+
+static const struct iio_chan_spec vcnl36829_channels[] = {
+	{
+		.type = IIO_PROXIMITY,
+		.address = VCNL36829_DATA,
+		.indexed = 1,
+		.channel = 0,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_INT_TIME),
+		.info_mask_shared_by_type_available = BIT(IIO_CHAN_INFO_INT_TIME),
+	}
+};
+
+static void vcnl36829_shutdown_action(void *data)
+{
+	struct vcnl36829_data *vcnl36829_data = data;
+
+	regmap_update_bits(vcnl36829_data->regmap,
+			   VCNL36829_PS_CONF1,
+			   VCNL36829_PS_ON_MSK | VCNL36829_PS_SD_MSK,
+			   FIELD_PREP(VCNL36829_PS_ON_MSK, 0) |
+			   FIELD_PREP(VCNL36829_PS_SD_MSK, 1));
+}
+
+static int vcnl36829_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct vcnl36829_data *data;
+	struct iio_dev *indio_dev;
+	struct regmap *regmap;
+	unsigned int reg;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	regmap = devm_regmap_init_i2c(client, &vcnl36829_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "Regmap setup failed\n");
+
+	data = iio_priv(indio_dev);
+	data->regmap = regmap;
+
+	indio_dev->name = "vcnl36829";
+	indio_dev->info = &vcnl36829_info;
+	indio_dev->channels = vcnl36829_channels;
+	indio_dev->num_channels = ARRAY_SIZE(vcnl36829_channels);
+	indio_dev->modes = INDIO_DIRECT_MODE;
+
+	ret = devm_regulator_get_enable(dev, "vdd");
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable vdd\n");
+
+	ret = devm_regulator_get_enable(dev, "vddio");
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable vddio\n");
+
+	/*
+	 * The datasheet does not specify a power-up settling time.
+	 * Wait 3 ms after enabling the supplies before accessing the
+	 * device, as a conservative value.
+	 */
+	fsleep(3 * USEC_PER_MSEC);
+
+	ret = regmap_read(regmap, VCNL36829_DEV_ID, &reg);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read device ID\n");
+	if ((reg & 0xFF) != VCNL36829_DEV_ID_VAL)
+		dev_warn(dev, "Unknown device ID 0x%x\n", reg & 0xFF);
+
+	ret = regmap_update_bits(regmap, VCNL36829_PS_CONF2,
+				 VCNL36829_PS_IT_MSK,
+				 FIELD_PREP(VCNL36829_PS_IT_MSK, VCNL36829_PS_INT_TIME_25));
+	if (ret)
+		return dev_err_probe(dev, ret, "Could not configure PS_IT\n");
+
+	ret = regmap_update_bits(regmap, VCNL36829_PS_CONF3,
+				 VCNL36829_PS_CURRENT_EN_MSK |
+				 VCNL36829_PS_CURRENT_MSK |
+				 VCNL36829_PD1_EN_MSK |
+				 VCNL36829_PD2_EN_MSK |
+				 VCNL36829_PD3_EN_MSK,
+				 FIELD_PREP(VCNL36829_PS_CURRENT_EN_MSK, 1) |
+				 FIELD_PREP(VCNL36829_PS_CURRENT_MSK, VCNL36829_PS_CURRENT_18MA) |
+				 FIELD_PREP(VCNL36829_PD1_EN_MSK, 1) |
+				 FIELD_PREP(VCNL36829_PD2_EN_MSK, 1) |
+				 FIELD_PREP(VCNL36829_PD3_EN_MSK, 1));
+	if (ret)
+		return dev_err_probe(dev, ret, "Could not configure VCSEL/PD\n");
+
+	ret = regmap_write(regmap, VCNL36829_PS_CONF5, VCNL36829_PS_CONF5_INIT);
+	if (ret)
+		return dev_err_probe(dev, ret, "Could not set PS_CONF5\n");
+
+	ret = regmap_update_bits(regmap, VCNL36829_PS_CONF1,
+				 VCNL36829_PS_ON_MSK | VCNL36829_PS_SD_MSK,
+				 FIELD_PREP(VCNL36829_PS_ON_MSK, 1) |
+				 FIELD_PREP(VCNL36829_PS_SD_MSK, 0));
+	if (ret)
+		return dev_err_probe(dev, ret, "Could not set initial config\n");
+
+	ret = devm_add_action_or_reset(dev, vcnl36829_shutdown_action, data);
+	if (ret)
+		return ret;
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static const struct i2c_device_id vcnl36829_id_table[] = {
+	{ .name = "vcnl36829" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, vcnl36829_id_table);
+
+static const struct of_device_id vcnl36829_of_match[] = {
+	{ .compatible = "vishay,vcnl36829" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, vcnl36829_of_match);
+
+static struct i2c_driver vcnl36829_driver = {
+	.probe = vcnl36829_probe,
+	.id_table = vcnl36829_id_table,
+	.driver = {
+		.name = "vcnl36829",
+		.of_match_table = vcnl36829_of_match,
+	},
+};
+module_i2c_driver(vcnl36829_driver);
+
+MODULE_DESCRIPTION("Vishay VCNL36829 proximity sensor driver");
+MODULE_AUTHOR("Liu Yufei <lyf98405@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.53.0

