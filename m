Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103C555820F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156182; cv=none; b=PMW7m3Z3q4fYhPPHfJh8BYF7FJHEh2NmHQ+1+fcPSpaaToI662eLLwL/8yscGry2xHPFdNFOIyNrGqOnodqk95Ne7bQvj57UgQ62rcwVDktb+Oy9uODZOpp6ug3IwRtJ+Y9KSPkjQeclLtltAG8Dqf8zw2x+iE1xUpZuWQRiiaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156182; c=relaxed/simple;
	bh=/fSHkST3JUzLumnJW2tM4iMnoEmzOO0ls0cnjBiIGfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=azMZql/mpmZTyal6bXk2X9cz/sONvD6Xl4M3mpN5XgPklZ9Nz2T38sT7QXopeF/d7dR2Y8vzaDXejj1vnbcsJcfIGK+bek/hhPqajuT+TQs4xCCTp4SUbCU/0Rx3ZBHCNYh367eFRXIb6T34TUOzRgs/S/3QvFd+aNyH5miGUSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=siymHmcB; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="siymHmcB"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so1374705e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789156163; x=1789760963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RMNVQ13hlMZI7lfJ4ygonXBvIxUAKCyDOecm1ekczoI=;
        b=siymHmcBxco4NM+6dQf5T5BmUVp7tSfeSDbp82FDEDQeqN8lGelSSzOfztbdtLFocf
         TjsXriYin+XM/CLKwGD2jIpKLzAUpetaDmigUWkgk/ukCeqRqnGWMmAjHu9gabURC8Sn
         i+EM5Ace3i1P/lDztX83UptShvZfJefRxE7+070Rhab/zoRE+ru0m7dy21HkE+Jf5Ckg
         utET0e+8NwfuR/zHuAtveDDxrEOdcJHWovXHYKz1UP8jpFJBy52xSwJkVPJX6J61HjCW
         Fbp80wGybupqFFoYBgV4kRl9W5MBSAu/e5kf3LPgDd0L7tu2Y9fD/dFwLBIAO6qkQH0E
         PdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789156163; x=1789760963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RMNVQ13hlMZI7lfJ4ygonXBvIxUAKCyDOecm1ekczoI=;
        b=cXWJgMYfbk5LUbeO7a/EZs4Ndav+kIm4LrMUyLMXHUDd06ufT9RohYfoRkAEDOdaPV
         GOdfJVKjQ33qeZVUheW1GtIlteTqBTf6rnk+AFCBSVD7r00Zqs8HbIq1uJg7bJOm+aCD
         z7JihKcNhL0WUtpvgTLZecAylPZli2/hipCkZX1ZDzig/ocVzYZ5WON+ls/gD4dbnvQz
         ZJc/TOkEKtyOkYKfwVEZTHeqa6BkOatRb0ipic1m62AjczcunvF422CV0sg2hhix35Hp
         9V4XsHVlAYfkL7cQAorK0iU2l5QIO3GU9NwEut1P9IeLdS2LHxJwktWF2XtRSDfNBXpn
         tXmQ==
X-Forwarded-Encrypted: i=1; AKwUvByBIWW7F5Ted511rRYFzyx9k/g9+idb4cQ2rEdlMcnWF88wMzlPPA6EpILq089mctO0ovezPbYcV4PTh/A=@vger.kernel.org
X-Gm-Message-State: AFuF++luw0FziPW+Qu/pZumnSkz5WJ9FpJIdtx9Xrc//y4Hf0nvs0Oni
	A7Hs7qEWClJxpls4bqfqx4F6ve2aYXgS+cymfoyG7bOb+GnQVr5UOkUe
X-Gm-Gg: AYBFou0Nhav5groHjoILzfu1OVT5HxsqjQfHUMYyQRb79sEkPoNQ6ol4FRJ3T4fDCCu
	d6e8pjxx4R4JiUFbEpfYdrxmcl3nDOsnSWPjVFWuILKpoC1w6+bExx5S8O+7ddaEk2zqzLkL8sA
	5tUNZV8ujD083l3mBv+v76Aw6HKF7yEWm84ei0GJRafOkSULGvuq7ityLdMh6NCeSZBqKYZFAxe
	DBudsE3kL/b4gOKzHqDknemeeZTzyicT52jqqXKpilX3NjG0Euu19Nokt0AatiL0M8ntAY6q9ug
	IFp1dP7mwJywUHptAWa8zcidAwWurQ7cHaPijDbqL9ZK0wKwPc4XFJ7OJ4/XUldF4Jn3b7B6uX1
	AHyDHt593ibo5ZQM24swHYSyb2oPOoiPRGtk5QpbMb3Ni7MChj+ieGxVlIh/xE6wiyYqzgPZRvL
	TaC9dA5HuDly0g/gqUXtsgtQZ2d61F49kzPc/N363XGWyMKw9LZ+64crbMAlsRNgJNcZLywEnuH
	fuPuajClFJWijWDyN+ldtq0HNNlWQ0eN0Wh/fK2ifi1lqA91v4chJ1U640DKYx0iq8IO2UuMT7p
	nwBLpLYXvfg+lzWnjKmg+saPcqrPJrCqN0BYDvs/LNihWA/a48IyiYYl85XRXIWBcdd6lZ+7OYp
	RCfAd/HmtNxB1mysLFJTMDeqIrwewsWEAwI1QCTr1Oz0Hv5s2
X-Received: by 2002:a05:600c:3115:b0:49d:1e79:35d6 with SMTP id 5b1f17b1804b1-49e61094b9bmr73338895e9.14.1789156162920;
        Fri, 11 Sep 2026 12:49:22 -0700 (PDT)
Received: from localhost.localdomain (host-95-246-9-241.retail.telecomitalia.it. [95.246.9.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26b7332asm175983925e9.0.2026.09.11.12.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:49:21 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	antti.laakso@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH v2 2/3] media: v4l2-subdev: Check v4l2_dev before dereferencing it in open()
Date: Fri, 11 Sep 2026 21:48:53 +0200
Message-ID: <20260911194854.78894-3-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911194854.78894-1-nicfio@gmail.com>
References: <20260911194854.78894-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unbinding a sensor driver while something opens its /dev/v4l-subdevN node
oopses the kernel:

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

v4l2_device_unregister_subdev() clears sd->v4l2_dev, then unregisters the
media entity, and only then unregisters the device node. Until the node is
gone userspace can still open it, and subdev_open() dereferences
sd->v4l2_dev unconditionally. The faulting address is the offset of the
mdev member in struct v4l2_device.

The window is not a narrow one: media_device_unregister_entity() sleeps,
and the first oops seen here was not provoked at all, it was hit by v4l_id,
run by udev on the very node that was appearing and disappearing.

The same window leaves sd->entity.graph_obj.mdev NULL while
sd->v4l2_dev->mdev is not, and the second dereference on that line goes
through it. That one was found by reading the teardown path, not by
crashing on it; it arrived later, with commit 218bf10e39ed ("media:
v4l2-subdev: handle module refcounting here").

Unregistering the device node before clearing the pointers would narrow the
window but not close it, because v4l2_open() drops videodev_lock before it
calls fops->open() and the whole of v4l2_device_unregister_subdev() can run
in between. Check the pointers in subdev_open() instead.

Reproduced on a CHUWI Hi10 X1 (Alder Lake-N, IPU6) running 6.12.86, at
cycle 7 of a loop unbinding and rebinding a sensor while four processes
opened every /dev/v4l-subdev*. The code is unchanged in v7.3-rc2.

Fixes: 61f5db549dde ("[media] v4l: Make v4l2_subdev inherit from media_entity")
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---

Unchanged since v1.

 drivers/media/v4l2-core/v4l2-subdev.c | 31 +++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e9f81b9be..2a47b9730 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -97,8 +97,19 @@ static int subdev_open(struct file *file)
 	struct video_device *vdev = video_devdata(file);
 	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
 	struct v4l2_subdev_fh *subdev_fh;
+	struct v4l2_device *v4l2_dev;
 	int ret;
 
+	/*
+	 * v4l2_device_unregister_subdev() clears sd->v4l2_dev and unregisters
+	 * the entity before it unregisters the device node, so an open() that
+	 * races with the sub-device going away lands here with those pointers
+	 * already gone.
+	 */
+	v4l2_dev = READ_ONCE(sd->v4l2_dev);
+	if (!v4l2_dev)
+		return -ENODEV;
+
 	subdev_fh = kzalloc_obj(*subdev_fh);
 	if (subdev_fh == NULL)
 		return -ENOMEM;
@@ -112,15 +123,23 @@ static int subdev_open(struct file *file)
 	v4l2_fh_init(&subdev_fh->vfh, vdev);
 	v4l2_fh_add(&subdev_fh->vfh, file);
 
-	if (sd->v4l2_dev->mdev && sd->entity.graph_obj.mdev->dev) {
-		struct module *owner;
+	if (v4l2_dev->mdev) {
+		struct media_device *mdev = READ_ONCE(sd->entity.graph_obj.mdev);
 
-		owner = sd->entity.graph_obj.mdev->dev->driver->owner;
-		if (!try_module_get(owner)) {
-			ret = -EBUSY;
+		if (!mdev) {
+			ret = -ENODEV;
 			goto err;
 		}
-		subdev_fh->owner = owner;
+
+		if (mdev->dev) {
+			struct module *owner = mdev->dev->driver->owner;
+
+			if (!try_module_get(owner)) {
+				ret = -EBUSY;
+				goto err;
+			}
+			subdev_fh->owner = owner;
+		}
 	}
 
 	if (sd->internal_ops && sd->internal_ops->open) {
-- 
2.47.3

