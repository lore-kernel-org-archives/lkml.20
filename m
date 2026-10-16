Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7866F46D2A9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792190526; cv=none; b=kZxxCZhrNQRgotuNMj/OG03BtZQQ9MIdq0I7FkfOEGX19QTPFR2Bo3LHpBt8R7lcKUZPm/d6hScWYw42h/MjmAlutWxjpr0cc/7EkAV7SdjCjfSJe3NqkflBbF7S9n6b/fpcU8RD39lDJXewWXRKZOyZv/IVkrwzmPfk4FpMeC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792190526; c=relaxed/simple;
	bh=WzorpVk9chapWpwOob8GI582boBmat7YJhHyMjbooXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XpMEe+LGHB4H6/MR2U+ASVXnYZowX3tqDl7VpV4XXhDVFlK6Px8pz5i8zPgdU9bpQy5ff4RDusuKQCclK9fwQzZg/4OiTj+TAeR05xwKIZmSLFlBgntUayT6Cf/ugoQtjz7l2lpyjHEyUW23U/U+PbIsd6vGlfIsqHuJ8k+GKFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqgtXGqt; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqgtXGqt"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35f1f76ea84so616419eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792190524; x=1792795324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxQ3juOVRNgpkeTcscN809epa+8Mjh4WA2LpDZqjj3A=;
        b=VqgtXGqtH/e92bl1UBv7Jmagt6vwQ4CWpFA8nPR5hnebRj1t/ZwPA2ez2pgfdvntOP
         Z5HqoiY/ijUTvvqjdQ67VaRtb0ILb/oEL0YtD+f/VDNbG/XdOBoalguOj/KLzoNhB+QA
         8nJPgSFgYVAABMk/vqeoKCGoZZz3suvddQpGSv4ERA6hyVYP2TA0/kpdN3HTeenZ6k0k
         XCn99w5zP7Wdv5t2hQuy5dQgmqAGiR++6xll/Ao6NhS/WjufgILY9hy9DlgGOvDGM6q/
         Ap0uYqdU2m0n0fnSzTSZUraJeraavf+j5ykAI9P2JWN5CY5XE1wRpY+GsoxpR6Gv56cT
         smZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792190524; x=1792795324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxQ3juOVRNgpkeTcscN809epa+8Mjh4WA2LpDZqjj3A=;
        b=YL3z8QEsRgjcQs6CNwS2+bZw2WyhvhOkUqB06BiZr+7s9VUCwRNf21Xq7+5CeXHDh/
         aMiBiiRBtwzOxrfMh8yfdltprbg3bxjr9d4OC43OtinMgnCur3RY7j7FUEuQHz+9ghIv
         4azqFyzRrcV/ivL1tk+AwmSV1QuW1r5V3eD1P031ooUtnB9hOfzwJT/fjZrkttuON+CO
         Uu5kIXYi6s+yT3L/MEHe3Z6Xp0U2n/zy4M4VTIG5fZ1ZFz4EuuyF14VUerE5G3HTst6d
         aDxLi/isnxW0QgjLYUgj4tGz2hJSns23vzfepVzoqgSRI2vBYsobOi47GKOxpsXz4UG7
         UfbQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4v9chMrYkWQ+IA4o/Wbz8bSXRvHf5ntrgq56lq+Bw96GOUKHezs/5r/BbuGmJCVgQBfinsfraBjLiYl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7ng+c4arSQybFJCwAY/yLZszZDM6zBpZd8YaTQDjojqFcjzvP
	XBywGADCowazKqDUJsGFLTB2EzprnqSgv2BhlJ1AhceJeMiCZ/P3KLhD
X-Gm-Gg: AYBFou3k6gvJi4YoY79Ka4dKWOrzFsx+YI8AUOaS+7G8BJxC5My7IIaxncUYUytYF0Q
	5FKFrgZuYFz/0WTz2wSXdaynY9tRp4sgsYSN21g6YlnNd3WZCdQf9C3rWlSOMesiTAv2OQchVX6
	67JQwV2TPEzeIuvSyL96KpaGpheEGqbjS+U1flEAXzMA7Pyp+BcY9xD8hSKQDvHmeYbr9B9ck+6
	lcg4L5fVmX+V+RrO42AfYAfcWHYZ7fnrMG3M99oqU8BQ8LJxgdMEVIX+6PuQI267udBMpaEblmL
	PYDYwbNOtr4es6Yxt6pXfiTWLpiwjWlW4IXDP4f4Cgv602n7016WDoqgHwXws0+ZyPLruvv6cSq
	xwiBOTTkWfSDrn0wgCz8fYCFAZ0vfJcPpKQ959Ob+tVTQ8fjCb5TbBkuqy06KERC/Y9erqE2paP
	O4Lc9XKMUjpHn7lZi+VEuT45Ix2YCT2jtUTjREQEDP9mE6dxANFi84UjoAEk6pFf75B3BQhKblg
	radob+ZkQZH91XpL3qUlyCBb6XK8ZalyD8ZebUXoMU9QjQrTARKBXU++URh148=
X-Received: by 2002:a05:701b:450f:10b0:185:33ab:4d55 with SMTP id a92af1059eb24-18533ab4e84mr1428104c88.29.1792190524384;
        Fri, 16 Oct 2026 15:42:04 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:34f0:f27d:9a5d:56e0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm8252348c88.21.2026.10.16.15.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:42:02 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 16 Oct 2026 15:41:48 -0700
Subject: [PATCH v2 1/5] HID: core: Move internal declarations and drop
 unused exports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-test-hidraw-base-v2-1-153f67a20cad@gmail.com>
References: <20261016-test-hidraw-base-v2-0-153f67a20cad@gmail.com>
In-Reply-To: <20261016-test-hidraw-base-v2-0-153f67a20cad@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Michael Zaidman <michael.zaidman@gmail.com>, Rishi Gupta <gupt21@gmail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Andrej Shadura <andrew@shadura.me>, 
 Johannes Roith <johannes@gnu-linux.rocks>, linux-input@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Several declarations in the public HID header and exported symbols are
used solely within the core HID module (linked together from hid-core,
hid-input, and hid-quirks into hid.o).

Move internal request, input hook, resolution multiplier, and device
matching declarations into a private header shared across core HID
sources, and drop the unused GPL symbol exports.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-core.c   |  3 +--
 drivers/hid/hid-core.h   | 20 ++++++++++++++++++++
 drivers/hid/hid-input.c  |  4 +---
 drivers/hid/hid-quirks.c |  1 +
 include/linux/hid.h      |  8 --------
 5 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index ec7c2860c93e..e2944dbdc9e6 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -33,6 +33,7 @@
 #include <linux/hid-debug.h>
 #include <linux/hidraw.h>
 
+#include "hid-core.h"
 #include "hid-ids.h"
 
 /*
@@ -1249,7 +1250,6 @@ void hid_setup_resolution_multiplier(struct hid_device *hid)
 		}
 	}
 }
-EXPORT_SYMBOL_GPL(hid_setup_resolution_multiplier);
 
 static int hid_parse_collections(struct hid_device *device)
 {
@@ -2038,7 +2038,6 @@ int __hid_request(struct hid_device *hid, struct hid_report *report,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(__hid_request);
 
 int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *data,
 			 size_t bufsize, u32 size, int interrupt)
diff --git a/drivers/hid/hid-core.h b/drivers/hid/hid-core.h
new file mode 100644
index 000000000000..653bf0f32f94
--- /dev/null
+++ b/drivers/hid/hid-core.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __HID_CORE_H
+#define __HID_CORE_H
+
+#include <linux/hid.h>
+
+int __hid_request(struct hid_device *hid, struct hid_report *report,
+		  enum hid_class_request reqtype);
+
+int hidinput_connect(struct hid_device *hid, unsigned int connect_mask);
+void hidinput_disconnect(struct hid_device *hid);
+void hidinput_hid_event(struct hid_device *hid, struct hid_field *field,
+			struct hid_usage *usage, __s32 value);
+void hidinput_report_event(struct hid_device *hid, struct hid_report *report);
+
+void hid_setup_resolution_multiplier(struct hid_device *hid);
+bool hid_match_one_id(const struct hid_device *hdev,
+		      const struct hid_device_id *id);
+
+#endif /* __HID_CORE_H */
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index edd6bbf8342b..d7213f1c417c 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -20,6 +20,7 @@
 #include <linux/hid.h>
 #include <linux/hid-debug.h>
 
+#include "hid-core.h"
 #include "hid-ids.h"
 
 #define unk	KEY_UNKNOWN
@@ -1805,7 +1806,6 @@ void hidinput_report_event(struct hid_device *hid, struct hid_report *report)
 	list_for_each_entry(hidinput, &hid->inputs, list)
 		input_sync(hidinput->input);
 }
-EXPORT_SYMBOL_GPL(hidinput_report_event);
 
 static int hidinput_find_field(struct hid_device *hid, unsigned int type,
 			       unsigned int code, struct hid_field **field)
@@ -2447,7 +2447,6 @@ int hidinput_connect(struct hid_device *hid, unsigned int connect_mask)
 
 	return -1;
 }
-EXPORT_SYMBOL_GPL(hidinput_connect);
 
 void hidinput_disconnect(struct hid_device *hid)
 {
@@ -2469,7 +2468,6 @@ void hidinput_disconnect(struct hid_device *hid)
 	 * synchronously and are safe. */
 	cancel_work_sync(&hid->led_work);
 }
-EXPORT_SYMBOL_GPL(hidinput_disconnect);
 
 void hidinput_reset_resume(struct hid_device *hid)
 {
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 96a36c5ba04f..e885ce3f3a14 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -18,6 +18,7 @@
 #include <linux/mutex.h>
 #include <linux/input/elan-i2c-ids.h>
 
+#include "hid-core.h"
 #include "hid-ids.h"
 
 /*
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 8d17b741638c..4b58e9b4ae43 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1021,10 +1021,6 @@ extern void hid_unregister_driver(struct hid_driver *);
 	module_driver(__hid_driver, hid_register_driver, \
 		      hid_unregister_driver)
 
-extern void hidinput_hid_event(struct hid_device *, struct hid_field *, struct hid_usage *, __s32);
-extern void hidinput_report_event(struct hid_device *hid, struct hid_report *report);
-extern int hidinput_connect(struct hid_device *hid, unsigned int connect_mask);
-extern void hidinput_disconnect(struct hid_device *);
 void hidinput_reset_resume(struct hid_device *hid);
 
 struct hid_field *hid_find_field(struct hid_device *hdev, unsigned int report_type,
@@ -1038,7 +1034,6 @@ struct hid_field *hidinput_get_led_field(struct hid_device *hid);
 unsigned int hidinput_count_leds(struct hid_device *hid);
 __s32 hidinput_calc_abs_res(const struct hid_field *field, __u16 code);
 void hid_output_report(struct hid_report *report, __u8 *data);
-int __hid_request(struct hid_device *hid, struct hid_report *rep, enum hid_class_request reqtype);
 u8 *hid_alloc_report_buf(struct hid_report *report, gfp_t flags);
 struct hid_device *hid_allocate_device(void);
 struct hid_report *hid_register_report(struct hid_device *device,
@@ -1050,13 +1045,10 @@ struct hid_report *hid_validate_values(struct hid_device *hid,
 				       unsigned int field_index,
 				       unsigned int report_counts);
 
-void hid_setup_resolution_multiplier(struct hid_device *hid);
 int hid_open_report(struct hid_device *device);
 int hid_check_keys_pressed(struct hid_device *hid);
 int hid_connect(struct hid_device *hid, unsigned int connect_mask);
 void hid_disconnect(struct hid_device *hid);
-bool hid_match_one_id(const struct hid_device *hdev,
-		      const struct hid_device_id *id);
 const struct hid_device_id *hid_match_id(const struct hid_device *hdev,
 					 const struct hid_device_id *id);
 const struct hid_device_id *hid_match_device(struct hid_device *hdev,

-- 
2.56.0.176.g3575e65682-goog

