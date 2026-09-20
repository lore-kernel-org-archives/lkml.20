Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3851C432E6F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930308; cv=none; b=EtV++wKNXTWYSAB35Bp2lQ0swGu9o/bHDCHcUeCwHAV2an/HZWfLqagSWNHeUtT+UQHBSRH/EAI24MNNPQ5VZEOH2ZV9SD3wWFU+TSXHqrrflBBbG+OZe1l1olxm2vlG8OMSfJjwt1U1eCWoCxqqAhbEuKK3OTlpToZ2OTkKLuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930308; c=relaxed/simple;
	bh=rUVcxhrXJoGpK/Yo/IPsRAGLJ2d3136PmD6TrZkNxBc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KFPuqBiTfGAXo9qj3TwjRkbk6D0XTh1MtAWwAoS0grnavXHX9VXipZro6oXlwtqlhCvHrsS5gpjkzDZLq2B+0GtsyqcxMY4Fmf89eUeMJW5E7bDMRya48C3n1OQwCf2i76cR4JzwpY5j5IJwfiRns4AH7Z+IuiWoPS/7qG8KW1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in; spf=pass smtp.mailfrom=thechris.in; dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b=WCC9tg6W; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thechris.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b="WCC9tg6W"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba92so2073568a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789930306; x=1790535106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C3PcdtvDhtWk0resd1+mjtW2Liv65ZiOwtUfq+Snr3M=;
        b=WCC9tg6WnmuYTULuFtd7iOCZi6JTuisfkCAC7FW5sLfkQPdBhDOK1xW0chQNVYPfuh
         yAPMlvb5J1uPIqbfNzbNVxpMUSKfjFFWdJ2zRYFmn/gVeFdVA2kZ30gYBHzfKQrtLc6d
         rN1PW4JokgVEYRprvTOrxjwof+bmjJMhhZ9oc5dhti5PmxPVyqWv3rzeIRG05duxW55i
         OdKCOpYAxavedmdxaBMueM1anEzgnApS5DzOoYzWlEQp7AQtw1fzCF0jKZv+I9pKXAoG
         WcpXB3niLx5qvJj3KqN5SYSWaqGER8RkL+mB/flQgWNwJA3VjxncsVH67iFpDvNq3cbk
         qt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789930306; x=1790535106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C3PcdtvDhtWk0resd1+mjtW2Liv65ZiOwtUfq+Snr3M=;
        b=FaJNKhs4IbKSMitFo9qWJYFCIjYDW/NcvtSWgujBDSHQrAM3SxKAkB6XX8L+OV1D7C
         ErGzCkrvyCb0imYLjvk8I6LCGbkcjSVqLqYKGj7+r6t46yH3+aozG/oCEZR+ur5jPhbM
         cqPR+bd05UVWvjHG9t2GOk5A36fbbkR5pkoNx6JhvOiFy9Nxt4J/yJeMRUXIx/DtzmOH
         f9L4hFl1m5jrYDJ7oKUL+gLaXVV5NTK+bJ5aKUWTZiPrBDFUXxUADHzjeFwy5VhveSIq
         p7wJZE5pQaKfd5RrU83+CiPDG80zUKlMG5VU7BYFXrQ2RLJkdAlMH3F1fHV7MGQNNuH5
         7eHg==
X-Forwarded-Encrypted: i=1; AKwUvByYNIN7HRvEpJ9wxO0UmHvEw1Yv/gBwiGRIWnEXSJ8FC65Q4f/wP/y4DhfqwpH/i9SXSOgP3J+TGvAafmA=@vger.kernel.org
X-Gm-Message-State: AFuF++lUk/Qjp69RdWKaL1ZnDxPqgEivnUduYRZjsgosKDOH4VFmUq9U
	deVdqaxy17/lu+q8CE2wZQsJvM4WkT7zgrXaRpqxVJ909gaE7RQ84oG4nFmEwD03m/I1
X-Gm-Gg: AYBFou3l1wbOltO6xATs2hj+kELK4vTgeHk7LXRrZEfU+9FqRh6vFJXNWTdQkiELSmf
	B1dIE/XvkSqE3LyIxK8OZev0Pzs8Tk1HC07CSWNLEfwl3f2JnX5Sr9LGae5pVuB/ihD08D9aEW8
	9NVT962lEWWRAjFCA6jE3bT6Xjc6wCMBvTgZvIDZwMBckmH3RHtdPrP0tTAfVqiLae4YimElfuW
	tF9cymRI+wnXYqwFVKenGPM4toZn+KOzkDhwDLF87crcAP+sMZEjwWoe0F07lMue5e/BGezBZkx
	8IzaiWrxa7wWSON5IDwhK2rDNXr/IVXFWwIn+mnf+G9C9INC7gmG/ZOwK0f0nj6sTbuMaTeNmhO
	PyN+sYXN0l9tuXrkp7aXKzEIhVLN129XTaFtRectc1MmGKy1rMDbS+72OLbyQHsXC6UXUryPsJ1
	PpDJwc+PqJtdzz185cwP/pLn9ylBQ0TfqYuyCLQiV4K3Qj68wOr4rD9xyIQ9NOpGlPaseeVFq44
	dop4wQbD3ct1GqGm8zjMmV5TSvlk6g2/QEO94qS7cyXhgA/a7xftuFfuWd6eiqZ7lzQoF0P2tg=
X-Received: by 2002:a17:90b:4a85:b0:39e:6a80:dd9b with SMTP id 98e67ed59e1d1-39e6a810c53mr7579979a91.34.1789930306330;
        Sun, 20 Sep 2026 11:51:46 -0700 (PDT)
Received: from devils-dell.. ([2405:201:8004:88ab:1946:9b98:4be:3aba])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm10240765a91.4.2026.09.20.11.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:51:45 -0700 (PDT)
From: Chris Roy <iam@thechris.in>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	joern@barelysecure.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Chris Roy <iam@thechris.in>
Subject: [PATCH v4] mtd: block2mtd: defer device open out of param/sysfs write
Date: Mon, 21 Sep 2026 00:21:32 +0530
Message-Id: <20260920185132.1266699-1-iam@thechris.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6aa178fc.f2639fcc.29487d.0008.GAE@google.com>
References: <6aa178fc.f2639fcc.29487d.0008.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

block2mtd_setup() opens the named block device while still under
param_lock, and on the sysfs write path under kernfs (and possibly a
splice pipe lock). That nests VFS locking the wrong way relative to
overlayfs and trips lockdep.

Drop param_lock and run setup on a dedicated ordered workqueue. Keep
the call synchronous with wait_for_completion(). Allocate the work on
the heap so DEBUG_OBJECTS_WORK stays quiet.

Reported-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7cab6a19619f1b8efc00
Tested-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com
Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Chris Roy <iam@thechris.in>
---
v4:
 - rename list_mutex / setup_wq to say what they are for
 - tidy new comments
 - fix Assisted-by tag format (checkpatch: AGENT_NAME:MODEL_VERSION)
 - drop redundant setup_wq check in block2mtd_setup_defer() (the sole
   caller already gates on it)
 - claim Tested-by from syzbot (granted on v2, v3, and this content)
v3:
 - rewrite the new comments to match the rest of the file
 - add Assisted-by
v2:
 - heap-allocated work (v1 tripped DEBUG_OBJECTS_WORK)
 - dedicated ordered workqueue instead of system_wq
 - module reference across the deferred open
 - flush/destroy the workqueue before exit teardown
 - serialize setup2 on the worker under list_mutex
 - early-boot paramline updates under that mutex

Not proposed for stable. block2mtd has no known production use (per
Richard Weinberger, testing is the only real use case), so there is
no backport trail worth chasing here.

 drivers/mtd/devices/block2mtd.c | 116 ++++++++++++++++++++++++++------
 1 file changed, 95 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 03e80b2..a540089 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -27,6 +27,8 @@
 #include <linux/init.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mutex.h>
+#include <linux/workqueue.h>
+#include <linux/completion.h>
 #include <linux/mount.h>
 #include <linux/slab.h>
 #include <linux/major.h>
@@ -45,6 +47,9 @@ struct block2mtd_dev {
 
 /* Static info about the MTD, used in cleanup_module */
 static LIST_HEAD(blkmtd_device_list);
+/* Protects blkmtd_device_list and early-boot paramline updates */
+static DEFINE_MUTEX(list_mutex);
+static struct workqueue_struct *setup_wq;
 
 
 static struct page *page_read(struct address_space *mapping, pgoff_t index)
@@ -461,31 +466,85 @@ static int block2mtd_setup2(const char *val)
 	return 0;
 }
 
+struct block2mtd_setup_work {
+	struct work_struct work;
+	struct completion done;
+	char *val;
+	int ret;
+};
+
+static void block2mtd_setup_workfn(struct work_struct *work)
+{
+	struct block2mtd_setup_work *w =
+		container_of(work, struct block2mtd_setup_work, work);
+
+	mutex_lock(&list_mutex);
+	w->ret = block2mtd_setup2(w->val);
+	mutex_unlock(&list_mutex);
+	complete(&w->done);
+}
+
+/* Runs block2mtd_setup2() on setup_wq, blocking until it completes */
+static int block2mtd_setup_defer(const char *val)
+{
+	struct block2mtd_setup_work *w;
+	int ret;
+
+	w = kzalloc(sizeof(*w), GFP_KERNEL);
+	if (!w)
+		return -ENOMEM;
+
+	w->val = kstrdup(val, GFP_KERNEL);
+	if (!w->val) {
+		kfree(w);
+		return -ENOMEM;
+	}
+
+	init_completion(&w->done);
+	INIT_WORK(&w->work, block2mtd_setup_workfn);
+	queue_work(setup_wq, &w->work);
+	wait_for_completion(&w->done);
+
+	ret = w->ret;
+	kfree(w->val);
+	kfree(w);
+	return ret;
+}
 
 static int block2mtd_setup(const char *val, const struct kernel_param *kp)
 {
-#ifdef MODULE
-	return block2mtd_setup2(val);
-#else
-	/* If more parameters are later passed in via
-	   /sys/module/block2mtd/parameters/block2mtd
-	   and block2mtd_init() has already been called,
-	   we can parse the argument now. */
-
-	if (block2mtd_init_called)
-		return block2mtd_setup2(val);
-
-	/* During early boot stage, we only save the parameters
-	   here. We must parse them later: if the param passed
-	   from kernel boot command line, block2mtd_setup() is
-	   called so early that it is not possible to resolve
-	   the device (even kmalloc() fails). Deter that work to
-	   block2mtd_setup2(). */
-
-	strscpy(block2mtd_paramline, val, sizeof(block2mtd_paramline));
+	int ret = 0;
 
-	return 0;
+	if (!try_module_get(kp->mod))
+		return -ENODEV;
+
+	kernel_param_unlock(kp->mod);
+
+#ifndef MODULE
+	mutex_lock(&list_mutex);
+	if (!block2mtd_init_called) {
+		/* Cannot resolve block devices this early */
+		strscpy(block2mtd_paramline, val, sizeof(block2mtd_paramline));
+		mutex_unlock(&list_mutex);
+		kernel_param_lock(kp->mod);
+		module_put(kp->mod);
+		return 0;
+	}
+	mutex_unlock(&list_mutex);
 #endif
+
+	if (setup_wq) {
+		ret = block2mtd_setup_defer(val);
+	} else {
+		/* Not yet deferred to setup_wq; safe to call setup2 directly */
+		mutex_lock(&list_mutex);
+		ret = block2mtd_setup2(val);
+		mutex_unlock(&list_mutex);
+	}
+
+	kernel_param_lock(kp->mod);
+	module_put(kp->mod);
+	return ret;
 }
 
 
@@ -496,10 +555,17 @@ static int __init block2mtd_init(void)
 {
 	int ret = 0;
 
+	setup_wq = alloc_ordered_workqueue("block2mtd", 0);
+	if (!setup_wq)
+		return -ENOMEM;
+
 #ifndef MODULE
+	mutex_lock(&list_mutex);
 	if (strlen(block2mtd_paramline))
 		ret = block2mtd_setup2(block2mtd_paramline);
+	/* Avoid racing sysfs with the early paramline */
 	block2mtd_init_called = 1;
+	mutex_unlock(&list_mutex);
 #endif
 
 	return ret;
@@ -510,9 +576,16 @@ static void block2mtd_exit(void)
 {
 	struct list_head *pos, *next;
 
-	/* Remove the MTD devices */
+	if (setup_wq) {
+		flush_workqueue(setup_wq);
+		destroy_workqueue(setup_wq);
+		setup_wq = NULL;
+	}
+
+	mutex_lock(&list_mutex);
 	list_for_each_safe(pos, next, &blkmtd_device_list) {
 		struct block2mtd_dev *dev = list_entry(pos, typeof(*dev), list);
+
 		block2mtd_sync(&dev->mtd);
 		mtd_device_unregister(&dev->mtd);
 		mutex_destroy(&dev->write_mutex);
@@ -522,6 +595,7 @@ static void block2mtd_exit(void)
 		list_del(&dev->list);
 		block2mtd_free_device(dev);
 	}
+	mutex_unlock(&list_mutex);
 }
 
 late_initcall(block2mtd_init);
