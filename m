Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C57457E60
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791727132; cv=none; b=jQjt5pS3Gxzk76a3ugwp7WglQdKbVciZzT1+pd33mjkOTMf3VTN4BHJE+zD9eAkhrOPIzt9VeGBKf/p55T3xxbusA9t8n6BLAxf7aXBxGdm2seVvKfCYRTWqomxqbs99CZR3pylu9MBPz6EyHnRtc06UrBAXeJ9UfpTB4I3XWJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791727132; c=relaxed/simple;
	bh=hNVxdtsA+cuaEkYdlgBR1kYeiKVJ8dcmCnhQbXTSTZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BjLlIO76uz2+dLC7smr6XchljsvufeeaMIzcjm5ZmcQFoB94Mcoln1lcry9Mw1WVwjn2FiwstWt2vgyAcHMMaHBUMZ5gaa1glMGggOJJWeD3DVRhn7+m5b5yTbdMs/sEYrt94jaXYMyNHhshNy8w7omBYF9bzLchsfpynduHf2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7D2lHku; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7D2lHku"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a706146559so667554a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791727126; x=1792331926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8crKPVxpR75PZr278VYF2/V7T1vouNEFR+ch2hfe/Ug=;
        b=k7D2lHkuIYCRSYkB7f/g7lUp8rWpqfkysDAgoA3xyiOFrMc5D6QfcGhWbVIapOZkGL
         1y7G4WMrbSSVqZQuUJVEhzDC6UsAqFcyZD9SHltygSHgIwbqHBezcop3G9Ogwpov0zOa
         8pZ9TRlPwkIHuOrK7PXZZuaICOqt09syT7KXSYQ/l/cTdy11VVEEccLev81nXjt9V9KV
         rfVPD89t7ZCMIiznW/zq2pqJQEv4QWHHTVJzwEkJZ7zWXOwiy9+IiEMKDb8C5lWLFn1n
         7TtQO62uYKpglpzNPdfXvs2gbBkzGfpH809jB/2kljPC3mW4wPRAy6f+1fnypJlRY5Nn
         rlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791727126; x=1792331926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8crKPVxpR75PZr278VYF2/V7T1vouNEFR+ch2hfe/Ug=;
        b=P8ZkpjiNwlSEO6t23OvWizgMwEljuevuiesa4NtFhEMr/EEIco7ORnFCwhEr5rlFqL
         dcuQv18vtc4P4lTZvvHccf6bdiDO5EPurcE7kB9Uh9y+OxffLrL1xFCiXTzd6Dx8qzCy
         wT/e9EtSAMXlk5rOtEUgSSUDI6CrutqR81b1qCMlSWVE4lkm7+ZhMhlC7+NdEd2Rp2pO
         VsVm602FPQ1T0Q/MCm8TD5P7aWZvbA6i7ES17Lb3ZDMhxQO+t0liXlh+rqtNTw5DW6eD
         hgpDRkRszTPMD8S5ybTWGxQKXdOrS5LVebD/A5VkOEYBAHqxg6tg2z9faIfVH129YAJw
         k5LQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYQtwl51bsgDUJnQ4wEzDEJg6FXOKkEK5MtvjKFJOLhaxnbmcwR92FBfSsOSo/q8uDWYES43PN8/3jDpw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIE39Z69Nz3eEgVgfX3ZW+V0NRYyrDYfNRdrTwQQUPan204gbZQ
	QAO+L6aHBLux/0ZM2zUYQr1aA31rfXZUofk0bTUJbmMacsxJr3s2Faf+
X-Gm-Gg: AYBFou0kuhvhoMnqJI1bq1kcnDyau4dOpW844UrNA0TtG8OsY2QGoT8F7mVQZjO5xWs
	FmN7vR3xwHz9kS0AiafJHAbIIcDnmsbr57NZbuzgLXm7IDfH8C28VIiTtm5gRU/PQvFdqqegAoX
	OfMwPaOaIDFZgDMwszN3Wg3YAV/g5neA/AHFRNHppw/6eaRNf/RMXV+Duvhbe/aCbb2GaNPtBkK
	DkAbSO4dsj53dEc3HembYzqiuSuNcLA+YVJC4fv1vyL6q80j/6VQE/SQJwg6vCVKzCGgN1h25p5
	FK6IAA7e1xEiVjW3mWfvAlJOsyjuFwEvtNy98W3gCgGXV112yFPojCrUlGKgLPTtvwVsA7wZL4c
	EnaoCBEBBmecZ3sFQTYrAWLXUCIo8uKaudpZCRDs7CMNl3nGzd/+n1tz0fFPJCNF0Pugxk21aeD
	Yjlrx2JNmwl81mFB6FkSMaXaLptX5H0/T2kTpQxip85ps4EPuBvXTNuPBrCk2SpxekiM0zwG7S1
	Q==
X-Received: by 2002:a17:90b:3b82:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3ab3a94f426mr6528056a91.24.1791727126176;
        Sun, 11 Oct 2026 06:58:46 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371c32cesm11831648a91.16.2026.10.11.06.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:58:45 -0700 (PDT)
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
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v10 5/5] platform/x86: bitland-mifs-wmi: Add quirks table
Date: Sun, 11 Oct 2026 21:57:48 +0800
Message-ID: <20261011135748.11792-6-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011135748.11792-1-qby140326@gmail.com>
References: <20261011135748.11792-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MIFS WMI interface is shared by several Bitland ODM laptops which
differ in the layout of the performance mode values of
WMI_FN_SYSTEM_PER_MODE and in the capability checks.

Introduce a quirks table to support multiple machine families without
sprinkling model checks over the driver.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 137 ++++++++++++++++--------
 1 file changed, 95 insertions(+), 42 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 93a519b96189..b3d615a94e8b 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -12,6 +12,7 @@
 #include <linux/bits.h>
 #include <linux/container_of.h>
 #include <linux/dev_printk.h>
+#include <linux/dmi.h>
 #include <linux/device.h>
 #include <linux/device/devres.h>
 #include <linux/err.h>
@@ -84,6 +85,60 @@ enum bitland_mifs_power_profile {
 	WMI_PP_FULL_SPEED	= 3,
 };
 
+struct bitland_mifs_wmi_data;
+
+/*
+ * Value layout of WMI_FN_SYSTEM_PER_MODE.
+ */
+struct bitland_profile_mode_map {
+	u8 balanced;
+	u8 performance;
+	u8 quiet;
+	u8 full_speed;
+};
+
+static const struct bitland_profile_mode_map bitland_mode_map = {
+	.balanced	= WMI_PP_BALANCED,
+	.performance	= WMI_PP_PERFORMANCE,
+	.quiet		= WMI_PP_QUIET,
+	.full_speed	= WMI_PP_FULL_SPEED,
+};
+
+struct bitland_profile_entry {
+	enum platform_profile_option profile;
+	u8 wmi_val;
+	bool no_set;
+};
+
+struct bitland_mifs_quirks {
+	const struct bitland_profile_entry *profile_entries;
+	size_t num_profile_entries;
+
+	bool return_code_at_end;
+	bool skip_ac_type_check;
+
+	/* Accept return value 0 on SET wmi functions */
+	bool accept_zero_function;
+};
+
+static const struct bitland_profile_entry default_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,            WMI_PP_QUIET },
+	{ PLATFORM_PROFILE_BALANCED,             WMI_PP_BALANCED },
+	{ PLATFORM_PROFILE_BALANCED_PERFORMANCE, WMI_PP_PERFORMANCE },
+	{ PLATFORM_PROFILE_PERFORMANCE,          WMI_PP_FULL_SPEED },
+};
+
+static const struct bitland_mifs_quirks default_quirks = {
+	.profile_entries = default_profile_entries,
+	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
+};
+
+};
+
+static const struct dmi_system_id bitland_mifs_dmi_table[] = {
+	{}
+};
+
 enum bitland_mifs_event_id {
 	WMI_EVENT_SWITCHVIDEOMODE	= 1,
 	WMI_EVENT_SELECTIVE_SCREENSHOT	= 2,
@@ -166,6 +221,7 @@ struct bitland_mifs_wmi_data {
 	struct input_dev *input_dev;
 	struct device *hwmon_dev;
 	struct device *pp_dev;
+	const struct bitland_mifs_quirks *quirks;
 	enum platform_profile_option saved_profile;
 };
 
@@ -208,37 +264,30 @@ static int laptop_profile_get(struct device *dev,
 			      enum platform_profile_option *profile)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	const struct bitland_mifs_quirks *quirks = data->quirks;
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_GET),
 		.function = cpu_to_le16(WMI_FN_SYSTEM_PER_MODE),
 	};
 	struct bitland_mifs_output result;
+	size_t i;
 	int ret;
 
 	ret = bitland_mifs_wmi_call(data, &input, &result);
 	if (ret)
 		return ret;
 
-	switch (result.data[0]) {
-	case WMI_PP_BALANCED:
-		*profile = PLATFORM_PROFILE_BALANCED;
-		break;
-	case WMI_PP_PERFORMANCE:
-		*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
-		break;
-	case WMI_PP_QUIET:
-		*profile = PLATFORM_PROFILE_LOW_POWER;
-		break;
-	case WMI_PP_FULL_SPEED:
-		*profile = PLATFORM_PROFILE_PERFORMANCE;
-		break;
-	default:
-		return -EINVAL;
+	for (i = 0; i < quirks->num_profile_entries; i++) {
+		if (quirks->profile_entries[i].wmi_val == result.data[0]) {
+			*profile = quirks->profile_entries[i].profile;
+			return 0;
+		}
 	}
+
 	return 0;
 }
 
-static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *data)
+static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *data)
 {
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_GET),
@@ -247,6 +296,9 @@ static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *da
 	struct bitland_mifs_output output;
 	int ret;
 
+	if (data->quirks->skip_ac_type_check)
+		return power_supply_is_system_supplied() > 0 ? 0 : -EOPNOTSUPP;
+
 	/* Full-speed/performance mode requires DC power (not USB-C) */
 	if (!power_supply_is_system_supplied())
 		return -EOPNOTSUPP;
@@ -269,47 +321,42 @@ static int laptop_profile_set(struct device *dev,
 			      enum platform_profile_option profile)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	const struct bitland_mifs_quirks *quirks = data->quirks;
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_SET),
 		.function = cpu_to_le16(WMI_FN_SYSTEM_PER_MODE),
 	};
+	size_t i;
 	int ret;
-	u8 val;
 
-	switch (profile) {
-	case PLATFORM_PROFILE_LOW_POWER:
-		val = WMI_PP_QUIET;
-		break;
-	case PLATFORM_PROFILE_BALANCED:
-		val = WMI_PP_BALANCED;
-		break;
-	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
-		ret = bitland_check_performance_capability(data);
+	if (profile == PLATFORM_PROFILE_PERFORMANCE ||
+	    profile == PLATFORM_PROFILE_BALANCED_PERFORMANCE) {
+		ret = bitland_pp_check_capability(data);
 		if (ret)
 			return ret;
-		val = WMI_PP_PERFORMANCE;
-		break;
-	case PLATFORM_PROFILE_PERFORMANCE:
-		ret = bitland_check_performance_capability(data);
-		if (ret)
-			return ret;
-		val = WMI_PP_FULL_SPEED;
-		break;
-	default:
-		return -EOPNOTSUPP;
 	}
 
-	input.payload[0] = val;
+	for (i = 0; i < quirks->num_profile_entries; i++) {
+		if (quirks->profile_entries[i].profile == profile &&
+		    !quirks->profile_entries[i].no_set) {
+			input.payload[0] = quirks->profile_entries[i].wmi_val;
+			return bitland_mifs_wmi_call(data, &input, NULL);
+		}
+	}
 
-	return bitland_mifs_wmi_call(data, &input, NULL);
+	return -EOPNOTSUPP;
 }
 
 static int platform_profile_probe(void *drvdata, unsigned long *choices)
 {
-	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
-	set_bit(PLATFORM_PROFILE_BALANCED, choices);
-	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
-	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+	struct bitland_mifs_wmi_data *data = drvdata;
+	const struct bitland_mifs_quirks *quirks = data->quirks;
+	size_t i;
+
+	for (i = 0; i < quirks->num_profile_entries; i++) {
+		if (!quirks->profile_entries[i].no_set)
+			set_bit(quirks->profile_entries[i].profile, choices);
+	}
 
 	return 0;
 }
@@ -718,6 +765,7 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 		.default_label = ":" LED_FUNCTION_KBD_BACKLIGHT,
 		.devname_mandatory = true,
 	};
+	const struct dmi_system_id *dmi_id;
 	int ret;
 
 	drv_data = devm_kzalloc(&wdev->dev, sizeof(*drv_data), GFP_KERNEL);
@@ -732,6 +780,11 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 
 	dev_set_drvdata(&wdev->dev, drv_data);
 
+	drv_data->quirks = &default_quirks;
+	dmi_id = dmi_first_match(bitland_mifs_dmi_table);
+	if (dmi_id)
+		drv_data->quirks = dmi_id->driver_data;
+
 	if (dev_type == BITLAND_WMI_EVENT) {
 		/* Register input device for hotkeys */
 		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
-- 
2.55.0

