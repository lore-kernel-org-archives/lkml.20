Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA23D433BC1
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788044129; cv=none; b=VbtIsGY87Clp06ACD6dkRmMyRJbeJE6384M16S/A5t1i9DnXdF3Dk23u+rHnlORLnGX1JH/uqzS4btd15P8LqL4DzUKrtsV8Rej9GEaLiPgXc/gZPihRWqnLmU1Xi2wiknVn1Zc5idrTukKTFhPC6yOLDde7seu5L6sxYN1yW70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788044129; c=relaxed/simple;
	bh=qBN+DWx96hbQZQ9lNws+rysHWnkANX3wt4SsBuvYulk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VoOvfzYPpRojksFIjbZi6wTUkCnL8khX3V/37GiJXGyAQ98GEQr7zLwsb627lej34xpPJMEadC3K8Re1xICVW8Y1nj2+83NolCLT/NJXyWMqsVBIFF5GP2X4Hxsn5y/VxeQlMtBxarI2PuujfltIflpyyICFa0nk3k4ofykusq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Arsaecnn; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Arsaecnn"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cacb8416a1so19108095ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788044125; x=1788648925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ma80YmNRqQi3IMfqK57hZ7nOz1u3fXlwt1Ge7kNJdZE=;
        b=ArsaecnnzULayIDj2qCi5Sxr0Jnl8L84uhin1oAd5Ozcu6XAyfX9K7DqEtZOXio50q
         TmBpKKlnKBA0xmyfBVpSeGc9HQDGEKDf2gKY3wZGrMdX2I5gcno/tSZr3n4YCq35gsqY
         lBj8jPdUo9Lp43X+buxWau8B/EDFubVusPdicOyHK2Ajzrp1Ng2P7Xioun/KE8e4NPzC
         A6i1xBzo5+NrW99FheLPbcaXlMs0P5bkxqlLyQXNgpJTUoNIaQdQCNSTCb1bKgicABew
         x09qe1suXM8H3F6BTN6b2HFi9Sh3Q2hZD9/wKylR1XMqoEpZMWxN7sGU7X2sXzbLNC/V
         taow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788044125; x=1788648925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ma80YmNRqQi3IMfqK57hZ7nOz1u3fXlwt1Ge7kNJdZE=;
        b=ooB7eSIyfV57e03jRuzJTJCdV90YoRNFYWTzo8BiuxnyThuG3j8TiT2M073Gvg+ElY
         30Dk+mj1vYOj7xzYuk571p26EM4GgUpr4eG8flg0MpAVVa+KHlmGhSRXyBRU39ZbezTL
         NMJqus8nruhPrwt+q0qt1bIUy7Ddv2nWttDZ/AIH+AqDwfmiK8/xJ9GN8YAcmug9LObj
         2G3GbGsKSr5dCqnlpgT1FaadA9vKWR58r5kkTLb1cx6VU8Ek7ScPTuEi9ghxMdHTbJwV
         e/OEfCaCEhf+Gg5T7jjJNIWleqZU1WYHsUKt9+GIsTQ3wlv+ol8rGi3ykHUi7CEApve5
         b5+Q==
X-Forwarded-Encrypted: i=1; AKwUvBy3KQph8tPhz53GEQJdkQ9Ob+/w++2DllzEkDhNsU6udIlZd18tU1KAXVrJxG4+Lp7eYmBJ/nlF+uVDjdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++naleV4Sp8ueLboJ+S8MXXEOCZAHLFdoxSWQfLDCr+7mV7xD9ZB
	uWCAKXp9RS3Zs/ylE7Wl3+l66tyDWnwYOV/fzubb/cGcGJv2GT4TlT1V
X-Gm-Gg: AYBFou2Eeqf4O9e1Zp4XbGdiXht42ggli1PwrBztDwTCXF6yFgSDduYQbscTPv8nFPF
	mARqzlrTN3NWMq8gVRBk+0MzWyKYs0y16Stq3n5i5kZfDKXGYsdbp5HoDuQq7GHEAoQiCJq4uJ0
	vAOa0LQDqaIF2nFe9CmVv4mP8TBrJsnJXbpeUEninnagZCmuSZ1R7qaU29Km31yArcuy+vklKBN
	iREFUpH/dpqfG6D6FQktBqdGJc9UM5R1wwjscLgpgEFQHBhsdblg7frbe6LblR02WNNCe5jDtPb
	kLasGNfwubZbi/GC4jnpzIJxVYc7rdoJxURXpQikWebAjIGp/IXQdbWVzEYJyEiJOUqVBUIjqPJ
	2AirxHfS3z8OQa9NS4V5D+bTJm04h4Hkv91vzPWnoaTbWk5XHIMbNB87HZ30uX77VJ7Q6FuyiZi
	8OfmpEYosfGKCDfNQCm7d78p4zsyrDZPvJkBzg024ChNNkhyQlANiMIovVFgRy0/ASS2jPcO/Ho
	QAyShHBVE3TkAWk7Y8Okl2l4guQwXl8ueeiK8/ZwTMGwEfkKRFoklxJKO1xhYOqOJmWUW+cYyq9
	kZKG0EacH5+0GROVlcU=
X-Received: by 2002:a17:903:388e:b0:2d7:44c5:1a13 with SMTP id d9443c01a7336-2d74df17b06mr307385625ad.8.1788044125345;
        Sat, 29 Aug 2026 15:55:25 -0700 (PDT)
Received: from bad.. ([43.227.227.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d759869afasm16958265ad.42.2026.08.29.15.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 15:55:25 -0700 (PDT)
From: Nikhil <nikhilljatt@gmail.com>
To: mst@redhat.com,
	jasowangio@gmail.com
Cc: eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com,
	xieyongji@bytedance.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] vduse: do not take dev->rwsem in the virtqueue kick path
Date: Sun, 30 Aug 2026 04:24:57 +0530
Message-ID: <20260829225457.1037867-1-nikhilljatt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vduse_vq_kick() runs in the context of the vdpa .kick_vq callback. With
the virtio_vdpa bus driver that callback is invoked by virtqueue_notify()
from the virtio device driver, which may be an atomic context: virtio-blk
kicks from ->queue_rq(), which blk-mq dispatches under rcu_read_lock()
(the tag set does not use BLK_MQ_F_BLOCKING), and virtio-net kicks from
its xmit path with the tx queue lock held.

Commit b282418bc366 ("vduse: Add suspend") made vduse_vq_kick() take
dev->rwsem for reading in order to check dev->suspended. down_read() may
sleep, so with CONFIG_DEBUG_ATOMIC_SLEEP the first I/O on a VDUSE-backed
virtio-blk device bound to virtio_vdpa now triggers:

  BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:1573
  in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 27, name: kworker/1:0H
  preempt_count: 0, expected: 0
  RCU nest depth: 1, expected: 0
  3 locks held by kworker/1:0H/27:
   #0: ((wq_completion)kblockd){+.+.}-{0:0}, at: process_one_work+0xac7/0xcf0
   #1: ((work_completion)(&(&hctx->run_work)->work)){+.+.}-{0:0}, at: process_one_work+0x51f/0xcf0
   #2: (rcu_read_lock){....}-{1:3}, at: blk_mq_run_work_fn+0x119/0x220
  Workqueue: kblockd blk_mq_run_work_fn
  Call Trace:
   <TASK>
   dump_stack_lvl+0x80/0xa0
   __might_resched+0x231/0x370
   down_read+0x73/0x330
   vduse_vq_kick+0x30/0x120
   virtio_vdpa_notify+0x63/0x80
   virtqueue_notify+0x45/0x70
   virtio_queue_rq+0x19d/0x300
   blk_mq_dispatch_rq_list+0x269/0xe20
   __blk_mq_sched_dispatch_requests+0x761/0xa60
   blk_mq_sched_dispatch_requests+0x6b/0xc0
   blk_mq_run_work_fn+0x143/0x220
   process_one_work+0x581/0xcf0
   worker_thread+0x2fc/0x5a0
   kthread+0x1cc/0x210
   ret_from_fork+0x3c4/0x540
   ret_from_fork_asm+0x1a/0x30
   </TASK>

Without CONFIG_DEBUG_ATOMIC_SLEEP, a kick that finds the rwsem
write-locked by vduse_dev_reset() or vduse_vdpa_suspend() blocks inside
an RCU read-side critical section. The vhost_vdpa path kicks from the
vhost worker, i.e. process context, which is why this went unnoticed.

Check dev->suspended under vq->kick_lock instead, which the kick path
already takes, and have vduse_vdpa_suspend() cycle every virtqueue's
kick_lock after setting the flag. A kick that observed suspended == false
has thus finished signalling before suspend returns, which is the
guarantee the rwsem used to provide. The flag is now also read outside
the rwsem, so access it with READ_ONCE()/WRITE_ONCE().

Fixes: b282418bc366 ("vduse: Add suspend")
Signed-off-by: Nikhil <nikhilljatt@gmail.com>
---
 drivers/vdpa/vdpa_user/vduse_dev.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
index 9891cd2cf712..766789a7bbfa 100644
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -506,7 +506,7 @@ static void vduse_dev_reset(struct vduse_dev *dev)
 	}
 
 	scoped_guard(rwsem_write, &dev->rwsem) {
-		dev->suspended = false;
+		WRITE_ONCE(dev->suspended, false);
 		dev->status = 0;
 		dev->driver_features = 0;
 		dev->generation++;
@@ -567,11 +567,17 @@ static int vduse_vdpa_set_vq_address(struct vdpa_device *vdpa, u16 idx,
 
 static void vduse_vq_kick(struct vduse_virtqueue *vq)
 {
-	guard(rwsem_read)(&vq->dev->rwsem);
-	if (vq->dev->suspended)
+	/*
+	 * This runs in the context of the vdpa kick_vq op, which may be
+	 * atomic (e.g. virtio-blk kicks from blk-mq dispatch under
+	 * rcu_read_lock()), so dev->rwsem must not be taken here.
+	 * dev->suspended is checked under kick_lock instead and
+	 * vduse_vdpa_suspend() cycles every kick_lock after setting it.
+	 */
+	guard(spinlock)(&vq->kick_lock);
+	if (READ_ONCE(vq->dev->suspended))
 		return;
 
-	guard(spinlock)(&vq->kick_lock);
 	scoped_guard(spinlock_bh, &vq->ready_lock)
 		if (!vq->ready)
 			return;
@@ -946,7 +952,17 @@ static int vduse_vdpa_suspend(struct vdpa_device *vdpa)
 	ret = vduse_dev_msg_sync(dev, &msg);
 	if (ret == 0) {
 		scoped_guard(rwsem_write, &dev->rwsem)
-			dev->suspended = true;
+			WRITE_ONCE(dev->suspended, true);
+
+		/*
+		 * Kicks check dev->suspended under kick_lock without taking
+		 * the rwsem: cycle each kick_lock so that no kick that has
+		 * already passed the check is still in flight after this.
+		 */
+		for (u32 i = 0; i < dev->vq_num; i++) {
+			spin_lock(&dev->vqs[i]->kick_lock);
+			spin_unlock(&dev->vqs[i]->kick_lock);
+		}
 
 		cancel_work_sync(&dev->inject);
 		for (u32 i = 0; i < dev->vq_num; i++)
-- 
2.43.0

