Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D7242CB14
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750610; cv=none; b=Xfv9vU2sZZIiHrPLVvZ/4KsihoNFekMOAjKA6h3O+oYEvc98bh9bp+AGvCIV7HwIukgCNnEJpGz9e3KIa7VV8ac7tHFMbDrJeO2yYR5UKrC9Vsv/v2xfx7PP7P00GR3UaJ116+isRSpgOQq6NvwAjP3yg45EuJtEY3ukKAMYfx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750610; c=relaxed/simple;
	bh=XRXlwQynmoDkSnN+1aeMbXNgIHZRxzQz4EGF3JDpdMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3NIwf2DUZ74OGliOMCgabG0Wsdd4g+aPbun54uDiTtZKKPyIHdSAgSnyN/LhbixIGNjJ3rtFQhfTuaXC2nGil0J8jlGBUCGaXYff0nsj2OxL25Wm4qwB7AgRWFbj44aiNUGO46fV6EgWZ3znqf6l24SJKhW8U9QkkDRAAx7j2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jp9GYdb0; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jp9GYdb0"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so1188584a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750600; x=1788355400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKB/xr2aOCbOg329ehvyXjbYABzeMuLJuajYHAFNU6k=;
        b=Jp9GYdb08aUSX5x7TKPUDAwhR6Yd/eB6eBPK84TVefqLGFH4VgR1a+2+x7nW1EvkE3
         zXYXlzbbpbI6jC/3gzBnXJ/vWwzHe60NunDeZgRxDQfWnjNgHgQ/TZHRF7C3COfaWCrL
         KQOQw1pDfQXMp14nnt3WZttBbCtXYCuOjH7OYGJluewyg8qv097yrWEu1vRrIMzD7OT0
         WQ1+3rjUuTQtPWhnEr7Gx881nbejKn7FiUjTjHW3XKOzONlFFG07hCowKmmEOXibIqWp
         ydSQKxhPq/lSzCgN6FQGWSs9GUwPdMg2EP8dzx6hxcSFaDQ7Qx2yEe70yXLCZa4wlbLT
         hBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750600; x=1788355400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKB/xr2aOCbOg329ehvyXjbYABzeMuLJuajYHAFNU6k=;
        b=l9PirvZx1lSrnGT8KQUNrTJSdvujjYCvvtdWzZIr+xepS7tT/3k5XAx7Xk3HP1XBCg
         odHovehrwoRaOrYcVPi2MTk98pXmUb8tIlbGLyjtdh3s8jEGCwmdLagVRni3gnudYjEP
         MSkFasIavvHnJ5BIayzSMK++qNR1+tVCHIU3rRpwVAnPPk7vFUR5jMzJQKKnx80zHrg8
         ip4V2mC6RE4ylOBwo4gns+TxMAHOSmtGN89S1Xw5urXOWjgSiCN4LE4DW0Jl8KTQQKg+
         PcoV2dctlbjGDkmgrYo7gbBn/FX7JAY8WuOpvJ0En7gkYU+5X1/tCab/7EGBFcSaseBP
         clkw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2dytfu/AqrJkf2gQcx3zKmwFvlx/zNZmqCw7Ncn0mkJiG6hMupKn3FGeVcIMUeLMW8IlBfgv8tzKgWu0=@vger.kernel.org
X-Gm-Message-State: AFuF++mi9Q2T+b27ENLqxEGT0EQnIK/zqK8WFlCva4IUAas/e1ZtwEKm
	05YJCMSAOSIR03+pB++6Xmoyuk7/i04BbuswJTkFiwnTkRWDxIIxx1p1
X-Gm-Gg: AR+sD13/T1elItRfcg3Re3o3AVvpcOp1+vWzOcbPYDiZ/vedKyptbeyryuLkDeELVOr
	PtgMHiixTASIGsdfkQ14RNCw9ctjP19Vtkn4bFggMjdCTl5QSC89oLJMDYnKrFWx+cveF+ZOJFp
	xsXdgtivFvgGyZcVSxUFbx+P+s6h30oeM2sSGvjIOb1XbWkfVU5usOM9TA1xR5NqLJo0RbOPmyp
	QQ21Hm110Z/H7xFgr4ReqCur+qadvmzKI3IRJteOluTG+FXobYup6EWnxfaStXT59BqZxq9ECJ6
	ODIqk1yc7WMYZ4pai6dQ5hb8M08887+69YMzcAQq1dvQLE3qRTqps+/UFeHRPLqyReYbEASVTdx
	VjG1WWMkHNuyG2S+n9josER3rWuWBoMqZgmcBNWqZnrhn7y+inKv9YstypqRdOhxMDZu7+oA/Gv
	LDGSajjx0oxHdg4eiO+XrnqOtWmW0TRB+95zyRYJATyHMpya1GQyaDAaLklbRFo3U+1of/UYwaV
	r7eRyMyJsZNelGUOIo5rfF6DUxicc6+9v8EgwBPNtY=
X-Received: by 2002:a05:6402:3245:b0:698:c13e:179a with SMTP id 4fb4d7f45d1cf-6a5df653615mr8508421a12.10.1787750600453;
        Wed, 26 Aug 2026 06:23:20 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a30sm3633147a12.15.2026.08.26.06.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:19 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 8/8] media: i2c: Add WV517S lens actuator driver
Date: Wed, 26 Aug 2026 15:22:56 +0200
Message-ID: <20260826132256.3343451-9-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91 rear camera contains a WV517S
voice-coil actuator. Add a V4L2 lens subdevice exposing the standard
10-bit FOCUS_ABSOLUTE control and the device ringing-control mode.

Tie register access to runtime PM so the IPU bridge sensor link keeps
shared power resources active. Propagate PM acquisition failures and
restore the drive mode and requested focus position after resume.

The register addresses and drive-mode value are derived from Intel's
GPL-2.0 WV517 driver. Retain its copyright notice.

Link: https://github.com/jekhor/yogabook-linux-android-kernel/blob/574bae692716f1b14093497bfab8a007fe8e460b/drivers/external_drivers/camera/drivers/media/i2c/wv517.c

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 MAINTAINERS                |   1 +
 drivers/media/i2c/Kconfig  |   8 ++
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/wv517s.c | 199 +++++++++++++++++++++++++++++++++++++
 4 files changed, 209 insertions(+)
 create mode 100644 drivers/media/i2c/wv517s.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3785b8c1de0a..205a42646a7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28268,6 +28268,7 @@ S:	Maintained
 F:	drivers/media/i2c/ak*
 F:	drivers/media/i2c/dw*
 F:	drivers/media/i2c/lm*
+F:	drivers/media/i2c/wv517s.c
 
 V4L2 CAMERA SENSOR DRIVERS
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5c52007f9cbe..c488452c1b38 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -949,6 +949,14 @@ config VIDEO_DW9807_VCM
 	  capability. This is designed for linear control of
 	  voice coil motors, controlled via I2C serial interface.
 
+config VIDEO_WV517S
+	tristate "WV517S lens voice coil support"
+	help
+	  This is a driver for the WV517S camera lens voice coil. It supports
+	  the 10-bit focus control used by the Lenovo Yoga Book rear camera.
+	  The driver exposes the actuator through the standard V4L2 lens
+	  sub-device interface.
+
 endif
 
 menu "Flash devices"
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index d04bd5724552..e480932a9540 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -173,4 +173,5 @@ obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
 obj-$(CONFIG_VIDEO_VPX3220) += vpx3220.o
 obj-$(CONFIG_VIDEO_WM8739) += wm8739.o
 obj-$(CONFIG_VIDEO_WM8775) += wm8775.o
+obj-$(CONFIG_VIDEO_WV517S) += wv517s.o
 obj-$(CONFIG_VIDEO_INTEL_CVS) += cvs/
diff --git a/drivers/media/i2c/wv517s.c b/drivers/media/i2c/wv517s.c
new file mode 100644
index 000000000000..43d15aadea30
--- /dev/null
+++ b/drivers/media/i2c/wv517s.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * WV517S voice-coil motor driver
+ *
+ * Copyright (c) 2014 Intel Corporation.
+ *
+ * On the Lenovo Yoga Book the IPU bridge instantiates this actuator as a
+ * secondary I2C client of the rear camera.  The bridge holds the sensor's
+ * shared power resources on while probing the actuator and adds a runtime-PM
+ * device link for subsequent accesses.
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+
+#define WV517S_MAX_FOCUS_POSITION	1023
+#define WV517S_DEFAULT_FOCUS_POSITION	300
+
+#define WV517S_REG_FOCUS		0x41
+#define WV517S_REG_DRIVE_MODE		0x43
+#define WV517S_DRIVE_MODE_12_6_MS	0x0211
+
+struct wv517s_device {
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_subdev sd;
+	struct v4l2_ctrl *focus;
+};
+
+static inline struct wv517s_device *to_wv517s(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct wv517s_device, sd);
+}
+
+static int wv517s_write(struct i2c_client *client, u8 reg, u16 value)
+{
+	u8 buf[] = { reg, value >> 8, value };
+	int ret;
+
+	ret = i2c_master_send(client, buf, sizeof(buf));
+	if (ret < 0)
+		return ret;
+
+	return ret == sizeof(buf) ? 0 : -EIO;
+}
+
+static int wv517s_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct wv517s_device *wv517s = container_of(ctrl->handler,
+						      struct wv517s_device,
+						      ctrl_handler);
+	struct i2c_client *client = v4l2_get_subdevdata(&wv517s->sd);
+	int ret;
+
+	ret = pm_runtime_get_if_in_use(&client->dev);
+	if (ret <= 0)
+		return ret;
+
+	if (ctrl->id == V4L2_CID_FOCUS_ABSOLUTE)
+		ret = wv517s_write(client, WV517S_REG_FOCUS, ctrl->val);
+	else
+		ret = -EINVAL;
+
+	pm_runtime_put(&client->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops wv517s_ctrl_ops = {
+	.s_ctrl = wv517s_set_ctrl,
+};
+
+static int wv517s_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	return pm_runtime_resume_and_get(sd->dev);
+}
+
+static int wv517s_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	pm_runtime_put(sd->dev);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops wv517s_internal_ops = {
+	.open = wv517s_open,
+	.close = wv517s_close,
+};
+
+static const struct v4l2_subdev_ops wv517s_subdev_ops = { };
+
+static int wv517s_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct wv517s_device *wv517s = to_wv517s(sd);
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
+
+	/* Restore the vendor-recommended 12.6 ms ringing-control mode. */
+	ret = wv517s_write(client, WV517S_REG_DRIVE_MODE,
+			   WV517S_DRIVE_MODE_12_6_MS);
+	if (ret)
+		return ret;
+
+	return wv517s_write(client, WV517S_REG_FOCUS, wv517s->focus->val);
+}
+
+static int wv517s_probe(struct i2c_client *client)
+{
+	struct wv517s_device *wv517s;
+	int ret;
+
+	wv517s = devm_kzalloc(&client->dev, sizeof(*wv517s), GFP_KERNEL);
+	if (!wv517s)
+		return -ENOMEM;
+
+	v4l2_i2c_subdev_init(&wv517s->sd, client, &wv517s_subdev_ops);
+	wv517s->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	wv517s->sd.internal_ops = &wv517s_internal_ops;
+	wv517s->sd.entity.function = MEDIA_ENT_F_LENS;
+
+	v4l2_ctrl_handler_init(&wv517s->ctrl_handler, 1);
+	wv517s->focus = v4l2_ctrl_new_std(&wv517s->ctrl_handler,
+					  &wv517s_ctrl_ops,
+					  V4L2_CID_FOCUS_ABSOLUTE, 0,
+					  WV517S_MAX_FOCUS_POSITION, 1,
+					  WV517S_DEFAULT_FOCUS_POSITION);
+	if (wv517s->ctrl_handler.error) {
+		ret = wv517s->ctrl_handler.error;
+		goto err_free_ctrl_handler;
+	}
+	wv517s->sd.ctrl_handler = &wv517s->ctrl_handler;
+
+	ret = media_entity_pads_init(&wv517s->sd.entity, 0, NULL);
+	if (ret)
+		goto err_free_ctrl_handler;
+
+	ret = wv517s_resume(&client->dev);
+	if (ret)
+		goto err_cleanup_entity;
+
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_enable(&client->dev);
+
+	ret = v4l2_async_register_subdev(&wv517s->sd);
+	if (ret)
+		goto err_disable_pm;
+
+	pm_runtime_idle(&client->dev);
+
+	return 0;
+
+err_disable_pm:
+	pm_runtime_disable(&client->dev);
+err_cleanup_entity:
+	media_entity_cleanup(&wv517s->sd.entity);
+err_free_ctrl_handler:
+	v4l2_ctrl_handler_free(&wv517s->ctrl_handler);
+
+	return ret;
+}
+
+static void wv517s_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct wv517s_device *wv517s = to_wv517s(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	pm_runtime_disable(&client->dev);
+	v4l2_ctrl_handler_free(&wv517s->ctrl_handler);
+	media_entity_cleanup(&sd->entity);
+}
+
+static const struct i2c_device_id wv517s_id_table[] = {
+	{ "wv517s" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, wv517s_id_table);
+
+static DEFINE_RUNTIME_DEV_PM_OPS(wv517s_pm_ops, NULL, wv517s_resume, NULL);
+
+static struct i2c_driver wv517s_i2c_driver = {
+	.driver = {
+		.name = "wv517s",
+		.pm = pm_ptr(&wv517s_pm_ops),
+	},
+	.probe = wv517s_probe,
+	.remove = wv517s_remove,
+	.id_table = wv517s_id_table,
+};
+module_i2c_driver(wv517s_i2c_driver);
+
+MODULE_AUTHOR("Maurizio Casciano");
+MODULE_DESCRIPTION("WV517S VCM driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

