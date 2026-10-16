Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE134B3C85
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792190536; cv=none; b=cLXgHOW31StK+cK7c9n3KUGlSyKDoBivHOX6KhgnRRYw3Z+FJoVEma4oGQfY3aMaw4HOwwn0mxRJcym4fu6V2P44i4vwSOo15NWNQQ1DFzJQ/0QBqXYLQQqQWbVYIoLqNTLWoB00pZn7kwaK/hDfuAmUzl3c6cIO5oseVbOjyTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792190536; c=relaxed/simple;
	bh=Rw9aV4le86GVAEmQTP31OJXRV0V+qY5c0x7bP9ImTYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ujzlX9viwemPERIQo9nhtu411WwAOpCoSPn+Ifggvwhgt3tA41gi4el2mR2X/V4Nb/igKAjswiFSHeX0pRBNeXTWZftbrAsT54Mqkcy95ZQINxhQLLdE4UuGTPam62Nk8olbcgGrZoWQDkWOqg5xt2fzez115V2pnKcCsLOyPRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kU7RV4dH; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kU7RV4dH"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35829219da8so1608126eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792190534; x=1792795334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IjuLIsLQ3Bd+lun4kkKhpyxvOHsckr/v5FH4N+lOssM=;
        b=kU7RV4dH7TS6qo2U6eYb8Wz4VdQwzF0sh7iO+dI7KULziRBbge7am/jinDfi+eBn+j
         3NcYQUO9m0g5tuybHYNNGP4thwZMChqIrlJmGz/5CUdMpZO8ut4qgaAGFjd/ixQEB1LT
         2wa0S8rVhhaFwTbrnwJfHTXhvacwMjXIpgTnm7gpkGjZs492qwk/6wUuKcyOpMY7kKNX
         QLKXMRrpjxWzbMxZiPGkKkyv1LYqhNxBO/lwD1aTc2Ihb1bcPq1hC9FKvURKQvmolca7
         DAyin/ll6/BdM3O2AgwFy+eYT9PUiaHSiD2d36FxPgfxgYCVv9AZ10VhI5+O3stxR2zJ
         gnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792190534; x=1792795334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjuLIsLQ3Bd+lun4kkKhpyxvOHsckr/v5FH4N+lOssM=;
        b=mAvk7YIVtg5p3OFyCDrfq1YpQ461sDoMHcrbpP3dWDgGUgDD2xa5mc1Jq96d1fI/tL
         osuBfvnC2q0l2A24uLcPvQFiwVoEyaiYnR5FwWvuNIN/e3BU3OIeFM3Xe5GYdjVp9Hdw
         6tseCzGLPgXtRwoUidTC6kQtZ85ubf2uK6TpTI6gLd5aEvRjsUEmEZqedsN1tRMfXJ5g
         LTSUYxz6Ft3GiSl4p3f6wr4GvA5IdQiOAl6EpYI4/LIXbd+LIhCwEhLAJmyS39H1mz7f
         8fIRXLYXmPel73SZ4xDKu5G8oZcBkEvE6h9Y8Ni9KYYt/d9M3TLFJ7yI28xotEIdHSv/
         B+wQ==
X-Forwarded-Encrypted: i=1; AKwUvBylzXGblu0uWzaz8foPysKvf05/Vpde7gyJhwX7Von7SNr5nleY822RSI78RWm7lWVKrgj01xFDVRKljsQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXePAkcZvzslv7bDuKYpzzInclWyEQGoQoLBmjETbrDOi6WQa/
	Pcl8JU6JxmiiekDvzcZJmlYZLNa07R8/uVlnb+cKuzN9kthRyVz3Gkk2
X-Gm-Gg: AYBFou1KFAVI6mdszGho2zX3gOxl4Q3jMBiMsRQ/lkzX6QXmB4PQcVPx/05FWp725/Z
	OkURoDBfPkTTEAQnUu9Hk7ddR8u1fhv3pOetomKmnP2e/v3rVVc8lKiLe0Xs02wxI29mHmM+r/w
	BHdDM0NcxODEtH+dvv9DCCEkbH2cGixr6in0sJFttpPbEpHjwgjnkQWREgVYh4lc3/bzKuohYfT
	3ytEfmsLilKt5XJgqckAHHK+40dUuKcVEIqxXfyfE32nz4JpANbYm6VHgUKlsATrWwoqQh4MY7a
	AT4tkGcncx5rqwP3UGREQJpttZ+dJhlGpVKAfHkp8wcpzOEZd8kBN9RIybveXn0gewm5iVqWSQT
	N7Rx2Zjbh0iNJXuODSvb/QvJE4Kz63b9vB/MYyWhdi0clGPihx7slP5rF43faK+iUNB5rIvcnaK
	rPi2leLyHp0erAcOcfKQlBqZ/cVMKKfGzDwopXHSN2x1kc7vBF7aKmRjqqPla33ze/Wfxpll+WP
	q1O7J7wMJfLEEAMcxIdkv4awi7guJodUQRO2vNnJEmhoI4qV8HGXIiVn0NMj8c=
X-Received: by 2002:a05:7022:1407:b0:183:840:1dad with SMTP id a92af1059eb24-18308402161mr4345887c88.14.1792190533933;
        Fri, 16 Oct 2026 15:42:13 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:34f0:f27d:9a5d:56e0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm8252348c88.21.2026.10.16.15.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:42:12 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 16 Oct 2026 15:41:52 -0700
Subject: [PATCH v2 5/5] HID: hidraw: Make hidraw.h private to HID subsystem
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-test-hidraw-base-v2-5-153f67a20cad@gmail.com>
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

With all external consumers converted to use the hidraw instance helper,
hidraw.h no longer needs to be exposed in include/linux.

Move the header into drivers/hid, keep private buffer and list
structures internal to hidraw.c, and drop unneeded symbol exports
since hidraw and hid-core are built into the same module.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-core.c                  |  2 +-
 drivers/hid/hid-cp2112.c                |  2 +-
 drivers/hid/hid-led.c                   |  2 +-
 drivers/hid/hid-u2fzero.c               |  2 +-
 drivers/hid/hidraw.c                    | 33 +++++++++++++++++++++++++++++----
 {include/linux => drivers/hid}/hidraw.h | 29 +----------------------------
 6 files changed, 34 insertions(+), 36 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 85433f64bda1..8ee3be98811a 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -31,10 +31,10 @@
 #include <linux/hid.h>
 #include <linux/hiddev.h>
 #include <linux/hid-debug.h>
-#include <linux/hidraw.h>
 
 #include "hid-core.h"
 #include "hid-ids.h"
+#include "hidraw.h"
 
 /*
  * Version Information
diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 148946b04bff..0f65ce44e677 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -20,7 +20,6 @@
 #include <linux/cleanup.h>
 #include <linux/gpio/driver.h>
 #include <linux/hid.h>
-#include <linux/hidraw.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -28,6 +27,7 @@
 #include <linux/string_choices.h>
 #include <linux/usb/ch9.h>
 #include "hid-ids.h"
+#include "hidraw.h"
 
 /**
  * enum cp2112_child_acpi_cell_addrs - Child ACPI addresses for CP2112 sub-functions
diff --git a/drivers/hid/hid-led.c b/drivers/hid/hid-led.c
index 63fd723d9e69..f5a798c7979e 100644
--- a/drivers/hid/hid-led.c
+++ b/drivers/hid/hid-led.c
@@ -8,12 +8,12 @@
  */
 
 #include <linux/hid.h>
-#include <linux/hidraw.h>
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 
 #include "hid-ids.h"
+#include "hidraw.h"
 
 enum hidled_report_type {
 	RAW_REQUEST,
diff --git a/drivers/hid/hid-u2fzero.c b/drivers/hid/hid-u2fzero.c
index 83e223c12cd6..4b9271b4e45e 100644
--- a/drivers/hid/hid-u2fzero.c
+++ b/drivers/hid/hid-u2fzero.c
@@ -12,7 +12,6 @@
  */
 
 #include <linux/hid.h>
-#include <linux/hidraw.h>
 #include <linux/hw_random.h>
 #include <linux/leds.h>
 #include <linux/module.h>
@@ -21,6 +20,7 @@
 
 #include "usbhid/usbhid.h"
 #include "hid-ids.h"
+#include "hidraw.h"
 
 #define DRIVER_SHORT		"u2fzero"
 
diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
index 949e7546339f..9d0df711ed5d 100644
--- a/drivers/hid/hidraw.c
+++ b/drivers/hid/hidraw.c
@@ -27,8 +27,36 @@
 #include <linux/mutex.h>
 #include <linux/sched/signal.h>
 #include <linux/string.h>
+#include <uapi/linux/hidraw.h>
+
+#include "hidraw.h"
+
+struct hidraw {
+	unsigned int minor;
+	int exist;
+	int open;
+	wait_queue_head_t wait;
+	struct hid_device *hid;
+	struct device *dev;
+	spinlock_t list_lock;
+	struct list_head list;
+};
+
+struct hidraw_report {
+	__u8 *value;
+	int len;
+};
 
-#include <linux/hidraw.h>
+struct hidraw_list {
+	struct hidraw_report buffer[HIDRAW_BUFFER_SIZE];
+	int head;
+	int tail;
+	struct fasync_struct *fasync;
+	struct hidraw *hidraw;
+	struct list_head node;
+	struct mutex read_mutex;
+	bool revoked;
+};
 
 static int hidraw_major;
 static struct cdev hidraw_cdev;
@@ -594,7 +622,6 @@ int hidraw_report_event(struct hid_device *hid, u8 *data, int len)
 	wake_up_interruptible(&dev->wait);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(hidraw_report_event);
 
 int hidraw_connect(struct hid_device *hid)
 {
@@ -651,7 +678,6 @@ int hidraw_connect(struct hid_device *hid)
 	return result;
 
 }
-EXPORT_SYMBOL_GPL(hidraw_connect);
 
 void hidraw_disconnect(struct hid_device *hid)
 {
@@ -663,7 +689,6 @@ void hidraw_disconnect(struct hid_device *hid)
 
 	up_write(&minors_rwsem);
 }
-EXPORT_SYMBOL_GPL(hidraw_disconnect);
 
 /**
  * hidraw_instance - get hidraw instance minor number for a HID device
diff --git a/include/linux/hidraw.h b/drivers/hid/hidraw.h
similarity index 63%
rename from include/linux/hidraw.h
rename to drivers/hid/hidraw.h
index 3021454ba513..a822007ce5f8 100644
--- a/include/linux/hidraw.h
+++ b/drivers/hid/hidraw.h
@@ -6,35 +6,8 @@
 #define _HIDRAW_H
 
 #include <linux/errno.h>
-#include <uapi/linux/hidraw.h>
 
-
-struct hidraw {
-	unsigned int minor;
-	int exist;
-	int open;
-	wait_queue_head_t wait;
-	struct hid_device *hid;
-	struct device *dev;
-	spinlock_t list_lock;
-	struct list_head list;
-};
-
-struct hidraw_report {
-	__u8 *value;
-	int len;
-};
-
-struct hidraw_list {
-	struct hidraw_report buffer[HIDRAW_BUFFER_SIZE];
-	int head;
-	int tail;
-	struct fasync_struct *fasync;
-	struct hidraw *hidraw;
-	struct list_head node;
-	struct mutex read_mutex;
-	bool revoked;
-};
+struct hid_device;
 
 #ifdef CONFIG_HIDRAW
 int hidraw_init(void);

-- 
2.56.0.176.g3575e65682-goog

