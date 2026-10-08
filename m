Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EF61F3B8A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 00:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791420053; cv=none; b=EuoCTdgf6MAXmaC6HqwbSIRNKr8D0p6N7vOL+Our8/Fb4DrJmjc28Yw51t0bmjuDMnA7iGu7p3OyZqHgKgJ/RT0Nj2HLSzDmi3Qs9unfBtSjZtb00U3PgagOuMnbZYz3m/HwSplbZRcVVMV6VEaNnelaPMb0/1VgMjDkmUIwqfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791420053; c=relaxed/simple;
	bh=AR9mnZZE9REsi2FD0Bp06itG5jMc6EBLfesW+rPNyhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K4Fqk0nrphBYg1Qj0cr1KsF6gEAzBTkTqmzr/JLZOmk2Nv6epZZr6pnmre5HKFYMyw3efWoZ5X45mQ2YDHX1uviE4QvKEw52o8zywXIAW650mwgZ4MUtbn+Ok3x/+mR93yEpQ72YVIFKyMpyhugaJB3UL5Z+9OizfiwPL+YjvRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKr5YUiT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKr5YUiT"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a01933b584so21817555e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 17:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791420051; x=1792024851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csSaxc4KsfFBpQCYUgerNMao5r5HoCxkPC/E+Xae5iA=;
        b=XKr5YUiTOCZDwvFdNnFAulTpzPxxSRqPVBZz15sDiWaH3ObG65F8Cue0f8E4oyrXxj
         RRa5YUTUvZY/IhD2e7fe0eW7Gj5lAXZ2Q6yMsXU6tG7YgAmSwHc/u6Yvac7NL2EXQGOQ
         whoR3nuj1Xqs/li8XCOa9rqzjODc+HykNV9PyjmCmQzttuOcFKSbTRqT9UuN2Xiu7ZtQ
         1KAYFFhkoHCm6hqzQJmOvxJJ2QTVld4Gxd3Pisxd2GYEJFcmSyKzstAkVb0qCkue/fCp
         nbOZ4w8LqM5KSUKm9pSAgEfnacLeI2oUKY6LcRSPfPXLwHFfAV7znu/PUxYDGrpfrUVI
         tE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791420051; x=1792024851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csSaxc4KsfFBpQCYUgerNMao5r5HoCxkPC/E+Xae5iA=;
        b=ES0BvNj3OwHmoqYhm4DniAmEbxR/NcImlkDakX/nkbjmBn9yZuxNx9SbaNGyaONnSH
         OgGXvc85gdYBK4WrkWcjBbPZwhfhmdcd4S+/WP9gcajUQvE0jZgQLc6KiQzgduTJxlXq
         Bhyi9s8MOJbB1zCp9fC7KIKDF9HlCOfZsIh+SS41xHU4QvEJDpZTExEnM73kvpawqyhF
         YYuKxt4wyzI57GDxQ6fX09iNdP5CE73e+zBaenR0U+GnC/Zx/oo60t3LniXikib9SbZ1
         MJXBNOI7ZiSsqXiqGBQgh4c++g7g5IN6Z6uN0k4KFLrWyth/u4Nl34xnwtcVic39m3Vh
         Wm7Q==
X-Forwarded-Encrypted: i=1; AKwUvBya16GZNwcelr/ChTFkquNn887DGPer0B7c+IB898gjx/9yWXM33PjR6oAWzgMQuZX2nviTY56PE5BltBw=@vger.kernel.org
X-Gm-Message-State: AFuF++lghSE+IXQS0SF+PJoEqfuvk9J2X8GS0N9JwAL18rvw/0f0jgHd
	uVfqFcPTLiPK1fH040iLKBjWnODB77PymX0QnO3WNyYTNCeH35QiZgF8VyAQ/4Fzs3F+wA==
X-Gm-Gg: AYBFou2NRX7d9Z0dPep4b2Xejv8gMId6zhTBmCgbwvGSCvGjtYBbbq9z9nz3U+2qPKO
	4yqSsxwM70H0FBodpA+lLjevxrnDiwWaemjAr9ta5o4WnrhspDHVfzA9MbIh8vzV4FexOfH1HaT
	EWjwFvcRHRF0GiyFJ0trX5pe4SrhAaPfdcK3WlIfIHGgPyIwQvui/wVTqRFcbHTBTGoafjqPMy4
	6YwuL/Ob26sPLyokkmdrscXS/lvt9ru6UlVKyqN2EKpqqJJfE696yM3rv6Z5AX0503tm4RIglYo
	h/bLQmQGNnsIbLnb1lu8x1GWIBMzlIbRDRfFeNNbevi01lqGUq7aXEoa0no8U9xGxnFz7A+E94p
	7vtZZrEQad/aNPvN58LyoM0kM7eewiRfBWaQ1IrKNsDPWYKrUTMqu8Or669PG0hGDXubkiS+hb7
	JG3wflON4xFG8ik851pUm9jns3FkmAtviQt1bLnoFuV68zo4r92nLkUm8wOGArljUjd4UD4smu
X-Received: by 2002:a05:600c:154a:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a18043c1f2mr70039715e9.19.1791420050472;
        Wed, 07 Oct 2026 17:40:50 -0700 (PDT)
Received: from localhost.net ([84.75.40.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842abfbdsm29007945e9.4.2026.10.07.17.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 17:40:50 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: f_fs: fix use-after-free on umount
Date: Thu,  8 Oct 2026 02:39:55 +0200
Message-ID: <20261008003955.1191-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ffs_free_inst() releases a device and drops ffs_dev_lock before it
removes and frees the device. A concurrent FunctionFS mount can find
the released device in that window, attach a new ffs_data to it, and
then use the freed device from ffs_closed() during unmount.

Keep ffs_dev_lock held across release and free so a new mount cannot
attach to a device being torn down. In ffs_data_put(), read
ffs->private_data only after acquiring the same lock, since a concurrent
ffs_free_inst() may clear and free the referenced device while the
putter waits for the lock.

Fixes: ecfbd7b9054b ("usb: gadget: f_fs: Fix setting of device and driver data cross-references")

Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com

Link: https://syzkaller.appspot.com/bug?extid=6227549bd2c8a1ec8ba0
Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 drivers/usb/gadget/function/f_fs.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c64a268e9..791425390 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -288,7 +288,7 @@ static struct ffs_dev *_ffs_find_dev(const char *name);
 static struct ffs_dev *_ffs_alloc_dev(void);
 static void _ffs_free_dev(struct ffs_dev *dev);
 static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data);
-static void ffs_release_dev(struct ffs_dev *ffs_dev);
+static void _ffs_release_dev(struct ffs_dev *ffs_dev);
 static int ffs_ready(struct ffs_data *ffs);
 static void ffs_closed(struct ffs_data *ffs);
 static void ffs_reset_work(struct work_struct *work);
@@ -2231,7 +2231,14 @@ static void ffs_data_put(struct ffs_data *ffs)
 	if (refcount_dec_and_test(&ffs->ref)) {
 		pr_info("%s(): freeing\n", __func__);
 		ffs_data_clear(ffs);
-		ffs_release_dev(ffs->private_data);
+		/*
+		 * ffs->private_data must be re-read under ffs_dev_lock:
+		 * a concurrent ffs_free_inst() may have NULLed it and
+		 * freed the dev it pointed to.
+		 */
+		ffs_dev_lock();
+		_ffs_release_dev(ffs->private_data);
+		ffs_dev_unlock();
 		BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
 		       swait_active(&ffs->ep0req_completion.wait) ||
 		       waitqueue_active(&ffs->wait));
@@ -4147,8 +4154,8 @@ static void ffs_free_inst(struct usb_function_instance *f)
 	struct f_fs_opts *opts;
 
 	opts = to_f_fs_opts(f);
-	ffs_release_dev(opts->dev);
 	ffs_dev_lock();
+	_ffs_release_dev(opts->dev);
 	_ffs_free_dev(opts->dev);
 	ffs_dev_unlock();
 	kfree(opts);
@@ -4363,10 +4370,11 @@ static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data)
 	return ret;
 }
 
-static void ffs_release_dev(struct ffs_dev *ffs_dev)
+/*
+ * ffs_dev_lock must be taken by the caller
+ */
+static void _ffs_release_dev(struct ffs_dev *ffs_dev)
 {
-	ffs_dev_lock();
-
 	if (ffs_dev && ffs_dev->mounted) {
 		ffs_dev->mounted = false;
 		if (ffs_dev->ffs_data) {
@@ -4378,7 +4386,6 @@ static void ffs_release_dev(struct ffs_dev *ffs_dev)
 			ffs_dev->ffs_release_dev_callback(ffs_dev);
 	}
 
-	ffs_dev_unlock();
 }
 
 static int ffs_ready(struct ffs_data *ffs)
-- 
2.56.0

