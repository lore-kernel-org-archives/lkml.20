Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103933;
	b=AiHvdu/mYw0qpHiL3uuOeOFS1ZOSMrnfOveJdBrWyahxAdA4TITZGeHiG38kyVZbTc1G
	 xAiZNY69+GkeMfuHHhFMHBMnA4++xL4vF9/+DHMvfsSWY95vCi5j4jncHbpyPJ1eP4lmR
	 5ZhnXX4TOzOWWQsCejWQHx5W7d2iuA45urPTKp3fRLu07ka/O8mE0RShlNyEgk5KPNskk
	 V0sKO+Rlh4xKkq7Q2f/PoEjbvz+YPhA4ymIWbNLeekr+Vj/++Etra9MUY08VGnA21D5Ko
	 47pARSVvBxsKBvkX06Gmf8I/u/5meUfgJlDEHVaKv+dMP6ba+WAcYAivGjP0U7NC33A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=f6DkpoAZYfhjlemmT7eIoKZnqN8msFYR5WHaLUHZyBg=;
	b=zZvG3mIBIejP+u6bgUt2/uDl69kh6LltB+Gp0x5TFckjByUGWVGW37SE2Yj4c+S+T5ds
	 rAhlHvWijB7VnWRAKWjGlPQ056E475OWgZEy7k9ZmM5duGHpa9TK4P/SS8H6ClE2VcHjF
	 EXFSTXIbygURjen3+DJDbnSBorvmxUJwBHnPIZGfIE5Y5lK36MDumvKSTdpQdaArsu2zy
	 HHzN+racTVHeeoWQVl0QYGtmkDytRmm+3AyjjvL7mDHdDreOKVSQD2rKpAZLjx8lgcCUG
	 centVC7MHiV/bp/1DmNMl4S0/3YwQSxu8buXThnYkS26oJXmo+/kH7iVrTLPnmETrZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="KporA/UE";
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5513E606A337
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5513E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KporA/UE
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a60f90a924so173021b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793103933; x=1793708733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6DkpoAZYfhjlemmT7eIoKZnqN8msFYR5WHaLUHZyBg=;
        b=KporA/UE0hF4AqVv51d8+SnVDTfnAgsXrbZ0+DQ4lpTQmhoweRkdVnoqbtv2tX6Kog
         ogemRzJKO+/VsEMH8RRT4s9H6667tFO6B0AGlrBLT4rtNkyW5dLcMQKOCL1kIlFi2Z/H
         8kEHpnzJtEgvQHluocALv5fhsih91MCmYgW3o2AexvOI9bp3yd2rdmc37Ebc5E3CPx+u
         vlfxZidzaxHBa9u3jhbU/kEWKu6ZtHhT5a3LNWFCOqI/yblNP5rx4sBxSG/R0Xfll5NX
         nSoAUouPHVtwVIZB6uxsvv74S5cJLObqpScVI0yuplEGXqoYPxXujPFQWdyfyqXSx4Rn
         /tBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103933; x=1793708733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f6DkpoAZYfhjlemmT7eIoKZnqN8msFYR5WHaLUHZyBg=;
        b=Jza74ztU/r9wM6Y6pJgCSvYFSggSuvP4Ja/ZV+liBA1k7Lp2X2GKxN5nzoWmNV3DtK
         hUkNsFIoq/gWTtHxSUCrnrErZMmLwRzZgYmR9ZSheLC7JmHlcQ+lCmySh87zXBhz1LZH
         GEIWfJ67UUsK4Kfv+kJJedyRbxgGM5jS9au6zVPGM8x+E1GATQK1c3Rxb9S6dgr05kbf
         7gxN/XIwvcAxoNWkydwsKKAAe16K12abPjJI5Em4GQzn4tsCiHO9RjxdUlR0jxCdeV67
         UbqbDE9eCfpFTsBK2EzVKaWEwCw7d+mZvnPAuJrAR0oRMSLS4jg8sncC62rfr+dE0F0g
         Z8Hw==
X-Forwarded-Encrypted: i=1; AKwUvBylooGE29UjtAu9yQ2p/DYR9VEhXf4T09OehQm7U+p61bgAOYDLsAfzEbsL9N/j9aSCFI/1wVl5JIOKQLY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2rao9Ds2/RzRg+9KChGBNNINRlokhxpjO5n3fqVcBj9dTll4r
	2vmxmWd7UJy0UAge5zdpvT5MVrmjvfApjJj41zGtDVLImaiJHT38Jek5
X-Gm-Gg: AYBFou1htJ7XiEw+l0zBSKe/AkF/31YdpJ8b5k84wG0BPyNX3fQaPXYT2vT63MQIr2F
	ZjOOGolbxl72zUFK8sauri/FwIyxQ+vzi3qeqWez047Cbd5gC1WACs+4mPiL4gMGC04+/qgvf6J
	T63pXDals6W/6fTjKeoaDDiw+aMgUl5hqdWDTH08QgkHusqxuu4P53KGrJNh5jsX26QP+aod42z
	4HYTU9s3iw2ju/1pbRZJCS0U/Dnbml4fOeoK8ThGRDEvQZgRYn6dnhZrrh/zkGUInIh+n/x+bQ4
	U1rrEqZMCPwW17LEi2CAStF/5XLYP8MK4tMk3h6gJJ17NhkwcWmq4G45lxL2Eknjgh7CVrMoZKc
	hmWyEZSrcssSyibMbgdH4UdvQPmRMobDam1xg7pLngz0ftbM+7IK91B5r8og5F2HmQjLq3ZK4kt
	F4NwTnQwx+kxpCEspS2Mga2p0kLDOkf5kAP1PUPUvz3iK8hYSnrfzahVNuqESu/ZmO5Z1T1jpJ5
	wBTMSZCJ870dx6xiZz4/EvXP0qxYnmT+7CssVgo41Ah/qiB/uOSw1I64ubS8xDjfzXS8O8VvA==
X-Received: by 2002:a05:6a00:855:b0:891:6aeb:84fc with SMTP id d2e1a72fcca58-8a3683dd762mr7357903b3a.22.1793103932470;
        Tue, 27 Oct 2026 05:25:32 -0700 (PDT)
Received: from localhost.localdomain ([152.136.45.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c1f5091sm2244101b3a.54.2026.10.27.05.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:25:32 -0700 (PDT)
From: Qing Zhang <diasyzhangqing@gmail.com>
X-Google-Original-From: Qing Zhang <diasyzhang@tencent.com>
To: dm-devel@redhat.com
Cc: snitzer@kernel.org,
	mpatocka@redhat.com,
	agk@redhat.com,
	linux-kernel@vger.kernel.org,
	hackerowskiy@gmail.com,
	drifabdelmalekmohamedsaid@gmail.com,
	igorpetindev@gmail.com,
	syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com,
	Qing Zhang <diasyzhang@tencent.com>
Subject: [PATCH] dm: preserve outstanding device references across mode upgrades
Date: Tue, 27 Oct 2026 20:25:26 +0800
Message-ID: <20261027122526.281548-1-diasyzhang@tencent.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <db1a5df3-c7b7-9e63-73c8-e75659295171@redhat.com>
References: <db1a5df3-c7b7-9e63-73c8-e75659295171@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

