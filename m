Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03305381AF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 00:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791419679; cv=none; b=RE6hhSrmXOWuZZLYBmu50HSb3pB9QYRARVkJFmqraSD4VVFtTXCQDkFmXTPenRkgfcSnvmSTp0oOpd9YRJnlrjWAbo/TEuvGgCZPsMtQ0eJWRhG67EDvdjj3MSBrM8dWTwK5rfTDY91eEltJUsryXdRRhp27jwgxMmLdRMyH3Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791419679; c=relaxed/simple;
	bh=tOx1nEU5HsywsGyX3YhjHOQTmaL0UfLjuC7MsW973WE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F8Z/4gWmj0bmsw74rtyt3xmbc3pfIzXrK9gkyb7vhczLEA57ijQeXk0BN9f7Iuau2KYDF4RLWtbXMgNu3spSf8UVyFMFYx46qWrFFvOZHDlbDFfULyYLwZ8rqF2cKBEvgun7WoqfMLUjITsx/S3EiqeyLSVVblthuNRrvw6RnYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pl2z1t/4; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pl2z1t/4"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2df8c28a0b1so15660875ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 17:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791419677; x=1792024477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98AWZAZuc9VdjoCVD8NZ7AG4j/XWa1qw2xn1gi50RyQ=;
        b=Pl2z1t/4fUGUTa+d7hF5yScMeqhP99nDiz8Byw2yeAFXafK48N2T2ERKDOifUcgRg9
         /lMwif6TLjCpWe//GMcrw7qWn4TvwN62ClcKEVwa6vmBg7MqCJMtDc7MeqRMyHdZ8pOa
         RiBWIHy4GxMGncvKxlsSi2ealIf6H/g09nlA79/Ev3gxIAv1l2g0MWumkG4ye7yZ8H8b
         oHdQlevdobargCwXFaAU9y8rb3bBPOf+xtSLKw3qShcYzDgzV/fxTmHkHoz0DIjROUPy
         Prit7J8w8huisIK6QLyeLu1aBwYr5/cZjYLyeGydSXE4DvBKKlfQiDdfgm5GkM+xMuHY
         dQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791419677; x=1792024477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98AWZAZuc9VdjoCVD8NZ7AG4j/XWa1qw2xn1gi50RyQ=;
        b=B8SX5xlrCognG2AyxIm08eBeYQ9S1I+TJ4iE6sy3YuV10ll3hCyjff/3C3Clc0yTAz
         A544PBL53y6/so0fVxihSSeoTUs6JIXjSNmT4JwfFHpMYrkHbZdPxKM9JQ4dytIw4ZT4
         dW9VqD2NQxMlvuUaDy1tCogOCgEY4f+ui7FWpdr6cLi4VLL7fOzoeehIK7bV3+bMCA9B
         m+08QhmsmWWmLru4KJRnE3UMH0GWtDdmGJp0hm2EIsq/VjFDkE3rYwxv2Khel++e5h/Y
         CpldDQCLwlcbmNWflvVfhbpUUostExXvcjzbpJ8Td2NEzVtbmIl8iL553K9lT+wg20n0
         UYmA==
X-Forwarded-Encrypted: i=1; AKwUvByHxVpqaVknbvUkMokhKt8D8IJhjRydL3DfSQ/hCTvMTYKOBBF0jO7e2xd+EKnZFLGzklLadmoSozs/B24=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP3KGEWuSrLBYy3nP2LIEOvQA9bSF6HaIaBxJQPvi+oabbzEZz
	BAsi5NvzCT5XDu0jv/eIFgEMpptnNjGkfpneldrqpQKzO0JS0Y08Aj4i
X-Gm-Gg: AYBFou3Ahf1MC9Vf4TBgpJviEjh7HiG4xyjoouacYg5DTt7F9ZSgVtzItAVEbCAQLMG
	lfEIKErESwG4GdEfsnFZkSyUX6gF2bU0/f0y9fufFAbuJMwDqErQNKnDD0ujGmHgcmhc8BB3afX
	3p7N5V/7/drwBFRTcLR5sNrnhmyWIN7CB9jPqST2j0PMColFwy60CRjT2vTmAaVO6DYG48C5OaZ
	J2S1ucEvxBnqjlE+irn0SaOBdfG32I+Vo339ypD1GFv9p0yeHKxrd998bhfkUOFI0sTdW19YeSr
	HXL3Ewp/qG9Bu3wMA1/QcDfKFzCiutqenxp43IAJeDWg8XtCk/gHKG4Cnr8a7kX8NxzDNFnQJTt
	mjeZg3HjEyfOKUCNfsEmQfvEzPOErBjUSXp/Rog8vkfkKQuj3ByvRKnZemLJ8+eLThqSB+QAxkQ
	oilc2y3bPzbYWTUV5gjKX0UnTGxbV6n0idCnrSBiQg/4trPfEKFCDpuawqxg8LLny60GgGtjOR
X-Received: by 2002:a17:902:d54c:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2e60036c99cmr32985705ad.24.1791419677195;
        Wed, 07 Oct 2026 17:34:37 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45a:2646::3d0:58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482d33esm17883235ad.52.2026.10.07.17.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 17:34:36 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH] USB: core: don't release an unbound claimed interface via the driver core
Date: Thu,  8 Oct 2026 07:34:31 +0700
Message-ID: <20261008003431.145352-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_driver_claim_interface() sets dev->driver on an interface and only
calls device_bind_driver() if the interface is already registered.
Otherwise the later device_add() is expected to bind it, but with
bus drivers_autoprobe disabled bus_probe_device() skips the attach, so
the interface ends up with dev->driver set while it was never added to
the driver's klist.

usb_driver_release_interface() then sees a registered device and calls
device_release_driver(), which does klist_remove() on a node that is
not attached and dereferences a NULL klist:

  KASAN: null-ptr-deref in range [0x58-0x5f]
  RIP: klist_put+0x4d/0x1d0
   klist_remove+0x14c/0x2e0
   device_release_driver_internal+0x4fb/0x620
   usb_driver_release_interface+0x10e/0x190
   cdc_ncm_unbind+0x2ac/0x350
   usbnet_disconnect+0x1e2/0x300
   usb_unbind_interface+0x1dd/0x9e0

Decide on device_is_bound() instead of device_is_registered(): only go
through the driver core if it really bound the interface, otherwise use
the same direct unbind as for an unregistered interface.

Reported-by: syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=863936f50214e843ae0c
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Root cause: cdc_ncm claims its data interface from probe of the control
interface, before the data interface is registered, so only dev->driver
is set and the bind is left to device_add().  With drivers_autoprobe=0
that bind never happens, so release goes through device_release_driver()
on an interface that was never put on the driver's klist.

Tested with the syzbot C reproducer in QEMU (KASAN, dummy_hcd) on
111dc5487a4e: the baseline oopses in klist_put() in 2 of 6 runs (the
reproducer is racy), the patched kernel in 0 of 10.  A temporary
pr_info confirmed the new path is taken in a run that would otherwise
crash.  The Fixes tag points at the start of git history, as the code
predates it.

 drivers/usb/core/driver.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 7f33fe5ba03b..c7922875dd59 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -636,10 +636,11 @@ void usb_driver_release_interface(struct usb_driver *driver,
 		return;
 	iface->condition = USB_INTERFACE_UNBINDING;
 
-	/* Release via the driver core only if the interface
-	 * has already been registered
+	/* Release via the driver core only if the interface has been
+	 * bound by it.  A claimed interface is not bound if it was
+	 * registered with drivers_autoprobe disabled.
 	 */
-	if (device_is_registered(dev)) {
+	if (device_is_bound(dev)) {
 		device_release_driver(dev);
 	} else {
 		device_lock(dev);
-- 
2.43.0

