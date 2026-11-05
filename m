Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887546;
	b=LovstD4GVrNhTazA+GbvX/tua+gqbDK0H+6V1N4X+4kRAyO010rO/axm9CZO4OSnasTV
	 4tVyBq58RdqaFlGhf2ggxd9OJLXmcArFKCq/GTGUVSro5FScFXD3SCxmDG5ZuTjDR3zw/
	 youImA0kL7odbc8I45JQql6Nz9ma5DjnNZQ++ceotb/UAT1iY4qPvrGvquuuEBcUFWHe/
	 wkwZfFyHiR/VJmCee5dKhuL8nGazOpXihZvYJj7XqfoCPxNZ3fOzQJA1iiaFpxpjCTWDC
	 c9c4unAI/kotfnfeHn9dC7QcGgrpr4S3ZaAnr30f/0Qo9nL7DeBt5dyE2XXNRIU/HBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EgDmwowbMyQC1eDfYYfisgkWF1YiN0LWR4L23OptHgY=;
	b=3o6nUbY2m5/umQ/nIybZlkd6Tj4zgTvV5GZ9TmxGaUr9x7wE/objg1jnpphu2QgAUjag
	 UUoUo1YHjuuz8kBnTkUvIuMgvdTd8TfZleV7iJ4masz2CiHBaKLY+q2U+/3Q3WDr0Y/9j
	 4cJNl8VZYesORSX0T1oaqFlV9GrenZPQ7scdLVlnO8Iy1xHAXXRWP6VY+pVAdcR5jS5iV
	 fPyh0xgbja71wb/zP8d0csGP/PJ2wY9qjt3AAgTH58NOLn37GeYNI05PUj+ULBktAnNSa
	 R4BbziRLdD1xyk4BY1Ype+II5CyLIruvvIyjRyuJ2+/uWHyIA9ccxqc2a4Qz+wUHsAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XYx7bcj6;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B54E606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B54E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XYx7bcj6
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4922523d1afso165878f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887544; x=1794492344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgDmwowbMyQC1eDfYYfisgkWF1YiN0LWR4L23OptHgY=;
        b=XYx7bcj6fo6wNFUMf9OEwKhjK2CP3kbCMiVX1hkUI4JID83LY7nZF2VsVQUY/dmqQz
         RTecTv+mW1/IKKDypKMrvhcFJp8RDzVBhBMyWUqFnmqoEqMZmu9bOLp+Pjs1+ZglRdVx
         qLdzlF7DHGMWGcjO4K2/Py+dYzuKbdULlCjLVX3+KilpzHpDczhghtXS3t3RV1WFuCaa
         +Hn7D+f168jO2cKajntMoKXCjqHFvYu4PbQYHWKfpJ351DH1J/yae6HsY2WM6GuJ645t
         4+7anhaH4HGS5OXiEm4MNd/50W/yuPnjAw4UmKsfgLsZ0C6ZI90lkBY3nx9M7hINcsSj
         76RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887544; x=1794492344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EgDmwowbMyQC1eDfYYfisgkWF1YiN0LWR4L23OptHgY=;
        b=DqNCM0EjDw3/IxpqZq3Zru7zXH+Vf1RXryabfJnSrE+DS5AnRaBUgNJn/xKftAiqvt
         YPtwVi59zHN0vbZ0+ySrW21GBWKFLu2J1d9Z9XYYrM/UbCqTzgduD9Gzq2vgcp1emQMj
         RiTNzUiapas6gkVB73gVakUWkhkkqk/JUsqU6T71mNqeV7xeNdzCH8/Y1jN8G7zq1Fqp
         Dd1aTms1rV8Hu9trIJlrtDHBjQ1+YBT59wZC6eo86Vae7V5mlGwwZhv5T6Rbwc6lGnw7
         ZOjk/N3GJaTRyvM5Z0O2QyFDxHAWrBYmD19d2Pr7AnKBO8aqDDnVVZtT0jj/ZmN8KCFu
         SPXg==
X-Forwarded-Encrypted: i=1; AKwUvBxP48wFyVGNJKCxM7m76VsVO0G39Ovx9QZKY/XGQaGLa6GNwdfpS+W/8gcrm+wyynhJzktROrsotFiW9nc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l0AvHufTBYCh7s/uBXZ7PiJcRec+vlp7MK4gAbjvB/Ne6ZT6Q
	8yMs0l3HGDzdVW0+QmNtbvUYxu9xLnk5yrP4t5giW1fzZwfQuFnAAwib
X-Gm-Gg: AYBFou2HnSkTn0ySOAyCt9D2PuhR2cOjEjPYpQWTcYuvE138gwTthXllukqcsMIUWT4
	Xxn35CdTDPiivu1iaKm7V8j1uePJ+OpscFEUhUHsEgeGRqgcuBVJQSupBa2ch2Jd8ArUcM9gwkn
	RVRKQCPmaLs04H8BD5c9F8jlMkgTv6v6R+dncSwVDNi0buQlFsu9FQq2kua9KCZcHoIHI/abyGI
	zEVgQIs3dPwsEL0+XlIYM9+B+MmclO2kwPN2CFVPHqT6fFtXuJpZbV1FFZhH+TOdAQ29X8w7zi2
	/B8oDO+1C1h2k4pBloBuqnZubcHDUMu+8DosD2GGVjQJpKiuw2UCGlXvxJLaKBTbS2h2AalhABV
	CsEgzHBkVCAn+wxsRX2NiqcExDn4cplFy3Jc1/5I8B8EQv3D8dz+Y8TpDZtJ/SmLfWJxXsC1XnF
	brHsdmTiPcm9M+yoMsB8oLs2zttYQdCGv+wiT5D0BVYu4svb+6vFaZosJDhVOAdX8LN4GcfLglW
	rRvQBvisBa+/WNjFDXMGGxDSDkS3jbFE83CoV09aopepd+B6P3QahK9cgPzM5vd55tukR/yXFFT
	Lqp8/WOKiKGO14yTST9zcesBuxfBgY2vdXnxVar96yhTtg3/WExFYFp8G6+4JGkUM32pV5Y=
X-Received: by 2002:a05:6000:1887:b0:48e:d36:77 with SMTP id ffacd0b85a97d-48e6e2bc062mr48347421f8f.4.1793887543748;
        Thu, 05 Nov 2026 06:05:43 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11454111f8f.45.2026.11.05.06.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:05:41 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 01/10] drm: Add MIPI DBI bus support for MIPI DBI Type A and B
Date: Thu,  5 Nov 2026 16:05:01 +0200
Message-ID: <20261105140510.165165-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105140510.165165-1-clamor95@gmail.com>
References: <20261105140510.165165-1-clamor95@gmail.com>
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

The MIPI DBI bus allows modeling DBI hosts and peripherals using the Linux
driver model. DBI hosts are registered by their respective drivers. During
registration, DBI peripherals are created from the device tree nodes
provided by the host.

DBI hosts expose operations that can be used by peripheral drivers to
access associated devices.

This implementation adds support for MIPI DBI Type A and Type B only.
Type C support existing in drm_mipi_dbi.c was not altered. The framework
is modeled to closely resemble the existing MIPI DSI setup for seamless
integration.

Suggested-by: Mikko Perttunen <mperttunen@nvidia.com> # preliminary sketch
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/Makefile           |   2 +-
 drivers/gpu/drm/drm_mipi_dbi_bus.c | 256 +++++++++++++++++++++++++++++
 include/drm/drm_mipi_dbi_bus.h     | 103 ++++++++++++
 3 files changed, 360 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_mipi_dbi_bus.c
 create mode 100644 include/drm/drm_mipi_dbi_bus.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2c6bc093a923a..880f0dc930b85 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -166,7 +166,7 @@ obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 
 obj-y			+= tests/
 
-obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
+obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o drm_mipi_dbi_bus.o
 obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
 obj-y			+= arm/
 obj-y			+= clients/
diff --git a/drivers/gpu/drm/drm_mipi_dbi_bus.c b/drivers/gpu/drm/drm_mipi_dbi_bus.c
new file mode 100644
index 0000000000000..11792c0e389f7
--- /dev/null
+++ b/drivers/gpu/drm/drm_mipi_dbi_bus.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * MIPI DBI devices with command transport through parallel interface
+ *
+ * Copyright 2026 Mikko Perttunen <mperttunen@nvidia.com>
+ * Copyright 2026 Svyatoslav Ryhel <clamor95@gmail.com>
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_mipi_dbi_bus.h>
+
+/**
+ * DOC: overview
+ *
+ * There are three MIPI DBI implementation types:
+ *
+ * A. Motorola 6800-type parallel bus
+ *
+ * B. Intel 8080-type parallel bus
+ *
+ * C. SPI-type with three options:
+ *
+ *    1. 9-bit with the Data/Command signal as the ninth bit
+ *    2. Same as above, except it is sent as 16 bits
+ *    3. 8-bit with the Data/Command signal as a separate D/CX pin
+ *
+ * This library provides a framework for MIPI Display Bus Interface (DBI)
+ * compatible display controllers using Type A and Type B. This
+ * implementation closely matches existing DSI framework behavior to
+ * allow seamless integration.
+ *
+ * Type C options 1 and 3 are covered by drm_mipi_dbi.c with
+ * mipi_dbi_spi_init().
+ */
+
+static int mipi_dbi_match(struct device *dev, const struct device_driver *driver)
+{
+	return of_driver_match_device(dev, driver);
+}
+
+static int mipi_dbi_uevent(const struct device *dev, struct kobj_uevent_env *env)
+{
+	return of_device_uevent_modalias(dev, env);
+}
+
+static const struct dev_pm_ops mipi_dbi_device_pm_ops = {
+	.runtime_suspend = pm_generic_runtime_suspend,
+	.runtime_resume = pm_generic_runtime_resume,
+	.suspend = pm_generic_suspend,
+	.resume = pm_generic_resume,
+	.freeze = pm_generic_freeze,
+	.thaw = pm_generic_thaw,
+	.poweroff = pm_generic_poweroff,
+	.restore = pm_generic_restore,
+};
+
+static const struct bus_type mipi_dbi_bus_type = {
+	.name = "mipi-dbi",
+	.match = mipi_dbi_match,
+	.uevent = mipi_dbi_uevent,
+	.pm = &mipi_dbi_device_pm_ops,
+};
+
+static void mipi_dbi_device_release(struct device *dev)
+{
+	of_node_put(dev->of_node);
+	kfree(to_mipi_dbi_device(dev));
+}
+
+static void mipi_dbi_device_unregister(void *data)
+{
+	struct device *dev = data;
+
+	of_node_clear_flag(dev->of_node, OF_POPULATED);
+	device_unregister(dev);
+}
+
+/**
+ * devm_mipi_dbi_device_register() - create a managed MIPI DBI device
+ * @dev: device to tie the MIPI-DBI device lifetime to
+ * @host: DBI host to which this device is connected
+ * @np: device tree node associated with the panel MIPI DBI device
+ *
+ * This function is called by DBI host driver to create panel device.
+ * It automatically calls mipi_dbi_device_unregister() when @dev is
+ * unbound. It does not automatically free passed device node pointer,
+ * it must be put manually.
+ *
+ * Returns:
+ * A pointer to the newly created MIPI DBI device, or, a pointer encoded
+ * with an error.
+ */
+struct mipi_dbi_device *
+devm_mipi_dbi_device_register(struct device *dev, struct mipi_dbi_host *host,
+			      struct device_node *np)
+{
+	struct mipi_dbi_device *dbidev;
+	int ret;
+
+	if (!host || !host->dev || !host->dbi || !host->dbi->command ||
+	    !host->ops || !host->ops->attach || !host->ops->detach || !np)
+		return ERR_PTR(-EINVAL);
+
+	if (!of_device_is_available(np))
+		return ERR_PTR(-ENODEV);
+
+	dbidev = kzalloc_obj(*dbidev);
+	if (!dbidev)
+		return ERR_PTR(-ENOMEM);
+
+	if (of_node_test_and_set_flag(np, OF_POPULATED)) {
+		kfree(dbidev);
+		return ERR_PTR(-EBUSY);
+	}
+
+	dbidev->host = host;
+	dbidev->dbi = host->dbi;
+	device_initialize(&dbidev->dev);
+	dbidev->dev.parent = host->dev;
+	dbidev->dev.bus = &mipi_dbi_bus_type;
+	dbidev->dev.release = mipi_dbi_device_release;
+	device_set_node(&dbidev->dev, of_fwnode_handle(of_node_get(np)));
+
+	ret = dev_set_name(&dbidev->dev, "%s:%s", dev_name(host->dev), np->full_name);
+	if (ret)
+		goto put_device;
+
+	ret = device_add(&dbidev->dev);
+	if (ret)
+		goto put_device;
+
+	ret = devm_add_action_or_reset(dev, mipi_dbi_device_unregister,
+				       &dbidev->dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return dbidev;
+
+put_device:
+	of_node_clear_flag(np, OF_POPULATED);
+	put_device(&dbidev->dev);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(devm_mipi_dbi_device_register);
+
+static void mipi_dbi_detach(void *data)
+{
+	struct mipi_dbi_device *dbidev = data;
+
+	dbidev->host->ops->detach(dbidev->host, dbidev);
+	dbidev->attached = false;
+}
+
+/**
+ * devm_mipi_dbi_attach() - managed attach of DBI device to its DBI host
+ * @dev: device to tie the MIPI-DBI device lifetime to
+ * @dbidev: DBI peripheral
+ */
+int devm_mipi_dbi_attach(struct device *dev, struct mipi_dbi_device *dbidev)
+{
+	int ret;
+
+	if (dbidev->attached)
+		return -EBUSY;
+
+	ret = dbidev->host->ops->attach(dbidev->host, dbidev);
+	if (ret)
+		return ret;
+
+	dbidev->attached = true;
+	return devm_add_action_or_reset(dev, mipi_dbi_detach, dbidev);
+}
+EXPORT_SYMBOL_GPL(devm_mipi_dbi_attach);
+
+static int mipi_dbi_drv_probe(struct device *dev)
+{
+	struct mipi_dbi_driver *drv = to_mipi_dbi_driver(dev->driver);
+	struct mipi_dbi_device *dbidev = to_mipi_dbi_device(dev);
+
+	return drv->probe(dbidev);
+}
+
+static int mipi_dbi_drv_remove(struct device *dev)
+{
+	struct mipi_dbi_driver *drv = to_mipi_dbi_driver(dev->driver);
+	struct mipi_dbi_device *dbidev = to_mipi_dbi_device(dev);
+
+	drv->remove(dbidev);
+
+	return 0;
+}
+
+static void mipi_dbi_drv_shutdown(struct device *dev)
+{
+	struct mipi_dbi_driver *drv = to_mipi_dbi_driver(dev->driver);
+	struct mipi_dbi_device *dbidev = to_mipi_dbi_device(dev);
+
+	drv->shutdown(dbidev);
+}
+
+/**
+ * __mipi_dbi_driver_register() - register a driver for DBI devices
+ * @drv: DBI driver structure
+ * @owner: owner module
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int __mipi_dbi_driver_register(struct mipi_dbi_driver *drv, struct module *owner)
+{
+	drv->driver.bus = &mipi_dbi_bus_type;
+	drv->driver.owner = owner;
+
+	if (drv->probe)
+		drv->driver.probe = mipi_dbi_drv_probe;
+	if (drv->remove)
+		drv->driver.remove = mipi_dbi_drv_remove;
+	if (drv->shutdown)
+		drv->driver.shutdown = mipi_dbi_drv_shutdown;
+
+	return driver_register(&drv->driver);
+}
+EXPORT_SYMBOL_GPL(__mipi_dbi_driver_register);
+
+/**
+ * mipi_dbi_driver_unregister() - unregister a driver for DBI devices
+ * @drv: DBI driver structure
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+void mipi_dbi_driver_unregister(struct mipi_dbi_driver *drv)
+{
+	driver_unregister(&drv->driver);
+}
+EXPORT_SYMBOL_GPL(mipi_dbi_driver_unregister);
+
+static int __init mipi_dbi_bus_init(void)
+{
+	return bus_register(&mipi_dbi_bus_type);
+}
+subsys_initcall(mipi_dbi_bus_init);
+
+static void __exit mipi_dbi_bus_exit(void)
+{
+	bus_unregister(&mipi_dbi_bus_type);
+}
+module_exit(mipi_dbi_bus_exit);
+
+MODULE_DESCRIPTION("MIPI DBI devices with command transport through parallel interface");
+MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_mipi_dbi_bus.h b/include/drm/drm_mipi_dbi_bus.h
new file mode 100644
index 0000000000000..2b8b59bffd0b8
--- /dev/null
+++ b/include/drm/drm_mipi_dbi_bus.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * MIPI DBI devices with command transport through parallel interface
+ *
+ * Copyright 2026 Mikko Perttunen <mperttunen@nvidia.com>
+ * Copyright 2026 Svyatoslav Ryhel <clamor95@gmail.com>
+ */
+
+#ifndef __DRM_MIPI_DBI_BUS_H__
+#define __DRM_MIPI_DBI_BUS_H__
+
+#include <linux/device.h>
+#include <linux/module.h>
+
+struct device_node;
+struct mipi_dbi;
+struct mipi_dbi_device;
+struct mipi_dbi_host;
+
+/**
+ * struct mipi_dbi_host_ops - DBI bus operations
+ * @attach: attach DBI device to DBI host
+ * @detach: detach DBI device from DBI host
+ */
+struct mipi_dbi_host_ops {
+	int (*attach)(struct mipi_dbi_host *host, struct mipi_dbi_device *dev);
+	void (*detach)(struct mipi_dbi_host *host, struct mipi_dbi_device *dev);
+};
+
+/**
+ * struct mipi_dbi_host - DBI host device
+ * @dev: driver model device node for this DBI host
+ * @dbi: MIPI DBI interface
+ * @ops: DBI host operations
+ */
+struct mipi_dbi_host {
+	struct device *dev;
+	struct mipi_dbi *dbi;
+	const struct mipi_dbi_host_ops *ops;
+};
+
+/**
+ * struct mipi_dbi_device - DBI peripheral device
+ * @dev: driver model device node for this peripheral
+ * @dbi: MIPI DBI interface
+ * @host: DBI host for this peripheral
+ * @attached: the DBI device has been successfully attached
+ */
+struct mipi_dbi_device {
+	struct device dev;
+	struct mipi_dbi *dbi;
+	struct mipi_dbi_host *host;
+	bool attached;
+};
+
+#define to_mipi_dbi_device(__dev)	container_of_const(__dev, struct mipi_dbi_device, dev)
+
+struct mipi_dbi_device *
+devm_mipi_dbi_device_register(struct device *dev, struct mipi_dbi_host *host,
+			      struct device_node *np);
+int devm_mipi_dbi_attach(struct device *dev, struct mipi_dbi_device *dbidev);
+
+/**
+ * struct mipi_dbi_driver - DBI driver
+ * @driver: device driver model driver
+ * @probe: callback for device binding
+ * @remove: callback for device unbinding
+ * @shutdown: called at shutdown time to quiesce the device
+ */
+struct mipi_dbi_driver {
+	struct device_driver driver;
+	int (*probe)(struct mipi_dbi_device *dbi);
+	void (*remove)(struct mipi_dbi_device *dbi);
+	void (*shutdown)(struct mipi_dbi_device *dbi);
+};
+
+static inline struct mipi_dbi_driver *
+to_mipi_dbi_driver(struct device_driver *driver)
+{
+	return container_of(driver, struct mipi_dbi_driver, driver);
+}
+
+static inline void *mipi_dbi_get_drvdata(const struct mipi_dbi_device *dbi)
+{
+	return dev_get_drvdata(&dbi->dev);
+}
+
+static inline void mipi_dbi_set_drvdata(struct mipi_dbi_device *dbi, void *data)
+{
+	dev_set_drvdata(&dbi->dev, data);
+}
+
+int __mipi_dbi_driver_register(struct mipi_dbi_driver *drv, struct module *owner);
+void mipi_dbi_driver_unregister(struct mipi_dbi_driver *drv);
+
+#define mipi_dbi_driver_register(driver) \
+	__mipi_dbi_driver_register(driver, THIS_MODULE)
+
+#define module_mipi_dbi_driver(__mipi_dbi_driver) \
+	module_driver(__mipi_dbi_driver, mipi_dbi_driver_register, \
+			mipi_dbi_driver_unregister)
+
+#endif /* __DRM_MIPI_DBI_BUS__ */
-- 
2.53.0

