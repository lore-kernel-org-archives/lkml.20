Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9704CB8C5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861866; cv=none; b=Pqph5uRrFdEjIEliT4qNuWuKlGdFlbKMc7EKcVkEWKnzkWcYxH4akCQ59vwRrFK538tBjsMyVEuJvYyrcY3+3I9D2fEwE8TCF0s6dJQC2z1/00GVTiyMoU5L7oXCX9qu3WmNoHxeAPUkDyqey0fqE5KaHnlSTKVCHrojIXRB+tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861866; c=relaxed/simple;
	bh=pdAyIm7DduN4kHdbHQVf5DkpIzkCtbuiT4WggJSeB88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JQdgGqmGK+nShS3CDFWGEuqmC41TsICqxYMw2wpzLHkwYMEDDJcC2oJTleuXy2APj4wgP0/+iqE+zHUDVT3wb6TuPhtNEgTO29Mv4MVjioYPYMgZEDyuBk05Y/vRLIoGlHVZLvJOQMFF7OQhg8yQTGgfwO3nlxAkWcfV0AgBNXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8REmkuo; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8REmkuo"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e5eso3328406a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790861862; x=1791466662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hr7k4+LZuK0FJ3vzA+njsdQXRHAEEuUlTuj8Puz32NA=;
        b=P8REmkuoxzMDmxQyOeU4a0zVVVYX2b6jJ72nfV0bzM+mbGFDqMEETod4x+rnGq+AR6
         xAlkPQUIGU1KFRa77o1Pv4GOef6yNPEtP9ul2u4Jwe1gVp3xTas80auxGKgjDqwpZJ6R
         OJhMDmS13HFdYbRO2N/5HbVbqFQiIfQrTlSyFXp6V94ySYoYWd0Xj2L5N2hjEWqIvcU8
         CLjvsT/G5zGPnILirMTAAMalCUOU/SPxPI+HEpKMSBgmITb2nP0ZuUZw+B5wQj7akWwx
         Cy83Mr00HSnfsOlaDkO4MoMc+1mR67x+nKFalg8/+7X5bn8budJ4yVpnWyc4XijaJCkA
         AkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861862; x=1791466662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hr7k4+LZuK0FJ3vzA+njsdQXRHAEEuUlTuj8Puz32NA=;
        b=QKwAHaKM3b1XMUiDh3V5lZdBlRTDGie0qhCLlVZU9nmM1mC2uN0mgG+kVaNPneSRw/
         QcHPNoMRRppEwS8G5N9LEbDOc5TpvaFdid2cTH8VzNIEp3Qa2sVnb4/Bg2fAp7kwd3aL
         wUrtaWvlaFm2zVmRez/QiX6h1NDZR4TTpNIRJ3pWW9oZ+3t2fZK4X8DP4D0ajhVp5fyM
         eqp5aO+d74EeFhlLDzgUZnFns4sVr7BP19LOSuIUnbEu9PhOGwyM9ebFTIttAApFsVDs
         sM910Pnp4q16ZPK0Q40DgNL+2EcE0Xz3cta6nvXhclZhLfJ4Farf3c0sZvqF7PybtqOA
         naQA==
X-Forwarded-Encrypted: i=1; AKwUvBxnDnHVbUrxUChq7iQExYtJjbft88kD7v3qhwibw7SC6l7EIoEGVBs6OuOmlXi0bIqFtPuUPLii11EWtRU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVmJZ/y3ao8vR/FvOFLE/ptYCZwfhOOiF/WT6oOh7H9hKJiq4D
	mYwMwA/rPaSSjSIV5cSTlyKRpKqk/GdTJVl3uPIwYye7DayIGBMiB2jc
X-Gm-Gg: AYBFou1ku26pmYmORhkpEdkrXug4/T66066Q5tjOpPWKZC/ec0UG9C1fMwRZVpPOpn8
	hS4UQxOAYRsFDLBugpGI3F3IJQQiLwEfMvRkz/p+hvLL2uSPFR7MqgtSMmoFvEO6E9hSa2MSvs2
	FzKQ0gvGUl9osClhFxLCA/+ACL6ERVH1y2USOnuSPsy6eZzCDu1RK0y/4D92CqWk/ve8KmwTfze
	bXRaLayfAOpo1aN/CaNUKvAn5NazCkAwQ03Z8SrQ659qJjDx/DCxvK81RqIFsMCQards78EwwS5
	C/lyQ/ohEmKuzEpBy9q4cgDq4U95hImF9B75XOTs4zP+gGh2GVQPnc54ezzfiGnKNUfgjt2xe9o
	pcPDab9ingBX7fm0CqDGetEzfyE1K9TkaaoRpqhjLU7zM6MOZNYd66wurnGd/K8MuY4XUuBjX7Y
	sdYGehobnoxkZJ4QWyIHFlZ05JNz4ZTH+9dBqDWDZrkh/EWU1KREbamAp/sSW1RgemU9w6gkU=
X-Received: by 2002:a17:90b:2b50:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3a5147a3c9dmr912728a91.8.1790861861511;
        Thu, 01 Oct 2026 06:37:41 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46b6bc6sm4715737a91.6.2026.10.01.06.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:37:41 -0700 (PDT)
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
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v9 4/5] platform/x86: redmi-wmi: Drop redmi-wmi driver
Date: Thu,  1 Oct 2026 21:37:04 +0800
Message-ID: <20261001133705.69244-5-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001133705.69244-1-qby140326@gmail.com>
References: <20261001133705.69244-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
 drivers/platform/x86/Kconfig     |  12 ---
 drivers/platform/x86/Makefile    |   1 -
 drivers/platform/x86/redmi-wmi.c | 154 -------------------------------
 4 files changed, 173 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7592bfa24062..3afce70cb977 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23036,12 +23036,6 @@ S:	Maintained
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
index 45f15f93afa7..02e7ac00ac4f 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -90,18 +90,6 @@ config XIAOMI_WMI
 	  To compile this driver as a module, choose M here: the module will
 	  be called xiaomi-wmi.
 
-config REDMI_WMI
-	tristate "Redmibook WMI key driver"
-	depends on ACPI_WMI
-	depends on INPUT
-	select INPUT_SPARSEKMAP
-	help
-	  Say Y here if you want support for WMI-based hotkey events on
-	  Xiaomi Redmibook devices.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called redmi-wmi.
-
 config GIGABYTE_WMI
 	tristate "Gigabyte WMI temperature driver"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index a877acd937cd..567aabdcb58a 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -12,7 +12,6 @@ obj-$(CONFIG_HUAWEI_WMI)		+= huawei-wmi.o
 obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
 obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
-obj-$(CONFIG_REDMI_WMI)			+= redmi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
 obj-$(CONFIG_BITLAND_MIFS_WMI)		+= bitland-mifs-wmi.o
 
diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi-wmi.c
deleted file mode 100644
index cc82ef502002..000000000000
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
-	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
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
2.55.0

