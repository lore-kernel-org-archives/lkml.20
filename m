Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793241774;
	b=jkvCQtaSLzIuklaj0bPZ2avOw18RFES4+EVU6bokrzLKyM3Re4ikc0bf3JKpIYrk+Tge
	 qH2HmwKFic703PmIRuh36d0b9jh44w7/16r75g4kkxSvfNXpUMG926jHzB7Y3Kqh1rCek
	 Mi0Vn+BAyFNtAfaFaT7xPUSV3FPG1OpuAlCgkSO1wSRzYyLNphxIlfDKz7kTX447AnEQ2
	 SrYKXnB7A+WFlYWFDku3xIe2gFtQEqHsHE8E8N1XjB5vtdGx9QBxBJ+PtjdcJFbLSsTKU
	 +OCIlU4ZbTehixn36qMbINGC4XftwOgb7DPrCGVlxoJL+Vm1FOsKZRh1cPHvjZPadGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793241774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=li6JwHU0iWRxuOXLh3ZiIpZVFgZFIl6/9VTBe15UUWc=;
	b=mPbMRg+igRVokEYnkysulTNH1wkcm8mlpqv6TNAYkQ/JhRrwaU3HBriPmZ1ZnBs6mpwT
	 xJzrRYT+NJbSeLrXBeeJjkXyfPdnf9TxgcqRAWlqmpT+tbgOTAYWkOcLKV39WkeGJm4FR
	 wgW2SmnLWH9y3ZxHDimcnMezX9S6cxIrOhyeNuLn7ryEDGVfbVZs63qF4xcZb75y0sXRb
	 C/SGWNSvxbSCKLJ0Js9IAzumrLM81PN0dl/6kB2zHOF0lgv8gcJxNylUkSzsix/ZvWkWL
	 x/bwMURWzLrAeUso8GUutHRUDUVf/+Uir4yBbo4iMqgwCm3/Dfx2pxlk4nsE2IzGJsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KWY6elZz;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D75606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9D75606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KWY6elZz
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eac01ff101so594882e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793241773; x=1793846573; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=li6JwHU0iWRxuOXLh3ZiIpZVFgZFIl6/9VTBe15UUWc=;
        b=KWY6elZzkkw4orAxy35St8JuB6yvMwapHJuKAW272znFbnFoivbkGo2XjN5xVX6g07
         o8/4fhJMNmMUeatblP2+DoaAt5kd/A46jDfu/YN6lGHSeA5czAnAnZTABnlNVxegP/8O
         oS0/ZrZBvEBtGq7s9oyQMc2/P7N9QvR3YPI2rtMdX91e7Mp8rrx2xIMqIiZ9wH1iuIB3
         YQ5QvN2uOI03h96G15Vs/xouBlaWxcedU7qx0kt2RuBB61dXR4T9IvDfS2lbd32f1fcV
         pFar0iqcz1TowmlrW0p+oawG/BAzpNMBcw/j+JXVksyRyaDsuYIwKgaWflat09mwF7To
         oRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793241773; x=1793846573;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=li6JwHU0iWRxuOXLh3ZiIpZVFgZFIl6/9VTBe15UUWc=;
        b=V+tboreUYMaSo8+S52rN1DiwL4nF/sznufmRx1CZPHfvud5RsO/tvj3WPXPQ4sWKOF
         P7ecK9fNQuoy2piAb0FlQcqjedhFJiA5XMLKNb9YJXYziHzvadg1I4b95wEyEjrkvkJ5
         gqwP0hCl5isKkD0ebVuA7xaN6SbAEVsPblf/OsrTZ1oUiDOD/PHUAxdGYJsLvmju6X/h
         yBOw68n77nkD2nw0N1LlDrbhb7HdNigZCvySMGqsSYYLGC38+KTGEwddq5K9QNOn7PL8
         j0+k4PEQfhrqJwEjQzpNiKPcG0XNC/TaC1FYhl45HKXaf+CpZt0JJfCNmXL7njktqu9+
         I5+A==
X-Forwarded-Encrypted: i=1; AKwUvByEWsGZtEbHWfD4UR5jOrPKqaikph0uKRb5ZRaLQz7gQQ0fE6hbXAACfenOYocge7TPir65XQrYFzafcgE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIK4ECN9mgQGKlL7ZoeWeVQtGRC5g4aHvxOaF0PJXkmWeaxrvRj
	rrnkqUJN4sIuijSwQPfbr9j1lIynyayF1NLw31OlT9hoSWs70Umqafls
X-Gm-Gg: AYBFou2rzqekMZN+5ebu3LtYTtlWYsUwzXLsn/7cmaJpISdzgmZBD9kOyb3JarGmN/T
	5dWwixHKaSg8VbO3Ko4kxKBb4Sg/n2Xp0A6brd8IAtY+5JrU56XvAnldPUfiN4GEN/acvWfGLOT
	c6tlL0475UcoEcRFNZEiHe3S6MZZ5xRRTCXwb8VWgF5dwrNd1JQgRUXf7tPglCQmcMMQLCyNjdp
	RReLmjhcSmz2bD2YOg8XjsyErxUEFeVxijJBbIEgYymo8z4/0eqtKHU8IB6puXoJdRywesQEa5k
	HZcRruSVplZSgCusU9NbrnL5WqiNPV4tK/kM6CI4QVsnZ/kuS1p77Z+h63r0iv//NaI6oB50brH
	txuS2e69PuFOi3FQZqfa31EEubnHoukIrxrPSEdbU6IV4mSyA4BihcTzZt7Z9yrSyKJAkz2zKOz
	i8g99OsJTo/6ObpP9v9e4/lDF+ehlZzZdZ1nY5vhhOTuHNdjZadBJbk5/uM+JjjXt3W1vPe9OKX
	y2t0lexSDGq05p2Ytq8X4XkXDBxBOnOu67DfaREeGrFp+f7XmFNPWY/KPRq/4IJpkPJj0TlpyjH
	cU7MsgYobvTlfWwSDH+igtMWoRx5QoDXh3FKeGU1i62x+NpqbKHvrz7JGLqS3ER/PrWFRq4EO1W
	Qpwh6SZbNmTrVRUEGfW1AoQD1jF0u
X-Received: by 2002:a05:6122:e20c:b0:5ea:9218:eac1 with SMTP id 71dfb90a1353d-5ec4cccdb04mr1920518e0c.20.1793241772644;
        Wed, 28 Oct 2026 19:42:52 -0700 (PDT)
Received: from macbook-pro-de-joas.local ([2804:7f0:b101:c5e8:7d75:cb37:7054:6d4b])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec57fa451csm1790680e0c.13.2026.10.28.19.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 19:42:50 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Hongbo Li <lihongbo22@huawei.com>,
 syzbot+91e1fc35f51774c479b2@syzkaller.appspotmail.com, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hugetlbfs: emit hugetlbfs_free_inode from ->destroy_inode()
Date: Wed, 28 Oct 2026 23:42:45 -0300
Message-ID: <179324176522.32673.7602596908234555806@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

hugetlbfs_free_inode() calls trace_hugetlbfs_free_inode(), and the
hugetlbfs__inode event class records inode->i_sb->s_dev.  ->free_inode()
runs from an RCU callback (destroy_inode() queues i_callback() with
call_rcu()), and Documentation/filesystems/porting.rst says that this
callback "is *NOT* ordered wrt superblock destruction; as the matter of
fact, the superblock and all associated structures might be already
gone".  put_super() frees the superblock with call_rcu() followed by a
workqueue item (destroy_super_rcu() -> destroy_super_work()).  syzbot
hit this with the event enabled:

  BUG: KASAN: slab-use-after-free in trace_event_raw_event_hugetlbfs__inode+0x45b/0x4c0 include/trace/events/hugetlbfs.h:36
  Read of size 4 at addr ffff888038850010 by task syz-executor952/6134
   hugetlbfs_free_inode+0x15e/0x1f0 fs/hugetlbfs/inode.c:1182
   i_callback+0x46/0x80 fs/inode.c:317
   rcu_do_batch kernel/rcu/tree.c:2650 [inline]
   rcu_core+0x5f0/0x1220 kernel/rcu/tree.c:2919
  Allocated by task 6134:
   alloc_super fs/super.c:326 [inline]
   sget_fc+0x1ba/0x1f60 fs/super.c:874
   hugetlbfs_get_tree+0x1e7/0x2b0 fs/hugetlbfs/inode.c:1431
  Freed by task 855:
   kfree+0x22b/0x6d0 mm/slub.c:6923
   process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495

Emit the event from hugetlbfs_destroy_inode() instead.  destroy_inode()
calls ->destroy_inode() synchronously, before it queues the RCU
callback, while the superblock is still alive; hugetlbfs_destroy_inode()
already dereferences inode->i_sb there.  ->free_inode() is left with
only the kmem_cache_free().

Fixes: 014ad7c42a69 ("hugetlbfs: use tracepoints in hugetlbfs functions.")
Reported-by: syzbot+91e1fc35f51774c479b2@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6ae27525.5451848c.f7707.0001.GAE@google.com/
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
Tested on net/main 94cea342e891 (arm64, QEMU, generic KASAN, tracing
enabled) with the syzbot C reproducer, which enables
events/hugetlbfs/hugetlbfs_free_inode and races hugetlbfs mounts and
lazy unmounts with open + unlink.  Without this patch KASAN reports the
slab-use-after-free in trace_event_raw_event_hugetlbfs__inode() from
hugetlbfs_free_inode() <- i_callback() during the first 10 second run,
on 3 of 3 boots.  With it, 12 runs over 2 boots are clean, and the trace
buffer still holds the hugetlbfs_free_inode events (about 46k per boot)
with valid dev numbers.  fs/hugetlbfs/inode.o builds cleanly with W=1.

The event now fires when the inode is destroyed instead of when its
memory goes back to the slab cache, one RCU grace period earlier; the
recorded fields are the same.

 fs/hugetlbfs/inode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 6656807..27a3937 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -1179,12 +1179,16 @@ static struct inode *hugetlbfs_alloc_inode(struct super_block *sb)
 
 static void hugetlbfs_free_inode(struct inode *inode)
 {
-	trace_hugetlbfs_free_inode(inode);
 	kmem_cache_free(hugetlbfs_inode_cachep, HUGETLBFS_I(inode));
 }
 
 static void hugetlbfs_destroy_inode(struct inode *inode)
 {
+	/*
+	 * Not in ->free_inode(): that runs from an RCU callback, when the
+	 * superblock the event reads may already be freed.
+	 */
+	trace_hugetlbfs_free_inode(inode);
 	hugetlbfs_inc_free_inodes(HUGETLBFS_SB(inode->i_sb));
 }
 
-- 
2.39.5
