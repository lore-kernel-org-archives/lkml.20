Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793231572;
	b=TKfm804BOI14PVI85AZvza/N+CSNTFhJ73DSKxacH/eF/RvoV1/V8rg+5+PyRTCjP3Qf
	 hKqu4LRQLGApX9mZqUhVHiXtR1U75op43L8WnR2XvI0WAWbORNGSBybvVZxsaxXT3TTD5
	 shG+7hXbjcfDsptMhN+wtX/FjKfVGT9/+lKjf8FsXe7fPp6hdqMoVRoEeg3RxYN/5DdK3
	 3D+4hCLSAlZiEXUgAaw3+srfbdPprvkfAUoeagIDAqj2g81p5tf6l1R3lbh0fZc80cwP4
	 y0eec3eBtAlVMtUayRzJqH0X2FWNi7kn5myNkg1Y0EEvGDwyv3Fmez1ZtsZmr+iGE7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793231572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Af/thxHkdC33DwjakI5xWjPNHFxWjZZYhh+Bu6x+bIY=;
	b=lyMtOdTIkqxiU6ZrSNuRCyJgqZi6OyInutjK52RPHmpSe2Dok0/M3YkkbftKjN2II3ln
	 xgVKKaWYycNFbhuyklw/yJ8HAeVM7cgEL/cm1AYKm9GIlqLGQtOiRC/LGW1HaWx6vNpf0
	 Ak82fvmeQhcly/Ys12+12qYkMulHMSNB5Ab3ao4QubRAeJo0qZkf8mC4wyjdZG7Srl+3K
	 QeO8ISz7qRHjQkDfLR7TB7sfrX+l0qxrgUWhaS6OSstwzIxvbTGpql7Rm/jdPiXL+j6zu
	 Fyco0qKNAc/T5I2b0rX9+eThbv9p05WVnA0UdluvPqiLyLVSUSkewAMGOYUhKyH/4og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tz3/ZhqO";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F79606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3F79606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tz3/ZhqO
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so13653525e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793231570; x=1793836370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Af/thxHkdC33DwjakI5xWjPNHFxWjZZYhh+Bu6x+bIY=;
        b=tz3/ZhqOSq/4R96dJeMcTZkaw+Vc/rO4vrKCwX8tmlE1VkQHb7ISJg4vu4UgrGrSWN
         HR2qTFgXP+BZMukXElx0qveSAehKEU7QfyZxw8uLICrEr0fuZq7mVt713Wge1mviC6ce
         z5DqakgxpAMIhIfbg3KPHm3m6f5LOFDhxZ+zGeMFV2MzwHVTLdP78tBelA8fGOOe5BQX
         OHJR5u9KCi0KNhngnNRuyo16vpr0DkBLrS2gu6FUYCIYOrcP3dBng9iA/uhkdbU3TQCD
         kWKuxAwDaOtz5UPdKvrfn2139sgAvMVHxUBs3ARODIpcXmF67dRNPDucjak9nxAXhwpZ
         Fclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793231570; x=1793836370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Af/thxHkdC33DwjakI5xWjPNHFxWjZZYhh+Bu6x+bIY=;
        b=toQu4/OsU9DThFjRazibHxTY77Ntqv9hdVC9/qsR64MDlyJ5b1AJdhX4tnPhqdl+/f
         CbubalGSKklz8jOX5tMgjbgq1YAKtefBdYkI4yxg6U/8ot9gkDTRE7Nf9aneh/zPJk2k
         zbltgtcG7CAaOEtfEKB4GFabBthRsMvhYe6UNXjjRE+8oWLGnn1TjhikLK6/H7pklvFe
         huEkmF40vVRtkL3rILeMaSJwtHSy5lb1ImeuWBZVGyyoEOiOTbzsfuzeD71WJIC5Y9+N
         7C2KSlzuf0LdJFuUgc1mabODsGx/SK/2smxedAOWNb/Ygi4aG3VywYJxF/rt8HnR9dfO
         9xbA==
X-Forwarded-Encrypted: i=1; AKwUvBzfCOUkMsk5+RZNFrDMEYSgOKFp8JDkXKfpxjKkQ+civnW+/unX42EJltFYAqMKo7EMNZk9DLxsTz4Vg/M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxLw6MVjcb7CI+I8cD3lnSMLX7RNxnciPuWWOONnJMrhe7AwH5
	sfsZ2448QV9hDkKWv+GQ3/4OR6WjcR4RlnoI8Ir2Pd5mzytnjZTKGJ48
X-Gm-Gg: AYBFou2a/QTqxT2Yo9P2ned4/cz4rmk/FyQhgRoFviTUIwjIvMPBL1AwDOHvsOj4FCy
	ftbyzndJI5ZSctKrGAvNjb8khyy0O5KoYPN2p8GvEEqCABC7FsxMQcY5LD09lTNqqboj/t77Top
	IHWqQWZtZmvDH5V7vxzi6kt/CXYDpk2Uehk3kHw3SNCnLNOg6uOgEARj6L5RJmH9Vl8U6tQxgKn
	RI9jDdFgYm2u26oHqSNFmZJ+YQgtyisWVGcUfwjTNt0zCftWa8e8RHqqMTWrWpkGUoB/bYHilUu
	GF8kIp1IB3wkpZTDFHyUTfaPsVo7rCkI/0Fd7+04oIav9Lj8wn57NovBHWalYRwbXeeDzNrQPt6
	otMS5DUUye8OtLrmyGgEF6bR2LS9gQ8QAl8A+aX0BHoYdLeZUgw77puLtaRUF0Op73C3dlxmwpJ
	jX1o+VhpESJ97Sao7eEKHdmsD2/Yw7hYp1E6pne3KGFrSPMHzmC9h9JHXER3Kmltldug9LzKAq/
	yQ38PMrn8FJjJolWMBD6kZL5w00uwFCSGAzmPGRgp0jmuX8eG4HOKX1kVHymGgkdQT4auluFYbb
	jkUMqadN9MgOYPcC7Tj/Coebr1M=
X-Received: by 2002:a05:600c:3115:b0:4a1:f7f4:7cf2 with SMTP id 5b1f17b1804b1-4a966774db9mr87067605e9.17.1793231570159;
        Wed, 28 Oct 2026 16:52:50 -0700 (PDT)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm23669055e9.4.2026.10.28.16.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:52:49 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
Date: Thu, 29 Oct 2026 02:48:51 +0300
Subject: [PATCH v4 1/2] platform/x86: asus-wmi: add TUF keyboard RGB
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
Message-Id: <20261029-asus-tuf-rgb-v4-v4-1-0d3b877d2c30@gmail.com>
References: <20261029-asus-tuf-rgb-v4-v4-0-0d3b877d2c30@gmail.com>
In-Reply-To: <20261029-asus-tuf-rgb-v4-v4-0-0d3b877d2c30@gmail.com>
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

Add kbd_rgb_read_status() to evaluate and validate that buffer, parse
it through a packed struct, and convert both attributes to
DEVICE_ATTR_RW.  The read returns the write format with "n/a" in the
command position: the command word belongs to the write verb (apply
now or save to flash) and both verbs update the EC mirror the same
way, so there is no state to report there.  The three EC speed codes
map back to the sysfs indices 0 to 2.

Readback was verified against the EC firmware: the status bytes mirror
EC RAM at 0x0B22 to 0x0B2E, and the speed codes 0xe1, 0xeb and 0xf5
select animation step thresholds of 30, 20 and 10 ticks per phase,
which matches the slow, normal and fast labels.  Tested on a TUF
Gaming A15 (FA507NV).

Suggested-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c            | 83 +++++++++++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |  3 ++
 2 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index b33ebdb21aa2..054d1d684bb0 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1062,6 +1062,65 @@ static DEVICE_ATTR_RW(gpu_mux_mode);
 #define TUF_KBD_RGB_SPEED_SLOW		0xe1
 #define TUF_KBD_RGB_SPEED_NORMAL	0xeb
 #define TUF_KBD_RGB_SPEED_FAST		0xf5
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
+static int kbd_rgb_read_status(struct asus_wmi_kbd_rgb_status *status)
+{
+	int err;
+
+	err = asus_wmi_evaluate_method_buf(ASUS_WMI_METHODID_DSTS,
+					   ASUS_WMI_DEVID_TUF_RGB_READ_STATUS,
+					   0, (u8 *)status, sizeof(*status));
+	if (err)
+		return err < 0 ? err : -ENODEV;
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
+	struct asus_wmi_kbd_rgb_status status = {};
+	u32 speed;
+	int err;
+
+	err = kbd_rgb_read_status(&status);
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
+	return sysfs_emit(buf, "n/a %d %d %d %d %d\n",
+			  status.mode, status.red, status.green, status.blue,
+			  speed);
+}
+
 static ssize_t kbd_rgb_mode_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1114,7 +1173,7 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
 
 	return count;
 }
-static DEVICE_ATTR_WO(kbd_rgb_mode);
+static DEVICE_ATTR_RW(kbd_rgb_mode);
 
 static DEVICE_STRING_ATTR_RO(kbd_rgb_mode_index, 0444,
 			     "cmd mode red green blue speed");
@@ -1135,6 +1194,26 @@ static const struct attribute_group kbd_rgb_mode_group = {
 #define TUF_KBD_RGB_STATE_AWAKE		BIT(3)
 #define TUF_KBD_RGB_STATE_SLEEP		BIT(5)
 #define TUF_KBD_RGB_STATE_SHUTDOWN	BIT(7)
+static ssize_t kbd_rgb_state_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct asus_wmi_kbd_rgb_status status = {};
+	u8 state;
+	int err;
+
+	err = kbd_rgb_read_status(&status);
+	if (err)
+		return err;
+
+	state = status.state;
+
+	return sysfs_emit(buf, "n/a %d %d %d %d\n",
+			  !!(state & TUF_KBD_RGB_STATE_BOOT),
+			  !!(state & TUF_KBD_RGB_STATE_AWAKE),
+			  !!(state & TUF_KBD_RGB_STATE_SLEEP),
+			  !!(state & TUF_KBD_RGB_STATE_SHUTDOWN));
+}
+
 static ssize_t kbd_rgb_state_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1166,7 +1245,7 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 
 	return count;
 }
-static DEVICE_ATTR_WO(kbd_rgb_state);
+static DEVICE_ATTR_RW(kbd_rgb_state);
 
 static DEVICE_STRING_ATTR_RO(kbd_rgb_state_index, 0444,
 			     "cmd boot awake sleep shutdown");
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 66c7ab35d6c8..393fd3c5949a 100644
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

