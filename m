Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B86481661
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862961; cv=none; b=amiyxGPPy72r4jiLDIjLyAA4Gr5tGOBOkZiLZ7UYRcsU72smJs1osiqDSf96YJG3SSpUFFpwRJ3UnC1eoEwyh/0yEW06nSXhn311fS1d52HJh7VZJaS2LH13NtQ2owkLTsURxrtHlIGG686Bj2ihC+6meTuQ2sy9x1gQoGnUlcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862961; c=relaxed/simple;
	bh=+pwV1BLf376OQlAycLeQTh57nhL77y9ttRXyNGvVZIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HfhOgalTy9vuuhqCfqNmTqlLqyxpZMNQzlp59e1UtjoVeu/i/HB00y91yauw2NUchPEGRAvK7R2O7eGaHmsI3PKQubPYwtqmEzDbaEppaHRfSG3awGcltjba7ubanolA+ftNLtEuJvyedXfIObPAum/f681dfn2xymKcTfA8tdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lu2XeH9x; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lu2XeH9x"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1494547eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862957; x=1792467757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/ZFTuU6ysHjMR8HpQwB0BVfItHewIjMEkFYMIjIRl0=;
        b=lu2XeH9x9OYUNeD1xglje7J42RJ473BPx1x/29M3mz6+sivZkE+qMzZIaS/r6cLL3q
         ZRz1oINzpKDB3BRU40BKfp/y265FkbfSTN1q9bM864gZQW7yAt4NP7g5kAlo6PIaPQI6
         AX5igZmFiw1w0IjJd+MRLwGfybG00BCnggJPNkJdgejWMtjedp1igb+KfqM2HZ/aQymi
         n5OBAUTsG80VF9QBO6KQzxFov0AGoXzw/JV0FH1nQ3PD3Pnq5vy43BbHL7pssWam86E7
         oXlsYkNyENgEMRzeJRF9QfGVHJPhxAGH/D0HFa03j78LYJdR8Jk+qNnYUF3i50IuYAz6
         jKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862957; x=1792467757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/ZFTuU6ysHjMR8HpQwB0BVfItHewIjMEkFYMIjIRl0=;
        b=igq/NaJrO+LEu9Rs5nePV8D8nTd1h1SXhTSB3hu82jEfftJj+YSc8xBT+krPhGIFsY
         eEGz/8vxKtS9HaatXUKV4FHjrWR6YzmNGciVTuCvHxDs0UMli7wqIyF8hCHqfoA5/PxM
         QkUW1vrRdwmHXFySn5MzNzN0uAPUZUa3purC8Zt54riJ4nTzqzrHIwPDlKMLH6hkwh1p
         WaB07NKI8Ms1iMMixcDXyR9Zz8Leve3JDrXcr5VMLcuBXDw3k/B4BpjkFQb4q7CdJR8X
         RFg+lJOHBTzwcp3342jPqmteWlbRqQqM5ZszIGb4pNTTMbnFTLEJYS95C9ZHw+yDTPim
         5rWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCvSiuDKZyWtHSZ6uSj5y6HTJU2fY4HmPNmbApFPx9O8jyhwgYU44VA+ky0RWe0P+R4J+DyKRCE9V9Y2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfuIPEc/DhUOw/UoIQOuBe6eHVkJYGxaAjVg7NlImFiwgStQor
	2rt77yGvM011mNPlI7Z+8yVit9nYptwTGPiTIlSKAcaaMw/F0qXq3/De
X-Gm-Gg: AYBFou0tlWvkaupfKobgrMvKoTaSAWLhREPcv9KSsUN68KIXMlQvDhz05ZZUCc8H0C0
	pssHdDIuzoPO2fX7sJZVwdfDUjEhveWi0PiSI1S4hJ2BpanET3Ysm+CY3G/kkqPym5KFqVWCLpe
	48UhKau3Gb8IMjksyE1OvxK9UKtogWDEKyQDMbN3Aj/Ddv50eo9QZ2zqTCU0mlAFmGhQ9rwdjqY
	voSgyI4kXBNRaD6saDOa1BgDVlKtBOH+N/D4VEd1dsfYYU1TVK0heopUE9dJ7e9MovwSFOwudkw
	J1kw/ytyqbkYpDxVd/iaDxxToosrqs8AFLIHL3AIP1MndtndvQiYtW5NwhFD16U3lrKtSJJkU/R
	6h2xMYZckEytm957OOYnr8llreIagKC0VVD1/lkSKWtCDYQ7v66Z7KYLx2iyZ9EjVo9T8OJbuJe
	cyeXlWsWq6lTYNpVCVNCTjxMRKpManaZgjoAYjGBNAt2EVoYP6dsvW3CWiQryHlD+f3MXtY8pp+
	Egv5FfbAiOmB102EE9sKd+qmVSjlJ57PTAM5PRrlMYUz73cFhxzl+xj5G0D34U=
X-Received: by 2002:a05:7301:1826:b0:359:866d:5bea with SMTP id 5a478bee46e88-359866d78a0mr8979453eec.21.1791862957378;
        Mon, 12 Oct 2026 20:42:37 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:679a:f35b:7c29:e0f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm35268677eec.29.2026.10.12.20.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:42:36 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 12 Oct 2026 20:42:24 -0700
Subject: [PATCH 8/9] HID: multitouch: Drop redundant report ID validation
 in mt_get_feature
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-hid-core-report-validation-v1-8-e0dd5cb60b2e@gmail.com>
References: <20261012-hid-core-report-validation-v1-0-e0dd5cb60b2e@gmail.com>
In-Reply-To: <20261012-hid-core-report-validation-v1-0-e0dd5cb60b2e@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 David Rheinsberg <david@readahead.eu>, 
 Frank Praznik <frank.praznik@oh.rr.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, Even Xu <even.xu@intel.com>, 
 Xinpeng Sun <xinpeng.sun@intel.com>, 
 Roderick Colenbrander <roderick.colenbrander@sony.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, Shashikirana H K <shashikiranah@chromium.org>
X-Mailer: b4 0.17-dev-e56a4

Now that the core HID layer validates returned report IDs centrally and
provides a quirk for devices with mismatched responses, remove the
per-driver report ID check in the multitouch driver.

Also drop the dedicated class and device entry for the ASUS ROG Flow
Z13 touchpad, as the device now falls back cleanly to the generic Win 8
multitouch entry.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-multitouch.c | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 4e19a0c4d238..69f770a5c430 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -79,7 +79,6 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_APPLE_TOUCHBAR		BIT(23)
 #define MT_QUIRK_YOGABOOK9I		BIT(24)
 #define MT_QUIRK_KEEP_LATENCY_ON_CLOSE	BIT(25)
-#define MT_QUIRK_IGNORE_FEATURE_ID_MISMATCH	BIT(26)
 
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -236,7 +235,6 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 #define MT_CLS_APPLE_TOUCHBAR			0x0114
 #define MT_CLS_YOGABOOK9I			0x0115
 #define MT_CLS_EGALAX_P80H84			0x0116
-#define MT_CLS_ASUS_ROG_Z13_FOLIO		0x0117
 #define MT_CLS_SIS				0x0457
 
 #define MT_DEFAULT_MAXCONTACT	10
@@ -407,16 +405,6 @@ static const struct mt_class mt_classes[] = {
 		.quirks = MT_QUIRK_ALWAYS_VALID |
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_ASUS_CUSTOM_UP },
-	{ .name = MT_CLS_ASUS_ROG_Z13_FOLIO,
-		.quirks = MT_QUIRK_ALWAYS_VALID |
-			MT_QUIRK_IGNORE_DUPLICATES |
-			MT_QUIRK_HOVERING |
-			MT_QUIRK_CONTACT_CNT_ACCURATE |
-			MT_QUIRK_STICKY_FINGERS |
-			MT_QUIRK_WIN8_PTP_BUTTONS |
-			MT_QUIRK_CONFIDENCE |
-			MT_QUIRK_IGNORE_FEATURE_ID_MISMATCH,
-		.export_all_inputs = true },
 	{ .name = MT_CLS_VTL,
 		.quirks = MT_QUIRK_ALWAYS_VALID |
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
@@ -519,7 +507,6 @@ static const struct attribute_group mt_attribute_group = {
 
 static void mt_get_feature(struct hid_device *hdev, struct hid_report *report)
 {
-	struct mt_device *td = hid_get_drvdata(hdev);
 	int ret;
 	u32 size = hid_report_len(report);
 	u8 *buf;
@@ -541,25 +528,12 @@ static void mt_get_feature(struct hid_device *hdev, struct hid_report *report)
 		dev_warn(&hdev->dev, "failed to fetch feature %d\n",
 			 report->id);
 	} else {
-		/*
-		 * The report ID in the request and the response should match.
-		 * Some firmware (e.g. the ASUS ROG Z13 Folio
-		 * touchpad) returns a mismatched ID on this specific fetch;
-		 * tolerate it only for devices explicitly flagged as such.
-		 */
-		if (report->id != buf[0] &&
-		    !(td->mtclass.quirks & MT_QUIRK_IGNORE_FEATURE_ID_MISMATCH)) {
-			hid_err(hdev, "Returned feature report did not match the request\n");
-			goto free;
-		}
-
 		ret = hid_report_raw_event(hdev, HID_FEATURE_REPORT, buf,
 					   size, size, 0);
 		if (ret)
 			dev_warn(&hdev->dev, "failed to report feature\n");
 	}
 
-free:
 	kfree(buf);
 }
 
@@ -2734,12 +2708,6 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
 			   I2C_VENDOR_ID_HANTICK, I2C_PRODUCT_ID_HANTICK_5288) },
 
-	/* Asus ROG Flow Z13 (2025) GZ302EA keyboard-cover touchpad */
-	{ .driver_data = MT_CLS_ASUS_ROG_Z13_FOLIO,
-		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
-			USB_VENDOR_ID_ASUSTEK,
-			USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO) },
-
 	/* Generic MT device */
 	{ HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
 

-- 
2.56.0.385.gd3acb90ef8-goog

