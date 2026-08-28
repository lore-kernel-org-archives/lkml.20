Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E22A46EF9E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933739; cv=none; b=C7CQK+ENPZHZWNsmhgBrSyZ+kwh+lmJA9goK/+mXdeBqkgk+nlrxxrcjhjWkRgbRz/jm9sZ+gJxlf9jmJRjIcM3gc0VoeDsKNQapRmHlXeM/rXRIoUsQJOa/zbcIDTCETvxqMZ5OixIliHD3L5346qLDZ9dsEfEYOKvlKI6vqfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933739; c=relaxed/simple;
	bh=KL/KrKPv/CwkOu/hDT8WvQPP4w2GF0et/e0jlzVc5sQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mj5bmVNRKWwTjT34VUTHBOZ5p/b/cTCQbItxF0Kkly7G97v8rp8h+6ggwnNziGjgwzW6bfS+eIkbprLaxAjy935xfqi7ayvZxlxmhSpPmXFcNsqctH9860XjCWzxFsrBYVt63SK63NenB/ojlpNocGHNqCqXaXI70tAS6d/dmxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oHSon8NU; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oHSon8NU"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482fc3327fdso445499f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933736; x=1788538536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G4CRs1pCaiygjhdGFap4Gmf6j66aGIB4LLnvtR7XBso=;
        b=oHSon8NUkrHJL7lwrTpIZjNt4OssuIOGGZNi/FtNGyL7XtVF1SKjslUh47XDgN5IWD
         Irz3McDvjTKVLLq+TyuUKihdztg9VQFKbitNuLqIFZstqC6VXv9oTXCxyTk0Mx46ZC0d
         4pWWVvUAD9M/i3iWnWUvniKlZPpeN7qIk8pPjyGlaJj0CTe0I0PkLUw06BNQOkUptAVr
         +0juFxXcbL6oUB9YbuHkSSL4n322mwstRXMAte8KqSEBTIu7TkT2Hg/AtXYd+6fgFXFQ
         kVD5ZxLwvxCsjb5J+MS46DVIVme07m60tL9aEwS/8KdQOoewgBJeWCoJJdga0P/r5rF7
         FtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933736; x=1788538536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G4CRs1pCaiygjhdGFap4Gmf6j66aGIB4LLnvtR7XBso=;
        b=FhrCULK7XKHGBB+2XmRfA4/QH7E8MwMBK3tJpghYu7PFwRLUJ/mCM4jvkQ8fST+8oD
         kH64qwO4ckr/VUL74Wt07Qk6jIuuT4oKJcfRPJyC5BYCEZw/mL/c/yGoYAqyMSCcWS8m
         G0XF6CaQuDhhDEajPmWQY2l1nSsxnbAdYapF93JvdvfILrp/FUpGeV4/+DTk5SESCHq9
         Vc2S5kxbWBO48GkpZHZiKo0U+c6uDCw1HXNHNHzdDwtKuie9AlorTst16xZ0O3WtiuF6
         mXNWxJVFmTb7R0SuVinLU2EUQJXUKllk4Kfj6InboGUWN2x28hMCYZBocaX8NNWwPZPA
         mLTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqpomou/AEXtU5choDi1MrkEPEzIV7D4Bsyl7/xQ9adVMWi2ISuyPpGvsUv9w6krfxe3mB3X0KgsCsk6X0=@vger.kernel.org
X-Gm-Message-State: AFuF++ms0bzG+Wg1bYsSKKEN8x1qpV4jZNRFU7oiuoDI2rz/7iSLxAut
	rjjaDA1z5mttl3lHWlnUHS5+wagXJcy6Mihvz17lJHf+vT9HfCRXCsOr
X-Gm-Gg: AR+sD12DI9zra1tsVtSsK6PUDkhenxiJwabkPf3Cu729qetbQjwZbtDh+/jV2UJ1RDZ
	3XAzGFW7T4OGq8vA/Dv9BLBwqyJ/Y1tBNccyYX4c2y5CuqJJkLde6D6pW7kh+mZ4HIDEeW7D5yh
	1GvbbpYWMKAl8Ltg5/J8ZI7EKupra675VJQ9uA5sUESRPI2pPS/ctqZ1i+ULyOTBeqwYFz4KaW1
	XivPOIB/UcLipl64Wx/pPFvQ5RrEgJLzrzvMz2lGOtKBca86XFX400xTek0xZ2bZBit2pt0eDBg
	7BcldDTqdUou2OKafRtde4G315yAjMdCHfc2vrEAu4i/xgRFfUvxkg3wgb3MFTS4lPyFE6+ffEV
	dY9Q2yeRF7MpfYUIfzM+VrDpDJlPJo4I7/Ptx2qWZ/xbCGQha2KVFpJxtj7aOg/HoXjuKDsh2pH
	Y5hOgz4KmWdw16KeA95Cj6A7k1Ht9kdb9aNy4Q9CfwWDYJa2wVfS9TjGsxNhrMeMyqBoUF5mwoB
	vRR0/HTmxY6hBu/QviU+Hkr5Lffw5tYj8Lfn1wB7A==
X-Received: by 2002:a5d:64c5:0:b0:47f:8b24:ef01 with SMTP id ffacd0b85a97d-482f7977aabmr12331731f8f.1.1787933735699;
        Fri, 28 Aug 2026 09:15:35 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:35 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 15/15] media: i2c: Add WV517S lens actuator driver
Date: Fri, 28 Aug 2026 18:14:57 +0200
Message-ID: <6691a58a47623af130d7217d0cedab4563691b4b.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91 rear camera contains a WV517S voice-coil
actuator. Add a V4L2 lens subdevice exposing the standard 10-bit
FOCUS_ABSOLUTE control and the device ringing-control mode.

Use regmap for register access and tie control updates to runtime PM so
the IPU bridge sensor link keeps shared power resources active. Propagate
PM acquisition failures and restore the drive mode and controls after
resume.

The register addresses and drive-mode value are derived from Intel's
GPL-2.0 WV517 driver. Retain the Intel copyright notice and document the
2026 copyright for this V4L2/regmap implementation.

Link: https://github.com/jekhor/yogabook-linux-android-kernel/blob/574bae692716f1b14093497bfab8a007fe8e460b/drivers/external_drivers/camera/drivers/media/i2c/wv517.c
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 MAINTAINERS                |   1 +
 drivers/media/i2c/Kconfig  |  11 ++
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/wv517s.c | 206 +++++++++++++++++++++++++++++++++++++
 4 files changed, 219 insertions(+)
 create mode 100644 drivers/media/i2c/wv517s.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 55b3c2d7a78a..a4380be897e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28555,6 +28555,7 @@ S:	Maintained
 F:	drivers/media/i2c/ak*
 F:	drivers/media/i2c/dw*
 F:	drivers/media/i2c/lm*
+F:	drivers/media/i2c/wv517s.c
 
 V4L2 CAMERA SENSOR DRIVERS
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5c52007f9cbe..c5636e0cbecf 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -949,6 +949,17 @@ config VIDEO_DW9807_VCM
 	  capability. This is designed for linear control of
 	  voice coil motors, controlled via I2C serial interface.
 
+config VIDEO_WV517S
+	tristate "WV517S lens voice coil support"
+	select REGMAP_I2C
+	help
+	  This is a driver for the WV517S camera lens voice coil. The driver
+	  supports 10-bit focus control and exposes the actuator through the
+	  standard V4L2 lens sub-device interface.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called wv517s.
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
index 000000000000..fa6c6d7524fb
--- /dev/null
+++ b/drivers/media/i2c/wv517s.c
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * WV517S voice-coil motor driver
+ *
+ * Copyright (c) 2014 Intel Corporation.
+ * Copyright (C) 2026 Maurizio Casciano <mauriziocasciano7@gmail.com>
+ */
+
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
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
+	struct regmap *regmap;
+	bool resuming;
+};
+
+static inline struct wv517s_device *to_wv517s(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct wv517s_device, sd);
+}
+
+static const struct regmap_config wv517s_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = WV517S_REG_DRIVE_MODE,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+};
+
+static int wv517s_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct wv517s_device *wv517s =
+		container_of(ctrl->handler, struct wv517s_device, ctrl_handler);
+	struct device *dev = wv517s->sd.dev;
+	int pm_ret;
+	int ret;
+
+	if (ctrl->id != V4L2_CID_FOCUS_ABSOLUTE)
+		return -EINVAL;
+
+	/* Runtime resume restores controls while the PM state is RPM_RESUMING. */
+	pm_ret = pm_runtime_get_if_active(dev);
+	if (!pm_ret && !wv517s->resuming)
+		return 0;
+	if (pm_ret < 0)
+		return pm_ret;
+
+	ret = regmap_write(wv517s->regmap, WV517S_REG_FOCUS, ctrl->val);
+
+	if (pm_ret > 0)
+		pm_runtime_put(dev);
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
+	int ret;
+
+	/* Restore the vendor-recommended 12.6 ms ringing-control mode. */
+	ret = regmap_write(wv517s->regmap, WV517S_REG_DRIVE_MODE,
+			   WV517S_DRIVE_MODE_12_6_MS);
+	if (ret)
+		return ret;
+
+	wv517s->resuming = true;
+	ret = v4l2_ctrl_handler_setup(&wv517s->ctrl_handler);
+	wv517s->resuming = false;
+
+	return ret;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(wv517s_pm_ops, NULL, wv517s_resume, NULL);
+
+static int wv517s_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct wv517s_device *wv517s;
+	int ret;
+
+	wv517s = devm_kzalloc(dev, sizeof(*wv517s), GFP_KERNEL);
+	if (!wv517s)
+		return -ENOMEM;
+
+	wv517s->regmap = devm_regmap_init_i2c(client, &wv517s_regmap_config);
+	if (IS_ERR(wv517s->regmap))
+		return dev_err_probe(dev, PTR_ERR(wv517s->regmap),
+				     "failed to initialize regmap\n");
+
+	v4l2_i2c_subdev_init(&wv517s->sd, client, &wv517s_subdev_ops);
+	wv517s->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	wv517s->sd.internal_ops = &wv517s_internal_ops;
+	wv517s->sd.entity.function = MEDIA_ENT_F_LENS;
+
+	v4l2_ctrl_handler_init(&wv517s->ctrl_handler, 1);
+	v4l2_ctrl_new_std(&wv517s->ctrl_handler, &wv517s_ctrl_ops,
+			  V4L2_CID_FOCUS_ABSOLUTE, 0,
+			  WV517S_MAX_FOCUS_POSITION, 1,
+			  WV517S_DEFAULT_FOCUS_POSITION);
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
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	ret = wv517s_resume(dev);
+	if (ret)
+		goto err_disable_pm;
+
+	ret = v4l2_async_register_subdev(&wv517s->sd);
+	if (ret)
+		goto err_disable_pm;
+
+	pm_runtime_idle(dev);
+
+	return 0;
+
+err_disable_pm:
+	pm_runtime_disable(dev);
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
+	{ .name = "wv517s" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, wv517s_id_table);
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
+MODULE_AUTHOR("Maurizio Casciano <mauriziocasciano7@gmail.com>");
+MODULE_DESCRIPTION("WV517S VCM driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

