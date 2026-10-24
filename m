Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792808988;
	b=EUhwjTh+F8SzPM+hMu0KrtblD+i9HDBWBStgypKWslW60zBOQOO2kkOfEFnhC8btH8Ye
	 9L7KqL64RkWW0/KSVBl0aO1WKeWgIeqE65knLFxzsKkdlhmAcEhAO5Fd+//f/IpxMz+d+
	 PUEnzIKJU58hUB1h1dNok8MqSPPk2N1XjEIpufK0ToIPVFPtGko/APuZAcKhF7T/G/UaI
	 X6K8ZJUMEBsnlRF2iIdcK6MOyHACMeE8PgCCpDrPtvlGTVdmNNr0nKnYPoo9l4sNpDLg5
	 R9qcnPqj/iWOOy9/h4hegqE6TrqtHg9tv6Det39hX3/BnLdHbKC7r7XPc4maumV+3WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792808988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xWqePsieUNYmC/YQ6OK9IVWqiLiqQMDh5G8B7qqj1fE=;
	b=uiRa235/ZgjIyg/PQDxeA2VbQVjnOnHrTUttyGR38pAZ437wiNKnpRLyqWomV9ekN2wy
	 DH+tPBaIf7tb409HUkq2EYYIy4nR9BUf86sEblK5U9BBdMBIOV6Vubz5CU56POsbvolmR
	 4scnyrlBgtjLrPI4uyMpTYgBLo9ZwQvoGZfDbFcWwvT03/qeVYXWMF8KN069TB1DhXOO+
	 puh2/D5PPPFHYBBp143/VF4jwixu+iqFHJ5U1bXZeqZJEjjL1FzaXVxWd5gu7ADOD/pVV
	 gnfsz+CdwFTYilOb8dMaYmjAlj/C3SW/pVe9ykSMitCM218Km0aUvSmSxVkurLpiTWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=ZSK7IdRK;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87989606A324
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87989606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=ZSK7IdRK
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C9D743F698
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792808984;
	bh=xWqePsieUNYmC/YQ6OK9IVWqiLiqQMDh5G8B7qqj1fE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ZSK7IdRKZFCrHyxhTlxxLn656lQ+nFEqk1EgNUPcOtqaH7hpB8NFJVDFF9s+FWeAM
	 EFq3s2c0M50x6wFHCRMeB97HYmWHLrtuUDfytQD+AjSdJ7higDhmkcx9PmmuLu79OH
	 /DLCQf05iricKu+Gv/kjZEGq+2wmfRG/9SI/L1zaRimCjUP5AFm3sYuptBZ2w+jW3I
	 4GYA7dTs/LWRkFtXf/ADw8wAb5qDg1PYaMgqFmYcgAtw+NIu2PPyy2kgIglCT8DJYz
	 AqGeuCoWjjfjZygIEhDIoQUTPXSB1vGer4K86EJvzZllwC+v1gyWUSbVnC+MPEM+zf
	 P4FoxoAzwZtCltCUiSWY9w8KYpS0C5h51AP5WJdCguZVWD1IgJKZy4OK+/EuYpumRX
	 WmtjjYemHoFqYLq6iZJfA3bcaZ8yHI3c/pZASQqbgtLOMhBslXdmBc2cMwHaXpZBmY
	 Lohb28y8Mv+gyXzVcqp9TZcVviEIXZy+lWstMYCY+ywghWaQVat/W22L2vXw8ayFJ2
	 Iu2zMXRlWzh6XK9cHXWClcsnJpxenoQanjb2+wy+yx4+rVGRNYAqcgluassyn6JhA7
	 RI6hTdEpK27exZEPw3uF/Emp3xnXxwtSvLvCCKPlnGEzSDf6+yg6d2+/uuGYP067VR
	 yzWq/Fp+p2a+QIKzkcE6y5aw=
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9a4052726so5523765ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792808983; x=1793413783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xWqePsieUNYmC/YQ6OK9IVWqiLiqQMDh5G8B7qqj1fE=;
        b=aDmW5BBuRj0qIO2JW+B43p0BSNpKMDfIeZ/K+kgRaQQs9H50X+pUKGWNQIYy8TyQe1
         6EuvbkFt8q8pUpV81AhSzuVmGwgozuT54r5gl+36jnyRhsog6Sn5+rAoufQRRB3Igw1+
         htrlHShSBnkBotBKAIw8ARPy37/hP/NCfqgJcVpB0QyqFGmDi22AEX/4+nLlthPry0cP
         mdsUw72EILYSn8w1uFUgd4490O6HX+CHDSdrv5YBZFMEwlqJoxtvCkEA2q7nZ1+/7LLm
         0QaYE1z3OUYqmBcPOy8jdekz2Z/+k+ZrrdC69T+Omn9z2LBhPbH/WmyExocZcFNomkzx
         C5Yw==
X-Gm-Message-State: AFq9FYKpHCwtb/+lcsjSJLZbn58O6/ClBq7dJmOx6pphAmkuUL7DEB5Q
	iS25UaIia9Z+FhYXjUynw987uDl3FmszQ7vPvddVHiC0WtNg++/aC+axEiTrNeQodB5qyZC5Nxt
	bIKIncNUSSBxt3echeV+COyEyJTJqIvvG0HWewIQ6/tYGMIpM8xAPa5vf7BLai+FLhfVbiLUWFS
	Yu+o0HTQ==
X-Gm-Gg: AYBFou1l3KeqD5Ir82yu0ObV+Kd99WMNwmOt04ynuhJxKQxWANDNSqodhQdxaNIfC/i
	/QDoOlcnaGYU3CMX0HXpCkJ7pg2vDpVa6yDm6mEz6MxYbvsaGv3+0tNnZWinEbVUXyWclpn4hWW
	bpaV44g2SEn8FkrgpHZrUv9uywToCIXFy1HxgYMYYVVxaQ8JisJdvrOXexOE6sS7uyKLSfUxTa8
	75wSdBwBDXQ9jhwkkKctSABLjLNHFC4nXNPep4FiXLiW+9nMkVjd48MIKxVVD2KEZsNBfCKvrsI
	rLB1yy+dk+8xMhEt6HZJeJMw0tt9KfIlBy/r23a8Oy8uUWNZVNQ+ns0XbwRLnD/MnFs0odUXnP6
	LvfkmVQp9CLoyLGBMPbrOJ4/EhXBd7Ekvk1X+049Z33dBBGaqYNN3qOUzEY5CuOOf5Qkw1nC59Q
	F9svv3A6kR0wMjOil18S8t8lf9kncIvfZNritvnxAZgsRJWf8IL0osD/OJlfhV7QnwH7YbuC9fq
	6LiiF9Y/cmJhOcjzvxHtkQmC3KxAo4enTb4Yf73xLk=
X-Received: by 2002:a17:90b:39a6:b0:3a7:a463:54bb with SMTP id 98e67ed59e1d1-3adeb10f4c4mr1474104a91.5.1792808983300;
        Fri, 23 Oct 2026 19:29:43 -0700 (PDT)
X-Received: by 2002:a17:90b:39a6:b0:3a7:a463:54bb with SMTP id 98e67ed59e1d1-3adeb10f4c4mr1474086a91.5.1792808982878;
        Fri, 23 Oct 2026 19:29:42 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-9c57-136b-f73a-3698.dynamic-ip6.hinet.net. [2001:b011:2008:445c:9c57:136b:f73a:3698])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb75254sm587341a91.4.2026.10.23.19.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:29:42 -0700 (PDT)
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
Subject: [PATCH v4 1/3] serdev: handle devices without an ACPI or device tree node
Date: Sat, 24 Oct 2026 10:29:28 +0800
Message-Id: <20261024022930.2704030-2-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024022930.2704030-1-an.wu@canonical.com>
References: <20261024022930.2704030-1-an.wu@canonical.com>
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

Serdev clients instantiated by a driver have no ACPI companion and no
device tree node. Their modalias read returns -ENODEV, their add uevent
is suppressed, and they cannot be driver-matched, so creators force a
bind with device_driver_attach().

Resolve both TODOs in the serdev core by modelling matching on the SPI
bus: let the creator pass a modalias to serdev_device_add() and give
struct serdev_device_driver an id_table. ACPI and OF are still tried
first; clients without their own modalias keep returning -ENODEV. The
device name, derived from the controller, is unchanged.

Split struct serdev_device_id and its defines into a new
include/linux/device-id/serdev.h, following the pattern already used by
the SPI and I2C buses.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
---
 MAINTAINERS                                   |  1 +
 .../platform/x86/x86-android-tablets/core.c   |  2 +-
 drivers/power/sequencing/pwrseq-pcie-m2.c     |  2 +-
 drivers/tty/serdev/core.c                     | 65 ++++++++++++++-----
 include/linux/device-id/serdev.h              | 19 ++++++
 include/linux/serdev.h                        | 12 +++-
 6 files changed, 82 insertions(+), 19 deletions(-)
 create mode 100644 include/linux/device-id/serdev.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 917f3f72e31b..06e67aa5d9b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24905,6 +24905,7 @@ L:	linux-serial@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/serial/serial.yaml
 F:	drivers/tty/serdev/
+F:	include/linux/device-id/serdev.h
 F:	include/linux/serdev.h
 F:	rust/helpers/serdev.c
 F:	rust/kernel/serdev.rs
diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index cfff7f5eac5d..853aa6ff5d50 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -317,7 +317,7 @@ static __init int x86_instantiate_serdev(const struct x86_dev_info *dev_info, in
 	ACPI_COMPANION_SET(&serdev->dev, serdev_adev);
 	acpi_device_set_enumerated(serdev_adev);
 
-	ret = serdev_device_add(serdev);
+	ret = serdev_device_add(serdev, NULL);
 	if (ret) {
 		dev_err(&serdev->dev, "error %d adding serdev\n", ret);
 		serdev_device_put(serdev);
diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index e42e85f47629..e0482f2ef39f 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -309,7 +309,7 @@ static int pwrseq_pcie_m2_create_serdev_one(struct pwrseq_pcie_m2_ctx *ctx,
 	if (ret)
 		goto err_free_serdev;
 
-	ret = serdev_device_add(pci_dev->serdev);
+	ret = serdev_device_add(pci_dev->serdev, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to add serdev for PCI device (%s): %d\n",
 			pci_name(pdev), ret);
diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
index 7500efcdfc21..45175403bd55 100644
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
+	if (!serdev->modalias[0])
+		return -ENODEV;
+
+	return sysfs_emit(buf, "%s%s\n", SERDEV_MODULE_PREFIX, serdev->modalias);
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
+	if (!serdev->modalias[0])
+		return -ENODEV;
+
+	return add_uevent_var(env, "MODALIAS=%s%s", SERDEV_MODULE_PREFIX,
+			      serdev->modalias);
 }
 
 static void serdev_device_release(struct device *dev)
@@ -70,11 +85,6 @@ static const struct device_type serdev_device_type = {
 	.release	= serdev_device_release,
 };
 
-static bool is_serdev_device(const struct device *dev)
-{
-	return dev->type == &serdev_device_type;
-}
-
 static void serdev_ctrl_release(struct device *dev)
 {
 	struct serdev_controller *ctrl = to_serdev_controller(dev);
@@ -86,28 +96,51 @@ static const struct device_type serdev_ctrl_type = {
 	.release	= serdev_ctrl_release,
 };
 
+static const struct serdev_device_id *serdev_match_id(const struct serdev_device_id *id,
+						      const char *modalias)
+{
+	if (!id || !modalias[0])
+		return NULL;
+
+	while (id->name[0]) {
+		if (!strcmp(modalias, id->name))
+			return id;
+		id++;
+	}
+
+	return NULL;
+}
+
 static int serdev_device_match(struct device *dev, const struct device_driver *drv)
 {
-	if (!is_serdev_device(dev))
-		return 0;
+	const struct serdev_device *serdev = to_serdev_device(dev);
+	const struct serdev_device_driver *sdrv = to_serdev_device_driver(drv);
 
-	/* TODO: platform matching */
 	if (acpi_driver_match_device(dev, drv))
 		return 1;
 
-	return of_driver_match_device(dev, drv);
+	if (of_driver_match_device(dev, drv))
+		return 1;
+
+	return !!serdev_match_id(sdrv->id_table, serdev->modalias);
 }
 
 /**
  * serdev_device_add() - add a device previously constructed via serdev_device_alloc()
  * @serdev:	serdev_device to be added
+ * @modalias:	Driver name or alias, used to match devices which have neither
+ *		an ACPI companion nor a device tree node. NULL for devices
+ *		enumerated from firmware.
  */
-int serdev_device_add(struct serdev_device *serdev)
+int serdev_device_add(struct serdev_device *serdev, const char *modalias)
 {
 	struct serdev_controller *ctrl = serdev->ctrl;
 	struct device *parent = serdev->dev.parent;
 	int err;
 
+	if (modalias)
+		strscpy(serdev->modalias, modalias);
+
 	dev_set_name(&serdev->dev, "%s-%d", dev_name(parent), serdev->nr);
 
 	/* Only a single slave device is currently supported. */
@@ -553,7 +586,7 @@ static int of_serdev_register_devices(struct serdev_controller *ctrl)
 
 		device_set_node(&serdev->dev, of_fwnode_handle(node));
 
-		err = serdev_device_add(serdev);
+		err = serdev_device_add(serdev, NULL);
 		if (err) {
 			dev_err(&serdev->dev,
 				"failure adding device. status %pe\n",
@@ -707,7 +740,7 @@ static acpi_status acpi_serdev_register_device(struct serdev_controller *ctrl,
 	ACPI_COMPANION_SET(&serdev->dev, adev);
 	acpi_device_set_enumerated(adev);
 
-	err = serdev_device_add(serdev);
+	err = serdev_device_add(serdev, NULL);
 	if (err) {
 		dev_err(&serdev->dev,
 			"failure adding ACPI serdev device. status %pe\n",
diff --git a/include/linux/device-id/serdev.h b/include/linux/device-id/serdev.h
new file mode 100644
index 000000000000..96644953cece
--- /dev/null
+++ b/include/linux/device-id/serdev.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef LINUX_DEVICE_ID_SERDEV_H
+#define LINUX_DEVICE_ID_SERDEV_H
+
+#ifdef __KERNEL__
+typedef unsigned long kernel_ulong_t;
+#endif
+
+/* serdev */
+
+#define SERDEV_NAME_SIZE	40
+#define SERDEV_MODULE_PREFIX	"serial:"
+
+struct serdev_device_id {
+	char name[SERDEV_NAME_SIZE];
+	kernel_ulong_t driver_data;	/* Data private to the driver */
+};
+
+#endif /* ifndef LINUX_DEVICE_ID_SERDEV_H */
diff --git a/include/linux/serdev.h b/include/linux/serdev.h
index b6c3d957ec15..96a441abc1ac 100644
--- a/include/linux/serdev.h
+++ b/include/linux/serdev.h
@@ -7,7 +7,9 @@
 
 #include <linux/types.h>
 #include <linux/device.h>
+#include <linux/device-id/serdev.h>
 #include <linux/iopoll.h>
+#include <linux/string.h>
 #include <linux/uaccess.h>
 #include <linux/termios.h>
 #include <linux/delay.h>
@@ -35,6 +37,10 @@ struct serdev_device_ops {
  * struct serdev_device - Basic representation of an serdev device
  * @dev:	Driver model representation of the device.
  * @nr:		Device number on serdev bus.
+ * @modalias:	Name of the driver to use with this device, or the alias
+ *		for it. Empty for devices enumerated from firmware, which
+ *		are identified through their ACPI companion or their device
+ *		tree node instead. See serdev_device_add().
  * @ctrl:	serdev controller managing this device.
  * @ops:	Device operations.
  * @write_comp:	Completion used by serdev_device_write() internally
@@ -43,6 +49,7 @@ struct serdev_device_ops {
 struct serdev_device {
 	struct device dev;
 	int nr;
+	char modalias[SERDEV_NAME_SIZE];
 	struct serdev_controller *ctrl;
 	const struct serdev_device_ops *ops;
 	struct completion write_comp;
@@ -55,12 +62,15 @@ struct serdev_device {
  * struct serdev_device_driver - serdev slave device driver
  * @driver:	serdev device drivers should initialize name field of this
  *		structure.
+ * @id_table:	List of serdev devices supported by this driver, used to
+ *		match devices which are not enumerated from firmware.
  * @probe:	binds this driver to a serdev device.
  * @remove:	unbinds this driver from the serdev device.
  * @shutdown:	shut down this serdev device.
  */
 struct serdev_device_driver {
 	struct device_driver driver;
+	const struct serdev_device_id *id_table;
 	int	(*probe)(struct serdev_device *);
 	void	(*remove)(struct serdev_device *);
 	void	(*shutdown)(struct serdev_device *);
@@ -158,7 +168,7 @@ static inline void serdev_controller_put(struct serdev_controller *ctrl)
 }
 
 struct serdev_device *serdev_device_alloc(struct serdev_controller *);
-int serdev_device_add(struct serdev_device *);
+int serdev_device_add(struct serdev_device *serdev, const char *modalias);
 void serdev_device_remove(struct serdev_device *);
 
 struct serdev_controller *serdev_controller_alloc(struct device *host,
-- 
2.34.1

