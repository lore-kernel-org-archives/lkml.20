Received: from mail-pj2-f16.google.com (mail-pj2-f16.google.com [74.125.227.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2763803F2
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789835239; cv=none; b=CL4J6ld5FpBVOi3tOxEyU6vbqirFEr/nSn7qnrx0Z3cyz8o2pIKmiZj2oJ0QuDOZp/DZh6fK03dcURHz4BfhI64n1ZiACM9bRLcBcSptFR6HKSyEd6CKBFvs1R3WeHrD0Zh7pchOb44a0J5ktLV3kbZyQhRc4vlaWcE1aGQXPQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789835239; c=relaxed/simple;
	bh=eMFhlR0TS5Kn/tFofe+TMpxutHYTDD8uIlIIph5XMws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HFZyk7NyIvUOfVEotrdacrA9cG2odxWaImvEDycsmhseX1UR7LeHWuGfSvmed4UYz6OGlnw7rQmJJwJAmPtRHrhyx89J6XaC4jFZmvwi4cKhJQ9iV71L4s6yvc2wfC8hWmZWjEkosSGWLKac/pY98p6SW4iDi862knoPoZmSMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=szvgrJgI; arc=none smtp.client-ip=74.125.227.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="szvgrJgI"
Received: by mail-pj2-f16.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso661738a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789835237; x=1790440037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0GPztW8MlLhQMli3TwZRtsdRaRgM99w65yRo1wA4KFY=;
        b=szvgrJgIPAliHmKYhl+PmP32fEJY0A+BygnS9jc7DyXYJyZl0QLl+6q34wTpk2YNsY
         /w59jg1Zsgm4ZLYvLtGISj8tWknGKeerTClVjZuiZFD6/bnI5T3IKm9jwu5xV191RTBd
         5Wi7KArs+6ahmQQFtG6kxjAap3JgxvlAmrAVh9hpIhgJgXYiIHF/jxuIv9UxgEEYkwZ6
         pOCZIJO3b01jWs6UEK+hGfiKFxXPhG2Rbs8Dwv7w0zfehn3+I6s3yesxTY6ehxF0NTT7
         vJ2Byi//52dIgGphN1FoBR2WkWGPa1sECMv20AIittSHx8BIRB8R7aRkfLLGkXw6hx1K
         cvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789835237; x=1790440037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0GPztW8MlLhQMli3TwZRtsdRaRgM99w65yRo1wA4KFY=;
        b=fGM0VnuLI7Wq/LweAroUbaEXD/kOBjDsOJ3525yET+cff4DoN78eM4UofEZ0s7q7JC
         u87qEHPNifTYTGrfZmmfGA1VxC3w16i9Gva3LHVMLPtNwxME3woZVzDoXAvRVxDKBzSv
         iTs+6DTVSPOJPoChWlTe+aT0m7Nn8hVmADoHWFpyDNdgy6OxRrvLtXXcsibYhkRgshdR
         DLRjQZYUf8cdOFUWFSEQjSpAA4D1hhwiyuE6Sm6OnonD4JRGNoFkSitmrSqs4m9AcPOe
         TSUmX3UGGM3VAgZTaZvIym2OxjSuhNNZmVyYubI7MroB8LIJ7NFSHHi9PYvmAoeuANYN
         uOrQ==
X-Forwarded-Encrypted: i=1; AKwUvByn2WmHcQSBcJ+BzU1JMzBtYe8JhXZRoHHTQGszqCDxCfeDuC7ndg5PGRSvqY0cndyNXz/j4HMEoct7IH4=@vger.kernel.org
X-Gm-Message-State: AFuF++n0pFC/3XAMO7myKh+im1pY2BtiPttQiSX5FLzx5gP52y0ZXPQO
	jHpDD7f+5H/XpDvk5i7rg458HgfN+6Vl6XBL+i2RdLwbpuHGg8pQzKVg
X-Gm-Gg: AYBFou0P/YjuWdThmiZzFJWAgBiu9mmn/cuTmML6WIG3vt34QL4houSJmLNKJKDxqtY
	XghVAJV1bJBynMyrIPnglxsq0eHLP+7W/0YdtTP1/oaxSIfhRI0DS06DrmNnyOLd55fUqX2zwHC
	FVfLohIe4jv/vNIN6BvQo7yHpUCx6CDBbUrRd5yX4diPbxJyJ9KXvc3guWpkYX5uwLvSErtTPDB
	vh2hWrwvmcEXZMAGieIm17yrUnwQx9Z4wnqDFnPwldPDihuqSoREZphhtcn0+mwnto/+m/wR0n0
	Es9CDXxLPONPtJ4fXQea8VJ3zqaDg+89k5aQCFN9AYVxnk6qoZDV1jszRn89OYiRhPLm1zhK6wt
	f0mbI+yk1hiINwBqKyQiInWuSydfGyyrwaMoatapQYw2Gkr4TqCxS5VP7bLAD+1CJQwJoKrzGXn
	yI4IrDRdpXyIZg4OUXaMx3Ehvu1Eb3A8twJEy3Xf6fpb2xr5MsCNYYauPY6ZEFwrv2/GbdF5nS9
	AexLrZASU4+zt9a
X-Received: by 2002:a17:90a:fc4b:b0:3a0:2900:f55e with SMTP id 98e67ed59e1d1-3a02900f85dmr1166378a91.29.1789835237378;
        Sat, 19 Sep 2026 09:27:17 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:814e:e9d3:767e:9a2a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55b83602sm4190789a91.1.2026.09.19.09.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 09:27:16 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+74de6401dbdd377b5746@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] media: v4l2-subdev: fix NULL deref in subdev_open() racing with unbind
Date: Sat, 19 Sep 2026 23:27:09 +0700
Message-ID: <20260919162709.314464-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

subdev_open() dereferences sd->v4l2_dev->mdev and then
sd->entity.graph_obj.mdev->dev->driver->owner. v4l2_open() only checks
that the node is still registered, while
v4l2_device_unregister_subdev() clears sd->v4l2_dev and the entity's mdev
before it unregisters the node. Opening a sub-device node while the
driver is being unbound (e.g. vimc through sysfs) can therefore see a
NULL entity mdev, or a NULL dev->driver once remove() has finished, and
oops:

  Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000
  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: 0010:subdev_open+0x193/0x510 drivers/media/v4l2-core/v4l2-subdev.c:115
  Call Trace:
   v4l2_open+0x1d2/0x490 drivers/media/v4l2-core/v4l2-dev.c:433
   chrdev_open+0x234/0x6a0 fs/char_dev.c:411

Read the entity's mdev once and treat NULL as "no media device". Take
the driver module reference under device_lock(), which is what unbind
holds while it clears dev->driver, and fail with -ENODEV if the driver
is already gone.

Reported-by: syzbot+74de6401dbdd377b5746@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=74de6401dbdd377b5746
Fixes: 218bf10e39ed ("media: v4l2-subdev: handle module refcounting here")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Root cause
  v4l2_open() checks video_is_registered() and then calls subdev_open().
  v4l2_device_unregister_subdev() clears sd->v4l2_dev and the entity's
  graph_obj.mdev *before* video_unregister_device() on the node, so an open
  in that window sees a NULL mdev. After remove() returns, dev->driver is
  also NULL. subdev_open() dereferences both unchecked (v4l2-subdev.c:115).

Fix
  Snapshot entity mdev once (NULL == no media device), and take the driver
  module reference under device_lock(dev), the lock unbind holds while it
  clears dev->driver; return -ENODEV if the driver is gone. Errors go
  through the existing "err" label.

Testing (QEMU x86_64, KASAN, vimc built in, syzbot's C reproducer:
16 threads opening /dev/v4l-subdevN vs. one thread doing vimc bind/unbind,
vivid.n_devs=1 to avoid minor exhaustion at boot):
  before: 32 x "RIP: subdev_open+0x193/0x510" GPF (same as syzbot report)
  after : 0 oopses, 0 KASAN reports, reproducer runs to completion
  (checked with 1 ms and 30 ms bind/unbind period)

Unrelated finding (not addressed here)
  If the sub-device node registration in vimc_probe() fails (e.g.
  "videodev: could not get a free minor"), the error path in
  vimc_register_devices() frees the entities and then
  v4l2_device_unregister() hits a slab-use-after-free. Easy to trigger
  with the same reproducer if minors are exhausted. I'll look at it
  separately.

 drivers/media/v4l2-core/v4l2-subdev.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e9f81b9be9e2..cec63694a658 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -97,6 +97,7 @@ static int subdev_open(struct file *file)
 	struct video_device *vdev = video_devdata(file);
 	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
 	struct v4l2_subdev_fh *subdev_fh;
+	struct media_device *mdev;
 	int ret;
 
 	subdev_fh = kzalloc_obj(*subdev_fh);
@@ -112,15 +113,22 @@ static int subdev_open(struct file *file)
 	v4l2_fh_init(&subdev_fh->vfh, vdev);
 	v4l2_fh_add(&subdev_fh->vfh, file);
 
-	if (sd->v4l2_dev->mdev && sd->entity.graph_obj.mdev->dev) {
-		struct module *owner;
+	/* Unregistration clears the entity's mdev without waiting for open. */
+	mdev = READ_ONCE(sd->entity.graph_obj.mdev);
+	if (mdev && mdev->dev) {
+		struct device *dev = mdev->dev;
 
-		owner = sd->entity.graph_obj.mdev->dev->driver->owner;
-		if (!try_module_get(owner)) {
+		/* Unbind clears dev->driver under the device lock. */
+		device_lock(dev);
+		if (!dev->driver)
+			ret = -ENODEV;
+		else if (!try_module_get(dev->driver->owner))
 			ret = -EBUSY;
+		else
+			subdev_fh->owner = dev->driver->owner;
+		device_unlock(dev);
+		if (ret)
 			goto err;
-		}
-		subdev_fh->owner = owner;
 	}
 
 	if (sd->internal_ops && sd->internal_ops->open) {
-- 
2.43.0

