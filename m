Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A1D1DB95E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473157; cv=none; b=EsJqHP8C70MmGjKMz91rHdE6IGbJs7lRdLQ3rJvteqinoSja7nUhFa/UZZVLfch2ymmDGeS329yrPvnDJ4irqF/actumPnwl60KZp3tLim6+mMGW/zCxamWY4nyY7M31v7c7i4EVEBL/R79pSofl7+JorsRBS7pimVQqvNrr3pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473157; c=relaxed/simple;
	bh=nLCM+H01acJW7djOiwVelF0d3tatgHTkInXCfk1UZoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tQGnqYtrKUFPSwiN5cBf/irr0Wij/gn0OhjFbNH7F6I3J6sUnRri4TtMOXQLnnDENP9yO+O23hgj7zVdIxGFQ0SgcF1BtnhHnWrJ1FZIq6MUmeFqiRyCvtqjgEHs5R6lSSTDlo3zEd7ThARro3Zj2omNDPJaw9AQds3qwuYF/hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ma0cwhhq; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ma0cwhhq"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso5102693e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791473144; x=1792077944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QT27KwI7VJcfAd/ks3Hng+PfpNIEJAOZ6YXbRmUISPw=;
        b=ma0cwhhq6sMEu2ZhzfXjruc+j2YlISSZLf8OngWI1uQx8xSwdCET7+1h4kIb1lDPsF
         X2PeQ3U9zJqjp5jagdaN9ll8EJ4+VT55C8El17zFS/2aMzZNuIAKIHYfXtXxT3XF5tsZ
         XHjUScU6ELmDhK2wu0HSChAa+sqYaPa11QBdLqBWGvERoKNGcHUMJa1ri0B+fMlRgAji
         iiZizW5OYKVNeP9MYYK7bhhQxDeZE1uKLAgSSZbl+LhjTX8D29IWDgJRlJmG80Ulp/rd
         XbM0lvI4hMwRLnEiTT/N1tGHPTyA5iyao75hj2lI4OdZ+AVjWyCjdC8OxikS5GgGagNf
         mLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473144; x=1792077944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QT27KwI7VJcfAd/ks3Hng+PfpNIEJAOZ6YXbRmUISPw=;
        b=UJb3Z/aUzHkuTyyt2AAV+VQPzLUljw8ZI4ktmGW8qlGtuXYRVLGS/jYROIMpoAYLos
         UgzJaixJYH5CCJX1CS0cgZ7puaeQXlPaMba4Py5GUWPCjDNPhtiSP8u0sV9SspwdjO/S
         q2I3knghj+o6hFg62rhOx2duE4gP9/GHubXsygc/QTYkwmF60D37Bqx98xzqHGfmUw6I
         HCF6DP3UiPHGtLgLVtZRLzqW7o9ynuHuWdEDtb0wduwIrbWbVn0fckUQ5XHLfCibRb28
         XIZhdVV0CyKWN28S0yx/Pq1DLPO2LBxHv3wWNuHrDQHEXxocv33pNnpv1OhuE3hZadHG
         8H9Q==
X-Gm-Message-State: AFq9FYKwKuWhY1mPp8bP9T53jQte+XnPXNcgEwCJ5Psx9aKmuIZqZrt/
	g/aAyC7tAQtDLhIteaFCUJGT6/0gC+yd8B8aQ7IWQBeyFuf397KIqLgHWWoD75751HA=
X-Gm-Gg: AYBFou3Ex/bJ1cqE5qagGSqCHLmbZ22jSmYEBaIjQ60IY51roWlKXpYtFQKo5uvGmkd
	8UdAeTeFLBKECJyUOa1Hyy5VucHL9ItW29+BEhO1BBahDyV20Mts/bcgnfYsyKXoXCiZ0NWj2Zb
	Ft7Rn2KcWIGrmE/KAV0eBn1wN069SLRneXICbjDNwc8SqLxaCGV+08G7X2dwtq2gPDTak7Zfy2H
	GFXpb7stOctoM3Mz+p9YqFM3cftY7M0gs6IsVnvBemVHmHpBgmG60kFyo3vg+eiKlBVUu8KGSei
	6qMEN271XD7hIcecGwJhidAks8wkUsbrjAzAun0DJobfBkz9D/8RXLR6iLFuVcmZGvl3IqO4FZA
	iqrdz+bvHErlWsnI5wv/+6Ph5iEbm/iKp0t5wqNog1s7lfOBrUovH2UyHHelIHUznqLMsuv9lS6
	1XRwjGyTKAGhCr9518rVBkFcl35nX+1Gk+MGuZDhWrPS16LR9yc9oOj0JpMzWDn0ZhUqYvwriah
	mRat/pUO0W4EsnUha4k60TQEy1q2nHgHDonoN9hOeYVRNz3zE2FcO9Ofmh2iPcUzgCi
X-Received: by 2002:a05:6512:12cc:b0:5bc:cc46:1849 with SMTP id 2adb3069b0e04-5bcd074ec88mr2254447e87.54.1791473144030;
        Thu, 08 Oct 2026 08:25:44 -0700 (PDT)
Received: from wildarch.lan ([109.72.228.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3074977sm1372174e87.13.2026.10.08.08.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:25:43 -0700 (PDT)
From: Anton Karasev <uselessfire@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	W_Armin@gmx.de,
	qby140326@gmail.com,
	ilya.gladyshev@linux.dev,
	chris@miget.com,
	kento@kekto.ru,
	wolf109909@outlook.com,
	vlku.milos.fun@gmail.com,
	btx342@gmail.com,
	zsanya322@gmail.com,
	i@rsplwe.com,
	bozhenpeng93@gmail.com,
	martiya.ar@gmail.com,
	nika@nikableh.moe
Subject: [PATCH] platform/x86: bitland-mifs-wmi: Only expose kb_mode when it is supported
Date: Thu,  8 Oct 2026 18:25:41 +0300
Message-ID: <20261008-bitland-kb-mode-v1-uselessfire@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WMI_FN_RGB_KB_MODE is the RGB keyboard mode on the Bitland machines this
driver was written for, but the driver also binds to Xiaomi laptops with
the same WMI interface, where the function is the battery interface of
the firmware. kb_mode_store() sends the mode in payload[0] only. On the
Redmi Book Pro 16 2024 (TM2309), and per Milos Vlku's reading of its
ACPI tables on the Redmi Book Pro 14 2024 (TM2307), payload[0] selects
the subcommand there, and "fixed" (2) is the charge limit; as the value
field stays 0, the SET turns the limit off. Writing "fixed" to kb_mode
therefore turns off the battery charge limit, even where the write
reports an error.

That firmware does not handle the GET that kb_mode_show() sends: the
reply is all zeros, and with commit 23cc56f6dea6 ("platform/x86:
bitland-mifs-wmi: Detect failed function calls") bitland_mifs_wmi_call()
fails with -EIO for it, so kb_mode cannot be read there anyway.

Do that GET once at probe time and only expose kb_mode if it succeeds.
A DMI list would have to name every Xiaomi model with this interface;
the failed GET covers any firmware that does not implement it. On
machines where kb_mode can be read, nothing changes. The attribute also
disappears from the event device, where it never worked.

Fixes: dc1ec4fa86b2 ("platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver")
Link: https://lore.kernel.org/all/20260930015058.3076905-1-uselessfire@gmail.com/
Link: https://lore.kernel.org/all/CAObHBTwnv+kEaFdCp+cr31HtdSo3CaRq84T8vr-Pm75yZMTHqQ@mail.gmail.com/
Signed-off-by: Anton Karasev <uselessfire@gmail.com>
---
This is against pdx86 for-next and relies on 23cc56f6dea6, which is
not in mainline yet: without it the GET "succeeds" on that firmware and
kb_mode stays. So please take it via for-next only. Stable kernels
since 7.1 have the same problem, but a backport would first need
23cc56f6dea6 together with 4cfc3631d4ca and, for the Xiaomi models,
Chris's "Only check the function id of GET responses".

It does not depend on Mingyou's v9 series. Either can go first: the
other then applies with "git am -3", because this patch replaces the
ATTRIBUTE_GROUPS(laptop) line, which is context in the keymap hunk of
v9 2/5.

Tested on the TM2309: for-next as is shows kb_mode and reading it fails
with -EIO; with this patch kb_mode is gone, and gpu_mode, fan_boost and
platform_profile are unchanged.

Mingyou, Rsplwe, Bozhen: on your Bitland machines kb_mode should still
be there, read back the current mode, and writing a mode should still
change the keyboard lighting. If it is gone, loading the module with
dyndbg=+p prints the error from the probe. Milos, Junwen (TM2307),
Aleksandr (TM2309), Chris, Kento, Yuming (Xiaomi Book Pro 14): on your
machines kb_mode should be gone; if it is still there on the Book Pro
14, its firmware answers that GET, and this check does not cover it.

 drivers/platform/x86/bitland-mifs-wmi.c | 57 ++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index dd1648b7d..d95a02159 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -155,6 +155,7 @@ struct bitland_fan_notify_data {
 struct bitland_mifs_wmi_data {
 	struct wmi_device *wdev;
 	struct mutex lock;		/* Protects WMI calls */
+	bool has_kb_mode;
 	struct led_classdev kbd_led;
 	struct notifier_block notifier;
 	struct input_dev *input_dev;
@@ -520,26 +521,38 @@ static const char *const kb_mode_strings[] = {
 	"custom",	/* 3 */
 };
 
-static ssize_t kb_mode_show(struct device *dev, struct device_attribute *attr,
-			    char *buf)
+static int bitland_kb_mode_get(struct bitland_mifs_wmi_data *data, u8 *mode)
 {
-	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_GET),
 		.function = cpu_to_le16(WMI_FN_RGB_KB_MODE),
 	};
 	struct bitland_mifs_output res;
-	u8 mode_val;
 	int ret;
 
 	ret = bitland_mifs_wmi_call(data, &input, &res);
 	if (ret)
 		return ret;
 
-	mode_val = res.data[0];
-	if (mode_val >= ARRAY_SIZE(kb_mode_strings))
+	if (res.data[0] >= ARRAY_SIZE(kb_mode_strings))
 		return -EPROTO;
 
+	*mode = res.data[0];
+
+	return 0;
+}
+
+static ssize_t kb_mode_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	u8 mode_val;
+	int ret;
+
+	ret = bitland_kb_mode_get(data, &mode_val);
+	if (ret)
+		return ret;
+
 	return sysfs_emit(buf, "%s\n", kb_mode_strings[mode_val]);
 }
 
@@ -604,7 +617,23 @@ static const struct attribute *const laptop_attrs[] = {
 	&dev_attr_fan_boost.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(laptop);
+
+static umode_t laptop_attr_is_visible(struct kobject *kobj,
+				      const struct attribute *attr, int n)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(kobj_to_dev(kobj));
+
+	if (attr == &dev_attr_kb_mode.attr && !data->has_kb_mode)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group laptop_group = {
+	.attrs_const = laptop_attrs,
+	.is_visible_const = laptop_attr_is_visible,
+};
+__ATTRIBUTE_GROUPS(laptop);
 
 static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, WMI_EVENT_OPEN_APP, { KEY_PROG1 } },
@@ -666,6 +695,7 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 		.default_label = ":" LED_FUNCTION_KBD_BACKLIGHT,
 		.devname_mandatory = true,
 	};
+	u8 kb_mode;
 	int ret;
 
 	drv_data = devm_kzalloc(&wdev->dev, sizeof(*drv_data), GFP_KERNEL);
@@ -699,6 +729,19 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 		return input_register_device(drv_data->input_dev);
 	}
 
+	/*
+	 * WMI_FN_RGB_KB_MODE is the RGB keyboard mode on the machines this
+	 * driver was written for, but some firmware uses the function for
+	 * something else and does not answer this GET. On some Xiaomi models
+	 * it is the battery interface, where the SET that kb_mode_store()
+	 * sends for "fixed" turns the charge limit off. Only expose kb_mode
+	 * when its GET works.
+	 */
+	ret = bitland_kb_mode_get(drv_data, &kb_mode);
+	if (ret)
+		dev_dbg(&wdev->dev, "kb_mode not supported (%d), hiding it\n", ret);
+	drv_data->has_kb_mode = !ret;
+
 	/* Register platform profile */
 	drv_data->pp_dev = devm_platform_profile_register(&wdev->dev, DRV_NAME, drv_data,
 							  &laptop_profile_ops);

base-commit: 98f039265e580291d5e76a11b2072541fbb1c393
-- 
2.56.0

