Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488271;
	b=an7ZbjeYzkYY6YzXeZpCcUOPBzvnVLWbY5MiabY5iuezWbaQoe2RTKd1i+Ns7pFdOUjP
	 KFEebiB2dnzWTUOVB079cH35sKGkfUY7+Uit+Cq3pHKC5mxRBtvju2cgM7fgJlK28BzbU
	 i2xIB3EXgzcSTY5MZX+Li1/t+uzjH6lyQTmAxkdeKstHLPignRRG0uMWYnOiEHzDJa2/z
	 LMkB26KSfJkvFOLZ2TzTeMgi1o6PaR3NTsy4tpn0aFs1q1wVIh+RK0Y1OP56s4UATaN5F
	 2LnaTKvuH9z9hff58Bbb1P/JxwzkC+GWM3jA5ySMpgKnpDU7TFGo4CjSqA2Wv71693g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=slIbOgQbb1xp6o/OLxDet5tGdA8/Wwa2Tg8oQr7vIe8=;
	b=Fgw+Od6cNlbHSzETsCCA1dXmjS1YhaxHY1oS2XKtImvtfMJdgjqoO94T2ll4AB6zX4EO
	 sa5dlmwq4GX86DkomPph1t9vfv3Sw9zwcS8myxgu9ha+m2Rwbax5IWUeMkBiwKSe5aLTU
	 /npF8ygjaSVmpTXP9fWw3QT8LF9bG+A8qy19BQfg8jpV58ik2Co9PD8VP543AMvIePAp+
	 N3qmoHdUNZngbl4yuH9afQgan4fMJKgr6hsdYZXaengmOk0ccP3ymmjF68yD/KO+g9TEA
	 KQkoTgBnhPd2M53BBEBA3f/wnTg7rMaEs3FDr5Wroz3nwdJNp+LZ5+a4VTwFz8IGrFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hccTCw6R;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D79606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D79606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hccTCw6R
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso30162775e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792488269; x=1793093069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slIbOgQbb1xp6o/OLxDet5tGdA8/Wwa2Tg8oQr7vIe8=;
        b=hccTCw6RFPKrk1BR2Cl+7yK9QrylAfKyL9h08x/9+j8C627S/CPIumIUlQsOb4TlOE
         2g+xmM6Mb+IUfcxDBOSxpGhWg/1yd9DjM1/duUMA9ghNB+2mE41xHTrj1FZL0yXLTkRF
         yo9O02AKig4CQIJ3JuoOfszK9IpRM+DErYVd4NqaY4QWAIwDi8zKdEoqjIGsOA97Zj/D
         qUpsvUTlKqARkJwgkxMk6D5MC0f5HYyzGhGpa+cLoZs8+WZxKeM1QCu5JfeiqYToSwAr
         VN2K6YTfbDr2yvDpAI2LTAx2owUSg3itbjTn0w4hoI7202Nnt4sfZbTFtCGkKx+oCdln
         n5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488269; x=1793093069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=slIbOgQbb1xp6o/OLxDet5tGdA8/Wwa2Tg8oQr7vIe8=;
        b=D7txVFcn8k9PrRXvAGV6ZxKQQPe3pf+NTWp002bHbaLYibF0IIMQF+/VSdYfp7dpEN
         X5Z8ujyrxvbYFiOu2qlO1BnW4+BHE3kpEu7+IqSI/uIZQu6pwMjkyqxWkiPziGdRUGZF
         6URbvg4DAn3DicmdeREH6j5HQgape7hHTfKusSVHgQ24AaKj0cNugYF0TV2PUrll004P
         HVPfzrwuTL4Vno3JzOql7XLx6uObW5/XWQS+WOoo08t6FOP2IsMLVc8vzkgiPRM3z0iV
         2LZe5lGl32dHDQNXg7bmiNDwkU9dWfyVidBwW0C61h1kSAOR8z6BT7NY6dZVfBYUshTY
         dK3g==
X-Forwarded-Encrypted: i=1; AKwUvByQsc0T5htzJOrt/Ae89XFlBSOhxKGoxHVk5AJCC2tc647DSAD1UYg7dNzRz61YOvMKX9Vc+Rg/uALtM9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqik1qWFPox0kLgTpcZUv/YEiMj8qCk7wtwCT9PAm+7pkHuLz9
	sWTc2Kh2w1BXElNdE/cN+1RSsQrGhyhF84OLZO7qOBMQc9QXI0kMtp2z
X-Gm-Gg: AYBFou3jtOn6RCSUBq7Bry3h8cgS5xSxC+qaUXsKjA+hcw1tYgfsuQ3B9yDDZYyn8wt
	HJuNrG7t/TKRhjj44otUVOGBDKupsVY95Kj9zuXbQ7Qn9sn8t8bHUCJtHZQFaxcyuxufcZzgoGi
	S+Vrdyfp3PxQwbDYx/OPGX4CTrEBZCDOd7nibyf6efNC2GD2A4/bBd8mU6jbvPzUS2wjLZ/PMeb
	XEBnOrmIIS88mZoorMq8wrPoZnUmgKD9pLLOqHwUaIZcQzYikKH378SFGS1DvqAKxjPEtRs3N13
	dytA8RK4+BW9/DAOYH5iIGueiqGlGi++Cw00EwYefxwD9DCgR4RykXBn7YG7n3J9FZ0didk5+4B
	606X6uJoux7Xr+fhsARxPhEZ+0WK+w5TM5yI0sGr5oZIqKUbZyKZB5XC9no40l74Ayy0XGE8CAr
	uppUWkAdvfWeKp364F8IXWpbwVfs3DI+RaKlTNrxNvhmpAHwePR+5noftwMKznD9M4pjdIuatxr
	whdEZkUFIHtcKOWx64Iq74+m+FF4PSECFa6uD57Zdyg7aQe2snwP5zralLTxSuddLNo
X-Received: by 2002:a05:600c:3b13:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a1d75ad08amr255798495e9.4.1792488269351;
        Tue, 20 Oct 2026 02:24:29 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:f99e:1a52:655b:681])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e3csm3881282f8f.53.2026.10.20.02.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:24:28 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <denis.benato@linux.dev>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Luke Jones <luke@ljones.dev>,
	Ivan Levchenko <me@livan.pro>,
	Nathan Chancellor <nathan@kernel.org>,
	Paolo Pisati <p.pisati@gmail.com>
Subject: [PATCH v4 4/7] HID: asus: Cycle the platform profile from the Zenbook Duo profile key
Date: Tue, 20 Oct 2026 11:24:14 +0200
Message-ID: <20261020092423.36380-5-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020092423.36380-1-p.pisati@gmail.com>
References: <20261020092423.36380-1-p.pisati@gmail.com>
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

From: Joshua Leivenzon <hacker1024@users.sourceforge.net>

The Zenbook Duo keyboard reports Fn+F, the performance mode key, as
vendor usage 0x9d. On the built-in keyboards of other ASUS laptops the
same key arrives through asus-wmi, which cycles the platform profile
in response. Do the same here so the key works on the detachable
keyboard too. Other ASUS devices may use the same usage for something
else, so only handle it on the Zenbook Duo keyboards.

asus_event() runs from the HID input path, which for USB is the URB
completion handler, while platform_profile_cycle() takes a mutex, so run
it from the driver's worker like the Fn-lock toggle, and consume the
event. Queue at most one cycle at a time, so that a device repeating the
key cannot grow the worker's list. Only call it when the platform
profile class is reachable: it is not built on architectures without
ACPI, where HID_ASUS still is, and it may be a module while HID_ASUS is
built in.

Signed-off-by: Joshua Leivenzon <hacker1024@users.sourceforge.net>
[pisati: defer platform_profile_cycle() to the worker and queue at
 most one cycle, only handle the usage on Zenbook Duo keyboards, return
 1 from asus_event() instead of propagating its return value, and
 guard the call with IS_REACHABLE(CONFIG_ACPI_PLATFORM_PROFILE)]
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/hid/hid-asus.c | 54 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 68211ebe1290..739637f1964a 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -29,6 +29,7 @@
 #include <linux/input/mt.h>
 #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf check */
 #include <linux/power_supply.h>
+#include <linux/platform_profile.h>
 #include <linux/leds.h>
 
 #include "hid-ids.h"
@@ -117,6 +118,7 @@ enum asus_work_action_type {
 	FN_LOCK_SYNC,
 	BRIGHTNESS_SET,
 	WMI_FAN,
+	PLATFORM_PROFILE_CYCLE,
 };
 
 struct hid_raw_event_data {
@@ -431,6 +433,36 @@ static int asus_kbd_fn_lock_set(struct asus_drvdata *drvdata, bool enabled)
 	return 0;
 }
 
+static int asus_platform_profile_cycle(struct asus_drvdata *drvdata)
+{
+	struct asus_worker *worker = drvdata->worker;
+	struct asus_work_action *action, *pending;
+
+	if (!IS_REACHABLE(CONFIG_ACPI_PLATFORM_PROFILE))
+		return 0;
+
+	guard(spinlock_irqsave)(&worker->lock);
+
+	/*
+	 * One pending cycle is enough: a key press cannot outrun the
+	 * worker, and a device repeating the key must not grow the list.
+	 */
+	list_for_each_entry(pending, &worker->actions, node) {
+		if (pending->type == PLATFORM_PROFILE_CYCLE)
+			return 0;
+	}
+
+	action = kzalloc_obj(struct asus_work_action, GFP_ATOMIC);
+	if (!action)
+		return -ENOMEM;
+
+	action->type = PLATFORM_PROFILE_CYCLE;
+	INIT_LIST_HEAD(&action->node);
+	asus_worker_schedule(worker, action);
+
+	return 0;
+}
+
 static int asus_kbd_wmi_fan_send(struct asus_drvdata *drvdata, u8 *report_data,
 				 size_t report_size)
 {
@@ -467,6 +499,20 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
 	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR &&
 	    (usage->hid & HID_USAGE) != 0x00 &&
 	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
+		/* Zenbook Duo Fn+F: cycle the platform profile */
+		if ((drvdata->quirks & QUIRK_ZENBOOK_DUO_KEYBOARD) &&
+		    (usage->hid & HID_USAGE) == 0x9d) {
+			if (value) {
+				ret = asus_platform_profile_cycle(drvdata);
+				if (ret) {
+					hid_err(hdev, "Failed to cycle the platform profile: %d\n",
+						ret);
+					return ret;
+				}
+			}
+			return 1;
+		}
+
 		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
 			 usage->hid & HID_USAGE);
 	}
@@ -773,6 +819,7 @@ static void asus_work(struct work_struct *work)
 	struct asus_worker *worker = container_of(work, struct asus_worker, work);
 	struct asus_work_action *action = NULL;
 	unsigned long flags;
+	int ret;
 
 	/*
 	 * Dequeue the next action, if any. Once teardown has begun .removed
@@ -801,6 +848,13 @@ static void asus_work(struct work_struct *work)
 	case WMI_FAN:
 		asus_kbd_wmi_fan(worker->hdev, &action->data.fan_hid_data);
 		break;
+	case PLATFORM_PROFILE_CYCLE:
+		if (!IS_REACHABLE(CONFIG_ACPI_PLATFORM_PROFILE))
+			break;
+		ret = platform_profile_cycle();
+		if (ret)
+			hid_dbg(worker->hdev, "Failed to cycle the platform profile: %d\n", ret);
+		break;
 	default:
 		hid_err(worker->hdev, "Invalid action type: %d\n", action->type);
 		break;
-- 
2.43.0

