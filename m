Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436495;
	b=GT9kaPfWLm1jjXDa7PGuRT2TLgAJwjtXg824i/Q3BX1sjPUMiiy1/FIu7AmZynZP/nWR
	 ejClaTYy20HjMgXirHJbeYSIRVd5eTtf76/YNuDYAKZB0YG99wn+wx8M0gsDcm1nLA+fT
	 QOlTcBnCfdYTmfROCtANXATE1qzpY2S6cyocL1uWKeD9a3ulHkE2rGr99iJMcfgGbCzI9
	 ZlbjEXXnci/ARx097srkXMKizHXbDqQTN15YVpEiwnxT9ThnKnXpgcIH3km7f1iOks+fZ
	 6nE+kdU6Fgk5cZ8hJkcmIRtUIXLYNIMJ20RX1YF0sEQ91nnu21u1PXe2YVxNeqtFMzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=9/2YfyPilt/sBHRDO7Hz5km1ULNp6WgrcZq5drIWlh0=;
	b=CqXbX9wcGcR3DnKX5FOd5suSlkDT3suRMJ1ZJ5hNCFGKwjMPONMeF5MXuQGau5tpqVa0
	 NGFouRfcnGX2RclOQ+nXhgbvZeYpB+c3FyO+HHTcZoyCj5Mbp34KIvhmZfCGtI9XYatVi
	 JRpVpoiaoVdoIxG4qp3h4EWrQxNFwEk8oHpWYfy/K/oOW24xXfjneCONbHIKlcPWKXNnK
	 DdcL3mT82Skpz2sQn67eGIfkHuRNOW0RK8YQGjlHs0pL++pi2JpcYbfWFf87HoCGqkyjz
	 UBQhS/6SevH2EHjcWafPSDm/OyOR/sM+XaJJVEzml1LZsSeqbzvVNjnyTxi21IT9cXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=R77p0W5V;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAF460A2602
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CAF460A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=R77p0W5V
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e940d5d2beso9957325ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792436494; x=1793041294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/2YfyPilt/sBHRDO7Hz5km1ULNp6WgrcZq5drIWlh0=;
        b=R77p0W5VCgAOwKU8Qp9CzEa0M3Joo2rSvsz1ONdV2+gvzihDo74RoLif/0I8kLPkTU
         TY6v3DEh+5mJvPNLCLKpxKvsH98Jt2TJx7aE2D3Qiu++G0HVTim3U5U3Jgvd4KEgefPx
         w4P4NrpuZUllHB5AO/Rv58FLmG/id4G3jmTZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436494; x=1793041294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9/2YfyPilt/sBHRDO7Hz5km1ULNp6WgrcZq5drIWlh0=;
        b=QlZ7Vml0VI38KhFoMWCzLLRgQSgYEvdVje5BLkEUe0edZV2OKlNf6CUcNDlLUkk2hN
         JGg4fc9BLDKPzfwjG2+FT1khAYk5acIMXwTaeww66NeH9MFTmYeA2SJNuLbCWJsP5Q9C
         Ja7KmIxYpM8MdoCrum1mvH1IAIanzHerrNcptny9+YNPDwAZiFycFxm9LW6NfC4Rpwqo
         ZZ2zt27eeidmNqf1C5JfQ1XyvizSwKvMacbSZ4tEF9sAdwcLTzO7/hDM4+0DtTEkZXnC
         3do61SrZmTM8qHRIr5na4NdNoszVaOwj0gKFqNQrGvfgF20/aJ1DD4ca7md2IcEHrBlk
         EMMg==
X-Forwarded-Encrypted: i=1; AKwUvBz+MqKFi328SQfGpapKx3DSb3Ka3qQrfbAFlW343NZ47bV5vyBu8b6q4khPBwiyO2CS3szh3z+HZuyIb3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcAcJQVDi98G/H/mJlnkr4cNAnACpTJ4Th2n2LzWI3IgAhzWSw
	XXgdp3Qm76r9J6uXpcBId1YQLNOFSqgg/DCTE/EBGpkgfbtfKp5t3m3yq0axIdGtKQ==
X-Gm-Gg: AYBFou2JsgXzBzMUZMv+uDzUxTcAn1YN+E0nE2uqm76xulj9DKRxWcaEZ+pU6AO2hdQ
	LtotoMZku9PtrIMCyEVR73OOMmD9w0Ruq7Dto5H44wRTbofLImulyuff2sG2XenMsXOx156blE7
	8rFqKeLgLMFqDCsvYJu5m6sy+KqaGFcVdamJUgiKpcgn2KzN8iD1vbnysW1yyVQ3zEXgGiAUNGB
	qjpJSeY2q7w7xS4OKqhJb8UtG2JA/0E2yEiP4Yg0kirupGsE36WcRPAeQG/Jll6SRf/UhimoE3D
	bTqk+dxkkoUd+XiCliLeMPkCTghkq+GpldwMjKeikSMQ7ly+ipZAZl6ss8MjGgrTtYnXEokbsM2
	BUHRCLUvHz/u19uU7H9ecqJUH8LAfELGpF1mnQN7sj87rGMR1iMdHlce+LAH9tvN0uyr3rq+PiI
	gbWfuvlKiwq7VO1lkgVB5mbAhVz/X/s1Vgm4rCKsmydP6Mf0TlEKDlTtKSbwTixchIIJLnIew2e
	W3UnL701E7F/NTp1U85F+1zXfE5+jKY+JVxjlDuqIdCusoIsMHO3E/lR9dDjRmxbqj2fp4eB+3L
	ZcFHdDrSch5hw15VMmTZlBryJKTHq5TQYxgBrUP6JTykgYmhL/sWPC0gVoGjd2CKfiUralZ6Dkw
	NSjZbvXWc
X-Received: by 2002:a17:902:ec8b:b0:2e9:7ff5:544c with SMTP id d9443c01a7336-2e9a68d9688mr64348165ad.25.1792436493737;
        Mon, 19 Oct 2026 12:01:33 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151e1b7esm4473105ad.75.2026.10.19.12.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:01:33 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Mon, 19 Oct 2026 19:01:15 +0000
Subject: [PATCH v6 03/11] HID: spi-hid: add transport driver skeleton for
 HID over SPI bus
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
Message-Id: <20261019-send-upstream-v6-3-cb9ba4b3d6fa@chromium.org>
References: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
In-Reply-To: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, Angela Czubak <acz@semihalf.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792436487; l=8559;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=9VZ4Rf5jljFWzOwL3gfU2yT0x1RYpawpi96TWWM+OHw=;
 b=Hj9lmQ4nD/yWh9a0RNbwCMsy2Q0kx381gBsrJ4Sn/RwoNY3xjNKM0viwRz16gNNlrzFsyYCiO
 ozAV9KiZaHbAS/Ywh5Oev/aaQj18CRkzq7ba18wPStge8RpA4qaBEg0
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Angela Czubak <acz@semihalf.com>

Create spi-hid folder and add Kconfig and Makefile for spi-hid driver.
Add basic device structure, definitions, and probe/remove functions.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Signed-off-by: Angela Czubak <acz@semihalf.com>
Tested-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 drivers/hid/Kconfig                |   2 +
 drivers/hid/Makefile               |   2 +
 drivers/hid/spi-hid/Kconfig        |  15 +++
 drivers/hid/spi-hid/Makefile       |   9 ++
 drivers/hid/spi-hid/spi-hid-core.c | 213 +++++++++++++++++++++++++++++++++++++
 5 files changed, 241 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index c43e824428f0..17a42301875c 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1527,6 +1527,8 @@ source "drivers/hid/bpf/Kconfig"
 
 source "drivers/hid/i2c-hid/Kconfig"
 
+source "drivers/hid/spi-hid/Kconfig"
+
 source "drivers/hid/intel-ish-hid/Kconfig"
 
 source "drivers/hid/amd-sfh-hid/Kconfig"
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 48a863b245ee..b5a7ef7f208f 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -177,6 +177,8 @@ obj-$(CONFIG_USB_KBD)		+= usbhid/
 
 obj-$(CONFIG_I2C_HID_CORE)	+= i2c-hid/
 
+obj-$(CONFIG_SPI_HID_CORE)	+= spi-hid/
+
 obj-$(CONFIG_INTEL_ISH_HID)	+= intel-ish-hid/
 
 obj-$(CONFIG_AMD_SFH_HID)       += amd-sfh-hid/
diff --git a/drivers/hid/spi-hid/Kconfig b/drivers/hid/spi-hid/Kconfig
new file mode 100644
index 000000000000..836fdefe8345
--- /dev/null
+++ b/drivers/hid/spi-hid/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Copyright (c) 2021 Microsoft Corporation
+#
+
+menuconfig SPI_HID
+	tristate "SPI HID support"
+	default y
+	depends on SPI
+
+if SPI_HID
+
+config SPI_HID_CORE
+	tristate
+endif
diff --git a/drivers/hid/spi-hid/Makefile b/drivers/hid/spi-hid/Makefile
new file mode 100644
index 000000000000..92e24cddbfc2
--- /dev/null
+++ b/drivers/hid/spi-hid/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for the SPI HID input drivers
+#
+# Copyright (c) 2021 Microsoft Corporation
+#
+
+obj-$(CONFIG_SPI_HID_CORE)	+= spi-hid.o
+spi-hid-objs 			= spi-hid-core.o
diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/spi-hid-core.c
new file mode 100644
index 000000000000..02a7608c4b88
--- /dev/null
+++ b/drivers/hid/spi-hid/spi-hid-core.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * HID over SPI protocol implementation
+ *
+ * Copyright (c) 2021 Microsoft Corporation
+ * Copyright (c) 2026 Google LLC
+ *
+ * This code is partly based on "HID over I2C protocol implementation:
+ *
+ *  Copyright (c) 2012 Benjamin Tissoires <benjamin.tissoires@gmail.com>
+ *  Copyright (c) 2012 Ecole Nationale de l'Aviation Civile, France
+ *  Copyright (c) 2012 Red Hat, Inc
+ *
+ *  which in turn is partly based on "USB HID support for Linux":
+ *
+ *  Copyright (c) 1999 Andreas Gal
+ *  Copyright (c) 2000-2005 Vojtech Pavlik <vojtech@suse.cz>
+ *  Copyright (c) 2005 Michael Haboustak <mike-@cinci.rr.com> for Concept2, Inc
+ *  Copyright (c) 2007-2008 Oliver Neukum
+ *  Copyright (c) 2006-2010 Jiri Kosina
+ */
+
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/hid-over-spi.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+
+/* struct spi_hid_conf - Conf provided to the core */
+struct spi_hid_conf {
+	u32 input_report_header_address;
+	u32 input_report_body_address;
+	u32 output_report_address;
+	u8 read_opcode;
+	u8 write_opcode;
+};
+
+/**
+ * struct spihid_ops - Ops provided to the core
+ * @power_up: do sequencing to power up the device
+ * @power_down: do sequencing to power down the device
+ * @assert_reset: do sequencing to assert the reset line
+ * @deassert_reset: do sequencing to deassert the reset line
+ * @sleep_minimal_reset_delay: minimal sleep delay during reset
+ */
+struct spihid_ops {
+	int (*power_up)(struct spihid_ops *ops);
+	int (*power_down)(struct spihid_ops *ops);
+	int (*assert_reset)(struct spihid_ops *ops);
+	int (*deassert_reset)(struct spihid_ops *ops);
+	void (*sleep_minimal_reset_delay)(struct spihid_ops *ops);
+};
+
+/* Driver context */
+struct spi_hid {
+	struct spi_device	*spi;	/* spi device. */
+	struct hid_device	*hid;	/* pointer to corresponding HID dev. */
+
+	struct spihid_ops	*ops;
+	struct spi_hid_conf	*conf;
+
+	enum hidspi_power_state power_state;
+
+	u32 regulator_error_count;
+	int regulator_last_error;
+	u32 bus_error_count;
+	int bus_last_error;
+	u32 dir_count;	/* device initiated reset count. */
+};
+
+static const char *spi_hid_power_mode_string(enum hidspi_power_state power_state)
+{
+	switch (power_state) {
+	case HIDSPI_ON:
+		return "d0";
+	case HIDSPI_SLEEP:
+		return "d2";
+	case HIDSPI_OFF:
+		return "d3";
+	default:
+		return "unknown";
+	}
+}
+
+static irqreturn_t spi_hid_dev_irq(int irq, void *_shid)
+{
+	return IRQ_HANDLED;
+}
+
+static ssize_t bus_error_count_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct spi_hid *shid = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u (%d)\n",
+			  shid->bus_error_count, shid->bus_last_error);
+}
+static DEVICE_ATTR_RO(bus_error_count);
+
+static ssize_t regulator_error_count_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	struct spi_hid *shid = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u (%d)\n",
+			  shid->regulator_error_count,
+			  shid->regulator_last_error);
+}
+static DEVICE_ATTR_RO(regulator_error_count);
+
+static ssize_t device_initiated_reset_count_show(struct device *dev,
+						 struct device_attribute *attr,
+						 char *buf)
+{
+	struct spi_hid *shid = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", shid->dir_count);
+}
+static DEVICE_ATTR_RO(device_initiated_reset_count);
+
+static struct attribute *spi_hid_attrs[] = {
+	&dev_attr_bus_error_count.attr,
+	&dev_attr_regulator_error_count.attr,
+	&dev_attr_device_initiated_reset_count.attr,
+	NULL	/* Terminator */
+};
+
+static const struct attribute_group spi_hid_group = {
+	.attrs = spi_hid_attrs,
+};
+
+const struct attribute_group *spi_hid_groups[] = {
+	&spi_hid_group,
+	NULL
+};
+EXPORT_SYMBOL_GPL(spi_hid_groups);
+
+int spi_hid_core_probe(struct spi_device *spi, struct spihid_ops *ops,
+		       struct spi_hid_conf *conf)
+{
+	struct device *dev = &spi->dev;
+	struct spi_hid *shid;
+	int error;
+
+	if (spi->irq <= 0)
+		return dev_err_probe(dev, spi->irq ?: -EINVAL, "Missing IRQ\n");
+
+	shid = devm_kzalloc(dev, sizeof(*shid), GFP_KERNEL);
+	if (!shid)
+		return -ENOMEM;
+
+	shid->spi = spi;
+	shid->power_state = HIDSPI_ON;
+	shid->ops = ops;
+	shid->conf = conf;
+
+	spi_set_drvdata(spi, shid);
+
+	/*
+	 * At the end of probe we initialize the device:
+	 *   0) assert reset, bias the interrupt line
+	 *   1) sleep minimal reset delay
+	 *   2) request IRQ
+	 *   3) power up the device
+	 *   4) deassert reset (high)
+	 * After this we expect an IRQ with a reset response.
+	 */
+
+	shid->ops->assert_reset(shid->ops);
+
+	shid->ops->sleep_minimal_reset_delay(shid->ops);
+
+	error = devm_request_threaded_irq(dev, spi->irq, NULL, spi_hid_dev_irq,
+					  IRQF_ONESHOT, dev_name(&spi->dev), shid);
+	if (error) {
+		dev_err(dev, "%s: unable to request threaded IRQ\n", __func__);
+		return error;
+	}
+
+	error = shid->ops->power_up(shid->ops);
+	if (error) {
+		dev_err(dev, "%s: could not power up\n", __func__);
+		return error;
+	}
+
+	shid->ops->deassert_reset(shid->ops);
+
+	dev_dbg(dev, "%s: d3 -> %s\n", __func__,
+		spi_hid_power_mode_string(shid->power_state));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spi_hid_core_probe);
+
+void spi_hid_core_remove(struct spi_device *spi)
+{
+	struct spi_hid *shid = spi_get_drvdata(spi);
+	struct device *dev = &spi->dev;
+	int error;
+
+	shid->ops->assert_reset(shid->ops);
+	error = shid->ops->power_down(shid->ops);
+	if (error)
+		dev_err(dev, "failed to disable regulator\n");
+}
+EXPORT_SYMBOL_GPL(spi_hid_core_remove);
+
+MODULE_DESCRIPTION("HID over SPI transport driver");
+MODULE_AUTHOR("Dmitry Antipov <dmanti@microsoft.com>");
+MODULE_LICENSE("GPL");

-- 
2.56.0.212.g129ede20d9-goog

