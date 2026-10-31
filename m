Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793468820;
	b=JVKFj+2fIvzNiZE3MXbBKzLV4cnq+4xqwNo0D0XpcbBDFNh0ykHN83WHEMpNyvZVb3Fl
	 jl6EvpzmaO5kbPbrUVS0ozmxLP1k1dSydpiot2fyr7U/qy1pT1NuXtCM5TSxPFT+xQqxv
	 MtWZ2X9jlxltifvk0vmmMEy/nOxu03d4yhgbqzWkoZilW/ixvFev+nszrshQeY0GJodFb
	 /9p7J/853/11rG6L0uGYGW1nYJQH/C4+14sUkBRF6Qo94MzyGltl5oA+LNGRHwiM7lBxO
	 pfoyEiSU8e/b3r1h4v7r7NsI2WgeBcU2ag8+Ok+wZOEAk7WAKpY52JNvqBF31P3gKIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793468820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R28DQO/6JotghrXwsPG7S/gWS1AxIABuyk+yKRwzDrQ=;
	b=uI0XSDMhJwrWs74FRWqQ9FVSh0Eq9sYqIihZLjxZNIcM9YCgJlqIFmsFjWieBqtNtWG2
	 LbZ2T88oJZs3H9H4OfFk/MMzM167vyD2+xiV3I59GxVrsytVnUi064nhNwC1L9h5rDkpP
	 eukLYf2qW+6h6l5rFcnLh5/VW1LBv4241IiZ7BK4kprBbhMqVQ0x5Wx2HDv3Eay75DWmF
	 w+dXwL7V2BAOkELerH2zSFcDeeazRzUWoduVaYrRgTSP9hzHnXLZnOKWK6/IPRz/Cbv5A
	 aPgn37TyBWI0UVLyXSgIM1YUxpvSibIfVXnm+shdwzH8jxhpLzxLvdnwkXQyDwWj1+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SEuGtKWA;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860B2606A320
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 860B2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SEuGtKWA
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so1698305eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793468819; x=1794073619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R28DQO/6JotghrXwsPG7S/gWS1AxIABuyk+yKRwzDrQ=;
        b=SEuGtKWA9JjAu5lqh7nAjglIh5Ku7F8U4o8+tioxcGOGdWGrztlez6W3Cl4YCj4sWm
         mflvLZrUoJ9gv5U8VrjOVBr7P688xSsTmyK80w2Vxun8HsIunWc6Egn/9G12+bQQAqWL
         Ln2uDbphE/OVyBW5CisHMmMPTjT89EO+GIFFzpNTbg0MOvNy2aQMgmG3NTLP40P79N8b
         m3Ggb2O6Y+DsmqrR/sP+kiX0flI9Qe/8nvhluBV7sotyuUQLyK4MsWFF0aacaHuifmcX
         bsS4vkYICNqgjTyMikyxXIwPVRKwDLR8Mf2loGAO7Fw7a1hdkH3Ca6RTSf2uHWR7JHkB
         U/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793468819; x=1794073619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R28DQO/6JotghrXwsPG7S/gWS1AxIABuyk+yKRwzDrQ=;
        b=rbBBrNDZ3X9V1MRejTOO/HJF9mwPsjAL7nkehTApe+cgn7uH0Cy+wWAUei/7YLxm9F
         pKtB0F9PcB5UzNqkkif9DKqvw35pURY+boNL9pn5my/mA0rpMjUPn/R0ZG6KA9L5e1e2
         dOB9Q2bZz3K6awZ0JMmFJMOBt7iP6mJ/V+5G12KEGweAA5bXkNqHoMjWY21aeLaeE330
         wUmRSGFSdrWegc3a/pvLecMZmaDHAcQmxcc+jx/cABrqaeTzb+UE//Fv7N14qifdVyyo
         5pT/dXVR4UOYFSfMFfiSSeIaXjq2x8F56o+9puf7+rnBvXlO+CSYYHPq95OP7Qx/TB8z
         Stdg==
X-Forwarded-Encrypted: i=1; AKwUvBy+ZG44djul6lMQw5HO+RpSTmm4lxN3yXNYJb9/slj+wcbchsW5phZk/JHWTukCXt/ZmNLxYpJ+iPMmuqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxJK/l+fSnUln0nzKPy8mE9GY3omh5cu7e3FdVGZNdoZcVlYg5
	G/QStQzmR6iLjLpVLObyHbjnRJW7RmaOXJ5M1HMsIXQeyj7SlqjHhlv8
X-Gm-Gg: AYBFou1bBO99AZwc+Kco4fV3QzcpPTYXyO+pDU4EeYFojr04AQDktZav95MRlqBnnjt
	zLWG1y2Yc7LH9CwTqNoMrQ6QenWZqWiApGnUDmwK8bOuOrNpldIpN20zM8GhJydau/tEeUvfLrb
	+yL+VymFI/S8fGYZJ9Bgw19tvh4MppUsblwYe3WfnIMk7NEM/rKbHDOjPWjShGoTEJdw9MKjv7+
	rIAXQhdEYrDPiI0b/I6lVqeBd3Qz1CjBOUZqv/suyQKOJ/QQIbMCA5NauHVvQc/sL6jy9QZAHUA
	RLy6KOGEEBztxlQaplGLXJwRXe1EMeqd0Wpg4NLzQj8i9kVktWTgRMxFegqOdhw0aX7iggLV1+3
	VhUDmvLlutTbOfKIWzRo2rFhI62B6EqzCskgoddckSRxaeRrW36QzhrXJQF9kePOnsTYv7Z91op
	oRCXZZJ4QyZ0JyzcZNcmaEnFiJYka7VFozHAR+gMjDfwlRiDxJjCTGdQR1vpUh2aLCIXVX2XvjU
	sza5UL+tGPE0ichDc+ViGX5400OiresLDFRYZ4tg3bN5U4c+zsL0cCdvhb5ZLr4vLBvYH9MEkuU
	9qEombKYUofw7mX3EQ+heVOQSb/a17xOsAb8GNZtqrZPqAveBfPZbk9lJFBBjARDruVKUL44RQ+
	MxMd4SOO/tgdykMg683pwK5KSsn+R388wpdimrgJGh0+ucUS5kuJtWhY6ayQn+Yd2KnsUa+hB3U
	PnQ+Tzf+77dSaFQimFilKh7GvxgUbPdS6EsJ15hCM=
X-Received: by 2002:a05:7301:7d1a:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-36a42340bd5mr7652524eec.9.1793468818262;
        Sat, 31 Oct 2026 10:46:58 -0700 (PDT)
Received: from seppy ([2600:8800:206:8e00::7c29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm19901685eec.7.2026.10.31.10.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 10:46:57 -0700 (PDT)
From: Ethan Jimmy <duhxu0@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Jimmy <duhxu0@gmail.com>
Subject: [PATCH v3] hwmon: (acer-aspire14-ec) Add driver for Acer Aspire 14 52MT and 52M fan
Date: Sat, 31 Oct 2026 10:46:51 -0700
Message-ID: <20261031174651.856627-1-duhxu0@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <388aa474-3606-4c7f-b073-224d5e0880fd@roeck-us.net>
References: <388aa474-3606-4c7f-b073-224d5e0880fd@roeck-us.net>
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

The Aspire A14-52M and A14-52MT expose fan speed through an I2C HID
embedded controller that also serves the keyboard. The same product id
is used by other Acer keyboards, so the driver binds only when DMI
matches these two models.

Signed-off-by: Ethan Jimmy <duhxu0@gmail.com>
---
Changes in v3:
- Register with late_initcall() so a built-in driver runs after
  hid_init(). module_init() is device_initcall(), and drivers/hwmon/
  is linked before drivers/hid/, so hid_register_driver() returned
  -EINVAL when the DMI table matched.

Changes in v2:
- Removed mutex.
- Probe returns the error when the fan report is missing, an
  allocation fails, or hwmon registration fails, and stops the HID
  device.
- Remove type/attr/channel checks in read() and is_visible().
  is_visible() always returns 0444.
- Reject a SET_REPORT whose transferred length is not the feature
  report length.

On the Aspire A14-52M and A14-52MT, hid_hw_start() is called with 
HID_CONNECT_DEFAULT | HID_CONNECT_DRIVER, so the HID keyboard stays connected. 
Other machines with product id 0x174b do not match the DMI table and stay with
hid-generic.

v2: https://lore.kernel.org/linux-hwmon/20261030210037.921646-1-duhxu0@gmail.com/
v1: https://lore.kernel.org/linux-hwmon/20261010041313.34153-1-duhxu0@gmail.com/

 Documentation/hwmon/acer-aspire14-ec.rst |  38 ++++
 Documentation/hwmon/index.rst            |   1 +
 MAINTAINERS                              |   8 +
 drivers/hwmon/Kconfig                    |  20 ++
 drivers/hwmon/Makefile                   |   1 +
 drivers/hwmon/acer-aspire14-ec.c         | 255 +++++++++++++++++++++++
 6 files changed, 323 insertions(+)
 create mode 100644 Documentation/hwmon/acer-aspire14-ec.rst
 create mode 100644 drivers/hwmon/acer-aspire14-ec.c

diff --git a/Documentation/hwmon/acer-aspire14-ec.rst b/Documentation/hwmon/acer-aspire14-ec.rst
new file mode 100644
index 000000000000..73acfb181c39
--- /dev/null
+++ b/Documentation/hwmon/acer-aspire14-ec.rst
@@ -0,0 +1,38 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver acer-aspire14-ec
+==============================
+
+Supported chips:
+
+  * Acer Aspire 14 AI 52MT/52M embedded controller
+
+    Prefix: 'aspire14_ec'
+
+    Addresses scanned: none
+
+    Datasheet: unavailable
+
+Author: Ethan Jimmy <duhxu0@gmail.com>
+
+Description
+-----------
+
+This driver monitors the fan on the Acer Aspire 14 AI (Aspire A14-52M
+and A14-52MT). The embedded controller is an I2C HID device (vendor
+0x1025, product 0x174b) that also provides the keyboard.
+
+The device is autodetected on those models. The same product id is used
+by other Acer keyboards; those machines stay with hid-generic. On the
+Aspire A14-52M and A14-52MT this driver provides both the keyboard and
+the fan sensor.
+
+Fan speed is reported in RPM through the standard hwmon attribute
+``fan1_input``. The driver does not change fan speed.
+
+Sysfs entries
+-------------
+
+======================= ======================================================
+fan1_input		Fan speed in RPM
+======================= ======================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 199ca79621e9..9dd16e6ddabd 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -22,6 +22,7 @@ Hardware Monitoring Kernel Drivers
    abituguru
    abituguru3
    acbel-fsg032
+   acer-aspire14-ec
    acpi_power_meter
    ad7314
    adc128d818
diff --git a/MAINTAINERS b/MAINTAINERS
index 5ad12c57ca5f..b944f77c7a71 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -262,6 +262,14 @@ L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-pcie-idio-24.c
 
+ACER ASPIRE 14 AI (A14-52M, A14-52MT) EC FAN DRIVER
+M:	Ethan Jimmy <duhxu0@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/acer-aspire14-ec.rst
+F:	drivers/hwmon/acer-aspire14-ec.c
+
 ACER ASPIRE ONE TEMPERATURE AND FAN DRIVER
 M:	Peter Kaestle <peter@piie.net>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 18c682e1a475..84e9e9c115a1 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -67,6 +67,26 @@ config SENSORS_ABITUGURU3
 	  This driver can also be built as a module. If so, the module
 	  will be called abituguru3.
 
+config SENSORS_ACER_ASPIRE14_EC
+	tristate "Acer Aspire 14 AI EC fan sensor"
+	depends on HID
+	depends on X86 || COMPILE_TEST
+	depends on DMI || COMPILE_TEST
+	depends on I2C_HID_ACPI || I2C_HID_OF || COMPILE_TEST
+	help
+	  If you say yes here you get support for reading the fan
+	  speed from the embedded controller on the Acer Aspire 14 AI
+	  (Aspire A14-52M and A14-52MT). The controller is an I2C HID
+	  device (vendor 0x1025, product 0x174b) that also provides the
+	  keyboard. Fan speed is read-only.
+
+	  The same product id is used by other Acer keyboards. This driver
+	  registers only on the Aspire A14-52M and A14-52MT, where it also
+	  provides the keyboard. Other machines stay with hid-generic.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called acer-aspire14-ec.
+
 config SENSORS_SMPRO
 	tristate "Ampere's Altra SMpro hardware monitoring driver"
 	depends on MFD_SMPRO
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d4c345ed7261..ac5cec462c81 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_SENSORS_W83791D)	+= w83791d.o
 
 obj-$(CONFIG_SENSORS_ABITUGURU)	+= abituguru.o
 obj-$(CONFIG_SENSORS_ABITUGURU3)+= abituguru3.o
+obj-$(CONFIG_SENSORS_ACER_ASPIRE14_EC) += acer-aspire14-ec.o
 obj-$(CONFIG_SENSORS_AD7314)	+= ad7314.o
 obj-$(CONFIG_SENSORS_AD7414)	+= ad7414.o
 obj-$(CONFIG_SENSORS_AD7418)	+= ad7418.o
diff --git a/drivers/hwmon/acer-aspire14-ec.c b/drivers/hwmon/acer-aspire14-ec.c
new file mode 100644
index 000000000000..58a60f1c6d4d
--- /dev/null
+++ b/drivers/hwmon/acer-aspire14-ec.c
@@ -0,0 +1,255 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hwmon driver for the Acer Aspire 14 AI embedded controller.
+ *
+ * Author: Ethan Jimmy <duhxu0@gmail.com>
+ *
+ * On the Aspire A14-52M and A14-52MT the EC is an I2C HID device
+ * (vendor 0x1025, product 0x174b) that also serves the keyboard. The same
+ * product id is used by other Acer keyboards. The HID driver is registered
+ * only when DMI matches these models, so those machines stay with hid-generic.
+ *
+ * Fan speed is read with one feature report: A0 00 A0 08 00 02 02. The
+ * reply carries a little-endian status word, command id, and RPM.
+ */
+
+#include <linux/dmi.h>
+#include <linux/hid.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/unaligned.h>
+
+#define ACER_ASPIRE14_VID 0x1025
+#define ACER_ASPIRE14_PID 0x174b
+#define ACER_ASPIRE14_REPORT_ID 0xa0
+#define ACER_ASPIRE14_PREFIX 0xa0
+#define ACER_ASPIRE14_CMD_MARK 0x02
+#define ACER_ASPIRE14_RPM_OFFSET 8
+#define ACER_ASPIRE14_MIN_REPLY (ACER_ASPIRE14_RPM_OFFSET + sizeof(u16))
+#define ACER_ASPIRE14_STATUS_OK 0xe000
+#define ACER_ASPIRE14_CMD_FAN_RPM 0x0008
+
+struct acer_aspire14_data {
+	struct hid_device *hdev;
+	struct device *hwmon_dev;
+	u8 *buf;
+	u32 report_len;
+};
+
+static int acer_aspire14_fan_rpm(struct acer_aspire14_data *data, long *val)
+{
+	u16 status, command_id;
+	int ret;
+
+	memset(data->buf, 0, data->report_len);
+	data->buf[0] = ACER_ASPIRE14_REPORT_ID;
+	data->buf[2] = ACER_ASPIRE14_PREFIX;
+	put_unaligned_le16(ACER_ASPIRE14_CMD_FAN_RPM, &data->buf[3]);
+	data->buf[5] = ACER_ASPIRE14_CMD_MARK;
+	data->buf[6] = ACER_ASPIRE14_CMD_MARK;
+
+	ret = hid_hw_raw_request(data->hdev, ACER_ASPIRE14_REPORT_ID, data->buf,
+				 data->report_len, HID_FEATURE_REPORT,
+				 HID_REQ_SET_REPORT);
+	if (ret < 0)
+		return ret;
+	if (ret != data->report_len)
+		return -EIO;
+
+	memset(data->buf, 0, data->report_len);
+	data->buf[0] = ACER_ASPIRE14_REPORT_ID;
+	ret = hid_hw_raw_request(data->hdev, ACER_ASPIRE14_REPORT_ID, data->buf,
+				 data->report_len, HID_FEATURE_REPORT,
+				 HID_REQ_GET_REPORT);
+	if (ret < 0)
+		return ret;
+	if (ret < ACER_ASPIRE14_MIN_REPLY)
+		return -EIO;
+
+	status = get_unaligned_le16(&data->buf[1]);
+	command_id = get_unaligned_le16(&data->buf[3]);
+	if (status != ACER_ASPIRE14_STATUS_OK ||
+	    command_id != ACER_ASPIRE14_CMD_FAN_RPM)
+		return -EIO;
+
+	*val = get_unaligned_le16(&data->buf[ACER_ASPIRE14_RPM_OFFSET]);
+	return 0;
+}
+
+static int acer_aspire14_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct acer_aspire14_data *data = dev_get_drvdata(dev);
+
+	return acer_aspire14_fan_rpm(data, val);
+}
+
+static umode_t acer_aspire14_is_visible(const void *drvdata,
+					enum hwmon_sensor_types type, u32 attr,
+					int channel)
+{
+	return 0444;
+}
+
+static const struct hwmon_channel_info *const acer_aspire14_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT), NULL
+};
+
+static const struct hwmon_ops acer_aspire14_ops = {
+	.is_visible = acer_aspire14_is_visible,
+	.read = acer_aspire14_read,
+};
+
+static const struct hwmon_chip_info acer_aspire14_chip_info = {
+	.ops = &acer_aspire14_ops,
+	.info = acer_aspire14_info,
+};
+
+static const struct dmi_system_id acer_aspire14_dmi_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Aspire A14-52M"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Aspire A14-52MT"),
+		},
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, acer_aspire14_dmi_table);
+
+static u32 acer_aspire14_fan_report_len(struct hid_device *hdev)
+{
+	struct hid_report *report;
+	u32 len;
+
+	report = hdev->report_enum[HID_FEATURE_REPORT]
+			 .report_id_hash[ACER_ASPIRE14_REPORT_ID];
+	if (!report)
+		return 0;
+
+	len = hid_report_len(report);
+	if (len < ACER_ASPIRE14_MIN_REPLY || len > HID_MAX_BUFFER_SIZE)
+		return 0;
+
+	return len;
+}
+
+static int acer_aspire14_probe(struct hid_device *hdev,
+			       const struct hid_device_id *id)
+{
+	struct acer_aspire14_data *data;
+	struct device *hwmon_dev;
+	long rpm;
+	u32 report_len;
+	int ret;
+
+	hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT | HID_CONNECT_DRIVER);
+	if (ret)
+		return ret;
+
+	report_len = acer_aspire14_fan_report_len(hdev);
+	if (!report_len) {
+		ret = -ENODEV;
+		goto stop;
+	}
+
+	data = devm_kzalloc(&hdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data) {
+		ret = -ENOMEM;
+		goto stop;
+	}
+
+	data->buf = devm_kzalloc(&hdev->dev, report_len, GFP_KERNEL);
+	if (!data->buf) {
+		ret = -ENOMEM;
+		goto stop;
+	}
+	data->report_len = report_len;
+
+	data->hdev = hdev;
+	hid_set_drvdata(hdev, data);
+
+	ret = acer_aspire14_fan_rpm(data, &rpm);
+	if (ret)
+		hid_dbg(hdev, "fan report failed: %d\n", ret);
+	else
+		hid_dbg(hdev, "initial fan speed %ld RPM\n", rpm);
+
+	hwmon_dev =
+		hwmon_device_register_with_info(&hdev->dev, "aspire14_ec", data,
+						&acer_aspire14_chip_info, NULL);
+	if (IS_ERR(hwmon_dev)) {
+		ret = PTR_ERR(hwmon_dev);
+		hid_warn(hdev, "failed to register hwmon: %pe\n", hwmon_dev);
+		goto stop;
+	}
+	data->hwmon_dev = hwmon_dev;
+
+	return 0;
+
+stop:
+	hid_hw_stop(hdev);
+	return ret;
+}
+
+static void acer_aspire14_remove(struct hid_device *hdev)
+{
+	struct acer_aspire14_data *data = hid_get_drvdata(hdev);
+
+	if (data && data->hwmon_dev)
+		hwmon_device_unregister(data->hwmon_dev);
+	hid_hw_stop(hdev);
+}
+
+static int acer_aspire14_reset_resume(struct hid_device *hdev)
+{
+	if (hdev->claimed & HID_CLAIMED_INPUT)
+		hidinput_reset_resume(hdev);
+
+	return 0;
+}
+
+static const struct hid_device_id acer_aspire14_id_table[] = {
+	{ HID_I2C_DEVICE(ACER_ASPIRE14_VID, ACER_ASPIRE14_PID) },
+	{}
+};
+
+static struct hid_driver acer_aspire14_driver = {
+	.name = "acer-aspire14-ec",
+	.id_table = acer_aspire14_id_table,
+	.probe = acer_aspire14_probe,
+	.remove = acer_aspire14_remove,
+	.reset_resume = acer_aspire14_reset_resume,
+};
+
+static int __init acer_aspire14_init(void)
+{
+	if (!dmi_check_system(acer_aspire14_dmi_table))
+		return -ENODEV;
+
+	return hid_register_driver(&acer_aspire14_driver);
+}
+
+static void __exit acer_aspire14_exit(void)
+{
+	hid_unregister_driver(&acer_aspire14_driver);
+}
+
+late_initcall(acer_aspire14_init);
+module_exit(acer_aspire14_exit);
+
+MODULE_AUTHOR("Ethan Jimmy <duhxu0@gmail.com>");
+MODULE_DESCRIPTION("Acer Aspire 14 AI EC fan driver");
+MODULE_LICENSE("GPL");
-- 
2.56.0

