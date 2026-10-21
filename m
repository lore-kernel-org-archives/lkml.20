Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574499;
	b=bpSTak5eYO0+bshbf5xWpPlM50B9jpHjxdP3bpC6oXEpsScNPemdMX4AF+sIIe/Xs1td
	 ctHstG4MT8qlAOIWlLpZ+AOASXOc45XPj2bjUR9DoWQ+PIk1gKWgQatDjtusaSP8GPOPc
	 4FCLjYmpNRrSfqpiw3FEQ4OGFwJy33dqI54QqqrZzPoNVUkZPImAPqc8ibew3pxX9mMnF
	 jOPidT5RpH9hsMuMgME+uoCcSJyyLmU/tdNl1j5i9L4cEvOVDYNiz93vC7NwHgRTBPJAz
	 4ED0QnWCkUsq8xJCHnRj31NAEh/XCEVToCXDYh3NGFGEfOro/IwZ5ndnowgjkE+61UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574499;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3M3s4sNbgx4nEQoi6URnPgJNVDnyDGL8iCiBUuTzp/E=;
	b=37T99Au6YvYDVlleMyCaDt3nWYQsWBc6VD7C1bd6RwsowIbnT426EbBs5nH9Xn0e3gOW
	 BECb59pUpGEUq4YC2cVkfp/VCkJktnmTqNmy3VdDH9fMVy5Q1s47ywXPu2HlVaZ/onBt0
	 s4etzfjoNVEC8y4iA9Zq2vyeEPMJHO1P7gXIJdv4zovSQGLixf/yC++sw+h4LF6sWO0Q3
	 yNdCuAgV+VNhVcEt6gKQRs/Bcpjh6+fvejc4hWVLdN3EOmB1kxWldevxmwclY9UpKvjDM
	 18iVkN80G7nXL+veKdmIU/amq20oe5B20VXc74RATb+pQxFduwb0Zj9J4bRbmrmCNnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b="UMTsG/Cp";
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E121606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E121606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=UMTsG/Cp
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 23A063FE5B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792574496;
	bh=3M3s4sNbgx4nEQoi6URnPgJNVDnyDGL8iCiBUuTzp/E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=UMTsG/CpcnwuikrdGcMz0zeOv0inbrOVdY9Dd93bmNyRNW3EbVOgDO2o6JzEpFZqR
	 4Qhe1HsjnVviZv4NakbxNWoWjTWpjezdKyINfGCAhPqqTBYzl6pE9mhEtWpdvA1ZE4
	 XcIAFmP8hVIoLrbOyK5EDw+GqU+pF9q5VD0tjMf/D+YEVhjiKT4/L1tE6UWsnA1Wv6
	 AnjaGSqV4+Qmndg03fsvHCP4Rw5xoLpb5N0EMftF/yF8DuXzPxb8kxOUsHrSQU3uf2
	 926ZLgx8aTTjBBeTl/6Js3rIivvtuxlZGF384t8rvu6xbFVDC9Z3KXoX804GP9yy4t
	 ONmvUVL1KaYRFygAJr4CuOLfI0xL5tOebR5mybMOsb19lskR01HSl5XqYRseYX/FPF
	 UzKqGXyZWZK1kXpd8taObadu4AH3YN4QY1lE6Is4kiVAKe0MK0cATSvUO0xAAhkbMU
	 Z4FC7g8sVfrX8XGw0HOt41CZ5YAVNn6MUUCu591O3Fti1WEybEgNQC3nvYakxoj9Hw
	 EfBzNb1bgzjjNRpwb1Lu3+GUsnRTUcjBO0+rNJ1+/770vz7DMX6R2WvSLjGTsXy8Pd
	 TS3HBcN5zc0JSYnD8pt/ZApYNH7uS2mea2nqz7dGuHbXZeDKUVCuDL4/wZKjrSRdZX
	 Z+g8me4VvB3rZI1eItmMnwEY=
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93d3a7335so1246695ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574494; x=1793179294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3M3s4sNbgx4nEQoi6URnPgJNVDnyDGL8iCiBUuTzp/E=;
        b=LZ7wCS7k7F+c7H/LYYK/UwFBjwx/K3LN/DGAIvz0LlYT5OMXjO1ww4/DfxyuRYJOgP
         f+nrNmlDcW4rOY5PqSPoq6Z9uQeR5waXZFcD84BLtlsh+r72uaeK9lXdn7zSZrQz/AQn
         yqXTe2BNn55t9PlQfezLzm2LY2J5YKfbZ0h39jqt9C6VEonbLxcVS6qevYSvO2+tDa+G
         ktZa5d/fidMBRt3w8JzAkfPQrmuAzL2J5BThmziLq/LFXxrwNSXZTXuTS/crjXgLWb53
         ygYKzB4Hxr6AQ+6CGVSBAfm+YM4OlxFajRRMvAqqxPbmIOBuoU5NPGc9fZpsshuydEYG
         2Blg==
X-Gm-Message-State: AFq9FYK5WYxdFh4+kHvQdyCr/kBKAtKYztwPZ8n6y5oufqtbj6d+mWmF
	8teYpGxz8q3Faxh58KNkxupJyM/wwnnXOgzwCE2MWzP5okce/QyprVgudKume5ajWbXIEMWWwAv
	Rs03/fFblQmvg7LInBKHB6rAm6x48iBGXzZPpMm8RVzmTo3xL52dUQ+Vn8gBzDdNOZcbxEzoHlm
	LSQsVNRKXzHxhM9Q==
X-Gm-Gg: AYBFou3FSEOT9cNuE67m840vrM+u29gImVM/V/uVpvC8ZDn6YmyUGq5/XW8kI7baUbD
	Hk0515ySi24WPFV5VE31iiRZG1yS4aWtRav1EInuf25UIITRdu1f9xARQ8VZHcnzLF0tVIlPY+f
	BBvl0QrBw+cbcddMKq1R3spMEqKLxwEZsSvDLRLNJndBaVHVBZugxbnarMgjSxYHmXSTbn24QEX
	iy4c2U1HVo2iDbkFQgh5K67v1OIHm5Fl/06maM5VrVXln5Nw4yprMDJZGPNo/dgfkUm5Z00Lb6u
	GxRazJ2IDKSsHM6YD+eCHWRxOflL/0Rzyb2iFrDh88XloUCueDFrQbvcDSZABBRIiRBym1CC6+y
	RCXIyde6h3svm1NjLaL+r+Y6LUMBAMH/RLAEz/mmqFZpOSG8YnimFLSgBMBFnJdq8wuWO9xo6VC
	Tw759wmkWcDE8jLlAwlGwjQEC4BpaAVX9cRgw7fro201IBTjDg2B0Bzf1qNVk9pfGps2n63mKSK
	ROFLmEhow9IZ/m9DezBqKmr2uITTr8XRQ1xB1eYQw==
X-Received: by 2002:a17:902:da8c:b0:2e2:d929:9c7c with SMTP id d9443c01a7336-2ea439e9402mr19354815ad.2.1792574494335;
        Wed, 21 Oct 2026 02:21:34 -0700 (PDT)
X-Received: by 2002:a17:902:da8c:b0:2e2:d929:9c7c with SMTP id d9443c01a7336-2ea439e9402mr19354535ad.2.1792574493879;
        Wed, 21 Oct 2026 02:21:33 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-c2b4-05d7-81df-1886.dynamic-ip6.hinet.net. [2001:b011:2008:445c:c2b4:5d7:81df:1886])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea4005a7c1sm6572935ad.71.2026.10.21.02.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:21:33 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: linux-serial@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	markus.probst@posteo.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com
Subject: [PATCH v2 1/3] serdev: handle devices without an ACPI or device tree node
Date: Wed, 21 Oct 2026 17:21:22 +0800
Message-Id: <20261021092124.2306053-1-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
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

Driver-created serdev clients may lack an ACPI companion or device tree
node.

Add a creator-supplied name for these clients. Use it as a serial
modalias fallback and to match a serdev driver of the same name. Keep
returning -ENODEV for unnamed clients.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
---
 drivers/tty/serdev/core.c | 36 ++++++++++++++++++++++++++++++------
 include/linux/serdev.h    | 31 +++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
index 7500efcdfc21..8354a4688fd8 100644
--- a/drivers/tty/serdev/core.c
+++ b/drivers/tty/serdev/core.c
@@ -29,13 +29,21 @@ static DEFINE_IDA(ctrl_ida);
 static ssize_t modalias_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
+	const struct serdev_device *serdev = to_serdev_device(dev);
 	int len;
 
 	len = acpi_device_modalias(dev, buf, PAGE_SIZE - 1);
 	if (len != -ENODEV)
 		return len;
 
-	return of_device_modalias(dev, buf, PAGE_SIZE);
+	len = of_device_modalias(dev, buf, PAGE_SIZE);
+	if (len != -ENODEV)
+		return len;
+
+	if (!serdev->name[0])
+		return -ENODEV;
+
+	return sysfs_emit(buf, "%s%s\n", SERDEV_MODULE_PREFIX, serdev->name);
 }
 static DEVICE_ATTR_RO(modalias);
 
@@ -47,15 +55,22 @@ ATTRIBUTE_GROUPS(serdev_device);
 
 static int serdev_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
 {
+	const struct serdev_device *serdev = to_serdev_device(dev);
 	int rc;
 
-	/* TODO: platform modalias */
-
 	rc = acpi_device_uevent_modalias(dev, env);
 	if (rc != -ENODEV)
 		return rc;
 
-	return of_device_uevent_modalias(dev, env);
+	rc = of_device_uevent_modalias(dev, env);
+	if (rc != -ENODEV)
+		return rc;
+
+	if (!serdev->name[0])
+		return -ENODEV;
+
+	add_uevent_var(env, "MODALIAS=%s%s", SERDEV_MODULE_PREFIX, serdev->name);
+	return 0;
 }
 
 static void serdev_device_release(struct device *dev)
@@ -88,14 +103,23 @@ static const struct device_type serdev_ctrl_type = {
 
 static int serdev_device_match(struct device *dev, const struct device_driver *drv)
 {
+	const struct serdev_device *serdev;
+
 	if (!is_serdev_device(dev))
 		return 0;
 
-	/* TODO: platform matching */
 	if (acpi_driver_match_device(dev, drv))
 		return 1;
 
-	return of_driver_match_device(dev, drv);
+	if (of_driver_match_device(dev, drv))
+		return 1;
+
+	/* Fall back to the name set by the creator of the device */
+	serdev = to_serdev_device(dev);
+	if (!serdev->name[0])
+		return 0;
+
+	return strcmp(serdev->name, drv->name) == 0;
 }
 
 /**
diff --git a/include/linux/serdev.h b/include/linux/serdev.h
index b6c3d957ec15..26baa0321eef 100644
--- a/include/linux/serdev.h
+++ b/include/linux/serdev.h
@@ -8,6 +8,7 @@
 #include <linux/types.h>
 #include <linux/device.h>
 #include <linux/iopoll.h>
+#include <linux/string.h>
 #include <linux/uaccess.h>
 #include <linux/termios.h>
 #include <linux/delay.h>
@@ -19,6 +20,10 @@ struct serdev_device;
  * serdev device structures
  */
 
+/* Large enough to hold the KBUILD_MODNAME of any serdev client driver */
+#define SERDEV_NAME_SIZE	40
+#define SERDEV_MODULE_PREFIX	"serial:"
+
 /**
  * struct serdev_device_ops - Callback operations for a serdev device
  * @receive_buf:	Function called with data received from device;
@@ -35,6 +40,9 @@ struct serdev_device_ops {
  * struct serdev_device - Basic representation of an serdev device
  * @dev:	Driver model representation of the device.
  * @nr:		Device number on serdev bus.
+ * @name:	Name of the device, set by its creator, empty for devices
+ *		which are enumerated from firmware, see
+ *		serdev_device_set_name().
  * @ctrl:	serdev controller managing this device.
  * @ops:	Device operations.
  * @write_comp:	Completion used by serdev_device_write() internally
@@ -43,6 +51,7 @@ struct serdev_device_ops {
 struct serdev_device {
 	struct device dev;
 	int nr;
+	char name[SERDEV_NAME_SIZE];
 	struct serdev_controller *ctrl;
 	const struct serdev_device_ops *ops;
 	struct completion write_comp;
@@ -135,6 +144,28 @@ static inline void serdev_device_set_client_ops(struct serdev_device *serdev,
 	serdev->ops = ops;
 }
 
+/**
+ * serdev_device_set_name() - set the name of a serdev device
+ * @serdev:	serdev device.
+ * @name:	non-empty name to use, typically KBUILD_MODNAME of the client
+ *		driver.
+ *
+ * A serdev device is identified by its ACPI companion, by its device tree
+ * node, or by a name set by its creator. Serdev devices which are
+ * instantiated by a driver rather than by firmware have neither of the
+ * former, so they must set a name before serdev_device_add() to be
+ * identifiable. Doing so gives them a SERDEV_MODULE_PREFIX modalias and
+ * makes them match a serdev device driver of the same name.
+ *
+ * Devices enumerated from firmware have no name and keep deriving their
+ * modalias and their driver match from firmware only.
+ */
+static inline void serdev_device_set_name(struct serdev_device *serdev,
+					  const char *name)
+{
+	strscpy(serdev->name, name);
+}
+
 static inline
 void *serdev_controller_get_drvdata(const struct serdev_controller *ctrl)
 {

base-commit: 9e947d96915af63e28896caae85a81b74855621b
-- 
2.34.1

