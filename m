Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549349;
	b=me5GuRK7/M+JFOUsltuetZmvIm4utwGT7nhjP9ZOF3YlREjAVG2rpKEe0uC9EYK/pkzu
	 wYjNqgkeXzNG2GG8OloafIuYaL2UflfKCJ8KpalzmzdgU4KXdd6yFLsF32oDXLCVRr6QI
	 YEao3aXWAC74RH0EttY/SE9eRNyq4bT8qUdPWFJKjzROSoMO7pJ3hL3SzfKuKydMceuIY
	 0YEjpEr4v8zkw7wozpgzpBRYp/tK6YHgQP/rGNsVEnH+gw9fCD5iqbSEcO57XpUL/mYCR
	 FjfoUBxoTiSpd5F6xav49rnAbxA9t7YwDoh72uFjYdZmJanFlPdrJxHBd3ZELniRTUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4Hvt/B3J52Gjx7+kaJxyB0SdGwJ2youU0SIAHrXEJjM=;
	b=donvzakRf8rpSFSzkWar+qz27GltOC3JxN9CL7uhkM0rOL/Ap5Pkcp5fz5szUk7h00f7
	 coKAgEa3sopm9N5dZcOvV9YaX5t+vWV/GmBqwEQcTznGgW6DyaE7mfJdj0fEShjFRTNDk
	 njxDoLiy94D99GkxFGfaSC+8g5dyGhzpQX6CpaB9gouri1az+AX3LX5bfhklwC/9NYZ9w
	 07o57cKHZm2fukBviE2OlGX9YOWLFyN9bvVBRvkkiVFVZKAXaYYlg/4vtTj1SulGBfhxR
	 Zk+vyg8YykJraPhlvPdplHtjmkvtxphzFSv8cb7RyBUzs/8v88OE2F2395Ce8UeiW8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=GAFUvu+x;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15B6606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E15B6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=GAFUvu+x
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so211505a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792549347; x=1793154147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Hvt/B3J52Gjx7+kaJxyB0SdGwJ2youU0SIAHrXEJjM=;
        b=GAFUvu+x6bI5xXmiBdwqYiRbtfk2X5g7QOYuJp5kVp0kJM0uvI6XWOy8jHPTxpSQGZ
         cMj6sC/9Rr1J8RVAlq+lTSvoXYERsrwv+s9O2FGpLap/bly1iNE8Ix7UUtDmWqRK35JT
         GGIKMWEJ3sxPNlnaVg2LOJrd2djForOBKvd2da2lVRCLPpCHj+4F+xs23aL5SlEj0zpg
         0n3nCIUHU3UMfn+McvJL+ICwtS15Hib/1h8hsEuoGlZwiw7MmZjoSJ9vz+r4V+VzeLHd
         aEjWh0OYk1EeOVh4tp+eVo4uQYX3DiDnqIq1EfeE7/ksdVIlLDBTKFRufr6+uLunrYZL
         Pgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549347; x=1793154147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Hvt/B3J52Gjx7+kaJxyB0SdGwJ2youU0SIAHrXEJjM=;
        b=uFssFil8RJ1pSzneE0WazUug+XcJEQDsmk/r9dDUsfm9/xuJ64UdbeN8zoCgIaid08
         8tm3QwEhKngDEn4OiYIC/v8Z/sdpQPl8TijHnyIIiTC5eEuHGUDnVB5iP8Z06tWz6uB+
         mdTq97nwoLYI+SYxC0I6cS7gOwM9b9RhyPZpFK3t9Bi1ciJcuzYk3b72+HwTxDwmXSH7
         CkK+93X1XP6Dn/2T+QAxGP7QN58U2tQG+hztJsnlGceh68zosR5u2zWJ3kwP/VVTWD8b
         DJGZcEISmpJhOOguJxTiB+mvZA2RI8PpbACj7xo06Z7otLwD4RxLGM7J8NwGDcu6N7fd
         wFqA==
X-Forwarded-Encrypted: i=1; AKwUvBzR4pQZnVCwReEl1cnpCizKDkpPd5fA1EPTSR0zXv1oGropx2DU8Ie5Wke1ghq+BELBt4ImnbMRtlhvGOk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrZx3JPXT1MFy8Ievp/Vh5jDV/mfOnZMfXhAGI7S2TpGfRnbLy
	hg5yqtYKK1z4a1nlFozQyMaBZUo/tzBHdAdv7xW/5rh+ESzWOO6UDWNOyG5O55wNxUg=
X-Gm-Gg: AYBFou3mjueDmAks5Hiaq0ZOSGIpNPPcwzSsc48tjI2BueamUdjrb23FNzrPgMFABg6
	BJtHR1kz5sGmAHkFHIOvHpR58SpsYhO24QUmrqWj8xFKNi5+wM0kB/SDXojhcrPVji4+qFoJbDr
	P2Uyo7IjQohLPF7/CJjJbL6Q2XvTDMzZv5TxMjrhedmy5lhuIxUac8bzH1h7nOh91CLD9wB9Fl1
	tDThy8KcHkANJjbvQz7pERPBj3qEKr/B5dDNfIDVa4jsgkK0Ji+7A8UpLOm4xqpXqEX76d1Nm3f
	/F9CGxIT1BvTR0r7ChU8IQVN/sCkQYffbYL6HBHNYLcc+g0ZRmaG3iam4ucmkeYG9vOO5KjZNl3
	ci2A9xB/8rJdejQTAT8H0X8YsZmTQYlVF/sGdsDweOYgctMl41LIMeVDZ0SoXv03t+pBN2Lle5f
	bDgpFoKvg1McbrSBb0MY92IG8wn8aOyq2Q8hkg5m6T1D3wqurxiIYv6O8oLa7uQkwvt74RULKvO
	PDF1sZdYL3ACR5UaYk6PTgNIf/igv5FRbma3L7hZ+pXPlxOuh09R2DAsWgjbESkyEJC0ezo+Epu
	ATyfjtwXGqyy83L/6mtag20=
X-Received: by 2002:a17:90a:dc83:b0:3ad:8769:8741 with SMTP id 98e67ed59e1d1-3ad87698883mr361612a91.4.1792549346782;
        Tue, 20 Oct 2026 19:22:26 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:e416:85ef:f22:6c5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8021ac2dsm1930614a91.5.2026.10.20.19.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:22:26 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Ram Vegesna <ram.vegesna@broadcom.com>,
	Daniel Wagner <dwagner@suse.de>,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: James Smart <jsmart2021@gmail.com>,
	Hannes Reinecke <hare@suse.de>,
	Mike Christie <michael.christie@oracle.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH] scsi: elx: efct: hold a node reference across asynchronous session setup
Date: Wed, 21 Oct 2026 11:22:09 +0900
Message-ID: <20261021022209.2580332-1-yhlee@isslab.korea.ac.kr>
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

efct_scsi_new_initiator() hands a bare struct efc_node pointer to lio_wq
and returns EFC_SCSI_CALL_ASYNC, so the node state machine keeps running
while efct_lio_setup_session() is still queued. The work item then
dereferences that pointer on both sides of a sleeping call.
efct_get_vport_tpg() reads node->nport before target_setup_session(),
efct_session_cb() reads it from inside that call, and node->tgt_node is
read after it returns.

Nothing keeps the node alive across that window. efc_node_alloc() takes
a single reference and efc_node_free() drops it as the last step of a
node shutdown. A shutdown posted from efc_nport_shutdown(), which an FC
link down, a domain or fabric change, a fabric that rejects FLOGI or
FDISC, or target teardown can all reach, unwinds through
efc_node_post_event() and returns the node to efc->node_pool while the
work item is in flight. The pool is created with curr_nr == min_nr, so
mempool_free() calls kfree() instead of refilling the reserve and the
work item reads freed slab memory:

  BUG: KASAN: slab-use-after-free in efct_lio_setup_session+0xad2/0xda0
  Read of size 8 at addr ffff8880029dd060 by task kworker/u4:1/27

  CPU: 0 UID: 0 PID: 27 Comm: kworker/u4:1 Tainted: G                 N  7.3.0-00342-g5b8610135c8d-dirty #2 PREEMPT(lazy)
  Tainted: [N]=TEST
  Workqueue: efct-kunit-wq efct_lio_setup_session
  Call Trace:
   <TASK>
   dump_stack_lvl+0x3f/0x50
   print_report+0xcd/0x620
   ? kfree+0xdd/0x300
   ? __pfx_mempool_kfree+0x10/0x10
   ? efct_lio_setup_session+0xad2/0xda0
   kasan_report+0xd9/0x110
   ? efct_lio_setup_session+0xad2/0xda0
   efct_lio_setup_session+0xad2/0xda0
   ? __pfx_try_to_wake_up+0x10/0x10
   ? __pfx_rpm_suspend+0x10/0x10
   ? __pfx_efct_lio_setup_session+0x10/0x10
   ? __dequeue_entity+0xe9a/0x20a0
   process_one_work+0x6b9/0x1160
   ? __pfx_process_one_work+0x10/0x10
   ? mutex_unlock+0x8f/0xf0
   ? __pfx_efct_lio_setup_session+0x10/0x10
   ? assign_work+0x11d/0x370
   worker_thread+0x575/0xf50
   ? __kthread_parkme+0x56/0x1a0
   ? __pfx_worker_thread+0x10/0x10
   kthread+0x33b/0x4a0
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0x347/0x620
   ? __pfx_ret_from_fork+0x10/0x10
   ? __switch_to+0x22/0xbd0
   ? __pfx_kthread+0x10/0x10
   ret_from_fork_asm+0x19/0x30
   </TASK>

  Allocated by task 32:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   __kasan_kmalloc+0x8f/0xa0
   __kmalloc_noprof+0x19b/0x330
   mempool_alloc_noprof+0x131/0x210
   efct_kt_node_alloc.isra.0+0x38/0x460
   efct_kt_uaf_after_cb+0x7a/0x370
   kunit_try_run_case+0x1ca/0x4b0
   kunit_generic_run_threadfn_adapter+0x7b/0xe0
   kthread+0x33b/0x4a0
   ret_from_fork+0x347/0x620
   ret_from_fork_asm+0x19/0x30

  Freed by task 27:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   kasan_save_free_info+0x3b/0x60
   __kasan_slab_free+0x43/0x70
   kfree+0xdd/0x300
   mempool_free+0xbc/0x100
   efc_node_free+0x308/0x4a0
   efct_lio_setup_session+0x93f/0xda0
   process_one_work+0x6b9/0x1160
   worker_thread+0x575/0xf50
   kthread+0x33b/0x4a0
   ret_from_fork+0x347/0x620
   ret_from_fork_asm+0x19/0x30

  The buggy address belongs to the object at ffff8880029dd000
   which belongs to the cache kmalloc-1k of size 1024
  The buggy address is located 96 bytes inside of
   freed 1024-byte region [ffff8880029dd000, ffff8880029dd400)

Take a reference on the node before queuing the work and drop it when the
work finishes, so the slab stays valid. Re-check under efc->lock, which
efc_node_free() holds while it clears node->nport and sets node->req_free,
that the node is still live before using it, and bail otherwise.
efct_session_cb() makes the same check, so a session is registered only for
a live node and efct_scsi_del_initiator() removes exactly those.

The lookup store moves under efc->lock and therefore to GFP_ATOMIC, and
the two early returns that leaked wq_data now share the common exit.

The KUnit harness used to order the free against the work item is not
part of this patch.

Fixes: 692e5d73a811 ("scsi: elx: efct: LIO backend interface routines")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/elx/efct/efct_lio.c | 63 ++++++++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/elx/efct/efct_lio.c b/drivers/scsi/elx/efct/efct_lio.c
index 67d686dd6fb33..add939366bc6a 100644
--- a/drivers/scsi/elx/efct/efct_lio.c
+++ b/drivers/scsi/elx/efct/efct_lio.c
@@ -1062,17 +1062,42 @@ _efct_tgt_node_free(struct kref *arg)
 	kfree(tgt_node);
 }
 
+/*
+ * Report whether the node state machine may still have a session registered
+ * for @node. The caller must hold efc->lock, which is also held by the paths
+ * that shut a node down.
+ */
+static bool efct_node_registrable(struct efc_node *node)
+{
+	return node->nport && !node->req_free;
+}
+
 static int efct_session_cb(struct se_portal_group *se_tpg,
 			   struct se_session *se_sess, void *private)
 {
 	struct efc_node *node = private;
 	struct efct_node *tgt_node;
 	struct efct *efct = node->efc->base;
+	unsigned long flags;
 
 	tgt_node = kzalloc_obj(*tgt_node);
 	if (!tgt_node)
 		return -ENOMEM;
 
+	/*
+	 * target_setup_session() sleeps, so the node may have entered
+	 * shutdown since it was called. Refuse the session in that case:
+	 * efct_scsi_del_initiator() only queues the removal work once
+	 * node->tgt_node is set, so either it sees the session below or
+	 * there is no session to remove at all.
+	 */
+	spin_lock_irqsave(&node->efc->lock, flags);
+	if (!efct_node_registrable(node)) {
+		spin_unlock_irqrestore(&node->efc->lock, flags);
+		kfree(tgt_node);
+		return -ENODEV;
+	}
+
 	kref_init(&tgt_node->ref);
 	tgt_node->release = _efct_tgt_node_free;
 
@@ -1086,6 +1111,7 @@ static int efct_session_cb(struct se_portal_group *se_tpg,
 	tgt_node->port_fc_id = node->nport->fc_id;
 	tgt_node->vpi = node->nport->indicator;
 	tgt_node->rpi = node->rnode.indicator;
+	spin_unlock_irqrestore(&node->efc->lock, flags);
 
 	spin_lock_init(&tgt_node->active_ios_lock);
 	INIT_LIST_HEAD(&tgt_node->active_ios);
@@ -1157,15 +1183,25 @@ static void efct_lio_setup_session(struct work_struct *work)
 		container_of(work, struct efct_lio_wq_data, work);
 	struct efct *efct = wq_data->efct;
 	struct efc_node *node = wq_data->ptr;
+	struct efc *efc = node->efc;
 	char wwpn[WWN_NAME_LEN];
 	struct efct_lio_tpg *tpg;
 	struct efct_node *tgt_node;
 	struct se_portal_group *se_tpg;
 	struct se_session *se_sess;
+	unsigned long flags;
 	int watermark;
 	int ini_count;
 	u64 id;
 
+	spin_lock_irqsave(&efc->lock, flags);
+	if (!efct_node_registrable(node)) {
+		spin_unlock_irqrestore(&efc->lock, flags);
+		efc_log_debug(efct, "node %p shut down before session setup\n",
+			      node);
+		goto done;
+	}
+
 	/* Check to see if it's belongs to vport,
 	 * if not get physical port
 	 */
@@ -1176,8 +1212,9 @@ static void efct_lio_setup_session(struct work_struct *work)
 		tpg = efct->tgt_efct.tpg;
 		se_tpg = &tpg->tpg;
 	} else {
+		spin_unlock_irqrestore(&efc->lock, flags);
 		efc_log_err(efct, "failed to init session\n");
-		return;
+		goto done;
 	}
 
 	/*
@@ -1186,14 +1223,28 @@ static void efct_lio_setup_session(struct work_struct *work)
 	 * ConfigFS NodeACLs.
 	 */
 	efct_format_wwn(wwpn, sizeof(wwpn), "",	efc_node_get_wwpn(node));
+	spin_unlock_irqrestore(&efc->lock, flags);
 
 	se_sess = target_setup_session(se_tpg, 0, 0, TARGET_PROT_NORMAL, wwpn,
 				       node, efct_session_cb);
 	if (IS_ERR(se_sess)) {
 		efc_log_err(efct, "failed to setup session\n");
-		kfree(wq_data);
+		spin_lock_irqsave(&efc->lock, flags);
+		if (!efct_node_registrable(node)) {
+			spin_unlock_irqrestore(&efc->lock, flags);
+			goto done;
+		}
+		spin_unlock_irqrestore(&efc->lock, flags);
 		efc_scsi_sess_reg_complete(node, -EIO);
-		return;
+		goto done;
+	}
+
+	spin_lock_irqsave(&efc->lock, flags);
+	if (!efct_node_registrable(node)) {
+		spin_unlock_irqrestore(&efc->lock, flags);
+		efc_log_debug(efct, "node %p shut down during session setup\n",
+			      node);
+		goto done;
 	}
 
 	tgt_node = node->tgt_node;
@@ -1202,8 +1253,9 @@ static void efct_lio_setup_session(struct work_struct *work)
 	efc_log_debug(efct, "new initiator sess=%p node=%p id: %llx\n",
 		      se_sess, node, id);
 
-	if (xa_err(xa_store(&efct->lookup, id, tgt_node, GFP_KERNEL)))
+	if (xa_err(xa_store(&efct->lookup, id, tgt_node, GFP_ATOMIC)))
 		efc_log_err(efct, "Node lookup store failed\n");
+	spin_unlock_irqrestore(&efc->lock, flags);
 
 	efc_scsi_sess_reg_complete(node, 0);
 
@@ -1215,7 +1267,9 @@ static void efct_lio_setup_session(struct work_struct *work)
 			efct->tgt_efct.watermark_min : watermark;
 	atomic_set(&efct->tgt_efct.io_high_watermark, watermark);
 
+done:
 	kfree(wq_data);
+	kref_put(&node->ref, node->release);
 }
 
 int efct_scsi_new_initiator(struct efc *efc, struct efc_node *node)
@@ -1231,6 +1285,7 @@ int efct_scsi_new_initiator(struct efc *efc, struct efc_node *node)
 	if (!wq_data)
 		return -ENOMEM;
 
+	kref_get(&node->ref);
 	wq_data->ptr = node;
 	wq_data->efct = efct;
 	INIT_WORK(&wq_data->work, efct_lio_setup_session);

base-commit: f47d223627f80cb7a1eb14c585fe6cb35de5e984
-- 
2.43.0

