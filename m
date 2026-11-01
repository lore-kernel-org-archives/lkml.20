Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793549914;
	b=sGW/N/0c/kThAm63OYJwwiOpMr0EAxuR1+P+ttrh00UUhLqxCKmHIgCLtlVb/rpxiROk
	 u5/nwoAWd0VLG245FTIUkzTxyq4Rv+gDLKHZhgCu4MRVjPFWteauugQ/22Sqnmnfpp3Wm
	 u92IlTjyKdeiUMKl/YIt0gt5pGj1aZ3sSY/8XhTSE1oUCFKZxRUe1tEdsM4kPcXdmhZ5H
	 VD1yyml2RCw2zQsUAA1W3FXcC4N/RBFqQ0Yzw0px8xXqRh6nZEpp+KwrYEr12WZPjkQzu
	 mG3ry7BDJ+QC7yE6OyhcknQO0czMu6fVramBTQo/+h7jDRT7PVI6QXZIIUOhMVq7mEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793549914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dGpg9pFMDIojSeb4nvfIKMrj6NnEFPCfisae6aP11Oc=;
	b=tDwRTBc6ViV6Er23e9F26UaDR5LFP6jTQ4ak3kvbgvKj985xYbGYzxUfExZZIjn9BSD2
	 1NSYw57FgbdBtOoZG0n8SyM2l9xE7rWaD5QdeNDsmlHDYGgKKVWTieBlM4h/29bqcOLgC
	 fIKhbGo2cG392O3rinkzYzfkbsSiaS5NbTviJjYapt7P9BaqpTcfbXf4RTSix/XkLenI+
	 UOIuoIUOomKrMUxZ0lBM3sbWRwajQbyDHSpyZ7gZsiDy2tL6z+jbPM0VL3C3uuIWmtJ0W
	 Wm93UHyM5UKRFwLlJLCWy6QjiK7f+GBJwLItpL5SEF4EJvgTdF4xBV4dEvTSVjztK5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b="DAWy7//M";
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC97606A32C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC97606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=DAWy7//M
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so2952211a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793549913; x=1794154713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGpg9pFMDIojSeb4nvfIKMrj6NnEFPCfisae6aP11Oc=;
        b=DAWy7//M5QO1VMwyg3FVoMHZ/S0ROJa82PJL3NO04LTgTlIQwzv/tubxULBqn3HuGA
         SaVCvo4Ncfy9zY/NoeQl9iQJWoYN0uYuhLkfJTh72ZYbz7hSYAaA6pAmObnu9RUNJOhq
         lJZqwNlyJe10eljBhHQEb+HHY0vBCuTjmfnY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793549913; x=1794154713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dGpg9pFMDIojSeb4nvfIKMrj6NnEFPCfisae6aP11Oc=;
        b=Y2wscUb/0ta8or50nY6mwp/UMpD9gdyochl2aPMGHH24YYdrE5b144Zkc+bamjaybY
         wB6fGFFlCMXVt+CUWq5bAWGw4IjxbXWojVDpTdvxbHBaRw/8x1gE2Py0sc3K5srBr3+i
         UUVvWM8yR/bk7mkLdOYstiva05jWGsyNEBWiEwqDWcsYtmlHJUjbVmAmqeKj0IRWmNe3
         Bs3yWDoAVIq9nK0Ax0qkbKHvZStzT6xiu/LN5S/OgxdapYO8E+P4C8azjU/cWX43S6nn
         g+q54iHDzBTkPE46vfqQCjrqYXTXBhXFD77ywZvG7yV/6oLCt4s92KMv7QPtQrcDDYhI
         vWrQ==
X-Forwarded-Encrypted: i=1; AKwUvBywq4F6SHIDEFCfvmrCwl9v6ZwGGoMU8AxpX8+5Sc4/i7sRaP6ms9Y+ti2Nl9FcopeV2xvaksYsXu8K5RM=@vger.kernel.org
X-Gm-Message-State: APuU4Z++FOv4ESLcVP/Ry7TSTRrH+c4wfI6LlK7gqqzQSRoLdQzUm1Xk
	VbW6A604aiWmuumbboFOXkQU5p5DvXp3YMGb/2R5hzbcEq13dSdxy7QeAMGsrwi8GfnK1qPl2fA
	Mx8kJHGkGfA==
X-Gm-Gg: AYBFou0z2mqqXLsBErHXI1Dk2zMxp+nU9gFBdu5c/WOXqPpwtbppc5Ku7SsTZmAmTPZ
	lQ48goqcUbtrT4PFFJCSx84PuS8nv0wiwBsufbrnacN1KIRKM6n1/0jfyYOsF0jn0/R1dKsTtRH
	fXFQQIJ5YQb6Np+I/1BoweVqgUPSw2IfVOc07mofh6zr9Lry28FZDgBP7V6v2fdnXh/wssp2yYF
	9whuqDIAGL2zucFsss4bQtj9NwlDVWwP3mQJ8kxP4CXujFvJi54nlSuVhnXvlkaAI/6avMWeiam
	811QqAN1BdXDa9ziqjnzdv8Wx5NvSE4Qq7c1YRXjT1lXdP4wz93zXzcI+QIEgQNAq9Zr+9UypXn
	L47zgPv2cP35ubneJRPgYl/HZ7EsV7u2ERvMDscmkZsWMcGSxrzlFL/XFLoZ5MEAp/Q2mnpwfh6
	9ABjQBdpElyTsKPt6EXl+Au4Du7awkvx0vIhZawu1Mh7gCox53Q2lvonZI1q0T0zCDkcxoXGt48
	r1F5A+7IOAL61cXwJwVw7Ta3BWZthVX6aWFzv7OcBjMXgT0boK1YEDxbpLRzLXRWP/KWD8XT2QN
	3HCG61sQLnTaUpdL4rL4mIabJzYI5G1fJ1I/tGclsqpGbJrE0EBsACH+Ms0GNl9LS3lHjhJD4Cv
	19noS4TC3oxXvXszYCO467/fupSvV
X-Received: by 2002:a05:6402:46cf:b0:6b3:f81f:927d with SMTP id 4fb4d7f45d1cf-6b4d337cba8mr4907898a12.6.1793549912703;
        Sun, 01 Nov 2026 08:18:32 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-84-13.play-internet.pl. [46.112.84.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcac9sm2200155a12.18.2026.11.01.08.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:18:31 -0800 (PST)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	KentoNion <kento@kekto.ru>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v3 3/4] platform/x86: bitland-mifs-wmi: Support a separate profile value on battery
Date: Sun,  1 Nov 2026 17:18:13 +0100
Message-ID: <20261101161814.1325847-4-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101161814.1325847-1-chris@miget.com>
References: <20261101161814.1325847-1-chris@miget.com>
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

The Xiaomi Book Pro 14 firmware uses different SystemPerMode values for
performance depending on the power source: 0x04 on AC and 0x03 on
battery, both with a 50-58 W sustained power limit. Its DTT tables have
no battery entry for 0x04, and BIOS 0707 refuses 0x04 on battery, so
the driver currently refuses performance on battery.

Let a profile entry be marked for battery use. It is set in place of
the AC entry for the same profile while the system runs on battery,
without the AC check. The firmware does not change the mode when the
power source changes, so re-apply the current profile from an ACPI AC
notifier, taking the AC state from the event. A mutex keeps this from
racing with profile changes from userspace.

Mark 0x03 as the battery value for performance on the Xiaomi Book
Pro 14.

Suggested-by: KentoNion <kento@kekto.ru>
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    Tested with ftrace kprobes on the AC notifier and on the WMI calls:
    
      AC, performance (0x04), unplug: the notifier sets 0x03 within 1 ms
      battery, performance: set 0x03, PL1 58 W
      battery, performance (0x03), plug in: the notifier sets 0x04
      s2idle from performance on AC: resume restores 0x04
    
    Battery class events are ignored. Here Omarchy also switches to its
    saved per-source profile about a second later, which goes through
    laptop_profile_set() after the notifier.

 drivers/platform/x86/bitland-mifs-wmi.c | 122 +++++++++++++++++++++---
 1 file changed, 108 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 0891dcc1e9b4..4d02cd9e8a6b 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -91,6 +91,7 @@ struct bitland_profile_entry {
 	enum platform_profile_option profile;
 	u8 wmi_val;
 	bool no_set;
+	bool battery;	/* Set in place of the AC entry while on battery */
 };
 
 struct bitland_mifs_quirks {
@@ -118,7 +119,7 @@ static const struct bitland_profile_entry tm2424_profile_entries[] = {
 	{ PLATFORM_PROFILE_LOW_POWER,   0x0a, true },
 	{ PLATFORM_PROFILE_BALANCED,    0x09 },
 	{ PLATFORM_PROFILE_PERFORMANCE, 0x04 },
-	{ PLATFORM_PROFILE_PERFORMANCE, 0x03, true },
+	{ PLATFORM_PROFILE_PERFORMANCE, 0x03, .battery = true },
 };
 
 static const struct bitland_mifs_quirks tm2424_quirks = {
@@ -227,8 +228,10 @@ struct bitland_fan_notify_data {
 struct bitland_mifs_wmi_data {
 	struct wmi_device *wdev;
 	struct mutex lock;		/* Protects WMI calls */
+	struct mutex profile_lock;	/* Serializes profile changes */
 	struct led_classdev kbd_led;
 	struct notifier_block notifier;
+	struct notifier_block ac_notifier;
 	struct input_dev *input_dev;
 	struct device *hwmon_dev;
 	struct device *pp_dev;
@@ -350,34 +353,108 @@ static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *data)
 	return 0;
 }
 
-static int laptop_profile_set(struct device *dev,
-			      enum platform_profile_option profile)
+static const struct bitland_profile_entry *
+bitland_profile_set_entry(const struct bitland_mifs_quirks *quirks,
+			  enum platform_profile_option profile, bool on_battery)
+{
+	const struct bitland_profile_entry *entry = NULL;
+	size_t i;
+
+	for (i = 0; i < quirks->num_profile_entries; i++) {
+		const struct bitland_profile_entry *e = &quirks->profile_entries[i];
+
+		if (e->profile != profile || e->no_set)
+			continue;
+
+		if (e->battery && on_battery)
+			return e;
+
+		if (!e->battery && !entry)
+			entry = e;
+	}
+
+	return entry;
+}
+
+static int bitland_profile_set(struct bitland_mifs_wmi_data *data,
+			       enum platform_profile_option profile,
+			       bool on_battery)
 {
-	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
-	const struct bitland_mifs_quirks *quirks = data->quirks;
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_SET),
 		.function = cpu_to_le16(WMI_FN_SYSTEM_PER_MODE),
 	};
-	size_t i;
+	const struct bitland_profile_entry *entry;
 	int ret;
 
-	if (profile == PLATFORM_PROFILE_PERFORMANCE ||
-	    profile == PLATFORM_PROFILE_BALANCED_PERFORMANCE) {
+	entry = bitland_profile_set_entry(data->quirks, profile, on_battery);
+	if (!entry)
+		return -EOPNOTSUPP;
+
+	if (!entry->battery &&
+	    (profile == PLATFORM_PROFILE_PERFORMANCE ||
+	     profile == PLATFORM_PROFILE_BALANCED_PERFORMANCE)) {
 		ret = bitland_pp_check_capability(data);
 		if (ret)
 			return ret;
 	}
 
+	input.payload[0] = entry->wmi_val;
+
+	return bitland_mifs_wmi_call(data, &input, NULL);
+}
+
+static int laptop_profile_set(struct device *dev,
+			      enum platform_profile_option profile)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+
+	guard(mutex)(&data->profile_lock);
+
+	return bitland_profile_set(data, profile,
+				   !power_supply_is_system_supplied());
+}
+
+static int bitland_ac_notify(struct notifier_block *nb, unsigned long action,
+			     void *data)
+{
+	struct bitland_mifs_wmi_data *drv_data =
+		container_of(nb, struct bitland_mifs_wmi_data, ac_notifier);
+	struct acpi_bus_event *event = data;
+	enum platform_profile_option profile;
+	int ret;
+
+	if (strcmp(event->device_class, ACPI_AC_CLASS))
+		return NOTIFY_DONE;
+
+	guard(mutex)(&drv_data->profile_lock);
+
+	/* Switch to the AC or battery value of the current profile */
+	ret = laptop_profile_get(drv_data->pp_dev, &profile);
+	if (!ret)
+		ret = bitland_profile_set(drv_data, profile, !event->data);
+	if (ret)
+		dev_warn(&drv_data->wdev->dev,
+			 "Failed to update platform profile on AC change: %d\n", ret);
+
+	return NOTIFY_DONE;
+}
+
+static void bitland_ac_notifier_unregister(void *data)
+{
+	unregister_acpi_notifier(data);
+}
+
+static bool bitland_has_battery_entries(const struct bitland_mifs_quirks *quirks)
+{
+	size_t i;
+
 	for (i = 0; i < quirks->num_profile_entries; i++) {
-		if (quirks->profile_entries[i].profile == profile &&
-		    !quirks->profile_entries[i].no_set) {
-			input.payload[0] = quirks->profile_entries[i].wmi_val;
-			return bitland_mifs_wmi_call(data, &input, NULL);
-		}
+		if (quirks->profile_entries[i].battery)
+			return true;
 	}
 
-	return -EOPNOTSUPP;
+	return false;
 }
 
 static int platform_profile_probe(void *drvdata, unsigned long *choices)
@@ -826,6 +903,10 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 	if (ret)
 		return ret;
 
+	ret = devm_mutex_init(&wdev->dev, &drv_data->profile_lock);
+	if (ret)
+		return ret;
+
 	dev_set_drvdata(&wdev->dev, drv_data);
 
 	drv_data->quirks = &default_quirks;
@@ -858,6 +939,19 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 	if (IS_ERR(drv_data->pp_dev))
 		return PTR_ERR(drv_data->pp_dev);
 
+	if (bitland_has_battery_entries(drv_data->quirks)) {
+		drv_data->ac_notifier.notifier_call = bitland_ac_notify;
+		ret = register_acpi_notifier(&drv_data->ac_notifier);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(&wdev->dev,
+					       bitland_ac_notifier_unregister,
+					       &drv_data->ac_notifier);
+		if (ret)
+			return ret;
+	}
+
 	/* Register hwmon */
 	drv_data->hwmon_dev = devm_hwmon_device_register_with_info(&wdev->dev,
 								   "bitland_mifs",
-- 
2.56.0

