Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA30F353A7A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381379; cv=none; b=X80YQw+coLnx+AFRx5SufhkKa9S+VpueN9+gpvn2HlPS/RvMNRenl6YsNuKlXkGs+q4CbJMmQyagyspkddr7+9RtDjpvz96h+G6oF/Qc5kr5iHGLLGO7b8FHSKVcasbNsgygXIzTWDvVtCHARUwOf+g9V5baP6LwJDhYCYUOZi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381379; c=relaxed/simple;
	bh=M9xpPADoL19hxr27DkufqRMasiizNX7ktpq6FGesp9k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=q8Gans6GKSupCr0g3+A8bOjKnjCzKNawSGT8fHvxkHs25xsmZfm5GVTBPDpnm27KE45Lgas2j/6sCoI4SnJyFL5nHJuJthj9SgZg9EPNgr2xKrc8mdu3VG7C8wMLcGcGBDryA3NSeWZxl3y7WLxtzhXlxCkoPznL5T/AzlIYaRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45e6091d8a1so1746160fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789381376; x=1789986176;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xR20iaTbZ0bdjxfv4NrTmDVY7AwmSd6Kpmne0tL0/bo=;
        b=lJta3djtyYppGO4iYNplFT7t9YyjnCzYk9iSeqM6XzFlj/iLbRB6QfT/G/QxWbbB6D
         O84f5Kz2nf4KtAZF+faHYNlc2DSYCVUHJx2rz/0AfW3AG53drZ6jKO0vNetN26E/z3sX
         Q+m+y7h95VjSRDUytUbGkIhgZvkKdH3lMxBSVwWmD6YczcO/cnxeQylb7g6CJsR/wyC+
         8dwmKJgialTJpUOjF8ioTIKoqetcJbiv4JubHK0wIx5hLeP/2sWcpqa3vgR59Z3jHt3u
         BufiZUIMU4DJHxDoqpUrJ4cECRqKO2gay1qXPyKym+da6C4ExLK7yptEjw0f/LUUK9eL
         MZZw==
X-Gm-Message-State: AFuF++nwiw6id9FEQ+pk/Vurj05OwzJYBTGVviK65QKa68RKlCmnb6QL
	5v58FUx/1uxwc4HtMY6/VHxEFQw6/579Okba8cciwBTaSBInnk4+NiPXnPILvTjI25mOJqkAeg2
	vNV+UfWKoufRn+wVAlX4+LXx3CkddlAe2JasWL20fEqlCrKOFBH+VSKRv+Vo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4de7:b0:6b7:46e9:96fa with SMTP id
 006d021491bc7-6c540e660d9mr760657eaf.42.1789381376619; Mon, 14 Sep 2026
 03:22:56 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:22:56 -0700
In-Reply-To: <6a9b44e0.a5e650b3.363816.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7cb00.4c28b7d0.c1bba.0019.GAE@google.com>
Subject: Forwarded: [PATCH] BUG: sleeping function called from invalid context
 in null_insert_page
From: syzbot <syzbot+95fdab36405e5ffdb680@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] BUG: sleeping function called from invalid context in null_insert_page
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Reported-by: syzbot+95fdab36405e5ffdb680@syzkaller.appspotmail.com

diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index 6beb1f5b7..7f3fbac0f 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -70,6 +70,7 @@ static DEFINE_MUTEX(lock);
 static int null_major;
 static DEFINE_IDA(nullb_indexes);
 static struct blk_mq_tag_set tag_set;
+static struct blk_mq_tag_set blocking_tag_set;
 
 enum {
 	NULL_IRQ_NONE		= 0,
@@ -1847,34 +1848,44 @@ static int null_init_tag_set(struct blk_mq_tag_set *set, int poll_queues)
 	return blk_mq_alloc_tag_set(set);
 }
 
-static int null_init_global_tag_set(void)
+static int null_init_global_tag_set(struct blk_mq_tag_set *set, bool blocking)
 {
 	int error;
 
-	if (tag_set.ops)
+	if (set->ops)
 		return 0;
 
-	tag_set.nr_hw_queues = g_submit_queues;
-	tag_set.queue_depth = g_hw_queue_depth;
-	tag_set.numa_node = g_home_node;
+	set->nr_hw_queues = g_submit_queues;
+	set->queue_depth = g_hw_queue_depth;
+	set->numa_node = g_home_node;
 	if (g_no_sched)
-		tag_set.flags |= BLK_MQ_F_NO_SCHED_BY_DEFAULT;
+		set->flags |= BLK_MQ_F_NO_SCHED_BY_DEFAULT;
 	if (g_shared_tag_bitmap)
-		tag_set.flags |= BLK_MQ_F_TAG_HCTX_SHARED;
-	if (g_blocking)
-		tag_set.flags |= BLK_MQ_F_BLOCKING;
+		set->flags |= BLK_MQ_F_TAG_HCTX_SHARED;
+	if (blocking)
+		set->flags |= BLK_MQ_F_BLOCKING;
 
-	error = null_init_tag_set(&tag_set, g_poll_queues);
+	error = null_init_tag_set(set, g_poll_queues);
 	if (error)
-		tag_set.ops = NULL;
+		set->ops = NULL;
 	return error;
 }
 
 static int null_setup_tagset(struct nullb *nullb)
 {
 	if (nullb->dev->shared_tags) {
-		nullb->tag_set = &tag_set;
-		return null_init_global_tag_set();
+		bool blocking = g_blocking || nullb->dev->blocking;
+
+		/*
+		 * Some memory-backed devices can sleep in their request
+		 * submission path, which is invalid if the tag set is
+		 * non-blocking since the block layer then calls the driver
+		 * under rcu_read_lock(). The blocking flag is fixed when a tag
+		 * set is allocated, so use a dedicated blocking global tag set
+		 * for such devices.
+		 */
+		nullb->tag_set = blocking ? &blocking_tag_set : &tag_set;
+		return null_init_global_tag_set(nullb->tag_set, blocking);
 	}
 
 	nullb->tag_set = &nullb->__tag_set;
@@ -2195,6 +2206,8 @@ static int __init null_init(void)
 	unregister_blkdev(null_major, "nullb");
 	if (tag_set.ops)
 		blk_mq_free_tag_set(&tag_set);
+	if (blocking_tag_set.ops)
+		blk_mq_free_tag_set(&blocking_tag_set);
 	return ret;
 }
 
@@ -2215,6 +2228,8 @@ static void __exit null_exit(void)
 
 	if (tag_set.ops)
 		blk_mq_free_tag_set(&tag_set);
+	if (blocking_tag_set.ops)
+		blk_mq_free_tag_set(&blocking_tag_set);
 }
 
 module_init(null_init);
