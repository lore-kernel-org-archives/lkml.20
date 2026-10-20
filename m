Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486278;
	b=3kFQVD0HnWGeOdg8dhAphBV+ChoS6WzlvaBs36qmULTjslIauzRV78y01OSUp/6lNbxB
	 VGn6b3JGyag4dJjXAZNzYHHXv5JaW/+bwh5B8EgzsEV9FGsUM5riBC7Zj4JxsfMaBpoF8
	 J9jfrI5ojwLrwJ+4XG2UndM0T/0h+bxkGrdz5SMaqU+np5vkuUzQkkazlUewifqPmOH2B
	 pBBF8C+3aMkloNvyfCuwXON/tvnB4FeCpoj/Otirtt8ePN/h8VLouI+bkS5OmCWbWbJYj
	 Bf74fRXJkFhrUln4oilVeABdzsvk1o9oi42FSnZpe2wlGLJl/4akmjcEGzZTLn65v8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5SW2IO2rseXzuOFXMzCYvlLaiKwdefVPHk6QIet+9Es=;
	b=yV1W7FJ0F977/lqKLjF3jE6ngEKTGqlerX42bBmoW0rgELcImlOZ45G9O/xNxlo2lPPU
	 YhJse7I/yzx0XXiClf6CpxEyTagKXtunHZdlqkySxXy+tuwEz1j9vA6nSdF/PHydthMOx
	 EvURhEvSKncw4KLw1w3MVcsHKzEI7Bs8fkD9/6p6Lz5Iorki0iafN0RtFcGywh6D8LOrR
	 2jBg3CDjSt+eCf3Gg9OfrxBTON9/BjRVnuGs56OC9pXqkSN36O0GLten2jDtMrH7NslPO
	 dGpAVQAZptM5jQxqxonAhcWWpUT0Y4YoQ4AvSnNRt0d0SI4CD2uegduk+CJ0JuL8eTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jYljraek;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9C4606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC9C4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jYljraek
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35943f55c06so719237eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792486277; x=1793091077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5SW2IO2rseXzuOFXMzCYvlLaiKwdefVPHk6QIet+9Es=;
        b=jYljraekuZuVw1dg9ZUUQJ3EsEwOCz+ct1H0F0oS+76s1h6RHrEh+5NIrI/t5YyVCc
         tPvS3E3gIUpT336fvtsSKqa7P5MYxsYiCKoQKGd7lbt5jh7FDfTBUFjWsBCANMhfOrbd
         6ZdX9Z5xaU2L73WT+tH299V0na3HzJn2ZEGjuEARyfNGqLW+x93IKNw9UysbclVfq3tQ
         XQyF1oA8Xvbh3QpGFpNlMOo4tP2MK+/ZM5Zc8rbpu1gSyu0bgqdCtyydeWRBh3HOI4tR
         rNFenSW2ykYCgGSfgyVcU7YB0Aqh2IeZg25X9+/uwvQ8VEqE3DOEW7hgpNP4ykFUCuKc
         TbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486277; x=1793091077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SW2IO2rseXzuOFXMzCYvlLaiKwdefVPHk6QIet+9Es=;
        b=t/ggwI60qdxOuaEMPnqgXt/zbt/FDRZJki2C7sBPWDKWXfpZ2qY5IUxkjpAX/aQBYf
         wAVExd+/fQjER7ZvtY05R2UTm8j5shA6MKr3WwL5DVP9bpz199Vd6bcE3rcO5QfnijgD
         GlzlMy0RQb3I3OfSqt7IM9PTRPqQRtggDxVFk1xs8bBmykDT4QjQygk2DjoB02zu6kAo
         aiiktJkKwpVLtKK4r/SYQ5hHD3uYFqbv2aBi1e1RfLDq7X7NN6dSulbCtDV0PFJIPPud
         04e1SkTq6Jfnby3UAIRxtsgoofeFkdp4WAv1vnsrnDNlee7HxTNJUhRXh3PEgmuZ3sxo
         SHDA==
X-Forwarded-Encrypted: i=1; AKwUvBzvS00tbchdmAZTiYfWvJUnKZZj7Z2AtFnwIJobTdpSKfrCyuyQtAW0NBiskSo+TcdRBjh4OsDFgZ1mdWA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLB+JGkGmsxNfe6ttGxoUgwUnGzt0B/bM4Q8WqkP2xN3JtP6N2Q
	i0ZeBuZw7nqro8Jrsjfxkvoglop3A3HTGQKRjuf+JjKBwxsOoG8fviv/
X-Gm-Gg: AYBFou27HV7u6Z/p0/tjZ4PEAWlKQdoQC5FOk4tG5HbNfLZqUN1YMo7uGzJnaTmEbcB
	vFQ7OvoDQUvZIrTBu3+H+PlaMqIjGTQGK78JjeIYapzIfPi0Ph3ELqtesqQ3/qu6n6/m3JYLpyg
	daHJY333og66VxMqnjzCLG/H5lWLDuDtk2Pg60ZnE4a+qiGEPvEEm4Zv5Y6YuH5D6e6dnE4nDwn
	fUhgFsp1WwHQJARjESccoJI76Vfy1I8FQj+XE2cFlW4fEf7ueUiYYD87/vX+QGTyMVZbrQcni/P
	YxDt2xPQsOKRQYWqERAL2PHMwwTsPLEPBWoi9psPcbcgiFQfVJzp2R/MB1GBG9vux2LHDzBiBwv
	M5yWTB2sRVLGlbOcD4w3Qs7CazvDcp/EZhsD2NwveQale/+1uCiINiwsKY/O7QN3qWa1HmUdlRW
	qDsXoI/9/NoXxlSOi0vfWc2GTUgmIG2266BaxkYTUp2K7nQZcWg7IbttjDJ7Lif6OcFwRcsrH9x
	TedCr8mfhQAP9/v0jXjItHRqOv0cffdSERewd5OSa9h7S9LLmLY/atTTJhi9Ftmfhn77bN1Db+D
	+qVlBoZf0bfA2a+LwDU85FYIGVnoxNqmbTR3kDEnLmLkpw==
X-Received: by 2002:a05:693c:62cc:b0:358:a1b6:3ad4 with SMTP id 5a478bee46e88-365fa491f31mr2292136eec.4.1792486276837;
        Tue, 20 Oct 2026 01:51:16 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:fdcb:6ff9:fb3c:351a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081fa5a6esm40264160eec.16.2026.10.20.01.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:51:15 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	heming.zhao@suse.com,
	akpm@linux-foundation.org
Cc: zzzccc427@gmail.com,
	kees@kernel.org,
	ericterminal@gmail.com,
	christophe.jaillet@wanadoo.fr,
	kurt.hackel@oracle.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
Subject: [PATCH v2] ocfs2: fix use-after-free in o2hb_region_dev_store
Date: Tue, 20 Oct 2026 14:21:00 +0530
Message-ID: <20261020085100.8819-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Fixes: a7f6a5fb4bde ("[PATCH] OCFS2: The Second Oracle Cluster Filesystem")
Reported-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3025e3e8fc0b928af8f5
Tested-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6a9b3f7a.2e649fcc.1e1977.0001.GAE@google.com/T/ [v1]
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

