Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585373;
	b=jacFFYrH1nV/gU9iLWvkKNc7521rlWP2UokmeL7ftcDIpiJafJaEQwYbDMZri6FyNJ5d
	 35brAfWh95GQCSQM17rbGQCYDCZxWEae2sz/bpAWcjfF9ZtB2MDI2R7U9q/yF2Xku+GG7
	 Kf4ygNuM/7PgsJS9j/pyeyUZW5HhD3EQwM8toKiDw/ZKVL/oKOvScfV4rmU52CdDjzjmZ
	 myJpQATXa3/iqR7PmPc93GhFMvlB9Act+oeYop/0kSVVQ3q3M4QdIDdVX5b57MaJ9DwIk
	 OrHWqa8rHyPbRo5+U1FFCuA7gi6R78HSxi8tj4mKVVEihNd0kfRh2oqSzFmaotYK0PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KCWQLV59SSkBVEyRi73YWJ7kvOmA9/flLQSro0VYOqA=;
	b=U5XbHnzcvTLTOEMJSY/VIcC0n38JtGYjAfPRjNG2j/ULxUW8Z1Xs3IalLFGkFE0v8p+c
	 nF/xVPzJtpFr4YYaQj7WSnazjcMw7FooDkuGTmx79+DOz6TVTGp1mQydghHX0aA33Bu8c
	 aQ9K7qWiokRIpX5uqWStrfktAjnnUYaqeiMgfzYsLaalan79vlWIXFX9n14hqTEDAtDYO
	 Cd5LleWbKBMfysmdVWZOCzcCoAO/DY063f66vZZ9FhWcmaJwdNeqrzwb55CZ9X8lZg4vc
	 JPhxLsNeGI2aA9G73g3KIXY8SNPFgJ0Ar1vi8ighNx1wKhst338BhFjWFxDGr86iPOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=uXHklBYE;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7276606AE24
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7276606AE24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=uXHklBYE
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5067a2411bso217940466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1794585371; x=1795190171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCWQLV59SSkBVEyRi73YWJ7kvOmA9/flLQSro0VYOqA=;
        b=uXHklBYEpWMLRXQHwKuLvydJg/KWSyTceGlGKPNQucAtESrumouDSUc5zs9m2zY+mQ
         akYl5GUokhmC+EE3nFnK8cqP2QrfMWLQ1C8Mml/eUscVK/vq+gR1ssbGjPxbKiJ4NIrx
         PYN/kF79+ml0tYKxkiFeAZK4r+YEXXi71vBi7Bz6KVpcCYzJk/Kmp9ImX3k8DsPqLluE
         iPHRDiTPRsy1u6svxg1FwAlUv0nryAngTCyZFOzNOmcuKiEepbY09u/9cmPTmUH5ywED
         quipRZCnt3hUd22ldx3aN0coJmuFOIjWU/Gc8tD4hDspD2Swx5liqnNSe7rP1enP+6zH
         ChCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585371; x=1795190171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KCWQLV59SSkBVEyRi73YWJ7kvOmA9/flLQSro0VYOqA=;
        b=ha9g9CXzTpJaACdeowwlc7787pyBheOy5HwwWqye95NMIgLfLsrgNEjbrQl/ydifrU
         a6Muywx3m5wCqYAWi8UyHvWWwWJf/KOXLpE077EH3m4qsNmlJLxAuXUwMYQdmMvOUJ5j
         8w8DDXsCHtyMuCAXe3sUuDiU+2zuwJf40tHkREH5Tvb+Vv64Dp1JEXGrtNL7UkU6UESD
         7tofej4hIrH3/le5gCc5vBgsk3GMSqOtLr3Fp9ac1f+UwNbjKm1WylXZ5EciQy4cUbxS
         3LRUFqHm/qonVRz65KmGOKURfZoDEWqYgLdCYIVKO0Wltf0zW/8WvF1Wp37JKsiSJA6X
         E5WQ==
X-Gm-Message-State: APuU4Z/8FhwxktE3BEROSj9iM1rWjjZogCQ1lPUZczi0XmVi1CNI3T6P
	0Gw9cqJL3QD7BMyOiB73Yd6r3ykVaQPyBlNxuhVj4ACT9mRxY470H5y40l/hTA9ikes=
X-Gm-Gg: AYBFou2aNj+7YSAEmTnPjGf2D49Y2bA1BvAkl//EG6NZTK6sXZ5Cz7q3MrUYRfr9Dnc
	XB6djD3JNplsdsVjOf7HSNNNtS7W/HxA8LgctbgegP29XhknfEXOOWkClR5r+ZuO/4OoFPHnZti
	cr0BwHVVg75gQZBLvxnxrATECmukvt2rOUbbixAx03Zu+/AQxl3+luq59C3YoVeG+pu6Cyi3Jf6
	xvVVwsqFA4SsIvg2af0UdJx77+uZiUU1h5GKHk18osUczN3+sA9ijr2bJsVZXWPGZwwXgQ5givw
	dqS+euqa80e20+7fxUxhBXaVPwnnzELk3UTTX4KeCMpqwfH81JM70VDNRI8YdfMuXEztzh7YDro
	00HtD6qztq2dmznRcr0RoRdA4Gen0xXCVZbt2wJTp6M1QUr7PoxVksN9psSXONgrMnaWmL/p6Vh
	TzIgMrnZda0lMutO9OWS60Y+FyJdcDeLK3Iti0WynyRn+8gD5CJuhpr5OAMpVNucph58Wb5P3l4
	gyhuK6r36crN62hr9+wZ3g9Z7UVAhNe0SOoirKvEicmFJcat1nmr0SDcX2TVkCUNF8ZZYO7HZEr
	KbDeCRfr2pKM+z98cfc79rIOgxPp33Px/w+wrG4+
X-Received: by 2002:a17:907:868f:b0:c50:5545:b66f with SMTP id a640c23a62f3a-c5096419c32mr273901166b.23.1794585371027;
        Fri, 13 Nov 2026 07:56:11 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b40831sm118888166b.42.2026.11.13.07.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:56:10 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	jgg@ziepe.ca,
	david.quigley@intel.com,
	lukas@wunner.de,
	ksinyuk@kernel.org,
	rodrigo.vivi@intel.com,
	cedric.xing@intel.com,
	sameo@meta.com,
	drdeeglaze@gmail.com,
	James.Bottomley@HansenPartnership.com,
	aik@amd.com,
	jpiotrowski@nvidia.com,
	qinkun@google.com,
	pgonda@google.com,
	jic23@kernel.org,
	alistair.francis@wdc.com,
	ankita@nvidia.com,
	suzuki.poulose@arm.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	peter.fang@intel.com,
	jarkko@kernel.org,
	zohar@linux.ibm.com,
	yeoreum.yun@arm.com,
	aneesh.kumar@kernel.org,
	dave.jiang@intel.com,
	nik.borisov@suse.com,
	sergii.dmytruk@3mdeb.com
Subject: [PATCH RFC v2 12/15] ctlv: Add character device nodes
Date: Fri, 13 Nov 2026 16:55:11 +0100
Message-ID: <20261113155515.2510194-13-jiri@resnulli.us>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113155515.2510194-1-jiri@resnulli.us>
References: <20261113155515.2510194-1-jiri@resnulli.us>
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

From: Jiri Pirko <jiri@nvidia.com>

Give a subsystem's device a node of the subsystem's own class, whose
file operations are the CTLV ones. The subsystem registers the class
with CTLV, which takes its device numbers, and embeds a struct
ctlv_device beside the instance.

Assisted-by: Cursor: GPT-5.6 Sol
Assisted-by: Cursor: Claude Opus 5.5
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
RFC->RFCv2:
- split out of the device and operation dispatch patch
- made a library each subsystem's class builds its nodes with, and
  dropped the ctlv class
---
 include/linux/ctlv_device.h |  57 ++++++++++++
 lib/ctlv/Makefile           |   2 +-
 lib/ctlv/core.c             |  17 ++++
 lib/ctlv/device.c           | 179 ++++++++++++++++++++++++++++++++++++
 lib/ctlv/internal.h         |   2 +
 5 files changed, 256 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/ctlv_device.h
 create mode 100644 lib/ctlv/device.c

diff --git a/include/linux/ctlv_device.h b/include/linux/ctlv_device.h
new file mode 100644
index 000000000000..9ff10ce7368f
--- /dev/null
+++ b/include/linux/ctlv_device.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES
+ *
+ * Character device nodes of CTLV instances, in a subsystem's own class.
+ */
+#ifndef _LINUX_CTLV_DEVICE_H
+#define _LINUX_CTLV_DEVICE_H
+
+#include <linux/cdev.h>
+#include <linux/device.h>
+#include <linux/idr.h>
+#include <linux/types.h>
+
+struct ctlv;
+struct module;
+
+/**
+ * struct ctlv_device_class - The class of a subsystem's nodes.
+ * @class: the class, whose dev_release frees a node's structure; CTLV sets
+ *	its dev_uevent
+ * @max_devices: how many nodes the class may have at once
+ */
+struct ctlv_device_class {
+	struct class class;
+	unsigned int max_devices;
+	/* private: */
+	struct module *owner;
+	dev_t devt;
+	struct ida ids;
+};
+
+/**
+ * struct ctlv_device - The node of one instance.
+ * @dev: the node's device, named for its class and a number of its own
+ *
+ * Embedded beside the instance in the subsystem's device structure.
+ */
+struct ctlv_device {
+	struct device dev;
+	/* private: */
+	struct cdev cdev;
+	struct ctlv *ctlv;
+	struct ctlv_device_class *cls;
+};
+
+int __ctlv_device_class_register(struct ctlv_device_class *cls, struct module *owner);
+#define ctlv_device_class_register(cls) __ctlv_device_class_register(cls, THIS_MODULE)
+void ctlv_device_class_unregister(struct ctlv_device_class *cls);
+
+int ctlv_device_init(struct ctlv_device *ctlvdev, struct ctlv_device_class *cls,
+		     struct device *parent, struct ctlv *ctlv);
+void ctlv_device_fini(struct ctlv_device *ctlvdev);
+int ctlv_device_add(struct ctlv_device *ctlvdev);
+void ctlv_device_del(struct ctlv_device *ctlvdev);
+
+#endif /* _LINUX_CTLV_DEVICE_H */
diff --git a/lib/ctlv/Makefile b/lib/ctlv/Makefile
index 73acdbdf387d..e783ad450c12 100644
--- a/lib/ctlv/Makefile
+++ b/lib/ctlv/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_CTLV) += ctlv.o
 
-ctlv-y += blob.o blob_desc.o builder.o core.o introspection.o \
+ctlv-y += blob.o blob_desc.o builder.o core.o device.o introspection.o \
 	  message.o schema.o ctlv_gen.o
diff --git a/lib/ctlv/core.c b/lib/ctlv/core.c
index 605f191de77b..eb493104da62 100644
--- a/lib/ctlv/core.c
+++ b/lib/ctlv/core.c
@@ -1034,6 +1034,23 @@ static int ctlv_uevent_check(const struct ctlv_family *family)
 	return ret;
 }
 
+/**
+ * ctlv_uevent - Add the family variables to a device uevent.
+ * @ctlv: instance
+ * @env: uevent environment
+ *
+ * Return: 0, or a negative error.
+ */
+int ctlv_uevent(const struct ctlv *ctlv, struct kobj_uevent_env *env)
+{
+	/* Read unlocked: a uevent may be asked for under the registration lock. */
+	const struct ctlv_family *family = READ_ONCE(ctlv->family);
+
+	if (!family)
+		return 0;
+	return ctlv_uevent_families(env, family);
+}
+
 /**
  * ctlv_init - Prepare an embedded instance for one family.
  * @ctlv: zeroed instance
diff --git a/lib/ctlv/device.c b/lib/ctlv/device.c
new file mode 100644
index 000000000000..b761739e5442
--- /dev/null
+++ b/lib/ctlv/device.c
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES
+ *
+ * Character device nodes of CTLV instances.
+ */
+#include <linux/bug.h>
+#include <linux/cdev.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/ctlv.h>
+#include <linux/ctlv_device.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/fs.h>
+#include <linux/idr.h>
+#include <linux/kdev_t.h>
+#include <linux/module.h>
+#include <linux/rwsem.h>
+
+#include "internal.h"
+
+static int ctlv_device_open(struct inode *inode, struct file *filp)
+{
+	struct ctlv_device *ctlvdev = container_of(inode->i_cdev, struct ctlv_device, cdev);
+	struct ctlv_file *cfile;
+
+	cfile = ctlv_file_open(ctlvdev->ctlv, filp);
+	if (IS_ERR(cfile))
+		return PTR_ERR(cfile);
+	filp->private_data = cfile;
+	return 0;
+}
+
+static int ctlv_device_release(struct inode *inode, struct file *filp)
+{
+	ctlv_file_close(filp->private_data);
+	return 0;
+}
+
+static long ctlv_device_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	return ctlv_file_ioctl(filp->private_data, cmd, arg);
+}
+
+static const struct file_operations ctlv_device_operations = {
+	.owner = THIS_MODULE,
+	.open = ctlv_device_open,
+	.release = ctlv_device_release,
+	.unlocked_ioctl = ctlv_device_ioctl,
+	/* Every ioctl field is fixed width, so one entry point serves both. */
+	.compat_ioctl = compat_ptr_ioctl,
+};
+
+static int ctlv_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
+{
+	const struct ctlv_device *ctlvdev = container_of_const(dev, struct ctlv_device, dev);
+
+	return ctlv_uevent(ctlvdev->ctlv, env);
+}
+
+/**
+ * __ctlv_device_class_register - Register a class of nodes.
+ * @cls: class, its name, dev_release and max_devices set
+ * @owner: module of the dev_release, held while a node is open
+ *
+ * Called as ctlv_device_class_register(), which passes the calling module.
+ *
+ * Return: 0, or a negative error.
+ */
+int __ctlv_device_class_register(struct ctlv_device_class *cls, struct module *owner)
+{
+	int ret;
+
+	if (WARN_ON(!cls->max_devices))
+		return -EINVAL;
+	ret = alloc_chrdev_region(&cls->devt, 0, cls->max_devices, cls->class.name);
+	if (ret)
+		return ret;
+	cls->owner = owner;
+	cls->class.dev_uevent = ctlv_device_uevent;
+	ida_init(&cls->ids);
+	ret = class_register(&cls->class);
+	if (ret)
+		unregister_chrdev_region(cls->devt, cls->max_devices);
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(__ctlv_device_class_register, "CTLV");
+
+/**
+ * ctlv_device_class_unregister - Unregister a class of nodes.
+ * @cls: class whose nodes are all released
+ */
+void ctlv_device_class_unregister(struct ctlv_device_class *cls)
+{
+	class_unregister(&cls->class);
+	unregister_chrdev_region(cls->devt, cls->max_devices);
+	ida_destroy(&cls->ids);
+}
+EXPORT_SYMBOL_NS_GPL(ctlv_device_class_unregister, "CTLV");
+
+/**
+ * ctlv_device_init - Prepare the node of an instance.
+ * @ctlvdev: zeroed node, in the structure the class's dev_release frees
+ * @cls: registered class
+ * @parent: parent device, or NULL
+ * @ctlv: instance, for ctlv_init() with the node's device
+ *
+ * From here on, put_device() unwinds, whether or not this succeeds.
+ *
+ * Return: 0, or a negative error.
+ */
+int ctlv_device_init(struct ctlv_device *ctlvdev, struct ctlv_device_class *cls,
+		     struct device *parent, struct ctlv *ctlv)
+{
+	int devnum;
+
+	device_initialize(&ctlvdev->dev);
+	ctlvdev->dev.class = &cls->class;
+	ctlvdev->dev.parent = parent;
+	ctlvdev->ctlv = ctlv;
+	cdev_init(&ctlvdev->cdev, &ctlv_device_operations);
+	ctlvdev->cdev.owner = cls->owner;
+
+	devnum = ida_alloc_max(&cls->ids, cls->max_devices - 1, GFP_KERNEL);
+	if (devnum < 0)
+		return devnum;
+	ctlvdev->cls = cls;
+	ctlvdev->dev.devt = MKDEV(MAJOR(cls->devt), devnum);
+	return dev_set_name(&ctlvdev->dev, "%s%d", cls->class.name, devnum);
+}
+EXPORT_SYMBOL_NS_GPL(ctlv_device_init, "CTLV");
+
+/**
+ * ctlv_device_fini - Free the node's number.
+ * @ctlvdev: node
+ *
+ * For the class's dev_release, before it frees the node.
+ */
+void ctlv_device_fini(struct ctlv_device *ctlvdev)
+{
+	if (ctlvdev->cls)
+		ida_free(&ctlvdev->cls->ids, MINOR(ctlvdev->dev.devt));
+}
+EXPORT_SYMBOL_NS_GPL(ctlv_device_fini, "CTLV");
+
+/**
+ * ctlv_device_add - Add the node.
+ * @ctlvdev: node, whose instance was initialized with its device and published
+ *
+ * The node may be opened as soon as it appears, so its instance is published
+ * before and unpublished after ctlv_device_del().
+ *
+ * Return: 0, or a negative error.
+ */
+int ctlv_device_add(struct ctlv_device *ctlvdev)
+{
+	struct ctlv *ctlv = ctlvdev->ctlv;
+	bool published;
+
+	scoped_guard(rwsem_read, &ctlv->registration_lock)
+		published = ctlv->registered;
+	if (WARN_ON(ctlv->dev != &ctlvdev->dev || !published))
+		return -EINVAL;
+	return cdev_device_add(&ctlvdev->cdev, &ctlvdev->dev);
+}
+EXPORT_SYMBOL_NS_GPL(ctlv_device_add, "CTLV");
+
+/**
+ * ctlv_device_del - Remove the node.
+ * @ctlvdev: added node
+ *
+ * A file still open keeps the node's device until it is closed.
+ */
+void ctlv_device_del(struct ctlv_device *ctlvdev)
+{
+	cdev_device_del(&ctlvdev->cdev, &ctlvdev->dev);
+}
+EXPORT_SYMBOL_NS_GPL(ctlv_device_del, "CTLV");
diff --git a/lib/ctlv/internal.h b/lib/ctlv/internal.h
index 2e1e36799a17..8fb5f0abdc47 100644
--- a/lib/ctlv/internal.h
+++ b/lib/ctlv/internal.h
@@ -23,6 +23,7 @@
 #define CTLV_ASSERT(cond) BUILD_BUG_ON_INVALID(cond)
 #endif
 
+struct kobj_uevent_env;
 struct task_struct;
 
 #define CTLV_ERROR_MESSAGE_LEN 256
@@ -81,5 +82,6 @@ struct ctlv_op_ctx {
 };
 
 struct ctlv_op_entry *ctlv_op_find(struct ctlv *ctlv, u64 op_id);
+int ctlv_uevent(const struct ctlv *ctlv, struct kobj_uevent_env *env);
 
 #endif /* _CTLV_INTERNAL_H */
-- 
2.56.0

