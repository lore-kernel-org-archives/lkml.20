Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183FF27727
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 00:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788307530; cv=none; b=rLizYVUYOrISIZhtQ6vJEOI8XfRNl8JTt/qWMm8Ljvs/ysOdryN5Yp8w0KI4/ee8IFsXX3icaSawL3xfLYqrBoHhta092SWKGjr2X9djpRB39GKOaKQ2ZcFwNS3x3LMPsRIx6bFbUTOEHuANsXfGwyXnum093O3a8KvTTzq7aio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788307530; c=relaxed/simple;
	bh=RHs1cFzTqtMOvyEwczN/0hXzf2q07wTk8OGqCN2q6wA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VGQDtZLQLDm/oGcVD8e1ukA59BD5fSAu4I0rliiAg1UbhDk8/1JA1bBQKIJUT8L1KU/yGjrKuFv3uBDfHdf0XM80zLqjBfdgFCgWIfZAqboGoWTgGPhQRuOacTLy2X6574Ew10NAYuWdsM6skeoqeIAH9l084l3SOEIWXsChfkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBwv69AI; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBwv69AI"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66c7127a73dso501456d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 17:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788307526; x=1788912326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60FniGu0YeDD2XFMKZZKGPkmu1o7idVEgKenLoVX+30=;
        b=TBwv69AIKhlEcmUJy5rnQo1kiVF9QJdO33YBbbrktuICOYtpjwnGmj9Zz6N52JgTuY
         8EvIAehjCTzj6FqYBunml3hcls6JnW4JaZRWqBf33rnvvBGXvQe9mP5GYSThZyZ85jsy
         a0Hl9rljLzqJO6YD5iVaVmSK2YkjJF//E4p5eXs7YixtUnkCwMmaxi+iHDcD1wcYfZQj
         ZCEW9pv+vXttCbbuVeF2KVdUlW22FTViS9UKeMRGWnLlKAwBwELL92t7IYs/kNUHEwuy
         /tOT2v31TSg+vUGzMaTN2/QC79WEnct+wY1chVFivilafk58205e2k2ZNqTRWj9ly5wZ
         jRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788307526; x=1788912326;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=60FniGu0YeDD2XFMKZZKGPkmu1o7idVEgKenLoVX+30=;
        b=oFCsJZNHqHyn9IuSqOEHIg2QsWvfQGgglpVHAaOIERxL5lrfe0oBxDUqW12P/3yJYm
         2IhlG+yFPwm3vAK5lzez/4i7gT2rcfymImNY+XSFd2d0UXzN86I9v4mKVPLwZQvdC9d6
         qmjtSeRKLsvWvguFJMX0m0XOzMAvL4lqy7APPGrdHkCT+W0sN9O4lDHmJHyH0R5aCyNf
         OjI56sSfHJ21kB34A8sx9aSIBgzatUvvgoIXEQ/d/H86syLZBZueP1t4PKDWRbehR9W8
         F76smc3LVOz1TFSh3r8BNrKuX6iuw5vV0c8rmcunGTuUSzMpQjwsxWvopYbZa9+8ViTQ
         GZIA==
X-Forwarded-Encrypted: i=1; AKwUvBzKbiZGJ2JXBUTran1fH+7WJgczjzdnDptC670oJ+8jvOeFFSxO2TMv5H0D//MirzyipL1/BZ6jsa7ofos=@vger.kernel.org
X-Gm-Message-State: AFuF++lkrGWBjuytXl0tcxVC1owip3KZITIO9LNy69HmrH2tzfSsMrCS
	zDbkpiP+f39qNI+byOTn5tT+i58VgY0HtgPq64utLij9lSkfvuwREMjO
X-Gm-Gg: AYBFou0r2K7ACtR1GbChBzkli5t+UfnU74GEC0qb4BewZmAf3zW1PldCopQIgQv2D0p
	ht3fkZpqAmhqUA1dbMeS7RmsIvhVCJGOEof16wB4oDXAK8A1G5pQG+0/32aSmzi59HNeMd8MAv7
	bEQJKQ6DiUT6rk6EBO3Z8ocvkcyi2vcWOuUtlBL0mqAvjiJA0go0joQiAgs6h+akcPpHEr9SGHC
	/ufACfQYCSCLfremDZtIp5tNWCJQJPNdCzIIqD4wRlOzqYS9QIrb3zNFe8rLpzkyVv4kSVFsaP/
	olF2dgE6dadG3YwjET6oHHPWml6rEBcxBIUgtG3Ecit9QIicDu0RtBSG7Dgqu+blhB77USbsCWr
	urY3d3Zs7HR4+J8G4OHAbCqQmKVp1xOrtu0/E4fj4OCBEG6/t1lprZ/w7njSRntNysfhfpzoi+m
	EK3AA/xPxgGk+GYk3batxDfRGvV6huJQ9rq5vw+txJW1PYN/Ier/TGm071TIYDt8o=
X-Received: by 2002:a05:690e:124e:b0:669:647a:f63f with SMTP id 956f58d0204a3-66f9be62862mr311768d50.40.1788307525843;
        Tue, 01 Sep 2026 17:05:25 -0700 (PDT)
Received: from nixos-minipc ([2803:9810:b675:f600:d8dd:403d:79c3:67d5])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f986afd80sm720415d50.20.2026.09.01.17.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 17:05:25 -0700 (PDT)
From: =?UTF-8?q?Sebasti=C3=A1n=20Peyrott?= <speyrott@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] hwmon: Add Minisforum UM780 XTX EC monitoring and fan control
Date: Tue,  1 Sep 2026 21:05:09 -0300
Message-ID: <20260902000509.191115-1-speyrott@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a DMI-gated hwmon driver for the embedded controller used by the
Minisforum UM780 XTX with board revision 1.1 and BIOS 1.06.

Expose the CPU and system fan control temperatures and tachometers. The
tachometer protocol returns one byte per OEM command, so serialize
transactions and use high-low-high sampling to reject torn values.

Allow selecting either complete OEM CPU fan profile through pwm1_enable and
changing the two validated system fan transition temperatures through
standard automatic-curve attributes. Cache coherent settings and restore
them after the firmware reloads defaults following resume.

Signed-off-by: Sebastián Peyrott <speyrott@gmail.com>
---
Changes in v4:
- depend directly on ACPI_EC to prevent undefined ACPI EC references when
  that support is disabled;
- send the single patch without a separate cover letter.

Tested on the target system with concurrent RPM reads, OEM profile changes,
system-fan threshold changes, unload/reload stress, and s2idle resume. The
settings were correct from the first userspace sample after resume and
remained stable for 15 seconds. The 0-day i386 randconfig that exposed the
missing dependency also builds successfully with this revision.

OpenAI Codex assisted with reverse-engineering review, code editing, test
orchestration, and patch and email preparation across a long interactive
session. I reviewed every change, ran the live tests on the target hardware,
and take responsibility for the submission.

Link: https://lore.kernel.org/r/20260825184107.355980-1-speyrott@gmail.com

 Documentation/hwmon/index.rst               |   1 +
 Documentation/hwmon/minisforum-um780xtx.rst |  68 +++
 MAINTAINERS                                 |   7 +
 drivers/hwmon/Kconfig                       |  16 +
 drivers/hwmon/Makefile                      |   1 +
 drivers/hwmon/minisforum-um780xtx.c         | 501 ++++++++++++++++++++
 6 files changed, 594 insertions(+)
 create mode 100644 Documentation/hwmon/minisforum-um780xtx.rst
 create mode 100644 drivers/hwmon/minisforum-um780xtx.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index d979e6d6e9f2..c98cad395455 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -186,6 +186,7 @@ Hardware Monitoring Kernel Drivers
    mcp3021
    mcp9982
    menf21bmc
+   minisforum-um780xtx
    mlxreg-fan
    mp2856
    mp2869
diff --git a/Documentation/hwmon/minisforum-um780xtx.rst b/Documentation/hwmon/minisforum-um780xtx.rst
new file mode 100644
index 000000000000..8237d525a9c7
--- /dev/null
+++ b/Documentation/hwmon/minisforum-um780xtx.rst
@@ -0,0 +1,68 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+====================================
+Kernel driver minisforum-um780xtx
+====================================
+
+Supported systems:
+
+  * Minisforum UM780 XTX
+
+    * DMI product name: ``Venus series``
+    * Mainboard: ``F7BSD``, revision ``1.1``
+    * BIOS version: ``1.06``
+
+Author: Sebastián Peyrott <speyrott@gmail.com>
+
+Description
+-----------
+
+This driver exposes hardware monitoring and fan-control data cached by the
+IT5571E embedded controller. It uses the ACPI EC transport and only binds to
+the exact system and firmware identity listed above.
+
+The two temperature channels are the values used by the EC's fan-control
+loops. Their physical sensor placement is not known. The CPU channel is the
+filtered AMD SB-TSI temperature, while the system channel is an external
+thermistor input.
+
+The fan tachometers are read through OEM EC commands. Since each byte is
+returned by a separate command, the driver uses a high-low-high sequence and
+retries if the high byte changes.
+
+Sysfs entries
+-------------
+
+==========================  ==============================================
+``temp1_input``             CPU-fan control temperature
+``temp2_input``             System-fan control temperature
+``fan1_input``              CPU fan speed in RPM
+``fan2_input``              System fan speed in RPM
+``pwm1_enable``             CPU profile: 2 is OEM B1, 3 is OEM B2
+``pwm2_auto_point1_temp``   Off-to-low system-fan transition temperature
+``pwm2_auto_point2_temp``   Low-to-high system-fan transition temperature
+==========================  ==============================================
+
+CPU fan profiles
+----------------
+
+Values 2 and 3 of ``pwm1_enable`` select the two complete automatic profiles
+implemented by the firmware. Writing either value reloads the whole CPU fan
+curve, including firmware state which is not visible through the ACPI EC
+window. Other values are rejected.
+
+System fan thresholds
+---------------------
+
+The two writable system-fan temperatures are rounded to whole degrees Celsius
+and clamped to preserve strict ordering between both visible thresholds and
+the firmware's internal third threshold. The third threshold does not select
+a new PWM target and is therefore not exposed as another auto point.
+
+Resume state preservation
+-------------------------
+
+Fan settings are held in EC RAM. On the supported firmware, initialization
+during s2idle resume reloads the factory system-fan curve. The driver retains
+the last coherent CPU profile and system-fan thresholds selected through its
+interface and restores them synchronously at resume.
diff --git a/MAINTAINERS b/MAINTAINERS
index 6156e48e1816..f60ea9c6cfe7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18012,6 +18012,13 @@ F:	include/linux/min_heap.h
 F:	lib/min_heap.c
 F:	lib/tests/min_heap_kunit.c
 
+MINISFORUM UM780 XTX EC HARDWARE MONITOR DRIVER
+M:	Sebastián Peyrott <speyrott@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/minisforum-um780xtx.rst
+F:	drivers/hwmon/minisforum-um780xtx.c
+
 MIPI CCS, SMIA AND SMIA++ IMAGE SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 81a9a1d40eec..06e730ee9f6e 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1490,6 +1490,22 @@ config SENSORS_MENF21BMC_HWMON
 	  This driver can also be built as a module. If so the module
 	  will be called menf21bmc_hwmon.
 
+config SENSORS_MINISFORUM_UM780XTX
+	tristate "Minisforum UM780 XTX EC hardware monitoring"
+	depends on ACPI_EC && DMI && X86
+	help
+	  If you say yes here you get support for the hardware monitoring
+	  features of the embedded controller in the Minisforum UM780 XTX.
+	  This includes CPU and system fan speeds, their control temperatures,
+	  two CPU fan profiles, system fan temperature thresholds, and
+	  preservation of the selected settings across suspend and resume.
+
+	  This driver only binds to explicitly supported board and firmware
+	  versions.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called minisforum-um780xtx.
+
 config SENSORS_MR75203
 	tristate "Moortec Semiconductor MR75203 PVT Controller"
 	select REGMAP_MMIO
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 0cad7e21634c..a690f5f97ffc 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -180,6 +180,7 @@ obj-$(CONFIG_SENSORS_TC654)	+= tc654.o
 obj-$(CONFIG_SENSORS_TPS23861)	+= tps23861.o
 obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
 obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
+obj-$(CONFIG_SENSORS_MINISFORUM_UM780XTX) += minisforum-um780xtx.o
 obj-$(CONFIG_SENSORS_MR75203)	+= mr75203.o
 obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
 obj-$(CONFIG_SENSORS_NCT6694)	+= nct6694-hwmon.o
diff --git a/drivers/hwmon/minisforum-um780xtx.c b/drivers/hwmon/minisforum-um780xtx.c
new file mode 100644
index 000000000000..f5d6e18cb651
--- /dev/null
+++ b/drivers/hwmon/minisforum-um780xtx.c
@@ -0,0 +1,501 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Minisforum UM780 XTX (F7BSD) embedded-controller hwmon driver.
+ *
+ * Copyright (C) 2026 Sebastián Peyrott <speyrott@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/cleanup.h>
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#define UM780XTX_EC_TEMP_SYS	0x05
+#define UM780XTX_EC_TEMP_CPU	0x09
+#define UM780XTX_EC_CPU_PROFILE	0x2f
+#define UM780XTX_EC_SYS_POINT1	0x31
+#define UM780XTX_EC_SYS_POINT2	0x34
+#define UM780XTX_EC_SYS_POINT3	0x37
+
+#define UM780XTX_EC_PROFILE_B1	0xb1
+#define UM780XTX_EC_PROFILE_B2	0xb2
+
+#define UM780XTX_EC_FAN1_LO	0xb6
+#define UM780XTX_EC_FAN1_HI	0xb7
+#define UM780XTX_EC_FAN2_LO	0xb9
+#define UM780XTX_EC_FAN2_HI	0xba
+
+#define UM780XTX_EC_MAX_RPM	9000
+#define UM780XTX_EC_RPM_RETRIES	3
+
+static struct platform_device *um780xtx_pdev;
+
+struct um780xtx_data {
+	struct device *hwmon_dev;
+	u8 saved_profile;
+	u8 saved_sys_point1;
+	u8 saved_sys_point2;
+	u8 sys_point3;
+};
+
+static const struct dmi_system_id um780xtx_dmi_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR,
+					"Micro Computer (HK) Tech Limited"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Venus series"),
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR,
+					"Shenzhen Meigao Electronic Equipment Co.,Ltd"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "F7BSD"),
+		},
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, um780xtx_dmi_table);
+
+static bool um780xtx_firmware_match(void)
+{
+	const char *board_version = dmi_get_system_info(DMI_BOARD_VERSION);
+	const char *bios_version = dmi_get_system_info(DMI_BIOS_VERSION);
+
+	return board_version && bios_version &&
+		!strcmp(board_version, "1.1") && !strcmp(bios_version, "1.06");
+}
+
+static int um780xtx_oem_read(u8 command, u8 *value)
+{
+	return ec_transaction(command, NULL, 0, value, 1);
+}
+
+static int um780xtx_read_rpm(u8 command_hi, u8 command_lo, long *rpm)
+{
+	u8 hi_before;
+	u8 hi_after;
+	u8 lo;
+	unsigned int value;
+	int attempt;
+	int ret;
+
+	for (attempt = 0; attempt < UM780XTX_EC_RPM_RETRIES; attempt++) {
+		ret = um780xtx_oem_read(command_hi, &hi_before);
+		if (ret)
+			return ret;
+		ret = um780xtx_oem_read(command_lo, &lo);
+		if (ret)
+			return ret;
+		ret = um780xtx_oem_read(command_hi, &hi_after);
+		if (ret)
+			return ret;
+		if (hi_before != hi_after)
+			continue;
+
+		value = (hi_after << 8) | lo;
+		if (value > UM780XTX_EC_MAX_RPM)
+			continue;
+
+		*rpm = value;
+		return 0;
+	}
+
+	return -EIO;
+}
+
+static int um780xtx_read_profile(long *mode)
+{
+	u8 profile;
+	int ret;
+
+	ret = ec_read(UM780XTX_EC_CPU_PROFILE, &profile);
+	if (ret)
+		return ret;
+	if (profile == UM780XTX_EC_PROFILE_B1) {
+		*mode = 2;
+		return 0;
+	}
+	if (profile == UM780XTX_EC_PROFILE_B2) {
+		*mode = 3;
+		return 0;
+	}
+
+	return -ENODATA;
+}
+
+static int um780xtx_write_profile(struct um780xtx_data *data, long mode)
+{
+	u8 expected;
+	u8 profile;
+	int ret;
+
+	if (mode != 2 && mode != 3)
+		return -EINVAL;
+	expected = mode == 2 ? UM780XTX_EC_PROFILE_B1 : UM780XTX_EC_PROFILE_B2;
+
+	ret = ec_transaction(expected, NULL, 0, NULL, 0);
+	if (ret)
+		return ret;
+	ret = ec_read(UM780XTX_EC_CPU_PROFILE, &profile);
+	if (ret)
+		return ret;
+	if (profile != expected)
+		return -EIO;
+
+	data->saved_profile = profile;
+	return 0;
+}
+
+static const u8 um780xtx_sys_point_offsets[] = {
+	UM780XTX_EC_SYS_POINT1,
+	UM780XTX_EC_SYS_POINT2,
+};
+
+static ssize_t um780xtx_sys_point_temp_show(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf)
+{
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+	u8 value;
+	int ret;
+
+	guard(hwmon_lock)(dev);
+	ret = ec_read(um780xtx_sys_point_offsets[sattr->index], &value);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", value * 1000);
+}
+
+static ssize_t um780xtx_sys_point_temp_store(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t count)
+{
+	struct um780xtx_data *data = dev_get_drvdata(dev);
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+	u8 points[2];
+	u8 readback;
+	long value;
+	int ret;
+
+	ret = kstrtol(buf, 10, &value);
+	if (ret)
+		return ret;
+
+	guard(hwmon_lock)(dev);
+	/* Validate and clamp against the live peer threshold. */
+	ret = ec_read(UM780XTX_EC_SYS_POINT1, &points[0]);
+	if (ret)
+		return ret;
+	ret = ec_read(UM780XTX_EC_SYS_POINT2, &points[1]);
+	if (ret)
+		return ret;
+	if (points[0] >= points[1] || points[1] >= data->sys_point3)
+		return -EIO;
+
+	value = DIV_ROUND_CLOSEST(value, 1000);
+	if (!sattr->index)
+		value = clamp_val(value, 0, points[1] - 1);
+	else
+		value = clamp_val(value, points[0] + 1,
+				  data->sys_point3 - 1);
+	points[sattr->index] = value;
+
+	ret = ec_write(um780xtx_sys_point_offsets[sattr->index],
+		       points[sattr->index]);
+	if (ret)
+		return ret;
+	ret = ec_read(um780xtx_sys_point_offsets[sattr->index], &readback);
+	if (ret)
+		return ret;
+	if (readback != points[sattr->index])
+		return -EIO;
+
+	data->saved_sys_point1 = points[0];
+	data->saved_sys_point2 = points[1];
+	return count;
+}
+
+static SENSOR_DEVICE_ATTR_RW(pwm2_auto_point1_temp,
+			     um780xtx_sys_point_temp, 0);
+static SENSOR_DEVICE_ATTR_RW(pwm2_auto_point2_temp,
+			     um780xtx_sys_point_temp, 1);
+
+static struct attribute *um780xtx_extra_attrs[] = {
+	&sensor_dev_attr_pwm2_auto_point1_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point2_temp.dev_attr.attr,
+	NULL
+};
+
+static const struct attribute_group um780xtx_extra_group = {
+	.attrs = um780xtx_extra_attrs,
+};
+
+static const struct attribute_group *um780xtx_extra_groups[] = {
+	&um780xtx_extra_group,
+	NULL
+};
+
+static umode_t um780xtx_is_visible(const void *data,
+				   enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	if (type == hwmon_temp || type == hwmon_fan)
+		return 0444;
+	if (type == hwmon_pwm && attr == hwmon_pwm_enable)
+		return 0644;
+	return 0;
+}
+
+static int um780xtx_read(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long *value)
+{
+	u8 raw;
+	int ret;
+
+	if (type == hwmon_temp) {
+		ret = ec_read(channel ? UM780XTX_EC_TEMP_SYS :
+			      UM780XTX_EC_TEMP_CPU, &raw);
+		if (ret)
+			return ret;
+		*value = raw * 1000L;
+		return 0;
+	}
+	if (type == hwmon_fan) {
+		if (!channel)
+			ret = um780xtx_read_rpm(UM780XTX_EC_FAN1_HI,
+						UM780XTX_EC_FAN1_LO, value);
+		else
+			ret = um780xtx_read_rpm(UM780XTX_EC_FAN2_HI,
+						UM780XTX_EC_FAN2_LO, value);
+		return ret;
+	}
+	if (type == hwmon_pwm)
+		return um780xtx_read_profile(value);
+
+	return -EOPNOTSUPP;
+}
+
+static int um780xtx_write(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int channel, long value)
+{
+	struct um780xtx_data *data = dev_get_drvdata(dev);
+
+	if (type == hwmon_pwm && attr == hwmon_pwm_enable)
+		return um780xtx_write_profile(data, value);
+
+	return -EOPNOTSUPP;
+}
+
+static int um780xtx_read_string(struct device *dev,
+				enum hwmon_sensor_types type,
+				u32 attr, int channel, const char **str)
+{
+	static const char * const labels[] = { "CPU", "SYS" };
+
+	if (type == hwmon_temp && attr == hwmon_temp_label)
+		*str = labels[channel];
+	else if (type == hwmon_fan && attr == hwmon_fan_label)
+		*str = labels[channel];
+	else
+		return -EOPNOTSUPP;
+	return 0;
+}
+
+static const struct hwmon_ops um780xtx_hwmon_ops = {
+	.is_visible = um780xtx_is_visible,
+	.read = um780xtx_read,
+	.write = um780xtx_write,
+	.read_string = um780xtx_read_string,
+};
+
+static const struct hwmon_channel_info * const um780xtx_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
+	NULL
+};
+
+static const struct hwmon_chip_info um780xtx_chip_info = {
+	.ops = &um780xtx_hwmon_ops,
+	.info = um780xtx_info,
+};
+
+static int um780xtx_write_sys_point(u8 offset, u8 value)
+{
+	u8 readback;
+	int ret;
+
+	ret = ec_write(offset, value);
+	if (ret)
+		return ret;
+	ret = ec_read(offset, &readback);
+	if (ret)
+		return ret;
+
+	return readback == value ? 0 : -EIO;
+}
+
+static int um780xtx_restore_sys_points(struct um780xtx_data *data,
+				       u8 current_point2)
+{
+	u8 point1 = data->saved_sys_point1;
+	u8 point2 = data->saved_sys_point2;
+	int ret;
+
+	/* Keep strict ordering valid after each individual EC write. */
+	if (point1 >= current_point2) {
+		ret = um780xtx_write_sys_point(UM780XTX_EC_SYS_POINT2, point2);
+		if (ret)
+			return ret;
+		return um780xtx_write_sys_point(UM780XTX_EC_SYS_POINT1,
+						 point1);
+	}
+
+	ret = um780xtx_write_sys_point(UM780XTX_EC_SYS_POINT1, point1);
+	if (ret)
+		return ret;
+	return um780xtx_write_sys_point(UM780XTX_EC_SYS_POINT2, point2);
+}
+
+static int um780xtx_read_initial_state(struct um780xtx_data *data)
+{
+	u8 profile;
+	u8 point1;
+	u8 point2;
+	int ret;
+
+	ret = ec_read(UM780XTX_EC_CPU_PROFILE, &profile);
+	if (ret)
+		return ret;
+	if (profile != UM780XTX_EC_PROFILE_B1 &&
+	    profile != UM780XTX_EC_PROFILE_B2)
+		return -EINVAL;
+
+	ret = ec_read(UM780XTX_EC_SYS_POINT1, &point1);
+	if (ret)
+		return ret;
+	ret = ec_read(UM780XTX_EC_SYS_POINT2, &point2);
+	if (ret)
+		return ret;
+	if (point1 >= point2 || point2 >= data->sys_point3)
+		return -EINVAL;
+
+	data->saved_profile = profile;
+	data->saved_sys_point1 = point1;
+	data->saved_sys_point2 = point2;
+	return 0;
+}
+
+static int um780xtx_restore_state(struct um780xtx_data *data)
+{
+	u8 readback;
+	u8 point2;
+	int ret;
+
+	ret = ec_transaction(data->saved_profile, NULL, 0, NULL, 0);
+	if (ret)
+		return ret;
+	ret = ec_read(UM780XTX_EC_CPU_PROFILE, &readback);
+	if (ret)
+		return ret;
+	if (readback != data->saved_profile)
+		return -EIO;
+
+	ret = ec_read(UM780XTX_EC_SYS_POINT2, &point2);
+	if (ret)
+		return ret;
+
+	return um780xtx_restore_sys_points(data, point2);
+}
+
+static int um780xtx_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct um780xtx_data *data;
+	struct device *hwmon;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, data);
+
+	ret = ec_read(UM780XTX_EC_SYS_POINT3, &data->sys_point3);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read system fan limit\n");
+	ret = um780xtx_read_initial_state(data);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read initial fan settings\n");
+
+	hwmon = devm_hwmon_device_register_with_info(dev, "um780xtx_ec", data,
+						     &um780xtx_chip_info,
+						     um780xtx_extra_groups);
+	if (IS_ERR(hwmon))
+		return PTR_ERR(hwmon);
+	data->hwmon_dev = hwmon;
+
+	return 0;
+}
+
+static int um780xtx_resume(struct device *dev)
+{
+	struct um780xtx_data *data = dev_get_drvdata(dev);
+
+	guard(hwmon_lock)(data->hwmon_dev);
+	return um780xtx_restore_state(data);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(um780xtx_pm_ops, NULL, um780xtx_resume);
+
+static struct platform_driver um780xtx_driver = {
+	.driver = {
+		.name = "um780xtx-ec-hwmon",
+		.pm = pm_sleep_ptr(&um780xtx_pm_ops),
+	},
+	.probe = um780xtx_probe,
+};
+
+static int __init um780xtx_init(void)
+{
+	int ret;
+
+	if (!dmi_check_system(um780xtx_dmi_table) ||
+	    !um780xtx_firmware_match() || !ec_get_handle())
+		return -ENODEV;
+	ret = platform_driver_register(&um780xtx_driver);
+	if (ret)
+		return ret;
+
+	um780xtx_pdev = platform_device_register_simple("um780xtx-ec-hwmon",
+							PLATFORM_DEVID_NONE,
+						       NULL, 0);
+	if (IS_ERR(um780xtx_pdev)) {
+		ret = PTR_ERR(um780xtx_pdev);
+		platform_driver_unregister(&um780xtx_driver);
+		return ret;
+	}
+	return 0;
+}
+
+static void __exit um780xtx_exit(void)
+{
+	platform_device_unregister(um780xtx_pdev);
+	platform_driver_unregister(&um780xtx_driver);
+}
+
+module_init(um780xtx_init);
+module_exit(um780xtx_exit);
+
+MODULE_AUTHOR("Sebastián Peyrott <speyrott@gmail.com>");
+MODULE_DESCRIPTION("Minisforum UM780 XTX EC hwmon driver");
+MODULE_LICENSE("GPL");

base-commit: 75f2c0b3690702c90863c2e138cb5520670845ea
-- 
2.54.0
