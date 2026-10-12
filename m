Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EF447C111
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799601; cv=none; b=QovoJxFQihv8/b9PTS7csye1ZSYGMEe9t6lNiFZNUKXMOcS9TerWlg2t4WIZ5CZhkzbvndI6kVa5nNBP9B2YqMowIOB+IZVM8SIkIKKJ5S/PQEizw64mKQvmx9PrtWaShy951u/NhlDk/67NNqyw4Zte2+NQo91AgwfvWpPU5Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799601; c=relaxed/simple;
	bh=5sd59k20nbjJzJlPBWt3XzisglXyxwq6kq2ZsAi1QUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDFiUP5tn1MGiMmdBfwmEuUUQAaVrbV0jY/DdKEF/KSFFXj0fq1Qj0kMWcjJJPVN7Q2+w85tpdhqJb2hAU2MOMaw3rZhtevWulmvK+b8AGMAmit7Hr38WLfKHQFlfi9cTBZ65LQg2IVA32MJsGBdwaS8hyO+vo8aO3tdPhWponE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pMXVt398; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pMXVt398"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc7cc8aafe6so582893a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799587; x=1792404387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yRuVJ6RPCq2faR0gzeQaAlSqUGmzX7ZnNt+D7WYAPmg=;
        b=pMXVt398xFyueVDyd5lAg5xmAheNGqOn127n2jgkJpRT7lmdIfnQIySypg6QtN2wkF
         8ed2l6GxqxDymWX+7koaTx1mkhnXMvgmmGYND10LDVH+QPlGLqBquZ6m2B+BrQJP1n6y
         xd9dLFejJVyqLILPVwdKMOngeUJDPdQDNmADjDwskKCMQmkuv5Fxg6Puk20vXhM/W1t1
         gskRi4GPsjr3dpM+Oez5KPmyP2SSMFx+mZSp8HV0UIPCXUsqY4ErbprJ45BGDjGqwLtq
         EC7VVETZCtOmEnWbIJeH9Iwr2ZDgwtOe9Tn5DSeZbJzyfwwWSbzD5bkpMrAhRvRzbVaO
         fiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799587; x=1792404387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yRuVJ6RPCq2faR0gzeQaAlSqUGmzX7ZnNt+D7WYAPmg=;
        b=bUHOPZ+T2F2zaxbUitXDbMAOttkHNs8hZqGff2NUV0tvbFjyDt4n6FG63Fs3VUUirg
         gUDKMegb9SXDO2KWLX4GAAWoQ+JLyb4AoLBoUWAd6esq23jpYnunYb7wDn9ud0a4v52q
         mz+2k9ET4WAm/qRvOn2DR9T6Du1fcZaOb/zXTzGFfTQGhEdkSLYaEXS4RGfDvj83tdol
         TOvGFbbaKHW4+NZDAZ1syn+zx1B9plyhgZocTo2lCUy9S6oJ5p2TTzZVsz+8qfgZXzvp
         FlDGxvJwgXFbaqRChEPbJ1XhQ/L5Vf1iPpObPQ7v9gnkMf6XfAGtI3FFhMppgRC5ot0h
         0xTA==
X-Forwarded-Encrypted: i=1; AKwUvBwLlBpPwLNg+oO2NrLIBbIP8AAZiZ9Ok1YARzu9M8a401HAEwux5ZoDQSKtSxwXodqCMit3BfSaTGvGx9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIB13aQf+NwdCAJ3zW4Ti9soOII6RMkPovYkaqTKsZOkCNb6W6p
	C0HwXNhj2UqLkuYHRstjGk4nUs8LY4yHKn38uoY3p3bm7tR4gLPpe3LH
X-Gm-Gg: AYBFou0Tt5tCynEEuIW9qV82n39NYKLxtS6WG9o5RBQ6XIF4DsvR/TiHUdriUKOTClw
	t2Re5K21U1ie00itmRpbvcm0oB7bTCCN9zWiekxkY4g4qPKOcidcuPtYkQugsyD212iFoWQ7qmR
	wsxivceqHryMbAST8kjncsgKscb1bOTMdUNQzc5GRlZUE+pPoBYWj6BOQKbtvKsQdJ9kVI35itq
	BbV9Oc6onXrFSZFSuZnGU966KOXWhFIrRFlZgtcBGEaNo2PFZy/e6mPvtoImXbID53wpa0FATGN
	BYjsiL3ej/lSNsSMMAg8sqIwNkwE9I/Q/erDA7J1Dl85yNJ6o3UWPo9VEuQTH+oLsXQXJpv9IR+
	RHZ+I+LWbGgDnYW3N+PzX09TrMcbtHysZinLEamxOLzfFemSceYqdjatrfs7GolE2hyckx1qkh+
	uErym2sflo1Jz38rLtVIDqqD2leyz78egdKiohpkgxeBsFmTm0nqjeWjeW1ujKjXjdE556bxI=
X-Received: by 2002:a05:6a20:6a0b:b0:3e1:558d:e377 with SMTP id adf61e73a8af0-3e16be881d1mr7910749637.16.1791799586937;
        Mon, 12 Oct 2026 03:06:26 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm4074272a12.29.2026.10.12.03.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:06:26 -0700 (PDT)
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
Subject: [PATCH v11 5/6] platform/x86: bitland-mifs-wmi: Add quirks table
Date: Mon, 12 Oct 2026 18:05:31 +0800
Message-ID: <20261012100532.19612-6-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012100532.19612-1-qby140326@gmail.com>
References: <20261012100532.19612-1-qby140326@gmail.com>
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
 drivers/platform/x86/bitland-mifs-wmi.c | 178 ++++++++++++++++--------
 1 file changed, 121 insertions(+), 57 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 93a519b96189..d61382ad4a0b 100644
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
@@ -84,6 +85,41 @@ enum bitland_mifs_power_profile {
 	WMI_PP_FULL_SPEED	= 3,
 };
 
+struct bitland_mifs_wmi_data;
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
+static const struct dmi_system_id bitland_mifs_dmi_table[] = {
+	{}
+};
+
 enum bitland_mifs_event_id {
 	WMI_EVENT_SWITCHVIDEOMODE	= 1,
 	WMI_EVENT_SELECTIVE_SCREENSHOT	= 2,
@@ -131,12 +167,24 @@ struct bitland_mifs_input {
 	u8 payload[28];
 } __packed;
 
-struct bitland_mifs_output {
+struct bitland_mifs_output_head_rc {
 	__le16 return_code;
 	__le16 function;
 	u8 data[28];
 } __packed;
 
+struct bitland_mifs_output_tail_rc {
+	__le16 function;
+	u8 data[28];
+	__le16 return_code;
+} __packed;
+
+union bitland_mifs_output_buf {
+	struct bitland_mifs_output_head_rc head;
+	struct bitland_mifs_output_tail_rc tail;
+	u8 raw[32];
+};
+
 struct bitland_mifs_event {
 	u8 event_type;
 	u8 event_id;
@@ -166,27 +214,41 @@ struct bitland_mifs_wmi_data {
 	struct input_dev *input_dev;
 	struct device *hwmon_dev;
 	struct device *pp_dev;
+	const struct bitland_mifs_quirks *quirks;
 	enum platform_profile_option saved_profile;
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 				 const struct bitland_mifs_input *input,
-				 struct bitland_mifs_output *output)
+				 struct bitland_mifs_output_head_rc *output)
 {
 	struct wmi_buffer in_buf = { .length = sizeof(*input), .data = (void *)input };
 	struct wmi_buffer out_buf = { 0 };
+	const u8 *payload_data;
+	__le16 return_code;
+	__le16 function;
 	int ret;
 
 	guard(mutex)(&data->lock);
 
 	ret = wmidev_invoke_method(data->wdev, 0, 1, &in_buf, &out_buf,
-				   sizeof(struct bitland_mifs_output));
+				   sizeof(union bitland_mifs_output_buf));
 	if (ret)
 		return ret;
 
-	struct bitland_mifs_output *result __free(kfree) = out_buf.data;
+	union bitland_mifs_output_buf *result __free(kfree) = out_buf.data;
 
-	switch (le16_to_cpu(result->return_code)) {
+	if (data->quirks->return_code_at_end) {
+		return_code = result->tail.return_code;
+		function = result->tail.function;
+		payload_data = result->tail.data;
+	} else {
+		return_code = result->head.return_code;
+		function = result->head.function;
+		payload_data = result->head.data;
+	}
+
+	switch (le16_to_cpu(return_code)) {
 	case WMI_RETURN_CODE_SUCCESS:
 		break;
 	case WMI_RETURN_CODE_UNKNOWN_FUNCTION:
@@ -195,11 +257,16 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 		return -EIO;
 	}
 
-	if (result->function != input->function)
-		return -ENOMSG;
+	if (function != input->function) {
+		if (!(data->quirks->accept_zero_function && function == 0))
+			return -ENOMSG;
+	}
 
-	if (output)
+	if (output) {
+		output->return_code = return_code;
+		output->function = function;
 		memcpy(output, result, sizeof(*output));
+	}
 
 	return 0;
 }
@@ -208,45 +275,41 @@ static int laptop_profile_get(struct device *dev,
 			      enum platform_profile_option *profile)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	const struct bitland_mifs_quirks *quirks = data->quirks;
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_GET),
 		.function = cpu_to_le16(WMI_FN_SYSTEM_PER_MODE),
 	};
-	struct bitland_mifs_output result;
+	struct bitland_mifs_output_head_rc result;
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
-	return 0;
+
+	return -EINVAL;
 }
 
-static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *data)
+static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *data)
 {
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_GET),
 		.function = cpu_to_le16(WMI_FN_SYSTEM_AC_TYPE),
 	};
-	struct bitland_mifs_output output;
+	struct bitland_mifs_output_head_rc output;
 	int ret;
 
+	if (data->quirks->skip_ac_type_check)
+		return power_supply_is_system_supplied() > 0 ? 0 : -EOPNOTSUPP;
+
 	/* Full-speed/performance mode requires DC power (not USB-C) */
 	if (!power_supply_is_system_supplied())
 		return -EOPNOTSUPP;
@@ -269,47 +332,42 @@ static int laptop_profile_set(struct device *dev,
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
-		if (ret)
-			return ret;
-		val = WMI_PP_PERFORMANCE;
-		break;
-	case PLATFORM_PROFILE_PERFORMANCE:
-		ret = bitland_check_performance_capability(data);
+	if (profile == PLATFORM_PROFILE_PERFORMANCE ||
+	    profile == PLATFORM_PROFILE_BALANCED_PERFORMANCE) {
+		ret = bitland_pp_check_capability(data);
 		if (ret)
 			return ret;
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
@@ -366,7 +424,7 @@ static int laptop_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_GET),
 	};
-	struct bitland_mifs_output res;
+	struct bitland_mifs_output_head_rc res;
 	int ret;
 
 	switch (type) {
@@ -455,7 +513,7 @@ static enum led_brightness laptop_kbd_led_get(struct led_classdev *led_cdev)
 		.operation = cpu_to_le16(WMI_METHOD_GET),
 		.function = cpu_to_le16(WMI_FN_RGB_KB_BRIGHTNESS),
 	};
-	struct bitland_mifs_output res;
+	struct bitland_mifs_output_head_rc res;
 	int ret;
 
 	ret = bitland_mifs_wmi_call(data, &input, &res);
@@ -480,7 +538,7 @@ static ssize_t gpu_mode_show(struct device *dev, struct device_attribute *attr,
 		.operation = cpu_to_le16(WMI_METHOD_GET),
 		.function = cpu_to_le16(WMI_FN_GPU_MODE),
 	};
-	struct bitland_mifs_output res;
+	struct bitland_mifs_output_head_rc res;
 	u8 mode_val;
 	int ret;
 
@@ -534,7 +592,7 @@ static ssize_t kb_mode_show(struct device *dev, struct device_attribute *attr,
 		.operation = cpu_to_le16(WMI_METHOD_GET),
 		.function = cpu_to_le16(WMI_FN_RGB_KB_MODE),
 	};
-	struct bitland_mifs_output res;
+	struct bitland_mifs_output_head_rc res;
 	u8 mode_val;
 	int ret;
 
@@ -718,6 +776,7 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 		.default_label = ":" LED_FUNCTION_KBD_BACKLIGHT,
 		.devname_mandatory = true,
 	};
+	const struct dmi_system_id *dmi_id;
 	int ret;
 
 	drv_data = devm_kzalloc(&wdev->dev, sizeof(*drv_data), GFP_KERNEL);
@@ -732,6 +791,11 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 
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

