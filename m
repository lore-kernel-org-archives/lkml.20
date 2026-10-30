Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330270;
	b=TELa3TSsZWrBlhmec99+Nx8KvWat2ZYKjziEYTMIRsRtCu97cssGtLt3sFV9JSe+rTLs
	 XjHxJ2ZTjW7aMT/Qb9vhEWXHZUEGZaMUi7NuZq8RApc/tzOlfOSdHQloq5VJThRYWrW4W
	 gGlDCsX8rIT5Gph8nlPubOZoq35NzlcKcoghufX3vLq2dTAKQ8rNc2sOnzNZeKQxLujOY
	 NbYjR3BpubIBI1sgmuQccjbYKwk+whba+HPZsrgZqCQyNi8ldb/a1zuLu0Ow0Q6EzkYEw
	 mcNA07JCbnFOa4UN7/L56yjFLmEbmkA5kjGbvufu9BR+gOP7SXwW3d0sjWNnZSoOPXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330270;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=6SSm3w6tc1cADABTX0RBEh3nnTMBu7TSdsSHj8Bkkgk=;
	b=4RWYccf++NVc2UJ93QT1AJM1z3RNimirHHx8Bx1p1J5z0lGKzP1+vTgq6vVz5TaAsaak
	 GteeZnV0VbT+zAZgxspCF4nmfilIG8euLtImTA0dRgjgOGURu5wYFcMkkJjiiGmC2qumW
	 Jsi0S8Lvtq97yGKdC4YolbRXsLxS5ZAvvLyWB9o+EIrjW87HON9kCepfqCkBdhuwKXPHm
	 LD2ybHF4rmY9brGx7plUpCMQJEzKRf8xhhBNaU8f68L8kMW/Q2kapqPzmyvMIQO8Yc8jm
	 qf/i0SeinfE1iRIp4lGTgbzciXJpWJys02nEz0SWQnWL/jG4Dafr3WtZVA/dIak6sGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CAC606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1CAC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-54dbbf252cdso392806b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330268; x=1793935068;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6SSm3w6tc1cADABTX0RBEh3nnTMBu7TSdsSHj8Bkkgk=;
        b=xGfAX8BVJfAwmXnNtoLlR3cZ7pG5aj+LG3fo5SIupqS2SYyf3jyRipmUVeS49rc+qW
         a0ZGPWiFiJLeehdCwJP/SkjzKw7wrl+I9Go+fEXHA2C23o3FVAfJmssXOrRf6rb9Vflf
         9WkZaObOpmuust+rj+vy7eC79zkvTaROAW8iIjeZdkzjm4xLIGTMu4AAYiZRBiEVIqgf
         bQxSfl4JtKuS0zwiNtlMm/O/41TP1Cf3hExvGNWDh/hFuwsbeDCPR2HAqc3e3Vreh3TB
         TCuRH+6m4cqmnod4GMhE09TLyaoqL66h7v9wkPmitcPltjG82dblCUIh2VcReB43NUz6
         rnPA==
X-Gm-Message-State: AFq9FYK7WyUKDv5gd00IsVJunF2BU2f+/DLry3cstNL+vzt1a/6PlRrA
	cG9xRlu9Sq7HCK7jiaQrXk7hLQtJv3unOplSzN1eYYC+NrnwZq4Puc1eFv+bts9wAMZYG21qh5C
	xRzAK931nc8SH/gc7Ks9RZmc/Sqop/Q1TdSnoN69o6dWHObnZ8gLlXQ5GG+A=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1783:b0:4fb:ac9b:b06a with SMTP id
 5614622812f47-5640de0fc9emr769862b6e.48.1793330268689; Thu, 29 Oct 2026
 20:17:48 -0700 (PDT)
Date: Thu, 29 Oct 2026 20:17:48 -0700
In-Reply-To: <6a8cdbd6.dbb3a75c.7844.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae40c5c.b7bd089a.283bc.0002.GAE@google.com>
Subject: Forwarded: [PATCH] md/raid1: reject out-of-range raid_disks in setup_conf()
From: syzbot <syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] md/raid1: reject out-of-range raid_disks in setup_conf()
Author: gowtham398gs@gmail.com

mddev->raid_disks can be set from user space with SET_ARRAY_INFO and
is not bounded before RUN_ARRAY reaches raid1_run(). With a very large
value, setup_conf() asks the allocator for more than KMALLOC_MAX_SIZE
when allocating conf->mirrors, and the allocator warns:

  WARNING: mm/slub.c:5459 at ___kmalloc_large_node
   setup_conf+0x15d/0x700
   raid1_run+0x109/0x250
   md_run+0x6c3/0xec0
   do_md_run+0x27/0x3b0
   md_ioctl+0x163f/0x1ca0

The array fails to start, but machines running with panic_on_warn
crash and syzbot keeps reporting it.

Fail early instead. Version 1.x metadata can describe at most 1920
devices, so use that as the upper bound, and test the sign before the
value is used. At that limit the allocations that scale with
raid_disks (conf->mirrors, the r1bio mempool element and the resync
buffers) stay well below KMALLOC_MAX_SIZE.

Reported-by: syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=75f49ec552cc74d9d69b
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Signed-off-by: Gowtham S Bhushan <gowtham398gs@gmail.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
---
 drivers/md/raid1.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index f0646fb24371..1cfe983167de 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -48,6 +48,13 @@ static void allow_barrier(struct r1conf *conf, sector_t sector_nr);
 static void lower_barrier(struct r1conf *conf, sector_t sector_nr);
 static void raid1_free(struct mddev *mddev, void *priv);
 
+/*
+ * Version 1.x md metadata keeps a 256-byte header and then 2 bytes per
+ * device in a 4096-byte block, so no array described by it can have more
+ * devices than this. Arrays created through the ioctl alone have no
+ * on-disk limit, so apply the same cap to them.
+ */
+#define RAID1_MAX_DISKS	((4096 - 256) / 2)
 #define RAID_1_10_NAME "raid1"
 #include "raid1-10.c"
 
@@ -3051,6 +3058,11 @@ static struct r1conf *setup_conf(struct mddev *mddev)
 	size_t r1bio_size;
 	int err = -ENOMEM;
 
+	/* raid_disks comes from user space and sizes the allocations below */
+
+	if (mddev->raid_disks <= 0 || mddev->raid_disks > RAID1_MAX_DISKS)
+		return ERR_PTR(-EINVAL);
+
 	conf = kzalloc_obj(struct r1conf);
 	if (!conf)
 		goto abort;
-- 
2.56.0

