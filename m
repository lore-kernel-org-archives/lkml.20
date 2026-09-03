Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B250446BE2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438000; cv=none; b=q8XMwKur2XLHujRHFMIVzlRcMirTQzueMorbJFKVy99f8P76dWxpg4NqIaPLXeGQqcufd1xGAQQecWd4kyw+P0rb/pyJMcA1SI/IbiY5+FKZv1Mq1mGaoCVsLCYMLaBw3a2g+lPY3Gd5XwyiHGJxdeGwqDlkt9g5AU47vPwx3Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438000; c=relaxed/simple;
	bh=IPoP1ujHUk9VAUmKycpgSLHGWxb9gHi9sH2bqHUrxX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TutU8tHaJi3xlSatAWzk+5r75lENkG5o4qHw5uFgwZ28tFfp4Rfk41EzMntXArgcLOnHhLRJNnbUVcFfX4VDG7m6/baHJt4SiH4oL566VHxbRqbhBQ12M5kuyTDP+FHKj3R4QDFu0AKcXiEt8xSAuXH+g5HpOR568r8gmueexi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnqT9XQE; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnqT9XQE"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso1911279a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788437999; x=1789042799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=77BNTVqgC1Z2OdVFKoom+8RxQdD5brnKOMVuDrWHP/Y=;
        b=cnqT9XQEFmpDdDCKUPONbZaHr/LActep/Xn50lW9wlFWfhI41gwyQ+U9+ArgHCV1oE
         txRhJV4nVNwKu5wLEj/wxNLrfqvLXBanVA0FnXUjKF2/wTuF/bB/s62BhpsCDKmUJUDU
         OJFsmZdIccW8IQFTx4oc6Dm+SIqHnTIY9giNrZgTc4KAuQ2fgha1aE+qYx6xO9QT+P6Z
         txEK9VaDkKnCOvu6FjsSCMcpsSni6ShOVrHDcw+dVR6YGNNLFpJY8SFcW6NxXkIYbmdZ
         VEW5dMggg4sEOAEYCbcGseFnHzt+mo/amcKoTtPAs2d6GMMz4N3RiVvNg9mrzg0H6rfZ
         pHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437999; x=1789042799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77BNTVqgC1Z2OdVFKoom+8RxQdD5brnKOMVuDrWHP/Y=;
        b=mxVn6tFzW7kYj7L6SdKL84nEegyGYsVDHlkTv9ws5Ca2PovX8tgtAMqOjB37kB5m2J
         RlzHkovYy6O6sf5Xz2FK+rGFwUjTxPs1r+wKO2+C28KRdchqfiIPkPC7biIBNNsuVt4p
         C9MEM7r2pqj+EwkSSD2/g5W5jHz1Z8gMoOaVxeBgd9h7S+SrD2v1hHITeq/lvkZFy4zv
         +RqrEtANpd8U1Y19fF2X1t/GhcaHVDygSK63jqMhHmSXq7IDnbmytTD5gv4GIk0d6z3C
         TKNz4n/ELcZXF/PU45pRm9QMDFZZ2E21cto1im1CQ+unw9/ErISsgyo8nE1VOlcmj1Jf
         tKuA==
X-Forwarded-Encrypted: i=1; AKwUvBxrs+UqgU0ePMdd8jcgrmwVY1EzaV8YjnlVFGE0MTQuGbSBHQg2irXCtnBM8FhI17K6FRJUzqAGelQEp3E=@vger.kernel.org
X-Gm-Message-State: AFuF++mwF+3qw2x2lpIWWcjZnaPEpPNXFF/DZIEersebX0wF6FkBtiSP
	TyPCmbH4VUBougKx/klT3QY6GCmtv5YLGw3lHaR/r1fB0VYQ5BltzGBw
X-Gm-Gg: AYBFou3IY5rm/H/+BOUn20bzVeS5dAN+J3hMGjmcTyzArOaKmY7HQQSxBQlVAZN4gbD
	2Sx5K0wJHp6CXFJyMevxnFpus0mg8H/CsXPSBwHfmSGxf1qwsxCWAZ2or3NsGqjGMZCxit86W6o
	Pz2UQfXhA1imsekA1xh+OjsbbFh2mDXtbUT02HjeOMVoGqFXQpPtwtIm6lkwTX1hIWQJQoD4BKI
	jbsiiCO31dyxlv78jvxej8AYoBugIaHKfbXShqPgQsGrr2pSYy84x6ehqPbm6KMp7kD6xJtkYFe
	E7DpKsrTPwvpauGxPGrqWi0zZ4ndCQ4nUK0YViaduxquekokPD8TJXZ/4yO7kTSjNuc69IuMV5Y
	AwLq/pD4xLcCy8R83rOXURRQCWoJ2B+DYdfqbNT68uVjZN8nsWEvR06QdGYjdTQhYyVZf/Q10PJ
	Lc3Zshk/TkKUw2vd1wVqTZCLeOQCHiKrtCmfPglB4Diqr5BASnypjf9BGA4Z6mHmmKZxvW/S3pj
	3tZIagPNWrVsuG9svL22koI0FmscrFXUWdHWcDAwILDtkQG8yTL4g==
X-Received: by 2002:a17:90b:3d81:b0:398:c150:e7b3 with SMTP id 98e67ed59e1d1-39aedf5d923mr18578664a91.4.1788437989277;
        Thu, 03 Sep 2026 05:19:49 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:d01b:7a44:ef5d:7899])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc090sm5361270a91.4.2026.09.03.05.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:19:48 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org
Cc: yuyang.du@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Subject: [PATCH v4] usbip: vhci_hcd: let the driver core manage the sysfs attributes
Date: Thu,  3 Sep 2026 17:49:38 +0530
Message-ID: <20260903121938.7661-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vhci attribute group is created in vhci_start() and removed in
vhci_stop(), guarded by usb_hcd_is_primary_hcd(). Both run from
usb_add_hcd()/usb_remove_hcd(), which are called once per hcd, so the
attach attribute is live while only one of the two hcds exists: it is
created during the first usb_add_hcd() before vhci_hcd_ss is set, and it
survives the first usb_put_hcd() on removal. A concurrent write to attach
can therefore reach a NULL or freed vhci_hcd_ss.

Register the group as dev_groups on the platform driver instead, so the
driver core creates the files before probe and removes them after remove
returns, and drop the sysfs_create_group()/sysfs_remove_group() calls from
the driver. The attributes have always been created only on vhci_hcd.0;
an is_visible() callback keeps them there.

vhci_init_attr_group() is moved into vhci_hcd_init() ahead of
platform_driver_register() so the group is populated before the core
reads it. The attribute array is still built at runtime because the
number of status attributes comes from CONFIG_USBIP_VHCI_NR_HCS and the
preprocessor cannot emit a variable number of __ATTR() declarations.

Fixes: 1c9de5bf4286 ("usbip: vhci-hcd: Add USB3 SuperSpeed support")
Reported-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8753715f05759f1a10de
Tested-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/20260815143427.19066-1-kartikey406@gmail.com/T/ [v1]
Link: https://lore.kernel.org/all/20260816015051.13184-1-kartikey406@gmail.com/T/ [v2]
Link: https://lore.kernel.org/all/20260816061034.17769-1-kartikey406@gmail.com/T/ [v3]
Assisted-by: Claude (Anthropic)
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---

v4:
 - add Assisted-by: tag (Greg)

v3:
 - make vhci_attr_group static, drop its extern from vhci.h (Greg)
 - drop stray blank line in vhci_hcd_init()
 - fix indentation in vhci_sysfs.c

v2:
 - use dev_groups instead of moving sysfs_create_group() into probe (Greg)
 - add is_visible() to keep the attributes on vhci_hcd.0 only
 - move vhci_init_attr_group() into vhci_hcd_init()

 drivers/usb/usbip/vhci.h       |  2 +-
 drivers/usb/usbip/vhci_hcd.c   | 36 ++++++++++------------------------
 drivers/usb/usbip/vhci_sysfs.c | 21 +++++++++++++++++++-
 3 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
index 5659dce1526e..f3993238f91d 100644
--- a/drivers/usb/usbip/vhci.h
+++ b/drivers/usb/usbip/vhci.h
@@ -120,7 +120,7 @@ struct vhci_hcd {
 
 extern int vhci_num_controllers;
 extern struct vhci *vhcis;
-extern struct attribute_group vhci_attr_group;
+extern const struct attribute_group *vhci_groups[];
 
 /* vhci_hcd.c */
 void rh_port_connect(struct vhci_device *vdev, enum usb_device_speed speed);
diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 39e8faf4c18c..22b9bad7ca31 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -1199,7 +1199,6 @@ static int vhci_start(struct usb_hcd *hcd)
 {
 	struct vhci_hcd *vhci_hcd = hcd_to_vhci_hcd(hcd);
 	int id, rhport;
-	int err;
 
 	usbip_dbg_vhci_hc("enter vhci_start\n");
 
@@ -1230,40 +1229,17 @@ static int vhci_start(struct usb_hcd *hcd)
 		return -EINVAL;
 	}
 
-	/* vhci_hcd is now ready to be controlled through sysfs */
-	if (id == 0 && usb_hcd_is_primary_hcd(hcd)) {
-		err = vhci_init_attr_group();
-		if (err) {
-			dev_err(hcd_dev(hcd), "init attr group failed, err = %d\n", err);
-			return err;
-		}
-		err = sysfs_create_group(&hcd_dev(hcd)->kobj, &vhci_attr_group);
-		if (err) {
-			dev_err(hcd_dev(hcd), "create sysfs files failed, err = %d\n", err);
-			vhci_finish_attr_group();
-			return err;
-		}
-		dev_info(hcd_dev(hcd), "created sysfs %s\n", hcd_name(hcd));
-	}
-
 	return 0;
 }
 
 static void vhci_stop(struct usb_hcd *hcd)
 {
 	struct vhci_hcd *vhci_hcd = hcd_to_vhci_hcd(hcd);
-	int id, rhport;
+	int rhport;
 
 	usbip_dbg_vhci_hc("stop VHCI controller\n");
 
-	/* 1. remove the userland interface of vhci_hcd */
-	id = hcd_name_to_id(hcd_name(hcd));
-	if (id == 0 && usb_hcd_is_primary_hcd(hcd)) {
-		sysfs_remove_group(&hcd_dev(hcd)->kobj, &vhci_attr_group);
-		vhci_finish_attr_group();
-	}
-
-	/* 2. shutdown all the ports of vhci_hcd */
+	/* shutdown all the ports of vhci_hcd */
 	for (rhport = 0; rhport < VHCI_HC_PORTS; rhport++) {
 		struct vhci_device *vdev = &vhci_hcd->vdev[rhport];
 
@@ -1513,6 +1489,7 @@ static struct platform_driver vhci_driver = {
 	.resume	= vhci_hcd_resume,
 	.driver	= {
 		.name = driver_name,
+		.dev_groups = vhci_groups,
 	},
 };
 
@@ -1541,6 +1518,10 @@ static int __init vhci_hcd_init(void)
 	if (vhcis == NULL)
 		return -ENOMEM;
 
+	ret = vhci_init_attr_group();
+	if (ret)
+		goto err_init_attr_group;
+
 	ret = platform_driver_register(&vhci_driver);
 	if (ret)
 		goto err_driver_register;
@@ -1568,6 +1549,8 @@ static int __init vhci_hcd_init(void)
 err_add_hcd:
 	platform_driver_unregister(&vhci_driver);
 err_driver_register:
+	vhci_finish_attr_group();
+err_init_attr_group:
 	kfree(vhcis);
 	return ret;
 }
@@ -1576,6 +1559,7 @@ static void __exit vhci_hcd_exit(void)
 {
 	del_platform_devices();
 	platform_driver_unregister(&vhci_driver);
+	vhci_finish_attr_group();
 	kfree(vhcis);
 }
 
diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index a7ede6fb3da9..d87d9e449d72 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -497,8 +497,27 @@ static void finish_status_attrs(void)
 	kfree(status_attrs);
 }
 
-struct attribute_group vhci_attr_group = {
+static umode_t vhci_attr_is_visible(struct kobject *kobj,
+				    struct attribute *attr, int n)
+{
+	struct platform_device *pdev = to_platform_device(kobj_to_dev(kobj));
+
+	/*
+	 * The attributes control every controller and have always lived on
+	 * vhci_hcd.0 only.  Keep them there now that the driver core creates
+	 * the group for each device.
+	 */
+	return pdev->id == 0 ? attr->mode : 0;
+}
+
+static struct attribute_group vhci_attr_group = {
 	.attrs = NULL,
+	.is_visible = vhci_attr_is_visible,
+};
+
+const struct attribute_group *vhci_groups[] = {
+	&vhci_attr_group,
+	NULL,
 };
 
 int vhci_init_attr_group(void)
-- 
2.43.0

