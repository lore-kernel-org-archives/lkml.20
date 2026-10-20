Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482227;
	b=IsrY7+2MSNU+d1TtntVjcCNxqJabt938QTsNVgSr0ysrvzCaWyJXx/o4TznbgGrts6Xe
	 MZV18S4g/werBujzxCfpp4rzfWLLEzi3NZA93XJOOzj1nv5VyiCfgnexkFz4rvm+uxNpi
	 VRt+A9KhDIm67W94GIOwMwbuHq2MlvXeSpXEKzPWC+SPZLDpugjOjS3jylSKxB5+jFzvM
	 23LXAqGgtqaQFcF8nKaGUBFtaAtA7CgKTPXov8a2SzhDdXaHtWAtySbZEWB31KBMuYSHA
	 u4ff7zGGuQ/oYxumCEFGxR4YDIDIckYnQOSw6Bn3S13jIz1Fjh7pPX0cY6AQJTJ7B4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/KzlsA53UJDPHxZtaD4dq+Q0uFlLP1rDiRwhL5p5CDg=;
	b=ylVIR4mrBS7rXFgmsgDtc492zpqsyIwuhVpQWDUMSrfX9/DJRwHDoRATvTVqoWu3/a8X
	 XjuraFYdNE4o+SBdJSY2Zg16Yy8dWXdphHXlEWYShEUIm/4afG0kqlJI1IcP18cyCi9cc
	 jvrkBwUpV+vk/zblpwS5Ofyu9/D0QLjs6TvF2Mdsd+sUR278Hf3aXgod9rok/98KmMBGQ
	 VJJkM8nB0geMZWCkPElgbg4+8dhNm6culJQIkzi9lrhwhi6vKM3cuJVUbm+pT1WNzeijK
	 miL50AbAfYMp83U5Nm3ct2Lv6ci6O9h7cENfjx5CQQNZgtVhtJjgu/y7Ttqmt1rzWPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=VqMPGXv3;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BD4606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11BD4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=VqMPGXv3
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1613953c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792482226; x=1793087026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/KzlsA53UJDPHxZtaD4dq+Q0uFlLP1rDiRwhL5p5CDg=;
        b=VqMPGXv3U4W48VAxIdzKl3PI3rEgzmlPU6pevDddQM9+Nb4Toy4OwU803n68YL2R1X
         /xUzBafg1dkiqMKjOijnfzMZ+VnFPvQqy2MKanBF/lswEiMEgf/Gl3TCYx11ks1UQ1y9
         xwpRJepuUg52vBs2hDhevPiMwksIAGV2qpqYKau2W9PnM+LpBQsLCNrKGAnH3IZi9yOh
         0TjmkwPV65vbvLt4X1tacEd6IEE6HMWMixtigucB9J7AGgYw3QgQ/9DYBHnAL3OnJe44
         zDUzgmrAleGo796UBH95vRVq82Yn9XW+4+ZXpRTUFvmXKjtEmaV1uw36DlYxulhxMFdW
         rY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482226; x=1793087026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/KzlsA53UJDPHxZtaD4dq+Q0uFlLP1rDiRwhL5p5CDg=;
        b=FlsUfe4fjjFe61IQ3SmCr/gJd3neQOOjRoZPrtXM9P6CESlR+jEAMPyKYsSPHMW1Wc
         wMn7FcQTZUbab+JhoA20dJ4nd6gnaVdoOsZg5oOMahUFakfS54KO1qq+yzbbMreDFVC0
         xf8glYTaEp+mzZmgiymSrhbcVfcw5fRcsS6Y0h7kIjGvQlGzJ39QTdF/8AWzfBOyzq/m
         BYzec1pBlpUxFlXqvVu4IrydN8n0E6EcdpoFPJYVYA8fLai4Gh62/83vvmqwOFz7MlhK
         vd9VrrO37w0zVT5aEpHwrBtXrT5IWLBVsoXe5myM0dFy+5q/P4HhqG0Q9zhC3PT673tX
         r1eA==
X-Forwarded-Encrypted: i=1; AKwUvBxDLZItDauPocuTp1DpxzxB+E0iZXNhWYouu4Onbl1SStia5o6VUoMHdiD145za3PXb3WrGAmBIx7t16P0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKy1wLhA7a6gZujIFhzvNrGQE51x8YyZmCrDPg3iND88DU/ag3Z
	J2TiO1e7cjUQT6ZxRK3lsIeYY/fe+Nfouw3H/qIkC/Hzr5jDg59hiRT3IPWEMiiFlhI=
X-Gm-Gg: AYBFou1j8qCHjBnfn1RArcJDr9YPL+ugYDUXVT5IpaTHjV/D91/o/P7fizncBljG1/T
	RO9/tzksyoESbXgHpi17PNs7JHaZ2RCKe8VoyFtw2m+3HTAbTtubtLZzWTUjgENSMTk/kPyzwbV
	pl8j2bzYA+vm3HzT2sJkf73sTwzdUI64i/WTVEIp2NgSgcxZ8TGL774Q/zhJSlg48C2GaCDZ/O+
	d9JatW6SmfLsRrOvRKOyxJ02PUecYVjW0rz5ht5ZUtC53BSLjFBj4Y6Fd/UHWeIdFvOuREcUw11
	NYt9aXIZfTrR9PCBoVVNSBvyrTRuWgSe48h2qxOjCUcHqdu9y4RLe+C9ypFlP8i/3jMw5OGF35w
	ETCELOujoomR/KbPqhLQCHSyf5/QOX+dESu6/iRB1PTf1/pcocYtXD71/3sacM7KDUKMR5UjkCc
	NYMn2Nk2ohByrBOwnaurM8tpNhveHm4tLUjZgLVbzfTpNYedJkimDxCiRuJzrATrRowTCfoLZ5b
	w==
X-Received: by 2002:a05:701b:4549:10b0:188:ecb4:489 with SMTP id a92af1059eb24-188ecb406cdmr8590097c88.34.1792482226027;
        Tue, 20 Oct 2026 00:43:46 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm37010238eec.29.2026.10.20.00.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:43:45 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 00:43:40 -0700
Subject: [PATCH v2 4/4] hwmon: (pmbus/fs1412) Add TDK FS1412 and FS1525
 driver
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v2-4-3396c3a08251@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482219; l=13612;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=4qZ7zriEPM02eQDSW39f349WYK/9EPPcjk2OtSVHJN0=;
 b=C3oxxo83TJwpQ5YaJYwim5tsUAds1u6euyq8Gg/0JetpiGy82UnNN6JAxSdg2Q/NqmoWIE3Ha
 QCFzOFQz3QYCVGG7E03jyPPSApWT/h5EKSNDajJVrvvWgWfrnXVLOTz
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with PMBus
telemetry for input voltage, output voltage and temperature, plus the
matching status registers. The FS1525 also reports output current and
has an over-temperature warning limit. The FS1412 has neither:
READ_IOUT and OT_WARN_LIMIT are not in its command table. Both read
"KDT" from MFR_ID, which the driver checks before binding, and are
told apart by IC_DEVICE_ID (0x0c for the FS1412, 0x19 for the FS1525).

VOUT_MODE is read-only and has bit 7 set on both: 0x98 on the FS1412
(exponent -8) and 0x96 on the FS1525 (exponent -10). Their output
voltage limits are relative to VOUT_COMMAND, so 0x0133 against a 0.6V
command is a 120% over-voltage limit on the FS1412. The PMBus core
converts them now that it supports relative VOUT encoding.

On the FS1412, OT_WARN_LIMIT answers although it is not in the command
table, but the part reports OT_WARNING at room temperature, so the
driver hides the register from the core and only the OT_FAULT_LIMIT
based attributes are provided.

When the output is set with an external divider, the FS1412 reports
READ_VOUT at the feedback pin, so in2_input and its limits all scale
with the divider in user space. The FS1525 reports READ_VOUT as the
output voltage and compares it against its warning and under-voltage
limits as they are, relative to VOUT_COMMAND; only its over-voltage
fault is an analog comparison at the feedback pin. The documentation
describes both.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/hwmon/fs1412.rst | 124 +++++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst  |   1 +
 MAINTAINERS                    |   7 ++
 drivers/hwmon/pmbus/Kconfig    |   9 +++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/fs1412.c   | 144 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 286 insertions(+)

diff --git a/Documentation/hwmon/fs1412.rst b/Documentation/hwmon/fs1412.rst
new file mode 100644
index 000000000000..5e141b0c731f
--- /dev/null
+++ b/Documentation/hwmon/fs1412.rst
@@ -0,0 +1,124 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver fs1412
+====================
+
+Supported chips:
+
+  * TDK FS1412
+
+    Prefix: 'fs1412'
+
+    Addresses scanned: -
+
+    Datasheet: https://product.tdk.com/system/files/dam/doc/product/power/switching-power/micro-pol/data_sheet/fs1412_datasheet.pdf
+
+  * TDK FS1525
+
+    Prefix: 'fs1525'
+
+    Addresses scanned: -
+
+    Datasheet: Publicly available at the TDK website
+
+Authors:
+    Abdurrahman Hussain <abdurrahman@nexthop.ai>
+
+
+Description
+-----------
+
+This driver implements support for the TDK FS1412 and FS1525 uPOL DC/DC
+regulators.
+
+The FS1412 is a 12A part with PMBus monitoring of its input voltage, output
+voltage and temperature. It has over-current and over-temperature protection
+with programmable fault limits but no current telemetry, so no current
+attributes are provided.
+
+The FS1525 is a 25A part that adds output current telemetry and an
+over-temperature warning limit.
+
+Both parts read "KDT" from MFR_ID. The driver tells them apart by
+IC_DEVICE_ID and warns if the detected part does not match the one it was
+instantiated as.
+
+The FS1412 answers on two I2C addresses: a register interface at the I2C
+base address (0x08 by default) and the PMBus interface at the PMBus base
+address (0x70 by default), each plus the offset strapped on the ADDR pin.
+This driver binds to the PMBus address.
+
+The driver is a client driver to the core PMBus driver.
+Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+Both parts store their output voltage limits relative to VOUT_COMMAND
+(VOUT_MODE bit 7 set). The PMBus core converts them to and from absolute
+voltages, so the output voltage limits read and write in volts. A written
+limit is stored as a fraction of VOUT_COMMAND in the resolution of VOUT_MODE
+(1/256 on the FS1412, 1/1024 on the FS1525), so it may read back rounded. The
+over-voltage protection itself engages at one of four thresholds the device
+rounds the fault limit to; see the datasheet.
+
+When the output voltage is set with an external resistor divider,
+VOUT_COMMAND holds the feedback pin target rather than the output voltage,
+and the two parts differ:
+
+- The FS1412 reports READ_VOUT at the feedback pin, so in2_input and the in2
+  limits are all in the feedback domain. Scale them by the divider ratio in
+  user space.
+
+- The FS1525 reports READ_VOUT as the output voltage. Its warning and
+  under-voltage limits are compared by the device against READ_VOUT but are
+  still relative to VOUT_COMMAND, so in2_max, in2_min and in2_lcrit are the
+  thresholds the device actually applies to in2_input. The over-voltage
+  fault is an analog comparison at the feedback pin, so in2_crit is in the
+  feedback domain and does not compare to in2_input on such boards.
+
+The FS1412 reports an over-temperature warning at room temperature and has
+no OT_WARN_LIMIT in its command table, so temp1_max and its alarm are not
+provided for it; temp1_crit comes from OT_FAULT_LIMIT.
+
+
+Sysfs entries
+-------------
+
+======================= ======================================================
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_min			Minimum input voltage
+in1_min_alarm		Input voltage low alarm
+in1_crit		Critical high input voltage
+in1_crit_alarm		Input voltage critical high alarm
+
+in2_label		"vout1"
+in2_input		Measured output voltage (FS1412: at the feedback pin)
+in2_min			Minimum output voltage
+in2_min_alarm		Output voltage low alarm
+in2_max			Maximum output voltage
+in2_max_alarm		Output voltage high alarm
+in2_lcrit		Critical low output voltage
+in2_lcrit_alarm		Output voltage critical low alarm
+in2_crit		Critical high output voltage
+in2_crit_alarm		Output voltage critical high alarm
+
+curr1_label		"iout1" (FS1525 only)
+curr1_input		Measured output current (FS1525 only)
+curr1_max		Maximum output current (FS1525 only)
+curr1_max_alarm		Output current high alarm (FS1525 only)
+curr1_crit		Critical high output current (FS1525 only)
+curr1_crit_alarm	Output current critical high alarm (FS1525 only)
+
+temp1_input		Measured temperature
+temp1_max		Maximum temperature (FS1525 only)
+temp1_max_alarm		Temperature high alarm (FS1525 only)
+temp1_crit		Critical high temperature
+temp1_crit_alarm	Temperature critical high alarm
+======================= ======================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 9955a525436a..625833374c94 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -79,6 +79,7 @@ Hardware Monitoring Kernel Drivers
    f71805f
    f71882fg
    fam15h_power
+   fs1412
    fsp-3y
    ftsteutates
    g760a
diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b..73b5a120517e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26778,6 +26778,13 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/tda9840*
 
+TDK FS1412 AND FS1525 MICRO POL DRIVER
+M:	Abdurrahman Hussain <abdurrahman@nexthop.ai>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/fs1412.rst
+F:	drivers/hwmon/pmbus/fs1412.c
+
 TEA5761 TUNER DRIVER
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index eb71a0ac044b..67bbc87710ee 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -132,6 +132,15 @@ config SENSORS_DELTA_AHE50DC_FAN
 	  This driver can also be built as a module. If so, the module
 	  will be called delta-ahe50dc-fan.
 
+config SENSORS_FS1412
+	tristate "TDK FS1412 and FS1525"
+	help
+	  If you say yes here you get hardware monitoring support for the TDK
+	  FS1412 and FS1525 uPOL regulators.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called fs1412.
+
 config SENSORS_FSP_3Y
 	tristate "FSP/3Y-Power power supplies"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index e288fe72a437..7bbc0d02bfad 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_APS_379)	+= aps-379.o
 obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
 obj-$(CONFIG_SENSORS_BPA_RS600)	+= bpa-rs600.o
 obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
+obj-$(CONFIG_SENSORS_FS1412)	+= fs1412.o
 obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
 obj-$(CONFIG_SENSORS_HAC300S)	+= hac300s.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
diff --git a/drivers/hwmon/pmbus/fs1412.c b/drivers/hwmon/pmbus/fs1412.c
new file mode 100644
index 000000000000..58bff773ca58
--- /dev/null
+++ b/drivers/hwmon/pmbus/fs1412.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for the TDK FS1412 and FS1525 uPOL regulators
+ *
+ * Copyright 2026 Nexthop Systems.
+ */
+
+#include <linux/array_size.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pmbus.h>
+#include <linux/string.h>
+
+#include "pmbus.h"
+
+#define FS1412_MFR_ID		"KDT"
+#define FS1412_MFR_ID_LEN	(sizeof(FS1412_MFR_ID) - 1)
+
+/*
+ * OT_WARN_LIMIT is not in the FS1412 command table. The register answers, but the
+ * part has no warning threshold and reports OT_WARNING at room temperature,
+ * so keep the core from exposing either.
+ */
+static int fs1412_read_word_data(struct i2c_client *client, int page,
+				 int phase, int reg)
+{
+	if (reg == PMBUS_OT_WARN_LIMIT)
+		return -ENXIO;
+
+	return -ENODATA;
+}
+
+static int fs1412_write_word_data(struct i2c_client *client, int page,
+				  int reg, u16 word)
+{
+	if (reg == PMBUS_OT_WARN_LIMIT)
+		return -ENXIO;
+
+	return -ENODATA;
+}
+
+enum chips { fs1412, fs1525 };
+
+/* IC_DEVICE_ID, a one byte block */
+static const u8 fs1412_device_id[] = {
+	[fs1412] = 0x0c,
+	[fs1525] = 0x19,
+};
+
+static struct pmbus_driver_info fs1412_info[] = {
+	[fs1412] = {
+		.pages = 1,
+		.format[PSC_VOLTAGE_IN] = linear,
+		.format[PSC_VOLTAGE_OUT] = linear,
+		.format[PSC_TEMPERATURE] = linear,
+		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
+			   PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			   PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.read_word_data = fs1412_read_word_data,
+		.write_word_data = fs1412_write_word_data,
+	},
+	[fs1525] = {
+		.pages = 1,
+		.format[PSC_VOLTAGE_IN] = linear,
+		.format[PSC_VOLTAGE_OUT] = linear,
+		.format[PSC_CURRENT_OUT] = linear,
+		.format[PSC_TEMPERATURE] = linear,
+		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
+			   PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			   PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+			   PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+	},
+};
+
+static const struct i2c_device_id fs1412_id[] = {
+	{ .name = "fs1412", .driver_data = fs1412 },
+	{ .name = "fs1525", .driver_data = fs1525 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, fs1412_id);
+
+static int fs1412_probe(struct i2c_client *client)
+{
+	char buf[I2C_SMBUS_BLOCK_MAX + 1] = { 0 };
+	struct device *dev = &client->dev;
+	enum chips chip, detected;
+	int ret;
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read PMBUS_MFR_ID\n");
+
+	if (ret != FS1412_MFR_ID_LEN ||
+	    strncmp(buf, FS1412_MFR_ID, FS1412_MFR_ID_LEN))
+		return dev_err_probe(dev, -ENODEV,
+				     "Unsupported Manufacturer ID '%s'\n", buf);
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to read PMBUS_IC_DEVICE_ID\n");
+	if (ret != 1)
+		return dev_err_probe(dev, -ENODEV,
+				     "Unexpected IC_DEVICE_ID length %d\n", ret);
+
+	for (detected = 0; detected < ARRAY_SIZE(fs1412_device_id); detected++)
+		if (fs1412_device_id[detected] == (u8)buf[0])
+			break;
+	if (detected == ARRAY_SIZE(fs1412_device_id))
+		return dev_err_probe(dev, -ENODEV,
+				     "Unsupported IC_DEVICE_ID 0x%02x\n",
+				     (u8)buf[0]);
+
+	chip = (uintptr_t)i2c_get_match_data(client);
+	if (chip != detected)
+		dev_warn(dev, "Device mismatch: Configured %s, detected %s\n",
+			 client->name, fs1412_id[detected].name);
+
+	return pmbus_do_probe(client, &fs1412_info[detected]);
+}
+
+static const struct of_device_id fs1412_of_match[] = {
+	{ .compatible = "tdk,fs1412", .data = (void *)fs1412 },
+	{ .compatible = "tdk,fs1525", .data = (void *)fs1525 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, fs1412_of_match);
+
+static struct i2c_driver fs1412_driver = {
+	.driver = {
+		.name = "fs1412",
+		.of_match_table = fs1412_of_match,
+	},
+	.probe = fs1412_probe,
+	.id_table = fs1412_id,
+};
+
+module_i2c_driver(fs1412_driver);
+
+MODULE_AUTHOR("Abdurrahman Hussain <abdurrahman@nexthop.ai>");
+MODULE_DESCRIPTION("PMBus driver for the TDK FS1412 and FS1525 uPOL regulators");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");

-- 
2.54.0

