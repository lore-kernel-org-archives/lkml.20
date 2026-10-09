Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC102EEE83
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 05:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523310; cv=none; b=NUbyGBDM1s2QHDp665tBhZRU1S2tysxLx/lHglSzD7kMx8Uv/RXJdj5qbZARbb9KSdjhkqHXY3HRAZjw5ZSAG898aRgjO3k43iBPeHhjiTI5haQUHUWqgnN+uncTTw0eDAcitQ/+Ca4xK4BtT0qX5iX0HXkvTGtG7fr4otiJwCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523310; c=relaxed/simple;
	bh=GRj9pTV00s1yPxP53I4E1kwwwxMrjXiHC9bHI2p2RvM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iUw89OzIIWhN0BUJEi/cWXsIi8P2yjOv1XVfw++ULqT1QbKU6nU7SDcmvmtIZ/sZhgVprXBtf0u9HnlT96GLe2vT7o0myqzXgVcslutr3xKDHzdNRQQmrv03367MUDTUdQRSiq15UO3RyLl1L1fDbf6csq3o23VPxU1ykmRnARE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hn0LpgOz; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hn0LpgOz"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-887beafb714so2106374b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791523308; x=1792128108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KoRrsoveKcsTS8cAXDbOoURKgA5JJLzDOytuW3dWWAc=;
        b=hn0LpgOzVXbU8gxDUQyzt3u55gnOLo4apgnVOq9TXB5gT0rQMOEWLNYf48YWQ3Nvvi
         E3F8knjLoc61BvjIaPGLgkAFIAP2W/HTq0Dt0MKQN2Q5B/1qKEgRKNkXdDhb6hQNeuh5
         QEL2lGq6WQckfFSv5lvqaJNzeH83WKvWzaeDwetSDPgTLMyfHibMgm0bqQy8duwz0mI2
         ipEb/JZ2f7Fme1qzdA68UyNjaxuOb80YHvSdavW5QMfAckEkgpaTg66WpPTg6oRIudi1
         LaDYMypDwxTiwC6qcXLIFC0N0BZwIpi1F7ryIO1gWC5kQy6stttV+bhJyMdEZopW1syW
         HR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791523308; x=1792128108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KoRrsoveKcsTS8cAXDbOoURKgA5JJLzDOytuW3dWWAc=;
        b=2Jc4CtMyDjr1Pt1ATTh6Ww93Cn4PVmlVhErVbvq1Xh/+UR4peN8Mbkd0ArICVUBvW9
         PDp20Xn5t79R7jeKCedCynuRyjxBdvk6Qy1iHwmMbwhsSLZ+eoo6AmpBFkvg8D1X2ymC
         X/h+hSnRftDx28yPKlkkkl6huPlZ8GMgKduDxlaKhfJMUMUqAWvYAzK3THPvFQR73Hkr
         Puv4caGKv+UujJwSMXE8IRy6q1kQHpRXd6li2zNJ900TAKYpCdPk4ap+hD7c4LKO2uZQ
         BmRLgIi6iVVZUuN82IxHqGKlg0tfF/ChFcZ5AMhMHrI1HImKqjawuQQys5vxjT5KmanQ
         wqWw==
X-Forwarded-Encrypted: i=1; AKwUvBz0lxD9AnJU4Q2hA2zn37jXorsFwc1y9K2gX8ildQqAONuWXXQeIp4dlg8fI7RjqZPPI5obZh8ogFFrZqE=@vger.kernel.org
X-Gm-Message-State: AFuF++mBNPobH70tlNSVPufvcABfZp5vE5D2t8U0OkCkWuGUFnfjZILJ
	TLA4ls+S37OtZBJt4RjkjGZd7vLlypnVjhokQNie1BBYDeMY6cfguKJH
X-Gm-Gg: AYBFou2Luy2axngYIY9TGbb6CUbPjBaFjbL390M0SxxvFuz3QtOG/g1/0XyshxNBMk7
	JUJdZN9Z25eO4OYCA1Y4APh4G5zzkyGrqG2rObvPLP3p+5R4hT9KnNQCf9TJvd2FczUg4JuJntv
	YKJkBSiXkf1dtdsSl/dkTA+SRT62P2Kk8kzikGAJku+Uiyz+WVVH2x1hNMhYbGO8LQLIItq0plX
	5PnPDMSpxmsqHFnAiMcR2mmrODb4d7CATBmaz4t5Ro4RYoXzLU1Ca47uZmpbF5PgD97tosSPL21
	cDnQUrp2CQeLT5qZcdKhWy2csoHzCBKcpaQoIOqEB6onKA5CCOk0zpQG0O9CkVxk0wvsWkidOMn
	QODv3l1ON5Y2tCobfVNbyKCDib2SW0ojJQdahgxUal6woWvwyYZb33wRpFfxgn1snrYNGchTzhW
	ygbTLucM1BL7Qq3b66AGJ3BFvDPrd8lWiJ2n+QG1QElNliHAqcB4gslH87DELikxHgPRU=
X-Received: by 2002:a05:6a20:2d14:b0:3de:3f4d:f2dc with SMTP id adf61e73a8af0-3e16be89960mr590768637.17.1791523308169;
        Thu, 08 Oct 2026 22:21:48 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e41126sm392095a12.23.2026.10.08.22.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 22:21:47 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	akpm@linux-foundation.org,
	zzzccc427@gmail.com,
	ericterminal@gmail.com,
	kees@kernel.org
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: [PATCH v2] ocfs2/heartbeat: Unlink live slots when their node is missing
Date: Fri,  9 Oct 2026 13:21:42 +0800
Message-Id: <pm-ocfs2-objects-candidate-0058-v2-9446113c2b16c817c538@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

o2hb_shutdown_slot() returns immediately when its node is no longer
in the configfs registry. A slot can still be linked in o2hb_live_slots
when that lookup fails. Region teardown or startup-error cleanup then
frees the slot array without removing its embedded list member.

With the same peer live in another region, the next list update can
follow a predecessor into the freed array. Reusing the node number can
also make a later insertion encounter that stale member.

Always remove the slot under o2hb_live_lock, even when node lookup
fails. Preserve aggregate membership accounting and the last-region
DOWN callback: the existing callback interface explicitly permits a
NULL node for DOWN events. Only drop the node reference when lookup
returned one. This closes both normal release and startup-abort paths
without changing the publication or callback locking protocol.

Also require a configured node before admitting a new live slot in
o2hb_check_slot(). The early live-bitmap check is not held through
admission: the last live slot in another region can be removed in
between. Without a node, admission can then queue an UP event with
a NULL argument and hit the event helper's BUG_ON. Existing live
slots can still leave and generate NULL-node DOWN events.

A controlled probe-instrumented test reproduced this while stopping
one of two regions after removing the peer from configfs. Its KASAN
report includes:

  BUG: KASAN: slab-use-after-free in __list_del_entry_valid_or_report+0x1e0/0x210
  Read of size 8 at addr ffff888106a4ac60 by task o2hb-pmbd0058_b/497
  Call Trace:
   <TASK>
   dump_stack_lvl+0x93/0xd0
   print_report+0xce/0x630
   kasan_report+0xe0/0x110
   __list_del_entry_valid_or_report+0x1e0/0x210
   o2hb_do_disk_heartbeat+0x1591/0x2c50
   o2hb_thread+0x1ed/0xe70
   kthread+0x351/0x460
   ret_from_fork+0x659/0x940
   ret_from_fork_asm+0x1a/0x30
   </TASK>
  Allocated by task 491:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   __kasan_kmalloc+0xaa/0xb0
   __kmalloc_noprof+0x2de/0x780
   o2hb_region_dev_store+0x7c2/0x1b60
   configfs_write_iter+0x2f9/0x4f0
   vfs_write+0x639/0x1010
   ksys_write+0x111/0x200
   do_syscall_64+0x114/0x620
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
  Freed by task 491:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   kasan_save_free_info+0x3b/0x60
   __kasan_slab_free+0x5f/0x80
   kfree+0x308/0x580
   o2hb_unmap_slot_data+0x1db/0x330
   o2hb_region_release+0x14b/0x4f0
   config_item_cleanup+0x14b/0x230
   config_item_put+0x79/0x90
   configfs_rmdir+0x58a/0x910
   vfs_rmdir+0x2e8/0x820
   filename_rmdir+0x3b1/0x520
   __x64_sys_rmdir+0x4b/0x70
   do_syscall_64+0x114/0x620
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

Fixes: a7f6a5fb4bde ("[PATCH] OCFS2: The Second Oracle Cluster Filesystem")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Changes in v2:
- Require a configured node before admitting a live slot in
  o2hb_check_slot().

Link to v1: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0058-v1-177573785904d0ea43c7@gmail.com

 fs/ocfs2/cluster/heartbeat.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index 1c3def99bb0765deb828ad6415fde31ed9316002..3f3f6fc6b1316e7c996681fc50fde84d183d117d 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -880,8 +880,11 @@ static void o2hb_shutdown_slot(struct o2hb_disk_slot *slot)
 	int queued = 0;
 
 	node = o2nm_get_node_by_num(slot->ds_node_num);
-	if (!node)
-		return;
+	/*
+	 * The node may have been removed from the node table while this
+	 * region's slot is still linked.  The list member must still be
+	 * removed before the region releases its slot array.
+	 */
 
 	spin_lock(&o2hb_live_lock);
 	if (!list_empty(&slot->ds_live_item)) {
@@ -903,7 +906,8 @@ static void o2hb_shutdown_slot(struct o2hb_disk_slot *slot)
 	if (queued)
 		o2hb_run_event_list(&event);
 
-	o2nm_node_put(node);
+	if (node)
+		o2nm_node_put(node);
 }
 
 static void o2hb_set_quorum_device(struct o2hb_region *reg)
@@ -1038,7 +1042,7 @@ static int o2hb_check_slot(struct o2hb_region *reg,
 fire_callbacks:
 	/* dead nodes only come to life after some number of
 	 * changes at any time during their dead time */
-	if (list_empty(&slot->ds_live_item) &&
+	if (node && list_empty(&slot->ds_live_item) &&
 	    slot->ds_changed_samples >= O2HB_LIVE_THRESHOLD) {
 		mlog(ML_HEARTBEAT, "Node %d (id 0x%llx) joined my region\n",
 		     slot->ds_node_num, (long long)slot->ds_last_generation);
