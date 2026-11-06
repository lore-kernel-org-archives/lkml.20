Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965391;
	b=n2SB7Lw/igLCQTaFrrM4NTyQs+WusFgfAGj0KSycp+xiMNELRja54NTFLR6eWxr7OtVz
	 0STxXZ6/sXgJVDu+TuqEyQlXsVxcOoMD8s5fLnU8TV5uCz8cmunR5B6/nqMRc5KWJ77Ia
	 Awr9c8FFg/7RLsnLyv15ck3HhKNkFaaKVYXKDsm7z0BpLo/InWDpJhVWWHWxp8tHv1vuA
	 +pdBMNRXjDqmBxebhheP9KmVr24TFFMftGQipIsXutRz00EOAwEK0by/TEs+6UZDPDpPL
	 9Ab4vFPF521q8uZH1Z+ELdL+5o8pPCZSbUl/cFc1kzdNEdKo3EeXQCn7nPirRdnNTdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LnnIdamjDHO6+FMBze92j/z9JQUuUcWbUWtszHcXFKA=;
	b=2A2LCmNps35+2imMTJy91nJniN5caPAaNflxF4pgvebPVRtoJFKlF9EsVWNa4YdPSnVI
	 KFSg8Ox9gsSATc8P8ufWmarpYTnZAA1/+mxh74ix4Rccz6jGlTP2d8YOsPXrI8hNzgxsQ
	 gvy35nPyPxcWjpvZByETp52s5vXljA47wof8Rron+k4m2OWP1RdIdUyaFI1N5/gLGBP0B
	 By3d3iR4zkUJiqgak79yj3t0ll5xkvsQpzlxXRthmca1b2YQib1u7IwRYJxNKTiDd+n8w
	 JD/CO4AvGPygny4Bkj57+kZJmC38jkpHItdLab+cv3Di6Dh7yFTCCz0J9LiogK7Uw3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=UIjr4Nne;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E9F606C7CF
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E9F606C7CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=UIjr4Nne
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b561b60b78so2419352a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793965389; x=1794570189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnnIdamjDHO6+FMBze92j/z9JQUuUcWbUWtszHcXFKA=;
        b=UIjr4NneYi82jFQr8OTb4FhRUeIk7tGTtSIIVcpxIVFiMqIfVSZNa9jsbCYsiMSG04
         Nj7sWwcz96lWyrjafF44fbZIwrh6mp6VnBYpVayRbVshMXvBdzO67P7za92g/CWdPLY1
         9uPd6i05V72GgqykfaBQUGIuxxfhn8o1bn2pE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965389; x=1794570189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LnnIdamjDHO6+FMBze92j/z9JQUuUcWbUWtszHcXFKA=;
        b=Or8J3iafmo0CjBKNdUF3/BZeimHBkeIDzEOYzEtu8zEobbzFc4ccWqUvKChtIw3+Df
         +DFVNNvzqSkmxfcpQGtiYwcYU3Th7tMkRFJnvdKg2tpi7IIK19U4tcp8gM66qWO6htjl
         bC8/TA30Ysd48h2i1X7bvvu534luXC9LosZEd9k/n9gLwGnL2nl+ProJ2/SZHgwWlo5h
         P8mXckm91dUZgoNLELLTv0p/UoNihB4bY9EhIE0Zd+/kqqEho9BzHz1cwW/lf/Ks8TU+
         EPqsMcLp6xe++YNRtVlxYqQBPr29VTUceLLxguTqUqdVomODAvs6W3/dLgzyxDfeFsyA
         m5uw==
X-Forwarded-Encrypted: i=1; AKwUvByA81tJQ6gG4FejBtho0mVEYCPYNgDQZvrbMVfnNEPozFL7TVmnHYd1jzhK8qb1DKrYNXAAdl43EthJ9Xg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DVs9MC7J6BpoTCCjPT/F8Ju17vQCK5jUxHGNWVZ+70GMv4FKU
	4JVSmsVO6wHrbW0iZC+ymPVfU3rqHsyhaTQSEA7eQ6CaRbkC3nx1MIQhgI/EG7R6wdH/ntEUW0Y
	dLc5YYlw/zg==
X-Gm-Gg: AYBFou1a8GtXTbHE0srdEE5Bed1SsV1XvXsgYbSqRzUh7eE4pJGIkX4TyIfLw4j3ajN
	6fHFKODsKHaYwcU27akrNx2YLcVibmZnWDa22yTgBCwBjkgZEFaGJilc1OqKPYopBfisHMsXFKF
	uxW1Joo65EGUxGNtLlx01own0Qof/r2snk2+cOD7/koLBOdI3ET5cpnZl8jZWHA5NpBO1I7+gUu
	MvDajZ6XB0itvy79wHBWpWR0rYR2G8m6fR62xi5MtTSQrfaEZGpnWdQBj76DpbihU02Ux4QXZ/s
	9AtHnYfsCES+BlRnljcrS9si1NxhsdusTuT0fEqEd0Ai2QfVD7BN+GKZG/wqVqLwNNgoS5CVC9Y
	X0ZjjnEvdzapDvd7pASnenNdOSVm8dbig5q9hbrXYp2eJC9HyTEacnG4jhhtPuiBPOyASghGLAp
	P6PdCJadYfv2uWtOaHnvu0nHQKSW1IHN4XU51gTg9I0uGS2ZpMD7/KpW/oxJjqh8YG+7puWMqM/
	6kO3lO7bf+9jw5hRlxZ8POp42PthODYIcqbhTSdnxlksd/j1meHQByvvLJXYAAOhEP5RtiKICj3
	AmV3kqr83hbot/2SWXvBo5ARQBObt/44cW6OZcKzGFPUixU=
X-Received: by 2002:a17:907:3906:b0:c2a:4847:231b with SMTP id a640c23a62f3a-c4d3557096amr169438366b.24.1793965388650;
        Fri, 06 Nov 2026 03:43:08 -0800 (PST)
Received: from xia ([83.142.187.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356e7035sm71377866b.80.2026.11.06.03.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:43:08 -0800 (PST)
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
	Arsenova <7z0423arsenova@proton.me>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v4 2/4] platform/x86: bitland-mifs-wmi: Support a separate profile value on battery
Date: Fri,  6 Nov 2026 12:42:58 +0100
Message-ID: <20261106114300.936782-3-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106114300.936782-1-chris@miget.com>
References: <20261106114300.936782-1-chris@miget.com>
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

Some firmware uses a different SystemPerMode value for a profile
depending on the power source. The Xiaomi Book Pro 14 uses 0x04 for
performance on AC and 0x03 on battery, both with a 50-58 W sustained
power limit. Its DTT tables have no battery entry for 0x04, and BIOS
0707 refuses 0x04 on battery.

Let a profile entry be marked for battery use. It is set in place of
the AC entry for the same profile while the system runs on battery,
without the AC check. The firmware does not change the mode when the
power source changes, so re-apply the current profile from an ACPI AC
notifier, taking the AC state from the event. A mutex keeps this from
racing with profile changes from userspace.

The notifier is only registered when the quirks have a battery entry,
so models without one are not affected.

Suggested-by: KentoNion <kento@kekto.ru>
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    v4: no longer edits the TM2424 entry. Patch 3 now adds the quirk with
    0x03 as the battery entry (Mingyou).
    
    Tested together with patch 3, with ftrace kprobes on the AC notifier
    and on the WMI calls:
    
      AC, performance (0x04), unplug: the notifier sets 0x03 within 1 ms
      battery, performance: set 0x03, PL1 58 W
      battery, performance (0x03), plug in: the notifier sets 0x04
      s2idle from performance on AC: resume restores 0x04
    
    Battery class events are ignored. Here Omarchy also switches to its
    saved per-source profile about a second later, which goes through
    laptop_profile_set() after the notifier.

 drivers/platform/x86/bitland-mifs-wmi.c | 120 +++++++++++++++++++++---
 1 file changed, 107 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index d092dc696293..97dafd510ba8 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -91,6 +91,7 @@ struct bitland_profile_entry {
 	enum platform_profile_option profile;
 	u8 wmi_val;
 	bool no_set;
+	bool battery;	/* Set in place of the AC entry while on battery */
 };
 
 struct bitland_mifs_quirks {
@@ -206,8 +207,10 @@ struct bitland_fan_notify_data {
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
@@ -329,34 +332,108 @@ static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *data)
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
@@ -805,6 +882,10 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 	if (ret)
 		return ret;
 
+	ret = devm_mutex_init(&wdev->dev, &drv_data->profile_lock);
+	if (ret)
+		return ret;
+
 	dev_set_drvdata(&wdev->dev, drv_data);
 
 	drv_data->quirks = &default_quirks;
@@ -837,6 +918,19 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
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

