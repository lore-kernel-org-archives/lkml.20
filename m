Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8389A3BCD29
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 04:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791433600; cv=none; b=TJxcqrvOD0xAK8zjHyUX+hHXu2iqvdYACxMFFChakiOBkADCcZEGvofPqDifWJUpZxhrWSznneF6lgylI0k4Zvnu7Mbbc2W5raw4pJ1rM6XJgFcI/UkcOH0+tqlFwn4zUC9EmbGBK3yTN/YJZGYBQJfGMKgA9NaL8+dsp1Cltbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791433600; c=relaxed/simple;
	bh=uc7FwDCFIsWGH8RnnjX923HshtmpDadtAtbDtkVwZyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3j/Uskeubeyxv2+T+LOB5c6BI9Np2gBlYwFbEThV9XiLAuGe9el+uF090Hda74BE1sUZFszrZ+GGKhaE5hucCZs9yTw5GD0oOT6b+RbjsNKO51T7JO7vydp7h3PXZloswMRyiWmqwnKmVFNlN5LHQaAzFZeAnksuj5KBsGrCLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ur3VZYwZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ur3VZYwZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so25626925e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 21:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791433597; x=1792038397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LN+4GNxYdvlisTS7smG63GBSQyoVUSWH51sQR/4O9qQ=;
        b=Ur3VZYwZXatGnRHMtnfsXL4OxQajxJkUHN+1FUX7oQKfcSbFBdkGbhP2nABvHYvpXB
         47+ebMCNL83guTFPm5+3YTqmpopWtUhDAn2Ee2Bc67hxpvUCTmt4jAD6fuKcFg0BWTW+
         TgN+vy5GQ2XMLfGLW6kPzKC2PT0J1GS14kmaWV+EYYoj/CNCiCIR6DUMirlFkeKRO8cu
         i985CIzsLc68BqLGIdcKCx/dJtZ6hSehHBMFnIFb7f5AiFMrhf8l1t0Qd4/7cB8b3Ze6
         6FEsQ2Y6RXJMWDFP2dNLrsGhJeVpFN8bzhRjmp8b7QEuAd+qXskYefWIMuPxiCv2PIDZ
         i1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791433597; x=1792038397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LN+4GNxYdvlisTS7smG63GBSQyoVUSWH51sQR/4O9qQ=;
        b=Yj3Q8Mt5EOBe3KHPL5Sk+dZaDArogxMGj9aQiT+QVRASMhyxkifz+we2WLiZywCDUY
         zOjHtlWs88HrnRAtYP4TD5yGGzRtXKViKTfvbIjT2P9vyeIhnmCgLGy5JKDwh50etLL+
         U1mkJ7jzsh8fjZKixYNCeTCJTI7tSROM/robC9FAQretHfywWx5cZD8msKKCkM5We4S+
         KIa/rMmYBtgQKSPRULHbopWyoCN2OTq+47er2qzS00h0apXe9cWJvWaKUIhy/7nFZ6oR
         rhdUWWLTyVCBn282IdTxqYl7XdPgfR8Ih1c25x/5ZJ1H38izxuNnp4voe4m7oAZQSlA5
         CWEw==
X-Forwarded-Encrypted: i=1; AKwUvBzx2LfjOJHnGOYru5hFw+h0URCOioOAuZNEOHg3YeeI704aS10WOnRskY2VBlKVhE1loBqQufHlZeAJ9Js=@vger.kernel.org
X-Gm-Message-State: AFuF++nbetZ93BlcqcV0Q5s2CwtPlfoyfihHrQjhArvDKUxk4KUpINHP
	F30eDfe6Uottc0oM6WUuwNIjHdmhYY1SwNou93bkDq5WzgGc1iFaJyiY
X-Gm-Gg: AYBFou3Z2O/C/C/q/NCh6/KBC8w5ZHtmhnRAHPKeiKvGXBRalE12t7Usd493Fk0LVqU
	2hq1ZfY4WI6suQMN+X5jXPDmH4eIAfalgodIm69yhbwDQ6IAOIPKUO6qmnmdPDE0vSvwRX1DEnC
	gk0u/ynljyZeX5/pYFwNHwd6CDIdhugyjxV464BfXyRh9D9aJrwpxcrcdeV2AE4BS3G4dw64Thf
	Iv7Jw6yfBFbFpz14oL8tF6e/qHUmukETZI3A/7zTk94cRUNddkvdWomSxECn0FfaN4i3KX6qmo0
	qRkZTmlBHSm8x3+hqZ/xEVTHNuhiYeo631YhbvquuPXGhSkjrpyO4I4UIvbp5SOSK9sM8J5a05O
	u/L3vniU16VZfRRe3syetNWMmQctfrp28pENLkj2Ip13frRefEeZK+H2fbs7cJP/oxcWSEA5N2j
	a+oV+0i6lh1rIpiluwrU9J3MLBRXhikmeWMn6TIvuN0bVruJqTdAsofjKx2OSnKphuydcMkRhln
	9Bp8G/u6C9xsweT8zc3SBbsXV9Xot3DRaCQnUpZYoow7GMJBuNigkH7UvQDL6VZXKtme8tKcE2l
	hgh1WW0U70gD9AW4NEQR7deYKIWzMj3GAuIddkqBS0GyrwmVoHxIAvyEkUAHlvZ6uruDOpg3zAV
	/N45QMJfk46+1hrsiHfKo241uFsKXjpJQG1wD+tcUM1kAf/21sykqAA==
X-Received: by 2002:a05:600c:3b9d:b0:4a1:7b56:1151 with SMTP id 5b1f17b1804b1-4a18044c9e0mr86451085e9.18.1791433596642;
        Wed, 07 Oct 2026 21:26:36 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f486b6fsm88071375e9.1.2026.10.07.21.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 21:26:35 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] media: v4l2-subdev: Fix NULL pointer dereference in subdev_open()
Date: Thu,  8 Oct 2026 06:25:59 +0200
Message-ID: <20261008042600.275884-2-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008042600.275884-1-nicfio@gmail.com>
References: <20261008042600.275884-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unbinding a driver while something opens a /dev/v4l-subdevN node oopses
the kernel:

  BUG: kernel NULL pointer dereference, address: 0000000000000008
  RIP: 0010:subdev_open+0x8a/0x190 [videodev]
  Call Trace:
   v4l2_open+0xa9/0x100 [videodev]
   chrdev_open+0xb2/0x230
   do_dentry_open+0x14c/0x440
   vfs_open+0x2e/0xe0
   path_openat+0x82e/0x12d0
   do_filp_open+0xc4/0x170
   do_sys_openat2+0xae/0xe0
   __x64_sys_openat+0x55/0xa0

v4l2_device_unregister_subdev() clears sd->v4l2_dev, then unregisters
the media entity, which clears sd->entity.graph_obj.mdev, and only then
unregisters the device node. Drivers that call media_device_unregister()
before v4l2_device_unregister(), as vimc does, clear
sd->entity.graph_obj.mdev even earlier, while the sub-device nodes are
still registered. subdev_open() dereferences both pointers. v4l2_open()
has checked that the node is registered, but it drops videodev_lock
before calling fops->open(), so the whole unregistration can run in
between. Reordering v4l2_device_unregister_subdev() would not help in
the second case, and checking the two pointers in subdev_open() would
only narrow the window.

Neither pointer is needed in subdev_open(). Both record that the
sub-device is registered, and are cleared on purpose when it goes away,
while open() runs on behalf of the device node. The node has its own
pointer to the same v4l2_device, vdev->v4l2_dev, which is set when the
node is registered and never cleared, and the V4L2 core already relies
on it for as long as the node exists: v4l2_release() dereferences it on
every close. The sub-device's entity is registered with
vdev->v4l2_dev->mdev, so that is also the media device to take the
module reference through.

That reference goes through mdev->dev->driver, which the driver core
clears once the media device's own driver has been unbound, as when
syzbot unbinds vimc. Read it once with READ_ONCE(), as
dev_driver_string() does, and fail the open with -ENODEV if it is gone:
unbinding does not unload the module, so the pointer read is either
still valid or NULL.

With this, subdev_open() no longer reads a pointer that the V4L2 core or
the driver core clears when a driver is unbound. It can still run on a
sub-device that has just been unregistered, exactly like a file handle
opened an instant earlier. The lifetime of the sub-device and of the
media device when a driver goes away with file handles open, and module
unloading, are a separate, known limitation that this does not address.

Reproduced on a CHUWI Hi10 X1 (Alder Lake-N, IPU6) running 6.12.86, at
cycle 7 of a loop unbinding and rebinding a sensor while four processes
opened every /dev/v4l-subdev*. syzbot hit the second dereference on the
same line by unbinding vimc, and so does a test in QEMU with KASAN that
opens vimc's sub-device nodes while vimc is unbound and rebound; with
this patch the same test shows no oops, KASAN report or warning.

Reported-by: syzbot+74de6401dbdd377b5746@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=74de6401dbdd377b5746
Fixes: 61f5db549dde ("[media] v4l: Make v4l2_subdev inherit from media_entity")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a07d77e58..c56ca328f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -96,6 +96,7 @@ static int subdev_open(struct file *file)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
+	struct media_device *mdev = vdev->v4l2_dev->mdev;
 	struct v4l2_subdev_fh *subdev_fh;
 	int ret;
 
@@ -112,10 +113,17 @@ static int subdev_open(struct file *file)
 	v4l2_fh_init(&subdev_fh->vfh, vdev);
 	v4l2_fh_add(&subdev_fh->vfh, file);
 
-	if (sd->v4l2_dev->mdev && sd->entity.graph_obj.mdev->dev) {
+	if (mdev && mdev->dev) {
+		struct device_driver *drv = READ_ONCE(mdev->dev->driver);
 		struct module *owner;
 
-		owner = sd->entity.graph_obj.mdev->dev->driver->owner;
+		/* The media device's driver has been unbound meanwhile. */
+		if (!drv) {
+			ret = -ENODEV;
+			goto err;
+		}
+
+		owner = drv->owner;
 		if (!try_module_get(owner)) {
 			ret = -EBUSY;
 			goto err;
-- 
2.47.3

