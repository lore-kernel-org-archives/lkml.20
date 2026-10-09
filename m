Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5A44E9C12
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560110; cv=none; b=T2SBYz8MqSDEIiwngFJ1RzV0J8KiZRprm8Gqic5GjkRpJfnBoE9k4UmSrLFo8kgLZALSlgTnK74mv282jz4Bc6FXi3BNl7ZfhT+V8quGbCL19fOLpgzfahtx/vohbUeG3GUvOa2UuUeoQ/XG2OgP49guDnCyjWG28hEjD5//Hfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560110; c=relaxed/simple;
	bh=/geYCLbgDeboszR2jIE5Kr9YAe4qKuu+XUg2uw25pcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fVAvbA37Vy4seEOfDBQu5iKb2R6v3CNjTZDtV1k7ufKZZ+eIpFAUDqG91KHHTTpGcvunNecPR3b13BfKngXHoqFfX1NFVveUWBPi20MhYfgxkfXllxRkVgLdRL/5ltD79Bdv7Qs8qaODd7BtqmfxDsvrQbAqvYEYrqEiWMj0G+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A13wNybW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A13wNybW"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso68074465e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560106; x=1792164906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/MALYNLDu4rLJ0xw+sk+kWVNqgtMW24f0NM5gjpHM8=;
        b=A13wNybWJFXIs9KZV/VaXBexOsfIYSE/v2F1QpO9o2KzkCaOn0kTJEb76VxXlCcVZt
         7uvr9AQGjLvQ+eTdunid9q0frkjWTra9XCnjI5ObV2R7S2Wtg+wBCrjODtwk4B8mqqME
         yVkDzVbIMJdxi4HYWbbRuaJChM1/nWYTH2Pe/+4X/873owPKr1csLzNMtCN6me4DLxjN
         nQgzkDYfGAWO5gujT73MX5JAp2a+pdj3PLxnPuh63sYGF6RVC8tL34D3kZaM8qvXjTSM
         Mi77AfpOB8jvwHhfoFl6nq+aqR+YWPJGBi08/tvQUuHrToMeYsDGHqPepJSaxLASYfcZ
         Y+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560106; x=1792164906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/MALYNLDu4rLJ0xw+sk+kWVNqgtMW24f0NM5gjpHM8=;
        b=xN1Eek3Sh/BO4Zh0NNmeZW0fEMwKmxM4Hbej47axxUrYfYSfA0MXPxU9+7/1LzAvbU
         uGOY2+iYIKrRd4Iv7lj1LIU+XiGr6O4tk/REqWGVIzK5JQdi9r7s1rFIHaLKzoc9H0Uf
         rO41J1hXn0/wmQyxgpsZ2eFLd5nVZCREYx1Hoq+EVTfGiDAWxOKF0LbbkuFDTCwsh4Yq
         bwFalYvmndf1wI4aKNDkWuSJwISICFbqMYMmW4hLojZM7rCo05w4Jei0Sn5WAuFNjPLQ
         YYOElpbN7Oooey0Pjg0nKWItat7ZwwaFskkDsBfw9kbYIlXzj9lVWt851b92nAAgr+xK
         HtSw==
X-Forwarded-Encrypted: i=1; AKwUvBxVoe5d7ekEEbK8tyjKtzhf4R81M/Jw724l7hqYr1JMDJQ1iPj+cvbZt0mlZCCBuZto6pSfm1w2b0s0WVc=@vger.kernel.org
X-Gm-Message-State: AFuF++nOGn7hmkV+TOA92dBrU368zQ6rWBYEHSjyqXlQHb2yLbh5MXR3
	0vE5/M5ZO9elERUMI91cQTqLkOfLcCj2kwjKXJy2e7iHzSGx/Zd0sjBA
X-Gm-Gg: AYBFou1iMK4NoX4TSr4t4n+sFDgBOcqMjWiXT8vJUEDORTXU72nlQYvMcMd2rNNymH8
	pr++JuRVUCRDsorY8hHuZtoKqBMDu3hHb/mhB466foOLOy5eyHhbsb2gtv9/GY6R+PT+aQuTxbV
	zxn07vmbCCe5kU66DIcvsMVLV3ioGCdcf4XRfFX2U1maW0oCK6aMT5qYwa+UvxVXylerGzzqRvs
	ybJkrGa1AlddKdEDpzVUH4IFscBPFmU3wOse0jXLjIaCwZf6uU3OEKWp+dUMMyHFsz/XIo+JTcJ
	+SJ5jIcH/kcYsK6LoNDLakc8kzUNKUk5wuYEvqA1EGe/P5o3m/1n67yDynNAynRZPOdSfxE1P7l
	F166wLWq93EQOtwd9I1x8M2FpeXFrSmcMyjqe/K2xq5rZBYK16XyD+qO3th+fswvzIF8ov5e7yM
	dm7dt9LjWZYTrp03vH6fZ9BmmY8ChDxHXenhkmir1mfEV9F/wWDHa1MLncmD+oh0LPHSPYEWfcP
	T4GvQTNwIUl3YSnYQ0+X4p1GyxNL0PILtjooj6ue9KgiaMomzRSq/a9ag==
X-Received: by 2002:a05:600c:c165:b0:4a1:706f:b40d with SMTP id 5b1f17b1804b1-4a18e4988ecmr46519465e9.7.1791560106007;
        Fri, 09 Oct 2026 08:35:06 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:8516:411c:ea75:bb84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db99b800asm4244885f8f.22.2026.10.09.08.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 08:35:05 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luke Jones <luke@ljones.dev>,
	Ivan Levchenko <me@livan.pro>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v2 4/7] HID: asus: Cycle the platform profile from the Zenbook Duo profile key
Date: Fri,  9 Oct 2026 17:34:31 +0200
Message-ID: <20261009153459.124752-5-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009153459.124752-1-p.pisati@gmail.com>
References: <20261009153459.124752-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Leivenzon <hacker1024@users.sourceforge.net>

The Zenbook Duo keyboard reports Fn+F, the performance mode key, as
vendor usage 0x9d. On the built-in keyboards of other ASUS laptops the
same key arrives through asus-wmi, which cycles the platform profile
in response. Do the same here so the key works on the detachable
keyboard too.

asus_event() runs from the HID input path, which for USB is the URB
completion handler, while platform_profile_cycle() takes a mutex, so
run it from the driver's worker like the Fn-lock toggle, and consume
the event. Only call it when the platform profile class is reachable:
it is not built on architectures without ACPI, where HID_ASUS still
is, and it may be a module while HID_ASUS is built in.

Signed-off-by: Joshua Leivenzon <hacker1024@users.sourceforge.net>
[pisati: defer platform_profile_cycle() to the worker, return 1 from
 asus_event() instead of propagating its return value, and guard the
 call with IS_REACHABLE(CONFIG_ACPI_PLATFORM_PROFILE)]
Assisted-by: LLM
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/hid/hid-asus.c | 53 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index d69431615c27..d8a931290c9a 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -29,6 +29,7 @@
 #include <linux/input/mt.h>
 #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf check */
 #include <linux/power_supply.h>
+#include <linux/platform_profile.h>
 #include <linux/leds.h>
 
 #include "hid-ids.h"
@@ -115,6 +116,7 @@ enum asus_work_action_type {
 	FN_LOCK_SYNC,
 	BRIGHTNESS_SET,
 	WMI_FAN,
+	PLATFORM_PROFILE_CYCLE,
 };
 
 struct hid_raw_event_data {
@@ -423,6 +425,28 @@ static int asus_kbd_fn_lock_set(struct asus_drvdata *drvdata, bool enabled)
 	return 0;
 }
 
+static int asus_platform_profile_cycle(struct asus_drvdata *drvdata)
+{
+	struct asus_work_action *action;
+	unsigned long flags;
+
+	if (!IS_REACHABLE(CONFIG_ACPI_PLATFORM_PROFILE))
+		return 0;
+
+	action = kzalloc_obj(struct asus_work_action, GFP_ATOMIC);
+	if (!action)
+		return -ENOMEM;
+
+	action->type = PLATFORM_PROFILE_CYCLE;
+	INIT_LIST_HEAD(&action->node);
+
+	spin_lock_irqsave(&drvdata->worker->lock, flags);
+	asus_worker_schedule(drvdata->worker, action);
+	spin_unlock_irqrestore(&drvdata->worker->lock, flags);
+
+	return 0;
+}
+
 static int asus_kbd_wmi_fan_send(struct asus_drvdata *drvdata, u8 *report_data,
 				 size_t report_size)
 {
@@ -459,8 +483,25 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
 	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR &&
 	    (usage->hid & HID_USAGE) != 0x00 &&
 	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
-		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
-			 usage->hid & HID_USAGE);
+		/*
+		 * Some vendor usages do not map to a key and need special
+		 * handling.
+		 */
+		switch (usage->hid & HID_USAGE) {
+		case 0x9d: /* Zenbook Duo Fn+F: cycle the platform profile */
+			if (value) {
+				ret = asus_platform_profile_cycle(drvdata);
+				if (ret) {
+					hid_err(hdev, "Failed to cycle the platform profile: %d\n",
+						ret);
+					return ret;
+				}
+			}
+			return 1;
+		default:
+			hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
+				 usage->hid & HID_USAGE);
+		}
 	}
 
 	if (usage->type == EV_KEY && value) {
@@ -765,6 +806,7 @@ static void asus_work(struct work_struct *work)
 	struct asus_worker *worker = container_of(work, struct asus_worker, work);
 	struct asus_work_action *action = NULL;
 	unsigned long flags;
+	int ret;
 
 	/* Save the action to be performed and clear the flag */
 	spin_lock_irqsave(&worker->lock, flags);
@@ -788,6 +830,13 @@ static void asus_work(struct work_struct *work)
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

