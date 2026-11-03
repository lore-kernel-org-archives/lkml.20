Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745502;
	b=ugP9CICvnYdm+xCgtlcqmqx+NSnhvGYlSPF+OJpJ5xLyqdmewkd63XmDFVXqDMcdm6Gd
	 c+nbFFed3SkIN8wOZLuUhbo2a8CWkSRm3FM7hDLY9PToEyIYbOOChChDLrpU04YZRQY+7
	 /DFhVoEfA+IhEBfvCnGuBcAEt/f7bAwNhy7JQXxl5IRnpkTp0S5HBhmFpIZNksIRIDZig
	 ljbBYN1BPkoY0zRxyZt0OvlnHlG5Tq4G9xCrc7A4VfUf2oQxLEp1/kfQ527A74UTxzk7t
	 m1icbxbzx7n0Z/rEqTx53Ud1w4gufyOhsXg/79H36+9zLXkYMA9jrM05R5uTIznX8SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oVa6CCAH519bjAZCKZQVejZVAzQohLPWeK+tg1l7Elc=;
	b=xBWqO5JWq8SJiFf4qbxLd5JpGKrciYfHrF/gTYUsd9PfBnqMc3JknA8ayeGYQbchvDOo
	 0kCYbCU9N2v3u9xHScV7h3epyLXFZ57kogT7sHHkt11W+qrNE2rR4oH2wzbX1j9mf0i9x
	 xWm2C9RO/IdHKTHqzR8Y6sR5I+EYKC2AB9vUcLDk9Tu/RcJPZnvy8ymRmRKLEf0Txxqjd
	 sx284gihDwjqJTUR9sXB1EQr4mb4SSl/Qi1VMVrMLXOeBHtqd6pKRAHb5X9FKA4jypgOp
	 QKl8o3dQq7kkRmztbDqQ60ilH15c33ymGt9pCBKAuJDvvUzzAOQE4mWfQjk1Z2z+W8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UzljqbMO;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D25E606A339
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D25E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UzljqbMO
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so96372a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793745501; x=1794350301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVa6CCAH519bjAZCKZQVejZVAzQohLPWeK+tg1l7Elc=;
        b=UzljqbMOliahk7tS2CmmVxJlobWE9nr6OvmSJkwEivVJG+m3CeyFS7evD5FD3KbHr6
         E44hGb4xP6BzyJKIksQmXx98WbHtpVJZOptHuaKojNtlrpMTD1H8iLDtmxuJWIgk/0Hh
         OBPKgNAg2zXhBfE2KnjedMK+fRKa7Y1YkXoI2ZXaqdoL2Jr2n8JCUT7Xvbs1rbPM30LR
         wqpbvZfYnin2M/NmP+nVhz8bm2HhK9yq+zcKMuBw29Mng9msPb9tc2R1yh15mntvDzo9
         Quc+gRL1fhVkfm9Wh6elS7DIgmEAZ7QwH2dWWKgXExgr5ndzJxEmLi7UGajXHg2E27G8
         oAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745501; x=1794350301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oVa6CCAH519bjAZCKZQVejZVAzQohLPWeK+tg1l7Elc=;
        b=iE2batKih5NhcSKleV5MKCL7C3rpKMTisdtd/HHm4h8rhfIcpxTJzzO+t07LFvtf6G
         r16lBi3J0UvYDGoZNxh4qug/nPhS2OxjC6GmuPhWOItZcz2sOzFnIqmOBdhR/36q19dz
         jLe+YpyYByo1TSaQykrjH6ZmtkkUQ2y/kpKUN09yQ1h3fSsuGLeb91pCIjDQrJVTdTE4
         8CVVvB0YJ72jhAivR1f5bhirXI7GnvkNWXU42op8FbWv32z+sDV5a20cHUnvfLIhQWg2
         xbaS3+4IH6gAbufsIz3WH56GeJsdNK5vwLycGxo+AVcBCflFVOF0aFIDAOvNzkU9rVdu
         qlyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBh6st1GGHupQNEZPbQgVPfbtKU8VNiUHDjJOmxEF6le/X6uL3soqpGjAfr/+rQxf4O77bAo/uYssc85g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mH8fpgxJSxgS2K5f6XFv4RbqHWxfvMMJhO853ajJ6EWuBlMSY
	OpexStVU1pxiJBOg0vp/CvQSzcIe57leOu2neCYDYv0yay4MBu4O0d8IeFJZETBWZUSOszD+nvk
	lon3Jx5c=
X-Gm-Gg: AYBFou285JFM/6hei2CK8EoptFRacWNL6pV4yIcoW3aiVhObvtJJPrZM5gx/9phdIWc
	9TSN03bYLFfDRU/wr+JpsKCbrPUHNHaWShzFpWxsB5A/46JZmqF5aKSZ2DtS+oLxqGFUiwFkrnD
	iPSu6XAJhwg1hJvAELTRNwWJXQbP4Be44FF6xEkW/VHTOhhPnRWY0EZtf5TguNVYpiR1sSz+LgG
	U6ZzMwgn3sIW+KPpOapP7m0iJIMPkHWj9BKCShqYzZ7YYc6OtBbzJVbHc4qq+qQRHpx2S8lOMTl
	0vNlRGgjzR7q61CAt5Ulbjmbra68jZ+BVJGorxtnncv/WhIM9sHIGg+bw8G1i/MouD0mS3Y1wyr
	jjlvx4vKOD95NDcny083AoZXr9AtifD0wrBR9nS2FPy4MwbCFKGZQR8Tn3PGWylcBidRPMDcMnu
	2KVW/d5u1Hjtw650dckDg1Tu70fAHC84e4D1ltzxV/5pHjvnnmXl/CP/cISmnHLd9DQn0k4bI/m
	234n51WB2apoYxKQB2wjS8vPWMIVOFOYB9IQ6mZFzRCDNimpuzhTAZc7UBytMU6BnXyByn8FbgW
	0JIMuUFi6cZRPQtrVTykuOp4ef2sgJ6KJgvpoxkTuw5+ggCW357/PLdLu1DH7OdQj7Ag91OEoA/
	EwlwRGs6XlWw7F6GLizl/kHbjUN3xKmPglURbFzq8ENPOgnSTaZ06OmmE4A==
X-Received: by 2002:a17:90b:48c6:b0:3ac:9717:afd1 with SMTP id 98e67ed59e1d1-3ae897e07b5mr12133097a91.63.1793745501324;
        Tue, 03 Nov 2026 14:38:21 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:744:cf40:a7b2:e78f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096b6116bsm223711a91.4.2026.11.03.14.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:38:20 -0800 (PST)
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
Subject: [PATCH v6 2/6] IB/isert: drain the QP without holding isert_conn->mutex
Date: Wed,  4 Nov 2026 07:37:58 +0900
Message-ID: <20261103223802.1697607-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103223802.1697607-1-yhlee@isslab.korea.ac.kr>
References: <20261103223802.1697607-1-yhlee@isslab.korea.ac.kr>
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

isert_disconnected_handler() drains the QP with isert_conn->mutex held.
The drain waits for the flush completions of the send and receive queues,
and those are reaped by ib_cq_poll_work() on ib-comp-wq, where
isert_login_recv_done() takes isert_conn->mutex before it looks at the
connection state.  If a login receive completes while the handler holds
the mutex, the completion handler blocks on the mutex and the drain blocks
on the completion that handler would have reaped.

Return from isert_conn_terminate() whether this caller moved the
connection to ISER_CONN_TERMINATING, and drain after dropping
isert_conn->mutex.  Only the owner of isert_conn->node drains, so two
callers cannot drain the same QP; the send and receive queues reserve room
for one drain each, and a second concurrent drain hits the WARN_ONCE in
__ib_drain_sq() and returns without draining.

Two test-only delays open the window, one in isert_login_recv_done() and
one before the drain.  Three runs of 7.4-rc1 plus patch 1 of this series
printed ten hung task warnings each, eight, five and five of them waiting
in ib_drain_qp().  Three runs with this patch printed none, and
PROVE_LOCKING reported no splat in two runs a side.

  INFO: task kworker/0:1:10 blocked for more than 10 seconds.
        Not tainted 7.4.0-rc1-NS1-00002-g7b7ecb49489e #121
  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  task:kworker/0:1     state:D stack:26248 pid:10    tgid:10    ppid:2      task_flags:0x4208060 flags:0x00080000
  Workqueue: ib_cm cm_work_handler
  Call Trace:
   <TASK>
   __schedule+0x180f/0x4bb0
   ? _raw_spin_lock_irq+0x1/0xe0
   ? __pfx___schedule+0x10/0x10
   schedule+0x70/0x1f0
   schedule_timeout+0x1cd/0x200
   ? __pfx_schedule_timeout+0x10/0x10
   ? rxe_qp_from_attr+0x1497/0x18c0
   ? __pfx__raw_spin_lock_irq+0x10/0x10
   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
   ? _raw_spin_lock_irqsave+0x86/0xe0
   __wait_for_common+0x29e/0x420
   ? __pfx_schedule_timeout+0x10/0x10
   ? __pfx___wait_for_common+0x10/0x10
   __ib_drain_sq+0x251/0x340
   ? __pfx___ib_drain_sq+0x10/0x10
   ? __pfx_ib_drain_qp_done+0x10/0x10
   ? irq_work_queue+0x1c/0xb0
   ? __pfx__printk+0x10/0x10
   ? __pfx_process_timeout+0x10/0x10
   ib_drain_sq+0x146/0x1a0
   ib_drain_qp+0xd/0x50
   isert_disconnected_handler.isra.0+0xc4/0x3f0
   isert_cma_handler+0xd74/0x27d0
   ? kasan_save_stack+0x42/0x60
   ? kasan_save_stack+0x33/0x60
   ? kasan_save_track+0x14/0x30
   ? kasan_save_free_info+0x3b/0x60
   ? __kasan_slab_free+0x43/0x70
   ? kfree+0x121/0x390
   ? cm_process_work+0x8b/0x330
   ? __pfx_isert_cma_handler+0x10/0x10
   ? kthread+0x2c8/0x3b0
   ? ret_from_fork+0x36e/0x5a0
   ? ret_from_fork_asm+0x1a/0x30
   ? _raw_spin_lock_irqsave+0x86/0xe0
   cma_cm_event_handler+0x3e/0x240
   cma_ib_handler+0x190/0x750
   ? __pfx_cma_ib_handler+0x10/0x10
   cm_process_work+0x41/0x330
   cm_work_handler+0x582b/0xc160
   ? _raw_spin_lock_irqsave+0x86/0xe0
   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
   ? hrtimer_start_range_ns+0xa6/0x2c0
   ? __pfx_cm_work_handler+0x10/0x10
   ? finish_task_switch.isra.0+0x1d9/0xa70
   process_one_work+0x697/0x1060
   ? __pfx___schedule+0x10/0x10
   ? __pfx_process_one_work+0x10/0x10
   ? _raw_spin_lock_irq+0x81/0xe0
   ? __pfx_cm_work_handler+0x10/0x10
   ? assign_work+0x11d/0x370
   worker_thread+0x45b/0xd10
   ? __pfx_worker_thread+0x10/0x10
   ? __pfx_worker_thread+0x10/0x10
   kthread+0x2c8/0x3b0
   ? recalc_sigpending+0x15c/0x1e0
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0x36e/0x5a0
   ? __pfx_ret_from_fork+0x10/0x10
   ? __switch_to+0x572/0xdc0
   ? __pfx_kthread+0x10/0x10
   ret_from_fork_asm+0x1a/0x30
   </TASK>

Fixes: 6d1fba0c2cc7 ("iser-target: Rework connection termination")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/isert/ib_isert.c | 75 ++++++++++++-------------
 1 file changed, 36 insertions(+), 39 deletions(-)

diff --git a/drivers/infiniband/ulp/isert/ib_isert.c b/drivers/infiniband/ulp/isert/ib_isert.c
index ef2edaa3218fee..61b214012a70b0 100644
--- a/drivers/infiniband/ulp/isert/ib_isert.c
+++ b/drivers/infiniband/ulp/isert/ib_isert.c
@@ -556,43 +556,21 @@ isert_put_conn(struct isert_conn *isert_conn)
 	kref_put(&isert_conn->kref, isert_release_kref);
 }
 
-static void
-isert_handle_unbound_conn(struct isert_conn *isert_conn)
-{
-	struct isert_np *isert_np = isert_conn->cm_id->context;
-
-	mutex_lock(&isert_np->mutex);
-	if (!list_empty(&isert_conn->node)) {
-		/*
-		 * This means iscsi doesn't know this connection
-		 * so schedule a cleanup ourselves
-		 */
-		list_del_init(&isert_conn->node);
-		isert_put_conn(isert_conn);
-		queue_work(isert_release_wq, &isert_conn->release_work);
-	}
-	mutex_unlock(&isert_np->mutex);
-}
-
 /**
  * isert_conn_terminate() - Initiate connection termination
  * @isert_conn: isert connection struct
  *
- * Notes:
- * In case the connection state is BOUND, move state
- * to TEMINATING and start teardown sequence (rdma_disconnect).
- * In case the connection state is UP, complete flush as well.
- *
- * This routine must be called with mutex held. Thus it is
- * safe to call multiple times.
+ * Return: true if this caller moved the connection to ISER_CONN_TERMINATING.
  */
-static void
+static bool
 isert_conn_terminate(struct isert_conn *isert_conn)
 {
 	int err;
 
+	lockdep_assert_held(&isert_conn->mutex);
+
 	if (isert_conn->state >= ISER_CONN_TERMINATING)
-		return;
+		return false;
 
 	isert_info("Terminating conn %p state %d\n",
 		   isert_conn, isert_conn->state);
@@ -601,6 +579,8 @@ isert_conn_terminate(struct isert_conn *isert_conn)
 	if (err)
 		isert_warn("Failed rdma_disconnect isert_conn %p\n",
 			   isert_conn);
+
+	return true;
 }
 
 static int
@@ -635,26 +615,44 @@ isert_disconnected_handler(struct rdma_cm_id *cma_id,
 			   enum rdma_cm_event_type event)
 {
 	struct isert_conn *isert_conn = cma_id->qp->qp_context;
+	struct isert_np *isert_np = cma_id->context;
+	bool owned = false, bound = false, terminated = false;
 
 	mutex_lock(&isert_conn->mutex);
 	switch (isert_conn->state) {
-	case ISER_CONN_TERMINATING:
-		break;
 	case ISER_CONN_UP:
-		isert_conn_terminate(isert_conn);
-		ib_drain_qp(isert_conn->qp);
-		isert_handle_unbound_conn(isert_conn);
+		mutex_lock(&isert_np->mutex);
+		if (list_empty(&isert_conn->node)) {
+			bound = isert_conn->state == ISER_CONN_BOUND ||
+				isert_conn->state == ISER_CONN_FULL_FEATURE;
+		} else {
+			owned = true;
+			list_del_init(&isert_conn->node);
+		}
+		mutex_unlock(&isert_np->mutex);
 		break;
 	case ISER_CONN_BOUND:
 	case ISER_CONN_FULL_FEATURE: /* FALLTHRU */
-		iscsit_cause_connection_reinstatement(isert_conn->conn, 0);
+		bound = true;
 		break;
 	default:
-		isert_warn("conn %p terminating in state %d\n",
-			   isert_conn, isert_conn->state);
+		break;
 	}
+
+	if (owned)
+		terminated = isert_conn_terminate(isert_conn);
+	else if (bound)
+		iscsit_cause_connection_reinstatement(isert_conn->conn, 0);
 	mutex_unlock(&isert_conn->mutex);
 
+	if (!owned)
+		return 0;
+
+	if (terminated)
+		ib_drain_qp(isert_conn->qp);
+	isert_put_conn(isert_conn);
+	queue_work(isert_release_wq, &isert_conn->release_work);
+
 	return 0;
 }
 
@@ -665,8 +663,6 @@ isert_connect_error(struct rdma_cm_id *cma_id)
 	struct isert_np *isert_np = cma_id->context;
 	bool owned;
 
-	ib_drain_qp(isert_conn->qp);
-
 	mutex_lock(&isert_np->mutex);
 	owned = !list_empty(&isert_conn->node);
 	list_del_init(&isert_conn->node);
@@ -677,6 +673,7 @@ isert_connect_error(struct rdma_cm_id *cma_id)
 		return 0;
 	}
 
+	ib_drain_qp(isert_conn->qp);
 	isert_conn->cm_id = NULL;
 	isert_put_conn(isert_conn);
 
@@ -2479,11 +2476,10 @@ isert_accept_np(struct iscsi_np *np, struct iscsit_conn *conn)
 	isert_conn = list_first_entry(&isert_np->pending,
 			struct isert_conn, node);
 	list_del_init(&isert_conn->node);
-	mutex_unlock(&isert_np->mutex);
-
 	conn->context = isert_conn;
 	isert_conn->conn = conn;
 	isert_conn->state = ISER_CONN_BOUND;
+	mutex_unlock(&isert_np->mutex);
 
 	isert_set_conn_info(np, conn, isert_conn);
 
@@ -2547,6 +2543,7 @@ isert_free_np(struct iscsi_np *np)
 
 		isert_info("cleaning isert_conn %p state (%d)\n",
 			   isert_conn, isert_conn->state);
+		ib_drain_qp(isert_conn->qp);
 		if (promoted)
 			isert_put_conn(isert_conn);
 		isert_put_conn(isert_conn);
-- 
2.43.0

