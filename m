Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695396;
	b=i7NW0+/MK+PoJptURInAnpen9oRHWjW7AxOuNWS1hyNYtPxi6dRoheHx0dWH3kG9PMUp
	 IYTAuwLxqeAoITRD01Eyra33D3zOr4noz08smvPh3faA2sf4tWKgupYJ6hruj2/ZNnZ/i
	 HMKXO7XdGOf3ByRZ8KFnoqeMOvDS2sWhe8Vo2eZB5FIuZhENLKnKtR5TjNzRGrwrLeCwO
	 D2nb53q6KxSkSMM3Cg2wksNHq/p52GPMfJmcUdNIsMi5VCHFOtEySdCFl0ZPCzCePcYGw
	 Fi119zbfr6jziL37MWK5O14bdCfR20WtpNx8kbrgS547RWDAOJu+l+JRtYGU8BKI+ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XZ/amS4mzaM2HGomiZj/qSvCCV52gQUu/7cJw6R1VsA=;
	b=wB9amNgV8MYX8/SQHp/SmhL+Jce6u9MX9xITnkpYB1IIK9PBa6OScn9VJ4a4a3c8Dh3e
	 epTo2WRNtK0UFZtYlFrVL+AwITmJfLJm/G9BpkDfkDLHcOmJvuJSDZQb5NQTyGVub7Mzz
	 mTFMIZwYJ9AM/0fseIIJMl9AdaMvK7YlRqJaZUAZfW9tXdAwC1TvOcjz3FGAXGb4xbcoA
	 7koO34/g+/2HKqw50FahPIX9BllN33WcjW5lAwJMCuBeXr5KcMiTdX3nrHA2ByDjWjmkU
	 KE8EbcaZSbMEQQxVdjd40yS8RkIRyK21qhYIXXyZm/wXu1F2k6hWycm98TEfiqKdb4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c3Prp0lh;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C57B606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C57B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c3Prp0lh
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so47837a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695395; x=1793300195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XZ/amS4mzaM2HGomiZj/qSvCCV52gQUu/7cJw6R1VsA=;
        b=c3Prp0lhvRU4qfuNt/z6tVRlfEH2iLh78Al0meWmPdrJyHt4AAxRFCnNb/siRbMFcZ
         jyMRuznMsiZbGanzNOpEASOXm8ABddDP5walet8cbmlrfICo1FUGPKIVfmGXlCIKC/qe
         g72oNvQPbmFGpwLqVaZS2g2wAQ57+64p7yvJhdCYdvW/DM6io2NZkfMIt2QEGZNnz3DB
         FJZa0aPVI27WSKD86Eni0w7HuVhj3mUVQfxmZiwbHOZOIHfgrqwTj3c08BxaPla7MMYc
         ffyujG4/O977f55SIY1GY2Q305AEanINsiySrBNZoDQXkMlZlDlSu+h+YYS3nna/3O5A
         zCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695395; x=1793300195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XZ/amS4mzaM2HGomiZj/qSvCCV52gQUu/7cJw6R1VsA=;
        b=Yza/IzCVIm4kZoB620S0p5BbQMyjuVVnHDSlezVs40Bi/dxYydGYiXu6I9XfjlSkfH
         61CSlhq+HpEsKqi7jJptZbY/L1XycbGeQfa+rOJr1S0iWksivPnLSHvA8e+M2NUG/gZK
         Dj+e5oqpWs0nX7x69nD5jvdSygB3rUrOslLFXBa6G1jKruyRWpEyJ+1Rlr5OV1DwP/Cy
         8in9VWb197VMngw7Fcv6aQu5LB+gHh6KmpJDwgPi7D+qdZS4YInONmVbmISpAka40WML
         0w2B8s9ZN58dhqQW399jrnCHqochOsjMZbUNIyGsv1vglPIsINKjTf8UNsp1t8xeFG0V
         C3hw==
X-Forwarded-Encrypted: i=1; AKwUvBwXytRgKhdZF7FpzfDc54X0D1J5U7IImLHjZjmvrAxPgZl7DtfN2FGJSzEbPrPyUbp3da99xyNvfWAAxL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAahhev0Lp6T3l5suwsH86cW43xocn2uiJASrlCZ8O+9uS0TUe
	rHD3tHNv6rL+PbakBbA+OabbL1xGK/EqKhfKSOciqDiq75S9XGSASOt9
X-Gm-Gg: AYBFou2iugQVxXtJ8RW5+0fGPH2U6MGlmRL1QqNViK/ADovS69Am46WoZqJwvvwdAZ0
	wBjxI5CkaxQZQpzy7JPi3Nu2RFX9FDhlki7A7hwd+T3ubhkxi3onQZENdlxV2dHOCKMG1mpKv/F
	z7oYStLAHb0AtjzCDxITCsIf7AXuvLoLdOEqIv4k6bf1xwEtxWvuo3Vp45DZmiW9RvXCpghdCvL
	Gjm++IxpAJg0GXhvrt8bhJjoWtXWW9GwtjG8xm6L6X4qcqfwEifAmNxg7QjrtyfQCRJMachlVD9
	5uK5M3TqAnn5hNBQ7yQeH96tAWPa6M9ut45bGn66G5k12NuZHAGfyzW23YMkxUUG5bezC6uGfZw
	3StUu5PrT4wJYoovnFQ0QKJIXU/ZvCufgbxCID/PWrHSTCDyIvRpsdEf2kV9DZlQRv2PXmKa7In
	sN+js3qo9fuwO3oMJ/cnW14Q2O8Yndjx99Ww8ryRUlM8uru6dHZOeKGkizgIuml8UBqaSsXHnvu
	N68SPMYjH0PpxL0Y6msKeFxul4v3ZYCL5dq/zKMIdLQW2ZGWMNE3LOB
X-Received: by 2002:a17:90b:2802:b0:3ac:b3c7:de04 with SMTP id 98e67ed59e1d1-3ada6c9d389mr1997279a91.34.1792695395293;
        Thu, 22 Oct 2026 11:56:35 -0700 (PDT)
Received: from Lucy-Fedora ([103.182.96.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm176123a91.0.2026.10.22.11.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:56:34 -0700 (PDT)
From: Lucy Wong <lucywong2778@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Armin Wolf <W_Armin@gmx.de>,
	Lucy Wong <lucywong2778@gmail.com>
Subject: [PATCH v2] platform/x86: add Xiaomi WMI key driver
Date: Fri, 23 Oct 2026 02:56:19 +0800
Message-ID: <20261022185619.40188-1-lucywong2778@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260601151404.93049-1-lucywong2778@gmail.com>
References: <20260601151404.93049-1-lucywong2778@gmail.com>
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

Certain Xiaomi laptops expose extra function keys through a single WMI
event GUID (B74AF83F-8B2F-4069-ACAC-36D176F62FC0). Unlike the existing
xiaomi-wmi driver where each key has its own GUID, here all keys share
one GUID and the event buffer encodes both an event type and a keycode:

  buffer[1] = event type
    0x02: press/release keys (5 keys with abstract icons)
    0x03: firmware-handled toggles (touchpad, Fn lock)
  buffer[2] = keycode within that type

The keys with abstract icons are mapped to programmable macro keys for
userspace to bind. The touchpad and Fn lock toggles, as well as the
keyboard backlight level events, are handled by the firmware and are
ignored.

Link: https://lore.kernel.org/platform-driver-x86/20260601151404.93049-1-lucywong2778@gmail.com/
Signed-off-by: Lucy Wong <lucywong2778@gmail.com>
---
Changes in v2:
- Convert to .notify_new and set .min_event_size
- Ignore firmware-handled backlight and toggle events, which removes the
  toggle deduplication state
- Add the missing select INPUT_SPARSEKMAP
- Name the event codes and align the defines
- Add the dev_printk.h include
---
 MAINTAINERS                            |   6 ++
 drivers/platform/x86/Kconfig           |  12 +++
 drivers/platform/x86/Makefile          |   1 +
 drivers/platform/x86/xiaomi-wmi-keys.c | 123 +++++++++++++++++++++++++
 4 files changed, 142 insertions(+)
 create mode 100644 drivers/platform/x86/xiaomi-wmi-keys.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 839e39825455..7969b82c8315 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29124,6 +29124,12 @@ F:	fs/xfs/
 F:	include/uapi/linux/dqblk_xfs.h
 F:	include/uapi/linux/fsmap.h
 
+XIAOMI WMI KEYS DRIVER
+M:	Lucy Wong <lucywong2778@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/xiaomi-wmi-keys.c
+
 XILINX AMS DRIVER
 M:	Salih Erim <salih.erim@amd.com>
 M:	Conall O'Griofa <conall.ogriofa@amd.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index b54b5212b204..1e7128f88adf 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -90,6 +90,18 @@ config XIAOMI_WMI
 	  To compile this driver as a module, choose M here: the module will
 	  be called xiaomi-wmi.
 
+config XIAOMI_WMI_KEYS
+	tristate "Xiaomi WMI key events driver"
+	depends on ACPI_WMI
+	depends on INPUT
+	select INPUT_SPARSEKMAP
+	help
+	  Say Y here if you want to support WMI-based hotkey events on certain
+	  Xiaomi laptops.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called xiaomi-wmi-keys.
+
 config REDMI_WMI
 	tristate "Redmibook WMI key driver"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 872ac3842391..d852bb0bf61b 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_HUAWEI_WMI)		+= huawei-wmi.o
 obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
 obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
+obj-$(CONFIG_XIAOMI_WMI_KEYS)		+= xiaomi-wmi-keys.o
 obj-$(CONFIG_REDMI_WMI)			+= redmi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
 obj-$(CONFIG_BITLAND_MIFS_WMI)		+= bitland-mifs-wmi.o
diff --git a/drivers/platform/x86/xiaomi-wmi-keys.c b/drivers/platform/x86/xiaomi-wmi-keys.c
new file mode 100644
index 000000000000..a01ef01e501e
--- /dev/null
+++ b/drivers/platform/x86/xiaomi-wmi-keys.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xiaomi laptop WMI hotkey driver
+ *
+ * Copyright (C) 2026 Lucy Wong <lucywong2778@gmail.com>
+ */
+
+#include <linux/device.h>
+#include <linux/dev_printk.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/module.h>
+#include <linux/wmi.h>
+
+#define XIAOMI_WMI_EVENT_GUID	"B74AF83F-8B2F-4069-ACAC-36D176F62FC0"
+
+#define XIAOMI_EVENT_TYPE_KEY	0x02
+
+#define XIAOMI_KEY_PRESS_FIRST	0x01
+#define XIAOMI_KEY_COUNT	5
+#define XIAOMI_KEY_RELEASE_FIRST	\
+	(XIAOMI_KEY_PRESS_FIRST + XIAOMI_KEY_COUNT)
+
+struct xiaomi_wmi_keys_event {
+	u8 reserved;
+	u8 type;
+	u8 code;
+};
+
+struct xiaomi_wmi_keys {
+	struct input_dev *input_dev;
+};
+
+static const struct key_entry xiaomi_wmi_keys_keymap[] = {
+	/* programmable keys with abstract icons */
+	{ KE_KEY, 0x01, { KEY_MACRO1 } },
+	{ KE_KEY, 0x02, { KEY_MACRO2 } },
+	{ KE_KEY, 0x03, { KEY_MACRO3 } },
+	{ KE_KEY, 0x04, { KEY_MACRO4 } },
+	{ KE_KEY, 0x05, { KEY_MACRO5 } },
+	{ KE_END, 0 },
+};
+
+static int xiaomi_wmi_keys_probe(struct wmi_device *wdev, const void *context)
+{
+	struct xiaomi_wmi_keys *data;
+	int ret;
+
+	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	dev_set_drvdata(&wdev->dev, data);
+
+	data->input_dev = devm_input_allocate_device(&wdev->dev);
+	if (!data->input_dev)
+		return -ENOMEM;
+
+	data->input_dev->name = "Xiaomi WMI keys";
+	data->input_dev->phys = "wmi/input0";
+	data->input_dev->id.bustype = BUS_HOST;
+
+	ret = sparse_keymap_setup(data->input_dev, xiaomi_wmi_keys_keymap, NULL);
+	if (ret)
+		return ret;
+
+	return input_register_device(data->input_dev);
+}
+
+static void xiaomi_wmi_keys_notify(struct wmi_device *wdev,
+				   const struct wmi_buffer *buffer)
+{
+	const struct xiaomi_wmi_keys_event *event = buffer->data;
+	struct xiaomi_wmi_keys *data = dev_get_drvdata(&wdev->dev);
+	unsigned int code;
+	bool pressed;
+
+	/*
+	 * Only the press/release keys are reported. Event types 0x01
+	 * (backlight) and 0x03 (touchpad and Fn-lock toggles) are handled by
+	 * the firmware and need no action from the driver.
+	 */
+	if (event->type != XIAOMI_EVENT_TYPE_KEY) {
+		dev_dbg(&wdev->dev, "ignoring event type 0x%02x\n", event->type);
+		return;
+	}
+
+	if (event->code >= XIAOMI_KEY_PRESS_FIRST &&
+	    event->code < XIAOMI_KEY_PRESS_FIRST + XIAOMI_KEY_COUNT) {
+		code = event->code;
+		pressed = true;
+	} else if (event->code >= XIAOMI_KEY_RELEASE_FIRST &&
+		   event->code < XIAOMI_KEY_RELEASE_FIRST + XIAOMI_KEY_COUNT) {
+		code = event->code - XIAOMI_KEY_COUNT;
+		pressed = false;
+	} else {
+		dev_dbg(&wdev->dev, "ignoring key code 0x%02x\n", event->code);
+		return;
+	}
+
+	sparse_keymap_report_event(data->input_dev, code, pressed, false);
+}
+
+static const struct wmi_device_id xiaomi_wmi_keys_id_table[] = {
+	{ .guid_string = XIAOMI_WMI_EVENT_GUID },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, xiaomi_wmi_keys_id_table);
+
+static struct wmi_driver xiaomi_wmi_keys_driver = {
+	.driver = {
+		.name = "xiaomi-wmi-keys",
+	},
+	.id_table = xiaomi_wmi_keys_id_table,
+	.min_event_size = sizeof(struct xiaomi_wmi_keys_event),
+	.probe = xiaomi_wmi_keys_probe,
+	.notify_new = xiaomi_wmi_keys_notify,
+	.no_singleton = true,
+};
+module_wmi_driver(xiaomi_wmi_keys_driver);
+
+MODULE_AUTHOR("Lucy Wong <lucywong2778@gmail.com>");
+MODULE_DESCRIPTION("Xiaomi laptop WMI hotkey driver");
+MODULE_LICENSE("GPL");
-- 
2.56.0

