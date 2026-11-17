Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911481;
	b=U2sCR5o7QmPqHCQWqJurs7YbwurecM1aEJgY+A0/R9KZcz3RNQu2Q1LMROCx4XHb8iKS
	 kC7nF49Cbn2I9R1xMli+Z6pDmUtEh28G2pazmbglmcMMNNIFwpY7+JVGyUU/b7IGnZXTg
	 JBXeEm2VF+bj5nQ/bGWaDv8tiv5zWlY+Sn+KqRSIafRHookP2Uvpusz0BS7A5KC2xlyuV
	 nhmhJZYOYszYDeeNYKeBeC9PXX9x4+cVkhn4rw5o1IL8VH2IQLk28Ugyy4XHJ0XVUW6RO
	 8dN60FA6hHcM4cpm5vY86XAlXki6ym/vl9YttS0/W2sBETOUjm6MmBil3RvIevwWSmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZjzuyIj3209lQmCi+LHAzOkiKC1kjspF24AgT8ts6dw=;
	b=BBhe7gNG1b79OWZkhoXW7ZY1g+arfPXIwTqmLDjrBK8xlbDvZupxlcIEU1fAH8j8d915
	 wkRx/wKKX6HIDakccNCng967dfTprG2iLokfWf7w/OhYmBeyYbr1OH7Z5DOoEM9jZeVTI
	 AKS5hXeer7nZe+AVAR+uYxMpCD+/lUqrhzigEXz2YEM29IE/2sw6Ure2rnc1VStxpme17
	 4wOaR6Jai6xP2/5Nqgj9B2mIJzwM5XrLi7WFjLoD089vg5bIsBnwmnHj9usrpFsndP/HK
	 bp+yTHC5BXkbazEtrD6ecwOC8g4iap8nvaQGDKZi1T5NH1+x8hMkJuYvJwaP8+f7MMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCVTIjvu;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA753606A887
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA753606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCVTIjvu
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so13823515e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911478; x=1795516278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjzuyIj3209lQmCi+LHAzOkiKC1kjspF24AgT8ts6dw=;
        b=aCVTIjvulvBGfZyYiN1ZCfhyQbPeMolsFE3cDbSHrfYZ3wJZ3oQ9VKFbQqgzt6a/lw
         iICMTFXvq+uOI38esLcIInik4GnMcxRiwBDm7TbBpmNaKgWYg8jxsZ4mIYUSrpo9VMzx
         AxSdg6VtsQutmLTpF1lFBTJaNYIVOFcoqOi7UwCdagPLgi04+SQqTtpM26OfAQdKm5oO
         r15lfPgIAyuEmSt6L+rvzopJOzDh/lFv2FBCBcgTEiTqufq5JrXybhnf0X983b4XfHuv
         icNDicrBr8r42Em3nuD1i2/czUR4Uv2nhlth592AZ2B6+l2n5p7z13iiyImfeTNVEPWx
         WUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911478; x=1795516278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjzuyIj3209lQmCi+LHAzOkiKC1kjspF24AgT8ts6dw=;
        b=2c6FO+Pbf/BeYLk1ZGG/B4veM/umIeH1oymSLQGmVAhE3RJFPqaASmqFe2Ky4VXg/l
         KqhrhfA77PKJiOFfUl7fSP2mC0n1hbDUqpO+3ksIfHVJ17wMqN3ui4vBhG4TXfzM4/xH
         BhG1QhehQBJXYzgQQXBPafsL1g5xKaXDFZbTrS51OfqXxuGYFbB4wTjqg55V+8kpRroZ
         XaM7SfIoMKsTQL9ZD1DomcZY/rrp/E6K36CZPnwJj27IxaIXoiL1qykmMXSWBf2j60p+
         tNqFeA7HWkb0Y6qoj/T8mjbD0UufVOwsCpvZuvzVT8aIV95G4qALAF/mUBHNABycfTQK
         jcZg==
X-Forwarded-Encrypted: i=1; AL+hErHdnU4OYJjgevQY9R/zUx9RBDpPDD6ryym4nTleavtWofIikb8cyO0Dh+aaFljPiYtJm0DzpNWzNJJLpdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Igxas2PXgs0OUahieVMJvR2cUdL8a6htntsTKv7/thllcN6su
	iT3CyJ9IqnpFTT2FWrNroueHu0rseUPUZ7zuBk8gcbrHAgyKbmFpz/a6
X-Gm-Gg: AYBFou1yeA1qQR9xtgGd3C5fBBtwXX/XV1AXMd0aTHNw1j77xgbrGkAtUQUAqSlP7JV
	Q6tdwv8ICVnUUGt4R9thWuaou/5mN3+fNMhzeFIkEok5lLa7iRjkp9QOCW5qZTzKqHnNnYanj2q
	2zsvE2HHlMwe4NaAlGb5Spbi42s89ABIMsEU7deA3YoDZ+8+AxwNfuNrSRo2wwJCDpAwtuy8wxD
	CwrXh+ltQJdn0iLzOzU7mPhG1L8ZwddaY8egwWhuRZ+Quuj196yABfvoFavINPILWC9buGm7LcM
	6td1XrP+E7/tjLXFbbnwJUf7pXY2zKrlaOmwX/xR4b7CwotX8wjM/0V9cq+S6zlhtn7O+9Dr0MY
	nAokVkKIEDI8jkWW5AJ+dj3y0XQ2hDphPbv59Ax52zKG+W6IFCp5ibKj9IZqWIFj/qWDkUY0QDn
	cFj48rmwc/W+WCrJ6sNoMBRTRFSEgQfTVFIyOI1y4KGSkBHtVTRWhitYpoz2GVNSd0N/HlCjo62
	i33pvI/AGvL7Ngc8nCzVfshIJdWIXx32jzbgEplA2XmH5/8Uqo1DNbxNfIvFHdIs6ccoqKX9Ks7
	fgOzVQaSPav1vbYACONSRTxz8Nc=
X-Received: by 2002:a05:600c:8b35:b0:4bb:6b6b:fbaa with SMTP id 5b1f17b1804b1-4bb6b6bfc3dmr154009095e9.16.1794911477943;
        Tue, 17 Nov 2026 02:31:17 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783965d4sm57712355e9.7.2026.11.17.02.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:31:17 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Tue, 17 Nov 2026 13:31:05 +0300
Subject: [PATCH v5 2/3] platform/asus: asus-wmi: add TUF keyboard RGB
 readback support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-asus-tuf-rgb-v4-v5-2-95268035eef1@gmail.com>
References: <20261117-asus-tuf-rgb-v4-v5-0-95268035eef1@gmail.com>
In-Reply-To: <20261117-asus-tuf-rgb-v4-v5-0-95268035eef1@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-api@vger.kernel.org, Denis Benato <benato.denis96@gmail.com>, 
 Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

The TUF keyboard RGB attributes kbd_rgb_mode and kbd_rgb_state are
write-only, so userspace tools keep their own copy of the lighting
configuration and lose track of it whenever the EC changes state on its
own: after a firmware reset or a boot into another operating system the
tools show a stale configuration until the user rewrites every field.

DSTS device 0x0010005B evaluates the DSDT method EC0.KBLS(), which
snapshots the EC's host-visible keyboard state into a 16-byte buffer:
lighting mode, red, green and blue levels, animation speed, and the
four power-state flags.  The first byte is a constant 1 written by the
AML, which distinguishes a KBLS reply from any other object the method
could return.

Add kbd_rgb_read_status() to evaluate and validate that buffer via
asus->dsts_id, parse it through a packed struct, and convert both
attributes to DEVICE_ATTR_RW.  The read returns the write format with
"n/a" in the command position: the command word belongs to the write
verb (apply now or save to flash) and both verbs update the EC mirror
the same way, so there is no state to report there.  The three EC speed
codes map back to the sysfs indices 0 to 2.

Firmware without readback support does not always report it the same
way: on models such as the FX505DT, DSTS(0x00100056/57) reports the
devices present while 0x0010005B answers with a plain zero, which
asus_wmi_evaluate_method_buf() now decodes as -ENODATA.  Translate that
to -ENODEV for hardware without readback support, while passing -EIO and
-ENOSPC through unchanged.

Readback was verified against the EC firmware: the status bytes mirror
EC RAM at 0x0B22 to 0x0B2E, and the speed codes 0xe1, 0xeb and 0xf5
select animation step thresholds of 30, 20 and 10 ticks per phase,
which matches the slow, normal and fast labels.  Tested on a TUF
Gaming A15 (FA507NV).

Suggested-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/asus/asus-wmi.c           | 94 +++++++++++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |  3 +
 2 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/asus/asus-wmi.c b/drivers/platform/asus/asus-wmi.c
index 4d844f914f77e..4dfdf37dafaa5 100644
--- a/drivers/platform/asus/asus-wmi.c
+++ b/drivers/platform/asus/asus-wmi.c
@@ -1084,6 +1084,76 @@ static DEVICE_ATTR_RW(gpu_mux_mode);
 #define TUF_KBD_RGB_SPEED_SLOW		0xe1
 #define TUF_KBD_RGB_SPEED_NORMAL	0xeb
 #define TUF_KBD_RGB_SPEED_FAST		0xf5
+
+/* TUF keyboard RGB status readback *******************************************/
+struct asus_wmi_kbd_rgb_status {
+	u8 signature;
+	u8 mode;
+	u8 red;
+	u8 green;
+	u8 blue;
+	u8 speed;
+	u8 state;
+	u8 unused[9];
+} __packed;
+
+static int kbd_rgb_read_status(struct asus_wmi *asus,
+			       struct asus_wmi_kbd_rgb_status *status)
+{
+	int err;
+
+	err = asus_wmi_evaluate_method_buf(asus->dsts_id,
+					   ASUS_WMI_DEVID_TUF_RGB_READ_STATUS,
+					   0, (u8 *)status, sizeof(*status));
+	/*
+	 * Hardware without readback may answer with an integer (e.g. 0 on
+	 * FX505DT) instead of a buffer, causing asus_wmi_evaluate_method_buf()
+	 * to return -ENODATA; report -ENODEV to userspace.
+	 */
+	if (err == -ENODATA)
+		return -ENODEV;
+	if (err)
+		return err;
+
+	/* The AML writes a constant 1 here; anything else is not a KBLS reply */
+	if (status->signature != 1)
+		return -ENODEV;
+
+	return 0;
+}
+
+static ssize_t kbd_rgb_mode_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct asus_wmi *asus = container_of(led_cdev, struct asus_wmi, kbd_led);
+	struct asus_wmi_kbd_rgb_status status = {};
+	u32 speed;
+	int err;
+
+	err = kbd_rgb_read_status(asus, &status);
+	if (err)
+		return err;
+
+	switch (status.speed) {
+	case TUF_KBD_RGB_SPEED_SLOW:
+		speed = 0;
+		break;
+	case TUF_KBD_RGB_SPEED_FAST:
+		speed = 2;
+		break;
+	case TUF_KBD_RGB_SPEED_NORMAL:
+	default:
+		speed = 1;
+		break;
+	}
+
+	/* The command word belongs to the write verb, so report n/a. */
+	return sysfs_emit(buf, "n/a %u %u %u %u %u\n",
+			  status.mode, status.red, status.green, status.blue,
+			  speed);
+}
+
 static ssize_t kbd_rgb_mode_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1136,7 +1206,7 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
 
 	return count;
 }
-static DEVICE_ATTR_WO(kbd_rgb_mode);
+static DEVICE_ATTR_RW(kbd_rgb_mode);
 
 static DEVICE_STRING_ATTR_RO(kbd_rgb_mode_index, 0444,
 			     "cmd mode red green blue speed");
@@ -1157,6 +1227,26 @@ static const struct attribute_group kbd_rgb_mode_group = {
 #define TUF_KBD_RGB_STATE_AWAKE		BIT(3)
 #define TUF_KBD_RGB_STATE_SLEEP		BIT(5)
 #define TUF_KBD_RGB_STATE_SHUTDOWN	BIT(7)
+
+static ssize_t kbd_rgb_state_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct asus_wmi *asus = container_of(led_cdev, struct asus_wmi, kbd_led);
+	struct asus_wmi_kbd_rgb_status status = {};
+	int err;
+
+	err = kbd_rgb_read_status(asus, &status);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "n/a %d %d %d %d\n",
+			  !!(status.state & TUF_KBD_RGB_STATE_BOOT),
+			  !!(status.state & TUF_KBD_RGB_STATE_AWAKE),
+			  !!(status.state & TUF_KBD_RGB_STATE_SLEEP),
+			  !!(status.state & TUF_KBD_RGB_STATE_SHUTDOWN));
+}
+
 static ssize_t kbd_rgb_state_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1188,7 +1278,7 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 
 	return count;
 }
-static DEVICE_ATTR_WO(kbd_rgb_state);
+static DEVICE_ATTR_RW(kbd_rgb_state);
 
 static DEVICE_STRING_ATTR_RO(kbd_rgb_state_index, 0444,
 			     "cmd boot awake sleep shutdown");
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 66c7ab35d6c81..393fd3c5949ae 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -166,6 +166,9 @@
 /* TUF laptop RGB power/state */
 #define ASUS_WMI_DEVID_TUF_RGB_CMD	0x00100057
 
+/* TUF laptop RGB keyboard status readback */
+#define ASUS_WMI_DEVID_TUF_RGB_READ_STATUS	0x0010005B
+
 /* Bootup sound control */
 #define ASUS_WMI_DEVID_BOOT_SOUND	0x00130022
 

-- 
2.56.0

