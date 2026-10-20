Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485054;
	b=nXIRKIsRg+pBJmTAeuldIheBsT+kcK9SDF4jmuzDA6aD4DnY7xmuZaRK7RwUyrMOrFWe
	 3BQfY4BLW6rdzQ7lffrs6EmkPmrv8fFhnq3DSFC2D+LJ39BoPm+/5uikDKpZ47Cds2dEj
	 ns/eMeabdLp3I1W6zoeoFo8o/qZrMvy/J93BD/UKply4TM/yYq02GczZXMEGX6JT2u2nC
	 dQH5lHHdVb/PWl+JpwiQDU+sWBFJU0HBNjR7XgxiScrI9L616CzdPmMOCGONJf3/XSr8z
	 iwu5yHPXbrDw/r8pcv4cW2ARb0ehLrUOaetHu2LeK7wwvrBdlUq5k8jz4TfHVND0Ajw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485054;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=aCWNPsJymC2fp4gzJndbp78M6r3pyeyfQP7eP8i0JKE=;
	b=Qgb5suZq66yZPoFFhXdi70+l7CsSoUfwLP6zNp/fZkn05fnwa7a4dL6UCvuEOr2a+2S7
	 8zDikUotwAGNNWqA7uJysRATkqTkY0XQQWic+YPrpyieZc+3DzL2PNkKobV1b92jeAHwC
	 JROBJMReImaZZR6YFoTgJGTTszwzbPbQ6yvOrJS1Zsqm+oUJe2Mk+KpCCWL08Mg86N2ub
	 0ScYpKR52aZ3qlnN7mv7X+YkNoDHWxPxD/Ds5RJpAYDjfHFvo/F2nTovgKVDkraSDy8DF
	 9qov26pucjsqWU5RmsQB2oAftrrOuGk8nhIMBhuNYL6yLiHYJJqJ5QbEarMjND+WieQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB1F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB1F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b26d8d2498so4482784b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485053; x=1793089853;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aCWNPsJymC2fp4gzJndbp78M6r3pyeyfQP7eP8i0JKE=;
        b=YEUUoILjcyiwCulYegiQeIjMarhimq5i9vLSQPB/tb++gTJZFqiFuLUSzZDTGuq5/1
         7OvW4gNMmt6ViHaafV7zSS3Gja0rJz/hzn6Q+4GgoP0wn/nMh7/mw1Ud8sa7SIZSiG57
         nAfya/q1gnqx/rpJkrz6hmnB2YCpv89+R83rWU7O1tls/VVACN5MEFSQ5YrLbqytyCDS
         n6YQGT/lO3Yfk8/znZxKg0QEgR0KR3EgH1FBLjCN3eFBQluzyoFFVRzn9TsRtkYG90q6
         na3dlhzcFMqMzUs1GBIjiAFwajQbOjUUwqUZtxlFxAJJSW/ReH4xs2q02xumOZpX/CHz
         0pIQ==
X-Gm-Message-State: AFq9FYKJnvSslcKjn6RHZF/GlB+EIp6jla0meAQQWaT3k1BCAJ5ZXTMJ
	Ya03i36QpXiHQbLaewaY7h0D7se1meq8GmqQbplSokA5r0B9IzmFMfu9AMahlC62KkuibTmw9Yl
	81a93Ms7pqHjOU3XBXO23Jgz51O4fbCF5GDhbO+5PUS+ZD/X4VX92HImD0NE=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3c49:b0:4c5:12a4:ec8a with SMTP id
 5614622812f47-53cd4785361mr7594674b6e.36.1792485053680; Tue, 20 Oct 2026
 01:30:53 -0700 (PDT)
Date: Tue, 20 Oct 2026 01:30:53 -0700
In-Reply-To: <6a9b3f7a.2e649fcc.1e1977.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad726bd.b5bd089a.6b57.008a.GAE@google.com>
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

