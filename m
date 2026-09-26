Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE672EEE62
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384374; cv=none; b=txyxlRLk7dHzSX8ioHq0i0PtF7TBgJ6qLhFXdrxe+FTScdmFiUka658O+3wn9GjaIGQTJSnnGzPvTiUQF3o6bL/5e5ZwxpbAF9yBLt0nM9Ij0T1grL6DDEY3zFrsmB7RmYyTednZmzdUyPo62zt/AO1biQUJwaPW5uWa7HGgWCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384374; c=relaxed/simple;
	bh=8hnjTwfTBHLsyuAAB6dyzI1k3KK2kRmkTXSfmkHiXEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NMaXpvGfTwqCOWzMlb9jJY43ULBUdQyS2ClYNwlZqzdKcJ+hunk1bwVZHXaYgq+sEULr2AeLZFsvQTzkVUyEzcSt3Jo63sTo/ECWFBO9u4NumuFmvlb1GwqQI5o7pweD73fHOZleduamwnKKSyShHFxzFkKKXZMxrQLtUP6mIk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNlSK+Rf; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNlSK+Rf"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso824224f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384370; x=1790989170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWPBynUBW4pCcEEoNtsV+BYq8gCxAKbn6p+O9ADBxhY=;
        b=SNlSK+Rfy2L5qFQl23Jde+/M6LnYI1BnyrLjK7TvkLVcXnReMaD4EkmFIYe1nBQbuw
         wZb/NUFgfmONLsgirt7nM+7JaFx+JmizAwYX20Sy1JFNQsnqSV+9pMkgcfvmvukO3Tas
         0FHCVSoJ6dTp6hjN8S/135/SObq7Soo60Kl1V9QrY7uN1tcwCCTX/ilNcRvlOoc9d+0n
         u7BBx5p0j+I1fQuxhZelwuVaNxkeB+83oAzHT7onYLrXic2S9jbgWOjw+lbx0v7jTWRj
         oqgF3g8Vn+Dlt1imFvDWOJQNCabYPWXJ0UPFhKUu43uJ8hro7opztOU1sA+C/T7mzLV6
         9Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384370; x=1790989170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pWPBynUBW4pCcEEoNtsV+BYq8gCxAKbn6p+O9ADBxhY=;
        b=KoeyrybmaMP4cHSqJxDc75yjbAL852mCzf3yzcDN8e83yd9CJ/WgVsKGDHejFcWOOh
         Vi7jQoU1FICN+7Yf6MjdAr04VCH61FZUyxyAAez/GiwcPsdECB4ExCTdXm1Q/sYgsztv
         Z1c8FngbBu4grfwB5hMa7zWuJ7Gg5MCdy4/yZmVcMhnur92+lhoCkuVvT1284l5reO9+
         YGbZBPV2l5dG15W4/KJ4KNPLqXhKWpMjvLWcSjTdtgDiAPLDMw0P9kaIbevrU+W9eYVc
         NRhj+w+7ZkOVZvgNDt5jkRwjBjhsCCi5eNfSV0jAyHUpojNxhMwj41eP3GqabWcDgsKP
         hhEA==
X-Gm-Message-State: AFuF++nVft2KcbYi2TfiWBtxQMsGv+UahEUD6AMr2gzb6nOlyKyjCnCV
	OtmmWQXFXivGj6inxWXo0tNpsnetMNtKqpSuWLuZ0bVxBLlNwyeCyGxD
X-Gm-Gg: AYBFou3Cg1ptGWHxB8+SKJgNknTGHEGtd/DVUUpQU7qx4YdyXxk34oEcQMpuuQ7pHri
	LMccnLdzdc1Yfwdu3CjuOPkxKjU40joIp1geqvWT1UPe6egM22K61uJ059XXG7ugaWBpY+8FgKP
	iHZ8RGPU1eeSNYSn6JXPMQDolL9k+yVkQFrfaZPEf8HV4nuwMCd2/6bOSLZ1sYa/GHCBSjFJwDv
	UTUjsXW03cEzftaDkhZycqT+/X3tRCzDMRNtCgXh8x8lGb+hdP7p4VqWTh/Mmz1rKbKxEKcpVVQ
	jYZo/GmYq7poBpqp6GfwCWm1T6z0J27qbEjNVhL1qnAVoHTQkxEVsDrSlnOCp+nF+IG6OzafmI2
	U5tIhPvuTpKPztMnIbhW+yae5fPugBUdXP2+O86nn8Zr38uQIz6nuWne1ZLOkwwWhAOFXQKXS1Q
	5XjuoSlUO7b25hqtVBH9od/KO2CLVxmj0D3t7o5IKq0Np1Y+4yDrnxLe2pKH8=
X-Received: by 2002:a05:600c:1d0d:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49fe66f144fmr131907825e9.16.1790384369701;
        Fri, 25 Sep 2026 17:59:29 -0700 (PDT)
Received: from ASUS ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm10195890f8f.9.2026.09.25.17.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 17:59:29 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>,
	Bartu Alev <bartualev@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v2 2/2] platform/x86: asus-wmi: add TUF keyboard RGB readback support
Date: Sat, 26 Sep 2026 03:56:25 +0300
Message-ID: <20260926005625.171560-3-bartualev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926005625.171560-1-bartualev@gmail.com>
References: <20260925200744.129714-1-bartualev@gmail.com>
 <20260926005625.171560-1-bartualev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TUF Gaming laptops expose kbd_rgb_mode and kbd_rgb_state as write-only
attributes (DEVICE_ATTR_WO), preventing userspace from querying the
active hardware configuration.

Add readback support by querying ASUS_WMI_DEVID_TUF_RGB_READBACK
(0x0010005B) via the WMI DSTS method. On supported platforms this
evaluates the DSDT method EC0.KBLS(), which returns a 16-byte buffer
containing the active lighting mode, RGB color channels, effect speed
and power-state flags.

Introduce kbd_rgb_read_status() to evaluate and validate the buffer,
and convert both attributes to DEVICE_ATTR_RW. Map the hardware speed
codes (0xe1, 0xeb, 0xf5) to their sysfs indices (0, 1, 2).

The command field is not part of the status buffer: "immediate vs
save-to-flash" is a property of the write verb (0xb3/0xb4), not of
readable state, and the EC mirror is updated identically by both.
Readback therefore emits a synthetic leading '1' - the canonical
input form userspace writes - so that output matches input.

Suggested-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c            | 79 +++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |  3 +
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index db6ee1974838..fe1dcc7701ad 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1046,7 +1046,58 @@ static ssize_t gpu_mux_mode_store(struct device *dev,
 static DEVICE_ATTR_RW(gpu_mux_mode);
 #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
+static int kbd_rgb_read_status(u8 data[16])
+{
+	int err;
+
+	err = asus_wmi_evaluate_method_buf(ASUS_WMI_METHODID_DSTS,
+					   ASUS_WMI_DEVID_TUF_RGB_READBACK,
+					   0, data, 16);
+
+	if (err)
+		return err < 0 ? err : -ENODEV;
+
+	/* DUBF[0] is a constant 1 set by the AML: anything else is not KBLS */
+	if (data[0] != 1)
+		return -ENODEV;
+
+	return 0;
+}
+
 /* TUF Laptop Keyboard RGB Modes **********************************************/
+static ssize_t kbd_rgb_mode_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	u8 data[16] = {};
+	u32 speed;
+	int err;
+
+	err = kbd_rgb_read_status(data);
+	if (err)
+		return err;
+
+	/* Map hardware speed codes back to sysfs index:
+	 * 0xe1 -> 0 (slow), 0xeb -> 1 (normal), 0xf5 -> 2 (fast)
+	 */
+	switch (data[5]) {
+	case 0xe1:
+		speed = 0;
+		break;
+	case 0xeb:
+		speed = 1;
+		break;
+	case 0xf5:
+		speed = 2;
+		break;
+	default:
+		speed = 1;
+		break;
+	}
+
+	return sysfs_emit(buf, "1 %d %d %d %d %d\n",
+			  data[1], data[2], data[3], data[4], speed);
+}
 static ssize_t kbd_rgb_mode_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1099,7 +1150,7 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
 
 	return count;
 }
-static DEVICE_ATTR_WO(kbd_rgb_mode);
+static DEVICE_ATTR_RW(kbd_rgb_mode);
 
 static DEVICE_STRING_ATTR_RO(kbd_rgb_mode_index, 0444,
 			     "cmd mode red green blue speed");
@@ -1115,6 +1166,30 @@ static const struct attribute_group kbd_rgb_mode_group = {
 };
 
 /* TUF Laptop Keyboard RGB State **********************************************/
+static ssize_t kbd_rgb_state_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	u8 data[16] = {};
+	u8 flags;
+	int err;
+
+	err = kbd_rgb_read_status(data);
+	if (err)
+		return err;
+
+	/*
+	 * data[6] power-state bitmask:
+	 * BIT(1) boot, BIT(3) awake, BIT(5) sleep, BIT(7) shutdown
+	 */
+	flags = data[6];
+
+	return sysfs_emit(buf, "1 %d %d %d %d\n",
+			  !!(flags & BIT(1)),
+			  !!(flags & BIT(3)),
+			  !!(flags & BIT(5)),
+			  !!(flags & BIT(7)));
+}
 static ssize_t kbd_rgb_state_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1146,7 +1221,7 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 
 	return count;
 }
-static DEVICE_ATTR_WO(kbd_rgb_state);
+static DEVICE_ATTR_RW(kbd_rgb_state);
 
 static DEVICE_STRING_ATTR_RO(kbd_rgb_state_index, 0444,
 			     "cmd boot awake sleep shutdown");
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index b5ed8c83ace1..1447c7f354bc 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -161,6 +161,9 @@
 /* TUF laptop RGB power/state */
 #define ASUS_WMI_DEVID_TUF_RGB_STATE	0x00100057
 
+/* TUF laptop RGB keyboard status readback*/
+#define ASUS_WMI_DEVID_TUF_RGB_READBACK	0x0010005B
+
 /* Bootup sound control */
 #define ASUS_WMI_DEVID_BOOT_SOUND	0x00130022
 
-- 
2.55.0

