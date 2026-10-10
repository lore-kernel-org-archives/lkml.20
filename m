Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034123F54D8
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627430; cv=none; b=CCirequChuKKRO5LO6LB6uS4CWYUWG4YrcuEDItZ4KUVcmqTOD0KKyb36m3/sA9Cn3HoaLorM1ctNBpW5tyQgxENWZvEgrVdNuv3DOLfeo/CyjTFMkaa3cqifrsu/WJJfHfYVMUPEpV+InBCkOw1Vh7H2C3YPsL7qLXjgrvXwNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627430; c=relaxed/simple;
	bh=nRyQTo2mteLdFHJcz/4WTyzG66Hwnwgd3QAH7COpQY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CY7c4LTOXPrdZGiOApoMMrdaqWYZhCQqXVVbjfTZD9QJYtfb18XEp+qaJZhR5nnGZH+T5adaj7fJnalSmwlUKU/ip/a/ZkVNix1AzX2fn37+LqUOSTjzj1AsTJWhOXAylxKZT0YNFM1QqVqS8YIMwf16gMUmaLg8kLL2So/yHwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IK27Cvet; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IK27Cvet"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so4354025e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791627419; x=1792232219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGkVV42ACY/p+Sq1esuetg1Ua8LzTmZyCOVCvmMU3JU=;
        b=IK27CvetYr+IroUXVjw7bQxf2QThg3TYIcZ0Xqbd9vwd5FEVlJ+O2ydqH+ix3XDOvI
         Er8Esb7CWqbjhpxzDlFIgfn9C0U3Gc5M7YwaTYLiQVLl/2vbAnjTGIdAsUSZNjov3CnI
         r/6t7jTGKk9hJjzTbkYH50cpzSiZVpFA258RjQRTOcx/9+uWEzT2xqVsEb9vF7vc7VVP
         QKxle60nwyoWXgp0kFEQaMVXDowX5XGdmfw4SYuRO/bEPTSv2SY9A1JrRpc/42PDtuaR
         yMTyLQ39UPhvX2mpkPt9yoV41RRlYdFbISmRoOY4oFSjM5wTD6wrzEvinZRCkGiZgwjn
         gUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791627419; x=1792232219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGkVV42ACY/p+Sq1esuetg1Ua8LzTmZyCOVCvmMU3JU=;
        b=QLz6fqsK5SYe+sm4JPf6hCw6ixMaAasySbwEHkjSdaVrkpnMt7WYCazLHX2tFS5RNJ
         dOMsnOeXfG5yUblA2FAPWlVgRXJyrhFpcoh7773Jvrmr6ldQeP3v5ZPKSQiIF0qaBk2z
         8n06sulUK7YhYIa25HVBsZjmKPwfC8sDz2JBYDraqZnpHZdHe+j2jbRuJrDxVgXOrXyw
         5PhjRDabUbuHFvD5o+0W7OHm/CVKtM/AH4YdEJXwx1aVX+wPSjAGTxEdBkgl4SqFthJs
         v/vR7YpN7Sq74664Sr0HJeN9AvZ+Zm35t5+ioR/zyv2qdWSB0LJe4ZQnQ6uEjOc5xLFR
         r2XQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8MG5j4G41z9qxttX0zmqkoq6zojvoUPki54x0knx+EhSOT1J/hpp5Ui7kGsLCfxyA+WpYwqrJ6lQ4olI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9eEIAgiIgEnh6+EfjoeGVfkfR/zQsYpbPlGPx2dbw/PZgUfHt
	F3GAxwm7Wbz8+5zRF9uUxuGA9WfBHK74Uv2AbVhgHpyg/Xe+HJIDggCx
X-Gm-Gg: AYBFou0ToKZuOpgwvQhGJzR7xa8VatLLKzogvYIQrfLO0y9IBDz7cVg2OwLwzWHPsGR
	G+JUA2bsCicP1OK+BX4FIWXNZ4NGACILidwSSDw9q6QONienKwc/qobaDtqvnuF2rjzQU/12IvZ
	+b9q/s0hNhtzKtgPCPSHWFFn71LFp+9l8l2wXSEjlzw2cIWY6geuDwAQFhs3nV6xLb5OWL9V6Za
	jTZFShwhwSA3W8aGSr/zTopU55xFFAVVBdPICPUUg8scjpLHAeMAEUZsuqACruOfXSkPe1OKWuz
	QlfN4jYOAdZPzHTuYrVUSyjxDOcKLUNPOEAP/BBVqm/P2R8IAqnxEA++r91zqlOU2lskjMZzXbU
	5+IUOMLbUrF4LIKED2t1RtRefGRjWaf7FsogJPtEY7Wg5NwLP/CKSxsfTbmpPCt+5svCKVZG1La
	nPIDHJrHC0I73huGu5/RMQvtm03Ha7Ppfky0YLd/H2K/+/B9F8gBxuTGXX9Co=
X-Received: by 2002:a05:600c:c165:b0:4a1:706f:b40d with SMTP id 5b1f17b1804b1-4a18e4988ecmr86737285e9.7.1791627419378;
        Sat, 10 Oct 2026 03:16:59 -0700 (PDT)
Received: from ASUS ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c38f4sm9417856f8f.27.2026.10.10.03.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:16:59 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	luke@ljones.dev,
	denis.benato@linux.dev,
	benato.denis96@gmail.com,
	corentin.chary@gmail.com,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartu Alev <bartualev@gmail.com>
Subject: [PATCH v3 4/5] platform/x86: asus-wmi: add TUF keyboard RGB readback support
Date: Sat, 10 Oct 2026 13:16:00 +0300
Message-ID: <20261010101601.888709-5-bartualev@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010101601.888709-1-bartualev@gmail.com>
References: <20261010101601.888709-1-bartualev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
DEVICE_ATTR_RW.  The read returns the write format with a literal 1 in
the command position, because the command word belongs to the write
verb (apply now or save to flash) and the EC mirror is updated the same
way by both verbs; reporting the canonical input form keeps the
interface symmetrical for shell use and for tools that already write
it.  The three EC speed codes map back to the sysfs indices 0 to 2.

Readback was verified against the EC firmware: the status bytes mirror
EC RAM at 0x0B22 to 0x0B2E, and the speed codes 0xe1, 0xeb and 0xf5
select animation step thresholds of 30, 20 and 10 ticks per phase,
which matches the slow, normal and fast labels.  Tested on a TUF
Gaming A15 (FA507NV).

Assisted-by: glm-5.3
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c            | 86 +++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |  3 +
 2 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index c5c0fe92cea0..f93662e10c45 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1051,6 +1051,68 @@ static DEVICE_ATTR_RW(gpu_mux_mode);
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
+	/*
+	 * The command word belongs to the write verb and has no state
+	 * equivalent, so readback reports the canonical input form.
+	 */
+	return sysfs_emit(buf, "1 %d %d %d %d %d\n",
+			  status.mode, status.red, status.green, status.blue,
+			  speed);
+}
+
 static ssize_t kbd_rgb_mode_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1103,7 +1165,7 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
 
 	return count;
 }
-static DEVICE_ATTR_WO(kbd_rgb_mode);
+static DEVICE_ATTR_RW(kbd_rgb_mode);
 
 static DEVICE_STRING_ATTR_RO(kbd_rgb_mode_index, 0444,
 			     "cmd mode red green blue speed");
@@ -1124,6 +1186,26 @@ static const struct attribute_group kbd_rgb_mode_group = {
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
+	return sysfs_emit(buf, "1 %d %d %d %d\n",
+			  !!(state & TUF_KBD_RGB_STATE_BOOT),
+			  !!(state & TUF_KBD_RGB_STATE_AWAKE),
+			  !!(state & TUF_KBD_RGB_STATE_SLEEP),
+			  !!(state & TUF_KBD_RGB_STATE_SHUTDOWN));
+}
+
 static ssize_t kbd_rgb_state_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1155,7 +1237,7 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 
 	return count;
 }
-static DEVICE_ATTR_WO(kbd_rgb_state);
+static DEVICE_ATTR_RW(kbd_rgb_state);
 
 static DEVICE_STRING_ATTR_RO(kbd_rgb_state_index, 0444,
 			     "cmd boot awake sleep shutdown");
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index ecf8b5e6cbae..2e123bb2d8cb 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -161,6 +161,9 @@
 /* TUF laptop RGB power/state */
 #define ASUS_WMI_DEVID_TUF_RGB_CMD	0x00100057
 
+/* TUF laptop RGB keyboard status readback */
+#define ASUS_WMI_DEVID_TUF_RGB_READ_STATUS	0x0010005B
+
 /* Bootup sound control */
 #define ASUS_WMI_DEVID_BOOT_SOUND	0x00130022
 
-- 
2.56.0

