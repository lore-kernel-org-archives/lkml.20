Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793755358;
	b=erF8hV6G/DNKgew87bp5Ux56897F3yKCDL43zugqGZYigJyfU9dTVTRRMYeP3/mHwshX
	 bzBfQPcEiBqLr4PgUhb8lURuzyNX7T5bg//iMABv62EkrgzCZFoofZa/ELcGzvYfmUSZc
	 dNDA7NUf/QnfWyRfsOHv2pi9Y3SHfJqYJp0s6V2iN5okAoehcCqMW+mcxJM9ojdVfUi/k
	 zlEL5EO2zWaBXNvx/6oM1qD+ZgvMlK7uAzAT8HJFXUWQjMaMbmSW5hAzLT9LGFzMze7ic
	 L8Tsybnlrn98hBku7QBM4+jgmV7Ccrz3SfdG9LV9EurnViDHSQlJbT/JJscKPeK+kHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793755358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9TbVYvpSeD3EGVYLSVcnsamFqScX3vaSw3kvz6iivhs=;
	b=qA69gc2IamegZwPjA42RNCuZ3Q+FRwASMmoWs+4AMBNNJkm9UKy6OMjOWXkGQli3iIab
	 MZtt5QcRPP4cev0AGr+RtXFGNK9qxRJ3J7fMLvgfhH4S3iuQA/EczFTHhaQ98sI7VMifD
	 r5UtfsEk0I06PCm+te48ToUvqoaEEnZjuA3XNNClOvhiYW/S94QUe9QYNmby/Q0ETfjTE
	 pLMJ/SvtPuCGK/Pd+H/NATts4lfO9g7Oh7HbQP1GSccgrK7dlAaZFIzYJtvYHshynZjWv
	 kv/9oW8TwX6y58EW280uRhTdigiAnjoDvDO7/rLre9u1DEvxIqmZPsMl7jGu3low0Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ze3dTsT0;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50501606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50501606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ze3dTsT0
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so113330a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793755356; x=1794360156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TbVYvpSeD3EGVYLSVcnsamFqScX3vaSw3kvz6iivhs=;
        b=Ze3dTsT0TOl/uFzOnJpxE5J4tFOWSrcykQiAnuMjLjOz40IhLPbprSWMU0vEyYl7NV
         pOxkfIRG8hcWmqQ0DHGUBbdIYoSs9sSb75n2SgW5N4+Htj9kCjjP5lYcdP97CkHv05Aa
         fmszbSuheqcfVZyRyjSTtrj5o45eo88b3c3rp+CxhKaQwHqhCPe/laFumQW7ZG2ovYZ3
         lf4LnL+uM4LAM3VTFmCxOe/5bo0vsGls3siVchapYxNa6mDyJkkEsEuKjou/pLzhnhUX
         vMVWfosmSft8C9FCmJl5iTG2N1Gg1qB+ZlzZXVMJ0NhhhKZ2k3sJ18Lo7iMOJWimBjgm
         yFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793755356; x=1794360156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TbVYvpSeD3EGVYLSVcnsamFqScX3vaSw3kvz6iivhs=;
        b=FtL2j6+Ja97oo4hFvSMcnzFGR6iiLowwTQaKONpb/PJsxc94n2079sH3apYE6Jv95S
         UpSN0QTcY5O7SlXjOq83Y0ELNLU5FsnMAwUMSpCtq++sfqYYfwo+KzVK9ksFCLFexJfa
         r08Rrvfts0fIZ79omKQQzAjOXJGyj3Mawb9y/Nbtaf2TVsTsDTRxnD48HiWm0BAPACBn
         TreAXWs2tr4H23R6YgD3mJ3C1HdfR5waISQg96cXduUypWy2AB5o4TZdAc4nooTYcWtE
         WyvhETXDV3/9xTvAehZRBTgU7zhNDflaNxMEcTjgnOC0fx0QJcgtyj7IEIVEIw4qH/3U
         3qlg==
X-Forwarded-Encrypted: i=1; AKwUvByqtN+IDx+mXx/0DRl+iAkt3EA5opdzG1tPMVwNhbeHd3PnjztOKzaM5fwBhZPWaDxd0MRPbmg6W93t3rc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AWiLN5qK05sDphPj4prdZZl4TZ8umPrMkolDBTYhRxz1A7wj3
	3n/cjbnSapJLOdv5ZGXEB6ysAdE06OwQq+m85kvC/m0TXvuYEeNVEdmbKbuur/qmRGo=
X-Gm-Gg: AYBFou22RfEBJ1D2nMSvy1u0sjD+TJ1DQGoc1RKCkGYCHzgXpq0hVAB5WIzCJARte11
	Bdhx0RWs/cPvYuHTLoYZr8X/8h9SLJGdTBt2Rpw8UpkbU4o1iH87Qb5EvGhlLcV3a5Hsi3sQev1
	ZZSVMI2CD/Zz6NM36laN1TZ7rIqZpqMkLs6QiD6PHC2a2SI58Ns18dhQ0TYWrhRTr0hqDTqeuch
	wB27DsGL1OQasjKfddCINQA0/xGYTb7qfZ9igrXr49A4vsV3xyfcxhQFyRx6aCPkn73jLHxPlEj
	f4JKPa4oBW5bgejtbVSj5x5DqOuF5G0Nl7egPlJgr2WCG8WYH/hfKthoBwFLUme9IwEXv5WgM8y
	0o1pizsPBs1UEpodhjoXztnRqwJr4U0M84Y07FJ80IPbSr9QatUVeRy0K8Qou7EGiEG2HDwf1RN
	7B8uqaCJjFr/8+96iuENEwxXRZUqVWVrLIibvHxX0N2qbsPtJ+NLJgMZNkWhBi9m370opI0eRdi
	S609X8mPVIR4e6EqHHUTOfhXSiGX5DIxEU1rblIlxNX8I2/zLUmT9mVNIo8Sjg19SnnkPGQoRKB
	zmNRlnPc91H3X9+wZf52urdVrvgRYehbeGCekIc/II2PtNu3FCvzRpj0xC5Y/7DAZurUHVXc2+j
	JUyLCA5dSdoktXqTwTF6Hvhoq9KvckZj0v63Yb1mr1WExERUBAH4kQAKR1A==
X-Received: by 2002:a17:90b:5487:b0:3ac:adce:60ad with SMTP id 98e67ed59e1d1-3ae89775250mr10246827a91.22.1793755355467;
        Tue, 03 Nov 2026 17:22:35 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:744:cf40:a7b2:e78f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09452d89bsm678045a91.0.2026.11.03.17.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:22:35 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Sagi Grimberg <sagi@grimberg.me>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Christie <michael.christie@oracle.com>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH v7 1/6] IB/isert: do not publish connections being released on a second list
Date: Wed,  4 Nov 2026 10:22:14 +0900
Message-ID: <20261104012219.1759523-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104012219.1759523-1-yhlee@isslab.korea.ac.kr>
References: <20261104012219.1759523-1-yhlee@isslab.korea.ac.kr>
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

isert_connect_error() and isert_disconnected_handler() take a connection
off isert_np->accepted or isert_np->pending and release it, but they do not
check whether the other one got there first, and the connection also stays
reachable from the list that isert_free_np() walks.  Two callers can
therefore release the same connection, and isert_free_np() can release one
a CM handler has already freed.

Make the list the single owner token.  A caller that empties
isert_conn->node under isert_np->mutex owns the drain and the release; one
that finds it already empty stands back and returns zero, so cma keeps the
id and the owner destroys it.  isert_connect_error() drains before it takes
the connection, which is the order mainline already uses, so no drain can
run on a QP whose id another handler is tearing down.

A test-only delay in isert_free_np(), right after it has taken a
connection, opens the window; it does not open on its own in this setup.
With it, two runs of 7.4-rc1 reported 22 use-after-frees each and then an
oops at a NULL instruction pointer in the rmdir task, which was killed.
Two runs with this patch reported neither, and the rmdir returned in seven
seconds.

  BUG: KASAN: slab-use-after-free in isert_connect_release+0x5c1/0x620
  Read of size 8 at addr ffff888109c5d160 by task rmdir/191

  CPU: 1 UID: 0 PID: 191 Comm: rmdir Not tainted 7.4.0-rc1-NSR-00001-gffec6cbc0e7e #129 PREEMPT(full)
  Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
  Call Trace:
   <TASK>
   dump_stack_lvl+0x53/0x70
   print_report+0xd0/0x630
   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
   ? isert_connect_release
   ? isert_connect_release+0x5c1/0x620
   kasan_report+0xce/0x100
   ? isert_connect_release+0x5c1/0x620
   isert_connect_release+0x5c1/0x620
   isert_free_np+0x4cf/0xb20
   ? __pfx_isert_free_np+0x10/0x10
   iscsit_del_np+0x163/0x340
   iscsit_tpg_del_network_portal+0x3c3/0x530
   ? mutex_unlock+0x7b/0xd0
   lio_target_call_delnpfromtpg+0x40/0x60
   config_item_cleanup+0x115/0x190
   configfs_rmdir+0x7c7/0x9f0
   ? __pfx_configfs_rmdir+0x10/0x10
   vfs_rmdir+0x291/0x7b0
   ? lookup_one_qstr_excl+0x1a/0x1d0
   filename_rmdir+0x390/0x560
   ? __pfx_filename_rmdir+0x10/0x10
   ? kasan_save_track+0x14/0x30
   ? __kasan_slab_alloc+0x6e/0x70
   ? strncpy_from_user+0x2b/0x1c0
   __x64_sys_rmdir+0x41/0x60
   do_syscall_64+0xdd/0x4a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
  RIP: 0033:0x463b6b
  Code: 77 05 c3 0f 1f 40 00 48 c7 c2 e0 ff ff ff f7 d8 64 89 02 48 c7 c0 ff ff ff ff c3 0f 1f 40 00 f3 0f 1e fa b8 54 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 05 c3 0f 1f 40 00 48 c7 c2 e0 ff ff ff f7 d8
  RSP: 002b:00007ffcc34f26c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
  RAX: ffffffffffffffda RBX: 000000003b607218 RCX: 0000000000463b6b
  RDX: 0000000000000000 RSI: 000000003b5ea9e0 RDI: 000000003b607218
  RBP: 00007ffcc34f2700 R08: 0000000000000000 R09: 0000000000000000
  R10: 00007ffcc34f2040 R11: 0000000000000246 R12: 000000003b607288
  R13: 0000000000000000 R14: 0000000000000000 R15: 00000000005e6245
   </TASK>

  Allocated by task 72:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   __kasan_kmalloc+0x8f/0xa0
   __kmalloc_cache_noprof+0x148/0x360
   isert_cma_handler+0x1e3/0x28a0
   cma_cm_event_handler+0x3e/0x240
   cma_ib_req_handler+0x17d9/0x4480
   cm_process_work+0x41/0x330
   cm_work_handler+0x5727/0xc160
   process_one_work+0x697/0x1060
   worker_thread+0x45b/0xd10
   kthread+0x2c8/0x3b0
   ret_from_fork+0x36e/0x5a0
   ret_from_fork_asm+0x1a/0x30

  Freed by task 10:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   kasan_save_free_info+0x3b/0x60
   __kasan_slab_free+0x43/0x70
   kfree+0x121/0x390
   isert_cma_handler+0x1148/0x28a0
   cma_cm_event_handler+0x3e/0x240
   cma_ib_handler+0x190/0x750
   cm_process_work+0x41/0x330
   cm_work_handler+0x1de2/0xc160
   process_one_work+0x697/0x1060
   worker_thread+0x45b/0xd10
   kthread+0x2c8/0x3b0
   ret_from_fork+0x36e/0x5a0
   ret_from_fork_asm+0x1a/0x30

Fixes: 691b0480933f ("IB/isert: Fix dead lock in ib_isert")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/isert/ib_isert.c | 81 ++++++++++++++++---------
 1 file changed, 54 insertions(+), 27 deletions(-)

diff --git a/drivers/infiniband/ulp/isert/ib_isert.c b/drivers/infiniband/ulp/isert/ib_isert.c
index efa8d7b7844c97..ef2edaa3218fee 100644
--- a/drivers/infiniband/ulp/isert/ib_isert.c
+++ b/drivers/infiniband/ulp/isert/ib_isert.c
@@ -521,13 +521,18 @@ isert_connected_handler(struct rdma_cm_id *cma_id)
 	isert_info("conn %p\n", isert_conn);
 
 	mutex_lock(&isert_conn->mutex);
+	mutex_lock(&isert_np->mutex);
+	if (list_empty(&isert_conn->node)) {
+		mutex_unlock(&isert_np->mutex);
+		mutex_unlock(&isert_conn->mutex);
+		isert_info("conn %p is being released already\n", isert_conn);
+		return;
+	}
 	isert_conn->state = ISER_CONN_UP;
 	kref_get(&isert_conn->kref);
-	mutex_unlock(&isert_conn->mutex);
-
-	mutex_lock(&isert_np->mutex);
 	list_move_tail(&isert_conn->node, &isert_np->pending);
 	mutex_unlock(&isert_np->mutex);
+	mutex_unlock(&isert_conn->mutex);
 
 	isert_info("np %p: Allow accept_np to continue\n", isert_np);
 	up(&isert_np->sem);
@@ -658,12 +663,20 @@ isert_connect_error(struct rdma_cm_id *cma_id)
 {
 	struct isert_conn *isert_conn = cma_id->qp->qp_context;
 	struct isert_np *isert_np = cma_id->context;
+	bool owned;
 
 	ib_drain_qp(isert_conn->qp);
 
 	mutex_lock(&isert_np->mutex);
+	owned = !list_empty(&isert_conn->node);
 	list_del_init(&isert_conn->node);
 	mutex_unlock(&isert_np->mutex);
+
+	if (!owned) {
+		isert_info("conn %p is being released already\n", isert_conn);
+		return 0;
+	}
+
 	isert_conn->cm_id = NULL;
 	isert_put_conn(isert_conn);
 
@@ -2479,12 +2492,33 @@ isert_accept_np(struct iscsi_np *np, struct iscsit_conn *conn)
 	return 0;
 }
 
+static struct isert_conn *
+isert_np_take_conn(struct isert_np *isert_np, bool *promoted)
+{
+	struct isert_conn *isert_conn;
+
+	lockdep_assert_held(&isert_np->mutex);
+
+	*promoted = true;
+	isert_conn = list_first_entry_or_null(&isert_np->pending,
+					      struct isert_conn, node);
+	if (!isert_conn) {
+		*promoted = false;
+		isert_conn = list_first_entry_or_null(&isert_np->accepted,
+						      struct isert_conn, node);
+	}
+	if (isert_conn)
+		list_del_init(&isert_conn->node);
+
+	return isert_conn;
+}
+
 static void
 isert_free_np(struct iscsi_np *np)
 {
 	struct isert_np *isert_np = np->np_context;
-	struct isert_conn *isert_conn, *n;
-	LIST_HEAD(drop_conn_list);
+	struct isert_conn *isert_conn;
+	bool promoted;
 
 	if (isert_np->cm_id)
 		rdma_destroy_id(isert_np->cm_id);
@@ -2497,32 +2531,25 @@ isert_free_np(struct iscsi_np *np)
 	 * up in accepted and pending lists.
 	 */
 	mutex_lock(&isert_np->mutex);
-	if (!list_empty(&isert_np->pending)) {
+	if (!list_empty(&isert_np->pending))
 		isert_info("Still have isert pending connections\n");
-		list_for_each_entry_safe(isert_conn, n,
-					 &isert_np->pending,
-					 node) {
-			isert_info("cleaning isert_conn %p state (%d)\n",
-				   isert_conn, isert_conn->state);
-			list_move_tail(&isert_conn->node, &drop_conn_list);
-		}
-	}
-
-	if (!list_empty(&isert_np->accepted)) {
+	if (!list_empty(&isert_np->accepted))
 		isert_info("Still have isert accepted connections\n");
-		list_for_each_entry_safe(isert_conn, n,
-					 &isert_np->accepted,
-					 node) {
-			isert_info("cleaning isert_conn %p state (%d)\n",
-				   isert_conn, isert_conn->state);
-			list_move_tail(&isert_conn->node, &drop_conn_list);
-		}
-	}
 	mutex_unlock(&isert_np->mutex);
 
-	list_for_each_entry_safe(isert_conn, n, &drop_conn_list, node) {
-		list_del_init(&isert_conn->node);
-		isert_connect_release(isert_conn);
+	for (;;) {
+		mutex_lock(&isert_np->mutex);
+		isert_conn = isert_np_take_conn(isert_np, &promoted);
+		mutex_unlock(&isert_np->mutex);
+
+		if (!isert_conn)
+			break;
+
+		isert_info("cleaning isert_conn %p state (%d)\n",
+			   isert_conn, isert_conn->state);
+		if (promoted)
+			isert_put_conn(isert_conn);
+		isert_put_conn(isert_conn);
 	}
 
 	np->np_context = NULL;
-- 
2.43.0

