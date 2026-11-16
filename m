Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844363;
	b=Fm1JcOkxUbWCiU6HoQLZrRTIgf/VZOWcjl57KmmIhoCdxAMPUwk6ROa9eq2Dp/Aj3cg0
	 gklpTbavNLbbHjA6xFoPpq0xsLDcasGkOMXVrZET6/fAUo2yOuQeaRdybX8tIQMIeL7If
	 AEQyJHbKi+k/0e8AMqv1kX8Prv/AAmDSlPneLlYHLmY1T8ZgpXTdWVPjFIVNSqCmCU30B
	 CgRWf7Xo4v/kTloQtvoe6vv+0Rd2FPRWT6AnClkTgSaGCPN5j9f3zb0fNJ3yhwpkvazNR
	 L5P+5WYA168DAaEvZ4vcpNJHUX81bLCO5s+i7RzOobkvLwN0EYkmUCfJSTaDX+oUTQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=as6lfQgT0SS2+M8bZvtdZx81O7qD4ZXK/a76cVHD/dk=;
	b=MNYfrbaWe+jvyMGvSvnaXCxiebWn21V9veWY/Am9xpxs5iHQA2seVfIRQRU/qKx6OLlP
	 ak901dk4wtJa+k5oCrAUaywGChLPVwDobngfVuu2Bxxzdnb3Rssc2DOGgJ9fcLoy3HiWh
	 YUFKd3csDQmEtP2GgKyw0UPgvm0f8TUBlSJ8KJqTkl/+mXotXuiHrTTXExOXt1Mexw1Uv
	 lOFMvZP8qaICuSoXV5i6CNwYlP2/HFf2pyxjpygvkIRcgVSsqM/UHMKWgAUrvT4TyZvWQ
	 yJ32xcZgqPFgVeUrFtJuVLSCGPsk9SQ/aJ90w3hzRelI781qN5nK2YEdlB06Eogo3nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KYkpviFY;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB3E606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB3E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KYkpviFY
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso20945445e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844361; x=1795449161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=as6lfQgT0SS2+M8bZvtdZx81O7qD4ZXK/a76cVHD/dk=;
        b=KYkpviFYAF1UhFkFenO2Rf+sngyBhwpvohV0XvRjnUK2SCncac7liBPWvzJx02EUhq
         Tz5j3AR+TU2XbHhasM70T8zUwz8pihQJLgn6zGhD/tvUd6mwqUvH0MeqfUS0wwjoHxaY
         XOLl6csFvzK2avFQ14N9BuZlP5sI/zCuD4L/M6KiQCtZnf1ICOU/j+3seEFdrZ0I/97+
         ABaADWj40891dzi16JQ61yFK7rtCd2r2i4k9SgsL3NZOln4HPaeBePhq1Ci0eO/FEZ5z
         lZl6Y+BkP/YikGGlDIDqnHYohv3+5L+A8pDqtK1sdCprEUDqE5dUVUUy6v+4bGFnE6t1
         73Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844361; x=1795449161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=as6lfQgT0SS2+M8bZvtdZx81O7qD4ZXK/a76cVHD/dk=;
        b=SWwN57BuUEy6xXT+zar8Ui1tpqEBGLP/w8N+z56g7Jv7wodTGF+hlkNMbUqLKPh+Jo
         9nUhxr3GZQ0N3G9bXfHD6k+5t86ouBXc5UJm2y/upTSjAmG6whOxc/h6YEKJCsD3iY22
         XVkdtNqwp//nQZ96+dd9w3CIsKzxp5K3KZTUmrkOyqMdIGj83BYu+3t1TY70Vf25/4mq
         +QxRwL+JlaVpxwIuqxDXWvbE5qTE7RFG3XAd9MW1l9X9fG/Z5cSQUNG5vj1TnLmIbdim
         dlov92CveMelvDZ7gfcLiIrLXxC3OQfHo+Bz7c5s+PSfKujHy1wSQ2y7w7x3aAhY8hQQ
         C2Eg==
X-Forwarded-Encrypted: i=1; AL+hErH63hRYfaNwaMGrVsuDdtDiU+jMDPqdX04OgamiEve3fSmtggQ39hxd6B/QEazi/nHRJVc2JDMBiizTp58=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mj76e4bQr2hOqrMzh4jZwReiLxOBtE1qnia8q+UcvqCCJ2Pma
	kr3fNW3eAyYv9yvxgKnuJ7rho2v3UnNAjI2ewIY1mcBdv5kRDECi+Tdh
X-Gm-Gg: AYBFou3VU1Euad/kjlJSj6HFnVoifNbXfbvrnSOUDwLUq/5LHbvGXCt8fzOnxl6QLtj
	64l6/21x28jmF8mqtxppg0RgQs7rdp9KEuYaTjw87Nx//oMRObqPZ1degEGfdzU5eeaAPpto9oJ
	s0untYELuORPDha0IKDcC4EiuyXk9Vy3INOuf6hkabJ1DE+XaOC7O3r78RYY5C7CjkcdnEXJNRs
	zq+vcavCDGV9EBKofWyBoqkKu/jMTq2aPlbc0C0F9lcjL+DOTNoKYMk3RRFxguheK4GNJnA3P1L
	ssEq8kOlFB5KLAvLtvE4PM1V3rxu1dkWLGUQ6PoFzPhwC3/tPonIboN/OTwqP6GoaygetQsO8yU
	63sIcsrAHIoeLgziIYuQZiYhuWk1yoHvG+MYEbwqeHr4bcZhJXLJpP2o6SHJ7ZmZ/kz+6B/UmgZ
	XzjAtSCdWIVJEuOGDjjHViqa8h09qedV8l1XTysLzU/863QT6zkSt48kv3wVr7zozzM57MzcDXX
	F7DgS8bBeUESj8HideA+aHKqYzuoE66lN+NzUYAS04pi9DJAgSTcwoKFLldVKLI1JZXbrhHCH3i
	CoAjiKd596OYsGaWFYx9nwKfZQm0/u7tFYUg8I9FlhRdudOMaQB7xIrO1p8eLEBebknlAsthgeM
	YfK758t7MbiJ/jmhSyfhDTfC67de3NkVJhYZwKBeO
X-Received: by 2002:a05:600c:1f96:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb55a4f43fmr249109315e9.16.1794844360710;
        Mon, 16 Nov 2026 07:52:40 -0800 (PST)
Received: from B87454BG30364.retailmedia.com (284035233.box.freepro.com. [82.96.134.200])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm321279415e9.10.2026.11.16.07.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:52:39 -0800 (PST)
From: Erwan Velu <erwanaliasr1@gmail.com>
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>,
	Suma Hegde <suma.hegde@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Erwan Velu <e.velu@criteo.com>
Subject: [PATCH v2 2/5] platform/x86/amd/hsmp: Add amd_hsmp class with per-socket devices
Date: Mon, 16 Nov 2026 16:51:44 +0100
Message-ID: <20261116155147.769630-3-erwanaliasr1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116155147.769630-1-erwanaliasr1@gmail.com>
References: <20261116155147.769630-1-erwanaliasr1@gmail.com>
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

From: Erwan Velu <e.velu@criteo.com>

The per-socket attributes live in different places depending on the
driver that probed. With the ACPI driver, they are under
/sys/devices/platform/AMDI0097:0X/. With the platform driver, the
per-socket directories are /sys/devices/platform/amd_hsmp/socketN/.
"modprobe amd_hsmp" picks the right driver, but userspace cannot know
in advance which of these trees it has to read.

Add an amd_hsmp class, and a socketN device per socket in it that
carries hsmp_sock_groups. The device is a child of the device of the
driver that probed the socket, so /sys/class/amd_hsmp/socketN/ is the
same path whichever driver is in use.

Register the socket devices from the ACPI driver. They are children of
the AMDI0097:0X devices. The attributes on AMDI0097:0X are kept, as
they are documented.

The socket device is unregistered before remove takes hsmp_sock_rwsem:
device_unregister() waits for in-flight sysfs reads, which take the
rwsem for read.

On a dual socket Zen5 (Family 1Ah) server probed by the ACPI driver,
this gives:

  $ ls -l /sys/class/amd_hsmp/
  socket0 -> ../../devices/platform/AMDI0097:00/amd_hsmp/socket0
  socket1 -> ../../devices/platform/AMDI0097:01/amd_hsmp/socket1
  $ cat /sys/class/amd_hsmp/socket0/pwr_current_active_freq_limit
  3120

The amd_hsmp directory below AMDI0097:0X is the glue directory the
driver core creates for class devices whose parent is not a class
device. The attributes directly under AMDI0097:0X are unchanged.

Assisted-by: claude-opus-5-5
Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 Documentation/arch/x86/amd_hsmp.rst   | 12 ++++-
 drivers/platform/x86/amd/hsmp/acpi.c  | 14 ++++++
 drivers/platform/x86/amd/hsmp/hsmp.c  | 19 +++++++
 drivers/platform/x86/amd/hsmp/hsmp.h  |  6 +++
 drivers/platform/x86/amd/hsmp/sysfs.c | 71 ++++++++++++++++++++++++++-
 5 files changed, 120 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index c483c68dcfad..f145ea12af99 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -65,6 +65,16 @@ In-kernel integration:
 HSMP sysfs interface
 ====================
 
+Each socket has a socket%d device in the amd_hsmp class, whose parent is the
+device of the driver that probed the socket. Its per socket sysfs files are
+therefore available at /sys/class/amd_hsmp/socket%d/, whichever driver
+probed.
+
+With the ACPI driver, the socket devices are children of the ACPI devices,
+e.g. /sys/devices/platform/AMDI0097:00/amd_hsmp/socket0/. For backward
+compatibility, the files are also available directly under
+/sys/devices/platform/AMDI0097:0X/.
+
 1. Metrics table binary sysfs
 
 AMD MI300A MCM provides GET_METRICS_TABLE message to retrieve
@@ -88,7 +98,7 @@ The same is defined in the amd_hsmp.h header.
 
 2. HSMP telemetry sysfs files
 
-Following sysfs files are available at /sys/devices/platform/AMDI0097:0X/.
+Following sysfs files are available at /sys/class/amd_hsmp/socket%d/.
 
 * c0_residency_input: Percentage of cores in C0 state.
 * prochot_status: Reports 1 if the processor is at thermal threshold value,
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index a1e13aff9c86..2c9389b8f139 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -452,6 +452,14 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 		dev_dbg(&pdev->dev, "AMD HSMP ACPI misc device registered\n");
 	}
 
+	/*
+	 * The attributes stay available on the ACPI device itself, so a
+	 * failure here is not fatal to the probe.
+	 */
+	ret = hsmp_sock_dev_register(&pdev->dev, dev_get_drvdata(&pdev->dev));
+	if (ret)
+		dev_warn(&pdev->dev, "Failed to register HSMP socket device: %d\n", ret);
+
 	return 0;
 }
 
@@ -459,6 +467,12 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
 {
 	struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
 
+	/*
+	 * Must run before taking hsmp_sock_rwsem below: unregistering the
+	 * class device waits for in-flight sysfs reads, which take it for read.
+	 */
+	hsmp_sock_dev_unregister(sock);
+
 	/*
 	 * Serialize the kref_put() and any release it triggers against a
 	 * concurrent probe, and drain the data plane for the whole
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 45d20beda946..a498f904f900 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -16,7 +16,9 @@
 #include <linux/compiler.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/init.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/nospec.h>
 #include <linux/rwsem.h>
@@ -857,6 +859,23 @@ struct hsmp_plat_device *get_hsmp_pdev(void)
 }
 EXPORT_SYMBOL_NS_GPL(get_hsmp_pdev, "AMD_HSMP");
 
+/*
+ * The amd_hsmp class must exist before the ACPI or platform driver probes a
+ * socket. When built in, subsys_initcall() runs it ahead of their
+ * device_initcall()s.
+ */
+static int __init hsmp_common_init(void)
+{
+	return hsmp_sock_class_register();
+}
+subsys_initcall(hsmp_common_init);
+
+static void __exit hsmp_common_exit(void)
+{
+	hsmp_sock_class_unregister();
+}
+module_exit(hsmp_common_exit);
+
 MODULE_DESCRIPTION("AMD HSMP Common driver");
 MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 7a0e3af67691..35b4e2312bf2 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -32,6 +32,7 @@
 
 #define HSMP_CDEV_NAME		"hsmp_cdev"
 #define HSMP_DEVNODE_NAME	"hsmp"
+#define HSMP_CLASS_NAME		"amd_hsmp"
 #define ACPI_HSMP_DEVICE_HID    "AMDI0097"
 
 #define DRIVER_VERSION		"2.6"
@@ -71,6 +72,7 @@ struct hsmp_socket {
 	/* Size of the region mapped at @metric_tbl_addr, as reported by SMU */
 	size_t metric_tbl_size;
 	void __iomem *virt_base_addr;
+	struct device *sysfs_dev;
 	struct semaphore hsmp_sem;
 	/* Serializes HSMP_GET_METRIC_TABLE fill-and-copy for this socket */
 	struct mutex metric_read_lock;
@@ -104,6 +106,10 @@ int hsmp_create_sensor(struct device *dev, u16 sock_ind);
 static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
 #endif
 int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
+int hsmp_sock_class_register(void);
+void hsmp_sock_class_unregister(void);
+int hsmp_sock_dev_register(struct device *parent, struct hsmp_socket *sock);
+void hsmp_sock_dev_unregister(struct hsmp_socket *sock);
 extern const struct attribute_group *hsmp_sock_groups[];
 
 /*
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 06c0a5a02ca2..94670c8e689b 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -4,7 +4,8 @@
  * Copyright (c) 2024, AMD.
  * All Rights Reserved.
  *
- * This file provides the per-socket sysfs attributes of the HSMP interface.
+ * This file provides the per-socket sysfs attributes of the HSMP interface
+ * and the amd_hsmp class devices carrying them.
  */
 
 #include <asm/amd/hsmp.h>
@@ -13,6 +14,9 @@
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kdev_t.h>
+#include <linux/lockdep.h>
 #include <linux/sysfs.h>
 
 #include "hsmp.h"
@@ -346,3 +350,68 @@ const struct attribute_group *hsmp_sock_groups[] = {
 	NULL
 };
 EXPORT_SYMBOL_NS_GPL(hsmp_sock_groups, "AMD_HSMP");
+
+/*
+ * Every socket gets a socket%u device in this class, parented to the device of
+ * the driver that probed it, whichever that driver is. This gives userspace a
+ * single /sys/class/amd_hsmp/socket%u path to the per-socket attributes.
+ */
+static const struct class hsmp_class = {
+	.name = HSMP_CLASS_NAME,
+};
+
+int hsmp_sock_class_register(void)
+{
+	return class_register(&hsmp_class);
+}
+
+void hsmp_sock_class_unregister(void)
+{
+	class_unregister(&hsmp_class);
+}
+
+/**
+ * hsmp_sock_dev_register() - Create the amd_hsmp class device of @sock.
+ * @parent: device of the driver that probed @sock.
+ * @sock: fully probed HSMP socket.
+ *
+ * The device is named socket%u after @sock's index, is a child of @parent and
+ * carries hsmp_sock_groups with @sock as its drvdata, so @sock must stay valid
+ * until hsmp_sock_dev_unregister() returns.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int hsmp_sock_dev_register(struct device *parent, struct hsmp_socket *sock)
+{
+	struct device *dev;
+
+	dev = device_create_with_groups(&hsmp_class, parent, MKDEV(0, 0), sock,
+					hsmp_sock_groups, "socket%u", sock->sock_ind);
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	sock->sysfs_dev = dev;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_sock_dev_register, "AMD_HSMP");
+
+/**
+ * hsmp_sock_dev_unregister() - Remove the amd_hsmp class device of @sock.
+ * @sock: HSMP socket; a no-op if its device was never registered.
+ *
+ * device_unregister() waits for in-flight show/read handlers, which take
+ * hsmp_sock_rwsem for read. The caller must therefore not hold it, or a
+ * concurrent sysfs read would deadlock the teardown.
+ */
+void hsmp_sock_dev_unregister(struct hsmp_socket *sock)
+{
+	lockdep_assert_not_held(&hsmp_sock_rwsem);
+
+	if (!sock->sysfs_dev)
+		return;
+
+	device_unregister(sock->sysfs_dev);
+	sock->sysfs_dev = NULL;
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_sock_dev_unregister, "AMD_HSMP");
-- 
2.53.0

