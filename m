Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485054;
	b=gheZAtkztI2ZScgFcyVBAQr+9wHtPuJ2SC5xDLbkaEgFynIU+yIxs/bH9GXR/PELKKsy
	 bH8Qdx1+/GVTBJqNp1r+bR012su4q96i8mEcRp/jh+uWYSx6UN169wWl65XPmekjM7DRc
	 ME1Yf0eP+JirSSE+tb0+rpoXT28QsJfum3zrC9r+JMVxJ81s9E3VuPfBg37s7LpCHqeUh
	 TjhEmqVHfqkL3UnPboWRZaNSIyTmTZ35qR7lj7QSPYy+uKYThZ2at+8D/uwTI827zf+yz
	 igH2Au+7R+8EHUFf6IGKsUcLw8hYl6OWdXvUW855yvufOPZiCMcbVRvynU/+wndcqVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485054;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=aCWNPsJymC2fp4gzJndbp78M6r3pyeyfQP7eP8i0JKE=;
	b=fA20B7ctU98OvuEd80J0ScaXka4qcIjFKLEA4aP2XXJwJExcfHceB7Tixc3xrJO+GU33
	 05Ug8XvBXXcErIhb+j7jWJSkTmXps705BFsn17rBPnWRUvc0T8GGx0tH0x2U2cfC/GZ5Q
	 tFisjgHkbjzQ7X5XoQbzodpKTnQLmrQqemdO98WIYyh9X6Pz4cep0B1aSLfbWdj73ULrr
	 M43oAosO2UZDqek4nG6n6TBmZ/5z1pZh5vaMxLv5a6AFI1tLvXPcS/rwLTTQGrFQjo5CX
	 oqUqrgNwWpsILnZ/2TVxuTlnWJ0KKVU+eLxjimb7L2YQtAMFfqqOUbMKjqWKNAP313Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38210606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38210606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c734afb8deso4505799b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485053; x=1793089853;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aCWNPsJymC2fp4gzJndbp78M6r3pyeyfQP7eP8i0JKE=;
        b=poPDcAM9JDrElPNHTDnIFRhrwBTQ3/aTnq3uEtF7Vw+5/SDv2xtzWl9fq+yZStTFaU
         FLq2VXLTYnDp2nvN68UxhUCLQIN3RlXGBH9sPXJzQbwtO42tiaEgQ3p3bZGMugeiJLo/
         eDVJniUtBlylLA2CD35xdizHLvG57sGChRna43kx1GUuaNZ61bAOr5PkWfQUgBv39G1z
         nLBTW7lrlB7BxMo/3TEuhRN3duKUm/Xpd0b/2ORO3VaPL50kAgMJoZGddpoZNH+uNwbb
         INyTufwMsCrT3tfIbZ1mfNwnQHNj94wp85t+WOszMWgkQBSt6D4xE7A4zMND7xmwWeNX
         o8gg==
X-Gm-Message-State: AFq9FYKk0z8ZPzvT2MV7ZUDf4pcDjJkdVXSzWtyZSJhAb8tAlro3+re9
	CYf8BMK0pDoy6w0sqYdlIRxFyTfa7xZ7qT/E+kmntYPiCy6Yh9inkWFp117nYG2MTyRbrwfNe+7
	USxg4KHM5wj5OC9xqMONwqWSCTegNJQ6dzdaymyq8k+HuA/MrjeWjxET1R74=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3084:b0:533:72c7:f80c with SMTP id
 5614622812f47-53cd63bfbd7mr9002967b6e.42.1792485053299; Tue, 20 Oct 2026
 01:30:53 -0700 (PDT)
Date: Tue, 20 Oct 2026 01:30:53 -0700
In-Reply-To: <6a9b3f7a.2e649fcc.1e1977.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad726bd.5c73e770.1a06c9.00f6.GAE@google.com>
Subject: Forwarded: [PATCH] ocfs2: fix use-after-free in o2hb_region_dev_store
From: syzbot <syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] ocfs2: fix use-after-free in o2hb_region_dev_store
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master



Two tasks can concurrently write to the same region's "dev" configfs
attribute, each through its own open fd. configfs does not serialize
separate fds against each other here.

The only guard against a second writer is an unlocked check near the
top of o2hb_region_dev_store():

    if (reg->hr_bdev_file)
            return -EINVAL;

This check happens well before hr_bdev_file is actually assigned;
several validation steps and an fd lookup sit in between. If a second
task runs this same check before the first task has assigned
hr_bdev_file, it also reads NULL and also proceeds.

Both tasks then call o2hb_map_slot_data(), which allocates
reg->hr_slot_data, and later, on any failure, o2hb_unmap_slot_data(),
which frees it. Since hr_slot_data is also unprotected, one task can
free it through its failure path while the other task is still
populating the array, producing the use-after-free reported by syzbot.

Race flow:

  T1: dev_store()                      T2: dev_store()
  if (reg->hr_bdev_file)  // NULL      if (reg->hr_bdev_file)  // NULL
  ...                                  ...
  reg->hr_bdev_file = ...
  o2hb_map_slot_data()
    alloc reg->hr_slot_data
    populating slots...
                                       reg->hr_bdev_file = ...
                                       o2hb_map_slot_data()
                                       failure -> out:
                                         o2hb_unmap_slot_data()
                                           frees reg->hr_slot_data
  writes to freed slot data  <-- UAF

Fix this by adding a per-region mutex, taken at the top of
o2hb_region_dev_store() before any region state is modified and held
until the function returns.

Reported-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3025e3e8fc0b928af8f5
Assisted-by: Claude
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
v2:
 - Expanded the description with the race flow
 - Updated Fixes: tag
 - Use tab for indentation
 - Dropped locking in o2hb_region_release(); configfs already
   serializes store and rmdir
 - Take the lock before the hr_node_num assignment, using
   guard(mutex) so every early return releases it
---
 fs/ocfs2/cluster/heartbeat.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index 1c3def99bb07..e20ef0459f54 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -273,6 +273,8 @@ struct o2hb_region {
 
 	/* last hb status, 0 for success, other value for error. */
 	int			hr_last_hb_status;
+	/* Serializes concurrent writers of the "dev" attribute */
+	struct mutex		hr_dev_write_mutex;
 };
 
 static inline struct block_device *reg_bdev(struct o2hb_region *reg)
@@ -1879,6 +1881,8 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
 	ssize_t ret = -EINVAL;
 	int live_threshold;
 
+	guard(mutex)(&reg->hr_dev_write_mutex);
+
 	if (reg->hr_bdev_file)
 		return -EINVAL;
 
@@ -2149,6 +2153,8 @@ static struct config_item *o2hb_heartbeat_group_make_item(struct config_group *g
 
 	config_item_init_type_name(&reg->hr_item, name, &o2hb_region_type);
 
+	mutex_init(&reg->hr_dev_write_mutex);
+
 	/* this is the same way to generate msg key as dlm, for local heartbeat,
 	 * name is also the same, so make initial crc value different to avoid
 	 * message key conflict.
-- 
2.43.0

