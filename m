Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1615376BF1
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306963; cv=none; b=OojaixXSGoKTXxFoRb7b/XiOGOIs4teDB9wmgizpkqJtmV4nC7SpMBMwHtbJCceTtiATPIQ2xpWQOAnKg5nx0f5U4BfIXUqX0zlJkIQfUUSDoA8Kpvo7aF+WHvXWu/stEvAnwd6HDHV2z//ZbvjmgbxX3Q8IxjxL1DE65qS7TbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306963; c=relaxed/simple;
	bh=jtKlCwhLKmB4inSlh+K5NB4apZmXnxlHgAVm20K4nmY=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=UCahQGiB2r8raRyUKYi7fg2SYqa2NzoPENpEmyLKiY+B4j6pZkVQZAXSyzxmPwDSrlp9EhOZ7dyfD076nYq21B28R171zLJPIJymI9UJ0x8+Ic/HPzkLEGXYAfRz1JlzeZFYuEVYO0FzRXQyai/cYD4I+vfHAHVPMln/59k0tL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=r1QVlkUQ; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="r1QVlkUQ"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93c5b7f5bfaso215116385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791306961; x=1791911761; darn=vger.kernel.org;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j6F+hA6obGyLmE9PtfwA4CrLTo8FSGDU65ZZ77hZT+c=;
        b=r1QVlkUQqAL1EfSM7AMBDc8XdfrTGjtAbQQczFs0VDl440KtWvNXhDDuTO7UEgPabi
         krU4YDxbB8C5e99mNd9lUc+5fZG0F5324lJbyXWe73alL3qw0wPVA8Ir3xdP5vl8Mfw3
         twxyl/XWELHyNO0EkZsW0Z5OVIaEwc2tHRZj+PH49PBNzw/NO+r6vle9/eEC+aENkX8V
         mRK/6vSrzKQ249v+ETiflnFVBVbo6eECzK73GwwbIgTWAw5kbQjnFqZ3ZhPcbBg8JnOn
         MrjnfcLXuFa6ax9H9RE73ISsn/bmcbtR7epG4I+uDMW3rI4eX4BI7AGY/WO5e7l51fMP
         OSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791306961; x=1791911761;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j6F+hA6obGyLmE9PtfwA4CrLTo8FSGDU65ZZ77hZT+c=;
        b=Ak5kr4gxgNiw43xHtNYoK3dA2kghyHz8X6Ua8OJnbg47jFaJYnVetvSZUJZSCq98Kc
         obnii/1OOqnzq0PBNaMZ9vlFzcvaRskJ+RsXNPHN4Ca3LzeruBCIlkgLDO2qyreN4OCp
         EOOp2VBNVlNS0k+dZA1OfoYGI8p9NrCqew/dXd5oAltWHN0L6HEHcR0apXw7gCsJJzJ8
         69Lkj82xuO+ZeKrk5pmh7oG2xc+XasC8nrQfFTexOc+vbnZzXbouaciIV46tf8lJgGFb
         uKs5afFm5/rTyaNdGCnG6o70Wsyv8129LbBWOtimRT3z/uR6g1mq8UM6VNBgkDYL6Loo
         lxmA==
X-Forwarded-Encrypted: i=1; AKwUvBwclYo6W4HD/AiVF53mmtbcp8b/NEp2icUTKiTiyAaHTV3AnDd9eg+bCoZAhHa8oCYG4i79rEHtLHOcZ+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nzefmPIu1Lcm4oFyU1Uck5VmaKFT53MUrYfUGXmHoCF6fNUxh/
	kpxt+R6QxGvhoklI0HrtdbyOK0DRR5tSBV6US9Qau49GHk+Bfv+nrPviZdjhL3Mvy4hRBOZESJQ
	lP3wu
X-Gm-Gg: AYBFou317Qwv0cOUGz+JIaHXxyf9sL2RUXSnWPQQzgYRkAM3da4bphLuqwclPV2drcq
	GgxCSvfbCWjWUUMX99o+kz8DubcoFDk18iaLAXbH1foi/hJahITgXrLmElCtqupbwBNTiVNJlBa
	gRxc5JikjYcL9hc6PSbEHM8AgYPPHjDTL3+g4NQ7pucslN1OI7phUCblbnm4Vuxg26hg2Yi6HNn
	b0p0R7c0KR7FtpQ5a9sa8NA/kfF0KkHio89MDdq+xPgiGQpgpub+4K8KauUIHVszxnjQGvJc5qB
	jJCsh1Gca4DBW5Z0Xczc562tZnJwUU5//dR8BA9o1qAFY64io/0EGk6onPeHUOZQkBhnJsP5ea5
	C429puYpONc3XPB2jMjvfVr/sLLZf1AWPlP3tTvlebQvRGJ4iZFqsc7LNzcwnYxkmg+KsBTO4Q/
	8lIGJI5ZGvmtr4L0tvmDxeZceAcZxQnJc4iKidkUsgHePIy8xKZjw3WdK8ZY7c/RnmCIXGr5+n0
	l7ARB1e7MKa6+g=
X-Received: by 2002:a05:620a:2585:b0:93e:9809:9a21 with SMTP id af79cd13be357-93e9809a013mr88143385a.37.1791306960158;
        Tue, 06 Oct 2026 10:16:00 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.241])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e991e9e5csm5411685a.37.2026.10.06.10.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 10:15:58 -0700 (PDT)
Message-ID: <20d60ea0e3c086d9985bc2763e0759d15372c03d.1791303049.git.josef@toxicpanda.com>
In-Reply-To: <cover.1791303049.git.josef@toxicpanda.com>
References: <20261001125422.1364260-1-tom.leiming@gmail.com>
	<cover.1791303049.git.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 6 Oct 2026 14:50:51 +0000
Subject: [PATCH 4/4] ublk: keep canceling in QUIESCE_DEV until the server's
 commands are taken
To: Ming Lei <tom.leiming@gmail.com>,
    Jens Axboe <axboe@kernel.dk>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
    linux-block@vger.kernel.org,
    linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

UBLK_CMD_QUIESCE_DEV can leave the server with a command nothing ever
completes. The server then never exits and the device stays LIVE:

    COMMIT_AND_FETCH                    QUIESCE_DEV
                                        queues marked canceling
                                        ublk_cancel_dev()
                                          request still with the
                                          server, io left alone
    ublk_fill_io_cmd()
      command armed again
    request completed

The same holds for a command whose request was dispatched before the
mark, and for the active fetch command of a UBLK_F_BATCH_IO queue, which
ublk_batch_cancel_queue() leaves to its dispatcher, and the dispatcher
only lets go of it. The kublk selftest server hangs this way within a
few quiesce and recover cycles under fio, on every kind of queue.

Since the previous patch a COMMIT_AND_FETCH on a canceling queue gives
its command back itself, once synchronize_rcu() has passed after the
mark. Keep taking the armed commands until no io of the server owes one
any more, and an active batch fetch command once its dispatcher has put
it back on the list. Stop on the QUIESCE_DEV timeout or a signal, with
-EBUSY or -EINTR. Leave ->force_abort of a batch queue alone, which
ublk_batch_cancel_queue() sets: requests of a recoverable device are
then requeued through ->canceling until the next server is ready, as on
a queue without UBLK_F_BATCH_IO, instead of failed.

The server may go away and a new one start fetching for recovery while
this runs, and its commands are not QUIESCE_DEV's to cancel. Count the
FETCH rounds in ub->fetch_round, which ublk_reset_ch_dev() bumps under
cancel_mutex when it clears ub->canceling, before a new server can
fetch. Each pass checks the round and takes the commands in one
cancel_mutex hold, and stops once the round has changed. The commands
are completed after cancel_mutex is dropped, since the ring's cancel
callback takes cancel_mutex under uring_lock.

Fixes: b465ae7b2524 ("ublk: add feature UBLK_F_QUIESCE")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/ublk_drv.c | 187 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 186 insertions(+), 1 deletion(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 6717dabf3a23..f8a5dd7e9404 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -129,6 +129,8 @@ struct ublk_uring_cmd_pdu {
 	union {
 		struct request *req;
 		struct request *req_list;
+		/* chains commands QUIESCE_DEV took, none has a request */
+		struct io_uring_cmd *next_claimed;
 	};
 
 	/*
@@ -296,6 +298,9 @@ struct ublk_queue {
 
 		/* Currently active fetch command (NULL = none active) */
 		struct ublk_batch_fetch_cmd  *active_fcmd;
+
+		/* fetch commands QUIESCE_DEV took, for it to complete */
+		struct list_head quiesce_fcmds;
 	}____cacheline_aligned_in_smp;
 
 	struct ublk_io ios[] __counted_by(q_depth);
@@ -344,6 +349,12 @@ struct ublk_device {
 	 * it is set, no queue clears its ->canceling.
 	 */
 	bool canceling;
+	/*
+	 * Counts FETCH rounds, bumped by ublk_reset_ch_dev() together with
+	 * clearing ->canceling, protected by cancel_mutex.  A cancel aimed at
+	 * one server checks it to leave the next server's commands alone.
+	 */
+	u32 fetch_round;
 	pid_t 	ublksrv_tgid;
 	struct delayed_work	exit_work;
 	struct work_struct	partition_scan_work;
@@ -2432,6 +2443,7 @@ static void ublk_reset_ch_dev(struct ublk_device *ub)
 	/* a new FETCH round starts, the queues stay canceling until ready */
 	mutex_lock(&ub->cancel_mutex);
 	ub->canceling = false;
+	ub->fetch_round++;
 	mutex_unlock(&ub->cancel_mutex);
 
 	/* set to NULL, otherwise new tasks cannot mmap io_cmd_buf */
@@ -4417,6 +4429,7 @@ static int ublk_init_queue(struct ublk_device *ub, u16 q_id)
 		if (ret)
 			goto fail;
 		INIT_LIST_HEAD(&ubq->fcmd_head);
+		INIT_LIST_HEAD(&ubq->quiesce_fcmds);
 	}
 	ub->queues[q_id] = ubq;
 	ubq->dev = ub;
@@ -5394,11 +5407,180 @@ static int ublk_ctrl_set_size(struct ublk_device *ub, const struct ublksrv_ctrl_
 	return ret;
 }
 
+/*
+ * Take the armed commands of a queue off their ios the way ublk_cancel_cmd()
+ * does, and chain them on @claimed.  Only after synchronize_rcu() in
+ * ublk_quiesce_cancel(): no COMMIT_AND_FETCH publishes a command on the
+ * canceling queue any more, see ublk_commit_io_cmd(), so an armed io is
+ * stable here.  Sets @left when an io still owes a command: its request is
+ * with the server, or its dispatch is pending and hands the request to the
+ * server, and either way the server's COMMIT_AND_FETCH gives the command
+ * back.
+ */
+static struct io_uring_cmd *ublk_quiesce_claim_queue(struct ublk_queue *ubq,
+						     struct io_uring_cmd *claimed,
+						     bool *left)
+	__must_hold(&ubq->dev->cancel_mutex)
+{
+	struct ublk_device *ub = ubq->dev;
+	u16 tag;
+
+	for (tag = 0; tag < ubq->q_depth; tag++) {
+		struct ublk_io *io = &ubq->ios[tag];
+		struct io_uring_cmd *cmd = NULL;
+		struct request *req;
+		bool started;
+
+		/* see ublk_cancel_cmd() */
+		req = blk_mq_tag_to_rq(ub->tag_set.tags[ubq->q_id], tag);
+		started = req && blk_mq_request_started(req) && req->tag == tag;
+
+		spin_lock(&ubq->cancel_lock);
+		if (!(io->flags & UBLK_IO_FLAG_CANCELED)) {
+			if ((io->flags & UBLK_IO_FLAG_ACTIVE) && !started) {
+				io->flags |= UBLK_IO_FLAG_CANCELED;
+				cmd = READ_ONCE(io->cmd);
+				io->cmd = NULL;
+			} else if (io->flags & (UBLK_IO_FLAG_ACTIVE |
+						UBLK_IO_FLAG_OWNED_BY_SRV)) {
+				*left = true;
+			}
+		}
+		spin_unlock(&ubq->cancel_lock);
+
+		if (cmd) {
+			ublk_get_uring_cmd_pdu(cmd)->next_claimed = claimed;
+			claimed = cmd;
+		}
+	}
+	return claimed;
+}
+
+/*
+ * The same for a UBLK_F_BATCH_IO queue: move its parked fetch commands to
+ * ->quiesce_fcmds.  The active one is left to its dispatcher, which puts it
+ * back on the list once it is done, and the next pass takes it.  Unlike
+ * ublk_batch_cancel_queue() this leaves ->force_abort alone: requests of a
+ * recoverable device are requeued through ->canceling until the next server
+ * is ready, as on a queue without UBLK_F_BATCH_IO.
+ */
+static void ublk_quiesce_claim_fcmds(struct ublk_queue *ubq, bool *left)
+	__must_hold(&ubq->dev->cancel_mutex)
+{
+	struct ublk_batch_fetch_cmd *fcmd;
+
+	spin_lock(&ubq->evts_lock);
+	list_splice_tail_init(&ubq->fcmd_head, &ubq->quiesce_fcmds);
+	fcmd = READ_ONCE(ubq->active_fcmd);
+	if (fcmd) {
+		list_move(&fcmd->node, &ubq->fcmd_head);
+		*left = true;
+	}
+	spin_unlock(&ubq->evts_lock);
+}
+
+/*
+ * The fetch commands stay linked, and the cancel callback of their ring may
+ * take one off the list first: whoever unlinks one under evts_lock
+ * completes it.
+ */
+static void ublk_quiesce_complete_fcmds(struct ublk_queue *ubq)
+{
+	struct ublk_batch_fetch_cmd *fcmd;
+
+	for (;;) {
+		spin_lock(&ubq->evts_lock);
+		fcmd = list_first_entry_or_null(&ubq->quiesce_fcmds,
+						struct ublk_batch_fetch_cmd, node);
+		if (fcmd)
+			list_del_init(&fcmd->node);
+		spin_unlock(&ubq->evts_lock);
+		if (!fcmd)
+			break;
+
+		io_uring_cmd_done(fcmd->cmd, UBLK_IO_RES_ABORT,
+				  IO_URING_F_UNLOCKED);
+		ublk_batch_free_fcmd(fcmd);
+	}
+}
+
+/*
+ * Cancel the server's commands for QUIESCE_DEV until none of the FETCH
+ * round it marked is left.  One pass is not enough: it has to skip a command
+ * whose request is with the server or whose dispatch is pending, and the
+ * server waits for every command before it exits.  After synchronize_rcu()
+ * a COMMIT_AND_FETCH gives its command back itself, and no new request is
+ * dispatched on a canceling queue, so each remaining command is either
+ * given back by its issuer or armed and taken by a later pass.
+ *
+ * Check the round and take the commands in one cancel_mutex hold, and stop
+ * once the round is over: ublk_reset_ch_dev() bumps it, under cancel_mutex,
+ * before the next server can fetch, and those commands are not ours to
+ * cancel.  Complete what was taken after cancel_mutex is dropped, the
+ * ring's cancel callback takes it under uring_lock.
+ */
+static int ublk_quiesce_cancel(struct ublk_device *ub, u32 round,
+			       unsigned int timeout_ms)
+{
+	unsigned int elapsed = 0;
+
+	/* see ublk_commit_io_cmd() */
+	synchronize_rcu();
+
+	for (;;) {
+		struct io_uring_cmd *claimed = NULL;
+		bool left = false;
+		u16 i;
+
+		mutex_lock(&ub->cancel_mutex);
+		if (ub->fetch_round != round) {
+			mutex_unlock(&ub->cancel_mutex);
+			return 0;
+		}
+		for (i = 0; i < ub->dev_info.nr_hw_queues; i++) {
+			struct ublk_queue *ubq = ublk_get_queue(ub, i);
+
+			if (ublk_support_batch_io(ubq))
+				ublk_quiesce_claim_fcmds(ubq, &left);
+			else
+				claimed = ublk_quiesce_claim_queue(ubq, claimed,
+								   &left);
+		}
+		mutex_unlock(&ub->cancel_mutex);
+
+		while (claimed) {
+			struct io_uring_cmd *cmd = claimed;
+
+			claimed = ublk_get_uring_cmd_pdu(cmd)->next_claimed;
+			io_uring_cmd_done(cmd, UBLK_IO_RES_ABORT,
+					  IO_URING_F_UNLOCKED);
+		}
+		for (i = 0; i < ub->dev_info.nr_hw_queues; i++) {
+			struct ublk_queue *ubq = ublk_get_queue(ub, i);
+
+			if (ublk_support_batch_io(ubq))
+				ublk_quiesce_complete_fcmds(ubq);
+		}
+
+		if (!left)
+			return 0;
+		if (signal_pending(current))
+			return -EINTR;
+		if (elapsed >= timeout_ms)
+			return -EBUSY;
+		msleep(UBLK_REQUEUE_DELAY_MS);
+		elapsed += UBLK_REQUEUE_DELAY_MS;
+	}
+}
+
 static int ublk_ctrl_quiesce_dev(struct ublk_device *ub,
 				 const struct ublksrv_ctrl_cmd *header)
 {
+	/* zero means wait forever */
+	u64 timeout_ms = header->data[0];
 	struct gendisk *disk;
 	bool live = true;
+	u32 round;
 	int ret = -ENODEV;
 
 	if (!(ub->dev_info.flags & UBLK_F_QUIESCE))
@@ -5427,6 +5609,7 @@ static int ublk_ctrl_quiesce_dev(struct ublk_device *ub,
 	mutex_lock(&ub->cancel_mutex);
 	blk_mq_quiesce_queue(disk->queue);
 	ublk_set_canceling(ub, true);
+	round = ub->fetch_round;
 	blk_mq_unquiesce_queue(disk->queue);
 	mutex_unlock(&ub->cancel_mutex);
 
@@ -5437,7 +5620,9 @@ static int ublk_ctrl_quiesce_dev(struct ublk_device *ub,
 
 	/* Cancel pending uring_cmd */
 	if (!ret && live)
-		ublk_cancel_dev(ub);
+		ret = ublk_quiesce_cancel(ub, round,
+					  timeout_ms ? min_t(u64, timeout_ms, UINT_MAX) :
+					  UINT_MAX);
 	return ret;
 }
 
-- 
2.55.0

