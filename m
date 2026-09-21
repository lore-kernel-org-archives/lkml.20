Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315C8423783
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790032038; cv=none; b=bEzCtaude3Tz98ZOKQEbZS6c/D5nXwciCCaikHKFYoG9wkaFNO5BNLFSR2HH5DNL/wIJL/ybcWAzs+HrBc+mZHVKDelPyL1Om5Db5ksHhsNBwrG6WttQEB1MP9m72PeOvAAtgkApbuB1HWTNnoX9rtWdlZANUyMAhfx64AJ6uj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790032038; c=relaxed/simple;
	bh=k6D9L6ciHlLLaPvdwvp7qrRKyk4DudHGu0gEpK4cjIQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VsgxdQMDeMYB3tFF2uYgmKn+U5TWtkVjpZu9EskZdBLnWmcHLKkbediB276suTd4QflCz6dnaIT18Uv/sJ0QWfRWGdmIaEUgEhUV+ia9uBvMLiSNofIQ7QrFqWekfpWz539mkWzS3eBDOaxi7t+XMBTWwx5DrT1wQLxJ1augZcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BbgqO3Zu; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BbgqO3Zu"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7348bd56fso2911163a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790032032; x=1790636832; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tV0m+z1ifDmYlEkqt8pxe/iOtaP+lMeY5FfCPnqmkp0=;
        b=BbgqO3Zul96nXr9F++uYPZio77eBMA0f48i5yna/+E5sBe91SRBKePWgnW3Oelw7A+
         3J2QxlyiAOCV+DVvkw76Gcp4IfqRrmW+y4Y38vRPF44ax0pcRR+nvqEI5UBDEAqbopYZ
         kMuIidPKUbTzbSK60hJiBbmmO80ipDNMW86jBJujQJpKMPvXyFew0zq58RGc7u49xzd9
         MSrbk8nk8G/BlLnAqsX8im2BMJ3NTRCm+82IqrYLvvpyD/E9j4/tTaAHIfBSAKBp7hyl
         xe+rSnnnO7BMhrbo7nobXRE1eY/kmlBhb0Xn7dnmyLMH5gTSEynnDZEqsf/xW1oAZLUx
         Tj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032032; x=1790636832;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tV0m+z1ifDmYlEkqt8pxe/iOtaP+lMeY5FfCPnqmkp0=;
        b=xlcpq+z8ddoSMp7AwrWBh1b/NHmmcJ5GOBNKt6hOoCcLDr1+h3qTmR/LwXetOKEsXD
         7tGdrOv/cOA6pwkgLZ/JtWEepctNTw2DDW4Gf4wDEM2DhqDShwXYZXnVtUr8IF80bKZS
         JZCssn+AnLtfquY6q9AgxNxHSuWL4FtAqF9PP0EnpSrt9TswKiW5onjaAtuBvODdSDeQ
         cwS5b5Vh4FKwEDXN5EcmE515zoJ/6VIO/mRD8O8QZ2pKxFlQhicEFIQZU9HBNdatKNeK
         LiN8b6F2GAd8zncbi6QG13iqkZarc6dJ1YP5Ms6W8VqfQ7BAua0DJVKW4DdrMVOUoWry
         GG6Q==
X-Forwarded-Encrypted: i=1; AKwUvBympFZya8AsY1BWG7wuaMRO4M6KzMyp7bh8hn3Hlrzl6sZ7nhitAUCGiRaeov4TZ+2E4EQNSkR5/S/YTjg=@vger.kernel.org
X-Gm-Message-State: AFuF++l5SaffJuqX2PJstDt15efei2qwIwNMozTh9xrBUuyUpJeor5kr
	gWOYDgAy7IjurjzWIwMDBMMC6pxLGH9sDK/A7VZx2VDCk5w3VITXBhZPLDpK5zzCq4b5PjrvFNt
	G54jaY1MwcO0OcQzXbbVsi7i0+eJrFQ==
X-Received: from dyaw12-n2.prod.google.com ([2002:a05:693c:414c:20b0:33c:393d:b309])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a10a:b0:3dd:a196:9072 with SMTP id adf61e73a8af0-3dde4127ee2mr474767637.60.1790032031849;
 Mon, 21 Sep 2026 16:07:11 -0700 (PDT)
Date: Mon, 21 Sep 2026 23:06:02 +0000
In-Reply-To: <20260921230603.2518652-1-samagazaryan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921230603.2518652-5-samagazaryan@google.com>
Subject: [PATCH v5 4/5] i3c: add i3cdev module to expose i3c dev in /dev
From: Sam Agazaryan <samagazaryan@google.com>
To: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	Sam Agazaryan <samagazaryan@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vitor Soares <vitor.soares@toradex.com>

Add userspace character device support for I3C transfers via /dev.

The module allows userspace programs to interact directly with I3C
targets that do not have a kernel driver bound to them, such as devices
in ROM/bootloader recovery mode (e.g. OCP Secure Firmware Recovery v1.1
and Caliptra Silicon Root of Trust recovery flows).

Features:
  - Dynamically exposes /dev/bus/i3c/<device> character devices for I3C
    devices when unbound from kernel drivers.
  - Dynamically allocates character device minor numbers using the IDA
    allocator.
  - Implements SDR and HDR transfers via I3C_IOC_XFER ioctl with 64-bit
    aligned UAPI data structures and actual_len read reporting.
  - Supports compat_ptr_ioctl for 32-bit userspace on 64-bit kernels.
  - Uses cdev_device_add/cdev_device_del with device refcounting to ensure
    safe lifecycle management and prevent use-after-free on driver detach.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
Co-developed-by: Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>
Signed-off-by: Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>
Co-developed-by: Sam Agazaryan <samagazaryan@google.com>
Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
---
 MAINTAINERS                     |   1 +
 drivers/i3c/Kconfig             |  11 +
 drivers/i3c/Makefile            |   1 +
 drivers/i3c/i3cdev.c            | 491 ++++++++++++++++++++++++++++++++
 include/uapi/linux/i3c/i3cdev.h |  57 ++++
 5 files changed, 561 insertions(+)
 create mode 100644 drivers/i3c/i3cdev.c
 create mode 100644 include/uapi/linux/i3c/i3cdev.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 81a9a02c919d..30a5cb12c4f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12364,6 +12364,7 @@ F:	Documentation/driver-api/i3c
 F:	drivers/i3c/
 F:	include/dt-bindings/i3c/
 F:	include/linux/i3c/
+F:	include/uapi/linux/i3c/
 
 IBM Operation Panel Input Driver
 M:	Eddie James <eajames@linux.ibm.com>
diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
index 626c54b386d5..166875837ec6 100644
--- a/drivers/i3c/Kconfig
+++ b/drivers/i3c/Kconfig
@@ -20,6 +20,17 @@ menuconfig I3C
 	  will be called i3c.
 
 if I3C
+
+config I3CDEV
+	tristate "I3C device interface"
+	help
+	  Say Y here to use i3c-* device files, usually found in the /dev
+	  directory on your system.  They make it possible to have user-space
+	  programs use the I3C devices.
+
+	  This support is also available as a module.  If so, the module
+	  will be called i3cdev.
+
 source "drivers/i3c/master/Kconfig"
 endif # I3C
 
diff --git a/drivers/i3c/Makefile b/drivers/i3c/Makefile
index 11982efbc6d9..606d422841b2 100644
--- a/drivers/i3c/Makefile
+++ b/drivers/i3c/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 i3c-y				:= device.o master.o
 obj-$(CONFIG_I3C)		+= i3c.o
+obj-$(CONFIG_I3CDEV)		+= i3cdev.o
 obj-$(CONFIG_I3C)		+= master/
diff --git a/drivers/i3c/i3cdev.c b/drivers/i3c/i3cdev.c
new file mode 100644
index 000000000000..309ce8181209
--- /dev/null
+++ b/drivers/i3c/i3cdev.c
@@ -0,0 +1,491 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Synopsys, Inc. and/or its affiliates.
+ * Copyright (c) 2026 Google LLC
+ *
+ * Author: Vitor Soares <soares@synopsys.com>
+ * Author: Sam Agazaryan <samagazaryan@google.com>
+ */
+
+#include <linux/cdev.h>
+#include <linux/cleanup.h>
+#include <linux/compat.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/overflow.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+
+#include <linux/i3c/i3cdev.h>
+
+#include "internals.h"
+
+struct i3cdev_data {
+	struct list_head list;
+	struct i3c_device *i3c;
+	struct device dev;
+	struct mutex xfer_lock; /* prevent detach while transferring */
+	struct cdev cdev;
+	int id;
+};
+
+static DEFINE_IDA(i3cdev_ida);
+static LIST_HEAD(i3cdev_list);
+static DEFINE_MUTEX(i3cdev_attach_lock);
+static dev_t i3cdev_number;
+#define I3C_MINORS (MINORMASK + 1)
+
+static void i3cdev_dev_release(struct device *dev)
+{
+	struct i3cdev_data *i3cdev = container_of(dev, struct i3cdev_data, dev);
+
+	ida_free(&i3cdev_ida, i3cdev->id);
+	kfree(i3cdev);
+}
+
+static struct i3cdev_data *i3cdev_get_by_i3c(struct i3c_device *i3c)
+{
+	struct i3cdev_data *i3cdev;
+
+	list_for_each_entry(i3cdev, &i3cdev_list, list) {
+		if (i3cdev->i3c == i3c)
+			return i3cdev;
+	}
+
+	return NULL;
+}
+
+static struct i3cdev_data *get_free_i3cdev(struct i3c_device *i3c)
+{
+	struct i3cdev_data *i3cdev;
+	int id;
+
+	id = ida_alloc_max(&i3cdev_ida, MINORMASK, GFP_KERNEL);
+	if (id < 0) {
+		pr_err("i3cdev: no minor number available!\n");
+		return ERR_PTR(id);
+	}
+
+	i3cdev = kzalloc_obj(*i3cdev, GFP_KERNEL);
+	if (!i3cdev) {
+		ida_free(&i3cdev_ida, id);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	i3cdev->i3c = i3c;
+	i3cdev->id = id;
+	list_add_tail(&i3cdev->list, &i3cdev_list);
+
+	return i3cdev;
+}
+
+static ssize_t
+i3cdev_read(struct file *file, char __user *buf, size_t count, loff_t *f_pos)
+{
+	char *tmp __free(kfree) = NULL;
+	struct i3cdev_data *i3cdev = file->private_data;
+	struct i3c_xfer xfers = {
+		.rnw = true,
+	};
+	struct i3c_device *i3c;
+	int ret;
+
+	count = min_t(size_t, count, type_max(xfers.len));
+	xfers.len = count;
+
+	tmp = kzalloc(count, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	guard(mutex)(&i3cdev->xfer_lock);
+	i3c = i3cdev->i3c;
+	if (!i3c || i3c->dev.driver)
+		return -ENODEV;
+
+	xfers.data.in = tmp;
+
+	dev_dbg(&i3c->dev, "Reading %zu bytes.\n", count);
+
+	ret = i3c_device_do_xfers(i3c, &xfers, 1, I3C_SDR);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(buf, tmp, xfers.actual_len))
+		return -EFAULT;
+
+	return xfers.actual_len;
+}
+
+static ssize_t
+i3cdev_write(struct file *file, const char __user *buf, size_t count,
+	     loff_t *f_pos)
+{
+	void *tmp __free(kfree) = NULL;
+	struct i3cdev_data *i3cdev = file->private_data;
+	struct i3c_xfer xfers = {
+		.rnw = false,
+	};
+	struct i3c_device *i3c;
+	int ret;
+
+	count = min_t(size_t, count, type_max(xfers.len));
+	xfers.len = count;
+
+	tmp = memdup_user(buf, count);
+	if (IS_ERR(tmp))
+		return PTR_ERR(tmp);
+
+	guard(mutex)(&i3cdev->xfer_lock);
+	i3c = i3cdev->i3c;
+	if (!i3c || i3c->dev.driver)
+		return -ENODEV;
+
+	xfers.data.out = tmp;
+
+	dev_dbg(&i3c->dev, "Writing %zu bytes.\n", count);
+
+	ret = i3c_device_do_xfers(i3c, &xfers, 1, I3C_SDR);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static int
+i3cdev_do_xfer(struct i3c_device *dev, struct i3c_ioc_xfer *xfers,
+	       struct i3c_ioc_xfer __user *u_xfers, unsigned int nxfers)
+{
+	struct i3c_xfer *k_xfers __free(kfree) = NULL;
+	enum i3c_xfer_mode mode = xfers[0].mode;
+	u8 **data_ptrs;
+	int i, j, nalloc, ret = 0;
+
+	/* Since we have nxfers we may allocate k_xfer + *data_ptrs together */
+	k_xfers = kcalloc(nxfers, sizeof(*k_xfers) + sizeof(*data_ptrs),
+			  GFP_KERNEL);
+	if (!k_xfers)
+		return -ENOMEM;
+
+	/* set data_ptrs to be after nxfers * i3c_xfer */
+	data_ptrs = (void *)k_xfers + (nxfers * sizeof(*k_xfers));
+
+	for (i = 0; i < nxfers; i++) {
+		bool is_read;
+
+		if (xfers[i].mode != mode) {
+			ret = -EINVAL;
+			break;
+		}
+
+		if (memchr_inv(xfers[i].pad, 0, sizeof(xfers[i].pad))) {
+			ret = -EINVAL;
+			break;
+		}
+
+		if (mode == I3C_SDR) {
+			if (xfers[i].rnw != I3C_DEV_DIR_WRITE &&
+			    xfers[i].rnw != I3C_DEV_DIR_READ) {
+				ret = -EINVAL;
+				break;
+			}
+			is_read = xfers[i].rnw == I3C_DEV_DIR_READ;
+		} else {
+			is_read = xfers[i].cmd & 0x80;
+		}
+
+		if (is_read) {
+			data_ptrs[i] = kzalloc(xfers[i].len, GFP_KERNEL);
+			if (!data_ptrs[i]) {
+				ret = -ENOMEM;
+				break;
+			}
+			k_xfers[i].data.in = data_ptrs[i];
+		} else {
+			data_ptrs[i] = memdup_user(u64_to_user_ptr(xfers[i].data),
+						   xfers[i].len);
+			if (IS_ERR(data_ptrs[i])) {
+				ret = PTR_ERR(data_ptrs[i]);
+				break;
+			}
+			k_xfers[i].data.out = data_ptrs[i];
+		}
+
+		k_xfers[i].cmd = xfers[i].cmd;
+		k_xfers[i].len = xfers[i].len;
+	}
+	nalloc = i;
+
+	if (ret < 0)
+		goto err_free_mem;
+
+	ret = i3c_device_do_xfers(dev, k_xfers, nxfers, mode);
+	if (ret)
+		goto err_free_mem;
+
+	for (i = 0; i < nxfers; i++) {
+		bool is_read = (mode == I3C_SDR) ?
+			       (xfers[i].rnw == I3C_DEV_DIR_READ) :
+			       (xfers[i].cmd & 0x80);
+
+		if (is_read) {
+			if (copy_to_user(u64_to_user_ptr(xfers[i].data),
+					 data_ptrs[i], k_xfers[i].actual_len) ||
+			    put_user(k_xfers[i].actual_len,
+				     &u_xfers[i].actual_len)) {
+				ret = -EFAULT;
+				break;
+			}
+		}
+	}
+
+err_free_mem:
+	for (j = 0; j < nalloc; j++)
+		kfree(data_ptrs[j]);
+	return ret;
+}
+
+static struct i3c_ioc_xfer *
+i3cdev_get_ioc_xfer(unsigned int cmd, struct i3c_ioc_xfer __user *u_xfers,
+		    unsigned int *nxfers)
+{
+	u32 tmp = _IOC_SIZE(cmd);
+
+	if ((tmp % sizeof(struct i3c_ioc_xfer)) != 0)
+		return ERR_PTR(-EINVAL);
+
+	*nxfers = tmp / sizeof(struct i3c_ioc_xfer);
+	if (*nxfers == 0)
+		return ERR_PTR(-EINVAL);
+
+	return memdup_user(u_xfers, tmp);
+}
+
+static int
+i3cdev_ioc_xfer(struct i3c_device *i3c, unsigned int cmd,
+		struct i3c_ioc_xfer __user *u_xfers)
+{
+	struct i3c_ioc_xfer *k_xfers __free(kfree) = NULL;
+	unsigned int nxfers;
+
+	k_xfers = i3cdev_get_ioc_xfer(cmd, u_xfers, &nxfers);
+	if (IS_ERR(k_xfers))
+		return PTR_ERR(k_xfers);
+
+	return i3cdev_do_xfer(i3c, k_xfers, u_xfers, nxfers);
+}
+
+static long
+i3cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct i3cdev_data *i3cdev = file->private_data;
+	struct i3c_device *i3c;
+
+	if (_IOC_TYPE(cmd) != I3C_DEV_IOC_MAGIC)
+		return -ENOTTY;
+
+	/* Use the xfer_lock to prevent device detach during ioctl call */
+	guard(mutex)(&i3cdev->xfer_lock);
+	i3c = i3cdev->i3c;
+	if (!i3c || i3c->dev.driver)
+		return -ENODEV;
+
+	dev_dbg(&i3c->dev, "ioctl, cmd=0x%02x, arg=0x%02lx\n", cmd, arg);
+
+	/* Check command number and direction */
+	if (_IOC_NR(cmd) == _IOC_NR(I3C_IOC_XFER(0)) &&
+	    _IOC_DIR(cmd) == (_IOC_READ | _IOC_WRITE))
+		return i3cdev_ioc_xfer(i3c, cmd,
+				       (struct i3c_ioc_xfer __user *)arg);
+
+	return -ENOTTY;
+}
+
+static int i3cdev_open(struct inode *inode, struct file *file)
+{
+	struct i3cdev_data *i3cdev = container_of(inode->i_cdev,
+						  struct i3cdev_data,
+						  cdev);
+	file->private_data = i3cdev;
+
+	return 0;
+}
+
+static int i3cdev_release(struct inode *inode, struct file *file)
+{
+	file->private_data = NULL;
+
+	return 0;
+}
+
+static const struct file_operations i3cdev_fops = {
+	.owner		= THIS_MODULE,
+	.read		= i3cdev_read,
+	.write		= i3cdev_write,
+	.unlocked_ioctl	= i3cdev_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
+	.open		= i3cdev_open,
+	.release	= i3cdev_release,
+};
+
+/* ------------------------------------------------------------------------- */
+
+static const struct class i3cdev_class = {
+	.name = "i3cdev",
+};
+
+static int i3cdev_attach(struct device *dev, void *dummy)
+{
+	struct i3cdev_data *i3cdev;
+	struct i3c_device *i3c;
+	int res;
+
+	if (dev->type == &i3c_masterdev_type)
+		return 0;
+
+	i3c = dev_to_i3cdev(dev);
+
+	guard(mutex)(&i3cdev_attach_lock);
+	if (dev->driver || i3cdev_get_by_i3c(i3c))
+		return 0;
+
+	/* Get a device */
+	i3cdev = get_free_i3cdev(i3c);
+	if (IS_ERR(i3cdev))
+		return PTR_ERR(i3cdev);
+
+	mutex_init(&i3cdev->xfer_lock);
+	cdev_init(&i3cdev->cdev, &i3cdev_fops);
+	i3cdev->cdev.owner = THIS_MODULE;
+
+	device_initialize(&i3cdev->dev);
+	i3cdev->dev.devt = MKDEV(MAJOR(i3cdev_number), i3cdev->id);
+	i3cdev->dev.class = &i3cdev_class;
+	i3cdev->dev.parent = &i3c->dev;
+	i3cdev->dev.release = i3cdev_dev_release;
+
+	res = dev_set_name(&i3cdev->dev, "bus!i3c!%s", dev_name(&i3c->dev));
+	if (res)
+		goto error_put_dev;
+
+	res = cdev_device_add(&i3cdev->cdev, &i3cdev->dev);
+	if (res)
+		goto error_put_dev;
+
+	pr_debug("i3cdev: I3C device [%s] registered as minor %d\n",
+		 dev_name(&i3c->dev), i3cdev->id);
+	return 0;
+
+error_put_dev:
+	list_del(&i3cdev->list);
+	put_device(&i3cdev->dev);
+	return res;
+}
+
+static int i3cdev_detach(struct device *dev, void *dummy)
+{
+	struct i3cdev_data *i3cdev;
+	struct i3c_device *i3c;
+
+	if (dev->type == &i3c_masterdev_type)
+		return 0;
+
+	i3c = dev_to_i3cdev(dev);
+
+	guard(mutex)(&i3cdev_attach_lock);
+	i3cdev = i3cdev_get_by_i3c(i3c);
+	if (!i3cdev)
+		return 0;
+
+	list_del(&i3cdev->list);
+
+	/* Prevent transfers while cdev removal */
+	scoped_guard(mutex, &i3cdev->xfer_lock)
+		i3cdev->i3c = NULL;
+
+	cdev_device_del(&i3cdev->cdev, &i3cdev->dev);
+	put_device(&i3cdev->dev);
+
+	pr_debug("i3cdev: device [%s] unregistered\n", dev_name(&i3c->dev));
+
+	return 0;
+}
+
+static int i3cdev_notifier_call(struct notifier_block *nb,
+				unsigned long action,
+				void *data)
+{
+	struct device *dev = data;
+
+	switch (action) {
+	case BUS_NOTIFY_ADD_DEVICE:
+	case BUS_NOTIFY_UNBOUND_DRIVER:
+	case BUS_NOTIFY_DRIVER_NOT_BOUND:
+		i3cdev_attach(dev, NULL);
+		break;
+	case BUS_NOTIFY_DEL_DEVICE:
+	case BUS_NOTIFY_REMOVED_DEVICE:
+	case BUS_NOTIFY_BIND_DRIVER:
+		i3cdev_detach(dev, NULL);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block i3cdev_notifier = {
+	.notifier_call = i3cdev_notifier_call,
+};
+
+static int __init i3cdev_init(void)
+{
+	int res;
+
+	/* Dynamically request unused major number */
+	res = alloc_chrdev_region(&i3cdev_number, 0, I3C_MINORS, "i3c");
+	if (res)
+		goto out;
+
+	/* Register device class to populate sysfs entries */
+	res = class_register(&i3cdev_class);
+	if (res)
+		goto out_unreg_chrdev;
+
+	/* Keep track of busses which have devices to add or remove later */
+	res = bus_register_notifier(&i3c_bus_type, &i3cdev_notifier);
+	if (res)
+		goto out_unreg_class;
+
+	/* Bind to already existing device without driver right away */
+	i3c_for_each_dev(NULL, i3cdev_attach);
+
+	return 0;
+
+out_unreg_class:
+	class_unregister(&i3cdev_class);
+out_unreg_chrdev:
+	unregister_chrdev_region(i3cdev_number, I3C_MINORS);
+out:
+	pr_err("%s: Driver Initialisation failed\n", __FILE__);
+	return res;
+}
+
+static void __exit i3cdev_exit(void)
+{
+	bus_unregister_notifier(&i3c_bus_type, &i3cdev_notifier);
+	i3c_for_each_dev(NULL, i3cdev_detach);
+	class_unregister(&i3cdev_class);
+	unregister_chrdev_region(i3cdev_number, I3C_MINORS);
+}
+
+MODULE_AUTHOR("Vitor Soares <soares@synopsys.com>");
+MODULE_DESCRIPTION("I3C /dev entries driver");
+MODULE_LICENSE("GPL");
+
+module_init(i3cdev_init);
+module_exit(i3cdev_exit);
diff --git a/include/uapi/linux/i3c/i3cdev.h b/include/uapi/linux/i3c/i3cdev.h
new file mode 100644
index 000000000000..69e901017378
--- /dev/null
+++ b/include/uapi/linux/i3c/i3cdev.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (c) 2020 Synopsys, Inc. and/or its affiliates.
+ * Copyright (c) 2026 Google LLC
+ *
+ * Author: Vitor Soares <vitor.soares@synopsys.com>
+ */
+
+#ifndef _UAPI_I3C_DEV_H_
+#define _UAPI_I3C_DEV_H_
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+
+/* IOCTL commands */
+#define I3C_DEV_IOC_MAGIC	0x07
+
+#define I3C_DEV_DIR_WRITE	0
+#define I3C_DEV_DIR_READ	1
+
+#define I3C_XFER_MODE_HDR_DDR	0
+#define I3C_XFER_MODE_HDR_TSP	1
+#define I3C_XFER_MODE_HDR_TSL	2
+#define I3C_XFER_MODE_SDR	31
+
+/**
+ * struct i3c_ioc_xfer - I3C ioctl transfer
+ * @data: Holds pointer to userspace buffer with transmit/receive data.
+ * @len: Length of data buffer, in bytes.
+ * @actual_len: Actual length of data transferred on read, in bytes (output).
+ * @rnw: Transfer direction for SDR mode (I3C_DEV_DIR_WRITE or I3C_DEV_DIR_READ).
+ * @cmd: Command byte for HDR mode (0x00-0x7f write, 0x80-0xff read).
+ * @mode: Transfer mode (I3C_XFER_MODE_SDR, I3C_XFER_MODE_HDR_DDR, etc.).
+ * @pad: Reserved for future extensions; must be zeroed.
+ */
+struct i3c_ioc_xfer {
+	__u64 data;
+	__u16 len;
+	__u16 actual_len;
+	union {
+		__u8 rnw;
+		__u8 cmd;
+	};
+	__u8 mode;
+	__u8 pad[2];
+};
+
+#define __I3C_XFER_SIZE(type)	\
+	((((sizeof(struct i3c_ioc_xfer)) * (type)) < (1 << _IOC_SIZEBITS)) \
+	? ((sizeof(struct i3c_ioc_xfer)) * (type)) : 0)
+
+#define I3C_XFER_SIZE(N)	__I3C_XFER_SIZE(N)
+
+#define I3C_IOC_XFER(N)	\
+	_IOC(_IOC_READ | _IOC_WRITE, I3C_DEV_IOC_MAGIC, 30, I3C_XFER_SIZE(N))
+
+#endif
-- 
2.55.0.1082.g2b9226bbc0-goog

