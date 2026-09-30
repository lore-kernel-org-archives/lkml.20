Received: from mail-dl2-f18.google.com (mail-dl2-f18.google.com [74.125.229.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C7836826E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757369; cv=none; b=JDEBOQqjvqhjD6hwul3SkPVwj48HlC6vOMH44EKsvZa1x6yuAVhw8f+lFakHgNvgHyUNSBQq978yJrPh/z3P0LKXy4QnR+umhEm6Qj+MzEhRIrJu6gfUW4zEwckbep500mXuWdhEPOQufsmg5fGoOn9hstnX+MAfkA0wyl+vfU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757369; c=relaxed/simple;
	bh=CXcZQkwEBvHNYAHCOqdJRRFMbdrWBoOjI/oLU9zmlzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qo++SZqfNo+NFAK17GbmTkgPILjFfMB198kupiBAvcx6/8whxPf21pafKQE3XfJc0GNQ43w5mapixgOcKBv1I2ivQf2w6edK1mJlV0r1VZU85LHAj783VIA/N6G7noYNdkPScYD5uvltkxQirVjTqOYWgfOaEws3REw26KRkhGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qN7pijlJ; arc=none smtp.client-ip=74.125.229.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qN7pijlJ"
Received: by mail-dl2-f18.google.com with SMTP id a92af1059eb24-14ca15e289eso281993c88.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790757361; x=1791362161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eGru/pWAqYtIr3dDjK27si7riHrmIveFauyiCa6IjE0=;
        b=qN7pijlJshryAZOCyp/GbHdkgMBZBza1XcqNWz4xcY7rCsd2FYWvP3vOXM/1Bh1d/N
         WGqqS05xtLbDkRVlEPG4Lhjtbe11zwIEOD0gkoLnfKFYdAUR2NIrVobfebWvBRj8GLWD
         9Yx3STUiWVajlOeZMGlu5Eoh4FvggwMc7RGT22splsoy+4J85nIQvbRqSRZenBwiWbiR
         8jmSlp4DW15W795qGeUKst74L6Cw6W4+Be3iHViIkp6kPVUlju1/2/Pup2iwp5R7bzAK
         yRYdJ5Yr8UJ36K2wsJ0DRkEZ+OPkpUYwC8iCxacNTvqVhlngRzfi01BjMSDLkOhUE9Xt
         EadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757361; x=1791362161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGru/pWAqYtIr3dDjK27si7riHrmIveFauyiCa6IjE0=;
        b=sVag06XeMii9tM0vgN2NV1P7A1LVNsb7cN6JbYitOxf0DS3ExxQNOl3vrwhUBEV/Y3
         WFg694PPU87ZlBvg9YvwlKoULWvtEgFQZUDyl4r1X1myfC6JNWxjtAF6CGQebV3p6xRc
         qSCXOOt5y7cf9RZO/ILmZM40H1IMrCtncvycod79L626jrn6O0lLVRAovTcGdsw1TQQZ
         U+K/cjM+B2yraG2VS9/4MhZtNYnjPHuE7zZwMaF5DEwplAlErI3eB4cnXNx3GJnCsBQu
         MRIGJWIFeOebkBoXmFFYeUXY6bkRP9rmHwaJv4ej+bT2TABl+Favy4cJ9NIYC46zkGuF
         1dgg==
X-Forwarded-Encrypted: i=1; AKwUvBwZ+aNUBiyzEZsmEg++2U7A2JMkMSRA6bjWL8ROts5+U8Uf0I3umh0spyoNipP+N6b63bOHkvuP8hv3bIs=@vger.kernel.org
X-Gm-Message-State: AFuF++nLyN8wNQyfuh/IuPMZv+lMRewbL4iCPKKnqTLfc0MflXOKH2sG
	qG0S2gYCkhf8dML5EovWR6NvZ6bAqsTYee33mgiHtUeRxkR9nZmmODZF
X-Gm-Gg: AYBFou3VSx7aFiiM26UF+HmKP7w8VeNbnRM5RJGve+S1UI9pIH0McusI9K/Nwmt8wUv
	UCbMRgakMIRfqoXb1SBMTZk6IB5C1bOE0vDFS51B++Hh+BRoWD3ylj+fdDMLx0G2i/jfYl2o9Qj
	xng7bnaQ0C1uP9Rc7juHGBqtRW8LfxDsxtzurzbkRfbsm/qPlOg739F8r49yRuoMpX/FHp7TT2n
	bbXDLdkxPI/WpQad9/BEi3YdXzbXgq4synG8x2IRX45FyDqiTsQFraZq4Yi9pmjuXO9JNI2DH5/
	eKLvDs65VJoyYtQLpyLLXKU8znozccxA66naF2Te6mNMQ5aBT7iBEHx9Pdp03yhP5ZIf8AEunwO
	elv8m8bnABCW0jNZyOCvDGk67sO5TGbieCjaS7eT1QEahC7ktU3GiZPS59JnGL6I2t5FMnfko7l
	bkUlTfdJEF/AhyW/XxKgQwG01cEo1qP61aKuE7t38ulE1qbRTmY3zCMDgcaQw4UOsP+3W9Z+jRZ
	bmiQBHxgqnAmW0iWWpkmcY+pwZckxr9PYSjS9RwnvPhoZ73xEVvhZSOV/n5SNKm
X-Received: by 2002:a05:701b:220d:b0:14d:3930:647d with SMTP id a92af1059eb24-14d39306659mr560105c88.9.1790757361020;
        Wed, 30 Sep 2026 01:36:01 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:1a11:fc4d:ef1d:6578])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d088e5b9asm2445733c88.9.2026.09.30.01.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:36:00 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: sean@mess.org,
	mchehab@kernel.org
Cc: jarod@redhat.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Subject: [PATCH] media: imon: fix use-after-free in display_close via dev_dbg
Date: Wed, 30 Sep 2026 14:05:51 +0530
Message-ID: <20260930083551.15905-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ictx->dev is a raw pointer to the usb_interface's embedded device.
On disconnect, usb_disconnect() can drop the last reference on the
interface and free it while a userspace fd for /dev/lcd0 is still
open. When that fd is later closed, display_close() dereferences
the now-freed ictx->dev via dev_dbg(), causing a use-after-free.

Remove the dev_dbg() calls that dereference ictx->dev in
display_close() and free_imon_context(), rather than taking a
reference on the device.

Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
Reported-by: syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9bfac891bdd42eb708fc
Link: https://lore.kernel.org/all/20260918054851.26083-1-kartikey406@gmail.com/T/ [v1]
Link: https://lore.kernel.org/all/20260928121230.35359-1-kartikey406@gmail.com/T/ [v2]
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
v3:
- Drop the dev_dbg() calls entirely instead of pinning the device
  with get_device()/put_device(), per Sean Young.

v2:
- Remove the dev_dbg() in free_imon_context(), as suggested by
  Sean Young.
---
 drivers/media/rc/imon.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 049a73b5f882..e54b588ff61c 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -492,16 +492,12 @@ MODULE_PARM_DESC(pad_thresh, "Threshold at which a pad push registers as an arro
 
 static void free_imon_context(struct imon_context *ictx)
 {
-	struct device *dev = ictx->dev;
-
 	usb_free_urb(ictx->tx_urb);
 	WARN_ON(ictx->dev_present_intf0);
 	usb_free_urb(ictx->rx_urb_intf0);
 	WARN_ON(ictx->dev_present_intf1);
 	usb_free_urb(ictx->rx_urb_intf1);
 	kfree_rcu(ictx, rcu);
-
-	dev_dbg(dev, "%s: iMON context freed\n", __func__);
 }
 
 /*
@@ -577,7 +573,6 @@ static int display_close(struct inode *inode, struct file *file)
 		retval = -EIO;
 	} else {
 		ictx->display_isopen = false;
-		dev_dbg(ictx->dev, "display port closed\n");
 	}
 
 	mutex_unlock(&ictx->lock);
-- 
2.43.0

