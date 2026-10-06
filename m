Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406FD49C4C2
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306959; cv=none; b=T4xGEsjHww9WhBu6C7oi0f4RPhjRCNf0Dg+BtAoMFyR+rk4pbHybXNKi7udBac22nMwLhk1wc3bENCyTXYzd5q1VVN68eMBQ1eGGW67cnGa6Irujxdwm0UoyKWhZ3X0lX9soPiK0GfJrWeJePmD89vyMWGuPpHPncDYHh4VCMhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306959; c=relaxed/simple;
	bh=Zdm2T6AevFfORGkCPmF2QjXcpStUZ/jMGyL/SE6t7mU=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=uLomOcIoirDKjEBokE9x5YqcyEmqG3bbmu5klLnWEtSAMris8WTwDF2325pELxm7pbczt30NSTFtvb/7DxCTQU8JK3s05g5ybyCsqpd5th/G+UuAm1htDK3OW/nsMT9DeGNoK2ZiBsEB62LYhRq67E+dPyCpOIQuyxdeUCKdZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=UYYC9cEO; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="UYYC9cEO"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-533778ab0bdso9022891cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791306957; x=1791911757; darn=vger.kernel.org;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xExnBleInceOlCuc+SUse0f1MyDmEoa14ImGZUlXkCw=;
        b=UYYC9cEOlMnJWtG7z7yZzo8HQMVYgOEL2WR1bl2BvDs4zeTTH05C3EueAjIrJapKSO
         e2Wgm6VX8AwKmEB+Ui13ucwVwTghIp/ck7cd7UWm9ZAu/QyfZDR++RtsblNwIy0OKbQ5
         GPFpjMsRHebJk3bZgEePcyCNx0Ta2aE5azQTrK2sttF72NTgRhkmwzzw2Ru9kI4KxhFD
         LZvKCetj2i3+PqeuZW2w1+r9ThC3nJG5+j4rT6QPP30joe/1+wueyransZT1rtuT68d+
         tf1RC2kNs9qt2e2lMjgADlFMPmaisRWxWj3+Kx5wD+iQ71NDBu8uQ97QWEnKMnGsccSa
         BO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791306957; x=1791911757;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xExnBleInceOlCuc+SUse0f1MyDmEoa14ImGZUlXkCw=;
        b=jsb9DRQzFDFk8tmMhUxgxyT4dCpr79G4t/vssYpWKssg7Ecyx2CsWjmtO4OtkOHwaH
         kKH3GTFeMkpyZzZFE8ErM7eAsKotReBvPJb0Y1CpDxCzS+IXxGQKtb6bKk3JV8c6c0IK
         eWVHJdLhYCdUaOhVQjjW722eTOCz06Nbyacw7AqCfsh+C1vngWF/spnDchg6Ohc3lCxb
         LUzx7iUQf3f6QwqGiA3mbIwBrYE2kTHs8NSU2HFz5VFuPAV4XicoaeFeLJQQaEgu7YcI
         ZCiOpoSjNVADK/vTwXjxjoMYwQQ0chte358Ua4Yusiq5u/ARb+tx0BQCYZDy2BPqdgnK
         OjuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFBZL1mljZjvrTCi+e1jvtKfNQB7/2xCZIWAT3J46OLMVj5Gd8KclftODgyiKflc0RvDqUqDicjaU3gT4=@vger.kernel.org
X-Gm-Message-State: AFuF++kyTo8TVY+dDudzQ1UgCUW6l5AoW6w11ktUtWoKzzeyZzb7E/+8
	YYxbf7VXLFsBXuDY4iX2J9/CHOg8reG7XVWcSB6R1GUDnwlFfOqsZIAyOJUL0N3FGT0=
X-Gm-Gg: AYBFou0Ypbd/vIlVOQou1Y2ER6bxR0AKFShgK6zsJaWYA+EXPLlF+zwGPPitnQuHkv3
	+q6n057k57BnvXQJxhmc9QJFMvdSHBfMBFNpYLSBpYzkoehJ3KioVcNB8TYIgxbcXFtz2jPtY/N
	Ej4vWPG/G4IKsrf7OEwY9yxo+Vi8h3JO6e8pZYStjDdJ8EIFcGBH92NlTY9u1BmYV36pr3p8Gfa
	t911m0IUmZIkzWQ3IPEM/hK7QKE7cnSY0pFUOs9PiuBnVICTEQ4I4ecRqe30TiGp/378Ez1wJ2F
	ychTmIwGXZlOaVw0YA1es1jIW5ISgG1K0asH5t2mXOEaKMVJh3gdFoGMJMyGPbB4SlVQYMLC9pm
	hW2o3sLLtkQOIkNuGPPdxNY97ygGqS7DnZK9MXcV5htHteZdF7uZfm8/N0yXGiOKAKulm2oyiHY
	1LXyAHtzk76WGKMEH6oGj8olhAMZ+aBS4MGhm17DODsQ8tIiarDBcGgTMxr0RpC/oWieEGKDSdw
	ZGwoi5hGUNd30k=
X-Received: by 2002:a05:622a:391:b0:535:942:4e0 with SMTP id d75a77b69052e-53566910e8cmr38409831cf.12.1791306956850;
        Tue, 06 Oct 2026 10:15:56 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.246])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535720ea3bbsm438011cf.13.2026.10.06.10.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 10:15:55 -0700 (PDT)
Message-ID: <f190450a6eeccbb41010002e091662948083166d.1791303049.git.josef@toxicpanda.com>
In-Reply-To: <cover.1791303049.git.josef@toxicpanda.com>
References: <20261001125422.1364260-1-tom.leiming@gmail.com>
	<cover.1791303049.git.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 6 Oct 2026 14:50:15 +0000
Subject: [PATCH 3/4] ublk: give the command back from COMMIT_AND_FETCH on a
 canceling queue
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

COMMIT_AND_FETCH and NEED_GET_DATA publish the server's next command in
io->cmd without a lock. A cancel which runs at the same time can see
the io active and still read the request pointer io->cmd shares its
storage with, or miss the command altogether. QUIESCE_DEV cancels while
the server still commits, and the command published right after its
cancel pass is never completed, which is what leaves the server waiting
for it forever.

Have the issuer decide instead: read ->canceling before publishing, and
on a canceling queue complete the committed request as usual, but give
the new command back with UBLK_IO_RES_ABORT instead of publishing it,
leaving the io canceled the way ublk_cancel_cmd() does. NEED_GET_DATA
sends its request back the way ublk_queue_rq() does on a canceling
queue.

The read and the publish are one RCU read section, so a cancel which
marks the queue and then calls synchronize_rcu() knows every command
published without seeing the mark is in place before it looks, and
every later one comes back from its issuer. That keeps the commit path
free of locks and barriers. ->canceling is read locklessly now, so write
it with WRITE_ONCE().

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/ublk_drv.c | 66 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 61 insertions(+), 5 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index bd7126dcf92f..6717dabf3a23 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -2492,6 +2492,9 @@ static void ublk_partition_scan_work(struct work_struct *work)
  * - there are no concurrent reads of ubq->canceling from the queue_rq
  *   path. This can be done by quiescing the queue, or through other
  *   means.
+ *
+ * ublk_commit_io_cmd() reads ubq->canceling locklessly, so it is written
+ * with WRITE_ONCE().
  */
 static void ublk_set_canceling(struct ublk_device *ub, bool canceling)
 	__must_hold(&ub->cancel_mutex)
@@ -2500,7 +2503,7 @@ static void ublk_set_canceling(struct ublk_device *ub, bool canceling)
 
 	ub->canceling = canceling;
 	for (i = 0; i < ub->dev_info.nr_hw_queues; i++)
-		ublk_get_queue(ub, i)->canceling = canceling;
+		WRITE_ONCE(ublk_get_queue(ub, i)->canceling, canceling);
 }
 
 static bool ublk_check_and_reset_active_ref(struct ublk_device *ub)
@@ -3109,7 +3112,7 @@ static void ublk_queue_reset_io_flags(struct ublk_device *ub,
 	 */
 	mutex_lock(&ub->cancel_mutex);
 	if (!ub->canceling)
-		ubq->canceling = false;
+		WRITE_ONCE(ubq->canceling, false);
 	mutex_unlock(&ub->cancel_mutex);
 	ubq->fail_io = false;
 	ubq->force_abort = false;
@@ -3227,6 +3230,49 @@ ublk_fill_io_cmd(struct ublk_io *io, struct io_uring_cmd *cmd)
 	return req;
 }
 
+/*
+ * Instead of ublk_fill_io_cmd() on a canceling queue: the server's new
+ * command is not published, it goes back with UBLK_IO_RES_ABORT, and the
+ * io is left canceled the way ublk_cancel_cmd() leaves it.  Returns the
+ * request the server owned.
+ */
+static struct request *ublk_cancel_io_cmd(struct ublk_queue *ubq,
+					  struct ublk_io *io)
+{
+	struct request *req = io->req;
+
+	spin_lock(&ubq->cancel_lock);
+	io->flags &= ~(UBLK_IO_FLAG_OWNED_BY_SRV | UBLK_IO_FLAG_NEED_GET_DATA);
+	io->flags |= UBLK_IO_FLAG_CANCELED;
+	spin_unlock(&ubq->cancel_lock);
+
+	return req;
+}
+
+/*
+ * Publish the command a COMMIT_AND_FETCH or NEED_GET_DATA brings, unless
+ * the queue is canceling, see ublk_quiesce_cancel().  The read of
+ * ->canceling and the publish are one RCU read section: a cancel which
+ * marks the queue after the read waits in synchronize_rcu() until the
+ * command is published, and claims it then.  Returns whether the command
+ * goes back to the server instead.
+ */
+static bool ublk_commit_io_cmd(struct ublk_queue *ubq, struct ublk_io *io,
+			       struct io_uring_cmd *cmd, struct request **req)
+{
+	bool canceling;
+
+	rcu_read_lock();
+	canceling = READ_ONCE(ubq->canceling);
+	if (likely(!canceling))
+		*req = ublk_fill_io_cmd(io, cmd);
+	else
+		*req = ublk_cancel_io_cmd(ubq, io);
+	rcu_read_unlock();
+
+	return canceling;
+}
+
 /*
  * Call before ublk_fill_io_cmd() publishes @cmd in io->cmd: a control-path
  * cancel may complete any command found there, and io_uring_cmd_done() only
@@ -3465,6 +3511,7 @@ static int ublk_ch_uring_cmd_local(struct io_uring_cmd *cmd,
 	u64 addr = READ_ONCE(ub_src->addr); /* unioned with zone_append_lba */
 	struct request *req;
 	int ret;
+	bool canceled;
 	bool compl;
 
 	WARN_ON_ONCE(issue_flags & IO_URING_F_UNLOCKED);
@@ -3547,7 +3594,7 @@ static int ublk_ch_uring_cmd_local(struct io_uring_cmd *cmd,
 			goto out;
 		io->res = result;
 		ublk_prep_cancel(cmd, issue_flags, ubq, tag);
-		req = ublk_fill_io_cmd(io, cmd);
+		canceled = ublk_commit_io_cmd(ubq, io, cmd, &req);
 		ublk_apply_io_buf(ub, io, cmd, addr, &auto_buf, &buf_idx);
 		if (buf_idx != UBLK_INVALID_BUF_IDX)
 			io_buffer_unregister(cmd, buf_idx, issue_flags);
@@ -3557,6 +3604,10 @@ static int ublk_ch_uring_cmd_local(struct io_uring_cmd *cmd,
 			req->__sector = addr;
 		if (compl)
 			__ublk_complete_rq(req, io, ublk_dev_need_map_io(ub), NULL);
+		if (unlikely(canceled)) {
+			ret = UBLK_IO_RES_ABORT;
+			goto out_done;
+		}
 		break;
 	}
 	case UBLK_IO_NEED_GET_DATA:
@@ -3566,7 +3617,12 @@ static int ublk_ch_uring_cmd_local(struct io_uring_cmd *cmd,
 		 * request
 		 */
 		ublk_prep_cancel(cmd, issue_flags, ubq, tag);
-		req = ublk_fill_io_cmd(io, cmd);
+		if (unlikely(ublk_commit_io_cmd(ubq, io, cmd, &req))) {
+			/* as ublk_queue_rq() does on a canceling queue */
+			__ublk_abort_rq(ubq, req);
+			ret = UBLK_IO_RES_ABORT;
+			goto out_done;
+		}
 		io->buf.addr = addr;
 		if (likely(ublk_get_data(ubq, io, req))) {
 			__ublk_prep_compl_io_cmd(io, req);
@@ -3765,7 +3821,7 @@ static int ublk_batch_unprep_io(struct ublk_queue *ubq,
 	if (ublk_queue_ready(ubq)) {
 		data->ub->nr_queue_ready--;
 		spin_lock(&ubq->cancel_lock);
-		ubq->canceling = true;
+		WRITE_ONCE(ubq->canceling, true);
 		spin_unlock(&ubq->cancel_lock);
 	}
 	ubq->nr_io_ready--;
-- 
2.55.0

