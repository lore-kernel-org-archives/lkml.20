Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406415;
	b=2NHz7T5FIaC95nJG1X6hMehTJbxATr7fQrjXQRVshXbYOQo3+Ptb8bZGBsxDx0AHCbB9
	 OYf3wqFZatRRH9QWkfGCOxefvj0dgigk4qWpesUjgbeuH2VU/Sf5Ps/B4enlicgoCo1Uc
	 eIQ3IeLyhWer6cU7hEIXFvGJ239FAO4vSyY08Su2a0pfcSQtiq5aDyaiTatDTX7WIhHi/
	 tZhaJX08VizPpqNqUZBAftCETGt8Suk1Uqv2CaeKGTgmiYKYaAxygM5XpE43ZQr86T4Op
	 f1iVJcWLHISxvTepeUoOQRvD/TxFnw97xcu+pJoS0ZAFRFBn+OBm+k8TUCuVfpcvB4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wAdQH2IGSH31UoHUmEyxK0RzQx0sgXpj/hoLrUojf3Q=;
	b=ZgnTZMrViqBhWQI7aLyUvnjJqNXLSnSgPSzlRwcGTVXSUchgTaREkJYbp6tEb8IUXf79
	 dL0NGHvIvxtBjgsLJ1QdNX+dfuZNvFfl7cPV6Z1o9M5xzwMmBoF1w2zz6KBbbI0Latv1W
	 vYJgoXmBhWfvHfbKSO8VufsHJk9UfaAXOPZjDYhXGuXICSJOBZY8EWxw+ayKYhntCS93l
	 UsRKVV8p7U/eA8ghC4UB0vFxWgJfN/JCjp6uaZPsZwQGjSVQf3prPaaGLRDdh5r7DX1PO
	 Ua5apFWNYlCMuVYsUlc6k6vpCgenCJk0yVc/jnjNNFjcJgpuP3I40u0bzM9rCkKHp6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BW/8mezz";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C346606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C346606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BW/8mezz
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b18717a193so267924a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794406415; x=1795011215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAdQH2IGSH31UoHUmEyxK0RzQx0sgXpj/hoLrUojf3Q=;
        b=BW/8mezzqPCTrGCdyyv98/0IeZJTHEgD8xtm6PBMrjjqNr1MANhHQvVrS+vHiLxw6A
         tZluSfjNkwe4wj0jw1o9Suuae888qPOEMjdnF4sdUCKuDDodPXnMH7mJQmSlSn0ZLI0o
         V598yY6gAdD7Gfz38SDUm+WiO7qLYybbr/I3tdtyBh9X5Tpoy2pflxgoggsZ0SM2pFo0
         h0K2SVnDIfGJRPH26eFc1S3MkRldQM9Tt/9yVhJmECrFUPa1ZufaC1FPKltUHzS0vt8D
         iyVJOKjOZEZ9ItwafjCHlOE4p/JIb54mLPvrU4zWaaa27WDfWbisrXDFIewALjfuwpqO
         er+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406415; x=1795011215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAdQH2IGSH31UoHUmEyxK0RzQx0sgXpj/hoLrUojf3Q=;
        b=0qMhH8qx6ebd57gaqBgmMXv/vptxjPjm25G5qmn3froVN5lZRfH4VdKFxYcGwaeW/B
         pc00v2v8GhuwAUR86znJG8W9EdR6xr/zwgr9ikQBONE6kbAY4piN3sEpdGUQh2jHNFS1
         lvcfIgdwKeUzmlbEw5ryLNE+EJVV63+p8gFB6DBq7NER3h2Vec/NcRueZJdRSEGDACrS
         nIvhhWTnrvX4yV0I/GgCRs4hpGPR5Dek0rWBwuDovIu03YUdv5oKm7tN/hfc2rfVOvw0
         TqO5T960SGxb9bwZuBnf4JqKdDh7LslWzd3Ez5p8gdQDVYfd5Owbx16H5Rg2rNQ08Apw
         yWbA==
X-Forwarded-Encrypted: i=1; AL+hErH1KOBHQ5BAoRHq2MmEQKtAhdgYuKLXLrZzEwFwAyNTNSvcPgjHAlz447s3M71o4as5tcQjyFkdevj2nGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NAeNmVR6IdrErbQMDCP82ZAjCQQp8Hc9ysLL+CQ/VDrDXiAag
	tZ4EDRpVXxWTNmqu8YXo4FnQT7hGwNefhe5oKRPW+06nxmDEUbr4Wlvm
X-Gm-Gg: AYBFou0kEPuEsEHiwTKPywEO101FcQjDhCK49NemkJ3PH3pglP2YefV1lvkp/YTFwqn
	e+Ne11Z72CuAzMlBi8zIiteTB+X+oOM8wJk6oXz3kuOp9DgLeK7fNB6ofI2aWF9AgCGO1Si0aVs
	KVJ3lRhPwcsYu6Xs7qoTvO1gvQ4iSwRwEBM/8jq0Lr96cxA64YEOdxMjYlHZDb0qikb0QfUO2cv
	8fA9HC+d7+7QvKTrEz9nc/p878RyoGc6E26zpeOUucZmED2luvA/v0PCiADOCQ42H2Ta+b3AfQI
	KZj/cl1cSexMJvt4PGTXydu1j8KffN45gxoK8TTvknH7wVLmh1khmYYDh+KUKvlh/LPWHdhouzz
	7kV9qvgqNg4VgLZkjVeV7E1CLhPRoxqSqnCOR3LLOafUsq1otyir2Rn0uFsUCr+EwSpG0SukZkK
	MJS/al4tM13iq+narMpwui7tDywEuFAghpEZlFB1xAmTT3yR6VysVedopbwnNb8LO19vZEAqzvJ
	whG/CH9LcsRohfLaWOuU7EAEC2D6I1ZVZ8OfWA1j2e52Lj+3+GZ6XZiaDwr+sCN4ppnovL6XkBL
	AQM=
X-Received: by 2002:a17:90b:288c:b0:3ab:189b:6981 with SMTP id 98e67ed59e1d1-3b182f24a43mr2114158a91.48.1794406414639;
        Wed, 11 Nov 2026 06:13:34 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db319bdsm4789970a91.6.2026.11.11.06.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:13:33 -0800 (PST)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	okluar <okluar@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v16 4/6] platform/x86: redmi-wmi: Drop redmi-wmi driver
Date: Wed, 11 Nov 2026 22:12:24 +0800
Message-ID: <20261111141226.9482-5-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111141226.9482-1-qby140326@gmail.com>
References: <20261111141226.9482-1-qby140326@gmail.com>
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

The redmi-wmi driver is no longer needed because its functionality
has been superseded by the new generic bitland platform driver.
All supported Redmi laptop models are now handled properly via the
updated WMI interfaces in bitland-mifs-wmi.

Remove the obsolete code, Kconfig entries, and Makefile references
to clean up the platform directory.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 MAINTAINERS                      |   6 --
 drivers/platform/x86/Kconfig     |  13 +--
 drivers/platform/x86/Makefile    |   1 -
 drivers/platform/x86/redmi-wmi.c | 154 -------------------------------
 4 files changed, 5 insertions(+), 169 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b3307cbb60c6..bd31e734669e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23692,12 +23692,6 @@ S:	Maintained
 T:	git https://github.com/pkshih/rtw.git
 F:	drivers/net/wireless/realtek/rtw89/
 
-REDMIBOOK WMI DRIVERS
-M:	Gladyshev Ilya <foxido@foxido.dev>
-L:	platform-driver-x86@vger.kernel.org
-S:	Maintained
-F:	drivers/platform/x86/redmi-wmi.c
-
 BITLAND LAPTOP DRIVER
 M:	Mingyou Chen <qby140326@gmail.com>
 M:	Ilya Gladyshev <ilya.gladyshev@linux.dev>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index b2c6cc923694..c32f8cb6116d 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -79,16 +79,12 @@ config XIAOMI_WMI
 	  be called xiaomi-wmi.
 
 config REDMI_WMI
-	tristate "Redmibook WMI key driver"
+	tristate "Redmibook WMI key driver (DEPRECATED)"
 	depends on ACPI_WMI
+	depends on HWMON
 	depends on INPUT
-	select INPUT_SPARSEKMAP
-	help
-	  Say Y here if you want support for WMI-based hotkey events on
-	  Xiaomi Redmibook devices.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called redmi-wmi.
+	depends on LEDS_CLASS
+	depends on POWER_SUPPLY
 
 config GIGABYTE_WMI
 	tristate "Gigabyte WMI temperature driver"
@@ -108,6 +104,7 @@ config BITLAND_MIFS_WMI
 	depends on INPUT
 	depends on LEDS_CLASS
 	depends on POWER_SUPPLY
+	default REDMI_WMI if REDMI_WMI
 	select ACPI_PLATFORM_PROFILE
 	select INPUT_SPARSEKMAP
 	help
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 88f45e03ee19..77df59b5f40a 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -9,7 +9,6 @@ obj-$(CONFIG_HUAWEI_WMI)		+= huawei-wmi.o
 obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
 obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
-obj-$(CONFIG_REDMI_WMI)			+= redmi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
 obj-$(CONFIG_BITLAND_MIFS_WMI)		+= bitland-mifs-wmi.o
 
diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi-wmi.c
deleted file mode 100644
index a8eabd93ff3e..000000000000
--- a/drivers/platform/x86/redmi-wmi.c
+++ /dev/null
@@ -1,154 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* WMI driver for Xiaomi Redmibooks */
-
-#include <linux/acpi.h>
-#include <linux/bits.h>
-#include <linux/device.h>
-#include <linux/input.h>
-#include <linux/input/sparse-keymap.h>
-#include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/unaligned.h>
-#include <linux/wmi.h>
-
-#include <uapi/linux/input-event-codes.h>
-
-#define WMI_REDMIBOOK_KEYBOARD_EVENT_GUID "46C93E13-EE9B-4262-8488-563BCA757FEF"
-
-#define AI_KEY_VALUE_MASK BIT(8)
-
-static const struct key_entry redmi_wmi_keymap[] = {
-	{KE_KEY, 0x00000201,	{KEY_SELECTIVE_SCREENSHOT}},
-	{KE_KEY, 0x00000301,	{KEY_ALL_APPLICATIONS}},
-	{KE_KEY, 0x00001b01,	{KEY_CONFIG}},
-	{KE_KEY, 0x00011b01,	{KEY_CONFIG}},
-	{KE_KEY, 0x00010101,	{KEY_SWITCHVIDEOMODE}},
-	{KE_KEY, 0x00001a01,	{KEY_REFRESH_RATE_TOGGLE}},
-
-	/* AI button has code for each position */
-	{KE_KEY, 0x00011801,	{KEY_ASSISTANT}},
-	{KE_KEY, 0x00011901,	{KEY_ASSISTANT}},
-
-	/* Keyboard backlight: Off / Auto / Low / High (new state in byte 2) */
-	{KE_KEY, 0x00000501,	{KEY_KBDILLUMTOGGLE}},
-	{KE_KEY, 0x00800501,	{KEY_KBDILLUMTOGGLE}},
-	{KE_KEY, 0x00050501,	{KEY_KBDILLUMTOGGLE}},
-	{KE_KEY, 0x000a0501,	{KEY_KBDILLUMTOGGLE}},
-
-	/* Xiaomi G Command Center */
-	{KE_KEY, 0x00010a01,	{KEY_VENDOR}},
-
-	/* OEM preset power mode: 1=Balanced 2=Silent 3=Turbo 4=Full speed */
-	{KE_KEY, 0x00011601,	{KEY_PERFORMANCE}},
-	{KE_KEY, 0x00021601,	{KEY_PERFORMANCE}},
-	{KE_KEY, 0x00031601,	{KEY_PERFORMANCE}},
-	{KE_KEY, 0x00041601,	{KEY_PERFORMANCE}},
-
-	/* Fn Lock state: 1=on 0=off */
-	{KE_KEY, 0x00000701,	{KEY_FN_ESC}},
-	{KE_KEY, 0x00010701,	{KEY_FN_ESC}},
-
-	/* Fn+`/1/2/3/4 */
-	{KE_KEY, 0x00011101, {KEY_F13}},
-	{KE_KEY, 0x00011201, {KEY_F14}},
-	{KE_KEY, 0x00011301, {KEY_F15}},
-	{KE_KEY, 0x00011401, {KEY_F16}},
-	{KE_KEY, 0x00011501, {KEY_F17}},
-
-	{KE_END}
-};
-
-struct redmi_wmi {
-	struct input_dev *input_dev;
-	/* Protects the key event sequence */
-	struct mutex key_lock;
-};
-
-static int redmi_wmi_probe(struct wmi_device *wdev, const void *context)
-{
-	struct redmi_wmi *data;
-	int err;
-
-	/* Init dev */
-	data = devm_kzalloc_obj(&wdev->dev, *data);
-	if (!data)
-		return -ENOMEM;
-
-	dev_set_drvdata(&wdev->dev, data);
-
-	err = devm_mutex_init(&wdev->dev, &data->key_lock);
-	if (err)
-		return err;
-
-	data->input_dev = devm_input_allocate_device(&wdev->dev);
-	if (!data->input_dev)
-		return -ENOMEM;
-
-	data->input_dev->name = "Redmibook WMI keys";
-	data->input_dev->phys = "wmi/input0";
-
-	err = sparse_keymap_setup(data->input_dev, redmi_wmi_keymap, NULL);
-	if (err)
-		return err;
-
-	return input_register_device(data->input_dev);
-}
-
-static void redmi_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
-{
-	struct key_entry *entry;
-	struct redmi_wmi *data = dev_get_drvdata(&wdev->dev);
-	bool autorelease = true;
-	u32 payload;
-	int value = 1;
-
-	if (obj->type != ACPI_TYPE_BUFFER) {
-		dev_err(&wdev->dev, "Bad response type %u\n", obj->type);
-		return;
-	}
-
-	if (obj->buffer.length < 32) {
-		dev_err(&wdev->dev, "Invalid buffer length %u\n", obj->buffer.length);
-		return;
-	}
-
-	payload = get_unaligned_le32(obj->buffer.pointer);
-	entry = sparse_keymap_entry_from_scancode(data->input_dev, payload);
-
-	if (!entry) {
-		dev_dbg(&wdev->dev, "Unknown WMI event with payload %u", payload);
-		return;
-	}
-
-	/* AI key quirk */
-	if (entry->keycode == KEY_ASSISTANT) {
-		value = !(payload & AI_KEY_VALUE_MASK);
-		autorelease = false;
-	}
-
-	guard(mutex)(&data->key_lock);
-	sparse_keymap_report_entry(data->input_dev, entry, value, autorelease);
-}
-
-static const struct wmi_device_id redmi_wmi_id_table[] = {
-	{ WMI_REDMIBOOK_KEYBOARD_EVENT_GUID, NULL },
-	{ }
-};
-
-static struct wmi_driver redmi_wmi_driver = {
-	.driver = {
-		.name = "redmi-wmi",
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-	},
-	.id_table = redmi_wmi_id_table,
-	.min_event_size = 32,
-	.probe = redmi_wmi_probe,
-	.notify = redmi_wmi_notify,
-	.no_singleton = true,
-};
-module_wmi_driver(redmi_wmi_driver);
-
-MODULE_DEVICE_TABLE(wmi, redmi_wmi_id_table);
-MODULE_AUTHOR("Gladyshev Ilya <foxido@foxido.dev>");
-MODULE_DESCRIPTION("Redmibook WMI driver");
-MODULE_LICENSE("GPL");
-- 
2.56.0

