Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103729;
	b=DeaYfxu90wNk1oyDMfSuvrmrFvl8riJv+zK1168tDhGw+CAYjsuQ4CPNkhHBUT0uceg2
	 jUXcuazxrQV4ZnI9UvL6PBT4qxfQN9ay14dx/gP5Oz7t9EhOTfs8FNvLD/bHa3VtKHFSV
	 eGJN9ILgOyuMMiP+TYYD/+GVYcbZs8g+FbmAliN8Ze2Ac2g6BCUca57pCT1+0xjUj5Wf8
	 LhguEiEvZxF0D3k/oL+UOIjovcQYv3R9DU3wrXehWWU85nemabnxxdgbNUzfF8sBpWCJe
	 uIYGf9WqePST36hJO1O60ENFdCqEUZJwDFLYYuukNSqbgK/HWbA94/2aJ7DbM8SXKRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103729;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=0NNRrj+SYYD7PDEkbH3ZM2muDnO5g/UBAogonlUnHQU=;
	b=TXHoPPwVOx0IARV1sMVZR+Pq4rvbt56F2wZDehmHNCQWmk4J2tU8amJiUEB/TfC05Wgg
	 UKSnZb89GyeHa024RjKX8TSKv1/Iel6Ph323vBsZZKLdRspRR0ACm6GwD1HKU7Ap/5zZS
	 wTpcsyJzauEtpZQuew1GYDXuhwnWlTg5KVKQTOI8jCwSgpfMHFGN8vBOZv1qf1sbb8EUi
	 Ulum25Q7znxjJDE1EEDFcZUtUGnpAH5l6zupkqe67ZUkhSIB2y5KtLPbnQe17xCA+ZjVl
	 bQoDnRLXFREVqNt8eJfQuArSDcFfOTH4JgunfByUs3H0IvmpvflPiUE+cHyavztx07A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC0E606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC0E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4e778acdbc6so6228745b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103728; x=1793708528;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0NNRrj+SYYD7PDEkbH3ZM2muDnO5g/UBAogonlUnHQU=;
        b=aDEOPFOjKPYMlT24/LSyox1TUotwbSwvyeuGwjbg2AYtQgxg9cRf25fPMDo1EczLzr
         a0MQlap6nlYF/14N5TcDoIjkUVIjjtIYpm7B46StFUvkCtjFYrxRIupWbBqaIhtOMSEM
         zS7xjwp0S5gK479TlKnvhc6kk5i+HbMsYAw5g9OhnZStYa7km0RF9DK4T8UkCk0mUuqy
         aYyiQt2DZihAiUHeaDizpB8MJX2/wJ/S0cD3SJp+HLE/25KKaUOAOgXHcyu4GyObxVG8
         ekFsSIQ0czoCtFL4uljOLNWmbRJK6UDnmSZaWGF/99TaRXq7ZFWFPHaz5TGTlT6oq0lS
         w/ow==
X-Gm-Message-State: AFq9FYLyab9QeQp4GlX5DPL9aw87ZQN9u2yao6FbKgdM373xcRxLJrRS
	EoX+qadOUoiRbzyxq5WuHEnUCDjjeR8m7xAtj9QhAiamg5hRNdx90A1+oxuu6gy3sCXWSsQSWGo
	D3SiCeQuzULcrAybVyrNZNkmUOq+yU/SPOIXpUFxIB8xdWTFiWYSXk49HvXc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1301:b0:4cb:818f:d571 with SMTP id
 5614622812f47-55c0025b87bmr7122365b6e.25.1793103728505; Tue, 27 Oct 2026
 05:22:08 -0700 (PDT)
Date: Tue, 27 Oct 2026 05:22:08 -0700
In-Reply-To: <6adeb5ac.a6443767.132891.0053.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae09770.403b7334.342f87.0004.GAE@google.com>
Subject: Forwarded: [PATCH] dm: preserve outstanding device references across
 mode upgrades
From: syzbot <syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] dm: preserve outstanding device references across mode upgrades
Author: diasyzhangqing@gmail.com

dm_get_device() keeps one dm_dev_internal entry per dev_t. When a later
caller requests the same device with additional modes, upgrade_mode()
opens a new table device (table devices are keyed by (dev_t, mode)),
points dd->dm_dev at it and releases the old one.

The pointer returned by the first dm_get_device() call is still held by
the target, e.g. pool_ctr()'s metadata_dev or thin_ctr()'s
tc->origin_dev, so releasing the old table device frees memory that is
still in use and reading e.g. metadata_dev->bdev is a use-after-free.
dm_put_device() can then no longer match the stale pointer either, so
its reference leaks. The old device cannot be widened in place: its
bdev may be accessed concurrently and the dm_dev may be shared with
another table, so it has to stay valid until its holder releases it.

Instead of releasing the replaced dm_dev in upgrade_mode(), keep it on
a list on the dm_dev_internal entry. dm_put_device() matches both the
current and retained pointers, and all associated table devices are
released once the entry's reference count reaches zero, including when
free_devices() tears down a table whose devices were not all put. If
acquiring the upgraded device fails, leave the existing entry unchanged.

This affects any target that opens the same device twice with different
modes, such as the thin-pool metadata/data and thin pool/external-origin
arguments reported by syzbot.

Fixes: 86f1152b117a ("dm: allow active and inactive tables to share dm_devs")
Reported-by: syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=83827f9a59abe148bff4
Signed-off-by: Qing Zhang <diasyzhang@tencent.com>
---
#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Fixing this in dm_get_device() itself, as you suggest, also covers the
same-device mode-upgrade instances in the other targets, so a single
change closes them all.  Verified with the syzbot reproducer: the
unpatched modules hit the pool_ctr use-after-free within a few
iterations, the patched modules run the same reproducer clean, with no
KASAN reports and no leaked table-device references.

 drivers/md/dm-table.c | 53 +++++++++++++++++++++++++++++++++++++------
 drivers/md/dm.h       |  1 +
 2 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index a483f49dd4ce..f64db28aa15c 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -163,6 +163,24 @@ int dm_table_create(struct dm_table **result, blk_mode_t mode,
 	return 0;
 }
 
+struct dm_dev_old {
+	struct list_head list;
+	struct dm_dev *dm_dev;
+};
+
+static void put_table_devices(struct dm_dev_internal *dd,
+			      struct mapped_device *md)
+{
+	struct dm_dev_old *old, *tmp;
+
+	list_for_each_entry_safe(old, tmp, &dd->old_devices, list) {
+		dm_put_table_device(md, old->dm_dev);
+		list_del(&old->list);
+		kfree(old);
+	}
+	dm_put_table_device(md, dd->dm_dev);
+}
+
 static void free_devices(struct list_head *devices, struct mapped_device *md)
 {
 	struct list_head *tmp, *next;
@@ -172,7 +190,7 @@ static void free_devices(struct list_head *devices, struct mapped_device *md)
 		    list_entry(tmp, struct dm_dev_internal, list);
 		DMWARN("%s: dm_table_destroy: dm_put_device call missing for %s",
 		       dm_device_name(md), dd->dm_dev->name);
-		dm_put_table_device(md, dd->dm_dev);
+		put_table_devices(dd, md);
 		kfree(dd);
 	}
 }
@@ -313,17 +331,23 @@ static int upgrade_mode(struct dm_dev_internal *dd, blk_mode_t new_mode,
 			struct mapped_device *md)
 {
 	int r;
-	struct dm_dev *old_dev, *new_dev;
+	struct dm_dev *new_dev;
+	struct dm_dev_old *old;
 
-	old_dev = dd->dm_dev;
+	old = kmalloc_obj(*old);
+	if (!old)
+		return -ENOMEM;
 
 	r = dm_get_table_device(md, dd->dm_dev->bdev->bd_dev,
 				dd->dm_dev->mode | new_mode, &new_dev);
-	if (r)
+	if (r) {
+		kfree(old);
 		return r;
+	}
 
+	old->dm_dev = dd->dm_dev;
+	list_add_tail(&old->list, &dd->old_devices);
 	dd->dm_dev = new_dev;
-	dm_put_table_device(md, old_dev);
 
 	return 0;
 }
@@ -392,6 +416,7 @@ int dm_get_device(struct dm_target *ti, const char *path, blk_mode_t mode,
 		}
 
 		refcount_set(&dd->count, 1);
+		INIT_LIST_HEAD(&dd->old_devices);
 		list_add(&dd->list, &t->devices);
 		goto out;
 
@@ -451,6 +476,20 @@ static int dm_set_device_limits(struct dm_target *ti, struct dm_dev *dev,
 /*
  * Decrement a device's use count and remove it if necessary.
  */
+static bool device_matches(struct dm_dev_internal *dd, struct dm_dev *d)
+{
+	struct dm_dev_old *old;
+
+	if (dd->dm_dev == d)
+		return true;
+
+	list_for_each_entry(old, &dd->old_devices, list)
+		if (old->dm_dev == d)
+			return true;
+
+	return false;
+}
+
 void dm_put_device(struct dm_target *ti, struct dm_dev *d)
 {
 	int found = 0;
@@ -458,7 +497,7 @@ void dm_put_device(struct dm_target *ti, struct dm_dev *d)
 	struct dm_dev_internal *dd;
 
 	list_for_each_entry(dd, devices, list) {
-		if (dd->dm_dev == d) {
+		if (device_matches(dd, d)) {
 			found = 1;
 			break;
 		}
@@ -469,7 +508,7 @@ void dm_put_device(struct dm_target *ti, struct dm_dev *d)
 		return;
 	}
 	if (refcount_dec_and_test(&dd->count)) {
-		dm_put_table_device(ti->table->md, d);
+		put_table_devices(dd, ti->table->md);
 		list_del(&dd->list);
 		kfree(dd);
 	}
diff --git a/drivers/md/dm.h b/drivers/md/dm.h
index 7a795979ec72..037d6cdf2f1c 100644
--- a/drivers/md/dm.h
+++ b/drivers/md/dm.h
@@ -42,6 +42,7 @@ struct dm_dev_internal {
 	struct list_head list;
 	refcount_t count;
 	struct dm_dev *dm_dev;
+	struct list_head old_devices;
 };
 
 struct dm_table;
-- 
2.43.7

