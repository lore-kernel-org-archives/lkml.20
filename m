Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668172D94B5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768622; cv=none; b=MvH9R1v4oJNMtGA5t8es0/Zs40n6rKQPNglxbXOEx5Cce5+/wp/QZP4sBaJS0KN0iB/zKBOTYenrcw+UsgLzVzIidV7n8mwj8X8ea6kaK2m2laKaK9ONExrZiFRTqIA7AlagRO2940Zrojom25qz1S6LGr90ab3rULaznm/d7/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768622; c=relaxed/simple;
	bh=CdQuoA30ApFXuvRa3nVxfvwhSxchVNvrckZcZIrb4yg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=m5f3YNOgccINcY29bsZ7LfoJZB5lPZmq0QaVbPLMlLgF2/4sPoDYlowBJ1teAbN0BphmbqVvZM3K24bIePbsa0fVwsg0qsU3pbo7p6UCZzTrni92nRRWwfNIo2trj42DSLk+iZn3GEjbvVx54bZiMcSH7PKgW5+Ng7QQNOhWniE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvHkjTma; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvHkjTma"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so763785a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768621; x=1792373421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZ4C2x7LGn4MQbSpQ/jAIPT/FxLu2UPKPq73LTVbAM8=;
        b=bvHkjTmaUv0MfTin0DzXEQZLmo/rH4/MGJ+NdOGyOgSews9sVF3LsDZ+p6U34UL2pV
         YzajBH68Mmq651GAWTi3CLemVypeVAcQrPNuuB0FhjGqUZMliGdMJ7Ck9C3TwezMYcdC
         3JvFMfZ67dDuPvuf39t+iw3nFQ5DsTHENa7myXLXlWmcWNO38eWvJ5OAW4tnCjUtAM7V
         +l5oahRi47fqRZ/XkpCXLBsH2tbw+Zf4z0ge47hU2W0wCoKxLfLTZF3FXrD+sJhnycjY
         NLuEbG2gsgzYOuSGNwAXN/DNjt4ozcgNwMelMyd45P5jIcKPGMoVq87cXR5RH6wcJFKa
         jEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768621; x=1792373421;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FZ4C2x7LGn4MQbSpQ/jAIPT/FxLu2UPKPq73LTVbAM8=;
        b=JTbNWfmWsRLnm6i+selZd9aYU3nsVjejuAKCpqypGvExoRX/RCx76rC4u579vHsO1b
         tZIISdTJntx/XocPydZev7F+kQZiIYg2Bi4TVM+C2J2mNgZGezYS+ZSUZt4Q0JHO+hHS
         kySx9dL/PqON5JY1Bh9vYVrcRQMF8q8ynJ0S5XSXZobwCV97Fg1K/OwXL+8Jw9Qy+Dz1
         0qufWiii+Dtpfoy3aS051tJ1pFMlqTxHBkWCqWxwwamM0vU6e3TtQykaJYmrqSaddEkj
         xfMNWIYl33UJQ69QDr2/ufLWgdEaqHb13qhgOBXNCh00LaUSlfnzQRZg47zrqoL0+ZzQ
         AXoA==
X-Forwarded-Encrypted: i=1; AKwUvBw/SyEVFmwjeCsFrUlywgh98+chdoX3kPW6sfEus2srpKakcx0+Vic9pvuC1P3sb8cFloAKdRyc0L7Z1Gg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+jlyrafXU+qIO+UB/oefbpfswfwiQ8Lswvxyonkjf+h/kCdM1
	1zkj4ReN2shsTUhF5Kkl2zp641jQYLXcvHm5S5g4w77ARz/ByM+12Qou
X-Gm-Gg: AYBFou0WP+IP+pq8k3CS46ka4uk9A9ydiBzNmTmH8kvWJPOZ2QkCuoWgyPjY0ma36zu
	untmQBIvilTFo4zJRrkeXaZHH6fpsvNjoGUL8ZBvygva3Fo5dmLcu9RYJJ/pljAuHs7m/KXHxEv
	UkPy4SEfl0JgMKlEV3jBZTQfdYqhQxbmf0NW6SeZnq0UEB5SNM+Sc/NaHNMSGPoSK2FuvyWf6Vb
	zT75AcyP3xIiiYTzMxdyPlRRbhflMLpdo9pQXLycNQbj50GJ7MQpmbCXmt/TYxeQnRZG+yhO0LN
	aLR9hyIesKyLgPZy2zplH9MdBZJP2CYtxdRKT1tUqN/CVLZXTcWNQjCRGNxq8FoAgh6R6jmxYeb
	4gQUcdNkkEPS3GA3EEDOhkrnw8EENbugaZq3p4JE9d87ZeVnRj/zog3a9mm4voXRtNMAkFlWXMB
	jHA3ksUKdI32mq+j+l/4Wm4/OZar7PILn4wCIYnQBVSq9kuuhRl1FmKRVI2s0o1Xt99Q==
X-Received: by 2002:a17:90a:d006:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3ab3a9128c8mr6899233a91.14.1791768620580;
        Sun, 11 Oct 2026 18:30:20 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3abdd5d09aesm3837471a91.7.2026.10.11.18.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 18:30:20 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	heming.zhao@suse.com,
	kees@kernel.org,
	sunil.mushran@oracle.com
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ocfs2: hold a lock reference across grant AST enqueue
Date: Mon, 12 Oct 2026 09:30:14 +0800
Message-Id: <pm-ocfs2-objects-candidate-0043-v4-24e62761a79be6b84b55@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A newly granted remote lock must remain alive until its grant AST is
queued. dlmlock_master() publishes the lock on res->granted with its
base and queue references, then drops res->spinlock before calling
dlm_queue_ast(). The resource's reserved AST count does not retain the
lock itself.

This can fail when a peer dies with an immediately grantable CREATE
buffered on its socket. O2NET's node-down callback flushes receive work
before DLM cleanup, but the flush only waits for work queued on entry.
A data-ready callback that already selected the socket container can
queue new receive work after the flush advances its work color. Socket
shutdown does not discard bytes already queued for TCP receive.

The following ordering leaves the CREATE handler using a freed lock:

1. o2net_data_ready() selects the socket container while holding the
   socket callback read lock.
2. o2net_disconnect_node() queues shutdown and starts its flush. The
   callback queues sc_rx_work after the color change, then unlocks,
   allowing shutdown to unregister callbacks and shut down the socket.
3. The flush completes without waiting for the new receive work. That
   work consumes the buffered CREATE and dlmlock_master() grants the
   lock before DLM cleanup reaches the resource, then drops
   res->spinlock.
4. dlm_hb_node_down_cb() reaches dlm_free_dead_locks(), which takes
   res->spinlock, unlinks the lock and drops both references to free it.
5. The CREATE handler calls dlm_queue_ast(). __dlm_queue_ast() reads
   lock->lockres before acquiring its AST-list reference, causing UAF.

Take a temporary lock reference under res->spinlock when a grant AST
will be queued, and drop it after dlm_queue_ast(). This keeps the lock
alive across cleanup until the AST path has taken its own reference,
without reversing the existing AST/resource lock order.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in __dlm_queue_ast+0x8a4/0xc00
    Read of size 8 at addr ffff88810ead5940 by task kworker/u16:3/52

    CPU: 3 UID: 0 PID: 52 Comm: kworker/u16:3 Not tainted 7.3.0-rc4-next-20260921-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Workqueue: o2net o2net_rx_until_empty
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? __dlm_queue_ast+0x8a4/0xc00
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20e/0x420
     ? __dlm_queue_ast+0x8a4/0xc00
     kasan_report+0xe0/0x110
     ? __dlm_queue_ast+0x8a4/0xc00
     __dlm_queue_ast+0x8a4/0xc00
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? do_raw_spin_lock+0x130/0x270
     ? __pfx___dlm_queue_ast+0x10/0x10
     ? __pfx_do_raw_spin_lock+0x10/0x10
     ? _raw_spin_unlock_irqrestore+0x45/0x60
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lockdep_hardirqs_on_prepare+0xeb/0x1a0
     dlm_queue_ast+0x46/0x70
     dlmlock_master+0x51f/0xf50
     ? __pfx_dlmlock_master+0x10/0x10
     ? dlm_create_lock_handler+0x2b2/0x870
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_release+0xc8/0x290
     dlm_create_lock_handler+0x35b/0x870
     ? __pfx_dlm_create_lock_handler+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? trace_hardirqs_on+0x18/0x160
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? kvm_clock_get_cycles+0x31/0x60
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_dlm_create_lock_handler+0x10/0x10
     o2net_rx_until_empty+0x1dae/0x32c0
     ? reacquire_held_locks+0xdd/0x200
     ? __pfx_o2net_rx_until_empty+0x10/0x10
     ? lock_acquire+0x190/0x300
     ? process_one_work+0x935/0x1b40
     ? process_one_work+0x834/0x1b40
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_release+0xc8/0x290
     ? srso_alias_return_thunk+0x5/0xfbef5
     process_one_work+0x9a8/0x1b40
     ? __pfx_process_one_work+0x10/0x10
     ? lock_acquire+0x190/0x300
     ? lock_is_held_type+0x8f/0x100
     ? srso_alias_return_thunk+0x5/0xfbef5
     worker_thread+0x65c/0xe40
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __kthread_parkme+0x177/0x220
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_worker_thread+0x10/0x10
     kthread+0x351/0x460
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_kthread+0x10/0x10
     ret_from_fork+0x659/0x940
     ? __pfx_ret_from_fork+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __switch_to+0x74f/0xf70
     ? __pfx_kthread+0x10/0x10
     ret_from_fork_asm+0x1a/0x30
     </TASK>

    Allocated by task 52:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_slab_alloc+0x89/0x90
     kmem_cache_alloc_noprof+0x20b/0x5c0
     dlm_new_lock+0x39/0x5f0
     dlm_create_lock_handler+0x16e/0x870
     o2net_rx_until_empty+0x1dae/0x32c0
     process_one_work+0x9a8/0x1b40
     worker_thread+0x65c/0xe40
     kthread+0x351/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    Freed by task 603:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kmem_cache_free+0x242/0x580
     dlm_lock_release+0x1df/0x2f0
     dlm_lock_put+0x51/0x80
     __dlm_hb_node_down+0x15be/0x2710
     dlm_hb_node_down_cb+0x6c/0xa0
     o2hb_run_event_list+0x34a/0x500
     o2hb_do_disk_heartbeat+0x1a07/0x2950
     o2hb_thread+0x1ed/0xdc0
     kthread+0x351/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    The buggy address belongs to the object at ffff88810ead5900
     which belongs to the cache o2dlm_lock of size 184
    The buggy address is located 64 bytes inside of
     freed 184-byte region [ffff88810ead5900, ffff88810ead59b8)

    [Page and shadow memory dumps omitted.]

Fixes: 2c5c54aca9d0 ("ocfs2/dlm: Add missing dlm_lock_put()s")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
diff --git a/fs/ocfs2/dlm/dlmlock.c b/fs/ocfs2/dlm/dlmlock.c
index 46120eb75d90..660237c0d7cd 100644
--- a/fs/ocfs2/dlm/dlmlock.c
+++ b/fs/ocfs2/dlm/dlmlock.c
@@ -138,6 +138,8 @@ static enum dlm_status dlmlock_master(struct dlm_ctxt *dlm,
 					  res->lockname.len)) {
 			kick_thread = 1;
 			call_ast = 1;
+			/* Keep the lock alive through AST enqueue. */
+			dlm_lock_get(lock);
 		} else {
 			mlog(0, "%s: returning DLM_NORMAL to "
 			     "node %u for reco lock\n", dlm->name,
@@ -166,10 +168,12 @@ static enum dlm_status dlmlock_master(struct dlm_ctxt *dlm,
 	wake_up(&res->wq);
 
 	/* either queue the ast or release it */
-	if (call_ast)
+	if (call_ast) {
 		dlm_queue_ast(dlm, lock);
-	else
+		dlm_lock_put(lock);
+	} else {
 		dlm_lockres_release_ast(dlm, res);
+	}
 
 	dlm_lockres_calc_usage(dlm, res);
 	if (kick_thread)
