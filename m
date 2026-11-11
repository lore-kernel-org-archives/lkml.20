Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406423;
	b=Rc9IzMSsc2BhZ5XyhXw9cWTfgY+VSPTntp7irKhGCwJDO6wxwZ8qxI4VOKESzEeJxK5Q
	 n2aBUwgmbevAfXjvSbXz5F51j7MywXT1PNeEXLD1+S7DDxOyYoO4rXMnHYNOgoSTQMPAl
	 YCWOymUNXeX34EpCWH9SrBlanhOEKrUjd66yBqd7rb5iljYuAdwc8lKr7USG7pN/bBkov
	 azPfLDoRjCs0Ts0ZLlg+eXV+dG6QIsvfwJMuIxFnRW8xuZwKGm5esvCvbrO9kKFWHz5rV
	 wIYj52a7YhhvfblDykt/syiyTN8mYQVuFfDd2HSAzyUnBGmbUhqEONjSpNwckMXEexA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6ti6tRK1MXhKh345S9DeYLRynK5bHzR8yz8wOXWyiVs=;
	b=r9lJSpgpkaHYB1YsQdh0VBFUuFt8S8pWeOGkkcERsEQeBeke4ILxO6dH0/oImetFAtHl
	 TZTACZdR1KIYX7utKXwGKCxT1PxwUPsgdf0CEHNszF1yUFekXLhLrHN7QvNyFNgkdbNik
	 HybtR11G7+3RWpJedYT+gk5DrUHQPX0LDF/r29eDH36dJ4sstzndikPc4yO1t62O7qo7l
	 gafBXD+ePFcRIJv2kUcoVQIhn565vBf2i3Yhf/K7ZYFTBmMdtZ6xs0KZd/uc2EHJBHeL1
	 hWvUBowZgMipasfK5ihNeY/lvunpwVio/ipBu7k91Nv5WTTbY2S7aZ2JG3wQk4Q+AEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yy5lIPs9;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42841606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42841606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yy5lIPs9
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b1535be329so1732838a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794406423; x=1795011223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ti6tRK1MXhKh345S9DeYLRynK5bHzR8yz8wOXWyiVs=;
        b=yy5lIPs93B15D6dQWZ3jy0FtzVBCRSNlE4Jp3UPM0gJeqkZ6/iX85rHlX0b32BScD7
         84LqwlQoeOgjFkiuaV7IzeR/0MKkV5+KRYCVbtbZCgPD/Amkq8nnV3jcRmrA7aTEZRxQ
         bx2sIzM7g1chhOfOa/nlT/LMfsEEmU+4tAj4C1wU42MpjcdZs7kGME1ba2xQU36QKagB
         qJBoY1+7jogDEaPtV8a1PNgAfOlgVa7xDTYnebXMZrh7NogQ7tdfRTxe4r0YKAkGETCp
         qiEHhddez7lJjvZPY3rLVJetvvUaTe0MeOlYlmXGiqcXXxAlG9ZHmWKQjkaEhblnlYPi
         k55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406423; x=1795011223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ti6tRK1MXhKh345S9DeYLRynK5bHzR8yz8wOXWyiVs=;
        b=BdqHovhA25YzdO2gr8GBDZ1LWMwkm1hQAnLSUfVHgIHz/XsdhzlCveSGhoqrtURUso
         QHOo4bl3NGDVPOsIry3nYgHr1KwjLFxNLi9nwYfsP5wwS+dExgtu/N6n2PirQbJlvIDu
         zhqZtDez2RiBWa9NMMbTZOp2G2tzEywxFHBoO0e3JTID75N0IMPhOLU0JjBTTCja5fW0
         RvptT3f+ywKy6arQj9Di2FNdbXOJ1DG43Z9FmxlV1l6ZXW5GKjPsZiiG5Ph6Z2yU8eBG
         5Mr1cIIw6KGQxnbHrGMNizqNxo9UvBHQ+kyEuwMfJ5Av36PRooqwz0ozXmiozZjMb5P2
         o3HQ==
X-Forwarded-Encrypted: i=1; AL+hErGjaI2cLIzWiwZGMK9mihwpXxBoOZW8bM8SvYw2sBwyGh90RJlD8JWz4nanBOAqZ/AvIOV7l1Jry2T1mpA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bnzk4Sp47petBWViQgVFg04jWBuU6R49H3bXLUDzHZeRR40U2
	Su6wfhIiMTgKxapFVuvs68Uy0NqQ9NvJbJCzg5TRq1ywOb94i7IO+kD/
X-Gm-Gg: AYBFou0MJb5FHWW+9u/DpUJFuLUVFanAqq4SXY0+/6/kMoOuONYP7oDFLHqPgjp0BSh
	pvKbHIbdQi2+W5sLYs36fxnF1VLtCVFDq3kcyZilCmi6gwhpf89jciU+EYRjapoaF3kwOZqyRyC
	w3WSvbyHO12X5nw4gERJ5J9NQdLt7zeG6e7ByDnnuiipE12zSF3IznxIqPovJ/vib+Ri/KCYaOf
	En7mHQlHQsgWfZoUSLKsgVX/ieMpIbI4mlx87AzB71DNYXiVEF4i3xYOXZVsFB3nciYukJPBrXo
	RUI+VlUMykHfnNqUQST/ejrPl+ZN05rZ9OdxjCR7LF5sQWVV3k7xegr5VPVu8aArawDOs2Xy6Hw
	1Nu/8MWzHdonEzp7AqaAVN4+kkRN0sjGWxt+amVWk777fJzjVIo48Ao0ZfMNGDbi+gidaY2C7V7
	1Q3yxLcam+cojXubN6ajavgwCq3XDGi7J77UCFOmIaOdytZop9eumW4rK01qkQ1FPNAWprwoqyc
	QxQ7AM90wuKhTb3nONA+1cx16ir3rGIrS+mkbo/w1qF/fvYuzivI+JgUUa+2DZ6gzk5BfrSBMvr
	DtE6j50qxs/FKD6wCr4njVzK
X-Received: by 2002:a17:90b:5347:b0:3a8:a1f6:3b32 with SMTP id 98e67ed59e1d1-3b182f58edamr2626071a91.38.1794406422589;
        Wed, 11 Nov 2026 06:13:42 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db319bdsm4789970a91.6.2026.11.11.06.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:13:41 -0800 (PST)
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
Subject: [PATCH v16 5/6] platform/x86: bitland-mifs-wmi: Add quirks table
Date: Wed, 11 Nov 2026 22:12:25 +0800
Message-ID: <20261111141226.9482-6-qby140326@gmail.com>
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

The MIFS WMI interface is shared by several Bitland ODM laptops which
differ in the layout of the performance mode values of
WMI_FN_SYSTEM_PER_MODE and in the capability checks.

Introduce a quirks table to support multiple machine families without
sprinkling model checks over the driver.

Tested-by: Chris Taraszka <chris@miget.com>
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 178 ++++++++++++++++--------
 1 file changed, 121 insertions(+), 57 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 1f7f2fd5ce5f..d9678b979620 100644
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
@@ -84,6 +85,38 @@ enum bitland_mifs_power_profile {
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
@@ -131,12 +164,24 @@ struct bitland_mifs_input {
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
@@ -166,27 +211,41 @@ struct bitland_mifs_wmi_data {
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
+
+	if (data->quirks->return_code_at_end) {
+		return_code = result->tail.return_code;
+		function = result->tail.function;
+		payload_data = result->tail.data;
+	} else {
+		return_code = result->head.return_code;
+		function = result->head.function;
+		payload_data = result->head.data;
+	}
 
-	switch (le16_to_cpu(result->return_code)) {
+	switch (le16_to_cpu(return_code)) {
 	case WMI_RETURN_CODE_SUCCESS:
 		break;
 	case WMI_RETURN_CODE_UNKNOWN_FUNCTION:
@@ -195,11 +254,19 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 		return -EIO;
 	}
 
-	if (result->function != input->function)
+	if (function != input->function) {
+		if (function == 0 && input->operation == cpu_to_le16(WMI_METHOD_SET))
+			goto fn_ok;
+
 		return -ENOMSG;
+	}
 
-	if (output)
-		memcpy(output, result, sizeof(*output));
+fn_ok:
+	if (output) {
+		output->return_code = return_code;
+		output->function = function;
+		memcpy(output->data, payload_data, sizeof(output->data));
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
 
@@ -712,6 +770,7 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 		.default_label = ":" LED_FUNCTION_KBD_BACKLIGHT,
 		.devname_mandatory = true,
 	};
+	const struct dmi_system_id *dmi_id;
 	int ret;
 
 	drv_data = devm_kzalloc_obj(&wdev->dev, *drv_data);
@@ -726,6 +785,11 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 
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
2.56.0

