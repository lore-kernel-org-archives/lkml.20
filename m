Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394D23DD523
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790366960; cv=none; b=DqGwD0WeB2k6MhJh+YeWoV6Fi28Kay8ICR08LA5uPKnmI2x/gyHzzj6ubzPIsHNIylHw1ryaGpWeE5eoGoV4kZlpTWARy2gkN1Xrj56vyYmQtTSNz6dJ/scNa9mMWYpviTh+KxkZa7Ow8Z6jVOMvYTuyqOqItlu68XG5zudsByo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790366960; c=relaxed/simple;
	bh=hIr12PI0nERBTtu91eoc1R1rzdX9Yy8A1fOYq+OU9qw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sl6GCt0EpYk9tnK6Ps3168IXyxaavasQ3/m95jECTdNx7Y8Z54rDXjBYIDvGSgSQpgLWQ84IEU7+OBwUZP07A2KibY65/yM9Dn1pgifl1nVKnDXFrh7+DNMaiYC1qKxEfYtZ9gc453GPSqCO47KRsbujfwiySb7svyNVohLSX0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHEDo4dx; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHEDo4dx"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ce364488dso3847615e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790366956; x=1790971756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DXOo8rzrQ052DFvQTgAWyFPqPdhvLwcytRHosPlQjIs=;
        b=rHEDo4dxflrjtm6WM7xo040QPRRYGsXu02r5QeGCEHCr1E72CK5QELaL6b/0OKsZ/l
         VpJP6SxXkzhWNab4/wtWDuAk9QqBJgCKB1ukhg3+XRmLJmJiHG3+7w1oUQGg3PWbEhog
         /xdo36dAumV42KDsp31DERCj+J8bd9nD6t+6G7JPCG5+Gdb07JLmORlZii1oxjT94tMG
         X9cvQLZcaVunWKBNN2OYdCKEOZe2t7w0Amv0SyuryHlCn1Z641S4pMA5Mi4OTYGOfXm7
         62kDZGxGfUqbxVReaZZd66rXGA8WVcCNgZQP8Uy8iKk9/8mYkjegjeMNNcSKItxQHHPq
         ukiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790366956; x=1790971756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXOo8rzrQ052DFvQTgAWyFPqPdhvLwcytRHosPlQjIs=;
        b=A4yPe6BSZzbgQPM05pLqXFkVExLi9N1mtVaLri8Z6UQZ/5YcsOWJHsvnjR/q1Kup9a
         mgG5HKhlmI7JwGIpvfvrHBOWC3kZcGDrnAq1UBMwk0YcC+tzZS1fXEbJP2zhl/q5AKC1
         pR9DV8cd5cp6sxGBnKWZPfOdNtxRtoUn0raW/36XkzgvH10uIDQq7YTCaIBcxGTld1/B
         GLMvyyMlFMFgRUbISVEEufrEmWKKfJd2FL0sZfZYGqLiMYRJhxRadfjGDuy6YsNdHcTc
         F1ImzrXgp7HpUZGryeIU1xXdOtK79EZGnuhGLrOn9IG4A5ZhvXOH6S0NDgZ+/hckrjEA
         JXDg==
X-Gm-Message-State: AFuF++kFqoA/mDED+X96JbXW8v+ayDBvcYIXOZSrszs3De4AgXJg6459
	eYklrPceQqq2meBMWkKQzwk9M6mtZQdqdzZwU4iPYcoq1rgIkyl3wRZ0o/we6aKVnY2DLk9u
X-Gm-Gg: AYBFou11/711h7ycjSKVqyF8i6+W95DzK2bgOgVigrHu+Krj3OOeC296bfSEsm88YOB
	WcQY+hKw5O5s4lXcHRLwm+lNGTHSVtJgv0F9UUDlIsKSm0M1g7VqFWx0qWpYOaum6WtDD3nv9/C
	oUtFzj4o2ugtw+XdBH1NTg1fLMs45h15KteL4pyNVEtuU2xEVB+v+YeL6dNjcyhKyJ+8RPAjVtw
	3OD2aHFhdKHiieSHO2+lKL3zNb+r0axXSbfX+Fe+rNrraS8eV+1VrdoUv/zyEd/5FSsam60r0Io
	C1ALJoaGNBCoAEgo5SdvIHCtEjfSjtqOfqF89UwbIerlFOyd+007w8D2j/kfOF29u1wtMSrl3cQ
	xqUwBtH3xHQmAmQpUGdCiEyc5+vnJuKg55EQjuGIp6o6D9IYoUGkPuzdaOGRoft3MRV3Kc5Lngj
	NvBteNTxYJNtqxkmD8FOB7/fSI/rIC1ct+/l90fMMSku3me4QpUq6NMcxmJLBONjhnr4zvsQ==
X-Received: by 2002:a05:600c:609b:b0:49f:ddbd:1f51 with SMTP id 5b1f17b1804b1-49fe66fa2c9mr127419805e9.15.1790366956140;
        Fri, 25 Sep 2026 13:09:16 -0700 (PDT)
Received: from ASUS ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b6108sm98626795e9.8.2026.09.25.13.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:09:15 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Bartu Alev <bartualev@gmail.com>
Subject: [PATCH v1] platform/x86: asus-wmi: add TUF keyboard RGB readback support
Date: Fri, 25 Sep 2026 23:07:44 +0300
Message-ID: <20260925200744.129714-1-bartualev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TUF Gaming laptops support setting keyboard RGB lighting modes and
power states via kbd_rgb_mode and kbd_rgb_state, but both attributes
are currently write-only (DEVICE_ATTR_WO). Consequently, userspace
utilities have no way to query the active hardware configuration.

Add readback support by querying the TUF status device ID 0x0010005B
through the WMI DSTS method. On supported platforms, this evaluates the
ACPI DSDT method EC0.KBLS(), which returns a 16-byte status buffer
containing the active lighting mode, RGB color channels, effect speed,
and power-state bitmask.

Introduce kbd_rgb_read_status() to retrieve and validate the KBLS
buffer. Convert kbd_rgb_mode and kbd_rgb_state to DEVICE_ATTR_RW. Map the
hardware speed codes (0xe1, 0xeb, 0xf5) to their sysfs indices (0, 1, 2).
Since the status buffer reports the active state rather than an action
command, emit a synthetic leading '1' to maintain format symmetry with
the input format expected by userspace.

Additionally, relabel the fourth field in kbd_rgb_state_index from
"keyboard" to "shutdown". When the interface was originally introduced,
the purpose of BIT(7) was unknown and noted as having no effect. In
hardware, this bit gates whether the keyboard LED remains powered during
the ACPI S5 sequence. Relabeling it accurately reflects its
actual hardware behavior.

Assisted-by: GLM-5.3
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
- Tested on ASUS TUF Gaming A15 (FA507NV) running Linux 7.2.6

 drivers/platform/x86/asus-wmi.c            | 87 ++++++++++++++++++++--
 include/linux/platform_data/x86/asus-wmi.h |  3 +
 2 files changed, 84 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a65090429ca7..36eff5adac52 100644
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
+					   ASUS_WMI_DEVID_TUF_RGB_STATUS,
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
@@ -1115,14 +1166,38 @@ static const struct attribute_group kbd_rgb_mode_group = {
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
 {
-	u32 flags, cmd, boot, awake, sleep, keyboard;
+	u32 flags, cmd, boot, awake, sleep, shutdown;
 	int err;
 
-	if (sscanf(buf, "%d %d %d %d %d", &cmd, &boot, &awake, &sleep, &keyboard) != 5)
+	if (sscanf(buf, "%d %d %d %d %d", &cmd, &boot, &awake, &sleep, &shutdown) != 5)
 		return -EINVAL;
 
 	if (cmd)
@@ -1135,7 +1210,7 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 		flags |= BIT(3);
 	if (sleep)
 		flags |= BIT(5);
-	if (keyboard)
+	if (shutdown)
 		flags |= BIT(7);
 
 	/* 0xbd is the required default arg0 for the method. Nothing happens otherwise */
@@ -1146,10 +1221,10 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 
 	return count;
 }
-static DEVICE_ATTR_WO(kbd_rgb_state);
+static DEVICE_ATTR_RW(kbd_rgb_state);
 
 static DEVICE_STRING_ATTR_RO(kbd_rgb_state_index, 0444,
-			     "cmd boot awake sleep keyboard");
+			     "cmd boot awake sleep shutdown");
 
 static struct attribute *kbd_rgb_state_attrs[] = {
 	&dev_attr_kbd_rgb_state.attr,
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index b5ed8c83ace1..a6eb8f8cf159 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -161,6 +161,9 @@
 /* TUF laptop RGB power/state */
 #define ASUS_WMI_DEVID_TUF_RGB_STATE	0x00100057
 
+/* TUF laptop RGB keyboard status */
+#define ASUS_WMI_DEVID_TUF_RGB_STATUS	0x0010005B
+
 /* Bootup sound control */
 #define ASUS_WMI_DEVID_BOOT_SOUND	0x00130022
 
-- 
2.55.0

