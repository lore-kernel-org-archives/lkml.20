Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E905384CCB
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 21:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791323397; cv=none; b=hMW+zJmG9RzuKPOa58VT6LMQ3MYdPQUw6x5cWSVU6luhVMT0zkjnLTsyg6KM8DIXJsBljo8wODE/XUwfcwQHHBKFJx6YJP+ikErogHltEADqmO2LQpIXQjfObKIMw8TybMot8hi86Iy6bQ1pJ7K25/x3uoQGT98vHgb23dDCvLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791323397; c=relaxed/simple;
	bh=C0c5IXQvF6cyskk+GQY0TQOY2AKKU9jJBTcBI7wHzzo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ImRfWslKDJbGz2KOKCwo02LrGOws3Vd4QWRK9I7Yd2QL9+0N18bj1y7n208NAfj3EEjV4WCZleI5vKXjtOIhZ9VWfkpovDhbN0E8Ba9dBQT7Z/a63pV7uMrLNCgK/EFN7ikuWVYRJn8tOBh0E7BHTh84L0/4Vsl22LM/aRamIP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKWWIPki; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKWWIPki"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-533930955a4so10679721cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 14:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791323395; x=1791928195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MiuJ6tEdX7bCVQ5eRq8L2N8iHEN5p1vourLf6BqpRZ8=;
        b=dKWWIPkih0SYD8jkd/sbltsFjXb75l8TBXxJ9OGM9k0KDnRwKwNkJLO6Ot6OlldHkG
         r5AT0JdnVPdwqrIi5Em5GCl/wYeFku5ylBvILEAp10ILlIc7ErhFf0E/uwVGMCt2EBhd
         vzaE/3hbZVWhqI2SARjFVWeBWtVmPf///QFW74sW7nNy9zKyDeYIS+7Mhe6MKyf+tS1v
         n5dDWpTpsYOO1X8LZMnEn6YdrRWhvJY5TtZt72DOmdKg8OwQykWtsbnaC39wgPyoV05E
         PV+FLWLmCG97/tSxRXR7M1dv1yyaYrfTCYafS1ZNYYQ5G8qSmZftzs8iql52I+cpokz7
         V1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791323395; x=1791928195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MiuJ6tEdX7bCVQ5eRq8L2N8iHEN5p1vourLf6BqpRZ8=;
        b=QoYBS6LWZ25Y9dmgGqWy0+gvOxEILpGji+wqq2dS5XG0CuqcCnWdnCxPJyfHxJIKPB
         zRjHl7cCpgtecqxK4o1032Zk0geDH/8orvnWCRbpd5vrf9dtLydVc7KquknIrFlDZBKa
         szCX2BqkbRUdbaAphGi9mRRGAIh3/nbgjm6d2o2Od9UFDH7AHUzHj4yoXZ6PWX+XC//S
         q6JLauXI+EDI/QtOgHd0lASiXjmn6PADPJIb2O3qdwOpVuh6ixaCFDpeA7SimWA/ew8Z
         TmWPgltmZVu+FJSGVNTSS2NIqSeE0RilqK+QItOSN4bOtL1YYR3htrcd/bmLZjwYXoWp
         ShEg==
X-Forwarded-Encrypted: i=1; AKwUvBwZH7Kly4M8k4JjMFRWZiNVKzRQvqYEbHQ9dBQJ7ouBX8czTjLANc6Zso10xCOXy4m3GKDjzGp7r17fbDw=@vger.kernel.org
X-Gm-Message-State: AFuF++m3t8dsKb6q+BdmuJSlwws5XHZUXkN+Uu2GoQ7P01Jpe6gqHazd
	eo6ystfHJl3k5sIBBNW96i9w9XrOLeeUkuT4D52yW8xfkYRddTPkD5+Z
X-Gm-Gg: AYBFou2eLK1suqLRHHfDbTD/VnZE41SmlZj1hf0iMRUtY9iHRbOypf3408sBKsJm8jb
	dJkQ8JQ24SAvt34ZykIdwn/mXKSvW+X1kH/5jgFqNT2HCw9SqLjtHY27FHvs/G1QHMRntHN2x5H
	4MvsNtZ14yjmNmeYZ7XHE8dZHaJjpqCTnaMS2nXwQ4T7ArxEULtwgsXxRKQdyUQiICBCEax3aqw
	3yFdTu3UkbEbVxACsjOeQ7cDe1gAVQuzwTTP3nWMXZuoawvh9i/iNnE3lA/TtWWJxC/ut12Y/bP
	Wn2oK070iETyqWTeddcdI9HUZIWrrJEsAEu+DP/V0OV4dfTAo2DNOeXHHOqPTQ8wunZAmXWapEh
	nKalfSBUWkew3F9O3wRFY83TB59H0Rq3KYvxvdI89E68pa8+eyq6pmQD+HdTtpacykUVvNNIBYj
	CjZG1diq+pgHPxVGSVFWrXRZ3LDjEyd31z+C9MZlFkteJEMatZfGjrpJlicFPJz2VKrGrX1pvVR
	kOjK+pol7751Dg9c74hZXzvT513mlu1+97TbN3aOnCV2MJoNNzfsYw3A8MeDeGVMuS6GaVwvxht
	JQclleMa0sP3QCP1IdU5j/YFCdk4dyu6lWAuxr35K9IP7sRzu6JlsgjdtIcSBLbLtt8hN9jAehv
	GMOdEiBjhVWq7OW4CncBhNKPRjlVC/tkaYYOA2A0qDc1ZBDlj
X-Received: by 2002:ac8:5f10:0:b0:533:8cc0:2e17 with SMTP id d75a77b69052e-5357562b487mr2768821cf.50.1791323395186;
        Tue, 06 Oct 2026 14:49:55 -0700 (PDT)
Received: from node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us ([128.105.144.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5357209ee47sm5471271cf.6.2026.10.06.14.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 14:49:54 -0700 (PDT)
From: Mohammad Mosafer <mohsafer@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
Subject: [PATCH v2] usb: gadget: f_fs: fix use-after-free in ffs_closed() on umount
Date: Tue,  6 Oct 2026 16:49:40 -0500
Message-Id: <20261006214940.158352-1-mohsafer@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006210523.150724-1-mohsafer@gmail.com>
References: <20261006210523.150724-1-mohsafer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ffs_free_inst() releases the ffs_dev with ffs_release_dev() and only
then re-acquires ffs_dev_lock to free it with _ffs_free_dev().  In
between, the dev is still linked on the ffs_devices list while already
marked unmounted, so a concurrent mount(2) of functionfs finds it by
name in ffs_acquire_dev() and links a fresh ffs_data to the doomed dev
(ffs_data->private_data = dev).  _ffs_free_dev() then kfrees the dev,
and when that mount is torn down, ffs_closed() dereferences the stale
ffs->private_data:

  BUG: KASAN: slab-use-after-free in ffs_data_clear+0x438/0x530
  Write of size 1 at addr ffff88810594664a by task repro/116
    ffs_data_clear+0x438/0x530
    ffs_fs_kill_sb+0x7b/0x510
    deactivate_locked_super+0xa9/0x200
    cleanup_mnt+0x255/0x380
    ... reached via umount(2)
  Freed by task 112:
    kfree+0x127/0x3b0
    ffs_free_inst+0x10c/0x1a0
    usb_put_function_instance+0x8a/0xc0
    configfs_rmdir+0x773/0x9c0
  Allocated by task 113:
    ffs_alloc_inst+0x109/0x360
    function_make+0x138/0x330
    configfs_mkdir+0x48b/0x1090

Hold ffs_dev_lock across the release and the free so that a released
dev is never findable, splitting ffs_release_dev() into a lock-assuming
_ffs_release_dev() (matching the _ffs_* convention in this file).  For
the same reason, re-read ffs->private_data under ffs_dev_lock in
ffs_data_put(): the argument read there was unlocked, so a concurrent
ffs_free_inst() could unlink and free the dev while the putter waited
on the mutex, and the subsequent ffs_release_dev() would dereference
the freed dev.  The now unreached ffs_release_dev() wrapper is dropped;
its remaining callers use _ffs_release_dev() with the lock held.

The race was reproduced with a multi-threaded harness racing configfs
mkdir/rmdir of the ffs instance against mount/umount of functionfs on
a KASAN kernel: the unpatched kernel reports the use-after-free
reliably (2/2 runs), the patched kernel survives an extended soak with
identical churn (2/2 runs clean).

Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6227549bd2c8a1ec8ba0
Fixes: 5920cda627688c ("usb: gadget: FunctionFS: convert to new function interface with backward compatibility")
Signed-off-by: Mohammad Mosafer <mohsafer@gmail.com>
---

Changes in v2:
- Re-read ffs->private_data under ffs_dev_lock in ffs_data_put(): the
  unlocked argument read raced with a concurrent ffs_free_inst() freeing
  the dev while the putter waited on ffs_dev_lock (flagged by the
  Sashiko review bot).
- Drop the now-unused ffs_release_dev() wrapper.
 drivers/usb/gadget/function/f_fs.c | 31 ++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c64a268e98a4..960b73dc06b3 100644
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
@@ -4147,8 +4154,17 @@ static void ffs_free_inst(struct usb_function_instance *f)
 	struct f_fs_opts *opts;
 
 	opts = to_f_fs_opts(f);
-	ffs_release_dev(opts->dev);
+
+	/*
+	 * Release and free the dev under a single ffs_dev_lock critical
+	 * section. Between ffs_release_dev() and _ffs_free_dev() the dev
+	 * would still be on the ffs_devices list while already unmounted,
+	 * so a concurrent ffs_acquire_dev() could link a fresh ffs_data to
+	 * the doomed dev, leaving it with a dangling ->private_data that is
+	 * dereferenced in ffs_closed() when that mount is torn down.
+	 */
 	ffs_dev_lock();
+	_ffs_release_dev(opts->dev);
 	_ffs_free_dev(opts->dev);
 	ffs_dev_unlock();
 	kfree(opts);
@@ -4363,10 +4379,11 @@ static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data)
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
@@ -4377,8 +4394,6 @@ static void ffs_release_dev(struct ffs_dev *ffs_dev)
 		if (ffs_dev->ffs_release_dev_callback)
 			ffs_dev->ffs_release_dev_callback(ffs_dev);
 	}
-
-	ffs_dev_unlock();
 }
 
 static int ffs_ready(struct ffs_data *ffs)
-- 
2.34.1

